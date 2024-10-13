export G_ReadAltKillSettings
code
proc G_ReadAltKillSettings 120 16
file "../../../code/game/g_killspree.c"
line 40
;1:/*
;2:===========================================================================
;3:Copyright (C) 2009 Karl Kuglin
;4:
;5:This file is part of the Open Arena source code.
;6:Parts of this file utilize code originally written for Tremulous by 
;7:Tony J. White.
;8:Use of that code is governed by GPL version 2 and any later versions. 
;9:
;10:Open Arena source code is free software; you can redistribute it
;11:and/or modify it under the terms of the GNU General Public License as
;12:published by the Free Software Foundation; either version 2 of the License,
;13:or (at your option) any later version.
;14:
;15:Open Arena source code is distributed in the hope that it will be
;16:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;17:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;18:GNU General Public License for more details.
;19:
;20:You should have received a copy of the GNU General Public License
;21:along with Open Arena source code; if not, write to the Free Software
;22:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;23:===========================================================================
;24:*/
;25:// NOTE: This code is by no means complete. 
;26:
;27:#include "g_local.h"
;28:
;29:killspree_t *killSprees[ MAX_KSPREE ];
;30:deathspree_t *deathSprees[ MAX_DSPREE ];
;31:multikill_t *multiKills[ MAX_MULTIKILLS ];
;32:
;33:/*
;34:=================
;35:G_ReadAltKillSettings
;36:Since this is cvar dependent, it has to be placed in G_InitGame after cvars are registered.
;37:=================
;38:*/
;39:qboolean G_ReadAltKillSettings( gentity_t *ent, int skiparg )
;40:{
line 42
;41:    //Let's Initialize some Spree structs/objects
;42:    killspree_t     *k = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 43
;43:    deathspree_t    *d = NULL;
ADDRLP4 36
CNSTP4 0
ASGNP4
line 44
;44:    multikill_t     *m = NULL;
ADDRLP4 48
CNSTP4 0
ASGNP4
line 46
;45:    //spree counters
;46:    int             ksc = 0, dsc = 0, mc = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
line 50
;47:    int             spreeDivisor;
;48:    
;49:    //Give us an int to use in "for" loops
;50:    int             i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 62
;51:    
;52:    //File Stuff
;53:    fileHandle_t    file;
;54:    int             length;
;55:    qboolean        kspree_read;
;56:    qboolean        dspree_read;
;57:    qboolean        mkill_read;
;58:    char            *cnf, *cnf2;
;59:    char            *t;
;60:
;61:    //Let's clear out any existing killing sprees/death sprees. YAYY BG_FREE!!!!!
;62:    for( i = 0; i < MAX_KSPREE && killSprees[ i ]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $68
JUMPV
LABELV $65
line 63
;63:        BG_Free( killSprees[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 64
;64:        killSprees[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
CNSTP4 0
ASGNP4
line 65
;65:    }
LABELV $66
line 62
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $68
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $69
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $65
LABELV $69
line 67
;66:        
;67:    for( i = 0; i < MAX_KSPREE && deathSprees[ i ]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $70
line 68
;68:        BG_Free( deathSprees[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 69
;69:        deathSprees[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
CNSTP4 0
ASGNP4
line 70
;70:    }
LABELV $71
line 67
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $73
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $70
LABELV $74
line 72
;71:    
;72:    for( i = 0; i < MAX_MULTIKILLS && multiKills[ i ]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $78
JUMPV
LABELV $75
line 73
;73:        BG_Free( multiKills[ i ] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 74
;74:        multiKills[ i ] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
CNSTP4 0
ASGNP4
line 75
;75:    }    
LABELV $76
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $78
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $79
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $75
LABELV $79
line 78
;76:    
;77:    // If the config file is not defined...forget reading/loading
;78:    if( !g_sprees.string[0] ) {
ADDRGP4 g_sprees+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $80
line 80
;79:        //Let's disable multikills to keep stock excellent sound
;80:        if( g_altExcellent.integer == 1 )
ADDRGP4 g_altExcellent+12
INDIRI4
CNSTI4 1
NEI4 $83
line 81
;81:        {
line 82
;82:            trap_Cvar_Set( "g_altExcellent", "0" );
ADDRGP4 $86
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 83
;83:        }
LABELV $83
line 84
;84:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $80
line 91
;85:    }
;86:    /* 
;87:    only set spreeDivisor to cvar g_spreeDiv if g_spreeDiv is >= "2".
;88:    0 will cause problems and having 1 is just a fool who wants to hear something
;89:    on every kill.      
;90:    */  
;91:    if( g_spreeDiv.integer >= 2 ) {
ADDRGP4 g_spreeDiv+12
INDIRI4
CNSTI4 2
LTI4 $88
line 92
;92:        level.spreeDivisor = g_spreeDiv.integer;
ADDRGP4 level+10256
ADDRGP4 g_spreeDiv+12
INDIRI4
ASGNI4
line 93
;93:        spreeDivisor = level.spreeDivisor;
ADDRLP4 60
ADDRGP4 level+10256
INDIRI4
ASGNI4
line 94
;94:    } else {
ADDRGP4 $89
JUMPV
LABELV $88
line 95
;95:        level.spreeDivisor = 5;
ADDRGP4 level+10256
CNSTI4 5
ASGNI4
line 98
;96:        // We don't want to change the value, keep reminding the server operator.
;97:        //g_spreeDiv.integer = 5;
;98:        spreeDivisor = 5; 
ADDRLP4 60
CNSTI4 5
ASGNI4
line 99
;99:        G_Printf( "Error: cvar g_spreeDiv must not be set to 0 or 1, reverting to default settings!\n" );
ADDRGP4 $95
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 100
;100:        G_Printf( "Error: Set g_spreeDiv higher than 1 if 5 is not desired!\n" );
ADDRGP4 $96
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 101
;101:    } 
LABELV $89
line 103
;102:    
;103:    length = trap_FS_FOpenFile( g_sprees.string, &file, FS_READ );
ADDRGP4 g_sprees+16
ARGP4
ADDRLP4 52
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 76
INDIRI4
ASGNI4
line 106
;104:    
;105:    //If the file can't be accessed/opened. 
;106:    if( length < 0 ) {
ADDRLP4 44
INDIRI4
CNSTI4 0
GEI4 $98
line 107
;107:        G_Printf( "Could not open configuration file for Sprees and Multikills %s\n", g_sprees.string );
ADDRGP4 $100
ARGP4
ADDRGP4 g_sprees+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 108
;108:        trap_Cvar_Set( "g_altExcellent", "0" );
ADDRGP4 $86
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 109
;109:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $98
line 112
;110:    }
;111:    //Allocate some memory.
;112:    cnf = BG_Alloc( length + 1 );
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
CVIU4 4
ARGU4
ADDRLP4 80
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 80
INDIRP4
ASGNP4
line 113
;113:    cnf2 = cnf;
ADDRLP4 56
ADDRLP4 8
INDIRP4
ASGNP4
line 116
;114:    
;115:    //Load the whole file up. 
;116:    trap_FS_Read( cnf, length, file );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 117
;117:    *( cnf + length ) = '\0';
ADDRLP4 44
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 118
;118:    trap_FS_FCloseFile( file );
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 120
;119:    
;120:    kspree_read = dspree_read = mkill_read = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 28
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 20
ADDRLP4 84
INDIRI4
ASGNI4
line 123
;121:    
;122:    //Let's start parsing em. 
;123:    COM_BeginParseSession( g_sprees.string );
ADDRGP4 g_sprees+16
ARGP4
ADDRGP4 COM_BeginParseSession
CALLV
pop
ADDRGP4 $104
JUMPV
LABELV $103
line 125
;124:    while( 1 )
;125:    {
line 126
;126:        t = COM_Parse( &cnf );
ADDRLP4 8
ARGP4
ADDRLP4 88
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 88
INDIRP4
ASGNP4
line 127
;127:        if( !*t )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $106
line 128
;128:            break;
ADDRGP4 $105
JUMPV
LABELV $106
line 129
;129:        if( !Q_stricmp( t, "[kspree]" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $110
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $108
line 131
;130:            
;131:            if( ksc >= MAX_KSPREE )
ADDRLP4 12
INDIRI4
CNSTI4 32
LTI4 $111
line 132
;132:                return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $111
line 133
;133:            k = BG_Alloc( sizeof( killspree_t ) );
CNSTU4 2060
ARGU4
ADDRLP4 96
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 96
INDIRP4
ASGNP4
line 134
;134:            killSprees[ ksc++ ] = k;
ADDRLP4 100
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 135
;135:            kspree_read = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 136
;136:            dspree_read = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 137
;137:            mkill_read = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 139
;138:            
;139:        } else if ( !Q_stricmp( t, "[dspree]" ) ) {
ADDRGP4 $109
JUMPV
LABELV $108
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $113
line 141
;140:        
;141:            if( dsc >= MAX_DSPREE )
ADDRLP4 32
INDIRI4
CNSTI4 32
LTI4 $116
line 142
;142:                return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $116
line 143
;143:            d = BG_Alloc( sizeof( deathspree_t ) );
CNSTU4 2060
ARGU4
ADDRLP4 100
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 100
INDIRP4
ASGNP4
line 144
;144:            deathSprees[ dsc++ ] = d;
ADDRLP4 104
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 104
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 145
;145:            dspree_read = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 146
;146:            kspree_read = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 147
;147:            mkill_read = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 148
;148:        } else if ( !Q_stricmp( t, "[mkill]" ) ) {
ADDRGP4 $114
JUMPV
LABELV $113
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $118
line 150
;149:            
;150:            if( mc >= MAX_MULTIKILLS )
ADDRLP4 40
INDIRI4
CNSTI4 32
LTI4 $121
line 151
;151:                return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $121
line 152
;152:            m = BG_Alloc( sizeof( multikill_t ) );
CNSTU4 2052
ARGU4
ADDRLP4 104
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 104
INDIRP4
ASGNP4
line 153
;153:            multiKills[ mc++ ] = m;
ADDRLP4 108
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 40
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
line 154
;154:            mkill_read = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 155
;155:            kspree_read = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 156
;156:            dspree_read = qfalse; 
ADDRLP4 24
CNSTI4 0
ASGNI4
line 158
;157:        //Parse a killing spree    
;158:        } else if ( kspree_read ) {
ADDRGP4 $119
JUMPV
LABELV $118
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $123
line 159
;159:            if( !Q_stricmp( t, "level" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $125
line 160
;160:                readFile_int( &cnf, &k->spreeLevel );
ADDRLP4 8
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 162
;161:                //Let's take the spreeLevel and multiply it by the spreeDivisor to give us our count
;162:                k->streakCount = ( ( k->spreeLevel ) * ( spreeDivisor ) );
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
MULI4
ASGNI4
line 163
;163:            } else if ( !Q_stricmp( t, "message" ) ) {
ADDRGP4 $124
JUMPV
LABELV $125
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $128
line 164
;164:                readFile_string( &cnf, k->spreeMsg, sizeof( k->spreeMsg ) );
ADDRLP4 8
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 165
;165:            } else if ( !Q_stricmp( t, "printpos" ) ) {
ADDRGP4 $124
JUMPV
LABELV $128
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $131
line 166
;166:                readFile_int( &cnf, &k->position );
ADDRLP4 8
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 2056
ADDP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 167
;167:            } else if ( !Q_stricmp( t, "sound" ) ) {
ADDRGP4 $124
JUMPV
LABELV $131
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $134
line 168
;168:                readFile_string( &cnf, k->sound2Play, sizeof( k->sound2Play ) );
ADDRLP4 8
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1032
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 169
;169:            } else {
ADDRGP4 $124
JUMPV
LABELV $134
line 170
;170:                COM_ParseError( "Killing Spree unrecognized token \"%s\"", t );
ADDRGP4 $137
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 171
;171:            }
line 172
;172:        } else if ( dspree_read ) {
ADDRGP4 $124
JUMPV
LABELV $123
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $138
line 173
;173:            if( !Q_stricmp( t, "level" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $140
line 174
;174:                readFile_int( &cnf, &d->spreeLevel );
ADDRLP4 8
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 176
;175:                //Let's take the spreeLevel and multiply it by the spreeDivisor to give us our count
;176:                d->streakCount = ( ( d->spreeLevel ) * ( spreeDivisor ) );
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
MULI4
ASGNI4
line 177
;177:            } else if ( !Q_stricmp( t, "message" ) ) {
ADDRGP4 $139
JUMPV
LABELV $140
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $142
line 178
;178:                readFile_string( &cnf, d->spreeMsg, sizeof( d->spreeMsg ) );
ADDRLP4 8
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 179
;179:            } else if ( !Q_stricmp( t, "printpos" ) ) {
ADDRGP4 $139
JUMPV
LABELV $142
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $144
line 180
;180:                readFile_int( &cnf, &d->position );
ADDRLP4 8
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 2056
ADDP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 181
;181:            } else if ( !Q_stricmp( t, "sound" ) ) {
ADDRGP4 $139
JUMPV
LABELV $144
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $146
line 182
;182:                readFile_string( &cnf, d->sound2Play, sizeof( d->sound2Play ) );
ADDRLP4 8
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 1032
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 183
;183:            } else {
ADDRGP4 $139
JUMPV
LABELV $146
line 184
;184:                COM_ParseError( "Death Spree unrecognized token \"%s\"", t );
ADDRGP4 $148
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 185
;185:            }
line 186
;186:        } else if ( mkill_read ) {
ADDRGP4 $139
JUMPV
LABELV $138
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $149
line 187
;187:            if ( !Q_stricmp( t, "kills" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $151
line 188
;188:                readFile_int( &cnf, &m->kills );
ADDRLP4 8
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 2048
ADDP4
ARGP4
ADDRGP4 readFile_int
CALLV
pop
line 189
;189:            } else if ( !Q_stricmp( t, "message" ) ) {
ADDRGP4 $150
JUMPV
LABELV $151
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $154
line 190
;190:                readFile_string( &cnf, m->killMsg, sizeof( m->killMsg ) );
ADDRLP4 8
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 191
;191:            } else if ( !Q_stricmp( t, "sound" ) ) {
ADDRGP4 $150
JUMPV
LABELV $154
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $156
line 192
;192:                readFile_string( &cnf, m->sound2Play, sizeof( m->sound2Play ) );
ADDRLP4 8
ARGP4
ADDRLP4 116
CNSTI4 1024
ASGNI4
ADDRLP4 48
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 readFile_string
CALLV
pop
line 193
;193:            } else {
ADDRGP4 $150
JUMPV
LABELV $156
line 194
;194:                COM_ParseError( "Multikill unrecognized token \"%s\"", t );
ADDRGP4 $158
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 195
;195:            }
line 196
;196:        } else {
ADDRGP4 $150
JUMPV
LABELV $149
line 197
;197:            COM_ParseError( "unexpected token \"%s\"", t );
ADDRGP4 $159
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 COM_ParseError
CALLV
pop
line 198
;198:        }
LABELV $150
LABELV $139
LABELV $124
LABELV $119
LABELV $114
LABELV $109
line 199
;199:    }
LABELV $104
line 124
ADDRGP4 $103
JUMPV
LABELV $105
line 201
;200:    //Let's "free" some memory now.
;201:    BG_Free( cnf2 );
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 BG_Free
CALLV
pop
line 202
;202:    G_Printf("Sprees/Kills: loaded %d killing sprees, %d death sprees, and %d multikills.\n", ksc, dsc, mc );
ADDRGP4 $160
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 204
;203:    //Mark the Upper Bounds of the Arrays (Since they start numbering at 0, We subtract 1 )
;204:        level.kSpreeUBound = ( ksc - 1 );        
ADDRGP4 level+10244
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 205
;205:        level.dSpreeUBound = ( dsc - 1 );
ADDRGP4 level+10248
ADDRLP4 32
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 206
;206:    if( mc > 0 ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
LEI4 $163
line 207
;207:        level.mKillUBound = ( mc - 1 );
ADDRGP4 level+10252
ADDRLP4 40
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 208
;208:    } else {
ADDRGP4 $164
JUMPV
LABELV $163
line 209
;209:        level.mKillUBound = -1;
ADDRGP4 level+10252
CNSTI4 -1
ASGNI4
line 212
;210:        //KK-OAX We don't have any kills defined, revert to stock.
;211:        //FIXME: Make sure this change shows up in the console... 
;212:        if( g_altExcellent.integer == 1 ) {
ADDRGP4 g_altExcellent+12
INDIRI4
CNSTI4 1
NEI4 $167
line 213
;213:            trap_Cvar_Set( "g_altExcellent", "0" );
ADDRGP4 $86
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 214
;214:        }
LABELV $167
line 216
;215:             
;216:    }
LABELV $164
line 217
;217:    return qtrue;
CNSTI4 1
RETI4
LABELV $64
endproc G_ReadAltKillSettings 120 16
bss
align 1
LABELV $171
skip 150
code
proc fillPlaceHolder 28 20
line 222
;218:}
;219:
;220:
;221:static char *fillPlaceHolder( char *stringToSearch, char *placeHolder, char *replaceWith )
;222:{
line 226
;223:  static char output[ MAX_SAY_TEXT ];
;224:  char *p;
;225:
;226:  if( !( p = strstr( stringToSearch, placeHolder ) ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strstr
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
NEU4 $172
line 227
;227:    return stringToSearch;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $170
JUMPV
LABELV $172
line 229
;228:    
;229:  strncpy( output, stringToSearch, p - stringToSearch ); 
ADDRGP4 $171
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 230
;230:  output[ p - stringToSearch ] = '\0';
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDRGP4 $171
ADDP4
CNSTI1 0
ASGNI1
line 232
;231: 
;232:  Q_snprintf( output + ( p - stringToSearch ), output - stringToSearch,  "%s%s", replaceWith, p + strlen( placeHolder ) ); 
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
ADDRGP4 $171
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
SUBU4
CVUI4 4
ADDRLP4 24
INDIRP4
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $174
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 Q_snprintf
CALLI4
pop
line 234
;233:  
;234:  return output;
ADDRGP4 $171
RETP4
LABELV $170
endproc fillPlaceHolder 28 20
data
align 1
LABELV $176
byte 1 0
skip 149
code
proc CreateMessage 40 12
line 239
;235:}
;236:
;237://This concatenate's the message to broadcast to the clients. 
;238:static char *CreateMessage( gentity_t *ent, char *message, char *spreeNumber )
;239:{
line 244
;240:    static char output[ MAX_SAY_TEXT ] = { "" };
;241:  
;242:    char    name[ MAX_NAME_LENGTH ];
;243:    //Do some sanity checks
;244:    if( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $177
line 245
;245:        return output;
ADDRGP4 $176
RETP4
ADDRGP4 $175
JUMPV
LABELV $177
line 246
;246:    } else if ( !*message ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $179
line 247
;247:        return output;
ADDRGP4 $176
RETP4
ADDRGP4 $175
JUMPV
LABELV $179
line 248
;248:    } else if ( !spreeNumber ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $181
line 249
;249:        return output;
ADDRGP4 $176
RETP4
ADDRGP4 $175
JUMPV
LABELV $181
line 252
;250:    }
;251:    //Get the player name.
;252:    Q_strncpyz( name, ent->client->pers.netname, sizeof( name ) );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 254
;253:    //Do Our Replacements
;254:    Q_strncpyz( output, fillPlaceHolder( message, "[n]", name ), sizeof( output ) ); 
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 fillPlaceHolder
CALLP4
ASGNP4
ADDRGP4 $176
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 255
;255:    Q_strncpyz( output, fillPlaceHolder( output, "[k]", spreeNumber ), sizeof( output ) );
ADDRGP4 $176
ARGP4
ADDRGP4 $184
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 fillPlaceHolder
CALLP4
ASGNP4
ADDRGP4 $176
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 256
;256:    return output; 
ADDRGP4 $176
RETP4
LABELV $175
endproc CreateMessage 40 12
export G_RunStreakLogic
proc G_RunStreakLogic 36 12
line 269
;257:}
;258:
;259:
;260:/*
;261:================
;262:G_RunStreakLogic
;263:KK-OAX This is called from player_die.
;264:It does all the adding resetting of kill/death streaks
;265:to be compared against the kill/death spree levels.
;266:================
;267:*/
;268:void G_RunStreakLogic( gentity_t *attacker, gentity_t *victim ) 
;269:{
line 271
;270:    //We only want to sanity check for the victim at this point. 
;271:    if( !victim || !victim->client )
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $188
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $186
LABELV $188
line 272
;272:        return;
ADDRGP4 $185
JUMPV
LABELV $186
line 275
;273:    
;274:    //We will reset the victim's killstreak counter    
;275:    victim->client->pers.killstreak = 0;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 0
ASGNI4
line 277
;276:    //Add one to the death streak counter
;277:    victim->client->pers.deathstreak++;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 908
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 280
;278:    
;279:    //Let's check for a deathspree for the victim
;280:    G_CheckForSpree( victim, victim->client->pers.deathstreak, qfalse );
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_CheckForSpree
CALLV
pop
line 285
;281:
;282:    //Move on to the attacker
;283:    //Make sure they are a client and that the attacker and victim are not the same client
;284:    //We don't want suicide to count towards a killstreak...
;285:    if( ( attacker )
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRU4
ADDRLP4 24
INDIRU4
EQU4 $189
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $189
ADDRLP4 20
INDIRU4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $189
line 287
;286:        && ( attacker->client )
;287:        && ( attacker != victim ) ) {
line 290
;288:        
;289:        //Check the gametype--If FFA enabled, everybody's on the same team. 
;290:        if( g_gametype.integer >= GT_TEAM && g_ffa_gt!= 1 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $191
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $191
line 292
;291:            //If they are on the same team we don't want to count it towards a killing spree. 
;292:            if( OnSameTeam( victim, attacker ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $194
line 293
;293:                return;
ADDRGP4 $185
JUMPV
LABELV $194
line 295
;294:            }   
;295:        }
LABELV $191
line 297
;296:        //Add to the killstreak, reset the deathstreak
;297:        attacker->client->pers.deathstreak = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 908
ADDP4
CNSTI4 0
ASGNI4
line 298
;298:        attacker->client->pers.killstreak++;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 904
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 301
;299:        
;300:        //Let's check for a killingspree for the attacker
;301:        G_CheckForSpree( attacker, attacker->client->pers.killstreak, qtrue );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_CheckForSpree
CALLV
pop
line 303
;302:        
;303:    }     
LABELV $189
line 304
;304:}
LABELV $185
endproc G_RunStreakLogic 36 12
proc TestSpreeWhole 20 0
line 309
;305:
;306:
;307:
;308://If the streak / spree divisor is a whole number, we have a spree
;309:static qboolean TestSpreeWhole( int streak2Test ) {
line 316
;310:    float   float2Test;
;311:    float   spreeFDiv;
;312:    float   resultf;
;313:    int     spreeDiv;
;314:    int     result;
;315:
;316:    float2Test = streak2Test;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 317
;317:    spreeFDiv = level.spreeDivisor;
ADDRLP4 4
ADDRGP4 level+10256
INDIRI4
CVIF4 4
ASGNF4
line 318
;318:    spreeDiv = level.spreeDivisor;
ADDRLP4 12
ADDRGP4 level+10256
INDIRI4
ASGNI4
line 319
;319:    result = ( streak2Test / spreeDiv );
ADDRLP4 16
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
ASGNI4
line 320
;320:    resultf = ( float2Test / spreeFDiv );
ADDRLP4 8
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 322
;321:    
;322:    if( result == resultf ) {  
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
NEF4 $199
line 323
;323:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $199
line 324
;324:    } else {
line 325
;325:        return qfalse;
CNSTI4 0
RETI4
LABELV $196
endproc TestSpreeWhole 20 0
export G_CheckForSpree
proc G_CheckForSpree 52 16
line 335
;326:    }
;327:}
;328:
;329:/*
;330:==================
;331:G_CheckForSpree
;332:==================
;333:*/
;334:void G_CheckForSpree( gentity_t *ent, int streak2Test, qboolean checkKillSpree )
;335:{
line 344
;336:    int     i;
;337:    char    *returnedString;
;338:    //If somebody want's to award killing sprees above 99 kills he/she can mod this his/herself!!! :)
;339:    char    streakcount[ 3 ];
;340:    char    *sound;
;341:    int     position;
;342:    int     soundIndex;
;343:    
;344:    qboolean    isSpree = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 347
;345:    int         divisionHolder;
;346:	
;347:	if(g_gametype.integer == GT_SINGLE || g_gametype.integer == GT_SANDBOX){
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $206
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $202
LABELV $206
line 348
;348:		return;
ADDRGP4 $201
JUMPV
LABELV $202
line 352
;349:	}
;350:    
;351:    //Probably Not Needed, but to protect Server Ops from Crashing their Stuff MidMatch
;352:    if( level.spreeDivisor < 1 ) {
ADDRGP4 level+10256
INDIRI4
CNSTI4 1
GEI4 $207
line 353
;353:                return;
ADDRGP4 $201
JUMPV
LABELV $207
line 355
;354:    }
;355:    divisionHolder = ( streak2Test / level.spreeDivisor );
ADDRLP4 28
ADDRFP4 4
INDIRI4
ADDRGP4 level+10256
INDIRI4
DIVI4
ASGNI4
line 357
;356:    //if it's a deathspree
;357:    if( !checkKillSpree ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $211
line 359
;358:        //Is the streak higher than the largest level defined?
;359:        if( divisionHolder > level.dSpreeUBound ) {
ADDRLP4 28
INDIRI4
ADDRGP4 level+10248
INDIRI4
LEI4 $213
line 361
;360:            //Let's make sure it's a whole number to mimic the other sprees
;361:            isSpree = TestSpreeWhole( streak2Test );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 TestSpreeWhole
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
ASGNI4
line 362
;362:            if( !isSpree ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $216
line 363
;363:                return;
ADDRGP4 $201
JUMPV
LABELV $216
line 366
;364:            }
;365:            //We've made it this far...now do the largest spree defined.
;366:            Q_snprintf( streakcount, sizeof( streakcount ), "%i", streak2Test );
ADDRLP4 4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 $218
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_snprintf
CALLI4
pop
line 368
;367:            //Check if deathSprees is NULL (actual problem!)
;368:            if(!deathSprees[ level.dSpreeUBound ])
ADDRGP4 level+10248
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $219
line 369
;369:                return;
ADDRGP4 $201
JUMPV
LABELV $219
line 370
;370:            returnedString = CreateMessage( ent, deathSprees[ level.dSpreeUBound ]->spreeMsg, streakcount ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+10248
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 CreateMessage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 371
;371:            position = deathSprees[ level.dSpreeUBound ]->position;
ADDRLP4 20
ADDRGP4 level+10248
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ASGNI4
line 372
;372:            sound = deathSprees[ level.dSpreeUBound ]->sound2Play;
ADDRLP4 8
ADDRGP4 level+10248
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
line 373
;373:            soundIndex = G_SoundIndex( sound );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 375
;374:            //Play the Sound
;375:            G_GlobalSound( soundIndex );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_GlobalSound
CALLV
pop
line 377
;376:            //Print the Message
;377:            if( position == CENTER_PRINT ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $225
line 378
;378:                AP( va("cp \"%s\"", returnedString ) );
ADDRGP4 $227
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 379
;379:            } else {
ADDRGP4 $212
JUMPV
LABELV $225
line 380
;380:                AP( va("chat \"%s\"", returnedString ) );
ADDRGP4 $228
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 381
;381:            }
line 382
;382:        } else {
ADDRGP4 $212
JUMPV
LABELV $213
line 383
;383:            for( i = 0; deathSprees[ i ]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $232
JUMPV
LABELV $229
line 385
;384:                //If the deathSpree is equal to the streak to test
;385:                if( deathSprees[ i ]->streakCount == streak2Test ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $233
line 387
;386:                    //Using Q_snprintf to change the int into a char for replacement. 
;387:                    Q_snprintf( streakcount, sizeof( streakcount ), "%i", deathSprees[ i ]->streakCount );
ADDRLP4 4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 $218
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Q_snprintf
CALLI4
pop
line 389
;388:                    //Let's grab the message to show, fill up the placeholders and concatenate it. 
;389:                    returnedString = CreateMessage ( ent, deathSprees[ i ]->spreeMsg, streakcount );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 CreateMessage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 391
;390:                    //Grab the Print Position ( 1 for Center Printing, 2 for Chat ) 
;391:                    position = deathSprees[ i ]->position;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ASGNI4
line 393
;392:                    //Grab the Sound
;393:                    sound = deathSprees[ i ]->sound2Play;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
line 395
;394:                    //Index the Sound
;395:                    soundIndex = G_SoundIndex( sound );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 397
;396:                    //Play the Sound
;397:                    G_GlobalSound( soundIndex );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_GlobalSound
CALLV
pop
line 399
;398:                    //Print the Message
;399:                    if( position == CENTER_PRINT ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $235
line 400
;400:                        AP( va("cp \"%s\"", returnedString ) );
ADDRGP4 $227
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 401
;401:                    } else {
ADDRGP4 $212
JUMPV
LABELV $235
line 402
;402:                        AP( va("chat \"%s\"", returnedString ) );
ADDRGP4 $228
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 403
;403:                    }    
line 404
;404:                    break;
ADDRGP4 $212
JUMPV
LABELV $233
line 406
;405:                }
;406:            }
LABELV $230
line 383
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $232
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 deathSprees
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $229
line 407
;407:        }   
line 408
;408:    } else /*if( checkKillSpree )*/ {
ADDRGP4 $212
JUMPV
LABELV $211
line 410
;409:        //Is the streak higher than the largest level defined?
;410:        if( divisionHolder > level.kSpreeUBound ) {
ADDRLP4 28
INDIRI4
ADDRGP4 level+10244
INDIRI4
LEI4 $237
line 412
;411:            //Let's make sure it's a whole number to mimic the other sprees
;412:            isSpree = TestSpreeWhole( streak2Test );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 TestSpreeWhole
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
ASGNI4
line 413
;413:            if( !isSpree ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $240
line 414
;414:                return;
ADDRGP4 $201
JUMPV
LABELV $240
line 417
;415:            }
;416:            //We've made it this far...now do the largest spree defined.
;417:            Q_snprintf( streakcount, sizeof( streakcount ), "%i", streak2Test );
ADDRLP4 4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 $218
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_snprintf
CALLI4
pop
line 419
;418:            //Check if killSprees is NULL (actual problem!)
;419:            if(!killSprees[ level.kSpreeUBound ])
ADDRGP4 level+10244
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $242
line 420
;420:                return;
ADDRGP4 $201
JUMPV
LABELV $242
line 421
;421:            returnedString = CreateMessage( ent, killSprees[ level.kSpreeUBound ]->spreeMsg, streakcount ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+10244
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 CreateMessage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 422
;422:            position = killSprees[ level.kSpreeUBound ]->position;
ADDRLP4 20
ADDRGP4 level+10244
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ASGNI4
line 423
;423:            sound = killSprees[ level.kSpreeUBound ]->sound2Play;
ADDRLP4 8
ADDRGP4 level+10244
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
line 424
;424:            soundIndex = G_SoundIndex( sound );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 425
;425:            soundIndex = G_SoundIndex( sound );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 427
;426:            //G_GlobalSound( soundIndex );
;427:            G_Sound(ent,0,soundIndex);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 433
;428:            /* Doesn't do anything at the moment. cp does not work while kill message is displayed
;429:             * if( position == CENTER_PRINT ) {
;430:                //Only Center print for player doing the killing spree
;431:                CP( va("cp \"%s\"", returnedString ) );
;432:            }*/
;433:            AP( va("chat \"%s\"", returnedString ) );
ADDRGP4 $228
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 434
;434:        } else { 
ADDRGP4 $238
JUMPV
LABELV $237
line 435
;435:            for( i = 0; killSprees[ i ]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $251
JUMPV
LABELV $248
line 436
;436:                if( killSprees[ i ]->streakCount == streak2Test ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $252
line 437
;437:                    Q_snprintf( streakcount, sizeof( streakcount ), "%i", killSprees[ i ]->streakCount );
ADDRLP4 4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 $218
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Q_snprintf
CALLI4
pop
line 438
;438:                    returnedString = CreateMessage ( ent, killSprees[ i ]->spreeMsg, streakcount );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 CreateMessage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 439
;439:                    position = killSprees[ i ]->position;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ASGNI4
line 440
;440:                    sound = killSprees[ i ]->sound2Play;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
line 441
;441:                    soundIndex = G_SoundIndex( sound );                
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 442
;442:                    soundIndex = G_SoundIndex( sound );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 444
;443:                    //G_GlobalSound( soundIndex );
;444:                    G_Sound(ent,0,soundIndex);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 449
;445:                    /*if( position == CENTER_PRINT ) {
;446:                        //Only Center print for player doing the killing spree
;447:                        CP( va("cp \"%s\"", returnedString ) );
;448:                    }*/
;449:                    AP( va("chat \"%s\"", returnedString ) );
ADDRGP4 $228
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 450
;450:                    break;
ADDRGP4 $250
JUMPV
LABELV $252
line 452
;451:                }
;452:            }
LABELV $249
line 435
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $251
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 killSprees
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $248
LABELV $250
line 453
;453:        }    
LABELV $238
line 454
;454:    } /*else {
LABELV $212
line 458
;455:        G_Printf("Killing Spree Error in G_CheckForSpree\n");
;456:        return;
;457:    }*/
;458:}
LABELV $201
endproc G_CheckForSpree 52 16
export G_checkForMultiKill
proc G_checkForMultiKill 48 16
line 466
;459:
;460:
;461:/*
;462:===============
;463:G_checkForMultiKill
;464:===============
;465:*/
;466:void G_checkForMultiKill( gentity_t *ent ) {
line 477
;467:    
;468:    int     i;
;469:    char    *returnedString;
;470:    char    *sound;
;471:    int     soundIndex;
;472:    int     multiKillCount;
;473:    char    multiKillString[ 5 ];
;474:    gclient_t   *client;
;475:    int         clientNum;
;476:    
;477:    client = ent->client;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 478
;478:	clientNum = client - level.clients;
ADDRLP4 32
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ASGNI4
line 481
;479:    
;480:    //Let's grab the multikill count for the player first
;481:    multiKillCount = ent->client->pers.multiKillCount;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
ASGNI4
line 483
;482:    
;483:    if( multiKillCount > multiKills[ level.mKillUBound ]->kills ) {
ADDRLP4 12
INDIRI4
ADDRGP4 level+10252
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CNSTI4 2048
ADDP4
INDIRI4
LEI4 $255
line 484
;484:        Q_snprintf( multiKillString, sizeof( multiKillString ), "%i", multiKillCount );
ADDRLP4 4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $218
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_snprintf
CALLI4
pop
line 485
;485:        if(!multiKills[ level.mKillUBound ])
ADDRGP4 level+10252
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $258
line 486
;486:            return; //If null
ADDRGP4 $254
JUMPV
LABELV $258
line 487
;487:        returnedString = CreateMessage ( ent, multiKills[ level.mKillUBound ]->killMsg, multiKillString );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+10252
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 CreateMessage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 488
;488:        sound = multiKills[ level.mKillUBound ]->sound2Play;
ADDRLP4 20
ADDRGP4 level+10252
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CNSTI4 1024
ADDP4
ASGNP4
line 489
;489:        soundIndex = G_SoundIndex( sound );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 490
;490:        G_Sound(ent, 0, soundIndex );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 491
;491:        AP( va("chat \"%s\"", returnedString ) );
ADDRGP4 $228
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 492
;492:        return;
ADDRGP4 $254
JUMPV
LABELV $255
line 493
;493:    } else {     
line 494
;494:        for( i = 0; multiKills[ i ]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $266
JUMPV
LABELV $263
line 497
;495:            //If the multikill count is equal to a killLevel let's do this. 
;496:            
;497:            if( multiKills[ i ]->kills == multiKillCount ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CNSTI4 2048
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $267
line 498
;498:                Q_snprintf( multiKillString, sizeof( multiKillString ), "%i", multiKills[ i ]->kills );
ADDRLP4 4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $218
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CNSTI4 2048
ADDP4
INDIRI4
ARGI4
ADDRGP4 Q_snprintf
CALLI4
pop
line 500
;499:                //Build the Message
;500:                returnedString = CreateMessage ( ent, multiKills[ i ]->killMsg, multiKillString );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 CreateMessage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 502
;501:                //Grab the sound
;502:                sound = multiKills[ i ]->sound2Play;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CNSTI4 1024
ADDP4
ASGNP4
line 504
;503:                //Index the sound
;504:                soundIndex = G_SoundIndex( sound );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 506
;505:                //Play the sound
;506:                G_Sound(ent, 0, soundIndex );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 511
;507:                /* Print the String
;508:                Since we don't want to clutter screens (the player is already going to get the excellent icon)
;509:                we won't give them an option to centerprint. 
;510:                */
;511:                AP( va("chat \"%s\"", returnedString ) );
ADDRGP4 $228
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 512
;512:                break;
ADDRGP4 $265
JUMPV
LABELV $267
line 514
;513:            }
;514:        }   
LABELV $264
line 494
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $266
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 multiKills
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $263
LABELV $265
line 516
;515:
;516:    }
line 518
;517:      
;518:}
LABELV $254
endproc G_checkForMultiKill 48 16
bss
export multiKills
align 4
LABELV multiKills
skip 128
export deathSprees
align 4
LABELV deathSprees
skip 128
export killSprees
align 4
LABELV killSprees
skip 128
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
LABELV $228
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $227
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $218
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $184
byte 1 91
byte 1 107
byte 1 93
byte 1 0
align 1
LABELV $183
byte 1 91
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $174
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $160
byte 1 83
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 115
byte 1 47
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 117
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $158
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $153
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 83
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $137
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $136
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $133
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $130
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $120
byte 1 91
byte 1 109
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 93
byte 1 0
align 1
LABELV $115
byte 1 91
byte 1 100
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $110
byte 1 91
byte 1 107
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $100
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $96
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 68
byte 1 105
byte 1 118
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 49
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 53
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $95
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 101
byte 1 68
byte 1 105
byte 1 118
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 49
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $87
byte 1 48
byte 1 0
align 1
LABELV $86
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 116
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
