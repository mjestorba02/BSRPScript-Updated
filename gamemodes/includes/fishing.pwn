new PlayerText:FishingTD[MAX_PLAYERS][9];
new PlayerText:cshake1[MAX_PLAYERS];
new PlayerText:cshake4[MAX_PLAYERS];
new PlayerText:cshake2[MAX_PLAYERS];
new PlayerText:cshake3[MAX_PLAYERS];
new PlayerText:cshake5[MAX_PLAYERS];
new PlayerText:cshake7[MAX_PLAYERS];
new PlayerText:cshake6[MAX_PLAYERS];
new PlayerText:cshake8[MAX_PLAYERS];
new PlayerText:cshake9[MAX_PLAYERS];

CreateFishingTD(playerid)
{
    cshake1[playerid] = CreatePlayerTextDraw(playerid, 211.000000, 136.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake1[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake1[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake1[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake1[playerid], 1);
	PlayerTextDrawColor(playerid, cshake1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake1[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake1[playerid], 1);

	cshake4[playerid] = CreatePlayerTextDraw(playerid, 245.000000, 235.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake4[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake4[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake4[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake4[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake4[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake4[playerid], 1);
	PlayerTextDrawColor(playerid, cshake4[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake4[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake4[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake4[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake4[playerid], 1);

	cshake2[playerid] = CreatePlayerTextDraw(playerid, 146.000000, 199.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake2[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake2[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake2[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake2[playerid], 1);
	PlayerTextDrawColor(playerid, cshake2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake2[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake2[playerid], 1);

	cshake3[playerid] = CreatePlayerTextDraw(playerid, 176.000000, 293.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake3[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake3[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake3[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake3[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake3[playerid], 1);
	PlayerTextDrawColor(playerid, cshake3[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake3[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake3[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake3[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake3[playerid], 1);

	cshake5[playerid] = CreatePlayerTextDraw(playerid, 337.000000, 132.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake5[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake5[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake5[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake5[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake5[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake5[playerid], 1);
	PlayerTextDrawColor(playerid, cshake5[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake5[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake5[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake5[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake5[playerid], 1);

	cshake7[playerid] = CreatePlayerTextDraw(playerid, 364.000000, 216.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake7[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake7[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake7[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake7[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake7[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake7[playerid], 1);
	PlayerTextDrawColor(playerid, cshake7[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake7[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake7[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake7[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake7[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake7[playerid], 1);

	cshake6[playerid] = CreatePlayerTextDraw(playerid, 321.000000, 309.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake6[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake6[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake6[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake6[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake6[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake6[playerid], 1);
	PlayerTextDrawColor(playerid, cshake6[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake6[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake6[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake6[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake6[playerid], 1);

	cshake8[playerid] = CreatePlayerTextDraw(playerid, 457.000000, 269.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake8[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake8[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake8[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake8[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake8[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake8[playerid], 1);
	PlayerTextDrawColor(playerid, cshake8[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake8[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake8[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake8[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake8[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake8[playerid], 1);

	FishingTD[playerid][0] = CreatePlayerTextDraw(playerid, 247.000000, 161.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][0], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][0], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][0], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][0], 0);

	FishingTD[playerid][1] = CreatePlayerTextDraw(playerid, 182.000000, 224.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][1], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][1], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][1], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][1], 0);

	FishingTD[playerid][2] = CreatePlayerTextDraw(playerid, 211.000000, 319.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][2], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][2], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][2], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][2], 0);

	FishingTD[playerid][3] = CreatePlayerTextDraw(playerid, 280.000000, 260.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][3], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][3], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][3], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][3], 0);

	FishingTD[playerid][4] = CreatePlayerTextDraw(playerid, 357.000000, 333.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][4], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][4], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][4], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][4], 0);

	FishingTD[playerid][5] = CreatePlayerTextDraw(playerid, 399.000000, 241.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][5], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][5], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][5], 0);

	FishingTD[playerid][6] = CreatePlayerTextDraw(playerid, 373.000000, 157.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][6], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][6], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][6], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][6], 0);

	FishingTD[playerid][7] = CreatePlayerTextDraw(playerid, 493.000000, 294.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][7], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][7], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][7], 255);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][7], 0);

	cshake9[playerid] = CreatePlayerTextDraw(playerid, 457.000000, 139.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, cshake9[playerid], 4);
	PlayerTextDrawLetterSize(playerid, cshake9[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, cshake9[playerid], 70.000000, 70.000000);
	PlayerTextDrawSetOutline(playerid, cshake9[playerid], 1);
	PlayerTextDrawSetShadow(playerid, cshake9[playerid], 0);
	PlayerTextDrawAlignment(playerid, cshake9[playerid], 1);
	PlayerTextDrawColor(playerid, cshake9[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, cshake9[playerid], 255);
	PlayerTextDrawBoxColor(playerid, cshake9[playerid], 50);
	PlayerTextDrawUseBox(playerid, cshake9[playerid], 1);
	PlayerTextDrawSetProportional(playerid, cshake9[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, cshake9[playerid], 1);

	FishingTD[playerid][8] = CreatePlayerTextDraw(playerid, 493.000000, 164.000000, "SHAKE");
	PlayerTextDrawFont(playerid, FishingTD[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, FishingTD[playerid][8], 0.270832, 2.000000);
	PlayerTextDrawTextSize(playerid, FishingTD[playerid][8], 400.000000, 47.000000);
	PlayerTextDrawSetOutline(playerid, FishingTD[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, FishingTD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, FishingTD[playerid][8], 2);
	PlayerTextDrawColor(playerid, FishingTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, FishingTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, FishingTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, FishingTD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, FishingTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, FishingTD[playerid][8], 0);
	return 1;
}

ShowFishingTD(playerid)
{
	PlayerTextDrawShow(playerid, FishingTD[playerid][0]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][1]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][2]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][3]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][4]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][5]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][6]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][7]);
	PlayerTextDrawShow(playerid, FishingTD[playerid][8]);
	PlayerTextDrawShow(playerid, cshake1[playerid]);
	PlayerTextDrawShow(playerid, cshake4[playerid]);
	PlayerTextDrawShow(playerid, cshake2[playerid]);
	PlayerTextDrawShow(playerid, cshake3[playerid]);
	PlayerTextDrawShow(playerid, cshake5[playerid]);
	PlayerTextDrawShow(playerid, cshake7[playerid]);
	PlayerTextDrawShow(playerid, cshake6[playerid]);
	PlayerTextDrawShow(playerid, cshake8[playerid]);
	PlayerTextDrawShow(playerid, cshake9[playerid]);
	return 1;
}

DestroyFishingTD(playerid)
{
    PlayerTextDrawHide(playerid, FishingTD[playerid][0]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][1]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][2]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][3]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][4]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][5]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][6]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][7]);
	PlayerTextDrawHide(playerid, FishingTD[playerid][8]);
	PlayerTextDrawHide(playerid, cshake1[playerid]);
	PlayerTextDrawHide(playerid, cshake4[playerid]);
	PlayerTextDrawHide(playerid, cshake2[playerid]);
	PlayerTextDrawHide(playerid, cshake3[playerid]);
	PlayerTextDrawHide(playerid, cshake5[playerid]);
	PlayerTextDrawHide(playerid, cshake7[playerid]);
	PlayerTextDrawHide(playerid, cshake6[playerid]);
	PlayerTextDrawHide(playerid, cshake8[playerid]);
	PlayerTextDrawHide(playerid, cshake9[playerid]);
	
	DestroyFishingTD1(playerid);
	
	return 1;
}

stock DestroyFishingTD1(playerid)
{
	for(new i = 0; i < 8; i++)
	{
		PlayerTextDrawDestroy(playerid, FishingTD[playerid][i]);
		FishingTD[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
	}
	PlayerTextDrawDestroy(playerid, cshake1[playerid]);
	PlayerTextDrawDestroy(playerid, cshake4[playerid]);
	PlayerTextDrawDestroy(playerid, cshake2[playerid]);
	PlayerTextDrawDestroy(playerid, cshake3[playerid]);
	PlayerTextDrawDestroy(playerid, cshake5[playerid]);
	PlayerTextDrawDestroy(playerid, cshake7[playerid]);
	PlayerTextDrawDestroy(playerid, cshake6[playerid]);
	PlayerTextDrawDestroy(playerid, cshake8[playerid]);
	PlayerTextDrawDestroy(playerid, cshake9[playerid]);

	cshake1[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake2[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake3[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake4[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake5[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake6[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake7[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake8[playerid] = PlayerText:INVALID_TEXT_DRAW;
	cshake9[playerid] = PlayerText:INVALID_TEXT_DRAW;
}