code
proc StringToFilter 160 8
file "../../../code/game/g_svcmds.c"
line 79
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
;24:// this file holds commands that can be executed by the server console, but not remote clients
;25:
;26:#include "g_local.h"
;27:
;28:
;29:/*
;30:==============================================================================
;31:
;32:PACKET FILTERING
;33:
;34:
;35:You can add or remove addresses from the filter list with:
;36:
;37:addip <ip>
;38:removeip <ip>
;39:
;40:The ip address is specified in dot format, and you can use '*' to match any value
;41:so you can specify an entire class C network with "addip 192.246.40.*"
;42:
;43:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;44:
;45:listip
;46:Prints the current list of filters.
;47:
;48:g_filterban <0 or 1>
;49:
;50:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;51:
;52:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;53:
;54:TTimo NOTE: for persistence, bans are stored in g_banIPs cvar MAX_CVAR_VALUE_STRING
;55:The size of the cvar string buffer is limiting the banning to around 20 masks
;56:this could be improved by putting some g_banIPs2 g_banIps3 etc. maybe
;57:still, you should rely on PB for banning instead
;58:
;59:==============================================================================
;60:*/
;61:
;62:typedef struct ipFilter_s
;63:{
;64:	unsigned	mask;
;65:	unsigned	compare;
;66:} ipFilter_t;
;67:
;68:#define	MAX_IPFILTERS	1024
;69:
;70:static ipFilter_t	ipFilters[MAX_IPFILTERS];
;71:static int			numIPFilters;
;72:
;73:/*
;74:=================
;75:StringToFilter
;76:=================
;77:*/
;78:static qboolean StringToFilter (char *s, ipFilter_t *f)
;79:{
line 85
;80:	char	num[128];
;81:	int		i, j;
;82:	byte	b[4];
;83:	byte	m[4];
;84:
;85:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $65
line 86
;86:	{
line 87
;87:		b[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 88
;88:		m[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 89
;89:	}
LABELV $66
line 85
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $65
line 91
;90:
;91:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $69
line 92
;92:	{
line 93
;93:		if (*s < '0' || *s > '9')
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $75
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $73
LABELV $75
line 94
;94:		{
line 95
;95:			if (*s == '*') // 'match any'
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $76
line 96
;96:			{
line 98
;97:				// b[i] and m[i] to 0
;98:				s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 99
;99:				if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $78
line 100
;100:					break;
ADDRGP4 $71
JUMPV
LABELV $78
line 101
;101:				s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 102
;102:				continue;
ADDRGP4 $70
JUMPV
LABELV $76
line 104
;103:			}
;104:                        G_Printf( "Bad filter address: %s\n", s );
ADDRGP4 $80
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 105
;105:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $73
line 108
;106:		}
;107:
;108:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 110
;109:		while (*s >= '0' && *s <= '9')
;110:		{
line 111
;111:			num[j++] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
line 112
;112:		}
LABELV $82
line 109
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 48
LTI4 $84
ADDRLP4 148
INDIRI4
CNSTI4 57
LEI4 $81
LABELV $84
line 113
;113:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 114
;114:		b[i] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 152
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 115
;115:		m[i] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
line 117
;116:
;117:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $85
line 118
;118:			break;
ADDRGP4 $71
JUMPV
LABELV $85
line 119
;119:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 120
;120:	}
LABELV $70
line 91
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $69
LABELV $71
line 122
;121:
;122:	f->mask = *(unsigned *)m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 123
;123:	f->compare = *(unsigned *)b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 125
;124:
;125:	return qtrue;
CNSTI4 1
RETI4
LABELV $64
endproc StringToFilter 160 8
proc UpdateIPBans 344 12
line 134
;126:}
;127:
;128:/*
;129:=================
;130:UpdateIPBans
;131:=================
;132:*/
;133:static void UpdateIPBans (void)
;134:{
line 141
;135:	byte	b[4];
;136:	byte	m[4];
;137:	int		i,j;
;138:	char	iplist_final[MAX_CVAR_VALUE_STRING];
;139:	char	ip[64];
;140:
;141:	*iplist_final = 0;
ADDRLP4 80
CNSTI1 0
ASGNI1
line 142
;142:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $88
line 143
;143:	{
line 144
;144:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $92
line 145
;145:			continue;
ADDRGP4 $89
JUMPV
LABELV $92
line 147
;146:
;147:		*(unsigned *)b = ipFilters[i].compare;
ADDRLP4 72
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 148
;148:		*(unsigned *)m = ipFilters[i].mask;
ADDRLP4 68
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ASGNU4
line 149
;149:		*ip = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 150
;150:		for (j = 0 ; j < 4 ; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $96
line 151
;151:		{
line 152
;152:			if (m[j]!=255)
ADDRLP4 0
INDIRI4
ADDRLP4 68
ADDP4
INDIRU1
CVUI4 1
CNSTI4 255
EQI4 $100
line 153
;153:				Q_strcat(ip, sizeof(ip), "*");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $102
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $101
JUMPV
LABELV $100
line 155
;154:			else
;155:				Q_strcat(ip, sizeof(ip), va("%i", b[j]));
ADDRGP4 $103
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 72
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 336
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $101
line 156
;156:			Q_strcat(ip, sizeof(ip), (j<3) ? "." : " ");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $107
ADDRLP4 340
ADDRGP4 $104
ASGNP4
ADDRGP4 $108
JUMPV
LABELV $107
ADDRLP4 340
ADDRGP4 $105
ASGNP4
LABELV $108
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 157
;157:		}
LABELV $97
line 150
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $96
line 158
;158:		if (strlen(iplist_final)+strlen(ip) < MAX_CVAR_VALUE_STRING)
ADDRLP4 80
ARGP4
ADDRLP4 336
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 340
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
ADDRLP4 340
INDIRI4
ADDI4
CNSTI4 256
GEI4 $109
line 159
;159:		{
line 160
;160:			Q_strcat( iplist_final, sizeof(iplist_final), ip);
ADDRLP4 80
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 161
;161:		}
ADDRGP4 $110
JUMPV
LABELV $109
line 163
;162:		else
;163:		{
line 164
;164:			Com_Printf("g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n");
ADDRGP4 $111
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 165
;165:			break;
ADDRGP4 $90
JUMPV
LABELV $110
line 167
;166:		}
;167:	}
LABELV $89
line 142
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $91
ADDRLP4 76
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $88
LABELV $90
line 169
;168:
;169:	trap_Cvar_Set( "g_banIPs", iplist_final );
ADDRGP4 $112
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 170
;170:}
LABELV $87
endproc UpdateIPBans 344 12
export G_FilterPacket
proc G_FilterPacket 28 0
line 178
;171:
;172:/*
;173:=================
;174:G_FilterPacket
;175:=================
;176:*/
;177:qboolean G_FilterPacket (char *from)
;178:{
line 184
;179:	int		i;
;180:	unsigned	in;
;181:	byte m[4];
;182:	char *p;
;183:
;184:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 185
;185:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $115
JUMPV
LABELV $114
line 186
;186:	while (*p && i < 4) {
line 187
;187:		m[i] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $118
JUMPV
LABELV $117
line 188
;188:		while (*p >= '0' && *p <= '9') {
line 189
;189:			m[i] = m[i]*10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 190
;190:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 191
;191:		}
LABELV $118
line 188
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $120
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $117
LABELV $120
line 192
;192:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $123
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $121
LABELV $123
line 193
;193:			break;
ADDRGP4 $116
JUMPV
LABELV $121
line 194
;194:		i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 195
;195:	}
LABELV $115
line 186
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $124
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $114
LABELV $124
LABELV $116
line 197
;196:
;197:	in = *(unsigned *)m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 199
;198:
;199:	for (i=0 ; i<numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $128
JUMPV
LABELV $125
line 200
;200:		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $129
line 201
;201:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $134
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $134
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $135
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $113
JUMPV
LABELV $129
LABELV $126
line 199
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $128
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $125
line 203
;202:
;203:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $138
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $139
ADDRLP4 24
INDIRI4
RETI4
LABELV $113
endproc G_FilterPacket 28 0
proc AddIP 8 8
line 212
;204:}
;205:
;206:/*
;207:=================
;208:AddIP
;209:=================
;210:*/
;211:static void AddIP( char *str )
;212:{
line 215
;213:	int		i;
;214:
;215:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $141
line 216
;216:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $145
line 217
;217:			break;		// free spot
ADDRGP4 $143
JUMPV
LABELV $145
LABELV $142
line 215
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $144
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $141
LABELV $143
line 218
;218:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $148
line 219
;219:	{
line 220
;220:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $150
line 221
;221:		{
line 222
;222:                        G_Printf ("IP filter list is full\n");
ADDRGP4 $152
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 223
;223:			return;
ADDRGP4 $140
JUMPV
LABELV $150
line 225
;224:		}
;225:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 226
;226:	}
LABELV $148
line 228
;227:
;228:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $153
line 229
;229:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $153
line 231
;230:
;231:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 232
;232:}
LABELV $140
endproc AddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 276 12
line 240
;233:
;234:/*
;235:=================
;236:G_ProcessIPBans
;237:=================
;238:*/
;239:void G_ProcessIPBans(void)
;240:{
line 244
;241:	char *s, *t;
;242:	char		str[MAX_CVAR_VALUE_STRING];
;243:
;244:	Q_strncpyz( str, g_banIPs.string, sizeof(str) );
ADDRLP4 8
ARGP4
ADDRGP4 g_banIPs+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 246
;245:
;246:	for (t = s = g_banIPs.string; *t; /* */ ) {
ADDRLP4 264
ADDRGP4 g_banIPs+16
ASGNP4
ADDRLP4 0
ADDRLP4 264
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 264
INDIRP4
ASGNP4
ADDRGP4 $161
JUMPV
LABELV $158
line 247
;247:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 268
INDIRP4
ASGNP4
line 248
;248:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $166
line 249
;249:			break;
ADDRGP4 $160
JUMPV
LABELV $165
line 251
;250:		while (*s == ' ')
;251:			*s++ = 0;
ADDRLP4 272
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI1 0
ASGNI1
LABELV $166
line 250
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $165
line 252
;252:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $168
line 253
;253:			AddIP( t );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
LABELV $168
line 254
;254:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 255
;255:	}
LABELV $159
line 246
LABELV $161
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $158
LABELV $160
line 256
;256:}
LABELV $156
endproc G_ProcessIPBans 276 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 265
;257:
;258:
;259:/*
;260:=================
;261:Svcmd_AddIP_f
;262:=================
;263:*/
;264:void Svcmd_AddIP_f (void)
;265:{
line 268
;266:	char		str[MAX_TOKEN_CHARS];
;267:
;268:	if ( trap_Argc() < 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $171
line 269
;269:                G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $173
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 270
;270:		return;
ADDRGP4 $170
JUMPV
LABELV $171
line 273
;271:	}
;272:
;273:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 275
;274:
;275:	AddIP( str );
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 277
;276:
;277:}
LABELV $170
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 285
;278:
;279:/*
;280:=================
;281:Svcmd_RemoveIP_f
;282:=================
;283:*/
;284:void Svcmd_RemoveIP_f (void)
;285:{
line 290
;286:	ipFilter_t	f;
;287:	int			i;
;288:	char		str[MAX_TOKEN_CHARS];
;289:
;290:	if ( trap_Argc() < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $175
line 291
;291:                G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $177
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 292
;292:		return;
ADDRGP4 $174
JUMPV
LABELV $175
line 295
;293:	}
;294:
;295:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 297
;296:
;297:	if (!StringToFilter (str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $178
line 298
;298:		return;
ADDRGP4 $174
JUMPV
LABELV $178
line 300
;299:
;300:	for (i=0 ; i<numIPFilters ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 301
;301:		if (ipFilters[i].mask == f.mask	&&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $184
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $184
line 302
;302:			ipFilters[i].compare == f.compare) {
line 303
;303:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 304
;304:                        G_Printf ("Removed.\n");
ADDRGP4 $189
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 306
;305:
;306:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 307
;307:			return;
ADDRGP4 $174
JUMPV
LABELV $184
line 309
;308:		}
;309:	}
LABELV $181
line 300
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $180
line 310
;310:        G_Printf ( "Didn't find %s.\n", str );
ADDRGP4 $190
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 311
;311:}
LABELV $174
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 318
;312:
;313:/*
;314:===================
;315:Svcmd_EntityList_f
;316:===================
;317:*/
;318:void	Svcmd_EntityList_f (void) {
line 322
;319:	int			e;
;320:	gentity_t		*check;
;321:
;322:	check = g_entities+1;
ADDRLP4 0
ADDRGP4 g_entities+2492
ASGNP4
line 323
;323:	for (e = 1; e < level.num_entities ; e++, check++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $193
line 324
;324:		if ( !check->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
line 325
;325:			continue;
ADDRGP4 $194
JUMPV
LABELV $198
line 327
;326:		}
;327:                G_Printf("%3i:", e);
ADDRGP4 $200
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 328
;328:		switch ( check->s.eType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 14
GTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $231
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $231
address $204
address $206
address $208
address $210
address $212
address $214
address $216
address $218
address $220
address $222
address $224
address $226
address $201
address $201
address $228
code
LABELV $204
line 330
;329:		case ET_GENERAL:
;330:			G_Printf("ET_GENERAL          ");
ADDRGP4 $205
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 331
;331:			break;
ADDRGP4 $202
JUMPV
LABELV $206
line 333
;332:		case ET_PLAYER:
;333:			G_Printf("ET_PLAYER           ");
ADDRGP4 $207
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 334
;334:			break;
ADDRGP4 $202
JUMPV
LABELV $208
line 336
;335:		case ET_ITEM:
;336:			G_Printf("ET_ITEM             ");
ADDRGP4 $209
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 337
;337:			break;
ADDRGP4 $202
JUMPV
LABELV $210
line 339
;338:		case ET_MISSILE:
;339:			G_Printf("ET_MISSILE          ");
ADDRGP4 $211
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 340
;340:			break;
ADDRGP4 $202
JUMPV
LABELV $212
line 342
;341:		case ET_MOVER:
;342:			G_Printf("ET_MOVER            ");
ADDRGP4 $213
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 343
;343:			break;
ADDRGP4 $202
JUMPV
LABELV $214
line 345
;344:		case ET_BEAM:
;345:			G_Printf("ET_BEAM             ");
ADDRGP4 $215
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 346
;346:			break;
ADDRGP4 $202
JUMPV
LABELV $216
line 348
;347:		case ET_PORTAL:
;348:			G_Printf("ET_PORTAL           ");
ADDRGP4 $217
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 349
;349:			break;
ADDRGP4 $202
JUMPV
LABELV $218
line 351
;350:		case ET_SPEAKER:
;351:			G_Printf("ET_SPEAKER          ");
ADDRGP4 $219
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 352
;352:			break;
ADDRGP4 $202
JUMPV
LABELV $220
line 354
;353:		case ET_PUSH_TRIGGER:
;354:			G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $221
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 355
;355:			break;
ADDRGP4 $202
JUMPV
LABELV $222
line 357
;356:		case ET_TELEPORT_TRIGGER:
;357:			G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $223
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 358
;358:			break;
ADDRGP4 $202
JUMPV
LABELV $224
line 360
;359:		case ET_INVISIBLE:
;360:			G_Printf("ET_INVISIBLE        ");
ADDRGP4 $225
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 361
;361:			break;
ADDRGP4 $202
JUMPV
LABELV $226
line 363
;362:		case ET_GRAPPLE:
;363:			G_Printf("ET_GRAPPLE          ");
ADDRGP4 $227
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 364
;364:			break;
ADDRGP4 $202
JUMPV
LABELV $228
line 366
;365:		case ET_WEATHER:
;366:			G_Printf("ET_WEATHER          ");
ADDRGP4 $229
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 367
;367:			break;
ADDRGP4 $202
JUMPV
LABELV $201
line 369
;368:		default:
;369:			G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $230
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 370
;370:			break;
LABELV $202
line 372
;371:		}
;372:		if ( check->classname ) {
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $232
line 373
;373:			G_Printf("%s", check->classname);
ADDRGP4 $234
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 374
;374:		}
LABELV $232
line 375
;375:                G_Printf("\n");
ADDRGP4 $235
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 376
;376:	}
LABELV $194
line 323
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
LABELV $196
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $193
line 377
;377:}
LABELV $191
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 379
;378:
;379:gclient_t	*ClientForString( const char *s ) {
line 385
;380:	gclient_t	*cl;
;381:	int			i;
;382:	int			idnum;
;383:
;384:	// numeric values are just slot numbers
;385:	if ( s[0] >= '0' && s[0] <= '9' ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $237
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $237
line 386
;386:		idnum = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 387
;387:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $242
ADDRLP4 20
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $239
LABELV $242
line 388
;388:			Com_Printf( "Bad client slot: %i\n", idnum );
ADDRGP4 $243
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 389
;389:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $236
JUMPV
LABELV $239
line 392
;390:		}
;391:
;392:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 2324
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 393
;393:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $244
line 394
;394:                        G_Printf( "Client %i is not connected\n", idnum );
ADDRGP4 $246
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 395
;395:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $236
JUMPV
LABELV $244
line 397
;396:		}
;397:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $236
JUMPV
LABELV $237
line 401
;398:	}
;399:
;400:	// check for a name match
;401:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 402
;402:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 403
;403:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $252
line 404
;404:			continue;
ADDRGP4 $248
JUMPV
LABELV $252
line 406
;405:		}
;406:		if ( !Q_stricmp( cl->pers.netname, s ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $254
line 407
;407:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $236
JUMPV
LABELV $254
line 409
;408:		}
;409:	}
LABELV $248
line 401
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $247
line 410
;410:        G_Printf( "User %s is not on the server\n", s );
ADDRGP4 $256
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 412
;411:
;412:	return NULL;
CNSTP4 0
RETP4
LABELV $236
endproc ClientForString 24 8
export Svcmd_PickTarget_f
proc Svcmd_PickTarget_f 152 12
line 421
;413:}
;414:
;415:/*
;416:==================
;417:Svcmd_PickTarget_f
;418:Added for QSandbox.
;419:==================
;420:*/
;421:void Svcmd_PickTarget_f( void ){
line 425
;422:	char		p[128];
;423:	gentity_t 	*act;
;424:
;425:	trap_Argv( 1, p, sizeof( p ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 427
;426:
;427:	act = G_PickTarget( p );
ADDRLP4 4
ARGP4
ADDRLP4 132
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 428
;428:	if ( act && act->use ) {
ADDRLP4 140
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $258
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $258
line 429
;429:		act->use( act, NULL, NULL );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 430
;430:	}
LABELV $258
line 431
;431:}
LABELV $257
endproc Svcmd_PickTarget_f 152 12
data
align 4
LABELV $261
address $262
address $263
address $264
address $265
address $266
address $267
address $268
address $269
byte 4 0
export Svcmd_AdmUseCvar_f
code
proc Svcmd_AdmUseCvar_f 212 12
line 438
;432:
;433:/*
;434:=================
;435:Svcmd_AdmUseCvar_f
;436:=================
;437:*/
;438:void Svcmd_AdmUseCvar_f( void ) {
line 455
;439:	char		p1[64];
;440:	char		p2[64];
;441:	char		p3[64];
;442:	int			i;
;443:	static const char* admcvar_items[] = {
;444:	"g_allowprops",
;445:	"g_allowsettings",
;446:	"g_allownpc",
;447:	"g_allowitems",
;448:	"g_allownoclip",
;449:	"g_allowtoolgun",
;450:	"g_allowphysgun",
;451:	"g_allowgravitygun",
;452:	0
;453:};
;454:
;455:    trap_Argv( 1, p1, sizeof( p1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 456
;456:	trap_Argv( 2, p2, sizeof( p2 ) );
CNSTI4 2
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 457
;457:	trap_Argv( 3, p3, sizeof( p3 ) );
CNSTI4 3
ARGI4
ADDRLP4 132
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 459
;458:	
;459:	if(atoi(p3) >= 1){
ADDRLP4 132
ARGP4
ADDRLP4 196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 1
LTI4 $270
line 460
;460:	trap_SendServerCommand( -1, va("print \"Variable %s is %s\n\"", p1, G_ArenaScriptAutoChar( p1 )));
ADDRLP4 4
ARGP4
ADDRLP4 200
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $272
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 461
;461:	return;
ADDRGP4 $260
JUMPV
LABELV $270
line 464
;462:	}
;463:	
;464:	for (i = 0; i < 8; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $273
line 465
;465:    if (Q_stricmp(p1, admcvar_items[i]) == 0) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $261
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
NEI4 $277
line 466
;466:	trap_Cvar_Set(p1, va("%s", p2));
ADDRGP4 $234
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 467
;467:	trap_SendServerCommand( -1, va("print \"Variable %s changed to %s\n\"", p1, p2));
ADDRGP4 $279
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 208
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 468
;468:	break;
ADDRGP4 $275
JUMPV
LABELV $277
line 470
;469:	}
;470:	}
LABELV $274
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $273
LABELV $275
line 471
;471:}
LABELV $260
endproc Svcmd_AdmUseCvar_f 212 12
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 480
;472:
;473:/*
;474:===================
;475:Svcmd_ForceTeam_f
;476:
;477:forceteam <player> <team>
;478:===================
;479:*/
;480:void	Svcmd_ForceTeam_f( void ) {
line 485
;481:	gclient_t	*cl;
;482:	char		str[MAX_TOKEN_CHARS];
;483:
;484:	// find the player
;485:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 486
;486:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 487
;487:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $281
line 488
;488:		return;
ADDRGP4 $280
JUMPV
LABELV $281
line 492
;489:	}
;490:
;491:	// set the team
;492:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 493
;493:	SetTeam( &g_entities[cl - level.clients], str );
CNSTI4 2492
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 494
;494:}
LABELV $280
endproc Svcmd_ForceTeam_f 1032 12
export ClientKick_f
proc ClientKick_f 1040 12
line 496
;495:
;496:void	ClientKick_f( void ) {
line 500
;497:        int idnum, i;
;498:        char	str[MAX_TOKEN_CHARS];
;499:
;500:        trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 502
;501:
;502:        for (i = 0; str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $284
line 503
;503:		if (str[i] < '0' || str[i] > '9') {
ADDRLP4 1032
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 48
LTI4 $290
ADDRLP4 1032
INDIRI4
CNSTI4 57
LEI4 $288
LABELV $290
line 504
;504:                    G_Printf("not a valid client number: \"%s\"\n",str);
ADDRGP4 $291
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 505
;505:			return;
ADDRGP4 $283
JUMPV
LABELV $288
line 507
;506:		}
;507:	}
LABELV $285
line 502
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $287
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $284
line 509
;508:
;509:        idnum = atoi( str );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 512
;510:
;511:        //Local client
;512:        if( !strcmp( level.clients[idnum].pers.ip, "localhost" ) ) {
CNSTI4 2324
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 953
ADDP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 1036
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $292
line 513
;513:            G_Printf("Kick failed - local player\n");
ADDRGP4 $295
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 514
;514:            return;
ADDRGP4 $283
JUMPV
LABELV $292
line 520
;515:        }
;516:
;517:        //Now clientkick has been moved into game, but we still need to find the idnum the server expects....
;518:        //FIXME: To fix this, we need a relieble way to generate difference between the server's client number and the game's client numbers
;519:        //FIXME: This should not depend on the engine's clientkick at all
;520:        trap_DropClient( idnum, "was kicked" );
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 $296
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 523
;521:        //trap_SendConsoleCommand( EXEC_INSERT, va("clientkick %d\n", level.clients[idnum].ps.clientNum) );
;522:
;523:}
LABELV $283
endproc ClientKick_f 1040 12
export NextCustomRound_f
proc NextCustomRound_f 12 12
line 525
;524:
;525:void	NextCustomRound_f( void ) {
line 526
;526:	mod_zround += 1;
ADDRLP4 0
ADDRGP4 mod_zround
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 527
;527:if(g_roundmode.integer == 1){
ADDRGP4 g_roundmode+12
INDIRI4
CNSTI4 1
NEI4 $298
line 528
;528:trap_SendConsoleCommand( EXEC_APPEND, "exec CustomMod/CustomRound.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $301
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 529
;529:trap_SendConsoleCommand( EXEC_APPEND, va("exec CustomMod/rounds/Round%i.cfg\n", mod_zround));
ADDRGP4 $302
ARGP4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 530
;530:trap_SendConsoleCommand( EXEC_APPEND, va("exec CustomMod/rounds/%s/Round%i.cfg\n", g_currentmap.string, mod_zround));
ADDRGP4 $303
ARGP4
ADDRGP4 g_currentmap+16
ARGP4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 531
;531:}
LABELV $298
line 532
;532:}
LABELV $297
endproc NextCustomRound_f 12 12
export EndGame_f
proc EndGame_f 0 0
line 535
;533:
;534:
;535:void EndGame_f ( void ) {
line 536
;536:    ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 537
;537:}
LABELV $305
endproc EndGame_f 0 0
data
export svcmds
align 4
LABELV svcmds
address $307
byte 4 0
address Svcmd_EntityList_f
address $308
byte 4 0
address Svcmd_ForceTeam_f
address $309
byte 4 0
address Svcmd_GameMem_f
address $310
byte 4 0
address Svcmd_AddBot_f
address $311
byte 4 0
address Svcmd_BotList_f
address $312
byte 4 0
address Svcmd_AddIP_f
address $313
byte 4 0
address Svcmd_RemoveIP_f
address $314
byte 4 0
address Svcmd_ListIP_f
address $315
byte 4 0
address Svcmd_Status_f
address $316
byte 4 0
address Svcmd_EjectClient_f
address $317
byte 4 0
address Svcmd_DumpUser_f
address $318
byte 4 0
address Svcmd_CenterPrint_f
address $319
byte 4 0
address Svcmd_ReplaceTexture_f
address $320
byte 4 1
address Svcmd_TeamMessage_f
address $321
byte 4 1
address Svcmd_MessageWrapper
address $322
byte 4 1
address Svcmd_Chat_f
address $323
byte 4 0
address ShuffleTeams
address $324
byte 4 0
address ClientKick_f
address $325
byte 4 0
address EndGame_f
address $326
byte 4 0
address G_WriteMapfile_f
address $327
byte 4 0
address G_WriteMapfileAll_f
address $328
byte 4 0
address G_LoadMapfile_f
address $329
byte 4 0
address G_LoadMapfileAll_f
address $330
byte 4 0
address NextCustomRound_f
address $331
byte 4 0
address G_HideObjects
address $332
byte 4 0
address G_ShowObjects
address $333
byte 4 0
address Svcmd_AdmUseCvar_f
address $334
byte 4 0
address Svcmd_Condition_f
address $335
byte 4 0
address Svcmd_PickTarget_f
address $336
byte 4 0
address Svcmd_Operation_f
address $337
byte 4 0
address Svcmd_Cvar_f
address $338
byte 4 0
address Svcmd_Editline_f
address $339
byte 4 0
address Svcmd_ClientCommand_f
address $340
byte 4 0
address Svcmd_SystemCommand_f
address $341
byte 4 0
address Svcmd_Random_f
address $342
byte 4 0
address Svcmd_For_f
address $343
byte 4 0
address Svcmd_SaveSession_f
export ConsoleCommand
code
proc ConsoleCommand 1036 12
line 613
;538:
;539://KK-OAX Moved this Declaration to g_local.h
;540://char	*ConcatArgs( int start );
;541:
;542:/*KK-OAX
;543:===============
;544:Server Command Table
;545:Not Worth Listing Elsewhere
;546:================
;547:*/
;548:struct
;549:{
;550:  char      *cmd;
;551:  qboolean  dedicated; //if it has to be entered from a dedicated server or RCON
;552:  void      ( *function )( void );
;553:} svcmds[ ] = {
;554:
;555:  { "entityList", qfalse, Svcmd_EntityList_f },
;556:  { "forceTeam", qfalse, Svcmd_ForceTeam_f },
;557:  { "game_memory", qfalse, Svcmd_GameMem_f },
;558:  { "addbot", qfalse, Svcmd_AddBot_f },
;559:  { "botlist", qfalse, Svcmd_BotList_f },
;560:  { "addip", qfalse, Svcmd_AddIP_f },
;561:  { "removeip", qfalse, Svcmd_RemoveIP_f },
;562:
;563:  //KK-OAX Uses wrapper in g_svccmds_ext.c
;564:  { "listip", qfalse, Svcmd_ListIP_f },
;565:  //KK-OAX New
;566:  { "status", qfalse, Svcmd_Status_f },
;567:  { "eject", qfalse, Svcmd_EjectClient_f },
;568:  { "dumpuser", qfalse, Svcmd_DumpUser_f },
;569:  // don't handle communication commands unless dedicated
;570:  { "centerprint", qfalse, Svcmd_CenterPrint_f },
;571:  { "replacetexture", qfalse, Svcmd_ReplaceTexture_f },
;572:  { "say_team", qtrue, Svcmd_TeamMessage_f },
;573:  { "say", qtrue, Svcmd_MessageWrapper },
;574:  { "chat", qtrue, Svcmd_Chat_f },
;575:  /*{ "m", qtrue, Svcmd_MessageWrapper },
;576:  { "a", qtrue, Svcmd_MessageWrapper },
;577:  { "bp", qtrue, Svcmd_BannerPrint_f }, */
;578:  //Shuffle the teams
;579:  { "shuffle", qfalse, ShuffleTeams },
;580:  //Kicks a player by number in the game logic rather than the server number
;581:  { "clientkick_game", qfalse, ClientKick_f },
;582:  { "endgamenow", qfalse, EndGame_f },
;583:  { "savemap", qfalse, G_WriteMapfile_f },
;584:  { "savemapall", qfalse, G_WriteMapfileAll_f },
;585:  { "loadmap", qfalse, G_LoadMapfile_f },
;586:  { "loadmapall", qfalse, G_LoadMapfileAll_f },
;587:  { "customroundend", qfalse, NextCustomRound_f },
;588:  
;589:  { "hideobjects", qfalse, G_HideObjects },
;590:  { "showobjects", qfalse, G_ShowObjects },
;591:  
;592:  //ArenaScript
;593:  { "useadmcvar", qfalse, Svcmd_AdmUseCvar_f },
;594:  { "if", qfalse, Svcmd_Condition_f },
;595:  { "picktarget", qfalse, Svcmd_PickTarget_f },
;596:  { "op", qfalse, Svcmd_Operation_f },
;597:  { "cvar", qfalse, Svcmd_Cvar_f },
;598:  { "editline", qfalse, Svcmd_Editline_f },
;599:  { "clientcmd", qfalse, Svcmd_ClientCommand_f },
;600:  { "syscmd", qfalse, Svcmd_SystemCommand_f },
;601:  { "random", qfalse, Svcmd_Random_f },
;602:  { "for", qfalse, Svcmd_For_f },
;603:  { "savegame", qfalse, Svcmd_SaveSession_f }
;604:};
;605:
;606:/*
;607:=================
;608:ConsoleCommand
;609:
;610:=================
;611:*/
;612:qboolean  ConsoleCommand( void )
;613:{
line 617
;614:  char cmd[ MAX_TOKEN_CHARS ];
;615:  int  i;
;616:
;617:  trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 619
;618:
;619:  for( i = 0; i < sizeof( svcmds ) / sizeof( svcmds[ 0 ] ); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $348
JUMPV
LABELV $345
line 620
;620:  {
line 621
;621:    if( !Q_stricmp( cmd, svcmds[ i ].cmd ) )
ADDRLP4 4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $349
line 622
;622:    {
line 623
;623:      if( svcmds[ i ].dedicated && !g_dedicated.integer )
ADDRLP4 1032
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds+4
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
EQI4 $351
ADDRGP4 g_dedicated+12
INDIRI4
ADDRLP4 1032
INDIRI4
NEI4 $351
line 624
;624:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $344
JUMPV
LABELV $351
line 625
;625:      svcmds[ i ].function( );
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 svcmds+8
ADDP4
INDIRP4
CALLV
pop
line 626
;626:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $344
JUMPV
LABELV $349
line 628
;627:    }
;628:  }
LABELV $346
line 619
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $348
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 37
LTU4 $345
line 631
;629:  // KK-OAX Will be enabled when admin is added.
;630:  // see if this is an admin command
;631:  if( G_admin_cmd_check( NULL, qfalse ) )
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1028
ADDRGP4 G_admin_cmd_check
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $356
line 632
;632:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $344
JUMPV
LABELV $356
line 634
;633:
;634:  if( g_dedicated.integer )
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $358
line 635
;635:    G_Printf( "unknown command: %s\n", cmd );
ADDRGP4 $361
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $358
line 637
;636:
;637:  return qfalse;
CNSTI4 0
RETI4
LABELV $344
endproc ConsoleCommand 1036 12
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $361
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $343
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $342
byte 1 102
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $341
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 121
byte 1 115
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $339
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $338
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $337
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $336
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $335
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $334
byte 1 105
byte 1 102
byte 1 0
align 1
LABELV $333
byte 1 117
byte 1 115
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $332
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $331
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $330
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $329
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $328
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $327
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $326
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $325
byte 1 101
byte 1 110
byte 1 100
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $324
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $323
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $322
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $321
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $320
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $319
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $318
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $317
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $316
byte 1 101
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $315
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $314
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $313
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $312
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $311
byte 1 98
byte 1 111
byte 1 116
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $310
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $309
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $308
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $307
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $303
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 47
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 37
byte 1 105
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $302
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 47
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 47
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 37
byte 1 105
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $301
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 47
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $296
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $295
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $294
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $291
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $279
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $272
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $269
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $268
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $267
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $266
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $265
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 112
byte 1 99
byte 1 0
align 1
LABELV $263
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $256
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $246
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $243
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $235
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $230
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $229
byte 1 69
byte 1 84
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $227
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $225
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $223
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $221
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $219
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $217
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $215
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $213
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $211
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $209
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $207
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $205
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $200
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
align 1
LABELV $190
byte 1 68
byte 1 105
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
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $189
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 115
byte 1 118
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $173
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $152
byte 1 73
byte 1 80
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $112
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 95
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $105
byte 1 32
byte 1 0
align 1
LABELV $104
byte 1 46
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $102
byte 1 42
byte 1 0
align 1
LABELV $80
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
