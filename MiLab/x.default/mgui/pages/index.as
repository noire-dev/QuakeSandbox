//default mgui menu
mgui_init					//mgui memory alloc

set mgui_ingame 0				//no draw background and no pause server
set mgui_scroll 0				//scroll menu count

set mitem1_type 1				// object type: 1-button with color rect, 2-button with picture, 3-button with rect and picture, 4-text field, 5-list, 6-3d model
set mitem1_acttype 1			// activation type: 1-activated, 2-lost focus, 3-got focus
set mitem1_xytype 1				// x,y type: 1-percent, 2-real pixels (not recommended), 3-virtual pixels from 1920x1800
set mitem1_x 0					// x coord value
set mitem1_y 0					// y coord value
set mitem1_whtype 1				// width,height type: 1-percent, 2-real pixels (not recommended), 3-virtual pixels from 1920x1800
set mitem1_w 10					//width value
set mitem1_h 10					//height value
set mitem1_text ""				//display text for type(1,2,3,4,6); folder for type(5)
set mitem1_cmd ""				//command line with %s arguments ex: "set name %s"
set mitem1_1arg	0				//argument for command line (integer type with item id); 30 args supported mitem1_1arg, mitem1_2arg, mitem1_3arg ... mitem1_30arg
set mitem1_2arg	0				//argument for command line
set mitem1_3arg	0				//argument for command line
set mitem1_file	""				//display picture for type(2,3); folder for type(5); model location for type (6)
set mitem1_value ""				//initial value for type (4)
set mitem1_colorR 1.0			//text color Red from 0.0 to 1.0
set mitem1_colorG 1.0			//text color Green from 0.0 to 1.0
set mitem1_colorB 1.0			//text color Blue from 0.0 to 1.0
set mitem1_colorA 1.0			//text color Alpha from 0.0 to 1.0
set mitem1_fontsize	1			//font size
set mitem1_corner 25			//corner angle for type (1,3)
set mitem1_col 1				//columns count for type (5)
set mitem1_mode	1				//argument data mode for type (5): 1-selected item name, 2-selected item number
set mitem1_colorinnerR 1.0		//background color Red from 0.0 to 1.0
set mitem1_colorinnerG 1.0		//background color Green from 0.0 to 1.0
set mitem1_colorinnerB 1.0		//background color Blue from 0.0 to 1.0
set mitem1_colorinnerA 1.0		//background color Alpha from 0.0 to 1.0

mgui_load						//draw mgui menu