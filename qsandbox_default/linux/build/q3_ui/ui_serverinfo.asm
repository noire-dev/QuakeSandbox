data
align 4
LABELV serverinfo_artlist
address $80
address $81
address $82
address $83
byte 4 0
export Favorites_Add
code
proc Favorites_Add 276 12
file "../../../code/q3_ui/ui_serverinfo.c"
line 45
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define SERVERINFO_FRAMEL	"menu/art/frame2_l"
;6:#define SERVERINFO_FRAMER	"menu/art/frame1_r"
;7:#define SERVERINFO_BACK0	"menu/art/back_0"
;8:#define SERVERINFO_BACK1	"menu/art/back_1"
;9:
;10:static char* serverinfo_artlist[] =
;11:{
;12:	SERVERINFO_FRAMEL,	
;13:	SERVERINFO_FRAMER,
;14:	SERVERINFO_BACK0,
;15:	SERVERINFO_BACK1,
;16:	NULL
;17:};
;18:
;19:#define ID_ADD	 100
;20:#define ID_BACK	 101
;21:
;22:typedef struct
;23:{
;24:	menuframework_s	menu;
;25:	menutext_s		banner;
;26:	menubitmap_s	framel;
;27:	menubitmap_s	framer;
;28:	menubitmap_s	back;
;29:	menutext_s		add;
;30:	char			info[MAX_INFO_STRING];
;31:	int				numlines;
;32:} serverinfo_t;
;33:
;34:static serverinfo_t	s_serverinfo;
;35:
;36:
;37:/*
;38:=================
;39:Favorites_Add
;40:
;41:Add current server to favorites
;42:=================
;43:*/
;44:void Favorites_Add( void )
;45:{
line 51
;46:	char	adrstr[128];
;47:	char	serverbuff[128];
;48:	int		i;
;49:	int		best;
;50:
;51:	trap_Cvar_VariableStringBuffer( "cl_currentServerAddress", serverbuff, sizeof(serverbuff) );
ADDRGP4 $86
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 52
;52:	if (!serverbuff[0])
ADDRLP4 136
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $87
line 53
;53:		return;
ADDRGP4 $85
JUMPV
LABELV $87
line 55
;54:
;55:	best = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 56
;56:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $89
line 57
;57:	{
line 58
;58:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, sizeof(adrstr) );
ADDRGP4 $93
ARGP4
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 59
;59:		if (!Q_stricmp(serverbuff,adrstr))
ADDRLP4 136
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $94
line 60
;60:		{
line 62
;61:			// already in list
;62:			return;
ADDRGP4 $85
JUMPV
LABELV $94
line 66
;63:		}
;64:		
;65:		// use first empty or non-numeric available slot
;66:		if ((adrstr[0]  < '0' || adrstr[0] > '9' ) && !best)
ADDRLP4 272
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 48
LTI4 $98
ADDRLP4 272
INDIRI4
CNSTI4 57
LEI4 $96
LABELV $98
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $96
line 67
;67:			best = i+1;
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
line 68
;68:	}
LABELV $90
line 56
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 32
LTI4 $89
line 70
;69:
;70:	if (best)
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $99
line 71
;71:		trap_Cvar_Set( va("server%d",best), serverbuff);
ADDRGP4 $93
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $99
line 72
;72:}
LABELV $85
endproc Favorites_Add 276 12
proc ServerInfo_Event 8 0
line 81
;73:
;74:
;75:/*
;76:=================
;77:ServerInfo_Event
;78:=================
;79:*/
;80:static void ServerInfo_Event( void* ptr, int event )
;81:{
line 82
;82:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $105
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $108
ADDRGP4 $102
JUMPV
line 83
;83:	{
LABELV $105
line 85
;84:		case ID_ADD:
;85:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $106
line 86
;86:				break;
ADDRGP4 $103
JUMPV
LABELV $106
line 88
;87:		
;88:			Favorites_Add();
ADDRGP4 Favorites_Add
CALLV
pop
line 89
;89:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 90
;90:			break;
ADDRGP4 $103
JUMPV
LABELV $108
line 93
;91:
;92:		case ID_BACK:
;93:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $109
line 94
;94:				break;
ADDRGP4 $103
JUMPV
LABELV $109
line 96
;95:
;96:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 97
;97:			break;
LABELV $102
LABELV $103
line 99
;98:	}
;99:}
LABELV $101
endproc ServerInfo_Event 8 0
proc ServerInfo_MenuDraw 2056 20
line 107
;100:
;101:/*
;102:=================
;103:ServerInfo_MenuDraw
;104:=================
;105:*/
;106:static void ServerInfo_MenuDraw( void )
;107:{
line 113
;108:	const char		*s;
;109:	char			key[MAX_INFO_KEY];
;110:	char			value[MAX_INFO_VALUE];
;111:	int				y;
;112:
;113:	y = 50;
ADDRLP4 1024
CNSTI4 50
ASGNI4
line 114
;114:	s = s_serverinfo.info;
ADDRLP4 1028
ADDRGP4 s_serverinfo+1632
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $113
line 115
;115:	while ( s ) {
line 116
;116:		Info_NextPair( &s, key, value );
ADDRLP4 1028
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 117
;117:		if ( !key[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $116
line 118
;118:			break;
ADDRGP4 $115
JUMPV
LABELV $116
line 121
;119:		}
;120:
;121:		Q_strcat( key, MAX_INFO_KEY, ":" ); 
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $118
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 123
;122:
;123:		UI_DrawString(SCREEN_WIDTH*0.50 - 8,y,key,UI_RIGHT|UI_TINYFONT,color_red);
CNSTI4 312
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 131074
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 124
;124:		UI_DrawString(SCREEN_WIDTH*0.50 + 8,y,value,UI_LEFT|UI_TINYFONT,text_color_normal);
CNSTI4 328
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 131072
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 126
;125:
;126:		y += TINYCHAR_HEIGHT;
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 127
;127:	}
LABELV $114
line 115
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $113
LABELV $115
line 129
;128:
;129:	Menu_Draw( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 130
;130:}
LABELV $111
endproc ServerInfo_MenuDraw 2056 20
proc ServerInfo_MenuKey 4 8
line 138
;131:
;132:/*
;133:=================
;134:ServerInfo_MenuKey
;135:=================
;136:*/
;137:static sfxHandle_t ServerInfo_MenuKey( int key )
;138:{
line 139
;139:	return ( Menu_DefaultKey( &s_serverinfo.menu, key ) );
ADDRGP4 s_serverinfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $120
endproc ServerInfo_MenuKey 4 8
export ServerInfo_Cache
proc ServerInfo_Cache 4 4
line 148
;140:}
;141:
;142:/*
;143:=================
;144:ServerInfo_Cache
;145:=================
;146:*/
;147:void ServerInfo_Cache( void )
;148:{
line 152
;149:	int	i;
;150:
;151:	// touch all our pics
;152:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $122
line 153
;153:	{
line 154
;154:		if (!serverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $126
line 155
;155:			break;
ADDRGP4 $124
JUMPV
LABELV $126
line 156
;156:		trap_R_RegisterShaderNoMip(serverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 157
;157:	}
LABELV $123
line 152
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $124
line 158
;158:}
LABELV $121
endproc ServerInfo_Cache 4 4
export UI_ServerInfoMenu
proc UI_ServerInfoMenu 2060 12
line 166
;159:
;160:/*
;161:=================
;162:UI_ServerInfoMenu
;163:=================
;164:*/
;165:void UI_ServerInfoMenu( void )
;166:{
line 172
;167:	const char		*s;
;168:	char			key[MAX_INFO_KEY];
;169:	char			value[MAX_INFO_VALUE];
;170:
;171:	// zero set all our globals
;172:	memset( &s_serverinfo, 0 ,sizeof(serverinfo_t) );
ADDRGP4 s_serverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2660
ARGI4
ADDRGP4 memset
CALLP4
pop
line 174
;173:
;174:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 176
;175:
;176:	s_serverinfo.menu.draw       = ServerInfo_MenuDraw;
ADDRGP4 s_serverinfo+1036
ADDRGP4 ServerInfo_MenuDraw
ASGNP4
line 177
;177:	s_serverinfo.menu.key        = ServerInfo_MenuKey;
ADDRGP4 s_serverinfo+1040
ADDRGP4 ServerInfo_MenuKey
ASGNP4
line 178
;178:	s_serverinfo.menu.wrapAround = qtrue;
ADDRGP4 s_serverinfo+1044
CNSTI4 1
ASGNI4
line 179
;179:	s_serverinfo.menu.native 	   = qfalse;
ADDRGP4 s_serverinfo+1056
CNSTI4 0
ASGNI4
line 180
;180:	s_serverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_serverinfo+1052
CNSTI4 1
ASGNI4
line 182
;181:
;182:	s_serverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_serverinfo+1076
CNSTI4 10
ASGNI4
line 183
;183:	s_serverinfo.banner.generic.x	  = 320;
ADDRGP4 s_serverinfo+1076+28
CNSTI4 320
ASGNI4
line 184
;184:	s_serverinfo.banner.generic.y	  = 16;
ADDRGP4 s_serverinfo+1076+32
CNSTI4 16
ASGNI4
line 185
;185:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $139
line 186
;186:	s_serverinfo.banner.string		  = "SERVER INFO";
ADDRGP4 s_serverinfo+1076+88
ADDRGP4 $144
ASGNP4
line 187
;187:	}
LABELV $139
line 188
;188:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $145
line 189
;189:	s_serverinfo.banner.string		  = "ИНФОРМАЦИЯ О СЕРВЕРЕ";	
ADDRGP4 s_serverinfo+1076+88
ADDRGP4 $150
ASGNP4
line 190
;190:	}
LABELV $145
line 191
;191:	s_serverinfo.banner.color	      = color_white;
ADDRGP4 s_serverinfo+1076+100
ADDRGP4 color_white
ASGNP4
line 192
;192:	s_serverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_serverinfo+1076+92
CNSTI4 1
ASGNI4
line 194
;193:
;194:	s_serverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+1180
CNSTI4 6
ASGNI4
line 195
;195:	s_serverinfo.framel.generic.name  = SERVERINFO_FRAMEL;
ADDRGP4 s_serverinfo+1180+4
ADDRGP4 $80
ASGNP4
line 196
;196:	s_serverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+1180+72
CNSTU4 16384
ASGNU4
line 197
;197:	s_serverinfo.framel.generic.x	  = 0;  
ADDRGP4 s_serverinfo+1180+28
CNSTI4 0
ASGNI4
line 198
;198:	s_serverinfo.framel.generic.y	  = 78;
ADDRGP4 s_serverinfo+1180+32
CNSTI4 78
ASGNI4
line 199
;199:	s_serverinfo.framel.width  	      = 256;
ADDRGP4 s_serverinfo+1180+104
CNSTI4 256
ASGNI4
line 200
;200:	s_serverinfo.framel.height  	  = 329;
ADDRGP4 s_serverinfo+1180+108
CNSTI4 329
ASGNI4
line 202
;201:
;202:	s_serverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+1296
CNSTI4 6
ASGNI4
line 203
;203:	s_serverinfo.framer.generic.name  = SERVERINFO_FRAMER;
ADDRGP4 s_serverinfo+1296+4
ADDRGP4 $81
ASGNP4
line 204
;204:	s_serverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+1296+72
CNSTU4 16384
ASGNU4
line 205
;205:	s_serverinfo.framer.generic.x	  = 376;
ADDRGP4 s_serverinfo+1296+28
CNSTI4 376
ASGNI4
line 206
;206:	s_serverinfo.framer.generic.y	  = 76;
ADDRGP4 s_serverinfo+1296+32
CNSTI4 76
ASGNI4
line 207
;207:	s_serverinfo.framer.width  	      = 256;
ADDRGP4 s_serverinfo+1296+104
CNSTI4 256
ASGNI4
line 208
;208:	s_serverinfo.framer.height  	  = 334;
ADDRGP4 s_serverinfo+1296+108
CNSTI4 334
ASGNI4
line 210
;209:
;210:	s_serverinfo.add.generic.type	  = MTYPE_PTEXT;
ADDRGP4 s_serverinfo+1528
CNSTI4 9
ASGNI4
line 211
;211:	s_serverinfo.add.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+1528+72
CNSTU4 264
ASGNU4
line 212
;212:	s_serverinfo.add.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+1528+76
ADDRGP4 ServerInfo_Event
ASGNP4
line 213
;213:	s_serverinfo.add.generic.id	      = ID_ADD;
ADDRGP4 s_serverinfo+1528+24
CNSTI4 100
ASGNI4
line 214
;214:	s_serverinfo.add.generic.x		  = 320;
ADDRGP4 s_serverinfo+1528+28
CNSTI4 320
ASGNI4
line 215
;215:	s_serverinfo.add.generic.y		  = 450;
ADDRGP4 s_serverinfo+1528+32
CNSTI4 450
ASGNI4
line 216
;216:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $192
line 217
;217:		s_serverinfo.add.string  		  = "ADD TO FAVORITES";
ADDRGP4 s_serverinfo+1528+88
ADDRGP4 $197
ASGNP4
line 218
;218:	}
LABELV $192
line 219
;219:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $198
line 220
;220:		s_serverinfo.add.string  		  = "ДОБАВИТЬ В СПИСОК ЛЮБИМЫХ";
ADDRGP4 s_serverinfo+1528+88
ADDRGP4 $203
ASGNP4
line 221
;221:	}
LABELV $198
line 222
;222:	s_serverinfo.add.style  		  = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_serverinfo+1528+92
CNSTI4 17
ASGNI4
line 223
;223:	s_serverinfo.add.color			  =	color_red;
ADDRGP4 s_serverinfo+1528+100
ADDRGP4 color_red
ASGNP4
line 224
;224:	if( trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $210
ARGP4
ADDRLP4 2052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 2052
INDIRF4
CNSTF4 0
EQF4 $208
line 225
;225:		s_serverinfo.add.generic.flags |= QMF_GRAYED;
ADDRLP4 2056
ADDRGP4 s_serverinfo+1528+72
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 226
;226:	}
LABELV $208
line 228
;227:
;228:	s_serverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+1412
CNSTI4 6
ASGNI4
line 229
;229:	s_serverinfo.back.generic.name     = SERVERINFO_BACK0;
ADDRGP4 s_serverinfo+1412+4
ADDRGP4 $82
ASGNP4
line 230
;230:	s_serverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+1412+72
CNSTU4 260
ASGNU4
line 231
;231:	s_serverinfo.back.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+1412+76
ADDRGP4 ServerInfo_Event
ASGNP4
line 232
;232:	s_serverinfo.back.generic.id	   = ID_BACK;
ADDRGP4 s_serverinfo+1412+24
CNSTI4 101
ASGNI4
line 233
;233:	s_serverinfo.back.generic.x		   = 0-uis.wideoffset;
ADDRGP4 s_serverinfo+1412+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 234
;234:	s_serverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_serverinfo+1412+32
CNSTI4 416
ASGNI4
line 235
;235:	s_serverinfo.back.width  		   = 128;
ADDRGP4 s_serverinfo+1412+104
CNSTI4 128
ASGNI4
line 236
;236:	s_serverinfo.back.height  		   = 64;
ADDRGP4 s_serverinfo+1412+108
CNSTI4 64
ASGNI4
line 237
;237:	s_serverinfo.back.focuspic         = SERVERINFO_BACK1;
ADDRGP4 s_serverinfo+1412+88
ADDRGP4 $83
ASGNP4
line 239
;238:
;239:	trap_GetConfigString( CS_SERVERINFO, s_serverinfo.info, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRGP4 s_serverinfo+1632
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 241
;240:
;241:	s_serverinfo.numlines = 0;
ADDRGP4 s_serverinfo+2656
CNSTI4 0
ASGNI4
line 242
;242:	s = s_serverinfo.info;
ADDRLP4 0
ADDRGP4 s_serverinfo+1632
ASGNP4
ADDRGP4 $237
JUMPV
LABELV $236
line 243
;243:	while ( s ) {
line 244
;244:		Info_NextPair( &s, key, value );
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 245
;245:		if ( !key[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $239
line 246
;246:			break;
ADDRGP4 $238
JUMPV
LABELV $239
line 248
;247:		}
;248:		s_serverinfo.numlines++;
ADDRLP4 2056
ADDRGP4 s_serverinfo+2656
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 249
;249:	}
LABELV $237
line 243
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
LABELV $238
line 251
;250:
;251:	if (s_serverinfo.numlines > 16)
ADDRGP4 s_serverinfo+2656
INDIRI4
CNSTI4 16
LEI4 $242
line 252
;252:		s_serverinfo.numlines = 16;
ADDRGP4 s_serverinfo+2656
CNSTI4 16
ASGNI4
LABELV $242
line 254
;253:
;254:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.banner );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 255
;255:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framel );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 256
;256:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framer );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 257
;257:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.add );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+1528
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 258
;258:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.back );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 260
;259:
;260:	UI_PushMenu( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 261
;261:}
LABELV $128
endproc UI_ServerInfoMenu 2060 12
bss
align 4
LABELV s_serverinfo
skip 2660
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
LABELV $210
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $203
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
byte 1 161
byte 1 208
byte 1 159
byte 1 208
byte 1 152
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 154
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
byte 1 165
byte 1 0
align 1
LABELV $197
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
LABELV $150
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 164
byte 1 208
byte 1 158
byte 1 208
byte 1 160
byte 1 208
byte 1 156
byte 1 208
byte 1 144
byte 1 208
byte 1 166
byte 1 208
byte 1 152
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 158
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 146
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 0
align 1
LABELV $144
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $118
byte 1 58
byte 1 0
align 1
LABELV $93
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $86
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
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
