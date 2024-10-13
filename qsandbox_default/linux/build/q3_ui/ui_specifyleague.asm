data
align 4
LABELV specifyleague_artlist
address $80
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
byte 4 0
code
proc SpecifyLeague_GetList 100 12
file "../../../code/q3_ui/ui_specifyleague.c"
line 74
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*********************************************************************************
;6:	SPECIFY SERVER
;7:*********************************************************************************/
;8:
;9:#define MAX_LISTBOXITEMS		128
;10:#define MAX_LISTBOXWIDTH		40
;11:#define MAX_LEAGUENAME			80
;12:
;13:#define SPECIFYLEAGUE_FRAMEL	"menu/art/frame2_l"
;14:#define SPECIFYLEAGUE_FRAMER	"menu/art/frame1_r"
;15:#define SPECIFYLEAGUE_BACK0		"menu/art/back_0"
;16:#define SPECIFYLEAGUE_BACK1		"menu/art/back_1"
;17:#define SPECIFYLEAGUE_ARROWS0	"menu/art/arrows_vert_0"
;18:#define SPECIFYLEAGUE_UP		"menu/art/arrows_vert_top"
;19:#define SPECIFYLEAGUE_DOWN		"menu/art/arrows_vert_bot"
;20:#define GLOBALRANKINGS_LOGO		"menu/art/gr/grlogo"
;21:#define GLOBALRANKINGS_LETTERS	"menu/art/gr/grletters"
;22:
;23:#define ID_SPECIFYLEAGUENAME	100
;24:#define ID_SPECIFYLEAGUELIST	101
;25:#define ID_SPECIFYLEAGUEUP		102
;26:#define ID_SPECIFYLEAGUEDOWN	103
;27:#define ID_SPECIFYLEAGUEBACK	104
;28:
;29:static char* specifyleague_artlist[] =
;30:{
;31:	SPECIFYLEAGUE_FRAMEL,
;32:	SPECIFYLEAGUE_FRAMER,
;33:	SPECIFYLEAGUE_ARROWS0,	
;34:	SPECIFYLEAGUE_UP,	
;35:	SPECIFYLEAGUE_DOWN,	
;36:	SPECIFYLEAGUE_BACK0,	
;37:	SPECIFYLEAGUE_BACK1,
;38:	GLOBALRANKINGS_LOGO,
;39:	GLOBALRANKINGS_LETTERS,
;40:	NULL
;41:};
;42:
;43:static char playername[80];
;44:
;45:typedef struct
;46:{
;47:	menuframework_s	menu;
;48:	menutext_s		banner;
;49:	menubitmap_s	framel;
;50:	menubitmap_s	framer;
;51:	menufield_s		rankname;
;52:	menulist_s		list;
;53:	menubitmap_s	arrows;
;54:	menubitmap_s	up;
;55:	menubitmap_s	down;
;56:	menubitmap_s	back;
;57:	menubitmap_s	grlogo;
;58:	menubitmap_s	grletters;
;59:} specifyleague_t;
;60:
;61:static specifyleague_t	s_specifyleague;
;62:
;63:
;64:typedef struct {
;65:	char			buff[MAX_LISTBOXWIDTH];
;66:	char			leaguename[MAX_LEAGUENAME];
;67:} table_t;
;68:
;69:table_t league_table[MAX_LISTBOXITEMS];
;70:char *leaguename_items[MAX_LISTBOXITEMS];
;71:
;72:
;73:static void SpecifyLeague_GetList()
;74:{
line 75
;75:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 78
;76:	int i;
;77:	/* The Player Name has changed. We need to perform another search */
;78:	Q_strncpyz( playername,
ADDRGP4 playername
ARGP4
ADDRGP4 s_specifyleague+1412+88+12
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 82
;79:		s_specifyleague.rankname.field.buffer, 
;80:		sizeof(playername) );
;81:
;82:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 84
;83:
;84:	for(i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $98
JUMPV
LABELV $95
line 85
;85:	{
line 88
;86:		char	s[MAX_LEAGUENAME];
;87:		const char	*var;
;88:		var = va( "leaguename%i", i+1 );
ADDRGP4 $99
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 88
ADDRLP4 92
INDIRP4
ASGNP4
line 89
;89:		trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 90
;90:		Q_strncpyz(league_table[i].leaguename, s, sizeof(league_table[i].leaguename) );
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table+40
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 91
;91:		Q_strncpyz(league_table[i].buff, league_table[i].leaguename, sizeof(league_table[i].buff) );
ADDRLP4 96
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 96
INDIRI4
ADDRGP4 league_table
ADDP4
ARGP4
ADDRLP4 96
INDIRI4
ADDRGP4 league_table+40
ADDP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 92
;92:	}
LABELV $96
line 84
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $98
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $95
line 94
;93:
;94:	s_specifyleague.list.numitems = count;
ADDRGP4 s_specifyleague+1776+96
ADDRLP4 4
INDIRI4
ASGNI4
line 95
;95:}
LABELV $91
endproc SpecifyLeague_GetList 100 12
proc SpecifyLeague_Event 16 12
line 103
;96:
;97:/*
;98:=================
;99:SpecifyLeague_Event
;100:=================
;101:*/
;102:static void SpecifyLeague_Event( void* ptr, int event )
;103:{
line 105
;104:	int		id;
;105:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 110
;106:	//if( event != QM_ACTIVATED && id != ID_SPECIFYLEAGUELIST ) {
;107:	//	return;
;108:	//}
;109:
;110:	switch (id)
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 100
LTI4 $106
ADDRLP4 4
INDIRI4
CNSTI4 104
GTI4 $106
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $135-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $135
address $119
address $108
address $111
address $115
address $128
code
line 111
;111:	{
LABELV $108
line 113
;112:		case ID_SPECIFYLEAGUELIST:
;113:			if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $107
line 115
;114:				//ArenaServers_UpdatePicture();
;115:			}
line 116
;116:		break;
ADDRGP4 $107
JUMPV
LABELV $111
line 119
;117:
;118:		case ID_SPECIFYLEAGUEUP:
;119:			if( event == QM_ACTIVATED )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $107
line 120
;120:				ScrollList_Key( &s_specifyleague.list, K_UPARROW );
ADDRGP4 s_specifyleague+1776
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 121
;121:		break;		
ADDRGP4 $107
JUMPV
LABELV $115
line 124
;122:	
;123:		case ID_SPECIFYLEAGUEDOWN:
;124:			if( event == QM_ACTIVATED )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $107
line 125
;125:				ScrollList_Key( &s_specifyleague.list, K_DOWNARROW );
ADDRGP4 s_specifyleague+1776
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 126
;126:		break;
ADDRGP4 $107
JUMPV
LABELV $119
line 129
;127:			
;128:		case ID_SPECIFYLEAGUENAME:
;129:			if( (event == QM_LOSTFOCUS) && 
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $107
ADDRGP4 s_specifyleague+1412+88+12
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 playername
ARGP4
ADDRGP4 s_specifyleague+1412+88+12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $107
line 133
;130:				(Q_strncmp(playername, 
;131:					s_specifyleague.rankname.field.buffer, 
;132:					strlen(s_specifyleague.rankname.field.buffer)) != 0))
;133:			{
line 134
;134:				SpecifyLeague_GetList();
ADDRGP4 SpecifyLeague_GetList
CALLV
pop
line 135
;135:			}
line 136
;136:		break;
ADDRGP4 $107
JUMPV
LABELV $128
line 139
;137:
;138:		case ID_SPECIFYLEAGUEBACK:
;139:			if( event == QM_ACTIVATED )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $107
line 140
;140:			{
line 141
;141:				trap_Cvar_Set( "sv_leagueName", league_table[s_specifyleague.list.curvalue].leaguename);
ADDRGP4 $131
ARGP4
CNSTI4 120
ADDRGP4 s_specifyleague+1776+92
INDIRI4
MULI4
ADDRGP4 league_table+40
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 142
;142:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 143
;143:			}
line 144
;144:		break;
LABELV $106
LABELV $107
line 146
;145:	}
;146:}
LABELV $105
endproc SpecifyLeague_Event 16 12
export SpecifyLeague_MenuInit
proc SpecifyLeague_MenuInit 12 12
line 154
;147:
;148:/*
;149:=================
;150:SpecifyLeague_MenuInit
;151:=================
;152:*/
;153:void SpecifyLeague_MenuInit( void )
;154:{
line 157
;155:	int i;
;156:	// zero set all our globals
;157:	memset( &s_specifyleague, 0 ,sizeof(specifyleague_t) );
ADDRGP4 s_specifyleague
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2604
ARGI4
ADDRGP4 memset
CALLP4
pop
line 159
;158:
;159:	SpecifyLeague_Cache();
ADDRGP4 SpecifyLeague_Cache
CALLV
pop
line 161
;160:
;161:	s_specifyleague.menu.wrapAround = qtrue;
ADDRGP4 s_specifyleague+1044
CNSTI4 1
ASGNI4
line 162
;162:	s_specifyleague.menu.native 	   = qfalse;
ADDRGP4 s_specifyleague+1056
CNSTI4 0
ASGNI4
line 163
;163:	s_specifyleague.menu.fullscreen = qtrue;
ADDRGP4 s_specifyleague+1052
CNSTI4 1
ASGNI4
line 165
;164:
;165:	s_specifyleague.banner.generic.type	 = MTYPE_BTEXT;
ADDRGP4 s_specifyleague+1076
CNSTI4 10
ASGNI4
line 166
;166:	s_specifyleague.banner.generic.x     = 320;
ADDRGP4 s_specifyleague+1076+28
CNSTI4 320
ASGNI4
line 167
;167:	s_specifyleague.banner.generic.y     = 16;
ADDRGP4 s_specifyleague+1076+32
CNSTI4 16
ASGNI4
line 168
;168:	s_specifyleague.banner.string		 = "CHOOSE LEAGUE";
ADDRGP4 s_specifyleague+1076+88
ADDRGP4 $148
ASGNP4
line 169
;169:	s_specifyleague.banner.color  		 = color_white;
ADDRGP4 s_specifyleague+1076+100
ADDRGP4 color_white
ASGNP4
line 170
;170:	s_specifyleague.banner.style  		 = UI_CENTER;
ADDRGP4 s_specifyleague+1076+92
CNSTI4 1
ASGNI4
line 172
;171:
;172:	s_specifyleague.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1180
CNSTI4 6
ASGNI4
line 173
;173:	s_specifyleague.framel.generic.name  = SPECIFYLEAGUE_FRAMEL;
ADDRGP4 s_specifyleague+1180+4
ADDRGP4 $80
ASGNP4
line 174
;174:	s_specifyleague.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyleague+1180+72
CNSTU4 16384
ASGNU4
line 175
;175:	s_specifyleague.framel.generic.x	 = 0;  
ADDRGP4 s_specifyleague+1180+28
CNSTI4 0
ASGNI4
line 176
;176:	s_specifyleague.framel.generic.y	 = 78;
ADDRGP4 s_specifyleague+1180+32
CNSTI4 78
ASGNI4
line 177
;177:	s_specifyleague.framel.width  	     = 256;
ADDRGP4 s_specifyleague+1180+104
CNSTI4 256
ASGNI4
line 178
;178:	s_specifyleague.framel.height  	     = 334;
ADDRGP4 s_specifyleague+1180+108
CNSTI4 334
ASGNI4
line 180
;179:
;180:	s_specifyleague.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1296
CNSTI4 6
ASGNI4
line 181
;181:	s_specifyleague.framer.generic.name  = SPECIFYLEAGUE_FRAMER;
ADDRGP4 s_specifyleague+1296+4
ADDRGP4 $81
ASGNP4
line 182
;182:	s_specifyleague.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyleague+1296+72
CNSTU4 16384
ASGNU4
line 183
;183:	s_specifyleague.framer.generic.x	 = 376;
ADDRGP4 s_specifyleague+1296+28
CNSTI4 376
ASGNI4
line 184
;184:	s_specifyleague.framer.generic.y	 = 76;
ADDRGP4 s_specifyleague+1296+32
CNSTI4 76
ASGNI4
line 185
;185:	s_specifyleague.framer.width  	     = 256;
ADDRGP4 s_specifyleague+1296+104
CNSTI4 256
ASGNI4
line 186
;186:	s_specifyleague.framer.height  	     = 334;
ADDRGP4 s_specifyleague+1296+108
CNSTI4 334
ASGNI4
line 188
;187:
;188:	s_specifyleague.grlogo.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+2372
CNSTI4 6
ASGNI4
line 189
;189:	s_specifyleague.grlogo.generic.name  = GLOBALRANKINGS_LOGO;
ADDRGP4 s_specifyleague+2372+4
ADDRGP4 $87
ASGNP4
line 190
;190:	s_specifyleague.grlogo.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyleague+2372+72
CNSTU4 16384
ASGNU4
line 191
;191:	s_specifyleague.grlogo.generic.x	 = 0;
ADDRGP4 s_specifyleague+2372+28
CNSTI4 0
ASGNI4
line 192
;192:	s_specifyleague.grlogo.generic.y	 = 0;
ADDRGP4 s_specifyleague+2372+32
CNSTI4 0
ASGNI4
line 193
;193:	s_specifyleague.grlogo.width		 = 64;
ADDRGP4 s_specifyleague+2372+104
CNSTI4 64
ASGNI4
line 194
;194:	s_specifyleague.grlogo.height		 = 128;
ADDRGP4 s_specifyleague+2372+108
CNSTI4 128
ASGNI4
line 196
;195:
;196:	s_specifyleague.rankname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyleague+1412
CNSTI4 4
ASGNI4
line 197
;197:	s_specifyleague.rankname.generic.name       = "Player Name:";
ADDRGP4 s_specifyleague+1412+4
ADDRGP4 $195
ASGNP4
line 198
;198:	s_specifyleague.rankname.generic.flags      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_specifyleague+1412+72
CNSTU4 258
ASGNU4
line 199
;199:	s_specifyleague.rankname.generic.callback   = SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1412+76
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 200
;200:	s_specifyleague.rankname.generic.id	        = ID_SPECIFYLEAGUENAME;
ADDRGP4 s_specifyleague+1412+24
CNSTI4 100
ASGNI4
line 201
;201:	s_specifyleague.rankname.generic.x	        = 226;
ADDRGP4 s_specifyleague+1412+28
CNSTI4 226
ASGNI4
line 202
;202:	s_specifyleague.rankname.generic.y	        = 128;
ADDRGP4 s_specifyleague+1412+32
CNSTI4 128
ASGNI4
line 203
;203:	s_specifyleague.rankname.field.widthInChars = 32;
ADDRGP4 s_specifyleague+1412+88+8
CNSTI4 32
ASGNI4
line 204
;204:	s_specifyleague.rankname.field.maxchars     = 80;
ADDRGP4 s_specifyleague+1412+88+268
CNSTI4 80
ASGNI4
line 206
;205:
;206:	s_specifyleague.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 s_specifyleague+1776
CNSTI4 8
ASGNI4
line 207
;207:	s_specifyleague.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_specifyleague+1776+72
CNSTU4 128
ASGNU4
line 208
;208:	s_specifyleague.list.generic.id				= ID_SPECIFYLEAGUELIST;
ADDRGP4 s_specifyleague+1776+24
CNSTI4 101
ASGNI4
line 209
;209:	s_specifyleague.list.generic.callback		= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1776+76
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 210
;210:	s_specifyleague.list.generic.x				= 160;
ADDRGP4 s_specifyleague+1776+28
CNSTI4 160
ASGNI4
line 211
;211:	s_specifyleague.list.generic.y				= 200;
ADDRGP4 s_specifyleague+1776+32
CNSTI4 200
ASGNI4
line 212
;212:	s_specifyleague.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 s_specifyleague+1776+112
CNSTI4 40
ASGNI4
line 213
;213:	s_specifyleague.list.height					= 8;
ADDRGP4 s_specifyleague+1776+116
CNSTI4 8
ASGNI4
line 214
;214:	s_specifyleague.list.itemnames				= (const char **)leaguename_items;
ADDRGP4 s_specifyleague+1776+104
ADDRGP4 leaguename_items
ASGNP4
line 215
;215:	s_specifyleague.list.numitems               = 0;
ADDRGP4 s_specifyleague+1776+96
CNSTI4 0
ASGNI4
line 216
;216:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $231
line 217
;217:		league_table[i].buff[0] = 0;
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table
ADDP4
CNSTI1 0
ASGNI1
line 218
;218:		league_table[i].leaguename[0] = 0;
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table+40
ADDP4
CNSTI1 0
ASGNI1
line 219
;219:		leaguename_items[i] = league_table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaguename_items
ADDP4
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table
ADDP4
ASGNP4
line 220
;220:	}
LABELV $232
line 216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $231
line 222
;221:	
;222:	s_specifyleague.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1908
CNSTI4 6
ASGNI4
line 223
;223:	s_specifyleague.arrows.generic.name			= SPECIFYLEAGUE_ARROWS0;
ADDRGP4 s_specifyleague+1908+4
ADDRGP4 $82
ASGNP4
line 224
;224:	s_specifyleague.arrows.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_specifyleague+1908+72
CNSTU4 16388
ASGNU4
line 225
;225:	s_specifyleague.arrows.generic.callback		= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1908+76
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 226
;226:	s_specifyleague.arrows.generic.x			= 512;
ADDRGP4 s_specifyleague+1908+28
CNSTI4 512
ASGNI4
line 227
;227:	s_specifyleague.arrows.generic.y			= 240-64+16;
ADDRGP4 s_specifyleague+1908+32
CNSTI4 192
ASGNI4
line 228
;228:	s_specifyleague.arrows.width				= 64;
ADDRGP4 s_specifyleague+1908+104
CNSTI4 64
ASGNI4
line 229
;229:	s_specifyleague.arrows.height				= 128;
ADDRGP4 s_specifyleague+1908+108
CNSTI4 128
ASGNI4
line 231
;230:
;231:	s_specifyleague.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 s_specifyleague+2024
CNSTI4 6
ASGNI4
line 232
;232:	s_specifyleague.up.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_specifyleague+2024+72
CNSTU4 2308
ASGNU4
line 233
;233:	s_specifyleague.up.generic.callback			= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+2024+76
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 234
;234:	s_specifyleague.up.generic.id				= ID_SPECIFYLEAGUEUP;
ADDRGP4 s_specifyleague+2024+24
CNSTI4 102
ASGNI4
line 235
;235:	s_specifyleague.up.generic.x				= 512;
ADDRGP4 s_specifyleague+2024+28
CNSTI4 512
ASGNI4
line 236
;236:	s_specifyleague.up.generic.y				= 240-64+16;
ADDRGP4 s_specifyleague+2024+32
CNSTI4 192
ASGNI4
line 237
;237:	s_specifyleague.up.width					= 64;
ADDRGP4 s_specifyleague+2024+104
CNSTI4 64
ASGNI4
line 238
;238:	s_specifyleague.up.height					= 64;
ADDRGP4 s_specifyleague+2024+108
CNSTI4 64
ASGNI4
line 239
;239:	s_specifyleague.up.focuspic					= SPECIFYLEAGUE_UP;
ADDRGP4 s_specifyleague+2024+88
ADDRGP4 $83
ASGNP4
line 241
;240:
;241:	s_specifyleague.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_specifyleague+2140
CNSTI4 6
ASGNI4
line 242
;242:	s_specifyleague.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_specifyleague+2140+72
CNSTU4 2308
ASGNU4
line 243
;243:	s_specifyleague.down.generic.callback		= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+2140+76
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 244
;244:	s_specifyleague.down.generic.id				= ID_SPECIFYLEAGUEDOWN;
ADDRGP4 s_specifyleague+2140+24
CNSTI4 103
ASGNI4
line 245
;245:	s_specifyleague.down.generic.x				= 512;
ADDRGP4 s_specifyleague+2140+28
CNSTI4 512
ASGNI4
line 246
;246:	s_specifyleague.down.generic.y				= 240+16;
ADDRGP4 s_specifyleague+2140+32
CNSTI4 256
ASGNI4
line 247
;247:	s_specifyleague.down.width					= 64;
ADDRGP4 s_specifyleague+2140+104
CNSTI4 64
ASGNI4
line 248
;248:	s_specifyleague.down.height					= 64;
ADDRGP4 s_specifyleague+2140+108
CNSTI4 64
ASGNI4
line 249
;249:	s_specifyleague.down.focuspic				= SPECIFYLEAGUE_DOWN;
ADDRGP4 s_specifyleague+2140+88
ADDRGP4 $84
ASGNP4
line 251
;250:
;251:	s_specifyleague.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+2256
CNSTI4 6
ASGNI4
line 252
;252:	s_specifyleague.back.generic.name     = SPECIFYLEAGUE_BACK0;
ADDRGP4 s_specifyleague+2256+4
ADDRGP4 $85
ASGNP4
line 253
;253:	s_specifyleague.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyleague+2256+72
CNSTU4 260
ASGNU4
line 254
;254:	s_specifyleague.back.generic.callback = SpecifyLeague_Event;
ADDRGP4 s_specifyleague+2256+76
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 255
;255:	s_specifyleague.back.generic.id	      = ID_SPECIFYLEAGUEBACK;
ADDRGP4 s_specifyleague+2256+24
CNSTI4 104
ASGNI4
line 256
;256:	s_specifyleague.back.generic.x		  = 0 - uis.wideoffset;
ADDRGP4 s_specifyleague+2256+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 257
;257:	s_specifyleague.back.generic.y		  = 480-64;
ADDRGP4 s_specifyleague+2256+32
CNSTI4 416
ASGNI4
line 258
;258:	s_specifyleague.back.width  		  = 128;
ADDRGP4 s_specifyleague+2256+104
CNSTI4 128
ASGNI4
line 259
;259:	s_specifyleague.back.height  		  = 64;
ADDRGP4 s_specifyleague+2256+108
CNSTI4 64
ASGNI4
line 260
;260:	s_specifyleague.back.focuspic         = SPECIFYLEAGUE_BACK1;
ADDRGP4 s_specifyleague+2256+88
ADDRGP4 $86
ASGNP4
line 262
;261:
;262:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.banner );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 263
;263:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.framel );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 264
;264:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.framer );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 265
;265:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.grlogo );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+2372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 266
;266:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.rankname );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 267
;267:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.list );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 268
;268:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.arrows );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 269
;269:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.up );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+2024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 270
;270:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.down );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+2140
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 271
;271:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.back );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+2256
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 275
;272:
;273:
;274:	// initialize any menu variables
;275:	Q_strncpyz( s_specifyleague.rankname.field.buffer, 
ADDRGP4 $318
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_specifyleague+1412+88+12
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 279
;276:		UI_Cvar_VariableString("name"), 
;277:		sizeof(s_specifyleague.rankname.field.buffer) );
;278:
;279:	Q_strncpyz( playername,
ADDRGP4 $318
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 playername
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 283
;280:		UI_Cvar_VariableString("name"), 
;281:		sizeof(playername) );
;282:
;283:	SpecifyLeague_GetList();
ADDRGP4 SpecifyLeague_GetList
CALLV
pop
line 284
;284:}
LABELV $137
endproc SpecifyLeague_MenuInit 12 12
export SpecifyLeague_Cache
proc SpecifyLeague_Cache 4 4
line 292
;285:
;286:/*
;287:=================
;288:SpecifyLeague_Cache
;289:=================
;290:*/
;291:void SpecifyLeague_Cache( void )
;292:{
line 296
;293:	int	i;
;294:
;295:	// touch all our pics
;296:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $323
line 297
;297:	{
line 298
;298:		if (!specifyleague_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyleague_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $327
line 299
;299:			break;
ADDRGP4 $325
JUMPV
LABELV $327
line 300
;300:		trap_R_RegisterShaderNoMip(specifyleague_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyleague_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 301
;301:	}
LABELV $324
line 296
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $323
JUMPV
LABELV $325
line 302
;302:}
LABELV $322
endproc SpecifyLeague_Cache 4 4
export UI_SpecifyLeagueMenu
proc UI_SpecifyLeagueMenu 0 4
line 310
;303:
;304:/*
;305:=================
;306:UI_SpecifyLeagueMenu
;307:=================
;308:*/
;309:void UI_SpecifyLeagueMenu( void )
;310:{
line 311
;311:	SpecifyLeague_MenuInit();
ADDRGP4 SpecifyLeague_MenuInit
CALLV
pop
line 312
;312:	UI_PushMenu( &s_specifyleague.menu );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 313
;313:}
LABELV $329
endproc UI_SpecifyLeagueMenu 0 4
bss
export leaguename_items
align 4
LABELV leaguename_items
skip 512
export league_table
align 4
LABELV league_table
skip 15360
align 4
LABELV s_specifyleague
skip 2604
align 1
LABELV playername
skip 80
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
LABELV $318
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $195
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $148
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 65
byte 1 71
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $131
byte 1 115
byte 1 118
byte 1 95
byte 1 108
byte 1 101
byte 1 97
byte 1 103
byte 1 117
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 108
byte 1 101
byte 1 97
byte 1 103
byte 1 117
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $88
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
byte 1 114
byte 1 47
byte 1 103
byte 1 114
byte 1 108
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $87
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
byte 1 114
byte 1 47
byte 1 103
byte 1 114
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $86
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
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
