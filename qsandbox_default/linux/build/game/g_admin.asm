data
export g_admin_cmds
align 4
LABELV g_admin_cmds
address $64
address G_admin_adjustban
address $65
address $66
address $67
address $68
address G_admin_admintest
address $69
address $70
address $71
address $72
address G_admin_allready
address $73
address $74
address $71
address $75
address G_admin_ban
address $65
address $76
address $77
address $78
address G_admin_cancelvote
address $79
address $80
address $71
address $81
address G_admin_disorient
address $82
address $83
address $84
address $85
address G_admin_help
address $86
address $87
address $88
address $89
address G_admin_kick
address $90
address $91
address $92
address $93
address G_admin_listadmins
address $94
address $95
address $96
address $97
address G_admin_listplayers
address $98
address $99
address $71
address $100
address G_admin_lock
address $101
address $102
address $103
address $104
address G_admin_map
address $105
address $106
address $107
address $108
address G_admin_mute
address $109
address $110
address $111
address $112
address G_admin_namelog
address $113
address $114
address $115
address $116
address G_admin_nextmap
address $117
address $118
address $71
address $119
address G_admin_orient
address $82
address $120
address $111
address $121
address G_admin_passvote
address $122
address $123
address $71
address $124
address G_admin_putteam
address $125
address $126
address $127
address $128
address G_admin_readconfig
address $129
address $130
address $71
address $131
address G_admin_rename
address $132
address $133
address $134
address $135
address G_admin_restart
address $136
address $137
address $71
address $138
address G_admin_setlevel
address $139
address $140
address $141
address $142
address G_admin_showbans
address $143
address $144
address $145
address $146
address G_admin_shuffle
address $147
address $148
skip 4
address $149
address G_admin_slap
address $150
address $151
address $152
address $153
address G_admin_spec999
address $154
address $155
address $71
address $156
address G_admin_time
address $157
address $158
address $71
address $159
address G_admin_unban
address $65
address $160
address $161
address $162
address G_admin_unlock
address $101
address $163
address $103
address $164
address G_admin_mute
address $109
address $165
address $111
address $166
address G_admin_warn
address $167
address $168
address $169
align 4
LABELV adminNumCmds
byte 4 31
align 4
LABELV admin_level_maxname
byte 4 0
export G_admin_permission
code
proc G_admin_permission 28 8
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
file "../../../code/game/g_admin.c"
line 229
;1:/*
;2:===========================================================================
;3:Copyright (C) 2004-2006 Tony J. White
;4:
;5:This file is part of the Open Arena source code.
;6:
;7:Originally copied from Tremulous under GPL version 2 including any later version.
;8:
;9:Several modifications, additions, and deletions were made by developers of the
;10:Open Arena source code.  
;11:
;12:This shrubbot implementation is the original work of Tony J. White.
;13:
;14:Contains contributions from Wesley van Beelen, Chris Bajumpaa, Josh Menke,
;15:and Travis Maurer.
;16:
;17:The functionality of this code mimics the behaviour of the currently
;18:inactive project shrubet (http://www.etstats.com/shrubet/index.php?ver=2)
;19:by Ryan Mannion.   However, shrubet was a closed-source project and
;20:none of it's code has been copied, only it's functionality.
;21:
;22:Open Arena Source code is free software; you can redistribute it
;23:and/or modify it under the terms of the GNU General Public License as
;24:published by the Free Software Foundation; either version 2 of the License,
;25:or (at your option) any later version.
;26:
;27:Open Arena Source code is distributed in the hope that it will be
;28:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;29:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;30:GNU General Public License for more details.
;31:
;32:You should have received a copy of the GNU General Public License
;33:along with Open Arena Source code; if not, write to the Free Software
;34:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;35:===========================================================================
;36:*/
;37:/* KK-OAX TODO
;38:1. Clean up the default admin levels to include the commands which I have added
;39:3. Implement Disorientation in Code
;40:4. DEBUG, DEBUG, DEBUG
;41:*/
;42:
;43:#include "g_local.h"
;44:
;45:// big ugly global buffer for use with buffered printing of long outputs
;46:static char g_bfb[ 32000 ];
;47:
;48:// note: list ordered alphabetically
;49:g_admin_cmd_t g_admin_cmds[ ] =
;50:  {
;51:    {"adjustban", G_admin_adjustban, "b",
;52:      "change the duration or reason of a ban.  duration is specified as "
;53:      "numbers followed by units 'w' (weeks), 'd' (days), 'h' (hours) or "
;54:      "'m' (minutes), or seconds if no units are specified.  if the duration is"
;55:      " preceded by a + or -, the ban duration will be extended or shortened by"
;56:      " the specified amount",
;57:      "[^3ban#^7] (^5duration^7) (^5reason^7)"
;58:    },
;59:
;60:    {"admintest", G_admin_admintest, "a",
;61:      "display your current admin level",
;62:      ""
;63:    },
;64:
;65:    {"allready", G_admin_allready, "y",
;66:      "makes everyone ready in intermission",
;67:      ""
;68:    },
;69:
;70:    {"ban", G_admin_ban, "b",
;71:      "ban a player by IP and GUID with an optional expiration time and reason."
;72:      " duration is specified as numbers followed by units 'w' (weeks), 'd' "
;73:      "(days), 'h' (hours) or 'm' (minutes), or seconds if no units are "
;74:      "specified",
;75:      "[^3name|slot#|IP^7] (^5duration^7) (^5reason^7)"
;76:    },
;77:
;78:    {"cancelvote", G_admin_cancelvote, "c",
;79:      "cancel a vote taking place",
;80:      ""
;81:    },
;82:    //KK-OAX
;83:    {"disorient",	G_admin_disorient,	"d",
;84:		"disorient a player by flipping player's view and controls",
;85:		"[^3name|slot#^7] (^hreason^7)"
;86:	},
;87:    //{"fling", G_admin_fling, "d",
;88:    //  "throws the player specified",
;89:    //  "[^3name|slot#^7]"
;90:    //},
;91:    
;92:    {"help", G_admin_help, "h",
;93:      "display commands available to you or help on a specific command",
;94:      "(^5command^7)"
;95:    },
;96:
;97:    {"kick", G_admin_kick, "k",
;98:      "kick a player with an optional reason",
;99:      "[^3name|slot#^7] (^5reason^7)"
;100:    },
;101:    
;102:    {"listadmins", G_admin_listadmins, "D",
;103:      "display a list of all server admins and their levels",
;104:      "(^5name|start admin#^7)"
;105:    },
;106:
;107:    {"listplayers", G_admin_listplayers, "i",
;108:      "display a list of players, their client numbers and their levels",
;109:      ""
;110:    },
;111:
;112:    {"lock", G_admin_lock, "K",
;113:      "lock a team to prevent anyone from joining it",
;114:      "[^3a|h^7]"
;115:    },
;116:    //KK-OAX
;117:    {"map", G_admin_map, "M",
;118:      "load a map",
;119:      "[^3mapname^7]"
;120:    },
;121:
;122:    {"mute", G_admin_mute, "m",
;123:      "mute a player",
;124:      "[^3name|slot#^7]"
;125:    },
;126:
;127:    {"namelog", G_admin_namelog, "e",
;128:      "display a list of names used by recently connected players",
;129:      "(^5name^7)"
;130:    },
;131:
;132:    {"nextmap", G_admin_nextmap, "n",
;133:      "go to the next map in the cycle",
;134:      ""
;135:    },
;136:    //KK-OAX
;137:    {"orient",	G_admin_orient,	"d",
;138:		"orient a player after a !disorient", "[^3name|slot#^7]"
;139:	},
;140:	
;141:    {"passvote", G_admin_passvote, "V",
;142:      "pass a vote currently taking place",
;143:      ""
;144:    },
;145:
;146:    {"putteam", G_admin_putteam, "p",
;147:      "move a player to a specified team",
;148:      "[^3name|slot#^7] [^3h|a|s^7]"
;149:    },
;150:
;151:    {"readconfig", G_admin_readconfig, "G",
;152:      "reloads the admin config file and refreshes permission flags",
;153:      ""
;154:    },
;155:
;156:    {"rename", G_admin_rename, "N",
;157:      "rename a player",
;158:      "[^3name|slot#^7] [^3new name^7]"
;159:    },
;160:
;161:    {"restart", G_admin_restart, "r",
;162:      "restart the current map (optionally using named layout)",
;163:      ""
;164:    },
;165:
;166:    {"setlevel", G_admin_setlevel, "s",
;167:      "sets the admin level of a player",
;168:      "[^3name|slot#|admin#^7] [^3level^7]"
;169:    },
;170:
;171:    {"showbans", G_admin_showbans, "B",
;172:      "display a (partial) list of active bans",
;173:      "(^5start at ban#^7) (^5name|IP^7)"
;174:    },
;175:    //KK-OAX
;176:    {"shuffle", G_admin_shuffle, "f",
;177:        "Shuffles the teams"
;178:        ""
;179:    },
;180:    
;181:    {"slap", G_admin_slap, "S",
;182:        "Reduces the health of the selected player by the damage specified",
;183:        "[^3name|slot#] [damage] [reason]"
;184:    },
;185:
;186:    {"spec999", G_admin_spec999, "P",
;187:      "move 999 pingers to the spectator team",
;188:      ""},
;189:
;190:    {"time", G_admin_time, "C",
;191:      "show the current local server time",
;192:      ""},
;193:
;194:    {"unban", G_admin_unban, "b",
;195:      "unbans a player specified by the slot as seen in showbans",
;196:      "[^3ban#^7]"
;197:    },
;198:
;199:    {"unlock", G_admin_unlock, "K",
;200:      "unlock a locked team",
;201:      "[^3a|h^7]"
;202:    },
;203:
;204:    {"unmute", G_admin_mute, "m",
;205:      "unmute a muted player",
;206:      "[^3name|slot#^7]"
;207:    },
;208:
;209://KK-OAX   
;210:    {"warn", G_admin_warn, "w",
;211:      "warn a player",
;212:      "[^3name|slot#^7] [reason]"
;213:    }
;214:    
;215:  };
;216:
;217:static int adminNumCmds = sizeof( g_admin_cmds ) / sizeof( g_admin_cmds[ 0 ] );
;218:
;219:static int admin_level_maxname = 0;
;220:g_admin_level_t *g_admin_levels[ MAX_ADMIN_LEVELS ];
;221:g_admin_admin_t *g_admin_admins[ MAX_ADMIN_ADMINS ];
;222:g_admin_ban_t *g_admin_bans[ MAX_ADMIN_BANS ];
;223:g_admin_command_t *g_admin_commands[ MAX_ADMIN_COMMANDS ];
;224:g_admin_namelog_t *g_admin_namelog[ MAX_ADMIN_NAMELOGS ];
;225://KK-OAX Load us up some warnings here....
;226:g_admin_warning_t *g_admin_warnings[ MAX_ADMIN_WARNINGS ];
;227:    
;228:qboolean G_admin_permission( gentity_t *ent, char flag )
;229:{
line 231
;230:  int i;
;231:  int l = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 235
;232:  char *flags;
;233:
;234:  // console always wins
;235:  if( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
line 236
;236:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
LABELV $171
line 238
;237:
;238:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $173
line 239
;239:  {
line 240
;240:    if( !Q_stricmp( ent->client->pers.guid, g_admin_admins[ i ]->guid ) )
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $177
line 241
;241:    {
line 242
;242:      flags = g_admin_admins[ i ]->flags;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRGP4 $180
JUMPV
LABELV $179
line 244
;243:      while( *flags )
;244:      {
line 245
;245:        if( *flags == flag )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $182
line 246
;246:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
LABELV $182
line 247
;247:        else if( *flags == '-' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $184
line 248
;248:        {
ADDRGP4 $187
JUMPV
LABELV $186
line 250
;249:          while( *flags++ )
;250:          {
line 251
;251:            if( *flags == flag )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $189
line 252
;252:              return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $189
line 253
;253:            if( *flags == '+' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $191
line 254
;254:              break;
ADDRGP4 $185
JUMPV
LABELV $191
line 255
;255:          }
LABELV $187
line 249
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $186
line 256
;256:        }
ADDRGP4 $185
JUMPV
LABELV $184
line 257
;257:        else if( *flags == '*' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $193
line 258
;258:        {
ADDRGP4 $196
JUMPV
LABELV $195
line 260
;259:          while( *flags++ )
;260:          {
line 261
;261:            if( *flags == flag )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $198
line 262
;262:              return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $198
line 263
;263:          }
LABELV $196
line 259
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $195
line 267
;264:          // flags with significance only for individuals (
;265:          // like ADMF_INCOGNITO and ADMF_IMMUTABLE are NOT covered
;266:          // by the '*' wildcard.  They must be specified manually.
;267:          return ( flag != ADMF_INCOGNITO && flag != ADMF_IMMUTABLE );
ADDRLP4 24
ADDRFP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 64
EQI4 $201
ADDRLP4 24
INDIRI4
CNSTI4 33
EQI4 $201
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $201
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $202
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $170
JUMPV
LABELV $193
LABELV $185
line 269
;268:        }
;269:        flags++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 270
;270:      }
LABELV $180
line 243
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $179
line 271
;271:      l = g_admin_admins[ i ]->level;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 272
;272:    }
LABELV $177
line 273
;273:  }
LABELV $174
line 238
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
ADDRLP4 4
INDIRI4
CNSTI4 1024
GEI4 $203
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
LABELV $203
line 274
;274:  for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $204
line 275
;275:  {
line 276
;276:    if( g_admin_levels[ i ]->level == l )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $208
line 277
;277:    {
line 278
;278:      flags = g_admin_levels[ i ]->flags;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $210
line 280
;279:      while( *flags )
;280:      {
line 281
;281:        if( *flags == flag )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $213
line 282
;282:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
LABELV $213
line 283
;283:        if( *flags == '*' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $215
line 284
;284:        {
ADDRGP4 $218
JUMPV
LABELV $217
line 286
;285:          while( *flags++ )
;286:          {
line 287
;287:            if( *flags == flag )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $220
line 288
;288:              return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $220
line 289
;289:          }
LABELV $218
line 285
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $217
line 293
;290:          // flags with significance only for individuals (
;291:          // like ADMF_INCOGNITO and ADMF_IMMUTABLE are NOT covered
;292:          // by the '*' wildcard.  They must be specified manually.
;293:          return ( flag != ADMF_INCOGNITO && flag != ADMF_IMMUTABLE );
ADDRLP4 24
ADDRFP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 64
EQI4 $223
ADDRLP4 24
INDIRI4
CNSTI4 33
EQI4 $223
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $223
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $224
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $170
JUMPV
LABELV $215
line 295
;294:        }
;295:        flags++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 296
;296:      }
LABELV $211
line 279
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $210
line 297
;297:    }
LABELV $208
line 298
;298:  }
LABELV $205
line 274
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $207
ADDRLP4 4
INDIRI4
CNSTI4 32
GEI4 $225
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $204
LABELV $225
line 299
;299:  return qfalse;
CNSTI4 0
RETI4
LABELV $170
endproc G_admin_permission 28 8
lit
align 1
LABELV $227
byte 1 0
skip 31
align 1
LABELV $228
byte 1 0
skip 31
export G_admin_name_check
code
proc G_admin_name_check 84 16
line 303
;300:}
;301:
;302:qboolean G_admin_name_check( gentity_t *ent, char *name, char *err, int len )
;303:{
line 306
;304:  int i;
;305:  gclient_t *client;
;306:  char testName[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 4
ADDRGP4 $227
INDIRB
ASGNB 32
line 307
;307:  char name2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 40
ADDRGP4 $228
INDIRB
ASGNB 32
line 309
;308:
;309:  G_SanitiseString( name, name2, sizeof( name2 ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 311
;310:
;311:  if( !Q_stricmp( name2, "UnnamedPlayer" ) )
ADDRLP4 40
ARGP4
ADDRGP4 $231
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $229
line 312
;312:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $226
JUMPV
LABELV $229
line 314
;313:
;314:  for( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $232
line 315
;315:  {
line 316
;316:    client = &level.clients[ i ];
ADDRLP4 36
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 317
;317:    if( client->pers.connected == CON_DISCONNECTED )
ADDRLP4 36
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $237
line 318
;318:      continue;
ADDRGP4 $233
JUMPV
LABELV $237
line 321
;319:
;320:    // can rename ones self to the same name using different colors
;321:    if( i == ( ent - g_entities ) )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
NEI4 $239
line 322
;322:      continue;
ADDRGP4 $233
JUMPV
LABELV $239
line 324
;323:
;324:    G_SanitiseString( client->pers.netname, testName, sizeof( testName ) );
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 325
;325:    if( !Q_stricmp( name2, testName ) )
ADDRLP4 40
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $241
line 326
;326:    {
line 327
;327:      Com_sprintf( err, len, "The name '%s^7' is already in use", name );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 328
;328:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $226
JUMPV
LABELV $241
line 330
;329:    }
;330:  }
LABELV $233
line 314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $235
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $232
line 332
;331:
;332:  if( !g_adminNameProtect.integer )
ADDRGP4 g_adminNameProtect+12
INDIRI4
CNSTI4 0
NEI4 $244
line 333
;333:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $226
JUMPV
LABELV $244
line 335
;334:
;335:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 336
;336:  {
line 337
;337:    if( g_admin_admins[ i ]->level < 1 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
GEI4 $251
line 338
;338:      continue;
ADDRGP4 $248
JUMPV
LABELV $251
line 339
;339:    G_SanitiseString( g_admin_admins[ i ]->name, testName, sizeof( testName ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 340
;340:    if( !Q_stricmp( name2, testName ) &&
ADDRLP4 40
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $253
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $253
line 342
;341:      Q_stricmp( ent->client->pers.guid, g_admin_admins[ i ]->guid ) )
;342:    {
line 343
;343:      Com_sprintf( err, len, "The name '%s^7' belongs to an admin, "
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 $255
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 345
;344:        "please use another name", name );
;345:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $226
JUMPV
LABELV $253
line 347
;346:    }
;347:  }
LABELV $248
line 335
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $247
LABELV $256
line 348
;348:  return qtrue;
CNSTI4 1
RETI4
LABELV $226
endproc G_admin_name_check 84 16
proc admin_higher_guid 28 8
line 352
;349:}
;350:
;351:static qboolean admin_higher_guid( char *admin_guid, char *victim_guid )
;352:{
line 354
;353:  int i;
;354:  int alevel = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 356
;355:
;356:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $258
line 357
;357:  {
line 358
;358:    if( !Q_stricmp( admin_guid, g_admin_admins[ i ]->guid ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $262
line 359
;359:    {
line 360
;360:      alevel = g_admin_admins[ i ]->level;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 361
;361:      break;
ADDRGP4 $260
JUMPV
LABELV $262
line 363
;362:    }
;363:  }
LABELV $259
line 356
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $261
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $258
LABELV $264
LABELV $260
line 364
;364:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $265
line 365
;365:  {
line 366
;366:    if( !Q_stricmp( victim_guid, g_admin_admins[ i ]->guid ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $269
line 367
;367:    {
line 368
;368:      if( alevel < g_admin_admins[ i ]->level )
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
GEI4 $271
line 369
;369:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $257
JUMPV
LABELV $271
line 370
;370:      return !strstr( g_admin_admins[ i ]->flags, va( "%c", ADMF_IMMUTABLE ) );
ADDRGP4 $273
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $275
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $275
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $276
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $257
JUMPV
LABELV $269
line 372
;371:    }
;372:  }
LABELV $266
line 364
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $268
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $265
LABELV $277
line 373
;373:  return qtrue;
CNSTI4 1
RETI4
LABELV $257
endproc admin_higher_guid 28 8
proc admin_higher 12 8
line 377
;374:}
;375:
;376:static qboolean admin_higher( gentity_t *admin, gentity_t *victim )
;377:{
line 380
;378:
;379:  // console always wins
;380:  if( !admin )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 381
;381:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $278
JUMPV
LABELV $279
line 383
;382:  // just in case
;383:  if( !victim )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $281
line 384
;384:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $278
JUMPV
LABELV $281
line 386
;385:
;386:  return admin_higher_guid( admin->client->pers.guid,
ADDRLP4 0
CNSTI4 556
ASGNI4
ADDRLP4 4
CNSTI4 920
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 admin_higher_guid
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $278
endproc admin_higher 12 8
lit
align 1
LABELV $284
byte 1 0
skip 1023
code
proc admin_writeconfig 1072 12
line 395
;387:    victim->client->pers.guid );
;388:}
;389:
;390://KK-OAX Moved the Read/Write int/String functions to g_fileops.c for portability
;391://across GAME
;392:
;393://KK-OAX Added Warnings
;394:static void admin_writeconfig( void )
;395:{
line 399
;396:  fileHandle_t f;
;397:  int len, i, j;
;398:  int t;
;399:  char levels[ MAX_STRING_CHARS ] = {""};
ADDRLP4 12
ADDRGP4 $284
INDIRB
ASGNB 1024
line 401
;400:
;401:  if( !g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $285
line 402
;402:  {
line 403
;403:    G_Printf( S_COLOR_YELLOW "WARNING: g_admin is not set. "
ADDRGP4 $288
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 405
;404:      " configuration will not be saved to a file.\n" );
;405:    return;
ADDRGP4 $283
JUMPV
LABELV $285
line 407
;406:  }
;407:  t = trap_RealTime( NULL );
CNSTP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1044
INDIRI4
ASGNI4
line 408
;408:  len = trap_FS_FOpenFile( g_admin.string, &f, FS_WRITE );
ADDRGP4 g_admin+16
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
line 409
;409:  if( len < 0 )
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $290
line 410
;410:  {
line 411
;411:    G_Printf( "admin_writeconfig: could not open g_admin file \"%s\"\n",
ADDRGP4 $292
ARGP4
ADDRGP4 g_admin+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 413
;412:              g_admin.string );
;413:    return;
ADDRGP4 $283
JUMPV
LABELV $290
line 415
;414:  }
;415:  for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $294
line 416
;416:  {
line 417
;417:    trap_FS_Write( "[level]\n", 8, f );
ADDRGP4 $298
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 418
;418:    trap_FS_Write( "level   = ", 10, f );
ADDRGP4 $299
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 419
;419:    writeFile_int( g_admin_levels[ i ]->level, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_int
CALLV
pop
line 420
;420:    trap_FS_Write( "name    = ", 10, f );
ADDRGP4 $300
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 421
;421:    writeFile_string( g_admin_levels[ i ]->name, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 422
;422:    trap_FS_Write( "flags   = ", 10, f );
ADDRGP4 $301
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 423
;423:    writeFile_string( g_admin_levels[ i ]->flags, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 424
;424:    trap_FS_Write( "\n", 1, f );
ADDRGP4 $302
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 425
;425:  }
LABELV $295
line 415
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $303
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $294
LABELV $303
line 426
;426:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 427
;427:  {
line 429
;428:    // don't write level 0 users
;429:    if( g_admin_admins[ i ]->level == 0 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $308
line 430
;430:      continue;
ADDRGP4 $305
JUMPV
LABELV $308
line 432
;431:
;432:    trap_FS_Write( "[admin]\n", 8, f );
ADDRGP4 $310
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 433
;433:    trap_FS_Write( "name    = ", 10, f );
ADDRGP4 $300
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 434
;434:    writeFile_string( g_admin_admins[ i ]->name, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 435
;435:    trap_FS_Write( "guid    = ", 10, f );
ADDRGP4 $311
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 436
;436:    writeFile_string( g_admin_admins[ i ]->guid, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 437
;437:    trap_FS_Write( "level   = ", 10, f );
ADDRGP4 $299
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 438
;438:    writeFile_int( g_admin_admins[ i ]->level, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_int
CALLV
pop
line 439
;439:    trap_FS_Write( "flags   = ", 10, f );
ADDRGP4 $301
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 440
;440:    writeFile_string( g_admin_admins[ i ]->flags, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 441
;441:    trap_FS_Write( "\n", 1, f );
ADDRGP4 $302
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 442
;442:  }
LABELV $305
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $312
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $304
LABELV $312
line 443
;443:  for( i = 0; i < MAX_ADMIN_BANS && g_admin_bans[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 444
;444:  {
line 447
;445:    // don't write expired bans
;446:    // if expires is 0, then it's a perm ban
;447:    if( g_admin_bans[ i ]->expires != 0 &&
ADDRLP4 1060
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $317
ADDRLP4 1060
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
CNSTI4 1
GEI4 $317
line 449
;448:      ( g_admin_bans[ i ]->expires - t ) < 1 )
;449:      continue;
ADDRGP4 $314
JUMPV
LABELV $317
line 451
;450:
;451:    trap_FS_Write( "[ban]\n", 6, f );
ADDRGP4 $319
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 452
;452:    trap_FS_Write( "name    = ", 10, f );
ADDRGP4 $300
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 453
;453:    writeFile_string( g_admin_bans[ i ]->name, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 454
;454:    trap_FS_Write( "guid    = ", 10, f );
ADDRGP4 $311
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 455
;455:    writeFile_string( g_admin_bans[ i ]->guid, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 456
;456:    trap_FS_Write( "ip      = ", 10, f );
ADDRGP4 $320
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 457
;457:    writeFile_string( g_admin_bans[ i ]->ip, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 458
;458:    trap_FS_Write( "reason  = ", 10, f );
ADDRGP4 $321
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 459
;459:    writeFile_string( g_admin_bans[ i ]->reason, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 460
;460:    trap_FS_Write( "made    = ", 10, f );
ADDRGP4 $322
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 461
;461:    writeFile_string( g_admin_bans[ i ]->made, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 155
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 462
;462:    trap_FS_Write( "expires = ", 10, f );
ADDRGP4 $323
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 463
;463:    writeFile_int( g_admin_bans[ i ]->expires, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_int
CALLV
pop
line 464
;464:    trap_FS_Write( "banner  = ", 10, f );
ADDRGP4 $324
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 465
;465:    writeFile_string( g_admin_bans[ i ]->banner, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 466
;466:    trap_FS_Write( "\n", 1, f );
ADDRGP4 $302
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 467
;467:  }
LABELV $314
line 443
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $325
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $313
LABELV $325
line 468
;468:  for( i = 0; i < MAX_ADMIN_COMMANDS && g_admin_commands[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $326
line 469
;469:  {
line 470
;470:    levels[ 0 ] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 471
;471:    trap_FS_Write( "[command]\n", 10, f );
ADDRGP4 $330
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 472
;472:    trap_FS_Write( "command = ", 10, f );
ADDRGP4 $331
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 473
;473:    writeFile_string( g_admin_commands[ i ]->command, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 474
;474:    trap_FS_Write( "exec    = ", 10, f );
ADDRGP4 $332
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 475
;475:    writeFile_string( g_admin_commands[ i ]->exec, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 476
;476:    trap_FS_Write( "desc    = ", 10, f );
ADDRGP4 $333
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 477
;477:    writeFile_string( g_admin_commands[ i ]->desc, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 478
;478:    trap_FS_Write( "levels  = ", 10, f );
ADDRGP4 $334
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 479
;479:    for( j = 0; g_admin_commands[ i ]->levels[ j ] != -1; j++ )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $335
line 480
;480:    {
line 481
;481:      Q_strcat( levels, sizeof( levels ),
ADDRGP4 $339
ARGP4
ADDRLP4 1064
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1064
INDIRI4
LSHI4
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 483
;482:                va( "%i ", g_admin_commands[ i ]->levels[ j ] ) );
;483:    }
LABELV $336
line 479
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $338
ADDRLP4 1064
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1064
INDIRI4
LSHI4
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $335
line 484
;484:    writeFile_string( levels, f );
ADDRLP4 12
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 485
;485:    trap_FS_Write( "\n", 1, f );
ADDRGP4 $302
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 486
;486:  }  
LABELV $327
line 468
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $329
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $326
LABELV $340
line 487
;487:  for( i = 0; i < MAX_ADMIN_WARNINGS && g_admin_warnings[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $341
line 488
;488:  {
line 492
;489:    // don't write expired warnings
;490:    // if expires is 0, then it's a perm warning
;491:    // it will get loaded everytime they connect!!!!
;492:    if( g_admin_warnings[ i ]->expires != 0 &&
ADDRLP4 1068
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $345
ADDRLP4 1068
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
CNSTI4 1
GEI4 $345
line 494
;493:      ( g_admin_warnings[ i ]->expires - t ) < 1 )
;494:      continue;
ADDRGP4 $342
JUMPV
LABELV $345
line 496
;495:
;496:    trap_FS_Write( "[warning]\n", 10, f );
ADDRGP4 $347
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 497
;497:    trap_FS_Write( "name    = ", 10, f );
ADDRGP4 $300
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 498
;498:    writeFile_string( g_admin_warnings[ i ]->name, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 499
;499:    trap_FS_Write( "guid    = ", 10, f );
ADDRGP4 $311
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 500
;500:    writeFile_string( g_admin_warnings[ i ]->guid, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 501
;501:    trap_FS_Write( "ip      = ", 10, f );
ADDRGP4 $320
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 502
;502:    writeFile_string( g_admin_warnings[ i ]->ip, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 503
;503:    trap_FS_Write( "warning = ", 10, f );
ADDRGP4 $348
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 504
;504:    writeFile_string( g_admin_warnings[ i ]->warning, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 505
;505:    trap_FS_Write( "made    = ", 10, f );
ADDRGP4 $322
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 506
;506:    writeFile_string( g_admin_warnings[ i ]->made, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 1129
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 507
;507:    trap_FS_Write( "expires = ", 10, f );
ADDRGP4 $323
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 508
;508:    writeFile_int( g_admin_warnings[ i ]->expires, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_int
CALLV
pop
line 509
;509:    trap_FS_Write( "warner  = ", 10, f );
ADDRGP4 $349
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 510
;510:    writeFile_string( g_admin_warnings[ i ]->warner, f );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 1147
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 writeFile_string
CALLV
pop
line 511
;511:    trap_FS_Write( "\n", 1, f );
ADDRGP4 $302
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 512
;512:  }
LABELV $342
line 487
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $344
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $350
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $341
LABELV $350
line 513
;513:  trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 514
;514:}
LABELV $283
endproc admin_writeconfig 1072 12
proc admin_default_levels 16 12
line 521
;515:
;516:
;517:// if we can't parse any levels from readconfig, set up default
;518:// ones to make new installs easier for admins
;519://KK-OAX TODO: Add all features to default levels...
;520:static void admin_default_levels( void )
;521:{
line 525
;522:  g_admin_level_t *l;
;523:  int i;
;524:
;525:  for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $352
line 526
;526:  {
line 527
;527:    BG_Free( g_admin_levels[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 528
;528:    g_admin_levels[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
CNSTP4 0
ASGNP4
line 529
;529:  }
LABELV $353
line 525
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $355
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $356
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $352
LABELV $356
line 530
;530:  for( i = 0; i <= 5; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $357
line 531
;531:  {
line 532
;532:    l = BG_Alloc( sizeof( g_admin_level_t ) );
CNSTU4 100
ARGU4
ADDRLP4 12
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 533
;533:    l->level = i;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 534
;534:    *l->name = '\0';
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI1 0
ASGNI1
line 535
;535:    *l->flags = '\0';
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
CNSTI1 0
ASGNI1
line 536
;536:    g_admin_levels[ i ] = l;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 537
;537:  }
LABELV $358
line 530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $357
line 538
;538:  Q_strncpyz( g_admin_levels[ 0 ]->name, "^4Unknown Player",
ADDRGP4 g_admin_levels
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $361
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 540
;539:    sizeof( l->name ) );
;540:  Q_strncpyz( g_admin_levels[ 0 ]->flags, "ahC", sizeof( l->flags ) );
ADDRGP4 g_admin_levels
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $362
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 542
;541:
;542:  Q_strncpyz( g_admin_levels[ 1 ]->name, "^5Server Regular",
ADDRGP4 g_admin_levels+4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $364
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 544
;543:    sizeof( l->name ) );
;544:  Q_strncpyz( g_admin_levels[ 1 ]->flags, "iahC", sizeof( l->flags ) );
ADDRGP4 g_admin_levels+4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $366
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 546
;545:
;546:  Q_strncpyz( g_admin_levels[ 2 ]->name, "^6Team Manager",
ADDRGP4 g_admin_levels+8
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $368
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 548
;547:    sizeof( l->name ) );
;548:  Q_strncpyz( g_admin_levels[ 2 ]->flags, "iahCpPwr", sizeof( l->flags ) );
ADDRGP4 g_admin_levels+8
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $370
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 550
;549:
;550:  Q_strncpyz( g_admin_levels[ 3 ]->name, "^2Junior Admin",
ADDRGP4 g_admin_levels+12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $372
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 552
;551:    sizeof( l->name ) );
;552:  Q_strncpyz( g_admin_levels[ 3 ]->flags, "iahCpPwrkmfKncN?", sizeof( l->flags ) );
ADDRGP4 g_admin_levels+12
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $374
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 554
;553:
;554:  Q_strncpyz( g_admin_levels[ 4 ]->name, "^3Senior Admin",
ADDRGP4 g_admin_levels+16
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $376
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 556
;555:    sizeof( l->name ) );
;556:  Q_strncpyz( g_admin_levels[ 4 ]->flags, "iahCpPwrkmfKncN?MVdBbeDS51", sizeof( l->flags ) );
ADDRGP4 g_admin_levels+16
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $378
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 558
;557:
;558:  Q_strncpyz( g_admin_levels[ 5 ]->name, "^1Server Operator",
ADDRGP4 g_admin_levels+20
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $380
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 560
;559:    sizeof( l->name ) );
;560:  Q_strncpyz( g_admin_levels[ 5 ]->flags, "*", sizeof( l->flags ) );
ADDRGP4 g_admin_levels+20
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $382
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 561
;561:  admin_level_maxname = 15;
ADDRGP4 admin_level_maxname
CNSTI4 15
ASGNI4
line 562
;562:}
LABELV $351
endproc admin_default_levels 16 12
export G_admin_level
proc G_admin_level 8 8
line 566
;563:
;564://  return a level for a player entity.
;565:int G_admin_level( gentity_t *ent )
;566:{
line 569
;567:  int i;
;568:
;569:  if( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $384
line 570
;570:  {
line 571
;571:    return MAX_ADMIN_LEVELS;
CNSTI4 32
RETI4
ADDRGP4 $383
JUMPV
LABELV $384
line 574
;572:  }
;573:
;574:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $389
JUMPV
LABELV $386
line 575
;575:  {
line 576
;576:    if( !Q_stricmp( g_admin_admins[ i ]->guid, ent->client->pers.guid ) )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $390
line 577
;577:      return g_admin_admins[ i ]->level;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
RETI4
ADDRGP4 $383
JUMPV
LABELV $390
line 578
;578:  }
LABELV $387
line 574
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $389
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $392
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $386
LABELV $392
line 580
;579:
;580:  return 0;
CNSTI4 0
RETI4
LABELV $383
endproc G_admin_level 8 8
proc admin_command_permission 20 8
line 584
;581:}
;582:
;583:static qboolean admin_command_permission( gentity_t *ent, char *command )
;584:{
line 588
;585:  int i, j;
;586:  int level;
;587:
;588:  if( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $394
line 589
;589:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $393
JUMPV
LABELV $394
line 590
;590:  level = ent->client->pers.adminLevel;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ASGNI4
line 591
;591:  for( i = 0; i < MAX_ADMIN_COMMANDS && g_admin_commands[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $399
JUMPV
LABELV $396
line 592
;592:  {
line 593
;593:    if( !Q_stricmp( command, g_admin_commands[ i ]->command ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $400
line 594
;594:    {
line 595
;595:      for( j = 0; g_admin_commands[ i ]->levels[ j ] != -1; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $402
line 596
;596:      {
line 597
;597:        if( g_admin_commands[ i ]->levels[ j ] == level )
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $406
line 598
;598:        {
line 599
;599:          return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $393
JUMPV
LABELV $406
line 601
;600:        }
;601:      }
LABELV $403
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $405
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $402
line 602
;602:    }
LABELV $400
line 603
;603:  }
LABELV $397
line 591
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $399
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $408
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $396
LABELV $408
line 604
;604:  return qfalse;
CNSTI4 0
RETI4
LABELV $393
endproc admin_command_permission 20 8
proc admin_log 2280 56
line 608
;605:}
;606:
;607:static void admin_log( gentity_t *admin, char *cmd, int skiparg )
;608:{
line 616
;609:  fileHandle_t f;
;610:  int len, i, j;
;611:  char string[ MAX_STRING_CHARS ];
;612:  int min, tens, sec;
;613:  g_admin_admin_t *a;
;614:  g_admin_level_t *l;
;615:  char flags[ MAX_ADMIN_FLAGS * 2 ];
;616:  gentity_t *victim = NULL;
ADDRLP4 1172
CNSTP4 0
ASGNP4
line 620
;617:  int pids[ MAX_CLIENTS ];
;618:  char name[ MAX_NAME_LENGTH ];
;619:
;620:  if( !g_adminLog.string[ 0 ] )
ADDRGP4 g_adminLog+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $410
line 621
;621:    return;
ADDRGP4 $409
JUMPV
LABELV $410
line 624
;622:
;623:
;624:  len = trap_FS_FOpenFile( g_adminLog.string, &f, FS_APPEND );
ADDRGP4 g_adminLog+16
ARGP4
ADDRLP4 1176
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 2248
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1188
ADDRLP4 2248
INDIRI4
ASGNI4
line 625
;625:  if( len < 0 )
ADDRLP4 1188
INDIRI4
CNSTI4 0
GEI4 $414
line 626
;626:  {
line 627
;627:    G_Printf( "admin_log: error could not open %s\n", g_adminLog.string );
ADDRGP4 $416
ARGP4
ADDRGP4 g_adminLog+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 628
;628:    return;
ADDRGP4 $409
JUMPV
LABELV $414
line 631
;629:  }
;630:
;631:  sec = level.time / 1000;
ADDRLP4 144
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 632
;632:  min = sec / 60;
ADDRLP4 1180
ADDRLP4 144
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 633
;633:  sec -= min * 60;
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 60
ADDRLP4 1180
INDIRI4
MULI4
SUBI4
ASGNI4
line 634
;634:  tens = sec / 10;
ADDRLP4 1184
ADDRLP4 144
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 635
;635:  sec -= tens * 10;
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 10
ADDRLP4 1184
INDIRI4
MULI4
SUBI4
ASGNI4
line 637
;636:
;637:  *flags = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 638
;638:  if( admin )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $419
line 639
;639:  {
line 640
;640:    for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $421
line 641
;641:    {
line 642
;642:      if( !Q_stricmp( g_admin_admins[ i ]->guid , admin->client->pers.guid ) )
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 2252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2252
INDIRI4
CNSTI4 0
NEI4 $425
line 643
;643:      {
line 645
;644:
;645:        a = g_admin_admins[ i ];
ADDRLP4 132
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ASGNP4
line 646
;646:        Q_strncpyz( flags, a->flags, sizeof( flags ) );
ADDRLP4 4
ARGP4
ADDRLP4 132
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 647
;647:        for( j = 0; j < MAX_ADMIN_LEVELS && g_admin_levels[ j ]; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $427
line 648
;648:        {
line 649
;649:          if( g_admin_levels[ j ]->level == a->level )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 132
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $431
line 650
;650:          {
line 651
;651:            l = g_admin_levels[ j ];
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
ASGNP4
line 652
;652:            Q_strcat( flags, sizeof( flags ), l->flags );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 136
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 653
;653:            break;
ADDRGP4 $423
JUMPV
LABELV $431
line 655
;654:          }
;655:        }
LABELV $428
line 647
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $430
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $433
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $427
LABELV $433
line 656
;656:        break;
ADDRGP4 $423
JUMPV
LABELV $425
line 658
;657:      }
;658:    }
LABELV $422
line 640
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $424
ADDRLP4 140
INDIRI4
CNSTI4 1024
GEI4 $434
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
LABELV $434
LABELV $423
line 659
;659:  }
LABELV $419
line 661
;660:
;661:  if( G_SayArgc() > 1 + skiparg )
ADDRLP4 2252
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2252
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
LEI4 $435
line 662
;662:  {
line 663
;663:    G_SayArgv( 1 + skiparg, name, sizeof( name ) );
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1192
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 664
;664:    if( G_ClientNumbersFromString( name, pids, MAX_CLIENTS ) == 1 )
ADDRLP4 1192
ARGP4
ADDRLP4 1224
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2256
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 1
NEI4 $437
line 665
;665:    {
line 666
;666:      victim = &g_entities[ pids[ 0 ] ];
ADDRLP4 1172
CNSTI4 2492
ADDRLP4 1224
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 667
;667:    }
LABELV $437
line 668
;668:  }
LABELV $435
line 670
;669:
;670:  if( victim && Q_stricmp( cmd, "attempted" ) )
ADDRLP4 1172
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $439
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 2256
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 0
EQI4 $439
line 671
;671:  {
line 672
;672:    Com_sprintf( string, sizeof( string ),
ADDRFP4 8
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 2272
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $442
ARGP4
ADDRLP4 1180
INDIRI4
ARGI4
ADDRLP4 1184
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
ADDRLP4 2260
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 2260
CNSTI4 -1
ASGNI4
LABELV $449
ADDRLP4 2260
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $450
ADDRLP4 2264
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRGP4 $451
JUMPV
LABELV $450
ADDRLP4 2264
ADDRGP4 $444
ASGNP4
LABELV $451
ADDRLP4 2264
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $452
ADDRLP4 2268
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $453
JUMPV
LABELV $452
ADDRLP4 2268
ADDRGP4 $446
ASGNP4
LABELV $453
ADDRLP4 2268
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2276
ADDRLP4 1172
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2276
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 2276
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2272
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 686
;673:                 "%3i:%i%i: %i: %s: %s: %s: %s: %s: %s: \"%s\"\n",
;674:                 min,
;675:                 tens,
;676:                 sec,
;677:                 ( admin ) ? admin->s.clientNum : -1,
;678:                 ( admin ) ? admin->client->pers.guid
;679:                 : "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
;680:                 ( admin ) ? admin->client->pers.netname : "console",
;681:                 flags,
;682:                 cmd,
;683:                 victim->client->pers.guid,
;684:                 victim->client->pers.netname,
;685:                 G_SayConcatArgs( 2 + skiparg ) );
;686:  }
ADDRGP4 $440
JUMPV
LABELV $439
line 688
;687:  else
;688:  {
line 689
;689:    Com_sprintf( string, sizeof( string ),
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2272
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $454
ARGP4
ADDRLP4 1180
INDIRI4
ARGI4
ADDRLP4 1184
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $458
ADDRLP4 2260
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $459
JUMPV
LABELV $458
ADDRLP4 2260
CNSTI4 -1
ASGNI4
LABELV $459
ADDRLP4 2260
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $460
ADDRLP4 2264
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRGP4 $461
JUMPV
LABELV $460
ADDRLP4 2264
ADDRGP4 $444
ASGNP4
LABELV $461
ADDRLP4 2264
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
ADDRLP4 2268
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $463
JUMPV
LABELV $462
ADDRLP4 2268
ADDRGP4 $446
ASGNP4
LABELV $463
ADDRLP4 2268
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2272
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 701
;690:                 "%3i:%i%i: %i: %s: %s: %s: %s: \"%s\"\n",
;691:                 min,
;692:                 tens,
;693:                 sec,
;694:                 ( admin ) ? admin->s.clientNum : -1,
;695:                 ( admin ) ? admin->client->pers.guid
;696:                 : "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
;697:                 ( admin ) ? admin->client->pers.netname : "console",
;698:                 flags,
;699:                 cmd,
;700:                 G_SayConcatArgs( 1 + skiparg ) );
;701:  }
LABELV $440
line 702
;702:  trap_FS_Write( string, strlen( string ), f );
ADDRLP4 148
ARGP4
ADDRLP4 2260
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 148
ARGP4
ADDRLP4 2260
INDIRI4
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 703
;703:  trap_FS_FCloseFile( f );
ADDRLP4 1176
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 704
;704:}
LABELV $409
endproc admin_log 2280 56
lit
align 1
LABELV $465
byte 1 0
skip 31
align 1
LABELV $466
byte 1 0
skip 31
align 1
LABELV $467
byte 1 0
skip 31
code
proc admin_listadmins 164 24
line 707
;705:
;706:static int admin_listadmins( gentity_t *ent, int start, char *search )
;707:{
line 708
;708:  int drawn = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
line 710
;709:  char guid_stub[9];
;710:  char name[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 92
ADDRGP4 $465
INDIRB
ASGNB 32
line 711
;711:  char name2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 53
ADDRGP4 $466
INDIRB
ASGNB 32
line 712
;712:  char lname[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 12
ADDRGP4 $467
INDIRB
ASGNB 32
line 715
;713:  int i, j;
;714:  gentity_t *vic;
;715:  int l = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 716
;716:  qboolean dup = qfalse;
ADDRLP4 124
CNSTI4 0
ASGNI4
line 718
;717:
;718:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 721
;719:
;720:  // print out all connected players regardless of level if name searching
;721:  for( i = 0; i < level.maxclients && search[ 0 ]; i++ )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $468
line 722
;722:  {
line 723
;723:    vic = &g_entities[ i ];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 725
;724:
;725:    if( !vic->client || vic->client->pers.connected != CON_CONNECTED )
ADDRLP4 132
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $475
ADDRLP4 132
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $473
LABELV $475
line 726
;726:      continue;
ADDRGP4 $469
JUMPV
LABELV $473
line 728
;727:
;728:    l = vic->client->pers.adminLevel;
ADDRLP4 88
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ASGNI4
line 730
;729:
;730:    G_SanitiseString( vic->client->pers.netname, name, sizeof( name ) );
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 731
;731:    if( !strstr( name, search ) )
ADDRLP4 92
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $476
line 732
;732:      continue;
ADDRGP4 $469
JUMPV
LABELV $476
line 734
;733:
;734:    for( j = 0; j < 8; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $478
line 735
;735:      guid_stub[ j ] = vic->client->pers.guid[ j + 24 ];
ADDRLP4 0
INDIRI4
ADDRLP4 44
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $479
line 734
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $478
line 736
;736:    guid_stub[ j ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 44
ADDP4
CNSTI1 0
ASGNI1
line 738
;737:
;738:    lname[ 0 ] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 739
;739:    for( j = 0; j < MAX_ADMIN_LEVELS && g_admin_levels[ j ]; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $485
JUMPV
LABELV $482
line 740
;740:    {
line 741
;741:      if( g_admin_levels[ j ]->level == l )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $486
line 742
;742:      {
line 745
;743:        int k, colorlen;
;744:
;745:        for( colorlen = k = 0; g_admin_levels[ j ]->name[ k ]; k++ )
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 144
ADDRLP4 152
INDIRI4
ASGNI4
ADDRLP4 148
ADDRLP4 152
INDIRI4
ASGNI4
ADDRGP4 $491
JUMPV
LABELV $488
line 746
;746:          if( Q_IsColorString( &g_admin_levels[ j ]->name[ k ] ) )
ADDRLP4 156
ADDRLP4 144
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $492
ADDRLP4 156
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $492
ADDRLP4 160
ADDRLP4 156
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $492
ADDRLP4 160
INDIRI4
CNSTI4 48
LTI4 $492
ADDRLP4 160
INDIRI4
CNSTI4 57
GTI4 $492
line 747
;747:            colorlen += 2;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $492
LABELV $489
line 745
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $491
ADDRLP4 144
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $488
line 748
;748:        Com_sprintf( lname, sizeof( lname ), "%*s",
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $494
ARGP4
ADDRGP4 admin_level_maxname
INDIRI4
ADDRLP4 148
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 751
;749:                     admin_level_maxname + colorlen,
;750:                     g_admin_levels[ j ]->name );
;751:        break;
ADDRGP4 $484
JUMPV
LABELV $486
line 753
;752:      }
;753:    }
LABELV $483
line 739
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $485
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $495
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $482
LABELV $495
LABELV $484
line 754
;754:    ADMBP( va( "%4i %4i %s^7 (*%s) %s^7\n",
ADDRGP4 $496
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 760
;755:      i,
;756:      l,
;757:      lname,
;758:      guid_stub,
;759:      vic->client->pers.netname ) );
;760:    drawn++;
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 761
;761:  }
LABELV $469
line 721
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $471
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
GEI4 $497
ADDRFP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $468
LABELV $497
line 763
;762:
;763:  for( i = start; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ] &&
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $501
JUMPV
LABELV $498
line 765
;764:    drawn < MAX_ADMIN_LISTITEMS; i++ )
;765:  {
line 766
;766:    if( search[ 0 ] )
ADDRFP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $502
line 767
;767:    {
line 768
;768:      G_SanitiseString( g_admin_admins[ i ]->name, name, sizeof( name ) );
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 769
;769:      if( !strstr( name, search ) )
ADDRLP4 92
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $504
line 770
;770:        continue;
ADDRGP4 $499
JUMPV
LABELV $504
line 774
;771:
;772:      // verify we don't have the same guid/name pair in connected players
;773:      // since we don't want to draw the same player twice
;774:      dup = qfalse;
ADDRLP4 124
CNSTI4 0
ASGNI4
line 775
;775:      for( j = 0; j < level.maxclients; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $509
JUMPV
LABELV $506
line 776
;776:      {
line 777
;777:        vic = &g_entities[ j ];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 778
;778:        if( !vic->client || vic->client->pers.connected != CON_CONNECTED )
ADDRLP4 136
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $513
ADDRLP4 136
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $511
LABELV $513
line 779
;779:          continue;
ADDRGP4 $507
JUMPV
LABELV $511
line 780
;780:        G_SanitiseString( vic->client->pers.netname, name2, sizeof( name2 ) );
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 53
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 781
;781:        if( !Q_stricmp( vic->client->pers.guid, g_admin_admins[ i ]->guid ) &&
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $514
ADDRLP4 53
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $514
line 783
;782:          strstr( name2, search ) )
;783:        {
line 784
;784:          dup = qtrue;
ADDRLP4 124
CNSTI4 1
ASGNI4
line 785
;785:          break;
ADDRGP4 $508
JUMPV
LABELV $514
line 787
;786:        }
;787:      }
LABELV $507
line 775
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $509
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $506
LABELV $508
line 788
;788:      if( dup )
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $516
line 789
;789:        continue;
ADDRGP4 $499
JUMPV
LABELV $516
line 790
;790:    }
LABELV $502
line 791
;791:    for( j = 0; j < 8; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $518
line 792
;792:      guid_stub[ j ] = g_admin_admins[ i ]->guid[ j + 24 ];
ADDRLP4 0
INDIRI4
ADDRLP4 44
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ADDP4
INDIRI1
ASGNI1
LABELV $519
line 791
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $518
line 793
;793:    guid_stub[ j ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 44
ADDP4
CNSTI1 0
ASGNI1
line 795
;794:
;795:    lname[ 0 ] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 796
;796:    for( j = 0; j < MAX_ADMIN_LEVELS && g_admin_levels[ j ]; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $525
JUMPV
LABELV $522
line 797
;797:    {
line 798
;798:      if( g_admin_levels[ j ]->level == g_admin_admins[ i ]->level )
ADDRLP4 136
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $526
line 799
;799:      {
line 802
;800:        int k, colorlen;
;801:
;802:        for( colorlen = k = 0; g_admin_levels[ j ]->name[ k ]; k++ )
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 144
ADDRLP4 148
INDIRI4
ASGNI4
ADDRGP4 $531
JUMPV
LABELV $528
line 803
;803:          if( Q_IsColorString( &g_admin_levels[ j ]->name[ k ] ) )
ADDRLP4 152
ADDRLP4 140
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $532
ADDRLP4 152
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $532
ADDRLP4 156
ADDRLP4 152
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $532
ADDRLP4 156
INDIRI4
CNSTI4 48
LTI4 $532
ADDRLP4 156
INDIRI4
CNSTI4 57
GTI4 $532
line 804
;804:            colorlen += 2;
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $532
LABELV $529
line 802
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $531
ADDRLP4 140
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $528
line 805
;805:        Com_sprintf( lname, sizeof( lname ), "%*s",
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $494
ARGP4
ADDRGP4 admin_level_maxname
INDIRI4
ADDRLP4 144
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 808
;806:                     admin_level_maxname + colorlen,
;807:                     g_admin_levels[ j ]->name );
;808:        break;
ADDRGP4 $524
JUMPV
LABELV $526
line 810
;809:      }
;810:    }
LABELV $523
line 796
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $525
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $534
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $522
LABELV $534
LABELV $524
line 811
;811:    ADMBP( va( "%4i %4i %s^7 (*%s) %s^7\n",
ADDRGP4 $496
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 256
ADDI4
ARGI4
ADDRLP4 144
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 817
;812:      ( i + MAX_CLIENTS ),
;813:      g_admin_admins[ i ]->level,
;814:      lname,
;815:      guid_stub,
;816:      g_admin_admins[ i ]->name ) );
;817:    drawn++;
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 818
;818:  }
LABELV $499
line 764
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $501
line 763
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $536
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $536
ADDRLP4 128
INDIRI4
CNSTI4 20
LTI4 $498
LABELV $536
line 819
;819:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 820
;820:  return drawn;
ADDRLP4 128
INDIRI4
RETI4
LABELV $464
endproc admin_listadmins 164 24
export G_admin_duration
proc G_admin_duration 4 16
line 824
;821:}
;822:
;823:void G_admin_duration( int secs, char *duration, int dursize )
;824:{
line 826
;825:
;826:  if( secs > ( 60 * 60 * 24 * 365 * 50 ) || secs < 0 )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1576800000
GTI4 $540
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $538
LABELV $540
line 827
;827:    Q_strncpyz( duration, "PERMANENT", dursize );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $541
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $539
JUMPV
LABELV $538
line 828
;828:  else if( secs >= ( 60 * 60 * 24 * 365 ) )
ADDRFP4 0
INDIRI4
CNSTI4 31536000
LTI4 $542
line 829
;829:    Com_sprintf( duration, dursize, "%1.1f years",
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $544
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1274059200
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $543
JUMPV
LABELV $542
line 831
;830:      ( secs / ( 60 * 60 * 24 * 365.0f ) ) );
;831:  else if( secs >= ( 60 * 60 * 24 * 90 ) )
ADDRFP4 0
INDIRI4
CNSTI4 7776000
LTI4 $545
line 832
;832:    Com_sprintf( duration, dursize, "%1.1f weeks",
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $547
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1226024960
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $546
JUMPV
LABELV $545
line 834
;833:      ( secs / ( 60 * 60 * 24 * 7.0f ) ) );
;834:  else if( secs >= ( 60 * 60 * 24 ) )
ADDRFP4 0
INDIRI4
CNSTI4 86400
LTI4 $548
line 835
;835:    Com_sprintf( duration, dursize, "%1.1f days",
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $550
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1202241536
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $549
JUMPV
LABELV $548
line 837
;836:      ( secs / ( 60 * 60 * 24.0f ) ) );
;837:  else if( secs >= ( 60 * 60 ) )
ADDRFP4 0
INDIRI4
CNSTI4 3600
LTI4 $551
line 838
;838:    Com_sprintf( duration, dursize, "%1.1f hours",
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $553
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1163984896
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $552
JUMPV
LABELV $551
line 840
;839:      ( secs / ( 60 * 60.0f ) ) );
;840:  else if( secs >= 60 )
ADDRFP4 0
INDIRI4
CNSTI4 60
LTI4 $554
line 841
;841:    Com_sprintf( duration, dursize, "%1.1f minutes",
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $556
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1114636288
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $555
JUMPV
LABELV $554
line 844
;842:      ( secs / 60.0f ) );
;843:  else
;844:    Com_sprintf( duration, dursize, "%i seconds", secs );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $557
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $555
LABELV $552
LABELV $549
LABELV $546
LABELV $543
LABELV $539
line 845
;845:}
LABELV $537
endproc G_admin_duration 4 16
export G_admin_ban_check
proc G_admin_ban_check 80 24
line 848
;846:
;847:qboolean G_admin_ban_check( char *userinfo, char *reason, int rlen )
;848:{
line 853
;849:  char *guid, *ip;
;850:  int i;
;851:  int t;
;852:
;853:  *reason = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 854
;854:  t = trap_RealTime( NULL );
CNSTP4 0
ARGP4
ADDRLP4 16
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 855
;855:  if( !*userinfo )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $559
line 856
;856:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $558
JUMPV
LABELV $559
line 857
;857:  ip = Info_ValueForKey( userinfo, "ip" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $561
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 858
;858:  if( !*ip )
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $562
line 859
;859:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $558
JUMPV
LABELV $562
line 860
;860:  guid = Info_ValueForKey( userinfo, "cl_guid" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $564
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 861
;861:  for( i = 0; i < MAX_ADMIN_BANS && g_admin_bans[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $568
JUMPV
LABELV $565
line 862
;862:  {
line 864
;863:    // 0 is for perm ban
;864:    if( g_admin_bans[ i ]->expires != 0 &&
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $569
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
GEI4 $569
line 866
;865:         ( g_admin_bans[ i ]->expires - t ) < 1 )
;866:      continue;
ADDRGP4 $566
JUMPV
LABELV $569
line 867
;867:    if( strstr( ip, g_admin_bans[ i ]->ip ) )
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $571
line 868
;868:    {
line 870
;869:      char duration[ 32 ];
;870:      G_admin_duration( ( g_admin_bans[ i ]->expires - t ),
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 872
;871:        duration, sizeof( duration ) );
;872:      Com_sprintf(
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $573
ARGP4
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 880
;873:        reason,
;874:        rlen,
;875:        "You have been banned by %s^7 reason: %s^7 expires: %s",
;876:        g_admin_bans[ i ]->banner,
;877:        g_admin_bans[ i ]->reason,
;878:        duration
;879:      );
;880:      G_Printf( "Banned player tried to connect from IP %s\n", ip );
ADDRGP4 $574
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 881
;881:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $571
line 883
;882:    }
;883:    if( *guid && !Q_stricmp( g_admin_bans[ i ]->guid, guid ) )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $575
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $575
line 884
;884:    {
line 886
;885:      char duration[ 32 ];
;886:      G_admin_duration( ( g_admin_bans[ i ]->expires - t ),
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 888
;887:        duration, sizeof( duration ) );
;888:      Com_sprintf(
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $573
ARGP4
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 896
;889:        reason,
;890:        rlen,
;891:        "You have been banned by %s^7 reason: %s^7 expires: %s",
;892:        g_admin_bans[ i ]->banner,
;893:        g_admin_bans[ i ]->reason,
;894:        duration
;895:      );
;896:      G_Printf( "Banned player tried to connect with GUID %s\n", guid );
ADDRGP4 $577
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 897
;897:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $575
line 899
;898:    }
;899:  }
LABELV $566
line 861
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $568
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $578
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $565
LABELV $578
line 900
;900:  return qfalse;
CNSTI4 0
RETI4
LABELV $558
endproc G_admin_ban_check 80 24
export G_admin_cmd_check
proc G_admin_cmd_check 60 12
line 904
;901:}
;902:
;903:qboolean G_admin_cmd_check( gentity_t *ent, qboolean say )
;904:{
line 908
;905:  int i;
;906:  char command[ MAX_ADMIN_CMD_LEN ];
;907:  char *cmd;
;908:  int skip = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 910
;909:
;910:  command[ 0 ] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 911
;911:  G_SayArgv( 0, command, sizeof( command ) );
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 912
;912:  if( !command[ 0 ] )
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $580
line 913
;913:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $579
JUMPV
LABELV $580
line 914
;914:  if( !Q_stricmp( command, "say" ) ||
ADDRLP4 12
ARGP4
ADDRGP4 $584
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $586
ADDRLP4 12
ARGP4
ADDRGP4 $585
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $582
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 57
ARGI4
ADDRLP4 40
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $582
LABELV $586
line 917
;915:    ( !Q_stricmp( command, "say_team" ) &&
;916:      G_admin_permission( ent, ADMF_TEAMCHAT_CMD ) ) )
;917:  {
line 918
;918:    skip = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 919
;919:    G_SayArgv( 1, command, sizeof( command ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 920
;920:  }
LABELV $582
line 922
;921:
;922:  if( command[ 0 ] == '!' )
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $587
line 923
;923:  {
line 924
;924:    cmd = &command[ 1 ];
ADDRLP4 4
ADDRLP4 12+1
ASGNP4
line 925
;925:  }
ADDRGP4 $588
JUMPV
LABELV $587
line 927
;926:  else
;927:  {
line 928
;928:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $579
JUMPV
LABELV $588
line 931
;929:  }
;930:
;931:  for( i = 0; i < MAX_ADMIN_COMMANDS && g_admin_commands[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $593
JUMPV
LABELV $590
line 932
;932:  {
line 933
;933:    if( Q_stricmp( cmd, g_admin_commands[ i ]->command ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $594
line 934
;934:      continue;
ADDRGP4 $591
JUMPV
LABELV $594
line 936
;935:
;936:    if( admin_command_permission( ent, cmd ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 admin_command_permission
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $596
line 937
;937:    {
line 939
;938:      // flooding say will have already been accounted for in ClientCommand
;939:      if( !say && G_FloodLimited( ent ) )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $598
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_FloodLimited
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $598
line 940
;940:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $579
JUMPV
LABELV $598
line 941
;941:      trap_SendConsoleCommand( EXEC_APPEND, g_admin_commands[ i ]->exec );
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 942
;942:      admin_log( ent, cmd, skip );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 943
;943:    }
ADDRGP4 $597
JUMPV
LABELV $596
line 945
;944:    else
;945:    {
line 946
;946:      ADMP( va( "^3!%s: ^7permission denied\n", g_admin_commands[ i ]->command ) );
ADDRGP4 $600
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 947
;947:      admin_log( ent, "attempted", skip - 1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 948
;948:    }
LABELV $597
line 949
;949:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $579
JUMPV
LABELV $591
line 931
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $593
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $601
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $590
LABELV $601
line 952
;950:  }
;951:
;952:  for( i = 0; i < adminNumCmds; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $605
JUMPV
LABELV $602
line 953
;953:  {
line 954
;954:    if( Q_stricmp( cmd, g_admin_cmds[ i ].keyword ) )
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $606
line 955
;955:      continue;
ADDRGP4 $603
JUMPV
LABELV $606
line 957
;956:
;957:    if( G_admin_permission( ent, g_admin_cmds[ i ].flag[ 0 ] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 52
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $608
line 958
;958:    {
line 960
;959:      // flooding say will have already been accounted for in ClientCommand
;960:      if( !say && G_FloodLimited( ent ) )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $611
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 G_FloodLimited
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $611
line 961
;961:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $579
JUMPV
LABELV $611
line 962
;962:      g_admin_cmds[ i ].handler( ent, skip );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+4
ADDP4
INDIRP4
CALLI4
pop
line 963
;963:      admin_log( ent, cmd, skip );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 964
;964:    }
ADDRGP4 $609
JUMPV
LABELV $608
line 966
;965:    else
;966:    {
line 967
;967:      ADMP( va( "^3!%s: ^7permission denied\n", g_admin_cmds[ i ].keyword ) );
ADDRGP4 $600
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 968
;968:      admin_log( ent, "attempted", skip - 1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 969
;969:    }
LABELV $609
line 970
;970:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $579
JUMPV
LABELV $603
line 952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $605
ADDRLP4 0
INDIRI4
ADDRGP4 adminNumCmds
INDIRI4
LTI4 $602
line 972
;971:  }
;972:  return qfalse;
CNSTI4 0
RETI4
LABELV $579
endproc G_admin_cmd_check 60 12
export G_admin_namelog_cleanup
proc G_admin_namelog_cleanup 8 4
line 976
;973:}
;974:
;975:void G_admin_namelog_cleanup( )
;976:{
line 979
;977:  int i;
;978:
;979:  for( i = 0; i < MAX_ADMIN_NAMELOGS && g_admin_namelog[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $618
JUMPV
LABELV $615
line 980
;980:  {
line 981
;981:    BG_Free( g_admin_namelog[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 982
;982:    g_admin_namelog[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
CNSTP4 0
ASGNP4
line 983
;983:  }
LABELV $616
line 979
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $618
ADDRLP4 0
INDIRI4
CNSTI4 128
GEI4 $619
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $615
LABELV $619
line 984
;984:}
LABELV $614
endproc G_admin_namelog_cleanup 8 4
export G_admin_namelog_update
proc G_admin_namelog_update 104 12
line 987
;985:
;986:void G_admin_namelog_update( gclient_t *client, qboolean disconnect )
;987:{
line 992
;988:  int i, j;
;989:  g_admin_namelog_t *namelog;
;990:  char n1[ MAX_NAME_LENGTH ];
;991:  char n2[ MAX_NAME_LENGTH ];
;992:  int clientNum = ( client - level.clients );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ASGNI4
line 994
;993:
;994:  G_SanitiseString( client->pers.netname, n1, sizeof( n1 ) );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 995
;995:  for( i = 0; i < MAX_ADMIN_NAMELOGS && g_admin_namelog[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $624
JUMPV
LABELV $621
line 996
;996:  {
line 997
;997:    if( disconnect && g_admin_namelog[ i ]->slot != clientNum )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $625
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $625
line 998
;998:      continue;
ADDRGP4 $622
JUMPV
LABELV $625
line 1000
;999:
;1000:    if( !disconnect && !( g_admin_namelog[ i ]->slot == clientNum ||
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $627
ADDRLP4 80
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $627
ADDRLP4 80
INDIRI4
CNSTI4 -1
EQI4 $627
line 1002
;1001:                          g_admin_namelog[ i ]->slot == -1 ) )
;1002:    {
line 1003
;1003:      continue;
ADDRGP4 $622
JUMPV
LABELV $627
line 1006
;1004:    }
;1005:
;1006:    if( !Q_stricmp( client->pers.ip, g_admin_namelog[ i ]->ip ) &&
ADDRFP4 0
INDIRP4
CNSTI4 953
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $629
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $629
line 1008
;1007:      !Q_stricmp( client->pers.guid, g_admin_namelog[ i ]->guid ) )
;1008:    {
line 1009
;1009:      for( j = 0; j < MAX_ADMIN_NAMELOG_NAMES &&
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $634
JUMPV
LABELV $631
line 1011
;1010:         g_admin_namelog[ i ]->name[ j ][ 0 ]; j++ )
;1011:      {
line 1012
;1012:        G_SanitiseString( g_admin_namelog[ i ]->name[ j ], n2, sizeof( n2 ) );
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1013
;1013:        if( !Q_stricmp( n1, n2 ) )
ADDRLP4 40
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $635
line 1014
;1014:          break;
ADDRGP4 $633
JUMPV
LABELV $635
line 1015
;1015:      }
LABELV $632
line 1010
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $634
line 1009
ADDRLP4 96
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $637
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $631
LABELV $637
LABELV $633
line 1016
;1016:      if( j == MAX_ADMIN_NAMELOG_NAMES )
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $638
line 1017
;1017:        j = MAX_ADMIN_NAMELOG_NAMES - 1;
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $638
line 1018
;1018:      Q_strncpyz( g_admin_namelog[ i ]->name[ j ], client->pers.netname,
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1020
;1019:        sizeof( g_admin_namelog[ i ]->name[ j ] ) );
;1020:      g_admin_namelog[ i ]->slot = ( disconnect ) ? -1 : clientNum;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $641
ADDRLP4 100
CNSTI4 -1
ASGNI4
ADDRGP4 $642
JUMPV
LABELV $641
ADDRLP4 100
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $642
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1023
;1021:
;1022:      // if this player is connecting, they are no longer banned
;1023:      if( !disconnect )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $620
line 1024
;1024:        g_admin_namelog[ i ]->banned = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 240
ADDP4
CNSTI4 0
ASGNI4
line 1026
;1025:
;1026:      return;
ADDRGP4 $620
JUMPV
LABELV $629
line 1028
;1027:    }
;1028:  }
LABELV $622
line 995
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $624
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $645
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $621
LABELV $645
line 1029
;1029:  if( i >= MAX_ADMIN_NAMELOGS )
ADDRLP4 4
INDIRI4
CNSTI4 128
LTI4 $646
line 1030
;1030:  {
line 1031
;1031:    G_Printf( "G_admin_namelog_update: warning, g_admin_namelogs overflow\n" );
ADDRGP4 $648
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1032
;1032:    return;
ADDRGP4 $620
JUMPV
LABELV $646
line 1034
;1033:  }
;1034:  namelog = BG_Alloc( sizeof( g_admin_namelog_t ) );
CNSTU4 244
ARGU4
ADDRLP4 84
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 76
ADDRLP4 84
INDIRP4
ASGNP4
line 1035
;1035:  memset( namelog, 0, sizeof( namelog ) );
ADDRLP4 76
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1036
;1036:  for( j = 0; j < MAX_ADMIN_NAMELOG_NAMES; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $649
line 1037
;1037:    namelog->name[ j ][ 0 ] = '\0';
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $650
line 1036
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $649
line 1038
;1038:  Q_strncpyz( namelog->ip, client->pers.ip, sizeof( namelog->ip ) );
ADDRLP4 76
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 953
ADDP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1039
;1039:  Q_strncpyz( namelog->guid, client->pers.guid, sizeof( namelog->guid ) );
ADDRLP4 76
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1040
;1040:  Q_strncpyz( namelog->name[ 0 ], client->pers.netname,
ADDRLP4 76
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1042
;1041:    sizeof( namelog->name[ 0 ] ) );
;1042:  namelog->slot = ( disconnect ) ? -1 : clientNum;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $654
ADDRLP4 88
CNSTI4 -1
ASGNI4
ADDRGP4 $655
JUMPV
LABELV $654
ADDRLP4 88
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $655
ADDRLP4 76
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 1043
;1043:  g_admin_namelog[ i ] = namelog;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
ADDRLP4 76
INDIRP4
ASGNP4
line 1044
;1044:}
LABELV $620
endproc G_admin_namelog_update 104 12
lit
align 1
LABELV $756
byte 1 0
skip 1023
export G_admin_readconfig
code
proc G_admin_readconfig 1184 24
line 1048
;1045:
;1046://KK-OAX Added Parsing Warnings
;1047:qboolean G_admin_readconfig( gentity_t *ent, int skiparg )
;1048:{
line 1049
;1049:  g_admin_level_t *l = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 1050
;1050:  g_admin_admin_t *a = NULL;
ADDRLP4 48
CNSTP4 0
ASGNP4
line 1051
;1051:  g_admin_ban_t *b = NULL;
ADDRLP4 56
CNSTP4 0
ASGNP4
line 1052
;1052:  g_admin_command_t *c = NULL;
ADDRLP4 68
CNSTP4 0
ASGNP4
line 1053
;1053:  g_admin_warning_t *w = NULL;
ADDRLP4 80
CNSTP4 0
ASGNP4
line 1054
;1054:  int lc = 0, ac = 0, bc = 0, cc = 0, wc = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 72
CNSTI4 0
ASGNI4
line 1062
;1055:  fileHandle_t f;
;1056:  int len;
;1057:  char *cnf, *cnf2;
;1058:  char *t;
;1059:  qboolean level_open, admin_open, ban_open, command_open, warning_open;
;1060:  int i;
;1061:
;1062:  G_admin_cleanup();
ADDRGP4 G_admin_cleanup
CALLV
pop
line 1064
;1063:
;1064:  if( !g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $657
line 1065
;1065:  {
line 1066
;1066:    ADMP( "^3!readconfig: g_admin is not set, not loading configuration "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $660
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1068
;1067:      "from a file\n" );
;1068:    admin_default_levels();
ADDRGP4 admin_default_levels
CALLV
pop
line 1069
;1069:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $657
line 1072
;1070:  }
;1071:
;1072:  len = trap_FS_FOpenFile( g_admin.string, &f, FS_READ );
ADDRGP4 g_admin+16
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
ASGNI4
line 1073
;1073:  if( len < 0 )
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $662
line 1074
;1074:  {
line 1075
;1075:    G_Printf( "^3!readconfig: ^7could not open admin config file %s\n",
ADDRGP4 $664
ARGP4
ADDRGP4 g_admin+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1077
;1076:            g_admin.string );
;1077:    admin_default_levels();
ADDRGP4 admin_default_levels
CALLV
pop
line 1078
;1078:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $662
line 1080
;1079:  }
;1080:  cnf = BG_Alloc( len + 1 );
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
CVIU4 4
ARGU4
ADDRLP4 88
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 88
INDIRP4
ASGNP4
line 1081
;1081:  cnf2 = cnf;
ADDRLP4 76
ADDRLP4 12
INDIRP4
ASGNP4
line 1082
;1082:  trap_FS_Read( cnf, len, f );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1083
;1083:  *( cnf + len ) = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1084
;1084:  trap_FS_FCloseFile( f );
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1086
;1085:
;1086:  admin_level_maxname = 0;
ADDRGP4 admin_level_maxname
CNSTI4 0
ASGNI4
line 1088
;1087:
;1088:  level_open = admin_open = ban_open = command_open = warning_open = qfalse;
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 92
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 92
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 92
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 92
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 92
INDIRI4
ASGNI4
line 1089
;1089:  COM_BeginParseSession( g_admin.string );
ADDRGP4 g_admin+16
ARGP4
ADDRGP4 COM_BeginParseSession
CALLV
pop
ADDRGP4 $668
JUMPV
LABELV $667
line 1091
;1090:  while( 1 )
;1091:  {
line 1092
;1092:    t = COM_Parse( &cnf );
ADDRLP4 12
ARGP4
ADDRLP4 96
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 96
INDIRP4
ASGNP4
line 1093
;1093:    if( !*t )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $670
line 1094
;1094:      break;
ADDRGP4 $669
JUMPV
LABELV $670
line 1096
;1095:
;1096:    if( !Q_stricmp( t, "[level]" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $674
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $672
line 1097
;1097:    {
line 1098
;1098:      if( lc >= MAX_ADMIN_LEVELS )
ADDRLP4 16
INDIRI4
CNSTI4 32
LTI4 $675
line 1099
;1099:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $675
line 1100
;1100:      l = BG_Alloc( sizeof( g_admin_level_t ) );
CNSTU4 100
ARGU4
ADDRLP4 104
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 104
INDIRP4
ASGNP4
line 1101
;1101:      g_admin_levels[ lc++ ] = l;
ADDRLP4 108
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 1102
;1102:      level_open = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 1103
;1103:      admin_open = ban_open = command_open = warning_open = qfalse;
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 112
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 112
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 112
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRI4
ASGNI4
line 1104
;1104:    }
ADDRGP4 $673
JUMPV
LABELV $672
line 1105
;1105:    else if( !Q_stricmp( t, "[admin]" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $679
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $677
line 1106
;1106:    {
line 1107
;1107:      if( ac >= MAX_ADMIN_ADMINS )
ADDRLP4 44
INDIRI4
CNSTI4 1024
LTI4 $680
line 1108
;1108:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $680
line 1109
;1109:      a = BG_Alloc( sizeof( g_admin_admin_t ) );
CNSTU4 136
ARGU4
ADDRLP4 108
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 108
INDIRP4
ASGNP4
line 1110
;1110:      g_admin_admins[ ac++ ] = a;
ADDRLP4 112
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 44
ADDRLP4 112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
line 1111
;1111:      admin_open = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 1112
;1112:      level_open = ban_open = command_open = warning_open = qfalse;
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 116
INDIRI4
ASGNI4
line 1113
;1113:    }
ADDRGP4 $678
JUMPV
LABELV $677
line 1114
;1114:    else if( !Q_stricmp( t, "[ban]" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $682
line 1115
;1115:    {
line 1116
;1116:      if( bc >= MAX_ADMIN_BANS )
ADDRLP4 52
INDIRI4
CNSTI4 1024
LTI4 $685
line 1117
;1117:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $685
line 1118
;1118:      b = BG_Alloc( sizeof( g_admin_ban_t ) );
CNSTU4 212
ARGU4
ADDRLP4 112
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 56
ADDRLP4 112
INDIRP4
ASGNP4
line 1119
;1119:      g_admin_bans[ bc++ ] = b;
ADDRLP4 116
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 52
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 1120
;1120:      ban_open = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 1121
;1121:      level_open = admin_open = command_open = warning_open = qfalse;
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1122
;1122:    }
ADDRGP4 $683
JUMPV
LABELV $682
line 1123
;1123:    else if( !Q_stricmp( t, "[command]" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $689
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $687
line 1124
;1124:    {
line 1125
;1125:      if( cc >= MAX_ADMIN_COMMANDS )
ADDRLP4 60
INDIRI4
CNSTI4 64
LTI4 $690
line 1126
;1126:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $690
line 1127
;1127:      c = BG_Alloc( sizeof( g_admin_command_t ) );
CNSTU4 268
ARGU4
ADDRLP4 116
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 116
INDIRP4
ASGNP4
line 1128
;1128:      g_admin_commands[ cc++ ] = c;
ADDRLP4 120
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 60
ADDRLP4 120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
ADDRLP4 68
INDIRP4
ASGNP4
line 1129
;1129:      c->levels[ 0 ] = -1;
ADDRLP4 68
INDIRP4
CNSTI4 136
ADDP4
CNSTI4 -1
ASGNI4
line 1130
;1130:      command_open = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 1131
;1131:      level_open = admin_open = ban_open = warning_open = qfalse;
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 124
INDIRI4
ASGNI4
line 1132
;1132:    }
ADDRGP4 $688
JUMPV
LABELV $687
line 1133
;1133:    else if( !Q_stricmp( t, "[warning]" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $694
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $692
line 1134
;1134:    {
line 1135
;1135:      if( wc >= MAX_ADMIN_WARNINGS )
ADDRLP4 72
INDIRI4
CNSTI4 1024
LTI4 $695
line 1136
;1136:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $656
JUMPV
LABELV $695
line 1137
;1137:      w = BG_Alloc( sizeof( g_admin_warning_t ) );
CNSTU4 1184
ARGU4
ADDRLP4 120
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 120
INDIRP4
ASGNP4
line 1138
;1138:      g_admin_warnings[ wc++ ] = w;
ADDRLP4 124
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 72
ADDRLP4 124
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
ADDRLP4 80
INDIRP4
ASGNP4
line 1139
;1139:      warning_open = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 1140
;1140:      level_open = admin_open = ban_open = command_open = qfalse;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 36
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 128
INDIRI4
ASGNI4
line 1141
;1141:    }  
ADDRGP4 $693
JUMPV
LABELV $692
line 1142
;1142:    else if( level_open )
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $697
line 1143
;1143:    {
line 1144
;1144:      if( !Q_stricmp( t, "level" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $699
line 1145
;1145:      {
line 1146
;1146:        readFile_int( &cnf, &l->level );
ADDRLP4 12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 1147
;1147:      }
ADDRGP4 $698
JUMPV
LABELV $699
line 1148
;1148:      else if( !Q_stricmp( t, "name" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $702
line 1149
;1149:      {
line 1150
;1150:        readFile_string( &cnf, l->name, sizeof( l->name ) );
ADDRLP4 12
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1151
;1151:      }
ADDRGP4 $698
JUMPV
LABELV $702
line 1152
;1152:      else if( !Q_stricmp( t, "flags" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $707
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $705
line 1153
;1153:      {
line 1154
;1154:        readFile_string( &cnf, l->flags, sizeof( l->flags ) );
ADDRLP4 12
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1155
;1155:      }
ADDRGP4 $698
JUMPV
LABELV $705
line 1157
;1156:      else
;1157:      {
line 1158
;1158:        COM_ParseError( "[level] unrecognized token \"%s\"", t );
ADDRGP4 $708
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 1159
;1159:      }
line 1160
;1160:    }
ADDRGP4 $698
JUMPV
LABELV $697
line 1161
;1161:    else if( admin_open )
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $709
line 1162
;1162:    {
line 1163
;1163:      if( !Q_stricmp( t, "name" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $711
line 1164
;1164:      {
line 1165
;1165:        readFile_string( &cnf, a->name, sizeof( a->name ) );
ADDRLP4 12
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1166
;1166:      }
ADDRGP4 $710
JUMPV
LABELV $711
line 1167
;1167:      else if( !Q_stricmp( t, "guid" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $715
ARGP4
ADDRLP4 124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $713
line 1168
;1168:      {
line 1169
;1169:        readFile_string( &cnf, a->guid, sizeof( a->guid ) );
ADDRLP4 12
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1170
;1170:      }
ADDRGP4 $710
JUMPV
LABELV $713
line 1171
;1171:      else if( !Q_stricmp( t, "level" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $716
line 1172
;1172:      {
line 1173
;1173:        readFile_int( &cnf, &a->level );
ADDRLP4 12
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 1174
;1174:      }
ADDRGP4 $710
JUMPV
LABELV $716
line 1175
;1175:      else if( !Q_stricmp( t, "flags" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $707
ARGP4
ADDRLP4 132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $718
line 1176
;1176:      {
line 1177
;1177:        readFile_string( &cnf, a->flags, sizeof( a->flags ) );
ADDRLP4 12
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1178
;1178:      }
ADDRGP4 $710
JUMPV
LABELV $718
line 1180
;1179:      else
;1180:      {
line 1181
;1181:        COM_ParseError( "[admin] unrecognized token \"%s\"", t );
ADDRGP4 $720
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 1182
;1182:      }
line 1184
;1183:
;1184:    }
ADDRGP4 $710
JUMPV
LABELV $709
line 1185
;1185:    else if( ban_open )
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $721
line 1186
;1186:    {
line 1187
;1187:      if( !Q_stricmp( t, "name" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $723
line 1188
;1188:      {
line 1189
;1189:        readFile_string( &cnf, b->name, sizeof( b->name ) );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1190
;1190:      }
ADDRGP4 $722
JUMPV
LABELV $723
line 1191
;1191:      else if( !Q_stricmp( t, "guid" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $715
ARGP4
ADDRLP4 124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $725
line 1192
;1192:      {
line 1193
;1193:        readFile_string( &cnf, b->guid, sizeof( b->guid ) );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1194
;1194:      }
ADDRGP4 $722
JUMPV
LABELV $725
line 1195
;1195:      else if( !Q_stricmp( t, "ip" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $561
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $727
line 1196
;1196:      {
line 1197
;1197:        readFile_string( &cnf, b->ip, sizeof( b->ip ) );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 65
ADDP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1198
;1198:      }
ADDRGP4 $722
JUMPV
LABELV $727
line 1199
;1199:      else if( !Q_stricmp( t, "reason" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $731
ARGP4
ADDRLP4 132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $729
line 1200
;1200:      {
line 1201
;1201:        readFile_string( &cnf, b->reason, sizeof( b->reason ) );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 105
ADDP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1202
;1202:      }
ADDRGP4 $722
JUMPV
LABELV $729
line 1203
;1203:      else if( !Q_stricmp( t, "made" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $734
ARGP4
ADDRLP4 136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $732
line 1204
;1204:      {
line 1205
;1205:        readFile_string( &cnf, b->made, sizeof( b->made ) );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 155
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1206
;1206:      }
ADDRGP4 $722
JUMPV
LABELV $732
line 1207
;1207:      else if( !Q_stricmp( t, "expires" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $737
ARGP4
ADDRLP4 140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $735
line 1208
;1208:      {
line 1209
;1209:        readFile_int( &cnf, &b->expires );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 1210
;1210:      }
ADDRGP4 $722
JUMPV
LABELV $735
line 1211
;1211:      else if( !Q_stricmp( t, "banner" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
ADDRLP4 144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $738
line 1212
;1212:      {
line 1213
;1213:        readFile_string( &cnf, b->banner, sizeof( b->banner ) );
ADDRLP4 12
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 180
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1214
;1214:      }
ADDRGP4 $722
JUMPV
LABELV $738
line 1216
;1215:      else
;1216:      {
line 1217
;1217:        COM_ParseError( "[ban] unrecognized token \"%s\"", t );
ADDRGP4 $741
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 1218
;1218:      }
line 1219
;1219:    }
ADDRGP4 $722
JUMPV
LABELV $721
line 1220
;1220:    else if( command_open )
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $742
line 1221
;1221:    {
line 1222
;1222:      if( !Q_stricmp( t, "command" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $746
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $744
line 1223
;1223:      {
line 1224
;1224:        readFile_string( &cnf, c->command, sizeof( c->command ) );
ADDRLP4 12
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1225
;1225:      }
ADDRGP4 $743
JUMPV
LABELV $744
line 1226
;1226:      else if( !Q_stricmp( t, "exec" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $747
line 1227
;1227:      {
line 1228
;1228:        readFile_string( &cnf, c->exec, sizeof( c->exec ) );
ADDRLP4 12
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1229
;1229:      }
ADDRGP4 $743
JUMPV
LABELV $747
line 1230
;1230:      else if( !Q_stricmp( t, "desc" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $750
line 1231
;1231:      {
line 1232
;1232:        readFile_string( &cnf, c->desc, sizeof( c->desc ) );
ADDRLP4 12
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1233
;1233:      }
ADDRGP4 $743
JUMPV
LABELV $750
line 1234
;1234:      else if( !Q_stricmp( t, "levels" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $755
ARGP4
ADDRLP4 132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $753
line 1235
;1235:      {
line 1236
;1236:        char levels[ MAX_STRING_CHARS ] = {""};
ADDRLP4 144
ADDRGP4 $756
INDIRB
ASGNB 1024
line 1237
;1237:        char *level = levels;
ADDRLP4 140
ADDRLP4 144
ASGNP4
line 1239
;1238:        char *lp;
;1239:        int cmdlevel = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1241
;1240:        
;1241:        readFile_string( &cnf, levels, sizeof( levels ) );
ADDRLP4 12
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
ADDRGP4 $758
JUMPV
LABELV $757
line 1243
;1242:        while( cmdlevel < MAX_ADMIN_LEVELS )
;1243:        {
line 1244
;1244:          lp = COM_Parse( &level );
ADDRLP4 140
ARGP4
ADDRLP4 1172
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 1168
ADDRLP4 1172
INDIRP4
ASGNP4
line 1245
;1245:          if( !*lp )
ADDRLP4 1168
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $760
line 1246
;1246:            break;
ADDRGP4 $759
JUMPV
LABELV $760
line 1247
;1247:          c->levels[ cmdlevel++ ] = atoi( lp );
ADDRLP4 1176
ADDRLP4 136
INDIRI4
ASGNI4
ADDRLP4 136
ADDRLP4 1176
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 136
ADDP4
ADDP4
ADDRLP4 1180
INDIRI4
ASGNI4
line 1248
;1248:        }
LABELV $758
line 1242
ADDRLP4 136
INDIRI4
CNSTI4 32
LTI4 $757
LABELV $759
line 1250
;1249:        // ensure the list is -1 terminated
;1250:        c->levels[ cmdlevel ] = -1;
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 136
ADDP4
ADDP4
CNSTI4 -1
ASGNI4
line 1251
;1251:      }      
ADDRGP4 $743
JUMPV
LABELV $753
line 1253
;1252:      else
;1253:      {
line 1254
;1254:        COM_ParseError( "[command] unrecognized token \"%s\"", t );
ADDRGP4 $762
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 1255
;1255:      }
line 1256
;1256:    }
ADDRGP4 $743
JUMPV
LABELV $742
line 1257
;1257:    else if( warning_open )
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $763
line 1258
;1258:    {
line 1259
;1259:        if( !Q_stricmp( t, "name" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $765
line 1260
;1260:        {
line 1261
;1261:            readFile_string( &cnf, w->name, sizeof( w->name ) );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1262
;1262:        }
ADDRGP4 $764
JUMPV
LABELV $765
line 1263
;1263:        else if( !Q_stricmp( t, "guid" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $715
ARGP4
ADDRLP4 124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $767
line 1264
;1264:        {
line 1265
;1265:            readFile_string( &cnf, w->guid, sizeof( w->guid ) );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1266
;1266:        }
ADDRGP4 $764
JUMPV
LABELV $767
line 1267
;1267:        else if( !Q_stricmp( t, "ip" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $561
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $769
line 1268
;1268:        {
line 1269
;1269:            readFile_string( &cnf, w->ip, sizeof( w->ip ) );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 65
ADDP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1270
;1270:        }
ADDRGP4 $764
JUMPV
LABELV $769
line 1271
;1271:        else if( !Q_stricmp( t, "warning" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $773
ARGP4
ADDRLP4 132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $771
line 1272
;1272:        {
line 1273
;1273:            readFile_string( &cnf, w->warning, sizeof( w->warning ) );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 105
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1274
;1274:        }
ADDRGP4 $764
JUMPV
LABELV $771
line 1275
;1275:        else if( !Q_stricmp( t, "made" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $734
ARGP4
ADDRLP4 136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $774
line 1276
;1276:        {
line 1277
;1277:            readFile_string( &cnf, w->made, sizeof( w->made ) );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 1129
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1278
;1278:        }
ADDRGP4 $764
JUMPV
LABELV $774
line 1279
;1279:        else if( !Q_stricmp( t, "expires" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $737
ARGP4
ADDRLP4 140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $776
line 1280
;1280:        {
line 1281
;1281:            readFile_int( &cnf, &w->expires );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 1180
ADDP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 1282
;1282:        }
ADDRGP4 $764
JUMPV
LABELV $776
line 1283
;1283:        else if( !Q_stricmp( t, "warner" ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $780
ARGP4
ADDRLP4 144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $778
line 1284
;1284:        {
line 1285
;1285:            readFile_string( &cnf, w->warner, sizeof( w->warner ) );
ADDRLP4 12
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 1147
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 1286
;1286:        }
ADDRGP4 $764
JUMPV
LABELV $778
line 1288
;1287:        else
;1288:        {
line 1289
;1289:            COM_ParseError( "[warning] unrecognized token \"%s\"", t );
ADDRGP4 $781
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 1290
;1290:        }
line 1291
;1291:    }
ADDRGP4 $764
JUMPV
LABELV $763
line 1293
;1292:    else 
;1293:    {
line 1294
;1294:      COM_ParseError( "unexpected token \"%s\"", t );
ADDRGP4 $782
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 1295
;1295:    }
LABELV $764
LABELV $743
LABELV $722
LABELV $710
LABELV $698
LABELV $693
LABELV $688
LABELV $683
LABELV $678
LABELV $673
line 1296
;1296:  }
LABELV $668
line 1090
ADDRGP4 $667
JUMPV
LABELV $669
line 1297
;1297:  BG_Free( cnf2 );
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 1298
;1298:  ADMP( va( "^3!readconfig: ^7loaded %d levels, %d admins, %d bans, %d commands, %d warnings\n",
ADDRGP4 $783
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1300
;1299:          lc, ac, bc, cc, wc ) );
;1300:  if( lc == 0 )
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $784
line 1301
;1301:    admin_default_levels();
ADDRGP4 admin_default_levels
CALLV
pop
ADDRGP4 $785
JUMPV
LABELV $784
line 1303
;1302:  else
;1303:  {
line 1305
;1304:    // max printable name length for formatting
;1305:    for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $789
JUMPV
LABELV $786
line 1306
;1306:    {
line 1307
;1307:      len = Q_PrintStrlen( g_admin_levels[ i ]->name );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 Q_PrintStrlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 100
INDIRI4
ASGNI4
line 1308
;1308:      if( len > admin_level_maxname )
ADDRLP4 8
INDIRI4
ADDRGP4 admin_level_maxname
INDIRI4
LEI4 $790
line 1309
;1309:        admin_level_maxname = len;
ADDRGP4 admin_level_maxname
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $790
line 1310
;1310:    }
LABELV $787
line 1305
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $789
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $792
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $786
LABELV $792
line 1311
;1311:  }
LABELV $785
line 1313
;1312:  // reset adminLevel
;1313:  for( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $796
JUMPV
LABELV $793
line 1314
;1314:    if( level.clients[ i ].pers.connected != CON_DISCONNECTED )
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $798
line 1315
;1315:      level.clients[ i ].pers.adminLevel = G_admin_level( &g_entities[ i ] );
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 104
ADDRGP4 G_admin_level
CALLI4
ASGNI4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1008
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
LABELV $798
LABELV $794
line 1313
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $796
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $793
line 1316
;1316:  return qtrue;
CNSTI4 1
RETI4
LABELV $656
endproc G_admin_readconfig 1184 24
export G_admin_time
proc G_admin_time 40 16
line 1320
;1317:}
;1318:
;1319:qboolean G_admin_time( gentity_t *ent, int skiparg )
;1320:{
line 1323
;1321:  qtime_t qt;
;1322:
;1323:  trap_RealTime( &qt );
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 1324
;1324:  ADMP( va( "^3!time: ^7local time is %02i:%02i:%02i\n",
ADDRGP4 $801
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1326
;1325:    qt.tm_hour, qt.tm_min, qt.tm_sec ) );
;1326:  return qtrue;
CNSTI4 1
RETI4
LABELV $800
endproc G_admin_time 40 16
lit
align 1
LABELV $805
byte 1 0
skip 31
align 1
LABELV $806
byte 1 0
skip 31
align 1
LABELV $807
byte 1 0
skip 31
export G_admin_setlevel
code
proc G_admin_setlevel 260 16
line 1330
;1327:}
;1328:
;1329:qboolean G_admin_setlevel( gentity_t *ent, int skiparg )
;1330:{
line 1331
;1331:  char name[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 4
ADDRGP4 $805
INDIRB
ASGNB 32
line 1333
;1332:  char lstr[ 11 ]; // 10 is max strlen() for 32-bit int
;1333:  char adminname[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 116
ADDRGP4 $806
INDIRB
ASGNB 32
line 1334
;1334:  char testname[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 69
ADDRGP4 $807
INDIRB
ASGNB 32
line 1337
;1335:  char guid[ 33 ];
;1336:  int l, i;
;1337:  gentity_t *vic = NULL;
ADDRLP4 112
CNSTP4 0
ASGNP4
line 1338
;1338:  qboolean updated = qfalse;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 1340
;1339:  g_admin_admin_t *a;
;1340:  qboolean found = qfalse;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 1341
;1341:  qboolean numeric = qtrue;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 1342
;1342:  int matches = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 1343
;1343:  int id = -1;
ADDRLP4 160
CNSTI4 -1
ASGNI4
line 1346
;1344:
;1345:
;1346:  if( G_SayArgc() < 3 + skiparg )
ADDRLP4 180
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $808
line 1347
;1347:  {
line 1348
;1348:    ADMP( "^3!setlevel: ^7usage: !setlevel [name|slot#] [level]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $810
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1349
;1349:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $808
line 1351
;1350:  }
;1351:  G_SayArgv( 1 + skiparg, testname, sizeof( testname ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 69
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1352
;1352:  G_SayArgv( 2 + skiparg, lstr, sizeof( lstr ) );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 168
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1353
;1353:  l = atoi( lstr );
ADDRLP4 168
ARGP4
ADDRLP4 184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 184
INDIRI4
ASGNI4
line 1354
;1354:  G_SanitiseString( testname, name, sizeof( name ) );
ADDRLP4 69
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1355
;1355:  for( i = 0; i < sizeof( name ) && name[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $814
JUMPV
LABELV $811
line 1356
;1356:  {
line 1357
;1357:    if( !isdigit( name[ i ] ) )
ADDRLP4 188
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 48
LTI4 $817
ADDRLP4 188
INDIRI4
CNSTI4 57
LEI4 $815
LABELV $817
line 1358
;1358:    {
line 1359
;1359:      numeric = qfalse;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1360
;1360:      break;
ADDRGP4 $813
JUMPV
LABELV $815
line 1362
;1361:    }
;1362:  }
LABELV $812
line 1355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $814
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $818
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $811
LABELV $818
LABELV $813
line 1363
;1363:  if( numeric )
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $819
line 1364
;1364:    id = atoi( name );
ADDRLP4 4
ARGP4
ADDRLP4 192
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 160
ADDRLP4 192
INDIRI4
ASGNI4
LABELV $819
line 1366
;1365:
;1366:  if( ent && l > ent->client->pers.adminLevel )
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $821
ADDRLP4 104
INDIRI4
ADDRLP4 196
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
LEI4 $821
line 1367
;1367:  {
line 1368
;1368:    ADMP( "^3!setlevel: ^7you may not use !setlevel to set a level higher "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $823
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1370
;1369:      "than your current level\n" );
;1370:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $821
line 1375
;1371:  }
;1372:
;1373:  // if admin is activated for the first time on a running server, we need
;1374:  // to ensure at least the default levels get created
;1375:  if( !ent && !g_admin_levels[ 0 ] )
ADDRLP4 200
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
NEU4 $824
ADDRGP4 g_admin_levels
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
NEU4 $824
line 1376
;1376:    G_admin_readconfig(NULL, 0);
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_admin_readconfig
CALLI4
pop
LABELV $824
line 1378
;1377:
;1378:  for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $829
JUMPV
LABELV $826
line 1379
;1379:  {
line 1380
;1380:    if( g_admin_levels[ i ]->level == l )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $830
line 1381
;1381:    {
line 1382
;1382:      found = qtrue;
ADDRLP4 156
CNSTI4 1
ASGNI4
line 1383
;1383:      break;
ADDRGP4 $828
JUMPV
LABELV $830
line 1385
;1384:    }
;1385:  }
LABELV $827
line 1378
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $829
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $832
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $826
LABELV $832
LABELV $828
line 1386
;1386:  if( !found )
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $833
line 1387
;1387:  {
line 1388
;1388:    ADMP( "^3!setlevel: ^7level is not defined\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $835
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1389
;1389:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $833
line 1392
;1390:  }
;1391:
;1392:  if( numeric && id >= 0 && id < level.maxclients )
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 208
INDIRI4
EQI4 $836
ADDRLP4 160
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $836
ADDRLP4 160
INDIRI4
ADDRGP4 level+24
INDIRI4
GEI4 $836
line 1393
;1393:    vic = &g_entities[ id ];
ADDRLP4 112
CNSTI4 2492
ADDRLP4 160
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
LABELV $836
line 1395
;1394:
;1395:  if( vic && vic->client && vic->client->pers.connected != CON_DISCONNECTED )
ADDRLP4 220
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 220
INDIRU4
EQU4 $839
ADDRLP4 224
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CVPU4 4
ADDRLP4 220
INDIRU4
EQU4 $839
ADDRLP4 224
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $839
line 1396
;1396:  {
line 1397
;1397:    Q_strncpyz( adminname, vic->client->pers.netname, sizeof( adminname ) );
ADDRLP4 116
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1398
;1398:    Q_strncpyz( guid, vic->client->pers.guid, sizeof( guid ) );
ADDRLP4 36
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1399
;1399:    matches = 1;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 1400
;1400:  }
ADDRGP4 $840
JUMPV
LABELV $839
line 1401
;1401:  else if( numeric && id >= MAX_CLIENTS && id < MAX_CLIENTS + MAX_ADMIN_ADMINS
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $841
ADDRLP4 160
INDIRI4
CNSTI4 256
LTI4 $841
ADDRLP4 160
INDIRI4
CNSTI4 1280
GEI4 $841
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-1024
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $841
line 1403
;1402:    && g_admin_admins[ id - MAX_CLIENTS ] )
;1403:  {
line 1404
;1404:    Q_strncpyz( adminname, g_admin_admins[ id - MAX_CLIENTS ]->name,
ADDRLP4 116
ARGP4
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-1024
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1406
;1405:      sizeof( adminname ) );
;1406:    Q_strncpyz( guid, g_admin_admins[ id - MAX_CLIENTS ]->guid,
ADDRLP4 36
ARGP4
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-1024
ADDP4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1408
;1407:      sizeof( guid ) );
;1408:    matches = 1;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 1409
;1409:  }
ADDRGP4 $842
JUMPV
LABELV $841
line 1411
;1410:  else
;1411:  {
line 1412
;1412:    for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ] && matches < 2; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $849
JUMPV
LABELV $846
line 1413
;1413:    {
line 1414
;1414:      G_SanitiseString( g_admin_admins[ i ]->name, testname, sizeof( testname ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 69
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1415
;1415:      if( strstr( testname, name ) )
ADDRLP4 69
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 232
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $850
line 1416
;1416:      {
line 1417
;1417:        Q_strncpyz( adminname, g_admin_admins[ i ]->name, sizeof( adminname ) );
ADDRLP4 116
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1418
;1418:        Q_strncpyz( guid, g_admin_admins[ i ]->guid, sizeof( guid ) );
ADDRLP4 36
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1419
;1419:        matches++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1420
;1420:      }
LABELV $850
line 1421
;1421:    }
LABELV $847
line 1412
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $849
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $853
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $853
ADDRLP4 108
INDIRI4
ADDRLP4 236
INDIRI4
LTI4 $846
LABELV $853
line 1422
;1422:    for( i = 0; i < level.maxclients && matches < 2; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $857
JUMPV
LABELV $854
line 1423
;1423:    {
line 1424
;1424:      if( level.clients[ i ].pers.connected == CON_DISCONNECTED )
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $859
line 1425
;1425:        continue;
ADDRGP4 $855
JUMPV
LABELV $859
line 1426
;1426:      if( matches && !Q_stricmp( level.clients[ i ].pers.guid, guid ) )
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $861
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $861
line 1427
;1427:      {
line 1428
;1428:        vic = &g_entities[ i ];
ADDRLP4 112
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1429
;1429:        continue;
ADDRGP4 $855
JUMPV
LABELV $861
line 1431
;1430:      }
;1431:      G_SanitiseString( level.clients[ i ].pers.netname, testname,
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 69
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1433
;1432:        sizeof( testname ) );
;1433:      if( strstr( testname, name ) )
ADDRLP4 69
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 244
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $863
line 1434
;1434:      {
line 1435
;1435:        vic = &g_entities[ i ];
ADDRLP4 112
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1436
;1436:        matches++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1437
;1437:        Q_strncpyz( guid, vic->client->pers.guid, sizeof( guid ) );
ADDRLP4 36
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1438
;1438:      }
LABELV $863
line 1439
;1439:    }
LABELV $855
line 1422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $857
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
GEI4 $865
ADDRLP4 108
INDIRI4
CNSTI4 2
LTI4 $854
LABELV $865
line 1440
;1440:    if( vic && vic->client)
ADDRLP4 244
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $866
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $866
line 1441
;1441:      Q_strncpyz( adminname, vic->client->pers.netname, sizeof( adminname ) );
ADDRLP4 116
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $866
line 1442
;1442:  }
LABELV $842
LABELV $840
line 1444
;1443:
;1444:  if( matches == 0 )
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $868
line 1445
;1445:  {
line 1446
;1446:    ADMP( "^3!setlevel:^7 no match.  use !listplayers or !listadmins to "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1448
;1447:      "find an appropriate number to use instead of name.\n" );
;1448:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $868
line 1450
;1449:  }
;1450:  if( matches > 1 )
ADDRLP4 108
INDIRI4
CNSTI4 1
LEI4 $871
line 1451
;1451:  {
line 1452
;1452:    ADMP( "^3!setlevel:^7 more than one match.  Use the admin number "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1454
;1453:      "instead:\n" );
;1454:    admin_listadmins( ent, 0, name );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 admin_listadmins
CALLI4
pop
line 1455
;1455:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $871
line 1458
;1456:  }
;1457:
;1458:  if( ent && !admin_higher_guid( ent->client->pers.guid, guid ) )
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $874
ADDRLP4 232
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 236
ADDRGP4 admin_higher_guid
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $874
line 1459
;1459:  {
line 1460
;1460:    ADMP( "^3!setlevel: ^7sorry, but your intended victim has a higher"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $876
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1462
;1461:        " admin level than you\n" );
;1462:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $874
line 1465
;1463:  }
;1464:
;1465:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ];i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $880
JUMPV
LABELV $877
line 1466
;1466:  {
line 1467
;1467:    if( !Q_stricmp( g_admin_admins[ i ]->guid, guid ) )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $881
line 1468
;1468:    {
line 1469
;1469:      g_admin_admins[ i ]->level = l;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1470
;1470:      Q_strncpyz( g_admin_admins[ i ]->name, adminname,
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 116
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1472
;1471:                  sizeof( g_admin_admins[ i ]->name ) );
;1472:      updated = qtrue;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 1473
;1473:    }
LABELV $881
line 1474
;1474:  }
LABELV $878
line 1465
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $880
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $883
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $877
LABELV $883
line 1475
;1475:  if( !updated )
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $884
line 1476
;1476:  {
line 1477
;1477:    if( i == MAX_ADMIN_ADMINS )
ADDRLP4 0
INDIRI4
CNSTI4 1024
NEI4 $886
line 1478
;1478:    {
line 1479
;1479:      ADMP( "^3!setlevel: ^7too many admins\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $888
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1480
;1480:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $886
line 1482
;1481:    }
;1482:    a = BG_Alloc( sizeof( g_admin_admin_t ) );
CNSTU4 136
ARGU4
ADDRLP4 244
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 164
ADDRLP4 244
INDIRP4
ASGNP4
line 1483
;1483:    a->level = l;
ADDRLP4 164
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1484
;1484:    Q_strncpyz( a->name, adminname, sizeof( a->name ) );
ADDRLP4 164
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 116
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1485
;1485:    Q_strncpyz( a->guid, guid, sizeof( a->guid ) );
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1486
;1486:    *a->flags = '\0';
ADDRLP4 164
INDIRP4
CNSTI4 72
ADDP4
CNSTI1 0
ASGNI1
line 1487
;1487:    g_admin_admins[ i ] = a;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
ADDRLP4 164
INDIRP4
ASGNP4
line 1488
;1488:  }
LABELV $884
line 1490
;1489:
;1490:  AP( va(
ADDRGP4 $889
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $891
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $892
JUMPV
LABELV $891
ADDRLP4 244
ADDRGP4 $446
ASGNP4
LABELV $892
ADDRLP4 244
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1493
;1491:    "print \"^3!setlevel: ^7%s^7 was given level %d admin rights by %s\n\"",
;1492:    adminname, l, ( ent ) ? ent->client->pers.netname : "console" ) );
;1493:  if( vic && vic->client )
ADDRLP4 256
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 256
INDIRU4
EQU4 $893
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 256
INDIRU4
EQU4 $893
line 1494
;1494:    vic->client->pers.adminLevel = l;
ADDRLP4 112
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
LABELV $893
line 1496
;1495:
;1496:  if( !g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $895
line 1497
;1497:    ADMP( "^3!setlevel: ^7WARNING g_admin not set, not saving admin record "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $898
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $896
JUMPV
LABELV $895
line 1500
;1498:      "to a file\n" );
;1499:  else
;1500:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $896
line 1501
;1501:  return qtrue;
CNSTI4 1
RETI4
LABELV $804
endproc G_admin_setlevel 260 16
proc admin_create_ban 60 36
line 1510
;1502:}
;1503:
;1504:static qboolean admin_create_ban( gentity_t *ent,
;1505:  char *netname,
;1506:  char *guid,
;1507:  char *ip,
;1508:  int seconds,
;1509:  char *reason )
;1510:{
line 1511
;1511:  g_admin_ban_t *b = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1516
;1512:  qtime_t qt;
;1513:  int t;
;1514:  int i;
;1515:
;1516:  t = trap_RealTime( &qt );
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 1517
;1517:  b = BG_Alloc( sizeof( g_admin_ban_t ) );
CNSTU4 212
ARGU4
ADDRLP4 52
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
ASGNP4
line 1519
;1518:
;1519:  if( !b )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $900
line 1520
;1520:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $900
line 1522
;1521:
;1522:  Q_strncpyz( b->name, netname, sizeof( b->name ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1523
;1523:  Q_strncpyz( b->guid, guid, sizeof( b->guid ) );
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1524
;1524:  Q_strncpyz( b->ip, ip, sizeof( b->ip ) );
ADDRLP4 4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1527
;1525:
;1526:  //strftime( b->made, sizeof( b->made ), "%m/%d/%y %H:%M:%S", lt );
;1527:  Com_sprintf( b->made, sizeof( b->made ), "%02i/%02i/%02i %02i:%02i:%02i",
ADDRLP4 4
INDIRP4
CNSTI4 155
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 $902
ARGP4
ADDRLP4 8+16
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8+12
INDIRI4
ARGI4
ADDRLP4 8+20
INDIRI4
CNSTI4 100
MODI4
ARGI4
ADDRLP4 8+8
INDIRI4
ARGI4
ADDRLP4 8+4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1531
;1528:    qt.tm_mon + 1, qt.tm_mday, qt.tm_year % 100,
;1529:    qt.tm_hour, qt.tm_min, qt.tm_sec );
;1530:
;1531:  if( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $908
line 1532
;1532:    Q_strncpyz( b->banner, ent->client->pers.netname, sizeof( b->banner ) );
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $909
JUMPV
LABELV $908
line 1534
;1533:  else
;1534:    Q_strncpyz( b->banner, "console", sizeof( b->banner ) );
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRGP4 $446
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $909
line 1535
;1535:  if( !seconds )
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $910
line 1536
;1536:    b->expires = 0;
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $911
JUMPV
LABELV $910
line 1538
;1537:  else
;1538:    b->expires = t + seconds;
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 44
INDIRI4
ADDRFP4 16
INDIRI4
ADDI4
ASGNI4
LABELV $911
line 1539
;1539:  if( !*reason )
ADDRFP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $912
line 1540
;1540:    Q_strncpyz( b->reason, "banned by admin", sizeof( b->reason ) );
ADDRLP4 4
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRGP4 $914
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $913
JUMPV
LABELV $912
line 1542
;1541:  else
;1542:    Q_strncpyz( b->reason, reason, sizeof( b->reason ) );
ADDRLP4 4
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $913
line 1543
;1543:  for( i = 0; i < MAX_ADMIN_BANS && g_admin_bans[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $918
JUMPV
LABELV $915
line 1544
;1544:    ;
LABELV $916
line 1543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $918
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $919
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $915
LABELV $919
line 1545
;1545:  if( i == MAX_ADMIN_BANS )
ADDRLP4 0
INDIRI4
CNSTI4 1024
NEI4 $920
line 1546
;1546:  {
line 1547
;1547:    ADMP( "^3!ban: ^7too many bans\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $922
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1548
;1548:    BG_Free( b );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 1549
;1549:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $920
line 1551
;1550:  }
;1551:  g_admin_bans[ i ] = b;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1552
;1552:  return qtrue;
CNSTI4 1
RETI4
LABELV $899
endproc admin_create_ban 60 36
proc admin_create_warning 60 36
line 1556
;1553:}
;1554://KK-OAX Copied create_ban to get Time Stuff Right (Didn't feel like writing code to parse it)
;1555:static qboolean admin_create_warning( gentity_t *ent, char *netname, char *guid, char *ip, int seconds, char *warning )
;1556:{
line 1557
;1557:  g_admin_warning_t *w = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1562
;1558:  qtime_t qt;
;1559:  int t;
;1560:  int i;
;1561:
;1562:  t = trap_RealTime( &qt );
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 1563
;1563:  w = BG_Alloc( sizeof( g_admin_warning_t ) );
CNSTU4 1184
ARGU4
ADDRLP4 52
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
ASGNP4
line 1565
;1564:
;1565:  if( !w )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $924
line 1566
;1566:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $923
JUMPV
LABELV $924
line 1568
;1567:
;1568:  Q_strncpyz( w->name, netname, sizeof( w->name ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1569
;1569:  Q_strncpyz( w->guid, guid, sizeof( w->guid ) );
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1570
;1570:  Q_strncpyz( w->ip, ip, sizeof( w->ip ) );
ADDRLP4 4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1573
;1571:
;1572:  //strftime( b->made, sizeof( b->made ), "%m/%d/%y %H:%M:%S", lt );
;1573:  Com_sprintf( w->made, sizeof( w->made ), "%02i/%02i/%02i %02i:%02i:%02i",
ADDRLP4 4
INDIRP4
CNSTI4 1129
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 $902
ARGP4
ADDRLP4 8+16
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8+12
INDIRI4
ARGI4
ADDRLP4 8+20
INDIRI4
CNSTI4 100
MODI4
ARGI4
ADDRLP4 8+8
INDIRI4
ARGI4
ADDRLP4 8+4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1577
;1574:    qt.tm_mon + 1, qt.tm_mday, qt.tm_year % 100,
;1575:    qt.tm_hour, qt.tm_min, qt.tm_sec );
;1576:
;1577:  if( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $931
line 1578
;1578:    Q_strncpyz( w->warner, ent->client->pers.netname, sizeof( w->warner ) );
ADDRLP4 4
INDIRP4
CNSTI4 1147
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $932
JUMPV
LABELV $931
line 1580
;1579:  else
;1580:    Q_strncpyz( w->warner, "console", sizeof( w->warner ) );
ADDRLP4 4
INDIRP4
CNSTI4 1147
ADDP4
ARGP4
ADDRGP4 $446
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $932
line 1581
;1581:  if( !seconds )
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $933
line 1582
;1582:    w->expires = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1180
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $934
JUMPV
LABELV $933
line 1584
;1583:  else
;1584:    w->expires = t + seconds;
ADDRLP4 4
INDIRP4
CNSTI4 1180
ADDP4
ADDRLP4 44
INDIRI4
ADDRFP4 16
INDIRI4
ADDI4
ASGNI4
LABELV $934
line 1585
;1585:  if( !*warning )
ADDRFP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $935
line 1586
;1586:    Q_strncpyz( w->warning, "warned by admin", sizeof( w->warning ) );
ADDRLP4 4
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRGP4 $937
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $935
line 1588
;1587:  else
;1588:    Q_strncpyz( w->warning, warning, sizeof( w->warning ) );
ADDRLP4 4
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $936
line 1589
;1589:  for( i = 0; i < MAX_ADMIN_WARNINGS && g_admin_warnings[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $941
JUMPV
LABELV $938
line 1590
;1590:    ;
LABELV $939
line 1589
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $941
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $942
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $938
LABELV $942
line 1591
;1591:  if( i == MAX_ADMIN_WARNINGS )
ADDRLP4 0
INDIRI4
CNSTI4 1024
NEI4 $943
line 1592
;1592:  {
line 1593
;1593:    ADMP( "^3!warn: ^7too many warnings\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $945
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1594
;1594:    BG_Free( w );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 1595
;1595:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $923
JUMPV
LABELV $943
line 1597
;1596:  }
;1597:  g_admin_warnings[ i ] = w;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1598
;1598:  return qtrue;
CNSTI4 1
RETI4
LABELV $923
endproc admin_create_warning 60 36
export G_admin_parse_time
proc G_admin_parse_time 52 0
line 1603
;1599:}
;1600:
;1601:
;1602:int G_admin_parse_time( const char *time )
;1603:{
line 1604
;1604:  int seconds = 0, num = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $948
JUMPV
LABELV $947
line 1606
;1605:  while( *time )
;1606:  {
line 1607
;1607:    if( !isdigit( *time ) )
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 48
LTI4 $952
ADDRLP4 8
INDIRI4
CNSTI4 57
LEI4 $954
LABELV $952
line 1608
;1608:      return -1;
CNSTI4 -1
RETI4
ADDRGP4 $946
JUMPV
LABELV $953
line 1610
;1609:    while( isdigit( *time ) )
;1610:      num = num * 10 + *time++ - '0';
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDI4
CNSTI4 48
SUBI4
ASGNI4
LABELV $954
line 1609
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $956
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $953
LABELV $956
line 1612
;1611:
;1612:    if( !*time )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $957
line 1613
;1613:      break;
ADDRGP4 $949
JUMPV
LABELV $957
line 1614
;1614:    switch( *time++ )
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
CNSTI4 109
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $965
ADDRLP4 20
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $968
LABELV $967
ADDRLP4 40
CNSTI4 100
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $963
ADDRLP4 20
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $959
LABELV $969
ADDRLP4 20
INDIRI4
CNSTI4 104
EQI4 $964
ADDRGP4 $959
JUMPV
LABELV $968
ADDRLP4 48
CNSTI4 115
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $960
ADDRLP4 20
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $959
LABELV $970
ADDRLP4 20
INDIRI4
CNSTI4 119
EQI4 $962
ADDRGP4 $959
JUMPV
line 1615
;1615:    {
LABELV $962
line 1616
;1616:      case 'w': num *= 7;
ADDRLP4 0
CNSTI4 7
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
LABELV $963
line 1617
;1617:      case 'd': num *= 24;
ADDRLP4 0
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
LABELV $964
line 1618
;1618:      case 'h': num *= 60;
ADDRLP4 0
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
LABELV $965
line 1619
;1619:      case 'm': num *= 60;
ADDRLP4 0
CNSTI4 60
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
line 1620
;1620:      case 's': break;
ADDRGP4 $960
JUMPV
LABELV $959
line 1621
;1621:      default:  return -1;
CNSTI4 -1
RETI4
ADDRGP4 $946
JUMPV
LABELV $960
line 1623
;1622:    }
;1623:    seconds += num;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1624
;1624:    num = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1625
;1625:  }
LABELV $948
line 1605
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $947
LABELV $949
line 1626
;1626:  if( num )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $971
line 1627
;1627:    seconds += num;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
LABELV $971
line 1628
;1628:  return seconds;
ADDRLP4 4
INDIRI4
RETI4
LABELV $946
endproc G_admin_parse_time 52 0
export G_admin_kick
proc G_admin_kick 2164 24
line 1632
;1629:}
;1630:
;1631:qboolean G_admin_kick( gentity_t *ent, int skiparg )
;1632:{
line 1638
;1633:  int pids[ MAX_CLIENTS ], found;
;1634:  char name[ MAX_NAME_LENGTH ], *reason, err[ MAX_STRING_CHARS ];
;1635:  int minargc;
;1636:  gentity_t *vic;
;1637:
;1638:  minargc = 3 + skiparg;
ADDRLP4 1064
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1639
;1639:  if( G_admin_permission( ent, ADMF_UNACCOUNTABLE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 2096
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
EQI4 $974
line 1640
;1640:    minargc = 2 + skiparg;
ADDRLP4 1064
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $974
line 1642
;1641:
;1642:  if( G_SayArgc() < minargc )
ADDRLP4 2100
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
ADDRLP4 1064
INDIRI4
GEI4 $976
line 1643
;1643:  {
line 1644
;1644:    ADMP( "^3!kick: ^7usage: !kick [name] [reason]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $978
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1645
;1645:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $973
JUMPV
LABELV $976
line 1647
;1646:  }
;1647:  G_SayArgv( 1 + skiparg, name, sizeof( name ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1648
;1648:  reason = G_SayConcatArgs( 2 + skiparg );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 2104
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2104
INDIRP4
ASGNP4
line 1649
;1649:  if( ( found = G_ClientNumbersFromString( name, pids, MAX_CLIENTS ) ) != 1 )
ADDRLP4 1032
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2108
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1068
ADDRLP4 2108
INDIRI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 1
EQI4 $979
line 1650
;1650:  {
line 1651
;1651:    G_MatchOnePlayer( pids, found, err, sizeof( err ) );
ADDRLP4 8
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 1652
;1652:    ADMP( va( "^3!kick: ^7%s\n", err ) );
ADDRGP4 $981
ARGP4
ADDRLP4 1072
ARGP4
ADDRLP4 2112
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2112
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1653
;1653:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $973
JUMPV
LABELV $979
line 1655
;1654:  }
;1655:  vic = &g_entities[ pids[ 0 ] ];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1656
;1656:  if( !admin_higher( ent, vic ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $982
line 1657
;1657:  {
line 1658
;1658:    ADMP( "^3!kick: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $984
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1660
;1659:        " level than you\n" );
;1660:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $973
JUMPV
LABELV $982
line 1662
;1661:  }
;1662:  if( vic->client->pers.localClient )
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $985
line 1663
;1663:  {
line 1664
;1664:    ADMP( "^3!kick: ^7disconnecting the host would end the game\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $987
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1665
;1665:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $973
JUMPV
LABELV $985
line 1667
;1666:  }
;1667:  admin_create_ban( ent,
ADDRGP4 $988
ARGP4
ADDRGP4 g_adminTempBan+16
ARGP4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRLP4 2124
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2128
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2128
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2128
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 2128
INDIRP4
CNSTI4 953
ADDP4
ARGP4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $992
ADDRLP4 2116
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $993
JUMPV
LABELV $992
ADDRLP4 2116
ADDRGP4 $990
ASGNP4
LABELV $993
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 admin_create_ban
CALLI4
pop
line 1673
;1668:    vic->client->pers.netname,
;1669:    vic->client->pers.guid,
;1670:    vic->client->pers.ip,
;1671:    G_admin_parse_time( va( "1s%s", g_adminTempBan.string ) ),
;1672:    ( *reason ) ? reason : "kicked by admin" );
;1673:  if( g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $994
line 1674
;1674:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $994
line 1676
;1675:
;1676:  trap_SendServerCommand( pids[ 0 ],
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1001
ADDRGP4 $998
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2132
ADDRLP4 2140
INDIRP4
ASGNP4
ADDRGP4 $1002
JUMPV
LABELV $1001
ADDRLP4 2132
ADDRGP4 $71
ASGNP4
LABELV $1002
ADDRGP4 $997
ARGP4
ADDRLP4 2132
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1003
ADDRLP4 2136
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $1004
JUMPV
LABELV $1003
ADDRLP4 2136
ADDRGP4 $990
ASGNP4
LABELV $1004
ADDRLP4 2136
INDIRP4
ARGP4
ADDRLP4 2144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 2144
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1681
;1677:    va( "disconnect \"You have been kicked.\n%s^7\nreason:\n%s\"",
;1678:      ( ent ) ? va( "admin:\n%s", ent->client->pers.netname ) : "",
;1679:      ( *reason ) ? reason : "kicked by admin" ) );
;1680:
;1681:  trap_DropClient( pids[ 0 ], va( "has been kicked%s^7. reason: %s",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1009
ADDRGP4 $1006
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2156
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2148
ADDRLP4 2156
INDIRP4
ASGNP4
ADDRGP4 $1010
JUMPV
LABELV $1009
ADDRLP4 2148
ADDRGP4 $71
ASGNP4
LABELV $1010
ADDRGP4 $1005
ARGP4
ADDRLP4 2148
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1011
ADDRLP4 2152
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $1012
JUMPV
LABELV $1011
ADDRLP4 2152
ADDRGP4 $990
ASGNP4
LABELV $1012
ADDRLP4 2152
INDIRP4
ARGP4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 1685
;1682:    ( ent ) ? va( " by %s", ent->client->pers.netname ) : "",
;1683:    ( *reason ) ? reason : "kicked by admin" ) );
;1684:
;1685:  return qtrue;
CNSTI4 1
RETI4
LABELV $973
endproc G_admin_kick 2164 24
export G_admin_ban
proc G_admin_ban 1284 24
line 1689
;1686:}
;1687:
;1688:qboolean G_admin_ban( gentity_t *ent, int skiparg )
;1689:{
line 1696
;1690:  int seconds;
;1691:  char search[ MAX_NAME_LENGTH ];
;1692:  char secs[ MAX_TOKEN_CHARS ];
;1693:  char *reason;
;1694:  int minargc;
;1695:  char duration[ 32 ];
;1696:  int logmatch = -1, logmatches = 0;
ADDRLP4 72
CNSTI4 -1
ASGNI4
ADDRLP4 88
CNSTI4 0
ASGNI4
line 1698
;1697:  int i, j;
;1698:  qboolean exactmatch = qfalse;
ADDRLP4 124
CNSTI4 0
ASGNI4
line 1703
;1699:  char n2[ MAX_NAME_LENGTH ];
;1700:  char s2[ MAX_NAME_LENGTH ];
;1701:  char guid_stub[ 9 ];
;1702:
;1703:  if( G_admin_permission( ent, ADMF_CAN_PERM_BAN ) &&
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1196
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $1014
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 1200
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $1014
line 1705
;1704:       G_admin_permission( ent, ADMF_UNACCOUNTABLE ) )
;1705:  {
line 1706
;1706:    minargc = 2 + skiparg;
ADDRLP4 1192
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1707
;1707:  }
ADDRGP4 $1015
JUMPV
LABELV $1014
line 1708
;1708:  else if( G_admin_permission( ent, ADMF_CAN_PERM_BAN ) ||
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1204
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $1020
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 1208
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1212
CNSTI4 0
ASGNI4
ADDRLP4 1208
INDIRI4
ADDRLP4 1212
INDIRI4
NEI4 $1020
ADDRGP4 g_adminMaxBan+12
INDIRI4
ADDRLP4 1212
INDIRI4
EQI4 $1016
LABELV $1020
line 1711
;1709:           G_admin_permission( ent, ADMF_UNACCOUNTABLE ) ||
;1710:           g_adminMaxBan.integer )
;1711:  {
line 1712
;1712:    minargc = 3 + skiparg;
ADDRLP4 1192
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1713
;1713:  }
ADDRGP4 $1017
JUMPV
LABELV $1016
line 1715
;1714:  else
;1715:  {
line 1716
;1716:    minargc = 4 + skiparg;
ADDRLP4 1192
ADDRFP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 1717
;1717:  }
LABELV $1017
LABELV $1015
line 1718
;1718:  if( G_SayArgc() < minargc )
ADDRLP4 1216
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
ADDRLP4 1192
INDIRI4
GEI4 $1021
line 1719
;1719:  {
line 1720
;1720:    ADMP( "^3!ban: ^7usage: !ban [name|slot|ip] [duration] [reason]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1023
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1721
;1721:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1021
line 1723
;1722:  }
;1723:  G_SayArgv( 1 + skiparg, search, sizeof( search ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 92
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1724
;1724:  G_SanitiseString( search, s2, sizeof( s2 ) );
ADDRLP4 92
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1725
;1725:  G_SayArgv( 2 + skiparg, secs, sizeof( secs ) );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 168
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1727
;1726:
;1727:  seconds = G_admin_parse_time( secs );
ADDRLP4 168
ARGP4
ADDRLP4 1220
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 1220
INDIRI4
ASGNI4
line 1728
;1728:  if( seconds <= 0 )
ADDRLP4 132
INDIRI4
CNSTI4 0
GTI4 $1024
line 1729
;1729:  {
line 1730
;1730:    if( g_adminMaxBan.integer && !G_admin_permission( ent, ADMF_CAN_PERM_BAN) )
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1026
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1224
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $1026
line 1731
;1731:    {
line 1732
;1732:       ADMP( va( "^3!ban: ^7using your admin level's maximum ban length of %s\n",
ADDRGP4 $1029
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1228
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1734
;1733:                 g_adminMaxBan.string ) );
;1734:       seconds = G_admin_parse_time( g_adminMaxBan.string );
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1232
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 1232
INDIRI4
ASGNI4
line 1735
;1735:    }
ADDRGP4 $1027
JUMPV
LABELV $1026
line 1736
;1736:    else if( G_admin_permission( ent, ADMF_CAN_PERM_BAN ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1228
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $1032
line 1737
;1737:    {
line 1738
;1738:      seconds = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 1739
;1739:    }
ADDRGP4 $1033
JUMPV
LABELV $1032
line 1741
;1740:    else
;1741:    {
line 1742
;1742:      ADMP( "^3!ban: ^7you may not issue permanent bans\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1034
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1743
;1743:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1033
LABELV $1027
line 1745
;1744:    }
;1745:    reason = G_SayConcatArgs( 2 + skiparg );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1232
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 1232
INDIRP4
ASGNP4
line 1746
;1746:  }
ADDRGP4 $1025
JUMPV
LABELV $1024
line 1748
;1747:  else
;1748:  {
line 1749
;1749:    if( g_adminMaxBan.integer &&
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1035
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1224
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $1035
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1228
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 1228
INDIRI4
LEI4 $1035
line 1752
;1750:        !G_admin_permission( ent, ADMF_CAN_PERM_BAN ) &&
;1751:        seconds > G_admin_parse_time( g_adminMaxBan.string ) )
;1752:    {
line 1753
;1753:      ADMP( va( "^3!ban: ^7ban length limited to %s for your admin level\n",
ADDRGP4 $1039
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1755
;1754:                g_adminMaxBan.string ) );
;1755:      seconds = G_admin_parse_time( g_adminMaxBan.string );
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1236
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 1236
INDIRI4
ASGNI4
line 1756
;1756:    }
LABELV $1035
line 1757
;1757:    reason = G_SayConcatArgs( 3 + skiparg );
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 1232
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 1232
INDIRP4
ASGNP4
line 1758
;1758:  }
LABELV $1025
line 1760
;1759:
;1760:  for( i = 0; i < MAX_ADMIN_NAMELOGS && g_admin_namelog[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1045
JUMPV
LABELV $1042
line 1761
;1761:  {
line 1763
;1762:    // skip players in the namelog who have already been banned
;1763:    if( g_admin_namelog[ i ]->banned )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1046
line 1764
;1764:      continue;
ADDRGP4 $1043
JUMPV
LABELV $1046
line 1767
;1765:
;1766:    // skip disconnected players when banning on slot number
;1767:    if( g_admin_namelog[ i ]->slot == -1 )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1048
line 1768
;1768:      continue;
ADDRGP4 $1043
JUMPV
LABELV $1048
line 1770
;1769:
;1770:    if( !Q_stricmp( va( "%d", g_admin_namelog[ i ]->slot ), search ) )
ADDRGP4 $1052
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $1050
line 1771
;1771:    {
line 1772
;1772:      logmatches = 1;
ADDRLP4 88
CNSTI4 1
ASGNI4
line 1773
;1773:      logmatch = i;
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
line 1774
;1774:      exactmatch = qtrue;
ADDRLP4 124
CNSTI4 1
ASGNI4
line 1775
;1775:      break;
ADDRGP4 $1044
JUMPV
LABELV $1050
line 1777
;1776:    }
;1777:  }
LABELV $1043
line 1760
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1045
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1053
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1042
LABELV $1053
LABELV $1044
line 1779
;1778:
;1779:  for( i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1057
JUMPV
LABELV $1054
line 1782
;1780:       !exactmatch && i < MAX_ADMIN_NAMELOGS && g_admin_namelog[ i ];
;1781:       i++ )
;1782:  {
line 1784
;1783:    // skip players in the namelog who have already been banned
;1784:    if( g_admin_namelog[ i ]->banned )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1058
line 1785
;1785:      continue;
ADDRGP4 $1055
JUMPV
LABELV $1058
line 1787
;1786:
;1787:    if( !Q_stricmp( g_admin_namelog[ i ]->ip, search ) )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $1060
line 1788
;1788:    {
line 1789
;1789:      logmatches = 1;
ADDRLP4 88
CNSTI4 1
ASGNI4
line 1790
;1790:      logmatch = i;
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
line 1791
;1791:      exactmatch = qtrue;
ADDRLP4 124
CNSTI4 1
ASGNI4
line 1792
;1792:      break;
ADDRGP4 $1056
JUMPV
LABELV $1060
line 1794
;1793:    }
;1794:    for( j = 0; j < MAX_ADMIN_NAMELOG_NAMES &&
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1065
JUMPV
LABELV $1062
line 1796
;1795:       g_admin_namelog[ i ]->name[ j ][ 0 ]; j++ )
;1796:    {
line 1797
;1797:      G_SanitiseString( g_admin_namelog[ i ]->name[ j ], n2, sizeof( n2 ) );
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1798
;1798:      if( strstr( n2, s2 ) )
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 1232
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1066
line 1799
;1799:      {
line 1800
;1800:        if( logmatch != i )
ADDRLP4 72
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1068
line 1801
;1801:          logmatches++;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1068
line 1802
;1802:        logmatch = i;
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
line 1803
;1803:      }
LABELV $1066
line 1804
;1804:    }
LABELV $1063
line 1795
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1065
line 1794
ADDRLP4 1236
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1236
INDIRI4
GEI4 $1070
ADDRLP4 0
INDIRI4
ADDRLP4 1236
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1062
LABELV $1070
line 1805
;1805:  }
LABELV $1055
line 1781
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1057
line 1780
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $1072
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1072
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1054
LABELV $1072
LABELV $1056
line 1807
;1806:
;1807:  if( !logmatches )
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $1073
line 1808
;1808:  {
line 1809
;1809:    ADMP( "^3!ban: ^7no player found by that name, IP, or slot number\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1075
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1810
;1810:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1073
line 1812
;1811:  }
;1812:  if( logmatches > 1 )
ADDRLP4 88
INDIRI4
CNSTI4 1
LEI4 $1076
line 1813
;1813:  {
line 1814
;1814:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 1815
;1815:    ADMBP( "^3!ban: ^7multiple recent clients match name, use IP or slot#:\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1078
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 1816
;1816:    for( i = 0; i < MAX_ADMIN_NAMELOGS && g_admin_namelog[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1082
JUMPV
LABELV $1079
line 1817
;1817:    {
line 1818
;1818:      for( j = 0; j < 8; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1083
line 1819
;1819:        guid_stub[ j ] = g_admin_namelog[ i ]->guid[ j + 24 ];
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $1084
line 1818
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1083
line 1820
;1820:      guid_stub[ j ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
CNSTI1 0
ASGNI1
line 1821
;1821:      for( j = 0; j < MAX_ADMIN_NAMELOG_NAMES &&
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1090
JUMPV
LABELV $1087
line 1823
;1822:         g_admin_namelog[ i ]->name[ j ][ 0 ]; j++ )
;1823:      {
line 1824
;1824:        G_SanitiseString( g_admin_namelog[ i ]->name[ j ], n2, sizeof( n2 ) );
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1825
;1825:        if( strstr( n2, s2 ) )
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 1236
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1091
line 1826
;1826:        {
line 1827
;1827:          if( g_admin_namelog[ i ]->slot > -1 )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $1093
line 1828
;1828:            ADMBP( "^3" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1095
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1093
line 1829
;1829:          ADMBP( va( "%-2s (*%s) %15s ^7'%s^7'\n",
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $1099
ADDRGP4 $1052
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 1244
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1240
ADDRLP4 1244
INDIRP4
ASGNP4
ADDRGP4 $1100
JUMPV
LABELV $1099
ADDRLP4 1240
ADDRGP4 $1097
ASGNP4
LABELV $1100
ADDRGP4 $1096
ARGP4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 1248
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 1248
INDIRP4
ADDP4
ARGP4
ADDRLP4 1252
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 1835
;1830:           ( g_admin_namelog[ i ]->slot > -1 ) ?
;1831:             va( "%d", g_admin_namelog[ i ]->slot ) : "-",
;1832:           guid_stub,
;1833:           g_admin_namelog[ i ]->ip,
;1834:           g_admin_namelog[ i ]->name[ j ] ) );
;1835:        }
LABELV $1091
line 1836
;1836:      }
LABELV $1088
line 1822
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1090
line 1821
ADDRLP4 1240
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1240
INDIRI4
GEI4 $1101
ADDRLP4 0
INDIRI4
ADDRLP4 1240
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1087
LABELV $1101
line 1837
;1837:    }
LABELV $1080
line 1816
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1082
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1102
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1079
LABELV $1102
line 1838
;1838:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 1839
;1839:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1076
line 1842
;1840:  }
;1841:
;1842:  if( ent && !admin_higher_guid( ent->client->pers.guid,
ADDRLP4 1232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1103
ADDRLP4 1232
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 1236
ADDRGP4 admin_higher_guid
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $1103
line 1844
;1843:    g_admin_namelog[ logmatch ]->guid ) )
;1844:  {
line 1846
;1845:
;1846:    ADMP( "^3!ban: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1105
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1848
;1847:      " level than you\n" );
;1848:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1103
line 1850
;1849:  }
;1850:  if( !strcmp( g_admin_namelog[ logmatch ]->ip, "localhost" ) )
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 $1108
ARGP4
ADDRLP4 1240
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $1106
line 1851
;1851:  {
line 1852
;1852:    ADMP( "^3!ban: ^7disconnecting the host would end the game\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1109
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1853
;1853:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1106
line 1856
;1854:  }
;1855:
;1856:  G_admin_duration( ( seconds ) ? seconds : -1,
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $1111
ADDRLP4 1244
ADDRLP4 132
INDIRI4
ASGNI4
ADDRGP4 $1112
JUMPV
LABELV $1111
ADDRLP4 1244
CNSTI4 -1
ASGNI4
LABELV $1112
ADDRLP4 1244
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 1859
;1857:    duration, sizeof( duration ) );
;1858:
;1859:  admin_create_ban( ent,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1248
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRLP4 1248
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 1248
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 admin_create_ban
CALLI4
pop
line 1865
;1860:    g_admin_namelog[ logmatch ]->name[ 0 ],
;1861:    g_admin_namelog[ logmatch ]->guid,
;1862:    g_admin_namelog[ logmatch ]->ip,
;1863:    seconds, reason );
;1864:
;1865:  g_admin_namelog[ logmatch ]->banned = qtrue;
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 240
ADDP4
CNSTI4 1
ASGNI4
line 1867
;1866:
;1867:  if( !g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1113
line 1868
;1868:    ADMP( "^3!ban: ^7WARNING g_admin not set, not saving ban to a file\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1116
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $1114
JUMPV
LABELV $1113
line 1870
;1869:  else
;1870:  if(strlen(g_admin_namelog[ logmatch ]->guid)==0 || strlen(g_admin_namelog[ logmatch ]->ip) )
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 1252
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
EQI4 $1119
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 1256
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $1117
LABELV $1119
line 1871
;1871:      ADMP( "^3!ban: ^7WARNING bot or without GUID or IP cannot write to ban file\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1120
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $1118
JUMPV
LABELV $1117
line 1873
;1872:  else
;1873:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1118
LABELV $1114
line 1875
;1874:
;1875:  if( g_admin_namelog[ logmatch ]->slot == -1 )
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1121
line 1876
;1876:  {
line 1878
;1877:    // client is already disconnected so stop here
;1878:    AP( va( "print \"^3!ban:^7 %s^7 has been banned by %s^7, "
ADDRGP4 $1123
ARGP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1126
ADDRLP4 1260
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1127
JUMPV
LABELV $1126
ADDRLP4 1260
ADDRGP4 $446
ASGNP4
LABELV $1127
ADDRLP4 1260
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1128
ADDRLP4 1264
ADDRLP4 128
INDIRP4
ASGNP4
ADDRGP4 $1129
JUMPV
LABELV $1128
ADDRLP4 1264
ADDRGP4 $914
ASGNP4
LABELV $1129
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1884
;1879:      "duration: %s, reason: %s\n\"",
;1880:      g_admin_namelog[ logmatch ]->name[ 0 ],
;1881:      ( ent ) ? ent->client->pers.netname : "console",
;1882:      duration,
;1883:      ( *reason ) ? reason : "banned by admin" ) );
;1884:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1013
JUMPV
LABELV $1121
line 1887
;1885:  }
;1886:
;1887:  trap_SendServerCommand( g_admin_namelog[ logmatch ]->slot,
ADDRGP4 $1130
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1133
ADDRLP4 1260
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1134
JUMPV
LABELV $1133
ADDRLP4 1260
ADDRGP4 $446
ASGNP4
LABELV $1134
ADDRLP4 1260
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1135
ADDRLP4 1264
ADDRLP4 128
INDIRP4
ASGNP4
ADDRGP4 $1136
JUMPV
LABELV $1135
ADDRLP4 1264
ADDRGP4 $914
ASGNP4
LABELV $1136
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1894
;1888:    va( "disconnect \"You have been banned.\n"
;1889:      "admin:\n%s^7\nduration:\n%s\nreason:\n%s\"",
;1890:      ( ent ) ? ent->client->pers.netname : "console",
;1891:      duration,
;1892:      ( *reason ) ? reason : "banned by admin" ) );
;1893:
;1894:  trap_DropClient(  g_admin_namelog[ logmatch ]->slot,
ADDRGP4 $1137
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1140
ADDRLP4 1272
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1141
JUMPV
LABELV $1140
ADDRLP4 1272
ADDRGP4 $446
ASGNP4
LABELV $1141
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1142
ADDRLP4 1276
ADDRLP4 128
INDIRP4
ASGNP4
ADDRGP4 $1143
JUMPV
LABELV $1142
ADDRLP4 1276
ADDRGP4 $914
ASGNP4
LABELV $1143
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 1280
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 1280
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 1899
;1895:    va( "has been banned by %s^7, duration: %s, reason: %s",
;1896:      ( ent ) ? ent->client->pers.netname : "console",
;1897:      duration,
;1898:      ( *reason ) ? reason : "banned by admin" ) );
;1899:  return qtrue;
CNSTI4 1
RETI4
LABELV $1013
endproc G_admin_ban 1284 24
export G_admin_unban
proc G_admin_unban 56 16
line 1903
;1900:}
;1901:
;1902:qboolean G_admin_unban( gentity_t *ent, int skiparg )
;1903:{
line 1905
;1904:  int bnum;
;1905:  int time = trap_RealTime( NULL );
CNSTP4 0
ARGP4
ADDRLP4 16
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1908
;1906:  char bs[ 5 ];
;1907:
;1908:  if( G_SayArgc() < 2 + skiparg )
ADDRLP4 20
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1145
line 1909
;1909:  {
line 1910
;1910:    ADMP( "^3!unban: ^7usage: !unban [ban#]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1147
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1911
;1911:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1144
JUMPV
LABELV $1145
line 1913
;1912:  }
;1913:  G_SayArgv( 1 + skiparg, bs, sizeof( bs ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1914
;1914:  bnum = atoi( bs );
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 1915
;1915:  if( bnum < 1 || bnum > MAX_ADMIN_BANS || !g_admin_bans[ bnum - 1 ] )
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1152
ADDRLP4 0
INDIRI4
CNSTI4 1024
GTI4 $1152
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1148
LABELV $1152
line 1916
;1916:  {
line 1917
;1917:    ADMP( "^3!unban: ^7invalid ban#\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1153
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1918
;1918:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1144
JUMPV
LABELV $1148
line 1920
;1919:  }
;1920:  if( g_admin_bans[ bnum - 1 ]->expires == 0 &&
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1154
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 32
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1154
line 1922
;1921:    !G_admin_permission( ent, ADMF_CAN_PERM_BAN ) )
;1922:  {
line 1923
;1923:    ADMP( "^3!unban: ^7you cannot remove permanent bans\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1157
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1924
;1924:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1144
JUMPV
LABELV $1154
line 1926
;1925:  }
;1926:  if( g_adminMaxBan.integer &&
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1158
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 36
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1158
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 40
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
LEI4 $1158
line 1929
;1927:      !G_admin_permission( ent, ADMF_CAN_PERM_BAN ) &&
;1928:      g_admin_bans[ bnum - 1 ]->expires - time > G_admin_parse_time( g_adminMaxBan.string ) )
;1929:  {
line 1930
;1930:    ADMP( va( "^3!unban: ^7your admin level cannot remove bans longer than %s\n",
ADDRGP4 $1163
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1932
;1931:              g_adminMaxBan.string ) );
;1932:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1144
JUMPV
LABELV $1158
line 1934
;1933:  }
;1934:  g_admin_bans[ bnum - 1 ]->expires = time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1935
;1935:  AP( va( "print \"^3!unban: ^7ban #%d for %s^7 has been removed by %s\n\"",
ADDRGP4 $1166
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1169
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1170
JUMPV
LABELV $1169
ADDRLP4 44
ADDRGP4 $446
ASGNP4
LABELV $1170
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1939
;1936:          bnum,
;1937:          g_admin_bans[ bnum - 1 ]->name,
;1938:          ( ent ) ? ent->client->pers.netname : "console" ) );
;1939:  if( g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1171
line 1940
;1940:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1171
line 1941
;1941:  return qtrue;
CNSTI4 1
RETI4
LABELV $1144
endproc G_admin_unban 56 16
lit
align 1
LABELV $1175
byte 1 0
skip 31
export G_admin_adjustban
code
proc G_admin_adjustban 1156 36
line 1945
;1942:}
;1943:
;1944:qboolean G_admin_adjustban( gentity_t *ent, int skiparg )
;1945:{
line 1949
;1946:  int bnum;
;1947:  int length;
;1948:  int expires;
;1949:  int time = trap_RealTime( NULL );
CNSTP4 0
ARGP4
ADDRLP4 1088
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1088
INDIRI4
ASGNI4
line 1950
;1950:  char duration[ 32 ] = {""};
ADDRLP4 1045
ADDRGP4 $1175
INDIRB
ASGNB 32
line 1954
;1951:  char *reason;
;1952:  char bs[ 5 ];
;1953:  char secs[ MAX_TOKEN_CHARS ];
;1954:  char mode = '\0';
ADDRLP4 1044
CNSTI1 0
ASGNI1
line 1957
;1955:  g_admin_ban_t *ban;
;1956:
;1957:  if( G_SayArgc() < 3 + skiparg )
ADDRLP4 1092
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1176
line 1958
;1958:  {
line 1959
;1959:    ADMP( "^3!adjustban: ^7usage: !adjustban [ban#] [duration] [reason]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1178
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1960
;1960:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1176
line 1962
;1961:  }
;1962:  G_SayArgv( 1 + skiparg, bs, sizeof( bs ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1077
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1963
;1963:  bnum = atoi( bs );
ADDRLP4 1077
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1096
INDIRI4
ASGNI4
line 1964
;1964:  if( bnum < 1 || bnum > MAX_ADMIN_BANS || !g_admin_bans[ bnum - 1 ] )
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1183
ADDRLP4 4
INDIRI4
CNSTI4 1024
GTI4 $1183
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1179
LABELV $1183
line 1965
;1965:  {
line 1966
;1966:    ADMP( "^3!adjustban: ^7invalid ban#\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1184
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1967
;1967:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1179
line 1969
;1968:  }
;1969:  ban = g_admin_bans[ bnum - 1 ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
ASGNP4
line 1970
;1970:  if( ban->expires == 0 && !G_admin_permission( ent, ADMF_CAN_PERM_BAN ) )
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1186
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1104
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1186
line 1971
;1971:  {
line 1972
;1972:    ADMP( "^3!adjustban: ^7you cannot modify permanent bans\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1188
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1973
;1973:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1186
line 1975
;1974:  }
;1975:  if( g_adminMaxBan.integer &&
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1189
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1108
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1189
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1112
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 1040
INDIRI4
SUBI4
ADDRLP4 1112
INDIRI4
LEI4 $1189
line 1978
;1976:      !G_admin_permission( ent, ADMF_CAN_PERM_BAN ) &&
;1977:      ban->expires - time > G_admin_parse_time( g_adminMaxBan.string ) )
;1978:  {
line 1979
;1979:    ADMP( va( "^3!adjustban: ^7your admin level cannot modify bans longer than %s\n",
ADDRGP4 $1193
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1981
;1980:              g_adminMaxBan.string ) );
;1981:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1189
line 1983
;1982:  }
;1983:  G_SayArgv( 2 + skiparg, secs, sizeof( secs ) );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1984
;1984:  if( secs[ 0 ] == '+' || secs[ 0 ] == '-' )
ADDRLP4 1116
ADDRLP4 12
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 43
EQI4 $1197
ADDRLP4 1116
INDIRI4
CNSTI4 45
NEI4 $1195
LABELV $1197
line 1985
;1985:    mode = secs[ 0 ];
ADDRLP4 1044
ADDRLP4 12
INDIRI1
ASGNI1
LABELV $1195
line 1986
;1986:  length = G_admin_parse_time( &secs[ mode ? 1 : 0 ] );
ADDRLP4 1044
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1199
ADDRLP4 1120
CNSTI4 1
ASGNI4
ADDRGP4 $1200
JUMPV
LABELV $1199
ADDRLP4 1120
CNSTI4 0
ASGNI4
LABELV $1200
ADDRLP4 1120
INDIRI4
ADDRLP4 12
ADDP4
ARGP4
ADDRLP4 1124
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1124
INDIRI4
ASGNI4
line 1987
;1987:  if( length < 0 )
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $1201
line 1988
;1988:    skiparg--;
ADDRFP4 4
ADDRFP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1202
JUMPV
LABELV $1201
line 1990
;1989:  else
;1990:  {
line 1991
;1991:    if( length )
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $1203
line 1992
;1992:    {
line 1993
;1993:      if( ban->expires == 0 && mode )
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $1205
ADDRLP4 1044
INDIRI1
CVII4 1
ADDRLP4 1128
INDIRI4
EQI4 $1205
line 1994
;1994:      {
line 1995
;1995:        ADMP( "^3!adjustban: ^7new duration must be explicit\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1207
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1996
;1996:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1205
line 1998
;1997:      }
;1998:      if( mode == '+' )
ADDRLP4 1044
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $1208
line 1999
;1999:        expires = ban->expires + length;
ADDRLP4 1084
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $1209
JUMPV
LABELV $1208
line 2000
;2000:      else if( mode == '-' )
ADDRLP4 1044
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $1210
line 2001
;2001:        expires = ban->expires - length;
ADDRLP4 1084
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $1211
JUMPV
LABELV $1210
line 2003
;2002:      else
;2003:        expires = time + length;
ADDRLP4 1084
ADDRLP4 1040
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
LABELV $1211
LABELV $1209
line 2004
;2004:      if( expires <= time )
ADDRLP4 1084
INDIRI4
ADDRLP4 1040
INDIRI4
GTI4 $1212
line 2005
;2005:      {
line 2006
;2006:        ADMP( "^3!adjustban: ^7ban duration must be positive\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1214
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2007
;2007:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1212
line 2009
;2008:      }
;2009:      if( g_adminMaxBan.integer &&
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1204
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1132
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1204
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1136
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
ADDRLP4 1040
INDIRI4
SUBI4
ADDRLP4 1136
INDIRI4
LEI4 $1204
line 2012
;2010:          !G_admin_permission( ent, ADMF_CAN_PERM_BAN ) &&
;2011:          expires - time > G_admin_parse_time( g_adminMaxBan.string ) )
;2012:      {
line 2013
;2013:        ADMP( va( "^3!adjustban: ^7ban length is limited to %s for your admin level\n",
ADDRGP4 $1219
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2015
;2014:                  g_adminMaxBan.string ) );
;2015:        length = G_admin_parse_time( g_adminMaxBan.string );
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1144
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1144
INDIRI4
ASGNI4
line 2016
;2016:        expires = time + length;
ADDRLP4 1084
ADDRLP4 1040
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 2017
;2017:      }
line 2018
;2018:    }
ADDRGP4 $1204
JUMPV
LABELV $1203
line 2019
;2019:    else if( G_admin_permission( ent, ADMF_CAN_PERM_BAN ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 1128
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $1222
line 2020
;2020:      expires = 0;
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRGP4 $1223
JUMPV
LABELV $1222
line 2022
;2021:    else
;2022:    {
line 2023
;2023:      ADMP( "^3!adjustban: ^7ban duration must be positive\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1214
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2024
;2024:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1174
JUMPV
LABELV $1223
LABELV $1204
line 2027
;2025:    }
;2026:
;2027:    ban->expires = expires;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 2028
;2028:    G_admin_duration( ( expires ) ? expires - time : -1, duration,
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1225
ADDRLP4 1132
ADDRLP4 1084
INDIRI4
ADDRLP4 1040
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $1226
JUMPV
LABELV $1225
ADDRLP4 1132
CNSTI4 -1
ASGNI4
LABELV $1226
ADDRLP4 1132
INDIRI4
ARGI4
ADDRLP4 1045
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 2030
;2029:      sizeof( duration ) );
;2030:  }
LABELV $1202
line 2031
;2031:  reason = G_SayConcatArgs( 3 + skiparg );
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 1128
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1128
INDIRP4
ASGNP4
line 2032
;2032:  if( *reason )
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1227
line 2033
;2033:    Q_strncpyz( ban->reason, reason, sizeof( ban->reason ) );
ADDRLP4 0
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1227
line 2034
;2034:  AP( va( "print \"^3!adjustban: ^7ban #%d for %s^7 has been updated by %s^7 "
ADDRGP4 $1229
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1237
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1238
JUMPV
LABELV $1237
ADDRLP4 1132
ADDRGP4 $446
ASGNP4
LABELV $1238
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
CNSTI4 0
LTI4 $1239
ADDRLP4 1136
ADDRGP4 $1231
ASGNP4
ADDRGP4 $1240
JUMPV
LABELV $1239
ADDRLP4 1136
ADDRGP4 $71
ASGNP4
LABELV $1240
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1045
ARGP4
ADDRLP4 1148
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 1148
INDIRI4
LTI4 $1241
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1148
INDIRI4
EQI4 $1241
ADDRLP4 1140
ADDRGP4 $1233
ASGNP4
ADDRGP4 $1242
JUMPV
LABELV $1241
ADDRLP4 1140
ADDRGP4 $71
ASGNP4
LABELV $1242
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1243
ADDRLP4 1144
ADDRGP4 $1235
ASGNP4
ADDRGP4 $1244
JUMPV
LABELV $1243
ADDRLP4 1144
ADDRGP4 $71
ASGNP4
LABELV $1244
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2044
;2035:    "%s%s%s%s%s\n\"",
;2036:    bnum,
;2037:    ban->name,
;2038:    ( ent ) ? ent->client->pers.netname : "console",
;2039:    ( length >= 0 ) ? "duration: " : "",
;2040:    duration,
;2041:    ( length >= 0 && *reason ) ? ", " : "",
;2042:    ( *reason ) ? "reason: " : "",
;2043:    reason ) );
;2044:  if( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1245
line 2045
;2045:    Q_strncpyz( ban->banner, ent->client->pers.netname, sizeof( ban->banner ) );
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1245
line 2046
;2046:  if( g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1247
line 2047
;2047:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1247
line 2048
;2048:  return qtrue;
CNSTI4 1
RETI4
LABELV $1174
endproc G_admin_adjustban 1156 36
export G_admin_putteam
proc G_admin_putteam 2152 16
line 2052
;2049:}
;2050:
;2051:qboolean G_admin_putteam( gentity_t *ent, int skiparg )
;2052:{
line 2057
;2053:  int pids[ MAX_CLIENTS ], found;
;2054:  //KK-OAPub Changed Team Name Length so "Spectator" doesn't crash Game
;2055:  char name[ MAX_NAME_LENGTH ], team[ MAX_NAME_LENGTH ], err[ MAX_STRING_CHARS ];
;2056:  gentity_t *vic;
;2057:  team_t teamnum = TEAM_NONE;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 2059
;2058:
;2059:  G_SayArgv( 1 + skiparg, name, sizeof( name ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1064
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2060
;2060:  G_SayArgv( 2 + skiparg, team, sizeof( team ) );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2061
;2061:  if( G_SayArgc() < 3 + skiparg )
ADDRLP4 2124
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1251
line 2062
;2062:  {
line 2063
;2063:    ADMP( "^3!putteam: ^7usage: !putteam [name] [h|a|s]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1253
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2064
;2064:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1250
JUMPV
LABELV $1251
line 2067
;2065:  }
;2066:
;2067:  if( ( found = G_ClientNumbersFromString( name, pids, MAX_CLIENTS ) ) != 1 )
ADDRLP4 1064
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2128
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 2128
INDIRI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 1
EQI4 $1254
line 2068
;2068:  {
line 2069
;2069:    G_MatchOnePlayer( pids, found, err, sizeof( err ) );
ADDRLP4 40
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1100
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 2070
;2070:    ADMP( va( "^3!putteam: ^7%s\n", err ) );
ADDRGP4 $1256
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 2132
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2132
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2071
;2071:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1250
JUMPV
LABELV $1254
line 2073
;2072:  }
;2073:  if( !admin_higher( ent, &g_entities[ pids[ 0 ] ] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2492
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 2132
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 0
NEI4 $1257
line 2074
;2074:  {
line 2075
;2075:    ADMP( "^3!putteam: ^7sorry, but your intended victim has a higher "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1259
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2077
;2076:        " admin level than you\n" );
;2077:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1250
JUMPV
LABELV $1257
line 2079
;2078:  }
;2079:  vic = &g_entities[ pids[ 0 ] ];
ADDRLP4 36
CNSTI4 2492
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2080
;2080:  teamnum = G_TeamFromString( team );
ADDRLP4 4
ARGP4
ADDRLP4 2136
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2136
INDIRI4
ASGNI4
line 2081
;2081:  if( teamnum == TEAM_NUM_TEAMS )
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1260
line 2082
;2082:  {
line 2083
;2083:    ADMP( va( "^3!putteam: ^7unknown team %s\n", team ) );
ADDRGP4 $1262
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2140
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2140
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2084
;2084:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1250
JUMPV
LABELV $1260
line 2086
;2085:  }
;2086:  if( vic->client->sess.sessionTeam == teamnum )
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1263
line 2087
;2087:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1250
JUMPV
LABELV $1263
line 2089
;2088:  
;2089:  SetTeam( vic, team );
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 2091
;2090:
;2091:  AP( va( "print \"^3!putteam: ^7%s^7 put %s^7 on to the %s team\n\"",
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2144
ADDRGP4 BG_TeamName
CALLP4
ASGNP4
ADDRGP4 $1265
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1267
ADDRLP4 2140
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1268
JUMPV
LABELV $1267
ADDRLP4 2140
ADDRGP4 $446
ASGNP4
LABELV $1268
ADDRLP4 2140
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2144
INDIRP4
ARGP4
ADDRLP4 2148
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2148
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2094
;2092:          ( ent ) ? ent->client->pers.netname : "console",
;2093:          vic->client->pers.netname, BG_TeamName( teamnum ) ) );
;2094:  return qtrue;
CNSTI4 1
RETI4
LABELV $1250
endproc G_admin_putteam 2152 16
export G_admin_map
proc G_admin_map 88 12
line 2100
;2095:}
;2096:
;2097://KK-Fixed!!!!
;2098://KK-Removed Layouts from The command
;2099:qboolean G_admin_map( gentity_t *ent, int skiparg )
;2100:{
line 2103
;2101:  char map[ MAX_QPATH ];
;2102:
;2103:  if( G_SayArgc( ) < 2 + skiparg )
ADDRLP4 64
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1270
line 2104
;2104:  {
line 2105
;2105:    ADMP( "^3!map: ^7usage: !map [map] (layout)\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1272
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2106
;2106:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1269
JUMPV
LABELV $1270
line 2109
;2107:  }
;2108:
;2109:  G_SayArgv( skiparg + 1, map, sizeof( map ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2111
;2110:
;2111:  if( !trap_FS_FOpenFile( va( "maps/%s.bsp", map ), NULL, FS_READ ) )
ADDRGP4 $1275
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1273
line 2112
;2112:  {
line 2113
;2113:    ADMP( va( "^3!map: ^7invalid map name '%s'\n", map ) );
ADDRGP4 $1276
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2114
;2114:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1269
JUMPV
LABELV $1273
line 2117
;2115:  }
;2116:
;2117:  trap_SendConsoleCommand( EXEC_APPEND, va( "map %s", map ) );
ADDRGP4 $1277
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2118
;2118:  level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 2119
;2119:  AP( va( "print \"^3!map: ^7map '%s' started by %s\n\"", map,
ADDRGP4 $1279
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1281
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1282
JUMPV
LABELV $1281
ADDRLP4 80
ADDRGP4 $446
ASGNP4
LABELV $1282
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2121
;2120:          ( ent ) ? ent->client->pers.netname : "console" ) );
;2121:  return qtrue;
CNSTI4 1
RETI4
LABELV $1269
endproc G_admin_map 88 12
export G_admin_mute
proc G_admin_mute 2140 16
line 2125
;2122:}
;2123:
;2124:qboolean G_admin_mute( gentity_t *ent, int skiparg )
;2125:{
line 2131
;2126:  int pids[ MAX_CLIENTS ], found;
;2127:  char name[ MAX_NAME_LENGTH ], err[ MAX_STRING_CHARS ];
;2128:  char command[ MAX_ADMIN_CMD_LEN ], *cmd;
;2129:  gentity_t *vic;
;2130:
;2131:  G_SayArgv( skiparg, command, sizeof( command ) );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2132
;2132:  cmd = command;
ADDRLP4 0
ADDRLP4 1064
ASGNP4
line 2133
;2133:  if( cmd && *cmd == '!' )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1284
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $1284
line 2134
;2134:    cmd++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1284
line 2135
;2135:  if( G_SayArgc() < 2 + skiparg )
ADDRLP4 2116
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1286
line 2136
;2136:  {
line 2137
;2137:    ADMP( va( "^3!%s: ^7usage: !%s [name|slot#]\n", cmd, cmd ) );
ADDRGP4 $1288
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2138
;2138:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1283
JUMPV
LABELV $1286
line 2140
;2139:  }
;2140:  G_SayArgv( 1 + skiparg, name, sizeof( name ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2141
;2141:  if( ( found = G_ClientNumbersFromString( name, pids, MAX_CLIENTS ) ) != 1 )
ADDRLP4 1032
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2120
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1084
ADDRLP4 2120
INDIRI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 1
EQI4 $1289
line 2142
;2142:  {
line 2143
;2143:    G_MatchOnePlayer( pids, found, err, sizeof( err ) );
ADDRLP4 4
ARGP4
ADDRLP4 1084
INDIRI4
ARGI4
ADDRLP4 1088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 2144
;2144:    ADMP( va( "^3!%s: ^7%s\n", cmd, err ) );
ADDRGP4 $1291
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2145
;2145:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1283
JUMPV
LABELV $1289
line 2147
;2146:  }
;2147:  if( !admin_higher( ent, &g_entities[ pids[ 0 ] ] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 2124
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 0
NEI4 $1292
line 2148
;2148:  {
line 2149
;2149:    ADMP( va( "^3!%s: ^7sorry, but your intended victim has a higher admin"
ADDRGP4 $1294
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2151
;2150:        " level than you\n", cmd ) );
;2151:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1283
JUMPV
LABELV $1292
line 2153
;2152:  }
;2153:  vic = &g_entities[ pids[ 0 ] ];
ADDRLP4 1028
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2154
;2154:  if( vic->client->pers.muted == qtrue )
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1295
line 2155
;2155:  {
line 2156
;2156:    if( !Q_stricmp( cmd, "mute" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 2128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
NEI4 $1297
line 2157
;2157:    {
line 2158
;2158:      ADMP( "^3!mute: ^7player is already muted\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1299
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2159
;2159:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1283
JUMPV
LABELV $1297
line 2161
;2160:    }
;2161:    vic->client->pers.muted = qfalse;
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 0
ASGNI4
line 2162
;2162:    CPx( pids[ 0 ], "cp \"^1You have been unmuted\"" );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $1300
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2163
;2163:    AP( va( "print \"^3!unmute: ^7%s^7 has been unmuted by %s\n\"",
ADDRGP4 $1301
ARGP4
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1303
ADDRLP4 2132
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1304
JUMPV
LABELV $1303
ADDRLP4 2132
ADDRGP4 $446
ASGNP4
LABELV $1304
ADDRLP4 2132
INDIRP4
ARGP4
ADDRLP4 2136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2136
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2166
;2164:            vic->client->pers.netname,
;2165:            ( ent ) ? ent->client->pers.netname : "console" ) );
;2166:  }
ADDRGP4 $1296
JUMPV
LABELV $1295
line 2168
;2167:  else
;2168:  {
line 2169
;2169:    if( !Q_stricmp( cmd, "unmute" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 2128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
NEI4 $1305
line 2170
;2170:    {
line 2171
;2171:      ADMP( "^3!unmute: ^7player is not currently muted\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1307
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2172
;2172:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1283
JUMPV
LABELV $1305
line 2174
;2173:    }
;2174:    vic->client->pers.muted = qtrue;
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 1
ASGNI4
line 2175
;2175:    CPx( pids[ 0 ], "cp \"^1You've been muted\"" );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $1308
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2176
;2176:    AP( va( "print \"^3!mute: ^7%s^7 has been muted by ^7%s\n\"",
ADDRGP4 $1309
ARGP4
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1311
ADDRLP4 2132
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1312
JUMPV
LABELV $1311
ADDRLP4 2132
ADDRGP4 $446
ASGNP4
LABELV $1312
ADDRLP4 2132
INDIRP4
ARGP4
ADDRLP4 2136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2136
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2179
;2177:            vic->client->pers.netname,
;2178:            ( ent ) ? ent->client->pers.netname : "console" ) );
;2179:  }
LABELV $1296
line 2180
;2180:  return qtrue;
CNSTI4 1
RETI4
LABELV $1283
endproc G_admin_mute 2140 16
lit
align 1
LABELV $1314
byte 1 0
skip 31
align 1
LABELV $1315
byte 1 0
skip 31
export G_admin_listadmins
code
proc G_admin_listadmins 116 16
line 2186
;2181:}
;2182:
;2183:
;2184:
;2185:qboolean G_admin_listadmins( gentity_t *ent, int skiparg )
;2186:{
line 2187
;2187:  int i, found = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 2188
;2188:  char search[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 48
ADDRGP4 $1314
INDIRB
ASGNB 32
line 2189
;2189:  char s[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 4
ADDRGP4 $1315
INDIRB
ASGNB 32
line 2190
;2190:  int start = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 2191
;2191:  qboolean numeric = qtrue;
ADDRLP4 44
CNSTI4 1
ASGNI4
line 2192
;2192:  int drawn = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 2194
;2193:
;2194:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1319
JUMPV
LABELV $1316
line 2195
;2195:  {
line 2196
;2196:    if( g_admin_admins[ i ]->level == 0 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1320
line 2197
;2197:      continue;
ADDRGP4 $1317
JUMPV
LABELV $1320
line 2198
;2198:    found++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2199
;2199:  }
LABELV $1317
line 2194
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1319
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1322
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1316
LABELV $1322
line 2200
;2200:  if( !found )
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1323
line 2201
;2201:  {
line 2202
;2202:    ADMP( "^3!listadmins: ^7no admins defined\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1325
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2203
;2203:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1313
JUMPV
LABELV $1323
line 2206
;2204:  }
;2205:
;2206:  if( G_SayArgc() == 2 + skiparg )
ADDRLP4 88
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
NEI4 $1326
line 2207
;2207:  {
line 2208
;2208:    G_SayArgv( 1 + skiparg, s, sizeof( s ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2209
;2209:    for( i = 0; i < sizeof( s ) && s[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1331
JUMPV
LABELV $1328
line 2210
;2210:    {
line 2211
;2211:      if( isdigit( s[ i ] ) )
ADDRLP4 92
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 48
LTI4 $1332
ADDRLP4 92
INDIRI4
CNSTI4 57
GTI4 $1332
line 2212
;2212:        continue;
ADDRGP4 $1329
JUMPV
LABELV $1332
line 2213
;2213:      numeric = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 2214
;2214:    }
LABELV $1329
line 2209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1331
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $1334
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1328
LABELV $1334
line 2215
;2215:    if( numeric )
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1335
line 2216
;2216:    {
line 2217
;2217:      start = atoi( s );
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 96
INDIRI4
ASGNI4
line 2218
;2218:      if( start > 0 )
ADDRLP4 40
INDIRI4
CNSTI4 0
LEI4 $1337
line 2219
;2219:        start -= 1;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1336
JUMPV
LABELV $1337
line 2220
;2220:      else if( start < 0 )
ADDRLP4 40
INDIRI4
CNSTI4 0
GEI4 $1336
line 2221
;2221:        start = found + start;
ADDRLP4 40
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ASGNI4
line 2222
;2222:    }
ADDRGP4 $1336
JUMPV
LABELV $1335
line 2224
;2223:    else
;2224:      G_SanitiseString( s, search, sizeof( search ) );
ADDRLP4 4
ARGP4
ADDRLP4 48
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
LABELV $1336
line 2225
;2225:  }
LABELV $1326
line 2227
;2226:
;2227:  if( start >= found || start < 0 )
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
GEI4 $1343
ADDRLP4 40
INDIRI4
CNSTI4 0
GEI4 $1341
LABELV $1343
line 2228
;2228:    start = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $1341
line 2230
;2229:
;2230:  if( start >= found )
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $1344
line 2231
;2231:  {
line 2232
;2232:    ADMP( va( "^3!listadmins: ^7listing %d admins\n", found ) );
ADDRGP4 $1346
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2233
;2233:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1313
JUMPV
LABELV $1344
line 2236
;2234:  }
;2235:
;2236:  drawn = admin_listadmins( ent, start, search );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 96
ADDRGP4 admin_listadmins
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 96
INDIRI4
ASGNI4
line 2238
;2237:
;2238:  if( search[ 0 ] )
ADDRLP4 48
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1347
line 2239
;2239:  {
line 2240
;2240:    ADMP( va( "^3!listadmins:^7 found %d admins matching '%s^7'\n",
ADDRGP4 $1349
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2242
;2241:      drawn, search ) );
;2242:  }
ADDRGP4 $1348
JUMPV
LABELV $1347
line 2244
;2243:  else
;2244:  {
line 2245
;2245:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2246
;2246:    ADMBP( va( "^3!listadmins:^7 showing admin %d - %d of %d.  ",
ADDRGP4 $1350
ARGP4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1353
ADDRLP4 100
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $1354
JUMPV
LABELV $1353
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1354
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 20
ADDI4
ADDRLP4 36
INDIRI4
LEI4 $1355
ADDRLP4 104
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $1356
JUMPV
LABELV $1355
ADDRLP4 104
ADDRLP4 40
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $1356
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2251
;2247:      ( found ) ? ( start + 1 ) : 0,
;2248:      ( ( start + MAX_ADMIN_LISTITEMS ) > found ) ?
;2249:       found : ( start + MAX_ADMIN_LISTITEMS ),
;2250:      found ) );
;2251:    if( ( start + MAX_ADMIN_LISTITEMS ) < found )
ADDRLP4 40
INDIRI4
CNSTI4 20
ADDI4
ADDRLP4 36
INDIRI4
GEI4 $1357
line 2252
;2252:    {
line 2253
;2253:      ADMBP( va( "run '!listadmins %d' to see more",
ADDRGP4 $1359
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 20
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2255
;2254:        ( start + MAX_ADMIN_LISTITEMS + 1 ) ) );
;2255:    }
LABELV $1357
line 2256
;2256:    ADMBP( "\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2257
;2257:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2258
;2258:  }
LABELV $1348
line 2259
;2259:  return qtrue;
CNSTI4 1
RETI4
LABELV $1313
endproc G_admin_listadmins 116 16
lit
align 1
LABELV $1361
byte 1 0
skip 31
align 1
LABELV $1362
byte 1 0
skip 31
align 1
LABELV $1363
byte 1 0
skip 31
export G_admin_listplayers
code
proc G_admin_listplayers 196 48
line 2264
;2260:}
;2261:
;2262:
;2263:qboolean G_admin_listplayers( gentity_t *ent, int skiparg )
;2264:{
line 2268
;2265:  int i, j;
;2266:  gclient_t *p;
;2267:  char c[ 3 ], t[ 2 ]; // color and team letter
;2268:  char n[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 92
ADDRGP4 $1361
INDIRB
ASGNB 32
line 2269
;2269:  char n2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 124
ADDRGP4 $1362
INDIRB
ASGNB 32
line 2270
;2270:  char n3[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 12
ADDRGP4 $1363
INDIRB
ASGNB 32
line 2276
;2271:  char lname[ MAX_NAME_LENGTH ];
;2272:  char guid_stub[ 9 ];
;2273:  char muted[ 2 ];
;2274:  int l;
;2275:
;2276:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2277
;2277:  ADMBP( va( "^3!listplayers: ^7%d players connected:\n",
ADDRGP4 $1364
ARGP4
ADDRGP4 level+72
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2279
;2278:    level.numConnectedClients ) );
;2279:  for( i = 0; i < level.maxclients; i++ )
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 $1369
JUMPV
LABELV $1366
line 2280
;2280:  {
line 2281
;2281:    p = &level.clients[ i ];
ADDRLP4 4
CNSTI4 2324
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2282
;2282:    Q_strncpyz( t, "S", sizeof( t ) );
ADDRLP4 159
ARGP4
ADDRGP4 $150
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2283
;2283:    Q_strncpyz( c, S_COLOR_YELLOW, sizeof( c ) );
ADDRLP4 156
ARGP4
ADDRGP4 $1095
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2284
;2284:    if( p->sess.sessionTeam == TEAM_BLUE )
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1371
line 2285
;2285:    {
line 2286
;2286:      Q_strncpyz( t, "B", sizeof( t ) );
ADDRLP4 159
ARGP4
ADDRGP4 $143
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2287
;2287:      Q_strncpyz( c, S_COLOR_BLUE, sizeof( c ) );
ADDRLP4 156
ARGP4
ADDRGP4 $1373
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2288
;2288:    }
ADDRGP4 $1372
JUMPV
LABELV $1371
line 2289
;2289:    else if( p->sess.sessionTeam == TEAM_RED )
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1374
line 2290
;2290:    {
line 2291
;2291:      Q_strncpyz( t, "R", sizeof( t ) );
ADDRLP4 159
ARGP4
ADDRGP4 $1376
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2292
;2292:      Q_strncpyz( c, S_COLOR_RED, sizeof( c ) );
ADDRLP4 156
ARGP4
ADDRGP4 $1377
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2293
;2293:    }
ADDRGP4 $1375
JUMPV
LABELV $1374
line 2294
;2294:    else if( p->sess.sessionTeam == TEAM_FREE )
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1378
line 2295
;2295:    {
line 2296
;2296:      Q_strncpyz( t, "F", sizeof( t ) );
ADDRLP4 159
ARGP4
ADDRGP4 $1380
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2297
;2297:      Q_strncpyz( c, S_COLOR_GREEN, sizeof( c ) );
ADDRLP4 156
ARGP4
ADDRGP4 $1381
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2298
;2298:    }
ADDRGP4 $1379
JUMPV
LABELV $1378
line 2299
;2299:    else if( p->sess.sessionTeam == TEAM_NONE )
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1382
line 2300
;2300:    {
line 2301
;2301:      Q_strncpyz( t, "S", sizeof( t ) );
ADDRLP4 159
ARGP4
ADDRGP4 $150
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2302
;2302:      Q_strncpyz( c, S_COLOR_WHITE, sizeof( c ) );
ADDRLP4 156
ARGP4
ADDRGP4 $1384
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2303
;2303:    }
LABELV $1382
LABELV $1379
LABELV $1375
LABELV $1372
line 2304
;2304:    if( p->pers.connected == CON_CONNECTING )
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1385
line 2305
;2305:    {
line 2306
;2306:      Q_strncpyz( t, "C", sizeof( t ) );
ADDRLP4 159
ARGP4
ADDRGP4 $157
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2307
;2307:      Q_strncpyz( c, S_COLOR_CYAN, sizeof( c ) );
ADDRLP4 156
ARGP4
ADDRGP4 $1387
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2308
;2308:    }
ADDRGP4 $1386
JUMPV
LABELV $1385
line 2309
;2309:    else if( p->pers.connected != CON_CONNECTED )
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1388
line 2310
;2310:    {
line 2311
;2311:      continue;
ADDRGP4 $1367
JUMPV
LABELV $1388
LABELV $1386
line 2314
;2312:    }
;2313:
;2314:    for( j = 0; j < 8; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1390
line 2315
;2315:        guid_stub[ j ] = p->pers.guid[ j + 24 ];
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $1391
line 2314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1390
line 2316
;2316:        guid_stub[ j ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
CNSTI1 0
ASGNI1
line 2318
;2317:
;2318:    muted[ 0 ] = '\0';
ADDRLP4 161
CNSTI1 0
ASGNI1
line 2319
;2319:    if( p->pers.muted )
ADDRLP4 4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1394
line 2320
;2320:    {
line 2321
;2321:      Q_strncpyz( muted, "M", sizeof( muted ) );
ADDRLP4 161
ARGP4
ADDRGP4 $105
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2322
;2322:    }
LABELV $1394
line 2325
;2323:    //Put DisOriented Junk Here!!!
;2324:
;2325:    l = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2326
;2326:    G_SanitiseString( p->pers.netname, n2, sizeof( n2 ) );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2327
;2327:    n[ 0 ] = '\0';
ADDRLP4 92
CNSTI1 0
ASGNI1
line 2328
;2328:    for( j = 0; j < MAX_ADMIN_ADMINS && g_admin_admins[ j ]; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1399
JUMPV
LABELV $1396
line 2329
;2329:    {
line 2330
;2330:      if( !Q_stricmp( g_admin_admins[ j ]->guid, p->pers.guid ) )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
NEI4 $1400
line 2331
;2331:      {
line 2333
;2332:        // don't gather aka or level info if the admin is incognito
;2333:        if( ent && G_admin_permission( &g_entities[ i ], ADMF_INCOGNITO ) )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1402
CNSTI4 2492
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 176
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $1402
line 2334
;2334:        {
line 2335
;2335:          break;
ADDRGP4 $1398
JUMPV
LABELV $1402
line 2337
;2336:        }
;2337:        l = g_admin_admins[ j ]->level;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 2338
;2338:        G_SanitiseString( g_admin_admins[ j ]->name, n3, sizeof( n3 ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2339
;2339:        if( Q_stricmp( n2, n3 ) )
ADDRLP4 124
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $1398
line 2340
;2340:        {
line 2341
;2341:          Q_strncpyz( n, g_admin_admins[ j ]->name, sizeof( n ) );
ADDRLP4 92
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2342
;2342:        }
line 2343
;2343:        break;
ADDRGP4 $1398
JUMPV
LABELV $1400
line 2345
;2344:      }
;2345:    }
LABELV $1397
line 2328
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1399
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1406
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1396
LABELV $1406
LABELV $1398
line 2346
;2346:    lname[ 0 ] = '\0';
ADDRLP4 44
CNSTI1 0
ASGNI1
line 2347
;2347:    for( j = 0; j < MAX_ADMIN_LEVELS && g_admin_levels[ j ]; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1410
JUMPV
LABELV $1407
line 2348
;2348:    {
line 2349
;2349:      if( g_admin_levels[ j ]->level == l )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1411
line 2350
;2350:      {
line 2353
;2351:        int k, colorlen;
;2352:
;2353:        for( colorlen = k = 0; g_admin_levels[ j ]->name[ k ]; k++ )
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRGP4 $1416
JUMPV
LABELV $1413
line 2354
;2354:          if( Q_IsColorString( &g_admin_levels[ j ]->name[ k ] ) )
ADDRLP4 188
ADDRLP4 176
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1417
ADDRLP4 188
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $1417
ADDRLP4 192
ADDRLP4 188
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $1417
ADDRLP4 192
INDIRI4
CNSTI4 48
LTI4 $1417
ADDRLP4 192
INDIRI4
CNSTI4 57
GTI4 $1417
line 2355
;2355:            colorlen += 2;
ADDRLP4 180
ADDRLP4 180
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $1417
LABELV $1414
line 2353
ADDRLP4 176
ADDRLP4 176
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1416
ADDRLP4 176
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1413
line 2356
;2356:        Com_sprintf( lname, sizeof( lname ), "%*s",
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $494
ARGP4
ADDRGP4 admin_level_maxname
INDIRI4
ADDRLP4 180
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2359
;2357:                     admin_level_maxname + colorlen,
;2358:                     g_admin_levels[ j ]->name );
;2359:        break;
ADDRGP4 $1409
JUMPV
LABELV $1411
line 2361
;2360:      }
;2361:    }
LABELV $1408
line 2347
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1410
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $1419
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1407
LABELV $1419
LABELV $1409
line 2363
;2362:
;2363:    ADMBP( va( "%2i %s%s^7 %-2i %s^7 (*%s) ^1%1s^7 %s^7 %s%s^7%s\n",
ADDRGP4 $1420
ARGP4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 156
ARGP4
ADDRLP4 159
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 161
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 92
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1425
ADDRLP4 180
ADDRGP4 $1421
ASGNP4
ADDRGP4 $1426
JUMPV
LABELV $1425
ADDRLP4 180
ADDRGP4 $71
ASGNP4
LABELV $1426
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 92
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1427
ADDRLP4 184
ADDRGP4 $1423
ASGNP4
ADDRGP4 $1428
JUMPV
LABELV $1427
ADDRLP4 184
ADDRGP4 $71
ASGNP4
LABELV $1428
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2375
;2364:              i,
;2365:              c,
;2366:              t,
;2367:              l,
;2368:              lname,
;2369:              guid_stub,
;2370:              muted,
;2371:              p->pers.netname,
;2372:              ( *n ) ? "(a.k.a. " : "",
;2373:              n,
;2374:              ( *n ) ? ")" : "" ) );
;2375:  }
LABELV $1367
line 2279
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1369
ADDRLP4 88
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1366
line 2376
;2376:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2377
;2377:  return qtrue;
CNSTI4 1
RETI4
LABELV $1360
endproc G_admin_listplayers 196 48
lit
align 1
LABELV $1430
byte 1 0
skip 31
align 1
LABELV $1431
byte 1 0
skip 63
align 1
LABELV $1432
byte 1 0
skip 63
align 1
LABELV $1433
byte 1 0
skip 31
export G_admin_showbans
code
proc G_admin_showbans 368 32
line 2381
;2378:}
;2379:
;2380:qboolean G_admin_showbans( gentity_t *ent, int skiparg )
;2381:{
line 2382
;2382:  int i, found = 0;
ADDRLP4 292
CNSTI4 0
ASGNI4
line 2383
;2383:  int max = -1, count;
ADDRLP4 112
CNSTI4 -1
ASGNI4
line 2386
;2384:  int t;
;2385:  char duration[ 32 ];
;2386:  int max_name = 1, max_banner = 1, colorlen;
ADDRLP4 276
CNSTI4 1
ASGNI4
ADDRLP4 280
CNSTI4 1
ASGNI4
line 2389
;2387:  int len;
;2388:  int secs;
;2389:  int start = 0;
ADDRLP4 296
CNSTI4 0
ASGNI4
line 2390
;2390:  char filter[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 116
ADDRGP4 $1430
INDIRB
ASGNB 32
line 2394
;2391:  char date[ 11 ];
;2392:  char *made;
;2393:  int j, k;
;2394:  char n1[ MAX_NAME_LENGTH * 2 ] = {""};
ADDRLP4 32
ADDRGP4 $1431
INDIRB
ASGNB 64
line 2395
;2395:  char n2[ MAX_NAME_LENGTH * 2 ] = {""};
ADDRLP4 180
ADDRGP4 $1432
INDIRB
ASGNB 64
line 2396
;2396:  qboolean numeric = qtrue;
ADDRLP4 300
CNSTI4 1
ASGNI4
line 2397
;2397:  char *ip_match = NULL;
ADDRLP4 104
CNSTP4 0
ASGNP4
line 2398
;2398:  int ip_match_len = 0;
ADDRLP4 284
CNSTI4 0
ASGNI4
line 2399
;2399:  char name_match[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 148
ADDRGP4 $1433
INDIRB
ASGNB 32
line 2401
;2400:
;2401:  t = trap_RealTime( NULL );
CNSTP4 0
ARGP4
ADDRLP4 304
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 304
INDIRI4
ASGNI4
line 2403
;2402:
;2403:  for( i = 0; i < MAX_ADMIN_BANS && g_admin_bans[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1437
JUMPV
LABELV $1434
line 2404
;2404:  {
line 2405
;2405:    if( g_admin_bans[ i ]->expires != 0 &&
ADDRLP4 308
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1438
ADDRLP4 308
INDIRI4
ADDRLP4 108
INDIRI4
SUBI4
CNSTI4 1
GEI4 $1438
line 2407
;2406:        ( g_admin_bans[ i ]->expires - t ) < 1 )
;2407:    {
line 2408
;2408:      continue;
ADDRGP4 $1435
JUMPV
LABELV $1438
line 2410
;2409:    }
;2410:    found++;
ADDRLP4 292
ADDRLP4 292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2411
;2411:    max = i;
ADDRLP4 112
ADDRLP4 0
INDIRI4
ASGNI4
line 2412
;2412:  }
LABELV $1435
line 2403
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1437
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1440
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1434
LABELV $1440
line 2414
;2413:
;2414:  if( max < 0 )
ADDRLP4 112
INDIRI4
CNSTI4 0
GEI4 $1441
line 2415
;2415:  {
line 2416
;2416:    ADMP( "^3!showbans: ^7no bans to display\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1443
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2417
;2417:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1429
JUMPV
LABELV $1441
line 2420
;2418:  }
;2419:
;2420:  if( G_SayArgc() >= 2 + skiparg )
ADDRLP4 312
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1444
line 2421
;2421:  {
line 2422
;2422:    G_SayArgv( 1 + skiparg, filter, sizeof( filter ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 116
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2423
;2423:    if( G_SayArgc() >= 3 + skiparg )
ADDRLP4 316
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
LTI4 $1446
line 2424
;2424:    {
line 2425
;2425:      start = atoi( filter );
ADDRLP4 116
ARGP4
ADDRLP4 320
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 320
INDIRI4
ASGNI4
line 2426
;2426:      G_SayArgv( 2 + skiparg, filter, sizeof( filter ) );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 116
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2427
;2427:    }
LABELV $1446
line 2428
;2428:    for( i = 0; i < sizeof( filter ) && filter[ i ] ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1451
JUMPV
LABELV $1448
line 2429
;2429:    {
line 2430
;2430:      if( !isdigit( filter[ i ] ) &&
ADDRLP4 320
ADDRLP4 0
INDIRI4
ADDRLP4 116
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 48
LTI4 $1454
ADDRLP4 320
INDIRI4
CNSTI4 57
LEI4 $1452
LABELV $1454
ADDRLP4 324
ADDRLP4 0
INDIRI4
ADDRLP4 116
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 46
EQI4 $1452
ADDRLP4 324
INDIRI4
CNSTI4 45
EQI4 $1452
line 2432
;2431:          filter[ i ] != '.' && filter[ i ] != '-' )
;2432:      {
line 2433
;2433:        numeric = qfalse;
ADDRLP4 300
CNSTI4 0
ASGNI4
line 2434
;2434:        break;
ADDRGP4 $1450
JUMPV
LABELV $1452
line 2436
;2435:      }
;2436:    }
LABELV $1449
line 2428
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1451
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $1455
ADDRLP4 0
INDIRI4
ADDRLP4 116
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1448
LABELV $1455
LABELV $1450
line 2437
;2437:    if( !numeric )
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $1456
line 2438
;2438:    {
line 2439
;2439:      G_SanitiseString( filter, name_match, sizeof( name_match ) );
ADDRLP4 116
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2440
;2440:    }
ADDRGP4 $1457
JUMPV
LABELV $1456
line 2441
;2441:    else if( strchr( filter, '.' ) )
ADDRLP4 116
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 324
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 324
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1458
line 2442
;2442:    {
line 2443
;2443:      ip_match = filter;
ADDRLP4 104
ADDRLP4 116
ASGNP4
line 2444
;2444:      ip_match_len = strlen(ip_match);
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 328
INDIRI4
ASGNI4
line 2445
;2445:    }
ADDRGP4 $1459
JUMPV
LABELV $1458
line 2447
;2446:    else
;2447:    {
line 2448
;2448:      start = atoi( filter );
ADDRLP4 116
ARGP4
ADDRLP4 328
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 328
INDIRI4
ASGNI4
line 2449
;2449:      filter[ 0 ] = '\0';
ADDRLP4 116
CNSTI1 0
ASGNI1
line 2450
;2450:    }
LABELV $1459
LABELV $1457
line 2452
;2451:    // showbans 1 means start with ban 0
;2452:    if( start > 0 )
ADDRLP4 296
INDIRI4
CNSTI4 0
LEI4 $1460
line 2453
;2453:      start--;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1461
JUMPV
LABELV $1460
line 2454
;2454:    else if( start < 0 )
ADDRLP4 296
INDIRI4
CNSTI4 0
GEI4 $1462
line 2455
;2455:    {
line 2456
;2456:      for( i = max, count = 0; i >= 0 && count < -start; i-- )
ADDRLP4 0
ADDRLP4 112
INDIRI4
ASGNI4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $1467
JUMPV
LABELV $1464
line 2457
;2457:        if( g_admin_bans[ i ]->expires == 0 ||
ADDRLP4 328
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRLP4 328
INDIRI4
ADDRLP4 332
INDIRI4
EQI4 $1470
ADDRLP4 328
INDIRI4
ADDRLP4 108
INDIRI4
SUBI4
ADDRLP4 332
INDIRI4
LEI4 $1468
LABELV $1470
line 2459
;2458:          ( g_admin_bans[ i ]->expires - t ) > 0 )
;2459:          count++;
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1468
LABELV $1465
line 2456
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1467
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1471
ADDRLP4 100
INDIRI4
ADDRLP4 296
INDIRI4
NEGI4
LTI4 $1464
LABELV $1471
line 2460
;2460:      start = i + 1;
ADDRLP4 296
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2461
;2461:    }
LABELV $1462
LABELV $1461
line 2462
;2462:  }
LABELV $1444
line 2464
;2463:
;2464:  if( start < 0 )
ADDRLP4 296
INDIRI4
CNSTI4 0
GEI4 $1472
line 2465
;2465:    start = 0;
ADDRLP4 296
CNSTI4 0
ASGNI4
LABELV $1472
line 2467
;2466:
;2467:  if( start > max )
ADDRLP4 296
INDIRI4
ADDRLP4 112
INDIRI4
LEI4 $1474
line 2468
;2468:  {
line 2469
;2469:    ADMP( va( "^3!showbans: ^7%d is the last valid ban\n", max + 1 ) );
ADDRGP4 $1476
ARGP4
ADDRLP4 112
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 316
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2470
;2470:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1429
JUMPV
LABELV $1474
line 2473
;2471:  }
;2472:
;2473:  for( i = start, count = 0; i <= max && count < MAX_ADMIN_SHOWBANS; i++ )
ADDRLP4 0
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $1480
JUMPV
LABELV $1477
line 2474
;2474:  {
line 2475
;2475:    if( g_admin_bans[ i ]->expires != 0 &&
ADDRLP4 316
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $1481
ADDRLP4 316
INDIRI4
ADDRLP4 108
INDIRI4
SUBI4
CNSTI4 1
GEI4 $1481
line 2477
;2476:      ( g_admin_bans[ i ]->expires - t ) < 1 )
;2477:      continue;
ADDRGP4 $1478
JUMPV
LABELV $1481
line 2479
;2478:
;2479:    if( name_match[ 0 ] )
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1483
line 2480
;2480:    {
line 2481
;2481:      G_SanitiseString( g_admin_bans[ i ]->name, n1, sizeof( n1 ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2482
;2482:      if( !strstr( n1, name_match) )
ADDRLP4 32
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 320
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 320
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1485
line 2483
;2483:        continue;
ADDRGP4 $1478
JUMPV
LABELV $1485
line 2484
;2484:    }
LABELV $1483
line 2485
;2485:    if( ip_match &&
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1487
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 324
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1487
line 2487
;2486:      Q_strncmp( ip_match, g_admin_bans[ i ]->ip, ip_match_len ) )
;2487:        continue;
ADDRGP4 $1478
JUMPV
LABELV $1487
line 2489
;2488:
;2489:    count++;
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2491
;2490:
;2491:    len = Q_PrintStrlen( g_admin_bans[ i ]->name );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 Q_PrintStrlen
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 328
INDIRI4
ASGNI4
line 2492
;2492:    if( len > max_name )
ADDRLP4 96
INDIRI4
ADDRLP4 276
INDIRI4
LEI4 $1489
line 2493
;2493:      max_name = len;
ADDRLP4 276
ADDRLP4 96
INDIRI4
ASGNI4
LABELV $1489
line 2494
;2494:    len = Q_PrintStrlen( g_admin_bans[ i ]->banner );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 332
ADDRGP4 Q_PrintStrlen
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 332
INDIRI4
ASGNI4
line 2495
;2495:    if( len > max_banner )
ADDRLP4 96
INDIRI4
ADDRLP4 280
INDIRI4
LEI4 $1491
line 2496
;2496:      max_banner = len;
ADDRLP4 280
ADDRLP4 96
INDIRI4
ASGNI4
LABELV $1491
line 2497
;2497:  }
LABELV $1478
line 2473
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1480
ADDRLP4 0
INDIRI4
ADDRLP4 112
INDIRI4
GTI4 $1493
ADDRLP4 100
INDIRI4
CNSTI4 10
LTI4 $1477
LABELV $1493
line 2499
;2498:
;2499:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2500
;2500:  for( i = start, count = 0; i <= max && count < MAX_ADMIN_SHOWBANS; i++ )
ADDRLP4 0
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $1497
JUMPV
LABELV $1494
line 2501
;2501:  {
line 2502
;2502:    if( g_admin_bans[ i ]->expires != 0 &&
ADDRLP4 316
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $1498
ADDRLP4 316
INDIRI4
ADDRLP4 108
INDIRI4
SUBI4
CNSTI4 1
GEI4 $1498
line 2504
;2503:      ( g_admin_bans[ i ]->expires - t ) < 1 )
;2504:      continue;
ADDRGP4 $1495
JUMPV
LABELV $1498
line 2506
;2505:
;2506:    if( name_match[ 0 ] )
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1500
line 2507
;2507:    {
line 2508
;2508:      G_SanitiseString( g_admin_bans[ i ]->name, n1, sizeof( n1 ) );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2509
;2509:      if( !strstr( n1, name_match) )
ADDRLP4 32
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 320
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 320
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1502
line 2510
;2510:        continue;
ADDRGP4 $1495
JUMPV
LABELV $1502
line 2511
;2511:    }
LABELV $1500
line 2512
;2512:    if( ip_match &&
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1504
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 324
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1504
line 2514
;2513:      Q_strncmp( ip_match, g_admin_bans[ i ]->ip, ip_match_len ) )
;2514:        continue;
ADDRGP4 $1495
JUMPV
LABELV $1504
line 2516
;2515:
;2516:    count++;
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2519
;2517:
;2518:    // only print out the the date part of made
;2519:    date[ 0 ] = '\0';
ADDRLP4 16
CNSTI1 0
ASGNI1
line 2520
;2520:    made = g_admin_bans[ i ]->made;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 155
ADDP4
ASGNP4
line 2521
;2521:    for( j = 0; made && *made; j++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1509
JUMPV
LABELV $1506
line 2522
;2522:    {
line 2523
;2523:      if( ( j + 1 ) >= sizeof( date ) )
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
CVIU4 4
CNSTU4 11
LTU4 $1510
line 2524
;2524:        break;
ADDRGP4 $1508
JUMPV
LABELV $1510
line 2525
;2525:      if( *made == ' ' )
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1512
line 2526
;2526:        break;
ADDRGP4 $1508
JUMPV
LABELV $1512
line 2527
;2527:      date[ j ] = *made;
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 2528
;2528:      date[ j + 1 ] = '\0';
ADDRLP4 12
INDIRI4
ADDRLP4 16+1
ADDP4
CNSTI1 0
ASGNI1
line 2529
;2529:      made++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2530
;2530:    }
LABELV $1507
line 2521
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1509
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1515
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1506
LABELV $1515
LABELV $1508
line 2532
;2531:
;2532:    secs = ( g_admin_bans[ i ]->expires - t );
ADDRLP4 288
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
SUBI4
ASGNI4
line 2533
;2533:    G_admin_duration( secs, duration, sizeof( duration ) );
ADDRLP4 288
INDIRI4
ARGI4
ADDRLP4 244
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 2535
;2534:
;2535:    for( colorlen = k = 0; g_admin_bans[ i ]->name[ k ]; k++ )
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 332
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 332
INDIRI4
ASGNI4
ADDRGP4 $1519
JUMPV
LABELV $1516
line 2536
;2536:      if( Q_IsColorString( &g_admin_bans[ i ]->name[ k ] ) )
ADDRLP4 336
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 336
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1520
ADDRLP4 336
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $1520
ADDRLP4 340
ADDRLP4 336
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $1520
ADDRLP4 340
INDIRI4
CNSTI4 48
LTI4 $1520
ADDRLP4 340
INDIRI4
CNSTI4 57
GTI4 $1520
line 2537
;2537:        colorlen += 2;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $1520
LABELV $1517
line 2535
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1519
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1516
line 2538
;2538:    Com_sprintf( n1, sizeof( n1 ), "%*s", max_name + colorlen,
ADDRLP4 32
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $494
ARGP4
ADDRLP4 276
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2541
;2539:                 g_admin_bans[ i ]->name );
;2540:
;2541:    for( colorlen = k = 0; g_admin_bans[ i ]->banner[ k ]; k++ )
ADDRLP4 344
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 344
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 344
INDIRI4
ASGNI4
ADDRGP4 $1525
JUMPV
LABELV $1522
line 2542
;2542:      if( Q_IsColorString( &g_admin_bans[ i ]->banner[ k ] ) )
ADDRLP4 348
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 180
ADDP4
ADDP4
ASGNP4
ADDRLP4 348
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1526
ADDRLP4 348
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $1526
ADDRLP4 352
ADDRLP4 348
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $1526
ADDRLP4 352
INDIRI4
CNSTI4 48
LTI4 $1526
ADDRLP4 352
INDIRI4
CNSTI4 57
GTI4 $1526
line 2543
;2543:        colorlen += 2;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $1526
LABELV $1523
line 2541
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1525
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 180
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1522
line 2544
;2544:    Com_sprintf( n2, sizeof( n2 ), "%*s", max_banner + colorlen,
ADDRLP4 180
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $494
ARGP4
ADDRLP4 280
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2547
;2545:                 g_admin_bans[ i ]->banner );
;2546:
;2547:    ADMBP( va( "%4i %s^7 %-15s %-8s %s^7 %-10s\n     \\__ %s\n",
ADDRGP4 $1528
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ARGP4
ADDRLP4 360
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 180
ARGP4
ADDRLP4 244
ARGP4
ADDRLP4 360
INDIRP4
CNSTI4 105
ADDP4
ARGP4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2555
;2548:             ( i + 1 ),
;2549:             n1,
;2550:             g_admin_bans[ i ]->ip,
;2551:             date,
;2552:             n2,
;2553:             duration,
;2554:             g_admin_bans[ i ]->reason ) );
;2555:  }
LABELV $1495
line 2500
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1497
ADDRLP4 0
INDIRI4
ADDRLP4 112
INDIRI4
GTI4 $1529
ADDRLP4 100
INDIRI4
CNSTI4 10
LTI4 $1494
LABELV $1529
line 2557
;2556:
;2557:  if( name_match[ 0 ] || ip_match )
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1532
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1530
LABELV $1532
line 2558
;2558:  {
line 2559
;2559:    ADMBP( va( "^3!showbans:^7 found %d matching bans by %s.  ",
ADDRGP4 $1533
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1536
ADDRLP4 316
ADDRGP4 $1534
ASGNP4
ADDRGP4 $1537
JUMPV
LABELV $1536
ADDRLP4 316
ADDRGP4 $704
ASGNP4
LABELV $1537
ADDRLP4 316
INDIRP4
ARGP4
ADDRLP4 320
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2562
;2560:             count,
;2561:             ( ip_match ) ? "IP" : "name" ) );
;2562:  }
ADDRGP4 $1531
JUMPV
LABELV $1530
line 2564
;2563:  else
;2564:  {
line 2565
;2565:    ADMBP( va( "^3!showbans:^7 showing bans %d - %d of %d (%d total).",
ADDRGP4 $1538
ARGP4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1540
ADDRLP4 316
ADDRLP4 296
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $1541
JUMPV
LABELV $1540
ADDRLP4 316
CNSTI4 0
ASGNI4
LABELV $1541
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 320
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2570
;2566:             ( found ) ? ( start + 1 ) : 0,
;2567:             i,
;2568:             max + 1,
;2569:             found ) );
;2570:  }
LABELV $1531
line 2572
;2571:
;2572:  if( i <= max )
ADDRLP4 0
INDIRI4
ADDRLP4 112
INDIRI4
GTI4 $1542
line 2573
;2573:    ADMBP( va( "  run !showbans %d%s%s to see more",
ADDRGP4 $1544
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 116
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1548
ADDRLP4 316
ADDRGP4 $1545
ASGNP4
ADDRGP4 $1549
JUMPV
LABELV $1548
ADDRLP4 316
ADDRGP4 $71
ASGNP4
LABELV $1549
ADDRLP4 316
INDIRP4
ARGP4
ADDRLP4 116
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1550
ADDRLP4 320
ADDRLP4 116
ASGNP4
ADDRGP4 $1551
JUMPV
LABELV $1550
ADDRLP4 320
ADDRGP4 $71
ASGNP4
LABELV $1551
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1542
line 2577
;2574:             i + 1,
;2575:             ( filter[ 0 ] ) ? " " : "",
;2576:             ( filter[ 0 ] ) ? filter : "" ) );
;2577:  ADMBP( "\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2578
;2578:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2579
;2579:  return qtrue;
CNSTI4 1
RETI4
LABELV $1429
endproc G_admin_showbans 368 32
export G_admin_help
proc G_admin_help 64 12
line 2583
;2580:}
;2581:
;2582:qboolean G_admin_help( gentity_t *ent, int skiparg )
;2583:{
line 2586
;2584:  int i;
;2585:
;2586:  if( G_SayArgc() < 2 + skiparg )
ADDRLP4 4
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1553
line 2587
;2587:  {
line 2588
;2588:    int j = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2589
;2589:    int count = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2591
;2590:
;2591:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2592
;2592:    for( i = 0; i < adminNumCmds; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1558
JUMPV
LABELV $1555
line 2593
;2593:    {
line 2594
;2594:      if( G_admin_permission( ent, g_admin_cmds[ i ].flag[ 0 ] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1559
line 2595
;2595:      {
line 2596
;2596:        ADMBP( va( "^3!%-12s", g_admin_cmds[ i ].keyword ) );
ADDRGP4 $1562
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2597
;2597:        j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2598
;2598:        count++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2599
;2599:      }
LABELV $1559
line 2601
;2600:      // show 6 commands per line
;2601:      if( j == 6 )
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $1563
line 2602
;2602:      {
line 2603
;2603:	ADMBP( "\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2604
;2604:        j = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2605
;2605:      }
LABELV $1563
line 2606
;2606:    }
LABELV $1556
line 2592
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1558
ADDRLP4 0
INDIRI4
ADDRGP4 adminNumCmds
INDIRI4
LTI4 $1555
line 2607
;2607:    for( i = 0; i < MAX_ADMIN_COMMANDS && g_admin_commands[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1568
JUMPV
LABELV $1565
line 2608
;2608:    {
line 2609
;2609:      if( ! admin_command_permission( ent, g_admin_commands[ i ]->command ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 admin_command_permission
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1569
line 2610
;2610:        continue;
ADDRGP4 $1566
JUMPV
LABELV $1569
line 2611
;2611:      ADMBP( va( "^3!%-12s", g_admin_commands[ i ]->command ) );
ADDRGP4 $1562
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2612
;2612:      j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2613
;2613:      count++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2615
;2614:      // show 6 commands per line
;2615:      if( j == 6 )
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $1571
line 2616
;2616:      {
line 2617
;2617:	ADMBP( "\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2618
;2618:        j = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2619
;2619:      }
LABELV $1571
line 2620
;2620:    }
LABELV $1566
line 2607
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1568
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $1573
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1565
LABELV $1573
line 2621
;2621:    if( count )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1574
line 2622
;2622:	ADMBP( "\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1574
line 2623
;2623:    ADMBP( va( "^3!help: ^7%i available commands\n", count ) );
ADDRGP4 $1576
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2624
;2624:    ADMBP( "run !help [^3command^7] for help with a specific command.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1577
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2625
;2625:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2627
;2626:
;2627:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1552
JUMPV
LABELV $1553
line 2630
;2628:  }
;2629:  else
;2630:  {
line 2635
;2631:    //!help param
;2632:    char param[ MAX_ADMIN_CMD_LEN ];
;2633:    char *cmd;
;2634:
;2635:    G_SayArgv( 1 + skiparg, param, sizeof( param ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2636
;2636:    cmd = ( param[0] == '!' ) ? &param[1] : &param[0];
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $1580
ADDRLP4 32
ADDRLP4 12+1
ASGNP4
ADDRGP4 $1581
JUMPV
LABELV $1580
ADDRLP4 32
ADDRLP4 12
ASGNP4
LABELV $1581
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 2637
;2637:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2638
;2638:    for( i = 0; i < adminNumCmds; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1585
JUMPV
LABELV $1582
line 2639
;2639:    {
line 2640
;2640:      if( !Q_stricmp( cmd, g_admin_cmds[ i ].keyword ) )
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1586
line 2641
;2641:      {
line 2642
;2642:        if( !G_admin_permission( ent, g_admin_cmds[ i ].flag[ 0 ] ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 40
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1588
line 2643
;2643:        {
line 2644
;2644:          ADMBP( va( "^3!help: ^7you do not have permission to use '%s'\n",
ADDRGP4 $1591
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2646
;2645:                   g_admin_cmds[ i ].keyword ) );
;2646:          ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2647
;2647:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1552
JUMPV
LABELV $1588
line 2649
;2648:        }
;2649:        ADMBP( va( "^3!help: ^7help for '!%s':\n",
ADDRGP4 $1592
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2651
;2650:          g_admin_cmds[ i ].keyword ) );
;2651:        ADMBP( va( " ^3Function: ^7%s\n", g_admin_cmds[ i ].function ) );
ADDRGP4 $1593
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2652
;2652:        ADMBP( va( " ^3Syntax: ^7!%s %s\n", g_admin_cmds[ i ].keyword,
ADDRGP4 $1595
ARGP4
ADDRLP4 52
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRI4
ADDRGP4 g_admin_cmds+16
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2654
;2653:                 g_admin_cmds[ i ].syntax ) );
;2654:        ADMBP( va( " ^3Flag: ^7'%c'\n", g_admin_cmds[ i ].flag[ 0 ] ) );
ADDRGP4 $1597
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2655
;2655:        ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2656
;2656:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1552
JUMPV
LABELV $1586
line 2658
;2657:      }
;2658:    }
LABELV $1583
line 2638
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1585
ADDRLP4 0
INDIRI4
ADDRGP4 adminNumCmds
INDIRI4
LTI4 $1582
line 2659
;2659:    for( i = 0; i < MAX_ADMIN_COMMANDS && g_admin_commands[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1602
JUMPV
LABELV $1599
line 2660
;2660:    {
line 2661
;2661:      if( !Q_stricmp( cmd, g_admin_commands[ i ]->command ) )
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1603
line 2662
;2662:      {
line 2663
;2663:        if( !admin_command_permission( ent, g_admin_commands[ i ]->command ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 admin_command_permission
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1605
line 2664
;2664:        {
line 2665
;2665:          ADMBP( va( "^3!help: ^7you do not have permission to use '%s'\n",
ADDRGP4 $1591
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2667
;2666:                   g_admin_commands[ i ]->command ) );
;2667:          ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2668
;2668:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1552
JUMPV
LABELV $1605
line 2670
;2669:        }
;2670:        ADMBP( va( "^3!help: ^7help for '%s':\n",
ADDRGP4 $1607
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2672
;2671:          g_admin_commands[ i ]->command ) );
;2672:        ADMBP( va( " ^3Description: ^7%s\n", g_admin_commands[ i ]->desc ) );
ADDRGP4 $1608
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2673
;2673:        ADMBP( va( " ^3Syntax: ^7!%s\n", g_admin_commands[ i ]->command ) );
ADDRGP4 $1609
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2674
;2674:        ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2675
;2675:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1552
JUMPV
LABELV $1603
line 2677
;2676:      }
;2677:    }
LABELV $1600
line 2659
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1602
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $1610
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1599
LABELV $1610
line 2678
;2678:    ADMBP( va( "^3!help: ^7no help found for '%s'\n", cmd ) );
ADDRGP4 $1611
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2679
;2679:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2680
;2680:    return qfalse;
CNSTI4 0
RETI4
LABELV $1552
endproc G_admin_help 64 12
export G_admin_admintest
proc G_admin_admintest 36 24
line 2685
;2681:  }
;2682:}
;2683:
;2684:qboolean G_admin_admintest( gentity_t *ent, int skiparg )
;2685:{
line 2686
;2686:  int i, l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2687
;2687:  qboolean found = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2688
;2688:  qboolean lname = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2690
;2689:
;2690:  if( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1613
line 2691
;2691:  {
line 2692
;2692:    ADMP( "^3!admintest: ^7you are on the console.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1615
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2693
;2693:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1612
JUMPV
LABELV $1613
line 2695
;2694:  }
;2695:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1619
JUMPV
LABELV $1616
line 2696
;2696:  {
line 2697
;2697:    if( !Q_stricmp( g_admin_admins[ i ]->guid, ent->client->pers.guid ) )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $1620
line 2698
;2698:    {
line 2699
;2699:      found = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2700
;2700:      break;
ADDRGP4 $1618
JUMPV
LABELV $1620
line 2702
;2701:    }
;2702:  }
LABELV $1617
line 2695
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1619
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1622
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1616
LABELV $1622
LABELV $1618
line 2704
;2703:
;2704:  if( found )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1623
line 2705
;2705:  {
line 2706
;2706:    l = g_admin_admins[ i ]->level;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 2707
;2707:    for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1628
JUMPV
LABELV $1625
line 2708
;2708:    {
line 2709
;2709:      if( g_admin_levels[ i ]->level != l )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1629
line 2710
;2710:        continue;
ADDRGP4 $1626
JUMPV
LABELV $1629
line 2711
;2711:      if( *g_admin_levels[ i ]->name )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1631
line 2712
;2712:      {
line 2713
;2713:        lname = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2714
;2714:        break;
ADDRGP4 $1627
JUMPV
LABELV $1631
line 2716
;2715:      }
;2716:    }
LABELV $1626
line 2707
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1628
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $1633
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1625
LABELV $1633
LABELV $1627
line 2717
;2717:  }
LABELV $1623
line 2718
;2718:  AP( va( "print \"^3!admintest: ^7%s^7 is a level %d admin %s%s^7%s\n\"",
ADDRGP4 $1634
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1639
ADDRLP4 20
ADDRGP4 $1635
ASGNP4
ADDRGP4 $1640
JUMPV
LABELV $1639
ADDRLP4 20
ADDRGP4 $71
ASGNP4
LABELV $1640
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1641
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRGP4 $1642
JUMPV
LABELV $1641
ADDRLP4 24
ADDRGP4 $71
ASGNP4
LABELV $1642
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1643
ADDRLP4 28
ADDRGP4 $1423
ASGNP4
ADDRGP4 $1644
JUMPV
LABELV $1643
ADDRLP4 28
ADDRGP4 $71
ASGNP4
LABELV $1644
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2724
;2719:          ent->client->pers.netname,
;2720:          l,
;2721:          ( lname ) ? "(" : "",
;2722:          ( lname ) ? g_admin_levels[ i ]->name : "",
;2723:          ( lname ) ? ")" : "" ) );
;2724:  return qtrue;
CNSTI4 1
RETI4
LABELV $1612
endproc G_admin_admintest 36 24
export G_admin_allready
proc G_admin_allready 16 8
line 2728
;2725:}
;2726:
;2727:qboolean G_admin_allready( gentity_t *ent, int skiparg )
;2728:{
line 2729
;2729:  int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2732
;2730:  gclient_t *cl;
;2731:
;2732:  if( !level.intermissiontime )
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
NEI4 $1646
line 2733
;2733:  {
line 2734
;2734:    ADMP( "^3!allready: ^7this command is only valid during intermission\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1649
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2735
;2735:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1645
JUMPV
LABELV $1646
line 2738
;2736:  }
;2737:
;2738:  for( i = 0; i < g_maxclients.integer; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1653
JUMPV
LABELV $1650
line 2739
;2739:  {
line 2740
;2740:    cl = level.clients + i;
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2741
;2741:    if( cl->pers.connected != CON_CONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1655
line 2742
;2742:      continue;
ADDRGP4 $1651
JUMPV
LABELV $1655
line 2744
;2743:
;2744:    if( cl->sess.sessionTeam == TEAM_NONE )
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1657
line 2745
;2745:      continue;
ADDRGP4 $1651
JUMPV
LABELV $1657
line 2747
;2746:
;2747:    cl->readyToExit = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 1
ASGNI4
line 2748
;2748:  }
LABELV $1651
line 2738
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1653
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $1650
line 2749
;2749:  AP( va( "print \"^3!allready:^7 %s^7 says everyone is READY now\n\"",
ADDRGP4 $1659
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1661
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1662
JUMPV
LABELV $1661
ADDRLP4 8
ADDRGP4 $446
ASGNP4
LABELV $1662
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2751
;2750:     ( ent ) ? ent->client->pers.netname : "console" ) );
;2751:  return qtrue;
CNSTI4 1
RETI4
LABELV $1645
endproc G_admin_allready 16 8
export G_admin_cancelvote
proc G_admin_cancelvote 12 8
line 2755
;2752:}
;2753:
;2754:qboolean G_admin_cancelvote( gentity_t *ent, int skiparg )
;2755:{
line 2757
;2756:
;2757:  if(!level.voteTime && !level.teamVoteTime[ 0 ] && !level.teamVoteTime[ 1 ] )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 level+3172
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1664
ADDRGP4 level+5248
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1664
ADDRGP4 level+5248+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1664
line 2758
;2758:  {
line 2759
;2759:    ADMP( "^3!cancelvote: ^7no vote in progress\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1670
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2760
;2760:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1663
JUMPV
LABELV $1664
line 2762
;2761:  }
;2762:  level.voteNo = level.numConnectedClients;
ADDRGP4 level+3184
ADDRGP4 level+72
INDIRI4
ASGNI4
line 2763
;2763:  level.voteYes = 0;
ADDRGP4 level+3180
CNSTI4 0
ASGNI4
line 2764
;2764:  CheckVote( );
ADDRGP4 CheckVote
CALLV
pop
line 2765
;2765:  level.teamVoteNo[ 0 ] = level.numConnectedClients;
ADDRGP4 level+5264
ADDRGP4 level+72
INDIRI4
ASGNI4
line 2766
;2766:  level.teamVoteYes[ 0 ] = 0;
ADDRGP4 level+5256
CNSTI4 0
ASGNI4
line 2767
;2767:  CheckTeamVote( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2768
;2768:  level.teamVoteNo[ 1 ] = level.numConnectedClients;
ADDRGP4 level+5264+4
ADDRGP4 level+72
INDIRI4
ASGNI4
line 2769
;2769:  level.teamVoteYes[ 1 ] = 0;
ADDRGP4 level+5256+4
CNSTI4 0
ASGNI4
line 2770
;2770:  CheckTeamVote( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2771
;2771:  AP( va( "print \"^3!cancelvote: ^7%s^7 decided that everyone voted No\n\"",
ADDRGP4 $1682
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1684
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1685
JUMPV
LABELV $1684
ADDRLP4 4
ADDRGP4 $446
ASGNP4
LABELV $1685
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
line 2773
;2772:          ( ent ) ? ent->client->pers.netname : "console" ) );
;2773:  return qtrue;
CNSTI4 1
RETI4
LABELV $1663
endproc G_admin_cancelvote 12 8
export G_admin_passvote
proc G_admin_passvote 12 8
line 2777
;2774:}
;2775:
;2776:qboolean G_admin_passvote( gentity_t *ent, int skiparg )
;2777:{
line 2778
;2778:  if(!level.voteTime && !level.teamVoteTime[ 0 ] && !level.teamVoteTime[ 1 ] )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 level+3172
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1687
ADDRGP4 level+5248
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1687
ADDRGP4 level+5248+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1687
line 2779
;2779:  {
line 2780
;2780:    ADMP( "^3!passvote: ^7no vote in progress\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1693
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2781
;2781:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1686
JUMPV
LABELV $1687
line 2783
;2782:  }
;2783:  level.voteYes = level.numConnectedClients;
ADDRGP4 level+3180
ADDRGP4 level+72
INDIRI4
ASGNI4
line 2784
;2784:  level.voteNo = 0;
ADDRGP4 level+3184
CNSTI4 0
ASGNI4
line 2785
;2785:  CheckVote( );
ADDRGP4 CheckVote
CALLV
pop
line 2786
;2786:  level.teamVoteYes[ 0 ] = level.numConnectedClients;
ADDRGP4 level+5256
ADDRGP4 level+72
INDIRI4
ASGNI4
line 2787
;2787:  level.teamVoteNo[ 0 ] = 0;
ADDRGP4 level+5264
CNSTI4 0
ASGNI4
line 2788
;2788:  CheckTeamVote( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2789
;2789:  level.teamVoteYes[ 1 ] = level.numConnectedClients;
ADDRGP4 level+5256+4
ADDRGP4 level+72
INDIRI4
ASGNI4
line 2790
;2790:  level.teamVoteNo[ 1 ] = 0;
ADDRGP4 level+5264+4
CNSTI4 0
ASGNI4
line 2791
;2791:  CheckTeamVote( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2792
;2792:  AP( va( "print \"^3!passvote: ^7%s^7 decided that everyone voted Yes\n\"",
ADDRGP4 $1705
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1707
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1708
JUMPV
LABELV $1707
ADDRLP4 4
ADDRGP4 $446
ASGNP4
LABELV $1708
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
line 2794
;2793:          ( ent ) ? ent->client->pers.netname : "console" ) );
;2794:  return qtrue;
CNSTI4 1
RETI4
LABELV $1686
endproc G_admin_passvote 12 8
export G_admin_spec999
proc G_admin_spec999 16 12
line 2798
;2795:}
;2796:
;2797:qboolean G_admin_spec999( gentity_t *ent, int skiparg )
;2798:{
line 2802
;2799:  int i;
;2800:  gentity_t *vic;
;2801:
;2802:  for( i = 0; i < level.maxclients; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1713
JUMPV
LABELV $1710
line 2803
;2803:  {
line 2804
;2804:    vic = &g_entities[ i ];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2805
;2805:    if( !vic->client )
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1715
line 2806
;2806:      continue;
ADDRGP4 $1711
JUMPV
LABELV $1715
line 2807
;2807:    if( vic->client->pers.connected != CON_CONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1717
line 2808
;2808:      continue;
ADDRGP4 $1711
JUMPV
LABELV $1717
line 2809
;2809:    if( vic->client->sess.sessionTeam == TEAM_NONE )
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1719
line 2810
;2810:      continue;
ADDRGP4 $1711
JUMPV
LABELV $1719
line 2811
;2811:    if( vic->client->ps.ping == 999 )
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 999
NEI4 $1721
line 2812
;2812:    {
line 2813
;2813:      SetTeam( vic, "spectator" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1723
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 2814
;2814:      AP( va( "print \"^3!spec999: ^7%s^7 moved ^7%s^7 to spectators\n\"",
ADDRGP4 $1724
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1726
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1727
JUMPV
LABELV $1726
ADDRLP4 8
ADDRGP4 $446
ASGNP4
LABELV $1727
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2817
;2815:        ( ent ) ? ent->client->pers.netname : "console",
;2816:        vic->client->pers.netname ) );
;2817:    }
LABELV $1721
line 2818
;2818:  }
LABELV $1711
line 2802
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1713
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1710
line 2819
;2819:  return qtrue;
CNSTI4 1
RETI4
LABELV $1709
endproc G_admin_spec999 16 12
export G_admin_rename
proc G_admin_rename 3216 16
line 2823
;2820:}
;2821:
;2822:qboolean G_admin_rename( gentity_t *ent, int skiparg )
;2823:{
line 2831
;2824:  int pids[ MAX_CLIENTS ], found;
;2825:  char name[ MAX_NAME_LENGTH ];
;2826:  char newname[ MAX_NAME_LENGTH ];
;2827:  char oldname[ MAX_NAME_LENGTH ];
;2828:  char err[ MAX_STRING_CHARS ];
;2829:  char userinfo[ MAX_INFO_STRING ];
;2830:  char *s;
;2831:  gentity_t *victim = NULL;
ADDRLP4 3108
CNSTP4 0
ASGNP4
line 2833
;2832:
;2833:  if( G_SayArgc() < 3 + skiparg )
ADDRLP4 3180
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 3180
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1729
line 2834
;2834:  {
line 2835
;2835:    ADMP( "^3!rename: ^7usage: !rename [name] [newname]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1731
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2836
;2836:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1728
JUMPV
LABELV $1729
line 2838
;2837:  }
;2838:  G_SayArgv( 1 + skiparg, name, sizeof( name ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 3112
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2839
;2839:  s = G_SayConcatArgs( 2 + skiparg );
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 3184
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 3104
ADDRLP4 3184
INDIRP4
ASGNP4
line 2840
;2840:  Q_strncpyz( newname, s, sizeof( newname ) );
ADDRLP4 1024
ARGP4
ADDRLP4 3104
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2841
;2841:  if( ( found = G_ClientNumbersFromString( name, pids, MAX_CLIENTS ) ) != 1 )
ADDRLP4 3112
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 3188
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 3176
ADDRLP4 3188
INDIRI4
ASGNI4
ADDRLP4 3188
INDIRI4
CNSTI4 1
EQI4 $1732
line 2842
;2842:  {
line 2843
;2843:    G_MatchOnePlayer( pids, found, err, sizeof( err ) );
ADDRLP4 0
ARGP4
ADDRLP4 3176
INDIRI4
ARGI4
ADDRLP4 2080
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 2844
;2844:    ADMP( va( "^3!rename: ^7%s\n", err ) );
ADDRGP4 $1734
ARGP4
ADDRLP4 2080
ARGP4
ADDRLP4 3192
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3192
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2845
;2845:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1728
JUMPV
LABELV $1732
line 2847
;2846:  }
;2847:  victim = &g_entities[ pids[ 0 ] ];
ADDRLP4 3108
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2848
;2848:  if( !admin_higher( ent, victim ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3108
INDIRP4
ARGP4
ADDRLP4 3192
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 3192
INDIRI4
CNSTI4 0
NEI4 $1735
line 2849
;2849:  {
line 2850
;2850:    ADMP( "^3!rename: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1737
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2852
;2851:        " level than you\n" );
;2852:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1728
JUMPV
LABELV $1735
line 2854
;2853:  }
;2854:  if( !G_admin_name_check( victim, newname, err, sizeof( err ) ) )
ADDRLP4 3108
INDIRP4
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 2080
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 3196
ADDRGP4 G_admin_name_check
CALLI4
ASGNI4
ADDRLP4 3196
INDIRI4
CNSTI4 0
NEI4 $1738
line 2855
;2855:  {
line 2856
;2856:    ADMP( va( "^3!rename: ^7%s\n", err ) );
ADDRGP4 $1734
ARGP4
ADDRLP4 2080
ARGP4
ADDRLP4 3200
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3200
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2857
;2857:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1728
JUMPV
LABELV $1738
line 2861
;2858:  }
;2859:  
;2860:  //KK-OAX Since NameChanges are not going to be implemented just yet...let's ignore this.
;2861:  level.clients[ pids[ 0 ] ].pers.nameChanges--;
ADDRLP4 3200
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1024
ADDP4
ASGNP4
ADDRLP4 3200
INDIRP4
ADDRLP4 3200
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2862
;2862:  level.clients[ pids[ 0 ] ].pers.nameChangeTime = 0;
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1020
ADDP4
CNSTI4 0
ASGNI4
line 2864
;2863:  
;2864:  trap_GetUserinfo( pids[ 0 ], userinfo, sizeof( userinfo ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2865
;2865:  s = Info_ValueForKey( userinfo, "name" );
ADDRLP4 1056
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 3204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3104
ADDRLP4 3204
INDIRP4
ASGNP4
line 2866
;2866:  Q_strncpyz( oldname, s, sizeof( oldname ) );
ADDRLP4 3144
ARGP4
ADDRLP4 3104
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2867
;2867:  Info_SetValueForKey( userinfo, "name", newname );
ADDRLP4 1056
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 2868
;2868:  trap_SetUserinfo( pids[ 0 ], userinfo );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 2869
;2869:  ClientUserinfoChanged( pids[ 0 ] );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2870
;2870:  AP( va( "print \"^3!rename: ^7%s^7 has been renamed to %s^7 by %s\n\"",
ADDRGP4 $1740
ARGP4
ADDRLP4 3144
ARGP4
ADDRLP4 1024
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1742
ADDRLP4 3208
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1743
JUMPV
LABELV $1742
ADDRLP4 3208
ADDRGP4 $446
ASGNP4
LABELV $1743
ADDRLP4 3208
INDIRP4
ARGP4
ADDRLP4 3212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 3212
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2874
;2871:          oldname,
;2872:          newname,
;2873:          ( ent ) ? ent->client->pers.netname : "console" ) );
;2874:  return qtrue;
CNSTI4 1
RETI4
LABELV $1728
endproc G_admin_rename 3216 16
lit
align 1
LABELV $1745
byte 1 0
skip 255
export G_admin_restart
code
proc G_admin_restart 324 12
line 2879
;2875:}
;2876:
;2877://KK-Will Fix this For OAPub
;2878:qboolean G_admin_restart( gentity_t *ent, int skiparg )
;2879:{
line 2880
;2880:  char layout[ MAX_CVAR_VALUE_STRING ] = { "" };
ADDRLP4 0
ADDRGP4 $1745
INDIRB
ASGNB 256
line 2882
;2881:
;2882:  if( G_SayArgc( ) > 1 + skiparg )
ADDRLP4 256
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $1746
line 2883
;2883:  {
line 2886
;2884:    char map[ MAX_QPATH ];
;2885:
;2886:    trap_Cvar_VariableStringBuffer( "mapname", map, sizeof( map ) );
ADDRGP4 $1748
ARGP4
ADDRLP4 260
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2887
;2887:    G_SayArgv( skiparg + 1, layout, sizeof( layout ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2889
;2888:
;2889:  }
LABELV $1746
line 2891
;2890:
;2891:  trap_SendConsoleCommand( EXEC_APPEND, "map_restart" );
CNSTI4 2
ARGI4
ADDRGP4 $1749
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2892
;2892:  AP( va( "print \"^3!restart: ^7map restarted by %s \n\"",
ADDRGP4 $1750
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1752
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1753
JUMPV
LABELV $1752
ADDRLP4 260
ADDRGP4 $446
ASGNP4
LABELV $1753
ADDRLP4 260
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2894
;2893:          ( ent ) ? ent->client->pers.netname : "console" ) );
;2894:  return qtrue;
CNSTI4 1
RETI4
LABELV $1744
endproc G_admin_restart 324 12
export G_admin_nextmap
proc G_admin_nextmap 16 8
line 2898
;2895:}
;2896:
;2897:qboolean G_admin_nextmap( gentity_t *ent, int skiparg )
;2898:{
line 2899
;2899:  AP( va( "print \"^3!nextmap: ^7%s^7 decided to load the next map\n\"",
ADDRGP4 $1755
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1757
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1758
JUMPV
LABELV $1757
ADDRLP4 0
ADDRGP4 $446
ASGNP4
LABELV $1758
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
line 2903
;2900:    ( ent ) ? ent->client->pers.netname : "console" ) );
;2901:  //level.lastWin = TEAM_NONE;
;2902:  //trap_SetConfigstring( CS_WINNER, "NextMap" );
;2903:  LogExit( va( "nextmap was run by %s", ( ent ) ? ent->client->pers.netname : "console" ) );
ADDRGP4 $1759
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1761
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1762
JUMPV
LABELV $1761
ADDRLP4 8
ADDRGP4 $446
ASGNP4
LABELV $1762
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 2904
;2904:  return qtrue;
CNSTI4 1
RETI4
LABELV $1754
endproc G_admin_nextmap 16 8
lit
align 1
LABELV $1764
byte 1 0
skip 31
align 1
LABELV $1765
byte 1 0
skip 31
align 1
LABELV $1766
byte 1 0
skip 31
export G_admin_namelog
code
proc G_admin_namelog 152 16
line 2908
;2905:}
;2906:
;2907:qboolean G_admin_namelog( gentity_t *ent, int skiparg )
;2908:{
line 2910
;2909:  int i, j;
;2910:  char search[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 88
ADDRGP4 $1764
INDIRB
ASGNB 32
line 2911
;2911:  char s2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 49
ADDRGP4 $1765
INDIRB
ASGNB 32
line 2912
;2912:  char n2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 8
ADDRGP4 $1766
INDIRB
ASGNB 32
line 2914
;2913:  char guid_stub[ 9 ];
;2914:  qboolean found = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 2915
;2915:  int printed = 0;
ADDRLP4 120
CNSTI4 0
ASGNI4
line 2917
;2916:
;2917:  if( G_SayArgc() > 1 + skiparg )
ADDRLP4 124
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $1767
line 2918
;2918:  {
line 2919
;2919:    G_SayArgv( 1 + skiparg, search, sizeof( search ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 88
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2920
;2920:    G_SanitiseString( search, s2, sizeof( s2 ) );
ADDRLP4 88
ARGP4
ADDRLP4 49
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2921
;2921:  }
LABELV $1767
line 2922
;2922:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2923
;2923:  for( i = 0; i < MAX_ADMIN_NAMELOGS && g_admin_namelog[ i ]; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1772
JUMPV
LABELV $1769
line 2924
;2924:  {
line 2925
;2925:    if( search[ 0 ] )
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1773
line 2926
;2926:    {
line 2927
;2927:      found = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 2928
;2928:      for( j = 0; j < MAX_ADMIN_NAMELOG_NAMES &&
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1778
JUMPV
LABELV $1775
line 2930
;2929:        g_admin_namelog[ i ]->name[ j ][ 0 ]; j++ )
;2930:      {
line 2931
;2931:        G_SanitiseString( g_admin_namelog[ i ]->name[ j ], n2, sizeof( n2 ) );
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2932
;2932:        if( strstr( n2, s2 ) )
ADDRLP4 8
ARGP4
ADDRLP4 49
ARGP4
ADDRLP4 128
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1779
line 2933
;2933:        {
line 2934
;2934:          found = qtrue;
ADDRLP4 84
CNSTI4 1
ASGNI4
line 2935
;2935:          break;
ADDRGP4 $1777
JUMPV
LABELV $1779
line 2937
;2936:        }
;2937:      }
LABELV $1776
line 2929
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1778
line 2928
ADDRLP4 132
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $1781
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1775
LABELV $1781
LABELV $1777
line 2938
;2938:      if( !found )
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $1782
line 2939
;2939:        continue;
ADDRGP4 $1770
JUMPV
LABELV $1782
line 2940
;2940:    }
LABELV $1773
line 2941
;2941:    printed++;
ADDRLP4 120
ADDRLP4 120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2942
;2942:    for( j = 0; j < 8; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1784
line 2943
;2943:      guid_stub[ j ] = g_admin_namelog[ i ]->guid[ j + 24 ];
ADDRLP4 0
INDIRI4
ADDRLP4 40
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $1785
line 2942
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1784
line 2944
;2944:    guid_stub[ j ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 40
ADDP4
CNSTI1 0
ASGNI1
line 2945
;2945:    if( g_admin_namelog[ i ]->slot > -1 )
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $1788
line 2946
;2946:       ADMBP( "^3" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1095
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1788
line 2947
;2947:    ADMBP( va( "%-2s (*%s) %15s^7",
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $1792
ADDRGP4 $1052
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 132
ADDRLP4 136
INDIRP4
ASGNP4
ADDRGP4 $1793
JUMPV
LABELV $1792
ADDRLP4 132
ADDRGP4 $1097
ASGNP4
LABELV $1793
ADDRGP4 $1790
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2951
;2948:      ( g_admin_namelog[ i ]->slot > -1 ) ?
;2949:        va( "%d", g_admin_namelog[ i ]->slot ) : "-",
;2950:      guid_stub, g_admin_namelog[ i ]->ip ) );
;2951:    for( j = 0; j < MAX_ADMIN_NAMELOG_NAMES &&
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1797
JUMPV
LABELV $1794
line 2953
;2952:      g_admin_namelog[ i ]->name[ j ][ 0 ]; j++ )
;2953:    {
line 2954
;2954:      ADMBP( va( " '%s^7'", g_admin_namelog[ i ]->name[ j ] ) );
ADDRGP4 $1798
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 144
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2955
;2955:    }
LABELV $1795
line 2952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1797
line 2951
ADDRLP4 148
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 148
INDIRI4
GEI4 $1799
ADDRLP4 0
INDIRI4
ADDRLP4 148
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1794
LABELV $1799
line 2956
;2956:    ADMBP( "\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2957
;2957:  }
LABELV $1770
line 2923
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1772
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1800
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1769
LABELV $1800
line 2958
;2958:  ADMBP( va( "^3!namelog:^7 %d recent clients found\n", printed ) );
ADDRGP4 $1801
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2959
;2959:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2960
;2960:  return qtrue;
CNSTI4 1
RETI4
LABELV $1763
endproc G_admin_namelog 152 16
lit
align 1
LABELV $1803
byte 1 0
skip 1
export G_admin_lock
code
proc G_admin_lock 28 12
line 2964
;2961:}
;2962:
;2963:qboolean G_admin_lock( gentity_t *ent, int skiparg )
;2964:{
line 2965
;2965:  char teamName[2] = {""};
ADDRLP4 0
ADDRGP4 $1803
INDIRB
ASGNB 2
line 2968
;2966:  team_t team;
;2967:
;2968:  if( G_SayArgc() < 2 + skiparg )
ADDRLP4 8
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1804
line 2969
;2969:  {
line 2970
;2970:    ADMP( "^3!lock: ^7usage: !lock [r|b|f]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1806
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2971
;2971:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1802
JUMPV
LABELV $1804
line 2973
;2972:  }
;2973:  G_SayArgv( 1 + skiparg, teamName, sizeof( teamName ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2974
;2974:  team = G_TeamFromString( teamName );
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 2976
;2975:
;2976:  if( team == TEAM_RED )
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1807
line 2977
;2977:  {
line 2978
;2978:    if( level.RedTeamLocked )
ADDRGP4 level+10260
INDIRI4
CNSTI4 0
EQI4 $1809
line 2979
;2979:    {
line 2980
;2980:      ADMP( "^3!lock: ^7the Red team is already locked\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1812
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2981
;2981:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1802
JUMPV
LABELV $1809
line 2983
;2982:    }
;2983:    level.RedTeamLocked = qtrue;
ADDRGP4 level+10260
CNSTI4 1
ASGNI4
line 2984
;2984:  }
ADDRGP4 $1808
JUMPV
LABELV $1807
line 2985
;2985:  else if( team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1814
line 2986
;2986:    if( level.BlueTeamLocked )
ADDRGP4 level+10264
INDIRI4
CNSTI4 0
EQI4 $1816
line 2987
;2987:    {
line 2988
;2988:      ADMP( "^3!lock: ^7the Blue team is already locked\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1819
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2989
;2989:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1802
JUMPV
LABELV $1816
line 2991
;2990:    }
;2991:    level.BlueTeamLocked = qtrue;
ADDRGP4 level+10264
CNSTI4 1
ASGNI4
line 2992
;2992:  }
ADDRGP4 $1815
JUMPV
LABELV $1814
line 2993
;2993:  else if(team == TEAM_FREE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1821
line 2994
;2994:    if( level.FFALocked )
ADDRGP4 level+10268
INDIRI4
CNSTI4 0
EQI4 $1823
line 2995
;2995:    {
line 2996
;2996:      ADMP( "^3!lock: ^7DeathMatch is already Locked!!!\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1826
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2997
;2997:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1802
JUMPV
LABELV $1823
line 2999
;2998:    }
;2999:    level.FFALocked = qtrue;
ADDRGP4 level+10268
CNSTI4 1
ASGNI4
line 3000
;3000:  }
ADDRGP4 $1822
JUMPV
LABELV $1821
line 3002
;3001:  else
;3002:  {
line 3003
;3003:    ADMP( va( "^3!lock: ^7invalid team\"%c\"\n", teamName[0] ) );
ADDRGP4 $1828
ARGP4
ADDRLP4 0
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3004
;3004:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1802
JUMPV
LABELV $1822
LABELV $1815
LABELV $1808
line 3007
;3005:  }
;3006:
;3007:  AP( va( "print \"^3!lock: ^7the %s team has been locked by %s\n\"",
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_TeamName
CALLP4
ASGNP4
ADDRGP4 $1829
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1831
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1832
JUMPV
LABELV $1831
ADDRLP4 16
ADDRGP4 $446
ASGNP4
LABELV $1832
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3010
;3008:    BG_TeamName( team ),
;3009:    ( ent ) ? ent->client->pers.netname : "console" ) );
;3010:  return qtrue;
CNSTI4 1
RETI4
LABELV $1802
endproc G_admin_lock 28 12
lit
align 1
LABELV $1834
byte 1 0
skip 1
export G_admin_unlock
code
proc G_admin_unlock 28 12
line 3014
;3011:}
;3012:
;3013:qboolean G_admin_unlock( gentity_t *ent, int skiparg )
;3014:{
line 3015
;3015:  char teamName[2] = {""};
ADDRLP4 0
ADDRGP4 $1834
INDIRB
ASGNB 2
line 3018
;3016:  team_t team;
;3017:
;3018:  if( G_SayArgc() < 2 + skiparg )
ADDRLP4 8
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1835
line 3019
;3019:  {
line 3020
;3020:    ADMP( "^3!unlock: ^7usage: !unlock [r|b|f]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1837
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3021
;3021:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1833
JUMPV
LABELV $1835
line 3023
;3022:  }
;3023:  G_SayArgv( 1 + skiparg, teamName, sizeof( teamName ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3024
;3024:  team = G_TeamFromString( teamName );
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 G_TeamFromString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3026
;3025:
;3026:  if( team == TEAM_RED )
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1838
line 3027
;3027:  {
line 3028
;3028:    if( !level.RedTeamLocked )
ADDRGP4 level+10260
INDIRI4
CNSTI4 0
NEI4 $1840
line 3029
;3029:    {
line 3030
;3030:      ADMP( "^3!unlock: ^7the Red team is not currently locked\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1843
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3031
;3031:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1833
JUMPV
LABELV $1840
line 3033
;3032:    }
;3033:    level.RedTeamLocked = qfalse;
ADDRGP4 level+10260
CNSTI4 0
ASGNI4
line 3034
;3034:  }
ADDRGP4 $1839
JUMPV
LABELV $1838
line 3035
;3035:  else if( team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1845
line 3036
;3036:    if( !level.BlueTeamLocked )
ADDRGP4 level+10264
INDIRI4
CNSTI4 0
NEI4 $1847
line 3037
;3037:    {
line 3038
;3038:      ADMP( "^3!unlock: ^7the Blue team is not currently locked\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1850
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3039
;3039:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1833
JUMPV
LABELV $1847
line 3041
;3040:    }
;3041:    level.BlueTeamLocked = qfalse;
ADDRGP4 level+10264
CNSTI4 0
ASGNI4
line 3042
;3042:  }
ADDRGP4 $1846
JUMPV
LABELV $1845
line 3043
;3043:  else if( team == TEAM_FREE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1852
line 3044
;3044:    if( !level.FFALocked )
ADDRGP4 level+10268
INDIRI4
CNSTI4 0
NEI4 $1854
line 3045
;3045:    {
line 3046
;3046:        ADMP( "^!unlock: ^7Deathmatch is not currently Locked!!!\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1857
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3047
;3047:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1833
JUMPV
LABELV $1854
line 3049
;3048:    }
;3049:    level.FFALocked = qfalse;
ADDRGP4 level+10268
CNSTI4 0
ASGNI4
line 3050
;3050:  }
ADDRGP4 $1853
JUMPV
LABELV $1852
line 3052
;3051:  else
;3052:  {
line 3053
;3053:    ADMP( va( "^3!unlock: ^7invalid team\"%c\"\n", teamName[0] ) );
ADDRGP4 $1859
ARGP4
ADDRLP4 0
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3054
;3054:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1833
JUMPV
LABELV $1853
LABELV $1846
LABELV $1839
line 3056
;3055:  }
;3056:  AP( va( "print \"^3!unlock: ^7the %s team has been unlocked by %s\n\"",
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_TeamName
CALLP4
ASGNP4
ADDRGP4 $1860
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1862
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1863
JUMPV
LABELV $1862
ADDRLP4 16
ADDRGP4 $446
ASGNP4
LABELV $1863
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3059
;3057:    BG_TeamName( team ),
;3058:    ( ent ) ? ent->client->pers.netname : "console" ) );
;3059:  return qtrue;
CNSTI4 1
RETI4
LABELV $1833
endproc G_admin_unlock 28 12
export G_admin_disorient
proc G_admin_disorient 2132 16
line 3063
;3060:}
;3061://KK-OAX Begin Addition
;3062:qboolean G_admin_disorient(gentity_t *ent, int skiparg)
;3063:{
line 3069
;3064:	int pids[MAX_CLIENTS], found;
;3065:	char name[MAX_NAME_LENGTH], err[MAX_STRING_CHARS];
;3066:	char *reason;
;3067:	gentity_t *vic;
;3068:
;3069:	if(G_SayArgc() < 2+skiparg) {
ADDRLP4 2092
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1865
line 3070
;3070:		ADMP("^/disorient usage: ^7!disorient [name|slot#] [reason]");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1867
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3071
;3071:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1865
line 3073
;3072:	}
;3073:	G_SayArgv(1+skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3074
;3074:	reason = G_SayConcatArgs(2+skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 2096
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2096
INDIRP4
ASGNP4
line 3076
;3075:
;3076:	if((found = G_ClientNumbersFromString(name, pids, MAX_CLIENTS)) != 1) {
ADDRLP4 1032
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2100
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 2100
INDIRI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 1
EQI4 $1868
line 3077
;3077:		G_MatchOnePlayer(pids, found, err, sizeof(err));
ADDRLP4 8
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 3078
;3078:		ADMP(va("^/disorient: ^7%s", err));
ADDRGP4 $1870
ARGP4
ADDRLP4 1068
ARGP4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3079
;3079:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1868
line 3081
;3080:	}
;3081:	vic = &g_entities[pids[0]];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3082
;3082:	if(!admin_higher(ent, vic)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $1871
line 3083
;3083:		ADMP("^/disorient: ^7sorry, but your intended victim has a higher admin level than you do");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1873
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3084
;3084:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1871
line 3087
;3085:	}
;3086:
;3087:	if(!(vic->client->sess.sessionTeam == TEAM_RED ||
ADDRLP4 2108
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 1
EQI4 $1874
ADDRLP4 2108
INDIRI4
CNSTI4 2
EQI4 $1874
ADDRLP4 2108
INDIRI4
CNSTI4 0
EQI4 $1874
line 3089
;3088:			vic->client->sess.sessionTeam == TEAM_BLUE ||
;3089:			vic->client->sess.sessionTeam == TEAM_FREE )) {
line 3090
;3090:		ADMP("^/disorient: ^7player must be on a team");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1876
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3091
;3091:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1874
line 3093
;3092:	}
;3093:	if(vic->client->pers.disoriented) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1877
line 3094
;3094:		ADMP(va("^/disorient: ^7%s^7 is already disoriented",
ADDRGP4 $1879
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2112
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2112
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3096
;3095:			vic->client->pers.netname));
;3096:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1877
line 3098
;3097:	}
;3098:	vic->client->pers.disoriented = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 1
ASGNI4
line 3099
;3099:	AP(va("chat \"^/disorient: ^7%s ^7is disoriented\" -1",
ADDRGP4 $1880
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3102
;3100:			vic->client->pers.netname));
;3101:
;3102:	CPx(pids[0], va("cp \"%s ^7disoriented you%s%s\"", 
ADDRGP4 $1881
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1887
ADDRLP4 2116
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1888
JUMPV
LABELV $1887
ADDRLP4 2116
ADDRGP4 $1882
ASGNP4
LABELV $1888
ADDRLP4 2116
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1889
ADDRLP4 2120
ADDRGP4 $1884
ASGNP4
ADDRGP4 $1890
JUMPV
LABELV $1889
ADDRLP4 2120
ADDRGP4 $71
ASGNP4
LABELV $1890
ADDRLP4 2120
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1891
ADDRLP4 2124
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $1892
JUMPV
LABELV $1891
ADDRLP4 2124
ADDRGP4 $71
ASGNP4
LABELV $1892
ADDRLP4 2124
INDIRP4
ARGP4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3106
;3103:			(ent?ent->client->pers.netname:"^3SERVER CONSOLE"),
;3104:			(*reason) ? " because:\n" : "",
;3105:			(*reason) ? reason : ""));
;3106:	return qtrue;
CNSTI4 1
RETI4
LABELV $1864
endproc G_admin_disorient 2132 16
export G_admin_orient
proc G_admin_orient 2108 16
line 3109
;3107:}
;3108:qboolean G_admin_orient(gentity_t *ent, int skiparg)
;3109:{
line 3114
;3110:	int pids[MAX_CLIENTS], found;
;3111:	char name[MAX_NAME_LENGTH], err[MAX_STRING_CHARS];
;3112:	gentity_t *vic;
;3113:
;3114:	if(G_SayArgc() < 2+skiparg) {
ADDRLP4 2088
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1894
line 3115
;3115:		ADMP("^/orient usage: ^7!orient [name|slot#]");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1896
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3116
;3116:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1893
JUMPV
LABELV $1894
line 3118
;3117:	}
;3118:	G_SayArgv(1+skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3120
;3119:    //Fix
;3120:	if((found = G_ClientNumbersFromString(name, pids, MAX_CLIENTS)) != 1) {
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2092
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 2092
INDIRI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 1
EQI4 $1897
line 3121
;3121:		G_MatchOnePlayer(pids, found, err, sizeof(err));
ADDRLP4 4
ARGP4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 3122
;3122:		ADMP(va("^/orient: ^7%s", err));
ADDRGP4 $1899
ARGP4
ADDRLP4 1064
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3123
;3123:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1893
JUMPV
LABELV $1897
line 3125
;3124:	}
;3125:	vic = &g_entities[pids[0]];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3127
;3126:
;3127:	if(!vic->client->pers.disoriented) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1900
line 3128
;3128:		ADMP(va("^/orient: ^7%s^7 is not currently disoriented",
ADDRGP4 $1902
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3130
;3129:			vic->client->pers.netname));
;3130:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1893
JUMPV
LABELV $1900
line 3132
;3131:	}
;3132:	vic->client->pers.disoriented = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 3133
;3133:	AP(va("chat \"^/orient: ^7%s ^7is no longer disoriented\" -1",
ADDRGP4 $1903
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3136
;3134:			vic->client->pers.netname));
;3135:
;3136:	CPx(pids[0], va("cp \"%s ^7oriented you\"", 
ADDRGP4 $1904
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1906
ADDRLP4 2100
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1907
JUMPV
LABELV $1906
ADDRLP4 2100
ADDRGP4 $1882
ASGNP4
LABELV $1907
ADDRLP4 2100
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3138
;3137:			(ent?ent->client->pers.netname:"^3SERVER CONSOLE")));
;3138:	return qtrue;
CNSTI4 1
RETI4
LABELV $1893
endproc G_admin_orient 2108 16
export G_admin_slap
proc G_admin_slap 2148 32
line 3142
;3139:}
;3140:
;3141:qboolean G_admin_slap( gentity_t *ent, int skiparg )
;3142:{
line 3152
;3143:	int pids[MAX_CLIENTS], found, dmg;
;3144:	char name[MAX_NAME_LENGTH], err[MAX_STRING_CHARS];
;3145:	char *reason;
;3146:	char damage[4];
;3147:	gentity_t *vic;
;3148:	int soundIndex;
;3149:    
;3150:    //KK-Too many Parameters Check removed.  It'll truncate the reason message.
;3151:    
;3152:	if(G_SayArgc() < 2+skiparg) 
ADDRLP4 2104
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1909
line 3153
;3153:	{
line 3154
;3154:		ADMP("^/slap usage: ^7!slap [name|slot#] [reason] [damage]");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1911
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3155
;3155:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1908
JUMPV
LABELV $1909
line 3158
;3156:	}
;3157:	
;3158:	G_SayArgv(1+skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3159
;3159:	G_SayArgv(2+skiparg, damage, sizeof(damage));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1068
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3161
;3160:	
;3161:	dmg = atoi(damage);
ADDRLP4 1068
ARGP4
ADDRLP4 2108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2108
INDIRI4
ASGNI4
line 3162
;3162:	if(!dmg) 
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1912
line 3163
;3163:	{
line 3164
;3164:	    dmg = 25;
ADDRLP4 4
CNSTI4 25
ASGNI4
line 3165
;3165:	    reason = G_SayConcatArgs(2+skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 2112
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 2112
INDIRP4
ASGNP4
line 3166
;3166:	}
ADDRGP4 $1913
JUMPV
LABELV $1912
line 3168
;3167:	else
;3168:	{
line 3169
;3169:	    reason = G_SayConcatArgs(3+skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 2112
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 2112
INDIRP4
ASGNP4
line 3170
;3170:	}
LABELV $1913
line 3172
;3171:	
;3172:	if((found = G_ClientNumbersFromString(name, pids, MAX_CLIENTS)) != 1) {
ADDRLP4 1036
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2112
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1076
ADDRLP4 2112
INDIRI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 1
EQI4 $1914
line 3173
;3173:		G_MatchOnePlayer(pids, found, err, sizeof(err));
ADDRLP4 12
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 3174
;3174:		ADMP(va("^/slap: ^7%s", err));
ADDRGP4 $1916
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 2116
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3175
;3175:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1908
JUMPV
LABELV $1914
line 3178
;3176:	}
;3177:	
;3178:	vic = &g_entities[pids[0]];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3179
;3179:	if(!admin_higher(ent, vic)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2116
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
NEI4 $1917
line 3180
;3180:		ADMP("^/slap: ^7sorry, but your intended victim has a higher admin level than you do");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1919
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3181
;3181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1908
JUMPV
LABELV $1917
line 3184
;3182:	}
;3183:	
;3184:	if(!(vic->client->sess.sessionTeam == TEAM_RED ||
ADDRLP4 2120
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 1
EQI4 $1920
ADDRLP4 2120
INDIRI4
CNSTI4 2
EQI4 $1920
ADDRLP4 2120
INDIRI4
CNSTI4 0
EQI4 $1920
line 3186
;3185:			vic->client->sess.sessionTeam == TEAM_BLUE ||
;3186:			vic->client->sess.sessionTeam == TEAM_FREE )) {
line 3187
;3187:		ADMP("^/slap: ^7player must be in the game!");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1922
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3188
;3188:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1908
JUMPV
LABELV $1920
line 3191
;3189:	}
;3190:	//Player Not Alive
;3191:	if( vic->health < 1 )
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1923
line 3192
;3192:	{
line 3194
;3193:	    //Is Their Body Alive?
;3194:	    if(vic->s.eType != ET_INVISIBLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
EQI4 $1925
line 3195
;3195:	    {
line 3197
;3196:	        //Make 'em a Bloody mess
;3197:	        G_Damage(vic, NULL, NULL, NULL, NULL, 500, 0, MOD_UNKNOWN);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2124
CNSTP4 0
ASGNP4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRLP4 2128
CNSTP4 0
ASGNP4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRLP4 2128
INDIRP4
ARGP4
CNSTI4 500
ARGI4
ADDRLP4 2132
CNSTI4 0
ASGNI4
ADDRLP4 2132
INDIRI4
ARGI4
ADDRLP4 2132
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3198
;3198:	    }
LABELV $1925
line 3200
;3199:	    //Force Their Butt to Respawn
;3200:	    ClientSpawn( vic );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 3201
;3201:	}
LABELV $1923
line 3203
;3202:	// Will the Slap Kill them? (Obviously false if we Respawned 'em)
;3203:	if(!(vic->health > dmg ))
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $1927
line 3204
;3204:	{  
line 3205
;3205:	        vic->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1
ASGNI4
line 3206
;3206:	}
ADDRGP4 $1928
JUMPV
LABELV $1927
line 3208
;3207:    else //If it won't kill em...Do the full Damage
;3208:    {   
line 3209
;3209:            vic->health -= dmg;
ADDRLP4 2124
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 2124
INDIRP4
ADDRLP4 2124
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 3210
;3210:    }
LABELV $1928
line 3213
;3211:    
;3212:    //KK-OAX Play them the slap sound
;3213:    soundIndex = G_SoundIndex("sound/admin/slap.wav");
ADDRGP4 $1929
ARGP4
ADDRLP4 2124
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 1072
ADDRLP4 2124
INDIRI4
ASGNI4
line 3214
;3214:    G_Sound(vic, CHAN_VOICE, soundIndex );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 3217
;3215:    
;3216:    //Print it to everybody
;3217:    AP(va("chat \"^/slap: ^7%s ^7was slapped\" -1", vic->client->pers.netname));
ADDRGP4 $1930
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3219
;3218:    //CenterPrint it to the Person Being Slapped
;3219:    CPx(pids[0], va("cp \"%s ^7slapped you%s%s\"", 
ADDRGP4 $1931
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1935
ADDRLP4 2132
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1936
JUMPV
LABELV $1935
ADDRLP4 2132
ADDRGP4 $1882
ASGNP4
LABELV $1936
ADDRLP4 2132
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1937
ADDRLP4 2136
ADDRGP4 $1884
ASGNP4
ADDRGP4 $1938
JUMPV
LABELV $1937
ADDRLP4 2136
ADDRGP4 $71
ASGNP4
LABELV $1938
ADDRLP4 2136
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1939
ADDRLP4 2140
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $1940
JUMPV
LABELV $1939
ADDRLP4 2140
ADDRGP4 $71
ASGNP4
LABELV $1940
ADDRLP4 2140
INDIRP4
ARGP4
ADDRLP4 2144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 2144
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3223
;3220:		(ent?ent->client->pers.netname:"^3SERVER CONSOLE"),
;3221:		(*reason) ? " because:\n" : "",
;3222:		(*reason) ? reason : ""));	
;3223:	return qtrue;
CNSTI4 1
RETI4
LABELV $1908
endproc G_admin_slap 2148 32
export G_admin_warn_check
proc G_admin_warn_check 32 8
line 3229
;3224:}
;3225:
;3226:
;3227://Called Each Time a Warning is Created
;3228:int G_admin_warn_check( gentity_t *ent )
;3229:{  
line 3233
;3230:    char *ip, *guid;
;3231:    int i;
;3232:    int t;
;3233:    int numWarnings = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 3235
;3234:
;3235:    t = trap_RealTime( NULL );
CNSTP4 0
ARGP4
ADDRLP4 20
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 3237
;3236:        
;3237:    ip   = ent->client->pers.ip;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 953
ADDP4
ASGNP4
line 3240
;3238:    
;3239:    //We Don't Want to Count Warnings for the LocalHost
;3240:    if( !*ip )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1942
line 3241
;3241:        return 0;
CNSTI4 0
RETI4
ADDRGP4 $1941
JUMPV
LABELV $1942
line 3243
;3242:    
;3243:    guid = ent->client->pers.guid;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
line 3246
;3244:    
;3245:    //Just to make sure...Don't want to crash...Will Figure something better out later
;3246:    if( !*guid )
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1944
line 3247
;3247:        return 0;
CNSTI4 0
RETI4
ADDRGP4 $1941
JUMPV
LABELV $1944
line 3250
;3248:    
;3249:    //For Each Warning, up to the max number of warnings
;3250:    for( i = 0; i < MAX_ADMIN_WARNINGS && g_admin_warnings[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1949
JUMPV
LABELV $1946
line 3251
;3251:    {
line 3253
;3252:        // Ignore Expired Warnings
;3253:        if( ( g_admin_warnings[ i ]->expires - t ) < 1 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1
GEI4 $1950
line 3254
;3254:            continue;
ADDRGP4 $1947
JUMPV
LABELV $1950
line 3256
;3255:        //If a warning matches their IP or GUID
;3256:        if( strstr( ip, g_admin_warnings[ i ]->ip ) || strstr( guid, g_admin_warnings[ i ]->guid ))
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1954
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1952
LABELV $1954
line 3257
;3257:        {
line 3258
;3258:            numWarnings++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3259
;3259:        }
LABELV $1952
line 3260
;3260:    }
LABELV $1947
line 3250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1949
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1955
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_warnings
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1946
LABELV $1955
line 3262
;3261:    //If we get here, return the number of warnings;
;3262:    return numWarnings;
ADDRLP4 16
INDIRI4
RETI4
LABELV $1941
endproc G_admin_warn_check 32 8
export G_admin_warn
proc G_admin_warn 2228 24
line 3267
;3263:}
;3264:
;3265:
;3266:qboolean G_admin_warn( gentity_t *ent, int skiparg )
;3267:{
line 3279
;3268:    int pids[MAX_CLIENTS], found;
;3269:    int seconds;
;3270:    char name[ MAX_NAME_LENGTH ], err[MAX_STRING_CHARS];
;3271:    char *reason;
;3272:    int minargc;
;3273:    char duration[ 32 ];
;3274:    char s2[ MAX_NAME_LENGTH ];
;3275:    gentity_t *vic;
;3276:    int totalWarnings;
;3277:    int soundIndex;
;3278:    
;3279:    if( G_admin_permission( ent, ADMF_UNACCOUNTABLE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 2172
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 2172
INDIRI4
CNSTI4 0
EQI4 $1957
line 3280
;3280:    {
line 3281
;3281:        minargc = 1 + skiparg;
ADDRLP4 1068
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3282
;3282:    }
ADDRGP4 $1958
JUMPV
LABELV $1957
line 3284
;3283:    else
;3284:    {
line 3285
;3285:        minargc = 2 + skiparg;
ADDRLP4 1068
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 3286
;3286:    }
LABELV $1958
line 3288
;3287:  
;3288:    if( G_SayArgc() < minargc )
ADDRLP4 2176
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2176
INDIRI4
ADDRLP4 1068
INDIRI4
GEI4 $1959
line 3289
;3289:    {
line 3290
;3290:        ADMP( "^3!warn: ^7usage: !warn [name|slot|ip] [reason]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1961
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3291
;3291:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1956
JUMPV
LABELV $1959
line 3294
;3292:    }
;3293:    
;3294:    G_SayArgv( 1 + skiparg, name, sizeof( name ) );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3295
;3295:    G_SanitiseString( name, s2, sizeof( s2 ) );
ADDRLP4 12
ARGP4
ADDRLP4 1104
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3296
;3296:    reason = G_SayConcatArgs(2+skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 2180
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 2180
INDIRP4
ASGNP4
line 3298
;3297:  
;3298:    seconds = g_warningExpire.integer;
ADDRLP4 4
ADDRGP4 g_warningExpire+12
INDIRI4
ASGNI4
line 3300
;3299:  
;3300:    if((found = G_ClientNumbersFromString(name, pids, MAX_CLIENTS)) != 1) {
ADDRLP4 12
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 2184
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1140
ADDRLP4 2184
INDIRI4
ASGNI4
ADDRLP4 2184
INDIRI4
CNSTI4 1
EQI4 $1963
line 3301
;3301:		G_MatchOnePlayer(pids, found, err, sizeof(err));
ADDRLP4 44
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1144
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLV
pop
line 3302
;3302:		ADMP(va("^/warn: ^7%s", err));
ADDRGP4 $1965
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 2188
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2188
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3303
;3303:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1956
JUMPV
LABELV $1963
line 3306
;3304:	}
;3305:	
;3306:	vic = &g_entities[pids[0]];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 44
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3307
;3307:	if(!admin_higher(ent, vic)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2188
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2188
INDIRI4
CNSTI4 0
NEI4 $1966
line 3308
;3308:		ADMP("^/slap: ^7sorry, but your intended victim has a higher admin level than you do");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1919
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3309
;3309:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1956
JUMPV
LABELV $1966
line 3312
;3310:	}
;3311:
;3312:    G_admin_duration( ( seconds ) ? seconds : -1,
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1969
ADDRLP4 2192
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $1970
JUMPV
LABELV $1969
ADDRLP4 2192
CNSTI4 -1
ASGNI4
LABELV $1970
ADDRLP4 2192
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 3315
;3313:        duration, sizeof( duration ) );
;3314:
;3315:    admin_create_warning( ent,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2196
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2196
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2196
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 2196
INDIRP4
CNSTI4 953
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 admin_create_warning
CALLI4
pop
line 3321
;3316:        vic->client->pers.netname,
;3317:        vic->client->pers.guid,
;3318:        vic->client->pers.ip,
;3319:        seconds, reason );
;3320:
;3321:    if( !g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1971
line 3322
;3322:        ADMP( "^3!warn: ^7WARNING g_admin not set, not saving warning to a file\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1974
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $1972
JUMPV
LABELV $1971
line 3324
;3323:    else
;3324:        admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1972
line 3327
;3325:  
;3326:    //KK, Use The Check Warnings Deal Here
;3327:    totalWarnings = G_admin_warn_check( vic );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2200
ADDRGP4 G_admin_warn_check
CALLI4
ASGNI4
ADDRLP4 2168
ADDRLP4 2200
INDIRI4
ASGNI4
line 3330
;3328:    
;3329:    // Play the whistle
;3330:    soundIndex = G_SoundIndex("sound/admin/whistle.wav");
ADDRGP4 $1975
ARGP4
ADDRLP4 2204
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 2204
INDIRI4
ASGNI4
line 3331
;3331:    G_GlobalSound( soundIndex );
ADDRLP4 1136
INDIRI4
ARGI4
ADDRGP4 G_GlobalSound
CALLV
pop
line 3334
;3332:    
;3333:    //First Check to make sure g_maxWarnings isn't a Null Value
;3334:    if( g_maxWarnings.integer )
ADDRGP4 g_maxWarnings+12
INDIRI4
CNSTI4 0
EQI4 $1976
line 3335
;3335:    {
line 3337
;3336:        //If they have gone over the max number of warnings...
;3337:        if( totalWarnings >= g_maxWarnings.integer )
ADDRLP4 2168
INDIRI4
ADDRGP4 g_maxWarnings+12
INDIRI4
LTI4 $1979
line 3338
;3338:        {
line 3340
;3339:            //Give them The Boot till the Warning Expires
;3340:            admin_create_ban( ent,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2208
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2208
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2208
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 2208
INDIRP4
CNSTI4 953
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $1982
ARGP4
ADDRGP4 admin_create_ban
CALLI4
pop
line 3347
;3341:            vic->client->pers.netname,
;3342:            vic->client->pers.guid,
;3343:            vic->client->pers.ip,
;3344:            seconds,
;3345:            "Too Many Warnings" );
;3346:    
;3347:            if( g_admin.string[ 0 ] )
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1983
line 3348
;3348:                admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1983
line 3350
;3349:            
;3350:            trap_SendServerCommand( pids[ 0 ],
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1988
ADDRGP4 $998
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2212
ADDRLP4 2216
INDIRP4
ASGNP4
ADDRGP4 $1989
JUMPV
LABELV $1988
ADDRLP4 2212
ADDRGP4 $1986
ASGNP4
LABELV $1989
ADDRGP4 $997
ARGP4
ADDRLP4 2212
INDIRP4
ARGP4
ADDRGP4 $1982
ARGP4
ADDRLP4 2220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 2220
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3355
;3351:                va( "disconnect \"You have been kicked.\n%s^7\nreason:\n%s\"",
;3352:                ( ent ) ? va( "admin:\n%s", ent->client->pers.netname ) : "SERVER",
;3353:                "Too Many Warnings" ) );
;3354:
;3355:            trap_DropClient( pids[ 0 ], va( "has been kicked%s^7. reason: %s",
ADDRGP4 $1005
ARGP4
ADDRGP4 $1990
ARGP4
ADDRGP4 $1982
ARGP4
ADDRLP4 2224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 2224
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 3358
;3356:                "Auto-Admin System",
;3357:                "Too Many Warnings" ) );
;3358:            return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1956
JUMPV
LABELV $1979
line 3361
;3359:        }
;3360:        else
;3361:        {
line 3364
;3362:            
;3363:            //Print it to everybody
;3364:            AP(va("chat \"^/warn: ^7%s ^7was warned\" -1", vic->client->pers.netname));
ADDRGP4 $1991
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2208
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2208
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3366
;3365:            //CenterPrint it to the Person Being Slapped
;3366:            CPx(pids[0], va("cp \"%s ^7warned you%s%s\"", 
ADDRGP4 $1992
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1996
ADDRLP4 2212
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $1997
JUMPV
LABELV $1996
ADDRLP4 2212
ADDRGP4 $1882
ASGNP4
LABELV $1997
ADDRLP4 2212
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1998
ADDRLP4 2216
ADDRGP4 $1884
ASGNP4
ADDRGP4 $1999
JUMPV
LABELV $1998
ADDRLP4 2216
ADDRGP4 $71
ASGNP4
LABELV $1999
ADDRLP4 2216
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2000
ADDRLP4 2220
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $2001
JUMPV
LABELV $2000
ADDRLP4 2220
ADDRGP4 $71
ASGNP4
LABELV $2001
ADDRLP4 2220
INDIRP4
ARGP4
ADDRLP4 2224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 2224
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3370
;3367:		        (ent?ent->client->pers.netname:"^3SERVER CONSOLE"),
;3368:		        (*reason) ? " because:\n" : "",
;3369:		        (*reason) ? reason : ""));	
;3370:	        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1956
JUMPV
LABELV $1976
line 3374
;3371:        }
;3372:    }    
;3373:    else //KK-OAX g_maxWarnings is null or 0
;3374:    {
line 3375
;3375:            AP(va("chat \"^/warn: ^7%s ^7was warned\" -1", vic->client->pers.netname));
ADDRGP4 $1991
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2208
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2208
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3377
;3376:            //CenterPrint it to the Person Being Slapped
;3377:            CPx(pids[0], va("cp \"%s ^7warned you%s%s\"", 
ADDRGP4 $1992
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2005
ADDRLP4 2212
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $2006
JUMPV
LABELV $2005
ADDRLP4 2212
ADDRGP4 $1882
ASGNP4
LABELV $2006
ADDRLP4 2212
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2007
ADDRLP4 2216
ADDRGP4 $1884
ASGNP4
ADDRGP4 $2008
JUMPV
LABELV $2007
ADDRLP4 2216
ADDRGP4 $71
ASGNP4
LABELV $2008
ADDRLP4 2216
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2009
ADDRLP4 2220
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $2010
JUMPV
LABELV $2009
ADDRLP4 2220
ADDRGP4 $71
ASGNP4
LABELV $2010
ADDRLP4 2220
INDIRP4
ARGP4
ADDRLP4 2224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 2224
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3381
;3378:		        (ent?ent->client->pers.netname:"^3SERVER CONSOLE"),
;3379:		        (*reason) ? " because:\n" : "",
;3380:		        (*reason) ? reason : ""));	
;3381:	        return qtrue;
CNSTI4 1
RETI4
LABELV $1956
endproc G_admin_warn 2228 24
export G_admin_shuffle
proc G_admin_shuffle 8 8
line 3387
;3382:	}   
;3383:  
;3384:}
;3385:
;3386:qboolean G_admin_shuffle( gentity_t *ent, int skipargs ) 
;3387:{  
line 3388
;3388:  trap_SendConsoleCommand( EXEC_APPEND, "shuffle" );
CNSTI4 2
ARGI4
ADDRGP4 $146
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3389
;3389:  AP( va( "print \"^3!shuffle: ^7teams shuffled by %s \n\"",
ADDRGP4 $2012
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2014
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRGP4 $2015
JUMPV
LABELV $2014
ADDRLP4 0
ADDRGP4 $446
ASGNP4
LABELV $2015
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
line 3391
;3390:          ( ent ) ? ent->client->pers.netname : "console" ) );
;3391:  return qtrue;
CNSTI4 1
RETI4
LABELV $2011
endproc G_admin_shuffle 8 8
export G_admin_print
proc G_admin_print 1032 12
line 3405
;3392:}
;3393:
;3394://KK-OAX End Additions         
;3395:
;3396:/*         
;3397:================
;3398: G_admin_print
;3399:
;3400: This function facilitates the ADMP define.  ADMP() is similar to CP except
;3401: that it prints the message to the server console if ent is not defined.
;3402:================
;3403:*/
;3404:void G_admin_print( gentity_t *ent, char *m )
;3405:{
line 3406
;3406:  if( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2017
line 3407
;3407:    trap_SendServerCommand( ent - level.gentities, va( "print \"%s\"", m ) );
ADDRGP4 $2020
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level+4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $2018
JUMPV
LABELV $2017
line 3409
;3408:  else
;3409:  {
line 3411
;3410:    char m2[ MAX_STRING_CHARS ];
;3411:    if( !trap_Cvar_VariableIntegerValue( "com_ansiColor" ) )
ADDRGP4 $2023
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $2021
line 3412
;3412:    {
line 3413
;3413:      G_DecolorString( m, m2, sizeof( m2 ) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_DecolorString
CALLV
pop
line 3414
;3414:      trap_Printf( m2 );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 3415
;3415:    }
ADDRGP4 $2022
JUMPV
LABELV $2021
line 3417
;3416:    else
;3417:      trap_Printf( m );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
LABELV $2022
line 3418
;3418:  }
LABELV $2018
line 3419
;3419:}
LABELV $2016
endproc G_admin_print 1032 12
export G_admin_buffer_begin
proc G_admin_buffer_begin 0 0
line 3422
;3420:
;3421:void G_admin_buffer_begin()
;3422:{
line 3423
;3423:  g_bfb[ 0 ] = '\0';
ADDRGP4 g_bfb
CNSTI1 0
ASGNI1
line 3424
;3424:}
LABELV $2024
endproc G_admin_buffer_begin 0 0
export G_admin_buffer_end
proc G_admin_buffer_end 0 8
line 3427
;3425:
;3426:void G_admin_buffer_end( gentity_t *ent )
;3427:{
line 3428
;3428:  ADMP( g_bfb );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 g_bfb
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3429
;3429:}
LABELV $2025
endproc G_admin_buffer_end 0 8
export G_admin_buffer_print
proc G_admin_buffer_print 8 12
line 3432
;3430:
;3431:void G_admin_buffer_print( gentity_t *ent, char *m )
;3432:{
line 3434
;3433:  // 1022 - strlen("print 64 \"\"") - 1
;3434:  if( strlen( m ) + strlen( g_bfb ) >= 1009 )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 g_bfb
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
CNSTI4 1009
LTI4 $2027
line 3435
;3435:  {
line 3436
;3436:    ADMP( g_bfb );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 g_bfb
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3437
;3437:    g_bfb[ 0 ] = '\0';
ADDRGP4 g_bfb
CNSTI1 0
ASGNI1
line 3438
;3438:  }
LABELV $2027
line 3439
;3439:  Q_strcat( g_bfb, sizeof( g_bfb ), m );
ADDRGP4 g_bfb
ARGP4
CNSTI4 32000
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3440
;3440:}
LABELV $2026
endproc G_admin_buffer_print 8 12
export G_admin_cleanup
proc G_admin_cleanup 20 4
line 3444
;3441:
;3442:
;3443:void G_admin_cleanup()
;3444:{
line 3445
;3445:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3447
;3446:
;3447:  for( i = 0; i < MAX_ADMIN_LEVELS && g_admin_levels[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2033
JUMPV
LABELV $2030
line 3448
;3448:  {
line 3449
;3449:    BG_Free( g_admin_levels[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 3450
;3450:    g_admin_levels[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
CNSTP4 0
ASGNP4
line 3451
;3451:  }
LABELV $2031
line 3447
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2033
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $2034
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2030
LABELV $2034
line 3452
;3452:  for( i = 0; i < MAX_ADMIN_ADMINS && g_admin_admins[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2038
JUMPV
LABELV $2035
line 3453
;3453:  {
line 3454
;3454:    BG_Free( g_admin_admins[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 3455
;3455:    g_admin_admins[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
CNSTP4 0
ASGNP4
line 3456
;3456:  }
LABELV $2036
line 3452
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2038
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $2039
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2035
LABELV $2039
line 3457
;3457:  for( i = 0; i < MAX_ADMIN_BANS && g_admin_bans[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2043
JUMPV
LABELV $2040
line 3458
;3458:  {
line 3459
;3459:    BG_Free( g_admin_bans[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 3460
;3460:    g_admin_bans[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
CNSTP4 0
ASGNP4
line 3461
;3461:  }
LABELV $2041
line 3457
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2043
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $2044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2040
LABELV $2044
line 3462
;3462:  for( i = 0; i < MAX_ADMIN_COMMANDS && g_admin_commands[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2048
JUMPV
LABELV $2045
line 3463
;3463:  {
line 3464
;3464:    BG_Free( g_admin_commands[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 3465
;3465:    g_admin_commands[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
CNSTP4 0
ASGNP4
line 3466
;3466:  }
LABELV $2046
line 3462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2048
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2045
LABELV $2049
line 3467
;3467:}
LABELV $2029
endproc G_admin_cleanup 20 4
bss
export g_admin_warnings
align 4
LABELV g_admin_warnings
skip 4096
export g_admin_namelog
align 4
LABELV g_admin_namelog
skip 512
export g_admin_commands
align 4
LABELV g_admin_commands
skip 256
export g_admin_bans
align 4
LABELV g_admin_bans
skip 4096
export g_admin_admins
align 4
LABELV g_admin_admins
skip 4096
export g_admin_levels
align 4
LABELV g_admin_levels
skip 128
align 1
LABELV g_bfb
skip 32000
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
import Svcmd_SaveSession_f
import Svcmd_For_f
import Svcmd_SystemCommand_f
import Svcmd_ClientCommand_f
import Svcmd_Editline_f
import Svcmd_Random_f
import Svcmd_Cvar_f
import Svcmd_Operation_f
import Svcmd_Condition_f
import Svcmd_MessageWrapper
import Svcmd_ListIP_f
import Svcmd_Chat_f
import Svcmd_DumpUser_f
import Svcmd_EjectClient_f
import Svcmd_BannerPrint_f
import Svcmd_ReplaceTexture_f
import Svcmd_CenterPrint_f
import Svcmd_TeamMessage_f
import Svcmd_Status_f
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
LABELV $2023
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2020
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $2012
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1992
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1991
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 47
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1990
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 45
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 83
byte 1 121
byte 1 115
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $1986
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $1982
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $1975
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 47
byte 1 119
byte 1 104
byte 1 105
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1974
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1965
byte 1 94
byte 1 47
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1961
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1931
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1930
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 47
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1929
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 47
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1922
byte 1 94
byte 1 47
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $1919
byte 1 94
byte 1 47
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 100
byte 1 111
byte 1 0
align 1
LABELV $1916
byte 1 94
byte 1 47
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1911
byte 1 94
byte 1 47
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 32
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 91
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $1904
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 34
byte 1 0
align 1
LABELV $1903
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 47
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1902
byte 1 94
byte 1 47
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1899
byte 1 94
byte 1 47
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1896
byte 1 94
byte 1 47
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 0
align 1
LABELV $1884
byte 1 32
byte 1 98
byte 1 101
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1882
byte 1 94
byte 1 51
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 83
byte 1 79
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $1881
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1880
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1879
byte 1 94
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1876
byte 1 94
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1873
byte 1 94
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 100
byte 1 111
byte 1 0
align 1
LABELV $1870
byte 1 94
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1867
byte 1 94
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $1860
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1859
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
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
byte 1 34
byte 1 37
byte 1 99
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1857
byte 1 94
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
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
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 33
byte 1 33
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $1850
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1843
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1837
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 114
byte 1 124
byte 1 98
byte 1 124
byte 1 102
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1829
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1828
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
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
byte 1 34
byte 1 37
byte 1 99
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1826
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 33
byte 1 33
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $1819
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1812
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1806
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 114
byte 1 124
byte 1 98
byte 1 124
byte 1 102
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1801
byte 1 94
byte 1 51
byte 1 33
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1798
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 0
align 1
LABELV $1790
byte 1 37
byte 1 45
byte 1 50
byte 1 115
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 37
byte 1 49
byte 1 53
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1759
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1755
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1750
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1749
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1748
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1740
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1737
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1734
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1731
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 110
byte 1 101
byte 1 119
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1724
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 111
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
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1723
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1705
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 89
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1693
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1682
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 111
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1670
byte 1 94
byte 1 51
byte 1 33
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1659
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 115
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 82
byte 1 69
byte 1 65
byte 1 68
byte 1 89
byte 1 32
byte 1 110
byte 1 111
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1649
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $1635
byte 1 40
byte 1 0
align 1
LABELV $1634
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1615
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1611
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1609
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1608
byte 1 32
byte 1 94
byte 1 51
byte 1 68
byte 1 101
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1607
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1597
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 39
byte 1 37
byte 1 99
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1595
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1593
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1592
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 33
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1591
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1577
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1576
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1562
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 0
align 1
LABELV $1545
byte 1 32
byte 1 0
align 1
LABELV $1544
byte 1 32
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1538
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 41
byte 1 46
byte 1 0
align 1
LABELV $1534
byte 1 73
byte 1 80
byte 1 0
align 1
LABELV $1533
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1528
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 53
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 10
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 92
byte 1 95
byte 1 95
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1476
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $1443
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $1423
byte 1 41
byte 1 0
align 1
LABELV $1421
byte 1 40
byte 1 97
byte 1 46
byte 1 107
byte 1 46
byte 1 97
byte 1 46
byte 1 32
byte 1 0
align 1
LABELV $1420
byte 1 37
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 49
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1387
byte 1 94
byte 1 53
byte 1 0
align 1
LABELV $1384
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1381
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $1380
byte 1 70
byte 1 0
align 1
LABELV $1377
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $1376
byte 1 82
byte 1 0
align 1
LABELV $1373
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $1364
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1359
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 39
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1350
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1349
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1346
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1325
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1309
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1308
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $1307
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1301
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1300
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $1299
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1294
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1291
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1288
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1279
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1277
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1276
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1275
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $1272
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 91
byte 1 109
byte 1 97
byte 1 112
byte 1 93
byte 1 32
byte 1 40
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1265
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 112
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1262
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1259
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1256
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1253
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 104
byte 1 124
byte 1 97
byte 1 124
byte 1 115
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1235
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $1233
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1231
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $1229
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1219
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $1214
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1207
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 105
byte 1 99
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1193
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1188
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1184
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 10
byte 1 0
align 1
LABELV $1178
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1166
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1163
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1157
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1153
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 10
byte 1 0
align 1
LABELV $1147
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1137
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1130
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 10
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1123
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1120
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1116
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1109
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 119
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1105
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1097
byte 1 45
byte 1 0
align 1
LABELV $1096
byte 1 37
byte 1 45
byte 1 50
byte 1 115
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 37
byte 1 49
byte 1 53
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1095
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $1078
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1075
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 73
byte 1 80
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $1052
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1039
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $1034
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 115
byte 1 117
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1029
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 39
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1023
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 93
byte 1 32
byte 1 91
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1006
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1005
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 46
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $998
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $997
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $990
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $988
byte 1 49
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $987
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 119
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $984
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $981
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $978
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $945
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $937
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $922
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $914
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $902
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 47
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 47
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $898
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $889
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $888
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $876
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $873
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $870
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 46
byte 1 32
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 114
byte 1 105
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $835
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $823
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $810
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $801
byte 1 94
byte 1 51
byte 1 33
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $783
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $782
byte 1 117
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $781
byte 1 91
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $780
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $773
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $762
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $755
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $752
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $749
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $746
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $741
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $740
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $737
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $734
byte 1 109
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $731
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $720
byte 1 91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 93
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $715
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $708
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $707
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $704
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $701
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $694
byte 1 91
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 0
align 1
LABELV $689
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 0
align 1
LABELV $684
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $679
byte 1 91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $674
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 0
align 1
LABELV $664
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $660
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $648
byte 1 71
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 95
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 10
byte 1 0
align 1
LABELV $600
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $585
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $584
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $577
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $573
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $564
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $561
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $557
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $556
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $553
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 104
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $550
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 100
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $547
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 119
byte 1 101
byte 1 101
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $544
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 121
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $541
byte 1 80
byte 1 69
byte 1 82
byte 1 77
byte 1 65
byte 1 78
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $496
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $494
byte 1 37
byte 1 42
byte 1 115
byte 1 0
align 1
LABELV $454
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $446
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $444
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 0
align 1
LABELV $442
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $441
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $416
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $382
byte 1 42
byte 1 0
align 1
LABELV $380
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $378
byte 1 105
byte 1 97
byte 1 104
byte 1 67
byte 1 112
byte 1 80
byte 1 119
byte 1 114
byte 1 107
byte 1 109
byte 1 102
byte 1 75
byte 1 110
byte 1 99
byte 1 78
byte 1 63
byte 1 77
byte 1 86
byte 1 100
byte 1 66
byte 1 98
byte 1 101
byte 1 68
byte 1 83
byte 1 53
byte 1 49
byte 1 0
align 1
LABELV $376
byte 1 94
byte 1 51
byte 1 83
byte 1 101
byte 1 110
byte 1 105
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $374
byte 1 105
byte 1 97
byte 1 104
byte 1 67
byte 1 112
byte 1 80
byte 1 119
byte 1 114
byte 1 107
byte 1 109
byte 1 102
byte 1 75
byte 1 110
byte 1 99
byte 1 78
byte 1 63
byte 1 0
align 1
LABELV $372
byte 1 94
byte 1 50
byte 1 74
byte 1 117
byte 1 110
byte 1 105
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $370
byte 1 105
byte 1 97
byte 1 104
byte 1 67
byte 1 112
byte 1 80
byte 1 119
byte 1 114
byte 1 0
align 1
LABELV $368
byte 1 94
byte 1 54
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 97
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $366
byte 1 105
byte 1 97
byte 1 104
byte 1 67
byte 1 0
align 1
LABELV $364
byte 1 94
byte 1 53
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $362
byte 1 97
byte 1 104
byte 1 67
byte 1 0
align 1
LABELV $361
byte 1 94
byte 1 52
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $349
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $348
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $347
byte 1 91
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $339
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $334
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $333
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $332
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $331
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $330
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $324
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $323
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $322
byte 1 109
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $321
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $320
byte 1 105
byte 1 112
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $319
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $311
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $310
byte 1 91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $302
byte 1 10
byte 1 0
align 1
LABELV $301
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $300
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $299
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $298
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $292
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
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
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $288
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $273
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $255
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 98
byte 1 101
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 44
byte 1 32
byte 1 112
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $243
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $231
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $169
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $168
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $167
byte 1 119
byte 1 0
align 1
LABELV $166
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $165
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $164
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $163
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $162
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $161
byte 1 91
byte 1 94
byte 1 51
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $160
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $159
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $158
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $157
byte 1 67
byte 1 0
align 1
LABELV $156
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 57
byte 1 57
byte 1 57
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $154
byte 1 80
byte 1 0
align 1
LABELV $153
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 0
align 1
LABELV $152
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $151
byte 1 82
byte 1 101
byte 1 100
byte 1 117
byte 1 99
byte 1 101
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $150
byte 1 83
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 108
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $148
byte 1 83
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 102
byte 1 0
align 1
LABELV $146
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 40
byte 1 94
byte 1 53
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 73
byte 1 80
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $144
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 40
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 41
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $143
byte 1 66
byte 1 0
align 1
LABELV $142
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $141
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 124
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $137
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 40
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 41
byte 1 0
align 1
LABELV $136
byte 1 114
byte 1 0
align 1
LABELV $135
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $134
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $133
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $132
byte 1 78
byte 1 0
align 1
LABELV $131
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 101
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $129
byte 1 71
byte 1 0
align 1
LABELV $128
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $127
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 104
byte 1 124
byte 1 97
byte 1 124
byte 1 115
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $126
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $125
byte 1 112
byte 1 0
align 1
LABELV $124
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $123
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $122
byte 1 86
byte 1 0
align 1
LABELV $121
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 33
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $119
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $118
byte 1 103
byte 1 111
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $117
byte 1 110
byte 1 0
align 1
LABELV $116
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $115
byte 1 40
byte 1 94
byte 1 53
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $114
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $113
byte 1 101
byte 1 0
align 1
LABELV $112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $111
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $109
byte 1 109
byte 1 0
align 1
LABELV $108
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $107
byte 1 91
byte 1 94
byte 1 51
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $106
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $105
byte 1 77
byte 1 0
align 1
LABELV $104
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $103
byte 1 91
byte 1 94
byte 1 51
byte 1 97
byte 1 124
byte 1 104
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $102
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $101
byte 1 75
byte 1 0
align 1
LABELV $100
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $99
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 105
byte 1 0
align 1
LABELV $97
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $96
byte 1 40
byte 1 94
byte 1 53
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $95
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $94
byte 1 68
byte 1 0
align 1
LABELV $93
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $92
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $91
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 107
byte 1 0
align 1
LABELV $89
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $88
byte 1 40
byte 1 94
byte 1 53
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $87
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $86
byte 1 104
byte 1 0
align 1
LABELV $85
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 0
align 1
LABELV $84
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 104
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $83
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 39
byte 1 115
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $82
byte 1 100
byte 1 0
align 1
LABELV $81
byte 1 100
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $80
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 99
byte 1 0
align 1
LABELV $78
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 124
byte 1 73
byte 1 80
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $76
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 46
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 39
byte 1 119
byte 1 39
byte 1 32
byte 1 40
byte 1 119
byte 1 101
byte 1 101
byte 1 107
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 100
byte 1 39
byte 1 32
byte 1 40
byte 1 100
byte 1 97
byte 1 121
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 104
byte 1 39
byte 1 32
byte 1 40
byte 1 104
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 41
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 109
byte 1 39
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $75
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $74
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 115
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $73
byte 1 121
byte 1 0
align 1
LABELV $72
byte 1 97
byte 1 108
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $71
byte 1 0
align 1
LABELV $70
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $69
byte 1 97
byte 1 0
align 1
LABELV $68
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $67
byte 1 91
byte 1 94
byte 1 51
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $66
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 46
byte 1 32
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 39
byte 1 119
byte 1 39
byte 1 32
byte 1 40
byte 1 119
byte 1 101
byte 1 101
byte 1 107
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 100
byte 1 39
byte 1 32
byte 1 40
byte 1 100
byte 1 97
byte 1 121
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 104
byte 1 39
byte 1 32
byte 1 40
byte 1 104
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 41
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 109
byte 1 39
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 43
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 45
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $65
byte 1 98
byte 1 0
align 1
LABELV $64
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 0
