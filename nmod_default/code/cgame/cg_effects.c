// 
// Noire's Mod
// 
// Copyright (C) 1999-2005 ID Software, Inc.
// Copyright (C) 2008-2012 OpenArena Team
// Copyright (C) 2023-2024 Noire.dev
// Copyright (C) 2025 Noctis Team
// 
// This file is part of Noire's Mod.
// 
// Noire's Mod is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License, version 2,
// as published by the Free Software Foundation.
// 
// This modified code is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this project. If not, see <http://www.gnu.org/licenses/>.
// 
// Contact: noctisdevs@gmail.com
// 
//
// cg_effects.c -- these functions generate localentities, usually as a result
// of event processing

#include "cg_local.h"


/*
==================
CG_BubbleTrail

Bullets shot underwater
==================
*/
void CG_BubbleTrail( vec3_t start, vec3_t end, float spacing ) {
	vec3_t		move;
	vec3_t		vec;
	float		len;
	int			i;

	if ( cg_noProjectileTrail.integer ) {
		return;
	}

	VectorCopy (start, move);
	VectorSubtract (end, start, vec);
	len = VectorNormalize (vec);

	// advance a random amount first
	i = rand() % (int)spacing;
	VectorMA( move, i, vec, move );

	VectorScale (vec, spacing, vec);

	for ( ; i < len; i += spacing ) {
		localEntity_t	*le;
		refEntity_t		*re;

		le = CG_AllocLocalEntity();
		le->leFlags = LEF_PUFF_DONT_SCALE;
		le->leType = LE_MOVE_SCALE_FADE;
		le->startTime = cg.time;
		le->endTime = cg.time + 1000 + random() * 250;
		le->lifeRate = 1.0 / ( le->endTime - le->startTime );

		re = &le->refEntity;
		re->shaderTime = cg.time / 1000.0f;

		re->reType = RT_SPRITE;
		re->rotation = 0;
		re->radius = 3;
		re->customShader = cgs.media.waterBubbleShader;
		re->shaderRGBA[0] = 0xff;
		re->shaderRGBA[1] = 0xff;
		re->shaderRGBA[2] = 0xff;
		re->shaderRGBA[3] = 0xff;

		le->color[3] = 1.0;

		le->pos.trType = TR_LINEAR;
		le->pos.trTime = cg.time;
		VectorCopy( move, le->pos.trBase );
		le->pos.trDelta[0] = crandom()*5;
		le->pos.trDelta[1] = crandom()*5;
		le->pos.trDelta[2] = crandom()*5 + 6;

		VectorAdd (move, vec, move);
	}
}

/*
=====================
CG_SmokePuff

Adds a smoke puff or blood trail localEntity.
=====================
*/
localEntity_t *CG_SmokePuff(const vec3_t p, const vec3_t vel, 
							float radius,
							float r, float g, float b, float a,
							float duration,
							int startTime,
							int fadeInTime,
							int leFlags,
							qhandle_t hShader) {
	static int	seed = 0x92;
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	le->leFlags = leFlags;
	le->radius = radius;

	re = &le->refEntity;
	re->rotation = Q_random( &seed ) * 360;
	re->radius = radius;
	re->shaderTime = startTime / 1000.0f;

	le->leType = LE_MOVE_SCALE_FADE;
	le->startTime = startTime;
	le->fadeInTime = fadeInTime;
	le->endTime = startTime + duration;
	if ( fadeInTime > startTime ) {
		le->lifeRate = 1.0 / ( le->endTime - le->fadeInTime );
	}
	else {
		le->lifeRate = 1.0 / ( le->endTime - le->startTime );
	}
	le->color[0] = r;
	le->color[1] = g; 
	le->color[2] = b;
	le->color[3] = a;


	le->pos.trType = TR_LINEAR_STOP;
	le->pos.trTime = startTime;
	VectorCopy( vel, le->pos.trDelta );
	VectorCopy( p, le->pos.trBase );

	VectorCopy( p, re->origin );
	re->customShader = hShader;

	re->shaderRGBA[0] = le->color[0] * 0xff;
	re->shaderRGBA[1] = le->color[1] * 0xff;
	re->shaderRGBA[2] = le->color[2] * 0xff;
	re->shaderRGBA[3] = 0xff;

	re->reType = RT_SPRITE;
	re->radius = le->radius;

	return le;
}

// LEILEI same as above, but slows down.......
localEntity_t *CG_SlowPuff( const vec3_t p, const vec3_t vel, 
				   float radius,
				   float r, float g, float b, float a,
				   float duration,
				   int startTime,
				   int fadeInTime,
				   int leFlags,
				   qhandle_t hShader ) {
	static int	seed = 0x92;
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	le->leFlags = leFlags;
	le->radius = radius;

	re = &le->refEntity;
	re->rotation = Q_random( &seed ) * 360;
	re->radius = radius;
	re->shaderTime = startTime / 1000.0f;

	le->leType = LE_MOVE_SCALE_FADE;
	le->startTime = startTime;
	le->fadeInTime = fadeInTime;
	le->endTime = startTime + duration;
	if ( fadeInTime > startTime ) {
		le->lifeRate = 1.0 / ( le->endTime - le->fadeInTime );
	}
	else {
		le->lifeRate = 1.0 / ( le->endTime - le->startTime );
	}
	le->color[0] = r;
	le->color[1] = g; 
	le->color[2] = b;
	le->color[3] = a;


	le->pos.trType = TR_LINEAR;
	le->pos.trTime = startTime;
	VectorCopy( vel, le->pos.trDelta );
	VectorCopy( p, le->pos.trBase );

	VectorCopy( p, re->origin );
	re->customShader = hShader;

	re->shaderRGBA[0] = le->color[0] * 0xff;
	re->shaderRGBA[1] = le->color[1] * 0xff;
	re->shaderRGBA[2] = le->color[2] * 0xff;
	re->shaderRGBA[3] = 0xff;

	re->reType = RT_SPRITE;
	re->radius = le->radius;

	return le;
}

/*
==================
CG_SpawnEffect

Player teleporting in or out
==================
*/
void CG_SpawnEffect( vec3_t org ) {
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	le->leFlags = 0;
	le->leType = LE_FADE_RGB;
	le->startTime = cg.time;
	le->endTime = cg.time + 500;
	le->lifeRate = 1.0 / ( le->endTime - le->startTime );

	le->color[0] = le->color[1] = le->color[2] = le->color[3] = 1.0;

	re = &le->refEntity;

	re->reType = RT_MODEL;
	re->shaderTime = cg.time / 1000.0f;
	re->hModel = cgs.media.teleportEffectModel;
	AxisClear( re->axis );

	VectorCopy( org, re->origin );
	re->origin[2] += 16;
}

/*
===============
CG_LightningBoltBeam
===============
*/
void CG_LightningBoltBeam( vec3_t start, vec3_t end ) {
	localEntity_t	*le;
	refEntity_t		*beam;

	le = CG_AllocLocalEntity();
	le->leFlags = 0;
	le->leType = LE_SHOWREFENTITY;
	le->startTime = cg.time;
	le->endTime = cg.time + 50;

	beam = &le->refEntity;

	VectorCopy( start, beam->origin );
	// this is the end point
	VectorCopy( end, beam->oldorigin );

	beam->reType = RT_LIGHTNING;
	beam->customShader = cgs.media.lightningShader;
}

/*
==================
CG_KamikazeEffect
==================
*/
void CG_KamikazeEffect( vec3_t org ) {
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	le->leFlags = 0;
	le->leType = LE_KAMIKAZE;
	le->startTime = cg.time;
	le->endTime = cg.time + 3000;//2250;
	le->lifeRate = 1.0 / ( le->endTime - le->startTime );

	le->color[0] = le->color[1] = le->color[2] = le->color[3] = 1.0;

	VectorClear(le->angles.trBase);

	re = &le->refEntity;

	re->reType = RT_MODEL;
	re->shaderTime = cg.time / 1000.0f;

	re->hModel = cgs.media.kamikazeEffectModel;

	VectorCopy( org, re->origin );

}

/*
==================
CG_ObeliskExplode
==================
*/
void CG_ObeliskExplode( vec3_t org, int entityNum ) {
	localEntity_t	*le;
	vec3_t origin;

	// create an explosion
	VectorCopy( org, origin );
	origin[2] += 64;
	le = CG_MakeExplosion( origin, vec3_origin,
						   cgs.media.dishFlashModel,
						   cgs.media.rocketExplosionShader,
						   600, qtrue );
	le->light = 300;
	le->lightColor[0] = 1;
	le->lightColor[1] = 0.75;
	le->lightColor[2] = 0.0;
}

/*
==================
CG_ObeliskPain
==================
*/
void CG_ObeliskPain( vec3_t org ) {
	float r;
	sfxHandle_t sfx;

	// hit sound
	r = rand() & 3;
	if ( r < 2 ) {
		sfx = cgs.media.obeliskHitSound1;
	} else if ( r == 2 ) {
		sfx = cgs.media.obeliskHitSound2;
	} else {
		sfx = cgs.media.obeliskHitSound3;
	}
	trap_S_StartSound ( org, ENTITYNUM_NONE, CHAN_BODY, sfx );
}


/*
==================
CG_InvulnerabilityImpact
==================
*/
void CG_InvulnerabilityImpact( vec3_t org, vec3_t angles ) {
	localEntity_t	*le;
	refEntity_t		*re;
	int				r;
	sfxHandle_t		sfx;

	le = CG_AllocLocalEntity();
	le->leFlags = 0;
	le->leType = LE_INVULIMPACT;
	le->startTime = cg.time;
	le->endTime = cg.time + 1000;
	le->lifeRate = 1.0 / ( le->endTime - le->startTime );

	le->color[0] = le->color[1] = le->color[2] = le->color[3] = 1.0;

	re = &le->refEntity;

	re->reType = RT_MODEL;
	re->shaderTime = cg.time / 1000.0f;

	re->hModel = cgs.media.invulnerabilityImpactModel;

	VectorCopy( org, re->origin );
	AnglesToAxis( angles, re->axis );

	r = rand() & 3;
	if ( r < 2 ) {
		sfx = cgs.media.invulnerabilityImpactSound1;
	} else if ( r == 2 ) {
		sfx = cgs.media.invulnerabilityImpactSound2;
	} else {
		sfx = cgs.media.invulnerabilityImpactSound3;
	}
	trap_S_StartSound (org, ENTITYNUM_NONE, CHAN_BODY, sfx );
}

/*
==================
CG_InvulnerabilityJuiced
==================
*/
void CG_InvulnerabilityJuiced( vec3_t org ) {
	localEntity_t	*le;
	refEntity_t		*re;
	vec3_t			angles;

	le = CG_AllocLocalEntity();
	le->leFlags = 0;
	le->leType = LE_INVULJUICED;
	le->startTime = cg.time;
	le->endTime = cg.time + 10000;
	le->lifeRate = 1.0 / ( le->endTime - le->startTime );

	le->color[0] = le->color[1] = le->color[2] = le->color[3] = 1.0;

	re = &le->refEntity;

	re->reType = RT_MODEL;
	re->shaderTime = cg.time / 1000.0f;

	re->hModel = cgs.media.invulnerabilityJuicedModel;

	VectorCopy( org, re->origin );
	VectorClear(angles);
	AnglesToAxis( angles, re->axis );

	trap_S_StartSound (org, ENTITYNUM_NONE, CHAN_BODY, cgs.media.invulnerabilityJuicedSound );
}

/*
==================
CG_ScorePlum
==================
*/
void CG_ScorePlum( int client, vec3_t org, int score, int dmgfl) {
	localEntity_t	*le;
	refEntity_t		*re;
	vec3_t			angles;
	static vec3_t lastPos;

	// only visualize for the client that scored
	if (client != cg.predictedPlayerState.clientNum) {
		return;
	}
    if (cg_scorePlum.integer == 0) {
		return;
	}

	le = CG_AllocLocalEntity();
	le->leFlags = 0;
	le->leType = LE_SCOREPLUM;
	le->startTime = cg.time;
	le->endTime = cg.time + 1000;
	le->lifeRate = 1.0 / ( le->endTime - le->startTime );

	
	le->color[0] = le->color[1] = le->color[2] = le->color[3] = 1.0;
	le->radius = score;
	
	VectorCopy( org, le->pos.trBase );
	if (org[2] >= lastPos[2] - 1 && org[2] <= lastPos[2] + 1) {
		le->pos.trBase[2] -= 1;
	}

	//CG_Printf( "Plum origin %i %i %i -- %i\n", (int)org[0], (int)org[1], (int)org[2], (int)Distance(org, lastPos));
	VectorCopy(org, lastPos);


	re = &le->refEntity;

	re->reType = RT_SPRITE;
	re->radius = 64;
    re->rotation = 0;

	VectorClear(angles);
	AnglesToAxis( angles, re->axis );
}


/*
====================
CG_MakeExplosion
====================
*/
localEntity_t *CG_MakeExplosion( vec3_t origin, vec3_t dir, 
								qhandle_t hModel, qhandle_t shader,
								int msec, qboolean isSprite ) {
	float			ang;
	localEntity_t	*ex;
	int				offset;
	vec3_t			tmpVec, newOrigin;

	if ( msec <= 0 ) {
		CG_Error( "CG_MakeExplosion: msec = %i", msec );
	}

	// skew the time a bit so they aren't all in sync
	offset = rand() & 63;

	ex = CG_AllocLocalEntity();
	if ( isSprite ) {
		ex->leType = LE_SPRITE_EXPLOSION;

		// randomly rotate sprite orientation
		ex->refEntity.rotation = rand() % 360;
		VectorScale( dir, 16, tmpVec );
		VectorAdd( tmpVec, origin, newOrigin );
	} else {
		ex->leType = LE_EXPLOSION;
		VectorCopy( origin, newOrigin );

		// set axis with random rotate
		if ( !dir ) {
			AxisClear( ex->refEntity.axis );
		} else {
			ang = rand() % 360;
			VectorCopy( dir, ex->refEntity.axis[0] );
			RotateAroundDirection( ex->refEntity.axis, ang );
		}
	}

	ex->startTime = cg.time - offset;
	ex->endTime = ex->startTime + msec;

	// bias the time so all shader effects start correctly
	ex->refEntity.shaderTime = ex->startTime / 1000.0f;

	ex->refEntity.hModel = hModel;
	ex->refEntity.customShader = shader;

	// set origin
	VectorCopy( newOrigin, ex->refEntity.origin );
	VectorCopy( newOrigin, ex->refEntity.oldorigin );

	ex->color[0] = ex->color[1] = ex->color[2] = 1.0;

	return ex;
}


/*
=================
CG_Bleed

This is the spurt of blood when a character gets hit
=================
*/
void CG_Bleed( vec3_t origin, int entityNum ) {
	localEntity_t	*ex;

	if ( !cg_blood.integer ) {
		return;
	}

	ex = CG_AllocLocalEntity();
	ex->leType = LE_EXPLOSION;

	ex->startTime = cg.time;
	ex->endTime = ex->startTime + 500;
	
	VectorCopy ( origin, ex->refEntity.origin);
	ex->refEntity.reType = RT_SPRITE;
	ex->refEntity.rotation = rand() % 360;
	ex->refEntity.radius = 24;

	ex->refEntity.customShader = cgs.media.bloodExplosionShader;

	// don't show player's own blood in view
	if ( entityNum == cg.snap->ps.clientNum ) {
		ex->refEntity.renderfx |= RF_THIRD_PERSON;
	}
}



/*
==================
CG_SpurtBlood (LEILEI)
==================
*/
void CG_SpurtBlood( vec3_t origin, vec3_t velocity, int hard ) {
	localEntity_t	*blood;
		if ( !cg_blood.integer ) {	return;	}

	
	velocity[0] = velocity[0] * hard * crandom()*460;
	velocity[1] = velocity[1] * hard * crandom()*460;
	velocity[2] = velocity[2] * hard * crandom()*566 + 65;
		blood = CG_SmokePuff( origin, velocity, 
					21,		// radius
					  1, 1, 1, 1,	// color
					 2450,		// trailTime
					 cg.time,		// startTime
					  0,		// fadeInTime
					  0,		// flags
					  cgs.media.lbldShader1 );
		// use the optimized version
		blood->leType = LE_FALL_SCALE_FADE;
		blood->leType = LE_GORE;
		blood->pos.trType = TR_GRAVITY;
		VectorCopy( velocity, blood->pos.trDelta );
		blood->pos.trDelta[2] = 55;
		if (crandom() < 0.5){
		blood->leMarkType = LEMT_BURN;
		blood->leBounceSoundType = LEBS_BLOOD;
		}
	//	VectorCopy( velocity, blood->pos.trDelta );

}
/*
==================
CG_LaunchGib
==================
*/
void CG_LaunchGib( vec3_t origin, vec3_t velocity, qhandle_t hModel ) {
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	re = &le->refEntity;

	le->leType = LE_FRAGMENT2;
	le->startTime = cg.time;
	le->endTime = le->startTime  + cg_gibtime.integer * 1000;
	VectorCopy( origin, re->origin );
	AxisCopy( axisDefault, re->axis );
	re->hModel = hModel;

	le->pos.trType = TR_GRAVITY;
	VectorCopy( origin, le->pos.trBase );
	VectorCopy( velocity, le->pos.trDelta );
	le->pos.trTime = cg.time;

	le->bounceFactor = 0.6f;

	le->leBounceSoundType = LEBS_BLOOD;
	le->leMarkType = LEMT_BLOOD;
}





/*
===================
CG_GibPlayer

Generated a bunch of gibs launching out from the bodies location
===================
*/
#define	GIB_VELOCITY	atof(cg_gibvelocity.string)
#define	GIB_JUMP		atof(cg_gibjump.string)
void CG_GibPlayer( vec3_t playerOrigin ) {
	vec3_t	origin, velocity;
	int	j;

	if ( !cg_blood.integer ) {
		return;
	}

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	if ( rand() & 1 ) {
		CG_LaunchGib( origin, velocity, cgs.media.gibSkull );
	} else {
		CG_LaunchGib( origin, velocity, cgs.media.gibBrain );
	}

	// allow gibs to be turned off for speed
	if ( !cg_gibs.integer ) {
		return;
	}

for(j = 1; j <= cg_gibmodifier.integer; j++){
	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibAbdomen );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibArm );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibChest );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibFist );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibFoot );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibForearm );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibIntestine );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibLeg );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*GIB_VELOCITY;
	velocity[1] = crandom()*GIB_VELOCITY;
	velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
	CG_LaunchGib( origin, velocity, cgs.media.gibLeg );
}
}

/*
==================
CG_LaunchGib
==================
*/
void CG_LaunchExplode( vec3_t origin, vec3_t velocity, qhandle_t hModel ) {
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	re = &le->refEntity;

	le->leType = LE_FRAGMENT;
	le->startTime = cg.time;
	le->endTime = le->startTime + cg_gibtime.integer * 1000;

	VectorCopy( origin, re->origin );
	AxisCopy( axisDefault, re->axis );
	re->hModel = hModel;

	le->pos.trType = TR_GRAVITY;
	VectorCopy( origin, le->pos.trBase );
	VectorCopy( velocity, le->pos.trDelta );
	le->pos.trTime = cg.time;

	le->bounceFactor = 0.1f;

	le->leBounceSoundType = LEBS_BRASS;
	le->leMarkType = LEMT_NONE;
}

#define	EXP_VELOCITY	100
#define	EXP_JUMP		150
/*
===================
CG_GibPlayer

Generated a bunch of gibs launching out from the bodies location
===================
*/
void CG_BigExplosion( vec3_t playerOrigin ) {
	vec3_t	origin, velocity;

	if ( !cg_blood.integer ) {
		return;
	}

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*EXP_VELOCITY;
	velocity[1] = crandom()*EXP_VELOCITY;
	velocity[2] = EXP_JUMP + crandom()*EXP_VELOCITY;
	CG_LaunchExplode( origin, velocity, cgs.media.smoke2 );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*EXP_VELOCITY;
	velocity[1] = crandom()*EXP_VELOCITY;
	velocity[2] = EXP_JUMP + crandom()*EXP_VELOCITY;
	CG_LaunchExplode( origin, velocity, cgs.media.smoke2 );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*EXP_VELOCITY*1.5;
	velocity[1] = crandom()*EXP_VELOCITY*1.5;
	velocity[2] = EXP_JUMP + crandom()*EXP_VELOCITY;
	CG_LaunchExplode( origin, velocity, cgs.media.smoke2 );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*EXP_VELOCITY*2.0;
	velocity[1] = crandom()*EXP_VELOCITY*2.0;
	velocity[2] = EXP_JUMP + crandom()*EXP_VELOCITY;
	CG_LaunchExplode( origin, velocity, cgs.media.smoke2 );

	VectorCopy( playerOrigin, origin );
	velocity[0] = crandom()*EXP_VELOCITY*2.5;
	velocity[1] = crandom()*EXP_VELOCITY*2.5;
	velocity[2] = EXP_JUMP + crandom()*EXP_VELOCITY;
	CG_LaunchExplode( origin, velocity, cgs.media.smoke2 );
}

/*
==================
CG_LaunchFragment
==================
*/
void CG_LaunchFragment( vec3_t origin, vec3_t velocity, leTrailType_t trailType, qhandle_t hModel ) {
	localEntity_t	*le;
	refEntity_t		*re;

	le = CG_AllocLocalEntity();
	re = &le->refEntity;

	le->leType = LE_FRAGMENT;
	le->startTime = cg.time;
	le->endTime = le->startTime + 80000 + random() * 3000;

	VectorCopy( origin, re->origin );
	AxisCopy( axisDefault, re->axis );
	re->hModel = hModel;

	le->pos.trType = TR_GRAVITY;
	VectorCopy( origin, le->pos.trBase );
	VectorCopy( velocity, le->pos.trDelta );
	le->pos.trTime = cg.time;

	le->bounceFactor = 0.6f;

	if ( trailType == LETT_BLOOD ) {
		le->leBounceSoundType = LEBS_BLOOD;
		le->leMarkType = LEMT_BLOOD;
	} else {
		le->leBounceSoundType = LEBS_NONE;
		le->leMarkType = LEMT_NONE;
	}

	
	le->leTrailType = trailType;
}

/*
===================
CG_ShowDebris

Generated a bunch of debris launching out from an entity's location
===================
*/
void CG_ShowDebris( vec3_t srcOrigin, int count, int evType ) {
	vec3_t	origin, velocity;
	int i, r;

	for (i = 0; i < count; i++) {
		VectorCopy( srcOrigin, origin );
		velocity[0] = crandom()*GIB_VELOCITY;
		velocity[1] = crandom()*GIB_VELOCITY;
		velocity[2] = GIB_JUMP + crandom()*GIB_VELOCITY;
		
		if ( evType == EV_EMIT_DEBRIS_LIGHT ) {
			r = rand() % 8;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight1 );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight2 );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight3 );
			else if (r == 3)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight4 );
			else if (r == 4)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight5 );
			else if (r == 5)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight6 );
			else if (r == 6)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight7 );
			else if (r == 7)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislight8 );
		}

		if ( evType == EV_EMIT_DEBRIS_DARK ) {
			r = rand() % 8;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark1 );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark2 );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark3 );
			else if (r == 3)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark4 );
			else if (r == 4)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark5 );
			else if (r == 5)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark6 );
			else if (r == 6)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark7 );
			else if (r == 7)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdark8 );
		}

		if ( evType == EV_EMIT_DEBRIS_LIGHT_LARGE ) {
			r = rand() % 3;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislightlarge1 );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislightlarge2 );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrislightlarge3 );
		}

		if ( evType == EV_EMIT_DEBRIS_DARK_LARGE ) {
			r = rand() % 3;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdarklarge1 );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdarklarge2 );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_CONCRETE, cgs.media.debrisdarklarge3 );
		}

		if ( evType == EV_EMIT_DEBRIS_WOOD ) {
			r = rand() % 5;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_WOOD, cgs.media.debriswood1 );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_WOOD, cgs.media.debriswood2 );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_WOOD, cgs.media.debriswood3 );
			else if (r == 3)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_WOOD, cgs.media.debriswood4 );
			else if (r == 4)
				CG_LaunchFragment( origin, velocity, LETT_DEBRIS_WOOD, cgs.media.debriswood5 );
		}

		if ( evType == EV_EMIT_DEBRIS_FLESH ) {
			r = rand() % 10;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibSkull );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibBrain );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibAbdomen );
			else if (r == 3)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibArm );
			else if (r == 4)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibChest );
			else if (r == 5)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibFist );
			else if (r == 6)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibFoot );
			else if (r == 7)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibForearm );
			else if (r == 8)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibIntestine );
			else if (r == 9)
				CG_LaunchFragment( origin, velocity, LETT_BLOOD, cgs.media.gibLeg );
		}

		if ( evType == EV_EMIT_DEBRIS_GLASS ) {
			r = rand() % 15;	//we're getting twice the number of small shards as big shards this way
			if (r == 0 || r == 1)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglass1 );
			else if (r == 2 || r == 3)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglass2 );
			else if (r == 4 || r == 5)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglass3 );
			else if (r == 6 || r == 7)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglass4 );
			else if (r == 8 || r == 9)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglass5 );
			else if (r == 10)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglasslarge1 );
			else if (r == 11)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglasslarge2 );
			else if (r == 12)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglasslarge3 );
			else if (r == 13)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglasslarge4 );
			else if (r == 14)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisglasslarge5 );
		}

		if ( evType == EV_EMIT_DEBRIS_STONE ) {
			r = rand() % 5;
			if (r == 0)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisstone1 );
			else if (r == 1)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisstone2 );
			else if (r == 2)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisstone3 );
			else if (r == 3)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisstone4 );
			else if (r == 4)
				CG_LaunchFragment( origin, velocity, LETT_NONE, cgs.media.debrisstone5 );		
		}
	}
}


/*
===================
CG_StartEarthquake

Starts an earthquake effect
===================
*/
int flagEarthquake = qfalse;
int earthquakeIntensity = 0;
int earthquakeStoptime = 0;

void CG_StartEarthquake(int intensity, int duration)
{
	flagEarthquake = qtrue;
	if ( intensity < earthquakeIntensity )
		return;
	
	earthquakeIntensity = intensity;
	earthquakeStoptime = cg.time + duration;
}

void CG_Earthquake()
{
	static float terremotoX, terremotoY, terremotoZ;
	static terremotoTime = 0;
	float realInt;

	if ( !flagEarthquake )
		return;

	if ( earthquakeStoptime < cg.time )
	{
		flagEarthquake = qfalse;
		earthquakeIntensity = 0;
		return;
	}

	if ( terremotoTime < cg.time )
	{
		terremotoTime = cg.time += 50;
		realInt = ((float)earthquakeIntensity + 1.0) / 2.0;
		terremotoX = random() * realInt - realInt / 2;
		terremotoY = random() * realInt - realInt / 2;
		terremotoZ = random() * realInt - realInt / 2;
	}
	cg.refdefViewAngles[0] += terremotoX;
	cg.refdefViewAngles[1] += terremotoY;
	cg.refdefViewAngles[2] += terremotoZ;
	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
}

/*
===================
CG_ExplosionParticles

Shows particles
===================
*/
void CG_Particles( vec3_t origin, int count, int speed, int lifetime, int radius, int type, byte r, byte g, byte b ) {
	int jump; // amount to nudge the particles trajectory vector up by
	qhandle_t shader; // shader to use for the particles
	int index;
	vec3_t randVec, tempVec;
	qboolean moveUp;

	//jump = 70;
	jump = speed;
	shader = cgs.media.sparkShader;

	for ( index = 0; index < count; index++ ) {
		localEntity_t *le;
		refEntity_t *re;

		le = CG_AllocLocalEntity(); //allocate a local entity
		re = &le->refEntity;
		le->leFlags = LEF_PUFF_DONT_SCALE; //don't change the particle size
		le->leType = LE_MOVE_SCALE_FADE; // particle should fade over time
		le->startTime = cg.time; // set the start time of the particle to the current time
		le->endTime = cg.time + lifetime + (random() * (lifetime / 2));	//life time will be anywhere between [lifetime] and [lifetime * 1.5]
		le->lifeRate = 1.0 / ( le->endTime - le->startTime );
		re = &le->refEntity;
		re->shaderTime = cg.time / 1000.0f;
		re->reType = RT_SPRITE;
		re->rotation = 0;
		re->radius = radius;
		re->customShader = shader;
		re->shaderRGBA[0] = r;
		re->shaderRGBA[1] = g;
		re->shaderRGBA[2] = b;
		re->shaderRGBA[3] = 0xFF;
		le->color[3] = 1.0;
		if ( type == PT_GRAVITY )
			le->pos.trType = TR_GRAVITY; // moves in a gravity affected arc
		else
			le->pos.trType = TR_LINEAR; // moves in straight line, outward from the origin
		le->pos.trTime = cg.time;
		VectorCopy( origin, le->pos.trBase );
		VectorCopy( origin, re->origin );

		tempVec[0] = crandom(); //between 1 and -1
		tempVec[1] = crandom();
		tempVec[2] = crandom();
		VectorNormalize(tempVec);
		VectorScale(tempVec, speed, randVec);

		if ( type == PT_GRAVITY || type == PT_LINEAR_UP )
			moveUp = qtrue;
		else if ( type == PT_LINEAR_DOWN )
			moveUp = qfalse;
		else if (crandom() < 0)
			moveUp = qtrue;
		else
			moveUp = qfalse;
		

		if (moveUp)
			randVec[2] += jump; //nudge the particles up a bit
		else
			randVec[2] -= jump; //nudge the particles down a bit

		VectorCopy( randVec, le->pos.trDelta );	
	}
}

/*
===================
CG_ParticlesFromEntityState

Takes entitystate and extracts data inside to use for CG_Particles.
es->constantLight is used for the color of the particles.
es->eventParm is used for the number of particles.
es->generic1 is used for the speed of the particles.
===================
*/
void CG_ParticlesFromEntityState( vec3_t origin, int type, entityState_t *es) {
	byte r, g, b;
	int lifetime = 3000;
	int radius = 3;
	int speed = es->generic1;
	
	r = es->constantLight & 255;
	g = ( es->constantLight >> 8 ) & 255;
	b = ( es->constantLight >> 16 ) & 255;
	radius = es->generic2;

	CG_Particles( origin, es->eventParm, speed, lifetime, radius, type, r, g, b );
}
