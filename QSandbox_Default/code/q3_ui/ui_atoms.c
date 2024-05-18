// Copyright (C) 1999-2000 Id Software, Inc.
//
/**********************************************************************
	UI_ATOMS.C

	User interface building blocks and support functions.
**********************************************************************/




#include "ui_local.h"

uiStatic_t		uis;
qboolean		m_entersound;		// after a frame, so caching won't disrupt the sound

// these are here so the functions in q_shared.c can link
#ifndef UI_HARD_LINKED

void QDECL Com_Error( int level, const char *error, ... ) {
	va_list		argptr;
	char		text[1024];
	va_start (argptr, error);
//	vsprintf (text, error, argptr);
	va_end (argptr);

	trap_Error( va("%s", text) );
}

void QDECL Com_Printf( const char *msg, ... ) {
	va_list		argptr;
	char		text[1024];

	va_start (argptr, msg);
//	vsprintf (text, msg, argptr);
	va_end (argptr);

	trap_Print( va("%s", text) );
}

#endif

/*
=================
UI_ClampCvar
=================
*/
float UI_ClampCvar( float min, float max, float value )
{
	if ( value < min ) return min;
	if ( value > max ) return max;
	return value;
}

/*
=================
UI_StartDemoLoop
=================
*/
void UI_StartDemoLoop( void ) {
	trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
}

/*
=================
UI_PushMenu
=================
*/
void UI_PushMenu( menuframework_s *menu )
{
	int				i;
	int				number;
	menucommon_s*	item;
	
	number = rand() % 4 + 1;
	
	trap_Cvar_SetValue( "ui_backcolors", number );
	
	uis.menuscroll = 0;
	

	// avoid stacking menus invoked by hotkeys
	for (i=0 ; i<uis.menusp ; i++)
	{
		if (uis.stack[i] == menu)
		{
			uis.menusp = i;
			break;
		}
	}

	if (i == uis.menusp)
	{
		if (uis.menusp >= MAX_MENUDEPTH)
			trap_Error("UI_PushMenu: menu stack overflow");

		uis.stack[uis.menusp++] = menu;
	}

	uis.activemenu = menu;

	// default cursor position
	menu->cursor      = 0;
	menu->cursor_prev = 0;

	m_entersound = qtrue;

	trap_Key_SetCatcher( KEYCATCH_UI );

	// force first available item to have focus
	for (i=0; i<menu->nitems; i++)
	{
		item = (menucommon_s *)menu->items[i];
		if (!(item->flags & (QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE)))
		{
			menu->cursor_prev = -1;
			Menu_SetCursor( menu, i );
			break;
		}
	}

	uis.firstdraw = qtrue;
}

/*
=================
UI_PopMenu
=================
*/
void UI_PopMenu (void)
{
	trap_S_StartLocalSound( menu_out_sound, CHAN_LOCAL_SOUND );

	uis.menusp--;
	
	uis.menuscroll = 0;

	if (uis.menusp < 0)
		trap_Error ("UI Restarted: press any key");

	if (uis.menusp) {
		uis.activemenu = uis.stack[uis.menusp-1];
		uis.firstdraw = qtrue;
	}
	else {
		UI_ForceMenuOff ();
	}
}

void UI_ForceMenuOff (void)
{
	uis.menusp     = 0;
	uis.activemenu = NULL;

	trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
	trap_Key_ClearStates();
	trap_Cvar_Set( "cl_paused", "0" );
}

/*
=================
UI_LerpColor
=================
*/
void UI_LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
{
	int i;

	// lerp and clamp each component
	for (i=0; i<4; i++)
	{
		c[i] = a[i] + t*(b[i]-a[i]);
		if (c[i] < 0)
			c[i] = 0;
		else if (c[i] > 1.0)
			c[i] = 1.0;
	}
}

/*
=================
UI_DrawProportionalString2
=================
*/
static int	propMap[128][3] = {
{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},

{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},

{0, 0, PROP_SPACE_WIDTH},		// SPACE
{11, 122, 7},	// !
{154, 181, 14},	// "
{55, 122, 17},	// #
{79, 122, 18},	// $
{101, 122, 23},	// %
{153, 122, 18},	// &
{9, 93, 7},		// '
{207, 122, 8},	// (
{230, 122, 9},	// )
{177, 122, 18},	// *
{30, 152, 18},	// +
{85, 181, 7},	// ,
{34, 93, 11},	// -
{110, 181, 6},	// .
{130, 152, 14},	// /

{22, 64, 17},	// 0
{41, 64, 12},	// 1
{58, 64, 17},	// 2
{78, 64, 18},	// 3
{98, 64, 19},	// 4
{120, 64, 18},	// 5
{141, 64, 18},	// 6
{204, 64, 16},	// 7
{162, 64, 17},	// 8
{182, 64, 18},	// 9
{59, 181, 7},	// :
{35,181, 7},	// ;
{203, 152, 14},	// <
{56, 93, 14},	// =
{228, 152, 14},	// >
{177, 181, 18},	// ?

{28, 122, 22},	// @
{5, 4, 18},		// A
{27, 4, 18},	// B
{48, 4, 18},	// C
{69, 4, 17},	// D
{90, 4, 13},	// E
{106, 4, 13},	// F
{121, 4, 18},	// G
{143, 4, 17},	// H
{164, 4, 8},	// I
{175, 4, 16},	// J
{195, 4, 18},	// K
{216, 4, 12},	// L
{230, 4, 23},	// M
{6, 34, 18},	// N
{27, 34, 18},	// O

{48, 34, 18},	// P
{68, 34, 18},	// Q
{90, 34, 17},	// R
{110, 34, 18},	// S
{130, 34, 14},	// T
{146, 34, 18},	// U
{166, 34, 19},	// V
{185, 34, 29},	// W
{215, 34, 18},	// X
{234, 34, 18},	// Y
{5, 64, 14},	// Z
{60, 152, 7},	// [
{106, 151, 13},	// '\'
{83, 152, 7},	// ]
{128, 122, 17},	// ^
{4, 152, 21},	// _

{134, 181, 5},	// '
{5, 4, 18},		// A
{27, 4, 18},	// B
{48, 4, 18},	// C
{69, 4, 17},	// D
{90, 4, 13},	// E
{106, 4, 13},	// F
{121, 4, 18},	// G
{143, 4, 17},	// H
{164, 4, 8},	// I
{175, 4, 16},	// J
{195, 4, 18},	// K
{216, 4, 12},	// L
{230, 4, 23},	// M
{6, 34, 18},	// N
{27, 34, 18},	// O

{48, 34, 18},	// P
{68, 34, 18},	// Q
{90, 34, 17},	// R
{110, 34, 18},	// S
{130, 34, 14},	// T
{146, 34, 18},	// U
{166, 34, 19},	// V
{185, 34, 29},	// W
{215, 34, 18},	// X
{234, 34, 18},	// Y
{5, 64, 14},	// Z
{153, 152, 13},	// {
{11, 181, 5},	// |
{180, 152, 13},	// }
{79, 93, 17},	// ~
{0, 0, -1}		// DEL
};

static int propMapB[26][3] = {
{11, 12, 33},
{49, 12, 31},
{85, 12, 31},
{120, 12, 30},
{156, 12, 21},
{183, 12, 21},
{207, 12, 32},

{13, 55, 30},
{49, 55, 13},
{66, 55, 29},
{101, 55, 31},
{135, 55, 21},
{158, 55, 40},
{204, 55, 32},

{12, 97, 31},
{48, 97, 31},
{82, 97, 30},
{118, 97, 30},
{153, 97, 30},
{185, 97, 25},
{213, 97, 30},

{11, 139, 32},
{42, 139, 51},
{93, 139, 32},
{126, 139, 31},
{158, 139, 25},
};

#define PROPB_GAP_WIDTH		4
#define PROPB_SPACE_WIDTH	12
#define PROPB_HEIGHT		36

// bk001205 - code below duplicated in cgame/cg_drawtools.c
// bk001205 - FIXME: does this belong in ui_shared.c?
/*
=================
UI_DrawBannerString
=================
*/
static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
{
	const char* s;
	char	ch;
        int prev_unicode = 0;
	vec4_t	tempcolor;
	float	ax;
	float	ay;
	float	aw;
	float	ah;
	float	frow;
	float	fcol;
	float	fwidth;
	float	fheight;

        int charw = 20;
        int charh = 20;

        float alignstate = 0;
       /* if (x < 0) {
           x = -x;
           alignstate = 0.5; //center_align
        }
        if (y < 0) {
           y = -y;
           alignstate = 1; //right_align
        }*/

	// draw the colored text
	trap_R_SetColor( color );

	ax = x * uis.scale + uis.bias;
	ay = y * uis.scale;
	ay += uis.menuscroll;
	aw = charw * uis.scale * 1;
	ah = charh * uis.scale * 1;

	s = str;
        while ( *s )
        {
           if ((*s == -48) || (*s == -47)) {
              ax = ax+aw*alignstate;
           }
           s++;
        }
	s = str;
	while ( *s )
	{
                if ( Q_IsColorString( s ) )
		{
		        memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
	               	tempcolor[3] = color[3];
	                trap_R_SetColor( tempcolor );
			s += 2;
			continue;
		}
		if (*s != ' ')
		{
                        ch = *s & 255;
                        // unicode russian stuff support
                        //Com_Printf("UI_letter: is %d\n", *s);
                        if (ch < 0) {
                           if ((ch == -48) || (ch == -47)) {
                              prev_unicode = ch;
                              s++;
                              continue;
                           }
                           if (ch >= -112) {
                              if ((ch == -111) && (prev_unicode == -47)) {
                                 ch = ch - 13;
                              } else {
                                 ch = ch + 48;
                              }
                           } else {
                              if ((ch == -127) && (prev_unicode == -48)) {
                                 // ch = ch +
                              } else {
                                 ch = ch + 112; // +64 offset of damn unicode
                              }
                           }
		}
			frow = (ch>>4)*0.0625;
			fcol = (ch&15)*0.0625;
			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
		}

		ax += aw;
		s++;
	}

	trap_R_SetColor( NULL );
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
	const char *	s;
	int				ch;
	int				width;
	vec4_t			drawcolor;

	// find the width of the drawn text
	s = str;
	width = 0;
	while ( *s ) {
		ch = *s;
		if ( ch == ' ' ) {
			width += PROPB_SPACE_WIDTH;
		} else {
                        if ((ch == -48) || (ch == -47)) {
                        } else {
                               width += 20;
		}
		}
		s++;
	}
	width -= PROPB_GAP_WIDTH;

	switch( style & UI_FORMATMASK ) {
		case UI_CENTER:
			x -= width / 2;
			break;

		case UI_RIGHT:
			x -= width;
			break;

		case UI_LEFT:
		default:
			break;
	}

	if ( style & UI_DROPSHADOW ) {
		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
		drawcolor[3] = color[3];
		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
	}

	UI_DrawBannerString2( x, y, str, color );
}


int UI_ProportionalStringWidth( const char* str ) {
	const char *	s;
	int				ch;
	int				charWidth;
	int				width;

	s = str;
	width = 0;
	while ( *s ) {
                if ( Q_IsColorString( s ) )
		{
			s += 2;
			continue;
		}
		ch = *s & 255;
		// charWidth = propMap[ch][2];
                charWidth = 16;
		if ( charWidth != -1 ) {
			width += charWidth;
			width += PROP_GAP_WIDTH;
		}
		s++;
	}

	width -= PROP_GAP_WIDTH;
	if(ifstrlenru(str)){
		return width * 0.5;	
	} else {
		return width;
	}
}


/*
=================
UI_DrawProportionalString2

The use of float x,y allows greater positioning precision

We can now "compensate" for alignment issues arising from the
virtual 640x480 screen resolution

Any function calling with int arguments will still exhibit previous
behaviour
=================
*/
static void UI_DrawProportionalString2( float x, float y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
{
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	const char* s;
	char	ch;
        int prev_unicode = 0;
	vec4_t	tempcolor;
	float	ax;
	float	ay;
	float	aw = 0; // bk001204 - init
	float	ah;
	float	frow;
	float	fcol;
	float	fwidth;
	float	fheight;

        int charw = 16;
        int charh = 16;

        float alignstate = 0;
        /*if (x < 0) {
           x = -x;
           alignstate = 0.5; //center_align
        }
        if (y < 0) {
           y = -y;
           alignstate = 1; //right_align
        }*/

	// draw the colored text
	trap_R_SetColor( color );

	ax = x * uis.scale + uis.bias;
	ay = y * uis.scale;
	ay += uis.menuscroll;
	aw = charw * uis.scale * sizeScale;
	ah = charh * uis.scale * sizeScale;

	s = str;
	while ( *s )
	{
           if ((*s == -48) || (*s == -47)) {
              ax = ax+aw*alignstate;
           }
           s++;
        }
        s = str;
	while ( *s )
	{
                if ( Q_IsColorString( s ) )
		{
		        memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
	               	tempcolor[3] = color[3];
	                trap_R_SetColor( tempcolor );
			s += 2;
			continue;
		}
		if (*s != ' ')
		{
                        ch = *s & 255;
                        // unicode russian stuff support
                        //Com_Printf("UI_letter: is %d\n", *s);
                        if (ch < 0) {
                           if ((ch == -48) || (ch == -47)) {
                              prev_unicode = ch;
                              s++;
                              continue;
                           }
                           if (ch >= -112) {
                              if ((ch == -111) && (prev_unicode == -47)) {
                                 ch = ch - 13;
                              } else {
                                 ch = ch + 48;
                              }
                           } else {
                              if ((ch == -127) && (prev_unicode == -48)) {
                                 // ch = ch +
                              } else {
                                 ch = ch + 112; // +64 offset of damn unicode
                              }
                           }
		}
			frow = (ch>>4)*0.0625;
			fcol = (ch&15)*0.0625;
			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
		}

		ax += aw;
		s++;
	}

	trap_R_SetColor( NULL );
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

/*
=================
UI_ProportionalSizeScale
=================
*/
float UI_ProportionalSizeScale( int style, float customsize ) {
if(customsize == 0){
	if(  style & UI_SMALLFONT ) {
		return PROP_SMALL_SIZE_SCALE;
	}

	if (style & UI_MEDIUMFONT ) {
		return PROP_MEDIUM_SIZE_SCALE;
	}
} else {
	return customsize;
}
	return 1.00;
}


/*
=================
UI_DrawScaledProportionalString

The use of float x,y allows greater positioning precision

We can now "compensate" for alignment issues arising from the
virtual 640x480 screen resolution

Any function calling with int arguments will still exhibit previous
behaviour
=================
*/
void UI_DrawScaledProportionalString( float x, float y, const char* str, int style, float sizeScale, vec4_t color )
{
	vec4_t	drawcolor;
	int		width;

	sizeScale *= UI_ProportionalSizeScale( style, 0 );

	switch( style & UI_FORMATMASK ) {
		case UI_CENTER:
			width = UI_ProportionalStringWidth( str ) * sizeScale;
			x -= width / 2;
			break;

		case UI_RIGHT:
			width = UI_ProportionalStringWidth( str ) * sizeScale;
			x -= width;
			break;

		case UI_LEFT:
		default:
			break;
	}

	if ( style & UI_DROPSHADOW ) {
		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
		drawcolor[3] = color[3];
		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, uis.charsetProp );
	}

	if ( style & UI_INVERSE ) {
		drawcolor[0] = color[0] * 0.7;
		drawcolor[1] = color[1] * 0.7;
		drawcolor[2] = color[2] * 0.7;
		drawcolor[3] = color[3];
		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetProp );
		return;
	}

	if ( style & UI_PULSE ) {
		drawcolor[0] = color[0] * 0.7;
		drawcolor[1] = color[1] * 0.7;
		drawcolor[2] = color[2] * 0.7;
		drawcolor[3] = color[3];
		UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );

		drawcolor[0] = color[0];
		drawcolor[1] = color[1];
		drawcolor[2] = color[2];
		drawcolor[3] = 0.5 + 0.5 * sin( uis.realtime / PULSE_DIVISOR );
		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetPropGlow );
		return;
	}

	UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
}


/*
=================
UI_DrawProportionalString
=================
*/
void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color )
{
	UI_DrawScaledProportionalString( x, y, str, style, 1.0, color );
}

/*
=================
UI_DrawProportionalString_Wrapped
=================
*/
void UI_DrawProportionalString_AutoWrapped( int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color ) {
	int width;
	char *s1,*s2,*s3;
	char c_bcp;
	char buf[1024];
	float   sizeScale;

	if (!str || str[0]=='\0')
		return;
	
	sizeScale = UI_ProportionalSizeScale( style, 0 );
	
	Q_strncpyz(buf, str, sizeof(buf));
	s1 = s2 = s3 = buf;

	while (1) {
		do {
			s3++;
		} while (*s3!=' ' && *s3!='\0');
		c_bcp = *s3;
		*s3 = '\0';
		width = UI_ProportionalStringWidth(s1) * sizeScale;
		*s3 = c_bcp;
		if (width > xmax) {
			if (s1==s2)
			{
				// fuck, don't have a clean cut, we'll overflow
				s2 = s3;
			}
			*s2 = '\0';
			UI_DrawProportionalString(x, y, s1, style, color);
			y += ystep;
			if (c_bcp == '\0')
      {
        // that was the last word
        // we could start a new loop, but that wouldn't be much use
        // even if the word is too long, we would overflow it (see above)
        // so just print it now if needed
        s2++;
        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
          UI_DrawProportionalString(x, y, s2, style, color);
				break; 
      }
			s2++;
			s1 = s2;
			s3 = s2;
		}
		else
		{
			s2 = s3;
			if (c_bcp == '\0') // we reached the end
			{
				UI_DrawProportionalString(x, y, s1, style, color);
				break;
			}
		}
	}
}

/*
=================
UI_DrawString2
=================
*/
static void UI_DrawString2( int x, int y, const char* str, vec4_t color, int charw, int charh )
{
	const char* s;
	char	ch;
	int forceColor = qfalse; //APSFIXME;
        int prev_unicode = 0;
	vec4_t	tempcolor;
	float	ax;
	float	ay;
	float	aw;
	float	ah;
	float	frow;
	float	fcol;

	//if (y < -charh)
		// offscreen
		//return;
        float alignstate = 0;
        if (charw < 0) {
           charw = -charw;
           alignstate = 0.5; //center_align
        }
        if (charh < 0) {
           charh = -charh;
           alignstate = 1; //right_align
        }

	// draw the colored text
	trap_R_SetColor( color );
	
	ax = x * uis.scale + uis.bias;
	ay = y * uis.scale;
	ay += uis.menuscroll;
	aw = charw * uis.scale;
	ah = charh * uis.scale;

	s = str;
	while ( *s )
	{
           if ((*s == -48) || (*s == -47)) {
              ax = ax+aw*alignstate;
           }
           s++;
        }
        s = str;
	while ( *s )
	{
		if ( Q_IsColorString( s ) )
		{

				memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
				tempcolor[3] = color[3];
				trap_R_SetColor( tempcolor );
			s += 2;
			continue;
		}



		if (*s != ' ')
		{
		ch = *s & 255;
                        // unicode russian stuff support
                        //Com_Printf("UI_letter: is %d\n", *s);
                        if (ch < 0) {
                           if ((ch == -48) || (ch == -47)) {
                              prev_unicode = ch;
                              s++;
                              continue;
                           }
                           if (ch >= -112) {
                              if ((ch == -111) && (prev_unicode == -47)) {
                                 ch = ch - 13;
                              } else {
                                 ch = ch + 48;
                              }
                           } else {
                              if ((ch == -127) && (prev_unicode == -48)) {
                                 // ch = ch +
                              } else {
                                 ch = ch + 112; // +64 offset of damn unicode
                              }
                           }
                        }
			frow = (ch>>4)*0.0625;
			fcol = (ch&15)*0.0625;
			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
		}

		ax += aw;
		s++;
	}

	trap_R_SetColor( NULL );
}

int UI_RusString(const char* str)
{
	const char* s;
	char	ch;
	int forceColor = qfalse; //APSFIXME;
        int prev_unicode = 0;
	vec4_t	tempcolor;
	float	ax;
	float	ay;
	float	aw;
	float	ah;
	float	frow;
	float	fcol;
	int x = 0;
	int y = 0;
	vec4_t color;
	int charw;
	int charh;
	int rucount = 0;

	//if (y < -charh)
		// offscreen
		//return;
        float alignstate = 0;
        if (charw < 0) {
           charw = -charw;
           alignstate = 0.5; //center_align
        }
        if (charh < 0) {
           charh = -charh;
           alignstate = 1; //right_align
        }
	
	ax = x * uis.scale + uis.bias;
	ay = y * uis.scale;
	ay += uis.menuscroll;
	aw = charw * uis.scale;
	ah = charh * uis.scale;

	s = str;
	while ( *s )
	{
           if ((*s == -48) || (*s == -47)) {
              ax = ax+aw*alignstate;
           }
           s++;
        }
        s = str;
	while ( *s )
	{
		if ( Q_IsColorString( s ) )
		{

				memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
				tempcolor[3] = color[3];
			s += 2;
		}



		if (*s != ' ')
		{
		ch = *s & 255;
                        // unicode russian stuff support
                        //Com_Printf("UI_letter: is %d\n", *s);
                        if (ch < 0) {
                           if ((ch == -48) || (ch == -47)) {
                              prev_unicode = ch;
                              s++;
                              continue;
                           }
                           if (ch >= -112) {
                              if ((ch == -111) && (prev_unicode == -47)) {
                                 ch = ch - 13;
                              } else {
                                 ch = ch + 48;
                              }
                           } else {
                              if ((ch == -127) && (prev_unicode == -48)) {
                                 // ch = ch +
                              } else {
                                 ch = ch + 112; // +64 offset of damn unicode
								 rucount += 1;
                              }
                           }
                        }
			frow = (ch>>4)*0.0625;
			fcol = (ch&15)*0.0625;
		}

		ax += aw;
		s++;
	}
	return rucount;
}

/*
=================
UI_DrawString
=================
*/
void UI_DrawString( int x, int y, const char* str, int style, vec4_t color )
{
	int		len;
	int		charw;
	int		charh;
	vec4_t	newcolor;
	vec4_t	lowlight;
	float	*drawcolor;
	vec4_t	dropcolor;

	if( !str ) {
		return;
	}

	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
		return;

	if (style & UI_SMALLFONT)
	{
		charw =	SMALLCHAR_WIDTH;
		charh =	SMALLCHAR_HEIGHT;
	}
	else if (style & UI_GIANTFONT)
	{
		charw =	GIANTCHAR_WIDTH;
		charh =	GIANTCHAR_HEIGHT;
	}
	else
	{
		charw =	BIGCHAR_WIDTH;
		charh =	BIGCHAR_HEIGHT;
	}

	if (style & UI_PULSE)
	{
		lowlight[0] = 2.0*color[0]; 
		lowlight[1] = 2.0*color[1];
		lowlight[2] = 2.0*color[2];
		lowlight[3] = 2.0*color[3];
		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
		drawcolor = newcolor;
	}	
	else
		drawcolor = color;

	switch (style & UI_FORMATMASK)
	{
		case UI_CENTER:
			// center justify at x
			len = strlen(str);
			x   = x - len*charw/2;
                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
			break;

		case UI_RIGHT:
			// right justify at x
			len = strlen(str);
			x   = x - len*charw;
                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
                        charh = -charh;
			break;

		default:
			// left justify at x
			break;
	}

	if ( style & UI_DROPSHADOW )
	{
		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
		dropcolor[3] = drawcolor[3];
		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh);
	}

	UI_DrawString2(x,y,str,drawcolor,charw,charh);
}

/*
=================
UI_DrawStringCustom
=================
*/
void UI_DrawStringCustom( int x, int y, const char* str, int style, vec4_t color, float csize )
{
	int		len;
	int		charw;
	int		charh;
	vec4_t	newcolor;
	vec4_t	lowlight;
	float	*drawcolor;
	vec4_t	dropcolor;

	if( !str ) {
		return;
	}

	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
		return;

if(csize == 0){
	if (style & UI_SMALLFONT)
	{
		charw =	SMALLCHAR_WIDTH;
		charh =	SMALLCHAR_HEIGHT;
	}
	else if (style & UI_GIANTFONT)
	{
		charw =	GIANTCHAR_WIDTH;
		charh =	GIANTCHAR_HEIGHT;
	}
	else
	{
		charw =	BIGCHAR_WIDTH;
		charh =	BIGCHAR_HEIGHT;
	}
} else {
		charw =	BIGCHAR_WIDTH*csize;
		charh =	BIGCHAR_HEIGHT*csize;	
}

	if (style & UI_PULSE)
	{
		lowlight[0] = 2.0*color[0]; 
		lowlight[1] = 2.0*color[1];
		lowlight[2] = 2.0*color[2];
		lowlight[3] = 2.0*color[3];
		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
		drawcolor = newcolor;
	}	
	else
		drawcolor = color;

	switch (style & UI_FORMATMASK)
	{
		case UI_CENTER:
			// center justify at x
			len = strlen(str);
			x   = x - len*charw/2;
                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
			break;

		case UI_RIGHT:
			// right justify at x
			len = strlen(str);
			x   = x - len*charw;
                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
                        charh = -charh;
			break;

		default:
			// left justify at x
			break;
	}

	if ( style & UI_DROPSHADOW )
	{
		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
		dropcolor[3] = drawcolor[3];
		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh);
	}

	UI_DrawString2(x,y,str,drawcolor,charw,charh);
}

/*
=================
UI_DrawChar
=================
*/
void UI_DrawChar( int x, int y, int ch, int style, vec4_t color )
{
	char	buff[2];

	buff[0] = ch;
	buff[1] = '\0';

	UI_DrawString( x, y, buff, style, color );
}

/*
=================
UI_DrawCharCustom
=================
*/
void UI_DrawCharCustom( int x, int y, int ch, int style, vec4_t color, float csize )
{
	char	buff[2];

	buff[0] = ch;
	buff[1] = '\0';

	UI_DrawStringCustom( x, y, buff, style, color, csize );
}

qboolean UI_IsFullscreen( void ) {
	if ( uis.activemenu && ( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
		return uis.activemenu->fullscreen;
	}

	return qfalse;
}

static void NeedCDAction( qboolean result ) {
	if ( !result ) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
	}
}

static void NeedCDKeyAction( qboolean result ) {
	if ( !result ) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
	}
}

void UI_SetActiveMenu( uiMenuCommand_t menu ) {
	// this should be the ONLY way the menu system is brought up
	// enusure minumum menu data is cached
	Menu_Cache();

	switch ( menu ) {
	case UIMENU_NONE:
		UI_ForceMenuOff();
		return;
	case UIMENU_MAIN:
		trap_Cvar_Set( "sv_pure", "0" );
		UI_MainMenu();
		UI_CreditMenu(1);
		return;
	case UIMENU_NEED_CD:
		UI_ConfirmMenu( "Insert the CD", 0, NeedCDAction );
		return;
	case UIMENU_BAD_CD_KEY:
		UI_ConfirmMenu( "Bad CD Key", 0, NeedCDKeyAction );
		return;
	case UIMENU_INGAME:
		/*
		//GRank
		UI_RankingsMenu();
		return;
		*/
		trap_Cvar_Set( "cl_paused", "1" );
		UI_InGameMenu();
		return;

	// bk001204
	case UIMENU_TEAM:
	case UIMENU_POSTGAME:
	default:
#ifndef NDEBUG
	  Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu );
#endif
	break;
	}
}

/*
=================
UI_KeyEvent
=================
*/
void UI_KeyEvent( int key, int down ) {
	sfxHandle_t		s;

	if (!uis.activemenu) {
		return;
	}

	if (!down) {
		return;
	}

	if (uis.activemenu->key)
		s = uis.activemenu->key( key );
	else
		s = Menu_DefaultKey( uis.activemenu, key );

	if ((s > 0) && (s != menu_null_sound))
		trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
}

/*
=================
UI_MouseEvent
=================
*/
void UI_MouseEvent( int dx, int dy )
{
	int				i;
	float scrx;
	float scry;
	menucommon_s*	m;

	if (!uis.activemenu)
		return;
	
	trap_GetGlconfig( &uis.glconfig );
	
	scrx = uis.glconfig.vidWidth;
	scry = uis.glconfig.vidHeight;

	// update mouse screen position
	if(!uis.activemenu->errorui){
	if(uis.activemenu->native > 0){
	uis.cursorx += dx * sensitivitymenu.value;
	if (uis.cursorx < 0)
		uis.cursorx = 0;
	else if (uis.cursorx > uis.glconfig.vidWidth)
		uis.cursorx = uis.glconfig.vidWidth;

	uis.cursory += dy * sensitivitymenu.value;
	if (uis.cursory < 0+uis.activemenu->uplimitscroll)
		uis.cursory = 0+uis.activemenu->uplimitscroll;
	else if (uis.cursory > uis.glconfig.vidHeight+uis.activemenu->downlimitscroll)
		uis.cursory = uis.glconfig.vidHeight+uis.activemenu->downlimitscroll;
	} else {
		uis.cursorx += dx * sensitivitymenu.value;
	if (uis.cursorx < 0-(scrx / (scry / 480)-640)/2)
		uis.cursorx = 0-(scrx / (scry / 480)-640)/2;
	else if (uis.cursorx > 640+(scrx / (scry / 480)-640)/2)
		uis.cursorx = 640+(scrx / (scry / 480)-640)/2;

	uis.cursory += dy * sensitivitymenu.value;
	if (uis.cursory < 0+uis.activemenu->uplimitscroll)
		uis.cursory = 0+uis.activemenu->uplimitscroll;
	else if (uis.cursory > 480+uis.activemenu->downlimitscroll)
		uis.cursory = 480+uis.activemenu->downlimitscroll;	
	}
	} else {
	uis.cursorx += dx * sensitivitymenu.value;
	if (uis.cursorx < 0)
		uis.cursorx = 0;
	else if (uis.cursorx > uis.glconfig.vidWidth)
		uis.cursorx = uis.glconfig.vidWidth;

	uis.cursory += dy * sensitivitymenu.value;
	if (uis.cursory < 0+uis.activemenu->uplimitscroll)
		uis.cursory = 0+uis.activemenu->uplimitscroll;
	else if (uis.cursory > uis.glconfig.vidHeight+uis.activemenu->downlimitscroll)
		uis.cursory = uis.glconfig.vidHeight+uis.activemenu->downlimitscroll;	
	}

	// region test the active menu items
	for (i=0; i<uis.activemenu->nitems; i++)
	{
		m = (menucommon_s*)uis.activemenu->items[i];

		if (m->flags & (QMF_GRAYED|QMF_INACTIVE))
			continue;

		if ((uis.cursorx < m->left) ||
			(uis.cursorx > m->right) ||
			(uis.cursory < m->top) ||
			(uis.cursory > m->bottom))
		{
			// cursor out of item bounds
			continue;
		}

		// set focus to item at cursor
		if (uis.activemenu->cursor != i)
		{
			Menu_SetCursor( uis.activemenu, i );
			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;

			if ( !(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT ) ) {
				trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
			}
		}

		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
		return;
	}  

	if (uis.activemenu->nitems > 0) {
		// out of any region
		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
	}
}

char *UI_Argv( int arg ) {
	static char	buffer[MAX_STRING_CHARS];

	trap_Argv( arg, buffer, sizeof( buffer ) );

	return buffer;
}

/*
=================
UI_Cache
=================
*/
void UI_Cache_f( void ) {
	MainMenu_Cache();
	InGame_Cache();
	ConfirmMenu_Cache();
	PlayerModel_Cache();
	PlayerSettings_Cache();
	Controls_Cache();
	Demos_Cache();
	UI_CinematicsMenu_Cache();
	Preferences_Cache();
	ServerInfo_Cache();
	SpecifyServer_Cache();
	ArenaServers_Cache();
	StartServer_Cache();
	ServerOptions_Cache();
	DriverInfo_Cache();
	GraphicsOptions_Cache();
	UI_DisplayOptionsMenu_Cache();
	UI_SoundOptionsMenu_Cache();
	UI_NetworkOptionsMenu_Cache();
	UI_SPLevelMenu_Cache();
	UI_SPSkillMenu_Cache();
	UI_SPPostgameMenu_Cache();
	TeamMain_Cache();
	UI_AddBots_Cache();
	UI_RemoveBots_Cache();
	UI_SetupMenu_Cache();
//	UI_LoadConfig_Cache();
//	UI_SaveConfigMenu_Cache();
	UI_BotSelect_Cache();
	UI_CDKeyMenu_Cache();
	UI_ModsMenu_Cache();
}


/*
==================
UI_ConcatArgs
==================
*/
char	*UI_ConcatArgs( int start ) {
	int		i, c, tlen;
	static char	line[MAX_STRING_CHARS];
	int		len;
	char	arg[MAX_STRING_CHARS];

	len = 0;
	c = trap_Argc();
	for ( i = start ; i < c ; i++ ) {
		trap_Argv( i, arg, sizeof( arg ) );
		tlen = strlen( arg );
		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
			break;
		}
		memcpy( line + len, arg, tlen );
		len += tlen;
		if ( i != c - 1 ) {
			line[len] = ' ';
			len++;
		}
	}

	line[len] = 0;

	return line;
}


/*
==================
UI_ArenaScriptAutoInt
Return type int
==================
*/
int UI_ArenaScriptAutoInt( char *name ) {  
	if(trap_Cvar_VariableValue(name)){
		return trap_Cvar_VariableValue(name);
	}
		return atoi(name);
}

/*
==================
UI_ArenaScriptAutoChar
Return type char
==================
*/
char *UI_ArenaScriptAutoChar( const char *name ) {
char finaltext[512];

	trap_Cvar_VariableStringBuffer(name, finaltext, sizeof( finaltext ));
	if(strlen(finaltext) != 0){
		return va("%s", finaltext );
	} else {
		return va("%s", name );
	}
}

/*
==================
UI_ArenaScriptAutoFloat
Return type char
==================
*/
float UI_ArenaScriptAutoFloat( char *name ) {

	if(trap_Cvar_VariableValue(name)){
		return trap_Cvar_VariableValue(name);
	}
		return atof(name);
}

/*
==================
UI_ArenaScriptRandom
Return random int
==================
*/
int UI_ArenaScriptRandom(int min, int max)
{
	int number;
	number = (rand() % (max - min + 1)) + (min);
	return number;
}

char *UI_Cvar_VariableString( const char *var_name ) {
	static char	buffer[MAX_STRING_CHARS];

	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );

	return buffer;
}


/*
=================
UI_ConsoleCommand
=================
*/
qboolean UI_ConsoleCommand( int realTime ) {
	int    i;
	char	*cmd;
	int number01;
	int number02;

	cmd = UI_Argv( 0 );

	// ensure minimum menu data is available
	Menu_Cache();

if ( Q_stricmp (UI_Argv(0), "mgui_load") == 0 ) {
	MGUI_Load();
	return qtrue;
}

if ( Q_stricmp (UI_Argv(0), "mgui_init") == 0 ) {
	UI_MGUI_Clear();
	trap_Cmd_ExecuteText( EXEC_NOW, "unset mgui_ingame\n");
	trap_Cmd_ExecuteText( EXEC_NOW, "unset mgui_scroll\n");
	for ( i = 1; i < 250; i++ ) {
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_type\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_acttype\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_xytype\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_x\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_y\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_whtype\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_w\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_h\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_text\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_cmd\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_1arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_2arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_3arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_4arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_5arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_6arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_7arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_8arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_9arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_10arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_11arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_12arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_13arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_14arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_15arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_16arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_17arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_18arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_19arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_20arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_21arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_22arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_23arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_24arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_25arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_26arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_27arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_28arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_29arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_30arg\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_file\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_value\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorR\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorG\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorB\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorA\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_fontsize\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_corner\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_col\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_mode\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerR\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerG\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerB\n", i));
	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerA\n", i));	
	}
	return qtrue;
}

	if ( Q_stricmp (UI_Argv(0), "remapShader") == 0 ) {
		char shader1[MAX_QPATH];
		char shader2[MAX_QPATH];
		char shader3[MAX_QPATH];

		Q_strncpyz(shader1, UI_Argv(1), sizeof(shader1));
		Q_strncpyz(shader2, UI_Argv(2), sizeof(shader2));
		Q_strncpyz(shader3, UI_Argv(3), sizeof(shader3));

		trap_R_RemapShader(shader1, shader2, shader3);

		return qtrue;
	}

	if ( Q_stricmp (UI_Argv(0), "mgui") == 0 ) {
		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript \"mgui/%s\"", UI_ConcatArgs(1)));
		return qtrue;
	}

if ( Q_stricmp (UI_Argv(0), "as_run") == 0 ) {
	if ( Q_stricmp (UI_Argv(1), "syscommand") == 0 ) {
		trap_System( va("\"%s\"", UI_ConcatArgs(2)));
	}
	if ( Q_stricmp (UI_Argv(1), "if") == 0 ) {
		if(!Q_stricmp (UI_Argv(3), "=")){
			if(!Q_stricmp (UI_ArenaScriptAutoChar( UI_Argv(2) ), UI_ArenaScriptAutoChar( UI_Argv(4) ))){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), "==")){
			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) == UI_ArenaScriptAutoInt( UI_Argv(4) )){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), "!=")){
			if(Q_stricmp (UI_ArenaScriptAutoChar( UI_Argv(2) ), UI_ArenaScriptAutoChar( UI_Argv(4) )) != 0){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), "!==")){
			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) != UI_ArenaScriptAutoInt( UI_Argv(4) )){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), "<")){
			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) < UI_ArenaScriptAutoInt( UI_Argv(4) )){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), ">")){
			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) > UI_ArenaScriptAutoInt( UI_Argv(4) )){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), "<=")){
			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) <= UI_ArenaScriptAutoInt( UI_Argv(4) )){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
		if(!Q_stricmp (UI_Argv(3), ">=")){
			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) >= UI_ArenaScriptAutoInt( UI_Argv(4) )){
				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
			}
		}
	}	
	if ( Q_stricmp (UI_Argv(1), "op") == 0 ) {
		number01 = UI_ArenaScriptAutoInt( UI_Argv(2) );
		number02 = UI_ArenaScriptAutoInt( UI_Argv(4) );
		if(!Q_stricmp (UI_Argv(3), "+=")){
			number01 += number02;
			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "-=")){
			number01 -= number02;
			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "*=")){
			number01 *= number02;
			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "/=")){
			number01 /= number02;
			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "=")){
			trap_Cvar_Set( UI_Argv(2), UI_ArenaScriptAutoChar(UI_Argv(4)) );
		}
	}
	if ( Q_stricmp (UI_Argv(1), "random") == 0 ) {
		number01 = UI_ArenaScriptAutoInt( UI_Argv(2) );
		number02 = UI_ArenaScriptRandom( atoi(UI_Argv(4)), atoi(UI_Argv(5)) );
		if(!Q_stricmp (UI_Argv(3), "=")){
			number01 = number02;
				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "+=")){
			number01 += number02;
				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "-=")){
			number01 -= number02;
				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "*=")){
			number01 *= number02;
				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
		}
		if(!Q_stricmp (UI_Argv(3), "/=")){
			number01 /= number02;
				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
		}
	}	
	if ( Q_stricmp (UI_Argv(1), "editline") == 0 ) {
	if(!Q_stricmp (UI_Argv(3), "add")){
	trap_Cvar_Set( UI_Argv(2), va("%s%s", UI_Cvar_VariableString(UI_Argv(2)), UI_ArenaScriptAutoChar( UI_Argv(3) )) );
	}
	
	if(!Q_stricmp (UI_Argv(3), "begin")){
	trap_Cvar_Set( UI_Argv(2), va("%s%s", UI_ArenaScriptAutoChar( UI_Argv(3) ), UI_Cvar_VariableString(UI_Argv(2))) );
	}
	}
	if ( Q_stricmp (UI_Argv(1), "cvar") == 0 ) {
	if(!Q_stricmp (UI_Argv(2), "delete")){
	trap_Cmd_ExecuteText( EXEC_APPEND, va("unset %s\n", UI_Argv(3)));
	}
	
	if(!Q_stricmp (UI_Argv(2), "save")){
	trap_Cmd_ExecuteText( EXEC_APPEND, va("seta %s %s\n", UI_Argv(4), UI_ArenaScriptAutoChar( UI_Argv(3) )));
	}
	
	if(!Q_stricmp (UI_Argv(2), "load")){
	trap_Cmd_ExecuteText( EXEC_APPEND, va("set %s %s\n", UI_Argv(3), UI_ArenaScriptAutoChar( UI_Argv(4) )));
	}
	}
	if ( Q_stricmp (UI_Argv(1), "for") == 0 ) {
	if(!Q_stricmp (UI_Argv(3), "==")){ 
	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i == UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
	}
	}
	if(!Q_stricmp (UI_Argv(3), "!=")){
	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i != UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
	}
	}
	if(!Q_stricmp (UI_Argv(3), "<")){
	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i < UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
	}
	}
	if(!Q_stricmp (UI_Argv(3), ">")){
	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i > UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
	}
	}
	if(!Q_stricmp (UI_Argv(3), "<=")){
	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i <= UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
	}
	}
	if(!Q_stricmp (UI_Argv(3), ">=")){
	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i >= UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
	}
	}
	}
return qtrue;
}

	if ( Q_stricmp (cmd, "workshop") == 0 ) {
		UI_WorkshopMenu();
		return qtrue;
	}
	if ( Q_stricmp (cmd, "levelselect") == 0 ) {
		UI_SPLevelMenu_f();
		return qtrue;
	}
	if ( Q_stricmp (cmd, "reloadgame") == 0 ) {
		MainMenu_ReloadGame();
		return qtrue;
	}
	if ( Q_stricmp (cmd, "secretmenu") == 0 ) {
		UI_SpecifyLeagueMenu();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "postgame") == 0 ) {
		UI_SPPostgameMenu_f();
		return qtrue;
	}
	
	if ( Q_stricmp (cmd, "menuback") == 0 ) {
		UI_PopMenu();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
		UI_Cache_f();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "save_menu") == 0 ) {
		UI_CinematicsMenu_f(0);
		return qtrue;
	}
	
	if ( Q_stricmp (cmd, "load_menu") == 0 ) {
		UI_CinematicsMenu_f(1);
		return qtrue;
	}

	if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
		UI_BotCommandMenu_f();
		return qtrue;
	}
	
	if ( Q_stricmp (cmd, "ui_sandbox") == 0 ) {
		UI_SandboxMainMenu();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "iamacheater") == 0 ) {
		UI_SPUnlock_f();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "iamamonkey") == 0 ) {
		UI_SPUnlockMedals_f();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "ui_cdkey") == 0 ) {
		UI_CDKeyMenu_f();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "uie_kickdupe") == 0 ) {
		UI_SPKickDupe_f();
		return qtrue;
	}

	return qfalse;
}

/*
================
UI_ScreenOffset

Adjusted for resolution and screen aspect ratio
================
*/
void UI_ScreenOffset( void ) {
	float scrx;
	float scry;
	
	trap_GetGlconfig( &uis.glconfig );
	
	scrx = uis.glconfig.vidWidth;
	scry = uis.glconfig.vidHeight;
	
	if(cl_screencustomoffset.integer <= -1){
	if((scrx / (scry / 480)-640)/2 >= 0){
	trap_Cvar_SetValue("cl_screenoffset", (scrx / (scry / 480)-640)/2);
	uis.activemenu->errorui = qfalse;
	} else {
	trap_Cvar_SetValue("cl_screenoffset", 0);	
	uis.activemenu->errorui = qtrue;
	}
	} else {
	trap_Cvar_SetValue("cl_screenoffset", cl_screencustomoffset.value);	
	}
}

/*
=================
UI_Shutdown
=================
*/
void UI_Shutdown( void ) {
}

/*
=================
UI_Init
=================
*/
void UI_Init( void ) {
	
	UI_RegisterCvars();

	UI_InitGameinfo();

	// cache redundant calulations
	trap_GetGlconfig( &uis.glconfig );
	

	// for native screen
	uis.sw = uis.glconfig.vidWidth;
	uis.sh = uis.glconfig.vidHeight;
	//uis.scale = uis.glconfig.vidHeight * (1.0/uis.glconfig.vidHeight);
	//uis.bias = 0;
	// for 640x480 virtualized screen
	uis.scale = uis.glconfig.vidHeight * (1.0/480.0);
	if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
		// wide screen
		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0/480.0) ) );
		uis.scale = uis.scale;
	}
	else {
		// no wide screen
		uis.bias = 0;
	}

	// initialize the menu system
	Menu_Cache();

	uis.activemenu = NULL;
	uis.menusp     = 0;
}

/*
================
UI_AdjustFrom640

Adjusted for resolution and screen aspect ratio
================
*/
void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
	// expect valid pointers
	*x = *x * uis.scale + uis.bias;
	*y *= uis.scale;
	*y += uis.menuscroll;
	*w *= uis.scale;
	*h *= uis.scale;
}


void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
	qhandle_t	hShader;

	hShader = trap_R_RegisterShaderNoMip( picname );
	UI_AdjustFrom640( &x, &y, &width, &height );
	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
}

void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
	float	s0;
	float	s1;
	float	t0;
	float	t1;

	if( w < 0 ) {	// flip about vertical
		w  = -w;
		s0 = 1;
		s1 = 0;
	}
	else {
		s0 = 0;
		s1 = 1;
	}

	if( h < 0 ) {	// flip about horizontal
		h  = -h;
		t0 = 1;
		t1 = 0;
	}
	else {
		t0 = 0;
		t1 = 1;
	}
	
	UI_AdjustFrom640( &x, &y, &w, &h );
	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
}

void UI_DrawHandleModel( float x, float y, float w, float h, const char* model, int scale ) {
	refdef_t		refdef;
	refEntity_t		ent;
	vec3_t			origin;
	vec3_t			angles;
	
	// setup the refdef

	memset( &refdef, 0, sizeof( refdef ) );
	refdef.rdflags = RDF_NOWORLDMODEL;
	AxisClear( refdef.viewaxis );

	UI_AdjustFrom640( &x, &y, &w, &h );
	refdef.x = x;
	refdef.y = y;
	refdef.width = w;
	refdef.height = h;

	refdef.fov_x = 90;
	refdef.fov_y = 90;

	refdef.time = uis.realtime;

	origin[0] = scale;
	origin[1] = 0;
	origin[2] = 0;

	trap_R_ClearScene();

	// add the model

	memset( &ent, 0, sizeof(ent) );

	VectorSet( angles, 0, 180 - 6, 0 );
	AnglesToAxis( angles, ent.axis );
	ent.hModel = trap_R_RegisterModel( model );
	VectorCopy( origin, ent.origin );
	VectorCopy( origin, ent.lightingOrigin );
	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
	VectorCopy( ent.origin, ent.oldorigin );

	trap_R_AddRefEntityToScene( &ent );

	trap_R_RenderScene( &refdef );
}

void UI_DrawBackgroundPic( qhandle_t hShader ) {
	trap_R_DrawStretchPic( 0.0, 0.0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, hShader );
}

int vx(float cord) {
    float pos = uis.sw / 100.0; 
    int result = cord * pos;
	return result;
}

int vy(float cord) {
    float pos = uis.sh / 100.0;  
    int result = cord * pos;
	return result;
}

int vxcalc(float cord_percent) {
    float scale_x = (float)uis.sw / 1920.0f; // Масштабный коэффициент для ширины экрана
    int result = (int)(cord_percent * scale_x); // Масштабируем процентную координату по ширине экрана
    return result;
}

int vycalc(float cord_percent) {
    float scale_y = (float)uis.sh / 1080.0f; // Масштабный коэффициент для высоты экрана
    int result = (int)(cord_percent * scale_y); // Масштабируем процентную координату по высоте экрана
    return result;
}

/*
================
UI_FillRect2

Coordinates are 640*480 virtual values
=================
*/
void UI_FillRect2( float x, float y, float width, float height, const float *color ) {
	trap_R_SetColor( color );

	//UI_AdjustFrom640( &x, &y, &width, &height );
	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );

	trap_R_SetColor( NULL );
}

void UI_DrawRoundedRect(float x, float y, float width, float height, float radius, const float *color) {
    
	UI_AdjustFrom640( &x, &y, &width, &height );
	
	if(radius*2 > height){ radius=height*0.5; }
	if(radius*2 > width){ radius=width*0.5; }
	
	// Рисование углов
	UI_SetColor( color );
    trap_R_DrawStretchPic(x, y, radius, radius, 1, 0, 0, 1, uis.corner); // Левый верхний угол
    trap_R_DrawStretchPic(x + width - radius, y, radius, radius, 0, 0, 1, 1, uis.corner); // Правый верхний угол
    trap_R_DrawStretchPic(x, y + height - radius, radius, radius, 1, 1, 0, 0, uis.corner); // Левый нижний угол
    trap_R_DrawStretchPic(x + width - radius, y + height - radius, radius, radius, 0, 1, 1, 0, uis.corner); // Правый нижний угол

    // Рисование боковых сторон
    UI_FillRect2(x, y + radius, radius, height - (radius * 2), color); // Левая сторона
    UI_FillRect2(x + width - radius, y + radius, radius, height - (radius * 2), color); // Правая сторона
    UI_FillRect2(x + radius, y, width - (radius * 2), height, color); // Верхняя сторона
}

/*
================
UI_FillRect

Coordinates are 640*480 virtual values
=================
*/
void UI_FillRect( float x, float y, float width, float height, const float *color ) {
	trap_R_SetColor( color );

	UI_AdjustFrom640( &x, &y, &width, &height );
	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );

	trap_R_SetColor( NULL );
}

/*
================
UI_DrawRect

Coordinates are 640*480 virtual values
=================
*/
void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
	trap_R_SetColor( color );

	UI_AdjustFrom640( &x, &y, &width, &height );

	trap_R_DrawStretchPic( x, y, width, 1, 0, 0, 0, 0, uis.whiteShader );
	trap_R_DrawStretchPic( x, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
	trap_R_DrawStretchPic( x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader );
	trap_R_DrawStretchPic( x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader );

	trap_R_SetColor( NULL );
}

void UI_SetColor( const float *rgba ) {
	trap_R_SetColor( rgba );
}

void UI_UpdateScreen( void ) {
	trap_UpdateScreen();
}

/*
=================
UI_Refresh
=================
*/
void UI_Refresh( int realtime )
{
	uis.frametime = realtime - uis.realtime;
	uis.realtime  = realtime;

	if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
		return;
	}

	UI_UpdateCvars();

	if ( uis.activemenu )
	{
		if (uis.activemenu->fullscreen)
		{
// draw the background
trap_R_DrawStretchPic( 0.0, 0.0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, trap_R_RegisterShaderNoMip( va( "UserFiles/Mainmenu/MenuPic (%i).jpg", ui_backcolors.integer ) ) );
trap_R_DrawStretchPic( 0.0, 0.0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 0.5, 1, trap_R_RegisterShaderNoMip( "menu/art/blacktrans" ) );
			}
//			UI_DrawBackgroundPic( uis.menuBackShaders );
//			}
//		}

		if (uis.activemenu->draw)
			uis.activemenu->draw();
		else
			Menu_Draw( uis.activemenu );

		if( uis.firstdraw ) {
			UI_MouseEvent( 0, 0 );
			uis.firstdraw = qfalse;
		}
	}
	
	trap_GetGlconfig( &uis.glconfig );

	if(!uis.activemenu->errorui){	
	if(uis.activemenu->native > 0){
		uis.scale = uis.glconfig.vidHeight * (1.0/uis.glconfig.vidHeight);
		uis.bias = 0;
	} else {
		if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
		// wide screen
		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0/480.0) ) );
		uis.scale = uis.glconfig.vidHeight * (1.0/480.0);
		}
		else {
		// no wide screen
		uis.bias = 0;
		}
	}
	}
	if(uis.activemenu->errorui){	
		uis.scale = uis.glconfig.vidWidth * (1.0/640);
		uis.bias = 0;
	}

	// draw cursor
	if (!uis.hideCursor) {
		UI_SetColor( NULL );
		UI_DrawHandlePic( uis.cursorx-16, uis.cursory-16, 32, 32, uis.cursor);
	}

#ifndef NDEBUG
	if (uis.debug)
	{
		// cursor coordinates
		UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
	}
#endif

	// delay playing the enter sound until after the
	// menu has been drawn, to avoid delay while
	// caching images
	if (m_entersound)
	{
		trap_S_StartLocalSound( menu_in_sound, CHAN_LOCAL_SOUND );
		m_entersound = qfalse;
	}
	
	// initialize the screen offset
	UI_ScreenOffset();
}

void UI_DrawTextBox (int x, int y, int width, int lines)
{
	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
}

qboolean UI_CursorInRect (int x, int y, int width, int height)
{
	if (uis.cursorx < x ||
		uis.cursory < y ||
		uis.cursorx > x+width ||
		uis.cursory > y+height)
		return qfalse;

	return qtrue;
}
