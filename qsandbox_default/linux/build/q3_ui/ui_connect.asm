data
export passwordNeeded
align 4
LABELV passwordNeeded
byte 4 1
code
proc UI_ReadableSize 16 16
file "../../../code/q3_ui/ui_connect.c"
line 20
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*
;6:===============================================================================
;7:
;8:CONNECTION SCREEN
;9:
;10:===============================================================================
;11:*/
;12:
;13:qboolean	passwordNeeded = qtrue;
;14:menufield_s passwordField;
;15:
;16:static connstate_t	lastConnState;
;17:static char			lastLoadingText[MAX_INFO_VALUE];
;18:
;19:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;20:{
line 21
;21:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $81
line 22
;22:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $83
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 23
;23:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $84
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 25
;24:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;25:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $82
JUMPV
LABELV $81
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $85
line 26
;26:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $83
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 27
;27:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 29
;28:			(value % (1024*1024))*100 / (1024*1024) );
;29:	} else if (value > 1024 ) { // kilos
ADDRGP4 $86
JUMPV
LABELV $85
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $88
line 30
;30:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $90
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 31
;31:	} else { // bytes
ADDRGP4 $89
JUMPV
LABELV $88
line 32
;32:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $91
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 33
;33:	}
LABELV $89
LABELV $86
LABELV $82
line 34
;34:}
LABELV $80
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 37
;35:
;36:// Assumes time is in msec
;37:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 38
;38:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 40
;39:
;40:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $93
line 41
;41:		Com_sprintf( buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $95
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 42
;42:	} else if (time > 60) { // mins
ADDRGP4 $94
JUMPV
LABELV $93
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $96
line 43
;43:		Com_sprintf( buf, bufsize, "%d min %d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $98
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 44
;44:	} else  { // secs
ADDRGP4 $97
JUMPV
LABELV $96
line 45
;45:		Com_sprintf( buf, bufsize, "%d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $99
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 46
;46:	}
LABELV $97
LABELV $94
line 47
;47:}
LABELV $92
endproc UI_PrintTime 8 20
data
align 1
LABELV $101
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $102
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $103
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 348 20
line 49
;48:
;49:static void UI_DisplayDownloadInfo( const char *downloadName ) {
line 58
;50:	static char dlText[]	= "Downloading:";
;51:	static char etaText[]	= "Estimated time left:";
;52:	static char xferText[]	= "Transfer rate:";
;53:
;54:	int downloadSize, downloadCount, downloadTime;
;55:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;56:	int xferRate;
;57:	int width, leftWidth;
;58:	int style = UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW;
ADDRLP4 0
CNSTI4 2064
ASGNI4
line 61
;59:	const char *s;
;60:
;61:	downloadSize = trap_Cvar_VariableValue( "cl_downloadSize" );
ADDRGP4 $104
ARGP4
ADDRLP4 288
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 288
INDIRF4
CVFI4 4
ASGNI4
line 62
;62:	downloadCount = trap_Cvar_VariableValue( "cl_downloadCount" );
ADDRGP4 $105
ARGP4
ADDRLP4 292
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 292
INDIRF4
CVFI4 4
ASGNI4
line 63
;63:	downloadTime = trap_Cvar_VariableValue( "cl_downloadTime" );
ADDRGP4 $106
ARGP4
ADDRLP4 296
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 148
ADDRLP4 296
INDIRF4
CVFI4 4
ASGNI4
line 74
;64:
;65:#if 0 // bk010104
;66:	fprintf( stderr, "\n\n-----------------------------------------------\n");
;67:	fprintf( stderr, "DB: downloadSize:  %16d\n", downloadSize );
;68:	fprintf( stderr, "DB: downloadCount: %16d\n", downloadCount );
;69:	fprintf( stderr, "DB: downloadTime:  %16d\n", downloadTime );  
;70:  	fprintf( stderr, "DB: UI realtime:   %16d\n", uis.realtime );	// bk
;71:	fprintf( stderr, "DB: UI frametime:  %16d\n", uis.frametime );	// bk
;72:#endif
;73:
;74:	leftWidth = width = UI_ProportionalStringWidth( dlText ) * UI_ProportionalSizeScale( style, 0 );
ADDRGP4 $101
ARGP4
ADDRLP4 300
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 304
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 308
ADDRLP4 300
INDIRI4
CVIF4 4
ADDRLP4 304
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 8
ADDRLP4 308
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 308
INDIRI4
ASGNI4
line 75
;75:	width = UI_ProportionalStringWidth( etaText ) * UI_ProportionalSizeScale( style, 0 );
ADDRGP4 $102
ARGP4
ADDRLP4 312
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 316
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 312
INDIRI4
CVIF4 4
ADDRLP4 316
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 76
;76:	if (width > leftWidth) leftWidth = width;
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $107
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $107
line 77
;77:	width = UI_ProportionalStringWidth( xferText ) * UI_ProportionalSizeScale( style, 0 );
ADDRGP4 $103
ARGP4
ADDRLP4 320
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 324
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 320
INDIRI4
CVIF4 4
ADDRLP4 324
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 78
;78:	if (width > leftWidth) leftWidth = width;
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $109
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $109
line 79
;79:	leftWidth += 16;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 81
;80:
;81:	UI_DrawProportionalString( 8, 128, dlText, style, color_white );
CNSTI4 8
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 $101
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 82
;82:	UI_DrawProportionalString( 8, 160, etaText, style, color_white );
CNSTI4 8
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $102
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 83
;83:	UI_DrawProportionalString( 8, 224, xferText, style, color_white );
CNSTI4 8
ARGI4
CNSTI4 224
ARGI4
ADDRGP4 $103
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 85
;84:
;85:	if (downloadSize > 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $111
line 86
;86:		s = va( "%s (%d%%)", downloadName, downloadCount * 100 / downloadSize );
ADDRGP4 $113
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 16
INDIRI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 156
ADDRLP4 328
INDIRP4
ASGNP4
line 87
;87:	} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 88
;88:		s = downloadName;
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
line 89
;89:	}
LABELV $112
line 91
;90:
;91:	UI_DrawProportionalString( leftWidth, 128, s, style, color_white );
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 93
;92:
;93:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 20
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 94
;94:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 96
;95:
;96:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 16
INDIRI4
CNSTI4 4096
LTI4 $116
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $114
LABELV $116
line 97
;97:		UI_DrawProportionalString( leftWidth, 160, "estimating", style, color_white );
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $117
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 98
;98:		UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $118
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 100
;99:			va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
;100:	} else {
ADDRGP4 $115
JUMPV
LABELV $114
line 105
;101:	  // bk010108
;102:	  //float elapsedTime = (float)(uis.realtime - downloadTime); // current - start (msecs)
;103:	  //elapsedTime = elapsedTime * 0.001f; // in seconds
;104:	  //if ( elapsedTime <= 0.0f ) elapsedTime == 0.0f;
;105:	  if ( (uis.realtime - downloadTime) / 1000) {
ADDRGP4 uis+4
INDIRI4
ADDRLP4 148
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $119
line 106
;106:			xferRate = downloadCount / ((uis.realtime - downloadTime) / 1000);
ADDRLP4 152
ADDRLP4 16
INDIRI4
ADDRGP4 uis+4
INDIRI4
ADDRLP4 148
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 108
;107:		  //xferRate = (int)( ((float)downloadCount) / elapsedTime);
;108:		} else {
ADDRGP4 $120
JUMPV
LABELV $119
line 109
;109:			xferRate = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 110
;110:		}
LABELV $120
line 115
;111:
;112:	  //fprintf( stderr, "DB: elapsedTime:  %16.8f\n", elapsedTime );	// bk
;113:	  //fprintf( stderr, "DB: xferRate:   %16d\n", xferRate );	// bk
;114:
;115:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 160
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 152
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 118
;116:
;117:		// Extrapolate estimated completion time
;118:		if (downloadSize && xferRate) {
ADDRLP4 328
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 328
INDIRI4
EQI4 $123
ADDRLP4 152
INDIRI4
ADDRLP4 328
INDIRI4
EQI4 $123
line 119
;119:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 332
ADDRLP4 12
INDIRI4
ADDRLP4 152
INDIRI4
DIVI4
ASGNI4
line 122
;120:
;121:			// We do it in K (/1024) because we'd overflow around 4MB
;122:			n = (n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000;
ADDRLP4 336
ADDRLP4 332
INDIRI4
ASGNI4
ADDRLP4 340
CNSTI4 1024
ASGNI4
ADDRLP4 332
CNSTI4 1000
ADDRLP4 336
INDIRI4
ADDRLP4 16
INDIRI4
ADDRLP4 340
INDIRI4
DIVI4
ADDRLP4 336
INDIRI4
MULI4
ADDRLP4 12
INDIRI4
ADDRLP4 340
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ASGNI4
line 124
;123:			
;124:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, n ); // bk010104
ADDRLP4 224
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 332
INDIRI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 127
;125:				//(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;126:
;127:			UI_DrawProportionalString( leftWidth, 160, 
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRLP4 224
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 129
;128:				dlTimeBuf, style, color_white );
;129:			UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $118
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 131
;130:				va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
;131:		} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 132
;132:			UI_DrawProportionalString( leftWidth, 160, 
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $117
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 134
;133:				"estimating", style, color_white );
;134:			if (downloadSize) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $125
line 135
;135:				UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $118
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 137
;136:					va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
;137:			} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 138
;138:				UI_DrawProportionalString( leftWidth, 192, 
ADDRGP4 $127
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 140
;139:					va("(%s copied)", dlSizeBuf), style, color_white );
;140:			}
LABELV $126
line 141
;141:		}
LABELV $124
line 143
;142:
;143:		if (xferRate) {
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $128
line 144
;144:			UI_DrawProportionalString( leftWidth, 224, 
ADDRGP4 $130
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 224
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 146
;145:				va("%s/Sec", xferRateBuf), style, color_white );
;146:		}
LABELV $128
line 147
;147:	}
LABELV $115
line 148
;148:}
LABELV $100
endproc UI_DisplayDownloadInfo 348 20
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5168 28
line 158
;149:
;150:/*
;151:========================
;152:UI_DrawConnectScreen
;153:
;154:This will also be overlaid on the cgame info screen during loading
;155:to prevent it from blinking away too rapidly on local or lan games.
;156:========================
;157:*/
;158:void UI_DrawConnectScreen( qboolean overlay ) {
line 164
;159:	char			*s;
;160:	uiClientState_t	cstate;
;161:	char			info[MAX_INFO_VALUE];
;162:	int strWidth;
;163:	
;164:	UI_ScreenOffset();
ADDRGP4 UI_ScreenOffset
CALLI4
pop
line 167
;165:	
;166:	// see what information we should display
;167:	trap_GetClientState( &cstate );
ADDRLP4 1024
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 169
;168:	
;169:	info[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 170
;170:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 172
;171:
;172:	if(!cl_sprun.integer && Q_stricmp (Info_ValueForKey( info, "mapname" ), "uimap_1") != 0 && uis.onmap){
ADDRGP4 cl_sprun+12
INDIRI4
CNSTI4 0
NEI4 $132
ADDRLP4 0
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 4120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4124
CNSTI4 0
ASGNI4
ADDRLP4 4120
INDIRI4
ADDRLP4 4124
INDIRI4
EQI4 $132
ADDRGP4 uis+11500
INDIRI4
ADDRLP4 4124
INDIRI4
EQI4 $132
line 174
;173:
;174:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 176
;175:
;176:	if ( !overlay ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $138
line 178
;177:		// draw the dialog background
;178:		UI_SetColor( color_white );
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 179
;179:		UI_DrawHandlePic( 0-uis.wideoffset, 0, SCREEN_WIDTH+uis.wideoffset*2, SCREEN_HEIGHT, uis.menuWallpapers );
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 640
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11404
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 180
;180:		UI_DrawHandlePic( 0-uis.wideoffset, 0, SCREEN_WIDTH+uis.wideoffset*2, SCREEN_HEIGHT, trap_R_RegisterShaderNoMip( "menu/art/blacktrans" ) );
ADDRGP4 $145
ARGP4
ADDRLP4 4128
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 640
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 4128
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 181
;181:	}
LABELV $138
line 183
;182:
;183:	if( strlen(info) ) {
ADDRLP4 0
ARGP4
ADDRLP4 4128
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4128
INDIRI4
CNSTI4 0
EQI4 $146
line 184
;184:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $148
line 185
;185:		UI_DrawString( 320, 16, va( "Loading %s", Info_ValueForKey( info, "mapname" ) ), UI_GIANTFONT|UI_CENTER|UI_DROPSHADOW, color_white );
ADDRLP4 0
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $151
ARGP4
ADDRLP4 4132
INDIRP4
ARGP4
ADDRLP4 4136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 4136
INDIRP4
ARGP4
CNSTI4 2113
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 186
;186:		}
LABELV $148
line 187
;187:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $152
line 188
;188:		UI_DrawString( 320, 16, va( "Загрузка %s", Info_ValueForKey( info, "mapname" ) ), UI_GIANTFONT|UI_CENTER|UI_DROPSHADOW, color_white );
ADDRLP4 0
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $155
ARGP4
ADDRLP4 4132
INDIRP4
ARGP4
ADDRLP4 4136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 4136
INDIRP4
ARGP4
CNSTI4 2113
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 189
;189:		}
LABELV $152
line 190
;190:	}
LABELV $146
line 192
;191:
;192:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $156
line 193
;193:		UI_DrawString( 320, 80, va("Connecting to %s", cstate.servername), UI_CENTER|UI_BIGFONT|UI_DROPSHADOW, menu_text_color );
ADDRGP4 $159
ARGP4
ADDRLP4 1024+12
ARGP4
ADDRLP4 4132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRLP4 4132
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 194
;194:		}
LABELV $156
line 195
;195:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $161
line 196
;196:		UI_DrawString( 320, 80, va("Подключение к %s", cstate.servername), UI_CENTER|UI_BIGFONT|UI_DROPSHADOW, menu_text_color );
ADDRGP4 $164
ARGP4
ADDRLP4 1024+12
ARGP4
ADDRLP4 4132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRLP4 4132
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 197
;197:		}
LABELV $161
line 201
;198:	//UI_DrawString( 320, 96, "Press Esc to disconnect", UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;199:
;200:	// display global MOTD at bottom
;201:	UI_DrawProportionalString( SCREEN_WIDTH/2, SCREEN_HEIGHT-32, 
ADDRLP4 1024+1036
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 4132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 448
ARGI4
ADDRLP4 4132
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 205
;202:		Info_ValueForKey( cstate.updateInfoString, "motd" ), UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;203:	
;204:	// print any server info (server full, bad version, etc)
;205:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 1024
INDIRI4
CNSTI4 5
GEI4 $168
line 206
;206:		UI_DrawProportionalString_AutoWrapped( 320, 192, 630, 20, cstate.messageString, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 630
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 1024+2060
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 207
;207:	}
LABELV $168
line 208
;208:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 1024
INDIRI4
LEI4 $171
line 209
;209:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 210
;210:	}
LABELV $171
line 211
;211:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 1024
INDIRI4
ASGNI4
line 213
;212:
;213:	switch ( cstate.connState ) {
ADDRLP4 4136
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 4136
INDIRI4
CNSTI4 3
LTI4 $131
ADDRLP4 4136
INDIRI4
CNSTI4 7
GTI4 $131
ADDRLP4 4136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $212-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $212
address $176
address $187
address $198
address $131
address $131
code
LABELV $176
line 215
;214:	case CA_CONNECTING:
;215:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $177
line 216
;216:		s = va("Awaiting challenge...%i", cstate.connectPacketCount);
ADDRGP4 $180
ARGP4
ADDRLP4 1024+4
INDIRI4
ARGI4
ADDRLP4 4144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4112
ADDRLP4 4144
INDIRP4
ASGNP4
line 217
;217:	}
LABELV $177
line 218
;218:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $174
line 219
;219:		s = va("Получение информации...%i", cstate.connectPacketCount);
ADDRGP4 $185
ARGP4
ADDRLP4 1024+4
INDIRI4
ARGI4
ADDRLP4 4144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4112
ADDRLP4 4144
INDIRP4
ASGNP4
line 220
;220:	}
line 221
;221:		break;
ADDRGP4 $174
JUMPV
LABELV $187
line 223
;222:	case CA_CHALLENGING:
;223:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $188
line 224
;224:		s = va("Awaiting connection...%i", cstate.connectPacketCount);
ADDRGP4 $191
ARGP4
ADDRLP4 1024+4
INDIRI4
ARGI4
ADDRLP4 4144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4112
ADDRLP4 4144
INDIRP4
ASGNP4
line 225
;225:	}
LABELV $188
line 226
;226:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $174
line 227
;227:		s = va("Подключение к серверу...%i", cstate.connectPacketCount);
ADDRGP4 $196
ARGP4
ADDRLP4 1024+4
INDIRI4
ARGI4
ADDRLP4 4144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4112
ADDRLP4 4144
INDIRP4
ASGNP4
line 228
;228:	}
line 229
;229:		break;
ADDRGP4 $174
JUMPV
LABELV $198
line 230
;230:	case CA_CONNECTED: {
line 233
;231:		char downloadName[MAX_INFO_VALUE];
;232:
;233:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $199
ARGP4
ADDRLP4 4144
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 234
;234:			if (*downloadName) {
ADDRLP4 4144
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $200
line 235
;235:				UI_DisplayDownloadInfo( downloadName );
ADDRLP4 4144
ARGP4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 236
;236:				return;
ADDRGP4 $131
JUMPV
LABELV $200
line 238
;237:			}
;238:		}
line 239
;239:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $202
line 240
;240:		s = "Awaiting gamestate...";
ADDRLP4 4112
ADDRGP4 $205
ASGNP4
line 241
;241:	}
LABELV $202
line 242
;242:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $174
line 243
;243:		s = "Ожидание сервера...";
ADDRLP4 4112
ADDRGP4 $209
ASGNP4
line 244
;244:	}
line 245
;245:		break;
line 247
;246:	case CA_LOADING:
;247:		return;
line 249
;248:	case CA_PRIMED:
;249:		return;
line 251
;250:	default:
;251:		return;
LABELV $174
line 254
;252:	}
;253:
;254:	UI_DrawString( 320, 128, s, UI_CENTER|UI_BIGFONT|UI_DROPSHADOW, color_white );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 4112
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 257
;255:
;256:	// password required / connection rejected information goes here
;257:	}
LABELV $132
line 258
;258:	if(cl_sprun.integer || Q_stricmp (Info_ValueForKey( info, "mapname" ), "uimap_1") == 0 || !uis.onmap){
ADDRGP4 cl_sprun+12
INDIRI4
CNSTI4 0
NEI4 $219
ADDRLP4 0
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 4132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4136
CNSTI4 0
ASGNI4
ADDRLP4 4132
INDIRI4
ADDRLP4 4136
INDIRI4
EQI4 $219
ADDRGP4 uis+11500
INDIRI4
ADDRLP4 4136
INDIRI4
NEI4 $214
LABELV $219
line 260
;259:
;260:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 262
;261:
;262:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $220
line 263
;263:	strWidth = strlen("Loading...") * 8;
ADDRGP4 $223
ARGP4
ADDRLP4 4140
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4140
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 264
;264:	}
LABELV $220
line 265
;265:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $224
line 266
;266:	strWidth = strlen("Загрузка...") * 8;
ADDRGP4 $227
ARGP4
ADDRLP4 4140
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4140
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 267
;267:	}
LABELV $224
line 269
;268:
;269:	UI_SetColor( color_white );
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 270
;270:	UI_DrawHandlePic( 0-(uis.wideoffset+1), 0, SCREEN_WIDTH+(uis.wideoffset*2)+2, SCREEN_HEIGHT*777, trap_R_RegisterShaderNoMip( "gfx/colors/black" ) );
ADDRGP4 $230
ARGP4
ADDRLP4 4140
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4144
CNSTI4 1
ASGNI4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
ADDRLP4 4144
INDIRI4
ADDI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11476
INDIRI4
ADDRLP4 4144
INDIRI4
LSHI4
CNSTI4 640
ADDI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
CNSTF4 1219894272
ARGF4
ADDRLP4 4140
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 271
;271:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $231
line 272
;272:	UI_DrawString( (SCREEN_WIDTH+uis.wideoffset - strWidth) - 16, SCREEN_HEIGHT - 32, "Loading...", UI_SMALLFONT, color_white );
ADDRLP4 4148
CNSTI4 16
ASGNI4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ADDRLP4 4108
INDIRI4
SUBI4
ADDRLP4 4148
INDIRI4
SUBI4
ARGI4
CNSTI4 448
ARGI4
ADDRGP4 $223
ARGP4
ADDRLP4 4148
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 273
;273:	}
LABELV $231
line 274
;274:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $235
line 275
;275:	UI_DrawString( (SCREEN_WIDTH+uis.wideoffset - strWidth) - 16, SCREEN_HEIGHT - 32, "Загрузка...", UI_SMALLFONT, color_white );
ADDRLP4 4148
CNSTI4 16
ASGNI4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ADDRLP4 4108
INDIRI4
SUBI4
ADDRLP4 4148
INDIRI4
SUBI4
ARGI4
CNSTI4 448
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4148
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 276
;276:	}
LABELV $235
line 277
;277:	if(Q_stricmp (Info_ValueForKey( info, "mapname" ), "uimap_1") != 0 && uis.onmap){
ADDRLP4 0
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4148
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 4152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4156
CNSTI4 0
ASGNI4
ADDRLP4 4152
INDIRI4
ADDRLP4 4156
INDIRI4
EQI4 $239
ADDRGP4 uis+11500
INDIRI4
ADDRLP4 4156
INDIRI4
EQI4 $239
line 278
;278:	UI_DrawHandlePic( (SCREEN_WIDTH+uis.wideoffset - strWidth) - 80, SCREEN_HEIGHT - 64, 64, 64, uis.menuLoadingIcon );
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ADDRLP4 4108
INDIRI4
SUBI4
CNSTI4 80
SUBI4
CVIF4 4
ARGF4
CNSTF4 1137704960
ARGF4
ADDRLP4 4160
CNSTF4 1115684864
ASGNF4
ADDRLP4 4160
INDIRF4
ARGF4
ADDRLP4 4160
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 279
;279:	}
LABELV $239
line 281
;280:
;281:	trap_GetClientState( &cstate );
ADDRLP4 1024
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 282
;282:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 1024
INDIRI4
CNSTI4 5
GEI4 $244
line 283
;283:		UI_DrawProportionalString_AutoWrapped( 320, 192, 630, 20, cstate.messageString, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 630
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 1024+2060
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 284
;284:	}
LABELV $244
line 285
;285:	}
LABELV $214
line 286
;286:}
LABELV $131
endproc UI_DrawConnectScreen 5168 28
export UI_KeyConnect
proc UI_KeyConnect 0 8
line 294
;287:
;288:
;289:/*
;290:===================
;291:UI_KeyConnect
;292:===================
;293:*/
;294:void UI_KeyConnect( int key ) {
line 295
;295:	if ( key == K_ESCAPE ) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $248
line 296
;296:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 297
;297:		return;
LABELV $248
line 299
;298:	}
;299:}
LABELV $247
endproc UI_KeyConnect 0 8
import UI_ScreenOffset
bss
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
export passwordField
align 4
LABELV passwordField
skip 364
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
LABELV $250
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
byte 1 10
byte 1 0
align 1
LABELV $230
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $227
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $223
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $209
byte 1 208
byte 1 158
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $205
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $196
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 186
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $191
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $185
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 132
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 134
byte 1 208
byte 1 184
byte 1 208
byte 1 184
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $180
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $167
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $164
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 186
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $159
byte 1 67
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
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $155
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $145
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
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $136
byte 1 117
byte 1 105
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $135
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $127
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $118
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $117
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $113
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $98
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $95
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $91
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $90
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $87
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $84
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $83
byte 1 37
byte 1 100
byte 1 0
