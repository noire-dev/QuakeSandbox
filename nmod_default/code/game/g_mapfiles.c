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

#include "g_local.h"

#define MAX_MAPFILE_LENGTH 2500000*6

#define MAX_TOKENNUM 524288*6

static char 		mapbuffer[ 2500000*6 ];

typedef enum {
	TOT_LPAREN,
	TOT_RPAREN,
	TOT_WORD,
	TOT_NUMBER,
	TOT_NIL,
	TOT_MAX
} tokenType_t;

#define TOKENVALUE_SIZE 128

typedef struct {
	char value[TOKENVALUE_SIZE];
	int type;
} token_t;

token_t tokens2[MAX_TOKENNUM];

qboolean G_ClassnameAllowed( char *input ){
		if ( !strcmp(input, "info_player_deathmatch" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "domination_point" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_CTF_redspawn" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_CTF_bluespawn" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_redobelisk" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_blueobelisk" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_neutralobelisk" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "func_prop" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "target_botspawn" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_CTF_neutralflag" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_CTF_blueflag" ) ) {
			return qtrue;
		}
		if ( !strcmp(input, "team_CTF_redflag" ) ) {
			return qtrue;
		}
		
		if ( BG_CheckClassname(input) ) {
			return qtrue;
		}

	return qfalse;
}

qboolean G_ClassnameAllowedAll( char *input ){


	return qtrue;
}

void G_ClearEntities( void ){
	int i;
	for( i = 0; i < MAX_GENTITIES; i++ ) {
		/*if( !g_entities[i].inuse )
			continue;*/
		if( !G_ClassnameAllowed(g_entities[i].classname) )
			continue;
		g_entities[i].nextthink = 0;
		G_FreeEntity(&g_entities[i]);
		
	}
}

void G_ClearEntitiesAll( void ){
	int i;
	for( i = 0; i < MAX_GENTITIES; i++ ) {
		/*if( !g_entities[i].inuse )
			continue;*/
		if( !G_ClassnameAllowedAll(g_entities[i].classname) )
			continue;
		g_entities[i].nextthink = 0;
		G_FreeEntity(&g_entities[i]);
		
	}
}

static int G_setTokens2( char* in, char* out, int start ){
	int i = 0;
	while ( in[ start + i ] != ' ' ){
		if( in[ start + i ] == '\0' ){
			out[i] = in[start+1];
			return MAX_MAPFILE_LENGTH;
		}
		out[i] = in[start+i];
		i++;
	}
	out[i] = '\0';
	return start+i+1;
}

static int G_setTokenType2( char* value ){
	int count = 0;
	qboolean lpar= qfalse,rpar= qfalse,number= qfalse, character = qfalse;
	
	while( value[count] != '\0' ){
		if( value[count] == '{' )
			lpar = qtrue;
		else if( value[count] == '}' )
			rpar = qtrue;
		else if( value[count] >= '0' && value[count] <= '9' )
			number = qtrue;
		else if( ( value[count] >= 'a' && value[count] <= 'z' ) || ( value[count] >= 'A' && value[count] <= 'Z' ) )
			character = qtrue;
		count++;
	}
	
	if( lpar && !( rpar || number || character ) )
		return TOT_LPAREN;
	else if( rpar && !( lpar || number || character ) )
		return TOT_RPAREN;
	else if( number && !( lpar || rpar || character ) )
		return TOT_NUMBER;
	else if( character && !( lpar || rpar ) )
		return TOT_WORD;
	else
		return TOT_NIL;
}

static int G_FindNextToken2( char *find, token_t *in, int start ){
	int i;
	int cmp;
	
	for( i = start; i < MAX_TOKENNUM; i++ ){
		cmp= strcmp( in[i].value, find );
		if( cmp == 0 )
			return i;
	}
	return -1;
}

static qboolean G_AbeforeB2( char *A, char *B, token_t *in, int start ){
	int a = G_FindNextToken2( A, in, start );
	int b = G_FindNextToken2( B, in, start );
	
	if( b == -1 && a != -1 )
		return qtrue;
	if( a == -1 && b != -1 )
		return qfalse;
	if( a < b )
		return qtrue;
	else
		return qfalse;
}

//
// fields are needed for spawning from the entity string
//
typedef enum {
	F_INT, 
	F_FLOAT,
	F_STRING,
	F_VECTOR,
	F_IGNORE
} fieldtypeCopy_t;

typedef struct
{
	char	*name;
	int		ofs;
	fieldtypeCopy_t	type;
	int		flags;
} fieldCopy_t;

fieldCopy_t fieldsCopy[] = {
	{"classname", FOFS(classname), F_STRING},
	{"model", FOFS(model), F_STRING},
	{"model2", FOFS(model2), F_STRING},
	{"origin", FOFS(s.origin), F_VECTOR},
	{"angles", FOFS(s.angles), F_VECTOR},
	{"modelscale_vec", FOFS(s.scales), F_VECTOR},
	{"spawnflags", FOFS(spawnflags), F_INT},
	{"speed", FOFS(speed), F_FLOAT},
	{"target", FOFS(target), F_STRING},
	{"targetname", FOFS(targetname), F_STRING},
	{"message", FOFS(message), F_STRING},
	{"botname", FOFS(botname), F_STRING},
	{"team", FOFS(team), F_STRING},
	{"wait", FOFS(wait), F_FLOAT},
	{"random", FOFS(random), F_FLOAT},
	{"count", FOFS(count), F_INT},
	{"playerangle", FOFS(playerangle), F_INT},
	{"price", FOFS(price), F_INT},
	{"health", FOFS(health), F_INT},
	{"light", 0, F_IGNORE},
	{"dmg", FOFS(damage), F_INT},
	{"mtype", FOFS(mtype), F_INT},
	{"mtimeout", FOFS(mtimeout), F_INT},
	{"mhoming", FOFS(mhoming), F_INT},
	{"mspeed", FOFS(mspeed), F_INT},
	{"mbounce", FOFS(mbounce), F_INT},
	{"mdamage", FOFS(mdamage), F_INT},
	{"msdamage", FOFS(msdamage), F_INT},
	{"msradius", FOFS(msradius), F_INT},
	{"mgravity", FOFS(mgravity), F_INT},
	{"mnoclip", FOFS(mnoclip), F_INT},
	{"allowuse", FOFS(allowuse), F_INT},
	{"targetShaderName", FOFS(targetShaderName), F_STRING},
	{"targetShaderNewName", FOFS(targetShaderNewName), F_STRING},
	{"mapname", FOFS(mapname), F_STRING},
	{"clientname", FOFS(clientname), F_STRING},
	{"teleporterTarget", FOFS(teleporterTarget), F_STRING},
	{"deathTarget", FOFS(deathTarget), F_STRING},
	{"lootTarget", FOFS(lootTarget), F_STRING},
	{"skill", FOFS(skill), F_FLOAT},
	{"overlay", FOFS(overlay), F_STRING},
	{"target2", FOFS(target2), F_STRING},
	{"damagetarget", FOFS(damagetarget), F_STRING},
	{"targetname2", FOFS(targetname2), F_STRING},
	{"key", FOFS(key), F_STRING},
	{"value", FOFS(value), F_STRING},
	{"armor", FOFS(armor), F_INT},
	{"music", FOFS(music), F_STRING},
	{"sb_class", FOFS(sb_class), F_STRING},
	{"sb_sound", FOFS(sb_sound), F_STRING},
	{"sb_coltype", FOFS(sb_coltype), F_INT},
	{"physicsBounce", FOFS(physicsBounce), F_FLOAT},
	{"vehicle", FOFS(vehicle), F_INT},
	{"sb_material", FOFS(sb_material), F_INT},
	{"sb_gravity", FOFS(sb_gravity), F_INT},
	{"sb_phys", FOFS(sb_phys), F_INT},
	{"sb_coll", FOFS(sb_coll), F_INT},
	{"sb_red", FOFS(sb_red), F_INT},
	{"sb_green", FOFS(sb_green), F_INT},
	{"sb_blue", FOFS(sb_blue), F_INT},
	{"sb_radius", FOFS(sb_radius), F_INT},
	{"sb_isnpc", FOFS(sb_isnpc), F_INT},
	{"sb_takedamage", FOFS(sb_takedamage), F_INT},
	{"sb_takedamage2", FOFS(sb_takedamage2), F_INT},
	{"objectType", FOFS(objectType), F_INT},

	{"distance", FOFS(distance), F_FLOAT},
	{"type", FOFS(type), F_INT},
	
	{NULL}
};

char *G_ClearString( char *input ){
	if( input[0] == '"' ){
		input[0] = '\0';
		input++;
	}
	if( input[strlen(input)-1] == '"' ){
		input[strlen(input)-1] = '\0';
	}
	return input;
}

static void G_LoadMapfileEntity( token_t *in, int min, int max ){
	int i;
	char *buf;
	vec3_t	vec;
	
	fieldCopy_t *field;
	byte	*b;
	
	gentity_t *ent;
	ent = G_Spawn();
	
	b = (byte *)ent;
	
	for( i = min; i <= max ; i++ ) {
		for( field = fieldsCopy; field->name; field++ ){
			if( !strcmp(va("\"%s\"",field->name), in[i].value ) ) {
				switch( field->type ) {
				  case F_STRING:
					*(char **)(b+field->ofs) = G_NewString(G_ClearString(in[i+1].value));
					break;
				  case F_VECTOR:
					buf = in[i+1].value;
					strcat(buf, " ");
					strcat(buf, in[i+2].value);
					strcat(buf, " ");
					strcat(buf, in[i+3].value);
					sscanf (G_ClearString(buf), "%f %f %f", &vec[0], &vec[1], &vec[2]);
					((float *)(b+field->ofs))[0] = vec[0];
					((float *)(b+field->ofs))[1] = vec[1];
					((float *)(b+field->ofs))[2] = vec[2];
					break;
				  case F_INT:
					*(int *)(b+field->ofs) = atoi(G_ClearString(in[i+1].value));
					break;
				  case F_FLOAT:
					*(float *)(b+field->ofs) = atof(G_ClearString(in[i+1].value));
					break;
				  default:
				  case F_IGNORE:
					break;
				}
				break;
			}
		}
	}
	
	if ( !G_CallSpawn( ent ) ) {
		G_FreeEntity( ent );
	}
}

void G_LoadMapfile( char *filename ){
	qboolean lastSpace = qtrue;
	qboolean pgbreak = qfalse;
	int i = 0;
	int charCount = 0;
	int tokenNum = 0;
	int maxTokennum;
	int lpar, rpar;
	int len;
	fileHandle_t	f;
	
	len = trap_FS_FOpenFile ( filename, &f, FS_READ );
	
	if ( !f ) {
		G_Printf( "%s",va( S_COLOR_YELLOW "mapfile not found: %s\n", filename ) );	
		return;
	}

	if ( len >= 2500000*6 ) {
		trap_Error( va( S_COLOR_RED "map file too large: %s is %i, max allowed is %i", filename, len, 2500000*6 ) );
		trap_FS_FCloseFile( f );
		return;
	}
	ClearRegisteredItems();
	G_ClearEntities();

	trap_FS_Read( mapbuffer, len, f );
	mapbuffer[len] = 0;
	trap_FS_FCloseFile( f );
	
	COM_Compress(mapbuffer);
	
	for ( i = 0; i < MAX_MAPFILE_LENGTH; i++ ){
		
		//Filter comments( start at # and end at break )
		if( mapbuffer[i] == '#' ){
			while( i < MAX_MAPFILE_LENGTH && !pgbreak ){
				if( mapbuffer[i] == '\n' || mapbuffer[i] == '\r' )
					pgbreak = qtrue;
				i++;
			}
			pgbreak = qfalse;
			lastSpace = qtrue;
			//continue;
		}
		
		if( SkippedChar( mapbuffer[i] ) ){
			if( !lastSpace ){
				mapbuffer[charCount] = ' ';
				charCount++;
				lastSpace = qtrue;
			}
			continue;
		}
		
		lastSpace = qfalse;
		mapbuffer[charCount] = mapbuffer[i];
		charCount++;
	}
	
	i = 0;
	while( i < MAX_MAPFILE_LENGTH && tokenNum < MAX_TOKENNUM){
		i = G_setTokens2( mapbuffer, tokens2[tokenNum].value, i);
		tokens2[tokenNum].type = G_setTokenType2( tokens2[tokenNum].value );
		tokenNum++;
	}
	maxTokennum = tokenNum;
	
	G_Printf("Mapfile parser found %i tokens\n", maxTokennum );
	
	for( tokenNum = 0; tokenNum < maxTokennum; tokenNum++ ){
			if( strcmp( tokens2[tokenNum].value, "{" ) == 0 ){
				//CG_Printf("lpar found\n");
				lpar = tokenNum;
				if( G_AbeforeB2((char*)"{",(char*)"}", tokens2, tokenNum+2)){
					G_Printf("error: \"}\" expected at %s\n", tokens2[tokenNum].value);
					break;
				}
				//CG_Printf("debug abeforeb\n");
				rpar = G_FindNextToken2((char*)"}", tokens2, tokenNum+2 );
				//CG_Printf("debug findnexttoken\n");
				if( rpar != -1 ){
					G_LoadMapfileEntity(tokens2, lpar+1, rpar-1);
					//G_setHudElement(i, tokens, lpar+1, rpar-1);
					tokenNum = rpar;
				}	
			}	
	}
	SaveRegisteredItems();
	
}

void G_LoadMapfile_f( void ) {
	char buf[MAX_QPATH];
	char mapname[64];
	int	i;
	
	for (i = 0; i < MAX_CLIENTS; i++ ) {
		if ( g_entities[i].singlebot >= 1 ) {
			DropClientSilently( g_entities[i].client->ps.clientNum );
		}
	}
	
	if ( trap_Argc() < 2 ) {
                G_Printf("Usage: loadmap <filename>\n");
		return;
	}
	
	trap_Argv( 1, buf, sizeof( buf ) );
	
	G_LoadMapfile(buf);
	trap_Cvar_Set("mapfile",buf);
	trap_Cvar_VariableStringBuffer("mapname", mapname, sizeof(mapname));
	trap_Cvar_Set("lastmap",mapname);
}

void G_WriteMapfile_f( void ) {
	int i;
	fileHandle_t f;
	char *string;
	char buf[MAX_QPATH];
	fieldCopy_t *field;
	byte	*b;
	
	if ( trap_Argc() < 2 ) {
                G_Printf("Usage: savemap <filename>\n");
		return;
	}
	
	trap_Argv( 1, buf, sizeof( buf ) );
	
	trap_FS_FOpenFile(va("%s", buf ),&f,FS_WRITE);
	
	for( i = 0; i < MAX_GENTITIES; i++ ){
	  
		if( !g_entities[i].inuse )
			continue;
		
		if( !G_ClassnameAllowed(g_entities[i].classname) )
			continue;
		b = (byte *) &g_entities[i];
		
		string = va("{\n");
		trap_FS_Write(string, strlen(string), f);
		
		for( field=fieldsCopy; field->name; field++ ){
			switch( field->type ) {
			case F_STRING:
				if( *(char **)(b+field->ofs) ){
					string = va("   \"%s\"   \"%s\"\n", field->name, *(char **)(b+field->ofs) );
					trap_FS_Write(string, strlen(string), f);
				}
				break;
			case F_VECTOR:
				if( (((float *)(b+field->ofs))[0] || ((float *)(b+field->ofs))[1] || ((float *)(b+field->ofs))[2]) ){
					string = va("   \"%s\"   \"%f %f %f\"\n", field->name, ((float *)(b+field->ofs))[0], ((float *)(b+field->ofs))[1], ((float *)(b+field->ofs))[2] );
					trap_FS_Write(string, strlen(string), f);
				}
				break;
			case F_INT:
				if( *(int *)(b+field->ofs) ){
					string = va("   \"%s\"   \"%i\"\n", field->name, *(int *)(b+field->ofs) );
					trap_FS_Write(string, strlen(string), f);
				}
				break;
			case F_FLOAT:
				if( *(float *)(b+field->ofs) ){
					string = va("   \"%s\"   \"%f\"\n", field->name, *(float *)(b+field->ofs) );
					trap_FS_Write(string, strlen(string), f);
				}
				break;
			default:
			case F_IGNORE:
				break;
			}
		}
		string = va("}\n\n");
		trap_FS_Write(string, strlen(string), f);
	}
	trap_FS_FCloseFile(f);
}
