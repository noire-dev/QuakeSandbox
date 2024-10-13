export Reset_MenuEvent
code
proc Reset_MenuEvent 0 8
file "../../../code/q3_ui/ui_spreset.c"
line 34
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2:/*
;3:=======================================================================
;4:
;5:RESET MENU
;6:
;7:=======================================================================
;8:*/
;9:
;10:#include "ui_local.h"
;11:
;12:
;13:#define ART_FRAME					"menu/art/cut_frame"
;14:
;15:#define ID_NO		100
;16:#define ID_YES		101
;17:
;18:typedef struct
;19:{
;20:	menuframework_s menu;
;21:	menutext_s		no;
;22:	menutext_s		yes;
;23:	int				slashX;
;24:} resetMenu_t;
;25:
;26:static resetMenu_t	s_reset;
;27:
;28:
;29:/*
;30:=================
;31:Reset_MenuEvent
;32:=================
;33:*/
;34:void Reset_MenuEvent(void* ptr, int event) {
line 35
;35:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 36
;36:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 39
;37:	}
;38:
;39:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 41
;40:
;41:	if( ((menucommon_s*)ptr)->id == ID_NO ) {
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 100
NEI4 $84
line 42
;42:		return;
ADDRGP4 $81
JUMPV
LABELV $84
line 46
;43:	}
;44:
;45:	// reset the game, pop the level menu and restart it so it updates
;46:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 47
;47:	trap_Cvar_SetValue( "ui_spSelection", 0 );
ADDRGP4 $86
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 48
;48:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 49
;49:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 50
;50:}
LABELV $81
endproc Reset_MenuEvent 0 8
proc Reset_MenuKey 32 8
line 58
;51:
;52:
;53:/*
;54:=================
;55:Reset_MenuKey
;56:=================
;57:*/
;58:static sfxHandle_t Reset_MenuKey( int key ) {
line 59
;59:	switch ( key ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 110
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $91
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $96
LABELV $95
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 78
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $91
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $88
LABELV $97
ADDRFP4 0
INDIRI4
CNSTI4 89
EQI4 $93
ADDRGP4 $88
JUMPV
LABELV $96
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 134
EQI4 $90
ADDRLP4 20
CNSTI4 135
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $90
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $99
LABELV $98
ADDRFP4 0
INDIRI4
CNSTI4 121
EQI4 $93
ADDRGP4 $88
JUMPV
LABELV $99
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 163
EQI4 $90
ADDRLP4 24
INDIRI4
CNSTI4 165
EQI4 $90
ADDRGP4 $88
JUMPV
LABELV $90
line 64
;60:	case K_KP_LEFTARROW:
;61:	case K_LEFTARROW:
;62:	case K_KP_RIGHTARROW:
;63:	case K_RIGHTARROW:
;64:		key = K_TAB;
ADDRFP4 0
CNSTI4 9
ASGNI4
line 65
;65:		break;
ADDRGP4 $89
JUMPV
LABELV $91
line 69
;66:
;67:	case 'n':
;68:	case 'N':
;69:		Reset_MenuEvent( &s_reset.no, QM_ACTIVATED );
ADDRGP4 s_reset+1076
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Reset_MenuEvent
CALLV
pop
line 70
;70:		break;
ADDRGP4 $89
JUMPV
LABELV $93
line 74
;71:
;72:	case 'y':
;73:	case 'Y':
;74:		Reset_MenuEvent( &s_reset.yes, QM_ACTIVATED );
ADDRGP4 s_reset+1180
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Reset_MenuEvent
CALLV
pop
line 75
;75:		break;
LABELV $88
LABELV $89
line 78
;76:	}
;77:
;78:	return Menu_DefaultKey( &s_reset.menu, key );
ADDRGP4 s_reset
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $87
endproc Reset_MenuKey 32 8
proc Reset_MenuDraw 0 20
line 87
;79:}
;80:
;81:
;82:/*
;83:=================
;84:Reset_MenuDraw
;85:=================
;86:*/
;87:static void Reset_MenuDraw( void ) {
line 88
;88:	UI_DrawNamedPic( 142, 118, 359, 256, ART_FRAME );
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $101
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 89
;89:	UI_DrawProportionalString( 320, 194 + 10, "RESET GAME?", UI_CENTER|UI_INVERSE, color_red );
CNSTI4 320
ARGI4
CNSTI4 204
ARGI4
ADDRGP4 $102
ARGP4
CNSTI4 8193
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 90
;90:	UI_DrawProportionalString( s_reset.slashX, 265, "/", UI_LEFT|UI_INVERSE, color_red );
ADDRGP4 s_reset+1284
INDIRI4
ARGI4
CNSTI4 265
ARGI4
ADDRGP4 $104
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 91
;91:	Menu_Draw( &s_reset.menu );
ADDRGP4 s_reset
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 93
;92:
;93:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 0
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $106
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 94
;94:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 1
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $108
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 95
;95:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $110
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 96
;96:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 3
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $112
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 97
;97:}
LABELV $100
endproc Reset_MenuDraw 0 20
export Reset_Cache
proc Reset_Cache 0 4
line 105
;98:
;99:
;100:/*
;101:=================
;102:Reset_Cache
;103:=================
;104:*/
;105:void Reset_Cache( void ) {
line 106
;106:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $101
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 107
;107:}
LABELV $113
endproc Reset_Cache 0 4
export UI_ResetMenu
proc UI_ResetMenu 3120 12
line 115
;108:
;109:
;110:/*
;111:=================
;112:UI_ResetMenu
;113:=================
;114:*/
;115:void UI_ResetMenu(void) {
line 121
;116:	uiClientState_t	cstate;
;117:	int	n1, n2, n3;
;118:	int	l1, l2, l3;
;119:
;120:	// zero set all our globals
;121:	memset( &s_reset, 0, sizeof(s_reset) );
ADDRGP4 s_reset
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 123
;122:
;123:	Reset_Cache();
ADDRGP4 Reset_Cache
CALLV
pop
line 125
;124:
;125:	n1 = UI_ProportionalStringWidth( "YES/NO" );
ADDRGP4 $115
ARGP4
ADDRLP4 3108
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3092
ADDRLP4 3108
INDIRI4
ASGNI4
line 126
;126:	n2 = UI_ProportionalStringWidth( "YES" ) + PROP_GAP_WIDTH;
ADDRGP4 $116
ARGP4
ADDRLP4 3112
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3096
ADDRLP4 3112
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 127
;127:	n3 = UI_ProportionalStringWidth( "/" )  + PROP_GAP_WIDTH;
ADDRGP4 $104
ARGP4
ADDRLP4 3116
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3100
ADDRLP4 3116
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 128
;128:	l1 = 320 - ( n1 / 2 );
ADDRLP4 0
CNSTI4 320
ADDRLP4 3092
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 129
;129:	l2 = l1 + n2;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 3096
INDIRI4
ADDI4
ASGNI4
line 130
;130:	l3 = l2 + n3;
ADDRLP4 3104
ADDRLP4 4
INDIRI4
ADDRLP4 3100
INDIRI4
ADDI4
ASGNI4
line 131
;131:	s_reset.slashX = l2;
ADDRGP4 s_reset+1284
ADDRLP4 4
INDIRI4
ASGNI4
line 133
;132:
;133:	s_reset.menu.draw       = Reset_MenuDraw;
ADDRGP4 s_reset+1036
ADDRGP4 Reset_MenuDraw
ASGNP4
line 134
;134:	s_reset.menu.key        = Reset_MenuKey;
ADDRGP4 s_reset+1040
ADDRGP4 Reset_MenuKey
ASGNP4
line 135
;135:	s_reset.menu.wrapAround = qtrue;
ADDRGP4 s_reset+1044
CNSTI4 1
ASGNI4
line 136
;136:	s_reset.menu.native 	   = qfalse;
ADDRGP4 s_reset+1056
CNSTI4 0
ASGNI4
line 138
;137:
;138:	trap_GetClientState( &cstate );
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 140
;139:
;140:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $124
line 142
;141:		// float on top of running game
;142:		s_reset.menu.fullscreen = qfalse;
ADDRGP4 s_reset+1052
CNSTI4 0
ASGNI4
line 143
;143:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 144
;144:	else {
line 146
;145:		// game not running
;146:		s_reset.menu.fullscreen = qtrue;
ADDRGP4 s_reset+1052
CNSTI4 1
ASGNI4
line 147
;147:	}
LABELV $125
line 149
;148:
;149:	s_reset.yes.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_reset+1180
CNSTI4 9
ASGNI4
line 150
;150:	s_reset.yes.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_reset+1180+72
CNSTU4 260
ASGNU4
line 151
;151:	s_reset.yes.generic.callback	= Reset_MenuEvent;
ADDRGP4 s_reset+1180+76
ADDRGP4 Reset_MenuEvent
ASGNP4
line 152
;152:	s_reset.yes.generic.id			= ID_YES;
ADDRGP4 s_reset+1180+24
CNSTI4 101
ASGNI4
line 153
;153:	s_reset.yes.generic.x			= l1;
ADDRGP4 s_reset+1180+28
ADDRLP4 0
INDIRI4
ASGNI4
line 154
;154:	s_reset.yes.generic.y			= 264;
ADDRGP4 s_reset+1180+32
CNSTI4 264
ASGNI4
line 155
;155:	s_reset.yes.string				= "YES";
ADDRGP4 s_reset+1180+88
ADDRGP4 $116
ASGNP4
line 156
;156:	s_reset.yes.color				= color_red;
ADDRGP4 s_reset+1180+100
ADDRGP4 color_red
ASGNP4
line 157
;157:	s_reset.yes.style				= UI_LEFT;
ADDRGP4 s_reset+1180+92
CNSTI4 0
ASGNI4
line 159
;158:
;159:	s_reset.no.generic.type			= MTYPE_PTEXT;      
ADDRGP4 s_reset+1076
CNSTI4 9
ASGNI4
line 160
;160:	s_reset.no.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_reset+1076+72
CNSTU4 260
ASGNU4
line 161
;161:	s_reset.no.generic.callback		= Reset_MenuEvent;
ADDRGP4 s_reset+1076+76
ADDRGP4 Reset_MenuEvent
ASGNP4
line 162
;162:	s_reset.no.generic.id			= ID_NO;
ADDRGP4 s_reset+1076+24
CNSTI4 100
ASGNI4
line 163
;163:	s_reset.no.generic.x		    = l3;
ADDRGP4 s_reset+1076+28
ADDRLP4 3104
INDIRI4
ASGNI4
line 164
;164:	s_reset.no.generic.y		    = 264;
ADDRGP4 s_reset+1076+32
CNSTI4 264
ASGNI4
line 165
;165:	s_reset.no.string				= "NO";
ADDRGP4 s_reset+1076+88
ADDRGP4 $158
ASGNP4
line 166
;166:	s_reset.no.color			    = color_red;
ADDRGP4 s_reset+1076+100
ADDRGP4 color_red
ASGNP4
line 167
;167:	s_reset.no.style			    = UI_LEFT;
ADDRGP4 s_reset+1076+92
CNSTI4 0
ASGNI4
line 169
;168:
;169:	Menu_AddItem( &s_reset.menu,	&s_reset.yes );             
ADDRGP4 s_reset
ARGP4
ADDRGP4 s_reset+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 170
;170:	Menu_AddItem( &s_reset.menu,	&s_reset.no );
ADDRGP4 s_reset
ARGP4
ADDRGP4 s_reset+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 172
;171:
;172:	UI_PushMenu( &s_reset.menu );
ADDRGP4 s_reset
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 174
;173:
;174:	Menu_SetCursorToItem( &s_reset.menu, &s_reset.no );
ADDRGP4 s_reset
ARGP4
ADDRGP4 s_reset+1076
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 175
;175:}
LABELV $114
endproc UI_ResetMenu 3120 12
bss
align 4
LABELV s_reset
skip 1288
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
LABELV $158
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $116
byte 1 89
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $115
byte 1 89
byte 1 69
byte 1 83
byte 1 47
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $112
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $110
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $108
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $106
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 47
byte 1 0
align 1
LABELV $102
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
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
LABELV $86
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
