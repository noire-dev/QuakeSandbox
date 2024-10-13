data
export mapfilter_items
align 4
LABELV mapfilter_items
address $93
address $94
address $95
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export mapfilter_itemsru
align 4
LABELV mapfilter_itemsru
address $96
address $94
address $97
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV maplist_loaded
byte 4 0
align 4
LABELV faded_color
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV shadow_color
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV maptype_icon
address $98
address $99
address $100
address $101
address $102
address $103
address $104
address $105
address $106
address $107
address $108
address $109
address $110
address $111
export GametypeBits
code
proc GametypeBits 76 8
file "../../../code/q3_ui/ui_startserver_custommaps.c"
line 106
;1:/*
;2:=============================================================================
;3:
;4:MAP SELECT MENU *****
;5:
;6:=============================================================================
;7:*/
;8:
;9:
;10:#include "ui_local.h"
;11:#include "ui_startserver.h"
;12:
;13:
;14:
;15:#define MAX_MAPSLIST 2048
;16:#define MAP_ERRORPIC "menu/art/unknownmap"
;17:
;18:
;19:#define MAPTYPE_MASTER_BEGIN 	0
;20:#define MAPTYPE_MASTER_END 		1
;21:#define MAPTYPE_CUSTOM_BEGIN 	2
;22:#define MAPTYPE_CUSTOM_END 		3
;23:
;24:#define MAPTYPE_ICONX	20
;25:#define MAPTYPE_ICONY	20
;26:
;27:#define TMP_BUFSIZE 64
;28:
;29:#define GROUP_INDEX "[Index]"
;30:
;31:
;32:
;33:const char* mapfilter_items[MAPFILTER_MAX + MAX_MAPTYPES + 1] = {
;34:	"Off",	// MAPFILTER_OFF
;35:	"QS",	// MAPFILTER_DMod
;36:	"Others",	// MAPFILTER_NONID
;37:	0,0,0,0,0,0,0,0,
;38:	0,0,0,0,0,0,0,0,
;39:	0,0,0,0,0,0,0,0,
;40:	0,0,0,0,0,0,0,0,
;41:	0
;42:};
;43:
;44:const char* mapfilter_itemsru[MAPFILTER_MAX + MAX_MAPTYPES + 1] = {
;45:	"Откл",	// MAPFILTER_OFF
;46:	"QS",	// MAPFILTER_DMod
;47:	"Другие",	// MAPFILTER_NONID
;48:	0,0,0,0,0,0,0,0,
;49:	0,0,0,0,0,0,0,0,
;50:	0,0,0,0,0,0,0,0,
;51:	0,0,0,0,0,0,0,0,
;52:	0
;53:};
;54:
;55:
;56:
;57:
;58:
;59:typedef struct mapTypeList_s {
;60:	int num_maptypes;
;61:	int num_maps;
;62:	int noBotsIndex;
;63:
;64:	int type_offset[MAX_MAPTYPES][4];
;65:
;66:	char mapTypeName[MAX_MAPTYPES][MAPNAME_BUFFER + 2];
;67:	char mapGraphic[MAX_MAPTYPES][MAX_QPATH];
;68:
;69:	char mapName[MAX_MAPSLIST][MAPNAME_BUFFER];
;70:} mapTypeList_t;
;71:
;72:
;73:static mapTypeList_t s_mapList;
;74:static qboolean maplist_loaded = qfalse;
;75:static vec4_t faded_color = {1.0, 1.0, 1.0, 1.0 };
;76:static vec4_t shadow_color = {0.0, 0.0, 0.0, 1.0 };
;77:
;78:
;79:
;80:static const char* maptype_icon[NUM_GAMETYPES] = {
;81:	"menu/uie_art/gt_sandbox",		// GT_SANDBOX
;82:	"menu/uie_art/gt_ffa",		// GT_FFA
;83:	"menu/uie_art/gt_single",		// GT_SINGLE
;84:	"menu/uie_art/gt_tourney",		// GT_TOURNAMENT
;85:	"menu/uie_art/gt_team",	// GT_TEAM
;86:	"menu/uie_art/gt_ctf",		// GT_CTF
;87:	"menu/uie_art/gt_oneflag",		// GT_1FCTF
;88:	"menu/uie_art/gt_obelisk",		// GT_OBELISK
;89:	"menu/uie_art/gt_harvester",		// GT_HARVESTER
;90:	"menu/uie_art/gt_elimination",		// GT_ELIMINATION
;91:	"menu/uie_art/gt_eliminationctf",		// GT_CTF_ELIMINATION
;92:	"menu/uie_art/gt_lms",		// GT_LMS
;93:	"menu/uie_art/gt_doubledom",		// GT_DOUBLE_D
;94:	"menu/uie_art/gt_dom"		// GT_DOMINATION
;95:};
;96:
;97:
;98:
;99:
;100:
;101:/*
;102:=================
;103:GametypeBits
;104:=================
;105:*/
;106:int GametypeBits( char *string ) {
line 111
;107:	int		bits;
;108:	char	*p;
;109:	char	*token;
;110:
;111:	bits = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 112
;112:	p = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $113
line 113
;113:	while( 1 ) {
line 114
;114:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 115
;115:		if( token[0] == 0 ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $116
line 116
;116:			break;
ADDRGP4 $115
JUMPV
LABELV $116
line 119
;117:		}
;118:		
;119:		if( Q_stricmp( token, "sandbox" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $118
line 120
;120:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 121
;121:			continue;
ADDRGP4 $114
JUMPV
LABELV $118
line 124
;122:		}
;123:
;124:		if( Q_stricmp( token, "ffa" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $121
line 125
;125:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 126
;126:			bits |= 1 << GT_FFA;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 127
;127:			bits |= 1 << GT_LMS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 128
;128:			bits |= 1 << GT_ELIMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 129
;129:			bits |= 1 << GT_DOMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 130
;130:			continue;
ADDRGP4 $114
JUMPV
LABELV $121
line 133
;131:		}
;132:		
;133:		if( Q_stricmp( token, "entityplus" ) == 0 ) { //entityplus support
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $124
line 134
;134:			bits |= 1 << GT_SINGLE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 135
;135:			continue;
ADDRGP4 $114
JUMPV
LABELV $124
line 138
;136:		}
;137:		
;138:		if( Q_stricmp( token, "singleplayer" ) == 0 ) {	//Quake Sandbox single mode
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $129
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $127
line 139
;139:			bits |= 1 << GT_SINGLE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 140
;140:			continue;
ADDRGP4 $114
JUMPV
LABELV $127
line 143
;141:		}
;142:
;143:		if( Q_stricmp( token, "tourney" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $130
line 144
;144:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 145
;145:			bits |= 1 << GT_TOURNAMENT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 146
;146:			continue;
ADDRGP4 $114
JUMPV
LABELV $130
line 149
;147:		}
;148:
;149:		if( Q_stricmp( token, "team" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $133
line 150
;150:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 151
;151:			bits |= 1 << GT_TEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 152
;152:			bits |= 1 << GT_ELIMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 153
;153:			continue;
ADDRGP4 $114
JUMPV
LABELV $133
line 156
;154:		}
;155:
;156:		if( Q_stricmp( token, "ctf" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $136
line 157
;157:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 158
;158:			bits |= 1 << GT_CTF;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 159
;159:			bits |= 1 << GT_DOUBLE_D;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 160
;160:			bits |= 1 << GT_CTF_ELIMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 161
;161:			bits |= 1 << GT_ELIMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 162
;162:			continue;
ADDRGP4 $114
JUMPV
LABELV $136
line 165
;163:		}
;164:		
;165:		if( Q_stricmp( token, "oneflag" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $139
line 166
;166:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 167
;167:			bits |= 1 << GT_1FCTF;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 168
;168:			continue;
ADDRGP4 $114
JUMPV
LABELV $139
line 171
;169:		}
;170:                
;171:		if( Q_stricmp( token, "overload" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $142
line 172
;172:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 173
;173:			bits |= 1 << GT_OBELISK;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 174
;174:			continue;
ADDRGP4 $114
JUMPV
LABELV $142
line 177
;175:		}
;176:                
;177:		if( Q_stricmp( token, "harvester" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $147
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $145
line 178
;178:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 179
;179:			bits |= 1 << GT_HARVESTER;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 180
;180:			continue;
ADDRGP4 $114
JUMPV
LABELV $145
line 183
;181:		}
;182:
;183:		if( Q_stricmp( token, "elimination" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $148
line 184
;184:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 185
;185:			bits |= 1 << GT_ELIMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 186
;186:			continue;
ADDRGP4 $114
JUMPV
LABELV $148
line 189
;187:		}
;188:
;189:		if( Q_stricmp( token, "ctfelimination" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $151
line 190
;190:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 191
;191:			bits |= 1 << GT_CTF_ELIMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 192
;192:			continue;
ADDRGP4 $114
JUMPV
LABELV $151
line 195
;193:	}
;194:
;195:		if( Q_stricmp( token, "lms" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $154
line 196
;196:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 197
;197:			bits |= 1 << GT_LMS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 198
;198:			continue;
ADDRGP4 $114
JUMPV
LABELV $154
line 200
;199:		}
;200:		if( Q_stricmp( token, "dd" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $157
line 201
;201:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 202
;202:			bits |= 1 << GT_DOUBLE_D;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 203
;203:			continue;
ADDRGP4 $114
JUMPV
LABELV $157
line 206
;204:		}
;205:                
;206:		if( Q_stricmp( token, "dom" ) == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $160
line 207
;207:			bits |= 1 << GT_SANDBOX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 208
;208:			bits |= 1 << GT_DOMINATION;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 209
;209:			continue;
LABELV $160
line 211
;210:		}
;211:	}
LABELV $114
line 113
ADDRGP4 $113
JUMPV
LABELV $115
line 213
;212:
;213:	return bits;
ADDRLP4 0
INDIRI4
RETI4
LABELV $112
endproc GametypeBits 76 8
export UI_BuildMapListByType
proc UI_BuildMapListByType 56 8
line 233
;214:}
;215:
;216:
;217:
;218:
;219:/*
;220:=================
;221:UI_BuildMapListByType
;222:
;223:If list is NULL then we're just counting the
;224:number of maps that match gametype
;225:
;226:gametype == -1
;227:
;228:Can be used externally to the ui_startserver.c subsystem
;229:=================
;230:*/
;231:int UI_BuildMapListByType(int* list, int listmax, int gametype,
;232:	callbackMapList callback)
;233:{
line 241
;234:	int count;
;235:	int i, nummaps;
;236:	int matchbits, gamebits;
;237:	const char* info;
;238:	const char* mapname;
;239:	qboolean idmap;
;240:
;241:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 242
;242:	if (gametype == -1) {
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $164
line 243
;243:		matchbits = (1 << GT_MAX_GAME_TYPE) - 1;
ADDRLP4 20
CNSTI4 16383
ASGNI4
line 244
;244:	}
ADDRGP4 $165
JUMPV
LABELV $164
line 245
;245:	else {
line 246
;246:		matchbits = 1 << gametype;
ADDRLP4 20
CNSTI4 1
ADDRFP4 8
INDIRI4
LSHI4
ASGNI4
line 247
;247:	}
LABELV $165
line 249
;248:
;249:	nummaps = UI_GetNumArenas();
ADDRLP4 32
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 250
;250:	for (i = 0; i < nummaps; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $166
line 251
;251:	{
line 252
;252:		info = UI_GetArenaInfoByNumber(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
ASGNP4
line 254
;253:
;254:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 255
;255:		if( !( gamebits & matchbits )) {
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
CNSTI4 0
NEI4 $171
line 256
;256:			continue;
ADDRGP4 $167
JUMPV
LABELV $171
line 259
;257:		}
;258:
;259:		if (callback && !callback(info))
ADDRLP4 48
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $173
line 260
;260:			continue;
ADDRGP4 $167
JUMPV
LABELV $173
line 263
;261:
;262:		// add to list, terminate if full
;263:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 264
;264:		if (!list)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 265
;265:			continue;
ADDRGP4 $167
JUMPV
LABELV $175
line 267
;266:
;267:		list[count - 1] = i;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 4
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 268
;268:		if (count == listmax)
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $177
line 269
;269:			break;
ADDRGP4 $168
JUMPV
LABELV $177
line 270
;270:	}
LABELV $167
line 250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $166
LABELV $168
line 272
;271:
;272:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $163
endproc UI_BuildMapListByType 56 8
export UIE_DefaultIconFromGameType
proc UIE_DefaultIconFromGameType 8 8
line 286
;273:}
;274:
;275:
;276:
;277:
;278:
;279:
;280:/*
;281:=================
;282:UIE_DefaultIconFromGameType
;283:=================
;284:*/
;285:const char* UIE_DefaultIconFromGameType(int gametype)
;286:{
line 287
;287:	if (gametype < 0 || gametype > NUM_GAMETYPES) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $182
ADDRLP4 0
INDIRI4
CNSTI4 14
LEI4 $180
LABELV $182
line 288
;288:		trap_Print(va(S_COLOR_RED"Unknown gametype icon: %i\n", gametype));
ADDRGP4 $183
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 289
;289:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $179
JUMPV
LABELV $180
line 292
;290:	}
;291:
;292:	return maptype_icon[ gametype ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 maptype_icon
ADDP4
INDIRP4
RETP4
LABELV $179
endproc UIE_DefaultIconFromGameType 8 8
export StartServer_SetIconFromGameType
proc StartServer_SetIconFromGameType 8 8
line 310
;293:}
;294:
;295:
;296:
;297:
;298:/*
;299:=================
;300:StartServer_SetIconFromGameType
;301:
;302:gametype < 0 clears the bitmap so nothing is drawn
;303:
;304:Modifies path to icon to get high quality Id version
;305:if needed. Note: these Id icons don't have the
;306:proper transparency behaviour
;307:=================
;308:*/
;309:void StartServer_SetIconFromGameType(menubitmap_s* b, int gametype, qboolean custom)
;310:{
line 313
;311:	const char* new_icon;
;312:
;313:	if (!b)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $185
line 314
;314:		return;
ADDRGP4 $184
JUMPV
LABELV $185
line 316
;315:
;316:	if (gametype < 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $187
line 317
;317:	{
line 318
;318:		b->generic.name = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTP4 0
ASGNP4
line 319
;319:		b->shader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 320
;320:		return;
ADDRGP4 $184
JUMPV
LABELV $187
line 323
;321:	}
;322:
;323:	new_icon = StartServer_MapIconFromType(gametype, custom);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 StartServer_MapIconFromType
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 325
;324:
;325:	if (new_icon != b->generic.name)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
EQU4 $189
line 326
;326:	{
line 327
;327:		b->generic.name = new_icon;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 328
;328:		b->shader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 329
;329:	}
LABELV $189
line 330
;330:}
LABELV $184
endproc StartServer_SetIconFromGameType 8 8
proc StartServer_CreateMapType 24 8
line 341
;331:
;332:
;333:
;334:
;335:/*
;336:=================
;337:StartServer_CreateMapType
;338:=================
;339:*/
;340:static qboolean StartServer_CreateMapType(const char* name, const char* graphic)
;341:{
line 346
;342:	int i;
;343:	qboolean duplicated;
;344:	char* ptr;
;345:
;346:	ptr = va("[%s]",name);
ADDRGP4 $192
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 347
;347:	duplicated = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 348
;348:	for (i = 0; i < s_mapList.num_maptypes; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $193
line 349
;349:	{
line 350
;350:		if (!Q_stricmp(ptr, s_mapList.mapTypeName[i]))
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 34
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapList+524
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $197
line 351
;351:		{
line 352
;352:			duplicated = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 353
;353:			break;
ADDRGP4 $195
JUMPV
LABELV $197
line 355
;354:		}
;355:	}
LABELV $194
line 348
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $196
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapList
INDIRI4
LTI4 $193
LABELV $195
line 357
;356:
;357:	if (duplicated || !Q_stricmp(ptr, GROUP_INDEX))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $203
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $200
LABELV $203
line 358
;358:	{
line 359
;359:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $191
JUMPV
LABELV $200
line 362
;360:	}
;361:
;362:	strcpy(s_mapList.mapTypeName[s_mapList.num_maptypes], ptr);
CNSTI4 34
ADDRGP4 s_mapList
INDIRI4
MULI4
ADDRGP4 s_mapList+524
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 363
;363:	strcpy(s_mapList.mapGraphic[s_mapList.num_maptypes], graphic);
ADDRGP4 s_mapList
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapList+1612
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 364
;364:	s_mapList.num_maptypes++;
ADDRLP4 20
ADDRGP4 s_mapList
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 366
;365:
;366:	return qtrue;
CNSTI4 1
RETI4
LABELV $191
endproc StartServer_CreateMapType 24 8
bss
align 1
LABELV $207
skip 65000
code
proc StartServer_LoadCustomMapData 284 12
line 377
;367:}
;368:
;369:
;370:
;371:/*
;372:=================
;373:StartServer_LoadCustomMapData
;374:=================
;375:*/
;376:static void StartServer_LoadCustomMapData(const char* filename, qboolean merge)
;377:{
line 393
;378:	static char data[65000];
;379:	char buf[TMP_BUFSIZE];
;380:	fileHandle_t file;
;381:	int len;
;382:
;383:	char *text_p, *prev_p;
;384:	char *token, *token2;
;385:	char *ptr;
;386:	int i;
;387:	int index;
;388:	int first, last;
;389:	qboolean indexgroup, groupfound, indexdone;
;390:	qboolean groupused[MAX_MAPTYPES];
;391:
;392:	// setup parameters
;393:	for (i = 0; i < MAX_MAPTYPES; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $208
line 394
;394:		groupused[i] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
CNSTI4 0
ASGNI4
LABELV $209
line 393
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $208
line 396
;395:
;396:	if (merge)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $212
line 397
;397:	{
line 398
;398:		first = MAPTYPE_CUSTOM_BEGIN;
ADDRLP4 228
CNSTI4 2
ASGNI4
line 399
;399:		last = MAPTYPE_CUSTOM_END;
ADDRLP4 236
CNSTI4 3
ASGNI4
line 400
;400:	}
ADDRGP4 $213
JUMPV
LABELV $212
line 402
;401:	else
;402:	{
line 403
;403:		first = MAPTYPE_MASTER_BEGIN;
ADDRLP4 228
CNSTI4 0
ASGNI4
line 404
;404:		last = MAPTYPE_MASTER_END;
ADDRLP4 236
CNSTI4 1
ASGNI4
line 405
;405:	}
LABELV $213
line 411
;406:
;407:
;408:	//
;409:	// read the file
;410:	//
;411:	len = trap_FS_FOpenFile(filename, &file, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 248
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 232
ADDRLP4 248
INDIRI4
ASGNI4
line 412
;412:	if (len <= 0 )
ADDRLP4 232
INDIRI4
CNSTI4 0
GTI4 $214
line 413
;413:	{
line 414
;414:		return;
ADDRGP4 $206
JUMPV
LABELV $214
line 417
;415:	}
;416:
;417:	if ( len >= (sizeof(data) - 1))
ADDRLP4 232
INDIRI4
CVIU4 4
CNSTU4 64999
LTU4 $216
line 418
;418:	{
line 419
;419:		Com_Printf( "UI_LoadCustomMapData: %s larger than buffer\n", filename );
ADDRGP4 $218
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 420
;420:		return;
ADDRGP4 $206
JUMPV
LABELV $216
line 423
;421:	}
;422:
;423:	trap_FS_Read(data, len, file);
ADDRGP4 $207
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 424
;424:	trap_FS_FCloseFile(file);
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 425
;425:	data[len] = 0;
ADDRLP4 232
INDIRI4
ADDRGP4 $207
ADDP4
CNSTI1 0
ASGNI1
line 428
;426:
;427:	// parse the data file
;428:	groupfound = qfalse;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 429
;429:	indexgroup = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 430
;430:	indexdone = qfalse;
ADDRLP4 224
CNSTI4 0
ASGNI4
line 431
;431:	index = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 432
;432:	text_p = data;
ADDRLP4 12
ADDRGP4 $207
ASGNP4
ADDRGP4 $220
JUMPV
LABELV $219
line 434
;433:	while (1)
;434:	{
line 435
;435:		prev_p = text_p;	// for backup
ADDRLP4 220
ADDRLP4 12
INDIRP4
ASGNP4
line 436
;436:		token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 252
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 252
INDIRP4
ASGNP4
line 437
;437:		if (!text_p)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $222
line 438
;438:			break;
ADDRGP4 $221
JUMPV
LABELV $222
line 440
;439:
;440:		if (token[0] == '[')
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 91
NEI4 $224
line 441
;441:		{
line 443
;442:			// close previous group
;443:			if (groupfound)
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $226
line 444
;444:			{
line 445
;445:				s_mapList.type_offset[index][last] = s_mapList.num_maps;
ADDRLP4 236
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12
ADDP4
ADDP4
ADDRGP4 s_mapList+4
INDIRI4
ASGNI4
line 446
;446:				groupused[index] = qtrue;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
CNSTI4 1
ASGNI4
line 447
;447:				groupfound = qfalse;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 448
;448:			}
LABELV $226
line 451
;449:
;450:			// check for "[name]" format
;451:			ptr = strchr(token, ']');
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 256
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 256
INDIRP4
ASGNP4
line 452
;452:			if (strchr(&token[1],'[') || !ptr || ptr[1])
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 91
ARGI4
ADDRLP4 260
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 264
CNSTU4 0
ASGNU4
ADDRLP4 260
INDIRP4
CVPU4 4
ADDRLP4 264
INDIRU4
NEU4 $233
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 264
INDIRU4
EQU4 $233
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $230
LABELV $233
line 453
;453:			{
line 454
;454:				Com_Printf( "(%s): has malformed group (%s)\n", filename, token);
ADDRGP4 $234
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 455
;455:				break;
ADDRGP4 $221
JUMPV
LABELV $230
line 459
;456:			}
;457:
;458:			// we have a valid "[name]" tokem
;459:			if (indexgroup)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $235
line 460
;460:			{
line 461
;461:				indexgroup = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 462
;462:				indexdone = qtrue;
ADDRLP4 224
CNSTI4 1
ASGNI4
line 463
;463:			}
LABELV $235
line 465
;464:
;465:			if (!indexgroup && !indexdone)
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 272
INDIRI4
NEI4 $237
ADDRLP4 224
INDIRI4
ADDRLP4 272
INDIRI4
NEI4 $237
line 466
;466:			{
line 467
;467:				if (Q_stricmp(token, GROUP_INDEX))
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 276
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $239
line 468
;468:				{
line 469
;469:					Com_Printf( "(%s): must have %s group first\n", filename, GROUP_INDEX);
ADDRGP4 $241
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $202
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 470
;470:					break;
ADDRGP4 $221
JUMPV
LABELV $239
line 472
;471:				}
;472:				indexgroup = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 473
;473:				continue;
ADDRGP4 $220
JUMPV
LABELV $237
line 477
;474:			}
;475:
;476:			// locate
;477:			index = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 478
;478:			for (i = 0; i < MAX_MAPTYPES; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $242
line 479
;479:			{
line 480
;480:				if (!Q_stricmp(token, s_mapList.mapTypeName[i]))
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 34
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapList+524
ADDP4
ARGP4
ADDRLP4 276
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $246
line 481
;481:				{
line 482
;482:					index = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 483
;483:					break;
ADDRGP4 $244
JUMPV
LABELV $246
line 485
;484:				}
;485:			}
LABELV $243
line 478
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $242
LABELV $244
line 488
;486:
;487:			// failed to locate, or duplicated
;488:			if ( index == -1 || groupused[index] || !Q_stricmp(token, GROUP_INDEX) )
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $252
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
INDIRI4
CNSTI4 0
NEI4 $252
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $249
LABELV $252
line 489
;489:			{
line 490
;490:				Com_Printf("(%s): %s ignored\n", filename, token);
ADDRGP4 $253
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 491
;491:				continue;
ADDRGP4 $220
JUMPV
LABELV $249
line 495
;492:			}
;493:
;494:			// have a valid value of index at this point
;495:			groupfound = qtrue;
ADDRLP4 88
CNSTI4 1
ASGNI4
line 496
;496:			s_mapList.type_offset[index][first] = s_mapList.num_maps;
ADDRLP4 228
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12
ADDP4
ADDP4
ADDRGP4 s_mapList+4
INDIRI4
ASGNI4
line 497
;497:			continue;
ADDRGP4 $220
JUMPV
LABELV $224
line 503
;498:		}
;499:
;500:		//
;501:		// not a new index header, so we treat token as a map name or description of index
;502:		//
;503:		if (indexgroup)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $256
line 504
;504:		{
line 508
;505:			//
;506:			// "name=graphic file" format
;507:			//
;508:			ptr = strchr(token, '=');
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 61
ARGI4
ADDRLP4 256
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 256
INDIRP4
ASGNP4
line 509
;509:			buf[0] = 0;
ADDRLP4 24
CNSTI1 0
ASGNI1
line 511
;510:
;511:			if (ptr)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
line 512
;512:			{
line 513
;513:				Q_strncpyz(buf, token, ptr - token + 1);
ADDRLP4 24
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 514
;514:				if (!ptr[1])
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $260
line 515
;515:				{
line 516
;516:					token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 264
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 264
INDIRP4
ASGNP4
line 517
;517:					if (!text_p)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $259
line 518
;518:						break;
ADDRGP4 $221
JUMPV
line 519
;519:				}
LABELV $260
line 521
;520:				else
;521:				{
line 522
;522:					token = &ptr[1];
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 523
;523:				}
line 524
;524:			}
ADDRGP4 $259
JUMPV
LABELV $258
line 526
;525:			else	// token is separated from equals by whitespace
;526:			{
line 527
;527:				Q_strncpyz(buf, token, TMP_BUFSIZE);
ADDRLP4 24
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 529
;528:
;529:				token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 260
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 260
INDIRP4
ASGNP4
line 530
;530:				if (!text_p)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 531
;531:					break;
ADDRGP4 $221
JUMPV
LABELV $264
line 533
;532:
;533:				if (token[0] != '=')
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 61
EQI4 $266
line 534
;534:				{
line 535
;535:					Com_Printf( "(%s): (%s) requires = separator\n", filename, buf);
ADDRGP4 $268
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 536
;536:					break;
ADDRGP4 $221
JUMPV
LABELV $266
line 539
;537:				}
;538:
;539:				if (!token[1])
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $269
line 540
;540:				{
line 541
;541:					token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 264
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 264
INDIRP4
ASGNP4
line 542
;542:					if (!text_p)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $270
line 543
;543:						break;
ADDRGP4 $221
JUMPV
line 544
;544:				}
LABELV $269
line 546
;545:				else
;546:				{
line 547
;547:					token = &token[1];
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 548
;548:				}
LABELV $270
line 549
;549:			}
LABELV $259
line 552
;550:
;551:			// found a type of map, with associated graphic
;552:			if (!StartServer_CreateMapType(buf, token))
ADDRLP4 24
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 StartServer_CreateMapType
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $220
line 553
;553:			{
line 554
;554:				Com_Printf( "(%s): (%s) duplicated, ignored\n", filename, buf);
ADDRGP4 $275
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 555
;555:			}
line 556
;556:			continue;
ADDRGP4 $220
JUMPV
LABELV $256
line 559
;557:		}
;558:		else
;559:		{
line 560
;560:			if (!groupfound)
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $276
line 561
;561:			{
line 562
;562:				continue;
ADDRGP4 $220
JUMPV
LABELV $276
line 566
;563:			}
;564:
;565:			// map name, mustn't be too long
;566:			if (strlen(token) >= MAPNAME_BUFFER - 1)
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 31
LTI4 $278
line 567
;567:			{
line 568
;568:				Com_Printf( "(%s): mapname too long (%s)\n", filename, token);
ADDRGP4 $280
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 569
;569:				break;
ADDRGP4 $221
JUMPV
LABELV $278
line 572
;570:			}
;571:
;572:			strcpy(s_mapList.mapName[s_mapList.num_maps++ ], token);
ADDRLP4 264
ADDRGP4 s_mapList+4
ASGNP4
ADDRLP4 260
ADDRLP4 264
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 264
INDIRP4
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_mapList+3660
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 573
;573:		}
line 574
;574:	}
LABELV $220
line 433
ADDRGP4 $219
JUMPV
LABELV $221
line 576
;575:
;576:	if (index != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $283
line 577
;577:		s_mapList.type_offset[index][last] = s_mapList.num_maps;
ADDRLP4 236
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12
ADDP4
ADDP4
ADDRGP4 s_mapList+4
INDIRI4
ASGNI4
LABELV $283
line 578
;578:}
LABELV $206
endproc StartServer_LoadCustomMapData 284 12
export StartServer_MapSupportsBots
proc StartServer_MapSupportsBots 20 8
line 590
;579:
;580:
;581:
;582:
;583:/*
;584:=================
;585:StartServer_MapSupportsBots
;586:
;587:=================
;588:*/
;589:qboolean StartServer_MapSupportsBots(const char* mapname)
;590:{
line 594
;591:	int i;
;592:	int index, start, end;
;593:
;594:	index = s_mapList.noBotsIndex;
ADDRLP4 8
ADDRGP4 s_mapList+8
INDIRI4
ASGNI4
line 595
;595:	if (index < 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $289
line 596
;596:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $287
JUMPV
LABELV $289
line 598
;597:
;598:	start = s_mapList.type_offset[index][MAPTYPE_MASTER_BEGIN];
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12
ADDP4
INDIRI4
ASGNI4
line 599
;599:	end = s_mapList.type_offset[index][MAPTYPE_MASTER_END];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12+4
ADDP4
INDIRI4
ASGNI4
line 600
;600:	for (i = start; i < end; i++)
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $294
line 601
;601:	{
line 602
;602:		if (!Q_stricmp(mapname, s_mapList.mapName[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_mapList+3660
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $298
line 603
;603:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $287
JUMPV
LABELV $298
line 604
;604:	}
LABELV $295
line 600
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $294
line 606
;605:
;606:	return qtrue;
CNSTI4 1
RETI4
LABELV $287
endproc StartServer_MapSupportsBots 20 8
proc StartServer_AddMapType 12 0
line 618
;607:}
;608:
;609:
;610:
;611:
;612:/*
;613:=================
;614:StartServer_AddMapType
;615:=================
;616:*/
;617:static void StartServer_AddMapType(mappic_t* mappic, int type)
;618:{
line 621
;619:	int i;
;620:
;621:	if (mappic->num_types == MAX_MAPTYPES)
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 32
NEI4 $302
line 622
;622:		return;
ADDRGP4 $301
JUMPV
LABELV $302
line 625
;623:
;624:	// prevent duplication
;625:	for (i = 0; i < mappic->num_types; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 626
;626:	{
line 627
;627:		if (mappic->type[i] == type)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $308
line 628
;628:			return;
ADDRGP4 $301
JUMPV
LABELV $308
line 629
;629:	}
LABELV $305
line 625
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
LTI4 $304
line 631
;630:
;631:	mappic->type[ mappic->num_types++ ] = type;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 632
;632:}
LABELV $301
endproc StartServer_AddMapType 12 0
export StartServer_InitMapPictureFromIndex
proc StartServer_InitMapPictureFromIndex 84 12
line 643
;633:
;634:
;635:
;636:
;637:/*
;638:=================
;639:StartServer_InitMapPictureFromIndex
;640:=================
;641:*/
;642:void StartServer_InitMapPictureFromIndex(mappic_t* mappic, int index)
;643:{
line 648
;644:	int i, j, tmp;
;645:	const char* info;
;646:	char mapname[MAPNAME_BUFFER];
;647:
;648:	memset(mappic, 0, sizeof(mappic_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 memset
CALLP4
pop
line 650
;649:
;650:	if (!maplist_loaded)
ADDRGP4 maplist_loaded
INDIRI4
CNSTI4 0
NEI4 $311
line 651
;651:		UI_LoadMapTypeInfo();
ADDRGP4 UI_LoadMapTypeInfo
CALLV
pop
LABELV $311
line 653
;652:
;653:	info = UI_GetArenaInfoByNumber( index );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 48
INDIRP4
ASGNP4
line 654
;654:	mappic->gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 656
;655:
;656:	Q_strncpyz(mapname, Info_ValueForKey( info, "map"), MAPNAME_BUFFER);
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 659
;657:
;658:	// find map on master and custom lists
;659:	for (i = 0; i < s_mapList.num_maps; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $314
line 660
;660:	{
line 661
;661:		if (Q_stricmp(mapname, s_mapList.mapName[i]))
ADDRLP4 12
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_mapList+3660
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $319
line 662
;662:			continue;
ADDRGP4 $315
JUMPV
LABELV $319
line 665
;663:
;664:		// find map in list
;665:		for (j = 0; j < s_mapList.num_maptypes; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
line 666
;666:		{
line 667
;667:			if ( i >= s_mapList.type_offset[j][MAPTYPE_MASTER_BEGIN] &&
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
ADDRGP4 s_mapList+12
ADDP4
INDIRI4
LTI4 $326
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
ADDRGP4 s_mapList+12+4
ADDP4
INDIRI4
GEI4 $326
line 669
;668:				i < s_mapList.type_offset[j][MAPTYPE_MASTER_END])
;669:			{
line 670
;670:				StartServer_AddMapType(mappic, j);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_AddMapType
CALLV
pop
line 671
;671:				break;
ADDRGP4 $324
JUMPV
LABELV $326
line 673
;672:			}
;673:			if ( i >= s_mapList.type_offset[j][MAPTYPE_CUSTOM_BEGIN] &&
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 80
INDIRI4
ADDRGP4 s_mapList+12+8
ADDP4
INDIRI4
LTI4 $331
ADDRLP4 4
INDIRI4
ADDRLP4 80
INDIRI4
ADDRGP4 s_mapList+12+12
ADDP4
INDIRI4
GEI4 $331
line 675
;674:				i < s_mapList.type_offset[j][MAPTYPE_CUSTOM_END])
;675:			{
line 676
;676:				StartServer_AddMapType(mappic, j);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_AddMapType
CALLV
pop
line 677
;677:				break;;
ADDRGP4 $324
JUMPV
LABELV $331
line 679
;678:			}
;679:		}
LABELV $323
line 665
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapList
INDIRI4
LTI4 $322
LABELV $324
line 680
;680:	}
LABELV $315
line 659
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $317
ADDRLP4 4
INDIRI4
ADDRGP4 s_mapList+4
INDIRI4
LTI4 $314
line 683
;681:
;682:	// sort the icons, so they're always displayed in the same order
;683:	for (i = 0; i < mappic->num_types - 1; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $340
JUMPV
LABELV $337
line 684
;684:		for (j = i + 1; j < mappic->num_types; j++)
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $341
line 685
;685:		{
line 686
;686:			if (mappic->type[j] < mappic->type[i])
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 68
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 68
INDIRP4
ADDP4
INDIRI4
GEI4 $345
line 687
;687:			{
line 688
;688:				tmp = mappic->type[j];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRI4
ASGNI4
line 689
;689:				mappic->type[j] = mappic->type[i];
ADDRLP4 72
CNSTI4 2
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 72
INDIRI4
LSHI4
ADDRLP4 76
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
LSHI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 690
;690:				mappic->type[i] = tmp;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 691
;691:			}
LABELV $345
line 692
;692:		}
LABELV $342
line 684
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $344
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
LTI4 $341
LABELV $338
line 683
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $340
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $337
line 695
;693:
;694:	// set the picture name, cache it
;695:	strcpy(mappic->mapname, mapname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 696
;696:	trap_R_RegisterShaderNoMip( va("levelshots/%s.tga", mapname) );
ADDRGP4 $347
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 697
;697:}
LABELV $310
endproc StartServer_InitMapPictureFromIndex 84 12
export StartServer_InitMapPicture
proc StartServer_InitMapPicture 32 8
line 707
;698:
;699:
;700:
;701:/*
;702:=================
;703:StartServer_InitMapPicture
;704:=================
;705:*/
;706:void StartServer_InitMapPicture(mappic_t* mappic, const char* mapname)
;707:{
line 712
;708:	int i;
;709:	const char* info;
;710:	int nummaps;
;711:
;712:	if (!mapname || !*mapname)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $351
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $349
LABELV $351
line 713
;713:		return;
ADDRGP4 $348
JUMPV
LABELV $349
line 716
;714:
;715:	// verify existance of map
;716:	nummaps = UI_GetNumArenas();
ADDRLP4 16
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 718
;717:
;718:	for( i = 0; i < nummaps; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $352
line 719
;719:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 721
;720:
;721:		if (!info) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $356
line 722
;722:			continue;
ADDRGP4 $353
JUMPV
LABELV $356
line 725
;723:		}
;724:
;725:		if (Q_stricmp(Info_ValueForKey( info, "map"), mapname))
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $358
line 726
;726:			continue;
ADDRGP4 $353
JUMPV
LABELV $358
line 728
;727:
;728:		StartServer_InitMapPictureFromIndex(mappic, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_InitMapPictureFromIndex
CALLV
pop
line 729
;729:		return;
ADDRGP4 $348
JUMPV
LABELV $353
line 718
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $355
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $352
line 731
;730:	}
;731:}
LABELV $348
endproc StartServer_InitMapPicture 32 8
export StartServer_DrawMapPicture
proc StartServer_DrawMapPicture 52 20
line 743
;732:
;733:
;734:
;735:
;736:
;737:/*
;738:=================
;739:StartServer_DrawMapPicture
;740:=================
;741:*/
;742:void StartServer_DrawMapPicture(int x, int y, int w, int h, mappic_t* mappic, vec4_t color)
;743:{
line 751
;744:	qhandle_t hpic;
;745:	int i;
;746:	int mapbits;
;747:	int colx, coly;
;748:	int icons;
;749:
;750:	// load and draw map picture
;751:	hpic = trap_R_RegisterShaderNoMip( va("levelshots/%s.tga", mappic->mapname) );
ADDRGP4 $347
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 752
;752:	if (!hpic)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $361
line 753
;753:		hpic = trap_R_RegisterShaderNoMip( MAP_ERRORPIC );
ADDRGP4 $363
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
LABELV $361
line 755
;754:
;755:	if (color)
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $364
line 756
;756:		trap_R_SetColor(color);
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
LABELV $364
line 758
;757:
;758:	UI_DrawHandlePic(x, y, w, h, hpic);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 760
;759:
;760:	if (color)
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $366
line 761
;761:	{
line 762
;762:		faded_color[0] = color[0];
ADDRGP4 faded_color
ADDRFP4 20
INDIRP4
INDIRF4
ASGNF4
line 763
;763:		faded_color[1] = color[1];
ADDRGP4 faded_color+4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 764
;764:		faded_color[2] = color[2];
ADDRGP4 faded_color+8
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 765
;765:		faded_color[3] = color[3] * 0.75;	// slight transparency
ADDRGP4 faded_color+12
CNSTF4 1061158912
ADDRFP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 766
;766:	}
ADDRGP4 $367
JUMPV
LABELV $366
line 767
;767:	else {
line 768
;768:		faded_color[0] = 1.0;
ADDRGP4 faded_color
CNSTF4 1065353216
ASGNF4
line 769
;769:		faded_color[1] = 1.0;
ADDRGP4 faded_color+4
CNSTF4 1065353216
ASGNF4
line 770
;770:		faded_color[2] = 1.0;
ADDRGP4 faded_color+8
CNSTF4 1065353216
ASGNF4
line 771
;771:		faded_color[3] = 0.75;	// slight transparency
ADDRGP4 faded_color+12
CNSTF4 1061158912
ASGNF4
line 772
;772:	}
LABELV $367
line 773
;773:	shadow_color[3] = faded_color[3];
ADDRGP4 shadow_color+12
ADDRGP4 faded_color+12
INDIRF4
ASGNF4
line 779
;774:
;775:	//
;776:	// overlay the icons
;777:	//
;778:
;779:	colx = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 780
;780:	coly = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 783
;781:
;782:	// built in game types first
;783:	icons = uie_mapicons.integer;
ADDRLP4 20
ADDRGP4 uie_mapicons+12
INDIRI4
ASGNI4
line 784
;784:	if (icons == MAPICONS_ALL)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $377
line 785
;785:	{
line 786
;786:		for (i = 0; i < NUM_GAMETYPES; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $379
line 787
;787:		{
line 788
;788:			mapbits = 1 << i;
ADDRLP4 16
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
ASGNI4
line 790
;789:
;790:			if (!(mapbits & mappic->gamebits))
ADDRLP4 16
INDIRI4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
BANDI4
CNSTI4 0
NEI4 $383
line 791
;791:				continue;
ADDRGP4 $380
JUMPV
LABELV $383
line 793
;792:
;793:			hpic = trap_R_RegisterShaderNoMip( maptype_icon[i] );
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 maptype_icon
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 794
;794:			if (!hpic)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $385
line 795
;795:				continue;
ADDRGP4 $380
JUMPV
LABELV $385
line 797
;796:
;797:			colx += MAPTYPE_ICONX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 798
;798:			if (colx > w)
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $387
line 799
;799:			{
line 800
;800:				colx = MAPTYPE_ICONX;
ADDRLP4 0
CNSTI4 20
ASGNI4
line 801
;801:				coly += MAPTYPE_ICONY;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 802
;802:			}
LABELV $387
line 804
;803:
;804:			trap_R_SetColor(shadow_color);
ADDRGP4 shadow_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 805
;805:			UI_DrawHandlePic(x + w - colx + 1, y + coly + 1, MAPTYPE_ICONX, MAPTYPE_ICONY, hpic);
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTF4 1101004800
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 807
;806:
;807:			trap_R_SetColor(faded_color);
ADDRGP4 faded_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 808
;808:			UI_DrawHandlePic(x + w - colx, y + coly, MAPTYPE_ICONX, MAPTYPE_ICONY, hpic);
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTF4 1101004800
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 809
;809:		}
LABELV $380
line 786
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 14
LTI4 $379
line 810
;810:	}
LABELV $377
line 812
;811:
;812:	if (icons != MAPICONS_NONE)
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $389
line 813
;813:	{
line 814
;814:		for (i = 0; i < mappic->num_types; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $394
JUMPV
LABELV $391
line 815
;815:		{
line 816
;816:			hpic = trap_R_RegisterShaderNoMip( s_mapList.mapGraphic[mappic->type[i]] );
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapList+1612
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 817
;817:			if (!hpic)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $396
line 818
;818:				continue;
ADDRGP4 $392
JUMPV
LABELV $396
line 820
;819:
;820:			colx += MAPTYPE_ICONX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 821
;821:			if (colx > w)
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $398
line 822
;822:			{
line 823
;823:				colx = MAPTYPE_ICONX;
ADDRLP4 0
CNSTI4 20
ASGNI4
line 824
;824:				coly += MAPTYPE_ICONY;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 825
;825:			}
LABELV $398
line 827
;826:
;827:			trap_R_SetColor(shadow_color);
ADDRGP4 shadow_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 828
;828:			UI_DrawHandlePic(x + w - colx + 1, y + coly + 1, MAPTYPE_ICONX, MAPTYPE_ICONY, hpic);
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTF4 1101004800
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 830
;829:
;830:			trap_R_SetColor(faded_color);
ADDRGP4 faded_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 831
;831:			UI_DrawHandlePic(x + w - colx, y + coly, MAPTYPE_ICONX, MAPTYPE_ICONY, hpic);
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTF4 1101004800
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 832
;832:		}
LABELV $392
line 814
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $394
ADDRLP4 8
INDIRI4
ADDRFP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
LTI4 $391
line 833
;833:	}
LABELV $389
line 835
;834:
;835:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 836
;836:}
LABELV $360
endproc StartServer_DrawMapPicture 52 20
export StartServer_LoadBotlessMaps
proc StartServer_LoadBotlessMaps 80 12
line 850
;837:
;838:
;839:
;840:
;841:/*
;842:=================
;843:StartServer_LoadBotlessMaps
;844:
;845:Creates a special group of maps that don't have
;846:.aas bot support files
;847:=================
;848:*/
;849:void StartServer_LoadBotlessMaps(void)
;850:{
line 857
;851:	int i, nummaps;
;852:	const char* info;
;853:	char mapname[MAPNAME_BUFFER];
;854:	fileHandle_t file;
;855:	int len, index;
;856:
;857:	StartServer_CreateMapType("NoBots","uie_icons/noammo");
ADDRGP4 $401
ARGP4
ADDRGP4 $402
ARGP4
ADDRGP4 StartServer_CreateMapType
CALLI4
pop
line 858
;858:	index = s_mapList.num_maptypes - 1;
ADDRLP4 52
ADDRGP4 s_mapList
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 859
;859:	s_mapList.noBotsIndex = index;
ADDRGP4 s_mapList+8
ADDRLP4 52
INDIRI4
ASGNI4
line 861
;860:	 
;861:	s_mapList.type_offset[index][MAPTYPE_MASTER_BEGIN] = s_mapList.num_maps;
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12
ADDP4
ADDRGP4 s_mapList+4
INDIRI4
ASGNI4
line 863
;862:
;863:	nummaps = UI_GetNumArenas();
ADDRLP4 56
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 56
INDIRI4
ASGNI4
line 864
;864:	for (i = 0; i < nummaps; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $406
line 865
;865:	{
line 866
;866:		info = UI_GetArenaInfoByNumber(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 60
INDIRP4
ASGNP4
line 867
;867:		if (!info)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $410
line 868
;868:			continue;
ADDRGP4 $407
JUMPV
LABELV $410
line 870
;869:
;870:		Q_strncpyz(mapname, Info_ValueForKey( info, "map"), MAPNAME_BUFFER) ;
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 871
;871:		len = trap_FS_FOpenFile(va("maps/%s.aas", mapname), &file, FS_READ);
ADDRGP4 $412
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 72
INDIRI4
ASGNI4
line 873
;872:
;873:		if (len >= 0) {
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $413
line 874
;874:			trap_FS_FCloseFile(file);
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 875
;875:			continue;
ADDRGP4 $407
JUMPV
LABELV $413
line 879
;876:		}
;877:
;878:		// no .aas file, so we can't play bots on this map
;879:		strcpy(s_mapList.mapName[s_mapList.num_maps], mapname);
ADDRGP4 s_mapList+4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_mapList+3660
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 880
;880:		s_mapList.num_maps++;
ADDRLP4 76
ADDRGP4 s_mapList+4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 881
;881:	}
LABELV $407
line 864
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $409
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $406
line 884
;882:
;883:	// update last map index
;884:	s_mapList.type_offset[index][MAPTYPE_MASTER_END] = s_mapList.num_maps;
ADDRLP4 52
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12+4
ADDP4
ADDRGP4 s_mapList+4
INDIRI4
ASGNI4
line 885
;885:}
LABELV $400
endproc StartServer_LoadBotlessMaps 80 12
export UI_LoadMapTypeInfo
proc UI_LoadMapTypeInfo 16 12
line 896
;886:
;887:
;888:
;889:
;890:/*
;891:=================
;892:UI_LoadMapTypeInfo
;893:=================
;894:*/
;895:void UI_LoadMapTypeInfo(void)
;896:{
line 900
;897:	int i;
;898:	int arenas;
;899:
;900:	if (maplist_loaded)
ADDRGP4 maplist_loaded
INDIRI4
CNSTI4 0
EQI4 $422
line 901
;901:		return;
ADDRGP4 $421
JUMPV
LABELV $422
line 904
;902:
;903:	// reset data
;904:	memset(&s_mapList, 0, sizeof(mapTypeList_t));
ADDRGP4 s_mapList
ARGP4
CNSTI4 0
ARGI4
CNSTI4 69196
ARGI4
ADDRGP4 memset
CALLP4
pop
line 906
;905:
;906:	s_mapList.num_maptypes = 0;
ADDRGP4 s_mapList
CNSTI4 0
ASGNI4
line 907
;907:	s_mapList.num_maps = 0;
ADDRGP4 s_mapList+4
CNSTI4 0
ASGNI4
line 908
;908:	s_mapList.noBotsIndex = -1;
ADDRGP4 s_mapList+8
CNSTI4 -1
ASGNI4
line 911
;909:
;910:	// load all the maps that don't have bot route files
;911:	StartServer_LoadBotlessMaps();
ADDRGP4 StartServer_LoadBotlessMaps
CALLV
pop
line 914
;912:
;913:	// load data files
;914:	StartServer_LoadCustomMapData("mapdata.txt", qfalse);
ADDRGP4 $426
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_LoadCustomMapData
CALLV
pop
line 915
;915:	StartServer_LoadCustomMapData("usermaps.txt", qtrue);
ADDRGP4 $427
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StartServer_LoadCustomMapData
CALLV
pop
line 918
;916:
;917:	// update map selection list so we can put custom maps on screen
;918:	for (i = 0; i < s_mapList.num_maptypes; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $428
line 919
;919:	{
line 920
;920:		mapfilter_items[MAPFILTER_MAX + i] = s_mapList.mapTypeName[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapfilter_items+12
ADDP4
CNSTI4 34
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapList+524
ADDP4
ASGNP4
line 921
;921:		randommaptype_items[MAP_RND_MAX + i] = s_mapList.mapTypeName[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 randommaptype_items+20
ADDP4
CNSTI4 34
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapList+524
ADDP4
ASGNP4
line 922
;922:	}
LABELV $429
line 918
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $431
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapList
INDIRI4
LTI4 $428
line 924
;923:
;924:	maplist_loaded = qtrue;
ADDRGP4 maplist_loaded
CNSTI4 1
ASGNI4
line 925
;925:}
LABELV $421
endproc UI_LoadMapTypeInfo 16 12
export StartServer_NumCustomMapTypes
proc StartServer_NumCustomMapTypes 0 0
line 936
;926:
;927:
;928:
;929:
;930:/*
;931:=================
;932:StartServer_NumCustomMapTypes
;933:=================
;934:*/
;935:int StartServer_NumCustomMapTypes(void)
;936:{
line 937
;937:	if (!maplist_loaded)
ADDRGP4 maplist_loaded
INDIRI4
CNSTI4 0
NEI4 $437
line 938
;938:		UI_LoadMapTypeInfo();
ADDRGP4 UI_LoadMapTypeInfo
CALLV
pop
LABELV $437
line 940
;939:
;940:	return s_mapList.num_maptypes;
ADDRGP4 s_mapList
INDIRI4
RETI4
LABELV $436
endproc StartServer_NumCustomMapTypes 0 0
export StartServer_MapIconFromType
proc StartServer_MapIconFromType 4 4
line 950
;941:}
;942:
;943:
;944:/*
;945:=================
;946:StartServer_MapIconFromType
;947:=================
;948:*/
;949:const char* StartServer_MapIconFromType(int gametype, qboolean isCustomMap)
;950:{
line 951
;951:	if (!maplist_loaded)
ADDRGP4 maplist_loaded
INDIRI4
CNSTI4 0
NEI4 $440
line 952
;952:		UI_LoadMapTypeInfo();
ADDRGP4 UI_LoadMapTypeInfo
CALLV
pop
LABELV $440
line 954
;953:
;954:	if (isCustomMap)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $442
line 955
;955:	{
line 956
;956:		if (gametype >= s_mapList.num_maptypes || gametype < 0)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapList
INDIRI4
GEI4 $446
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $444
LABELV $446
line 957
;957:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $439
JUMPV
LABELV $444
line 959
;958:
;959:		return s_mapList.mapGraphic[gametype];
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapList+1612
ADDP4
RETP4
ADDRGP4 $439
JUMPV
LABELV $442
line 962
;960:	}
;961:	else
;962:	{
line 963
;963:		return UIE_DefaultIconFromGameType(gametype);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 UIE_DefaultIconFromGameType
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $439
endproc StartServer_MapIconFromType 4 4
export StartServer_IsCustomMapType
proc StartServer_IsCustomMapType 20 8
line 976
;964:	}
;965:}
;966:
;967:
;968:
;969:
;970:/*
;971:=================
;972:StartServer_IsCustomMapType
;973:=================
;974:*/
;975:qboolean StartServer_IsCustomMapType(const char* mapname, int type)
;976:{
line 980
;977:	int i;
;978:	int end;
;979:
;980:	if (!maplist_loaded)
ADDRGP4 maplist_loaded
INDIRI4
CNSTI4 0
NEI4 $449
line 981
;981:		UI_LoadMapTypeInfo();
ADDRGP4 UI_LoadMapTypeInfo
CALLV
pop
LABELV $449
line 983
;982:
;983:	if (type >= s_mapList.num_maptypes || type < 0)
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 s_mapList
INDIRI4
GEI4 $453
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $451
LABELV $453
line 984
;984:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $448
JUMPV
LABELV $451
line 986
;985:
;986:	end = s_mapList.type_offset[type][MAPTYPE_MASTER_END];
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12+4
ADDP4
INDIRI4
ASGNI4
line 987
;987:	for (i = s_mapList.type_offset[type][MAPTYPE_MASTER_BEGIN]; i < end; i++)
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $459
JUMPV
LABELV $456
line 988
;988:		if (!Q_stricmp(mapname, s_mapList.mapName[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_mapList+3660
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $461
line 989
;989:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $448
JUMPV
LABELV $461
LABELV $457
line 987
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $459
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $456
line 991
;990:
;991:	end = s_mapList.type_offset[type][MAPTYPE_CUSTOM_END];
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12+12
ADDP4
INDIRI4
ASGNI4
line 992
;992:	for (i = s_mapList.type_offset[type][MAPTYPE_CUSTOM_BEGIN]; i < end; i++)
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_mapList+12+8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $469
JUMPV
LABELV $466
line 993
;993:		if (!Q_stricmp(mapname, s_mapList.mapName[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_mapList+3660
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $472
line 994
;994:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $448
JUMPV
LABELV $472
LABELV $467
line 992
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $469
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $466
line 996
;995:
;996:	return qfalse;
CNSTI4 0
RETI4
LABELV $448
endproc StartServer_IsCustomMapType 20 8
bss
align 4
LABELV s_mapList
skip 69196
import gametype_cvar_base
import randommaptype_itemsru
import randommaptype_items
import gametype_itemsru
import gametype_items
import idmap_list
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
LABELV $427
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $426
byte 1 109
byte 1 97
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $412
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $402
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $401
byte 1 78
byte 1 111
byte 1 66
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $363
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $347
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $313
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $280
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $275
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 100
byte 1 117
byte 1 112
byte 1 108
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 115
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $253
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $241
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 108
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $218
byte 1 85
byte 1 73
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 77
byte 1 97
byte 1 112
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $202
byte 1 91
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 93
byte 1 0
align 1
LABELV $192
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $183
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $170
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $162
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $159
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $156
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 116
byte 1 102
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
LABELV $150
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
LABELV $147
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
LABELV $144
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $141
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $135
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $132
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $129
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $126
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 112
byte 1 108
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $123
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $120
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $111
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
byte 1 103
byte 1 116
byte 1 95
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $110
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
byte 1 103
byte 1 116
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $109
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
byte 1 103
byte 1 116
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $108
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
byte 1 103
byte 1 116
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
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $107
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
byte 1 103
byte 1 116
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
LABELV $106
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
byte 1 103
byte 1 116
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
byte 1 103
byte 1 116
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
LABELV $104
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
byte 1 103
byte 1 116
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
LABELV $103
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
byte 1 103
byte 1 116
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $102
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
byte 1 103
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $101
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
byte 1 103
byte 1 116
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
LABELV $100
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
byte 1 103
byte 1 116
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $99
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
byte 1 103
byte 1 116
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $98
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
byte 1 103
byte 1 116
byte 1 95
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $97
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 179
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $96
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $95
byte 1 79
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $94
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $93
byte 1 79
byte 1 102
byte 1 102
byte 1 0
