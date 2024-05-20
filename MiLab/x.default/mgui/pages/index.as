//default mgui menu
mgui_init					//mgui memory alloc

set mgui_ingame 0				//no draw background and no pause server
set mgui_scroll 0				//scroll menu count

set mitem1_type 1				// object type: 1-button with color rect, 2-button with picture, 3-button with rect and picture, 4-text field, 5-list, 6-3d model, 7-radio button, 8-slider
set mitem1_acttype 1			// activation type: 1-activated, 2-lost focus, 3-got focus
set mitem1_xtype 1				// x type: 1-percent, 2-real pixels (not recommended), 3-virtual pixels from 1920x1800
set mitem1_ytype 1				// y type: 1-percent, 2-real pixels (not recommended), 3-virtual pixels from 1920x1800
set mitem1_x 0					// x coord value
set mitem1_y 0					// y coord value
set mitem1_wtype 1				// width type: 1-percent, 2-real pixels (not recommended), 3-virtual pixels from 1920x1800
set mitem1_htype 1				// height type: 1-percent, 2-real pixels (not recommended), 3-virtual pixels from 1920x1800
set mitem1_w 10					//width value
set mitem1_h 10					//height value
set mitem1_text ""				//display text for type(1,2,3,4,6,7,8); folder for type(5)
set mitem1_cmd ""				//command line with %s arguments ex: "set name %s"
set mitem1_cmd2 ""				//command line with %s arguments ex: "set name %s"
set mitem1_1arg	0				//argument for command line (integer type with item id); 30 args supported mitem1_1arg, mitem1_2arg, mitem1_3arg ... mitem1_30arg
set mitem1_2arg	0				//argument for command line
set mitem1_3arg	0				//argument for command line
set mitem1_file	""				//display picture for type(2,3); folder for type(5); model location for type (6)
set mitem1_value ""				//initial value for type (4,5,7,8)
set mitem1_colorR 1.0			//text color Red from 0.0 to 1.0
set mitem1_colorG 1.0			//text color Green from 0.0 to 1.0
set mitem1_colorB 1.0			//text color Blue from 0.0 to 1.0
set mitem1_colorA 1.0			//text color Alpha from 0.0 to 1.0
set mitem1_colorinnerR 1.0		//background color Red from 0.0 to 1.0
set mitem1_colorinnerG 1.0		//background color Green from 0.0 to 1.0
set mitem1_colorinnerB 1.0		//background color Blue from 0.0 to 1.0
set mitem1_colorinnerA 1.0		//background color Alpha from 0.0 to 1.0
set mitem1_fontsize	1			//font size
set mitem1_corner 25			//corner angle for type (1,3)
set mitem1_col 1				//columns count for type (5)
set mitem1_mode	0				//argument data mode: type (5): 0-selected item name, 1-selected item number; type (7): 0-normal, 1-reverse; type (8): modifier for operations
set mitem1_style 0				//style for type (5): 0-list, 1-list with icons, 2-icons grid
set mitem1_min 0				//minimal value for type (8)
set mitem1_max 100				//maximal value for type (8)
set mitem1_savecvar ""			//save value to cvar

set mitem1_type 1
set mitem1_acttype 1
set mitem1_xtype 1
set mitem1_ytype 1
set mitem1_x 0
set mitem1_y 0
set mitem1_wtype 1
set mitem1_htype 1
set mitem1_w 10
set mitem1_h 10
set mitem1_text ""
set mitem1_cmd ""
set mitem1_cmd2 ""
set mitem1_1arg	0
set mitem1_2arg	0
set mitem1_3arg	0
set mitem1_file	""
set mitem1_value ""
set mitem1_colorR 1.0
set mitem1_colorG 1.0
set mitem1_colorB 1.0
set mitem1_colorA 1.0
set mitem1_colorinnerR 1.0
set mitem1_colorinnerG 1.0
set mitem1_colorinnerB 1.0
set mitem1_colorinnerA 1.0
set mitem1_fontsize	1
set mitem1_corner 25
set mitem1_col 1
set mitem1_mode	0
set mitem1_style 0
set mitem1_min 0
set mitem1_max 100
set mitem1_savecvar ""

mgui_load						//draw mgui menu