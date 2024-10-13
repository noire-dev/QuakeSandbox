export CG_TestModel_f
code
proc CG_TestModel_f 36 12
file "../../../code/cgame/cg_view.c"
line 71
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
;23:// cg_view.c -- setup all the parameters (position, angle, etc)
;24:// for a 3D rendering
;25:#include "cg_local.h"
;26:
;27:
;28:/*
;29:=============================================================================
;30:
;31:  MODEL TESTING
;32:
;33:The viewthing and gun positioning tools from Q2 have been integrated and
;34:enhanced into a single model testing facility.
;35:
;36:Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".
;37:
;38:The names must be the full pathname after the basedir, like 
;39:"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"
;40:
;41:Testmodel will create a fake entity 100 units in front of the current view
;42:position, directly facing the viewer.  It will remain immobile, so you can
;43:move around it to view it from different angles.
;44:
;45:Testgun will cause the model to follow the player around and supress the real
;46:view weapon model.  The default frame 0 of most guns is completely off screen,
;47:so you will probably have to cycle a couple frames to see it.
;48:
;49:"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
;50:frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
;51:q3default.cfg.
;52:
;53:If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
;54:you adjust the positioning.
;55:
;56:Note that none of the model testing features update while the game is paused, so
;57:it may be convenient to test with deathmatch set to 1 so that bringing down the
;58:console doesn't pause the game.
;59:
;60:=============================================================================
;61:*/
;62:
;63:/*
;64:=================
;65:CG_TestModel_f
;66:
;67:Creates an entity in front of the current position, which
;68:can then be moved around
;69:=================
;70:*/
;71:void CG_TestModel_f (void) {
line 74
;72:	vec3_t		angles;
;73:
;74:	memset( &cg.testModelEntity, 0, sizeof(cg.testModelEntity) );
ADDRGP4 cg+1956064
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 75
;75:	if ( trap_Argc() < 2 ) {
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
GEI4 $84
line 76
;76:		return;
ADDRGP4 $81
JUMPV
LABELV $84
line 79
;77:	}
;78:
;79:	Q_strncpyz (cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+1956240
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 80
;80:	cg.testModelEntity.hModel = trap_R_RegisterModel_MiTech( cg.testModelName );
ADDRGP4 cg+1956240
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cg+1956064+8
ADDRLP4 20
INDIRI4
ASGNI4
line 82
;81:
;82:	if ( trap_Argc() == 3 ) {
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $90
line 83
;83:		cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 cg+1956064+100
ADDRLP4 32
INDIRF4
ASGNF4
line 84
;84:		cg.testModelEntity.frame = 1;
ADDRGP4 cg+1956064+80
CNSTI4 1
ASGNI4
line 85
;85:		cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+1956064+96
CNSTI4 0
ASGNI4
line 86
;86:	}
LABELV $90
line 87
;87:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+1956064+8
INDIRI4
CNSTI4 0
NEI4 $98
line 88
;88:		CG_Printf( "Can't register model\n" );
ADDRGP4 $102
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 89
;89:		return;
ADDRGP4 $81
JUMPV
LABELV $98
line 92
;90:	}
;91:
;92:	VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin );
ADDRGP4 cg+1956064+68
ADDRGP4 cg+1870616+24
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+1870616+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+1956064+68+4
ADDRGP4 cg+1870616+24+4
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+1870616+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+1956064+68+8
ADDRGP4 cg+1870616+24+8
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+1870616+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 94
;93:
;94:	angles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 95
;95:	angles[YAW] = 180 + cg.refdefViewAngles[1];
ADDRLP4 0+4
ADDRGP4 cg+1870984+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 96
;96:	angles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 98
;97:
;98:	AnglesToAxis( angles, cg.testModelEntity.axis );
ADDRLP4 0
ARGP4
ADDRGP4 cg+1956064+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 99
;99:	cg.testGun = qfalse;
ADDRGP4 cg+1956304
CNSTI4 0
ASGNI4
line 100
;100:}
LABELV $81
endproc CG_TestModel_f 36 12
export CG_CloadMap_f
proc CG_CloadMap_f 0 0
line 110
;101:
;102:/*
;103:=================
;104:CG_CloadMap_f
;105:
;106:Creates an entity in front of the current position, which
;107:can then be moved around
;108:=================
;109:*/
;110:void CG_CloadMap_f (void) {
line 112
;111:	
;112:}
LABELV $134
endproc CG_CloadMap_f 0 0
export CG_TestGun_f
proc CG_TestGun_f 0 0
line 121
;113:
;114:/*
;115:=================
;116:CG_TestGun_f
;117:
;118:Replaces the current view weapon with the given model
;119:=================
;120:*/
;121:void CG_TestGun_f (void) {
line 122
;122:	CG_TestModel_f();
ADDRGP4 CG_TestModel_f
CALLV
pop
line 123
;123:	cg.testGun = qtrue;
ADDRGP4 cg+1956304
CNSTI4 1
ASGNI4
line 124
;124:	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+1956064+4
CNSTI4 13
ASGNI4
line 125
;125:}
LABELV $135
endproc CG_TestGun_f 0 0
export CG_TestModelNextFrame_f
proc CG_TestModelNextFrame_f 4 8
line 128
;126:
;127:
;128:void CG_TestModelNextFrame_f (void) {
line 129
;129:	cg.testModelEntity.frame++;
ADDRLP4 0
ADDRGP4 cg+1956064+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 130
;130:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $142
ARGP4
ADDRGP4 cg+1956064+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 131
;131:}
LABELV $139
endproc CG_TestModelNextFrame_f 4 8
export CG_TestModelPrevFrame_f
proc CG_TestModelPrevFrame_f 4 8
line 133
;132:
;133:void CG_TestModelPrevFrame_f (void) {
line 134
;134:	cg.testModelEntity.frame--;
ADDRLP4 0
ADDRGP4 cg+1956064+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 135
;135:	if ( cg.testModelEntity.frame < 0 ) {
ADDRGP4 cg+1956064+80
INDIRI4
CNSTI4 0
GEI4 $148
line 136
;136:		cg.testModelEntity.frame = 0;
ADDRGP4 cg+1956064+80
CNSTI4 0
ASGNI4
line 137
;137:	}
LABELV $148
line 138
;138:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $142
ARGP4
ADDRGP4 cg+1956064+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 139
;139:}
LABELV $145
endproc CG_TestModelPrevFrame_f 4 8
export CG_TestModelNextSkin_f
proc CG_TestModelNextSkin_f 4 8
line 141
;140:
;141:void CG_TestModelNextSkin_f (void) {
line 142
;142:	cg.testModelEntity.skinNum++;
ADDRLP4 0
ADDRGP4 cg+1956064+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 143
;143:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $159
ARGP4
ADDRGP4 cg+1956064+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 144
;144:}
LABELV $156
endproc CG_TestModelNextSkin_f 4 8
export CG_TestModelPrevSkin_f
proc CG_TestModelPrevSkin_f 4 8
line 146
;145:
;146:void CG_TestModelPrevSkin_f (void) {
line 147
;147:	cg.testModelEntity.skinNum--;
ADDRLP4 0
ADDRGP4 cg+1956064+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 148
;148:	if ( cg.testModelEntity.skinNum < 0 ) {
ADDRGP4 cg+1956064+104
INDIRI4
CNSTI4 0
GEI4 $165
line 149
;149:		cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+1956064+104
CNSTI4 0
ASGNI4
line 150
;150:	}
LABELV $165
line 151
;151:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $159
ARGP4
ADDRGP4 cg+1956064+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 152
;152:}
LABELV $162
endproc CG_TestModelPrevSkin_f 4 8
proc CG_AddTestModel 32 4
line 154
;153:
;154:static void CG_AddTestModel (void) {
line 158
;155:	int		i;
;156:
;157:	// re-register the model, because the level may have changed
;158:	cg.testModelEntity.hModel = trap_R_RegisterModel_MiTech( cg.testModelName );
ADDRGP4 cg+1956240
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cg+1956064+8
ADDRLP4 4
INDIRI4
ASGNI4
line 159
;159:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+1956064+8
INDIRI4
CNSTI4 0
NEI4 $177
line 160
;160:		CG_Printf ("Can't register model\n");
ADDRGP4 $102
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 161
;161:		return;
ADDRGP4 $173
JUMPV
LABELV $177
line 165
;162:	}
;163:
;164:	// if testing a gun, set the origin reletive to the view origin
;165:	if ( cg.testGun ) {
ADDRGP4 cg+1956304
INDIRI4
CNSTI4 0
EQI4 $181
line 166
;166:		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
ADDRGP4 cg+1956064+68
ADDRGP4 cg+1870616+24
INDIRB
ASGNB 12
line 167
;167:		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
ADDRGP4 cg+1956064+28
ADDRGP4 cg+1870616+36
INDIRB
ASGNB 12
line 168
;168:		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
ADDRGP4 cg+1956064+28+12
ADDRGP4 cg+1870616+36+12
INDIRB
ASGNB 12
line 169
;169:		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );
ADDRGP4 cg+1956064+28+24
ADDRGP4 cg+1870616+36+24
INDIRB
ASGNB 12
line 172
;170:
;171:		// allow the position to be adjusted
;172:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $204
line 173
;173:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 cg+1956064+68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+1870616+36
ADDP4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 174
;174:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
ADDRLP4 16
INDIRI4
ADDRGP4 cg+1956064+68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRGP4 cg+1870616+36+12
ADDP4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 175
;175:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 cg+1956064+68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRGP4 cg+1870616+36+24
ADDP4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 176
;176:		}
LABELV $205
line 172
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $204
line 177
;177:	}
LABELV $181
line 179
;178:
;179:	trap_R_AddRefEntityToScene( &cg.testModelEntity );
ADDRGP4 cg+1956064
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 180
;180:}
LABELV $173
endproc CG_AddTestModel 32 4
proc CG_CalcVrect 12 8
line 194
;181:
;182:
;183:
;184://============================================================================
;185:
;186:
;187:/*
;188:=================
;189:CG_CalcVrect
;190:
;191:Sets the coordinates of the rendered window
;192:=================
;193:*/
;194:static void CG_CalcVrect (void) {
line 198
;195:	int		size;
;196:
;197:	// the intermission should allways be full screen
;198:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $227
line 199
;199:		size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 200
;200:	} else {
ADDRGP4 $228
JUMPV
LABELV $227
line 202
;201:		// bound normal viewsize
;202:		if (cg_viewsize.integer < 30) {
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 30
GEI4 $230
line 203
;203:			trap_Cvar_Set ("cg_viewsize","30");
ADDRGP4 $233
ARGP4
ADDRGP4 $234
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 204
;204:			size = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 205
;205:		} else if (cg_viewsize.integer > 120) {
ADDRGP4 $231
JUMPV
LABELV $230
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 120
LEI4 $235
line 206
;206:			trap_Cvar_Set ("cg_viewsize","120");
ADDRGP4 $233
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 207
;207:			size = 120;
ADDRLP4 0
CNSTI4 120
ASGNI4
line 208
;208:		} else {
ADDRGP4 $236
JUMPV
LABELV $235
line 209
;209:			size = cg_viewsize.integer;
ADDRLP4 0
ADDRGP4 cg_viewsize+12
INDIRI4
ASGNI4
line 210
;210:		}
LABELV $236
LABELV $231
line 212
;211:
;212:	}
LABELV $228
line 213
;213:	cg.refdef.width = cgs.glconfig.vidWidth*size/100;
ADDRGP4 cg+1870616+8
ADDRGP4 cgs+327684+11304
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 214
;214:	cg.refdef.width &= ~1;
ADDRLP4 4
ADDRGP4 cg+1870616+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 216
;215:
;216:	cg.refdef.height = cgs.glconfig.vidHeight*size/100;
ADDRGP4 cg+1870616+12
ADDRGP4 cgs+327684+11308
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 217
;217:	cg.refdef.height &= ~1;
ADDRLP4 8
ADDRGP4 cg+1870616+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 219
;218:
;219:	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width)/2;
ADDRGP4 cg+1870616
ADDRGP4 cgs+327684+11304
INDIRI4
ADDRGP4 cg+1870616+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 220
;220:	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
ADDRGP4 cg+1870616+4
ADDRGP4 cgs+327684+11308
INDIRI4
ADDRGP4 cg+1870616+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 221
;221:}
LABELV $226
endproc CG_CalcVrect 12 8
proc CG_ViewFog 76 8
line 236
;222:
;223://==============================================================================
;224:
;225:// leilei - eyes hack
;226:
;227:extern vec3_t headpos;
;228:extern vec3_t headang;
;229:
;230:/*
;231:===============
;232:CG_ViewFog
;233:
;234:===============
;235:*/
;236:static void CG_ViewFog( void ) {
line 240
;237:	int i;
;238:	float scale;
;239:	
;240:	if(!mod_fogColorA){
ADDRGP4 mod_fogColorA
INDIRI4
CNSTI4 0
NEI4 $264
line 241
;241:		return;
ADDRGP4 $263
JUMPV
LABELV $264
line 244
;242:	}
;243:
;244:	cg.viewfog[0].hModel = trap_R_RegisterModel_MiTech( va("models/fog%i", mod_fogModel) );
ADDRGP4 $268
ARGP4
ADDRGP4 mod_fogModel
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cg+1953072+8
ADDRLP4 12
INDIRI4
ASGNI4
line 245
;245:	cg.viewfog[0].customShader = trap_R_RegisterShader(va("models/fogtex%i", mod_fogShader));
ADDRGP4 $271
ARGP4
ADDRGP4 mod_fogShader
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cg+1953072+112
ADDRLP4 20
INDIRI4
ASGNI4
line 247
;246:
;247:	for(i = 0; i < 16; i++){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $272
line 248
;248:		cg.viewfog[i].hModel = cg.viewfog[0].hModel;
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+8
ADDP4
ADDRGP4 cg+1953072+8
INDIRI4
ASGNI4
line 249
;249:		cg.viewfog[i].customShader = cg.viewfog[0].customShader;
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+112
ADDP4
ADDRGP4 cg+1953072+112
INDIRI4
ASGNI4
line 251
;250:
;251:		VectorCopy(cg.refdef.vieworg, cg.viewfog[i].origin);
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+68
ADDP4
ADDRGP4 cg+1870616+24
INDIRB
ASGNB 12
line 252
;252:		VectorCopy(cg.refdef.viewaxis[0], cg.viewfog[i].axis[0]);
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+28
ADDP4
ADDRGP4 cg+1870616+36
INDIRB
ASGNB 12
line 253
;253:		VectorCopy(cg.refdef.viewaxis[1], cg.viewfog[i].axis[1]);
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+28+12
ADDP4
ADDRGP4 cg+1870616+36+12
INDIRB
ASGNB 12
line 254
;254:		VectorCopy(cg.refdef.viewaxis[2], cg.viewfog[i].axis[2]);
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+28+24
ADDP4
ADDRGP4 cg+1870616+36+24
INDIRB
ASGNB 12
line 256
;255:
;256:		cg.viewfog[i].shaderRGBA[0] = mod_fogColorR;
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+116
ADDP4
ADDRGP4 mod_fogColorR
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 257
;257:		cg.viewfog[i].shaderRGBA[1] = mod_fogColorG;
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+116+1
ADDP4
ADDRGP4 mod_fogColorG
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 258
;258:		cg.viewfog[i].shaderRGBA[2] = mod_fogColorB;
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+116+2
ADDP4
ADDRGP4 mod_fogColorB
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 259
;259:		cg.viewfog[i].shaderRGBA[3] = (mod_fogColorA / 16) + (i * (mod_fogColorA - (mod_fogColorA / 16)) / 15);
ADDRLP4 28
ADDRGP4 mod_fogColorA
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 28
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072+116+3
ADDP4
ADDRLP4 32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
MULI4
CNSTI4 15
DIVI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 261
;260:
;261:		scale = ((mod_fogDistance*512) * 0.50) + i * (mod_fogInterval * 0.50);
ADDRLP4 36
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ADDRGP4 mod_fogDistance
INDIRI4
CNSTI4 9
LSHI4
CVIF4 4
MULF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDRGP4 mod_fogInterval
INDIRI4
CVIF4 4
MULF4
MULF4
ADDF4
ASGNF4
line 262
;262:		VectorScale(cg.viewfog[i].axis[0], scale, cg.viewfog[i].axis[0]);
ADDRLP4 40
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 cg+1953072+28
ADDP4
ADDRLP4 40
INDIRI4
ADDRGP4 cg+1953072+28
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 44
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 cg+1953072+28+4
ADDP4
ADDRLP4 44
INDIRI4
ADDRGP4 cg+1953072+28+4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 48
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 cg+1953072+28+8
ADDP4
ADDRLP4 48
INDIRI4
ADDRGP4 cg+1953072+28+8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 263
;263:		VectorScale(cg.viewfog[i].axis[1], scale, cg.viewfog[i].axis[1]);
ADDRLP4 52
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRGP4 cg+1953072+28+12
ADDP4
ADDRLP4 52
INDIRI4
ADDRGP4 cg+1953072+28+12
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 56
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 cg+1953072+28+12+4
ADDP4
ADDRLP4 56
INDIRI4
ADDRGP4 cg+1953072+28+12+4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 60
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 cg+1953072+28+12+8
ADDP4
ADDRLP4 60
INDIRI4
ADDRGP4 cg+1953072+28+12+8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 264
;264:		VectorScale(cg.viewfog[i].axis[2], scale, cg.viewfog[i].axis[2]);
ADDRLP4 64
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 cg+1953072+28+24
ADDP4
ADDRLP4 64
INDIRI4
ADDRGP4 cg+1953072+28+24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRGP4 cg+1953072+28+24+4
ADDP4
ADDRLP4 68
INDIRI4
ADDRGP4 cg+1953072+28+24+4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRGP4 cg+1953072+28+24+8
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 cg+1953072+28+24+8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 266
;265:
;266:		trap_R_AddRefEntityToScene(&cg.viewfog[i]);
CNSTI4 176
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+1953072
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 267
;267:	}
LABELV $273
line 247
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $272
line 268
;268:}
LABELV $263
endproc CG_ViewFog 76 8
proc CG_ViewSky 20 8
line 270
;269:
;270:static void CG_ViewSky( void ) {
line 274
;271:	int i;
;272:	float scale;
;273:	
;274:	if(!mod_skyColorA){
ADDRGP4 mod_skyColorA
INDIRI4
CNSTI4 0
NEI4 $377
line 275
;275:		return;
ADDRGP4 $376
JUMPV
LABELV $377
line 278
;276:	}
;277:
;278:	cg.viewsky.hModel = trap_R_RegisterModel_MiTech( "models/fog1" );
ADDRGP4 $381
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cg+1955888+8
ADDRLP4 8
INDIRI4
ASGNI4
line 279
;279:	cg.viewsky.customShader = trap_R_RegisterShader(va("models/skytex%i", mod_skyShader));
ADDRGP4 $384
ARGP4
ADDRGP4 mod_skyShader
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cg+1955888+112
ADDRLP4 16
INDIRI4
ASGNI4
line 281
;280:
;281:	VectorCopy(cg.refdef.vieworg, cg.viewsky.origin);
ADDRGP4 cg+1955888+68
ADDRGP4 cg+1870616+24
INDIRB
ASGNB 12
line 282
;282:	VectorCopy(cg.refdef.viewaxis[0], cg.viewsky.axis[0]);
ADDRGP4 cg+1955888+28
ADDRGP4 cg+1870616+36
INDIRB
ASGNB 12
line 283
;283:	VectorCopy(cg.refdef.viewaxis[1], cg.viewsky.axis[1]);
ADDRGP4 cg+1955888+28+12
ADDRGP4 cg+1870616+36+12
INDIRB
ASGNB 12
line 284
;284:	VectorCopy(cg.refdef.viewaxis[2], cg.viewsky.axis[2]);
ADDRGP4 cg+1955888+28+24
ADDRGP4 cg+1870616+36+24
INDIRB
ASGNB 12
line 286
;285:
;286:	cg.viewsky.shaderRGBA[0] = mod_skyColorR;
ADDRGP4 cg+1955888+116
ADDRGP4 mod_skyColorR
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 287
;287:	cg.viewsky.shaderRGBA[1] = mod_skyColorG;
ADDRGP4 cg+1955888+116+1
ADDRGP4 mod_skyColorG
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 288
;288:	cg.viewsky.shaderRGBA[2] = mod_skyColorB;
ADDRGP4 cg+1955888+116+2
ADDRGP4 mod_skyColorB
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 289
;289:	cg.viewsky.shaderRGBA[3] = mod_skyColorA;
ADDRGP4 cg+1955888+116+3
ADDRGP4 mod_skyColorA
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 291
;290:
;291:	scale = 4;
ADDRLP4 0
CNSTF4 1082130432
ASGNF4
line 292
;292:	VectorScale(cg.viewsky.axis[0], scale, cg.viewsky.axis[0]);
ADDRGP4 cg+1955888+28
ADDRGP4 cg+1955888+28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+1955888+28+4
ADDRGP4 cg+1955888+28+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+1955888+28+8
ADDRGP4 cg+1955888+28+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 293
;293:	VectorScale(cg.viewsky.axis[1], scale, cg.viewsky.axis[1]);
ADDRGP4 cg+1955888+28+12
ADDRGP4 cg+1955888+28+12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+1955888+28+12+4
ADDRGP4 cg+1955888+28+12+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+1955888+28+12+8
ADDRGP4 cg+1955888+28+12+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 294
;294:	VectorScale(cg.viewsky.axis[2], scale, cg.viewsky.axis[2]);
ADDRGP4 cg+1955888+28+24
ADDRGP4 cg+1955888+28+24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+1955888+28+24+4
ADDRGP4 cg+1955888+28+24+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+1955888+28+24+8
ADDRGP4 cg+1955888+28+24+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 296
;295:	
;296:	cg.viewsky.renderfx = RF_FIRST_PERSON;
ADDRGP4 cg+1955888+4
CNSTI4 4
ASGNI4
line 298
;297:
;298:	trap_R_AddRefEntityToScene(&cg.viewsky);
ADDRGP4 cg+1955888
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 299
;299:}
LABELV $376
endproc CG_ViewSky 20 8
data
align 4
LABELV $480
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $481
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
code
proc CG_OffsetThirdPersonView 184 28
line 309
;300:
;301:
;302:/*
;303:===============
;304:CG_OffsetThirdPersonView
;305:
;306:===============
;307:*/
;308:#define	FOCUS_DISTANCE	512
;309:static void CG_OffsetThirdPersonView( void ) {
line 320
;310:	vec3_t		forward, right, up;
;311:	vec3_t		view;
;312:	vec3_t		focusAngles;
;313:	trace_t		trace;
;314:	static vec3_t	mins = { -4, -4, -4 };
;315:	static vec3_t	maxs = { 4, 4, 4 };
;316:	vec3_t		focusPoint;
;317:	float		focusDist;
;318:	float		forwardScale, sideScale;
;319:
;320:	cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 140
ADDRGP4 cg+1870616+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+1868928+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 322
;321:
;322:	VectorCopy( cg.refdefViewAngles, focusAngles );
ADDRLP4 48
ADDRGP4 cg+1870984
INDIRB
ASGNB 12
line 325
;323:
;324:	// if dead, look at killer
;325:	if ( (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0) && (cg.snap->ps.pm_type != PM_SPECTATOR) && (cgs.gametype !=GT_ELIMINATION && cgs.gametype !=GT_CTF_ELIMINATION && cgs.gametype !=GT_LMS) ) {
ADDRGP4 cg+1868928+184
INDIRI4
CNSTI4 0
GTI4 $488
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
EQI4 $488
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
EQI4 $488
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $488
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
EQI4 $488
line 326
;326:		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRLP4 48+4
ADDRGP4 cg+1868928+184+20
INDIRI4
CVIF4 4
ASGNF4
line 327
;327:		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRGP4 cg+1870984+4
ADDRGP4 cg+1868928+184+20
INDIRI4
CVIF4 4
ASGNF4
line 328
;328:	}
LABELV $488
line 330
;329:
;330:	if ( focusAngles[PITCH] > 45 ) {
ADDRLP4 48
INDIRF4
CNSTF4 1110704128
LEF4 $505
line 331
;331:		focusAngles[PITCH] = 45;		// don't go too far overhead
ADDRLP4 48
CNSTF4 1110704128
ASGNF4
line 332
;332:	}
LABELV $505
line 333
;333:	AngleVectors( focusAngles, forward, right, NULL );
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 335
;334:
;335:	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );
ADDRLP4 144
CNSTF4 1140850688
ASGNF4
ADDRLP4 12
ADDRGP4 cg+1870616+24
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+1870616+24+4
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+1870616+24+8
INDIRF4
CNSTF4 1140850688
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 337
;336:
;337:	VectorCopy( cg.refdef.vieworg, view );
ADDRLP4 0
ADDRGP4 cg+1870616+24
INDIRB
ASGNB 12
line 339
;338:
;339:	view[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 340
;340:	if(!BG_VehicleCheckClass(cg.snap->ps.stats[STAT_VEHICLE])){
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BG_VehicleCheckClass
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $522
line 341
;341:	VectorMA( view, cg_thirdPersonOffset.value, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonOffset+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonOffset+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonOffset+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 342
;342:	} else {
ADDRGP4 $523
JUMPV
LABELV $522
line 343
;343:	VectorMA( view, 0, right, view );		
ADDRLP4 152
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 0
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 344
;344:	}
LABELV $523
line 346
;345:
;346:	cg.refdefViewAngles[PITCH] *= 0.5;
ADDRLP4 152
ADDRGP4 cg+1870984
ASGNP4
ADDRLP4 152
INDIRP4
CNSTF4 1056964608
ADDRLP4 152
INDIRP4
INDIRF4
MULF4
ASGNF4
line 348
;347:
;348:	AngleVectors( cg.refdefViewAngles, forward, right, up );
ADDRGP4 cg+1870984
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 350
;349:
;350:	forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 156
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 60
ADDRLP4 156
INDIRF4
ASGNF4
line 351
;351:	sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 160
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 64
ADDRLP4 160
INDIRF4
ASGNF4
line 352
;352:	if(!BG_VehicleCheckClass(cg.snap->ps.stats[STAT_VEHICLE])){
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 BG_VehicleCheckClass
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $544
line 353
;353:	VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 354
;354:	VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 355
;355:	} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 356
;356:	VectorMA( view, -180 * forwardScale, forward, view );
ADDRLP4 168
CNSTF4 3274964992
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
CNSTF4 3274964992
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 357
;357:	VectorMA( view, -180 * sideScale, right, view );		
ADDRLP4 172
CNSTF4 3274964992
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
CNSTF4 3274964992
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 358
;358:	}
LABELV $545
line 363
;359:
;360:	// trace a ray from the origin to the viewpoint to make sure the view isn't
;361:	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;362:
;363:	if (!cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $577
line 364
;364:		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+1870616+24
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 $481
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 366
;365:
;366:		if ( trace.fraction != 1.0 ) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
EQF4 $584
line 367
;367:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 368
;368:			view[2] += (1.0 - trace.fraction) * 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
CNSTF4 1065353216
ADDRLP4 72+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 372
;369:			// try another trace to this position, because a tunnel may have the ceiling
;370:			// close enogh that this is poking out
;371:
;372:			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+1870616+24
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 $481
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 373
;373:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 374
;374:		}
LABELV $584
line 375
;375:	}
LABELV $577
line 378
;376:
;377:
;378:	VectorCopy( view, cg.refdef.vieworg );
ADDRGP4 cg+1870616+24
ADDRLP4 0
INDIRB
ASGNB 12
line 381
;379:
;380:	// select pitch to look at focus point from vieword
;381:	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+1870616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+1870616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+1870616+24+8
INDIRF4
SUBF4
ASGNF4
line 382
;382:	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
ADDRLP4 168
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 168
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 172
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 172
INDIRF4
ASGNF4
line 383
;383:	if ( focusDist < 1 ) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $611
line 384
;384:		focusDist = 1;	// should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 385
;385:	}
LABELV $611
line 386
;386:	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 176
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRGP4 cg+1870984
CNSTF4 3261411041
ADDRLP4 176
INDIRF4
MULF4
ASGNF4
line 387
;387:	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
ADDRLP4 180
ADDRGP4 cg+1870984+4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
SUBF4
ASGNF4
line 388
;388:}
LABELV $479
endproc CG_OffsetThirdPersonView 184 28
proc CG_StepOffset 8 0
line 392
;389:
;390:
;391:// this causes a compiler bug on mac MrC compiler
;392:static void CG_StepOffset( void ) {
line 396
;393:	int		timeDelta;
;394:	
;395:	// smooth out stair climbing
;396:	timeDelta = cg.time - cg.stepTime;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1870420
INDIRI4
SUBI4
ASGNI4
line 397
;397:	if ( timeDelta < STEP_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
GEI4 $621
line 398
;398:		cg.refdef.vieworg[2] -= cg.stepChange 
ADDRLP4 4
ADDRGP4 cg+1870616+24+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+1870416
INDIRF4
CNSTI4 200
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 400
;399:			* (STEP_TIME - timeDelta) / STEP_TIME;
;400:	}
LABELV $621
line 401
;401:}
LABELV $618
endproc CG_StepOffset 8 0
proc CG_OffsetFirstPersonView 100 0
line 409
;402:
;403:/*
;404:===============
;405:CG_OffsetFirstPersonView
;406:
;407:===============
;408:*/
;409:static void CG_OffsetFirstPersonView( void ) {
line 420
;410:	float			*origin;
;411:	float			*angles;
;412:	float			bob;
;413:	float			ratio;
;414:	float			delta;
;415:	float			speed;
;416:	float			f;
;417:	vec3_t			predictedVelocity;
;418:	int				timeDelta;
;419:	
;420:	if ( cg.snap->ps.pm_type == PM_INTERMISSION || cg.snap->ps.pm_type == PM_CUTSCENE ) {
ADDRLP4 44
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $632
ADDRGP4 cg+36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $628
LABELV $632
line 421
;421:		return;
ADDRGP4 $627
JUMPV
LABELV $628
line 424
;422:	}
;423:
;424:	origin = cg.refdef.vieworg;
ADDRLP4 8
ADDRGP4 cg+1870616+24
ASGNP4
line 425
;425:	angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+1870984
ASGNP4
line 428
;426:
;427:	// if dead, fix the angle and don't add any kick
;428:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $636
line 429
;429:		angles[ROLL] = 40;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1109393408
ASGNF4
line 430
;430:		angles[PITCH] = -15;
ADDRLP4 4
INDIRP4
CNSTF4 3245342720
ASGNF4
line 431
;431:		angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 432
;432:		origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 48
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRGP4 cg+1868928+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 433
;433:		return;
ADDRGP4 $627
JUMPV
LABELV $636
line 437
;434:	}
;435:
;436:	// add angles based on weapon kick
;437:	VectorAdd (angles, cg.kick_angles, angles);
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+1953032
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRGP4 cg+1953032+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 cg+1953032+8
INDIRF4
ADDF4
ASGNF4
line 440
;438:
;439:	// add angles based on damage kick
;440:	if ( cg.damageTime && cgs.gametype!=GT_ELIMINATION && cgs.gametype!=GT_CTF_ELIMINATION && cgs.gametype!=GT_LMS) {
ADDRGP4 cg+1952976
INDIRF4
CNSTF4 0
EQF4 $647
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
EQI4 $647
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $647
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
EQI4 $647
line 441
;441:		ratio = cg.time - cg.damageTime;
ADDRLP4 32
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1952976
INDIRF4
SUBF4
ASGNF4
line 442
;442:		if ( ratio < DAMAGE_DEFLECT_TIME ) {
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $655
line 443
;443:			ratio /= DAMAGE_DEFLECT_TIME;
ADDRLP4 32
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 444
;444:			angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+1953024
INDIRF4
MULF4
ADDF4
ASGNF4
line 445
;445:			angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+1953028
INDIRF4
MULF4
ADDF4
ASGNF4
line 446
;446:		} else {
ADDRGP4 $656
JUMPV
LABELV $655
line 447
;447:			ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
ADDRLP4 32
CNSTF4 1065353216
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
SUBF4
CNSTF4 1137180672
DIVF4
SUBF4
ASGNF4
line 448
;448:			if ( ratio > 0 ) {
ADDRLP4 32
INDIRF4
CNSTF4 0
LEF4 $659
line 449
;449:				angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+1953024
INDIRF4
MULF4
ADDF4
ASGNF4
line 450
;450:				angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+1953028
INDIRF4
MULF4
ADDF4
ASGNF4
line 451
;451:			}
LABELV $659
line 452
;452:		}
LABELV $656
line 453
;453:	}
LABELV $647
line 464
;454:
;455:	// add pitch based on fall kick
;456:#if 0
;457:	ratio = ( cg.time - cg.landTime) / FALL_TIME;
;458:	if (ratio < 0)
;459:		ratio = 0;
;460:	angles[PITCH] += ratio * cg.fall_value;
;461:#endif
;462:
;463:	// add angles based on velocity
;464:	VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );
ADDRLP4 12
ADDRGP4 cg+1868928+32
INDIRB
ASGNB 12
line 466
;465:
;466:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+1870616+36
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+1870616+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+1870616+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 467
;467:	angles[PITCH] += delta * cg_runpitch.value;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runpitch+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 469
;468:	
;469:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+1870616+36+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+1870616+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+1870616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 470
;470:	angles[ROLL] -= delta * cg_runroll.value;
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runroll+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 475
;471:
;472:	// add angles based on bob
;473:
;474:	// make sure the bob is visible even at low speeds
;475:	speed = cg.xyspeed > 200 ? cg.xyspeed : 200;
ADDRGP4 cg+1953064
INDIRF4
CNSTF4 1128792064
LEF4 $693
ADDRLP4 68
ADDRGP4 cg+1953064
INDIRF4
ASGNF4
ADDRGP4 $694
JUMPV
LABELV $693
ADDRLP4 68
CNSTF4 1128792064
ASGNF4
LABELV $694
ADDRLP4 28
ADDRLP4 68
INDIRF4
ASGNF4
line 477
;476:
;477:	delta = cg.bobfracsin * cg_bobpitch.value * speed;
ADDRLP4 0
ADDRGP4 cg+1953056
INDIRF4
ADDRGP4 cg_bobpitch+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 478
;478:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+1868928+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $697
line 479
;479:		delta *= 3;		// crouching
ADDRLP4 0
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $697
line 480
;480:	angles[PITCH] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 481
;481:	delta = cg.bobfracsin * cg_bobroll.value * speed;
ADDRLP4 0
ADDRGP4 cg+1953056
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 482
;482:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+1868928+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $703
line 483
;483:		delta *= 3;		// crouching accentuates roll
ADDRLP4 0
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $703
line 484
;484:	if (cg.bobcycle & 1)
ADDRGP4 cg+1953060
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $707
line 485
;485:		delta = -delta;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $707
line 486
;486:	angles[ROLL] += delta;
ADDRLP4 76
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 491
;487:
;488://===================================
;489:
;490:	// add view height
;491:	origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 80
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRGP4 cg+1868928+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 494
;492:
;493:	// smooth out duck height changes
;494:	timeDelta = cg.time - cg.duckTime;
ADDRLP4 36
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1870428
INDIRI4
SUBI4
ASGNI4
line 495
;495:	if ( timeDelta < DUCK_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 100
GEI4 $714
line 496
;496:		cg.refdef.vieworg[2] -= cg.duckChange 
ADDRLP4 84
ADDRGP4 cg+1870616+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+1870424
INDIRF4
CNSTI4 100
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
ASGNF4
line 498
;497:			* (DUCK_TIME - timeDelta) / DUCK_TIME;
;498:	}
LABELV $714
line 501
;499:
;500:	// add bob height
;501:	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
ADDRLP4 24
ADDRGP4 cg+1953056
INDIRF4
ADDRGP4 cg+1953064
INDIRF4
MULF4
ADDRGP4 cg_bobup+8
INDIRF4
MULF4
ASGNF4
line 502
;502:	if (bob > 6) {
ADDRLP4 24
INDIRF4
CNSTF4 1086324736
LEF4 $723
line 503
;503:		bob = 6;
ADDRLP4 24
CNSTF4 1086324736
ASGNF4
line 504
;504:	}
LABELV $723
line 506
;505:
;506:	origin[2] += bob;
ADDRLP4 84
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 510
;507:
;508:
;509:	// add fall height
;510:	delta = cg.time - cg.landTime;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1870436
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 511
;511:	if ( delta < LAND_DEFLECT_TIME ) {
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
GEF4 $727
line 512
;512:		f = delta / LAND_DEFLECT_TIME;
ADDRLP4 40
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
DIVF4
ASGNF4
line 513
;513:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 88
ADDRGP4 cg+1870616+24+8
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRGP4 cg+1870432
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 514
;514:	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRGP4 $728
JUMPV
LABELV $727
ADDRLP4 0
INDIRF4
CNSTF4 1138819072
GEF4 $733
line 515
;515:		delta -= LAND_DEFLECT_TIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
SUBF4
ASGNF4
line 516
;516:		f = 1.0 - ( delta / LAND_RETURN_TIME );
ADDRLP4 40
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
CNSTF4 1133903872
DIVF4
SUBF4
ASGNF4
line 517
;517:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 88
ADDRGP4 cg+1870616+24+8
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRGP4 cg+1870432
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 518
;518:	}
LABELV $733
LABELV $728
line 521
;519:
;520:	// add step offset
;521:	CG_StepOffset();
ADDRGP4 CG_StepOffset
CALLV
pop
line 525
;522:
;523:	// add kick offset
;524:
;525:	VectorAdd (origin, cg.kick_origin, origin);
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cg+1953044
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRGP4 cg+1953044+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRGP4 cg+1953044+8
INDIRF4
ADDF4
ASGNF4
line 539
;526:
;527:	// pivot the eye based on a neck length
;528:#if 0
;529:	{
;530:#define	NECK_LENGTH		8
;531:	vec3_t			forward, up;
;532: 
;533:	cg.refdef.vieworg[2] -= NECK_LENGTH;
;534:	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
;535:	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
;536:	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
;537:	}
;538:#endif
;539:}
LABELV $627
endproc CG_OffsetFirstPersonView 100 0
export CG_ZoomDown_f
proc CG_ZoomDown_f 0 4
line 543
;540:
;541://======================================================================
;542:
;543:void CG_ZoomDown_f( void ) { 
line 544
;544:	if ( cg.zoomed ) {
ADDRGP4 cg+1870996
INDIRI4
CNSTI4 0
EQI4 $745
line 545
;545:		return;
ADDRGP4 $744
JUMPV
LABELV $745
line 547
;546:	}
;547:	if ( cg.snap->ps.weapon != WP_PHYSGUN ){
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 17
EQI4 $748
line 548
;548:	cg.zoomed = qtrue;
ADDRGP4 cg+1870996
CNSTI4 1
ASGNI4
line 549
;549:	cg.zoomTime = cg.time;
ADDRGP4 cg+1871000
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 550
;550:	} else {
ADDRGP4 $749
JUMPV
LABELV $748
line 551
;551:	trap_SendConsoleCommand("altfire_physgun\n");
ADDRGP4 $754
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 552
;552:	}
LABELV $749
line 553
;553:}
LABELV $744
endproc CG_ZoomDown_f 0 4
export CG_ZoomUp_f
proc CG_ZoomUp_f 0 0
line 555
;554:
;555:void CG_ZoomUp_f( void ) { 
line 556
;556:	if ( !cg.zoomed ) {
ADDRGP4 cg+1870996
INDIRI4
CNSTI4 0
NEI4 $756
line 557
;557:		return;
ADDRGP4 $755
JUMPV
LABELV $756
line 559
;558:	}
;559:	cg.zoomed = qfalse;
ADDRGP4 cg+1870996
CNSTI4 0
ASGNI4
line 560
;560:	cg.zoomTime = cg.time;
ADDRGP4 cg+1871000
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 561
;561:}
LABELV $755
endproc CG_ZoomUp_f 0 0
proc CG_CalcFov 52 8
line 574
;562:
;563:
;564:/*
;565:====================
;566:CG_CalcFov
;567:
;568:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;569:====================
;570:*/
;571:#define	WAVE_AMPLITUDE	1
;572:#define	WAVE_FREQUENCY	0.4
;573:
;574:static int CG_CalcFov( void ) {
line 584
;575:	float	x;
;576:	float	phase;
;577:	float	v;
;578:	int		contents;
;579:	float	fov_x, fov_y;
;580:	float	zoomFov;
;581:	float	f;
;582:	int		inwater;
;583:
;584:	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 5
NEI4 $763
line 586
;585:		// if in intermission, use a fixed value
;586:		fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 587
;587:	} else {
ADDRGP4 $764
JUMPV
LABELV $763
line 589
;588:		// user selectable
;589:		if ( cgs.dmflags & DF_FIXED_FOV ) {
ADDRGP4 cgs+339044
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $767
line 591
;590:			// dmflag to prevent wide fov for all clients
;591:			fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 592
;592:		} else {
ADDRGP4 $768
JUMPV
LABELV $767
line 593
;593:			fov_x = cg_fov.value;
ADDRLP4 0
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 594
;594:			if ( fov_x < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $771
line 595
;595:				fov_x = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 596
;596:			} else if ( fov_x > 160 ) {
ADDRGP4 $772
JUMPV
LABELV $771
ADDRLP4 0
INDIRF4
CNSTF4 1126170624
LEF4 $773
line 597
;597:				fov_x = 160;
ADDRLP4 0
CNSTF4 1126170624
ASGNF4
line 598
;598:			}
LABELV $773
LABELV $772
line 599
;599:		}
LABELV $768
line 601
;600:
;601:                if ( cgs.dmflags & DF_FIXED_FOV ) {
ADDRGP4 cgs+339044
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $775
line 603
;602:			// dmflag to prevent wide fov for all clients
;603:			zoomFov = 22.5;
ADDRLP4 20
CNSTF4 1102315520
ASGNF4
line 604
;604:		} else {
ADDRGP4 $776
JUMPV
LABELV $775
line 606
;605:                        // account for zooms
;606:                        zoomFov = cg_zoomFov.value;
ADDRLP4 20
ADDRGP4 cg_zoomFov+8
INDIRF4
ASGNF4
line 607
;607:                        if ( zoomFov < 1 ) {
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
GEF4 $779
line 608
;608:                                zoomFov = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 609
;609:                        } else if ( zoomFov > 160 ) {
ADDRGP4 $780
JUMPV
LABELV $779
ADDRLP4 20
INDIRF4
CNSTF4 1126170624
LEF4 $781
line 610
;610:                                zoomFov = 160;
ADDRLP4 20
CNSTF4 1126170624
ASGNF4
line 611
;611:                        }
LABELV $781
LABELV $780
line 613
;612:
;613:                        if( (cgs.videoflags & VF_LOCK_CVARS_BASIC) && zoomFov>140 )
ADDRGP4 cgs+339048
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $783
ADDRLP4 20
INDIRF4
CNSTF4 1124859904
LEF4 $783
line 614
;614:                                zoomFov = 140;
ADDRLP4 20
CNSTF4 1124859904
ASGNF4
LABELV $783
line 615
;615:                }
LABELV $776
line 617
;616:
;617:		if ( cg.zoomed ) {
ADDRGP4 cg+1870996
INDIRI4
CNSTI4 0
EQI4 $786
line 618
;618:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 28
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1871000
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg_zoomtime+8
INDIRF4
DIVF4
ASGNF4
line 619
;619:			if ( f > 1.0 ) {
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $792
line 620
;620:				fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 621
;621:			} else {
ADDRGP4 $787
JUMPV
LABELV $792
line 622
;622:				fov_x = fov_x + f * ( zoomFov - fov_x );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 623
;623:			}
line 624
;624:		} else {
ADDRGP4 $787
JUMPV
LABELV $786
line 625
;625:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 28
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1871000
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg_zoomtime+8
INDIRF4
DIVF4
ASGNF4
line 626
;626:			if ( f > 1.0 ) {
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $797
line 627
;627:				fov_x = fov_x;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ASGNF4
line 628
;628:			} else {
ADDRGP4 $798
JUMPV
LABELV $797
line 629
;629:				fov_x = zoomFov + f * ( fov_x - zoomFov );
ADDRLP4 36
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 630
;630:			}
LABELV $798
line 631
;631:		}
LABELV $787
line 632
;632:	}
LABELV $764
line 634
;633:
;634:	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 36
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 8
ADDRGP4 cg+1870616+8
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
line 635
;635:	fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+1870616+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ASGNF4
line 636
;636:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 639
;637:
;638:	// warp if underwater
;639:	contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+1870616+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 44
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 640
;640:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $805
line 641
;641:		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
ADDRLP4 32
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1053609165
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 642
;642:		v = WAVE_AMPLITUDE * sin( phase );
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 24
CNSTF4 1065353216
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 643
;643:		fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 644
;644:		fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
line 645
;645:		inwater = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 646
;646:	}
ADDRGP4 $806
JUMPV
LABELV $805
line 647
;647:	else {
line 648
;648:		inwater = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 649
;649:	}
LABELV $806
line 653
;650:
;651:
;652:	// set it
;653:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+1870616+16
ADDRLP4 0
INDIRF4
ASGNF4
line 654
;654:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+1870616+20
ADDRLP4 4
INDIRF4
ASGNF4
line 656
;655:
;656:	if ( !cg.zoomed ) {
ADDRGP4 cg+1870996
INDIRI4
CNSTI4 0
NEI4 $812
line 657
;657:		cg.zoomSensitivity = 1;
ADDRGP4 cg+1871004
CNSTF4 1065353216
ASGNF4
line 658
;658:	} else {
ADDRGP4 $813
JUMPV
LABELV $812
line 659
;659:		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+1871004
ADDRGP4 cg+1870616+20
INDIRF4
CNSTF4 1117126656
DIVF4
ASGNF4
line 660
;660:	}
LABELV $813
line 662
;661:
;662:	return inwater;
ADDRLP4 16
INDIRI4
RETI4
LABELV $762
endproc CG_CalcFov 52 8
proc CG_DamageBlendBlob 200 12
line 673
;663:}
;664:
;665:
;666:
;667:/*
;668:===============
;669:CG_DamageBlendBlob
;670:
;671:===============
;672:*/
;673:static void CG_DamageBlendBlob( void ) {
line 678
;674:	int			t;
;675:	int			maxTime;
;676:	refEntity_t		ent;
;677:
;678:	if ( !cg.damageValue ) {
ADDRGP4 cg+1952988
INDIRF4
CNSTF4 0
NEF4 $820
line 679
;679:		return;
ADDRGP4 $819
JUMPV
LABELV $820
line 682
;680:	}
;681:
;682:	maxTime = DAMAGE_TIME;
ADDRLP4 180
CNSTI4 500
ASGNI4
line 683
;683:	t = cg.time - cg.damageTime;
ADDRLP4 176
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1952976
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 684
;684:	if ( t <= 0 || t >= maxTime ) {
ADDRLP4 176
INDIRI4
CNSTI4 0
LEI4 $827
ADDRLP4 176
INDIRI4
ADDRLP4 180
INDIRI4
LTI4 $825
LABELV $827
line 685
;685:		return;
ADDRGP4 $819
JUMPV
LABELV $825
line 689
;686:	}
;687:
;688:
;689:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 690
;690:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 691
;691:	ent.renderfx = RF_FIRST_PERSON;
ADDRLP4 0+4
CNSTI4 4
ASGNI4
line 693
;692:
;693:	VectorMA( cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin );
ADDRLP4 0+68
ADDRGP4 cg+1870616+24
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRGP4 cg+1870616+24+4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRGP4 cg+1870616+24+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 694
;694:	VectorMA( ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+1870616+36+12
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+1952980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+1870616+36+12+4
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+1952980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+1870616+36+12+8
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+1952980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 695
;695:	VectorMA( ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+1870616+36+24
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1952984
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+1870616+36+24+4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1952984
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+1870616+36+24+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1952984
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 697
;696:
;697:	ent.radius = cg.damageValue * 3;
ADDRLP4 0+132
CNSTF4 1077936128
ADDRGP4 cg+1952988
INDIRF4
MULF4
ASGNF4
line 698
;698:	ent.customShader = cgs.media.viewBloodShader;
ADDRLP4 0+112
ADDRGP4 cgs+956380+460
INDIRI4
ASGNI4
line 699
;699:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 700
;700:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 701
;701:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 702
;702:	ent.shaderRGBA[3] = 200 * ( 1.0 - ((float)t / maxTime) );
ADDRLP4 192
CNSTF4 1128792064
CNSTF4 1065353216
ADDRLP4 176
INDIRI4
CVIF4 4
ADDRLP4 180
INDIRI4
CVIF4 4
DIVF4
SUBF4
MULF4
ASGNF4
ADDRLP4 196
CNSTF4 1325400064
ASGNF4
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
LTF4 $911
ADDRLP4 188
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $912
JUMPV
LABELV $911
ADDRLP4 188
ADDRLP4 192
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $912
ADDRLP4 0+116+3
ADDRLP4 188
INDIRU4
CVUU1 4
ASGNU1
line 703
;703:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 704
;704:}
LABELV $819
endproc CG_DamageBlendBlob 200 12
proc CG_CalcCutsceneFov 48 8
line 706
;705:
;706:static int CG_CalcCutsceneFov(int startFov, int endFov, float progress) {
line 714
;707:	int diff;
;708:	float fov_x, fov_y;
;709:	int x, contents;
;710:	float phase, v;
;711:	qboolean inwater;
;712:
;713:	//calculate new FOV
;714:	diff = endFov - startFov;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 715
;715:	fov_x = startFov + (diff * progress);
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 717
;716:	
;717:	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 12
ADDRGP4 cg+1870616+8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 718
;718:	fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+1870616+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 719
;719:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 0
CNSTF4 1135869952
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 722
;720:
;721:	// warp if underwater
;722:	contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+1870616+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 40
INDIRI4
ASGNI4
line 723
;723:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
ADDRLP4 16
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $920
line 724
;724:		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
ADDRLP4 28
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1053609165
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 725
;725:		v = WAVE_AMPLITUDE * sin( phase );
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 24
CNSTF4 1065353216
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 726
;726:		fov_x += v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 727
;727:		fov_y -= v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
line 728
;728:		inwater = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 729
;729:	}
ADDRGP4 $921
JUMPV
LABELV $920
line 730
;730:	else {
line 731
;731:		inwater = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 732
;732:	}
LABELV $921
line 735
;733:
;734:	// set it
;735:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+1870616+16
ADDRLP4 4
INDIRF4
ASGNF4
line 736
;736:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+1870616+20
ADDRLP4 0
INDIRF4
ASGNF4
line 738
;737:
;738:	return inwater;
ADDRLP4 20
INDIRI4
RETI4
LABELV $913
endproc CG_CalcCutsceneFov 48 8
proc CG_CalcCutsceneViewValues 1256 12
line 741
;739:}
;740:
;741:static int CG_CalcCutsceneViewValues( ) {
line 755
;742:	const char *cutsceneData;
;743:	char buf[MAX_INFO_STRING];
;744:	float wait;
;745:	int start_time;
;746:	vec3_t destOrigin, destAngles;
;747:	vec3_t newOrigin, newAngles;
;748:	int timePassed;
;749:	float progress;
;750:	float diff;
;751:	int motion;
;752:	int newFov, destFov;
;753:	int inwater;
;754:
;755:	cutsceneData = CG_ConfigString( CS_CUTSCENE );
CNSTI4 8614
ARGI4
ADDRLP4 1112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1112
INDIRP4
ASGNP4
line 757
;756:
;757:	motion = atoi(Info_ValueForKey(cutsceneData, "m"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $928
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 1120
INDIRI4
ASGNI4
line 758
;758:	start_time = atoi(Info_ValueForKey(cutsceneData, "t"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $929
ARGP4
ADDRLP4 1124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1128
INDIRI4
ASGNI4
line 759
;759:	wait = atof(Info_ValueForKey(cutsceneData, "w"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $930
ARGP4
ADDRLP4 1132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1136
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 1136
INDIRF4
ASGNF4
line 760
;760:	newOrigin[0] = atof(Info_ValueForKey(cutsceneData, "o10"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $931
ARGP4
ADDRLP4 1140
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1144
INDIRF4
ASGNF4
line 761
;761:	newOrigin[1] = atof(Info_ValueForKey(cutsceneData, "o11"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $933
ARGP4
ADDRLP4 1148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1152
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1152
INDIRF4
ASGNF4
line 762
;762:	newOrigin[2] = atof(Info_ValueForKey(cutsceneData, "o12"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $935
ARGP4
ADDRLP4 1156
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 1160
INDIRF4
ASGNF4
line 763
;763:	newAngles[0] = atof(Info_ValueForKey(cutsceneData, "a10"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $936
ARGP4
ADDRLP4 1164
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1168
INDIRF4
ASGNF4
line 764
;764:	newAngles[1] = atof(Info_ValueForKey(cutsceneData, "a11"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $938
ARGP4
ADDRLP4 1172
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1176
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 1176
INDIRF4
ASGNF4
line 765
;765:	newAngles[2] = atof(Info_ValueForKey(cutsceneData, "a12"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $940
ARGP4
ADDRLP4 1180
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 1184
INDIRF4
ASGNF4
line 766
;766:	newFov = atoi(Info_ValueForKey(cutsceneData, "f1"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $941
ARGP4
ADDRLP4 1188
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 1192
INDIRI4
ASGNI4
line 768
;767:
;768:	if ( motion & 1 ) {
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $942
line 769
;769:		destOrigin[0] = atof(Info_ValueForKey(cutsceneData, "o20"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $944
ARGP4
ADDRLP4 1196
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 1200
INDIRF4
ASGNF4
line 770
;770:		destOrigin[1] = atof(Info_ValueForKey(cutsceneData, "o21"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $946
ARGP4
ADDRLP4 1204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1208
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 1208
INDIRF4
ASGNF4
line 771
;771:		destOrigin[2] = atof(Info_ValueForKey(cutsceneData, "o22"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $948
ARGP4
ADDRLP4 1212
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 1216
INDIRF4
ASGNF4
line 772
;772:		destAngles[0] = atof(Info_ValueForKey(cutsceneData, "a20"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $949
ARGP4
ADDRLP4 1220
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 1224
INDIRF4
ASGNF4
line 773
;773:		destAngles[1] = atof(Info_ValueForKey(cutsceneData, "a21"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $951
ARGP4
ADDRLP4 1228
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1232
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 1232
INDIRF4
ASGNF4
line 774
;774:		destAngles[2] = atof(Info_ValueForKey(cutsceneData, "a22"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $953
ARGP4
ADDRLP4 1236
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1240
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 48+8
ADDRLP4 1240
INDIRF4
ASGNF4
line 775
;775:		destFov = atoi(Info_ValueForKey(cutsceneData, "f2"));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $954
ARGP4
ADDRLP4 1244
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1244
INDIRP4
ARGP4
ADDRLP4 1248
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 1248
INDIRI4
ASGNI4
line 778
;776:
;777:		//determine how long the current camera pan has taken
;778:		timePassed = cg.time - start_time;
ADDRLP4 80
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 76
INDIRI4
SUBI4
ASGNI4
line 779
;779:		progress = timePassed / (wait * 1000);
ADDRLP4 32
ADDRLP4 80
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 72
INDIRF4
MULF4
DIVF4
ASGNF4
line 782
;780:
;781:		//calculate new origin
;782:		diff = destOrigin[0] - newOrigin[0];
ADDRLP4 4
ADDRLP4 36
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 783
;783:		newOrigin[0] += diff * progress;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 785
;784:
;785:		diff = destOrigin[1] - newOrigin[1];
ADDRLP4 4
ADDRLP4 36+4
INDIRF4
ADDRLP4 8+4
INDIRF4
SUBF4
ASGNF4
line 786
;786:		newOrigin[1] += diff * progress;
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 788
;787:		
;788:		diff = destOrigin[2] - newOrigin[2];
ADDRLP4 4
ADDRLP4 36+8
INDIRF4
ADDRLP4 8+8
INDIRF4
SUBF4
ASGNF4
line 789
;789:		newOrigin[2] += diff * progress;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 792
;790:
;791:		//calculate new angles
;792:		diff = destAngles[0] - newAngles[0];
ADDRLP4 4
ADDRLP4 48
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
line 793
;793:		if ( diff > 180 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $962
line 794
;794:			diff = 0 - (360 - diff);
ADDRLP4 4
CNSTF4 0
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
SUBF4
SUBF4
ASGNF4
line 795
;795:		} else if ( diff < -180 ) {
ADDRGP4 $963
JUMPV
LABELV $962
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $964
line 796
;796:			diff = 0 - (-360 - diff);
ADDRLP4 4
CNSTF4 0
CNSTF4 3283353600
ADDRLP4 4
INDIRF4
SUBF4
SUBF4
ASGNF4
line 797
;797:		}
LABELV $964
LABELV $963
line 798
;798:		newAngles[0] += diff * progress;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 800
;799:		
;800:		diff = destAngles[1] - newAngles[1];
ADDRLP4 4
ADDRLP4 48+4
INDIRF4
ADDRLP4 20+4
INDIRF4
SUBF4
ASGNF4
line 801
;801:		if ( diff > 180 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $968
line 802
;802:			diff = 0 - (360 - diff);
ADDRLP4 4
CNSTF4 0
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
SUBF4
SUBF4
ASGNF4
line 803
;803:		} else if  ( diff < -180 ) {
ADDRGP4 $969
JUMPV
LABELV $968
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $970
line 804
;804:			diff = 0 - (-360 - diff);
ADDRLP4 4
CNSTF4 0
CNSTF4 3283353600
ADDRLP4 4
INDIRF4
SUBF4
SUBF4
ASGNF4
line 805
;805:		}
LABELV $970
LABELV $969
line 806
;806:		newAngles[1] += diff * progress;
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 808
;807:		
;808:		diff = destAngles[2] - newAngles[2];
ADDRLP4 4
ADDRLP4 48+8
INDIRF4
ADDRLP4 20+8
INDIRF4
SUBF4
ASGNF4
line 809
;809:		if ( diff > 180 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $975
line 810
;810:			diff = 0 - (360 - diff);
ADDRLP4 4
CNSTF4 0
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
SUBF4
SUBF4
ASGNF4
line 811
;811:		} else if  ( diff < -180 ) {
ADDRGP4 $976
JUMPV
LABELV $975
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $977
line 812
;812:			diff = 0 - (-360 - diff);
ADDRLP4 4
CNSTF4 0
CNSTF4 3283353600
ADDRLP4 4
INDIRF4
SUBF4
SUBF4
ASGNF4
line 813
;813:		}
LABELV $977
LABELV $976
line 814
;814:		newAngles[2] += diff * progress;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 816
;815:
;816:		VectorCopy( newOrigin, cg.refdef.vieworg );
ADDRGP4 cg+1870616+24
ADDRLP4 8
INDIRB
ASGNB 12
line 817
;817:		VectorCopy( newAngles, cg.refdefViewAngles );
ADDRGP4 cg+1870984
ADDRLP4 20
INDIRB
ASGNB 12
line 819
;818:
;819:		inwater = CG_CalcCutsceneFov(newFov, destFov, progress);
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 1252
ADDRGP4 CG_CalcCutsceneFov
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 1252
INDIRI4
ASGNI4
line 820
;820:	} else {
ADDRGP4 $943
JUMPV
LABELV $942
line 821
;821:		VectorCopy( newOrigin, cg.refdef.vieworg );
ADDRGP4 cg+1870616+24
ADDRLP4 8
INDIRB
ASGNB 12
line 822
;822:		VectorCopy( newAngles, cg.refdefViewAngles );
ADDRGP4 cg+1870984
ADDRLP4 20
INDIRB
ASGNB 12
line 823
;823:		inwater = CG_CalcCutsceneFov(newFov, newFov, progress);
ADDRLP4 1196
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 1196
INDIRI4
ARGI4
ADDRLP4 1196
INDIRI4
ARGI4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 1200
ADDRGP4 CG_CalcCutsceneFov
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 1200
INDIRI4
ASGNI4
line 824
;824:	}
LABELV $943
line 826
;825:
;826:	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+1870984
ARGP4
ADDRGP4 cg+1870616+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 828
;827:
;828:	return inwater;
ADDRLP4 68
INDIRI4
RETI4
LABELV $927
endproc CG_CalcCutsceneViewValues 1256 12
proc CG_CalcViewValues 72 16
line 838
;829:}
;830:
;831:/*
;832:===============
;833:CG_CalcViewValues
;834:
;835:Sets cg.refdef view values
;836:===============
;837:*/
;838:static int CG_CalcViewValues( void ) {
line 841
;839:	playerState_t	*ps;
;840:
;841:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+1870616
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 848
;842:
;843:	// strings for in game rendering
;844:	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
;845:	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );
;846:
;847:	// calculate size of 3D view
;848:	CG_CalcVrect();
ADDRGP4 CG_CalcVrect
CALLV
pop
line 850
;849:
;850:	ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+1868928
ASGNP4
line 866
;851:/*
;852:	if (cg.cameraMode) {
;853:		vec3_t origin, angles;
;854:		if (trap_getCameraInfo(cg.time, &origin, &angles)) {
;855:			VectorCopy(origin, cg.refdef.vieworg);
;856:			angles[ROLL] = 0;
;857:			VectorCopy(angles, cg.refdefViewAngles);
;858:			AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
;859:			return CG_CalcFov();
;860:		} else {
;861:			cg.cameraMode = qfalse;
;862:		}
;863:	}
;864:*/
;865:	//cutscene view
;866:	if ( ps->pm_type == PM_CUTSCENE ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $993
line 867
;867:		return CG_CalcCutsceneViewValues();	//this also calculates fov
ADDRLP4 4
ADDRGP4 CG_CalcCutsceneViewValues
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $989
JUMPV
LABELV $993
line 871
;868:	}
;869:
;870:	// intermission view
;871:	if ( ps->pm_type == PM_INTERMISSION ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $995
line 872
;872:		VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+1870616+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 873
;873:		VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+1870984
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 874
;874:		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+1870984
ARGP4
ADDRGP4 cg+1870616+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 875
;875:		return CG_CalcFov();
ADDRLP4 4
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $989
JUMPV
LABELV $995
line 878
;876:	}
;877:
;878:	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
ADDRGP4 cg+1953060
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 7
RSHI4
ASGNI4
line 879
;879:	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
CNSTF4 1078530011
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 127
BANDI4
CVIF4 4
CNSTF4 1123942400
DIVF4
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRGP4 cg+1953056
ADDRLP4 8
INDIRF4
ASGNF4
line 881
;880:
;881:	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 cg+1953064
ADDRLP4 24
INDIRF4
ASGNF4
line 885
;882:		ps->velocity[1] * ps->velocity[1] );
;883:
;884:
;885:	VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+1870616+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 886
;886:	VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+1870984
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 888
;887:
;888:	if (cg_cameraOrbit.integer) {
ADDRGP4 cg_cameraOrbit+12
INDIRI4
CNSTI4 0
EQI4 $1009
line 889
;889:		if (cg.time > cg.nextOrbitTime) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1953068
INDIRI4
LEI4 $1012
line 890
;890:			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
ADDRGP4 cg+1953068
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg_cameraOrbitDelay+12
INDIRI4
ADDI4
ASGNI4
line 891
;891:			cg_thirdPersonAngle.value += cg_cameraOrbit.value;
ADDRLP4 28
ADDRGP4 cg_thirdPersonAngle+8
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRGP4 cg_cameraOrbit+8
INDIRF4
ADDF4
ASGNF4
line 892
;892:		}
LABELV $1012
line 893
;893:	}
LABELV $1009
line 895
;894:	// add error decay
;895:	if ( cg_errorDecay.value > 0 ) {
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $1021
line 899
;896:		int		t;
;897:		float	f;
;898:
;899:		t = cg.time - cg.predictedErrorTime;
ADDRLP4 32
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1870332
INDIRI4
SUBI4
ASGNI4
line 900
;900:		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 28
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 901
;901:		if ( f > 0 && f < 1 ) {
ADDRLP4 36
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
LEF4 $1028
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
GEF4 $1028
line 902
;902:			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
ADDRGP4 cg+1870616+24
ADDRGP4 cg+1870616+24
INDIRF4
ADDRGP4 cg+1870336
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+1870616+24+4
ADDRGP4 cg+1870616+24+4
INDIRF4
ADDRGP4 cg+1870336+4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+1870616+24+8
ADDRGP4 cg+1870616+24+8
INDIRF4
ADDRGP4 cg+1870336+8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
line 903
;903:		} else {
ADDRGP4 $1029
JUMPV
LABELV $1028
line 904
;904:			cg.predictedErrorTime = 0;
ADDRGP4 cg+1870332
CNSTI4 0
ASGNI4
line 905
;905:		}
LABELV $1029
line 906
;906:	}
LABELV $1021
line 908
;907:
;908:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
EQI4 $1052
line 910
;909:		// back away from character
;910:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 911
;911:	} else {
ADDRGP4 $1053
JUMPV
LABELV $1052
line 913
;912:		// offset for local bobbing and kicks
;913:		CG_OffsetFirstPersonView();
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 914
;914:	}
LABELV $1053
line 917
;915:
;916:	// leilei - View-from-the-model-eyes feature, aka "fullbody awareness" lol
;917:	if (cg.renderingEyesPerson && !cg.renderingThirdPerson){
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 cg+1868920
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1055
ADDRGP4 cg+1868916
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1055
line 919
;918:		vec3_t		forward, up;	
;919:		cg.refdefViewAngles[ROLL] = headang[ROLL];
ADDRGP4 cg+1870984+8
ADDRGP4 headang+8
INDIRF4
ASGNF4
line 920
;920:		cg.refdefViewAngles[PITCH] = headang[PITCH];
ADDRGP4 cg+1870984
ADDRGP4 headang
INDIRF4
ASGNF4
line 921
;921:		cg.refdefViewAngles[YAW] = headang[YAW];
ADDRGP4 cg+1870984+4
ADDRGP4 headang+4
INDIRF4
ASGNF4
line 923
;922:
;923:		AngleVectors( headang, forward, NULL, up );
ADDRGP4 headang
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 924
;924:		if (cg.renderingEyesPerson == 2){
ADDRGP4 cg+1868920
INDIRI4
CNSTI4 2
NEI4 $1066
line 925
;925:			VectorMA( headpos, 0, forward, headpos );
ADDRLP4 56
ADDRGP4 headpos
ASGNP4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+4
ADDRGP4 headpos+4
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 32+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+8
ADDRGP4 headpos+8
INDIRF4
CNSTF4 0
ADDRLP4 32+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 926
;926:			VectorMA( headpos, 4, up, headpos );
ADDRLP4 64
ADDRGP4 headpos
ASGNP4
ADDRLP4 68
CNSTF4 1082130432
ASGNF4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+4
ADDRGP4 headpos+4
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+8
ADDRGP4 headpos+8
INDIRF4
CNSTF4 1082130432
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 927
;927:		}
ADDRGP4 $1067
JUMPV
LABELV $1066
line 929
;928:		else
;929:		{
line 930
;930:			VectorMA( headpos, cg_cameraEyes_Fwd.value, forward, headpos );
ADDRLP4 56
ADDRGP4 headpos
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg_cameraEyes_Fwd+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+4
ADDRGP4 headpos+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRGP4 cg_cameraEyes_Fwd+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+8
ADDRGP4 headpos+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRGP4 cg_cameraEyes_Fwd+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 931
;931:			VectorMA( headpos, cg_cameraEyes_Up.value, up, headpos );
ADDRLP4 60
ADDRGP4 headpos
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRGP4 cg_cameraEyes_Up+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+4
ADDRGP4 headpos+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRGP4 cg_cameraEyes_Up+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 headpos+8
ADDRGP4 headpos+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRGP4 cg_cameraEyes_Up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 932
;932:		}
LABELV $1067
line 934
;933:
;934:		cg.refdef.vieworg[0] = ps->origin[0] + headpos[0];
ADDRGP4 cg+1870616+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 headpos
INDIRF4
ADDF4
ASGNF4
line 935
;935:		cg.refdef.vieworg[1] = ps->origin[1] + headpos[1];
ADDRGP4 cg+1870616+24+4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 headpos+4
INDIRF4
ADDF4
ASGNF4
line 936
;936:		cg.refdef.vieworg[2] = ps->origin[2] + headpos[2] ;
ADDRGP4 cg+1870616+24+8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 headpos+8
INDIRF4
ADDF4
ASGNF4
line 938
;937:		
;938:	}
LABELV $1055
line 941
;939:
;940:	// position eye reletive to origin
;941:	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+1870984
ARGP4
ADDRGP4 cg+1870616+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 948
;942:
;943:	//if ( cg.hyperspace ) {
;944:	//	cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
;945:	//}
;946:
;947:	// field of view
;948:	return CG_CalcFov();
ADDRLP4 32
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
LABELV $989
endproc CG_CalcViewValues 72 16
proc CG_PowerupTimerSounds 16 16
line 957
;949:}
;950:
;951:
;952:/*
;953:=====================
;954:CG_PowerupTimerSounds
;955:=====================
;956:*/
;957:static void CG_PowerupTimerSounds( void ) {
line 962
;958:	int		i;
;959:	int		t;
;960:
;961:	// powerup timers going away
;962:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1113
line 963
;963:		t = cg.snap->ps.powerups[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRI4
ASGNI4
line 964
;964:		if ( t <= cg.time ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
GTI4 $1118
line 965
;965:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1118
line 967
;966:		}
;967:		if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $1121
line 968
;968:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1121
line 970
;969:		}
;970:		if ( ( t - cg.time ) / POWERUP_BLINK_TIME != ( t - cg.oldTime ) / POWERUP_BLINK_TIME ) {
ADDRLP4 12
CNSTI4 1000
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1868896
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
EQI4 $1124
line 971
;971:			trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+956380+1836
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 972
;972:		}
LABELV $1124
line 973
;973:	}
LABELV $1114
line 962
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $1113
line 974
;974:}
LABELV $1112
endproc CG_PowerupTimerSounds 16 16
export CG_AddBufferedSound
proc CG_AddBufferedSound 4 0
line 981
;975:
;976:/*
;977:=====================
;978:CG_AddBufferedSound
;979:=====================
;980:*/
;981:void CG_AddBufferedSound( sfxHandle_t sfx ) {
line 982
;982:	if ( !sfx )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1132
line 983
;983:		return;
ADDRGP4 $1131
JUMPV
LABELV $1132
line 984
;984:	cg.soundBuffer[cg.soundBufferIn] = sfx;
ADDRGP4 cg+1952840
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952852
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 985
;985:	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+1952840
ADDRGP4 cg+1952840
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 986
;986:	if (cg.soundBufferIn == cg.soundBufferOut) {
ADDRGP4 cg+1952840
INDIRI4
ADDRGP4 cg+1952844
INDIRI4
NEI4 $1138
line 987
;987:		cg.soundBufferOut++;
ADDRLP4 0
ADDRGP4 cg+1952844
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 988
;988:	}
LABELV $1138
line 989
;989:}
LABELV $1131
endproc CG_AddBufferedSound 4 0
proc CG_PlayBufferedSounds 0 8
line 996
;990:
;991:/*
;992:=====================
;993:CG_PlayBufferedSounds
;994:=====================
;995:*/
;996:static void CG_PlayBufferedSounds( void ) {
line 997
;997:	if ( cg.soundTime < cg.time ) {
ADDRGP4 cg+1952848
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $1144
line 998
;998:		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
ADDRGP4 cg+1952844
INDIRI4
ADDRGP4 cg+1952840
INDIRI4
EQI4 $1148
ADDRGP4 cg+1952844
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952852
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1148
line 999
;999:			trap_S_StartLocalSound(cg.soundBuffer[cg.soundBufferOut], CHAN_ANNOUNCER);
ADDRGP4 cg+1952844
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952852
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1000
;1000:			cg.soundBuffer[cg.soundBufferOut] = 0;
ADDRGP4 cg+1952844
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952852
ADDP4
CNSTI4 0
ASGNI4
line 1001
;1001:			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+1952844
ADDRGP4 cg+1952844
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 1002
;1002:			cg.soundTime = cg.time + 750;
ADDRGP4 cg+1952848
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 1003
;1003:		}
LABELV $1148
line 1004
;1004:	}
LABELV $1144
line 1005
;1005:}
LABELV $1143
endproc CG_PlayBufferedSounds 0 8
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 36 16
line 1016
;1006:
;1007://=========================================================================
;1008:
;1009:/*
;1010:=================
;1011:CG_DrawActiveFrame
;1012:
;1013:Generates and draws a game scene and status information at the given time.
;1014:=================
;1015:*/
;1016:void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
line 1019
;1017:	int		inwater;
;1018:
;1019:	cg.time = serverTime;
ADDRGP4 cg+1868892
ADDRFP4 0
INDIRI4
ASGNI4
line 1020
;1020:	cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 1023
;1021:
;1022:	// update cvars
;1023:	CG_UpdateCvars();
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 1027
;1024:
;1025:	// if we are only updating the screen as a loading
;1026:	// pacifier, don't even try to read snapshots
;1027:	if ( cg.infoScreenText[0] != 0 ) {
ADDRGP4 cg+1871008
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1165
line 1028
;1028:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 1029
;1029:		return;
ADDRGP4 $1162
JUMPV
LABELV $1165
line 1034
;1030:	}
;1031:
;1032:	// any looped sounds will be respecified as entities
;1033:	// are added to the render list
;1034:	trap_S_ClearLoopingSounds(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 1037
;1035:
;1036:	// clear all the render lists
;1037:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 1040
;1038:
;1039:	// set up cg.snap and possibly cg.nextSnap
;1040:	CG_ProcessSnapshots();
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 1044
;1041:
;1042:	// if we haven't received any snapshots yet, all
;1043:	// we can draw is the information screen
;1044:	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1172
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1168
LABELV $1172
line 1045
;1045:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 1046
;1046:		return;
ADDRGP4 $1162
JUMPV
LABELV $1168
line 1050
;1047:	}
;1048:
;1049:	// let the client system know what our weapon and zoom settings are
;1050:	trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );
ADDRGP4 cg+1870440
INDIRI4
ARGI4
ADDRGP4 cg+1871004
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 1053
;1051:
;1052:	// this counter will be bumped for every valid scene we generate
;1053:	cg.clientFrame++;
ADDRLP4 4
ADDRGP4 cg
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1056
;1054:
;1055:	// update cg.predictedPlayerState
;1056:	CG_PredictPlayerState();
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 1059
;1057:
;1058:	// decide on third person view
;1059:	cg.renderingThirdPerson = cg_thirdPerson.integer && cg.snap->ps.pm_type != PM_CUTSCENE && cg.snap->ps.pm_type != PM_SPECTATOR || (cg.snap->ps.stats[STAT_HEALTH] <= 0) || cg.snap->ps.stats[STAT_VEHICLE];
ADDRGP4 cg_thirdPerson+12
INDIRI4
CNSTI4 0
EQI4 $1186
ADDRLP4 12
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1186
ADDRGP4 cg+36
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1187
LABELV $1186
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1187
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1182
LABELV $1187
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1183
JUMPV
LABELV $1182
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1183
ADDRGP4 cg+1868916
ADDRLP4 8
INDIRI4
ASGNI4
line 1060
;1060:	cg.renderingEyesPerson = cg_cameraEyes.integer && cg.snap->ps.pm_type != PM_CUTSCENE && cg.snap->ps.pm_type != PM_SPECTATOR || cg.snap->ps.stats[STAT_VEHICLE];
ADDRGP4 cg_cameraEyes+12
INDIRI4
CNSTI4 0
EQI4 $1198
ADDRLP4 24
CNSTI4 48
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1198
ADDRGP4 cg+36
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1196
LABELV $1198
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1194
LABELV $1196
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $1195
JUMPV
LABELV $1194
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $1195
ADDRGP4 cg+1868920
ADDRLP4 20
INDIRI4
ASGNI4
line 1063
;1061:
;1062:	// build cg.refdef
;1063:	inwater = CG_CalcViewValues();
ADDRLP4 28
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 1066
;1064:
;1065:	// first person blend blobs, done after AnglesToAxis
;1066:	if ( !cg.renderingThirdPerson ) {
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $1199
line 1067
;1067:		CG_DamageBlendBlob();
ADDRGP4 CG_DamageBlendBlob
CALLV
pop
line 1068
;1068:	}
LABELV $1199
line 1072
;1069:
;1070:	// build the render lists
;1071:	//if ( !cg.hyperspace ) {
;1072:		CG_AddPacketEntities();			// adter calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 1073
;1073:		CG_AddMarks();
ADDRGP4 CG_AddMarks
CALLV
pop
line 1074
;1074:		CG_AddParticles ();
ADDRGP4 CG_AddParticles
CALLV
pop
line 1075
;1075:		CG_AddLocalEntities();
ADDRGP4 CG_AddLocalEntities
CALLV
pop
line 1077
;1076:		// used for q3f atmospheric effects
;1077:		CG_AddAtmosphericEffects();
ADDRGP4 CG_AddAtmosphericEffects
CALLV
pop
line 1078
;1078:		CG_ViewFog();
ADDRGP4 CG_ViewFog
CALLV
pop
line 1079
;1079:		CG_ViewSky();
ADDRGP4 CG_ViewSky
CALLV
pop
line 1081
;1080:	//}
;1081:	cg.hyperspace = qfalse;
ADDRGP4 cg+1868924
CNSTI4 0
ASGNI4
line 1082
;1082:	CG_AddViewWeapon( &cg.predictedPlayerState );
ADDRGP4 cg+1868928
ARGP4
ADDRGP4 CG_AddViewWeapon
CALLV
pop
line 1085
;1083:
;1084:	// add buffered sounds
;1085:	CG_PlayBufferedSounds();
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 1088
;1086:
;1087:	// play buffered voice chats
;1088:	CG_PlayBufferedVoiceChats();
ADDRGP4 CG_PlayBufferedVoiceChats
CALLV
pop
line 1091
;1089:
;1090:	// finish up the rest of the refdef
;1091:	if ( cg.testModelEntity.hModel ) {
ADDRGP4 cg+1956064+8
INDIRI4
CNSTI4 0
EQI4 $1204
line 1092
;1092:		CG_AddTestModel();
ADDRGP4 CG_AddTestModel
CALLV
pop
line 1093
;1093:	}
LABELV $1204
line 1094
;1094:	cg.refdef.time = cg.time;
ADDRGP4 cg+1870616+72
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1095
;1095:	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );
ADDRGP4 cg+1870616+80
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1098
;1096:
;1097:	// warning sounds when powerup is wearing off
;1098:	CG_PowerupTimerSounds();
ADDRGP4 CG_PowerupTimerSounds
CALLV
pop
line 1101
;1099:
;1100:	// update audio positions
;1101:	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+1870616+24
ARGP4
ADDRGP4 cg+1870616+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 1104
;1102:
;1103:	// make sure the lagometerSample and frame timing isn't done twice when in stereo
;1104:	if ( stereoView != STEREO_RIGHT ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $1221
line 1105
;1105:		cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+1868888
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1868896
INDIRI4
SUBI4
ASGNI4
line 1106
;1106:		if ( cg.frametime < 0 ) {
ADDRGP4 cg+1868888
INDIRI4
CNSTI4 0
GEI4 $1226
line 1107
;1107:			cg.frametime = 0;
ADDRGP4 cg+1868888
CNSTI4 0
ASGNI4
line 1108
;1108:		}
LABELV $1226
line 1109
;1109:		cg.oldTime = cg.time;
ADDRGP4 cg+1868896
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1110
;1110:		CG_AddLagometerFrameInfo();
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 1111
;1111:	}
LABELV $1221
line 1112
;1112:	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $1232
line 1113
;1113:		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1236
line 1114
;1114:			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 32
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+1868888
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ADDF4
ASGNF4
line 1115
;1115:			if (cg_timescale.value > cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $1237
line 1116
;1116:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 1117
;1117:		}
ADDRGP4 $1237
JUMPV
LABELV $1236
line 1118
;1118:		else {
line 1119
;1119:			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 32
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+1868888
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 1120
;1120:			if (cg_timescale.value < cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1252
line 1121
;1121:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $1252
line 1122
;1122:		}
LABELV $1237
line 1123
;1123:		if (cg_timescaleFadeSpeed.value) {
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $1258
line 1124
;1124:			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
ADDRGP4 $1262
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1261
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1125
;1125:		}
LABELV $1258
line 1126
;1126:	}
LABELV $1232
line 1129
;1127:
;1128:	// actually issue the rendering calls
;1129:	CG_DrawActive( stereoView );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 1131
;1130:
;1131:	if ( cg_stats.integer ) {
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $1264
line 1132
;1132:		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
ADDRGP4 $1267
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1133
;1133:	}
LABELV $1264
line 1136
;1134:
;1135:
;1136:}
LABELV $1162
endproc CG_DrawActiveFrame 36 16
import headang
import headpos
import wideAdjustX
import CG_NewParticleArea
import initparticles
import CG_LaunchFragment
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel_MiTech
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound_MiTech
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_Atmospheric_SetParticles
import CG_AddAtmosphericEffects
import teamcolormodels
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformationRus
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_SpurtBlood
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_LeiPuff
import CG_LeiSparks2
import CG_LeiSparks
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponBarNew2
import CG_DrawWeaponBarNew
import CG_DrawWeaponBar0
import CG_DrawWeaponSelect
import CG_AddRealWeapon
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_GravitygunTrail
import CG_PhysgunTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainVehicleEvent
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_ReloadPlayers
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_AddToGenericConsole
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModelCopy
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrintRus
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import CG_DrawFade
import CG_Fade
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_InsideBox
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawGiantString
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_DrawRoundedRect
import CG_FillRect2
import CG_FillRect
import CG_AdjustFrom640
import CG_FairCvars
import SnapVectorTowards
import CG_RegisterOverlay
import CG_IsTeamGame
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_PredictWeaponEffects
import cg_teamChatBeep
import cg_chatBeep
import cg_weaponOrder
import cg_weaponBarStyle
import cg_crosshairColorBlue
import cg_crosshairColorGreen
import cg_crosshairColorRed
import cg_ch13size
import cg_ch13
import cg_ch12size
import cg_ch12
import cg_ch11size
import cg_ch11
import cg_ch10size
import cg_ch10
import cg_ch9slze
import cg_ch9size
import cg_ch9
import cg_ch8size
import cg_ch8
import cg_ch7size
import cg_ch7
import cg_ch6size
import cg_ch6
import cg_ch5size
import cg_ch5
import cg_ch4size
import cg_ch4
import cg_ch3size
import cg_ch3
import cg_ch2size
import cg_ch2
import cg_ch1size
import cg_ch1
import cg_differentCrosshairs
import cg_crosshairPulse
import cg_atmosphericLevel
import cg_fragmsgsize
import cg_autovertex
import cg_vote_custom_commands
import cg_cyclegrapple
import cg_voteflags
import cg_voip_teamonly
import cg_hitsound
import cg_alwaysWeaponBar
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_delag
import cg_enableBreath
import cg_enableDust
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_music
import cg_trueLightning
import cg_oldPlasma
import cg_cameraEyes_Up
import cg_cameraEyes_Fwd
import cg_cameraEyes
import cg_cameramode
import cg_leiBrassNoise
import cg_leiGoreNoise
import cg_leiEnhancement
import cg_lodScale
import cg_letterBoxSize
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_float
import pmove_msec
import pmove_fixed
import cg_commonConsole
import cg_teamChatLines
import cg_chatLines
import cg_commonConsoleLines
import cg_consoleLines
import cg_teamChatSizeY
import cg_teamChatSizeX
import cg_chatSizeY
import cg_chatSizeX
import cg_consoleSizeY
import cg_consoleSizeX
import cg_fontShadow
import cg_fontScale
import cg_consoleTime
import cg_chatTime
import cg_newConsole
import cg_newFont
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_stats
import cg_teamChatScaleY
import cg_teamChatScaleX
import cg_chatY
import cg_teamChatY
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPersonOffset
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_bigheadMode
import cg_disableLevelStartFade
import cg_paintballMode
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairScale
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_drawSyncMessage
import cg_drawsubtitles
import cg_centertime
import cg_gibtime
import cg_itemstyle
import cg_oldscoreboard
import team_legsskin
import legsskin
import ui_backcolors
import cl_screenoffset
import cg_cameraeyes
import cg_leiChibi
import cg_plightradius
import cg_plightblue
import cg_plightgreen
import cg_plightred
import cg_tolightblue
import cg_tolightgreen
import cg_tolightred
import cg_hetex
import cg_totex
import cg_ptex
import cg_helightblue
import cg_helightgreen
import cg_helightred
import con_notifytime
import cl_language
import cg_toolguninfo
import cg_postprocess
import cg_hide255
import sb_texturename
import sb_texture_view
import sb_classnum_view
import toolgun_modelst
import toolgun_toolmode4
import toolgun_toolmode3
import toolgun_toolmode2
import toolgun_toolmode1
import toolgun_tooltip4
import toolgun_tooltip3
import toolgun_tooltip2
import toolgun_tooltip1
import toolgun_tooltext
import toolgun_toolcmd4
import toolgun_toolcmd3
import toolgun_toolcmd2
import toolgun_toolcmd1
import toolgun_tool
import toolgun_mod19
import toolgun_mod18
import toolgun_mod17
import toolgun_mod16
import toolgun_mod15
import toolgun_mod14
import toolgun_mod13
import toolgun_mod12
import toolgun_mod11
import toolgun_mod10
import toolgun_mod9
import toolgun_mod8
import toolgun_mod7
import toolgun_mod6
import toolgun_mod5
import toolgun_mod4
import toolgun_mod3
import toolgun_mod2
import toolgun_mod1
import cg_weaponBarActiveWidth
import cg_weaponselecttime
import cg_itemscaletime
import cg_zoomtime
import cg_gibmodifier
import cg_gibvelocity
import cg_gibjump
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
import g_gametype
import mod_skyColorA
import mod_skyColorB
import mod_skyColorG
import mod_skyColorR
import mod_skyShader
import mod_fogColorA
import mod_fogColorB
import mod_fogColorG
import mod_fogColorR
import mod_fogInterval
import mod_fogDistance
import mod_fogShader
import mod_fogModel
import mod_zround
import mod_gravity
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_ammolimit
import mod_noplayerclip
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_amdelay
import mod_ftdelay
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgdelay
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_sgspread
import mod_sgcount
import mod_lgrange
import mod_cgspread
import mod_mgspread
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $1267
byte 1 99
byte 1 103
byte 1 46
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1262
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $1261
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $954
byte 1 102
byte 1 50
byte 1 0
align 1
LABELV $953
byte 1 97
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $951
byte 1 97
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $949
byte 1 97
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $948
byte 1 111
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $946
byte 1 111
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $944
byte 1 111
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $941
byte 1 102
byte 1 49
byte 1 0
align 1
LABELV $940
byte 1 97
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $938
byte 1 97
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $936
byte 1 97
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $935
byte 1 111
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $933
byte 1 111
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $931
byte 1 111
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $930
byte 1 119
byte 1 0
align 1
LABELV $929
byte 1 116
byte 1 0
align 1
LABELV $928
byte 1 109
byte 1 0
align 1
LABELV $754
byte 1 97
byte 1 108
byte 1 116
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $384
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 121
byte 1 116
byte 1 101
byte 1 120
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $381
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 103
byte 1 49
byte 1 0
align 1
LABELV $271
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 103
byte 1 116
byte 1 101
byte 1 120
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $268
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 103
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $238
byte 1 49
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $234
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $233
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $159
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $142
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 10
byte 1 0
