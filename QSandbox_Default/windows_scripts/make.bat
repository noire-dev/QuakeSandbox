echo off
echo ---------------------------------------
echo MiTech QVM Compiler (Quake Sandbox)
echo Compile: game.qvm, cgame.qvm, q3_ui.qvm
echo ---------------------------------------
cd ..
mkdir windows
mkdir windows\build
mkdir windows\baseoa
mkdir windows\baseoa\vm
mkdir windows\build\game
copy windows_scripts\lcc.exe  windows\build\game\
copy windows_scripts\q3cpp.exe  windows\build\game\
copy windows_scripts\q3rcc.exe  windows\build\game\
copy windows_scripts\q3asm.exe  windows\build\game\
copy windows_scripts\game.q3asm windows\build\
set LIBRARY=
set INCLUDE=
set cc=lcc -DQAGAME -DMISSIONPACK -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\..\code\game -I..\..\..\code\qcommon %1
cd windows\build\game


:: ########################################
:: Files to compile to           qagame.qvm
:: ########################################


%cc%  ../../../code/game/ai_chat.c
%cc%  ../../../code/game/ai_cmd.c
%cc%  ../../../code/game/ai_dmnet.c
%cc%  ../../../code/game/ai_dmq3.c
%cc%  ../../../code/game/ai_main.c
%cc%  ../../../code/game/ai_team.c
%cc%  ../../../code/game/ai_vcmd.c
%cc%  ../../../code/game/bg_lib.c
%cc%  ../../../code/game/bg_misc.c
%cc%  ../../../code/game/bg_pmove.c
%cc%  ../../../code/game/bg_slidemove.c
%cc%  ../../../code/game/g_active.c
%cc%  ../../../code/game/g_admin.c
%cc%  ../../../code/game/g_arenas.c
%cc%  ../../../code/game/g_bot.c
%cc%  ../../../code/game/g_client.c
%cc%  ../../../code/game/g_cmds.c
%cc%  ../../../code/game/g_cmds_ext.c
%cc%  ../../../code/game/g_combat.c
%cc%  ../../../code/game/g_items.c
%cc%  ../../../code/game/g_main.c
%cc%  ../../../code/game/bg_alloc.c
%cc%  ../../../code/game/g_fileops.c
%cc%  ../../../code/game/g_killspree.c
%cc%  ../../../code/game/g_misc.c
%cc%  ../../../code/game/g_mapfiles.c
%cc%  ../../../code/game/g_minigames.c
%cc%  ../../../code/game/g_mapcycle.c
%cc%  ../../../code/game/g_missile.c
%cc%  ../../../code/game/g_mover.c
%cc%  ../../../code/game/g_playerstore.c
%cc%  ../../../code/game/g_session.c
%cc%  ../../../code/game/g_spawn.c
%cc%  ../../../code/game/g_svcmds.c
%cc%  ../../../code/game/g_svcmds_ext.c
copy  ..\..\..\code\game\g_syscalls.asm ..
%cc%  ../../../code/game/g_target.c
%cc%  ../../../code/game/g_team.c
%cc%  ../../../code/game/g_trigger.c
%cc%  ../../../code/game/g_unlagged.c
%cc%  ../../../code/game/g_utils.c
%cc%  ../../../code/game/g_vote.c
%cc%  ../../../code/game/g_weapon.c

%cc%  ../../../code/qcommon/q_math.c
%cc%  ../../../code/qcommon/q_shared.c


:: ########################################
:: End of compilation files, add yours here
:: ########################################

echo -----------------
echo game.qvm compiled
echo -----------------


q3asm -f ../game
cd ..\..\..
cd windows_scripts
cd ..
mkdir windows
mkdir windows\build
mkdir windows\baseoa
mkdir windows\baseoa\vm
mkdir windows\build\cgame
copy windows_scripts\lcc.exe  windows\build\cgame\
copy windows_scripts\q3cpp.exe  windows\build\cgame\
copy windows_scripts\q3rcc.exe  windows\build\cgame\
copy windows_scripts\q3asm.exe  windows\build\cgame\
copy windows_scripts\cgame_mp.q3asm windows\build\cgame.q3asm
set LIBRARY=
set INCLUDE=
set cc=lcc -DCGAME -DMISSIONPACK -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\..\code\cgame -I..\..\..\code\ui -I..\..\..\code\qcommon %1
cd windows\build\cgame


:: ########################################
:: Files to compile to            сgame.qvm
:: ########################################

%cc%  ../../../code/cgame/cg_atmospheric.c
%cc%  ../../../code/cgame/cg_consolecmds.c
%cc%  ../../../code/cgame/cg_draw.c
%cc%  ../../../code/cgame/cg_drawtools.c
%cc%  ../../../code/cgame/cg_effects.c
%cc%  ../../../code/cgame/cg_ents.c
%cc%  ../../../code/cgame/cg_event.c
%cc%  ../../../code/cgame/cg_info.c
%cc%  ../../../code/cgame/cg_localents.c
%cc%  ../../../code/cgame/cg_main.c
%cc%  ../../../code/cgame/cg_marks.c
%cc%  ../../../code/cgame/cg_newdraw.c
%cc%  ../../../code/cgame/cg_particles.c
%cc%  ../../../code/cgame/cg_players.c
%cc%  ../../../code/cgame/cg_playerstate.c
%cc%  ../../../code/cgame/cg_predict.c
%cc%  ../../../code/cgame/cg_scoreboard.c
%cc%  ../../../code/cgame/cg_servercmds.c
%cc%  ../../../code/cgame/cg_snapshot.c
%cc%  ../../../code/cgame/cg_unlagged.c
%cc%  ../../../code/cgame/cg_view.c
%cc%  ../../../code/cgame/cg_weapons.c

%cc%  ../../../code/game/bg_lib.c
%cc%  ../../../code/game/bg_misc.c
%cc%  ../../../code/game/bg_pmove.c
%cc%  ../../../code/game/bg_slidemove.c

copy  ..\..\..\code\cgame\cg_syscalls.asm ..

%cc%  ../../../code/qcommon/q_math.c
%cc%  ../../../code/qcommon/q_shared.c

%cc%  ../../../code/ui/ui_shared.c


:: ########################################
:: End of compilation files, add yours here
:: ########################################

echo -----------------
echo cgame.qvm compiled
echo -----------------


q3asm -f ../cgame
cd ..\..\..
cd windows_scripts
cd ..
mkdir windows
mkdir windows\build
mkdir windows\baseoa
mkdir windows\baseoa\vm
mkdir windows\build\q3_ui
copy windows_scripts\lcc.exe  windows\build\q3_ui\
copy windows_scripts\q3cpp.exe  windows\build\q3_ui\
copy windows_scripts\q3rcc.exe  windows\build\q3_ui\
copy windows_scripts\q3asm.exe  windows\build\q3_ui\
copy windows_scripts\q3_ui.q3asm windows\build\
set LIBRARY=
set INCLUDE=
set cc=lcc -DQ3_UI -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\..\code\q3_ui -I..\..\..\code\qcommon %1
cd windows\build\q3_ui


:: ########################################
:: Files to compile to               ui.qvm
:: ########################################


%cc%  ../../../code/q3_ui/mgui.c
%cc%  ../../../code/q3_ui/ui_addbots.c
%cc%  ../../../code/q3_ui/ui_advanced.c
%cc%  ../../../code/q3_ui/ui_atoms.c
%cc%  ../../../code/q3_ui/ui_cdkey.c
%cc%  ../../../code/q3_ui/ui_cinematics.c
%cc%  ../../../code/q3_ui/ui_confirm.c
%cc%  ../../../code/q3_ui/ui_connect.c
%cc%  ../../../code/q3_ui/ui_controls2.c
%cc%  ../../../code/q3_ui/ui_credits.c
%cc%  ../../../code/q3_ui/ui_demo2.c
%cc%  ../../../code/q3_ui/ui_display.c
%cc%  ../../../code/q3_ui/ui_dynamicmenu.c
%cc%  ../../../code/q3_ui/ui_gameinfo.c
%cc%  ../../../code/q3_ui/ui_ingame.c
%cc%  ../../../code/q3_ui/ui_ingame_mapvote.c
%cc%  ../../../code/q3_ui/ui_loadconfig.c
%cc%  ../../../code/q3_ui/ui_loadconfiged.c

%cc%  ../../../code/q3_ui/ui_main.c
%cc%  ../../../code/q3_ui/ui_menu.c
%cc%  ../../../code/q3_ui/ui_mods.c
%cc%  ../../../code/q3_ui/ui_network.c
%cc%  ../../../code/q3_ui/ui_options.c
%cc%  ../../../code/q3_ui/ui_playermodel.c
%cc%  ../../../code/q3_ui/ui_players.c
%cc%  ../../../code/q3_ui/ui_playersettings.c
%cc%  ../../../code/q3_ui/ui_preferences.c
%cc%  ../../../code/q3_ui/ui_qmenu.c

%cc%  ../../../code/q3_ui/ui_removebots.c

%cc%  ../../../code/q3_ui/ui_sandbox.c
%cc%  ../../../code/q3_ui/ui_saveconfiged.c

%cc%  ../../../code/q3_ui/ui_serverinfo.c
%cc%  ../../../code/q3_ui/ui_servers2.c
%cc%  ../../../code/q3_ui/ui_setup.c

%cc%  ../../../code/q3_ui/ui_sound.c
%cc%  ../../../code/q3_ui/ui_sparena.c
%cc%  ../../../code/q3_ui/ui_specifyleague.c
%cc%  ../../../code/q3_ui/ui_specifyserver.c
%cc%  ../../../code/q3_ui/ui_splevel.c
%cc%  ../../../code/q3_ui/ui_sppostgame.c
%cc%  ../../../code/q3_ui/ui_spreset.c
%cc%  ../../../code/q3_ui/ui_spskill.c

%cc%  ../../../code/q3_ui/ui_startserver_bot.c
%cc%  ../../../code/q3_ui/ui_startserver_botsel.c
%cc%  ../../../code/q3_ui/ui_startserver_common.c
%cc%  ../../../code/q3_ui/ui_startserver_custommaps.c
%cc%  ../../../code/q3_ui/ui_startserver_data.c
%cc%  ../../../code/q3_ui/ui_startserver_items.c
%cc%  ../../../code/q3_ui/ui_startserver_items_old.c
%cc%  ../../../code/q3_ui/ui_startserver_map.c
%cc%  ../../../code/q3_ui/ui_startserver_mapsel.c
%cc%  ../../../code/q3_ui/ui_startserver_script.c
%cc%  ../../../code/q3_ui/ui_startserver_server.c
%cc%  ../../../code/q3_ui/ui_startserver_weapon.c
%cc%  ../../../code/q3_ui/ui_team.c
%cc%  ../../../code/q3_ui/ui_teamorders.c
%cc%  ../../../code/q3_ui/ui_video.c
%cc%  ../../../code/q3_ui/ui_workshop.c

copy  ..\..\..\code\ui\ui_syscalls.asm ..

%cc%  ../../../code/game/bg_lib.c
%cc%  ../../../code/game/bg_misc.c

%cc%  ../../../code/qcommon/q_math.c
%cc%  ../../../code/qcommon/q_shared.c


:: ########################################
:: End of compilation files, add yours here
:: ########################################

echo -----------------
echo q3_ui.qvm compiled
echo -----------------


q3asm -f ../q3_ui
cd ..\..\..
cd windows_scripts
cd ..\..

:: ##############################################################
:: Replace "default" here with the name of your mod
:: ##############################################################
copy qsandbox_default\windows\baseoa\vm\qagame.qvm milab\x.default\vm\qagame.qvm
copy qsandbox_default\windows\baseoa\vm\cgame.qvm milab\x.default\vm\cgame.qvm
copy qsandbox_default\windows\baseoa\vm\ui.qvm milab\x.default\vm\ui.qvm

:: Replace "default" here with the name of your mod SINGLE
copy qsandbox_default\windows\baseoa\vm\qagame.qvm milab\x.single\vm\qagame.qvm
copy qsandbox_default\windows\baseoa\vm\cgame.qvm milab\x.single\vm\cgame.qvm
copy qsandbox_default\windows\baseoa\vm\ui.qvm milab\x.single\vm\ui.qvm

color 0A
pause


