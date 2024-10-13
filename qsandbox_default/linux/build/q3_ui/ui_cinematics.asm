data
align 4
LABELV cinematics
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
code
proc UI_CinematicsMenu_BackEvent 0 0
file "../../../code/q3_ui/ui_cinematics.c"
line 56
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:
;6:#define ART_BACK0		"menu/art/back_0"
;7:#define ART_BACK1		"menu/art/back_1"	
;8:
;9:#define VERTICAL_SPACING	30
;10:
;11:#define ID_BACK			10
;12:#define ID_CIN_IDLOGO	11
;13:#define ID_CIN_INTRO	12
;14:#define ID_CIN_TIER1	13
;15:#define ID_CIN_TIER2	14
;16:#define ID_CIN_TIER3	15
;17:#define ID_CIN_TIER4	16
;18:#define ID_CIN_TIER5	17
;19:#define ID_CIN_TIER6	18
;20:
;21:
;22:typedef struct {
;23:	menuframework_s	menu;
;24:	menutext_s		banner;
;25:	menubitmap_s	framel;
;26:	menubitmap_s	framer;
;27:	menutext_s		cin_idlogo;
;28:	menutext_s		cin_intro;
;29:	menutext_s		cin_tier1;
;30:	menutext_s		cin_tier2;
;31:	menutext_s		cin_tier3;
;32:	menutext_s		cin_tier4;
;33:	menutext_s		cin_tier5;
;34:	menutext_s		cin_tier6;
;35:	menubitmap_s	back;
;36:} cinematicsMenuInfo_t;
;37:
;38:static cinematicsMenuInfo_t	cinematicsMenuInfo;
;39:
;40:static char *cinematics[] = {
;41:	"1",
;42:	"2",
;43:	"3",
;44:	"4",
;45:	"5",
;46:	"6",
;47:	"7",
;48:	"8"
;49:};
;50:
;51:/*
;52:===============
;53:UI_CinematicsMenu_BackEvent
;54:===============
;55:*/
;56:static void UI_CinematicsMenu_BackEvent( void *ptr, int event ) {
line 57
;57:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $90
line 58
;58:		return;
ADDRGP4 $89
JUMPV
LABELV $90
line 60
;59:	}
;60:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 61
;61:}
LABELV $89
endproc UI_CinematicsMenu_BackEvent 0 0
proc UI_CinematicsMenu_Event 8 8
line 69
;62:
;63:
;64:/*
;65:===============
;66:UI_CinematicsMenu_Event
;67:===============
;68:*/
;69:static void UI_CinematicsMenu_Event( void *ptr, int event ) {
line 72
;70:	int		n;
;71:
;72:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $93
line 73
;73:		return;
ADDRGP4 $92
JUMPV
LABELV $93
line 75
;74:
;75:	n = ((menucommon_s*)ptr)->id - ID_CIN_IDLOGO;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 76
;76:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "savegame %s\n", cinematics[n] ) );
ADDRGP4 $95
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 78
;77:	
;78:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 79
;79:}
LABELV $92
endproc UI_CinematicsMenu_Event 8 8
proc UI_CinematicsMenu_Event2 60 8
line 86
;80:
;81:/*
;82:===============
;83:UI_CinematicsMenu_Event2
;84:===============
;85:*/
;86:static void UI_CinematicsMenu_Event2( void *ptr, int event ) {
line 89
;87:	int		n;
;88:
;89:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $97
line 90
;90:		return;
ADDRGP4 $96
JUMPV
LABELV $97
line 92
;91:
;92:	n = ((menucommon_s*)ptr)->id - ID_CIN_IDLOGO;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 95
;93:	//trap_Cmd_ExecuteText( EXEC_APPEND, va( "savegame %s\n", cinematics[n] ) );
;94:	
;95:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "exec save0%i.cfg\n", atoi(cinematics[n]) ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $99
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 96
;96:	if(atoi(cinematics[n]) == 1){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $100
line 97
;97:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 98
;98:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save1_session0" ) );
ADDRGP4 $105
ARGP4
ADDRLP4 16
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 99
;99:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save1_session0_lvl" ) );
ADDRGP4 $107
ARGP4
ADDRLP4 20
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 100
;100:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save1_epsession" ) );
ADDRGP4 $109
ARGP4
ADDRLP4 24
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 101
;101:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save1_curmap" ) );
ADDRGP4 $111
ARGP4
ADDRLP4 28
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 102
;102:	}
LABELV $100
line 103
;103:	if(atoi(cinematics[n]) == 2){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $112
line 104
;104:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 105
;105:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save2_session0" ) );
ADDRGP4 $114
ARGP4
ADDRLP4 20
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 106
;106:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save2_session0_lvl" ) );
ADDRGP4 $115
ARGP4
ADDRLP4 24
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 107
;107:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save2_epsession" ) );
ADDRGP4 $116
ARGP4
ADDRLP4 28
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 108
;108:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save2_curmap" ) );
ADDRGP4 $117
ARGP4
ADDRLP4 32
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 109
;109:	}
LABELV $112
line 110
;110:	if(atoi(cinematics[n]) == 3){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $118
line 111
;111:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 112
;112:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save3_session0" ) );
ADDRGP4 $120
ARGP4
ADDRLP4 24
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 113
;113:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save3_session0_lvl" ) );
ADDRGP4 $121
ARGP4
ADDRLP4 28
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 114
;114:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save3_epsession" ) );
ADDRGP4 $122
ARGP4
ADDRLP4 32
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 115
;115:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save3_curmap" ) );
ADDRGP4 $123
ARGP4
ADDRLP4 36
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 116
;116:	}
LABELV $118
line 117
;117:	if(atoi(cinematics[n]) == 4){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 4
NEI4 $124
line 118
;118:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 119
;119:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save4_session0" ) );
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 120
;120:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save4_session0_lvl" ) );
ADDRGP4 $127
ARGP4
ADDRLP4 32
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 121
;121:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save4_epsession" ) );
ADDRGP4 $128
ARGP4
ADDRLP4 36
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 122
;122:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save4_curmap" ) );
ADDRGP4 $129
ARGP4
ADDRLP4 40
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 123
;123:	}
LABELV $124
line 124
;124:	if(atoi(cinematics[n]) == 5){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $130
line 125
;125:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 126
;126:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save5_session0" ) );
ADDRGP4 $132
ARGP4
ADDRLP4 32
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 127
;127:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save5_session0_lvl" ) );
ADDRGP4 $133
ARGP4
ADDRLP4 36
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 128
;128:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save5_epsession" ) );
ADDRGP4 $134
ARGP4
ADDRLP4 40
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 129
;129:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save5_curmap" ) );
ADDRGP4 $135
ARGP4
ADDRLP4 44
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 130
;130:	}
LABELV $130
line 131
;131:	if(atoi(cinematics[n]) == 6){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 6
NEI4 $136
line 132
;132:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 133
;133:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save6_session0" ) );
ADDRGP4 $138
ARGP4
ADDRLP4 36
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 134
;134:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save6_session0_lvl" ) );
ADDRGP4 $139
ARGP4
ADDRLP4 40
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 135
;135:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save6_epsession" ) );
ADDRGP4 $140
ARGP4
ADDRLP4 44
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 136
;136:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save6_curmap" ) );
ADDRGP4 $141
ARGP4
ADDRLP4 48
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 137
;137:	}
LABELV $136
line 138
;138:	if(atoi(cinematics[n]) == 7){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 7
NEI4 $142
line 139
;139:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 140
;140:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save7_session0" ) );
ADDRGP4 $144
ARGP4
ADDRLP4 40
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 141
;141:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save7_session0_lvl" ) );
ADDRGP4 $145
ARGP4
ADDRLP4 44
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 142
;142:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save7_epsession" ) );
ADDRGP4 $146
ARGP4
ADDRLP4 48
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 143
;143:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save7_curmap" ) );
ADDRGP4 $147
ARGP4
ADDRLP4 52
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 144
;144:	}
LABELV $142
line 145
;145:	if(atoi(cinematics[n]) == 8){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 8
NEI4 $148
line 146
;146:	trap_Cvar_Set( "session", 	"0" );
ADDRGP4 $102
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 147
;147:	trap_Cvar_Set( "session0", 	UI_ArenaScriptAutoChar( "save8_session0" ) );
ADDRGP4 $150
ARGP4
ADDRLP4 44
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $104
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 148
;148:	trap_Cvar_Set( "session0_lvl", UI_ArenaScriptAutoChar( "save8_session0_lvl" ) );
ADDRGP4 $151
ARGP4
ADDRLP4 48
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $106
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 149
;149:	trap_Cvar_Set( "epsession", 	UI_ArenaScriptAutoChar( "save8_epsession" ) );
ADDRGP4 $152
ARGP4
ADDRLP4 52
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $108
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 150
;150:	trap_Cvar_Set( "save_curmap", 	UI_ArenaScriptAutoChar( "save8_curmap" ) );
ADDRGP4 $153
ARGP4
ADDRLP4 56
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $110
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 151
;151:	}
LABELV $148
line 152
;152:	UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 153
;153:	StartServer_LoadServer(NULL);
CNSTP4 0
ARGP4
ADDRGP4 StartServer_LoadServer
CALLI4
pop
line 154
;154:}
LABELV $96
endproc UI_CinematicsMenu_Event2 60 8
proc UI_CinematicsMenu_Init 4 12
line 162
;155:
;156:
;157:/*
;158:===============
;159:UI_CinematicsMenu_Init
;160:===============
;161:*/
;162:static void UI_CinematicsMenu_Init( int load ) {
line 165
;163:	int		y;
;164:
;165:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 167
;166:
;167:	memset( &cinematicsMenuInfo, 0, sizeof(cinematicsMenuInfo) );
ADDRGP4 cinematicsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2360
ARGI4
ADDRGP4 memset
CALLP4
pop
line 168
;168:	cinematicsMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 cinematicsMenuInfo+1052
CNSTI4 1
ASGNI4
line 170
;169:
;170:	cinematicsMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 cinematicsMenuInfo+1076
CNSTI4 10
ASGNI4
line 171
;171:	cinematicsMenuInfo.banner.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 172
;172:	cinematicsMenuInfo.banner.generic.y			= 16;
ADDRGP4 cinematicsMenuInfo+1076+32
CNSTI4 16
ASGNI4
line 173
;173:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $161
line 174
;174:	if(!load){
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $164
line 175
;175:	cinematicsMenuInfo.banner.string			= "SAVE GAME";
ADDRGP4 cinematicsMenuInfo+1076+88
ADDRGP4 $168
ASGNP4
line 176
;176:	} else {
ADDRGP4 $165
JUMPV
LABELV $164
line 177
;177:	cinematicsMenuInfo.banner.string			= "LOAD GAME";
ADDRGP4 cinematicsMenuInfo+1076+88
ADDRGP4 $171
ASGNP4
line 178
;178:	}
LABELV $165
line 179
;179:	}
LABELV $161
line 180
;180:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $172
line 181
;181:	if(!load){
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $175
line 182
;182:	cinematicsMenuInfo.banner.string			= "СОХРАНИТЬ ИГРУ";
ADDRGP4 cinematicsMenuInfo+1076+88
ADDRGP4 $179
ASGNP4
line 183
;183:	} else {
ADDRGP4 $176
JUMPV
LABELV $175
line 184
;184:	cinematicsMenuInfo.banner.string			= "ЗАГРУЗИТЬ ИГРУ";
ADDRGP4 cinematicsMenuInfo+1076+88
ADDRGP4 $182
ASGNP4
line 185
;185:	}
LABELV $176
line 186
;186:	}
LABELV $172
line 187
;187:	cinematicsMenuInfo.banner.color				= color_white;
ADDRGP4 cinematicsMenuInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 188
;188:	cinematicsMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1076+92
CNSTI4 1
ASGNI4
line 190
;189:
;190:	y = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 191
;191:	cinematicsMenuInfo.cin_idlogo.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+1412
CNSTI4 9
ASGNI4
line 192
;192:	cinematicsMenuInfo.cin_idlogo.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+1412+72
CNSTU4 264
ASGNU4
line 193
;193:	cinematicsMenuInfo.cin_idlogo.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1412+28
CNSTI4 320
ASGNI4
line 194
;194:	cinematicsMenuInfo.cin_idlogo.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+1412+32
ADDRLP4 0
INDIRI4
ASGNI4
line 195
;195:	cinematicsMenuInfo.cin_idlogo.generic.id		= ID_CIN_IDLOGO;
ADDRGP4 cinematicsMenuInfo+1412+24
CNSTI4 11
ASGNI4
line 196
;196:	cinematicsMenuInfo.cin_idlogo.string			= "SLOT 1";
ADDRGP4 cinematicsMenuInfo+1412+88
ADDRGP4 $198
ASGNP4
line 197
;197:	cinematicsMenuInfo.cin_idlogo.color				= color_red;
ADDRGP4 cinematicsMenuInfo+1412+100
ADDRGP4 color_red
ASGNP4
line 198
;198:	cinematicsMenuInfo.cin_idlogo.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1412+92
CNSTI4 1
ASGNI4
line 200
;199:
;200:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 201
;201:	cinematicsMenuInfo.cin_intro.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+1516
CNSTI4 9
ASGNI4
line 202
;202:	cinematicsMenuInfo.cin_intro.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+1516+72
CNSTU4 264
ASGNU4
line 203
;203:	cinematicsMenuInfo.cin_intro.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1516+28
CNSTI4 320
ASGNI4
line 204
;204:	cinematicsMenuInfo.cin_intro.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+1516+32
ADDRLP4 0
INDIRI4
ASGNI4
line 205
;205:	cinematicsMenuInfo.cin_intro.generic.id			= ID_CIN_INTRO;
ADDRGP4 cinematicsMenuInfo+1516+24
CNSTI4 12
ASGNI4
line 206
;206:	cinematicsMenuInfo.cin_intro.string				= "SLOT 2";
ADDRGP4 cinematicsMenuInfo+1516+88
ADDRGP4 $214
ASGNP4
line 207
;207:	cinematicsMenuInfo.cin_intro.color				= color_red;
ADDRGP4 cinematicsMenuInfo+1516+100
ADDRGP4 color_red
ASGNP4
line 208
;208:	cinematicsMenuInfo.cin_intro.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1516+92
CNSTI4 1
ASGNI4
line 210
;209:
;210:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 211
;211:	cinematicsMenuInfo.cin_tier1.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+1620
CNSTI4 9
ASGNI4
line 212
;212:	cinematicsMenuInfo.cin_tier1.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+1620+72
CNSTU4 264
ASGNU4
line 213
;213:	cinematicsMenuInfo.cin_tier1.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1620+28
CNSTI4 320
ASGNI4
line 214
;214:	cinematicsMenuInfo.cin_tier1.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+1620+32
ADDRLP4 0
INDIRI4
ASGNI4
line 215
;215:	cinematicsMenuInfo.cin_tier1.generic.id			= ID_CIN_TIER1; 
ADDRGP4 cinematicsMenuInfo+1620+24
CNSTI4 13
ASGNI4
line 216
;216:	cinematicsMenuInfo.cin_tier1.string				= "SLOT 3";
ADDRGP4 cinematicsMenuInfo+1620+88
ADDRGP4 $230
ASGNP4
line 217
;217:	cinematicsMenuInfo.cin_tier1.color				= color_red;
ADDRGP4 cinematicsMenuInfo+1620+100
ADDRGP4 color_red
ASGNP4
line 218
;218:	cinematicsMenuInfo.cin_tier1.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1620+92
CNSTI4 1
ASGNI4
line 220
;219:
;220:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 221
;221:	cinematicsMenuInfo.cin_tier2.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+1724
CNSTI4 9
ASGNI4
line 222
;222:	cinematicsMenuInfo.cin_tier2.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+1724+72
CNSTU4 264
ASGNU4
line 223
;223:	cinematicsMenuInfo.cin_tier2.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1724+28
CNSTI4 320
ASGNI4
line 224
;224:	cinematicsMenuInfo.cin_tier2.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+1724+32
ADDRLP4 0
INDIRI4
ASGNI4
line 225
;225:	cinematicsMenuInfo.cin_tier2.generic.id			= ID_CIN_TIER2;
ADDRGP4 cinematicsMenuInfo+1724+24
CNSTI4 14
ASGNI4
line 226
;226:	cinematicsMenuInfo.cin_tier2.string				= "SLOT 4";
ADDRGP4 cinematicsMenuInfo+1724+88
ADDRGP4 $246
ASGNP4
line 227
;227:	cinematicsMenuInfo.cin_tier2.color				= color_red;
ADDRGP4 cinematicsMenuInfo+1724+100
ADDRGP4 color_red
ASGNP4
line 228
;228:	cinematicsMenuInfo.cin_tier2.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1724+92
CNSTI4 1
ASGNI4
line 230
;229:
;230:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 231
;231:	cinematicsMenuInfo.cin_tier3.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+1828
CNSTI4 9
ASGNI4
line 232
;232:	cinematicsMenuInfo.cin_tier3.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+1828+72
CNSTU4 264
ASGNU4
line 233
;233:	cinematicsMenuInfo.cin_tier3.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1828+28
CNSTI4 320
ASGNI4
line 234
;234:	cinematicsMenuInfo.cin_tier3.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+1828+32
ADDRLP4 0
INDIRI4
ASGNI4
line 235
;235:	cinematicsMenuInfo.cin_tier3.generic.id			= ID_CIN_TIER3;
ADDRGP4 cinematicsMenuInfo+1828+24
CNSTI4 15
ASGNI4
line 236
;236:	cinematicsMenuInfo.cin_tier3.string				= "SLOT 5";
ADDRGP4 cinematicsMenuInfo+1828+88
ADDRGP4 $262
ASGNP4
line 237
;237:	cinematicsMenuInfo.cin_tier3.color				= color_red;
ADDRGP4 cinematicsMenuInfo+1828+100
ADDRGP4 color_red
ASGNP4
line 238
;238:	cinematicsMenuInfo.cin_tier3.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1828+92
CNSTI4 1
ASGNI4
line 240
;239:
;240:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 241
;241:	cinematicsMenuInfo.cin_tier4.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+1932
CNSTI4 9
ASGNI4
line 242
;242:	cinematicsMenuInfo.cin_tier4.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+1932+72
CNSTU4 264
ASGNU4
line 243
;243:	cinematicsMenuInfo.cin_tier4.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+1932+28
CNSTI4 320
ASGNI4
line 244
;244:	cinematicsMenuInfo.cin_tier4.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+1932+32
ADDRLP4 0
INDIRI4
ASGNI4
line 245
;245:	cinematicsMenuInfo.cin_tier4.generic.id			= ID_CIN_TIER4;
ADDRGP4 cinematicsMenuInfo+1932+24
CNSTI4 16
ASGNI4
line 246
;246:	cinematicsMenuInfo.cin_tier4.string				= "SLOT 6";
ADDRGP4 cinematicsMenuInfo+1932+88
ADDRGP4 $278
ASGNP4
line 247
;247:	cinematicsMenuInfo.cin_tier4.color				= color_red;
ADDRGP4 cinematicsMenuInfo+1932+100
ADDRGP4 color_red
ASGNP4
line 248
;248:	cinematicsMenuInfo.cin_tier4.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+1932+92
CNSTI4 1
ASGNI4
line 250
;249:
;250:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 251
;251:	cinematicsMenuInfo.cin_tier5.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+2036
CNSTI4 9
ASGNI4
line 252
;252:	cinematicsMenuInfo.cin_tier5.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+2036+72
CNSTU4 264
ASGNU4
line 253
;253:	cinematicsMenuInfo.cin_tier5.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+2036+28
CNSTI4 320
ASGNI4
line 254
;254:	cinematicsMenuInfo.cin_tier5.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+2036+32
ADDRLP4 0
INDIRI4
ASGNI4
line 255
;255:	cinematicsMenuInfo.cin_tier5.generic.id			= ID_CIN_TIER5;
ADDRGP4 cinematicsMenuInfo+2036+24
CNSTI4 17
ASGNI4
line 256
;256:	cinematicsMenuInfo.cin_tier5.string				= "SLOT 7";
ADDRGP4 cinematicsMenuInfo+2036+88
ADDRGP4 $294
ASGNP4
line 257
;257:	cinematicsMenuInfo.cin_tier5.color				= color_red;
ADDRGP4 cinematicsMenuInfo+2036+100
ADDRGP4 color_red
ASGNP4
line 258
;258:	cinematicsMenuInfo.cin_tier5.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+2036+92
CNSTI4 1
ASGNI4
line 260
;259:
;260:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 261
;261:	cinematicsMenuInfo.cin_tier6.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+2140
CNSTI4 9
ASGNI4
line 262
;262:	cinematicsMenuInfo.cin_tier6.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+2140+72
CNSTU4 264
ASGNU4
line 263
;263:	cinematicsMenuInfo.cin_tier6.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+2140+28
CNSTI4 320
ASGNI4
line 264
;264:	cinematicsMenuInfo.cin_tier6.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+2140+32
ADDRLP4 0
INDIRI4
ASGNI4
line 265
;265:	cinematicsMenuInfo.cin_tier6.generic.id			= ID_CIN_TIER6;	
ADDRGP4 cinematicsMenuInfo+2140+24
CNSTI4 18
ASGNI4
line 266
;266:	cinematicsMenuInfo.cin_tier6.string				= "SLOT 8";
ADDRGP4 cinematicsMenuInfo+2140+88
ADDRGP4 $310
ASGNP4
line 267
;267:	cinematicsMenuInfo.cin_tier6.color				= color_red;
ADDRGP4 cinematicsMenuInfo+2140+100
ADDRGP4 color_red
ASGNP4
line 268
;268:	cinematicsMenuInfo.cin_tier6.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+2140+92
CNSTI4 1
ASGNI4
line 271
;269:	
;270:	
;271:	if(!load){
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $315
line 272
;272:	cinematicsMenuInfo.cin_tier6.generic.callback	= UI_CinematicsMenu_Event;
ADDRGP4 cinematicsMenuInfo+2140+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 273
;273:	cinematicsMenuInfo.cin_tier5.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+2036+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 274
;274:	cinematicsMenuInfo.cin_tier4.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+1932+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 275
;275:	cinematicsMenuInfo.cin_tier3.generic.callback	= UI_CinematicsMenu_Event;
ADDRGP4 cinematicsMenuInfo+1828+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 276
;276:	cinematicsMenuInfo.cin_tier2.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+1724+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 277
;277:	cinematicsMenuInfo.cin_tier1.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+1620+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 278
;278:	cinematicsMenuInfo.cin_intro.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+1516+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 279
;279:	cinematicsMenuInfo.cin_idlogo.generic.callback	= UI_CinematicsMenu_Event;	
ADDRGP4 cinematicsMenuInfo+1412+76
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 280
;280:	} else {
ADDRGP4 $316
JUMPV
LABELV $315
line 281
;281:	cinematicsMenuInfo.cin_tier6.generic.callback	= UI_CinematicsMenu_Event2;
ADDRGP4 cinematicsMenuInfo+2140+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 282
;282:	cinematicsMenuInfo.cin_tier5.generic.callback	= UI_CinematicsMenu_Event2; 
ADDRGP4 cinematicsMenuInfo+2036+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 283
;283:	cinematicsMenuInfo.cin_tier4.generic.callback	= UI_CinematicsMenu_Event2; 
ADDRGP4 cinematicsMenuInfo+1932+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 284
;284:	cinematicsMenuInfo.cin_tier3.generic.callback	= UI_CinematicsMenu_Event2;
ADDRGP4 cinematicsMenuInfo+1828+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 285
;285:	cinematicsMenuInfo.cin_tier2.generic.callback	= UI_CinematicsMenu_Event2; 
ADDRGP4 cinematicsMenuInfo+1724+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 286
;286:	cinematicsMenuInfo.cin_tier1.generic.callback	= UI_CinematicsMenu_Event2; 
ADDRGP4 cinematicsMenuInfo+1620+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 287
;287:	cinematicsMenuInfo.cin_intro.generic.callback	= UI_CinematicsMenu_Event2; 
ADDRGP4 cinematicsMenuInfo+1516+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 288
;288:	cinematicsMenuInfo.cin_idlogo.generic.callback	= UI_CinematicsMenu_Event2;	
ADDRGP4 cinematicsMenuInfo+1412+76
ADDRGP4 UI_CinematicsMenu_Event2
ASGNP4
line 289
;289:	}
LABELV $316
line 292
;290:	
;291:
;292:	cinematicsMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 cinematicsMenuInfo+2244
CNSTI4 6
ASGNI4
line 293
;293:	cinematicsMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 cinematicsMenuInfo+2244+4
ADDRGP4 $352
ASGNP4
line 294
;294:	cinematicsMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+2244+72
CNSTU4 260
ASGNU4
line 295
;295:	cinematicsMenuInfo.back.generic.id			= ID_BACK;
ADDRGP4 cinematicsMenuInfo+2244+24
CNSTI4 10
ASGNI4
line 296
;296:	cinematicsMenuInfo.back.generic.callback	= UI_CinematicsMenu_BackEvent;
ADDRGP4 cinematicsMenuInfo+2244+76
ADDRGP4 UI_CinematicsMenu_BackEvent
ASGNP4
line 297
;297:	cinematicsMenuInfo.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 cinematicsMenuInfo+2244+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 298
;298:	cinematicsMenuInfo.back.generic.y			= 480-64;
ADDRGP4 cinematicsMenuInfo+2244+32
CNSTI4 416
ASGNI4
line 299
;299:	cinematicsMenuInfo.back.width				= 128;
ADDRGP4 cinematicsMenuInfo+2244+104
CNSTI4 128
ASGNI4
line 300
;300:	cinematicsMenuInfo.back.height				= 64;
ADDRGP4 cinematicsMenuInfo+2244+108
CNSTI4 64
ASGNI4
line 301
;301:	cinematicsMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 cinematicsMenuInfo+2244+88
ADDRGP4 $370
ASGNP4
line 303
;302:
;303:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.banner );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 304
;304:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_idlogo );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 305
;305:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_intro );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 306
;306:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier1 );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 307
;307:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier2 );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 308
;308:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier3 );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 309
;309:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier4 );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+1932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 310
;310:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier5 );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+2036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 311
;311:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier6 );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+2140
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 312
;312:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.back );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+2244
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 313
;313:}
LABELV $154
endproc UI_CinematicsMenu_Init 4 12
export UI_CinematicsMenu_Cache
proc UI_CinematicsMenu_Cache 0 4
line 321
;314:
;315:
;316:/*
;317:=================
;318:UI_CinematicsMenu_Cache
;319:=================
;320:*/
;321:void UI_CinematicsMenu_Cache( void ) {
line 322
;322:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $352
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 323
;323:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $370
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 324
;324:}
LABELV $381
endproc UI_CinematicsMenu_Cache 0 4
export UI_CinematicsMenu
proc UI_CinematicsMenu 0 4
line 332
;325:
;326:
;327:/*
;328:===============
;329:UI_CinematicsMenu
;330:===============
;331:*/
;332:void UI_CinematicsMenu( int load ) {
line 333
;333:	if(!load){
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $383
line 334
;334:	UI_CinematicsMenu_Init(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CinematicsMenu_Init
CALLV
pop
line 335
;335:	} else {
ADDRGP4 $384
JUMPV
LABELV $383
line 336
;336:	UI_CinematicsMenu_Init(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CinematicsMenu_Init
CALLV
pop
line 337
;337:	}
LABELV $384
line 338
;338:	UI_PushMenu( &cinematicsMenuInfo.menu );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 339
;339:}
LABELV $382
endproc UI_CinematicsMenu 0 4
export UI_CinematicsMenu_f
proc UI_CinematicsMenu_f 0 4
line 347
;340:
;341:
;342:/*
;343:===============
;344:UI_CinematicsMenu_f
;345:===============
;346:*/
;347:void UI_CinematicsMenu_f( int load ) {
line 348
;348:	if(!load){
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $386
line 349
;349:	UI_CinematicsMenu(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 350
;350:	} else {
ADDRGP4 $387
JUMPV
LABELV $386
line 351
;351:	UI_CinematicsMenu(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 352
;352:	}
LABELV $387
line 353
;353:}
LABELV $385
endproc UI_CinematicsMenu_f 0 4
import StartServer_LoadServer
bss
align 4
LABELV cinematicsMenuInfo
skip 2360
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
LABELV $370
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
LABELV $352
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
LABELV $310
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 56
byte 1 0
align 1
LABELV $294
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $278
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 54
byte 1 0
align 1
LABELV $262
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $246
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $230
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $214
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $198
byte 1 83
byte 1 76
byte 1 79
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $182
byte 1 208
byte 1 151
byte 1 208
byte 1 144
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 208
byte 1 151
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 0
align 1
LABELV $179
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 165
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 0
align 1
LABELV $171
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $168
byte 1 83
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $153
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 56
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $152
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 56
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $151
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 56
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $150
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 56
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 55
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $146
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 55
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $145
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 55
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $144
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 55
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $141
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 54
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 54
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 54
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 54
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 53
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $134
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 53
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 53
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $132
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 53
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $129
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 52
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $128
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 52
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 52
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $126
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 52
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $123
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $122
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 51
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $121
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 51
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $120
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 51
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 50
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 50
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $115
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 50
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $114
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 50
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $111
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 49
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $110
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $109
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 49
byte 1 95
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $108
byte 1 101
byte 1 112
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $107
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 49
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 95
byte 1 108
byte 1 118
byte 1 108
byte 1 0
align 1
LABELV $105
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 49
byte 1 95
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $104
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $103
byte 1 48
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $99
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 37
byte 1 105
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $88
byte 1 56
byte 1 0
align 1
LABELV $87
byte 1 55
byte 1 0
align 1
LABELV $86
byte 1 54
byte 1 0
align 1
LABELV $85
byte 1 53
byte 1 0
align 1
LABELV $84
byte 1 52
byte 1 0
align 1
LABELV $83
byte 1 51
byte 1 0
align 1
LABELV $82
byte 1 50
byte 1 0
align 1
LABELV $81
byte 1 49
byte 1 0
