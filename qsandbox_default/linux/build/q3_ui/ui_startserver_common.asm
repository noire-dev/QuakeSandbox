data
export pulsecolor
align 4
LABELV pulsecolor
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 0
export fading_red
align 4
LABELV fading_red
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 0
export StartServer_CheckFightReady
code
proc StartServer_CheckFightReady 8 0
file "../../../code/q3_ui/ui_startserver_common.c"
line 41
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
;11:
;12:
;13:
;14:#include "ui_local.h"
;15:#include "ui_startserver_q3.h"
;16:
;17:
;18:
;19://
;20:// misc data
;21://
;22:
;23:// scratchpad colours, [3] may be any value
;24:vec4_t pulsecolor = {1.0, 1.0, 1.0, 0.0};
;25:vec4_t fading_red = {1.0, 0.0, 0.0, 0.0};
;26:
;27:
;28:
;29:
;30:
;31://--------------------------------------------------------------
;32:
;33:
;34:
;35:/*
;36:=================
;37:StartServer_CheckFightReady
;38:=================
;39:*/
;40:qboolean StartServer_CheckFightReady(commoncontrols_t* c)
;41:{
line 42
;42:	if (StartServer_CanFight()) {
ADDRLP4 0
ADDRGP4 StartServer_CanFight
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $95
line 43
;43:		c->fight.generic.flags &= ~QMF_GRAYED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 44
;44:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $94
JUMPV
LABELV $95
line 47
;45:	}
;46:
;47:	c->fight.generic.flags |= QMF_GRAYED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 48
;48:	return qfalse;
CNSTI4 0
RETI4
LABELV $94
endproc StartServer_CheckFightReady 8 0
data
align 4
LABELV $98
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1056964608
export StartServer_BackgroundDraw
code
proc StartServer_BackgroundDraw 16 20
line 58
;49:}
;50:
;51:
;52:/*
;53:=================
;54:StartServer_BackgroundDraw
;55:=================
;56:*/
;57:void StartServer_BackgroundDraw(qboolean excluded)
;58:{
line 64
;59:	static vec4_t dim = { 1.0, 1.0, 1.0, 0.5 };
;60:
;61:	int y, w, h;
;62:
;63:	// draw the frames
;64:	y = 64 + LINE_HEIGHT;
ADDRLP4 0
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 64
ADDI4
ASGNI4
line 65
;65:	w = 172;
ADDRLP4 4
CNSTI4 172
ASGNI4
line 66
;66:	h = 480 - 2 * y;
ADDRLP4 8
CNSTI4 480
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 68
;67:
;68:	trap_R_SetColor( dim );
ADDRGP4 $98
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 69
;69:	UI_DrawNamedPic( 32, y, w, h, FRAME_LEFT);
CNSTF4 1107296256
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $100
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 70
;70:	UI_DrawNamedPic( 640 - 32 - w, y, w, h, FRAME_RIGHT );
CNSTI4 608
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $101
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 72
;71:
;72:	if (excluded)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $102
line 73
;73:	{
line 74
;74:		dim[3] = 0.25;
ADDRGP4 $98+12
CNSTF4 1048576000
ASGNF4
line 75
;75:		UI_DrawNamedPic( 320 - 256, 240 - 64 - 32, 512, 256, FRAME_EXCLUDED);
CNSTF4 1115684864
ARGF4
CNSTF4 1125122048
ARGF4
CNSTF4 1140850688
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $105
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 76
;76:	}
LABELV $102
line 78
;77:
;78:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 79
;79:}
LABELV $97
endproc StartServer_BackgroundDraw 16 20
export StartServer_SelectionDraw
proc StartServer_SelectionDraw 68 20
line 90
;80:
;81:
;82:
;83:
;84:/*
;85:=================
;86:StartServer_SelectionDraw
;87:=================
;88:*/
;89:void StartServer_SelectionDraw(void* self )
;90:{
line 99
;91:	float	x;
;92:	float	y;
;93:	float	w;
;94:	float	h;
;95:	float offset;
;96:	qhandle_t shader;
;97:	menubitmap_s* b;
;98:
;99:	b = (menubitmap_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 101
;100:
;101:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 102
;102:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 103
;103:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 104
;104:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 107
;105:
;106:	// used to refresh shader
;107:	if (b->generic.name && !b->shader)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $107
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
NEI4 $107
line 108
;108:	{
line 109
;109:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 110
;110:		if (!b->shader && b->errorpic)
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
NEI4 $109
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $109
line 111
;111:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
LABELV $109
line 112
;112:	}
LABELV $107
line 114
;113:
;114:	if (b->focuspic && !b->focusshader)
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $111
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 0
NEI4 $111
line 115
;115:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $111
line 117
;116:
;117:	if (b->generic.flags & QMF_HIGHLIGHT)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $113
line 118
;118:		shader = b->focusshader;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $113
line 120
;119:	else
;120:		shader = b->shader;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
LABELV $114
line 122
;121:
;122:	if (b->generic.flags & QMF_GRAYED) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $115
line 123
;123:		if (shader) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $116
line 124
;124:			trap_R_SetColor( colorMdGrey );
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 125
;125:			UI_DrawHandlePic( x, y, w, h, shader );
ADDRLP4 4
INDIRF4
ARGF4
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
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 126
;126:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 127
;127:		}
line 128
;128:	}
ADDRGP4 $116
JUMPV
LABELV $115
line 130
;129:	else
;130:	{
line 131
;131:		if ((b->generic.flags & QMF_PULSE) || (b->generic.flags & QMF_PULSEIFFOCUS) && (UI_CursorInRect(x, y, w, h)))
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
ASGNU4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRU4
CNSTU4 131072
BANDU4
ADDRLP4 48
INDIRU4
NEU4 $121
ADDRLP4 44
INDIRU4
CNSTU4 256
BANDU4
ADDRLP4 48
INDIRU4
EQU4 $119
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 52
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $119
LABELV $121
line 132
;132:		{
line 133
;133:			offset = 3*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 56
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 24
CNSTF4 1077936128
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 134
;134:			UI_DrawHandlePic( x - offset, y - offset, w + 2*offset, h + 2*offset, shader );
ADDRLP4 60
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 64
CNSTF4 1073741824
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 64
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 64
INDIRF4
ADDF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 135
;135:		}
ADDRGP4 $120
JUMPV
LABELV $119
line 137
;136:		else
;137:		{
line 138
;138:			UI_DrawHandlePic( x, y, w, h, shader );
ADDRLP4 4
INDIRF4
ARGF4
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
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 139
;139:		}
LABELV $120
line 140
;140:	}
LABELV $116
line 141
;141:}
LABELV $106
endproc StartServer_SelectionDraw 68 20
export StartServer_CommonControls_Cache
proc StartServer_CommonControls_Cache 0 4
line 153
;142:
;143:
;144:
;145:
;146:
;147:/*
;148:=================
;149:StartServer_CommonControls_Cache
;150:=================
;151:*/
;152:void StartServer_CommonControls_Cache( void )
;153:{
line 154
;154:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $124
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 155
;155:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $125
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 156
;156:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $126
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 157
;157:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $127
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 158
;158:	trap_R_RegisterShaderNoMip( GAMESERVER_SERVER0 );
ADDRGP4 $128
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 159
;159:	trap_R_RegisterShaderNoMip( GAMESERVER_SERVER1 );
ADDRGP4 $129
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 160
;160:	trap_R_RegisterShaderNoMip( GAMESERVER_WEAPONS0 );
ADDRGP4 $130
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 161
;161:	trap_R_RegisterShaderNoMip( GAMESERVER_WEAPONS1 );
ADDRGP4 $131
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 162
;162:	trap_R_RegisterShaderNoMip( GAMESERVER_MAPS0 );
ADDRGP4 $132
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 163
;163:	trap_R_RegisterShaderNoMip( GAMESERVER_MAPS1 );
ADDRGP4 $133
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 164
;164:	trap_R_RegisterShaderNoMip( GAMESERVER_BOTS0 );
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 165
;165:	trap_R_RegisterShaderNoMip( GAMESERVER_BOTS1 );
ADDRGP4 $135
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 167
;166:
;167:	trap_R_RegisterShaderNoMip( FRAME_LEFT );
ADDRGP4 $100
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 168
;168:	trap_R_RegisterShaderNoMip( FRAME_RIGHT );
ADDRGP4 $101
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 169
;169:	trap_R_RegisterShaderNoMip( FRAME_EXCLUDED );
ADDRGP4 $105
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 170
;170:}
LABELV $123
endproc StartServer_CommonControls_Cache 0 4
export StartServer_CommonControls_Init
proc StartServer_CommonControls_Init 16 8
line 185
;171:
;172:
;173:
;174:
;175:/*
;176:=================
;177:StartServer_CommonControls_Init
;178:=================
;179:*/
;180:void StartServer_CommonControls_Init(
;181:	menuframework_s* menuptr,
;182:	commoncontrols_t* common,
;183:	CtrlCallback_t callback,
;184:	int ctrlpage)
;185:{
line 189
;186:	int scale;
;187:	int height;
;188:
;189:	StartServer_CommonControls_Cache();
ADDRGP4 StartServer_CommonControls_Cache
CALLV
pop
line 191
;190:
;191:	common->back.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 6
ASGNI4
line 192
;192:	common->back.generic.name     = GAMESERVER_BACK0;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $124
ASGNP4
line 193
;193:	common->back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
CNSTU4 260
ASGNU4
line 194
;194:	common->back.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 195
;195:	common->back.generic.id	    = ID_SERVERCOMMON_BACK;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 10
ASGNI4
line 196
;196:	common->back.generic.x		= 0 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 197
;197:	common->back.generic.y		= 480-64;
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 416
ASGNI4
line 198
;198:	common->back.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 128
ASGNI4
line 199
;199:	common->back.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 108
ADDP4
CNSTI4 64
ASGNI4
line 200
;200:	common->back.focuspic         = GAMESERVER_BACK1;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $125
ASGNP4
line 202
;201:
;202:	common->fight.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 116
ADDP4
CNSTI4 6
ASGNI4
line 203
;203:	common->fight.generic.name     = GAMESERVER_FIGHT0;
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDRGP4 $126
ASGNP4
line 204
;204:	common->fight.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
CNSTU4 260
ASGNU4
line 205
;205:	common->fight.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 206
;206:	common->fight.generic.id	    = ID_SERVERCOMMON_FIGHT;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 11
ASGNI4
line 207
;207:	common->fight.generic.x		= 640-128 + uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 512
ADDI4
ASGNI4
line 208
;208:	common->fight.generic.y		= 480-64;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 416
ASGNI4
line 209
;209:	common->fight.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 128
ASGNI4
line 210
;210:	common->fight.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 64
ASGNI4
line 211
;211:	common->fight.focuspic         = GAMESERVER_FIGHT1;
ADDRFP4 4
INDIRP4
CNSTI4 204
ADDP4
ADDRGP4 $127
ASGNP4
line 213
;212:
;213:	common->maps.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 6
ASGNI4
line 214
;214:	common->maps.generic.name     = GAMESERVER_MAPS0;
ADDRFP4 4
INDIRP4
CNSTI4 584
ADDP4
ADDRGP4 $132
ASGNP4
line 215
;215:	common->maps.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 652
ADDP4
CNSTU4 260
ASGNU4
line 216
;216:	common->maps.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 656
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 217
;217:	common->maps.generic.id	    = ID_SERVERCOMMON_MAPS;
ADDRFP4 4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 15
ASGNI4
line 218
;218:	common->maps.generic.x		= 0 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 219
;219:	common->maps.generic.y		= 0;
ADDRFP4 4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 220
;220:	common->maps.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
CNSTI4 128
ASGNI4
line 221
;221:	common->maps.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 64
ASGNI4
line 222
;222:	common->maps.focuspic         = GAMESERVER_MAPS1;
ADDRFP4 4
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 $133
ASGNP4
line 224
;223:
;224:	common->bots.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 6
ASGNI4
line 225
;225:	common->bots.generic.name     = GAMESERVER_BOTS0;
ADDRFP4 4
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 $134
ASGNP4
line 226
;226:	common->bots.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 768
ADDP4
CNSTU4 260
ASGNU4
line 227
;227:	common->bots.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 228
;228:	common->bots.generic.id	    = ID_SERVERCOMMON_BOTS;
ADDRFP4 4
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 14
ASGNI4
line 229
;229:	common->bots.generic.x		= 128 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 128
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 230
;230:	common->bots.generic.y		= 0;
ADDRFP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 0
ASGNI4
line 231
;231:	common->bots.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 128
ASGNI4
line 232
;232:	common->bots.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 64
ASGNI4
line 233
;233:	common->bots.focuspic         = GAMESERVER_BOTS1;
ADDRFP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 $135
ASGNP4
line 235
;234:
;235:	common->items.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 6
ASGNI4
line 236
;236:	common->items.generic.name     = GAMESERVER_ITEMS0;
ADDRFP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRGP4 $141
ASGNP4
line 237
;237:	common->items.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 536
ADDP4
CNSTU4 260
ASGNU4
line 238
;238:	common->items.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 239
;239:	common->items.generic.id	    = ID_SERVERCOMMON_ITEMS;
ADDRFP4 4
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 13
ASGNI4
line 240
;240:	common->items.generic.x		= 256 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 256
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 241
;241:	common->items.generic.y		= 0;
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 242
;242:	common->items.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 128
ASGNI4
line 243
;243:	common->items.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 64
ASGNI4
line 244
;244:	common->items.focuspic         = GAMESERVER_ITEMS1;
ADDRFP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 $143
ASGNP4
line 246
;245:
;246:	common->server.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 6
ASGNI4
line 247
;247:	common->server.generic.name     = GAMESERVER_SERVER0;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRGP4 $128
ASGNP4
line 248
;248:	common->server.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
CNSTU4 260
ASGNU4
line 249
;249:	common->server.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 250
;250:	common->server.generic.id	    = ID_SERVERCOMMON_SERVER;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 12
ASGNI4
line 251
;251:	common->server.generic.x		= 384 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 384
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 252
;252:	common->server.generic.y		= 0;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 0
ASGNI4
line 253
;253:	common->server.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 336
ADDP4
CNSTI4 128
ASGNI4
line 254
;254:	common->server.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 64
ASGNI4
line 255
;255:	common->server.focuspic         = GAMESERVER_SERVER1;
ADDRFP4 4
INDIRP4
CNSTI4 320
ADDP4
ADDRGP4 $129
ASGNP4
line 257
;256:	
;257:	common->weapon.generic.type     = MTYPE_BITMAP;
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 6
ASGNI4
line 258
;258:	common->weapon.generic.name     = GAMESERVER_WEAPONS0;
ADDRFP4 4
INDIRP4
CNSTI4 352
ADDP4
ADDRGP4 $130
ASGNP4
line 259
;259:	common->weapon.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTU4 260
ASGNU4
line 260
;260:	common->weapon.generic.callback = callback;
ADDRFP4 4
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 261
;261:	common->weapon.generic.id	    = ID_SERVERCOMMON_WEAPON;
ADDRFP4 4
INDIRP4
CNSTI4 372
ADDP4
CNSTI4 16
ASGNI4
line 262
;262:	common->weapon.generic.x		= 512 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
CNSTI4 512
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 263
;263:	common->weapon.generic.y		= 0;
ADDRFP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 0
ASGNI4
line 264
;264:	common->weapon.width  		    = 128;
ADDRFP4 4
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 128
ASGNI4
line 265
;265:	common->weapon.height  		    = 64;
ADDRFP4 4
INDIRP4
CNSTI4 456
ADDP4
CNSTI4 64
ASGNI4
line 266
;266:	common->weapon.focuspic         = GAMESERVER_WEAPONS1;
ADDRFP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 $131
ASGNP4
line 268
;267:
;268:	scale = UI_ProportionalSizeScale( UI_BIGFONT, 0 );
CNSTI4 32
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
CVFI4 4
ASGNI4
line 269
;269:	height = (64 - PROP_HEIGHT * scale)/2;
ADDRLP4 0
CNSTI4 64
ADDRGP4 cl_propheight+12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 271
;270:
;271:	common->maptext.generic.type			= MTYPE_PTEXT;
ADDRFP4 4
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 9
ASGNI4
line 272
;272:	common->maptext.generic.x			= 64 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 273
;273:	common->maptext.generic.y			= height;
ADDRFP4 4
INDIRP4
CNSTI4 1052
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 274
;274:	common->maptext.generic.flags			= QMF_INACTIVE;
ADDRFP4 4
INDIRP4
CNSTI4 1092
ADDP4
CNSTU4 16384
ASGNU4
line 275
;275:	common->maptext.color  				= color_red;
ADDRFP4 4
INDIRP4
CNSTI4 1120
ADDP4
ADDRGP4 color_red
ASGNP4
line 276
;276:	common->maptext.style  				= UI_CENTER|UI_BIGFONT;
ADDRFP4 4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 33
ASGNI4
line 278
;277:
;278:	common->bottext.generic.type			= MTYPE_PTEXT;
ADDRFP4 4
INDIRP4
CNSTI4 1124
ADDP4
CNSTI4 9
ASGNI4
line 279
;279:	common->bottext.generic.x			= 64 + 128 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 1152
ADDP4
CNSTI4 192
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 280
;280:	common->bottext.generic.y			= height;
ADDRFP4 4
INDIRP4
CNSTI4 1156
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 281
;281:	common->bottext.generic.flags			= QMF_INACTIVE;
ADDRFP4 4
INDIRP4
CNSTI4 1196
ADDP4
CNSTU4 16384
ASGNU4
line 282
;282:	common->bottext.color  				= color_red;
ADDRFP4 4
INDIRP4
CNSTI4 1224
ADDP4
ADDRGP4 color_red
ASGNP4
line 283
;283:	common->bottext.style  				= UI_CENTER|UI_BIGFONT;
ADDRFP4 4
INDIRP4
CNSTI4 1216
ADDP4
CNSTI4 33
ASGNI4
line 285
;284:
;285:	common->itemtext.generic.type			= MTYPE_PTEXT;
ADDRFP4 4
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 9
ASGNI4
line 286
;286:	common->itemtext.generic.x			= 64 + 256 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 320
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 287
;287:	common->itemtext.generic.y			= height;
ADDRFP4 4
INDIRP4
CNSTI4 948
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 288
;288:	common->itemtext.generic.flags			= QMF_INACTIVE;
ADDRFP4 4
INDIRP4
CNSTI4 988
ADDP4
CNSTU4 16384
ASGNU4
line 289
;289:	common->itemtext.color  				= color_red;
ADDRFP4 4
INDIRP4
CNSTI4 1016
ADDP4
ADDRGP4 color_red
ASGNP4
line 290
;290:	common->itemtext.style  				= UI_CENTER|UI_BIGFONT;
ADDRFP4 4
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 33
ASGNI4
line 292
;291:
;292:	common->servertext.generic.type			= MTYPE_PTEXT;
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 9
ASGNI4
line 293
;293:	common->servertext.generic.x			= 64 + 384 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 448
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 294
;294:	common->servertext.generic.y			= height;
ADDRFP4 4
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 295
;295:	common->servertext.generic.flags			= QMF_INACTIVE;
ADDRFP4 4
INDIRP4
CNSTI4 884
ADDP4
CNSTU4 16384
ASGNU4
line 296
;296:	common->servertext.color  				= color_red;
ADDRFP4 4
INDIRP4
CNSTI4 912
ADDP4
ADDRGP4 color_red
ASGNP4
line 297
;297:	common->servertext.style  				= UI_CENTER|UI_BIGFONT;
ADDRFP4 4
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 33
ASGNI4
line 299
;298:	
;299:	common->weapontext.generic.type			= MTYPE_PTEXT;
ADDRFP4 4
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 9
ASGNI4
line 300
;300:	common->weapontext.generic.x			= 64 + 512 - uis.wideoffset;
ADDRFP4 4
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 576
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 301
;301:	common->weapontext.generic.y			= height;
ADDRFP4 4
INDIRP4
CNSTI4 1260
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 302
;302:	common->weapontext.generic.flags			= QMF_INACTIVE;
ADDRFP4 4
INDIRP4
CNSTI4 1300
ADDP4
CNSTU4 16384
ASGNU4
line 303
;303:	common->weapontext.color  				= color_red;
ADDRFP4 4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 color_red
ASGNP4
line 304
;304:	common->weapontext.style  				= UI_CENTER|UI_BIGFONT;
ADDRFP4 4
INDIRP4
CNSTI4 1320
ADDP4
CNSTI4 33
ASGNI4
line 306
;305:	
;306:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $152
line 307
;307:	common->weapontext.string  				= "Weapon";
ADDRFP4 4
INDIRP4
CNSTI4 1316
ADDP4
ADDRGP4 $155
ASGNP4
line 308
;308:	common->servertext.string  				= "Server";
ADDRFP4 4
INDIRP4
CNSTI4 900
ADDP4
ADDRGP4 $156
ASGNP4
line 309
;309:	common->itemtext.string  				= "Items";
ADDRFP4 4
INDIRP4
CNSTI4 1004
ADDP4
ADDRGP4 $157
ASGNP4
line 310
;310:	common->bottext.string  				= "Bots";
ADDRFP4 4
INDIRP4
CNSTI4 1212
ADDP4
ADDRGP4 $158
ASGNP4
line 311
;311:	common->maptext.string  				= "Maps";
ADDRFP4 4
INDIRP4
CNSTI4 1108
ADDP4
ADDRGP4 $159
ASGNP4
line 312
;312:	}
LABELV $152
line 313
;313:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $160
line 314
;314:	common->weapontext.string  				= "Оружие";
ADDRFP4 4
INDIRP4
CNSTI4 1316
ADDP4
ADDRGP4 $163
ASGNP4
line 315
;315:	common->servertext.string  				= "Сервер";
ADDRFP4 4
INDIRP4
CNSTI4 900
ADDP4
ADDRGP4 $164
ASGNP4
line 316
;316:	common->itemtext.string  				= "Предметы";
ADDRFP4 4
INDIRP4
CNSTI4 1004
ADDP4
ADDRGP4 $165
ASGNP4
line 317
;317:	common->bottext.string  				= "Боты";
ADDRFP4 4
INDIRP4
CNSTI4 1212
ADDP4
ADDRGP4 $166
ASGNP4
line 318
;318:	common->maptext.string  				= "Карты";
ADDRFP4 4
INDIRP4
CNSTI4 1108
ADDP4
ADDRGP4 $167
ASGNP4
line 319
;319:	}
LABELV $160
line 323
;320:
;321:
;322:	// register controls
;323:	Menu_AddItem( menuptr, &common->back);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 324
;324:	Menu_AddItem( menuptr, &common->fight);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 326
;325:
;326:	switch (ctrlpage)
ADDRLP4 12
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $168
ADDRLP4 12
INDIRI4
CNSTI4 4
GTI4 $168
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $175
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $175
address $170
address $171
address $172
address $173
address $174
code
line 327
;327:	{
LABELV $170
line 329
;328:		case COMMONCTRL_BOTS:
;329:			Menu_AddItem( menuptr, &common->maps);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 330
;330:			Menu_AddItem( menuptr, &common->items);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 331
;331:			Menu_AddItem( menuptr, &common->server);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 332
;332:			Menu_AddItem( menuptr, &common->weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 333
;333:			Menu_AddItem( menuptr, &common->bottext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1124
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 334
;334:			break;
ADDRGP4 $169
JUMPV
LABELV $171
line 336
;335:		case COMMONCTRL_MAPS:
;336:			Menu_AddItem( menuptr, &common->bots);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 337
;337:			Menu_AddItem( menuptr, &common->items);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 338
;338:			Menu_AddItem( menuptr, &common->server);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 339
;339:			Menu_AddItem( menuptr, &common->weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 340
;340:			Menu_AddItem( menuptr, &common->maptext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1020
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 341
;341:			break;
ADDRGP4 $169
JUMPV
LABELV $172
line 343
;342:		case COMMONCTRL_SERVER:
;343:			Menu_AddItem( menuptr, &common->bots);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 344
;344:			Menu_AddItem( menuptr, &common->maps);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 345
;345:			Menu_AddItem( menuptr, &common->items);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 346
;346:			Menu_AddItem( menuptr, &common->weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 347
;347:			Menu_AddItem( menuptr, &common->servertext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 348
;348:			break;
ADDRGP4 $169
JUMPV
LABELV $173
line 350
;349:		case COMMONCTRL_ITEMS:
;350:			Menu_AddItem( menuptr, &common->bots);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 351
;351:			Menu_AddItem( menuptr, &common->maps);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 352
;352:			Menu_AddItem( menuptr, &common->server);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 353
;353:			Menu_AddItem( menuptr, &common->weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 354
;354:			Menu_AddItem( menuptr, &common->itemtext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 916
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 355
;355:			break;
ADDRGP4 $169
JUMPV
LABELV $174
line 357
;356:		case COMMONCTRL_WEAPON:
;357:			Menu_AddItem( menuptr, &common->bots);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 358
;358:			Menu_AddItem( menuptr, &common->maps);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 359
;359:			Menu_AddItem( menuptr, &common->items);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 360
;360:			Menu_AddItem( menuptr, &common->server);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 361
;361:			Menu_AddItem( menuptr, &common->weapontext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1228
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 362
;362:			break;
LABELV $168
LABELV $169
line 364
;363:	}
;364:}
LABELV $136
endproc StartServer_CommonControls_Init 16 8
export StartServer_Cache
proc StartServer_Cache 0 0
line 382
;365:
;366:
;367:
;368:
;369:
;370:
;371:/*--------------------------------------------------------------------*/
;372:
;373:
;374:
;375:
;376:/*
;377:=================
;378:StartServer_Cache
;379:=================
;380:*/
;381:void StartServer_Cache( void )
;382:{
line 383
;383:	StartServer_CommonControls_Cache();
ADDRGP4 StartServer_CommonControls_Cache
CALLV
pop
line 384
;384:	StartServer_ServerPage_Cache();
ADDRGP4 StartServer_ServerPage_Cache
CALLV
pop
line 385
;385:	StartServer_MapPage_Cache();
ADDRGP4 StartServer_MapPage_Cache
CALLV
pop
line 386
;386:	StartServer_BotPage_Cache();
ADDRGP4 StartServer_BotPage_Cache
CALLV
pop
line 387
;387:}
LABELV $176
endproc StartServer_Cache 0 0
export ServerOptions_Cache
proc ServerOptions_Cache 0 0
line 408
;388:
;389:
;390:
;391:
;392:
;393:/*--------------------------------------------------------------------*/
;394:
;395:
;396:
;397:
;398:
;399:
;400:
;401:
;402:/*
;403:=================
;404:ServerOptions_Cache
;405:=================
;406:*/
;407:void ServerOptions_Cache( void )
;408:{
line 409
;409:}
LABELV $177
endproc ServerOptions_Cache 0 0
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
import UI_StartMapMenu
import UI_BotSelect_Index
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
LABELV $167
byte 1 208
byte 1 154
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
LABELV $166
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $165
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $164
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $163
byte 1 208
byte 1 158
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $159
byte 1 77
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $158
byte 1 66
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $157
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $156
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $155
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $143
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
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $141
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
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $135
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
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $134
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
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $133
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
byte 1 115
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $132
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
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $131
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
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $130
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
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $129
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
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $128
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
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $127
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
LABELV $126
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
LABELV $125
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
LABELV $124
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
LABELV $105
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
LABELV $101
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
LABELV $100
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
