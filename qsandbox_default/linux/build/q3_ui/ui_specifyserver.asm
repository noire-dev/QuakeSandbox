data
align 4
LABELV specifyserver_artlist
address $80
address $81
address $82
address $83
address $84
address $85
byte 4 0
code
proc SpecifyServer_Event 288 16
file "../../../code/q3_ui/ui_specifyserver.c"
line 50
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*********************************************************************************
;6:	SPECIFY SERVER
;7:*********************************************************************************/
;8:
;9:#define SPECIFYSERVER_FRAMEL	"menu/art/frame2_l"
;10:#define SPECIFYSERVER_FRAMER	"menu/art/frame1_r"
;11:#define SPECIFYSERVER_BACK0		"menu/art/back_0"
;12:#define SPECIFYSERVER_BACK1		"menu/art/back_1"
;13:#define SPECIFYSERVER_FIGHT0	"menu/art/fight_0"
;14:#define SPECIFYSERVER_FIGHT1	"menu/art/fight_1"
;15:
;16:#define ID_SPECIFYSERVERBACK	102
;17:#define ID_SPECIFYSERVERGO		103
;18:
;19:static char* specifyserver_artlist[] =
;20:{
;21:	SPECIFYSERVER_FRAMEL,
;22:	SPECIFYSERVER_FRAMER,
;23:	SPECIFYSERVER_BACK0,	
;24:	SPECIFYSERVER_BACK1,	
;25:	SPECIFYSERVER_FIGHT0,
;26:	SPECIFYSERVER_FIGHT1,
;27:	NULL
;28:};
;29:
;30:typedef struct
;31:{
;32:	menuframework_s	menu;
;33:	menutext_s		banner;
;34:	menubitmap_s	framel;
;35:	menubitmap_s	framer;
;36:	menufield_s		domain;
;37:	menufield_s		port;
;38:	menubitmap_s	go;
;39:	menubitmap_s	back;
;40:} specifyserver_t;
;41:
;42:static specifyserver_t	s_specifyserver;
;43:
;44:/*
;45:=================
;46:SpecifyServer_Event
;47:=================
;48:*/
;49:static void SpecifyServer_Event( void* ptr, int event )
;50:{
line 54
;51:	char	buff[256];
;52:	int i;
;53:
;54:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 102
EQI4 $120
ADDRLP4 260
INDIRI4
CNSTI4 103
EQI4 $91
ADDRGP4 $88
JUMPV
line 55
;55:	{
LABELV $91
line 57
;56:		case ID_SPECIFYSERVERGO:
;57:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
line 58
;58:				break;
ADDRGP4 $89
JUMPV
LABELV $92
line 60
;59:
;60:			if (s_specifyserver.domain.field.buffer[0])
ADDRGP4 s_specifyserver+1412+88+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $89
line 61
;61:			{
line 62
;62:				strcpy(buff,s_specifyserver.domain.field.buffer);
ADDRLP4 4
ARGP4
ADDRGP4 s_specifyserver+1412+88+12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 63
;63:				if (s_specifyserver.port.field.buffer[0])
ADDRGP4 s_specifyserver+1776+88+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $102
line 64
;64:					Com_sprintf( buff+strlen(buff), 128, ":%s", s_specifyserver.port.field.buffer );
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 s_specifyserver+1776+88+12
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $102
line 66
;65:
;66:				for( i = 1; i < MAX_FAVORITESERVERS; i++){
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $111
line 67
;67:				if(!trap_Cvar_VariableValue(va("server%i", i))){
ADDRGP4 $117
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 0
NEF4 $115
line 68
;68:				trap_Cmd_ExecuteText( EXEC_APPEND, va("seta server%i %s\n", i, buff));
ADDRGP4 $118
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 280
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 69
;69:				trap_Cmd_ExecuteText( EXEC_APPEND, va("connect %s\n", buff));
ADDRGP4 $119
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 284
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 284
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 70
;70:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 71
;71:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 72
;72:				return;
ADDRGP4 $87
JUMPV
LABELV $115
line 74
;73:				}
;74:				}
LABELV $112
line 66
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $111
line 77
;75:				
;76:				
;77:			}
line 78
;78:			break;
ADDRGP4 $89
JUMPV
LABELV $120
line 81
;79:
;80:		case ID_SPECIFYSERVERBACK:
;81:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $121
line 82
;82:				break;
ADDRGP4 $89
JUMPV
LABELV $121
line 84
;83:
;84:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 85
;85:			break;
LABELV $88
LABELV $89
line 87
;86:	}
;87:}
LABELV $87
endproc SpecifyServer_Event 288 16
export SpecifyServer_MenuInit
proc SpecifyServer_MenuInit 0 16
line 95
;88:
;89:/*
;90:=================
;91:SpecifyServer_MenuInit
;92:=================
;93:*/
;94:void SpecifyServer_MenuInit( void )
;95:{
line 97
;96:	// zero set all our globals
;97:	memset( &s_specifyserver, 0 ,sizeof(specifyserver_t) );
ADDRGP4 s_specifyserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2372
ARGI4
ADDRGP4 memset
CALLP4
pop
line 99
;98:
;99:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 101
;100:
;101:	s_specifyserver.menu.wrapAround = qtrue;
ADDRGP4 s_specifyserver+1044
CNSTI4 1
ASGNI4
line 102
;102:	s_specifyserver.menu.native 	   = qfalse;
ADDRGP4 s_specifyserver+1056
CNSTI4 0
ASGNI4
line 103
;103:	s_specifyserver.menu.fullscreen = qtrue;
ADDRGP4 s_specifyserver+1052
CNSTI4 1
ASGNI4
line 105
;104:
;105:	s_specifyserver.banner.generic.type	 = MTYPE_BTEXT;
ADDRGP4 s_specifyserver+1076
CNSTI4 10
ASGNI4
line 106
;106:	s_specifyserver.banner.generic.x     = 320;
ADDRGP4 s_specifyserver+1076+28
CNSTI4 320
ASGNI4
line 107
;107:	s_specifyserver.banner.generic.y     = 16;
ADDRGP4 s_specifyserver+1076+32
CNSTI4 16
ASGNI4
line 108
;108:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $132
line 109
;109:	s_specifyserver.banner.string		 = "ADD TO FAVORITES";
ADDRGP4 s_specifyserver+1076+88
ADDRGP4 $137
ASGNP4
line 110
;110:	}
LABELV $132
line 111
;111:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $138
line 112
;112:	s_specifyserver.banner.string		 = "ДОБАВИТЬ В ЛЮБИМЫЕ";
ADDRGP4 s_specifyserver+1076+88
ADDRGP4 $143
ASGNP4
line 113
;113:	}
LABELV $138
line 114
;114:	s_specifyserver.banner.color  		 = color_white;
ADDRGP4 s_specifyserver+1076+100
ADDRGP4 color_white
ASGNP4
line 115
;115:	s_specifyserver.banner.style  		 = UI_CENTER;
ADDRGP4 s_specifyserver+1076+92
CNSTI4 1
ASGNI4
line 117
;116:
;117:	s_specifyserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+1180
CNSTI4 6
ASGNI4
line 118
;118:	s_specifyserver.framel.generic.name  = SPECIFYSERVER_FRAMEL;
ADDRGP4 s_specifyserver+1180+4
ADDRGP4 $80
ASGNP4
line 119
;119:	s_specifyserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyserver+1180+72
CNSTU4 16384
ASGNU4
line 120
;120:	s_specifyserver.framel.generic.x	 = 0;  
ADDRGP4 s_specifyserver+1180+28
CNSTI4 0
ASGNI4
line 121
;121:	s_specifyserver.framel.generic.y	 = 78;
ADDRGP4 s_specifyserver+1180+32
CNSTI4 78
ASGNI4
line 122
;122:	s_specifyserver.framel.width  	     = 256;
ADDRGP4 s_specifyserver+1180+104
CNSTI4 256
ASGNI4
line 123
;123:	s_specifyserver.framel.height  	     = 329;
ADDRGP4 s_specifyserver+1180+108
CNSTI4 329
ASGNI4
line 125
;124:
;125:	s_specifyserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+1296
CNSTI4 6
ASGNI4
line 126
;126:	s_specifyserver.framer.generic.name  = SPECIFYSERVER_FRAMER;
ADDRGP4 s_specifyserver+1296+4
ADDRGP4 $81
ASGNP4
line 127
;127:	s_specifyserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyserver+1296+72
CNSTU4 16384
ASGNU4
line 128
;128:	s_specifyserver.framer.generic.x	 = 376;
ADDRGP4 s_specifyserver+1296+28
CNSTI4 376
ASGNI4
line 129
;129:	s_specifyserver.framer.generic.y	 = 76;
ADDRGP4 s_specifyserver+1296+32
CNSTI4 76
ASGNI4
line 130
;130:	s_specifyserver.framer.width  	     = 256;
ADDRGP4 s_specifyserver+1296+104
CNSTI4 256
ASGNI4
line 131
;131:	s_specifyserver.framer.height  	     = 334;
ADDRGP4 s_specifyserver+1296+108
CNSTI4 334
ASGNI4
line 133
;132:
;133:	s_specifyserver.domain.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyserver+1412
CNSTI4 4
ASGNI4
line 134
;134:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $175
line 135
;135:	s_specifyserver.domain.generic.name       = "Address:";
ADDRGP4 s_specifyserver+1412+4
ADDRGP4 $180
ASGNP4
line 136
;136:	}
LABELV $175
line 137
;137:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $181
line 138
;138:	s_specifyserver.domain.generic.name       = "Адрес:";
ADDRGP4 s_specifyserver+1412+4
ADDRGP4 $186
ASGNP4
line 139
;139:	}
LABELV $181
line 140
;140:	s_specifyserver.domain.generic.flags      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_specifyserver+1412+72
CNSTU4 258
ASGNU4
line 141
;141:	s_specifyserver.domain.generic.x	      = 206;
ADDRGP4 s_specifyserver+1412+28
CNSTI4 206
ASGNI4
line 142
;142:	s_specifyserver.domain.generic.y	      = 220;
ADDRGP4 s_specifyserver+1412+32
CNSTI4 220
ASGNI4
line 143
;143:	s_specifyserver.domain.field.widthInChars = 38;
ADDRGP4 s_specifyserver+1412+88+8
CNSTI4 38
ASGNI4
line 144
;144:	s_specifyserver.domain.field.maxchars     = 80;
ADDRGP4 s_specifyserver+1412+88+268
CNSTI4 80
ASGNI4
line 146
;145:
;146:	s_specifyserver.port.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyserver+1776
CNSTI4 4
ASGNI4
line 147
;147:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $200
line 148
;148:	s_specifyserver.port.generic.name	    = "Port:";
ADDRGP4 s_specifyserver+1776+4
ADDRGP4 $205
ASGNP4
line 149
;149:	}
LABELV $200
line 150
;150:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $206
line 151
;151:	s_specifyserver.port.generic.name	    = "Порт:";
ADDRGP4 s_specifyserver+1776+4
ADDRGP4 $211
ASGNP4
line 152
;152:	}
LABELV $206
line 153
;153:	s_specifyserver.port.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_specifyserver+1776+72
CNSTU4 290
ASGNU4
line 154
;154:	s_specifyserver.port.generic.x	        = 206;
ADDRGP4 s_specifyserver+1776+28
CNSTI4 206
ASGNI4
line 155
;155:	s_specifyserver.port.generic.y	        = 250;
ADDRGP4 s_specifyserver+1776+32
CNSTI4 250
ASGNI4
line 156
;156:	s_specifyserver.port.field.widthInChars = 6;
ADDRGP4 s_specifyserver+1776+88+8
CNSTI4 6
ASGNI4
line 157
;157:	s_specifyserver.port.field.maxchars     = 5;
ADDRGP4 s_specifyserver+1776+88+268
CNSTI4 5
ASGNI4
line 159
;158:
;159:	s_specifyserver.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+2140
CNSTI4 6
ASGNI4
line 160
;160:	s_specifyserver.go.generic.name     = SPECIFYSERVER_FIGHT0;
ADDRGP4 s_specifyserver+2140+4
ADDRGP4 $84
ASGNP4
line 161
;161:	s_specifyserver.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyserver+2140+72
CNSTU4 272
ASGNU4
line 162
;162:	s_specifyserver.go.generic.callback = SpecifyServer_Event;
ADDRGP4 s_specifyserver+2140+76
ADDRGP4 SpecifyServer_Event
ASGNP4
line 163
;163:	s_specifyserver.go.generic.id	    = ID_SPECIFYSERVERGO;
ADDRGP4 s_specifyserver+2140+24
CNSTI4 103
ASGNI4
line 164
;164:	s_specifyserver.go.generic.x		= 640 + uis.wideoffset;
ADDRGP4 s_specifyserver+2140+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 165
;165:	s_specifyserver.go.generic.y		= 480-64;
ADDRGP4 s_specifyserver+2140+32
CNSTI4 416
ASGNI4
line 166
;166:	s_specifyserver.go.width  		    = 128;
ADDRGP4 s_specifyserver+2140+104
CNSTI4 128
ASGNI4
line 167
;167:	s_specifyserver.go.height  		    = 64;
ADDRGP4 s_specifyserver+2140+108
CNSTI4 64
ASGNI4
line 168
;168:	s_specifyserver.go.focuspic         = SPECIFYSERVER_FIGHT1;
ADDRGP4 s_specifyserver+2140+88
ADDRGP4 $85
ASGNP4
line 170
;169:
;170:	s_specifyserver.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+2256
CNSTI4 6
ASGNI4
line 171
;171:	s_specifyserver.back.generic.name     = SPECIFYSERVER_BACK0;
ADDRGP4 s_specifyserver+2256+4
ADDRGP4 $82
ASGNP4
line 172
;172:	s_specifyserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyserver+2256+72
CNSTU4 260
ASGNU4
line 173
;173:	s_specifyserver.back.generic.callback = SpecifyServer_Event;
ADDRGP4 s_specifyserver+2256+76
ADDRGP4 SpecifyServer_Event
ASGNP4
line 174
;174:	s_specifyserver.back.generic.id	      = ID_SPECIFYSERVERBACK;
ADDRGP4 s_specifyserver+2256+24
CNSTI4 102
ASGNI4
line 175
;175:	s_specifyserver.back.generic.x		  = 0 - uis.wideoffset;
ADDRGP4 s_specifyserver+2256+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 176
;176:	s_specifyserver.back.generic.y		  = 480-64;
ADDRGP4 s_specifyserver+2256+32
CNSTI4 416
ASGNI4
line 177
;177:	s_specifyserver.back.width  		  = 128;
ADDRGP4 s_specifyserver+2256+104
CNSTI4 128
ASGNI4
line 178
;178:	s_specifyserver.back.height  		  = 64;
ADDRGP4 s_specifyserver+2256+108
CNSTI4 64
ASGNI4
line 179
;179:	s_specifyserver.back.focuspic         = SPECIFYSERVER_BACK1;
ADDRGP4 s_specifyserver+2256+88
ADDRGP4 $83
ASGNP4
line 181
;180:
;181:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.banner );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 182
;182:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.framel );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 183
;183:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.framer );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 184
;184:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.domain );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 185
;185:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.port );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 186
;186:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.go );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+2140
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 187
;187:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.back );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+2256
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 189
;188:
;189:	Com_sprintf( s_specifyserver.port.field.buffer, 6, "%i", 27960 );
ADDRGP4 s_specifyserver+1776+88+12
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 $274
ARGP4
CNSTI4 27960
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 190
;190:}
LABELV $123
endproc SpecifyServer_MenuInit 0 16
export SpecifyServer_Cache
proc SpecifyServer_Cache 4 4
line 198
;191:
;192:/*
;193:=================
;194:SpecifyServer_Cache
;195:=================
;196:*/
;197:void SpecifyServer_Cache( void )
;198:{
line 202
;199:	int	i;
;200:
;201:	// touch all our pics
;202:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 203
;203:	{
line 204
;204:		if (!specifyserver_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyserver_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $280
line 205
;205:			break;
ADDRGP4 $278
JUMPV
LABELV $280
line 206
;206:		trap_R_RegisterShaderNoMip(specifyserver_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyserver_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 207
;207:	}
LABELV $277
line 202
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $278
line 208
;208:}
LABELV $275
endproc SpecifyServer_Cache 4 4
export UI_SpecifyServerMenu
proc UI_SpecifyServerMenu 0 4
line 216
;209:
;210:/*
;211:=================
;212:UI_SpecifyServerMenu
;213:=================
;214:*/
;215:void UI_SpecifyServerMenu( void )
;216:{
line 217
;217:	SpecifyServer_MenuInit();
ADDRGP4 SpecifyServer_MenuInit
CALLV
pop
line 218
;218:	UI_PushMenu( &s_specifyserver.menu );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 219
;219:}
LABELV $282
endproc UI_SpecifyServerMenu 0 4
bss
align 4
LABELV s_specifyserver
skip 2372
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
LABELV $274
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $211
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $205
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $186
byte 1 208
byte 1 144
byte 1 208
byte 1 180
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 58
byte 1 0
align 1
LABELV $180
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $143
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
byte 1 146
byte 1 32
byte 1 208
byte 1 155
byte 1 208
byte 1 174
byte 1 208
byte 1 145
byte 1 208
byte 1 152
byte 1 208
byte 1 156
byte 1 208
byte 1 171
byte 1 208
byte 1 149
byte 1 0
align 1
LABELV $137
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 70
byte 1 65
byte 1 86
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $118
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $107
byte 1 58
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $85
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
LABELV $84
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
LABELV $83
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
LABELV $82
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
LABELV $81
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
LABELV $80
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
