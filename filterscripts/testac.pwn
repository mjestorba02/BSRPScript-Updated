#define FILTERSCRIPT

#include <openmp\open.mp>

// -
#define C_GREEN 0x20DD6AFF
#define C_ERROR 0xA01616FF

#define MOBILE_CLIENT "ED40ED0E8089CC44C08EE9580F4C8C44EE8EE990"

// -
new bool:pSuspicious[MAX_PLAYERS];
new bool:mobilePlayer[MAX_PLAYERS];
// -
new pCheat[MAX_PLAYERS];
// -
new rMemAddr[8];

// -
forward autoSobCheck(playerid);
forward kickPlayer(playerid);
// -

new opcodes[8] = {
	0x06865E,
 	0xA88774,
  	0xDB6746,
   	0xFDB957,
    0x52D558,
    0xE4FC58,
    0x1BA246,
    0xB0C56F
};

// -- Callbacks --
public OnPlayerConnect(playerid)
{
    new version[24], pAuth[43];
    
	// --
	mobilePlayer[playerid] = false;
    pSuspicious[playerid] = false;
    pCheat[playerid] = -1;
    
	// -- Client version | GPCI --
    GetPlayerVersion(playerid, version, sizeof(version));
    GPCI(playerid, pAuth, sizeof(pAuth));

    if ( !strcmp ( MOBILE_CLIENT, pAuth, true ) ) mobilePlayer[playerid] = true;

    // -
    SendClientCheck(playerid, 0x47, 0, 0, 0x4);
    SendClientCheck(playerid, 0x48, 0, 0, 0x4);
    // -

	for (new i = 0; i < 8; i++) rMemAddr[i] = anotherForm(opcodes[i]), SendClientCheck(playerid, 0x5, rMemAddr[i], 0x0, 0x4);

	// -- Check RPC --
    CallLocalFunction("Sec_OnClientCheckResponse", "iiii", playerid, 0x47, 0xCECECE, 256);
    CallLocalFunction("Sec_OnClientCheckResponse", "iiii", playerid, 0x48, 0xDEDEDE, 256);
	// -
	
    SetTimerEx("autoSobCheck", 2900, false, "i", playerid);
    return 1;
}

public Sec_OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
	switch(actionid)
	{
	    case 0x47:
	    {
	        if ( mobilePlayer[playerid] == false && memaddr == 0x0 && retndata != 256 )
	        {
	            pSuspicious[playerid] = false;
	        }
	        if ( mobilePlayer[playerid] == false && memaddr == 0xCECECE && retndata == 256 )
	        {
	            pSuspicious[playerid] = true;
	            // -
    			SendClientCheck(playerid, 0x47, 0, 0, 0x4);
	        }
	    }
	    case 0x48:
	    {
	        if ( mobilePlayer[playerid] == false && memaddr != 0xDEDEDE && retndata == 0 )
	        {
	            pSuspicious[playerid] = false;
	        }
	        if ( mobilePlayer[playerid] == false && memaddr == 0xDEDEDE && retndata == 256 )
	        {
	            pSuspicious[playerid] = true;
	            // -
    			SendClientCheck(playerid, 0x48, 0, 0, 0x4);
	        }
	    }
	    case 0x5:
	    {
		    if ( memaddr == rMemAddr[0] && retndata != 192) pCheat[playerid] = 1;
		    if ( memaddr == rMemAddr[1] && retndata != 72) pCheat[playerid] = 2;
		    if ( memaddr == rMemAddr[2] && retndata != 192) pCheat[playerid] = 3;
		    if ( memaddr == rMemAddr[3] && retndata != 68) pCheat[playerid] = 4;
		    if ( memaddr == rMemAddr[4] && retndata != 196) pCheat[playerid] = 5;
		    if ( memaddr == rMemAddr[5] && retndata != 64) pCheat[playerid] = 6;
		    if ( memaddr == rMemAddr[6] && retndata != 8 ) pCheat[playerid] = 7; // CLEO5+Ultimate ASI Loader
			if ( memaddr == rMemAddr[7] && retndata != 200 ) pCheat[playerid] = 8; // SilentPatch
		}
	}
	return 0;
}

public OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
    #if defined Sec_OnClientCheckResponse
        Sec_OnClientCheckResponse(playerid, actionid, memaddr, retndata);
    #endif
    return 1;
}
#if defined _ALS_OnClientCheckResponse
    #undef OnClientCheckResponse
#else
    #define _ALS_OnClientCheckResponse
#endif
#define OnClientCheckResponse Sec_OnClientCheckResponse
#if defined Sec_OnClientCheckResponse
    forward Sec_OnClientCheckResponse(playerid, actionid, memaddr, retndata);
#endif

public autoSobCheck(playerid)
{
	if ( mobilePlayer[playerid] == true )
	{
	    SendClientMessage(playerid, C_GREEN, "You’re currently playing the mobile version of SA-MP.");
	}
	// --
	if ( pSuspicious[playerid] == true )
	{
	    SendClientMessage(playerid, C_ERROR, "[ERROR] System has detected that you are probably using some mods. If you think this is a mistake, please contact the Admin.");
		SetTimerEx("kickPlayer", 2500, false, "d", playerid);
	}
	if ( pCheat[playerid] > 0 )
 	{
		for(new i = 0; i < 7; i++) SendClientMessage(playerid, -1, " ");
  		SendClientMessage(playerid, C_GREEN, "--------------------------------------------");
    }
	// --
	switch ( pCheat[playerid] )
	{
	    case 1:SendClientMessage(playerid, C_ERROR, "[ERROR] System has detected that you are using S0beit mod. Remove it and return to the server!"), SetTimerEx("kickPlayer", 2500, false, "d", playerid);
		case 2..6:SendClientMessage(playerid, C_ERROR, "[ERROR] System has detected that you are using CLEO mod. Remove it and return to the server!"), SetTimerEx("kickPlayer", 2500, false, "d", playerid);
		case 7:SendClientMessage(playerid, C_ERROR, "[ERROR] System has detected that you are using CLEO5+Ultimate ASI Loader mod. Remove it and return to the server!"), SetTimerEx("kickPlayer", 2500, false, "d", playerid);
		case 8:SendClientMessage(playerid, C_ERROR, "[ERROR] System has detected that you are using SilentPatch. Remove it and return to the server!"), SetTimerEx("kickPlayer", 2500, false, "d", playerid);
	}
	return 1;
}

public kickPlayer(playerid) Kick(playerid);

// --
stock anotherForm(input)
{
    new result;

    #emit LOAD.S.pri input
    #emit CONST.alt 0xFF
    #emit AND
    #emit CONST.alt 16
    #emit SHL
    #emit STOR.S.pri result

    #emit LOAD.S.pri input
    #emit CONST.alt 0xFF00
    #emit AND
    #emit LOAD.S.alt result
    #emit ADD
    #emit STOR.S.pri result

    #emit LOAD.S.pri input
    #emit CONST.alt 0xFF0000
    #emit AND
    #emit CONST.alt 16
    #emit SHR
    #emit LOAD.S.alt result
    #emit ADD
    #emit STOR.S.pri result

    return result;
}

stock AntiDeAMX()
{
    new a[][] = {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a
    
    print("----------------------------------------------");
	print("Test Anti-Cheat");
	print("Loaded Successfully.");
	print("----------------------------------------------");
}

public OnGameModeInit()
{
	AntiDeAMX();
	return 1;
}
