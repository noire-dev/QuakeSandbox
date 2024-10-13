export vmMain
code
proc vmMain 16 12
file "../../../code/cgame/cg_main.c"
line 48
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
;17:You should have received a copy of the GNU General Public Licenseа
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:// cg_main.c -- initialization and primary entry point for cgame
;24:#include "cg_local.h"
;25:
;26:#ifdef MISSIONPACK
;27:#include "../ui/ui_shared.h"
;28:// display context for new ui stuff
;29:displayContextDef_t cgDC;
;30:#endif
;31:
;32:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;33:void CG_Shutdown( void );
;34:
;35:
;36:int realVidWidth;
;37:int realVidHeight;		// leilei - global video hack
;38:
;39:
;40:/*
;41:================
;42:vmMain
;43:
;44:This is the only way control passes into the module.
;45:This must be the very first function compiled into the .q3vm file
;46:================
;47:*/
;48:intptr_t vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 50
;49:
;50:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $91
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $91
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $107
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $107
address $93
address $94
address $95
address $96
address $97
address $98
address $99
address $100
address $105
code
LABELV $93
line 52
;51:	case CG_INIT:
;52:		CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 53
;53:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $94
line 55
;54:	case CG_SHUTDOWN:
;55:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 56
;56:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $95
line 58
;57:	case CG_CONSOLE_COMMAND:
;58:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $90
JUMPV
LABELV $96
line 60
;59:	case CG_DRAW_ACTIVE_FRAME:
;60:		CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 61
;61:        CG_FairCvars();
ADDRGP4 CG_FairCvars
CALLV
pop
line 62
;62:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $97
line 64
;63:	case CG_CROSSHAIR_PLAYER:
;64:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $90
JUMPV
LABELV $98
line 66
;65:	case CG_LAST_ATTACKER:
;66:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $90
JUMPV
LABELV $99
line 68
;67:	case CG_KEY_EVENT:
;68:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 69
;69:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $100
line 72
;70:	case CG_MOUSE_EVENT:
;71:#ifdef MISSIONPACK
;72:		cgDC.cursorx = cgs.cursorX;
ADDRGP4 cgDC+216
ADDRGP4 cgs+956292
INDIRI4
ASGNI4
line 73
;73:		cgDC.cursory = cgs.cursorY;
ADDRGP4 cgDC+220
ADDRGP4 cgs+956296
INDIRI4
ASGNI4
line 75
;74:#endif
;75:		CG_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 76
;76:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $105
line 78
;77:	case CG_EVENT_HANDLING:
;78:		CG_EventHandling(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 79
;79:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $91
line 81
;80:	default:
;81:		CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $106
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 82
;82:		break;
LABELV $92
line 84
;83:	}
;84:	return -1;
CNSTI4 -1
RETI4
LABELV $90
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address g_gametype
address $109
address $110
byte 4 0
address cl_propsmallsizescale
address $111
address $112
byte 4 1
address cl_propheight
address $113
address $114
byte 4 1
address cl_propspacewidth
address $115
address $116
byte 4 1
address cl_propgapwidth
address $117
address $118
byte 4 1
address cl_smallcharwidth
address $119
address $116
byte 4 1
address cl_smallcharheight
address $120
address $121
byte 4 1
address cl_bigcharwidth
address $122
address $121
byte 4 1
address cl_bigcharheight
address $123
address $121
byte 4 1
address cl_giantcharwidth
address $124
address $125
byte 4 1
address cl_giantcharheight
address $126
address $127
byte 4 1
address cg_itemscaletime
address $128
address $129
byte 4 1
address cg_weaponselecttime
address $130
address $129
byte 4 1
address cg_zoomtime
address $131
address $132
byte 4 1
address cg_weaponBarActiveWidth
address $133
address $110
byte 4 0
address toolgun_mod1
address $134
address $110
byte 4 0
address toolgun_mod2
address $135
address $110
byte 4 0
address toolgun_mod3
address $136
address $110
byte 4 0
address toolgun_mod4
address $137
address $110
byte 4 0
address toolgun_mod5
address $138
address $110
byte 4 0
address toolgun_mod6
address $139
address $110
byte 4 0
address toolgun_mod7
address $140
address $110
byte 4 0
address toolgun_mod8
address $141
address $110
byte 4 0
address toolgun_mod9
address $142
address $110
byte 4 0
address toolgun_mod10
address $143
address $110
byte 4 0
address toolgun_mod11
address $144
address $110
byte 4 0
address toolgun_mod12
address $145
address $110
byte 4 0
address toolgun_mod13
address $146
address $110
byte 4 0
address toolgun_mod14
address $147
address $110
byte 4 0
address toolgun_mod15
address $148
address $110
byte 4 0
address toolgun_mod16
address $149
address $110
byte 4 0
address toolgun_mod17
address $150
address $110
byte 4 0
address toolgun_mod18
address $151
address $110
byte 4 0
address toolgun_mod19
address $152
address $110
byte 4 0
address toolgun_tool
address $153
address $110
byte 4 2
address toolgun_toolcmd1
address $154
address $155
byte 4 0
address toolgun_toolcmd2
address $156
address $155
byte 4 0
address toolgun_toolcmd3
address $157
address $155
byte 4 0
address toolgun_toolcmd4
address $158
address $155
byte 4 0
address toolgun_tooltext
address $159
address $155
byte 4 0
address toolgun_tooltip1
address $160
address $155
byte 4 0
address toolgun_tooltip2
address $161
address $155
byte 4 0
address toolgun_tooltip3
address $162
address $155
byte 4 0
address toolgun_tooltip4
address $163
address $155
byte 4 0
address toolgun_toolmode1
address $164
address $155
byte 4 0
address toolgun_toolmode2
address $165
address $155
byte 4 0
address toolgun_toolmode3
address $166
address $155
byte 4 0
address toolgun_toolmode4
address $167
address $155
byte 4 0
address toolgun_modelst
address $168
address $110
byte 4 0
address sb_classnum_view
address $169
address $110
byte 4 0
address sb_texture_view
address $170
address $110
byte 4 0
address sb_texturename
address $171
address $110
byte 4 0
address cg_hide255
address $172
address $110
byte 4 0
address cg_postprocess
address $173
address $155
byte 4 0
address cl_language
address $174
address $110
byte 4 1
address con_notifytime
address $175
address $118
byte 4 1
address cg_ignore
address $176
address $110
byte 4 0
address ui_backcolors
address $177
address $178
byte 4 1
address cg_leiChibi
address $179
address $110
byte 4 1
address cg_cameraeyes
address $180
address $110
byte 4 1
address cg_helightred
address $181
address $182
byte 4 3
address cg_helightgreen
address $183
address $182
byte 4 3
address cg_helightblue
address $184
address $182
byte 4 3
address cg_tolightred
address $185
address $182
byte 4 3
address cg_tolightgreen
address $186
address $182
byte 4 3
address cg_tolightblue
address $187
address $182
byte 4 3
address cg_plightred
address $188
address $182
byte 4 3
address cg_plightgreen
address $189
address $182
byte 4 3
address cg_plightblue
address $190
address $182
byte 4 3
address cl_screenoffset
address $191
address $192
byte 4 1
address cg_itemstyle
address $193
address $194
byte 4 1
address legsskin
address $195
address $196
byte 4 3
address team_legsskin
address $197
address $196
byte 4 3
address cg_oldscoreboard
address $198
address $110
byte 4 1
address cg_gibtime
address $199
address $200
byte 4 1
address cg_gibjump
address $201
address $202
byte 4 1
address cg_gibvelocity
address $203
address $202
byte 4 1
address cg_gibmodifier
address $204
address $178
byte 4 1
address cg_drawGun
address $205
address $178
byte 4 1
address cg_zoomFov
address $206
address $207
byte 4 1
address cg_fov
address $208
address $209
byte 4 1
address cg_viewsize
address $210
address $182
byte 4 0
address cg_shadows
address $211
address $178
byte 4 1
address cg_gibs
address $212
address $178
byte 4 1
address cg_draw2D
address $213
address $178
byte 4 1
address cg_drawStatus
address $214
address $178
byte 4 1
address cg_drawTimer
address $215
address $110
byte 4 1
address cg_drawFPS
address $216
address $110
byte 4 1
address cg_drawSnapshot
address $217
address $110
byte 4 1
address cg_draw3dIcons
address $218
address $178
byte 4 1
address cg_drawIcons
address $219
address $178
byte 4 1
address cg_drawAttacker
address $220
address $178
byte 4 1
address cg_drawSpeed
address $221
address $110
byte 4 1
address cg_drawCrosshair
address $222
address $223
byte 4 1
address cg_drawCrosshairNames
address $224
address $178
byte 4 1
address cg_crosshairScale
address $225
address $226
byte 4 1
address cg_crosshairX
address $227
address $110
byte 4 1
address cg_crosshairY
address $228
address $110
byte 4 1
address cg_brassTime
address $229
address $230
byte 4 1
address cg_simpleItems
address $231
address $110
byte 4 1
address cg_addMarks
address $232
address $178
byte 4 1
address cg_lagometer
address $233
address $178
byte 4 1
address cg_paintballMode
address $234
address $110
byte 4 1
address cg_disableLevelStartFade
address $235
address $110
byte 4 513
address cg_bigheadMode
address $236
address $110
byte 4 1
address cg_railTrailTime
address $237
address $238
byte 4 1
address cg_gun_x
address $239
address $240
byte 4 1
address cg_gun_y
address $241
address $242
byte 4 1
address cg_gun_z
address $243
address $242
byte 4 1
address cg_centertime
address $244
address $245
byte 4 1
address cg_drawsubtitles
address $246
address $178
byte 4 1
address cg_drawSyncMessage
address $247
address $178
byte 4 1
address cg_runpitch
address $248
address $249
byte 4 1
address cg_runroll
address $250
address $251
byte 4 1
address cg_bobup
address $252
address $251
byte 4 1
address cg_bobpitch
address $253
address $249
byte 4 1
address cg_bobroll
address $254
address $249
byte 4 1
address cg_swingSpeed
address $255
address $256
byte 4 1
address cg_animSpeed
address $257
address $178
byte 4 512
address cg_debugAnim
address $258
address $110
byte 4 512
address cg_debugPosition
address $259
address $110
byte 4 512
address cg_debugEvents
address $260
address $110
byte 4 512
address cg_errorDecay
address $261
address $182
byte 4 0
address cg_nopredict
address $262
address $110
byte 4 0
address cg_noPlayerAnims
address $263
address $110
byte 4 512
address cg_showmiss
address $264
address $110
byte 4 0
address cg_footsteps
address $265
address $178
byte 4 512
address cg_tracerChance
address $266
address $267
byte 4 512
address cg_tracerWidth
address $268
address $178
byte 4 512
address cg_tracerLength
address $269
address $182
byte 4 512
address cg_thirdPersonRange
address $270
address $271
byte 4 1
address cg_thirdPersonAngle
address $272
address $110
byte 4 1
address cg_thirdPersonOffset
address $273
address $274
byte 4 1
address cg_thirdPerson
address $275
address $110
byte 4 1
address cg_atmosphericLevel
address $276
address $194
byte 4 1
address cg_teamChatHeight
address $277
address $116
byte 4 1
address cg_teamChatScaleX
address $278
address $279
byte 4 1
address cg_teamChatScaleY
address $280
address $178
byte 4 1
address cg_predictItems
address $281
address $178
byte 4 1
address cg_deferPlayers
address $282
address $110
byte 4 1
address cg_drawTeamOverlay
address $283
address $110
byte 4 1
address cg_teamOverlayUserinfo
address $284
address $110
byte 4 66
address cg_stats
address $285
address $110
byte 4 0
address cg_drawFriend
address $286
address $178
byte 4 1
address cg_teamChatsOnly
address $287
address $110
byte 4 1
address cg_noVoiceChats
address $288
address $110
byte 4 1
address cg_noVoiceText
address $289
address $110
byte 4 1
address cg_buildScript
address $290
address $110
byte 4 0
address cg_paused
address $291
address $110
byte 4 64
address cg_blood
address $292
address $178
byte 4 1
address cg_alwaysWeaponBar
address $293
address $110
byte 4 1
address cg_hitsound
address $294
address $110
byte 4 1
address cg_voip_teamonly
address $295
address $178
byte 4 1
address cg_voteflags
address $296
address $297
byte 4 64
address cg_cyclegrapple
address $298
address $178
byte 4 1
address cg_vote_custom_commands
address $299
address $155
byte 4 64
address cg_synchronousClients
address $300
address $110
byte 4 8
address cg_autovertex
address $301
address $110
byte 4 1
address cg_redTeamName
address $302
address $303
byte 4 7
address cg_blueTeamName
address $304
address $305
byte 4 7
address cg_currentSelectedPlayer
address $306
address $110
byte 4 1
address cg_currentSelectedPlayerName
address $307
address $155
byte 4 1
address cg_singlePlayer
address $308
address $110
byte 4 2
address cg_singlePlayerActive
address $308
address $110
byte 4 2
address cg_recordSPDemo
address $309
address $110
byte 4 1
address cg_recordSPDemoName
address $310
address $155
byte 4 1
address cg_hudFiles
address $311
address $312
byte 4 1
address cg_enableDust
address $313
address $110
byte 4 4
address cg_enableBreath
address $314
address $110
byte 4 4
address cg_obeliskRespawnDelay
address $315
address $316
byte 4 4
address cg_cameraOrbit
address $317
address $110
byte 4 512
address cg_cameraOrbitDelay
address $318
address $319
byte 4 1
address cg_timescaleFadeEnd
address $320
address $178
byte 4 0
address cg_timescaleFadeSpeed
address $321
address $110
byte 4 0
address cg_timescale
address $322
address $178
byte 4 0
address cg_scorePlum
address $323
address $178
byte 4 1
address cg_chatTime
address $324
address $325
byte 4 1
address cg_consoleTime
address $326
address $325
byte 4 1
address cg_teamChatTime
address $327
address $325
byte 4 1
address cg_toolguninfo
address $328
address $329
byte 4 1
address cg_teamChatY
address $330
address $331
byte 4 1
address cg_chatY
address $332
address $333
byte 4 1
address cg_newFont
address $334
address $178
byte 4 1
address cg_newConsole
address $335
address $178
byte 4 1
address cg_consoleSizeX
address $336
address $245
byte 4 1
address cg_consoleSizeY
address $337
address $338
byte 4 1
address cg_chatSizeX
address $339
address $245
byte 4 1
address cg_chatSizeY
address $340
address $316
byte 4 1
address cg_teamChatSizeX
address $341
address $245
byte 4 1
address cg_teamChatSizeY
address $342
address $316
byte 4 1
address cg_commonConsole
address $343
address $110
byte 4 1
address cg_consoleLines
address $344
address $223
byte 4 1
address cg_commonConsoleLines
address $345
address $245
byte 4 1
address cg_chatLines
address $346
address $245
byte 4 1
address cg_teamChatLines
address $347
address $245
byte 4 1
address cg_fontScale
address $348
address $349
byte 4 1
address cg_fontShadow
address $350
address $178
byte 4 1
address cg_cameraMode
address $351
address $110
byte 4 512
address pmove_fixed
address $352
address $110
byte 4 8
address pmove_msec
address $353
address $354
byte 4 8
address pmove_float
address $355
address $178
byte 4 8
address cg_noTaunt
address $356
address $110
byte 4 1
address cg_noProjectileTrail
address $357
address $110
byte 4 1
address cg_smallFont
address $358
address $359
byte 4 1
address cg_bigFont
address $360
address $267
byte 4 1
address cg_oldRail
address $361
address $110
byte 4 1
address cg_oldRocket
address $362
address $110
byte 4 1
address cg_leiEnhancement
address $363
address $178
byte 4 1
address cg_leiGoreNoise
address $364
address $178
byte 4 1
address cg_leiBrassNoise
address $365
address $178
byte 4 1
address cg_cameramode
address $366
address $110
byte 4 1
address cg_cameraEyes
address $367
address $110
byte 4 1
address cg_cameraEyes_Fwd
address $368
address $118
byte 4 1
address cg_cameraEyes_Up
address $369
address $118
byte 4 1
address cg_oldPlasma
address $370
address $110
byte 4 1
address cg_delag
address $371
address $178
byte 4 3
address cg_cmdTimeNudge
address $372
address $110
byte 4 3
address sv_fps
address $373
address $125
byte 4 8
address cg_projectileNudge
address $374
address $110
byte 4 1
address cg_optimizePrediction
address $375
address $178
byte 4 1
address cl_timeNudge
address $376
address $110
byte 4 1
address cg_trueLightning
address $377
address $378
byte 4 1
address cg_letterBoxSize
address $379
address $110
byte 4 1
address cg_music
address $380
address $155
byte 4 1
address cg_fragmsgsize
address $381
address $382
byte 4 1
address cg_crosshairPulse
address $383
address $178
byte 4 1
address cg_differentCrosshairs
address $384
address $110
byte 4 1
address cg_ch1
address $385
address $178
byte 4 1
address cg_ch1size
address $386
address $226
byte 4 1
address cg_ch2
address $387
address $178
byte 4 1
address cg_ch2size
address $388
address $226
byte 4 1
address cg_ch3
address $389
address $178
byte 4 1
address cg_ch3size
address $390
address $226
byte 4 1
address cg_ch4
address $391
address $178
byte 4 1
address cg_ch4size
address $392
address $226
byte 4 1
address cg_ch5
address $393
address $178
byte 4 1
address cg_ch5size
address $394
address $226
byte 4 1
address cg_ch6
address $395
address $178
byte 4 1
address cg_ch6size
address $396
address $226
byte 4 1
address cg_ch7
address $397
address $178
byte 4 1
address cg_ch7size
address $398
address $226
byte 4 1
address cg_ch8
address $399
address $178
byte 4 1
address cg_ch8size
address $400
address $226
byte 4 1
address cg_ch9
address $401
address $178
byte 4 1
address cg_ch9size
address $402
address $226
byte 4 1
address cg_ch9slze
address $403
address $110
byte 4 0
address cg_ch10
address $404
address $178
byte 4 1
address cg_ch10size
address $405
address $226
byte 4 1
address cg_ch11
address $406
address $178
byte 4 1
address cg_ch11size
address $407
address $226
byte 4 1
address cg_ch12
address $408
address $178
byte 4 1
address cg_ch12size
address $409
address $226
byte 4 1
address cg_ch13
address $410
address $178
byte 4 1
address cg_ch13size
address $411
address $226
byte 4 1
address cg_crosshairColorRed
address $412
address $413
byte 4 3
address cg_crosshairColorGreen
address $414
address $415
byte 4 3
address cg_crosshairColorBlue
address $416
address $382
byte 4 3
address cg_weaponBarStyle
address $417
address $110
byte 4 1
address cg_weaponOrder
address $418
address $419
byte 4 1
address cg_chatBeep
address $420
address $178
byte 4 1
address cg_teamChatBeep
address $421
address $178
byte 4 1
address cg_lodScale
address $422
address $240
byte 4 1
align 4
LABELV cvarTableSize
byte 4 262
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 765
;85:}
;86:
;87:
;88:cg_t				cg;
;89:cgs_t				cgs;
;90:centity_t			cg_entities[MAX_GENTITIES];
;91:weaponInfo_t		cg_weapons[WEAPONS_NUM+1];
;92:itemInfo_t			cg_items[MAX_ITEMS];
;93:
;94:vmCvar_t	g_gametype;
;95:
;96:vmCvar_t	cl_propsmallsizescale;
;97:vmCvar_t 	cl_propheight;
;98:vmCvar_t 	cl_propspacewidth;
;99:vmCvar_t 	cl_propgapwidth;
;100:vmCvar_t 	cl_smallcharwidth;
;101:vmCvar_t 	cl_smallcharheight;
;102:vmCvar_t 	cl_bigcharwidth;
;103:vmCvar_t 	cl_bigcharheight;
;104:vmCvar_t 	cl_giantcharwidth;
;105:vmCvar_t 	cl_giantcharheight;
;106:
;107:vmCvar_t	cg_gibjump;
;108:vmCvar_t	cg_gibvelocity;
;109:vmCvar_t	cg_gibmodifier;
;110:
;111:vmCvar_t	cg_zoomtime;
;112:vmCvar_t	cg_itemscaletime;
;113:vmCvar_t	cg_weaponselecttime;
;114:
;115:vmCvar_t	cg_weaponBarActiveWidth;
;116:
;117://Noire Set
;118:vmCvar_t	toolgun_mod1;		//modifier
;119:vmCvar_t	toolgun_mod2;		//modifier
;120:vmCvar_t	toolgun_mod3;		//modifier
;121:vmCvar_t	toolgun_mod4;		//modifier
;122:vmCvar_t	toolgun_mod5;		//modifier
;123:vmCvar_t	toolgun_mod6;		//modifier
;124:vmCvar_t	toolgun_mod7;		//modifier
;125:vmCvar_t	toolgun_mod8;		//modifier
;126:vmCvar_t	toolgun_mod9;		//modifier
;127:vmCvar_t	toolgun_mod10;		//modifier
;128:vmCvar_t	toolgun_mod11;		//modifier
;129:vmCvar_t	toolgun_mod12;		//modifier
;130:vmCvar_t	toolgun_mod13;		//modifier
;131:vmCvar_t	toolgun_mod14;		//modifier
;132:vmCvar_t	toolgun_mod15;		//modifier
;133:vmCvar_t	toolgun_mod16;		//modifier
;134:vmCvar_t	toolgun_mod17;		//modifier
;135:vmCvar_t	toolgun_mod18;		//modifier
;136:vmCvar_t	toolgun_mod19;		//modifier
;137:vmCvar_t	toolgun_tool;		//tool id
;138:vmCvar_t	toolgun_toolcmd1;	//command
;139:vmCvar_t	toolgun_toolcmd2;	//command
;140:vmCvar_t	toolgun_toolcmd3;	//command
;141:vmCvar_t	toolgun_toolcmd4;	//command
;142:vmCvar_t	toolgun_tooltext;	//info
;143:vmCvar_t	toolgun_tooltip1;	//info
;144:vmCvar_t	toolgun_tooltip2;	//info
;145:vmCvar_t	toolgun_tooltip3;	//info
;146:vmCvar_t	toolgun_tooltip4;	//info
;147:vmCvar_t	toolgun_toolmode1;	//mode
;148:vmCvar_t	toolgun_toolmode2;	//mode
;149:vmCvar_t	toolgun_toolmode3;	//mode
;150:vmCvar_t	toolgun_toolmode4;	//mode
;151:vmCvar_t	toolgun_modelst;	//preview model
;152:vmCvar_t	sb_classnum_view;	//preview class
;153:vmCvar_t	sb_texture_view;	//preview material
;154:vmCvar_t	sb_texturename;		//preview texture
;155:vmCvar_t	cg_hide255;			//invisible model
;156:
;157:vmCvar_t	cg_postprocess;
;158:vmCvar_t	cg_toolguninfo;
;159:vmCvar_t	cl_language;
;160:vmCvar_t	con_notifytime;
;161:vmCvar_t 	cg_leiChibi; // LEILEI THANK YOU!!!
;162:vmCvar_t    cg_cameraeyes;
;163:vmCvar_t    cg_helightred;
;164:vmCvar_t    cg_helightgreen;
;165:vmCvar_t    cg_helightblue;
;166:vmCvar_t    cg_tolightred;
;167:vmCvar_t    cg_tolightgreen;
;168:vmCvar_t    cg_tolightblue;
;169:vmCvar_t    cg_plightred;
;170:vmCvar_t    cg_plightgreen;
;171:vmCvar_t    cg_plightblue;
;172:vmCvar_t    cl_screenoffset;
;173:vmCvar_t    ui_backcolors;
;174:vmCvar_t	legsskin;
;175:vmCvar_t	team_legsskin;
;176:vmCvar_t	cg_oldscoreboard;
;177:vmCvar_t	cg_itemstyle;
;178:vmCvar_t	cg_gibtime;
;179:vmCvar_t	cg_paintballMode;
;180:vmCvar_t	cg_disableLevelStartFade;
;181:vmCvar_t	cg_bigheadMode;
;182:vmCvar_t	cg_railTrailTime;
;183:vmCvar_t	cg_centertime;
;184:vmCvar_t	cg_drawsubtitles;
;185:vmCvar_t	cg_drawSyncMessage;
;186:vmCvar_t	cg_runpitch;
;187:vmCvar_t	cg_runroll;
;188:vmCvar_t	cg_bobup;
;189:vmCvar_t	cg_bobpitch;
;190:vmCvar_t	cg_bobroll;
;191:vmCvar_t	cg_swingSpeed;
;192:vmCvar_t	cg_shadows;
;193:vmCvar_t	cg_gibs;
;194:vmCvar_t	cg_drawTimer;
;195:vmCvar_t	cg_drawFPS;
;196:vmCvar_t	cg_drawSnapshot;
;197:vmCvar_t	cg_draw3dIcons;
;198:vmCvar_t	cg_drawIcons;
;199:vmCvar_t	cg_drawCrosshair;
;200:vmCvar_t	cg_drawCrosshairNames;
;201:vmCvar_t	cg_crosshairScale;
;202:vmCvar_t	cg_crosshairX;
;203:vmCvar_t	cg_crosshairY;
;204:vmCvar_t	cg_draw2D;
;205:vmCvar_t	cg_drawStatus;
;206:vmCvar_t	cg_animSpeed;
;207:vmCvar_t	cg_debugAnim;
;208:vmCvar_t	cg_debugPosition;
;209:vmCvar_t	cg_debugEvents;
;210:vmCvar_t	cg_errorDecay;
;211:vmCvar_t	cg_nopredict;
;212:vmCvar_t	cg_noPlayerAnims;
;213:vmCvar_t	cg_showmiss;
;214:vmCvar_t	cg_footsteps;
;215:vmCvar_t	cg_addMarks;
;216:vmCvar_t	cg_brassTime;
;217:vmCvar_t	cg_viewsize;
;218:vmCvar_t	cg_drawGun;
;219:vmCvar_t	cg_gun_frame;
;220:vmCvar_t	cg_gun_x;
;221:vmCvar_t	cg_gun_y;
;222:vmCvar_t	cg_gun_z;
;223:vmCvar_t	cg_tracerChance;
;224:vmCvar_t	cg_tracerWidth;
;225:vmCvar_t	cg_tracerLength;
;226:vmCvar_t	cg_ignore;
;227:vmCvar_t	cg_simpleItems;
;228:vmCvar_t	cg_fov;
;229:vmCvar_t	cg_zoomFov;
;230:vmCvar_t	cg_thirdPerson;
;231:vmCvar_t	cg_thirdPersonRange;
;232:vmCvar_t	cg_thirdPersonAngle;
;233:vmCvar_t	cg_thirdPersonOffset;
;234:vmCvar_t	cg_lagometer;
;235:vmCvar_t	cg_drawAttacker;
;236:vmCvar_t	cg_drawSpeed;
;237:vmCvar_t	cg_synchronousClients;
;238:vmCvar_t 	cg_teamChatHeight;
;239:vmCvar_t 	cg_teamChatScaleX;
;240:vmCvar_t 	cg_teamChatScaleY;
;241:vmCvar_t 	cg_stats;
;242:vmCvar_t 	cg_buildScript;
;243:vmCvar_t	cg_paused;
;244:vmCvar_t	cg_blood;
;245:vmCvar_t	cg_predictItems;
;246:vmCvar_t	cg_deferPlayers;
;247:vmCvar_t	cg_drawTeamOverlay;
;248:vmCvar_t	cg_teamOverlayUserinfo;
;249:vmCvar_t	cg_drawFriend;
;250:vmCvar_t	cg_teamChatsOnly;
;251:vmCvar_t	cg_noVoiceChats;
;252:vmCvar_t	cg_noVoiceText;
;253:vmCvar_t	cg_hudFiles;
;254:vmCvar_t 	cg_scorePlum;
;255:vmCvar_t	cg_newFont;
;256:vmCvar_t	cg_newConsole;
;257:vmCvar_t	cg_chatTime;
;258:vmCvar_t 	cg_teamChatTime;
;259:vmCvar_t	cg_consoleTime;
;260:
;261:vmCvar_t 	cg_teamChatY;
;262:vmCvar_t 	cg_chatY;
;263:vmCvar_t	cg_fontScale;
;264:vmCvar_t	cg_fontShadow;
;265:
;266:vmCvar_t	cg_consoleSizeX;
;267:vmCvar_t	cg_consoleSizeY;
;268:vmCvar_t	cg_chatSizeX;
;269:vmCvar_t	cg_chatSizeY;
;270:vmCvar_t	cg_teamChatSizeX;
;271:vmCvar_t	cg_teamChatSizeY;
;272:
;273:vmCvar_t	cg_consoleLines;
;274:vmCvar_t	cg_commonConsoleLines;
;275:vmCvar_t	cg_chatLines;
;276:vmCvar_t	cg_teamChatLines;
;277:
;278:vmCvar_t	cg_commonConsole;
;279:vmCvar_t	pmove_fixed;
;280:vmCvar_t	pmove_msec;
;281:vmCvar_t        pmove_float;
;282:vmCvar_t	cg_pmove_msec;
;283:vmCvar_t	cg_cameraMode;
;284:vmCvar_t	cg_cameraEyes_Fwd;
;285:vmCvar_t	cg_cameraEyes_Up;
;286:vmCvar_t	cg_cameraOrbit;
;287:vmCvar_t	cg_cameraOrbitDelay;
;288:vmCvar_t	cg_timescaleFadeEnd;
;289:vmCvar_t	cg_timescaleFadeSpeed;
;290:vmCvar_t	cg_timescale;
;291:vmCvar_t	cg_smallFont;
;292:vmCvar_t	cg_bigFont;
;293:vmCvar_t	cg_noTaunt;
;294:vmCvar_t	cg_noProjectileTrail;
;295:vmCvar_t	cg_oldRail;
;296:vmCvar_t	cg_oldRocket;
;297:vmCvar_t	cg_letterBoxSize;
;298:vmCvar_t	cg_lodScale;
;299:vmCvar_t	cg_leiEnhancement;		// ANOTHER LEILEI LINE!!!
;300:vmCvar_t	cg_leiBrassNoise;		// ANOTHER LEILEI LINE!!!
;301:vmCvar_t	cg_leiGoreNoise;		// ANOTHER LEILEI LINE!!!
;302:vmCvar_t	cg_oldPlasma;
;303:vmCvar_t	cg_trueLightning;
;304:vmCvar_t        cg_music;
;305:vmCvar_t        cg_weaponOrder;
;306:
;307:vmCvar_t        cg_cameramode;			// ANOTHER LEILEI LINE!!!
;308:vmCvar_t        cg_cameraEyes;			// ANOTHER LEILEI LINE!!!
;309:
;310:
;311:
;312:#ifdef MISSIONPACK
;313:vmCvar_t 	cg_redTeamName;
;314:vmCvar_t 	cg_blueTeamName;
;315:vmCvar_t	cg_currentSelectedPlayer;
;316:vmCvar_t	cg_currentSelectedPlayerName;
;317:vmCvar_t	cg_singlePlayer;
;318:vmCvar_t	cg_singlePlayerActive;
;319:vmCvar_t	cg_recordSPDemo;
;320:vmCvar_t	cg_recordSPDemoName;
;321:#endif
;322:vmCvar_t	cg_obeliskRespawnDelay;
;323:vmCvar_t	cg_enableDust;
;324:vmCvar_t	cg_enableBreath;
;325:
;326://unlagged - client options
;327:vmCvar_t	cg_delag;
;328://vmCvar_t	cg_debugDelag;
;329://vmCvar_t	cg_drawBBox;
;330:vmCvar_t	cg_cmdTimeNudge;
;331:vmCvar_t	sv_fps;
;332:vmCvar_t	cg_projectileNudge;
;333:vmCvar_t	cg_optimizePrediction;
;334:vmCvar_t	cl_timeNudge;
;335://unlagged - client options
;336:
;337://elimination addition
;338:vmCvar_t	cg_alwaysWeaponBar;
;339:vmCvar_t	cg_hitsound;
;340:vmCvar_t        cg_voip_teamonly;
;341:vmCvar_t        cg_voteflags;
;342:vmCvar_t        cg_cyclegrapple;
;343:vmCvar_t        cg_vote_custom_commands;
;344:
;345:vmCvar_t                cg_autovertex;
;346:// custom variable used in modified atmospheric effects from q3f
;347:vmCvar_t	cg_atmosphericLevel;
;348:
;349:vmCvar_t	cg_fragmsgsize;
;350:
;351:vmCvar_t	cg_crosshairPulse;
;352:vmCvar_t	cg_differentCrosshairs;
;353:vmCvar_t	cg_ch1;
;354:vmCvar_t	cg_ch1size;
;355:vmCvar_t	cg_ch2;
;356:vmCvar_t	cg_ch2size;
;357:vmCvar_t	cg_ch3;
;358:vmCvar_t	cg_ch3size;
;359:vmCvar_t	cg_ch4;
;360:vmCvar_t	cg_ch4size;
;361:vmCvar_t	cg_ch5;
;362:vmCvar_t	cg_ch5size;
;363:vmCvar_t	cg_ch6;
;364:vmCvar_t	cg_ch6size;
;365:vmCvar_t	cg_ch7;
;366:vmCvar_t	cg_ch7size;
;367:vmCvar_t	cg_ch8;
;368:vmCvar_t	cg_ch8size;
;369:vmCvar_t	cg_ch9;
;370:vmCvar_t	cg_ch9size;
;371:vmCvar_t	cg_ch9slze;
;372:vmCvar_t	cg_ch10;
;373:vmCvar_t	cg_ch10size;
;374:vmCvar_t	cg_ch11;
;375:vmCvar_t	cg_ch11size;
;376:vmCvar_t	cg_ch12;
;377:vmCvar_t	cg_ch12size;
;378:vmCvar_t	cg_ch13;
;379:vmCvar_t	cg_ch13size;
;380:
;381:vmCvar_t	cg_crosshairColorRed;
;382:vmCvar_t	cg_crosshairColorGreen;
;383:vmCvar_t	cg_crosshairColorBlue;
;384:
;385:vmCvar_t	cg_weaponBarStyle;
;386:vmCvar_t	cg_chatBeep;
;387:vmCvar_t	cg_teamChatBeep;
;388:
;389:int	mod_mgspread;
;390:int	mod_sgspread;
;391:int mod_sgcount;
;392:int	mod_lgrange;
;393:int	mod_cgspread;
;394:int mod_jumpheight;
;395:int	mod_gdelay;
;396:int	mod_mgdelay;
;397:int	mod_sgdelay;
;398:int	mod_gldelay;
;399:int	mod_rldelay;
;400:int	mod_lgdelay;
;401:int	mod_pgdelay;
;402:int	mod_rgdelay;
;403:int	mod_bfgdelay;
;404:int	mod_ngdelay;
;405:int	mod_pldelay;
;406:int	mod_cgdelay;
;407:int	mod_ftdelay;
;408:int	mod_amdelay;
;409:float mod_hastefirespeed;
;410:float mod_ammoregenfirespeed;
;411:float mod_scoutfirespeed;
;412:float	mod_guardfirespeed;
;413:float	mod_doublerfirespeed;
;414:int mod_noplayerclip;
;415:int	mod_ammolimit;
;416:int mod_invulmove;
;417:float mod_teamred_firespeed;
;418:float mod_teamblue_firespeed;
;419:int mod_medkitlimit;
;420:int mod_medkitinf;
;421:int mod_teleporterinf;
;422:int mod_portalinf;
;423:int mod_kamikazeinf;
;424:int mod_invulinf;
;425:int mod_accelerate;
;426:int mod_slickmove;
;427:int mod_overlay;
;428:int mod_gravity;
;429:int mod_roundmode;
;430:int mod_zround;
;431:int mod_fogModel;
;432:int mod_fogShader;
;433:int mod_fogDistance;
;434:int mod_fogInterval;
;435:int mod_fogColorR;
;436:int mod_fogColorG;
;437:int mod_fogColorB;
;438:int mod_fogColorA;
;439:int mod_skyShader;
;440:int mod_skyColorR;
;441:int mod_skyColorG;
;442:int mod_skyColorB;
;443:int mod_skyColorA;
;444:
;445:typedef struct {
;446:	vmCvar_t	*vmCvar;
;447:	char		*cvarName;
;448:	char		*defaultString;
;449:	int			cvarFlags;
;450:} cvarTable_t;
;451:
;452:
;453:
;454:static cvarTable_t cvarTable[] = { // bk001129
;455:
;456:	{ &g_gametype, "g_gametype", "0", 0},
;457:
;458:	{ &cl_propsmallsizescale, "cl_propsmallsizescale", "0.60", CVAR_ARCHIVE},
;459:	{ &cl_propheight, "cl_propheight", "21", CVAR_ARCHIVE  },
;460:	{ &cl_propspacewidth, "cl_propspacewidth", "8", CVAR_ARCHIVE  },
;461:	{ &cl_propgapwidth, "cl_propgapwidth", "3", CVAR_ARCHIVE  },
;462:	{ &cl_smallcharwidth, "cl_smallcharwidth", "8", CVAR_ARCHIVE  },
;463:	{ &cl_smallcharheight, "cl_smallcharheight", "12", CVAR_ARCHIVE  },
;464:	{ &cl_bigcharwidth, "cl_bigcharwidth", "12", CVAR_ARCHIVE  },
;465:	{ &cl_bigcharheight, "cl_bigcharheight", "12", CVAR_ARCHIVE  },
;466:	{ &cl_giantcharwidth, "cl_giantcharwidth", "20", CVAR_ARCHIVE  },
;467:	{ &cl_giantcharheight, "cl_giantcharheight", "32", CVAR_ARCHIVE  },
;468:	
;469:	{ &cg_itemscaletime, "cg_itemscaletime", "5000", CVAR_ARCHIVE },
;470:	{ &cg_weaponselecttime, "cg_weaponselecttime", "5000", CVAR_ARCHIVE },
;471:	{ &cg_zoomtime, "cg_zoomtime", "300", CVAR_ARCHIVE },
;472:	{ &cg_weaponBarActiveWidth, "cg_weaponBarActiveWidth", "0", 0 },
;473:
;474:	//ArenaSandBox Set
;475:	{ &toolgun_mod1, "toolgun_mod1", "0", 0},
;476:	{ &toolgun_mod2, "toolgun_mod2", "0", 0},
;477:	{ &toolgun_mod3, "toolgun_mod3", "0", 0},
;478:	{ &toolgun_mod4, "toolgun_mod4", "0", 0},
;479:	{ &toolgun_mod5, "toolgun_mod5", "0", 0},
;480:	{ &toolgun_mod6, "toolgun_mod6", "0", 0},
;481:	{ &toolgun_mod7, "toolgun_mod7", "0", 0},
;482:	{ &toolgun_mod8, "toolgun_mod8", "0", 0},
;483:	{ &toolgun_mod9, "toolgun_mod9", "0", 0},
;484:	{ &toolgun_mod10, "toolgun_mod10", "0", 0},
;485:	{ &toolgun_mod11, "toolgun_mod11", "0", 0},
;486:	{ &toolgun_mod12, "toolgun_mod12", "0", 0},
;487:	{ &toolgun_mod13, "toolgun_mod13", "0", 0},
;488:	{ &toolgun_mod14, "toolgun_mod14", "0", 0},
;489:	{ &toolgun_mod15, "toolgun_mod15", "0", 0},
;490:	{ &toolgun_mod16, "toolgun_mod16", "0", 0},
;491:	{ &toolgun_mod17, "toolgun_mod17", "0", 0},
;492:	{ &toolgun_mod18, "toolgun_mod18", "0", 0},
;493:	{ &toolgun_mod19, "toolgun_mod19", "0", 0},
;494:	{ &toolgun_tool, "toolgun_tool", "0", CVAR_USERINFO},
;495:	{ &toolgun_toolcmd1, "toolgun_toolcmd1", "", 0},
;496:	{ &toolgun_toolcmd2, "toolgun_toolcmd2", "", 0},
;497:	{ &toolgun_toolcmd3, "toolgun_toolcmd3", "", 0},
;498:	{ &toolgun_toolcmd4, "toolgun_toolcmd4", "", 0},
;499:	{ &toolgun_tooltext, "toolgun_tooltext", "", 0},
;500:	{ &toolgun_tooltip1, "toolgun_tooltip1", "", 0},
;501:	{ &toolgun_tooltip2, "toolgun_tooltip2", "", 0},
;502:	{ &toolgun_tooltip3, "toolgun_tooltip3", "", 0},
;503:	{ &toolgun_tooltip4, "toolgun_tooltip4", "", 0},
;504:	{ &toolgun_toolmode1, "toolgun_toolmode1", "", 0},
;505:	{ &toolgun_toolmode2, "toolgun_toolmode2", "", 0},
;506:	{ &toolgun_toolmode3, "toolgun_toolmode3", "", 0},
;507:	{ &toolgun_toolmode4, "toolgun_toolmode4", "", 0},
;508:	{ &toolgun_modelst, "toolgun_modelst", "0", 0},
;509:	{ &sb_classnum_view, "sb_classnum_view", "0", 0},
;510:	{ &sb_texture_view, "sb_texture_view", "0", 0},
;511:	{ &sb_texturename, "sb_texturename", "0", 0},
;512:	{ &cg_hide255, "cg_hide255", "0", 0},
;513:
;514:	{ &cg_postprocess, "cg_postprocess", "", 0 },
;515:	{ &cl_language, "cl_language", "0", CVAR_ARCHIVE },
;516:	{ &con_notifytime, "con_notifytime", "3", CVAR_ARCHIVE },
;517:	{ &cg_ignore, "cg_ignore", "0", 0 },	// used for debugging
;518:    { &ui_backcolors, "ui_backcolors", "1", CVAR_ARCHIVE },
;519:	{ &cg_leiChibi, "cg_leiChibi", "0", CVAR_ARCHIVE}, // LEILEI
;520:    { &cg_cameraeyes, "cg_cameraeyes", "0", CVAR_ARCHIVE },
;521:    { &cg_helightred, "cg_helightred", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;522:    { &cg_helightgreen, "cg_helightgreen", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;523:    { &cg_helightblue, "cg_helightblue", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;524:    { &cg_tolightred, "cg_tolightred", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;525:    { &cg_tolightgreen, "cg_tolightgreen", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;526:    { &cg_tolightblue, "cg_tolightblue", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;527:    { &cg_plightred, "cg_plightred", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;528:    { &cg_plightgreen, "cg_plightgreen", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;529:    { &cg_plightblue, "cg_plightblue", "100", CVAR_USERINFO | CVAR_ARCHIVE },
;530:    { &cl_screenoffset, "cl_screenoffset", "107", CVAR_ARCHIVE },
;531:	{ &cg_itemstyle, "cg_itemstyle", "2", CVAR_ARCHIVE },
;532:	{ &legsskin, "legsskin", "sarge/default", CVAR_USERINFO | CVAR_ARCHIVE },
;533:	{ &team_legsskin, "team_legsskin", "sarge/default", CVAR_USERINFO | CVAR_ARCHIVE },
;534:	{ &cg_oldscoreboard, "cg_oldscoreboard", "0", CVAR_ARCHIVE },
;535:	{ &cg_gibtime, "cg_gibtime", "30", CVAR_ARCHIVE },
;536:	{ &cg_gibjump, "cg_gibjump", "350", CVAR_ARCHIVE },
;537:	{ &cg_gibvelocity, "cg_gibvelocity", "350", CVAR_ARCHIVE },
;538:	{ &cg_gibmodifier, "cg_gibmodifier", "1", CVAR_ARCHIVE },
;539:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;540:	{ &cg_zoomFov, "cg_zoomfov", "22", CVAR_ARCHIVE },
;541:	{ &cg_fov, "cg_fov", "110", CVAR_ARCHIVE },
;542:	{ &cg_viewsize, "cg_viewsize", "100", 0 },
;543:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE  },
;544:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE  },
;545:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE  },
;546:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE  },
;547:	{ &cg_drawTimer, "cg_drawTimer", "0", CVAR_ARCHIVE  },
;548:	{ &cg_drawFPS, "cg_drawFPS", "0", CVAR_ARCHIVE  },
;549:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;550:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE  },
;551:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE  },
;552:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE  },
;553:	{ &cg_drawSpeed, "cg_drawSpeed", "0", CVAR_ARCHIVE  },
;554:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;555:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;556:	{ &cg_crosshairScale, "cg_crosshairScale", "24", CVAR_ARCHIVE },
;557:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;558:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;559:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;560:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;561:	{ &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;562:	{ &cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE },
;563:	{ &cg_paintballMode, "cg_paintballMode", "0", CVAR_ARCHIVE },
;564:	{ &cg_disableLevelStartFade , "cg_disableLevelStartFade", "0", CVAR_ARCHIVE | CVAR_CHEAT},
;565:	{ &cg_bigheadMode, "cg_bigheadMode", "0", CVAR_ARCHIVE },
;566:	{ &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE  },
;567:	{ &cg_gun_x, "cg_gunX", "5", CVAR_ARCHIVE },
;568:	{ &cg_gun_y, "cg_gunY", "-1", CVAR_ARCHIVE },
;569:	{ &cg_gun_z, "cg_gunZ", "-1", CVAR_ARCHIVE },
;570:	{ &cg_centertime, "cg_centertime", "6", CVAR_ARCHIVE },
;571:	{ &cg_drawsubtitles, "cg_drawsubtitles", "1", CVAR_ARCHIVE },
;572:	{ &cg_drawSyncMessage, "cg_drawsyncmessage", "1", CVAR_ARCHIVE },
;573:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;574:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;575:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;576:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;577:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;578:	{ &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_ARCHIVE },
;579:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;580:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;581:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;582:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;583:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;584:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;585:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;586:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;587:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;588:	{ &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;589:	{ &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;590:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;591:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "65", CVAR_ARCHIVE },
;592:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_ARCHIVE },
;593:	{ &cg_thirdPersonOffset, "cg_thirdPersonOffset", "25", CVAR_ARCHIVE },
;594:	{ &cg_thirdPerson, "cg_thirdPerson", "0", CVAR_ARCHIVE},
;595:	//{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;596:	{ &cg_atmosphericLevel, "cg_atmosphericLevel", "2", CVAR_ARCHIVE },
;597:	{ &cg_teamChatHeight, "cg_teamChatHeight", "8", CVAR_ARCHIVE  },
;598:	{ &cg_teamChatScaleX, "cg_teamChatScaleX", "0.7", CVAR_ARCHIVE  },
;599:	{ &cg_teamChatScaleY, "cg_teamChatScaleY", "1", CVAR_ARCHIVE  },
;600:	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;601:#ifdef MISSIONPACK
;602:	{ &cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE },
;603:#else
;604:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;605:#endif
;606:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;607:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;608:	{ &cg_stats, "cg_stats", "0", 0 },
;609:	{ &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;610:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;611:	{ &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;612:	{ &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;613:	// the following variables are created in other parts of the system,
;614:	// but we also reference them here
;615:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;616:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;617:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;618:	{ &cg_alwaysWeaponBar, "cg_alwaysWeaponBar", "0", CVAR_ARCHIVE},	//Elimination
;619:        { &cg_hitsound, "cg_hitsound", "0", CVAR_ARCHIVE},
;620:        { &cg_voip_teamonly, "cg_voipTeamOnly", "1", CVAR_ARCHIVE},
;621:        { &cg_voteflags, "cg_voteflags", "*", CVAR_ROM},
;622:        { &cg_cyclegrapple, "cg_cyclegrapple", "1", CVAR_ARCHIVE},
;623:        { &cg_vote_custom_commands, "cg_vote_custom_commands", "", CVAR_ROM },
;624:	{ &cg_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO },	// communicated by systeminfo
;625:
;626:        { &cg_autovertex, "cg_autovertex", "0", CVAR_ARCHIVE },
;627:#ifdef MISSIONPACK
;628:	{ &cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;629:	{ &cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;630:	{ &cg_currentSelectedPlayer, "cg_currentSelectedPlayer", "0", CVAR_ARCHIVE},
;631:	{ &cg_currentSelectedPlayerName, "cg_currentSelectedPlayerName", "", CVAR_ARCHIVE},
;632:	{ &cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;633:	{ &cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;634:	{ &cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;635:	{ &cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;636:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;637:#endif
;638:	{ &cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;639:	{ &cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;640:	{ &cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;641:
;642:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;643:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;644:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;645:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;646:	{ &cg_timescale, "timescale", "1", 0},
;647:	{ &cg_scorePlum, "cg_scorePlums", "1", CVAR_ARCHIVE},
;648:	{ &cg_chatTime ,    "cg_chatTime", "10000", CVAR_ARCHIVE},
;649:	{ &cg_consoleTime , "cg_consoleTime", "10000", CVAR_ARCHIVE},
;650:	{ &cg_teamChatTime, "cg_teamChatTime", "10000", CVAR_ARCHIVE  },
;651:	
;652:	{ &cg_toolguninfo, "cg_toolguninfo", "40", CVAR_ARCHIVE  },
;653:
;654:	{ &cg_teamChatY, "cg_teamChatY", "180", CVAR_ARCHIVE  },
;655:	{ &cg_chatY, "cg_chatY", "-230", CVAR_ARCHIVE  },
;656:
;657:	{ &cg_newFont ,     "cg_newFont", "1", CVAR_ARCHIVE},
;658:
;659:	{ &cg_newConsole ,  "cg_newConsole", "1", CVAR_ARCHIVE},
;660:
;661:	{ &cg_consoleSizeX , "cg_consoleSizeX", "6", CVAR_ARCHIVE},
;662:	{ &cg_consoleSizeY , "cg_consoleSizeY", "9", CVAR_ARCHIVE},
;663:	{ &cg_chatSizeX , "cg_chatSizeX", "6", CVAR_ARCHIVE},
;664:	{ &cg_chatSizeY , "cg_chatSizeY", "10", CVAR_ARCHIVE},
;665:	{ &cg_teamChatSizeX , "cg_teamChatSizeX", "6", CVAR_ARCHIVE},
;666:	{ &cg_teamChatSizeY , "cg_teamChatSizeY", "10", CVAR_ARCHIVE},
;667:
;668:	{ &cg_commonConsole , "cg_commonConsole", "0", CVAR_ARCHIVE},
;669:
;670:	{ &cg_consoleLines , "cg_consoleLines", "4", CVAR_ARCHIVE},
;671:	{ &cg_commonConsoleLines , "cg_commonConsoleLines", "6", CVAR_ARCHIVE},
;672:	{ &cg_chatLines , "cg_chatLines", "6", CVAR_ARCHIVE},
;673:	{ &cg_teamChatLines , "cg_teamChatLines", "6", CVAR_ARCHIVE},
;674:
;675:	{ &cg_fontScale , "cg_fontScale", "1.5", CVAR_ARCHIVE},
;676:	{ &cg_fontShadow , "cg_fontShadow", "1", CVAR_ARCHIVE},
;677://unlagged - smooth clients #2
;678:// this is done server-side now
;679://	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;680://unlagged - smooth clients #2
;681:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;682:
;683:	{ &pmove_fixed, "pmove_fixed", "0", CVAR_SYSTEMINFO},
;684:	{ &pmove_msec, "pmove_msec", "11", CVAR_SYSTEMINFO},
;685:        { &pmove_float, "pmove_float", "1", CVAR_SYSTEMINFO},
;686:	{ &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;687:	{ &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;688:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;689:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;690:	{ &cg_oldRail, "cg_oldRail", "0", CVAR_ARCHIVE},
;691:	{ &cg_oldRocket, "cg_oldRocket", "0", CVAR_ARCHIVE},
;692:	{ &cg_leiEnhancement, "cg_leiEnhancement", "1", CVAR_ARCHIVE},				// LEILEI default off (in case of whiner)
;693:	{ &cg_leiGoreNoise, "cg_leiGoreNoise", "1", CVAR_ARCHIVE},					// LEILEI
;694:	{ &cg_leiBrassNoise, "cg_leiBrassNoise", "1", CVAR_ARCHIVE},				// LEILEI
;695:	{ &cg_cameramode, "cg_cameramode", "0", CVAR_ARCHIVE},				// LEILEI
;696:	{ &cg_cameraEyes, "cg_cameraEyes", "0", CVAR_ARCHIVE},				// LEILEI
;697:	{ &cg_cameraEyes_Fwd, "cg_cameraEyes_Fwd", "3", CVAR_ARCHIVE},				// LEILEI
;698:	{ &cg_cameraEyes_Up, "cg_cameraEyes_Up", "3", CVAR_ARCHIVE},				// LEILEI
;699:	{ &cg_oldPlasma, "cg_oldPlasma", "0", CVAR_ARCHIVE},
;700://unlagged - client options
;701:	{ &cg_delag, "cg_delag", "1", CVAR_ARCHIVE | CVAR_USERINFO },
;702://	{ &cg_debugDelag, "cg_debugDelag", "0", CVAR_USERINFO | CVAR_CHEAT },
;703://	{ &cg_drawBBox, "cg_drawBBox", "0", CVAR_CHEAT },
;704:	{ &cg_cmdTimeNudge, "cg_cmdTimeNudge", "0", CVAR_ARCHIVE | CVAR_USERINFO },
;705:	// this will be automagically copied from the server
;706:	{ &sv_fps, "sv_fps", "20", CVAR_SYSTEMINFO },
;707:	{ &cg_projectileNudge, "cg_projectileNudge", "0", CVAR_ARCHIVE },
;708:	{ &cg_optimizePrediction, "cg_optimizePrediction", "1", CVAR_ARCHIVE },
;709:	{ &cl_timeNudge, "cl_timeNudge", "0", CVAR_ARCHIVE },
;710://unlagged - client options
;711:	{ &cg_trueLightning, "cg_trueLightning", "0.9", CVAR_ARCHIVE},
;712:	{ &cg_letterBoxSize, "cg_letterBoxSize", "0", CVAR_ARCHIVE},
;713:        { &cg_music, "cg_music", "", CVAR_ARCHIVE},
;714://	{ &cg_pmove_fixed, "cg_pmove_fixed", "0", CVAR_USERINFO | CVAR_ARCHIVE }
;715:
;716:	{ &cg_fragmsgsize, "cg_fragmsgsize", "1.0", CVAR_ARCHIVE},
;717:	{ &cg_crosshairPulse, "cg_crosshairPulse", "1", CVAR_ARCHIVE},
;718:
;719:	{ &cg_differentCrosshairs, "cg_differentCrosshairs", "0", CVAR_ARCHIVE},
;720:	{ &cg_ch1, "cg_ch1", "1", CVAR_ARCHIVE},
;721:	{ &cg_ch1size, "cg_ch1size", "24", CVAR_ARCHIVE},
;722:	{ &cg_ch2, "cg_ch2", "1", CVAR_ARCHIVE},
;723:	{ &cg_ch2size, "cg_ch2size", "24", CVAR_ARCHIVE},
;724:	{ &cg_ch3, "cg_ch3", "1", CVAR_ARCHIVE},
;725:	{ &cg_ch3size, "cg_ch3size", "24", CVAR_ARCHIVE},
;726:	{ &cg_ch4, "cg_ch4", "1", CVAR_ARCHIVE},
;727:	{ &cg_ch4size, "cg_ch4size", "24", CVAR_ARCHIVE},
;728:	{ &cg_ch5, "cg_ch5", "1", CVAR_ARCHIVE},
;729:	{ &cg_ch5size, "cg_ch5size", "24", CVAR_ARCHIVE},
;730:	{ &cg_ch6, "cg_ch6", "1", CVAR_ARCHIVE},
;731:	{ &cg_ch6size, "cg_ch6size", "24", CVAR_ARCHIVE},
;732:	{ &cg_ch7, "cg_ch7", "1", CVAR_ARCHIVE},
;733:	{ &cg_ch7size, "cg_ch7size", "24", CVAR_ARCHIVE},
;734:	{ &cg_ch8, "cg_ch8", "1", CVAR_ARCHIVE},
;735:	{ &cg_ch8size, "cg_ch8size", "24", CVAR_ARCHIVE},
;736:	{ &cg_ch9, "cg_ch9", "1", CVAR_ARCHIVE},
;737:	{ &cg_ch9size, "cg_ch9size", "24", CVAR_ARCHIVE},
;738:	{ &cg_ch9slze, "cg_ch9slze", "0", 0},
;739:	{ &cg_ch10, "cg_ch10", "1", CVAR_ARCHIVE},
;740:	{ &cg_ch10size, "cg_ch10size", "24", CVAR_ARCHIVE},
;741:	{ &cg_ch11, "cg_ch11", "1", CVAR_ARCHIVE},
;742:	{ &cg_ch11size, "cg_ch11size", "24", CVAR_ARCHIVE},
;743:	{ &cg_ch12, "cg_ch12", "1", CVAR_ARCHIVE},
;744:	{ &cg_ch12size, "cg_ch12size", "24", CVAR_ARCHIVE},
;745:	{ &cg_ch13, "cg_ch13", "1", CVAR_ARCHIVE},
;746:	{ &cg_ch13size, "cg_ch13size", "24", CVAR_ARCHIVE},
;747:
;748:	{ &cg_crosshairColorRed, "cg_crosshairColorRed", "0.5", CVAR_ARCHIVE | CVAR_USERINFO},
;749:    { &cg_crosshairColorGreen, "cg_crosshairColorGreen", "0.75", CVAR_ARCHIVE | CVAR_USERINFO},
;750:    { &cg_crosshairColorBlue, "cg_crosshairColorBlue", "1.0", CVAR_ARCHIVE | CVAR_USERINFO},
;751:
;752:	{ &cg_weaponBarStyle, "cg_weaponBarStyle", "0", CVAR_ARCHIVE},
;753:        { &cg_weaponOrder,"cg_weaponOrder", "/1/2/4/3/6/7/8/9/5/", CVAR_ARCHIVE},
;754:        {&cg_chatBeep, "cg_chatBeep", "1", CVAR_ARCHIVE },
;755:        {&cg_teamChatBeep, "cg_teamChatBeep", "1", CVAR_ARCHIVE },
;756:	{ &cg_lodScale, "cg_lodscale", "5", CVAR_ARCHIVE}		//cheat-free backdoor entry to r_lodscale
;757:};
;758:
;759:static int  cvarTableSize = sizeof( cvarTable ) / sizeof( cvarTable[0] );
;760:/*
;761:=================
;762:CG_RegisterCvars
;763:=================
;764:*/
;765:void CG_RegisterCvars( void ) {
line 770
;766:	int			i;
;767:	cvarTable_t	*cv;
;768:	char		var[MAX_TOKEN_CHARS];
;769:
;770:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $427
JUMPV
LABELV $424
line 771
;771:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 773
;772:			cv->defaultString, cv->cvarFlags );
;773:	}
LABELV $425
line 770
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $427
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $424
line 776
;774:
;775:	// see if we are also running the server on this machine
;776:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $428
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 777
;777:	cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+339036
ADDRLP4 1032
INDIRI4
ASGNI4
line 779
;778:
;779:	trap_Cvar_Register(NULL, "model", "sarge/default", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $430
ARGP4
ADDRGP4 $196
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 780
;780:	trap_Cvar_Register(NULL, "headmodel", "sarge/default", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $431
ARGP4
ADDRGP4 $196
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 781
;781:	trap_Cvar_Register(NULL, "team_model", "sarge/default", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $432
ARGP4
ADDRGP4 $196
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 782
;782:	trap_Cvar_Register(NULL, "team_headmodel", "sarge/default", CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $433
ARGP4
ADDRGP4 $196
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 783
;783:}
LABELV $423
endproc CG_RegisterCvars 1036 16
proc CG_ForceModelChange 12 4
line 790
;784:
;785:/*
;786:===================
;787:CG_ForceModelChange
;788:===================
;789:*/
;790:static void CG_ForceModelChange( void ) {
line 793
;791:	int		i;
;792:
;793:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $435
line 796
;794:		const char		*clientInfo;
;795:
;796:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 797
;797:		if ( !clientInfo[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $439
line 798
;798:			continue;
ADDRGP4 $436
JUMPV
LABELV $439
line 800
;799:		}
;800:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 801
;801:	}
LABELV $436
line 793
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $435
line 802
;802:}
LABELV $434
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 16 16
line 809
;803:
;804:/*
;805:=================
;806:CG_UpdateCvars
;807:=================
;808:*/
;809:void CG_UpdateCvars( void ) {
line 813
;810:	int			i;
;811:	cvarTable_t	*cv;
;812:
;813:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $445
JUMPV
LABELV $442
line 818
;814://unlagged - client options
;815:		// clamp the value between 0 and 999
;816:		// negative values would suck - people could conceivably shoot other
;817:		// players *long* after they had left the area, on purpose
;818:		if ( cv->vmCvar == &cg_cmdTimeNudge ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_cmdTimeNudge
CVPU4 4
NEU4 $446
line 819
;819:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 999 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 999
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 820
;820:		}
ADDRGP4 $447
JUMPV
LABELV $446
line 825
;821:		// cl_timenudge less than -50 or greater than 50 doesn't actually
;822:		// do anything more than -50 or 50 (actually the numbers are probably
;823:		// closer to -30 and 30, but 50 is nice and round-ish)
;824:		// might as well not feed the myth, eh?
;825:		else if ( cv->vmCvar == &cl_timeNudge ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cl_timeNudge
CVPU4 4
NEU4 $448
line 826
;826:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, -50, 50 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 -50
ARGI4
CNSTI4 50
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 827
;827:		}
ADDRGP4 $449
JUMPV
LABELV $448
line 841
;828:		// don't let this go too high - no point
;829:		/*else if ( cv->vmCvar == &cg_latentSnaps ) {
;830:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 10 );
;831:		}*/
;832:		// don't let this get too large
;833:		/*else if ( cv->vmCvar == &cg_latentCmds ) {
;834:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, MAX_LATENT_CMDS - 1 );
;835:		}*/
;836:		// no more than 100% packet loss
;837:		/*else if ( cv->vmCvar == &cg_plOut ) {
;838:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 100 );
;839:		}*/
;840://unlagged - client options
;841:                else if ( cv->vmCvar == &cg_errorDecay ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_errorDecay
CVPU4 4
NEU4 $450
line 842
;842:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 250 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 250
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 843
;843:		}
ADDRGP4 $451
JUMPV
LABELV $450
line 844
;844: else if ( cv->vmCvar == &con_notifytime ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 con_notifytime
CVPU4 4
NEU4 $452
line 845
;845:			if (cg_newConsole.integer ) {
ADDRGP4 cg_newConsole+12
INDIRI4
CNSTI4 0
EQI4 $454
line 846
;846:				if (cv->vmCvar->integer != -1) {
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $455
line 847
;847:					Com_sprintf( cv->vmCvar->string, MAX_CVAR_VALUE_STRING, "-1");
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $242
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 848
;848:					trap_Cvar_Set( cv->cvarName, cv->vmCvar->string );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 849
;849:				}
line 850
;850:			} else if (cv->vmCvar->integer <= 0) {
ADDRGP4 $455
JUMPV
LABELV $454
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
GTI4 $459
line 851
;851:				Com_sprintf( cv->vmCvar->string, MAX_CVAR_VALUE_STRING, "%s", cv->defaultString);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $461
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 852
;852:				trap_Cvar_Set( cv->cvarName, cv->vmCvar->string );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 853
;853:			}
LABELV $459
LABELV $455
line 854
;854:		}
LABELV $452
LABELV $451
LABELV $449
LABELV $447
line 855
;855:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 856
;856:	}
LABELV $443
line 813
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $445
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $442
line 862
;857:
;858:	// check for modications here
;859:
;860:	// If team overlay is on, ask for updates from the server.  If its off,
;861:	// let the server know so we don't receive it
;862:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $462
line 863
;863:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 865
;864:
;865:		if ( cg_drawTeamOverlay.integer > 0 ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
LEI4 $466
line 866
;866:			trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $284
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 867
;867:		} else {
ADDRGP4 $467
JUMPV
LABELV $466
line 868
;868:			trap_Cvar_Set( "teamoverlay", "0" );
ADDRGP4 $284
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 869
;869:		}
LABELV $467
line 870
;870:	}
LABELV $462
line 871
;871:}
LABELV $441
endproc CG_UpdateCvars 16 16
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 873
;872:
;873:int CG_CrosshairPlayer( void ) {
line 874
;874:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1952688
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $470
line 875
;875:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $469
JUMPV
LABELV $470
line 877
;876:	}
;877:	return cg.crosshairClientNum;
ADDRGP4 cg+1952684
INDIRI4
RETI4
LABELV $469
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 880
;878:}
;879:
;880:int CG_LastAttacker( void ) {
line 881
;881:	if ( !cg.attackerTime ) {
ADDRGP4 cg+1952704
INDIRI4
CNSTI4 0
NEI4 $476
line 882
;882:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $475
JUMPV
LABELV $476
line 884
;883:	}
;884:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $475
endproc CG_LastAttacker 0 0
export CG_PrintfChat
proc CG_PrintfChat 1028 16
line 887
;885:}
;886:
;887:void QDECL CG_PrintfChat( qboolean team, const char *msg, ... ) {
line 891
;888:	va_list		argptr;
;889:	char		text[1024];
;890:
;891:	va_start (argptr, msg);
ADDRLP4 1024
ADDRFP4 4+4
ASGNP4
line 892
;892:	Q_vsnprintf (text, sizeof(text), msg, argptr);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 893
;893:	va_end (argptr);
ADDRLP4 1024
CNSTP4 0
ASGNP4
line 895
;894:
;895:	if (cg_newConsole.integer) {
ADDRGP4 cg_newConsole+12
INDIRI4
CNSTI4 0
EQI4 $482
line 896
;896:		if (team) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $485
line 897
;897:			CG_AddToGenericConsole(text, &cgs.teamChat);
ADDRLP4 0
ARGP4
ADDRGP4 cgs+950396
ARGP4
ADDRGP4 CG_AddToGenericConsole
CALLV
pop
line 898
;898:		} else {
ADDRGP4 $486
JUMPV
LABELV $485
line 899
;899:			CG_AddToGenericConsole(text, &cgs.chat);
ADDRLP4 0
ARGP4
ADDRGP4 cgs+946468
ARGP4
ADDRGP4 CG_AddToGenericConsole
CALLV
pop
line 900
;900:		}
LABELV $486
line 901
;901:		CG_AddToGenericConsole(text, &cgs.commonConsole);
ADDRLP4 0
ARGP4
ADDRGP4 cgs+938612
ARGP4
ADDRGP4 CG_AddToGenericConsole
CALLV
pop
line 902
;902:	}
LABELV $482
line 903
;903:	trap_Print( text );
ADDRLP4 0
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 904
;904:}
LABELV $480
endproc CG_PrintfChat 1028 16
export CG_Printf
proc CG_Printf 1028 16
line 906
;905:
;906:void QDECL CG_Printf( const char *msg, ... ) {
line 910
;907:	va_list		argptr;
;908:	char		text[1024];
;909:
;910:	va_start (argptr, msg);
ADDRLP4 1024
ADDRFP4 0+4
ASGNP4
line 911
;911:	Q_vsnprintf (text, sizeof(text), msg, argptr);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 912
;912:	va_end (argptr);
ADDRLP4 1024
CNSTP4 0
ASGNP4
line 914
;913:
;914:	if (cg_newConsole.integer) {
ADDRGP4 cg_newConsole+12
INDIRI4
CNSTI4 0
EQI4 $492
line 915
;915:		CG_AddToGenericConsole(text, &cgs.console);
ADDRLP4 0
ARGP4
ADDRGP4 cgs+942540
ARGP4
ADDRGP4 CG_AddToGenericConsole
CALLV
pop
line 916
;916:		CG_AddToGenericConsole(text, &cgs.commonConsole);
ADDRLP4 0
ARGP4
ADDRGP4 cgs+938612
ARGP4
ADDRGP4 CG_AddToGenericConsole
CALLV
pop
line 917
;917:	}
LABELV $492
line 918
;918:	trap_Print( text );
ADDRLP4 0
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 919
;919:}
LABELV $490
endproc CG_Printf 1028 16
export CG_Error
proc CG_Error 1028 16
line 921
;920:
;921:void QDECL CG_Error( const char *msg, ... ) {
line 925
;922:	va_list		argptr;
;923:	char		text[1024];
;924:
;925:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 926
;926:	Q_vsnprintf (text, sizeof(text), msg, argptr);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 927
;927:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 929
;928:
;929:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 930
;930:}
LABELV $497
endproc CG_Error 1028 16
export Com_Error
proc Com_Error 1028 16
line 932
;931:
;932:void QDECL Com_Error( int level, const char *error, ... ) {
line 936
;933:	va_list		argptr;
;934:	char		text[1024];
;935:
;936:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 937
;937:	Q_vsnprintf (text, sizeof(text), error, argptr);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 938
;938:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 940
;939:
;940:	CG_Error( "%s", text);
ADDRGP4 $461
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 941
;941:}
LABELV $499
endproc Com_Error 1028 16
export Com_Printf
proc Com_Printf 1028 16
line 943
;942:
;943:void QDECL Com_Printf( const char *msg, ... ) {
line 947
;944:	va_list		argptr;
;945:	char		text[1024];
;946:
;947:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 948
;948:	Q_vsnprintf (text, sizeof(text), msg, argptr);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 949
;949:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 951
;950:
;951:	CG_Printf ("%s", text);
ADDRGP4 $461
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 952
;952:}
LABELV $501
endproc Com_Printf 1028 16
bss
align 1
LABELV $504
skip 1024
export CG_Argv
code
proc CG_Argv 0 12
line 959
;953:
;954:/*
;955:================
;956:CG_Argv
;957:================
;958:*/
;959:const char *CG_Argv( int arg ) {
line 962
;960:	static char	buffer[MAX_STRING_CHARS];
;961:
;962:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $504
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 964
;963:
;964:	return buffer;
ADDRGP4 $504
RETP4
LABELV $503
endproc CG_Argv 0 12
proc CG_RegisterItemSounds 96 12
line 977
;965:}
;966:
;967:
;968://========================================================================
;969:
;970:/*
;971:=================
;972:CG_RegisterItemSounds
;973:
;974:The server says this item is used on this level
;975:=================
;976:*/
;977:static void CG_RegisterItemSounds( int itemNum ) {
line 983
;978:	gitem_t			*item;
;979:	char			data[MAX_QPATH];
;980:	char			*s, *start;
;981:	int				len;
;982:
;983:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 985
;984:
;985:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $506
line 986
;986:		trap_S_RegisterSound_MiTech( item->pickup_sound, qfalse );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 987
;987:	}
LABELV $506
line 990
;988:
;989:	// parse the space seperated precache string for other media
;990:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 52
ADDP4
INDIRP4
ASGNP4
line 991
;991:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $510
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $512
LABELV $510
line 992
;992:		return;
ADDRGP4 $505
JUMPV
LABELV $511
line 994
;993:
;994:	while (*s) {
line 995
;995:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $515
JUMPV
LABELV $514
line 996
;996:		while (*s && *s != ' ') {
line 997
;997:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 998
;998:		}
LABELV $515
line 996
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $517
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $514
LABELV $517
line 1000
;999:
;1000:		len = s-start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1001
;1001:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $520
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $518
LABELV $520
line 1002
;1002:			CG_Error( "PrecacheItem: %s has bad precache string",
ADDRGP4 $521
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1004
;1003:				item->classname);
;1004:			return;
ADDRGP4 $505
JUMPV
LABELV $518
line 1006
;1005:		}
;1006:		memcpy (data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1007
;1007:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 1008
;1008:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $522
line 1009
;1009:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1010
;1010:		}
LABELV $522
line 1012
;1011:
;1012:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $527
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $524
line 1013
;1013:			trap_S_RegisterSound_MiTech( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1014
;1014:		}
LABELV $524
line 1015
;1015:	}
LABELV $512
line 994
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $511
line 1016
;1016:}
LABELV $505
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 1508 16
line 1026
;1017:
;1018:
;1019:/*
;1020:=================
;1021:CG_RegisterSounds
;1022:
;1023:called during a precache command
;1024:=================
;1025:*/
;1026:static void CG_RegisterSounds( void ) {
line 1034
;1027:	int		i;
;1028:	char	items[MAX_ITEMS+1];
;1029:	char	name[MAX_QPATH];
;1030:	const char	*soundName;
;1031:
;1032:	// voice commands
;1033:#ifdef MISSIONPACK
;1034:	CG_LoadVoiceChats();
ADDRGP4 CG_LoadVoiceChats
CALLV
pop
line 1037
;1035:#endif
;1036:
;1037:	cgs.media.oneMinuteSound = trap_S_RegisterSound_MiTech( "sound/feedback/1_minute.wav", qtrue );
ADDRGP4 $531
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1100
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2204
ADDRLP4 1100
INDIRI4
ASGNI4
line 1038
;1038:	cgs.media.fiveMinuteSound = trap_S_RegisterSound_MiTech( "sound/feedback/5_minute.wav", qtrue );
ADDRGP4 $534
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1104
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2208
ADDRLP4 1104
INDIRI4
ASGNI4
line 1039
;1039:	cgs.media.suddenDeathSound = trap_S_RegisterSound_MiTech( "sound/feedback/sudden_death.wav", qtrue );
ADDRGP4 $537
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1108
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2212
ADDRLP4 1108
INDIRI4
ASGNI4
line 1040
;1040:	cgs.media.oneFragSound = trap_S_RegisterSound_MiTech( "sound/feedback/1_frag.wav", qtrue );
ADDRGP4 $540
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1112
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2224
ADDRLP4 1112
INDIRI4
ASGNI4
line 1041
;1041:	cgs.media.twoFragSound = trap_S_RegisterSound_MiTech( "sound/feedback/2_frags.wav", qtrue );
ADDRGP4 $543
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1116
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2220
ADDRLP4 1116
INDIRI4
ASGNI4
line 1042
;1042:	cgs.media.threeFragSound = trap_S_RegisterSound_MiTech( "sound/feedback/3_frags.wav", qtrue );
ADDRGP4 $546
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1120
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2216
ADDRLP4 1120
INDIRI4
ASGNI4
line 1043
;1043:	cgs.media.count3Sound = trap_S_RegisterSound_MiTech( "sound/feedback/three.wav", qtrue );
ADDRGP4 $549
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1124
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2416
ADDRLP4 1124
INDIRI4
ASGNI4
line 1044
;1044:	cgs.media.count2Sound = trap_S_RegisterSound_MiTech( "sound/feedback/two.wav", qtrue );
ADDRGP4 $552
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1128
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2420
ADDRLP4 1128
INDIRI4
ASGNI4
line 1045
;1045:	cgs.media.count1Sound = trap_S_RegisterSound_MiTech( "sound/feedback/one.wav", qtrue );
ADDRGP4 $555
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1132
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2424
ADDRLP4 1132
INDIRI4
ASGNI4
line 1046
;1046:	cgs.media.countFightSound = trap_S_RegisterSound_MiTech( "sound/feedback/fight.wav", qtrue );
ADDRGP4 $558
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1136
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2428
ADDRLP4 1136
INDIRI4
ASGNI4
line 1047
;1047:	cgs.media.countPrepareSound = trap_S_RegisterSound_MiTech( "sound/feedback/prepare.wav", qtrue );
ADDRGP4 $561
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1140
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2432
ADDRLP4 1140
INDIRI4
ASGNI4
line 1049
;1048:#ifdef MISSIONPACK
;1049:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound_MiTech( "sound/feedback/prepare_team.wav", qtrue );
ADDRGP4 $564
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1144
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2484
ADDRLP4 1144
INDIRI4
ASGNI4
line 1055
;1050:#endif
;1051:
;1052:	// N_G: Another condition that makes no sense to me, see for
;1053:	// yourself if you really meant this
;1054:	// Sago: Makes perfect sense: Load team game stuff if the gametype is a teamgame and not an exception (like GT_LMS)
;1055:	if ( ( ( cgs.gametype >= GT_TEAM ) && ( cgs.ffa_gt != 1 ) ) ||
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $571
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
NEI4 $570
LABELV $571
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $565
LABELV $570
line 1056
;1056:		cg_buildScript.integer ) {
line 1058
;1057:
;1058:		cgs.media.captureAwardSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $574
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1148
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2328
ADDRLP4 1148
INDIRI4
ASGNI4
line 1059
;1059:		cgs.media.redLeadsSound = trap_S_RegisterSound_MiTech( "sound/feedback/redleads.wav", qtrue );
ADDRGP4 $577
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1152
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2340
ADDRLP4 1152
INDIRI4
ASGNI4
line 1060
;1060:		cgs.media.blueLeadsSound = trap_S_RegisterSound_MiTech( "sound/feedback/blueleads.wav", qtrue );
ADDRGP4 $580
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1156
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2344
ADDRLP4 1156
INDIRI4
ASGNI4
line 1061
;1061:		cgs.media.teamsTiedSound = trap_S_RegisterSound_MiTech( "sound/feedback/teamstied.wav", qtrue );
ADDRGP4 $583
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1160
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2348
ADDRLP4 1160
INDIRI4
ASGNI4
line 1062
;1062:		cgs.media.hitTeamSound = trap_S_RegisterSound_MiTech( "sound/feedback/hit_teammate.wav", qtrue );
ADDRGP4 $586
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1164
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2240
ADDRLP4 1164
INDIRI4
ASGNI4
line 1064
;1063:
;1064:		cgs.media.redScoredSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_red_scores.wav", qtrue );
ADDRGP4 $589
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1168
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2332
ADDRLP4 1168
INDIRI4
ASGNI4
line 1065
;1065:		cgs.media.blueScoredSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_blue_scores.wav", qtrue );
ADDRGP4 $592
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1172
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2336
ADDRLP4 1172
INDIRI4
ASGNI4
line 1067
;1066:
;1067:		cgs.media.captureYourTeamSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $574
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1176
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2352
ADDRLP4 1176
INDIRI4
ASGNI4
line 1068
;1068:		cgs.media.captureOpponentSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagcapture_opponent.wav", qtrue );
ADDRGP4 $597
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1180
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2356
ADDRLP4 1180
INDIRI4
ASGNI4
line 1070
;1069:
;1070:		cgs.media.returnYourTeamSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagreturn_yourteam.wav", qtrue );
ADDRGP4 $600
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1184
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2360
ADDRLP4 1184
INDIRI4
ASGNI4
line 1071
;1071:		cgs.media.returnOpponentSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $603
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1188
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2364
ADDRLP4 1188
INDIRI4
ASGNI4
line 1073
;1072:
;1073:		cgs.media.takenYourTeamSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagtaken_yourteam.wav", qtrue );
ADDRGP4 $606
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1192
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2368
ADDRLP4 1192
INDIRI4
ASGNI4
line 1074
;1074:		cgs.media.takenOpponentSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagtaken_opponent.wav", qtrue );
ADDRGP4 $609
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1196
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2372
ADDRLP4 1196
INDIRI4
ASGNI4
line 1076
;1075:
;1076:		if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION|| cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $616
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $616
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $610
LABELV $616
line 1077
;1077:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_red_returned.wav", qtrue );
ADDRGP4 $619
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1200
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2376
ADDRLP4 1200
INDIRI4
ASGNI4
line 1078
;1078:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_blue_returned.wav", qtrue );
ADDRGP4 $622
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1204
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2380
ADDRLP4 1204
INDIRI4
ASGNI4
line 1079
;1079:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_enemy_flag.wav", qtrue );
ADDRGP4 $625
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1208
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2388
ADDRLP4 1208
INDIRI4
ASGNI4
line 1080
;1080:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_team_flag.wav", qtrue );
ADDRGP4 $628
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1212
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2396
ADDRLP4 1212
INDIRI4
ASGNI4
line 1081
;1081:		}
LABELV $610
line 1083
;1082:
;1083:		if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $633
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $629
LABELV $633
line 1085
;1084:			// FIXME: get a replacement for this sound ?
;1085:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound_MiTech( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $603
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1200
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2384
ADDRLP4 1200
INDIRI4
ASGNI4
line 1086
;1086:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_team_1flag.wav", qtrue );
ADDRGP4 $638
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1204
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2400
ADDRLP4 1204
INDIRI4
ASGNI4
line 1087
;1087:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
ADDRGP4 $641
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1208
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2392
ADDRLP4 1208
INDIRI4
ASGNI4
line 1088
;1088:		}
LABELV $629
line 1090
;1089:
;1090:		if ( cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION ||cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $650
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $650
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $650
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $642
LABELV $650
line 1091
;1091:			cgs.media.youHaveFlagSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_you_flag.wav", qtrue );
ADDRGP4 $653
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1200
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2404
ADDRLP4 1200
INDIRI4
ASGNI4
line 1092
;1092:			cgs.media.holyShitSound = trap_S_RegisterSound_MiTech("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $656
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1204
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2412
ADDRLP4 1204
INDIRI4
ASGNI4
line 1093
;1093:		}
LABELV $642
line 1095
;1094:
;1095:                if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 7
EQI4 $661
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $657
LABELV $661
line 1096
;1096:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound_MiTech( "sound/teamplay/voc_base_attack.wav", qtrue );
ADDRGP4 $664
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1200
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2408
ADDRLP4 1200
INDIRI4
ASGNI4
line 1097
;1097:		}
LABELV $657
line 1098
;1098:	}
LABELV $565
line 1100
;1099:
;1100:	cgs.media.tracerSound = trap_S_RegisterSound_MiTech( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $667
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1148
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1824
ADDRLP4 1148
INDIRI4
ASGNI4
line 1101
;1101:	cgs.media.selectSound = trap_S_RegisterSound_MiTech( "sound/weapons/change.wav", qfalse );
ADDRGP4 $670
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1152
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1828
ADDRLP4 1152
INDIRI4
ASGNI4
line 1102
;1102:	cgs.media.wearOffSound = trap_S_RegisterSound_MiTech( "sound/items/wearoff.wav", qfalse );
ADDRGP4 $673
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1156
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1836
ADDRLP4 1156
INDIRI4
ASGNI4
line 1103
;1103:	cgs.media.useNothingSound = trap_S_RegisterSound_MiTech( "sound/items/use_nothing.wav", qfalse );
ADDRGP4 $676
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1160
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1832
ADDRLP4 1160
INDIRI4
ASGNI4
line 1104
;1104:	cgs.media.gibSound = trap_S_RegisterSound_MiTech( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $679
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1164
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2120
ADDRLP4 1164
INDIRI4
ASGNI4
line 1105
;1105:	cgs.media.gibBounce1Sound = trap_S_RegisterSound_MiTech( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $682
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1168
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2124
ADDRLP4 1168
INDIRI4
ASGNI4
line 1106
;1106:	cgs.media.gibBounce2Sound = trap_S_RegisterSound_MiTech( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $685
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1172
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2128
ADDRLP4 1172
INDIRI4
ASGNI4
line 1107
;1107:	cgs.media.gibBounce3Sound = trap_S_RegisterSound_MiTech( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $688
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1176
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2132
ADDRLP4 1176
INDIRI4
ASGNI4
line 1112
;1108:
;1109:
;1110:	// LEILEI
;1111:
;1112:	cgs.media.lspl1Sound = trap_S_RegisterSound_MiTech( "sound/le/splat1.wav", qfalse );
ADDRGP4 $691
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1180
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2168
ADDRLP4 1180
INDIRI4
ASGNI4
line 1113
;1113:	cgs.media.lspl2Sound = trap_S_RegisterSound_MiTech( "sound/le/splat2.wav", qfalse );
ADDRGP4 $694
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1184
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2172
ADDRLP4 1184
INDIRI4
ASGNI4
line 1114
;1114:	cgs.media.lspl3Sound = trap_S_RegisterSound_MiTech( "sound/le/splat3.wav", qfalse );
ADDRGP4 $697
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1188
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2176
ADDRLP4 1188
INDIRI4
ASGNI4
line 1116
;1115:
;1116:	cgs.media.lbul1Sound = trap_S_RegisterSound_MiTech( "sound/le/bullet1.wav", qfalse );
ADDRGP4 $700
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1192
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2180
ADDRLP4 1192
INDIRI4
ASGNI4
line 1117
;1117:	cgs.media.lbul2Sound = trap_S_RegisterSound_MiTech( "sound/le/bullet2.wav", qfalse );
ADDRGP4 $703
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1196
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2184
ADDRLP4 1196
INDIRI4
ASGNI4
line 1118
;1118:	cgs.media.lbul3Sound = trap_S_RegisterSound_MiTech( "sound/le/bullet3.wav", qfalse );
ADDRGP4 $706
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1200
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2188
ADDRLP4 1200
INDIRI4
ASGNI4
line 1120
;1119:
;1120:	cgs.media.lshl1Sound = trap_S_RegisterSound_MiTech( "sound/le/shell1.wav", qfalse );
ADDRGP4 $709
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1204
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2192
ADDRLP4 1204
INDIRI4
ASGNI4
line 1121
;1121:	cgs.media.lshl2Sound = trap_S_RegisterSound_MiTech( "sound/le/shell2.wav", qfalse );
ADDRGP4 $712
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1208
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2196
ADDRLP4 1208
INDIRI4
ASGNI4
line 1122
;1122:	cgs.media.lshl3Sound = trap_S_RegisterSound_MiTech( "sound/le/shell3.wav", qfalse );
ADDRGP4 $715
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1212
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2200
ADDRLP4 1212
INDIRI4
ASGNI4
line 1124
;1123:
;1124:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound_MiTech( "sound/items/invul_activate.wav", qfalse );
ADDRGP4 $718
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1216
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2072
ADDRLP4 1216
INDIRI4
ASGNI4
line 1125
;1125:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound_MiTech( "sound/items/invul_impact_01.wav", qfalse );
ADDRGP4 $721
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1220
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2076
ADDRLP4 1220
INDIRI4
ASGNI4
line 1126
;1126:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound_MiTech( "sound/items/invul_impact_02.wav", qfalse );
ADDRGP4 $724
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1224
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2080
ADDRLP4 1224
INDIRI4
ASGNI4
line 1127
;1127:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound_MiTech( "sound/items/invul_impact_03.wav", qfalse );
ADDRGP4 $727
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1228
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2084
ADDRLP4 1228
INDIRI4
ASGNI4
line 1128
;1128:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound_MiTech( "sound/items/invul_juiced.wav", qfalse );
ADDRGP4 $730
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1232
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2088
ADDRLP4 1232
INDIRI4
ASGNI4
line 1130
;1129:
;1130:	cgs.media.ammoregenSound = trap_S_RegisterSound_MiTech("sound/items/cl_ammoregen.wav", qfalse);
ADDRGP4 $733
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1236
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2488
ADDRLP4 1236
INDIRI4
ASGNI4
line 1131
;1131:	cgs.media.doublerSound = trap_S_RegisterSound_MiTech("sound/items/cl_doubler.wav", qfalse);
ADDRGP4 $736
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1240
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2492
ADDRLP4 1240
INDIRI4
ASGNI4
line 1132
;1132:	cgs.media.guardSound = trap_S_RegisterSound_MiTech("sound/items/cl_guard.wav", qfalse);
ADDRGP4 $739
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1244
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2496
ADDRLP4 1244
INDIRI4
ASGNI4
line 1133
;1133:	cgs.media.scoutSound = trap_S_RegisterSound_MiTech("sound/items/cl_scout.wav", qfalse);
ADDRGP4 $742
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1248
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2500
ADDRLP4 1248
INDIRI4
ASGNI4
line 1134
;1134:        cgs.media.obeliskHitSound1 = trap_S_RegisterSound_MiTech( "sound/items/obelisk_hit_01.wav", qfalse );
ADDRGP4 $745
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1252
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2092
ADDRLP4 1252
INDIRI4
ASGNI4
line 1135
;1135:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound_MiTech( "sound/items/obelisk_hit_02.wav", qfalse );
ADDRGP4 $748
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1256
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2096
ADDRLP4 1256
INDIRI4
ASGNI4
line 1136
;1136:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound_MiTech( "sound/items/obelisk_hit_03.wav", qfalse );
ADDRGP4 $751
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1260
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2100
ADDRLP4 1260
INDIRI4
ASGNI4
line 1137
;1137:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound_MiTech( "sound/items/obelisk_respawn.wav", qfalse );
ADDRGP4 $754
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1264
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2104
ADDRLP4 1264
INDIRI4
ASGNI4
line 1139
;1138:
;1139:	cgs.media.teleInSound = trap_S_RegisterSound_MiTech( "sound/world/telein.wav", qfalse );
ADDRGP4 $757
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1268
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2136
ADDRLP4 1268
INDIRI4
ASGNI4
line 1140
;1140:	cgs.media.teleOutSound = trap_S_RegisterSound_MiTech( "sound/world/teleout.wav", qfalse );
ADDRGP4 $760
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1272
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2140
ADDRLP4 1272
INDIRI4
ASGNI4
line 1141
;1141:	cgs.media.respawnSound = trap_S_RegisterSound_MiTech( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $763
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1276
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2148
ADDRLP4 1276
INDIRI4
ASGNI4
line 1143
;1142:
;1143:	cgs.media.noAmmoSound = trap_S_RegisterSound_MiTech( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $766
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1280
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2144
ADDRLP4 1280
INDIRI4
ASGNI4
line 1145
;1144:
;1145:	cgs.media.talkSound = trap_S_RegisterSound_MiTech( "sound/player/talk.wav", qfalse );
ADDRGP4 $769
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1284
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2152
ADDRLP4 1284
INDIRI4
ASGNI4
line 1146
;1146:	cgs.media.landSound = trap_S_RegisterSound_MiTech( "sound/player/land1.wav", qfalse);
ADDRGP4 $772
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1288
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2156
ADDRLP4 1288
INDIRI4
ASGNI4
line 1148
;1147:
;1148:        switch(cg_hitsound.integer) {
ADDRGP4 cg_hitsound+12
INDIRI4
CNSTI4 0
EQI4 $776
ADDRGP4 $773
JUMPV
LABELV $776
LABELV $773
line 1152
;1149:
;1150:            case 0:
;1151:            default:
;1152:            cgs.media.hitSound = trap_S_RegisterSound_MiTech( "sound/feedback/hitde.wav", qfalse );
ADDRGP4 $779
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1292
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2228
ADDRLP4 1292
INDIRI4
ASGNI4
line 1153
;1153:        };
line 1156
;1154:
;1155:#ifdef MISSIONPACK
;1156:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound_MiTech( "sound/feedback/hithi.wav", qfalse );
ADDRGP4 $782
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1292
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2232
ADDRLP4 1292
INDIRI4
ASGNI4
line 1157
;1157:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound_MiTech( "sound/feedback/hitlo.wav", qfalse );
ADDRGP4 $785
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1296
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2236
ADDRLP4 1296
INDIRI4
ASGNI4
line 1160
;1158:#endif
;1159:
;1160:	cgs.media.impressiveSound = trap_S_RegisterSound_MiTech( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $788
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1300
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2244
ADDRLP4 1300
INDIRI4
ASGNI4
line 1161
;1161:	cgs.media.excellentSound = trap_S_RegisterSound_MiTech( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $791
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1304
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2248
ADDRLP4 1304
INDIRI4
ASGNI4
line 1162
;1162:	cgs.media.deniedSound = trap_S_RegisterSound_MiTech( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $794
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1308
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2252
ADDRLP4 1308
INDIRI4
ASGNI4
line 1163
;1163:	cgs.media.humiliationSound = trap_S_RegisterSound_MiTech( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $797
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1312
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2256
ADDRLP4 1312
INDIRI4
ASGNI4
line 1164
;1164:	cgs.media.assistSound = trap_S_RegisterSound_MiTech( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $800
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1316
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2260
ADDRLP4 1316
INDIRI4
ASGNI4
line 1165
;1165:	cgs.media.defendSound = trap_S_RegisterSound_MiTech( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $803
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1320
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2264
ADDRLP4 1320
INDIRI4
ASGNI4
line 1167
;1166:#ifdef MISSIONPACK
;1167:	cgs.media.firstImpressiveSound = trap_S_RegisterSound_MiTech( "sound/feedback/first_impressive.wav", qtrue );
ADDRGP4 $806
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1324
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2268
ADDRLP4 1324
INDIRI4
ASGNI4
line 1168
;1168:	cgs.media.firstExcellentSound = trap_S_RegisterSound_MiTech( "sound/feedback/first_excellent.wav", qtrue );
ADDRGP4 $809
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1328
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2272
ADDRLP4 1328
INDIRI4
ASGNI4
line 1169
;1169:	cgs.media.firstHumiliationSound = trap_S_RegisterSound_MiTech( "sound/feedback/first_gauntlet.wav", qtrue );
ADDRGP4 $812
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1332
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2276
ADDRLP4 1332
INDIRI4
ASGNI4
line 1172
;1170:#endif
;1171:
;1172:	cgs.media.takenLeadSound = trap_S_RegisterSound_MiTech( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $815
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1336
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2280
ADDRLP4 1336
INDIRI4
ASGNI4
line 1173
;1173:	cgs.media.tiedLeadSound = trap_S_RegisterSound_MiTech( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $818
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1340
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2284
ADDRLP4 1340
INDIRI4
ASGNI4
line 1174
;1174:	cgs.media.lostLeadSound = trap_S_RegisterSound_MiTech( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $821
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1344
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2288
ADDRLP4 1344
INDIRI4
ASGNI4
line 1177
;1175:
;1176:#ifdef MISSIONPACK
;1177:	cgs.media.voteNow = trap_S_RegisterSound_MiTech( "sound/feedback/vote_now.wav", qtrue);
ADDRGP4 $824
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1348
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2292
ADDRLP4 1348
INDIRI4
ASGNI4
line 1178
;1178:	cgs.media.votePassed = trap_S_RegisterSound_MiTech( "sound/feedback/vote_passed.wav", qtrue);
ADDRGP4 $827
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1352
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2296
ADDRLP4 1352
INDIRI4
ASGNI4
line 1179
;1179:	cgs.media.voteFailed = trap_S_RegisterSound_MiTech( "sound/feedback/vote_failed.wav", qtrue);
ADDRGP4 $830
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1356
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2300
ADDRLP4 1356
INDIRI4
ASGNI4
line 1182
;1180:#endif
;1181:
;1182:	cgs.media.watrInSound = trap_S_RegisterSound_MiTech( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $833
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1360
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2304
ADDRLP4 1360
INDIRI4
ASGNI4
line 1183
;1183:	cgs.media.watrOutSound = trap_S_RegisterSound_MiTech( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $836
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1364
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2308
ADDRLP4 1364
INDIRI4
ASGNI4
line 1184
;1184:	cgs.media.watrUnSound = trap_S_RegisterSound_MiTech( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $839
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1368
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2312
ADDRLP4 1368
INDIRI4
ASGNI4
line 1186
;1185:
;1186:	cgs.media.jumpPadSound = trap_S_RegisterSound_MiTech ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $842
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1372
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2164
ADDRLP4 1372
INDIRI4
ASGNI4
line 1188
;1187:
;1188:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $843
line 1189
;1189:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $847
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1190
;1190:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1376
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840
ADDP4
ADDRLP4 1376
INDIRI4
ASGNI4
line 1192
;1191:
;1192:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $850
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1193
;1193:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1380
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+16
ADDP4
ADDRLP4 1380
INDIRI4
ASGNI4
line 1195
;1194:
;1195:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $854
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1196
;1196:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1384
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+32
ADDP4
ADDRLP4 1384
INDIRI4
ASGNI4
line 1198
;1197:
;1198:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $858
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1199
;1199:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1388
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+48
ADDP4
ADDRLP4 1388
INDIRI4
ASGNI4
line 1201
;1200:
;1201:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $862
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1202
;1202:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1392
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+64
ADDP4
ADDRLP4 1392
INDIRI4
ASGNI4
line 1204
;1203:
;1204:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $866
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1205
;1205:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1396
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+96
ADDP4
ADDRLP4 1396
INDIRI4
ASGNI4
line 1207
;1206:
;1207:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $870
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1208
;1208:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1400
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+80
ADDP4
ADDRLP4 1400
INDIRI4
ASGNI4
line 1209
;1209:	}
LABELV $844
line 1188
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $843
line 1211
;1210:	
;1211:	for (i=0 ; i<=10 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $874
line 1212
;1212:		Com_sprintf (name, sizeof(name), "sound/vehicle/engine%i.ogg", i);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $878
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1213
;1213:		cgs.media.carengine[i] = trap_S_RegisterSound_MiTech (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1376
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1952
ADDP4
ADDRLP4 1376
INDIRI4
ASGNI4
line 1214
;1214:	}
LABELV $875
line 1211
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LEI4 $874
line 1217
;1215:
;1216:	// only register the items that the server says we need
;1217:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 1376
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 1376
INDIRP4
ARGP4
CNSTI4 1025
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1219
;1218:
;1219:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $881
line 1221
;1220://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;1221:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 1223
;1222://		}
;1223:	}
LABELV $882
line 1219
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $884
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $881
line 1225
;1224:
;1225:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $885
line 1226
;1226:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 4128
ADDI4
ARGI4
ADDRLP4 1380
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 1380
INDIRP4
ASGNP4
line 1227
;1227:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $889
line 1228
;1228:			break;
ADDRGP4 $887
JUMPV
LABELV $889
line 1230
;1229:		}
;1230:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $891
line 1231
;1231:			continue;	// custom sound
ADDRGP4 $886
JUMPV
LABELV $891
line 1233
;1232:		}
;1233:		cgs.gameSounds[i] = trap_S_RegisterSound_MiTech( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1384
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+359024
ADDP4
ADDRLP4 1384
INDIRI4
ASGNI4
line 1234
;1234:	}
LABELV $886
line 1225
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $885
LABELV $887
line 1237
;1235:
;1236:	// FIXME: only needed with item
;1237:	cgs.media.flightSound = trap_S_RegisterSound_MiTech( "sound/items/flight.wav", qfalse );
ADDRGP4 $896
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1380
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2316
ADDRLP4 1380
INDIRI4
ASGNI4
line 1238
;1238:	cgs.media.medkitSound = trap_S_RegisterSound_MiTech ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $899
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1384
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2320
ADDRLP4 1384
INDIRI4
ASGNI4
line 1239
;1239:	cgs.media.quadSound = trap_S_RegisterSound_MiTech("sound/items/damage3.wav", qfalse);
ADDRGP4 $902
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1388
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1820
ADDRLP4 1388
INDIRI4
ASGNI4
line 1240
;1240:	cgs.media.sfx_ric1 = trap_S_RegisterSound_MiTech ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $905
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1392
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2008
ADDRLP4 1392
INDIRI4
ASGNI4
line 1241
;1241:	cgs.media.sfx_ric2 = trap_S_RegisterSound_MiTech ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $908
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1396
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2012
ADDRLP4 1396
INDIRI4
ASGNI4
line 1242
;1242:	cgs.media.sfx_ric3 = trap_S_RegisterSound_MiTech ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $911
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1400
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2016
ADDRLP4 1400
INDIRI4
ASGNI4
line 1243
;1243:	cgs.media.sfx_railg = trap_S_RegisterSound_MiTech ("sound/weapons/railgun/railgf1a.wav", qfalse);
ADDRGP4 $914
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1404
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2020
ADDRLP4 1404
INDIRI4
ASGNI4
line 1244
;1244:	cgs.media.sfx_rockexp = trap_S_RegisterSound_MiTech ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $917
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1408
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2024
ADDRLP4 1408
INDIRI4
ASGNI4
line 1245
;1245:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound_MiTech ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $920
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1412
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2028
ADDRLP4 1412
INDIRI4
ASGNI4
line 1246
;1246:	cgs.media.sfx_proxexp = trap_S_RegisterSound_MiTech( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
ADDRGP4 $923
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1416
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2032
ADDRLP4 1416
INDIRI4
ASGNI4
line 1247
;1247:	cgs.media.sfx_nghit = trap_S_RegisterSound_MiTech( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
ADDRGP4 $926
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1420
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2036
ADDRLP4 1420
INDIRI4
ASGNI4
line 1248
;1248:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound_MiTech( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
ADDRGP4 $929
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1424
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2040
ADDRLP4 1424
INDIRI4
ASGNI4
line 1249
;1249:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound_MiTech( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
ADDRGP4 $932
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1428
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2044
ADDRLP4 1428
INDIRI4
ASGNI4
line 1250
;1250:	cgs.media.sfx_chghit = trap_S_RegisterSound_MiTech( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
ADDRGP4 $935
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1432
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2048
ADDRLP4 1432
INDIRI4
ASGNI4
line 1251
;1251:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound_MiTech( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
ADDRGP4 $938
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1436
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2052
ADDRLP4 1436
INDIRI4
ASGNI4
line 1252
;1252:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound_MiTech( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
ADDRGP4 $941
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1440
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2056
ADDRLP4 1440
INDIRI4
ASGNI4
line 1253
;1253:	cgs.media.weaponHoverSound = trap_S_RegisterSound_MiTech( "sound/weapons/weapon_hover.wav", qfalse );
ADDRGP4 $944
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1444
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2324
ADDRLP4 1444
INDIRI4
ASGNI4
line 1254
;1254:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound_MiTech( "sound/items/kam_explode.wav", qfalse );
ADDRGP4 $947
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1448
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2060
ADDRLP4 1448
INDIRI4
ASGNI4
line 1255
;1255:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound_MiTech( "sound/items/kam_implode.wav", qfalse );
ADDRGP4 $950
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1452
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2064
ADDRLP4 1452
INDIRI4
ASGNI4
line 1256
;1256:	cgs.media.kamikazeFarSound = trap_S_RegisterSound_MiTech( "sound/items/kam_explode_far.wav", qfalse );
ADDRGP4 $953
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1456
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2068
ADDRLP4 1456
INDIRI4
ASGNI4
line 1257
;1257:	cgs.media.winnerSound = trap_S_RegisterSound_MiTech( "sound/feedback/voc_youwin.wav", qfalse );
ADDRGP4 $956
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1460
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2108
ADDRLP4 1460
INDIRI4
ASGNI4
line 1258
;1258:	cgs.media.loserSound = trap_S_RegisterSound_MiTech( "sound/feedback/voc_youlose.wav", qfalse );
ADDRGP4 $959
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1464
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2112
ADDRLP4 1464
INDIRI4
ASGNI4
line 1259
;1259:	cgs.media.youSuckSound = trap_S_RegisterSound_MiTech( "sound/misc/yousuck.wav", qfalse );
ADDRGP4 $962
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1468
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2116
ADDRLP4 1468
INDIRI4
ASGNI4
line 1261
;1260:
;1261:	cgs.media.wstbimplSound = trap_S_RegisterSound_MiTech("sound/weapons/proxmine/wstbimpl.wav", qfalse);
ADDRGP4 $965
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1472
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2536
ADDRLP4 1472
INDIRI4
ASGNI4
line 1262
;1262:	cgs.media.wstbimpmSound = trap_S_RegisterSound_MiTech("sound/weapons/proxmine/wstbimpm.wav", qfalse);
ADDRGP4 $968
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1476
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2540
ADDRLP4 1476
INDIRI4
ASGNI4
line 1263
;1263:	cgs.media.wstbimpdSound = trap_S_RegisterSound_MiTech("sound/weapons/proxmine/wstbimpd.wav", qfalse);
ADDRGP4 $971
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1480
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2544
ADDRLP4 1480
INDIRI4
ASGNI4
line 1264
;1264:	cgs.media.wstbactvSound = trap_S_RegisterSound_MiTech("sound/weapons/proxmine/wstbactv.wav", qfalse);
ADDRGP4 $974
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1484
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2548
ADDRLP4 1484
INDIRI4
ASGNI4
line 1266
;1265:
;1266:	cgs.media.regenSound = trap_S_RegisterSound_MiTech("sound/items/regen.wav", qfalse);
ADDRGP4 $977
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1488
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2516
ADDRLP4 1488
INDIRI4
ASGNI4
line 1267
;1267:	cgs.media.protectSound = trap_S_RegisterSound_MiTech("sound/items/protect3.wav", qfalse);
ADDRGP4 $980
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1492
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2520
ADDRLP4 1492
INDIRI4
ASGNI4
line 1268
;1268:	cgs.media.n_healthSound = trap_S_RegisterSound_MiTech("sound/items/n_health.wav", qfalse );
ADDRGP4 $983
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1496
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2524
ADDRLP4 1496
INDIRI4
ASGNI4
line 1269
;1269:	cgs.media.hgrenb1aSound = trap_S_RegisterSound_MiTech("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $986
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1500
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2528
ADDRLP4 1500
INDIRI4
ASGNI4
line 1270
;1270:	cgs.media.hgrenb2aSound = trap_S_RegisterSound_MiTech("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $989
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1504
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2532
ADDRLP4 1504
INDIRI4
ASGNI4
line 1273
;1271:
;1272:#ifdef MISSIONPACK
;1273:	trap_S_RegisterSound_MiTech("sound/player/sergei/death1.wav", qfalse );
ADDRGP4 $990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1274
;1274:	trap_S_RegisterSound_MiTech("sound/player/sergei/death2.wav", qfalse );
ADDRGP4 $991
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1275
;1275:	trap_S_RegisterSound_MiTech("sound/player/sergei/death3.wav", qfalse );
ADDRGP4 $992
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1276
;1276:	trap_S_RegisterSound_MiTech("sound/player/sergei/jump1.wav", qfalse );
ADDRGP4 $993
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1277
;1277:	trap_S_RegisterSound_MiTech("sound/player/sergei/pain25_1.wav", qfalse );
ADDRGP4 $994
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1278
;1278:	trap_S_RegisterSound_MiTech("sound/player/sergei/pain75_1.wav", qfalse );
ADDRGP4 $995
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1279
;1279:	trap_S_RegisterSound_MiTech("sound/player/sergei/pain100_1.wav", qfalse );
ADDRGP4 $996
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1280
;1280:	trap_S_RegisterSound_MiTech("sound/player/sergei/falling1.wav", qfalse );
ADDRGP4 $997
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1281
;1281:	trap_S_RegisterSound_MiTech("sound/player/sergei/gasp.wav", qfalse );
ADDRGP4 $998
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1282
;1282:	trap_S_RegisterSound_MiTech("sound/player/sergei/drown.wav", qfalse );
ADDRGP4 $999
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1283
;1283:	trap_S_RegisterSound_MiTech("sound/player/sergei/fall1.wav", qfalse );
ADDRGP4 $1000
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1284
;1284:	trap_S_RegisterSound_MiTech("sound/player/sergei/taunt.wav", qfalse );
ADDRGP4 $1001
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1286
;1285:
;1286:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/death1.wav", qfalse );
ADDRGP4 $1002
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1287
;1287:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/death2.wav", qfalse );
ADDRGP4 $1003
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1288
;1288:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/death3.wav", qfalse );
ADDRGP4 $1004
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1289
;1289:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/jump1.wav", qfalse );
ADDRGP4 $1005
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1290
;1290:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/pain25_1.wav", qfalse );
ADDRGP4 $1006
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1291
;1291:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/pain75_1.wav", qfalse );
ADDRGP4 $1007
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1292
;1292:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/pain100_1.wav", qfalse );
ADDRGP4 $1008
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1293
;1293:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/falling1.wav", qfalse );
ADDRGP4 $1009
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1294
;1294:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/gasp.wav", qfalse );
ADDRGP4 $1010
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1295
;1295:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/drown.wav", qfalse );
ADDRGP4 $1011
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1296
;1296:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/fall1.wav", qfalse );
ADDRGP4 $1012
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1297
;1297:	trap_S_RegisterSound_MiTech("sound/player/kyonshi/taunt.wav", qfalse );
ADDRGP4 $1013
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
pop
line 1300
;1298:#endif
;1299:
;1300:}
LABELV $528
endproc CG_RegisterSounds 1508 16
export CG_RegisterOverlay
proc CG_RegisterOverlay 16 4
line 1312
;1301:
;1302:
;1303://===================================================================================
;1304:
;1305:/*
;1306:=================
;1307:CG_RegisterOverlay
;1308:
;1309:Registers the graphic for the target_effect overlay.
;1310:=================
;1311:*/
;1312:void CG_RegisterOverlay( void ) {
line 1315
;1313:	const char *overlay;
;1314:
;1315:	overlay = CG_ConfigString( CS_OVERLAY );
CNSTI4 8610
ARGI4
ADDRLP4 4
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1316
;1316:	if ( strlen(overlay) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1015
line 1317
;1317:		cgs.media.effectOverlay = trap_R_RegisterShaderNoMip( overlay );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1776
ADDRLP4 12
INDIRI4
ASGNI4
line 1318
;1318:	} else {
ADDRGP4 $1016
JUMPV
LABELV $1015
line 1319
;1319:		cgs.media.effectOverlay = 0;
ADDRGP4 cgs+956380+1776
CNSTI4 0
ASGNI4
line 1320
;1320:	}
LABELV $1016
line 1321
;1321:}
LABELV $1014
endproc CG_RegisterOverlay 16 4
export CG_SetDefaultWeaponProperties
proc CG_SetDefaultWeaponProperties 0 0
line 1326
;1322:
;1323://===================================================================================
;1324:
;1325:
;1326:void CG_SetDefaultWeaponProperties(void) {
line 1327
;1327:	mod_sgspread = 700;
ADDRGP4 mod_sgspread
CNSTI4 700
ASGNI4
line 1328
;1328:	mod_sgcount = 11;
ADDRGP4 mod_sgcount
CNSTI4 11
ASGNI4
line 1329
;1329:	mod_lgrange = 768;
ADDRGP4 mod_lgrange
CNSTI4 768
ASGNI4
line 1330
;1330:	mod_mgspread = 200;
ADDRGP4 mod_mgspread
CNSTI4 200
ASGNI4
line 1331
;1331:	mod_cgspread = 600;
ADDRGP4 mod_cgspread
CNSTI4 600
ASGNI4
line 1332
;1332:	mod_jumpheight = 270;
ADDRGP4 mod_jumpheight
CNSTI4 270
ASGNI4
line 1333
;1333:	mod_gdelay = 400;
ADDRGP4 mod_gdelay
CNSTI4 400
ASGNI4
line 1334
;1334:	mod_mgdelay = 100;
ADDRGP4 mod_mgdelay
CNSTI4 100
ASGNI4
line 1335
;1335:	mod_sgdelay = 1000;
ADDRGP4 mod_sgdelay
CNSTI4 1000
ASGNI4
line 1336
;1336:	mod_gldelay = 800;
ADDRGP4 mod_gldelay
CNSTI4 800
ASGNI4
line 1337
;1337:	mod_rldelay = 800;
ADDRGP4 mod_rldelay
CNSTI4 800
ASGNI4
line 1338
;1338:	mod_lgdelay = 50;
ADDRGP4 mod_lgdelay
CNSTI4 50
ASGNI4
line 1339
;1339:	mod_pgdelay = 100;
ADDRGP4 mod_pgdelay
CNSTI4 100
ASGNI4
line 1340
;1340:	mod_rgdelay = 1500;
ADDRGP4 mod_rgdelay
CNSTI4 1500
ASGNI4
line 1341
;1341:	mod_bfgdelay = 200;
ADDRGP4 mod_bfgdelay
CNSTI4 200
ASGNI4
line 1342
;1342:	mod_ngdelay = 1000;
ADDRGP4 mod_ngdelay
CNSTI4 1000
ASGNI4
line 1343
;1343:	mod_pldelay = 800;
ADDRGP4 mod_pldelay
CNSTI4 800
ASGNI4
line 1344
;1344:	mod_cgdelay = 30;
ADDRGP4 mod_cgdelay
CNSTI4 30
ASGNI4
line 1345
;1345:	mod_ftdelay = 40;
ADDRGP4 mod_ftdelay
CNSTI4 40
ASGNI4
line 1346
;1346:	mod_amdelay = 40;
ADDRGP4 mod_amdelay
CNSTI4 40
ASGNI4
line 1347
;1347:	mod_scoutfirespeed = 1.5;
ADDRGP4 mod_scoutfirespeed
CNSTF4 1069547520
ASGNF4
line 1348
;1348:	mod_doublerfirespeed = 1;
ADDRGP4 mod_doublerfirespeed
CNSTF4 1065353216
ASGNF4
line 1349
;1349:	mod_guardfirespeed = 1;
ADDRGP4 mod_guardfirespeed
CNSTF4 1065353216
ASGNF4
line 1350
;1350:	mod_hastefirespeed = 1.3;
ADDRGP4 mod_hastefirespeed
CNSTF4 1067869798
ASGNF4
line 1351
;1351:	mod_ammoregenfirespeed = 1.3;
ADDRGP4 mod_ammoregenfirespeed
CNSTF4 1067869798
ASGNF4
line 1352
;1352:	mod_noplayerclip = 0;
ADDRGP4 mod_noplayerclip
CNSTI4 0
ASGNI4
line 1353
;1353:	mod_ammolimit = 200;
ADDRGP4 mod_ammolimit
CNSTI4 200
ASGNI4
line 1354
;1354:	mod_invulmove = 0;
ADDRGP4 mod_invulmove
CNSTI4 0
ASGNI4
line 1355
;1355:	mod_teamred_firespeed = 1;
ADDRGP4 mod_teamred_firespeed
CNSTF4 1065353216
ASGNF4
line 1356
;1356:	mod_teamblue_firespeed = 1;
ADDRGP4 mod_teamblue_firespeed
CNSTF4 1065353216
ASGNF4
line 1357
;1357:	mod_medkitlimit = 200;
ADDRGP4 mod_medkitlimit
CNSTI4 200
ASGNI4
line 1358
;1358:	mod_medkitinf = 0;
ADDRGP4 mod_medkitinf
CNSTI4 0
ASGNI4
line 1359
;1359:	mod_teleporterinf = 0;
ADDRGP4 mod_teleporterinf
CNSTI4 0
ASGNI4
line 1360
;1360:	mod_portalinf = 0;
ADDRGP4 mod_portalinf
CNSTI4 0
ASGNI4
line 1361
;1361:	mod_kamikazeinf = 0;
ADDRGP4 mod_kamikazeinf
CNSTI4 0
ASGNI4
line 1362
;1362:	mod_invulinf = 0;
ADDRGP4 mod_invulinf
CNSTI4 0
ASGNI4
line 1363
;1363:	mod_accelerate = 1;
ADDRGP4 mod_accelerate
CNSTI4 1
ASGNI4
line 1364
;1364:	mod_slickmove = 0;
ADDRGP4 mod_slickmove
CNSTI4 0
ASGNI4
line 1365
;1365:	mod_overlay = 0;
ADDRGP4 mod_overlay
CNSTI4 0
ASGNI4
line 1366
;1366:	mod_gravity = 800;
ADDRGP4 mod_gravity
CNSTI4 800
ASGNI4
line 1367
;1367:	mod_roundmode = 0;
ADDRGP4 mod_roundmode
CNSTI4 0
ASGNI4
line 1368
;1368:	mod_zround = 0;
ADDRGP4 mod_zround
CNSTI4 0
ASGNI4
line 1369
;1369:    mod_fogModel = 0;
ADDRGP4 mod_fogModel
CNSTI4 0
ASGNI4
line 1370
;1370:    mod_fogShader = 0;
ADDRGP4 mod_fogShader
CNSTI4 0
ASGNI4
line 1371
;1371:    mod_fogDistance = 0;
ADDRGP4 mod_fogDistance
CNSTI4 0
ASGNI4
line 1372
;1372:    mod_fogInterval = 0;
ADDRGP4 mod_fogInterval
CNSTI4 0
ASGNI4
line 1373
;1373:    mod_fogColorR = 0;
ADDRGP4 mod_fogColorR
CNSTI4 0
ASGNI4
line 1374
;1374:    mod_fogColorG = 0;
ADDRGP4 mod_fogColorG
CNSTI4 0
ASGNI4
line 1375
;1375:    mod_fogColorB = 0;
ADDRGP4 mod_fogColorB
CNSTI4 0
ASGNI4
line 1376
;1376:    mod_fogColorA = 0;
ADDRGP4 mod_fogColorA
CNSTI4 0
ASGNI4
line 1377
;1377:    mod_skyShader = 0;
ADDRGP4 mod_skyShader
CNSTI4 0
ASGNI4
line 1378
;1378:    mod_skyColorR = 0;
ADDRGP4 mod_skyColorR
CNSTI4 0
ASGNI4
line 1379
;1379:    mod_skyColorG = 0;
ADDRGP4 mod_skyColorG
CNSTI4 0
ASGNI4
line 1380
;1380:    mod_skyColorB = 0;
ADDRGP4 mod_skyColorB
CNSTI4 0
ASGNI4
line 1381
;1381:    mod_skyColorA = 0;
ADDRGP4 mod_skyColorA
CNSTI4 0
ASGNI4
line 1382
;1382:}
LABELV $1021
endproc CG_SetDefaultWeaponProperties 0 0
data
align 4
LABELV $1023
address $1024
address $1025
address $1026
address $1027
address $1028
address $1029
address $1030
address $1031
address $1032
address $1033
address $1034
code
proc CG_RegisterGraphics 1764 16
line 1392
;1383:
;1384:
;1385:/*
;1386:=================
;1387:CG_RegisterGraphics
;1388:
;1389:This function may execute for a couple of minutes with a slow disk.
;1390:=================
;1391:*/
;1392:static void CG_RegisterGraphics( void ) {
line 1411
;1393:	gitem_t		*backpack;
;1394:	int			i;
;1395:	char		items[MAX_ITEMS+1];
;1396:	static char		*sb_nums[11] = {
;1397:		"gfx/2d/numbers/zero_32b",
;1398:		"gfx/2d/numbers/one_32b",
;1399:		"gfx/2d/numbers/two_32b",
;1400:		"gfx/2d/numbers/three_32b",
;1401:		"gfx/2d/numbers/four_32b",
;1402:		"gfx/2d/numbers/five_32b",
;1403:		"gfx/2d/numbers/six_32b",
;1404:		"gfx/2d/numbers/seven_32b",
;1405:		"gfx/2d/numbers/eight_32b",
;1406:		"gfx/2d/numbers/nine_32b",
;1407:		"gfx/2d/numbers/minus_32b",
;1408:	};
;1409:
;1410:	// clear any references to old media
;1411:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+1870616
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1412
;1412:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 1414
;1413:
;1414:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+339076
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1416
;1415:
;1416:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+339076
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 1418
;1417:	
;1418:	CG_SetDefaultWeaponProperties();
ADDRGP4 CG_SetDefaultWeaponProperties
CALLV
pop
line 1421
;1419:
;1420:	// precache status bar pics
;1421:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1039
line 1422
;1422:	CG_LoadingString( "game media" );
ADDRGP4 $1042
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1423
;1423:	}
LABELV $1039
line 1424
;1424:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1043
line 1425
;1425:	CG_LoadingString( "игровые ресурсы" );
ADDRGP4 $1046
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1426
;1426:	}
LABELV $1043
line 1428
;1427:
;1428:	for ( i=0 ; i<11 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1047
line 1429
;1429:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 1036
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 $1023
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 cgs+956380+1392
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1430
;1430:	}
LABELV $1048
line 1428
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $1047
line 1432
;1431:
;1432:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $1055
ARGP4
ADDRLP4 1036
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440
ADDRLP4 1036
INDIRI4
ASGNI4
line 1433
;1433:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $1059
ARGP4
ADDRLP4 1040
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1434
;1434:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $1063
ARGP4
ADDRLP4 1044
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+8
ADDRLP4 1044
INDIRI4
ASGNI4
line 1435
;1435:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $1067
ARGP4
ADDRLP4 1048
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+12
ADDRLP4 1048
INDIRI4
ASGNI4
line 1436
;1436:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $1071
ARGP4
ADDRLP4 1052
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+16
ADDRLP4 1052
INDIRI4
ASGNI4
line 1437
;1437:	cgs.media.botSkillShaders[5] = trap_R_RegisterShader( "menu/art/skill6.tga" );
ADDRGP4 $1075
ARGP4
ADDRLP4 1056
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+20
ADDRLP4 1056
INDIRI4
ASGNI4
line 1438
;1438:	cgs.media.botSkillShaders[6] = trap_R_RegisterShader( "menu/art/skill7.tga" );
ADDRGP4 $1079
ARGP4
ADDRLP4 1060
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+24
ADDRLP4 1060
INDIRI4
ASGNI4
line 1439
;1439:	cgs.media.botSkillShaders[7] = trap_R_RegisterShader( "menu/art/skill8.tga" );
ADDRGP4 $1083
ARGP4
ADDRLP4 1064
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+28
ADDRLP4 1064
INDIRI4
ASGNI4
line 1440
;1440:	cgs.media.botSkillShaders[8] = trap_R_RegisterShader( "menu/art/skill9.tga" );
ADDRGP4 $1087
ARGP4
ADDRLP4 1068
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1440+32
ADDRLP4 1068
INDIRI4
ASGNI4
line 1442
;1441:
;1442:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $1090
ARGP4
ADDRLP4 1072
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+460
ADDRLP4 1072
INDIRI4
ASGNI4
line 1444
;1443:
;1444:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $1093
ARGP4
ADDRLP4 1076
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+204
ADDRLP4 1076
INDIRI4
ASGNI4
line 1446
;1445:
;1446:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $1096
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1748
ADDRLP4 1080
INDIRI4
ASGNI4
line 1447
;1447:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $1099
ARGP4
ADDRLP4 1084
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1752
ADDRLP4 1084
INDIRI4
ASGNI4
line 1448
;1448:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $1102
ARGP4
ADDRLP4 1088
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1756
ADDRLP4 1088
INDIRI4
ASGNI4
line 1449
;1449:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $1105
ARGP4
ADDRLP4 1092
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1760
ADDRLP4 1092
INDIRI4
ASGNI4
line 1451
;1450:
;1451:	cgs.media.objectivesOverlay = trap_R_RegisterShaderNoMip( CG_ConfigString(CS_OBJECTIVESOVERLAY) );
CNSTI4 8617
ARGI4
ADDRLP4 1096
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1764
ADDRLP4 1100
INDIRI4
ASGNI4
line 1452
;1452:	cgs.media.objectivesUpdated = trap_R_RegisterShaderNoMip( "menu/objectives/updated.tga" );
ADDRGP4 $1110
ARGP4
ADDRLP4 1104
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1768
ADDRLP4 1104
INDIRI4
ASGNI4
line 1453
;1453:	cgs.media.objectivesUpdatedSound = trap_S_RegisterSound_MiTech( "sound/misc/objective_update_01.wav", qfalse );
ADDRGP4 $1113
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1772
ADDRLP4 1108
INDIRI4
ASGNI4
line 1455
;1454:
;1455:	cgs.media.deathImage = trap_R_RegisterShaderNoMip( "menu/art/level_complete5" );
ADDRGP4 $1116
ARGP4
ADDRLP4 1112
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1792
ADDRLP4 1112
INDIRI4
ASGNI4
line 1457
;1456:
;1457:	cgs.media.scoreShow = trap_S_RegisterSound_MiTech( "sound/weapons/rocket/rocklx1a.wav", qfalse );
ADDRGP4 $917
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1116
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1784
ADDRLP4 1116
INDIRI4
ASGNI4
line 1458
;1458:	cgs.media.finalScoreShow = trap_S_RegisterSound_MiTech( "sound/weapons/rocket/rocklx1a.wav", qfalse );
ADDRGP4 $917
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1120
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1788
ADDRLP4 1120
INDIRI4
ASGNI4
line 1460
;1459:
;1460:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $1123
ARGP4
ADDRLP4 1124
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1272
ADDRLP4 1124
INDIRI4
ASGNI4
line 1461
;1461:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $1126
ARGP4
ADDRLP4 1128
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1276
ADDRLP4 1128
INDIRI4
ASGNI4
line 1462
;1462:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $1129
ARGP4
ADDRLP4 1132
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1280
ADDRLP4 1132
INDIRI4
ASGNI4
line 1463
;1463:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
ADDRGP4 $1132
ARGP4
ADDRLP4 1136
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1384
ADDRLP4 1136
INDIRI4
ASGNI4
line 1464
;1464:	cgs.media.blueProxMine = trap_R_RegisterModel_MiTech( "models/weaphits/proxmineb.md3" );
ADDRGP4 $1135
ARGP4
ADDRLP4 1140
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1388
ADDRLP4 1140
INDIRI4
ASGNI4
line 1465
;1465:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $1138
ARGP4
ADDRLP4 1144
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1284
ADDRLP4 1144
INDIRI4
ASGNI4
line 1466
;1466:	cgs.media.flameBallShader = trap_R_RegisterShader( "sprites/flameball" );
ADDRGP4 $1141
ARGP4
ADDRLP4 1148
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1288
ADDRLP4 1148
INDIRI4
ASGNI4
line 1467
;1467:	cgs.media.antimatterBallShader = trap_R_RegisterShader( "sprites/antimatter" );
ADDRGP4 $1144
ARGP4
ADDRLP4 1152
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1292
ADDRLP4 1152
INDIRI4
ASGNI4
line 1468
;1468:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $1147
ARGP4
ADDRLP4 1156
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1300
ADDRLP4 1156
INDIRI4
ASGNI4
line 1469
;1469:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $1150
ARGP4
ADDRLP4 1160
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1260
ADDRLP4 1160
INDIRI4
ASGNI4
line 1470
;1470:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $1153
ARGP4
ADDRLP4 1164
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+452
ADDRLP4 1164
INDIRI4
ASGNI4
line 1472
;1471:
;1472:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $1156
ARGP4
ADDRLP4 1168
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1296
ADDRLP4 1168
INDIRI4
ASGNI4
line 1474
;1473:
;1474:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $1159
ARGP4
ADDRLP4 1172
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+464
ADDRLP4 1172
INDIRI4
ASGNI4
line 1475
;1475:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $1162
ARGP4
ADDRLP4 1176
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+456
ADDRLP4 1176
INDIRI4
ASGNI4
line 1477
;1476:
;1477:	for (i = 0; i < NUM_CROSSHAIRS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1163
line 1478
;1478:		if (i < 10){
ADDRLP4 0
INDIRI4
CNSTI4 10
GEI4 $1167
line 1479
;1479:			cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $1171
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+468
ADDP4
ADDRLP4 1188
INDIRI4
ASGNI4
line 1480
;1480:		    cgs.media.crosshairSh3d[i] = trap_R_RegisterShader( va("gfx/3d/crosshair%c", 'a'+i) );
ADDRGP4 $1174
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+864
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1481
;1481:		} else {
ADDRGP4 $1168
JUMPV
LABELV $1167
line 1482
;1482:			cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%02d", i - 10) );
ADDRGP4 $1177
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+468
ADDP4
ADDRLP4 1188
INDIRI4
ASGNI4
line 1483
;1483:			cgs.media.crosshairSh3d[i] = trap_R_RegisterShader( va("gfx/3d/crosshair%02d", i - 10) );
ADDRGP4 $1180
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+864
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1484
;1484:		}
LABELV $1168
line 1485
;1485: 	}
LABELV $1164
line 1477
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 99
LTI4 $1163
line 1487
;1486:
;1487:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $1183
ARGP4
ADDRLP4 1180
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1264
ADDRLP4 1180
INDIRI4
ASGNI4
line 1488
;1488:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $1186
ARGP4
ADDRLP4 1184
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1268
ADDRLP4 1184
INDIRI4
ASGNI4
line 1491
;1489:
;1490:	// powerup shaders
;1491:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $1189
ARGP4
ADDRLP4 1188
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1536
ADDRLP4 1188
INDIRI4
ASGNI4
line 1492
;1492:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $1192
ARGP4
ADDRLP4 1192
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1544
ADDRLP4 1192
INDIRI4
ASGNI4
line 1493
;1493:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $1195
ARGP4
ADDRLP4 1196
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1556
ADDRLP4 1196
INDIRI4
ASGNI4
line 1494
;1494:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $1198
ARGP4
ADDRLP4 1200
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1560
ADDRLP4 1200
INDIRI4
ASGNI4
line 1495
;1495:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $1201
ARGP4
ADDRLP4 1204
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1548
ADDRLP4 1204
INDIRI4
ASGNI4
line 1496
;1496:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $1204
ARGP4
ADDRLP4 1208
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1552
ADDRLP4 1208
INDIRI4
ASGNI4
line 1497
;1497:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $1207
ARGP4
ADDRLP4 1212
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1564
ADDRLP4 1212
INDIRI4
ASGNI4
line 1499
;1498:	
;1499:	cgs.media.ptexShader[0]	= trap_R_RegisterShader( "trans" );
ADDRGP4 $1210
ARGP4
ADDRLP4 1216
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1576
ADDRLP4 1216
INDIRI4
ASGNI4
line 1500
;1500:	cgs.media.ptexShader[1]	= trap_R_RegisterShader( "powerups/quad" );
ADDRGP4 $1189
ARGP4
ADDRLP4 1220
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1576+4
ADDRLP4 1220
INDIRI4
ASGNI4
line 1502
;1501:
;1502:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION|| cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $1224
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $1224
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $1224
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
EQI4 $1224
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1214
LABELV $1224
line 1503
;1503:		cgs.media.redCubeModel = trap_R_RegisterModel_MiTech( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $1227
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+28
ADDRLP4 1224
INDIRI4
ASGNI4
line 1504
;1504:		cgs.media.blueCubeModel = trap_R_RegisterModel_MiTech( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $1230
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+32
ADDRLP4 1228
INDIRI4
ASGNI4
line 1505
;1505:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $1233
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+36
ADDRLP4 1232
INDIRI4
ASGNI4
line 1506
;1506:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $1236
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+40
ADDRLP4 1236
INDIRI4
ASGNI4
line 1507
;1507:	}
LABELV $1214
line 1509
;1508:
;1509:        if( ( cgs.gametype >= GT_TEAM ) && ( cgs.ffa_gt != 1 ) ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $1237
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $1237
line 1510
;1510:                cgs.media.redOverlay = trap_R_RegisterShader( "overlay/red");
ADDRGP4 $1243
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1632
ADDRLP4 1224
INDIRI4
ASGNI4
line 1511
;1511:                cgs.media.blueOverlay = trap_R_RegisterShader( "overlay/blue");
ADDRGP4 $1246
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1636
ADDRLP4 1228
INDIRI4
ASGNI4
line 1512
;1512:        } else {
ADDRGP4 $1238
JUMPV
LABELV $1237
line 1513
;1513:                cgs.media.neutralOverlay = trap_R_RegisterShader( "overlay/neutral");
ADDRGP4 $1249
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1628
ADDRLP4 1224
INDIRI4
ASGNI4
line 1514
;1514:        }
LABELV $1238
line 1517
;1515:
;1516://For Double Domination:
;1517:	if ( cgs.gametype == GT_DOUBLE_D ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $1250
line 1518
;1518:		cgs.media.ddPointSkinA[TEAM_RED] = trap_R_RegisterShaderNoMip( "icons/icona_red" );
ADDRGP4 $1256
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+96+4
ADDRLP4 1224
INDIRI4
ASGNI4
line 1519
;1519:                cgs.media.ddPointSkinA[TEAM_BLUE] = trap_R_RegisterShaderNoMip( "icons/icona_blue" );
ADDRGP4 $1260
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+96+8
ADDRLP4 1228
INDIRI4
ASGNI4
line 1520
;1520:                cgs.media.ddPointSkinA[TEAM_FREE] = trap_R_RegisterShaderNoMip( "icons/icona_white" );
ADDRGP4 $1263
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+96
ADDRLP4 1232
INDIRI4
ASGNI4
line 1521
;1521:                cgs.media.ddPointSkinA[TEAM_NONE] = trap_R_RegisterShaderNoMip( "icons/noammo" );
ADDRGP4 $1186
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+96+12
ADDRLP4 1236
INDIRI4
ASGNI4
line 1523
;1522:
;1523:                cgs.media.ddPointSkinB[TEAM_RED] = trap_R_RegisterShaderNoMip( "icons/iconb_red" );
ADDRGP4 $1270
ARGP4
ADDRLP4 1240
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+112+4
ADDRLP4 1240
INDIRI4
ASGNI4
line 1524
;1524:                cgs.media.ddPointSkinB[TEAM_BLUE] = trap_R_RegisterShaderNoMip( "icons/iconb_blue" );
ADDRGP4 $1274
ARGP4
ADDRLP4 1244
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+112+8
ADDRLP4 1244
INDIRI4
ASGNI4
line 1525
;1525:                cgs.media.ddPointSkinB[TEAM_FREE] = trap_R_RegisterShaderNoMip( "icons/iconb_white" );
ADDRGP4 $1277
ARGP4
ADDRLP4 1248
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+112
ADDRLP4 1248
INDIRI4
ASGNI4
line 1526
;1526:                cgs.media.ddPointSkinB[TEAM_NONE] = trap_R_RegisterShaderNoMip( "icons/noammo" );
ADDRGP4 $1186
ARGP4
ADDRLP4 1252
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+112+12
ADDRLP4 1252
INDIRI4
ASGNI4
line 1527
;1527:	}
LABELV $1250
line 1529
;1528:
;1529:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $1291
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $1291
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $1291
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
EQI4 $1291
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1281
LABELV $1291
line 1530
;1530:		cgs.media.redFlagModel = trap_R_RegisterModel_MiTech( "models/flags/r_flag.md3" );
ADDRGP4 $1294
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+44
ADDRLP4 1224
INDIRI4
ASGNI4
line 1531
;1531:		cgs.media.blueFlagModel = trap_R_RegisterModel_MiTech( "models/flags/b_flag.md3" );
ADDRGP4 $1297
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+48
ADDRLP4 1228
INDIRI4
ASGNI4
line 1532
;1532:                cgs.media.neutralFlagModel = trap_R_RegisterModel_MiTech( "models/flags/n_flag.md3" );
ADDRGP4 $1300
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+52
ADDRLP4 1232
INDIRI4
ASGNI4
line 1533
;1533:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $1303
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+56
ADDRLP4 1236
INDIRI4
ASGNI4
line 1534
;1534:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $1307
ARGP4
ADDRLP4 1240
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+56+4
ADDRLP4 1240
INDIRI4
ASGNI4
line 1535
;1535:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $1311
ARGP4
ADDRLP4 1244
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+56+8
ADDRLP4 1244
INDIRI4
ASGNI4
line 1536
;1536:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $1314
ARGP4
ADDRLP4 1248
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+68
ADDRLP4 1248
INDIRI4
ASGNI4
line 1537
;1537:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $1318
ARGP4
ADDRLP4 1252
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+68+4
ADDRLP4 1252
INDIRI4
ASGNI4
line 1538
;1538:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $1322
ARGP4
ADDRLP4 1256
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+68+8
ADDRLP4 1256
INDIRI4
ASGNI4
line 1539
;1539:		cgs.media.flagPoleModel = trap_R_RegisterModel_MiTech( "models/flag2/flagpole.md3" );
ADDRGP4 $1325
ARGP4
ADDRLP4 1260
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+128
ADDRLP4 1260
INDIRI4
ASGNI4
line 1540
;1540:		cgs.media.flagFlapModel = trap_R_RegisterModel_MiTech( "models/flag2/flagflap3.md3" );
ADDRGP4 $1328
ARGP4
ADDRLP4 1264
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+132
ADDRLP4 1264
INDIRI4
ASGNI4
line 1542
;1541:
;1542:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
ADDRGP4 $1331
ARGP4
ADDRLP4 1268
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+956380+136
ADDRLP4 1268
INDIRI4
ASGNI4
line 1543
;1543:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
ADDRGP4 $1334
ARGP4
ADDRLP4 1272
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+956380+140
ADDRLP4 1272
INDIRI4
ASGNI4
line 1544
;1544:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
ADDRGP4 $1337
ARGP4
ADDRLP4 1276
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+956380+144
ADDRLP4 1276
INDIRI4
ASGNI4
line 1546
;1545:
;1546:		cgs.media.redFlagBaseModel = trap_R_RegisterModel_MiTech( "models/mapobjects/flagbase/red_base.md3" );
ADDRGP4 $1340
ARGP4
ADDRLP4 1280
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+148
ADDRLP4 1280
INDIRI4
ASGNI4
line 1547
;1547:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel_MiTech( "models/mapobjects/flagbase/blue_base.md3" );
ADDRGP4 $1343
ARGP4
ADDRLP4 1284
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+152
ADDRLP4 1284
INDIRI4
ASGNI4
line 1548
;1548:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel_MiTech( "models/mapobjects/flagbase/ntrl_base.md3" );
ADDRGP4 $1346
ARGP4
ADDRLP4 1288
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+156
ADDRLP4 1288
INDIRI4
ASGNI4
line 1549
;1549:	}
LABELV $1281
line 1551
;1550:
;1551:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $1351
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1347
LABELV $1351
line 1552
;1552:		cgs.media.neutralFlagModel = trap_R_RegisterModel_MiTech( "models/flags/n_flag.md3" );
ADDRGP4 $1300
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+52
ADDRLP4 1224
INDIRI4
ASGNI4
line 1553
;1553:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
ADDRGP4 $1356
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+80
ADDRLP4 1228
INDIRI4
ASGNI4
line 1554
;1554:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $1307
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+80+4
ADDRLP4 1232
INDIRI4
ASGNI4
line 1555
;1555:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $1318
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+80+8
ADDRLP4 1236
INDIRI4
ASGNI4
line 1556
;1556:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
ADDRGP4 $1366
ARGP4
ADDRLP4 1240
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+80+12
ADDRLP4 1240
INDIRI4
ASGNI4
line 1557
;1557:	}
LABELV $1347
line 1559
;1558:
;1559:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 7
EQI4 $1371
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1367
LABELV $1371
line 1560
;1560:		cgs.media.rocketExplosionShader = trap_R_RegisterShader("rocketExplosion");
ADDRGP4 $1374
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1668
ADDRLP4 1224
INDIRI4
ASGNI4
line 1561
;1561:		cgs.media.overloadBaseModel = trap_R_RegisterModel_MiTech( "models/powerups/overload_base.md3" );
ADDRGP4 $1377
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+160
ADDRLP4 1228
INDIRI4
ASGNI4
line 1562
;1562:		cgs.media.overloadTargetModel = trap_R_RegisterModel_MiTech( "models/powerups/overload_target.md3" );
ADDRGP4 $1380
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+164
ADDRLP4 1232
INDIRI4
ASGNI4
line 1563
;1563:		cgs.media.overloadLightsModel = trap_R_RegisterModel_MiTech( "models/powerups/overload_lights.md3" );
ADDRGP4 $1383
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+168
ADDRLP4 1236
INDIRI4
ASGNI4
line 1564
;1564:		cgs.media.overloadEnergyModel = trap_R_RegisterModel_MiTech( "models/powerups/overload_energy.md3" );
ADDRGP4 $1386
ARGP4
ADDRLP4 1240
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+172
ADDRLP4 1240
INDIRI4
ASGNI4
line 1565
;1565:	}
LABELV $1367
line 1567
;1566:
;1567:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
EQI4 $1391
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1387
LABELV $1391
line 1568
;1568:		cgs.media.harvesterModel = trap_R_RegisterModel_MiTech( "models/powerups/harvester/harvester.md3" );
ADDRGP4 $1394
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+176
ADDRLP4 1224
INDIRI4
ASGNI4
line 1569
;1569:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
ADDRGP4 $1397
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+956380+180
ADDRLP4 1228
INDIRI4
ASGNI4
line 1570
;1570:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
ADDRGP4 $1400
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+956380+184
ADDRLP4 1232
INDIRI4
ASGNI4
line 1571
;1571:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel_MiTech( "models/powerups/obelisk/obelisk.md3" );
ADDRGP4 $1403
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+188
ADDRLP4 1236
INDIRI4
ASGNI4
line 1572
;1572:	}
LABELV $1387
line 1574
;1573:
;1574:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
ADDRGP4 $1406
ARGP4
ADDRLP4 1224
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1568
ADDRLP4 1224
INDIRI4
ASGNI4
line 1575
;1575:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $1207
ARGP4
ADDRLP4 1228
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1736
ADDRLP4 1228
INDIRI4
ASGNI4
line 1577
;1576:
;1577:	if ( ( ( cgs.gametype >= GT_TEAM ) && ( cgs.ffa_gt != 1 ) ) ||
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $1415
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
NEI4 $1414
LABELV $1415
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $1409
LABELV $1414
line 1578
;1578:		cg_buildScript.integer ) {
line 1580
;1579:
;1580:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe3" );
ADDRGP4 $1418
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+444
ADDRLP4 1232
INDIRI4
ASGNI4
line 1581
;1581:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $1421
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1540
ADDRLP4 1236
INDIRI4
ASGNI4
line 1583
;1582:		//cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" ); - moved outside, used by accuracy
;1583:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
ADDRGP4 $1424
ARGP4
ADDRLP4 1240
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1572
ADDRLP4 1240
INDIRI4
ASGNI4
line 1584
;1584:	}
LABELV $1409
line 1585
;1585:	cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $1427
ARGP4
ADDRLP4 1232
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+200
ADDRLP4 1232
INDIRI4
ASGNI4
line 1587
;1586:
;1587:	cgs.media.armorModel = trap_R_RegisterModel_MiTech( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $1430
ARGP4
ADDRLP4 1236
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+192
ADDRLP4 1236
INDIRI4
ASGNI4
line 1588
;1588:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $1433
ARGP4
ADDRLP4 1240
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+196
ADDRLP4 1240
INDIRI4
ASGNI4
line 1590
;1589:
;1590:	cgs.media.machinegunBrassModel = trap_R_RegisterModel_MiTech( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $1436
ARGP4
ADDRLP4 1244
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+424
ADDRLP4 1244
INDIRI4
ASGNI4
line 1591
;1591:	cgs.media.shotgunBrassModel = trap_R_RegisterModel_MiTech( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $1439
ARGP4
ADDRLP4 1248
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+428
ADDRLP4 1248
INDIRI4
ASGNI4
line 1593
;1592:
;1593:	cgs.media.gibAbdomen = trap_R_RegisterModel_MiTech( "models/gibs/abdomen.md3" );
ADDRGP4 $1442
ARGP4
ADDRLP4 1252
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+208
ADDRLP4 1252
INDIRI4
ASGNI4
line 1594
;1594:	cgs.media.gibArm = trap_R_RegisterModel_MiTech( "models/gibs/arm.md3" );
ADDRGP4 $1445
ARGP4
ADDRLP4 1256
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+212
ADDRLP4 1256
INDIRI4
ASGNI4
line 1595
;1595:	cgs.media.gibChest = trap_R_RegisterModel_MiTech( "models/gibs/chest.md3" );
ADDRGP4 $1448
ARGP4
ADDRLP4 1260
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+216
ADDRLP4 1260
INDIRI4
ASGNI4
line 1596
;1596:	cgs.media.gibFist = trap_R_RegisterModel_MiTech( "models/gibs/fist.md3" );
ADDRGP4 $1451
ARGP4
ADDRLP4 1264
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+220
ADDRLP4 1264
INDIRI4
ASGNI4
line 1597
;1597:	cgs.media.gibFoot = trap_R_RegisterModel_MiTech( "models/gibs/foot.md3" );
ADDRGP4 $1454
ARGP4
ADDRLP4 1268
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+224
ADDRLP4 1268
INDIRI4
ASGNI4
line 1598
;1598:	cgs.media.gibForearm = trap_R_RegisterModel_MiTech( "models/gibs/forearm.md3" );
ADDRGP4 $1457
ARGP4
ADDRLP4 1272
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+228
ADDRLP4 1272
INDIRI4
ASGNI4
line 1599
;1599:	cgs.media.gibIntestine = trap_R_RegisterModel_MiTech( "models/gibs/intestine.md3" );
ADDRGP4 $1460
ARGP4
ADDRLP4 1276
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+232
ADDRLP4 1276
INDIRI4
ASGNI4
line 1600
;1600:	cgs.media.gibLeg = trap_R_RegisterModel_MiTech( "models/gibs/leg.md3" );
ADDRGP4 $1463
ARGP4
ADDRLP4 1280
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+236
ADDRLP4 1280
INDIRI4
ASGNI4
line 1601
;1601:	cgs.media.gibSkull = trap_R_RegisterModel_MiTech( "models/gibs/skull.md3" );
ADDRGP4 $1466
ARGP4
ADDRLP4 1284
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+240
ADDRLP4 1284
INDIRI4
ASGNI4
line 1602
;1602:	cgs.media.gibBrain = trap_R_RegisterModel_MiTech( "models/gibs/brain.md3" );
ADDRGP4 $1469
ARGP4
ADDRLP4 1288
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+244
ADDRLP4 1288
INDIRI4
ASGNI4
line 1604
;1603:
;1604:	cgs.media.debrislight1 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b1.md3" );
ADDRGP4 $1472
ARGP4
ADDRLP4 1292
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+248
ADDRLP4 1292
INDIRI4
ASGNI4
line 1605
;1605:	cgs.media.debrislight2 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b2.md3" );
ADDRGP4 $1475
ARGP4
ADDRLP4 1296
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+252
ADDRLP4 1296
INDIRI4
ASGNI4
line 1606
;1606:	cgs.media.debrislight3 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b3.md3" );
ADDRGP4 $1478
ARGP4
ADDRLP4 1300
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+256
ADDRLP4 1300
INDIRI4
ASGNI4
line 1607
;1607:	cgs.media.debrislight4 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b4.md3" );
ADDRGP4 $1481
ARGP4
ADDRLP4 1304
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+260
ADDRLP4 1304
INDIRI4
ASGNI4
line 1608
;1608:	cgs.media.debrislight5 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b5.md3" );
ADDRGP4 $1484
ARGP4
ADDRLP4 1308
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+264
ADDRLP4 1308
INDIRI4
ASGNI4
line 1609
;1609:	cgs.media.debrislight6 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b6.md3" );
ADDRGP4 $1487
ARGP4
ADDRLP4 1312
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+268
ADDRLP4 1312
INDIRI4
ASGNI4
line 1610
;1610:	cgs.media.debrislight7 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b7.md3" );
ADDRGP4 $1490
ARGP4
ADDRLP4 1316
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+272
ADDRLP4 1316
INDIRI4
ASGNI4
line 1611
;1611:	cgs.media.debrislight8 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b8.md3" );
ADDRGP4 $1493
ARGP4
ADDRLP4 1320
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+276
ADDRLP4 1320
INDIRI4
ASGNI4
line 1613
;1612:
;1613:	cgs.media.debrisdark1 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d1.md3" );
ADDRGP4 $1496
ARGP4
ADDRLP4 1324
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+280
ADDRLP4 1324
INDIRI4
ASGNI4
line 1614
;1614:	cgs.media.debrisdark2 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d2.md3" );
ADDRGP4 $1499
ARGP4
ADDRLP4 1328
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+284
ADDRLP4 1328
INDIRI4
ASGNI4
line 1615
;1615:	cgs.media.debrisdark3 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d3.md3" );
ADDRGP4 $1502
ARGP4
ADDRLP4 1332
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+288
ADDRLP4 1332
INDIRI4
ASGNI4
line 1616
;1616:	cgs.media.debrisdark4 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d4.md3" );
ADDRGP4 $1505
ARGP4
ADDRLP4 1336
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+292
ADDRLP4 1336
INDIRI4
ASGNI4
line 1617
;1617:	cgs.media.debrisdark5 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d5.md3" );
ADDRGP4 $1508
ARGP4
ADDRLP4 1340
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+296
ADDRLP4 1340
INDIRI4
ASGNI4
line 1618
;1618:	cgs.media.debrisdark6 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d6.md3" );
ADDRGP4 $1511
ARGP4
ADDRLP4 1344
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+300
ADDRLP4 1344
INDIRI4
ASGNI4
line 1619
;1619:	cgs.media.debrisdark7 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d7.md3" );
ADDRGP4 $1514
ARGP4
ADDRLP4 1348
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+304
ADDRLP4 1348
INDIRI4
ASGNI4
line 1620
;1620:	cgs.media.debrisdark8 = trap_R_RegisterModel_MiTech( "models/debris/concrete_d8.md3" );
ADDRGP4 $1517
ARGP4
ADDRLP4 1352
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+308
ADDRLP4 1352
INDIRI4
ASGNI4
line 1622
;1621:
;1622:	cgs.media.debrislightlarge1 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b1_large.md3" );
ADDRGP4 $1520
ARGP4
ADDRLP4 1356
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+312
ADDRLP4 1356
INDIRI4
ASGNI4
line 1623
;1623:	cgs.media.debrislightlarge2 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b2_large.md3" );
ADDRGP4 $1523
ARGP4
ADDRLP4 1360
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+316
ADDRLP4 1360
INDIRI4
ASGNI4
line 1624
;1624:	cgs.media.debrislightlarge3 = trap_R_RegisterModel_MiTech( "models/debris/concrete_b3_large.md3" );
ADDRGP4 $1526
ARGP4
ADDRLP4 1364
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+320
ADDRLP4 1364
INDIRI4
ASGNI4
line 1626
;1625:
;1626:	cgs.media.debrisdarklarge1 = trap_R_RegisterModel_MiTech( "models/debris/wood_b1.md3" );
ADDRGP4 $1529
ARGP4
ADDRLP4 1368
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+324
ADDRLP4 1368
INDIRI4
ASGNI4
line 1627
;1627:	cgs.media.debrisdarklarge2 = trap_R_RegisterModel_MiTech( "models/debris/wood_b1.md3" );
ADDRGP4 $1529
ARGP4
ADDRLP4 1372
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+328
ADDRLP4 1372
INDIRI4
ASGNI4
line 1628
;1628:	cgs.media.debrisdarklarge3 = trap_R_RegisterModel_MiTech( "models/debris/wood_b1.md3" );
ADDRGP4 $1529
ARGP4
ADDRLP4 1376
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+332
ADDRLP4 1376
INDIRI4
ASGNI4
line 1630
;1629:
;1630:	cgs.media.debriswood1 = trap_R_RegisterModel_MiTech( "models/debris/wood_b1.md3" );
ADDRGP4 $1529
ARGP4
ADDRLP4 1380
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+336
ADDRLP4 1380
INDIRI4
ASGNI4
line 1631
;1631:	cgs.media.debriswood2 = trap_R_RegisterModel_MiTech( "models/debris/wood_b2.md3" );
ADDRGP4 $1538
ARGP4
ADDRLP4 1384
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+340
ADDRLP4 1384
INDIRI4
ASGNI4
line 1632
;1632:	cgs.media.debriswood3 = trap_R_RegisterModel_MiTech( "models/debris/wood_b3.md3" );
ADDRGP4 $1541
ARGP4
ADDRLP4 1388
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+344
ADDRLP4 1388
INDIRI4
ASGNI4
line 1633
;1633:	cgs.media.debriswood4 = trap_R_RegisterModel_MiTech( "models/debris/wood_b4.md3" );
ADDRGP4 $1544
ARGP4
ADDRLP4 1392
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+348
ADDRLP4 1392
INDIRI4
ASGNI4
line 1634
;1634:	cgs.media.debriswood5 = trap_R_RegisterModel_MiTech( "models/debris/wood_b5.md3" );
ADDRGP4 $1547
ARGP4
ADDRLP4 1396
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+352
ADDRLP4 1396
INDIRI4
ASGNI4
line 1636
;1635:
;1636:	cgs.media.debrisglass1 = trap_R_RegisterModel_MiTech( "models/debris/glass_1.md3" );
ADDRGP4 $1550
ARGP4
ADDRLP4 1400
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+356
ADDRLP4 1400
INDIRI4
ASGNI4
line 1637
;1637:	cgs.media.debrisglass2 = trap_R_RegisterModel_MiTech( "models/debris/glass_2.md3" );
ADDRGP4 $1553
ARGP4
ADDRLP4 1404
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+360
ADDRLP4 1404
INDIRI4
ASGNI4
line 1638
;1638:	cgs.media.debrisglass3 = trap_R_RegisterModel_MiTech( "models/debris/glass_3.md3" );
ADDRGP4 $1556
ARGP4
ADDRLP4 1408
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+364
ADDRLP4 1408
INDIRI4
ASGNI4
line 1639
;1639:	cgs.media.debrisglass4 = trap_R_RegisterModel_MiTech( "models/debris/glass_4.md3" );
ADDRGP4 $1559
ARGP4
ADDRLP4 1412
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+368
ADDRLP4 1412
INDIRI4
ASGNI4
line 1640
;1640:	cgs.media.debrisglass5 = trap_R_RegisterModel_MiTech( "models/debris/glass_5.md3" );
ADDRGP4 $1562
ARGP4
ADDRLP4 1416
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+372
ADDRLP4 1416
INDIRI4
ASGNI4
line 1642
;1641:
;1642:	cgs.media.debrisglasslarge1 = trap_R_RegisterModel_MiTech( "models/debris/glass_1_large.md3" );
ADDRGP4 $1565
ARGP4
ADDRLP4 1420
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+376
ADDRLP4 1420
INDIRI4
ASGNI4
line 1643
;1643:	cgs.media.debrisglasslarge2 = trap_R_RegisterModel_MiTech( "models/debris/glass_2_large.md3" );
ADDRGP4 $1568
ARGP4
ADDRLP4 1424
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+380
ADDRLP4 1424
INDIRI4
ASGNI4
line 1644
;1644:	cgs.media.debrisglasslarge3 = trap_R_RegisterModel_MiTech( "models/debris/glass_3_large.md3" );
ADDRGP4 $1571
ARGP4
ADDRLP4 1428
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+384
ADDRLP4 1428
INDIRI4
ASGNI4
line 1645
;1645:	cgs.media.debrisglasslarge4 = trap_R_RegisterModel_MiTech( "models/debris/glass_4_large.md3" );
ADDRGP4 $1574
ARGP4
ADDRLP4 1432
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+388
ADDRLP4 1432
INDIRI4
ASGNI4
line 1646
;1646:	cgs.media.debrisglasslarge5 = trap_R_RegisterModel_MiTech( "models/debris/glass_5_large.md3" );
ADDRGP4 $1577
ARGP4
ADDRLP4 1436
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+392
ADDRLP4 1436
INDIRI4
ASGNI4
line 1648
;1647:	
;1648:	cgs.media.debrisstone1 = trap_R_RegisterModel_MiTech( "models/debris/stone_1.md3" );
ADDRGP4 $1580
ARGP4
ADDRLP4 1440
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+396
ADDRLP4 1440
INDIRI4
ASGNI4
line 1649
;1649:	cgs.media.debrisstone2 = trap_R_RegisterModel_MiTech( "models/debris/stone_2.md3" );
ADDRGP4 $1583
ARGP4
ADDRLP4 1444
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+400
ADDRLP4 1444
INDIRI4
ASGNI4
line 1650
;1650:	cgs.media.debrisstone3 = trap_R_RegisterModel_MiTech( "models/debris/stone_3.md3" );
ADDRGP4 $1586
ARGP4
ADDRLP4 1448
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+404
ADDRLP4 1448
INDIRI4
ASGNI4
line 1651
;1651:	cgs.media.debrisstone4 = trap_R_RegisterModel_MiTech( "models/debris/stone_4.md3" );
ADDRGP4 $1589
ARGP4
ADDRLP4 1452
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+408
ADDRLP4 1452
INDIRI4
ASGNI4
line 1652
;1652:	cgs.media.debrisstone5 = trap_R_RegisterModel_MiTech( "models/debris/stone_5.md3" );
ADDRGP4 $1592
ARGP4
ADDRLP4 1456
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+412
ADDRLP4 1456
INDIRI4
ASGNI4
line 1654
;1653:
;1654:	cgs.media.sparkShader = trap_R_RegisterShaderNoMip("spark");
ADDRGP4 $1595
ARGP4
ADDRLP4 1460
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+416
ADDRLP4 1460
INDIRI4
ASGNI4
line 1656
;1655:	
;1656:	cgs.media.smoke2 = trap_R_RegisterModel_MiTech( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $1439
ARGP4
ADDRLP4 1464
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+420
ADDRLP4 1464
INDIRI4
ASGNI4
line 1658
;1657:
;1658:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $1600
ARGP4
ADDRLP4 1468
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+448
ADDRLP4 1468
INDIRI4
ASGNI4
line 1660
;1659:
;1660:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $1603
ARGP4
ADDRLP4 1472
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1680
ADDRLP4 1472
INDIRI4
ASGNI4
line 1662
;1661:
;1662:	cgs.media.bulletFlashModel = trap_R_RegisterModel_MiTech("models/weaphits/bullet.md3");
ADDRGP4 $1606
ARGP4
ADDRLP4 1476
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1640
ADDRLP4 1476
INDIRI4
ASGNI4
line 1663
;1663:	cgs.media.ringFlashModel = trap_R_RegisterModel_MiTech("models/weaphits/ring02.md3");
ADDRGP4 $1609
ARGP4
ADDRLP4 1480
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1644
ADDRLP4 1480
INDIRI4
ASGNI4
line 1664
;1664:	cgs.media.dishFlashModel = trap_R_RegisterModel_MiTech("models/weaphits/boom01.md3");
ADDRGP4 $1612
ARGP4
ADDRLP4 1484
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1648
ADDRLP4 1484
INDIRI4
ASGNI4
line 1666
;1665:#ifdef MISSIONPACK
;1666:	cgs.media.teleportEffectModel = trap_R_RegisterModel_MiTech( "models/powerups/pop.md3" );
ADDRGP4 $1615
ARGP4
ADDRLP4 1488
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1684
ADDRLP4 1488
INDIRI4
ASGNI4
line 1671
;1667:#else
;1668:	cgs.media.teleportEffectModel = trap_R_RegisterModel_MiTech( "models/misc/telep.md3" );
;1669:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
;1670:#endif
;1671:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel_MiTech( "models/weaphits/kamboom2.md3" );
ADDRGP4 $1618
ARGP4
ADDRLP4 1492
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1692
ADDRLP4 1492
INDIRI4
ASGNI4
line 1672
;1672:	cgs.media.kamikazeShockWave = trap_R_RegisterModel_MiTech( "models/weaphits/kamwave.md3" );
ADDRGP4 $1621
ARGP4
ADDRLP4 1496
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1696
ADDRLP4 1496
INDIRI4
ASGNI4
line 1673
;1673:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel_MiTech( "models/powerups/kamikazi.md3" );
ADDRGP4 $1624
ARGP4
ADDRLP4 1500
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1700
ADDRLP4 1500
INDIRI4
ASGNI4
line 1674
;1674:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel_MiTech( "models/powerups/trailtest.md3" );
ADDRGP4 $1627
ARGP4
ADDRLP4 1504
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1704
ADDRLP4 1504
INDIRI4
ASGNI4
line 1675
;1675:	cgs.media.guardPowerupModel = trap_R_RegisterModel_MiTech( "models/powerups/guard_player.md3" );
ADDRGP4 $1630
ARGP4
ADDRLP4 1508
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1708
ADDRLP4 1508
INDIRI4
ASGNI4
line 1676
;1676:	cgs.media.scoutPowerupModel = trap_R_RegisterModel_MiTech( "models/powerups/scout_player.md3" );
ADDRGP4 $1633
ARGP4
ADDRLP4 1512
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1712
ADDRLP4 1512
INDIRI4
ASGNI4
line 1677
;1677:	cgs.media.doublerPowerupModel = trap_R_RegisterModel_MiTech( "models/powerups/doubler_player.md3" );
ADDRGP4 $1636
ARGP4
ADDRLP4 1516
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1716
ADDRLP4 1516
INDIRI4
ASGNI4
line 1678
;1678:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel_MiTech( "models/powerups/ammo_player.md3" );
ADDRGP4 $1639
ARGP4
ADDRLP4 1520
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1720
ADDRLP4 1520
INDIRI4
ASGNI4
line 1679
;1679:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel_MiTech( "models/powerups/shield/impact.md3" );
ADDRGP4 $1642
ARGP4
ADDRLP4 1524
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1724
ADDRLP4 1524
INDIRI4
ASGNI4
line 1680
;1680:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel_MiTech( "models/powerups/shield/juicer.md3" );
ADDRGP4 $1645
ARGP4
ADDRLP4 1528
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1728
ADDRLP4 1528
INDIRI4
ASGNI4
line 1681
;1681:	cgs.media.medkitUsageModel = trap_R_RegisterModel_MiTech( "models/powerups/regen.md3" );
ADDRGP4 $1648
ARGP4
ADDRLP4 1532
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1732
ADDRLP4 1532
INDIRI4
ASGNI4
line 1682
;1682:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
ADDRGP4 $1651
ARGP4
ADDRLP4 1536
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1740
ADDRLP4 1536
INDIRI4
ASGNI4
line 1685
;1683:
;1684:
;1685:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel_MiTech( "models/powerups/shield/shield.md3" );
ADDRGP4 $1654
ARGP4
ADDRLP4 1540
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1744
ADDRLP4 1540
INDIRI4
ASGNI4
line 1686
;1686:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $1657
ARGP4
ADDRLP4 1544
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1796
ADDRLP4 1544
INDIRI4
ASGNI4
line 1687
;1687:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $1660
ARGP4
ADDRLP4 1548
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1800
ADDRLP4 1548
INDIRI4
ASGNI4
line 1688
;1688:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $1663
ARGP4
ADDRLP4 1552
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1804
ADDRLP4 1552
INDIRI4
ASGNI4
line 1689
;1689:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $1666
ARGP4
ADDRLP4 1556
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1808
ADDRLP4 1556
INDIRI4
ASGNI4
line 1690
;1690:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $1669
ARGP4
ADDRLP4 1560
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1812
ADDRLP4 1560
INDIRI4
ASGNI4
line 1691
;1691:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $1672
ARGP4
ADDRLP4 1564
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1816
ADDRLP4 1564
INDIRI4
ASGNI4
line 1694
;1692:
;1693:	// LEILEI SHADERS
;1694:	cgs.media.lsmkShader1 = trap_R_RegisterShader("leismoke1" );
ADDRGP4 $1675
ARGP4
ADDRLP4 1568
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1304
ADDRLP4 1568
INDIRI4
ASGNI4
line 1695
;1695:	cgs.media.lsmkShader2 = trap_R_RegisterShader("leismoke2" );
ADDRGP4 $1678
ARGP4
ADDRLP4 1572
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1308
ADDRLP4 1572
INDIRI4
ASGNI4
line 1696
;1696:	cgs.media.lsmkShader3 = trap_R_RegisterShader("leismoke3" );
ADDRGP4 $1681
ARGP4
ADDRLP4 1576
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1312
ADDRLP4 1576
INDIRI4
ASGNI4
line 1697
;1697:	cgs.media.lsmkShader4 = trap_R_RegisterShader("leismoke4" );
ADDRGP4 $1684
ARGP4
ADDRLP4 1580
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1316
ADDRLP4 1580
INDIRI4
ASGNI4
line 1699
;1698:
;1699:	cgs.media.lsplShader = trap_R_RegisterShader("leisplash" );
ADDRGP4 $1687
ARGP4
ADDRLP4 1584
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1328
ADDRLP4 1584
INDIRI4
ASGNI4
line 1700
;1700:	cgs.media.lspkShader1 = trap_R_RegisterShader("leispark" );
ADDRGP4 $1690
ARGP4
ADDRLP4 1588
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1332
ADDRLP4 1588
INDIRI4
ASGNI4
line 1701
;1701:	cgs.media.lspkShader2 = trap_R_RegisterShader("leispark2" );
ADDRGP4 $1693
ARGP4
ADDRLP4 1592
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1336
ADDRLP4 1592
INDIRI4
ASGNI4
line 1702
;1702:	cgs.media.lbumShader1 = trap_R_RegisterShader("leiboom1" );
ADDRGP4 $1696
ARGP4
ADDRLP4 1596
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1320
ADDRLP4 1596
INDIRI4
ASGNI4
line 1703
;1703:	cgs.media.lfblShader1 = trap_R_RegisterShader("leifball" );
ADDRGP4 $1699
ARGP4
ADDRLP4 1600
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1324
ADDRLP4 1600
INDIRI4
ASGNI4
line 1705
;1704:
;1705:	cgs.media.lbldShader1 = trap_R_RegisterShader("leiblood1" );
ADDRGP4 $1702
ARGP4
ADDRLP4 1604
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1340
ADDRLP4 1604
INDIRI4
ASGNI4
line 1706
;1706:	cgs.media.lbldShader2 = trap_R_RegisterShader("leiblood2" );	// this is a mark, by the way
ADDRGP4 $1705
ARGP4
ADDRLP4 1608
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1344
ADDRLP4 1608
INDIRI4
ASGNI4
line 1709
;1707:
;1708:	// New Bullet Marks
;1709:	cgs.media.lmarkmetal1 = trap_R_RegisterShader("leimetalmark1" );
ADDRGP4 $1708
ARGP4
ADDRLP4 1612
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1352
ADDRLP4 1612
INDIRI4
ASGNI4
line 1710
;1710:	cgs.media.lmarkmetal2 = trap_R_RegisterShader("leimetalmark2" );
ADDRGP4 $1711
ARGP4
ADDRLP4 1616
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1356
ADDRLP4 1616
INDIRI4
ASGNI4
line 1711
;1711:	cgs.media.lmarkmetal3 = trap_R_RegisterShader("leimetalmark3" );
ADDRGP4 $1714
ARGP4
ADDRLP4 1620
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1360
ADDRLP4 1620
INDIRI4
ASGNI4
line 1712
;1712:	cgs.media.lmarkmetal4 = trap_R_RegisterShader("leimetalmark4" );
ADDRGP4 $1717
ARGP4
ADDRLP4 1624
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1364
ADDRLP4 1624
INDIRI4
ASGNI4
line 1713
;1713:	cgs.media.lmarkbullet1 = trap_R_RegisterShader("leibulletmark1" );
ADDRGP4 $1720
ARGP4
ADDRLP4 1628
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1368
ADDRLP4 1628
INDIRI4
ASGNI4
line 1714
;1714:	cgs.media.lmarkbullet2 = trap_R_RegisterShader("leibulletmark2" );
ADDRGP4 $1723
ARGP4
ADDRLP4 1632
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1372
ADDRLP4 1632
INDIRI4
ASGNI4
line 1715
;1715:	cgs.media.lmarkbullet3 = trap_R_RegisterShader("leibulletmark3" );
ADDRGP4 $1726
ARGP4
ADDRLP4 1636
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1376
ADDRLP4 1636
INDIRI4
ASGNI4
line 1716
;1716:	cgs.media.lmarkbullet4 = trap_R_RegisterShader("leibulletmark4" );
ADDRGP4 $1729
ARGP4
ADDRLP4 1640
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1380
ADDRLP4 1640
INDIRI4
ASGNI4
line 1719
;1717:
;1718:
;1719:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24576
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1720
;1720:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2720
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1723
;1721:
;1722:	// only register the items that the server says we need
;1723:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 1644
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1644
INDIRP4
ARGP4
CNSTI4 1025
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1725
;1724:
;1725:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1733
JUMPV
LABELV $1730
line 1726
;1726:		if ( items[ i ] == '1' || 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $1736
LABELV $1736
line 1728
;1727:			//CG_LoadingItem( i );
;1728:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1729
;1729:		}
LABELV $1734
line 1730
;1730:	}
LABELV $1731
line 1725
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1733
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $1730
line 1733
;1731:
;1732:	// wall marks
;1733:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $1739
ARGP4
ADDRLP4 1648
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1504
ADDRLP4 1648
INDIRI4
ASGNI4
line 1734
;1734:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $1742
ARGP4
ADDRLP4 1652
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1508
ADDRLP4 1652
INDIRI4
ASGNI4
line 1735
;1735:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $1745
ARGP4
ADDRLP4 1656
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1512
ADDRLP4 1656
INDIRI4
ASGNI4
line 1736
;1736:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $1748
ARGP4
ADDRLP4 1660
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1516
ADDRLP4 1660
INDIRI4
ASGNI4
line 1737
;1737:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $1751
ARGP4
ADDRLP4 1664
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1436
ADDRLP4 1664
INDIRI4
ASGNI4
line 1738
;1738:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $1754
ARGP4
ADDRLP4 1668
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1496
ADDRLP4 1668
INDIRI4
ASGNI4
line 1739
;1739:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $1757
ARGP4
ADDRLP4 1672
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1500
ADDRLP4 1672
INDIRI4
ASGNI4
line 1742
;1740:
;1741:	// paintball mode marks
;1742:	cgs.media.bulletMarkPaintShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk_paint" );
ADDRGP4 $1760
ARGP4
ADDRLP4 1676
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1520
ADDRLP4 1676
INDIRI4
ASGNI4
line 1743
;1743:	cgs.media.burnMarkPaintShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk_paint" );
ADDRGP4 $1763
ARGP4
ADDRLP4 1680
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1524
ADDRLP4 1680
INDIRI4
ASGNI4
line 1744
;1744:	cgs.media.holeMarkPaintShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk_paint" );
ADDRGP4 $1766
ARGP4
ADDRLP4 1684
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1528
ADDRLP4 1684
INDIRI4
ASGNI4
line 1745
;1745:	cgs.media.energyMarkPaintShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk_paint" );
ADDRGP4 $1769
ARGP4
ADDRLP4 1688
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1532
ADDRLP4 1688
INDIRI4
ASGNI4
line 1748
;1746:
;1747:	//explosion effect
;1748:	cgs.media.rocketExplosionShader = trap_R_RegisterShader("rocketExplosion");
ADDRGP4 $1374
ARGP4
ADDRLP4 1692
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1668
ADDRLP4 1692
INDIRI4
ASGNI4
line 1751
;1749:
;1750:	// register the inline models
;1751:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 1696
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+375408
ADDRLP4 1696
INDIRI4
ASGNI4
line 1752
;1752:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1776
JUMPV
LABELV $1773
line 1757
;1753:		char	name[10];
;1754:		vec3_t			mins, maxs;
;1755:		int				j;
;1756:
;1757:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 1728
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $1778
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1758
;1758:		cgs.inlineDrawModel[i] = trap_R_RegisterModel_MiTech( name );
ADDRLP4 1728
ARGP4
ADDRLP4 1740
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+375412
ADDP4
ADDRLP4 1740
INDIRI4
ASGNI4
line 1759
;1759:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+375412
ADDP4
INDIRI4
ARGI4
ADDRLP4 1704
ARGP4
ADDRLP4 1716
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1760
;1760:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 1700
CNSTI4 0
ASGNI4
LABELV $1781
line 1761
;1761:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 1744
ADDRLP4 1700
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1748
ADDRLP4 1744
INDIRI4
ADDRLP4 1704
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1744
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+391796
ADDP4
ADDP4
ADDRLP4 1748
INDIRF4
CNSTF4 1056964608
ADDRLP4 1744
INDIRI4
ADDRLP4 1716
ADDP4
INDIRF4
ADDRLP4 1748
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1762
;1762:		}
LABELV $1782
line 1760
ADDRLP4 1700
ADDRLP4 1700
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1700
INDIRI4
CNSTI4 3
LTI4 $1781
line 1763
;1763:	}
LABELV $1774
line 1752
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1776
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+375408
INDIRI4
LTI4 $1773
line 1766
;1764:
;1765:	// register all the server specified models
;1766:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1786
line 1769
;1767:		const char		*modelName;
;1768:
;1769:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 1704
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1700
ADDRLP4 1704
INDIRP4
ASGNP4
line 1770
;1770:		if ( !modelName[0] ) {
ADDRLP4 1700
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1790
line 1771
;1771:			break;
ADDRGP4 $1788
JUMPV
LABELV $1790
line 1773
;1772:		}
;1773:		cgs.gameModels[i] = trap_R_RegisterModel_MiTech( modelName );
ADDRLP4 1700
INDIRP4
ARGP4
ADDRLP4 1708
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+342640
ADDP4
ADDRLP4 1708
INDIRI4
ASGNI4
line 1774
;1774:	}
LABELV $1787
line 1766
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $1786
LABELV $1788
line 1776
;1775:
;1776:	cgs.media.railCoreShader = trap_R_RegisterShader("railCore");
ADDRGP4 $1795
ARGP4
ADDRLP4 1700
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+436
ADDRLP4 1700
INDIRI4
ASGNI4
line 1779
;1777:#ifdef MISSIONPACK
;1778:	// new stuff
;1779:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
ADDRGP4 $1798
ARGP4
ADDRLP4 1704
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2436
ADDRLP4 1704
INDIRI4
ASGNI4
line 1780
;1780:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
ADDRGP4 $1801
ARGP4
ADDRLP4 1708
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2440
ADDRLP4 1708
INDIRI4
ASGNI4
line 1781
;1781:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
ADDRGP4 $1804
ARGP4
ADDRLP4 1712
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2444
ADDRLP4 1712
INDIRI4
ASGNI4
line 1782
;1782:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
ADDRGP4 $1807
ARGP4
ADDRLP4 1716
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2448
ADDRLP4 1716
INDIRI4
ASGNI4
line 1783
;1783:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
ADDRGP4 $1810
ARGP4
ADDRLP4 1720
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2452
ADDRLP4 1720
INDIRI4
ASGNI4
line 1784
;1784:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
ADDRGP4 $1813
ARGP4
ADDRLP4 1724
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2456
ADDRLP4 1724
INDIRI4
ASGNI4
line 1785
;1785:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
ADDRGP4 $1816
ARGP4
ADDRLP4 1728
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2460
ADDRLP4 1728
INDIRI4
ASGNI4
line 1786
;1786:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
ADDRGP4 $1819
ARGP4
ADDRLP4 1732
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2464
ADDRLP4 1732
INDIRI4
ASGNI4
line 1787
;1787:        cgs.media.deathShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/death.tga");
ADDRGP4 $1822
ARGP4
ADDRLP4 1736
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2468
ADDRLP4 1736
INDIRI4
ASGNI4
line 1789
;1788:
;1789:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $1825
ARGP4
ADDRLP4 1740
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2504
ADDRLP4 1740
INDIRI4
ASGNI4
line 1790
;1790:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
ADDRGP4 $1828
ARGP4
ADDRLP4 1744
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2512
ADDRLP4 1744
INDIRI4
ASGNI4
line 1791
;1791:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
ADDRGP4 $1831
ARGP4
ADDRLP4 1748
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2508
ADDRLP4 1748
INDIRI4
ASGNI4
line 1792
;1792:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
ADDRGP4 $1834
ARGP4
ADDRLP4 1752
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2472
ADDRLP4 1752
INDIRI4
ASGNI4
line 1793
;1793:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
ADDRGP4 $1838
ARGP4
ADDRLP4 1756
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2472+4
ADDRLP4 1756
INDIRI4
ASGNI4
line 1794
;1794:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
ADDRGP4 $1842
ARGP4
ADDRLP4 1760
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+2472+8
ADDRLP4 1760
INDIRI4
ASGNI4
line 1796
;1795:
;1796:	trap_R_RegisterModel_MiTech( "models/players/sergei/lower.md3" );
ADDRGP4 $1843
ARGP4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
pop
line 1797
;1797:	trap_R_RegisterModel_MiTech( "models/players/sergei/upper.md3" );
ADDRGP4 $1844
ARGP4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
pop
line 1798
;1798:	trap_R_RegisterModel_MiTech( "models/players/sergei/head.md3" );
ADDRGP4 $1845
ARGP4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
pop
line 1800
;1799:
;1800:	trap_R_RegisterModel_MiTech( "models/players/kyonshi/lower.md3" );
ADDRGP4 $1846
ARGP4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
pop
line 1801
;1801:	trap_R_RegisterModel_MiTech( "models/players/kyonshi/upper.md3" );
ADDRGP4 $1847
ARGP4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
pop
line 1802
;1802:	trap_R_RegisterModel_MiTech( "models/players/kyonshi/head.md3" );
ADDRGP4 $1848
ARGP4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
pop
line 1806
;1803:
;1804:#endif
;1805:
;1806:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1819
;1807:/*
;1808:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1809:	{
;1810:		{
;1811:			int rval;
;1812:
;1813:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1814:			if (!rval)
;1815:				break;
;1816:		}
;1817:	}
;1818:*/
;1819:}
LABELV $1022
endproc CG_RegisterGraphics 1764 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1829
;1820:
;1821:
;1822:
;1823:/*																																			
;1824:=======================
;1825:CG_BuildSpectatorString
;1826:
;1827:=======================
;1828:*/
;1829:void CG_BuildSpectatorString(void) {
line 1831
;1830:	int i;
;1831:	cg.spectatorList[0] = 0;
ADDRGP4 cg+1888624
CNSTI1 0
ASGNI1
line 1832
;1832:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1851
line 1833
;1833:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1855
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1855
line 1834
;1834:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $1862
ARGP4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948+4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+1888624
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1835
;1835:		}
LABELV $1855
line 1836
;1836:	}
LABELV $1852
line 1832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1851
line 1837
;1837:	i = strlen(cg.spectatorList);
ADDRGP4 cg+1888624
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1838
;1838:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1889648
INDIRI4
EQI4 $1866
line 1839
;1839:		cg.spectatorLen = i;
ADDRGP4 cg+1889648
ADDRLP4 0
INDIRI4
ASGNI4
line 1840
;1840:		cg.spectatorWidth = -1;
ADDRGP4 cg+1889652
CNSTF4 3212836864
ASGNF4
line 1841
;1841:	}
LABELV $1866
line 1842
;1842:}
LABELV $1849
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1850
;1843:
;1844:
;1845:/*																																			
;1846:===================
;1847:CG_RegisterClients
;1848:===================
;1849:*/
;1850:static void CG_RegisterClients( void ) {
line 1853
;1851:	int		i;
;1852:
;1853:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1854
;1854:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1856
;1855:
;1856:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1874
line 1859
;1857:		const char		*clientInfo;
;1858:
;1859:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1878
line 1860
;1860:			continue;
ADDRGP4 $1875
JUMPV
LABELV $1878
line 1863
;1861:		}
;1862:
;1863:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1864
;1864:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1881
line 1865
;1865:			continue;
ADDRGP4 $1875
JUMPV
LABELV $1881
line 1867
;1866:		}
;1867:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1868
;1868:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1869
;1869:	}
LABELV $1875
line 1856
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1874
line 1870
;1870:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1871
;1871:}
LABELV $1871
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1880
;1872:
;1873://===========================================================================
;1874:
;1875:/*
;1876:=================
;1877:CG_ConfigString
;1878:=================
;1879:*/
;1880:const char *CG_ConfigString( int index ) {
line 1881
;1881:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1886
ADDRLP4 0
INDIRI4
CNSTI4 16384
LTI4 $1884
LABELV $1886
line 1882
;1882:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $1887
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1883
;1883:	}
LABELV $1884
line 1884
;1884:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+65536
ADDP4
RETP4
LABELV $1883
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 148 12
line 1895
;1885:}
;1886:
;1887://==================================================================
;1888:
;1889:/*
;1890:======================
;1891:CG_StartMusic
;1892:
;1893:======================
;1894:*/
;1895:void CG_StartMusic( void ) {
line 1900
;1896:	char	*s;
;1897:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1898:
;1899:	// start the background music
;1900:	if ( *cg_music.string && Q_stricmp( cg_music.string, "none" ) ) {
ADDRGP4 cg_music+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1890
ADDRGP4 cg_music+16
ARGP4
ADDRGP4 $1894
ARGP4
ADDRLP4 132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $1890
line 1901
;1901:		s = (char *)cg_music.string;
ADDRLP4 0
ADDRGP4 cg_music+16
ASGNP4
line 1902
;1902:	} else {
ADDRGP4 $1891
JUMPV
LABELV $1890
line 1903
;1903:		s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 136
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 1904
;1904:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1905
;1905:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1907
;1906:
;1907:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1908
;1908:        }
LABELV $1891
line 1909
;1909:}
LABELV $1889
endproc CG_StartMusic 148 12
bss
align 1
LABELV $1897
skip 32768
export CG_GetMenuBuffer
code
proc CG_GetMenuBuffer 16 16
line 1911
;1910:#ifdef MISSIONPACK
;1911:char *CG_GetMenuBuffer(const char *filename) {
line 1916
;1912:	int	len;
;1913:	fileHandle_t	f;
;1914:	static char buf[MAX_MENUFILE];
;1915:
;1916:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1917
;1917:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1898
line 1918
;1918:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $1900
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1919
;1919:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1896
JUMPV
LABELV $1898
line 1921
;1920:	}
;1921:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $1901
line 1922
;1922:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i\n", filename, len, MAX_MENUFILE ) );
ADDRGP4 $1903
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1923
;1923:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1924
;1924:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1896
JUMPV
LABELV $1901
line 1927
;1925:	}
;1926:
;1927:	trap_FS_Read( buf, len, f );
ADDRGP4 $1897
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1928
;1928:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $1897
ADDP4
CNSTI1 0
ASGNI1
line 1929
;1929:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1931
;1930:
;1931:	return buf;
ADDRGP4 $1897
RETP4
LABELV $1896
endproc CG_GetMenuBuffer 16 16
export CG_Asset_Parse
proc CG_Asset_Parse 1124 12
line 1939
;1932:}
;1933:
;1934://
;1935:// ==============================
;1936:// new hud stuff ( mission pack )
;1937:// ==============================
;1938://
;1939:qboolean CG_Asset_Parse(int handle) {
line 1943
;1940:	pc_token_t token;
;1941:	const char *tempStr;
;1942:
;1943:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1905
line 1944
;1944:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1905
line 1945
;1945:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1910
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1912
line 1946
;1946:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1911
line 1949
;1947:	}
;1948:
;1949:	while ( 1 ) {
line 1950
;1950:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1914
line 1951
;1951:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1914
line 1953
;1952:
;1953:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1919
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1916
line 1954
;1954:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1916
line 1958
;1955:		}
;1956:
;1957:		// font
;1958:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1923
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1920
line 1960
;1959:			int pointSize;
;1960:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1068
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1926
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
ADDRLP4 1072
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1924
LABELV $1926
line 1961
;1961:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1924
line 1963
;1962:			}
;1963:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 cgDC+228+12
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1964
;1964:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1920
line 1968
;1965:		}
;1966:
;1967:		// smallFont
;1968:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1933
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1930
line 1970
;1969:			int pointSize;
;1970:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1072
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $1936
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
ADDRLP4 1076
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1934
LABELV $1936
line 1971
;1971:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1934
line 1973
;1972:			}
;1973:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 cgDC+228+20560
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1974
;1974:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1930
line 1978
;1975:		}
;1976:
;1977:		// font
;1978:		if (Q_stricmp(token.string, "bigfont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1943
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1940
line 1980
;1979:			int pointSize;
;1980:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $1946
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
ADDRLP4 1080
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1944
LABELV $1946
line 1981
;1981:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1944
line 1983
;1982:			}
;1983:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 cgDC+228+41108
ARGP4
ADDRGP4 cgDC+64
INDIRP4
CALLV
pop
line 1984
;1984:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1940
line 1988
;1985:		}
;1986:
;1987:		// gradientbar
;1988:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1953
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1950
line 1989
;1989:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1954
line 1990
;1990:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1954
line 1992
;1991:			}
;1992:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 1993
;1993:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1950
line 1997
;1994:		}
;1995:
;1996:		// enterMenuSound
;1997:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1961
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1958
line 1998
;1998:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1080
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1962
line 1999
;1999:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1962
line 2001
;2000:			}
;2001:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound_MiTech( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 2002
;2002:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1958
line 2006
;2003:		}
;2004:
;2005:		// exitMenuSound
;2006:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1969
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1966
line 2007
;2007:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1084
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1970
line 2008
;2008:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1970
line 2010
;2009:			}
;2010:			cgDC.Assets.menuExitSound = trap_S_RegisterSound_MiTech( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 2011
;2011:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1966
line 2015
;2012:		}
;2013:
;2014:		// itemFocusSound
;2015:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1977
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1974
line 2016
;2016:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1088
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1978
line 2017
;2017:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1978
line 2019
;2018:			}
;2019:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound_MiTech( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 2020
;2020:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1974
line 2024
;2021:		}
;2022:
;2023:		// menuBuzzSound
;2024:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1985
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1982
line 2025
;2025:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1986
line 2026
;2026:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1986
line 2028
;2027:			}
;2028:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound_MiTech( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 2029
;2029:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1982
line 2032
;2030:		}
;2031:
;2032:		if (Q_stricmp(token.string, "cursor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $1993
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1990
line 2033
;2033:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1994
line 2034
;2034:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $1994
line 2036
;2035:			}
;2036:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
ADDRGP4 cgDC+228+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 2037
;2037:			continue;
ADDRGP4 $1912
JUMPV
LABELV $1990
line 2040
;2038:		}
;2039:
;2040:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2005
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $2002
line 2041
;2041:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1912
line 2042
;2042:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
line 2044
;2043:			}
;2044:			continue;
LABELV $2002
line 2047
;2045:		}
;2046:
;2047:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2013
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $2010
line 2048
;2048:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1912
line 2049
;2049:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
line 2051
;2050:			}
;2051:			continue;
LABELV $2010
line 2054
;2052:		}
;2053:
;2054:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2021
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $2018
line 2055
;2055:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1912
line 2056
;2056:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
line 2058
;2057:			}
;2058:			continue;
LABELV $2018
line 2061
;2059:		}
;2060:
;2061:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2029
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $2026
line 2062
;2062:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1912
line 2063
;2063:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
line 2065
;2064:			}
;2065:			continue;
LABELV $2026
line 2068
;2066:		}
;2067:
;2068:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2037
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2034
line 2069
;2069:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1912
line 2070
;2070:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
line 2072
;2071:			}
;2072:			continue;
LABELV $2034
line 2075
;2073:		}
;2074:
;2075:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2045
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2042
line 2076
;2076:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 cgDC+228+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2046
line 2077
;2077:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1904
JUMPV
LABELV $2046
line 2079
;2078:			}
;2079:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
ADDRGP4 cgDC+228+61760
ADDRGP4 cgDC+228+61744+12
INDIRF4
ASGNF4
line 2080
;2080:			continue;
LABELV $2042
line 2082
;2081:		}
;2082:	}
LABELV $1912
line 1949
ADDRGP4 $1911
JUMPV
line 2083
;2083:	return qfalse; // bk001204 - why not?
CNSTI4 0
RETI4
LABELV $1904
endproc CG_Asset_Parse 1124 12
export CG_ParseMenu
proc CG_ParseMenu 1064 8
line 2086
;2084:}
;2085:
;2086:void CG_ParseMenu(const char *menuFile) {
line 2090
;2087:	pc_token_t token;
;2088:	int handle;
;2089:
;2090:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 2091
;2091:	if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2056
line 2092
;2092:		handle = trap_PC_LoadSource("ui/testhud.menu");
ADDRGP4 $2058
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
LABELV $2056
line 2093
;2093:	if (!handle)
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2062
line 2094
;2094:		return;
ADDRGP4 $2055
JUMPV
LABELV $2061
line 2096
;2095:
;2096:	while ( 1 ) {
line 2097
;2097:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2064
line 2098
;2098:			break;
ADDRGP4 $2063
JUMPV
LABELV $2064
line 2111
;2099:		}
;2100:
;2101:		//if ( Q_stricmp( token, "{" ) ) {
;2102:		//	Com_Printf( "Missing { in menu file\n" );
;2103:		//	break;
;2104:		//}
;2105:
;2106:		//if ( menuCount == MAX_MENUS ) {
;2107:		//	Com_Printf( "Too many menus!\n" );
;2108:		//	break;
;2109:		//}
;2110:
;2111:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $2066
line 2112
;2112:			break;
ADDRGP4 $2063
JUMPV
LABELV $2066
line 2115
;2113:		}
;2114:
;2115:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2072
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2069
line 2116
;2116:			if (CG_Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 CG_Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $2063
line 2117
;2117:				continue;
ADDRGP4 $2062
JUMPV
line 2118
;2118:			} else {
line 2119
;2119:				break;
LABELV $2069
line 2124
;2120:			}
;2121:		}
;2122:
;2123:
;2124:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $2078
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2075
line 2126
;2125:			// start a new menu
;2126:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 2127
;2127:		}
LABELV $2075
line 2128
;2128:	}
LABELV $2062
line 2096
ADDRGP4 $2061
JUMPV
LABELV $2063
line 2129
;2129:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 2130
;2130:}
LABELV $2055
endproc CG_ParseMenu 1064 8
export CG_Load_Menu
proc CG_Load_Menu 20 8
line 2132
;2131:
;2132:qboolean CG_Load_Menu(char **p) {
line 2135
;2133:	char *token;
;2134:
;2135:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2137
;2136:
;2137:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $2083
line 2138
;2138:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2082
line 2141
;2139:	}
;2140:
;2141:	while ( 1 ) {
line 2143
;2142:
;2143:		token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2145
;2144:
;2145:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1919
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2085
line 2146
;2146:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2085
line 2149
;2147:		}
;2148:
;2149:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2089
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2087
LABELV $2089
line 2150
;2150:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2087
line 2153
;2151:		}
;2152:
;2153:		CG_ParseMenu(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParseMenu
CALLV
pop
line 2154
;2154:	}
LABELV $2083
line 2141
ADDRGP4 $2082
JUMPV
line 2155
;2155:	return qfalse;
CNSTI4 0
RETI4
LABELV $2079
endproc CG_Load_Menu 20 8
bss
align 1
LABELV $2091
skip 4096
export CG_LoadMenus
code
proc CG_LoadMenus 52 16
line 2160
;2156:}
;2157:
;2158:
;2159:
;2160:void CG_LoadMenus(const char *menuFile) {
line 2167
;2161:	char	*token;
;2162:	char *p;
;2163:	int	len, start;
;2164:	fileHandle_t	f;
;2165:	static char buf[MAX_MENUDEFFILE];
;2166:
;2167:	start = trap_Milliseconds();
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 2169
;2168:
;2169:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 2170
;2170:	if ( !f ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2092
line 2171
;2171:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
ADDRGP4 $2094
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 2172
;2172:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
ADDRGP4 $312
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 2173
;2173:		if (!f) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2095
line 2174
;2174:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n") );
ADDRGP4 $2097
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 2175
;2175:		}
LABELV $2095
line 2176
;2176:	}
LABELV $2092
line 2178
;2177:
;2178:	if ( len >= MAX_MENUDEFFILE ) {
ADDRLP4 12
INDIRI4
CNSTI4 4096
LTI4 $2098
line 2179
;2179:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i\n", menuFile, len, MAX_MENUDEFFILE ) );
ADDRGP4 $1903
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 4096
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 2180
;2180:		trap_FS_FCloseFile( f );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2181
;2181:		return;
ADDRGP4 $2090
JUMPV
LABELV $2098
line 2184
;2182:	}
;2183:
;2184:	trap_FS_Read( buf, len, f );
ADDRGP4 $2091
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 2185
;2185:	buf[len] = 0;
ADDRLP4 12
INDIRI4
ADDRGP4 $2091
ADDP4
CNSTI1 0
ASGNI1
line 2186
;2186:	trap_FS_FCloseFile( f );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2188
;2187:
;2188:	COM_Compress(buf);
ADDRGP4 $2091
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 2190
;2189:
;2190:	Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 2192
;2191:
;2192:	p = buf;
ADDRLP4 4
ADDRGP4 $2091
ASGNP4
ADDRGP4 $2101
JUMPV
LABELV $2100
line 2194
;2193:
;2194:	while ( 1 ) {
line 2195
;2195:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2196
;2196:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2106
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2106
ADDRLP4 36
INDIRI4
CNSTI4 125
NEI4 $2103
LABELV $2106
line 2197
;2197:			break;
ADDRGP4 $2102
JUMPV
LABELV $2103
line 2210
;2198:		}
;2199:
;2200:		//if ( Q_stricmp( token, "{" ) ) {
;2201:		//	Com_Printf( "Missing { in menu file\n" );
;2202:		//	break;
;2203:		//}
;2204:
;2205:		//if ( menuCount == MAX_MENUS ) {
;2206:		//	Com_Printf( "Too many menus!\n" );
;2207:		//	break;
;2208:		//}
;2209:
;2210:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1919
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $2107
line 2211
;2211:			break;
ADDRGP4 $2102
JUMPV
LABELV $2107
line 2214
;2212:		}
;2213:
;2214:		if (Q_stricmp(token, "loadmenu") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2111
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $2109
line 2215
;2215:			if (CG_Load_Menu(&p)) {
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 CG_Load_Menu
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2102
line 2216
;2216:				continue;
line 2217
;2217:			} else {
line 2218
;2218:				break;
LABELV $2109
line 2221
;2219:			}
;2220:		}
;2221:	}
LABELV $2101
line 2194
ADDRGP4 $2100
JUMPV
LABELV $2102
line 2223
;2222:
;2223:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $2114
ARGP4
ADDRLP4 28
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2225
;2224:
;2225:}
LABELV $2090
endproc CG_LoadMenus 52 16
export CG_StartScoreboardMusic
proc CG_StartScoreboardMusic 1172 12
line 2227
;2226:
;2227:void CG_StartScoreboardMusic( void ) {
line 2233
;2228:	char	var[MAX_TOKEN_CHARS];
;2229:	char	*s;
;2230:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;2231:
;2232:	//if music volume is 0, don't start the scoreboard music
;2233:	trap_Cvar_VariableStringBuffer( "s_musicvolume", var, sizeof( var ) );
ADDRGP4 $2116
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2234
;2234:	if ( !strcmp(var, "0") )
ADDRLP4 0
ARGP4
ADDRGP4 $110
ARGP4
ADDRLP4 1156
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2117
line 2235
;2235:		return;
ADDRGP4 $2115
JUMPV
LABELV $2117
line 2238
;2236:
;2237:	// start the background music
;2238:	s = (char *)CG_ConfigString( CS_SCOREBOARDMUSIC );
CNSTI4 8611
ARGI4
ADDRLP4 1160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1160
INDIRP4
ASGNP4
line 2239
;2239:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 1024
ARGP4
ADDRLP4 1164
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2240
;2240:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 1024
ARGP4
ADDRLP4 1168
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 1092
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2242
;2241:
;2242:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 1028
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 2243
;2243:}
LABELV $2115
endproc CG_StartScoreboardMusic 1172 12
export CG_StartDeathMusic
proc CG_StartDeathMusic 1172 12
line 2245
;2244:
;2245:void CG_StartDeathMusic( void ) {
line 2251
;2246:	char	var[MAX_TOKEN_CHARS];
;2247:	char	*s;
;2248:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;2249:
;2250:	//if music volume is 0, don't start the scoreboard music
;2251:	trap_Cvar_VariableStringBuffer( "s_musicvolume", var, sizeof( var ) );
ADDRGP4 $2116
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2252
;2252:	if ( !strcmp(var, "0") )
ADDRLP4 0
ARGP4
ADDRGP4 $110
ARGP4
ADDRLP4 1156
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2120
line 2253
;2253:		return;
ADDRGP4 $2119
JUMPV
LABELV $2120
line 2256
;2254:
;2255:	// start the background music
;2256:	s = (char *)CG_ConfigString( CS_DEATHMUSIC );
CNSTI4 8612
ARGI4
ADDRLP4 1160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1160
INDIRP4
ASGNP4
line 2257
;2257:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 1024
ARGP4
ADDRLP4 1164
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2258
;2258:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 1024
ARGP4
ADDRLP4 1168
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 1092
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2260
;2259:
;2260:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 1028
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 2261
;2261:	cg.deathmusicStarted = qtrue;
ADDRGP4 cg+1987500
CNSTI4 1
ASGNI4
line 2262
;2262:}
LABELV $2119
endproc CG_StartDeathMusic 1172 12
export CG_StopDeathMusic
proc CG_StopDeathMusic 0 0
line 2264
;2263:
;2264:void CG_StopDeathMusic( void ) {
line 2265
;2265:	trap_S_StopBackgroundTrack();
ADDRGP4 trap_S_StopBackgroundTrack
CALLV
pop
line 2266
;2266:	cg.deathmusicStarted = qfalse;
ADDRGP4 cg+1987500
CNSTI4 0
ASGNI4
line 2267
;2267:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2268
;2268:}
LABELV $2123
endproc CG_StopDeathMusic 0 0
proc CG_OwnerDrawHandleKey 0 0
line 2271
;2269:
;2270:
;2271:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 2272
;2272:	return qfalse;
CNSTI4 0
RETI4
LABELV $2125
endproc CG_OwnerDrawHandleKey 0 0
proc CG_FeederCount 8 0
line 2276
;2273:}
;2274:
;2275:
;2276:static int CG_FeederCount(float feederID) {
line 2278
;2277:	int i, count;
;2278:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2279
;2279:	if (feederID == FEEDER_REDTEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $2127
line 2280
;2280:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2132
JUMPV
LABELV $2129
line 2281
;2281:			if (cg.scores[i].team == TEAM_RED) {
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2134
line 2282
;2282:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2283
;2283:			}
LABELV $2134
line 2284
;2284:		}
LABELV $2130
line 2280
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2132
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1872036
INDIRI4
LTI4 $2129
line 2285
;2285:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
ADDRGP4 $2128
JUMPV
LABELV $2127
ADDRFP4 0
INDIRF4
CNSTF4 1086324736
NEF4 $2138
line 2286
;2286:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2143
JUMPV
LABELV $2140
line 2287
;2287:			if (cg.scores[i].team == TEAM_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2145
line 2288
;2288:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2289
;2289:			}
LABELV $2145
line 2290
;2290:		}
LABELV $2141
line 2286
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2143
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1872036
INDIRI4
LTI4 $2140
line 2291
;2291:	} else if (feederID == FEEDER_SCOREBOARD) {
ADDRGP4 $2139
JUMPV
LABELV $2138
ADDRFP4 0
INDIRF4
CNSTF4 1093664768
NEF4 $2149
line 2292
;2292:		return cg.numScores;
ADDRGP4 cg+1872036
INDIRI4
RETI4
ADDRGP4 $2126
JUMPV
LABELV $2149
LABELV $2139
LABELV $2128
line 2294
;2293:	}
;2294:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $2126
endproc CG_FeederCount 8 0
export CG_SetScoreSelection
proc CG_SetScoreSelection 28 16
line 2298
;2295:}
;2296:
;2297:
;2298:void CG_SetScoreSelection(void *p) {
line 2299
;2299:	menuDef_t *menu = (menuDef_t*)p;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
line 2300
;2300:	playerState_t *ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 2302
;2301:	int i, red, blue;
;2302:	red = blue = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 2303
;2303:	for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2157
JUMPV
LABELV $2154
line 2304
;2304:		if (cg.scores[i].team == TEAM_RED) {
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2159
line 2305
;2305:			red++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2306
;2306:		} else if (cg.scores[i].team == TEAM_BLUE) {
ADDRGP4 $2160
JUMPV
LABELV $2159
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2163
line 2307
;2307:			blue++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2308
;2308:		}
LABELV $2163
LABELV $2160
line 2309
;2309:		if (ps->clientNum == cg.scores[i].client) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
INDIRI4
NEI4 $2167
line 2310
;2310:			cg.selectedScore = i;
ADDRGP4 cg+1872040
ADDRLP4 0
INDIRI4
ASGNI4
line 2311
;2311:		}
LABELV $2167
line 2312
;2312:	}
LABELV $2155
line 2303
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2157
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1872036
INDIRI4
LTI4 $2154
line 2314
;2313:
;2314:	if (menu == NULL) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2171
line 2316
;2315:		// just interested in setting the selected score
;2316:		return;
ADDRGP4 $2152
JUMPV
LABELV $2171
line 2319
;2317:	}
;2318:
;2319:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $2173
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $2173
line 2320
;2320:		int feeder = FEEDER_REDTEAM_LIST;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 2321
;2321:		i = red;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2322
;2322:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
ADDRGP4 cg+1872040
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2177
line 2323
;2323:			feeder = FEEDER_BLUETEAM_LIST;
ADDRLP4 24
CNSTI4 6
ASGNI4
line 2324
;2324:			i = blue;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2325
;2325:		}
LABELV $2177
line 2326
;2326:		Menu_SetFeederSelection(menu, feeder, i, NULL);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2327
;2327:	} else {
ADDRGP4 $2174
JUMPV
LABELV $2173
line 2328
;2328:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 cg+1872040
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2329
;2329:	}
LABELV $2174
line 2330
;2330:}
LABELV $2152
endproc CG_SetScoreSelection 28 16
proc CG_InfoFromScoreIndex 8 0
line 2333
;2331:
;2332:// FIXME: might need to cache this info
;2333:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
line 2335
;2334:	int i, count;
;2335:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $2184
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $2184
line 2336
;2336:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2337
;2337:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2191
JUMPV
LABELV $2188
line 2338
;2338:			if (cg.scores[i].team == team) {
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2193
line 2339
;2339:				if (count == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2197
line 2340
;2340:					*scoreIndex = i;
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2341
;2341:					return &cgs.clientinfo[cg.scores[i].client];
CNSTI4 1944
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
RETP4
ADDRGP4 $2183
JUMPV
LABELV $2197
line 2343
;2342:				}
;2343:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2344
;2344:			}
LABELV $2193
line 2345
;2345:		}
LABELV $2189
line 2337
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2191
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1872036
INDIRI4
LTI4 $2188
line 2346
;2346:	}
LABELV $2184
line 2347
;2347:	*scoreIndex = index;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 2348
;2348:	return &cgs.clientinfo[ cg.scores[index].client ];
CNSTI4 1944
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
RETP4
LABELV $2183
endproc CG_InfoFromScoreIndex 8 0
proc CG_FeederItemText 44 12
line 2351
;2349:}
;2350:
;2351:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
line 2353
;2352:	gitem_t *item;
;2353:	int scoreIndex = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2354
;2354:	clientInfo_t *info = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2355
;2355:	int team = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 2356
;2356:	score_t *sp = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 2358
;2357:
;2358:	*handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 2360
;2359:
;2360:	if (feederID == FEEDER_REDTEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $2204
line 2361
;2361:		team = TEAM_RED;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2362
;2362:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
ADDRGP4 $2205
JUMPV
LABELV $2204
ADDRFP4 0
INDIRF4
CNSTF4 1086324736
NEF4 $2206
line 2363
;2363:		team = TEAM_BLUE;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 2364
;2364:	}
LABELV $2206
LABELV $2205
line 2366
;2365:
;2366:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 20
ADDRGP4 CG_InfoFromScoreIndex
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 2367
;2367:	sp = &cg.scores[scoreIndex];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
ASGNP4
line 2369
;2368:
;2369:	if (info && info->infoValid) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2209
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2209
line 2370
;2370:		switch (column) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $2211
ADDRLP4 28
INDIRI4
CNSTI4 6
GTI4 $2211
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2265
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2265
address $2213
address $2233
address $2240
address $2257
address $2258
address $2259
address $2261
code
LABELV $2213
line 2372
;2371:			case 0:
;2372:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2214
line 2373
;2373:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 2374
;2374:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
ADDRFP4 12
INDIRP4
CNSTI4 24
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 2375
;2375:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
ADDRGP4 $2212
JUMPV
LABELV $2214
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2217
line 2376
;2376:					item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 2377
;2377:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
ADDRFP4 12
INDIRP4
CNSTI4 24
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 2378
;2378:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRGP4 $2212
JUMPV
LABELV $2217
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2220
line 2379
;2379:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 2380
;2380:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
ADDRFP4 12
INDIRP4
CNSTI4 24
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 2381
;2381:				} else {
ADDRGP4 $2212
JUMPV
LABELV $2220
line 2382
;2382:					if ( info->botSkill > 0 && info->botSkill <= 14 ) {
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $2223
ADDRLP4 32
INDIRI4
CNSTI4 14
GTI4 $2223
line 2383
;2383:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1440-4
ADDP4
INDIRI4
ASGNI4
line 2384
;2384:					} else if ( info->handicap < 999 ) {
ADDRGP4 $2212
JUMPV
LABELV $2223
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 999
GEI4 $2212
line 2385
;2385:				if ( info->handicap != 100 ) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 100
EQI4 $2212
line 2386
;2386:					return va("%i", info->handicap );
ADDRGP4 $2232
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
ADDRGP4 $2203
JUMPV
line 2388
;2387:				}
;2388:					}
line 2389
;2389:				}
line 2390
;2390:			break;
LABELV $2233
line 2392
;2391:			case 1:
;2392:				if (team == -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $2234
line 2393
;2393:					return "";
ADDRGP4 $155
RETP4
ADDRGP4 $2203
JUMPV
LABELV $2234
line 2394
;2394:				} else if (info->isDead) {
ADDRLP4 0
INDIRP4
CNSTI4 1924
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2236
line 2395
;2395:                                        *handle = cgs.media.deathShader;
ADDRFP4 12
INDIRP4
ADDRGP4 cgs+956380+2468
INDIRI4
ASGNI4
line 2396
;2396:                                } else {
ADDRGP4 $2212
JUMPV
LABELV $2236
line 2397
;2397:					*handle = CG_StatusHandle(info->teamTask);
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 32
INDIRI4
ASGNI4
line 2398
;2398:				}
line 2399
;2399:		  break;
ADDRGP4 $2212
JUMPV
LABELV $2240
line 2401
;2400:			case 2:
;2401:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2241
line 2402
;2402:					return "Ready";
ADDRGP4 $2244
RETP4
ADDRGP4 $2203
JUMPV
LABELV $2241
line 2404
;2403:				}
;2404:				if (team == -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $2245
line 2405
;2405:					if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 3
NEI4 $2247
line 2406
;2406:						return va("%i/%i", info->wins, info->losses);
ADDRGP4 $2250
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
ADDRGP4 $2203
JUMPV
LABELV $2247
line 2407
;2407:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2251
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2251
line 2408
;2408:						return "Spectator";
ADDRGP4 $2253
RETP4
ADDRGP4 $2203
JUMPV
LABELV $2251
line 2409
;2409:					} else {
line 2410
;2410:						return "";
ADDRGP4 $155
RETP4
ADDRGP4 $2203
JUMPV
LABELV $2245
line 2412
;2411:					}
;2412:				} else {
line 2413
;2413:					if (info->teamLeader) {
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2212
line 2414
;2414:						return " ";
ADDRGP4 $2256
RETP4
ADDRGP4 $2203
JUMPV
line 2416
;2415:					}
;2416:				}
line 2417
;2417:			break;
LABELV $2257
line 2419
;2418:			case 3:
;2419:				return info->name;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
RETP4
ADDRGP4 $2203
JUMPV
line 2420
;2420:			break;
LABELV $2258
line 2422
;2421:			case 4:
;2422:				return va("%i", info->score);
ADDRGP4 $2232
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $2203
JUMPV
line 2423
;2423:			break;
LABELV $2259
line 2425
;2424:			case 5:
;2425:				return va("%4i", sp->time);
ADDRGP4 $2260
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
RETP4
ADDRGP4 $2203
JUMPV
line 2426
;2426:			break;
LABELV $2261
line 2428
;2427:			case 6:
;2428:				if ( sp->ping == -1 ) {
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $2262
line 2429
;2429:					return "connecting";
ADDRGP4 $2264
RETP4
ADDRGP4 $2203
JUMPV
LABELV $2262
line 2431
;2430:				}
;2431:				return va("%4i", sp->ping);
ADDRGP4 $2260
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
RETP4
ADDRGP4 $2203
JUMPV
line 2432
;2432:			break;
LABELV $2211
LABELV $2212
line 2434
;2433:		}
;2434:	}
LABELV $2209
line 2436
;2435:
;2436:	return "";
ADDRGP4 $155
RETP4
LABELV $2203
endproc CG_FeederItemText 44 12
proc CG_FeederItemImage 0 0
line 2439
;2437:}
;2438:
;2439:static qhandle_t CG_FeederItemImage(float feederID, int index) {
line 2440
;2440:	return 0;
CNSTI4 0
RETI4
LABELV $2266
endproc CG_FeederItemImage 0 0
proc CG_FeederSelection 16 0
line 2443
;2441:}
;2442:
;2443:static void CG_FeederSelection(float feederID, int index) {
line 2444
;2444:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $2268
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $2268
line 2446
;2445:		int i, count;
;2446:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
ADDRFP4 0
INDIRF4
CNSTF4 1084227584
NEF4 $2273
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $2274
JUMPV
LABELV $2273
ADDRLP4 12
CNSTI4 2
ASGNI4
LABELV $2274
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 2447
;2447:		count = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2448
;2448:		for (i = 0; i < cg.numScores; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2278
JUMPV
LABELV $2275
line 2449
;2449:			if (cg.scores[i].team == team) {
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+56
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2280
line 2450
;2450:				if (index == count) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $2284
line 2451
;2451:					cg.selectedScore = i;
ADDRGP4 cg+1872040
ADDRLP4 0
INDIRI4
ASGNI4
line 2452
;2452:				}
LABELV $2284
line 2453
;2453:				count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2454
;2454:			}
LABELV $2280
line 2455
;2455:		}
LABELV $2276
line 2448
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2278
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1872036
INDIRI4
LTI4 $2275
line 2456
;2456:	} else {
ADDRGP4 $2269
JUMPV
LABELV $2268
line 2457
;2457:		cg.selectedScore = index;
ADDRGP4 cg+1872040
ADDRFP4 4
INDIRI4
ASGNI4
line 2458
;2458:	}
LABELV $2269
line 2459
;2459:}
LABELV $2267
endproc CG_FeederSelection 16 0
proc CG_Cvar_Get 132 12
line 2463
;2460:#endif
;2461:
;2462:#ifdef MISSIONPACK // bk001204 - only needed there
;2463:static float CG_Cvar_Get(const char *cvar) {
line 2465
;2464:	char buff[128];
;2465:	memset(buff, 0, sizeof(buff));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2466
;2466:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2467
;2467:	return atof(buff);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $2288
endproc CG_Cvar_Get 132 12
export CG_Text_PaintWithCursor
proc CG_Text_PaintWithCursor 0 32
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 2472
;2468:}
;2469:#endif
;2470:
;2471:#ifdef MISSIONPACK
;2472:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
line 2473
;2473:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 2474
;2474:}
LABELV $2289
endproc CG_Text_PaintWithCursor 0 32
proc CG_OwnerDrawWidth 48 12
line 2476
;2475:
;2476:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
line 2477
;2477:	switch (ownerDraw) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 39
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2293
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $2301
LABELV $2300
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 29
EQI4 $2296
ADDRLP4 8
INDIRI4
CNSTI4 30
EQI4 $2298
ADDRGP4 $2291
JUMPV
LABELV $2301
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 49
EQI4 $2294
ADDRLP4 12
INDIRI4
CNSTI4 50
EQI4 $2295
ADDRGP4 $2291
JUMPV
LABELV $2293
line 2479
;2478:	  case CG_GAME_TYPE:
;2479:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
ADDRLP4 16
ADDRGP4 CG_GameTypeString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2290
JUMPV
LABELV $2294
line 2481
;2480:	  case CG_GAME_STATUS:
;2481:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
ADDRLP4 24
ADDRGP4 CG_GetGameStatusText
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2290
JUMPV
line 2482
;2482:			break;
LABELV $2295
line 2484
;2483:	  case CG_KILLER:
;2484:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
ADDRLP4 32
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $2290
JUMPV
line 2485
;2485:			break;
LABELV $2296
line 2487
;2486:	  case CG_RED_NAME:
;2487:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
ADDRGP4 cg_redTeamName+16
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $2290
JUMPV
line 2488
;2488:			break;
LABELV $2298
line 2490
;2489:	  case CG_BLUE_NAME:
;2490:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
ADDRGP4 cg_blueTeamName+16
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2290
JUMPV
line 2491
;2491:			break;
LABELV $2291
line 2495
;2492:
;2493:
;2494:	}
;2495:	return 0;
CNSTI4 0
RETI4
LABELV $2290
endproc CG_OwnerDrawWidth 48 12
proc CG_PlayCinematic 4 24
line 2498
;2496:}
;2497:
;2498:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 2499
;2499:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2302
endproc CG_PlayCinematic 4 24
proc CG_StopCinematic 0 4
line 2502
;2500:}
;2501:
;2502:static void CG_StopCinematic(int handle) {
line 2503
;2503:  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 2504
;2504:}
LABELV $2303
endproc CG_StopCinematic 0 4
proc CG_DrawCinematic 0 20
line 2506
;2505:
;2506:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
line 2507
;2507:  trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 2508
;2508:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 2509
;2509:}
LABELV $2304
endproc CG_DrawCinematic 0 20
proc CG_RunCinematicFrame 0 4
line 2511
;2510:
;2511:static void CG_RunCinematicFrame(int handle) {
line 2512
;2512:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 2513
;2513:}
LABELV $2305
endproc CG_RunCinematicFrame 0 4
export CG_LoadHudMenu
proc CG_LoadHudMenu 1028 12
line 2521
;2514:
;2515:/*
;2516:=================
;2517:CG_LoadHudMenu();
;2518:
;2519:=================
;2520:*/
;2521:void CG_LoadHudMenu( void ) {
line 2525
;2522:	char buff[1024];
;2523:	const char *hudSet;
;2524:
;2525:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 cgDC
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 2526
;2526:	cgDC.setColor = &trap_R_SetColor;
ADDRGP4 cgDC+4
ADDRGP4 trap_R_SetColor
ASGNP4
line 2527
;2527:	cgDC.drawHandlePic = &CG_DrawPic;
ADDRGP4 cgDC+8
ADDRGP4 CG_DrawPic
ASGNP4
line 2528
;2528:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 cgDC+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 2529
;2529:	cgDC.drawText = &CG_Text_Paint;
ADDRGP4 cgDC+16
ADDRGP4 CG_Text_Paint
ASGNP4
line 2530
;2530:	cgDC.textWidth = &CG_Text_Width;
ADDRGP4 cgDC+20
ADDRGP4 CG_Text_Width
ASGNP4
line 2531
;2531:	cgDC.textHeight = &CG_Text_Height;
ADDRGP4 cgDC+24
ADDRGP4 CG_Text_Height
ASGNP4
line 2532
;2532:	cgDC.registerModel = &trap_R_RegisterModel_MiTech;
ADDRGP4 cgDC+28
ADDRGP4 trap_R_RegisterModel_MiTech
ASGNP4
line 2533
;2533:	cgDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 cgDC+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 2534
;2534:	cgDC.fillRect = &CG_FillRect;
ADDRGP4 cgDC+36
ADDRGP4 CG_FillRect
ASGNP4
line 2535
;2535:	cgDC.drawRect = &CG_DrawRect;
ADDRGP4 cgDC+40
ADDRGP4 CG_DrawRect
ASGNP4
line 2536
;2536:	cgDC.drawSides = &CG_DrawSides;
ADDRGP4 cgDC+44
ADDRGP4 CG_DrawSides
ASGNP4
line 2537
;2537:	cgDC.drawTopBottom = &CG_DrawTopBottom;
ADDRGP4 cgDC+48
ADDRGP4 CG_DrawTopBottom
ASGNP4
line 2538
;2538:	cgDC.clearScene = &trap_R_ClearScene;
ADDRGP4 cgDC+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 2539
;2539:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 cgDC+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 2540
;2540:	cgDC.renderScene = &trap_R_RenderScene;
ADDRGP4 cgDC+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 2541
;2541:	cgDC.registerFont = &trap_R_RegisterFont;
ADDRGP4 cgDC+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 2542
;2542:	cgDC.ownerDrawItem = &CG_OwnerDraw;
ADDRGP4 cgDC+68
ADDRGP4 CG_OwnerDraw
ASGNP4
line 2543
;2543:	cgDC.getValue = &CG_GetValue;
ADDRGP4 cgDC+72
ADDRGP4 CG_GetValue
ASGNP4
line 2544
;2544:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
ADDRGP4 cgDC+76
ADDRGP4 CG_OwnerDrawVisible
ASGNP4
line 2545
;2545:	cgDC.runScript = &CG_RunMenuScript;
ADDRGP4 cgDC+80
ADDRGP4 CG_RunMenuScript
ASGNP4
line 2546
;2546:	cgDC.getTeamColor = &CG_GetTeamColor;
ADDRGP4 cgDC+84
ADDRGP4 CG_GetTeamColor
ASGNP4
line 2547
;2547:	cgDC.setCVar = trap_Cvar_Set;
ADDRGP4 cgDC+96
ADDRGP4 trap_Cvar_Set
ASGNP4
line 2548
;2548:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 cgDC+88
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 2549
;2549:	cgDC.getCVarValue = CG_Cvar_Get;
ADDRGP4 cgDC+92
ADDRGP4 CG_Cvar_Get
ASGNP4
line 2550
;2550:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
ADDRGP4 cgDC+100
ADDRGP4 CG_Text_PaintWithCursor
ASGNP4
line 2553
;2551:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;2552:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;2553:	cgDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 cgDC+112
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 2554
;2554:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
ADDRGP4 cgDC+116
ADDRGP4 CG_OwnerDrawHandleKey
ASGNP4
line 2555
;2555:	cgDC.feederCount = &CG_FeederCount;
ADDRGP4 cgDC+120
ADDRGP4 CG_FeederCount
ASGNP4
line 2556
;2556:	cgDC.feederItemImage = &CG_FeederItemImage;
ADDRGP4 cgDC+128
ADDRGP4 CG_FeederItemImage
ASGNP4
line 2557
;2557:	cgDC.feederItemText = &CG_FeederItemText;
ADDRGP4 cgDC+124
ADDRGP4 CG_FeederItemText
ASGNP4
line 2558
;2558:	cgDC.feederSelection = &CG_FeederSelection;
ADDRGP4 cgDC+132
ADDRGP4 CG_FeederSelection
ASGNP4
line 2563
;2559:	//cgDC.setBinding = &trap_Key_SetBinding;
;2560:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;2561:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;2562:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;2563:	cgDC.Error = &Com_Error;
ADDRGP4 cgDC+152
ADDRGP4 Com_Error
ASGNP4
line 2564
;2564:	cgDC.Print = &Com_Printf;
ADDRGP4 cgDC+156
ADDRGP4 Com_Printf
ASGNP4
line 2565
;2565:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
ADDRGP4 cgDC+164
ADDRGP4 CG_OwnerDrawWidth
ASGNP4
line 2567
;2566:	//cgDC.Pause = &CG_Pause;
;2567:	cgDC.registerSound = &trap_S_RegisterSound_MiTech;
ADDRGP4 cgDC+168
ADDRGP4 trap_S_RegisterSound_MiTech
ASGNP4
line 2568
;2568:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 cgDC+172
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 2569
;2569:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 cgDC+176
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 2570
;2570:	cgDC.playCinematic = &CG_PlayCinematic;
ADDRGP4 cgDC+180
ADDRGP4 CG_PlayCinematic
ASGNP4
line 2571
;2571:	cgDC.stopCinematic = &CG_StopCinematic;
ADDRGP4 cgDC+184
ADDRGP4 CG_StopCinematic
ASGNP4
line 2572
;2572:	cgDC.drawCinematic = &CG_DrawCinematic;
ADDRGP4 cgDC+188
ADDRGP4 CG_DrawCinematic
ASGNP4
line 2573
;2573:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
ADDRGP4 cgDC+192
ADDRGP4 CG_RunCinematicFrame
ASGNP4
line 2575
;2574:
;2575:	Init_Display(&cgDC);
ADDRGP4 cgDC
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 2577
;2576:
;2577:	Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 2579
;2578:
;2579:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
ADDRGP4 $311
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2580
;2580:	hudSet = buff;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 2581
;2581:	if (hudSet[0] == '\0') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2348
line 2582
;2582:		hudSet = "ui/hud.txt";
ADDRLP4 0
ADDRGP4 $312
ASGNP4
line 2583
;2583:	}
LABELV $2348
line 2585
;2584:
;2585:	CG_LoadMenus(hudSet);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadMenus
CALLV
pop
line 2586
;2586:}
LABELV $2306
endproc CG_LoadHudMenu 1028 12
export CG_AssetCache
proc CG_AssetCache 68 4
line 2588
;2587:
;2588:void CG_AssetCache( void ) {
line 2594
;2589:	//if (Assets.textFont == NULL) {
;2590:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;2591:	//}
;2592:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;2593:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;2594:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $2353
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61660
ADDRLP4 0
INDIRI4
ASGNI4
line 2595
;2595:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $2356
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61768
ADDRLP4 4
INDIRI4
ASGNI4
line 2596
;2596:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $2359
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772
ADDRLP4 8
INDIRI4
ASGNI4
line 2597
;2597:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $2363
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772+4
ADDRLP4 12
INDIRI4
ASGNI4
line 2598
;2598:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $2367
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772+8
ADDRLP4 16
INDIRI4
ASGNI4
line 2599
;2599:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $2371
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772+12
ADDRLP4 20
INDIRI4
ASGNI4
line 2600
;2600:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $2375
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772+16
ADDRLP4 24
INDIRI4
ASGNI4
line 2601
;2601:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $2379
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772+20
ADDRLP4 28
INDIRI4
ASGNI4
line 2602
;2602:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $2383
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61772+24
ADDRLP4 32
INDIRI4
ASGNI4
line 2603
;2603:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $2386
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61680
ADDRLP4 36
INDIRI4
ASGNI4
line 2604
;2604:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $2389
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61668
ADDRLP4 40
INDIRI4
ASGNI4
line 2605
;2605:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $2392
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61664
ADDRLP4 44
INDIRI4
ASGNI4
line 2606
;2606:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $2395
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61672
ADDRLP4 48
INDIRI4
ASGNI4
line 2607
;2607:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $2398
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61676
ADDRLP4 52
INDIRI4
ASGNI4
line 2608
;2608:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $2401
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61684
ADDRLP4 56
INDIRI4
ASGNI4
line 2609
;2609:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $2404
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61700
ADDRLP4 60
INDIRI4
ASGNI4
line 2610
;2610:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $2407
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgDC+228+61704
ADDRLP4 64
INDIRI4
ASGNI4
line 2611
;2611:}
LABELV $2350
endproc CG_AssetCache 68 4
export CG_Init
proc CG_Init 72 12
line 2624
;2612:#endif
;2613:
;2614:int wideAdjustX; // leilei - dirty widescreen hack
;2615:
;2616:/*
;2617:=================
;2618:CG_Init
;2619:
;2620:Called after every level change or subsystem restart
;2621:Will perform callbacks to make the loading info screen update.
;2622:=================
;2623:*/
;2624:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 2628
;2625:	const char	*s;
;2626:
;2627:	// clear everything
;2628:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 958940
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2629
;2629:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1987840
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2630
;2630:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3801088
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2631
;2631:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2720
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2632
;2632:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24576
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2634
;2633:
;2634:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 2636
;2635:
;2636:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+339032
ADDRFP4 0
INDIRI4
ASGNI4
line 2637
;2637:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+339028
ADDRFP4 4
INDIRI4
ASGNI4
line 2640
;2638:
;2639:	// load a few needed things before we do any screen updates
;2640:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $2413
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380
ADDRLP4 4
INDIRI4
ASGNI4
line 2641
;2641:	cgs.media.charsetShaderRus	= trap_R_RegisterShader( "gfx/2d/bigchars_ru" );
ADDRGP4 $2416
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+4
ADDRLP4 8
INDIRI4
ASGNI4
line 2642
;2642:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $2419
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+20
ADDRLP4 12
INDIRI4
ASGNI4
line 2643
;2643:	cgs.media.corner          	= trap_R_RegisterShader( "corner" );
ADDRGP4 $2422
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+956380+24
ADDRLP4 16
INDIRI4
ASGNI4
line 2644
;2644:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $2425
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+8
ADDRLP4 20
INDIRI4
ASGNI4
line 2645
;2645:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $2428
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+12
ADDRLP4 24
INDIRI4
ASGNI4
line 2646
;2646:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $2431
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+16
ADDRLP4 28
INDIRI4
ASGNI4
line 2648
;2647:
;2648:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 2650
;2649:
;2650:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 2652
;2651:
;2652:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+1870440
CNSTI4 2
ASGNI4
line 2654
;2653:
;2654:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
ADDRLP4 32
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+342628
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 cgs+342624
ADDRLP4 32
INDIRI4
ASGNI4
line 2655
;2655:	cgs.flagStatus = -1;
ADDRGP4 cgs+342632
CNSTI4 -1
ASGNI4
line 2659
;2656:	// old servers
;2657:
;2658:	// get the rendering configuration from the client system
;2659:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+327684
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 2660
;2660:	cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+339016
ADDRGP4 cgs+327684+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 2661
;2661:	cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+339020
ADDRGP4 cgs+327684+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 2663
;2662:
;2663:	realVidWidth = cgs.glconfig.vidWidth;
ADDRGP4 realVidWidth
ADDRGP4 cgs+327684+11304
INDIRI4
ASGNI4
line 2664
;2664:	realVidHeight = cgs.glconfig.vidHeight;
ADDRGP4 realVidHeight
ADDRGP4 cgs+327684+11308
INDIRI4
ASGNI4
line 2668
;2665:
;2666:			// leilei - widescreen correction
;2667:
;2668:	{
line 2674
;2669:		float resbias, resbiasy;
;2670:		float rex, rey, rias;
;2671:		int newresx, newresy;
;2672:		float adjustx, adjusty;
;2673:
;2674:		rex = 640.0f / realVidWidth;
ADDRLP4 52
CNSTF4 1142947840
ADDRGP4 realVidWidth
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2675
;2675:		rey = 480.0f / realVidHeight;
ADDRLP4 36
CNSTF4 1139802112
ADDRGP4 realVidHeight
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2677
;2676:
;2677:		newresx = 640.0f * (rex);
ADDRLP4 40
CNSTF4 1142947840
ADDRLP4 52
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2678
;2678:		newresy = 480.0f * (rey);
ADDRLP4 44
CNSTF4 1139802112
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2680
;2679:
;2680:		newresx = realVidWidth * rey;
ADDRLP4 40
ADDRGP4 realVidWidth
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2681
;2681:		newresy = realVidHeight * rey;
ADDRLP4 44
ADDRGP4 realVidHeight
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2683
;2682:
;2683:		resbias  = 0.5 * ( newresx -  ( newresy * (640.0/480.0) ) );
ADDRLP4 48
CNSTF4 1056964608
ADDRLP4 40
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRLP4 44
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 2684
;2684:		resbiasy = 0.5 * ( newresy -  ( newresx * (640.0/480.0) ) );
ADDRLP4 56
CNSTF4 1056964608
ADDRLP4 44
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRLP4 40
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 2687
;2685:
;2686:
;2687:		wideAdjustX = resbias;
ADDRGP4 wideAdjustX
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 2688
;2688:	}
line 2689
;2689:	if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 cgs+327684+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 cgs+327684+11308
INDIRI4
MULI4
LEI4 $2447
line 2691
;2690:		// wide screen
;2691:		cgs.screenXBias = 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 cgs+339024
CNSTF4 1056964608
ADDRGP4 cgs+327684+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 cgs+327684+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 2692
;2692:		cgs.screenXScale = cgs.screenYScale;
ADDRGP4 cgs+339016
ADDRGP4 cgs+339020
INDIRF4
ASGNF4
line 2693
;2693:	}
ADDRGP4 $2448
JUMPV
LABELV $2447
line 2694
;2694:	else {
line 2696
;2695:		// no wide screen
;2696:		cgs.screenXBias = 0;
ADDRGP4 cgs+339024
CNSTF4 0
ASGNF4
line 2697
;2697:	}
LABELV $2448
line 2702
;2698:
;2699:
;2700:
;2701:	// get the gamestate from the client system
;2702:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 2705
;2703:
;2704:	// check version
;2705:	s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 36
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 2710
;2706://	if ( strcmp( s, GAME_VERSION ) ) {
;2707://		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
;2708://	}
;2709:
;2710:	s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 40
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 2711
;2711:	cgs.levelStartTime = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+342388
ADDRLP4 44
INDIRI4
ASGNI4
line 2713
;2712:
;2713:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 2716
;2714:
;2715:	// load the new map
;2716:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2462
line 2717
;2717:	CG_LoadingString( "collision map" );
ADDRGP4 $2465
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2718
;2718:	}
LABELV $2462
line 2719
;2719:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2466
line 2720
;2720:	CG_LoadingString( "карта столкновений" );
ADDRGP4 $2469
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2721
;2721:	}
LABELV $2466
line 2723
;2722:
;2723:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+339076
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2726
;2724:
;2725:#ifdef MISSIONPACK
;2726:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 2729
;2727:#endif
;2728:
;2729:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2731
;2730:
;2731:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2472
line 2732
;2732:	CG_LoadingString( "sounds" );
ADDRGP4 $2475
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2733
;2733:	}
LABELV $2472
line 2734
;2734:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2476
line 2735
;2735:	CG_LoadingString( "звуки" );
ADDRGP4 $2479
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2736
;2736:	}
LABELV $2476
line 2738
;2737:
;2738:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2740
;2739:
;2740:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2480
line 2741
;2741:	CG_LoadingString( "graphics" );
ADDRGP4 $2483
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2742
;2742:	}
LABELV $2480
line 2743
;2743:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2484
line 2744
;2744:	CG_LoadingString( "графика" );
ADDRGP4 $2487
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2745
;2745:	}
LABELV $2484
line 2747
;2746:
;2747:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2749
;2748:
;2749:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2488
line 2750
;2750:	CG_LoadingString( "clients" );
ADDRGP4 $2491
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2751
;2751:	}
LABELV $2488
line 2752
;2752:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2492
line 2753
;2753:	CG_LoadingString( "игроки" );
ADDRGP4 $2495
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2754
;2754:	}
LABELV $2492
line 2756
;2755:
;2756:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2759
;2757:
;2758:#ifdef MISSIONPACK
;2759:	CG_AssetCache();
ADDRGP4 CG_AssetCache
CALLV
pop
line 2760
;2760:	CG_LoadHudMenu();      // load new hud stuff
ADDRGP4 CG_LoadHudMenu
CALLV
pop
line 2763
;2761:#endif
;2762:
;2763:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2765
;2764:
;2765:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2767
;2766:
;2767:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2770
;2768:
;2769:	// remove the last loading update
;2770:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+1871008
CNSTI1 0
ASGNI1
line 2773
;2771:
;2772:	// Make sure we have update values (scores)
;2773:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 2775
;2774:
;2775:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2777
;2776:
;2777:	CG_LoadingString( "" );
ADDRGP4 $155
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2780
;2778:
;2779:#ifdef MISSIONPACK
;2780:	CG_InitTeamChat();
ADDRGP4 CG_InitTeamChat
CALLV
pop
line 2783
;2781:#endif
;2782:
;2783:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2785
;2784:
;2785:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2787
;2786:	
;2787:	trap_SendConsoleCommand("execscript tools/create\n");
ADDRGP4 $2498
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2788
;2788:}
LABELV $2408
endproc CG_Init 72 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2797
;2789:
;2790:/*
;2791:=================
;2792:CG_Shutdown
;2793:
;2794:Called before every level change or subsystem restart
;2795:=================
;2796:*/
;2797:void CG_Shutdown( void ) {
line 2800
;2798:	// some mods may need to do cleanup work here,
;2799:	// like closing files or archiving session data
;2800:}
LABELV $2499
endproc CG_Shutdown 0 0
export CG_IsTeamGame
proc CG_IsTeamGame 0 0
line 2808
;2801:
;2802:/*
;2803:==================
;2804:CG_IsTeamGame
;2805:returns true if we're currently in a team gametype
;2806:==================
;2807:*/
;2808:qboolean CG_IsTeamGame() {
line 2809
;2809:	return qfalse;
CNSTI4 0
RETI4
LABELV $2500
endproc CG_IsTeamGame 0 0
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 2846
;2810:}
;2811:
;2812:/*
;2813:==================
;2814:CG_EventHandling
;2815:==================
;2816: type 0 - no event handling
;2817:      1 - team menu
;2818:      2 - hud editor
;2819:
;2820:*/
;2821:#ifndef MISSIONPACK
;2822:void CG_EventHandling(int type) {
;2823:}
;2824:
;2825:
;2826:
;2827:void CG_KeyEvent(int key, qboolean down) {
;2828:}
;2829:
;2830:void CG_MouseEvent(int x, int y) {
;2831:}
;2832:#endif
;2833:
;2834://unlagged - attack prediction #3
;2835:// moved from g_weapon.c
;2836:/*
;2837:======================
;2838:SnapVectorTowards
;2839:
;2840:Round a vector to integers for more efficient network
;2841:transmission, but make sure that it rounds towards a given point
;2842:rather than blindly truncating.  This prevents it from truncating
;2843:into a wall.
;2844:======================
;2845:*/
;2846:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 2849
;2847:	int		i;
;2848:
;2849:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2502
line 2850
;2850:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $2506
line 2851
;2851:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2852
;2852:		} else {
ADDRGP4 $2507
JUMPV
LABELV $2506
line 2853
;2853:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 2854
;2854:		}
LABELV $2507
line 2855
;2855:	}
LABELV $2503
line 2849
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2502
line 2856
;2856:}
LABELV $2501
endproc SnapVectorTowards 12 0
data
align 4
LABELV do_vid_restart
byte 4 0
export CG_FairCvars
code
proc CG_FairCvars 168 12
line 2861
;2857://unlagged - attack prediction #3
;2858:
;2859:static qboolean do_vid_restart = qfalse;
;2860:
;2861:void CG_FairCvars() {
line 2862
;2862:    qboolean vid_restart_required = qfalse;
ADDRLP4 128
CNSTI4 0
ASGNI4
line 2868
;2863:    char rendererinfos[128];
;2864:	
;2865://	trap_Cvar_Set( "r_ambientScale", "1.4" );
;2866://	trap_Cvar_Set( "r_directedScale", "0.6" );
;2867:
;2868:    if(cgs.videoflags & VF_LOCK_CVARS_EXTENDED) {
ADDRGP4 cgs+339048
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2509
line 2870
;2869:        //Lock extended cvars.
;2870:        trap_Cvar_VariableStringBuffer("r_subdivisions",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2512
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2871
;2871:        if(atoi( rendererinfos ) > 20 ) {
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 20
LEI4 $2513
line 2872
;2872:            trap_Cvar_Set("r_subdivisions","20");
ADDRGP4 $2512
ARGP4
ADDRGP4 $125
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2873
;2873:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2874
;2874:        }
LABELV $2513
line 2876
;2875:
;2876:        trap_Cvar_VariableStringBuffer("r_picmip",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2515
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2877
;2877:        if(atoi( rendererinfos ) > 3 ) {
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 3
LEI4 $2516
line 2878
;2878:            trap_Cvar_Set("r_picmip","3");
ADDRGP4 $2515
ARGP4
ADDRGP4 $118
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2879
;2879:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2880
;2880:        } else if(atoi( rendererinfos ) < 0 ) {
ADDRGP4 $2517
JUMPV
LABELV $2516
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $2518
line 2881
;2881:            trap_Cvar_Set("r_picmip","0");
ADDRGP4 $2515
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2882
;2882:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2883
;2883:        }
LABELV $2518
LABELV $2517
line 2885
;2884:
;2885:        trap_Cvar_VariableStringBuffer("r_intensity",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2520
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2886
;2886:        if(atoi( rendererinfos ) > 2 ) {
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LEI4 $2521
line 2887
;2887:            trap_Cvar_Set("r_intensity","2");
ADDRGP4 $2520
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2888
;2888:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2889
;2889:        } else if(atoi( rendererinfos ) < 0 ) {
ADDRGP4 $2522
JUMPV
LABELV $2521
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $2523
line 2890
;2890:            trap_Cvar_Set("r_intensity","0");
ADDRGP4 $2520
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2891
;2891:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2892
;2892:        }
LABELV $2523
LABELV $2522
line 2894
;2893:
;2894:        trap_Cvar_VariableStringBuffer("r_mapoverbrightbits",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2525
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2895
;2895:        if(atoi( rendererinfos ) > 2 ) {
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 2
LEI4 $2526
line 2896
;2896:            trap_Cvar_Set("r_mapoverbrightbits","2");
ADDRGP4 $2525
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2897
;2897:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2898
;2898:        } else if(atoi( rendererinfos ) < 0 ) {
ADDRGP4 $2527
JUMPV
LABELV $2526
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
GEI4 $2528
line 2899
;2899:            trap_Cvar_Set("r_mapoverbrightbits","0");
ADDRGP4 $2525
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2900
;2900:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2901
;2901:        }
LABELV $2528
LABELV $2527
line 2903
;2902:
;2903:        trap_Cvar_VariableStringBuffer("r_overbrightbits",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2530
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2904
;2904:        if(atoi( rendererinfos ) > 2 ) {
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 2
LEI4 $2531
line 2905
;2905:            trap_Cvar_Set("r_overbrightbits","2");
ADDRGP4 $2530
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2906
;2906:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2907
;2907:        } else if(atoi( rendererinfos ) < 0 ) {
ADDRGP4 $2532
JUMPV
LABELV $2531
ADDRLP4 0
ARGP4
ADDRLP4 164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
GEI4 $2533
line 2908
;2908:            trap_Cvar_Set("r_overbrightbits","0");
ADDRGP4 $2530
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2909
;2909:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2910
;2910:        }
LABELV $2533
LABELV $2532
line 2911
;2911:    }
LABELV $2509
line 2913
;2912:
;2913:    if(cgs.videoflags & VF_LOCK_VERTEX) {
ADDRGP4 cgs+339048
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2535
line 2914
;2914:        trap_Cvar_VariableStringBuffer("r_vertexlight",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2538
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2915
;2915:        if(atoi( rendererinfos ) != 0 ) {
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $2536
line 2916
;2916:            trap_Cvar_Set("r_vertexlight","0");
ADDRGP4 $2538
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2917
;2917:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2918
;2918:        }
line 2919
;2919:    } else if(cg_autovertex.integer){
ADDRGP4 $2536
JUMPV
LABELV $2535
ADDRGP4 cg_autovertex+12
INDIRI4
CNSTI4 0
EQI4 $2541
line 2920
;2920:        trap_Cvar_VariableStringBuffer("r_vertexlight",rendererinfos,sizeof(rendererinfos) );
ADDRGP4 $2538
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2921
;2921:        if(atoi( rendererinfos ) == 0 ) {
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $2544
line 2922
;2922:            trap_Cvar_Set("r_vertexlight","1");
ADDRGP4 $2538
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2923
;2923:            vid_restart_required = qtrue;
ADDRLP4 128
CNSTI4 1
ASGNI4
line 2924
;2924:        }
LABELV $2544
line 2925
;2925:    }
LABELV $2541
LABELV $2536
line 2927
;2926:
;2927:    if(vid_restart_required && do_vid_restart)
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $2546
ADDRGP4 do_vid_restart
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $2546
line 2928
;2928:        trap_SendConsoleCommand("vid_restart");
ADDRGP4 $2548
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $2546
line 2930
;2929:
;2930:    do_vid_restart = qtrue;
ADDRGP4 do_vid_restart
CNSTI4 1
ASGNI4
line 2932
;2931:
;2932:}
LABELV $2508
endproc CG_FairCvars 168 12
export trap_R_RegisterModel_MiTech
proc trap_R_RegisterModel_MiTech 2052 16
line 2934
;2933:
;2934:qhandle_t trap_R_RegisterModel_MiTech( const char *name ) {
line 2939
;2935:    char cvarname[1024];
;2936:    char itemname[1024];
;2937:    
;2938:	//Construct a replace cvar:
;2939:	Com_sprintf(cvarname, sizeof(cvarname), "replacemodel_%s", name);
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2550
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2941
;2940:    //Look an alternative model:
;2941:    trap_Cvar_VariableStringBuffer(cvarname,itemname,sizeof(itemname));
ADDRLP4 1024
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2942
;2942:    if(itemname[0]==0) //If nothing found use original
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2551
line 2943
;2943:        Com_sprintf(itemname, sizeof(itemname), "%s", name);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $461
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $2552
JUMPV
LABELV $2551
line 2945
;2944:    else
;2945:        CG_Printf ("%s replaced by %s\n", name, itemname);
ADDRGP4 $2553
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $2552
line 2947
;2946:	
;2947:	return trap_R_RegisterModel( itemname );
ADDRLP4 0
ARGP4
ADDRLP4 2048
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
RETI4
LABELV $2549
endproc trap_R_RegisterModel_MiTech 2052 16
export trap_S_RegisterSound_MiTech
proc trap_S_RegisterSound_MiTech 2052 16
line 2950
;2948:}
;2949:
;2950:sfxHandle_t	trap_S_RegisterSound_MiTech( const char *sample, qboolean compressed ) {
line 2955
;2951:    char cvarname[1024];
;2952:    char itemname[1024];
;2953:    
;2954:	//Construct a replace cvar:
;2955:	Com_sprintf(cvarname, sizeof(cvarname), "replacesound_%s", sample);
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2555
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2957
;2956:    //Look an alternative model:
;2957:    trap_Cvar_VariableStringBuffer(cvarname,itemname,sizeof(itemname));
ADDRLP4 1024
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2958
;2958:    if(itemname[0]==0) //If nothing found use original
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2556
line 2959
;2959:        Com_sprintf(itemname, sizeof(itemname), "%s", sample);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $461
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $2557
JUMPV
LABELV $2556
line 2961
;2960:    else
;2961:        CG_Printf ("%s replaced by %s\n", sample, itemname);
ADDRGP4 $2553
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $2557
line 2963
;2962:	
;2963:	return trap_S_RegisterSound( itemname, compressed );
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 2048
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
RETI4
LABELV $2554
endproc trap_S_RegisterSound_MiTech 2052 16
bss
export cg_pmove_msec
align 4
LABELV cg_pmove_msec
skip 272
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export realVidHeight
align 4
LABELV realVidHeight
skip 4
export realVidWidth
align 4
LABELV realVidWidth
skip 4
export cgDC
align 4
LABELV cgDC
skip 73772
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Free
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
export wideAdjustX
align 4
LABELV wideAdjustX
skip 4
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
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
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
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
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
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_Cvar_ClampInt
import CG_PredictWeaponEffects
export cg_teamChatBeep
align 4
LABELV cg_teamChatBeep
skip 272
export cg_chatBeep
align 4
LABELV cg_chatBeep
skip 272
export cg_weaponOrder
align 4
LABELV cg_weaponOrder
skip 272
export cg_weaponBarStyle
align 4
LABELV cg_weaponBarStyle
skip 272
export cg_crosshairColorBlue
align 4
LABELV cg_crosshairColorBlue
skip 272
export cg_crosshairColorGreen
align 4
LABELV cg_crosshairColorGreen
skip 272
export cg_crosshairColorRed
align 4
LABELV cg_crosshairColorRed
skip 272
export cg_ch13size
align 4
LABELV cg_ch13size
skip 272
export cg_ch13
align 4
LABELV cg_ch13
skip 272
export cg_ch12size
align 4
LABELV cg_ch12size
skip 272
export cg_ch12
align 4
LABELV cg_ch12
skip 272
export cg_ch11size
align 4
LABELV cg_ch11size
skip 272
export cg_ch11
align 4
LABELV cg_ch11
skip 272
export cg_ch10size
align 4
LABELV cg_ch10size
skip 272
export cg_ch10
align 4
LABELV cg_ch10
skip 272
export cg_ch9slze
align 4
LABELV cg_ch9slze
skip 272
export cg_ch9size
align 4
LABELV cg_ch9size
skip 272
export cg_ch9
align 4
LABELV cg_ch9
skip 272
export cg_ch8size
align 4
LABELV cg_ch8size
skip 272
export cg_ch8
align 4
LABELV cg_ch8
skip 272
export cg_ch7size
align 4
LABELV cg_ch7size
skip 272
export cg_ch7
align 4
LABELV cg_ch7
skip 272
export cg_ch6size
align 4
LABELV cg_ch6size
skip 272
export cg_ch6
align 4
LABELV cg_ch6
skip 272
export cg_ch5size
align 4
LABELV cg_ch5size
skip 272
export cg_ch5
align 4
LABELV cg_ch5
skip 272
export cg_ch4size
align 4
LABELV cg_ch4size
skip 272
export cg_ch4
align 4
LABELV cg_ch4
skip 272
export cg_ch3size
align 4
LABELV cg_ch3size
skip 272
export cg_ch3
align 4
LABELV cg_ch3
skip 272
export cg_ch2size
align 4
LABELV cg_ch2size
skip 272
export cg_ch2
align 4
LABELV cg_ch2
skip 272
export cg_ch1size
align 4
LABELV cg_ch1size
skip 272
export cg_ch1
align 4
LABELV cg_ch1
skip 272
export cg_differentCrosshairs
align 4
LABELV cg_differentCrosshairs
skip 272
export cg_crosshairPulse
align 4
LABELV cg_crosshairPulse
skip 272
export cg_atmosphericLevel
align 4
LABELV cg_atmosphericLevel
skip 272
export cg_fragmsgsize
align 4
LABELV cg_fragmsgsize
skip 272
export cg_autovertex
align 4
LABELV cg_autovertex
skip 272
export cg_vote_custom_commands
align 4
LABELV cg_vote_custom_commands
skip 272
export cg_cyclegrapple
align 4
LABELV cg_cyclegrapple
skip 272
export cg_voteflags
align 4
LABELV cg_voteflags
skip 272
export cg_voip_teamonly
align 4
LABELV cg_voip_teamonly
skip 272
export cg_hitsound
align 4
LABELV cg_hitsound
skip 272
export cg_alwaysWeaponBar
align 4
LABELV cg_alwaysWeaponBar
skip 272
export cl_timeNudge
align 4
LABELV cl_timeNudge
skip 272
export cg_optimizePrediction
align 4
LABELV cg_optimizePrediction
skip 272
export cg_projectileNudge
align 4
LABELV cg_projectileNudge
skip 272
export sv_fps
align 4
LABELV sv_fps
skip 272
export cg_cmdTimeNudge
align 4
LABELV cg_cmdTimeNudge
skip 272
export cg_delag
align 4
LABELV cg_delag
skip 272
export cg_enableBreath
align 4
LABELV cg_enableBreath
skip 272
export cg_enableDust
align 4
LABELV cg_enableDust
skip 272
export cg_obeliskRespawnDelay
align 4
LABELV cg_obeliskRespawnDelay
skip 272
export cg_recordSPDemoName
align 4
LABELV cg_recordSPDemoName
skip 272
export cg_recordSPDemo
align 4
LABELV cg_recordSPDemo
skip 272
export cg_singlePlayerActive
align 4
LABELV cg_singlePlayerActive
skip 272
export cg_singlePlayer
align 4
LABELV cg_singlePlayer
skip 272
export cg_currentSelectedPlayerName
align 4
LABELV cg_currentSelectedPlayerName
skip 272
export cg_currentSelectedPlayer
align 4
LABELV cg_currentSelectedPlayer
skip 272
export cg_blueTeamName
align 4
LABELV cg_blueTeamName
skip 272
export cg_redTeamName
align 4
LABELV cg_redTeamName
skip 272
export cg_music
align 4
LABELV cg_music
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_cameraEyes_Up
align 4
LABELV cg_cameraEyes_Up
skip 272
export cg_cameraEyes_Fwd
align 4
LABELV cg_cameraEyes_Fwd
skip 272
export cg_cameraEyes
align 4
LABELV cg_cameraEyes
skip 272
export cg_cameramode
align 4
LABELV cg_cameramode
skip 272
export cg_leiBrassNoise
align 4
LABELV cg_leiBrassNoise
skip 272
export cg_leiGoreNoise
align 4
LABELV cg_leiGoreNoise
skip 272
export cg_leiEnhancement
align 4
LABELV cg_leiEnhancement
skip 272
export cg_lodScale
align 4
LABELV cg_lodScale
skip 272
export cg_letterBoxSize
align 4
LABELV cg_letterBoxSize
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export pmove_float
align 4
LABELV pmove_float
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export cg_commonConsole
align 4
LABELV cg_commonConsole
skip 272
export cg_teamChatLines
align 4
LABELV cg_teamChatLines
skip 272
export cg_chatLines
align 4
LABELV cg_chatLines
skip 272
export cg_commonConsoleLines
align 4
LABELV cg_commonConsoleLines
skip 272
export cg_consoleLines
align 4
LABELV cg_consoleLines
skip 272
export cg_teamChatSizeY
align 4
LABELV cg_teamChatSizeY
skip 272
export cg_teamChatSizeX
align 4
LABELV cg_teamChatSizeX
skip 272
export cg_chatSizeY
align 4
LABELV cg_chatSizeY
skip 272
export cg_chatSizeX
align 4
LABELV cg_chatSizeX
skip 272
export cg_consoleSizeY
align 4
LABELV cg_consoleSizeY
skip 272
export cg_consoleSizeX
align 4
LABELV cg_consoleSizeX
skip 272
export cg_fontShadow
align 4
LABELV cg_fontShadow
skip 272
export cg_fontScale
align 4
LABELV cg_fontScale
skip 272
export cg_consoleTime
align 4
LABELV cg_consoleTime
skip 272
export cg_chatTime
align 4
LABELV cg_chatTime
skip 272
export cg_newConsole
align 4
LABELV cg_newConsole
skip 272
export cg_newFont
align 4
LABELV cg_newFont
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_noVoiceText
align 4
LABELV cg_noVoiceText
skip 272
export cg_noVoiceChats
align 4
LABELV cg_noVoiceChats
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatScaleY
align 4
LABELV cg_teamChatScaleY
skip 272
export cg_teamChatScaleX
align 4
LABELV cg_teamChatScaleX
skip 272
export cg_chatY
align 4
LABELV cg_chatY
skip 272
export cg_teamChatY
align 4
LABELV cg_teamChatY
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_synchronousClients
align 4
LABELV cg_synchronousClients
skip 272
export cg_drawSpeed
align 4
LABELV cg_drawSpeed
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_thirdPersonOffset
align 4
LABELV cg_thirdPersonOffset
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_bigheadMode
align 4
LABELV cg_bigheadMode
skip 272
export cg_disableLevelStartFade
align 4
LABELV cg_disableLevelStartFade
skip 272
export cg_paintballMode
align 4
LABELV cg_paintballMode
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairScale
align 4
LABELV cg_crosshairScale
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_drawSyncMessage
align 4
LABELV cg_drawSyncMessage
skip 272
export cg_drawsubtitles
align 4
LABELV cg_drawsubtitles
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
export cg_gibtime
align 4
LABELV cg_gibtime
skip 272
export cg_itemstyle
align 4
LABELV cg_itemstyle
skip 272
export cg_oldscoreboard
align 4
LABELV cg_oldscoreboard
skip 272
export team_legsskin
align 4
LABELV team_legsskin
skip 272
export legsskin
align 4
LABELV legsskin
skip 272
export ui_backcolors
align 4
LABELV ui_backcolors
skip 272
export cl_screenoffset
align 4
LABELV cl_screenoffset
skip 272
export cg_cameraeyes
align 4
LABELV cg_cameraeyes
skip 272
export cg_leiChibi
align 4
LABELV cg_leiChibi
skip 272
import cg_plightradius
export cg_plightblue
align 4
LABELV cg_plightblue
skip 272
export cg_plightgreen
align 4
LABELV cg_plightgreen
skip 272
export cg_plightred
align 4
LABELV cg_plightred
skip 272
export cg_tolightblue
align 4
LABELV cg_tolightblue
skip 272
export cg_tolightgreen
align 4
LABELV cg_tolightgreen
skip 272
export cg_tolightred
align 4
LABELV cg_tolightred
skip 272
import cg_hetex
import cg_totex
import cg_ptex
export cg_helightblue
align 4
LABELV cg_helightblue
skip 272
export cg_helightgreen
align 4
LABELV cg_helightgreen
skip 272
export cg_helightred
align 4
LABELV cg_helightred
skip 272
export con_notifytime
align 4
LABELV con_notifytime
skip 272
export cl_language
align 4
LABELV cl_language
skip 272
export cg_toolguninfo
align 4
LABELV cg_toolguninfo
skip 272
export cg_postprocess
align 4
LABELV cg_postprocess
skip 272
export cg_hide255
align 4
LABELV cg_hide255
skip 272
export sb_texturename
align 4
LABELV sb_texturename
skip 272
export sb_texture_view
align 4
LABELV sb_texture_view
skip 272
export sb_classnum_view
align 4
LABELV sb_classnum_view
skip 272
export toolgun_modelst
align 4
LABELV toolgun_modelst
skip 272
export toolgun_toolmode4
align 4
LABELV toolgun_toolmode4
skip 272
export toolgun_toolmode3
align 4
LABELV toolgun_toolmode3
skip 272
export toolgun_toolmode2
align 4
LABELV toolgun_toolmode2
skip 272
export toolgun_toolmode1
align 4
LABELV toolgun_toolmode1
skip 272
export toolgun_tooltip4
align 4
LABELV toolgun_tooltip4
skip 272
export toolgun_tooltip3
align 4
LABELV toolgun_tooltip3
skip 272
export toolgun_tooltip2
align 4
LABELV toolgun_tooltip2
skip 272
export toolgun_tooltip1
align 4
LABELV toolgun_tooltip1
skip 272
export toolgun_tooltext
align 4
LABELV toolgun_tooltext
skip 272
export toolgun_toolcmd4
align 4
LABELV toolgun_toolcmd4
skip 272
export toolgun_toolcmd3
align 4
LABELV toolgun_toolcmd3
skip 272
export toolgun_toolcmd2
align 4
LABELV toolgun_toolcmd2
skip 272
export toolgun_toolcmd1
align 4
LABELV toolgun_toolcmd1
skip 272
export toolgun_tool
align 4
LABELV toolgun_tool
skip 272
export toolgun_mod19
align 4
LABELV toolgun_mod19
skip 272
export toolgun_mod18
align 4
LABELV toolgun_mod18
skip 272
export toolgun_mod17
align 4
LABELV toolgun_mod17
skip 272
export toolgun_mod16
align 4
LABELV toolgun_mod16
skip 272
export toolgun_mod15
align 4
LABELV toolgun_mod15
skip 272
export toolgun_mod14
align 4
LABELV toolgun_mod14
skip 272
export toolgun_mod13
align 4
LABELV toolgun_mod13
skip 272
export toolgun_mod12
align 4
LABELV toolgun_mod12
skip 272
export toolgun_mod11
align 4
LABELV toolgun_mod11
skip 272
export toolgun_mod10
align 4
LABELV toolgun_mod10
skip 272
export toolgun_mod9
align 4
LABELV toolgun_mod9
skip 272
export toolgun_mod8
align 4
LABELV toolgun_mod8
skip 272
export toolgun_mod7
align 4
LABELV toolgun_mod7
skip 272
export toolgun_mod6
align 4
LABELV toolgun_mod6
skip 272
export toolgun_mod5
align 4
LABELV toolgun_mod5
skip 272
export toolgun_mod4
align 4
LABELV toolgun_mod4
skip 272
export toolgun_mod3
align 4
LABELV toolgun_mod3
skip 272
export toolgun_mod2
align 4
LABELV toolgun_mod2
skip 272
export toolgun_mod1
align 4
LABELV toolgun_mod1
skip 272
export cg_weaponBarActiveWidth
align 4
LABELV cg_weaponBarActiveWidth
skip 272
export cg_weaponselecttime
align 4
LABELV cg_weaponselecttime
skip 272
export cg_itemscaletime
align 4
LABELV cg_itemscaletime
skip 272
export cg_zoomtime
align 4
LABELV cg_zoomtime
skip 272
export cg_gibmodifier
align 4
LABELV cg_gibmodifier
skip 272
export cg_gibvelocity
align 4
LABELV cg_gibvelocity
skip 272
export cg_gibjump
align 4
LABELV cg_gibjump
skip 272
export cl_giantcharheight
align 4
LABELV cl_giantcharheight
skip 272
export cl_giantcharwidth
align 4
LABELV cl_giantcharwidth
skip 272
export cl_bigcharheight
align 4
LABELV cl_bigcharheight
skip 272
export cl_bigcharwidth
align 4
LABELV cl_bigcharwidth
skip 272
export cl_smallcharheight
align 4
LABELV cl_smallcharheight
skip 272
export cl_smallcharwidth
align 4
LABELV cl_smallcharwidth
skip 272
export cl_propgapwidth
align 4
LABELV cl_propgapwidth
skip 272
export cl_propspacewidth
align 4
LABELV cl_propspacewidth
skip 272
export cl_propheight
align 4
LABELV cl_propheight
skip 272
export cl_propsmallsizescale
align 4
LABELV cl_propsmallsizescale
skip 272
export g_gametype
align 4
LABELV g_gametype
skip 272
export mod_skyColorA
align 4
LABELV mod_skyColorA
skip 4
export mod_skyColorB
align 4
LABELV mod_skyColorB
skip 4
export mod_skyColorG
align 4
LABELV mod_skyColorG
skip 4
export mod_skyColorR
align 4
LABELV mod_skyColorR
skip 4
export mod_skyShader
align 4
LABELV mod_skyShader
skip 4
export mod_fogColorA
align 4
LABELV mod_fogColorA
skip 4
export mod_fogColorB
align 4
LABELV mod_fogColorB
skip 4
export mod_fogColorG
align 4
LABELV mod_fogColorG
skip 4
export mod_fogColorR
align 4
LABELV mod_fogColorR
skip 4
export mod_fogInterval
align 4
LABELV mod_fogInterval
skip 4
export mod_fogDistance
align 4
LABELV mod_fogDistance
skip 4
export mod_fogShader
align 4
LABELV mod_fogShader
skip 4
export mod_fogModel
align 4
LABELV mod_fogModel
skip 4
export mod_zround
align 4
LABELV mod_zround
skip 4
export mod_gravity
align 4
LABELV mod_gravity
skip 4
export mod_roundmode
align 4
LABELV mod_roundmode
skip 4
export mod_overlay
align 4
LABELV mod_overlay
skip 4
export mod_slickmove
align 4
LABELV mod_slickmove
skip 4
export mod_accelerate
align 4
LABELV mod_accelerate
skip 4
export mod_invulinf
align 4
LABELV mod_invulinf
skip 4
export mod_kamikazeinf
align 4
LABELV mod_kamikazeinf
skip 4
export mod_portalinf
align 4
LABELV mod_portalinf
skip 4
export mod_teleporterinf
align 4
LABELV mod_teleporterinf
skip 4
export mod_medkitinf
align 4
LABELV mod_medkitinf
skip 4
export mod_medkitlimit
align 4
LABELV mod_medkitlimit
skip 4
export mod_teamblue_firespeed
align 4
LABELV mod_teamblue_firespeed
skip 4
export mod_teamred_firespeed
align 4
LABELV mod_teamred_firespeed
skip 4
export mod_invulmove
align 4
LABELV mod_invulmove
skip 4
export mod_ammolimit
align 4
LABELV mod_ammolimit
skip 4
export mod_noplayerclip
align 4
LABELV mod_noplayerclip
skip 4
export mod_doublerfirespeed
align 4
LABELV mod_doublerfirespeed
skip 4
export mod_guardfirespeed
align 4
LABELV mod_guardfirespeed
skip 4
export mod_scoutfirespeed
align 4
LABELV mod_scoutfirespeed
skip 4
export mod_ammoregenfirespeed
align 4
LABELV mod_ammoregenfirespeed
skip 4
export mod_hastefirespeed
align 4
LABELV mod_hastefirespeed
skip 4
export mod_amdelay
align 4
LABELV mod_amdelay
skip 4
export mod_ftdelay
align 4
LABELV mod_ftdelay
skip 4
export mod_cgdelay
align 4
LABELV mod_cgdelay
skip 4
export mod_pldelay
align 4
LABELV mod_pldelay
skip 4
export mod_ngdelay
align 4
LABELV mod_ngdelay
skip 4
export mod_bfgdelay
align 4
LABELV mod_bfgdelay
skip 4
export mod_rgdelay
align 4
LABELV mod_rgdelay
skip 4
export mod_pgdelay
align 4
LABELV mod_pgdelay
skip 4
export mod_lgdelay
align 4
LABELV mod_lgdelay
skip 4
export mod_rldelay
align 4
LABELV mod_rldelay
skip 4
export mod_gldelay
align 4
LABELV mod_gldelay
skip 4
export mod_sgdelay
align 4
LABELV mod_sgdelay
skip 4
export mod_mgdelay
align 4
LABELV mod_mgdelay
skip 4
export mod_gdelay
align 4
LABELV mod_gdelay
skip 4
export mod_jumpheight
align 4
LABELV mod_jumpheight
skip 4
export mod_sgspread
align 4
LABELV mod_sgspread
skip 4
export mod_sgcount
align 4
LABELV mod_sgcount
skip 4
export mod_lgrange
align 4
LABELV mod_lgrange
skip 4
export mod_cgspread
align 4
LABELV mod_cgspread
skip 4
export mod_mgspread
align 4
LABELV mod_mgspread
skip 4
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 24576
export cg_weapons
align 4
LABELV cg_weapons
skip 2720
export cg_entities
align 4
LABELV cg_entities
skip 3801088
export cg
align 4
LABELV cg
skip 1987840
export cgs
align 4
LABELV cgs
skip 958940
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
LABELV $2555
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2553
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2550
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2548
byte 1 118
byte 1 105
byte 1 100
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
LABELV $2538
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2530
byte 1 114
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2525
byte 1 114
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2520
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $2515
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2512
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2498
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2495
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $2491
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2487
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 132
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $2483
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $2479
byte 1 208
byte 1 183
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $2475
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2469
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $2465
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2431
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
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2428
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
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2425
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
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2422
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2419
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2416
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 95
byte 1 114
byte 1 117
byte 1 0
align 1
LABELV $2413
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2407
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2404
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2401
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 98
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2398
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2395
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2392
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 117
byte 1 112
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2389
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 100
byte 1 119
byte 1 110
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2386
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2383
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2379
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
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $2375
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
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $2371
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
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $2367
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
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $2363
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
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $2359
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
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2356
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $2353
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $2264
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
byte 1 0
align 1
LABELV $2260
byte 1 37
byte 1 52
byte 1 105
byte 1 0
align 1
LABELV $2256
byte 1 32
byte 1 0
align 1
LABELV $2253
byte 1 83
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
LABELV $2250
byte 1 37
byte 1 105
byte 1 47
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2244
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $2232
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2116
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2114
byte 1 85
byte 1 73
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2111
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2097
byte 1 94
byte 1 49
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 117
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $2094
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2078
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $2072
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $2058
byte 1 117
byte 1 105
byte 1 47
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2045
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2037
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $2029
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $2021
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $2013
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2005
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $1993
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1985
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 66
byte 1 117
byte 1 122
byte 1 122
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1977
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1969
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1961
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1953
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1943
byte 1 98
byte 1 105
byte 1 103
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1933
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1923
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1919
byte 1 125
byte 1 0
align 1
LABELV $1910
byte 1 123
byte 1 0
align 1
LABELV $1903
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1900
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1894
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1887
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1862
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1848
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
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1847
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
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1846
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
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1845
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
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1844
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
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1843
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
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1842
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1838
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1834
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1831
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1828
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1825
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $1822
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1819
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 101
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1816
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1813
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1810
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1807
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1804
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1801
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1798
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1795
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1778
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1769
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1766
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1763
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1760
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1757
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1754
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $1751
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1748
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1745
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1742
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1739
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1729
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 52
byte 1 0
align 1
LABELV $1726
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 51
byte 1 0
align 1
LABELV $1723
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 50
byte 1 0
align 1
LABELV $1720
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 49
byte 1 0
align 1
LABELV $1717
byte 1 108
byte 1 101
byte 1 105
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 52
byte 1 0
align 1
LABELV $1714
byte 1 108
byte 1 101
byte 1 105
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 51
byte 1 0
align 1
LABELV $1711
byte 1 108
byte 1 101
byte 1 105
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 50
byte 1 0
align 1
LABELV $1708
byte 1 108
byte 1 101
byte 1 105
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 49
byte 1 0
align 1
LABELV $1705
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $1702
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $1699
byte 1 108
byte 1 101
byte 1 105
byte 1 102
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1696
byte 1 108
byte 1 101
byte 1 105
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $1693
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 112
byte 1 97
byte 1 114
byte 1 107
byte 1 50
byte 1 0
align 1
LABELV $1690
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 112
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1687
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $1684
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $1681
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $1678
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $1675
byte 1 108
byte 1 101
byte 1 105
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $1672
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1669
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1666
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1663
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1660
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1657
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1654
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1651
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1648
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1645
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1642
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1639
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1636
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1633
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1630
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1627
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1624
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 105
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1621
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 119
byte 1 97
byte 1 118
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1618
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1615
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1612
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1609
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1606
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1603
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1600
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $1595
byte 1 115
byte 1 112
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $1592
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1589
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1586
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1583
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1580
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1577
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 53
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1574
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 52
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1571
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 51
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1568
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 50
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1565
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 49
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1562
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1559
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1556
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1553
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1550
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1547
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 98
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1544
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 98
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1541
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 98
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1538
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 98
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1529
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 95
byte 1 98
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1526
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 51
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1523
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 50
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1520
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 49
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1517
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 56
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1514
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 55
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1511
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 54
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1508
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1505
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1502
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1499
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1496
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 100
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1493
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 56
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1490
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 55
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1487
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 54
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1484
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1481
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1478
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1475
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1472
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 98
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1469
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1466
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1463
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1460
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1457
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1454
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1451
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1448
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1445
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1442
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 98
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1439
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1436
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1433
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1430
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1427
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1424
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 98
byte 1 108
byte 1 117
byte 1 0
align 1
LABELV $1421
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1418
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $1406
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1403
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1400
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1397
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1394
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1386
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1383
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1380
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1377
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1374
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1366
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 51
byte 1 0
align 1
LABELV $1356
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 49
byte 1 0
align 1
LABELV $1346
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 110
byte 1 116
byte 1 114
byte 1 108
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1343
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1340
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1337
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1334
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1331
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1328
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 112
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1325
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 112
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1322
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 51
byte 1 0
align 1
LABELV $1318
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $1314
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $1311
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1307
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $1303
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $1300
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1297
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1294
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1277
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 98
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1274
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 98
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1270
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 98
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1263
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 97
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1260
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 97
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1256
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 97
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1249
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1246
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1243
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1236
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1233
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1230
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1227
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1210
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1207
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $1204
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1201
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1198
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1195
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1192
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1189
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1186
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
LABELV $1183
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1180
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 51
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $1177
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $1174
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 51
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1171
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1162
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $1159
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1156
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1153
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
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1150
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1147
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $1144
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1141
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1138
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $1135
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1132
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $1129
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $1126
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $1123
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $1116
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $1113
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1110
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1105
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1102
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1099
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1096
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1093
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1090
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1087
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 57
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1083
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 56
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1079
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 55
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1075
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 54
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1071
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 53
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1067
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 52
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1063
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1059
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1055
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1046
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 209
byte 1 129
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $1042
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $1034
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1033
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1032
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1031
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1030
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1029
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1028
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1027
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1026
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1025
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1024
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $1013
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1012
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1011
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1010
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1009
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1008
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1007
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1006
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1005
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1004
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1003
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1002
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1001
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1000
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $999
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $998
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $997
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $996
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $995
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $994
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $993
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $992
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $991
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $990
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $989
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $986
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $983
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $980
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $977
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $974
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 99
byte 1 116
byte 1 118
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $971
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $968
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $965
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $962
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 121
byte 1 111
byte 1 117
byte 1 115
byte 1 117
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $959
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $956
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $953
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $950
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $947
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 95
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $944
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 104
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $941
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 47
byte 1 119
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $938
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 47
byte 1 119
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $935
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 47
byte 1 119
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $932
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $929
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $926
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $923
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 47
byte 1 119
byte 1 115
byte 1 116
byte 1 98
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $920
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $917
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $914
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 102
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $911
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $908
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $905
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $902
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $899
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $896
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $878
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 47
byte 1 101
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 101
byte 1 37
byte 1 105
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $870
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $866
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $862
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $858
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $854
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $850
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $847
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $842
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $839
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $836
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $833
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $830
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $827
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $824
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $821
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $818
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $815
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $812
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $809
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $806
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $803
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $800
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $797
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 105
byte 1 108
byte 1 105
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $794
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $791
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $788
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $785
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 108
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $782
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 104
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $779
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $772
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $769
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $766
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $763
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $760
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $757
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $754
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $751
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $748
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $745
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $742
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $739
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $736
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $733
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $730
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $727
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 95
byte 1 48
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $724
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 95
byte 1 48
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $721
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 95
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $718
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $715
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $712
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $709
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $706
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $703
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $700
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $697
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $694
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $691
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 108
byte 1 101
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $688
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $685
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $682
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $679
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 112
byte 1 108
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $676
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $673
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $670
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $667
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $664
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $656
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 121
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $653
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $641
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $638
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $628
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $625
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $622
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $619
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $609
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $606
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $603
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $600
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $597
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $592
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $589
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $586
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $583
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $580
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $577
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $574
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $564
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $561
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $558
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $555
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $552
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $549
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $546
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 51
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $543
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 50
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $540
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $537
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $534
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 53
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $531
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $527
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $521
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $461
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $433
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $432
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $431
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $430
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $428
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
LABELV $422
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $421
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $420
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $419
byte 1 47
byte 1 49
byte 1 47
byte 1 50
byte 1 47
byte 1 52
byte 1 47
byte 1 51
byte 1 47
byte 1 54
byte 1 47
byte 1 55
byte 1 47
byte 1 56
byte 1 47
byte 1 57
byte 1 47
byte 1 53
byte 1 47
byte 1 0
align 1
LABELV $418
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $417
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 66
byte 1 97
byte 1 114
byte 1 83
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $416
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 48
byte 1 46
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $414
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $413
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $412
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $411
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 51
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $410
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $409
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 50
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $408
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $407
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 49
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $406
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $405
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 48
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $404
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $403
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 57
byte 1 115
byte 1 108
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $402
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 57
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $401
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 57
byte 1 0
align 1
LABELV $400
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 56
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $399
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 56
byte 1 0
align 1
LABELV $398
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 55
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $397
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 55
byte 1 0
align 1
LABELV $396
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 54
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $395
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 54
byte 1 0
align 1
LABELV $394
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 53
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $393
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 53
byte 1 0
align 1
LABELV $392
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 52
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $391
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 52
byte 1 0
align 1
LABELV $390
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 51
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $389
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 51
byte 1 0
align 1
LABELV $388
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 50
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $387
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 50
byte 1 0
align 1
LABELV $386
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $385
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 49
byte 1 0
align 1
LABELV $384
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $383
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 80
byte 1 117
byte 1 108
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $382
byte 1 49
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $381
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 109
byte 1 115
byte 1 103
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $380
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $379
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 111
byte 1 120
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $378
byte 1 48
byte 1 46
byte 1 57
byte 1 0
align 1
LABELV $377
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $376
byte 1 99
byte 1 108
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $375
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $374
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $373
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $372
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $371
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $370
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $369
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 95
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $368
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 95
byte 1 70
byte 1 119
byte 1 100
byte 1 0
align 1
LABELV $367
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $366
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $365
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 66
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 78
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $364
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 71
byte 1 111
byte 1 114
byte 1 101
byte 1 78
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $363
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 69
byte 1 110
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $362
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $361
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $360
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $359
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $358
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $357
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $356
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $355
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $354
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $353
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $352
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $351
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $350
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $349
byte 1 49
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $348
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $347
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $346
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $345
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 111
byte 1 110
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $344
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $343
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 111
byte 1 110
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $342
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $341
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $340
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $339
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $338
byte 1 57
byte 1 0
align 1
LABELV $337
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $336
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $335
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $334
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $333
byte 1 45
byte 1 50
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $332
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 89
byte 1 0
align 1
LABELV $331
byte 1 49
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $330
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 89
byte 1 0
align 1
LABELV $329
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $328
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $327
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $326
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $325
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $324
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $323
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $322
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $321
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $320
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $319
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $318
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $317
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $316
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $315
byte 1 103
byte 1 95
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $314
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $313
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $312
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $311
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $310
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $309
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $308
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $307
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $306
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
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
LABELV $305
byte 1 69
byte 1 109
byte 1 97
byte 1 99
byte 1 115
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $304
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $303
byte 1 86
byte 1 105
byte 1 109
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $302
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $301
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $300
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $299
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $298
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $297
byte 1 42
byte 1 0
align 1
LABELV $296
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $295
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 105
byte 1 112
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $294
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $293
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 66
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $292
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $291
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $290
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $289
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $288
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $287
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $286
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $285
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $284
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $283
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $282
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $281
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $280
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $279
byte 1 48
byte 1 46
byte 1 55
byte 1 0
align 1
LABELV $278
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $277
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $276
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 116
byte 1 109
byte 1 111
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $275
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $274
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $273
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 79
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $272
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $271
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $270
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $269
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $268
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $267
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $266
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $265
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $263
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $261
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $260
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $259
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $258
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $257
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $256
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $255
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $253
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $252
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $251
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $250
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $249
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $248
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $247
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $246
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 115
byte 1 117
byte 1 98
byte 1 116
byte 1 105
byte 1 116
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $245
byte 1 54
byte 1 0
align 1
LABELV $244
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $243
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $242
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $241
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $240
byte 1 53
byte 1 0
align 1
LABELV $239
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $238
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $237
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $236
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $235
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $234
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $232
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $231
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $230
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $229
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $227
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $226
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $225
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $224
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $223
byte 1 52
byte 1 0
align 1
LABELV $222
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $221
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $220
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $219
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $218
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $216
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $215
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $214
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $213
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $212
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $210
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 49
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $208
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $207
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $206
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $204
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $202
byte 1 51
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $201
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $200
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $197
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $196
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $195
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $194
byte 1 50
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $192
byte 1 49
byte 1 48
byte 1 55
byte 1 0
align 1
LABELV $191
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $190
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $189
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $188
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $187
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $186
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $185
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $184
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $183
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $182
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $181
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $179
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 67
byte 1 104
byte 1 105
byte 1 98
byte 1 105
byte 1 0
align 1
LABELV $178
byte 1 49
byte 1 0
align 1
LABELV $177
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 108
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 103
byte 1 117
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 50
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $171
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $169
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 117
byte 1 109
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $168
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $167
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $166
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $165
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $164
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 52
byte 1 0
align 1
LABELV $162
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 51
byte 1 0
align 1
LABELV $161
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 50
byte 1 0
align 1
LABELV $160
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 49
byte 1 0
align 1
LABELV $159
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $157
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $156
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $155
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $153
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 57
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 56
byte 1 0
align 1
LABELV $150
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 55
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $146
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $144
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $143
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $142
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 57
byte 1 0
align 1
LABELV $141
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 56
byte 1 0
align 1
LABELV $140
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 55
byte 1 0
align 1
LABELV $139
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 54
byte 1 0
align 1
LABELV $138
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $137
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $136
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $135
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $134
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 66
byte 1 97
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 87
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $132
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $129
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $126
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $125
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $121
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $118
byte 1 51
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 103
byte 1 97
byte 1 112
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 56
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $114
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $113
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $112
byte 1 48
byte 1 46
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $111
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $110
byte 1 48
byte 1 0
align 1
LABELV $109
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
LABELV $106
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
