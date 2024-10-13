export Svcmd_Status_f
code
proc Svcmd_Status_f 1040 12
file "../../../code/game/g_svcmds_ext.c"
line 34
;1://KK-OAX
;2:/*
;3:===========================================================================
;4:Copyright (C) 1999-2005 Id Software, Inc.
;5:
;6:This file is part of the Open Arena source code.
;7:Copied from Tremulous under GPL version 2 including any later version.
;8:
;9:Open Arena source code is free software; you can redistribute it
;10:and/or modify it under the terms of the GNU General Public License as
;11:published by the Free Software Foundation; either version 2 of the License,
;12:or (at your option) any later version.
;13:
;14:Open Arena source code is distributed in the hope that it will be
;15:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;16:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;17:GNU General Public License for more details.
;18:
;19:You should have received a copy of the GNU General Public License
;20:along with Open Arena source code; if not, write to the Free Software
;21:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;22:===========================================================================
;23:*/
;24:
;25:#include "g_local.h"
;26:
;27:/*
;28:============
;29:Svcmd_status_f
;30:Does Server Status from Console
;31:============
;32:*/
;33:void Svcmd_Status_f( void )
;34:{
line 39
;35:    int       i;
;36:    gclient_t *cl;
;37:    char      userinfo[ MAX_INFO_STRING ];
;38:
;39:    G_Printf( "slot score ping address               rate     name\n" );
ADDRGP4 $65
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 40
;40:    G_Printf( "---- ----- ---- -------               ----     ----\n" );
ADDRGP4 $66
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 41
;41:    for( i = 0, cl = level.clients; i < level.maxclients; i++, cl++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $70
JUMPV
LABELV $67
line 42
;42:    {
line 43
;43:        if( cl->pers.connected == CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $72
line 44
;44:            continue;
ADDRGP4 $68
JUMPV
LABELV $72
line 46
;45:
;46:        G_Printf( "%-4d ", i );
ADDRGP4 $74
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 47
;47:        G_Printf( "%-5d ", cl->ps.persistant[ PERS_SCORE ] );
ADDRGP4 $75
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 49
;48:
;49:        if( cl->pers.connected == CON_CONNECTING )
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $76
line 50
;50:            G_Printf( "CNCT " );
ADDRGP4 $78
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $76
line 52
;51:        else
;52:            G_Printf( "%-4d ", cl->ps.ping );
ADDRGP4 $74
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $77
line 54
;53:
;54:        trap_GetUserinfo( i, userinfo, sizeof( userinfo ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 55
;55:        G_Printf( "%-21s ", Info_ValueForKey( userinfo, "ip" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $79
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 56
;56:        G_Printf( "%-8d ", Info_ValueForKey( userinfo, "rate" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $82
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $81
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 57
;57:        G_Printf( "%s\n", cl->pers.netname ); // Info_ValueForKey( userinfo, "name" )
ADDRGP4 $83
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 58
;58:    }
LABELV $68
line 41
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2324
ADDP4
ASGNP4
LABELV $70
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $67
line 59
;59:}
LABELV $64
endproc Svcmd_Status_f 1040 12
export Svcmd_TeamMessage_f
proc Svcmd_TeamMessage_f 44 12
line 68
;60:
;61:/*
;62:============
;63:Svcmd_TeamMessage_f
;64:Sends a Chat Message to a Team from the Console
;65:============
;66:*/
;67:void Svcmd_TeamMessage_f( void )
;68:{
line 73
;69:  char   teamNum[ 2 ];
;70:  const char*   prefix;
;71:  team_t team;
;72:
;73:  if( trap_Argc( ) < 3 )
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
GEI4 $85
line 74
;74:  {
line 75
;75:    G_Printf( "usage: say_team <team> <message>\n" );
ADDRGP4 $87
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 76
;76:    return;
ADDRGP4 $84
JUMPV
LABELV $85
line 79
;77:  }
;78:
;79:  trap_Argv( 1, teamNum, sizeof( teamNum ) );
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 80
;80:  team = G_TeamFromString( teamNum );
ADDRLP4 8
ARGP4
ADDRLP4 16
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 82
;81:
;82:  if( team == TEAM_NUM_TEAMS )
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $88
line 83
;83:  {
line 84
;84:    G_Printf( "say_team: invalid team \"%s\"\n", teamNum );
ADDRGP4 $90
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 85
;85:    return;
ADDRGP4 $84
JUMPV
LABELV $88
line 88
;86:  }
;87:
;88:  prefix = BG_TeamName( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_TeamName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 89
;89:  prefix = va( "[%c] ", toupper( *prefix ) );
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRGP4 $91
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 91
;90:
;91:  G_TeamCommand( team, va( "tchat \"(console): " S_COLOR_CYAN "%s\"", ConcatArgs( 2 ) ) );
CNSTI4 2
ARGI4
ADDRLP4 32
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $92
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 92
;92:  G_LogPrintf( "sayteam: %sconsole: " S_COLOR_CYAN "%s\n", prefix, ConcatArgs( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 40
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $93
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 93
;93:}
LABELV $84
endproc Svcmd_TeamMessage_f 44 12
export Svcmd_CenterPrint_f
proc Svcmd_CenterPrint_f 12 8
line 102
;94:
;95:/*
;96:============
;97:Svcmd_CenterPrint_f
;98:Does a CenterPrint from the Console
;99:============
;100:*/
;101:void Svcmd_CenterPrint_f( void )
;102:{
line 103
;103:  if( trap_Argc( ) < 2 )
ADDRLP4 0
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $95
line 104
;104:  {
line 105
;105:    G_Printf( "usage: cp <message>\n" );
ADDRGP4 $97
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 106
;106:    return;
ADDRGP4 $94
JUMPV
LABELV $95
line 109
;107:  }
;108:
;109:  trap_SendServerCommand( -1, va( "cp \"%s\"", ConcatArgs( 1 ) ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $98
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 110
;110:}
LABELV $94
endproc Svcmd_CenterPrint_f 12 8
export Svcmd_ReplaceTexture_f
proc Svcmd_ReplaceTexture_f 2064 12
line 118
;111:/*
;112:============
;113:Svcmd_ReplaceTexture_f
;114:Replace texture
;115:============
;116:*/
;117:void Svcmd_ReplaceTexture_f( void )
;118:{
line 121
;119:	char   oldtexture[1024];
;120:	char   newtexture[1024];
;121:  if( trap_Argc( ) == 1 ){
ADDRLP4 2048
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 1
NEI4 $100
line 122
;122:    G_Printf( "usage: replacetexture <oldtexture> <newtexture>\n" );
ADDRGP4 $102
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 123
;123:  return;}
ADDRGP4 $99
JUMPV
LABELV $100
line 125
;124:  
;125:  trap_Argv( 1, oldtexture, sizeof( oldtexture ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 126
;126:  trap_Argv( 2, newtexture, sizeof( newtexture ) );
CNSTI4 2
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 128
;127:
;128:  AddRemap(va( "%s", oldtexture), va( "%s", newtexture), level.time * 0.005); 
ADDRGP4 $103
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 2052
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $103
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 2056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
INDIRP4
ARGP4
CNSTF4 1000593162
ADDRGP4 level+32
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 129
;129:  trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 2060
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 130
;130:}
LABELV $99
endproc Svcmd_ReplaceTexture_f 2064 12
export Svcmd_Condition_f
proc Svcmd_Condition_f 820 12
line 144
;131:/*
;132:============
;133:ArenaScript
;134:By Noire.dev
;135:============
;136:*/
;137:/*
;138:============
;139:Svcmd_Condition_f
;140:If operator
;141:============
;142:*/
;143:void Svcmd_Condition_f( void )
;144:{
line 148
;145:	char   value01[256];
;146:	char   symbol[256];
;147:	char   value02[256];
;148:	if( trap_Argc( ) == 1 ){
ADDRLP4 768
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 768
INDIRI4
CNSTI4 1
NEI4 $106
line 149
;149:    G_Printf( "usage: if <value01> <symbol> <value02> <cmd...>\n" );
ADDRGP4 $108
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 150
;150:	G_Printf( "<value01> | any type\n" );
ADDRGP4 $109
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 151
;151:	G_Printf( "<symbol> | =, ==, !=, !==, <, >, <=, >=\n" );
ADDRGP4 $110
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 152
;152:	G_Printf( "<value02> | any type\n" );
ADDRGP4 $111
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 153
;153:    return;}
ADDRGP4 $105
JUMPV
LABELV $106
line 155
;154:  
;155:  trap_Argv( 1, value01, sizeof( value01 ) );
CNSTI4 1
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 156
;156:  trap_Argv( 2, symbol, sizeof( symbol ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 157
;157:  trap_Argv( 3, value02, sizeof( value02 ) );
CNSTI4 3
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 159
;158:  
;159:		if(!Q_stricmp (symbol, "=")){
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRLP4 772
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $112
line 160
;160:			if(!Q_stricmp (G_ArenaScriptAutoChar( value01 ), G_ArenaScriptAutoChar( value02 ))){
ADDRLP4 256
ARGP4
ADDRLP4 776
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 512
ARGP4
ADDRLP4 780
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 776
INDIRP4
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 784
INDIRI4
CNSTI4 0
NEI4 $115
line 161
;161:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 788
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 788
INDIRP4
ARGP4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 792
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 162
;162:			}
LABELV $115
line 163
;163:		}
LABELV $112
line 164
;164:		if(!Q_stricmp (symbol, "==")){
ADDRLP4 0
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 776
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 0
NEI4 $117
line 165
;165:			if(G_ArenaScriptAutoInt( value01 ) == G_ArenaScriptAutoInt( value02 )){
ADDRLP4 256
ARGP4
ADDRLP4 780
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ARGP4
ADDRLP4 784
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 780
INDIRI4
ADDRLP4 784
INDIRI4
NEI4 $120
line 166
;166:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 788
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 788
INDIRP4
ARGP4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 792
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 167
;167:			}
LABELV $120
line 168
;168:		}
LABELV $117
line 169
;169:		if(!Q_stricmp (symbol, "!=")){
ADDRLP4 0
ARGP4
ADDRGP4 $124
ARGP4
ADDRLP4 780
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 780
INDIRI4
CNSTI4 0
NEI4 $122
line 170
;170:			if(Q_stricmp (G_ArenaScriptAutoChar( value01 ), G_ArenaScriptAutoChar( value02 )) != 0){
ADDRLP4 256
ARGP4
ADDRLP4 784
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 512
ARGP4
ADDRLP4 788
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 784
INDIRP4
ARGP4
ADDRLP4 788
INDIRP4
ARGP4
ADDRLP4 792
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 792
INDIRI4
CNSTI4 0
EQI4 $125
line 171
;171:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 796
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 796
INDIRP4
ARGP4
ADDRLP4 800
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 800
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 172
;172:			}
LABELV $125
line 173
;173:		}
LABELV $122
line 174
;174:		if(!Q_stricmp (symbol, "!==")){
ADDRLP4 0
ARGP4
ADDRGP4 $129
ARGP4
ADDRLP4 784
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 784
INDIRI4
CNSTI4 0
NEI4 $127
line 175
;175:			if(G_ArenaScriptAutoInt( value01 ) != G_ArenaScriptAutoInt( value02 )){
ADDRLP4 256
ARGP4
ADDRLP4 788
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ARGP4
ADDRLP4 792
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 788
INDIRI4
ADDRLP4 792
INDIRI4
EQI4 $130
line 176
;176:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 796
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 796
INDIRP4
ARGP4
ADDRLP4 800
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 800
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 177
;177:			}
LABELV $130
line 178
;178:		}
LABELV $127
line 179
;179:		if(!Q_stricmp (symbol, "<")){
ADDRLP4 0
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 788
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 788
INDIRI4
CNSTI4 0
NEI4 $132
line 180
;180:			if(G_ArenaScriptAutoInt( value01 ) < G_ArenaScriptAutoInt( value02 )){
ADDRLP4 256
ARGP4
ADDRLP4 792
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ARGP4
ADDRLP4 796
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 792
INDIRI4
ADDRLP4 796
INDIRI4
GEI4 $135
line 181
;181:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 800
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 800
INDIRP4
ARGP4
ADDRLP4 804
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 804
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 182
;182:			}
LABELV $135
line 183
;183:		}
LABELV $132
line 184
;184:		if(!Q_stricmp (symbol, ">")){
ADDRLP4 0
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 792
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 792
INDIRI4
CNSTI4 0
NEI4 $137
line 185
;185:			if(G_ArenaScriptAutoInt( value01 ) > G_ArenaScriptAutoInt( value02 )){
ADDRLP4 256
ARGP4
ADDRLP4 796
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ARGP4
ADDRLP4 800
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 796
INDIRI4
ADDRLP4 800
INDIRI4
LEI4 $140
line 186
;186:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 804
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 804
INDIRP4
ARGP4
ADDRLP4 808
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 808
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 187
;187:			}
LABELV $140
line 188
;188:		}
LABELV $137
line 189
;189:		if(!Q_stricmp (symbol, "<=")){
ADDRLP4 0
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 796
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 0
NEI4 $142
line 190
;190:			if(G_ArenaScriptAutoInt( value01 ) <= G_ArenaScriptAutoInt( value02 )){
ADDRLP4 256
ARGP4
ADDRLP4 800
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ARGP4
ADDRLP4 804
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 800
INDIRI4
ADDRLP4 804
INDIRI4
GTI4 $145
line 191
;191:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 808
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 808
INDIRP4
ARGP4
ADDRLP4 812
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 812
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 192
;192:			}
LABELV $145
line 193
;193:		}
LABELV $142
line 194
;194:		if(!Q_stricmp (symbol, ">=")){
ADDRLP4 0
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 800
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 800
INDIRI4
CNSTI4 0
NEI4 $147
line 195
;195:			if(G_ArenaScriptAutoInt( value01 ) >= G_ArenaScriptAutoInt( value02 )){
ADDRLP4 256
ARGP4
ADDRLP4 804
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ARGP4
ADDRLP4 808
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 804
INDIRI4
ADDRLP4 808
INDIRI4
LTI4 $150
line 196
;196:				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
CNSTI4 4
ARGI4
ADDRLP4 812
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 812
INDIRP4
ARGP4
ADDRLP4 816
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 816
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 197
;197:			}
LABELV $150
line 198
;198:		}
LABELV $147
line 200
;199:
;200:}
LABELV $105
endproc Svcmd_Condition_f 820 12
export Svcmd_Operation_f
proc Svcmd_Operation_f 816 12
line 210
;201:
;202:
;203:/*
;204:============
;205:Svcmd_Operation_f
;206:Calculate operator
;207:============
;208:*/
;209:void Svcmd_Operation_f( void )
;210:{
line 216
;211:	char   value01[256];
;212:	char   symbol[256];
;213:	char   value02[256];
;214:	int number01;
;215:	int number02;
;216:	if( trap_Argc( ) == 1 ){
ADDRLP4 776
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 1
NEI4 $153
line 217
;217:    G_Printf( "usage: op <value01> <symbol> <value02>\n" );
ADDRGP4 $155
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 218
;218:	G_Printf( "<value01> | any type\n" );
ADDRGP4 $109
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 219
;219:	G_Printf( "<symbol> | =, +=, -=, *=, /=\n" );
ADDRGP4 $156
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 220
;220:	G_Printf( "<value02> | any type\n" );
ADDRGP4 $111
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 221
;221:    return;}
ADDRGP4 $152
JUMPV
LABELV $153
line 223
;222:  
;223:  trap_Argv( 1, value01, sizeof( value01 ) );
CNSTI4 1
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 224
;224:  trap_Argv( 2, symbol, sizeof( symbol ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 225
;225:  trap_Argv( 3, value02, sizeof( value02 ) );
CNSTI4 3
ARGI4
ADDRLP4 516
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 226
;226:  number01 = G_ArenaScriptAutoInt( value01 );
ADDRLP4 256
ARGP4
ADDRLP4 780
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 780
INDIRI4
ASGNI4
line 227
;227:  number02 = G_ArenaScriptAutoInt( value02 );
ADDRLP4 516
ARGP4
ADDRLP4 784
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 772
ADDRLP4 784
INDIRI4
ASGNI4
line 229
;228:
;229:		if(!Q_stricmp (symbol, "+=")){
ADDRLP4 0
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 788
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 788
INDIRI4
CNSTI4 0
NEI4 $157
line 230
;230:			number01 += number02;
ADDRLP4 512
ADDRLP4 512
INDIRI4
ADDRLP4 772
INDIRI4
ADDI4
ASGNI4
line 231
;231:			trap_Cvar_Set( value01, va("%i", number01) );
ADDRGP4 $160
ARGP4
ADDRLP4 512
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 232
;232:		}
LABELV $157
line 233
;233:		if(!Q_stricmp (symbol, "-=")){
ADDRLP4 0
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 792
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 792
INDIRI4
CNSTI4 0
NEI4 $161
line 234
;234:			number01 -= number02;
ADDRLP4 512
ADDRLP4 512
INDIRI4
ADDRLP4 772
INDIRI4
SUBI4
ASGNI4
line 235
;235:			trap_Cvar_Set( value01, va("%i", number01) );
ADDRGP4 $160
ARGP4
ADDRLP4 512
INDIRI4
ARGI4
ADDRLP4 796
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
ARGP4
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 236
;236:		}
LABELV $161
line 237
;237:		if(!Q_stricmp (symbol, "*=")){
ADDRLP4 0
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 796
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 0
NEI4 $164
line 238
;238:			number01 *= number02;
ADDRLP4 512
ADDRLP4 512
INDIRI4
ADDRLP4 772
INDIRI4
MULI4
ASGNI4
line 239
;239:			trap_Cvar_Set( value01, va("%i", number01) );
ADDRGP4 $160
ARGP4
ADDRLP4 512
INDIRI4
ARGI4
ADDRLP4 800
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
ARGP4
ADDRLP4 800
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 240
;240:		}
LABELV $164
line 241
;241:		if(!Q_stricmp (symbol, "/=")){
ADDRLP4 0
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 800
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 800
INDIRI4
CNSTI4 0
NEI4 $167
line 242
;242:			number01 /= number02;
ADDRLP4 512
ADDRLP4 512
INDIRI4
ADDRLP4 772
INDIRI4
DIVI4
ASGNI4
line 243
;243:			trap_Cvar_Set( value01, va("%i", number01) );
ADDRGP4 $160
ARGP4
ADDRLP4 512
INDIRI4
ARGI4
ADDRLP4 804
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
ARGP4
ADDRLP4 804
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 244
;244:		}
LABELV $167
line 245
;245:		if(!Q_stricmp (symbol, "=")){
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRLP4 804
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 804
INDIRI4
CNSTI4 0
NEI4 $170
line 246
;246:			trap_Cvar_Set( value01, va("%s", G_ArenaScriptAutoChar( value02 )) );
ADDRLP4 516
ARGP4
ADDRLP4 808
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $103
ARGP4
ADDRLP4 808
INDIRP4
ARGP4
ADDRLP4 812
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
ARGP4
ADDRLP4 812
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 247
;247:		}
LABELV $170
line 249
;248:
;249:}
LABELV $152
endproc Svcmd_Operation_f 816 12
export Svcmd_Random_f
proc Svcmd_Random_f 1076 12
line 258
;250:
;251:/*
;252:============
;253:Svcmd_Random_f
;254:Random set operator
;255:============
;256:*/
;257:void Svcmd_Random_f( void )
;258:{
line 265
;259:	char   value01[256];
;260:	char   symbol[256];
;261:	char   min[256];
;262:	char   max[256];
;263:	float number01;
;264:	float number02;
;265:	if( trap_Argc( ) == 1 ){
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $173
line 266
;266:    G_Printf( "usage: random <variable> <symbol> <min> <max>\n" );
ADDRGP4 $175
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 267
;267:    G_Printf( "<variable> | any type\n" );
ADDRGP4 $176
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 268
;268:	G_Printf( "<symbol> | =, +=, -=, *=, /=\n" );
ADDRGP4 $156
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 269
;269:	G_Printf( "<min> | integer\n" );
ADDRGP4 $177
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 270
;270:	G_Printf( "<max> | integer\n" );
ADDRGP4 $178
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 271
;271:    return;}
ADDRGP4 $172
JUMPV
LABELV $173
line 273
;272:  
;273:  trap_Argv( 1, value01, sizeof( value01 ) );
CNSTI4 1
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 274
;274:  trap_Argv( 2, symbol, sizeof( symbol ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 275
;275:  trap_Argv( 3, min, sizeof( min ) );
CNSTI4 3
ARGI4
ADDRLP4 520
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 276
;276:  trap_Argv( 4, max, sizeof( max ) );
CNSTI4 4
ARGI4
ADDRLP4 776
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 277
;277:  number01 = G_ArenaScriptAutoInt( value01 );
ADDRLP4 260
ARGP4
ADDRLP4 1036
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 1036
INDIRI4
CVIF4 4
ASGNF4
line 278
;278:  number02 = G_ArenaScriptRandom( atoi(min), atoi(max) );
ADDRLP4 520
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 776
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptRandom
CALLI4
ASGNI4
ADDRLP4 516
ADDRLP4 1048
INDIRI4
CVIF4 4
ASGNF4
line 280
;279:
;280:		if(!Q_stricmp (symbol, "=")){
ADDRLP4 0
ARGP4
ADDRGP4 $114
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $179
line 281
;281:			number01 = number02;
ADDRLP4 256
ADDRLP4 516
INDIRF4
ASGNF4
line 282
;282:				trap_Cvar_Set( value01, va("%f", number01) );
ADDRGP4 $181
ARGP4
ADDRLP4 256
INDIRF4
ARGF4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 283
;283:		}
LABELV $179
line 284
;284:		if(!Q_stricmp (symbol, "+=")){
ADDRLP4 0
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $182
line 285
;285:			number01 += number02;
ADDRLP4 256
ADDRLP4 256
INDIRF4
ADDRLP4 516
INDIRF4
ADDF4
ASGNF4
line 286
;286:				trap_Cvar_Set( value01, va("%f", number01) );
ADDRGP4 $181
ARGP4
ADDRLP4 256
INDIRF4
ARGF4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 287
;287:		}
LABELV $182
line 288
;288:		if(!Q_stricmp (symbol, "-=")){
ADDRLP4 0
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $184
line 289
;289:			number01 -= number02;
ADDRLP4 256
ADDRLP4 256
INDIRF4
ADDRLP4 516
INDIRF4
SUBF4
ASGNF4
line 290
;290:				trap_Cvar_Set( value01, va("%f", number01) );
ADDRGP4 $181
ARGP4
ADDRLP4 256
INDIRF4
ARGF4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 291
;291:		}
LABELV $184
line 292
;292:		if(!Q_stricmp (symbol, "*=")){
ADDRLP4 0
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $186
line 293
;293:			number01 *= number02;
ADDRLP4 256
ADDRLP4 256
INDIRF4
ADDRLP4 516
INDIRF4
MULF4
ASGNF4
line 294
;294:				trap_Cvar_Set( value01, va("%f", number01) );
ADDRGP4 $181
ARGP4
ADDRLP4 256
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 295
;295:		}
LABELV $186
line 296
;296:		if(!Q_stricmp (symbol, "/=")){
ADDRLP4 0
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $188
line 297
;297:			number01 /= number02;
ADDRLP4 256
ADDRLP4 256
INDIRF4
ADDRLP4 516
INDIRF4
DIVF4
ASGNF4
line 298
;298:				trap_Cvar_Set( value01, va("%f", number01) );
ADDRGP4 $181
ARGP4
ADDRLP4 256
INDIRF4
ARGF4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 299
;299:		}
LABELV $188
line 301
;300:
;301:}
LABELV $172
endproc Svcmd_Random_f 1076 12
export Svcmd_Editline_f
proc Svcmd_Editline_f 792 12
line 310
;302:
;303:/*
;304:============
;305:Svcmd_Editline_f
;306:Editing line with variables
;307:============
;308:*/
;309:void Svcmd_Editline_f( void )
;310:{
line 314
;311:	char   destcvar[256];
;312:	char   mode[256];
;313:	char   value[256];
;314:	if( trap_Argc( ) == 1 ){
ADDRLP4 768
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 768
INDIRI4
CNSTI4 1
NEI4 $191
line 315
;315:    G_Printf( "usage: editline <variable> <mode> <value>\n" );
ADDRGP4 $193
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 316
;316:	G_Printf( "<variable> | any type\n" );
ADDRGP4 $176
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 317
;317:	G_Printf( "<mode> | add, begin\n" );
ADDRGP4 $194
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 318
;318:	G_Printf( "<value> | any type\n" );
ADDRGP4 $195
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 319
;319:    return;}
ADDRGP4 $190
JUMPV
LABELV $191
line 321
;320:  
;321:  trap_Argv( 1, destcvar, sizeof( destcvar ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 322
;322:  trap_Argv( 2, mode, sizeof( mode ) );
CNSTI4 2
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 323
;323:  trap_Argv( 3, value, sizeof( value ) );
CNSTI4 3
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 325
;324:
;325:	if(!Q_stricmp (mode, "add")){
ADDRLP4 256
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 772
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $196
line 326
;326:	trap_Cvar_Set( destcvar, va("%s%s", AU_Cvar_VariableString(destcvar), G_ArenaScriptAutoChar( value )) );
ADDRLP4 0
ARGP4
ADDRLP4 776
ADDRGP4 AU_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 512
ARGP4
ADDRLP4 780
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $199
ARGP4
ADDRLP4 776
INDIRP4
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 784
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 327
;327:	}
LABELV $196
line 329
;328:	
;329:	if(!Q_stricmp (mode, "begin")){
ADDRLP4 256
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 776
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 0
NEI4 $200
line 330
;330:	trap_Cvar_Set( destcvar, va("%s%s", G_ArenaScriptAutoChar( value ), AU_Cvar_VariableString(destcvar)) );
ADDRLP4 512
ARGP4
ADDRLP4 780
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 784
ADDRGP4 AU_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $199
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
INDIRP4
ARGP4
ADDRLP4 788
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 788
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 331
;331:	}
LABELV $200
line 333
;332:	
;333:}
LABELV $190
endproc Svcmd_Editline_f 792 12
export FindClByName
proc FindClByName 1044 8
line 340
;334:
;335:/*
;336:==================
;337:FindClByName
;338:==================
;339:*/
;340:int FindClByName(char *name) {
line 345
;341:	int i;
;342:	char buf[MAX_INFO_STRING];
;343:	gclient_t		*client;
;344:
;345:	for (i = -1; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $204
line 346
;346:	if(!Q_stricmp (name, va("%i", i))){
ADDRGP4 $160
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $209
line 347
;347:		return atoi(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
RETI4
ADDRGP4 $203
JUMPV
LABELV $209
line 349
;348:	}
;349:	}
LABELV $205
line 345
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $207
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $204
line 351
;350:
;351:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 352
;352:		client = &level.clients[i];
ADDRLP4 4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 353
;353:		if(!Q_stricmp (name, client->pers.netname)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $216
line 354
;354:		return client->ps.clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
RETI4
ADDRGP4 $203
JUMPV
LABELV $216
line 356
;355:		}
;356:	}
LABELV $212
line 351
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $211
line 357
;357:	return 0;
CNSTI4 0
RETI4
LABELV $203
endproc FindClByName 1044 8
export Svcmd_ClientCommand_f
proc Svcmd_ClientCommand_f 804 12
line 367
;358:}
;359:
;360:/*
;361:============
;362:Svcmd_ClientCommand_f
;363:Editing line with variables
;364:============
;365:*/
;366:void Svcmd_ClientCommand_f( void )
;367:{
line 371
;368:	char   num[256];
;369:	char   cmdtype[256];
;370:	char   cmd[256];
;371:	if( trap_Argc( ) == 1 ){
ADDRLP4 768
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 768
INDIRI4
CNSTI4 1
NEI4 $219
line 372
;372:    G_Printf( "usage: clientcmd <num or name> <type> <cmd>\n" );
ADDRGP4 $221
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 373
;373:	G_Printf( "<num> | clientnum (-1 for all)\n" );
ADDRGP4 $222
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 374
;374:	G_Printf( "<cmd> | any cmd\n" );
ADDRGP4 $223
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 375
;375:    return;}
ADDRGP4 $218
JUMPV
LABELV $219
line 377
;376:  
;377:  trap_Argv( 1, num, sizeof( num ) );
CNSTI4 1
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 378
;378:  trap_Argv( 2, cmdtype, sizeof( cmdtype ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 379
;379:  trap_Argv( 3, cmd, sizeof( cmd ) );
CNSTI4 3
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 381
;380:
;381:if(atoi(cmdtype) == 0 || atoi(cmdtype) == 1){
ADDRLP4 0
ARGP4
ADDRLP4 772
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 772
INDIRI4
CNSTI4 0
EQI4 $226
ADDRLP4 0
ARGP4
ADDRLP4 776
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 1
NEI4 $224
LABELV $226
line 382
;382:  trap_SendServerCommand( FindClByName(num), va("clcmd \"%s\"", cmd));
ADDRLP4 256
ARGP4
ADDRLP4 780
ADDRGP4 FindClByName
CALLI4
ASGNI4
ADDRGP4 $227
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 784
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 780
INDIRI4
ARGI4
ADDRLP4 784
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 383
;383:}
LABELV $224
line 384
;384:if(atoi(cmdtype) == 2){
ADDRLP4 0
ARGP4
ADDRLP4 780
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 780
INDIRI4
CNSTI4 2
NEI4 $228
line 385
;385:  trap_SendServerCommand( FindClByName(num), va("\"%s\"", cmd));
ADDRLP4 256
ARGP4
ADDRLP4 784
ADDRGP4 FindClByName
CALLI4
ASGNI4
ADDRGP4 $230
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 788
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 784
INDIRI4
ARGI4
ADDRLP4 788
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 386
;386:}
LABELV $228
line 387
;387:if(atoi(cmdtype) == 3){
ADDRLP4 0
ARGP4
ADDRLP4 784
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 784
INDIRI4
CNSTI4 3
NEI4 $231
line 388
;388:  trap_EA_Say( FindClByName(num), va("\"%s\"", cmd));
ADDRLP4 256
ARGP4
ADDRLP4 788
ADDRGP4 FindClByName
CALLI4
ASGNI4
ADDRGP4 $230
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 788
INDIRI4
ARGI4
ADDRLP4 792
INDIRP4
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 389
;389:}
LABELV $231
line 390
;390:if(atoi(cmdtype) == 4){
ADDRLP4 0
ARGP4
ADDRLP4 788
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 788
INDIRI4
CNSTI4 4
NEI4 $233
line 391
;391:  trap_EA_SayTeam( FindClByName(num), va("\"%s\"", cmd));
ADDRLP4 256
ARGP4
ADDRLP4 792
ADDRGP4 FindClByName
CALLI4
ASGNI4
ADDRGP4 $230
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 796
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 792
INDIRI4
ARGI4
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 392
;392:}
LABELV $233
line 393
;393:if(atoi(cmdtype) == 5){
ADDRLP4 0
ARGP4
ADDRLP4 792
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 792
INDIRI4
CNSTI4 5
NEI4 $235
line 394
;394:  trap_EA_Command( FindClByName(num), va("\"%s\"", cmd));
ADDRLP4 256
ARGP4
ADDRLP4 796
ADDRGP4 FindClByName
CALLI4
ASGNI4
ADDRGP4 $230
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 800
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 796
INDIRI4
ARGI4
ADDRLP4 800
INDIRP4
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 395
;395:}
LABELV $235
line 396
;396:}
LABELV $218
endproc Svcmd_ClientCommand_f 804 12
export Svcmd_SystemCommand_f
proc Svcmd_SystemCommand_f 264 12
line 405
;397:
;398:/*
;399:============
;400:Svcmd_SystemCommand_f
;401:Editing line with variables
;402:============
;403:*/
;404:void Svcmd_SystemCommand_f( void )
;405:{
line 407
;406:	char   cmd[256];
;407:	if( trap_Argc( ) == 1 ){
ADDRLP4 256
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 1
NEI4 $238
line 408
;408:    G_Printf( "usage: syscmd <cmd>\n" );
ADDRGP4 $240
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 409
;409:	G_Printf( "<cmd> | any cmd\n" );
ADDRGP4 $223
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 410
;410:    return;}
ADDRGP4 $237
JUMPV
LABELV $238
line 412
;411:  
;412:  trap_Argv( 1, cmd, sizeof( cmd ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 414
;413:	
;414:  trap_System( va("\"%s\"", cmd));
ADDRGP4 $230
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRGP4 trap_System
CALLV
pop
line 416
;415:	
;416:}
LABELV $237
endproc Svcmd_SystemCommand_f 264 12
export Svcmd_SaveSession_f
proc Svcmd_SaveSession_f 1076 12
line 425
;417:
;418:/*
;419:============
;420:Svcmd_SaveSession_f
;421:Editing line with variables
;422:============
;423:*/
;424:void Svcmd_SaveSession_f( void )
;425:{
line 427
;426:	char   num[1024];
;427:	if( trap_Argc( ) == 1 ){
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 1
NEI4 $242
line 428
;428:    G_Printf( "usage: save <number>\n" );
ADDRGP4 $244
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 429
;429:	G_Printf( "<number> | any slot 1-8\n" );
ADDRGP4 $245
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 430
;430:    return;}
ADDRGP4 $241
JUMPV
LABELV $242
line 432
;431:  
;432:  trap_Argv( 1, num, sizeof( num ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 434
;433:  
;434:	G_UpdateClientSessionDataForMapChange( level.player->client );
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UpdateClientSessionDataForMapChange
CALLI4
pop
line 435
;435:	G_UpdateGlobalSessionDataForMapChange();
ADDRGP4 G_UpdateGlobalSessionDataForMapChange
CALLI4
pop
line 436
;436:	G_SaveClientSessionDataSave( level.player->client );
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_SaveClientSessionDataSave
CALLV
pop
line 438
;437:
;438:	if(atoi(num) == 1){
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $248
line 439
;439:	trap_Cvar_Set( "save1_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1032
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $250
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 440
;440:	trap_Cvar_Set( "save1_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1036
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $252
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 441
;441:	trap_Cvar_Set( "save1_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1040
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $254
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 442
;442:	trap_Cvar_Set( "save1_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $256
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 443
;443:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save01\n" );
CNSTI4 1
ARGI4
ADDRGP4 $258
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 444
;444:	}
LABELV $248
line 445
;445:	if(atoi(num) == 2){
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
NEI4 $259
line 446
;446:	trap_Cvar_Set( "save2_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1036
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $261
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 447
;447:	trap_Cvar_Set( "save2_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1040
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $262
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 448
;448:	trap_Cvar_Set( "save2_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $263
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 449
;449:	trap_Cvar_Set( "save2_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $264
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 450
;450:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save02\n" );
CNSTI4 1
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 451
;451:	}
LABELV $259
line 452
;452:	if(atoi(num) == 3){
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 3
NEI4 $266
line 453
;453:	trap_Cvar_Set( "save3_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1040
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $268
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 454
;454:	trap_Cvar_Set( "save3_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $269
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 455
;455:	trap_Cvar_Set( "save3_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $270
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 456
;456:	trap_Cvar_Set( "save3_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $271
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 457
;457:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save03\n" );
CNSTI4 1
ARGI4
ADDRGP4 $272
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 458
;458:	}
LABELV $266
line 459
;459:	if(atoi(num) == 4){
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 4
NEI4 $273
line 460
;460:	trap_Cvar_Set( "save4_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $275
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 461
;461:	trap_Cvar_Set( "save4_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $276
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 462
;462:	trap_Cvar_Set( "save4_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $277
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 463
;463:	trap_Cvar_Set( "save4_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $278
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 464
;464:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save04\n" );
CNSTI4 1
ARGI4
ADDRGP4 $279
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 465
;465:	}
LABELV $273
line 466
;466:	if(atoi(num) == 5){
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 5
NEI4 $280
line 467
;467:	trap_Cvar_Set( "save5_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $282
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 468
;468:	trap_Cvar_Set( "save5_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $283
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 469
;469:	trap_Cvar_Set( "save5_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $284
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 470
;470:	trap_Cvar_Set( "save5_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1060
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $285
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 471
;471:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save05\n" );
CNSTI4 1
ARGI4
ADDRGP4 $286
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 472
;472:	}
LABELV $280
line 473
;473:	if(atoi(num) == 6){
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 6
NEI4 $287
line 474
;474:	trap_Cvar_Set( "save6_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $289
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 475
;475:	trap_Cvar_Set( "save6_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $290
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 476
;476:	trap_Cvar_Set( "save6_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1060
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 477
;477:	trap_Cvar_Set( "save6_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1064
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $292
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 478
;478:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save06\n" );
CNSTI4 1
ARGI4
ADDRGP4 $293
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 479
;479:	}
LABELV $287
line 480
;480:	if(atoi(num) == 7){
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 7
NEI4 $294
line 481
;481:	trap_Cvar_Set( "save7_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $296
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 482
;482:	trap_Cvar_Set( "save7_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1060
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 483
;483:	trap_Cvar_Set( "save7_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1064
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 484
;484:	trap_Cvar_Set( "save7_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1068
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $299
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 485
;485:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save07\n" );
CNSTI4 1
ARGI4
ADDRGP4 $300
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 486
;486:	}
LABELV $294
line 487
;487:	if(atoi(num) == 8){
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 8
NEI4 $301
line 488
;488:	trap_Cvar_Set( "save8_session0", G_ArenaScriptAutoChar( "save_session0" ) );
ADDRGP4 $251
ARGP4
ADDRLP4 1060
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $303
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 489
;489:	trap_Cvar_Set( "save8_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
ADDRGP4 $253
ARGP4
ADDRLP4 1064
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $304
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 490
;490:	trap_Cvar_Set( "save8_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
ADDRGP4 $255
ARGP4
ADDRLP4 1068
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $305
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 491
;491:	trap_Cvar_Set( "save8_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
ADDRGP4 $257
ARGP4
ADDRLP4 1072
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $306
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 492
;492:	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save08\n" );
CNSTI4 1
ARGI4
ADDRGP4 $307
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 493
;493:	}
LABELV $301
line 494
;494:}
LABELV $241
endproc Svcmd_SaveSession_f 1076 12
export Svcmd_Cvar_f
proc Svcmd_Cvar_f 792 12
line 503
;495:
;496:/*
;497:============
;498:Svcmd_Cvar_f
;499:Editing line with variables
;500:============
;501:*/
;502:void Svcmd_Cvar_f( void )
;503:{
line 507
;504:	char   mode[256];
;505:	char   cvarname[256];
;506:	char   targetcvar[256];
;507:	if( trap_Argc( ) == 1 ){
ADDRLP4 768
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 768
INDIRI4
CNSTI4 1
NEI4 $309
line 508
;508:    G_Printf( "usage: cvar <mode> <cvarname> <targetcvar>\n" );
ADDRGP4 $311
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 509
;509:	G_Printf( "<mode> | delete, save, load,\n" );
ADDRGP4 $312
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 510
;510:	G_Printf( "<cvarname> | any cvar\n" );
ADDRGP4 $313
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 511
;511:	G_Printf( "<targetcvar> | any cvar\n" );
ADDRGP4 $314
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 512
;512:    return;}
ADDRGP4 $308
JUMPV
LABELV $309
line 514
;513:  
;514:  trap_Argv( 1, mode, sizeof( mode ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 515
;515:  trap_Argv( 2, cvarname, sizeof( cvarname ) );
CNSTI4 2
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 516
;516:  trap_Argv( 3, targetcvar, sizeof( targetcvar ) );
CNSTI4 3
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 518
;517:
;518:	if(!Q_stricmp (mode, "delete")){
ADDRLP4 0
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 772
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $315
line 519
;519:	trap_SendConsoleCommand( EXEC_APPEND, va("unset %s\n", cvarname));
ADDRGP4 $318
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 776
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 776
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 520
;520:	}
LABELV $315
line 522
;521:	
;522:	if(!Q_stricmp (mode, "save")){
ADDRLP4 0
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 776
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 0
NEI4 $319
line 523
;523:	trap_SendConsoleCommand( EXEC_APPEND, va("seta %s %s\n", targetcvar, G_ArenaScriptAutoChar( cvarname )));
ADDRLP4 256
ARGP4
ADDRLP4 780
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 784
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 524
;524:	}
LABELV $319
line 526
;525:	
;526:	if(!Q_stricmp (mode, "load")){
ADDRLP4 0
ARGP4
ADDRGP4 $325
ARGP4
ADDRLP4 780
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 780
INDIRI4
CNSTI4 0
NEI4 $323
line 527
;527:	trap_SendConsoleCommand( EXEC_APPEND, va("set %s %s\n", cvarname, G_ArenaScriptAutoChar( targetcvar )));
ADDRLP4 512
ARGP4
ADDRLP4 784
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $326
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 784
INDIRP4
ARGP4
ADDRLP4 788
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 788
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 528
;528:	}
LABELV $323
line 530
;529:	
;530:}
LABELV $308
endproc Svcmd_Cvar_f 792 12
export Svcmd_For_f
proc Svcmd_For_f 1068 12
line 539
;531:
;532:/*
;533:============
;534:Svcmd_For_f
;535:For operator
;536:============
;537:*/
;538:void Svcmd_For_f( void )
;539:{
line 545
;540:	int    i;
;541:	char   value01[256];
;542:	char   symbol[256];
;543:	char   value02[256];
;544:	char   value03[256];
;545:  if( trap_Argc( ) == 1 ){
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $328
line 546
;546:    G_Printf( "usage: for <initial> <symbol> <value> <increment> <cmd...>\n" );
ADDRGP4 $330
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 547
;547:	G_Printf( "<initial> | int number type\n" );
ADDRGP4 $331
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 548
;548:	G_Printf( "<symbol> | ==, !=, <, >, <=, >=\n" );
ADDRGP4 $332
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 549
;549:	G_Printf( "<value> | int number type\n" );
ADDRGP4 $333
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 550
;550:	G_Printf( "<increment> | int number type\n" );
ADDRGP4 $334
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 551
;551:    return;}
ADDRGP4 $327
JUMPV
LABELV $328
line 553
;552:  
;553:  trap_Argv( 1, value01, sizeof( value01 ) );
CNSTI4 1
ARGI4
ADDRLP4 772
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 554
;554:  trap_Argv( 2, symbol, sizeof( symbol ) );
CNSTI4 2
ARGI4
ADDRLP4 516
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 555
;555:  trap_Argv( 3, value02, sizeof( value02 ) );
CNSTI4 3
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 556
;556:  trap_Argv( 4, value03, sizeof( value03 ) );
CNSTI4 4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 558
;557:  
;558:if(!Q_stricmp (symbol, "==")){ 
ADDRLP4 516
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $335
line 559
;559:for( i = G_ArenaScriptAutoInt( value01 ); i == G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
ADDRLP4 772
ARGP4
ADDRLP4 1036
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1036
INDIRI4
ASGNI4
ADDRGP4 $340
JUMPV
LABELV $337
line 560
;560:	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 1040
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 561
;561:}
LABELV $338
line 559
ADDRLP4 260
ARGP4
ADDRLP4 1040
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1040
INDIRI4
ADDI4
ASGNI4
LABELV $340
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1044
INDIRI4
EQI4 $337
line 562
;562:}
LABELV $335
line 563
;563:if(!Q_stricmp (symbol, "!=")){
ADDRLP4 516
ARGP4
ADDRGP4 $124
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $341
line 564
;564:for( i = G_ArenaScriptAutoInt( value01 ); i != G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
ADDRLP4 772
ARGP4
ADDRLP4 1040
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $343
line 565
;565:	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 1044
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 566
;566:}
LABELV $344
line 564
ADDRLP4 260
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
ASGNI4
LABELV $346
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
NEI4 $343
line 567
;567:}
LABELV $341
line 568
;568:if(!Q_stricmp (symbol, "<")){
ADDRLP4 516
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $347
line 569
;569:for( i = G_ArenaScriptAutoInt( value01 ); i < G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
ADDRLP4 772
ARGP4
ADDRLP4 1044
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1044
INDIRI4
ASGNI4
ADDRGP4 $352
JUMPV
LABELV $349
line 570
;570:	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 1048
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 571
;571:}
LABELV $350
line 569
ADDRLP4 260
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
ASGNI4
LABELV $352
ADDRLP4 4
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $349
line 572
;572:}
LABELV $347
line 573
;573:if(!Q_stricmp (symbol, ">")){
ADDRLP4 516
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $353
line 574
;574:for( i = G_ArenaScriptAutoInt( value01 ); i > G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
ADDRLP4 772
ARGP4
ADDRLP4 1048
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1048
INDIRI4
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 575
;575:	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 1052
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 576
;576:}
LABELV $356
line 574
ADDRLP4 260
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1052
INDIRI4
ADDI4
ASGNI4
LABELV $358
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1056
INDIRI4
GTI4 $355
line 577
;577:}
LABELV $353
line 578
;578:if(!Q_stricmp (symbol, "<=")){
ADDRLP4 516
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $359
line 579
;579:for( i = G_ArenaScriptAutoInt( value01 ); i <= G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
ADDRLP4 772
ARGP4
ADDRLP4 1052
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1052
INDIRI4
ASGNI4
ADDRGP4 $364
JUMPV
LABELV $361
line 580
;580:	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 581
;581:}
LABELV $362
line 579
ADDRLP4 260
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1056
INDIRI4
ADDI4
ASGNI4
LABELV $364
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1060
INDIRI4
LEI4 $361
line 582
;582:}
LABELV $359
line 583
;583:if(!Q_stricmp (symbol, ">=")){
ADDRLP4 516
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $365
line 584
;584:for( i = G_ArenaScriptAutoInt( value01 ); i >= G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
ADDRLP4 772
ARGP4
ADDRLP4 1056
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1056
INDIRI4
ASGNI4
ADDRGP4 $370
JUMPV
LABELV $367
line 585
;585:	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 1060
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $83
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 586
;586:}
LABELV $368
line 584
ADDRLP4 260
ARGP4
ADDRLP4 1060
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1060
INDIRI4
ADDI4
ASGNI4
LABELV $370
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 G_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
GEI4 $367
line 587
;587:}
LABELV $365
line 589
;588:
;589:}
LABELV $327
endproc Svcmd_For_f 1068 12
export Svcmd_BannerPrint_f
proc Svcmd_BannerPrint_f 12 8
line 599
;590:
;591:/*
;592:============
;593:Svcmd_BannerPrint_f
;594:Does a BannerPrint from the Console
;595:KK-OAX Commented out in g_svccmds.c, so right now it's useless.
;596:============
;597:*/
;598:void Svcmd_BannerPrint_f( void )
;599:{
line 600
;600:  if( trap_Argc( ) < 2 )
ADDRLP4 0
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $372
line 601
;601:  {
line 602
;602:    G_Printf( "usage: bp <message>\n" );
ADDRGP4 $374
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 603
;603:    return;
ADDRGP4 $371
JUMPV
LABELV $372
line 606
;604:  }
;605:
;606:  trap_SendServerCommand( -1, va( "bp \"%s\"", ConcatArgs( 1 ) ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $375
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 607
;607:}
LABELV $371
endproc Svcmd_BannerPrint_f 12 8
export Svcmd_EjectClient_f
proc Svcmd_EjectClient_f 1048 12
line 617
;608:/*
;609:============
;610:Svcmd_EjectClient_f
;611:Kicks a Client from Console
;612:KK-OAX, I'm pretty sure this is also done in the "server" portion 
;613:of the engine code with "kick," but oh well. 
;614:============
;615:*/
;616:void Svcmd_EjectClient_f( void )
;617:{
line 620
;618:  char *reason, name[ MAX_STRING_CHARS ];
;619:
;620:  if( trap_Argc( ) < 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
GEI4 $377
line 621
;621:  {
line 622
;622:    G_Printf( "usage: eject <player|-1> <reason>\n" );
ADDRGP4 $379
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 623
;623:    return;
ADDRGP4 $376
JUMPV
LABELV $377
line 626
;624:  }
;625:
;626:  trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 627
;627:  reason = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1032
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1032
INDIRP4
ASGNP4
line 629
;628:
;629:  if( atoi( name ) == -1 )
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $380
line 630
;630:  {
line 632
;631:    int i;
;632:    for( i = 0; i < level.maxclients; i++ )
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $382
line 633
;633:    {
line 634
;634:      if( level.clients[ i ].pers.connected == CON_DISCONNECTED )
CNSTI4 2324
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $387
line 635
;635:        continue;
ADDRGP4 $383
JUMPV
LABELV $387
line 636
;636:      if( level.clients[ i ].pers.localClient )
CNSTI4 2324
ADDRLP4 1040
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $389
line 637
;637:        continue;
ADDRGP4 $383
JUMPV
LABELV $389
line 638
;638:      trap_DropClient( i, reason );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 639
;639:    }
LABELV $383
line 632
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $385
ADDRLP4 1040
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $382
line 640
;640:  }
ADDRGP4 $381
JUMPV
LABELV $380
line 642
;641:  else
;642:  {
line 643
;643:    gclient_t *cl = ClientForString( name );
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1044
INDIRP4
ASGNP4
line 644
;644:    if( !cl )
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $391
line 645
;645:      return;
ADDRGP4 $376
JUMPV
LABELV $391
line 646
;646:    if( cl->pers.localClient )
ADDRLP4 1040
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $393
line 647
;647:    {
line 648
;648:      G_Printf( "eject: cannot eject local clients\n" );
ADDRGP4 $395
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 649
;649:      return;
ADDRGP4 $376
JUMPV
LABELV $393
line 651
;650:    }
;651:    trap_DropClient( cl-level.clients, reason );
ADDRLP4 1040
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 652
;652:  }
LABELV $381
line 653
;653:}
LABELV $376
endproc Svcmd_EjectClient_f 1048 12
export Svcmd_DumpUser_f
proc Svcmd_DumpUser_f 18448 12
line 662
;654:
;655:/*
;656:============
;657:Svcmd_DumpUser_f
;658:Shows User Info
;659:============
;660:*/
;661:void Svcmd_DumpUser_f( void )
;662:{
line 668
;663:  char name[ MAX_STRING_CHARS ], userinfo[ MAX_INFO_STRING ];
;664:  char key[ BIG_INFO_KEY ], value[ BIG_INFO_VALUE ];
;665:  const char *info;
;666:  gclient_t *cl;
;667:
;668:  if( trap_Argc( ) != 2 )
ADDRLP4 18440
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 18440
INDIRI4
CNSTI4 2
EQI4 $397
line 669
;669:  {
line 670
;670:    G_Printf( "usage: dumpuser <player>\n" );
ADDRGP4 $399
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 671
;671:    return;
ADDRGP4 $396
JUMPV
LABELV $397
line 674
;672:  }
;673:
;674:  trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 16388
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 675
;675:  cl = ClientForString( name );
ADDRLP4 16388
ARGP4
ADDRLP4 18444
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 18436
ADDRLP4 18444
INDIRP4
ASGNP4
line 676
;676:  if( !cl )
ADDRLP4 18436
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $400
line 677
;677:    return;
ADDRGP4 $396
JUMPV
LABELV $400
line 679
;678:
;679:  trap_GetUserinfo( cl-level.clients, userinfo, sizeof( userinfo ) );
ADDRLP4 18436
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ARGI4
ADDRLP4 17412
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 680
;680:  info = &userinfo[ 0 ];
ADDRLP4 0
ADDRLP4 17412
ASGNP4
line 681
;681:  G_Printf( "userinfo\n--------\n" );
ADDRGP4 $402
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $404
JUMPV
LABELV $403
line 684
;682:  //Info_Print( userinfo );
;683:  while( 1 )
;684:  {
line 685
;685:    Info_NextPair( &info, key, value );
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8196
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 686
;686:    if( !*info )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $406
line 687
;687:      return;
ADDRGP4 $396
JUMPV
LABELV $406
line 689
;688:
;689:    G_Printf( "%-20s%s\n", key, value );
ADDRGP4 $408
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8196
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 690
;690:  }
LABELV $404
line 683
ADDRGP4 $403
JUMPV
line 691
;691:}
LABELV $396
endproc Svcmd_DumpUser_f 18448 12
export Svcmd_Chat_f
proc Svcmd_Chat_f 12 8
line 694
;692:
;693:void Svcmd_Chat_f( void )
;694:{
line 695
;695:    trap_SendServerCommand( -1, va( "chat \"%s\"", ConcatArgs( 1 ) ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $410
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 696
;696:    G_LogPrintf("chat: %s\n", ConcatArgs( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $411
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 697
;697:}
LABELV $409
endproc Svcmd_Chat_f 12 8
export Svcmd_ListIP_f
proc Svcmd_ListIP_f 0 8
line 706
;698:
;699:/*
;700:=============
;701:Svcmd_ListIP_f
;702:Dumb Wrapper for the trap_Send command
;703:=============
;704:*/
;705:void Svcmd_ListIP_f( void )
;706:{
line 707
;707:    trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
CNSTI4 0
ARGI4
ADDRGP4 $413
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 708
;708:}
LABELV $412
endproc Svcmd_ListIP_f 0 8
export Svcmd_MessageWrapper
proc Svcmd_MessageWrapper 20 16
line 717
;709:
;710:/*
;711:=============
;712:Svcmd_MessageWrapper
;713:Dumb wrapper for "a" and "m" and "say"
;714:=============
;715:*/
;716:void Svcmd_MessageWrapper( void )
;717:{
line 719
;718:  char cmd[ 5 ];
;719:  trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 725
;720:  /*if( !Q_stricmp( cmd, "a" ) )
;721:    Cmd_AdminMessage_f( NULL );
;722:  else if( !Q_stricmp( cmd, "m" ) )
;723:    Cmd_PrivateMessage_f( NULL );
;724:  else*/
;725:  if( !Q_stricmp( cmd, "say" ) )
ADDRLP4 0
ARGP4
ADDRGP4 $417
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $415
line 726
;726:    G_Say( NULL, NULL, SAY_ALL, ConcatArgs( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
LABELV $415
line 727
;727:}
LABELV $414
endproc Svcmd_MessageWrapper 20 16
export Svcmd_HideSandObj_f
proc Svcmd_HideSandObj_f 528 12
line 736
;728:
;729:/*
;730:============
;731:Svcmd_HideSandObj_f
;732:Replace texture
;733:============
;734:*/
;735:void Svcmd_HideSandObj_f( void )
;736:{
line 739
;737:	char   oldtexture[256];
;738:	char   newtexture[256];
;739:  if( trap_Argc( ) == 1 ){
ADDRLP4 512
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 1
NEI4 $419
line 740
;740:    G_Printf( "usage: replacetexture <oldtexture> <newtexture>\n" );
ADDRGP4 $102
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 741
;741:  return;}
ADDRGP4 $418
JUMPV
LABELV $419
line 743
;742:  
;743:  trap_Argv( 1, oldtexture, sizeof( oldtexture ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 744
;744:  trap_Argv( 2, newtexture, sizeof( newtexture ) );
CNSTI4 2
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 746
;745:
;746:  AddRemap(va( "%s", oldtexture), va( "%s", newtexture), level.time * 0.005); 
ADDRGP4 $103
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 516
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $103
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 520
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 516
INDIRP4
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
CNSTF4 1000593162
ADDRGP4 level+32
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 747
;747:  trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 524
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 524
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 748
;748:}
LABELV $418
endproc Svcmd_HideSandObj_f 528 12
import G_UpdateGlobalSessionDataForMapChange
import G_UpdateClientSessionDataForMapChange
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_shuffle
import G_admin_warn
import G_admin_slap
import G_admin_orient
import G_admin_disorient
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_mute
import G_admin_map
import G_admin_listplayers
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_parse_time
import G_admin_level
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
import G_ConfigClientExcellent
import G_checkForMultiKill
import G_CheckForSpree
import G_RunStreakLogic
import G_ReadAltKillSettings
import AU_Cvar_VariableString
import G_ArenaScriptRandom
import G_ArenaScriptAutoFloat
import G_ArenaScriptAutoNonPointChar
import G_ArenaScriptAutoChar
import G_ArenaScriptAutoInt
import G_ArenaScriptFindFloat
import G_ArenaScriptFindChar
import G_ArenaScriptFindInt
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_maxNameChanges
import g_minNameChangePeriod
import g_warningExpire
import g_maxWarnings
import g_publicAdminMessages
import g_specChat
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminParseSay
import g_adminLog
import g_admin
import g_floodMinTime
import g_floodMaxDemerits
import g_spreeDiv
import g_altExcellent
import g_sprees
import g_lagLightning
import sv_fps
import g_truePing
import g_delagHitscan
import g_blueTeamClientNumbers
import g_redTeamClientNumbers
import g_humanplayers
import g_maxvotes
import g_voteMaxFraglimit
import g_voteMinFraglimit
import g_voteMaxTimelimit
import g_voteMinTimelimit
import g_voteGametypes
import g_voteBan
import g_voteNames
import g_mappools
import g_autonextmap
import g_catchup
import g_persistantpowerups
import g_awardpushing
import g_elimination_ctf_oneway
import g_lms_mode
import g_lms_lives
import g_ffa_gt
import g_regen
import g_vampireMaxHealth
import g_vampire
import g_instantgib
import g_rockets
import g_elimination_lockspectator
import g_eliminationred_holdable
import g_eliminationred_flight
import g_eliminationred_regen
import g_eliminationred_invis
import g_eliminationred_bsuit
import g_eliminationred_haste
import g_eliminationred_quad
import g_eliminationred_antimatter
import g_eliminationred_flame
import g_eliminationred_nail
import g_eliminationred_mine
import g_eliminationred_chain
import g_eliminationred_plasmagun
import g_eliminationred_lightning
import g_eliminationred_railgun
import g_eliminationred_rocket
import g_eliminationred_grenade
import g_eliminationred_shotgun
import g_eliminationred_machinegun
import g_eliminationred_gauntlet
import g_eliminationred_grapple
import g_eliminationred_bfg
import g_eliminationred_startArmor
import g_eliminationred_startHealth
import g_elimination_holdable
import g_elimination_items
import g_elimination_flight
import g_elimination_regen
import g_elimination_invis
import g_elimination_bsuit
import g_elimination_haste
import g_elimination_quad
import g_elimination_antimatter
import g_elimination_flame
import g_elimination_nail
import g_elimination_mine
import g_elimination_chain
import g_elimination_plasmagun
import g_elimination_lightning
import g_elimination_railgun
import g_elimination_rocket
import g_elimination_grenade
import g_elimination_shotgun
import g_elimination_machinegun
import g_elimination_gauntlet
import g_elimination_allgametypes
import g_elimination_activewarmup
import g_elimination_warmup
import g_elimination_roundtime
import g_elimination_grapple
import g_elimination_bfg
import g_elimination_startArmor
import g_elimination_startHealth
import g_elimination_selfdamage
import g_spawnprotect
import g_music
import g_proxMineTimeout
import g_enableBreath
import g_enableDust
import g_blueteam
import g_redteam
import g_singlePlayer
import g_rankings
import pmove_float
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_votecustom
import g_votemaps
import g_motdfile
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_allowSyncCutscene
import g_debugBotspawns
import g_debugVariables
import g_debugScore
import g_debugCameras
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_disableCutscenes
import g_inactivity
import g_respawntime
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_damageModifier
import g_gravityModifier
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_voteflags
import g_elimflags
import g_videoflags
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_poweruprespawn
import g_megahealthrespawn
import g_holdablerespawn
import g_ammorespawn
import g_healthrespawn
import g_armorrespawn
import g_ammolimit
import g_drowndamage
import g_speedfactor
import g_jumpheight
import g_respawnwait
import g_armorprotect
import g_medkitmodifier
import g_hastefirespeed
import g_autoflagreturn
import g_droppeditemtime
import g_slowhealthregen
import g_fasthealthregen
import g_invultime
import g_invulmove
import g_portalhealth
import g_portaltimeout
import g_flagrespawn
import g_noplayerclip
import g_falldamagebig
import g_falldamagesmall
import g_randomteleport
import g_maxweaponpickup
import g_slimedamage
import g_lavadamage
import g_waterdamage
import g_medkitlimit
import g_kamikazeinf
import g_portalinf
import g_teleporterinf
import g_medkitinf
import g_invulinf
import g_kamikazeinfinf
import g_kill
import g_mapcycleposition
import g_useMapcycle
import g_mapcycle
import info_zombie
import g_randomItems
import g_accelerate
import g_slickmove
import g_overlay
import g_lavatowater
import onandroid
import eliminationrespawn
import eliminationredrespawn
import g_spectatorspeed
import g_regenarmor
import tex_newname
import tex_name
import g_roundmode
import g_scoreboardlock
import g_connectmsg
import g_currentmap
import g_tests
import cl_language
import cl_selectedmod
import g_maxEntities
import g_npcdrop
import g_safe
import g_allowgravitygun
import g_allowphysgun
import g_allowtoolgun
import g_allownoclip
import g_allowitems
import g_allownpc
import g_allowsettings
import g_allowprops
import save8_epsession
import save8_session0_lvl
import save8_session0
import save7_epsession
import save7_session0_lvl
import save7_session0
import save6_epsession
import save6_session0_lvl
import save6_session0
import save5_epsession
import save5_session0_lvl
import save5_session0
import save4_epsession
import save4_session0_lvl
import save4_session0
import save3_epsession
import save3_session0_lvl
import save3_session0
import save2_epsession
import save2_session0_lvl
import save2_session0
import save1_epsession
import save1_session0_lvl
import save1_session0
import save_epsession
import save_session0_lvl
import save_session0
import save8_curmap
import save7_curmap
import save6_curmap
import save5_curmap
import save4_curmap
import save3_curmap
import save2_curmap
import save1_curmap
import save_curmap
import g_skyColorA
import g_skyColorB
import g_skyColorG
import g_skyColorR
import g_skyShader
import g_fogColorA
import g_fogColorB
import g_fogColorG
import g_fogColorR
import g_fogInterval
import g_fogDistance
import g_fogShader
import g_fogModel
import g_teamred_pickupitems
import g_teamred_respawnwait
import g_teamred_infammo
import g_teamred_damage
import g_teamred_firespeed
import g_teamred_gravityModifier
import g_teamred_speed
import g_teamblue_pickupitems
import g_teamblue_respawnwait
import g_teamblue_infammo
import g_teamblue_damage
import g_teamblue_firespeed
import g_teamblue_gravityModifier
import g_teamblue_speed
import g_amweaponcount
import g_ftweaponcount
import g_cgweaponcount
import g_plweaponcount
import g_ngweaponcount
import g_bfgweaponcount
import g_pgweaponcount
import g_rgweaponcount
import g_lgweaponcount
import g_rlweaponcount
import g_glweaponcount
import g_sgweaponcount
import g_mgweaponcount
import g_ftammocount
import g_cgammocount
import g_plammocount
import g_ngammocount
import g_bfgammocount
import g_pgammocount
import g_rgammocount
import g_lgammocount
import g_rlammocount
import g_glammocount
import g_sgammocount
import g_mgammocount
import g_ammoregenhealthmodifier
import g_ammoregengravitymodifier
import g_ammoregenspeedfactor
import g_ammoregendamagefactor
import g_ammoregen_infammo
import g_ammoregenfirespeed
import g_guard_infammo
import g_guardgravitymodifier
import g_guardspeedfactor
import g_guarddamagefactor
import g_guardfirespeed
import g_guardhealthmodifier
import g_doublerhealthmodifier
import g_doubler_infammo
import g_doublergravitymodifier
import g_doublerspeedfactor
import g_doublerdamagefactor
import g_doublerfirespeed
import g_scouthealthmodifier
import g_scout_infammo
import g_scoutgravitymodifier
import g_scoutdamagefactor
import g_scoutfirespeed
import g_scoutspeedfactor
import g_amguided
import g_amhoming
import g_ftguided
import g_fthoming
import g_ngguided
import g_nghoming
import g_bfgguided
import g_bfghoming
import g_pgguided
import g_pghoming
import g_rlguided
import g_rlhoming
import g_glguided
import g_glhoming
import g_amknockback
import g_ambouncemodifier
import g_aminf
import g_amvampire
import g_amgravity
import g_ambounce
import g_amtimeout
import g_amdamage
import g_amsdamage
import g_amspeed
import g_amsradius
import g_amdelay
import g_ftknockback
import g_ftbouncemodifier
import g_ftinf
import g_ftvampire
import g_ftgravity
import g_ftbounce
import g_fttimeout
import g_ftdamage
import g_ftsdamage
import g_ftspeed
import g_ftsradius
import g_ftdelay
import g_cgknockback
import g_cginf
import g_cgvampire
import g_cgspread
import g_cgdamage
import g_cgdelay
import g_plknockback
import g_plinf
import g_plvampire
import g_plgravity
import g_pldamage
import g_plsdamage
import g_plsradius
import g_pltimeout
import g_plspeed
import g_pldelay
import g_ngknockback
import g_ngbouncemodifier
import g_nginf
import g_ngvampire
import g_ngrandom
import g_nggravity
import g_ngbounce
import g_ngcount
import g_ngtimeout
import g_ngdamage
import g_ngspread
import g_ngspeed
import g_ngdelay
import g_bfgknockback
import g_bfgbouncemodifier
import g_bfginf
import g_bfgvampire
import g_bfggravity
import g_bfgbounce
import g_bfgdamage
import g_bfgsdamage
import g_bfgsradius
import g_bfgtimeout
import g_bfgspeed
import g_bfgdelay
import g_pgknockback
import g_pgbouncemodifier
import g_pginf
import g_pgvampire
import g_pggravity
import g_pgbounce
import g_pgtimeout
import g_pgdamage
import g_pgsdamage
import g_pgspeed
import g_pgsradius
import g_pgdelay
import g_rgknockback
import g_rginf
import g_rgvampire
import g_rgdamage
import g_rgdelay
import g_lgknockback
import g_lginf
import g_lgvampire
import g_lgsradius
import g_lgsdamage
import g_lgexplode
import g_lgrange
import g_lgdelay
import g_lgdamage
import g_rlknockback
import g_rlbouncemodifier
import g_rlinf
import g_rlvampire
import g_rlgravity
import g_rlbounce
import g_rldamage
import g_rlsdamage
import g_rlsradius
import g_rltimeout
import g_rlspeed
import g_rldelay
import g_glknockback
import g_glbouncemodifier
import g_glinf
import g_glvampire
import g_glgravity
import g_glbounce
import g_gldamage
import g_glsdamage
import g_glsradius
import g_gltimeout
import g_glspeed
import g_gldelay
import g_sgknockback
import g_sginf
import g_sgvampire
import g_sgcount
import g_sgsradius
import g_sgsdamage
import g_sgexplode
import g_sgspread
import g_sgdamage
import g_sgdelay
import g_mgknockback
import g_mginf
import g_mgvampire
import g_mgsradius
import g_mgsdamage
import g_mgexplode
import g_mgspread
import g_mgdamage
import g_mgdelay
import g_gknockback
import g_grange
import g_gdamage
import g_gdelay
import mod_ghtimeout
import g_ghtimeout
import g_ghspeed
import g_minigame
import g_physdamage
import g_physimpulse
import g_physimpact
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
import mod_gravity
import mod_zsround
import mod_zround
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_teamred_damage
import mod_teamblue_damage
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_noplayerclip
import mod_flighttime
import mod_regentime
import mod_invistime
import mod_hastetime
import mod_bsuittime
import mod_quadtime
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_poweruptime
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_vampire_max_health
import mod_amdelay
import mod_ftdelay
import mod_cgspread
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgrange
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgcount
import mod_sgspread
import mod_sgdelay
import mod_mgspread
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_ammolimit
import cmapname
import CustomModRun
import Newmodcommands
import nailgun_think
import bfg_think
import grenade_think
import rocket_think
import plasma_think
import G_SendSwepWeapons
import G_SendWeaponProperties
import g_entities
import level
import Team_ForceGesture
import Team_DD_bonusAtPoints
import Team_RemoveDoubleDominationPoints
import Team_SpawnDoubleDominationPoints
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import Team_Dom_SpawnPoints
import SelectDoubleDominationSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import G_LoadMapfileAll_f
import G_LoadMapfile_f
import G_LoadMapfileAll
import G_LoadMapfile
import G_WriteMapfileAll_f
import G_WriteMapfile_f
import G_ClassnameAllowedAll
import G_ClassnameAllowed
import G_GetMapLockArena
import SkippedChar
import G_LoadMapcycle
import G_sendMapcycle
import G_drawMapcycle
import G_drawAllowedMaps
import G_mapIsVoteable
import G_GetMapfile
import G_GetNextMap
import G_GetNextMapCycle
import G_GotoNextMapCycle
import getCustomVote
import VoteParseCustomVotes
import allowedFraglimit
import allowedTimelimit
import allowedGametype
import allowedMap
import getMappage
import custom_vote_info
import ClientLeaving
import CountVotes
import CheckVote
import allowedVote
import PlayerStore_restore
import PlayerStore_store
import PlayerStoreInit
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_SaveClientSessionDataSave
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_TeamFromString
import ShuffleTeams
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_DefaultSwep
import G_CheckSwepAmmo
import G_CheckSwep
import G_RunClient
import ClientEndFrame
import ClientThink
import PrecacheBotAssets
import SetCustomWeapons
import SetSandboxWeapons
import SetUnlimitedWeapons
import SetupCustomBot
import LinkBotSpawnEntity
import DropClientSilently
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_NpcFactionProp
import G_LevelLoadComplete
import CheckTeamVote
import LogExit
import G_Error
import G_Printf
import SendYourTeamMessageToTeam
import SendDominationPointsStatusMessageToAllClients
import SendDDtimetakenMessageToAllClients
import SendEliminationMessageToAllClients
import SendScoreboardMessageToAllClients
import G_LogPrintf
import ExitLevel
import AddTournamentQueue
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import SendCustomVoteCommands
import DominationPointStatusMessage
import DominationPointNamesMessage
import RespawnTimeMessage
import EliminationMessage
import ObeliskHealthMessage
import AttackingTeamMessage
import YourTeamMessage
import DoubleDominationScoreTimeMessage
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import G_StartCarExplode
import G_StartKamikaze
import KamikazeShockWave
import KamikazeRadiusDamage
import CarExplodeDamage
import KamikazeDamage
import FireWeapon
import ClientForString
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpawnPointIsActive
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import ClientRespawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import LMSpoint
import EndEliminationRound
import DisableWeapons
import EnableWeapons
import RespawnDead
import RespawnAll
import TeamHealthCount
import TeamLivingCount
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Laser_Think
import Laser_Gen
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import G_FindEntityForClientNum
import G_FindEntityForEntityNum
import G_ShowObjects
import G_HideObjects
import G_BounceProp
import G_RunProp
import G_ModProp
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import lock_touch
import trigger_teleporter_touch
import Break_Breakable
import Touch_DoorTrigger
import G_RunMover
import fire_antimatter
import fire_flame
import fire_prox
import fire_nail
import fire_nails
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_custom
import fire_blaster
import ProximityMine_RemoveAll
import G_RunMissile
import TossClientCubes
import TossClientPersistantPowerups
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_ExitVehicle
import G_CarDamage
import G_PropDamage
import G_Damage
import CanDamage
import target_finish_use
import target_finish_think
import BuildShaderStateConfig
import AddRemap
import G_SetTargetname
import G_SetTarget
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_GlobalSound
import G_Sound
import G_TempEntity
import G_Spawn
import findradius
import G_InitGentity
import CrosshairPointGravity
import CrosshairPointPhys
import FindEntityForGravitygun
import FindEntityForPhysgun
import VehiclePhys
import botsandbox_check
import G_CalculatePlayerScore
import G_FadeIn
import G_FadeOut
import G_Fade
import G_GetScoringMapName
import G_SetMovedir
import G_UseDeathTargets
import G_UseTargets
import G_PickTarget
import G_ScrFind
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import Throw_Item
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item2
import Touch_Item
import Set_Weapon
import Set_Ammo
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchBackpack
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItemCtf
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import writeFile_string
import writeFile_int
import readFile_string
import readFile_int
import SanitizeString
import G_ClientIsLagging
import G_ClientNumberFromString
import Cmd_AdminMessage_f
import G_FloodLimited
import G_ClientNumbersFromString
import G_SanitiseString
import G_MatchOnePlayer
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import NextCustomRound_f
import G_Say
import ConcatArgs
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector4
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import MiTechEntityList
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
LABELV $417
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $413
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $411
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $410
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $408
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $402
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $399
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $395
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $379
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 124
byte 1 45
byte 1 49
byte 1 62
byte 1 32
byte 1 60
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $375
byte 1 98
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $374
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 60
byte 1 105
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $333
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $332
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 61
byte 1 61
byte 1 44
byte 1 32
byte 1 33
byte 1 61
byte 1 44
byte 1 32
byte 1 60
byte 1 44
byte 1 32
byte 1 62
byte 1 44
byte 1 32
byte 1 60
byte 1 61
byte 1 44
byte 1 32
byte 1 62
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $331
byte 1 60
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $330
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 60
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 62
byte 1 32
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 105
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 32
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $326
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $325
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $321
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $318
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $317
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $314
byte 1 60
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $313
byte 1 60
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $312
byte 1 60
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 44
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 44
byte 1 10
byte 1 0
align 1
LABELV $311
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 60
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $307
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $306
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
LABELV $305
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
LABELV $304
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
LABELV $303
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
LABELV $300
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $299
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
LABELV $298
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
LABELV $297
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
LABELV $296
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
LABELV $293
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 54
byte 1 10
byte 1 0
align 1
LABELV $292
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
LABELV $291
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
LABELV $290
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
LABELV $289
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
LABELV $286
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $285
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
LABELV $284
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
LABELV $283
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
LABELV $282
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
LABELV $279
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $278
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
LABELV $277
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
LABELV $276
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
LABELV $275
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
LABELV $272
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $271
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
LABELV $270
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
LABELV $269
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
LABELV $268
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
LABELV $265
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $264
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
LABELV $263
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
LABELV $262
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
LABELV $261
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
LABELV $258
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 48
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $257
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
LABELV $256
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
LABELV $255
byte 1 115
byte 1 97
byte 1 118
byte 1 101
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
LABELV $254
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
LABELV $253
byte 1 115
byte 1 97
byte 1 118
byte 1 101
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
LABELV $252
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
LABELV $251
byte 1 115
byte 1 97
byte 1 118
byte 1 101
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
LABELV $250
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
LABELV $245
byte 1 60
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 49
byte 1 45
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $244
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $240
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 121
byte 1 115
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $230
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $227
byte 1 99
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $223
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $222
byte 1 60
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 40
byte 1 45
byte 1 49
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 60
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $202
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $199
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 97
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $195
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $194
byte 1 60
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $193
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $181
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $178
byte 1 60
byte 1 109
byte 1 97
byte 1 120
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 103
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 60
byte 1 109
byte 1 105
byte 1 110
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 103
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 60
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $175
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 105
byte 1 110
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 120
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $169
byte 1 47
byte 1 61
byte 1 0
align 1
LABELV $166
byte 1 42
byte 1 61
byte 1 0
align 1
LABELV $163
byte 1 45
byte 1 61
byte 1 0
align 1
LABELV $160
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $159
byte 1 43
byte 1 61
byte 1 0
align 1
LABELV $156
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 61
byte 1 44
byte 1 32
byte 1 43
byte 1 61
byte 1 44
byte 1 32
byte 1 45
byte 1 61
byte 1 44
byte 1 32
byte 1 42
byte 1 61
byte 1 44
byte 1 32
byte 1 47
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $155
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 111
byte 1 112
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 48
byte 1 49
byte 1 62
byte 1 32
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 48
byte 1 50
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $149
byte 1 62
byte 1 61
byte 1 0
align 1
LABELV $144
byte 1 60
byte 1 61
byte 1 0
align 1
LABELV $139
byte 1 62
byte 1 0
align 1
LABELV $134
byte 1 60
byte 1 0
align 1
LABELV $129
byte 1 33
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $124
byte 1 33
byte 1 61
byte 1 0
align 1
LABELV $119
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $114
byte 1 61
byte 1 0
align 1
LABELV $111
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 48
byte 1 50
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $110
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 61
byte 1 44
byte 1 32
byte 1 61
byte 1 61
byte 1 44
byte 1 32
byte 1 33
byte 1 61
byte 1 44
byte 1 32
byte 1 33
byte 1 61
byte 1 61
byte 1 44
byte 1 32
byte 1 60
byte 1 44
byte 1 32
byte 1 62
byte 1 44
byte 1 32
byte 1 60
byte 1 61
byte 1 44
byte 1 32
byte 1 62
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 48
byte 1 49
byte 1 62
byte 1 32
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $108
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 48
byte 1 49
byte 1 62
byte 1 32
byte 1 60
byte 1 115
byte 1 121
byte 1 109
byte 1 98
byte 1 111
byte 1 108
byte 1 62
byte 1 32
byte 1 60
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 48
byte 1 50
byte 1 62
byte 1 32
byte 1 60
byte 1 99
byte 1 109
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 60
byte 1 111
byte 1 108
byte 1 100
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 62
byte 1 32
byte 1 60
byte 1 110
byte 1 101
byte 1 119
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $97
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 53
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $92
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 40
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 41
byte 1 58
byte 1 32
byte 1 94
byte 1 53
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $91
byte 1 91
byte 1 37
byte 1 99
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $90
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $87
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 60
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 62
byte 1 32
byte 1 60
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $83
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $82
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 37
byte 1 45
byte 1 56
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $80
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $79
byte 1 37
byte 1 45
byte 1 50
byte 1 49
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $78
byte 1 67
byte 1 78
byte 1 67
byte 1 84
byte 1 32
byte 1 0
align 1
LABELV $75
byte 1 37
byte 1 45
byte 1 53
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $74
byte 1 37
byte 1 45
byte 1 52
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $66
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $65
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
