//KK-OAX
/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of the Open Arena source code.
Copied from Tremulous under GPL version 2 including any later version.

Open Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Open Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Open Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/

#include "g_local.h"

/*
============
Svcmd_status_f
Does Server Status from Console
============
*/
void Svcmd_Status_f( void )
{
    int       i;
    gclient_t *cl;
    char      userinfo[ MAX_INFO_STRING ];

    G_Printf( "slot score ping address               rate     name\n" );
    G_Printf( "---- ----- ---- -------               ----     ----\n" );
    for( i = 0, cl = level.clients; i < level.maxclients; i++, cl++ )
    {
        if( cl->pers.connected == CON_DISCONNECTED )
            continue;

        G_Printf( "%-4d ", i );
        G_Printf( "%-5d ", cl->ps.persistant[ PERS_SCORE ] );

        if( cl->pers.connected == CON_CONNECTING )
            G_Printf( "CNCT " );
        else
            G_Printf( "%-4d ", cl->ps.ping );

        trap_GetUserinfo( i, userinfo, sizeof( userinfo ) );
        G_Printf( "%-21s ", Info_ValueForKey( userinfo, "ip" ) );
        G_Printf( "%-8d ", Info_ValueForKey( userinfo, "rate" ) );
        G_Printf( "%s\n", cl->pers.netname ); // Info_ValueForKey( userinfo, "name" )
    }
}

/*
============
Svcmd_TeamMessage_f
Sends a Chat Message to a Team from the Console
============
*/
void Svcmd_TeamMessage_f( void )
{
  char   teamNum[ 2 ];
  const char*   prefix;
  team_t team;

  if( trap_Argc( ) < 3 )
  {
    G_Printf( "usage: say_team <team> <message>\n" );
    return;
  }

  trap_Argv( 1, teamNum, sizeof( teamNum ) );
  team = G_TeamFromString( teamNum );

  if( team == TEAM_NUM_TEAMS )
  {
    G_Printf( "say_team: invalid team \"%s\"\n", teamNum );
    return;
  }

  prefix = BG_TeamName( team );
  prefix = va( "[%c] ", toupper( *prefix ) );

  G_TeamCommand( team, va( "tchat \"(console): " S_COLOR_CYAN "%s\"", ConcatArgs( 2 ) ) );
  G_LogPrintf( "sayteam: %sconsole: " S_COLOR_CYAN "%s\n", prefix, ConcatArgs( 2 ) );
}

/*
============
Svcmd_CenterPrint_f
Does a CenterPrint from the Console
============
*/
void Svcmd_CenterPrint_f( void )
{
  if( trap_Argc( ) < 2 )
  {
    G_Printf( "usage: cp <message>\n" );
    return;
  }

  trap_SendServerCommand( -1, va( "cp \"%s\"", ConcatArgs( 1 ) ) );
}
/*
============
Svcmd_ReplaceTexture_f
Replace texture
============
*/
void Svcmd_ReplaceTexture_f( void )
{
	char   oldtexture[1024];
	char   newtexture[1024];
  if( trap_Argc( ) == 1 ){
    G_Printf( "usage: replacetexture <oldtexture> <newtexture>\n" );
  return;}
  
  trap_Argv( 1, oldtexture, sizeof( oldtexture ) );
  trap_Argv( 2, newtexture, sizeof( newtexture ) );

  AddRemap(va( "%s", oldtexture), va( "%s", newtexture), level.time * 0.005); 
  trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
}
/*
============
ArenaScript
By Noire.dev
============
*/
/*
============
Svcmd_Condition_f
If operator
============
*/
void Svcmd_Condition_f( void )
{
	char   value01[256];
	char   symbol[256];
	char   value02[256];
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: if <value01> <symbol> <value02> <cmd...>\n" );
	G_Printf( "<value01> | any type\n" );
	G_Printf( "<symbol> | =, ==, !=, !==, <, >, <=, >=\n" );
	G_Printf( "<value02> | any type\n" );
    return;}
  
  trap_Argv( 1, value01, sizeof( value01 ) );
  trap_Argv( 2, symbol, sizeof( symbol ) );
  trap_Argv( 3, value02, sizeof( value02 ) );
  
		if(!Q_stricmp (symbol, "=")){
			if(!Q_stricmp (G_ArenaScriptAutoChar( value01 ), G_ArenaScriptAutoChar( value02 ))){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, "==")){
			if(G_ArenaScriptAutoInt( value01 ) == G_ArenaScriptAutoInt( value02 )){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, "!=")){
			if(Q_stricmp (G_ArenaScriptAutoChar( value01 ), G_ArenaScriptAutoChar( value02 )) != 0){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, "!==")){
			if(G_ArenaScriptAutoInt( value01 ) != G_ArenaScriptAutoInt( value02 )){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, "<")){
			if(G_ArenaScriptAutoInt( value01 ) < G_ArenaScriptAutoInt( value02 )){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, ">")){
			if(G_ArenaScriptAutoInt( value01 ) > G_ArenaScriptAutoInt( value02 )){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, "<=")){
			if(G_ArenaScriptAutoInt( value01 ) <= G_ArenaScriptAutoInt( value02 )){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}
		if(!Q_stricmp (symbol, ">=")){
			if(G_ArenaScriptAutoInt( value01 ) >= G_ArenaScriptAutoInt( value02 )){
				trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 4 )) );
			}
		}

}


/*
============
Svcmd_Operation_f
Calculate operator
============
*/
void Svcmd_Operation_f( void )
{
	char   value01[256];
	char   symbol[256];
	char   value02[256];
	int number01;
	int number02;
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: op <value01> <symbol> <value02>\n" );
	G_Printf( "<value01> | any type\n" );
	G_Printf( "<symbol> | =, +=, -=, *=, /=\n" );
	G_Printf( "<value02> | any type\n" );
    return;}
  
  trap_Argv( 1, value01, sizeof( value01 ) );
  trap_Argv( 2, symbol, sizeof( symbol ) );
  trap_Argv( 3, value02, sizeof( value02 ) );
  number01 = G_ArenaScriptAutoInt( value01 );
  number02 = G_ArenaScriptAutoInt( value02 );

		if(!Q_stricmp (symbol, "+=")){
			number01 += number02;
			trap_Cvar_Set( value01, va("%i", number01) );
		}
		if(!Q_stricmp (symbol, "-=")){
			number01 -= number02;
			trap_Cvar_Set( value01, va("%i", number01) );
		}
		if(!Q_stricmp (symbol, "*=")){
			number01 *= number02;
			trap_Cvar_Set( value01, va("%i", number01) );
		}
		if(!Q_stricmp (symbol, "/=")){
			number01 /= number02;
			trap_Cvar_Set( value01, va("%i", number01) );
		}
		if(!Q_stricmp (symbol, "=")){
			trap_Cvar_Set( value01, va("%s", G_ArenaScriptAutoChar( value02 )) );
		}

}

/*
============
Svcmd_Random_f
Random set operator
============
*/
void Svcmd_Random_f( void )
{
	char   value01[256];
	char   symbol[256];
	char   min[256];
	char   max[256];
	float number01;
	float number02;
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: random <variable> <symbol> <min> <max>\n" );
    G_Printf( "<variable> | any type\n" );
	G_Printf( "<symbol> | =, +=, -=, *=, /=\n" );
	G_Printf( "<min> | integer\n" );
	G_Printf( "<max> | integer\n" );
    return;}
  
  trap_Argv( 1, value01, sizeof( value01 ) );
  trap_Argv( 2, symbol, sizeof( symbol ) );
  trap_Argv( 3, min, sizeof( min ) );
  trap_Argv( 4, max, sizeof( max ) );
  number01 = G_ArenaScriptAutoInt( value01 );
  number02 = G_ArenaScriptRandom( atoi(min), atoi(max) );

		if(!Q_stricmp (symbol, "=")){
			number01 = number02;
				trap_Cvar_Set( value01, va("%f", number01) );
		}
		if(!Q_stricmp (symbol, "+=")){
			number01 += number02;
				trap_Cvar_Set( value01, va("%f", number01) );
		}
		if(!Q_stricmp (symbol, "-=")){
			number01 -= number02;
				trap_Cvar_Set( value01, va("%f", number01) );
		}
		if(!Q_stricmp (symbol, "*=")){
			number01 *= number02;
				trap_Cvar_Set( value01, va("%f", number01) );
		}
		if(!Q_stricmp (symbol, "/=")){
			number01 /= number02;
				trap_Cvar_Set( value01, va("%f", number01) );
		}

}

/*
============
Svcmd_Editline_f
Editing line with variables
============
*/
void Svcmd_Editline_f( void )
{
	char   destcvar[256];
	char   mode[256];
	char   value[256];
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: editline <variable> <mode> <value>\n" );
	G_Printf( "<variable> | any type\n" );
	G_Printf( "<mode> | add, begin\n" );
	G_Printf( "<value> | any type\n" );
    return;}
  
  trap_Argv( 1, destcvar, sizeof( destcvar ) );
  trap_Argv( 2, mode, sizeof( mode ) );
  trap_Argv( 3, value, sizeof( value ) );

	if(!Q_stricmp (mode, "add")){
	trap_Cvar_Set( destcvar, va("%s%s", AU_Cvar_VariableString(destcvar), G_ArenaScriptAutoChar( value )) );
	}
	
	if(!Q_stricmp (mode, "begin")){
	trap_Cvar_Set( destcvar, va("%s%s", G_ArenaScriptAutoChar( value ), AU_Cvar_VariableString(destcvar)) );
	}
	
}

/*
==================
FindClByName
==================
*/
int FindClByName(char *name) {
	int i;
	char buf[MAX_INFO_STRING];
	gclient_t		*client;

	for (i = -1; i < level.maxclients; i++) {
	if(!Q_stricmp (name, va("%i", i))){
		return atoi(name);
	}
	}

	for (i = 0; i < level.maxclients; i++) {
		client = &level.clients[i];
		if(!Q_stricmp (name, client->pers.netname)){
		return client->ps.clientNum;
		}
	}
	return 0;
}

/*
============
Svcmd_ClientCommand_f
Editing line with variables
============
*/
void Svcmd_ClientCommand_f( void )
{
	char   num[256];
	char   cmdtype[256];
	char   cmd[256];
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: clientcmd <num or name> <type> <cmd>\n" );
	G_Printf( "<num> | clientnum (-1 for all)\n" );
	G_Printf( "<cmd> | any cmd\n" );
    return;}
  
  trap_Argv( 1, num, sizeof( num ) );
  trap_Argv( 2, cmdtype, sizeof( cmdtype ) );
  trap_Argv( 3, cmd, sizeof( cmd ) );

if(atoi(cmdtype) == 0 || atoi(cmdtype) == 1){
  trap_SendServerCommand( FindClByName(num), va("clcmd \"%s\"", cmd));
}
if(atoi(cmdtype) == 2){
  trap_SendServerCommand( FindClByName(num), va("\"%s\"", cmd));
}
if(atoi(cmdtype) == 3){
  trap_EA_Say( FindClByName(num), va("\"%s\"", cmd));
}
if(atoi(cmdtype) == 4){
  trap_EA_SayTeam( FindClByName(num), va("\"%s\"", cmd));
}
if(atoi(cmdtype) == 5){
  trap_EA_Command( FindClByName(num), va("\"%s\"", cmd));
}
}

/*
============
Svcmd_SystemCommand_f
Editing line with variables
============
*/
void Svcmd_SystemCommand_f( void )
{
	char   cmd[256];
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: syscmd <cmd>\n" );
	G_Printf( "<cmd> | any cmd\n" );
    return;}
  
  trap_Argv( 1, cmd, sizeof( cmd ) );
	
  trap_System( va("\"%s\"", cmd));
	
}

/*
============
Svcmd_SaveSession_f
Editing line with variables
============
*/
void Svcmd_SaveSession_f( void )
{
	char   num[1024];
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: save <number>\n" );
	G_Printf( "<number> | any slot 1-8\n" );
    return;}
  
  trap_Argv( 1, num, sizeof( num ) );
  
	G_UpdateClientSessionDataForMapChange( level.player->client );
	G_UpdateGlobalSessionDataForMapChange();
	G_SaveClientSessionDataSave( level.player->client );

	if(atoi(num) == 1){
	trap_Cvar_Set( "save1_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save1_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save1_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save1_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save01\n" );
	}
	if(atoi(num) == 2){
	trap_Cvar_Set( "save2_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save2_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save2_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save2_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save02\n" );
	}
	if(atoi(num) == 3){
	trap_Cvar_Set( "save3_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save3_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save3_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save3_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save03\n" );
	}
	if(atoi(num) == 4){
	trap_Cvar_Set( "save4_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save4_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save4_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save4_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save04\n" );
	}
	if(atoi(num) == 5){
	trap_Cvar_Set( "save5_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save5_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save5_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save5_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save05\n" );
	}
	if(atoi(num) == 6){
	trap_Cvar_Set( "save6_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save6_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save6_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save6_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save06\n" );
	}
	if(atoi(num) == 7){
	trap_Cvar_Set( "save7_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save7_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save7_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save7_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save07\n" );
	}
	if(atoi(num) == 8){
	trap_Cvar_Set( "save8_session0", G_ArenaScriptAutoChar( "save_session0" ) );
	trap_Cvar_Set( "save8_session0_lvl", G_ArenaScriptAutoChar( "save_session0_lvl" ) );
	trap_Cvar_Set( "save8_epsession", G_ArenaScriptAutoChar( "save_epsession" ) );
	trap_Cvar_Set( "save8_curmap", G_ArenaScriptAutoChar( "save_curmap" ) );
	trap_SendConsoleCommand( EXEC_INSERT, "writeconfig save08\n" );
	}
}

/*
============
Svcmd_Cvar_f
Editing line with variables
============
*/
void Svcmd_Cvar_f( void )
{
	char   mode[256];
	char   cvarname[256];
	char   targetcvar[256];
	if( trap_Argc( ) == 1 ){
    G_Printf( "usage: cvar <mode> <cvarname> <targetcvar>\n" );
	G_Printf( "<mode> | delete, save, load,\n" );
	G_Printf( "<cvarname> | any cvar\n" );
	G_Printf( "<targetcvar> | any cvar\n" );
    return;}
  
  trap_Argv( 1, mode, sizeof( mode ) );
  trap_Argv( 2, cvarname, sizeof( cvarname ) );
  trap_Argv( 3, targetcvar, sizeof( targetcvar ) );

	if(!Q_stricmp (mode, "delete")){
	trap_SendConsoleCommand( EXEC_APPEND, va("unset %s\n", cvarname));
	}
	
	if(!Q_stricmp (mode, "save")){
	trap_SendConsoleCommand( EXEC_APPEND, va("seta %s %s\n", targetcvar, G_ArenaScriptAutoChar( cvarname )));
	}
	
	if(!Q_stricmp (mode, "load")){
	trap_SendConsoleCommand( EXEC_APPEND, va("set %s %s\n", cvarname, G_ArenaScriptAutoChar( targetcvar )));
	}
	
}

/*
============
Svcmd_For_f
For operator
============
*/
void Svcmd_For_f( void )
{
	int    i;
	char   value01[256];
	char   symbol[256];
	char   value02[256];
	char   value03[256];
  if( trap_Argc( ) == 1 ){
    G_Printf( "usage: for <initial> <symbol> <value> <increment> <cmd...>\n" );
	G_Printf( "<initial> | int number type\n" );
	G_Printf( "<symbol> | ==, !=, <, >, <=, >=\n" );
	G_Printf( "<value> | int number type\n" );
	G_Printf( "<increment> | int number type\n" );
    return;}
  
  trap_Argv( 1, value01, sizeof( value01 ) );
  trap_Argv( 2, symbol, sizeof( symbol ) );
  trap_Argv( 3, value02, sizeof( value02 ) );
  trap_Argv( 4, value03, sizeof( value03 ) );
  
if(!Q_stricmp (symbol, "==")){ 
for( i = G_ArenaScriptAutoInt( value01 ); i == G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
}
}
if(!Q_stricmp (symbol, "!=")){
for( i = G_ArenaScriptAutoInt( value01 ); i != G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
}
}
if(!Q_stricmp (symbol, "<")){
for( i = G_ArenaScriptAutoInt( value01 ); i < G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
}
}
if(!Q_stricmp (symbol, ">")){
for( i = G_ArenaScriptAutoInt( value01 ); i > G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
}
}
if(!Q_stricmp (symbol, "<=")){
for( i = G_ArenaScriptAutoInt( value01 ); i <= G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
}
}
if(!Q_stricmp (symbol, ">=")){
for( i = G_ArenaScriptAutoInt( value01 ); i >= G_ArenaScriptAutoInt( value02 ); i += G_ArenaScriptAutoInt( value03 ) ){
	trap_SendConsoleCommand( EXEC_INSERT, va("%s\n", ConcatArgs( 5 )) );
}
}

}

/*
============
Svcmd_BannerPrint_f
Does a BannerPrint from the Console
KK-OAX Commented out in g_svccmds.c, so right now it's useless.
============
*/
void Svcmd_BannerPrint_f( void )
{
  if( trap_Argc( ) < 2 )
  {
    G_Printf( "usage: bp <message>\n" );
    return;
  }

  trap_SendServerCommand( -1, va( "bp \"%s\"", ConcatArgs( 1 ) ) );
}
/*
============
Svcmd_EjectClient_f
Kicks a Client from Console
KK-OAX, I'm pretty sure this is also done in the "server" portion 
of the engine code with "kick," but oh well. 
============
*/
void Svcmd_EjectClient_f( void )
{
  char *reason, name[ MAX_STRING_CHARS ];

  if( trap_Argc( ) < 2 )
  {
    G_Printf( "usage: eject <player|-1> <reason>\n" );
    return;
  }

  trap_Argv( 1, name, sizeof( name ) );
  reason = ConcatArgs( 2 );

  if( atoi( name ) == -1 )
  {
    int i;
    for( i = 0; i < level.maxclients; i++ )
    {
      if( level.clients[ i ].pers.connected == CON_DISCONNECTED )
        continue;
      if( level.clients[ i ].pers.localClient )
        continue;
      trap_DropClient( i, reason );
    }
  }
  else
  {
    gclient_t *cl = ClientForString( name );
    if( !cl )
      return;
    if( cl->pers.localClient )
    {
      G_Printf( "eject: cannot eject local clients\n" );
      return;
    }
    trap_DropClient( cl-level.clients, reason );
  }
}

/*
============
Svcmd_DumpUser_f
Shows User Info
============
*/
void Svcmd_DumpUser_f( void )
{
  char name[ MAX_STRING_CHARS ], userinfo[ MAX_INFO_STRING ];
  char key[ BIG_INFO_KEY ], value[ BIG_INFO_VALUE ];
  const char *info;
  gclient_t *cl;

  if( trap_Argc( ) != 2 )
  {
    G_Printf( "usage: dumpuser <player>\n" );
    return;
  }

  trap_Argv( 1, name, sizeof( name ) );
  cl = ClientForString( name );
  if( !cl )
    return;

  trap_GetUserinfo( cl-level.clients, userinfo, sizeof( userinfo ) );
  info = &userinfo[ 0 ];
  G_Printf( "userinfo\n--------\n" );
  //Info_Print( userinfo );
  while( 1 )
  {
    Info_NextPair( &info, key, value );
    if( !*info )
      return;

    G_Printf( "%-20s%s\n", key, value );
  }
}

void Svcmd_Chat_f( void )
{
    trap_SendServerCommand( -1, va( "chat \"%s\"", ConcatArgs( 1 ) ) );
    G_LogPrintf("chat: %s\n", ConcatArgs( 1 ) );
}

/*
=============
Svcmd_ListIP_f
Dumb Wrapper for the trap_Send command
=============
*/
void Svcmd_ListIP_f( void )
{
    trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
}

/*
=============
Svcmd_MessageWrapper
Dumb wrapper for "a" and "m" and "say"
=============
*/
void Svcmd_MessageWrapper( void )
{
  char cmd[ 5 ];
  trap_Argv( 0, cmd, sizeof( cmd ) );
  /*if( !Q_stricmp( cmd, "a" ) )
    Cmd_AdminMessage_f( NULL );
  else if( !Q_stricmp( cmd, "m" ) )
    Cmd_PrivateMessage_f( NULL );
  else*/
  if( !Q_stricmp( cmd, "say" ) )
    G_Say( NULL, NULL, SAY_ALL, ConcatArgs( 1 ) );
}

/*
============
Svcmd_HideSandObj_f
Replace texture
============
*/
void Svcmd_HideSandObj_f( void )
{
	char   oldtexture[256];
	char   newtexture[256];
  if( trap_Argc( ) == 1 ){
    G_Printf( "usage: replacetexture <oldtexture> <newtexture>\n" );
  return;}
  
  trap_Argv( 1, oldtexture, sizeof( oldtexture ) );
  trap_Argv( 2, newtexture, sizeof( newtexture ) );

  AddRemap(va( "%s", oldtexture), va( "%s", newtexture), level.time * 0.005); 
  trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
}

/*
============
Svcmd_NS_OpenScript_f
Opens Noire.Script file
============
*/
void Svcmd_NS_OpenScript_f( void )
{
	int    i;
	char   filename[256];
	if( trap_Argc( ) == 1 ){
		G_Printf( "usage: ns_openscript <filename>\n" );
		return;
	}
  
	trap_Argv( 1, filename, sizeof( filename ) );
  
	NS_OpenScript(filename);

}
