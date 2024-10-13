data
export cvar_items
align 4
LABELV cvar_items
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
address $89
address $90
address $91
address $92
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
address $144
address $145
address $146
address $147
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
byte 4 0
export admcvar_items
align 4
LABELV admcvar_items
address $419
address $420
address $421
address $422
address $423
address $424
address $425
address $426
byte 4 0
export item_items
align 4
LABELV item_items
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
byte 4 0
export SandbOffset
align 4
LABELV SandbOffset
byte 4 0
export tool_spawnpreset_arg
code
proc tool_spawnpreset_arg 0 0
file "../../../code/q3_ui/ui_sandbox.c"
line 492
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3://
;4:// ui_sandbox.c
;5://
;6:
;7:#include "ui_local.h"
;8:
;9:
;10:#define SANDBOX_FRAME	"menu/art/cut_frame"
;11:
;12:#define ID_LIST			100
;13:#define ID_CLASSLIST	101
;14:#define ID_TEXTURESLIST	102
;15:#define ID_SPAWNOBJECT	103
;16:#define ID_PRIV			104
;17:#define ID_SAVEMAP		105
;18:#define ID_LOADMAP		106
;19:#define ID_TAB1			107
;20:#define ID_TAB2			108
;21:#define ID_TAB3			109
;22:#define ID_TAB4			110
;23:#define ID_TAB5			111
;24:#define ID_TAB6			112
;25:#define ID_TAB7			113
;26:#define ID_TAB8			114
;27:#define ID_TAB9			115
;28:#define ID_TAB10		116
;29:#define ID_CLOSE		117
;30:#define ID_SWITCHTAB	118
;31:
;32:#define PROPERTIES_NUM	18
;33:
;34:#define MODIF(i) s_sandboxmain.modif[i].field.buffer
;35:#define MODIF_LIST MODIF(0), MODIF(1), MODIF(2), MODIF(3), MODIF(4), MODIF(5), MODIF(6), MODIF(7), MODIF(8), MODIF(9), MODIF(10), MODIF(11), MODIF(12), MODIF(13), MODIF(14), MODIF(15), MODIF(16), MODIF(17)
;36:
;37:typedef struct
;38:{
;39:	menuframework_s	menu;
;40:	menubitmap_s	frame;
;41:	menutext_s		spawnobject;
;42:	menuradiobutton_s		priv;
;43:	menufield_s		grid;
;44:	menutext_s		savemap;
;45:	menutext_s		loadmap;
;46:	menutext_s		propstext;
;47:	menutext_s		classtext;
;48:	menufield_s		modif[PROPERTIES_NUM];
;49:	menuobject_s	list;
;50:	menuobject_s	classlist;
;51:	menuobject_s	texturelist;
;52:	menutext_s		tab1;
;53:	menutext_s		tab2;
;54:	menutext_s		tab3;
;55:	menutext_s		tab4;
;56:	menutext_s		tab5;
;57:	menutext_s		tab6;
;58:	menutext_s		tab7;
;59:	menutext_s		tab8;
;60:	menutext_s		tab9;
;61:	menutext_s		tab10;
;62:	menutext_s		close;
;63:	menutext_s		switchtab;
;64:	
;65:	char			names[524288];
;66:	char			names2[524288];
;67:	char*			configlist[524288];
;68:	char*			classeslist[65536];
;69:	char*			textureslist[65536];
;70:	char*			botclasslist[65536];
;71:	char*			toollist[65536];
;72:	char*			cvar_itemslist[524288];
;73:	char*			item_itemslist[524288];
;74:} sandboxmain_t;
;75:
;76:	char* 			cvar_items[] = {
;77:	"g_minigame",
;78:	"g_ghspeed",
;79:	"g_ghtimeout",
;80:	"g_gdelay",
;81:	"g_gdamage",
;82:	"g_grange",
;83:	"g_gknockback",
;84:	"g_mgdelay",
;85:	"g_mgdamage",
;86:	"g_mgspread",
;87:	"g_mgexplode",
;88:	"g_mgsdamage",
;89:	"g_mgsradius",
;90:	"g_mgvampire",
;91:	"g_mginf",
;92:	"g_mgknockback",
;93:	"g_sgdelay",
;94:	"g_sgdamage",
;95:	"g_sgspread",
;96:	"g_sgexplode",
;97:	"g_sgsdamage",
;98:	"g_sgsradius",
;99:	"g_sgcount",
;100:	"g_sgvampire",
;101:	"g_sginf",
;102:	"g_sgknockback",
;103:	"g_gldelay",
;104:	"g_glspeed",
;105:	"g_gltimeout",
;106:	"g_glsradius",
;107:	"g_glsdamage",
;108:	"g_gldamage",
;109:	"g_glbounce",
;110:	"g_glgravity",
;111:	"g_glvampire",
;112:	"g_glinf",
;113:	"g_glbouncemodifier",
;114:	"g_glknockback",
;115:	"g_rldelay",
;116:	"g_rlspeed",
;117:	"g_rltimeout",
;118:	"g_rlsradius",
;119:	"g_rlsdamage",
;120:	"g_rldamage",
;121:	"g_rlbounce",
;122:	"g_rlgravity",
;123:	"g_rlvampire",
;124:	"g_rlinf",
;125:	"g_rlbouncemodifier",
;126:	"g_rlknockback",
;127:	"g_lgdamage",
;128:	"g_lgdelay",
;129:	"g_lgrange",
;130:	"g_lgexplode",
;131:	"g_lgsdamage",
;132:	"g_lgsradius",
;133:	"g_lgvampire",
;134:	"g_lginf",
;135:	"g_lgknockback",
;136:	"g_rgdelay",
;137:	"g_rgdamage",
;138:	"g_rgvampire",
;139:	"g_rginf",
;140:	"g_rgknockback",
;141:	"g_pgdelay",
;142:	"g_pgsradius",
;143:	"g_pgspeed",
;144:	"g_pgsdamage",
;145:	"g_pgdamage",
;146:	"g_pgtimeout",
;147:	"g_pgbounce",
;148:	"g_pggravity",
;149:	"g_pgvampire",
;150:	"g_pginf",
;151:	"g_pgbouncemodifier",
;152:	"g_pgknockback",
;153:	"g_bfgdelay",
;154:	"g_bfgspeed",
;155:	"g_bfgtimeout",
;156:	"g_bfgsradius",
;157:	"g_bfgsdamage",
;158:	"g_bfgdamage",
;159:	"g_bfgbounce",
;160:	"g_bfggravity",
;161:	"g_bfgvampire",
;162:	"g_bfginf",
;163:	"g_bfgbouncemodifier",
;164:	"g_bfgknockback",
;165:	"g_ngdelay",
;166:	"g_ngspeed",
;167:	"g_ngspread",
;168:	"g_ngdamage",
;169:	"g_ngtimeout",
;170:	"g_ngcount",
;171:	"g_ngbounce",
;172:	"g_nggravity",
;173:	"g_ngrandom",
;174:	"g_ngvampire",
;175:	"g_nginf",
;176:	"g_ngbouncemodifier",
;177:	"g_ngknockback",
;178:	"g_pldelay",
;179:	"g_plspeed",
;180:	"g_pltimeout",
;181:	"g_plsradius",
;182:	"g_plsdamage",
;183:	"g_plgravity",
;184:	"g_pldamage",
;185:	"g_plvampire",
;186:	"g_plinf",
;187:	"g_plknockback",
;188:	"g_cgdelay",
;189:	"g_cgdamage",
;190:	"g_cgspread",
;191:	"g_cgvampire",
;192:	"g_cginf",
;193:	"g_cgknockback",
;194:	"g_ftdelay",
;195:	"g_ftsradius",
;196:	"g_ftspeed",
;197:	"g_ftsdamage",
;198:	"g_ftdamage",
;199:	"g_fttimeout",
;200:	"g_ftbounce",
;201:	"g_ftgravity",
;202:	"g_ftvampire",
;203:	"g_ftinf",
;204:	"g_ftbouncemodifier",
;205:	"g_ftknockback",
;206:	"g_amdelay",
;207:	"g_amsradius",
;208:	"g_amspeed",
;209:	"g_amsdamage",
;210:	"g_amdamage",
;211:	"g_amtimeout",
;212:	"g_ambounce",
;213:	"g_amgravity",
;214:	"g_amvampire",
;215:	"g_aminf",
;216:	"g_ambouncemodifier",
;217:	"g_amknockback",
;218:	"g_glhoming",
;219:	"g_glguided",
;220:	"g_rlhoming",
;221:	"g_rlguided",
;222:	"g_pghoming",
;223:	"g_pgguided",
;224:	"g_bfghoming",
;225:	"g_bfgguided",
;226:	"g_nghoming",
;227:	"g_ngguided",
;228:	"g_fthoming",
;229:	"g_ftguided",
;230:	"g_amhoming",
;231:	"g_amguided",
;232:	"g_scoutspeedfactor",
;233:	"g_scoutfirespeed",
;234:	"g_scoutdamagefactor",
;235:	"g_scoutgravitymodifier",
;236:	"g_scout_infammo",
;237:	"g_scouthealthmodifier",
;238:	"g_doublerspeedfactor",
;239:	"g_doublerfirespeed",
;240:	"g_doublerdamagefactor",
;241:	"g_doublergravitymodifier",
;242:	"g_doubler_infammo",
;243:	"g_doublerhealthmodifier",
;244:	"g_guardhealthmodifier",
;245:	"g_guardspeedfactor",
;246:	"g_guardfirespeed",
;247:	"g_guarddamagefactor",
;248:	"g_guardgravitymodifier",
;249:	"g_guard_infammo",
;250:	"g_ammoregenspeedfactor",
;251:	"g_ammoregenfirespeed",
;252:	"g_ammoregen_infammo",
;253:	"g_ammoregendamagefactor",
;254:	"g_ammoregengravitymodifier",
;255:	"g_ammoregenhealthmodifier",
;256:	"g_mgammocount",
;257:	"g_sgammocount",
;258:	"g_glammocount",
;259:	"g_rlammocount",
;260:	"g_lgammocount",
;261:	"g_rgammocount",
;262:	"g_pgammocount",
;263:	"g_bfgammocount",
;264:	"g_ngammocount",
;265:	"g_plammocount",
;266:	"g_cgammocount",
;267:	"g_ftammocount",
;268:	"g_mgweaponcount",
;269:	"g_sgweaponcount",
;270:	"g_glweaponcount",
;271:	"g_rlweaponcount",
;272:	"g_lgweaponcount",
;273:	"g_rgweaponcount",
;274:	"g_pgweaponcount",
;275:	"g_bfgweaponcount",
;276:	"g_ngweaponcount",
;277:	"g_plweaponcount",
;278:	"g_cgweaponcount",
;279:	"g_ftweaponcount",
;280:	"g_amweaponcount",
;281:	"g_teamblue_speed",
;282:	"g_teamblue_gravityModifier",
;283:	"g_teamblue_firespeed",
;284:	"g_teamblue_damage",
;285:	"g_teamblue_infammo",
;286:	"g_teamblue_respawnwait",
;287:	"g_teamblue_pickupitems",
;288:	"g_teamred_speed",
;289:	"g_teamred_gravityModifier",
;290:	"g_teamred_firespeed",
;291:	"g_teamred_damage",
;292:	"g_teamred_infammo",
;293:	"g_teamred_respawnwait",
;294:	"g_teamred_pickupitems",
;295:	"g_regenarmor",
;296:	"g_spectatorspeed",
;297:	"eliminationrespawn",
;298:	"eliminationredrespawn",
;299:	"g_overlay",
;300:	"g_slickmove",
;301:	"g_accelerate",
;302:	"g_randomItems",
;303:	"g_kill",
;304:	"g_kamikazeinf",
;305:	"g_invulinf",
;306:	"g_medkitinf",
;307:	"g_teleporterinf",
;308:	"g_portalinf",
;309:	"g_medkitlimit",
;310:	"g_waterdamage",
;311:	"g_lavadamage",
;312:	"g_slimedamage",
;313:	"g_maxweaponpickup",
;314:	"g_randomteleport",
;315:	"g_falldamagesmall",
;316:	"g_falldamagebig",
;317:	"g_noplayerclip",
;318:	"g_flagrespawn",
;319:	"g_portaltimeout",
;320:	"g_portalhealth",
;321:	"g_quadtime",
;322:	"g_bsuittime",
;323:	"g_hastetime",
;324:	"g_invistime",
;325:	"g_regentime",
;326:	"g_flighttime",
;327:	"g_invulmove",
;328:	"g_invultime",
;329:	"g_fasthealthregen",
;330:	"g_slowhealthregen",
;331:	"g_droppeditemtime",
;332:	"g_autoflagreturn",
;333:	"g_hastefirespeed",
;334:	"g_medkitmodifier",
;335:	"g_armorprotect",
;336:	"g_respawnwait",
;337:	"g_ammolimit",
;338:	"g_jumpheight",
;339:	"g_speedfactor",
;340:	"g_drowndamage",
;341:	"g_armorrespawn",
;342:	"g_healthrespawn",
;343:	"g_ammorespawn",
;344:	"g_holdablerespawn",
;345:	"g_megahealthrespawn",
;346:	"g_poweruprespawn",
;347:	"g_speed",
;348:	"g_gravity",
;349:	"g_gravityModifier",
;350:	"g_damageModifier",
;351:	"g_knockback",
;352:	"g_quadfactor",
;353:	"g_forcerespawn",
;354:	"g_respawntime",
;355:	"g_weaponRespawn",
;356:	"g_weaponTeamRespawn",
;357:	"g_proxMineTimeout",
;358:	"elimination_selfdamage",
;359:	"elimination_startHealth",
;360:	"elimination_startArmor",
;361:	"elimination_bfg",
;362:	"elimination_grapple",
;363:	"elimination_roundtime",
;364:	"elimination_warmup",
;365:	"elimination_activewarmup",
;366:	"elimination_allgametypes",
;367:	"elimination_gauntlet",
;368:	"elimination_machinegun",
;369:	"elimination_shotgun",
;370:	"elimination_grenade",
;371:	"elimination_rocket",
;372:	"elimination_railgun",
;373:	"elimination_lightning",
;374:	"elimination_plasmagun",
;375:	"elimination_chain",
;376:	"elimination_mine",
;377:	"elimination_nail",
;378:	"elimination_flame",
;379:	"elimination_antimatter",
;380:	"elimination_quad",
;381:	"elimination_haste",
;382:	"elimination_bsuit",
;383:	"elimination_invis",
;384:	"elimination_regen",
;385:	"elimination_flight",
;386:	"elimination_items",
;387:	"elimination_holdable",
;388:	"eliminationred_startHealth",
;389:	"eliminationred_startArmor",
;390:	"eliminationred_bfg",
;391:	"eliminationred_grapple",
;392:	"eliminationred_gauntlet",
;393:	"eliminationred_machinegun",
;394:	"eliminationred_shotgun",
;395:	"eliminationred_grenade",
;396:	"eliminationred_rocket",
;397:	"eliminationred_railgun",
;398:	"eliminationred_lightning",
;399:	"eliminationred_plasmagun",
;400:	"eliminationred_chain",
;401:	"eliminationred_mine",
;402:	"eliminationred_nail",
;403:	"eliminationred_flame",
;404:	"eliminationred_antimatter",
;405:	"eliminationred_quad",
;406:	"eliminationred_haste",
;407:	"eliminationred_bsuit",
;408:	"eliminationred_invis",
;409:	"eliminationred_regen",
;410:	"eliminationred_flight",
;411:	"eliminationred_holdable",
;412:	"g_vampire",
;413:	"g_vampireMaxHealth",
;414:	"g_regen",
;415:	0
;416:};
;417:
;418:	char* 			admcvar_items[] = {
;419:	"g_allowprops",
;420:	"g_allowsettings",
;421:	"g_allownpc",
;422:	"g_allowitems",
;423:	"g_allownoclip",
;424:	"g_allowtoolgun",
;425:	"g_allowphysgun",
;426:	"g_allowgravitygun",
;427:	0
;428:};
;429:
;430:	char* 			item_items[] = {
;431:	"All",
;432:	"Armor Shard",
;433:	"Armor 50",
;434:	"Heavy Armor",
;435:	"Health 5",
;436:	"Health 25",
;437:	"Health 50",
;438:	"Mega Health",
;439:	"Shotgun",
;440:	"Machinegun",
;441:	"Grenade Launcher",
;442:	"Rocket Launcher",
;443:	"Lightning Gun",
;444:	"Railgun",
;445:	"Plasma Gun",
;446:	"BFG10K",
;447:	"Grappling Hook",
;448:	"Shells",
;449:	"Bullets",
;450:	"Grenades",
;451:	"Cells",
;452:	"Lightning",
;453:	"Rockets",
;454:	"Slugs",
;455:	"Bfg Ammo",
;456:	"Personal Teleporter",
;457:	"Medkit",
;458:	"Quad Damage",
;459:	"Battle Suit",
;460:	"Speed",
;461:	"Invisibility",
;462:	"Regeneration",
;463:	"Flight",
;464:	"Kamikaze",
;465:	"Portal",
;466:	"Invulnerability",
;467:	"Nails",
;468:	"Proximity Mines",
;469:	"Chaingun Belt",
;470:	"Scout",
;471:	"Guard",
;472:	"Doubler",
;473:	"Ammo Regen",
;474:	"Nailgun",
;475:	"Prox Launcher",
;476:	"Chaingun",
;477:	"Flamethrower",
;478:	"Flame",
;479:	"Light Armor",
;480:	"Full Armor",
;481:	"Dark Flare",
;482:	"Toolgun",
;483:	"Physgun",
;484:	"Gravitygun",
;485:	0
;486:};
;487:
;488:int SandbOffset = 0;
;489:
;490:static sandboxmain_t	s_sandboxmain;
;491:
;492:const char* tool_spawnpreset_arg(int num){
line 493
;493:	if(num == 1){
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $482
line 494
;494:		if(!toolgun_disabledarg1.integer){
ADDRGP4 toolgun_disabledarg1+12
INDIRI4
CNSTI4 0
NEI4 $484
line 495
;495:			return s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue];
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $481
JUMPV
LABELV $484
line 496
;496:		} else {
line 497
;497:			return "";
ADDRGP4 $491
RETP4
ADDRGP4 $481
JUMPV
LABELV $482
line 500
;498:		}
;499:	}
;500:	if(num == 2){
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $492
line 501
;501:		if(!toolgun_disabledarg2.integer){
ADDRGP4 toolgun_disabledarg2+12
INDIRI4
CNSTI4 0
NEI4 $494
line 502
;502:			if(s_sandboxmain.priv.curvalue){
ADDRGP4 s_sandboxmain+1296+88
INDIRI4
CNSTI4 0
EQI4 $497
line 503
;503:			return "1";
ADDRGP4 $501
RETP4
ADDRGP4 $481
JUMPV
LABELV $497
line 504
;504:			} else {
line 505
;505:			return "0";	
ADDRGP4 $502
RETP4
ADDRGP4 $481
JUMPV
LABELV $494
line 507
;506:			}
;507:		} else {
line 508
;508:			return "";
ADDRGP4 $491
RETP4
ADDRGP4 $481
JUMPV
LABELV $492
line 511
;509:		}
;510:	}
;511:	if(num == 3){
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $503
line 512
;512:		if(!toolgun_disabledarg3.integer){
ADDRGP4 toolgun_disabledarg3+12
INDIRI4
CNSTI4 0
NEI4 $505
line 513
;513:			return s_sandboxmain.grid.field.buffer;
ADDRGP4 s_sandboxmain+1392+88+12
RETP4
ADDRGP4 $481
JUMPV
LABELV $505
line 514
;514:		} else {
line 515
;515:			return "";
ADDRGP4 $491
RETP4
ADDRGP4 $481
JUMPV
LABELV $503
line 518
;516:		}
;517:	}
;518:	if(num == 4){
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $511
line 519
;519:		if(!toolgun_disabledarg4.integer){
ADDRGP4 toolgun_disabledarg4+12
INDIRI4
CNSTI4 0
NEI4 $513
line 520
;520:			return s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue];
ADDRGP4 s_sandboxmain+9636+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9636+428
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $481
JUMPV
LABELV $513
line 521
;521:		} else {
line 522
;522:			return "";
ADDRGP4 $491
RETP4
ADDRGP4 $481
JUMPV
LABELV $511
line 526
;523:		}
;524:	}
;525:	
;526:return "undefined presetarg";
ADDRGP4 $520
RETP4
LABELV $481
endproc tool_spawnpreset_arg 0 0
proc SandboxMain_SaveChanges 24 92
line 534
;527:}
;528:
;529:/*
;530:=================
;531:SandboxMain_SaveChanges
;532:=================
;533:*/
;534:static void SandboxMain_SaveChanges( void ) {
line 536
;535:	//save cvars
;536:	trap_Cvar_Set( "sb_classnum_view", "none" );
ADDRGP4 $522
ARGP4
ADDRGP4 $523
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 537
;537:	if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $524
line 538
;538:	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_spawnpreset.string, tool_spawnpreset_arg(1), tool_spawnpreset_arg(2), tool_spawnpreset_arg(3), tool_spawnpreset_arg(4), MODIF_LIST) );
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 8
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
CNSTI4 4
ARGI4
ADDRLP4 12
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
ADDRGP4 tool_spawnpreset+16
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 539
;539:	trap_Cvar_Set( "toolgun_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $600
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $599
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 540
;540:	trap_Cvar_Set( "sb_classnum_view", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue] );
ADDRGP4 $522
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 541
;541:	trap_Cvar_Set( "sb_texturename", s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue] );
ADDRGP4 $609
ARGP4
ADDRGP4 s_sandboxmain+9636+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9636+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 542
;542:	}
LABELV $524
line 543
;543:	if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $614
line 544
;544:	trap_Cmd_ExecuteText( EXEC_INSERT, va(spawn_preset.string, s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.priv.curvalue, s_sandboxmain.grid.field.buffer, "0") );
ADDRGP4 spawn_preset+16
ARGP4
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+1296+88
INDIRI4
ARGI4
ADDRGP4 s_sandboxmain+1392+88+12
ARGP4
ADDRGP4 $502
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 545
;545:	trap_Cvar_Set( "toolgun_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $600
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $599
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 546
;546:	trap_Cvar_Set( "sb_classnum_view", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue] );
ADDRGP4 $522
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 547
;547:	}
LABELV $614
line 548
;548:	if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $639
line 549
;549:	trap_Cmd_ExecuteText( EXEC_INSERT, va("set toolcmd_spawn sl npc %s %s %s %s %s %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.modif[0].field.buffer, s_sandboxmain.modif[1].field.buffer, s_sandboxmain.modif[2].field.buffer, s_sandboxmain.modif[3].field.buffer, s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 $642
ARGP4
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 550
;550:	trap_Cvar_Set( "toolgun_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $600
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $599
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 551
;551:	}
LABELV $639
line 552
;552:	if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $674
line 553
;553:	trap_Cmd_ExecuteText( EXEC_INSERT, va("set toolcmd_spawn execscript spawnlists/%s/%s.as\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $677
ARGP4
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 554
;554:	}
LABELV $674
line 555
;555:	trap_Cvar_SetValue( "sb_private", s_sandboxmain.priv.curvalue );
ADDRGP4 $686
ARGP4
ADDRGP4 s_sandboxmain+1296+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 556
;556:	trap_Cvar_Set( "sb_grid", s_sandboxmain.grid.field.buffer );
ADDRGP4 $689
ARGP4
ADDRGP4 s_sandboxmain+1392+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 557
;557:	trap_Cvar_SetValue( "sb_modelnum", s_sandboxmain.list.curvalue );
ADDRGP4 $693
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 558
;558:	trap_Cvar_SetValue( "sb_classnum", s_sandboxmain.classlist.curvalue );
ADDRGP4 $696
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 559
;559:	trap_Cvar_SetValue( "sb_texturenum", s_sandboxmain.texturelist.curvalue );
ADDRGP4 $699
ARGP4
ADDRGP4 s_sandboxmain+9636+416
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 560
;560:	trap_Cvar_Set( "toolgun_mod1", s_sandboxmain.modif[0].field.buffer );
ADDRGP4 $702
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 561
;561:	trap_Cvar_Set( "toolgun_mod2", s_sandboxmain.modif[1].field.buffer );
ADDRGP4 $706
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 562
;562:	trap_Cvar_Set( "toolgun_mod3", s_sandboxmain.modif[2].field.buffer );
ADDRGP4 $711
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 563
;563:	trap_Cvar_Set( "toolgun_mod4", s_sandboxmain.modif[3].field.buffer );
ADDRGP4 $716
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 564
;564:	trap_Cvar_Set( "toolgun_mod5", s_sandboxmain.modif[4].field.buffer );
ADDRGP4 $721
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 565
;565:	trap_Cvar_Set( "toolgun_mod6", s_sandboxmain.modif[5].field.buffer );
ADDRGP4 $726
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 566
;566:	trap_Cvar_Set( "toolgun_mod7", s_sandboxmain.modif[6].field.buffer );
ADDRGP4 $731
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 567
;567:	trap_Cvar_Set( "toolgun_mod8", s_sandboxmain.modif[7].field.buffer );
ADDRGP4 $736
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 568
;568:	trap_Cvar_Set( "toolgun_mod9", s_sandboxmain.modif[8].field.buffer );
ADDRGP4 $741
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 569
;569:	trap_Cvar_Set( "toolgun_mod10", s_sandboxmain.modif[9].field.buffer );
ADDRGP4 $746
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 570
;570:	trap_Cvar_Set( "toolgun_mod11", s_sandboxmain.modif[10].field.buffer );
ADDRGP4 $751
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 571
;571:	trap_Cvar_Set( "toolgun_mod12", s_sandboxmain.modif[11].field.buffer );
ADDRGP4 $756
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 572
;572:	trap_Cvar_Set( "toolgun_mod13", s_sandboxmain.modif[12].field.buffer );
ADDRGP4 $761
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 573
;573:	trap_Cvar_Set( "toolgun_mod14", s_sandboxmain.modif[13].field.buffer );
ADDRGP4 $766
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 574
;574:	trap_Cvar_Set( "toolgun_mod15", s_sandboxmain.modif[14].field.buffer );
ADDRGP4 $771
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 575
;575:	trap_Cvar_Set( "toolgun_mod16", s_sandboxmain.modif[15].field.buffer );
ADDRGP4 $776
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 576
;576:	trap_Cvar_Set( "toolgun_mod17", s_sandboxmain.modif[16].field.buffer );
ADDRGP4 $781
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 577
;577:	trap_Cvar_Set( "toolgun_mod18", s_sandboxmain.modif[17].field.buffer );
ADDRGP4 $786
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 578
;578:	if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $791
line 579
;579:	if(trap_Cvar_VariableValue("toolgun_tool") == 1){
ADDRGP4 $796
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $794
line 580
;580:	trap_Cvar_Set( "toolgun_mod1", va("%s", s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue]));
ADDRGP4 $797
ARGP4
ADDRGP4 s_sandboxmain+9636+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9636+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 581
;581:	Q_strncpyz( s_sandboxmain.modif[0].field.buffer, va("%s", s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue]), sizeof(s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $797
ARGP4
ADDRGP4 s_sandboxmain+9636+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9636+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 582
;582:	}
LABELV $794
line 583
;583:	if(trap_Cvar_VariableValue("toolgun_tool") == 3){
ADDRGP4 $796
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 1077936128
NEF4 $812
line 584
;584:	trap_Cvar_Set( "toolgun_mod1", va("%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]));
ADDRGP4 $797
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 585
;585:	Q_strncpyz( s_sandboxmain.modif[0].field.buffer, va("%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]), sizeof(s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $797
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 586
;586:	}
LABELV $812
line 587
;587:	}
LABELV $791
line 588
;588:	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset.string, MODIF_LIST) );
ADDRGP4 tool_modifypreset+16
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 589
;589:	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset2.string, MODIF_LIST) );
ADDRGP4 tool_modifypreset2+16
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 590
;590:	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset3.string, MODIF_LIST) );
ADDRGP4 tool_modifypreset3+16
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 591
;591:	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset4.string, MODIF_LIST) );
ADDRGP4 tool_modifypreset4+16
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 592
;592:}
LABELV $521
endproc SandboxMain_SaveChanges 24 92
proc SandboxMain_SpawnListUpdate 1064 16
line 599
;593:
;594:/*
;595:=================
;596:SandboxMain_SpawnListUpdate
;597:=================
;598:*/
;599:static void SandboxMain_SpawnListUpdate( void ) {
line 608
;600:	int		y;
;601:	int		gametype;
;602:	char	info[MAX_INFO_STRING];
;603:	int		i;
;604:	int		len;
;605:	char	*configname;
;606:	
;607:	
;608:	uis.spawnlist_folder 				= trap_Cvar_VariableValue("sb_classnum");
ADDRGP4 $696
ARGP4
ADDRLP4 1044
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uis+11484
ADDRLP4 1044
INDIRF4
CVFI4 4
ASGNI4
line 609
;609:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("spawnlists/%s", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]), "as", s_sandboxmain.names, 524288 );
ADDRGP4 $1120
ARGP4
ADDRGP4 uis+11484
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1052
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 611
;610:
;611:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $1126
line 612
;612:		strcpy(s_sandboxmain.names,"No items");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $1131
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 613
;613:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 614
;614:	}
ADDRGP4 $1127
JUMPV
LABELV $1126
line 615
;615:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $1134
line 616
;616:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $1134
LABELV $1127
line 618
;617:
;618:	configname = s_sandboxmain.names;
ADDRLP4 0
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 619
;619:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1144
JUMPV
LABELV $1141
line 620
;620:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 623
;621:
;622:		// strip extension
;623:		len = strlen( configname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1056
INDIRI4
ASGNI4
line 624
;624:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1149
line 625
;625:			configname[len-3] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $1149
line 629
;626:
;627:		//Q_strupr(configname);
;628:
;629:		configname += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 630
;630:	}
LABELV $1142
line 619
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1144
ADDRLP4 8
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $1141
line 631
;631:	strcpy(s_sandboxmain.list.string, va("spawnlists/%s/icons", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]));
ADDRGP4 $1154
ARGP4
ADDRGP4 uis+11484
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+8724+112
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 632
;632:}
LABELV $1116
endproc SandboxMain_SpawnListUpdate 1064 16
proc SandboxMain_MenuKey 8 8
line 639
;633:
;634:/*
;635:=================
;636:SandboxMain_MenuKey
;637:=================
;638:*/
;639:static sfxHandle_t SandboxMain_MenuKey( int key ) {
line 640
;640:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1161
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $1159
LABELV $1161
line 641
;641:		SandboxMain_SaveChanges();
ADDRGP4 SandboxMain_SaveChanges
CALLV
pop
line 642
;642:	}
LABELV $1159
line 643
;643:	return Menu_DefaultKey( &s_sandboxmain.menu, key );
ADDRGP4 s_sandboxmain
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $1158
endproc SandboxMain_MenuKey 8 8
lit
align 4
LABELV $1163
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1058642330
align 4
LABELV $1164
byte 4 1050253722
byte 4 1050253722
byte 4 1050253722
byte 4 1063675494
align 4
LABELV $1165
byte 4 1056964608
byte 4 1056964608
byte 4 1050253722
byte 4 1063675494
code
proc SandboxMain_MenuDraw 80 24
line 646
;644:}
;645:
;646:static void SandboxMain_MenuDraw( void ) {
line 648
;647:	int i;
;648:	vec4_t			sbcolor1 = {1.00f, 1.00f, 1.00f, 0.60f};
ADDRLP4 36
ADDRGP4 $1163
INDIRB
ASGNB 16
line 649
;649:	vec4_t			sbcolor2 = {0.30f, 0.30f, 0.30f, 0.90f};
ADDRLP4 4
ADDRGP4 $1164
INDIRB
ASGNB 16
line 650
;650:	vec4_t			sbcolor3 = {0.50f, 0.50f, 0.30f, 0.90f};
ADDRLP4 20
ADDRGP4 $1165
INDIRB
ASGNB 16
line 653
;651:	float			x, y, w, h;
;652:	
;653:	sbcolor1[0] = sbt_color0_0.value;
ADDRLP4 36
ADDRGP4 sbt_color0_0+8
INDIRF4
ASGNF4
line 654
;654:	sbcolor1[1] = sbt_color0_1.value;
ADDRLP4 36+4
ADDRGP4 sbt_color0_1+8
INDIRF4
ASGNF4
line 655
;655:	sbcolor1[2] = sbt_color0_2.value;
ADDRLP4 36+8
ADDRGP4 sbt_color0_2+8
INDIRF4
ASGNF4
line 656
;656:	sbcolor1[3] = sbt_color0_3.value;
ADDRLP4 36+12
ADDRGP4 sbt_color0_3+8
INDIRF4
ASGNF4
line 657
;657:	sbcolor2[0] = sbt_color1_0.value;
ADDRLP4 4
ADDRGP4 sbt_color1_0+8
INDIRF4
ASGNF4
line 658
;658:	sbcolor2[1] = sbt_color1_1.value;
ADDRLP4 4+4
ADDRGP4 sbt_color1_1+8
INDIRF4
ASGNF4
line 659
;659:	sbcolor2[2] = sbt_color1_2.value;
ADDRLP4 4+8
ADDRGP4 sbt_color1_2+8
INDIRF4
ASGNF4
line 660
;660:	sbcolor2[3] = sbt_color1_3.value;
ADDRLP4 4+12
ADDRGP4 sbt_color1_3+8
INDIRF4
ASGNF4
line 661
;661:	sbcolor3[0] = sbt_color2_0.value;
ADDRLP4 20
ADDRGP4 sbt_color2_0+8
INDIRF4
ASGNF4
line 662
;662:	sbcolor3[1] = sbt_color2_1.value;
ADDRLP4 20+4
ADDRGP4 sbt_color2_1+8
INDIRF4
ASGNF4
line 663
;663:	sbcolor3[2] = sbt_color2_2.value;
ADDRLP4 20+8
ADDRGP4 sbt_color2_2+8
INDIRF4
ASGNF4
line 664
;664:	sbcolor3[3] = sbt_color2_3.value;
ADDRLP4 20+12
ADDRGP4 sbt_color2_3+8
INDIRF4
ASGNF4
line 665
;665:	s_sandboxmain_color1[0] = sbt_color3_0.value;
ADDRGP4 s_sandboxmain_color1
ADDRGP4 sbt_color3_0+8
INDIRF4
ASGNF4
line 666
;666:	s_sandboxmain_color1[1] = sbt_color3_1.value;
ADDRGP4 s_sandboxmain_color1+4
ADDRGP4 sbt_color3_1+8
INDIRF4
ASGNF4
line 667
;667:	s_sandboxmain_color1[2] = sbt_color3_2.value;
ADDRGP4 s_sandboxmain_color1+8
ADDRGP4 sbt_color3_2+8
INDIRF4
ASGNF4
line 668
;668:	s_sandboxmain_color1[3] = sbt_color3_3.value;
ADDRGP4 s_sandboxmain_color1+12
ADDRGP4 sbt_color3_3+8
INDIRF4
ASGNF4
line 670
;669:
;670:	UI_DrawHandlePic( -2.0-uis.wideoffset, 0.0, 644+uis.wideoffset*2, 480, trap_R_RegisterShaderNoMip( va( "%s", sbt_wallpaper.string ) ) );
ADDRGP4 $797
ARGP4
ADDRGP4 sbt_wallpaper+16
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTF4 3221225472
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 644
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 672
;671:
;672:	UI_DrawRoundedRect(20-uis.wideoffset, 40, 600+uis.wideoffset*2, 435, 10, sbcolor1);
CNSTI4 20
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 600
ADDI4
CVIF4 4
ARGF4
CNSTF4 1138327552
ARGF4
CNSTF4 1092616192
ARGF4
ADDRLP4 36
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 673
;673:	UI_DrawRoundedRect(372-5+uis.wideoffset, 70-25, 225+10, (160*2)+50+55, 12, sbcolor2);	//tools
ADDRGP4 uis+11476
INDIRI4
CNSTI4 367
ADDI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
CNSTF4 1131085824
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 675
;674:	
;675:	if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $1200
line 676
;676:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1129447424
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 677
;677:	UI_DrawRoundedRect(40-5-uis.wideoffset, 215+70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//classes
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132593152
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1129447424
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 678
;678:	}
LABELV $1200
line 679
;679:	if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $1207
line 680
;680:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 681
;681:	}
LABELV $1207
line 682
;682:	if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $1212
line 683
;683:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1129447424
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 684
;684:	UI_DrawRoundedRect(40-5-uis.wideoffset, 215+70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//classes
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132593152
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1129447424
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 685
;685:	}
LABELV $1212
line 686
;686:	if(uis.sb_tab == 4){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 4
NEI4 $1219
line 687
;687:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 688
;688:	}
LABELV $1219
line 689
;689:	if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $1224
line 690
;690:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 691
;691:	}
LABELV $1224
line 692
;692:	if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $1229
line 693
;693:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1129447424
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 694
;694:	UI_DrawRoundedRect(40-5-uis.wideoffset, 215+70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//classes
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132593152
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1129447424
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 695
;695:	}
LABELV $1229
line 696
;696:	if(uis.sb_tab == 7){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 7
NEI4 $1236
line 697
;697:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 698
;698:	}
LABELV $1236
line 699
;699:	if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $1241
line 700
;700:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 701
;701:	}
LABELV $1241
line 702
;702:	if(uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $1246
line 703
;703:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 704
;704:	}
LABELV $1246
line 705
;705:	if(uis.sb_tab == 10){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 10
NEI4 $1251
line 706
;706:	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
CNSTI4 35
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 325
ADDI4
CVIF4 4
ARGF4
CNSTF4 1137999872
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 707
;707:	}
LABELV $1251
line 709
;708:	
;709:	for (i = 1; i <= 10; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1256
line 710
;710:		int xOffset = ((-53 * 0.5) + (110 * 0.5) * i) - uis.wideoffset;
ADDRLP4 76
CNSTF4 1113325568
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 3251896320
ADDF4
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 711
;711:		if (uis.sb_tab == i) {
ADDRGP4 uis+11472
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1261
line 712
;712:			UI_DrawRoundedRect(xOffset, 10, 105 * 0.5, 30 * 0.5, 30, sbcolor3);
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1092616192
ARGF4
CNSTF4 1112670208
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
ADDRLP4 20
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 713
;713:		} else {
ADDRGP4 $1262
JUMPV
LABELV $1261
line 714
;714:			UI_DrawRoundedRect(xOffset, 10, 105 * 0.5, 30 * 0.5, 30, sbcolor2);
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1092616192
ARGF4
CNSTF4 1112670208
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 715
;715:		}
LABELV $1262
line 716
;716:	}
LABELV $1257
line 709
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LEI4 $1256
line 718
;717:	
;718:	UI_DrawRoundedRect((640-(110*0.5))+uis.wideoffset, 10, 105*0.5, 30*0.5, 30, sbcolor2);
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
CNSTF4 1142046720
ADDF4
ARGF4
CNSTF4 1092616192
ARGF4
CNSTF4 1112670208
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 720
;719:	
;720:	if(uis.sb_tab == 1 || uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
EQI4 $1269
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $1265
LABELV $1269
line 721
;721:	UI_DrawRoundedRect( 540 + uis.wideoffset, 55, 105*0.5, 30*0.5, 30, sbcolor3);
ADDRGP4 uis+11476
INDIRI4
CNSTI4 540
ADDI4
CVIF4 4
ARGF4
CNSTF4 1113325568
ARGF4
CNSTF4 1112670208
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
ADDRLP4 20
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 722
;722:	}
LABELV $1265
line 724
;723:
;724:	Menu_Draw( &s_sandboxmain.menu );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 726
;725:	
;726:	s_sandboxmain.modif[0].generic.name           	= toolgun_toolset1.string;
ADDRGP4 s_sandboxmain+2172+4
ADDRGP4 toolgun_toolset1+16
ASGNP4
line 727
;727:	s_sandboxmain.modif[1].generic.name          	= toolgun_toolset2.string;
ADDRGP4 s_sandboxmain+2172+364+4
ADDRGP4 toolgun_toolset2+16
ASGNP4
line 728
;728:	s_sandboxmain.modif[2].generic.name          	= toolgun_toolset3.string;
ADDRGP4 s_sandboxmain+2172+728+4
ADDRGP4 toolgun_toolset3+16
ASGNP4
line 729
;729:	s_sandboxmain.modif[3].generic.name           	= toolgun_toolset4.string;
ADDRGP4 s_sandboxmain+2172+1092+4
ADDRGP4 toolgun_toolset4+16
ASGNP4
line 730
;730:	s_sandboxmain.modif[4].generic.name           	= toolgun_toolset5.string;
ADDRGP4 s_sandboxmain+2172+1456+4
ADDRGP4 toolgun_toolset5+16
ASGNP4
line 731
;731:	s_sandboxmain.modif[5].generic.name          	= toolgun_toolset6.string;
ADDRGP4 s_sandboxmain+2172+1820+4
ADDRGP4 toolgun_toolset6+16
ASGNP4
line 732
;732:	s_sandboxmain.modif[6].generic.name          	= toolgun_toolset7.string;
ADDRGP4 s_sandboxmain+2172+2184+4
ADDRGP4 toolgun_toolset7+16
ASGNP4
line 733
;733:	s_sandboxmain.modif[7].generic.name           	= toolgun_toolset8.string;
ADDRGP4 s_sandboxmain+2172+2548+4
ADDRGP4 toolgun_toolset8+16
ASGNP4
line 734
;734:	s_sandboxmain.modif[8].generic.name          	= toolgun_toolset9.string;
ADDRGP4 s_sandboxmain+2172+2912+4
ADDRGP4 toolgun_toolset9+16
ASGNP4
line 735
;735:	s_sandboxmain.modif[9].generic.name           	= toolgun_toolset10.string;
ADDRGP4 s_sandboxmain+2172+3276+4
ADDRGP4 toolgun_toolset10+16
ASGNP4
line 736
;736:	s_sandboxmain.modif[10].generic.name           	= toolgun_toolset11.string;
ADDRGP4 s_sandboxmain+2172+3640+4
ADDRGP4 toolgun_toolset11+16
ASGNP4
line 737
;737:	s_sandboxmain.modif[11].generic.name          	= toolgun_toolset12.string;
ADDRGP4 s_sandboxmain+2172+4004+4
ADDRGP4 toolgun_toolset12+16
ASGNP4
line 738
;738:	s_sandboxmain.modif[12].generic.name          	= toolgun_toolset13.string;
ADDRGP4 s_sandboxmain+2172+4368+4
ADDRGP4 toolgun_toolset13+16
ASGNP4
line 739
;739:	s_sandboxmain.modif[13].generic.name           	= toolgun_toolset14.string;
ADDRGP4 s_sandboxmain+2172+4732+4
ADDRGP4 toolgun_toolset14+16
ASGNP4
line 740
;740:	s_sandboxmain.modif[14].generic.name           	= toolgun_toolset15.string;
ADDRGP4 s_sandboxmain+2172+5096+4
ADDRGP4 toolgun_toolset15+16
ASGNP4
line 741
;741:	s_sandboxmain.modif[15].generic.name          	= toolgun_toolset16.string;
ADDRGP4 s_sandboxmain+2172+5460+4
ADDRGP4 toolgun_toolset16+16
ASGNP4
line 742
;742:	s_sandboxmain.modif[16].generic.name          	= toolgun_toolset17.string;
ADDRGP4 s_sandboxmain+2172+5824+4
ADDRGP4 toolgun_toolset17+16
ASGNP4
line 743
;743:	s_sandboxmain.modif[17].generic.name           	= toolgun_toolset18.string;
ADDRGP4 s_sandboxmain+2172+6188+4
ADDRGP4 toolgun_toolset18+16
ASGNP4
line 745
;744:	
;745:	if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $1342
line 746
;746:		s_sandboxmain.modif[0].generic.name       		= "Skill:";
ADDRGP4 s_sandboxmain+2172+4
ADDRGP4 $1347
ASGNP4
line 747
;747:		s_sandboxmain.modif[1].generic.name           	= "Health:";
ADDRGP4 s_sandboxmain+2172+364+4
ADDRGP4 $1351
ASGNP4
line 748
;748:		s_sandboxmain.modif[2].generic.name          	= "Name:";
ADDRGP4 s_sandboxmain+2172+728+4
ADDRGP4 $1355
ASGNP4
line 749
;749:		s_sandboxmain.modif[3].generic.name          	= "Music:";
ADDRGP4 s_sandboxmain+2172+1092+4
ADDRGP4 $1359
ASGNP4
line 750
;750:		s_sandboxmain.modif[4].generic.name           	= "Weapon(id):";
ADDRGP4 s_sandboxmain+2172+1456+4
ADDRGP4 $1363
ASGNP4
line 751
;751:		s_sandboxmain.modif[5].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+1820+4
ADDRGP4 $1367
ASGNP4
line 752
;752:		s_sandboxmain.modif[6].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+2184+4
ADDRGP4 $1367
ASGNP4
line 753
;753:		s_sandboxmain.modif[7].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+2548+4
ADDRGP4 $1367
ASGNP4
line 754
;754:		s_sandboxmain.modif[8].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+2912+4
ADDRGP4 $1367
ASGNP4
line 755
;755:		s_sandboxmain.modif[9].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+3276+4
ADDRGP4 $1367
ASGNP4
line 756
;756:		s_sandboxmain.modif[10].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+3640+4
ADDRGP4 $1367
ASGNP4
line 757
;757:		s_sandboxmain.modif[11].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+4004+4
ADDRGP4 $1367
ASGNP4
line 758
;758:		s_sandboxmain.modif[12].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+4368+4
ADDRGP4 $1367
ASGNP4
line 759
;759:		s_sandboxmain.modif[13].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+4732+4
ADDRGP4 $1367
ASGNP4
line 760
;760:		s_sandboxmain.modif[14].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+5096+4
ADDRGP4 $1367
ASGNP4
line 761
;761:		s_sandboxmain.modif[15].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+5460+4
ADDRGP4 $1367
ASGNP4
line 762
;762:		s_sandboxmain.modif[16].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+5824+4
ADDRGP4 $1367
ASGNP4
line 763
;763:		s_sandboxmain.modif[17].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+6188+4
ADDRGP4 $1367
ASGNP4
line 764
;764:	}
LABELV $1342
line 766
;765:	
;766:		if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $1404
line 767
;767:		s_sandboxmain.modif[0].generic.name       		= "Key:";
ADDRGP4 s_sandboxmain+2172+4
ADDRGP4 $1409
ASGNP4
line 768
;768:		s_sandboxmain.modif[1].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+364+4
ADDRGP4 $1367
ASGNP4
line 769
;769:		s_sandboxmain.modif[2].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+728+4
ADDRGP4 $1367
ASGNP4
line 770
;770:		s_sandboxmain.modif[3].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+1092+4
ADDRGP4 $1367
ASGNP4
line 771
;771:		s_sandboxmain.modif[4].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+1456+4
ADDRGP4 $1367
ASGNP4
line 772
;772:		s_sandboxmain.modif[5].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+1820+4
ADDRGP4 $1367
ASGNP4
line 773
;773:		s_sandboxmain.modif[6].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+2184+4
ADDRGP4 $1367
ASGNP4
line 774
;774:		s_sandboxmain.modif[7].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+2548+4
ADDRGP4 $1367
ASGNP4
line 775
;775:		s_sandboxmain.modif[8].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+2912+4
ADDRGP4 $1367
ASGNP4
line 776
;776:		s_sandboxmain.modif[9].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+3276+4
ADDRGP4 $1367
ASGNP4
line 777
;777:		s_sandboxmain.modif[10].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+3640+4
ADDRGP4 $1367
ASGNP4
line 778
;778:		s_sandboxmain.modif[11].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+4004+4
ADDRGP4 $1367
ASGNP4
line 779
;779:		s_sandboxmain.modif[12].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+4368+4
ADDRGP4 $1367
ASGNP4
line 780
;780:		s_sandboxmain.modif[13].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+4732+4
ADDRGP4 $1367
ASGNP4
line 781
;781:		s_sandboxmain.modif[14].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+5096+4
ADDRGP4 $1367
ASGNP4
line 782
;782:		s_sandboxmain.modif[15].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+5460+4
ADDRGP4 $1367
ASGNP4
line 783
;783:		s_sandboxmain.modif[16].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+5824+4
ADDRGP4 $1367
ASGNP4
line 784
;784:		s_sandboxmain.modif[17].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+6188+4
ADDRGP4 $1367
ASGNP4
line 785
;785:	}
LABELV $1404
line 787
;786:	
;787:	if(uis.sb_tab == 5 || uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
EQI4 $1465
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $1461
LABELV $1465
line 788
;788:		s_sandboxmain.modif[0].generic.name       		= "Value:";
ADDRGP4 s_sandboxmain+2172+4
ADDRGP4 $1468
ASGNP4
line 789
;789:		s_sandboxmain.modif[1].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+364+4
ADDRGP4 $1367
ASGNP4
line 790
;790:		s_sandboxmain.modif[2].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+728+4
ADDRGP4 $1367
ASGNP4
line 791
;791:		s_sandboxmain.modif[3].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+1092+4
ADDRGP4 $1367
ASGNP4
line 792
;792:		s_sandboxmain.modif[4].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+1456+4
ADDRGP4 $1367
ASGNP4
line 793
;793:		s_sandboxmain.modif[5].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+1820+4
ADDRGP4 $1367
ASGNP4
line 794
;794:		s_sandboxmain.modif[6].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+2184+4
ADDRGP4 $1367
ASGNP4
line 795
;795:		s_sandboxmain.modif[7].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+2548+4
ADDRGP4 $1367
ASGNP4
line 796
;796:		s_sandboxmain.modif[8].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+2912+4
ADDRGP4 $1367
ASGNP4
line 797
;797:		s_sandboxmain.modif[9].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+3276+4
ADDRGP4 $1367
ASGNP4
line 798
;798:		s_sandboxmain.modif[10].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+3640+4
ADDRGP4 $1367
ASGNP4
line 799
;799:		s_sandboxmain.modif[11].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+4004+4
ADDRGP4 $1367
ASGNP4
line 800
;800:		s_sandboxmain.modif[12].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+4368+4
ADDRGP4 $1367
ASGNP4
line 801
;801:		s_sandboxmain.modif[13].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+4732+4
ADDRGP4 $1367
ASGNP4
line 802
;802:		s_sandboxmain.modif[14].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+5096+4
ADDRGP4 $1367
ASGNP4
line 803
;803:		s_sandboxmain.modif[15].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+5460+4
ADDRGP4 $1367
ASGNP4
line 804
;804:		s_sandboxmain.modif[16].generic.name          	= "--------:";
ADDRGP4 s_sandboxmain+2172+5824+4
ADDRGP4 $1367
ASGNP4
line 805
;805:		s_sandboxmain.modif[17].generic.name           	= "--------:";
ADDRGP4 s_sandboxmain+2172+6188+4
ADDRGP4 $1367
ASGNP4
line 806
;806:	}
LABELV $1461
line 807
;807:}
LABELV $1162
endproc SandboxMain_MenuDraw 80 24
proc SandboxMain_MenuEvent 36 92
line 814
;808:
;809:/*
;810:===============
;811:SandboxMain_MenuEvent
;812:===============
;813:*/
;814:static void SandboxMain_MenuEvent( void* ptr, int event ) {
line 815
;815:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1521
line 816
;816:		return;
ADDRGP4 $1520
JUMPV
LABELV $1521
line 818
;817:	}
;818:	SandboxMain_SaveChanges();
ADDRGP4 SandboxMain_SaveChanges
CALLV
pop
line 819
;819:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $1523
ADDRLP4 0
INDIRI4
CNSTI4 118
GTI4 $1523
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1894-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1894
address $1665
address $1851
address $1778
address $1526
address $1524
address $1875
address $1884
address $1645
address $1647
address $1649
address $1651
address $1653
address $1655
address $1657
address $1659
address $1661
address $1663
address $1634
address $1635
code
LABELV $1526
line 821
;820:	case ID_SPAWNOBJECT:
;821:		if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $1527
line 822
;822:		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 823
;823:		trap_Cmd_ExecuteText( EXEC_INSERT, "execscript tools/create\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1538
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 824
;824:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1539
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 825
;825:		}
LABELV $1527
line 826
;826:		if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $1540
line 827
;827:		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 828
;828:		trap_Cmd_ExecuteText( EXEC_INSERT, "execscript tools/create\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1538
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 829
;829:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1539
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 830
;830:		}
LABELV $1540
line 831
;831:		if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $1551
line 832
;832:		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 833
;833:		trap_Cmd_ExecuteText( EXEC_INSERT, "execscript tools/create\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1538
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 834
;834:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1539
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 835
;835:		}
LABELV $1551
line 836
;836:		if(uis.sb_tab == 4){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 4
NEI4 $1562
line 837
;837:		trap_Cmd_ExecuteText( EXEC_INSERT, va("give %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1565
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 838
;838:		}
LABELV $1562
line 839
;839:		if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $1570
line 840
;840:		trap_Cmd_ExecuteText( EXEC_INSERT, va("useadmcvar %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $1573
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 841
;841:		}
LABELV $1570
line 842
;842:		if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $1581
line 843
;843:		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 844
;844:		trap_Cmd_ExecuteText( EXEC_INSERT, "execscript tools/create\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1538
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 845
;845:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1539
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 846
;846:		}
LABELV $1581
line 847
;847:		if(uis.sb_tab == 7){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 7
NEI4 $1592
line 848
;848:		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript dscripts/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1595
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 849
;849:		}
LABELV $1592
line 850
;850:		if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $1600
line 851
;851:		trap_Cmd_ExecuteText( EXEC_INSERT, va("bind %s execscript tools/%s.as\n", s_sandboxmain.modif[0].field.buffer, s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1603
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 852
;852:		}
LABELV $1600
line 853
;853:		if(uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $1611
line 854
;854:		trap_Cmd_ExecuteText( EXEC_INSERT, va("usecvar %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $1614
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 855
;855:		}
LABELV $1611
line 856
;856:		if(uis.sb_tab == 10){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 10
NEI4 $1524
line 857
;857:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 858
;858:		trap_Cmd_ExecuteText( EXEC_INSERT, va("mgui %s; set lastui mgui %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1625
ARGP4
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 859
;859:		}
line 860
;860:		break;
ADDRGP4 $1524
JUMPV
LABELV $1634
line 863
;861:	
;862:	case ID_CLOSE:
;863:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1539
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 864
;864:		break;
ADDRGP4 $1524
JUMPV
LABELV $1635
line 867
;865:		
;866:	case ID_SWITCHTAB:
;867:		if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $1636
line 868
;868:		uis.sb_tab = 8;
ADDRGP4 uis+11472
CNSTI4 8
ASGNI4
line 869
;869:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 870
;870:		return;
ADDRGP4 $1520
JUMPV
LABELV $1636
line 872
;871:		}
;872:		if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $1524
line 873
;873:		uis.sb_tab = 1;
ADDRGP4 uis+11472
CNSTI4 1
ASGNI4
line 874
;874:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 875
;875:		return;
ADDRGP4 $1520
JUMPV
line 877
;876:		}
;877:		break;
LABELV $1645
line 880
;878:	
;879:	case ID_TAB1:
;880:		uis.sb_tab = 1;
ADDRGP4 uis+11472
CNSTI4 1
ASGNI4
line 881
;881:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 882
;882:		break;
ADDRGP4 $1524
JUMPV
LABELV $1647
line 885
;883:		
;884:	case ID_TAB2:
;885:		uis.sb_tab = 2;
ADDRGP4 uis+11472
CNSTI4 2
ASGNI4
line 886
;886:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 887
;887:		break;
ADDRGP4 $1524
JUMPV
LABELV $1649
line 890
;888:	
;889:	case ID_TAB3:
;890:		uis.sb_tab = 3;
ADDRGP4 uis+11472
CNSTI4 3
ASGNI4
line 891
;891:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 892
;892:		break;
ADDRGP4 $1524
JUMPV
LABELV $1651
line 895
;893:		
;894:	case ID_TAB4:
;895:		uis.sb_tab = 4;
ADDRGP4 uis+11472
CNSTI4 4
ASGNI4
line 896
;896:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 897
;897:		break;
ADDRGP4 $1524
JUMPV
LABELV $1653
line 900
;898:		
;899:	case ID_TAB5:
;900:		uis.sb_tab = 5;
ADDRGP4 uis+11472
CNSTI4 5
ASGNI4
line 901
;901:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 902
;902:		break;
ADDRGP4 $1524
JUMPV
LABELV $1655
line 905
;903:		
;904:	case ID_TAB6:
;905:		uis.sb_tab = 6;
ADDRGP4 uis+11472
CNSTI4 6
ASGNI4
line 906
;906:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 907
;907:		break;
ADDRGP4 $1524
JUMPV
LABELV $1657
line 910
;908:	
;909:	case ID_TAB7:
;910:		uis.sb_tab = 7;
ADDRGP4 uis+11472
CNSTI4 7
ASGNI4
line 911
;911:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 912
;912:		break;
ADDRGP4 $1524
JUMPV
LABELV $1659
line 915
;913:		
;914:	case ID_TAB8:
;915:		uis.sb_tab = 8;
ADDRGP4 uis+11472
CNSTI4 8
ASGNI4
line 916
;916:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 917
;917:		break;
ADDRGP4 $1524
JUMPV
LABELV $1661
line 920
;918:		
;919:	case ID_TAB9:
;920:		uis.sb_tab = 9;
ADDRGP4 uis+11472
CNSTI4 9
ASGNI4
line 921
;921:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 922
;922:		break;
ADDRGP4 $1524
JUMPV
LABELV $1663
line 925
;923:		
;924:	case ID_TAB10:
;925:		uis.sb_tab = 10;
ADDRGP4 uis+11472
CNSTI4 10
ASGNI4
line 926
;926:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 927
;927:		break;
ADDRGP4 $1524
JUMPV
LABELV $1665
line 930
;928:	
;929:	case ID_LIST:
;930:		if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $1666
line 931
;931:		uis.texturelist_folder = s_sandboxmain.list.curvalue;
ADDRGP4 uis+11488
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ASGNI4
line 932
;932:		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 933
;933:		}
LABELV $1666
line 934
;934:		if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $1672
line 935
;935:		trap_Cmd_ExecuteText( EXEC_NOW, va("set toolcmd_spawn sl npc %s %s %s %s %s %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.modif[0].field.buffer, s_sandboxmain.modif[1].field.buffer, s_sandboxmain.modif[2].field.buffer, s_sandboxmain.modif[3].field.buffer, s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 $642
ARGP4
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 936
;936:		trap_Cmd_ExecuteText( EXEC_INSERT, "vstr toolcmd_spawn\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1702
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 937
;937:		}
LABELV $1672
line 938
;938:		if(uis.sb_tab == 4){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 4
NEI4 $1703
line 939
;939:		trap_Cmd_ExecuteText( EXEC_INSERT, va("give %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1565
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 940
;940:		}
LABELV $1703
line 941
;941:		if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $1710
line 942
;942:		trap_Cmd_ExecuteText( EXEC_INSERT, va("useadmcvar %s 0 1\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $1713
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 943
;943:		}
LABELV $1710
line 944
;944:		if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $1721
line 945
;945:		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript spawnlists/%s/%s.as\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1724
ARGP4
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 946
;946:		}
LABELV $1721
line 947
;947:		if(uis.sb_tab == 7){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 7
NEI4 $1733
line 948
;948:		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript dscripts/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1595
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 949
;949:		}
LABELV $1733
line 950
;950:		if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $1740
line 951
;951:		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 952
;952:		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript tools/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1751
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 953
;953:		}
LABELV $1740
line 954
;954:		if(uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $1756
line 955
;955:		trap_Cmd_ExecuteText( EXEC_INSERT, va("usecvar %s 0 1\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $1759
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 956
;956:		}
LABELV $1756
line 957
;957:		if(uis.sb_tab == 10){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 10
NEI4 $1524
line 958
;958:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 959
;959:		trap_Cmd_ExecuteText( EXEC_INSERT, va("mgui %s; set lastui mgui %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
ADDRGP4 $1625
ARGP4
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 960
;960:		}
line 961
;961:		break;
ADDRGP4 $1524
JUMPV
LABELV $1778
line 964
;962:
;963:	case ID_TEXTURESLIST:
;964:		trap_Cmd_ExecuteText( EXEC_NOW, va(tool_spawnpreset.string, tool_spawnpreset_arg(1), tool_spawnpreset_arg(2), tool_spawnpreset_arg(3), tool_spawnpreset_arg(4), MODIF_LIST) );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 12
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 16
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
CNSTI4 4
ARGI4
ADDRLP4 20
ADDRGP4 tool_spawnpreset_arg
CALLP4
ASGNP4
ADDRGP4 tool_spawnpreset+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 965
;965:		trap_Cmd_ExecuteText( EXEC_INSERT, "vstr toolcmd_spawn\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1702
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 966
;966:		break;
ADDRGP4 $1524
JUMPV
LABELV $1851
line 969
;967:		
;968:	case ID_CLASSLIST:
;969:		if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $1852
line 970
;970:		trap_Cmd_ExecuteText( EXEC_NOW, va(spawn_preset.string, s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.priv.curvalue, s_sandboxmain.grid.field.buffer, "0") );
ADDRGP4 spawn_preset+16
ARGP4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRGP4 s_sandboxmain+8724+416
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_sandboxmain+1296+88
INDIRI4
ARGI4
ADDRGP4 s_sandboxmain+1392+88+12
ARGP4
ADDRGP4 $502
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 971
;971:		trap_Cmd_ExecuteText( EXEC_INSERT, "vstr toolcmd_spawn\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1702
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 972
;972:		}
LABELV $1852
line 973
;973:		if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $1524
line 974
;974:		uis.spawnlist_folder = s_sandboxmain.classlist.curvalue;
ADDRGP4 uis+11484
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
ASGNI4
line 975
;975:		SandboxMain_SpawnListUpdate();
ADDRGP4 SandboxMain_SpawnListUpdate
CALLV
pop
line 976
;976:		}
line 977
;977:		break;
ADDRGP4 $1524
JUMPV
LABELV $1875
line 980
;978:		
;979:	case ID_SAVEMAP:
;980:		if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $1876
line 981
;981:		trap_Cmd_ExecuteText( EXEC_INSERT, "toggle bot_nochat\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1879
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 982
;982:		} else if(uis.sb_tab == 3){
ADDRGP4 $1524
JUMPV
LABELV $1876
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $1880
line 983
;983:		trap_Cmd_ExecuteText( EXEC_INSERT, "op bot_pause = 1\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1883
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 984
;984:		} else {
ADDRGP4 $1524
JUMPV
LABELV $1880
line 985
;985:		UI_saveMapEdMenu();
ADDRGP4 UI_saveMapEdMenu
CALLV
pop
line 986
;986:		}
line 987
;987:		break;
ADDRGP4 $1524
JUMPV
LABELV $1884
line 990
;988:
;989:	case ID_LOADMAP:
;990:		if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $1885
line 991
;991:		trap_Cmd_ExecuteText( EXEC_INSERT, "kick allbots\n" );
CNSTI4 1
ARGI4
ADDRGP4 $1888
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 992
;992:		} else if(uis.sb_tab == 3){
ADDRGP4 $1524
JUMPV
LABELV $1885
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $1889
line 993
;993:		trap_Cmd_ExecuteText( EXEC_INSERT, "op bot_pause = 0\n" );	
CNSTI4 1
ARGI4
ADDRGP4 $1892
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 994
;994:		} else {
ADDRGP4 $1524
JUMPV
LABELV $1889
line 995
;995:		UI_loadMapEdMenu();
ADDRGP4 UI_loadMapEdMenu
CALLV
pop
line 996
;996:		}
line 997
;997:		break;
line 1001
;998:		
;999:	case ID_PRIV:
;1000:
;1001:		break;
LABELV $1523
LABELV $1524
line 1003
;1002:	}
;1003:}
LABELV $1520
endproc SandboxMain_MenuEvent 36 92
data
export s_sandboxmain_color1
align 4
LABELV s_sandboxmain_color1
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export SandboxMain_MenuInit
code
proc SandboxMain_MenuInit 1152 16
line 1012
;1004:
;1005:vec4_t	s_sandboxmain_color1 = {1.00f, 1.00f, 1.00f, 1.00f};
;1006:
;1007:/*
;1008:===============
;1009:SandboxMain_MenuInit
;1010:===============
;1011:*/
;1012:void SandboxMain_MenuInit( void ) {
line 1022
;1013:	int		y;
;1014:	int		gametype;
;1015:	char	info[MAX_INFO_STRING];
;1016:	int		i;
;1017:	int		len;
;1018:	char	*configname;
;1019:    int name_length;
;1020:    const char *bot_name;
;1021:
;1022:	memset( &s_sandboxmain, 0, sizeof(s_sandboxmain) );
ADDRGP4 s_sandboxmain
ARGP4
CNSTI4 0
ARGI4
CNSTI4 8399948
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1024
;1023:
;1024:	s_sandboxmain.menu.draw = SandboxMain_MenuDraw;
ADDRGP4 s_sandboxmain+1036
ADDRGP4 SandboxMain_MenuDraw
ASGNP4
line 1025
;1025:	s_sandboxmain.menu.wrapAround = qtrue;
ADDRGP4 s_sandboxmain+1044
CNSTI4 1
ASGNI4
line 1026
;1026:	s_sandboxmain.menu.native = qfalse;
ADDRGP4 s_sandboxmain+1056
CNSTI4 0
ASGNI4
line 1027
;1027:	s_sandboxmain.menu.fullscreen = qfalse;
ADDRGP4 s_sandboxmain+1052
CNSTI4 0
ASGNI4
line 1028
;1028:	s_sandboxmain.menu.key        = SandboxMain_MenuKey;
ADDRGP4 s_sandboxmain+1040
ADDRGP4 SandboxMain_MenuKey
ASGNP4
line 1030
;1029:
;1030:	s_sandboxmain.close.string          = "Close";
ADDRGP4 s_sandboxmain+11132+88
ADDRGP4 $1904
ASGNP4
line 1031
;1031:	s_sandboxmain.switchtab.string      = "Switch";
ADDRGP4 s_sandboxmain+11236+88
ADDRGP4 $1907
ASGNP4
line 1032
;1032:	s_sandboxmain.tab1.string           = "Create";
ADDRGP4 s_sandboxmain+10092+88
ADDRGP4 $1910
ASGNP4
line 1033
;1033:	s_sandboxmain.tab2.string           = "Entities";
ADDRGP4 s_sandboxmain+10196+88
ADDRGP4 $1913
ASGNP4
line 1034
;1034:	s_sandboxmain.tab3.string           = "NPCs";
ADDRGP4 s_sandboxmain+10300+88
ADDRGP4 $1916
ASGNP4
line 1035
;1035:	s_sandboxmain.tab4.string           = "Items";
ADDRGP4 s_sandboxmain+10404+88
ADDRGP4 $1919
ASGNP4
line 1036
;1036:	s_sandboxmain.tab5.string           = "Admin";
ADDRGP4 s_sandboxmain+10508+88
ADDRGP4 $1922
ASGNP4
line 1037
;1037:	s_sandboxmain.tab6.string           = "Lists";
ADDRGP4 s_sandboxmain+10612+88
ADDRGP4 $1925
ASGNP4
line 1038
;1038:	s_sandboxmain.tab7.string           = "Scripts";
ADDRGP4 s_sandboxmain+10716+88
ADDRGP4 $1928
ASGNP4
line 1039
;1039:	s_sandboxmain.tab8.string           = "Tools";
ADDRGP4 s_sandboxmain+10820+88
ADDRGP4 $1931
ASGNP4
line 1040
;1040:	s_sandboxmain.tab9.string           = "Settings";
ADDRGP4 s_sandboxmain+10924+88
ADDRGP4 $1934
ASGNP4
line 1041
;1041:	s_sandboxmain.tab10.string          = "Addons";
ADDRGP4 s_sandboxmain+11028+88
ADDRGP4 $1937
ASGNP4
line 1042
;1042:	s_sandboxmain.savemap.string		= "Save map";
ADDRGP4 s_sandboxmain+1756+88
ADDRGP4 $1940
ASGNP4
line 1043
;1043:	s_sandboxmain.loadmap.string		= "Load map";
ADDRGP4 s_sandboxmain+1860+88
ADDRGP4 $1943
ASGNP4
line 1044
;1044:	s_sandboxmain.priv.generic.name		= "Private:";
ADDRGP4 s_sandboxmain+1296+4
ADDRGP4 $1946
ASGNP4
line 1045
;1045:	s_sandboxmain.grid.generic.name		= "Grid size:";
ADDRGP4 s_sandboxmain+1392+4
ADDRGP4 $1949
ASGNP4
line 1047
;1046:	
;1047:	s_sandboxmain.close.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+11132
CNSTI4 9
ASGNI4
line 1048
;1048:	s_sandboxmain.close.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+11132+72
CNSTU4 264
ASGNU4
line 1049
;1049:	s_sandboxmain.close.generic.id       	= ID_CLOSE;
ADDRGP4 s_sandboxmain+11132+24
CNSTI4 117
ASGNI4
line 1050
;1050:	s_sandboxmain.close.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+11132+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1051
;1051:	s_sandboxmain.close.generic.x        	= (640 - (110*0.25)) + uis.wideoffset;
ADDRGP4 s_sandboxmain+11132+28
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
CNSTF4 1142497280
ADDF4
CVFI4 4
ASGNI4
line 1052
;1052:	s_sandboxmain.close.generic.y        	= 15;
ADDRGP4 s_sandboxmain+11132+32
CNSTI4 15
ASGNI4
line 1053
;1053:	s_sandboxmain.close.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+11132+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1054
;1054:	s_sandboxmain.close.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+11132+92
CNSTI4 1
ASGNI4
line 1055
;1055:	s_sandboxmain.close.customsize			= 0.5;
ADDRGP4 s_sandboxmain+11132+96
CNSTF4 1056964608
ASGNF4
line 1056
;1056:	s_sandboxmain.close.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+11132+60
CNSTF4 1069547520
ASGNF4
line 1058
;1057:	
;1058:	s_sandboxmain.switchtab.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+11236
CNSTI4 9
ASGNI4
line 1059
;1059:	s_sandboxmain.switchtab.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+11236+72
CNSTU4 264
ASGNU4
line 1060
;1060:	s_sandboxmain.switchtab.generic.id       	= ID_SWITCHTAB;
ADDRGP4 s_sandboxmain+11236+24
CNSTI4 118
ASGNI4
line 1061
;1061:	s_sandboxmain.switchtab.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+11236+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1062
;1062:	s_sandboxmain.switchtab.generic.x        	= 566 + uis.wideoffset;
ADDRGP4 s_sandboxmain+11236+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 566
ADDI4
ASGNI4
line 1063
;1063:	s_sandboxmain.switchtab.generic.y        	= 60;
ADDRGP4 s_sandboxmain+11236+32
CNSTI4 60
ASGNI4
line 1064
;1064:	s_sandboxmain.switchtab.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+11236+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1065
;1065:	s_sandboxmain.switchtab.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+11236+92
CNSTI4 1
ASGNI4
line 1066
;1066:	s_sandboxmain.switchtab.customsize			= 0.5;
ADDRGP4 s_sandboxmain+11236+96
CNSTF4 1056964608
ASGNF4
line 1067
;1067:	s_sandboxmain.switchtab.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+11236+60
CNSTF4 1069547520
ASGNF4
line 1069
;1068:	
;1069:	s_sandboxmain.tab1.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10092
CNSTI4 9
ASGNI4
line 1070
;1070:	s_sandboxmain.tab1.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10092+72
CNSTU4 264
ASGNU4
line 1071
;1071:	s_sandboxmain.tab1.generic.id       	= ID_TAB1;
ADDRGP4 s_sandboxmain+10092+24
CNSTI4 107
ASGNI4
line 1072
;1072:	s_sandboxmain.tab1.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10092+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1073
;1073:	s_sandboxmain.tab1.generic.x        	= (110*0.5)*1 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10092+28
CNSTF4 1113325568
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1074
;1074:	s_sandboxmain.tab1.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10092+32
CNSTI4 15
ASGNI4
line 1075
;1075:	s_sandboxmain.tab1.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10092+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1076
;1076:	s_sandboxmain.tab1.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10092+92
CNSTI4 1
ASGNI4
line 1077
;1077:	s_sandboxmain.tab1.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10092+96
CNSTF4 1056964608
ASGNF4
line 1078
;1078:	s_sandboxmain.tab1.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10092+60
CNSTF4 1069547520
ASGNF4
line 1080
;1079:	
;1080:	s_sandboxmain.tab2.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10196
CNSTI4 9
ASGNI4
line 1081
;1081:	s_sandboxmain.tab2.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10196+72
CNSTU4 264
ASGNU4
line 1082
;1082:	s_sandboxmain.tab2.generic.id       	= ID_TAB2;
ADDRGP4 s_sandboxmain+10196+24
CNSTI4 108
ASGNI4
line 1083
;1083:	s_sandboxmain.tab2.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10196+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1084
;1084:	s_sandboxmain.tab2.generic.x        	= (110*0.5)*2 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10196+28
CNSTF4 1121714176
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1085
;1085:	s_sandboxmain.tab2.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10196+32
CNSTI4 15
ASGNI4
line 1086
;1086:	s_sandboxmain.tab2.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10196+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1087
;1087:	s_sandboxmain.tab2.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10196+92
CNSTI4 1
ASGNI4
line 1088
;1088:	s_sandboxmain.tab2.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10196+96
CNSTF4 1056964608
ASGNF4
line 1089
;1089:	s_sandboxmain.tab2.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10196+60
CNSTF4 1069547520
ASGNF4
line 1091
;1090:	
;1091:	s_sandboxmain.tab3.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10300
CNSTI4 9
ASGNI4
line 1092
;1092:	s_sandboxmain.tab3.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10300+72
CNSTU4 264
ASGNU4
line 1093
;1093:	s_sandboxmain.tab3.generic.id       	= ID_TAB3;
ADDRGP4 s_sandboxmain+10300+24
CNSTI4 109
ASGNI4
line 1094
;1094:	s_sandboxmain.tab3.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10300+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1095
;1095:	s_sandboxmain.tab3.generic.x        	= (110*0.5)*3 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10300+28
CNSTF4 1126498304
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1096
;1096:	s_sandboxmain.tab3.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10300+32
CNSTI4 15
ASGNI4
line 1097
;1097:	s_sandboxmain.tab3.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10300+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1098
;1098:	s_sandboxmain.tab3.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10300+92
CNSTI4 1
ASGNI4
line 1099
;1099:	s_sandboxmain.tab3.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10300+96
CNSTF4 1056964608
ASGNF4
line 1100
;1100:	s_sandboxmain.tab3.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10300+60
CNSTF4 1069547520
ASGNF4
line 1102
;1101:	
;1102:	s_sandboxmain.tab4.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10404
CNSTI4 9
ASGNI4
line 1103
;1103:	s_sandboxmain.tab4.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10404+72
CNSTU4 264
ASGNU4
line 1104
;1104:	s_sandboxmain.tab4.generic.id       	= ID_TAB4;
ADDRGP4 s_sandboxmain+10404+24
CNSTI4 110
ASGNI4
line 1105
;1105:	s_sandboxmain.tab4.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10404+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1106
;1106:	s_sandboxmain.tab4.generic.x        	= (110*0.5)*4 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10404+28
CNSTF4 1130102784
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1107
;1107:	s_sandboxmain.tab4.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10404+32
CNSTI4 15
ASGNI4
line 1108
;1108:	s_sandboxmain.tab4.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10404+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1109
;1109:	s_sandboxmain.tab4.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10404+92
CNSTI4 1
ASGNI4
line 1110
;1110:	s_sandboxmain.tab4.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10404+96
CNSTF4 1056964608
ASGNF4
line 1111
;1111:	s_sandboxmain.tab4.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10404+60
CNSTF4 1069547520
ASGNF4
line 1113
;1112:	
;1113:	s_sandboxmain.tab5.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10508
CNSTI4 9
ASGNI4
line 1114
;1114:	s_sandboxmain.tab5.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10508+72
CNSTU4 264
ASGNU4
line 1115
;1115:	s_sandboxmain.tab5.generic.id       	= ID_TAB5;
ADDRGP4 s_sandboxmain+10508+24
CNSTI4 111
ASGNI4
line 1116
;1116:	s_sandboxmain.tab5.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10508+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1117
;1117:	s_sandboxmain.tab5.generic.x        	= (110*0.5)*5 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10508+28
CNSTF4 1133084672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1118
;1118:	s_sandboxmain.tab5.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10508+32
CNSTI4 15
ASGNI4
line 1119
;1119:	s_sandboxmain.tab5.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10508+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1120
;1120:	s_sandboxmain.tab5.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10508+92
CNSTI4 1
ASGNI4
line 1121
;1121:	s_sandboxmain.tab5.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10508+96
CNSTF4 1056964608
ASGNF4
line 1122
;1122:	s_sandboxmain.tab5.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10508+60
CNSTF4 1069547520
ASGNF4
line 1124
;1123:	
;1124:	s_sandboxmain.tab6.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10612
CNSTI4 9
ASGNI4
line 1125
;1125:	s_sandboxmain.tab6.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10612+72
CNSTU4 264
ASGNU4
line 1126
;1126:	s_sandboxmain.tab6.generic.id       	= ID_TAB6;
ADDRGP4 s_sandboxmain+10612+24
CNSTI4 112
ASGNI4
line 1127
;1127:	s_sandboxmain.tab6.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10612+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1128
;1128:	s_sandboxmain.tab6.generic.x        	= (110*0.5)*6 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10612+28
CNSTF4 1134886912
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1129
;1129:	s_sandboxmain.tab6.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10612+32
CNSTI4 15
ASGNI4
line 1130
;1130:	s_sandboxmain.tab6.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10612+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1131
;1131:	s_sandboxmain.tab6.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10612+92
CNSTI4 1
ASGNI4
line 1132
;1132:	s_sandboxmain.tab6.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10612+96
CNSTF4 1056964608
ASGNF4
line 1133
;1133:	s_sandboxmain.tab6.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10612+60
CNSTF4 1069547520
ASGNF4
line 1135
;1134:	
;1135:	s_sandboxmain.tab7.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10716
CNSTI4 9
ASGNI4
line 1136
;1136:	s_sandboxmain.tab7.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10716+72
CNSTU4 264
ASGNU4
line 1137
;1137:	s_sandboxmain.tab7.generic.id       	= ID_TAB7;
ADDRGP4 s_sandboxmain+10716+24
CNSTI4 113
ASGNI4
line 1138
;1138:	s_sandboxmain.tab7.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10716+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1139
;1139:	s_sandboxmain.tab7.generic.x        	= (110*0.5)*7 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10716+28
CNSTF4 1136689152
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1140
;1140:	s_sandboxmain.tab7.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10716+32
CNSTI4 15
ASGNI4
line 1141
;1141:	s_sandboxmain.tab7.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10716+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1142
;1142:	s_sandboxmain.tab7.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10716+92
CNSTI4 1
ASGNI4
line 1143
;1143:	s_sandboxmain.tab7.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10716+96
CNSTF4 1056964608
ASGNF4
line 1144
;1144:	s_sandboxmain.tab7.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10716+60
CNSTF4 1069547520
ASGNF4
line 1146
;1145:
;1146:	s_sandboxmain.tab8.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10820
CNSTI4 9
ASGNI4
line 1147
;1147:	s_sandboxmain.tab8.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10820+72
CNSTU4 264
ASGNU4
line 1148
;1148:	s_sandboxmain.tab8.generic.id       	= ID_TAB8;
ADDRGP4 s_sandboxmain+10820+24
CNSTI4 114
ASGNI4
line 1149
;1149:	s_sandboxmain.tab8.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10820+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1150
;1150:	s_sandboxmain.tab8.generic.x        	= (110*0.5)*8 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10820+28
CNSTF4 1138491392
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1151
;1151:	s_sandboxmain.tab8.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10820+32
CNSTI4 15
ASGNI4
line 1152
;1152:	s_sandboxmain.tab8.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10820+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1153
;1153:	s_sandboxmain.tab8.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10820+92
CNSTI4 1
ASGNI4
line 1154
;1154:	s_sandboxmain.tab8.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10820+96
CNSTF4 1056964608
ASGNF4
line 1155
;1155:	s_sandboxmain.tab8.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10820+60
CNSTF4 1069547520
ASGNF4
line 1157
;1156:	
;1157:	s_sandboxmain.tab9.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+10924
CNSTI4 9
ASGNI4
line 1158
;1158:	s_sandboxmain.tab9.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+10924+72
CNSTU4 264
ASGNU4
line 1159
;1159:	s_sandboxmain.tab9.generic.id       	= ID_TAB9;
ADDRGP4 s_sandboxmain+10924+24
CNSTI4 115
ASGNI4
line 1160
;1160:	s_sandboxmain.tab9.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+10924+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1161
;1161:	s_sandboxmain.tab9.generic.x        	= (110*0.5)*9 - uis.wideoffset;
ADDRGP4 s_sandboxmain+10924+28
CNSTF4 1140293632
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1162
;1162:	s_sandboxmain.tab9.generic.y        	= 15;
ADDRGP4 s_sandboxmain+10924+32
CNSTI4 15
ASGNI4
line 1163
;1163:	s_sandboxmain.tab9.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+10924+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1164
;1164:	s_sandboxmain.tab9.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+10924+92
CNSTI4 1
ASGNI4
line 1165
;1165:	s_sandboxmain.tab9.customsize			= 0.5;
ADDRGP4 s_sandboxmain+10924+96
CNSTF4 1056964608
ASGNF4
line 1166
;1166:	s_sandboxmain.tab9.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+10924+60
CNSTF4 1069547520
ASGNF4
line 1168
;1167:	
;1168:	s_sandboxmain.tab10.generic.type     	= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+11028
CNSTI4 9
ASGNI4
line 1169
;1169:	s_sandboxmain.tab10.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+11028+72
CNSTU4 264
ASGNU4
line 1170
;1170:	s_sandboxmain.tab10.generic.id       	= ID_TAB10;
ADDRGP4 s_sandboxmain+11028+24
CNSTI4 116
ASGNI4
line 1171
;1171:	s_sandboxmain.tab10.generic.callback 	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+11028+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1172
;1172:	s_sandboxmain.tab10.generic.x        	= (110*0.5)*10 - uis.wideoffset;
ADDRGP4 s_sandboxmain+11028+28
CNSTF4 1141473280
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1173
;1173:	s_sandboxmain.tab10.generic.y        	= 15;
ADDRGP4 s_sandboxmain+11028+32
CNSTI4 15
ASGNI4
line 1174
;1174:	s_sandboxmain.tab10.color			    = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+11028+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1175
;1175:	s_sandboxmain.tab10.style			    = UI_CENTER;
ADDRGP4 s_sandboxmain+11028+92
CNSTI4 1
ASGNI4
line 1176
;1176:	s_sandboxmain.tab10.customsize			= 0.5;
ADDRGP4 s_sandboxmain+11028+96
CNSTF4 1056964608
ASGNF4
line 1177
;1177:	s_sandboxmain.tab10.generic.heightmod	= 1.5;
ADDRGP4 s_sandboxmain+11028+60
CNSTF4 1069547520
ASGNF4
line 1179
;1178:	
;1179:	s_sandboxmain.savemap.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1756
CNSTI4 9
ASGNI4
line 1180
;1180:	s_sandboxmain.savemap.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+1756+72
CNSTU4 264
ASGNU4
line 1181
;1181:	s_sandboxmain.savemap.generic.id       = ID_SAVEMAP;
ADDRGP4 s_sandboxmain+1756+24
CNSTI4 105
ASGNI4
line 1182
;1182:	s_sandboxmain.savemap.generic.callback = SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+1756+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1183
;1183:	s_sandboxmain.savemap.generic.x        = 440 + uis.wideoffset;
ADDRGP4 s_sandboxmain+1756+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 440
ADDI4
ASGNI4
line 1184
;1184:	s_sandboxmain.savemap.generic.y        = 420 + 5;
ADDRGP4 s_sandboxmain+1756+32
CNSTI4 425
ASGNI4
line 1185
;1185:	s_sandboxmain.savemap.style            = UI_CENTER;
ADDRGP4 s_sandboxmain+1756+92
CNSTI4 1
ASGNI4
line 1186
;1186:	s_sandboxmain.savemap.color            = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1756+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1188
;1187:
;1188:	s_sandboxmain.loadmap.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1860
CNSTI4 9
ASGNI4
line 1189
;1189:	s_sandboxmain.loadmap.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+1860+72
CNSTU4 264
ASGNU4
line 1190
;1190:	s_sandboxmain.loadmap.generic.id       = ID_LOADMAP;
ADDRGP4 s_sandboxmain+1860+24
CNSTI4 106
ASGNI4
line 1191
;1191:	s_sandboxmain.loadmap.generic.callback = SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+1860+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1192
;1192:	s_sandboxmain.loadmap.generic.x        = 440 + uis.wideoffset;
ADDRGP4 s_sandboxmain+1860+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 440
ADDI4
ASGNI4
line 1193
;1193:	s_sandboxmain.loadmap.generic.y        = 420 + 25;
ADDRGP4 s_sandboxmain+1860+32
CNSTI4 445
ASGNI4
line 1194
;1194:	s_sandboxmain.loadmap.style            = UI_CENTER;
ADDRGP4 s_sandboxmain+1860+92
CNSTI4 1
ASGNI4
line 1195
;1195:	s_sandboxmain.loadmap.color            = s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1860+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1197
;1196:	
;1197:	y = 50;	
ADDRLP4 12
CNSTI4 50
ASGNI4
line 1198
;1198:	s_sandboxmain.priv.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_sandboxmain+1296
CNSTI4 5
ASGNI4
line 1199
;1199:	s_sandboxmain.priv.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_sandboxmain+1296+72
CNSTU4 258
ASGNU4
line 1200
;1200:	s_sandboxmain.priv.generic.callback		= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+1296+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1201
;1201:	s_sandboxmain.priv.generic.id			= ID_PRIV;
ADDRGP4 s_sandboxmain+1296+24
CNSTI4 104
ASGNI4
line 1202
;1202:	s_sandboxmain.priv.generic.x			= 480 + uis.wideoffset;
ADDRGP4 s_sandboxmain+1296+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 480
ADDI4
ASGNI4
line 1203
;1203:	s_sandboxmain.priv.generic.y			= y;
ADDRGP4 s_sandboxmain+1296+32
ADDRLP4 12
INDIRI4
ASGNI4
line 1204
;1204:	s_sandboxmain.priv.color				= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1296+92
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1205
;1205:	y += 18;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1207
;1206:
;1207:	s_sandboxmain.grid.generic.type			= MTYPE_FIELD;
ADDRGP4 s_sandboxmain+1392
CNSTI4 4
ASGNI4
line 1208
;1208:	s_sandboxmain.grid.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_sandboxmain+1392+72
CNSTU4 290
ASGNU4
line 1209
;1209:	s_sandboxmain.grid.field.widthInChars	= 4;
ADDRGP4 s_sandboxmain+1392+88+8
CNSTI4 4
ASGNI4
line 1210
;1210:	s_sandboxmain.grid.field.maxchars		= 4;
ADDRGP4 s_sandboxmain+1392+88+268
CNSTI4 4
ASGNI4
line 1211
;1211:	s_sandboxmain.grid.generic.x			= 480 + uis.wideoffset;
ADDRGP4 s_sandboxmain+1392+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 480
ADDI4
ASGNI4
line 1212
;1212:	s_sandboxmain.grid.generic.y			= y;
ADDRGP4 s_sandboxmain+1392+32
ADDRLP4 12
INDIRI4
ASGNI4
line 1213
;1213:	s_sandboxmain.grid.color				= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1392+360
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1214
;1214:	y += 18;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1216
;1215:	
;1216:	for(i = 0; i < PROPERTIES_NUM; i++){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2252
line 1217
;1217:	s_sandboxmain.modif[i].generic.type			= MTYPE_FIELD;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172
ADDP4
CNSTI4 4
ASGNI4
line 1218
;1218:	s_sandboxmain.modif[i].generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172+72
ADDP4
CNSTU4 258
ASGNU4
line 1219
;1219:	s_sandboxmain.modif[i].field.widthInChars	= 14;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172+88+8
ADDP4
CNSTI4 14
ASGNI4
line 1220
;1220:	s_sandboxmain.modif[i].field.maxchars		= 64;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172+88+268
ADDP4
CNSTI4 64
ASGNI4
line 1221
;1221:	s_sandboxmain.modif[i].generic.x			= 480 + uis.wideoffset;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172+28
ADDP4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 480
ADDI4
ASGNI4
line 1222
;1222:	s_sandboxmain.modif[i].generic.y			= y;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172+32
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1223
;1223:	s_sandboxmain.modif[i].color				= s_sandboxmain_color1;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172+360
ADDP4
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1224
;1224:	y += 18;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1225
;1225:	}
LABELV $2253
line 1216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2252
line 1227
;1226:	
;1227:	s_sandboxmain.spawnobject.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1192
CNSTI4 9
ASGNI4
line 1228
;1228:	s_sandboxmain.spawnobject.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+1192+72
CNSTU4 264
ASGNU4
line 1229
;1229:	s_sandboxmain.spawnobject.generic.id       = ID_SPAWNOBJECT;
ADDRGP4 s_sandboxmain+1192+24
CNSTI4 103
ASGNI4
line 1230
;1230:	s_sandboxmain.spawnobject.generic.callback = SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+1192+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1231
;1231:	s_sandboxmain.spawnobject.generic.x        = 560 + uis.wideoffset;
ADDRGP4 s_sandboxmain+1192+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 560
ADDI4
ASGNI4
line 1232
;1232:	s_sandboxmain.spawnobject.generic.y        = 448;
ADDRGP4 s_sandboxmain+1192+32
CNSTI4 448
ASGNI4
line 1233
;1233:	s_sandboxmain.spawnobject.color					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1192+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1234
;1234:	s_sandboxmain.spawnobject.style					= UI_CENTER;
ADDRGP4 s_sandboxmain+1192+92
CNSTI4 1
ASGNI4
line 1236
;1235:
;1236:	if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $2288
line 1237
;1237:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1238
;1238:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1239
;1239:	s_sandboxmain.list.styles			= 2;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 2
ASGNI4
line 1240
;1240:	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
ADDRGP4 s_sandboxmain+8724+436
CNSTF4 1071644672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
MULF4
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 7
SUBI4
CVIF4 4
DIVF4
CNSTF4 1086324736
ADDF4
CVFI4 4
ASGNI4
line 1241
;1241:	s_sandboxmain.list.string			= "props";
ADDRGP4 s_sandboxmain+8724+112
ADDRGP4 $2302
ASGNP4
line 1242
;1242:	s_sandboxmain.list.fontsize			= 0.4;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1053609165
ASGNF4
line 1243
;1243:	s_sandboxmain.list.corner			= 65;
ADDRGP4 s_sandboxmain+8724+132
CNSTI4 65
ASGNI4
line 1244
;1244:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1245
;1245:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1246
;1246:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1247
;1247:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1248
;1248:	s_sandboxmain.list.generic.y		= 62;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 62
ASGNI4
line 1249
;1249:	s_sandboxmain.list.width			= 39/6;
ADDRGP4 s_sandboxmain+8724+104
CNSTI4 6
ASGNI4
line 1250
;1250:	s_sandboxmain.list.height			= 4;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 4
ASGNI4
line 1251
;1251:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "props", "md3", s_sandboxmain.names, 524288 );
ADDRGP4 $2302
ARGP4
ADDRGP4 $2324
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1052
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 1252
;1252:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1253
;1253:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1255
;1254:	
;1255:	s_sandboxmain.texturelist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9636
CNSTI4 11
ASGNI4
line 1256
;1256:	s_sandboxmain.texturelist.type				= 5;
ADDRGP4 s_sandboxmain+9636+96
CNSTI4 5
ASGNI4
line 1257
;1257:	s_sandboxmain.texturelist.styles			= 2;
ADDRGP4 s_sandboxmain+9636+120
CNSTI4 2
ASGNI4
line 1258
;1258:	s_sandboxmain.texturelist.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
ADDRGP4 s_sandboxmain+9636+436
CNSTF4 1071644672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
MULF4
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 7
SUBI4
CVIF4 4
DIVF4
CNSTF4 1086324736
ADDF4
CVFI4 4
ASGNI4
line 1259
;1259:	s_sandboxmain.texturelist.fontsize			= 0.4;
ADDRGP4 s_sandboxmain+9636+136
CNSTF4 1053609165
ASGNF4
line 1260
;1260:	s_sandboxmain.texturelist.corner			= 65;
ADDRGP4 s_sandboxmain+9636+132
CNSTI4 65
ASGNI4
line 1261
;1261:	s_sandboxmain.texturelist.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9636+72
CNSTU4 256
ASGNU4
line 1262
;1262:	s_sandboxmain.texturelist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9636+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1263
;1263:	s_sandboxmain.texturelist.generic.id		= ID_TEXTURESLIST;
ADDRGP4 s_sandboxmain+9636+24
CNSTI4 102
ASGNI4
line 1264
;1264:	s_sandboxmain.texturelist.generic.x			= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9636+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1265
;1265:	s_sandboxmain.texturelist.generic.y			= 215 + 62;
ADDRGP4 s_sandboxmain+9636+32
CNSTI4 277
ASGNI4
line 1266
;1266:	s_sandboxmain.texturelist.width				= 39/6;
ADDRGP4 s_sandboxmain+9636+104
CNSTI4 6
ASGNI4
line 1267
;1267:	s_sandboxmain.texturelist.height			= 4;
ADDRGP4 s_sandboxmain+9636+108
CNSTI4 4
ASGNI4
line 1268
;1268:	s_sandboxmain.texturelist.itemnames			= (const char **)s_sandboxmain.textureslist;
ADDRGP4 s_sandboxmain+9636+428
ADDRGP4 s_sandboxmain+3419212
ASGNP4
line 1269
;1269:	s_sandboxmain.texturelist.color				= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9636+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1272
;1270:	//y += 20;
;1271:	
;1272:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1273
;1273:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1274
;1274:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1275
;1275:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1276
;1276:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1277
;1277:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1279
;1278:	
;1279:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1280
;1280:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1281
;1281:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1282
;1282:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1283
;1283:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1284
;1284:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1286
;1285:	
;1286:	s_sandboxmain.propstext.string  				= "Props:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2390
ASGNP4
line 1287
;1287:	s_sandboxmain.classtext.string  				= "Textures:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2393
ASGNP4
line 1288
;1288:	s_sandboxmain.spawnobject.string           		= "Create";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $1910
ASGNP4
line 1289
;1289:	}
LABELV $2288
line 1290
;1290:	if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $2396
line 1291
;1291:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1292
;1292:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1293
;1293:	s_sandboxmain.list.styles			= 1;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 1
ASGNI4
line 1294
;1294:	s_sandboxmain.list.fontsize			= 1;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1065353216
ASGNF4
line 1295
;1295:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1296
;1296:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1297
;1297:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1298
;1298:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1299
;1299:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1300
;1300:	s_sandboxmain.list.width			= 28;
ADDRGP4 s_sandboxmain+8724+104
CNSTI4 28
ASGNI4
line 1301
;1301:	s_sandboxmain.list.height			= 15+18;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 33
ASGNI4
line 1302
;1302:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "props", "md3", s_sandboxmain.names, 524288 );
ADDRGP4 $2302
ARGP4
ADDRGP4 $2324
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1052
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 1303
;1303:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1304
;1304:	s_sandboxmain.list.columns			= 1;
ADDRGP4 s_sandboxmain+8724+436
CNSTI4 1
ASGNI4
line 1305
;1305:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1307
;1306:	
;1307:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1308
;1308:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1309
;1309:	s_sandboxmain.classlist.styles			= 2;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 2
ASGNI4
line 1310
;1310:	s_sandboxmain.classlist.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
ADDRGP4 s_sandboxmain+9180+436
CNSTF4 1071644672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
MULF4
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 7
SUBI4
CVIF4 4
DIVF4
CNSTF4 1086324736
ADDF4
CVFI4 4
ASGNI4
line 1311
;1311:	s_sandboxmain.classlist.string			= "";
ADDRGP4 s_sandboxmain+9180+112
ADDRGP4 $491
ASGNP4
line 1312
;1312:	s_sandboxmain.classlist.fontsize		= 0.4;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1053609165
ASGNF4
line 1313
;1313:	s_sandboxmain.classlist.corner			= 40;
ADDRGP4 s_sandboxmain+9180+132
CNSTI4 40
ASGNI4
line 1314
;1314:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1315
;1315:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1316
;1316:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1317
;1317:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1318
;1318:	s_sandboxmain.classlist.generic.y		= 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 70
ASGNI4
line 1319
;1319:	s_sandboxmain.classlist.width			= 39/6;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 6
ASGNI4
line 1320
;1320:	s_sandboxmain.classlist.height			= 8;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 8
ASGNI4
line 1321
;1321:	s_sandboxmain.classlist.numitems		= 119;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 119
ASGNI4
line 1322
;1322:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3157068
ASGNP4
line 1323
;1323:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1326
;1324:	//y += 20;
;1325:	
;1326:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1327
;1327:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1328
;1328:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1329
;1329:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1330
;1330:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1331
;1331:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1333
;1332:	
;1333:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1334
;1334:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1335
;1335:	s_sandboxmain.classtext.generic.y				= 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 48
ASGNI4
line 1336
;1336:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1337
;1337:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1338
;1338:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1340
;1339:	
;1340:	s_sandboxmain.propstext.string  				= "Props:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2390
ASGNP4
line 1341
;1341:	s_sandboxmain.classtext.string  				= "Entities:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2496
ASGNP4
line 1342
;1342:	s_sandboxmain.spawnobject.string           		= "Create";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $1910
ASGNP4
line 1343
;1343:	}
LABELV $2396
line 1344
;1344:	if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $2499
line 1345
;1345:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1346
;1346:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1347
;1347:	s_sandboxmain.list.styles			= 2;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 2
ASGNI4
line 1348
;1348:	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
ADDRGP4 s_sandboxmain+8724+436
CNSTF4 1071644672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
MULF4
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 7
SUBI4
CVIF4 4
DIVF4
CNSTF4 1086324736
ADDF4
CVFI4 4
ASGNI4
line 1349
;1349:	s_sandboxmain.list.string			= "bots";
ADDRGP4 s_sandboxmain+8724+112
ADDRGP4 $2513
ASGNP4
line 1350
;1350:	s_sandboxmain.list.fontsize			= 0.4;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1053609165
ASGNF4
line 1351
;1351:	s_sandboxmain.list.corner			= 65;
ADDRGP4 s_sandboxmain+8724+132
CNSTI4 65
ASGNI4
line 1352
;1352:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1353
;1353:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1354
;1354:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1355
;1355:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1356
;1356:	s_sandboxmain.list.generic.y		= 62;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 62
ASGNI4
line 1357
;1357:	s_sandboxmain.list.width			= 39/6;
ADDRGP4 s_sandboxmain+8724+104
CNSTI4 6
ASGNI4
line 1358
;1358:	s_sandboxmain.list.height			= 4;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 4
ASGNI4
line 1359
;1359:	s_sandboxmain.list.numitems			= UI_GetNumBots();
ADDRLP4 1052
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 1360
;1360:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1361
;1361:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1363
;1362:	
;1363:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1364
;1364:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1365
;1365:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1366
;1366:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1367
;1367:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1368
;1368:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1369
;1369:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1370
;1370:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1371
;1371:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1372
;1372:	s_sandboxmain.classlist.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+9180+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1373
;1373:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1374
;1374:	s_sandboxmain.classlist.numitems		= 5;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 5
ASGNI4
line 1375
;1375:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3157068
ASGNP4
line 1376
;1376:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1377
;1377:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1380
;1378:	//y += 20;
;1379:	
;1380:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1381
;1381:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1382
;1382:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1383
;1383:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1384
;1384:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1385
;1385:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1387
;1386:	
;1387:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1388
;1388:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1389
;1389:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1390
;1390:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1391
;1391:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1392
;1392:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1394
;1393:	
;1394:	s_sandboxmain.propstext.string  				= "List:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2599
ASGNP4
line 1395
;1395:	s_sandboxmain.classtext.string  				= "Class:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2602
ASGNP4
line 1396
;1396:	s_sandboxmain.savemap.string					= "Disable AI";
ADDRGP4 s_sandboxmain+1756+88
ADDRGP4 $2605
ASGNP4
line 1397
;1397:	s_sandboxmain.loadmap.string					= "Enable AI";
ADDRGP4 s_sandboxmain+1860+88
ADDRGP4 $2608
ASGNP4
line 1398
;1398:	s_sandboxmain.spawnobject.string           		= "Create";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $1910
ASGNP4
line 1399
;1399:	}
LABELV $2499
line 1400
;1400:	if(uis.sb_tab == 4){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 4
NEI4 $2611
line 1401
;1401:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1402
;1402:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1403
;1403:	s_sandboxmain.list.styles			= 2;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 2
ASGNI4
line 1404
;1404:	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
ADDRGP4 s_sandboxmain+8724+436
CNSTF4 1071644672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
MULF4
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 7
SUBI4
CVIF4 4
DIVF4
CNSTF4 1086324736
ADDF4
CVFI4 4
ASGNI4
line 1405
;1405:	s_sandboxmain.list.string			= "";
ADDRGP4 s_sandboxmain+8724+112
ADDRGP4 $491
ASGNP4
line 1406
;1406:	s_sandboxmain.list.fontsize			= 0.4;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1053609165
ASGNF4
line 1407
;1407:	s_sandboxmain.list.corner			= 65;
ADDRGP4 s_sandboxmain+8724+132
CNSTI4 65
ASGNI4
line 1408
;1408:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1409
;1409:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1410
;1410:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1411
;1411:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1412
;1412:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1413
;1413:	s_sandboxmain.list.width			= 39/6;
ADDRGP4 s_sandboxmain+8724+104
CNSTI4 6
ASGNI4
line 1414
;1414:	s_sandboxmain.list.height			= 8;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 8
ASGNI4
line 1415
;1415:	s_sandboxmain.list.numitems			= 54;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 54
ASGNI4
line 1416
;1416:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.item_itemslist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+6302796
ASGNP4
line 1417
;1417:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1419
;1418:	
;1419:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1420
;1420:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1421
;1421:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1422
;1422:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1423
;1423:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1424
;1424:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1425
;1425:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1426
;1426:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1427
;1427:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1428
;1428:	s_sandboxmain.classlist.width			= 28;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 28
ASGNI4
line 1429
;1429:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1430
;1430:	s_sandboxmain.classlist.numitems		= 118;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 118
ASGNI4
line 1431
;1431:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3681356
ASGNP4
line 1432
;1432:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1433
;1433:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1436
;1434:	//y += 20;
;1435:	
;1436:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1437
;1437:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1438
;1438:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1439
;1439:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1440
;1440:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1441
;1441:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1443
;1442:	
;1443:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1444
;1444:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1445
;1445:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1446
;1446:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1447
;1447:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1448
;1448:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1450
;1449:	
;1450:	s_sandboxmain.propstext.string  				= "Items:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2708
ASGNP4
line 1451
;1451:	s_sandboxmain.classtext.string  				= "Class:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2602
ASGNP4
line 1452
;1452:	s_sandboxmain.spawnobject.string          		= "Give";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $2713
ASGNP4
line 1453
;1453:	}
LABELV $2611
line 1454
;1454:	if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $2714
line 1455
;1455:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1456
;1456:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1457
;1457:	s_sandboxmain.list.styles			= 0;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 0
ASGNI4
line 1458
;1458:	s_sandboxmain.list.fontsize			= 1;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1065353216
ASGNF4
line 1459
;1459:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1460
;1460:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1461
;1461:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1462
;1462:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1463
;1463:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1464
;1464:	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+8724+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1465
;1465:	s_sandboxmain.list.height			= 15+18;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 33
ASGNI4
line 1466
;1466:	s_sandboxmain.list.numitems			= 8;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 8
ASGNI4
line 1467
;1467:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.cvar_itemslist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+4205644
ASGNP4
line 1468
;1468:	s_sandboxmain.list.columns			= 1;
ADDRGP4 s_sandboxmain+8724+436
CNSTI4 1
ASGNI4
line 1469
;1469:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1471
;1470:	
;1471:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1472
;1472:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1473
;1473:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1474
;1474:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1475
;1475:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1476
;1476:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1477
;1477:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1478
;1478:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1479
;1479:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1480
;1480:	s_sandboxmain.classlist.width			= 28;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 28
ASGNI4
line 1481
;1481:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1482
;1482:	s_sandboxmain.classlist.numitems		= 118;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 118
ASGNI4
line 1483
;1483:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3157068
ASGNP4
line 1484
;1484:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1485
;1485:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1488
;1486:	//y += 20;
;1487:	
;1488:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1489
;1489:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1490
;1490:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1491
;1491:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1492
;1492:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1493
;1493:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1495
;1494:	
;1495:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1496
;1496:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1497
;1497:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1498
;1498:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1499
;1499:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1500
;1500:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1502
;1501:	
;1502:	s_sandboxmain.propstext.string  				= "Settings:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2807
ASGNP4
line 1503
;1503:	s_sandboxmain.classtext.string  				= "Class:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2602
ASGNP4
line 1504
;1504:	s_sandboxmain.spawnobject.string           		= "Apply";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $2812
ASGNP4
line 1505
;1505:	s_sandboxmain.savemap.string					= "Bot chat";
ADDRGP4 s_sandboxmain+1756+88
ADDRGP4 $2815
ASGNP4
line 1506
;1506:	s_sandboxmain.loadmap.string					= "Kick bots";
ADDRGP4 s_sandboxmain+1860+88
ADDRGP4 $2818
ASGNP4
line 1507
;1507:	}
LABELV $2714
line 1508
;1508:	if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $2819
line 1509
;1509:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1510
;1510:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1511
;1511:	s_sandboxmain.classlist.styles				= 0;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 0
ASGNI4
line 1512
;1512:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1513
;1513:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1514
;1514:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1515
;1515:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1516
;1516:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1517
;1517:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1518
;1518:	s_sandboxmain.classlist.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+9180+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1519
;1519:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1520
;1520:	s_sandboxmain.classlist.numitems		= trap_FS_GetFileList( va("spawnlists", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue]), "cfg", s_sandboxmain.names2, 524288 );
ADDRGP4 $2848
ARGP4
ADDRGP4 s_sandboxmain+9180+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 $2853
ARGP4
ADDRGP4 s_sandboxmain+535628
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1056
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+9180+420
ADDRLP4 1056
INDIRI4
ASGNI4
line 1521
;1521:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3157068
ASGNP4
line 1522
;1522:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1523
;1523:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1525
;1524:		
;1525:	UI_Free(s_sandboxmain.list.string);
ADDRGP4 s_sandboxmain+8724+112
INDIRP4
ARGP4
ADDRGP4 UI_Free
CALLI4
pop
line 1527
;1526:		
;1527:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1528
;1528:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1529
;1529:	s_sandboxmain.list.styles			= 2;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 2
ASGNI4
line 1530
;1530:	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
ADDRGP4 s_sandboxmain+8724+436
CNSTF4 1071644672
ADDRGP4 uis+11476
INDIRI4
CVIF4 4
MULF4
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 7
SUBI4
CVIF4 4
DIVF4
CNSTF4 1086324736
ADDF4
CVFI4 4
ASGNI4
line 1531
;1531:	s_sandboxmain.list.string 			= (char *)UI_Alloc(256);
CNSTI4 256
ARGI4
ADDRLP4 1060
ADDRGP4 UI_Alloc
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+112
ADDRLP4 1060
INDIRI4
CVIU4 4
CVUP4 4
ASGNP4
line 1532
;1532:	s_sandboxmain.list.fontsize			= 0.4;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1053609165
ASGNF4
line 1533
;1533:	s_sandboxmain.list.corner			= 65;
ADDRGP4 s_sandboxmain+8724+132
CNSTI4 65
ASGNI4
line 1534
;1534:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1535
;1535:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1536
;1536:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1537
;1537:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1538
;1538:	s_sandboxmain.list.generic.y		= 62;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 62
ASGNI4
line 1539
;1539:	s_sandboxmain.list.width			= 39/6;
ADDRGP4 s_sandboxmain+8724+104
CNSTI4 6
ASGNI4
line 1540
;1540:	s_sandboxmain.list.height			= 4;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 4
ASGNI4
line 1541
;1541:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1542
;1542:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1545
;1543:	//y += 20;
;1544:	
;1545:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1546
;1546:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1547
;1547:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1548
;1548:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1549
;1549:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1550
;1550:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1552
;1551:	
;1552:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1553
;1553:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1554
;1554:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1555
;1555:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1556
;1556:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1557
;1557:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1559
;1558:	
;1559:	s_sandboxmain.propstext.string  				= "Items:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2708
ASGNP4
line 1560
;1560:	s_sandboxmain.classtext.string  				= "Lists:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2927
ASGNP4
line 1561
;1561:	s_sandboxmain.spawnobject.string           		= "Create";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $1910
ASGNP4
line 1562
;1562:	}
LABELV $2819
line 1563
;1563:	if(uis.sb_tab == 7){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 7
NEI4 $2930
line 1564
;1564:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1565
;1565:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1566
;1566:	s_sandboxmain.list.styles			= 0;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 0
ASGNI4
line 1567
;1567:	s_sandboxmain.list.fontsize			= 1;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1065353216
ASGNF4
line 1568
;1568:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1569
;1569:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1570
;1570:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1571
;1571:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1572
;1572:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1573
;1573:	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+8724+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1574
;1574:	s_sandboxmain.list.height			= 15+18;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 33
ASGNI4
line 1575
;1575:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "dscripts", "as", s_sandboxmain.names, 524288 );
ADDRGP4 $2959
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1052
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 1576
;1576:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1577
;1577:	s_sandboxmain.list.columns			= 1;
ADDRGP4 s_sandboxmain+8724+436
CNSTI4 1
ASGNI4
line 1578
;1578:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1580
;1579:	
;1580:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1581
;1581:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1582
;1582:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1583
;1583:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1584
;1584:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1585
;1585:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1586
;1586:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1587
;1587:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1588
;1588:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1589
;1589:	s_sandboxmain.classlist.width			= 28;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 28
ASGNI4
line 1590
;1590:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1591
;1591:	s_sandboxmain.classlist.numitems		= 118;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 118
ASGNI4
line 1592
;1592:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3681356
ASGNP4
line 1593
;1593:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1594
;1594:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1597
;1595:	//y += 20;
;1596:	
;1597:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1598
;1598:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1599
;1599:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1600
;1600:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1601
;1601:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1602
;1602:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1604
;1603:	
;1604:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1605
;1605:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1606
;1606:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1607
;1607:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1608
;1608:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1609
;1609:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1611
;1610:	
;1611:	s_sandboxmain.propstext.string  				= "Scripts:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $3025
ASGNP4
line 1612
;1612:	s_sandboxmain.classtext.string  				= "Class:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2602
ASGNP4
line 1613
;1613:	s_sandboxmain.spawnobject.string          		= "Execute";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $3030
ASGNP4
line 1614
;1614:	}
LABELV $2930
line 1615
;1615:	if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $3031
line 1616
;1616:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1617
;1617:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1618
;1618:	s_sandboxmain.list.styles			= 0;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 0
ASGNI4
line 1619
;1619:	s_sandboxmain.list.fontsize			= 1;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1065353216
ASGNF4
line 1620
;1620:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1621
;1621:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1622
;1622:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1623
;1623:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1624
;1624:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1625
;1625:	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+8724+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1626
;1626:	s_sandboxmain.list.height			= 15+18;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 33
ASGNI4
line 1627
;1627:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "tools", "as", s_sandboxmain.names, 524288 );
ADDRGP4 $3060
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1052
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 1628
;1628:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1629
;1629:	s_sandboxmain.list.columns			= 1;
ADDRGP4 s_sandboxmain+8724+436
CNSTI4 1
ASGNI4
line 1630
;1630:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1632
;1631:	
;1632:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1633
;1633:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1634
;1634:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1635
;1635:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1636
;1636:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1637
;1637:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1638
;1638:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1639
;1639:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1640
;1640:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1641
;1641:	s_sandboxmain.classlist.width			= 28;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 28
ASGNI4
line 1642
;1642:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1643
;1643:	s_sandboxmain.classlist.numitems		= 118;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 118
ASGNI4
line 1644
;1644:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3681356
ASGNP4
line 1645
;1645:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1646
;1646:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1649
;1647:	//y += 20;
;1648:	
;1649:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1650
;1650:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1651
;1651:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1652
;1652:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1653
;1653:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1654
;1654:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1656
;1655:	
;1656:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1657
;1657:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1658
;1658:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1659
;1659:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1660
;1660:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1661
;1661:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1663
;1662:	
;1663:	s_sandboxmain.propstext.string  				= "Tools:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $3126
ASGNP4
line 1664
;1664:	s_sandboxmain.classtext.string  				= "Class:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2602
ASGNP4
line 1665
;1665:	s_sandboxmain.spawnobject.string          		= "Bind";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $3131
ASGNP4
line 1666
;1666:	}
LABELV $3031
line 1667
;1667:	if(uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $3132
line 1668
;1668:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1669
;1669:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1670
;1670:	s_sandboxmain.list.styles			= 0;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 0
ASGNI4
line 1671
;1671:	s_sandboxmain.list.fontsize			= 1;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1065353216
ASGNF4
line 1672
;1672:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1673
;1673:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1674
;1674:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1675
;1675:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1676
;1676:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1677
;1677:	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+8724+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1678
;1678:	s_sandboxmain.list.height			= 15+18;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 33
ASGNI4
line 1679
;1679:	s_sandboxmain.list.numitems			= 338;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 338
ASGNI4
line 1680
;1680:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.cvar_itemslist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+4205644
ASGNP4
line 1681
;1681:	s_sandboxmain.list.columns			= 1;
ADDRGP4 s_sandboxmain+8724+436
CNSTI4 1
ASGNI4
line 1682
;1682:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1684
;1683:	
;1684:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1685
;1685:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1686
;1686:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1687
;1687:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1688
;1688:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1689
;1689:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1690
;1690:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1691
;1691:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1692
;1692:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1693
;1693:	s_sandboxmain.classlist.width			= 28;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 28
ASGNI4
line 1694
;1694:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1695
;1695:	s_sandboxmain.classlist.numitems		= 118;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 118
ASGNI4
line 1696
;1696:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3157068
ASGNP4
line 1697
;1697:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1698
;1698:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1701
;1699:	//y += 20;
;1700:	
;1701:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1702
;1702:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1703
;1703:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1704
;1704:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1705
;1705:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1706
;1706:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1708
;1707:	
;1708:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1709
;1709:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1710
;1710:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1711
;1711:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1712
;1712:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1713
;1713:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1715
;1714:	
;1715:	s_sandboxmain.propstext.string  				= "Settings:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $2807
ASGNP4
line 1716
;1716:	s_sandboxmain.classtext.string  				= "Class:";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $2602
ASGNP4
line 1717
;1717:	s_sandboxmain.spawnobject.string           		= "Apply";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $2812
ASGNP4
line 1718
;1718:	}
LABELV $3132
line 1719
;1719:	if(uis.sb_tab == 10){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 10
NEI4 $3229
line 1720
;1720:	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+8724
CNSTI4 11
ASGNI4
line 1721
;1721:	s_sandboxmain.list.type				= 5;
ADDRGP4 s_sandboxmain+8724+96
CNSTI4 5
ASGNI4
line 1722
;1722:	s_sandboxmain.list.styles			= 1;
ADDRGP4 s_sandboxmain+8724+120
CNSTI4 1
ASGNI4
line 1723
;1723:	s_sandboxmain.list.fontsize			= 1;
ADDRGP4 s_sandboxmain+8724+136
CNSTF4 1065353216
ASGNF4
line 1724
;1724:	s_sandboxmain.list.string			= "mgui/icons";
ADDRGP4 s_sandboxmain+8724+112
ADDRGP4 $3241
ASGNP4
line 1725
;1725:	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+8724+72
CNSTU4 256
ASGNU4
line 1726
;1726:	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+8724+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1727
;1727:	s_sandboxmain.list.generic.id		= ID_LIST;
ADDRGP4 s_sandboxmain+8724+24
CNSTI4 100
ASGNI4
line 1728
;1728:	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+8724+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1729
;1729:	s_sandboxmain.list.generic.y		= 70;
ADDRGP4 s_sandboxmain+8724+32
CNSTI4 70
ASGNI4
line 1730
;1730:	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
ADDRGP4 s_sandboxmain+8724+104
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
DIVI4
CNSTI4 39
ADDI4
ASGNI4
line 1731
;1731:	s_sandboxmain.list.height			= 15+18;
ADDRGP4 s_sandboxmain+8724+108
CNSTI4 33
ASGNI4
line 1732
;1732:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "mgui", "as", s_sandboxmain.names, 524288 );
ADDRGP4 $3261
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1052
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1052
INDIRI4
ASGNI4
line 1733
;1733:	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
ADDRGP4 s_sandboxmain+8724+428
ADDRGP4 s_sandboxmain+1059916
ASGNP4
line 1734
;1734:	s_sandboxmain.list.columns			= 1;
ADDRGP4 s_sandboxmain+8724+436
CNSTI4 1
ASGNI4
line 1735
;1735:	s_sandboxmain.list.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+8724+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1737
;1736:	
;1737:	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_sandboxmain+9180
CNSTI4 11
ASGNI4
line 1738
;1738:	s_sandboxmain.classlist.type				= 5;
ADDRGP4 s_sandboxmain+9180+96
CNSTI4 5
ASGNI4
line 1739
;1739:	s_sandboxmain.classlist.styles				= 1;
ADDRGP4 s_sandboxmain+9180+120
CNSTI4 1
ASGNI4
line 1740
;1740:	s_sandboxmain.classlist.fontsize			= 1;
ADDRGP4 s_sandboxmain+9180+136
CNSTF4 1065353216
ASGNF4
line 1741
;1741:	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_sandboxmain+9180+72
CNSTU4 256
ASGNU4
line 1742
;1742:	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
ADDRGP4 s_sandboxmain+9180+76
ADDRGP4 SandboxMain_MenuEvent
ASGNP4
line 1743
;1743:	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
ADDRGP4 s_sandboxmain+9180+24
CNSTI4 101
ASGNI4
line 1744
;1744:	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+9180+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1745
;1745:	s_sandboxmain.classlist.generic.y		= 215 + 70;
ADDRGP4 s_sandboxmain+9180+32
CNSTI4 285
ASGNI4
line 1746
;1746:	s_sandboxmain.classlist.width			= 28;
ADDRGP4 s_sandboxmain+9180+104
CNSTI4 28
ASGNI4
line 1747
;1747:	s_sandboxmain.classlist.height			= 15;
ADDRGP4 s_sandboxmain+9180+108
CNSTI4 15
ASGNI4
line 1748
;1748:	s_sandboxmain.classlist.numitems		= 118;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 118
ASGNI4
line 1749
;1749:	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
ADDRGP4 s_sandboxmain+9180+428
ADDRGP4 s_sandboxmain+3681356
ASGNP4
line 1750
;1750:	s_sandboxmain.classlist.columns			= 1;
ADDRGP4 s_sandboxmain+9180+436
CNSTI4 1
ASGNI4
line 1751
;1751:	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+9180+124
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1754
;1752:	//y += 20;
;1753:	
;1754:	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+1964
CNSTI4 9
ASGNI4
line 1755
;1755:	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+1964+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1756
;1756:	s_sandboxmain.propstext.generic.y				= 48;
ADDRGP4 s_sandboxmain+1964+32
CNSTI4 48
ASGNI4
line 1757
;1757:	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+1964+72
CNSTU4 16384
ASGNU4
line 1758
;1758:	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+1964+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1759
;1759:	s_sandboxmain.propstext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+1964+92
CNSTI4 32
ASGNI4
line 1761
;1760:	
;1761:	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_sandboxmain+2068
CNSTI4 9
ASGNI4
line 1762
;1762:	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
ADDRGP4 s_sandboxmain+2068+28
CNSTI4 40
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1763
;1763:	s_sandboxmain.classtext.generic.y				= 215 + 48;
ADDRGP4 s_sandboxmain+2068+32
CNSTI4 263
ASGNI4
line 1764
;1764:	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_sandboxmain+2068+72
CNSTU4 16384
ASGNU4
line 1765
;1765:	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
ADDRGP4 s_sandboxmain+2068+100
ADDRGP4 s_sandboxmain_color1
ASGNP4
line 1766
;1766:	s_sandboxmain.classtext.style  					= UI_BIGFONT;
ADDRGP4 s_sandboxmain+2068+92
CNSTI4 32
ASGNI4
line 1768
;1767:	
;1768:	s_sandboxmain.propstext.string  				= "Addons:";
ADDRGP4 s_sandboxmain+1964+88
ADDRGP4 $3327
ASGNP4
line 1769
;1769:	s_sandboxmain.classtext.string  				= "";
ADDRGP4 s_sandboxmain+2068+88
ADDRGP4 $491
ASGNP4
line 1770
;1770:	s_sandboxmain.spawnobject.string           		= "Open";
ADDRGP4 s_sandboxmain+1192+88
ADDRGP4 $3332
ASGNP4
line 1771
;1771:	}
LABELV $3229
line 1773
;1772:
;1773:	y = 480+240;
ADDRLP4 12
CNSTI4 720
ASGNI4
line 1775
;1774:
;1775:if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $3333
line 1776
;1776:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3336
line 1777
;1777:		strcpy(s_sandboxmain.names,"No models");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $3341
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1778
;1778:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1779
;1779:	}
ADDRGP4 $3337
JUMPV
LABELV $3336
line 1780
;1780:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3344
line 1781
;1781:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $3344
LABELV $3337
line 1783
;1782:
;1783:	configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1784
;1784:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3354
JUMPV
LABELV $3351
line 1785
;1785:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1788
;1786:
;1787:		// strip extension
;1788:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
line 1789
;1789:		if (!Q_stricmp(configname +  len - 4,".md3"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $3361
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3359
line 1790
;1790:			configname[len-4] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3359
line 1794
;1791:
;1792:		//Q_strupr(configname);
;1793:
;1794:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1795
;1795:	}
LABELV $3352
line 1784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3354
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3351
line 1797
;1796:	
;1797:	s_sandboxmain.texturelist.string			= sb_texture.string;
ADDRGP4 s_sandboxmain+9636+112
ADDRGP4 sb_texture+16
ASGNP4
line 1798
;1798:	s_sandboxmain.texturelist.numitems			= trap_FS_GetFileList( va("ptex/%s", s_sandboxmain.list.itemnames[uis.texturelist_folder]), "png", s_sandboxmain.names2, 524288 );
ADDRGP4 $3367
ARGP4
ADDRGP4 uis+11488
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 $3371
ARGP4
ADDRGP4 s_sandboxmain+535628
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1056
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+9636+420
ADDRLP4 1056
INDIRI4
ASGNI4
line 1800
;1799:	
;1800:	if (!s_sandboxmain.texturelist.numitems) {
ADDRGP4 s_sandboxmain+9636+420
INDIRI4
CNSTI4 0
NEI4 $3373
line 1801
;1801:		strcpy(s_sandboxmain.names2,"0");
ADDRGP4 s_sandboxmain+535628
ARGP4
ADDRGP4 $502
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1802
;1802:		s_sandboxmain.texturelist.numitems = 1;
ADDRGP4 s_sandboxmain+9636+420
CNSTI4 1
ASGNI4
line 1803
;1803:	}
ADDRGP4 $3374
JUMPV
LABELV $3373
line 1804
;1804:	else if (s_sandboxmain.texturelist.numitems > 65536)
ADDRGP4 s_sandboxmain+9636+420
INDIRI4
CNSTI4 65536
LEI4 $3380
line 1805
;1805:		s_sandboxmain.texturelist.numitems = 65536;
ADDRGP4 s_sandboxmain+9636+420
CNSTI4 65536
ASGNI4
LABELV $3380
LABELV $3374
line 1807
;1806:
;1807:	configname = s_sandboxmain.names2;
ADDRLP4 4
ADDRGP4 s_sandboxmain+535628
ASGNP4
line 1808
;1808:	for ( i = 0; i < s_sandboxmain.texturelist.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3390
JUMPV
LABELV $3387
line 1809
;1809:		s_sandboxmain.texturelist.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9636+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1812
;1810:
;1811:		// strip extension
;1812:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1060
INDIRI4
ASGNI4
line 1813
;1813:		if (!Q_stricmp(configname +  len - 4,".png"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $3397
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $3395
line 1814
;1814:			configname[len-4] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3395
line 1818
;1815:
;1816:		//Q_strupr(configname);
;1817:
;1818:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1819
;1819:	}
LABELV $3388
line 1808
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3390
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+9636+420
INDIRI4
LTI4 $3387
line 1820
;1820:}
LABELV $3333
line 1821
;1821:if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $3398
line 1822
;1822:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3401
line 1823
;1823:		strcpy(s_sandboxmain.names,"No entities");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $3406
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1824
;1824:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1825
;1825:	}
ADDRGP4 $3402
JUMPV
LABELV $3401
line 1826
;1826:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3409
line 1827
;1827:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $3409
LABELV $3402
line 1829
;1828:
;1829:	configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1830
;1830:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3419
JUMPV
LABELV $3416
line 1831
;1831:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1834
;1832:
;1833:		// strip extension
;1834:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
line 1835
;1835:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3424
line 1836
;1836:			configname[len-3] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3424
line 1840
;1837:
;1838:		//Q_strupr(configname);
;1839:
;1840:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1841
;1841:	}
LABELV $3417
line 1830
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3419
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3416
line 1842
;1842:}
LABELV $3398
line 1843
;1843:if (uis.sb_tab == 3) {
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $3426
line 1844
;1844:    if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3429
line 1845
;1845:        strcpy(s_sandboxmain.names, "No NPC");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $3434
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1846
;1846:        s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1847
;1847:    } else if (s_sandboxmain.list.numitems > 65536) {
ADDRGP4 $3430
JUMPV
LABELV $3429
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3437
line 1848
;1848:        s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
line 1849
;1849:    }
LABELV $3437
LABELV $3430
line 1851
;1850:
;1851:    configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1853
;1852:    
;1853:    for (i = 0; i < s_sandboxmain.list.numitems; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3447
JUMPV
LABELV $3444
line 1855
;1854:        // Получение имени из информации о боте
;1855:        bot_name = Info_ValueForKey(UI_GetBotInfoByNumber(i), "name");
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 $3450
ARGP4
ADDRLP4 1056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1056
INDIRP4
ASGNP4
line 1858
;1856:
;1857:        // Проверка длины строки, чтобы избежать переполнения буфера
;1858:        name_length = strlen(bot_name);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 1060
INDIRI4
ASGNI4
line 1861
;1859:
;1860:        // Копирование имени в массив имен
;1861:        strcpy(configname, bot_name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1864
;1862:
;1863:        // Установка имени в массив itemnames
;1864:        s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1867
;1865:
;1866:        // Переход к следующему элементу
;1867:        configname += name_length + 1;
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1868
;1868:    }
LABELV $3445
line 1853
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3447
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3444
line 1869
;1869:}
LABELV $3426
line 1871
;1870:
;1871:if(uis.sb_tab == 6){	
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $3453
line 1872
;1872:	if (!s_sandboxmain.classlist.numitems) {
ADDRGP4 s_sandboxmain+9180+420
INDIRI4
CNSTI4 0
NEI4 $3456
line 1873
;1873:		strcpy(s_sandboxmain.names2,"No lists");
ADDRGP4 s_sandboxmain+535628
ARGP4
ADDRGP4 $3461
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1874
;1874:		s_sandboxmain.classlist.numitems = 1;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 1
ASGNI4
line 1875
;1875:	}
ADDRGP4 $3457
JUMPV
LABELV $3456
line 1876
;1876:	else if (s_sandboxmain.classlist.numitems > 65536)
ADDRGP4 s_sandboxmain+9180+420
INDIRI4
CNSTI4 65536
LEI4 $3464
line 1877
;1877:		s_sandboxmain.classlist.numitems = 65536;
ADDRGP4 s_sandboxmain+9180+420
CNSTI4 65536
ASGNI4
LABELV $3464
LABELV $3457
line 1879
;1878:
;1879:	configname = s_sandboxmain.names2;
ADDRLP4 4
ADDRGP4 s_sandboxmain+535628
ASGNP4
line 1880
;1880:	for ( i = 0; i < s_sandboxmain.classlist.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3474
JUMPV
LABELV $3471
line 1881
;1881:		s_sandboxmain.classlist.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1884
;1882:
;1883:		// strip extension
;1884:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
line 1885
;1885:		if (!Q_stricmp(configname +  len - 4,".cfg"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $3481
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3479
line 1886
;1886:			configname[len-4] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3479
line 1890
;1887:
;1888:		//Q_strupr(configname);
;1889:
;1890:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1891
;1891:	}
LABELV $3472
line 1880
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3474
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+9180+420
INDIRI4
LTI4 $3471
line 1893
;1892:	
;1893:	s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("spawnlists/%s", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]), "as", s_sandboxmain.names, 524288 );
ADDRGP4 $1120
ARGP4
ADDRGP4 uis+11484
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 s_sandboxmain+11340
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 1056
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_sandboxmain+8724+420
ADDRLP4 1056
INDIRI4
ASGNI4
line 1895
;1894:	
;1895:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3488
line 1896
;1896:		strcpy(s_sandboxmain.names,"No items");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $1131
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1897
;1897:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1898
;1898:	}
ADDRGP4 $3489
JUMPV
LABELV $3488
line 1899
;1899:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3495
line 1900
;1900:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $3495
LABELV $3489
line 1902
;1901:
;1902:	configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1903
;1903:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3505
JUMPV
LABELV $3502
line 1904
;1904:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1907
;1905:
;1906:		// strip extension
;1907:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1060
INDIRI4
ASGNI4
line 1908
;1908:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $3510
line 1909
;1909:			configname[len-3] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3510
line 1913
;1910:
;1911:		//Q_strupr(configname);
;1912:
;1913:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1914
;1914:	}
LABELV $3503
line 1903
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3505
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3502
line 1916
;1915:	
;1916:	strcpy(s_sandboxmain.list.string, va("spawnlists/%s/icons", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]));
ADDRGP4 $1154
ARGP4
ADDRGP4 uis+11484
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+8724+112
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1917
;1917:}
LABELV $3453
line 1918
;1918:if(uis.sb_tab == 7){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 7
NEI4 $3517
line 1919
;1919:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3520
line 1920
;1920:		strcpy(s_sandboxmain.names,"No scripts");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $3525
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1921
;1921:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1922
;1922:	}
ADDRGP4 $3521
JUMPV
LABELV $3520
line 1923
;1923:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3528
line 1924
;1924:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $3528
LABELV $3521
line 1926
;1925:
;1926:	configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1927
;1927:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3538
JUMPV
LABELV $3535
line 1928
;1928:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1931
;1929:
;1930:		// strip extension
;1931:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
line 1932
;1932:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3543
line 1933
;1933:			configname[len-3] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3543
line 1937
;1934:
;1935:		//Q_strupr(configname);
;1936:
;1937:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1938
;1938:	}
LABELV $3536
line 1927
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3538
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3535
line 1939
;1939:}
LABELV $3517
line 1940
;1940:if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $3545
line 1941
;1941:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3548
line 1942
;1942:		strcpy(s_sandboxmain.names,"No tools");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $3553
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1943
;1943:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1944
;1944:	}
ADDRGP4 $3549
JUMPV
LABELV $3548
line 1945
;1945:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3556
line 1946
;1946:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $3556
LABELV $3549
line 1948
;1947:
;1948:	configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1949
;1949:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3566
JUMPV
LABELV $3563
line 1950
;1950:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1953
;1951:
;1952:		// strip extension
;1953:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
line 1954
;1954:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3571
line 1955
;1955:			configname[len-3] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3571
line 1959
;1956:
;1957:		//Q_strupr(configname);
;1958:
;1959:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1960
;1960:	}
LABELV $3564
line 1949
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3566
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3563
line 1961
;1961:}
LABELV $3545
line 1962
;1962:if(uis.sb_tab == 10){	
ADDRGP4 uis+11472
INDIRI4
CNSTI4 10
NEI4 $3573
line 1963
;1963:	if (!s_sandboxmain.list.numitems) {
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 0
NEI4 $3576
line 1964
;1964:		strcpy(s_sandboxmain.names,"No addons");
ADDRGP4 s_sandboxmain+11340
ARGP4
ADDRGP4 $3581
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1965
;1965:		s_sandboxmain.list.numitems = 1;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 1
ASGNI4
line 1966
;1966:	}
ADDRGP4 $3577
JUMPV
LABELV $3576
line 1967
;1967:	else if (s_sandboxmain.list.numitems > 65536)
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
CNSTI4 65536
LEI4 $3584
line 1968
;1968:		s_sandboxmain.list.numitems = 65536;
ADDRGP4 s_sandboxmain+8724+420
CNSTI4 65536
ASGNI4
LABELV $3584
LABELV $3577
line 1970
;1969:
;1970:	configname = s_sandboxmain.names;
ADDRLP4 4
ADDRGP4 s_sandboxmain+11340
ASGNP4
line 1971
;1971:	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3594
JUMPV
LABELV $3591
line 1972
;1972:		s_sandboxmain.list.itemnames[i] = configname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1975
;1973:
;1974:		// strip extension
;1975:		len = strlen( configname );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
line 1976
;1976:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1151
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $3599
line 1977
;1977:			configname[len-3] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $3599
line 1981
;1978:
;1979:		//Q_strupr(configname);
;1980:
;1981:		configname += len + 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 1982
;1982:	}
LABELV $3592
line 1971
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3594
ADDRLP4 0
INDIRI4
ADDRGP4 s_sandboxmain+8724+420
INDIRI4
LTI4 $3591
line 1983
;1983:}
LABELV $3573
line 1985
;1984:
;1985:	if(uis.sb_tab == 4){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 4
NEI4 $3601
line 1986
;1986:	for (i = 0; i < 54; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3604
line 1987
;1987:	s_sandboxmain.list.itemnames[i] = item_items[i];
ADDRLP4 1052
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 1052
INDIRI4
ADDRGP4 item_items
ADDP4
INDIRP4
ASGNP4
line 1988
;1988:	}
LABELV $3605
line 1986
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 54
LTI4 $3604
line 1989
;1989:	}
LABELV $3601
line 1990
;1990:	if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $3610
line 1991
;1991:	for (i = 0; i < 8; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3613
line 1992
;1992:	s_sandboxmain.list.itemnames[i] = admcvar_items[i];
ADDRLP4 1052
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 1052
INDIRI4
ADDRGP4 admcvar_items
ADDP4
INDIRP4
ASGNP4
line 1993
;1993:	}
LABELV $3614
line 1991
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $3613
line 1994
;1994:	}
LABELV $3610
line 1995
;1995:	if(uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $3619
line 1996
;1996:	for (i = 0; i < 338; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3622
line 1997
;1997:	s_sandboxmain.list.itemnames[i] = cvar_items[i];
ADDRLP4 1052
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
ADDRLP4 1052
INDIRI4
ADDRGP4 cvar_items
ADDP4
INDIRP4
ASGNP4
line 1998
;1998:	}
LABELV $3623
line 1996
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 338
LTI4 $3622
line 1999
;1999:	}
LABELV $3619
line 2000
;2000:	if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $3628
line 2001
;2001:	s_sandboxmain.classlist.itemnames[0] = "none";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDRGP4 $523
ASGNP4
line 2002
;2002:	s_sandboxmain.classlist.itemnames[1] = "weapon_machinegun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $3635
ASGNP4
line 2003
;2003:	s_sandboxmain.classlist.itemnames[2] = "weapon_shotgun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $3638
ASGNP4
line 2004
;2004:	s_sandboxmain.classlist.itemnames[3] = "weapon_grenadelauncher";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 $3641
ASGNP4
line 2005
;2005:	s_sandboxmain.classlist.itemnames[4] = "weapon_rocketlauncher";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 $3644
ASGNP4
line 2006
;2006:	s_sandboxmain.classlist.itemnames[5] = "weapon_lightning";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 $3647
ASGNP4
line 2007
;2007:	s_sandboxmain.classlist.itemnames[6] = "weapon_railgun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 $3650
ASGNP4
line 2008
;2008:	s_sandboxmain.classlist.itemnames[7] = "weapon_plasmagun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 28
ADDP4
ADDRGP4 $3653
ASGNP4
line 2009
;2009:	s_sandboxmain.classlist.itemnames[8] = "weapon_bfg";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 $3656
ASGNP4
line 2010
;2010:	s_sandboxmain.classlist.itemnames[9] = "weapon_grapplinghook";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 $3659
ASGNP4
line 2011
;2011:	s_sandboxmain.classlist.itemnames[10] = "weapon_nailgun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 $3662
ASGNP4
line 2012
;2012:	s_sandboxmain.classlist.itemnames[11] = "weapon_prox_launcher";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 44
ADDP4
ADDRGP4 $3665
ASGNP4
line 2013
;2013:	s_sandboxmain.classlist.itemnames[12] = "weapon_chaingun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 $3668
ASGNP4
line 2014
;2014:	s_sandboxmain.classlist.itemnames[13] = "weapon_flamethrower";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 $3671
ASGNP4
line 2015
;2015:	s_sandboxmain.classlist.itemnames[14] = "weapon_antimatter";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 56
ADDP4
ADDRGP4 $3674
ASGNP4
line 2016
;2016:	s_sandboxmain.classlist.itemnames[15] = "ammo_bullets";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 $3677
ASGNP4
line 2017
;2017:	s_sandboxmain.classlist.itemnames[16] = "ammo_shells";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 $3680
ASGNP4
line 2018
;2018:	s_sandboxmain.classlist.itemnames[17] = "ammo_grenades";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 $3683
ASGNP4
line 2019
;2019:	s_sandboxmain.classlist.itemnames[18] = "ammo_cells";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 72
ADDP4
ADDRGP4 $3686
ASGNP4
line 2020
;2020:	s_sandboxmain.classlist.itemnames[19] = "ammo_lightning";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 $3689
ASGNP4
line 2021
;2021:	s_sandboxmain.classlist.itemnames[20] = "ammo_rockets";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 80
ADDP4
ADDRGP4 $3692
ASGNP4
line 2022
;2022:	s_sandboxmain.classlist.itemnames[21] = "ammo_slugs";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 $3695
ASGNP4
line 2023
;2023:	s_sandboxmain.classlist.itemnames[22] = "ammo_bfg";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $3698
ASGNP4
line 2024
;2024:	s_sandboxmain.classlist.itemnames[23] = "ammo_nails";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 $3701
ASGNP4
line 2025
;2025:	s_sandboxmain.classlist.itemnames[24] = "ammo_mines";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 96
ADDP4
ADDRGP4 $3704
ASGNP4
line 2026
;2026:	s_sandboxmain.classlist.itemnames[25] = "ammo_belt";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 100
ADDP4
ADDRGP4 $3707
ASGNP4
line 2027
;2027:	s_sandboxmain.classlist.itemnames[26] = "ammo_flame";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 $3710
ASGNP4
line 2028
;2028:	s_sandboxmain.classlist.itemnames[27] = "item_armor_shard";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 $3713
ASGNP4
line 2029
;2029:	s_sandboxmain.classlist.itemnames[28] = "item_armor_combat";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 $3716
ASGNP4
line 2030
;2030:	s_sandboxmain.classlist.itemnames[29] = "item_armor_body";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 116
ADDP4
ADDRGP4 $3719
ASGNP4
line 2031
;2031:	s_sandboxmain.classlist.itemnames[30] = "item_armor_full";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 120
ADDP4
ADDRGP4 $3722
ASGNP4
line 2032
;2032:	s_sandboxmain.classlist.itemnames[31] = "item_armor_vest";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 124
ADDP4
ADDRGP4 $3725
ASGNP4
line 2033
;2033:	s_sandboxmain.classlist.itemnames[32] = "item_health_small";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 128
ADDP4
ADDRGP4 $3728
ASGNP4
line 2034
;2034:	s_sandboxmain.classlist.itemnames[33] = "item_health";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 132
ADDP4
ADDRGP4 $3731
ASGNP4
line 2035
;2035:	s_sandboxmain.classlist.itemnames[34] = "item_health_large";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 $3734
ASGNP4
line 2036
;2036:	s_sandboxmain.classlist.itemnames[35] = "item_health_mega";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 140
ADDP4
ADDRGP4 $3737
ASGNP4
line 2037
;2037:	s_sandboxmain.classlist.itemnames[36] = "item_quad";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 $3740
ASGNP4
line 2038
;2038:	s_sandboxmain.classlist.itemnames[37] = "item_enviro";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 148
ADDP4
ADDRGP4 $3743
ASGNP4
line 2039
;2039:	s_sandboxmain.classlist.itemnames[38] = "item_haste";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 $3746
ASGNP4
line 2040
;2040:	s_sandboxmain.classlist.itemnames[39] = "item_invis";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 156
ADDP4
ADDRGP4 $3749
ASGNP4
line 2041
;2041:	s_sandboxmain.classlist.itemnames[40] = "item_regen";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 160
ADDP4
ADDRGP4 $3752
ASGNP4
line 2042
;2042:	s_sandboxmain.classlist.itemnames[41] = "item_flight";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 164
ADDP4
ADDRGP4 $3755
ASGNP4
line 2043
;2043:	s_sandboxmain.classlist.itemnames[42] = "item_scout";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 168
ADDP4
ADDRGP4 $3758
ASGNP4
line 2044
;2044:	s_sandboxmain.classlist.itemnames[43] = "item_doubler";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 $3761
ASGNP4
line 2045
;2045:	s_sandboxmain.classlist.itemnames[44] = "item_ammoregen";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 176
ADDP4
ADDRGP4 $3764
ASGNP4
line 2046
;2046:	s_sandboxmain.classlist.itemnames[45] = "item_guard";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 180
ADDP4
ADDRGP4 $3767
ASGNP4
line 2047
;2047:	s_sandboxmain.classlist.itemnames[46] = "holdable_teleporter";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 184
ADDP4
ADDRGP4 $3770
ASGNP4
line 2048
;2048:	s_sandboxmain.classlist.itemnames[47] = "holdable_medkit";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 188
ADDP4
ADDRGP4 $3773
ASGNP4
line 2049
;2049:	s_sandboxmain.classlist.itemnames[48] = "holdable_kamikaze";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 192
ADDP4
ADDRGP4 $3776
ASGNP4
line 2050
;2050:	s_sandboxmain.classlist.itemnames[49] = "holdable_invulnerability";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 196
ADDP4
ADDRGP4 $3779
ASGNP4
line 2051
;2051:	s_sandboxmain.classlist.itemnames[50] = "holdable_portal";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 $3782
ASGNP4
line 2052
;2052:	s_sandboxmain.classlist.itemnames[51] = "info_player_deathmatch";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 204
ADDP4
ADDRGP4 $3785
ASGNP4
line 2053
;2053:	s_sandboxmain.classlist.itemnames[52] = "team_CTF_redspawn";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 208
ADDP4
ADDRGP4 $3788
ASGNP4
line 2054
;2054:	s_sandboxmain.classlist.itemnames[53] = "team_CTF_bluespawn";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 212
ADDP4
ADDRGP4 $3791
ASGNP4
line 2055
;2055:	s_sandboxmain.classlist.itemnames[54] = "team_redobelisk";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 216
ADDP4
ADDRGP4 $3794
ASGNP4
line 2056
;2056:	s_sandboxmain.classlist.itemnames[55] = "team_blueobelisk";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 220
ADDP4
ADDRGP4 $3797
ASGNP4
line 2057
;2057:	s_sandboxmain.classlist.itemnames[56] = "team_neutralobelisk";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 224
ADDP4
ADDRGP4 $3800
ASGNP4
line 2058
;2058:	s_sandboxmain.classlist.itemnames[57] = "team_CTF_neutralflag";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 228
ADDP4
ADDRGP4 $3803
ASGNP4
line 2059
;2059:	s_sandboxmain.classlist.itemnames[58] = "team_CTF_blueflag";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 232
ADDP4
ADDRGP4 $3806
ASGNP4
line 2060
;2060:	s_sandboxmain.classlist.itemnames[59] = "team_CTF_redflag";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 236
ADDP4
ADDRGP4 $3809
ASGNP4
line 2061
;2061:	s_sandboxmain.classlist.itemnames[60] = "team_CTF_redplayer";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 240
ADDP4
ADDRGP4 $3812
ASGNP4
line 2062
;2062:	s_sandboxmain.classlist.itemnames[61] = "team_CTF_blueplayer";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 244
ADDP4
ADDRGP4 $3815
ASGNP4
line 2063
;2063:	s_sandboxmain.classlist.itemnames[62] = "holdable_key_blue";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 248
ADDP4
ADDRGP4 $3818
ASGNP4
line 2064
;2064:	s_sandboxmain.classlist.itemnames[63] = "holdable_key_gold";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 252
ADDP4
ADDRGP4 $3821
ASGNP4
line 2065
;2065:	s_sandboxmain.classlist.itemnames[64] = "holdable_key_green";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 256
ADDP4
ADDRGP4 $3824
ASGNP4
line 2066
;2066:	s_sandboxmain.classlist.itemnames[65] = "holdable_key_iron";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 260
ADDP4
ADDRGP4 $3827
ASGNP4
line 2067
;2067:	s_sandboxmain.classlist.itemnames[66] = "holdable_key_master";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 264
ADDP4
ADDRGP4 $3830
ASGNP4
line 2068
;2068:	s_sandboxmain.classlist.itemnames[67] = "holdable_key_red";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 268
ADDP4
ADDRGP4 $3833
ASGNP4
line 2069
;2069:	s_sandboxmain.classlist.itemnames[68] = "holdable_key_silver";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 272
ADDP4
ADDRGP4 $3836
ASGNP4
line 2070
;2070:	s_sandboxmain.classlist.itemnames[69] = "holdable_key_yellow";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 276
ADDP4
ADDRGP4 $3839
ASGNP4
line 2071
;2071:	s_sandboxmain.classlist.itemnames[70] = "info_waypoint";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 280
ADDP4
ADDRGP4 $3842
ASGNP4
line 2072
;2072:	s_sandboxmain.classlist.itemnames[71] = "info_camera";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 284
ADDP4
ADDRGP4 $3845
ASGNP4
line 2073
;2073:	s_sandboxmain.classlist.itemnames[72] = "func_static";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 288
ADDP4
ADDRGP4 $3848
ASGNP4
line 2074
;2074:	s_sandboxmain.classlist.itemnames[73] = "trigger_multiple";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 292
ADDP4
ADDRGP4 $3851
ASGNP4
line 2075
;2075:	s_sandboxmain.classlist.itemnames[74] = "trigger_push";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 296
ADDP4
ADDRGP4 $3854
ASGNP4
line 2076
;2076:	s_sandboxmain.classlist.itemnames[75] = "trigger_hurt";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 300
ADDP4
ADDRGP4 $3857
ASGNP4
line 2077
;2077:	s_sandboxmain.classlist.itemnames[76] = "trigger_frag";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 304
ADDP4
ADDRGP4 $3860
ASGNP4
line 2078
;2078:	s_sandboxmain.classlist.itemnames[77] = "trigger_lock";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 308
ADDP4
ADDRGP4 $3863
ASGNP4
line 2079
;2079:	s_sandboxmain.classlist.itemnames[78] = "target_give";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 312
ADDP4
ADDRGP4 $3866
ASGNP4
line 2080
;2080:	s_sandboxmain.classlist.itemnames[79] = "target_remove_powerups";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 $3869
ASGNP4
line 2081
;2081:	s_sandboxmain.classlist.itemnames[80] = "target_delay";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 320
ADDP4
ADDRGP4 $3872
ASGNP4
line 2082
;2082:	s_sandboxmain.classlist.itemnames[81] = "target_print";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 324
ADDP4
ADDRGP4 $3875
ASGNP4
line 2083
;2083:	s_sandboxmain.classlist.itemnames[82] = "target_laser";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 $3878
ASGNP4
line 2084
;2084:	s_sandboxmain.classlist.itemnames[83] = "target_score";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 332
ADDP4
ADDRGP4 $3881
ASGNP4
line 2085
;2085:	s_sandboxmain.classlist.itemnames[84] = "target_clienttarg";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 336
ADDP4
ADDRGP4 $3884
ASGNP4
line 2086
;2086:	s_sandboxmain.classlist.itemnames[85] = "target_music";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 340
ADDP4
ADDRGP4 $3887
ASGNP4
line 2087
;2087:	s_sandboxmain.classlist.itemnames[86] = "target_sound";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 344
ADDP4
ADDRGP4 $3890
ASGNP4
line 2088
;2088:	s_sandboxmain.classlist.itemnames[87] = "target_model";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 348
ADDP4
ADDRGP4 $3893
ASGNP4
line 2089
;2089:	s_sandboxmain.classlist.itemnames[88] = "target_legs";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 352
ADDP4
ADDRGP4 $3896
ASGNP4
line 2090
;2090:	s_sandboxmain.classlist.itemnames[89] = "target_head";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 356
ADDP4
ADDRGP4 $3899
ASGNP4
line 2091
;2091:	s_sandboxmain.classlist.itemnames[90] = "target_teleporter";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 360
ADDP4
ADDRGP4 $3902
ASGNP4
line 2092
;2092:	s_sandboxmain.classlist.itemnames[91] = "target_relay";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 364
ADDP4
ADDRGP4 $3905
ASGNP4
line 2093
;2093:	s_sandboxmain.classlist.itemnames[92] = "target_kill";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 368
ADDP4
ADDRGP4 $3908
ASGNP4
line 2094
;2094:	s_sandboxmain.classlist.itemnames[93] = "target_position";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 372
ADDP4
ADDRGP4 $3911
ASGNP4
line 2095
;2095:	s_sandboxmain.classlist.itemnames[94] = "target_push";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 376
ADDP4
ADDRGP4 $3914
ASGNP4
line 2096
;2096:	s_sandboxmain.classlist.itemnames[95] = "target_logic";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 380
ADDP4
ADDRGP4 $3917
ASGNP4
line 2097
;2097:	s_sandboxmain.classlist.itemnames[96] = "target_gravity";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 384
ADDP4
ADDRGP4 $3920
ASGNP4
line 2098
;2098:	s_sandboxmain.classlist.itemnames[97] = "target_unlink";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 388
ADDP4
ADDRGP4 $3923
ASGNP4
line 2099
;2099:	s_sandboxmain.classlist.itemnames[98] = "target_debrisemitter";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 392
ADDP4
ADDRGP4 $3926
ASGNP4
line 2100
;2100:	s_sandboxmain.classlist.itemnames[99] = "target_earthquake";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 396
ADDP4
ADDRGP4 $3929
ASGNP4
line 2101
;2101:	s_sandboxmain.classlist.itemnames[100] = "target_effect";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 400
ADDP4
ADDRGP4 $3932
ASGNP4
line 2102
;2102:	s_sandboxmain.classlist.itemnames[101] = "target_modify";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 404
ADDP4
ADDRGP4 $3935
ASGNP4
line 2103
;2103:	s_sandboxmain.classlist.itemnames[102] = "target_playerstats";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 408
ADDP4
ADDRGP4 $3938
ASGNP4
line 2104
;2104:	s_sandboxmain.classlist.itemnames[103] = "target_variable";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 412
ADDP4
ADDRGP4 $3941
ASGNP4
line 2105
;2105:	s_sandboxmain.classlist.itemnames[104] = "target_cutscene";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $3944
ASGNP4
line 2106
;2106:	s_sandboxmain.classlist.itemnames[105] = "target_stats";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 420
ADDP4
ADDRGP4 $3947
ASGNP4
line 2107
;2107:	s_sandboxmain.classlist.itemnames[106] = "target_music";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 424
ADDP4
ADDRGP4 $3887
ASGNP4
line 2108
;2108:	s_sandboxmain.classlist.itemnames[107] = "misc_teleporter_dest";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 428
ADDP4
ADDRGP4 $3952
ASGNP4
line 2109
;2109:	s_sandboxmain.classlist.itemnames[108] = "shooter_rocket";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 432
ADDP4
ADDRGP4 $3955
ASGNP4
line 2110
;2110:	s_sandboxmain.classlist.itemnames[109] = "shooter_grenade";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 $3958
ASGNP4
line 2111
;2111:	s_sandboxmain.classlist.itemnames[110] = "shooter_plasma";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 440
ADDP4
ADDRGP4 $3961
ASGNP4
line 2112
;2112:	s_sandboxmain.classlist.itemnames[111] = "shooter_bfg";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 $3964
ASGNP4
line 2113
;2113:	s_sandboxmain.classlist.itemnames[112] = "shooter_prox";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 $3967
ASGNP4
line 2114
;2114:	s_sandboxmain.classlist.itemnames[113] = "shooter_flame";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 $3970
ASGNP4
line 2115
;2115:	s_sandboxmain.classlist.itemnames[114] = "shooter_antimatter";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 $3973
ASGNP4
line 2116
;2116:	s_sandboxmain.classlist.itemnames[115] = "shooter_custom";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 460
ADDP4
ADDRGP4 $3976
ASGNP4
line 2117
;2117:	s_sandboxmain.classlist.itemnames[116] = "weapon_toolgun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 464
ADDP4
ADDRGP4 $3979
ASGNP4
line 2118
;2118:	s_sandboxmain.classlist.itemnames[117] = "weapon_physgun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 468
ADDP4
ADDRGP4 $3982
ASGNP4
line 2119
;2119:	s_sandboxmain.classlist.itemnames[118] = "weapon_gravitygun";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 $3985
ASGNP4
line 2120
;2120:	}
LABELV $3628
line 2121
;2121:	if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $3986
line 2122
;2122:	s_sandboxmain.classlist.itemnames[0] = "NPC_Citizen";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
ADDRGP4 $3991
ASGNP4
line 2123
;2123:	s_sandboxmain.classlist.itemnames[1] = "NPC_Enemy";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $3994
ASGNP4
line 2124
;2124:	s_sandboxmain.classlist.itemnames[2] = "NPC_Guard";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $3997
ASGNP4
line 2125
;2125:	s_sandboxmain.classlist.itemnames[3] = "NPC_Partner";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 $4000
ASGNP4
line 2126
;2126:	s_sandboxmain.classlist.itemnames[4] = "NPC_PartnerEnemy";
ADDRGP4 s_sandboxmain+9180+428
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 $4003
ASGNP4
line 2127
;2127:	}
LABELV $3986
line 2129
;2128:	
;2129:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.close );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+11132
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2130
;2130:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab1 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10092
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2131
;2131:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab2 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10196
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2132
;2132:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab3 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10300
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2133
;2133:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab4 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10404
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2134
;2134:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab5 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10508
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2135
;2135:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab6 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10612
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2136
;2136:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab7 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10716
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2137
;2137:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab8 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10820
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2138
;2138:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab9 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+10924
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2139
;2139:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab10 );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+11028
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2140
;2140:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.spawnobject );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2141
;2141:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.priv );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2142
;2142:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.grid );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2143
;2143:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.savemap );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1756
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2144
;2144:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.loadmap );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1860
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2145
;2145:	if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $4020
line 2146
;2146:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2147
;2147:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+2068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2148
;2148:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2149
;2149:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.texturelist );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+9636
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2150
;2150:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.switchtab );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+11236
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2151
;2151:	}
LABELV $4020
line 2152
;2152:	if(uis.sb_tab == 2){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 2
NEI4 $4028
line 2153
;2153:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+2068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2154
;2154:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+9180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2155
;2155:	}
LABELV $4028
line 2156
;2156:	if(uis.sb_tab == 3){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 3
NEI4 $4033
line 2157
;2157:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2158
;2158:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+2068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2159
;2159:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2160
;2160:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+9180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2161
;2161:	}
LABELV $4033
line 2162
;2162:	if(uis.sb_tab == 4){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 4
NEI4 $4040
line 2163
;2163:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2164
;2164:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2165
;2165:	}
LABELV $4040
line 2166
;2166:	if(uis.sb_tab == 5){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 5
NEI4 $4045
line 2167
;2167:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2168
;2168:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2169
;2169:	}
LABELV $4045
line 2170
;2170:	if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $4050
line 2171
;2171:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2172
;2172:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+2068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2173
;2173:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2174
;2174:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+9180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2175
;2175:	}
LABELV $4050
line 2176
;2176:	if(uis.sb_tab == 7){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 7
NEI4 $4057
line 2177
;2177:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2178
;2178:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2179
;2179:	}
LABELV $4057
line 2180
;2180:	if(uis.sb_tab == 8){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 8
NEI4 $4062
line 2181
;2181:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2182
;2182:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2183
;2183:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.switchtab );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+11236
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2184
;2184:	}
LABELV $4062
line 2185
;2185:	if(uis.sb_tab == 9){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 9
NEI4 $4068
line 2186
;2186:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2187
;2187:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2188
;2188:	}
LABELV $4068
line 2189
;2189:	if(uis.sb_tab == 10){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 10
NEI4 $4073
line 2190
;2190:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+1964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2191
;2191:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 s_sandboxmain+8724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2192
;2192:	}
LABELV $4073
line 2194
;2193:	
;2194:	for(i = 0; i < PROPERTIES_NUM; i++){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $4078
line 2195
;2195:	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif[i] );
ADDRGP4 s_sandboxmain
ARGP4
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_sandboxmain+2172
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2196
;2196:	}
LABELV $4079
line 2194
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $4078
line 2198
;2197:	
;2198:	s_sandboxmain.priv.curvalue = trap_Cvar_VariableValue("sb_private");
ADDRGP4 $686
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_sandboxmain+1296+88
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 2199
;2199:	Q_strncpyz( s_sandboxmain.grid.field.buffer, UI_Cvar_VariableString("sb_grid"), sizeof(s_sandboxmain.grid.field.buffer) );
ADDRGP4 $689
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+1392+88+12
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2200
;2200:	s_sandboxmain.list.curvalue = trap_Cvar_VariableValue("sb_modelnum");
ADDRGP4 $693
ARGP4
ADDRLP4 1060
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_sandboxmain+8724+416
ADDRLP4 1060
INDIRF4
CVFI4 4
ASGNI4
line 2201
;2201:	s_sandboxmain.classlist.curvalue = trap_Cvar_VariableValue("sb_classnum");
ADDRGP4 $696
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_sandboxmain+9180+416
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 2202
;2202:	s_sandboxmain.texturelist.curvalue = trap_Cvar_VariableValue("sb_texturenum");
ADDRGP4 $699
ARGP4
ADDRLP4 1068
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_sandboxmain+9636+416
ADDRLP4 1068
INDIRF4
CVFI4 4
ASGNI4
line 2203
;2203:	Q_strncpyz( s_sandboxmain.modif[0].field.buffer, UI_Cvar_VariableString("toolgun_mod1"), sizeof(s_sandboxmain.modif[0].field.buffer) );
ADDRGP4 $702
ARGP4
ADDRLP4 1072
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+88+12
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2204
;2204:	Q_strncpyz( s_sandboxmain.modif[1].field.buffer, UI_Cvar_VariableString("toolgun_mod2"), sizeof(s_sandboxmain.modif[1].field.buffer) );
ADDRGP4 $706
ARGP4
ADDRLP4 1076
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+364+88+12
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2205
;2205:	Q_strncpyz( s_sandboxmain.modif[2].field.buffer, UI_Cvar_VariableString("toolgun_mod3"), sizeof(s_sandboxmain.modif[2].field.buffer) );
ADDRGP4 $711
ARGP4
ADDRLP4 1080
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+728+88+12
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2206
;2206:	Q_strncpyz( s_sandboxmain.modif[3].field.buffer, UI_Cvar_VariableString("toolgun_mod4"), sizeof(s_sandboxmain.modif[3].field.buffer) );
ADDRGP4 $716
ARGP4
ADDRLP4 1084
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+1092+88+12
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2207
;2207:	Q_strncpyz( s_sandboxmain.modif[4].field.buffer, UI_Cvar_VariableString("toolgun_mod5"), sizeof(s_sandboxmain.modif[4].field.buffer) );
ADDRGP4 $721
ARGP4
ADDRLP4 1088
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+1456+88+12
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2208
;2208:	Q_strncpyz( s_sandboxmain.modif[5].field.buffer, UI_Cvar_VariableString("toolgun_mod6"), sizeof(s_sandboxmain.modif[5].field.buffer) );
ADDRGP4 $726
ARGP4
ADDRLP4 1092
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+1820+88+12
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2209
;2209:	Q_strncpyz( s_sandboxmain.modif[6].field.buffer, UI_Cvar_VariableString("toolgun_mod7"), sizeof(s_sandboxmain.modif[6].field.buffer) );
ADDRGP4 $731
ARGP4
ADDRLP4 1096
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+2184+88+12
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2210
;2210:	Q_strncpyz( s_sandboxmain.modif[7].field.buffer, UI_Cvar_VariableString("toolgun_mod8"), sizeof(s_sandboxmain.modif[7].field.buffer) );
ADDRGP4 $736
ARGP4
ADDRLP4 1100
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+2548+88+12
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2211
;2211:	Q_strncpyz( s_sandboxmain.modif[8].field.buffer, UI_Cvar_VariableString("toolgun_mod9"), sizeof(s_sandboxmain.modif[8].field.buffer) );
ADDRGP4 $741
ARGP4
ADDRLP4 1104
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+2912+88+12
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2212
;2212:	Q_strncpyz( s_sandboxmain.modif[9].field.buffer, UI_Cvar_VariableString("toolgun_mod10"), sizeof(s_sandboxmain.modif[9].field.buffer) );
ADDRGP4 $746
ARGP4
ADDRLP4 1108
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+3276+88+12
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2213
;2213:	Q_strncpyz( s_sandboxmain.modif[10].field.buffer, UI_Cvar_VariableString("toolgun_mod11"), sizeof(s_sandboxmain.modif[10].field.buffer) );
ADDRGP4 $751
ARGP4
ADDRLP4 1112
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+3640+88+12
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2214
;2214:	Q_strncpyz( s_sandboxmain.modif[11].field.buffer, UI_Cvar_VariableString("toolgun_mod12"), sizeof(s_sandboxmain.modif[11].field.buffer) );
ADDRGP4 $756
ARGP4
ADDRLP4 1116
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+4004+88+12
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2215
;2215:	Q_strncpyz( s_sandboxmain.modif[12].field.buffer, UI_Cvar_VariableString("toolgun_mod13"), sizeof(s_sandboxmain.modif[12].field.buffer) );
ADDRGP4 $761
ARGP4
ADDRLP4 1120
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+4368+88+12
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2216
;2216:	Q_strncpyz( s_sandboxmain.modif[13].field.buffer, UI_Cvar_VariableString("toolgun_mod14"), sizeof(s_sandboxmain.modif[13].field.buffer) );
ADDRGP4 $766
ARGP4
ADDRLP4 1124
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+4732+88+12
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2217
;2217:	Q_strncpyz( s_sandboxmain.modif[14].field.buffer, UI_Cvar_VariableString("toolgun_mod15"), sizeof(s_sandboxmain.modif[14].field.buffer) );
ADDRGP4 $771
ARGP4
ADDRLP4 1128
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+5096+88+12
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2218
;2218:	Q_strncpyz( s_sandboxmain.modif[15].field.buffer, UI_Cvar_VariableString("toolgun_mod16"), sizeof(s_sandboxmain.modif[15].field.buffer) );
ADDRGP4 $776
ARGP4
ADDRLP4 1132
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+5460+88+12
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2219
;2219:	Q_strncpyz( s_sandboxmain.modif[16].field.buffer, UI_Cvar_VariableString("toolgun_mod17"), sizeof(s_sandboxmain.modif[16].field.buffer) );
ADDRGP4 $781
ARGP4
ADDRLP4 1136
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+5824+88+12
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2220
;2220:	Q_strncpyz( s_sandboxmain.modif[17].field.buffer, UI_Cvar_VariableString("toolgun_mod18"), sizeof(s_sandboxmain.modif[17].field.buffer) );
ADDRGP4 $786
ARGP4
ADDRLP4 1140
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_sandboxmain+2172+6188+88+12
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2221
;2221:	trap_Cvar_Set( "sb_texture", va("ptex/%s", s_sandboxmain.list.itemnames[uis.texturelist_folder]) );
ADDRGP4 $3367
ARGP4
ADDRGP4 uis+11488
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4239
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2222
;2222:	trap_Cvar_Set( "sb_texture_view", va("ptex/props/%s", s_sandboxmain.list.itemnames[uis.texturelist_folder]) );
ADDRGP4 $4244
ARGP4
ADDRGP4 uis+11488
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_sandboxmain+8724+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4243
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2224
;2223:	
;2224:	if(uis.sb_tab == 6){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 6
NEI4 $4248
line 2225
;2225:	SandboxMain_SpawnListUpdate();
ADDRGP4 SandboxMain_SpawnListUpdate
CALLV
pop
line 2226
;2226:	}
LABELV $4248
line 2228
;2227:	
;2228:	if(uis.sb_tab == 1){
ADDRGP4 uis+11472
INDIRI4
CNSTI4 1
NEI4 $4251
line 2229
;2229:	s_sandboxmain.classlist.curvalue = 0;
ADDRGP4 s_sandboxmain+9180+416
CNSTI4 0
ASGNI4
line 2230
;2230:	} else {
ADDRGP4 $4252
JUMPV
LABELV $4251
line 2231
;2231:	s_sandboxmain.texturelist.curvalue = 0;
ADDRGP4 s_sandboxmain+9636+416
CNSTI4 0
ASGNI4
line 2232
;2232:	}
LABELV $4252
line 2233
;2233:}
LABELV $1896
endproc SandboxMain_MenuInit 1152 16
export UI_SandboxMainMenu
proc UI_SandboxMainMenu 4 4
line 2240
;2234:
;2235:/*
;2236:===============
;2237:UI_SandboxMainMenu
;2238:===============
;2239:*/
;2240:void UI_SandboxMainMenu( void ) {
line 2241
;2241:	if(DynamicMenu_ServerGametype() == GT_SANDBOX){
ADDRLP4 0
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $4259
line 2242
;2242:	if(!uis.sb_tab){ uis.sb_tab = 1;}
ADDRGP4 uis+11472
INDIRI4
CNSTI4 0
NEI4 $4261
ADDRGP4 uis+11472
CNSTI4 1
ASGNI4
LABELV $4261
line 2243
;2243:	SandboxMain_MenuInit();
ADDRGP4 SandboxMain_MenuInit
CALLV
pop
line 2244
;2244:	UI_PushMenu ( &s_sandboxmain.menu );
ADDRGP4 s_sandboxmain
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 2245
;2245:	}
LABELV $4259
line 2246
;2246:}
LABELV $4258
endproc UI_SandboxMainMenu 4 4
import DynamicMenu_ServerGametype
import UI_Alloc
import UI_Free
bss
align 4
LABELV s_sandboxmain
skip 8399948
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
LABELV $4244
byte 1 112
byte 1 116
byte 1 101
byte 1 120
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4243
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
LABELV $4239
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
byte 1 0
align 1
LABELV $4003
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 110
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $4000
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3997
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $3994
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $3991
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 67
byte 1 105
byte 1 116
byte 1 105
byte 1 122
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $3985
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $3982
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $3979
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $3976
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $3973
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
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
LABELV $3970
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3967
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $3964
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $3961
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $3958
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
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
LABELV $3955
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $3952
byte 1 109
byte 1 105
byte 1 115
byte 1 99
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
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $3947
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3944
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 99
byte 1 117
byte 1 116
byte 1 115
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $3941
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3938
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3935
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 0
align 1
LABELV $3932
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $3929
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 101
byte 1 97
byte 1 114
byte 1 116
byte 1 104
byte 1 113
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $3926
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3923
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $3920
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
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
LABELV $3917
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $3914
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $3911
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
LABELV $3908
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $3905
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $3902
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
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
byte 1 0
align 1
LABELV $3899
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $3896
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $3893
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $3890
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $3887
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $3884
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 0
align 1
LABELV $3881
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $3878
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3875
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $3872
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $3869
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $3866
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $3863
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $3860
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $3857
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $3854
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $3851
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3848
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $3845
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $3842
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $3839
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $3836
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 115
byte 1 105
byte 1 108
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3833
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $3830
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3827
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $3824
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $3821
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 103
byte 1 111
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $3818
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 101
byte 1 121
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $3815
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3812
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3809
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $3806
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
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
LABELV $3803
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $3800
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3797
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3794
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3791
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $3788
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $3785
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
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
LABELV $3782
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $3779
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $3776
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
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
byte 1 0
align 1
LABELV $3773
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3770
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
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
byte 1 0
align 1
LABELV $3767
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $3764
byte 1 105
byte 1 116
byte 1 101
byte 1 109
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
byte 1 0
align 1
LABELV $3761
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3758
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $3755
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $3752
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $3749
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $3746
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3743
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $3740
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $3737
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $3734
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $3731
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $3728
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $3725
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $3722
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $3719
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $3716
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 98
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $3713
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $3710
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3707
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 101
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $3704
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3701
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3698
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $3695
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $3692
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3689
byte 1 97
byte 1 109
byte 1 109
byte 1 111
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
LABELV $3686
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3683
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3680
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3677
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3674
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
LABELV $3671
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3668
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $3665
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 95
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3662
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $3659
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $3656
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $3653
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
LABELV $3650
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
LABELV $3647
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
LABELV $3644
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3641
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3638
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
LABELV $3635
byte 1 119
byte 1 101
byte 1 97
byte 1 112
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
LABELV $3581
byte 1 78
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $3553
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3525
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3481
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $3461
byte 1 78
byte 1 111
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $3450
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3434
byte 1 78
byte 1 111
byte 1 32
byte 1 78
byte 1 80
byte 1 67
byte 1 0
align 1
LABELV $3406
byte 1 78
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3397
byte 1 46
byte 1 112
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3371
byte 1 112
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3367
byte 1 112
byte 1 116
byte 1 101
byte 1 120
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3361
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $3341
byte 1 78
byte 1 111
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3332
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $3327
byte 1 65
byte 1 100
byte 1 100
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $3261
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 0
align 1
LABELV $3241
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $3131
byte 1 66
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $3126
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $3060
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $3030
byte 1 69
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $3025
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2959
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2927
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2853
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $2848
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2818
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2815
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2812
byte 1 65
byte 1 112
byte 1 112
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $2807
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2713
byte 1 71
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2708
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2608
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 65
byte 1 73
byte 1 0
align 1
LABELV $2605
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 65
byte 1 73
byte 1 0
align 1
LABELV $2602
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2599
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $2513
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2496
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2393
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2390
byte 1 80
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $2324
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $2302
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $1949
byte 1 71
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1946
byte 1 80
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1943
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1940
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1937
byte 1 65
byte 1 100
byte 1 100
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1934
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $1931
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $1928
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1925
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1922
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1919
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $1916
byte 1 78
byte 1 80
byte 1 67
byte 1 115
byte 1 0
align 1
LABELV $1913
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
LABELV $1910
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1907
byte 1 83
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $1904
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1892
byte 1 111
byte 1 112
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $1888
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1883
byte 1 111
byte 1 112
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $1879
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1759
byte 1 117
byte 1 115
byte 1 101
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $1751
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
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1724
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1713
byte 1 117
byte 1 115
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $1702
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $1640
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 48
byte 1 59
byte 1 32
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $1625
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 117
byte 1 105
byte 1 32
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1614
byte 1 117
byte 1 115
byte 1 101
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1603
byte 1 98
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
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
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1595
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
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1573
byte 1 117
byte 1 115
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1565
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1539
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $1538
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
LABELV $1468
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1409
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $1367
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 58
byte 1 0
align 1
LABELV $1363
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 40
byte 1 105
byte 1 100
byte 1 41
byte 1 58
byte 1 0
align 1
LABELV $1359
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 58
byte 1 0
align 1
LABELV $1355
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1351
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $1347
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $1154
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1151
byte 1 46
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $1131
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $1124
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $1120
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $797
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $796
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
LABELV $786
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
LABELV $781
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
LABELV $776
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
LABELV $771
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
LABELV $766
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
LABELV $761
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
LABELV $756
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
LABELV $751
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
LABELV $746
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
LABELV $741
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
LABELV $736
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
LABELV $731
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
LABELV $726
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
LABELV $721
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
LABELV $716
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
LABELV $711
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
LABELV $706
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
LABELV $702
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
LABELV $699
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
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $696
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
byte 1 0
align 1
LABELV $693
byte 1 115
byte 1 98
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $689
byte 1 115
byte 1 98
byte 1 95
byte 1 103
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $686
byte 1 115
byte 1 98
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $677
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $642
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 32
byte 1 110
byte 1 112
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $609
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
LABELV $600
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $599
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
LABELV $523
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $522
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
LABELV $520
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 0
align 1
LABELV $502
byte 1 48
byte 1 0
align 1
LABELV $501
byte 1 49
byte 1 0
align 1
LABELV $491
byte 1 0
align 1
LABELV $480
byte 1 71
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $479
byte 1 80
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $478
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $477
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $476
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $475
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $474
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $473
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $472
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $471
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $470
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $469
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $468
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $467
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $466
byte 1 83
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $465
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 66
byte 1 101
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $464
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $463
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $462
byte 1 73
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $461
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $460
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $459
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $458
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $457
byte 1 73
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
LABELV $456
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $455
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $454
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $453
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $452
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $451
byte 1 66
byte 1 102
byte 1 103
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $450
byte 1 83
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $449
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $448
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
LABELV $447
byte 1 67
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $446
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $445
byte 1 66
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $444
byte 1 83
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $443
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 72
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $442
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $441
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $440
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $439
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $438
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $437
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $436
byte 1 77
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
LABELV $435
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $434
byte 1 77
byte 1 101
byte 1 103
byte 1 97
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $433
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $432
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $431
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $430
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $429
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $428
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $427
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $426
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $425
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $424
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $423
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $422
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $421
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 112
byte 1 99
byte 1 0
align 1
LABELV $420
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $419
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $418
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $417
byte 1 103
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 77
byte 1 97
byte 1 120
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $416
byte 1 103
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
LABELV $415
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
LABELV $414
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
LABELV $413
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
LABELV $412
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
LABELV $411
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
LABELV $410
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
LABELV $409
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
LABELV $408
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
LABELV $407
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
LABELV $406
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
LABELV $405
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
LABELV $404
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
LABELV $403
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
LABELV $402
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
LABELV $401
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
LABELV $400
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
LABELV $399
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
LABELV $398
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
LABELV $397
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
LABELV $396
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
LABELV $395
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
LABELV $394
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
LABELV $393
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
LABELV $392
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
LABELV $391
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
LABELV $390
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
LABELV $389
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
LABELV $388
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
LABELV $387
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
LABELV $386
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
LABELV $385
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
LABELV $384
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
LABELV $383
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
LABELV $382
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
LABELV $381
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
LABELV $380
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
LABELV $379
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
LABELV $378
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
LABELV $377
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
LABELV $376
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
LABELV $375
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
LABELV $374
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
LABELV $373
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
LABELV $372
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
LABELV $371
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
LABELV $370
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
byte 1 108
byte 1 108
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $369
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
LABELV $368
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
LABELV $367
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
LABELV $366
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
LABELV $365
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
LABELV $364
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
LABELV $363
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
LABELV $362
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
LABELV $361
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 77
byte 1 105
byte 1 110
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
LABELV $360
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
byte 1 0
align 1
LABELV $359
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $358
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
byte 1 0
align 1
LABELV $357
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
byte 1 0
align 1
LABELV $356
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
byte 1 0
align 1
LABELV $355
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
byte 1 0
align 1
LABELV $354
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
byte 1 0
align 1
LABELV $353
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
byte 1 0
align 1
LABELV $352
byte 1 103
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
LABELV $351
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $350
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
byte 1 0
align 1
LABELV $349
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
byte 1 0
align 1
LABELV $348
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
byte 1 0
align 1
LABELV $347
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
byte 1 0
align 1
LABELV $346
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
byte 1 0
align 1
LABELV $345
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
byte 1 0
align 1
LABELV $344
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
byte 1 0
align 1
LABELV $343
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
byte 1 0
align 1
LABELV $342
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
byte 1 0
align 1
LABELV $341
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
byte 1 0
align 1
LABELV $340
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
byte 1 0
align 1
LABELV $339
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
byte 1 0
align 1
LABELV $338
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
byte 1 0
align 1
LABELV $337
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
byte 1 0
align 1
LABELV $336
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
byte 1 0
align 1
LABELV $335
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
byte 1 0
align 1
LABELV $334
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
byte 1 0
align 1
LABELV $333
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
byte 1 0
align 1
LABELV $332
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
byte 1 0
align 1
LABELV $331
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
byte 1 0
align 1
LABELV $330
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
byte 1 0
align 1
LABELV $329
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
byte 1 0
align 1
LABELV $328
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
byte 1 0
align 1
LABELV $327
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
byte 1 0
align 1
LABELV $326
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
byte 1 0
align 1
LABELV $325
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
byte 1 0
align 1
LABELV $324
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
byte 1 0
align 1
LABELV $323
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
byte 1 0
align 1
LABELV $322
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
byte 1 0
align 1
LABELV $321
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
byte 1 0
align 1
LABELV $320
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
byte 1 0
align 1
LABELV $319
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
byte 1 0
align 1
LABELV $318
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
byte 1 0
align 1
LABELV $317
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
byte 1 0
align 1
LABELV $316
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
byte 1 0
align 1
LABELV $315
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
byte 1 0
align 1
LABELV $314
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
byte 1 0
align 1
LABELV $313
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
byte 1 0
align 1
LABELV $312
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
byte 1 0
align 1
LABELV $311
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
byte 1 0
align 1
LABELV $310
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
byte 1 0
align 1
LABELV $309
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
byte 1 0
align 1
LABELV $308
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
byte 1 0
align 1
LABELV $307
byte 1 103
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $306
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
byte 1 0
align 1
LABELV $305
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
byte 1 0
align 1
LABELV $304
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
byte 1 0
align 1
LABELV $303
byte 1 103
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
LABELV $302
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
LABELV $301
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
LABELV $300
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
byte 1 0
align 1
LABELV $299
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
byte 1 0
align 1
LABELV $298
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
byte 1 0
align 1
LABELV $297
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
byte 1 0
align 1
LABELV $296
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
byte 1 0
align 1
LABELV $295
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
byte 1 0
align 1
LABELV $294
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
byte 1 0
align 1
LABELV $293
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
byte 1 0
align 1
LABELV $292
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
byte 1 0
align 1
LABELV $291
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
byte 1 0
align 1
LABELV $290
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
byte 1 0
align 1
LABELV $289
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
byte 1 0
align 1
LABELV $288
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
byte 1 0
align 1
LABELV $287
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
byte 1 0
align 1
LABELV $286
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
byte 1 0
align 1
LABELV $285
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
byte 1 0
align 1
LABELV $284
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
byte 1 0
align 1
LABELV $283
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
byte 1 0
align 1
LABELV $282
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
byte 1 0
align 1
LABELV $281
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
byte 1 0
align 1
LABELV $280
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
byte 1 0
align 1
LABELV $279
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
byte 1 0
align 1
LABELV $278
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
byte 1 0
align 1
LABELV $277
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
byte 1 0
align 1
LABELV $276
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
byte 1 0
align 1
LABELV $275
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
byte 1 0
align 1
LABELV $274
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
byte 1 0
align 1
LABELV $273
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
byte 1 0
align 1
LABELV $272
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
byte 1 0
align 1
LABELV $271
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
byte 1 0
align 1
LABELV $270
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
byte 1 0
align 1
LABELV $269
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
byte 1 0
align 1
LABELV $268
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
byte 1 0
align 1
LABELV $267
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
byte 1 0
align 1
LABELV $266
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
byte 1 0
align 1
LABELV $265
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
byte 1 0
align 1
LABELV $264
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
byte 1 0
align 1
LABELV $263
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
byte 1 0
align 1
LABELV $262
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
byte 1 0
align 1
LABELV $261
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
byte 1 0
align 1
LABELV $260
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
byte 1 0
align 1
LABELV $259
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
byte 1 0
align 1
LABELV $258
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
byte 1 0
align 1
LABELV $257
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
byte 1 0
align 1
LABELV $256
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
byte 1 0
align 1
LABELV $255
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
byte 1 0
align 1
LABELV $254
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
byte 1 0
align 1
LABELV $253
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
byte 1 0
align 1
LABELV $252
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
byte 1 0
align 1
LABELV $251
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
byte 1 0
align 1
LABELV $250
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
byte 1 0
align 1
LABELV $249
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
byte 1 0
align 1
LABELV $248
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
byte 1 0
align 1
LABELV $247
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
byte 1 0
align 1
LABELV $246
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
byte 1 0
align 1
LABELV $245
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
byte 1 0
align 1
LABELV $244
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
byte 1 0
align 1
LABELV $243
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
byte 1 0
align 1
LABELV $242
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
byte 1 0
align 1
LABELV $241
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
byte 1 0
align 1
LABELV $240
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
byte 1 0
align 1
LABELV $239
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
byte 1 0
align 1
LABELV $238
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
byte 1 0
align 1
LABELV $237
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
byte 1 0
align 1
LABELV $236
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
byte 1 0
align 1
LABELV $235
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
byte 1 0
align 1
LABELV $234
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
byte 1 0
align 1
LABELV $233
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
byte 1 0
align 1
LABELV $232
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
byte 1 0
align 1
LABELV $231
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
byte 1 0
align 1
LABELV $230
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
byte 1 0
align 1
LABELV $229
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
byte 1 0
align 1
LABELV $228
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
byte 1 0
align 1
LABELV $227
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
byte 1 0
align 1
LABELV $226
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
byte 1 0
align 1
LABELV $225
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
byte 1 0
align 1
LABELV $224
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
byte 1 0
align 1
LABELV $223
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
byte 1 0
align 1
LABELV $222
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
byte 1 0
align 1
LABELV $221
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
byte 1 0
align 1
LABELV $220
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
byte 1 0
align 1
LABELV $219
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $218
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
byte 1 0
align 1
LABELV $217
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
byte 1 0
align 1
LABELV $216
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
byte 1 0
align 1
LABELV $215
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
byte 1 0
align 1
LABELV $214
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
byte 1 0
align 1
LABELV $213
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
byte 1 0
align 1
LABELV $212
byte 1 103
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
LABELV $211
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
byte 1 0
align 1
LABELV $210
byte 1 103
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
LABELV $209
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
byte 1 0
align 1
LABELV $208
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
byte 1 0
align 1
LABELV $207
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $206
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
byte 1 0
align 1
LABELV $205
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
byte 1 0
align 1
LABELV $204
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
byte 1 0
align 1
LABELV $203
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
byte 1 0
align 1
LABELV $202
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
byte 1 0
align 1
LABELV $201
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
byte 1 0
align 1
LABELV $200
byte 1 103
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
LABELV $199
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
byte 1 0
align 1
LABELV $198
byte 1 103
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
LABELV $197
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
byte 1 0
align 1
LABELV $196
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $195
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
byte 1 0
align 1
LABELV $194
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
byte 1 0
align 1
LABELV $193
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
byte 1 0
align 1
LABELV $192
byte 1 103
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
LABELV $191
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
byte 1 0
align 1
LABELV $190
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $189
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
byte 1 0
align 1
LABELV $188
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
byte 1 0
align 1
LABELV $187
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
byte 1 0
align 1
LABELV $186
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
byte 1 0
align 1
LABELV $185
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
byte 1 0
align 1
LABELV $184
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
byte 1 0
align 1
LABELV $183
byte 1 103
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
LABELV $182
byte 1 103
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
LABELV $181
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
byte 1 0
align 1
LABELV $180
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
byte 1 0
align 1
LABELV $179
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $178
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
byte 1 0
align 1
LABELV $177
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
byte 1 0
align 1
LABELV $176
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
byte 1 0
align 1
LABELV $175
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
byte 1 0
align 1
LABELV $174
byte 1 103
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
LABELV $173
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
byte 1 0
align 1
LABELV $172
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
byte 1 0
align 1
LABELV $171
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
byte 1 0
align 1
LABELV $170
byte 1 103
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
LABELV $169
byte 1 103
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
LABELV $168
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
byte 1 0
align 1
LABELV $167
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
byte 1 0
align 1
LABELV $166
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $165
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
byte 1 0
align 1
LABELV $164
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
byte 1 0
align 1
LABELV $163
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
byte 1 0
align 1
LABELV $162
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
byte 1 0
align 1
LABELV $161
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
byte 1 0
align 1
LABELV $160
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
byte 1 0
align 1
LABELV $159
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
byte 1 0
align 1
LABELV $158
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
byte 1 0
align 1
LABELV $157
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
byte 1 0
align 1
LABELV $156
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
byte 1 0
align 1
LABELV $155
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
byte 1 0
align 1
LABELV $154
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $153
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
byte 1 0
align 1
LABELV $152
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
byte 1 0
align 1
LABELV $151
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
byte 1 0
align 1
LABELV $150
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
byte 1 0
align 1
LABELV $149
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
byte 1 0
align 1
LABELV $148
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
byte 1 0
align 1
LABELV $147
byte 1 103
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
LABELV $146
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
byte 1 0
align 1
LABELV $145
byte 1 103
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
LABELV $144
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
byte 1 0
align 1
LABELV $143
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $142
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
byte 1 0
align 1
LABELV $141
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
byte 1 0
align 1
LABELV $140
byte 1 103
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
LABELV $139
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
byte 1 0
align 1
LABELV $138
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $137
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
byte 1 0
align 1
LABELV $136
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
byte 1 0
align 1
LABELV $135
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
byte 1 0
align 1
LABELV $134
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
byte 1 0
align 1
LABELV $133
byte 1 103
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
LABELV $132
byte 1 103
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
LABELV $131
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
byte 1 0
align 1
LABELV $130
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
byte 1 0
align 1
LABELV $129
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
byte 1 0
align 1
LABELV $128
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $127
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
byte 1 0
align 1
LABELV $126
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
byte 1 0
align 1
LABELV $125
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
byte 1 0
align 1
LABELV $124
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
byte 1 0
align 1
LABELV $123
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
byte 1 0
align 1
LABELV $122
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
byte 1 0
align 1
LABELV $121
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
byte 1 0
align 1
LABELV $120
byte 1 103
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
LABELV $119
byte 1 103
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
LABELV $118
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
byte 1 0
align 1
LABELV $117
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
byte 1 0
align 1
LABELV $116
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $115
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
byte 1 0
align 1
LABELV $114
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
byte 1 0
align 1
LABELV $113
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
byte 1 0
align 1
LABELV $112
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
byte 1 0
align 1
LABELV $111
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
byte 1 0
align 1
LABELV $110
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
byte 1 0
align 1
LABELV $109
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
byte 1 0
align 1
LABELV $108
byte 1 103
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
LABELV $107
byte 1 103
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
LABELV $106
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
byte 1 0
align 1
LABELV $105
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $104
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
byte 1 0
align 1
LABELV $103
byte 1 103
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
LABELV $102
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
byte 1 0
align 1
LABELV $101
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
byte 1 0
align 1
LABELV $100
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
byte 1 0
align 1
LABELV $99
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
byte 1 0
align 1
LABELV $98
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
byte 1 0
align 1
LABELV $97
byte 1 103
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
LABELV $96
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
byte 1 0
align 1
LABELV $95
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $94
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
byte 1 0
align 1
LABELV $93
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
byte 1 0
align 1
LABELV $92
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
byte 1 0
align 1
LABELV $91
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
byte 1 0
align 1
LABELV $90
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
byte 1 0
align 1
LABELV $89
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
byte 1 0
align 1
LABELV $88
byte 1 103
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
LABELV $87
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
byte 1 0
align 1
LABELV $86
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 103
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
LABELV $84
byte 1 103
byte 1 95
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $83
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
byte 1 0
align 1
LABELV $82
byte 1 103
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
LABELV $81
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
byte 1 0
