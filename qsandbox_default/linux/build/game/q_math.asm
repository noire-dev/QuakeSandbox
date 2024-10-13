code
proc VectorCompare 16 0
file "../../../code/qcommon/q_shared.h"
line 531
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
;23:#ifndef __Q_SHARED_H
;24:#define __Q_SHARED_H
;25:
;26:// q_shared.h -- included first by ALL program modules.
;27:// A user mod should never modify this file
;28:
;29:#define PRODUCT_NAME			"quakesandbox"
;30:#define BASEGAME				"milab"
;31:#define CLIENT_WINDOW_TITLE     	"MiTech: Engine"
;32:#define CLIENT_WINDOW_MIN_TITLE 	"MiTech: Engine"
;33:
;34:
;35:#ifdef _MSC_VER
;36:  #define PRODUCT_VERSION "1.35"
;37:#endif
;38:
;39:#define Q3_VERSION PRODUCT_NAME " " PRODUCT_VERSION
;40:
;41:#define MAX_TEAMNAME 32
;42:
;43:#ifdef _MSC_VER
;44:
;45:#pragma warning(disable : 4018)     // signed/unsigned mismatch
;46:#pragma warning(disable : 4032)
;47:#pragma warning(disable : 4051)
;48:#pragma warning(disable : 4057)		// slightly different base types
;49:#pragma warning(disable : 4100)		// unreferenced formal parameter
;50:#pragma warning(disable : 4115)
;51:#pragma warning(disable : 4125)		// decimal digit terminates octal escape sequence
;52:#pragma warning(disable : 4127)		// conditional expression is constant
;53:#pragma warning(disable : 4136)
;54:#pragma warning(disable : 4152)		// nonstandard extension, function/data pointer conversion in expression
;55://#pragma warning(disable : 4201)
;56://#pragma warning(disable : 4214)
;57:#pragma warning(disable : 4244)
;58:#pragma warning(disable : 4142)		// benign redefinition
;59://#pragma warning(disable : 4305)		// truncation from const double to float
;60://#pragma warning(disable : 4310)		// cast truncates constant value
;61://#pragma warning(disable:  4505) 	// unreferenced local function has been removed
;62:#pragma warning(disable : 4514)
;63:#pragma warning(disable : 4702)		// unreachable code
;64:#pragma warning(disable : 4711)		// selected for automatic inline expansion
;65:#pragma warning(disable : 4220)		// varargs matches remaining parameters
;66://#pragma intrinsic( memset, memcpy )
;67:#endif
;68:
;69://Ignore __attribute__ on non-gcc platforms
;70:#ifndef __GNUC__
;71:#ifndef __attribute__
;72:#define __attribute__(x)
;73:#endif
;74:#endif
;75:
;76:#if (defined _MSC_VER)
;77:#define Q_EXPORT __declspec(dllexport)
;78:#elif (defined __SUNPRO_C)
;79:#define Q_EXPORT __global
;80:#elif ((__GNUC__ >= 3) && (!__EMX__) && (!sun))
;81:#define Q_EXPORT __attribute__((visibility("default")))
;82:#else
;83:#define Q_EXPORT
;84:#endif
;85:
;86:
;87:/**********************************************************************
;88:  VM Considerations
;89:
;90:  The VM can not use the standard system headers because we aren't really
;91:  using the compiler they were meant for.  We use bg_lib.h which contains
;92:  prototypes for the functions we define for our own use in bg_lib.c.
;93:
;94:  When writing mods, please add needed headers HERE, do not start including
;95:  stuff like <stdio.h> in the various .c files that make up each of the VMs
;96:  since you will be including system headers files can will have issues.
;97:
;98:  Remember, if you use a C library function that is not defined in bg_lib.c,
;99:  you will have to add your own version for support in the VM.
;100:
;101: **********************************************************************/
;102:
;103:#ifdef Q3_VM
;104:
;105:#include "../game/bg_lib.h"
;106:
;107:typedef int intptr_t;
;108:
;109:#else
;110:
;111:#include <assert.h>
;112:#include <math.h>
;113:#include <stdio.h>
;114:#include <stdarg.h>
;115:#include <string.h>
;116:#include <stdlib.h>
;117:#include <time.h>
;118:#include <ctype.h>
;119:#include <limits.h>
;120:
;121:// vsnprintf is ISO/IEC 9899:1999
;122:// abstracting this to make it portable
;123:#ifdef _WIN32
;124:  #define Q_vsnprintf _vsnprintf
;125:  #define Q_snprintf _snprintf
;126:#else
;127:  #define Q_vsnprintf vsnprintf
;128:  #define Q_snprintf snprintf
;129:#endif
;130:
;131:#ifdef _MSC_VER
;132:  #include <io.h>
;133:
;134:  typedef __int64 int64_t;
;135:  typedef __int32 int32_t;
;136:  typedef __int16 int16_t;
;137:  typedef __int8 int8_t;
;138:  typedef unsigned __int64 uint64_t;
;139:  typedef unsigned __int32 uint32_t;
;140:  typedef unsigned __int16 uint16_t;
;141:  typedef unsigned __int8 uint8_t;
;142:#else
;143:  #include <stdint.h>
;144:#endif
;145:
;146:#endif
;147:
;148:
;149:#include "q_platform.h"
;150:
;151://=============================================================
;152:
;153:typedef unsigned char 		byte;
;154:
;155:typedef enum {qfalse, qtrue}	qboolean;
;156:
;157:typedef union {
;158:	float f;
;159:	int i;
;160:	unsigned int ui;
;161:} floatint_t;
;162:
;163:typedef int		qhandle_t;
;164:typedef int		sfxHandle_t;
;165:typedef int		fileHandle_t;
;166:typedef int		clipHandle_t;
;167:
;168:#define PAD(x,y) (((x)+(y)-1) & ~((y)-1))
;169:
;170:#ifdef __GNUC__
;171:#define ALIGN(x) __attribute__((aligned(x)))
;172:#else
;173:#define ALIGN(x)
;174:#endif
;175:
;176:#ifndef NULL
;177:#define NULL ((void *)0)
;178:#endif
;179:
;180:#define	MAX_QINT			0x7fffffff
;181:#define	MIN_QINT			(-MAX_QINT-1)
;182:
;183:#define ARRAY_LEN(x)			(sizeof(x) / sizeof(*(x)))
;184:#define STRARRAY_LEN(x)			(ARRAY_LEN(x) - 1)
;185:
;186:// angle indexes
;187:#define	PITCH				0		// up / down
;188:#define	YAW					1		// left / right
;189:#define	ROLL				2		// fall over
;190:
;191:// the game guarantees that no string from the network will ever
;192:// exceed MAX_STRING_CHARS
;193:#define	MAX_STRING_CHARS	1024	// max length of a string passed to Cmd_TokenizeString
;194:#define	MAX_STRING_TOKENS	1024	// max tokens resulting from Cmd_TokenizeString
;195:#define	MAX_TOKEN_CHARS		1024	// max length of an individual token
;196:
;197:#define	MAX_INFO_STRING		1024
;198:#define	MAX_INFO_KEY		  1024
;199:#define	MAX_INFO_VALUE		1024
;200:
;201:#define	BIG_INFO_STRING		8192  // used for system info key only
;202:#define	BIG_INFO_KEY		  8192
;203:#define	BIG_INFO_VALUE		8192
;204:
;205:
;206:#define	MAX_QPATH			64		// max length of a quake game pathname
;207:#ifdef PATH_MAX
;208:#define MAX_OSPATH			PATH_MAX
;209:#else
;210:#define	MAX_OSPATH			256		// max length of a filesystem pathname
;211:#endif
;212:
;213:#define	MAX_NAME_LENGTH		32		// max length of a client name
;214:
;215:#define	MAX_SAY_TEXT	150
;216:
;217:// paramters for command buffer stuffing
;218:typedef enum {
;219:	EXEC_NOW,			// don't return until completed, a VM should NEVER use this,
;220:						// because some commands might cause the VM to be unloaded...
;221:	EXEC_INSERT,		// insert at current position, but don't run yet
;222:	EXEC_APPEND			// add to end of the command buffer (normal case)
;223:} cbufExec_t;
;224:
;225:
;226://
;227:// these aren't needed by any of the VMs.  put in another header?
;228://
;229:#define	MAX_MAP_AREA_BYTES		32		// bit vector of area visibility
;230:
;231:
;232:// print levels from renderer (FIXME: set up for game / cgame?)
;233:typedef enum {
;234:	PRINT_ALL,
;235:	PRINT_DEVELOPER,		// only print when "developer 1"
;236:	PRINT_WARNING,
;237:	PRINT_ERROR
;238:} printParm_t;
;239:
;240:
;241:#ifdef ERR_FATAL
;242:#undef ERR_FATAL			// this is be defined in malloc.h
;243:#endif
;244:
;245:// parameters to the main Error routine
;246:typedef enum {
;247:	ERR_FATAL,					// exit the entire game with a popup window
;248:	ERR_DROP,					// print to console and disconnect from game
;249:	ERR_SERVERDISCONNECT,		// don't kill server
;250:	ERR_DISCONNECT,				// client disconnected from the server
;251:	ERR_NEED_CD					// pop up the need-cd dialog
;252:} errorParm_t;
;253:
;254:
;255:// font rendering values used by ui and cgame
;256:
;257:#define PROP_GAP_WIDTH			cl_propgapwidth.integer
;258:#define PROP_SPACE_WIDTH		8
;259:#define PROP_HEIGHT				cl_propheight.integer
;260:#define PROP_SMALL_SIZE_SCALE	cl_propsmallsizescale.value
;261:
;262:#define BLINK_DIVISOR			200
;263:#define PULSE_DIVISOR			60
;264:
;265:#define UI_LEFT			0x00000000	// default
;266:#define UI_CENTER		0x00000001
;267:#define UI_RIGHT		0x00000002
;268:#define UI_FORMATMASK	0x00000007
;269:#define UI_SMALLFONT	0x00000010
;270:#define UI_BIGFONT		0x00000020	// default
;271:#define UI_GIANTFONT	0x00000040
;272:#define UI_DROPSHADOW	0x00000800
;273:#define UI_BLINK		0x00001000
;274:#define UI_INVERSE		0x00002000
;275:#define UI_PULSE		0x00004000
;276:#define UI_SCROLL		0x00008000
;277:#define UI_RUSSIAN		0x00016000
;278:#define UI_TINYFONT		0x00020000
;279:
;280:#if defined(_DEBUG) && !defined(BSPC)
;281:	#define HUNK_DEBUG
;282:#endif
;283:
;284:typedef enum {
;285:	h_high,
;286:	h_low,
;287:	h_dontcare
;288:} ha_pref;
;289:
;290:#ifdef HUNK_DEBUG
;291:#define Hunk_Alloc( size, preference )				Hunk_AllocDebug(size, preference, #size, __FILE__, __LINE__)
;292:void *Hunk_AllocDebug( int size, ha_pref preference, char *label, char *file, int line );
;293:#else
;294:void *Hunk_Alloc( int size, ha_pref preference );
;295:#endif
;296:
;297:#define Com_Memset memset
;298:#define Com_Memcpy memcpy
;299:
;300:#define CIN_system	1
;301:#define CIN_loop	2
;302:#define	CIN_hold	4
;303:#define CIN_silent	8
;304:#define CIN_shader	16
;305:
;306:/*
;307:==============================================================
;308:
;309:MATHLIB
;310:
;311:==============================================================
;312:*/
;313:
;314:
;315:typedef float vec_t;
;316:typedef vec_t vec2_t[2];
;317:typedef vec_t vec3_t[3];
;318:typedef vec_t vec4_t[4];
;319:typedef vec_t vec5_t[5];
;320:
;321:typedef	int	fixed4_t;
;322:typedef	int	fixed8_t;
;323:typedef	int	fixed16_t;
;324:
;325:#ifndef M_PI
;326:#define M_PI		3.14159265358979323846f	// matches value in gcc v2 math.h
;327:#endif
;328:
;329:// STONELANCE - pi / 2
;330:#ifndef M_PI_2
;331:#define M_PI_2		1.57079632679489661923f
;332:#endif
;333:
;334:// pi / 180
;335:#ifndef M_PI_180
;336:#define M_PI_180	0.017453292519943295769236907684886f
;337:#endif
;338:
;339:// 180 / pi
;340:#ifndef M_180_PI
;341:#define M_180_PI	57.295779513082320876798154814105f
;342:#endif
;343:// END
;344:
;345:#define NUMVERTEXNORMALS	162
;346:extern	vec3_t	bytedirs[NUMVERTEXNORMALS];
;347:
;348:// all drawing is done to a 640*480 virtual screen size
;349:// and will be automatically scaled to the real resolution
;350:#define	SCREEN_WIDTH		640
;351:#define	SCREEN_HEIGHT		480
;352:
;353:#define TINYCHAR_WIDTH		(cl_smallcharwidth.integer/2)
;354:#define TINYCHAR_HEIGHT		(cl_smallcharheight.integer/2)
;355:
;356:#define SMALLCHAR_WIDTH		cl_smallcharwidth.integer
;357:#define SMALLCHAR_HEIGHT	cl_smallcharheight.integer
;358:
;359:#define BIGCHAR_WIDTH		cl_bigcharwidth.integer
;360:#define BIGCHAR_HEIGHT		cl_bigcharheight.integer
;361:
;362:#define	GIANTCHAR_WIDTH		cl_giantcharwidth.integer
;363:#define	GIANTCHAR_HEIGHT	cl_giantcharheight.integer
;364:
;365:extern	vec4_t		colorBlack;
;366:extern	vec4_t		colorRed;
;367:extern	vec4_t		colorGreen;
;368:extern	vec4_t		colorBlue;
;369:extern	vec4_t		colorYellow;
;370:extern	vec4_t		colorMagenta;
;371:extern	vec4_t		colorCyan;
;372:extern	vec4_t		colorWhite;
;373:extern	vec4_t		colorLtGrey;
;374:extern	vec4_t		colorMdGrey;
;375:extern	vec4_t		colorDkGrey;
;376:
;377:#define Q_COLOR_ESCAPE	'^'
;378:#define Q_IsColorString(p)      ((p) && *(p) == Q_COLOR_ESCAPE && *((p)+1) && *((p)+1) >= '0' && *((p)+1) <= '9') // ^[0-9]
;379:#define COLOR_BLACK		'0'
;380:#define COLOR_RED		'1'
;381:#define COLOR_GREEN		'2'
;382:#define COLOR_YELLOW	'3'
;383:#define COLOR_BLUE		'4'
;384:#define COLOR_CYAN		'5'
;385:#define COLOR_MAGENTA	'6'
;386:#define COLOR_WHITE		'7'
;387:#define COLOR_MENU      '8'
;388:#define ColorIndex(c)   ((c) - '0')
;389:
;390:#define S_COLOR_BLACK	"^0"
;391:#define S_COLOR_RED		"^1"
;392:#define S_COLOR_GREEN	"^2"
;393:#define S_COLOR_YELLOW	"^3"
;394:#define S_COLOR_BLUE	"^4"
;395:#define S_COLOR_CYAN	"^5"
;396:#define S_COLOR_MAGENTA	"^6"
;397:#define S_COLOR_WHITE	"^7"
;398:#define S_COLOR_MENU	"^8"
;399:
;400:extern vec4_t	g_color_table[9];
;401:
;402:#define	MAKERGB( v, r, g, b ) v[0]=r;v[1]=g;v[2]=b
;403:#define	MAKERGBA( v, r, g, b, a ) v[0]=r;v[1]=g;v[2]=b;v[3]=a
;404:
;405:#define DEG2RAD( a ) ( ( (a) * M_PI ) / 180.0F )
;406:#define RAD2DEG( a ) ( ( (a) * 180.0f ) / M_PI )
;407:
;408:struct cplane_s;
;409:
;410:extern	vec3_t	vec3_origin;
;411:extern	vec3_t	axisDefault[3];
;412:
;413:#define	nanmask (255<<23)
;414:
;415:#define	IS_NAN(x) (((*(int *)&x)&nanmask)==nanmask)
;416:
;417:#if idppc
;418:
;419:static ID_INLINE float Q_rsqrt( float number ) {
;420:		float x = 0.5f * number;
;421:                float y;
;422:#ifdef __GNUC__
;423:                asm("frsqrte %0,%1" : "=f" (y) : "f" (number));
;424:#else
;425:		y = __frsqrte( number );
;426:#endif
;427:		return y * (1.5f - (x * y * y));
;428:	}
;429:
;430:#ifdef __GNUC__
;431:static ID_INLINE float Q_fabs(float x) {
;432:    float abs_x;
;433:
;434:    asm("fabs %0,%1" : "=f" (abs_x) : "f" (x));
;435:    return abs_x;
;436:}
;437:#else
;438:#define Q_fabs __fabsf
;439:#endif
;440:
;441:#else
;442:float Q_fabs( float f );
;443:float Q_rsqrt( float f );		// reciprocal square root
;444:#endif
;445:
;446:#define SQRTFAST( x ) ( (x) * Q_rsqrt( x ) )
;447:
;448:signed char ClampChar( int i );
;449:signed short ClampShort( int i );
;450:
;451:// this isn't a real cheap function to call!
;452:int DirToByte( vec3_t dir );
;453:void ByteToDir( int b, vec3_t dir );
;454:
;455:#if	1
;456:
;457:#define DotProduct(x,y)			((x)[0]*(y)[0]+(x)[1]*(y)[1]+(x)[2]*(y)[2])
;458:#define VectorSubtract(a,b,c)	((c)[0]=(a)[0]-(b)[0],(c)[1]=(a)[1]-(b)[1],(c)[2]=(a)[2]-(b)[2])
;459:#define Vector4Subtract(a,b,c)	((c)[0]=(a)[0]-(b)[0],(c)[1]=(a)[1]-(b)[1],(c)[2]=(a)[2]-(b)[2],(c)[3]=(a)[3]-(b)[3])
;460:#define VectorAdd(a,b,c)		((c)[0]=(a)[0]+(b)[0],(c)[1]=(a)[1]+(b)[1],(c)[2]=(a)[2]+(b)[2])
;461:#define Vector4Add(a,b,c)		((c)[0]=(a)[0]+(b)[0],(c)[1]=(a)[1]+(b)[1],(c)[2]=(a)[2]+(b)[2],(c)[3]=(a)[3]+(b)[3])
;462:#define VectorCopy(a,b)			((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
;463:#define	VectorScale(v, s, o)	((o)[0]=(v)[0]*(s),(o)[1]=(v)[1]*(s),(o)[2]=(v)[2]*(s))
;464:#define	VectorMA(v, s, b, o)	((o)[0]=(v)[0]+(b)[0]*(s),(o)[1]=(v)[1]+(b)[1]*(s),(o)[2]=(v)[2]+(b)[2]*(s))
;465:
;466:#else
;467:
;468:#define DotProduct(x,y)			_DotProduct(x,y)
;469:#define VectorSubtract(a,b,c)	_VectorSubtract(a,b,c)
;470:#define VectorAdd(a,b,c)		_VectorAdd(a,b,c)
;471:#define VectorCopy(a,b)			_VectorCopy(a,b)
;472:#define	VectorScale(v, s, o)	_VectorScale(v,s,o)
;473:#define	VectorMA(v, s, b, o)	_VectorMA(v,s,b,o)
;474:
;475:#endif
;476:
;477:#ifdef Q3_VM
;478:#ifdef VectorCopy
;479:#undef VectorCopy
;480:// this is a little hack to get more efficient copies in our interpreter
;481:typedef struct {
;482:	float	v[3];
;483:} vec3struct_t;
;484:#define VectorCopy(a,b)	(*(vec3struct_t *)b=*(vec3struct_t *)a)
;485:#endif
;486:#endif
;487:
;488:#define VectorClear(a)			((a)[0]=(a)[1]=(a)[2]=0)
;489:#define VectorNegate(a,b)		((b)[0]=-(a)[0],(b)[1]=-(a)[1],(b)[2]=-(a)[2])
;490:#define VectorSet(v, x, y, z)	((v)[0]=(x), (v)[1]=(y), (v)[2]=(z))
;491:#define Vector4Copy(a,b)		((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2],(b)[3]=(a)[3])
;492:
;493:#define Byte4Copy(a,b)			((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2],(b)[3]=(a)[3])
;494:
;495:#ifdef QAGAME
;496:#define CopyAlloc(dest, src) do {\
;497:    dest = BG_Alloc(sizeof(src)); \
;498:    if (dest != NULL) { \
;499:        strcpy(dest, src); \
;500:    } \
;501:} while(0)
;502:#endif
;503:#ifdef Q3_UI
;504:#define CopyAlloc(dest, src) do {\
;505:    dest = UI_Alloc(sizeof(src)); \
;506:    if (dest != NULL) { \
;507:        strcpy(dest, src); \
;508:    } \
;509:} while(0)
;510:#endif
;511:
;512:#define	SnapVector(v) {v[0]=((int)(v[0]));v[1]=((int)(v[1]));v[2]=((int)(v[2]));}
;513:// just in case you do't want to use the macros
;514:vec_t _DotProduct( const vec3_t v1, const vec3_t v2 );
;515:void _VectorSubtract( const vec3_t veca, const vec3_t vecb, vec3_t out );
;516:void _VectorAdd( const vec3_t veca, const vec3_t vecb, vec3_t out );
;517:void _VectorCopy( const vec3_t in, vec3_t out );
;518:void _VectorScale( const vec3_t in, float scale, vec3_t out );
;519:void _VectorMA( const vec3_t veca, float scale, const vec3_t vecb, vec3_t vecc );
;520:
;521:unsigned ColorBytes3 (float r, float g, float b);
;522:unsigned ColorBytes4 (float r, float g, float b, float a);
;523:
;524:float NormalizeColor( const vec3_t in, vec3_t out );
;525:
;526:float RadiusFromBounds( const vec3_t mins, const vec3_t maxs );
;527:void ClearBounds( vec3_t mins, vec3_t maxs );
;528:void AddPointToBounds( const vec3_t v, vec3_t mins, vec3_t maxs );
;529:
;530:#if !defined( Q3_VM ) || ( defined( Q3_VM ) && defined( __Q3_VM_MATH ) )
;531:static ID_INLINE int VectorCompare( const vec3_t v1, const vec3_t v2 ) {
line 532
;532:	if (v1[0] != v2[0] || v1[1] != v2[1] || v1[2] != v2[2]) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
NEF4 $12
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
NEF4 $12
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
EQF4 $9
LABELV $12
line 533
;533:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $8
JUMPV
LABELV $9
line 535
;534:	}
;535:	return 1;
CNSTI4 1
RETI4
LABELV $8
endproc VectorCompare 16 0
proc VectorLength 20 4
line 538
;536:}
;537:
;538:static ID_INLINE vec_t VectorLength( const vec3_t v ) {
line 539
;539:	return (vec_t)sqrt (v[0]*v[0] + v[1]*v[1] + v[2]*v[2]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 16
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
RETF4
LABELV $13
endproc VectorLength 20 4
proc VectorLengthSquared 16 0
line 542
;540:}
;541:
;542:static ID_INLINE vec_t VectorLengthSquared( const vec3_t v ) {
line 543
;543:	return (v[0]*v[0] + v[1]*v[1] + v[2]*v[2]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
RETF4
LABELV $14
endproc VectorLengthSquared 16 0
proc Distance 32 4
line 546
;544:}
;545:
;546:static ID_INLINE vec_t Distance( const vec3_t p1, const vec3_t p2 ) {
line 549
;547:	vec3_t	v;
;548:
;549:	VectorSubtract (p2, p1, v);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 550
;550:	return VectorLength( v );
ADDRLP4 0
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
RETF4
LABELV $15
endproc Distance 32 4
proc DistanceSquared 32 0
line 553
;551:}
;552:
;553:static ID_INLINE vec_t DistanceSquared( const vec3_t p1, const vec3_t p2 ) {
line 556
;554:	vec3_t	v;
;555:
;556:	VectorSubtract (p2, p1, v);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 557
;557:	return v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
RETF4
LABELV $18
endproc DistanceSquared 32 0
proc VectorNormalizeFast 36 4
line 563
;558:}
;559:
;560:// fast vector normalize routine that does not check to make sure
;561:// that length != 0, nor does it return length, uses rsqrt approximation
;562:static ID_INLINE void VectorNormalizeFast( vec3_t v )
;563:{
line 566
;564:	float ilength;
;565:
;566:	ilength = Q_rsqrt( DotProduct( v, v ) );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 20
ADDRGP4 Q_rsqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 568
;567:
;568:	v[0] *= ilength;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 569
;569:	v[1] *= ilength;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 570
;570:	v[2] *= ilength;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 571
;571:}
LABELV $25
endproc VectorNormalizeFast 36 4
proc VectorInverse 12 0
line 573
;572:
;573:static ID_INLINE void VectorInverse( vec3_t v ){
line 574
;574:	v[0] = -v[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 575
;575:	v[1] = -v[1];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 576
;576:	v[2] = -v[2];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 577
;577:}
LABELV $26
endproc VectorInverse 12 0
proc CrossProduct 40 0
line 579
;578:
;579:static ID_INLINE void CrossProduct( const vec3_t v1, const vec3_t v2, vec3_t cross ) {
line 580
;580:	cross[0] = v1[1]*v2[2] - v1[2]*v2[1];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 581
;581:	cross[1] = v1[2]*v2[0] - v1[0]*v2[2];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 8
ASGNI4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 582
;582:	cross[2] = v1[0]*v2[1] - v1[1]*v2[0];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 583
;583:}
LABELV $27
endproc CrossProduct 40 0
data
export vec3_origin
align 4
LABELV vec3_origin
byte 4 0
byte 4 0
byte 4 0
export axisDefault
align 4
LABELV axisDefault
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
export colorBlack
align 4
LABELV colorBlack
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
export colorRed
align 4
LABELV colorRed
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
export colorGreen
align 4
LABELV colorGreen
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1065353216
export colorBlue
align 4
LABELV colorBlue
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
export colorYellow
align 4
LABELV colorYellow
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
export colorMagenta
align 4
LABELV colorMagenta
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
export colorCyan
align 4
LABELV colorCyan
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export colorWhite
align 4
LABELV colorWhite
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export colorLtGrey
align 4
LABELV colorLtGrey
byte 4 1061158912
byte 4 1061158912
byte 4 1061158912
byte 4 1065353216
export colorMdGrey
align 4
LABELV colorMdGrey
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
export colorDkGrey
align 4
LABELV colorDkGrey
byte 4 1048576000
byte 4 1048576000
byte 4 1048576000
byte 4 1065353216
export g_color_table
align 4
LABELV g_color_table
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1054615798
byte 4 0
byte 4 1065353216
export bytedirs
align 4
LABELV bytedirs
byte 4 3204879951
byte 4 0
byte 4 1062847556
byte 4 3202531056
byte 4 1047828139
byte 4 1063074669
byte 4 3197577718
byte 4 0
byte 4 1064605338
byte 4 3198039930
byte 4 1056964608
byte 4 1062149053
byte 4 3190184938
byte 4 1049007711
byte 4 1064532072
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 1062847556
byte 4 1057396303
byte 4 3189189110
byte 4 1060597999
byte 4 1060013330
byte 4 1041705462
byte 4 1060597999
byte 4 1060013330
byte 4 0
byte 4 1057396303
byte 4 1062847556
byte 4 1050556282
byte 4 1056964608
byte 4 1062149053
byte 4 1057396303
byte 4 0
byte 4 1062847556
byte 4 1050094070
byte 4 0
byte 4 1064605338
byte 4 1055047408
byte 4 1047828139
byte 4 1063074669
byte 4 1042701290
byte 4 1049007711
byte 4 1064532072
byte 4 3207496978
byte 4 1041705462
byte 4 1060597999
byte 4 3209632701
byte 4 1050556282
byte 4 1056964608
byte 4 3205921044
byte 4 1054458931
byte 4 1060121929
byte 4 3210331204
byte 4 1057396303
byte 4 0
byte 4 3210558317
byte 4 1055047408
byte 4 1047828139
byte 4 3208081647
byte 4 1060013330
byte 4 1041705462
byte 4 3207605577
byte 4 1058437396
byte 4 1054458931
byte 4 3204448256
byte 4 1062149053
byte 4 1050556282
byte 4 3195311787
byte 4 1063074669
byte 4 1055047408
byte 4 3201942579
byte 4 1060121929
byte 4 1058437396
byte 4 3208081647
byte 4 1060013330
byte 4 3189189110
byte 4 3204448256
byte 4 1062149053
byte 4 3198039930
byte 4 3204879951
byte 4 1062847556
byte 4 0
byte 4 0
byte 4 1062847556
byte 4 3204879951
byte 4 3195311787
byte 4 1063074669
byte 4 3202531056
byte 4 0
byte 4 1064605338
byte 4 3197577718
byte 4 3196491359
byte 4 1064532072
byte 4 3190184938
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1064605338
byte 4 1050094070
byte 4 3196491359
byte 4 1064532072
byte 4 1042701290
byte 4 1047828139
byte 4 1063074669
byte 4 1055047408
byte 4 1049007711
byte 4 1064532072
byte 4 1042701290
byte 4 1056964608
byte 4 1062149053
byte 4 1050556282
byte 4 1047828139
byte 4 1063074669
byte 4 3202531056
byte 4 1049007711
byte 4 1064532072
byte 4 3190184938
byte 4 1056964608
byte 4 1062149053
byte 4 3198039930
byte 4 1062847556
byte 4 1057396303
byte 4 0
byte 4 1060597999
byte 4 1060013330
byte 4 1041705462
byte 4 1060597999
byte 4 1060013330
byte 4 3189189110
byte 4 1057396303
byte 4 1062847556
byte 4 0
byte 4 1054458931
byte 4 1060121929
byte 4 1058437396
byte 4 1063074669
byte 4 1055047408
byte 4 1047828139
byte 4 1060121929
byte 4 1058437396
byte 4 1054458931
byte 4 1062149053
byte 4 1050556282
byte 4 1056964608
byte 4 1060013330
byte 4 1041705462
byte 4 1060597999
byte 4 1058437396
byte 4 1054458931
byte 4 1060121929
byte 4 1064605338
byte 4 1050094070
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1064532072
byte 4 1042701290
byte 4 1049007711
byte 4 1062847556
byte 4 3204879951
byte 4 0
byte 4 1064605338
byte 4 3197577718
byte 4 0
byte 4 1063074669
byte 4 3202531056
byte 4 1047828139
byte 4 1064532072
byte 4 3190184938
byte 4 1049007711
byte 4 1062149053
byte 4 3198039930
byte 4 1056964608
byte 4 1060013330
byte 4 3189189110
byte 4 1060597999
byte 4 1062847556
byte 4 0
byte 4 1057396303
byte 4 1063074669
byte 4 1055047408
byte 4 3195311787
byte 4 1062149053
byte 4 1050556282
byte 4 3204448256
byte 4 1064532072
byte 4 1042701290
byte 4 3196491359
byte 4 1057396303
byte 4 0
byte 4 3210331204
byte 4 1060013330
byte 4 1041705462
byte 4 3208081647
byte 4 1060013330
byte 4 3189189110
byte 4 3208081647
byte 4 1062847556
byte 4 0
byte 4 3204879951
byte 4 1062149053
byte 4 3198039930
byte 4 3204448256
byte 4 1063074669
byte 4 3202531056
byte 4 3195311787
byte 4 1064532072
byte 4 3190184938
byte 4 3196491359
byte 4 1041705462
byte 4 1060597999
byte 4 3207496978
byte 4 1050556282
byte 4 1056964608
byte 4 3209632701
byte 4 1054458931
byte 4 1060121929
byte 4 3205921044
byte 4 1055047408
byte 4 1047828139
byte 4 3210558317
byte 4 1058437396
byte 4 1054458931
byte 4 3207605577
byte 4 1060121929
byte 4 1058437396
byte 4 3201942579
byte 4 3189189110
byte 4 1060597999
byte 4 3207496978
byte 4 3198039930
byte 4 1056964608
byte 4 3209632701
byte 4 0
byte 4 1057396303
byte 4 3210331204
byte 4 3204879951
byte 4 0
byte 4 3210331204
byte 4 3202531056
byte 4 1047828139
byte 4 3210558317
byte 4 3197577718
byte 4 0
byte 4 3212088986
byte 4 3190184938
byte 4 1049007711
byte 4 3212015720
byte 4 0
byte 4 0
byte 4 3212836864
byte 4 1050094070
byte 4 0
byte 4 3212088986
byte 4 1042701290
byte 4 1049007711
byte 4 3212015720
byte 4 3202531056
byte 4 3195311787
byte 4 3210558317
byte 4 3198039930
byte 4 3204448256
byte 4 3209632701
byte 4 3190184938
byte 4 3196491359
byte 4 3212015720
byte 4 0
byte 4 3210331204
byte 4 3204879951
byte 4 3189189110
byte 4 3208081647
byte 4 3207496978
byte 4 1041705462
byte 4 3208081647
byte 4 3207496978
byte 4 0
byte 4 3204879951
byte 4 3210331204
byte 4 1050556282
byte 4 3204448256
byte 4 3209632701
byte 4 1055047408
byte 4 3195311787
byte 4 3210558317
byte 4 1042701290
byte 4 3196491359
byte 4 3212015720
byte 4 1047828139
byte 4 3210558317
byte 4 3202531056
byte 4 1056964608
byte 4 3209632701
byte 4 3198039930
byte 4 1054458931
byte 4 3207605577
byte 4 3205921044
byte 4 1060597999
byte 4 3207496978
byte 4 3189189110
byte 4 1060121929
byte 4 3205921044
byte 4 3201942579
byte 4 1058437396
byte 4 3201942579
byte 4 3207605577
byte 4 0
byte 4 3212088986
byte 4 3197577718
byte 4 0
byte 4 3212836864
byte 4 0
byte 4 1049007711
byte 4 3212015720
byte 4 3190184938
byte 4 0
byte 4 3210331204
byte 4 1057396303
byte 4 0
byte 4 3212088986
byte 4 1050094070
byte 4 1047828139
byte 4 3210558317
byte 4 1055047408
byte 4 1049007711
byte 4 3212015720
byte 4 1042701290
byte 4 1056964608
byte 4 3209632701
byte 4 1050556282
byte 4 1060597999
byte 4 3207496978
byte 4 1041705462
byte 4 1057396303
byte 4 3210331204
byte 4 0
byte 4 3195311787
byte 4 3210558317
byte 4 3202531056
byte 4 3204448256
byte 4 3209632701
byte 4 3198039930
byte 4 3196491359
byte 4 3212015720
byte 4 3190184938
byte 4 3210331204
byte 4 3204879951
byte 4 0
byte 4 3208081647
byte 4 3207496978
byte 4 3189189110
byte 4 3208081647
byte 4 3207496978
byte 4 1041705462
byte 4 3204879951
byte 4 3210331204
byte 4 0
byte 4 3204448256
byte 4 3209632701
byte 4 1050556282
byte 4 3195311787
byte 4 3210558317
byte 4 1055047408
byte 4 3196491359
byte 4 3212015720
byte 4 1042701290
byte 4 3210558317
byte 4 3202531056
byte 4 1047828139
byte 4 3209632701
byte 4 3198039930
byte 4 1056964608
byte 4 3207605577
byte 4 3205921044
byte 4 1054458931
byte 4 3207496978
byte 4 3189189110
byte 4 1060597999
byte 4 3202531056
byte 4 3195311787
byte 4 1063074669
byte 4 3205921044
byte 4 3201942579
byte 4 1060121929
byte 4 3198039930
byte 4 3204448256
byte 4 1062149053
byte 4 3189189110
byte 4 3208081647
byte 4 1060013330
byte 4 3201942579
byte 4 3207605577
byte 4 1058437396
byte 4 3190184938
byte 4 3196491359
byte 4 1064532072
byte 4 1055047408
byte 4 3195311787
byte 4 1063074669
byte 4 1042701290
byte 4 3196491359
byte 4 1064532072
byte 4 1050556282
byte 4 3204448256
byte 4 1062149053
byte 4 1041705462
byte 4 3208081647
byte 4 1060013330
byte 4 0
byte 4 3204879951
byte 4 1062847556
byte 4 1054458931
byte 4 3207605577
byte 4 1058437396
byte 4 1058437396
byte 4 3201942579
byte 4 1060121929
byte 4 1060121929
byte 4 3205921044
byte 4 1054458931
byte 4 3212088986
byte 4 1050094070
byte 4 0
byte 4 3212015720
byte 4 1042701290
byte 4 1049007711
byte 4 3212836864
byte 4 0
byte 4 0
byte 4 3210331204
byte 4 0
byte 4 1057396303
byte 4 3212088986
byte 4 3197577718
byte 4 0
byte 4 3212015720
byte 4 3190184938
byte 4 1049007711
byte 4 3210558317
byte 4 1055047408
byte 4 3195311787
byte 4 3212015720
byte 4 1042701290
byte 4 3196491359
byte 4 3209632701
byte 4 1050556282
byte 4 3204448256
byte 4 3210558317
byte 4 3202531056
byte 4 3195311787
byte 4 3212015720
byte 4 3190184938
byte 4 3196491359
byte 4 3209632701
byte 4 3198039930
byte 4 3204448256
byte 4 3207496978
byte 4 1041705462
byte 4 3208081647
byte 4 3207496978
byte 4 3189189110
byte 4 3208081647
byte 4 3210331204
byte 4 0
byte 4 3204879951
byte 4 3207605577
byte 4 1058437396
byte 4 3201942579
byte 4 3205921044
byte 4 1054458931
byte 4 3207605577
byte 4 3201942579
byte 4 1060121929
byte 4 3205921044
byte 4 3201942579
byte 4 3207605577
byte 4 3205921044
byte 4 3205921044
byte 4 3201942579
byte 4 3207605577
byte 4 3207605577
byte 4 3205921044
byte 4 3201942579
export Q_rand
code
proc Q_rand 4 0
file "../../../code/qcommon/q_math.c"
line 151
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
;23:// q_math.c -- stateless support routines that are included in each code module
;24:
;25:// Some of the vector functions are static inline in q_shared.h. q3asm
;26:// doesn't understand static functions though, so we only want them in
;27:// one file. That's what this is about.
;28:#ifdef Q3_VM
;29:#define __Q3_VM_MATH
;30:#endif
;31:
;32:#include "q_shared.h"
;33:
;34:vec3_t	vec3_origin = {0,0,0};
;35:vec3_t	axisDefault[3] = { { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 1 } };
;36:
;37:
;38:vec4_t		colorBlack	= {0, 0, 0, 1};
;39:vec4_t		colorRed	= {1, 0, 0, 1};
;40:vec4_t		colorGreen	= {0, 1, 0, 1};
;41:vec4_t		colorBlue	= {0, 0, 1, 1};
;42:vec4_t		colorYellow	= {1, 1, 0, 1};
;43:vec4_t		colorMagenta= {1, 0, 1, 1};
;44:vec4_t		colorCyan	= {0, 1, 1, 1};
;45:vec4_t		colorWhite	= {1, 1, 1, 1};
;46:vec4_t		colorLtGrey	= {0.75, 0.75, 0.75, 1};
;47:vec4_t		colorMdGrey	= {0.5, 0.5, 0.5, 1};
;48:vec4_t		colorDkGrey	= {0.25, 0.25, 0.25, 1};
;49:
;50:vec4_t	g_color_table[9] =
;51:	{
;52:	{0.0, 0.0, 0.0, 1.0},
;53:	{1.0, 0.0, 0.0, 1.0},
;54:	{0.0, 1.0, 0.0, 1.0},
;55:	{1.0, 1.0, 0.0, 1.0},
;56:	{0.0, 0.0, 1.0, 1.0},
;57:	{0.0, 1.0, 1.0, 1.0},
;58:	{1.0, 0.0, 1.0, 1.0},
;59:	{1.0, 1.0, 1.0, 1.0},
;60:        {1.00f, 0.43f, 0.00f, 1.00f},
;61:	};
;62:
;63:
;64:vec3_t	bytedirs[NUMVERTEXNORMALS] =
;65:{
;66:{-0.525731f, 0.000000f, 0.850651f}, {-0.442863f, 0.238856f, 0.864188f}, 
;67:{-0.295242f, 0.000000f, 0.955423f}, {-0.309017f, 0.500000f, 0.809017f}, 
;68:{-0.162460f, 0.262866f, 0.951056f}, {0.000000f, 0.000000f, 1.000000f}, 
;69:{0.000000f, 0.850651f, 0.525731f}, {-0.147621f, 0.716567f, 0.681718f}, 
;70:{0.147621f, 0.716567f, 0.681718f}, {0.000000f, 0.525731f, 0.850651f}, 
;71:{0.309017f, 0.500000f, 0.809017f}, {0.525731f, 0.000000f, 0.850651f}, 
;72:{0.295242f, 0.000000f, 0.955423f}, {0.442863f, 0.238856f, 0.864188f}, 
;73:{0.162460f, 0.262866f, 0.951056f}, {-0.681718f, 0.147621f, 0.716567f}, 
;74:{-0.809017f, 0.309017f, 0.500000f},{-0.587785f, 0.425325f, 0.688191f}, 
;75:{-0.850651f, 0.525731f, 0.000000f},{-0.864188f, 0.442863f, 0.238856f}, 
;76:{-0.716567f, 0.681718f, 0.147621f},{-0.688191f, 0.587785f, 0.425325f}, 
;77:{-0.500000f, 0.809017f, 0.309017f}, {-0.238856f, 0.864188f, 0.442863f}, 
;78:{-0.425325f, 0.688191f, 0.587785f}, {-0.716567f, 0.681718f, -0.147621f}, 
;79:{-0.500000f, 0.809017f, -0.309017f}, {-0.525731f, 0.850651f, 0.000000f}, 
;80:{0.000000f, 0.850651f, -0.525731f}, {-0.238856f, 0.864188f, -0.442863f}, 
;81:{0.000000f, 0.955423f, -0.295242f}, {-0.262866f, 0.951056f, -0.162460f}, 
;82:{0.000000f, 1.000000f, 0.000000f}, {0.000000f, 0.955423f, 0.295242f}, 
;83:{-0.262866f, 0.951056f, 0.162460f}, {0.238856f, 0.864188f, 0.442863f}, 
;84:{0.262866f, 0.951056f, 0.162460f}, {0.500000f, 0.809017f, 0.309017f}, 
;85:{0.238856f, 0.864188f, -0.442863f},{0.262866f, 0.951056f, -0.162460f}, 
;86:{0.500000f, 0.809017f, -0.309017f},{0.850651f, 0.525731f, 0.000000f}, 
;87:{0.716567f, 0.681718f, 0.147621f}, {0.716567f, 0.681718f, -0.147621f}, 
;88:{0.525731f, 0.850651f, 0.000000f}, {0.425325f, 0.688191f, 0.587785f}, 
;89:{0.864188f, 0.442863f, 0.238856f}, {0.688191f, 0.587785f, 0.425325f}, 
;90:{0.809017f, 0.309017f, 0.500000f}, {0.681718f, 0.147621f, 0.716567f}, 
;91:{0.587785f, 0.425325f, 0.688191f}, {0.955423f, 0.295242f, 0.000000f}, 
;92:{1.000000f, 0.000000f, 0.000000f}, {0.951056f, 0.162460f, 0.262866f}, 
;93:{0.850651f, -0.525731f, 0.000000f},{0.955423f, -0.295242f, 0.000000f}, 
;94:{0.864188f, -0.442863f, 0.238856f}, {0.951056f, -0.162460f, 0.262866f}, 
;95:{0.809017f, -0.309017f, 0.500000f}, {0.681718f, -0.147621f, 0.716567f}, 
;96:{0.850651f, 0.000000f, 0.525731f}, {0.864188f, 0.442863f, -0.238856f}, 
;97:{0.809017f, 0.309017f, -0.500000f}, {0.951056f, 0.162460f, -0.262866f}, 
;98:{0.525731f, 0.000000f, -0.850651f}, {0.681718f, 0.147621f, -0.716567f}, 
;99:{0.681718f, -0.147621f, -0.716567f},{0.850651f, 0.000000f, -0.525731f}, 
;100:{0.809017f, -0.309017f, -0.500000f}, {0.864188f, -0.442863f, -0.238856f}, 
;101:{0.951056f, -0.162460f, -0.262866f}, {0.147621f, 0.716567f, -0.681718f}, 
;102:{0.309017f, 0.500000f, -0.809017f}, {0.425325f, 0.688191f, -0.587785f}, 
;103:{0.442863f, 0.238856f, -0.864188f}, {0.587785f, 0.425325f, -0.688191f}, 
;104:{0.688191f, 0.587785f, -0.425325f}, {-0.147621f, 0.716567f, -0.681718f}, 
;105:{-0.309017f, 0.500000f, -0.809017f}, {0.000000f, 0.525731f, -0.850651f}, 
;106:{-0.525731f, 0.000000f, -0.850651f}, {-0.442863f, 0.238856f, -0.864188f}, 
;107:{-0.295242f, 0.000000f, -0.955423f}, {-0.162460f, 0.262866f, -0.951056f}, 
;108:{0.000000f, 0.000000f, -1.000000f}, {0.295242f, 0.000000f, -0.955423f}, 
;109:{0.162460f, 0.262866f, -0.951056f}, {-0.442863f, -0.238856f, -0.864188f}, 
;110:{-0.309017f, -0.500000f, -0.809017f}, {-0.162460f, -0.262866f, -0.951056f}, 
;111:{0.000000f, -0.850651f, -0.525731f}, {-0.147621f, -0.716567f, -0.681718f}, 
;112:{0.147621f, -0.716567f, -0.681718f}, {0.000000f, -0.525731f, -0.850651f}, 
;113:{0.309017f, -0.500000f, -0.809017f}, {0.442863f, -0.238856f, -0.864188f}, 
;114:{0.162460f, -0.262866f, -0.951056f}, {0.238856f, -0.864188f, -0.442863f}, 
;115:{0.500000f, -0.809017f, -0.309017f}, {0.425325f, -0.688191f, -0.587785f}, 
;116:{0.716567f, -0.681718f, -0.147621f}, {0.688191f, -0.587785f, -0.425325f}, 
;117:{0.587785f, -0.425325f, -0.688191f}, {0.000000f, -0.955423f, -0.295242f}, 
;118:{0.000000f, -1.000000f, 0.000000f}, {0.262866f, -0.951056f, -0.162460f}, 
;119:{0.000000f, -0.850651f, 0.525731f}, {0.000000f, -0.955423f, 0.295242f}, 
;120:{0.238856f, -0.864188f, 0.442863f}, {0.262866f, -0.951056f, 0.162460f}, 
;121:{0.500000f, -0.809017f, 0.309017f}, {0.716567f, -0.681718f, 0.147621f}, 
;122:{0.525731f, -0.850651f, 0.000000f}, {-0.238856f, -0.864188f, -0.442863f}, 
;123:{-0.500000f, -0.809017f, -0.309017f}, {-0.262866f, -0.951056f, -0.162460f}, 
;124:{-0.850651f, -0.525731f, 0.000000f}, {-0.716567f, -0.681718f, -0.147621f}, 
;125:{-0.716567f, -0.681718f, 0.147621f}, {-0.525731f, -0.850651f, 0.000000f}, 
;126:{-0.500000f, -0.809017f, 0.309017f}, {-0.238856f, -0.864188f, 0.442863f}, 
;127:{-0.262866f, -0.951056f, 0.162460f}, {-0.864188f, -0.442863f, 0.238856f}, 
;128:{-0.809017f, -0.309017f, 0.500000f}, {-0.688191f, -0.587785f, 0.425325f}, 
;129:{-0.681718f, -0.147621f, 0.716567f}, {-0.442863f, -0.238856f, 0.864188f}, 
;130:{-0.587785f, -0.425325f, 0.688191f}, {-0.309017f, -0.500000f, 0.809017f}, 
;131:{-0.147621f, -0.716567f, 0.681718f}, {-0.425325f, -0.688191f, 0.587785f}, 
;132:{-0.162460f, -0.262866f, 0.951056f}, {0.442863f, -0.238856f, 0.864188f}, 
;133:{0.162460f, -0.262866f, 0.951056f}, {0.309017f, -0.500000f, 0.809017f}, 
;134:{0.147621f, -0.716567f, 0.681718f}, {0.000000f, -0.525731f, 0.850651f}, 
;135:{0.425325f, -0.688191f, 0.587785f}, {0.587785f, -0.425325f, 0.688191f}, 
;136:{0.688191f, -0.587785f, 0.425325f}, {-0.955423f, 0.295242f, 0.000000f}, 
;137:{-0.951056f, 0.162460f, 0.262866f}, {-1.000000f, 0.000000f, 0.000000f}, 
;138:{-0.850651f, 0.000000f, 0.525731f}, {-0.955423f, -0.295242f, 0.000000f}, 
;139:{-0.951056f, -0.162460f, 0.262866f}, {-0.864188f, 0.442863f, -0.238856f}, 
;140:{-0.951056f, 0.162460f, -0.262866f}, {-0.809017f, 0.309017f, -0.500000f}, 
;141:{-0.864188f, -0.442863f, -0.238856f}, {-0.951056f, -0.162460f, -0.262866f}, 
;142:{-0.809017f, -0.309017f, -0.500000f}, {-0.681718f, 0.147621f, -0.716567f}, 
;143:{-0.681718f, -0.147621f, -0.716567f}, {-0.850651f, 0.000000f, -0.525731f}, 
;144:{-0.688191f, 0.587785f, -0.425325f}, {-0.587785f, 0.425325f, -0.688191f}, 
;145:{-0.425325f, 0.688191f, -0.587785f}, {-0.425325f, -0.688191f, -0.587785f}, 
;146:{-0.587785f, -0.425325f, -0.688191f}, {-0.688191f, -0.587785f, -0.425325f}
;147:};
;148:
;149://==============================================================
;150:
;151:int		Q_rand( int *seed ) {
line 152
;152:	*seed = (69069 * *seed + 1);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 69069
ADDRLP4 0
INDIRP4
INDIRI4
MULI4
CNSTI4 1
ADDI4
ASGNI4
line 153
;153:	return *seed;
ADDRFP4 0
INDIRP4
INDIRI4
RETI4
LABELV $43
endproc Q_rand 4 0
export Q_random
proc Q_random 4 4
line 156
;154:}
;155:
;156:float	Q_random( int *seed ) {
line 157
;157:	return ( Q_rand( seed ) & 0xffff ) / (float)0x10000;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Q_rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65535
BANDI4
CVIF4 4
CNSTF4 1199570944
DIVF4
RETF4
LABELV $44
endproc Q_random 4 4
export Q_crandom
proc Q_crandom 4 4
line 160
;158:}
;159:
;160:float	Q_crandom( int *seed ) {
line 161
;161:	return 2.0 * ( Q_random( seed ) - 0.5 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Q_random
CALLF4
ASGNF4
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
SUBF4
MULF4
RETF4
LABELV $45
endproc Q_crandom 4 4
export ClampChar
proc ClampChar 0 0
line 166
;162:}
;163:
;164://=======================================================
;165:
;166:signed char ClampChar( int i ) {
line 167
;167:	if ( i < -128 ) {
ADDRFP4 0
INDIRI4
CNSTI4 -128
GEI4 $47
line 168
;168:		return -128;
CNSTI4 -128
RETI4
ADDRGP4 $46
JUMPV
LABELV $47
line 170
;169:	}
;170:	if ( i > 127 ) {
ADDRFP4 0
INDIRI4
CNSTI4 127
LEI4 $49
line 171
;171:		return 127;
CNSTI4 127
RETI4
ADDRGP4 $46
JUMPV
LABELV $49
line 173
;172:	}
;173:	return i;
ADDRFP4 0
INDIRI4
CVII1 4
CVII4 1
RETI4
LABELV $46
endproc ClampChar 0 0
export ClampShort
proc ClampShort 0 0
line 176
;174:}
;175:
;176:signed short ClampShort( int i ) {
line 177
;177:	if ( i < -32768 ) {
ADDRFP4 0
INDIRI4
CNSTI4 -32768
GEI4 $52
line 178
;178:		return -32768;
CNSTI4 -32768
RETI4
ADDRGP4 $51
JUMPV
LABELV $52
line 180
;179:	}
;180:	if ( i > 0x7fff ) {
ADDRFP4 0
INDIRI4
CNSTI4 32767
LEI4 $54
line 181
;181:		return 0x7fff;
CNSTI4 32767
RETI4
ADDRGP4 $51
JUMPV
LABELV $54
line 183
;182:	}
;183:	return i;
ADDRFP4 0
INDIRI4
CVII2 4
CVII4 2
RETI4
LABELV $51
endproc ClampShort 0 0
export DirToByte
proc DirToByte 24 0
line 188
;184:}
;185:
;186:
;187:// this isn't a real cheap function to call!
;188:int DirToByte( vec3_t dir ) {
line 192
;189:	int		i, best;
;190:	float	d, bestd;
;191:
;192:	if ( !dir ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $57
line 193
;193:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 196
;194:	}
;195:
;196:	bestd = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 197
;197:	best = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 198
;198:	for (i=0 ; i<NUMVERTEXNORMALS ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $59
line 199
;199:	{
line 200
;200:		d = DotProduct (dir, bytedirs[i]);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 bytedirs
ADDP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 bytedirs+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRGP4 bytedirs+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 201
;201:		if (d > bestd)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $65
line 202
;202:		{
line 203
;203:			bestd = d;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 204
;204:			best = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 205
;205:		}
LABELV $65
line 206
;206:	}
LABELV $60
line 198
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 162
LTI4 $59
line 208
;207:
;208:	return best;
ADDRLP4 12
INDIRI4
RETI4
LABELV $56
endproc DirToByte 24 0
export ByteToDir
proc ByteToDir 4 0
line 211
;209:}
;210:
;211:void ByteToDir( int b, vec3_t dir ) {
line 212
;212:	if ( b < 0 || b >= NUMVERTEXNORMALS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $70
ADDRLP4 0
INDIRI4
CNSTI4 162
LTI4 $68
LABELV $70
line 213
;213:		VectorCopy( vec3_origin, dir );
ADDRFP4 4
INDIRP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 214
;214:		return;
ADDRGP4 $67
JUMPV
LABELV $68
line 216
;215:	}
;216:	VectorCopy (bytedirs[b], dir);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bytedirs
ADDP4
INDIRB
ASGNB 12
line 217
;217:}
LABELV $67
endproc ByteToDir 4 0
export ColorBytes3
proc ColorBytes3 40 0
line 220
;218:
;219:
;220:unsigned ColorBytes3 (float r, float g, float b) {
line 223
;221:	unsigned	i;
;222:
;223:	( (byte *)&i )[0] = r * 255;
ADDRLP4 8
CNSTF4 1132396544
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
CNSTF4 1325400064
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
LTF4 $73
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $74
JUMPV
LABELV $73
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $74
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUU1 4
ASGNU1
line 224
;224:	( (byte *)&i )[1] = g * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
CNSTF4 1325400064
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $77
ADDRLP4 16
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $78
JUMPV
LABELV $77
ADDRLP4 16
ADDRLP4 20
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $78
ADDRLP4 0+1
ADDRLP4 16
INDIRU4
CVUU1 4
ASGNU1
line 225
;225:	( (byte *)&i )[2] = b * 255;
ADDRLP4 32
CNSTF4 1132396544
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $81
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $82
JUMPV
LABELV $81
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $82
ADDRLP4 0+2
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 227
;226:
;227:	return i;
ADDRLP4 0
INDIRU4
RETU4
LABELV $71
endproc ColorBytes3 40 0
export ColorBytes4
proc ColorBytes4 52 0
line 230
;228:}
;229:
;230:unsigned ColorBytes4 (float r, float g, float b, float a) {
line 233
;231:	unsigned	i;
;232:
;233:	( (byte *)&i )[0] = r * 255;
ADDRLP4 8
CNSTF4 1132396544
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
CNSTF4 1325400064
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
LTF4 $85
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $86
JUMPV
LABELV $85
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $86
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUU1 4
ASGNU1
line 234
;234:	( (byte *)&i )[1] = g * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 24
CNSTF4 1325400064
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $89
ADDRLP4 16
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $90
JUMPV
LABELV $89
ADDRLP4 16
ADDRLP4 20
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $90
ADDRLP4 0+1
ADDRLP4 16
INDIRU4
CVUU1 4
ASGNU1
line 235
;235:	( (byte *)&i )[2] = b * 255;
ADDRLP4 32
CNSTF4 1132396544
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $93
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $94
JUMPV
LABELV $93
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $94
ADDRLP4 0+2
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 236
;236:	( (byte *)&i )[3] = a * 255;
ADDRLP4 44
CNSTF4 1132396544
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 48
CNSTF4 1325400064
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
LTF4 $97
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $98
JUMPV
LABELV $97
ADDRLP4 40
ADDRLP4 44
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $98
ADDRLP4 0+3
ADDRLP4 40
INDIRU4
CVUU1 4
ASGNU1
line 238
;237:
;238:	return i;
ADDRLP4 0
INDIRU4
RETU4
LABELV $83
endproc ColorBytes4 52 0
export NormalizeColor
proc NormalizeColor 12 0
line 241
;239:}
;240:
;241:float NormalizeColor( const vec3_t in, vec3_t out ) {
line 244
;242:	float	max;
;243:	
;244:	max = in[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 245
;245:	if ( in[1] > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
LEF4 $100
line 246
;246:		max = in[1];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 247
;247:	}
LABELV $100
line 248
;248:	if ( in[2] > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
LEF4 $102
line 249
;249:		max = in[2];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 250
;250:	}
LABELV $102
line 252
;251:
;252:	if ( !max ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
NEF4 $104
line 253
;253:		VectorClear( out );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 254
;254:	} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 255
;255:		out[0] = in[0] / max;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 256
;256:		out[1] = in[1] / max;
ADDRLP4 4
CNSTI4 4
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
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 257
;257:		out[2] = in[2] / max;
ADDRLP4 8
CNSTI4 8
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
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 258
;258:	}
LABELV $105
line 259
;259:	return max;
ADDRLP4 0
INDIRF4
RETF4
LABELV $99
endproc NormalizeColor 12 0
export PlaneFromPoints
proc PlaneFromPoints 76 12
line 271
;260:}
;261:
;262:
;263:/*
;264:=====================
;265:PlaneFromPoints
;266:
;267:Returns false if the triangle is degenrate.
;268:The normal will point out of the clock for clockwise ordered points
;269:=====================
;270:*/
;271:qboolean PlaneFromPoints( vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c ) {
line 274
;272:	vec3_t	d1, d2;
;273:
;274:	VectorSubtract( b, a, d1 );
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 275
;275:	VectorSubtract( c, a, d2 );
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 12
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 276
;276:	CrossProduct( d2, d1, plane );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 277
;277:	if ( VectorNormalize( plane ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 0
NEF4 $111
line 278
;278:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $106
JUMPV
LABELV $111
line 281
;279:	}
;280:
;281:	plane[3] = DotProduct( a, plane );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 282
;282:	return qtrue;
CNSTI4 1
RETI4
LABELV $106
endproc PlaneFromPoints 76 12
export RotatePointAroundVector
proc RotatePointAroundVector 256 12
line 293
;283:}
;284:
;285:/*
;286:===============
;287:RotatePointAroundVector
;288:
;289:This is not implemented very well...
;290:===============
;291:*/
;292:void RotatePointAroundVector( vec3_t dst, const vec3_t dir, const vec3_t point,
;293:							 float degrees ) {
line 303
;294:	float	m[3][3];
;295:	float	im[3][3];
;296:	float	zrot[3][3];
;297:	float	tmpmat[3][3];
;298:	float	rot[3][3];
;299:	int	i;
;300:	vec3_t vr, vup, vf;
;301:	float	rad;
;302:
;303:	vf[0] = dir[0];
ADDRLP4 148
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
line 304
;304:	vf[1] = dir[1];
ADDRLP4 148+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 305
;305:	vf[2] = dir[2];
ADDRLP4 148+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 307
;306:
;307:	PerpendicularVector( vr, dir );
ADDRLP4 160
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 308
;308:	CrossProduct( vr, vf, vup );
ADDRLP4 160
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 176
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 310
;309:
;310:	m[0][0] = vr[0];
ADDRLP4 40
ADDRLP4 160
INDIRF4
ASGNF4
line 311
;311:	m[1][0] = vr[1];
ADDRLP4 40+12
ADDRLP4 160+4
INDIRF4
ASGNF4
line 312
;312:	m[2][0] = vr[2];
ADDRLP4 40+24
ADDRLP4 160+8
INDIRF4
ASGNF4
line 314
;313:
;314:	m[0][1] = vup[0];
ADDRLP4 40+4
ADDRLP4 176
INDIRF4
ASGNF4
line 315
;315:	m[1][1] = vup[1];
ADDRLP4 40+12+4
ADDRLP4 176+4
INDIRF4
ASGNF4
line 316
;316:	m[2][1] = vup[2];
ADDRLP4 40+24+4
ADDRLP4 176+8
INDIRF4
ASGNF4
line 318
;317:
;318:	m[0][2] = vf[0];
ADDRLP4 40+8
ADDRLP4 148
INDIRF4
ASGNF4
line 319
;319:	m[1][2] = vf[1];
ADDRLP4 40+12+8
ADDRLP4 148+4
INDIRF4
ASGNF4
line 320
;320:	m[2][2] = vf[2];
ADDRLP4 40+24+8
ADDRLP4 148+8
INDIRF4
ASGNF4
line 322
;321:
;322:	memcpy( im, m, sizeof( im ) );
ADDRLP4 112
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 324
;323:
;324:	im[0][1] = m[1][0];
ADDRLP4 112+4
ADDRLP4 40+12
INDIRF4
ASGNF4
line 325
;325:	im[0][2] = m[2][0];
ADDRLP4 112+8
ADDRLP4 40+24
INDIRF4
ASGNF4
line 326
;326:	im[1][0] = m[0][1];
ADDRLP4 112+12
ADDRLP4 40+4
INDIRF4
ASGNF4
line 327
;327:	im[1][2] = m[2][1];
ADDRLP4 112+12+8
ADDRLP4 40+24+4
INDIRF4
ASGNF4
line 328
;328:	im[2][0] = m[0][2];
ADDRLP4 112+24
ADDRLP4 40+8
INDIRF4
ASGNF4
line 329
;329:	im[2][1] = m[1][2];
ADDRLP4 112+24+4
ADDRLP4 40+12+8
INDIRF4
ASGNF4
line 331
;330:
;331:	memset( zrot, 0, sizeof( zrot ) );
ADDRLP4 76
ARGP4
CNSTI4 0
ARGI4
CNSTI4 36
ARGI4
ADDRGP4 memset
CALLP4
pop
line 332
;332:	zrot[0][0] = zrot[1][1] = zrot[2][2] = 1.0F;
ADDRLP4 224
CNSTF4 1065353216
ASGNF4
ADDRLP4 76+24+8
ADDRLP4 224
INDIRF4
ASGNF4
ADDRLP4 76+12+4
ADDRLP4 224
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 224
INDIRF4
ASGNF4
line 334
;333:
;334:	rad = DEG2RAD( degrees );
ADDRLP4 172
CNSTF4 1078530011
ADDRFP4 12
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ASGNF4
line 335
;335:	zrot[0][0] = cos( rad );
ADDRLP4 172
INDIRF4
ARGF4
ADDRLP4 228
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 228
INDIRF4
ASGNF4
line 336
;336:	zrot[0][1] = sin( rad );
ADDRLP4 172
INDIRF4
ARGF4
ADDRLP4 232
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 232
INDIRF4
ASGNF4
line 337
;337:	zrot[1][0] = -sin( rad );
ADDRLP4 172
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 76+12
ADDRLP4 236
INDIRF4
NEGF4
ASGNF4
line 338
;338:	zrot[1][1] = cos( rad );
ADDRLP4 172
INDIRF4
ARGF4
ADDRLP4 240
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 76+12+4
ADDRLP4 240
INDIRF4
ASGNF4
line 340
;339:
;340:	MatrixMultiply( m, zrot, tmpmat );
ADDRLP4 40
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 188
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 341
;341:	MatrixMultiply( tmpmat, im, rot );
ADDRLP4 188
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 343
;342:
;343:	for ( i = 0; i < 3; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $158
line 344
;344:		dst[i] = rot[i][0] * point[0] + rot[i][1] * point[1] + rot[i][2] * point[2];
ADDRLP4 248
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 252
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 248
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ADDRLP4 252
INDIRP4
INDIRF4
MULF4
ADDRLP4 248
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
ADDRLP4 252
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 248
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
ADDRLP4 252
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 345
;345:	}
LABELV $159
line 343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $158
line 346
;346:}
LABELV $113
endproc RotatePointAroundVector 256 12
export RotateAroundDirection
proc RotateAroundDirection 20 16
line 353
;347:
;348:/*
;349:===============
;350:RotateAroundDirection
;351:===============
;352:*/
;353:void RotateAroundDirection( vec3_t axis[3], float yaw ) {
line 356
;354:
;355:	// create an arbitrary axis[1] 
;356:	PerpendicularVector( axis[1], axis[0] );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 359
;357:
;358:	// rotate it around axis[0] by yaw
;359:	if ( yaw ) {
ADDRFP4 4
INDIRF4
CNSTF4 0
EQF4 $165
line 362
;360:		vec3_t	temp;
;361:
;362:		VectorCopy( axis[1], temp );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 363
;363:		RotatePointAroundVector( axis[1], axis[0], temp, yaw );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 364
;364:	}
LABELV $165
line 367
;365:
;366:	// cross to get axis[2]
;367:	CrossProduct( axis[0], axis[1], axis[2] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 368
;368:}
LABELV $164
endproc RotateAroundDirection 20 16
export vectoangles
proc vectoangles 40 8
line 372
;369:
;370:
;371:
;372:void vectoangles( const vec3_t value1, vec3_t angles ) {
line 376
;373:	float	forward;
;374:	float	yaw, pitch;
;375:	
;376:	if ( value1[1] == 0 && value1[0] == 0 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $168
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $168
line 377
;377:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 378
;378:		if ( value1[2] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
LEF4 $170
line 379
;379:			pitch = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 380
;380:		}
ADDRGP4 $169
JUMPV
LABELV $170
line 381
;381:		else {
line 382
;382:			pitch = 270;
ADDRLP4 4
CNSTF4 1132920832
ASGNF4
line 383
;383:		}
line 384
;384:	}
ADDRGP4 $169
JUMPV
LABELV $168
line 385
;385:	else {
line 386
;386:		if ( value1[0] ) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $172
line 387
;387:			yaw = ( atan2 ( value1[1], value1[0] ) * 180 / M_PI );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 388
;388:		}
ADDRGP4 $173
JUMPV
LABELV $172
line 389
;389:		else if ( value1[1] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $174
line 390
;390:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 391
;391:		}
ADDRGP4 $175
JUMPV
LABELV $174
line 392
;392:		else {
line 393
;393:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 394
;394:		}
LABELV $175
LABELV $173
line 395
;395:		if ( yaw < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $176
line 396
;396:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 397
;397:		}
LABELV $176
line 399
;398:
;399:		forward = sqrt ( value1[0]*value1[0] + value1[1]*value1[1] );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 32
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 400
;400:		pitch = ( atan2(value1[2], forward) * 180 / M_PI );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1127481344
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 401
;401:		if ( pitch < 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $178
line 402
;402:			pitch += 360;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 403
;403:		}
LABELV $178
line 404
;404:	}
LABELV $169
line 406
;405:
;406:	angles[PITCH] = -pitch;
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRF4
NEGF4
ASGNF4
line 407
;407:	angles[YAW] = yaw;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 408
;408:	angles[ROLL] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 409
;409:}
LABELV $167
endproc vectoangles 40 8
export AnglesToAxis
proc AnglesToAxis 16 16
line 417
;410:
;411:
;412:/*
;413:=================
;414:AnglesToAxis
;415:=================
;416:*/
;417:void AnglesToAxis( const vec3_t angles, vec3_t axis[3] ) {
line 421
;418:	vec3_t	right;
;419:
;420:	// angle vectors returns "right" instead of "y axis"
;421:	AngleVectors( angles, axis[0], right, axis[2] );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 422
;422:	VectorSubtract( vec3_origin, right, axis[1] );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 423
;423:}
LABELV $180
endproc AnglesToAxis 16 16
export VelocityToAxis
proc VelocityToAxis 120 12
line 425
;424:
;425:void VelocityToAxis( const vec3_t velocity, vec3_t axis[3], float lerpFactor ) {
line 430
;426:    vec3_t forward, right, up, targetForward, targetRight, targetUp;
;427:	int i;
;428:
;429:    // Если скорость равна нулю, оставляем текущие оси без изменений
;430:    if (VectorLength(velocity) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 0
NEF4 $186
line 431
;431:        return;
ADDRGP4 $185
JUMPV
LABELV $186
line 435
;432:    }
;433:
;434:    // Нормализуем вектор скорости, чтобы получить направление "вперед"
;435:    VectorNormalize2(velocity, targetForward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 438
;436:
;437:    // Определяем ось "вверх" как (0, 0, 1)
;438:    VectorSet(up, 0, 0, 1);
ADDRLP4 80
CNSTF4 0
ASGNF4
ADDRLP4 40
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 40+8
CNSTF4 1065353216
ASGNF4
line 441
;439:
;440:    // Вычисляем ось "вправо" как крестовое произведение "вверх" и "вперед"
;441:    CrossProduct(up, targetForward, targetRight);
ADDRLP4 40
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 442
;442:    VectorNormalize(targetRight);
ADDRLP4 16
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 445
;443:
;444:    // Пересчитываем "вверх" как крестовое произведение "вперед" и "вправо"
;445:    CrossProduct(targetForward, targetRight, targetUp);
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 448
;446:
;447:    // Линейная интерполяция между текущими осями и новыми целевыми осями
;448:    for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $190
line 449
;449:        axis[0][i] = Lerp(axis[0][i], targetForward[i], lerpFactor);  // вперед
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 88
ADDRLP4 84
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
INDIRF4
ARGF4
ADDRLP4 84
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 Lerp
CALLF4
ASGNF4
ADDRLP4 88
INDIRP4
ADDRLP4 92
INDIRF4
ASGNF4
line 450
;450:        axis[1][i] = Lerp(axis[1][i], targetRight[i], lerpFactor);    // вправо
ADDRLP4 96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 100
ADDRLP4 96
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 Lerp
CALLF4
ASGNF4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRF4
ASGNF4
line 451
;451:        axis[2][i] = Lerp(axis[2][i], targetUp[i], lerpFactor);       // вверх
ADDRLP4 108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 112
ADDRLP4 108
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRF4
ARGF4
ADDRLP4 108
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 Lerp
CALLF4
ASGNF4
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRF4
ASGNF4
line 452
;452:    }
LABELV $191
line 448
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $190
line 455
;453:
;454:    // Нормализуем оси после интерполяции, чтобы убедиться, что они остались ортогональными
;455:    VectorNormalize(axis[0]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 456
;456:    CrossProduct(axis[2], axis[0], axis[1]);
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 457
;457:    VectorNormalize(axis[1]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 458
;458:    CrossProduct(axis[0], axis[1], axis[2]);
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 459
;459:    VectorNormalize(axis[2]);
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 460
;460:}
LABELV $185
endproc VelocityToAxis 120 12
export Lerp
proc Lerp 4 0
line 462
;461:
;462:float Lerp(float a, float b, float f) {
line 463
;463:    return a + f * (b - a);
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
RETF4
LABELV $194
endproc Lerp 4 0
export AxisClear
proc AxisClear 0 0
line 466
;464:}
;465:
;466:void AxisClear( vec3_t axis[3] ) {
line 467
;467:	axis[0][0] = 1;
ADDRFP4 0
INDIRP4
CNSTF4 1065353216
ASGNF4
line 468
;468:	axis[0][1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 469
;469:	axis[0][2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 470
;470:	axis[1][0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 0
ASGNF4
line 471
;471:	axis[1][1] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ASGNF4
line 472
;472:	axis[1][2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 0
ASGNF4
line 473
;473:	axis[2][0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 0
ASGNF4
line 474
;474:	axis[2][1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 0
ASGNF4
line 475
;475:	axis[2][2] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1065353216
ASGNF4
line 476
;476:}
LABELV $195
endproc AxisClear 0 0
export AxisCopy
proc AxisCopy 8 0
line 478
;477:
;478:void AxisCopy( vec3_t in[3], vec3_t out[3] ) {
line 479
;479:	VectorCopy( in[0], out[0] );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 480
;480:	VectorCopy( in[1], out[1] );
ADDRLP4 0
CNSTI4 12
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 481
;481:	VectorCopy( in[2], out[2] );
ADDRLP4 4
CNSTI4 24
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
line 482
;482:}
LABELV $196
endproc AxisCopy 8 0
export ProjectPointOnPlane
proc ProjectPointOnPlane 60 0
line 485
;483:
;484:void ProjectPointOnPlane( vec3_t dst, const vec3_t p, const vec3_t normal )
;485:{
line 490
;486:	float d;
;487:	vec3_t n;
;488:	float inv_denom;
;489:
;490:	inv_denom =  DotProduct( normal, normal );
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 494
;491:#ifndef Q3_VM
;492:	assert( Q_fabs(inv_denom) != 0.0f ); // zero vectors get here
;493:#endif
;494:	inv_denom = 1.0f / inv_denom;
ADDRLP4 0
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 496
;495:
;496:	d = DotProduct( normal, p ) * inv_denom;
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 498
;497:
;498:	n[0] = normal[0] * inv_denom;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 499
;499:	n[1] = normal[1] * inv_denom;
ADDRLP4 4+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 500
;500:	n[2] = normal[2] * inv_denom;
ADDRLP4 4+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 502
;501:
;502:	dst[0] = p[0] - d * n[0];
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 503
;503:	dst[1] = p[1] - d * n[1];
ADDRLP4 52
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 504
;504:	dst[2] = p[2] - d * n[2];
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 505
;505:}
LABELV $197
endproc ProjectPointOnPlane 60 0
export MakeNormalVectors
proc MakeNormalVectors 40 12
line 515
;506:
;507:/*
;508:================
;509:MakeNormalVectors
;510:
;511:Given a normalized forward vector, create two
;512:other perpendicular vectors
;513:================
;514:*/
;515:void MakeNormalVectors( const vec3_t forward, vec3_t right, vec3_t up) {
line 520
;516:	float		d;
;517:
;518:	// this rotate and negate guarantees a vector
;519:	// not colinear with the original
;520:	right[1] = -forward[0];
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 521
;521:	right[2] = forward[1];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 522
;522:	right[0] = forward[2];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 524
;523:
;524:	d = DotProduct (right, forward);
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 525
;525:	VectorMA (right, -d, forward, right);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 526
;526:	VectorNormalize (right);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 527
;527:	CrossProduct (right, forward, up);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 528
;528:}
LABELV $202
endproc MakeNormalVectors 40 12
export VectorRotate
proc VectorRotate 40 0
line 532
;529:
;530:
;531:void VectorRotate( vec3_t in, vec3_t matrix[3], vec3_t out )
;532:{
line 533
;533:	out[0] = DotProduct( in, matrix[0] );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 534
;534:	out[1] = DotProduct( in, matrix[1] );
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 535
;535:	out[2] = DotProduct( in, matrix[2] );
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 536
;536:}
LABELV $203
endproc VectorRotate 40 0
export Q_rsqrt
proc Q_rsqrt 20 0
line 545
;537:
;538://============================================================================
;539:
;540:#if !idppc
;541:/*
;542:** float q_rsqrt( float number )
;543:*/
;544:float Q_rsqrt( float number )
;545:{
line 551
;546:	union {
;547:		float f;
;548:		int i;
;549:	} t;
;550:	float x2, y;
;551:	const float threehalfs = 1.5F;
ADDRLP4 12
CNSTF4 1069547520
ASGNF4
line 553
;552:
;553:	x2 = number * 0.5F;
ADDRLP4 8
CNSTF4 1056964608
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
line 554
;554:	t.f  = number;
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
line 555
;555:	t.i  = 0x5f3759df - ( t.i >> 1 );               // what the fuck?
ADDRLP4 4
CNSTI4 1597463007
ADDRLP4 4
INDIRI4
CNSTI4 1
RSHI4
SUBI4
ASGNI4
line 556
;556:	y  = t.f;
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 557
;557:	y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 560
;558://	y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed
;559:
;560:	return y;
ADDRLP4 0
INDIRF4
RETF4
LABELV $204
endproc Q_rsqrt 20 0
export Q_fabs
proc Q_fabs 4 0
line 563
;561:}
;562:
;563:float Q_fabs( float f ) {
line 564
;564:	int tmp = * ( int * ) &f;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 565
;565:	tmp &= 0x7FFFFFFF;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2147483647
BANDI4
ASGNI4
line 566
;566:	return * ( float * ) &tmp;
ADDRLP4 0
INDIRF4
RETF4
LABELV $206
endproc Q_fabs 4 0
export LerpAngle
proc LerpAngle 8 0
line 578
;567:}
;568:#endif
;569:
;570://============================================================
;571:
;572:/*
;573:===============
;574:LerpAngle
;575:
;576:===============
;577:*/
;578:float LerpAngle (float from, float to, float frac) {
line 581
;579:	float	a;
;580:
;581:	if ( to - from > 180 ) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
CNSTF4 1127481344
LEF4 $208
line 582
;582:		to -= 360;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 583
;583:	}
LABELV $208
line 584
;584:	if ( to - from < -180 ) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
CNSTF4 3274964992
GEF4 $210
line 585
;585:		to += 360;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 586
;586:	}
LABELV $210
line 587
;587:	a = from + frac * (to - from);
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 589
;588:
;589:	return a;
ADDRLP4 0
INDIRF4
RETF4
LABELV $207
endproc LerpAngle 8 0
export AngleSubtract
proc AngleSubtract 4 0
line 600
;590:}
;591:
;592:
;593:/*
;594:=================
;595:AngleSubtract
;596:
;597:Always returns a value from -180 to 180
;598:=================
;599:*/
;600:float	AngleSubtract( float a1, float a2 ) {
line 603
;601:	float	a;
;602:
;603:	a = a1 - a2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $214
JUMPV
LABELV $213
line 604
;604:	while ( a > 180 ) {
line 605
;605:		a -= 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 606
;606:	}
LABELV $214
line 604
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
GTF4 $213
ADDRGP4 $217
JUMPV
LABELV $216
line 607
;607:	while ( a < -180 ) {
line 608
;608:		a += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 609
;609:	}
LABELV $217
line 607
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
LTF4 $216
line 610
;610:	return a;
ADDRLP4 0
INDIRF4
RETF4
LABELV $212
endproc AngleSubtract 4 0
export AnglesSubtract
proc AnglesSubtract 20 8
line 614
;611:}
;612:
;613:
;614:void AnglesSubtract( vec3_t v1, vec3_t v2, vec3_t v3 ) {
line 615
;615:	v3[0] = AngleSubtract( v1[0], v2[0] );
ADDRFP4 0
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRF4
ASGNF4
line 616
;616:	v3[1] = AngleSubtract( v1[1], v2[1] );
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 617
;617:	v3[2] = AngleSubtract( v1[2], v2[2] );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 618
;618:}
LABELV $219
endproc AnglesSubtract 20 8
export AngleMod
proc AngleMod 0 0
line 621
;619:
;620:
;621:float	AngleMod(float a) {
line 622
;622:	a = (360.0/65536) * ((int)(a*(65536/360.0)) & 65535);
ADDRFP4 0
CNSTF4 1001652224
CNSTF4 1127615329
ADDRFP4 0
INDIRF4
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
MULF4
ASGNF4
line 623
;623:	return a;
ADDRFP4 0
INDIRF4
RETF4
LABELV $220
endproc AngleMod 0 0
export AngleNormalize360
proc AngleNormalize360 0 0
line 634
;624:}
;625:
;626:
;627:/*
;628:=================
;629:AngleNormalize360
;630:
;631:returns angle normalized to the range [0 <= angle < 360]
;632:=================
;633:*/
;634:float AngleNormalize360 ( float angle ) {
line 635
;635:	return (360.0 / 65536) * ((int)(angle * (65536 / 360.0)) & 65535);
CNSTF4 1001652224
CNSTF4 1127615329
ADDRFP4 0
INDIRF4
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
CVIF4 4
MULF4
RETF4
LABELV $221
endproc AngleNormalize360 0 0
export AngleNormalize180
proc AngleNormalize180 4 4
line 646
;636:}
;637:
;638:
;639:/*
;640:=================
;641:AngleNormalize180
;642:
;643:returns angle normalized to the range [-180 < angle <= 180]
;644:=================
;645:*/
;646:float AngleNormalize180 ( float angle ) {
line 647
;647:	angle = AngleNormalize360( angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 0
INDIRF4
ASGNF4
line 648
;648:	if ( angle > 180.0 ) {
ADDRFP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $223
line 649
;649:		angle -= 360.0;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 650
;650:	}
LABELV $223
line 651
;651:	return angle;
ADDRFP4 0
INDIRF4
RETF4
LABELV $222
endproc AngleNormalize180 4 4
export AngleDelta
proc AngleDelta 4 4
line 662
;652:}
;653:
;654:
;655:/*
;656:=================
;657:AngleDelta
;658:
;659:returns the normalized delta from angle1 to angle2
;660:=================
;661:*/
;662:float AngleDelta ( float angle1, float angle2 ) {
line 663
;663:	return AngleNormalize180( angle1 - angle2 );
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
RETF4
LABELV $225
endproc AngleDelta 4 4
export SetPlaneSignbits
proc SetPlaneSignbits 8 0
line 675
;664:}
;665:
;666:
;667://============================================================
;668:
;669:
;670:/*
;671:=================
;672:SetPlaneSignbits
;673:=================
;674:*/
;675:void SetPlaneSignbits (cplane_t *out) {
line 679
;676:	int	bits, j;
;677:
;678:	// for fast box on planeside test
;679:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 680
;680:	for (j=0 ; j<3 ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $227
line 681
;681:		if (out->normal[j] < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $231
line 682
;682:			bits |= 1<<j;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 683
;683:		}
LABELV $231
line 684
;684:	}
LABELV $228
line 680
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $227
line 685
;685:	out->signbits = bits;
ADDRFP4 0
INDIRP4
CNSTI4 17
ADDP4
ADDRLP4 4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 686
;686:}
LABELV $226
endproc SetPlaneSignbits 8 0
export BoxOnPlaneSide
proc BoxOnPlaneSide 280 0
line 733
;687:
;688:
;689:/*
;690:==================
;691:BoxOnPlaneSide
;692:
;693:Returns 1, 2, or 1 + 2
;694:
;695:// this is the slow, general version
;696:int BoxOnPlaneSide2 (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
;697:{
;698:	int		i;
;699:	float	dist1, dist2;
;700:	int		sides;
;701:	vec3_t	corners[2];
;702:
;703:	for (i=0 ; i<3 ; i++)
;704:	{
;705:		if (p->normal[i] < 0)
;706:		{
;707:			corners[0][i] = emins[i];
;708:			corners[1][i] = emaxs[i];
;709:		}
;710:		else
;711:		{
;712:			corners[1][i] = emins[i];
;713:			corners[0][i] = emaxs[i];
;714:		}
;715:	}
;716:	dist1 = DotProduct (p->normal, corners[0]) - p->dist;
;717:	dist2 = DotProduct (p->normal, corners[1]) - p->dist;
;718:	sides = 0;
;719:	if (dist1 >= 0)
;720:		sides = 1;
;721:	if (dist2 < 0)
;722:		sides |= 2;
;723:
;724:	return sides;
;725:}
;726:
;727:==================
;728:*/
;729:
;730:#if !id386
;731:
;732:int BoxOnPlaneSide (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
;733:{
line 738
;734:	float	dist1, dist2;
;735:	int		sides;
;736:
;737:// fast axial cases
;738:	if (p->type < 3)
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRU1
CVUI4 1
CNSTI4 3
GEI4 $234
line 739
;739:	{
line 740
;740:		if (p->dist <= emins[p->type])
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
INDIRU1
CVUI4 1
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $236
line 741
;741:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $233
JUMPV
LABELV $236
line 742
;742:		if (p->dist >= emaxs[p->type])
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRU1
CVUI4 1
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
LTF4 $238
line 743
;743:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $233
JUMPV
LABELV $238
line 744
;744:		return 3;
CNSTI4 3
RETI4
ADDRGP4 $233
JUMPV
LABELV $234
line 748
;745:	}
;746:
;747:// general case
;748:	switch (p->signbits)
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 17
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $240
ADDRLP4 12
INDIRI4
CNSTI4 7
GTI4 $240
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $251
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $251
address $243
address $244
address $245
address $246
address $247
address $248
address $249
address $250
code
line 749
;749:	{
LABELV $243
line 751
;750:	case 0:
;751:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 752
;752:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 753
;753:		break;
ADDRGP4 $241
JUMPV
LABELV $244
line 755
;754:	case 1:
;755:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 756
;756:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 68
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 68
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 68
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 757
;757:		break;
ADDRGP4 $241
JUMPV
LABELV $245
line 759
;758:	case 2:
;759:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 84
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRLP4 96
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRF4
MULF4
ADDRLP4 84
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 760
;760:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 100
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 4
ASGNI4
ADDRLP4 112
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ADDRLP4 100
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 100
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 761
;761:		break;
ADDRGP4 $241
JUMPV
LABELV $246
line 763
;762:	case 3:
;763:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 116
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 4
ASGNI4
ADDRLP4 128
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 120
INDIRP4
INDIRF4
MULF4
ADDRLP4 116
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 116
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 764
;764:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 136
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 140
CNSTI4 4
ASGNI4
ADDRLP4 144
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 136
INDIRP4
INDIRF4
MULF4
ADDRLP4 132
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
ADDRLP4 136
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 132
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 765
;765:		break;
ADDRGP4 $241
JUMPV
LABELV $247
line 767
;766:	case 4:
;767:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 148
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 156
CNSTI4 4
ASGNI4
ADDRLP4 160
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
INDIRF4
MULF4
ADDRLP4 148
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 148
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 768
;768:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
CNSTI4 4
ASGNI4
ADDRLP4 176
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 168
INDIRP4
INDIRF4
MULF4
ADDRLP4 164
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRF4
ADDRLP4 168
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 164
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 769
;769:		break;
ADDRGP4 $241
JUMPV
LABELV $248
line 771
;770:	case 5:
;771:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emins[2];
ADDRLP4 180
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
CNSTI4 4
ASGNI4
ADDRLP4 192
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 184
INDIRP4
INDIRF4
MULF4
ADDRLP4 180
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 180
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRLP4 184
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 772
;772:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emaxs[2];
ADDRLP4 196
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 200
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 204
CNSTI4 4
ASGNI4
ADDRLP4 208
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 200
INDIRP4
INDIRF4
MULF4
ADDRLP4 196
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 196
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRF4
ADDRLP4 200
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 773
;773:		break;
ADDRGP4 $241
JUMPV
LABELV $249
line 775
;774:	case 6:
;775:		dist1 = p->normal[0]*emaxs[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 212
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 216
CNSTI4 4
ASGNI4
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 212
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 212
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 212
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 776
;776:		dist2 = p->normal[0]*emins[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 232
CNSTI4 4
ASGNI4
ADDRLP4 236
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 240
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 228
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
MULF4
ADDRLP4 228
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 228
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 777
;777:		break;
ADDRGP4 $241
JUMPV
LABELV $250
line 779
;778:	case 7:
;779:		dist1 = p->normal[0]*emins[0] + p->normal[1]*emins[1] + p->normal[2]*emins[2];
ADDRLP4 244
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 4
ASGNI4
ADDRLP4 256
CNSTI4 8
ASGNI4
ADDRLP4 4
ADDRLP4 244
INDIRP4
INDIRF4
ADDRLP4 248
INDIRP4
INDIRF4
MULF4
ADDRLP4 244
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRF4
ADDRLP4 248
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 244
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRF4
ADDRLP4 248
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 780
;780:		dist2 = p->normal[0]*emaxs[0] + p->normal[1]*emaxs[1] + p->normal[2]*emaxs[2];
ADDRLP4 260
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 268
CNSTI4 4
ASGNI4
ADDRLP4 272
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 260
INDIRP4
INDIRF4
ADDRLP4 264
INDIRP4
INDIRF4
MULF4
ADDRLP4 260
INDIRP4
ADDRLP4 268
INDIRI4
ADDP4
INDIRF4
ADDRLP4 264
INDIRP4
ADDRLP4 268
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 260
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
INDIRF4
ADDRLP4 264
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 781
;781:		break;
ADDRGP4 $241
JUMPV
LABELV $240
line 783
;782:	default:
;783:		dist1 = dist2 = 0;		// shut up compiler
ADDRLP4 276
CNSTF4 0
ASGNF4
ADDRLP4 8
ADDRLP4 276
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 276
INDIRF4
ASGNF4
line 784
;784:		break;
LABELV $241
line 787
;785:	}
;786:
;787:	sides = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 788
;788:	if (dist1 >= p->dist)
ADDRLP4 4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
LTF4 $252
line 789
;789:		sides = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $252
line 790
;790:	if (dist2 < p->dist)
ADDRLP4 8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
GEF4 $254
line 791
;791:		sides |= 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $254
line 793
;792:
;793:	return sides;
ADDRLP4 0
INDIRI4
RETI4
LABELV $233
endproc BoxOnPlaneSide 280 0
export RadiusFromBounds
proc RadiusFromBounds 36 4
line 1038
;794:}
;795:#elif __GNUC__
;796:// use matha.s
;797:#else
;798:#pragma warning( disable: 4035 )
;799:
;800:__declspec( naked ) int BoxOnPlaneSide (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
;801:{
;802:	static int bops_initialized;
;803:	static int Ljmptab[8];
;804:
;805:	__asm {
;806:
;807:		push ebx
;808:			
;809:		cmp bops_initialized, 1
;810:		je  initialized
;811:		mov bops_initialized, 1
;812:		
;813:		mov Ljmptab[0*4], offset Lcase0
;814:		mov Ljmptab[1*4], offset Lcase1
;815:		mov Ljmptab[2*4], offset Lcase2
;816:		mov Ljmptab[3*4], offset Lcase3
;817:		mov Ljmptab[4*4], offset Lcase4
;818:		mov Ljmptab[5*4], offset Lcase5
;819:		mov Ljmptab[6*4], offset Lcase6
;820:		mov Ljmptab[7*4], offset Lcase7
;821:			
;822:initialized:
;823:
;824:		mov edx,dword ptr[4+12+esp]
;825:		mov ecx,dword ptr[4+4+esp]
;826:		xor eax,eax
;827:		mov ebx,dword ptr[4+8+esp]
;828:		mov al,byte ptr[17+edx]
;829:		cmp al,8
;830:		jge Lerror
;831:		fld dword ptr[0+edx]
;832:		fld st(0)
;833:		jmp dword ptr[Ljmptab+eax*4]
;834:Lcase0:
;835:		fmul dword ptr[ebx]
;836:		fld dword ptr[0+4+edx]
;837:		fxch st(2)
;838:		fmul dword ptr[ecx]
;839:		fxch st(2)
;840:		fld st(0)
;841:		fmul dword ptr[4+ebx]
;842:		fld dword ptr[0+8+edx]
;843:		fxch st(2)
;844:		fmul dword ptr[4+ecx]
;845:		fxch st(2)
;846:		fld st(0)
;847:		fmul dword ptr[8+ebx]
;848:		fxch st(5)
;849:		faddp st(3),st(0)
;850:		fmul dword ptr[8+ecx]
;851:		fxch st(1)
;852:		faddp st(3),st(0)
;853:		fxch st(3)
;854:		faddp st(2),st(0)
;855:		jmp LSetSides
;856:Lcase1:
;857:		fmul dword ptr[ecx]
;858:		fld dword ptr[0+4+edx]
;859:		fxch st(2)
;860:		fmul dword ptr[ebx]
;861:		fxch st(2)
;862:		fld st(0)
;863:		fmul dword ptr[4+ebx]
;864:		fld dword ptr[0+8+edx]
;865:		fxch st(2)
;866:		fmul dword ptr[4+ecx]
;867:		fxch st(2)
;868:		fld st(0)
;869:		fmul dword ptr[8+ebx]
;870:		fxch st(5)
;871:		faddp st(3),st(0)
;872:		fmul dword ptr[8+ecx]
;873:		fxch st(1)
;874:		faddp st(3),st(0)
;875:		fxch st(3)
;876:		faddp st(2),st(0)
;877:		jmp LSetSides
;878:Lcase2:
;879:		fmul dword ptr[ebx]
;880:		fld dword ptr[0+4+edx]
;881:		fxch st(2)
;882:		fmul dword ptr[ecx]
;883:		fxch st(2)
;884:		fld st(0)
;885:		fmul dword ptr[4+ecx]
;886:		fld dword ptr[0+8+edx]
;887:		fxch st(2)
;888:		fmul dword ptr[4+ebx]
;889:		fxch st(2)
;890:		fld st(0)
;891:		fmul dword ptr[8+ebx]
;892:		fxch st(5)
;893:		faddp st(3),st(0)
;894:		fmul dword ptr[8+ecx]
;895:		fxch st(1)
;896:		faddp st(3),st(0)
;897:		fxch st(3)
;898:		faddp st(2),st(0)
;899:		jmp LSetSides
;900:Lcase3:
;901:		fmul dword ptr[ecx]
;902:		fld dword ptr[0+4+edx]
;903:		fxch st(2)
;904:		fmul dword ptr[ebx]
;905:		fxch st(2)
;906:		fld st(0)
;907:		fmul dword ptr[4+ecx]
;908:		fld dword ptr[0+8+edx]
;909:		fxch st(2)
;910:		fmul dword ptr[4+ebx]
;911:		fxch st(2)
;912:		fld st(0)
;913:		fmul dword ptr[8+ebx]
;914:		fxch st(5)
;915:		faddp st(3),st(0)
;916:		fmul dword ptr[8+ecx]
;917:		fxch st(1)
;918:		faddp st(3),st(0)
;919:		fxch st(3)
;920:		faddp st(2),st(0)
;921:		jmp LSetSides
;922:Lcase4:
;923:		fmul dword ptr[ebx]
;924:		fld dword ptr[0+4+edx]
;925:		fxch st(2)
;926:		fmul dword ptr[ecx]
;927:		fxch st(2)
;928:		fld st(0)
;929:		fmul dword ptr[4+ebx]
;930:		fld dword ptr[0+8+edx]
;931:		fxch st(2)
;932:		fmul dword ptr[4+ecx]
;933:		fxch st(2)
;934:		fld st(0)
;935:		fmul dword ptr[8+ecx]
;936:		fxch st(5)
;937:		faddp st(3),st(0)
;938:		fmul dword ptr[8+ebx]
;939:		fxch st(1)
;940:		faddp st(3),st(0)
;941:		fxch st(3)
;942:		faddp st(2),st(0)
;943:		jmp LSetSides
;944:Lcase5:
;945:		fmul dword ptr[ecx]
;946:		fld dword ptr[0+4+edx]
;947:		fxch st(2)
;948:		fmul dword ptr[ebx]
;949:		fxch st(2)
;950:		fld st(0)
;951:		fmul dword ptr[4+ebx]
;952:		fld dword ptr[0+8+edx]
;953:		fxch st(2)
;954:		fmul dword ptr[4+ecx]
;955:		fxch st(2)
;956:		fld st(0)
;957:		fmul dword ptr[8+ecx]
;958:		fxch st(5)
;959:		faddp st(3),st(0)
;960:		fmul dword ptr[8+ebx]
;961:		fxch st(1)
;962:		faddp st(3),st(0)
;963:		fxch st(3)
;964:		faddp st(2),st(0)
;965:		jmp LSetSides
;966:Lcase6:
;967:		fmul dword ptr[ebx]
;968:		fld dword ptr[0+4+edx]
;969:		fxch st(2)
;970:		fmul dword ptr[ecx]
;971:		fxch st(2)
;972:		fld st(0)
;973:		fmul dword ptr[4+ecx]
;974:		fld dword ptr[0+8+edx]
;975:		fxch st(2)
;976:		fmul dword ptr[4+ebx]
;977:		fxch st(2)
;978:		fld st(0)
;979:		fmul dword ptr[8+ecx]
;980:		fxch st(5)
;981:		faddp st(3),st(0)
;982:		fmul dword ptr[8+ebx]
;983:		fxch st(1)
;984:		faddp st(3),st(0)
;985:		fxch st(3)
;986:		faddp st(2),st(0)
;987:		jmp LSetSides
;988:Lcase7:
;989:		fmul dword ptr[ecx]
;990:		fld dword ptr[0+4+edx]
;991:		fxch st(2)
;992:		fmul dword ptr[ebx]
;993:		fxch st(2)
;994:		fld st(0)
;995:		fmul dword ptr[4+ecx]
;996:		fld dword ptr[0+8+edx]
;997:		fxch st(2)
;998:		fmul dword ptr[4+ebx]
;999:		fxch st(2)
;1000:		fld st(0)
;1001:		fmul dword ptr[8+ecx]
;1002:		fxch st(5)
;1003:		faddp st(3),st(0)
;1004:		fmul dword ptr[8+ebx]
;1005:		fxch st(1)
;1006:		faddp st(3),st(0)
;1007:		fxch st(3)
;1008:		faddp st(2),st(0)
;1009:LSetSides:
;1010:		faddp st(2),st(0)
;1011:		fcomp dword ptr[12+edx]
;1012:		xor ecx,ecx
;1013:		fnstsw ax
;1014:		fcomp dword ptr[12+edx]
;1015:		and ah,1
;1016:		xor ah,1
;1017:		add cl,ah
;1018:		fnstsw ax
;1019:		and ah,1
;1020:		add ah,ah
;1021:		add cl,ah
;1022:		pop ebx
;1023:		mov eax,ecx
;1024:		ret
;1025:Lerror:
;1026:		int 3
;1027:	}
;1028:}
;1029:#pragma warning( default: 4035 )
;1030:
;1031:#endif
;1032:
;1033:/*
;1034:=================
;1035:RadiusFromBounds
;1036:=================
;1037:*/
;1038:float RadiusFromBounds( const vec3_t mins, const vec3_t maxs ) {
line 1043
;1039:	int		i;
;1040:	vec3_t	corner;
;1041:	float	a, b;
;1042:
;1043:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $257
line 1044
;1044:		a = fabs( mins[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 1045
;1045:		b = fabs( maxs[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 28
INDIRF4
ASGNF4
line 1046
;1046:		corner[i] = a > b ? a : b;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $262
ADDRLP4 32
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $263
JUMPV
LABELV $262
ADDRLP4 32
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $263
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1047
;1047:	}
LABELV $258
line 1043
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $257
line 1049
;1048:
;1049:	return VectorLength (corner);
ADDRLP4 12
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
RETF4
LABELV $256
endproc RadiusFromBounds 36 4
export ClearBounds
proc ClearBounds 16 0
line 1053
;1050:}
;1051:
;1052:
;1053:void ClearBounds( vec3_t mins, vec3_t maxs ) {
line 1054
;1054:	mins[0] = mins[1] = mins[2] = 99999;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1203982208
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1055
;1055:	maxs[0] = maxs[1] = maxs[2] = -99999;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 3351465856
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1056
;1056:}
LABELV $264
endproc ClearBounds 16 0
export AddPointToBounds
proc AddPointToBounds 20 0
line 1058
;1057:
;1058:void AddPointToBounds( const vec3_t v, vec3_t mins, vec3_t maxs ) {
line 1059
;1059:	if ( v[0] < mins[0] ) {
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
GEF4 $266
line 1060
;1060:		mins[0] = v[0];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1061
;1061:	}
LABELV $266
line 1062
;1062:	if ( v[0] > maxs[0]) {
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
LEF4 $268
line 1063
;1063:		maxs[0] = v[0];
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1064
;1064:	}
LABELV $268
line 1066
;1065:
;1066:	if ( v[1] < mins[1] ) {
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
GEF4 $270
line 1067
;1067:		mins[1] = v[1];
ADDRLP4 4
CNSTI4 4
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
INDIRF4
ASGNF4
line 1068
;1068:	}
LABELV $270
line 1069
;1069:	if ( v[1] > maxs[1]) {
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
LEF4 $272
line 1070
;1070:		maxs[1] = v[1];
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1071
;1071:	}
LABELV $272
line 1073
;1072:
;1073:	if ( v[2] < mins[2] ) {
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
GEF4 $274
line 1074
;1074:		mins[2] = v[2];
ADDRLP4 12
CNSTI4 8
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
line 1075
;1075:	}
LABELV $274
line 1076
;1076:	if ( v[2] > maxs[2]) {
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LEF4 $276
line 1077
;1077:		maxs[2] = v[2];
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1078
;1078:	}
LABELV $276
line 1079
;1079:}
LABELV $265
endproc AddPointToBounds 20 0
export BoundsIntersect
proc BoundsIntersect 24 0
line 1083
;1080:
;1081:qboolean BoundsIntersect(const vec3_t mins, const vec3_t maxs,
;1082:		const vec3_t mins2, const vec3_t maxs2)
;1083:{
line 1084
;1084:	if ( maxs[0] < mins2[0] ||
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
LTF4 $285
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
LTF4 $285
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LTF4 $285
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
GTF4 $285
ADDRLP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
GTF4 $285
ADDRLP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LEF4 $279
LABELV $285
line 1090
;1085:		maxs[1] < mins2[1] ||
;1086:		maxs[2] < mins2[2] ||
;1087:		mins[0] > maxs2[0] ||
;1088:		mins[1] > maxs2[1] ||
;1089:		mins[2] > maxs2[2])
;1090:	{
line 1091
;1091:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $278
JUMPV
LABELV $279
line 1094
;1092:	}
;1093:
;1094:	return qtrue;
CNSTI4 1
RETI4
LABELV $278
endproc BoundsIntersect 24 0
export BoundsIntersectSphere
proc BoundsIntersectSphere 36 0
line 1099
;1095:}
;1096:
;1097:qboolean BoundsIntersectSphere(const vec3_t mins, const vec3_t maxs,
;1098:		const vec3_t origin, vec_t radius)
;1099:{
line 1100
;1100:	if ( origin[0] - radius > maxs[0] ||
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 12
INDIRP4
INDIRF4
GTF4 $293
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ADDRLP4 16
INDIRP4
INDIRF4
LTF4 $293
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
GTF4 $293
ADDRLP4 24
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
LTF4 $293
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ADDRLP4 12
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
GTF4 $293
ADDRLP4 32
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
GEF4 $287
LABELV $293
line 1106
;1101:		origin[0] + radius < mins[0] ||
;1102:		origin[1] - radius > maxs[1] ||
;1103:		origin[1] + radius < mins[1] ||
;1104:		origin[2] - radius > maxs[2] ||
;1105:		origin[2] + radius < mins[2])
;1106:	{
line 1107
;1107:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $286
JUMPV
LABELV $287
line 1110
;1108:	}
;1109:
;1110:	return qtrue;
CNSTI4 1
RETI4
LABELV $286
endproc BoundsIntersectSphere 36 0
export BoundsIntersectPoint
proc BoundsIntersectPoint 32 0
line 1115
;1111:}
;1112:
;1113:qboolean BoundsIntersectPoint(const vec3_t mins, const vec3_t maxs,
;1114:		const vec3_t origin)
;1115:{
line 1116
;1116:	if ( origin[0] > maxs[0] ||
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
GTF4 $301
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRP4
INDIRF4
LTF4 $301
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
GTF4 $301
ADDRLP4 20
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
LTF4 $301
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
GTF4 $301
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
GEF4 $295
LABELV $301
line 1122
;1117:		origin[0] < mins[0] ||
;1118:		origin[1] > maxs[1] ||
;1119:		origin[1] < mins[1] ||
;1120:		origin[2] > maxs[2] ||
;1121:		origin[2] < mins[2])
;1122:	{
line 1123
;1123:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $295
line 1126
;1124:	}
;1125:
;1126:	return qtrue;
CNSTI4 1
RETI4
LABELV $294
endproc BoundsIntersectPoint 32 0
export VectorNormalize
proc VectorNormalize 40 4
line 1129
;1127:}
;1128:
;1129:vec_t VectorNormalize( vec3_t v ) {
line 1133
;1130:	// NOTE: TTimo - Apple G4 altivec source uses double?
;1131:	float	length, ilength;
;1132:
;1133:	length = v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1134
;1134:	length = sqrt (length);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1136
;1135:
;1136:	if ( length ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $303
line 1137
;1137:		ilength = 1/length;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 1138
;1138:		v[0] *= ilength;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1139
;1139:		v[1] *= ilength;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1140
;1140:		v[2] *= ilength;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1141
;1141:	}
LABELV $303
line 1143
;1142:		
;1143:	return length;
ADDRLP4 0
INDIRF4
RETF4
LABELV $302
endproc VectorNormalize 40 4
export VectorNormalize2
proc VectorNormalize2 36 4
line 1146
;1144:}
;1145:
;1146:vec_t VectorNormalize2( const vec3_t v, vec3_t out) {
line 1149
;1147:	float	length, ilength;
;1148:
;1149:	length = v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 1150
;1150:	length = sqrt (length);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1152
;1151:
;1152:	if (length)
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $306
line 1153
;1153:	{
line 1154
;1154:		ilength = 1/length;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 1155
;1155:		out[0] = v[0]*ilength;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1156
;1156:		out[1] = v[1]*ilength;
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1157
;1157:		out[2] = v[2]*ilength;
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 1158
;1158:	} else {
ADDRGP4 $307
JUMPV
LABELV $306
line 1159
;1159:		VectorClear( out );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1160
;1160:	}
LABELV $307
line 1162
;1161:		
;1162:	return length;
ADDRLP4 0
INDIRF4
RETF4
LABELV $305
endproc VectorNormalize2 36 4
export _VectorMA
proc _VectorMA 8 0
line 1166
;1163:
;1164:}
;1165:
;1166:void _VectorMA( const vec3_t veca, float scale, const vec3_t vecb, vec3_t vecc) {
line 1167
;1167:	vecc[0] = veca[0] + scale*vecb[0];
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1168
;1168:	vecc[1] = veca[1] + scale*vecb[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1169
;1169:	vecc[2] = veca[2] + scale*vecb[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1170
;1170:}
LABELV $308
endproc _VectorMA 8 0
export _DotProduct
proc _DotProduct 16 0
line 1173
;1171:
;1172:
;1173:vec_t _DotProduct( const vec3_t v1, const vec3_t v2 ) {
line 1174
;1174:	return v1[0]*v2[0] + v1[1]*v2[1] + v1[2]*v2[2];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
RETF4
LABELV $309
endproc _DotProduct 16 0
export _VectorSubtract
proc _VectorSubtract 8 0
line 1177
;1175:}
;1176:
;1177:void _VectorSubtract( const vec3_t veca, const vec3_t vecb, vec3_t out ) {
line 1178
;1178:	out[0] = veca[0]-vecb[0];
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
SUBF4
ASGNF4
line 1179
;1179:	out[1] = veca[1]-vecb[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1180
;1180:	out[2] = veca[2]-vecb[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1181
;1181:}
LABELV $310
endproc _VectorSubtract 8 0
export _VectorAdd
proc _VectorAdd 8 0
line 1183
;1182:
;1183:void _VectorAdd( const vec3_t veca, const vec3_t vecb, vec3_t out ) {
line 1184
;1184:	out[0] = veca[0]+vecb[0];
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 1185
;1185:	out[1] = veca[1]+vecb[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1186
;1186:	out[2] = veca[2]+vecb[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1187
;1187:}
LABELV $311
endproc _VectorAdd 8 0
export _VectorCopy
proc _VectorCopy 8 0
line 1189
;1188:
;1189:void _VectorCopy( const vec3_t in, vec3_t out ) {
line 1190
;1190:	out[0] = in[0];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1191
;1191:	out[1] = in[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 1192
;1192:	out[2] = in[2];
ADDRLP4 4
CNSTI4 8
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
INDIRF4
ASGNF4
line 1193
;1193:}
LABELV $312
endproc _VectorCopy 8 0
export _VectorScale
proc _VectorScale 8 0
line 1195
;1194:
;1195:void _VectorScale( const vec3_t in, vec_t scale, vec3_t out ) {
line 1196
;1196:	out[0] = in[0]*scale;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1197
;1197:	out[1] = in[1]*scale;
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1198
;1198:	out[2] = in[2]*scale;
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1199
;1199:}
LABELV $313
endproc _VectorScale 8 0
export Vector4Scale
proc Vector4Scale 12 0
line 1201
;1200:
;1201:void Vector4Scale( const vec4_t in, vec_t scale, vec4_t out ) {
line 1202
;1202:	out[0] = in[0]*scale;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1203
;1203:	out[1] = in[1]*scale;
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1204
;1204:	out[2] = in[2]*scale;
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1205
;1205:	out[3] = in[3]*scale;
ADDRLP4 8
CNSTI4 12
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 1206
;1206:}
LABELV $314
endproc Vector4Scale 12 0
export Q_log2
proc Q_log2 8 0
line 1209
;1207:
;1208:
;1209:int Q_log2( int val ) {
line 1212
;1210:	int answer;
;1211:
;1212:	answer = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $316
line 1213
;1213:	while ( ( val>>=1 ) != 0 ) {
line 1214
;1214:		answer++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1215
;1215:	}
LABELV $317
line 1213
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
ADDRFP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $316
line 1216
;1216:	return answer;
ADDRLP4 0
INDIRI4
RETI4
LABELV $315
endproc Q_log2 8 0
export MatrixMultiply
proc MatrixMultiply 104 0
line 1245
;1217:}
;1218:
;1219:
;1220:
;1221:/*
;1222:=================
;1223:PlaneTypeForNormal
;1224:=================
;1225:*/
;1226:/*
;1227:int	PlaneTypeForNormal (vec3_t normal) {
;1228:	if ( normal[0] == 1.0 )
;1229:		return PLANE_X;
;1230:	if ( normal[1] == 1.0 )
;1231:		return PLANE_Y;
;1232:	if ( normal[2] == 1.0 )
;1233:		return PLANE_Z;
;1234:	
;1235:	return PLANE_NON_AXIAL;
;1236:}
;1237:*/
;1238:
;1239:
;1240:/*
;1241:================
;1242:MatrixMultiply
;1243:================
;1244:*/
;1245:void MatrixMultiply(float in1[3][3], float in2[3][3], float out[3][3]) {
line 1246
;1246:	out[0][0] = in1[0][0] * in2[0][0] + in1[0][1] * in2[1][0] +
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1248
;1247:				in1[0][2] * in2[2][0];
;1248:	out[0][1] = in1[0][0] * in2[0][1] + in1[0][1] * in2[1][1] +
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1250
;1249:				in1[0][2] * in2[2][1];
;1250:	out[0][2] = in1[0][0] * in2[0][2] + in1[0][1] * in2[1][2] +
ADDRLP4 20
CNSTI4 8
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1252
;1251:				in1[0][2] * in2[2][2];
;1252:	out[1][0] = in1[1][0] * in2[0][0] + in1[1][1] * in2[1][0] +
ADDRLP4 32
CNSTI4 12
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ADDRLP4 36
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1254
;1253:				in1[1][2] * in2[2][0];
;1254:	out[1][1] = in1[1][0] * in2[0][1] + in1[1][1] * in2[1][1] +
ADDRLP4 44
CNSTI4 16
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1256
;1255:				in1[1][2] * in2[2][1];
;1256:	out[1][2] = in1[1][0] * in2[0][2] + in1[1][1] * in2[1][2] +
ADDRLP4 56
CNSTI4 20
ASGNI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 60
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1258
;1257:				in1[1][2] * in2[2][2];
;1258:	out[2][0] = in1[2][0] * in2[0][0] + in1[2][1] * in2[1][0] +
ADDRLP4 68
CNSTI4 24
ASGNI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRLP4 72
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
INDIRF4
MULF4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1260
;1259:				in1[2][2] * in2[2][0];
;1260:	out[2][1] = in1[2][0] * in2[0][1] + in1[2][1] * in2[1][1] +
ADDRLP4 80
CNSTI4 28
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 84
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1262
;1261:				in1[2][2] * in2[2][1];
;1262:	out[2][2] = in1[2][0] * in2[0][2] + in1[2][1] * in2[1][2] +
ADDRLP4 92
CNSTI4 32
ASGNI4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 96
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1264
;1263:				in1[2][2] * in2[2][2];
;1264:}
LABELV $319
endproc MatrixMultiply 104 0
bss
align 4
LABELV $321
skip 4
align 4
LABELV $322
skip 4
align 4
LABELV $323
skip 4
align 4
LABELV $324
skip 4
align 4
LABELV $325
skip 4
align 4
LABELV $326
skip 4
export AngleVectors
code
proc AngleVectors 36 4
line 1267
;1265:
;1266:
;1267:void AngleVectors( const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up) {
line 1272
;1268:	float		angle;
;1269:	static float		sr, sp, sy, cr, cp, cy;
;1270:	// static to help MS compiler fp bugs
;1271:
;1272:	angle = angles[YAW] * (M_PI*2 / 360);
ADDRLP4 0
CNSTF4 1016003125
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1273
;1273:	sy = sin(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 $323
ADDRLP4 4
INDIRF4
ASGNF4
line 1274
;1274:	cy = cos(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 $326
ADDRLP4 8
INDIRF4
ASGNF4
line 1275
;1275:	angle = angles[PITCH] * (M_PI*2 / 360);
ADDRLP4 0
CNSTF4 1016003125
ADDRFP4 0
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1276
;1276:	sp = sin(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 $322
ADDRLP4 12
INDIRF4
ASGNF4
line 1277
;1277:	cp = cos(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 $325
ADDRLP4 16
INDIRF4
ASGNF4
line 1278
;1278:	angle = angles[ROLL] * (M_PI*2 / 360);
ADDRLP4 0
CNSTF4 1016003125
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1279
;1279:	sr = sin(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 sin
CALLF4
ASGNF4
ADDRGP4 $321
ADDRLP4 20
INDIRF4
ASGNF4
line 1280
;1280:	cr = cos(angle);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 $324
ADDRLP4 24
INDIRF4
ASGNF4
line 1282
;1281:
;1282:	if (forward)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
line 1283
;1283:	{
line 1284
;1284:		forward[0] = cp*cy;
ADDRFP4 4
INDIRP4
ADDRGP4 $325
INDIRF4
ADDRGP4 $326
INDIRF4
MULF4
ASGNF4
line 1285
;1285:		forward[1] = cp*sy;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $325
INDIRF4
ADDRGP4 $323
INDIRF4
MULF4
ASGNF4
line 1286
;1286:		forward[2] = -sp;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $322
INDIRF4
NEGF4
ASGNF4
line 1287
;1287:	}
LABELV $327
line 1288
;1288:	if (right)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $329
line 1289
;1289:	{
line 1290
;1290:		right[0] = (-1*sr*sp*cy+-1*cr*-sy);
ADDRLP4 28
CNSTF4 3212836864
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 28
INDIRF4
ADDRGP4 $321
INDIRF4
MULF4
ADDRGP4 $322
INDIRF4
MULF4
ADDRGP4 $326
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
ADDRGP4 $324
INDIRF4
MULF4
ADDRGP4 $323
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 1291
;1291:		right[1] = (-1*sr*sp*sy+-1*cr*cy);
ADDRLP4 32
CNSTF4 3212836864
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRF4
ADDRGP4 $321
INDIRF4
MULF4
ADDRGP4 $322
INDIRF4
MULF4
ADDRGP4 $323
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRGP4 $324
INDIRF4
MULF4
ADDRGP4 $326
INDIRF4
MULF4
ADDF4
ASGNF4
line 1292
;1292:		right[2] = -1*sr*cp;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3212836864
ADDRGP4 $321
INDIRF4
MULF4
ADDRGP4 $325
INDIRF4
MULF4
ASGNF4
line 1293
;1293:	}
LABELV $329
line 1294
;1294:	if (up)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $331
line 1295
;1295:	{
line 1296
;1296:		up[0] = (cr*sp*cy+-sr*-sy);
ADDRFP4 12
INDIRP4
ADDRGP4 $324
INDIRF4
ADDRGP4 $322
INDIRF4
MULF4
ADDRGP4 $326
INDIRF4
MULF4
ADDRGP4 $321
INDIRF4
NEGF4
ADDRGP4 $323
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 1297
;1297:		up[1] = (cr*sp*sy+-sr*cy);
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $324
INDIRF4
ADDRGP4 $322
INDIRF4
MULF4
ADDRGP4 $323
INDIRF4
MULF4
ADDRGP4 $321
INDIRF4
NEGF4
ADDRGP4 $326
INDIRF4
MULF4
ADDF4
ASGNF4
line 1298
;1298:		up[2] = cr*cp;
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $324
INDIRF4
ADDRGP4 $325
INDIRF4
MULF4
ASGNF4
line 1299
;1299:	}
LABELV $331
line 1300
;1300:}
LABELV $320
endproc AngleVectors 36 4
export PerpendicularVector
proc PerpendicularVector 36 12
line 1306
;1301:
;1302:/*
;1303:** assumes "src" is normalized
;1304:*/
;1305:void PerpendicularVector( vec3_t dst, const vec3_t src )
;1306:{
line 1309
;1307:	int	pos;
;1308:	int i;
;1309:	float minelem = 1.0F;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1315
;1310:	vec3_t tempvec;
;1311:
;1312:	/*
;1313:	** find the smallest magnitude axially aligned vector
;1314:	*/
;1315:	for ( pos = 0, i = 0; i < 3; i++ )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $337
JUMPV
LABELV $334
line 1316
;1316:	{
line 1317
;1317:		if ( fabs( src[i] ) < minelem )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $338
line 1318
;1318:		{
line 1319
;1319:			pos = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1320
;1320:			minelem = fabs( src[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 1321
;1321:		}
LABELV $338
line 1322
;1322:	}
LABELV $335
line 1315
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $337
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $334
line 1323
;1323:	tempvec[0] = tempvec[1] = tempvec[2] = 0.0F;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 1324
;1324:	tempvec[pos] = 1.0F;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1329
;1325:
;1326:	/*
;1327:	** project the point onto the plane defined by src
;1328:	*/
;1329:	ProjectPointOnPlane( dst, tempvec, src );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ProjectPointOnPlane
CALLV
pop
line 1334
;1330:
;1331:	/*
;1332:	** normalize the result
;1333:	*/
;1334:	VectorNormalize( dst );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1335
;1335:}
LABELV $333
endproc PerpendicularVector 36 12
export Q_isnan
proc Q_isnan 4 0
line 1345
;1336:
;1337:/*
;1338:================
;1339:Q_isnan
;1340:
;1341:Don't pass doubles to this
;1342:================
;1343:*/
;1344:int Q_isnan( float x )
;1345:{
line 1352
;1346:	union
;1347:	{
;1348:		float f;
;1349:		unsigned int i;
;1350:	} t;
;1351:
;1352:	t.f = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 1353
;1353:	t.i &= 0x7FFFFFFF;
ADDRLP4 0
ADDRLP4 0
INDIRU4
CNSTU4 2147483647
BANDU4
ASGNU4
line 1354
;1354:	t.i = 0x7F800000 - t.i;
ADDRLP4 0
CNSTU4 2139095040
ADDRLP4 0
INDIRU4
SUBU4
ASGNU4
line 1356
;1355:
;1356:	return (int)( (unsigned int)t.i >> 31 );
ADDRLP4 0
INDIRU4
CNSTI4 31
RSHU4
CVUI4 4
RETI4
LABELV $342
endproc Q_isnan 4 0
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
import Q_acos
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
