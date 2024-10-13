code
proc CG_DrawLoadingIcons 16 20
file "../../../code/cgame/cg_info.c"
line 41
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:// cg_info.c -- display information while data is being loading
;24:
;25:#include "cg_local.h"
;26:
;27:#define MAX_LOADING_PLAYER_ICONS	64
;28:#define MAX_LOADING_ITEM_ICONS		256
;29:
;30:static int			loadingPlayerIconCount;
;31:static int			loadingItemIconCount;
;32:static qhandle_t	loadingPlayerIcons[MAX_LOADING_PLAYER_ICONS];
;33:static qhandle_t	loadingItemIcons[MAX_LOADING_ITEM_ICONS];
;34:
;35:
;36:/*
;37:===================
;38:CG_DrawLoadingIcons
;39:===================
;40:*/
;41:static void CG_DrawLoadingIcons( void ) {
line 45
;42:	int		n;
;43:	int		x, y;
;44:
;45:	for( n = 0; n < loadingPlayerIconCount; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 46
;46:		x = 8 + n * 36 - cl_screenoffset.integer;
ADDRLP4 4
CNSTI4 36
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ASGNI4
line 47
;47:		y = 440-32;
ADDRLP4 8
CNSTI4 408
ASGNI4
line 48
;48:		CG_DrawPic( x, y, 32, 32, loadingPlayerIcons[n] );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1107296256
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 49
;49:	}
LABELV $83
line 45
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 0
INDIRI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
LTI4 $82
line 51
;50:
;51:	for( n = 0; n < loadingItemIconCount; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $87
line 52
;52:		y = 480-20;
ADDRLP4 8
CNSTI4 460
ASGNI4
line 53
;53:		x = 8 + n * 18- cl_screenoffset.integer;
ADDRLP4 4
CNSTI4 18
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ASGNI4
line 54
;54:		CG_DrawPic( x, y, 16, 16, loadingItemIcons[n] );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1098907648
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingItemIcons
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 55
;55:	}
LABELV $88
line 51
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $90
ADDRLP4 0
INDIRI4
ADDRGP4 loadingItemIconCount
INDIRI4
LTI4 $87
line 56
;56:}
LABELV $81
endproc CG_DrawLoadingIcons 16 20
export CG_LoadingString
proc CG_LoadingString 0 12
line 65
;57:
;58:
;59:/*
;60:======================
;61:CG_LoadingString
;62:
;63:======================
;64:*/
;65:void CG_LoadingString( const char *s ) {
line 66
;66:	Q_strncpyz( cg.infoScreenText, s, sizeof( cg.infoScreenText ) );
ADDRGP4 cg+1871008
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 68
;67:
;68:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 69
;69:}
LABELV $92
endproc CG_LoadingString 0 12
export CG_LoadingItem
proc CG_LoadingItem 16 4
line 76
;70:
;71:/*
;72:===================
;73:CG_LoadingItem
;74:===================
;75:*/
;76:void CG_LoadingItem( int itemNum ) {
line 79
;77:	gitem_t		*item;
;78:
;79:	item = &bg_itemlist[itemNum];
ADDRLP4 0
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 81
;80:	
;81:	if ( item->icon && loadingItemIconCount < MAX_LOADING_ITEM_ICONS ) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $96
ADDRGP4 loadingItemIconCount
INDIRI4
CNSTI4 256
GEI4 $96
line 82
;82:		loadingItemIcons[loadingItemIconCount++] = trap_R_RegisterShaderNoMip( item->icon );
ADDRLP4 8
ADDRGP4 loadingItemIconCount
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
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingItemIcons
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 83
;83:	}
LABELV $96
line 84
;84:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $98
line 85
;85:	CG_LoadingString( item->pickup_name );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 86
;86:	}
LABELV $98
line 87
;87:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $101
line 88
;88:	CG_LoadingString( item->pickup_nameru );
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 89
;89:	}
LABELV $101
line 90
;90:}
LABELV $95
endproc CG_LoadingItem 16 4
export CG_LoadingClient
proc CG_LoadingClient 220 20
line 97
;91:
;92:/*
;93:===================
;94:CG_LoadingClient
;95:===================
;96:*/
;97:void CG_LoadingClient( int clientNum ) {
line 104
;98:	const char		*info;
;99:	char			*skin;
;100:	char			personality[MAX_QPATH];
;101:	char			model[MAX_QPATH];
;102:	char			iconName[MAX_QPATH];
;103:
;104:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRFP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 200
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 200
INDIRP4
ASGNP4
line 106
;105:
;106:	if ( loadingPlayerIconCount < MAX_LOADING_PLAYER_ICONS ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 64
GEI4 $105
line 107
;107:		Q_strncpyz( model, Info_ValueForKey( info, "model" ), sizeof( model ) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $107
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 108
;108:		skin = strrchr( model, '/' );
ADDRLP4 72
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 208
ADDRGP4 strrchr
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 208
INDIRP4
ASGNP4
line 109
;109:		if ( skin ) {
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $108
line 110
;110:			*skin++ = '\0';
ADDRLP4 212
ADDRLP4 68
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 212
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI1 0
ASGNI1
line 111
;111:		} else {
ADDRGP4 $109
JUMPV
LABELV $108
line 112
;112:			skin = "default";
ADDRLP4 68
ADDRGP4 $110
ASGNP4
line 113
;113:		}
LABELV $109
line 115
;114:
;115:		Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $111
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 117
;116:		
;117:		loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 212
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 212
INDIRI4
ASGNI4
line 118
;118:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $112
line 119
;119:			Com_sprintf( iconName, MAX_QPATH, "models/players/characters/%s/icon_%s.tga", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $114
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 120
;120:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 121
;121:		}
LABELV $112
line 122
;122:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $115
line 123
;123:			Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", DEFAULT_MODEL, "default" );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $111
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 124
;124:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 125
;125:		}
LABELV $115
line 126
;126:		if ( loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
EQI4 $118
line 127
;127:			loadingPlayerIconCount++;
ADDRLP4 216
ADDRGP4 loadingPlayerIconCount
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 128
;128:		}
LABELV $118
line 129
;129:	}
LABELV $105
line 131
;130:
;131:	Q_strncpyz( personality, Info_ValueForKey( info, "n" ), sizeof(personality) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 132
;132:	Q_CleanStr( personality );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 134
;133:
;134:	CG_LoadingString( personality );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 135
;135:}
LABELV $104
endproc CG_LoadingClient 220 20
export CG_DrawInformation
proc CG_DrawInformation 1116 20
line 145
;136:
;137:
;138:/*
;139:====================
;140:CG_DrawInformation
;141:
;142:Draw all the status / pacifier stuff during level loading
;143:====================
;144:*/
;145:void CG_DrawInformation( void ) {
line 155
;146:	const char	*s;
;147:	const char	*info;
;148:	const char	*sysInfo;
;149:	int			y;
;150:	int			value;
;151:	qhandle_t	levelshot;
;152:	qhandle_t	detail;
;153:	char		buf[1024];
;154:
;155:	info = CG_ConfigString( CS_SERVERINFO );
CNSTI4 0
ARGI4
ADDRLP4 1052
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 1052
INDIRP4
ASGNP4
line 156
;156:	sysInfo = CG_ConfigString( CS_SYSTEMINFO );
CNSTI4 1
ARGI4
ADDRLP4 1056
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1056
INDIRP4
ASGNP4
line 158
;157:
;158:	s = Info_ValueForKey( info, "mapname" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1060
INDIRP4
ASGNP4
line 159
;159:    if(cgs.gametype == GT_SINGLE || Q_stricmp (s, "uimap_1") == 0){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $127
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $123
LABELV $127
line 160
;160:		return;
ADDRGP4 $121
JUMPV
LABELV $123
line 162
;161:    }
;162:	levelshot = trap_R_RegisterShaderNoMip( va( "levelshots/%s.tga", s ) );
ADDRGP4 $128
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1072
INDIRI4
ASGNI4
line 163
;163:	if ( !levelshot ) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $129
line 164
;164:		levelshot = trap_R_RegisterShaderNoMip( "menu/art/unknownmap" );
ADDRGP4 $131
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1076
INDIRI4
ASGNI4
line 165
;165:	}
LABELV $129
line 166
;166:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 169
;167:
;168:	// blend a detail texture over it
;169:	detail	= trap_R_RegisterShaderNoMip( "menu/animbg" );
ADDRGP4 $132
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1076
INDIRI4
ASGNI4
line 170
;170:	CG_DrawPic( -1 - cl_screenoffset.integer, 0, 642 + cl_screenoffset.integer*2, 480, detail );
CNSTI4 -1
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 642
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 171
;171:	CG_DrawPic( -1 - cl_screenoffset.integer, 0, 642 + cl_screenoffset.integer*2, 480, trap_R_RegisterShaderNoMip( "menu/art/blacktrans" ) );
ADDRGP4 $137
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTI4 -1
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 642
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 172
;172:	CG_DrawPic( 30, 180-58, 280, 200, levelshot );
CNSTF4 1106247680
ARGF4
CNSTF4 1123287040
ARGF4
CNSTF4 1133248512
ARGF4
CNSTF4 1128792064
ARGF4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 175
;173:
;174:	// draw the icons of things as they are loaded
;175:	CG_DrawLoadingIcons();
ADDRGP4 CG_DrawLoadingIcons
CALLV
pop
line 179
;176:
;177:	// the first 150 rows are reserved for the client connection
;178:	// screen to write into
;179:	if ( cg.infoScreenText[0] ) {
ADDRGP4 cg+1871008
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $138
line 180
;180:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $141
line 181
;181:		CG_DrawBigString( 320, 128, va("Loading... %s", cg.infoScreenText), 1.0F );
ADDRGP4 $144
ARGP4
ADDRGP4 cg+1871008
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 1084
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 182
;182:		}
LABELV $141
line 183
;183:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $139
line 184
;184:		CG_DrawBigString( 320, 128, va("Загрузка... %s", cg.infoScreenText), 1.0F );
ADDRGP4 $149
ARGP4
ADDRGP4 cg+1871008
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 1084
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 185
;185:		}
line 186
;186:	} else {
ADDRGP4 $139
JUMPV
LABELV $138
line 187
;187:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $151
line 188
;188:		CG_DrawBigString( 320, 128, "Connecting...", 1.0F );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 $154
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 189
;189:		}
LABELV $151
line 190
;190:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $155
line 191
;191:		CG_DrawBigString( 320, 128, "Подключение...", 1.0F );	
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 $158
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 192
;192:		}
LABELV $155
line 193
;193:	}
LABELV $139
line 197
;194:
;195:	// draw info string information
;196:
;197:	y = 220-32;
ADDRLP4 4
CNSTI4 188
ASGNI4
line 200
;198:
;199:	// don't print server lines if playing a local game
;200:	trap_Cvar_VariableStringBuffer( "sv_running", buf, sizeof( buf ) );
ADDRGP4 $159
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 201
;201:	if ( !atoi( buf ) ) {
ADDRLP4 16
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $160
line 203
;202:		// server hostname
;203:		Q_strncpyz(buf, Info_ValueForKey( info, "sv_hostname" ), 1024);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 204
;204:		Q_CleanStr(buf);
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 205
;205:		CG_DrawBigString( 320, y, buf, 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 206
;206:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 209
;207:
;208:		// pure server
;209:		s = Info_ValueForKey( sysInfo, "sv_pure" );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1092
INDIRP4
ASGNP4
line 210
;210:		if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $165
line 211
;211:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $167
line 212
;212:			CG_DrawBigString( 320, y, "Pure Server", 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $170
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 213
;213:			}
LABELV $167
line 214
;214:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $171
line 215
;215:			CG_DrawBigString( 320, y, "Чистый Сервер", 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $174
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 216
;216:			}
LABELV $171
line 217
;217:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 218
;218:		}
LABELV $165
line 221
;219:
;220:		// server-specific message of the day
;221:		s = CG_ConfigString( CS_MOTD );
CNSTI4 4
ARGI4
ADDRLP4 1096
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1096
INDIRP4
ASGNP4
line 222
;222:		if ( s[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $176
line 223
;223:			CG_DrawBigString( 320, y, s, 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 224
;224:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 225
;225:		}
LABELV $176
line 228
;226:
;227:		// some extra space after hostname and motd
;228:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 229
;229:	}
LABELV $160
line 232
;230:
;231:	// map-specific message (long map name)
;232:	s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 1088
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1088
INDIRP4
ASGNP4
line 233
;233:	if ( s[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $179
line 234
;234:		CG_DrawBigString( 320, y, s, 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 235
;235:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 236
;236:	}
LABELV $179
line 239
;237:	
;238:	// QSandbox by Noire.dev
;239:		CG_DrawBigString( 320, y, "^2QSandbox by Noire.dev", 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $182
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 240
;240:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 243
;241:
;242:	// cheats warning
;243:	s = Info_ValueForKey( sysInfo, "sv_cheats" );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1092
INDIRP4
ASGNP4
line 244
;244:	if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $185
line 245
;245:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $187
line 246
;246:		CG_DrawBigString( 320, y, "CHEATS ARE ENABLED", 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $190
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 247
;247:		}
LABELV $187
line 248
;248:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $191
line 249
;249:		CG_DrawBigString( 320, y, "ЧИТЫ ВКЛЮЧЕНЫ", 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $194
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 250
;250:		}
LABELV $191
line 251
;251:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 252
;252:	}
LABELV $185
line 254
;253:
;254:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $196
line 256
;255:	// game type
;256:	switch ( cgs.gametype ) {
ADDRLP4 1096
ADDRGP4 cgs+339040
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
LTI4 $199
ADDRLP4 1096
INDIRI4
CNSTI4 13
GTI4 $199
ADDRLP4 1096
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $232
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $232
address $203
address $205
address $207
address $209
address $211
address $213
address $215
address $217
address $219
address $221
address $223
address $225
address $227
address $229
code
LABELV $203
line 258
;257:	case GT_SANDBOX:
;258:		s = "Sandbox";
ADDRLP4 0
ADDRGP4 $204
ASGNP4
line 259
;259:		break;
ADDRGP4 $200
JUMPV
LABELV $205
line 261
;260:	case GT_FFA:
;261:		s = "Free For All";
ADDRLP4 0
ADDRGP4 $206
ASGNP4
line 262
;262:		break;
ADDRGP4 $200
JUMPV
LABELV $207
line 264
;263:	case GT_SINGLE:
;264:		s = "Single Player";
ADDRLP4 0
ADDRGP4 $208
ASGNP4
line 265
;265:		break;
ADDRGP4 $200
JUMPV
LABELV $209
line 267
;266:	case GT_TOURNAMENT:
;267:		s = "Tournament";
ADDRLP4 0
ADDRGP4 $210
ASGNP4
line 268
;268:		break;
ADDRGP4 $200
JUMPV
LABELV $211
line 270
;269:	case GT_TEAM:
;270:		s = "Team Deathmatch";
ADDRLP4 0
ADDRGP4 $212
ASGNP4
line 271
;271:		break;
ADDRGP4 $200
JUMPV
LABELV $213
line 273
;272:	case GT_CTF:
;273:		s = "Capture The Flag";
ADDRLP4 0
ADDRGP4 $214
ASGNP4
line 274
;274:		break;
ADDRGP4 $200
JUMPV
LABELV $215
line 276
;275:	case GT_1FCTF:
;276:		s = "One Flag CTF";
ADDRLP4 0
ADDRGP4 $216
ASGNP4
line 277
;277:		break;
ADDRGP4 $200
JUMPV
LABELV $217
line 279
;278:	case GT_OBELISK:
;279:		s = "Overload";
ADDRLP4 0
ADDRGP4 $218
ASGNP4
line 280
;280:		break;
ADDRGP4 $200
JUMPV
LABELV $219
line 282
;281:	case GT_HARVESTER:
;282:		s = "Harvester";
ADDRLP4 0
ADDRGP4 $220
ASGNP4
line 283
;283:		break;
ADDRGP4 $200
JUMPV
LABELV $221
line 285
;284:	case GT_ELIMINATION:
;285:		s = "Elimination";
ADDRLP4 0
ADDRGP4 $222
ASGNP4
line 286
;286:		break;
ADDRGP4 $200
JUMPV
LABELV $223
line 288
;287:	case GT_CTF_ELIMINATION:
;288:		s = " CTF Elimination";
ADDRLP4 0
ADDRGP4 $224
ASGNP4
line 289
;289:		break;
ADDRGP4 $200
JUMPV
LABELV $225
line 291
;290:	case GT_LMS:
;291:		s = "Last Man Standing";
ADDRLP4 0
ADDRGP4 $226
ASGNP4
line 292
;292:		break;
ADDRGP4 $200
JUMPV
LABELV $227
line 294
;293:	case GT_DOUBLE_D:
;294:		s = "Double Domination";
ADDRLP4 0
ADDRGP4 $228
ASGNP4
line 295
;295:		break;
ADDRGP4 $200
JUMPV
LABELV $229
line 297
;296:        case GT_DOMINATION:
;297:		s = "Domination";
ADDRLP4 0
ADDRGP4 $230
ASGNP4
line 298
;298:		break;
ADDRGP4 $200
JUMPV
LABELV $199
line 300
;299:	default:
;300:		s = "Unknown Gametype";
ADDRLP4 0
ADDRGP4 $231
ASGNP4
line 301
;301:		break;
LABELV $200
line 303
;302:	}
;303:}
LABELV $196
line 304
;304:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $233
line 306
;305:	// game type
;306:	switch ( cgs.gametype ) {
ADDRLP4 1096
ADDRGP4 cgs+339040
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
LTI4 $236
ADDRLP4 1096
INDIRI4
CNSTI4 13
GTI4 $236
ADDRLP4 1096
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $269
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $269
address $240
address $242
address $244
address $246
address $248
address $250
address $252
address $254
address $256
address $258
address $260
address $262
address $264
address $266
code
LABELV $240
line 308
;307:	case GT_SANDBOX:
;308:		s = "Песочница";
ADDRLP4 0
ADDRGP4 $241
ASGNP4
line 309
;309:		break;
ADDRGP4 $237
JUMPV
LABELV $242
line 311
;310:	case GT_FFA:
;311:		s = "Все против всех";
ADDRLP4 0
ADDRGP4 $243
ASGNP4
line 312
;312:		break;
ADDRGP4 $237
JUMPV
LABELV $244
line 314
;313:	case GT_SINGLE:
;314:		s = "Одиночная Игра";
ADDRLP4 0
ADDRGP4 $245
ASGNP4
line 315
;315:		break;
ADDRGP4 $237
JUMPV
LABELV $246
line 317
;316:	case GT_TOURNAMENT:
;317:		s = "Турнир";
ADDRLP4 0
ADDRGP4 $247
ASGNP4
line 318
;318:		break;
ADDRGP4 $237
JUMPV
LABELV $248
line 320
;319:	case GT_TEAM:
;320:		s = "Командный бой";
ADDRLP4 0
ADDRGP4 $249
ASGNP4
line 321
;321:		break;
ADDRGP4 $237
JUMPV
LABELV $250
line 323
;322:	case GT_CTF:
;323:		s = "Захват флага";
ADDRLP4 0
ADDRGP4 $251
ASGNP4
line 324
;324:		break;
ADDRGP4 $237
JUMPV
LABELV $252
line 326
;325:	case GT_1FCTF:
;326:		s = "Один флаг";
ADDRLP4 0
ADDRGP4 $253
ASGNP4
line 327
;327:		break;
ADDRGP4 $237
JUMPV
LABELV $254
line 329
;328:	case GT_OBELISK:
;329:		s = "Атака базы";
ADDRLP4 0
ADDRGP4 $255
ASGNP4
line 330
;330:		break;
ADDRGP4 $237
JUMPV
LABELV $256
line 332
;331:	case GT_HARVESTER:
;332:		s = "Жнец";
ADDRLP4 0
ADDRGP4 $257
ASGNP4
line 333
;333:		break;
ADDRGP4 $237
JUMPV
LABELV $258
line 335
;334:	case GT_ELIMINATION:
;335:		s = "Устранение";
ADDRLP4 0
ADDRGP4 $259
ASGNP4
line 336
;336:		break;
ADDRGP4 $237
JUMPV
LABELV $260
line 338
;337:	case GT_CTF_ELIMINATION:
;338:		s = "Устранение: Захват флага";
ADDRLP4 0
ADDRGP4 $261
ASGNP4
line 339
;339:		break;
ADDRGP4 $237
JUMPV
LABELV $262
line 341
;340:	case GT_LMS:
;341:		s = "Последний оставшийся";
ADDRLP4 0
ADDRGP4 $263
ASGNP4
line 342
;342:		break;
ADDRGP4 $237
JUMPV
LABELV $264
line 344
;343:	case GT_DOUBLE_D:
;344:		s = "Двойное доминирование";
ADDRLP4 0
ADDRGP4 $265
ASGNP4
line 345
;345:		break;
ADDRGP4 $237
JUMPV
LABELV $266
line 347
;346:        case GT_DOMINATION:
;347:		s = "Доминирование";
ADDRLP4 0
ADDRGP4 $267
ASGNP4
line 348
;348:		break;
ADDRGP4 $237
JUMPV
LABELV $236
line 350
;349:	default:
;350:		s = "Неизвесный режим";
ADDRLP4 0
ADDRGP4 $268
ASGNP4
line 351
;351:		break;
LABELV $237
line 353
;352:	}
;353:}
LABELV $233
line 354
;354:	CG_DrawBigString( 320, y, s, 1.0F );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 355
;355:	y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 356
;356:	value = atoi( Info_ValueForKey( info, "timelimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1100
INDIRI4
ASGNI4
line 357
;357:	if ( value ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $272
line 358
;358:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $274
line 359
;359:		CG_DrawBigString( 320, y, va( "Time limit %i", value ), 1.0F );
ADDRGP4 $277
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 360
;360:		}
LABELV $274
line 361
;361:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $278
line 362
;362:		CG_DrawBigString( 320, y, va( "Лимит времени %i", value ), 1.0F );
ADDRGP4 $281
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 363
;363:		}
LABELV $278
line 364
;364:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 365
;365:	}
LABELV $272
line 367
;366:
;367:	if (cgs.gametype < GT_CTF || cgs.ffa_gt>0) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
LTI4 $287
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 0
LEI4 $283
LABELV $287
line 368
;368:		value = atoi( Info_ValueForKey( info, "fraglimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 1104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1108
INDIRI4
ASGNI4
line 369
;369:		if ( value ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $289
line 370
;370:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $291
line 371
;371:			CG_DrawBigString( 320, y, va( "Frag limit %i", value ), 1.0F );
ADDRGP4 $294
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 372
;372:			}
LABELV $291
line 373
;373:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $295
line 374
;374:			CG_DrawBigString( 320, y, va( "Лимит фрагов %i", value ), 1.0F );
ADDRGP4 $298
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 375
;375:			}
LABELV $295
line 376
;376:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 377
;377:		}
LABELV $289
line 378
;378:	}
LABELV $283
line 380
;379:
;380:	if (cgs.gametype >= GT_CTF && cgs.ffa_gt == 0) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
LTI4 $300
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 0
NEI4 $300
line 381
;381:		value = atoi( Info_ValueForKey( info, "capturelimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 1104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1108
INDIRI4
ASGNI4
line 382
;382:		if ( value ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $305
line 383
;383:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $307
line 384
;384:			CG_DrawBigString( 320, y, va( "Сapture limit %i", value ), 1.0F );
ADDRGP4 $310
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 385
;385:			}
LABELV $307
line 386
;386:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $311
line 387
;387:			CG_DrawBigString( 320, y, va( "Лимит захвата %i", value ), 1.0F );
ADDRGP4 $314
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 388
;388:			}
LABELV $311
line 389
;389:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 390
;390:		}
LABELV $305
line 391
;391:	}
LABELV $300
line 392
;392:}
LABELV $121
endproc CG_DrawInformation 1116 20
bss
align 4
LABELV loadingItemIcons
skip 1024
align 4
LABELV loadingPlayerIcons
skip 256
align 4
LABELV loadingItemIconCount
skip 4
align 4
LABELV loadingPlayerIconCount
skip 4
import wideAdjustX
import CG_NewParticleArea
import initparticles
import CG_LaunchFragment
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel_MiTech
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound_MiTech
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_Atmospheric_SetParticles
import CG_AddAtmosphericEffects
import teamcolormodels
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformationRus
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_SpurtBlood
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_LeiPuff
import CG_LeiSparks2
import CG_LeiSparks
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponBarNew2
import CG_DrawWeaponBarNew
import CG_DrawWeaponBar0
import CG_DrawWeaponSelect
import CG_AddRealWeapon
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_GravitygunTrail
import CG_PhysgunTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainVehicleEvent
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_ReloadPlayers
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_AddToGenericConsole
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModelCopy
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrintRus
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import CG_DrawFade
import CG_Fade
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_InsideBox
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawGiantString
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_DrawRoundedRect
import CG_FillRect2
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_CloadMap_f
import CG_FairCvars
import SnapVectorTowards
import CG_RegisterOverlay
import CG_IsTeamGame
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_PredictWeaponEffects
import cg_teamChatBeep
import cg_chatBeep
import cg_weaponOrder
import cg_weaponBarStyle
import cg_crosshairColorBlue
import cg_crosshairColorGreen
import cg_crosshairColorRed
import cg_ch13size
import cg_ch13
import cg_ch12size
import cg_ch12
import cg_ch11size
import cg_ch11
import cg_ch10size
import cg_ch10
import cg_ch9slze
import cg_ch9size
import cg_ch9
import cg_ch8size
import cg_ch8
import cg_ch7size
import cg_ch7
import cg_ch6size
import cg_ch6
import cg_ch5size
import cg_ch5
import cg_ch4size
import cg_ch4
import cg_ch3size
import cg_ch3
import cg_ch2size
import cg_ch2
import cg_ch1size
import cg_ch1
import cg_differentCrosshairs
import cg_crosshairPulse
import cg_atmosphericLevel
import cg_fragmsgsize
import cg_autovertex
import cg_vote_custom_commands
import cg_cyclegrapple
import cg_voteflags
import cg_voip_teamonly
import cg_hitsound
import cg_alwaysWeaponBar
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_delag
import cg_enableBreath
import cg_enableDust
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_music
import cg_trueLightning
import cg_oldPlasma
import cg_cameraEyes_Up
import cg_cameraEyes_Fwd
import cg_cameraEyes
import cg_cameramode
import cg_leiBrassNoise
import cg_leiGoreNoise
import cg_leiEnhancement
import cg_lodScale
import cg_letterBoxSize
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_float
import pmove_msec
import pmove_fixed
import cg_commonConsole
import cg_teamChatLines
import cg_chatLines
import cg_commonConsoleLines
import cg_consoleLines
import cg_teamChatSizeY
import cg_teamChatSizeX
import cg_chatSizeY
import cg_chatSizeX
import cg_consoleSizeY
import cg_consoleSizeX
import cg_fontShadow
import cg_fontScale
import cg_consoleTime
import cg_chatTime
import cg_newConsole
import cg_newFont
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_stats
import cg_teamChatScaleY
import cg_teamChatScaleX
import cg_chatY
import cg_teamChatY
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPersonOffset
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_bigheadMode
import cg_disableLevelStartFade
import cg_paintballMode
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairScale
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_drawSyncMessage
import cg_drawsubtitles
import cg_centertime
import cg_gibtime
import cg_itemstyle
import cg_oldscoreboard
import team_legsskin
import legsskin
import ui_backcolors
import cl_screenoffset
import cg_cameraeyes
import cg_leiChibi
import cg_plightradius
import cg_plightblue
import cg_plightgreen
import cg_plightred
import cg_tolightblue
import cg_tolightgreen
import cg_tolightred
import cg_hetex
import cg_totex
import cg_ptex
import cg_helightblue
import cg_helightgreen
import cg_helightred
import con_notifytime
import cl_language
import cg_toolguninfo
import cg_postprocess
import cg_hide255
import sb_texturename
import sb_texture_view
import sb_classnum_view
import toolgun_modelst
import toolgun_toolmode4
import toolgun_toolmode3
import toolgun_toolmode2
import toolgun_toolmode1
import toolgun_tooltip4
import toolgun_tooltip3
import toolgun_tooltip2
import toolgun_tooltip1
import toolgun_tooltext
import toolgun_toolcmd4
import toolgun_toolcmd3
import toolgun_toolcmd2
import toolgun_toolcmd1
import toolgun_tool
import toolgun_mod19
import toolgun_mod18
import toolgun_mod17
import toolgun_mod16
import toolgun_mod15
import toolgun_mod14
import toolgun_mod13
import toolgun_mod12
import toolgun_mod11
import toolgun_mod10
import toolgun_mod9
import toolgun_mod8
import toolgun_mod7
import toolgun_mod6
import toolgun_mod5
import toolgun_mod4
import toolgun_mod3
import toolgun_mod2
import toolgun_mod1
import cg_weaponBarActiveWidth
import cg_weaponselecttime
import cg_itemscaletime
import cg_zoomtime
import cg_gibmodifier
import cg_gibvelocity
import cg_gibjump
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
import g_gametype
import mod_skyColorA
import mod_skyColorB
import mod_skyColorG
import mod_skyColorR
import mod_skyShader
import mod_fogColorA
import mod_fogColorB
import mod_fogColorG
import mod_fogColorR
import mod_fogInterval
import mod_fogDistance
import mod_fogShader
import mod_fogModel
import mod_zround
import mod_gravity
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_ammolimit
import mod_noplayerclip
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_amdelay
import mod_ftdelay
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgdelay
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_sgspread
import mod_sgcount
import mod_lgrange
import mod_cgspread
import mod_mgspread
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $314
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $310
byte 1 208
byte 1 161
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $304
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $298
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $294
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $288
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $281
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $277
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $271
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $268
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $267
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $265
byte 1 208
byte 1 148
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $263
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $261
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 58
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $259
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $257
byte 1 208
byte 1 150
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 134
byte 1 0
align 1
LABELV $255
byte 1 208
byte 1 144
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $253
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 0
align 1
LABELV $251
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $249
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
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $247
byte 1 208
byte 1 162
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $245
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
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
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $243
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
byte 1 0
align 1
LABELV $241
byte 1 208
byte 1 159
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $231
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $230
byte 1 68
byte 1 111
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
LABELV $228
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 111
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
LABELV $226
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $224
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
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
LABELV $222
byte 1 69
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
LABELV $220
byte 1 72
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
LABELV $218
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $216
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $214
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $212
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $210
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $208
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $206
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $204
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $194
byte 1 208
byte 1 167
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 171
byte 1 32
byte 1 208
byte 1 146
byte 1 208
byte 1 154
byte 1 208
byte 1 155
byte 1 208
byte 1 174
byte 1 208
byte 1 167
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $190
byte 1 67
byte 1 72
byte 1 69
byte 1 65
byte 1 84
byte 1 83
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 32
byte 1 69
byte 1 78
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $184
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $182
byte 1 94
byte 1 50
byte 1 81
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 78
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 100
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $174
byte 1 208
byte 1 167
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
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
LABELV $170
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $162
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $159
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
LABELV $158
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $154
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $149
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $144
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $137
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
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $131
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
LABELV $128
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
LABELV $126
byte 1 117
byte 1 105
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $122
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 110
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $111
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $110
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
