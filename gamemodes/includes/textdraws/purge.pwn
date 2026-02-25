new Text:PPurgeTD[7];
new PlayerText:PurgeTD[MAX_PLAYERS][2];
new Text:pkills[10];
new Text:pdeaths[10];

CreatePurgePTD()
{
    PPurgeTD[0] = TextDrawCreate(227.000000, 302.000000, "Preview_Model");
	TextDrawFont(PPurgeTD[0], 5);
	TextDrawLetterSize(PPurgeTD[0], 0.600000, 2.000000);
	TextDrawTextSize(PPurgeTD[0], 176.000000, 150.000000);
	TextDrawSetOutline(PPurgeTD[0], 0);
	TextDrawSetShadow(PPurgeTD[0], 0);
	TextDrawAlignment(PPurgeTD[0], 1);
	TextDrawColor(PPurgeTD[0], -1);
	TextDrawBackgroundColor(PPurgeTD[0], 0);
	TextDrawBoxColor(PPurgeTD[0], 255);
	TextDrawUseBox(PPurgeTD[0], 0);
	TextDrawSetProportional(PPurgeTD[0], 1);
	TextDrawSetSelectable(PPurgeTD[0], 0);
	TextDrawSetPreviewModel(PPurgeTD[0], 6865);
	TextDrawSetPreviewRot(PPurgeTD[0], 0.000000, 0.000000, 224.000000, 1.250000);
	TextDrawSetPreviewVehCol(PPurgeTD[0], 1, 1);

	PPurgeTD[1] = TextDrawCreate(319.000000, 342.000000, "THE PURGE");
	TextDrawFont(PPurgeTD[1], 1);
	TextDrawLetterSize(PPurgeTD[1], 0.416666, 1.450000);
	TextDrawTextSize(PPurgeTD[1], 400.000000, 17.000000);
	TextDrawSetOutline(PPurgeTD[1], 0);
	TextDrawSetShadow(PPurgeTD[1], 0);
	TextDrawAlignment(PPurgeTD[1], 2);
	TextDrawColor(PPurgeTD[1], -16776961);
	TextDrawBackgroundColor(PPurgeTD[1], 255);
	TextDrawBoxColor(PPurgeTD[1], 50);
	TextDrawUseBox(PPurgeTD[1], 0);
	TextDrawSetProportional(PPurgeTD[1], 1);
	TextDrawSetSelectable(PPurgeTD[1], 0);

	PPurgeTD[2] = TextDrawCreate(282.000000, 380.000000, "KILLS");
	TextDrawFont(PPurgeTD[2], 1);
	TextDrawLetterSize(PPurgeTD[2], 0.300000, 1.200000);
	TextDrawTextSize(PPurgeTD[2], 400.000000, 17.000000);
	TextDrawSetOutline(PPurgeTD[2], 0);
	TextDrawSetShadow(PPurgeTD[2], 0);
	TextDrawAlignment(PPurgeTD[2], 2);
	TextDrawColor(PPurgeTD[2], -2686721);
	TextDrawBackgroundColor(PPurgeTD[2], 255);
	TextDrawBoxColor(PPurgeTD[2], 50);
	TextDrawUseBox(PPurgeTD[2], 0);
	TextDrawSetProportional(PPurgeTD[2], 1);
	TextDrawSetSelectable(PPurgeTD[2], 0);

	PPurgeTD[3] = TextDrawCreate(358.000000, 380.000000, "DEATHS");
	TextDrawFont(PPurgeTD[3], 1);
	TextDrawLetterSize(PPurgeTD[3], 0.300000, 1.200000);
	TextDrawTextSize(PPurgeTD[3], 400.000000, 17.000000);
	TextDrawSetOutline(PPurgeTD[3], 0);
	TextDrawSetShadow(PPurgeTD[3], 0);
	TextDrawAlignment(PPurgeTD[3], 2);
	TextDrawColor(PPurgeTD[3], -2686721);
	TextDrawBackgroundColor(PPurgeTD[3], 255);
	TextDrawBoxColor(PPurgeTD[3], 50);
	TextDrawUseBox(PPurgeTD[3], 0);
	TextDrawSetProportional(PPurgeTD[3], 1);
	TextDrawSetSelectable(PPurgeTD[3], 0);

	PPurgeTD[4] = TextDrawCreate(4.000000, 118.000000, "TOP PLAYERS");
	TextDrawFont(PPurgeTD[4], 1);
	TextDrawLetterSize(PPurgeTD[4], 0.300000, 1.200000);
	TextDrawTextSize(PPurgeTD[4], 400.000000, 92.000000);
	TextDrawSetOutline(PPurgeTD[4], 0);
	TextDrawSetShadow(PPurgeTD[4], 0);
	TextDrawAlignment(PPurgeTD[4], 1);
	TextDrawColor(PPurgeTD[4], 16711935);
	TextDrawBackgroundColor(PPurgeTD[4], 255);
	TextDrawBoxColor(PPurgeTD[4], 50);
	TextDrawUseBox(PPurgeTD[4], 0);
	TextDrawSetProportional(PPurgeTD[4], 1);
	TextDrawSetSelectable(PPurgeTD[4], 0);

	PPurgeTD[5] = TextDrawCreate(6.000000, 129.000000, "KILLS");
	TextDrawFont(PPurgeTD[5], 1);
	TextDrawLetterSize(PPurgeTD[5], 0.270832, 1.200000);
	TextDrawTextSize(PPurgeTD[5], 400.000000, 17.000000);
	TextDrawSetOutline(PPurgeTD[5], 0);
	TextDrawSetShadow(PPurgeTD[5], 0);
	TextDrawAlignment(PPurgeTD[5], 1);
	TextDrawColor(PPurgeTD[5], -16776961);
	TextDrawBackgroundColor(PPurgeTD[5], 255);
	TextDrawBoxColor(PPurgeTD[5], 50);
	TextDrawUseBox(PPurgeTD[5], 0);
	TextDrawSetProportional(PPurgeTD[5], 1);
	TextDrawSetSelectable(PPurgeTD[5], 0);

	pkills[0] = TextDrawCreate(6.000000, 142.000000, "1. Marco Cruz");
	TextDrawFont(pkills[0], 1);
	TextDrawLetterSize(pkills[0], 0.245832, 1.050000);
	TextDrawTextSize(pkills[0], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[0], 0);
	TextDrawSetShadow(pkills[0], 0);
	TextDrawAlignment(pkills[0], 1);
	TextDrawColor(pkills[0], -1);
	TextDrawBackgroundColor(pkills[0], 255);
	TextDrawBoxColor(pkills[0], 50);
	TextDrawUseBox(pkills[0], 0);
	TextDrawSetProportional(pkills[0], 1);
	TextDrawSetSelectable(pkills[0], 0);

	pkills[1] = TextDrawCreate(6.000000, 151.000000, "1. Marco Cruz");
	TextDrawFont(pkills[1], 1);
	TextDrawLetterSize(pkills[1], 0.245832, 1.050000);
	TextDrawTextSize(pkills[1], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[1], 0);
	TextDrawSetShadow(pkills[1], 0);
	TextDrawAlignment(pkills[1], 1);
	TextDrawColor(pkills[1], -1);
	TextDrawBackgroundColor(pkills[1], 255);
	TextDrawBoxColor(pkills[1], 50);
	TextDrawUseBox(pkills[1], 0);
	TextDrawSetProportional(pkills[1], 1);
	TextDrawSetSelectable(pkills[1], 0);

	pkills[2] = TextDrawCreate(6.000000, 160.000000, "1. Marco Cruz");
	TextDrawFont(pkills[2], 1);
	TextDrawLetterSize(pkills[2], 0.245832, 1.050000);
	TextDrawTextSize(pkills[2], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[2], 0);
	TextDrawSetShadow(pkills[2], 0);
	TextDrawAlignment(pkills[2], 1);
	TextDrawColor(pkills[2], -1);
	TextDrawBackgroundColor(pkills[2], 255);
	TextDrawBoxColor(pkills[2], 50);
	TextDrawUseBox(pkills[2], 0);
	TextDrawSetProportional(pkills[2], 1);
	TextDrawSetSelectable(pkills[2], 0);

	pkills[3] = TextDrawCreate(6.000000, 169.000000, "1. Marco Cruz");
	TextDrawFont(pkills[3], 1);
	TextDrawLetterSize(pkills[3], 0.245832, 1.050000);
	TextDrawTextSize(pkills[3], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[3], 0);
	TextDrawSetShadow(pkills[3], 0);
	TextDrawAlignment(pkills[3], 1);
	TextDrawColor(pkills[3], -1);
	TextDrawBackgroundColor(pkills[3], 255);
	TextDrawBoxColor(pkills[3], 50);
	TextDrawUseBox(pkills[3], 0);
	TextDrawSetProportional(pkills[3], 1);
	TextDrawSetSelectable(pkills[3], 0);

	pkills[4] = TextDrawCreate(6.000000, 178.000000, "1. Marco Cruz");
	TextDrawFont(pkills[4], 1);
	TextDrawLetterSize(pkills[4], 0.245832, 1.050000);
	TextDrawTextSize(pkills[4], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[4], 0);
	TextDrawSetShadow(pkills[4], 0);
	TextDrawAlignment(pkills[4], 1);
	TextDrawColor(pkills[4], -1);
	TextDrawBackgroundColor(pkills[4], 255);
	TextDrawBoxColor(pkills[4], 50);
	TextDrawUseBox(pkills[4], 0);
	TextDrawSetProportional(pkills[4], 1);
	TextDrawSetSelectable(pkills[4], 0);

	pkills[5] = TextDrawCreate(6.000000, 187.000000, "1. Marco Cruz");
	TextDrawFont(pkills[5], 1);
	TextDrawLetterSize(pkills[5], 0.245832, 1.050000);
	TextDrawTextSize(pkills[5], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[5], 0);
	TextDrawSetShadow(pkills[5], 0);
	TextDrawAlignment(pkills[5], 1);
	TextDrawColor(pkills[5], -1);
	TextDrawBackgroundColor(pkills[5], 255);
	TextDrawBoxColor(pkills[5], 50);
	TextDrawUseBox(pkills[5], 0);
	TextDrawSetProportional(pkills[5], 1);
	TextDrawSetSelectable(pkills[5], 0);

	pkills[6] = TextDrawCreate(6.000000, 196.000000, "1. Marco Cruz");
	TextDrawFont(pkills[6], 1);
	TextDrawLetterSize(pkills[6], 0.245832, 1.050000);
	TextDrawTextSize(pkills[6], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[6], 0);
	TextDrawSetShadow(pkills[6], 0);
	TextDrawAlignment(pkills[6], 1);
	TextDrawColor(pkills[6], -1);
	TextDrawBackgroundColor(pkills[6], 255);
	TextDrawBoxColor(pkills[6], 50);
	TextDrawUseBox(pkills[6], 0);
	TextDrawSetProportional(pkills[6], 1);
	TextDrawSetSelectable(pkills[6], 0);

	pkills[7] = TextDrawCreate(6.000000, 205.000000, "1. Marco Cruz");
	TextDrawFont(pkills[7], 1);
	TextDrawLetterSize(pkills[7], 0.245832, 1.050000);
	TextDrawTextSize(pkills[7], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[7], 0);
	TextDrawSetShadow(pkills[7], 0);
	TextDrawAlignment(pkills[7], 1);
	TextDrawColor(pkills[7], -1);
	TextDrawBackgroundColor(pkills[7], 255);
	TextDrawBoxColor(pkills[7], 50);
	TextDrawUseBox(pkills[7], 0);
	TextDrawSetProportional(pkills[7], 1);
	TextDrawSetSelectable(pkills[7], 0);

	pkills[8] = TextDrawCreate(6.000000, 214.000000, "1. Marco Cruz");
	TextDrawFont(pkills[8], 1);
	TextDrawLetterSize(pkills[8], 0.245832, 1.050000);
	TextDrawTextSize(pkills[8], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[8], 0);
	TextDrawSetShadow(pkills[8], 0);
	TextDrawAlignment(pkills[8], 1);
	TextDrawColor(pkills[8], -1);
	TextDrawBackgroundColor(pkills[8], 255);
	TextDrawBoxColor(pkills[8], 50);
	TextDrawUseBox(pkills[8], 0);
	TextDrawSetProportional(pkills[8], 1);
	TextDrawSetSelectable(pkills[8], 0);

	pkills[9] = TextDrawCreate(6.000000, 223.000000, "1. Marco Cruz");
	TextDrawFont(pkills[9], 1);
	TextDrawLetterSize(pkills[9], 0.245832, 1.050000);
	TextDrawTextSize(pkills[9], 400.000000, 17.000000);
	TextDrawSetOutline(pkills[9], 0);
	TextDrawSetShadow(pkills[9], 0);
	TextDrawAlignment(pkills[9], 1);
	TextDrawColor(pkills[9], -1);
	TextDrawBackgroundColor(pkills[9], 255);
	TextDrawBoxColor(pkills[9], 50);
	TextDrawUseBox(pkills[9], 0);
	TextDrawSetProportional(pkills[9], 1);
	TextDrawSetSelectable(pkills[9], 0);

	PPurgeTD[6] = TextDrawCreate(6.000000, 236.000000, "DEATHS");
	TextDrawFont(PPurgeTD[6], 1);
	TextDrawLetterSize(PPurgeTD[6], 0.270832, 1.200000);
	TextDrawTextSize(PPurgeTD[6], 400.000000, 17.000000);
	TextDrawSetOutline(PPurgeTD[6], 0);
	TextDrawSetShadow(PPurgeTD[6], 0);
	TextDrawAlignment(PPurgeTD[6], 1);
	TextDrawColor(PPurgeTD[6], -16776961);
	TextDrawBackgroundColor(PPurgeTD[6], 255);
	TextDrawBoxColor(PPurgeTD[6], 50);
	TextDrawUseBox(PPurgeTD[6], 0);
	TextDrawSetProportional(PPurgeTD[6], 1);
	TextDrawSetSelectable(PPurgeTD[6], 0);

	pdeaths[0] = TextDrawCreate(6.000000, 249.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[0], 1);
	TextDrawLetterSize(pdeaths[0], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[0], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[0], 0);
	TextDrawSetShadow(pdeaths[0], 0);
	TextDrawAlignment(pdeaths[0], 1);
	TextDrawColor(pdeaths[0], -1);
	TextDrawBackgroundColor(pdeaths[0], 255);
	TextDrawBoxColor(pdeaths[0], 50);
	TextDrawUseBox(pdeaths[0], 0);
	TextDrawSetProportional(pdeaths[0], 1);
	TextDrawSetSelectable(pdeaths[0], 0);

	pdeaths[1] = TextDrawCreate(6.000000, 258.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[1], 1);
	TextDrawLetterSize(pdeaths[1], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[1], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[1], 0);
	TextDrawSetShadow(pdeaths[1], 0);
	TextDrawAlignment(pdeaths[1], 1);
	TextDrawColor(pdeaths[1], -1);
	TextDrawBackgroundColor(pdeaths[1], 255);
	TextDrawBoxColor(pdeaths[1], 50);
	TextDrawUseBox(pdeaths[1], 0);
	TextDrawSetProportional(pdeaths[1], 1);
	TextDrawSetSelectable(pdeaths[1], 0);

	pdeaths[2] = TextDrawCreate(6.000000, 267.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[2], 1);
	TextDrawLetterSize(pdeaths[2], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[2], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[2], 0);
	TextDrawSetShadow(pdeaths[2], 0);
	TextDrawAlignment(pdeaths[2], 1);
	TextDrawColor(pdeaths[2], -1);
	TextDrawBackgroundColor(pdeaths[2], 255);
	TextDrawBoxColor(pdeaths[2], 50);
	TextDrawUseBox(pdeaths[2], 0);
	TextDrawSetProportional(pdeaths[2], 1);
	TextDrawSetSelectable(pdeaths[2], 0);

	pdeaths[3] = TextDrawCreate(6.000000, 276.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[3], 1);
	TextDrawLetterSize(pdeaths[3], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[3], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[3], 0);
	TextDrawSetShadow(pdeaths[3], 0);
	TextDrawAlignment(pdeaths[3], 1);
	TextDrawColor(pdeaths[3], -1);
	TextDrawBackgroundColor(pdeaths[3], 255);
	TextDrawBoxColor(pdeaths[3], 50);
	TextDrawUseBox(pdeaths[3], 0);
	TextDrawSetProportional(pdeaths[3], 1);
	TextDrawSetSelectable(pdeaths[3], 0);

	pdeaths[4] = TextDrawCreate(6.000000, 285.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[4], 1);
	TextDrawLetterSize(pdeaths[4], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[4], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[4], 0);
	TextDrawSetShadow(pdeaths[4], 0);
	TextDrawAlignment(pdeaths[4], 1);
	TextDrawColor(pdeaths[4], -1);
	TextDrawBackgroundColor(pdeaths[4], 255);
	TextDrawBoxColor(pdeaths[4], 50);
	TextDrawUseBox(pdeaths[4], 0);
	TextDrawSetProportional(pdeaths[4], 1);
	TextDrawSetSelectable(pdeaths[4], 0);

	pdeaths[5] = TextDrawCreate(6.000000, 294.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[5], 1);
	TextDrawLetterSize(pdeaths[5], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[5], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[5], 0);
	TextDrawSetShadow(pdeaths[5], 0);
	TextDrawAlignment(pdeaths[5], 1);
	TextDrawColor(pdeaths[5], -1);
	TextDrawBackgroundColor(pdeaths[5], 255);
	TextDrawBoxColor(pdeaths[5], 50);
	TextDrawUseBox(pdeaths[5], 0);
	TextDrawSetProportional(pdeaths[5], 1);
	TextDrawSetSelectable(pdeaths[5], 0);

	pdeaths[6] = TextDrawCreate(6.000000, 303.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[6], 1);
	TextDrawLetterSize(pdeaths[6], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[6], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[6], 0);
	TextDrawSetShadow(pdeaths[6], 0);
	TextDrawAlignment(pdeaths[6], 1);
	TextDrawColor(pdeaths[6], -1);
	TextDrawBackgroundColor(pdeaths[6], 255);
	TextDrawBoxColor(pdeaths[6], 50);
	TextDrawUseBox(pdeaths[6], 0);
	TextDrawSetProportional(pdeaths[6], 1);
	TextDrawSetSelectable(pdeaths[6], 0);

	pdeaths[7] = TextDrawCreate(6.000000, 312.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[7], 1);
	TextDrawLetterSize(pdeaths[7], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[7], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[7], 0);
	TextDrawSetShadow(pdeaths[7], 0);
	TextDrawAlignment(pdeaths[7], 1);
	TextDrawColor(pdeaths[7], -1);
	TextDrawBackgroundColor(pdeaths[7], 255);
	TextDrawBoxColor(pdeaths[7], 50);
	TextDrawUseBox(pdeaths[7], 0);
	TextDrawSetProportional(pdeaths[7], 1);
	TextDrawSetSelectable(pdeaths[7], 0);

	pdeaths[8] = TextDrawCreate(6.000000, 321.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[8], 1);
	TextDrawLetterSize(pdeaths[8], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[8], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[8], 0);
	TextDrawSetShadow(pdeaths[8], 0);
	TextDrawAlignment(pdeaths[8], 1);
	TextDrawColor(pdeaths[8], -1);
	TextDrawBackgroundColor(pdeaths[8], 255);
	TextDrawBoxColor(pdeaths[8], 50);
	TextDrawUseBox(pdeaths[8], 0);
	TextDrawSetProportional(pdeaths[8], 1);
	TextDrawSetSelectable(pdeaths[8], 0);

	pdeaths[9] = TextDrawCreate(6.000000, 330.000000, "1. Marco Cruz");
	TextDrawFont(pdeaths[9], 1);
	TextDrawLetterSize(pdeaths[9], 0.245832, 1.050000);
	TextDrawTextSize(pdeaths[9], 400.000000, 17.000000);
	TextDrawSetOutline(pdeaths[9], 0);
	TextDrawSetShadow(pdeaths[9], 0);
	TextDrawAlignment(pdeaths[9], 1);
	TextDrawColor(pdeaths[9], -1);
	TextDrawBackgroundColor(pdeaths[9], 255);
	TextDrawBoxColor(pdeaths[9], 50);
	TextDrawUseBox(pdeaths[9], 0);
	TextDrawSetProportional(pdeaths[9], 1);
	TextDrawSetSelectable(pdeaths[9], 0);
}

CreatePurgeTD(playerid)
{
    PurgeTD[playerid][0] = CreatePlayerTextDraw(playerid, 281.000000, 391.000000, "123");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][0], 0.300000, 1.200000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][0], 0);

	PurgeTD[playerid][1] = CreatePlayerTextDraw(playerid, 358.000000, 391.000000, "123");
	PlayerTextDrawFont(playerid, PurgeTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, PurgeTD[playerid][1], 0.300000, 1.200000);
	PlayerTextDrawTextSize(playerid, PurgeTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PurgeTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, PurgeTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PurgeTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, PurgeTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PurgeTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PurgeTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PurgeTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PurgeTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PurgeTD[playerid][1], 0);
}

DestroyPurgePTD(playerid = INVALID_PLAYER_ID)
{
    for(new i = 0; i < 10; i++)
    {
        if(pkills[i] != Text:INVALID_TEXT_DRAW)
		{
			TextDrawDestroy(pkills[i]);
			pkills[i] = Text:INVALID_TEXT_DRAW;
		}
        if(pdeaths[i] != Text:INVALID_TEXT_DRAW)
		{
			TextDrawDestroy(pdeaths[i]);
			pdeaths[i] = Text:INVALID_TEXT_DRAW;
		}
    }

    for(new a = 0; a < 7; a++)
    {
        if(PPurgeTD[a] != Text:INVALID_TEXT_DRAW)
		{
			TextDrawDestroy(PPurgeTD[a]);
			PPurgeTD[a] = Text:INVALID_TEXT_DRAW;
		}
    }

    if(PurgeTD[playerid][0] != PlayerText:INVALID_TEXT_DRAW)
    {
		PlayerTextDrawDestroy(playerid, PurgeTD[playerid][0]);
        PurgeTD[playerid][0] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(PurgeTD[playerid][1] != PlayerText:INVALID_TEXT_DRAW)
    {
		PlayerTextDrawDestroy(playerid, PurgeTD[playerid][1]);
        PurgeTD[playerid][1] = PlayerText:INVALID_TEXT_DRAW;
    }
}

UpdatePurge()
{
    new Cache:Result, Cache:Result1, name[MAX_PLAYER_NAME], kills, deaths, fString[128];

    Result = mysql_query(connectionID, "SELECT purgekills1, username FROM users ORDER BY purgekills1 DESC LIMIT 10");
    if(cache_num_rows())
    {
        for(new i = 0; i < cache_num_rows(); ++ i)
        {
            cache_get_field_content(i, "username", name);
            kills = cache_get_field_content_int(i, "purgekills1");

            format(fString, sizeof(fString), "%i. %s (%i kills)", i + 1, name, kills);
            TextDrawSetString(pkills[i], fString);
        }
    }
    cache_delete(Result);

    Result1 = mysql_query(connectionID, "SELECT purgedeaths1, username FROM users ORDER BY purgedeaths1 DESC LIMIT 10");
    if(cache_num_rows())
    {
        for(new i = 0; i < cache_num_rows(); ++ i)
        {
            cache_get_field_content(i, "username", name);
            deaths = cache_get_field_content_int(i, "purgedeaths1");

            format(fString, sizeof(fString), "%i. %s (%i deaths)", i + 1, name, deaths);
            TextDrawSetString(pdeaths[i], fString);
        }
    }
    cache_delete(Result1);

    foreach(new a: Player)
    {
        for(new i = 0; i < 10; i++)
        {
            TextDrawHideForPlayer(a, pkills[i]);
            TextDrawShowForPlayer(a, pkills[i]);
            
            TextDrawHideForPlayer(a, pdeaths[i]);
            TextDrawShowForPlayer(a, pdeaths[i]);
        }
    }
}