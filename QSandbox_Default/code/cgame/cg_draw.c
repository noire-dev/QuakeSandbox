/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
//
// cg_draw.c -- draw all of the graphical elements during
// active (after loading) gameplay

#include "cg_local.h"

#ifdef MISSIONPACK
#include "../ui/ui_shared.h"

// used for scoreboard
extern displayContextDef_t cgDC;
menuDef_t *menuScoreboard = NULL;
#else
int drawTeamOverlayModificationCount = -1;
#endif

int sortedTeamPlayers[TEAM_MAXOVERLAY];
int	numSortedTeamPlayers;

char systemChat[256];
char teamChat1[256];
char teamChat2[256];

#ifdef MISSIONPACK

int CG_Text_Width(const char *text, float scale, int limit) {
  int count,len;
	float out;
	glyphInfo_t *glyph;
	float useScale;
// FIXME: see ui_main.c, same problem
//	const unsigned char *s = text;
	const char *s = text;
	fontInfo_t *font = &cgDC.Assets.textFont;
	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;
  out = 0;
  if (text) {
    len = strlen(text);
		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;
		while (s && *s && count < len) {
			if ( Q_IsColorString(s) ) {
				s += 2;
				continue;
			} else {
				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
				out += glyph->xSkip;
				s++;
				count++;
			}
    }
  }
  return out * useScale;
}

int CG_Text_Height(const char *text, float scale, int limit) {
  int len, count;
	float max;
	glyphInfo_t *glyph;
	float useScale;
// TTimo: FIXME
//	const unsigned char *s = text;
	const char *s = text;
	fontInfo_t *font = &cgDC.Assets.textFont;
	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;
  max = 0;
  if (text) {
    len = strlen(text);
		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;
		while (s && *s && count < len) {
			if ( Q_IsColorString(s) ) {
				s += 2;
				continue;
			} else {
				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
	      if (max < glyph->height) {
		      max = glyph->height;
			  }
				s++;
				count++;
			}
    }
  }
  return max * useScale;
}

void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
  float w, h;
  w = width * scale;
  h = height * scale;
  CG_AdjustFrom640( &x, &y, &w, &h );
  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
}

void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
  int len, count;
	vec4_t newColor;
	glyphInfo_t *glyph;
	float useScale;
	fontInfo_t *font = &cgDC.Assets.textFont;
	if (scale <= cg_smallFont.value) {
		font = &cgDC.Assets.smallFont;
	} else if (scale > cg_bigFont.value) {
		font = &cgDC.Assets.bigFont;
	}
	useScale = scale * font->glyphScale;
  if (text) {
// TTimo: FIXME
//		const unsigned char *s = text;
		const char *s = text;
		trap_R_SetColor( color );
		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
    len = strlen(text);
		if (limit > 0 && len > limit) {
			len = limit;
		}
		count = 0;
		while (s && *s && count < len) {
			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
			if ( Q_IsColorString( s ) ) {
				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
				newColor[3] = color[3];
				trap_R_SetColor( newColor );
				s += 2;
				continue;
			} else {
				float yadj = useScale * glyph->top;
				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
					colorBlack[3] = newColor[3];
					trap_R_SetColor( colorBlack );
					CG_Text_PaintChar(x + ofs, y - yadj + ofs,
														glyph->imageWidth,
														glyph->imageHeight,
														useScale,
														glyph->s,
														glyph->t,
														glyph->s2,
														glyph->t2,
														glyph->glyph);
					colorBlack[3] = 1.0;
					trap_R_SetColor( newColor );
				}
				CG_Text_PaintChar(x, y - yadj,
													glyph->imageWidth,
													glyph->imageHeight,
													useScale,
													glyph->s,
													glyph->t,
													glyph->s2,
													glyph->t2,
													glyph->glyph);
				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
				x += (glyph->xSkip * useScale) + adjust;
				s++;
				count++;
			}
    }
	  trap_R_SetColor( NULL );
  }
}


#endif

static void CG_DrawField (int x, int y, int width, int value, float size) {
	char	num[16], *ptr;
	int		l;
	int		frame;

	if ( width < 1 ) {
		return;
	}

	// draw number string
	if ( width > 6 ) {
		width = 6;
	}

	switch ( width ) {
	case 1:
		value = value > 9 ? 9 : value;
		value = value < 0 ? 0 : value;
		break;
	case 2:
		value = value > 99 ? 99 : value;
		value = value < -9 ? -9 : value;
		break;
	case 3:
		value = value > 999 ? 999 : value;
		value = value < -99 ? -99 : value;
		break;
	case 4:
		value = value > 9999 ? 9999 : value;
		value = value < -999 ? -999 : value;
		break;
	case 5:
		value = value > 99999 ? 99999 : value;
		value = value < -9999 ? -9999 : value;
		break;
	}

	Com_sprintf (num, sizeof(num), "%i", value);
	l = strlen(num);
	if (l > width)
		l = width;
	x += 2 + CHAR_WIDTH*(width - l)*size;

	ptr = num;
	while (*ptr && l)
	{
		if (*ptr == '-')
			frame = STAT_MINUS;
		else
			frame = *ptr -'0';

		CG_DrawPic( x,y, CHAR_WIDTH*size, CHAR_HEIGHT*size, cgs.media.numberShaders[frame] );
		x += CHAR_WIDTH*size;
		ptr++;
		l--;
	}
}

/*
================
CG_Draw3DModel

================
*/
void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
	refdef_t		refdef;
	refEntity_t		ent;

	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
		return;
	}

	CG_AdjustFrom640( &x, &y, &w, &h );

	memset( &refdef, 0, sizeof( refdef ) );

	memset( &ent, 0, sizeof( ent ) );
	AnglesToAxis( angles, ent.axis );
	VectorCopy( origin, ent.origin );
	ent.hModel = model;
	ent.customSkin = skin;
	ent.shaderRGBA[0] = cg_helightred.integer;
	ent.shaderRGBA[1] = cg_helightgreen.integer;
	ent.shaderRGBA[2] = cg_helightblue.integer;
	ent.shaderRGBA[3] = 255;
	ent.renderfx = RF_NOSHADOW;		// no stencil shadows

	refdef.rdflags = RDF_NOWORLDMODEL;

	AxisClear( refdef.viewaxis );

	refdef.fov_x = 30;
	refdef.fov_y = 30;

	refdef.x = x;
	refdef.y = y;
	refdef.width = w;
	refdef.height = h;

	refdef.time = cg.time;

	trap_R_ClearScene();
	trap_R_AddRefEntityToScene( &ent );
	trap_R_RenderScene( &refdef );
}

void CG_Draw3DModelCopy( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
	refdef_t		refdef;
	refEntity_t		ent;

	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
		return;
	}

	CG_AdjustFrom640( &x, &y, &w, &h );

	memset( &refdef, 0, sizeof( refdef ) );

	memset( &ent, 0, sizeof( ent ) );
	AnglesToAxis( angles, ent.axis );
	VectorCopy( origin, ent.origin );
	ent.hModel = model;
	//ent.customSkin = skin;
	ent.shaderRGBA[0] = 0;
	ent.shaderRGBA[1] = 0;
	ent.shaderRGBA[2] = 0;
	ent.shaderRGBA[3] = 255;
	ent.renderfx = RF_NOSHADOW;		// no stencil shadows

	refdef.rdflags = RDF_NOWORLDMODEL;

	AxisClear( refdef.viewaxis );

	refdef.fov_x = 90;
	refdef.fov_y = 90;

ent.reType = RT_MODEL;
ent.customSkin = trap_R_RegisterSkin(va("%s/%s.skin", sb_texture_view.string, sb_texturename.string));
if(sb_texturename.integer > 0){		
ent.customShader = trap_R_RegisterShader(va("%s/%s", sb_texture_view.string, sb_texturename.string));
}					
if(sb_texturename.integer == 255){	
ent.customShader = cgs.media.ptexShader[1];
}

	refdef.x = x;
	refdef.y = y;
	refdef.width = w;
	refdef.height = h;

	refdef.time = cg.time;

	trap_R_ClearScene();
	trap_R_AddRefEntityToScene( &ent );
	trap_R_RenderScene( &refdef );
}

/*
================
CG_DrawHead

Used for both the status bar and the scoreboard
================
*/
void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
	clipHandle_t	cm;
	clientInfo_t	*ci;
	float			len;
	vec3_t			origin;
	vec3_t			mins, maxs;

	ci = &cgs.clientinfo[ clientNum ];

	if ( cg_draw3dIcons.integer ) {
		cm = ci->headModel;
		if ( !cm ) {
			return;
		}

		// offset the origin y and z to center the head
		trap_R_ModelBounds( cm, mins, maxs );

		origin[2] = -0.5 * ( mins[2] + maxs[2] );
		origin[1] = 0.5 * ( mins[1] + maxs[1] );

		// calculate distance so the head nearly fills the box
		// assume heads are taller than wide
		len = 0.7 * ( maxs[2] - mins[2] );
		origin[0] = len / 0.268;	// len / tan( fov/2 )

		// allow per-model tweaking
		VectorAdd( origin, ci->headOffset, origin );

		CG_Draw3DModel( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles );
	} else if ( cg_drawIcons.integer ) {
		CG_DrawPic( x, y, w, h, ci->modelIcon );
	}

	// if they are deferred, draw a cross out
	if ( ci->deferred ) {
		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
	}
}

/*
================
CG_DrawFlagModel

Used for both the status bar and the scoreboard
================
*/
void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
	qhandle_t		cm;
	float			len;
	vec3_t			origin, angles;
	vec3_t			mins, maxs;
	qhandle_t		handle;

	if ( !force2D && cg_draw3dIcons.integer ) {

		VectorClear( angles );

		cm = cgs.media.redFlagModel;

		// offset the origin y and z to center the flag
		trap_R_ModelBounds( cm, mins, maxs );

		origin[2] = -0.5 * ( mins[2] + maxs[2] );
		origin[1] = 0.5 * ( mins[1] + maxs[1] );

		// calculate distance so the flag nearly fills the box
		// assume heads are taller than wide
		len = 0.5 * ( maxs[2] - mins[2] );
		origin[0] = len / 0.268;	// len / tan( fov/2 )

		angles[YAW] = 60 * sin( cg.time / 2000.0 );;

		if( team == TEAM_RED ) {
			handle = cgs.media.redFlagModel;
			if(cgs.gametype == GT_DOUBLE_D){
				if(cgs.redflag == TEAM_BLUE)
					handle = cgs.media.blueFlagModel;
				if(cgs.redflag == TEAM_FREE)
					handle = cgs.media.neutralFlagModel;
				if(cgs.redflag == TEAM_NONE)
					handle = cgs.media.neutralFlagModel;
			}
		} else if( team == TEAM_BLUE ) {
			handle = cgs.media.blueFlagModel;
			if(cgs.gametype == GT_DOUBLE_D){
				if(cgs.redflag == TEAM_BLUE)
					handle = cgs.media.blueFlagModel;
				if(cgs.redflag == TEAM_FREE)
					handle = cgs.media.neutralFlagModel;
				if(cgs.redflag == TEAM_NONE)
					handle = cgs.media.neutralFlagModel;
			}
		} else if( team == TEAM_FREE ) {
			handle = cgs.media.neutralFlagModel;
		} else {
			return;
		}
		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
	} else if ( cg_drawIcons.integer ) {
		gitem_t *item;

		if( team == TEAM_RED ) {
			item = BG_FindItemForPowerup( PW_REDFLAG );
		} else if( team == TEAM_BLUE ) {
			item = BG_FindItemForPowerup( PW_BLUEFLAG );
		} else if( team == TEAM_FREE ) {
			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
		} else {
			return;
		}
		if (item) {
		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
		}
	}
}

void CG_DrawEmptyModel( float x, float y, float w, float h, int team, qboolean force2D ) {
	qhandle_t		cm;
	float			len;
	vec3_t			origin, angles;
	vec3_t			mins, maxs;
	qhandle_t		handle;

	VectorClear( angles );

	cm = cgs.media.redFlagModel;

	// offset the origin y and z to center the flag
	trap_R_ModelBounds( cm, mins, maxs );

	origin[2] = -0.5 * ( mins[2] + maxs[2] );
	origin[1] = 0.5 * ( mins[1] + maxs[1] );

	// calculate distance so the flag nearly fills the box
	// assume heads are taller than wide
	len = 0.5 * ( maxs[2] - mins[2] );
	origin[0] = len / 0.268;	// len / tan( fov/2 )

	angles[YAW] = 60 * sin( cg.time / 2000.0 );;

	handle = trap_R_RegisterModel_MiTech( "models/weapons2/gauntlet/gauntlet.md3" );
	
	CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
}

/*
================
CG_DrawStatusBarFlag

================
*/
static void CG_DrawStatusBarFlag( int team, int show ) {
	if(show >= 1){
	CG_DrawFlagModel( 0 - cl_screenoffset.integer, 480 - ICON_SIZE - 35, ICON_SIZE, ICON_SIZE, team, qfalse );
	} else {
	CG_DrawEmptyModel( 0 - cl_screenoffset.integer, 480 - ICON_SIZE - 35, ICON_SIZE, ICON_SIZE, team, qfalse );
	CG_DrawEmptyModel( 640 + cl_screenoffset.integer - ICON_SIZE - 35, 480 - ICON_SIZE - 35, ICON_SIZE, ICON_SIZE, team, qfalse );
	}
}

/*
================
CG_DrawTeamBackground

================
*/
void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
{
	vec4_t		hcolor;

	hcolor[3] = alpha;
	if ( team == TEAM_RED ) {
		hcolor[0] = 1;
		hcolor[1] = 0;
		hcolor[2] = 0;
	} else if ( team == TEAM_BLUE ) {
		hcolor[0] = 0;
		hcolor[1] = 0;
		hcolor[2] = 1;
	} else {
		return;
	}
	trap_R_SetColor( hcolor );
//	CG_DrawPic( 0 - cgs.glconfig.vidWidth, y, cgs.glconfig.vidWidth * 2, cgs.glconfig.vidHeight, cgs.media.teamStatusBar );
	trap_R_SetColor( NULL );
}

static void CG_DrawToolgun() {
	float y;
	vec3_t		angles;
	vec3_t		origin;
	gitem_t	*it;
		
		CG_DrawPic( -1 - cl_screenoffset.integer, 0+cg_toolguninfo.integer, 300, 125, trap_R_RegisterShaderNoMip( "menu/art/blacktrans" ) );
		
		if(oasb_tool.integer == 1){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Material", 1.0F);
		}
		if(oasb_tool.integer == 2){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Delete", 1.0F);
		}
		if(oasb_tool.integer == 3){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Model", 1.0F);
		}
		if(oasb_tool.integer == 4){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Physics", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Stationary", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Gravity", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1.Stationary", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2.Gravity", 1.0F);
		}
		if(oasb_tool.integer == 5){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Permission", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Public", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Private", 1.0F);
			}
			if(oasb_modifier.integer == 2){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Get", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1.Public", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2.Private", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "3.Get", 1.0F);
		}
		if(oasb_tool.integer == 6){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Collision", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "On", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Off", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1.On", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2.Off", 1.0F);
		}
		if(oasb_tool.integer == 7){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Health", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Set", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Not allow damage", 1.0F);
			}
			if(oasb_modifier.integer == 2){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Allow damage", 1.0F);
			}
			if(oasb_modifier.integer == 3){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Not allow prop damage", 1.0F);
			}
			if(oasb_modifier.integer == 4){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Allow prop damage", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1.Set", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2.Not allow damage", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "3.Allow damage", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "4.Not allow prop damage", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "5.Allow prop damage", 1.0F);
		}
		if(oasb_tool.integer == 8){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Color", 1.0F);
		}
		if(oasb_tool.integer == 9){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Angles", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "X", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Y", 1.0F);
			}
			if(oasb_modifier.integer == 2){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Z", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1.X", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2.Y", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "3.Z", 1.0F);
		}
		if(oasb_tool.integer == 10){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Physgun", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Stationary", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Gravity", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1.Stationary", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2.Gravity", 1.0F);
		}
		
		if(oasb_tool.integer == 11){
			CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, "Scale", 1.0F);
			if(oasb_modifier.integer == 0){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "X", 1.0F);
			}
			if(oasb_modifier.integer == 1){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Y", 1.0F);
			}
			if(oasb_modifier.integer == 2){
			CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, "Z", 1.0F);
			}
			y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, "1. X", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "2. Y", 1.0F);
			y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, "3. Z", 1.0F);
		}

		origin[0] = 70;
		origin[1] = 0;
		origin[2] = 0;
		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
		if(!BG_CheckClassname(sb_classnum_view.string)){
		CG_Draw3DModelCopy( 640 + cl_screenoffset.integer - TEXT_ICON_SPACE  - 160, 1 + 12, 160, 160,
					   trap_R_RegisterModel_MiTech( oasb_modelst.string ), 0, origin, angles );
		} else {
		for ( it = bg_itemlist + 1 ; it->classname ; it++ ) {
		if ( !Q_stricmp( it->classname, sb_classnum_view.string ) )
				CG_Draw3DModelCopy( 640 + cl_screenoffset.integer - TEXT_ICON_SPACE  - 160, 1 + 12, 160, 160,
					   trap_R_RegisterModel_MiTech( it->world_model[0] ), 0, origin, angles );	
		}
	}	
}

static void CG_DrawStatusElement( float x, float y, int value, const char *text ) {
	vec4_t         colornorm;
	vec4_t         colorlow;
	vec4_t         colorblk;
	
	colornorm[0]=cg_crosshairColorRed.value;
	colornorm[1]=cg_crosshairColorGreen.value;
	colornorm[2]=cg_crosshairColorBlue.value;
	colornorm[3]=1.0f;
	
	colorblk[0]=0.0f;
	colorblk[1]=0.0f;
	colorblk[2]=0.0f;
	colorblk[3]=0.20f;
	
	CG_DrawRoundedRect(x, y, 110, 32, 6, colorblk);
	CG_DrawStringExt( x+3, y+20, text, colornorm, qfalse, qfalse, 6, 7, 0 );
	trap_R_SetColor( colornorm );
	CG_DrawField ( x+43, y+9, 4, value, 0.80);
}

/*
================
CG_DrawStatusBar

================
*/
static void CG_DrawStatusBar( void ) {
	centity_t	*cent;
	playerState_t	*ps;
	int			value;
	clientInfo_t	*ci;
	int				weaphack;

	if ( cg_drawStatus.integer == 0 ) {
		return;
	}

	cent = &cg_entities[cg.snap->ps.clientNum];
	ps = &cg.snap->ps;
	
	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
	
	if(ci->swepid >= 1){
	weaphack = ci->swepid;
	} else {
	weaphack = cent->currentState.weapon;
		}

	// draw any 3D icons first, so the changes back to 2D are minimized
	if (weaphack) {
		if(weaphack == WP_GAUNTLET){
			if(oasb_tool.integer){
				CG_DrawToolgun();
		}
		}
	}


	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
		CG_DrawStatusBarFlag( TEAM_RED, 1 );
	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
		CG_DrawStatusBarFlag( TEAM_BLUE, 1 );
	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
		CG_DrawStatusBarFlag( TEAM_FREE, 1 ); 
	}

	//
	// ammo
	//
	if ( weaphack ) {
		if(ps->stats[STAT_SWEP] <= 15){
		value = ps->ammo[cent->currentState.weapon];
		} else {
		value = ps->stats[STAT_SWEPAMMO];
		if(value <= 0){
		cg.swep_listcl[ps->stats[STAT_SWEP]] = 2;
		} else {
		cg.swep_listcl[ps->stats[STAT_SWEP]] = 1;	
		}
		}
		if ( value > -1 ) {
		if(cl_language.integer == 0){
		CG_DrawStatusElement(628+cl_screenoffset.integer-110, 440, value, "AMMO");
		}
		if(cl_language.integer == 1){
		CG_DrawStatusElement(628+cl_screenoffset.integer-110, 440, value, "ПАТРОНЫ");
		}
		}
	}
	
	CG_DrawStatusBarFlag( TEAM_FREE, 0 );		//android buttons fix

	//
	// health
	//
	value = ps->stats[STAT_HEALTH];
	if(cl_language.integer == 0){
	CG_DrawStatusElement(12-cl_screenoffset.integer, 440, value, "HEALTH");
	}
	if(cl_language.integer == 1){
	CG_DrawStatusElement(12-cl_screenoffset.integer, 440, value, "ЖИЗНИ");
	}
		
	//
	// armor
	//
	value = ps->stats[STAT_ARMOR];
	if (value > 0 ) {
		if(cl_language.integer == 0){
		CG_DrawStatusElement(22-cl_screenoffset.integer+110, 440, value, "ARMOR");
		}
		if(cl_language.integer == 1){
		CG_DrawStatusElement(22-cl_screenoffset.integer+110, 440, value, "БРОНЯ");
		}
	}

        //Skulls!
	if(cgs.gametype == GT_HARVESTER) {
            value = ps->generic1;
            if (value > 0 ) {
				if(cl_language.integer == 0){
				CG_DrawStatusElement(32-cl_screenoffset.integer+220, 440, value, "SKULLS");
				}
				if(cl_language.integer == 1){
				CG_DrawStatusElement(32-cl_screenoffset.integer+220, 440, value, "ЧЕРЕПА");
				}
            }
        }
}

/*
===========================================================================================

  UPPER RIGHT CORNER

===========================================================================================
*/

/*
================
CG_DrawSpeedMeter

================
*/
static float CG_DrawSpeedMeter( float y ) {
	char        *s;
	int         w;
	vec_t       *vel;
	int         speed;

	/* speed meter can get in the way of the scoreboard */
	if ( cg.scoreBoardShowing ) {
		return y;
	}

	vel = cg.snap->ps.velocity;
	/* ignore vertical component of velocity */
	speed = sqrt(vel[0] * vel[0] + vel[1] * vel[1]);

	s = va( "%iu/s", speed );

	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	if (cg_drawSpeed.integer == 1) {
		/* top left-hand corner of screen */
		CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
		return y + BIGCHAR_HEIGHT + 4;
	} else {
		/* center of screen */
		CG_DrawBigString( 320 - w / 2, 300, s, 1.0F);
		return y;
	}
}

/*
==================
CG_DrawSnapshot
==================
*/
static float CG_DrawSnapshot( float y ) {
	char		*s;
	int			w;

	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime,
		cg.latestSnapshotNum, cgs.serverCommandSequence );
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);

	return y + BIGCHAR_HEIGHT + 4;
}

/*
==================
CG_DrawFPS
==================
*/
#define	FPS_FRAMES	4
static float CG_DrawFPS( float y ) {
	char		*s;
	int			w;
	static int	previousTimes[FPS_FRAMES];
	static int	index;
	int		i, total;
	int		fps;
	static	int	previous;
	int		t, frameTime;

	// don't use serverTime, because that will be drifting to
	// correct for internet lag changes, timescales, timedemos, etc
	t = trap_Milliseconds();
	frameTime = t - previous;
	previous = t;

	previousTimes[index % FPS_FRAMES] = frameTime;
	index++;
	if ( index > FPS_FRAMES ) {
		// average multiple frames together to smooth changes out a bit
		total = 0;
		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
			total += previousTimes[i];
		}
		if ( !total ) {
			total = 1;
		}
		fps = 1000 * FPS_FRAMES / total;

		s = va( "%ifps", fps );
		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

		CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
	}

	return y + BIGCHAR_HEIGHT + 4;
}

/*
=================
CG_DrawTimer
=================
*/
static float CG_DrawTimer( float y ) {
	char		*s;
	int			w;
	int			mins, seconds, tens;
	int			msec;

	msec = cg.time - cgs.levelStartTime;

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60;
	tens = seconds / 10;
	seconds -= tens * 10;

	s = va( "%i:%i%i", mins, tens, seconds );
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);

	return y + BIGCHAR_HEIGHT + 4;
}

static float CG_DrawZombieRound( float y ) {
	char		*s;
	int			w;
	int			mins, seconds, tens;
	int			msec;

	msec = cg.time - cgs.levelStartTime;

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60;
	tens = seconds / 10;
	seconds -= tens * 10;

if(mins == mod_zround + 1){
	mod_zround += 1;
	trap_SendConsoleCommand("zombieroundend \n");
}
if(cl_language.integer == 0){
	s = va( "Round:%i", mod_zround );
}
if(cl_language.integer == 1){
	s = va( "Раунд:%i", mod_zround );
}
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);

	return y + BIGCHAR_HEIGHT + 4;
}

static float CG_DrawCustomRound( float y ) {
	char		*s;
	int			w;
	int			mins, seconds, tens;
	int			msec;

	msec = cg.time - cgs.levelStartTime;

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60;
	tens = seconds / 10;
	seconds -= tens * 10;
	
if(cl_language.integer == 0){
	s = va( "Round:%i", mod_zround );
}
if(cl_language.integer == 1){
	s = va( "Раунд:%i", mod_zround );
}
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);

	return y + BIGCHAR_HEIGHT + 4;
}

/*
=================
CG_DrawLMSmode
=================
*/

static float CG_DrawLMSmode( float y ) {
	char		*s;
	int		w;

	if(cgs.lms_mode == 0) {
		s = va("LMS: Point/round + OT");
	} else
	if(cgs.lms_mode == 1) {
		s = va("LMS: Point/round - OT");
	} else
	if(cgs.lms_mode == 2) {
		s = va("LMS: Point/kill + OT");
	} else
	if(cgs.lms_mode == 3) {
		s = va("LMS: Point/kill - OT");
	} else
		s = va("LMS: Unknown mode");

	w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
	CG_DrawSmallString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);

	return y + SMALLCHAR_HEIGHT+4;
}

/*
=================
CG_DrawCTFoneway
=================
*/

static float CG_DrawCTFoneway( float y ) {
	char		*s;
	int		w;
	vec4_t		color;

	if(cgs.gametype != GT_CTF_ELIMINATION)
		return y;

	memcpy(color,g_color_table[ColorIndex(COLOR_WHITE)],sizeof(color));

	if( (cgs.elimflags&EF_ONEWAY)==0) {
		return y; //nothing to draw
	} else
	if(cgs.attackingTeam == TEAM_BLUE) {
		memcpy(color,g_color_table[ColorIndex(COLOR_BLUE)],sizeof(color));
		s = va("Blue team on offence");
	} else
	if(cgs.attackingTeam == TEAM_RED) {
		memcpy(color,g_color_table[ColorIndex(COLOR_RED)],sizeof(color));
		s = va("Red team on offence");
	} else
		s = va("Unknown team on offence");

	w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
	CG_DrawSmallStringColor( 635 + cl_screenoffset.integer - w, y + 2, s, color);

	return y + SMALLCHAR_HEIGHT+4;
}

/*
=================
CG_DrawDomStatus
=================
*/

static float CG_DrawDomStatus( float y ) {
	int 		i,w;
	char		*s;
	vec4_t		color;

	for(i = 0;i < cgs.domination_points_count;i++) {
		switch(cgs.domination_points_status[i]) {
			case TEAM_RED:
				memcpy(color,g_color_table[ColorIndex(COLOR_RED)],sizeof(color));
				break;
			case TEAM_BLUE:
				memcpy(color,g_color_table[ColorIndex(COLOR_BLUE)],sizeof(color));
				break;
			default:
				memcpy(color,g_color_table[ColorIndex(COLOR_WHITE)],sizeof(color));
				break;
		}

		s = va("%s",cgs.domination_points_names[i]);
		w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
		CG_DrawSmallStringColor( 635 + cl_screenoffset.integer - w, y + 2, s, color);
		y += SMALLCHAR_HEIGHT+4;

	}

	return y;
}


/*
=================
CG_DrawEliminationTimer
=================
*/
static float CG_DrawEliminationTimer( float y ) {
	char		*s;
	int			w;
	int			mins, seconds, tens, sec;
	int			msec;
	vec4_t			color;
	const char	*st;
	float scale;
	int cw;
	int rst;

	rst = cgs.roundStartTime;

        if(cg.time>rst && !cgs.roundtime) {
            return y;
        }

	//default color is white
	memcpy(color,g_color_table[ColorIndex(COLOR_WHITE)],sizeof(color));

	//msec = cg.time - cgs.levelStartTime;
	if(cg.time>rst) //We are started
	{
		msec = cgs.roundtime*1000 - (cg.time -rst);
		if(msec<=30*1000-1) //<= 30 seconds
			memcpy(color,g_color_table[ColorIndex(COLOR_YELLOW)],sizeof(color));
		if(msec<=10*1000-1) //<= 10 seconds
			memcpy(color,g_color_table[ColorIndex(COLOR_RED)],sizeof(color));
		msec += 1000; //120-1 instead of 119-0
	}
	else
	{
		//Warmup
		msec = -cg.time +rst;
		memcpy(color,g_color_table[ColorIndex(COLOR_GREEN)],sizeof(color));
		sec = msec/1000;
		msec += 1000; //5-1 instead of 4-0
/***
Lots of stuff
****/
	if(cg.warmup == 0)
	{
		st = va( "Round in: %i", sec + 1 );
		if ( sec != cg.warmupCount ) {
			cg.warmupCount = sec;
			switch ( sec ) {
			case 0:
				trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
				break;
			case 1:
				trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
				break;
			case 2:
				trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
				break;
			default:
				break;
			}
		}
		scale = 0.45f;
		switch ( cg.warmupCount ) {
		case 0:
			cw = 28;
			scale = 0.54f;
			break;
		case 1:
			cw = 24;
			scale = 0.51f;
			break;
		case 2:
			cw = 20;
			scale = 0.48f;
			break;
		default:
			cw = 16;
			scale = 0.45f;
			break;
		}

	#ifndef MISSIONPACK
			//w = CG_Text_Width(s, scale, 0);
			//CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, st, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
	#else

                    w = CG_DrawStrlen( st );
                    CG_DrawStringExt( 320 - w * cw/2, 70, st, colorWhite,
				qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
	#endif
	}
/*
Lots of stuff
*/
	}

	seconds = msec / 1000;
	mins = seconds / 60;
	seconds -= mins * 60;
	tens = seconds / 10;
	seconds -= tens * 10;

	if(msec>=0)
		s = va( " %i:%i%i", mins, tens, seconds );
	else
		s = va( " Overtime");
	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;

	CG_DrawBigStringColor( 635 + cl_screenoffset.integer - w, y + 2, s, color);

	return y + BIGCHAR_HEIGHT + 4;
}


/*
=================
CG_DrawTeamOverlay
=================
*/

static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
	int x, w, h, xx;
	int i, j, len;
	const char *p;
	vec4_t		hcolor;
	int pwidth, lwidth;
	int plyrs;
	char st[16];
	clientInfo_t *ci;
	gitem_t	*item;
	int ret_y, count;

	if ( !cg_drawTeamOverlay.integer ) {
		return y;
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
	//	return y; // Not on any team
	}

	plyrs = 0;

	// max player name width
	pwidth = 0;
	count = (numSortedTeamPlayers > 18) ? 18 : numSortedTeamPlayers;
	for (i = 0; i < count; i++) {
		ci = cgs.clientinfo + sortedTeamPlayers[i];
		if ( ci->infoValid) {
			plyrs++;
			len = CG_DrawStrlen(ci->name);
			if (len > pwidth)
				pwidth = len;
		}
	}

	if (!plyrs)
		return y;

	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;

	// max location name width
	lwidth = 0;
	for (i = 1; i < MAX_LOCATIONS; i++) {
		p = CG_ConfigString(CS_LOCATIONS + i);
		if (p && *p) {
			len = CG_DrawStrlen(p);
			if (len > lwidth)
				lwidth = len;
		}
	}

	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;

	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;

	if ( right )
		x = 640 - w + cl_screenoffset.integer;
	else
		x = 0;

	h = plyrs * TINYCHAR_HEIGHT;

	if ( upper ) {
		ret_y = y + h;
	} else {
		y -= h;
		ret_y = y;
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
		hcolor[0] = 1.0f;
		hcolor[1] = 0.0f;
		hcolor[2] = 0.0f;
		hcolor[3] = 0.33f;
	} else {
		hcolor[0] = 0.0f;
		hcolor[1] = 0.0f;
		hcolor[2] = 1.0f;
		hcolor[3] = 0.33f;
	}
	trap_R_SetColor( hcolor );
	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
	trap_R_SetColor( NULL );

	for (i = 0; i < count; i++) {
		ci = cgs.clientinfo + sortedTeamPlayers[i];
		if ( ci->infoValid) {

			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;

			xx = x + TINYCHAR_WIDTH;

			CG_DrawStringExt( xx, y,
				ci->name, hcolor, qfalse, qfalse,
				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);

			if (lwidth) {
				p = CG_ConfigString(CS_LOCATIONS + ci->location);
				if (!p || !*p)
					p = "unknown";
				len = CG_DrawStrlen(p);
				if (len > lwidth)
					len = lwidth;

				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
				CG_DrawStringExt( xx, y,
					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
					TEAM_OVERLAY_MAXLOCATION_WIDTH);
			}

			CG_GetColorForHealth( ci->health, ci->armor, hcolor );

			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);

			xx = x + TINYCHAR_WIDTH * 3 +
				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;

			CG_DrawStringExt( xx, y,
				st, hcolor, qfalse, qfalse,
				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );

			// draw weapon icon
			xx += TINYCHAR_WIDTH * 3;

			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
					cg_weapons[ci->curWeapon].weaponIcon );
			} else {
				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
					cgs.media.deferShader );
			}

			// Draw powerup icons
			if (right) {
				xx = x;
			} else {
				xx = x + w - TINYCHAR_WIDTH;
			}
			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
				if (ci->powerups & (1 << j)) {

					item = BG_FindItemForPowerup( j );

					if (item) {
						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
						trap_R_RegisterShader( item->icon ) );
						if (right) {
							xx -= TINYCHAR_WIDTH;
						} else {
							xx += TINYCHAR_WIDTH;
						}
					}
				}
			}

			y += TINYCHAR_HEIGHT;
		}
	}

	return ret_y;
}

static float CG_DrawFollowMessage( float y ) {
	char		*s;
	int			w;

	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) || ( ( cgs.elimflags & EF_NO_FREESPEC ) && (cgs.gametype == GT_ELIMINATION || cgs.gametype == GT_CTF_ELIMINATION ) ) ) {
		return y;
	}

	s = va("USE_ITEM to stop following");
	w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
	CG_DrawSmallString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);

	return y + SMALLCHAR_HEIGHT+4;
}


/*
=====================
CG_DrawUpperRight

=====================
*/
static void CG_DrawUpperRight(stereoFrame_t stereoFrame)
{
	float	y;

	y = 0;

	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && cg_drawTeamOverlay.integer == 1 ) {
		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
	}
	if ( cgs.gametype == GT_LMS && cg.showScores ) {
		y = CG_DrawLMSmode(y);
	}
	else
	if ( cgs.gametype == GT_CTF_ELIMINATION ) {
		y = CG_DrawCTFoneway(y);
	}
	else
	if ( cgs.gametype == GT_DOMINATION ) {
		y = CG_DrawDomStatus(y);
	}

	if ( cg_drawSnapshot.integer ) {
		y = CG_DrawSnapshot( y );
	}
	if (cg_drawFPS.integer && (stereoFrame == STEREO_CENTER || stereoFrame == STEREO_RIGHT)) {
		y = CG_DrawFPS( y );
	}
	if (cgs.gametype==GT_ELIMINATION || cgs.gametype == GT_CTF_ELIMINATION || cgs.gametype==GT_LMS) {
		y = CG_DrawEliminationTimer( y );
	}

	y = CG_DrawFollowMessage( y );
if(mod_roundmode == 1){
	y = CG_DrawCustomRound( y );
}

	if ( cg_drawTimer.integer) {
		y = CG_DrawTimer( y );
	}
	if ( cg_drawSpeed.integer ) {
		y = CG_DrawSpeedMeter( y );
	}

}

/*
===========================================================================================

  LOWER RIGHT CORNER

===========================================================================================
*/

/*
=================
CG_DrawScores

Draw the small two score display
=================
*/
static float CG_DrawScores( float y ) {
	const char	*s;
	int			s1, s2, score;
	int			x, w;
	int			v;
	vec4_t		color;
	float		y1;
	gitem_t		*item;
        int statusA,statusB;

        statusA = cgs.redflag;
        statusB = cgs.blueflag;

	s1 = cgs.scores1;
	s2 = cgs.scores2;

	y -=  BIGCHAR_HEIGHT + 8;

	y1 = y;

	// draw from the right side to left
	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
		x = 640 + cl_screenoffset.integer;
		color[0] = 0.0f;
		color[1] = 0.0f;
		color[2] = 1.0f;
		color[3] = 0.33f;
		s = va( "%2i", s2 );
		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
		x -= w;
		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
		}
		CG_DrawBigString( x + 4, y, s, 1.0F);

		if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION) {
			// Display flag status
			item = BG_FindItemForPowerup( PW_BLUEFLAG );

			if (item) {
				y1 = y - BIGCHAR_HEIGHT - 8;
				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
				}
			}
		}

                if ( cgs.gametype == GT_DOUBLE_D ) {
			// Display Domination point status

				y1 = y - 32;//BIGCHAR_HEIGHT - 8;
				if( cgs.redflag >= 0 && cgs.redflag <= 3 ) {
					CG_DrawPic( x, y1-4, w, 32, cgs.media.ddPointSkinB[cgs.blueflag] );
				}
		}

		color[0] = 1.0f;
		color[1] = 0.0f;
		color[2] = 0.0f;
		color[3] = 0.33f;
		s = va( "%2i", s1 );
		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
		x -= w;
		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
		}
		CG_DrawBigString( x + 4, y, s, 1.0F);

		if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION ) {
			// Display flag status
			item = BG_FindItemForPowerup( PW_REDFLAG );

			if (item) {
				y1 = y - BIGCHAR_HEIGHT - 8;
				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
				}
			}
		}

                if ( cgs.gametype == GT_DOUBLE_D ) {
			// Display Domination point status

				y1 = y - 32;//BIGCHAR_HEIGHT - 8;
				if( cgs.redflag >= 0 && cgs.redflag <= 3 ) {
					CG_DrawPic( x, y1-4, w, 32, cgs.media.ddPointSkinA[cgs.redflag] );
				}



                        //Time till capture:
                        if( ( ( statusB == statusA ) && ( statusA == TEAM_RED ) ) ||
                            ( ( statusB == statusA ) && ( statusA == TEAM_BLUE ) ) ) {
                                s = va("%i",(cgs.timetaken+10*1000-cg.time)/1000+1);
                                w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
                                CG_DrawBigString( x + 32+8-w/2, y-28, s, 1.0F);
                        }
		}

                if ( cgs.gametype == GT_OBELISK ) {
                    s = va("^1%3i%% ^4%3i%%",cg.redObeliskHealth,cg.blueObeliskHealth);
                    CG_DrawSmallString( x, y-28, s, 1.0F);
                }



		if ( cgs.gametype >= GT_CTF && cgs.ffa_gt==0) {
			v = cgs.capturelimit;
		} else {
			v = cgs.fraglimit;
		}
		if ( v ) {
			s = va( "%2i", v );
			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
			x -= w;
			CG_DrawBigString( x + 4, y, s, 1.0F);
		}

	} else {
		qboolean	spectator;

		x = 640 + cl_screenoffset.integer;
		score = cg.snap->ps.persistant[PERS_SCORE];
		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );

		// always show your score in the second box if not in first place
		if ( s1 != score ) {
			s2 = score;
		}
		if(!cg_singlemode.integer){
		if ( s2 != SCORE_NOT_PRESENT ) {
			s = va( "%2i", s2 );
			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
			x -= w;
			if ( !spectator && score == s2 && score != s1 ) {
				color[0] = 1.0f;
				color[1] = 0.0f;
				color[2] = 0.0f;
				color[3] = 0.33f;
				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
			} else {
				color[0] = 0.5f;
				color[1] = 0.5f;
				color[2] = 0.5f;
				color[3] = 0.33f;
				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
			}
			CG_DrawBigString( x + 4, y, s, 1.0F);
		}
		}

		// first place
		if ( s1 != SCORE_NOT_PRESENT ) {
			s = va( "%2i", s1 );
			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
			x -= w;
			if ( !spectator && score == s1 ) {
				color[0] = 0.0f;
				color[1] = 0.0f;
				color[2] = 1.0f;
				color[3] = 0.33f;
				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
			} else {
				color[0] = 0.5f;
				color[1] = 0.5f;
				color[2] = 0.5f;
				color[3] = 0.33f;
				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
			}
			CG_DrawBigString( x + 4, y, s, 1.0F);
		}

		if ( cgs.fraglimit ) {
			s = va( "%2i", cgs.fraglimit );
			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
			x -= w;
			CG_DrawBigString( x + 4, y, s, 1.0F);
		}

	}

	return y1 - 8;
}

/*
================
CG_DrawPowerups
================
*/
static float CG_DrawPowerups( float y ) {
	int		sorted[MAX_POWERUPS];
	int		sortedTime[MAX_POWERUPS];
	int		i, j, k;
	int		active;
	playerState_t	*ps;
	int		t;
	gitem_t	*item;
	int		x;
	int		color;
	float	size;
	float	f;
	static float colors[2][4] = {
    { 0.2f, 1.0f, 0.2f, 1.0f } ,
    { 1.0f, 0.2f, 0.2f, 1.0f }
  };

	ps = &cg.snap->ps;

	if ( ps->stats[STAT_HEALTH] <= 0 ) {
		return y;
	}

	// sort the list by time remaining
	active = 0;
	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
		if ( !ps->powerups[ i ] ) {
			continue;
		}
		t = ps->powerups[ i ] - cg.time;
		// ZOID--don't draw if the power up has unlimited time (999 seconds)
		// This is true of the CTF flags
		if ( t < 0 || t > 99999000) {
			continue;
		}

                item = BG_FindItemForPowerup( i );
                if ( item && item->giType == IT_PERSISTANT_POWERUP)
                    continue; //Don't draw persistant powerups here!

		// insert into the list
		for ( j = 0 ; j < active ; j++ ) {
			if ( sortedTime[j] >= t ) {
				for ( k = active - 1 ; k >= j ; k-- ) {
					sorted[k+1] = sorted[k];
					sortedTime[k+1] = sortedTime[k];
				}
				break;
			}
		}
		sorted[j] = i;
		sortedTime[j] = t;
		active++;
	}

	// draw the icons and timers
	x = 640 - 100 + cl_screenoffset.integer - ICON_SIZE - CHAR_WIDTH * 2;
	for ( i = 0 ; i < active ; i++ ) {
		item = BG_FindItemForPowerup( sorted[i] );

    if (item) {

		  color = 1;

		  y -= ICON_SIZE;

		  trap_R_SetColor( colors[color] );
		  CG_DrawField( x + 16, y, 5, sortedTime[ i ] / 1000, 1 );

		  t = ps->powerups[ sorted[i] ];
		  if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
			  trap_R_SetColor( NULL );
		  } else {
			  vec4_t	modulate;

			  f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
			  f -= (int)f;
			  modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
			  trap_R_SetColor( modulate );
		  }

		  if ( cg.powerupActive == sorted[i] &&
			  cg.time - cg.powerupTime < PULSE_TIME ) {
			  f = 1.0 - ( ( (float)cg.time - cg.powerupTime ) / PULSE_TIME );
			  size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
		  } else {
			  size = ICON_SIZE;
		  }

		  CG_DrawPic( 640 + cl_screenoffset.integer - size, y + ICON_SIZE / 2 - size / 2,
			  size, size, trap_R_RegisterShader( item->icon ) );
    }
	}
	trap_R_SetColor( NULL );

	return y;
}

/*
=====================
CG_DrawLowerRight

=====================
*/
static void CG_DrawLowerRight( void ) {
	float	y;

	y = 480 - ICON_SIZE*1.5;

	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && cg_drawTeamOverlay.integer == 2 ) {
		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
	}

	if(cg.scoreBoardShowing){
	y = CG_DrawScores( y );
	}
	y = CG_DrawPowerups( y );
}

/*
===================
CG_DrawPickupItem
===================
*/
static int CG_DrawPickupItem( int y ) {
	int		value;
	float	*fadeColor;

	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
		return y;
	}

	y -=  ICON_SIZE;

	value = cg.itemPickup;
	if ( value ) {
		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
		if ( fadeColor ) {
			CG_RegisterItemVisuals( value );
			trap_R_SetColor( fadeColor );
			CG_DrawPic( 8 - cl_screenoffset.integer, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			if(cl_language.integer == 0){
			CG_DrawBigString( ICON_SIZE - cl_screenoffset.integer + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
			}
			if(cl_language.integer == 1){
			CG_DrawBigString( ICON_SIZE - cl_screenoffset.integer + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_nameru, fadeColor[0] );
			}
			trap_R_SetColor( NULL );
		}
	}

	return y;
}

/*
=====================
CG_DrawLowerLeft

=====================
*/
static void CG_DrawLowerLeft( void ) {
	float	y;

	y = 50 + ICON_SIZE;

	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && cg_drawTeamOverlay.integer == 3 ) {
		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
	}


	y = CG_DrawPickupItem( y );
}

//===========================================================================================

/*
=================
CG_DrawTeamInfo
=================
*/
//#ifndef MISSIONPACK
static void CG_DrawTeamInfo( void ) {
	int w, h;
	int i, len;
	vec4_t		hcolor;
	int		chatHeight;

	if (cg_newConsole.integer) {
		return;
	}

#define CHATLOC_Y 420 // bottom end
#define CHATLOC_X 0 - cl_screenoffset.integer

	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
		chatHeight = cg_teamChatHeight.integer;
	else
		chatHeight = TEAMCHAT_HEIGHT;
	if (chatHeight <= 0)
		return; // disabled

	if (cgs.teamLastChatPos != cgs.teamChatPos) {
		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
			cgs.teamLastChatPos++;
		}

		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;

		w = 0;

		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
			if (len > w)
				w = len;
		}
		w *= TINYCHAR_WIDTH;
		w += TINYCHAR_WIDTH * 2;

		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
			hcolor[0] = 1.0f;
			hcolor[1] = 0.0f;
			hcolor[2] = 0.0f;
			hcolor[3] = 0.33f;
		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
			hcolor[0] = 0.0f;
			hcolor[1] = 0.0f;
			hcolor[2] = 1.0f;
			hcolor[3] = 0.33f;
		} else {
			hcolor[0] = 0.0f;
			hcolor[1] = 1.0f;
			hcolor[2] = 0.0f;
			hcolor[3] = 0.33f;
		}

		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
		hcolor[3] = 1.0f;

		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH * cg_teamChatScaleX.value, 
				cg_teamChatY.integer - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT * cg_teamChatScaleY.value, 
				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
				TINYCHAR_WIDTH * cg_teamChatScaleX.value, TINYCHAR_HEIGHT * cg_teamChatScaleY.value, 0 );
		}
	}
}

float CG_FontResAdjust(void) {
	float f = 1.0;
	if (cgs.glconfig.vidHeight < 1024) {
		f *= 1024.0/cgs.glconfig.vidHeight;
	}
	return f;
}

float CG_ConsoleDistortionFactorX(void) {
	return ((cgs.screenXScale > cgs.screenYScale) ? (cgs.screenYScale / cgs.screenXScale) : 1.0);
}

float CG_ConsoleDistortionFactorY(void) {
	return ((cgs.screenYScale > cgs.screenXScale) ? (cgs.screenXScale / cgs.screenYScale) : 1.0);
}

float CG_ConsoleAdjustSizeX(float sizeX) {
	return CG_FontResAdjust() * sizeX * CG_ConsoleDistortionFactorX();
}

float CG_ConsoleAdjustSizeY(float sizeY) {
	return CG_FontResAdjust() * sizeY * CG_ConsoleDistortionFactorY();
}

int CG_GetChatHeight(int maxlines) {
	if (maxlines < CONSOLE_MAXHEIGHT)
		return maxlines;
	return CONSOLE_MAXHEIGHT;
}

int CG_ConsoleChatPositionY(float consoleSizeY, float chatSizeY) {
	return CG_GetChatHeight(cg_consoleLines.integer) * consoleSizeY + chatSizeY/2;
}


void CG_ConsoleUpdateIdx(console_t *console, int chatHeight) {
	if (console->insertIdx < console->displayIdx) {
		console->displayIdx = console->insertIdx;
		}

	if (console->insertIdx - console->displayIdx > chatHeight) {
		console->displayIdx = console->insertIdx - chatHeight;
	}
}


static void CG_DrawGenericConsole( console_t *console, int maxlines, int time, int x, int y, float sizeX, float sizeY ) {
	int i, j;
	vec4_t	hcolor;
	int	chatHeight;

	if (!cg_newConsole.integer) {
		return;
	}

	chatHeight = CG_GetChatHeight(maxlines);

	if (chatHeight <= 0)
		return; // disabled

	CG_ConsoleUpdateIdx(console, chatHeight);

	hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0f;

	j = 0;
	for (i = console->displayIdx; i < console->insertIdx ; ++i) {
		if (console->msgTimes[i % CONSOLE_MAXHEIGHT] + time < cg.time) {
			continue;
		}
		CG_DrawStringExt( x + 1,
				  y + j * sizeY,
				  console->msgs[i % CONSOLE_MAXHEIGHT],
				  hcolor, qfalse, cg_fontShadow.integer ? qtrue : qfalse,
				  sizeX,  sizeY, 0 );
		j++;

	}
}

void CG_AddToGenericConsole( const char *str, console_t *console ) {
	int len;
	char *p, *ls;
	int lastcolor;

	len = 0;

	p = console->msgs[console->insertIdx % CONSOLE_MAXHEIGHT];
	*p = 0;

	lastcolor = '7';

	ls = NULL;
	while (*str) {
		if (*str == '\n' || len > CONSOLE_WIDTH - 1) {
			if (*str == '\n') {
				str++;
				if (*str == '\0') {
					continue;
				}
			} else if (ls) {
				str -= (p - ls);
				str++;
				p -= (p - ls);
			}
			*p = 0;

			console->msgTimes[console->insertIdx % CONSOLE_MAXHEIGHT] = cg.time;

			console->insertIdx++;
			p = console->msgs[console->insertIdx % CONSOLE_MAXHEIGHT];
			*p = 0;
			*p++ = Q_COLOR_ESCAPE;
			*p++ = lastcolor;
			len = 0;
			ls = NULL;
		}

		if ( Q_IsColorString( str ) ) {
			*p++ = *str++;
			lastcolor = *str;
			*p++ = *str++;
			continue;
		}
		if (*str == ' ') {
			ls = p;
		}
		*p++ = *str++;
		len++;
	}
	*p = 0;

	console->msgTimes[console->insertIdx % CONSOLE_MAXHEIGHT] = cg.time;
	console->insertIdx++;

}

/*
===================
CG_DrawHoldableItem
===================
*/
static void CG_DrawHoldableItem( void ) { 
	int		value;
	float	yoffset;
	float	xoffset;
	vec4_t	color;
	int		i;

	//draw usable item
	value = GetHoldableListIndex(GetPlayerHoldable(cg.snap->ps.stats[STAT_HOLDABLE_ITEM]));

	if ( value ) {
		CG_RegisterItemVisuals( value );
		CG_DrawPic( 640-ICON_SIZE+(cl_screenoffset.integer+1), 1, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
	}
	
	//draw keys
	for ( i = 0; i < 4; i++ )
		color[i] = 1;
	trap_R_SetColor( color );		//must do this otherwise colors for key icons are distorted if health drops below 25 (see issue 132)

	yoffset = ICON_SIZE;
	xoffset = 0;

	//red key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_RED) ) {
		value = GetHoldableListIndex(HI_KEY_RED);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

	//green key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_GREEN) ) {
		value = GetHoldableListIndex(HI_KEY_GREEN);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

	//blue key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_BLUE) ) {
		value = GetHoldableListIndex(HI_KEY_BLUE);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}
	
	//yellow key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_YELLOW) ) {
		value = GetHoldableListIndex(HI_KEY_YELLOW);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

	//master key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_MASTER) ) {
		value = GetHoldableListIndex(HI_KEY_MASTER);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

	//gold key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_GOLD) ) {		
		value = GetHoldableListIndex(HI_KEY_GOLD);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

	//silver key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_SILVER) ) {
		value = GetHoldableListIndex(HI_KEY_SILVER);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

	//iron key
	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_IRON) ) {
		value = GetHoldableListIndex(HI_KEY_IRON);
		if ( value ) {
			CG_RegisterItemVisuals( value );
			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
			yoffset += ICON_SIZE;
		}
	}

}

static void CG_DrawObjectivesNotification( void ) {
	qboolean draw = qfalse;
	
	if ( !cg_draw2D.integer )
		return;

	if ( cg.objectivesTime == 0 || cg.time < cg.objectivesTime )
		return;

	//icon blinks
	if ( cg.time < cg.objectivesTime + 500 )
		draw = qtrue;
	else if ( cg.time > cg.objectivesTime + 1000 && cg.time < cg.objectivesTime + 1500 )
		draw = qtrue;
	else if ( cg.time > cg.objectivesTime + 2000 && cg.time < cg.objectivesTime + 2500 )
		draw = qtrue;

	if ( draw )
	{
		trap_R_SetColor( NULL );
		CG_DrawPic( 8-cl_screenoffset.integer, 8, ICON_SIZE, ICON_SIZE, cgs.media.objectivesUpdated );
	}
}
/*
===================
CG_DrawPersistantPowerup
===================
*/
static void CG_DrawPersistantPowerup( void ) {
	int		value;

	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
	if ( value ) {
		CG_RegisterItemVisuals( value );
		CG_DrawPic( 0 - cl_screenoffset.integer, (0+SCREEN_HEIGHT / 2) - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
	}
}

/*
===============================================================================

LAGOMETER

===============================================================================
*/

#define	LAG_SAMPLES		128


typedef struct {
	int		frameSamples[LAG_SAMPLES];
	int		frameCount;
	int		snapshotFlags[LAG_SAMPLES];
	int		snapshotSamples[LAG_SAMPLES];
	int		snapshotCount;
} lagometer_t;

lagometer_t		lagometer;

/*
==============
CG_AddLagometerFrameInfo

Adds the current interpolate / extrapolate bar for this frame
==============
*/
void CG_AddLagometerFrameInfo( void ) {
	int			offset;

	offset = cg.time - cg.latestSnapshotTime;
	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
	lagometer.frameCount++;
}

/*
==============
CG_AddLagometerSnapshotInfo

Each time a snapshot is received, log its ping time and
the number of snapshots that were dropped before it.

Pass NULL for a dropped packet.
==============
*/
void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
	// dropped packet
	if ( !snap ) {
		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
		lagometer.snapshotCount++;
		return;
	}

	// add this snapshot's info
	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
	lagometer.snapshotCount++;
}

/*
==============
CG_DrawDisconnect

Should we draw something differnet for long lag vs no packets?
==============
*/
static void CG_DrawDisconnect( void ) {
	float		x, y;
	int			cmdNum;
	usercmd_t	cmd;
	const char		*s;
	int			w;  // bk010215 - FIXME char message[1024];

	// draw the phone jack if we are completely past our buffers
	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
	trap_GetUserCmd( cmdNum, &cmd );
	if ( cmd.serverTime <= cg.snap->ps.commandTime
		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
		return;
	}

	// blink the icon
	if ( ( cg.time >> 9 ) & 1 ) {
		return;
	}

	x = 0;
	y = 0;

	CG_DrawPic( x-cl_screenoffset.integer, y, 16, 16, trap_R_RegisterShader("gfx/2d/net.tga" ) );
}


#define	MAX_LAGOMETER_PING	900
#define	MAX_LAGOMETER_RANGE	300

/*
==============
CG_DrawLagometer
==============
*/
static void CG_DrawLagometer( void ) {
	int		a, x, y, i;
	float	v;
	float	ax, ay, aw, ah, mid, range;
	int		color;
	float	vscale;

	if ( !cg_lagometer.integer || cgs.localServer ) {
		CG_DrawDisconnect();
		return;
	}

	//
	// draw the graph
	//
#ifdef MISSIONPACK
	x = 640 - 48;
	y = 480 - 144;
#else
	x = 640 - 48;
	y = 480 - 48;
#endif

	trap_R_SetColor( NULL );
	CG_DrawPic( x + cl_screenoffset.integer, y, 48, 48, cgs.media.lagometerShader );

	ax = x + cl_screenoffset.integer;
	ay = y;
	aw = 48;
	ah = 48;
	CG_AdjustFrom640( &ax, &ay, &aw, &ah );

	color = -1;
	range = ah / 3;
	mid = ay + range;

	vscale = range / MAX_LAGOMETER_RANGE;

	// draw the frame interpoalte / extrapolate graph
	for ( a = 0 ; a < aw ; a++ ) {
		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
		v = lagometer.frameSamples[i];
		v *= vscale;
		if ( v > 0 ) {
			if ( color != 1 ) {
				color = 1;
				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
			}
			if ( v > range ) {
				v = range;
			}
			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
		} else if ( v < 0 ) {
			if ( color != 2 ) {
				color = 2;
				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
			}
			v = -v;
			if ( v > range ) {
				v = range;
			}
			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
		}
	}

	// draw the snapshot latency / drop graph
	range = ah / 2;
	vscale = range / MAX_LAGOMETER_PING;

	for ( a = 0 ; a < aw ; a++ ) {
		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
		v = lagometer.snapshotSamples[i];
		if ( v > 0 ) {
			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
				if ( color != 5 ) {
					color = 5;	// YELLOW for rate delay
					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
				}
			} else {
				if ( color != 3 ) {
					color = 3;
					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
				}
			}
			v = v * vscale;
			if ( v > range ) {
				v = range;
			}
			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
		} else if ( v < 0 ) {
			if ( color != 4 ) {
				color = 4;		// RED for dropped snapshots
				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
			}
			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
		}
	}

	trap_R_SetColor( NULL );

	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
		CG_DrawBigString( ax, ay, "snc", 1.0 );
	}

	CG_DrawDisconnect();
}



/*
===============================================================================

CENTER PRINTING

===============================================================================
*/


/*
==============
CG_CenterPrint

Called for important messages that should stay in the center of the screen
for a few moments
==============
*/
void CG_CenterPrint( const char *str, int y, int charWidth ) {
	char	*s;

	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
	cg.centerPrintRuLine = 0;
	cg.centerPrintTimeC = CG_DrawStrlen( cg.centerPrint ) / 10;
	cg.centerPrintTime = cg.time;
	cg.centerPrintY = y;
	cg.centerPrintCharWidth = charWidth;

	// count the number of lines for centering
	cg.centerPrintLines = 1;
	s = cg.centerPrint;
	while( *s ) {
		if (*s == '\n')
			cg.centerPrintLines++;
		s++;
	}
}

void CG_CenterPrintRus( const char *str, int y, int charWidth ) {
	char	*s;

	Q_strncpyz( cg.centerPrintRus, str, sizeof(cg.centerPrintRus) );
	cg.centerPrintRuLine = 1;
	cg.centerPrintTimeC = CG_DrawStrlen( cg.centerPrintRus ) / 10;	
	cg.centerPrintTime = cg.time;
	cg.centerPrintY = y;
	cg.centerPrintCharWidth = charWidth;

	// count the number of lines for centering
	cg.centerPrintLines = 1;
	s = cg.centerPrintRus;
	while( *s ) {
		if (*s == '\n')
			cg.centerPrintLines++;
		s++;
	}
}


/*
===================
CG_DrawCenterString
===================
*/
static void CG_DrawCenterString( void ) {
	char	*start;
	int		l;
	int		x, y, w;
#ifndef MISSIONPACK // bk010221 - unused else
  int h;
#endif
	float	*color;

	if ( !cg.centerPrintTime ) {
		return;
	}

	if(cg.centerPrintTimeC >= 1){
	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg.centerPrintTimeC );
	} else {
	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );	
	}
	if ( !color ) {
		return;
	}

	trap_R_SetColor( color );

	start = cg.centerPrint;

	if(cg.centerPrintRuLine == 1){
	start = cg.centerPrintRus;	
	}

	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;

	while ( 1 ) {
		char linebuffer[1024];

		for ( l = 0; l < 1024; l++ ) {
			if ( !start[l] || start[l] == '\n' ) {
				break;
			}
			linebuffer[l] = start[l];
		}
		linebuffer[l] = 0;

#ifndef MISSIONPACK
		w = CG_Text_Width(linebuffer, 0.5, 0);
		h = CG_Text_Height(linebuffer, 0.5, 0);
		x = (SCREEN_WIDTH - w) / 2;
		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
		y += h + 6;
#else
		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );

		x = ( SCREEN_WIDTH - w ) / 2;

		if(cg.centerPrintRuLine == 0){
		CG_DrawStringExt( x, y, linebuffer, color, qfalse, qtrue, cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
		}
		if(cg.centerPrintRuLine == 1){
		CG_DrawStringExtRus( x, y, linebuffer, color, qfalse, qtrue, cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
		}

		y += cg.centerPrintCharWidth * 1.5;
#endif
		while ( *start && ( *start != '\n' ) ) {
			start++;
		}
		if ( !*start ) {
			break;
		}
		start++;
	}

	trap_R_SetColor( NULL );
}

/*
=====================
CG_DrawCenter1FctfString
=====================
*/
static void CG_DrawCenter1FctfString( void ) {
    int		x, y, w;
    float       *color;
    char        *line;
    int status;

    if(cgs.gametype != GT_1FCTF)
        return;

    status = cgs.flagStatus;

    //Sago: TODO: Find the proper defines instead of hardcoded values.
    switch(status)
    {
        case 2:
		if(cl_language.integer == 0){
            line = va("Red has the flag!");
		}
		if(cl_language.integer == 1){
            line = va("Красные взяли флаг!");
		}
            color = colorRed;
            break;
        case 3:
		if(cl_language.integer == 0){
            line = va("Blue has the flag!");
		}
		if(cl_language.integer == 1){
            line = va("Синие взяли флаг!");
		}
            color = colorBlue;
            break;
        case 4:
		if(cl_language.integer == 0){
            line = va("Flag dropped!");
		}
		if(cl_language.integer == 0){
			line = va("Флаг потерян!");
		}
            color = colorWhite;
            break;
        default:
            return;

    };
    y = 100;


    w = cg.centerPrintCharWidth * CG_DrawStrlen( line );

    x = ( SCREEN_WIDTH - w ) / 2;

    CG_DrawStringExt( x, y, line, color, qfalse, qtrue,
		cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
}



/*
=====================
CG_DrawCenterDDString
=====================
*/
static void CG_DrawCenterDDString( void ) {
    int		x, y, w;
    float       *color;
    char        *line;
    int 		statusA, statusB;
    int sec;
    static int lastDDSec = -100;


    if(cgs.gametype != GT_DOUBLE_D)
        return;

    	statusA = cgs.redflag;
	statusB = cgs.blueflag;

    if( ( ( statusB == statusA ) && ( statusA == TEAM_RED ) ) ||
            ( ( statusB == statusA ) && ( statusA == TEAM_BLUE ) ) ) {
      }
    else
        return; //No team is dominating

    if(statusA == TEAM_BLUE) {
	if(cl_language.integer == 0){
        line = va("Blue scores in %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
	}
	if(cl_language.integer == 1){
        line = va("Синие победят через %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
	}
        color = colorBlue;
    } else if(statusA == TEAM_RED) {
	if(cl_language.integer == 0){
        line = va("Red scores in %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
	}
	if(cl_language.integer == 1){
        line = va("Красные победят через %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
	}
        color = colorRed;
    } else {
        lastDDSec = -100;
        return;
    }

    sec = (cgs.timetaken+10*1000-cg.time)/1000+1;
    if(sec!=lastDDSec) {
        //A new number is being displayed... play the sound!
        switch ( sec ) {
            case 1:
                trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
                break;
            case 2:
                trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
                break;
            case 3:
                trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
                break;
            case 10:
                trap_S_StartLocalSound( cgs.media.doublerSound , CHAN_ANNOUNCER );
                break;
            default:
                break;
        }
    }
    lastDDSec = sec;

    y = 100;


    w = cg.centerPrintCharWidth * CG_DrawStrlen( line );

    x = ( SCREEN_WIDTH - w ) / 2;

    CG_DrawStringExt( x, y, line, color, qfalse, qtrue,
		cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
}


/*
================================================================================

CROSSHAIR

================================================================================
*/


/*
=================
CG_DrawCrosshair
=================
*/
static void CG_DrawCrosshair(void)
{
	float		w, h;
	qhandle_t	hShader;
	float		f;
	float		x, y;
	int			ca = 0; //only to get rid of the warning(not useful)
	int 		currentWeapon;
	vec4_t         color;

	currentWeapon = cg.predictedPlayerState.weapon;

	if ( !cg_drawCrosshair.integer ) {
		return;
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
		return;
	}

    color[0]=cg_crosshairColorRed.value;
    color[1]=cg_crosshairColorGreen.value;
    color[2]=cg_crosshairColorBlue.value;
    color[3]=1.0f;
	trap_R_SetColor( color );

	if( cg_differentCrosshairs.integer == 1 ){
		switch( currentWeapon ){
			case 1:
				w = h = cg_ch1size.value;
				ca = cg_ch1.integer;
				break;
			case 2:
				w = h = cg_ch2size.value;
				ca = cg_ch2.integer;
				break;
			case 3:
				w = h = cg_ch3size.value;
				ca = cg_ch3.integer;
				break;
			case 4:
				w = h = cg_ch4size.value;
				ca = cg_ch4.integer;
				break;
			case 5:
				w = h = cg_ch5size.value;
				ca = cg_ch5.integer;
				break;
			case 6:
				w = h = cg_ch6size.value;
				ca = cg_ch6.integer;
				break;
			case 7:
				w = h = cg_ch7size.value;
				ca = cg_ch7.integer;
				break;
			case 8:
				w = h = cg_ch8size.value;
				ca = cg_ch8.integer;
				break;
			case 9:
				w = h = cg_ch9size.value;
				ca = cg_ch9.integer;
				break;
			case 10:
				w = h = cg_ch10size.value;
				ca = cg_ch10.integer;
				break;
			case 11:
				w = h = cg_ch11size.value;
				ca = cg_ch11.integer;
				break;
			case 12:
				w = h = cg_ch12size.value;
				ca = cg_ch12.integer;
				break;
			case 13:
				w = h = cg_ch13size.value;
				ca = cg_ch13.integer;
				break;
                        default:
                                w = h = cg_crosshairSize.value;
                                ca = cg_drawCrosshair.integer;
                                break;
		}
	}
	else{
		w = h = cg_crosshairSize.value;
		ca = cg_drawCrosshair.integer;
	}

	if( cg_crosshairPulse.integer ){
		// pulse the size of the crosshair when picking up items
		f = cg.time - cg.itemPickupBlendTime;
		if ( f > 0 && f < ITEM_BLOB_TIME ) {
			f /= ITEM_BLOB_TIME;
			w *= ( 1 + f );
			h *= ( 1 + f );
		}
	}
	if(cl_screenoffset.integer > 0){
	x = cg_crosshairX.integer - wideAdjustX; // leilei - widescreen adjust
	} else {
	x = cg_crosshairX.integer; // leilei - widescreen adjust
	}
	y = cg_crosshairY.integer;
	CG_AdjustFrom640( &x, &y, &w, &h );

	if (ca < 0) {
		ca = 0;
	}
	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];

        if(!hShader)
            hShader = cgs.media.crosshairShader[ ca % 10 ];

	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w),
		y + cg.refdef.y + 0.5 * (cg.refdef.height - h),
		w, h, 0, 0, 1, 1, hShader );
}

/*
=================
CG_DrawCrosshair3D
=================
*/
static void CG_DrawCrosshair3D(void)
{
	float		w, h;
	qhandle_t	hShader;
	float		f;
	int			ca;

	trace_t trace;
	vec3_t endpos;
	float stereoSep, zProj, maxdist, xmax;
	char rendererinfos[128];
	refEntity_t ent;

	if ( !cg_drawCrosshair.integer ) {
		return;
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
		return;
	}

	w = h = cg_crosshairSize.value;

	// pulse the size of the crosshair when picking up items
	f = cg.time - cg.itemPickupBlendTime;
	if ( f > 0 && f < ITEM_BLOB_TIME ) {
		f /= ITEM_BLOB_TIME;
		w *= ( 1 + f );
		h *= ( 1 + f );
	}

	ca = cg_drawCrosshair.integer;
	if (ca < 0) {
		ca = 0;
	}
	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];

        if(!hShader)
            hShader = cgs.media.crosshairShader[ ca % 10 ];

	// Use a different method rendering the crosshair so players don't see two of them when
	// focusing their eyes at distant objects with high stereo separation
	// We are going to trace to the next shootable object and place the crosshair in front of it.

	// first get all the important renderer information
	trap_Cvar_VariableStringBuffer("r_zProj", rendererinfos, sizeof(rendererinfos));
	zProj = atof(rendererinfos);
	trap_Cvar_VariableStringBuffer("r_stereoSeparation", rendererinfos, sizeof(rendererinfos));
	stereoSep = zProj / atof(rendererinfos);

	xmax = zProj * tan(cg.refdef.fov_x * M_PI / 360.0f);

	// let the trace run through until a change in stereo separation of the crosshair becomes less than one pixel.
	maxdist = cgs.glconfig.vidWidth * stereoSep * zProj / (2 * xmax);
	VectorMA(cg.refdef.vieworg, maxdist, cg.refdef.viewaxis[0], endpos);
	CG_Trace(&trace, cg.refdef.vieworg, NULL, NULL, endpos, 0, MASK_SHOT);

	memset(&ent, 0, sizeof(ent));
	ent.reType = RT_SPRITE;
	ent.renderfx = RF_DEPTHHACK | RF_CROSSHAIR;

	VectorCopy(trace.endpos, ent.origin);

	// scale the crosshair so it appears the same size for all distances
	ent.radius = w / 640 * xmax * trace.fraction * maxdist / zProj;
	ent.customShader = hShader;

	trap_R_AddRefEntityToScene(&ent);
}



/*
=================
CG_ScanForCrosshairEntity
=================
*/
static void CG_ScanForCrosshairEntity( void ) {
	trace_t		trace;
	vec3_t		start, end;
	int			content;
	char st[16];

	VectorCopy( cg.refdef.vieworg, start );
	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );

	CG_Trace( &trace, start, vec3_origin, vec3_origin, end,
		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
	if ( trace.entityNum >= MAX_CLIENTS ) {
		return;
	}

	// if the player is in fog, don't show it
	content = CG_PointContents( trace.endpos, 0 );
	if ( content & CONTENTS_FOG ) {
		return;
	}

	// if the player is invisible, don't show it
	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
		return;
	}

	// update the fade timer
	cg.crosshairClientNum = trace.entityNum;
	cg.androidtarget = trace.entityNum;
	cg.crosshairClientTime = cg.time;
}

/*
=====================
CG_DrawCrosshairNames
=====================
*/
static void CG_DrawCrosshairNames( void ) {
	float		*color;
	char		*name;
	char		*gender;
	float		w;

	if ( !cg_drawCrosshair.integer ) {
		return;
	}
	if ( !cg_drawCrosshairNames.integer ) {
		return;
	}
	if ( cg.renderingThirdPerson ) {
//		return;
	}

	// scan the known entities to see if the crosshair is sighted on one
	CG_ScanForCrosshairEntity();

	// draw the name of the player being looked at
	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
	if ( !color ) {
		trap_R_SetColor( NULL );
		return;
	}

	name = cgs.clientinfo[ cg.crosshairClientNum ].name;



#ifndef MISSIONPACK
	color[3] *= 0.5f;
	w = CG_Text_Width(name, 0.3f, 0);
	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
#else
	w = CG_DrawStrlen( name ) * BIGCHAR_WIDTH;
	CG_DrawBigString( 320 - w / 2, 170, name, color[3] * 0.5f );
#endif
	trap_R_SetColor( NULL );
}


//==============================================================================

/*
=================
CG_DrawSpectator
=================
*/
static void CG_DrawSpectator(void) {
if(cl_language.integer == 0){
	CG_DrawBigString(320 - 9 * 8, 440, "SPECTATOR", 1.0F);
	if ( cgs.gametype == GT_TOURNAMENT ) {
		CG_DrawBigString(320 - 15 * 8, 460, "waiting to play", 1.0F);
	}
	else if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
		CG_DrawBigString(320 - 39 * 8, 460, "press ESC and use the JOIN menu to play", 1.0F);
	}
}
if(cl_language.integer == 1){
	CG_DrawBigString(320 - 9 * 8, 440, "НАБЛЮДАТЕЛЬ", 1.0F);
	if ( cgs.gametype == GT_TOURNAMENT ) {
		CG_DrawBigString(320 - 15 * 8, 460, "ожидание игры", 1.0F);
	}
	else if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
		CG_DrawBigString(320 - 39 * 8, 460, "нажмите ESC нажмите СТАРТ в меню для игры", 1.0F);
	}
}
}

/*
=================
CG_DrawVote
=================
*/
static void CG_DrawVote(void) {
	char	*s;
	int		sec;

	if ( !cgs.voteTime ) {
		return;
	}

	// play a talk beep whenever it is modified
	if ( cgs.voteModified ) {
		cgs.voteModified = qfalse;
		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
	}

	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
	if ( sec < 0 ) {
		sec = 0;
	}
	if(cl_language.integer == 0){
	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
	CG_DrawSmallString( 0, 58, s, 1.0F );
	s = "or press ESC then click Vote";
	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
	}
	if(cl_language.integer == 1){
	s = va("ГОЛОСОВАНИЕ(%i):%s да:%i нет:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
	CG_DrawSmallString( 0, 58, s, 1.0F );
	s = "или нажмите ESC потом нажмите Голосование";
	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
	}
}

/*
=================
CG_DrawTeamVote
=================
*/
static void CG_DrawTeamVote(void) {
	char	*s;
	int		sec, cs_offset;

	if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
		cs_offset = 0;
	else if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
		cs_offset = 1;
	else
		return;

	if ( !cgs.teamVoteTime[cs_offset] ) {
		return;
	}

	// play a talk beep whenever it is modified
	if ( cgs.teamVoteModified[cs_offset] ) {
		cgs.teamVoteModified[cs_offset] = qfalse;
		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
	}

	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
	if ( sec < 0 ) {
		sec = 0;
	}
	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
	CG_DrawSmallString( 0, 90, s, 1.0F );
}


static qboolean CG_DrawScoreboard( void ) {
#ifdef MISSIONPACK
	static qboolean firstTime = qtrue;
	float fade, *fadeColor;
	char        *s;
    int w;

	if (menuScoreboard) {
		menuScoreboard->window.flags &= ~WINDOW_FORCED;
	}
	if (cg_paused.integer) {
		cg.deferredPlayerLoading = 0;
		firstTime = qtrue;
		return qfalse;
	}

	// should never happen in Team Arena
	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
		cg.deferredPlayerLoading = 0;
		firstTime = qtrue;
		return qfalse;
	}

	// don't draw scoreboard during death while warmup up
	if ( cg.warmup && !cg.showScores ) {
		return qfalse;
	}

	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
		fade = 1.0;
		fadeColor = colorWhite;
	} else {
		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME*0.25 );
		if ( !fadeColor ) {
			// next time scoreboard comes up, don't print killer
			cg.deferredPlayerLoading = 0;
			cg.killerName[0] = 0;
			firstTime = qtrue;
			return qfalse;
		}
		fade = *fadeColor;
	}


	if (menuScoreboard == NULL) {
		if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
			menuScoreboard = Menus_FindByName("teamscore_menu");
		} else {
			menuScoreboard = Menus_FindByName("score_menu");
		}
	}

	if (menuScoreboard) {
		if (firstTime) {
			CG_SetScoreSelection(menuScoreboard);
			firstTime = qfalse;
		}
		Menu_Paint(menuScoreboard, qtrue);
	}

	// load any models that have been deferred
	if ( ++cg.deferredPlayerLoading > 10 ) {
		CG_LoadDeferredPlayers();
	}

        if(cg.respawnTime && cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR && (cgs.gametype < GT_ELIMINATION || cgs.gametype > GT_LMS) ) {
            if(cg.respawnTime>cg.time) {
                s = va("%2.0f",((double)cg.respawnTime-(double)cg.time)/1000.0);
                w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
                CG_DrawSmallStringColor(320-w/2,440, s, colorYellow);
            } else {
                s = va("OK");
                w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
                CG_DrawSmallStringColor(320-w/2,440, "OK", colorGreen);
            }
        }

	return qtrue;
#endif
}

/*
=================
CG_DrawIntermission
=================
*/
static void CG_DrawIntermission( void ) {
	cg.scoreFadeTime = cg.time;

if(cl_drawobjective.integer == 0){
if(cg_oldscoreboard.integer == 0){
	cg.scoreBoardShowing = CG_DrawScoreboard();
}
if(cg_oldscoreboard.integer == 1){
	cg.scoreBoardShowing = CG_DrawOldScoreboard();
}
} else {
	cg.scoreBoardShowing = CG_DrawScoreboardObj();
}
}

/*
=================
CG_DrawFollow
=================
*/
static qboolean CG_DrawFollow( void ) {
	float		x;
	vec4_t		color;
	const char	*name;

	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
		return qfalse;
	}
	color[0] = 1;
	color[1] = 1;
	color[2] = 1;
	color[3] = 1;

	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;

	x = 0.5 * ( 640 - 10 * CG_DrawStrlen( name ) );

	CG_DrawStringExt( x, 10, name, color, qtrue, qtrue, 10, 16, 0 );

	return qtrue;
}

/*
=================
CG_DrawProxWarning
=================
*/
static void CG_DrawProxWarning( void ) {
	char s [64];
	int			w;
  static int proxTime;
  static int proxCounter;
  static int proxTick;

	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
    proxTime = 0;
		return;
	}

  if (proxTime == 0) {
    proxTime = cg.time + 5000;
    proxCounter = 5;
    proxTick = 0;
  }

  if (cg.time > proxTime) {
    proxTick = proxCounter--;
    proxTime = cg.time + 1000;
  }
if(cl_language.integer == 0){
  if (proxTick != 0) {
    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
  } else {
    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
  }
}
if(cl_language.integer == 1){
  if (proxTick != 0) {
    Com_sprintf(s, sizeof(s), "ВЗРЫВ ЧЕРЕЗ: %i", proxTick);
  } else {
    Com_sprintf(s, sizeof(s), "ВЫ БЫЛИ ЗАМИНИРОВАНЫ");
  }
}

	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
}


/*
=================
CG_DrawWarmup
=================
*/
static void CG_DrawWarmup( void ) {
	int			w;
	int			sec;
	int			i;
	float scale;
	clientInfo_t	*ci1, *ci2;
	int			cw;
	const char	*s;

	sec = cg.warmup;
	if ( !sec ) {
		return;
	}

	if ( sec < 0 ) {
		if(cl_language.integer == 0){
		s = "Waiting for players";
		}
		if(cl_language.integer == 1){
		s = "Ожидание игроков";
		}
		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
		CG_DrawBigString(320 - w / 2, 24, s, 1.0F);
		cg.warmupCount = 0;
		return;
	}

	if (cgs.gametype == GT_TOURNAMENT) {
		// find the two active players
		ci1 = NULL;
		ci2 = NULL;
		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
				if ( !ci1 ) {
					ci1 = &cgs.clientinfo[i];
				} else {
					ci2 = &cgs.clientinfo[i];
				}
			}
		}

		if ( ci1 && ci2 ) {
			s = va( "%s vs %s", ci1->name, ci2->name );
#ifndef MISSIONPACK
			w = CG_Text_Width(s, 0.6f, 0);
			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
#else
			w = CG_DrawStrlen( s );
			if ( w > 640 / GIANT_WIDTH ) {
				cw = 640 / w;
			} else {
				cw = GIANT_WIDTH;
			}
			CG_DrawStringExt( 320 - w * cw/2, 20,s, colorWhite,
					qfalse, qtrue, cw, (int)(cw * 1.5f), 0 );
#endif
		}
	} else {
		if ( cgs.gametype == GT_FFA ) {
			if(cl_language.integer == 0){s = "Free For All";}
			if(cl_language.integer == 1){s = "Все Против Всех";}
		} else if ( cgs.gametype == GT_TEAM ) {
			if(cl_language.integer == 0){s = "Team Deathmatch";}
			if(cl_language.integer == 1){s = "Командный Бой";}
		} else if ( cgs.gametype == GT_CTF ) {
			if(cl_language.integer == 0){s = "Capture the Flag";}
			if(cl_language.integer == 1){s = "Захват флага";}
		} else if ( cgs.gametype == GT_ELIMINATION ) {
			if(cl_language.integer == 0){s = "Elimination";}
			if(cl_language.integer == 1){s = "Устранение";}
		} else if ( cgs.gametype == GT_CTF_ELIMINATION ) {
			if(cl_language.integer == 0){s = "CTF Elimination";}
			if(cl_language.integer == 1){s = "CTF Устранение";}
		} else if ( cgs.gametype == GT_LMS ) {
			if(cl_language.integer == 0){s = "Last Man Standing";}
			if(cl_language.integer == 1){s = "Последний оставшийся";}
		} else if ( cgs.gametype == GT_DOUBLE_D ) {
			if(cl_language.integer == 0){s = "Double Domination";}
			if(cl_language.integer == 1){s = "Двойное доминирование";}
		} else if ( cgs.gametype == GT_1FCTF ) {
			if(cl_language.integer == 0){s = "One Flag CTF";}
			if(cl_language.integer == 1){s = "Один Флаг";}
		} else if ( cgs.gametype == GT_OBELISK ) {
			if(cl_language.integer == 0){s = "Overload";}
			if(cl_language.integer == 1){s = "Атака Базы";}
		} else if ( cgs.gametype == GT_HARVESTER ) {
			if(cl_language.integer == 0){s = "Harvester";}
			if(cl_language.integer == 1){s = "Жнец";}
        } else if ( cgs.gametype == GT_DOMINATION ) {
			if(cl_language.integer == 0){s = "Domination";}
			if(cl_language.integer == 1){s = "Доминирование";}
		} else {
			s = "";
		}
#ifndef MISSIONPACK
		w = CG_Text_Width(s, 0.6f, 0);
		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
#else
		w = CG_DrawStrlen( s );
		if ( w > 640 / GIANT_WIDTH ) {
			cw = 640 / w;
		} else {
			cw = GIANT_WIDTH;
		}
		CG_DrawStringExt( 320 - w * cw/2, 25,s, colorWhite,
				qfalse, qtrue, cw, (int)(cw * 1.1f), 0 );
#endif
	}

	sec = ( sec - cg.time ) / 1000;
	if ( sec < 0 ) {
		cg.warmup = 0;
		sec = 0;
	}
if(cl_language.integer == 0){
	s = va( "Starts in: %i", sec + 1 );
}
if(cl_language.integer == 1){
	s = va( "Старт через: %i", sec + 1 );
}
	if ( sec != cg.warmupCount ) {
		cg.warmupCount = sec;
		switch ( sec ) {
		case 0:
			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
			break;
		case 1:
			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
			break;
		case 2:
			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
			break;
		default:
			break;
		}
	}
	scale = 0.45f;
	switch ( cg.warmupCount ) {
	case 0:
		cw = 28;
		scale = 0.54f;
		break;
	case 1:
		cw = 24;
		scale = 0.51f;
		break;
	case 2:
		cw = 20;
		scale = 0.48f;
		break;
	default:
		cw = 16;
		scale = 0.45f;
		break;
	}

#ifndef MISSIONPACK
		w = CG_Text_Width(s, scale, 0);
		CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
#else
	w = CG_DrawStrlen( s );
	CG_DrawStringExt( 320 - w * cw/2, 70, s, colorWhite,
			qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
#endif
}

//==================================================================================

/*
=================
CG_DrawLetterbox

Draws letterbox bars at top and bottom of screen
=================
*/
static void CG_DrawDeathMessage( void ) {
	if(cl_language.integer == 0){
	CG_DrawSmallString((640 - (SMALLCHAR_WIDTH * strlen( "Press fire key to respawn" ))) / 2, 480 - (BIGCHAR_HEIGHT * 2), "Press fire key to respawn", 1.0);
	}
	if(cl_language.integer == 1){
	CG_DrawSmallString((640 - (SMALLCHAR_WIDTH * strlen( "Нажмите кнопку стрельбы для респавна" )*0.5)) / 2, 480 - (BIGCHAR_HEIGHT * 2), "Нажмите кнопку стрельбы для респавна", 1.0);
	}
}

/*
=================
CG_DrawLetterbox

Draws letterbox bars at top and bottom of screen
cg_letterBoxSize determines the size of the black bars. Default is 80, 0 removes letterbox effect.
=================
*/
static void CG_DrawLetterbox( void ) {
	float letterboxSize;
	vec4_t color;

	if ( cg_letterBoxSize.value == 0 )		//draw no letterbox
		return;

	// draw letterbox borders
	if ( cg.snap->ps.pm_type == PM_CUTSCENE ) {
		letterboxSize = cg_letterBoxSize.value;
		color[0] = 0;
		color[1] = 0;
		color[2] = 0;
		color[3] = 1;
		CG_FillRect(0-(cl_screenoffset.integer+2), 0, 640+(cl_screenoffset.integer*2)+4, letterboxSize, color);
		CG_FillRect(0-(cl_screenoffset.integer+2), 480 - letterboxSize, 640+(cl_screenoffset.integer*2)+4, letterboxSize, color);
	}
}

/*
=================
CG_FadeLevelStart

Handles the fade at the start of a map
=================
*/
void CG_FadeLevelStart( void ) {
	vec4_t colorStart;
	vec4_t colorEnd;
	int i;
	const char *s;

	//calculate the fade
	if ( cg.levelFadeStatus == LFS_LEVELLOADED ) {
		for (i = 0; i < 4; i++ ) {
			colorStart[i] = 0;
		}

		s = CG_ConfigString( CS_MESSAGE );

		if ( strlen(s) == 0 ) {			//there is no message so don't do a blackout
			cg.levelFadeStatus = LFS_FADEIN;
			Vector4Copy(colorStart, colorEnd);
			colorStart[3] = 1;
			CG_Fade( (FADEIN_TIME / 1000), colorStart, colorEnd );
		} else {
			cg.levelFadeStatus = LFS_BLACKOUT;
			colorStart[3] = 1;
			Vector4Copy(colorStart, colorEnd);
			CG_Fade( (BLACKOUT_TIME / 1000), colorStart, colorEnd );
		}
	} else if ( cg.levelFadeStatus == LFS_BLACKOUT && cg.fadeStartTime + cg.fadeDuration < cg.time ) {
		for (i = 0; i < 4; i++ ) {
			colorStart[i] = 0;
		}

		cg.levelFadeStatus = LFS_FADEIN;
		Vector4Copy(colorStart, colorEnd);
		colorStart[3] = 1;
		CG_Fade( (FADEIN_TIME / 1000), colorStart, colorEnd );
	}
}

/*
=================
CG_MessageLevelStart

Draws the level's message to the screen at the start of the level
=================
*/
void CG_MessageLevelStart( void ) {
	const char *s;
	vec4_t color;

	if ( cg.time < cg.levelStartTime + TITLE_TIME + TITLE_FADEIN_TIME + TITLE_FADEOUT_TIME) {
		int len;

		s = CG_ConfigString( CS_MESSAGE );
		len = strlen( s );
		if ( len == 0 )
			return;

		color[0] = 1;
		color[1] = 1;
		color[2] = 1;
		if ( cg.time < cg.levelStartTime + TITLE_FADEIN_TIME ){
			color[3] = (cg.time - cg.levelStartTime) / TITLE_FADEIN_TIME;
		}
		else if ( cg.time < cg.levelStartTime + TITLE_TIME + TITLE_FADEIN_TIME )
			color[3] = 1;
		else
			color[3] = (TITLE_FADEOUT_TIME - ((cg.time - cg.levelStartTime) - (TITLE_FADEIN_TIME + TITLE_TIME))) / TITLE_FADEOUT_TIME;

		len *= BIGCHAR_WIDTH;
		CG_DrawBigStringColor( 640 - len - 32 + cl_screenoffset.integer, 360, s, color );
	}
}

/*
=================
CG_Fade

Initializes a fade
=================
*/
void CG_Fade( float duration, vec4_t startColor, vec4_t endColor ) {
	cg.fadeStartTime = cg.time;
	if (duration < 0)
		cg.fadeDuration = 0;
	else
		cg.fadeDuration = duration * 1000;
	Vector4Copy(startColor, cg.fadeStartColor);
	Vector4Copy(endColor, cg.fadeEndColor);
}

/*
=================
CG_DrawFade

Draws fade in or fade out
=================
*/
void CG_DrawFade( void ) {
	vec4_t	colorDiff;
	int		timePassed;
	float	progress;
	float	colorValue;

	//if no start color was defined, do nothing
	if (!cg.fadeStartColor)
		return;

	if (cg.fadeStartTime + cg.fadeDuration < cg.time) {
		//time has progressed beyond the duration of the fade

		if (cg.fadeEndColor[3] == 0)	//end of the fade is fully transparent, so don't bother calling CG_FillRect
			return;

		//simply draw the end color now
		CG_FillRect(0 - (cl_screenoffset.integer+2), 0, 640 + (cl_screenoffset.integer*2)+4, 480, cg.fadeEndColor);
		return;
	}

	//calculate how far we are into the fade
	timePassed = cg.time - cg.fadeStartTime;
	if ( cg.fadeDuration == 0 )
		progress = 1;
	else
		progress = timePassed / cg.fadeDuration;

	//calculate the new colors
	Vector4Subtract(cg.fadeStartColor, cg.fadeEndColor, colorDiff);
	Vector4Scale(colorDiff, progress, colorDiff);
	Vector4Subtract(cg.fadeStartColor, colorDiff, colorDiff);

	//draw the fade color over the screen
	CG_FillRect(0 - (cl_screenoffset.integer+2), 0, 640 + (cl_screenoffset.integer*2)+4, 480, colorDiff);
}

//==================================================================================
#ifdef MISSIONPACK
/*
=================
CG_DrawTimedMenus
=================
*/
void CG_DrawTimedMenus( void ) {
	if (cg.voiceTime) {
		int t = cg.time - cg.voiceTime;
		if ( t > 2500 ) {
			Menus_CloseByName("voiceMenu");
			trap_Cvar_Set("cl_conXOffset", "0");
			cg.voiceTime = 0;
		}
	}
}
#endif

/*
=================
CG_DrawOverlay
=================
*/
static void CG_DrawOverlay( void ) {
	const char *overlay;

	// draw overlay set by target_effect
	overlay = CG_ConfigString( CS_OVERLAY );
	if ( strlen(overlay) && cgs.media.effectOverlay )
		CG_DrawPic( 0 - (cl_screenoffset.integer+1), 0, SCREEN_WIDTH + (cl_screenoffset.integer*2)+2, SCREEN_HEIGHT, cgs.media.effectOverlay );
}

/*
=================
CG_DrawPostProcess
=================
*/
static void CG_DrawPostProcess( void ) {

	if ( strlen(cg_postprocess.string) ) {
		cgs.media.postProcess = trap_R_RegisterShaderNoMip( cg_postprocess.string );
	} else {
		cgs.media.postProcess = 0;
	}
	// draw postprocess
	if ( strlen(cg_postprocess.string) && cgs.media.postProcess )
		CG_DrawPic( 0 - (cl_screenoffset.integer+1), 0, SCREEN_WIDTH + (cl_screenoffset.integer*2)+2, SCREEN_HEIGHT, cgs.media.postProcess );
}


/*
=================
CG_Draw2D
=================
*/
static void CG_Draw2D(stereoFrame_t stereoFrame)
{
#ifdef MISSIONPACK
	if (cgs.orderPending && cg.time > cgs.orderTime) {
		CG_CheckOrderPending();
	}
#endif
	// if we are taking a levelshot for the menu, don't draw anything
	if ( cg.levelShot ) {
		return;
	}

	if ( cg.snap->ps.pm_type == PM_CUTSCENE )
		return;
	
	if ( cg_draw2D.integer == 0 ) {
		return;
	}


	if (cg_newConsole.integer) {
		float consoleSizeY = CG_ConsoleAdjustSizeY(cg_consoleSizeY.value);
		float consoleSizeX = CG_ConsoleAdjustSizeX(cg_consoleSizeX.value);
		float chatSizeY = CG_ConsoleAdjustSizeY(cg_chatSizeY.value);
		float chatSizeX = CG_ConsoleAdjustSizeX(cg_chatSizeX.value);
		float teamChatSizeY = CG_ConsoleAdjustSizeY(cg_teamChatSizeY.value);
		float teamChatSizeX = CG_ConsoleAdjustSizeX(cg_teamChatSizeX.value);

		int consoleLines = CG_GetChatHeight(cg_consoleLines.integer);
		int commonConsoleLines = CG_GetChatHeight(cg_commonConsoleLines.integer);
		int chatLines = CG_GetChatHeight(cg_chatLines.integer);
		int teamChatLines = CG_GetChatHeight(cg_teamChatLines.integer);

		int lowestChatPos = CG_ConsoleChatPositionY(consoleSizeY, chatSizeY) + chatLines * chatSizeY;
		float f;

		if (lowestChatPos > RATSB_HEADER-2) {
			f = (RATSB_HEADER-2.0)/lowestChatPos;
			consoleSizeX *= f;
			consoleSizeY *= f;
			chatSizeX *= f;
			chatSizeY *= f;
			teamChatSizeX *= f;
			teamChatSizeY *= f;
		}
		f = cg_fontScale.value;
		consoleSizeX *= f;
		consoleSizeY *= f;
		chatSizeX *= f;
		chatSizeY *= f;
		teamChatSizeX *= f;
		teamChatSizeY *= f;

			if(!cg_singlemode.integer){
			CG_DrawGenericConsole(&cgs.console, consoleLines, cg_consoleTime.integer, 
					0 - cl_screenoffset.integer, 0, 
					consoleSizeX,
					consoleSizeY
					);
			}
			if(!cg_singlemode.integer){
			CG_DrawGenericConsole(&cgs.chat, chatLines, cg_chatTime.integer, 
					0 - cl_screenoffset.integer, 
					CG_ConsoleChatPositionY(consoleSizeY, chatSizeY) - cg_chatY.integer,
					chatSizeX,
					chatSizeY
					);
			}
			if(!cg_singlemode.integer){
			CG_DrawGenericConsole(&cgs.teamChat, teamChatLines, cg_teamChatTime.integer, 
					0 - cl_screenoffset.integer, 
					cg_teamChatY.integer - teamChatLines*teamChatSizeY,
					teamChatSizeX,
					teamChatSizeY
				       	);
			}
	}

	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
		CG_DrawSpectator();

		if(stereoFrame == STEREO_CENTER)
			CG_DrawCrosshair();
		if(!cg_singlemode.integer){
		CG_DrawCrosshairNames();
		}
	} else {
		// don't draw any status if dead or the scoreboard is being explicitly shown
		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {

			CG_DrawProxWarning();
			if(stereoFrame == STEREO_CENTER)
				CG_DrawCrosshair();
			if(!cg_singlemode.integer){
			CG_DrawCrosshairNames();
			}

			CG_DrawPersistantPowerup();
		}

		if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
			CG_DrawTeamInfo();
		}
	}

	CG_DrawVote();
	CG_DrawTeamVote();

	CG_DrawUpperRight(stereoFrame);

	CG_DrawLowerRight();
	CG_DrawLowerLeft();

	if ( !CG_DrawFollow() ) {
		CG_DrawWarmup();
	}

	if ( !cg.scoreBoardShowing) {
                CG_DrawCenterDDString();
                CG_DrawCenter1FctfString();
	}
}


static void CG_DrawTourneyScoreboard( void ) {
#ifdef MISSIONPACK
#else
	CG_DrawOldTourneyScoreboard();
#endif
}

/*
=====================
CG_DrawActive

Perform all drawing needed to completely fill the screen
=====================
*/
void CG_DrawActive( stereoFrame_t stereoView ) {
	// optionally draw the info screen instead
	if ( !cg.snap ) {
		CG_DrawInformation();
		return;
	}

	// optionally draw the tournement scoreboard instead
	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
		CG_DrawTourneyScoreboard();
		return;
	}

	// clear around the rendered view if sized down
	CG_TileClear();

	if(stereoView != STEREO_CENTER)
		CG_DrawCrosshair3D();

	// apply earthquake effect
	CG_Earthquake();

	// draw 3D view
	trap_R_RenderScene( &cg.refdef );

	// draw overlay for target_effect
	CG_DrawOverlay();
	
	CG_DrawPostProcess();

	// draw status bar and other floating elements
 	CG_Draw2D(stereoView);
	if ( cg.snap->ps.pm_type != PM_CUTSCENE ) {
	if ( cg.snap->ps.pm_type != PM_INTERMISSION ) {
	if ( cg.snap->ps.pm_type != PM_DEAD ) {
	if ( cg.snap->ps.pm_type != PM_SPECTATOR ) {
		CG_DrawLagometer();
		CG_DrawStatusBar();
        CG_DrawWeaponSelect();
        CG_DrawHoldableItem();
	}
	}
	}
	}

    CG_FadeLevelStart();

// draw fade-in/out
	CG_DrawFade();
	
// don't draw center string if scoreboard is up
if(cl_drawobjective.integer == 0){
if(cg_oldscoreboard.integer == 0){
	cg.scoreBoardShowing = CG_DrawScoreboard();
}
if(cg_oldscoreboard.integer == 1){
	cg.scoreBoardShowing = CG_DrawOldScoreboard();
}
} else {
	cg.scoreBoardShowing = CG_DrawScoreboardObj();
}

	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
		CG_DrawIntermission();
		return;
	}

	// draw level message (do it here because we want it done on top of the fade)
	CG_MessageLevelStart();

	// draw letterbox bars for cutscenes
	CG_DrawLetterbox();
	
	if ( !cg.scoreBoardShowing) {
	CG_DrawCenterString();
	}

	// play objectives notification sound if necessary
	if ( cg.objectivesTime != 0 && cg.time >= cg.objectivesTime ) {
		if ( !cg.objectivesSoundPlayed ) {
			cg.objectivesSoundPlayed = qtrue;
			trap_S_StartLocalSound( cgs.media.objectivesUpdatedSound, CHAN_LOCAL_SOUND );
		}
	}

	// if player is dead, draw death message
	if ( cg.snap->ps.pm_type == PM_DEAD ) {
		CG_DrawDeathMessage();

		if ( !cg.deathmusicStarted )
			CG_StartDeathMusic();
	}

	if ( cg.snap->ps.pm_type != PM_DEAD && cg.deathmusicStarted ) {
		CG_StopDeathMusic();
	}

	//draw objectives notification
	CG_DrawObjectivesNotification();
}

