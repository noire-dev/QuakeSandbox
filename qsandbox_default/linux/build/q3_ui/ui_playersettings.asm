data
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
align 4
LABELV handicap_items
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
address $99
address $100
byte 4 0
code
proc PlayerSettings_SetPlayerModelType 4 4
file "../../../code/q3_ui/ui_playersettings.c"
line 119
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:
;5:
;6:
;7:#include "ui_local.h"
;8:
;9:#define ART_FRAMEL			"menu/art/frame2_l"
;10:#define ART_FRAMER			"menu/art/frame1_r"
;11:#define ART_MODEL0			"menu/art/model_0"
;12:#define ART_MODEL1			"menu/art/model_1"
;13:#define ART_BACK0			"menu/art/back_0"
;14:#define ART_BACK1			"menu/art/back_1"
;15:#define ART_FX_BASE			"menu/art/fx_base"
;16:#define ART_FX_BLUE			"menu/art/fx_blue"
;17:#define ART_FX_CYAN			"menu/art/fx_cyan"
;18:#define ART_FX_GREEN		"menu/art/fx_grn"
;19:#define ART_FX_RED			"menu/art/fx_red"
;20:#define ART_FX_TEAL			"menu/art/fx_teal"
;21:#define ART_FX_WHITE		"menu/art/fx_white"
;22:#define ART_FX_YELLOW		"menu/art/fx_yel"
;23:
;24:#define ID_NAME			10
;25:#define ID_HANDICAP		11
;26:#define ID_EFFECTS		12
;27:#define ID_BACK			13
;28:#define ID_MODEL		14
;29:#define ID_MODELTYPE	15
;30:#define ID_EFFECTS2		16
;31:#define ID_FLASHRED			17
;32:#define ID_FLASHGREEN			18
;33:#define ID_FLASHBLUE			19
;34:#define ID_HEFLASHRED			20
;35:#define ID_HEFLASHGREEN			21
;36:#define ID_HEFLASHBLUE			22
;37:#define ID_TOFLASHRED			23
;38:#define ID_TOFLASHGREEN			24
;39:#define ID_TOFLASHBLUE			25
;40:
;41:#define MAX_NAMELENGTH	32
;42:
;43:#define MENUTEXT_COLUMN 144
;44:
;45:#define TEXT_RESCALE 0.75
;46:
;47:typedef struct {
;48:	menuframework_s		menu;
;49:
;50:	menutext_s			banner;
;51:	menubitmap_s		framel;
;52:	menubitmap_s		framer;
;53:
;54:	menufield_s			name;
;55:	menulist_s			handicap;
;56:	menulist_s			effects;
;57:	menulist_s			effects2;
;58:
;59:	menuslider_s  		flashred;
;60:	menuslider_s  		flashgreen;
;61:	menuslider_s  		flashblue;
;62:	menuslider_s  		heflashred;
;63:	menuslider_s  		heflashgreen;
;64:	menuslider_s  		heflashblue;
;65:	menuslider_s  		toflashred;
;66:	menuslider_s  		toflashgreen;
;67:	menuslider_s  		toflashblue;
;68:	menubitmap_s		back;
;69:	menubitmap_s		model;
;70:	menubitmap_s		item_null;
;71:	menutext_s			modeltype;
;72:
;73:	qhandle_t			fxBasePic;
;74:	qhandle_t			fxPic[7];
;75:	int					current_fx;
;76:	modelAnim_t			player;
;77:
;78:	awardInfo_t			awards;
;79:} playersettings_t;
;80:
;81:
;82:static playersettings_t	s_playersettings;
;83:
;84:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;85:static int uitogamecode[] = {4,6,2,3,1,5,7};
;86:
;87:static const char *handicap_items[] = {
;88:	"None",
;89:	"95",
;90:	"90",
;91:	"85",
;92:	"80",
;93:	"75",
;94:	"70",
;95:	"65",
;96:	"60",
;97:	"55",
;98:	"50",
;99:	"45",
;100:	"40",
;101:	"35",
;102:	"30",
;103:	"25",
;104:	"20",
;105:	"15",
;106:	"10",
;107:	"5",
;108:	0
;109:};
;110:
;111:
;112:
;113:/*
;114:=================
;115:PlayerSettings_SetPlayerModelType
;116:=================
;117:*/
;118:static void PlayerSettings_SetPlayerModelType( void )
;119:{
line 120
;120:	if (UIE_PlayerInfo_IsTeamModel())
ADDRLP4 0
ADDRGP4 UIE_PlayerInfo_IsTeamModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $102
line 121
;121:	{
line 122
;122:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $104
line 123
;123:		s_playersettings.modeltype.string = "Team Model";
ADDRGP4 s_playersettings+3456+88
ADDRGP4 $109
ASGNP4
line 124
;124:		}
LABELV $104
line 125
;125:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $103
line 126
;126:		s_playersettings.modeltype.string = "Командная Модель";
ADDRGP4 s_playersettings+3456+88
ADDRGP4 $115
ASGNP4
line 127
;127:		}
line 128
;128:	}
ADDRGP4 $103
JUMPV
LABELV $102
line 130
;129:	else
;130:	{
line 131
;131:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $116
line 132
;132:		s_playersettings.modeltype.string = "DM Model";
ADDRGP4 s_playersettings+3456+88
ADDRGP4 $121
ASGNP4
line 133
;133:		}
LABELV $116
line 134
;134:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $122
line 135
;135:		s_playersettings.modeltype.string = "Обычная Модель";
ADDRGP4 s_playersettings+3456+88
ADDRGP4 $127
ASGNP4
line 136
;136:		}
LABELV $122
line 137
;137:	}
LABELV $103
line 139
;138:
;139:	PText_Init(&s_playersettings.modeltype);
ADDRGP4 s_playersettings+3456
ARGP4
ADDRGP4 PText_Init
CALLV
pop
line 140
;140:}
LABELV $101
endproc PlayerSettings_SetPlayerModelType 4 4
proc PlayerSettings_ToggleModelType 8 8
line 150
;141:
;142:
;143:
;144:/*
;145:=================
;146:PlayerSettings_ToggleModelType
;147:=================
;148:*/
;149:static void PlayerSettings_ToggleModelType( void )
;150:{
line 153
;151:	qboolean type;
;152:
;153:	if (UIE_PlayerInfo_IsTeamModel()) {
ADDRLP4 4
ADDRGP4 UIE_PlayerInfo_IsTeamModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $130
line 154
;154:		type = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 155
;155:	}
ADDRGP4 $131
JUMPV
LABELV $130
line 156
;156:	else {
line 157
;157:		type = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 158
;158:	}
LABELV $131
line 160
;159:
;160:	UIE_PlayerInfo_DrawTeamModel(&s_playersettings.player, type);
ADDRGP4 s_playersettings+3596
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UIE_PlayerInfo_DrawTeamModel
CALLV
pop
line 161
;161:	PlayerSettings_SetPlayerModelType();
ADDRGP4 PlayerSettings_SetPlayerModelType
CALLV
pop
line 162
;162:}
LABELV $129
endproc PlayerSettings_ToggleModelType 8 8
proc PlayerSettings_DrawName 92 24
line 172
;163:
;164:
;165:
;166:
;167:/*
;168:=================
;169:PlayerSettings_DrawName
;170:=================
;171:*/
;172:static void PlayerSettings_DrawName( void *self ) {
line 183
;173:	menufield_s		*f;
;174:	qboolean		focus;
;175:	int				style;
;176:	char			*txt;
;177:	char			c;
;178:	float			*color;
;179:	int				n;
;180:	int				basex, x, y;
;181:	char			name[32];
;182:
;183:	f = (menufield_s*)self;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
line 184
;184:	basex = f->generic.x;
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 185
;185:	y = f->generic.y;
ADDRLP4 24
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 186
;186:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $135
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $135
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $136
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 188
;187:
;188:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 189
;189:	color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 190
;190:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $137
line 191
;191:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 192
;192:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 193
;193:	}
LABELV $137
line 195
;194:
;195:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $139
line 196
;196:	UI_DrawScaledProportionalString( basex, y, "Name", style, TEXT_RESCALE, color );
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $142
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
CNSTF4 1061158912
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 197
;197:}
LABELV $139
line 198
;198:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $143
line 199
;199:	UI_DrawScaledProportionalString( basex, y, "Имя", style, TEXT_RESCALE, color );
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $146
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
CNSTF4 1061158912
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 200
;200:}
LABELV $143
line 204
;201://	UI_DrawProportionalString( basex, y, "Name", style, color );
;202:
;203:	// draw the actual name
;204:	basex += 64;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 205
;205:	y += PROP_HEIGHT;
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 206
;206:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
line 207
;207:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 12
ADDRGP4 g_color_table+112
ASGNP4
line 208
;208:	x = basex;
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
line 209
;209:	while ( (c = *txt) != 0 ) {
line 210
;210:		if ( !focus && Q_IsColorString( txt ) ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $152
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $152
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $152
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $152
ADDRLP4 88
INDIRI4
CNSTI4 48
LTI4 $152
ADDRLP4 88
INDIRI4
CNSTI4 57
GTI4 $152
line 211
;211:			n = ColorIndex( *(txt+1) );
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 212
;212:			if( n == 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $154
line 213
;213:				n = 7;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 214
;214:			}
LABELV $154
line 215
;215:			color = g_color_table[n];
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ASGNP4
line 216
;216:			txt += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 217
;217:			continue;
ADDRGP4 $150
JUMPV
LABELV $152
line 219
;218:		}
;219:		UI_DrawChar( x, y, c, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 220
;220:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 221
;221:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ASGNI4
line 222
;222:	}
LABELV $150
line 209
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 80
INDIRI1
ASGNI1
ADDRLP4 80
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $149
line 225
;223:
;224:	// draw cursor if we have focus
;225:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $157
line 226
;226:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 84
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $159
line 227
;227:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 228
;228:		} else {
ADDRGP4 $160
JUMPV
LABELV $159
line 229
;229:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 230
;230:		}
LABELV $160
line 232
;231:
;232:		style &= ~UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 233
;233:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 235
;234:
;235:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 236
;236:	}
LABELV $157
line 239
;237:
;238:	// draw at bottom also using proportional font
;239:	Q_strncpyz( name, f->field.buffer, sizeof(name) );
ADDRLP4 40
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 100
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 240
;240:	Q_CleanStr( name );
ADDRLP4 40
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 241
;241:	UI_DrawProportionalString( 320, 440, name, UI_CENTER|UI_BIGFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 242
;242:}
LABELV $133
endproc PlayerSettings_DrawName 92 24
proc PlayerSettings_DrawEffects 48 24
line 277
;243:
;244:
;245:/*
;246:=================
;247:PlayerSettings_DrawHandicap
;248:=================
;249:*/
;250:/*static void PlayerSettings_DrawHandicap( void *self ) {
;251:	menulist_s		*item;
;252:	qboolean		focus;
;253:	int				style;
;254:	float			*color;
;255:
;256:	item = (menulist_s *)self;
;257:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
;258:
;259:	style = UI_LEFT|UI_SMALLFONT;
;260:	color = text_color_normal;
;261:	if( focus ) {
;262:		style |= UI_PULSE;
;263:		color = text_color_highlight;
;264:	}
;265:
;266:	UI_DrawScaledProportionalString( item->generic.x, item->generic.y, "Handicap", style, TEXT_RESCALE, color );
;267://	UI_DrawProportionalString( item->generic.x, item->generic.y, "Handicap", style, color );
;268:	UI_DrawProportionalString( item->generic.x + 64, item->generic.y + PROP_HEIGHT, handicap_items[item->curvalue], style, color );
;269:}*/
;270:
;271:
;272:/*
;273:=================
;274:PlayerSettings_DrawEffects
;275:=================
;276:*/
;277:static void PlayerSettings_DrawEffects( void *self ) {
line 285
;278:	menulist_s		*item;
;279:	qboolean		focus;
;280:	int				style;
;281:	float			*color;
;282:	float			scale;
;283:	int				textlen;
;284:
;285:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 286
;286:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
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
NEI4 $164
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $164
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $165
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 288
;287:
;288:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 289
;289:	color = text_color_normal;
ADDRLP4 16
ADDRGP4 text_color_normal
ASGNP4
line 290
;290:	if( focus ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $166
line 291
;291:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 292
;292:		color = text_color_highlight;
ADDRLP4 16
ADDRGP4 text_color_highlight
ASGNP4
line 293
;293:	}
LABELV $166
line 296
;294:
;295://	UI_DrawProportionalString( item->generic.x, item->generic.y, "Effects", style, color );
;296:	scale = TEXT_RESCALE;
ADDRLP4 8
CNSTF4 1061158912
ASGNF4
line 297
;297:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $168
line 298
;298:	if (item->generic.id == ID_EFFECTS) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 12
NEI4 $171
line 299
;299:		UI_DrawScaledProportionalString( item->generic.x, item->generic.y, "Rail core:", style, scale, color );
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
ADDRGP4 $173
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 300
;300:	} else {
ADDRGP4 $172
JUMPV
LABELV $171
line 301
;301:		UI_DrawScaledProportionalString( item->generic.x, item->generic.y, "Rail ring:", style, scale, color );
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
ADDRGP4 $174
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 302
;302:	}
LABELV $172
line 303
;303:	}
LABELV $168
line 304
;304:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $175
line 305
;305:	if (item->generic.id == ID_EFFECTS) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 12
NEI4 $178
line 306
;306:		UI_DrawScaledProportionalString( item->generic.x, item->generic.y, "Рэйл луч:", style, scale, color );
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
ADDRGP4 $180
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 307
;307:	} else {
ADDRGP4 $179
JUMPV
LABELV $178
line 308
;308:		UI_DrawScaledProportionalString( item->generic.x, item->generic.y, "Рейл кольца:", style, scale, color );
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
ADDRGP4 $181
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 309
;309:	}
LABELV $179
line 310
;310:	}
LABELV $175
line 311
;311:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $182
line 312
;312:	textlen = UI_ProportionalStringWidth("Rail core:") * UI_ProportionalSizeScale(style, 0) * scale + 14;
ADDRGP4 $173
ARGP4
ADDRLP4 32
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 36
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
MULF4
CNSTF4 1096810496
ADDF4
CVFI4 4
ASGNI4
line 313
;313:}
LABELV $182
line 314
;314:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $185
line 315
;315:	textlen = UI_ProportionalStringWidth("Рэйл луч:") * UI_ProportionalSizeScale(style, 0) * scale + 14;
ADDRGP4 $180
ARGP4
ADDRLP4 32
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 36
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
MULF4
CNSTF4 1096810496
ADDF4
CVFI4 4
ASGNI4
line 316
;316:}
LABELV $185
line 318
;317:
;318:	UI_DrawHandlePic( item->generic.x + textlen, item->generic.y + 4, 128, 8, s_playersettings.fxBasePic );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_playersettings+3560
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 319
;319:	UI_DrawHandlePic( item->generic.x + textlen + item->curvalue * 16 + 8, item->generic.y + 2, 16, 12, s_playersettings.fxPic[item->curvalue] );
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LSHI4
ADDRGP4 s_playersettings+3564
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 320
;320:}
LABELV $162
endproc PlayerSettings_DrawEffects 48 24
proc PlayerSettings_DrawPlayer 0 4
line 328
;321:
;322:
;323:/*
;324:=================
;325:PlayerSettings_DrawPlayer
;326:=================
;327:*/
;328:static void PlayerSettings_DrawPlayer( void *self ) {
line 329
;329:	UIE_PlayerInfo_AnimateModel(&s_playersettings.player);
ADDRGP4 s_playersettings+3596
ARGP4
ADDRGP4 UIE_PlayerInfo_AnimateModel
CALLV
pop
line 330
;330:}
LABELV $190
endproc PlayerSettings_DrawPlayer 0 4
proc PlayerSettings_MenuDraw 0 4
line 339
;331:
;332:
;333:/*
;334:=================
;335:PlayerSettings_DrawMenu
;336:=================
;337:*/
;338:static void PlayerSettings_MenuDraw(void)
;339:{
line 340
;340:	UIE_AwardIcons_DrawValues(&s_playersettings.awards);
ADDRGP4 s_playersettings+5860
ARGP4
ADDRGP4 UIE_AwardIcons_DrawValues
CALLV
pop
line 342
;341:
;342:	if (uis.firstdraw)
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $194
line 343
;343:		PlayerSettings_SetPlayerModelType();
ADDRGP4 PlayerSettings_SetPlayerModelType
CALLV
pop
LABELV $194
line 346
;344:
;345:	// standard menu drawing
;346:	Menu_Draw( &s_playersettings.menu );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 347
;347:}
LABELV $192
endproc PlayerSettings_MenuDraw 0 4
proc PlayerSettings_SaveChanges 0 8
line 355
;348:
;349:
;350:/*
;351:=================
;352:PlayerSettings_SaveChanges
;353:=================
;354:*/
;355:static void PlayerSettings_SaveChanges( void ) {
line 357
;356:	// name
;357:	trap_Cvar_Set( "name", s_playersettings.name.field.buffer );
ADDRGP4 $198
ARGP4
ADDRGP4 s_playersettings+1412+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 363
;358:
;359:	/*// handicap
;360:	trap_Cvar_SetValue( "handicap", 100 - s_playersettings.handicap.curvalue * 5 );*/
;361:
;362:	// effects color
;363:	trap_Cvar_SetValue( "color1", uitogamecode[s_playersettings.effects.curvalue] );
ADDRGP4 $202
ARGP4
ADDRGP4 s_playersettings+1908+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 364
;364:	trap_Cvar_SetValue( "color2", uitogamecode[s_playersettings.effects2.curvalue] );
ADDRGP4 $205
ARGP4
ADDRGP4 s_playersettings+2040+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 365
;365:}
LABELV $197
endproc PlayerSettings_SaveChanges 0 8
proc PlayerSettings_MenuKey 8 8
line 373
;366:
;367:
;368:/*
;369:=================
;370:PlayerSettings_MenuKey
;371:=================
;372:*/
;373:static sfxHandle_t PlayerSettings_MenuKey( int key ) {
line 374
;374:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $211
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $209
LABELV $211
line 375
;375:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 376
;376:	}
LABELV $209
line 377
;377:	return Menu_DefaultKey( &s_playersettings.menu, key );
ADDRGP4 s_playersettings
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $208
endproc PlayerSettings_MenuKey 8 8
proc PlayerSettings_SetMenuItems 76 12
line 386
;378:}
;379:
;380:
;381:/*
;382:=================
;383:PlayerSettings_SetMenuItems
;384:=================
;385:*/
;386:static void PlayerSettings_SetMenuItems( void ) {
line 392
;387:	vec3_t	viewangles;
;388:	int		c;
;389:	int		h;
;390:
;391:	// name
;392:	Q_strncpyz( s_playersettings.name.field.buffer, UI_Cvar_VariableString("name"), sizeof(s_playersettings.name.field.buffer) );
ADDRGP4 $198
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+1412+88+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 395
;393:
;394:	// effects color
;395:	c = trap_Cvar_VariableValue( "color1" ) - 1;
ADDRGP4 $202
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 396
;396:	if( c < 0 || c > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $221
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $219
LABELV $221
line 397
;397:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 398
;398:	}
LABELV $219
line 399
;399:	s_playersettings.effects.curvalue = gamecodetoui[c];
ADDRGP4 s_playersettings+1908+92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui
ADDP4
INDIRI4
ASGNI4
line 402
;400:
;401:	// effects color 2
;402:	c = trap_Cvar_VariableValue( "color2" ) - 1;
ADDRGP4 $205
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 403
;403:	if( c < 0 || c > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $226
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $224
LABELV $226
line 404
;404:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 405
;405:	}
LABELV $224
line 406
;406:	s_playersettings.effects2.curvalue = gamecodetoui[c];
ADDRGP4 s_playersettings+2040+92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui
ADDP4
INDIRI4
ASGNI4
line 408
;407:
;408:s_playersettings.heflashred.curvalue  = trap_Cvar_VariableValue( "cg_helightred");
ADDRGP4 $231
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2484+96
ADDRLP4 40
INDIRF4
ASGNF4
line 410
;409:	
;410:	s_playersettings.heflashgreen.curvalue  = trap_Cvar_VariableValue( "cg_helightgreen");
ADDRGP4 $234
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2588+96
ADDRLP4 44
INDIRF4
ASGNF4
line 412
;411:	
;412:	s_playersettings.heflashblue.curvalue  = trap_Cvar_VariableValue( "cg_helightblue");
ADDRGP4 $237
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2692+96
ADDRLP4 48
INDIRF4
ASGNF4
line 414
;413:
;414:	s_playersettings.toflashred.curvalue  = trap_Cvar_VariableValue( "cg_tolightred");
ADDRGP4 $240
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2796+96
ADDRLP4 52
INDIRF4
ASGNF4
line 416
;415:	
;416:	s_playersettings.toflashgreen.curvalue  = trap_Cvar_VariableValue( "cg_tolightgreen");
ADDRGP4 $243
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2900+96
ADDRLP4 56
INDIRF4
ASGNF4
line 418
;417:	
;418:	s_playersettings.toflashblue.curvalue  = trap_Cvar_VariableValue( "cg_tolightblue");
ADDRGP4 $246
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+3004+96
ADDRLP4 60
INDIRF4
ASGNF4
line 420
;419:
;420:	s_playersettings.flashred.curvalue  = trap_Cvar_VariableValue( "cg_plightred");
ADDRGP4 $249
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2172+96
ADDRLP4 64
INDIRF4
ASGNF4
line 422
;421:	
;422:	s_playersettings.flashgreen.curvalue  = trap_Cvar_VariableValue( "cg_plightgreen");
ADDRGP4 $252
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2276+96
ADDRLP4 68
INDIRF4
ASGNF4
line 424
;423:	
;424:	s_playersettings.flashblue.curvalue  = trap_Cvar_VariableValue( "cg_plightblue");
ADDRGP4 $255
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_playersettings+2380+96
ADDRLP4 72
INDIRF4
ASGNF4
line 427
;425:
;426:	// model/skin
;427:	UIE_PlayerInfo_InitModel(&s_playersettings.player);
ADDRGP4 s_playersettings+3596
ARGP4
ADDRGP4 UIE_PlayerInfo_InitModel
CALLV
pop
line 432
;428:
;429:	/*// handicap
;430:	h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
;431:	s_playersettings.handicap.curvalue = 20 - h / 5;*/
;432:}
LABELV $212
endproc PlayerSettings_SetMenuItems 76 12
proc PlayerSettings_AwardEvent 4 8
line 440
;433:
;434:
;435:/*
;436:=================
;437:PlayerSettings_AwardEvent
;438:=================
;439:*/
;440:static void PlayerSettings_AwardEvent( void* ptr, int notification ) {
line 443
;441:	int		n;
;442:
;443:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $258
line 444
;444:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 447
;445:	}
;446:
;447:	UIE_AwardIcons_PlaySound(&s_playersettings.awards, (menucommon_s*)ptr);
ADDRGP4 s_playersettings+5860
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UIE_AwardIcons_PlaySound
CALLV
pop
line 448
;448:}
LABELV $257
endproc PlayerSettings_AwardEvent 4 8
proc PlayerSettings_MenuEvent 8 8
line 457
;449:
;450:
;451:
;452:/*
;453:=================
;454:PlayerSettings_MenuEvent
;455:=================
;456:*/
;457:static void PlayerSettings_MenuEvent( void* ptr, int event ) {
line 458
;458:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $262
line 459
;459:		return;
ADDRGP4 $261
JUMPV
LABELV $262
line 462
;460:	}
;461:
;462:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $264
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $297-52
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $297
address $269
address $267
address $268
address $264
address $270
address $273
address $276
address $288
address $291
address $294
address $279
address $282
address $285
code
LABELV $267
line 468
;463:	/*case ID_HANDICAP:
;464:		trap_Cvar_Set( "handicap", va( "%i", 100 - 25 * s_playersettings.handicap.curvalue ) );
;465:		break;*/
;466:
;467:	case ID_MODEL:
;468:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 469
;469:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 470
;470:		break;
ADDRGP4 $265
JUMPV
LABELV $268
line 473
;471:
;472:	case ID_MODELTYPE:
;473:		PlayerSettings_ToggleModelType();
ADDRGP4 PlayerSettings_ToggleModelType
CALLV
pop
line 474
;474:		break;
ADDRGP4 $265
JUMPV
LABELV $269
line 477
;475:
;476:	case ID_BACK:
;477:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 478
;478:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 479
;479:		break;
ADDRGP4 $265
JUMPV
LABELV $270
line 481
;480:	case ID_FLASHRED:
;481:		trap_Cvar_SetValue( "cg_plightred", s_playersettings.flashred.curvalue);
ADDRGP4 $249
ARGP4
ADDRGP4 s_playersettings+2172+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 482
;482:		break;
ADDRGP4 $265
JUMPV
LABELV $273
line 485
;483:		
;484:	case ID_FLASHGREEN:
;485:		trap_Cvar_SetValue( "cg_plightgreen", s_playersettings.flashgreen.curvalue);
ADDRGP4 $252
ARGP4
ADDRGP4 s_playersettings+2276+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 486
;486:		break;
ADDRGP4 $265
JUMPV
LABELV $276
line 489
;487:		
;488:	case ID_FLASHBLUE:
;489:		trap_Cvar_SetValue( "cg_plightblue", s_playersettings.flashblue.curvalue);
ADDRGP4 $255
ARGP4
ADDRGP4 s_playersettings+2380+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 490
;490:		break;
ADDRGP4 $265
JUMPV
LABELV $279
line 493
;491:		
;492:	case ID_TOFLASHRED:
;493:		trap_Cvar_SetValue( "cg_tolightred", s_playersettings.toflashred.curvalue);
ADDRGP4 $240
ARGP4
ADDRGP4 s_playersettings+2796+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 494
;494:		break;
ADDRGP4 $265
JUMPV
LABELV $282
line 497
;495:		
;496:	case ID_TOFLASHGREEN:
;497:		trap_Cvar_SetValue( "cg_tolightgreen", s_playersettings.toflashgreen.curvalue);
ADDRGP4 $243
ARGP4
ADDRGP4 s_playersettings+2900+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 498
;498:		break;
ADDRGP4 $265
JUMPV
LABELV $285
line 501
;499:		
;500:	case ID_TOFLASHBLUE:
;501:		trap_Cvar_SetValue( "cg_tolightblue", s_playersettings.toflashblue.curvalue);
ADDRGP4 $246
ARGP4
ADDRGP4 s_playersettings+3004+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 502
;502:		break;
ADDRGP4 $265
JUMPV
LABELV $288
line 505
;503:		
;504:	case ID_HEFLASHRED:
;505:		trap_Cvar_SetValue( "cg_helightred", s_playersettings.heflashred.curvalue);
ADDRGP4 $231
ARGP4
ADDRGP4 s_playersettings+2484+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 506
;506:		break;
ADDRGP4 $265
JUMPV
LABELV $291
line 509
;507:		
;508:	case ID_HEFLASHGREEN:
;509:		trap_Cvar_SetValue( "cg_helightgreen", s_playersettings.heflashgreen.curvalue);
ADDRGP4 $234
ARGP4
ADDRGP4 s_playersettings+2588+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 510
;510:		break;
ADDRGP4 $265
JUMPV
LABELV $294
line 513
;511:		
;512:	case ID_HEFLASHBLUE:
;513:		trap_Cvar_SetValue( "cg_helightblue", s_playersettings.heflashblue.curvalue);
ADDRGP4 $237
ARGP4
ADDRGP4 s_playersettings+2692+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 514
;514:		break;
LABELV $264
LABELV $265
line 516
;515:	}
;516:}
LABELV $261
endproc PlayerSettings_MenuEvent 8 8
proc PlayerSettings_MenuInit 12 12
line 524
;517:
;518:
;519:/*
;520:=================
;521:PlayerSettings_MenuInit
;522:=================
;523:*/
;524:static void PlayerSettings_MenuInit( void ) {
line 528
;525:	int		y;
;526:	float 	sizeScale;
;527:
;528:	memset(&s_playersettings,0,sizeof(playersettings_t));
ADDRGP4 s_playersettings
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6620
ARGI4
ADDRGP4 memset
CALLP4
pop
line 530
;529:
;530:	s_playersettings.menu.fullscreen = qtrue;
ADDRGP4 s_playersettings+1052
CNSTI4 1
ASGNI4
line 531
;531:	s_playersettings.menu.wrapAround = qtrue;
ADDRGP4 s_playersettings+1044
CNSTI4 1
ASGNI4
line 532
;532:	s_playersettings.menu.native 	   = qfalse;
ADDRGP4 s_playersettings+1056
CNSTI4 0
ASGNI4
line 533
;533:	s_playersettings.menu.draw = PlayerSettings_MenuDraw;
ADDRGP4 s_playersettings+1036
ADDRGP4 PlayerSettings_MenuDraw
ASGNP4
line 535
;534:
;535:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 537
;536:
;537:	s_playersettings.menu.key        = PlayerSettings_MenuKey;
ADDRGP4 s_playersettings+1040
ADDRGP4 PlayerSettings_MenuKey
ASGNP4
line 539
;538:
;539:	sizeScale = UI_ProportionalSizeScale( UI_SMALLFONT, 0 );
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 8
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 541
;540:
;541:	s_playersettings.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playersettings+1076
CNSTI4 10
ASGNI4
line 542
;542:	s_playersettings.banner.generic.x     = 320;
ADDRGP4 s_playersettings+1076+28
CNSTI4 320
ASGNI4
line 543
;543:	s_playersettings.banner.generic.y     = 16;
ADDRGP4 s_playersettings+1076+32
CNSTI4 16
ASGNI4
line 544
;544:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $310
line 545
;545:	s_playersettings.banner.string        = "PLAYER SETTINGS";
ADDRGP4 s_playersettings+1076+88
ADDRGP4 $315
ASGNP4
line 546
;546:	}
LABELV $310
line 547
;547:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $316
line 548
;548:	s_playersettings.banner.string        = "НАСТРОЙКИ ИГРОКА";
ADDRGP4 s_playersettings+1076+88
ADDRGP4 $321
ASGNP4
line 549
;549:	}
LABELV $316
line 550
;550:	s_playersettings.banner.color         = color_white;
ADDRGP4 s_playersettings+1076+100
ADDRGP4 color_white
ASGNP4
line 551
;551:	s_playersettings.banner.style         = UI_CENTER;
ADDRGP4 s_playersettings+1076+92
CNSTI4 1
ASGNI4
line 553
;552:
;553:	s_playersettings.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+1180
CNSTI4 6
ASGNI4
line 554
;554:	s_playersettings.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_playersettings+1180+4
ADDRGP4 $329
ASGNP4
line 555
;555:	s_playersettings.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+1180+72
CNSTU4 16388
ASGNU4
line 556
;556:	s_playersettings.framel.generic.x     = 0;
ADDRGP4 s_playersettings+1180+28
CNSTI4 0
ASGNI4
line 557
;557:	s_playersettings.framel.generic.y     = 78;
ADDRGP4 s_playersettings+1180+32
CNSTI4 78
ASGNI4
line 558
;558:	s_playersettings.framel.width         = 256;
ADDRGP4 s_playersettings+1180+104
CNSTI4 256
ASGNI4
line 559
;559:	s_playersettings.framel.height        = 329;
ADDRGP4 s_playersettings+1180+108
CNSTI4 329
ASGNI4
line 561
;560:
;561:	s_playersettings.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+1296
CNSTI4 6
ASGNI4
line 562
;562:	s_playersettings.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_playersettings+1296+4
ADDRGP4 $343
ASGNP4
line 563
;563:	s_playersettings.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+1296+72
CNSTU4 16388
ASGNU4
line 564
;564:	s_playersettings.framer.generic.x     = 376;
ADDRGP4 s_playersettings+1296+28
CNSTI4 376
ASGNI4
line 565
;565:	s_playersettings.framer.generic.y     = 76;
ADDRGP4 s_playersettings+1296+32
CNSTI4 76
ASGNI4
line 566
;566:	s_playersettings.framer.width         = 256;
ADDRGP4 s_playersettings+1296+104
CNSTI4 256
ASGNI4
line 567
;567:	s_playersettings.framer.height        = 334;
ADDRGP4 s_playersettings+1296+108
CNSTI4 334
ASGNI4
line 569
;568:
;569:	y = 50;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 570
;570:	s_playersettings.name.generic.type			= MTYPE_FIELD;
ADDRGP4 s_playersettings+1412
CNSTI4 4
ASGNI4
line 571
;571:	s_playersettings.name.generic.flags			= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1412+72
CNSTU4 32768
ASGNU4
line 572
;572:	s_playersettings.name.generic.ownerdraw		= PlayerSettings_DrawName;
ADDRGP4 s_playersettings+1412+84
ADDRGP4 PlayerSettings_DrawName
ASGNP4
line 573
;573:	s_playersettings.name.field.widthInChars	= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+1412+88+8
CNSTI4 32
ASGNI4
line 574
;574:	s_playersettings.name.field.maxchars		= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+1412+88+268
CNSTI4 32
ASGNI4
line 575
;575:	s_playersettings.name.generic.x				= MENUTEXT_COLUMN;
ADDRGP4 s_playersettings+1412+28
CNSTI4 144
ASGNI4
line 576
;576:	s_playersettings.name.generic.y				= y;
ADDRGP4 s_playersettings+1412+32
ADDRLP4 0
INDIRI4
ASGNI4
line 577
;577:	s_playersettings.name.generic.left			= MENUTEXT_COLUMN - 8;
ADDRGP4 s_playersettings+1412+44
CNSTI4 136
ASGNI4
line 578
;578:	s_playersettings.name.generic.top			= y - 8;
ADDRGP4 s_playersettings+1412+48
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 579
;579:	s_playersettings.name.generic.right			= MENUTEXT_COLUMN + 250;
ADDRGP4 s_playersettings+1412+52
CNSTI4 394
ASGNI4
line 580
;580:	s_playersettings.name.generic.bottom		= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+1412+56
ADDRLP4 0
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 609
;581:
;582:	/*y += 5 * PROP_HEIGHT / 2;
;583:	s_playersettings.handicap.generic.type		= MTYPE_SPINCONTROL;
;584:	s_playersettings.handicap.generic.flags		= QMF_NODEFAULTINIT;
;585:	s_playersettings.handicap.generic.id		= ID_HANDICAP;
;586:	s_playersettings.handicap.generic.ownerdraw	= PlayerSettings_DrawHandicap;
;587:	s_playersettings.handicap.generic.x			= MENUTEXT_COLUMN;
;588:	s_playersettings.handicap.generic.y			= y;
;589:	s_playersettings.handicap.generic.left		= MENUTEXT_COLUMN - 8;
;590:	s_playersettings.handicap.generic.top		= y - 8;
;591:	s_playersettings.handicap.generic.right		= MENUTEXT_COLUMN + 250;
;592:	s_playersettings.handicap.generic.bottom	= y + 2 * PROP_HEIGHT;
;593:	s_playersettings.handicap.numitems			= 20;*/
;594:
;595:/*	y += 5 * PROP_HEIGHT / 2;
;596:	s_playersettings.effects.generic.type		= MTYPE_SPINCONTROL;
;597:	s_playersettings.effects.generic.flags		= QMF_NODEFAULTINIT;
;598:	s_playersettings.effects.generic.id			= ID_EFFECTS;
;599:	s_playersettings.effects.generic.ownerdraw	= PlayerSettings_DrawEffects;
;600:	s_playersettings.effects.generic.x			= MENUTEXT_COLUMN;
;601:	s_playersettings.effects.generic.y			= y;
;602:	s_playersettings.effects.generic.left		= MENUTEXT_COLUMN - 8;
;603:	s_playersettings.effects.generic.top		= y - 8;
;604:	s_playersettings.effects.generic.right		= MENUTEXT_COLUMN + 250;
;605:	s_playersettings.effects.generic.bottom		= y + 2* PROP_HEIGHT;
;606:	s_playersettings.effects.numitems			= 7;
;607:*/
;608:
;609:	y += 5 * PROP_HEIGHT / 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 5
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 610
;610:	s_playersettings.effects.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1908
CNSTI4 3
ASGNI4
line 611
;611:	s_playersettings.effects.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1908+72
CNSTU4 32768
ASGNU4
line 612
;612:	s_playersettings.effects.generic.id			= ID_EFFECTS;
ADDRGP4 s_playersettings+1908+24
CNSTI4 12
ASGNI4
line 613
;613:	s_playersettings.effects.generic.ownerdraw	= PlayerSettings_DrawEffects;
ADDRGP4 s_playersettings+1908+84
ADDRGP4 PlayerSettings_DrawEffects
ASGNP4
line 614
;614:	s_playersettings.effects.generic.x			= MENUTEXT_COLUMN;
ADDRGP4 s_playersettings+1908+28
CNSTI4 144
ASGNI4
line 615
;615:	s_playersettings.effects.generic.y			= y;
ADDRGP4 s_playersettings+1908+32
ADDRLP4 0
INDIRI4
ASGNI4
line 616
;616:	s_playersettings.effects.generic.left		= MENUTEXT_COLUMN - 8;
ADDRGP4 s_playersettings+1908+44
CNSTI4 136
ASGNI4
line 617
;617:	s_playersettings.effects.generic.top		= y - 4;
ADDRGP4 s_playersettings+1908+48
ADDRLP4 0
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 618
;618:	s_playersettings.effects.generic.right		= MENUTEXT_COLUMN + 250;
ADDRGP4 s_playersettings+1908+52
CNSTI4 394
ASGNI4
line 619
;619:	s_playersettings.effects.generic.bottom		= y + PROP_HEIGHT;
ADDRGP4 s_playersettings+1908+56
ADDRLP4 0
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 620
;620:	s_playersettings.effects.numitems			= 7;
ADDRGP4 s_playersettings+1908+96
CNSTI4 7
ASGNI4
line 622
;621:
;622:	y += 3 * PROP_HEIGHT/2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 3
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 623
;623:	s_playersettings.effects2.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+2040
CNSTI4 3
ASGNI4
line 624
;624:	s_playersettings.effects2.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+2040+72
CNSTU4 32768
ASGNU4
line 625
;625:	s_playersettings.effects2.generic.id			= ID_EFFECTS2;
ADDRGP4 s_playersettings+2040+24
CNSTI4 16
ASGNI4
line 626
;626:	s_playersettings.effects2.generic.ownerdraw	= PlayerSettings_DrawEffects;
ADDRGP4 s_playersettings+2040+84
ADDRGP4 PlayerSettings_DrawEffects
ASGNP4
line 627
;627:	s_playersettings.effects2.generic.x			= MENUTEXT_COLUMN;
ADDRGP4 s_playersettings+2040+28
CNSTI4 144
ASGNI4
line 628
;628:	s_playersettings.effects2.generic.y			= y;
ADDRGP4 s_playersettings+2040+32
ADDRLP4 0
INDIRI4
ASGNI4
line 629
;629:	s_playersettings.effects2.generic.left		= MENUTEXT_COLUMN - 8;
ADDRGP4 s_playersettings+2040+44
CNSTI4 136
ASGNI4
line 630
;630:	s_playersettings.effects2.generic.top		= y - 4;
ADDRGP4 s_playersettings+2040+48
ADDRLP4 0
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 631
;631:	s_playersettings.effects2.generic.right		= MENUTEXT_COLUMN + 250;
ADDRGP4 s_playersettings+2040+52
CNSTI4 394
ASGNI4
line 632
;632:	s_playersettings.effects2.generic.bottom		= y + PROP_HEIGHT;
ADDRGP4 s_playersettings+2040+56
ADDRLP4 0
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 633
;633:	s_playersettings.effects2.numitems			= 7;
ADDRGP4 s_playersettings+2040+96
CNSTI4 7
ASGNI4
line 636
;634:
;635:
;636:	s_playersettings.model.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+3224
CNSTI4 6
ASGNI4
line 637
;637:	s_playersettings.model.generic.name			= ART_MODEL0;
ADDRGP4 s_playersettings+3224+4
ADDRGP4 $427
ASGNP4
line 638
;638:	s_playersettings.model.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+3224+72
CNSTU4 272
ASGNU4
line 639
;639:	s_playersettings.model.generic.id			= ID_MODEL;
ADDRGP4 s_playersettings+3224+24
CNSTI4 14
ASGNI4
line 640
;640:	s_playersettings.model.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+3224+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 641
;641:	s_playersettings.model.generic.x			= 640 + uis.wideoffset;
ADDRGP4 s_playersettings+3224+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 642
;642:	s_playersettings.model.generic.y			= 480-64;
ADDRGP4 s_playersettings+3224+32
CNSTI4 416
ASGNI4
line 643
;643:	s_playersettings.model.width				= 128;
ADDRGP4 s_playersettings+3224+104
CNSTI4 128
ASGNI4
line 644
;644:	s_playersettings.model.height				= 64;
ADDRGP4 s_playersettings+3224+108
CNSTI4 64
ASGNI4
line 645
;645:	s_playersettings.model.focuspic				= ART_MODEL1;
ADDRGP4 s_playersettings+3224+88
ADDRGP4 $445
ASGNP4
line 647
;646:
;647:	s_playersettings.player.bitmap.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+3596+1524
CNSTI4 6
ASGNI4
line 648
;648:	s_playersettings.player.bitmap.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playersettings+3596+1524+72
CNSTU4 16384
ASGNU4
line 649
;649:	s_playersettings.player.bitmap.generic.ownerdraw	= PlayerSettings_DrawPlayer;
ADDRGP4 s_playersettings+3596+1524+84
ADDRGP4 PlayerSettings_DrawPlayer
ASGNP4
line 650
;650:	s_playersettings.player.bitmap.generic.x			= PLAYERMODEL_X;
ADDRGP4 s_playersettings+3596+1524+28
CNSTI4 360
ASGNI4
line 651
;651:	s_playersettings.player.bitmap.generic.y			= PLAYERMODEL_Y;
ADDRGP4 s_playersettings+3596+1524+32
CNSTI4 -65
ASGNI4
line 652
;652:	s_playersettings.player.bitmap.width				= PLAYERMODEL_WIDTH;
ADDRGP4 s_playersettings+3596+1524+104
CNSTI4 320
ASGNI4
line 653
;653:	s_playersettings.player.bitmap.height				= PLAYERMODEL_HEIGHT;
ADDRGP4 s_playersettings+3596+1524+108
CNSTI4 560
ASGNI4
line 655
;654:
;655:y = 170;
ADDRLP4 0
CNSTI4 170
ASGNI4
line 657
;656://    y += BIGCHAR_HEIGHT+2;
;657:    s_playersettings.heflashred.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2484
CNSTI4 1
ASGNI4
line 658
;658:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $467
line 659
;659:	s_playersettings.heflashred.generic.name		= "^1Head:";
ADDRGP4 s_playersettings+2484+4
ADDRGP4 $472
ASGNP4
line 660
;660:	}
LABELV $467
line 661
;661:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $473
line 662
;662:	s_playersettings.heflashred.generic.name		= "^1Голова:";
ADDRGP4 s_playersettings+2484+4
ADDRGP4 $478
ASGNP4
line 663
;663:	}
LABELV $473
line 664
;664:	s_playersettings.heflashred.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2484+72
CNSTU4 258
ASGNU4
line 665
;665:	s_playersettings.heflashred.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2484+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 666
;666:	s_playersettings.heflashred.generic.id		= ID_HEFLASHRED;
ADDRGP4 s_playersettings+2484+24
CNSTI4 20
ASGNI4
line 667
;667:	s_playersettings.heflashred.generic.x			= 220;
ADDRGP4 s_playersettings+2484+28
CNSTI4 220
ASGNI4
line 668
;668:	s_playersettings.heflashred.generic.y			= y;
ADDRGP4 s_playersettings+2484+32
ADDRLP4 0
INDIRI4
ASGNI4
line 669
;669:	s_playersettings.heflashred.minvalue			= 0.0f;
ADDRGP4 s_playersettings+2484+88
CNSTF4 0
ASGNF4
line 670
;670:	s_playersettings.heflashred.maxvalue			= 255;
ADDRGP4 s_playersettings+2484+92
CNSTF4 1132396544
ASGNF4
line 672
;671:
;672:        y += BIGCHAR_HEIGHT+5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 5
ADDI4
ADDI4
ASGNI4
line 673
;673:    s_playersettings.heflashgreen.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2588
CNSTI4 1
ASGNI4
line 674
;674:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $495
line 675
;675:	s_playersettings.heflashgreen.generic.name		= "^2Head:";
ADDRGP4 s_playersettings+2588+4
ADDRGP4 $500
ASGNP4
line 676
;676:	}
LABELV $495
line 677
;677:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $501
line 678
;678:	s_playersettings.heflashgreen.generic.name		= "^2Голова:";
ADDRGP4 s_playersettings+2588+4
ADDRGP4 $506
ASGNP4
line 679
;679:	}
LABELV $501
line 680
;680:	s_playersettings.heflashgreen.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2588+72
CNSTU4 258
ASGNU4
line 681
;681:	s_playersettings.heflashgreen.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2588+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 682
;682:	s_playersettings.heflashgreen.generic.id			= ID_HEFLASHGREEN;
ADDRGP4 s_playersettings+2588+24
CNSTI4 21
ASGNI4
line 683
;683:	s_playersettings.heflashgreen.generic.x			= 220;
ADDRGP4 s_playersettings+2588+28
CNSTI4 220
ASGNI4
line 684
;684:	s_playersettings.heflashgreen.generic.y			= y;
ADDRGP4 s_playersettings+2588+32
ADDRLP4 0
INDIRI4
ASGNI4
line 685
;685:	s_playersettings.heflashgreen.minvalue			= 0.0f;
ADDRGP4 s_playersettings+2588+88
CNSTF4 0
ASGNF4
line 686
;686:	s_playersettings.heflashgreen.maxvalue			= 255;
ADDRGP4 s_playersettings+2588+92
CNSTF4 1132396544
ASGNF4
line 688
;687:
;688:        y += BIGCHAR_HEIGHT+5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 5
ADDI4
ADDI4
ASGNI4
line 689
;689:    s_playersettings.heflashblue.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2692
CNSTI4 1
ASGNI4
line 690
;690:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $523
line 691
;691:	s_playersettings.heflashblue.generic.name		= "^4Head:";
ADDRGP4 s_playersettings+2692+4
ADDRGP4 $528
ASGNP4
line 692
;692:	}
LABELV $523
line 693
;693:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $529
line 694
;694:	s_playersettings.heflashblue.generic.name		= "^4Голова:";
ADDRGP4 s_playersettings+2692+4
ADDRGP4 $534
ASGNP4
line 695
;695:	}
LABELV $529
line 696
;696:	s_playersettings.heflashblue.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2692+72
CNSTU4 258
ASGNU4
line 697
;697:	s_playersettings.heflashblue.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2692+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 698
;698:	s_playersettings.heflashblue.generic.id		= ID_HEFLASHBLUE;
ADDRGP4 s_playersettings+2692+24
CNSTI4 22
ASGNI4
line 699
;699:	s_playersettings.heflashblue.generic.x			= 220;
ADDRGP4 s_playersettings+2692+28
CNSTI4 220
ASGNI4
line 700
;700:	s_playersettings.heflashblue.generic.y			= y;
ADDRGP4 s_playersettings+2692+32
ADDRLP4 0
INDIRI4
ASGNI4
line 701
;701:	s_playersettings.heflashblue.minvalue			= 0;
ADDRGP4 s_playersettings+2692+88
CNSTF4 0
ASGNF4
line 702
;702:	s_playersettings.heflashblue.maxvalue			= 255;
ADDRGP4 s_playersettings+2692+92
CNSTF4 1132396544
ASGNF4
line 704
;703:	
;704:    y += BIGCHAR_HEIGHT+50;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 50
ADDI4
ADDI4
ASGNI4
line 705
;705:    s_playersettings.toflashred.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2796
CNSTI4 1
ASGNI4
line 706
;706:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $551
line 707
;707:	s_playersettings.toflashred.generic.name		= "^1Torso:";
ADDRGP4 s_playersettings+2796+4
ADDRGP4 $556
ASGNP4
line 708
;708:	}
LABELV $551
line 709
;709:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $557
line 710
;710:	s_playersettings.toflashred.generic.name		= "^1Торс:";
ADDRGP4 s_playersettings+2796+4
ADDRGP4 $562
ASGNP4
line 711
;711:	}
LABELV $557
line 712
;712:	s_playersettings.toflashred.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2796+72
CNSTU4 258
ASGNU4
line 713
;713:	s_playersettings.toflashred.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2796+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 714
;714:	s_playersettings.toflashred.generic.id		= ID_TOFLASHRED;
ADDRGP4 s_playersettings+2796+24
CNSTI4 23
ASGNI4
line 715
;715:	s_playersettings.toflashred.generic.x			= 220;
ADDRGP4 s_playersettings+2796+28
CNSTI4 220
ASGNI4
line 716
;716:	s_playersettings.toflashred.generic.y			= y;
ADDRGP4 s_playersettings+2796+32
ADDRLP4 0
INDIRI4
ASGNI4
line 717
;717:	s_playersettings.toflashred.minvalue			= 0.0f;
ADDRGP4 s_playersettings+2796+88
CNSTF4 0
ASGNF4
line 718
;718:	s_playersettings.toflashred.maxvalue			= 255;
ADDRGP4 s_playersettings+2796+92
CNSTF4 1132396544
ASGNF4
line 720
;719:
;720:        y += BIGCHAR_HEIGHT+5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 5
ADDI4
ADDI4
ASGNI4
line 721
;721:    s_playersettings.toflashgreen.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2900
CNSTI4 1
ASGNI4
line 722
;722:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $579
line 723
;723:	s_playersettings.toflashgreen.generic.name		= "^2Torso:";
ADDRGP4 s_playersettings+2900+4
ADDRGP4 $584
ASGNP4
line 724
;724:	}
LABELV $579
line 725
;725:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $585
line 726
;726:	s_playersettings.toflashgreen.generic.name		= "^2Торс:";
ADDRGP4 s_playersettings+2900+4
ADDRGP4 $590
ASGNP4
line 727
;727:	}
LABELV $585
line 728
;728:	s_playersettings.toflashgreen.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2900+72
CNSTU4 258
ASGNU4
line 729
;729:	s_playersettings.toflashgreen.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2900+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 730
;730:	s_playersettings.toflashgreen.generic.id			= ID_TOFLASHGREEN;
ADDRGP4 s_playersettings+2900+24
CNSTI4 24
ASGNI4
line 731
;731:	s_playersettings.toflashgreen.generic.x			= 220;
ADDRGP4 s_playersettings+2900+28
CNSTI4 220
ASGNI4
line 732
;732:	s_playersettings.toflashgreen.generic.y			= y;
ADDRGP4 s_playersettings+2900+32
ADDRLP4 0
INDIRI4
ASGNI4
line 733
;733:	s_playersettings.toflashgreen.minvalue			= 0.0f;
ADDRGP4 s_playersettings+2900+88
CNSTF4 0
ASGNF4
line 734
;734:	s_playersettings.toflashgreen.maxvalue			= 255;
ADDRGP4 s_playersettings+2900+92
CNSTF4 1132396544
ASGNF4
line 736
;735:
;736:        y += BIGCHAR_HEIGHT+5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 5
ADDI4
ADDI4
ASGNI4
line 737
;737:    s_playersettings.toflashblue.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+3004
CNSTI4 1
ASGNI4
line 738
;738:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $607
line 739
;739:	s_playersettings.toflashblue.generic.name		= "^4Torso:";
ADDRGP4 s_playersettings+3004+4
ADDRGP4 $612
ASGNP4
line 740
;740:	}
LABELV $607
line 741
;741:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $613
line 742
;742:	s_playersettings.toflashblue.generic.name		= "^4Торс:";
ADDRGP4 s_playersettings+3004+4
ADDRGP4 $618
ASGNP4
line 743
;743:	}
LABELV $613
line 744
;744:	s_playersettings.toflashblue.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+3004+72
CNSTU4 258
ASGNU4
line 745
;745:	s_playersettings.toflashblue.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+3004+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 746
;746:	s_playersettings.toflashblue.generic.id		= ID_TOFLASHBLUE;
ADDRGP4 s_playersettings+3004+24
CNSTI4 25
ASGNI4
line 747
;747:	s_playersettings.toflashblue.generic.x			= 220;
ADDRGP4 s_playersettings+3004+28
CNSTI4 220
ASGNI4
line 748
;748:	s_playersettings.toflashblue.generic.y			= y;
ADDRGP4 s_playersettings+3004+32
ADDRLP4 0
INDIRI4
ASGNI4
line 749
;749:	s_playersettings.toflashblue.minvalue			= 0;
ADDRGP4 s_playersettings+3004+88
CNSTF4 0
ASGNF4
line 750
;750:	s_playersettings.toflashblue.maxvalue			= 255;
ADDRGP4 s_playersettings+3004+92
CNSTF4 1132396544
ASGNF4
line 752
;751:	
;752:    y += BIGCHAR_HEIGHT+50;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 50
ADDI4
ADDI4
ASGNI4
line 753
;753:    s_playersettings.flashred.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2172
CNSTI4 1
ASGNI4
line 754
;754:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $635
line 755
;755:	s_playersettings.flashred.generic.name		= "^1Legs:";
ADDRGP4 s_playersettings+2172+4
ADDRGP4 $640
ASGNP4
line 756
;756:	}
LABELV $635
line 757
;757:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $641
line 758
;758:	s_playersettings.flashred.generic.name		= "^1Ноги:";
ADDRGP4 s_playersettings+2172+4
ADDRGP4 $646
ASGNP4
line 759
;759:	}
LABELV $641
line 760
;760:	s_playersettings.flashred.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2172+72
CNSTU4 258
ASGNU4
line 761
;761:	s_playersettings.flashred.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2172+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 762
;762:	s_playersettings.flashred.generic.id		= ID_FLASHRED;
ADDRGP4 s_playersettings+2172+24
CNSTI4 17
ASGNI4
line 763
;763:	s_playersettings.flashred.generic.x			= 220;
ADDRGP4 s_playersettings+2172+28
CNSTI4 220
ASGNI4
line 764
;764:	s_playersettings.flashred.generic.y			= y;
ADDRGP4 s_playersettings+2172+32
ADDRLP4 0
INDIRI4
ASGNI4
line 765
;765:	s_playersettings.flashred.minvalue			= 0.0f;
ADDRGP4 s_playersettings+2172+88
CNSTF4 0
ASGNF4
line 766
;766:	s_playersettings.flashred.maxvalue			= 255;
ADDRGP4 s_playersettings+2172+92
CNSTF4 1132396544
ASGNF4
line 768
;767:
;768:        y += BIGCHAR_HEIGHT+5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 5
ADDI4
ADDI4
ASGNI4
line 769
;769:    s_playersettings.flashgreen.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2276
CNSTI4 1
ASGNI4
line 770
;770:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $663
line 771
;771:	s_playersettings.flashgreen.generic.name		= "^2Legs:";
ADDRGP4 s_playersettings+2276+4
ADDRGP4 $668
ASGNP4
line 772
;772:	}
LABELV $663
line 773
;773:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $669
line 774
;774:	s_playersettings.flashgreen.generic.name		= "^2Ноги:";
ADDRGP4 s_playersettings+2276+4
ADDRGP4 $674
ASGNP4
line 775
;775:	}
LABELV $669
line 776
;776:	s_playersettings.flashgreen.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2276+72
CNSTU4 258
ASGNU4
line 777
;777:	s_playersettings.flashgreen.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2276+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 778
;778:	s_playersettings.flashgreen.generic.id			= ID_FLASHGREEN;
ADDRGP4 s_playersettings+2276+24
CNSTI4 18
ASGNI4
line 779
;779:	s_playersettings.flashgreen.generic.x			= 220;
ADDRGP4 s_playersettings+2276+28
CNSTI4 220
ASGNI4
line 780
;780:	s_playersettings.flashgreen.generic.y			= y;
ADDRGP4 s_playersettings+2276+32
ADDRLP4 0
INDIRI4
ASGNI4
line 781
;781:	s_playersettings.flashgreen.minvalue			= 0.0f;
ADDRGP4 s_playersettings+2276+88
CNSTF4 0
ASGNF4
line 782
;782:	s_playersettings.flashgreen.maxvalue			= 255;
ADDRGP4 s_playersettings+2276+92
CNSTF4 1132396544
ASGNF4
line 784
;783:
;784:        y += BIGCHAR_HEIGHT+5;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 5
ADDI4
ADDI4
ASGNI4
line 785
;785:    s_playersettings.flashblue.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_playersettings+2380
CNSTI4 1
ASGNI4
line 786
;786:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $691
line 787
;787:	s_playersettings.flashblue.generic.name		= "^4Legs:";
ADDRGP4 s_playersettings+2380+4
ADDRGP4 $696
ASGNP4
line 788
;788:	}
LABELV $691
line 789
;789:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $697
line 790
;790:	s_playersettings.flashblue.generic.name		= "^4Ноги:";
ADDRGP4 s_playersettings+2380+4
ADDRGP4 $702
ASGNP4
line 791
;791:	}
LABELV $697
line 792
;792:	s_playersettings.flashblue.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_playersettings+2380+72
CNSTU4 258
ASGNU4
line 793
;793:	s_playersettings.flashblue.generic.callback	= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+2380+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 794
;794:	s_playersettings.flashblue.generic.id		= ID_FLASHBLUE;
ADDRGP4 s_playersettings+2380+24
CNSTI4 19
ASGNI4
line 795
;795:	s_playersettings.flashblue.generic.x			= 220;
ADDRGP4 s_playersettings+2380+28
CNSTI4 220
ASGNI4
line 796
;796:	s_playersettings.flashblue.generic.y			= y;
ADDRGP4 s_playersettings+2380+32
ADDRLP4 0
INDIRI4
ASGNI4
line 797
;797:	s_playersettings.flashblue.minvalue			= 0;
ADDRGP4 s_playersettings+2380+88
CNSTF4 0
ASGNF4
line 798
;798:	s_playersettings.flashblue.maxvalue			= 255;
ADDRGP4 s_playersettings+2380+92
CNSTF4 1132396544
ASGNF4
line 800
;799:
;800:	s_playersettings.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+3108
CNSTI4 6
ASGNI4
line 801
;801:	s_playersettings.back.generic.name			= ART_BACK0;
ADDRGP4 s_playersettings+3108+4
ADDRGP4 $720
ASGNP4
line 802
;802:	s_playersettings.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+3108+72
CNSTU4 260
ASGNU4
line 803
;803:	s_playersettings.back.generic.id			= ID_BACK;
ADDRGP4 s_playersettings+3108+24
CNSTI4 13
ASGNI4
line 804
;804:	s_playersettings.back.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+3108+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 805
;805:	s_playersettings.back.generic.x				= 0 - uis.wideoffset;
ADDRGP4 s_playersettings+3108+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 806
;806:	s_playersettings.back.generic.y				= 480-64;
ADDRGP4 s_playersettings+3108+32
CNSTI4 416
ASGNI4
line 807
;807:	s_playersettings.back.width					= 128;
ADDRGP4 s_playersettings+3108+104
CNSTI4 128
ASGNI4
line 808
;808:	s_playersettings.back.height				= 64;
ADDRGP4 s_playersettings+3108+108
CNSTI4 64
ASGNI4
line 809
;809:	s_playersettings.back.focuspic				= ART_BACK1;
ADDRGP4 s_playersettings+3108+88
ADDRGP4 $738
ASGNP4
line 811
;810:
;811:	s_playersettings.item_null.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+3340
CNSTI4 6
ASGNI4
line 812
;812:	s_playersettings.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_playersettings+3340+72
CNSTU4 1050628
ASGNU4
line 813
;813:	s_playersettings.item_null.generic.x		= 0;
ADDRGP4 s_playersettings+3340+28
CNSTI4 0
ASGNI4
line 814
;814:	s_playersettings.item_null.generic.y		= 0;
ADDRGP4 s_playersettings+3340+32
CNSTI4 0
ASGNI4
line 815
;815:	s_playersettings.item_null.width			= 640;
ADDRGP4 s_playersettings+3340+104
CNSTI4 640
ASGNI4
line 816
;816:	s_playersettings.item_null.height			= 480;
ADDRGP4 s_playersettings+3340+108
CNSTI4 480
ASGNI4
line 818
;817:
;818:	s_playersettings.modeltype.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_playersettings+3456
CNSTI4 9
ASGNI4
line 819
;819:	s_playersettings.modeltype.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+3456+72
CNSTU4 264
ASGNU4
line 820
;820:	s_playersettings.modeltype.generic.x				= 480;
ADDRGP4 s_playersettings+3456+28
CNSTI4 480
ASGNI4
line 821
;821:	s_playersettings.modeltype.generic.y				= PLAYERMODEL_TEXTHEIGHT + PROP_HEIGHT*sizeScale;
ADDRGP4 s_playersettings+3456+32
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1135378432
ADDF4
CVFI4 4
ASGNI4
line 822
;822:	s_playersettings.modeltype.generic.id				= ID_MODELTYPE;
ADDRGP4 s_playersettings+3456+24
CNSTI4 15
ASGNI4
line 823
;823:	s_playersettings.modeltype.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+3456+76
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 824
;824:	s_playersettings.modeltype.string					= "";
ADDRGP4 s_playersettings+3456+88
ADDRGP4 $764
ASGNP4
line 825
;825:	s_playersettings.modeltype.color					= text_color_normal;
ADDRGP4 s_playersettings+3456+100
ADDRGP4 text_color_normal
ASGNP4
line 826
;826:	s_playersettings.modeltype.style					= UI_CENTER|UI_DROPSHADOW|UI_SMALLFONT;
ADDRGP4 s_playersettings+3456+92
CNSTI4 2065
ASGNI4
line 828
;827:
;828:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.banner );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 829
;829:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framel );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 830
;830:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framer );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 833
;831:
;832:	// setup and add award values
;833:	s_playersettings.awards.bCentre = qtrue;
ADDRGP4 s_playersettings+5860+744
CNSTI4 1
ASGNI4
line 834
;834:	s_playersettings.awards.iconOffset = 0;
ADDRGP4 s_playersettings+5860+748
CNSTI4 0
ASGNI4
line 835
;835:	s_playersettings.awards.iconRaise = 24;
ADDRGP4 s_playersettings+5860+752
CNSTI4 24
ASGNI4
line 836
;836:	UIE_AwardIcons_InitControls(&s_playersettings.menu, &s_playersettings.awards, PlayerSettings_AwardEvent);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+5860
ARGP4
ADDRGP4 PlayerSettings_AwardEvent
ARGP4
ADDRGP4 UIE_AwardIcons_InitControls
CALLV
pop
line 838
;837:
;838:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.name );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 840
;839:	//Menu_AddItem( &s_playersettings.menu, &s_playersettings.handicap );
;840:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.effects );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 841
;841: 	Menu_AddItem( &s_playersettings.menu, &s_playersettings.effects2 );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 842
;842:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.model );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+3224
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 843
;843:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.back );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+3108
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 844
;844:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.flashred );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2172
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 845
;845:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.flashgreen );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2276
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 846
;846:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.flashblue );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 847
;847:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.heflashred );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2484
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 848
;848:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.heflashgreen );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2588
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 849
;849:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.heflashblue );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2692
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 850
;850:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.toflashred );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2796
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 851
;851:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.toflashgreen );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+2900
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 852
;852:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.toflashblue );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+3004
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 853
;853:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.modeltype );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+3456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 855
;854:
;855:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.player.bitmap );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+3596+1524
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 859
;856:
;857:	// kills selected item when cursor moves off it, no item
;858:	// registered after this will activate
;859:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.item_null );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+3340
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 861
;860:
;861:	PlayerSettings_SetMenuItems();
ADDRGP4 PlayerSettings_SetMenuItems
CALLV
pop
line 862
;862:}
LABELV $299
endproc PlayerSettings_MenuInit 12 12
export PlayerSettings_Cache
proc PlayerSettings_Cache 32 4
line 870
;863:
;864:
;865:/*
;866:=================
;867:PlayerSettings_Cache
;868:=================
;869:*/
;870:void PlayerSettings_Cache( void ) {
line 871
;871:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $329
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 872
;872:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $343
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 873
;873:	trap_R_RegisterShaderNoMip( ART_MODEL0 );
ADDRGP4 $427
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 874
;874:	trap_R_RegisterShaderNoMip( ART_MODEL1 );
ADDRGP4 $445
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 875
;875:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $720
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 876
;876:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $738
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 878
;877:
;878:	UIE_AwardIcons_Cache(&s_playersettings.awards);
ADDRGP4 s_playersettings+5860
ARGP4
ADDRGP4 UIE_AwardIcons_Cache
CALLV
pop
line 880
;879:
;880:	s_playersettings.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $800
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3560
ADDRLP4 0
INDIRI4
ASGNI4
line 881
;881:	s_playersettings.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $802
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564
ADDRLP4 4
INDIRI4
ASGNI4
line 882
;882:	s_playersettings.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $805
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564+4
ADDRLP4 8
INDIRI4
ASGNI4
line 883
;883:	s_playersettings.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $808
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564+8
ADDRLP4 12
INDIRI4
ASGNI4
line 884
;884:	s_playersettings.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $811
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564+12
ADDRLP4 16
INDIRI4
ASGNI4
line 885
;885:	s_playersettings.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $814
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564+16
ADDRLP4 20
INDIRI4
ASGNI4
line 886
;886:	s_playersettings.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $817
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564+20
ADDRLP4 24
INDIRI4
ASGNI4
line 887
;887:	s_playersettings.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $820
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+3564+24
ADDRLP4 28
INDIRI4
ASGNI4
line 888
;888:}
LABELV $797
endproc PlayerSettings_Cache 32 4
export UI_PlayerSettingsMenu
proc UI_PlayerSettingsMenu 0 4
line 896
;889:
;890:
;891:/*
;892:=================
;893:UI_PlayerSettingsMenu
;894:=================
;895:*/
;896:void UI_PlayerSettingsMenu( void ) {
line 897
;897:	PlayerSettings_MenuInit();
ADDRGP4 PlayerSettings_MenuInit
CALLV
pop
line 898
;898:	UI_PushMenu( &s_playersettings.menu );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 899
;899:}
LABELV $821
endproc UI_PlayerSettingsMenu 0 4
bss
align 4
LABELV s_playersettings
skip 6620
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
LABELV $820
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $817
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
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $814
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
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $811
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
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $808
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
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $805
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
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $802
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
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $800
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $764
byte 1 0
align 1
LABELV $738
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
LABELV $720
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
LABELV $702
byte 1 94
byte 1 52
byte 1 208
byte 1 157
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $696
byte 1 94
byte 1 52
byte 1 76
byte 1 101
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $674
byte 1 94
byte 1 50
byte 1 208
byte 1 157
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $668
byte 1 94
byte 1 50
byte 1 76
byte 1 101
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $646
byte 1 94
byte 1 49
byte 1 208
byte 1 157
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $640
byte 1 94
byte 1 49
byte 1 76
byte 1 101
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $618
byte 1 94
byte 1 52
byte 1 208
byte 1 162
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 129
byte 1 58
byte 1 0
align 1
LABELV $612
byte 1 94
byte 1 52
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $590
byte 1 94
byte 1 50
byte 1 208
byte 1 162
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 129
byte 1 58
byte 1 0
align 1
LABELV $584
byte 1 94
byte 1 50
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $562
byte 1 94
byte 1 49
byte 1 208
byte 1 162
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 129
byte 1 58
byte 1 0
align 1
LABELV $556
byte 1 94
byte 1 49
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $534
byte 1 94
byte 1 52
byte 1 208
byte 1 147
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $528
byte 1 94
byte 1 52
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $506
byte 1 94
byte 1 50
byte 1 208
byte 1 147
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $500
byte 1 94
byte 1 50
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $478
byte 1 94
byte 1 49
byte 1 208
byte 1 147
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $472
byte 1 94
byte 1 49
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 58
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
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 49
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
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $343
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
LABELV $329
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
LABELV $321
byte 1 208
byte 1 157
byte 1 208
byte 1 144
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 153
byte 1 208
byte 1 154
byte 1 208
byte 1 152
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $315
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $255
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $252
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $249
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $246
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $243
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $240
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $237
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $234
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $231
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $202
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $198
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $181
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $180
byte 1 208
byte 1 160
byte 1 209
byte 1 141
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 58
byte 1 0
align 1
LABELV $174
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $173
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $146
byte 1 208
byte 1 152
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $142
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 208
byte 1 158
byte 1 208
byte 1 177
byte 1 209
byte 1 139
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
byte 1 156
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $121
byte 1 68
byte 1 77
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $115
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
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 156
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $109
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $100
byte 1 53
byte 1 0
align 1
LABELV $99
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $98
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $97
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $96
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $95
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $94
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $93
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $92
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $91
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $90
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $89
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $88
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $87
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $86
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $85
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $84
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $83
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $82
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $81
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
