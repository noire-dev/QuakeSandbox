export UI_SPArena_Start
code
proc UI_SPArena_Start 44 8
file "../../../code/q3_ui/ui_sparena.c"
line 9
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:
;5:
;6:
;7:#include "ui_local.h"
;8:
;9:void UI_SPArena_Start( const char *arenaInfo ) {
line 18
;10:	char	*map;
;11:	int		level;
;12:	int		n;
;13:	char	*txt;
;14:#if 0
;15:	int 	timelimit, fraglimit;
;16:#endif	
;17:
;18:	n = (int)trap_Cvar_VariableValue( "sv_maxclients" );
ADDRGP4 $81
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 19
;19:	if ( n < 8 ) {
ADDRLP4 12
INDIRI4
CNSTI4 8
GEI4 $82
line 20
;20:		trap_Cvar_SetValue( "sv_maxclients", 8 );
ADDRGP4 $81
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 21
;21:	}
LABELV $82
line 23
;22:
;23:	level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $84
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 24
;24:	txt = Info_ValueForKey( arenaInfo, "special" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 25
;25:	if( txt[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $86
line 26
;26:		if( Q_stricmp( txt, "training" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $88
line 27
;27:			level = -4;
ADDRLP4 4
CNSTI4 -4
ASGNI4
line 28
;28:		}
ADDRGP4 $89
JUMPV
LABELV $88
line 29
;29:		else if( Q_stricmp( txt, "final" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $93
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $91
line 30
;30:			level = UI_GetNumSPTiers() * ARENAS_PER_TIER;
ADDRLP4 40
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 31
;31:		}
LABELV $91
LABELV $89
line 32
;32:	}
LABELV $86
line 33
;33:	trap_Cvar_SetValue( "ui_spSelection", level );
ADDRGP4 $94
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 46
;34:
;35:#if 0
;36:	// fraglimit/timelimit bug fix
;37:	txt = Info_ValueForKey( arenaInfo, "timelimit" );
;38:	timelimit = atoi(txt);
;39:
;40:	txt = Info_ValueForKey( arenaInfo, "fraglimit" );
;41:	fraglimit = atoi(txt);
;42:
;43:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "timelimit %i\nfraglimit %i\nwriteconfig q3config\n", timelimit, fraglimit ) );
;44:#endif
;45:
;46:	map = Info_ValueForKey( arenaInfo, "map" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 47
;47:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "spmap %s\n", map ) );
ADDRGP4 $96
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 48
;48:}
LABELV $80
endproc UI_SPArena_Start 44 8
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
LABELV $96
byte 1 115
byte 1 112
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $95
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $94
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
align 1
LABELV $93
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $90
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $85
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $84
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $81
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
