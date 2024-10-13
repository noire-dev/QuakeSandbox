export BG_CanAlloc
code
proc BG_CanAlloc 8 0
file "../../../code/game/bg_alloc.c"
line 53
;1://KK-OAX
;2:/*
;3:===========================================================================
;4:Copyright (C) 1999-2005 Id Software, Inc.
;5:Copyright (C) 2000-2006 Tim Angus
;6:
;7:This file is part of the Open Arena source code.
;8:Copied from Tremulous under GPL version 2 including any later version.
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
;25:
;26:#include "../qcommon/q_shared.h"
;27:#include "bg_public.h"
;28:#include "g_local.h"
;29:
;30:#ifdef GAME
;31:# define  POOLSIZE ( 1024 * 1024 ) * 8
;32:#else
;33:# define  POOLSIZE ( 1024 * 1024 ) * 8
;34:#endif
;35:
;36:#define  FREEMEMCOOKIE  ((int)0xDEADBE3F)  // Any unlikely to be used value
;37:#define  ROUNDBITS    (unsigned int)31          // Round to 32 bytes
;38:
;39:typedef struct freeMemNode_s
;40:{
;41:  // Size of ROUNDBITS
;42:  int cookie, size;        // Size includes node (obviously)
;43:  struct freeMemNode_s *prev, *next;
;44:} freeMemNode_t;
;45:
;46:static char           memoryPool[POOLSIZE];
;47:static freeMemNode_t  *freeHead;
;48:static int            freeMem;
;49:
;50:/*
;51: * Returns qtrue if BG_Alloc will succeed, qfalse otherwise
;52: */
;53:qboolean BG_CanAlloc( unsigned int size) {
line 55
;54:    freeMemNode_t *fmn;
;55:    int allocsize = ( size + sizeof(int) + ROUNDBITS ) & ~ROUNDBITS;    // Round to 32-byte boundary
ADDRLP4 4
ADDRFP4 0
INDIRU4
CNSTU4 4
ADDU4
CNSTU4 31
ADDU4
CNSTU4 4294967264
BANDU4
CVUI4 4
ASGNI4
line 56
;56:    for( fmn = freeHead; fmn; fmn = fmn->next ) {
ADDRLP4 0
ADDRGP4 freeHead
INDIRP4
ASGNP4
ADDRGP4 $68
JUMPV
LABELV $65
line 57
;57:        if( fmn->cookie != FREEMEMCOOKIE ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $69
line 59
;58:            //Memory curroption
;59:            return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $69
line 61
;60:        }
;61:        if( fmn->size >= allocsize ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $71
line 63
;62:            //At least one useable block
;63:            return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $64
JUMPV
LABELV $71
line 65
;64:        }
;65:    }
LABELV $66
line 56
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $68
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $65
line 66
;66:    return qfalse;
CNSTI4 0
RETI4
LABELV $64
endproc BG_CanAlloc 8 0
export BG_Alloc
proc BG_Alloc 48 12
line 69
;67:}
;68:
;69:void *BG_Alloc( unsigned int size ) {
line 78
;70:  // Find a free block and allocate.
;71:  // Does two passes, attempts to fill same-sized free slot first.
;72:
;73:  freeMemNode_t *fmn, *prev, *next, *smallest;
;74:  int allocsize, smallestsize;
;75:  char *endptr;
;76:  int *ptr;
;77:  int usedMem;
;78:  usedMem = POOLSIZE - freeMem;
ADDRLP4 28
CNSTI4 8388608
ADDRGP4 freeMem
INDIRI4
SUBI4
ASGNI4
line 80
;79:
;80:  allocsize = ( size + sizeof(int) + ROUNDBITS ) & ~ROUNDBITS;    // Round to 32-byte boundary
ADDRLP4 4
ADDRFP4 0
INDIRU4
CNSTU4 4
ADDU4
CNSTU4 31
ADDU4
CNSTU4 4294967264
BANDU4
CVUI4 4
ASGNI4
line 81
;81:  ptr = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 83
;82:
;83:  smallest = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 84
;84:  smallestsize = POOLSIZE + 1;    // Guaranteed not to miss any slots :)
ADDRLP4 24
CNSTI4 8388609
ASGNI4
line 85
;85:  for( fmn = freeHead; fmn; fmn = fmn->next ) {
ADDRLP4 0
ADDRGP4 freeHead
INDIRP4
ASGNP4
ADDRGP4 $77
JUMPV
LABELV $74
line 86
;86:    if( fmn->cookie != FREEMEMCOOKIE )
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $78
line 87
;87:      Com_Error( ERR_DROP, "BG_Alloc: Memory corruption detected!\n" );
CNSTI4 1
ARGI4
ADDRGP4 $80
ARGP4
ADDRGP4 Com_Error
CALLV
pop
LABELV $78
line 89
;88:
;89:    if( fmn->size >= allocsize ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $81
line 91
;90:      // We've got a block
;91:      if( fmn->size == allocsize ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $83
line 94
;92:        // Same size, just remove
;93:
;94:        prev = fmn->prev;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
line 95
;95:        next = fmn->next;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 96
;96:        if( prev )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $85
line 97
;97:          prev->next = next;      // Point previous node to next
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $85
line 98
;98:        if( next )
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $87
line 99
;99:          next->prev = prev;      // Point next node to previous
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $87
line 100
;100:        if( fmn == freeHead )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 freeHead
INDIRP4
CVPU4 4
NEU4 $89
line 101
;101:          freeHead = next;      // Set head pointer to next
ADDRGP4 freeHead
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $89
line 102
;102:        ptr = (int *) fmn;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 103
;103:        break;              // Stop the loop, this is fine
ADDRGP4 $76
JUMPV
LABELV $83
line 104
;104:      } else {
line 106
;105:        // Keep track of the smallest free slot
;106:        if( fmn->size < smallestsize ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $91
line 107
;107:          smallest = fmn;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 108
;108:          smallestsize = fmn->size;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 109
;109:        }
LABELV $91
line 110
;110:      }
line 111
;111:    }
LABELV $81
line 112
;112:  }
LABELV $75
line 85
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $77
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $74
LABELV $76
line 114
;113:
;114:  if( !ptr && smallest ) {
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
NEU4 $93
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $93
line 116
;115:    // We found a slot big enough
;116:    smallest->size -= allocsize;
ADDRLP4 40
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 117
;117:    endptr = (char *) smallest + smallest->size;
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 118
;118:    ptr = (int *) endptr;
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 119
;119:  }
LABELV $93
line 121
;120:
;121:  if( ptr ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $95
line 122
;122:    freeMem -= allocsize;
ADDRLP4 40
ADDRGP4 freeMem
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 123
;123:    memset( ptr, 0, allocsize );
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 124
;124:    *ptr++ = allocsize;        // Store a copy of size for deallocation
ADDRLP4 44
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 125
;125:    return( (void *) ptr );
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $73
JUMPV
LABELV $95
line 128
;126:  }
;127:
;128:	G_Printf( "BG_Alloc: failed on allocation of %i bytes\n", usedMem, POOLSIZE );
ADDRGP4 $97
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 8388608
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 129
;129:  return( NULL );
CNSTP4 0
RETP4
LABELV $73
endproc BG_Alloc 48 12
export BG_Free
proc BG_Free 24 0
line 132
;130:}
;131:
;132:void BG_Free( void *ptr ) {
line 139
;133:  // Release allocated memory, add it to the free list.
;134:
;135:  freeMemNode_t *fmn;
;136:  char *freeend;
;137:  int *freeptr;
;138:
;139:  freeptr = ptr;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 140
;140:  freeptr--;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 -4
ADDP4
ASGNP4
line 142
;141:
;142:  freeMem += *freeptr;
ADDRLP4 12
ADDRGP4 freeMem
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 144
;143:
;144:  for( fmn = freeHead; fmn; fmn = fmn->next ) {
ADDRLP4 0
ADDRGP4 freeHead
INDIRP4
ASGNP4
ADDRGP4 $102
JUMPV
LABELV $99
line 145
;145:    freeend = ((char *) fmn) + fmn->size;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 146
;146:    if( freeend == (char *) freeptr ) {
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $103
line 149
;147:      // Released block can be merged to an existing node
;148:
;149:      fmn->size += *freeptr;    // Add size of node.
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
ADDI4
ASGNI4
line 150
;150:      return;
ADDRGP4 $98
JUMPV
LABELV $103
line 152
;151:    }
;152:  }
LABELV $100
line 144
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $102
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $99
line 155
;153:  // No merging, add to head of list
;154:
;155:  fmn = (freeMemNode_t *) freeptr;
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 156
;156:  fmn->size = *freeptr;        // Set this first to avoid corrupting *freeptr
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
line 157
;157:  fmn->cookie = FREEMEMCOOKIE;
ADDRLP4 0
INDIRP4
CNSTU4 3735928383
CVUI4 4
ASGNI4
line 158
;158:  fmn->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTP4 0
ASGNP4
line 159
;159:  fmn->next = freeHead;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 freeHead
INDIRP4
ASGNP4
line 160
;160:  freeHead->prev = fmn;
ADDRGP4 freeHead
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 161
;161:  freeHead = fmn;
ADDRGP4 freeHead
ADDRLP4 0
INDIRP4
ASGNP4
line 162
;162:}
LABELV $98
endproc BG_Free 24 0
export BG_InitMemory
proc BG_InitMemory 0 0
line 164
;163:
;164:void BG_InitMemory( void ) {
line 167
;165:  // Set up the initial node
;166:
;167:  freeHead = (freeMemNode_t *)memoryPool;
ADDRGP4 freeHead
ADDRGP4 memoryPool
ASGNP4
line 168
;168:  freeHead->cookie = FREEMEMCOOKIE;
ADDRGP4 freeHead
INDIRP4
CNSTU4 3735928383
CVUI4 4
ASGNI4
line 169
;169:  freeHead->size = POOLSIZE;
ADDRGP4 freeHead
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8388608
ASGNI4
line 170
;170:  freeHead->next = NULL;
ADDRGP4 freeHead
INDIRP4
CNSTI4 12
ADDP4
CNSTP4 0
ASGNP4
line 171
;171:  freeHead->prev = NULL;
ADDRGP4 freeHead
INDIRP4
CNSTI4 8
ADDP4
CNSTP4 0
ASGNP4
line 172
;172:  freeMem = sizeof( memoryPool );
ADDRGP4 freeMem
CNSTI4 8388608
ASGNI4
line 173
;173:}
LABELV $105
endproc BG_InitMemory 0 0
export BG_DefragmentMemory
proc BG_DefragmentMemory 36 12
line 175
;174:
;175:void BG_DefragmentMemory( void ) {
line 182
;176:  // If there's a frenzy of deallocation and we want to
;177:  // allocate something big, this is useful. Otherwise...
;178:  // not much use.
;179:
;180:  freeMemNode_t *startfmn, *endfmn, *fmn;
;181:
;182:  for( startfmn = freeHead; startfmn; ) {
ADDRLP4 8
ADDRGP4 freeHead
INDIRP4
ASGNP4
ADDRGP4 $110
JUMPV
LABELV $107
line 183
;183:    endfmn = (freeMemNode_t *)(((char *) startfmn) + startfmn->size);
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
line 184
;184:    for( fmn = freeHead; fmn; ) {
ADDRLP4 0
ADDRGP4 freeHead
INDIRP4
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $111
line 185
;185:      if( fmn->cookie != FREEMEMCOOKIE )
ADDRLP4 0
INDIRP4
INDIRI4
CNSTU4 3735928383
CVUI4 4
EQI4 $115
line 186
;186:        Com_Error( ERR_DROP, "BG_DefragmentMemory: Memory corruption detected!\n" );
CNSTI4 1
ARGI4
ADDRGP4 $117
ARGP4
ADDRGP4 Com_Error
CALLV
pop
LABELV $115
line 188
;187:
;188:      if( fmn == endfmn ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $118
line 191
;189:        // We can add fmn onto startfmn.
;190:
;191:        if( fmn->prev )
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $120
line 192
;192:          fmn->prev->next = fmn->next;
ADDRLP4 20
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
LABELV $120
line 193
;193:        if( fmn->next ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
line 194
;194:          if( !(fmn->next->prev = fmn->prev) )
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $124
line 195
;195:            freeHead = fmn->next;  // We're removing the head node
ADDRGP4 freeHead
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $124
line 196
;196:        }
LABELV $122
line 197
;197:        startfmn->size += fmn->size;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 198
;198:        memset( fmn, 0, sizeof(freeMemNode_t) );  // A redundant call, really.
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 memset
CALLP4
pop
line 200
;199:
;200:        startfmn = freeHead;
ADDRLP4 8
ADDRGP4 freeHead
INDIRP4
ASGNP4
line 201
;201:        endfmn = fmn = NULL;        // Break out of current loop
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 202
;202:      }
ADDRGP4 $119
JUMPV
LABELV $118
line 204
;203:      else
;204:        fmn = fmn->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $119
line 205
;205:    }
LABELV $112
line 184
LABELV $114
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 207
;206:
;207:    if( endfmn )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
line 208
;208:      startfmn = startfmn->next;    // endfmn acts as a 'restart' flag here
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
LABELV $126
line 209
;209:  }
LABELV $108
line 182
LABELV $110
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
line 210
;210:}
LABELV $106
endproc BG_DefragmentMemory 36 12
export Svcmd_GameMem_f
proc Svcmd_GameMem_f 4 12
line 213
;211:
;212://KK-OAX This was moved from g_mem.c to keep functionality from being broken. 
;213:void Svcmd_GameMem_f( void ) {
line 216
;214:
;215:    int usedMem;
;216:    usedMem = POOLSIZE - freeMem;
ADDRLP4 0
CNSTI4 8388608
ADDRGP4 freeMem
INDIRI4
SUBI4
ASGNI4
line 217
;217:	G_Printf( "Game memory status: %i out of %i bytes allocated\n", usedMem, POOLSIZE );
ADDRGP4 $129
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8388608
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 218
;218:}
LABELV $128
endproc Svcmd_GameMem_f 4 12
bss
align 4
LABELV freeMem
skip 4
align 4
LABELV freeHead
skip 4
align 1
LABELV memoryPool
skip 8388608
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
LABELV $129
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $117
byte 1 66
byte 1 71
byte 1 95
byte 1 68
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $97
byte 1 66
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $80
byte 1 66
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
