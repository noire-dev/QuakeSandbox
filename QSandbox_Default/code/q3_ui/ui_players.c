// Copyright (C) 1999-2000 Id Software, Inc.
//
// ui_players.c




#include "ui_local.h"


#define UI_TIMER_GESTURE		2300
#define UI_TIMER_JUMP			1000
#define UI_TIMER_LAND			130
#define UI_TIMER_WEAPON_SWITCH	300
#define UI_TIMER_ATTACK			500
#define	UI_TIMER_MUZZLE_FLASH	20
#define	UI_TIMER_WEAPON_DELAY	250

#define JUMP_HEIGHT				56

#define SWINGSPEED				0.3f

#define SPIN_SPEED				0.9f
#define COAST_TIME				1000

#define DEFAULT_MODEL	"sarge"
#define IDLE_ANIM_STARTTIME 	8000

#define ANIM_SLOWDOWN 			1.7

#define LIGHTNING_SFX_DURATION	964


#define MODELSPIN_STOP "menu/uie_art/rotate_stop"
#define MODELSPIN_STOP1 "menu/uie_art/rotate_stop1"
#define MODELSPIN_PAUSE "menu/uie_art/rotate_pause"
#define MODELSPIN_PAUSE1 "menu/uie_art/rotate_pause1"
#define MODELSPIN_LEFT "menu/uie_art/rotate_left"
#define MODELSPIN_LEFT1 "menu/uie_art/rotate_left1"
#define MODELSPIN_RIGHT "menu/uie_art/rotate_right"
#define MODELSPIN_RIGHT1 "menu/uie_art/rotate_right1"


#define ID_MODELSPIN_STOP   1
#define ID_MODELSPIN_LEFT   2
#define ID_MODELSPIN_RIGHT	3
#define ID_MODELSPIN_PAUSE	4




// copied from cg_local.h
typedef enum {
	FOOTSTEP_NORMAL,
	FOOTSTEP_BOOT,
	FOOTSTEP_FLESH,
	FOOTSTEP_MECH,
	FOOTSTEP_ENERGY,
	FOOTSTEP_METAL,
	FOOTSTEP_SPLASH,

	FOOTSTEP_TOTAL
} footstep_t;


typedef struct {
	sfxHandle_t		gesture;
	sfxHandle_t		footstep;
	sfxHandle_t		jump;
	sfxHandle_t		land;
	sfxHandle_t 	death1;
	sfxHandle_t 	death2;
	sfxHandle_t 	death3;
    sfxHandle_t		drop;

	footstep_t footsteps;
	sfxHandle_t step[4];
} sfxModel_t;



typedef struct {
	sfxHandle_t	flash[MAX_WEAPONS][4];
	sfxHandle_t	firing[MAX_WEAPONS];
} sfxWeapon_t;


static qboolean		weaponSfxInit = qfalse;
static sfxWeapon_t	sfxWeapon;
static sfxModel_t	sfxModel;
static int			dp_realtime;
static float		jumpHeight;
static int			forceNextAnim;

// set team model drawing here so all modelAnim_t
// structs use the same value
static qboolean drawTeamModel = qfalse;

// Detection for model code crashing the UI (VM builds)
// never expected to be true in a public release,
// but might allow the UI to run if bugs have been
// introduced into the model code
static qboolean		crashProtected;
static qboolean		startupCrashDetect = qtrue;
static int 			crashAnimCount = 3;

char* ui_footstepName[] = {
	"step",
	"boot",
	"flesh",
	"mech",
	"energy",
	"clank",
	"splash"
};


static int PlayerInfo_WeaponCycleTime( playerInfo_t* m);



/*
=================
PlayerInfo_CacheWeaponSfx
=================
*/
static void PlayerInfo_CacheWeaponSfx( void )
{
	memset(&sfxWeapon, 0, sizeof(sfxWeapon));

	sfxWeapon.flash[WP_GAUNTLET][0] = trap_S_RegisterSound( "sound/weapons/melee/fstatck.wav", qfalse );
	sfxWeapon.flash[WP_MACHINEGUN][0] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf1b.wav", qfalse );
	sfxWeapon.flash[WP_MACHINEGUN][1] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf2b.wav", qfalse );
	sfxWeapon.flash[WP_MACHINEGUN][2] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf3b.wav", qfalse );
	sfxWeapon.flash[WP_MACHINEGUN][3] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf4b.wav", qfalse );
	sfxWeapon.flash[WP_SHOTGUN][0] = trap_S_RegisterSound( "sound/weapons/shotgun/sshotf1b.wav", qfalse );
	sfxWeapon.flash[WP_GRENADE_LAUNCHER][0] = trap_S_RegisterSound( "sound/weapons/grenade/grenlf1a.wav", qfalse );
	sfxWeapon.flash[WP_ROCKET_LAUNCHER][0] = trap_S_RegisterSound( "sound/weapons/rocket/rocklf1a.wav", qfalse );
	sfxWeapon.flash[WP_LIGHTNING][0] = trap_S_RegisterSound( "sound/weapons/lightning/lg_fire.wav", qfalse );
	sfxWeapon.flash[WP_RAILGUN][0] = trap_S_RegisterSound( "sound/weapons/railgun/railgf1a.wav", qfalse );
	sfxWeapon.flash[WP_PLASMAGUN][0] = trap_S_RegisterSound( "sound/weapons/plasma/hyprbf1a.wav", qfalse );
	sfxWeapon.flash[WP_BFG][0] = trap_S_RegisterSound( "sound/weapons/bfg/bfg_fire.wav", qfalse );
	sfxWeapon.flash[WP_GRAPPLING_HOOK][0] = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );

	sfxWeapon.firing[WP_LIGHTNING] = trap_S_RegisterSound( "sound/weapons/lightning/lg_hum.wav", qfalse );
	sfxWeapon.firing[WP_GAUNTLET] = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );
	sfxWeapon.firing[WP_GRAPPLING_HOOK] = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );

	weaponSfxInit = qtrue;
}


/*
===============
PlayerInfo_FireWeaponSound
===============
*/
static void PlayerInfo_FireWeaponSound(playerInfo_t* pi)
{
	int index;
	int weapon;

	weapon = pi->weapon;
	pi->muzzleFlashTime = dp_realtime + UI_TIMER_MUZZLE_FLASH;
	if (weapon == WP_GAUNTLET)
		pi->muzzleFlashTime += UI_TIMER_MUZZLE_FLASH * 2;

	// allows muzzle flash to start, before returning	
	if (!uie_animsfx.integer)
		return;

	if (weapon == WP_LIGHTNING) {
		if (pi->humTimer > 0)
			return;

		pi->humTimer = 1;	// force start on next display	
	}

	index = 0;
	if (weapon == WP_MACHINEGUN) {
		index = rand() & 3;
	}
	trap_S_StartLocalSound( sfxWeapon.flash[weapon][index], CHAN_WEAPON );
}




/*
===============
PlayerInfo_PlayModelSound
===============
*/
static void PlayerInfo_PlayModelSound(int torsoAnim, int legsAnim)
{
	sfxHandle_t sfx;
	int channel;

	if (!uie_animsfx.integer)
		return;

	sfx = 0;
	channel = CHAN_VOICE;
	switch (torsoAnim) {
	case TORSO_GESTURE:
		sfx = sfxModel.gesture;
		break;
	case BOTH_DEATH1:
		sfx = sfxModel.death1;
		break;
	case BOTH_DEATH2:
		sfx = sfxModel.death2;
		break;
	case BOTH_DEATH3:
		sfx = sfxModel.death3;
		break;
	case TORSO_DROP:
		sfx = sfxModel.drop;
		channel = CHAN_BODY;
		break;
	}

	if (sfx)
		trap_S_StartLocalSound( sfx, channel);

	sfx = 0;
	switch (legsAnim) {
	case LEGS_JUMP:
		sfx = sfxModel.jump;
		break;
	case LEGS_LAND:
		sfx = sfxModel.land;
		break;	
	}

	if (sfx)
		trap_S_StartLocalSound( sfx, CHAN_BODY);
}


/*
===============
PlayerInfo_PlayModelFootstep
===============
*/
static void PlayerInfo_PlayModelFootstep(playerInfo_t* pi)
{
	lerpFrame_t* lf;
	animation_t* anim;
	int f, old, mid, animNum;

	if (!uie_animsfx.integer)
		return;

	old = pi->oldFrame;
	lf = &pi->legs;
	anim = lf->animation;
	f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;

	if ( f >= anim->numFrames ) {
		f -= anim->numFrames;
		if ( anim->loopFrames ) {
			f %= anim->loopFrames;
			f += anim->numFrames - anim->loopFrames;
		}
	}
	pi->oldFrame = f;

	animNum = lf->animationNumber & ~ANIM_TOGGLEBIT;
	if (animNum != LEGS_RUN && animNum != LEGS_BACK)
		return; 

	mid = anim->numFrames/2;
	if ((old <= mid && f > mid) || (old > f && f >= 0) )
		trap_S_StartLocalSound( sfxModel.step[rand() & 3], CHAN_BODY );
}



/*
===============
UI_PlayerInfo_SetWeapon
===============
*/
static void UI_PlayerInfo_SetWeapon( playerInfo_t *pi, weapon_t weaponNum ) {
	gitem_t *	item;
	char		path[MAX_QPATH];

	pi->currentWeapon = weaponNum;
tryagain:
	pi->realWeapon = weaponNum;
	pi->weaponModel = 0;
	pi->barrelModel = 0;
	pi->flashModel = 0;

	if ( weaponNum == WP_NONE ) {
		return;
	}

	for ( item = bg_itemlist + 1; item->classname ; item++ ) {
		if ( item->giType != IT_WEAPON ) {
			continue;
		}
		if ( item->giTag == weaponNum ) {
			break;
		}
	}

	if ( item->classname ) {
		pi->weaponModel = trap_R_RegisterModel( item->world_model[0] );
	}

	if( pi->weaponModel == 0 ) {
		if( weaponNum == WP_MACHINEGUN ) {
			weaponNum = WP_NONE;
			goto tryagain;
		}
		weaponNum = WP_MACHINEGUN;
		goto tryagain;
	}

	if ( weaponNum == WP_MACHINEGUN || weaponNum == WP_GAUNTLET || weaponNum == WP_BFG ) {
		strcpy( path, item->world_model[0] );
		COM_StripExtensionOld( path, path );
		strcat( path, "_barrel.md3" );
		pi->barrelModel = trap_R_RegisterModel( path );
	}

	strcpy( path, item->world_model[0] );
	COM_StripExtensionOld( path, path );
	strcat( path, "_flash.md3" );
	pi->flashModel = trap_R_RegisterModel( path );

	switch( weaponNum ) {
	case WP_GAUNTLET:
		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1.0f );
		break;

	case WP_MACHINEGUN:
		MAKERGB( pi->flashDlightColor, 1.0f, 1.0f, 0.0f );
		break;

	case WP_SHOTGUN:
		MAKERGB( pi->flashDlightColor, 1.0f, 1.0f, 0.0f );
		break;

	case WP_GRENADE_LAUNCHER:
		MAKERGB( pi->flashDlightColor, 1.0f, 0.7f, 0.5f );
		break;

	case WP_ROCKET_LAUNCHER:
		MAKERGB( pi->flashDlightColor, 1.0f, 0.75f, 0.0f );
		break;

	case WP_LIGHTNING:
		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1.0f );
		break;

	case WP_RAILGUN:
		MAKERGB( pi->flashDlightColor, 1.0f, 0.5f, 0.0f );
		break;

	case WP_PLASMAGUN:
		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1.0f );
		break;

	case WP_BFG:
		MAKERGB( pi->flashDlightColor, 1.0f, 0.7f, 1.0f );
		break;

	case WP_GRAPPLING_HOOK:
		MAKERGB( pi->flashDlightColor, 0.6f, 0.6f, 1.0f );
		break;

	default:
		MAKERGB( pi->flashDlightColor, 1.0f, 1.0f, 1.0f );
		break;
	}
}


/*
===============
UI_ForceLegsAnim
===============
*/
static void UI_ForceLegsAnim( playerInfo_t *pi, int anim ) {
	pi->legsAnim = ( ( pi->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;

	if ( anim == LEGS_JUMP ) {
		pi->legsAnimationTimer = UI_TIMER_JUMP;
	}
}


/*
===============
UI_SetLegsAnim
===============
*/
static void UI_SetLegsAnim( playerInfo_t *pi, int anim ) {
	if ( pi->pendingLegsAnim ) {
		anim = pi->pendingLegsAnim;
		pi->pendingLegsAnim = 0;
	}
	UI_ForceLegsAnim( pi, anim );
}


/*
===============
UI_ForceTorsoAnim
===============
*/
static void UI_ForceTorsoAnim( playerInfo_t *pi, int anim ) {
	pi->torsoAnim = ( ( pi->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;

	if ( anim == TORSO_GESTURE ) {
		pi->torsoAnimationTimer = UI_TIMER_GESTURE;
	}

	if ( anim == TORSO_ATTACK || anim == TORSO_ATTACK2 ) {
		pi->torsoAnimationTimer = UI_TIMER_ATTACK;
	}
}


/*
===============
UI_SetTorsoAnim
===============
*/
static void UI_SetTorsoAnim( playerInfo_t *pi, int anim ) {
	if ( pi->pendingTorsoAnim ) {
		anim = pi->pendingTorsoAnim;
		pi->pendingTorsoAnim = 0;
	}

	UI_ForceTorsoAnim( pi, anim );
}


/*
===============
UI_TorsoSequencing
===============
*/
static void UI_TorsoSequencing( playerInfo_t *pi ) {
	int		currentAnim;

	currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;

	if ( pi->weapon != pi->currentWeapon ) {
		if ( currentAnim != TORSO_DROP ) {
			pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
			UI_ForceTorsoAnim( pi, TORSO_DROP );
		}
	}

	if ( pi->torsoAnimationTimer > 0 ) {
		return;
	}

	if( currentAnim == TORSO_GESTURE ) {
		UI_SetTorsoAnim( pi, TORSO_STAND );
		return;
	}

	if( currentAnim == TORSO_ATTACK || currentAnim == TORSO_ATTACK2 ) {
		UI_SetTorsoAnim( pi, TORSO_STAND );
		return;
	}

	if ( currentAnim == TORSO_DROP ) {
		UI_PlayerInfo_SetWeapon( pi, pi->weapon );
		pi->torsoAnimationTimer = UI_TIMER_WEAPON_SWITCH;
		UI_ForceTorsoAnim( pi, TORSO_RAISE );
		return;
	}

	if ( currentAnim == TORSO_RAISE ) {
		UI_SetTorsoAnim( pi, TORSO_STAND );
		return;
	}
}


/*
===============
UI_LegsSequencing
===============
*/
static void UI_LegsSequencing( playerInfo_t *pi ) {
	int		currentAnim;

	currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;

	if ( pi->legsAnimationTimer > 0 ) {
		if ( currentAnim == LEGS_JUMP ) {
			jumpHeight = JUMP_HEIGHT * sin( M_PI * ( UI_TIMER_JUMP - pi->legsAnimationTimer ) / UI_TIMER_JUMP );
		}
		return;
	}

	if ( currentAnim == LEGS_JUMP ) {
		UI_ForceLegsAnim( pi, LEGS_LAND );
		pi->legsAnimationTimer = UI_TIMER_LAND;
		jumpHeight = 0;
		return;
	}

	if ( currentAnim == LEGS_LAND ) {
		PlayerInfo_PlayModelSound(-1, LEGS_LAND);
		UI_SetLegsAnim( pi, LEGS_IDLE );
		return;
	}
}


/*
======================
UI_PositionEntityOnTag
======================
*/
static void UI_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
							clipHandle_t parentModel, char *tagName ) {
	int				i;
	orientation_t	lerped;
	
	// lerp the tag
	trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
		1.0 - parent->backlerp, tagName );

	// FIXME: allow origin offsets along tag?
	VectorCopy( parent->origin, entity->origin );
	for ( i = 0 ; i < 3 ; i++ ) {
		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
	}

	// cast away const because of compiler problems
	MatrixMultiply( lerped.axis, ((refEntity_t*)parent)->axis, entity->axis );
	entity->backlerp = parent->backlerp;
}


/*
======================
UI_PositionRotatedEntityOnTag
======================
*/
static void UI_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
							clipHandle_t parentModel, char *tagName ) {
	int				i;
	orientation_t	lerped;
	vec3_t			tempAxis[3];

	// lerp the tag
	trap_CM_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
		1.0 - parent->backlerp, tagName );

	// FIXME: allow origin offsets along tag?
	VectorCopy( parent->origin, entity->origin );
	for ( i = 0 ; i < 3 ; i++ ) {
		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
	}

	// cast away const because of compiler problems
	MatrixMultiply( entity->axis, ((refEntity_t *)parent)->axis, tempAxis );
	MatrixMultiply( lerped.axis, tempAxis, entity->axis );
}


/*
===============
UI_SetLerpFrameAnimation
===============
*/
static void UI_SetLerpFrameAnimation( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
	animation_t	*anim;

	lf->animationNumber = newAnimation;
	newAnimation &= ~ANIM_TOGGLEBIT;

	if ( newAnimation < 0 || newAnimation >= MAX_ANIMATIONS ) {
		trap_Error( va("Bad animation number: %i", newAnimation) );
	}

	anim = &ci->animations[ newAnimation ];

	lf->animation = anim;
	lf->animationTime = lf->frameTime + anim->initialLerp;
}


/*
===============
UI_RunLerpFrame
===============
*/
static void UI_RunLerpFrame( playerInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
	int			f;
	animation_t	*anim;

	// see if the animation sequence is switching
	if ( newAnimation != lf->animationNumber || !lf->animation ) {
		UI_SetLerpFrameAnimation( ci, lf, newAnimation );
	}

	// if we have passed the current frame, move it to
	// oldFrame and calculate a new frame
	if ( dp_realtime >= lf->frameTime ) {
		lf->oldFrame = lf->frame;
		lf->oldFrameTime = lf->frameTime;

		// get the next frame based on the animation
		anim = lf->animation;
		if ( dp_realtime < lf->animationTime ) {
			lf->frameTime = lf->animationTime;		// initial lerp
		} else {
			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
		}
		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
		if ( f >= anim->numFrames ) {
			f -= anim->numFrames;
			if ( anim->loopFrames ) {
				f %= anim->loopFrames;
				f += anim->numFrames - anim->loopFrames;
			} else {
				f = anim->numFrames - 1;
				// the animation is stuck at the end, so it
				// can immediately transition to another sequence
				lf->frameTime = dp_realtime;
			}
		}
		lf->frame = anim->firstFrame + f;
		if ( dp_realtime > lf->frameTime ) {
			lf->frameTime = dp_realtime;
		}
	}

	if ( lf->frameTime > dp_realtime + 200 ) {
		lf->frameTime = dp_realtime;
	}

	if ( lf->oldFrameTime > dp_realtime ) {
		lf->oldFrameTime = dp_realtime;
	}
	// calculate current lerp value
	if ( lf->frameTime == lf->oldFrameTime ) {
		lf->backlerp = 0;
	} else {
		lf->backlerp = 1.0 - (float)( dp_realtime - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
	}
}


/*
===============
UI_PlayerAnimation
===============
*/
static void UI_PlayerAnimation( playerInfo_t *pi, int *legsOld, int *legs, float *legsBackLerp,
						int *torsoOld, int *torso, float *torsoBackLerp ) {

	// legs animation
	pi->legsAnimationTimer -= uis.frametime;
	if ( pi->legsAnimationTimer < 0 ) {
		pi->legsAnimationTimer = 0;
	}

	UI_LegsSequencing( pi );

	if ( pi->legs.yawing && ( pi->legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
		UI_RunLerpFrame( pi, &pi->legs, LEGS_TURN );
	} else {
		UI_RunLerpFrame( pi, &pi->legs, pi->legsAnim );
	}
	*legsOld = pi->legs.oldFrame;
	*legs = pi->legs.frame;
	*legsBackLerp = pi->legs.backlerp;

	// torso animation
	pi->torsoAnimationTimer -= uis.frametime;
	if ( pi->torsoAnimationTimer < 0 ) {
		pi->torsoAnimationTimer = 0;
	}

	UI_TorsoSequencing( pi );

	UI_RunLerpFrame( pi, &pi->torso, pi->torsoAnim );
	*torsoOld = pi->torso.oldFrame;
	*torso = pi->torso.frame;
	*torsoBackLerp = pi->torso.backlerp;
}


/*
==================
UI_SwingAngles
==================
*/
static void UI_SwingAngles( float destination, float swingTolerance, float clampTolerance,
					float speed, float *angle, qboolean *swinging ) {
	float	swing;
	float	move;
	float	scale;

	if ( !*swinging ) {
		// see if a swing should be started
		swing = AngleSubtract( *angle, destination );
		if ( swing > swingTolerance || swing < -swingTolerance ) {
			*swinging = qtrue;
		}
	}

	if ( !*swinging ) {
		return;
	}
	
	// modify the speed depending on the delta
	// so it doesn't seem so linear
	swing = AngleSubtract( destination, *angle );
	scale = fabs( swing );
	if ( scale < swingTolerance * 0.5 ) {
		scale = 0.5;
	} else if ( scale < swingTolerance ) {
		scale = 1.0;
	} else {
		scale = 2.0;
	}

	// swing towards the destination angle
	if ( swing >= 0 ) {
		move = uis.frametime * scale * speed;
		if ( move >= swing ) {
			move = swing;
			*swinging = qfalse;
		}
		*angle = AngleMod( *angle + move );
	} else if ( swing < 0 ) {
		move = uis.frametime * scale * -speed;
		if ( move <= swing ) {
			move = swing;
			*swinging = qfalse;
		}
		*angle = AngleMod( *angle + move );
	}

	// clamp to no more than tolerance
	swing = AngleSubtract( destination, *angle );
	if ( swing > clampTolerance ) {
		*angle = AngleMod( destination - (clampTolerance - 1) );
	} else if ( swing < -clampTolerance ) {
		*angle = AngleMod( destination + (clampTolerance - 1) );
	}
}


/*
======================
UI_MovedirAdjustment
======================
*/
static float UI_MovedirAdjustment( playerInfo_t *pi ) {
	vec3_t		relativeAngles;
	vec3_t		moveVector;

	VectorSubtract( pi->viewAngles, pi->moveAngles, relativeAngles );
	AngleVectors( relativeAngles, moveVector, NULL, NULL );
	if ( Q_fabs( moveVector[0] ) < 0.01 ) {
		moveVector[0] = 0.0;
	}
	if ( Q_fabs( moveVector[1] ) < 0.01 ) {
		moveVector[1] = 0.0;
	}

	if ( moveVector[1] == 0 && moveVector[0] > 0 ) {
		return 0;
	}
	if ( moveVector[1] < 0 && moveVector[0] > 0 ) {
		return 22;
	}
	if ( moveVector[1] < 0 && moveVector[0] == 0 ) {
		return 45;
	}
	if ( moveVector[1] < 0 && moveVector[0] < 0 ) {
		return -22;
	}
	if ( moveVector[1] == 0 && moveVector[0] < 0 ) {
		return 0;
	}
	if ( moveVector[1] > 0 && moveVector[0] < 0 ) {
		return 22;
	}
	if ( moveVector[1] > 0 && moveVector[0] == 0 ) {
		return  -45;
	}

	return -22;
}


/*
===============
UI_PlayerAngles
===============
*/
static void UI_PlayerAngles( modelAnim_t* m, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
	vec3_t		legsAngles, torsoAngles, headAngles;
	float		dest;
	float		adjust;
	float		delta;
	playerInfo_t *pi;
	modelRotate_t* mr;

	pi = &m->player;
	VectorCopy( pi->viewAngles, headAngles );
	headAngles[YAW] = AngleMod( headAngles[YAW] );
	VectorClear( legsAngles );
	VectorClear( torsoAngles );

	// --------- yaw -------------

	// allow yaw to drift a bit
	if ( ( pi->legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE
		|| ( pi->torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
		// if not standing still, always point all in the same direction
		pi->torso.yawing = qtrue;	// always center
		pi->torso.pitching = qtrue;	// always center
		pi->legs.yawing = qtrue;	// always center
	}

	// adjust legs for movement dir
	adjust = UI_MovedirAdjustment( pi );
	legsAngles[YAW] = headAngles[YAW] + adjust;
	torsoAngles[YAW] = headAngles[YAW] + 0.25 * adjust;


	// torso
	UI_SwingAngles( torsoAngles[YAW], 25.0f, 90.0f, SWINGSPEED, &pi->torso.yawAngle, &pi->torso.yawing );
	UI_SwingAngles( legsAngles[YAW], 40.0f, 90.0f, SWINGSPEED, &pi->legs.yawAngle, &pi->legs.yawing );

	torsoAngles[YAW] = pi->torso.yawAngle;
	legsAngles[YAW] = pi->legs.yawAngle;

	// --------- pitch -------------

	// only show a fraction of the pitch angle in the torso
	if ( headAngles[PITCH] > 180 ) {
		dest = (-360 + headAngles[PITCH]) * 0.75;
	} else {
		dest = headAngles[PITCH] * 0.75;
	}
	UI_SwingAngles( dest, 15, 30, 0.1f, &pi->torso.pitchAngle, &pi->torso.pitching );
	torsoAngles[PITCH] = pi->torso.pitchAngle;

	if (pi->fixedtorso) {
		torsoAngles[PITCH] = 0.0f;
	}

	if (pi->fixedlegs) {
		legsAngles[YAW] = torsoAngles[YAW];
		legsAngles[PITCH] = 0.0f;
		legsAngles[ROLL] = 0.0f;
	}

	// pull the angles back out of the hierarchial chain
	AnglesSubtract( headAngles, torsoAngles, headAngles );
	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );

	// ------------- model rotation ----------------

	// Insert model rotation into legs only
	// Torso and head are relative to the legs
	// Do this here, before animation makes model "step" to rotate 
	mr = &m->spin;
	if (mr->useSpin) {
		delta = 0.0;
		if (!mr->paused) {
			// roate at 90 degrees every 4 seconds
			// or multiples of
			delta = (float)(mr->rotate * uis.frametime) * 0.0225;

			mr->yaw += delta;
			if (mr->yaw > 360.0)
				mr->yaw -= 360.0;

			if (mr->yaw < -360.0)
				mr->yaw += 360.0;

		}
		legsAngles[YAW] += mr->yaw;
	}

	AnglesToAxis( legsAngles, legs );
	AnglesToAxis( torsoAngles, torso );
	AnglesToAxis( headAngles, head );
}


/*
===============
UI_PlayerFloatSprite
===============
*/
static void UI_PlayerFloatSprite( playerInfo_t *pi, vec3_t origin, qhandle_t shader ) {
	refEntity_t		ent;

	memset( &ent, 0, sizeof( ent ) );
	VectorCopy( origin, ent.origin );
	ent.origin[2] += 48;
	ent.reType = RT_SPRITE;
	ent.customShader = shader;
	ent.radius = 10;
	ent.renderfx = 0;
	trap_R_AddRefEntityToScene( &ent );
}


/*
======================
UI_MachinegunSpinAngle
======================
*/
float	UI_MachinegunSpinAngle( playerInfo_t *pi ) {
	int		delta;
	float	angle;
	float	speed;
	int		torsoAnim;

	delta = dp_realtime - pi->barrelTime;
	if ( pi->barrelSpinning ) {
		angle = pi->barrelAngle + delta * SPIN_SPEED;
	} else {
		if ( delta > COAST_TIME ) {
			delta = COAST_TIME;
		}

		speed = 0.5 * ( SPIN_SPEED + (float)( COAST_TIME - delta ) / COAST_TIME );
		angle = pi->barrelAngle + delta * speed;
	}

	torsoAnim = pi->torsoAnim  & ~ANIM_TOGGLEBIT;
	if( torsoAnim == TORSO_ATTACK2 ) {
		torsoAnim = TORSO_ATTACK;
	}
	if ( pi->barrelSpinning == !(torsoAnim == TORSO_ATTACK) ) {
		pi->barrelTime = dp_realtime;
		pi->barrelAngle = AngleMod( angle );
		pi->barrelSpinning = !!(torsoAnim == TORSO_ATTACK);
	}

	return angle;
}


/*
===============
UI_DrawPlayer
===============
*/
static void UI_DrawPlayer( float x, float y, float w, float h, modelAnim_t *m, int time ) {
	refdef_t		refdef;
	refEntity_t		legs;
	refEntity_t		torso;
	refEntity_t		head;
	refEntity_t		gun;
	refEntity_t		barrel;
	refEntity_t		flash;
	vec3_t			origin;
	int				renderfx;
	vec3_t			mins = {-16, -16, -24};
	vec3_t			maxs = {16, 16, 32};
	float			len;
	float			xx;
	playerInfo_t	*pi;

	pi = &m->player;	
	if ( !pi->legsModel || !pi->torsoModel || !pi->headModel || !pi->animations[0].numFrames ) {
		return;
	}

	dp_realtime = time;

	if ( pi->pendingWeapon != -1 && dp_realtime > pi->weaponTimer ) {
		pi->weapon = pi->pendingWeapon;
		pi->lastWeapon = pi->pendingWeapon;
		pi->pendingWeapon = -1;
		pi->weaponTimer = 0;
		if( pi->currentWeapon != pi->weapon ) {
			if (uie_animsfx.integer)
				trap_S_StartLocalSound( trap_S_RegisterSound( "sound/weapons/change.wav", qfalse ), CHAN_WEAPON );
		}
	}

	UI_AdjustFrom640( &x, &y, &w, &h );

	y -= jumpHeight;

	memset( &refdef, 0, sizeof( refdef ) );
	memset( &legs, 0, sizeof(legs) );
	memset( &torso, 0, sizeof(torso) );
	memset( &head, 0, sizeof(head) );

	refdef.rdflags = RDF_NOWORLDMODEL;

	AxisClear( refdef.viewaxis );

	refdef.x = x;
	refdef.y = y;
	refdef.width = w;
	refdef.height = h;

	refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
	xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
	refdef.fov_y = atan2( refdef.height, xx );
	refdef.fov_y *= ( 360 / M_PI );

	// calculate distance so the player nearly fills the box
	len = 0.7 * ( maxs[2] - mins[2] );		
	origin[0] = len / tan( DEG2RAD(refdef.fov_x) * 0.5 );
	origin[1] = 0.5 * ( mins[1] + maxs[1] );
	origin[2] = -0.5 * ( mins[2] + maxs[2] );

	refdef.time = dp_realtime;

	trap_R_ClearScene();

	// get the rotation information
	UI_PlayerAngles( m, legs.axis, torso.axis, head.axis );
	
	// get the animation state (after rotation, to allow feet shuffle)
	UI_PlayerAnimation( pi, &legs.oldframe, &legs.frame, &legs.backlerp,
		 &torso.oldframe, &torso.frame, &torso.backlerp );

	renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;

	//
	// add the legs
	//
	legs.hModel = pi->legsModel;
	legs.customSkin = pi->legsSkin;
if(trap_Cvar_VariableValue( "cg_ptex") == 1	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex1");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 2	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex2");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 3	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex3");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 4	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex4");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 5	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex5");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 6	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex6");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 7	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex7");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 8	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex8");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 9	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex9");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 10	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex10");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 11	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex11");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 12	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex12");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 13	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex13");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 14	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex14");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 15	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex15");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 16	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex16");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 17	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex17");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 18	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex18");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 19	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex19");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 20	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex20");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 21	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex21");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 22	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex22");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 23	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex23");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 24	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex24");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 25	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex25");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 26	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex26");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 27	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex27");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 28	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex28");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 29	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex29");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 30	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex30");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 31	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex31");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 32	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex32");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 33	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex33");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 34	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex34");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 35	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex35");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 36	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex36");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 37	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex37");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 38	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex38");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 39	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex39");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 40	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex40");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 41	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex41");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 42	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex42");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 43	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex43");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 44	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex44");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 45	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex45");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 46	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex46");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 47	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex47");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 48	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex48");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 49	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex49");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 50	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex50");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 51	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex51");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 52	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex52");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 53	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex53");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 54	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex54");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 55	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex55");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 56	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex56");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 57	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex57");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 58	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex58");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 59	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex59");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 60	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex60");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 61	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex61");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 62	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex62");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 63	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex63");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 64	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex64");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 65	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex65");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 66	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex66");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 67	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex67");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 68	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex68");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 69	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex69");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 70	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex70");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 71	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex71");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 72	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex72");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 73	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex73");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 74	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex74");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 75	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex75");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 76	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex76");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 77	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex77");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 78	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex78");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 79	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex79");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 80	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex80");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 81	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex81");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 82	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex82");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 83	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex83");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 84	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex84");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 85	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex85");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 86	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex86");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 87	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex87");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 88	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex88");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 89	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex89");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 90	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex90");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 91	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex91");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 92	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex92");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 93	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex93");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 94	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex94");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 95	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex95");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 96	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex96");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 97	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex97");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 98	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex98");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 99	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex99");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 100	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex100");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 101	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex101");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 102	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex102");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 103	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex103");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 104	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex104");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 105	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex105");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 106	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex106");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 107	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex107");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 108	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex108");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 109	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex109");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 110	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex110");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 111	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex111");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 112	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex112");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 113	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex113");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 114	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex114");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 115	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex115");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 116	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex116");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 117	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex117");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 118	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex118");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 119	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex119");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 120	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex120");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 121	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex121");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 122	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex122");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 123	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex123");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 124	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex124");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 125	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex125");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 126	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex126");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 127	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex127");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 128	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex128");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 129	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex129");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 130	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex130");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 131	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex131");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 132	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex132");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 133	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex133");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 134	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex134");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 135	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex135");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 136	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex136");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 137	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex137");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 138	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex138");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 139	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex139");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 140	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex140");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 141	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex141");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 142	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex142");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 143	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex143");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 144	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex144");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 145	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex145");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 146	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex146");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 147	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex147");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 148	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex148");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 149	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex149");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 150	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex150");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 151	){			
legs.customShader = trap_R_RegisterShaderNoMip("ptex151");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 152	){			
legs.customShader = trap_R_RegisterShaderNoMip("powerups/quad");	
}					
if(trap_Cvar_VariableValue( "cg_ptex") == 153	){			
legs.customShader = trap_R_RegisterShaderNoMip("powerups/battleSuit");	
}	
	legs.shaderRGBA[0] = trap_Cvar_VariableValue( "cg_plightred");
	legs.shaderRGBA[1] = trap_Cvar_VariableValue( "cg_plightgreen");
	legs.shaderRGBA[2] = trap_Cvar_VariableValue( "cg_plightblue");
	legs.shaderRGBA[3] = 255;

	VectorCopy( origin, legs.origin );

	VectorCopy( origin, legs.lightingOrigin );
	legs.renderfx = renderfx;
	VectorCopy (legs.origin, legs.oldorigin);

	trap_R_AddRefEntityToScene( &legs );

	if (!legs.hModel) {
		return;
	}

	//
	// add the torso
	//
	torso.hModel = pi->torsoModel;
	if (!torso.hModel) {
		return;
	}

	torso.customSkin = pi->torsoSkin;
if(trap_Cvar_VariableValue( "cg_totex") == 1	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex1");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 2	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex2");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 3	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex3");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 4	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex4");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 5	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex5");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 6	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex6");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 7	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex7");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 8	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex8");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 9	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex9");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 10	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex10");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 11	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex11");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 12	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex12");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 13	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex13");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 14	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex14");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 15	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex15");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 16	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex16");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 17	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex17");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 18	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex18");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 19	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex19");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 20	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex20");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 21	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex21");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 22	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex22");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 23	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex23");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 24	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex24");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 25	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex25");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 26	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex26");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 27	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex27");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 28	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex28");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 29	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex29");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 30	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex30");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 31	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex31");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 32	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex32");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 33	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex33");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 34	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex34");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 35	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex35");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 36	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex36");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 37	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex37");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 38	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex38");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 39	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex39");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 40	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex40");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 41	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex41");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 42	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex42");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 43	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex43");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 44	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex44");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 45	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex45");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 46	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex46");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 47	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex47");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 48	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex48");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 49	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex49");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 50	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex50");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 51	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex51");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 52	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex52");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 53	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex53");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 54	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex54");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 55	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex55");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 56	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex56");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 57	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex57");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 58	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex58");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 59	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex59");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 60	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex60");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 61	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex61");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 62	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex62");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 63	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex63");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 64	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex64");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 65	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex65");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 66	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex66");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 67	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex67");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 68	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex68");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 69	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex69");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 70	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex70");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 71	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex71");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 72	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex72");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 73	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex73");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 74	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex74");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 75	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex75");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 76	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex76");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 77	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex77");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 78	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex78");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 79	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex79");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 80	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex80");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 81	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex81");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 82	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex82");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 83	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex83");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 84	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex84");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 85	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex85");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 86	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex86");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 87	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex87");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 88	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex88");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 89	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex89");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 90	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex90");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 91	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex91");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 92	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex92");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 93	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex93");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 94	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex94");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 95	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex95");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 96	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex96");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 97	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex97");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 98	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex98");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 99	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex99");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 100	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex100");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 101	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex101");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 102	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex102");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 103	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex103");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 104	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex104");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 105	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex105");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 106	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex106");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 107	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex107");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 108	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex108");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 109	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex109");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 110	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex110");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 111	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex111");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 112	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex112");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 113	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex113");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 114	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex114");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 115	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex115");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 116	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex116");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 117	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex117");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 118	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex118");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 119	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex119");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 120	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex120");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 121	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex121");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 122	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex122");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 123	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex123");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 124	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex124");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 125	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex125");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 126	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex126");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 127	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex127");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 128	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex128");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 129	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex129");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 130	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex130");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 131	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex131");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 132	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex132");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 133	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex133");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 134	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex134");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 135	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex135");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 136	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex136");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 137	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex137");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 138	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex138");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 139	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex139");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 140	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex140");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 141	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex141");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 142	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex142");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 143	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex143");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 144	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex144");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 145	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex145");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 146	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex146");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 147	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex147");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 148	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex148");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 149	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex149");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 150	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex150");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 151	){			
torso.customShader = trap_R_RegisterShaderNoMip("ptex151");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 152	){			
torso.customShader = trap_R_RegisterShaderNoMip("powerups/quad");	
}					
if(trap_Cvar_VariableValue( "cg_totex") == 153	){			
torso.customShader = trap_R_RegisterShaderNoMip("powerups/battleSuit");	
}	
	torso.shaderRGBA[0] = trap_Cvar_VariableValue( "cg_tolightred");
	torso.shaderRGBA[1] = trap_Cvar_VariableValue( "cg_tolightgreen");
	torso.shaderRGBA[2] = trap_Cvar_VariableValue( "cg_tolightblue");
	torso.shaderRGBA[3] = 255;

	VectorCopy( origin, torso.lightingOrigin );

	UI_PositionRotatedEntityOnTag( &torso, &legs, pi->legsModel, "tag_torso");

	torso.renderfx = renderfx;

	trap_R_AddRefEntityToScene( &torso );

	//
	// add the head
	//
	head.hModel = pi->headModel;
	if (!head.hModel) {
		return;
	}
	head.customSkin = pi->headSkin;
if(trap_Cvar_VariableValue( "cg_hetex") == 1	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex1");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 2	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex2");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 3	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex3");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 4	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex4");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 5	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex5");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 6	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex6");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 7	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex7");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 8	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex8");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 9	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex9");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 10	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex10");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 11	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex11");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 12	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex12");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 13	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex13");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 14	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex14");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 15	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex15");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 16	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex16");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 17	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex17");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 18	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex18");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 19	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex19");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 20	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex20");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 21	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex21");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 22	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex22");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 23	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex23");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 24	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex24");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 25	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex25");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 26	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex26");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 27	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex27");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 28	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex28");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 29	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex29");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 30	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex30");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 31	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex31");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 32	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex32");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 33	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex33");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 34	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex34");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 35	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex35");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 36	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex36");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 37	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex37");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 38	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex38");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 39	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex39");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 40	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex40");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 41	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex41");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 42	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex42");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 43	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex43");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 44	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex44");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 45	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex45");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 46	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex46");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 47	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex47");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 48	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex48");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 49	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex49");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 50	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex50");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 51	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex51");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 52	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex52");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 53	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex53");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 54	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex54");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 55	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex55");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 56	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex56");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 57	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex57");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 58	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex58");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 59	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex59");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 60	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex60");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 61	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex61");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 62	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex62");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 63	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex63");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 64	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex64");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 65	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex65");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 66	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex66");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 67	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex67");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 68	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex68");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 69	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex69");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 70	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex70");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 71	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex71");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 72	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex72");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 73	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex73");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 74	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex74");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 75	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex75");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 76	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex76");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 77	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex77");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 78	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex78");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 79	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex79");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 80	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex80");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 81	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex81");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 82	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex82");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 83	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex83");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 84	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex84");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 85	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex85");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 86	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex86");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 87	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex87");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 88	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex88");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 89	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex89");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 90	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex90");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 91	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex91");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 92	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex92");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 93	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex93");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 94	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex94");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 95	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex95");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 96	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex96");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 97	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex97");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 98	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex98");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 99	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex99");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 100	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex100");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 101	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex101");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 102	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex102");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 103	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex103");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 104	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex104");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 105	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex105");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 106	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex106");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 107	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex107");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 108	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex108");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 109	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex109");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 110	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex110");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 111	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex111");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 112	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex112");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 113	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex113");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 114	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex114");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 115	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex115");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 116	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex116");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 117	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex117");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 118	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex118");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 119	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex119");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 120	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex120");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 121	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex121");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 122	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex122");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 123	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex123");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 124	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex124");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 125	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex125");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 126	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex126");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 127	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex127");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 128	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex128");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 129	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex129");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 130	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex130");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 131	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex131");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 132	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex132");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 133	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex133");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 134	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex134");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 135	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex135");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 136	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex136");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 137	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex137");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 138	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex138");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 139	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex139");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 140	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex140");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 141	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex141");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 142	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex142");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 143	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex143");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 144	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex144");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 145	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex145");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 146	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex146");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 147	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex147");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 148	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex148");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 149	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex149");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 150	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex150");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 151	){			
head.customShader = trap_R_RegisterShaderNoMip("ptex151");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 152	){			
head.customShader = trap_R_RegisterShaderNoMip("powerups/quad");	
}					
if(trap_Cvar_VariableValue( "cg_hetex") == 153	){			
head.customShader = trap_R_RegisterShaderNoMip("powerups/battleSuit");	
}	
	head.shaderRGBA[0] = trap_Cvar_VariableValue( "cg_helightred");
	head.shaderRGBA[1] = trap_Cvar_VariableValue( "cg_helightgreen");
	head.shaderRGBA[2] = trap_Cvar_VariableValue( "cg_helightblue");
	head.shaderRGBA[3] = 255;

	VectorCopy( origin, head.lightingOrigin );

	UI_PositionRotatedEntityOnTag( &head, &torso, pi->torsoModel, "tag_head");

	head.renderfx = renderfx;

	trap_R_AddRefEntityToScene( &head );

	//
	// add the gun
	//
	if ( pi->currentWeapon != WP_NONE ) {
		memset( &gun, 0, sizeof(gun) );
		gun.hModel = pi->weaponModel;
		VectorCopy( origin, gun.lightingOrigin );
		UI_PositionEntityOnTag( &gun, &torso, pi->torsoModel, "tag_weapon");
		gun.renderfx = renderfx;
		trap_R_AddRefEntityToScene( &gun );
	}

	//
	// add the spinning barrel
	//
	if ( pi->realWeapon == WP_MACHINEGUN || pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG || pi->realWeapon == WP_CHAINGUN ) {
		vec3_t	angles;

		memset( &barrel, 0, sizeof(barrel) );
		VectorCopy( origin, barrel.lightingOrigin );
		barrel.renderfx = renderfx;

		barrel.hModel = pi->barrelModel;
		angles[YAW] = 0;
		angles[PITCH] = 0;
		angles[ROLL] = UI_MachinegunSpinAngle( pi );
		if( pi->realWeapon == WP_GAUNTLET || pi->realWeapon == WP_BFG ) {
			angles[PITCH] = angles[ROLL];
			angles[ROLL] = 0;
		}
		AnglesToAxis( angles, barrel.axis );

		UI_PositionRotatedEntityOnTag( &barrel, &gun, pi->weaponModel, "tag_barrel");

		trap_R_AddRefEntityToScene( &barrel );
	}

	//
	// add muzzle flash
	//
	if ( dp_realtime <= pi->muzzleFlashTime) {

		if ( pi->flashModel ) {
			memset( &flash, 0, sizeof(flash) );
			flash.hModel = pi->flashModel;
			VectorCopy( origin, flash.lightingOrigin );
			UI_PositionEntityOnTag( &flash, &gun, pi->weaponModel, "tag_flash");
			flash.renderfx = renderfx;
			trap_R_AddRefEntityToScene( &flash );
		}

		// make a dlight for the flash
		if ( pi->flashDlightColor[0] || pi->flashDlightColor[1] || pi->flashDlightColor[2] ) {
			trap_R_AddLightToScene( flash.origin, 200 + (rand()&31), pi->flashDlightColor[0],
				pi->flashDlightColor[1], pi->flashDlightColor[2] );
		}
	}

	//
	// add the chat icon
	//
	if ( pi->chat ) {
		UI_PlayerFloatSprite( pi, origin, trap_R_RegisterShaderNoMip( "sprites/balloon3" ) );
	}

	//
	// add an accent light
	//
	origin[0] -= 100;	// + = behind, - = in front
	origin[1] += 100;	// + = left, - = right
	origin[2] += 100;	// + = above, - = below
	trap_R_AddLightToScene( origin, 500, 1.0, 1.0, 1.0 );

	origin[0] -= 100;
	origin[1] -= 100;
	origin[2] -= 100;
	trap_R_AddLightToScene( origin, 500, 1.0, 0.0, 0.0 );

	trap_R_RenderScene( &refdef );
}


/*
==========================
UI_RegisterClientSkin
==========================
*/
static qboolean UI_RegisterClientSkin( playerInfo_t *pi, const char *modelName, const char *skinName, qboolean head, qboolean legs, qboolean model)
{
	char		filename[MAX_QPATH];

	if (head)
	{
		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head_%s.skin", modelName, skinName );
		pi->headSkin = trap_R_RegisterSkin( filename );

		if (!pi->headSkin)
			return qfalse;
	}
	if (legs)
	{
		Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower_%s.skin", modelName, skinName );
		pi->legsSkin = trap_R_RegisterSkin( filename );
		
		if ( !pi->legsSkin) {
			return qfalse;
		}
	}		
	if (model)
	{
		Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper_%s.skin", modelName, skinName );
		pi->torsoSkin = trap_R_RegisterSkin( filename );

		if (!pi->torsoSkin) {
			return qfalse;
		}
	}

	return qtrue;
}


/*
======================
UI_ParseAnimationFile
======================
*/
static qboolean UI_ParseAnimationFile( const char *filename, playerInfo_t* pi) {
	char		*text_p, *prev;
	int			len;
	int			i;
	char		*token;
	float		fps;
	int			skip;
	char		text[20000];
	fileHandle_t	f;
	animation_t* animations;

	animations = pi->animations;

	memset( animations, 0, sizeof( animation_t ) * MAX_ANIMATIONS );

	// load the file
	len = trap_FS_FOpenFile( filename, &f, FS_READ );
	if ( len <= 0 ) {
		return qfalse;
	}
	if ( len >= ( sizeof( text ) - 1 ) ) {
		Com_Printf( "File %s too long\n", filename );
		return qfalse;
	}
	trap_FS_Read( text, len, f );
	text[len] = 0;
	trap_FS_FCloseFile( f );

	// parse the text
	text_p = text;
	skip = 0;	// quite the compiler warning
	sfxModel.footsteps = FOOTSTEP_NORMAL;
	pi->fixedtorso = qfalse;
	pi->fixedlegs = qfalse;

	// read optional parameters
	while ( 1 ) {
		prev = text_p;	// so we can unget
		token = COM_Parse( &text_p );
		if ( !token ) {
			break;
		}
		if ( !Q_stricmp( token, "footsteps" ) ) {
			token = COM_Parse( &text_p );
			if ( !token ) {
				break;
			}
			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
				sfxModel.footsteps = FOOTSTEP_NORMAL;
			} else if ( !Q_stricmp( token, "boot" ) ) {
				sfxModel.footsteps = FOOTSTEP_BOOT;
			} else if ( !Q_stricmp( token, "flesh" ) ) {
				sfxModel.footsteps = FOOTSTEP_FLESH;
			} else if ( !Q_stricmp( token, "mech" ) ) {
				sfxModel.footsteps = FOOTSTEP_MECH;
			} else if ( !Q_stricmp( token, "energy" ) ) {
				sfxModel.footsteps = FOOTSTEP_ENERGY;
			} else {
				Com_Printf( "Bad footsteps parm in %s: %s\n", filename, token );
			}
			continue;
		} else if ( !Q_stricmp( token, "headoffset" ) ) {
			for ( i = 0 ; i < 3 ; i++ ) {
				token = COM_Parse( &text_p );
				if ( !token ) {
					break;
				}
			}
			continue;
		} else if ( !Q_stricmp( token, "sex" ) ) {
			token = COM_Parse( &text_p );
			if ( !token ) {
				break;
			}
			continue;
		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
			pi->fixedlegs = qtrue;
			continue;
		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
			pi->fixedtorso = qtrue;
			continue;
		}

		// if it is a number, start parsing animations
		if ( token[0] >= '0' && token[0] <= '9' ) {
			text_p = prev;	// unget the token
			break;
		}

		Com_Printf( "unknown token '%s' is %s\n", token, filename );
	}

	// read information for each frame
	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {

		token = COM_Parse( &text_p );
		if ( !token ) {
			break;
		}
		animations[i].firstFrame = atoi( token );
		// leg only frames are adjusted to not count the upper body only frames
		if ( i == LEGS_WALKCR ) {
			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
		}
		if ( i >= LEGS_WALKCR ) {
			animations[i].firstFrame -= skip;
		}

		token = COM_Parse( &text_p );
		if ( !token ) {
			break;
		}
		animations[i].numFrames = atoi( token );

		token = COM_Parse( &text_p );
		if ( !token ) {
			break;
		}
		animations[i].loopFrames = atoi( token );

		token = COM_Parse( &text_p );
		if ( !token ) {
			break;
		}
		fps = atof( token );
		if ( fps == 0 ) {
			fps = 1;
		}
		animations[i].frameLerp = 1000 / fps;
		animations[i].initialLerp = 1000 / fps;
	}

	if ( i != MAX_ANIMATIONS ) {
		Com_Printf( "Error parsing animation file: %s", filename );
		return qfalse;
	}

	return qtrue;
}


/*
==========================
UI_RegisterClientModelname
==========================
*/
qboolean UI_RegisterClientModelname( modelAnim_t* m)
{
	playerInfo_t *pi;

	// separated skin and model names
	char		bodyName[MAX_QPATH];
	char		headName[MAX_QPATH];
	char		legsName[MAX_QPATH];
	char		skinBodyName[MAX_QPATH];
	char		skinHeadName[MAX_QPATH];
	char		skinLegsName[MAX_QPATH];

	char		filename[MAX_QPATH];
	char		*slash;

	// combined model and skin name, before splitting
	char		*modelSkinName, *modelHeadName, *modelLegsName;

	pi = &m->player;

	pi->torsoModel = 0;
	pi->headModel = 0;

	// define which model we're working with
	if (UIE_PlayerInfo_IsTeamModel())
	{
		modelSkinName = m->team_modelskin;
		modelHeadName = m->team_headskin;
		modelLegsName = m->team_legsskin;
	}
	else
	{
		modelSkinName = m->modelskin;
		modelHeadName = m->headskin;
		modelLegsName = m->legsskin;
	}

	// validate
	m->bUnknownModel = qfalse;
	m->bUnknownHeadModel = qfalse;
	m->bUnknownLegsModel = qfalse;
	if ( !modelSkinName[0])
	{
		m->bUnknownModel = qtrue;
		return qfalse;
	}

	if (!modelHeadName[0])
	{
		m->bUnknownHeadModel = qtrue;
		return qfalse;
	}
	
	if (!modelLegsName[0])
	{
		m->bUnknownLegsModel = qtrue;
		return qfalse;
	}
	

	// do the body model
	Q_strncpyz( bodyName, modelSkinName, sizeof( bodyName ) );

	slash = strchr( bodyName, '/' );
	if ( !slash ) {
		// modelName did not include a skin name
		Q_strncpyz( skinBodyName, "default", sizeof( skinBodyName ) );
	} else {
		Q_strncpyz( skinBodyName, slash + 1, sizeof( skinBodyName ) );
		// truncate bodyName
		*slash = 0;
	}
	
	// do the legs model
	Q_strncpyz( legsName, modelLegsName, sizeof( legsName ) );

	slash = strchr( legsName, '/' );
	if ( !slash ) {
		// modelName did not include a skin name
		Q_strncpyz( skinLegsName, "default", sizeof( skinLegsName ) );
	} else {
		Q_strncpyz( skinLegsName, slash + 1, sizeof( skinLegsName ) );
		// truncate bodyName
		*slash = 0;
	}

	// do the head model separately
	Q_strncpyz( headName, modelHeadName, sizeof( headName ) );

	slash = strchr( headName, '/' );
	if ( !slash ) {
		// modelName did not include a skin name
		Q_strncpyz( skinHeadName, "default", sizeof( skinHeadName ) );
	} else {
		Q_strncpyz( skinHeadName, slash + 1, sizeof( skinHeadName ) );
		// truncate modelName
		*slash = 0;
	}

	// load cmodels before models so filecache works
	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", bodyName );
	pi->legsModel = trap_R_RegisterModel( filename );
	if ( !pi->legsModel ) {
		Com_Printf( "Failed to load model file %s\n", filename );
		m->bUnknownModel = qtrue;
		return qfalse;
	}

	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", bodyName );
	pi->torsoModel = trap_R_RegisterModel( filename );
	if ( !pi->torsoModel ) {
		Com_Printf( "Failed to load model file %s\n", filename );
		m->bUnknownModel = qtrue;
		return qfalse;
	}

	Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
	pi->headModel = trap_R_RegisterModel( filename );
	if ( !pi->headModel ) {
		Com_Printf( "Failed to load model file %s\n", filename );
		m->bUnknownHeadModel = qtrue;
		return qfalse;
	}

	// if any skins failed to load, fall back to default
	// this is the body part of the model
	if ( !UI_RegisterClientSkin( pi, bodyName, skinBodyName, qfalse, qfalse, qtrue ) ) {
		if ( !UI_RegisterClientSkin( pi, bodyName, "default", qfalse, qfalse, qtrue ) ) {
			Com_Printf( "Failed to load skin file: %s : %s\n", bodyName, skinBodyName );
			m->bUnknownModel = qtrue;
			return qfalse;
		}
	}

	// and this is the head part of the model
	if ( !UI_RegisterClientSkin( pi, headName, skinHeadName, qtrue, qfalse, qfalse ) ) {
		if ( !UI_RegisterClientSkin( pi, headName, "default", qtrue, qfalse, qfalse ) ) {
			Com_Printf( "Failed to load skin file: %s : %s\n", headName, skinHeadName );
			m->bUnknownHeadModel = qtrue;
			return qfalse;
		}
	}
	
	// and this is the legs part of the model
	if ( !UI_RegisterClientSkin( pi, legsName, skinLegsName, qfalse, qtrue, qfalse ) ) {
		if ( !UI_RegisterClientSkin( pi, legsName, "default", qfalse, qtrue, qfalse ) ) {
			Com_Printf( "Failed to load skin file: %s : %s\n", legsName, skinLegsName );
			m->bUnknownLegsModel = qtrue;
			return qfalse;
		}
	}

	// load the animations
	// always for the body, never the head!
	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", bodyName );
	if ( !UI_ParseAnimationFile( filename, pi ) ) {
		Com_Printf( "Failed to load animation file %s\n", filename );
		return qfalse;
	}

	return qtrue;
}


/*
===============
UI_PlayerInfo_SetModel
===============
*/
static qboolean UI_PlayerInfo_SetModel( modelAnim_t* m, int weapon )
{
	playerInfo_t *pi;

	pi = &m->player;
	if (!UI_RegisterClientModelname( m ))
		return qfalse;

	pi->weapon = weapon;
	pi->currentWeapon = weapon;
	pi->lastWeapon = weapon;
	pi->pendingWeapon = -1;
	pi->weaponTimer = 0;
	pi->chat = qfalse;
	pi->newModel = qtrue;
	UI_PlayerInfo_SetWeapon( pi, pi->weapon );

	return qtrue;
}


/*
===============
UI_PlayerInfo_SetInfo
===============
*/
static void UI_PlayerInfo_SetInfo( playerInfo_t *pi, int legsAnim, int torsoAnim, vec3_t viewAngles, vec3_t moveAngles, weapon_t weaponNumber, qboolean chat ) {
	int			currentAnim;
	weapon_t	weaponNum;
	int 		deathAnim;
	qboolean	useDeathAnim;

	pi->chat = chat;

	// view angles
	VectorCopy( viewAngles, pi->viewAngles );

	// move angles
	VectorCopy( moveAngles, pi->moveAngles );

	if ( pi->newModel ) {
		pi->newModel = qfalse;

		jumpHeight = 0;
		pi->pendingLegsAnim = 0;
		UI_ForceLegsAnim( pi, legsAnim );
		pi->legs.yawAngle = viewAngles[YAW];
		pi->legs.yawing = qfalse;

		pi->pendingTorsoAnim = 0;
		UI_ForceTorsoAnim( pi, torsoAnim );
		pi->torso.yawAngle = viewAngles[YAW];
		pi->torso.yawing = qfalse;
		pi->torso.pitchAngle = viewAngles[PITCH];
		pi->torso.pitching = qfalse;

		if ( weaponNumber != -1 ) {
			pi->weapon = weaponNumber;
			pi->currentWeapon = weaponNumber;
			pi->lastWeapon = weaponNumber;
			pi->pendingWeapon = -1;
			pi->weaponTimer = 0;
			UI_PlayerInfo_SetWeapon( pi, pi->weapon );
		}

		return;
	}

	// weapon
	weaponNum = pi->lastWeapon;
	pi->weapon = weaponNum;
	if ( weaponNumber == -1 ) {
		pi->pendingWeapon = -1;
		pi->weaponTimer = 0;
	}
	else if ( weaponNumber != WP_NONE ) {
		pi->pendingWeapon = weaponNumber;
		pi->weaponTimer = dp_realtime + UI_TIMER_WEAPON_DELAY;
		if (weaponNumber != weaponNum)
			weaponNum = weaponNumber;
	}

	deathAnim = 0;
	useDeathAnim = qfalse;
	if (torsoAnim == BOTH_DEATH1 || torsoAnim == BOTH_DEATH2 || torsoAnim == BOTH_DEATH3) {
		deathAnim = torsoAnim;
		useDeathAnim = qtrue;
	}
	if (legsAnim == BOTH_DEATH1 || legsAnim == BOTH_DEATH2 || legsAnim == BOTH_DEATH3) {
		deathAnim = legsAnim;
		useDeathAnim = qtrue;
	}

	// play sfx
	PlayerInfo_PlayModelSound(torsoAnim, legsAnim);

	if ( useDeathAnim ) {
		torsoAnim = legsAnim = deathAnim;
		pi->weapon = pi->currentWeapon = WP_NONE;
		UI_PlayerInfo_SetWeapon( pi, pi->weapon );

		jumpHeight = 0;
		pi->pendingLegsAnim = 0;
		UI_ForceLegsAnim( pi, legsAnim );

		pi->pendingTorsoAnim = 0;
		UI_ForceTorsoAnim( pi, torsoAnim );

		return;
	}

	// leg animation
	currentAnim = pi->legsAnim & ~ANIM_TOGGLEBIT;
	if ( legsAnim != LEGS_JUMP && ( currentAnim == LEGS_JUMP || currentAnim == LEGS_LAND ) ) {
		pi->pendingLegsAnim = legsAnim;
	}
	else if ( legsAnim != currentAnim ) {
		jumpHeight = 0;
		pi->pendingLegsAnim = 0;
		UI_ForceLegsAnim( pi, legsAnim );
	}

	// torso animation
	if ( torsoAnim == TORSO_STAND || torsoAnim == TORSO_STAND2 ) {
		if ( weaponNum == WP_NONE || weaponNum == WP_GAUNTLET ) {
			torsoAnim = TORSO_STAND2;
		}
		else {
			torsoAnim = TORSO_STAND;
		}
	}

	if ( torsoAnim == TORSO_ATTACK || torsoAnim == TORSO_ATTACK2 ) {
		if ( weaponNum == WP_NONE || weaponNum == WP_GAUNTLET ) {
			torsoAnim = TORSO_ATTACK2;
		}
		else {
			torsoAnim = TORSO_ATTACK;
		}

		if (weaponNum == WP_GAUNTLET) {
			pi->delayFireTimer = PlayerInfo_WeaponCycleTime(pi) / 2;
		}
		else
			PlayerInfo_FireWeaponSound(pi);
	}

	currentAnim = pi->torsoAnim & ~ANIM_TOGGLEBIT;

	if ( weaponNum != pi->currentWeapon || currentAnim == TORSO_RAISE || currentAnim == TORSO_DROP ) {
		pi->pendingTorsoAnim = torsoAnim;
	}
	else if ( ( currentAnim == TORSO_GESTURE || currentAnim == TORSO_ATTACK ) && ( torsoAnim != currentAnim ) ) {
		pi->pendingTorsoAnim = torsoAnim;
	}
	else if ( torsoAnim != currentAnim ) {
		pi->pendingTorsoAnim = 0;
		UI_ForceTorsoAnim( pi, torsoAnim );
	}
}



//------------------------------------------------------------------------


// allows a new model to inherit previous weapon
static int currentWeapon = WP_MACHINEGUN;



/*
=================
PlayerInfo_MergeModelViewAngles
=================
*/
static void PlayerInfo_MergeModelViewAngles( modelAnim_t* m) {
	switch( m->anim ) {
	case ANIM_TURNLEFT:
		m->viewangles[YAW] += 90;
		break;

	case ANIM_TURNRIGHT:
		m->viewangles[YAW] -= 90;
		break;

	case ANIM_STEPLEFT:
		m->moveangles[YAW] = m->viewangles[YAW] + 90;
		break;

	case ANIM_STEPRIGHT:
		m->moveangles[YAW] = m->viewangles[YAW] - 90;
		break;

	case ANIM_LOOKUP:
		m->viewangles[PITCH] += -45;
		break;

	case ANIM_LOOKDOWN:
		m->viewangles[PITCH] += 45;
		break;
	default:
		break;
	}
}




/*
=================
PlayerInfo_SetAnimation
=================
*/
static void PlayerInfo_SetAnimation( modelAnim_t* m)
{
	m->playerChat = qfalse;

	switch( m->anim ) {
	case ANIM_CHAT:
		m->playerChat = qtrue;
		m->playerLegs		     = LEGS_IDLE;
		m->playerTorso			 = TORSO_STAND;
		m->playerWeapon			 = -1;
		break;

	case ANIM_IDLE:
		m->playerLegs		     = LEGS_IDLE;
		m->playerTorso			 = TORSO_STAND;
		m->playerWeapon			 = -1;
		break;

	case ANIM_SWIM:
		m->playerLegs = LEGS_SWIM;
		break;

	case ANIM_RUN:
		m->playerLegs = LEGS_RUN;
		break;

	case ANIM_WALK:
		m->playerLegs = LEGS_WALK;
		break;

	case ANIM_BACK:
		m->playerLegs = LEGS_BACK;
		break;

	case ANIM_JUMP:
		m->playerLegs = LEGS_JUMP;
		break;

	case ANIM_CROUCH:
		m->playerLegs = LEGS_IDLECR;
		break;

	case ANIM_TURNLEFT:
		break;

	case ANIM_TURNRIGHT:
		break;

	case ANIM_STEPLEFT:
		m->playerLegs = LEGS_WALK;
		break;

	case ANIM_STEPRIGHT:
		m->playerLegs = LEGS_WALK;
		break;

	case ANIM_LOOKUP:
		break;

	case ANIM_LOOKDOWN:
		break;

	case ANIM_WEAPON1:
		currentWeapon = m->playerWeapon = WP_GAUNTLET;
		break;

	case ANIM_WEAPON2:
		currentWeapon = m->playerWeapon = WP_MACHINEGUN;
		break;

	case ANIM_WEAPON3:
		currentWeapon = m->playerWeapon = WP_SHOTGUN;
		break;

	case ANIM_WEAPON4:
		currentWeapon = m->playerWeapon = WP_GRENADE_LAUNCHER;
		break;

	case ANIM_WEAPON5:
		currentWeapon = m->playerWeapon = WP_ROCKET_LAUNCHER;
		break;

	case ANIM_WEAPON6:
		currentWeapon = m->playerWeapon = WP_LIGHTNING;
		break;

	case ANIM_WEAPON7:
		currentWeapon = m->playerWeapon = WP_RAILGUN;
		break;

	case ANIM_WEAPON8:
		currentWeapon = m->playerWeapon = WP_PLASMAGUN;
		break;

	case ANIM_WEAPON9:
		currentWeapon = m->playerWeapon = WP_BFG;
		break;

	case ANIM_WEAPON10:
		currentWeapon = m->playerWeapon = WP_GRAPPLING_HOOK;
		break;
		
	case ANIM_WEAPON11:
		currentWeapon = m->playerWeapon = WP_NAILGUN;
		break;

	case ANIM_WEAPON12:
		currentWeapon = m->playerWeapon = WP_PROX_LAUNCHER;
		break;
		
	case ANIM_WEAPON13:
		currentWeapon = m->playerWeapon = WP_CHAINGUN;
		break;

	case ANIM_WEAPON14:
		currentWeapon = m->playerWeapon = WP_FLAMETHROWER;
		break;
		
	case ANIM_WEAPON15:
		currentWeapon = m->playerWeapon = WP_ANTIMATTER;
		break;

	case ANIM_ATTACK:
		m->playerTorso = TORSO_ATTACK;
		break;

	case ANIM_GESTURE:
		m->playerTorso = TORSO_GESTURE;
		break;

	case ANIM_DIE:
		m->playerLegs = BOTH_DEATH1;
		m->playerTorso = BOTH_DEATH1;
		m->playerWeapon = WP_NONE;
		break;

	case ANIM_DIE2:
		m->playerLegs = BOTH_DEATH2;
		m->playerTorso = BOTH_DEATH2;
		m->playerWeapon = WP_NONE;
		break;

	case ANIM_DIE3:
		m->playerLegs = BOTH_DEATH3;
		m->playerTorso = BOTH_DEATH3;
		m->playerWeapon = WP_NONE;
		break;

	default:
		Com_Printf( "Unknown anim: %i\n", m->anim );
		break;
	}
}




/*
=================
PlayerInfo_IsWeaponAnim
=================
*/
static qboolean PlayerInfo_IsWeaponAnim( int anim)
{
	switch (anim) {
	case ANIM_WEAPON1:
	case ANIM_WEAPON2:
	case ANIM_WEAPON3:
	case ANIM_WEAPON4:
	case ANIM_WEAPON5:
	case ANIM_WEAPON6:
	case ANIM_WEAPON7:
	case ANIM_WEAPON8:
	case ANIM_WEAPON9:
	case ANIM_WEAPON10:
	case ANIM_WEAPON11:
	case ANIM_WEAPON12:
	case ANIM_WEAPON13:
	case ANIM_WEAPON14:
	case ANIM_WEAPON15:
		return qtrue;
	}
	return qfalse;
}



/*
=================
PlayerInfo_IsDeathAnim
=================
*/
static qboolean PlayerInfo_IsDeathAnim( int anim)
{
	if (anim == ANIM_DIE || anim == ANIM_DIE2 || anim == ANIM_DIE3)
		return qtrue;

	return qfalse;
}




/*
=================
PlayerInfo_UsableAnimation
=================
*/
static qboolean PlayerInfo_UsableAnimation( modelAnim_t* m, int anim)
{
	int i;
	int a;
	qboolean weapon;
	qboolean death;

	if (anim == 0 || anim == ANIM_IDLE || anim == ANIM_WEAPON10 || anim == ANIM_CHAT)
		return qfalse;

	// infrequent swimmer	
	if (anim == ANIM_SWIM && random() > 0.3)
		return qfalse;

	// check anim not used recently
	// reject any recent weapon change, or death anim
	weapon = qfalse;
	death = PlayerInfo_IsDeathAnim(anim);
	for (i = 0; i < MAX_RECENT_ANIMS; i++) {
		a = m->recent_anims[i];
		if ( a == anim)
			return qfalse;
		if (PlayerInfo_IsWeaponAnim(a))
			weapon = qtrue;
		if (death && PlayerInfo_IsDeathAnim(a))
			return qfalse;
	}

	// prevent weapon fire after death anim
	// firing starts too early, and it looks ugly
	if (anim == ANIM_ATTACK && PlayerInfo_IsDeathAnim(m->anim))
		return qfalse;

	// refuse if we have a recent weapon change
	if (PlayerInfo_IsWeaponAnim(anim)) {
		if (weapon)
			return qfalse;

		if (anim == m->current_weapon)
			return qfalse;

		m->current_weapon = anim;
	}

	// reduce frequency of death animation
	if (death && random() < 0.25) {
		return qfalse;
	}

	return qtrue;
}





/*
=================
PlayerInfo_WeaponCycleTime
=================
*/
static int PlayerInfo_WeaponCycleTime( playerInfo_t* pi)
{
	int addTime;

	//
	// lifted directly from PM_Weapon() in bg_pmove.c
	//

	addTime = 0;
	switch( pi->currentWeapon ) {
	default:
	case WP_GAUNTLET:
		addTime = 800;
		break;
	case WP_LIGHTNING:
		addTime = 50;
		break;
	case WP_SHOTGUN:
		addTime = 1000;
		break;
	case WP_MACHINEGUN:
		addTime = 100;
		break;
	case WP_GRENADE_LAUNCHER:
		addTime = 800;
		break;
	case WP_ROCKET_LAUNCHER:
		addTime = 800;
		break;
	case WP_PLASMAGUN:
		addTime = 100;
		break;
	case WP_RAILGUN:
		addTime = 1500;
		break;
	case WP_BFG:
		addTime = 200;
		break;
	case WP_GRAPPLING_HOOK:
		addTime = 400;
		break;
	case WP_NAILGUN:
		addTime = 1000;
		break;
	case WP_PROX_LAUNCHER:
		addTime = 800;
		break;
	case WP_CHAINGUN:
		addTime = 30;
		break;
	case WP_FLAMETHROWER:
		addTime = 40;
		break;
	case WP_ANTIMATTER:
		addTime = 40;
	break;
	}

	return addTime;
}




/*
=================
PlayerInfo_ChangeTimedAnimation
=================
*/
static void PlayerInfo_ChangeTimedAnimation( modelAnim_t* m)
{
	int changetime;
	int anim;
	int firetime;

	if (forceNextAnim) {
		anim = forceNextAnim;
		forceNextAnim = 0;
	}
	else
		do {
			anim = Clamp_Random(ANIM_MAX - 1);
		} while (!PlayerInfo_UsableAnimation(m, anim));

	changetime = 5000;

	switch( anim ) {
	case ANIM_RUN:
	case ANIM_WALK:
	case ANIM_BACK:
	case ANIM_SWIM:
		break;

	case ANIM_JUMP:
		changetime = 3000;
		break;

	case ANIM_CROUCH:
		break;

	case ANIM_TURNLEFT:
	case ANIM_TURNRIGHT:
		break;

	case ANIM_STEPLEFT:
	case ANIM_STEPRIGHT:
		break;

	case ANIM_LOOKUP:
	case ANIM_LOOKDOWN:
		changetime = 2500;
		break;

	case ANIM_WEAPON1:
	case ANIM_WEAPON2:
	case ANIM_WEAPON3:
	case ANIM_WEAPON4:
	case ANIM_WEAPON5:
	case ANIM_WEAPON6:
	case ANIM_WEAPON7:
	case ANIM_WEAPON8:
	case ANIM_WEAPON9:
	case ANIM_WEAPON10:
	case ANIM_WEAPON11:
	case ANIM_WEAPON12:
	case ANIM_WEAPON13:
	case ANIM_WEAPON14:
	case ANIM_WEAPON15:
		if (m->bDoingIdleAnim && random() < 0.3)
			forceNextAnim = ANIM_ATTACK;
		changetime = 3000;
		break;

	case ANIM_ATTACK:
		firetime = PlayerInfo_WeaponCycleTime(&m->player);
		changetime = 4000;
		m->shotsRemaining = 0;
		if (firetime) {
			// allow for fixed duration of lightning "hum", so it doesn't
			// over-run the firing by much
			m->nextFireTime = uis.realtime + firetime;
			m->shotsRemaining = (LIGHTNING_SFX_DURATION * 3) / firetime + 1;
		}
		break;

	case ANIM_GESTURE:
		changetime = 5000;
		break;

	case ANIM_DIE:
	case ANIM_DIE2:
	case ANIM_DIE3:
		changetime = 5000;
		break;

	case ANIM_CHAT:
		changetime = 2000;
		break;

	default:
		break;
	}

	if (anim != ANIM_ATTACK) {
		m->shotsRemaining = 0;
		m->player.humTimer = 0;
		m->player.delayFireTimer = 0;
	}

	// store the anim value
	if (m->bDoingIdleAnim)
	{
		m->recent_anims[ m->recent_anims_index++ ] = anim;
		if (m->recent_anims_index == MAX_RECENT_ANIMS)
			m->recent_anims_index = 0;
	}

	// reset current anims that cause problems
	if (PlayerInfo_IsDeathAnim(m->anim) || m->anim == ANIM_GESTURE || m->anim == ANIM_JUMP || m->anim == ANIM_ATTACK) {
		m->playerTorso = TORSO_STAND;
		m->playerLegs = LEGS_IDLE;
		m->playerWeapon = -1;
		if (m->bDoingIdleAnim)
		{
			switch (Clamp_Random(5)) {
			default:
			case 0:
				m->playerLegs = LEGS_IDLE; break;
			case 1:
				m->playerLegs = LEGS_RUN; break;
			case 2:
				m->playerLegs = LEGS_WALK; break;
			case 3:
				m->playerLegs = LEGS_IDLECR; break;
			case 4:
				m->playerLegs = LEGS_BACK; break;
			case 5:
				m->playerLegs = LEGS_SWIM; break;
			}
		}
	}

	// make the anim change
	UIE_PlayerInfo_ChangeAnimation(m, anim);
	m->NextIdleAnimTime = uis.realtime + changetime;
}



/*
=================
UIE_PlayerInfo_ChangeTimedAnimation
=================
*/
void UIE_PlayerInfo_ChangeTimedAnimation( modelAnim_t* m, int anim)
{
	if (crashProtected)
		return;

	forceNextAnim = anim;
	PlayerInfo_ChangeTimedAnimation(m);
}



/*
=================
PlayerInfo_CursorChanged
=================
*/
static qboolean PlayerInfo_CursorChanged( modelAnim_t* m)
{
	// check for cursor position change
	if (uis.cursorx != m->cursorx || uis.cursory != m->cursory) {
		if (m->bDoingIdleAnim) {
			UIE_PlayerInfo_ChangeAnimation(m, ANIM_IDLE);
			m->bDoingIdleAnim = qfalse;
		}
		m->cursorx = uis.cursorx;
		m->cursory = uis.cursory;

		return qtrue;
	}

	return qfalse;
}




/*
=================
PlayerInfo_ModelTrackCursor
=================
*/
static void PlayerInfo_ModelTrackCursor( modelAnim_t* m)
{
	vec3_t cursor3d;
	menubitmap_s* b;

	b = &m->bitmap;
	cursor3d[0] = 175.0;
	cursor3d[1] = ( m->cursorx - ( b->generic.x + b->width/4 ));
	cursor3d[2] = ( m->cursory - ( b->generic.y + b->height/4 ));

	VectorClear(m->viewangles);
	VectorClear(m->moveangles);

	vectoangles(cursor3d, m->viewangles);

	// prevent cursor movement "rotating" while body is spinning
	if (m->spin.useSpin && m->spin.rotate)
		m->viewangles[YAW] = 0;

	VectorCopy(m->viewangles, m->moveangles);

	// prevent stoop or back-breaking during attract mode
	if (m->bDoingIdleAnim) {
		if (m->viewangles[PITCH] > 20)
			m->viewangles[PITCH] = 20;
		else
		if (m->viewangles[PITCH] < -20)
			m->viewangles[PITCH] = -20;
	}

	// prevent cursor moving torso during death
	if (PlayerInfo_IsDeathAnim(m->anim))
		m->viewangles[PITCH] = 0;

	// orient for co-ordinate system	
	m->viewangles[PITCH] = -m->viewangles[PITCH];
	m->viewangles[YAW]   += 180;

	PlayerInfo_MergeModelViewAngles(m);

	VectorCopy(m->viewangles, m->player.viewAngles);
	VectorCopy(m->moveangles, m->player.moveAngles);
}



/*
=================
PlayerInfo_SetupNewModel
=================
*/
static void PlayerInfo_SetupNewModel( modelAnim_t* m)
{
	char dir[MODELNAME_BUFFER];
	int i;
	char* fallback;
	char* slash;
	char* str;
	vec3_t tmp_view;
	vec3_t tmp_move;

	// store current orientation to avoid too much
	// snap movement when changing models
	if (m->bForceUpdate) {
		VectorCopy(m->player.viewAngles, tmp_view );
		VectorCopy(m->player.moveAngles, tmp_move);
	}
	else {
		VectorClear(tmp_view);
		VectorClear(tmp_move);

		tmp_view[YAW] = 180 - 30;
	}

	forceNextAnim = ANIM_IDLE;
	memset( &m->player, 0, sizeof(playerInfo_t));
	memset( &sfxModel, 0, sizeof(sfxModel_t));

	VectorCopy(tmp_view, m->viewangles);
	VectorCopy(tmp_move, m->moveangles);
	VectorCopy(tmp_view, m->player.viewAngles);
	VectorCopy(tmp_move, m->player.moveAngles);

	m->bUnknownModel = qfalse;
	if (!UI_PlayerInfo_SetModel( m, currentWeapon )) {
		m->bForceUpdate = qfalse;
		return;
	}

	//
	// load sfx for model
	//

	if (!weaponSfxInit)
		PlayerInfo_CacheWeaponSfx();

	// get model name only, handle case where "/default" assumed
	slash = 0;
	fallback = DEFAULT_MODEL;
	if (UIE_PlayerInfo_IsTeamModel())
		str = m->team_modelskin;
	else
		str = m->modelskin;

	slash = strchr(str, '/');
	if (slash)
	{
		Q_strncpyz(dir, str, slash - str + 1);
	}
	else
	{
		strcpy(dir, str);
	}

	// load the sfx, using fallback if not provided
	sfxModel.gesture = trap_S_RegisterSound( va("sound/player/%s/taunt.wav", dir), qfalse );
	if (!sfxModel.gesture)
		sfxModel.gesture = trap_S_RegisterSound( va("sound/player/%s/taunt.wav", fallback), qfalse );

	sfxModel.death1 = trap_S_RegisterSound( va("sound/player/%s/death1.wav", dir), qfalse );
	if (!sfxModel.death1)
		sfxModel.death1 = trap_S_RegisterSound( va("sound/player/%s/death1.wav", fallback), qfalse );

	sfxModel.death2 = trap_S_RegisterSound( va("sound/player/%s/death2.wav", dir), qfalse );
	if (!sfxModel.death2)
		sfxModel.death2 = trap_S_RegisterSound( va("sound/player/%s/death2.wav", fallback), qfalse );

	sfxModel.death3 = trap_S_RegisterSound( va("sound/player/%s/death3.wav", dir), qfalse );
	if (!sfxModel.death3)
		sfxModel.death3 = trap_S_RegisterSound( va("sound/player/%s/death3.wav", fallback), qfalse );

	sfxModel.jump = trap_S_RegisterSound( va("sound/player/%s/jump1.wav", dir), qfalse );
	if (!sfxModel.jump)
		sfxModel.jump= trap_S_RegisterSound( va("sound/player/%s/jump1.wav", fallback), qfalse );

	sfxModel.land = trap_S_RegisterSound( "sound/player/land1.wav", qfalse );
	sfxModel.drop = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );

	for (i = 0; i < 4; i++) {
		sfxModel.step[i] = trap_S_RegisterSound( va("sound/player/footsteps/%s%i.wav",
			ui_footstepName[sfxModel.footsteps], i+1), qfalse );
	}

	// update animation
	UIE_PlayerInfo_ChangeAnimation( m, ANIM_IDLE );

	// model change done
	m->cursorx = m->cursory = -1;
	m->NextIdleAnimTime = 0;
}



/*
=================
UIE_PlayerInfo_ChangeAnimation
=================
*/
void UIE_PlayerInfo_ChangeAnimation( modelAnim_t* m, int anim)
{
	if (crashProtected)
		return;

	m->anim = anim;
	PlayerInfo_SetAnimation(m);
	PlayerInfo_ModelTrackCursor(m);

	UI_PlayerInfo_SetInfo( &m->player, m->playerLegs, m->playerTorso,
		m->viewangles, m->moveangles, m->playerWeapon, m->playerChat );
}



/*
=================
UIE_PlayerInfo_SetupCrashProtection
=================
*/
static void UIE_PlayerInfo_SetupCrashProtection( void )
{
	int crash;

	if (!startupCrashDetect)
		return;

	startupCrashDetect = qfalse;

	crash = (int)trap_Cvar_VariableValue("uie_crashprotection");
	if (crash)
	{
		//crashProtected = qtrue;
		return;
	}

	// create cvar with default value of 0
	trap_Cvar_Create( "uie_crashprotection", "0", CVAR_ROM);
	trap_Cvar_Set( "uie_crashprotection", "1");
}



/*
=================
UIE_PlayerInfo_ClearCrashProtection
=================
*/
static void UIE_PlayerInfo_ClearCrashProtection( void )
{
	trap_Cvar_Set( "uie_crashprotection", "0");
}





/*
=================
UIE_PlayerInfo_InitModel
=================
*/
void UIE_PlayerInfo_InitModel(modelAnim_t* m)
{
	char 	buffer[MODELNAME_BUFFER];
	int 	i;

	UIE_PlayerInfo_SetupCrashProtection();

	if (crashProtected)
		return;

	trap_Cvar_VariableStringBuffer( "model", buffer, MODELNAME_BUFFER );
	strcpy(m->modelskin, buffer);

	trap_Cvar_VariableStringBuffer( "headmodel", buffer, MODELNAME_BUFFER );
	strcpy(m->headskin, buffer);
	
	trap_Cvar_VariableStringBuffer( "legsskin", buffer, MODELNAME_BUFFER );
	strcpy(m->legsskin, buffer);

	trap_Cvar_VariableStringBuffer( "team_model", buffer, MODELNAME_BUFFER );
	strcpy(m->team_modelskin, buffer);

	trap_Cvar_VariableStringBuffer( "team_headmodel", buffer, MODELNAME_BUFFER );
	strcpy(m->team_headskin, buffer);
	
	trap_Cvar_VariableStringBuffer( "team_legsskin", buffer, MODELNAME_BUFFER );
	strcpy(m->team_legsskin, buffer);

	// init the recent animations history
	for (i = 0; i < MAX_RECENT_ANIMS; i++) {
		m->recent_anims[i] = ANIM_IDLE;
	}

	PlayerInfo_SetupNewModel(m);
}



/*
=================
PlayerInfo_UpdateIdleAnimation
=================
*/
static void PlayerInfo_UpdateIdleAnimation( modelAnim_t* m)
{
	int weapon;
	playerInfo_t* pi;

	pi = &m->player;
	weapon = pi->weapon;

	// handle repeated firing animation
	if (m->shotsRemaining && uis.realtime > m->nextFireTime)
	{
		m->shotsRemaining--;
		UIE_PlayerInfo_ChangeAnimation(m, ANIM_ATTACK);
		if (m->shotsRemaining)
		{
			m->nextFireTime = uis.realtime + PlayerInfo_WeaponCycleTime(&m->player);
		}
	}

	if ((weapon == WP_LIGHTNING || weapon == WP_GAUNTLET) && pi->humTimer > 0) {
		pi->humTimer -= uis.frametime;
		if (pi->humTimer <= 0  && m->shotsRemaining) {
			trap_S_StartLocalSound( sfxWeapon.firing[weapon], CHAN_ITEM );
			pi->humTimer = 965;
		}
	}

	// handle delayed firing weapon sfx
	if (pi->delayFireTimer > 0) {
		pi->delayFireTimer -= uis.frametime;
		if (pi->delayFireTimer <= 0) {
			pi->delayFireTimer = 0;
			PlayerInfo_FireWeaponSound(pi);
		}
	}

	// check its time to change the animation
	if (uis.realtime >= m->NextIdleAnimTime && !m->bNoIdleAnim) {
		// make the animation change
		m->bDoingIdleAnim = qtrue;
		PlayerInfo_ChangeTimedAnimation(m);
	}
}




/*
=================
UIE_PlayerInfo_SetTeamModel
=================
*/
void UIE_PlayerInfo_DrawTeamModel( modelAnim_t* m, qboolean teamModel )
{
	if (teamModel != drawTeamModel)
	{
		drawTeamModel = teamModel;
		m->bForceUpdate = qtrue;
	}
}



/*
=================
UIE_PlayerInfo_IsTeamModel
=================
*/
qboolean UIE_PlayerInfo_IsTeamModel( void )
{
	return drawTeamModel;
}




/*
=================
UIE_ModelSkin
=================
*/
const char* UIE_ModelSkin( const char* modelname )
{
	static char skin[MODELNAME_BUFFER];
	char* ptr;

	skin[0] = 0;
	if (!modelname || !modelname[0])
	{
		ptr = "default";
	}
	else
	{
		ptr = strchr(modelname, '/');
		if (!ptr) {
			ptr = "default";
		}
		else {
			ptr++;
		}
	}

	strcpy(skin, ptr);
	return skin;
}


/*
=================
UIE_ModelName
=================
*/
const char* UIE_ModelName( const char* modelname )
{
	static char model[MODELNAME_BUFFER];
	char* ptr;

	model[0] = 0;
	if (!modelname || !modelname[0])
	{
		strcpy(model, DEFAULT_MODEL);
		return model;
	}


	ptr = strchr(modelname, '/');

	if (ptr)
		Q_strncpyz(model, modelname, ptr - modelname + 1);
	else {
		strcpy(model, modelname);
	}

	return model;
}




/*
=================
UIE_PlayerInfo_AnimateModel
=================
*/
void UIE_PlayerInfo_AnimateModel( modelAnim_t* m)
{
	menubitmap_s* b;
	char buffer[MODELNAME_BUFFER];
	int modelchange, team_modelchange, draw_team;
	float f;

	b = &m->bitmap;

	if( crashProtected ) {
		UI_DrawString( b->generic.x, b->generic.y + b->height / 2, "CRASH DETECTED", UI_LEFT, color_white );
		return;
	}

	if (crashAnimCount > 0)
	{
		crashAnimCount--;
		if (crashAnimCount == 0)
			UIE_PlayerInfo_ClearCrashProtection();
	}

	if( trap_MemoryRemaining() <= LOW_MEMORY ) {
		UI_DrawString( b->generic.x, b->generic.y + b->height / 2, "LOW MEMORY", UI_LEFT, color_white );
		return;
	}

	// check if model has changed
	// only update models when we're actually viewing them
	modelchange = 0;
	team_modelchange = 0;
	draw_team = UIE_PlayerInfo_IsTeamModel();
	if (!m->bNoAutoUpdate)
	{
		trap_Cvar_VariableStringBuffer( "model", buffer, MODELNAME_BUFFER );
		if (Q_stricmp(buffer, m->modelskin) ) {
			strcpy(m->modelskin, buffer);
			modelchange = 1;
		}

		trap_Cvar_VariableStringBuffer( "headmodel", buffer, MODELNAME_BUFFER );
		if (Q_stricmp(buffer, m->headskin) ) {
			strcpy(m->headskin, buffer);
			modelchange = 1;
		}
		
		trap_Cvar_VariableStringBuffer( "legsskin", buffer, MODELNAME_BUFFER );
		if (Q_stricmp(buffer, m->legsskin) ) {
			strcpy(m->legsskin, buffer);
			modelchange = 1;
		}

		trap_Cvar_VariableStringBuffer( "team_model", buffer, MODELNAME_BUFFER );
		if (Q_stricmp(buffer, m->team_modelskin) ) {
			strcpy(m->team_modelskin, buffer);
			team_modelchange = 1;
		}

		trap_Cvar_VariableStringBuffer( "team_headmodel", buffer, MODELNAME_BUFFER );
		if (Q_stricmp(buffer, m->team_headskin) ) {
			strcpy(m->team_headskin, buffer);
			team_modelchange = 1;
		}
		
		trap_Cvar_VariableStringBuffer( "team_legsskin", buffer, MODELNAME_BUFFER );
		if (Q_stricmp(buffer, m->team_legsskin) ) {
			strcpy(m->team_legsskin, buffer);
			team_modelchange = 1;
		}

		if ((modelchange && !draw_team) || (team_modelchange && draw_team))
			m->bForceUpdate = qtrue;
	}

	// update might be forced from elsewhere
	if (m->bForceUpdate || uis.firstdraw) {
		PlayerInfo_SetupNewModel(m);
	}

	if( m->bUnknownModel ) {
		UI_DrawString( b->generic.x, b->generic.y + b->height / 2, "UNKNOWN MODEL", UI_LEFT, color_white );
		return;
	}

	if( m->bUnknownHeadModel ) {
		UI_DrawString( b->generic.x, b->generic.y + b->height / 2, "UNKNOWN HEAD", UI_LEFT, color_white );
		return;
	}
	
	if( m->bUnknownLegsModel ) {
		UI_DrawString( b->generic.x, b->generic.y + b->height / 2, "UNKNOWN LEGS", UI_LEFT, color_white );
		return;
	}

	if (PlayerInfo_CursorChanged(m) || m->bForceUpdate) {
		// follow cursor, and delay idle animation
		PlayerInfo_ModelTrackCursor(m);
		if (!m->allowCursorFire) {
			m->shotsRemaining = 0;
			m->player.delayFireTimer = 0;
		}
		m->NextIdleAnimTime = uis.realtime + IDLE_ANIM_STARTTIME;
	}

	m->bForceUpdate = qfalse;

	// shift random number generator
	// otherwise we see identical model animation sequences
	f = random();

	PlayerInfo_UpdateIdleAnimation(m);

	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, m, uis.realtime/ANIM_SLOWDOWN );
	PlayerInfo_PlayModelFootstep(&m->player);
}




//----------------------------------------------


#define ROTATION_MAX 6


/*
=================
PlayerInfo_ModelSpinEvent
=================
*/
void PlayerInfo_ModelSpinEvent( modelRotate_t* rm, int id)
{
	rm->pause.generic.flags &= ~QMF_HIGHLIGHT;
	rm->pause.generic.flags |= QMF_PULSEIFFOCUS;

	switch (id) {
	case ID_MODELSPIN_LEFT:
		rm->paused = qfalse;
		if (rm->rotate > -ROTATION_MAX)
			rm->rotate--;
		break;

	case ID_MODELSPIN_RIGHT:
		rm->paused = qfalse;
		if (rm->rotate < ROTATION_MAX)
			rm->rotate++;
		break;

	case ID_MODELSPIN_STOP:
		rm->paused = qfalse;
		rm->rotate = 0;
		rm->yaw = 0.0;
		break;

	case ID_MODELSPIN_PAUSE:
		if (rm->paused) {
			rm->paused = qfalse;
		}
		else {
			rm->pause.generic.flags |= QMF_HIGHLIGHT;
			rm->pause.generic.flags &= ~QMF_PULSEIFFOCUS;
			rm->paused = qtrue;
		}
		break;

	};
}


/*
=================
UIE_PlayerInfo_InitRotateModel
=================
*/
void UIE_PlayerInfo_InitRotateModel(menuframework_s* mf, modelRotate_t* rm, callbackFunc event_handler, int x, int y)
{
	rm->yaw = 0.0;
	rm->rotate = 0;
	rm->paused = qtrue;

	rm->left.generic.type	    = MTYPE_BITMAP;
	rm->left.generic.name     = MODELSPIN_LEFT;
	rm->left.generic.flags    = QMF_PULSEIFFOCUS;
	rm->left.generic.callback = event_handler;
	rm->left.generic.id	    = ID_MODELSPIN_LEFT;
	rm->left.generic.x		= x;
	rm->left.generic.y		= y;
	rm->left.width  		    = 32;
	rm->left.height  		    = 32;
	rm->left.focuspic         = MODELSPIN_LEFT1;

	rm->right.generic.type	    = MTYPE_BITMAP;
	rm->right.generic.name     = MODELSPIN_RIGHT;
	rm->right.generic.flags    = QMF_PULSEIFFOCUS;
	rm->right.generic.callback = event_handler;
	rm->right.generic.id	    = ID_MODELSPIN_RIGHT;
	rm->right.generic.x		= x + 32;
	rm->right.generic.y		= y;
	rm->right.width  		    = 32;
	rm->right.height  		    = 32;
	rm->right.focuspic         = MODELSPIN_RIGHT1;

	rm->stop.generic.type	    = MTYPE_BITMAP;
	rm->stop.generic.name     = MODELSPIN_STOP;
	rm->stop.generic.flags    = QMF_PULSEIFFOCUS;
	rm->stop.generic.callback = event_handler;
	rm->stop.generic.id	    = ID_MODELSPIN_STOP;
	rm->stop.generic.x		= x;
	rm->stop.generic.y		= y + 32;
	rm->stop.width  		    = 32;
	rm->stop.height  		    = 32;
	rm->stop.focuspic         = MODELSPIN_STOP1;

	rm->pause.generic.type	    = MTYPE_BITMAP;
	rm->pause.generic.name     = MODELSPIN_PAUSE;
	rm->pause.generic.flags    = QMF_PULSEIFFOCUS;
	rm->pause.generic.callback = event_handler;
	rm->pause.generic.id	    = ID_MODELSPIN_PAUSE;
	rm->pause.generic.x		= x + 32;
	rm->pause.generic.y		= y + 32;
	rm->pause.width  		    = 32;
	rm->pause.height  		    = 32;
	rm->pause.focuspic         = MODELSPIN_PAUSE1;

	Menu_AddItem(mf, &rm->left);
	Menu_AddItem(mf, &rm->right);
	Menu_AddItem(mf, &rm->stop);
	Menu_AddItem(mf, &rm->pause);

	rm->useSpin = qtrue;
}

