data
align 4
LABELV saveparam_list
address $93
address $94
address $95
address $96
address $97
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
address $112
address $113
address $114
address $115
address $116
address $117
address $118
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
address $139
address $140
address $141
address $142
address $143
address $110
address $144
address $112
address $145
address $111
address $146
address $147
address $113
address $148
address $149
address $150
address $151
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
address $163
address $164
address $165
address $166
address $167
address $168
address $169
address $170
address $171
address $172
address $173
address $174
address $175
address $176
address $177
address $178
address $179
address $180
address $181
address $182
address $183
address $184
address $185
address $186
address $187
address $188
address $189
address $190
address $191
address $192
address $193
address $194
address $195
address $196
address $197
address $198
address $199
address $200
address $201
address $202
address $203
address $204
address $205
address $206
address $207
address $208
address $209
address $210
address $211
address $212
address $213
address $214
address $215
address $216
address $217
address $218
address $219
address $220
address $221
address $222
address $223
address $224
address $225
address $226
address $227
address $228
address $229
address $230
address $231
address $232
address $233
address $234
address $235
address $236
address $237
address $238
address $239
address $240
address $241
address $242
address $243
address $244
address $245
address $246
address $247
address $248
address $249
address $250
address $251
address $252
address $253
address $254
address $255
address $256
address $257
address $258
address $259
address $260
address $261
address $262
address $263
address $264
address $265
address $266
address $267
address $268
address $269
address $270
address $271
address $272
address $273
address $274
address $275
address $276
address $277
address $278
address $279
address $280
address $281
address $282
address $283
address $284
address $285
address $286
address $287
address $288
address $289
address $290
address $291
address $292
address $293
address $294
address $295
address $296
address $297
address $298
address $299
address $300
address $301
address $302
address $303
address $304
address $305
address $306
address $307
address $308
address $309
address $310
address $311
address $312
address $313
address $314
address $315
address $316
address $317
address $318
address $319
address $320
address $321
address $322
address $323
address $324
address $325
address $326
address $327
address $328
address $329
address $330
address $331
address $332
address $333
address $334
address $335
address $336
address $337
address $338
address $339
address $340
address $341
address $342
address $343
address $344
address $345
address $346
address $347
address $348
address $349
address $350
address $351
address $352
address $353
address $354
address $355
address $356
address $357
address $358
address $359
address $360
address $361
address $362
address $363
address $364
address $365
address $366
address $367
address $368
address $369
address $370
address $371
address $372
address $373
address $374
address $375
address $376
address $377
address $378
address $379
address $380
address $381
address $382
address $383
address $384
address $385
address $386
address $387
address $388
address $389
address $390
address $391
address $392
address $393
address $394
address $395
address $396
address $397
address $398
address $399
address $400
address $401
address $402
address $403
address $404
address $405
address $406
address $407
address $408
address $409
address $410
address $411
address $412
address $413
address $414
address $415
address $416
address $417
address $418
address $419
address $420
address $421
address $422
address $423
address $424
address $425
address $426
address $427
address $428
address $429
address $430
address $431
address $432
address $433
address $434
address $435
address $436
address $437
address $438
address $439
address $440
address $441
address $442
address $443
address $444
address $445
address $446
address $447
address $448
address $449
address $450
address $451
address $452
address $453
address $454
address $455
address $456
address $457
address $458
address $459
address $460
address $461
address $462
address $463
address $464
address $465
address $466
address $467
address $468
address $469
address $470
address $471
address $472
address $473
address $474
address $475
address $476
address $477
address $478
address $479
address $480
address $481
address $482
address $483
address $484
address $485
address $486
address $487
address $488
address $489
address $490
address $491
address $492
address $493
address $494
address $495
address $496
address $497
address $498
address $499
address $500
address $501
address $502
address $503
address $501
address $502
address $503
address $504
address $505
address $506
address $507
byte 4 0
lit
align 4
LABELV botChange_frequency
byte 4 0
byte 4 1
byte 4 2
byte 4 3
byte 4 4
byte 4 0
data
align 4
LABELV addbot_primes
byte 4 7
byte 4 11
byte 4 17
byte 4 23
align 4
LABELV num_addbot_primes
byte 4 4
align 1
LABELV lasterror_text
byte 1 0
skip 119
align 4
LABELV bot_teamname
address $508
address $509
code
proc UIE_IsCaptureLimited 4 0
file "../../../code/q3_ui/ui_startserver_script.c"
line 510
;1:/*
;2:=============================================================================
;3:
;4:START SERVER SCRIPT ENGINE *****
;5:
;6:=============================================================================
;7:*/
;8:
;9:
;10:
;11:#include "ui_local.h"
;12:
;13:#include "ui_startserver.h"
;14:
;15:#define BEGIN_PARAMETER_BLOCK 	"BEGIN_UIE_PARAMETER_BLOCK"
;16:#define END_PARAMETER_BLOCK 	"END_UIE_PARAMETER_BLOCK"
;17:
;18:#define CVAR_BUFFER 	512
;19:
;20:
;21:
;22:// game parameters we need to save in a block
;23:// for later recovery. Strings begining with a
;24:// * are gametype specific
;25:
;26:// uie_dedicated is deliberately missing to allow
;27:// script loading in both Skirmish and Multiplayer
;28:// versions of the browser
;29:
;30:// uie_punkbuster is handled as a special case in the save code
;31:static const char* saveparam_list[] = {
;32:"uie_gametype", "uie_pure", "uie_inactivity", "uie_allowmaxrate",
;33:"uie_maxrate", "uie_allowpass","uie_password", "uie_allowvote",
;34:"uie_allowdownload", "uie_smoothclients", "uie_pmove_fixed",
;35:"uie_pmove_msec", "uie_syncclients", "uie_minPing", "uie_maxPing",
;36:"uie_allowMinPing", "uie_allowMaxPing", "uie_gravity", "uie_jumpheight", "uie_knockback",
;37:"uie_quadfactor", "uie_netport", "uie_svfps", "uie_allowprivateclients",
;38:"uie_privateclients", "uie_privatepassword", "uie_strictAuth",
;39:"uie_lanForceRate", 
;40:"uie_maxEntities",
;41:"uie_singleskill",
;42:"uie_kill",
;43:"uie_damageModifier",
;44:"uie_roundmode",
;45:"uie_elimination",
;46:"uie_obeliskHealth",
;47:"uie_obeliskRegenPeriod",
;48:"uie_obeliskRegenAmount",
;49:"uie_obeliskRespawnDelay",
;50:"uie_cubeTimeout",
;51:"uie_flagrespawn",
;52:"uie_weaponTeamRespawn",
;53:"uie_elimination_ctf_oneway",
;54:"uie_elimination_selfdamage",
;55:"uie_elimination_roundtime",
;56:"uie_elimination_warmup",
;57:"uie_elimination_activewarmup",
;58:"uie_lms_lives",
;59:"uie_lms_mode",
;60:"uie_accelerate",
;61:"uie_spectatorspeed",
;62:"uie_speed",
;63:"uie_gravity",
;64:"uie_gravityModifier",
;65:"uie_knockback",
;66:"uie_noplayerclip",
;67:"uie_jumpheight",
;68:"uie_regenarmor",
;69:"uie_ammolimit",
;70:"uie_quadfactor",
;71:"uie_respawntime",
;72:"uie_forcerespawn",
;73:"uie_vampire",
;74:"uie_vampire_max_health",
;75:"uie_regen",
;76:"uie_maxweaponpickup",
;77:"uie_droppeditemtime",
;78:"uie_autoflagreturn",
;79:"uie_armorprotect",
;80:"uie_respawnwait",
;81:"uie_speedfactor",
;82:"uie_scoutspeedfactor",
;83:"uie_scoutfirespeed",
;84:"uie_scoutdamagefactor",
;85:"uie_scoutgravitymodifier",
;86:"uie_scout_infammo",
;87:"uie_scouthealthmodifier",
;88:"uie_doublerfirespeed",
;89:"uie_doublerdamagefactor",
;90:"uie_doublerspeedfactor",
;91:"uie_doublergravitymodifier",
;92:"uie_doubler_infammo",
;93:"uie_doublerhealthmodifier",
;94:"uie_guardhealthmodifier",
;95:"uie_guardfirespeed",
;96:"uie_guarddamagefactor",
;97:"uie_guardspeedfactor",
;98:"uie_guardgravitymodifier",
;99:"uie_guard_infammo",
;100:"uie_ammoregenfirespeed",
;101:"uie_ammoregen_infammo",
;102:"uie_ammoregendamagefactor",
;103:"uie_ammoregenspeedfactor",
;104:"uie_ammoregengravitymodifier",
;105:"uie_ammoregenhealthmodifier",
;106:"uie_teamred_speed",
;107:"uie_teamred_gravityModifier",
;108:"uie_teamred_firespeed",
;109:"uie_teamred_damage",
;110:"uie_teamred_infammo",
;111:"uie_teamred_respawnwait",
;112:"uie_teamred_pickupitems",
;113:"uie_eliminationredrespawn",
;114:"uie_eliminationred_startHealth",
;115:"uie_eliminationred_startArmor",
;116:"uie_teamblue_speed",
;117:"uie_teamblue_gravityModifier",
;118:"uie_teamblue_firespeed",
;119:"uie_teamblue_damage",
;120:"uie_teamblue_infammo",
;121:"uie_teamblue_respawnwait",
;122:"uie_teamblue_pickupitems",
;123:"uie_eliminationrespawn",
;124:"uie_elimination_startHealth",
;125:"uie_elimination_startArmor",
;126:"uie_eliminationred_grapple",
;127:"uie_eliminationred_gauntlet",
;128:"uie_eliminationred_machinegun",
;129:"uie_eliminationred_shotgun",
;130:"uie_eliminationred_grenade",
;131:"uie_eliminationred_rocket",
;132:"uie_eliminationred_railgun",
;133:"uie_eliminationred_lightning",
;134:"uie_eliminationred_plasmagun",
;135:"uie_eliminationred_bfg",
;136:"uie_eliminationred_chain",
;137:"uie_eliminationred_mine",
;138:"uie_eliminationred_nail",
;139:"uie_eliminationred_flame",
;140:"uie_eliminationred_antimatter",
;141:"uie_elimination_grapple",
;142:"uie_elimination_gauntlet",
;143:"uie_elimination_machinegun",
;144:"uie_elimination_shotgun",
;145:"uie_elimination_grenade",
;146:"uie_elimination_rocket",
;147:"uie_elimination_railgun",
;148:"uie_elimination_lightning",
;149:"uie_elimination_plasmagun",
;150:"uie_elimination_bfg",
;151:"uie_elimination_chain",
;152:"uie_elimination_mine",
;153:"uie_elimination_nail",
;154:"uie_elimination_flame",
;155:"uie_elimination_antimatter",
;156:"uie_eliminationred_quad",
;157:"uie_eliminationred_haste",
;158:"uie_eliminationred_bsuit",
;159:"uie_eliminationred_invis",
;160:"uie_eliminationred_regen",
;161:"uie_eliminationred_flight",
;162:"uie_eliminationred_holdable",
;163:"uie_elimination_quad",
;164:"uie_elimination_haste",
;165:"uie_elimination_bsuit",
;166:"uie_elimination_invis",
;167:"uie_elimination_regen",
;168:"uie_elimination_flight",
;169:"uie_elimination_items",
;170:"uie_elimination_holdable",
;171:"uie_minigame",
;172:"uie_overlay",
;173:"uie_randomItems",
;174:"uie_slickmove",
;175:"uie_spawnprotect",
;176:"uie_elimination_lockspectator",
;177:"uie_awardpushing",
;178:"uie_specChat",
;179:"uie_randomteleport",
;180:"uie_falldamagesmall",
;181:"uie_falldamagebig",
;182:"uie_waterdamage",
;183:"uie_lavadamage",
;184:"uie_slimedamage",
;185:"uie_drowndamage",
;186:"uie_invulinf",
;187:"uie_invulmove",
;188:"uie_invultime",
;189:"uie_kamikazeinf",
;190:"uie_portalinf",
;191:"uie_portaltimeout",
;192:"uie_portalhealth",
;193:"uie_teleporterinf",
;194:"uie_medkitinf",
;195:"uie_medkitlimit",
;196:"uie_medkitmodifier",
;197:"uie_fasthealthregen",
;198:"uie_slowhealthregen",
;199:"uie_hastefirespeed",
;200:"uie_quadtime",
;201:"uie_bsuittime",
;202:"uie_hastetime",
;203:"uie_invistime",
;204:"uie_regentime",
;205:"uie_flighttime",
;206:"uie_armorrespawn",
;207:"uie_healthrespawn",
;208:"uie_ammorespawn",
;209:"uie_holdablerespawn",
;210:"uie_megahealthrespawn",
;211:"uie_poweruprespawn",
;212:"uie_weaponrespawn",
;213:"uie_selectedmod",
;214:
;215:// Крюк
;216:"uie_ghspeed",
;217:"uie_ghtimeout",
;218:// Пила
;219:"uie_gdelay",
;220:"uie_gdamage",
;221:"uie_grange",
;222:"uie_gknockback",
;223:// Автомат
;224:"uie_mgammocount",
;225:"uie_mgweaponcount",
;226:"uie_mgdelay",
;227:"uie_mgdamage",
;228:"uie_mgspread",
;229:"uie_mgexplode",
;230:"uie_mgsdamage",
;231:"uie_mgsradius",
;232:"uie_mgvampire",
;233:"uie_mginf",
;234:"uie_mgknockback",
;235:// Дробовик
;236:"uie_sgammocount",
;237:"uie_sgweaponcount",
;238:"uie_sgdelay",
;239:"uie_sgdamage",
;240:"uie_sgspread",
;241:"uie_sgexplode",
;242:"uie_sgsdamage",
;243:"uie_sgsradius",
;244:"uie_sgcount",
;245:"uie_sgvampire",
;246:"uie_sginf",
;247:"uie_sgknockback",
;248:// Гранаты
;249:"uie_glammocount",
;250:"uie_glweaponcount",
;251:"uie_gldelay",
;252:"uie_glspeed",
;253:"uie_glbounce",
;254:"uie_glgravity",
;255:"uie_gltimeout",
;256:"uie_glsradius",
;257:"uie_glsdamage",
;258:"uie_gldamage",
;259:"uie_glvampire",
;260:"uie_glinf",
;261:"uie_glbouncemodifier",
;262:"uie_glknockback",
;263:"uie_glhoming",
;264:"uie_glguided",
;265:// Ракеты
;266:"uie_rlammocount",
;267:"uie_rlweaponcount",
;268:"uie_rldelay",
;269:"uie_rlspeed",
;270:"uie_rlbounce",
;271:"uie_rlgravity",
;272:"uie_rltimeout",
;273:"uie_rlsradius",
;274:"uie_rlsdamage",
;275:"uie_rldamage",
;276:"uie_rlvampire",
;277:"uie_rlinf",
;278:"uie_rlbouncemodifier",
;279:"uie_rlknockback",
;280:"uie_rlhoming",
;281:"uie_rlguided",
;282:// Молния
;283:"uie_lgammocount",
;284:"uie_lgweaponcount",
;285:"uie_lgrange",
;286:"uie_lgdelay",
;287:"uie_lgdamage",
;288:"uie_lgvampire",
;289:"uie_lgexplode",
;290:"uie_lgsdamage",
;291:"uie_lgsradius",
;292:"uie_lginf",
;293:"uie_lgknockback",
;294:// Рэйлган
;295:"uie_rgammocount",
;296:"uie_rgweaponcount",
;297:"uie_rgdelay",
;298:"uie_rgdamage",
;299:"uie_rgvampire",
;300:"uie_rginf",
;301:"uie_rgknockback",
;302:// Плазмаган
;303:"uie_pgammocount",
;304:"uie_pgweaponcount",
;305:"uie_pgdelay",
;306:"uie_pgspeed",
;307:"uie_pgbounce",
;308:"uie_pggravity",
;309:"uie_pgtimeout",
;310:"uie_pgsradius",
;311:"uie_pgsdamage",
;312:"uie_pgdamage",
;313:"uie_pgvampire",
;314:"uie_pginf",
;315:"uie_pgbouncemodifier",
;316:"uie_pgknockback",
;317:"uie_pghoming",
;318:"uie_pgguided",
;319:// Бфг
;320:"uie_bfgammocount",
;321:"uie_bfgweaponcount",
;322:"uie_bfgdelay",
;323:"uie_bfgspeed",
;324:"uie_bfgbounce",
;325:"uie_bfggravity",
;326:"uie_bfgtimeout",
;327:"uie_bfgsradius",
;328:"uie_bfgsdamage",
;329:"uie_bfgdamage",
;330:"uie_bfgvampire",
;331:"uie_bfginf",
;332:"uie_bfgbouncemodifier",
;333:"uie_bfgknockback",
;334:"uie_bfghoming",
;335:"uie_bfgguided",
;336:// Гвоздомёт
;337:"uie_ngammocount",
;338:"uie_ngweaponcount",
;339:"uie_ngdelay",
;340:"uie_ngspeed",
;341:"uie_ngbounce",
;342:"uie_nggravity",
;343:"uie_ngtimeout",
;344:"uie_ngcount",
;345:"uie_ngspread",
;346:"uie_ngdamage",
;347:"uie_ngrandom",
;348:"uie_ngvampire",
;349:"uie_nginf",
;350:"uie_ngbouncemodifier",
;351:"uie_ngknockback",
;352:"uie_nghoming",
;353:"uie_ngguided",
;354:// Мины
;355:"uie_plammocount",
;356:"uie_plweaponcount",
;357:"uie_pldelay",
;358:"uie_plspeed",
;359:"uie_plgravity",
;360:"uie_pltimeout",
;361:"uie_plsradius",
;362:"uie_plsdamage",
;363:"uie_pldamage",
;364:"uie_plvampire",
;365:"uie_plinf",
;366:"uie_plknockback",
;367:// Пулемёт
;368:"uie_cgammocount",
;369:"uie_cgweaponcount",
;370:"uie_cgdelay",
;371:"uie_cgspread",
;372:"uie_cgdamage",
;373:"uie_cgvampire",
;374:"uie_cginf",
;375:"uie_cgknockback",
;376:// Огнемёт
;377:"uie_ftammocount",
;378:"uie_ftweaponcount",
;379:"uie_ftdelay",
;380:"uie_ftspeed",
;381:"uie_ftbounce",
;382:"uie_ftgravity",
;383:"uie_fttimeout",
;384:"uie_ftsradius",
;385:"uie_ftsdamage",
;386:"uie_ftdamage",
;387:"uie_ftvampire",
;388:"uie_ftinf",
;389:"uie_ftbouncemodifier",
;390:"uie_ftknockback",
;391:"uie_fthoming",
;392:"uie_ftguided",
;393:// Антиматтер
;394:"uie_amweaponcount",
;395:"uie_amdelay",
;396:"uie_amspeed",
;397:"uie_ambounce",
;398:"uie_amgravity",
;399:"uie_amtimeout",
;400:"uie_amsradius",
;401:"uie_amsdamage",
;402:"uie_amdamage",
;403:"uie_amvampire",
;404:"uie_aminf",
;405:"uie_ambouncemodifier",
;406:"uie_amknockback",
;407:"uie_amhoming",
;408:"uie_amguided",
;409:
;410:	// uie_<gametype>_*
;411:	"*fragtype", "*timetype", "*customfraglimits", "*customcapturelimits",
;412:	"*customtimelimits", "*maplist", "*maplistexclude", "*MapRepeat",
;413:	"*MapSource", "*RandomMapCount", "*RandomMapType", "*slottype",
;414:	"*botname", "*botexclude", "*botskill", "*BotSelection", "*BotCount",
;415:	"*BotChange", "*OpenSlotCount", "*BotSkillType", "*BotSkillValue",
;416:	"*BotSkillBias", "*PlayerJoinAs", "*hostname", "*ForceRespawn",
;417:	"*itemGroups", "*itemsHidden", "*Warmup", "*doWarmup", "*weaponrespawn", "*viewdistance",
;418:
;419:	// many of these are specific to a gametype, but since we
;420:	// check for the existance of the Cvar they won't appear in
;421:	// gametypes that don't set them
;422:
;423:	"*AutoJoin", "*TeamBalance", "*TeamSwapped", "*AutoJoin",
;424:	"*TeamBalance", "*TeamSwapped", "*fraglimit", "*capturelimit", "*timelimit", "*friendly",
;425:	0
;426:};
;427:
;428:static const int botChange_frequency[BOTCHANGE_COUNT + 1] = {
;429:	0,	// BOTCHANGE_NEVER
;430:	1,
;431:	2,
;432:	3,
;433:	4,	// BOTCHANGE_MAP4
;434:	0	// size matches botChange_list[]
;435:};
;436:
;437:// internal Q3 exe script buffer is limited to 16K in size
;438:// so there's no benefit in increasing our script buffer
;439:#define SCRIPT_BUFFER (1024 * 128 - 1)
;440:
;441:#define SERVER_ADDBOT "uie_ab"
;442:#define SERVER_KICKBOT "uie_kb"
;443:
;444:
;445:typedef struct serverexec_s {
;446:	char server_script[SCRIPT_BUFFER];
;447:
;448:	int maxBots;
;449:	int usedBots[MAX_BOTS];
;450:	int lastBots[MAX_BOTS];
;451:
;452:	int player_client;
;453:
;454:	int rnd_nummaps;
;455:
;456:	int cycle_count;	// number of maps in the cycle
;457:
;458:	// for MAP_MS_RANDOMLIST: stores listed map order
;459:	// for MAP_MS_RANDOM, MAP_MS_RANDOMEXCLUDE: stores map indices as they're generated
;460:	qboolean random_generate;	// qtrue if map_rnd_index[] is used	
;461:	qboolean random_order;		// qtrue if map_rnd[] is used
;462:	int	random_count;			// number of variables stored in map_rnd[] 
;463:	int map_rnd[MAX_MAPS_LIST];	// order in which maps are written
;464:	int map_rnd_index[MAX_MAPS_LIST];	// indices of map that will be written
;465:
;466:	int botcount_firstmap;	// only used with BOTTYPE_*ARENASCRIPT
;467:	int max_scripted_bots;	// only used with BOTTYPE_*ARENASCRIPT
;468:
;469:   int bots_in_slots[PLAYER_SLOTS]; // the bot indexes for bots found in selection slots
;470:   int num_bots_in_slots;  // number of bots found in selection slots
;471:
;472:	// protects against ordering problems
;473:	qboolean map_generated;
;474:	qboolean bot_generated;
;475:} serverexec_t;
;476:
;477:static serverexec_t s_serverexec;
;478:
;479:
;480:static int addbot_primes[] = { 7, 11, 17, 23 };
;481:static int num_addbot_primes = sizeof (addbot_primes)/sizeof(addbot_primes[0]);
;482:
;483:static char lasterror_text[MAX_STATUSBAR_TEXT] = {'\0'};
;484:
;485:
;486:static char* bot_teamname[] = { "blue", "red" };
;487:
;488:
;489:
;490:
;491:/*
;492:=============================================================================
;493:
;494:WRITE SCRIPT *****
;495:
;496:=============================================================================
;497:*/
;498:
;499:
;500:
;501:
;502:/*
;503:=================
;504:UIE_IsCaptureLimited
;505:
;506:Returns qtrue if the gametype uses capturelimit instead of fraglimit
;507:=================
;508:*/
;509:static qboolean UIE_IsCaptureLimited(int type)
;510:{
line 511
;511:	if (type >= GT_CTF && !(type == GT_LMS))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $511
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $511
line 512
;512:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $510
JUMPV
LABELV $511
line 514
;513:
;514:	return qfalse;
CNSTI4 0
RETI4
LABELV $510
endproc UIE_IsCaptureLimited 4 0
export Clamp_Random
proc Clamp_Random 8 0
line 526
;515:}
;516:
;517:
;518:/*
;519:=================
;520:Clamp_Random
;521:
;522:Returns a random number between 0 and r
;523:=================
;524:*/
;525:int Clamp_Random(int r)
;526:{
line 529
;527:	int index;
;528:
;529:	r += 1;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $514
line 530
;530:	do {
line 531
;531:		index = r * random();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 532
;532:	} while (index == r);
LABELV $515
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $514
line 534
;533:
;534:	return index;
ADDRLP4 0
INDIRI4
RETI4
LABELV $513
endproc Clamp_Random 8 0
proc AddScript 0 12
line 545
;535:}
;536:
;537:
;538:
;539:/*
;540:=================
;541:AddScript
;542:=================
;543:*/
;544:static void AddScript(const char* scriptLine)
;545:{
line 546
;546:	Q_strcat(s_serverexec.server_script, SCRIPT_BUFFER, scriptLine);
ADDRGP4 s_serverexec
ARGP4
CNSTI4 131071
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 547
;547:}
LABELV $517
endproc AddScript 0 12
export StartServer_GetLastScriptError
proc StartServer_GetLastScriptError 0 0
line 557
;548:
;549:
;550:
;551:/*
;552:=================
;553:StartServer_GetLastScriptError
;554:=================
;555:*/
;556:const char* StartServer_GetLastScriptError( void )
;557:{
line 558
;558:	return lasterror_text;
ADDRGP4 lasterror_text
RETP4
LABELV $518
endproc StartServer_GetLastScriptError 0 0
proc StartServer_PrintMessage 4 12
line 569
;559:}
;560:
;561:
;562:
;563:/*
;564:=================
;565:StartServer_PrintMessage
;566:=================
;567:*/
;568:static void StartServer_PrintMessage( const char* error )
;569:{
line 570
;570:	if (!error)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 571
;571:		return;
ADDRGP4 $519
JUMPV
LABELV $520
line 573
;572:
;573:	trap_Print( va(S_COLOR_RED"StartServer: %s", error));
ADDRGP4 $522
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 574
;574:	Q_strncpyz(lasterror_text, error, MAX_STATUSBAR_TEXT);
ADDRGP4 lasterror_text
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 575
;575:}
LABELV $519
endproc StartServer_PrintMessage 4 12
proc StartServer_InitServerExec 36 12
line 586
;576:
;577:
;578:
;579:
;580:/*
;581:=================
;582:StartServer_InitServerExec
;583:=================
;584:*/
;585:static qboolean StartServer_InitServerExec( void )
;586:{
line 590
;587:	int i, count, mapsource;
;588:   int index, botnum;
;589:
;590:	memset(&s_serverexec, 0, sizeof(serverexec_t));
ADDRGP4 s_serverexec
ARGP4
CNSTI4 0
ARGI4
CNSTI4 155800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 595
;591:
;592:	//
;593:	// init map stuff
;594:	//
;595:	count = s_scriptdata.map.num_maps;
ADDRLP4 12
ADDRGP4 s_scriptdata+8
INDIRI4
ASGNI4
line 596
;596:	mapsource = s_scriptdata.map.listSource;
ADDRLP4 16
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ASGNI4
line 598
;597:
;598:	if (StartServer_IsRandomGeneratedMapList(mapsource))
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $527
line 599
;599:	{
line 600
;600:		count = s_scriptdata.map.SourceCount;
ADDRLP4 12
ADDRGP4 s_scriptdata+8+1820
INDIRI4
ASGNI4
line 601
;601:	}
LABELV $527
line 603
;602:
;603:	s_serverexec.cycle_count = count;
ADDRGP4 s_serverexec+147468
ADDRLP4 12
INDIRI4
ASGNI4
line 608
;604:
;605:	//
;606:	// init bot stuff
;607:	//
;608:	s_serverexec.maxBots = UI_GetNumBots();
ADDRLP4 24
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 s_serverexec+131072
ADDRLP4 24
INDIRI4
ASGNI4
line 610
;609:
;610:	if (s_serverexec.maxBots >= MAX_BOTS)
ADDRGP4 s_serverexec+131072
INDIRI4
CNSTI4 2048
LTI4 $533
line 611
;611:		s_serverexec.maxBots = MAX_BOTS - 1;
ADDRGP4 s_serverexec+131072
CNSTI4 2047
ASGNI4
LABELV $533
line 613
;612:
;613:	s_serverexec.random_generate = qfalse;
ADDRGP4 s_serverexec+147472
CNSTI4 0
ASGNI4
line 614
;614:	s_serverexec.random_order = qfalse;
ADDRGP4 s_serverexec+147476
CNSTI4 0
ASGNI4
line 615
;615:	s_serverexec.random_count = 0;
ADDRGP4 s_serverexec+147480
CNSTI4 0
ASGNI4
line 617
;616:
;617:	s_serverexec.botcount_firstmap = 0;
ADDRGP4 s_serverexec+155676
CNSTI4 0
ASGNI4
line 618
;618:	s_serverexec.max_scripted_bots = 0;
ADDRGP4 s_serverexec+155680
CNSTI4 0
ASGNI4
line 620
;619:
;620:	s_serverexec.map_generated = qfalse;
ADDRGP4 s_serverexec+155792
CNSTI4 0
ASGNI4
line 621
;621:	s_serverexec.bot_generated = qfalse;
ADDRGP4 s_serverexec+155796
CNSTI4 0
ASGNI4
line 624
;622:
;623:   // build list of bots found in slots (info may or may not be used)
;624:   index = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 625
;625:   for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $544
line 626
;626:      if (s_scriptdata.bot.slotType[i] != SLOTTYPE_BOT)
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $548
line 627
;627:         continue;   // not a bot
ADDRGP4 $545
JUMPV
LABELV $548
line 628
;628:      if (s_scriptdata.bot.name[i][0] == '\0')
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $552
line 629
;629:         continue;   // blank name
ADDRGP4 $545
JUMPV
LABELV $552
line 630
;630:      botnum = UI_GetBotNumByName(s_scriptdata.bot.name[i]);
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 UI_GetBotNumByName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 631
;631:      if (botnum >= 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $556
line 632
;632:         s_serverexec.bots_in_slots[index] = botnum;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+155684
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 633
;633:         index++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 634
;634:      }
LABELV $556
line 635
;635:   }
LABELV $545
line 625
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $544
line 636
;636:   s_serverexec.num_bots_in_slots = index;
ADDRGP4 s_serverexec+155788
ADDRLP4 8
INDIRI4
ASGNI4
line 638
;637:
;638:   if (s_scriptdata.bot.typeSelect == BOTTYPE_SELECTARENASCRIPT && s_serverexec.num_bots_in_slots == 0) {
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
CNSTI4 5
NEI4 $560
ADDRGP4 s_serverexec+155788
INDIRI4
CNSTI4 0
NEI4 $560
line 639
;639:		trap_Print(S_COLOR_RED"InitServerExec: Not enough bots for game type\n");
ADDRGP4 $565
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 640
;640:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $523
JUMPV
LABELV $560
line 643
;641:   }
;642:
;643:	return qtrue;
CNSTI4 1
RETI4
LABELV $523
endproc StartServer_InitServerExec 36 12
proc StartServer_WriteServerParams 1504 8
line 655
;644:}
;645:
;646:
;647:
;648:
;649:/*
;650:=================
;651:StartServer_WriteServerParams
;652:=================
;653:*/
;654:static qboolean StartServer_WriteServerParams( void )
;655:{
line 661
;656:	int i, value, open;
;657:	char* password;
;658:	int botcount;
;659:	qboolean useping;
;660:
;661:	AddScript("\n// WriteServerParams()\n\n");
ADDRGP4 $567
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 663
;662:
;663:	if (!s_serverexec.bot_generated) {
ADDRGP4 s_serverexec+155796
INDIRI4
CNSTI4 0
NEI4 $568
line 664
;664:		trap_Print(S_COLOR_RED"WriteServerParams called before WriteBotParams\n");
ADDRGP4 $571
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 665
;665:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $568
line 668
;666:	}
;667:
;668:	AddScript(va("g_gameType %i\n", s_scriptdata.gametype));
ADDRGP4 $572
ARGP4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 670
;669:
;670:	if (s_scriptdata.server.hostname[0])
ADDRGP4 s_scriptdata+3676
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $573
line 671
;671:		AddScript(va("sv_hostname \"%s\"\n", s_scriptdata.server.hostname));
ADDRGP4 $576
ARGP4
ADDRGP4 s_scriptdata+3676
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $573
line 673
;672:
;673:	AddScript(va("sv_pure 0\n", s_scriptdata.server.pure));
ADDRGP4 $578
ARGP4
ADDRGP4 s_scriptdata+3676+168
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 674
;674:	if (s_scriptdata.multiplayer) {
ADDRGP4 s_scriptdata+4
INDIRI4
CNSTI4 0
EQI4 $581
line 675
;675:		AddScript(va("dedicated %i\n", s_scriptdata.server.dedicatedServer));
ADDRGP4 $584
ARGP4
ADDRGP4 s_scriptdata+3676+180
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 676
;676:		AddScript(va("g_inactivity %i\n", s_scriptdata.server.inactivityTime));
ADDRGP4 $587
ARGP4
ADDRGP4 s_scriptdata+3676+184
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 679
;677:
;678:      // LAN force rate
;679:      AddScript(va("sv_lanForceRate %i\n", s_scriptdata.server.lanForceRate));
ADDRGP4 $590
ARGP4
ADDRGP4 s_scriptdata+3676+236
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 682
;680:
;681:      // punkbuster
;682:      if (uis.punkbuster) {
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
EQI4 $593
line 683
;683:         AddScript(va("sv_punkbuster %i\n", s_scriptdata.server.punkbuster));
ADDRGP4 $596
ARGP4
ADDRGP4 s_scriptdata+3676+228
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 684
;684:         AddScript(va("sv_strictAuth %i\n", s_scriptdata.server.strictAuth));
ADDRGP4 $599
ARGP4
ADDRGP4 s_scriptdata+3676+232
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 685
;685:      }
LABELV $593
line 687
;686:
;687:	}
LABELV $581
line 689
;688:
;689:	AddScript(va("set g_forcerespawn %i\n", s_scriptdata.server.forceRespawn));
ADDRGP4 $602
ARGP4
ADDRGP4 s_scriptdata+3676+120
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 691
;690:	//Noire.dev
;691:AddScript(va("set g_maxEntities %i\n", s_scriptdata.server.maxEntities));
ADDRGP4 $605
ARGP4
ADDRGP4 s_scriptdata+3676+240
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 692
;692:AddScript(va("set g_spSkill %i\n", s_scriptdata.server.singleskill));
ADDRGP4 $608
ARGP4
ADDRGP4 s_scriptdata+3676+244
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 693
;693:AddScript(va("set g_kill %i\n", s_scriptdata.server.kill));
ADDRGP4 $611
ARGP4
ADDRGP4 s_scriptdata+3676+248
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 694
;694:AddScript(va("set g_damageModifier  \"%s\"\n", s_scriptdata.server.damageModifier));
ADDRGP4 $614
ARGP4
ADDRGP4 s_scriptdata+3676+252
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 695
;695:AddScript(va("set cl_selectedmod  \"%s\"\n", s_scriptdata.server.selectedmod));
ADDRGP4 $617
ARGP4
ADDRGP4 s_scriptdata+3676+284
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 696
;696:AddScript(va("set g_roundmode %i\n", s_scriptdata.server.roundmode));
ADDRGP4 $620
ARGP4
ADDRGP4 s_scriptdata+3676+316
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 697
;697:AddScript(va("set g_elimination %i\n", s_scriptdata.server.elimination));
ADDRGP4 $623
ARGP4
ADDRGP4 s_scriptdata+3676+320
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 698
;698:AddScript(va("set g_obeliskHealth %i\n", s_scriptdata.server.obeliskHealth));
ADDRGP4 $626
ARGP4
ADDRGP4 s_scriptdata+3676+324
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 699
;699:AddScript(va("set g_obeliskRegenPeriod %i\n", s_scriptdata.server.obeliskRegenPeriod));
ADDRGP4 $629
ARGP4
ADDRGP4 s_scriptdata+3676+328
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 700
;700:AddScript(va("set g_obeliskRegenAmount %i\n", s_scriptdata.server.obeliskRegenAmount));
ADDRGP4 $632
ARGP4
ADDRGP4 s_scriptdata+3676+332
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 701
;701:AddScript(va("set g_obeliskRespawnDelay %i\n", s_scriptdata.server.obeliskRespawnDelay));
ADDRGP4 $635
ARGP4
ADDRGP4 s_scriptdata+3676+336
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 702
;702:AddScript(va("set g_cubeTimeout %i\n", s_scriptdata.server.cubeTimeout));
ADDRGP4 $638
ARGP4
ADDRGP4 s_scriptdata+3676+340
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 703
;703:AddScript(va("set g_flagrespawn %i\n", s_scriptdata.server.flagrespawn));
ADDRGP4 $641
ARGP4
ADDRGP4 s_scriptdata+3676+344
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 704
;704:AddScript(va("set g_weaponTeamRespawn %i\n", s_scriptdata.server.weaponTeamRespawn));
ADDRGP4 $644
ARGP4
ADDRGP4 s_scriptdata+3676+348
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 705
;705:AddScript(va("set elimination_ctf_oneway %i\n", s_scriptdata.server.elimination_ctf_oneway));
ADDRGP4 $647
ARGP4
ADDRGP4 s_scriptdata+3676+352
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 706
;706:AddScript(va("set elimination_selfdamage %i\n", s_scriptdata.server.elimination_selfdamage));
ADDRGP4 $650
ARGP4
ADDRGP4 s_scriptdata+3676+356
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 707
;707:AddScript(va("set elimination_roundtime %i\n", s_scriptdata.server.elimination_roundtime));
ADDRGP4 $653
ARGP4
ADDRGP4 s_scriptdata+3676+360
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 708
;708:AddScript(va("set elimination_warmup %i\n", s_scriptdata.server.elimination_warmup));
ADDRGP4 $656
ARGP4
ADDRGP4 s_scriptdata+3676+364
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 709
;709:AddScript(va("set elimination_activewarmup %i\n", s_scriptdata.server.elimination_activewarmup));
ADDRGP4 $659
ARGP4
ADDRGP4 s_scriptdata+3676+368
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 710
;710:AddScript(va("set g_lms_lives %i\n", s_scriptdata.server.lms_lives));
ADDRGP4 $662
ARGP4
ADDRGP4 s_scriptdata+3676+372
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 711
;711:AddScript(va("set g_lms_mode %i\n", s_scriptdata.server.lms_mode));
ADDRGP4 $665
ARGP4
ADDRGP4 s_scriptdata+3676+376
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 712
;712:AddScript(va("set g_accelerate %i\n", s_scriptdata.server.accelerate));
ADDRGP4 $668
ARGP4
ADDRGP4 s_scriptdata+3676+380
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 713
;713:AddScript(va("set g_spectatorspeed %i\n", s_scriptdata.server.spectatorspeed));
ADDRGP4 $671
ARGP4
ADDRGP4 s_scriptdata+3676+384
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 714
;714:AddScript(va("set g_speed %i\n", s_scriptdata.server.speed));
ADDRGP4 $674
ARGP4
ADDRGP4 s_scriptdata+3676+388
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 715
;715:AddScript(va("set g_gravity %i\n", s_scriptdata.server.gravity));
ADDRGP4 $677
ARGP4
ADDRGP4 s_scriptdata+3676+392
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 716
;716:AddScript(va("set g_gravityModifier  \"%s\"\n", s_scriptdata.server.gravityModifier));
ADDRGP4 $680
ARGP4
ADDRGP4 s_scriptdata+3676+396
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 717
;717:AddScript(va("set g_knockback %i\n", s_scriptdata.server.knockback));
ADDRGP4 $683
ARGP4
ADDRGP4 s_scriptdata+3676+428
INDIRI4
ARGI4
ADDRLP4 144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 718
;718:AddScript(va("set g_noplayerclip %i\n", s_scriptdata.server.noplayerclip));
ADDRGP4 $686
ARGP4
ADDRGP4 s_scriptdata+3676+432
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 719
;719:AddScript(va("set g_jumpheight %i\n", s_scriptdata.server.jumpheight));
ADDRGP4 $689
ARGP4
ADDRGP4 s_scriptdata+3676+436
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 720
;720:AddScript(va("set g_regenarmor %i\n", s_scriptdata.server.regenarmor));
ADDRGP4 $692
ARGP4
ADDRGP4 s_scriptdata+3676+440
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 721
;721:AddScript(va("set g_ammolimit %i\n", s_scriptdata.server.ammolimit));
ADDRGP4 $695
ARGP4
ADDRGP4 s_scriptdata+3676+444
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 722
;722:AddScript(va("set g_quadfactor  \"%s\"\n", s_scriptdata.server.quadfactor));
ADDRGP4 $698
ARGP4
ADDRGP4 s_scriptdata+3676+448
ARGP4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 723
;723:AddScript(va("set g_respawntime %i\n", s_scriptdata.server.respawntime));
ADDRGP4 $701
ARGP4
ADDRGP4 s_scriptdata+3676+480
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 724
;724:AddScript(va("set g_forcerespawn %i\n", s_scriptdata.server.forcerespawn));
ADDRGP4 $602
ARGP4
ADDRGP4 s_scriptdata+3676+484
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 725
;725:AddScript(va("set g_vampire  \"%s\"\n", s_scriptdata.server.vampire));
ADDRGP4 $706
ARGP4
ADDRGP4 s_scriptdata+3676+488
ARGP4
ADDRLP4 176
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 726
;726:AddScript(va("set g_vampire_max_health %i\n", s_scriptdata.server.vampire_max_health));
ADDRGP4 $709
ARGP4
ADDRGP4 s_scriptdata+3676+520
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 727
;727:AddScript(va("set g_regen %i\n", s_scriptdata.server.regen));
ADDRGP4 $712
ARGP4
ADDRGP4 s_scriptdata+3676+524
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 728
;728:AddScript(va("set g_maxweaponpickup %i\n", s_scriptdata.server.maxweaponpickup));
ADDRGP4 $715
ARGP4
ADDRGP4 s_scriptdata+3676+528
INDIRI4
ARGI4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 729
;729:AddScript(va("set g_droppeditemtime %i\n", s_scriptdata.server.droppeditemtime));
ADDRGP4 $718
ARGP4
ADDRGP4 s_scriptdata+3676+532
INDIRI4
ARGI4
ADDRLP4 192
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 192
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 730
;730:AddScript(va("set g_autoflagreturn %i\n", s_scriptdata.server.autoflagreturn));
ADDRGP4 $721
ARGP4
ADDRGP4 s_scriptdata+3676+536
INDIRI4
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 731
;731:AddScript(va("set g_armorprotect  \"%s\"\n", s_scriptdata.server.armorprotect));
ADDRGP4 $724
ARGP4
ADDRGP4 s_scriptdata+3676+540
ARGP4
ADDRLP4 200
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 732
;732:AddScript(va("set g_respawnwait %i\n", s_scriptdata.server.respawnwait));
ADDRGP4 $727
ARGP4
ADDRGP4 s_scriptdata+3676+572
INDIRI4
ARGI4
ADDRLP4 204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 733
;733:AddScript(va("set g_speedfactor  \"%s\"\n", s_scriptdata.server.speedfactor));
ADDRGP4 $730
ARGP4
ADDRGP4 s_scriptdata+3676+576
ARGP4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 208
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 734
;734:AddScript(va("set g_scoutspeedfactor  \"%s\"\n", s_scriptdata.server.scoutspeedfactor));
ADDRGP4 $733
ARGP4
ADDRGP4 s_scriptdata+3676+608
ARGP4
ADDRLP4 212
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 212
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 735
;735:AddScript(va("set g_scoutfirespeed  \"%s\"\n", s_scriptdata.server.scoutfirespeed));
ADDRGP4 $736
ARGP4
ADDRGP4 s_scriptdata+3676+640
ARGP4
ADDRLP4 216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 216
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 736
;736:AddScript(va("set g_scoutdamagefactor  \"%s\"\n", s_scriptdata.server.scoutdamagefactor));
ADDRGP4 $739
ARGP4
ADDRGP4 s_scriptdata+3676+672
ARGP4
ADDRLP4 220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 737
;737:AddScript(va("set g_scoutgravitymodifier  \"%s\"\n", s_scriptdata.server.scoutgravitymodifier));
ADDRGP4 $742
ARGP4
ADDRGP4 s_scriptdata+3676+704
ARGP4
ADDRLP4 224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 738
;738:AddScript(va("set g_scout_infammo %i\n", s_scriptdata.server.scout_infammo));
ADDRGP4 $745
ARGP4
ADDRGP4 s_scriptdata+3676+736
INDIRI4
ARGI4
ADDRLP4 228
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 228
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 739
;739:AddScript(va("set g_scouthealthmodifier  \"%s\"\n", s_scriptdata.server.scouthealthmodifier));
ADDRGP4 $748
ARGP4
ADDRGP4 s_scriptdata+3676+740
ARGP4
ADDRLP4 232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 740
;740:AddScript(va("set g_doublerfirespeed  \"%s\"\n", s_scriptdata.server.doublerfirespeed));
ADDRGP4 $751
ARGP4
ADDRGP4 s_scriptdata+3676+772
ARGP4
ADDRLP4 236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 741
;741:AddScript(va("set g_doublerdamagefactor  \"%s\"\n", s_scriptdata.server.doublerdamagefactor));
ADDRGP4 $754
ARGP4
ADDRGP4 s_scriptdata+3676+804
ARGP4
ADDRLP4 240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 240
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 742
;742:AddScript(va("set g_doublerspeedfactor  \"%s\"\n", s_scriptdata.server.doublerspeedfactor));
ADDRGP4 $757
ARGP4
ADDRGP4 s_scriptdata+3676+836
ARGP4
ADDRLP4 244
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 743
;743:AddScript(va("set g_doublergravitymodifier  \"%s\"\n", s_scriptdata.server.doublergravitymodifier));
ADDRGP4 $760
ARGP4
ADDRGP4 s_scriptdata+3676+868
ARGP4
ADDRLP4 248
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 744
;744:AddScript(va("set g_doubler_infammo %i\n", s_scriptdata.server.doubler_infammo));
ADDRGP4 $763
ARGP4
ADDRGP4 s_scriptdata+3676+900
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 252
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 745
;745:AddScript(va("set g_doublerhealthmodifier  \"%s\"\n", s_scriptdata.server.doublerhealthmodifier));
ADDRGP4 $766
ARGP4
ADDRGP4 s_scriptdata+3676+904
ARGP4
ADDRLP4 256
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 746
;746:AddScript(va("set g_guardhealthmodifier  \"%s\"\n", s_scriptdata.server.guardhealthmodifier));
ADDRGP4 $769
ARGP4
ADDRGP4 s_scriptdata+3676+936
ARGP4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 747
;747:AddScript(va("set g_guardfirespeed  \"%s\"\n", s_scriptdata.server.guardfirespeed));
ADDRGP4 $772
ARGP4
ADDRGP4 s_scriptdata+3676+968
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 748
;748:AddScript(va("set g_guarddamagefactor  \"%s\"\n", s_scriptdata.server.guarddamagefactor));
ADDRGP4 $775
ARGP4
ADDRGP4 s_scriptdata+3676+1000
ARGP4
ADDRLP4 268
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 749
;749:AddScript(va("set g_guardspeedfactor  \"%s\"\n", s_scriptdata.server.guardspeedfactor));
ADDRGP4 $778
ARGP4
ADDRGP4 s_scriptdata+3676+1032
ARGP4
ADDRLP4 272
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 750
;750:AddScript(va("set g_guardgravitymodifier  \"%s\"\n", s_scriptdata.server.guardgravitymodifier));
ADDRGP4 $781
ARGP4
ADDRGP4 s_scriptdata+3676+1064
ARGP4
ADDRLP4 276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 751
;751:AddScript(va("set g_guard_infammo %i\n", s_scriptdata.server.guard_infammo));
ADDRGP4 $784
ARGP4
ADDRGP4 s_scriptdata+3676+1096
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 280
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 752
;752:AddScript(va("set g_ammoregenfirespeed  \"%s\"\n", s_scriptdata.server.ammoregenfirespeed));
ADDRGP4 $787
ARGP4
ADDRGP4 s_scriptdata+3676+1100
ARGP4
ADDRLP4 284
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 753
;753:AddScript(va("set g_ammoregen_infammo %i\n", s_scriptdata.server.ammoregen_infammo));
ADDRGP4 $790
ARGP4
ADDRGP4 s_scriptdata+3676+1132
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 754
;754:AddScript(va("set g_ammoregendamagefactor  \"%s\"\n", s_scriptdata.server.ammoregendamagefactor));
ADDRGP4 $793
ARGP4
ADDRGP4 s_scriptdata+3676+1136
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 292
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 755
;755:AddScript(va("set g_ammoregenspeedfactor  \"%s\"\n", s_scriptdata.server.ammoregenspeedfactor));
ADDRGP4 $796
ARGP4
ADDRGP4 s_scriptdata+3676+1168
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 756
;756:AddScript(va("set g_ammoregengravitymodifier  \"%s\"\n", s_scriptdata.server.ammoregengravitymodifier));
ADDRGP4 $799
ARGP4
ADDRGP4 s_scriptdata+3676+1200
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 757
;757:AddScript(va("set g_ammoregenhealthmodifier  \"%s\"\n", s_scriptdata.server.ammoregenhealthmodifier));
ADDRGP4 $802
ARGP4
ADDRGP4 s_scriptdata+3676+1232
ARGP4
ADDRLP4 304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 758
;758:AddScript(va("set g_teamred_speed %i\n", s_scriptdata.server.teamred_speed));
ADDRGP4 $805
ARGP4
ADDRGP4 s_scriptdata+3676+1264
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 308
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 759
;759:AddScript(va("set g_teamred_gravityModifier  \"%s\"\n", s_scriptdata.server.teamred_gravityModifier));
ADDRGP4 $808
ARGP4
ADDRGP4 s_scriptdata+3676+1268
ARGP4
ADDRLP4 312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 312
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 760
;760:AddScript(va("set g_teamred_firespeed  \"%s\"\n", s_scriptdata.server.teamred_firespeed));
ADDRGP4 $811
ARGP4
ADDRGP4 s_scriptdata+3676+1300
ARGP4
ADDRLP4 316
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 761
;761:AddScript(va("set g_teamred_damage  \"%s\"\n", s_scriptdata.server.teamred_damage));
ADDRGP4 $814
ARGP4
ADDRGP4 s_scriptdata+3676+1332
ARGP4
ADDRLP4 320
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 762
;762:AddScript(va("set g_teamred_infammo %i\n", s_scriptdata.server.teamred_infammo));
ADDRGP4 $817
ARGP4
ADDRGP4 s_scriptdata+3676+1364
INDIRI4
ARGI4
ADDRLP4 324
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 324
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 763
;763:AddScript(va("set g_teamred_respawnwait %i\n", s_scriptdata.server.teamred_respawnwait));
ADDRGP4 $820
ARGP4
ADDRGP4 s_scriptdata+3676+1368
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 764
;764:AddScript(va("set g_teamred_pickupitems %i\n", s_scriptdata.server.teamred_pickupitems));
ADDRGP4 $823
ARGP4
ADDRGP4 s_scriptdata+3676+1372
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 765
;765:AddScript(va("set eliminationredrespawn %i\n", s_scriptdata.server.eliminationredrespawn));
ADDRGP4 $826
ARGP4
ADDRGP4 s_scriptdata+3676+1376
INDIRI4
ARGI4
ADDRLP4 336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 336
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 766
;766:AddScript(va("set eliminationred_startHealth %i\n", s_scriptdata.server.eliminationred_startHealth));
ADDRGP4 $829
ARGP4
ADDRGP4 s_scriptdata+3676+1380
INDIRI4
ARGI4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 767
;767:AddScript(va("set eliminationred_startArmor %i\n", s_scriptdata.server.eliminationred_startArmor));
ADDRGP4 $832
ARGP4
ADDRGP4 s_scriptdata+3676+1384
INDIRI4
ARGI4
ADDRLP4 344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 768
;768:AddScript(va("set g_teamblue_speed %i\n", s_scriptdata.server.teamblue_speed));
ADDRGP4 $835
ARGP4
ADDRGP4 s_scriptdata+3676+1388
INDIRI4
ARGI4
ADDRLP4 348
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 769
;769:AddScript(va("set g_teamblue_gravityModifier  \"%s\"\n", s_scriptdata.server.teamblue_gravityModifier));
ADDRGP4 $838
ARGP4
ADDRGP4 s_scriptdata+3676+1392
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 770
;770:AddScript(va("set g_teamblue_firespeed  \"%s\"\n", s_scriptdata.server.teamblue_firespeed));
ADDRGP4 $841
ARGP4
ADDRGP4 s_scriptdata+3676+1424
ARGP4
ADDRLP4 356
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 771
;771:AddScript(va("set g_teamblue_damage  \"%s\"\n", s_scriptdata.server.teamblue_damage));
ADDRGP4 $844
ARGP4
ADDRGP4 s_scriptdata+3676+1456
ARGP4
ADDRLP4 360
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 360
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 772
;772:AddScript(va("set g_teamblue_infammo %i\n", s_scriptdata.server.teamblue_infammo));
ADDRGP4 $847
ARGP4
ADDRGP4 s_scriptdata+3676+1488
INDIRI4
ARGI4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 773
;773:AddScript(va("set g_teamblue_respawnwait %i\n", s_scriptdata.server.teamblue_respawnwait));
ADDRGP4 $850
ARGP4
ADDRGP4 s_scriptdata+3676+1492
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 368
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 774
;774:AddScript(va("set g_teamblue_pickupitems %i\n", s_scriptdata.server.teamblue_pickupitems));
ADDRGP4 $853
ARGP4
ADDRGP4 s_scriptdata+3676+1496
INDIRI4
ARGI4
ADDRLP4 372
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 775
;775:AddScript(va("set eliminationrespawn %i\n", s_scriptdata.server.eliminationrespawn));
ADDRGP4 $856
ARGP4
ADDRGP4 s_scriptdata+3676+1500
INDIRI4
ARGI4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 776
;776:AddScript(va("set elimination_startHealth %i\n", s_scriptdata.server.elimination_startHealth));
ADDRGP4 $859
ARGP4
ADDRGP4 s_scriptdata+3676+1504
INDIRI4
ARGI4
ADDRLP4 380
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 777
;777:AddScript(va("set elimination_startArmor %i\n", s_scriptdata.server.elimination_startArmor));
ADDRGP4 $862
ARGP4
ADDRGP4 s_scriptdata+3676+1508
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 778
;778:AddScript(va("set eliminationred_grapple %i\n", s_scriptdata.server.eliminationred_grapple));
ADDRGP4 $865
ARGP4
ADDRGP4 s_scriptdata+3676+1512
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 779
;779:AddScript(va("set eliminationred_gauntlet %i\n", s_scriptdata.server.eliminationred_gauntlet));
ADDRGP4 $868
ARGP4
ADDRGP4 s_scriptdata+3676+1516
INDIRI4
ARGI4
ADDRLP4 392
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 780
;780:AddScript(va("set eliminationred_machinegun %i\n", s_scriptdata.server.eliminationred_machinegun));
ADDRGP4 $871
ARGP4
ADDRGP4 s_scriptdata+3676+1520
INDIRI4
ARGI4
ADDRLP4 396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 781
;781:AddScript(va("set eliminationred_shotgun %i\n", s_scriptdata.server.eliminationred_shotgun));
ADDRGP4 $874
ARGP4
ADDRGP4 s_scriptdata+3676+1524
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 400
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 782
;782:AddScript(va("set eliminationred_grenade %i\n", s_scriptdata.server.eliminationred_grenade));
ADDRGP4 $877
ARGP4
ADDRGP4 s_scriptdata+3676+1528
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 783
;783:AddScript(va("set eliminationred_rocket %i\n", s_scriptdata.server.eliminationred_rocket));
ADDRGP4 $880
ARGP4
ADDRGP4 s_scriptdata+3676+1532
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 784
;784:AddScript(va("set eliminationred_railgun %i\n", s_scriptdata.server.eliminationred_railgun));
ADDRGP4 $883
ARGP4
ADDRGP4 s_scriptdata+3676+1536
INDIRI4
ARGI4
ADDRLP4 412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 785
;785:AddScript(va("set eliminationred_lightning %i\n", s_scriptdata.server.eliminationred_lightning));
ADDRGP4 $886
ARGP4
ADDRGP4 s_scriptdata+3676+1540
INDIRI4
ARGI4
ADDRLP4 416
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 416
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 786
;786:AddScript(va("set eliminationred_plasmagun %i\n", s_scriptdata.server.eliminationred_plasmagun));
ADDRGP4 $889
ARGP4
ADDRGP4 s_scriptdata+3676+1544
INDIRI4
ARGI4
ADDRLP4 420
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 787
;787:AddScript(va("set eliminationred_bfg %i\n", s_scriptdata.server.eliminationred_bfg));
ADDRGP4 $892
ARGP4
ADDRGP4 s_scriptdata+3676+1548
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 788
;788:AddScript(va("set eliminationred_chain %i\n", s_scriptdata.server.eliminationred_chain));
ADDRGP4 $895
ARGP4
ADDRGP4 s_scriptdata+3676+1552
INDIRI4
ARGI4
ADDRLP4 428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 789
;789:AddScript(va("set eliminationred_mine %i\n", s_scriptdata.server.eliminationred_mine));
ADDRGP4 $898
ARGP4
ADDRGP4 s_scriptdata+3676+1556
INDIRI4
ARGI4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 790
;790:AddScript(va("set eliminationred_nail %i\n", s_scriptdata.server.eliminationred_nail));
ADDRGP4 $901
ARGP4
ADDRGP4 s_scriptdata+3676+1560
INDIRI4
ARGI4
ADDRLP4 436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 791
;791:AddScript(va("set eliminationred_flame %i\n", s_scriptdata.server.eliminationred_flame));
ADDRGP4 $904
ARGP4
ADDRGP4 s_scriptdata+3676+1564
INDIRI4
ARGI4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 792
;792:AddScript(va("set eliminationred_antimatter %i\n", s_scriptdata.server.eliminationred_antimatter));
ADDRGP4 $907
ARGP4
ADDRGP4 s_scriptdata+3676+1568
INDIRI4
ARGI4
ADDRLP4 444
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 793
;793:AddScript(va("set elimination_grapple %i\n", s_scriptdata.server.elimination_grapple));
ADDRGP4 $910
ARGP4
ADDRGP4 s_scriptdata+3676+1572
INDIRI4
ARGI4
ADDRLP4 448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 794
;794:AddScript(va("set elimination_gauntlet %i\n", s_scriptdata.server.elimination_gauntlet));
ADDRGP4 $913
ARGP4
ADDRGP4 s_scriptdata+3676+1576
INDIRI4
ARGI4
ADDRLP4 452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 795
;795:AddScript(va("set elimination_machinegun %i\n", s_scriptdata.server.elimination_machinegun));
ADDRGP4 $916
ARGP4
ADDRGP4 s_scriptdata+3676+1580
INDIRI4
ARGI4
ADDRLP4 456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 796
;796:AddScript(va("set elimination_shotgun %i\n", s_scriptdata.server.elimination_shotgun));
ADDRGP4 $919
ARGP4
ADDRGP4 s_scriptdata+3676+1584
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 797
;797:AddScript(va("set elimination_grenade %i\n", s_scriptdata.server.elimination_grenade));
ADDRGP4 $922
ARGP4
ADDRGP4 s_scriptdata+3676+1588
INDIRI4
ARGI4
ADDRLP4 464
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 798
;798:AddScript(va("set elimination_rocket %i\n", s_scriptdata.server.elimination_rocket));
ADDRGP4 $925
ARGP4
ADDRGP4 s_scriptdata+3676+1592
INDIRI4
ARGI4
ADDRLP4 468
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 799
;799:AddScript(va("set elimination_railgun %i\n", s_scriptdata.server.elimination_railgun));
ADDRGP4 $928
ARGP4
ADDRGP4 s_scriptdata+3676+1596
INDIRI4
ARGI4
ADDRLP4 472
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 472
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 800
;800:AddScript(va("set elimination_lightning %i\n", s_scriptdata.server.elimination_lightning));
ADDRGP4 $931
ARGP4
ADDRGP4 s_scriptdata+3676+1600
INDIRI4
ARGI4
ADDRLP4 476
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 476
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 801
;801:AddScript(va("set elimination_plasmagun %i\n", s_scriptdata.server.elimination_plasmagun));
ADDRGP4 $934
ARGP4
ADDRGP4 s_scriptdata+3676+1604
INDIRI4
ARGI4
ADDRLP4 480
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 480
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 802
;802:AddScript(va("set elimination_bfg %i\n", s_scriptdata.server.elimination_bfg));
ADDRGP4 $937
ARGP4
ADDRGP4 s_scriptdata+3676+1608
INDIRI4
ARGI4
ADDRLP4 484
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 484
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 803
;803:AddScript(va("set elimination_chain %i\n", s_scriptdata.server.elimination_chain));
ADDRGP4 $940
ARGP4
ADDRGP4 s_scriptdata+3676+1612
INDIRI4
ARGI4
ADDRLP4 488
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 488
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 804
;804:AddScript(va("set elimination_mine %i\n", s_scriptdata.server.elimination_mine));
ADDRGP4 $943
ARGP4
ADDRGP4 s_scriptdata+3676+1616
INDIRI4
ARGI4
ADDRLP4 492
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 492
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 805
;805:AddScript(va("set elimination_nail %i\n", s_scriptdata.server.elimination_nail));
ADDRGP4 $946
ARGP4
ADDRGP4 s_scriptdata+3676+1620
INDIRI4
ARGI4
ADDRLP4 496
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 496
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 806
;806:AddScript(va("set elimination_flame %i\n", s_scriptdata.server.elimination_flame));
ADDRGP4 $949
ARGP4
ADDRGP4 s_scriptdata+3676+1624
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 807
;807:AddScript(va("set elimination_antimatter %i\n", s_scriptdata.server.elimination_antimatter));
ADDRGP4 $952
ARGP4
ADDRGP4 s_scriptdata+3676+1628
INDIRI4
ARGI4
ADDRLP4 504
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 504
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 808
;808:AddScript(va("set eliminationred_quad %i\n", s_scriptdata.server.eliminationred_quad));
ADDRGP4 $955
ARGP4
ADDRGP4 s_scriptdata+3676+1632
INDIRI4
ARGI4
ADDRLP4 508
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 508
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 809
;809:AddScript(va("set elimination_haste %i\n", s_scriptdata.server.elimination_haste));
ADDRGP4 $958
ARGP4
ADDRGP4 s_scriptdata+3676+1664
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 512
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 810
;810:AddScript(va("set elimination_bsuit %i\n", s_scriptdata.server.elimination_bsuit));
ADDRGP4 $961
ARGP4
ADDRGP4 s_scriptdata+3676+1668
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 516
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 811
;811:AddScript(va("set elimination_invis %i\n", s_scriptdata.server.elimination_invis));
ADDRGP4 $964
ARGP4
ADDRGP4 s_scriptdata+3676+1672
INDIRI4
ARGI4
ADDRLP4 520
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 812
;812:AddScript(va("set elimination_regen %i\n", s_scriptdata.server.elimination_regen));
ADDRGP4 $967
ARGP4
ADDRGP4 s_scriptdata+3676+1676
INDIRI4
ARGI4
ADDRLP4 524
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 813
;813:AddScript(va("set elimination_flight %i\n", s_scriptdata.server.elimination_flight));
ADDRGP4 $970
ARGP4
ADDRGP4 s_scriptdata+3676+1680
INDIRI4
ARGI4
ADDRLP4 528
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 814
;814:AddScript(va("set elimination_items %i\n", s_scriptdata.server.elimination_items));
ADDRGP4 $973
ARGP4
ADDRGP4 s_scriptdata+3676+1684
INDIRI4
ARGI4
ADDRLP4 532
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 815
;815:AddScript(va("set elimination_holdable %i\n", s_scriptdata.server.elimination_holdable));
ADDRGP4 $976
ARGP4
ADDRGP4 s_scriptdata+3676+1688
INDIRI4
ARGI4
ADDRLP4 536
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 536
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 816
;816:AddScript(va("set g_minigame %i\n", s_scriptdata.server.minigame));
ADDRGP4 $979
ARGP4
ADDRGP4 s_scriptdata+3676+1692
INDIRI4
ARGI4
ADDRLP4 540
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 540
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 817
;817:AddScript(va("set g_overlay %i\n", s_scriptdata.server.overlay));
ADDRGP4 $982
ARGP4
ADDRGP4 s_scriptdata+3676+1696
INDIRI4
ARGI4
ADDRLP4 544
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 544
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 818
;818:AddScript(va("set g_randomItems %i\n", s_scriptdata.server.randomItems));
ADDRGP4 $985
ARGP4
ADDRGP4 s_scriptdata+3676+1700
INDIRI4
ARGI4
ADDRLP4 548
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 819
;819:AddScript(va("set g_slickmove %i\n", s_scriptdata.server.slickmove));
ADDRGP4 $988
ARGP4
ADDRGP4 s_scriptdata+3676+1704
INDIRI4
ARGI4
ADDRLP4 552
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 820
;820:AddScript(va("set g_spawnprotect %i\n", s_scriptdata.server.spawnprotect));
ADDRGP4 $991
ARGP4
ADDRGP4 s_scriptdata+3676+1708
INDIRI4
ARGI4
ADDRLP4 556
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 556
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 821
;821:AddScript(va("set elimination_lockspectator %i\n", s_scriptdata.server.elimination_lockspectator));
ADDRGP4 $994
ARGP4
ADDRGP4 s_scriptdata+3676+1712
INDIRI4
ARGI4
ADDRLP4 560
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 560
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 822
;822:AddScript(va("set g_awardpushing %i\n", s_scriptdata.server.awardpushing));
ADDRGP4 $997
ARGP4
ADDRGP4 s_scriptdata+3676+1716
INDIRI4
ARGI4
ADDRLP4 564
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 564
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 823
;823:AddScript(va("set g_specChat %i\n", s_scriptdata.server.specChat));
ADDRGP4 $1000
ARGP4
ADDRGP4 s_scriptdata+3676+1720
INDIRI4
ARGI4
ADDRLP4 568
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 568
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 824
;824:AddScript(va("set g_randomteleport %i\n", s_scriptdata.server.randomteleport));
ADDRGP4 $1003
ARGP4
ADDRGP4 s_scriptdata+3676+1724
INDIRI4
ARGI4
ADDRLP4 572
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 572
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 825
;825:AddScript(va("set g_falldamagesmall %i\n", s_scriptdata.server.falldamagesmall));
ADDRGP4 $1006
ARGP4
ADDRGP4 s_scriptdata+3676+1728
INDIRI4
ARGI4
ADDRLP4 576
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 576
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 826
;826:AddScript(va("set g_falldamagebig %i\n", s_scriptdata.server.falldamagebig));
ADDRGP4 $1009
ARGP4
ADDRGP4 s_scriptdata+3676+1732
INDIRI4
ARGI4
ADDRLP4 580
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 580
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 827
;827:AddScript(va("set g_waterdamage %i\n", s_scriptdata.server.waterdamage));
ADDRGP4 $1012
ARGP4
ADDRGP4 s_scriptdata+3676+1736
INDIRI4
ARGI4
ADDRLP4 584
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 584
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 828
;828:AddScript(va("set g_lavadamage %i\n", s_scriptdata.server.lavadamage));
ADDRGP4 $1015
ARGP4
ADDRGP4 s_scriptdata+3676+1740
INDIRI4
ARGI4
ADDRLP4 588
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 588
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 829
;829:AddScript(va("set g_slimedamage %i\n", s_scriptdata.server.slimedamage));
ADDRGP4 $1018
ARGP4
ADDRGP4 s_scriptdata+3676+1744
INDIRI4
ARGI4
ADDRLP4 592
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 830
;830:AddScript(va("set g_drowndamage %i\n", s_scriptdata.server.drowndamage));
ADDRGP4 $1021
ARGP4
ADDRGP4 s_scriptdata+3676+1748
INDIRI4
ARGI4
ADDRLP4 596
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 596
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 831
;831:AddScript(va("set g_invulinf %i\n", s_scriptdata.server.invulinf));
ADDRGP4 $1024
ARGP4
ADDRGP4 s_scriptdata+3676+1752
INDIRI4
ARGI4
ADDRLP4 600
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 600
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 832
;832:AddScript(va("set g_invulmove %i\n", s_scriptdata.server.invulmove));
ADDRGP4 $1027
ARGP4
ADDRGP4 s_scriptdata+3676+1756
INDIRI4
ARGI4
ADDRLP4 604
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 833
;833:AddScript(va("set g_invultime %i\n", s_scriptdata.server.invultime));
ADDRGP4 $1030
ARGP4
ADDRGP4 s_scriptdata+3676+1760
INDIRI4
ARGI4
ADDRLP4 608
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 834
;834:AddScript(va("set g_kamikazeinf %i\n", s_scriptdata.server.kamikazeinf));
ADDRGP4 $1033
ARGP4
ADDRGP4 s_scriptdata+3676+1764
INDIRI4
ARGI4
ADDRLP4 612
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 612
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 835
;835:AddScript(va("set g_portalinf %i\n", s_scriptdata.server.portalinf));
ADDRGP4 $1036
ARGP4
ADDRGP4 s_scriptdata+3676+1768
INDIRI4
ARGI4
ADDRLP4 616
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 616
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 836
;836:AddScript(va("set g_portaltimeout %i\n", s_scriptdata.server.portaltimeout));
ADDRGP4 $1039
ARGP4
ADDRGP4 s_scriptdata+3676+1772
INDIRI4
ARGI4
ADDRLP4 620
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 620
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 837
;837:AddScript(va("set g_portalhealth %i\n", s_scriptdata.server.portalhealth));
ADDRGP4 $1042
ARGP4
ADDRGP4 s_scriptdata+3676+1776
INDIRI4
ARGI4
ADDRLP4 624
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 624
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 838
;838:AddScript(va("set g_teleporterinf %i\n", s_scriptdata.server.teleporterinf));
ADDRGP4 $1045
ARGP4
ADDRGP4 s_scriptdata+3676+1780
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 628
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 839
;839:AddScript(va("set g_medkitinf %i\n", s_scriptdata.server.medkitinf));
ADDRGP4 $1048
ARGP4
ADDRGP4 s_scriptdata+3676+1784
INDIRI4
ARGI4
ADDRLP4 632
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 632
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 840
;840:AddScript(va("set g_medkitlimit %i\n", s_scriptdata.server.medkitlimit));
ADDRGP4 $1051
ARGP4
ADDRGP4 s_scriptdata+3676+1788
INDIRI4
ARGI4
ADDRLP4 636
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 636
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 841
;841:AddScript(va("set g_medkitmodifier %i\n", s_scriptdata.server.medkitmodifier));
ADDRGP4 $1054
ARGP4
ADDRGP4 s_scriptdata+3676+1792
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 640
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 842
;842:AddScript(va("set g_fasthealthregen %i\n", s_scriptdata.server.fasthealthregen));
ADDRGP4 $1057
ARGP4
ADDRGP4 s_scriptdata+3676+1796
INDIRI4
ARGI4
ADDRLP4 644
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 644
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 843
;843:AddScript(va("set g_slowhealthregen %i\n", s_scriptdata.server.slowhealthregen));
ADDRGP4 $1060
ARGP4
ADDRGP4 s_scriptdata+3676+1800
INDIRI4
ARGI4
ADDRLP4 648
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 648
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 844
;844:AddScript(va("set g_hastefirespeed \"%s\"\n", s_scriptdata.server.hastefirespeed));
ADDRGP4 $1063
ARGP4
ADDRGP4 s_scriptdata+3676+1804
ARGP4
ADDRLP4 652
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 652
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 845
;845:AddScript(va("set g_quadtime %i\n", s_scriptdata.server.quadtime));
ADDRGP4 $1066
ARGP4
ADDRGP4 s_scriptdata+3676+1836
INDIRI4
ARGI4
ADDRLP4 656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 846
;846:AddScript(va("set g_bsuittime %i\n", s_scriptdata.server.bsuittime));
ADDRGP4 $1069
ARGP4
ADDRGP4 s_scriptdata+3676+1840
INDIRI4
ARGI4
ADDRLP4 660
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 660
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 847
;847:AddScript(va("set g_hastetime %i\n", s_scriptdata.server.hastetime));
ADDRGP4 $1072
ARGP4
ADDRGP4 s_scriptdata+3676+1844
INDIRI4
ARGI4
ADDRLP4 664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 664
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 848
;848:AddScript(va("set g_invistime %i\n", s_scriptdata.server.invistime));
ADDRGP4 $1075
ARGP4
ADDRGP4 s_scriptdata+3676+1848
INDIRI4
ARGI4
ADDRLP4 668
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 668
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 849
;849:AddScript(va("set g_regentime %i\n", s_scriptdata.server.regentime));
ADDRGP4 $1078
ARGP4
ADDRGP4 s_scriptdata+3676+1852
INDIRI4
ARGI4
ADDRLP4 672
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 672
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 850
;850:AddScript(va("set g_flighttime %i\n", s_scriptdata.server.flighttime));
ADDRGP4 $1081
ARGP4
ADDRGP4 s_scriptdata+3676+1856
INDIRI4
ARGI4
ADDRLP4 676
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 676
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 851
;851:AddScript(va("set g_armorrespawn %i\n", s_scriptdata.server.armorrespawn));
ADDRGP4 $1084
ARGP4
ADDRGP4 s_scriptdata+3676+1860
INDIRI4
ARGI4
ADDRLP4 680
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 680
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 852
;852:AddScript(va("set g_healthrespawn %i\n", s_scriptdata.server.healthrespawn));
ADDRGP4 $1087
ARGP4
ADDRGP4 s_scriptdata+3676+1864
INDIRI4
ARGI4
ADDRLP4 684
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 684
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 853
;853:AddScript(va("set g_ammorespawn %i\n", s_scriptdata.server.ammorespawn));
ADDRGP4 $1090
ARGP4
ADDRGP4 s_scriptdata+3676+1868
INDIRI4
ARGI4
ADDRLP4 688
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 688
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 854
;854:AddScript(va("set g_holdablerespawn %i\n", s_scriptdata.server.holdablerespawn));
ADDRGP4 $1093
ARGP4
ADDRGP4 s_scriptdata+3676+1872
INDIRI4
ARGI4
ADDRLP4 692
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 692
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 855
;855:AddScript(va("set g_megahealthrespawn %i\n", s_scriptdata.server.megahealthrespawn));
ADDRGP4 $1096
ARGP4
ADDRGP4 s_scriptdata+3676+1876
INDIRI4
ARGI4
ADDRLP4 696
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 696
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 856
;856:AddScript(va("set g_poweruprespawn %i\n", s_scriptdata.server.poweruprespawn));
ADDRGP4 $1099
ARGP4
ADDRGP4 s_scriptdata+3676+1880
INDIRI4
ARGI4
ADDRLP4 700
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 700
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 857
;857:AddScript(va("set g_weaponrespawn %i\n", s_scriptdata.server.weaponrespawn));
ADDRGP4 $1102
ARGP4
ADDRGP4 s_scriptdata+3676+1884
INDIRI4
ARGI4
ADDRLP4 704
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 704
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 859
;858:// Крюк
;859:AddScript(va("set g_ghspeed %i\n", s_scriptdata.server.g_ghspeed));
ADDRGP4 $1105
ARGP4
ADDRGP4 s_scriptdata+3676+1888
INDIRI4
ARGI4
ADDRLP4 708
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 708
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 860
;860:AddScript(va("set g_ghtimeout %i\n", s_scriptdata.server.g_ghtimeout));
ADDRGP4 $1108
ARGP4
ADDRGP4 s_scriptdata+3676+1892
INDIRI4
ARGI4
ADDRLP4 712
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 712
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 862
;861:// Пила
;862:AddScript(va("set g_gdelay %i\n", s_scriptdata.server.g_gdelay));
ADDRGP4 $1111
ARGP4
ADDRGP4 s_scriptdata+3676+1896
INDIRI4
ARGI4
ADDRLP4 716
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 716
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 863
;863:AddScript(va("set g_gdamage %i\n", s_scriptdata.server.g_gdamage));
ADDRGP4 $1114
ARGP4
ADDRGP4 s_scriptdata+3676+1900
INDIRI4
ARGI4
ADDRLP4 720
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 720
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 864
;864:AddScript(va("set g_grange %i\n", s_scriptdata.server.g_grange));
ADDRGP4 $1117
ARGP4
ADDRGP4 s_scriptdata+3676+1904
INDIRI4
ARGI4
ADDRLP4 724
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 724
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 865
;865:AddScript(va("set g_gknockback  \"%s\"\n", s_scriptdata.server.g_gknockback));
ADDRGP4 $1120
ARGP4
ADDRGP4 s_scriptdata+3676+1908
ARGP4
ADDRLP4 728
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 728
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 867
;866:// Автомат
;867:AddScript(va("set g_mgammocount %i\n", s_scriptdata.server.g_mgammocount));
ADDRGP4 $1123
ARGP4
ADDRGP4 s_scriptdata+3676+1940
INDIRI4
ARGI4
ADDRLP4 732
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 732
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 868
;868:AddScript(va("set g_mgweaponcount %i\n", s_scriptdata.server.g_mgweaponcount));
ADDRGP4 $1126
ARGP4
ADDRGP4 s_scriptdata+3676+1944
INDIRI4
ARGI4
ADDRLP4 736
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 736
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 869
;869:AddScript(va("set g_mgdelay %i\n", s_scriptdata.server.g_mgdelay));
ADDRGP4 $1129
ARGP4
ADDRGP4 s_scriptdata+3676+1948
INDIRI4
ARGI4
ADDRLP4 740
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 740
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 870
;870:AddScript(va("set g_mgdamage %i\n", s_scriptdata.server.g_mgdamage));
ADDRGP4 $1132
ARGP4
ADDRGP4 s_scriptdata+3676+1952
INDIRI4
ARGI4
ADDRLP4 744
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 744
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 871
;871:AddScript(va("set g_mgspread %i\n", s_scriptdata.server.g_mgspread));
ADDRGP4 $1135
ARGP4
ADDRGP4 s_scriptdata+3676+1956
INDIRI4
ARGI4
ADDRLP4 748
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 748
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 872
;872:AddScript(va("set g_mgexplode %i\n", s_scriptdata.server.g_mgexplode));
ADDRGP4 $1138
ARGP4
ADDRGP4 s_scriptdata+3676+1960
INDIRI4
ARGI4
ADDRLP4 752
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 752
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 873
;873:AddScript(va("set g_mgsdamage %i\n", s_scriptdata.server.g_mgsdamage));
ADDRGP4 $1141
ARGP4
ADDRGP4 s_scriptdata+3676+1964
INDIRI4
ARGI4
ADDRLP4 756
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 756
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 874
;874:AddScript(va("set g_mgsradius %i\n", s_scriptdata.server.g_mgsradius));
ADDRGP4 $1144
ARGP4
ADDRGP4 s_scriptdata+3676+1968
INDIRI4
ARGI4
ADDRLP4 760
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 760
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 875
;875:AddScript(va("set g_mgvampire %i\n", s_scriptdata.server.g_mgvampire));
ADDRGP4 $1147
ARGP4
ADDRGP4 s_scriptdata+3676+1972
INDIRI4
ARGI4
ADDRLP4 764
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 764
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 876
;876:AddScript(va("set g_mginf %i\n", s_scriptdata.server.g_mginf));
ADDRGP4 $1150
ARGP4
ADDRGP4 s_scriptdata+3676+1976
INDIRI4
ARGI4
ADDRLP4 768
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 768
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 877
;877:AddScript(va("set g_mgknockback  \"%s\"\n", s_scriptdata.server.g_mgknockback));
ADDRGP4 $1153
ARGP4
ADDRGP4 s_scriptdata+3676+1980
ARGP4
ADDRLP4 772
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 772
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 879
;878:// Дробовик
;879:AddScript(va("set g_sgammocount %i\n", s_scriptdata.server.g_sgammocount));
ADDRGP4 $1156
ARGP4
ADDRGP4 s_scriptdata+3676+2012
INDIRI4
ARGI4
ADDRLP4 776
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 776
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 880
;880:AddScript(va("set g_sgweaponcount %i\n", s_scriptdata.server.g_sgweaponcount));
ADDRGP4 $1159
ARGP4
ADDRGP4 s_scriptdata+3676+2016
INDIRI4
ARGI4
ADDRLP4 780
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 881
;881:AddScript(va("set g_sgdelay %i\n", s_scriptdata.server.g_sgdelay));
ADDRGP4 $1162
ARGP4
ADDRGP4 s_scriptdata+3676+2020
INDIRI4
ARGI4
ADDRLP4 784
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 784
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 882
;882:AddScript(va("set g_sgdamage %i\n", s_scriptdata.server.g_sgdamage));
ADDRGP4 $1165
ARGP4
ADDRGP4 s_scriptdata+3676+2024
INDIRI4
ARGI4
ADDRLP4 788
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 788
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 883
;883:AddScript(va("set g_sgspread %i\n", s_scriptdata.server.g_sgspread));
ADDRGP4 $1168
ARGP4
ADDRGP4 s_scriptdata+3676+2028
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 792
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 884
;884:AddScript(va("set g_sgexplode %i\n", s_scriptdata.server.g_sgexplode));
ADDRGP4 $1171
ARGP4
ADDRGP4 s_scriptdata+3676+2032
INDIRI4
ARGI4
ADDRLP4 796
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 885
;885:AddScript(va("set g_sgsdamage %i\n", s_scriptdata.server.g_sgsdamage));
ADDRGP4 $1174
ARGP4
ADDRGP4 s_scriptdata+3676+2036
INDIRI4
ARGI4
ADDRLP4 800
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 800
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 886
;886:AddScript(va("set g_sgsradius %i\n", s_scriptdata.server.g_sgsradius));
ADDRGP4 $1177
ARGP4
ADDRGP4 s_scriptdata+3676+2040
INDIRI4
ARGI4
ADDRLP4 804
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 804
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 887
;887:AddScript(va("set g_sgcount %i\n", s_scriptdata.server.g_sgcount));
ADDRGP4 $1180
ARGP4
ADDRGP4 s_scriptdata+3676+2044
INDIRI4
ARGI4
ADDRLP4 808
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 808
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 888
;888:AddScript(va("set g_sgvampire %i\n", s_scriptdata.server.g_sgvampire));
ADDRGP4 $1183
ARGP4
ADDRGP4 s_scriptdata+3676+2048
INDIRI4
ARGI4
ADDRLP4 812
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 812
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 889
;889:AddScript(va("set g_sginf %i\n", s_scriptdata.server.g_sginf));
ADDRGP4 $1186
ARGP4
ADDRGP4 s_scriptdata+3676+2052
INDIRI4
ARGI4
ADDRLP4 816
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 816
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 890
;890:AddScript(va("set g_sgknockback  \"%s\"\n", s_scriptdata.server.g_sgknockback));
ADDRGP4 $1189
ARGP4
ADDRGP4 s_scriptdata+3676+2056
ARGP4
ADDRLP4 820
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 820
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 892
;891:// Гранаты
;892:AddScript(va("set g_glammocount %i\n", s_scriptdata.server.g_glammocount));
ADDRGP4 $1192
ARGP4
ADDRGP4 s_scriptdata+3676+2088
INDIRI4
ARGI4
ADDRLP4 824
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 824
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 893
;893:AddScript(va("set g_glweaponcount %i\n", s_scriptdata.server.g_glweaponcount));
ADDRGP4 $1195
ARGP4
ADDRGP4 s_scriptdata+3676+2092
INDIRI4
ARGI4
ADDRLP4 828
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 894
;894:AddScript(va("set g_gldelay %i\n", s_scriptdata.server.g_gldelay));
ADDRGP4 $1198
ARGP4
ADDRGP4 s_scriptdata+3676+2096
INDIRI4
ARGI4
ADDRLP4 832
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 832
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 895
;895:AddScript(va("set g_glspeed %i\n", s_scriptdata.server.g_glspeed));
ADDRGP4 $1201
ARGP4
ADDRGP4 s_scriptdata+3676+2100
INDIRI4
ARGI4
ADDRLP4 836
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 836
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 896
;896:AddScript(va("set g_glbounce %i\n", s_scriptdata.server.g_glbounce));
ADDRGP4 $1204
ARGP4
ADDRGP4 s_scriptdata+3676+2104
INDIRI4
ARGI4
ADDRLP4 840
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 840
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 897
;897:AddScript(va("set g_glgravity %i\n", s_scriptdata.server.g_glgravity));
ADDRGP4 $1207
ARGP4
ADDRGP4 s_scriptdata+3676+2108
INDIRI4
ARGI4
ADDRLP4 844
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 844
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 898
;898:AddScript(va("set g_gltimeout %i\n", s_scriptdata.server.g_gltimeout));
ADDRGP4 $1210
ARGP4
ADDRGP4 s_scriptdata+3676+2112
INDIRI4
ARGI4
ADDRLP4 848
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 848
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 899
;899:AddScript(va("set g_glsradius %i\n", s_scriptdata.server.g_glsradius));
ADDRGP4 $1213
ARGP4
ADDRGP4 s_scriptdata+3676+2116
INDIRI4
ARGI4
ADDRLP4 852
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 852
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 900
;900:AddScript(va("set g_glsdamage %i\n", s_scriptdata.server.g_glsdamage));
ADDRGP4 $1216
ARGP4
ADDRGP4 s_scriptdata+3676+2120
INDIRI4
ARGI4
ADDRLP4 856
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 856
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 901
;901:AddScript(va("set g_gldamage %i\n", s_scriptdata.server.g_gldamage));
ADDRGP4 $1219
ARGP4
ADDRGP4 s_scriptdata+3676+2124
INDIRI4
ARGI4
ADDRLP4 860
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 860
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 902
;902:AddScript(va("set g_glvampire %i\n", s_scriptdata.server.g_glvampire));
ADDRGP4 $1222
ARGP4
ADDRGP4 s_scriptdata+3676+2128
INDIRI4
ARGI4
ADDRLP4 864
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 864
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 903
;903:AddScript(va("set g_glinf %i\n", s_scriptdata.server.g_glinf));
ADDRGP4 $1225
ARGP4
ADDRGP4 s_scriptdata+3676+2132
INDIRI4
ARGI4
ADDRLP4 868
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 868
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 904
;904:AddScript(va("set g_glbouncemodifier  \"%s\"\n", s_scriptdata.server.g_glbouncemodifier));
ADDRGP4 $1228
ARGP4
ADDRGP4 s_scriptdata+3676+2136
ARGP4
ADDRLP4 872
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 872
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 905
;905:AddScript(va("set g_glknockback  \"%s\"\n", s_scriptdata.server.g_glknockback));
ADDRGP4 $1231
ARGP4
ADDRGP4 s_scriptdata+3676+2168
ARGP4
ADDRLP4 876
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 876
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 906
;906:AddScript(va("set g_glhoming %i\n", s_scriptdata.server.g_glhoming));
ADDRGP4 $1234
ARGP4
ADDRGP4 s_scriptdata+3676+2200
INDIRI4
ARGI4
ADDRLP4 880
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 880
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 907
;907:AddScript(va("set g_glguided %i\n", s_scriptdata.server.g_glguided));
ADDRGP4 $1237
ARGP4
ADDRGP4 s_scriptdata+3676+2204
INDIRI4
ARGI4
ADDRLP4 884
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 884
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 909
;908:// Ракеты
;909:AddScript(va("set g_rlammocount %i\n", s_scriptdata.server.g_rlammocount));
ADDRGP4 $1240
ARGP4
ADDRGP4 s_scriptdata+3676+2208
INDIRI4
ARGI4
ADDRLP4 888
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 888
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 910
;910:AddScript(va("set g_rlweaponcount %i\n", s_scriptdata.server.g_rlweaponcount));
ADDRGP4 $1243
ARGP4
ADDRGP4 s_scriptdata+3676+2212
INDIRI4
ARGI4
ADDRLP4 892
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 892
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 911
;911:AddScript(va("set g_rldelay %i\n", s_scriptdata.server.g_rldelay));
ADDRGP4 $1246
ARGP4
ADDRGP4 s_scriptdata+3676+2216
INDIRI4
ARGI4
ADDRLP4 896
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 896
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 912
;912:AddScript(va("set g_rlspeed %i\n", s_scriptdata.server.g_rlspeed));
ADDRGP4 $1249
ARGP4
ADDRGP4 s_scriptdata+3676+2220
INDIRI4
ARGI4
ADDRLP4 900
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 900
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 913
;913:AddScript(va("set g_rlbounce %i\n", s_scriptdata.server.g_rlbounce));
ADDRGP4 $1252
ARGP4
ADDRGP4 s_scriptdata+3676+2224
INDIRI4
ARGI4
ADDRLP4 904
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 904
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 914
;914:AddScript(va("set g_rlgravity %i\n", s_scriptdata.server.g_rlgravity));
ADDRGP4 $1255
ARGP4
ADDRGP4 s_scriptdata+3676+2228
INDIRI4
ARGI4
ADDRLP4 908
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 908
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 915
;915:AddScript(va("set g_rltimeout %i\n", s_scriptdata.server.g_rltimeout));
ADDRGP4 $1258
ARGP4
ADDRGP4 s_scriptdata+3676+2232
INDIRI4
ARGI4
ADDRLP4 912
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 912
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 916
;916:AddScript(va("set g_rlsradius %i\n", s_scriptdata.server.g_rlsradius));
ADDRGP4 $1261
ARGP4
ADDRGP4 s_scriptdata+3676+2236
INDIRI4
ARGI4
ADDRLP4 916
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 916
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 917
;917:AddScript(va("set g_rlsdamage %i\n", s_scriptdata.server.g_rlsdamage));
ADDRGP4 $1264
ARGP4
ADDRGP4 s_scriptdata+3676+2240
INDIRI4
ARGI4
ADDRLP4 920
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 920
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 918
;918:AddScript(va("set g_rldamage %i\n", s_scriptdata.server.g_rldamage));
ADDRGP4 $1267
ARGP4
ADDRGP4 s_scriptdata+3676+2244
INDIRI4
ARGI4
ADDRLP4 924
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 924
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 919
;919:AddScript(va("set g_rlvampire %i\n", s_scriptdata.server.g_rlvampire));
ADDRGP4 $1270
ARGP4
ADDRGP4 s_scriptdata+3676+2248
INDIRI4
ARGI4
ADDRLP4 928
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 928
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 920
;920:AddScript(va("set g_rlinf %i\n", s_scriptdata.server.g_rlinf));
ADDRGP4 $1273
ARGP4
ADDRGP4 s_scriptdata+3676+2252
INDIRI4
ARGI4
ADDRLP4 932
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 932
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 921
;921:AddScript(va("set g_rlbouncemodifier  \"%s\"\n", s_scriptdata.server.g_rlbouncemodifier));
ADDRGP4 $1276
ARGP4
ADDRGP4 s_scriptdata+3676+2256
ARGP4
ADDRLP4 936
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 936
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 922
;922:AddScript(va("set g_rlknockback  \"%s\"\n", s_scriptdata.server.g_rlknockback));
ADDRGP4 $1279
ARGP4
ADDRGP4 s_scriptdata+3676+2288
ARGP4
ADDRLP4 940
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 940
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 923
;923:AddScript(va("set g_rlhoming %i\n", s_scriptdata.server.g_rlhoming));
ADDRGP4 $1282
ARGP4
ADDRGP4 s_scriptdata+3676+2320
INDIRI4
ARGI4
ADDRLP4 944
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 944
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 924
;924:AddScript(va("set g_rlguided %i\n", s_scriptdata.server.g_rlguided));
ADDRGP4 $1285
ARGP4
ADDRGP4 s_scriptdata+3676+2324
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 948
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 926
;925:// Молния
;926:AddScript(va("set g_lgammocount %i\n", s_scriptdata.server.g_lgammocount));
ADDRGP4 $1288
ARGP4
ADDRGP4 s_scriptdata+3676+2328
INDIRI4
ARGI4
ADDRLP4 952
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 952
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 927
;927:AddScript(va("set g_lgweaponcount %i\n", s_scriptdata.server.g_lgweaponcount));
ADDRGP4 $1291
ARGP4
ADDRGP4 s_scriptdata+3676+2332
INDIRI4
ARGI4
ADDRLP4 956
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 956
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 928
;928:AddScript(va("set g_lgrange %i\n", s_scriptdata.server.g_lgrange));
ADDRGP4 $1294
ARGP4
ADDRGP4 s_scriptdata+3676+2336
INDIRI4
ARGI4
ADDRLP4 960
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 960
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 929
;929:AddScript(va("set g_lgdelay %i\n", s_scriptdata.server.g_lgdelay));
ADDRGP4 $1297
ARGP4
ADDRGP4 s_scriptdata+3676+2340
INDIRI4
ARGI4
ADDRLP4 964
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 964
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 930
;930:AddScript(va("set g_lgdamage %i\n", s_scriptdata.server.g_lgdamage));
ADDRGP4 $1300
ARGP4
ADDRGP4 s_scriptdata+3676+2344
INDIRI4
ARGI4
ADDRLP4 968
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 931
;931:AddScript(va("set g_lgvampire %i\n", s_scriptdata.server.g_lgvampire));
ADDRGP4 $1303
ARGP4
ADDRGP4 s_scriptdata+3676+2348
INDIRI4
ARGI4
ADDRLP4 972
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 972
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 932
;932:AddScript(va("set g_lgexplode %i\n", s_scriptdata.server.g_lgexplode));
ADDRGP4 $1306
ARGP4
ADDRGP4 s_scriptdata+3676+2352
INDIRI4
ARGI4
ADDRLP4 976
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 976
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 933
;933:AddScript(va("set g_lgsdamage %i\n", s_scriptdata.server.g_lgsdamage));
ADDRGP4 $1309
ARGP4
ADDRGP4 s_scriptdata+3676+2356
INDIRI4
ARGI4
ADDRLP4 980
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 980
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 934
;934:AddScript(va("set g_lgsradius %i\n", s_scriptdata.server.g_lgsradius));
ADDRGP4 $1312
ARGP4
ADDRGP4 s_scriptdata+3676+2360
INDIRI4
ARGI4
ADDRLP4 984
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 984
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 935
;935:AddScript(va("set g_lginf %i\n", s_scriptdata.server.g_lginf));
ADDRGP4 $1315
ARGP4
ADDRGP4 s_scriptdata+3676+2364
INDIRI4
ARGI4
ADDRLP4 988
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 988
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 936
;936:AddScript(va("set g_lgknockback  \"%s\"\n", s_scriptdata.server.g_lgknockback));
ADDRGP4 $1318
ARGP4
ADDRGP4 s_scriptdata+3676+2368
ARGP4
ADDRLP4 992
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 992
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 938
;937:// Рэйлган
;938:AddScript(va("set g_rgammocount %i\n", s_scriptdata.server.g_rgammocount));
ADDRGP4 $1321
ARGP4
ADDRGP4 s_scriptdata+3676+2400
INDIRI4
ARGI4
ADDRLP4 996
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 939
;939:AddScript(va("set g_rgweaponcount %i\n", s_scriptdata.server.g_rgweaponcount));
ADDRGP4 $1324
ARGP4
ADDRGP4 s_scriptdata+3676+2404
INDIRI4
ARGI4
ADDRLP4 1000
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 940
;940:AddScript(va("set g_rgdelay %i\n", s_scriptdata.server.g_rgdelay));
ADDRGP4 $1327
ARGP4
ADDRGP4 s_scriptdata+3676+2408
INDIRI4
ARGI4
ADDRLP4 1004
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 941
;941:AddScript(va("set g_rgdamage %i\n", s_scriptdata.server.g_rgdamage));
ADDRGP4 $1330
ARGP4
ADDRGP4 s_scriptdata+3676+2412
INDIRI4
ARGI4
ADDRLP4 1008
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1008
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 942
;942:AddScript(va("set g_rgvampire %i\n", s_scriptdata.server.g_rgvampire));
ADDRGP4 $1333
ARGP4
ADDRGP4 s_scriptdata+3676+2416
INDIRI4
ARGI4
ADDRLP4 1012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1012
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 943
;943:AddScript(va("set g_rginf %i\n", s_scriptdata.server.g_rginf));
ADDRGP4 $1336
ARGP4
ADDRGP4 s_scriptdata+3676+2420
INDIRI4
ARGI4
ADDRLP4 1016
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 944
;944:AddScript(va("set g_rgknockback  \"%s\"\n", s_scriptdata.server.g_rgknockback));
ADDRGP4 $1339
ARGP4
ADDRGP4 s_scriptdata+3676+2424
ARGP4
ADDRLP4 1020
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1020
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 946
;945:// Плазмаган
;946:AddScript(va("set g_pgammocount %i\n", s_scriptdata.server.g_pgammocount));
ADDRGP4 $1342
ARGP4
ADDRGP4 s_scriptdata+3676+2456
INDIRI4
ARGI4
ADDRLP4 1024
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 947
;947:AddScript(va("set g_pgweaponcount %i\n", s_scriptdata.server.g_pgweaponcount));
ADDRGP4 $1345
ARGP4
ADDRGP4 s_scriptdata+3676+2460
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 948
;948:AddScript(va("set g_pgdelay %i\n", s_scriptdata.server.g_pgdelay));
ADDRGP4 $1348
ARGP4
ADDRGP4 s_scriptdata+3676+2464
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 949
;949:AddScript(va("set g_pgspeed %i\n", s_scriptdata.server.g_pgspeed));
ADDRGP4 $1351
ARGP4
ADDRGP4 s_scriptdata+3676+2468
INDIRI4
ARGI4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 950
;950:AddScript(va("set g_pgbounce %i\n", s_scriptdata.server.g_pgbounce));
ADDRGP4 $1354
ARGP4
ADDRGP4 s_scriptdata+3676+2472
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 951
;951:AddScript(va("set g_pggravity %i\n", s_scriptdata.server.g_pggravity));
ADDRGP4 $1357
ARGP4
ADDRGP4 s_scriptdata+3676+2476
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 952
;952:AddScript(va("set g_pgtimeout %i\n", s_scriptdata.server.g_pgtimeout));
ADDRGP4 $1360
ARGP4
ADDRGP4 s_scriptdata+3676+2480
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 953
;953:AddScript(va("set g_pgsradius %i\n", s_scriptdata.server.g_pgsradius));
ADDRGP4 $1363
ARGP4
ADDRGP4 s_scriptdata+3676+2484
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 954
;954:AddScript(va("set g_pgsdamage %i\n", s_scriptdata.server.g_pgsdamage));
ADDRGP4 $1366
ARGP4
ADDRGP4 s_scriptdata+3676+2488
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 955
;955:AddScript(va("set g_pgdamage %i\n", s_scriptdata.server.g_pgdamage));
ADDRGP4 $1369
ARGP4
ADDRGP4 s_scriptdata+3676+2492
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 956
;956:AddScript(va("set g_pgvampire %i\n", s_scriptdata.server.g_pgvampire));
ADDRGP4 $1372
ARGP4
ADDRGP4 s_scriptdata+3676+2496
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 957
;957:AddScript(va("set g_pginf %i\n", s_scriptdata.server.g_pginf));
ADDRGP4 $1375
ARGP4
ADDRGP4 s_scriptdata+3676+2500
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 958
;958:AddScript(va("set g_pgbouncemodifier  \"%s\"\n", s_scriptdata.server.g_pgbouncemodifier));
ADDRGP4 $1378
ARGP4
ADDRGP4 s_scriptdata+3676+2504
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 959
;959:AddScript(va("set g_pgknockback  \"%s\"\n", s_scriptdata.server.g_pgknockback));
ADDRGP4 $1381
ARGP4
ADDRGP4 s_scriptdata+3676+2536
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 960
;960:AddScript(va("set g_pghoming %i\n", s_scriptdata.server.g_pghoming));
ADDRGP4 $1384
ARGP4
ADDRGP4 s_scriptdata+3676+2568
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 961
;961:AddScript(va("set g_pgguided %i\n", s_scriptdata.server.g_pgguided));
ADDRGP4 $1387
ARGP4
ADDRGP4 s_scriptdata+3676+2572
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 963
;962:// Бфг
;963:AddScript(va("set g_bfgammocount %i\n", s_scriptdata.server.g_bfgammocount));
ADDRGP4 $1390
ARGP4
ADDRGP4 s_scriptdata+3676+2576
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 964
;964:AddScript(va("set g_bfgweaponcount %i\n", s_scriptdata.server.g_bfgweaponcount));
ADDRGP4 $1393
ARGP4
ADDRGP4 s_scriptdata+3676+2580
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 965
;965:AddScript(va("set g_bfgdelay %i\n", s_scriptdata.server.g_bfgdelay));
ADDRGP4 $1396
ARGP4
ADDRGP4 s_scriptdata+3676+2584
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 966
;966:AddScript(va("set g_bfgspeed %i\n", s_scriptdata.server.g_bfgspeed));
ADDRGP4 $1399
ARGP4
ADDRGP4 s_scriptdata+3676+2588
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 967
;967:AddScript(va("set g_bfgbounce %i\n", s_scriptdata.server.g_bfgbounce));
ADDRGP4 $1402
ARGP4
ADDRGP4 s_scriptdata+3676+2592
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 968
;968:AddScript(va("set g_bfggravity %i\n", s_scriptdata.server.g_bfggravity));
ADDRGP4 $1405
ARGP4
ADDRGP4 s_scriptdata+3676+2596
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 969
;969:AddScript(va("set g_bfgtimeout %i\n", s_scriptdata.server.g_bfgtimeout));
ADDRGP4 $1408
ARGP4
ADDRGP4 s_scriptdata+3676+2600
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 970
;970:AddScript(va("set g_bfgsradius %i\n", s_scriptdata.server.g_bfgsradius));
ADDRGP4 $1411
ARGP4
ADDRGP4 s_scriptdata+3676+2604
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 971
;971:AddScript(va("set g_bfgsdamage %i\n", s_scriptdata.server.g_bfgsdamage));
ADDRGP4 $1414
ARGP4
ADDRGP4 s_scriptdata+3676+2608
INDIRI4
ARGI4
ADDRLP4 1120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 972
;972:AddScript(va("set g_bfgdamage %i\n", s_scriptdata.server.g_bfgdamage));
ADDRGP4 $1417
ARGP4
ADDRGP4 s_scriptdata+3676+2612
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 973
;973:AddScript(va("set g_bfgvampire %i\n", s_scriptdata.server.g_bfgvampire));
ADDRGP4 $1420
ARGP4
ADDRGP4 s_scriptdata+3676+2616
INDIRI4
ARGI4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 974
;974:AddScript(va("set g_bfginf %i\n", s_scriptdata.server.g_bfginf));
ADDRGP4 $1423
ARGP4
ADDRGP4 s_scriptdata+3676+2620
INDIRI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 975
;975:AddScript(va("set g_bfgbouncemodifier  \"%s\"\n", s_scriptdata.server.g_bfgbouncemodifier));
ADDRGP4 $1426
ARGP4
ADDRGP4 s_scriptdata+3676+2624
ARGP4
ADDRLP4 1136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 976
;976:AddScript(va("set g_bfgknockback  \"%s\"\n", s_scriptdata.server.g_bfgknockback));
ADDRGP4 $1429
ARGP4
ADDRGP4 s_scriptdata+3676+2656
ARGP4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 977
;977:AddScript(va("set g_bfghoming %i\n", s_scriptdata.server.g_bfghoming));
ADDRGP4 $1432
ARGP4
ADDRGP4 s_scriptdata+3676+2688
INDIRI4
ARGI4
ADDRLP4 1144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 978
;978:AddScript(va("set g_bfgguided %i\n", s_scriptdata.server.g_bfgguided));
ADDRGP4 $1435
ARGP4
ADDRGP4 s_scriptdata+3676+2692
INDIRI4
ARGI4
ADDRLP4 1148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 980
;979:// Гвоздомёт
;980:AddScript(va("set g_ngammocount %i\n", s_scriptdata.server.g_ngammocount));
ADDRGP4 $1438
ARGP4
ADDRGP4 s_scriptdata+3676+2696
INDIRI4
ARGI4
ADDRLP4 1152
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 981
;981:AddScript(va("set g_ngweaponcount %i\n", s_scriptdata.server.g_ngweaponcount));
ADDRGP4 $1441
ARGP4
ADDRGP4 s_scriptdata+3676+2700
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 982
;982:AddScript(va("set g_ngdelay %i\n", s_scriptdata.server.g_ngdelay));
ADDRGP4 $1444
ARGP4
ADDRGP4 s_scriptdata+3676+2704
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 983
;983:AddScript(va("set g_ngspeed %i\n", s_scriptdata.server.g_ngspeed));
ADDRGP4 $1447
ARGP4
ADDRGP4 s_scriptdata+3676+2708
INDIRI4
ARGI4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 984
;984:AddScript(va("set g_ngbounce %i\n", s_scriptdata.server.g_ngbounce));
ADDRGP4 $1450
ARGP4
ADDRGP4 s_scriptdata+3676+2712
INDIRI4
ARGI4
ADDRLP4 1168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 985
;985:AddScript(va("set g_nggravity %i\n", s_scriptdata.server.g_nggravity));
ADDRGP4 $1453
ARGP4
ADDRGP4 s_scriptdata+3676+2716
INDIRI4
ARGI4
ADDRLP4 1172
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 986
;986:AddScript(va("set g_ngtimeout %i\n", s_scriptdata.server.g_ngtimeout));
ADDRGP4 $1456
ARGP4
ADDRGP4 s_scriptdata+3676+2720
INDIRI4
ARGI4
ADDRLP4 1176
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 987
;987:AddScript(va("set g_ngcount %i\n", s_scriptdata.server.g_ngcount));
ADDRGP4 $1459
ARGP4
ADDRGP4 s_scriptdata+3676+2724
INDIRI4
ARGI4
ADDRLP4 1180
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 988
;988:AddScript(va("set g_ngspread %i\n", s_scriptdata.server.g_ngspread));
ADDRGP4 $1462
ARGP4
ADDRGP4 s_scriptdata+3676+2728
INDIRI4
ARGI4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 989
;989:AddScript(va("set g_ngdamage %i\n", s_scriptdata.server.g_ngdamage));
ADDRGP4 $1465
ARGP4
ADDRGP4 s_scriptdata+3676+2732
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 990
;990:AddScript(va("set g_ngrandom %i\n", s_scriptdata.server.g_ngrandom));
ADDRGP4 $1468
ARGP4
ADDRGP4 s_scriptdata+3676+2736
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 991
;991:AddScript(va("set g_ngvampire %i\n", s_scriptdata.server.g_ngvampire));
ADDRGP4 $1471
ARGP4
ADDRGP4 s_scriptdata+3676+2740
INDIRI4
ARGI4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 992
;992:AddScript(va("set g_nginf %i\n", s_scriptdata.server.g_nginf));
ADDRGP4 $1474
ARGP4
ADDRGP4 s_scriptdata+3676+2744
INDIRI4
ARGI4
ADDRLP4 1200
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 993
;993:AddScript(va("set g_ngbouncemodifier  \"%s\"\n", s_scriptdata.server.g_ngbouncemodifier));
ADDRGP4 $1477
ARGP4
ADDRGP4 s_scriptdata+3676+2748
ARGP4
ADDRLP4 1204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 994
;994:AddScript(va("set g_ngknockback  \"%s\"\n", s_scriptdata.server.g_ngknockback));
ADDRGP4 $1480
ARGP4
ADDRGP4 s_scriptdata+3676+2780
ARGP4
ADDRLP4 1208
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 995
;995:AddScript(va("set g_nghoming %i\n", s_scriptdata.server.g_nghoming));
ADDRGP4 $1483
ARGP4
ADDRGP4 s_scriptdata+3676+2812
INDIRI4
ARGI4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 996
;996:AddScript(va("set g_ngguided %i\n", s_scriptdata.server.g_ngguided));
ADDRGP4 $1486
ARGP4
ADDRGP4 s_scriptdata+3676+2816
INDIRI4
ARGI4
ADDRLP4 1216
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 998
;997:// Мины
;998:AddScript(va("set g_plammocount %i\n", s_scriptdata.server.g_plammocount));
ADDRGP4 $1489
ARGP4
ADDRGP4 s_scriptdata+3676+2820
INDIRI4
ARGI4
ADDRLP4 1220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 999
;999:AddScript(va("set g_plweaponcount %i\n", s_scriptdata.server.g_plweaponcount));
ADDRGP4 $1492
ARGP4
ADDRGP4 s_scriptdata+3676+2824
INDIRI4
ARGI4
ADDRLP4 1224
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1000
;1000:AddScript(va("set g_pldelay %i\n", s_scriptdata.server.g_pldelay));
ADDRGP4 $1495
ARGP4
ADDRGP4 s_scriptdata+3676+2828
INDIRI4
ARGI4
ADDRLP4 1228
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1001
;1001:AddScript(va("set g_plspeed %i\n", s_scriptdata.server.g_plspeed));
ADDRGP4 $1498
ARGP4
ADDRGP4 s_scriptdata+3676+2832
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1002
;1002:AddScript(va("set g_plgravity %i\n", s_scriptdata.server.g_plgravity));
ADDRGP4 $1501
ARGP4
ADDRGP4 s_scriptdata+3676+2836
INDIRI4
ARGI4
ADDRLP4 1236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1003
;1003:AddScript(va("set g_pltimeout %i\n", s_scriptdata.server.g_pltimeout));
ADDRGP4 $1504
ARGP4
ADDRGP4 s_scriptdata+3676+2840
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1004
;1004:AddScript(va("set g_plsradius %i\n", s_scriptdata.server.g_plsradius));
ADDRGP4 $1507
ARGP4
ADDRGP4 s_scriptdata+3676+2844
INDIRI4
ARGI4
ADDRLP4 1244
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1244
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1005
;1005:AddScript(va("set g_plsdamage %i\n", s_scriptdata.server.g_plsdamage));
ADDRGP4 $1510
ARGP4
ADDRGP4 s_scriptdata+3676+2848
INDIRI4
ARGI4
ADDRLP4 1248
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1248
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1006
;1006:AddScript(va("set g_pldamage %i\n", s_scriptdata.server.g_pldamage));
ADDRGP4 $1513
ARGP4
ADDRGP4 s_scriptdata+3676+2852
INDIRI4
ARGI4
ADDRLP4 1252
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1007
;1007:AddScript(va("set g_plvampire %i\n", s_scriptdata.server.g_plvampire));
ADDRGP4 $1516
ARGP4
ADDRGP4 s_scriptdata+3676+2856
INDIRI4
ARGI4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1008
;1008:AddScript(va("set g_plinf %i\n", s_scriptdata.server.g_plinf));
ADDRGP4 $1519
ARGP4
ADDRGP4 s_scriptdata+3676+2860
INDIRI4
ARGI4
ADDRLP4 1260
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1009
;1009:AddScript(va("set g_plknockback  \"%s\"\n", s_scriptdata.server.g_plknockback));
ADDRGP4 $1522
ARGP4
ADDRGP4 s_scriptdata+3676+2864
ARGP4
ADDRLP4 1264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1011
;1010:// Пулемёт
;1011:AddScript(va("set g_cgammocount %i\n", s_scriptdata.server.g_cgammocount));
ADDRGP4 $1525
ARGP4
ADDRGP4 s_scriptdata+3676+2896
INDIRI4
ARGI4
ADDRLP4 1268
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1012
;1012:AddScript(va("set g_cgweaponcount %i\n", s_scriptdata.server.g_cgweaponcount));
ADDRGP4 $1528
ARGP4
ADDRGP4 s_scriptdata+3676+2900
INDIRI4
ARGI4
ADDRLP4 1272
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1013
;1013:AddScript(va("set g_cgdelay %i\n", s_scriptdata.server.g_cgdelay));
ADDRGP4 $1531
ARGP4
ADDRGP4 s_scriptdata+3676+2904
INDIRI4
ARGI4
ADDRLP4 1276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1014
;1014:AddScript(va("set g_cgspread %i\n", s_scriptdata.server.g_cgspread));
ADDRGP4 $1534
ARGP4
ADDRGP4 s_scriptdata+3676+2908
INDIRI4
ARGI4
ADDRLP4 1280
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1280
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1015
;1015:AddScript(va("set g_cgdamage %i\n", s_scriptdata.server.g_cgdamage));
ADDRGP4 $1537
ARGP4
ADDRGP4 s_scriptdata+3676+2912
INDIRI4
ARGI4
ADDRLP4 1284
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1016
;1016:AddScript(va("set g_cgvampire %i\n", s_scriptdata.server.g_cgvampire));
ADDRGP4 $1540
ARGP4
ADDRGP4 s_scriptdata+3676+2916
INDIRI4
ARGI4
ADDRLP4 1288
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1017
;1017:AddScript(va("set g_cginf %i\n", s_scriptdata.server.g_cginf));
ADDRGP4 $1543
ARGP4
ADDRGP4 s_scriptdata+3676+2920
INDIRI4
ARGI4
ADDRLP4 1292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1018
;1018:AddScript(va("set g_cgknockback  \"%s\"\n", s_scriptdata.server.g_cgknockback));
ADDRGP4 $1546
ARGP4
ADDRGP4 s_scriptdata+3676+2924
ARGP4
ADDRLP4 1296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1296
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1020
;1019:// Огнемёт
;1020:AddScript(va("set g_ftammocount %i\n", s_scriptdata.server.g_ftammocount));
ADDRGP4 $1549
ARGP4
ADDRGP4 s_scriptdata+3676+2956
INDIRI4
ARGI4
ADDRLP4 1300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1021
;1021:AddScript(va("set g_ftweaponcount %i\n", s_scriptdata.server.g_ftweaponcount));
ADDRGP4 $1552
ARGP4
ADDRGP4 s_scriptdata+3676+2960
INDIRI4
ARGI4
ADDRLP4 1304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1022
;1022:AddScript(va("set g_ftdelay %i\n", s_scriptdata.server.g_ftdelay));
ADDRGP4 $1555
ARGP4
ADDRGP4 s_scriptdata+3676+2964
INDIRI4
ARGI4
ADDRLP4 1308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1308
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1023
;1023:AddScript(va("set g_ftspeed %i\n", s_scriptdata.server.g_ftspeed));
ADDRGP4 $1558
ARGP4
ADDRGP4 s_scriptdata+3676+2968
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1312
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1024
;1024:AddScript(va("set g_ftbounce %i\n", s_scriptdata.server.g_ftbounce));
ADDRGP4 $1561
ARGP4
ADDRGP4 s_scriptdata+3676+2972
INDIRI4
ARGI4
ADDRLP4 1316
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1316
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1025
;1025:AddScript(va("set g_ftgravity %i\n", s_scriptdata.server.g_ftgravity));
ADDRGP4 $1564
ARGP4
ADDRGP4 s_scriptdata+3676+2976
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1026
;1026:AddScript(va("set g_fttimeout %i\n", s_scriptdata.server.g_fttimeout));
ADDRGP4 $1567
ARGP4
ADDRGP4 s_scriptdata+3676+2980
INDIRI4
ARGI4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1027
;1027:AddScript(va("set g_ftsradius %i\n", s_scriptdata.server.g_ftsradius));
ADDRGP4 $1570
ARGP4
ADDRGP4 s_scriptdata+3676+2984
INDIRI4
ARGI4
ADDRLP4 1328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1028
;1028:AddScript(va("set g_ftsdamage %i\n", s_scriptdata.server.g_ftsdamage));
ADDRGP4 $1573
ARGP4
ADDRGP4 s_scriptdata+3676+2988
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1332
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1029
;1029:AddScript(va("set g_ftdamage %i\n", s_scriptdata.server.g_ftdamage));
ADDRGP4 $1576
ARGP4
ADDRGP4 s_scriptdata+3676+2992
INDIRI4
ARGI4
ADDRLP4 1336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1336
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1030
;1030:AddScript(va("set g_ftvampire %i\n", s_scriptdata.server.g_ftvampire));
ADDRGP4 $1579
ARGP4
ADDRGP4 s_scriptdata+3676+2996
INDIRI4
ARGI4
ADDRLP4 1340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1340
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1031
;1031:AddScript(va("set g_ftinf %i\n", s_scriptdata.server.g_ftinf));
ADDRGP4 $1582
ARGP4
ADDRGP4 s_scriptdata+3676+3000
INDIRI4
ARGI4
ADDRLP4 1344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1344
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1032
;1032:AddScript(va("set g_ftbouncemodifier  \"%s\"\n", s_scriptdata.server.g_ftbouncemodifier));
ADDRGP4 $1585
ARGP4
ADDRGP4 s_scriptdata+3676+3004
ARGP4
ADDRLP4 1348
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1348
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1033
;1033:AddScript(va("set g_ftknockback  \"%s\"\n", s_scriptdata.server.g_ftknockback));
ADDRGP4 $1588
ARGP4
ADDRGP4 s_scriptdata+3676+3036
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1034
;1034:AddScript(va("set g_fthoming %i\n", s_scriptdata.server.g_fthoming));
ADDRGP4 $1591
ARGP4
ADDRGP4 s_scriptdata+3676+3068
INDIRI4
ARGI4
ADDRLP4 1356
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1356
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1035
;1035:AddScript(va("set g_ftguided %i\n", s_scriptdata.server.g_ftguided));
ADDRGP4 $1594
ARGP4
ADDRGP4 s_scriptdata+3676+3072
INDIRI4
ARGI4
ADDRLP4 1360
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1037
;1036:// Антиматтер
;1037:AddScript(va("set g_amweaponcount %i\n", s_scriptdata.server.g_amweaponcount));
ADDRGP4 $1597
ARGP4
ADDRGP4 s_scriptdata+3676+3076
INDIRI4
ARGI4
ADDRLP4 1364
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1364
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1038
;1038:AddScript(va("set g_amdelay %i\n", s_scriptdata.server.g_amdelay));
ADDRGP4 $1600
ARGP4
ADDRGP4 s_scriptdata+3676+3080
INDIRI4
ARGI4
ADDRLP4 1368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1368
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1039
;1039:AddScript(va("set g_amspeed %i\n", s_scriptdata.server.g_amspeed));
ADDRGP4 $1603
ARGP4
ADDRGP4 s_scriptdata+3676+3084
INDIRI4
ARGI4
ADDRLP4 1372
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1040
;1040:AddScript(va("set g_ambounce %i\n", s_scriptdata.server.g_ambounce));
ADDRGP4 $1606
ARGP4
ADDRGP4 s_scriptdata+3676+3088
INDIRI4
ARGI4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1041
;1041:AddScript(va("set g_amgravity %i\n", s_scriptdata.server.g_amgravity));
ADDRGP4 $1609
ARGP4
ADDRGP4 s_scriptdata+3676+3092
INDIRI4
ARGI4
ADDRLP4 1380
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1380
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1042
;1042:AddScript(va("set g_amtimeout %i\n", s_scriptdata.server.g_amtimeout));
ADDRGP4 $1612
ARGP4
ADDRGP4 s_scriptdata+3676+3096
INDIRI4
ARGI4
ADDRLP4 1384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1384
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1043
;1043:AddScript(va("set g_amsradius %i\n", s_scriptdata.server.g_amsradius));
ADDRGP4 $1615
ARGP4
ADDRGP4 s_scriptdata+3676+3100
INDIRI4
ARGI4
ADDRLP4 1388
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1388
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1044
;1044:AddScript(va("set g_amsdamage %i\n", s_scriptdata.server.g_amsdamage));
ADDRGP4 $1618
ARGP4
ADDRGP4 s_scriptdata+3676+3104
INDIRI4
ARGI4
ADDRLP4 1392
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1392
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1045
;1045:AddScript(va("set g_amdamage %i\n", s_scriptdata.server.g_amdamage));
ADDRGP4 $1621
ARGP4
ADDRGP4 s_scriptdata+3676+3108
INDIRI4
ARGI4
ADDRLP4 1396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1396
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1046
;1046:AddScript(va("set g_amvampire %i\n", s_scriptdata.server.g_amvampire));
ADDRGP4 $1624
ARGP4
ADDRGP4 s_scriptdata+3676+3112
INDIRI4
ARGI4
ADDRLP4 1400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1400
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1047
;1047:AddScript(va("set g_aminf %i\n", s_scriptdata.server.g_aminf));
ADDRGP4 $1627
ARGP4
ADDRGP4 s_scriptdata+3676+3116
INDIRI4
ARGI4
ADDRLP4 1404
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1404
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1048
;1048:AddScript(va("set g_ambouncemodifier  \"%s\"\n", s_scriptdata.server.g_ambouncemodifier));
ADDRGP4 $1630
ARGP4
ADDRGP4 s_scriptdata+3676+3120
ARGP4
ADDRLP4 1408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1408
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1049
;1049:AddScript(va("set g_amknockback  \"%s\"\n", s_scriptdata.server.g_amknockback));
ADDRGP4 $1633
ARGP4
ADDRGP4 s_scriptdata+3676+3152
ARGP4
ADDRLP4 1412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1412
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1050
;1050:AddScript(va("set g_amhoming %i\n", s_scriptdata.server.g_amhoming));
ADDRGP4 $1636
ARGP4
ADDRGP4 s_scriptdata+3676+3184
INDIRI4
ARGI4
ADDRLP4 1416
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1416
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1051
;1051:AddScript(va("set g_amguided %i\n", s_scriptdata.server.g_amguided));
ADDRGP4 $1639
ARGP4
ADDRGP4 s_scriptdata+3676+3188
INDIRI4
ARGI4
ADDRLP4 1420
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1420
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1053
;1052:
;1053:	if (s_scriptdata.server.allowWarmup) {
ADDRGP4 s_scriptdata+3676+124
INDIRI4
CNSTI4 0
EQI4 $1642
line 1054
;1054:		value = s_scriptdata.server.warmupTime;
ADDRLP4 4
ADDRGP4 s_scriptdata+3676+128
INDIRI4
ASGNI4
line 1055
;1055:		if (value == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1648
line 1056
;1056:			AddScript(va("set g_doWarmup 0\n"));
ADDRGP4 $1650
ARGP4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1424
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1057
;1057:		}
ADDRGP4 $1643
JUMPV
LABELV $1648
line 1058
;1058:		else {
line 1059
;1059:			AddScript(va("set g_doWarmup 1\n"));
ADDRGP4 $1651
ARGP4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1424
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1060
;1060:			AddScript(va("set g_warmup %i\n", value));
ADDRGP4 $1652
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1428
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1061
;1061:		}
line 1062
;1062:	}
ADDRGP4 $1643
JUMPV
LABELV $1642
line 1063
;1063:	else {
line 1064
;1064:		AddScript(va("set g_doWarmup 0\n"));
ADDRGP4 $1650
ARGP4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1424
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1065
;1065:	}
LABELV $1643
line 1067
;1066:	
;1067:	AddScript(va("set sv_viewdistance %i\n", s_scriptdata.server.viewdistance));
ADDRGP4 $1653
ARGP4
ADDRGP4 s_scriptdata+3676+132
INDIRI4
ARGI4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1424
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1071
;1068:
;1069:
;1070:	// special server parameters
;1071:	if (s_scriptdata.server.allowmaxrate)
ADDRGP4 s_scriptdata+3676+76
INDIRI4
CNSTI4 0
EQI4 $1656
line 1072
;1072:		value = s_scriptdata.server.maxrate;
ADDRLP4 4
ADDRGP4 s_scriptdata+3676+80
INDIRI4
ASGNI4
ADDRGP4 $1657
JUMPV
LABELV $1656
line 1074
;1073:	else
;1074:		value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1657
line 1075
;1075:	AddScript(va("set sv_maxrate %i\n", value));
ADDRGP4 $1662
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1428
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1077
;1076:
;1077:	password = "";
ADDRLP4 12
ADDRGP4 $1663
ASGNP4
line 1078
;1078:	if (s_scriptdata.server.allowpass)
ADDRGP4 s_scriptdata+3676+92
INDIRI4
CNSTI4 0
EQI4 $1664
line 1079
;1079:		password = s_scriptdata.server.password;
ADDRLP4 12
ADDRGP4 s_scriptdata+3676+96
ASGNP4
LABELV $1664
line 1080
;1080:	if (!password[0]) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1670
line 1081
;1081:		AddScript("set g_needpass 0\n");
ADDRGP4 $1672
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1082
;1082:	}
ADDRGP4 $1671
JUMPV
LABELV $1670
line 1083
;1083:	else {
line 1084
;1084:		AddScript(va("set g_needpass %i\n", s_scriptdata.server.allowpass));
ADDRGP4 $1673
ARGP4
ADDRGP4 s_scriptdata+3676+92
INDIRI4
ARGI4
ADDRLP4 1432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1432
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1085
;1085:		AddScript(va("set g_password \"%s\"\n", password));
ADDRGP4 $1676
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1436
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1086
;1086:		AddScript(va("set password \"%s\"\n", password));
ADDRGP4 $1677
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1440
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1087
;1087:	}
LABELV $1671
line 1089
;1088:
;1089:	AddScript(va("set sv_allowDownload %i\n", s_scriptdata.server.allowdownload));
ADDRGP4 $1678
ARGP4
ADDRGP4 s_scriptdata+3676+84
INDIRI4
ARGI4
ADDRLP4 1432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1432
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1090
;1090:	AddScript(va("set g_allowVote %i\n", s_scriptdata.server.allowvote));
ADDRGP4 $1681
ARGP4
ADDRGP4 s_scriptdata+3676+88
INDIRI4
ARGI4
ADDRLP4 1436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1436
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1093
;1091:
;1092:	// team game options
;1093:	if (s_scriptdata.gametype >= GT_TEAM) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 4
LTI4 $1684
line 1094
;1094:		AddScript(va("set g_friendlyFire %i\n", s_scriptdata.server.friendlyFire));
ADDRGP4 $1686
ARGP4
ADDRGP4 s_scriptdata+3676+136
INDIRI4
ARGI4
ADDRLP4 1440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1440
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1095
;1095:		AddScript(va("set g_teamAutoJoin %i\n", s_scriptdata.server.autoJoin));
ADDRGP4 $1689
ARGP4
ADDRGP4 s_scriptdata+3676+144
INDIRI4
ARGI4
ADDRLP4 1444
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1444
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1096
;1096:		AddScript(va("set g_teamForceBalance %i\n", s_scriptdata.server.teamBalance));
ADDRGP4 $1692
ARGP4
ADDRGP4 s_scriptdata+3676+140
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1097
;1097:	}
LABELV $1684
line 1100
;1098:
;1099:	// count the number of clients
;1100:	botcount = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1101
;1101:	if (s_scriptdata.bot.typeSelect == BOTTYPE_SELECT) {
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
CNSTI4 0
NEI4 $1695
line 1102
;1102:		value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1103
;1103:		open = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1104
;1104:		for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1699
line 1105
;1105:			if (s_scriptdata.bot.slotType[i] == SLOTTYPE_BOT) {
ADDRLP4 1440
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1440
INDIRI4
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ADDRLP4 1440
INDIRI4
NEI4 $1703
line 1106
;1106:				value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1107
;1107:				if (s_scriptdata.bot.name[i][0]!='\0')
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1704
line 1108
;1108:					botcount++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1109
;1109:			}
ADDRGP4 $1704
JUMPV
LABELV $1703
line 1110
;1110:			else if (s_scriptdata.bot.slotType[i] == SLOTTYPE_OPEN)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1710
line 1111
;1111:				value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1710
LABELV $1704
line 1112
;1112:		}
LABELV $1700
line 1104
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1699
line 1113
;1113:	}
ADDRGP4 $1696
JUMPV
LABELV $1695
line 1114
;1114:	else if (StartServer_IsBotArenaScript(s_scriptdata.bot.typeSelect)) {
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 1440
ADDRGP4 StartServer_IsBotArenaScript
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
EQI4 $1714
line 1115
;1115:		open = s_scriptdata.bot.numberOpen;
ADDRLP4 20
ADDRGP4 s_scriptdata+1948+1460
INDIRI4
ASGNI4
line 1116
;1116:		botcount = s_serverexec.botcount_firstmap;
ADDRLP4 8
ADDRGP4 s_serverexec+155676
INDIRI4
ASGNI4
line 1117
;1117:		value = s_serverexec.max_scripted_bots + open;
ADDRLP4 4
ADDRGP4 s_serverexec+155680
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 1118
;1118:	}
ADDRGP4 $1715
JUMPV
LABELV $1714
line 1119
;1119:	else {	// BOTTYPE_RANDOM or BOTTYPE_RANDOMEXCLUDE
line 1120
;1120:		open = s_scriptdata.bot.numberOpen;
ADDRLP4 20
ADDRGP4 s_scriptdata+1948+1460
INDIRI4
ASGNI4
line 1121
;1121:		botcount = s_scriptdata.bot.numberBots;
ADDRLP4 8
ADDRGP4 s_scriptdata+1948+1468
INDIRI4
ASGNI4
line 1122
;1122:		value = botcount + open;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 1123
;1123:	}
LABELV $1715
LABELV $1696
line 1125
;1124:
;1125:	if (s_scriptdata.bot.joinAs == 1 || open == 0)
ADDRGP4 s_scriptdata+1948+1464
INDIRI4
CNSTI4 1
EQI4 $1730
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1726
LABELV $1730
line 1126
;1126:		value++;	// spectator on, allow one more slot
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1726
line 1128
;1127:
;1128:	if (value > MAX_CLIENTS)
ADDRLP4 4
INDIRI4
CNSTI4 256
LEI4 $1731
line 1129
;1129:		value = MAX_CLIENTS;
ADDRLP4 4
CNSTI4 256
ASGNI4
LABELV $1731
line 1131
;1130:
;1131:	s_serverexec.player_client = botcount;
ADDRGP4 s_serverexec+147460
ADDRLP4 8
INDIRI4
ASGNI4
line 1133
;1132:
;1133:	AddScript(va("set sv_maxclients %i\n",value));
ADDRGP4 $1734
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1444
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1444
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1136
;1134:
;1135:	// pmove
;1136:	value = s_scriptdata.server.pmove_fixed;
ADDRLP4 4
ADDRGP4 s_scriptdata+3676+64
INDIRI4
ASGNI4
line 1137
;1137:	AddScript(va("set pmove_fixed %i\n", value));
ADDRGP4 $1737
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1138
;1138:	if (value) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1738
line 1139
;1139:		AddScript(va("set pmove_msec %i\n", s_scriptdata.server.pmove_msec));
ADDRGP4 $1740
ARGP4
ADDRGP4 s_scriptdata+3676+68
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1140
;1140:	}
LABELV $1738
line 1143
;1141:
;1142:	// smoothclients
;1143:	AddScript(va("set g_smoothClients %i\n", s_scriptdata.server.smoothclients));
ADDRGP4 $1743
ARGP4
ADDRGP4 s_scriptdata+3676+72
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1146
;1144:
;1145:	// syncclients
;1146:	AddScript(va("set g_synchronousClients %i\n", s_scriptdata.server.syncClients));
ADDRGP4 $1746
ARGP4
ADDRGP4 s_scriptdata+3676+148
INDIRI4
ARGI4
ADDRLP4 1456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1456
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1149
;1147:
;1148:	// ping limits
;1149:	useping = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1150
;1150:	if (s_scriptdata.server.allowMinPing && s_scriptdata.server.allowMaxPing) {
ADDRLP4 1460
CNSTI4 0
ASGNI4
ADDRGP4 s_scriptdata+3676+152
INDIRI4
ADDRLP4 1460
INDIRI4
EQI4 $1749
ADDRGP4 s_scriptdata+3676+160
INDIRI4
ADDRLP4 1460
INDIRI4
EQI4 $1749
line 1151
;1151:		if (s_scriptdata.server.minPing > s_scriptdata.server.maxPing)
ADDRGP4 s_scriptdata+3676+156
INDIRI4
ADDRGP4 s_scriptdata+3676+164
INDIRI4
LEI4 $1755
line 1152
;1152:			useping = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1755
line 1153
;1153:	}
LABELV $1749
line 1155
;1154:
;1155:	if (s_scriptdata.server.allowMinPing && useping)
ADDRLP4 1464
CNSTI4 0
ASGNI4
ADDRGP4 s_scriptdata+3676+152
INDIRI4
ADDRLP4 1464
INDIRI4
EQI4 $1761
ADDRLP4 16
INDIRI4
ADDRLP4 1464
INDIRI4
EQI4 $1761
line 1156
;1156:		AddScript(va("set sv_minPing %i\n", s_scriptdata.server.minPing));
ADDRGP4 $1765
ARGP4
ADDRGP4 s_scriptdata+3676+156
INDIRI4
ARGI4
ADDRLP4 1468
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1468
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $1761
line 1157
;1157:	if (s_scriptdata.server.allowMaxPing && useping)
ADDRLP4 1472
CNSTI4 0
ASGNI4
ADDRGP4 s_scriptdata+3676+160
INDIRI4
ADDRLP4 1472
INDIRI4
EQI4 $1768
ADDRLP4 16
INDIRI4
ADDRLP4 1472
INDIRI4
EQI4 $1768
line 1158
;1158:		AddScript(va("set sv_maxPing %i\n", s_scriptdata.server.maxPing));
ADDRGP4 $1772
ARGP4
ADDRGP4 s_scriptdata+3676+164
INDIRI4
ARGI4
ADDRLP4 1476
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1476
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $1768
line 1162
;1159:
;1160:	// gameplay
;1161://	AddScript(va("g_gravity %i\n", s_scriptdata.server.gravity));
;1162:	AddScript(va("set g_knockback %i\n", s_scriptdata.server.knockback));
ADDRGP4 $683
ARGP4
ADDRGP4 s_scriptdata+3676+428
INDIRI4
ARGI4
ADDRLP4 1480
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1165
;1163:
;1164:	// server frame rate
;1165:	AddScript(va("set sv_fps %i\n", s_scriptdata.server.sv_fps));
ADDRGP4 $1777
ARGP4
ADDRGP4 s_scriptdata+3676+220
INDIRI4
ARGI4
ADDRLP4 1484
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1168
;1166:
;1167:	// weapon respawn
;1168:	if (s_scriptdata.gametype == GT_TEAM)
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 4
NEI4 $1780
line 1169
;1169:		AddScript(va("set g_weaponTeamrespawn %i\n", s_scriptdata.server.weaponrespawn));
ADDRGP4 $1782
ARGP4
ADDRGP4 s_scriptdata+3676+1884
INDIRI4
ARGI4
ADDRLP4 1488
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1488
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
ADDRGP4 $1781
JUMPV
LABELV $1780
line 1171
;1170:	else
;1171:		AddScript(va("set g_weaponrespawn %i\n", s_scriptdata.server.weaponrespawn));
ADDRGP4 $1102
ARGP4
ADDRGP4 s_scriptdata+3676+1884
INDIRI4
ARGI4
ADDRLP4 1492
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1492
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $1781
line 1174
;1172:
;1173:	// private clients
;1174:	if (s_scriptdata.server.allowPrivateClients) {
ADDRGP4 s_scriptdata+3676+188
INDIRI4
CNSTI4 0
EQI4 $1787
line 1175
;1175:		AddScript(va("set sv_privateClients %i\n", s_scriptdata.server.privateClients));
ADDRGP4 $1791
ARGP4
ADDRGP4 s_scriptdata+3676+192
INDIRI4
ARGI4
ADDRLP4 1496
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1496
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1176
;1176:		AddScript(va("set sv_privatePassword \"%s\"\n", s_scriptdata.server.privatePassword));
ADDRGP4 $1794
ARGP4
ADDRGP4 s_scriptdata+3676+196
ARGP4
ADDRLP4 1500
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1500
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1177
;1177:	}
LABELV $1787
line 1180
;1178:
;1179:	// netport
;1180:	AddScript(va("set net_port %i\n", s_scriptdata.server.netport));
ADDRGP4 $1797
ARGP4
ADDRGP4 s_scriptdata+3676+224
INDIRI4
ARGI4
ADDRLP4 1496
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1496
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1183
;1181:
;1182:	// allow values to take effect
;1183:	AddScript("\nwait 5\n");
ADDRGP4 $1800
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1185
;1184:
;1185:	return qtrue;
CNSTI4 1
RETI4
LABELV $566
endproc StartServer_WriteServerParams 1504 8
proc StartServer_GetFracBotSkill 48 4
line 1196
;1186:}
;1187:
;1188:
;1189:
;1190:
;1191:/*
;1192:=================
;1193:StartServer_GetBotSkillFloat
;1194:=================
;1195:*/
;1196:static float StartServer_GetFracBotSkill(botskill_t* skill) {
line 1204
;1197:   int high, low;
;1198:   float width;
;1199:   float slope;
;1200:   float area, target;
;1201:   float result;
;1202:   qboolean reverse;
;1203:
;1204:   high = skill->high;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1205
;1205:   low = skill->low;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1206
;1206:   width = high - low;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1209
;1207:
;1208:   // determine shape of skewed distributions
;1209:   reverse = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1210
;1210:	switch (s_scriptdata.bot.skillBias) {
ADDRLP4 32
ADDRGP4 s_scriptdata+1948+1480
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 5
LTI4 $1802
ADDRLP4 32
INDIRI4
CNSTI4 9
GTI4 $1802
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1811-20
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1811
address $1810
address $1806
address $1807
address $1808
address $1809
code
LABELV $1806
line 1212
;1211:		case SKILLBIAS_FRAC_VLOW:
;1212:         reverse = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1213
;1213:			slope = 0.5;
ADDRLP4 16
CNSTF4 1056964608
ASGNF4
line 1214
;1214:			break;
ADDRGP4 $1803
JUMPV
LABELV $1807
line 1216
;1215:		case SKILLBIAS_FRAC_LOW:
;1216:         reverse = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1217
;1217:			slope = 0.25;
ADDRLP4 16
CNSTF4 1048576000
ASGNF4
line 1218
;1218:			break;
ADDRGP4 $1803
JUMPV
LABELV $1808
line 1220
;1219:		case SKILLBIAS_FRAC_HIGH:
;1220:			slope = 0.25;
ADDRLP4 16
CNSTF4 1048576000
ASGNF4
line 1221
;1221:			break;
ADDRGP4 $1803
JUMPV
LABELV $1809
line 1223
;1222:		case SKILLBIAS_FRAC_VHIGH:
;1223:         slope = 0.5;
ADDRLP4 16
CNSTF4 1056964608
ASGNF4
line 1224
;1224:			break;
ADDRGP4 $1803
JUMPV
LABELV $1810
LABELV $1802
line 1227
;1225:		case SKILLBIAS_FRACTIONAL:
;1226:		default:
;1227:         return (1.0 + low + width * random());
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRF4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
RETF4
ADDRGP4 $1801
JUMPV
LABELV $1803
line 1230
;1228:	}
;1229:
;1230:   area = width * width * slope;
ADDRLP4 24
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 1231
;1231:   target = area * random();
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 1233
;1232:
;1233:   result = sqrt(target / slope);
ADDRLP4 28
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ARGF4
ADDRLP4 44
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ASGNF4
line 1234
;1234:   if (reverse == qtrue) {
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $1813
line 1235
;1235:      return 1 + high - result;
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDRLP4 12
INDIRF4
SUBF4
RETF4
ADDRGP4 $1801
JUMPV
LABELV $1813
line 1238
;1236:   }
;1237:
;1238:   return 1 + low + result;
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDRLP4 12
INDIRF4
ADDF4
RETF4
LABELV $1801
endproc StartServer_GetFracBotSkill 48 4
proc StartServer_GetIntBotSkill 76 0
line 1248
;1239:}
;1240:
;1241:
;1242:
;1243:/*
;1244:=================
;1245:StartServer_GetIntBotSkill
;1246:=================
;1247:*/
;1248:static int StartServer_GetIntBotSkill(botskill_t* skill) {
line 1255
;1249:   int i;
;1250:   int low, high;
;1251:	float value, step;
;1252:   float bin[MAX_SKILL];
;1253:	float selected;
;1254:
;1255:	low = skill->low;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1256
;1256:	high = skill->high;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1259
;1257:
;1258:   // determine shape of skewed distributions
;1259:	switch (s_scriptdata.bot.skillBias) {
ADDRLP4 60
ADDRGP4 s_scriptdata+1948+1480
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
LTI4 $1816
ADDRLP4 60
INDIRI4
CNSTI4 4
GTI4 $1816
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1825
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1825
address $1824
address $1820
address $1821
address $1822
address $1823
code
LABELV $1820
line 1261
;1260:		case SKILLBIAS_VLOW:
;1261:			value = (high - low) + 1.0;
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1262
;1262:			step = -1.0;
ADDRLP4 56
CNSTF4 3212836864
ASGNF4
line 1263
;1263:			break;
ADDRGP4 $1817
JUMPV
LABELV $1821
line 1265
;1264:		case SKILLBIAS_LOW:
;1265:			value = (high - low) * 0.5 + 0.5;
ADDRLP4 64
CNSTF4 1056964608
ASGNF4
ADDRLP4 52
ADDRLP4 64
INDIRF4
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDRLP4 64
INDIRF4
ADDF4
ASGNF4
line 1266
;1266:			step = -0.5;
ADDRLP4 56
CNSTF4 3204448256
ASGNF4
line 1267
;1267:			break;
ADDRGP4 $1817
JUMPV
LABELV $1822
line 1269
;1268:		case SKILLBIAS_HIGH:
;1269:			value = 0.5;
ADDRLP4 52
CNSTF4 1056964608
ASGNF4
line 1270
;1270:			step = 0.5;
ADDRLP4 56
CNSTF4 1056964608
ASGNF4
line 1271
;1271:			break;
ADDRGP4 $1817
JUMPV
LABELV $1823
line 1273
;1272:		case SKILLBIAS_VHIGH:
;1273:			value = 1.0;
ADDRLP4 52
CNSTF4 1065353216
ASGNF4
line 1274
;1274:			step = 1.0;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
line 1275
;1275:			break;
ADDRGP4 $1817
JUMPV
LABELV $1824
LABELV $1816
line 1278
;1276:		case SKILLBIAS_NONE:
;1277:		default:
;1278:			value = 1.0;
ADDRLP4 52
CNSTF4 1065353216
ASGNF4
line 1279
;1279:			step = 0.0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 1280
;1280:			break;
LABELV $1817
line 1283
;1281:	}
;1282:
;1283:	for (i = 0; i < MAX_SKILL; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1826
line 1284
;1284:		if (i < low || i > high)
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $1832
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $1830
LABELV $1832
line 1285
;1285:			bin[i] = 0.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $1831
JUMPV
LABELV $1830
line 1286
;1286:		else {
line 1287
;1287:			bin[i] = value;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 1288
;1288:			value += step;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
line 1289
;1289:		}
LABELV $1831
line 1290
;1290:		if (i > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $1833
line 1291
;1291:			bin[i] = bin[i] + bin[i - 1];
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
ADDRLP4 68
INDIRI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 68
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1833
line 1292
;1292:	}
LABELV $1827
line 1283
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $1826
line 1294
;1293:
;1294:	selected = bin[MAX_SKILL - 1] * random();
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 4+32
INDIRF4
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 1296
;1295:
;1296:	for (i = 0; i < MAX_SKILL ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1837
line 1297
;1297:		if (selected < bin[i])
ADDRLP4 48
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
GEF4 $1841
line 1298
;1298:			return i + 1;
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $1815
JUMPV
LABELV $1841
LABELV $1838
line 1296
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $1837
line 1300
;1299:
;1300:	return MAX_SKILL;
CNSTI4 9
RETI4
LABELV $1815
endproc StartServer_GetIntBotSkill 76 0
bss
align 1
LABELV $1844
skip 10
code
proc StartServer_GetBotSkill 24 12
line 1310
;1301:}
;1302:
;1303:
;1304:/*
;1305:=================
;1306:StartServer_GetBotSkillInteger
;1307:=================
;1308:*/
;1309:static char* StartServer_GetBotSkill(botskill_t* skill)
;1310:{
line 1313
;1311:   static char skill_out[10];
;1312:
;1313:	if (!skill->range) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1845
line 1314
;1314:      Q_strncpyz(skill_out, va("%i", skill->value + 1), sizeof(skill_out));
ADDRGP4 $1847
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1844
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1315
;1315:      return skill_out;
ADDRGP4 $1844
RETP4
ADDRGP4 $1843
JUMPV
LABELV $1845
line 1319
;1316:   }
;1317:
;1318:   // prepare default value
;1319:   Q_strncpyz(skill_out, va("%i", skill->low + 1), sizeof(skill_out));
ADDRGP4 $1847
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1844
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1320
;1320:	if (skill->low == skill->high) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $1848
line 1321
;1321:      return skill_out;
ADDRGP4 $1844
RETP4
ADDRGP4 $1843
JUMPV
LABELV $1848
line 1324
;1322:   }
;1323:
;1324:	switch (s_scriptdata.bot.skillBias) {
ADDRLP4 8
ADDRGP4 s_scriptdata+1948+1480
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1851
ADDRLP4 8
INDIRI4
CNSTI4 9
GTI4 $1851
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1857
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1857
address $1856
address $1856
address $1856
address $1856
address $1856
address $1854
address $1854
address $1854
address $1854
address $1854
code
LABELV $1854
line 1330
;1325:		case SKILLBIAS_FRAC_VLOW:
;1326:		case SKILLBIAS_FRAC_LOW:
;1327:		case SKILLBIAS_FRAC_HIGH:
;1328:		case SKILLBIAS_FRAC_VHIGH:
;1329:		case SKILLBIAS_FRACTIONAL:
;1330:      {
line 1331
;1331:         float f_skill = StartServer_GetFracBotSkill(skill);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 StartServer_GetFracBotSkill
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
ASGNF4
line 1332
;1332:         Q_strncpyz(skill_out, va("%4.2f", f_skill), sizeof(skill_out));
ADDRGP4 $1855
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1844
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1333
;1333:         break;
ADDRGP4 $1851
JUMPV
LABELV $1856
line 1340
;1334:      }
;1335:		case SKILLBIAS_VLOW:
;1336:		case SKILLBIAS_LOW:
;1337:		case SKILLBIAS_HIGH:
;1338:		case SKILLBIAS_VHIGH:
;1339:		case SKILLBIAS_NONE:
;1340:      {
line 1341
;1341:         int i_skill = StartServer_GetIntBotSkill(skill);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 StartServer_GetIntBotSkill
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1342
;1342:         Q_strncpyz(skill_out, va("%i", i_skill), sizeof(skill_out));
ADDRGP4 $1847
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1844
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1343
;1343:         break;
line 1346
;1344:      }
;1345:      default:
;1346:         break;
LABELV $1851
line 1350
;1347:   }
;1348:
;1349:   //trap_Print(va("Bot skill: %s\n", skill_out));
;1350:   return skill_out;
ADDRGP4 $1844
RETP4
LABELV $1843
endproc StartServer_GetBotSkill 24 12
proc StartServer_GetPlayerTeam 0 0
line 1362
;1351:}
;1352:
;1353:
;1354:
;1355:
;1356:/*
;1357:=================
;1358:StartServer_GetPlayerTeam
;1359:=================
;1360:*/
;1361:static int StartServer_GetPlayerTeam( void )
;1362:{
line 1363
;1363:	if (s_scriptdata.bot.teamSwapped)
ADDRGP4 s_scriptdata+1948+1500
INDIRI4
CNSTI4 0
EQI4 $1859
line 1364
;1364:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1858
JUMPV
LABELV $1859
line 1365
;1365:	return 0;
CNSTI4 0
RETI4
LABELV $1858
endproc StartServer_GetPlayerTeam 0 0
proc StartServer_WriteSelectedBotParams 44 16
line 1376
;1366:}
;1367:
;1368:
;1369:
;1370:/*
;1371:=================
;1372:StartServer_WriteSelectedBotParams
;1373:=================
;1374:*/
;1375:static void StartServer_WriteSelectedBotParams( void )
;1376:{
line 1382
;1377:    int i;
;1378:    const char* skill;
;1379:    qboolean custom;
;1380:    botskill_t* skillrange;
;1381:
;1382:    skillrange = &s_scriptdata.bot.globalSkill;
ADDRLP4 8
ADDRGP4 s_scriptdata+1948+1484
ASGNP4
line 1384
;1383:
;1384:    custom = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1385
;1385:    if (s_scriptdata.bot.skillType >= BOTSKILL_CUSTOMSINGLE)
ADDRGP4 s_scriptdata+1948+1476
INDIRI4
CNSTI4 2
LTI4 $1866
line 1386
;1386:        custom = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $1866
line 1388
;1387:
;1388:    if (s_scriptdata.gametype >= GT_TEAM && s_scriptdata.gametype != GT_LMS) {
ADDRLP4 16
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1870
ADDRLP4 16
INDIRI4
CNSTI4 11
EQI4 $1870
line 1391
;1389:        // team game
;1390:
;1391:        int playerTeam = StartServer_GetPlayerTeam();
ADDRLP4 28
ADDRGP4 StartServer_GetPlayerTeam
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 1392
;1392:        int otherTeam = 1 - playerTeam;
ADDRLP4 24
CNSTI4 1
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1394
;1393:
;1394:        for (i = 0; i < PLAYER_SLOTS_PERCOL; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1872
line 1395
;1395:            if (s_scriptdata.bot.slotType[i] != SLOTTYPE_BOT)
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1876
line 1396
;1396:                continue;
ADDRGP4 $1873
JUMPV
LABELV $1876
line 1397
;1397:            if (s_scriptdata.bot.name[i][0] == '\0')
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1880
line 1398
;1398:                continue;
ADDRGP4 $1873
JUMPV
LABELV $1880
line 1400
;1399:
;1400:            if (custom)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1883
line 1401
;1401:                skillrange = &s_scriptdata.bot.skill[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_scriptdata+1948+832
ADDP4
ASGNP4
LABELV $1883
line 1403
;1402:
;1403:            skill = StartServer_GetBotSkill(skillrange);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 StartServer_GetBotSkill
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 1405
;1404:
;1405:            AddScript(va("addbot %s %s %s; ", s_scriptdata.bot.name[i], skill, bot_teamname[playerTeam]));
ADDRGP4 $1887
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 bot_teamname
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1406
;1406:        }
LABELV $1873
line 1394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $1872
line 1408
;1407:
;1408:        for (i = PLAYER_SLOTS_PERCOL; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $1889
line 1409
;1409:            if (s_scriptdata.bot.slotType[i] != SLOTTYPE_BOT)
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1893
line 1410
;1410:                continue;
ADDRGP4 $1890
JUMPV
LABELV $1893
line 1411
;1411:            if (s_scriptdata.bot.name[i][0] == '\0')
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1897
line 1412
;1412:                continue;
ADDRGP4 $1890
JUMPV
LABELV $1897
line 1414
;1413:
;1414:            if (custom)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1900
line 1415
;1415:                skillrange = &s_scriptdata.bot.skill[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_scriptdata+1948+832
ADDP4
ASGNP4
LABELV $1900
line 1417
;1416:
;1417:            skill = StartServer_GetBotSkill(skillrange);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 StartServer_GetBotSkill
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 1419
;1418:
;1419:            AddScript(va("addbot %s %s %s; ", s_scriptdata.bot.name[i], skill, bot_teamname[otherTeam]));
ADDRGP4 $1887
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 bot_teamname
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1420
;1420:        }
LABELV $1890
line 1408
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1889
line 1421
;1421:    }
ADDRGP4 $1871
JUMPV
LABELV $1870
line 1422
;1422:    else {
line 1424
;1423:        // single player
;1424:        for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1905
line 1425
;1425:            if (s_scriptdata.bot.slotType[i] != SLOTTYPE_BOT)
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1909
line 1426
;1426:                continue;
ADDRGP4 $1906
JUMPV
LABELV $1909
line 1428
;1427:
;1428:            if (s_scriptdata.bot.name[i][0] == '\0')
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1913
line 1429
;1429:                continue;
ADDRGP4 $1906
JUMPV
LABELV $1913
line 1431
;1430:
;1431:            if (custom)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1916
line 1432
;1432:                skillrange = &s_scriptdata.bot.skill[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_scriptdata+1948+832
ADDP4
ASGNP4
LABELV $1916
line 1434
;1433:
;1434:            skill = StartServer_GetBotSkill(skillrange);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 StartServer_GetBotSkill
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1436
;1435:
;1436:            AddScript(va("addbot %s %s; ", s_scriptdata.bot.name[i], skill));
ADDRGP4 $1920
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1437
;1437:        }
LABELV $1906
line 1424
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1905
line 1438
;1438:    }
LABELV $1871
line 1439
;1439:}
LABELV $1863
endproc StartServer_WriteSelectedBotParams 44 16
proc StartServer_RejectRandomBot 56 12
line 1449
;1440:
;1441:
;1442:
;1443:/*
;1444:=================
;1445:StartServer_RejectRandomBot
;1446:=================
;1447:*/
;1448:static qboolean StartServer_RejectRandomBot( int newbot, int* botlist, int max )
;1449:{
line 1454
;1450:	int i;
;1451:	char botname[MAX_NAME_LENGTH];
;1452:	char* bot;
;1453:
;1454:	for (i = 0 ; i < max; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1926
JUMPV
LABELV $1923
line 1455
;1455:	{
line 1456
;1456:		if (newbot == botlist[i])
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
NEI4 $1927
line 1457
;1457:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1922
JUMPV
LABELV $1927
line 1458
;1458:	}
LABELV $1924
line 1454
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1926
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $1923
line 1461
;1459:
;1460:	// compare only if we have an exclude list
;1461:	if (StartServer_IsRandomBotExclude(s_scriptdata.bot.typeSelect))
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 StartServer_IsRandomBotExclude
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1929
line 1462
;1462:	{
line 1463
;1463:		bot = UI_GetBotInfoByNumber( newbot );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 44
INDIRP4
ASGNP4
line 1464
;1464:		Q_strncpyz(botname, Info_ValueForKey(bot, "name"), MAX_NAME_LENGTH);
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $1933
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1466
;1465:
;1466:		for (i = 0; i < PLAYER_SLOTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1934
line 1467
;1467:			if (!Q_stricmp(s_scriptdata.bot.name[i], botname))
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $1938
line 1468
;1468:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1922
JUMPV
LABELV $1938
LABELV $1935
line 1466
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1934
line 1469
;1469:	}
LABELV $1929
line 1471
;1470:
;1471:	return qfalse;
CNSTI4 0
RETI4
LABELV $1922
endproc StartServer_RejectRandomBot 56 12
proc StartServer_GenerateBotList 28 12
line 1481
;1472:}
;1473:
;1474:
;1475:/*
;1476:=================
;1477:StartServer_GenerateBotList
;1478:=================
;1479:*/
;1480:static void StartServer_GenerateBotList( int* botlist, int listmax, int listnum )
;1481:{
line 1485
;1482:	int count, i, j, newbot;
;1483:	qboolean repeat;
;1484:
;1485:	for (i = 0; i < listnum; i++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1945
JUMPV
LABELV $1942
line 1487
;1486:		// find an unused bot number, but don't try too hard
;1487:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1946
line 1488
;1488:		do {
line 1489
;1489:			repeat = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1490
;1490:			newbot = Clamp_Random( listmax - 1 );
ADDRFP4 4
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 20
ADDRGP4 Clamp_Random
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 1491
;1491:			if (StartServer_RejectRandomBot(newbot, botlist, i))
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 StartServer_RejectRandomBot
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1949
line 1492
;1492:			{
line 1493
;1493:				repeat = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1494
;1494:			}
LABELV $1949
line 1495
;1495:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1496
;1496:		} while (repeat && count < 32);
LABELV $1947
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1951
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1946
LABELV $1951
line 1498
;1497:
;1498:		botlist[i] = newbot;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1499
;1499:	}
LABELV $1943
line 1485
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1945
ADDRLP4 12
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $1942
line 1500
;1500:}
LABELV $1941
endproc StartServer_GenerateBotList 28 12
proc StartServer_WriteBotList 84 16
line 1510
;1501:
;1502:
;1503:
;1504:/*
;1505:=================
;1506:StartServer_WriteBotList
;1507:=================
;1508:*/
;1509:static void StartServer_WriteBotList( int* botlist, int listnum, qboolean kick )
;1510:{
line 1520
;1511:	int i;
;1512:   const char* skill;
;1513:	char* bot;
;1514:	char* funname;
;1515:	char* spacechar;
;1516:	char botname[MAX_NAME_LENGTH];
;1517:	botskill_t* skillrange;
;1518:	int team, player_team;
;1519:
;1520:	skillrange = &s_scriptdata.bot.globalSkill;
ADDRLP4 52
ADDRGP4 s_scriptdata+1948+1484
ASGNP4
line 1521
;1521:	player_team = StartServer_GetPlayerTeam();
ADDRLP4 64
ADDRGP4 StartServer_GetPlayerTeam
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 64
INDIRI4
ASGNI4
line 1522
;1522:	for (i = 0; i < listnum; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1958
JUMPV
LABELV $1955
line 1523
;1523:		bot = UI_GetBotInfoByNumber( botlist[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 68
INDIRP4
ASGNP4
line 1524
;1524:		Q_strncpyz(botname, Info_ValueForKey(bot, "name"), MAX_NAME_LENGTH);
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $1933
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1526
;1525:
;1526:		if (kick) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1959
line 1528
;1527:			// kicking is based on the funname, if available
;1528:			funname = Info_ValueForKey(bot, "funname");
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $1961
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 76
INDIRP4
ASGNP4
line 1529
;1529:			if (funname[0])
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1962
line 1530
;1530:			{
line 1531
;1531:				Q_strncpyz(botname, funname, MAX_NAME_LENGTH);
ADDRLP4 4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1532
;1532:				Q_CleanStr(botname);
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1533
;1533:				Q_strncpyz(botname, va("\"%s\"", botname), MAX_NAME_LENGTH);
ADDRGP4 $1964
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1534
;1534:			}
LABELV $1962
line 1536
;1535:
;1536:			AddScript(va("kick %s; ", botname));
ADDRGP4 $1965
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1537
;1537:		}
ADDRGP4 $1960
JUMPV
LABELV $1959
line 1538
;1538:		else {
line 1539
;1539:			skill = StartServer_GetBotSkill(skillrange);
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 StartServer_GetBotSkill
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 76
INDIRP4
ASGNP4
line 1540
;1540:			if (s_scriptdata.gametype >= GT_TEAM) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 4
LTI4 $1966
line 1541
;1541:				team = (player_team + i + 1) % 2;	// start with opposite team
ADDRLP4 48
ADDRLP4 56
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 2
MODI4
ASGNI4
line 1543
;1542:
;1543:				if (i == listnum - 1 && team == player_team)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $1968
ADDRLP4 48
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $1968
line 1544
;1544:					team = 1 - team;	// even number of bots: put last one on opposite team
ADDRLP4 48
CNSTI4 1
ADDRLP4 48
INDIRI4
SUBI4
ASGNI4
LABELV $1968
line 1546
;1545:
;1546:				AddScript(va("addbot %s %s %s; ", botname, skill, bot_teamname[ team ]));
ADDRGP4 $1887
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 bot_teamname
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1547
;1547:			}
ADDRGP4 $1967
JUMPV
LABELV $1966
line 1548
;1548:			else {
line 1549
;1549:				AddScript(va("addbot %s %s; ", botname, skill));
ADDRGP4 $1920
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1550
;1550:			}
LABELV $1967
line 1551
;1551:		}
LABELV $1960
line 1552
;1552:	}
LABELV $1956
line 1522
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1958
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1955
line 1553
;1553:}
LABELV $1952
endproc StartServer_WriteBotList 84 16
proc StartServer_WriteRandomBotParams 68 12
line 1563
;1554:
;1555:
;1556:
;1557:/*
;1558:=================
;1559:StartServer_WriteRandomBotParams
;1560:=================
;1561:*/
;1562:static void StartServer_WriteRandomBotParams( void )
;1563:{
line 1570
;1564:	int i, j;
;1565:	int max, index, period, next;
;1566:	int frequency, bots_perlevel;
;1567:	int* kickbots;
;1568:	int* addbots;
;1569:
;1570:	frequency = botChange_frequency[ s_scriptdata.bot.changeBots ];
ADDRLP4 16
ADDRGP4 s_scriptdata+1948+1472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botChange_frequency
ADDP4
INDIRI4
ASGNI4
line 1572
;1571:
;1572:	bots_perlevel = s_scriptdata.bot.numberBots;
ADDRLP4 24
ADDRGP4 s_scriptdata+1948+1468
INDIRI4
ASGNI4
line 1573
;1573:	if (bots_perlevel > s_serverexec.maxBots)
ADDRLP4 24
INDIRI4
ADDRGP4 s_serverexec+131072
INDIRI4
LEI4 $1975
line 1574
;1574:		bots_perlevel = s_serverexec.maxBots;
ADDRLP4 24
ADDRGP4 s_serverexec+131072
INDIRI4
ASGNI4
LABELV $1975
line 1576
;1575:
;1576:	if (frequency == 0 || bots_perlevel == 0) {	// one-off addbot
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1981
ADDRLP4 24
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $1979
LABELV $1981
line 1578
;1577:		// write kickbot (never kicks a bot, loops forever)
;1578:		AddScript("set "SERVER_KICKBOT"0 \"set "SERVER_KICKBOT" vstr "SERVER_KICKBOT"0\"\n");
ADDRGP4 $1982
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1581
;1579:
;1580:		// write first addbot
;1581:		AddScript("set "SERVER_ADDBOT"0 \"");
ADDRGP4 $1983
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1583
;1582:
;1583:		if (bots_perlevel > 0) {
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $1984
line 1584
;1584:			StartServer_GenerateBotList(s_serverexec.usedBots, s_serverexec.maxBots, bots_perlevel);
ADDRGP4 s_serverexec+131076
ARGP4
ADDRGP4 s_serverexec+131072
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 StartServer_GenerateBotList
CALLV
pop
line 1585
;1585:			StartServer_WriteBotList(s_serverexec.usedBots, bots_perlevel, qfalse);
ADDRGP4 s_serverexec+131076
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_WriteBotList
CALLV
pop
line 1586
;1586:		}
LABELV $1984
line 1588
;1587:
;1588:		AddScript("set "SERVER_ADDBOT" vstr "SERVER_ADDBOT"1\"\n");
ADDRGP4 $1989
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1592
;1589:
;1590:		// write second addbot
;1591:		// does nothing
;1592:		AddScript("set "SERVER_ADDBOT"1 \"\"\n");
ADDRGP4 $1990
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1593
;1593:	}
ADDRGP4 $1980
JUMPV
LABELV $1979
line 1594
;1594:	else {
line 1596
;1595:		// bots that we need to delete when loop comes around again
;1596:		StartServer_GenerateBotList(s_serverexec.lastBots, s_serverexec.maxBots, bots_perlevel);
ADDRGP4 s_serverexec+139268
ARGP4
ADDRGP4 s_serverexec+131072
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 StartServer_GenerateBotList
CALLV
pop
line 1601
;1597:
;1598:		// to minimize the overlap and repeat of bot/map combinations
;1599:		// the period of bot repeat is a prime number > than the number
;1600:		// of maps
;1601:		period = addbot_primes[ num_addbot_primes - 1 ];
ADDRLP4 36
ADDRGP4 num_addbot_primes
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addbot_primes-4
ADDP4
INDIRI4
ASGNI4
line 1602
;1602:		for (i = 0; i < num_addbot_primes; i++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $1997
JUMPV
LABELV $1994
line 1603
;1603:			if (addbot_primes[i] > s_serverexec.cycle_count) {
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addbot_primes
ADDP4
INDIRI4
ADDRGP4 s_serverexec+147468
INDIRI4
LEI4 $1998
line 1604
;1604:				period = addbot_primes[i];
ADDRLP4 36
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addbot_primes
ADDP4
INDIRI4
ASGNI4
line 1605
;1605:				break;
ADDRGP4 $1996
JUMPV
LABELV $1998
line 1607
;1606:			}
;1607:		}
LABELV $1995
line 1602
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1997
ADDRLP4 20
INDIRI4
ADDRGP4 num_addbot_primes
INDIRI4
LTI4 $1994
LABELV $1996
line 1610
;1608:
;1609:		// write the list
;1610:		index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1611
;1611:		max = frequency * period;
ADDRLP4 12
ADDRLP4 16
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ASGNI4
line 1612
;1612:		kickbots = s_serverexec.lastBots;
ADDRLP4 28
ADDRGP4 s_serverexec+139268
ASGNP4
line 1613
;1613:		addbots = s_serverexec.usedBots;
ADDRLP4 32
ADDRGP4 s_serverexec+131076
ASGNP4
line 1614
;1614:		for (i = period - 1; i >= 0; i--) {
ADDRLP4 20
ADDRLP4 36
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2006
JUMPV
LABELV $2003
line 1615
;1615:			next = (index + 1)%max;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRI4
MODI4
ASGNI4
line 1618
;1616:
;1617:			// kick the previous bots
;1618:			AddScript(va("set "SERVER_KICKBOT"%i \"", index));
ADDRGP4 $2007
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1619
;1619:			if (bots_perlevel > 0) {
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $2008
line 1620
;1620:				StartServer_WriteBotList(kickbots, bots_perlevel, qtrue);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 StartServer_WriteBotList
CALLV
pop
line 1621
;1621:			}
LABELV $2008
line 1623
;1622:
;1623:			AddScript(va("set "SERVER_KICKBOT" vstr "SERVER_KICKBOT"%i\"\n", next));
ADDRGP4 $2010
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1626
;1624:
;1625:			// add the bots
;1626:			AddScript(va("set "SERVER_ADDBOT"%i \"", index));
ADDRGP4 $2011
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1627
;1627:			if (bots_perlevel > 0) {
ADDRLP4 24
INDIRI4
CNSTI4 0
LEI4 $2012
line 1628
;1628:				if (i == 0) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2014
line 1631
;1629:					// make sure we add the correct bots that we
;1630:					// kicked at the start of the cycle
;1631:					addbots = s_serverexec.lastBots;
ADDRLP4 32
ADDRGP4 s_serverexec+139268
ASGNP4
line 1632
;1632:				}
ADDRGP4 $2015
JUMPV
LABELV $2014
line 1633
;1633:				else {
line 1634
;1634:					StartServer_GenerateBotList(addbots, s_serverexec.maxBots, bots_perlevel);
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 s_serverexec+131072
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 StartServer_GenerateBotList
CALLV
pop
line 1635
;1635:				}
LABELV $2015
line 1636
;1636:				StartServer_WriteBotList(addbots, bots_perlevel, qfalse);
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_WriteBotList
CALLV
pop
line 1637
;1637:				kickbots = s_serverexec.usedBots;
ADDRLP4 28
ADDRGP4 s_serverexec+131076
ASGNP4
line 1638
;1638:			}
LABELV $2012
line 1640
;1639:
;1640:			AddScript(va("set "SERVER_ADDBOT" vstr "SERVER_ADDBOT"%i\"\n\n", next));
ADDRGP4 $2019
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1643
;1641:
;1642:			// pad out so new bots are kicked at the correct number of maps
;1643:			for (j = 1; j < frequency; j++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $2023
JUMPV
LABELV $2020
line 1644
;1644:				index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1645
;1645:				next = (index + 1)%max;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRI4
MODI4
ASGNI4
line 1647
;1646:
;1647:				AddScript(va("set "SERVER_KICKBOT"%i \"set "SERVER_KICKBOT" vstr "SERVER_KICKBOT"%i\"\n", index, next));
ADDRGP4 $2024
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1648
;1648:				AddScript(va("set "SERVER_ADDBOT"%i \"set "SERVER_ADDBOT" vstr "SERVER_ADDBOT"%i\"\n\n", index, next));
ADDRGP4 $2025
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1649
;1649:			}
LABELV $2021
line 1643
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2023
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2020
line 1651
;1650:
;1651:			index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1652
;1652:		}
LABELV $2004
line 1614
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2006
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $2003
line 1654
;1653:
;1654:	}
LABELV $1980
line 1655
;1655:}
LABELV $1970
endproc StartServer_WriteRandomBotParams 68 12
proc StartServer_GenerateSelectedArenaBotList 28 12
line 1664
;1656:
;1657:
;1658:
;1659:/*
;1660:=================
;1661:StartServer_GenerateSelectedArenaBotList
;1662:=================
;1663:*/
;1664:static void StartServer_GenerateSelectedArenaBotList(int* bots, int botnum) {
line 1668
;1665:	int count, i, j, newbot;
;1666:	qboolean repeat;
;1667:
;1668:	for (i = 0; i < botnum; i++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2030
JUMPV
LABELV $2027
line 1670
;1669:		// find an unused bot number, but don't try too hard
;1670:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2031
line 1671
;1671:		do {
line 1672
;1672:			repeat = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1673
;1673:			newbot = s_serverexec.bots_in_slots[Clamp_Random( s_serverexec.num_bots_in_slots - 1 )];
ADDRGP4 s_serverexec+155788
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 20
ADDRGP4 Clamp_Random
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+155684
ADDP4
INDIRI4
ASGNI4
line 1674
;1674:			if (StartServer_RejectRandomBot(newbot, bots, i))
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 StartServer_RejectRandomBot
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2036
line 1675
;1675:			{
line 1676
;1676:				repeat = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1677
;1677:			}
LABELV $2036
line 1678
;1678:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1679
;1679:		} while (repeat && count < 32);
LABELV $2032
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2038
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $2031
LABELV $2038
line 1681
;1680:
;1681:		bots[i] = newbot;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1682
;1682:	}
LABELV $2028
line 1668
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2030
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $2027
line 1683
;1683:}
LABELV $2026
endproc StartServer_GenerateSelectedArenaBotList 28 12
proc StartServer_GenerateArenaBotList 1068 12
line 1693
;1684:
;1685:
;1686:
;1687:/*
;1688:=================
;1689:StartServer_GenerateArenaBotList
;1690:=================
;1691:*/
;1692:static int StartServer_GenerateArenaBotList( int* bots, int max, const char* mapname )
;1693:{
line 1702
;1694:	const char* info;
;1695:	const char* botinfo;
;1696:	char* p;
;1697:	const char* botname;
;1698:	int num;
;1699:	int botnum;
;1700:	char botlist[MAX_INFO_STRING];
;1701:
;1702:	info = UI_GetArenaInfoByMap(mapname);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1048
INDIRP4
ASGNP4
line 1704
;1703:
;1704:	num = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1708
;1705:
;1706:	// we're counting up the number of bots for this level,
;1707:	// as well as parsing the bot list
;1708:	if (info) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2040
line 1709
;1709:		Q_strncpyz(botlist, Info_ValueForKey(info, "bots"), MAX_INFO_STRING);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $2042
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1710
;1710:		if (*botlist) {
ADDRLP4 20
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2043
line 1712
;1711:			// arena has bots, search through them
;1712:			p = botlist;
ADDRLP4 12
ADDRLP4 20
ASGNP4
ADDRGP4 $2046
JUMPV
LABELV $2045
line 1713
;1713:			while ( num < max) {
line 1714
;1714:				botname = COM_Parse(&p);
ADDRLP4 12
ARGP4
ADDRLP4 1056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1056
INDIRP4
ASGNP4
line 1715
;1715:				if (!botname || !botname[0])
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2050
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2048
LABELV $2050
line 1716
;1716:					break;
ADDRGP4 $2047
JUMPV
LABELV $2048
line 1718
;1717:
;1718:				botnum = UI_GetBotNumByName(botname);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 UI_GetBotNumByName
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1064
INDIRI4
ASGNI4
line 1719
;1719:				if (botnum < 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $2051
line 1720
;1720:					continue;
ADDRGP4 $2046
JUMPV
LABELV $2051
line 1723
;1721:
;1722:				// found the bot, get its index
;1723:				bots[num] = botnum;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1724
;1724:				num++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1725
;1725:			}
LABELV $2046
line 1713
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $2045
LABELV $2047
line 1728
;1726:
;1727:			// only return if we use the parsed results
;1728:			if (s_scriptdata.bot.typeSelect == BOTTYPE_ARENASCRIPT)
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
CNSTI4 4
NEI4 $2053
line 1729
;1729:				return num;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2039
JUMPV
LABELV $2053
line 1730
;1730:		}
LABELV $2043
line 1731
;1731:	}
LABELV $2040
line 1734
;1732:
;1733:	// no bots on map, so generate a random number
;1734:	if (num == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2057
line 1735
;1735:		num = s_scriptdata.bot.numberBots;
ADDRLP4 0
ADDRGP4 s_scriptdata+1948+1468
INDIRI4
ASGNI4
LABELV $2057
line 1737
;1736:
;1737:	if (num > max)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $2061
line 1738
;1738:		num = max;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $2061
line 1741
;1739:
;1740:   // now build the list of bots
;1741:   if (s_scriptdata.bot.typeSelect == BOTTYPE_SELECTARENASCRIPT) {
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
CNSTI4 5
NEI4 $2063
line 1742
;1742:      if (s_serverexec.num_bots_in_slots > 0) {
ADDRGP4 s_serverexec+155788
INDIRI4
CNSTI4 0
LEI4 $2067
line 1743
;1743:         StartServer_GenerateSelectedArenaBotList(bots, num);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_GenerateSelectedArenaBotList
CALLV
pop
line 1744
;1744:         return num;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2039
JUMPV
LABELV $2067
line 1746
;1745:      }
;1746:   }
LABELV $2063
line 1749
;1747:
;1748:   // list built is randomly generated
;1749:	if (num)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2070
line 1750
;1750:		StartServer_GenerateBotList(bots, UI_GetNumBots(), num);
ADDRLP4 1052
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_GenerateBotList
CALLV
pop
LABELV $2070
line 1752
;1751:
;1752:	return num;
ADDRLP4 0
INDIRI4
RETI4
LABELV $2039
endproc StartServer_GenerateArenaBotList 1068 12
bss
align 1
LABELV $2073
skip 16
code
proc StartServer_GetArenaScriptMapName 24 12
line 1768
;1753:}
;1754:
;1755:
;1756:
;1757:
;1758:
;1759:/*
;1760:=================
;1761:StartServer_WriteArenaScriptBotParams
;1762:
;1763:Includes awareness of map ordering and random map generation
;1764:Copied into static buffer for safe keeping until next call
;1765:=================
;1766:*/
;1767:static char* StartServer_GetArenaScriptMapName( int index )
;1768:{
line 1774
;1769:	static char mapname[SHORTMAP_BUFFER];
;1770:	char* map_ptr;
;1771:	const char* info;
;1772:	int mapnum;
;1773:
;1774:	if (index < 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $2074
line 1775
;1775:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $2072
JUMPV
LABELV $2074
line 1777
;1776:
;1777:	if (s_serverexec.random_order) {
ADDRGP4 s_serverexec+147476
INDIRI4
CNSTI4 0
EQI4 $2076
line 1779
;1778:		// a random order was imposed on the map
;1779:		index %= s_serverexec.random_count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 s_serverexec+147480
INDIRI4
MODI4
ASGNI4
line 1781
;1780:
;1781:		if (s_serverexec.random_generate) {
ADDRGP4 s_serverexec+147472
INDIRI4
CNSTI4 0
EQI4 $2080
line 1783
;1782:			// the map list was also randomly generated
;1783:			mapnum = s_serverexec.map_rnd_index[ s_serverexec.map_rnd[index] ];
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRGP4 s_serverexec+147484
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRGP4 s_serverexec+151580
ADDP4
INDIRI4
ASGNI4
line 1784
;1784:			info = UI_GetArenaInfoByNumber(mapnum);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1785
;1785:			map_ptr = Info_ValueForKey(info, "map");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $2085
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1786
;1786:		}
ADDRGP4 $2077
JUMPV
LABELV $2080
line 1787
;1787:		else {
line 1789
;1788:			// random order on a defined list of maps
;1789:			map_ptr = s_scriptdata.map.data[ s_serverexec.map_rnd[index] ].shortName;
ADDRLP4 0
CNSTI4 56
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+147484
ADDP4
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ASGNP4
line 1790
;1790:		}
line 1791
;1791:	}
ADDRGP4 $2077
JUMPV
LABELV $2076
line 1792
;1792:	else {
line 1794
;1793:		// we used a linear list
;1794:		map_ptr = s_scriptdata.map.data[index].shortName;
ADDRLP4 0
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ASGNP4
line 1795
;1795:	}
LABELV $2077
line 1798
;1796:
;1797:	// copy into local storage
;1798:	if (map_ptr && *map_ptr) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2091
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2091
line 1799
;1799:		Q_strncpyz(mapname, map_ptr, SHORTMAP_BUFFER);
ADDRGP4 $2073
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1800
;1800:	}
ADDRGP4 $2092
JUMPV
LABELV $2091
line 1801
;1801:	else {
line 1802
;1802:		mapname[0] = '\0';
ADDRGP4 $2073
CNSTI1 0
ASGNI1
line 1803
;1803:	}
LABELV $2092
line 1805
;1804:
;1805:	return mapname;
ADDRGP4 $2073
RETP4
LABELV $2072
endproc StartServer_GetArenaScriptMapName 24 12
proc StartServer_WriteArenaScriptBotParams 64 12
line 1818
;1806:}
;1807:
;1808:
;1809:
;1810:/*
;1811:=================
;1812:StartServer_WriteArenaScriptBotParams
;1813:
;1814:Includes awareness of map ordering and random map generation
;1815:=================
;1816:*/
;1817:static void StartServer_WriteArenaScriptBotParams( void )
;1818:{
line 1827
;1819:	int i;
;1820:	int count, period;
;1821:	int bots_onlevel, lastlevel_numbots;
;1822:	char *mapname;
;1823:	int *kickbots;
;1824:	int *addbots;
;1825:	int next;
;1826:
;1827:	period = s_serverexec.cycle_count;
ADDRLP4 24
ADDRGP4 s_serverexec+147468
INDIRI4
ASGNI4
line 1828
;1828:	count = period;
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 1829
;1829:	if (s_serverexec.random_order) {
ADDRGP4 s_serverexec+147476
INDIRI4
CNSTI4 0
EQI4 $2095
line 1830
;1830:		count = s_serverexec.random_count;
ADDRLP4 12
ADDRGP4 s_serverexec+147480
INDIRI4
ASGNI4
line 1831
;1831:	}
LABELV $2095
line 1834
;1832:
;1833:	// bots that we need to delete when loop comes around again
;1834:	mapname = StartServer_GetArenaScriptMapName(count - 1);
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 36
ADDRGP4 StartServer_GetArenaScriptMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 36
INDIRP4
ASGNP4
line 1835
;1835:	lastlevel_numbots = StartServer_GenerateArenaBotList(s_serverexec.lastBots, s_serverexec.maxBots, mapname);
ADDRGP4 s_serverexec+139268
ARGP4
ADDRGP4 s_serverexec+131072
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 StartServer_GenerateArenaBotList
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 1837
;1836:
;1837:	s_serverexec.max_scripted_bots = lastlevel_numbots;
ADDRGP4 s_serverexec+155680
ADDRLP4 32
INDIRI4
ASGNI4
line 1840
;1838:
;1839:	// write the list
;1840:	kickbots = s_serverexec.lastBots;
ADDRLP4 20
ADDRGP4 s_serverexec+139268
ASGNP4
line 1841
;1841:	addbots = s_serverexec.usedBots;
ADDRLP4 16
ADDRGP4 s_serverexec+131076
ASGNP4
line 1842
;1842:	bots_onlevel = lastlevel_numbots;
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 1843
;1843:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2107
JUMPV
LABELV $2104
line 1844
;1844:		next = (i + 1)%period;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 1847
;1845:
;1846:		// kick the previous bots
;1847:		AddScript(va("set "SERVER_KICKBOT"%i \"", i));
ADDRGP4 $2007
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1848
;1848:		if (bots_onlevel > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $2108
line 1849
;1849:			StartServer_WriteBotList(kickbots, bots_onlevel, qtrue);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 StartServer_WriteBotList
CALLV
pop
line 1850
;1850:		}
LABELV $2108
line 1852
;1851:
;1852:		AddScript(va("set "SERVER_KICKBOT" vstr "SERVER_KICKBOT"%i\"\n", next));
ADDRGP4 $2010
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1855
;1853:
;1854:		// add the bots
;1855:		AddScript(va("set "SERVER_ADDBOT"%i \"", i));
ADDRGP4 $2011
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1857
;1856:
;1857:		if (i == count - 1) {
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
NEI4 $2110
line 1860
;1858:			// make sure we add the correct bots that we
;1859:			// kicked at the start of the cycle
;1860:			addbots = s_serverexec.lastBots;
ADDRLP4 16
ADDRGP4 s_serverexec+139268
ASGNP4
line 1861
;1861:			bots_onlevel = lastlevel_numbots;
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 1862
;1862:		}
ADDRGP4 $2111
JUMPV
LABELV $2110
line 1863
;1863:		else {
line 1864
;1864:			mapname = StartServer_GetArenaScriptMapName(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 StartServer_GetArenaScriptMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 56
INDIRP4
ASGNP4
line 1865
;1865:			bots_onlevel = StartServer_GenerateArenaBotList(addbots, s_serverexec.maxBots, mapname);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 s_serverexec+131072
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 StartServer_GenerateArenaBotList
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 1866
;1866:		}
LABELV $2111
line 1868
;1867:
;1868:		if (i == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2114
line 1869
;1869:			s_serverexec.botcount_firstmap = bots_onlevel;
ADDRGP4 s_serverexec+155676
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $2114
line 1871
;1870:
;1871:		if (bots_onlevel > s_serverexec.max_scripted_bots)
ADDRLP4 4
INDIRI4
ADDRGP4 s_serverexec+155680
INDIRI4
LEI4 $2117
line 1872
;1872:			s_serverexec.max_scripted_bots = bots_onlevel;
ADDRGP4 s_serverexec+155680
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $2117
line 1874
;1873:
;1874:		StartServer_WriteBotList(addbots, bots_onlevel, qfalse);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_WriteBotList
CALLV
pop
line 1875
;1875:		kickbots = s_serverexec.usedBots;
ADDRLP4 20
ADDRGP4 s_serverexec+131076
ASGNP4
line 1877
;1876:
;1877:		AddScript(va("set "SERVER_ADDBOT" vstr "SERVER_ADDBOT"%i\"\n\n", next));
ADDRGP4 $2019
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1878
;1878:	}
LABELV $2105
line 1843
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2107
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $2104
line 1879
;1879:}
LABELV $2093
endproc StartServer_WriteArenaScriptBotParams 64 12
proc StartServer_WriteBotParams 4 4
line 1894
;1880:
;1881:
;1882:
;1883:
;1884:
;1885:/*
;1886:=================
;1887:StartServer_WriteBotParams
;1888:
;1889:May depend on map ordering list, so StartServer_WriteMapParams()
;1890:must be called first
;1891:=================
;1892:*/
;1893:static qboolean StartServer_WriteBotParams( void )
;1894:{
line 1895
;1895:	AddScript("\n// WriteBotParams()\n\n");
ADDRGP4 $2123
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1897
;1896:
;1897:	if (!s_serverexec.map_generated) {
ADDRGP4 s_serverexec+155792
INDIRI4
CNSTI4 0
NEI4 $2124
line 1898
;1898:		trap_Print(S_COLOR_RED"WriteBotParams called before WriteMapParams\n");
ADDRGP4 $2127
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1899
;1899:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2124
line 1903
;1900:	}
;1901:
;1902:   // build list from selected bots
;1903:	if (s_scriptdata.bot.typeSelect == BOTTYPE_SELECT)
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
CNSTI4 0
NEI4 $2128
line 1904
;1904:	{
line 1907
;1905:		// bots are only added once
;1906:
;1907:		AddScript("// allows 'reset "SERVER_ADDBOT"' to clear "SERVER_ADDBOT"\n");
ADDRGP4 $2132
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1908
;1908:		AddScript("set "SERVER_ADDBOT" \"\"\n");
ADDRGP4 $2133
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1909
;1909:		AddScript("set "SERVER_ADDBOT" \"");
ADDRGP4 $2134
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1911
;1910:
;1911:		StartServer_WriteSelectedBotParams();
ADDRGP4 StartServer_WriteSelectedBotParams
CALLV
pop
line 1915
;1912:
;1913:		// no more bots added, so clear addbot
;1914:		// last command in set SERVER_ADDBOT
;1915:		AddScript("reset "SERVER_ADDBOT" \"\n");
ADDRGP4 $2135
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1918
;1916:
;1917:		// bots never kicked
;1918:		AddScript("set "SERVER_KICKBOT" \"\"\n");
ADDRGP4 $2136
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1920
;1919:
;1920:		s_serverexec.bot_generated = qtrue;
ADDRGP4 s_serverexec+155796
CNSTI4 1
ASGNI4
line 1921
;1921:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2128
line 1924
;1922:	}
;1923:
;1924:   if (StartServer_IsBotArenaScript(s_scriptdata.bot.typeSelect)) {
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 StartServer_IsBotArenaScript
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2138
line 1925
;1925:		StartServer_WriteArenaScriptBotParams();
ADDRGP4 StartServer_WriteArenaScriptBotParams
CALLV
pop
line 1926
;1926:	}
ADDRGP4 $2139
JUMPV
LABELV $2138
line 1927
;1927:	else {	// BOTTYPE_RANDOM or BOTTYPE_RANDOMEXCLUDE
line 1928
;1928:		StartServer_WriteRandomBotParams();
ADDRGP4 StartServer_WriteRandomBotParams
CALLV
pop
line 1929
;1929:	}
LABELV $2139
line 1933
;1930:
;1931:	// setup bot add and kick commands
;1932:	// we don't need to kick any bots on first connect
;1933:	AddScript("\nset "SERVER_ADDBOT" \"vstr "SERVER_ADDBOT"0\"\n");
ADDRGP4 $2142
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1934
;1934:	AddScript("set "SERVER_KICKBOT" \"set "SERVER_KICKBOT" vstr "SERVER_KICKBOT"1\"\n");
ADDRGP4 $2143
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 1936
;1935:
;1936:	s_serverexec.bot_generated = qtrue;
ADDRGP4 s_serverexec+155796
CNSTI4 1
ASGNI4
line 1937
;1937:	return qtrue;
CNSTI4 1
RETI4
LABELV $2122
endproc StartServer_WriteBotParams 4 4
proc StartServer_IsRecentMap 12 0
line 1949
;1938:}
;1939:
;1940:
;1941:
;1942:
;1943:/*
;1944:=================
;1945:StartServer_IsRecentMap
;1946:=================
;1947:*/
;1948:static qboolean StartServer_IsRecentMap(int count, int index)
;1949:{
line 1954
;1950:	int i;
;1951:	int start;
;1952:	int period;
;1953:
;1954:	period = s_serverexec.rnd_nummaps;
ADDRLP4 8
ADDRGP4 s_serverexec+147464
INDIRI4
ASGNI4
line 1956
;1955:	// no previous entries, or not enough maps
;1956:	if (count == 0 || period < 2)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2149
ADDRLP4 8
INDIRI4
CNSTI4 2
GEI4 $2147
LABELV $2149
line 1957
;1957:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2145
JUMPV
LABELV $2147
line 1960
;1958:
;1959:	// must have used about half of maps before a repeat is allowed
;1960:	start = count - (period / 2);
ADDRLP4 4
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1961
;1961:	if (start < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2150
line 1962
;1962:		start = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2150
line 1964
;1963:
;1964:	for (i = start; i < count; i++)
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $2155
JUMPV
LABELV $2152
line 1965
;1965:		if (s_serverexec.map_rnd_index[i] == index)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+151580
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2156
line 1966
;1966:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2145
JUMPV
LABELV $2156
LABELV $2153
line 1964
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2155
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $2152
line 1968
;1967:
;1968:	return qfalse;
CNSTI4 0
RETI4
LABELV $2145
endproc StartServer_IsRecentMap 12 0
proc StartServer_IsBiasedMap 28 8
line 1979
;1969:}
;1970:
;1971:
;1972:
;1973:/*
;1974:=================
;1975:StartServer_IsBiasedMap
;1976:=================
;1977:*/
;1978:static qboolean StartServer_IsBiasedMap(int idtype, int index)
;1979:{
line 1983
;1980:	const char* info;
;1981:	qboolean idmap;
;1982:
;1983:	if (idtype != MAP_RND_BIASID && idtype != MAP_RND_BIASNONID)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $2160
ADDRLP4 8
INDIRI4
CNSTI4 4
EQI4 $2160
line 1984
;1984:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2159
JUMPV
LABELV $2160
line 1986
;1985:
;1986:	info = UI_GetArenaInfoByNumber(index);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 1987
;1987:	idmap = StartServer_IsIdMap(Info_ValueForKey(info, "map"));
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $2085
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 StartServer_IsIdMap
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 1988
;1988:	if (idtype == MAP_RND_BIASID && idmap)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $2162
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2162
line 1989
;1989:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2159
JUMPV
LABELV $2162
line 1990
;1990:	if (idtype == MAP_RND_BIASNONID && !idmap)
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $2164
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2164
line 1991
;1991:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2159
JUMPV
LABELV $2164
line 1993
;1992:
;1993:	if (random() < 0.25)
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1048576000
GEF4 $2166
line 1994
;1994:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2159
JUMPV
LABELV $2166
line 1996
;1995:
;1996:	return qtrue;		
CNSTI4 1
RETI4
LABELV $2159
endproc StartServer_IsBiasedMap 28 8
proc StartServer_ExcludeMap_callback 44 8
line 2008
;1997:}
;1998:
;1999:
;2000:
;2001:
;2002:/*
;2003:=================
;2004:StartServer_ExcludeMap_callback
;2005:=================
;2006:*/
;2007:static qboolean StartServer_ExcludeMap_callback(const char* info)
;2008:{
line 2015
;2009:	int i;
;2010:	const char* mapname;
;2011:	int idtype;
;2012:	int subtype;
;2013:	qboolean idmap;
;2014:
;2015:	subtype = s_scriptdata.map.SourceType;
ADDRLP4 8
ADDRGP4 s_scriptdata+8+1824
INDIRI4
ASGNI4
line 2016
;2016:	if (subtype < MAP_RND_MAX)
ADDRLP4 8
INDIRI4
CNSTI4 5
GEI4 $2171
line 2017
;2017:	{
line 2018
;2018:		idtype = subtype;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
line 2019
;2019:		subtype = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 2020
;2020:	}
ADDRGP4 $2172
JUMPV
LABELV $2171
line 2022
;2021:	else
;2022:	{
line 2023
;2023:		idtype = MAP_RND_ANY;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2024
;2024:		subtype -= MAP_RND_MAX;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 2025
;2025:	}
LABELV $2172
line 2027
;2026:
;2027:	mapname = Info_ValueForKey(info, "map");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2085
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 2028
;2028:	if (!StartServer_MapSupportsBots(mapname))
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 StartServer_MapSupportsBots
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2173
line 2029
;2029:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2173
line 2031
;2030:
;2031:	idmap = StartServer_IsIdMap(mapname);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 StartServer_IsIdMap
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
ASGNI4
line 2032
;2032:	if (idmap && (idtype == MAP_RND_NONID))
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2175
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $2175
line 2033
;2033:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2175
line 2034
;2034:	if (!idmap && (idtype == MAP_RND_ID))
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2177
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $2177
line 2035
;2035:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2177
line 2037
;2036:
;2037:	if (subtype >=0 && !StartServer_IsCustomMapType(mapname, subtype))
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $2179
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 StartServer_IsCustomMapType
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2179
line 2038
;2038:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2179
line 2040
;2039:
;2040:	if (s_scriptdata.map.listSource != MAP_MS_RANDOMEXCLUDE)
ADDRGP4 s_scriptdata+8+1796
INDIRI4
CNSTI4 3
EQI4 $2181
line 2041
;2041:		return qtrue;	
CNSTI4 1
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2181
line 2044
;2042:
;2043:	// check if on exclude list
;2044:	for (i = 0; i < s_scriptdata.map.num_maps; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2188
JUMPV
LABELV $2185
line 2045
;2045:		if (!Q_stricmp(mapname, s_scriptdata.map.data[i].shortName))
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $2190
line 2046
;2046:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2190
LABELV $2186
line 2044
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2188
ADDRLP4 0
INDIRI4
ADDRGP4 s_scriptdata+8
INDIRI4
LTI4 $2185
line 2048
;2047:
;2048:	return qtrue;
CNSTI4 1
RETI4
LABELV $2168
endproc StartServer_ExcludeMap_callback 44 8
proc StartServer_GenerateRandomMaps 8232 16
line 2060
;2049:}
;2050:
;2051:
;2052:
;2053:
;2054:/*
;2055:=================
;2056:StartServer_GenerateRandomMaps
;2057:=================
;2058:*/
;2059:static qboolean StartServer_GenerateRandomMaps(int count)
;2060:{
line 2068
;2061:	int i, j;
;2062:	int map;
;2063:	int failed;
;2064:	int idtype;
;2065:	int maplist[MAX_MAPS_LIST * 2];
;2066:	callbackMapList callback;
;2067:
;2068:	idtype = s_scriptdata.map.SourceType;
ADDRLP4 8204
ADDRGP4 s_scriptdata+8+1824
INDIRI4
ASGNI4
line 2069
;2069:	if (idtype >= MAP_RND_MAX)
ADDRLP4 8204
INDIRI4
CNSTI4 5
LTI4 $2197
line 2070
;2070:	{
line 2071
;2071:		idtype = MAP_RND_ANY;
ADDRLP4 8204
CNSTI4 0
ASGNI4
line 2072
;2072:	}
LABELV $2197
line 2074
;2073:
;2074:	callback = StartServer_ExcludeMap_callback;
ADDRLP4 8208
ADDRGP4 StartServer_ExcludeMap_callback
ASGNP4
line 2075
;2075:	s_serverexec.rnd_nummaps = UI_BuildMapListByType(
ADDRLP4 4
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 8208
INDIRP4
ARGP4
ADDRLP4 8216
ADDRGP4 UI_BuildMapListByType
CALLI4
ASGNI4
ADDRGP4 s_serverexec+147464
ADDRLP4 8216
INDIRI4
ASGNI4
line 2078
;2076:		maplist, MAX_MAPS_LIST * 2, s_scriptdata.gametype, callback);
;2077:
;2078:	if (s_serverexec.rnd_nummaps == 0)
ADDRGP4 s_serverexec+147464
INDIRI4
CNSTI4 0
NEI4 $2200
line 2079
;2079:	{
line 2080
;2080:		StartServer_PrintMessage( "No random maps available");
ADDRGP4 $2203
ARGP4
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2081
;2081:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2194
JUMPV
LABELV $2200
line 2085
;2082:	}
;2083:
;2084:	// try to add the map, but not too hard
;2085:	for (i = 0; i < count; i++)
ADDRLP4 8196
CNSTI4 0
ASGNI4
ADDRGP4 $2207
JUMPV
LABELV $2204
line 2086
;2086:	{
line 2087
;2087:		failed = 0;
ADDRLP4 8200
CNSTI4 0
ASGNI4
LABELV $2208
line 2088
;2088:		do {
line 2089
;2089:			map = Clamp_Random(s_serverexec.rnd_nummaps - 1 );
ADDRGP4 s_serverexec+147464
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 8220
ADDRGP4 Clamp_Random
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8220
INDIRI4
ASGNI4
line 2090
;2090:			if (StartServer_IsBiasedMap(idtype, maplist[map]))
ADDRLP4 8204
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8224
ADDRGP4 StartServer_IsBiasedMap
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
EQI4 $2212
line 2091
;2091:				continue;
LABELV $2212
line 2093
;2092:
;2093:		} while (StartServer_IsRecentMap(i, maplist[map]) && failed++ < 32);
LABELV $2209
ADDRLP4 8196
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8224
ADDRGP4 StartServer_IsRecentMap
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
EQI4 $2214
ADDRLP4 8220
ADDRLP4 8200
INDIRI4
ASGNI4
ADDRLP4 8200
ADDRLP4 8220
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8220
INDIRI4
CNSTI4 32
LTI4 $2208
LABELV $2214
line 2095
;2094:
;2095:		s_serverexec.map_rnd_index[i] = maplist[map];
ADDRLP4 8228
CNSTI4 2
ASGNI4
ADDRLP4 8196
INDIRI4
ADDRLP4 8228
INDIRI4
LSHI4
ADDRGP4 s_serverexec+151580
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8228
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 2096
;2096:	}
LABELV $2205
line 2085
ADDRLP4 8196
ADDRLP4 8196
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2207
ADDRLP4 8196
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $2204
line 2098
;2097:
;2098:	return qtrue;
CNSTI4 1
RETI4
LABELV $2194
endproc StartServer_GenerateRandomMaps 8232 16
proc StartServer_GenerateRandomMapOrder 40 4
line 2109
;2099:}
;2100:
;2101:
;2102:
;2103:/*
;2104:=================
;2105:StartServer_GenerateRandomMapOrder
;2106:=================
;2107:*/
;2108:static void StartServer_GenerateRandomMapOrder( int count, int avoid, int* map_rnd )
;2109:{
line 2113
;2110:	int i, repeat;
;2111:	int src, dest, value;
;2112:
;2113:	for (i = 0; i < count; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2220
JUMPV
LABELV $2217
line 2114
;2114:		map_rnd[i] = i;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $2218
line 2113
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2220
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $2217
line 2116
;2115:
;2116:	repeat = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $2221
line 2117
;2117:	do {
line 2119
;2118:		// do shuffle
;2119:		for (i = 0; i < 2 * count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2227
JUMPV
LABELV $2224
line 2120
;2120:			src = Clamp_Random(count - 1);
ADDRFP4 0
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 24
ADDRGP4 Clamp_Random
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 2121
;2121:			dest = Clamp_Random(count - 1);
ADDRFP4 0
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 28
ADDRGP4 Clamp_Random
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 2122
;2122:			if (src != dest) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2228
line 2123
;2123:				value = map_rnd[src];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 2124
;2124:				map_rnd[src] = map_rnd[dest];
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 2125
;2125:				map_rnd[dest] = value;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2126
;2126:			}
LABELV $2228
line 2127
;2127:		}
LABELV $2225
line 2119
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2227
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 1
LSHI4
LTI4 $2224
line 2128
;2128:		repeat++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2132
;2129:		// avoid matching first value
;2130:		// ensure there might be a different map,
;2131:		// and that we don't try too hard
;2132:	} while (avoid == map_rnd[0] && count > 1 && repeat < 32);
LABELV $2222
ADDRFP4 4
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $2231
ADDRFP4 0
INDIRI4
CNSTI4 1
LEI4 $2231
ADDRLP4 16
INDIRI4
CNSTI4 32
LTI4 $2221
LABELV $2231
line 2133
;2133:}
LABELV $2216
endproc StartServer_GenerateRandomMapOrder 40 4
proc StartServer_WriteMapParams 116 12
line 2146
;2134:
;2135:
;2136:
;2137:
;2138:
;2139:
;2140:/*
;2141:=================
;2142:StartServer_WriteMapParams
;2143:=================
;2144:*/
;2145:static qboolean StartServer_WriteMapParams( void )
;2146:{
line 2155
;2147:	int i, value, count, index, lastmap;
;2148:	int source;
;2149:	int fraglimit, timelimit;
;2150:	const char* info;
;2151:	const char* mapname;
;2152:	qboolean random_order;
;2153:	qboolean random_generate;
;2154:
;2155:	AddScript("\n// WriteMapParams()\n\n");
ADDRGP4 $2233
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2157
;2156:
;2157:	fraglimit = s_scriptdata.map.fragLimit;
ADDRLP4 20
ADDRGP4 s_scriptdata+8+1800
INDIRI4
ASGNI4
line 2158
;2158:	timelimit = s_scriptdata.map.timeLimit;
ADDRLP4 8
ADDRGP4 s_scriptdata+8+1804
INDIRI4
ASGNI4
line 2160
;2159:
;2160:	if (s_scriptdata.map.fragLimitType == MAP_LT_NONE)
ADDRGP4 s_scriptdata+8+1808
INDIRI4
CNSTI4 1
NEI4 $2238
line 2161
;2161:		fraglimit = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $2238
line 2162
;2162:	if (s_scriptdata.map.timeLimitType == MAP_LT_NONE)
ADDRGP4 s_scriptdata+8+1812
INDIRI4
CNSTI4 1
NEI4 $2242
line 2163
;2163:		timelimit = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2242
line 2166
;2164:
;2165:	// set for unlimited frags
;2166:	if (UIE_IsCaptureLimited(s_scriptdata.gametype))
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UIE_IsCaptureLimited
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2246
line 2167
;2167:		AddScript("fraglimit 0\n");
ADDRGP4 $2248
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2246
line 2169
;2168:
;2169:	source = s_scriptdata.map.listSource;
ADDRLP4 44
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ASGNI4
line 2170
;2170:	count = s_serverexec.cycle_count;
ADDRLP4 16
ADDRGP4 s_serverexec+147468
INDIRI4
ASGNI4
line 2172
;2171:
;2172:	random_generate = StartServer_IsRandomGeneratedMapList(source);
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 2173
;2173:	random_order = (source == MAP_MS_RANDOMLIST || random_generate);
ADDRLP4 44
INDIRI4
CNSTI4 1
EQI4 $2255
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2253
LABELV $2255
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $2254
JUMPV
LABELV $2253
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $2254
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 2174
;2174:	if (random_order)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2256
line 2175
;2175:	{
line 2180
;2176:		// the internal Q3 exe script buffer is limited to 16K.
;2177:		// Empirical evidence indicate problems start to happen at about
;2178:		// 80-100 randomly ordered map rotations, so we clip the values
;2179:		// and keep then under 100
;2180:		if (count < 20)
ADDRLP4 16
INDIRI4
CNSTI4 20
GEI4 $2258
line 2181
;2181:			count *= 4;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRGP4 $2259
JUMPV
LABELV $2258
line 2182
;2182:		else if (count < 40)
ADDRLP4 16
INDIRI4
CNSTI4 40
GEI4 $2260
line 2183
;2183:			count *= 2;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $2260
LABELV $2259
line 2185
;2184:
;2185:		if (count > MAX_MAPS_LIST)
ADDRLP4 16
INDIRI4
CNSTI4 1024
LEI4 $2262
line 2186
;2186:			count = MAX_MAPS_LIST;
ADDRLP4 16
CNSTI4 1024
ASGNI4
LABELV $2262
line 2187
;2187:	}
LABELV $2256
line 2189
;2188:
;2189:	s_serverexec.random_generate = random_generate;
ADDRGP4 s_serverexec+147472
ADDRLP4 32
INDIRI4
ASGNI4
line 2190
;2190:	s_serverexec.random_order = random_order;
ADDRGP4 s_serverexec+147476
ADDRLP4 28
INDIRI4
ASGNI4
line 2191
;2191:	s_serverexec.random_count = count;
ADDRGP4 s_serverexec+147480
ADDRLP4 16
INDIRI4
ASGNI4
line 2193
;2192:
;2193:	if (StartServer_IsRandomGeneratedMapList(source) && !StartServer_GenerateRandomMaps(s_serverexec.cycle_count))
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $2267
ADDRGP4 s_serverexec+147468
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 StartServer_GenerateRandomMaps
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $2267
line 2194
;2194:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2232
JUMPV
LABELV $2267
line 2197
;2195:
;2196:	// generate the random order before we do the output
;2197:	if (random_order) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2270
line 2198
;2198:		lastmap = -1;
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 2199
;2199:		for (i = 0; i < count; i += s_serverexec.cycle_count) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2275
JUMPV
LABELV $2272
line 2200
;2200:			if (i > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $2277
line 2201
;2201:				lastmap = s_serverexec.map_rnd[ i - 1 ];
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+147484-4
ADDP4
INDIRI4
ASGNI4
LABELV $2277
line 2202
;2202:			StartServer_GenerateRandomMapOrder(s_serverexec.cycle_count, lastmap, &s_serverexec.map_rnd[i]);
ADDRGP4 s_serverexec+147468
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+147484
ADDP4
ARGP4
ADDRGP4 StartServer_GenerateRandomMapOrder
CALLV
pop
line 2203
;2203:		}
LABELV $2273
line 2199
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 s_serverexec+147468
INDIRI4
ADDI4
ASGNI4
LABELV $2275
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2272
line 2204
;2204:	}
LABELV $2270
line 2207
;2205:
;2206:	// build the script
;2207:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2286
JUMPV
LABELV $2283
line 2209
;2208:		// we start with the "in order" index
;2209:		index = i % s_serverexec.cycle_count;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 s_serverexec+147468
INDIRI4
MODI4
ASGNI4
line 2212
;2210:
;2211:		// now adjust the index for a random map order
;2212:		if (random_order) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2288
line 2213
;2213:			if ( index == 0 && i > 0)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $2290
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $2290
line 2214
;2214:				AddScript("\n");
ADDRGP4 $2292
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2290
line 2216
;2215:
;2216:			index = s_serverexec.map_rnd[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+147484
ADDP4
INDIRI4
ASGNI4
line 2217
;2217:		}
LABELV $2288
line 2220
;2218:
;2219:		// create the variable in the script
;2220:		AddScript(va("set m%i \"", i));
ADDRGP4 $2294
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2223
;2221:
;2222:		// find and error check the map limits
;2223:		if (s_scriptdata.map.fragLimitType == MAP_LT_CUSTOM)
ADDRGP4 s_scriptdata+8+1808
INDIRI4
CNSTI4 2
NEI4 $2295
line 2224
;2224:			fraglimit = atoi(s_scriptdata.map.data[index].fragLimit);
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4+48
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $2295
line 2225
;2225:		if (s_scriptdata.map.timeLimitType == MAP_LT_CUSTOM)
ADDRGP4 s_scriptdata+8+1812
INDIRI4
CNSTI4 2
NEI4 $2302
line 2226
;2226:			timelimit = atoi(s_scriptdata.map.data[index].timeLimit);
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4+52
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 76
INDIRI4
ASGNI4
LABELV $2302
line 2228
;2227:
;2228:		if (timelimit == 0 && fraglimit == 0 && s_serverexec.cycle_count > 1)
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $2309
ADDRLP4 20
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $2309
ADDRGP4 s_serverexec+147468
INDIRI4
CNSTI4 1
LEI4 $2309
line 2229
;2229:			timelimit = 30;
ADDRLP4 8
CNSTI4 30
ASGNI4
LABELV $2309
line 2232
;2230:
;2231:		// write the map limits
;2232:		AddScript(va("timelimit %i; ", timelimit));
ADDRGP4 $2312
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2234
;2233:
;2234:		if (UIE_IsCaptureLimited(s_scriptdata.gametype))
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 UIE_IsCaptureLimited
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $2313
line 2235
;2235:			AddScript(va("capturelimit %i; ", fraglimit));
ADDRGP4 $2315
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
ADDRGP4 $2314
JUMPV
LABELV $2313
line 2237
;2236:		else
;2237:			AddScript(va("fraglimit %i; ", fraglimit));
ADDRGP4 $2316
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2314
line 2239
;2238:
;2239:		if (s_scriptdata.server.preventConfigBug)
ADDRGP4 s_scriptdata+3676+176
INDIRI4
CNSTI4 0
EQI4 $2317
line 2240
;2240:			AddScript("writeconfig q3config; ");
ADDRGP4 $2321
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2317
line 2243
;2241:
;2242:		// write map name
;2243:		if (random_generate) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2322
line 2244
;2244:			info = UI_GetArenaInfoByNumber(s_serverexec.map_rnd_index[index]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+151580
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 100
INDIRP4
ASGNP4
line 2245
;2245:			mapname = Info_ValueForKey(info, "map");
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $2085
ARGP4
ADDRLP4 104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 104
INDIRP4
ASGNP4
line 2246
;2246:		}
ADDRGP4 $2323
JUMPV
LABELV $2322
line 2247
;2247:		else {
line 2248
;2248:			mapname = s_scriptdata.map.data[index].shortName;
ADDRLP4 24
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ASGNP4
line 2249
;2249:		}
LABELV $2323
line 2251
;2250:		
;2251:		if (s_scriptdata.gametype != GT_SINGLE){
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 2
EQI4 $2327
line 2252
;2252:		AddScript("set cl_sprun 0; ");
ADDRGP4 $2329
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2253
;2253:		AddScript(va("map %s; ", mapname));
ADDRGP4 $2330
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2254
;2254:		} else {
ADDRGP4 $2328
JUMPV
LABELV $2327
line 2255
;2255:		AddScript("set cl_sprun 1; ");
ADDRGP4 $2331
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2256
;2256:		AddScript(va("spmap %s; ", mapname));
ADDRGP4 $2332
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2257
;2257:		}
LABELV $2328
line 2260
;2258:
;2259:		// sort the bots out
;2260:		AddScript("vstr "SERVER_KICKBOT"; vstr "SERVER_ADDBOT"; ");
ADDRGP4 $2333
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2263
;2261:
;2262:		// set gravity if overriding default
;2263:		if (s_scriptdata.server.gravity != 800)
ADDRGP4 s_scriptdata+3676+392
INDIRI4
CNSTI4 800
EQI4 $2334
line 2264
;2264:			AddScript(va("g_gravity %i; ", s_scriptdata.server.gravity));
ADDRGP4 $2338
ARGP4
ADDRGP4 s_scriptdata+3676+392
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2334
line 2267
;2265:		
;2266:		// newcvars
;2267:			AddScript(va("g_jumpheight %i; ", s_scriptdata.server.jumpheight));
ADDRGP4 $2341
ARGP4
ADDRGP4 s_scriptdata+3676+436
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2270
;2268:
;2269:		// terminate string
;2270:		value = (i + 1) % count;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 16
INDIRI4
MODI4
ASGNI4
line 2271
;2271:		if (value == 0 && !s_scriptdata.map.Repeat) {
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 108
INDIRI4
NEI4 $2344
ADDRGP4 s_scriptdata+8+1816
INDIRI4
ADDRLP4 108
INDIRI4
NEI4 $2344
line 2273
;2272:			// don't loop map list
;2273:			AddScript("\"\n");
ADDRGP4 $2348
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2274
;2274:			continue;
ADDRGP4 $2284
JUMPV
LABELV $2344
line 2276
;2275:		}
;2276:		AddScript(va("set nextmap vstr m%i\"\n", value));
ADDRGP4 $2349
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2277
;2277:	}
LABELV $2284
line 2207
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2286
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2283
line 2279
;2278:
;2279:	s_serverexec.map_generated = qtrue;
ADDRGP4 s_serverexec+155792
CNSTI4 1
ASGNI4
line 2280
;2280:	return qtrue;
CNSTI4 1
RETI4
LABELV $2232
endproc StartServer_WriteMapParams 116 12
proc LoadServer_WriteMapParams 108 8
line 2289
;2281:}
;2282:
;2283:/*
;2284:=================
;2285:LoadServer_WriteMapParams
;2286:=================
;2287:*/
;2288:static qboolean LoadServer_WriteMapParams( void )
;2289:{
line 2298
;2290:	int i, value, count, index, lastmap;
;2291:	int source;
;2292:	int fraglimit, timelimit;
;2293:	const char* info;
;2294:	const char* mapname;
;2295:	qboolean random_order;
;2296:	qboolean random_generate;
;2297:
;2298:	AddScript("\n// WriteMapParams()\n\n");
ADDRGP4 $2233
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2300
;2299:
;2300:	fraglimit = s_scriptdata.map.fragLimit;
ADDRLP4 16
ADDRGP4 s_scriptdata+8+1800
INDIRI4
ASGNI4
line 2301
;2301:	timelimit = s_scriptdata.map.timeLimit;
ADDRLP4 4
ADDRGP4 s_scriptdata+8+1804
INDIRI4
ASGNI4
line 2303
;2302:
;2303:	if (s_scriptdata.map.fragLimitType == MAP_LT_NONE)
ADDRGP4 s_scriptdata+8+1808
INDIRI4
CNSTI4 1
NEI4 $2356
line 2304
;2304:		fraglimit = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $2356
line 2305
;2305:	if (s_scriptdata.map.timeLimitType == MAP_LT_NONE)
ADDRGP4 s_scriptdata+8+1812
INDIRI4
CNSTI4 1
NEI4 $2360
line 2306
;2306:		timelimit = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2360
line 2309
;2307:
;2308:	// set for unlimited frags
;2309:	if (UIE_IsCaptureLimited(s_scriptdata.gametype))
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UIE_IsCaptureLimited
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2364
line 2310
;2310:		AddScript("fraglimit 0\n");
ADDRGP4 $2248
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2364
line 2312
;2311:
;2312:	source = s_scriptdata.map.listSource;
ADDRLP4 36
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ASGNI4
line 2313
;2313:	count = s_serverexec.cycle_count;
ADDRLP4 24
ADDRGP4 s_serverexec+147468
INDIRI4
ASGNI4
line 2315
;2314:
;2315:	random_generate = StartServer_IsRandomGeneratedMapList(source);
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 52
INDIRI4
ASGNI4
line 2316
;2316:	random_order = (source == MAP_MS_RANDOMLIST || random_generate);
ADDRLP4 36
INDIRI4
CNSTI4 1
EQI4 $2372
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $2370
LABELV $2372
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $2371
JUMPV
LABELV $2370
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $2371
ADDRLP4 40
ADDRLP4 56
INDIRI4
ASGNI4
line 2318
;2317:
;2318:	s_serverexec.random_generate = random_generate;
ADDRGP4 s_serverexec+147472
ADDRLP4 20
INDIRI4
ASGNI4
line 2319
;2319:	s_serverexec.random_order = random_order;
ADDRGP4 s_serverexec+147476
ADDRLP4 40
INDIRI4
ASGNI4
line 2320
;2320:	s_serverexec.random_count = count;
ADDRGP4 s_serverexec+147480
ADDRLP4 24
INDIRI4
ASGNI4
line 2323
;2321:
;2322:	// build the script
;2323:	for (i = 0; i < 1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2376
line 2325
;2324:		// we start with the "in order" index
;2325:		index = i % s_serverexec.cycle_count;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ADDRGP4 s_serverexec+147468
INDIRI4
MODI4
ASGNI4
line 2328
;2326:
;2327:		// create the variable in the script
;2328:		AddScript(va("set m%i \"", i));
ADDRGP4 $2294
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2331
;2329:
;2330:		// find and error check the map limits
;2331:		if (s_scriptdata.map.fragLimitType == MAP_LT_CUSTOM)
ADDRGP4 s_scriptdata+8+1808
INDIRI4
CNSTI4 2
NEI4 $2381
line 2332
;2332:			fraglimit = atoi(s_scriptdata.map.data[index].fragLimit);
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4+48
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
LABELV $2381
line 2333
;2333:		if (s_scriptdata.map.timeLimitType == MAP_LT_CUSTOM)
ADDRGP4 s_scriptdata+8+1812
INDIRI4
CNSTI4 2
NEI4 $2388
line 2334
;2334:			timelimit = atoi(s_scriptdata.map.data[index].timeLimit);
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4+52
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
LABELV $2388
line 2336
;2335:
;2336:		if (timelimit == 0 && fraglimit == 0 && s_serverexec.cycle_count > 1)
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $2395
ADDRLP4 16
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $2395
ADDRGP4 s_serverexec+147468
INDIRI4
CNSTI4 1
LEI4 $2395
line 2337
;2337:			timelimit = 30;
ADDRLP4 4
CNSTI4 30
ASGNI4
LABELV $2395
line 2340
;2338:
;2339:		// write the map limits
;2340:		AddScript(va("timelimit %i; ", timelimit));
ADDRGP4 $2312
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2342
;2341:
;2342:		if (UIE_IsCaptureLimited(s_scriptdata.gametype))
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 UIE_IsCaptureLimited
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $2398
line 2343
;2343:			AddScript(va("capturelimit %i; ", fraglimit));
ADDRGP4 $2315
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
ADDRGP4 $2399
JUMPV
LABELV $2398
line 2345
;2344:		else
;2345:			AddScript(va("fraglimit %i; ", fraglimit));
ADDRGP4 $2316
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2399
line 2347
;2346:
;2347:		if (s_scriptdata.server.preventConfigBug)
ADDRGP4 s_scriptdata+3676+176
INDIRI4
CNSTI4 0
EQI4 $2400
line 2348
;2348:			AddScript("writeconfig q3config; ");
ADDRGP4 $2321
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2400
line 2351
;2349:
;2350:		// write map name
;2351:		if (random_generate) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $2404
line 2352
;2352:			info = UI_GetArenaInfoByNumber(s_serverexec.map_rnd_index[index]);
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverexec+151580
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 92
INDIRP4
ASGNP4
line 2353
;2353:			mapname = Info_ValueForKey(info, "map");
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $2085
ARGP4
ADDRLP4 96
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 96
INDIRP4
ASGNP4
line 2354
;2354:		}
ADDRGP4 $2405
JUMPV
LABELV $2404
line 2355
;2355:		else {
line 2356
;2356:			mapname = s_scriptdata.map.data[index].shortName;
ADDRLP4 32
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ASGNP4
line 2357
;2357:		}
LABELV $2405
line 2359
;2358:		
;2359:		if (s_scriptdata.gametype != GT_SINGLE){
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 2
EQI4 $2409
line 2360
;2360:		AddScript(va("map %s; ", UI_ArenaScriptAutoChar( "save_curmap" )));
ADDRGP4 $2411
ARGP4
ADDRLP4 92
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $2330
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2361
;2361:		} else {
ADDRGP4 $2410
JUMPV
LABELV $2409
line 2362
;2362:		AddScript(va("spmap %s; ", UI_ArenaScriptAutoChar( "save_curmap" )));
ADDRGP4 $2411
ARGP4
ADDRLP4 92
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $2332
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2363
;2363:		}
LABELV $2410
line 2366
;2364:
;2365:		// sort the bots out
;2366:		AddScript("vstr "SERVER_KICKBOT"; vstr "SERVER_ADDBOT"; ");
ADDRGP4 $2333
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2369
;2367:
;2368:		// set gravity if overriding default
;2369:		if (s_scriptdata.server.gravity != 800)
ADDRGP4 s_scriptdata+3676+392
INDIRI4
CNSTI4 800
EQI4 $2412
line 2370
;2370:			AddScript(va("g_gravity %i; ", s_scriptdata.server.gravity));
ADDRGP4 $2338
ARGP4
ADDRGP4 s_scriptdata+3676+392
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2412
line 2373
;2371:		
;2372:		// newcvars
;2373:			AddScript(va("g_jumpheight %i; ", s_scriptdata.server.jumpheight));
ADDRGP4 $2341
ARGP4
ADDRGP4 s_scriptdata+3676+436
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2376
;2374:
;2375:		// terminate string
;2376:		value = (i + 1) % count;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 2377
;2377:		if (value == 0 && !s_scriptdata.map.Repeat) {
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $2420
ADDRGP4 s_scriptdata+8+1816
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $2420
line 2379
;2378:			// don't loop map list
;2379:			AddScript("\"\n");
ADDRGP4 $2348
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2380
;2380:			continue;
ADDRGP4 $2377
JUMPV
LABELV $2420
line 2382
;2381:		}
;2382:		AddScript(va("set nextmap vstr m%i\"\n", value));
ADDRGP4 $2349
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2383
;2383:	}
LABELV $2377
line 2323
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $2376
line 2385
;2384:
;2385:	s_serverexec.map_generated = qtrue;
ADDRGP4 s_serverexec+155792
CNSTI4 1
ASGNI4
line 2386
;2386:	return qtrue;
CNSTI4 1
RETI4
LABELV $2351
endproc LoadServer_WriteMapParams 108 8
proc StartServer_WriteItemParams 20 12
line 2397
;2387:}
;2388:
;2389:
;2390:
;2391:/*
;2392:=================
;2393:StartServer_WriteItemParams
;2394:=================
;2395:*/
;2396:static qboolean StartServer_WriteItemParams( void )
;2397:{
line 2402
;2398:	int 		i, j;
;2399:	int 		type;
;2400:	qboolean	disable;
;2401:
;2402:	AddScript("\n// WriteItemParams()\n\n");
ADDRGP4 $2426
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2405
;2403:
;2404:	// write out the disabled items list
;2405:	for (i = 0; i < ITEM_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2427
line 2406
;2406:	{
line 2407
;2407:		disable = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2408
;2408:		type = s_scriptdata.item.groupstate[ server_itemlist[i].groupid ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+3452
ADDP4
INDIRI4
ASGNI4
line 2409
;2409:		if (type == ALLGROUPS_HIDDEN) {
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $2432
line 2410
;2410:			disable = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2411
;2411:		}	
ADDRGP4 $2433
JUMPV
LABELV $2432
line 2412
;2412:		else if (type == ALLGROUPS_CUSTOM) {
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $2434
line 2413
;2413:			disable = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2414
;2414:			if (s_scriptdata.item.enabled[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+3452+24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2436
line 2415
;2415:				disable = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2436
line 2416
;2416:		}
LABELV $2434
LABELV $2433
line 2418
;2417:
;2418:		AddScript(va("set disable_%s %i\n", server_itemlist[i].mapitem, disable));
ADDRGP4 $2440
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2419
;2419:	}
LABELV $2428
line 2405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2427
line 2421
;2420:
;2421:	return qtrue;
CNSTI4 1
RETI4
LABELV $2425
endproc StartServer_WriteItemParams 20 12
export UIE_Parse
proc UIE_Parse 40 0
line 2439
;2422:}
;2423:
;2424:
;2425:
;2426:static	char	uie_token[MAX_TOKEN_CHARS];
;2427:static	int		uie_lines;
;2428:
;2429:
;2430:/*
;2431:=================
;2432:UIE_Parse
;2433:
;2434:Custom version of COM_ParseExt() that ignores // comments
;2435:We shouldn't modify the version in q_shared.c
;2436:=================
;2437:*/
;2438:char *UIE_Parse( char **data_p)
;2439:{
line 2440
;2440:	int c = 0, len;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2442
;2441:	int cc;
;2442:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2446
;2443:	char *data;
;2444:	qboolean allowLineBreaks;
;2445:
;2446:	allowLineBreaks = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2447
;2447:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 2448
;2448:	len = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2449
;2449:	uie_token[0] = 0;
ADDRGP4 uie_token
CNSTI1 0
ASGNI1
line 2452
;2450:
;2451:	// make sure incoming data is valid
;2452:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2446
line 2453
;2453:	{
line 2454
;2454:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 2455
;2455:		return uie_token;
ADDRGP4 uie_token
RETP4
ADDRGP4 $2442
JUMPV
line 2459
;2456:	}
;2457:
;2458:	while ( 1 )
;2459:	{
LABELV $2448
line 2462
;2460:		// skip whitespace
;2461:
;2462:		while( (cc = *data) <= ' ') {
line 2463
;2463:			if( !cc ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2451
line 2464
;2464:				data = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2465
;2465:				break;
ADDRGP4 $2450
JUMPV
LABELV $2451
line 2467
;2466:			}
;2467:			if( cc == '\n' ) {
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $2453
line 2468
;2468:				uie_lines++;
ADDRLP4 24
ADDRGP4 uie_lines
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2469
;2469:				hasNewLines = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2470
;2470:			}
LABELV $2453
line 2471
;2471:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2472
;2472:		}
LABELV $2449
line 2462
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 32
LEI4 $2448
LABELV $2450
line 2474
;2473:
;2474:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2455
line 2475
;2475:		{
line 2476
;2476:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 2477
;2477:			return uie_token;
ADDRGP4 uie_token
RETP4
ADDRGP4 $2442
JUMPV
LABELV $2455
line 2479
;2478:		}
;2479:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2457
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $2457
line 2480
;2480:		{
line 2481
;2481:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2482
;2482:			return uie_token;
ADDRGP4 uie_token
RETP4
ADDRGP4 $2442
JUMPV
LABELV $2457
line 2485
;2483:		}
;2484:
;2485:		c = *data;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 2488
;2486:
;2487:		// skip /* */ comments
;2488:		if ( c=='/' && data[1] == '*' )
ADDRLP4 8
INDIRI4
CNSTI4 47
NEI4 $2447
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2447
line 2489
;2489:		{
line 2490
;2490:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $2462
JUMPV
LABELV $2461
line 2492
;2491:			while ( *data && ( *data != '*' || data[1] != '/' ) )
;2492:			{
line 2493
;2493:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2494
;2494:			}
LABELV $2462
line 2491
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2464
ADDRLP4 36
INDIRI4
CNSTI4 42
NEI4 $2461
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $2461
LABELV $2464
line 2495
;2495:			if ( *data )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2460
line 2496
;2496:			{
line 2497
;2497:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 2498
;2498:			}
line 2499
;2499:		}
line 2501
;2500:		else
;2501:		{
line 2502
;2502:			break;
LABELV $2460
line 2504
;2503:		}
;2504:	}
LABELV $2446
line 2458
ADDRGP4 $2449
JUMPV
LABELV $2447
line 2507
;2505:
;2506:	// handle quoted strings
;2507:	if (c == '\"')
ADDRLP4 8
INDIRI4
CNSTI4 34
NEI4 $2467
line 2508
;2508:	{
line 2509
;2509:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $2470
JUMPV
LABELV $2469
line 2511
;2510:		while (1)
;2511:		{
line 2512
;2512:			c = *data++;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 2513
;2513:			if (c=='\"' || !c)
ADDRLP4 8
INDIRI4
CNSTI4 34
EQI4 $2474
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2472
LABELV $2474
line 2514
;2514:			{
line 2515
;2515:				uie_token[len] = 0;
ADDRLP4 16
INDIRI4
ADDRGP4 uie_token
ADDP4
CNSTI1 0
ASGNI1
line 2516
;2516:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2517
;2517:				return uie_token;
ADDRGP4 uie_token
RETP4
ADDRGP4 $2442
JUMPV
LABELV $2472
line 2519
;2518:			}
;2519:			if (len < MAX_TOKEN_CHARS)
ADDRLP4 16
INDIRI4
CNSTI4 1024
GEI4 $2475
line 2520
;2520:			{
line 2521
;2521:				uie_token[len] = c;
ADDRLP4 16
INDIRI4
ADDRGP4 uie_token
ADDP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 2522
;2522:				len++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2523
;2523:			}
LABELV $2475
line 2524
;2524:		}
LABELV $2470
line 2510
ADDRGP4 $2469
JUMPV
line 2525
;2525:	}
LABELV $2467
LABELV $2477
line 2529
;2526:
;2527:	// parse a regular word
;2528:	do
;2529:	{
line 2530
;2530:		if (len < MAX_TOKEN_CHARS)
ADDRLP4 16
INDIRI4
CNSTI4 1024
GEI4 $2480
line 2531
;2531:		{
line 2532
;2532:			uie_token[len] = c;
ADDRLP4 16
INDIRI4
ADDRGP4 uie_token
ADDP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 2533
;2533:			len++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2534
;2534:		}
LABELV $2480
line 2535
;2535:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2536
;2536:		c = *data;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 2537
;2537:		if ( c == '\n' )
ADDRLP4 8
INDIRI4
CNSTI4 10
NEI4 $2482
line 2538
;2538:			uie_lines++;
ADDRLP4 24
ADDRGP4 uie_lines
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2482
line 2539
;2539:	} while (c>32);
LABELV $2478
ADDRLP4 8
INDIRI4
CNSTI4 32
GTI4 $2477
line 2541
;2540:
;2541:	if (len == MAX_TOKEN_CHARS)
ADDRLP4 16
INDIRI4
CNSTI4 1024
NEI4 $2484
line 2542
;2542:	{
line 2544
;2543://		Com_Printf ("Token exceeded %i chars, discarded.\n", MAX_TOKEN_CHARS);
;2544:		len = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2545
;2545:	}
LABELV $2484
line 2546
;2546:	uie_token[len] = 0;
ADDRLP4 16
INDIRI4
ADDRGP4 uie_token
ADDP4
CNSTI1 0
ASGNI1
line 2548
;2547:
;2548:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2549
;2549:	return uie_token;
ADDRGP4 uie_token
RETP4
LABELV $2442
endproc UIE_Parse 40 0
export StartServer_LoadFromConfig
proc StartServer_LoadFromConfig 592 12
line 2561
;2550:}
;2551:
;2552:
;2553:
;2554:
;2555:/*
;2556:=================
;2557:StartServer_LoadFromConfig
;2558:=================
;2559:*/
;2560:qboolean StartServer_LoadFromConfig( const char* filename)
;2561:{
line 2572
;2562:	fileHandle_t 	handle;
;2563:	char			cvar[CVAR_BUFFER];
;2564:	int 			len;
;2565:	char* 			begin;
;2566:	char* 			end;
;2567:	char*			ptr;
;2568:	char* 			token;
;2569:	int 			gametype;
;2570:
;2571:	// load the script, re-use the server script buffer
;2572:	len = trap_FS_FOpenFile(filename, &handle, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 532
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 524
ADDRLP4 540
INDIRI4
ASGNI4
line 2573
;2573:	if (len <= 0)
ADDRLP4 524
INDIRI4
CNSTI4 0
GTI4 $2487
line 2574
;2574:	{
line 2575
;2575:		Com_Printf("Config file not found: %s\n", filename);
ADDRGP4 $2489
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2576
;2576:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2487
line 2579
;2577:	}
;2578:
;2579:    UIE_StartServer_LoadSkirmishCvars();
ADDRGP4 UIE_StartServer_LoadSkirmishCvars
CALLV
pop
line 2581
;2580:
;2581:	if (len >= SCRIPT_BUFFER)
ADDRLP4 524
INDIRI4
CNSTI4 131071
LTI4 $2490
line 2582
;2582:		len = SCRIPT_BUFFER - 1;
ADDRLP4 524
CNSTI4 131070
ASGNI4
LABELV $2490
line 2584
;2583:
;2584:	trap_FS_Read(s_serverexec.server_script, len, handle);
ADDRGP4 s_serverexec
ARGP4
ADDRLP4 524
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 2585
;2585:	s_serverexec.server_script[len] = '\0';
ADDRLP4 524
INDIRI4
ADDRGP4 s_serverexec
ADDP4
CNSTI1 0
ASGNI1
line 2586
;2586:	trap_FS_FCloseFile(handle);
ADDRLP4 532
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2589
;2587:
;2588:	// find the begin and end of block terminators
;2589:	begin = strstr(s_serverexec.server_script, BEGIN_PARAMETER_BLOCK);
ADDRGP4 s_serverexec
ARGP4
ADDRGP4 $2492
ARGP4
ADDRLP4 544
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 544
INDIRP4
ASGNP4
line 2590
;2590:	end = strstr(s_serverexec.server_script, END_PARAMETER_BLOCK);
ADDRGP4 s_serverexec
ARGP4
ADDRGP4 $2493
ARGP4
ADDRLP4 548
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 536
ADDRLP4 548
INDIRP4
ASGNP4
line 2592
;2591:
;2592:	if (begin == 0) {
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2494
line 2593
;2593:		StartServer_PrintMessage(va("Config file %s has no BEGIN block\n", filename));
ADDRGP4 $2496
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2594
;2594:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2494
line 2597
;2595:	}
;2596:
;2597:	if (end == 0) {
ADDRLP4 536
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2497
line 2598
;2598:		StartServer_PrintMessage(va("Config file %s has no END block\n", filename));
ADDRGP4 $2499
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2599
;2599:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2497
line 2602
;2600:	}
;2601:
;2602:	if (begin > end) {
ADDRLP4 528
INDIRP4
CVPU4 4
ADDRLP4 536
INDIRP4
CVPU4 4
LEU4 $2500
line 2603
;2603:		StartServer_PrintMessage(va("Config file %s has bad parameter block\n", filename));
ADDRGP4 $2502
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2604
;2604:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2500
line 2610
;2605:	}
;2606:
;2607:	// scan in parameters
;2608:	// first token will be BEGIN, after that we have
;2609:	// Cvar/value pairs until we hit the END block
;2610:	ptr = begin;
ADDRLP4 516
ADDRLP4 528
INDIRP4
ASGNP4
line 2611
;2611:	gametype = -1;
ADDRLP4 520
CNSTI4 -1
ASGNI4
line 2612
;2612:	COM_Parse(&ptr);	// drop BEGIN
ADDRLP4 516
ARGP4
ADDRGP4 COM_Parse
CALLP4
pop
LABELV $2503
line 2614
;2613:
;2614:	do {
line 2616
;2615:		// grab Cvar name
;2616:		token = UIE_Parse(&ptr);
ADDRLP4 516
ARGP4
ADDRLP4 552
ADDRGP4 UIE_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 552
INDIRP4
ASGNP4
line 2617
;2617:		if (!token) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2506
line 2619
;2618:			// should never happen, unless tampered with
;2619:			StartServer_PrintMessage(va("Unexpected end of %s, possible corruption or tampering\n", filename));
ADDRGP4 $2508
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 556
INDIRP4
ARGP4
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2620
;2620:			return qtrue;	// update anyway... fingers crossed
CNSTI4 1
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2506
line 2624
;2621:		}
;2622:
;2623:		// backward compatibility with earlier cfg save data format
;2624:		if (strlen(token) > 2 && token[0] == '/' && token[1] == '/') {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 2
LEI4 $2509
ADDRLP4 564
CNSTI4 47
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 564
INDIRI4
NEI4 $2509
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 564
INDIRI4
NEI4 $2509
line 2625
;2625:			token += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 2626
;2626:		}
LABELV $2509
line 2628
;2627:
;2628:		if (!Q_stricmp(token, END_PARAMETER_BLOCK))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2493
ARGP4
ADDRLP4 568
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 0
NEI4 $2511
line 2629
;2629:			break;
ADDRGP4 $2505
JUMPV
LABELV $2511
line 2631
;2630:
;2631:		if (*token == '*') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2513
line 2632
;2632:			if (gametype == -1) {
ADDRLP4 520
INDIRI4
CNSTI4 -1
NEI4 $2515
line 2633
;2633:				StartServer_PrintMessage(va("Unknown gametype from %s, possible corruption or tampering\n", filename));
ADDRGP4 $2517
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 572
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 572
INDIRP4
ARGP4
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2636
;2634:
;2635:				// restore last saved cvar list
;2636:				UIE_StartServer_LoadSkirmishCvars();
ADDRGP4 UIE_StartServer_LoadSkirmishCvars
CALLV
pop
line 2637
;2637:				return qfalse;	// don't update
CNSTI4 0
RETI4
ADDRGP4 $2486
JUMPV
LABELV $2515
line 2639
;2638:			}
;2639:			Q_strncpyz(cvar, va(gametype_cvar_base[gametype], token + 1), CVAR_BUFFER);
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_cvar_base
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 572
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 572
INDIRP4
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2640
;2640:		}
ADDRGP4 $2514
JUMPV
LABELV $2513
line 2642
;2641:		else
;2642:			Q_strncpyz(cvar, token, CVAR_BUFFER);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $2514
line 2645
;2643:
;2644:		// grab value
;2645:		token = UIE_Parse(&ptr);
ADDRLP4 516
ARGP4
ADDRLP4 572
ADDRGP4 UIE_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 572
INDIRP4
ASGNP4
line 2646
;2646:		UIE_ConvertOldCvar(cvar, CVAR_BUFFER);
ADDRLP4 4
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 UIE_ConvertOldCvar
CALLV
pop
line 2648
;2647:
;2648:		if (uis.debug)
ADDRGP4 uis+11392
INDIRI4
CNSTI4 0
EQI4 $2518
line 2649
;2649:			Com_Printf("Cvar: %s=%s\n", cvar, token);
ADDRGP4 $2521
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $2518
line 2651
;2650:
;2651:		if (UIE_SkirmishCvarExists(NULL, cvar)) {
CNSTP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 576
ADDRGP4 UIE_SkirmishCvarExists
CALLI4
ASGNI4
ADDRLP4 576
INDIRI4
CNSTI4 0
EQI4 $2522
line 2652
;2652:			UIE_SetSkirmishCvar(NULL, cvar, token);
CNSTP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UIE_SetSkirmishCvar
CALLV
pop
line 2653
;2653:		}
LABELV $2522
line 2656
;2654:
;2655:		// must get gametype before we can process "*cvarName" Cvars
;2656:		if (!Q_stricmp(cvar,"uie_gametype")) {
ADDRLP4 4
ARGP4
ADDRGP4 $93
ARGP4
ADDRLP4 580
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 580
INDIRI4
CNSTI4 0
NEI4 $2524
line 2657
;2657:			gametype = (int)Com_Clamp(0, MAX_GAME_TYPE - 1, atoi(token));
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 584
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTF4 0
ARGF4
CNSTF4 1095761920
ARGF4
ADDRLP4 584
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 588
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 520
ADDRLP4 588
INDIRF4
CVFI4 4
ASGNI4
line 2658
;2658:		}
LABELV $2524
line 2660
;2659:
;2660:	} while (qtrue);
LABELV $2504
ADDRGP4 $2503
JUMPV
LABELV $2505
line 2662
;2661:
;2662:	UIE_StartServer_SaveSkirmishCvars();
ADDRGP4 UIE_StartServer_SaveSkirmishCvars
CALLV
pop
line 2663
;2663:	return qtrue;
CNSTI4 1
RETI4
LABELV $2486
endproc StartServer_LoadFromConfig 592 12
proc StartServer_WriteScriptCvar 1044 16
line 2675
;2664:}
;2665:
;2666:
;2667:
;2668:
;2669:/*
;2670:=================
;2671:StartServer_WriteScriptCvar
;2672:=================
;2673:*/
;2674:static void StartServer_WriteScriptCvar( const char* cvarTemplate )
;2675:{
line 2680
;2676:	char 	buffer[MAX_INFO_STRING];
;2677:	const char*	cvar;
;2678:	char* 	s;
;2679:
;2680:	if (!cvarTemplate || !*cvarTemplate)
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2529
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2527
LABELV $2529
line 2681
;2681:		return;
ADDRGP4 $2526
JUMPV
LABELV $2527
line 2683
;2682:
;2683:	if (*cvarTemplate == '*') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2530
line 2684
;2684:		cvar = cvarTemplate + 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2685
;2685:		s = gametype_cvar_base[s_scriptdata.gametype];
ADDRLP4 4
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_cvar_base
ADDP4
INDIRP4
ASGNP4
line 2686
;2686:	}
ADDRGP4 $2531
JUMPV
LABELV $2530
line 2687
;2687:	else {
line 2688
;2688:		cvar = cvarTemplate;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2689
;2689:		s = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2690
;2690:	}
LABELV $2531
line 2692
;2691:
;2692:	if (UIE_GetSkirmishCvar(s, cvar, buffer, MAX_INFO_STRING)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1036
ADDRGP4 UIE_GetSkirmishCvar
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $2532
line 2693
;2693:		AddScript(va("//%s \"%s\"\n", cvarTemplate, buffer));
ADDRGP4 $2534
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2694
;2694:	}
LABELV $2532
line 2695
;2695:}
LABELV $2526
endproc StartServer_WriteScriptCvar 1044 16
proc StartServer_WriteScriptParams 16 4
line 2705
;2696:
;2697:
;2698:
;2699:/*
;2700:=================
;2701:StartServer_WriteScriptParams
;2702:=================
;2703:*/
;2704:static qboolean StartServer_WriteScriptParams( void )
;2705:{
line 2710
;2706:	const char*	cvar;
;2707:	int  	i, count;
;2708:	char*	s;
;2709:
;2710:	AddScript("\n// WriteScriptParams()\n\n");
ADDRGP4 $2536
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2712
;2711:
;2712:	AddScript("// This block of data allows UIE to load\n");
ADDRGP4 $2537
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2713
;2713:	AddScript("// this script back into the map/bot setup pages.\n");
ADDRGP4 $2538
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2714
;2714:	AddScript("// Don't edit the contents!!!\n");
ADDRGP4 $2539
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2715
;2715:	AddScript("//"BEGIN_PARAMETER_BLOCK"\n");
ADDRGP4 $2540
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2717
;2716:
;2717:    UIE_StartServer_LoadSkirmishCvars();
ADDRGP4 UIE_StartServer_LoadSkirmishCvars
CALLV
pop
line 2720
;2718:
;2719:	// save the common parameters
;2720:	for (i = 0; saveparam_list[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2544
JUMPV
LABELV $2541
line 2721
;2721:		StartServer_WriteScriptCvar(saveparam_list[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 saveparam_list
ADDP4
INDIRP4
ARGP4
ADDRGP4 StartServer_WriteScriptCvar
CALLV
pop
line 2722
;2722:	}
LABELV $2542
line 2720
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2544
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 saveparam_list
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2541
line 2724
;2723:
;2724:   if (uis.punkbuster) {
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
EQI4 $2545
line 2725
;2725:		StartServer_WriteScriptCvar("uie_punkbuster");
ADDRGP4 $2548
ARGP4
ADDRGP4 StartServer_WriteScriptCvar
CALLV
pop
line 2726
;2726:   }
LABELV $2545
line 2738
;2727:
;2728:	// save the gametype specific parameters
;2729:/*	count = sizeof(customsaveparam_list)/sizeof(customsaveparam_list[0]);
;2730:	for (i = 0 ; i < count; i++)
;2731:	{
;2732:		if (customsaveparam_list[i].type != s_scriptdata.gametype)
;2733:			continue;
;2734:		StartServer_WriteScriptCvar(customsaveparam_list[i].param);
;2735:	}*/
;2736:
;2737:	// close off the block
;2738:	AddScript("//"END_PARAMETER_BLOCK"\n\n");
ADDRGP4 $2549
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2739
;2739:	return qtrue;
CNSTI4 1
RETI4
LABELV $2535
endproc StartServer_WriteScriptParams 16 4
proc StartServer_ExecuteScript 16 12
line 2750
;2740:}
;2741:
;2742:
;2743:
;2744:/*
;2745:=================
;2746:StartServer_ExecuteScript
;2747:=================
;2748:*/
;2749:static qboolean StartServer_ExecuteScript(const char* scriptFile)
;2750:{
line 2754
;2751:	fileHandle_t f;
;2752:	int len;
;2753:
;2754:	if (!s_serverexec.server_script[0])
ADDRGP4 s_serverexec
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2551
line 2755
;2755:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2550
JUMPV
LABELV $2551
line 2757
;2756:
;2757:	if (scriptFile) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2553
line 2758
;2758:		len = strlen( s_serverexec.server_script );
ADDRGP4 s_serverexec
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 2759
;2759:		trap_FS_FOpenFile(scriptFile, &f, FS_WRITE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 2760
;2760:		if ( !f) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2555
line 2761
;2761:			StartServer_PrintMessage( va( "Can't open file (%s)", scriptFile) );
ADDRGP4 $2557
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
ADDRGP4 StartServer_PrintMessage
CALLV
pop
line 2762
;2762:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2550
JUMPV
LABELV $2555
line 2765
;2763:		}
;2764:
;2765:		trap_FS_Write( s_serverexec.server_script, len, f );
ADDRGP4 s_serverexec
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 2767
;2766:
;2767:		trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2768
;2768:	}
ADDRGP4 $2554
JUMPV
LABELV $2553
line 2769
;2769:	else {
line 2770
;2770:		trap_Cmd_ExecuteText( EXEC_APPEND, s_serverexec.server_script );
CNSTI4 2
ARGI4
ADDRGP4 s_serverexec
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2771
;2771:	}
LABELV $2554
line 2773
;2772:
;2773:	return qtrue;
CNSTI4 1
RETI4
LABELV $2550
endproc StartServer_ExecuteScript 16 12
export StartServer_CreateServer
proc StartServer_CreateServer 48 8
line 2786
;2774:}
;2775:
;2776:
;2777:
;2778:/*
;2779:=================
;2780:StartServer_CreateServer
;2781:
;2782:Data for generating script must already be loaded and initialized
;2783:=================
;2784:*/
;2785:qboolean StartServer_CreateServer(const char* scriptFile)
;2786:{
line 2796
;2787:	int i;
;2788:	float f;
;2789:	char* teamjoin;
;2790:
;2791://	StartServer_InitScriptData();
;2792:
;2793:	// shift random number generator
;2794:	// otherwise we see identical map and bot rotations
;2795:
;2796:	for (i = uis.realtime % 200; i; i--)
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
MODI4
ASGNI4
ADDRGP4 $2562
JUMPV
LABELV $2559
line 2797
;2797:		f = random();
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
LABELV $2560
line 2796
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2562
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2559
line 2799
;2798:
;2799:	if (!StartServer_InitServerExec())
ADDRLP4 16
ADDRGP4 StartServer_InitServerExec
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2564
line 2800
;2800:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2564
line 2802
;2801:
;2802:	if (scriptFile) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2566
line 2803
;2803:		AddScript("// Script generated by \"QSandbox\" " DMOD_VERSION "\n");
ADDRGP4 $2568
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2804
;2804:	}
LABELV $2566
line 2809
;2805:
;2806:	//
;2807:	// script recovery parameters
;2808:	//
;2809:	if (scriptFile && !StartServer_WriteScriptParams())
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2569
ADDRLP4 20
ADDRGP4 StartServer_WriteScriptParams
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2569
line 2810
;2810:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2569
line 2815
;2811:
;2812:	//
;2813:	// item parameters
;2814:	//
;2815:	if (!StartServer_WriteItemParams())
ADDRLP4 24
ADDRGP4 StartServer_WriteItemParams
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2571
line 2816
;2816:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2571
line 2821
;2817:
;2818:	//
;2819:	// map parameters
;2820:	//
;2821:	if (!StartServer_WriteMapParams())
ADDRLP4 28
ADDRGP4 StartServer_WriteMapParams
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2573
line 2822
;2822:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2573
line 2829
;2823:
;2824:	//
;2825:	// bot parameters
;2826:	//
;2827:
;2828:	// bot parameters written may depend on map ordering
;2829:	if (!StartServer_WriteBotParams())
ADDRLP4 32
ADDRGP4 StartServer_WriteBotParams
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2575
line 2830
;2830:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2575
line 2837
;2831:
;2832:	//
;2833:	// server parameters
;2834:	//
;2835:
;2836:	// server parameters may depend on bot generation
;2837:	if (!StartServer_WriteServerParams())
ADDRLP4 36
ADDRGP4 StartServer_WriteServerParams
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2577
line 2838
;2838:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2558
JUMPV
LABELV $2577
line 2843
;2839:
;2840:	//
;2841:	// force player to join team/specs
;2842:	//
;2843:	if (s_scriptdata.server.dedicatedServer == SRVDED_OFF) {
ADDRGP4 s_scriptdata+3676+180
INDIRI4
CNSTI4 0
NEI4 $2579
line 2844
;2844:		if (scriptFile)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2583
line 2845
;2845:			AddScript("\n// Things that need to be done when first map starts\n");
ADDRGP4 $2585
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2583
line 2847
;2846:
;2847:		AddScript("set activeAction \"");
ADDRGP4 $2586
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2849
;2848:
;2849:		teamjoin = "forceteam %i free";
ADDRLP4 8
ADDRGP4 $2587
ASGNP4
line 2850
;2850:		if (s_scriptdata.bot.joinAs) {
ADDRGP4 s_scriptdata+1948+1464
INDIRI4
CNSTI4 0
EQI4 $2588
line 2851
;2851:			teamjoin = "forceteam %i spectator";
ADDRLP4 8
ADDRGP4 $2592
ASGNP4
line 2852
;2852:		}
ADDRGP4 $2589
JUMPV
LABELV $2588
line 2853
;2853:		else if (s_scriptdata.gametype >= GT_TEAM) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 4
LTI4 $2593
line 2855
;2854:			// use %%i so a single %i is generated for player client
;2855:			teamjoin = va("forceteam %%i %s", bot_teamname[StartServer_GetPlayerTeam()]);
ADDRLP4 40
ADDRGP4 StartServer_GetPlayerTeam
CALLI4
ASGNI4
ADDRGP4 $2595
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 bot_teamname
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
ASGNP4
line 2856
;2856:		}
ADDRGP4 $2594
JUMPV
LABELV $2593
line 2857
;2857:		else if (s_scriptdata.gametype == GT_TOURNAMENT) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 3
NEI4 $2596
line 2858
;2858:			for (i = 0; i < s_serverexec.player_client; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2601
JUMPV
LABELV $2598
line 2859
;2859:				AddScript(va("forceteam %i spectator;", i));
ADDRGP4 $2603
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2599
line 2858
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2601
ADDRLP4 0
INDIRI4
ADDRGP4 s_serverexec+147460
INDIRI4
LTI4 $2598
line 2860
;2860:		}
LABELV $2596
LABELV $2594
LABELV $2589
line 2862
;2861:
;2862:		AddScript(va(teamjoin, s_serverexec.player_client));
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_serverexec+147460
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2863
;2863:		AddScript("\"\n");
ADDRGP4 $2348
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2864
;2864:	}
LABELV $2579
line 2867
;2865:
;2866:	// start the map rotation running
;2867:	AddScript("\n");
ADDRGP4 $2292
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2868
;2868:	if (scriptFile)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2605
line 2869
;2869:		AddScript("// start map rotation\n");
ADDRGP4 $2607
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2605
line 2871
;2870:
;2871:	AddScript("vstr m0\n");
ADDRGP4 $2608
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2876
;2872:
;2873:	//
;2874:	// execute!
;2875:	//
;2876:	return StartServer_ExecuteScript( scriptFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 StartServer_ExecuteScript
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $2558
endproc StartServer_CreateServer 48 8
export StartServer_LoadServer
proc StartServer_LoadServer 48 8
line 2887
;2877:}
;2878:
;2879:/*
;2880:=================
;2881:StartServer_LoadServer
;2882:
;2883:Data for generating script must already be loaded and initialized
;2884:=================
;2885:*/
;2886:qboolean StartServer_LoadServer(const char* scriptFile)
;2887:{
line 2897
;2888:	int i;
;2889:	float f;
;2890:	char* teamjoin;
;2891:
;2892://	StartServer_InitScriptData();
;2893:
;2894:	// shift random number generator
;2895:	// otherwise we see identical map and bot rotations
;2896:
;2897:	for (i = uis.realtime % 200; i; i--)
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
MODI4
ASGNI4
ADDRGP4 $2613
JUMPV
LABELV $2610
line 2898
;2898:		f = random();
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
LABELV $2611
line 2897
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2613
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2610
line 2900
;2899:
;2900:	if (!StartServer_InitServerExec())
ADDRLP4 16
ADDRGP4 StartServer_InitServerExec
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2615
line 2901
;2901:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2609
JUMPV
LABELV $2615
line 2903
;2902:
;2903:	if (scriptFile) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2617
line 2904
;2904:		AddScript("// Script generated by \"QSandbox\" " DMOD_VERSION "\n");
ADDRGP4 $2568
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2905
;2905:	}
LABELV $2617
line 2910
;2906:
;2907:	//
;2908:	// script recovery parameters
;2909:	//
;2910:	if (scriptFile && !StartServer_WriteScriptParams())
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2619
ADDRLP4 20
ADDRGP4 StartServer_WriteScriptParams
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2619
line 2911
;2911:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2609
JUMPV
LABELV $2619
line 2916
;2912:
;2913:	//
;2914:	// item parameters
;2915:	//
;2916:	if (!StartServer_WriteItemParams())
ADDRLP4 24
ADDRGP4 StartServer_WriteItemParams
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2621
line 2917
;2917:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2609
JUMPV
LABELV $2621
line 2922
;2918:
;2919:	//
;2920:	// map parameters
;2921:	//
;2922:	if (!LoadServer_WriteMapParams())
ADDRLP4 28
ADDRGP4 LoadServer_WriteMapParams
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2623
line 2923
;2923:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2609
JUMPV
LABELV $2623
line 2930
;2924:
;2925:	//
;2926:	// bot parameters
;2927:	//
;2928:
;2929:	// bot parameters written may depend on map ordering
;2930:	if (!StartServer_WriteBotParams())
ADDRLP4 32
ADDRGP4 StartServer_WriteBotParams
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2625
line 2931
;2931:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2609
JUMPV
LABELV $2625
line 2938
;2932:
;2933:	//
;2934:	// server parameters
;2935:	//
;2936:
;2937:	// server parameters may depend on bot generation
;2938:	if (!StartServer_WriteServerParams())
ADDRLP4 36
ADDRGP4 StartServer_WriteServerParams
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2627
line 2939
;2939:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2609
JUMPV
LABELV $2627
line 2944
;2940:
;2941:	//
;2942:	// force player to join team/specs
;2943:	//
;2944:	if (s_scriptdata.server.dedicatedServer == SRVDED_OFF) {
ADDRGP4 s_scriptdata+3676+180
INDIRI4
CNSTI4 0
NEI4 $2629
line 2945
;2945:		if (scriptFile)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2633
line 2946
;2946:			AddScript("\n// Things that need to be done when first map starts\n");
ADDRGP4 $2585
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2633
line 2948
;2947:
;2948:		AddScript("set activeAction \"");
ADDRGP4 $2586
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2950
;2949:
;2950:		teamjoin = "forceteam %i free";
ADDRLP4 8
ADDRGP4 $2587
ASGNP4
line 2951
;2951:		if (s_scriptdata.bot.joinAs) {
ADDRGP4 s_scriptdata+1948+1464
INDIRI4
CNSTI4 0
EQI4 $2635
line 2952
;2952:			teamjoin = "forceteam %i spectator";
ADDRLP4 8
ADDRGP4 $2592
ASGNP4
line 2953
;2953:		}
ADDRGP4 $2636
JUMPV
LABELV $2635
line 2954
;2954:		else if (s_scriptdata.gametype >= GT_TEAM) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 4
LTI4 $2639
line 2956
;2955:			// use %%i so a single %i is generated for player client
;2956:			teamjoin = va("forceteam %%i %s", bot_teamname[StartServer_GetPlayerTeam()]);
ADDRLP4 40
ADDRGP4 StartServer_GetPlayerTeam
CALLI4
ASGNI4
ADDRGP4 $2595
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 bot_teamname
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
ASGNP4
line 2957
;2957:		}
ADDRGP4 $2640
JUMPV
LABELV $2639
line 2958
;2958:		else if (s_scriptdata.gametype == GT_TOURNAMENT) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 3
NEI4 $2641
line 2959
;2959:			for (i = 0; i < s_serverexec.player_client; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2646
JUMPV
LABELV $2643
line 2960
;2960:				AddScript(va("forceteam %i spectator;", i));
ADDRGP4 $2603
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2644
line 2959
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2646
ADDRLP4 0
INDIRI4
ADDRGP4 s_serverexec+147460
INDIRI4
LTI4 $2643
line 2961
;2961:		}
LABELV $2641
LABELV $2640
LABELV $2636
line 2963
;2962:
;2963:		AddScript(va(teamjoin, s_serverexec.player_client));
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_serverexec+147460
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2964
;2964:		AddScript("\"\n");
ADDRGP4 $2348
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2965
;2965:	}
LABELV $2629
line 2968
;2966:
;2967:	// start the map rotation running
;2968:	AddScript("\n");
ADDRGP4 $2292
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2969
;2969:	if (scriptFile)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2649
line 2970
;2970:		AddScript("// start map rotation\n");
ADDRGP4 $2607
ARGP4
ADDRGP4 AddScript
CALLV
pop
LABELV $2649
line 2972
;2971:
;2972:	AddScript("vstr m0\n");
ADDRGP4 $2608
ARGP4
ADDRGP4 AddScript
CALLV
pop
line 2977
;2973:
;2974:	//
;2975:	// execute!
;2976:	//
;2977:	return StartServer_ExecuteScript( scriptFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 StartServer_ExecuteScript
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $2609
endproc StartServer_LoadServer 48 8
bss
align 4
LABELV uie_lines
skip 4
align 1
LABELV uie_token
skip 1024
align 4
LABELV s_serverexec
skip 155800
import mapfilter_itemsru
import mapfilter_items
import gametype_cvar_base
import randommaptype_itemsru
import randommaptype_items
import gametype_itemsru
import gametype_items
import idmap_list
import UI_LoadMapTypeInfo
import StartServer_MapIconFromType
import StartServer_IsCustomMapType
import StartServer_DrawMapPicture
import StartServer_InitMapPicture
import StartServer_InitMapPictureFromIndex
import StartServer_NumCustomMapTypes
import StartServer_MapSupportsBots
import StartServer_SetIconFromGameType
import UI_BuildMapListByType
import GametypeBits
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
import UIE_DefaultIconFromGameType
import UIE_StartServer_RegisterDisableCvars
import UIE_InGame_EnabledItems
import UI_ServerPlayerIcon
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
LABELV $2608
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 109
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $2607
byte 1 47
byte 1 47
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $2603
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 105
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
byte 1 59
byte 1 0
align 1
LABELV $2595
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2592
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 105
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
byte 1 0
align 1
LABELV $2587
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $2586
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $2585
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2568
byte 1 47
byte 1 47
byte 1 32
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 34
byte 1 81
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 34
byte 1 32
byte 1 77
byte 1 105
byte 1 84
byte 1 101
byte 1 99
byte 1 104
byte 1 10
byte 1 0
align 1
LABELV $2557
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $2549
byte 1 47
byte 1 47
byte 1 69
byte 1 78
byte 1 68
byte 1 95
byte 1 85
byte 1 73
byte 1 69
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 65
byte 1 77
byte 1 69
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2548
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2540
byte 1 47
byte 1 47
byte 1 66
byte 1 69
byte 1 71
byte 1 73
byte 1 78
byte 1 95
byte 1 85
byte 1 73
byte 1 69
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 65
byte 1 77
byte 1 69
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $2539
byte 1 47
byte 1 47
byte 1 32
byte 1 68
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 33
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $2538
byte 1 47
byte 1 47
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2537
byte 1 47
byte 1 47
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 115
byte 1 32
byte 1 85
byte 1 73
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2536
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 40
byte 1 41
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2534
byte 1 47
byte 1 47
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2521
byte 1 67
byte 1 118
byte 1 97
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2517
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
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 97
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2508
byte 1 85
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
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 97
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2502
byte 1 67
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
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $2499
byte 1 67
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
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 69
byte 1 78
byte 1 68
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $2496
byte 1 67
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
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 66
byte 1 69
byte 1 71
byte 1 73
byte 1 78
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $2493
byte 1 69
byte 1 78
byte 1 68
byte 1 95
byte 1 85
byte 1 73
byte 1 69
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 65
byte 1 77
byte 1 69
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $2492
byte 1 66
byte 1 69
byte 1 71
byte 1 73
byte 1 78
byte 1 95
byte 1 85
byte 1 73
byte 1 69
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 65
byte 1 77
byte 1 69
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $2489
byte 1 67
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
byte 1 10
byte 1 0
align 1
LABELV $2440
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $2426
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 40
byte 1 41
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2411
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
LABELV $2349
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 109
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2348
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2341
byte 1 103
byte 1 95
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2338
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2333
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 59
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2332
byte 1 115
byte 1 112
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2331
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 49
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2330
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2329
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 48
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2321
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
byte 1 113
byte 1 51
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2316
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2315
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
byte 1 32
byte 1 37
byte 1 105
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2312
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $2294
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 37
byte 1 105
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $2292
byte 1 10
byte 1 0
align 1
LABELV $2248
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $2233
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 40
byte 1 41
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2203
byte 1 78
byte 1 111
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 109
byte 1 97
byte 1 112
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
byte 1 0
align 1
LABELV $2143
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 49
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2142
byte 1 10
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 34
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 48
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2136
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 32
byte 1 34
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2135
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2134
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $2133
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 34
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2132
byte 1 47
byte 1 47
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 115
byte 1 32
byte 1 39
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 10
byte 1 0
align 1
LABELV $2127
byte 1 94
byte 1 49
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 66
byte 1 111
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2123
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 66
byte 1 111
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 40
byte 1 41
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2085
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2042
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2025
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 37
byte 1 105
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2024
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 37
byte 1 105
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2019
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $2011
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 37
byte 1 105
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $2010
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2007
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 37
byte 1 105
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $1990
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 49
byte 1 32
byte 1 34
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1989
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 49
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1983
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 98
byte 1 48
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $1982
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 48
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 32
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 98
byte 1 48
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1965
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $1964
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1961
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1933
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1920
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $1887
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $1855
byte 1 37
byte 1 52
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $1847
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1800
byte 1 10
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $1797
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1794
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 80
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1791
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1782
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1777
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1772
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1765
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1746
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1743
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1740
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1737
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1734
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1692
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 66
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1689
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1686
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1681
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1678
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1677
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1676
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1673
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1672
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $1663
byte 1 0
align 1
LABELV $1662
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1653
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1652
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1651
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $1650
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $1639
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1636
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1633
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1630
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1627
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1624
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1621
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1618
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1615
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1612
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1609
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1606
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1603
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1600
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1597
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1594
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1591
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1588
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1585
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1582
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1579
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1576
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1573
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1570
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1567
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1564
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1561
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1558
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1555
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1552
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1549
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1546
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1543
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1540
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1537
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1534
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1531
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1528
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1525
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1522
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1519
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1516
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1513
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1510
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1507
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1504
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1501
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1498
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1495
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1492
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1489
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1486
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1483
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1480
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1477
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1474
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1471
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1468
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1465
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1462
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1459
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1456
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1453
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1450
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1447
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1444
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1441
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1438
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1435
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1432
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1429
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1426
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1423
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1420
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1417
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1414
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1411
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1408
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1405
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1402
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1399
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1396
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1393
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1390
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1387
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1384
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1381
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1378
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1375
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1372
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1369
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1366
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1363
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1360
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1357
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1354
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1351
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1348
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1345
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1342
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1339
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1336
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1333
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1330
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1327
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1324
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1321
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1318
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1315
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1312
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1309
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1306
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1303
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1300
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1297
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1294
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1291
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1288
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1285
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1282
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1279
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1276
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1273
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1270
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1267
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1264
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1261
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1258
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1255
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1252
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1249
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1246
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1243
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1240
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1237
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1234
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1231
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1228
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1225
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1222
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1219
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1216
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1213
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1210
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1207
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1204
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1201
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1198
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1195
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1192
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1189
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1186
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1183
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1180
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1177
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1174
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1171
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1168
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1165
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1162
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1159
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1156
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1153
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1150
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1147
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1144
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1141
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1138
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1135
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1132
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1129
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1126
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1123
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1120
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1117
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1114
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1111
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1108
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1105
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 104
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1102
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1099
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1096
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1093
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1090
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1087
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1084
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1081
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1078
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1075
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1072
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1069
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1066
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1063
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1060
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 108
byte 1 111
byte 1 119
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1057
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1054
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1051
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1048
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1045
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1042
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1039
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1036
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1033
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1030
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1027
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1024
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1021
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1018
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1015
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1012
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1009
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 98
byte 1 105
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1006
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1003
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1000
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $997
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $994
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
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
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $991
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $988
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $985
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $982
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $979
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $976
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $973
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $970
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $967
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $964
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $961
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $958
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $955
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $952
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $949
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $946
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $943
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $940
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $937
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $934
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $931
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $928
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $925
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $922
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $919
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $916
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $913
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $910
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $907
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $904
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $901
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $898
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $895
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $892
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $889
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $886
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $883
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $880
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $877
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $874
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $871
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $868
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $865
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $862
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $859
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $856
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $853
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $850
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $847
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $844
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $841
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $838
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $835
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $832
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $829
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $826
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 114
byte 1 101
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $823
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $820
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $817
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $814
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $811
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $808
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $805
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $802
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $799
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $796
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $793
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $790
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $787
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $784
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $781
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $778
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $775
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $772
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $769
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $766
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $763
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $760
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $757
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $754
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $751
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $748
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $745
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $742
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $739
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $736
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $733
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $730
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $727
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $724
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $721
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $718
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $715
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $712
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $709
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $706
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $701
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $698
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $695
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $692
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $689
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $686
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $683
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $680
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $677
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $674
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $671
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
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
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $668
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 108
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $665
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $662
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $659
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $656
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $653
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $650
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $647
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 111
byte 1 110
byte 1 101
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $644
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $641
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $638
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 98
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $635
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $632
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 103
byte 1 101
byte 1 110
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $629
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 103
byte 1 101
byte 1 110
byte 1 80
byte 1 101
byte 1 114
byte 1 105
byte 1 111
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $626
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $623
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $620
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $617
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $611
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $608
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $605
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $602
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 115
byte 1 118
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 65
byte 1 117
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $596
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $590
byte 1 115
byte 1 118
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $587
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $584
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $578
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $576
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
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $572
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $571
byte 1 94
byte 1 49
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 66
byte 1 111
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $567
byte 1 10
byte 1 47
byte 1 47
byte 1 32
byte 1 87
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 80
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 40
byte 1 41
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $565
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 69
byte 1 120
byte 1 101
byte 1 99
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $522
byte 1 94
byte 1 49
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $509
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $508
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $507
byte 1 42
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $506
byte 1 42
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
LABELV $505
byte 1 42
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
LABELV $504
byte 1 42
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
LABELV $503
byte 1 42
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 83
byte 1 119
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $502
byte 1 42
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 66
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $501
byte 1 42
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $500
byte 1 42
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $499
byte 1 42
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $498
byte 1 42
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $497
byte 1 42
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $496
byte 1 42
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 72
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $495
byte 1 42
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 71
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $494
byte 1 42
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $493
byte 1 42
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
LABELV $492
byte 1 42
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 65
byte 1 115
byte 1 0
align 1
LABELV $491
byte 1 42
byte 1 66
byte 1 111
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $490
byte 1 42
byte 1 66
byte 1 111
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $489
byte 1 42
byte 1 66
byte 1 111
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $488
byte 1 42
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $487
byte 1 42
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $486
byte 1 42
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $485
byte 1 42
byte 1 66
byte 1 111
byte 1 116
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
LABELV $484
byte 1 42
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $483
byte 1 42
byte 1 98
byte 1 111
byte 1 116
byte 1 101
byte 1 120
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $482
byte 1 42
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $481
byte 1 42
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $480
byte 1 42
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 77
byte 1 97
byte 1 112
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $479
byte 1 42
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 77
byte 1 97
byte 1 112
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $478
byte 1 42
byte 1 77
byte 1 97
byte 1 112
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $477
byte 1 42
byte 1 77
byte 1 97
byte 1 112
byte 1 82
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $476
byte 1 42
byte 1 109
byte 1 97
byte 1 112
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 120
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $475
byte 1 42
byte 1 109
byte 1 97
byte 1 112
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $474
byte 1 42
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $473
byte 1 42
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
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
byte 1 115
byte 1 0
align 1
LABELV $472
byte 1 42
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $471
byte 1 42
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $470
byte 1 42
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $469
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $468
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $467
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $466
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $465
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $464
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $463
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $462
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $461
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $460
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $459
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $458
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $457
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $456
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $455
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $454
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $453
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $452
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $451
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $450
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $449
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $448
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $447
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $446
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $445
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $444
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $443
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $442
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $441
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $440
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $439
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 116
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $438
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $437
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $436
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $435
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $434
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $433
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $432
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $431
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $430
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $429
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $428
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $427
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $426
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $425
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $424
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $423
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $422
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $421
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $420
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $419
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $418
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $417
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $416
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $415
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $414
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $413
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $412
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $411
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $410
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $409
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $408
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $407
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $406
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $405
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $404
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $403
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $402
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $401
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $400
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $399
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $398
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $397
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $396
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $395
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $394
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $393
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $392
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $391
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $390
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $389
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $388
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $387
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $386
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $385
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $384
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $383
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $382
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $381
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $380
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $379
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $378
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $377
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $376
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $375
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $374
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $373
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $372
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $371
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $370
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $369
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $368
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $367
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $366
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $365
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $364
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $363
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $362
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $361
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $360
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $359
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $358
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $357
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $356
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $355
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $354
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $353
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $352
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $351
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $350
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $349
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $348
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $347
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $346
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $345
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $344
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $343
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $342
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $341
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $340
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $339
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $338
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $337
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $336
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $335
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $334
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $333
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $332
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
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
LABELV $331
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $330
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $329
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $328
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $327
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $326
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $325
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $324
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $323
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $321
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $320
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $319
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $318
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $317
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $316
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $315
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $314
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $313
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $312
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $311
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $310
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $309
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $308
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $307
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $306
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $305
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $304
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $303
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $302
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $301
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $300
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $299
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $298
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $297
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $296
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $295
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $294
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $293
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $292
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $291
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 104
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $290
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $289
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $288
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $287
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $286
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $285
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $284
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $283
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $282
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $281
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $280
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $279
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $278
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $277
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $276
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $275
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 108
byte 1 111
byte 1 119
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $274
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $273
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
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
LABELV $272
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $271
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $270
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $269
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $268
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $267
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $266
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $265
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $264
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $263
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $262
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $261
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $259
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $258
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 98
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $257
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $256
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $255
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $254
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $253
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
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
LABELV $252
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $251
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $250
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $248
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $247
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $246
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $245
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $244
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $243
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $242
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $241
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $240
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $239
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $238
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $237
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $236
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $235
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $234
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $232
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
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
LABELV $231
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $230
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $229
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $227
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $226
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $225
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 108
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
LABELV $224
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $223
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $222
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $220
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
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
byte 1 0
align 1
LABELV $219
byte 1 117
byte 1 105
byte 1 101
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
LABELV $218
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $217
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
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
LABELV $216
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $214
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $213
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $212
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $211
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $210
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 108
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
LABELV $209
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $208
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $207
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $206
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $205
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
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
byte 1 0
align 1
LABELV $204
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
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
LABELV $203
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $202
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $201
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $200
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $199
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $197
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $196
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $195
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $194
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $193
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $192
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $191
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $190
byte 1 117
byte 1 105
byte 1 101
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
byte 1 114
byte 1 101
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $189
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $188
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $187
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $186
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $185
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $184
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $183
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $182
byte 1 117
byte 1 105
byte 1 101
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
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
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
LABELV $181
byte 1 117
byte 1 105
byte 1 101
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
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
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
LABELV $180
byte 1 117
byte 1 105
byte 1 101
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
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $179
byte 1 117
byte 1 105
byte 1 101
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
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $178
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $177
byte 1 117
byte 1 105
byte 1 101
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
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $176
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $175
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
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
LABELV $174
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $173
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $172
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $171
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
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
LABELV $170
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
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
LABELV $169
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $168
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
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
LABELV $167
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $166
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $165
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $164
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
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
LABELV $163
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $162
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
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
LABELV $161
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $160
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $159
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $158
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $157
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $156
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $155
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
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
byte 1 0
align 1
LABELV $154
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $152
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $151
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $150
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $149
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $148
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $146
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $145
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $144
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $143
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $142
byte 1 117
byte 1 105
byte 1 101
byte 1 95
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
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $141
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 108
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $137
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $136
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $134
byte 1 117
byte 1 105
byte 1 101
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
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 111
byte 1 110
byte 1 101
byte 1 119
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $133
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $132
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $131
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 117
byte 1 98
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $130
byte 1 117
byte 1 105
byte 1 101
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
LABELV $129
byte 1 117
byte 1 105
byte 1 101
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
byte 1 103
byte 1 101
byte 1 110
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $128
byte 1 117
byte 1 105
byte 1 101
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
byte 1 103
byte 1 101
byte 1 110
byte 1 80
byte 1 101
byte 1 114
byte 1 105
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $127
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $126
byte 1 117
byte 1 105
byte 1 101
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
LABELV $125
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $123
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $122
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $121
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 65
byte 1 117
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $118
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $117
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $116
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 118
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $113
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $112
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $111
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $110
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $109
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 77
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $108
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 77
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $107
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $105
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $104
byte 1 117
byte 1 105
byte 1 101
byte 1 95
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
LABELV $103
byte 1 117
byte 1 105
byte 1 101
byte 1 95
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
LABELV $102
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $101
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $100
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $97
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $96
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 97
byte 1 120
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $94
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 117
byte 1 105
byte 1 101
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
