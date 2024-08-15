mgui_init

set mgui_ingame 1
set mgui_scroll 0

set mitem17_type 1
set mitem17_acttype 1
set mitem17_xtype 1
set mitem17_ytype 1
set mitem17_x 5
set mitem17_y 65
set mitem17_wtype 3
set mitem17_htype 3
set mitem17_w 180
set mitem17_h 90
set mitem17_text "use item"
set mitem17_cmd "execscript dscripts/script.useitem.as"
set mitem17_cmd2 "-button2"
set mitem17_1arg	0
set mitem17_2arg	0
set mitem17_3arg	0
set mitem17_file	""
set mitem17_value ""
set mitem17_colorR 1.0
set mitem17_colorG 1.0
set mitem17_colorB 1.0
set mitem17_colorA 1.0
set mitem17_colorinnerR 0.1
set mitem17_colorinnerG 0.1
set mitem17_colorinnerB 0.1
set mitem17_colorinnerA 0.80
set mitem17_fontsize	1.25
set mitem17_corner 5
set mitem17_col 1
set mitem17_mode	0
set mitem17_style 0
set mitem17_min 0
set mitem17_max 100
set mitem17_savecvar "mgui_none"

set mitem20_type 1
set mitem20_acttype 1
set mitem20_xtype 1
set mitem20_ytype 1
set mitem20_x 95
set mitem20_y 5
set mitem20_wtype 3
set mitem20_htype 3
set mitem20_w 80
set mitem20_h 80
set mitem20_text "x"
set mitem20_cmd "menuback"
set mitem20_cmd2 ""
set mitem20_1arg	0
set mitem20_2arg	0
set mitem20_3arg	0
set mitem20_file	""
set mitem20_value ""
set mitem20_colorR 1.0
set mitem20_colorG 1.0
set mitem20_colorB 1.0
set mitem20_colorA 1.0
set mitem20_colorinnerR 0.0
set mitem20_colorinnerG 0.0
set mitem20_colorinnerB 0.0
set mitem20_colorinnerA 0.80
set mitem20_fontsize	2
set mitem20_corner 4
set mitem20_col 1
set mitem20_mode	0
set mitem20_style 0
set mitem20_min 0
set mitem20_max 100
set mitem20_savecvar "mgui_none"

set mitem21_type 1
set mitem21_acttype 1
set mitem21_xtype 1
set mitem21_ytype 1
set mitem21_x 15
set mitem21_y 65
set mitem21_wtype 3
set mitem21_htype 3
set mitem21_w 180
set mitem21_h 90
set mitem21_text "gesture"
set mitem21_cmd "execscript dscripts/script.gesture.as"
set mitem21_cmd2 "-button3"
set mitem21_1arg	0
set mitem21_2arg	0
set mitem21_3arg	0
set mitem21_file	""
set mitem21_value ""
set mitem21_colorR 1.0
set mitem21_colorG 1.0
set mitem21_colorB 1.0
set mitem21_colorA 1.0
set mitem21_colorinnerR 0.1
set mitem21_colorinnerG 0.1
set mitem21_colorinnerB 0.1
set mitem21_colorinnerA 0.80
set mitem21_fontsize	1.25
set mitem21_corner 5
set mitem21_col 1
set mitem21_mode	0
set mitem21_style 0
set mitem21_min 0
set mitem21_max 100
set mitem21_savecvar "mgui_none"

set mitem22_type 1
set mitem22_acttype 1
set mitem22_xtype 1
set mitem22_ytype 1
set mitem22_x 25
set mitem22_y 65
set mitem22_wtype 3
set mitem22_htype 3
set mitem22_w 180
set mitem22_h 90
set mitem22_text "flashlight"
set mitem22_cmd "flashlight"
set mitem22_cmd2 ""
set mitem22_1arg	0
set mitem22_2arg	0
set mitem22_3arg	0
set mitem22_file	""
set mitem22_value ""
set mitem22_colorR 1.0
set mitem22_colorG 1.0
set mitem22_colorB 1.0
set mitem22_colorA 1.0
set mitem22_colorinnerR 0.1
set mitem22_colorinnerG 0.1
set mitem22_colorinnerB 0.1
set mitem22_colorinnerA 0.80
set mitem22_fontsize	1.25
set mitem22_corner 5
set mitem22_col 1
set mitem22_mode	0
set mitem22_style 0
set mitem22_min 0
set mitem22_max 100
set mitem22_savecvar "mgui_none"

set mitem23_type 1
set mitem23_acttype 1
set mitem23_xtype 1
set mitem23_ytype 1
set mitem23_x 35
set mitem23_y 65
set mitem23_wtype 3
set mitem23_htype 3
set mitem23_w 180
set mitem23_h 90
set mitem23_text "exit vehicle"
set mitem23_cmd "exitvehicle"
set mitem23_cmd2 "menuback"
set mitem23_1arg	0
set mitem23_2arg	0
set mitem23_3arg	0
set mitem23_file	""
set mitem23_value ""
set mitem23_colorR 1.0
set mitem23_colorG 1.0
set mitem23_colorB 1.0
set mitem23_colorA 1.0
set mitem23_colorinnerR 0.1
set mitem23_colorinnerG 0.1
set mitem23_colorinnerB 0.1
set mitem23_colorinnerA 0.80
set mitem23_fontsize	1.25
set mitem23_corner 5
set mitem23_col 1
set mitem23_mode	0
set mitem23_style 0
set mitem23_min 0
set mitem23_max 100
set mitem23_savecvar "mgui_none"

exec "mguiaddons/actionmenu/1.as"
exec "mguiaddons/actionmenu/2.as"
exec "mguiaddons/actionmenu/3.as"
exec "mguiaddons/actionmenu/4.as"
exec "mguiaddons/actionmenu/5.as"
exec "mguiaddons/actionmenu/6.as"
exec "mguiaddons/actionmenu/7.as"
exec "mguiaddons/actionmenu/8.as"
exec "mguiaddons/actionmenu/9.as"
exec "mguiaddons/actionmenu/10.as"

mgui_load
