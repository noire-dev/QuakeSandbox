export G_SpawnString
code
proc G_SpawnString 8 8
file "../../../code/game/g_spawn.c"
line 26
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
;23:
;24:#include "g_local.h"
;25:
;26:qboolean	G_SpawnString( const char *key, const char *defaultString, char **out ) {
line 29
;27:	int		i;
;28:
;29:	if ( !level.spawning ) {
ADDRGP4 level+5288
INDIRI4
CNSTI4 0
NEI4 $65
line 30
;30:		*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 32
;31://		G_Error( "G_SpawnString() called while not spawning" );
;32:	}
LABELV $65
line 34
;33:
;34:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $68
line 35
;35:		if ( !Q_stricmp( key, level.spawnVars[i][0] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+5296
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $73
line 36
;36:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+5296+4
ADDP4
INDIRP4
ASGNP4
line 37
;37:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $64
JUMPV
LABELV $73
line 39
;38:		}
;39:	}
LABELV $69
line 34
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $71
ADDRLP4 0
INDIRI4
ADDRGP4 level+5292
INDIRI4
LTI4 $68
line 41
;40:
;41:	*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 42
;42:	return qfalse;
CNSTI4 0
RETI4
LABELV $64
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 45
;43:}
;44:
;45:qboolean	G_SpawnFloat( const char *key, const char *defaultString, float *out ) {
line 49
;46:	char		*s;
;47:	qboolean	present;
;48:
;49:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 50
;50:	*out = atof( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 51
;51:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $78
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 54
;52:}
;53:
;54:qboolean	G_SpawnInt( const char *key, const char *defaultString, int *out ) {
line 58
;55:	char		*s;
;56:	qboolean	present;
;57:
;58:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 59
;59:	*out = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 60
;60:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $79
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 63
;61:}
;62:
;63:qboolean	G_SpawnVector( const char *key, const char *defaultString, float *out ) {
line 67
;64:	char		*s;
;65:	qboolean	present;
;66:
;67:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 68
;68:	sscanf( s, "%f %f %f", &out[0], &out[1], &out[2] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 69
;69:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $80
endproc G_SpawnVector 16 20
export G_SpawnVector4
proc G_SpawnVector4 16 24
line 72
;70:}
;71:
;72:qboolean	G_SpawnVector4( const char *key, const char *defaultString, float *out ) {
line 76
;73:	char		*s;
;74:	qboolean	present;
;75:
;76:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 77
;77:	sscanf( s, "%f %f %f %f", &out[0], &out[1], &out[2], &out[3] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $83
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 78
;78:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $82
endproc G_SpawnVector4 16 24
data
export fields
align 4
LABELV fields
address $86
byte 4 564
byte 4 2
skip 4
address $87
byte 4 92
byte 4 4
skip 4
address $88
byte 4 580
byte 4 2
skip 4
address $89
byte 4 584
byte 4 2
skip 4
address $90
byte 4 568
byte 4 0
skip 4
address $91
byte 4 744
byte 4 1
skip 4
address $92
byte 4 720
byte 4 2
skip 4
address $93
byte 4 724
byte 4 2
skip 4
address $94
byte 4 680
byte 4 2
skip 4
address $95
byte 4 684
byte 4 2
skip 4
address $96
byte 4 728
byte 4 2
skip 4
address $97
byte 4 1012
byte 4 1
skip 4
address $98
byte 4 1016
byte 4 1
skip 4
address $99
byte 4 944
byte 4 0
skip 4
address $100
byte 4 948
byte 4 0
skip 4
address $101
byte 4 812
byte 4 0
skip 4
address $102
byte 4 808
byte 4 0
skip 4
address $103
byte 4 0
byte 4 9
skip 4
address $104
byte 4 924
byte 4 0
skip 4
address $105
byte 4 2248
byte 4 0
skip 4
address $106
byte 4 2252
byte 4 0
skip 4
address $107
byte 4 2256
byte 4 0
skip 4
address $108
byte 4 2260
byte 4 0
skip 4
address $109
byte 4 2264
byte 4 0
skip 4
address $110
byte 4 2268
byte 4 0
skip 4
address $111
byte 4 2272
byte 4 0
skip 4
address $112
byte 4 2276
byte 4 0
skip 4
address $113
byte 4 2280
byte 4 0
skip 4
address $114
byte 4 2284
byte 4 0
skip 4
address $115
byte 4 2288
byte 4 0
skip 4
address $116
byte 4 128
byte 4 4
skip 4
address $117
byte 4 128
byte 4 5
skip 4
address $118
byte 4 732
byte 4 2
skip 4
address $119
byte 4 736
byte 4 2
skip 4
address $120
byte 4 1068
byte 4 2
skip 4
address $121
byte 4 1064
byte 4 2
skip 4
address $122
byte 4 1072
byte 4 2
skip 4
address $123
byte 4 2172
byte 4 2
skip 4
address $124
byte 4 2176
byte 4 2
skip 4
address $125
byte 4 2180
byte 4 1
skip 4
address $126
byte 4 2184
byte 4 2
skip 4
address $127
byte 4 2100
byte 4 2
skip 4
address $128
byte 4 2104
byte 4 2
skip 4
address $129
byte 4 2108
byte 4 2
skip 4
address $130
byte 4 2188
byte 4 2
skip 4
address $131
byte 4 2192
byte 4 2
skip 4
address $132
byte 4 2196
byte 4 0
skip 4
address $133
byte 4 2212
byte 4 2
skip 4
address $134
byte 4 876
byte 4 2
skip 4
address $135
byte 4 872
byte 4 2
skip 4
address $136
byte 4 880
byte 4 2
skip 4
address $137
byte 4 844
byte 4 0
skip 4
address $138
byte 4 848
byte 4 1
skip 4
address $139
byte 4 852
byte 4 1
skip 4
address $140
byte 4 856
byte 4 1
skip 4
address $141
byte 4 860
byte 4 1
skip 4
address $142
byte 4 864
byte 4 1
skip 4
address $143
byte 4 868
byte 4 1
skip 4
address $144
byte 4 608
byte 4 1
skip 4
address $145
byte 4 1052
byte 4 0
skip 4
address $146
byte 4 884
byte 4 0
skip 4
address $147
byte 4 888
byte 4 0
skip 4
address $148
byte 4 892
byte 4 0
skip 4
address $149
byte 4 824
byte 4 0
skip 4
address $150
byte 4 900
byte 4 0
skip 4
address $151
byte 4 904
byte 4 0
skip 4
address $152
byte 4 908
byte 4 0
skip 4
address $153
byte 4 912
byte 4 0
skip 4
address $154
byte 4 896
byte 4 0
skip 4
address $155
byte 4 916
byte 4 0
skip 4
address $156
byte 4 920
byte 4 0
skip 4
address $157
byte 4 1056
byte 4 0
skip 4
address $158
byte 4 1044
byte 4 1
skip 4
address $159
byte 4 1048
byte 4 0
skip 4
byte 4 0
skip 12
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 306
;79:}
;80:
;81:
;82://
;83:// fields are needed for spawning from the entity string
;84://
;85:typedef enum {
;86:	F_INT, 
;87:	F_FLOAT,
;88:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;89:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;90:	F_VECTOR,
;91:	F_ANGLEHACK,
;92:	F_ENTITY,			// index on disk, pointer in memory
;93:	F_ITEM,				// index on disk, pointer in memory
;94:	F_CLIENT,			// index on disk, pointer in memory
;95:	F_IGNORE
;96:} fieldtype_t;
;97:
;98:typedef struct
;99:{
;100:	char	*name;
;101:	int		ofs;
;102:	fieldtype_t	type;
;103:	int		flags;
;104:} field_t;
;105:
;106:field_t fields[] = {
;107:	{"classname", FOFS(classname), F_LSTRING},
;108:	{"origin", FOFS(s.origin), F_VECTOR},
;109:	{"model", FOFS(model), F_LSTRING},
;110:	{"model2", FOFS(model2), F_LSTRING},
;111:	{"spawnflags", FOFS(spawnflags), F_INT},
;112:	{"speed", FOFS(speed), F_FLOAT},
;113:	{"target", FOFS(target), F_LSTRING},
;114:	{"targetname", FOFS(targetname), F_LSTRING},
;115:	{"message", FOFS(message), F_LSTRING},
;116:	{"messageru", FOFS(messageru), F_LSTRING},
;117:	{"team", FOFS(team), F_LSTRING},
;118:	{"wait", FOFS(wait), F_FLOAT},
;119:	{"random", FOFS(random), F_FLOAT},
;120:	{"count", FOFS(count), F_INT},
;121:	{"playerangle", FOFS(playerangle), F_INT},
;122:	{"price", FOFS(price), F_INT},
;123:	{"health", FOFS(health), F_INT},
;124:	{"light", 0, F_IGNORE},
;125:	{"dmg", FOFS(damage), F_INT},
;126:	{"mtype", FOFS(mtype), F_INT},
;127:	{"mtimeout", FOFS(mtimeout), F_INT},
;128:	{"mhoming", FOFS(mhoming), F_INT},
;129:	{"mspeed", FOFS(mspeed), F_INT},
;130:	{"mbounce", FOFS(mbounce), F_INT},
;131:	{"mdamage", FOFS(mdamage), F_INT},
;132:	{"msdamage", FOFS(msdamage), F_INT},
;133:	{"msradius", FOFS(msradius), F_INT},
;134:	{"mgravity", FOFS(mgravity), F_INT},
;135:	{"mnoclip", FOFS(mnoclip), F_INT},
;136:	{"allowuse", FOFS(allowuse), F_INT},
;137:	{"angles", FOFS(s.angles), F_VECTOR},
;138:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;139:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;140:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;141:	{"mapname", FOFS(mapname), F_LSTRING},
;142:	{"clientname", FOFS(clientname), F_LSTRING},
;143:	{"teleporterTarget", FOFS(teleporterTarget), F_LSTRING},
;144:	{"deathTarget", FOFS(deathTarget), F_LSTRING},
;145:	{"lootTarget", FOFS(lootTarget), F_LSTRING},
;146:	{"skill", FOFS(skill), F_FLOAT},
;147:	{"overlay", FOFS(overlay), F_LSTRING},
;148:	{"target2", FOFS(target2), F_LSTRING},
;149:	{"damagetarget", FOFS(damagetarget), F_LSTRING},
;150:	{"targetname2", FOFS(targetname2), F_LSTRING},
;151:	{"key", FOFS(key), F_LSTRING},
;152:	{"value", FOFS(value), F_LSTRING},
;153:	{"armor", FOFS(armor), F_INT},
;154:	{"music", FOFS(music), F_LSTRING},
;155:	{"sb_model", FOFS(sb_model), F_LSTRING},
;156:	{"sb_class", FOFS(sb_class), F_LSTRING},
;157:	{"sb_sound", FOFS(sb_sound), F_LSTRING},
;158:	{"sb_coltype", FOFS(sb_coltype), F_INT},
;159:	{"sb_colscale0", FOFS(sb_colscale0), F_FLOAT},
;160:	{"sb_colscale1", FOFS(sb_colscale1), F_FLOAT},
;161:	{"sb_colscale2", FOFS(sb_colscale2), F_FLOAT},
;162:	{"sb_rotate0", FOFS(sb_rotate0), F_FLOAT},
;163:	{"sb_rotate1", FOFS(sb_rotate1), F_FLOAT},
;164:	{"sb_rotate2", FOFS(sb_rotate2), F_FLOAT},
;165:	{"physicsBounce", FOFS(physicsBounce), F_FLOAT},
;166:	{"vehicle", FOFS(vehicle), F_INT},
;167:	{"sb_generic1", FOFS(sb_generic1), F_INT},
;168:	{"sb_phys", FOFS(sb_phys), F_INT},
;169:	{"sb_coll", FOFS(sb_coll), F_INT},
;170:	{"locked", FOFS(locked), F_INT},
;171:	{"sb_red", FOFS(sb_red), F_INT},
;172:	{"sb_green", FOFS(sb_green), F_INT},
;173:	{"sb_blue", FOFS(sb_blue), F_INT},
;174:	{"sb_radius", FOFS(sb_radius), F_INT},
;175:	{"sb_ettype", FOFS(sb_ettype), F_INT},
;176:	{"sb_takedamage", FOFS(sb_takedamage), F_INT},
;177:	{"sb_takedamage2", FOFS(sb_takedamage2), F_INT},
;178:	{"objectType", FOFS(objectType), F_INT},
;179:	
;180:	{"distance", FOFS(distance), F_FLOAT},
;181:	{"type", FOFS(type), F_INT},
;182:	
;183:	{NULL}
;184:};
;185:
;186:
;187:typedef struct {
;188:	char	*name;
;189:	void	(*spawn)(gentity_t *ent);
;190:} spawn_t;
;191:
;192:void SP_info_player_start (gentity_t *ent);
;193:void SP_info_player_deathmatch (gentity_t *ent);
;194:void SP_info_player_intermission (gentity_t *ent);
;195://For Double Domination:
;196:void SP_info_player_dd (gentity_t *ent);
;197:void SP_info_player_dd_red (gentity_t *ent);
;198:void SP_info_player_dd_blue (gentity_t *ent);
;199://standard domination:
;200:void SP_domination_point ( gentity_t *ent);
;201:
;202:void SP_info_firstplace(gentity_t *ent);
;203:void SP_info_secondplace(gentity_t *ent);
;204:void SP_info_thirdplace(gentity_t *ent);
;205:void SP_info_podium(gentity_t *ent);
;206:void SP_info_waypoint( gentity_t *self );
;207:void SP_info_backpack( gentity_t *self );
;208:
;209:void SP_func_plat (gentity_t *ent);
;210:void SP_func_static (gentity_t *ent);
;211:void SP_func_prop (gentity_t *ent);
;212:void SP_func_breakable (gentity_t *ent);
;213:void SP_func_rotating (gentity_t *ent);
;214:void SP_func_bobbing (gentity_t *ent);
;215:void SP_func_pendulum( gentity_t *ent );
;216:void SP_func_button (gentity_t *ent);
;217:void SP_func_door (gentity_t *ent);
;218:void SP_func_train (gentity_t *ent);
;219:void SP_func_timer (gentity_t *self);
;220:
;221:void SP_trigger_always (gentity_t *ent);
;222:void SP_trigger_multiple (gentity_t *ent);
;223:void SP_trigger_push (gentity_t *ent);
;224:void SP_trigger_teleport (gentity_t *ent);
;225:void SP_trigger_hurt (gentity_t *ent);
;226:
;227:void SP_trigger_death (gentity_t *ent);
;228:void SP_trigger_frag (gentity_t *ent);
;229:void SP_trigger_lock (gentity_t *ent);
;230:
;231:void SP_target_remove_powerups( gentity_t *ent );
;232:void SP_target_give (gentity_t *ent);
;233:void SP_target_delay (gentity_t *ent);
;234:void SP_target_speaker (gentity_t *ent);
;235:void SP_target_print (gentity_t *ent);
;236:void SP_target_laser (gentity_t *self);
;237:void SP_target_character (gentity_t *ent);
;238:void SP_target_score( gentity_t *ent );
;239:void SP_target_clienttarg( gentity_t *ent );
;240:void SP_target_teleporter( gentity_t *ent );
;241:void SP_target_relay (gentity_t *ent);
;242:void SP_target_kill (gentity_t *ent);
;243:void SP_target_position (gentity_t *ent);
;244:void SP_target_location (gentity_t *ent);
;245:void SP_target_push (gentity_t *ent);
;246:void SP_target_logic (gentity_t *ent);
;247:void SP_target_gravity (gentity_t *ent);
;248:void SP_target_mapchange (gentity_t *ent);
;249:void SP_target_botspawn (gentity_t *ent);
;250:void SP_target_unlink (gentity_t *ent);
;251:void SP_target_playerspeed (gentity_t *ent);
;252:void SP_target_debrisemitter (gentity_t *ent);
;253:void SP_target_objective (gentity_t *ent);
;254:void SP_target_skill (gentity_t *ent);
;255:void SP_target_earthquake (gentity_t *ent);
;256:void SP_target_effect (gentity_t *ent);
;257:void SP_target_finish (gentity_t *ent);
;258:void SP_target_modify (gentity_t *ent);
;259:void SP_target_secret (gentity_t *ent);
;260:void SP_target_playerstats (gentity_t *ent);
;261:void SP_target_variable (gentity_t *ent);
;262:void SP_target_cutscene (gentity_t *ent);
;263:void SP_target_botremove (gentity_t *ent);
;264:void SP_target_music (gentity_t *ent);
;265:void SP_target_stats (gentity_t *ent);
;266:
;267:void SP_script_variable (gentity_t *ent);
;268:void SP_script_layer (gentity_t *ent);
;269:void SP_script_cmd (gentity_t *ent);
;270:void SP_script_menu (gentity_t *ent);
;271:void SP_script_aicontrol (gentity_t *ent);
;272:
;273:void SP_light (gentity_t *self);
;274:void SP_info_null (gentity_t *self);
;275:void SP_info_notnull (gentity_t *self);
;276:void SP_info_camp (gentity_t *self);
;277:void SP_info_camera (gentity_t *self);
;278:void SP_path_corner (gentity_t *self);
;279:
;280:void SP_misc_teleporter_dest (gentity_t *self);
;281:void SP_misc_model(gentity_t *ent);
;282:void SP_misc_portal_camera(gentity_t *ent);
;283:void SP_misc_portal_surface(gentity_t *ent);
;284:
;285:void SP_shooter_rocket( gentity_t *ent );
;286:void SP_shooter_plasma( gentity_t *ent );
;287:void SP_shooter_grenade( gentity_t *ent );
;288:void SP_shooter_bfg( gentity_t *ent );
;289:void SP_shooter_prox( gentity_t *ent );
;290:void SP_shooter_flame( gentity_t *ent );
;291:void SP_shooter_antimatter( gentity_t *ent );
;292:void SP_shooter_custom( gentity_t *ent );
;293:
;294:void SP_team_CTF_redplayer( gentity_t *ent );
;295:void SP_team_CTF_blueplayer( gentity_t *ent );
;296:
;297:void SP_team_CTF_redspawn( gentity_t *ent );
;298:void SP_team_CTF_bluespawn( gentity_t *ent );
;299:
;300:void SP_func_door_rotating( gentity_t *ent );
;301:
;302:void SP_team_blueobelisk( gentity_t *ent );
;303:void SP_team_redobelisk( gentity_t *ent );
;304:void SP_team_neutralobelisk( gentity_t *ent );
;305:
;306:void SP_item_botroam( gentity_t *ent ) { }
LABELV $161
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $162
address SP_info_player_start
address $163
address SP_info_player_deathmatch
address $164
address SP_info_player_intermission
address $165
address SP_info_player_dd
address $166
address SP_info_player_dd_red
address $167
address SP_info_player_dd_blue
address $168
address SP_domination_point
address $169
address SP_info_null
address $170
address SP_info_notnull
address $171
address SP_info_camp
address $172
address SP_info_waypoint
address $173
address SP_info_backpack
address $174
address SP_info_camera
address $175
address SP_func_plat
address $176
address SP_func_button
address $177
address SP_func_door
address $178
address SP_func_static
address $179
address SP_func_prop
address $180
address SP_func_rotating
address $181
address SP_func_bobbing
address $182
address SP_func_pendulum
address $183
address SP_func_train
address $184
address SP_info_null
address $185
address SP_func_timer
address $186
address SP_func_breakable
address $185
address SP_func_timer
address $187
address SP_trigger_always
address $188
address SP_trigger_multiple
address $189
address SP_trigger_push
address $190
address SP_trigger_teleport
address $191
address SP_trigger_hurt
address $192
address SP_trigger_death
address $193
address SP_trigger_frag
address $194
address SP_trigger_lock
address $195
address SP_target_give
address $196
address SP_target_remove_powerups
address $197
address SP_target_delay
address $198
address SP_target_speaker
address $199
address SP_target_print
address $200
address SP_target_laser
address $201
address SP_target_score
address $202
address SP_target_clienttarg
address $203
address SP_target_teleporter
address $204
address SP_target_relay
address $205
address SP_target_kill
address $206
address SP_target_position
address $207
address SP_target_location
address $208
address SP_target_push
address $209
address SP_target_logic
address $210
address SP_target_gravity
address $211
address SP_target_mapchange
address $212
address SP_target_botspawn
address $213
address SP_target_unlink
address $214
address SP_target_unlink
address $215
address SP_target_debrisemitter
address $216
address SP_target_objective
address $217
address SP_target_skill
address $218
address SP_target_earthquake
address $219
address SP_target_effect
address $220
address SP_target_finish
address $221
address SP_target_modify
address $222
address SP_target_secret
address $223
address SP_target_playerstats
address $224
address SP_target_variable
address $225
address SP_target_cutscene
address $226
address SP_target_botremove
address $227
address SP_target_music
address $228
address SP_target_stats
address $229
address SP_script_variable
address $230
address SP_script_layer
address $231
address SP_script_cmd
address $232
address SP_script_menu
address $233
address SP_script_aicontrol
address $103
address SP_light
address $234
address SP_path_corner
address $235
address SP_misc_teleporter_dest
address $236
address SP_misc_model
address $237
address SP_misc_portal_surface
address $238
address SP_misc_portal_camera
address $239
address SP_shooter_rocket
address $240
address SP_shooter_grenade
address $241
address SP_shooter_plasma
address $242
address SP_shooter_bfg
address $243
address SP_shooter_prox
address $244
address SP_shooter_flame
address $245
address SP_shooter_antimatter
address $246
address SP_shooter_custom
address $247
address SP_team_CTF_redplayer
address $248
address SP_team_CTF_blueplayer
address $249
address SP_team_CTF_redspawn
address $250
address SP_team_CTF_bluespawn
address $251
address SP_func_door_rotating
address $252
address SP_team_redobelisk
address $253
address SP_team_blueobelisk
address $254
address SP_team_neutralobelisk
address $255
address SP_item_botroam
address $256
address SP_rally_weather_rain
address $257
address SP_rally_weather_snow
byte 4 0
byte 4 0
export G_WLK_GetLeft
code
proc G_WLK_GetLeft 8 8
line 448
;307:
;308:// weather
;309:void SP_rally_weather_rain( gentity_t *ent );
;310:void SP_rally_weather_snow( gentity_t *ent );
;311:
;312:spawn_t	spawns[] = {
;313:	// info entities don't do anything at all, but provide positional
;314:	// information for things controlled by other processes
;315:	{"info_player_start", SP_info_player_start},
;316:	{"info_player_deathmatch", SP_info_player_deathmatch},
;317:	{"info_player_intermission", SP_info_player_intermission},
;318://Double Domination player spawn:
;319:	{"info_player_dd", SP_info_player_dd},
;320:        {"info_player_dd_red", SP_info_player_dd_red},
;321:        {"info_player_dd_blue", SP_info_player_dd_blue},
;322://Standard Domination point spawn:
;323:	{"domination_point", SP_domination_point},
;324:
;325:
;326:	{"info_null", SP_info_null},
;327:	{"info_notnull", SP_info_notnull},		// use target_position instead
;328:	{"info_camp", SP_info_camp},
;329:	{"info_waypoint", SP_info_waypoint},
;330:	{"info_backpack", SP_info_backpack},
;331:	{"info_camera", SP_info_camera},
;332:
;333:	{"func_plat", SP_func_plat},
;334:	{"func_button", SP_func_button},
;335:	{"func_door", SP_func_door},
;336:	{"func_static", SP_func_static},
;337:	{"func_prop", SP_func_prop},
;338:	{"func_rotating", SP_func_rotating},
;339:	{"func_bobbing", SP_func_bobbing},
;340:	{"func_pendulum", SP_func_pendulum},
;341:	{"func_train", SP_func_train},
;342:	{"func_group", SP_info_null},
;343:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;344:	{"func_breakable", SP_func_breakable},
;345:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;346:
;347:	// Triggers are brush objects that cause an effect when contacted
;348:	// by a living player, usually involving firing targets.
;349:	// While almost everything could be done with
;350:	// a single trigger class and different targets, triggered effects
;351:	// could not be client side predicted (push and teleport).
;352:	{"trigger_always", SP_trigger_always},
;353:	{"trigger_multiple", SP_trigger_multiple},
;354:	{"trigger_push", SP_trigger_push},
;355:	{"trigger_teleport", SP_trigger_teleport},
;356:	{"trigger_hurt", SP_trigger_hurt},
;357:	{"trigger_death", SP_trigger_death},
;358:	{"trigger_frag", SP_trigger_frag},
;359:	{"trigger_lock", SP_trigger_lock},
;360:
;361:	// targets perform no action by themselves, but must be triggered
;362:	// by another entity
;363:	{"target_give", SP_target_give},
;364:	{"target_remove_powerups", SP_target_remove_powerups},
;365:	{"target_delay", SP_target_delay},
;366:	{"target_speaker", SP_target_speaker},
;367:	{"target_print", SP_target_print},
;368:	{"target_laser", SP_target_laser},
;369:	{"target_score", SP_target_score},
;370:	{"target_clienttarg", SP_target_clienttarg},
;371:	
;372:	{"target_teleporter", SP_target_teleporter},
;373:	{"target_relay", SP_target_relay},
;374:	{"target_kill", SP_target_kill},
;375:	{"target_position", SP_target_position},
;376:	{"target_location", SP_target_location},
;377:	{"target_push", SP_target_push},
;378:	{"target_logic", SP_target_logic},
;379:	{"target_gravity", SP_target_gravity},
;380:	{"target_mapchange", SP_target_mapchange},
;381:	{"target_botspawn", SP_target_botspawn},
;382:	{"target_unlink", SP_target_unlink},
;383:	{"target_disable", SP_target_unlink},
;384:	{"target_debrisemitter", SP_target_debrisemitter},
;385:	{"target_objective", SP_target_objective},
;386:	{"target_skill", SP_target_skill},
;387:	{"target_earthquake", SP_target_earthquake},
;388:	{"target_effect", SP_target_effect},
;389:	{"target_finish", SP_target_finish},
;390:	{"target_modify", SP_target_modify},
;391:	{"target_secret", SP_target_secret},
;392:	{"target_playerstats", SP_target_playerstats},
;393:	{"target_variable", SP_target_variable},
;394:	{"target_cutscene", SP_target_cutscene},
;395:	{"target_botremove", SP_target_botremove},
;396:	{"target_music", SP_target_music},
;397:	{"target_stats", SP_target_stats},
;398:	
;399:	{"script_variable", SP_script_variable},
;400:	{"script_layer", SP_script_layer},
;401:	{"script_cmd", SP_script_cmd},
;402:	{"script_menu", SP_script_menu},
;403:	{"script_aicontrol", SP_script_aicontrol},
;404:
;405:	{"light", SP_light},
;406:	{"path_corner", SP_path_corner},
;407:
;408:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;409:	{"misc_model", SP_misc_model},
;410:	{"misc_portal_surface", SP_misc_portal_surface},
;411:	{"misc_portal_camera", SP_misc_portal_camera},
;412:
;413:	{"shooter_rocket", SP_shooter_rocket},
;414:	{"shooter_grenade", SP_shooter_grenade},
;415:	{"shooter_plasma", SP_shooter_plasma},
;416:	{"shooter_bfg", SP_shooter_bfg},
;417:	{"shooter_prox", SP_shooter_prox},
;418:	{"shooter_flame", SP_shooter_flame},
;419:	{"shooter_antimatter", SP_shooter_antimatter},
;420:	{"shooter_custom", SP_shooter_custom},
;421:
;422:	{"team_CTF_redplayer", SP_team_CTF_redplayer},
;423:	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},
;424:
;425:	{"team_CTF_redspawn", SP_team_CTF_redspawn},
;426:	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},
;427:
;428:	{"func_door_rotating", SP_func_door_rotating},
;429:
;430:	{"team_redobelisk", SP_team_redobelisk},
;431:	{"team_blueobelisk", SP_team_blueobelisk},
;432:	{"team_neutralobelisk", SP_team_neutralobelisk},
;433:
;434:	{"item_botroam", SP_item_botroam},
;435:
;436:	{"environment_rain", SP_rally_weather_rain},
;437:	{"environment_snow", SP_rally_weather_snow},
;438:
;439:	{NULL, 0}
;440:};
;441:
;442:/*
;443:*****************
;444:G_WLF_GetLeft
;445:*****************
;446:*/
;447:void G_WLK_GetLeft(const char *pszSource, char *pszDest,  int iLen)
;448:{
line 452
;449:	int iSize; //size of string we need to copy
;450:
;451:	//see how much space we need
;452:	iSize = strlen(pszSource);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 455
;453:	
;454:	//is len less that size?
;455:	if(iLen < iSize)
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $259
line 456
;456:		iSize = iLen;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $259
line 459
;457:
;458:	//make a copy of the string
;459:	strcpy(pszDest, pszSource);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 462
;460:
;461:	//end the string at iSize
;462:	pszDest[iSize] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 463
;463:}
LABELV $258
endproc G_WLK_GetLeft 8 8
export G_CallSpawn
proc G_CallSpawn 292 16
line 473
;464:
;465:/*
;466:===============
;467:G_CallSpawn
;468:
;469:Finds the spawn function for the entity and calls it,
;470:returning qfalse if not found
;471:===============
;472:*/
;473:qboolean G_CallSpawn( gentity_t *ent ) {
line 479
;474:	spawn_t	*s;
;475:	gitem_t	*item;
;476:    char cvarname[128];
;477:    char itemname[128];
;478:	
;479:	if( strcmp(ent->classname, "none") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $262
line 480
;480:	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $261
JUMPV
LABELV $262
line 484
;481:	}
;482:
;483:        //Construct a replace cvar:
;484:		Com_sprintf(cvarname, sizeof(cvarname), "replace_%s", ent->classname);
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $265
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 487
;485:
;486:        //Look an alternative item up:
;487:        trap_Cvar_VariableStringBuffer(cvarname,itemname,sizeof(itemname));
ADDRLP4 136
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 488
;488:        if(itemname[0]==0) //If nothing found use original
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $266
line 489
;489:            Com_sprintf(itemname, sizeof(itemname), "%s", ent->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $267
JUMPV
LABELV $266
line 491
;490:        else
;491:            G_Printf ("%s replaced by %s\n", ent->classname, itemname);
ADDRGP4 $269
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $267
line 493
;492:
;493:		if( g_gametype.integer == GT_OBELISK ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $270
line 494
;494:			if( strcmp(itemname, "team_CTF_redflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $273
line 495
;495:				Com_sprintf(itemname, sizeof(itemname), "%s", "team_redobelisk");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 496
;496:			}
LABELV $273
line 497
;497:			if( strcmp(itemname, "team_CTF_blueflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $276
line 498
;498:				Com_sprintf(itemname, sizeof(itemname), "%s", "team_blueobelisk");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 499
;499:			}
LABELV $276
line 500
;500:		}
LABELV $270
line 501
;501:		if( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $279
line 502
;502:			if( strcmp(itemname, "team_CTF_redflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $282
line 503
;503:				Com_sprintf(itemname, sizeof(itemname), "%s", "team_redobelisk");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 504
;504:			}
LABELV $282
line 505
;505:			if( strcmp(itemname, "team_CTF_blueflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $284
line 506
;506:				Com_sprintf(itemname, sizeof(itemname), "%s", "team_blueobelisk");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 507
;507:			}
LABELV $284
line 508
;508:			if( strcmp(itemname, "team_CTF_neutralflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $286
line 509
;509:				Com_sprintf(itemname, sizeof(itemname), "%s", "team_neutralobelisk");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 510
;510:			}
LABELV $286
line 511
;511:		}	
LABELV $279
line 512
;512:		if( g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_FFA || g_gametype.integer == GT_SANDBOX || g_gametype.integer == GT_TEAM || g_gametype.integer == GT_LMS || g_gametype.integer == GT_DOMINATION ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $301
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $301
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $301
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $301
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $301
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
NEI4 $289
LABELV $301
line 513
;513:			if( strcmp(itemname, "team_CTF_redplayer") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $247
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $302
line 514
;514:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 515
;515:			}
LABELV $302
line 516
;516:			if( strcmp(itemname, "team_CTF_blueplayer") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $304
line 517
;517:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 518
;518:			}
LABELV $304
line 519
;519:			if( strcmp(itemname, "team_CTF_redspawn") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $306
line 520
;520:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 521
;521:			}
LABELV $306
line 522
;522:			if( strcmp(itemname, "team_CTF_bluespawn") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $250
ARGP4
ADDRLP4 280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $308
line 523
;523:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 524
;524:			}
LABELV $308
line 525
;525:			if( strcmp(itemname, "team_CTF_blueflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $310
line 526
;526:				Com_sprintf(itemname, sizeof(itemname), "%s", "holdable_portal");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $312
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 527
;527:			}
LABELV $310
line 528
;528:			if( strcmp(itemname, "team_CTF_redflag") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $313
line 529
;529:				Com_sprintf(itemname, sizeof(itemname), "%s", "item_armor_full");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $315
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 530
;530:			}
LABELV $313
line 531
;531:		}
LABELV $289
line 532
;532:		if(g_gametype.integer == GT_DOUBLE_D) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $316
line 533
;533:			if( strcmp(itemname, "team_CTF_redplayer") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $247
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $319
line 534
;534:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 535
;535:			}
LABELV $319
line 536
;536:			if( strcmp(itemname, "team_CTF_blueplayer") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $321
line 537
;537:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 538
;538:			}
LABELV $321
line 539
;539:			if( strcmp(itemname, "team_CTF_redspawn") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $323
line 540
;540:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 541
;541:			}
LABELV $323
line 542
;542:			if( strcmp(itemname, "team_CTF_bluespawn") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $250
ARGP4
ADDRLP4 280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $325
line 543
;543:				Com_sprintf(itemname, sizeof(itemname), "%s", "info_player_deathmatch");
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $268
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 544
;544:			}
LABELV $325
line 545
;545:		}		
LABELV $316
line 548
;546:
;547:
;548:	if ( itemname[0]==0) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $327
line 549
;549:                G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $329
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 550
;550:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $261
JUMPV
LABELV $327
line 553
;551:	}
;552:
;553:    if(g_randomItems.integer) {
ADDRGP4 g_randomItems+12
INDIRI4
CNSTI4 0
EQI4 $330
line 555
;554:		if( 
;555:		strcmp(itemname, "team_CTF_redflag") || 
ADDRLP4 0
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 0
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 0
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 0
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 0
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 0
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $333
LABELV $339
line 560
;556:		strcmp(itemname, "team_CTF_blueflag") || 
;557:		strcmp(itemname, "team_CTF_neutralflag") || 
;558:		strcmp(itemname, "info_player_dd") || 
;559:		strcmp(itemname, "info_player_dd_red") || 
;560:		strcmp(itemname, "info_player_dd_blue") ) {
line 561
;561:		randomiseitem(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 randomiseitem
CALLI4
pop
line 562
;562:		}
LABELV $333
line 563
;563:	}
LABELV $330
line 566
;564:
;565:	// check item spawn functions
;566:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 132
ADDRGP4 bg_itemlist+56
ASGNP4
ADDRGP4 $343
JUMPV
LABELV $340
line 567
;567:		if ( !strcmp(item->classname, itemname) ) {
ADDRLP4 132
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $345
line 568
;568:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 569
;569:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $261
JUMPV
LABELV $345
line 571
;570:		}
;571:	}
LABELV $341
line 566
ADDRLP4 132
ADDRLP4 132
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
LABELV $343
ADDRLP4 132
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $340
line 574
;572:
;573:	// check normal spawn functions
;574:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 128
ADDRGP4 spawns
ASGNP4
ADDRGP4 $350
JUMPV
LABELV $347
line 575
;575:		if ( !strcmp(s->name, itemname) ) {
ADDRLP4 128
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $351
line 577
;576:			// found it
;577:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 578
;578:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $261
JUMPV
LABELV $351
line 580
;579:		}
;580:	}
LABELV $348
line 574
ADDRLP4 128
ADDRLP4 128
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $350
ADDRLP4 128
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 581
;581:        G_Printf ("%s doesn't have a spawn function\n", itemname);
ADDRGP4 $353
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 582
;582:	return qfalse;
CNSTI4 0
RETI4
LABELV $261
endproc G_CallSpawn 292 16
export G_SandboxSpawn
proc G_SandboxSpawn 20 8
line 593
;583:}
;584:
;585:/*
;586:===============
;587:G_SandboxSpawn
;588:
;589:Finds the spawn function for the entity and calls it,
;590:returning qfalse if not found
;591:===============
;592:*/
;593:qboolean G_SandboxSpawn( gentity_t *ent ) {
line 598
;594:	spawn_t	*s;
;595:	gitem_t	*item;
;596:
;597:	// check item spawn functions
;598:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+56
ASGNP4
ADDRGP4 $358
JUMPV
LABELV $355
line 599
;599:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $360
line 600
;600:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 601
;601:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $354
JUMPV
LABELV $360
line 603
;602:		}
;603:	}
LABELV $356
line 598
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
LABELV $358
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $355
line 606
;604:
;605:	// check normal spawn functions
;606:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $365
JUMPV
LABELV $362
line 607
;607:		if ( !strcmp(s->name, ent->classname) ) {
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
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $366
line 609
;608:			// found it
;609:			ent->sb_class = BG_Alloc(sizeof(ent->classname));
CNSTU4 4
ARGU4
ADDRLP4 12
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 872
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 610
;610:			strcpy(ent->sb_class, ent->classname);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 872
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 611
;611:			s->spawn(ent);
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
line 612
;612:			ent->classname = "func_prop";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $179
ASGNP4
line 613
;613:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $354
JUMPV
LABELV $366
line 615
;614:		}
;615:	}
LABELV $363
line 606
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $365
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $362
line 616
;616:	return qfalse;
CNSTI4 0
RETI4
LABELV $354
endproc G_SandboxSpawn 20 8
export G_NewString
proc G_NewString 32 4
line 627
;617:}
;618:
;619:/*
;620:=============
;621:G_NewString
;622:
;623:Builds a copy of the string, translating \n to real linefeeds
;624:so message texts can be multi-line
;625:=============
;626:*/
;627:char *G_NewString( const char *string ) {
line 631
;628:	char	*newb, *new_p;
;629:	int		i,l;
;630:	
;631:	l = strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 633
;632:    //KK-OAX Changed to Tremulous's BG_Alloc
;633:	newb = BG_Alloc( l );
ADDRLP4 4
INDIRI4
CVIU4 4
ARGU4
ADDRLP4 20
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 635
;634:
;635:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 638
;636:
;637:	// turn \n into a real linefeed
;638:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $372
JUMPV
LABELV $369
line 639
;639:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $373
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $373
line 640
;640:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 641
;641:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $375
line 642
;642:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 643
;643:			} else {
ADDRGP4 $374
JUMPV
LABELV $375
line 644
;644:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 645
;645:			}
line 646
;646:		} else {
ADDRGP4 $374
JUMPV
LABELV $373
line 647
;647:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 648
;648:		}
LABELV $374
line 649
;649:	}
LABELV $370
line 638
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $372
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $369
line 651
;650:	
;651:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $368
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 60 20
line 665
;652:}
;653:
;654:
;655:
;656:
;657:/*
;658:===============
;659:G_ParseField
;660:
;661:Takes a key/value pair and sets the binary values
;662:in a gentity
;663:===============
;664:*/
;665:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 671
;666:	field_t	*f;
;667:	byte	*b;
;668:	float	v;
;669:	vec3_t	vec;
;670:
;671:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $381
JUMPV
LABELV $378
line 672
;672:		if ( !Q_stricmp(f->name, key) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $382
line 674
;673:			// found it
;674:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 676
;675:
;676:			switch( f->type ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $377
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $377
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $397
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $397
address $393
address $394
address $387
address $377
address $388
address $395
address $377
address $377
address $377
address $377
code
LABELV $387
line 678
;677:			case F_LSTRING:
;678:				*(char **)(b+f->ofs) = G_NewString (value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 679
;679:				break;
ADDRGP4 $377
JUMPV
LABELV $388
line 681
;680:			case F_VECTOR:
;681:				sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 682
;682:				((float *)(b+f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 683
;683:				((float *)(b+f->ofs))[1] = vec[1];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 684
;684:				((float *)(b+f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 685
;685:				break;
ADDRGP4 $377
JUMPV
LABELV $393
line 687
;686:			case F_INT:
;687:				*(int *)(b+f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 688
;688:				break;
ADDRGP4 $377
JUMPV
LABELV $394
line 690
;689:			case F_FLOAT:
;690:				*(float *)(b+f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 691
;691:				break;
ADDRGP4 $377
JUMPV
LABELV $395
line 693
;692:			case F_ANGLEHACK:
;693:				v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 694
;694:				((float *)(b+f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 695
;695:				((float *)(b+f->ofs))[1] = v;
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 696
;696:				((float *)(b+f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 697
;697:				break;
line 700
;698:			default:
;699:			case F_IGNORE:
;700:				break;
line 702
;701:			}
;702:			return;
ADDRGP4 $377
JUMPV
LABELV $382
line 704
;703:		}
;704:	}
LABELV $379
line 671
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $381
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $378
line 705
;705:}
LABELV $377
endproc G_ParseField 60 20
data
align 4
LABELV $399
address $400
address $401
address $402
address $403
address $96
address $404
address $405
address $406
address $407
address $408
address $404
address $409
address $410
address $411
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 44 12
line 718
;706:
;707:
;708:
;709:
;710:/*
;711:===================
;712:G_SpawnGEntityFromSpawnVars
;713:
;714:Spawn an entity and fill in all of the level fields from
;715:level.spawnVars[], then call the class specfic spawn function
;716:===================
;717:*/
;718:void G_SpawnGEntityFromSpawnVars( void ) {
line 725
;719:	int			i;
;720:	gentity_t	*ent;
;721:	char		*s, *value, *gametypeName;
;722:	static char *gametypeNames[] = {"sandbox", "ffa", "single", "tournament", "team", "ctf", "oneflag", "obelisk", "harvester", "elimination", "ctf", "lms", "dd", "dom"};
;723:
;724:	// get the next free entity
;725:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 727
;726:
;727:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $415
JUMPV
LABELV $412
line 728
;728:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+5296
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+5296+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 729
;729:	}
LABELV $413
line 727
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $415
ADDRLP4 0
INDIRI4
ADDRGP4 level+5292
INDIRI4
LTI4 $412
line 732
;730:
;731:	// check for "notsingle" flag
;732:	if ( g_gametype.integer == GT_SINGLE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $420
line 733
;733:		G_SpawnInt( "notsingle", "0", &i );
ADDRGP4 $423
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 734
;734:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $425
line 735
;735:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 736
;736:			return;
ADDRGP4 $398
JUMPV
LABELV $425
line 738
;737:		}
;738:	}
LABELV $420
line 739
;739:	if ( g_gametype.integer >= GT_TEAM && !g_ffa_gt ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $427
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $427
line 740
;740:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $430
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 741
;741:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $428
line 742
;742:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 743
;743:			return;
ADDRGP4 $398
JUMPV
line 745
;744:		}
;745:	} else {
LABELV $427
line 746
;746:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $433
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 747
;747:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $434
line 748
;748:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 749
;749:			return;
ADDRGP4 $398
JUMPV
LABELV $434
line 751
;750:		}
;751:	}
LABELV $428
line 753
;752:
;753:	G_SpawnInt( "notta", "0", &i );
ADDRGP4 $436
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 754
;754:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $437
line 755
;755:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 756
;756:		return;
ADDRGP4 $398
JUMPV
LABELV $437
line 759
;757:	}
;758:
;759:        if( G_SpawnString( "!gametype", NULL, &value ) ) {
ADDRGP4 $441
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $439
line 760
;760:		if( g_gametype.integer >= GT_SANDBOX && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $442
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 14
GEI4 $442
line 761
;761:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $399
ADDP4
INDIRP4
ASGNP4
line 763
;762:
;763:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 764
;764:			if( s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $447
line 765
;765:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 766
;766:				return;
ADDRGP4 $398
JUMPV
LABELV $447
line 768
;767:			}
;768:		}
LABELV $442
line 769
;769:	}
LABELV $439
line 771
;770:
;771:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $451
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 28
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $449
line 772
;772:		if( g_gametype.integer >= GT_SANDBOX && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $452
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 14
GEI4 $452
line 773
;773:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $399
ADDP4
INDIRP4
ASGNP4
line 775
;774:
;775:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
ASGNP4
line 776
;776:			if( !s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $457
line 777
;777:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 778
;778:				return;
ADDRGP4 $398
JUMPV
LABELV $457
line 780
;779:			}
;780:		}
LABELV $452
line 781
;781:	}
LABELV $449
line 784
;782:
;783:	// move editor origin to pos
;784:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 785
;785:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
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
line 788
;786:
;787:	// if we didn't get a classname, don't bother spawning anything
;788:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $459
line 789
;789:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 790
;790:	}
LABELV $459
line 791
;791:}
LABELV $398
endproc G_SpawnGEntityFromSpawnVars 44 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 800
;792:
;793:
;794:
;795:/*
;796:====================
;797:G_AddSpawnVarToken
;798:====================
;799:*/
;800:char *G_AddSpawnVarToken( const char *string ) {
line 804
;801:	int		l;
;802:	char	*dest;
;803:
;804:	l = strlen( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 805
;805:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+5808
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $462
line 806
;806:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_VARS" );
ADDRGP4 $465
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 807
;807:	}
LABELV $462
line 809
;808:
;809:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+5808
INDIRI4
ADDRGP4 level+5812
ADDP4
ASGNP4
line 810
;810:	memcpy( dest, string, l+1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 812
;811:
;812:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+5808
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 814
;813:
;814:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $461
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 827
;815:}
;816:
;817:/*
;818:====================
;819:G_ParseSpawnVars
;820:
;821:Parses a brace bounded set of key / value pairs out of the
;822:level's entity strings into level.spawnVars[]
;823:
;824:This does not actually spawn an entity.
;825:====================
;826:*/
;827:qboolean G_ParseSpawnVars( void ) {
line 831
;828:	char		keyname[MAX_TOKEN_CHARS];
;829:	char		com_token[MAX_TOKEN_CHARS];
;830:
;831:	level.numSpawnVars = 0;
ADDRGP4 level+5292
CNSTI4 0
ASGNI4
line 832
;832:	level.numSpawnVarChars = 0;
ADDRGP4 level+5808
CNSTI4 0
ASGNI4
line 835
;833:
;834:	// parse the opening brace
;835:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $472
line 837
;836:		// end of spawn string
;837:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $469
JUMPV
LABELV $472
line 839
;838:	}
;839:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $478
line 840
;840:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $476
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 841
;841:	}
ADDRGP4 $478
JUMPV
LABELV $477
line 844
;842:
;843:	// go through all the key / value pairs
;844:	while ( 1 ) {	
line 846
;845:		// parse key
;846:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $480
line 847
;847:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $482
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 848
;848:		}
LABELV $480
line 850
;849:
;850:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $483
line 851
;851:			break;
ADDRGP4 $479
JUMPV
LABELV $483
line 855
;852:		}
;853:		
;854:		// parse value	
;855:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $485
line 856
;856:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $482
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 857
;857:		}
LABELV $485
line 859
;858:
;859:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $487
line 860
;860:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $489
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 861
;861:		}
LABELV $487
line 862
;862:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+5292
INDIRI4
CNSTI4 64
NEI4 $490
line 863
;863:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $493
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 864
;864:		}
LABELV $490
line 865
;865:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+5292
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+5296
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 866
;866:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+5292
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+5296+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 867
;867:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+5292
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 868
;868:	}
LABELV $478
line 844
ADDRGP4 $477
JUMPV
LABELV $479
line 870
;869:
;870:	return qtrue;
CNSTI4 1
RETI4
LABELV $469
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 32 12
line 882
;871:}
;872:
;873:
;874:
;875:/*QUAKED worldspawn (0 0 0) ?
;876:
;877:Every map should have exactly one worldspawn.
;878:"music"		music wav file
;879:"gravity"	800 is default gravity
;880:"message"	Text to print during connection process
;881:*/
;882:void SP_worldspawn( void ) {
line 887
;883:	char	*s;
;884:	char	*music;
;885:	int		 number;
;886:	
;887:	number = rand() % 14 + 1;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 14
MODI4
CNSTI4 1
ADDI4
ASGNI4
line 889
;888:	
;889:	if(number == 1){ music = "music/soundtrack1"; }
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $501
ADDRLP4 8
ADDRGP4 $503
ASGNP4
LABELV $501
line 890
;890:	if(number == 2){ music = "music/soundtrack2"; }
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $504
ADDRLP4 8
ADDRGP4 $506
ASGNP4
LABELV $504
line 891
;891:	if(number == 3){ music = "music/soundtrack3"; }
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $507
ADDRLP4 8
ADDRGP4 $509
ASGNP4
LABELV $507
line 892
;892:	if(number == 4){ music = "music/soundtrack4"; }
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $510
ADDRLP4 8
ADDRGP4 $512
ASGNP4
LABELV $510
line 893
;893:	if(number == 5){ music = "music/soundtrack5"; }
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $513
ADDRLP4 8
ADDRGP4 $515
ASGNP4
LABELV $513
line 894
;894:	if(number == 6){ music = "music/soundtrack6"; }
ADDRLP4 4
INDIRI4
CNSTI4 6
NEI4 $516
ADDRLP4 8
ADDRGP4 $518
ASGNP4
LABELV $516
line 895
;895:	if(number == 7){ music = "music/soundtrack7"; }
ADDRLP4 4
INDIRI4
CNSTI4 7
NEI4 $519
ADDRLP4 8
ADDRGP4 $521
ASGNP4
LABELV $519
line 896
;896:	if(number == 8){ music = "music/soundtrack8"; }
ADDRLP4 4
INDIRI4
CNSTI4 8
NEI4 $522
ADDRLP4 8
ADDRGP4 $524
ASGNP4
LABELV $522
line 897
;897:	if(number == 9){ music = "music/soundtrack9"; }
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $525
ADDRLP4 8
ADDRGP4 $527
ASGNP4
LABELV $525
line 898
;898:	if(number == 10){ music = "music/soundtrack10"; }
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $528
ADDRLP4 8
ADDRGP4 $530
ASGNP4
LABELV $528
line 899
;899:	if(number == 11){ music = "music/soundtrack11"; }
ADDRLP4 4
INDIRI4
CNSTI4 11
NEI4 $531
ADDRLP4 8
ADDRGP4 $533
ASGNP4
LABELV $531
line 900
;900:	if(number == 12){ music = "music/soundtrack12"; }
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $534
ADDRLP4 8
ADDRGP4 $536
ASGNP4
LABELV $534
line 901
;901:	if(number == 13){ music = "music/soundtrack13"; }
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $537
ADDRLP4 8
ADDRGP4 $539
ASGNP4
LABELV $537
line 902
;902:	if(number == 14){ music = "music/soundtrack14"; }
ADDRLP4 4
INDIRI4
CNSTI4 14
NEI4 $540
ADDRLP4 8
ADDRGP4 $542
ASGNP4
LABELV $540
line 905
;903:
;904:
;905:	G_SpawnString( "classname", "", &s );
ADDRGP4 $86
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 906
;906:	if ( Q_stricmp( s, "worldspawn" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $544
line 907
;907:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $547
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 908
;908:	}
LABELV $544
line 911
;909:
;910:	// make some data visible to connecting client
;911:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $548
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 913
;912:
;913:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $549
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 916
;914:	
;915:
;916:	if ( *g_music.string && Q_stricmp( g_music.string, "none" ) ) {
ADDRGP4 g_music+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $551
ADDRGP4 g_music+16
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $551
line 917
;917:		trap_SetConfigstring( CS_MUSIC, g_music.string );
CNSTI4 2
ARGI4
ADDRGP4 g_music+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 918
;918:	} else {
ADDRGP4 $552
JUMPV
LABELV $551
line 919
;919:		G_SpawnString( "music", music, &s );   
ADDRGP4 $133
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 920
;920:		trap_SetConfigstring( CS_MUSIC, s );
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 921
;921:	}
LABELV $552
line 922
;922:    	G_SpawnString( "scoreboardmusic", "", &s );
ADDRGP4 $556
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 923
;923:	trap_SetConfigstring( CS_SCOREBOARDMUSIC, s );
CNSTI4 8611
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 925
;924:
;925:	G_SpawnString( "deathmusic", "", &s );
ADDRGP4 $557
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 926
;926:	trap_SetConfigstring( CS_DEATHMUSIC, s );
CNSTI4 8612
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 928
;927:
;928:	G_SpawnString( "playermodel", "", &s );
ADDRGP4 $558
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 929
;929:	trap_SetConfigstring( CS_PLAYERMODEL, s );
CNSTI4 8615
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 931
;930:
;931:	G_SpawnString( "playerheadmodel", "", &s );
ADDRGP4 $559
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 932
;932:	trap_SetConfigstring( CS_PLAYERHEADMODEL, s );
CNSTI4 8616
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 934
;933:
;934:	G_SpawnString( "objectivesoverlay", "menu/objectives/overlay.tga", &s );
ADDRGP4 $560
ARGP4
ADDRGP4 $561
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 935
;935:	trap_SetConfigstring( CS_OBJECTIVESOVERLAY, s );
CNSTI4 8617
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 937
;936:
;937:	G_SpawnString( "message", "", &s );
ADDRGP4 $94
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 938
;938:	trap_SetConfigstring( CS_MESSAGE, s );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 940
;939:
;940:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 942
;941:
;942:	G_SpawnString( "gravity", "800", &s );
ADDRGP4 $563
ARGP4
ADDRGP4 $564
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 943
;943:	trap_Cvar_Set( "g_gravity", s );
ADDRGP4 $565
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 945
;944:
;945:	G_SpawnString( "enableDust", "0", &s );
ADDRGP4 $566
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 946
;946:	trap_Cvar_Set( "g_enableDust", s );
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 948
;947:    
;948:    G_SpawnString( "enableSnow", "0", &s );
ADDRGP4 $568
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 949
;949:    trap_Cvar_Set( "g_enableSnow", s );
ADDRGP4 $569
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 951
;950:    
;951:	G_SpawnString( "enableBreath", "0", &s );
ADDRGP4 $570
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 952
;952:	trap_Cvar_Set( "g_enableBreath", s );
ADDRGP4 $571
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 954
;953:
;954:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+10202248
CNSTI4 4094
ASGNI4
line 955
;955:        g_entities[ENTITYNUM_WORLD].r.ownerNum = ENTITYNUM_NONE;
ADDRGP4 g_entities+10202248+228+324
CNSTI4 4095
ASGNI4
line 956
;956:	g_entities[ENTITYNUM_WORLD].classname = "worldspawn";
ADDRGP4 g_entities+10202248+564
ADDRGP4 $546
ASGNP4
line 958
;957:
;958:        g_entities[ENTITYNUM_NONE].s.number = ENTITYNUM_NONE;
ADDRGP4 g_entities+10204740
CNSTI4 4095
ASGNI4
line 959
;959:        g_entities[ENTITYNUM_NONE].r.ownerNum = ENTITYNUM_NONE;
ADDRGP4 g_entities+10204740+228+324
CNSTI4 4095
ASGNI4
line 960
;960:        g_entities[ENTITYNUM_NONE].classname = "nothing";
ADDRGP4 g_entities+10204740+564
ADDRGP4 $584
ASGNP4
line 963
;961:        
;962:	// see if we want a warmup time
;963:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $543
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 964
;964:	if ( g_restarted.integer ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $585
line 965
;965:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $588
ARGP4
ADDRGP4 $424
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 966
;966:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 967
;967:	} else if ( g_doWarmup.integer ) { // Turn it on
ADDRGP4 $586
JUMPV
LABELV $585
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $590
line 968
;968:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 969
;969:		trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $549
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 970
;970:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $595
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 971
;971:	}
LABELV $590
LABELV $586
line 973
;972:
;973:}
LABELV $500
endproc SP_worldspawn 32 12
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 983
;974:
;975:
;976:/*
;977:==============
;978:G_SpawnEntitiesFromString
;979:
;980:Parses textual entity definitions out of an entstring and spawns gentities.
;981:==============
;982:*/
;983:void G_SpawnEntitiesFromString( void ) {
line 985
;984:	// allow calls to G_Spawn*()
;985:	level.spawning = qtrue;
ADDRGP4 level+5288
CNSTI4 1
ASGNI4
line 986
;986:	level.numSpawnVars = 0;
ADDRGP4 level+5292
CNSTI4 0
ASGNI4
line 991
;987:
;988:	// the worldspawn is not an actual entity, but it still
;989:	// has a "spawn" function to perform any global setup
;990:	// needed by a level (setting configstrings or cvars, etc)
;991:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $599
line 992
;992:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $601
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 993
;993:	}
LABELV $599
line 994
;994:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $603
JUMPV
LABELV $602
line 997
;995:
;996:	// parse ents
;997:	while( G_ParseSpawnVars() ) {
line 998
;998:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 999
;999:	}	
LABELV $603
line 997
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $602
line 1001
;1000:
;1001:  G_LevelLoadComplete();
ADDRGP4 G_LevelLoadComplete
CALLV
pop
line 1003
;1002:
;1003:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+5288
CNSTI4 0
ASGNI4
line 1004
;1004:}
LABELV $596
endproc G_SpawnEntitiesFromString 8 4
import randomiseitem
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
import SP_shooter_custom
import SP_shooter_antimatter
import SP_shooter_flame
import SP_shooter_prox
import SP_shooter_bfg
import SP_shooter_grenade
import SP_shooter_plasma
import SP_shooter_rocket
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camera
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_script_aicontrol
import SP_script_menu
import SP_script_cmd
import SP_script_layer
import SP_script_variable
import SP_target_stats
import SP_target_music
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
import SP_func_prop
import SP_func_static
import SP_func_plat
import SP_info_backpack
import SP_info_waypoint
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
import G_FindEntityForClientNum
import G_FindEntityForEntityNum
import G_ShowObjects
import G_HideObjects
import G_BounceProp
import G_RunProp
import G_ModProp
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
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
LABELV $601
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $595
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $588
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $584
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $571
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $570
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $569
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 83
byte 1 110
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $568
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 83
byte 1 110
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $567
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $566
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $565
byte 1 103
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
LABELV $564
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $563
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $561
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 47
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $560
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $559
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $558
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $557
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $556
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $549
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $548
byte 1 109
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $547
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $546
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $543
byte 1 0
align 1
LABELV $542
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $539
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $536
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $533
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $530
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $527
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 57
byte 1 0
align 1
LABELV $524
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 56
byte 1 0
align 1
LABELV $521
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 55
byte 1 0
align 1
LABELV $518
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 54
byte 1 0
align 1
LABELV $515
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 53
byte 1 0
align 1
LABELV $512
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 52
byte 1 0
align 1
LABELV $509
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 51
byte 1 0
align 1
LABELV $506
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 50
byte 1 0
align 1
LABELV $503
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 49
byte 1 0
align 1
LABELV $493
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $489
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $482
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $476
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 0
align 1
LABELV $465
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $451
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $441
byte 1 33
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $436
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $433
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $430
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $424
byte 1 48
byte 1 0
align 1
LABELV $423
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $411
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $410
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $409
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $408
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $407
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $406
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $405
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $404
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $403
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $402
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $401
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $400
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $353
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $329
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $315
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $312
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $288
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $278
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
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $275
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
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $269
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $265
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $257
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
LABELV $256
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
LABELV $255
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $254
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
LABELV $253
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
LABELV $252
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
LABELV $251
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
LABELV $250
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
LABELV $249
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
LABELV $248
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
LABELV $247
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
LABELV $246
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
LABELV $245
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
LABELV $244
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
LABELV $243
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
LABELV $242
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
LABELV $241
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
LABELV $240
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
LABELV $239
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
LABELV $238
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
LABELV $237
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
LABELV $236
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
LABELV $235
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
LABELV $234
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
LABELV $233
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 97
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $232
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $231
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $230
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
LABELV $229
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
LABELV $228
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
LABELV $227
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $226
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
LABELV $225
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
LABELV $224
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
LABELV $223
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
LABELV $222
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
LABELV $221
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
LABELV $220
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
LABELV $219
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
LABELV $218
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
LABELV $217
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
LABELV $216
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
LABELV $215
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
LABELV $214
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
LABELV $213
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
LABELV $212
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
LABELV $211
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
LABELV $210
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
LABELV $209
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
LABELV $208
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
LABELV $207
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
LABELV $206
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
LABELV $205
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
LABELV $204
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
LABELV $203
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
LABELV $202
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
LABELV $201
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
LABELV $200
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
LABELV $199
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
LABELV $198
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
LABELV $197
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
LABELV $196
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
LABELV $195
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
LABELV $194
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
LABELV $193
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
LABELV $192
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
LABELV $191
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
LABELV $190
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
LABELV $189
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
LABELV $188
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
LABELV $187
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
LABELV $186
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
LABELV $185
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
LABELV $184
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
LABELV $183
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
LABELV $182
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
LABELV $181
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
LABELV $180
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
LABELV $179
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
LABELV $178
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
LABELV $177
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
LABELV $176
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
LABELV $175
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
LABELV $174
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
LABELV $173
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
LABELV $172
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
LABELV $171
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
LABELV $170
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
LABELV $169
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
LABELV $168
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
LABELV $167
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
LABELV $166
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
LABELV $165
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
LABELV $164
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
LABELV $163
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
LABELV $162
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
align 1
LABELV $159
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $158
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $157
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $156
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $155
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 115
byte 1 98
byte 1 95
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $152
byte 1 115
byte 1 98
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 115
byte 1 98
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $150
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $149
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $148
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 98
byte 1 95
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $146
byte 1 115
byte 1 98
byte 1 95
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $145
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $144
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $142
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $141
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 48
byte 1 0
align 1
LABELV $140
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 48
byte 1 0
align 1
LABELV $137
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 115
byte 1 98
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 115
byte 1 98
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $132
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $131
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $129
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $128
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $127
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $126
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $125
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $124
byte 1 108
byte 1 111
byte 1 111
byte 1 116
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $123
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $122
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
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
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
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $117
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 109
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $113
byte 1 109
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
byte 1 109
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 109
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $110
byte 1 109
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $109
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $108
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $107
byte 1 109
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 109
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $103
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $102
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $101
byte 1 112
byte 1 114
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $98
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $97
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $96
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $95
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 114
byte 1 117
byte 1 0
align 1
LABELV $94
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $91
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $90
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $88
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $87
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $86
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $83
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $81
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
