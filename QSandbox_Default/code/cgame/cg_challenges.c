/*
===========================================================================
Copyright (C) 2008 Poul Sander

This file is part of Open Arena source code.

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

//#include "cg_local.h"
#include "../qcommon/q_shared.h"
#include "../renderer/tr_types.h"
#include "../game/bg_public.h"
#include "../game/challenges.h"
#ifdef PARTofUI
#include "../q3_ui/ui_local.h"
#else
#include "../cgame/cg_local.h"
#endif

#define FILENAME    "challenges.dat"

//First two static variables that may only be accessed throgh functions in this file
//The challengeTable is of constant size so there is room for more challenges being added in the furture
static unsigned int challengeTable[CHALLENGES_MAX];
//We have a variable to see if the system is initialized
static qboolean challengesInitialized = qfalse;

//This function initializes the challenge system. It has no effect if the system is already intialized.
void challenges_init(void)
{
    fileHandle_t file;
    int fileLen;
    int i;

//If already initialized then do nothing
    if(challengesInitialized)
        return;

//Else open file
    fileLen = trap_FS_FOpenFile(FILENAME, &file, FS_READ);

//If the file not is big enough to contain all challenges then initialize from zero
    if(fileLen<sizeof(challengeTable))
    {
	trap_FS_FCloseFile(file); //Lets remeber to close the file before all returns
	for(i=0;i<CHALLENGES_MAX;i++)
		challengeTable[i]=0; //Init all challenges to zero
	challengesInitialized = qtrue; //Still consider the system loaded!
        return; //Not enough data to actually read
    }

//If the file is big enough:
	trap_FS_Read(challengeTable,sizeof(challengeTable),file);

trap_FS_FCloseFile(file); //Lets remember to close the file
    challengesInitialized = qtrue; //We are initialized!
    return;
}

//This functions saves the challenges. It only needs to be called once for each game. It should be called from the shutdown function
void challenges_save(void)
{
	fileHandle_t file;
	int fileStatus;
	int i;
	if(!challengesInitialized)
	{
		//The challenge system has not been initialized and therefore cannot be saved
		//CG_Printf("Challenge system not initialized.\n");
        	return;
	}
	//Open the challenges file for writing:
	fileStatus = trap_FS_FOpenFile(FILENAME, &file, FS_WRITE);
	if(fileStatus<0)
	{
		//For some reason file opening failed
                #ifndef PARTofUI
		CG_Printf("Failed to open challenges.dat for writing\n");
                #endif
		return;
	}
	for(i=0;i<CHALLENGES_MAX;i++)
	{
		//Write the table to disk
		trap_FS_Write((const void*)&challengeTable[i],sizeof(unsigned int),file);
	}

	//Always close the file in id tech 3
	trap_FS_FCloseFile(file);
	//Lets make the challenges system uninitialized since changes after this will most likely not be saved anyway.
	challengesInitialized = qfalse;
        #ifndef PARTofUI
//	CG_Printf("Wrote challenges.cfg\n");
        #endif
}

//Get the number of times a given challenge has been completed
unsigned int getChallenge(int challenge)
{
	challenges_init();
	if(challenge>=CHALLENGES_MAX)
		return 0;
	return challengeTable[challenge];
}

void addChallenge(int challenge)
{
	if(challenge>=CHALLENGES_MAX)
	{
                #ifndef PARTofUI
		CG_Printf("Challenge #%u is >=CHALLENGES_MAX\n",challenge);
                #endif
		return; //Maybe also print an error?
	}
	challenges_init();
	challengeTable[challenge]++;
	challenges_save();
	//CG_Printf("Increased challenge #%u by one. Is now %u\n",challenge,challengeTable[challenge]);
}

void challenges_reset(void)
{

	challenges_init();

	challengeTable[0] = 0;

	challengeTable[1] = 0;

	challengeTable[2] = 0;

	challengeTable[3] = 0;

	challengeTable[101] = 0;

	challengeTable[102] = 0;

	challengeTable[103] = 0;

	challengeTable[104] = 0;

	challengeTable[105] = 0;

	challengeTable[106] = 0;

	challengeTable[107] = 0;

	challengeTable[108] = 0;

	challengeTable[109] = 0;

	challengeTable[110] = 0;

	challengeTable[111] = 0;

	challengeTable[112] = 0;

	challengeTable[201] = 0;

	challengeTable[202] = 0;

	challengeTable[203] = 0;

	challengeTable[204] = 0;

	challengeTable[205] = 0;

	challengeTable[206] = 0;

	challengeTable[207] = 0;

	challengeTable[208] = 0;

	challengeTable[209] = 0;

	challengeTable[210] = 0;

	challengeTable[211] = 0;

	challengeTable[212] = 0;

	challengeTable[213] = 0;

	challengeTable[214] = 0;

	challengeTable[215] = 0;

	challengeTable[216] = 0;

	challengeTable[217] = 0;

	challengeTable[218] = 0;

	challengeTable[401] = 0;

	challengeTable[402] = 0;

	challengeTable[403] = 0;

	challengeTable[404] = 0;

	challengeTable[405] = 0;

	challengeTable[406] = 0;

	challengeTable[407] = 0;

	challengeTable[408] = 0;

	challengeTable[409] = 0;

	challengeTable[410] = 0;

	challengeTable[411] = 0;

	challengeTable[412] = 0;

	challengeTable[301] = 0;

	challengeTable[302] = 0;

	challengeTable[303] = 0;

	challengeTable[304] = 0;

	challengeTable[305] = 0;

	challengeTable[1001] = 0;
	challengeTable[1002] = 0;
	challengeTable[1003] = 0;
	challengeTable[1004] = 0;
	challengeTable[1005] = 0;
	challengeTable[1006] = 0;
	challengeTable[1007] = 0;
	challengeTable[1008] = 0;
	challengeTable[1009] = 0;
	challengeTable[1010] = 0;
	challengeTable[1011] = 0;
	challengeTable[1012] = 0;
	challengeTable[1013] = 0;
	challengeTable[1014] = 0;
	challengeTable[1015] = 0;
	challengeTable[1016] = 0;
	challengeTable[1017] = 0;
	challengeTable[1018] = 0;
	challengeTable[1019] = 0;
	challengeTable[1020] = 0;
	challengeTable[1021] = 0;
	challengeTable[1022] = 0;
	challengeTable[1023] = 0;
	challengeTable[1024] = 0;
	challengeTable[1025] = 0;
	challengeTable[1026] = 0;
	challengeTable[1027] = 0;
	challengeTable[1028] = 0;
	challengeTable[1029] = 0;
	challengeTable[1030] = 0;
	challengeTable[1031] = 0;
	challengeTable[1032] = 0;
	challengeTable[1033] = 0;
	challengeTable[1034] = 0;
	challengeTable[1035] = 0;
	challengeTable[1036] = 0;
	challengeTable[1037] = 0;
	challengeTable[1038] = 0;
	challengeTable[1039] = 0;
	challengeTable[1040] = 0;
	challengeTable[1041] = 0;
	challengeTable[1042] = 0;
	challengeTable[1043] = 0;
	challengeTable[1044] = 0;
	challengeTable[1045] = 0;
	challengeTable[1046] = 0;
	challengeTable[1047] = 0;
	challengeTable[1048] = 0;
	challengeTable[1049] = 0;
	challengeTable[1050] = 0;
	challengeTable[1051] = 0;
	challengeTable[1052] = 0;
	challengeTable[1053] = 0;
	challengeTable[1054] = 0;
	challengeTable[1055] = 0;
	challengeTable[1056] = 0;
	challengeTable[1057] = 0;
	challengeTable[1058] = 0;
	challengeTable[1059] = 0;
	challengeTable[1060] = 0;
	challengeTable[1061] = 0;
	challengeTable[1062] = 0;
	challengeTable[1063] = 0;
	challengeTable[1064] = 0;
	challengeTable[1065] = 0;
	challengeTable[1066] = 0;
	challengeTable[1067] = 0;
	challengeTable[1068] = 0;
	challengeTable[1069] = 0;
	challengeTable[1070] = 0;
	challengeTable[1071] = 0;
	challengeTable[1072] = 0;
	challengeTable[1073] = 0;
	challengeTable[1074] = 0;
	challengeTable[1075] = 0;
	challengeTable[1076] = 0;
	challengeTable[1077] = 0;
	challengeTable[1078] = 0;
	challengeTable[1079] = 0;
	challengeTable[1080] = 0;
	challengeTable[1081] = 0;
	challengeTable[1082] = 0;
	challengeTable[1083] = 0;
	challengeTable[1084] = 0;
	challengeTable[1085] = 0;
	challengeTable[1086] = 0;
	challengeTable[1087] = 0;
	challengeTable[1088] = 0;
	challengeTable[1089] = 0;
	challengeTable[1090] = 0;
	challengeTable[1091] = 0;
	challengeTable[1092] = 0;
	challengeTable[1093] = 0;
	challengeTable[1094] = 0;
	challengeTable[1095] = 0;
	challengeTable[1096] = 0;
	challengeTable[1097] = 0;
	challengeTable[1098] = 0;
	challengeTable[1099] = 0;
	challengeTable[1100] = 0;
	challengeTable[1101] = 0;
	challengeTable[1102] = 0;
	challengeTable[1103] = 0;
	challengeTable[1104] = 0;
	challengeTable[1105] = 0;
	challengeTable[1106] = 0;
	challengeTable[1107] = 0;
	challengeTable[1108] = 0;
	challengeTable[1109] = 0;
	challengeTable[1110] = 0;
	challengeTable[1111] = 0;
	challengeTable[1112] = 0;
	challengeTable[1113] = 0;
	challengeTable[1114] = 0;
	challengeTable[1115] = 0;
	challengeTable[1116] = 0;
	challengeTable[1117] = 0;
	challengeTable[1118] = 0;
	challengeTable[1119] = 0;
	challengeTable[1120] = 0;
	challengeTable[1121] = 0;
	challengeTable[1122] = 0;
	challengeTable[1123] = 0;
	challengeTable[1124] = 0;
	challengeTable[1125] = 0;
	challengeTable[1126] = 0;
	challengeTable[1127] = 0;
	challengeTable[1128] = 0;
	challengeTable[1129] = 0;
	challengeTable[1130] = 0;
	challengeTable[1131] = 0;
	challengeTable[1132] = 0;
	challengeTable[1133] = 0;
	challengeTable[1134] = 0;
	challengeTable[1135] = 0;
	challengeTable[1136] = 0;
	challengeTable[1137] = 0;
	challengeTable[1138] = 0;
	challengeTable[1139] = 0;
	challengeTable[1140] = 0;
	challengeTable[1141] = 0;
	challengeTable[1142] = 0;
	challengeTable[1143] = 0;
	challengeTable[1144] = 0;
	challengeTable[1145] = 0;
	challengeTable[1146] = 0;
	challengeTable[1147] = 0;
	challengeTable[1148] = 0;
	challengeTable[1149] = 0;
	challengeTable[1150] = 0;
	challengeTable[1151] = 0;
	challengeTable[1152] = 0;
	challengeTable[1153] = 0;
	challengeTable[1154] = 0;
	challengeTable[1155] = 0;
	challengeTable[1156] = 0;
	challengeTable[1157] = 0;
	challengeTable[1158] = 0;
	challengeTable[1159] = 0;
	challengeTable[1160] = 0;
	challengeTable[1161] = 0;
	challengeTable[1162] = 0;
	challengeTable[1163] = 0;
	challengeTable[1164] = 0;
	challengeTable[1165] = 0;
	challengeTable[1166] = 0;
	challengeTable[1167] = 0;
	challengeTable[1168] = 0;
	challengeTable[1169] = 0;
	challengeTable[1170] = 0;
	challengeTable[1171] = 0;
	challengeTable[1172] = 0;
	challengeTable[1173] = 0;
	challengeTable[1174] = 0;
	challengeTable[1175] = 0;
	challengeTable[1176] = 0;
	challengeTable[1177] = 0;
	challengeTable[1178] = 0;
	challengeTable[1179] = 0;
	challengeTable[1180] = 0;
	challengeTable[1181] = 0;
	challengeTable[1182] = 0;
	challengeTable[1183] = 0;
	challengeTable[1184] = 0;
	challengeTable[1185] = 0;
	challengeTable[1186] = 0;
	challengeTable[1187] = 0;
	challengeTable[1188] = 0;
	challengeTable[1189] = 0;
	challengeTable[1190] = 0;
	challengeTable[1191] = 0;
	challengeTable[1192] = 0;
	challengeTable[1193] = 0;
	challengeTable[1194] = 0;
	challengeTable[1195] = 0;
	challengeTable[1196] = 0;
	challengeTable[1197] = 0;
	challengeTable[1198] = 0;
	challengeTable[1199] = 0;
	challengeTable[1200] = 0;
	challengeTable[1201] = 0;
	challengeTable[1202] = 0;
	challengeTable[1203] = 0;
	challengeTable[1204] = 0;
	challengeTable[1205] = 0;
	challengeTable[1206] = 0;
	challengeTable[1207] = 0;
	challengeTable[1208] = 0;
	challengeTable[1209] = 0;
	challengeTable[1210] = 0;
	challengeTable[1211] = 0;
	challengeTable[1212] = 0;
	challengeTable[1213] = 0;
	challengeTable[1214] = 0;
	challengeTable[1215] = 0;
	challengeTable[1216] = 0;
	challengeTable[1217] = 0;
	challengeTable[1218] = 0;
	challengeTable[1219] = 0;
	challengeTable[1220] = 0;
	challengeTable[1221] = 0;
	challengeTable[1222] = 0;
	challengeTable[1223] = 0;
	challengeTable[1224] = 0;
	challengeTable[1225] = 0;
	challengeTable[1226] = 0;
	challengeTable[1227] = 0;
	challengeTable[1228] = 0;
	challengeTable[1229] = 0;
	challengeTable[1230] = 0;
	challengeTable[1231] = 0;
	challengeTable[1232] = 0;
	challengeTable[1233] = 0;
	challengeTable[1234] = 0;
	challengeTable[1235] = 0;
	challengeTable[1236] = 0;
	challengeTable[1237] = 0;
	challengeTable[1238] = 0;
	challengeTable[1239] = 0;
	challengeTable[1240] = 0;
	challengeTable[1241] = 0;
	challengeTable[1242] = 0;
	challengeTable[1243] = 0;
	challengeTable[1244] = 0;
	challengeTable[1245] = 0;
	challengeTable[1246] = 0;
	challengeTable[1247] = 0;
	challengeTable[1248] = 0;
	challengeTable[1249] = 0;
	challengeTable[1250] = 0;
	challengeTable[1251] = 0;
	challengeTable[1252] = 0;
	challengeTable[1253] = 0;
	challengeTable[1254] = 0;
	challengeTable[1255] = 0;
	challengeTable[1256] = 0;
	challengeTable[1257] = 0;
	challengeTable[1258] = 0;
	challengeTable[1259] = 0;
	challengeTable[1260] = 0;
	challengeTable[1261] = 0;
	challengeTable[1262] = 0;
	challengeTable[1263] = 0;
	challengeTable[1264] = 0;
	challengeTable[1265] = 0;
	challengeTable[1266] = 0;
	challengeTable[1267] = 0;
	challengeTable[1268] = 0;
	challengeTable[1269] = 0;
	challengeTable[1270] = 0;
	challengeTable[1271] = 0;
	challengeTable[1272] = 0;
	challengeTable[1273] = 0;
	challengeTable[1274] = 0;
	challengeTable[1275] = 0;
	challengeTable[1276] = 0;
	challengeTable[1277] = 0;
	challengeTable[1278] = 0;
	challengeTable[1279] = 0;
	challengeTable[1280] = 0;
	challengeTable[1281] = 0;
	challengeTable[1282] = 0;
	challengeTable[1283] = 0;
	challengeTable[1284] = 0;
	challengeTable[1285] = 0;
	challengeTable[1286] = 0;
	challengeTable[1287] = 0;
	challengeTable[1288] = 0;
	challengeTable[1289] = 0;
	challengeTable[1290] = 0;
	challengeTable[1291] = 0;
	challengeTable[1292] = 0;
	challengeTable[1293] = 0;
	challengeTable[1294] = 0;
	challengeTable[1295] = 0;
	challengeTable[1296] = 0;
	challengeTable[1297] = 0;
	challengeTable[1298] = 0;
	challengeTable[1299] = 0;
	challengeTable[1300] = 0;
	challengeTable[1301] = 0;
	challengeTable[1302] = 0;
	challengeTable[1303] = 0;
	challengeTable[1304] = 0;
	challengeTable[1305] = 0;
	challengeTable[1306] = 0;
	challengeTable[1307] = 0;
	challengeTable[1308] = 0;
	challengeTable[1309] = 0;
	challengeTable[1310] = 0;
	challengeTable[1311] = 0;
	challengeTable[1312] = 0;
	challengeTable[1313] = 0;
	challengeTable[1314] = 0;
	challengeTable[1315] = 0;
	challengeTable[1316] = 0;
	challengeTable[1317] = 0;
	challengeTable[1318] = 0;
	challengeTable[1319] = 0;
	challengeTable[1320] = 0;
	challengeTable[1321] = 0;
	challengeTable[1322] = 0;
	challengeTable[1323] = 0;
	challengeTable[1324] = 0;
	challengeTable[1325] = 0;
	challengeTable[1326] = 0;
	challengeTable[1327] = 0;
	challengeTable[1328] = 0;
	challengeTable[1329] = 0;
	challengeTable[1330] = 0;
	challengeTable[1331] = 0;
	challengeTable[1332] = 0;
	challengeTable[1333] = 0;
	challengeTable[1334] = 0;
	challengeTable[1335] = 0;
	challengeTable[1336] = 0;
	challengeTable[1337] = 0;
	challengeTable[1338] = 0;
	challengeTable[1339] = 0;
	challengeTable[1340] = 0;
	challengeTable[1341] = 0;
	challengeTable[1342] = 0;
	challengeTable[1343] = 0;
	challengeTable[1344] = 0;
	challengeTable[1345] = 0;
	challengeTable[1346] = 0;
	challengeTable[1347] = 0;
	challengeTable[1348] = 0;
	challengeTable[1349] = 0;
	challengeTable[1350] = 0;
	challengeTable[1351] = 0;
	challengeTable[1352] = 0;
	challengeTable[1353] = 0;
	challengeTable[1354] = 0;
	challengeTable[1355] = 0;
	challengeTable[1356] = 0;
	challengeTable[1357] = 0;
	challengeTable[1358] = 0;
	challengeTable[1359] = 0;
	challengeTable[1360] = 0;
	challengeTable[1361] = 0;
	challengeTable[1362] = 0;
	challengeTable[1363] = 0;
	challengeTable[1364] = 0;
	challengeTable[1365] = 0;
	challengeTable[1366] = 0;
	challengeTable[1367] = 0;
	challengeTable[1368] = 0;
	challengeTable[1369] = 0;
	challengeTable[1370] = 0;
	challengeTable[1371] = 0;
	challengeTable[1372] = 0;
	challengeTable[1373] = 0;
	challengeTable[1374] = 0;
	challengeTable[1375] = 0;
	challengeTable[1376] = 0;
	challengeTable[1377] = 0;
	challengeTable[1378] = 0;
	challengeTable[1379] = 0;
	challengeTable[1380] = 0;
	challengeTable[1381] = 0;
	challengeTable[1382] = 0;
	challengeTable[1383] = 0;
	challengeTable[1384] = 0;
	challengeTable[1385] = 0;
	challengeTable[1386] = 0;
	challengeTable[1387] = 0;
	challengeTable[1388] = 0;
	challengeTable[1389] = 0;
	challengeTable[1390] = 0;
	challengeTable[1391] = 0;
	challengeTable[1392] = 0;
	challengeTable[1393] = 0;
	challengeTable[1394] = 0;
	challengeTable[1395] = 0;
	challengeTable[1396] = 0;
	challengeTable[1397] = 0;
	challengeTable[1398] = 0;
	challengeTable[1399] = 0;
	challengeTable[1400] = 0;
	challengeTable[1401] = 0;
	challengeTable[1402] = 0;
	challengeTable[1403] = 0;
	challengeTable[1404] = 0;
	challengeTable[1405] = 0;
	challengeTable[1406] = 0;
	challengeTable[1407] = 0;
	challengeTable[1408] = 0;
	challengeTable[1409] = 0;
	challengeTable[1410] = 0;
	challengeTable[1411] = 0;
	challengeTable[1412] = 0;
	challengeTable[1413] = 0;
	challengeTable[1414] = 0;
	challengeTable[1415] = 0;
	challengeTable[1416] = 0;
	challengeTable[1417] = 0;
	challengeTable[1418] = 0;
	challengeTable[1419] = 0;
	challengeTable[1420] = 0;
	challengeTable[1421] = 0;
	challengeTable[1422] = 0;
	challengeTable[1423] = 0;
	challengeTable[1424] = 0;
	challengeTable[1425] = 0;
	challengeTable[1426] = 0;
	challengeTable[1427] = 0;
	challengeTable[1428] = 0;
	challengeTable[1429] = 0;
	challengeTable[1430] = 0;
	challengeTable[1431] = 0;
	challengeTable[1432] = 0;
	challengeTable[1433] = 0;
	challengeTable[1434] = 0;
	challengeTable[1435] = 0;
	challengeTable[1436] = 0;
	challengeTable[1437] = 0;
	challengeTable[1438] = 0;
	challengeTable[1439] = 0;
	challengeTable[1440] = 0;
	challengeTable[1441] = 0;
	challengeTable[1442] = 0;
	challengeTable[1443] = 0;
	challengeTable[1444] = 0;
	challengeTable[1445] = 0;
	challengeTable[1446] = 0;
	challengeTable[1447] = 0;
	challengeTable[1448] = 0;
	challengeTable[1449] = 0;
	challengeTable[1450] = 0;
	challengeTable[1451] = 0;
	challengeTable[1452] = 0;
	challengeTable[1453] = 0;
	challengeTable[1454] = 0;
	challengeTable[1455] = 0;
	challengeTable[1456] = 0;
	challengeTable[1457] = 0;
	challengeTable[1458] = 0;
	challengeTable[1459] = 0;
	challengeTable[1460] = 0;
	challengeTable[1461] = 0;
	challengeTable[1462] = 0;
	challengeTable[1463] = 0;
	challengeTable[1464] = 0;
	challengeTable[1465] = 0;
	challengeTable[1466] = 0;
	challengeTable[1467] = 0;
	challengeTable[1468] = 0;
	challengeTable[1469] = 0;
	challengeTable[1470] = 0;
	challengeTable[1471] = 0;
	challengeTable[1472] = 0;
	challengeTable[1473] = 0;
	challengeTable[1474] = 0;
	challengeTable[1475] = 0;
	challengeTable[1476] = 0;
	challengeTable[1477] = 0;
	challengeTable[1478] = 0;
	challengeTable[1479] = 0;
	challengeTable[1480] = 0;
	challengeTable[1481] = 0;
	challengeTable[1482] = 0;
	challengeTable[1483] = 0;
	challengeTable[1484] = 0;
	challengeTable[1485] = 0;
	challengeTable[1486] = 0;
	challengeTable[1487] = 0;
	challengeTable[1488] = 0;
	challengeTable[1489] = 0;
	challengeTable[1490] = 0;
	challengeTable[1491] = 0;
	challengeTable[1492] = 0;
	challengeTable[1493] = 0;
	challengeTable[1494] = 0;
	challengeTable[1495] = 0;
	challengeTable[1496] = 0;
	challengeTable[1497] = 0;
	challengeTable[1498] = 0;
	challengeTable[1499] = 0;
	challengeTable[1500] = 0;
	challengeTable[1501] = 0;
	challengeTable[1502] = 0;
	challengeTable[1503] = 0;
	challengeTable[1504] = 0;
	challengeTable[1505] = 0;
	challengeTable[1506] = 0;
	challengeTable[1507] = 0;
	challengeTable[1508] = 0;
	challengeTable[1509] = 0;
	challengeTable[1510] = 0;
	challengeTable[1511] = 0;
	challengeTable[1512] = 0;
	challengeTable[1513] = 0;
	challengeTable[1514] = 0;
	challengeTable[1515] = 0;
	challengeTable[1516] = 0;
	challengeTable[1517] = 0;
	challengeTable[1518] = 0;
	challengeTable[1519] = 0;
	challengeTable[1520] = 0;
	challengeTable[1521] = 0;
	challengeTable[1522] = 0;
	challengeTable[1523] = 0;
	challengeTable[1524] = 0;
	challengeTable[1525] = 0;
	challengeTable[1526] = 0;
	challengeTable[1527] = 0;
	challengeTable[1528] = 0;
	challengeTable[1529] = 0;
	challengeTable[1530] = 0;
	challengeTable[1531] = 0;
	challengeTable[1532] = 0;
	challengeTable[1533] = 0;
	challengeTable[1534] = 0;
	challengeTable[1535] = 0;
	challengeTable[1536] = 0;
	challengeTable[1537] = 0;
	challengeTable[1538] = 0;
	challengeTable[1539] = 0;
	challengeTable[1540] = 0;
	challengeTable[1541] = 0;
	challengeTable[1542] = 0;
	challengeTable[1543] = 0;
	challengeTable[1544] = 0;
	challengeTable[1545] = 0;
	challengeTable[1546] = 0;
	challengeTable[1547] = 0;
	challengeTable[1548] = 0;
	challengeTable[1549] = 0;
	challengeTable[1550] = 0;
	challengeTable[1551] = 0;
	challengeTable[1552] = 0;
	challengeTable[1553] = 0;
	challengeTable[1554] = 0;
	challengeTable[1555] = 0;
	challengeTable[1556] = 0;
	challengeTable[1557] = 0;
	challengeTable[1558] = 0;
	challengeTable[1559] = 0;
	challengeTable[1560] = 0;
	challengeTable[1561] = 0;
	challengeTable[1562] = 0;
	challengeTable[1563] = 0;
	challengeTable[1564] = 0;
	challengeTable[1565] = 0;
	challengeTable[1566] = 0;
	challengeTable[1567] = 0;
	challengeTable[1568] = 0;
	challengeTable[1569] = 0;
	challengeTable[1570] = 0;
	challengeTable[1571] = 0;
	challengeTable[1572] = 0;
	challengeTable[1573] = 0;
	challengeTable[1574] = 0;
	challengeTable[1575] = 0;
	challengeTable[1576] = 0;
	challengeTable[1577] = 0;
	challengeTable[1578] = 0;
	challengeTable[1579] = 0;
	challengeTable[1580] = 0;
	challengeTable[1581] = 0;
	challengeTable[1582] = 0;
	challengeTable[1583] = 0;
	challengeTable[1584] = 0;
	challengeTable[1585] = 0;
	challengeTable[1586] = 0;
	challengeTable[1587] = 0;
	challengeTable[1588] = 0;
	challengeTable[1589] = 0;
	challengeTable[1590] = 0;
	challengeTable[1591] = 0;
	challengeTable[1592] = 0;
	challengeTable[1593] = 0;
	challengeTable[1594] = 0;
	challengeTable[1595] = 0;
	challengeTable[1596] = 0;
	challengeTable[1597] = 0;
	challengeTable[1598] = 0;
	challengeTable[1599] = 0;
	challengeTable[1600] = 0;
	challengeTable[1601] = 0;
	challengeTable[1602] = 0;
	challengeTable[1603] = 0;
	challengeTable[1604] = 0;
	challengeTable[1605] = 0;
	challengeTable[1606] = 0;
	challengeTable[1607] = 0;
	challengeTable[1608] = 0;
	challengeTable[1609] = 0;
	challengeTable[1610] = 0;
	challengeTable[1611] = 0;
	challengeTable[1612] = 0;
	challengeTable[1613] = 0;
	challengeTable[1614] = 0;
	challengeTable[1615] = 0;
	challengeTable[1616] = 0;
	challengeTable[1617] = 0;
	challengeTable[1618] = 0;
	challengeTable[1619] = 0;
	challengeTable[1620] = 0;
	challengeTable[1621] = 0;
	challengeTable[1622] = 0;
	challengeTable[1623] = 0;
	challengeTable[1624] = 0;
	challengeTable[1625] = 0;
	challengeTable[1626] = 0;
	challengeTable[1627] = 0;
	challengeTable[1628] = 0;
	challengeTable[1629] = 0;
	challengeTable[1630] = 0;
	challengeTable[1631] = 0;
	challengeTable[1632] = 0;
	challengeTable[1633] = 0;
	challengeTable[1634] = 0;
	challengeTable[1635] = 0;
	challengeTable[1636] = 0;
	challengeTable[1637] = 0;
	challengeTable[1638] = 0;
	challengeTable[1639] = 0;
	challengeTable[1640] = 0;
	challengeTable[1641] = 0;
	challengeTable[1642] = 0;
	challengeTable[1643] = 0;
	challengeTable[1644] = 0;
	challengeTable[1645] = 0;
	challengeTable[1646] = 0;
	challengeTable[1647] = 0;
	challengeTable[1648] = 0;
	challengeTable[1649] = 0;
	challengeTable[1650] = 0;
	challengeTable[1651] = 0;
	challengeTable[1652] = 0;
	challengeTable[1653] = 0;
	challengeTable[1654] = 0;
	challengeTable[1655] = 0;
	challengeTable[1656] = 0;
	challengeTable[1657] = 0;
	challengeTable[1658] = 0;
	challengeTable[1659] = 0;
	challengeTable[1660] = 0;
	challengeTable[1661] = 0;
	challengeTable[1662] = 0;
	challengeTable[1663] = 0;
	challengeTable[1664] = 0;
	challengeTable[1665] = 0;
	challengeTable[1666] = 0;
	challengeTable[1667] = 0;
	challengeTable[1668] = 0;
	challengeTable[1669] = 0;
	challengeTable[1670] = 0;
	challengeTable[1671] = 0;
	challengeTable[1672] = 0;
	challengeTable[1673] = 0;
	challengeTable[1674] = 0;
	challengeTable[1675] = 0;
	challengeTable[1676] = 0;
	challengeTable[1677] = 0;
	challengeTable[1678] = 0;
	challengeTable[1679] = 0;
	challengeTable[1680] = 0;
	challengeTable[1681] = 0;
	challengeTable[1682] = 0;
	challengeTable[1683] = 0;
	challengeTable[1684] = 0;
	challengeTable[1685] = 0;
	challengeTable[1686] = 0;
	challengeTable[1687] = 0;
	challengeTable[1688] = 0;
	challengeTable[1689] = 0;
	challengeTable[1690] = 0;
	challengeTable[1691] = 0;
	challengeTable[1692] = 0;
	challengeTable[1693] = 0;
	challengeTable[1694] = 0;
	challengeTable[1695] = 0;
	challengeTable[1696] = 0;
	challengeTable[1697] = 0;
	challengeTable[1698] = 0;
	challengeTable[1699] = 0;
	challengeTable[1700] = 0;
	challengeTable[1701] = 0;
	challengeTable[1702] = 0;
	challengeTable[1703] = 0;
	challengeTable[1704] = 0;
	challengeTable[1705] = 0;
	challengeTable[1706] = 0;
	challengeTable[1707] = 0;
	challengeTable[1708] = 0;
	challengeTable[1709] = 0;
	challengeTable[1710] = 0;
	challengeTable[1711] = 0;
	challengeTable[1712] = 0;
	challengeTable[1713] = 0;
	challengeTable[1714] = 0;
	challengeTable[1715] = 0;
	challengeTable[1716] = 0;
	challengeTable[1717] = 0;
	challengeTable[1718] = 0;
	challengeTable[1719] = 0;
	challengeTable[1720] = 0;
	challengeTable[1721] = 0;
	challengeTable[1722] = 0;
	challengeTable[1723] = 0;
	challengeTable[1724] = 0;
	challengeTable[1725] = 0;
	challengeTable[1726] = 0;
	challengeTable[1727] = 0;
	challengeTable[1728] = 0;
	challengeTable[1729] = 0;
	challengeTable[1730] = 0;
	challengeTable[1731] = 0;
	challengeTable[1732] = 0;
	challengeTable[1733] = 0;
	challengeTable[1734] = 0;
	challengeTable[1735] = 0;
	challengeTable[1736] = 0;
	challengeTable[1737] = 0;
	challengeTable[1738] = 0;
	challengeTable[1739] = 0;
	challengeTable[1740] = 0;
	challengeTable[1741] = 0;
	challengeTable[1742] = 0;
	challengeTable[1743] = 0;
	challengeTable[1744] = 0;
	challengeTable[1745] = 0;
	challengeTable[1746] = 0;
	challengeTable[1747] = 0;
	challengeTable[1748] = 0;
	challengeTable[1749] = 0;
	challengeTable[1750] = 0;
	challengeTable[1751] = 0;
	challengeTable[1752] = 0;
	challengeTable[1753] = 0;
	challengeTable[1754] = 0;
	challengeTable[1755] = 0;
	challengeTable[1756] = 0;
	challengeTable[1757] = 0;
	challengeTable[1758] = 0;
	challengeTable[1759] = 0;
	challengeTable[1760] = 0;
	challengeTable[1761] = 0;
	challengeTable[1762] = 0;
	challengeTable[1763] = 0;
	challengeTable[1764] = 0;
	challengeTable[1765] = 0;
	challengeTable[1766] = 0;
	challengeTable[1767] = 0;
	challengeTable[1768] = 0;
	challengeTable[1769] = 0;
	challengeTable[1770] = 0;
	challengeTable[1771] = 0;
	challengeTable[1772] = 0;
	challengeTable[1773] = 0;
	challengeTable[1774] = 0;
	challengeTable[1775] = 0;
	challengeTable[1776] = 0;
	challengeTable[1777] = 0;
	challengeTable[1778] = 0;
	challengeTable[1779] = 0;
	challengeTable[1780] = 0;
	challengeTable[1781] = 0;
	challengeTable[1782] = 0;
	challengeTable[1783] = 0;
	challengeTable[1784] = 0;
	challengeTable[1785] = 0;
	challengeTable[1786] = 0;
	challengeTable[1787] = 0;
	challengeTable[1788] = 0;
	challengeTable[1789] = 0;
	challengeTable[1790] = 0;
	challengeTable[1791] = 0;
	challengeTable[1792] = 0;
	challengeTable[1793] = 0;
	challengeTable[1794] = 0;
	challengeTable[1795] = 0;
	challengeTable[1796] = 0;
	challengeTable[1797] = 0;
	challengeTable[1798] = 0;
	challengeTable[1799] = 0;
	challengeTable[1800] = 0;
	challengeTable[1801] = 0;
	challengeTable[1802] = 0;
	challengeTable[1803] = 0;
	challengeTable[1804] = 0;
	challengeTable[1805] = 0;
	challengeTable[1806] = 0;
	challengeTable[1807] = 0;
	challengeTable[1808] = 0;
	challengeTable[1809] = 0;
	challengeTable[1810] = 0;
	challengeTable[1811] = 0;
	challengeTable[1812] = 0;
	challengeTable[1813] = 0;
	challengeTable[1814] = 0;
	challengeTable[1815] = 0;
	challengeTable[1816] = 0;
	challengeTable[1817] = 0;
	challengeTable[1818] = 0;
	challengeTable[1819] = 0;
	challengeTable[1820] = 0;
	challengeTable[1821] = 0;
	challengeTable[1822] = 0;
	challengeTable[1823] = 0;
	challengeTable[1824] = 0;
	challengeTable[1825] = 0;
	challengeTable[1826] = 0;
	challengeTable[1827] = 0;
	challengeTable[1828] = 0;
	challengeTable[1829] = 0;
	challengeTable[1830] = 0;
	challengeTable[1831] = 0;
	challengeTable[1832] = 0;
	challengeTable[1833] = 0;
	challengeTable[1834] = 0;
	challengeTable[1835] = 0;
	challengeTable[1836] = 0;
	challengeTable[1837] = 0;
	challengeTable[1838] = 0;
	challengeTable[1839] = 0;
	challengeTable[1840] = 0;
	challengeTable[1841] = 0;
	challengeTable[1842] = 0;
	challengeTable[1843] = 0;
	challengeTable[1844] = 0;
	challengeTable[1845] = 0;
	challengeTable[1846] = 0;
	challengeTable[1847] = 0;
	challengeTable[1848] = 0;
	challengeTable[1849] = 0;
	challengeTable[1850] = 0;
	challengeTable[1851] = 0;
	challengeTable[1852] = 0;
	challengeTable[1853] = 0;
	challengeTable[1854] = 0;
	challengeTable[1855] = 0;
	challengeTable[1856] = 0;
	challengeTable[1857] = 0;
	challengeTable[1858] = 0;
	challengeTable[1859] = 0;
	challengeTable[1860] = 0;
	challengeTable[1861] = 0;
	challengeTable[1862] = 0;
	challengeTable[1863] = 0;
	challengeTable[1864] = 0;
	challengeTable[1865] = 0;
	challengeTable[1866] = 0;
	challengeTable[1867] = 0;
	challengeTable[1868] = 0;
	challengeTable[1869] = 0;
	challengeTable[1870] = 0;
	challengeTable[1871] = 0;
	challengeTable[1872] = 0;
	challengeTable[1873] = 0;
	challengeTable[1874] = 0;
	challengeTable[1875] = 0;
	challengeTable[1876] = 0;
	challengeTable[1877] = 0;
	challengeTable[1878] = 0;
	challengeTable[1879] = 0;
	challengeTable[1880] = 0;
	challengeTable[1881] = 0;
	challengeTable[1882] = 0;
	challengeTable[1883] = 0;
	challengeTable[1884] = 0;
	challengeTable[1885] = 0;
	challengeTable[1886] = 0;
	challengeTable[1887] = 0;
	challengeTable[1888] = 0;
	challengeTable[1889] = 0;
	challengeTable[1890] = 0;
	challengeTable[1891] = 0;
	challengeTable[1892] = 0;
	challengeTable[1893] = 0;
	challengeTable[1894] = 0;
	challengeTable[1895] = 0;
	challengeTable[1896] = 0;
	challengeTable[1897] = 0;
	challengeTable[1898] = 0;
	challengeTable[1899] = 0;
	challengeTable[1900] = 0;
	challengeTable[1901] = 0;
	challengeTable[1902] = 0;
	challengeTable[1903] = 0;
	challengeTable[1904] = 0;
	challengeTable[1905] = 0;
	challengeTable[1906] = 0;
	challengeTable[1907] = 0;
	challengeTable[1908] = 0;
	challengeTable[1909] = 0;
	challengeTable[1910] = 0;
	challengeTable[1911] = 0;
	challengeTable[1912] = 0;
	challengeTable[1913] = 0;
	challengeTable[1914] = 0;
	challengeTable[1915] = 0;
	challengeTable[1916] = 0;
	challengeTable[1917] = 0;
	challengeTable[1918] = 0;
	challengeTable[1919] = 0;
	challengeTable[1920] = 0;
	challengeTable[1921] = 0;
	challengeTable[1922] = 0;
	challengeTable[1923] = 0;
	challengeTable[1924] = 0;
	challengeTable[1925] = 0;
	challengeTable[1926] = 0;
	challengeTable[1927] = 0;
	challengeTable[1928] = 0;
	challengeTable[1929] = 0;
	challengeTable[1930] = 0;
	challengeTable[1931] = 0;
	challengeTable[1932] = 0;
	challengeTable[1933] = 0;
	challengeTable[1934] = 0;
	challengeTable[1935] = 0;
	challengeTable[1936] = 0;
	challengeTable[1937] = 0;
	challengeTable[1938] = 0;
	challengeTable[1939] = 0;
	challengeTable[1940] = 0;
	challengeTable[1941] = 0;
	challengeTable[1942] = 0;
	challengeTable[1943] = 0;
	challengeTable[1944] = 0;
	challengeTable[1945] = 0;
	challengeTable[1946] = 0;
	challengeTable[1947] = 0;
	challengeTable[1948] = 0;
	challengeTable[1949] = 0;
	challengeTable[1950] = 0;
	challengeTable[1951] = 0;
	challengeTable[1952] = 0;
	challengeTable[1953] = 0;
	challengeTable[1954] = 0;
	challengeTable[1955] = 0;
	challengeTable[1956] = 0;
	challengeTable[1957] = 0;
	challengeTable[1958] = 0;
	challengeTable[1959] = 0;
	challengeTable[1960] = 0;
	challengeTable[1961] = 0;
	challengeTable[1962] = 0;
	challengeTable[1963] = 0;
	challengeTable[1964] = 0;
	challengeTable[1965] = 0;
	challengeTable[1966] = 0;
	challengeTable[1967] = 0;
	challengeTable[1968] = 0;
	challengeTable[1969] = 0;
	challengeTable[1970] = 0;
	challengeTable[1971] = 0;
	challengeTable[1972] = 0;
	challengeTable[1973] = 0;
	challengeTable[1974] = 0;
	challengeTable[1975] = 0;
	challengeTable[1976] = 0;
	challengeTable[1977] = 0;
	challengeTable[1978] = 0;
	challengeTable[1979] = 0;
	challengeTable[1980] = 0;
	challengeTable[1981] = 0;
	challengeTable[1982] = 0;
	challengeTable[1983] = 0;
	challengeTable[1984] = 0;
	challengeTable[1985] = 0;
	challengeTable[1986] = 0;
	challengeTable[1987] = 0;
	challengeTable[1988] = 0;
	challengeTable[1989] = 0;
	challengeTable[1990] = 0;
	challengeTable[1991] = 0;
	challengeTable[1992] = 0;
	challengeTable[1993] = 0;
	challengeTable[1994] = 0;
	challengeTable[1995] = 0;
	challengeTable[1996] = 0;
	challengeTable[1997] = 0;
	challengeTable[1998] = 0;
	challengeTable[1999] = 0;


	challenges_save();

}

void challenges_buymenu(void)
{
int number;

	challenges_init();

	srand(getChallenge(GENERAL_MONEY));
	number = (rand() % (850 + 1)) + 1000;  //1000-offset challenges

  challengeTable[number] = 1;
	challengeTable[3] -= 30;

	challenges_save();

}

static void challenges_plusmenu(void)
{

	challenges_init();


	challengeTable[3] += 100;


	challenges_save();

}
