export allowedVote
code
proc allowedVote 288 12
file "../../../code/game/g_vote.c"
line 32
;1:/*
;2:===========================================================================
;3:Copyright (C) 2008-2009 Poul Sander
;4:
;5:This file is part of Open Arena source code.
;6:
;7:Open Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Open Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Open Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:#include "g_local.h"
;24:
;25:/*
;26:==================
;27:allowedVote
;28: *Note: Keep this in sync with allowedVote in ui_votemenu.c (except for cg_voteNames and g_voteNames)
;29:==================
;30: */
;31:#define MAX_VOTENAME_LENGTH 14 //currently the longest string is "/map_restart/\0" (14 chars)
;32:int allowedVote(char *commandStr) {
line 36
;33:    char tempStr[MAX_VOTENAME_LENGTH];
;34:    int length;
;35:    char voteNames[MAX_CVAR_VALUE_STRING];
;36:    trap_Cvar_VariableStringBuffer( "g_voteNames", voteNames, sizeof( voteNames ) );
ADDRGP4 $65
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 37
;37:    if(!Q_stricmp(voteNames, "*" ))
ADDRLP4 20
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 276
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $66
line 38
;38:        return qtrue; //if star, everything is allowed
CNSTI4 1
RETI4
ADDRGP4 $64
JUMPV
LABELV $66
line 39
;39:    length = strlen(commandStr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 280
INDIRI4
ASGNI4
line 40
;40:    if(length>MAX_VOTENAME_LENGTH-3)
ADDRLP4 16
INDIRI4
CNSTI4 11
LEI4 $69
line 41
;41:    {
line 43
;42:        //Error: too long
;43:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $69
line 46
;44:    }
;45:    //Now constructing a string that starts and ends with '/' like: "/clientkick/"
;46:    tempStr[0] = '/';
ADDRLP4 0
CNSTI1 47
ASGNI1
line 47
;47:    strncpy(&tempStr[1],commandStr,length);
ADDRLP4 0+1
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 48
;48:    tempStr[length+1] = '/';
ADDRLP4 16
INDIRI4
ADDRLP4 0+1
ADDP4
CNSTI1 47
ASGNI1
line 49
;49:    tempStr[length+2] = '\0';
ADDRLP4 16
INDIRI4
ADDRLP4 0+2
ADDP4
CNSTI1 0
ASGNI1
line 50
;50:    if(Q_stristr(voteNames,tempStr) != NULL)
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 284
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $74
line 51
;51:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $64
JUMPV
LABELV $74
line 53
;52:    else
;53:        return qfalse;
CNSTI4 0
RETI4
LABELV $64
endproc allowedVote 288 12
export getMappage
proc getMappage 19572 16
line 62
;54:}
;55:
;56:/*
;57:==================
;58:getMappage
;59:==================
;60: */
;61:
;62:t_mappage getMappage(int page) {
line 69
;63:	t_mappage result;
;64:	fileHandle_t	file;
;65:	char *token,*pointer;
;66:	char buffer[MAX_MAPNAME_BUFFER];
;67:	int i, nummaps,maplen;
;68:
;69:	memset(&result,0,sizeof(result));
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 324
ARGI4
ADDRGP4 memset
CALLP4
pop
line 70
;70:        memset(&buffer,0,sizeof(buffer));
ADDRLP4 344
ARGP4
CNSTI4 0
ARGI4
CNSTI4 19200
ARGI4
ADDRGP4 memset
CALLP4
pop
line 73
;71:
;72:	//Check if there is a votemaps.cfg
;73:	trap_FS_FOpenFile(g_votemaps.string,&file,FS_READ);
ADDRGP4 g_votemaps+16
ARGP4
ADDRLP4 19544
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 74
;74:	if(file)
ADDRLP4 19544
INDIRI4
CNSTI4 0
EQI4 $79
line 75
;75:	{
line 77
;76:		//there is a votemaps.cfg file, take allowed maps from there
;77:		trap_FS_Read(&buffer,sizeof(buffer),file);
ADDRLP4 344
ARGP4
CNSTI4 19200
ARGI4
ADDRLP4 19544
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 78
;78:		pointer = buffer;
ADDRLP4 4
ADDRLP4 344
ASGNP4
line 79
;79:		token = COM_Parse(&pointer);
ADDRLP4 4
ARGP4
ADDRLP4 19548
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 19548
INDIRP4
ASGNP4
line 80
;80:		if(token[0]==0 && page == 0) {
ADDRLP4 19552
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 19552
INDIRI4
NEI4 $81
ADDRFP4 4
INDIRI4
ADDRLP4 19552
INDIRI4
NEI4 $81
line 82
;81:			//First page empty
;82:			result.pagenumber = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 83
;83:                        trap_FS_FCloseFile(file);
ADDRLP4 19544
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 84
;84:			return result;
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRB
ASGNB 324
ADDRGP4 $76
JUMPV
LABELV $81
line 87
;85:		}
;86:		//Skip the first pages
;87:		for(i=0;i<MAPS_PER_PAGE*page;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $83
line 88
;88:			token = COM_Parse(&pointer);
ADDRLP4 4
ARGP4
ADDRLP4 19556
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 19556
INDIRP4
ASGNP4
line 89
;89:		}
LABELV $84
line 87
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $86
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRFP4 4
INDIRI4
MULI4
LTI4 $83
line 90
;90:		if(!token || token[0]==0) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $89
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $87
LABELV $89
line 92
;91:			//Page empty, return to first page
;92:                        trap_FS_FCloseFile(file);
ADDRLP4 19544
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 93
;93:			return getMappage(0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 getMappage
CALLV
pop
ADDRGP4 $76
JUMPV
LABELV $87
line 96
;94:		}
;95:		//There is an actual page:
;96:                result.pagenumber = page;
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
line 97
;97:		for(i=0;i<MAPS_PER_PAGE && token;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $90
line 98
;98:			Q_strncpyz(result.mapname[i],token,MAX_MAPNAME);
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 16+4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 99
;99:			token = COM_Parse(&pointer);
ADDRLP4 4
ARGP4
ADDRLP4 19560
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 19560
INDIRP4
ASGNP4
line 100
;100:		}
LABELV $91
line 97
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $93
ADDRLP4 0
INDIRI4
CNSTI4 10
GEI4 $95
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $90
LABELV $95
line 101
;101:                trap_FS_FCloseFile(file);
ADDRLP4 19544
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 102
;102:		return result;
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRB
ASGNB 324
ADDRGP4 $76
JUMPV
LABELV $79
line 105
;103:	}
;104:        //There is no votemaps.cfg file, find filelist of maps
;105:        nummaps = trap_FS_GetFileList("maps",".bsp",buffer,sizeof(buffer));
ADDRGP4 $96
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 344
ARGP4
CNSTI4 19200
ARGI4
ADDRLP4 19548
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 340
ADDRLP4 19548
INDIRI4
ASGNI4
line 107
;106:
;107:        if(nummaps && nummaps<=MAPS_PER_PAGE*page)
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $98
ADDRLP4 340
INDIRI4
CNSTI4 10
ADDRFP4 4
INDIRI4
MULI4
GTI4 $98
line 108
;108:            return getMappage(0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 getMappage
CALLV
pop
ADDRGP4 $76
JUMPV
LABELV $98
line 110
;109:
;110:        pointer = buffer;
ADDRLP4 4
ADDRLP4 344
ASGNP4
line 111
;111:        result.pagenumber = page;
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
line 113
;112:
;113:        for (i = 0; i < nummaps; i++, pointer += maplen+1) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 114
;114:		maplen = strlen(pointer);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 19556
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 19556
INDIRI4
ASGNI4
line 115
;115:                if(i>=MAPS_PER_PAGE*page && i<MAPS_PER_PAGE*(page+1)) {
ADDRLP4 19564
CNSTI4 10
ASGNI4
ADDRLP4 19568
ADDRLP4 19564
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 19568
INDIRI4
LTI4 $104
ADDRLP4 0
INDIRI4
ADDRLP4 19568
INDIRI4
ADDRLP4 19564
INDIRI4
ADDI4
GEI4 $104
line 116
;116:                    Q_strncpyz(result.mapname[i-MAPS_PER_PAGE*page],pointer,maplen-3);
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRFP4 4
INDIRI4
MULI4
SUBI4
CNSTI4 5
LSHI4
ADDRLP4 16+4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 3
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 117
;117:                }
LABELV $104
line 118
;118:	}
LABELV $101
line 113
ADDRLP4 19556
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 19556
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 19556
INDIRI4
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $103
ADDRLP4 0
INDIRI4
ADDRLP4 340
INDIRI4
LTI4 $100
line 119
;119:        return result;
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRB
ASGNB 324
LABELV $76
endproc getMappage 19572 16
export allowedMap
proc allowedMap 8232 12
line 129
;120:
;121:}
;122:
;123:/*
;124:==================
;125:allowedMap
;126:==================
;127: */
;128:
;129:int allowedMap(char *mapname) {
line 136
;130:    int length;
;131:    fileHandle_t	file;           //To check that the map actually exists.
;132:    char                buffer[MAX_MAPS_TEXT];
;133:    char                *token,*pointer;
;134:    qboolean            found;
;135:
;136:    trap_FS_FOpenFile(va("maps/%s.bsp",mapname),&file,FS_READ);
ADDRGP4 $108
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8212
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 137
;137:    if(!file)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $109
line 138
;138:        return qfalse; //maps/MAPNAME.bsp does not exist
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $109
line 139
;139:    trap_FS_FCloseFile(file);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 142
;140:
;141:    //Now read the file votemaps.cfg to see what maps are allowed
;142:    trap_FS_FOpenFile(g_votemaps.string,&file,FS_READ);
ADDRGP4 g_votemaps+16
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 144
;143:
;144:    if(!file)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $112
line 145
;145:        return qtrue; //if no file, everything is allowed
CNSTI4 1
RETI4
ADDRGP4 $107
JUMPV
LABELV $112
line 146
;146:    length = strlen(mapname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8216
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 8216
INDIRI4
ASGNI4
line 147
;147:    if(length>MAX_MAPNAME_LENGTH-3)
ADDRLP4 16
INDIRI4
CNSTI4 31
LEI4 $114
line 148
;148:    {
line 150
;149:        //Error: too long
;150:        trap_FS_FCloseFile(file);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 151
;151:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $114
line 155
;152:    }
;153:
;154:    //Add file checking here
;155:    trap_FS_Read(&buffer,MAX_MAPS_TEXT,file);
ADDRLP4 20
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 156
;156:    found = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 157
;157:    pointer = buffer;
ADDRLP4 8
ADDRLP4 20
ASGNP4
line 158
;158:    token = COM_Parse(&pointer);
ADDRLP4 8
ARGP4
ADDRLP4 8220
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8220
INDIRP4
ASGNP4
ADDRGP4 $117
JUMPV
LABELV $116
line 159
;159:    while(token[0]!=0 && !found) {
line 160
;160:        if(!Q_stricmp(token,mapname))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
NEI4 $119
line 161
;161:            found = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $119
line 162
;162:        token = COM_Parse(&pointer);
ADDRLP4 8
ARGP4
ADDRLP4 8228
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8228
INDIRP4
ASGNP4
line 163
;163:    }
LABELV $117
line 159
ADDRLP4 8224
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8224
INDIRI4
EQI4 $121
ADDRLP4 4
INDIRI4
ADDRLP4 8224
INDIRI4
EQI4 $116
LABELV $121
line 165
;164:
;165:    trap_FS_FCloseFile(file);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 167
;166:    //The map was not found
;167:    return found;
ADDRLP4 4
INDIRI4
RETI4
LABELV $107
endproc allowedMap 8232 12
export allowedGametype
proc allowedGametype 280 12
line 176
;168:}
;169:
;170:/*
;171:==================
;172:allowedGametype
;173:==================
;174: */
;175:#define MAX_GAMETYPENAME_LENGTH 5 //currently the longest string is "/12/\0" (5 chars)
;176:int allowedGametype(char *gametypeStr) {
line 180
;177:    char tempStr[MAX_GAMETYPENAME_LENGTH];
;178:    int length;
;179:    char voteGametypes[MAX_CVAR_VALUE_STRING];
;180:    trap_Cvar_VariableStringBuffer( "g_voteGametypes", voteGametypes, sizeof( voteGametypes ) );
ADDRGP4 $123
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 181
;181:    if(!Q_stricmp(voteGametypes, "*" ))
ADDRLP4 12
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $124
line 182
;182:        return qtrue; //if star, everything is allowed
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $124
line 183
;183:    length = strlen(gametypeStr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 272
INDIRI4
ASGNI4
line 184
;184:    if(length>MAX_GAMETYPENAME_LENGTH-3)
ADDRLP4 8
INDIRI4
CNSTI4 2
LEI4 $126
line 185
;185:    {
line 187
;186:        //Error: too long
;187:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $122
JUMPV
LABELV $126
line 189
;188:    }
;189:    tempStr[0] = '/';
ADDRLP4 0
CNSTI1 47
ASGNI1
line 190
;190:    strncpy(&tempStr[1],gametypeStr,length);
ADDRLP4 0+1
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 191
;191:    tempStr[length+1] = '/';
ADDRLP4 8
INDIRI4
ADDRLP4 0+1
ADDP4
CNSTI1 47
ASGNI1
line 192
;192:    tempStr[length+2] = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 0+2
ADDP4
CNSTI1 0
ASGNI1
line 193
;193:    if(Q_stristr(voteGametypes,tempStr) != NULL)
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $131
line 194
;194:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $131
line 195
;195:    else {
line 196
;196:        return qfalse;
CNSTI4 0
RETI4
LABELV $122
endproc allowedGametype 280 12
export allowedTimelimit
proc allowedTimelimit 20 0
line 205
;197:    }
;198:}
;199:
;200:/*
;201:==================
;202:allowedTimelimit
;203:==================
;204: */
;205:int allowedTimelimit(int limit) {
line 207
;206:    int min, max;
;207:    min = g_voteMinTimelimit.integer;
ADDRLP4 4
ADDRGP4 g_voteMinTimelimit+12
INDIRI4
ASGNI4
line 208
;208:    max = g_voteMaxTimelimit.integer;
ADDRLP4 0
ADDRGP4 g_voteMaxTimelimit+12
INDIRI4
ASGNI4
line 209
;209:    if(limit<min && limit != 0)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $136
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $136
line 210
;210:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $136
line 211
;211:    if(max!=0 && limit>max)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $138
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $138
line 212
;212:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $138
line 213
;213:    if(limit==0 && max > 0)
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $140
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $140
line 214
;214:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $140
line 215
;215:    return qtrue;
CNSTI4 1
RETI4
LABELV $133
endproc allowedTimelimit 20 0
export allowedFraglimit
proc allowedFraglimit 20 0
line 223
;216:}
;217:
;218:/*
;219:==================
;220:allowedFraglimit
;221:==================
;222: */
;223:int allowedFraglimit(int limit) {
line 225
;224:    int min, max;
;225:    min = g_voteMinFraglimit.integer;
ADDRLP4 4
ADDRGP4 g_voteMinFraglimit+12
INDIRI4
ASGNI4
line 226
;226:    max = g_voteMaxFraglimit.integer;
ADDRLP4 0
ADDRGP4 g_voteMaxFraglimit+12
INDIRI4
ASGNI4
line 227
;227:    if(limit<min && limit != 0)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $145
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $145
line 228
;228:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $142
JUMPV
LABELV $145
line 229
;229:    if(max != 0 && limit>max)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $147
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $147
line 230
;230:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $142
JUMPV
LABELV $147
line 231
;231:    if(limit==0 && max > 0)
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $149
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $149
line 232
;232:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $142
JUMPV
LABELV $149
line 233
;233:    return qtrue;
CNSTI4 1
RETI4
LABELV $142
endproc allowedFraglimit 20 0
export VoteParseCustomVotes
proc VoteParseCustomVotes 4128 12
line 247
;234:}
;235:
;236:#define MAX_CUSTOM_VOTES    12
;237:
;238:char            custom_vote_info[1024];
;239:
;240:/*
;241:==================
;242:VoteParseCustomVotes
;243: *Reads the file votecustom.cfg. Finds all the commands that can be used with
;244: *"/callvote custom COMMAND" and adds the commands to custom_vote_info
;245:==================
;246: */
;247:int VoteParseCustomVotes( void ) {
line 253
;248:    fileHandle_t	file;
;249:    char            buffer[4*1024];
;250:    int             commands;
;251:    char	*token,*pointer;
;252:
;253:    trap_FS_FOpenFile(g_votecustom.string,&file,FS_READ);
ADDRGP4 g_votecustom+16
ARGP4
ADDRLP4 4108
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 255
;254:
;255:    if(!file)
ADDRLP4 4108
INDIRI4
CNSTI4 0
NEI4 $153
line 256
;256:        return 0;
CNSTI4 0
RETI4
ADDRGP4 $151
JUMPV
LABELV $153
line 258
;257:
;258:    memset(&buffer,0,sizeof(buffer));
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 259
;259:    memset(&custom_vote_info,0,sizeof(custom_vote_info));
ADDRGP4 custom_vote_info
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 261
;260:
;261:    commands = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 263
;262:
;263:    trap_FS_Read(&buffer,sizeof(buffer),file);
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 265
;264:    
;265:    pointer = buffer;
ADDRLP4 8
ADDRLP4 12
ASGNP4
ADDRGP4 $156
JUMPV
LABELV $155
line 267
;266:
;267:    while ( commands < MAX_CUSTOM_VOTES ) {
line 268
;268:	token = COM_Parse( &pointer );
ADDRLP4 8
ARGP4
ADDRLP4 4112
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4112
INDIRP4
ASGNP4
line 269
;269:        if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $158
line 270
;270:            break;
ADDRGP4 $157
JUMPV
LABELV $158
line 273
;271:	}
;272:
;273:        if ( !strcmp( token, "votecommand" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 4116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $160
line 274
;274:            token = COM_Parse( &pointer );
ADDRLP4 8
ARGP4
ADDRLP4 4120
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4120
INDIRP4
ASGNP4
line 275
;275:            Q_strcat(custom_vote_info,sizeof(custom_vote_info),va("%s ",token));
ADDRGP4 $163
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 custom_vote_info
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4124
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 276
;276:            commands++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 277
;277:	}
LABELV $160
line 278
;278:    }
LABELV $156
line 267
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $155
LABELV $157
line 280
;279:
;280:    trap_FS_FCloseFile(file);
ADDRLP4 4108
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 282
;281:
;282:    return commands;
ADDRLP4 4
INDIRI4
RETI4
LABELV $151
endproc VoteParseCustomVotes 4128 12
export getCustomVote
proc getCustomVote 5348 12
line 290
;283:}
;284:/*
;285:==================
;286:getCustomVote
;287: *Returns a custom vote. This will go beyond MAX_CUSTOM_VOTES.
;288:==================
;289: */
;290:t_customvote getCustomVote(char* votecommand) {
line 297
;291:    t_customvote result;
;292:    fileHandle_t	file;
;293:    char            buffer[4*1024];
;294:    char	*token,*pointer;
;295:    char	key[MAX_TOKEN_CHARS];
;296:
;297:    trap_FS_FOpenFile(g_votecustom.string,&file,FS_READ);
ADDRGP4 g_votecustom+16
ARGP4
ADDRLP4 5312
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 299
;298:
;299:    if(!file) {
ADDRLP4 5312
INDIRI4
CNSTI4 0
NEI4 $167
line 300
;300:        memset(&result,0,sizeof(result));
ADDRLP4 1028
ARGP4
CNSTI4 0
ARGI4
CNSTI4 184
ARGI4
ADDRGP4 memset
CALLP4
pop
line 301
;301:        return result;
ADDRFP4 0
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 184
ADDRGP4 $164
JUMPV
LABELV $167
line 304
;302:    }
;303:
;304:    memset(&buffer,0,sizeof(buffer));
ADDRLP4 1216
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 306
;305:
;306:    trap_FS_Read(&buffer,sizeof(buffer),file);
ADDRLP4 1216
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 5312
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 308
;307:
;308:    pointer = buffer;
ADDRLP4 1212
ADDRLP4 1216
ASGNP4
ADDRGP4 $170
JUMPV
LABELV $169
line 310
;309:
;310:    while ( qtrue ) {
line 311
;311:	token = COM_Parse( &pointer );
ADDRLP4 1212
ARGP4
ADDRLP4 5316
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 5316
INDIRP4
ASGNP4
line 312
;312:        if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $172
line 313
;313:            break;
ADDRGP4 $171
JUMPV
LABELV $172
line 316
;314:	}
;315:
;316:        if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 5320
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 5320
INDIRI4
CNSTI4 0
EQI4 $174
line 317
;317:		Com_Printf( "Missing { in votecustom.cfg\n" );
ADDRGP4 $177
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 318
;318:		break;
ADDRGP4 $171
JUMPV
LABELV $174
line 321
;319:	}
;320:
;321:        memset(&result,0,sizeof(result));
ADDRLP4 1028
ARGP4
CNSTI4 0
ARGI4
CNSTI4 184
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $179
JUMPV
LABELV $178
line 323
;322:
;323:        while ( 1 ) {
line 324
;324:            token = COM_ParseExt( &pointer, qtrue );
ADDRLP4 1212
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 5324
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 5324
INDIRP4
ASGNP4
line 325
;325:            if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $181
line 326
;326:                    Com_Printf( "Unexpected end of customvote.cfg\n" );
ADDRGP4 $183
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 327
;327:                    break;
ADDRGP4 $180
JUMPV
LABELV $181
line 329
;328:            }
;329:            if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 5328
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 5328
INDIRI4
CNSTI4 0
NEI4 $184
line 330
;330:                    break;
ADDRGP4 $180
JUMPV
LABELV $184
line 332
;331:            }
;332:            Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 334
;333:
;334:            token = COM_ParseExt( &pointer, qfalse );
ADDRLP4 1212
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5332
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 5332
INDIRP4
ASGNP4
line 335
;335:            if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
line 336
;336:                Com_Printf("Invalid/missing argument to %s in customvote.cfg\n",key);
ADDRGP4 $189
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 337
;337:            }
LABELV $187
line 338
;338:            if(!Q_stricmp(key,"votecommand")) {
ADDRLP4 4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 5336
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5336
INDIRI4
CNSTI4 0
NEI4 $190
line 339
;339:                Q_strncpyz(result.votename,token,sizeof(result.votename));
ADDRLP4 1028
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 340
;340:            } else if(!Q_stricmp(key,"displayname")) {
ADDRGP4 $191
JUMPV
LABELV $190
ADDRLP4 4
ARGP4
ADDRGP4 $194
ARGP4
ADDRLP4 5340
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5340
INDIRI4
CNSTI4 0
NEI4 $192
line 341
;341:                Q_strncpyz(result.displayname,token,sizeof(result.displayname));
ADDRLP4 1028+32
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 342
;342:            } else if(!Q_stricmp(key,"command")) {
ADDRGP4 $193
JUMPV
LABELV $192
ADDRLP4 4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 5344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5344
INDIRI4
CNSTI4 0
NEI4 $197
line 343
;343:                Q_strncpyz(result.command,token,sizeof(result.command));
ADDRLP4 1028+82
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 344
;344:            } else {
ADDRGP4 $198
JUMPV
LABELV $197
line 345
;345:                Com_Printf("Unknown key in customvote.cfg: %s\n",key);
ADDRGP4 $202
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 346
;346:            }
LABELV $198
LABELV $193
LABELV $191
line 348
;347:
;348:	}
LABELV $179
line 323
ADDRGP4 $178
JUMPV
LABELV $180
line 350
;349:
;350:        if(!Q_stricmp(result.votename,votecommand)) {
ADDRLP4 1028
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5324
INDIRI4
CNSTI4 0
NEI4 $203
line 351
;351:            return result;
ADDRFP4 0
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 184
ADDRGP4 $164
JUMPV
LABELV $203
line 353
;352:        }
;353:    }
LABELV $170
line 310
ADDRGP4 $169
JUMPV
LABELV $171
line 356
;354:
;355:    //Nothing was found
;356:    memset(&result,0,sizeof(result));
ADDRLP4 1028
ARGP4
CNSTI4 0
ARGI4
CNSTI4 184
ARGI4
ADDRGP4 memset
CALLP4
pop
line 357
;357:        return result;
ADDRFP4 0
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 184
LABELV $164
endproc getCustomVote 5348 12
export CheckVote
proc CheckVote 4 8
line 365
;358:}
;359:
;360:/*
;361:==================
;362:CheckVote
;363:==================
;364:*/
;365:void CheckVote( void ) {
line 366
;366:	if ( level.voteExecuteTime && level.voteExecuteTime < level.time ) {
ADDRGP4 level+3176
INDIRI4
CNSTI4 0
EQI4 $206
ADDRGP4 level+3176
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $206
line 367
;367:		level.voteExecuteTime = 0;
ADDRGP4 level+3176
CNSTI4 0
ASGNI4
line 368
;368:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $212
ARGP4
ADDRGP4 level+1124
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 369
;369:	}
LABELV $206
line 370
;370:	if ( !level.voteTime ) {
ADDRGP4 level+3172
INDIRI4
CNSTI4 0
NEI4 $214
line 371
;371:		return;
ADDRGP4 $205
JUMPV
LABELV $214
line 373
;372:	}
;373:	if ( level.time - level.voteTime >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+3172
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $217
line 374
;374:            if(g_dmflags.integer & DF_LIGHT_VOTING) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $221
line 376
;375:                //Let pass if there was at least twice as many for as against
;376:                if ( level.voteYes > level.voteNo*2 ) {
ADDRGP4 level+3180
INDIRI4
ADDRGP4 level+3184
INDIRI4
CNSTI4 1
LSHI4
LEI4 $224
line 377
;377:                    trap_SendServerCommand( -1, "print \"Vote passed. At least 2 of 3 voted yes\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 378
;378:                    level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+3176
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 379
;379:                } else {
ADDRGP4 $218
JUMPV
LABELV $224
line 381
;380:                    //Let pass if there is more yes than no and at least 2 yes votes and at least 30% yes of all on the server
;381:                    if ( level.voteYes > level.voteNo && level.voteYes >= 2 && (level.voteYes*10)>(level.numVotingClients*3) ) {
ADDRGP4 level+3180
INDIRI4
ADDRGP4 level+3184
INDIRI4
LEI4 $231
ADDRGP4 level+3180
INDIRI4
CNSTI4 2
LTI4 $231
CNSTI4 10
ADDRGP4 level+3180
INDIRI4
MULI4
CNSTI4 3
ADDRGP4 level+3188
INDIRI4
MULI4
LEI4 $231
line 382
;382:                        trap_SendServerCommand( -1, "print \"Vote passed. More yes than no.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 383
;383:                        level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+3176
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 384
;384:                    } else
ADDRGP4 $218
JUMPV
LABELV $231
line 385
;385:                        trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $241
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 386
;386:                }
line 387
;387:            } else {
ADDRGP4 $218
JUMPV
LABELV $221
line 388
;388:                trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $241
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 389
;389:            }
line 390
;390:	} else {
ADDRGP4 $218
JUMPV
LABELV $217
line 392
;391:		// ATVI Q3 1.32 Patch #9, WNF
;392:		if ( level.voteYes > (level.numVotingClients)/2 ) {
ADDRGP4 level+3180
INDIRI4
ADDRGP4 level+3188
INDIRI4
CNSTI4 2
DIVI4
LEI4 $242
line 394
;393:			// execute the command, then remove the vote
;394:			trap_SendServerCommand( -1, "print \"Vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 395
;395:			level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+3176
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 396
;396:		} else if ( level.voteNo >= (level.numVotingClients)/2 ) {
ADDRGP4 $243
JUMPV
LABELV $242
ADDRGP4 level+3184
INDIRI4
ADDRGP4 level+3188
INDIRI4
CNSTI4 2
DIVI4
LTI4 $205
line 398
;397:			// same behavior as a timeout
;398:			trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $241
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 399
;399:		} else {
line 401
;400:			// still waiting for a majority
;401:			return;
LABELV $250
LABELV $243
line 403
;402:		}
;403:	}
LABELV $218
line 404
;404:	level.voteTime = 0;
ADDRGP4 level+3172
CNSTI4 0
ASGNI4
line 405
;405:	trap_SetConfigstring( CS_VOTE_TIME, "" );
CNSTI4 8
ARGI4
ADDRGP4 $254
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 407
;406:
;407:}
LABELV $205
endproc CheckVote 4 8
export ForceFail
proc ForceFail 0 8
line 409
;408:
;409:void ForceFail( void ) {
line 410
;410:    level.voteTime = 0;
ADDRGP4 level+3172
CNSTI4 0
ASGNI4
line 411
;411:    level.voteExecuteTime = 0;
ADDRGP4 level+3176
CNSTI4 0
ASGNI4
line 412
;412:    level.voteString[0] = 0;
ADDRGP4 level+1124
CNSTI1 0
ASGNI1
line 413
;413:    level.voteDisplayString[0] = 0;
ADDRGP4 level+2148
CNSTI1 0
ASGNI1
line 414
;414:    level.voteKickClient = -1;
ADDRGP4 level+3192
CNSTI4 -1
ASGNI4
line 415
;415:    level.voteKickType = 0;
ADDRGP4 level+3196
CNSTI4 0
ASGNI4
line 416
;416:    trap_SetConfigstring( CS_VOTE_TIME, "" );
CNSTI4 8
ARGI4
ADDRGP4 $254
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 417
;417:    trap_SetConfigstring( CS_VOTE_STRING, "" );	
CNSTI4 9
ARGI4
ADDRGP4 $254
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 418
;418:    trap_SetConfigstring( CS_VOTE_YES, "" );
CNSTI4 10
ARGI4
ADDRGP4 $254
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 419
;419:    trap_SetConfigstring( CS_VOTE_NO, "" );
CNSTI4 11
ARGI4
ADDRGP4 $254
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 420
;420:}
LABELV $255
endproc ForceFail 0 8
export CountVotes
proc CountVotes 16 8
line 430
;421:
;422:
;423:/*
;424:==================
;425:CountVotes
;426:
;427: Iterates through all the clients and counts the votes
;428:==================
;429:*/
;430:void CountVotes( void ) {
line 432
;431:    int i;
;432:    int yes=0,no=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
line 434
;433:
;434:    level.numVotingClients=0;
ADDRGP4 level+3188
CNSTI4 0
ASGNI4
line 436
;435:
;436:    for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $264
line 437
;437:            if ( level.clients[ i ].pers.connected != CON_CONNECTED )
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $269
line 438
;438:                continue; //Client was not connected
ADDRGP4 $265
JUMPV
LABELV $269
line 440
;439:
;440:            if (level.clients[i].sess.sessionTeam == TEAM_SPECTATOR)
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $271
line 441
;441:		continue; //Don't count spectators
ADDRGP4 $265
JUMPV
LABELV $271
line 443
;442:
;443:            if ( g_entities[i].r.svFlags & SVF_BOT )
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $273
line 444
;444:                continue; //Is a bot
ADDRGP4 $265
JUMPV
LABELV $273
line 447
;445:
;446:            //The client can vote
;447:            level.numVotingClients++;
ADDRLP4 12
ADDRGP4 level+3188
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 450
;448:
;449:            //Did the client vote yes?
;450:            if(level.clients[i].vote>0)
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1444
ADDP4
INDIRI4
CNSTI4 0
LEI4 $278
line 451
;451:                yes++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
line 454
;452:
;453:            //Did the client vote no?
;454:            if(level.clients[i].vote<0)
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1444
ADDP4
INDIRI4
CNSTI4 0
GEI4 $280
line 455
;455:                no++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $280
line 456
;456:    }
LABELV $265
line 436
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $267
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $264
line 459
;457:
;458:    //See if anything has changed
;459:    if(level.voteYes != yes) {
ADDRGP4 level+3180
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $282
line 460
;460:        level.voteYes = yes;
ADDRGP4 level+3180
ADDRLP4 4
INDIRI4
ASGNI4
line 461
;461:        trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $286
ARGP4
ADDRGP4 level+3180
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 462
;462:    }
LABELV $282
line 464
;463:
;464:    if(level.voteNo != no) {
ADDRGP4 level+3184
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $288
line 465
;465:        level.voteNo = no;
ADDRGP4 level+3184
ADDRLP4 8
INDIRI4
ASGNI4
line 466
;466:        trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );
ADDRGP4 $286
ARGP4
ADDRGP4 level+3184
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 467
;467:    }
LABELV $288
line 468
;468:}
LABELV $262
endproc CountVotes 16 8
export ClientLeaving
proc ClientLeaving 0 0
line 470
;469:
;470:void ClientLeaving(int clientNumber) {
line 471
;471:    if(clientNumber == level.voteKickClient) {
ADDRFP4 0
INDIRI4
ADDRGP4 level+3192
INDIRI4
NEI4 $294
line 472
;472:            ForceFail();
ADDRGP4 ForceFail
CALLV
pop
line 473
;473:    }
LABELV $294
line 474
;474:}
LABELV $293
endproc ClientLeaving 0 0
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
bss
export custom_vote_info
align 1
LABELV custom_vote_info
skip 1024
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
LABELV $286
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $254
byte 1 0
align 1
LABELV $246
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $241
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $238
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 77
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $228
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 50
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 51
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $212
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $202
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $194
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $189
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 114
byte 1 103
byte 1 117
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 125
byte 1 0
align 1
LABELV $183
byte 1 85
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
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 123
byte 1 0
align 1
LABELV $163
byte 1 37
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $162
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $123
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $108
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $97
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $96
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $68
byte 1 42
byte 1 0
align 1
LABELV $65
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
