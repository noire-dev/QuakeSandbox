code
proc UI_saveMapEdMenu_BackEvent 0 0
file "../../../code/q3_ui/ui_saveconfiged.c"
line 63
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
;23:/*
;24:=============================================================================
;25:
;26:SAVE CONFIG MENU
;27:
;28:=============================================================================
;29:*/
;30:
;31:#include "ui_local.h"
;32:
;33:
;34:#define ART_BACK0			"menu/art/back_0"
;35:#define ART_BACK1			"menu/art/back_1"
;36:#define ART_SAVE0			"menu/art/save_0"
;37:#define ART_SAVE1			"menu/art/save_1"
;38:#define ART_BACKGROUND		"menu/art/cut_frame"
;39:
;40:#define ID_NAME			10
;41:#define ID_BACK			11
;42:#define ID_SAVE			12
;43:
;44:
;45:typedef struct {
;46:	menuframework_s	menu;
;47:
;48:	menutext_s		banner;
;49:	menubitmap_s	background;
;50:	menufield_s		savename;
;51:	menubitmap_s	back;
;52:	menubitmap_s	save;
;53:} saveMapEd_t;
;54:
;55:static saveMapEd_t		saveMapEd;
;56:
;57:
;58:/*
;59:===============
;60:UI_saveMapEdMenu_BackEvent
;61:===============
;62:*/
;63:static void UI_saveMapEdMenu_BackEvent( void *ptr, int event ) {
line 64
;64:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 65
;65:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 68
;66:	}
;67:
;68:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 69
;69:}
LABELV $81
endproc UI_saveMapEdMenu_BackEvent 0 0
proc UI_saveMapEdMenu_SaveEvent 68 12
line 77
;70:
;71:
;72:/*
;73:===============
;74:UI_saveMapEdMenu_SaveEvent
;75:===============
;76:*/
;77:static void UI_saveMapEdMenu_SaveEvent( void *ptr, int event ) {
line 80
;78:	char	configname[MAX_QPATH];
;79:
;80:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $85
line 81
;81:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 84
;82:	}
;83:
;84:	if( !saveMapEd.savename.field.buffer[0] ) {
ADDRGP4 saveMapEd+1296+88+12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $87
line 85
;85:		return;
ADDRGP4 $84
JUMPV
LABELV $87
line 87
;86:	}
;87:	COM_StripExtension(saveMapEd.savename.field.buffer, configname, sizeof(configname));
ADDRGP4 saveMapEd+1296+88+12
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 88
;88:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "savemap maps/%s.add\n", configname ) );
ADDRGP4 $95
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 89
;89:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 90
;90:}
LABELV $84
endproc UI_saveMapEdMenu_SaveEvent 68 12
proc UI_saveMapEdMenu_SavenameDraw 24 20
line 98
;91:
;92:
;93:/*
;94:===============
;95:UI_saveMapEdMenu_SavenameDraw
;96:===============
;97:*/
;98:static void UI_saveMapEdMenu_SavenameDraw( void *self ) {
line 103
;99:	menufield_s		*f;
;100:	int				style;
;101:	float			*color;
;102:
;103:	f = (menufield_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 105
;104:
;105:	if( f == Menu_ItemAtCursor( &saveMapEd.menu ) ) {
ADDRGP4 saveMapEd
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
NEU4 $97
line 106
;106:		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16400
ASGNI4
line 107
;107:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 108
;108:	}
ADDRGP4 $98
JUMPV
LABELV $97
line 109
;109:	else {
line 110
;110:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 111
;111:		color = colorRed;
ADDRLP4 8
ADDRGP4 colorRed
ASGNP4
line 112
;112:	}
LABELV $98
line 113
;113:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $99
line 114
;114:	UI_DrawString( 320, 192, "Enter filename:", UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $102
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 115
;115:	}
LABELV $99
line 116
;116:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $103
line 117
;117:	UI_DrawString( 320, 192, "Введите имя файла:", UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $106
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 118
;118:	}
LABELV $103
line 119
;119:	UI_FillRect( f->generic.x, f->generic.y, f->field.widthInChars*SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, colorBlack );
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
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 120
;120:	MField_Draw( &f->field, f->generic.x, f->generic.y, style, color );
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 MField_Draw
CALLV
pop
line 121
;121:}
LABELV $96
endproc UI_saveMapEdMenu_SavenameDraw 24 20
proc UI_saveMapEdMenu_Init 0 12
line 129
;122:
;123:
;124:/*
;125:=================
;126:UI_saveMapEdMenu_Init
;127:=================
;128:*/
;129:static void UI_saveMapEdMenu_Init( void ) {
line 130
;130:	memset( &saveMapEd, 0, sizeof(saveMapEd) );
ADDRGP4 saveMapEd
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1892
ARGI4
ADDRGP4 memset
CALLP4
pop
line 132
;131:
;132:	UI_saveMapEdMenu_Cache();
ADDRGP4 UI_saveMapEdMenu_Cache
CALLV
pop
line 133
;133:	saveMapEd.menu.wrapAround = qtrue;
ADDRGP4 saveMapEd+1044
CNSTI4 1
ASGNI4
line 134
;134:	saveMapEd.menu.native 	   = qfalse;
ADDRGP4 saveMapEd+1056
CNSTI4 0
ASGNI4
line 135
;135:	saveMapEd.menu.fullscreen = qfalse;
ADDRGP4 saveMapEd+1052
CNSTI4 0
ASGNI4
line 137
;136:
;137:	saveMapEd.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 saveMapEd+1076
CNSTI4 10
ASGNI4
line 138
;138:	saveMapEd.banner.generic.x			= 320;
ADDRGP4 saveMapEd+1076+28
CNSTI4 320
ASGNI4
line 139
;139:	saveMapEd.banner.generic.y			= 16;
ADDRGP4 saveMapEd+1076+32
CNSTI4 16
ASGNI4
line 140
;140:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $118
line 141
;141:	saveMapEd.banner.string			= "Save Map";
ADDRGP4 saveMapEd+1076+88
ADDRGP4 $123
ASGNP4
line 142
;142:	}
LABELV $118
line 143
;143:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $124
line 144
;144:	saveMapEd.banner.string			= "Сохранение Карты";
ADDRGP4 saveMapEd+1076+88
ADDRGP4 $129
ASGNP4
line 145
;145:	}
LABELV $124
line 146
;146:	saveMapEd.banner.color				= color_white;
ADDRGP4 saveMapEd+1076+100
ADDRGP4 color_white
ASGNP4
line 147
;147:	saveMapEd.banner.style				= UI_CENTER;
ADDRGP4 saveMapEd+1076+92
CNSTI4 1
ASGNI4
line 149
;148:
;149:	saveMapEd.background.generic.type		= MTYPE_BITMAP;
ADDRGP4 saveMapEd+1180
CNSTI4 6
ASGNI4
line 150
;150:	saveMapEd.background.generic.name		= ART_BACKGROUND;
ADDRGP4 saveMapEd+1180+4
ADDRGP4 $137
ASGNP4
line 151
;151:	saveMapEd.background.generic.flags		= QMF_INACTIVE;
ADDRGP4 saveMapEd+1180+72
CNSTU4 16384
ASGNU4
line 152
;152:	saveMapEd.background.generic.x			= -10000000;
ADDRGP4 saveMapEd+1180+28
CNSTI4 -10000000
ASGNI4
line 153
;153:	saveMapEd.background.generic.y			= -1000;
ADDRGP4 saveMapEd+1180+32
CNSTI4 -1000
ASGNI4
line 154
;154:	saveMapEd.background.width				= 46600000;
ADDRGP4 saveMapEd+1180+104
CNSTI4 46600000
ASGNI4
line 155
;155:	saveMapEd.background.height			= 33200000;
ADDRGP4 saveMapEd+1180+108
CNSTI4 33200000
ASGNI4
line 157
;156:
;157:	saveMapEd.savename.generic.type		= MTYPE_FIELD;
ADDRGP4 saveMapEd+1296
CNSTI4 4
ASGNI4
line 158
;158:	saveMapEd.savename.generic.flags		= QMF_NODEFAULTINIT|QMF_UPPERCASE;
ADDRGP4 saveMapEd+1296+72
CNSTU4 557056
ASGNU4
line 159
;159:	saveMapEd.savename.generic.ownerdraw	= UI_saveMapEdMenu_SavenameDraw;
ADDRGP4 saveMapEd+1296+84
ADDRGP4 UI_saveMapEdMenu_SavenameDraw
ASGNP4
line 160
;160:	saveMapEd.savename.field.widthInChars	= 20;
ADDRGP4 saveMapEd+1296+88+8
CNSTI4 20
ASGNI4
line 161
;161:	saveMapEd.savename.field.maxchars		= 20;
ADDRGP4 saveMapEd+1296+88+268
CNSTI4 20
ASGNI4
line 162
;162:	saveMapEd.savename.generic.x			= 240;
ADDRGP4 saveMapEd+1296+28
CNSTI4 240
ASGNI4
line 163
;163:	saveMapEd.savename.generic.y			= 155+72;
ADDRGP4 saveMapEd+1296+32
CNSTI4 227
ASGNI4
line 164
;164:	saveMapEd.savename.generic.left		= 240;
ADDRGP4 saveMapEd+1296+44
CNSTI4 240
ASGNI4
line 165
;165:	saveMapEd.savename.generic.top			= 155+72;
ADDRGP4 saveMapEd+1296+48
CNSTI4 227
ASGNI4
line 166
;166:	saveMapEd.savename.generic.right		= 233 + 20*SMALLCHAR_WIDTH;
ADDRGP4 saveMapEd+1296+52
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 233
ADDI4
ASGNI4
line 167
;167:	saveMapEd.savename.generic.bottom		= 155+72 + SMALLCHAR_HEIGHT+2;
ADDRGP4 saveMapEd+1296+56
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 227
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 169
;168:
;169:	saveMapEd.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 saveMapEd+1660
CNSTI4 6
ASGNI4
line 170
;170:	saveMapEd.back.generic.name		= ART_BACK0;
ADDRGP4 saveMapEd+1660+4
ADDRGP4 $176
ASGNP4
line 171
;171:	saveMapEd.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 saveMapEd+1660+72
CNSTU4 260
ASGNU4
line 172
;172:	saveMapEd.back.generic.id			= ID_BACK;
ADDRGP4 saveMapEd+1660+24
CNSTI4 11
ASGNI4
line 173
;173:	saveMapEd.back.generic.callback	= UI_saveMapEdMenu_BackEvent;
ADDRGP4 saveMapEd+1660+76
ADDRGP4 UI_saveMapEdMenu_BackEvent
ASGNP4
line 174
;174:	saveMapEd.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 saveMapEd+1660+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 175
;175:	saveMapEd.back.generic.y			= 480-64;
ADDRGP4 saveMapEd+1660+32
CNSTI4 416
ASGNI4
line 176
;176:	saveMapEd.back.width				= 128;
ADDRGP4 saveMapEd+1660+104
CNSTI4 128
ASGNI4
line 177
;177:	saveMapEd.back.height				= 64;
ADDRGP4 saveMapEd+1660+108
CNSTI4 64
ASGNI4
line 178
;178:	saveMapEd.back.focuspic			= ART_BACK1;
ADDRGP4 saveMapEd+1660+88
ADDRGP4 $194
ASGNP4
line 180
;179:
;180:	saveMapEd.save.generic.type		= MTYPE_BITMAP;
ADDRGP4 saveMapEd+1776
CNSTI4 6
ASGNI4
line 181
;181:	saveMapEd.save.generic.name		= ART_SAVE0;
ADDRGP4 saveMapEd+1776+4
ADDRGP4 $198
ASGNP4
line 182
;182:	saveMapEd.save.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 saveMapEd+1776+72
CNSTU4 272
ASGNU4
line 183
;183:	saveMapEd.save.generic.id			= ID_SAVE;
ADDRGP4 saveMapEd+1776+24
CNSTI4 12
ASGNI4
line 184
;184:	saveMapEd.save.generic.callback	= UI_saveMapEdMenu_SaveEvent;
ADDRGP4 saveMapEd+1776+76
ADDRGP4 UI_saveMapEdMenu_SaveEvent
ASGNP4
line 185
;185:	saveMapEd.save.generic.x			= 640 + uis.wideoffset;
ADDRGP4 saveMapEd+1776+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 186
;186:	saveMapEd.save.generic.y			= 480-64;
ADDRGP4 saveMapEd+1776+32
CNSTI4 416
ASGNI4
line 187
;187:	saveMapEd.save.width  				= 128;
ADDRGP4 saveMapEd+1776+104
CNSTI4 128
ASGNI4
line 188
;188:	saveMapEd.save.height  		    = 64;
ADDRGP4 saveMapEd+1776+108
CNSTI4 64
ASGNI4
line 189
;189:	saveMapEd.save.focuspic			= ART_SAVE1;
ADDRGP4 saveMapEd+1776+88
ADDRGP4 $216
ASGNP4
line 191
;190:
;191:	Menu_AddItem( &saveMapEd.menu, &saveMapEd.background );
ADDRGP4 saveMapEd
ARGP4
ADDRGP4 saveMapEd+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 192
;192:	Menu_AddItem( &saveMapEd.menu, &saveMapEd.banner );
ADDRGP4 saveMapEd
ARGP4
ADDRGP4 saveMapEd+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 193
;193:	Menu_AddItem( &saveMapEd.menu, &saveMapEd.savename );
ADDRGP4 saveMapEd
ARGP4
ADDRGP4 saveMapEd+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 194
;194:	Menu_AddItem( &saveMapEd.menu, &saveMapEd.back );
ADDRGP4 saveMapEd
ARGP4
ADDRGP4 saveMapEd+1660
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 195
;195:	Menu_AddItem( &saveMapEd.menu, &saveMapEd.save );
ADDRGP4 saveMapEd
ARGP4
ADDRGP4 saveMapEd+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 196
;196:}
LABELV $109
endproc UI_saveMapEdMenu_Init 0 12
export UI_saveMapEdMenu_Cache
proc UI_saveMapEdMenu_Cache 0 4
line 204
;197:
;198:
;199:/*
;200:=================
;201:UI_saveMapEdMenu_Cache
;202:=================
;203:*/
;204:void UI_saveMapEdMenu_Cache( void ) {
line 205
;205:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $176
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 206
;206:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $194
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 207
;207:	trap_R_RegisterShaderNoMip( ART_SAVE0 );
ADDRGP4 $198
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 208
;208:	trap_R_RegisterShaderNoMip( ART_SAVE1 );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 209
;209:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $137
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 210
;210:}
LABELV $222
endproc UI_saveMapEdMenu_Cache 0 4
export UI_saveMapEdMenu
proc UI_saveMapEdMenu 0 4
line 218
;211:
;212:
;213:/*
;214:===============
;215:UI_saveMapEdMenu
;216:===============
;217:*/
;218:void UI_saveMapEdMenu( void ) {
line 219
;219:	UI_saveMapEdMenu_Init();
ADDRGP4 UI_saveMapEdMenu_Init
CALLV
pop
line 220
;220:	UI_PushMenu( &saveMapEd.menu );
ADDRGP4 saveMapEd
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 221
;221:}
LABELV $223
endproc UI_saveMapEdMenu 0 4
bss
align 4
LABELV saveMapEd
skip 1892
import UI_MapCallVote
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
LABELV $216
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $198
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $194
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
LABELV $176
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
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $129
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
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
byte 1 32
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
LABELV $123
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $106
byte 1 208
byte 1 146
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $102
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 100
byte 1 100
byte 1 10
byte 1 0
