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
// g_misc.c

#include "g_local.h"


typedef struct {
	char	*name;
	void	(*spawn)(gentity_t *ent);
} spawn_t;

void SP_info_player_start (gentity_t *ent);
void SP_info_player_deathmatch (gentity_t *ent);
void SP_info_player_intermission (gentity_t *ent);
//For Double Domination:
void SP_info_player_dd (gentity_t *ent);
void SP_info_player_dd_red (gentity_t *ent);
void SP_info_player_dd_blue (gentity_t *ent);
//standard domination:
void SP_domination_point ( gentity_t *ent);

void SP_info_firstplace(gentity_t *ent);
void SP_info_secondplace(gentity_t *ent);
void SP_info_thirdplace(gentity_t *ent);
void SP_info_podium(gentity_t *ent);
void SP_info_waypoint( gentity_t *self );
void SP_info_backpack( gentity_t *self );

void SP_func_plat (gentity_t *ent);
void SP_func_static (gentity_t *ent);
void SP_func_prop (gentity_t *ent);
void SP_func_breakable (gentity_t *ent);
void SP_func_rotating (gentity_t *ent);
void SP_func_bobbing (gentity_t *ent);
void SP_func_pendulum( gentity_t *ent );
void SP_func_button (gentity_t *ent);
void SP_func_door (gentity_t *ent);
void SP_func_train (gentity_t *ent);
void SP_func_timer (gentity_t *self);

void SP_trigger_always (gentity_t *ent);
void SP_trigger_multiple (gentity_t *ent);
void SP_trigger_push (gentity_t *ent);
void SP_trigger_teleport (gentity_t *ent);
void SP_trigger_hurt (gentity_t *ent);

void SP_trigger_death (gentity_t *ent);
void SP_trigger_frag (gentity_t *ent);
void SP_trigger_lock (gentity_t *ent);

void SP_target_remove_powerups( gentity_t *ent );
void SP_target_give (gentity_t *ent);
void SP_target_delay (gentity_t *ent);
void SP_target_speaker (gentity_t *ent);
void SP_target_print (gentity_t *ent);
void SP_target_laser (gentity_t *self);
void SP_target_character (gentity_t *ent);
void SP_target_score( gentity_t *ent );
void SP_target_clienttarg( gentity_t *ent );
void SP_target_teleporter( gentity_t *ent );
void SP_target_relay (gentity_t *ent);
void SP_target_kill (gentity_t *ent);
void SP_target_position (gentity_t *ent);
void SP_target_location (gentity_t *ent);
void SP_target_push (gentity_t *ent);
void SP_target_logic (gentity_t *ent);
void SP_target_gravity (gentity_t *ent);
void SP_target_mapchange (gentity_t *ent);
void SP_target_botspawn (gentity_t *ent);
void SP_target_unlink (gentity_t *ent);
void SP_target_playerspeed (gentity_t *ent);
void SP_target_debrisemitter (gentity_t *ent);
void SP_target_objective (gentity_t *ent);
void SP_target_skill (gentity_t *ent);
void SP_target_earthquake (gentity_t *ent);
void SP_target_effect (gentity_t *ent);
void SP_target_finish (gentity_t *ent);
void SP_target_modify (gentity_t *ent);
void SP_target_secret (gentity_t *ent);
void SP_target_playerstats (gentity_t *ent);
void SP_target_variable (gentity_t *ent);
void SP_target_cutscene (gentity_t *ent);
void SP_target_botremove (gentity_t *ent);
void SP_target_stats (gentity_t *ent);

void SP_script_variable (gentity_t *ent);
void SP_script_layer (gentity_t *ent);

void SP_light (gentity_t *self);
void SP_info_null (gentity_t *self);
void SP_info_notnull (gentity_t *self);
void SP_info_camp (gentity_t *self);
void SP_info_camera (gentity_t *self);
void SP_path_corner (gentity_t *self);

void SP_misc_teleporter_dest (gentity_t *self);
void SP_misc_model(gentity_t *ent);
void SP_misc_portal_camera(gentity_t *ent);
void SP_misc_portal_surface(gentity_t *ent);

void SP_shooter_rocket( gentity_t *ent );
void SP_shooter_plasma( gentity_t *ent );
void SP_shooter_grenade( gentity_t *ent );
void SP_shooter_bfg( gentity_t *ent );
void SP_shooter_prox( gentity_t *ent );
void SP_shooter_flame( gentity_t *ent );
void SP_shooter_antimatter( gentity_t *ent );
void SP_shooter_custom( gentity_t *ent );

void SP_team_CTF_redplayer( gentity_t *ent );
void SP_team_CTF_blueplayer( gentity_t *ent );

void SP_team_CTF_redspawn( gentity_t *ent );
void SP_team_CTF_bluespawn( gentity_t *ent );

void SP_func_door_rotating( gentity_t *ent );

void SP_team_blueobelisk( gentity_t *ent );
void SP_team_redobelisk( gentity_t *ent );
void SP_team_neutralobelisk( gentity_t *ent );

// weather
void SP_rally_weather_rain( gentity_t *ent );
void SP_rally_weather_snow( gentity_t *ent );

spawn_t	sandspawns[] = {
	// info entities don't do anything at all, but provide positional
	// information for things controlled by other processes
	{"info_player_start", SP_info_player_start},
	{"info_player_deathmatch", SP_info_player_deathmatch},
	{"info_player_intermission", SP_info_player_intermission},
//Double Domination player spawn:
	{"info_player_dd", SP_info_player_dd},
        {"info_player_dd_red", SP_info_player_dd_red},
        {"info_player_dd_blue", SP_info_player_dd_blue},
//Standard Domination point spawn:
	{"domination_point", SP_domination_point},


	{"info_null", SP_info_null},
	{"info_notnull", SP_info_notnull},		// use target_position instead
	{"info_camp", SP_info_camp},
	{"info_waypoint", SP_info_waypoint},
	{"info_backpack", SP_info_backpack},
	{"info_camera", SP_info_camera},

	{"func_plat", SP_func_plat},
	{"func_button", SP_func_button},
	{"func_door", SP_func_door},
	{"func_static", SP_func_static},
	{"func_prop", SP_func_prop},
	{"func_rotating", SP_func_rotating},
	{"func_bobbing", SP_func_bobbing},
	{"func_pendulum", SP_func_pendulum},
	{"func_train", SP_func_train},
	{"func_group", SP_info_null},
	{"func_timer", SP_func_timer},			// rename trigger_timer?
	{"func_breakable", SP_func_breakable},
	{"func_timer", SP_func_timer},			// rename trigger_timer?

	// Triggers are brush objects that cause an effect when contacted
	// by a living player, usually involving firing targets.
	// While almost everything could be done with
	// a single trigger class and different targets, triggered effects
	// could not be client side predicted (push and teleport).
	{"trigger_always", SP_trigger_always},
	{"trigger_multiple", SP_trigger_multiple},
	{"trigger_push", SP_trigger_push},
	{"trigger_teleport", SP_trigger_teleport},
	{"trigger_hurt", SP_trigger_hurt},
	{"trigger_death", SP_trigger_death},
	{"trigger_frag", SP_trigger_frag},
	{"trigger_lock", SP_trigger_lock},

	// targets perform no action by themselves, but must be triggered
	// by another entity
	{"target_give", SP_target_give},
	{"target_remove_powerups", SP_target_remove_powerups},
	{"target_delay", SP_target_delay},
	{"target_speaker", SP_target_speaker},
	{"target_print", SP_target_print},
	{"target_laser", SP_target_laser},
	{"target_score", SP_target_score},
	{"target_clienttarg", SP_target_clienttarg},
	
	{"target_teleporter", SP_target_teleporter},
	{"target_relay", SP_target_relay},
	{"target_kill", SP_target_kill},
	{"target_position", SP_target_position},
	{"target_location", SP_target_location},
	{"target_push", SP_target_push},
	{"target_logic", SP_target_logic},
	{"target_gravity", SP_target_gravity},
	{"target_mapchange", SP_target_mapchange},
	{"target_botspawn", SP_target_botspawn},
	{"target_unlink", SP_target_unlink},
	{"target_disable", SP_target_unlink},
	{"target_debrisemitter", SP_target_debrisemitter},
	{"target_objective", SP_target_objective},
	{"target_skill", SP_target_skill},
	{"target_earthquake", SP_target_earthquake},
	{"target_effect", SP_target_effect},
	{"target_finish", SP_target_finish},
	{"target_modify", SP_target_modify},
	{"target_secret", SP_target_secret},
	{"target_playerstats", SP_target_playerstats},
	{"target_variable", SP_target_variable},
	{"target_cutscene", SP_target_cutscene},
	{"target_botremove", SP_target_botremove},
	{"target_stats", SP_target_stats},
	
	{"script_variable", SP_script_variable},
	{"script_layer", SP_script_layer},

	{"light", SP_light},
	{"path_corner", SP_path_corner},

	{"misc_teleporter_dest", SP_misc_teleporter_dest},
	{"misc_model", SP_misc_model},
	{"misc_portal_surface", SP_misc_portal_surface},
	{"misc_portal_camera", SP_misc_portal_camera},

	{"shooter_rocket", SP_shooter_rocket},
	{"shooter_grenade", SP_shooter_grenade},
	{"shooter_plasma", SP_shooter_plasma},
	{"shooter_bfg", SP_shooter_bfg},
	{"shooter_prox", SP_shooter_prox},
	{"shooter_flame", SP_shooter_flame},
	{"shooter_antimatter", SP_shooter_antimatter},
	{"shooter_custom", SP_shooter_custom},

	{"team_CTF_redplayer", SP_team_CTF_redplayer},
	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},

	{"team_CTF_redspawn", SP_team_CTF_redspawn},
	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},

	{"func_door_rotating", SP_func_door_rotating},

	{"team_redobelisk", SP_team_redobelisk},
	{"team_blueobelisk", SP_team_blueobelisk},
	{"team_neutralobelisk", SP_team_neutralobelisk},

	{"environment_rain", SP_rally_weather_rain},
	{"environment_snow", SP_rally_weather_snow},

	{NULL, 0}
};

/*QUAKED func_group (0 0 0) ?
Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
*/


/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
*/
void SP_info_camp( gentity_t *self ) {
	G_SetOrigin( self, self->s.origin );
}

/*QUAKED info_waypoint (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a waypoint target for bot patrolling
*/
void SP_info_waypoint( gentity_t *self ) {
}

/*QUAKED info_backpack (0 0.5 0) ?
Used as a teleportation target for backpacks that fall into a nodrop brush
*/
void SP_info_backpack( gentity_t *self ) {
}

/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
*/
void SP_info_null( gentity_t *self ) {
	G_FreeEntity( self );
}


/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for in-game calculation, like jumppad targets.
target_position does the same thing
*/
void SP_info_notnull( gentity_t *self ){
	G_SetOrigin( self, self->s.origin );
}


/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
Non-displayed light.
"light" overrides the default 300 intensity.
Linear checbox gives linear falloff instead of inverse square
Lights pointed at a target will be spotlights.
"radius" overrides the default 64 unit radius of a spotlight at the target point.
*/
void SP_light( gentity_t *self ) {
	G_FreeEntity( self );
}

/*QUAKED info_camera (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional and viewangles target for in-game cutscenes.
*/
void originToVariableInfo( char variableInfo[MAX_INFO_STRING], vec3_t origin ) {
	Info_SetValueForKey(variableInfo, "o10", va("%f", origin[0]));
	Info_SetValueForKey(variableInfo, "o11", va("%f", origin[1]));
	Info_SetValueForKey(variableInfo, "o12", va("%f", origin[2]));
}

void anglesToVariableInfo(char variableInfo[MAX_INFO_STRING], vec3_t angles) {
	Info_SetValueForKey(variableInfo, "a10", va("%f", angles[0]));
	Info_SetValueForKey(variableInfo, "a11", va("%f", angles[1]));
	Info_SetValueForKey(variableInfo, "a12", va("%f", angles[2]));
}

void Use_Camera (gentity_t *self, gentity_t *other, gentity_t *activator) {
	char variableInfo[MAX_INFO_STRING];

	//make camera movement info available for client 
	variableInfo[0] = '\0';
	Info_SetValueForKey(variableInfo, "w", va("%f", self->wait));
	Info_SetValueForKey(variableInfo, "t", va("%i", level.time));

	//add origin, viewangles and fov of source camera
	if (self->armor > 0) {	//armor is abused here to indicate whether or not camera should use player's origin/viewangles or its own
		//use origin and viewangles of player
		originToVariableInfo(variableInfo, level.clients[0].ps.origin);
		anglesToVariableInfo(variableInfo, level.clients[0].ps.viewangles);
	}
	else {
		//use origin and angles of this camera
		originToVariableInfo(variableInfo, self->s.origin);
		anglesToVariableInfo(variableInfo, self->s.angles);
	}
	Info_SetValueForKey(variableInfo, "f1", va("%i", self->count));
	
	if ( self->nextTrain && (self->spawnflags & 1) ) {
		//add origin and viewangles of target camera
		Info_SetValueForKey(variableInfo, "m", va("%i", self->spawnflags));
		Info_SetValueForKey(variableInfo, "o20", va("%f", self->nextTrain->s.origin[0]));
		Info_SetValueForKey(variableInfo, "o21", va("%f", self->nextTrain->s.origin[1]));
		Info_SetValueForKey(variableInfo, "o22", va("%f", self->nextTrain->s.origin[2]));
		Info_SetValueForKey(variableInfo, "a20", va("%f", self->nextTrain->s.angles[0]));
		Info_SetValueForKey(variableInfo, "a21", va("%f", self->nextTrain->s.angles[1]));
		Info_SetValueForKey(variableInfo, "a22", va("%f", self->nextTrain->s.angles[2]));
		Info_SetValueForKey(variableInfo, "f2", va("%i", self->nextTrain->count));
	} else {
		Info_SetValueForKey(variableInfo, "m", "0");	//0 means no camera motion
	}
	//G_Printf("%s\n", variableInfo);
	trap_SetConfigstring( CS_CUTSCENE, variableInfo );

	if(activator->client->ps.pm_type != PM_CUTSCENE){
	VectorCopy(activator->client->ps.origin, activator->orgOrigin);
	}
	activator->client->ps.pm_type = PM_CUTSCENE;
	self->activator = activator;
	self->nextthink = level.time + (self->wait * 1000);
}

void Think_Camera (gentity_t *self) {
	int i;

	if ( self->nextTrain ) {
		//jump to next camera
		self->nextTrain->use( self->nextTrain, self->activator, self->activator );
	} else {
		//cutscene should end so give player normal control
		self->activator->client->ps.pm_type = PM_NORMAL;

		//move player back to original location
		VectorCopy(self->activator->orgOrigin, self->activator->client->ps.origin);
	
		//give movement control back to bots
		if ( self->parent->spawnflags & 1 ) {
			for ( i = 0 ; i < level.maxclients ; i++ ) {
				if ( level.clients[i].pers.connected != CON_DISCONNECTED && level.clients[i].ps.pm_type != PM_DEAD )
					level.clients[i].ps.pm_type = PM_NORMAL;
			}
		}

		//link the player back into the world
		trap_LinkEntity( self->activator );
		self->activator->r.contents += CONTENTS_BODY;

		//enable synchronousClients if it was enabled before the cutscene kicked in. The skill field is abused to
		//temporarily store the pre-cutscene value of g_synchronousclients
		if (g_allowSyncCutscene.integer == 0)
			trap_Cvar_Set("g_synchronousClients", va("%1.0f", self->activator->skill ));
	}
}

void SP_info_camera( gentity_t *self ) {	
	G_SpawnFloat( "wait", "1", &self->wait );
	G_SpawnInt( "fov", "90", &self->count );	//abusing self->count here to store the FOV for the camera

	self->use = Use_Camera;
	self->think = Think_Camera;
	G_SetOrigin( self, self->s.origin );
}



/*
=================================================================================

TELEPORTERS

=================================================================================
*/

/*=========
Sets player's location without spitting out the player
===========*/
void TeleportPlayerNoKnockback( gentity_t *player, vec3_t origin, vec3_t angles, int angle ) {
	gentity_t	*tent;
	vec3_t orgAngles;
	vec3_t changedvel;

	// unlink to make sure it can't possibly interfere with G_KillBox
	//trap_UnlinkEntity (player);

	VectorCopy ( origin, player->client->ps.origin );
	//player->client->ps.origin[2] += 1;

	// spit the player out
	//AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
	//VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
	//player->client->ps.pm_time = 160;		// hold time
	//player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;

	// toggle the teleport bit so the client knows to not lerp
	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
	
	VectorCopy( player->client->ps.velocity, changedvel );
	
	if(angle == 90){
	changedvel[0] = player->client->ps.velocity[1];
	changedvel[1] = -player->client->ps.velocity[0];
	}
	if(angle == 180){
	changedvel[0] = -player->client->ps.velocity[0];
	changedvel[1] = -player->client->ps.velocity[1];
	}
	if(angle == 270){
	changedvel[0] = -player->client->ps.velocity[1];
	changedvel[1] = -player->client->ps.velocity[0];
	}
	
	VectorCopy( changedvel, player->client->ps.velocity );
	
	SetClientViewAngle( player, angles );

	player->s.angles[0] = atof(va("%.4f", player->s.angles[0]));
	player->s.angles[1] = atof(va("%.4f", player->s.angles[1]));
	player->s.angles[2] = atof(va("%.4f", player->s.angles[2]));

	// kill anything at the destination
	/*if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
		G_KillBox (player);
	}*/

	// save results of pmove
	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );

	// use the precise origin for linking
	//VectorCopy( player->client->ps.origin, player->r.currentOrigin );

	/*if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
		trap_LinkEntity (player);
	}*/
}

void TeleportPlayerForLayer( gentity_t *player, float level, float curlevel) {
	float changed2;

	changed2 = curlevel - level;

	player->client->ps.origin[2] += changed2;
	player->client->ps.eFlags ^= EF_TELEPORT_BIT;

	// save results of pmove
	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
}

void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
	gentity_t	*tent;
	qboolean noAngles;

	noAngles = (angles[0] > 999999.0);
	// use temp events at source and destination to prevent the effect
	// from getting dropped by a second player event
	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR) {
		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
		tent->s.clientNum = player->s.clientNum;

		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
		tent->s.clientNum = player->s.clientNum;
	}

	// unlink to make sure it can't possibly interfere with G_KillBox
	trap_UnlinkEntity (player);

	VectorCopy ( origin, player->client->ps.origin );
	player->client->ps.origin[2] += 1;

	if (!noAngles) {
		// spit the player out
		AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
		VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
		player->client->ps.pm_time = 160;		// hold time
		player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;

		// set angles
		SetClientViewAngle(player, angles);
	}

	// toggle the teleport bit so the client knows to not lerp
	player->client->ps.eFlags ^= EF_TELEPORT_BIT;

//unlagged - backward reconciliation #3
	// we don't want players being backward-reconciled back through teleporters
	G_ResetHistory( player );
//unlagged - backward reconciliation #3

	// kill anything at the destination
	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR ) {
		G_KillBox (player);
	}

	// save results of pmove
	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );

	// use the precise origin for linking
	VectorCopy( player->client->ps.origin, player->r.currentOrigin );

	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR ) {
		trap_LinkEntity (player);
	}
}


/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
Point teleporters at these.
Now that we don't have teleport destination pads, this is just
an info_notnull
*/
void SP_misc_teleporter_dest( gentity_t *ent ) {
	VectorCopy( ent->s.origin, ent->s.pos.trBase );
	VectorCopy( ent->s.origin, ent->r.currentOrigin );
	ent->s.eType = ET_GENERAL;
	ent->s.pos.trType = TR_STATIONARY;
	VectorSet( ent->r.mins, -10, -10, -10);
	VectorSet( ent->r.maxs, 10, 10, 10 );
	ent->r.contents = CONTENTS_TRIGGER;
	//ent->s.modelindex = G_ModelIndex( "45.md3" );
	
	trap_LinkEntity( ent );
}


//===========================================================

/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
"model"		arbitrary .md3 file to display
*/
void SP_misc_model( gentity_t *ent ) {
	G_FreeEntity( ent );
}

//===========================================================

void locateCamera( gentity_t *ent ) {
	vec3_t		dir;
	gentity_t	*target;
	gentity_t	*owner;

	owner = G_PickTarget( ent->target );
	if ( !owner ) {
                G_Printf( "Couldn't find target for misc_portal_surface\n" );
		G_FreeEntity( ent );
		return;
	}
	ent->r.ownerNum = owner->s.number;

	// frame holds the rotate speed
	if ( owner->spawnflags & 1 ) {
		ent->s.frame = 25;
	} else if ( owner->spawnflags & 2 ) {
		ent->s.frame = 75;
	}

	// swing camera ?
	if ( owner->spawnflags & 4 ) {
		// set to 0 for no rotation at all
		ent->s.powerups = 0;
	}
	else {
		ent->s.powerups = 1;
	}

	// clientNum holds the rotate offset
	ent->s.clientNum = owner->s.clientNum;

	VectorCopy( owner->s.origin, ent->s.origin2 );

	// see if the portal_camera has a target
	target = G_PickTarget( owner->target );
	if ( target ) {
		VectorSubtract( target->s.origin, owner->s.origin, dir );
		VectorNormalize( dir );
	} else {
		G_SetMovedir( owner->s.angles, dir );
	}

	ent->s.eventParm = DirToByte( dir );
}

/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
This must be within 64 world units of the surface!
*/
void SP_misc_portal_surface(gentity_t *ent) {
	VectorClear( ent->r.mins );
	VectorClear( ent->r.maxs );
	trap_LinkEntity (ent);

	ent->r.svFlags = SVF_PORTAL;
	ent->s.eType = ET_PORTAL;

	if ( !ent->target ) {
		VectorCopy( ent->s.origin, ent->s.origin2 );
	} else {
		ent->think = locateCamera;
		ent->nextthink = level.time + 100;
	}
}

/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
"roll" an angle modifier to orient the camera around the target vector;
*/
void SP_misc_portal_camera(gentity_t *ent) {
	float	roll;

	VectorClear( ent->r.mins );
	VectorClear( ent->r.maxs );
	trap_LinkEntity (ent);

	G_SpawnFloat( "roll", "0", &roll );

	ent->s.clientNum = roll/360.0 * 256;
}

/*
======================================================================

  SHOOTERS

======================================================================
*/

void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
	vec3_t		dir;
	float		deg;
	vec3_t		up, right;
	gentity_t	*bolt;

	if ( !ent->r.linked )
		return;

	// see if we have a target
	if ( ent->enemy ) {
		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
		VectorNormalize( dir );
	} else if ( ent->spawnflags & 1 ) {
		
		if ( !level.player || level.player->client->ps.pm_type == PM_CUTSCENE)
			return;

		VectorSubtract( level.player->r.currentOrigin, ent->s.origin, dir );
		VectorNormalize( dir );
	} else {
		VectorCopy( ent->movedir, dir );
	}

	// randomize a bit
	PerpendicularVector( up, dir );
	CrossProduct( up, dir, right );

	deg = crandom() * ent->random;
	VectorMA( dir, deg, up, dir );

	deg = crandom() * ent->random;
	VectorMA( dir, deg, right, dir );

	VectorNormalize( dir );

	switch ( ent->s.weapon ) {
	case WP_GRENADE_LAUNCHER:
		fire_grenade( ent, ent->s.origin, dir );
		break;
	case WP_ROCKET_LAUNCHER:
		fire_rocket( ent, ent->s.origin, dir );
		break;
	case WP_PLASMAGUN:
		fire_plasma( ent, ent->s.origin, dir );
		break;
	case WP_BFG:
		fire_bfg( ent, ent->s.origin, dir );
		break;
	case WP_NAILGUN:
		fire_custom( ent, ent->s.origin, dir );
		break;
	case WP_PROX_LAUNCHER:
		fire_prox( ent, ent->s.origin, dir );
		break;
	case WP_FLAMETHROWER:
		fire_flame( ent, ent->s.origin, dir );
		break;
	case WP_ANTIMATTER:
		fire_antimatter( ent, ent->s.origin, dir );
		break;
	}

	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
}


static void InitShooter_Finish( gentity_t *ent ) {
	ent->enemy = G_PickTarget( ent->target );
	ent->think = 0;
	ent->nextthink = 0;
}

void InitShooter( gentity_t *ent, int weapon ) {
	ent->use = Use_Shooter;
	ent->s.weapon = weapon;

	RegisterItem( BG_FindItemForWeapon( weapon ) );

	G_SetMovedir( ent->s.angles, ent->movedir );

	if ( !ent->random ) {
		ent->random = 1.0;
	}
	ent->random = sin( M_PI * ent->random / 180 );
	// target might be a moving object, so we can't set movedir for it
	if ( ent->target ) {
		ent->think = InitShooter_Finish;
		ent->nextthink = level.time + 500;
	}
	trap_LinkEntity( ent );
}

/*QUAKED shooter_rocket (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_rocket( gentity_t *ent ) {
	InitShooter( ent, WP_ROCKET_LAUNCHER );
}

/*QUAKED shooter_plasma (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_plasma( gentity_t *ent ) {
	InitShooter( ent, WP_PLASMAGUN);
}

/*QUAKED shooter_grenade (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_grenade( gentity_t *ent ) {
	InitShooter( ent, WP_GRENADE_LAUNCHER);
}

/*QUAKED SP_shooter_bfg (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_bfg( gentity_t *ent ) {
	InitShooter( ent, WP_BFG);
}

/*QUAKED SP_shooter_prox (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_prox( gentity_t *ent ) {
	InitShooter( ent, WP_PROX_LAUNCHER);
}

/*QUAKED SP_shooter_flame (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_flame( gentity_t *ent ) {
	InitShooter( ent, WP_FLAMETHROWER);
}

/*QUAKED SP_shooter_antimatter (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_antimatter( gentity_t *ent ) {
	InitShooter( ent, WP_ANTIMATTER);
}

/*QUAKED SP_shooter_custom (1 0 0) (-16 -16 -16) (16 16 16)
Fires at either the target or the current direction.
"random" is the number of degrees of deviance from the taget. (1.0 default)
*/
void SP_shooter_custom( gentity_t *ent ) {
	InitShooter( ent, WP_NAILGUN);
}

static void PortalDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod) {
	G_FreeEntity( self );
	//FIXME do something more interesting
}

static void BlockDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod) {
	G_FreeEntity( self );
	//FIXME do something more interesting
}


void DropPortalDestination( gentity_t *player ) {
	gentity_t	*ent;
	vec3_t		snapped;

	// create the portal destination
	ent = G_Spawn();
	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_exit.md3" );

	VectorCopy( player->s.pos.trBase, snapped );
	SnapVector( snapped );
	G_SetOrigin( ent, snapped );
	VectorCopy( player->r.mins, ent->r.mins );
	VectorCopy( player->r.maxs, ent->r.maxs );

	ent->classname = "hi_portal destination";
	ent->s.pos.trType = TR_STATIONARY;

	ent->r.contents = CONTENTS_CORPSE;
	ent->takedamage = qtrue;
	ent->health = g_portalhealth.integer;
	ent->die = PortalDie;

	VectorCopy( player->s.apos.trBase, ent->s.angles );

	ent->think = G_FreeEntity;
	ent->nextthink = level.time + g_portaltimeout.integer * 1000;

	trap_LinkEntity( ent );

	player->client->portalID = ++level.portalSequence;
	ent->count = player->client->portalID;

	// give the item back so they can drop the source now
	player->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_PORTAL);
}


static void PortalTouch( gentity_t *self, gentity_t *other, trace_t *trace) {
	gentity_t	*destination;

	// see if we will even let other try to use it
	if( other->health <= 0 ) {
		return;
	}
	if( !other->client ) {
		return;
	}
//	if( other->client->ps.persistant[PERS_TEAM] != self->spawnflags ) {
//		return;
//	}
if(g_portalgrabitems.integer == 1){
		other->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
//		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_MACHINEGUN );
		other->client->ps.ammo[WP_MACHINEGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_SHOTGUN );
		other->client->ps.ammo[WP_SHOTGUN] = 0;	
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_GRENADE_LAUNCHER );
		other->client->ps.ammo[WP_GRENADE_LAUNCHER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_ROCKET_LAUNCHER );
		other->client->ps.ammo[WP_ROCKET_LAUNCHER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_LIGHTNING );
		other->client->ps.ammo[WP_LIGHTNING] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_RAILGUN );
		other->client->ps.ammo[WP_RAILGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_PLASMAGUN );
		other->client->ps.ammo[WP_PLASMAGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BFG );
		other->client->ps.ammo[WP_BFG] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_GRAPPLING_HOOK );
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_NAILGUN );
		other->client->ps.ammo[WP_NAILGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_PROX_LAUNCHER );
		other->client->ps.ammo[WP_PROX_LAUNCHER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_CHAINGUN );
		other->client->ps.ammo[WP_CHAINGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_FLAMETHROWER );
		other->client->ps.ammo[WP_FLAMETHROWER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_ANTIMATTER );
		other->client->ps.ammo[WP_ANTIMATTER] = 0;
       other->client->ps.powerups[PW_QUAD] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_REGEN] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_HASTE] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_BATTLESUIT] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_INVIS] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_FLIGHT] =  level.time - ( level.time % 1000 );
	   other->client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
}
	if ( other->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_NEUTRALFLAG ), 0 );
		other->client->ps.powerups[PW_NEUTRALFLAG] = 0;
	}
	else if ( other->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_REDFLAG ), 0 );
		other->client->ps.powerups[PW_REDFLAG] = 0;
	}
	else if ( other->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_BLUEFLAG ), 0 );
		other->client->ps.powerups[PW_BLUEFLAG] = 0;
	}

	// find the destination
	destination = NULL;
	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
		if( destination->count == self->count ) {
			break;
		}
	}

	// if there is not one, die!
	if( !destination ) {
		if( self->pos1[0] || self->pos1[1] || self->pos1[2] ) {
			TeleportPlayer( other, self->pos1, self->s.angles );
		}
		G_Damage( other, other, other, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG );
		return;
	}

	TeleportPlayer( other, destination->s.pos.trBase, destination->s.angles );
}

static void PortalTouches( gentity_t *other ) {
	gentity_t	*destination;
	vec3_t		dest;
	vec3_t		o;
	vec3_t		angles;
	
	angles[0] = 0;
	angles[1] = 0;
	angles[2] = 0;

	o[0] = sl_px;
	o[1] = sl_py;
	o[2] = sl_pz;
	VectorCopy (o, dest);

	// see if we will even let other try to use it
	if( other->health <= 0 ) {
		return;
	}
	if( !other->client ) {
		return;
	}
//	if( other->client->ps.persistant[PERS_TEAM] != self->spawnflags ) {
//		return;
//	}
if(g_portalgrabitems.integer == 1){
		other->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
//		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_MACHINEGUN );
		other->client->ps.ammo[WP_MACHINEGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_SHOTGUN );
		other->client->ps.ammo[WP_SHOTGUN] = 0;	
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_GRENADE_LAUNCHER );
		other->client->ps.ammo[WP_GRENADE_LAUNCHER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_ROCKET_LAUNCHER );
		other->client->ps.ammo[WP_ROCKET_LAUNCHER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_LIGHTNING );
		other->client->ps.ammo[WP_LIGHTNING] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_RAILGUN );
		other->client->ps.ammo[WP_RAILGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_PLASMAGUN );
		other->client->ps.ammo[WP_PLASMAGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BFG );
		other->client->ps.ammo[WP_BFG] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_GRAPPLING_HOOK );
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_NAILGUN );
		other->client->ps.ammo[WP_NAILGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_PROX_LAUNCHER );
		other->client->ps.ammo[WP_PROX_LAUNCHER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_CHAINGUN );
		other->client->ps.ammo[WP_CHAINGUN] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_FLAMETHROWER );
		other->client->ps.ammo[WP_FLAMETHROWER] = 0;
		other->client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_ANTIMATTER );
		other->client->ps.ammo[WP_ANTIMATTER] = 0;
       other->client->ps.powerups[PW_QUAD] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_REGEN] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_HASTE] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_BATTLESUIT] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_INVIS] =  level.time - ( level.time % 1000 );
       other->client->ps.powerups[PW_FLIGHT] =  level.time - ( level.time % 1000 );
	   other->client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
}
	if ( other->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_NEUTRALFLAG ), 0 );
		other->client->ps.powerups[PW_NEUTRALFLAG] = 0;
	}
	else if ( other->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_REDFLAG ), 0 );
		other->client->ps.powerups[PW_REDFLAG] = 0;
	}
	else if ( other->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
		Drop_Item( other, BG_FindItemForPowerup( PW_BLUEFLAG ), 0 );
		other->client->ps.powerups[PW_BLUEFLAG] = 0;
	}

	// if there is not one, die!
	if( sl_py == 0 ) {
		return;
	}

	TeleportPlayer( other, dest, angles );
}

static void PortalEnable( gentity_t *self ) {
	self->touch = PortalTouch;
	self->think = G_FreeEntity;
	self->nextthink = level.time + g_portaltimeout.integer * 1000;
}

static void ShowSandObject( gentity_t *self ) {
	trap_LinkEntity( self );
}

static void PhysgunInteract( gentity_t *self ) {
	vec3_t		end, start, forward, up, right;
	trace_t		tr;
	
	if(!self->sandboxInteract || self->parent->health <= 0){
	self->parent = NULL;
	self->think = 0;
	self->nextthink = 0;
	self->sandboxInteract = 0;
	self->parent->sandboxInteract = 0;
	self->parent->InteractDist = 0;
	return;
	}
	
	self->s.pos.trType = TR_STATIONARY; self->physicsObject = qfalse; self->sb_phys = 1;
	
	if(self->parent->InteractDist == 0){
	//Set Aiming Directions
	AngleVectors(self->parent->client->ps.viewangles, forward, right, up);
	CalcMuzzlePoint(self->parent, forward, right, up, start);
	VectorMA (start, 4096, forward, end);
	VectorScale( forward, 0, forward );

	//Trace Position
	trap_Trace (&tr, start, NULL, NULL, end, self->parent->s.number, MASK_SELECT );

	self->parent->InteractDist = Distance(start, tr.endpos);
	if(self->parent->InteractDist < 55){
	self->parent->InteractDist = 55;
	}
	if(self->parent->InteractDist > 4096){
	self->parent->InteractDist = 4096;
	}
	}
	
	//Set Aiming Directions
	AngleVectors(self->parent->client->ps.viewangles, forward, right, up);
	CalcMuzzlePoint(self->parent, forward, right, up, start);
	VectorMA (start, self->parent->InteractDist, forward, end);
	VectorScale( forward, 0, forward );

	trap_UnlinkEntity( self );

	//Trace Position
	trap_Trace (&tr, start, NULL, NULL, end, self->parent->s.number, MASK_SELECT );
	
	VectorCopy(tr.endpos, self->s.origin);
	VectorCopy(tr.endpos, self->s.pos.trBase);
	VectorCopy(tr.endpos, self->r.currentOrigin);
	
	trap_LinkEntity( self );
	
	self->think = PhysgunInteract;
	self->nextthink = level.time + 1;
	
}




void DropPortalSource( gentity_t *player ) {
	gentity_t	*ent;
	gentity_t	*destination;
	vec3_t		snapped;
	vec3_t		lastpos;

	// create the portal source
	ent = G_Spawn();
	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_enter.md3" );

	VectorCopy( player->s.pos.trBase, snapped );
	VectorCopy( snapped, lastpos );
	sl_px = lastpos[0];
	sl_py = lastpos[1];
	sl_pz = lastpos[2];
	SnapVector( snapped );
	G_SetOrigin( ent, snapped );
	VectorCopy( player->r.mins, ent->r.mins );
	VectorCopy( player->r.maxs, ent->r.maxs );

	ent->classname = "hi_portal source";
	ent->s.pos.trType = TR_STATIONARY;

	ent->r.contents = CONTENTS_CORPSE | CONTENTS_TRIGGER;
	ent->takedamage = qtrue;
	ent->health = g_portalhealth.integer;
	ent->die = PortalDie;

	trap_LinkEntity( ent );

	ent->count = player->client->portalID;
	player->client->portalID = 0;

//	ent->spawnflags = player->client->ps.persistant[PERS_TEAM];

	ent->nextthink = level.time + 1000;
	ent->think = PortalEnable;

	// find the destination
	destination = NULL;
	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
		if( destination->count == ent->count ) {
			VectorCopy( destination->s.pos.trBase, ent->pos1 );
			break;
		}
	}

}


char *G_ClearStringMisc( char *input ){
	if( input[0] == '"' ){
		input[0] = '\0';
		input++;
	}
	if( input[strlen(input)-1] == '"' ){
		input[strlen(input)-1] = '\0';
	}
	return input;
}

/*QUAKED func_prop (0 .5 .8) ?
A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
"model2"	.md3 model to also draw
"color"		constantLight color
"light"		constantLight radius
*/

void SP_func_prop( gentity_t *ent ) {
	spawn_t	*s;
	gitem_t	*item;
	
	VectorCopy( ent->s.origin, ent->s.pos.trBase );
	VectorCopy( ent->s.origin, ent->r.currentOrigin );
	ent->sandboxObject = 1;
	CopyAlloc(ent->classname, ent->sb_class);
	// check normal spawn functions
	for ( s=sandspawns ; s->name ; s++ ) {
		if ( !strcmp(s->name, ent->classname) ) {
			// found it
			CopyAlloc(ent->sb_class, ent->classname);
			s->spawn(ent);
			//spawn another class
			ent->s.modelindex = G_ModelIndex( va("props/%s",ent->sb_model) );	//модель
			ent->s.constantLight = ent->sb_red | ( ent->sb_green << 8 ) | ( ent->sb_blue << 16 ) | ( ent->sb_radius << 24 );
			ent->s.loopSound = G_SoundIndex(ent->sb_sound);	//звук
			ent->s.scales[0] = ent->sb_colscale0;
			ent->s.scales[1] = ent->sb_colscale1;
			ent->s.scales[2] = ent->sb_colscale2;
			ent->s.apos.trBase[0] = ent->sb_rotate0;
			ent->s.apos.trBase[1] = ent->sb_rotate1;
			ent->s.apos.trBase[2] = ent->sb_rotate2;
			VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
			VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
			ent->s.pos.trTime = level.time;
			if(ent->sb_takedamage == 0){
				ent->takedamage = qfalse;
			}
			if(ent->sb_takedamage == 1){
				ent->takedamage = qtrue;
			}
			if(ent->sb_takedamage2 == 0){
				ent->takedamage2 = qfalse;
			}
			if(ent->sb_takedamage2 == 1){
				ent->takedamage2 = qtrue;
			}
			if(ent->sb_phys == 1){ ent->s.pos.trType = TR_STATIONARY; ent->physicsObject = qfalse; }
			if(ent->sb_phys == 2){ ent->s.pos.trType = TR_GRAVITY; ent->s.pos.trTime = level.time; ent->physicsObject = qtrue; ent->physicsBounce = 0.5; }
			if(ent->sb_coll == 0){
			ent->r.contents = CONTENTS_SOLID | CONTENTS_BODY;	
			}
			if(ent->sb_coll == 1){
			ent->r.contents = CONTENTS_TRIGGER;	
			}
			ent->s.generic2 = ent->sb_generic1;
			ent->classname = "func_prop";
			ent->r.svFlags &= ~SVF_NOCLIENT;
			trap_LinkEntity( ent );
			return;
		}
	}
	ent->classname = "func_prop";
	ent->s.eType = ET_GENERAL;
	ent->s.pos.trType = TR_STATIONARY;
	ent->s.modelindex = G_ModelIndex( va("props/%s",ent->sb_model) );
	ent->s.constantLight = ent->sb_red | ( ent->sb_green << 8 ) | ( ent->sb_blue << 16 ) | ( ent->sb_radius << 24 );
	ent->s.loopSound = G_SoundIndex(ent->sb_sound);
	ent->die = BlockDie;
	ent->takedamage = qtrue;
	if(ent->sb_takedamage == 0){
		ent->takedamage = qfalse;
	}
	if(ent->sb_takedamage == 1){
		ent->takedamage = qtrue;
	}
	if(ent->sb_takedamage2 == 0){
		ent->takedamage2 = qfalse;
	}
	if(ent->sb_takedamage2 == 1){
		ent->takedamage2 = qtrue;
	}
	ent->s.pos.trTime = level.time;
	if(ent->sb_phys == 1){ ent->s.pos.trType = TR_STATIONARY; ent->physicsObject = qfalse; }
	if(ent->sb_phys == 2){ ent->s.pos.trType = TR_GRAVITY; ent->s.pos.trTime = level.time; ent->physicsObject = qtrue; ent->physicsBounce = 0.5; }
	if(ent->sb_coll == 0){
	ent->r.contents = CONTENTS_SOLID;	
	}
	if(ent->sb_coll == 1){
	ent->r.contents = CONTENTS_TRIGGER;	
	}
	ent->s.generic2 = ent->sb_generic1;
	ent->s.scales[0] = ent->sb_colscale0;
	ent->s.scales[1] = ent->sb_colscale1;
	ent->s.scales[2] = ent->sb_colscale2;
	ent->s.apos.trBase[0] = ent->sb_rotate0;
	ent->s.apos.trBase[1] = ent->sb_rotate1;
	ent->s.apos.trBase[2] = ent->sb_rotate2;	
	VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
	VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
	trap_LinkEntity( ent );
}

void G_BuildPropSL( char *arg02, char *arg03, vec3_t xyz, gentity_t *player, char *arg04, char *arg05, char *arg06, char *arg07, char *arg08, char *arg09, char *arg10, char *arg11, char *arg12, char *arg13, char *arg14, char *arg15, char *arg16, char *arg17, char *arg18, char *arg19, char *arg20, char *arg21, char *arg22, char *arg23, char *arg24, char *arg25, char *arg26, char *arg27, char *arg28, char *arg29, char *arg30, char *arg31, char *arg32, char *arg33, char *arg34, char *arg35, char *arg36, char *arg37, char *arg38, char *arg39, char *arg40, char *arg41, char *arg42, char *arg43, char *arg44, char *arg45, char *arg46, char *arg47, char *arg48, char *arg49, char *arg50, char *arg51, char *arg52, char *arg53, char *arg54, char *arg55, char *arg56, char *arg57, char *arg58, char *arg59 ) {
	gentity_t	*ent;
	vec3_t		snapped;
	vec3_t		o;
	spawn_t	*s;
	gitem_t	*item;
	
	o[0] = ((int)((xyz[0] + (xyz[0] < 0 ? -atoi(arg06) : atoi(arg06))) / (atoi(arg06) * 2)) * (atoi(arg06) * 2));
	o[1] = ((int)((xyz[1] + (xyz[1] < 0 ? -atoi(arg06) : atoi(arg06))) / (atoi(arg06) * 2)) * (atoi(arg06) * 2));
	o[2] = ((int)((xyz[2] + (xyz[2] < 0 ? -atoi(arg06) : atoi(arg06))) / (atoi(arg06) * 2)) * (atoi(arg06) * 2));

	if (trap_Cvar_VariableIntegerValue("cl_android")) {
    o[0] -= (xyz[0] >= 0 ? (atoi(arg06)) : -(atoi(arg06)));
    o[1] -= (xyz[1] >= 0 ? (atoi(arg06)) : -(atoi(arg06)));
    o[2] -= (xyz[2] >= 0 ? (atoi(arg06)) : -(atoi(arg06)));
	}

	VectorCopy (o, snapped);
	
	// create new entity
	ent = G_Spawn();
	ent->spawnflags = atoi(arg07);
	ent->sandboxObject = 1;
	ent->sb_takedamage = 1;
	ent->sb_takedamage2 = 1;
	CopyAlloc(ent->classname, arg03);


	//spawn item or func
	VectorCopy( snapped, ent->s.origin );
	VectorCopy( snapped, ent->s.pos.trBase );
	VectorCopy( snapped, ent->r.currentOrigin );
	if(atoi(arg04) == 1){
	ent->owner = player->s.clientNum + 1;
	ent->ownername = player->client->pers.netname;
	}
	
	ent->s.generic2 = atoi(arg08);
	ent->sb_generic1 = atoi(arg08);
	
	if(atoi(arg09) == 0){
	ent->s.pos.trType = TR_STATIONARY; ent->physicsObject = qfalse; ent->sb_phys = 1;
	}
	if(atoi(arg09) == 1){
	ent->s.pos.trType = TR_GRAVITY; ent->s.pos.trTime = level.time; ent->physicsObject = qtrue; ent->physicsBounce = 0.5; ent->sb_phys = 2;
	}

	if(atoi(arg10) == 0){
	ent->r.contents = CONTENTS_SOLID;
	ent->sb_coll = 0;
	}
	if(atoi(arg10) == 1){
	ent->r.contents = CONTENTS_TRIGGER;
	ent->sb_coll = 1;
	}
	ent->s.loopSound = G_SoundIndex(arg11);
	CopyAlloc(ent->sb_sound, arg11);
	
	ent->health = atoi(arg12);
	
	ent->s.constantLight = atoi(arg13) | ( atoi(arg14) << 8 ) | ( atoi(arg15) << 16 ) | ( atoi(arg16) << 24 );
	ent->sb_red = atoi(arg13);
	ent->sb_green = atoi(arg14);
	ent->sb_blue = atoi(arg15);
	ent->sb_radius = atoi(arg16);

	ent->s.scales[0] = atof(arg17);
	ent->sb_colscale0 = atof(arg17);
	ent->s.scales[1] = atof(arg18);
	ent->sb_colscale1 = atof(arg18);
	ent->s.scales[2] = atof(arg19);
	ent->sb_colscale2 = atof(arg19);
	
	if ( strcmp(arg20, "0") ) {
	CopyAlloc(ent->target, arg20);
	}
	if ( strcmp(arg21, "0") ) {
	CopyAlloc(ent->targetname, arg21);
	}
	
	ent->mtype = atoi(arg22);
	ent->mtimeout = atoi(arg23);
	ent->mhoming = atoi(arg24);
	ent->mbounce = atoi(arg25);
	ent->mdamage = atoi(arg26);
	ent->msdamage = atoi(arg27);
	ent->msradius = atoi(arg28);
	ent->mgravity = atoi(arg29);
	ent->mnoclip = atoi(arg30);
	ent->mspeed = atoi(arg31);
	
	ent->allowuse = atoi(arg32);
	if ( strcmp(arg33, "0") ) {
	ent->speed = atoi(arg33);
	}
	if ( strcmp(arg34, "0") ) {
	CopyAlloc(ent->message, arg34);
	}
	if ( strcmp(arg35, "0") ) {
	CopyAlloc(ent->messageru, arg35);
	}
	if ( strcmp(arg36, "0") ) {
	CopyAlloc(ent->team, arg36);
	}
	if ( strcmp(arg37, "0") ) {
	ent->wait = atoi(arg37);
	}
	if ( strcmp(arg38, "0") ) {
	ent->random = atoi(arg38);
	}
	if ( strcmp(arg39, "0") ) {
	ent->playerangle = atoi(arg39);
	}
	if ( strcmp(arg40, "0") ) {
	ent->price = atoi(arg40);
	}
	if ( strcmp(arg41, "0") ) {
	ent->damage = atoi(arg41);
	}
	if ( strcmp(arg42, "0") ) {
	CopyAlloc(ent->targetShaderName, arg42);
	}
	if ( strcmp(arg43, "0") ) {
	CopyAlloc(ent->targetShaderNewName, arg43);
	}
	if ( strcmp(arg44, "0") ) {
	CopyAlloc(ent->mapname, arg44);
	}
	if ( strcmp(arg45, "0") ) {
	CopyAlloc(ent->clientname, arg45);
	}
	if ( strcmp(arg46, "0") ) {
	CopyAlloc(ent->teleporterTarget, arg46);
	}
	if ( strcmp(arg47, "0") ) {
	CopyAlloc(ent->deathTarget, arg47);
	}
	if ( strcmp(arg48, "0") ) {
	CopyAlloc(ent->lootTarget, arg48);
	}
	if ( strcmp(arg49, "0") ) {
	ent->skill = atoi(arg49);
	}
	if ( strcmp(arg50, "0") ) {
	CopyAlloc(ent->overlay, arg50);
	}
	if ( strcmp(arg51, "0") ) {
	CopyAlloc(ent->target2, arg51);
	}
	if ( strcmp(arg52, "0") ) {
	CopyAlloc(ent->damagetarget, arg52);
	}
	if ( strcmp(arg53, "0") ) {
	CopyAlloc(ent->targetname2, arg53);
	}
	if ( strcmp(arg54, "0") ) {
	CopyAlloc(ent->key, arg54);
	}
	if ( strcmp(arg55, "0") ) {
	CopyAlloc(ent->value, arg55);
	}
	if ( strcmp(arg56, "0") ) {
	ent->armor = atoi(arg56);
	}
	if ( strcmp(arg57, "0") ) {
	CopyAlloc(ent->music, arg57);
	}
	if ( strcmp(arg58, "0") ) {
	ent->distance = atoi(arg58);
	}
	if ( strcmp(arg59, "0") ) {
	ent->type = atoi(arg59);
	}

	// check item spawn functions
	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
		if ( !strcmp(item->classname, ent->classname) ) {
			snapped[2] += 48;
			VectorCopy( snapped, ent->s.origin );
			VectorCopy( snapped, ent->s.pos.trBase );
			VectorCopy( snapped, ent->r.currentOrigin );
			G_SpawnItem( ent, item );
			return;
		}
	}

	// check normal spawn functions
	for ( s=sandspawns ; s->name ; s++ ) {
		if ( !strcmp(s->name, ent->classname) ) {
			// found it
			CopyAlloc(ent->sb_class, ent->classname);
			s->spawn(ent);
			//spawn another class
			ent->s.modelindex = G_ModelIndex( va("props/%s",arg02) );
			CopyAlloc(ent->sb_model, arg02);
			ent->sb_coltype = atoi(arg05);
			VectorSet( ent->r.mins, -atoi(arg05), -atoi(arg05), -atoi(arg05) );
			VectorSet( ent->r.maxs, atoi(arg05), atoi(arg05), atoi(arg05) );
			ent->classname = "func_prop";
			ent->r.svFlags &= ~SVF_NOCLIENT;
			VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
			VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
			trap_LinkEntity( ent );
			return;
		}
	}

	//prop init
	ent->s.eType = ET_GENERAL;
	ent->classname = "func_prop";
	VectorCopy( ent->s.angles, ent->s.apos.trBase );
	ent->takedamage = qtrue;
	ent->takedamage2 = qtrue;
	ent->die = BlockDie;		
	ent->s.modelindex = G_ModelIndex( va("props/%s",arg02) );
	CopyAlloc(ent->sb_model, arg02);
	ent->sb_coltype = atoi(arg05);
	VectorSet( ent->r.mins, -atoi(arg05), -atoi(arg05), -atoi(arg05) );
	VectorSet( ent->r.maxs, atoi(arg05), atoi(arg05), atoi(arg05) );
	
	VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
	VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );

	trap_LinkEntity( ent );
}

void G_BuildProp( char *model, char *class, vec3_t xyz, gentity_t *player, int priv, int mix, int grid, int sf ) {
	gentity_t	*ent;
	vec3_t		snapped;
	vec3_t		o;
	spawn_t	*s;
	gitem_t	*item;
	
	if(mix < 10){
	mix = 10;
	}
	
	if(mix > 100){
	mix = 100;
	}
	
	o[0] = ((int)((xyz[0] + (xyz[0] < 0 ? -grid : grid)) / (grid * 2)) * (grid * 2));
	o[1] = ((int)((xyz[1] + (xyz[1] < 0 ? -grid : grid)) / (grid * 2)) * (grid * 2));
	o[2] = ((int)((xyz[2] + (xyz[2] < 0 ? -grid : grid)) / (grid * 2)) * (grid * 2));
	
	if (trap_Cvar_VariableIntegerValue("cl_android")) {
    o[0] -= (xyz[0] >= 0 ? grid : -grid);
    o[1] -= (xyz[1] >= 0 ? grid : -grid);
    o[2] -= (xyz[2] >= 0 ? grid : -grid);
	}
	
	VectorCopy (o, snapped);
	
	// create new entity
	ent = G_Spawn();
	ent->spawnflags = sf;
	ent->sandboxObject = 1;
	ent->sb_coll = 0;
	ent->sb_phys = 0;
	ent->sb_takedamage = 1;
	ent->sb_takedamage2 = 1;
	CopyAlloc(ent->classname, class);


	//spawn item or func
	VectorCopy( snapped, ent->s.origin );
	VectorCopy( snapped, ent->s.pos.trBase );
	VectorCopy( snapped, ent->r.currentOrigin );
	if(priv == 1){
	ent->owner = player->s.clientNum + 1;
	ent->ownername = player->client->pers.netname;
	}

	// check item spawn functions
	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
		if ( !strcmp(item->classname, ent->classname) ) {
			snapped[2] += 48;
			VectorCopy( snapped, ent->s.origin );
			VectorCopy( snapped, ent->s.pos.trBase );
			VectorCopy( snapped, ent->r.currentOrigin );
			G_SpawnItem( ent, item );
			return;
		}
	}

	// check normal spawn functions
	for ( s=sandspawns ; s->name ; s++ ) {
		if ( !strcmp(s->name, ent->classname) ) {
			// found it
			CopyAlloc(ent->sb_class, ent->classname);
			s->spawn(ent);
			//spawn another class
			ent->r.contents = CONTENTS_SOLID;
			ent->s.modelindex = G_ModelIndex( va("props/%s",model) );
			CopyAlloc(ent->sb_model, model);
			ent->s.scales[0] = 1.0;
			ent->s.scales[1] = 1.0;
			ent->s.scales[2] = 1.0;
			ent->sb_colscale0 = 1.0;
			ent->sb_colscale1 = 1.0;
			ent->sb_colscale2 = 1.0;
			ent->s.apos.trBase[0] = 0;
			ent->s.apos.trBase[1] = 0;
			ent->s.apos.trBase[2] = 0;
			ent->sb_rotate0 = 0;
			ent->sb_rotate1 = 0;
			ent->sb_rotate2 = 0;
			ent->sb_coltype = mix;
			VectorSet( ent->r.mins, -mix, -mix, -mix );
			VectorSet( ent->r.maxs, mix, mix, mix );
			ent->classname = "func_prop";
			ent->r.svFlags &= ~SVF_NOCLIENT;
			trap_LinkEntity( ent );
			return;
		}
	}

	//prop init
	ent->s.eType = ET_GENERAL;
	ent->classname = "func_prop";
	ent->s.pos.trType = TR_STATIONARY;
	ent->r.contents = CONTENTS_SOLID;
	VectorCopy( ent->s.angles, ent->s.apos.trBase );
	ent->health = 1000;
	ent->takedamage = qtrue;
	ent->takedamage2 = qtrue;
	ent->die = BlockDie;		
	ent->s.modelindex = G_ModelIndex( va("props/%s",model) );
	CopyAlloc(ent->sb_model, model);
	ent->s.scales[0] = 1.0;
	ent->s.scales[1] = 1.0;
	ent->s.scales[2] = 1.0;
	ent->sb_colscale0 = 1.0;
	ent->sb_colscale1 = 1.0;
	ent->sb_colscale2 = 1.0;
	ent->s.apos.trBase[0] = 0;
	ent->s.apos.trBase[1] = 0;
	ent->s.apos.trBase[2] = 0;
	ent->sb_rotate0 = 0;
	ent->sb_rotate1 = 0;
	ent->sb_rotate2 = 0;
	ent->sb_coltype = mix;
	VectorSet( ent->r.mins, -mix, -mix, -mix );
	VectorSet( ent->r.maxs, mix, mix, mix );

	trap_LinkEntity( ent );
}

void G_AddItem( char *name, vec3_t origin, int wait, int count, char *target, int sf  ) {
	gentity_t	*ent;

	// spawn item
	ent = G_Spawn();
	VectorCopy( origin, ent->s.origin );
	ent->classname = name;
	ent->wait = wait;
	ent->count = count;
	ent->target = target;
	ent->spawnflags = sf;
	G_CallSpawn(ent);
}

void SandboxObject( gentity_t *ent ) {
	//Здесь берется само название модели, а не ее присвоенный id
	ent->s.modelindex = G_ModelIndex( va("props/%s",ent->sb_model) );
	ent->die = BlockDie;
	ent->health = 300;
	ent->takedamage = qtrue;
	VectorSet( ent->r.mins, -ent->sb_coltype, -ent->sb_coltype, -ent->sb_coltype);
	VectorSet( ent->r.maxs, ent->sb_coltype, ent->sb_coltype, ent->sb_coltype );
}

void G_ModProp( gentity_t *targ, gentity_t *attacker ) { //gmodtool, gmodtoolmode, gmodmodifiers, gmodmod_one, gmodmod_two
int number;
if(!g_building.integer){ return; }
if(!g_allowtoolgun.integer){ return; }
number = rand() % 2 + 1;
if(number == 1){
trap_SendServerCommand( attacker-g_entities, va("clcmd \"%s\"", "play sound/toolgun1" ));
}
if(number == 2){
trap_SendServerCommand( attacker-g_entities, va("clcmd \"%s\"", "play sound/toolgun2" ));
}
if(!g_toolplayers.integer){
if(targ->client){
if(attacker->gmodtool != 999){
return;
}
}
}
if(!attacker->client){
return;
}
if(targ->owner != attacker->s.clientNum + 1){
if(targ->owner != 0){
trap_SendServerCommand( attacker->s.clientNum, va( "cp \"Owned by %s\n\"", targ->ownername ));
return;
}	
}
/*if(targ->s.generic2 != attacker->s.clientNum + 1){
if(targ->s.generic2 != 0){
trap_SendServerCommand( attacker->s.clientNum, va( "cp \"Selected by another player\n\"" ));
return;
}	
}*/
if(attacker->gmodtool == 1){
	targ->s.generic2 = atoi(attacker->gmodmodifiers);
	targ->sb_generic1 = atoi(attacker->gmodmodifiers);
}
if(attacker->gmodtool == 2){
	G_FreeEntity(targ);
}
if(attacker->gmodtool == 3){
	targ->s.modelindex = G_ModelIndex( va("props/%s", attacker->gmodmodifiers) );
	CopyAlloc(targ->sb_model, attacker->gmodmodifiers);
}
if(attacker->gmodtool == 4){
	if(attacker->gmodtoolmode == 0){
	targ->s.pos.trType = TR_STATIONARY; targ->physicsObject = qfalse; targ->sb_phys = 1;
	}
	if(attacker->gmodtoolmode == 1){
	targ->s.pos.trType = TR_GRAVITY; targ->s.pos.trTime = level.time; targ->physicsObject = qtrue; targ->physicsBounce = 0.5; targ->sb_phys = 2;
	}
}
if(attacker->gmodtool == 5){
	if(attacker->gmodtoolmode == 0){
	targ->owner = 0;
	targ->ownername = 0;
	}
	if(attacker->gmodtoolmode == 1){
	targ->owner = attacker->s.clientNum + 1;
	targ->ownername = attacker->client->pers.netname;
	}
	if(attacker->gmodtoolmode == 2){
	if(targ->ownername){
	trap_SendServerCommand( attacker->s.clientNum, va( "cp \"Owned by %s\n\"", targ->ownername ));
	} 
	if(!targ->ownername){
	trap_SendServerCommand( attacker->s.clientNum, "cp \"Not owned\n\"" );
	} 
	}
}
if(attacker->gmodtool == 6){
	if(attacker->gmodtoolmode == 0){
	targ->r.contents = CONTENTS_SOLID;
	targ->sb_coll = 0;
	}
	if(attacker->gmodtoolmode == 1){
	targ->r.contents = CONTENTS_TRIGGER;
	targ->sb_coll = 1;
	}
trap_UnlinkEntity( targ );
trap_LinkEntity( targ );
}
if(attacker->gmodtool == 7){
	if(attacker->gmodtoolmode == 0){
	targ->health = atoi(attacker->gmodmodifiers);
	}
	if(attacker->gmodtoolmode == 1){
	targ->takedamage = qfalse;
	targ->sb_takedamage = 0;
	}
	if(attacker->gmodtoolmode == 2){
	targ->takedamage = qtrue;
	targ->sb_takedamage = 1;
	}
	if(attacker->gmodtoolmode == 3){
	targ->takedamage2 = qfalse;
	targ->sb_takedamage2 = 0;
	}
	if(attacker->gmodtoolmode == 4){
	targ->takedamage2 = qtrue;
	targ->sb_takedamage2 = 1;
	}
}
if(attacker->gmodtool == 8){
	targ->s.constantLight = atoi(attacker->gmodmodifiers) | ( attacker->gmodmod_one << 8 ) | ( attacker->gmodmod_two << 16 ) | ( attacker->gmodtoolmode << 24 );
	targ->sb_red = atoi(attacker->gmodmodifiers);
	targ->sb_green = attacker->gmodmod_one;
	targ->sb_blue = attacker->gmodmod_two;
	targ->sb_radius = attacker->gmodtoolmode;
	trap_UnlinkEntity( targ );
	trap_LinkEntity( targ );
}
if(attacker->gmodtool == 9){
if(attacker->gmodtoolmode == 0){
	targ->s.apos.trBase[0] = atof(attacker->gmodmodifiers);
	targ->sb_rotate0 = atof(attacker->gmodmodifiers);
}
if(attacker->gmodtoolmode == 1){
	targ->s.apos.trBase[1] = atof(attacker->gmodmodifiers);
	targ->sb_rotate1 = atof(attacker->gmodmodifiers);
}
if(attacker->gmodtoolmode == 2){
	targ->s.apos.trBase[2] = atof(attacker->gmodmodifiers);
	targ->sb_rotate2 = atof(attacker->gmodmodifiers);
}
	trap_UnlinkEntity( targ );
	trap_LinkEntity( targ );
}
if(attacker->gmodtool == 10){
	if(attacker->gmodtoolmode == 0){
	if(!targ->sandboxInteract){
	targ->parent = attacker;
	targ->sandboxInteract = 1;
	attacker->sandboxInteract = 1;
	targ->think = PhysgunInteract;
	targ->nextthink = level.time + 1;
	targ->parent->InteractDist = 0;
	trap_SendServerCommand( attacker-g_entities, va("clcmd \"%s\"", "execscript d_interact1" ));
	} else {
	targ->sandboxInteract = 0;
	attacker->sandboxInteract = 0;
	trap_SendServerCommand( attacker-g_entities, va("clcmd \"%s\"", "execscript d_interact0" ));
	}
	}
	if(attacker->gmodtoolmode == 1){
	if(!targ->sandboxInteract){
	targ->parent = attacker;
	targ->sandboxInteract = 1;
	attacker->sandboxInteract = 1;
	targ->think = PhysgunInteract;
	targ->nextthink = level.time + 1;
	targ->parent->InteractDist = 0;
	trap_SendServerCommand( attacker-g_entities, va("clcmd \"%s\"", "execscript d_interact1" ));
	} else {
	targ->sandboxInteract = 0;
	attacker->sandboxInteract = 0;
	targ->s.pos.trType = TR_GRAVITY; targ->s.pos.trTime = level.time; targ->physicsObject = qtrue; targ->physicsBounce = 0.5; targ->sb_phys = 2;
	trap_SendServerCommand( attacker-g_entities, va("clcmd \"%s\"", "execscript d_interact0" ));
	}
	}
}
if(attacker->gmodtool == 11){
if(attacker->gmodtoolmode == 0){
	targ->s.scales[0] = atof(attacker->gmodmodifiers);
	targ->sb_colscale0 = atof(attacker->gmodmodifiers);
}
if(attacker->gmodtoolmode == 1){
	targ->s.scales[1] = atof(attacker->gmodmodifiers);
	targ->sb_colscale1 = atof(attacker->gmodmodifiers);
}
if(attacker->gmodtoolmode == 2){
	targ->s.scales[2] = atof(attacker->gmodmodifiers);
	targ->sb_colscale2 = atof(attacker->gmodmodifiers);
}
	VectorSet( targ->r.mins, -targ->sb_coltype*targ->sb_colscale0, -targ->sb_coltype*targ->sb_colscale1, -targ->sb_coltype*targ->sb_colscale2);
	VectorSet( targ->r.maxs, targ->sb_coltype*targ->sb_colscale0, targ->sb_coltype*targ->sb_colscale1, targ->sb_coltype*targ->sb_colscale2 );
	trap_UnlinkEntity( targ );
	trap_LinkEntity( targ );
}
}

void Svcmd_RCM( void ) {

	CustomModRun = 0;
}

/*
================
G_BounceProp

================
*/
void G_BounceProp( gentity_t *ent, trace_t *trace ) {
	vec3_t	velocity;
	float	dot;
	int		hitTime;

	// reflect the velocity on the trace plane
	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
	dot = DotProduct( velocity, trace->plane.normal );
	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );

	// cut the velocity to keep from bouncing forever
	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );

	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
	ent->s.pos.trTime = level.time;
}

/*
================
G_RunProp

================
*/
void G_RunProp( gentity_t *ent ) {
	vec3_t		origin;
	trace_t		tr;
	int			contents;
	int			mask;


	// if groundentity has been set to -1, it may have been pushed off an edge
	if ( ent->s.groundEntityNum == -1 ) {
		if ( ent->s.pos.trType != TR_GRAVITY ) {
			ent->s.pos.trType = TR_GRAVITY;
			ent->s.pos.trTime = level.time;
		}
	}
	
	if ( ent->s.pos.trType == TR_STATIONARY ) {
		// check think function
		G_RunThink( ent );
		return;
	}

	if(!ent->sandboxInteract){
	// get current position
	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
	}

	// trace a line from the previous position to the current position
	if ( ent->clipmask ) {
		mask = ent->clipmask;
	} else {
		mask = MASK_PLAYERSOLID;
	}
	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin,
		ent->s.number, mask );

	VectorCopy( tr.endpos, ent->r.currentOrigin );

	if ( tr.startsolid ) {
		tr.fraction = 0;
	}

	trap_LinkEntity( ent );

	// check think function
	G_RunThink( ent );

	if ( tr.fraction == 1 ) {
		return;
	}

	G_BounceProp( ent, &tr );
}

/*
================
G_HideObjects

================
*/
void G_HideObjects() {
	int			i;
	gentity_t	*ent;
	int			mins, seconds, tens;
	int			msec;
	int start, end;


	//
	// go through all allocated objects
	//
	start = trap_Milliseconds();
	ent = &g_entities[0];
	for (i=0 ; i<level.num_entities ; i++, ent++) {
	if(i>level.num_entities-1){
	G_Printf("Object (hide) processed!");	
	}
	if(ent->sandboxObject){
	trap_UnlinkEntity( ent );
	}
	continue;
	
	}
}

/*
================
G_ShowObjects

================
*/
void G_ShowObjects() {
	int			i;
	gentity_t	*ent;
	int			thinktime = 1;


	//
	// go through all allocated objects
	//
	ent = &g_entities[0];
	for (i=0 ; i<level.num_entities ; i++, ent++) {
	thinktime += 10;
	if(i>level.num_entities-1){
	G_Printf("Object (show) processed!");	
	}
	if(ent->sandboxObject){
	ent->nextthink = level.time + thinktime;
	ent->think = ShowSandObject;
	}
	continue;
	
	}
	G_Printf("Object (show) processed!");
}
