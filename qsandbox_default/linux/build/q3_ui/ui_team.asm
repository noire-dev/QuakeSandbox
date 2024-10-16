code
proc TeamMain_MenuEvent 8 8
file "../../../code/q3_ui/ui_team.c"
line 45
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3://
;4:// ui_team.c
;5://
;6:
;7:#include "ui_local.h"
;8:
;9:
;10:#define TEAMMAIN_FRAME	"menu/art/cut_frame"
;11:
;12:#define ID_JOINRED		100
;13:#define ID_JOINBLUE		101
;14:#define ID_JOINGAME		102
;15:#define ID_SPECTATE		103
;16:
;17:
;18:typedef struct
;19:{
;20:	menuframework_s	menu;
;21:	menubitmap_s	frame;
;22:	menutext_s		joinred;
;23:	menutext_s		joinblue;
;24:	menutext_s		joingame;
;25:	menutext_s		spectate;
;26:} teammain_t;
;27:
;28:static teammain_t	s_teammain;
;29:
;30:// bk001204 - unused
;31://static menuframework_s	s_teammain_menu;
;32://static menuaction_s		s_teammain_orders;
;33://static menuaction_s		s_teammain_voice;
;34://static menuaction_s		s_teammain_joinred;
;35://static menuaction_s		s_teammain_joinblue;
;36://static menuaction_s		s_teammain_joingame;
;37://static menuaction_s		s_teammain_spectate;
;38:
;39:
;40:/*
;41:===============
;42:TeamMain_MenuEvent
;43:===============
;44:*/
;45:static void TeamMain_MenuEvent( void* ptr, int event ) {
line 46
;46:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 47
;47:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 50
;48:	}
;49:
;50:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 103
GTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $95-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $95
address $87
address $89
address $91
address $93
code
LABELV $87
line 52
;51:	case ID_JOINRED:
;52:		trap_Cmd_ExecuteText( EXEC_APPEND, "cmd team red\n" );
CNSTI4 2
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 53
;53:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 54
;54:		break;
ADDRGP4 $85
JUMPV
LABELV $89
line 57
;55:
;56:	case ID_JOINBLUE:
;57:		trap_Cmd_ExecuteText( EXEC_APPEND, "cmd team blue\n" );
CNSTI4 2
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 58
;58:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 59
;59:		break;
ADDRGP4 $85
JUMPV
LABELV $91
line 62
;60:
;61:	case ID_JOINGAME:
;62:		trap_Cmd_ExecuteText( EXEC_APPEND, "cmd team free\n" );
CNSTI4 2
ARGI4
ADDRGP4 $92
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 63
;63:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 64
;64:		break;
ADDRGP4 $85
JUMPV
LABELV $93
line 67
;65:
;66:	case ID_SPECTATE:
;67:		trap_Cmd_ExecuteText( EXEC_APPEND, "cmd team spectator\n" );
CNSTI4 2
ARGI4
ADDRGP4 $94
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 68
;68:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 69
;69:		break;
LABELV $84
LABELV $85
line 71
;70:	}
;71:}
LABELV $81
endproc TeamMain_MenuEvent 8 8
export TeamMain_MenuInit
proc TeamMain_MenuInit 1056 12
line 79
;72:
;73:
;74:/*
;75:===============
;76:TeamMain_MenuInit
;77:===============
;78:*/
;79:void TeamMain_MenuInit( void ) {
line 84
;80:	int		y;
;81:	int		gametype;
;82:	char	info[MAX_INFO_STRING];
;83:
;84:	memset( &s_teammain, 0, sizeof(s_teammain) );
ADDRGP4 s_teammain
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1608
ARGI4
ADDRGP4 memset
CALLP4
pop
line 86
;85:
;86:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 88
;87:
;88:	s_teammain.menu.wrapAround = qtrue;
ADDRGP4 s_teammain+1044
CNSTI4 1
ASGNI4
line 89
;89:	s_teammain.menu.native 	= qfalse;
ADDRGP4 s_teammain+1056
CNSTI4 0
ASGNI4
line 90
;90:	s_teammain.menu.fullscreen = qfalse;
ADDRGP4 s_teammain+1052
CNSTI4 0
ASGNI4
line 92
;91:
;92:	s_teammain.frame.generic.type   = MTYPE_BITMAP;
ADDRGP4 s_teammain+1076
CNSTI4 6
ASGNI4
line 93
;93:	s_teammain.frame.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_teammain+1076+72
CNSTU4 16384
ASGNU4
line 94
;94:	s_teammain.frame.generic.name   = TEAMMAIN_FRAME;
ADDRGP4 s_teammain+1076+4
ADDRGP4 $106
ASGNP4
line 95
;95:	s_teammain.frame.generic.x		= 142;
ADDRGP4 s_teammain+1076+28
CNSTI4 142
ASGNI4
line 96
;96:	s_teammain.frame.generic.y		= 118;
ADDRGP4 s_teammain+1076+32
CNSTI4 118
ASGNI4
line 97
;97:	s_teammain.frame.width			= 359;
ADDRGP4 s_teammain+1076+104
CNSTI4 359
ASGNI4
line 98
;98:	s_teammain.frame.height			= 256;
ADDRGP4 s_teammain+1076+108
CNSTI4 256
ASGNI4
line 100
;99:
;100:	y = 194;
ADDRLP4 0
CNSTI4 194
ASGNI4
line 102
;101:
;102:	s_teammain.joinred.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_teammain+1192
CNSTI4 9
ASGNI4
line 103
;103:	s_teammain.joinred.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_teammain+1192+72
CNSTU4 264
ASGNU4
line 104
;104:	s_teammain.joinred.generic.id       = ID_JOINRED;
ADDRGP4 s_teammain+1192+24
CNSTI4 100
ASGNI4
line 105
;105:	s_teammain.joinred.generic.callback = TeamMain_MenuEvent;
ADDRGP4 s_teammain+1192+76
ADDRGP4 TeamMain_MenuEvent
ASGNP4
line 106
;106:	s_teammain.joinred.generic.x        = 320;
ADDRGP4 s_teammain+1192+28
CNSTI4 320
ASGNI4
line 107
;107:	s_teammain.joinred.generic.y        = y;
ADDRGP4 s_teammain+1192+32
ADDRLP4 0
INDIRI4
ASGNI4
line 108
;108:	s_teammain.joinred.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_teammain+1192+92
CNSTI4 17
ASGNI4
line 109
;109:	s_teammain.joinred.color            = colorRed;
ADDRGP4 s_teammain+1192+100
ADDRGP4 colorRed
ASGNP4
line 110
;110:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 112
;111:
;112:	s_teammain.joinblue.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_teammain+1296
CNSTI4 9
ASGNI4
line 113
;113:	s_teammain.joinblue.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_teammain+1296+72
CNSTU4 264
ASGNU4
line 114
;114:	s_teammain.joinblue.generic.id       = ID_JOINBLUE;
ADDRGP4 s_teammain+1296+24
CNSTI4 101
ASGNI4
line 115
;115:	s_teammain.joinblue.generic.callback = TeamMain_MenuEvent;
ADDRGP4 s_teammain+1296+76
ADDRGP4 TeamMain_MenuEvent
ASGNP4
line 116
;116:	s_teammain.joinblue.generic.x        = 320;
ADDRGP4 s_teammain+1296+28
CNSTI4 320
ASGNI4
line 117
;117:	s_teammain.joinblue.generic.y        = y;
ADDRGP4 s_teammain+1296+32
ADDRLP4 0
INDIRI4
ASGNI4
line 118
;118:	s_teammain.joinblue.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_teammain+1296+92
CNSTI4 17
ASGNI4
line 119
;119:	s_teammain.joinblue.color            = colorRed;
ADDRGP4 s_teammain+1296+100
ADDRGP4 colorRed
ASGNP4
line 120
;120:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 122
;121:
;122:	s_teammain.joingame.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_teammain+1400
CNSTI4 9
ASGNI4
line 123
;123:	s_teammain.joingame.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_teammain+1400+72
CNSTU4 264
ASGNU4
line 124
;124:	s_teammain.joingame.generic.id       = ID_JOINGAME;
ADDRGP4 s_teammain+1400+24
CNSTI4 102
ASGNI4
line 125
;125:	s_teammain.joingame.generic.callback = TeamMain_MenuEvent;
ADDRGP4 s_teammain+1400+76
ADDRGP4 TeamMain_MenuEvent
ASGNP4
line 126
;126:	s_teammain.joingame.generic.x        = 320;
ADDRGP4 s_teammain+1400+28
CNSTI4 320
ASGNI4
line 127
;127:	s_teammain.joingame.generic.y        = y;
ADDRGP4 s_teammain+1400+32
ADDRLP4 0
INDIRI4
ASGNI4
line 128
;128:	s_teammain.joingame.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_teammain+1400+92
CNSTI4 17
ASGNI4
line 129
;129:	s_teammain.joingame.color            = colorRed;
ADDRGP4 s_teammain+1400+100
ADDRGP4 colorRed
ASGNP4
line 130
;130:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 132
;131:
;132:	s_teammain.spectate.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_teammain+1504
CNSTI4 9
ASGNI4
line 133
;133:	s_teammain.spectate.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_teammain+1504+72
CNSTU4 264
ASGNU4
line 134
;134:	s_teammain.spectate.generic.id       = ID_SPECTATE;
ADDRGP4 s_teammain+1504+24
CNSTI4 103
ASGNI4
line 135
;135:	s_teammain.spectate.generic.callback = TeamMain_MenuEvent;
ADDRGP4 s_teammain+1504+76
ADDRGP4 TeamMain_MenuEvent
ASGNP4
line 136
;136:	s_teammain.spectate.generic.x        = 320;
ADDRGP4 s_teammain+1504+28
CNSTI4 320
ASGNI4
line 137
;137:	s_teammain.spectate.generic.y        = y;
ADDRGP4 s_teammain+1504+32
ADDRLP4 0
INDIRI4
ASGNI4
line 138
;138:	s_teammain.spectate.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_teammain+1504+92
CNSTI4 17
ASGNI4
line 139
;139:	s_teammain.spectate.color            = colorRed;
ADDRGP4 s_teammain+1504+100
ADDRGP4 colorRed
ASGNP4
line 140
;140:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 142
;141:	
;142:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $175
line 143
;143:	s_teammain.joinred.string           = "JOIN RED";
ADDRGP4 s_teammain+1192+88
ADDRGP4 $180
ASGNP4
line 144
;144:	s_teammain.joinblue.string           = "JOIN BLUE";
ADDRGP4 s_teammain+1296+88
ADDRGP4 $183
ASGNP4
line 145
;145:	s_teammain.joingame.string           = "JOIN GAME";
ADDRGP4 s_teammain+1400+88
ADDRGP4 $186
ASGNP4
line 146
;146:	s_teammain.spectate.string           = "SPECTATE";
ADDRGP4 s_teammain+1504+88
ADDRGP4 $189
ASGNP4
line 147
;147:	}
LABELV $175
line 148
;148:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $190
line 149
;149:	s_teammain.joinred.string           = "ПРИСОЕДИНИТЬСЯ К КРАСНЫМ";
ADDRGP4 s_teammain+1192+88
ADDRGP4 $195
ASGNP4
line 150
;150:	s_teammain.joinblue.string           = "ПРИСОЕДИНИТЬСЯ К СИНИМ";
ADDRGP4 s_teammain+1296+88
ADDRGP4 $198
ASGNP4
line 151
;151:	s_teammain.joingame.string           = "ПРИСОЕДИНИТЬСЯ К ИГРЕ";
ADDRGP4 s_teammain+1400+88
ADDRGP4 $201
ASGNP4
line 152
;152:	s_teammain.spectate.string           = "НАБЛЮДАТЬ";
ADDRGP4 s_teammain+1504+88
ADDRGP4 $204
ASGNP4
line 153
;153:	}
LABELV $190
line 155
;154:
;155:	trap_GetConfigString(CS_SERVERINFO, info, MAX_INFO_STRING);   
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 156
;156:	gametype = atoi( Info_ValueForKey( info,"g_gametype" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1036
INDIRI4
ASGNI4
line 159
;157:			      
;158:	// set initial states
;159:	switch( gametype ) {
ADDRLP4 1040
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
LTI4 $206
ADDRLP4 1040
INDIRI4
CNSTI4 5
GTI4 $206
ADDRLP4 1040
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $216
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $216
address $208
address $208
address $208
address $208
address $213
address $213
code
LABELV $208
line 164
;160:	case GT_SANDBOX:
;161:	case GT_FFA:
;162:	case GT_SINGLE:
;163:	case GT_TOURNAMENT:
;164:		s_teammain.joinred.generic.flags  |= QMF_GRAYED;
ADDRLP4 1044
ADDRGP4 s_teammain+1192+72
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 165
;165:		s_teammain.joinblue.generic.flags |= QMF_GRAYED;
ADDRLP4 1048
ADDRGP4 s_teammain+1296+72
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 166
;166:		break;
ADDRGP4 $207
JUMPV
LABELV $206
LABELV $213
line 171
;167:
;168:	default:
;169:	case GT_TEAM:
;170:	case GT_CTF:
;171:		s_teammain.joingame.generic.flags |= QMF_GRAYED;
ADDRLP4 1052
ADDRGP4 s_teammain+1400+72
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 172
;172:		break;
LABELV $207
line 175
;173:	}
;174:
;175:	Menu_AddItem( &s_teammain.menu, (void*) &s_teammain.frame );
ADDRGP4 s_teammain
ARGP4
ADDRGP4 s_teammain+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 176
;176:	Menu_AddItem( &s_teammain.menu, (void*) &s_teammain.joinred );
ADDRGP4 s_teammain
ARGP4
ADDRGP4 s_teammain+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 177
;177:	Menu_AddItem( &s_teammain.menu, (void*) &s_teammain.joinblue );
ADDRGP4 s_teammain
ARGP4
ADDRGP4 s_teammain+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 178
;178:	Menu_AddItem( &s_teammain.menu, (void*) &s_teammain.joingame );
ADDRGP4 s_teammain
ARGP4
ADDRGP4 s_teammain+1400
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 179
;179:	Menu_AddItem( &s_teammain.menu, (void*) &s_teammain.spectate );
ADDRGP4 s_teammain
ARGP4
ADDRGP4 s_teammain+1504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 180
;180:}
LABELV $97
endproc TeamMain_MenuInit 1056 12
export TeamMain_Cache
proc TeamMain_Cache 0 4
line 188
;181:
;182:
;183:/*
;184:===============
;185:TeamMain_Cache
;186:===============
;187:*/
;188:void TeamMain_Cache( void ) {
line 189
;189:	trap_R_RegisterShaderNoMip( TEAMMAIN_FRAME );
ADDRGP4 $106
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 190
;190:}
LABELV $222
endproc TeamMain_Cache 0 4
export UI_TeamMainMenu
proc UI_TeamMainMenu 0 4
line 198
;191:
;192:
;193:/*
;194:===============
;195:UI_TeamMainMenu
;196:===============
;197:*/
;198:void UI_TeamMainMenu( void ) {
line 199
;199:	TeamMain_MenuInit();
ADDRGP4 TeamMain_MenuInit
CALLV
pop
line 200
;200:	UI_PushMenu ( &s_teammain.menu );
ADDRGP4 s_teammain
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 201
;201:}
LABELV $223
endproc UI_TeamMainMenu 0 4
bss
align 4
LABELV s_teammain
skip 1608
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
LABELV $205
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $204
byte 1 208
byte 1 157
byte 1 208
byte 1 144
byte 1 208
byte 1 145
byte 1 208
byte 1 155
byte 1 208
byte 1 174
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 0
align 1
LABELV $201
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 152
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 208
byte 1 161
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 154
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 0
align 1
LABELV $198
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 152
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 208
byte 1 161
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 154
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 156
byte 1 0
align 1
LABELV $195
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 152
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 208
byte 1 161
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 154
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 161
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 208
byte 1 156
byte 1 0
align 1
LABELV $189
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $186
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $183
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $180
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 82
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $106
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
LABELV $94
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $90
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $88
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
