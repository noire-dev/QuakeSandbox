data
export sandspawns
align 4
LABELV sandspawns
address $65
address SP_info_player_start
address $66
address SP_info_player_deathmatch
address $67
address SP_info_player_intermission
address $68
address SP_info_player_dd
address $69
address SP_info_player_dd_red
address $70
address SP_info_player_dd_blue
address $71
address SP_domination_point
address $72
address SP_info_null
address $73
address SP_info_notnull
address $74
address SP_info_camp
address $75
address SP_info_waypoint
address $76
address SP_info_backpack
address $77
address SP_info_camera
address $78
address SP_func_plat
address $79
address SP_func_button
address $80
address SP_func_door
address $81
address SP_func_static
address $82
address SP_func_prop
address $83
address SP_func_rotating
address $84
address SP_func_bobbing
address $85
address SP_func_pendulum
address $86
address SP_func_train
address $87
address SP_info_null
address $88
address SP_func_timer
address $89
address SP_func_breakable
address $88
address SP_func_timer
address $90
address SP_trigger_always
address $91
address SP_trigger_multiple
address $92
address SP_trigger_push
address $93
address SP_trigger_teleport
address $94
address SP_trigger_hurt
address $95
address SP_trigger_death
address $96
address SP_trigger_frag
address $97
address SP_trigger_lock
address $98
address SP_target_give
address $99
address SP_target_remove_powerups
address $100
address SP_target_delay
address $101
address SP_target_speaker
address $102
address SP_target_print
address $103
address SP_target_laser
address $104
address SP_target_score
address $105
address SP_target_clienttarg
address $106
address SP_target_teleporter
address $107
address SP_target_relay
address $108
address SP_target_kill
address $109
address SP_target_position
address $110
address SP_target_location
address $111
address SP_target_push
address $112
address SP_target_logic
address $113
address SP_target_gravity
address $114
address SP_target_mapchange
address $115
address SP_target_botspawn
address $116
address SP_target_unlink
address $117
address SP_target_unlink
address $118
address SP_target_debrisemitter
address $119
address SP_target_objective
address $120
address SP_target_skill
address $121
address SP_target_earthquake
address $122
address SP_target_effect
address $123
address SP_target_finish
address $124
address SP_target_modify
address $125
address SP_target_secret
address $126
address SP_target_playerstats
address $127
address SP_target_variable
address $128
address SP_target_cutscene
address $129
address SP_target_botremove
address $130
address SP_target_stats
address $131
address SP_script_variable
address $132
address SP_script_layer
address $133
address SP_light
address $134
address SP_path_corner
address $135
address SP_misc_teleporter_dest
address $136
address SP_misc_model
address $137
address SP_misc_portal_surface
address $138
address SP_misc_portal_camera
address $139
address SP_shooter_rocket
address $140
address SP_shooter_grenade
address $141
address SP_shooter_plasma
address $142
address SP_shooter_bfg
address $143
address SP_shooter_prox
address $144
address SP_shooter_flame
address $145
address SP_shooter_antimatter
address $146
address SP_shooter_custom
address $147
address SP_team_CTF_redplayer
address $148
address SP_team_CTF_blueplayer
address $149
address SP_team_CTF_redspawn
address $150
address SP_team_CTF_bluespawn
address $151
address SP_func_door_rotating
address $152
address SP_team_redobelisk
address $153
address SP_team_blueobelisk
address $154
address SP_team_neutralobelisk
address $155
address SP_rally_weather_rain
address $156
address SP_rally_weather_snow
byte 4 0
byte 4 0
export SP_info_camp
code
proc SP_info_camp 4 8
file "../../../code/game/g_misc.c"
line 279
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:// g_misc.c
;24:
;25:#include "g_local.h"
;26:
;27:
;28:typedef struct {
;29:	char	*name;
;30:	void	(*spawn)(gentity_t *ent);
;31:} spawn_t;
;32:
;33:void SP_info_player_start (gentity_t *ent);
;34:void SP_info_player_deathmatch (gentity_t *ent);
;35:void SP_info_player_intermission (gentity_t *ent);
;36://For Double Domination:
;37:void SP_info_player_dd (gentity_t *ent);
;38:void SP_info_player_dd_red (gentity_t *ent);
;39:void SP_info_player_dd_blue (gentity_t *ent);
;40://standard domination:
;41:void SP_domination_point ( gentity_t *ent);
;42:
;43:void SP_info_firstplace(gentity_t *ent);
;44:void SP_info_secondplace(gentity_t *ent);
;45:void SP_info_thirdplace(gentity_t *ent);
;46:void SP_info_podium(gentity_t *ent);
;47:void SP_info_waypoint( gentity_t *self );
;48:void SP_info_backpack( gentity_t *self );
;49:
;50:void SP_func_plat (gentity_t *ent);
;51:void SP_func_static (gentity_t *ent);
;52:void SP_func_prop (gentity_t *ent);
;53:void SP_func_breakable (gentity_t *ent);
;54:void SP_func_rotating (gentity_t *ent);
;55:void SP_func_bobbing (gentity_t *ent);
;56:void SP_func_pendulum( gentity_t *ent );
;57:void SP_func_button (gentity_t *ent);
;58:void SP_func_door (gentity_t *ent);
;59:void SP_func_train (gentity_t *ent);
;60:void SP_func_timer (gentity_t *self);
;61:
;62:void SP_trigger_always (gentity_t *ent);
;63:void SP_trigger_multiple (gentity_t *ent);
;64:void SP_trigger_push (gentity_t *ent);
;65:void SP_trigger_teleport (gentity_t *ent);
;66:void SP_trigger_hurt (gentity_t *ent);
;67:
;68:void SP_trigger_death (gentity_t *ent);
;69:void SP_trigger_frag (gentity_t *ent);
;70:void SP_trigger_lock (gentity_t *ent);
;71:
;72:void SP_target_remove_powerups( gentity_t *ent );
;73:void SP_target_give (gentity_t *ent);
;74:void SP_target_delay (gentity_t *ent);
;75:void SP_target_speaker (gentity_t *ent);
;76:void SP_target_print (gentity_t *ent);
;77:void SP_target_laser (gentity_t *self);
;78:void SP_target_character (gentity_t *ent);
;79:void SP_target_score( gentity_t *ent );
;80:void SP_target_clienttarg( gentity_t *ent );
;81:void SP_target_teleporter( gentity_t *ent );
;82:void SP_target_relay (gentity_t *ent);
;83:void SP_target_kill (gentity_t *ent);
;84:void SP_target_position (gentity_t *ent);
;85:void SP_target_location (gentity_t *ent);
;86:void SP_target_push (gentity_t *ent);
;87:void SP_target_logic (gentity_t *ent);
;88:void SP_target_gravity (gentity_t *ent);
;89:void SP_target_mapchange (gentity_t *ent);
;90:void SP_target_botspawn (gentity_t *ent);
;91:void SP_target_unlink (gentity_t *ent);
;92:void SP_target_playerspeed (gentity_t *ent);
;93:void SP_target_debrisemitter (gentity_t *ent);
;94:void SP_target_objective (gentity_t *ent);
;95:void SP_target_skill (gentity_t *ent);
;96:void SP_target_earthquake (gentity_t *ent);
;97:void SP_target_effect (gentity_t *ent);
;98:void SP_target_finish (gentity_t *ent);
;99:void SP_target_modify (gentity_t *ent);
;100:void SP_target_secret (gentity_t *ent);
;101:void SP_target_playerstats (gentity_t *ent);
;102:void SP_target_variable (gentity_t *ent);
;103:void SP_target_cutscene (gentity_t *ent);
;104:void SP_target_botremove (gentity_t *ent);
;105:void SP_target_stats (gentity_t *ent);
;106:
;107:void SP_script_variable (gentity_t *ent);
;108:void SP_script_layer (gentity_t *ent);
;109:
;110:void SP_light (gentity_t *self);
;111:void SP_info_null (gentity_t *self);
;112:void SP_info_notnull (gentity_t *self);
;113:void SP_info_camp (gentity_t *self);
;114:void SP_info_camera (gentity_t *self);
;115:void SP_path_corner (gentity_t *self);
;116:
;117:void SP_misc_teleporter_dest (gentity_t *self);
;118:void SP_misc_model(gentity_t *ent);
;119:void SP_misc_portal_camera(gentity_t *ent);
;120:void SP_misc_portal_surface(gentity_t *ent);
;121:
;122:void SP_shooter_rocket( gentity_t *ent );
;123:void SP_shooter_plasma( gentity_t *ent );
;124:void SP_shooter_grenade( gentity_t *ent );
;125:void SP_shooter_bfg( gentity_t *ent );
;126:void SP_shooter_prox( gentity_t *ent );
;127:void SP_shooter_flame( gentity_t *ent );
;128:void SP_shooter_antimatter( gentity_t *ent );
;129:void SP_shooter_custom( gentity_t *ent );
;130:
;131:void SP_team_CTF_redplayer( gentity_t *ent );
;132:void SP_team_CTF_blueplayer( gentity_t *ent );
;133:
;134:void SP_team_CTF_redspawn( gentity_t *ent );
;135:void SP_team_CTF_bluespawn( gentity_t *ent );
;136:
;137:void SP_func_door_rotating( gentity_t *ent );
;138:
;139:void SP_team_blueobelisk( gentity_t *ent );
;140:void SP_team_redobelisk( gentity_t *ent );
;141:void SP_team_neutralobelisk( gentity_t *ent );
;142:
;143:// weather
;144:void SP_rally_weather_rain( gentity_t *ent );
;145:void SP_rally_weather_snow( gentity_t *ent );
;146:
;147:spawn_t	sandspawns[] = {
;148:	// info entities don't do anything at all, but provide positional
;149:	// information for things controlled by other processes
;150:	{"info_player_start", SP_info_player_start},
;151:	{"info_player_deathmatch", SP_info_player_deathmatch},
;152:	{"info_player_intermission", SP_info_player_intermission},
;153://Double Domination player spawn:
;154:	{"info_player_dd", SP_info_player_dd},
;155:        {"info_player_dd_red", SP_info_player_dd_red},
;156:        {"info_player_dd_blue", SP_info_player_dd_blue},
;157://Standard Domination point spawn:
;158:	{"domination_point", SP_domination_point},
;159:
;160:
;161:	{"info_null", SP_info_null},
;162:	{"info_notnull", SP_info_notnull},		// use target_position instead
;163:	{"info_camp", SP_info_camp},
;164:	{"info_waypoint", SP_info_waypoint},
;165:	{"info_backpack", SP_info_backpack},
;166:	{"info_camera", SP_info_camera},
;167:
;168:	{"func_plat", SP_func_plat},
;169:	{"func_button", SP_func_button},
;170:	{"func_door", SP_func_door},
;171:	{"func_static", SP_func_static},
;172:	{"func_prop", SP_func_prop},
;173:	{"func_rotating", SP_func_rotating},
;174:	{"func_bobbing", SP_func_bobbing},
;175:	{"func_pendulum", SP_func_pendulum},
;176:	{"func_train", SP_func_train},
;177:	{"func_group", SP_info_null},
;178:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;179:	{"func_breakable", SP_func_breakable},
;180:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;181:
;182:	// Triggers are brush objects that cause an effect when contacted
;183:	// by a living player, usually involving firing targets.
;184:	// While almost everything could be done with
;185:	// a single trigger class and different targets, triggered effects
;186:	// could not be client side predicted (push and teleport).
;187:	{"trigger_always", SP_trigger_always},
;188:	{"trigger_multiple", SP_trigger_multiple},
;189:	{"trigger_push", SP_trigger_push},
;190:	{"trigger_teleport", SP_trigger_teleport},
;191:	{"trigger_hurt", SP_trigger_hurt},
;192:	{"trigger_death", SP_trigger_death},
;193:	{"trigger_frag", SP_trigger_frag},
;194:	{"trigger_lock", SP_trigger_lock},
;195:
;196:	// targets perform no action by themselves, but must be triggered
;197:	// by another entity
;198:	{"target_give", SP_target_give},
;199:	{"target_remove_powerups", SP_target_remove_powerups},
;200:	{"target_delay", SP_target_delay},
;201:	{"target_speaker", SP_target_speaker},
;202:	{"target_print", SP_target_print},
;203:	{"target_laser", SP_target_laser},
;204:	{"target_score", SP_target_score},
;205:	{"target_clienttarg", SP_target_clienttarg},
;206:	
;207:	{"target_teleporter", SP_target_teleporter},
;208:	{"target_relay", SP_target_relay},
;209:	{"target_kill", SP_target_kill},
;210:	{"target_position", SP_target_position},
;211:	{"target_location", SP_target_location},
;212:	{"target_push", SP_target_push},
;213:	{"target_logic", SP_target_logic},
;214:	{"target_gravity", SP_target_gravity},
;215:	{"target_mapchange", SP_target_mapchange},
;216:	{"target_botspawn", SP_target_botspawn},
;217:	{"target_unlink", SP_target_unlink},
;218:	{"target_disable", SP_target_unlink},
;219:	{"target_debrisemitter", SP_target_debrisemitter},
;220:	{"target_objective", SP_target_objective},
;221:	{"target_skill", SP_target_skill},
;222:	{"target_earthquake", SP_target_earthquake},
;223:	{"target_effect", SP_target_effect},
;224:	{"target_finish", SP_target_finish},
;225:	{"target_modify", SP_target_modify},
;226:	{"target_secret", SP_target_secret},
;227:	{"target_playerstats", SP_target_playerstats},
;228:	{"target_variable", SP_target_variable},
;229:	{"target_cutscene", SP_target_cutscene},
;230:	{"target_botremove", SP_target_botremove},
;231:	{"target_stats", SP_target_stats},
;232:	
;233:	{"script_variable", SP_script_variable},
;234:	{"script_layer", SP_script_layer},
;235:
;236:	{"light", SP_light},
;237:	{"path_corner", SP_path_corner},
;238:
;239:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;240:	{"misc_model", SP_misc_model},
;241:	{"misc_portal_surface", SP_misc_portal_surface},
;242:	{"misc_portal_camera", SP_misc_portal_camera},
;243:
;244:	{"shooter_rocket", SP_shooter_rocket},
;245:	{"shooter_grenade", SP_shooter_grenade},
;246:	{"shooter_plasma", SP_shooter_plasma},
;247:	{"shooter_bfg", SP_shooter_bfg},
;248:	{"shooter_prox", SP_shooter_prox},
;249:	{"shooter_flame", SP_shooter_flame},
;250:	{"shooter_antimatter", SP_shooter_antimatter},
;251:	{"shooter_custom", SP_shooter_custom},
;252:
;253:	{"team_CTF_redplayer", SP_team_CTF_redplayer},
;254:	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},
;255:
;256:	{"team_CTF_redspawn", SP_team_CTF_redspawn},
;257:	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},
;258:
;259:	{"func_door_rotating", SP_func_door_rotating},
;260:
;261:	{"team_redobelisk", SP_team_redobelisk},
;262:	{"team_blueobelisk", SP_team_blueobelisk},
;263:	{"team_neutralobelisk", SP_team_neutralobelisk},
;264:
;265:	{"environment_rain", SP_rally_weather_rain},
;266:	{"environment_snow", SP_rally_weather_snow},
;267:
;268:	{NULL, 0}
;269:};
;270:
;271:/*QUAKED func_group (0 0 0) ?
;272:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;273:*/
;274:
;275:
;276:/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
;277:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;278:*/
;279:void SP_info_camp( gentity_t *self ) {
line 280
;280:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 281
;281:}
LABELV $157
endproc SP_info_camp 4 8
export SP_info_waypoint
proc SP_info_waypoint 0 0
line 286
;282:
;283:/*QUAKED info_waypoint (0 0.5 0) (-4 -4 -4) (4 4 4)
;284:Used as a waypoint target for bot patrolling
;285:*/
;286:void SP_info_waypoint( gentity_t *self ) {
line 287
;287:}
LABELV $158
endproc SP_info_waypoint 0 0
export SP_info_backpack
proc SP_info_backpack 0 0
line 292
;288:
;289:/*QUAKED info_backpack (0 0.5 0) ?
;290:Used as a teleportation target for backpacks that fall into a nodrop brush
;291:*/
;292:void SP_info_backpack( gentity_t *self ) {
line 293
;293:}
LABELV $159
endproc SP_info_backpack 0 0
export SP_info_null
proc SP_info_null 0 4
line 298
;294:
;295:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;296:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;297:*/
;298:void SP_info_null( gentity_t *self ) {
line 299
;299:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 300
;300:}
LABELV $160
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 307
;301:
;302:
;303:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;304:Used as a positional target for in-game calculation, like jumppad targets.
;305:target_position does the same thing
;306:*/
;307:void SP_info_notnull( gentity_t *self ){
line 308
;308:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 309
;309:}
LABELV $161
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 319
;310:
;311:
;312:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;313:Non-displayed light.
;314:"light" overrides the default 300 intensity.
;315:Linear checbox gives linear falloff instead of inverse square
;316:Lights pointed at a target will be spotlights.
;317:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;318:*/
;319:void SP_light( gentity_t *self ) {
line 320
;320:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 321
;321:}
LABELV $162
endproc SP_light 0 4
export originToVariableInfo
proc originToVariableInfo 12 12
line 326
;322:
;323:/*QUAKED info_camera (0 0.5 0) (-4 -4 -4) (4 4 4)
;324:Used as a positional and viewangles target for in-game cutscenes.
;325:*/
;326:void originToVariableInfo( char variableInfo[MAX_INFO_STRING], vec3_t origin ) {
line 327
;327:	Info_SetValueForKey(variableInfo, "o10", va("%f", origin[0]));
ADDRGP4 $165
ARGP4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 328
;328:	Info_SetValueForKey(variableInfo, "o11", va("%f", origin[1]));
ADDRGP4 $165
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 329
;329:	Info_SetValueForKey(variableInfo, "o12", va("%f", origin[2]));
ADDRGP4 $165
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 330
;330:}
LABELV $163
endproc originToVariableInfo 12 12
export anglesToVariableInfo
proc anglesToVariableInfo 12 12
line 332
;331:
;332:void anglesToVariableInfo(char variableInfo[MAX_INFO_STRING], vec3_t angles) {
line 333
;333:	Info_SetValueForKey(variableInfo, "a10", va("%f", angles[0]));
ADDRGP4 $165
ARGP4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 334
;334:	Info_SetValueForKey(variableInfo, "a11", va("%f", angles[1]));
ADDRGP4 $165
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 335
;335:	Info_SetValueForKey(variableInfo, "a12", va("%f", angles[2]));
ADDRGP4 $165
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 336
;336:}
LABELV $168
endproc anglesToVariableInfo 12 12
export Use_Camera
proc Use_Camera 1072 12
line 338
;337:
;338:void Use_Camera (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 342
;339:	char variableInfo[MAX_INFO_STRING];
;340:
;341:	//make camera movement info available for client 
;342:	variableInfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 343
;343:	Info_SetValueForKey(variableInfo, "w", va("%f", self->wait));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ARGF4
ADDRLP4 1024
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 344
;344:	Info_SetValueForKey(variableInfo, "t", va("%i", level.time));
ADDRGP4 $175
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 347
;345:
;346:	//add origin, viewangles and fov of source camera
;347:	if (self->armor > 0) {	//armor is abused here to indicate whether or not camera should use player's origin/viewangles or its own
ADDRFP4 0
INDIRP4
CNSTI4 2196
ADDP4
INDIRI4
CNSTI4 0
LEI4 $177
line 349
;348:		//use origin and viewangles of player
;349:		originToVariableInfo(variableInfo, level.clients[0].ps.origin);
ADDRLP4 0
ARGP4
ADDRGP4 level
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 originToVariableInfo
CALLV
pop
line 350
;350:		anglesToVariableInfo(variableInfo, level.clients[0].ps.viewangles);
ADDRLP4 0
ARGP4
ADDRGP4 level
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 anglesToVariableInfo
CALLV
pop
line 351
;351:	}
ADDRGP4 $178
JUMPV
LABELV $177
line 352
;352:	else {
line 354
;353:		//use origin and angles of this camera
;354:		originToVariableInfo(variableInfo, self->s.origin);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 originToVariableInfo
CALLV
pop
line 355
;355:		anglesToVariableInfo(variableInfo, self->s.angles);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 anglesToVariableInfo
CALLV
pop
line 356
;356:	}
LABELV $178
line 357
;357:	Info_SetValueForKey(variableInfo, "f1", va("%i", self->count));
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 359
;358:	
;359:	if ( self->nextTrain && (self->spawnflags & 1) ) {
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $180
ADDRLP4 1036
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $180
line 361
;360:		//add origin and viewangles of target camera
;361:		Info_SetValueForKey(variableInfo, "m", va("%i", self->spawnflags));
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 362
;362:		Info_SetValueForKey(variableInfo, "o20", va("%f", self->nextTrain->s.origin[0]));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ARGF4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 363
;363:		Info_SetValueForKey(variableInfo, "o21", va("%f", self->nextTrain->s.origin[1]));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ARGF4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 364
;364:		Info_SetValueForKey(variableInfo, "o22", va("%f", self->nextTrain->s.origin[2]));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ARGF4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $185
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 365
;365:		Info_SetValueForKey(variableInfo, "a20", va("%f", self->nextTrain->s.angles[0]));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ARGF4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 366
;366:		Info_SetValueForKey(variableInfo, "a21", va("%f", self->nextTrain->s.angles[1]));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $187
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 367
;367:		Info_SetValueForKey(variableInfo, "a22", va("%f", self->nextTrain->s.angles[2]));
ADDRGP4 $165
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $188
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 368
;368:		Info_SetValueForKey(variableInfo, "f2", va("%i", self->nextTrain->count));
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $189
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 369
;369:	} else {
ADDRGP4 $181
JUMPV
LABELV $180
line 370
;370:		Info_SetValueForKey(variableInfo, "m", "0");	//0 means no camera motion
ADDRLP4 0
ARGP4
ADDRGP4 $182
ARGP4
ADDRGP4 $190
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 371
;371:	}
LABELV $181
line 373
;372:	//G_Printf("%s\n", variableInfo);
;373:	trap_SetConfigstring( CS_CUTSCENE, variableInfo );
CNSTI4 8614
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 378
;374:
;375:	/*if(activator->client->ps.pm_type != PM_CUTSCENE){
;376:	VectorCopy(activator->client->ps.origin, activator->orgOrigin);
;377:	}*/
;378:	activator->client->ps.pm_type = PM_CUTSCENE;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 379
;379:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 380
;380:	self->nextthink = level.time + (self->wait * 1000);
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 1040
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 381
;381:}
LABELV $172
endproc Use_Camera 1072 12
export Think_Camera
proc Think_Camera 16 12
line 383
;382:
;383:void Think_Camera (gentity_t *self) {
line 386
;384:	int i;
;385:
;386:	if ( self->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $193
line 388
;387:		//jump to next camera
;388:		self->nextTrain->use( self->nextTrain, self->activator, self->activator );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 389
;389:	} else {
ADDRGP4 $194
JUMPV
LABELV $193
line 391
;390:		//cutscene should end so give player normal control
;391:		self->activator->client->ps.pm_type = PM_NORMAL;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 394
;392:
;393:		//move player back to original location
;394:		VectorCopy(self->activator->orgOrigin, self->activator->client->ps.origin);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 2200
ADDP4
INDIRB
ASGNB 12
line 397
;395:	
;396:		//give movement control back to bots
;397:		if ( self->parent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $195
line 398
;398:			for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 399
;399:				if ( level.clients[i].pers.connected != CON_DISCONNECTED && level.clients[i].ps.pm_type != PM_DEAD )
ADDRLP4 8
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $202
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $202
line 400
;400:					level.clients[i].ps.pm_type = PM_NORMAL;
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
LABELV $202
line 401
;401:			}
LABELV $198
line 398
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $197
line 402
;402:		}
LABELV $195
line 405
;403:
;404:		//link the player back into the world
;405:		trap_LinkEntity( self->activator );
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 406
;406:		self->activator->r.contents += CONTENTS_BODY;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 33554432
ADDI4
ASGNI4
line 410
;407:
;408:		//enable synchronousClients if it was enabled before the cutscene kicked in. The skill field is abused to
;409:		//temporarily store the pre-cutscene value of g_synchronousclients
;410:		if (g_allowSyncCutscene.integer == 0)
ADDRGP4 g_allowSyncCutscene+12
INDIRI4
CNSTI4 0
NEI4 $204
line 411
;411:			trap_Cvar_Set("g_synchronousClients", va("%1.0f", self->activator->skill ));
ADDRGP4 $208
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $207
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $204
line 412
;412:	}
LABELV $194
line 413
;413:}
LABELV $192
endproc Think_Camera 16 12
export SP_info_camera
proc SP_info_camera 4 12
line 415
;414:
;415:void SP_info_camera( gentity_t *self ) {	
line 416
;416:	G_SpawnFloat( "wait", "1", &self->wait );
ADDRGP4 $210
ARGP4
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 417
;417:	G_SpawnInt( "fov", "90", &self->count );	//abusing self->count here to store the FOV for the camera
ADDRGP4 $212
ARGP4
ADDRGP4 $213
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 419
;418:
;419:	self->use = Use_Camera;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Camera
ASGNP4
line 420
;420:	self->think = Think_Camera;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 Think_Camera
ASGNP4
line 421
;421:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 422
;422:}
LABELV $209
endproc SP_info_camera 4 12
export TeleportPlayerNoKnockback
proc TeleportPlayerNoKnockback 72 12
line 437
;423:
;424:
;425:
;426:/*
;427:=================================================================================
;428:
;429:TELEPORTERS
;430:
;431:=================================================================================
;432:*/
;433:
;434:/*=========
;435:Sets player's location without spitting out the player
;436:===========*/
;437:void TeleportPlayerNoKnockback( gentity_t *player, vec3_t origin, vec3_t angles, int angle ) {
line 445
;438:	gentity_t	*tent;
;439:	vec3_t orgAngles;
;440:	vec3_t changedvel;
;441:
;442:	// unlink to make sure it can't possibly interfere with G_KillBox
;443:	//trap_UnlinkEntity (player);
;444:
;445:	VectorCopy ( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 455
;446:	//player->client->ps.origin[2] += 1;
;447:
;448:	// spit the player out
;449:	//AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
;450:	//VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
;451:	//player->client->ps.pm_time = 160;		// hold time
;452:	//player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
;453:
;454:	// toggle the teleport bit so the client knows to not lerp
;455:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 457
;456:	
;457:	VectorCopy( player->client->ps.velocity, changedvel );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 459
;458:	
;459:	if(angle == 90){
ADDRFP4 12
INDIRI4
CNSTI4 90
NEI4 $215
line 460
;460:	changedvel[0] = player->client->ps.velocity[1];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
line 461
;461:	changedvel[1] = -player->client->ps.velocity[0];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ASGNF4
line 462
;462:	}
LABELV $215
line 463
;463:	if(angle == 180){
ADDRFP4 12
INDIRI4
CNSTI4 180
NEI4 $218
line 464
;464:	changedvel[0] = -player->client->ps.velocity[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ASGNF4
line 465
;465:	changedvel[1] = -player->client->ps.velocity[1];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ASGNF4
line 466
;466:	}
LABELV $218
line 467
;467:	if(angle == 270){
ADDRFP4 12
INDIRI4
CNSTI4 270
NEI4 $221
line 468
;468:	changedvel[0] = -player->client->ps.velocity[1];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ASGNF4
line 469
;469:	changedvel[1] = -player->client->ps.velocity[0];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ASGNF4
line 470
;470:	}
LABELV $221
line 472
;471:	
;472:	VectorCopy( changedvel, player->client->ps.velocity );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 474
;473:	
;474:	SetClientViewAngle( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 476
;475:
;476:	player->s.angles[0] = atof(va("%.4f", player->s.angles[0]));
ADDRGP4 $224
ARGP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 477
;477:	player->s.angles[1] = atof(va("%.4f", player->s.angles[1]));
ADDRGP4 $224
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 44
INDIRP4
ADDRLP4 52
INDIRF4
ASGNF4
line 478
;478:	player->s.angles[2] = atof(va("%.4f", player->s.angles[2]));
ADDRGP4 $224
ARGP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRF4
ASGNF4
line 486
;479:
;480:	// kill anything at the destination
;481:	/*if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
;482:		G_KillBox (player);
;483:	}*/
;484:
;485:	// save results of pmove
;486:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 494
;487:
;488:	// use the precise origin for linking
;489:	//VectorCopy( player->client->ps.origin, player->r.currentOrigin );
;490:
;491:	/*if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
;492:		trap_LinkEntity (player);
;493:	}*/
;494:}
LABELV $214
endproc TeleportPlayerNoKnockback 72 12
export TeleportPlayerForLayer
proc TeleportPlayerForLayer 16 12
line 496
;495:
;496:void TeleportPlayerForLayer( gentity_t *player, float level, float curlevel) {
line 499
;497:	float changed2;
;498:
;499:	changed2 = curlevel - level;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 501
;500:
;501:	player->client->ps.origin[2] += changed2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 502
;502:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 505
;503:
;504:	// save results of pmove
;505:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 506
;506:}
LABELV $225
endproc TeleportPlayerForLayer 16 12
export TeleportPlayer
proc TeleportPlayer 40 16
line 508
;507:
;508:void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
line 512
;509:	gentity_t	*tent;
;510:	qboolean noAngles;
;511:
;512:	noAngles = (angles[0] > 999999.0);
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1232348144
LEF4 $228
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $229
JUMPV
LABELV $228
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $229
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 515
;513:	// use temp events at source and destination to prevent the effect
;514:	// from getting dropped by a second player event
;515:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $230
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $230
line 516
;516:		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 517
;517:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 20
CNSTI4 180
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 519
;518:
;519:		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 24
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 520
;520:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 28
CNSTI4 180
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 521
;521:	}
LABELV $230
line 524
;522:
;523:	// unlink to make sure it can't possibly interfere with G_KillBox
;524:	trap_UnlinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 526
;525:
;526:	VectorCopy ( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 527
;527:	player->client->ps.origin[2] += 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 529
;528:
;529:	if (!noAngles) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $232
line 531
;530:		// spit the player out
;531:		AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 532
;532:		VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1137180672
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1137180672
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1137180672
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
ASGNF4
line 533
;533:		player->client->ps.pm_time = 160;		// hold time
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 534
;534:		player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 537
;535:
;536:		// set angles
;537:		SetClientViewAngle(player, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 538
;538:	}
LABELV $232
line 541
;539:
;540:	// toggle the teleport bit so the client knows to not lerp
;541:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 545
;542:
;543://unlagged - backward reconciliation #3
;544:	// we don't want players being backward-reconciled back through teleporters
;545:	G_ResetHistory( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 549
;546://unlagged - backward reconciliation #3
;547:
;548:	// kill anything at the destination
;549:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $234
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $234
line 550
;550:		G_KillBox (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 551
;551:	}
LABELV $234
line 554
;552:
;553:	// save results of pmove
;554:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 557
;555:
;556:	// use the precise origin for linking
;557:	VectorCopy( player->client->ps.origin, player->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 559
;558:
;559:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && player->client->ps.pm_type != PM_SPECTATOR ) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $236
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $236
line 560
;560:		trap_LinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 561
;561:	}
LABELV $236
line 562
;562:}
LABELV $226
endproc TeleportPlayer 40 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 8 4
line 570
;563:
;564:
;565:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;566:Point teleporters at these.
;567:Now that we don't have teleport destination pads, this is just
;568:an info_notnull
;569:*/
;570:void SP_misc_teleporter_dest( gentity_t *ent ) {
line 571
;571:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 572
;572:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 573
;573:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 574
;574:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 575
;575:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 576
;576:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 577
;577:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 580
;578:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;579:	
;580:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 581
;581:}
LABELV $238
endproc SP_misc_teleporter_dest 8 4
export SP_misc_model
proc SP_misc_model 0 4
line 589
;582:
;583:
;584://===========================================================
;585:
;586:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;587:"model"		arbitrary .md3 file to display
;588:*/
;589:void SP_misc_model( gentity_t *ent ) {
line 590
;590:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 591
;591:}
LABELV $239
endproc SP_misc_model 0 4
export locateCamera
proc locateCamera 52 8
line 595
;592:
;593://===========================================================
;594:
;595:void locateCamera( gentity_t *ent ) {
line 600
;596:	vec3_t		dir;
;597:	gentity_t	*target;
;598:	gentity_t	*owner;
;599:
;600:	owner = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 601
;601:	if ( !owner ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 602
;602:                G_Printf( "Couldn't find target for misc_portal_surface\n" );
ADDRGP4 $243
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 603
;603:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 604
;604:		return;
ADDRGP4 $240
JUMPV
LABELV $241
line 606
;605:	}
;606:	ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 609
;607:
;608:	// frame holds the rotate speed
;609:	if ( owner->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $244
line 610
;610:		ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 25
ASGNI4
line 611
;611:	} else if ( owner->spawnflags & 2 ) {
ADDRGP4 $245
JUMPV
LABELV $244
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $246
line 612
;612:		ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 75
ASGNI4
line 613
;613:	}
LABELV $246
LABELV $245
line 616
;614:
;615:	// swing camera ?
;616:	if ( owner->spawnflags & 4 ) {
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $248
line 618
;617:		// set to 0 for no rotation at all
;618:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 619
;619:	}
ADDRGP4 $249
JUMPV
LABELV $248
line 620
;620:	else {
line 621
;621:		ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 1
ASGNI4
line 622
;622:	}
LABELV $249
line 625
;623:
;624:	// clientNum holds the rotate offset
;625:	ent->s.clientNum = owner->s.clientNum;
ADDRLP4 24
CNSTI4 180
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 627
;626:
;627:	VectorCopy( owner->s.origin, ent->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 630
;628:
;629:	// see if the portal_camera has a target
;630:	target = G_PickTarget( owner->target );
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 631
;631:	if ( target ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
line 632
;632:		VectorSubtract( target->s.origin, owner->s.origin, dir );
ADDRLP4 36
CNSTI4 92
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 633
;633:		VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 634
;634:	} else {
ADDRGP4 $251
JUMPV
LABELV $250
line 635
;635:		G_SetMovedir( owner->s.angles, dir );
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 636
;636:	}
LABELV $251
line 638
;637:
;638:	ent->s.eventParm = DirToByte( dir );
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 639
;639:}
LABELV $240
endproc locateCamera 52 8
export SP_misc_portal_surface
proc SP_misc_portal_surface 20 4
line 645
;640:
;641:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;642:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;643:This must be within 64 world units of the surface!
;644:*/
;645:void SP_misc_portal_surface(gentity_t *ent) {
line 646
;646:	VectorClear( ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 647
;647:	VectorClear( ent->r.maxs );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 648
;648:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 650
;649:
;650:	ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 64
ASGNI4
line 651
;651:	ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 653
;652:
;653:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $255
line 654
;654:		VectorCopy( ent->s.origin, ent->s.origin2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 655
;655:	} else {
ADDRGP4 $256
JUMPV
LABELV $255
line 656
;656:		ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 657
;657:		ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 658
;658:	}
LABELV $256
line 659
;659:}
LABELV $254
endproc SP_misc_portal_surface 20 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 20 12
line 665
;660:
;661:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;662:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;663:"roll" an angle modifier to orient the camera around the target vector;
;664:*/
;665:void SP_misc_portal_camera(gentity_t *ent) {
line 668
;666:	float	roll;
;667:
;668:	VectorClear( ent->r.mins );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 669
;669:	VectorClear( ent->r.maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 670
;670:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 672
;671:
;672:	G_SpawnFloat( "roll", "0", &roll );
ADDRGP4 $259
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 674
;673:
;674:	ent->s.clientNum = roll/360.0 * 256;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 675
;675:}
LABELV $258
endproc SP_misc_portal_camera 20 12
export Use_Shooter
proc Use_Shooter 100 12
line 685
;676:
;677:/*
;678:======================================================================
;679:
;680:  SHOOTERS
;681:
;682:======================================================================
;683:*/
;684:
;685:void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 691
;686:	vec3_t		dir;
;687:	float		deg;
;688:	vec3_t		up, right;
;689:	gentity_t	*bolt;
;690:
;691:	if ( !ent->r.linked )
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $261
line 692
;692:		return;
ADDRGP4 $260
JUMPV
LABELV $261
line 695
;693:
;694:	// see if we have a target
;695:	if ( ent->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $263
line 696
;696:		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 964
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 52
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 697
;697:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 698
;698:	} else if ( ent->spawnflags & 1 ) {
ADDRGP4 $264
JUMPV
LABELV $263
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $267
line 700
;699:		
;700:		if ( !level.player || level.player->client->ps.pm_type == PM_CUTSCENE)
ADDRGP4 level+10284
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $273
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $269
LABELV $273
line 701
;701:			return;
ADDRGP4 $260
JUMPV
LABELV $269
line 703
;702:
;703:		VectorSubtract( level.player->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 level+10284
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+10284
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+10284
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 704
;704:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 705
;705:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 706
;706:		VectorCopy( ent->movedir, dir );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRB
ASGNB 12
line 707
;707:	}
LABELV $268
LABELV $264
line 710
;708:
;709:	// randomize a bit
;710:	PerpendicularVector( up, dir );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 711
;711:	CrossProduct( up, dir, right );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 713
;712:
;713:	deg = crandom() * ent->random;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
MULF4
ASGNF4
line 714
;714:	VectorMA( dir, deg, up, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 716
;715:
;716:	deg = crandom() * ent->random;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
MULF4
ASGNF4
line 717
;717:	VectorMA( dir, deg, right, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 719
;718:
;719:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 721
;720:
;721:	switch ( ent->s.weapon ) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $291
ADDRLP4 60
INDIRI4
CNSTI4 15
GTI4 $291
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $302-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $302
address $294
address $295
address $291
address $291
address $296
address $297
address $291
address $298
address $299
address $291
address $300
address $301
code
LABELV $294
line 723
;722:	case WP_GRENADE_LAUNCHER:
;723:		fire_grenade( ent, ent->s.origin, dir );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_grenade
CALLP4
pop
line 724
;724:		break;
ADDRGP4 $292
JUMPV
LABELV $295
line 726
;725:	case WP_ROCKET_LAUNCHER:
;726:		fire_rocket( ent, ent->s.origin, dir );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_rocket
CALLP4
pop
line 727
;727:		break;
ADDRGP4 $292
JUMPV
LABELV $296
line 729
;728:	case WP_PLASMAGUN:
;729:		fire_plasma( ent, ent->s.origin, dir );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_plasma
CALLP4
pop
line 730
;730:		break;
ADDRGP4 $292
JUMPV
LABELV $297
line 732
;731:	case WP_BFG:
;732:		fire_bfg( ent, ent->s.origin, dir );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_bfg
CALLP4
pop
line 733
;733:		break;
ADDRGP4 $292
JUMPV
LABELV $298
line 735
;734:	case WP_NAILGUN:
;735:		fire_custom( ent, ent->s.origin, dir );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_custom
CALLP4
pop
line 736
;736:		break;
ADDRGP4 $292
JUMPV
LABELV $299
line 738
;737:	case WP_PROX_LAUNCHER:
;738:		fire_prox( ent, ent->s.origin, dir );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_prox
CALLP4
pop
line 739
;739:		break;
ADDRGP4 $292
JUMPV
LABELV $300
line 741
;740:	case WP_FLAMETHROWER:
;741:		fire_flame( ent, ent->s.origin, dir );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_flame
CALLP4
pop
line 742
;742:		break;
ADDRGP4 $292
JUMPV
LABELV $301
line 744
;743:	case WP_ANTIMATTER:
;744:		fire_antimatter( ent, ent->s.origin, dir );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_antimatter
CALLP4
pop
line 745
;745:		break;
LABELV $291
LABELV $292
line 748
;746:	}
;747:
;748:	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 23
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 749
;749:}
LABELV $260
endproc Use_Shooter 100 12
proc InitShooter_Finish 8 4
line 752
;750:
;751:
;752:static void InitShooter_Finish( gentity_t *ent ) {
line 753
;753:	ent->enemy = G_PickTarget( ent->target );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 964
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 754
;754:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 755
;755:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 756
;756:}
LABELV $304
endproc InitShooter_Finish 8 4
export InitShooter
proc InitShooter 16 8
line 758
;757:
;758:void InitShooter( gentity_t *ent, int weapon ) {
line 759
;759:	ent->use = Use_Shooter;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Shooter
ASGNP4
line 760
;760:	ent->s.weapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 762
;761:
;762:	RegisterItem( BG_FindItemForWeapon( weapon ) );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 764
;763:
;764:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 766
;765:
;766:	if ( !ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
CNSTF4 0
NEF4 $306
line 767
;767:		ent->random = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
CNSTF4 1065353216
ASGNF4
line 768
;768:	}
LABELV $306
line 769
;769:	ent->random = sin( M_PI * ent->random / 180 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ASGNP4
CNSTF4 1078530011
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 771
;770:	// target might be a moving object, so we can't set movedir for it
;771:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $308
line 772
;772:		ent->think = InitShooter_Finish;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 InitShooter_Finish
ASGNP4
line 773
;773:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 774
;774:	}
LABELV $308
line 775
;775:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 776
;776:}
LABELV $305
endproc InitShooter 16 8
export SP_shooter_rocket
proc SP_shooter_rocket 0 8
line 782
;777:
;778:/*QUAKED shooter_rocket (1 0 0) (-16 -16 -16) (16 16 16)
;779:Fires at either the target or the current direction.
;780:"random" the number of degrees of deviance from the taget. (1.0 default)
;781:*/
;782:void SP_shooter_rocket( gentity_t *ent ) {
line 783
;783:	InitShooter( ent, WP_ROCKET_LAUNCHER );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 784
;784:}
LABELV $311
endproc SP_shooter_rocket 0 8
export SP_shooter_plasma
proc SP_shooter_plasma 0 8
line 790
;785:
;786:/*QUAKED shooter_plasma (1 0 0) (-16 -16 -16) (16 16 16)
;787:Fires at either the target or the current direction.
;788:"random" is the number of degrees of deviance from the taget. (1.0 default)
;789:*/
;790:void SP_shooter_plasma( gentity_t *ent ) {
line 791
;791:	InitShooter( ent, WP_PLASMAGUN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 792
;792:}
LABELV $312
endproc SP_shooter_plasma 0 8
export SP_shooter_grenade
proc SP_shooter_grenade 0 8
line 798
;793:
;794:/*QUAKED shooter_grenade (1 0 0) (-16 -16 -16) (16 16 16)
;795:Fires at either the target or the current direction.
;796:"random" is the number of degrees of deviance from the taget. (1.0 default)
;797:*/
;798:void SP_shooter_grenade( gentity_t *ent ) {
line 799
;799:	InitShooter( ent, WP_GRENADE_LAUNCHER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 800
;800:}
LABELV $313
endproc SP_shooter_grenade 0 8
export SP_shooter_bfg
proc SP_shooter_bfg 0 8
line 806
;801:
;802:/*QUAKED SP_shooter_bfg (1 0 0) (-16 -16 -16) (16 16 16)
;803:Fires at either the target or the current direction.
;804:"random" is the number of degrees of deviance from the taget. (1.0 default)
;805:*/
;806:void SP_shooter_bfg( gentity_t *ent ) {
line 807
;807:	InitShooter( ent, WP_BFG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 808
;808:}
LABELV $314
endproc SP_shooter_bfg 0 8
export SP_shooter_prox
proc SP_shooter_prox 0 8
line 814
;809:
;810:/*QUAKED SP_shooter_prox (1 0 0) (-16 -16 -16) (16 16 16)
;811:Fires at either the target or the current direction.
;812:"random" is the number of degrees of deviance from the taget. (1.0 default)
;813:*/
;814:void SP_shooter_prox( gentity_t *ent ) {
line 815
;815:	InitShooter( ent, WP_PROX_LAUNCHER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 816
;816:}
LABELV $315
endproc SP_shooter_prox 0 8
export SP_shooter_flame
proc SP_shooter_flame 0 8
line 822
;817:
;818:/*QUAKED SP_shooter_flame (1 0 0) (-16 -16 -16) (16 16 16)
;819:Fires at either the target or the current direction.
;820:"random" is the number of degrees of deviance from the taget. (1.0 default)
;821:*/
;822:void SP_shooter_flame( gentity_t *ent ) {
line 823
;823:	InitShooter( ent, WP_FLAMETHROWER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 824
;824:}
LABELV $316
endproc SP_shooter_flame 0 8
export SP_shooter_antimatter
proc SP_shooter_antimatter 0 8
line 830
;825:
;826:/*QUAKED SP_shooter_antimatter (1 0 0) (-16 -16 -16) (16 16 16)
;827:Fires at either the target or the current direction.
;828:"random" is the number of degrees of deviance from the taget. (1.0 default)
;829:*/
;830:void SP_shooter_antimatter( gentity_t *ent ) {
line 831
;831:	InitShooter( ent, WP_ANTIMATTER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 15
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 832
;832:}
LABELV $317
endproc SP_shooter_antimatter 0 8
export SP_shooter_custom
proc SP_shooter_custom 0 8
line 838
;833:
;834:/*QUAKED SP_shooter_custom (1 0 0) (-16 -16 -16) (16 16 16)
;835:Fires at either the target or the current direction.
;836:"random" is the number of degrees of deviance from the taget. (1.0 default)
;837:*/
;838:void SP_shooter_custom( gentity_t *ent ) {
line 839
;839:	InitShooter( ent, WP_NAILGUN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 840
;840:}
LABELV $318
endproc SP_shooter_custom 0 8
proc PortalDie 0 4
line 842
;841:
;842:static void PortalDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod) {
line 843
;843:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 845
;844:	//FIXME do something more interesting
;845:}
LABELV $319
endproc PortalDie 0 4
proc BlockDie 4 4
line 847
;846:
;847:static void BlockDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod) {
line 848
;848:	if(self->vehicle || self->objectType == OT_TNT){ //VEHICLE-SYSTEM: vehicle's explode for all
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
ADDRLP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 2
NEI4 $321
LABELV $323
line 849
;849:	G_StartCarExplode(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StartCarExplode
CALLV
pop
line 850
;850:	}
LABELV $321
line 851
;851:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 852
;852:}
LABELV $320
endproc BlockDie 4 4
export DropPortalDestination
proc DropPortalDestination 44 8
line 855
;853:
;854:
;855:void DropPortalDestination( gentity_t *player ) {
line 860
;856:	gentity_t	*ent;
;857:	vec3_t		snapped;
;858:
;859:	// create the portal destination
;860:	ent = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 861
;861:	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_exit.md3" );
ADDRGP4 $325
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 863
;862:
;863:	VectorCopy( player->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 864
;864:	SnapVector( snapped );
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 865
;865:	G_SetOrigin( ent, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 866
;866:	VectorCopy( player->r.mins, ent->r.mins );
ADDRLP4 24
CNSTI4 476
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 867
;867:	VectorCopy( player->r.maxs, ent->r.maxs );
ADDRLP4 28
CNSTI4 488
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 869
;868:
;869:	ent->classname = "hi_portal destination";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $330
ASGNP4
line 870
;870:	ent->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 872
;871:
;872:	ent->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 67108864
ASGNI4
line 873
;873:	ent->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 874
;874:	ent->health = g_portalhealth.integer;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRGP4 g_portalhealth+12
INDIRI4
ASGNI4
line 875
;875:	ent->die = PortalDie;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 PortalDie
ASGNP4
line 877
;876:
;877:	VectorCopy( player->s.apos.trBase, ent->s.angles );
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 879
;878:
;879:	ent->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 880
;880:	ent->nextthink = level.time + g_portaltimeout.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_portaltimeout+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 882
;881:
;882:	trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 884
;883:
;884:	player->client->portalID = ++level.portalSequence;
ADDRLP4 32
ADDRGP4 level+9996
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 885
;885:	ent->count = player->client->portalID;
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
ASGNI4
line 888
;886:
;887:	// give the item back so they can drop the source now
;888:	player->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_PORTAL);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 889
;889:}
LABELV $324
endproc DropPortalDestination 44 8
proc PortalTouch 24 32
line 892
;890:
;891:
;892:static void PortalTouch( gentity_t *self, gentity_t *other, trace_t *trace) {
line 896
;893:	gentity_t	*destination;
;894:
;895:	// see if we will even let other try to use it
;896:	if( other->health <= 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $336
line 897
;897:		return;
ADDRGP4 $335
JUMPV
LABELV $336
line 899
;898:	}
;899:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $338
line 900
;900:		return;
ADDRGP4 $335
JUMPV
LABELV $338
line 902
;901:	}
;902:	if ( other->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $340
line 903
;903:		Drop_Item( other, BG_FindItemForPowerup( PW_NEUTRALFLAG ), 0 );
CNSTI4 9
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 904
;904:		other->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 905
;905:	}
ADDRGP4 $341
JUMPV
LABELV $340
line 906
;906:	else if ( other->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $342
line 907
;907:		Drop_Item( other, BG_FindItemForPowerup( PW_REDFLAG ), 0 );
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 908
;908:		other->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 909
;909:	}
ADDRGP4 $343
JUMPV
LABELV $342
line 910
;910:	else if ( other->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $344
line 911
;911:		Drop_Item( other, BG_FindItemForPowerup( PW_BLUEFLAG ), 0 );
CNSTI4 8
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 912
;912:		other->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 913
;913:	}
LABELV $344
LABELV $343
LABELV $341
line 916
;914:
;915:	// find the destination
;916:	destination = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $347
JUMPV
LABELV $346
line 917
;917:	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
line 918
;918:		if( destination->count == self->count ) {
ADDRLP4 4
CNSTI4 944
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
NEI4 $349
line 919
;919:			break;
ADDRGP4 $348
JUMPV
LABELV $349
line 921
;920:		}
;921:	}
LABELV $347
line 917
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $330
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $346
LABELV $348
line 924
;922:
;923:	// if there is not one, die!
;924:	if( !destination ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
line 925
;925:		if( self->pos1[0] || self->pos1[1] || self->pos1[2] ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 656
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $356
ADDRLP4 8
INDIRP4
CNSTI4 660
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $356
ADDRLP4 8
INDIRP4
CNSTI4 664
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
EQF4 $353
LABELV $356
line 926
;926:			TeleportPlayer( other, self->pos1, self->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 656
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 927
;927:		}
LABELV $353
line 928
;928:		G_Damage( other, other, other, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 929
;929:		return;
ADDRGP4 $335
JUMPV
LABELV $351
line 932
;930:	}
;931:
;932:	TeleportPlayer( other, destination->s.pos.trBase, destination->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 933
;933:}
LABELV $335
endproc PortalTouch 24 32
proc PortalEnable 0 0
line 935
;934:
;935:static void PortalEnable( gentity_t *self ) {
line 936
;936:	self->touch = PortalTouch;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 PortalTouch
ASGNP4
line 937
;937:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 938
;938:	self->nextthink = level.time + g_portaltimeout.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_portaltimeout+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 939
;939:}
LABELV $357
endproc PortalEnable 0 0
proc ShowSandObject 0 4
line 941
;940:
;941:static void ShowSandObject( gentity_t *self ) {
line 942
;942:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 943
;943:}
LABELV $360
endproc ShowSandObject 0 4
export DropPortalSource
proc DropPortalSource 40 12
line 945
;944:
;945:void DropPortalSource( gentity_t *player ) {
line 951
;946:	gentity_t	*ent;
;947:	gentity_t	*destination;
;948:	vec3_t		snapped;
;949:
;950:	// create the portal source
;951:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 952
;952:	ent->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_enter.md3" );
ADDRGP4 $362
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 954
;953:
;954:	VectorCopy( player->s.pos.trBase, snapped );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 955
;955:	SnapVector( snapped );
ADDRLP4 8
ADDRLP4 8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 956
;956:	G_SetOrigin( ent, snapped );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 957
;957:	VectorCopy( player->r.mins, ent->r.mins );
ADDRLP4 28
CNSTI4 476
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 958
;958:	VectorCopy( player->r.maxs, ent->r.maxs );
ADDRLP4 32
CNSTI4 488
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 960
;959:
;960:	ent->classname = "hi_portal source";
ADDRLP4 4
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $367
ASGNP4
line 961
;961:	ent->s.pos.trType = TR_STATIONARY;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 963
;962:
;963:	ent->r.contents = CONTENTS_CORPSE | CONTENTS_TRIGGER;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1140850688
ASGNI4
line 964
;964:	ent->takedamage = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 965
;965:	ent->health = g_portalhealth.integer;
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRGP4 g_portalhealth+12
INDIRI4
ASGNI4
line 966
;966:	ent->die = PortalDie;
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 PortalDie
ASGNP4
line 968
;967:
;968:	trap_LinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 970
;969:
;970:	ent->count = player->client->portalID;
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
ASGNI4
line 971
;971:	player->client->portalID = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
CNSTI4 0
ASGNI4
line 975
;972:
;973://	ent->spawnflags = player->client->ps.persistant[PERS_TEAM];
;974:
;975:	ent->nextthink = level.time + 1000;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 976
;976:	ent->think = PortalEnable;
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 PortalEnable
ASGNP4
line 979
;977:
;978:	// find the destination
;979:	destination = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $371
JUMPV
LABELV $370
line 980
;980:	while( (destination = G_Find(destination, FOFS(classname), "hi_portal destination")) != NULL ) {
line 981
;981:		if( destination->count == ent->count ) {
ADDRLP4 36
CNSTI4 944
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
NEI4 $373
line 982
;982:			VectorCopy( destination->s.pos.trBase, ent->pos1 );
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 983
;983:			break;
ADDRGP4 $372
JUMPV
LABELV $373
line 985
;984:		}
;985:	}
LABELV $371
line 980
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $330
ARGP4
ADDRLP4 36
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $370
LABELV $372
line 987
;986:
;987:}
LABELV $361
endproc DropPortalSource 40 12
export G_ClearStringMisc
proc G_ClearStringMisc 8 4
line 990
;988:
;989:
;990:char *G_ClearStringMisc( char *input ){
line 991
;991:	if( input[0] == '"' ){
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 34
NEI4 $376
line 992
;992:		input[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 993
;993:		input++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 994
;994:	}
LABELV $376
line 995
;995:	if( input[strlen(input)-1] == '"' ){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 34
NEI4 $378
line 996
;996:		input[strlen(input)-1] = '\0';
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 997
;997:	}
LABELV $378
line 998
;998:	return input;
ADDRFP4 0
INDIRP4
RETP4
LABELV $375
endproc G_ClearStringMisc 8 4
export G_TouchProp
proc G_TouchProp 20 4
line 1007
;999:}
;1000:
;1001:/*
;1002:================
;1003:G_TouchProp
;1004:
;1005:================
;1006:*/
;1007:void G_TouchProp( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 1008
;1008:	if( other->health <= 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $381
line 1009
;1009:		return;
ADDRGP4 $380
JUMPV
LABELV $381
line 1011
;1010:	}
;1011:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $383
line 1012
;1012:		return;
ADDRGP4 $380
JUMPV
LABELV $383
line 1014
;1013:	}
;1014:	if( !other->singlebot ) {
ADDRFP4 4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $385
line 1015
;1015:		return;
ADDRGP4 $380
JUMPV
LABELV $385
line 1017
;1016:	}
;1017:	if( other->client->vehiclenum ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $387
line 1018
;1018:		return;
ADDRGP4 $380
JUMPV
LABELV $387
line 1020
;1019:	}
;1020:	if(	self->vehicle <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
GTI4 $389
line 1021
;1021:		return;
ADDRGP4 $380
JUMPV
LABELV $389
line 1023
;1022:	}
;1023:	if( self->parent && self->parent->client->vehiclenum ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $391
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 1024
;1024:		return;
ADDRGP4 $380
JUMPV
LABELV $391
line 1026
;1025:	}
;1026:	other->client->vehiclenum = self->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1027
;1027:	self->parent = other;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1028
;1028:	ClientUserinfoChanged( other->s.clientNum );
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1029
;1029:	VectorCopy(self->s.origin, other->s.origin);
ADDRLP4 4
CNSTI4 92
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 1030
;1030:	VectorCopy(self->s.pos.trBase, other->s.pos.trBase);
ADDRLP4 8
CNSTI4 24
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 1031
;1031:	other->s.apos.trBase[1] = self->s.apos.trBase[1];
ADDRLP4 12
CNSTI4 64
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1032
;1032:	VectorCopy(self->r.currentOrigin, other->r.currentOrigin);
ADDRLP4 16
CNSTI4 528
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 1033
;1033:	VectorSet( other->r.mins, -25, -25, -15 );
ADDRFP4 4
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3245342720
ASGNF4
line 1034
;1034:	VectorSet( other->r.maxs, 25, 25, 15 );
ADDRFP4 4
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1103626240
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1103626240
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1097859072
ASGNF4
line 1035
;1035:	self->think = VehiclePhys;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 VehiclePhys
ASGNP4
line 1036
;1036:	self->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1037
;1037:}
LABELV $380
endproc G_TouchProp 20 4
export SP_func_prop
proc SP_func_prop 100 8
line 1046
;1038:
;1039:/*QUAKED func_prop (0 .5 .8) ?
;1040:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;1041:"model2"	.md3 model to also draw
;1042:"color"		constantLight color
;1043:"light"		constantLight radius
;1044:*/
;1045:
;1046:void SP_func_prop( gentity_t *ent ) {
line 1050
;1047:	spawn_t	*s;
;1048:	gitem_t	*item;
;1049:	
;1050:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1051
;1051:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1052
;1052:	ent->sandboxObject = 1;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
LABELV $395
line 1053
;1053:	CopyAlloc(ent->classname, ent->sb_class);
CNSTU4 4
ARGU4
ADDRLP4 16
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $398
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 872
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $398
LABELV $396
line 1055
;1054:	// check normal spawn functions
;1055:	for ( s=sandspawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 sandspawns
ASGNP4
ADDRGP4 $403
JUMPV
LABELV $400
line 1056
;1056:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $404
LABELV $406
line 1058
;1057:			// found it
;1058:			CopyAlloc(ent->sb_class, ent->classname);
CNSTU4 4
ARGU4
ADDRLP4 20
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 872
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 872
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 872
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $409
LABELV $407
line 1059
;1059:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 1061
;1060:			//spawn another class
;1061:			ent->s.modelindex = G_ModelIndex( va("props/%s",ent->sb_model) );	//модель
ADDRGP4 $411
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1062
;1062:			ent->s.constantLight = ent->sb_red | ( ent->sb_green << 8 ) | ( ent->sb_blue << 16 ) | ( ent->sb_radius << 24 );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 32
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 32
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1063
;1063:			ent->s.loopSound = G_SoundIndex(ent->sb_sound);	//звук
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 880
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1064
;1064:			ent->s.scales[0] = ent->sb_colscale0;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
ASGNF4
line 1065
;1065:			ent->s.scales[1] = ent->sb_colscale1;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
ASGNF4
line 1066
;1066:			ent->s.scales[2] = ent->sb_colscale2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
ASGNF4
line 1067
;1067:			ent->s.apos.trBase[0] = ent->sb_rotate0;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 860
ADDP4
INDIRF4
ASGNF4
line 1068
;1068:			ent->s.apos.trBase[1] = ent->sb_rotate1;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 864
ADDP4
INDIRF4
ASGNF4
line 1069
;1069:			ent->s.apos.trBase[2] = ent->sb_rotate2;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 868
ADDP4
INDIRF4
ASGNF4
line 1070
;1070:			VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 68
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 72
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 76
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1071
;1071:			VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 80
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 84
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 88
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1072
;1072:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1073
;1073:			if(ent->sb_takedamage == 0){
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
CNSTI4 0
NEI4 $413
line 1074
;1074:				ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 1075
;1075:			}
LABELV $413
line 1076
;1076:			if(ent->sb_takedamage == 1){
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
CNSTI4 1
NEI4 $415
line 1077
;1077:				ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 1078
;1078:			}
LABELV $415
line 1079
;1079:			if(ent->sb_takedamage2 == 0){
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 0
NEI4 $417
line 1080
;1080:				ent->takedamage2 = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
CNSTI4 0
ASGNI4
line 1081
;1081:			}
LABELV $417
line 1082
;1082:			if(ent->sb_takedamage2 == 1){
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 1
NEI4 $419
line 1083
;1083:				ent->takedamage2 = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
CNSTI4 1
ASGNI4
line 1084
;1084:			}
LABELV $419
line 1085
;1085:			if(ent->sb_phys == 1){ ent->s.pos.trType = TR_STATIONARY; ent->physicsObject = qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 1
NEI4 $421
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
LABELV $421
line 1086
;1086:			if(ent->sb_phys == 2){ ent->s.pos.trType = TR_GRAVITY; ent->s.pos.trTime = level.time; ent->physicsObject = qtrue; }
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 2
NEI4 $423
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
LABELV $423
line 1087
;1087:			if(ent->sb_coll == 0){
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 0
NEI4 $426
line 1088
;1088:			ent->r.contents = CONTENTS_SOLID | CONTENTS_BODY;	
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 33554433
ASGNI4
line 1089
;1089:			}
LABELV $426
line 1090
;1090:			if(ent->sb_coll == 1){
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 1
NEI4 $428
line 1091
;1091:			ent->r.contents = CONTENTS_TRIGGER;	
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1092
;1092:			}
LABELV $428
line 1093
;1093:			ent->s.generic2 = ent->sb_generic1;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
ASGNI4
line 1094
;1094:			ent->classname = "func_prop";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $82
ASGNP4
line 1095
;1095:			ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1096
;1096:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1097
;1097:			return;
ADDRGP4 $394
JUMPV
LABELV $404
line 1099
;1098:		}
;1099:	}
LABELV $401
line 1055
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $403
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $400
line 1100
;1100:	ent->classname = "func_prop";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $82
ASGNP4
line 1101
;1101:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1102
;1102:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1103
;1103:	ent->s.modelindex = G_ModelIndex( va("props/%s",ent->sb_model) );
ADDRGP4 $411
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1104
;1104:	ent->s.constantLight = ent->sb_red | ( ent->sb_green << 8 ) | ( ent->sb_blue << 16 ) | ( ent->sb_radius << 24 );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 28
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 28
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1105
;1105:	ent->s.loopSound = G_SoundIndex(ent->sb_sound);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 880
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1106
;1106:	ent->die = BlockDie;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 BlockDie
ASGNP4
line 1107
;1107:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 1108
;1108:	if(ent->sb_takedamage == 0){
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
CNSTI4 0
NEI4 $430
line 1109
;1109:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 1110
;1110:	}
LABELV $430
line 1111
;1111:	if(ent->sb_takedamage == 1){
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
CNSTI4 1
NEI4 $432
line 1112
;1112:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 1113
;1113:	}
LABELV $432
line 1114
;1114:	if(ent->sb_takedamage2 == 0){
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 0
NEI4 $434
line 1115
;1115:		ent->takedamage2 = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
CNSTI4 0
ASGNI4
line 1116
;1116:	}
LABELV $434
line 1117
;1117:	if(ent->sb_takedamage2 == 1){
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 1
NEI4 $436
line 1118
;1118:		ent->takedamage2 = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
CNSTI4 1
ASGNI4
line 1119
;1119:	}
LABELV $436
line 1120
;1120:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1121
;1121:	if(ent->sb_phys == 1){ ent->s.pos.trType = TR_STATIONARY; ent->physicsObject = qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 1
NEI4 $439
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
LABELV $439
line 1122
;1122:	if(ent->sb_phys == 2){ ent->s.pos.trType = TR_GRAVITY; ent->s.pos.trTime = level.time; ent->physicsObject = qtrue; }
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 2
NEI4 $441
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
LABELV $441
line 1123
;1123:	if(ent->sb_coll == 0){
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 0
NEI4 $444
line 1124
;1124:	ent->r.contents = CONTENTS_SOLID;	
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1125
;1125:	}
LABELV $444
line 1126
;1126:	if(ent->sb_coll == 1){
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 1
NEI4 $446
line 1127
;1127:	ent->r.contents = CONTENTS_TRIGGER;	
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1128
;1128:	}
LABELV $446
line 1129
;1129:	ent->s.generic2 = ent->sb_generic1;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
ASGNI4
line 1130
;1130:	ent->s.scales[0] = ent->sb_colscale0;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
ASGNF4
line 1131
;1131:	ent->s.scales[1] = ent->sb_colscale1;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
ASGNF4
line 1132
;1132:	ent->s.scales[2] = ent->sb_colscale2;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
ASGNF4
line 1133
;1133:	ent->s.apos.trBase[0] = ent->sb_rotate0;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 860
ADDP4
INDIRF4
ASGNF4
line 1134
;1134:	ent->s.apos.trBase[1] = ent->sb_rotate1;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 864
ADDP4
INDIRF4
ASGNF4
line 1135
;1135:	ent->s.apos.trBase[2] = ent->sb_rotate2;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 868
ADDP4
INDIRF4
ASGNF4
line 1136
;1136:	if(ent->vehicle <= 0){
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
GTI4 $448
line 1137
;1137:	VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 68
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 72
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 76
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1138
;1138:	VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 80
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 84
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 88
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1139
;1139:	} else {
ADDRGP4 $449
JUMPV
LABELV $448
line 1140
;1140:	VectorSet( ent->r.mins, -25, -25, -15);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3245342720
ASGNF4
line 1141
;1141:	VectorSet( ent->r.maxs, 25, 25, 15 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1103626240
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1103626240
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1097859072
ASGNF4
line 1142
;1142:	}
LABELV $449
line 1143
;1143:	ent->touch = G_TouchProp;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 G_TouchProp
ASGNP4
line 1144
;1144:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1145
;1145:}
LABELV $394
endproc SP_func_prop 100 8
export G_BuildPropSL
proc G_BuildPropSL 432 8
line 1147
;1146:
;1147:void G_BuildPropSL( char *arg02, char *arg03, vec3_t xyz, gentity_t *player, char *arg04, char *arg05, char *arg06, char *arg07, char *arg08, char *arg09, char *arg10, char *arg11, char *arg12, char *arg13, char *arg14, char *arg15, char *arg16, char *arg17, char *arg18, char *arg19, char *arg20, char *arg21, char *arg22, char *arg23, char *arg24, char *arg25, char *arg26, char *arg27, char *arg28, char *arg29, char *arg30, char *arg31, char *arg32, char *arg33, char *arg34, char *arg35, char *arg36, char *arg37, char *arg38, char *arg39, char *arg40, char *arg41, char *arg42, char *arg43, char *arg44, char *arg45, char *arg46, char *arg47, char *arg48, char *arg49, char *arg50, char *arg51, char *arg52, char *arg53, char *arg54, char *arg55, char *arg56, char *arg57, char *arg58, char *arg59, char *arg60, char *arg61 ) {
line 1154
;1148:	gentity_t	*ent;
;1149:	vec3_t		snapped;
;1150:	vec3_t		o;
;1151:	spawn_t	*s;
;1152:	gitem_t	*item;
;1153:	
;1154:	o[0] = ((int)((xyz[0] + (xyz[0] < 0 ? -atoi(arg06) : atoi(arg06))) / (atoi(arg06) * 2)) * (atoi(arg06) * 2));
ADDRLP4 40
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
GEF4 $452
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 44
INDIRI4
NEGI4
ASGNI4
ADDRGP4 $453
JUMPV
LABELV $452
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ASGNI4
LABELV $453
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
DIVF4
CVFI4 4
ADDRLP4 56
INDIRI4
CNSTI4 1
LSHI4
MULI4
CVIF4 4
ASGNF4
line 1155
;1155:	o[1] = ((int)((xyz[1] + (xyz[1] < 0 ? -atoi(arg06) : atoi(arg06))) / (atoi(arg06) * 2)) * (atoi(arg06) * 2));
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
GEF4 $456
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 68
INDIRI4
NEGI4
ASGNI4
ADDRGP4 $457
JUMPV
LABELV $456
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $457
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24+4
ADDRLP4 64
INDIRF4
ADDRLP4 60
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 76
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
DIVF4
CVFI4 4
ADDRLP4 80
INDIRI4
CNSTI4 1
LSHI4
MULI4
CVIF4 4
ASGNF4
line 1157
;1156://	if(atoi(arg09) <= 0){
;1157:	o[2] = ((int)((xyz[2] + (xyz[2] < 0 ? -atoi(arg06) : atoi(arg06))) / (atoi(arg06) * 2)) * (atoi(arg06) * 2));
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 88
INDIRF4
CNSTF4 0
GEF4 $460
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 92
INDIRI4
NEGI4
ASGNI4
ADDRGP4 $461
JUMPV
LABELV $460
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 96
INDIRI4
ASGNI4
LABELV $461
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24+8
ADDRLP4 88
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 100
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
DIVF4
CVFI4 4
ADDRLP4 104
INDIRI4
CNSTI4 1
LSHI4
MULI4
CVIF4 4
ASGNF4
line 1162
;1158://	} else {
;1159://	o[2] = xyz[2] + atoi(arg05);
;1160://	}
;1161:
;1162:	if (trap_Cvar_VariableIntegerValue("cl_android")) {
ADDRGP4 $464
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $462
line 1163
;1163:    o[0] -= (xyz[0] >= 0 ? (atoi(arg06)) : -(atoi(arg06)));
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 0
LTF4 $466
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 116
INDIRI4
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $466
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 120
INDIRI4
NEGI4
ASGNI4
LABELV $467
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 112
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1164
;1164:    o[1] -= (xyz[1] >= 0 ? (atoi(arg06)) : -(atoi(arg06)));
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LTF4 $470
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $470
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 132
INDIRI4
NEGI4
ASGNI4
LABELV $471
ADDRLP4 24+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 124
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1166
;1165://	if(atoi(arg09) <= 0){
;1166:    o[2] -= (xyz[2] >= 0 ? (atoi(arg06)) : -(atoi(arg06)));
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
LTF4 $474
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 140
INDIRI4
ASGNI4
ADDRGP4 $475
JUMPV
LABELV $474
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 144
INDIRI4
NEGI4
ASGNI4
LABELV $475
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 136
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1170
;1167://	} else {
;1168://	o[2] = xyz[2] + atoi(arg05);
;1169://	}
;1170:	}
LABELV $462
line 1172
;1171:
;1172:	VectorCopy (o, snapped);
ADDRLP4 12
ADDRLP4 24
INDIRB
ASGNB 12
line 1175
;1173:	
;1174:	// create new entity
;1175:	ent = G_Spawn();
ADDRLP4 112
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
ASGNP4
line 1176
;1176:	ent->spawnflags = atoi(arg07);
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 116
INDIRI4
ASGNI4
line 1177
;1177:	ent->sandboxObject = 1;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 1178
;1178:	ent->objectType = OT_BASIC;
ADDRLP4 0
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 1179
;1179:	ent->sb_takedamage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 1180
;1180:	ent->sb_takedamage2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 1
ASGNI4
line 1181
;1181:	if(atoi(arg12) == -1){
ADDRFP4 48
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 -1
NEI4 $476
line 1182
;1182:		ent->sb_takedamage2 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 0
ASGNI4
line 1183
;1183:	}
LABELV $476
LABELV $478
line 1184
;1184:	CopyAlloc(ent->classname, arg03);
CNSTU4 4
ARGU4
ADDRLP4 124
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 124
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $481
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $481
LABELV $479
line 1188
;1185:
;1186:
;1187:	//spawn item or func
;1188:	VectorCopy( snapped, ent->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 1189
;1189:	VectorCopy( snapped, ent->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 1190
;1190:	VectorCopy( snapped, ent->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 1191
;1191:	if(atoi(arg04) == 1){
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
NEI4 $483
line 1192
;1192:	ent->owner = player->s.clientNum + 1;
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1193
;1193:	ent->ownername = player->client->pers.netname;
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRFP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
line 1194
;1194:	}
LABELV $483
line 1196
;1195:	
;1196:	ent->s.generic2 = atoi(arg08);
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 1197
;1197:	ent->sb_generic1 = atoi(arg08);
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 884
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 1199
;1198:	
;1199:	if(atoi(arg09) == 0){
ADDRFP4 36
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $485
line 1200
;1200:	ent->s.pos.trType = TR_STATIONARY; ent->physicsObject = qfalse; ent->sb_phys = 1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 1
ASGNI4
line 1201
;1201:	}
LABELV $485
line 1202
;1202:	if(atoi(arg09) == 1){
ADDRFP4 36
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 1
NEI4 $487
line 1203
;1203:	ent->s.pos.trType = TR_GRAVITY; ent->s.pos.trTime = level.time; ent->physicsObject = qtrue; ent->physicsBounce = atof(arg61); ent->sb_phys = 2;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 244
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRLP4 144
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 2
ASGNI4
line 1204
;1204:	}
LABELV $487
line 1206
;1205:
;1206:	if(atoi(arg10) == 0){
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $490
line 1207
;1207:	ent->r.contents = CONTENTS_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1208
;1208:	ent->sb_coll = 0;
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1209:	}
LABELV $490
line 1210
;1210:	if(atoi(arg10) == 1){
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 1
NEI4 $492
line 1211
;1211:	ent->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1212
;1212:	ent->sb_coll = 1;
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 1
ASGNI4
line 1213
;1213:	}
LABELV $492
line 1214
;1214:	ent->s.loopSound = G_SoundIndex(arg11);
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
LABELV $494
line 1215
;1215:	CopyAlloc(ent->sb_sound, arg11);
CNSTU4 4
ARGU4
ADDRLP4 156
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
ADDRLP4 156
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $497
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
INDIRP4
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $497
LABELV $495
line 1217
;1216:	
;1217:	ent->health = atoi(arg12);
ADDRFP4 48
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 1219
;1218:	
;1219:	ent->s.constantLight = atoi(arg13) | ( atoi(arg14) << 8 ) | ( atoi(arg15) << 16 ) | ( atoi(arg16) << 24 );
ADDRFP4 52
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 56
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 60
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 64
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 160
INDIRI4
ADDRLP4 164
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 168
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 172
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1220
;1220:	ent->sb_red = atoi(arg13);
ADDRFP4 52
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 900
ADDP4
ADDRLP4 176
INDIRI4
ASGNI4
line 1221
;1221:	ent->sb_green = atoi(arg14);
ADDRFP4 56
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
ADDRLP4 180
INDIRI4
ASGNI4
line 1222
;1222:	ent->sb_blue = atoi(arg15);
ADDRFP4 60
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRLP4 184
INDIRI4
ASGNI4
line 1223
;1223:	ent->sb_radius = atoi(arg16);
ADDRFP4 64
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRLP4 188
INDIRI4
ASGNI4
line 1225
;1224:
;1225:	ent->s.scales[0] = atof(arg17);
ADDRFP4 68
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 192
INDIRF4
ASGNF4
line 1226
;1226:	ent->sb_colscale0 = atof(arg17);
ADDRFP4 68
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 196
INDIRF4
ASGNF4
line 1227
;1227:	ent->s.scales[1] = atof(arg18);
ADDRFP4 72
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 200
INDIRF4
ASGNF4
line 1228
;1228:	ent->sb_colscale1 = atof(arg18);
ADDRFP4 72
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 204
INDIRF4
ASGNF4
line 1229
;1229:	ent->s.scales[2] = atof(arg19);
ADDRFP4 76
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 208
INDIRF4
ASGNF4
line 1230
;1230:	ent->sb_colscale2 = atof(arg19);
ADDRFP4 76
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
ADDRLP4 212
INDIRF4
ASGNF4
line 1232
;1231:	
;1232:	if ( strcmp(arg20, "0") ) {
ADDRFP4 80
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 216
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $499
LABELV $501
line 1233
;1233:	CopyAlloc(ent->target, arg20);
CNSTU4 4
ARGU4
ADDRLP4 220
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 220
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $504
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRFP4 80
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $504
LABELV $502
line 1234
;1234:	}
LABELV $499
line 1235
;1235:	if ( strcmp(arg21, "0") ) {
ADDRFP4 84
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 220
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $506
LABELV $508
line 1236
;1236:	CopyAlloc(ent->targetname, arg21);
CNSTU4 4
ARGU4
ADDRLP4 224
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 224
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $511
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
ARGP4
ADDRFP4 84
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $511
LABELV $509
line 1237
;1237:	}
LABELV $506
line 1239
;1238:	
;1239:	ent->mtype = atoi(arg22);
ADDRFP4 88
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2248
ADDP4
ADDRLP4 224
INDIRI4
ASGNI4
line 1240
;1240:	ent->mtimeout = atoi(arg23);
ADDRFP4 92
INDIRP4
ARGP4
ADDRLP4 228
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRLP4 228
INDIRI4
ASGNI4
line 1241
;1241:	ent->mhoming = atoi(arg24);
ADDRFP4 96
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2256
ADDP4
ADDRLP4 232
INDIRI4
ASGNI4
line 1242
;1242:	ent->mbounce = atoi(arg25);
ADDRFP4 100
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2264
ADDP4
ADDRLP4 236
INDIRI4
ASGNI4
line 1243
;1243:	ent->mdamage = atoi(arg26);
ADDRFP4 104
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2268
ADDP4
ADDRLP4 240
INDIRI4
ASGNI4
line 1244
;1244:	ent->msdamage = atoi(arg27);
ADDRFP4 108
INDIRP4
ARGP4
ADDRLP4 244
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2272
ADDP4
ADDRLP4 244
INDIRI4
ASGNI4
line 1245
;1245:	ent->msradius = atoi(arg28);
ADDRFP4 112
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 1246
;1246:	ent->mgravity = atoi(arg29);
ADDRFP4 116
INDIRP4
ARGP4
ADDRLP4 252
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
ADDRLP4 252
INDIRI4
ASGNI4
line 1247
;1247:	ent->mnoclip = atoi(arg30);
ADDRFP4 120
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1248
;1248:	ent->mspeed = atoi(arg31);
ADDRFP4 124
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRLP4 260
INDIRI4
ASGNI4
line 1250
;1249:	
;1250:	ent->allowuse = atoi(arg32);
ADDRFP4 128
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 1251
;1251:	if ( strcmp(arg33, "0") ) {
ADDRFP4 132
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $513
line 1252
;1252:	ent->speed = atoi(arg33);
ADDRFP4 132
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 272
INDIRI4
CVIF4 4
ASGNF4
line 1253
;1253:	}
LABELV $513
line 1254
;1254:	if ( strcmp(arg34, "0") ) {
ADDRFP4 136
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $515
LABELV $517
line 1255
;1255:	CopyAlloc(ent->message, arg34);
CNSTU4 4
ARGU4
ADDRLP4 276
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 276
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $520
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRFP4 136
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $520
LABELV $518
line 1256
;1256:	}
LABELV $515
line 1257
;1257:	if ( strcmp(arg35, "0") ) {
ADDRFP4 140
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $522
LABELV $524
line 1258
;1258:	CopyAlloc(ent->messageru, arg35);
CNSTU4 4
ARGU4
ADDRLP4 280
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 280
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $527
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRFP4 140
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $527
LABELV $525
line 1259
;1259:	}
LABELV $522
line 1260
;1260:	if ( strcmp(arg36, "0") ) {
ADDRFP4 144
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $529
LABELV $531
line 1261
;1261:	CopyAlloc(ent->team, arg36);
CNSTU4 4
ARGU4
ADDRLP4 284
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 284
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $534
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ARGP4
ADDRFP4 144
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $534
LABELV $532
line 1262
;1262:	}
LABELV $529
line 1263
;1263:	if ( strcmp(arg37, "0") ) {
ADDRFP4 148
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $536
line 1264
;1264:	ent->wait = atoi(arg37);
ADDRFP4 148
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRLP4 288
INDIRI4
CVIF4 4
ASGNF4
line 1265
;1265:	}
LABELV $536
line 1266
;1266:	if ( strcmp(arg38, "0") ) {
ADDRFP4 152
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $538
line 1267
;1267:	ent->random = atoi(arg38);
ADDRFP4 152
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 292
INDIRI4
CVIF4 4
ASGNF4
line 1268
;1268:	}
LABELV $538
line 1269
;1269:	if ( strcmp(arg39, "0") ) {
ADDRFP4 156
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $540
line 1270
;1270:	ent->playerangle = atoi(arg39);
ADDRFP4 156
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 948
ADDP4
ADDRLP4 296
INDIRI4
ASGNI4
line 1271
;1271:	}
LABELV $540
line 1272
;1272:	if ( strcmp(arg40, "0") ) {
ADDRFP4 160
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $542
line 1273
;1273:	ent->price = atoi(arg40);
ADDRFP4 160
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 300
INDIRI4
ASGNI4
line 1274
;1274:	}
LABELV $542
line 1275
;1275:	if ( strcmp(arg41, "0") ) {
ADDRFP4 164
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $544
line 1276
;1276:	ent->damage = atoi(arg41);
ADDRFP4 164
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ADDRLP4 304
INDIRI4
ASGNI4
line 1277
;1277:	}
LABELV $544
line 1278
;1278:	if ( strcmp(arg42, "0") ) {
ADDRFP4 168
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 304
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $546
LABELV $548
line 1279
;1279:	CopyAlloc(ent->targetShaderName, arg42);
CNSTU4 4
ARGU4
ADDRLP4 308
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 308
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $551
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ARGP4
ADDRFP4 168
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $551
LABELV $549
line 1280
;1280:	}
LABELV $546
line 1281
;1281:	if ( strcmp(arg43, "0") ) {
ADDRFP4 172
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $553
LABELV $555
line 1282
;1282:	CopyAlloc(ent->targetShaderNewName, arg43);
CNSTU4 4
ARGU4
ADDRLP4 312
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRLP4 312
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $558
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ARGP4
ADDRFP4 172
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $558
LABELV $556
line 1283
;1283:	}
LABELV $553
line 1284
;1284:	if ( strcmp(arg44, "0") ) {
ADDRFP4 176
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 312
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $560
LABELV $562
line 1285
;1285:	CopyAlloc(ent->mapname, arg44);
CNSTU4 4
ARGU4
ADDRLP4 316
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1068
ADDP4
ADDRLP4 316
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
ADDRLP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRP4
ARGP4
ADDRFP4 176
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $565
LABELV $563
line 1286
;1286:	}
LABELV $560
line 1287
;1287:	if ( strcmp(arg45, "0") ) {
ADDRFP4 180
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 316
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $567
LABELV $569
line 1288
;1288:	CopyAlloc(ent->clientname, arg45);
CNSTU4 4
ARGU4
ADDRLP4 320
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
ADDRLP4 320
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $572
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRFP4 180
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $572
LABELV $570
line 1289
;1289:	}
LABELV $567
line 1290
;1290:	if ( strcmp(arg46, "0") ) {
ADDRFP4 184
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 320
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $574
LABELV $576
line 1291
;1291:	CopyAlloc(ent->teleporterTarget, arg46);
CNSTU4 4
ARGU4
ADDRLP4 324
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1072
ADDP4
ADDRLP4 324
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1072
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $579
ADDRLP4 0
INDIRP4
CNSTI4 1072
ADDP4
INDIRP4
ARGP4
ADDRFP4 184
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $579
LABELV $577
line 1292
;1292:	}
LABELV $574
line 1293
;1293:	if ( strcmp(arg47, "0") ) {
ADDRFP4 188
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 324
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $581
LABELV $583
line 1294
;1294:	CopyAlloc(ent->deathTarget, arg47);
CNSTU4 4
ARGU4
ADDRLP4 328
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2172
ADDP4
ADDRLP4 328
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2172
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $586
ADDRLP4 0
INDIRP4
CNSTI4 2172
ADDP4
INDIRP4
ARGP4
ADDRFP4 188
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $586
LABELV $584
line 1295
;1295:	}
LABELV $581
line 1296
;1296:	if ( strcmp(arg48, "0") ) {
ADDRFP4 192
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 328
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $588
LABELV $590
line 1297
;1297:	CopyAlloc(ent->lootTarget, arg48);
CNSTU4 4
ARGU4
ADDRLP4 332
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
ADDRLP4 332
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $593
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRP4
ARGP4
ADDRFP4 192
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $593
LABELV $591
line 1298
;1298:	}
LABELV $588
line 1299
;1299:	if ( strcmp(arg49, "0") ) {
ADDRFP4 196
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 332
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 0
EQI4 $595
line 1300
;1300:	ent->skill = atoi(arg49);
ADDRFP4 196
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 336
INDIRI4
CVIF4 4
ASGNF4
line 1301
;1301:	}
LABELV $595
line 1302
;1302:	if ( strcmp(arg50, "0") ) {
ADDRFP4 200
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 336
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $597
line 1303
;1303:	ent->objectType = atoi(arg50);
ADDRFP4 200
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1056
ADDP4
ADDRLP4 340
INDIRI4
ASGNI4
line 1304
;1304:	}
LABELV $597
line 1305
;1305:	if ( strcmp(arg51, "0") ) {
ADDRFP4 204
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 340
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $599
LABELV $601
line 1306
;1306:	CopyAlloc(ent->target2, arg51);
CNSTU4 4
ARGU4
ADDRLP4 344
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2100
ADDP4
ADDRLP4 344
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $604
ADDRLP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRFP4 204
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $604
LABELV $602
line 1307
;1307:	}
LABELV $599
line 1308
;1308:	if ( strcmp(arg52, "0") ) {
ADDRFP4 208
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 344
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $606
LABELV $608
line 1309
;1309:	CopyAlloc(ent->damagetarget, arg52);
CNSTU4 4
ARGU4
ADDRLP4 348
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2104
ADDP4
ADDRLP4 348
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $611
ADDRLP4 0
INDIRP4
CNSTI4 2104
ADDP4
INDIRP4
ARGP4
ADDRFP4 208
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $611
LABELV $609
line 1310
;1310:	}
LABELV $606
line 1311
;1311:	if ( strcmp(arg53, "0") ) {
ADDRFP4 212
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 348
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $613
LABELV $615
line 1312
;1312:	CopyAlloc(ent->targetname2, arg53);
CNSTU4 4
ARGU4
ADDRLP4 352
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2108
ADDP4
ADDRLP4 352
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2108
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
ADDRLP4 0
INDIRP4
CNSTI4 2108
ADDP4
INDIRP4
ARGP4
ADDRFP4 212
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $618
LABELV $616
line 1313
;1313:	}
LABELV $613
line 1314
;1314:	if ( strcmp(arg54, "0") ) {
ADDRFP4 216
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 352
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $620
LABELV $622
line 1315
;1315:	CopyAlloc(ent->key, arg54);
CNSTU4 4
ARGU4
ADDRLP4 356
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2188
ADDP4
ADDRLP4 356
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $625
ADDRLP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRFP4 216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $625
LABELV $623
line 1316
;1316:	}
LABELV $620
line 1317
;1317:	if ( strcmp(arg55, "0") ) {
ADDRFP4 220
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 356
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $627
LABELV $629
line 1318
;1318:	CopyAlloc(ent->value, arg55);
CNSTU4 4
ARGU4
ADDRLP4 360
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2192
ADDP4
ADDRLP4 360
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $632
ADDRLP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRFP4 220
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $632
LABELV $630
line 1319
;1319:	}
LABELV $627
line 1320
;1320:	if ( strcmp(arg56, "0") ) {
ADDRFP4 224
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 360
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $634
line 1321
;1321:	ent->armor = atoi(arg56);
ADDRFP4 224
INDIRP4
ARGP4
ADDRLP4 364
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2196
ADDP4
ADDRLP4 364
INDIRI4
ASGNI4
line 1322
;1322:	}
LABELV $634
line 1323
;1323:	if ( strcmp(arg57, "0") ) {
ADDRFP4 228
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 364
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
EQI4 $636
LABELV $638
line 1324
;1324:	CopyAlloc(ent->music, arg57);
CNSTU4 4
ARGU4
ADDRLP4 368
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2212
ADDP4
ADDRLP4 368
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2212
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $641
ADDRLP4 0
INDIRP4
CNSTI4 2212
ADDP4
INDIRP4
ARGP4
ADDRFP4 228
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $641
LABELV $639
line 1325
;1325:	}
LABELV $636
line 1326
;1326:	if ( strcmp(arg58, "0") ) {
ADDRFP4 232
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 368
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $643
line 1327
;1327:	ent->distance = atoi(arg58);
ADDRFP4 232
INDIRP4
ARGP4
ADDRLP4 372
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1044
ADDP4
ADDRLP4 372
INDIRI4
CVIF4 4
ASGNF4
line 1328
;1328:	}
LABELV $643
line 1329
;1329:	if ( strcmp(arg59, "0") ) {
ADDRFP4 236
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 372
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $645
line 1330
;1330:	ent->type = atoi(arg59);
ADDRFP4 236
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
ADDRLP4 376
INDIRI4
ASGNI4
line 1331
;1331:	}
LABELV $645
line 1332
;1332:	if ( strcmp(arg60, "0") ) {
ADDRFP4 240
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 376
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
EQI4 $647
line 1333
;1333:	ent->vehicle = atoi(arg60);
ADDRFP4 240
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1052
ADDP4
ADDRLP4 380
INDIRI4
ASGNI4
line 1334
;1334:	}
LABELV $647
line 1337
;1335:
;1336:	// check item spawn functions
;1337:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 8
ADDRGP4 bg_itemlist+56
ASGNP4
ADDRGP4 $652
JUMPV
LABELV $649
line 1338
;1338:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 8
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $654
line 1339
;1339:			snapped[2] += 48;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1340
;1340:			VectorCopy( snapped, ent->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 1341
;1341:			VectorCopy( snapped, ent->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 1342
;1342:			VectorCopy( snapped, ent->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 1343
;1343:			G_SpawnItem( ent, item );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 1344
;1344:			return;
ADDRGP4 $450
JUMPV
LABELV $654
line 1346
;1345:		}
;1346:	}
LABELV $650
line 1337
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
LABELV $652
ADDRLP4 8
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $649
line 1349
;1347:
;1348:	// check normal spawn functions
;1349:	for ( s=sandspawns ; s->name ; s++ ) {
ADDRLP4 4
ADDRGP4 sandspawns
ASGNP4
ADDRGP4 $660
JUMPV
LABELV $657
line 1350
;1350:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $661
LABELV $663
line 1352
;1351:			// found it
;1352:			CopyAlloc(ent->sb_class, ent->classname);
CNSTU4 4
ARGU4
ADDRLP4 384
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 872
ADDP4
ADDRLP4 384
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 872
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $666
ADDRLP4 0
INDIRP4
CNSTI4 872
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $666
LABELV $664
line 1353
;1353:			s->spawn(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 1355
;1354:			//spawn another class
;1355:			ent->s.modelindex = G_ModelIndex( va("props/%s",arg02) );
ADDRGP4 $411
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRLP4 388
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 388
INDIRI4
ASGNI4
LABELV $668
line 1356
;1356:			CopyAlloc(ent->sb_model, arg02);
CNSTU4 4
ARGU4
ADDRLP4 392
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 392
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $671
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $671
LABELV $669
line 1357
;1357:			ent->sb_coltype = atoi(arg05);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 392
INDIRI4
ASGNI4
line 1358
;1358:			ent->classname = "func_prop";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $82
ASGNP4
line 1359
;1359:			ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 396
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 396
INDIRP4
ADDRLP4 396
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1360
;1360:			VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1361
;1361:			VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1362
;1362:			trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1363
;1363:			return;
ADDRGP4 $450
JUMPV
LABELV $661
line 1365
;1364:		}
;1365:	}
LABELV $658
line 1349
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $660
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $657
line 1368
;1366:
;1367:	//prop init
;1368:	ent->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1369
;1369:	ent->classname = "func_prop";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $82
ASGNP4
line 1370
;1370:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1371
;1371:	ent->takedamage = ent->sb_takedamage;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
ASGNI4
line 1372
;1372:	ent->takedamage2 = ent->sb_takedamage2;
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
ASGNI4
line 1373
;1373:	ent->die = BlockDie;		
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 BlockDie
ASGNP4
line 1374
;1374:	ent->s.modelindex = G_ModelIndex( va("props/%s",arg02) );
ADDRGP4 $411
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 396
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 396
INDIRI4
ASGNI4
LABELV $673
line 1375
;1375:	CopyAlloc(ent->sb_model, arg02);
CNSTU4 4
ARGU4
ADDRLP4 400
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 400
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $676
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $676
LABELV $674
line 1376
;1376:	if(atoi(arg60) <= 0){
ADDRFP4 240
INDIRP4
ARGP4
ADDRLP4 400
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
GTI4 $678
line 1377
;1377:	ent->sb_coltype = atoi(arg05);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 404
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 404
INDIRI4
ASGNI4
line 1378
;1378:	VectorSet( ent->r.mins, -ent->sb_coltype*ent->sb_colscale0, -ent->sb_coltype*ent->sb_colscale1, -ent->sb_coltype*ent->sb_colscale2);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1379
;1379:	VectorSet( ent->r.maxs, ent->sb_coltype*ent->sb_colscale0, ent->sb_coltype*ent->sb_colscale1, ent->sb_coltype*ent->sb_colscale2 );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1380
;1380:	} else {
ADDRGP4 $679
JUMPV
LABELV $678
line 1381
;1381:	ent->sb_coltype = atoi(arg05);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 404
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 404
INDIRI4
ASGNI4
line 1382
;1382:	VectorSet( ent->r.mins, -25, -25, -15);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3245342720
ASGNF4
line 1383
;1383:	VectorSet( ent->r.maxs, 25, 25, 15 );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1103626240
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1103626240
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1097859072
ASGNF4
line 1384
;1384:	}
LABELV $679
line 1385
;1385:	ent->touch = G_TouchProp;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 G_TouchProp
ASGNP4
line 1386
;1386:	trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1387
;1387:}
LABELV $450
endproc G_BuildPropSL 432 8
export G_ModProp
proc G_ModProp 40 8
line 1389
;1388:
;1389:void G_ModProp( gentity_t *targ, gentity_t *attacker, char *arg01, char *arg02, char *arg03, char *arg04, char *arg05, char *arg06, char *arg07, char *arg08, char *arg09, char *arg10, char *arg11, char *arg12, char *arg13, char *arg14, char *arg15, char *arg16, char *arg17, char *arg18, char *arg19 ) { //tool_id
line 1390
;1390:	if(g_gametype.integer != GT_SANDBOX){
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $681
line 1391
;1391:		return; 
ADDRGP4 $680
JUMPV
LABELV $681
line 1393
;1392:	}
;1393:	if(!g_allowtoolgun.integer){
ADDRGP4 g_allowtoolgun+12
INDIRI4
CNSTI4 0
NEI4 $684
line 1394
;1394:		return; 
ADDRGP4 $680
JUMPV
LABELV $684
line 1396
;1395:	}
;1396:	if(targ->client && !targ->singlebot){
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $687
ADDRLP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $687
line 1397
;1397:		return;
ADDRGP4 $680
JUMPV
LABELV $687
line 1399
;1398:	}
;1399:	if(!attacker->client){
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $689
line 1400
;1400:		return;
ADDRGP4 $680
JUMPV
LABELV $689
line 1402
;1401:	}
;1402:	if(targ->owner != attacker->s.clientNum + 1){
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 1
ADDI4
EQI4 $691
line 1403
;1403:		if(targ->owner != 0){
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
CNSTI4 0
EQI4 $693
line 1404
;1404:			trap_SendServerCommand( attacker->s.clientNum, va( "cp \"Owned by %s\n\"", targ->ownername ));
ADDRGP4 $695
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1405
;1405:			return;
ADDRGP4 $680
JUMPV
LABELV $693
line 1407
;1406:		}	
;1407:	}
LABELV $691
line 1408
;1408:	if(attacker->tool_id == 0){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
NEI4 $696
line 1410
;1409:		// client-side command for spawn prop
;1410:	}
LABELV $696
line 1411
;1411:	if(attacker->tool_id == 1){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $698
line 1412
;1412:		targ->s.generic2 = atoi(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1413
;1413:		targ->sb_generic1 = atoi(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 884
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1414
;1414:	}
LABELV $698
line 1415
;1415:	if(attacker->tool_id == 2){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $700
line 1416
;1416:		if(!targ->singlebot){
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
NEI4 $702
line 1417
;1417:			G_FreeEntity(targ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1418
;1418:		} else {
ADDRGP4 $703
JUMPV
LABELV $702
line 1419
;1419:			DropClientSilently( targ->client->ps.clientNum );	
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 DropClientSilently
CALLV
pop
line 1420
;1420:		}
LABELV $703
line 1421
;1421:	}
LABELV $700
line 1422
;1422:	if(attacker->tool_id == 3){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $704
line 1423
;1423:		targ->s.modelindex = G_ModelIndex( va("props/%s", arg01) );
ADDRGP4 $411
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $706
line 1424
;1424:		CopyAlloc(targ->sb_model, arg01);
CNSTU4 4
ARGU4
ADDRLP4 12
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $709
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $709
LABELV $707
line 1425
;1425:	}
LABELV $704
line 1426
;1426:	if(attacker->tool_id == 4){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 4
NEI4 $711
line 1427
;1427:		if(atoi(arg19) == 0){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $713
line 1428
;1428:		targ->s.pos.trType = TR_STATIONARY; targ->physicsObject = qfalse; targ->sb_phys = 1;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 1
ASGNI4
line 1429
;1429:		}
LABELV $713
line 1430
;1430:		if(atoi(arg19) == 1){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $715
line 1431
;1431:		targ->s.pos.trType = TR_GRAVITY; targ->s.pos.trTime = level.time; targ->physicsObject = qtrue; targ->sb_phys = 2;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTI4 2
ASGNI4
line 1432
;1432:		}
LABELV $715
line 1433
;1433:	}
LABELV $711
line 1434
;1434:	if(attacker->tool_id == 5){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 5
NEI4 $718
line 1435
;1435:		if(atoi(arg19) == 0){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $720
line 1436
;1436:		targ->owner = 0;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 0
ASGNI4
line 1437
;1437:		targ->ownername = 0;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTP4 0
ASGNP4
line 1438
;1438:		}
LABELV $720
line 1439
;1439:		if(atoi(arg19) == 1){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $722
line 1440
;1440:		targ->owner = attacker->s.clientNum + 1;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1441
;1441:		targ->ownername = attacker->client->pers.netname;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
line 1442
;1442:		}
LABELV $722
line 1443
;1443:		if(atoi(arg19) == 2){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $724
line 1444
;1444:		if(targ->ownername){
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $726
line 1445
;1445:		trap_SendServerCommand( attacker->s.clientNum, va( "cp \"Owned by %s\n\"", targ->ownername ));
ADDRGP4 $695
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1446
;1446:		} 
LABELV $726
line 1447
;1447:		if(!targ->ownername){
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $728
line 1448
;1448:		trap_SendServerCommand( attacker->s.clientNum, "cp \"Not owned\n\"" );
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 $730
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1449
;1449:		} 
LABELV $728
line 1450
;1450:		}
LABELV $724
line 1451
;1451:	}
LABELV $718
line 1452
;1452:	if(attacker->tool_id == 6){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 6
NEI4 $731
line 1453
;1453:		if(atoi(arg19) == 0){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $733
line 1454
;1454:		targ->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1455
;1455:		targ->sb_coll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 0
ASGNI4
line 1456
;1456:		}
LABELV $733
line 1457
;1457:		if(atoi(arg19) == 1){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $735
line 1458
;1458:		targ->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1459
;1459:		targ->sb_coll = 1;
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 1
ASGNI4
line 1460
;1460:		}
LABELV $735
line 1461
;1461:	trap_UnlinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1462
;1462:	trap_LinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1463
;1463:	}
LABELV $731
line 1464
;1464:	if(attacker->tool_id == 7){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 7
NEI4 $737
line 1465
;1465:		targ->health = atoi(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1466
;1466:	}
LABELV $737
line 1467
;1467:	if(attacker->tool_id == 8){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 8
NEI4 $739
line 1468
;1468:		targ->s.constantLight = atoi(arg01) | ( atoi(arg02) << 8 ) | ( atoi(arg03) << 16 ) | ( atoi(arg04) << 24 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 12
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 16
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1469
;1469:		targ->sb_red = atoi(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 900
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1470
;1470:		targ->sb_green = atoi(arg02);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 904
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1471
;1471:		targ->sb_blue = atoi(arg03);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1472
;1472:		targ->sb_radius = atoi(arg04);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1473
;1473:		trap_UnlinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1474
;1474:		trap_LinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1475
;1475:	}
LABELV $739
line 1476
;1476:	if(attacker->tool_id == 9){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 9
NEI4 $741
line 1477
;1477:	if(atoi(arg19) == 0){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $743
line 1478
;1478:		targ->s.apos.trBase[0] += atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 1479
;1479:		targ->sb_rotate0 += atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1480
;1480:	}
LABELV $743
line 1481
;1481:	if(atoi(arg19) == 1){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $745
line 1482
;1482:		targ->s.apos.trBase[1] += atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 1483
;1483:		targ->sb_rotate1 += atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 864
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 1484
;1484:	}
LABELV $745
line 1485
;1485:	if(atoi(arg19) == 2){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $747
line 1486
;1486:		targ->s.apos.trBase[2] += atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1487
;1487:		targ->sb_rotate2 += atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 1488
;1488:	}
LABELV $747
line 1489
;1489:		trap_UnlinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1490
;1490:		trap_LinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1491
;1491:	}
LABELV $741
line 1492
;1492:	if(attacker->tool_id == 10){
ADDRFP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 10
NEI4 $749
line 1493
;1493:	if(atoi(arg19) == 0){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $751
line 1494
;1494:		targ->s.scales[0] = atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 1495
;1495:		targ->sb_colscale0 = atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1496
;1496:	}
LABELV $751
line 1497
;1497:	if(atoi(arg19) == 1){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $753
line 1498
;1498:		targ->s.scales[1] = atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1499
;1499:		targ->sb_colscale1 = atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 1500
;1500:	}
LABELV $753
line 1501
;1501:	if(atoi(arg19) == 2){
ADDRFP4 80
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $755
line 1502
;1502:		targ->s.scales[2] = atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 1503
;1503:		targ->sb_colscale2 = atof(arg01);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 856
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1504
;1504:	}
LABELV $755
line 1505
;1505:		VectorSet( targ->r.mins, -targ->sb_coltype*targ->sb_colscale0, -targ->sb_coltype*targ->sb_colscale1, -targ->sb_coltype*targ->sb_colscale2);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1506
;1506:		VectorSet( targ->r.maxs, targ->sb_coltype*targ->sb_colscale0, targ->sb_coltype*targ->sb_colscale1, targ->sb_coltype*targ->sb_colscale2 );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRP4
CNSTI4 848
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRP4
CNSTI4 852
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRP4
CNSTI4 856
ADDP4
INDIRF4
MULF4
ASGNF4
line 1507
;1507:		trap_UnlinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1508
;1508:		trap_LinkEntity( targ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1509
;1509:	}
LABELV $749
line 1510
;1510:}
LABELV $680
endproc G_ModProp 40 8
export G_PropSmoke
proc G_PropSmoke 12 8
line 1512
;1511:
;1512:void G_PropSmoke( gentity_t *ent, float impact ){
line 1515
;1513:	gentity_t   *temp;
;1514:	
;1515:	temp = G_TempEntity(ent->r.currentOrigin, EV_SMOKEPUFF);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 99
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1516
;1516:	temp->s.constantLight = (((70 | 64 << 8 ) | 64 << 16 ) | ( 255 << 24 ));
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 255
CNSTI4 24
LSHI4
CNSTI4 4210758
BORI4
ASGNI4
line 1517
;1517:	temp->s.eventParm = 2;	//eventParm is used to determine the amount of time the smoke puff exists
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 2
ASGNI4
line 1518
;1518:	temp->s.generic1 = 100;	//generic1 is used to determine the movement speed of the smoke puff
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 100
ASGNI4
line 1519
;1519:	temp->s.otherEntityNum = (int)impact; //otherEntityNum is used to determine the size of the smokepuff. The default is 32.
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1520
;1520:	VectorCopy(ent->s.angles, temp->s.angles);
ADDRLP4 8
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 1521
;1521:}
LABELV $757
endproc G_PropSmoke 12 8
export G_PropWaterSplash
proc G_PropWaterSplash 8 8
line 1523
;1522:
;1523:void G_PropWaterSplash( gentity_t *ent, float impact ){
line 1526
;1524:	gentity_t   *temp;
;1525:	
;1526:	temp = G_TempEntity(ent->r.currentOrigin, EV_WATERPUFF);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1527
;1527:	temp->s.eventParm = 1;	//eventParm is used to determine the amount of time the smoke puff exists
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 1
ASGNI4
line 1528
;1528:	temp->s.generic1 = 100;	//generic1 is used to determine the movement speed of the smoke puff
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 100
ASGNI4
line 1529
;1529:	temp->s.otherEntityNum = (int)impact; //otherEntityNum is used to determine the size of the smokepuff. The default is 32.
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1530
;1530:}
LABELV $758
endproc G_PropWaterSplash 8 8
export G_BounceProp
proc G_BounceProp 64 12
line 1538
;1531:
;1532:/*
;1533:================
;1534:G_BounceProp
;1535:
;1536:================
;1537:*/
;1538:void G_BounceProp( gentity_t *ent, trace_t *trace ) {
line 1544
;1539:	vec3_t	velocity;
;1540:	float	dot;
;1541:	int		hitTime;
;1542:
;1543:	// reflect the velocity on the trace plane
;1544:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1545
;1545:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1546
;1546:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1547
;1547:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1550
;1548:
;1549:	// cut the velocity to keep from bouncing forever
;1550:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
ASGNF4
line 1553
;1551:	
;1552:	// check for stop
;1553:	if ( trace->plane.normal[2] > 0.2 && ent->s.pos.trDelta[2] < 30 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $767
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1106247680
GEF4 $767
line 1554
;1554:		ent->s.apos.trBase[0] = 0;		// reset rotate
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1555
;1555:		ent->s.apos.trBase[2] = 0;		// reset rotate
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 1556
;1556:		G_DisablePropPhysics( ent, trace->endpos );	//disable phys if it not moving
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_DisablePropPhysics
CALLI4
pop
line 1557
;1557:	}
LABELV $767
line 1559
;1558:
;1559:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1560
;1560:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 1561
;1561:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1562
;1562:}
LABELV $759
endproc G_BounceProp 64 12
export G_RunProp
proc G_RunProp 180 28
line 1570
;1563:
;1564:/*
;1565:================
;1566:G_RunProp
;1567:
;1568:================
;1569:*/
;1570:void G_RunProp(gentity_t *ent) {
line 1579
;1571:    vec3_t origin;
;1572:    trace_t tr;
;1573:	gentity_t *hit;
;1574:	float impactForce;
;1575:	float impactForceAll;
;1576:	float impactForceFixed;
;1577:	vec3_t impactVector;
;1578:	
;1579:	if(ent->r.currentOrigin[2] <= -70000){
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
CNSTF4 3347625984
GTF4 $771
line 1580
;1580:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1581
;1581:		return;
ADDRGP4 $770
JUMPV
LABELV $771
line 1585
;1582:	}
;1583:
;1584:    // Unlink the entity so that it won't interact with other entities during the calculation
;1585:    trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1588
;1586:	
;1587:    // If ground entity has been set to -1, apply gravity if necessary
;1588:    if (ent->s.groundEntityNum == -1 && ent->s.pos.trType != TR_GRAVITY) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $773
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $773
line 1589
;1589:        ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1590
;1590:        ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1591
;1591:    }
LABELV $773
line 1594
;1592:
;1593:    // If the entity is stationary, re-link it and run the think function
;1594:    if (ent->s.pos.trType == TR_STATIONARY) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $776
line 1595
;1595:        trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1596
;1596:        G_RunThink(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1597
;1597:        return;
ADDRGP4 $770
JUMPV
LABELV $776
line 1601
;1598:    }
;1599:	
;1600:	// Get current position based on the entity's trajectory
;1601:    BG_EvaluateTrajectory(&ent->s.pos, level.time, origin);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 60
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1604
;1602:
;1603:    // Trace a line from the current origin to the new position
;1604:    trap_Trace(&tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1607
;1605:	
;1606:    // Update entity position to the end of the trace
;1607:    VectorCopy(tr.endpos, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1608
;1608:    VectorCopy(ent->r.currentOrigin, ent->s.origin);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 1611
;1609:	
;1610:    // Link the entity back into the world
;1611:    trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1614
;1612:	
;1613:	// Calculate the impact force
;1614:	impactForce = sqrt(ent->s.pos.trDelta[0] * ent->s.pos.trDelta[0] + ent->s.pos.trDelta[1] * ent->s.pos.trDelta[1]);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 116
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 112
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 116
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 120
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 120
INDIRF4
ASGNF4
line 1615
;1615:	impactForceAll = sqrt(ent->s.pos.trDelta[0] * ent->s.pos.trDelta[0] + ent->s.pos.trDelta[1] * ent->s.pos.trDelta[1] + ent->s.pos.trDelta[2] * ent->s.pos.trDelta[2]);
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 124
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 132
ADDRLP4 124
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 136
ADDRLP4 124
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ASGNF4
ADDRLP4 128
INDIRF4
ADDRLP4 128
INDIRF4
MULF4
ADDRLP4 132
INDIRF4
ADDRLP4 132
INDIRF4
MULF4
ADDF4
ADDRLP4 136
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 140
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 140
INDIRF4
ASGNF4
line 1616
;1616:	impactForceFixed = sqrt(ent->s.pos.trDelta[0] * ent->s.pos.trDelta[0] + ent->s.pos.trDelta[1] * ent->s.pos.trDelta[1] + g_gravity.integer*g_gravityModifier.value * g_gravity.integer*g_gravityModifier.value);
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
ADDRLP4 144
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 152
ADDRLP4 144
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 148
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ADDRLP4 152
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ADDF4
ADDRGP4 g_gravity+12
INDIRI4
CVIF4 4
ADDRGP4 g_gravityModifier+8
INDIRF4
MULF4
ADDRGP4 g_gravity+12
INDIRI4
CVIF4 4
MULF4
ADDRGP4 g_gravityModifier+8
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 156
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 92
ADDRLP4 156
INDIRF4
ASGNF4
line 1618
;1617:	
;1618:	if(!trap_Cvar_VariableIntegerValue("cl_android")){
ADDRGP4 $464
ARGP4
ADDRLP4 160
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $784
line 1619
;1619:	if(ent->s.pos.trType == TR_GRAVITY || ent->s.pos.trType == TR_GRAVITY_WATER){
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 5
EQI4 $788
ADDRLP4 164
INDIRI4
CNSTI4 7
NEI4 $786
LABELV $788
line 1620
;1620:		if(trap_PointContents(tr.endpos, ent->s.number) & MASK_WATER){
ADDRLP4 0+12
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $789
line 1621
;1621:			if(ent->s.pos.trType != TR_GRAVITY_WATER){
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 7
EQI4 $790
line 1622
;1622:			ent->s.pos.trType = TR_GRAVITY_WATER;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 7
ASGNI4
line 1623
;1623:			G_PropWaterSplash( ent, impactForceFixed);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
INDIRF4
ARGF4
ADDRGP4 G_PropWaterSplash
CALLV
pop
line 1624
;1624:			G_EnablePropPhysics(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_EnablePropPhysics
CALLI4
pop
line 1625
;1625:			ent->s.pos.trDelta[0] *= 0.50;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTF4 1056964608
ADDRLP4 172
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1626
;1626:			ent->s.pos.trDelta[1] *= 0.50;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTF4 1056964608
ADDRLP4 176
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1627
;1627:			if(ent->s.pos.trDelta[2]){
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 0
EQF4 $790
line 1628
;1628:			ent->s.pos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 1629
;1629:			}
line 1630
;1630:			}
line 1631
;1631:		} else {
ADDRGP4 $790
JUMPV
LABELV $789
line 1632
;1632:			if(ent->s.pos.trType != TR_GRAVITY){
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $796
line 1633
;1633:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1634
;1634:			G_EnablePropPhysics(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_EnablePropPhysics
CALLI4
pop
line 1635
;1635:			}
LABELV $796
line 1636
;1636:		}
LABELV $790
line 1637
;1637:	}
LABELV $786
line 1638
;1638:	}
LABELV $784
line 1641
;1639:
;1640:    // If there's a collision, handle it
;1641:    if (tr.fraction < 1.0f && tr.entityNum != ENTITYNUM_NONE) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $798
ADDRLP4 0+52
INDIRI4
CNSTI4 4095
EQI4 $798
line 1642
;1642:        hit = &g_entities[tr.entityNum];
ADDRLP4 56
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1644
;1643:
;1644:        if (hit->s.number != ent->s.number) {  // Ignore self
ADDRLP4 56
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $803
line 1646
;1645:            // Optionally apply a force or velocity to the hit entity to simulate the push
;1646:			if (impactForce > PHYS_SENS) {
ADDRLP4 76
INDIRF4
ADDRGP4 g_physimpulse+12
INDIRI4
CVIF4 4
LEF4 $805
line 1647
;1647:			if (!hit->client){
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $808
line 1648
;1648:			G_EnablePropPhysics(hit);
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 G_EnablePropPhysics
CALLI4
pop
line 1649
;1649:			}
LABELV $808
line 1650
;1650:			VectorCopy(ent->s.pos.trDelta, impactVector);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1651
;1651:			VectorScale(impactVector, PHYS_PROP_IMPACT, impactVector);	
ADDRLP4 80
ADDRLP4 80
INDIRF4
ADDRGP4 g_physimpact+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 80+4
INDIRF4
ADDRGP4 g_physimpact+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRGP4 g_physimpact+8
INDIRF4
MULF4
ASGNF4
line 1652
;1652:			if (!hit->client){
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $817
line 1653
;1653:            VectorAdd(hit->s.pos.trDelta, impactVector, hit->s.pos.trDelta);  // Transfer velocity from the prop to the hit entity
ADDRLP4 164
ADDRLP4 56
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ASGNF4
ADDRLP4 168
ADDRLP4 56
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
ADDRLP4 80+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 172
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
ADDRLP4 80+8
INDIRF4
ADDF4
ASGNF4
line 1654
;1654:			} else {
ADDRGP4 $818
JUMPV
LABELV $817
line 1655
;1655:			if(hit->grabbedEntity != ent && hit->botskill != 9){
ADDRLP4 164
ADDRLP4 56
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $821
ADDRLP4 164
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 9
EQI4 $821
line 1656
;1656:			VectorAdd(hit->client->ps.velocity, impactVector, hit->client->ps.velocity);  // Transfer velocity from the prop to the hit player
ADDRLP4 168
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ASGNF4
ADDRLP4 172
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
ADDRLP4 80+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 176
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
ADDRLP4 80+8
INDIRF4
ADDF4
ASGNF4
line 1657
;1657:			}
LABELV $821
line 1658
;1658:			}
LABELV $818
line 1659
;1659:			}
LABELV $805
line 1660
;1660:			if(impactForceAll > PHYS_DAMAGESENS){
ADDRLP4 72
INDIRF4
CNSTF4 1106247680
LEF4 $825
line 1661
;1661:			if(hit->grabbedEntity != ent){
ADDRLP4 56
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $827
line 1662
;1662:			G_PropDamage(hit, ent->lastPlayer, (int)(impactForceAll * PHYS_DAMAGE));
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2488
ADDP4
INDIRP4
ARGP4
ADDRLP4 72
INDIRF4
ADDRGP4 g_physdamage+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRGP4 G_PropDamage
CALLV
pop
line 1663
;1663:			}
LABELV $827
line 1664
;1664:			G_PropDamage(ent, NULL, (int)(impactForceAll * PHYS_DAMAGE));
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 72
INDIRF4
ADDRGP4 g_physdamage+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRGP4 G_PropDamage
CALLV
pop
line 1666
;1665:			
;1666:			if(hit->grabbedEntity != ent){
ADDRLP4 56
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $831
line 1667
;1667:			if(ent->s.pos.trType != TR_GRAVITY_WATER){
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 7
EQI4 $833
line 1668
;1668:			if(ent->objectType == OT_BASIC){
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $835
line 1669
;1669:			G_AddEvent( ent, EV_OT1_IMPACT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 105
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1670
;1670:			G_PropSmoke( ent, impactForceAll*0.20);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1045220557
ADDRLP4 72
INDIRF4
MULF4
ARGF4
ADDRGP4 G_PropSmoke
CALLV
pop
line 1671
;1671:			}
LABELV $835
line 1672
;1672:			if(ent->objectType == OT_VEHICLE){
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 1
NEI4 $837
line 1673
;1673:			G_AddEvent( ent, EV_CRASH25, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 104
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1674
;1674:			G_PropSmoke( ent, impactForceAll*0.20);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1045220557
ADDRLP4 72
INDIRF4
MULF4
ARGF4
ADDRGP4 G_PropSmoke
CALLV
pop
line 1675
;1675:			}
LABELV $837
line 1676
;1676:			if(ent->objectType == OT_TNT){
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 2
NEI4 $839
line 1677
;1677:			G_AddEvent( ent, EV_OT1_IMPACT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 105
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1678
;1678:			G_PropSmoke( ent, impactForceAll*0.20);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1045220557
ADDRLP4 72
INDIRF4
MULF4
ARGF4
ADDRGP4 G_PropSmoke
CALLV
pop
line 1679
;1679:			}
LABELV $839
line 1680
;1680:			}
LABELV $833
line 1681
;1681:			}
LABELV $831
line 1682
;1682:			}
LABELV $825
line 1683
;1683:        }
LABELV $803
line 1684
;1684:    }
LABELV $798
line 1687
;1685:
;1686:    // Rotate entity during movement (optional physics feature)
;1687:	if (!ent->isGrabbed){
ADDRFP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
NEI4 $841
line 1688
;1688:	if(ent->s.pos.trType != TR_GRAVITY_WATER){
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 7
EQI4 $843
line 1689
;1689:    if (ent->s.pos.trDelta[1] != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
EQF4 $845
line 1690
;1690:        ent->s.apos.trBase[1] -= ent->s.pos.trDelta[1] * PHYS_ROTATING;
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
ADDRLP4 164
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1017370378
ADDRLP4 164
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1691
;1691:    }
LABELV $845
line 1692
;1692:    if (ent->s.pos.trDelta[0] != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
EQF4 $844
line 1693
;1693:        ent->s.apos.trBase[0] += ent->s.pos.trDelta[0] * PHYS_ROTATING;
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
ADDRLP4 164
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1017370378
ADDRLP4 164
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1694
;1694:    }
line 1695
;1695:	} else {
ADDRGP4 $844
JUMPV
LABELV $843
line 1696
;1696:    if (ent->s.pos.trDelta[1] != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
EQF4 $849
line 1697
;1697:        ent->s.apos.trBase[1] -= ent->s.pos.trDelta[1] * PHYS_ROTATING * 0.50;
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
ADDRLP4 164
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1056964608
CNSTF4 1017370378
ADDRLP4 164
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 1698
;1698:    }
LABELV $849
line 1699
;1699:    if (ent->s.pos.trDelta[0] != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
EQF4 $851
line 1700
;1700:        ent->s.apos.trBase[0] += ent->s.pos.trDelta[0] * PHYS_ROTATING * 0.50;
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
ADDRLP4 164
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1056964608
CNSTF4 1017370378
ADDRLP4 164
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1701
;1701:    }
LABELV $851
line 1702
;1702:	}
LABELV $844
line 1703
;1703:	}
LABELV $841
line 1706
;1704:
;1705:    // Save rotation
;1706:    ent->sb_rotate0 = ent->s.apos.trBase[0];
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 860
ADDP4
ADDRLP4 164
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ASGNF4
line 1707
;1707:    ent->sb_rotate1 = ent->s.apos.trBase[1];
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 864
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
line 1708
;1708:    ent->sb_rotate2 = ent->s.apos.trBase[2];
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 868
ADDP4
ADDRLP4 172
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 1711
;1709:
;1710:    // Check for solid start (possible embedded in another object)
;1711:    if (tr.startsolid) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $853
line 1712
;1712:        tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1713
;1713:    }
LABELV $853
line 1716
;1714:
;1715:    // Run think function after updating entity
;1716:    G_RunThink(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1718
;1717:	
;1718:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $857
line 1719
;1719:		return;
ADDRGP4 $770
JUMPV
LABELV $857
line 1722
;1720:	}
;1721:
;1722:	G_BounceProp( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceProp
CALLV
pop
line 1723
;1723:}
LABELV $770
endproc G_RunProp 180 28
export G_HideObjects
proc G_HideObjects 8 4
line 1732
;1724:
;1725:
;1726:/*
;1727:================
;1728:G_HideObjects
;1729:
;1730:================
;1731:*/
;1732:void G_HideObjects() {
line 1739
;1733:	int			i;
;1734:	gentity_t	*ent;
;1735:
;1736:	//
;1737:	// go through all allocated objects
;1738:	//
;1739:	ent = &g_entities[0];
ADDRLP4 4
ADDRGP4 g_entities
ASGNP4
line 1740
;1740:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $864
JUMPV
LABELV $861
line 1741
;1741:	if(i>level.num_entities-1){
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
CNSTI4 1
SUBI4
LEI4 $866
line 1742
;1742:	G_Printf("Object (hide) processed!\n");	
ADDRGP4 $869
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1743
;1743:	}
LABELV $866
line 1744
;1744:	if(ent->sandboxObject){
ADDRLP4 4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $862
line 1745
;1745:	trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1746
;1746:	}
line 1747
;1747:	continue;
LABELV $862
line 1740
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $864
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $861
line 1750
;1748:	
;1749:	}
;1750:}
LABELV $860
endproc G_HideObjects 8 4
export G_ShowObjects
proc G_ShowObjects 12 4
line 1758
;1751:
;1752:/*
;1753:================
;1754:G_ShowObjects
;1755:
;1756:================
;1757:*/
;1758:void G_ShowObjects() {
line 1761
;1759:	int			i;
;1760:	gentity_t	*ent;
;1761:	int			thinktime = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1766
;1762:
;1763:	//
;1764:	// go through all allocated objects
;1765:	//
;1766:	ent = &g_entities[0];
ADDRLP4 4
ADDRGP4 g_entities
ASGNP4
line 1767
;1767:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $876
JUMPV
LABELV $873
line 1768
;1768:	thinktime += 10;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1769
;1769:	if(i>level.num_entities-1){
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
CNSTI4 1
SUBI4
LEI4 $878
line 1770
;1770:	G_Printf("Object (show) processed!\n");	
ADDRGP4 $881
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1771
;1771:	}
LABELV $878
line 1772
;1772:	if(ent->sandboxObject){
ADDRLP4 4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $874
line 1773
;1773:	ent->nextthink = level.time + thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1774
;1774:	ent->think = ShowSandObject;
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 ShowSandObject
ASGNP4
line 1775
;1775:	}
line 1776
;1776:	continue;
LABELV $874
line 1767
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $876
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $873
line 1779
;1777:	
;1778:	}
;1779:	G_Printf("Object (show) processed!");
ADDRGP4 $885
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1780
;1780:}
LABELV $872
endproc G_ShowObjects 12 4
export G_FindEntityForEntityNum
proc G_FindEntityForEntityNum 8 0
line 1788
;1781:
;1782:/*
;1783:================
;1784:G_FindEntityForEntityNum
;1785:
;1786:================
;1787:*/
;1788:gentity_t *G_FindEntityForEntityNum(int entityn) {
line 1793
;1789:    int i;
;1790:    gentity_t *ent;
;1791:
;1792:    // go through all allocated objects
;1793:    for (i = 0, ent = g_entities; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $890
JUMPV
LABELV $887
line 1794
;1794:        if (ent->s.number == entityn) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $892
line 1795
;1795:            return ent;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $886
JUMPV
LABELV $892
line 1797
;1796:        }
;1797:    }
LABELV $888
line 1793
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $890
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $887
line 1799
;1798:    
;1799:    return NULL;
CNSTP4 0
RETP4
LABELV $886
endproc G_FindEntityForEntityNum 8 0
export G_FindEntityForClientNum
proc G_FindEntityForClientNum 12 0
line 1802
;1800:}
;1801:
;1802:gentity_t *G_FindEntityForClientNum(int entityn) {
line 1806
;1803:    int i;
;1804:    gentity_t *ent;
;1805:
;1806:    for (i = 0, ent = g_entities; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $898
JUMPV
LABELV $895
line 1807
;1807:        if (ent->client || ent->client->ps.clientNum == entityn) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $902
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $900
LABELV $902
line 1808
;1808:            return ent;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $894
JUMPV
LABELV $900
line 1810
;1809:        }
;1810:    }
LABELV $896
line 1806
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $898
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $895
line 1812
;1811:    
;1812:    return NULL;
CNSTP4 0
RETP4
LABELV $894
endproc G_FindEntityForClientNum 12 0
import G_EnablePropPhysics
import G_DisablePropPhysics
import SP_rally_weather_snow
import SP_rally_weather_rain
import SP_team_neutralobelisk
import SP_team_redobelisk
import SP_team_blueobelisk
import SP_func_door_rotating
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_path_corner
import SP_script_layer
import SP_script_variable
import SP_target_stats
import SP_target_botremove
import SP_target_cutscene
import SP_target_variable
import SP_target_playerstats
import SP_target_secret
import SP_target_modify
import SP_target_finish
import SP_target_effect
import SP_target_earthquake
import SP_target_skill
import SP_target_objective
import SP_target_debrisemitter
import SP_target_playerspeed
import SP_target_unlink
import SP_target_botspawn
import SP_target_mapchange
import SP_target_gravity
import SP_target_logic
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_clienttarg
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_lock
import SP_trigger_frag
import SP_trigger_death
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_timer
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_breakable
import SP_func_static
import SP_func_plat
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_domination_point
import SP_info_player_dd_blue
import SP_info_player_dd_red
import SP_info_player_dd
import SP_info_player_intermission
import SP_info_player_deathmatch
import SP_info_player_start
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_shuffle
import G_admin_warn
import G_admin_slap
import G_admin_orient
import G_admin_disorient
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_mute
import G_admin_map
import G_admin_listplayers
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_parse_time
import G_admin_level
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
import G_ConfigClientExcellent
import G_checkForMultiKill
import G_CheckForSpree
import G_RunStreakLogic
import G_ReadAltKillSettings
import AU_Cvar_VariableString
import G_ArenaScriptRandom
import G_ArenaScriptAutoFloat
import G_ArenaScriptAutoNonPointChar
import G_ArenaScriptAutoChar
import G_ArenaScriptAutoInt
import G_ArenaScriptFindFloat
import G_ArenaScriptFindChar
import G_ArenaScriptFindInt
import Svcmd_SaveSession_f
import Svcmd_For_f
import Svcmd_SystemCommand_f
import Svcmd_ClientCommand_f
import Svcmd_Editline_f
import Svcmd_Random_f
import Svcmd_Cvar_f
import Svcmd_Operation_f
import Svcmd_Condition_f
import Svcmd_MessageWrapper
import Svcmd_ListIP_f
import Svcmd_Chat_f
import Svcmd_DumpUser_f
import Svcmd_EjectClient_f
import Svcmd_BannerPrint_f
import Svcmd_ReplaceTexture_f
import Svcmd_CenterPrint_f
import Svcmd_TeamMessage_f
import Svcmd_Status_f
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_maxNameChanges
import g_minNameChangePeriod
import g_warningExpire
import g_maxWarnings
import g_publicAdminMessages
import g_specChat
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminParseSay
import g_adminLog
import g_admin
import g_floodMinTime
import g_floodMaxDemerits
import g_spreeDiv
import g_altExcellent
import g_sprees
import g_lagLightning
import sv_fps
import g_truePing
import g_delagHitscan
import g_blueTeamClientNumbers
import g_redTeamClientNumbers
import g_humanplayers
import g_maxvotes
import g_voteMaxFraglimit
import g_voteMinFraglimit
import g_voteMaxTimelimit
import g_voteMinTimelimit
import g_voteGametypes
import g_voteBan
import g_voteNames
import g_mappools
import g_autonextmap
import g_catchup
import g_persistantpowerups
import g_awardpushing
import g_elimination_ctf_oneway
import g_lms_mode
import g_lms_lives
import g_ffa_gt
import g_regen
import g_vampireMaxHealth
import g_vampire
import g_instantgib
import g_rockets
import g_elimination_lockspectator
import g_eliminationred_holdable
import g_eliminationred_flight
import g_eliminationred_regen
import g_eliminationred_invis
import g_eliminationred_bsuit
import g_eliminationred_haste
import g_eliminationred_quad
import g_eliminationred_antimatter
import g_eliminationred_flame
import g_eliminationred_nail
import g_eliminationred_mine
import g_eliminationred_chain
import g_eliminationred_plasmagun
import g_eliminationred_lightning
import g_eliminationred_railgun
import g_eliminationred_rocket
import g_eliminationred_grenade
import g_eliminationred_shotgun
import g_eliminationred_machinegun
import g_eliminationred_gauntlet
import g_eliminationred_grapple
import g_eliminationred_bfg
import g_eliminationred_startArmor
import g_eliminationred_startHealth
import g_elimination_holdable
import g_elimination_items
import g_elimination_flight
import g_elimination_regen
import g_elimination_invis
import g_elimination_bsuit
import g_elimination_haste
import g_elimination_quad
import g_elimination_antimatter
import g_elimination_flame
import g_elimination_nail
import g_elimination_mine
import g_elimination_chain
import g_elimination_plasmagun
import g_elimination_lightning
import g_elimination_railgun
import g_elimination_rocket
import g_elimination_grenade
import g_elimination_shotgun
import g_elimination_machinegun
import g_elimination_gauntlet
import g_elimination_allgametypes
import g_elimination_activewarmup
import g_elimination_warmup
import g_elimination_roundtime
import g_elimination_grapple
import g_elimination_bfg
import g_elimination_startArmor
import g_elimination_startHealth
import g_elimination_selfdamage
import g_spawnprotect
import g_music
import g_proxMineTimeout
import g_enableBreath
import g_enableDust
import g_blueteam
import g_redteam
import g_singlePlayer
import g_rankings
import pmove_float
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_votecustom
import g_votemaps
import g_motdfile
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_allowSyncCutscene
import g_debugBotspawns
import g_debugVariables
import g_debugScore
import g_debugCameras
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_disableCutscenes
import g_inactivity
import g_respawntime
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_damageModifier
import g_gravityModifier
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_voteflags
import g_elimflags
import g_videoflags
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_poweruprespawn
import g_megahealthrespawn
import g_holdablerespawn
import g_ammorespawn
import g_healthrespawn
import g_armorrespawn
import g_ammolimit
import g_drowndamage
import g_speedfactor
import g_jumpheight
import g_respawnwait
import g_armorprotect
import g_medkitmodifier
import g_hastefirespeed
import g_autoflagreturn
import g_droppeditemtime
import g_slowhealthregen
import g_fasthealthregen
import g_invultime
import g_invulmove
import g_portalhealth
import g_portaltimeout
import g_flagrespawn
import g_noplayerclip
import g_falldamagebig
import g_falldamagesmall
import g_randomteleport
import g_maxweaponpickup
import g_slimedamage
import g_lavadamage
import g_waterdamage
import g_medkitlimit
import g_kamikazeinf
import g_portalinf
import g_teleporterinf
import g_medkitinf
import g_invulinf
import g_kamikazeinfinf
import g_kill
import g_mapcycleposition
import g_useMapcycle
import g_mapcycle
import info_zombie
import g_randomItems
import g_accelerate
import g_slickmove
import g_overlay
import g_lavatowater
import onandroid
import eliminationrespawn
import eliminationredrespawn
import g_spectatorspeed
import g_regenarmor
import tex_newname
import tex_name
import g_roundmode
import g_scoreboardlock
import g_connectmsg
import g_currentmap
import g_tests
import cl_language
import cl_selectedmod
import g_maxEntities
import g_npcdrop
import g_safe
import g_allowgravitygun
import g_allowphysgun
import g_allowtoolgun
import g_allownoclip
import g_allowitems
import g_allownpc
import g_allowsettings
import g_allowprops
import save8_epsession
import save8_session0_lvl
import save8_session0
import save7_epsession
import save7_session0_lvl
import save7_session0
import save6_epsession
import save6_session0_lvl
import save6_session0
import save5_epsession
import save5_session0_lvl
import save5_session0
import save4_epsession
import save4_session0_lvl
import save4_session0
import save3_epsession
import save3_session0_lvl
import save3_session0
import save2_epsession
import save2_session0_lvl
import save2_session0
import save1_epsession
import save1_session0_lvl
import save1_session0
import save_epsession
import save_session0_lvl
import save_session0
import save8_curmap
import save7_curmap
import save6_curmap
import save5_curmap
import save4_curmap
import save3_curmap
import save2_curmap
import save1_curmap
import save_curmap
import g_skyColorA
import g_skyColorB
import g_skyColorG
import g_skyColorR
import g_skyShader
import g_fogColorA
import g_fogColorB
import g_fogColorG
import g_fogColorR
import g_fogInterval
import g_fogDistance
import g_fogShader
import g_fogModel
import g_teamred_pickupitems
import g_teamred_respawnwait
import g_teamred_infammo
import g_teamred_damage
import g_teamred_firespeed
import g_teamred_gravityModifier
import g_teamred_speed
import g_teamblue_pickupitems
import g_teamblue_respawnwait
import g_teamblue_infammo
import g_teamblue_damage
import g_teamblue_firespeed
import g_teamblue_gravityModifier
import g_teamblue_speed
import g_amweaponcount
import g_ftweaponcount
import g_cgweaponcount
import g_plweaponcount
import g_ngweaponcount
import g_bfgweaponcount
import g_pgweaponcount
import g_rgweaponcount
import g_lgweaponcount
import g_rlweaponcount
import g_glweaponcount
import g_sgweaponcount
import g_mgweaponcount
import g_ftammocount
import g_cgammocount
import g_plammocount
import g_ngammocount
import g_bfgammocount
import g_pgammocount
import g_rgammocount
import g_lgammocount
import g_rlammocount
import g_glammocount
import g_sgammocount
import g_mgammocount
import g_ammoregenhealthmodifier
import g_ammoregengravitymodifier
import g_ammoregenspeedfactor
import g_ammoregendamagefactor
import g_ammoregen_infammo
import g_ammoregenfirespeed
import g_guard_infammo
import g_guardgravitymodifier
import g_guardspeedfactor
import g_guarddamagefactor
import g_guardfirespeed
import g_guardhealthmodifier
import g_doublerhealthmodifier
import g_doubler_infammo
import g_doublergravitymodifier
import g_doublerspeedfactor
import g_doublerdamagefactor
import g_doublerfirespeed
import g_scouthealthmodifier
import g_scout_infammo
import g_scoutgravitymodifier
import g_scoutdamagefactor
import g_scoutfirespeed
import g_scoutspeedfactor
import g_amguided
import g_amhoming
import g_ftguided
import g_fthoming
import g_ngguided
import g_nghoming
import g_bfgguided
import g_bfghoming
import g_pgguided
import g_pghoming
import g_rlguided
import g_rlhoming
import g_glguided
import g_glhoming
import g_amknockback
import g_ambouncemodifier
import g_aminf
import g_amvampire
import g_amgravity
import g_ambounce
import g_amtimeout
import g_amdamage
import g_amsdamage
import g_amspeed
import g_amsradius
import g_amdelay
import g_ftknockback
import g_ftbouncemodifier
import g_ftinf
import g_ftvampire
import g_ftgravity
import g_ftbounce
import g_fttimeout
import g_ftdamage
import g_ftsdamage
import g_ftspeed
import g_ftsradius
import g_ftdelay
import g_cgknockback
import g_cginf
import g_cgvampire
import g_cgspread
import g_cgdamage
import g_cgdelay
import g_plknockback
import g_plinf
import g_plvampire
import g_plgravity
import g_pldamage
import g_plsdamage
import g_plsradius
import g_pltimeout
import g_plspeed
import g_pldelay
import g_ngknockback
import g_ngbouncemodifier
import g_nginf
import g_ngvampire
import g_ngrandom
import g_nggravity
import g_ngbounce
import g_ngcount
import g_ngtimeout
import g_ngdamage
import g_ngspread
import g_ngspeed
import g_ngdelay
import g_bfgknockback
import g_bfgbouncemodifier
import g_bfginf
import g_bfgvampire
import g_bfggravity
import g_bfgbounce
import g_bfgdamage
import g_bfgsdamage
import g_bfgsradius
import g_bfgtimeout
import g_bfgspeed
import g_bfgdelay
import g_pgknockback
import g_pgbouncemodifier
import g_pginf
import g_pgvampire
import g_pggravity
import g_pgbounce
import g_pgtimeout
import g_pgdamage
import g_pgsdamage
import g_pgspeed
import g_pgsradius
import g_pgdelay
import g_rgknockback
import g_rginf
import g_rgvampire
import g_rgdamage
import g_rgdelay
import g_lgknockback
import g_lginf
import g_lgvampire
import g_lgsradius
import g_lgsdamage
import g_lgexplode
import g_lgrange
import g_lgdelay
import g_lgdamage
import g_rlknockback
import g_rlbouncemodifier
import g_rlinf
import g_rlvampire
import g_rlgravity
import g_rlbounce
import g_rldamage
import g_rlsdamage
import g_rlsradius
import g_rltimeout
import g_rlspeed
import g_rldelay
import g_glknockback
import g_glbouncemodifier
import g_glinf
import g_glvampire
import g_glgravity
import g_glbounce
import g_gldamage
import g_glsdamage
import g_glsradius
import g_gltimeout
import g_glspeed
import g_gldelay
import g_sgknockback
import g_sginf
import g_sgvampire
import g_sgcount
import g_sgsradius
import g_sgsdamage
import g_sgexplode
import g_sgspread
import g_sgdamage
import g_sgdelay
import g_mgknockback
import g_mginf
import g_mgvampire
import g_mgsradius
import g_mgsdamage
import g_mgexplode
import g_mgspread
import g_mgdamage
import g_mgdelay
import g_gknockback
import g_grange
import g_gdamage
import g_gdelay
import mod_ghtimeout
import g_ghtimeout
import g_ghspeed
import g_minigame
import g_physdamage
import g_physimpulse
import g_physimpact
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
import mod_gravity
import mod_zsround
import mod_zround
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_teamred_damage
import mod_teamblue_damage
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_noplayerclip
import mod_flighttime
import mod_regentime
import mod_invistime
import mod_hastetime
import mod_bsuittime
import mod_quadtime
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_poweruptime
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_vampire_max_health
import mod_amdelay
import mod_ftdelay
import mod_cgspread
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgrange
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgcount
import mod_sgspread
import mod_sgdelay
import mod_mgspread
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_ammolimit
import cmapname
import CustomModRun
import Newmodcommands
import nailgun_think
import bfg_think
import grenade_think
import rocket_think
import plasma_think
import G_SendSwepWeapons
import G_SendWeaponProperties
import g_entities
import level
import Team_ForceGesture
import Team_DD_bonusAtPoints
import Team_RemoveDoubleDominationPoints
import Team_SpawnDoubleDominationPoints
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import Team_Dom_SpawnPoints
import SelectDoubleDominationSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import G_LoadMapfileAll_f
import G_LoadMapfile_f
import G_LoadMapfileAll
import G_LoadMapfile
import G_WriteMapfileAll_f
import G_WriteMapfile_f
import G_ClassnameAllowedAll
import G_ClassnameAllowed
import G_GetMapLockArena
import SkippedChar
import G_LoadMapcycle
import G_sendMapcycle
import G_drawMapcycle
import G_drawAllowedMaps
import G_mapIsVoteable
import G_GetMapfile
import G_GetNextMap
import G_GetNextMapCycle
import G_GotoNextMapCycle
import getCustomVote
import VoteParseCustomVotes
import allowedFraglimit
import allowedTimelimit
import allowedGametype
import allowedMap
import getMappage
import custom_vote_info
import ClientLeaving
import CountVotes
import CheckVote
import allowedVote
import PlayerStore_restore
import PlayerStore_store
import PlayerStoreInit
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_SaveClientSessionDataSave
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_TeamFromString
import ShuffleTeams
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_DefaultSwep
import G_CheckSwepAmmo
import G_CheckSwep
import G_RunClient
import ClientEndFrame
import ClientThink
import PrecacheBotAssets
import SetCustomWeapons
import SetSandboxWeapons
import SetUnlimitedWeapons
import SetupCustomBot
import LinkBotSpawnEntity
import DropClientSilently
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_NpcFactionProp
import G_LevelLoadComplete
import CheckTeamVote
import LogExit
import G_Error
import G_Printf
import SendYourTeamMessageToTeam
import SendDominationPointsStatusMessageToAllClients
import SendDDtimetakenMessageToAllClients
import SendEliminationMessageToAllClients
import SendScoreboardMessageToAllClients
import G_LogPrintf
import ExitLevel
import AddTournamentQueue
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import SendCustomVoteCommands
import DominationPointStatusMessage
import DominationPointNamesMessage
import RespawnTimeMessage
import EliminationMessage
import ObeliskHealthMessage
import AttackingTeamMessage
import YourTeamMessage
import DoubleDominationScoreTimeMessage
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import G_StartCarExplode
import G_StartKamikaze
import KamikazeShockWave
import KamikazeRadiusDamage
import CarExplodeDamage
import KamikazeDamage
import FireWeapon
import ClientForString
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpawnPointIsActive
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import ClientRespawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import LMSpoint
import EndEliminationRound
import DisableWeapons
import EnableWeapons
import RespawnDead
import RespawnAll
import TeamHealthCount
import TeamLivingCount
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Laser_Think
import Laser_Gen
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import lock_touch
import trigger_teleporter_touch
import Break_Breakable
import Touch_DoorTrigger
import G_RunMover
import fire_antimatter
import fire_flame
import fire_prox
import fire_nail
import fire_nails
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_custom
import fire_blaster
import ProximityMine_RemoveAll
import G_RunMissile
import TossClientCubes
import TossClientPersistantPowerups
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_ExitVehicle
import G_CarDamage
import G_PropDamage
import G_Damage
import CanDamage
import target_finish_use
import target_finish_think
import BuildShaderStateConfig
import AddRemap
import G_SetTargetname
import G_SetTarget
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_GlobalSound
import G_Sound
import G_TempEntity
import G_Spawn
import findradius
import G_InitGentity
import CrosshairPointGravity
import CrosshairPointPhys
import FindEntityForGravitygun
import FindEntityForPhysgun
import VehiclePhys
import botsandbox_check
import G_CalculatePlayerScore
import G_FadeIn
import G_FadeOut
import G_Fade
import G_GetScoringMapName
import G_SetMovedir
import G_UseDeathTargets
import G_UseTargets
import G_PickTarget
import G_ScrFind
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import Throw_Item
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item2
import Touch_Item
import Set_Weapon
import Set_Ammo
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchBackpack
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItemCtf
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import writeFile_string
import writeFile_int
import readFile_string
import readFile_int
import SanitizeString
import G_ClientIsLagging
import G_ClientNumberFromString
import Cmd_AdminMessage_f
import G_FloodLimited
import G_ClientNumbersFromString
import G_SanitiseString
import G_MatchOnePlayer
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import NextCustomRound_f
import G_Say
import ConcatArgs
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector4
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import MiTechEntityList
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
LABELV $885
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 40
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 41
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $881
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 40
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 41
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $869
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 40
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 41
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $730
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $695
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 79
byte 1 119
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $464
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 110
byte 1 100
byte 1 114
byte 1 111
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $411
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $367
byte 1 104
byte 1 105
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $362
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 95
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $330
byte 1 104
byte 1 105
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $325
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 95
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $259
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $243
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $224
byte 1 37
byte 1 46
byte 1 52
byte 1 102
byte 1 0
align 1
LABELV $213
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $212
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $211
byte 1 49
byte 1 0
align 1
LABELV $210
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $208
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $207
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $190
byte 1 48
byte 1 0
align 1
LABELV $189
byte 1 102
byte 1 50
byte 1 0
align 1
LABELV $188
byte 1 97
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $187
byte 1 97
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $186
byte 1 97
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $185
byte 1 111
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $184
byte 1 111
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $183
byte 1 111
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $182
byte 1 109
byte 1 0
align 1
LABELV $179
byte 1 102
byte 1 49
byte 1 0
align 1
LABELV $175
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $174
byte 1 116
byte 1 0
align 1
LABELV $173
byte 1 119
byte 1 0
align 1
LABELV $171
byte 1 97
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $170
byte 1 97
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $169
byte 1 97
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $167
byte 1 111
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $166
byte 1 111
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $165
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $164
byte 1 111
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $156
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 115
byte 1 110
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $155
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $153
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $151
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $150
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $146
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $145
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $144
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $142
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $141
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $138
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $137
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $135
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $134
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $133
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $132
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $131
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $129
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 99
byte 1 117
byte 1 116
byte 1 115
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $124
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 0
align 1
LABELV $123
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $122
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 101
byte 1 97
byte 1 114
byte 1 116
byte 1 104
byte 1 113
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $119
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $118
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $117
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $115
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $114
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $112
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $108
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $107
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $106
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $105
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 0
align 1
LABELV $104
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $102
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $101
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $100
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $99
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $97
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $96
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $94
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $92
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $91
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $90
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $87
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $86
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $85
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $84
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $83
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $82
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $81
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $80
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $79
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $78
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $77
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $76
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $75
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $74
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $73
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $72
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $71
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $70
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 100
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $69
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $68
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $67
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $66
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $65
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
