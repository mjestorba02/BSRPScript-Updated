new PlayerText:ReelTD[MAX_PLAYERS][5];

stock CreateReelTD(playerid)
{
	ReelTD[playerid][0] = CreatePlayerTextDraw(playerid, 317.000000, 299.000000, "_");
	PlayerTextDrawFont(playerid, ReelTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, ReelTD[playerid][0], 0.600000, 2.200001);
	PlayerTextDrawTextSize(playerid, ReelTD[playerid][0], 298.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, ReelTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, ReelTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, ReelTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, ReelTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ReelTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ReelTD[playerid][0], 255);
	PlayerTextDrawUseBox(playerid, ReelTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ReelTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ReelTD[playerid][0], 0);

	ReelTD[playerid][1] = CreatePlayerTextDraw(playerid, 334.000000, 323.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, ReelTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, ReelTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ReelTD[playerid][1], 25.000000, 38.000000);
	PlayerTextDrawSetOutline(playerid, ReelTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ReelTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, ReelTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, ReelTD[playerid][1], 343908607);
	PlayerTextDrawBackgroundColor(playerid, ReelTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ReelTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, ReelTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ReelTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ReelTD[playerid][1], 0);

	ReelTD[playerid][2] = CreatePlayerTextDraw(playerid, 317.000000, 331.000000, "REEL");
	PlayerTextDrawFont(playerid, ReelTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, ReelTD[playerid][2], 0.824998, 2.449999);
	PlayerTextDrawTextSize(playerid, ReelTD[playerid][2], 400.000000, 57.500000);
	PlayerTextDrawSetOutline(playerid, ReelTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, ReelTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, ReelTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, ReelTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, ReelTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ReelTD[playerid][2], 343908607);
	PlayerTextDrawUseBox(playerid, ReelTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ReelTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ReelTD[playerid][2], 1);

	ReelTD[playerid][3] = CreatePlayerTextDraw(playerid, 275.000000, 323.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, ReelTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, ReelTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ReelTD[playerid][3], 25.000000, 38.000000);
	PlayerTextDrawSetOutline(playerid, ReelTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, ReelTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, ReelTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, ReelTD[playerid][3], 343908607);
	PlayerTextDrawBackgroundColor(playerid, ReelTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, ReelTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, ReelTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, ReelTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ReelTD[playerid][3], 0);

	ReelTD[playerid][4] = CreatePlayerTextDraw(playerid, 244.000000, 302.000000, "_");
	PlayerTextDrawFont(playerid, ReelTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, ReelTD[playerid][4], 0.600000, 1.500003);
	PlayerTextDrawTextSize(playerid, ReelTD[playerid][4], 242.000000, 291.000000);
	PlayerTextDrawSetOutline(playerid, ReelTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, ReelTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, ReelTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, ReelTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, ReelTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, ReelTD[playerid][4], -16776961);
	PlayerTextDrawUseBox(playerid, ReelTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, ReelTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ReelTD[playerid][4], 0);
}

stock ShowReelTD(playerid)
{
	for(new i = 0; i < 5; i++)
    {
         PlayerTextDrawShow(playerid, ReelTD[playerid][i]);
    }
}

stock DestroyReelTD(playerid) 
{
	for(new i = 0; i < 5; i++)
    {
        PlayerTextDrawHide(playerid, ReelTD[playerid][i]);
    }

    DestroyReelTD1(playerid);
}

stock DestroyReelTD1(playerid)
{
    for(new i = 0; i < 5; i++)
    {
        if(ReelTD[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
        {
            PlayerTextDrawDestroy(playerid, ReelTD[playerid][i]);
            ReelTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
        }

    }
}