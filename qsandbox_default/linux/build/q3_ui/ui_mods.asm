code
proc UI_Mods_MenuEvent 8 8
file "../../../code/q3_ui/ui_mods.c"
line 51
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define ART_BACK0			"menu/art/back_0"
;6:#define ART_BACK1			"menu/art/back_1"	
;7:#define ART_FIGHT0			"menu/art/load_0"
;8:#define ART_FIGHT1			"menu/art/load_1"
;9:#define ART_FRAMEL			"menu/art/frame2_l"
;10:#define ART_FRAMER			"menu/art/frame1_r"
;11:
;12:#define MAX_MODS			256
;13:#define NAMEBUFSIZE			( MAX_MODS * 48 )
;14:#define GAMEBUFSIZE			( MAX_MODS * 16 )
;15:
;16:#define ID_BACK				10
;17:#define ID_GO				11
;18:#define ID_LIST				12
;19:
;20:
;21:typedef struct {
;22:	menuframework_s	menu;
;23:
;24:	menutext_s		banner;
;25:	menubitmap_s	framel;
;26:	menubitmap_s	framer;
;27:
;28:	menulist_s		list;
;29:
;30:	menubitmap_s	back;
;31:	menubitmap_s	go;
;32:
;33:	char			description[NAMEBUFSIZE];
;34:	char			fs_game[GAMEBUFSIZE];
;35:
;36:	char			*descriptionPtr;
;37:	char			*fs_gamePtr;
;38:
;39:	char			*descriptionList[MAX_MODS];
;40:	char			*fs_gameList[MAX_MODS];
;41:} mods_t;
;42:
;43:static mods_t	s_mods;
;44:
;45:
;46:/*
;47:===============
;48:UI_Mods_MenuEvent
;49:===============
;50:*/
;51:static void UI_Mods_MenuEvent( void *ptr, int event ) {
line 52
;52:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 53
;53:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 56
;54:	}
;55:
;56:	switch ( ((menucommon_s*)ptr)->id ) {
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
EQI4 $93
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $87
ADDRGP4 $84
JUMPV
LABELV $87
line 58
;57:	case ID_GO:
;58:		trap_Cvar_Set( "fs_game", s_mods.fs_gameList[s_mods.list.curvalue] );
ADDRGP4 $88
ARGP4
ADDRGP4 s_mods+1412+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+19192
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 59
;59:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $92
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 60
;60:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 61
;61:		break;
ADDRGP4 $85
JUMPV
LABELV $93
line 64
;62:
;63:	case ID_BACK:
;64:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 65
;65:		break;
LABELV $84
LABELV $85
line 67
;66:	}
;67:}
LABELV $81
endproc UI_Mods_MenuEvent 8 8
proc UI_Mods_ParseInfos 20 12
line 75
;68:
;69:
;70:/*
;71:===============
;72:UI_Mods_ParseInfos
;73:===============
;74:*/
;75:static void UI_Mods_ParseInfos( char *modDir, char *modDesc ) {
line 76
;76:	s_mods.fs_gameList[s_mods.list.numitems] = s_mods.fs_gamePtr;
ADDRGP4 s_mods+1412+96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+19192
ADDP4
ADDRGP4 s_mods+18164
INDIRP4
ASGNP4
line 77
;77:	Q_strncpyz( s_mods.fs_gamePtr, modDir, 16 );
ADDRGP4 s_mods+18164
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 79
;78:
;79:	s_mods.descriptionList[s_mods.list.numitems] = s_mods.descriptionPtr;
ADDRGP4 s_mods+1412+96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+18168
ADDP4
ADDRGP4 s_mods+18160
INDIRP4
ASGNP4
line 80
;80:	Q_strncpyz( s_mods.descriptionPtr, modDesc, 48 );
ADDRGP4 s_mods+18160
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 48
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 82
;81:
;82:	s_mods.list.itemnames[s_mods.list.numitems] = s_mods.descriptionPtr;
ADDRGP4 s_mods+1412+96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+1412+104
INDIRP4
ADDP4
ADDRGP4 s_mods+18160
INDIRP4
ASGNP4
line 83
;83:	s_mods.descriptionPtr += strlen( s_mods.descriptionPtr ) + 1;
ADDRGP4 s_mods+18160
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRGP4 s_mods+18160
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 84
;84:	s_mods.fs_gamePtr += strlen( s_mods.fs_gamePtr ) + 1;
ADDRGP4 s_mods+18164
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRGP4 s_mods+18164
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 85
;85:	s_mods.list.numitems++;
ADDRLP4 16
ADDRGP4 s_mods+1412+96
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 86
;86:}
LABELV $94
endproc UI_Mods_ParseInfos 20 12
proc UI_Mods_LoadMods 2084 16
line 130
;87:
;88:
;89:#if 0 // bk001204 - unused
;90:/*
;91:===============
;92:UI_Mods_LoadModsFromFile
;93:===============
;94:*/
;95:static void UI_Mods_LoadModsFromFile( char *filename ) {
;96:	int				len;
;97:	fileHandle_t	f;
;98:	char			buf[1024];
;99:
;100:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;101:	if ( !f ) {
;102:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
;103:		return;
;104:	}
;105:	if ( len >= sizeof(buf) ) {
;106:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, sizeof(buf) ) );
;107:		trap_FS_FCloseFile( f );
;108:		return;
;109:	}
;110:
;111:	trap_FS_Read( buf, len, f );
;112:	buf[len] = 0;
;113:	trap_FS_FCloseFile( f );
;114:
;115:	len = strlen( filename );
;116:	if( !Q_stricmp(filename +  len - 4,".mod") ) {
;117:		filename[len-4] = '\0';
;118:	}
;119:
;120:	UI_Mods_ParseInfos( filename, buf );
;121:}
;122:#endif
;123:
;124:
;125:/*
;126:===============
;127:UI_Mods_LoadMods
;128:===============
;129:*/
;130:static void UI_Mods_LoadMods( void ) {
line 138
;131:	int		numdirs;
;132:	char	dirlist[2048];
;133:	char	*dirptr;
;134:  char  *descptr;
;135:	int		i;
;136:	int		dirlen;
;137:
;138:	s_mods.list.itemnames = (const char **)s_mods.descriptionList;
ADDRGP4 s_mods+1412+104
ADDRGP4 s_mods+18168
ASGNP4
line 139
;139:	s_mods.descriptionPtr = s_mods.description;
ADDRGP4 s_mods+18160
ADDRGP4 s_mods+1776
ASGNP4
line 140
;140:	s_mods.fs_gamePtr = s_mods.fs_game;
ADDRGP4 s_mods+18164
ADDRGP4 s_mods+14064
ASGNP4
line 143
;141:
;142:	// always start off with QSandbox
;143:	s_mods.list.numitems = 1;
ADDRGP4 s_mods+1412+96
CNSTI4 1
ASGNI4
line 144
;144:	s_mods.list.itemnames[0] = s_mods.descriptionList[0] = "QSandbox";
ADDRLP4 2068
ADDRGP4 $129
ASGNP4
ADDRGP4 s_mods+18168
ADDRLP4 2068
INDIRP4
ASGNP4
ADDRGP4 s_mods+1412+104
INDIRP4
ADDRLP4 2068
INDIRP4
ASGNP4
line 145
;145:	s_mods.fs_gameList[0] = "";
ADDRGP4 s_mods+19192
ADDRGP4 $131
ASGNP4
line 147
;146:
;147:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $132
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2072
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2072
INDIRI4
ASGNI4
line 148
;148:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 149
;149:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $133
line 150
;150:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2076
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 151
;151:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 152
;152:  	UI_Mods_ParseInfos( dirptr, descptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_Mods_ParseInfos
CALLV
pop
line 153
;153:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 154
;154:	}
LABELV $134
line 149
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $136
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $133
line 156
;155:
;156:	trap_Print( va( "%i content packs parsed\n", s_mods.list.numitems ) );
ADDRGP4 $137
ARGP4
ADDRGP4 s_mods+1412+96
INDIRI4
ARGI4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 157
;157:	if (s_mods.list.numitems > MAX_MODS) {
ADDRGP4 s_mods+1412+96
INDIRI4
CNSTI4 256
LEI4 $140
line 158
;158:		s_mods.list.numitems = MAX_MODS;
ADDRGP4 s_mods+1412+96
CNSTI4 256
ASGNI4
line 159
;159:	}
LABELV $140
line 160
;160:}
LABELV $116
endproc UI_Mods_LoadMods 2084 16
proc UI_Mods_MenuInit 0 12
line 168
;161:
;162:
;163:/*
;164:===============
;165:UI_Mods_MenuInit
;166:===============
;167:*/
;168:static void UI_Mods_MenuInit( void ) {
line 169
;169:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 171
;170:
;171:	memset( &s_mods, 0 ,sizeof(mods_t) );
ADDRGP4 s_mods
ARGP4
CNSTI4 0
ARGI4
CNSTI4 20216
ARGI4
ADDRGP4 memset
CALLP4
pop
line 172
;172:	s_mods.menu.wrapAround = qtrue;
ADDRGP4 s_mods+1044
CNSTI4 1
ASGNI4
line 173
;173:	s_mods.menu.native 	   = qfalse;
ADDRGP4 s_mods+1056
CNSTI4 0
ASGNI4
line 174
;174:	s_mods.menu.fullscreen = qtrue;
ADDRGP4 s_mods+1052
CNSTI4 1
ASGNI4
line 176
;175:
;176:	s_mods.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_mods+1076
CNSTI4 10
ASGNI4
line 177
;177:	s_mods.banner.generic.x			= 320;
ADDRGP4 s_mods+1076+28
CNSTI4 320
ASGNI4
line 178
;178:	s_mods.banner.generic.y			= 16;
ADDRGP4 s_mods+1076+32
CNSTI4 16
ASGNI4
line 179
;179:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $155
line 180
;180:	s_mods.banner.string			= "GAMES";
ADDRGP4 s_mods+1076+88
ADDRGP4 $160
ASGNP4
line 181
;181:	}
LABELV $155
line 182
;182:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $161
line 183
;183:	s_mods.banner.string			= "ИГРЫ";
ADDRGP4 s_mods+1076+88
ADDRGP4 $166
ASGNP4
line 184
;184:	}
LABELV $161
line 185
;185:	s_mods.banner.color				= color_white;
ADDRGP4 s_mods+1076+100
ADDRGP4 color_white
ASGNP4
line 186
;186:	s_mods.banner.style				= UI_CENTER;
ADDRGP4 s_mods+1076+92
CNSTI4 1
ASGNI4
line 188
;187:
;188:	s_mods.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+1180
CNSTI4 6
ASGNI4
line 189
;189:	s_mods.framel.generic.name		= ART_FRAMEL;
ADDRGP4 s_mods+1180+4
ADDRGP4 $174
ASGNP4
line 190
;190:	s_mods.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mods+1180+72
CNSTU4 16384
ASGNU4
line 191
;191:	s_mods.framel.generic.x			= 0;  
ADDRGP4 s_mods+1180+28
CNSTI4 0
ASGNI4
line 192
;192:	s_mods.framel.generic.y			= 78;
ADDRGP4 s_mods+1180+32
CNSTI4 78
ASGNI4
line 193
;193:	s_mods.framel.width				= 256;
ADDRGP4 s_mods+1180+104
CNSTI4 256
ASGNI4
line 194
;194:	s_mods.framel.height			= 329;
ADDRGP4 s_mods+1180+108
CNSTI4 329
ASGNI4
line 196
;195:
;196:	s_mods.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+1296
CNSTI4 6
ASGNI4
line 197
;197:	s_mods.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_mods+1296+4
ADDRGP4 $188
ASGNP4
line 198
;198:	s_mods.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mods+1296+72
CNSTU4 16384
ASGNU4
line 199
;199:	s_mods.framer.generic.x			= 376;
ADDRGP4 s_mods+1296+28
CNSTI4 376
ASGNI4
line 200
;200:	s_mods.framer.generic.y			= 76;
ADDRGP4 s_mods+1296+32
CNSTI4 76
ASGNI4
line 201
;201:	s_mods.framer.width				= 256;
ADDRGP4 s_mods+1296+104
CNSTI4 256
ASGNI4
line 202
;202:	s_mods.framer.height			= 334;
ADDRGP4 s_mods+1296+108
CNSTI4 334
ASGNI4
line 204
;203:
;204:	s_mods.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+1544
CNSTI4 6
ASGNI4
line 205
;205:	s_mods.back.generic.name		= ART_BACK0;
ADDRGP4 s_mods+1544+4
ADDRGP4 $202
ASGNP4
line 206
;206:	s_mods.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mods+1544+72
CNSTU4 260
ASGNU4
line 207
;207:	s_mods.back.generic.id			= ID_BACK;
ADDRGP4 s_mods+1544+24
CNSTI4 10
ASGNI4
line 208
;208:	s_mods.back.generic.callback	= UI_Mods_MenuEvent;
ADDRGP4 s_mods+1544+76
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 209
;209:	s_mods.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 s_mods+1544+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 210
;210:	s_mods.back.generic.y			= 480-64;
ADDRGP4 s_mods+1544+32
CNSTI4 416
ASGNI4
line 211
;211:	s_mods.back.width				= 128;
ADDRGP4 s_mods+1544+104
CNSTI4 128
ASGNI4
line 212
;212:	s_mods.back.height				= 64;
ADDRGP4 s_mods+1544+108
CNSTI4 64
ASGNI4
line 213
;213:	s_mods.back.focuspic			= ART_BACK1;
ADDRGP4 s_mods+1544+88
ADDRGP4 $220
ASGNP4
line 215
;214:
;215:	s_mods.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_mods+1660
CNSTI4 6
ASGNI4
line 216
;216:	s_mods.go.generic.name			= ART_FIGHT0;
ADDRGP4 s_mods+1660+4
ADDRGP4 $224
ASGNP4
line 217
;217:	s_mods.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mods+1660+72
CNSTU4 272
ASGNU4
line 218
;218:	s_mods.go.generic.id			= ID_GO;
ADDRGP4 s_mods+1660+24
CNSTI4 11
ASGNI4
line 219
;219:	s_mods.go.generic.callback		= UI_Mods_MenuEvent;
ADDRGP4 s_mods+1660+76
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 220
;220:	s_mods.go.generic.x				= 640 + uis.wideoffset;
ADDRGP4 s_mods+1660+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 221
;221:	s_mods.go.generic.y				= 480-64;
ADDRGP4 s_mods+1660+32
CNSTI4 416
ASGNI4
line 222
;222:	s_mods.go.width					= 128;
ADDRGP4 s_mods+1660+104
CNSTI4 128
ASGNI4
line 223
;223:	s_mods.go.height				= 64;
ADDRGP4 s_mods+1660+108
CNSTI4 64
ASGNI4
line 224
;224:	s_mods.go.focuspic				= ART_FIGHT1;
ADDRGP4 s_mods+1660+88
ADDRGP4 $242
ASGNP4
line 227
;225:
;226:	// scan for mods
;227:	s_mods.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_mods+1412
CNSTI4 8
ASGNI4
line 228
;228:	s_mods.list.generic.flags		= QMF_PULSEIFFOCUS|QMF_CENTER_JUSTIFY;
ADDRGP4 s_mods+1412+72
CNSTU4 264
ASGNU4
line 229
;229:	s_mods.list.generic.callback	= UI_Mods_MenuEvent;
ADDRGP4 s_mods+1412+76
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 230
;230:	s_mods.list.generic.id			= ID_LIST;
ADDRGP4 s_mods+1412+24
CNSTI4 12
ASGNI4
line 231
;231:	s_mods.list.generic.x			= 320;
ADDRGP4 s_mods+1412+28
CNSTI4 320
ASGNI4
line 232
;232:	s_mods.list.generic.y			= 130;
ADDRGP4 s_mods+1412+32
CNSTI4 130
ASGNI4
line 233
;233:	s_mods.list.width				= 48;
ADDRGP4 s_mods+1412+112
CNSTI4 48
ASGNI4
line 234
;234:	s_mods.list.height				= 14;
ADDRGP4 s_mods+1412+116
CNSTI4 14
ASGNI4
line 236
;235:
;236:	UI_Mods_LoadMods();
ADDRGP4 UI_Mods_LoadMods
CALLV
pop
line 238
;237:
;238:	Menu_AddItem( &s_mods.menu, &s_mods.banner );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 239
;239:	Menu_AddItem( &s_mods.menu, &s_mods.framel );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 240
;240:	Menu_AddItem( &s_mods.menu, &s_mods.framer );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 241
;241:	Menu_AddItem( &s_mods.menu, &s_mods.list );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 242
;242:	Menu_AddItem( &s_mods.menu, &s_mods.back );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 243
;243:	Menu_AddItem( &s_mods.menu, &s_mods.go );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+1660
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 244
;244:}
LABELV $146
endproc UI_Mods_MenuInit 0 12
export UI_ModsMenu_Cache
proc UI_ModsMenu_Cache 0 4
line 251
;245:
;246:/*
;247:=================
;248:UI_Mods_Cache
;249:=================
;250:*/
;251:void UI_ModsMenu_Cache( void ) {
line 252
;252:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $202
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 253
;253:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $220
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 254
;254:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $224
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 255
;255:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $242
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 256
;256:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $174
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 257
;257:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $188
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 258
;258:}
LABELV $264
endproc UI_ModsMenu_Cache 0 4
export UI_ModsMenu
proc UI_ModsMenu 0 4
line 266
;259:
;260:
;261:/*
;262:===============
;263:UI_ModsMenu
;264:===============
;265:*/
;266:void UI_ModsMenu( void ) {
line 267
;267:	UI_Mods_MenuInit();
ADDRGP4 UI_Mods_MenuInit
CALLV
pop
line 268
;268:	UI_PushMenu( &s_mods.menu );
ADDRGP4 s_mods
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 269
;269:}
LABELV $265
endproc UI_ModsMenu 0 4
bss
align 4
LABELV s_mods
skip 20216
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
LABELV $242
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
LABELV $224
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
LABELV $220
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
LABELV $202
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
LABELV $188
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
LABELV $174
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
LABELV $166
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $160
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $137
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 0
align 1
LABELV $129
byte 1 81
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $92
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $88
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
