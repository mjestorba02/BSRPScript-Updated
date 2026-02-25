ShowScoreB(playerid)
{
    //ScoreBoard
	ScoreBTD[playerid][0] = CreatePlayerTextDraw(playerid, 538.000000, 302.000000, "_");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][0], 0.600000, 8.250004);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][0], 298.500000, 115.500000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][0], 2);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][0], -1094795521);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][0], 0);

	ScoreBTD[playerid][1] = CreatePlayerTextDraw(playerid, 538.000000, 306.000000, "_");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][1], 0.600000, 7.550004);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][1], 298.500000, 112.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][1], 2);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][1], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][1], 255);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][1], 0);

	ScoreBTD[playerid][2] = CreatePlayerTextDraw(playerid, 536.299987, 302.000000, "_");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][2], 0.600000, 0.800005);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][2], 298.500000, 112.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][2], 4);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][2], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][2], -2686721);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][2], 0);

	ScoreBTD[playerid][3] = CreatePlayerTextDraw(playerid, 539.000000, 302.000000, "_");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][3], 0.600000, 0.800005);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][3], 596.000000, 58.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][3], 3);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][3], 2);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][3], 9145343);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][3], 0);

	ScoreBTD[playerid][4] = CreatePlayerTextDraw(playerid, 538.000000, 367.000000, "_");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][4], 0.600000, 0.800005);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][4], 298.500000, 112.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][4], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][4], 16711935);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][4], 0);

	ScoreBTD[playerid][5] = CreatePlayerTextDraw(playerid, 539.000000, 312.000000, "Score");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][5], 0.195831, 1.149999);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][5], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][5], 0);

	ScoreBTD[playerid][6] = CreatePlayerTextDraw(playerid, 509.000000, 331.000000, "0");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][6], 0.699998, 3.349997);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][6], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][6], 0);

	ScoreBTD[playerid][7] = CreatePlayerTextDraw(playerid, 567.000000, 331.000000, "0");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][7], 0.699998, 3.349997);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][7], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][7], 0);

	ScoreBTD[playerid][8] = CreatePlayerTextDraw(playerid, 538.000000, 366.000000, "Wager:");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][8], 0.170833, 1.049998);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][8], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][8], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][8], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][8], 0);

	ScoreBTD[playerid][9] = CreatePlayerTextDraw(playerid, 508.000000, 300.000000, "Pending");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][9], 0.129166, 1.049998);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][9], 390.500000, 53.500000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][9], 4);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][9], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][9], 0);

	ScoreBTD[playerid][10] = CreatePlayerTextDraw(playerid, 568.000000, 300.000000, "Pending");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][10], 0.129166, 1.049998);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][10], 390.500000, 55.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][10], 4);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][10], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][10], 0);

	ScoreBTD[playerid][11] = CreatePlayerTextDraw(playerid, 509.000000, 327.000000, "Solid");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][11], 0.154164, 0.949999);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][11], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][11], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][11], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][11], 0);

	ScoreBTD[playerid][12] = CreatePlayerTextDraw(playerid, 567.000000, 327.000000, "Stripes");
	PlayerTextDrawFont(playerid, ScoreBTD[playerid][12], 2);
	PlayerTextDrawLetterSize(playerid, ScoreBTD[playerid][12], 0.154164, 0.949999);
	PlayerTextDrawTextSize(playerid, ScoreBTD[playerid][12], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, ScoreBTD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, ScoreBTD[playerid][12], 1);
	PlayerTextDrawAlignment(playerid, ScoreBTD[playerid][12], 2);
	PlayerTextDrawColor(playerid, ScoreBTD[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, ScoreBTD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, ScoreBTD[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, ScoreBTD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, ScoreBTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, ScoreBTD[playerid][12], 0);

    PlayerTextDrawShow(playerid, ScoreBTD[playerid][0]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][1]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][2]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][3]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][4]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][5]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][6]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][7]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][8]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][9]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][10]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][11]);
	PlayerTextDrawShow(playerid, ScoreBTD[playerid][12]);
}

ShowController(playerid)
{
    //Controller
	PoolCTD[playerid][0] = CreatePlayerTextDraw(playerid, 429.000000, 313.000000, "ld_beat:circle");
	PlayerTextDrawFont(playerid, PoolCTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD[playerid][0], 30.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD[playerid][0], 4);
	PlayerTextDrawSetShadow(playerid, PoolCTD[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, PoolCTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, PoolCTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD[playerid][0], 1);

	PoolCTD[playerid][1] = CreatePlayerTextDraw(playerid, 96.000000, 311.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PoolCTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD[playerid][1], 31.000000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD[playerid][1], 4);
	PlayerTextDrawSetShadow(playerid, PoolCTD[playerid][1], 1);
	PlayerTextDrawAlignment(playerid, PoolCTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, PoolCTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD[playerid][1], 1);

	PoolCTD[playerid][2] = CreatePlayerTextDraw(playerid, 155.000000, 311.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, PoolCTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD[playerid][2], 31.000000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD[playerid][2], 4);
	PlayerTextDrawSetShadow(playerid, PoolCTD[playerid][2], 1);
	PlayerTextDrawAlignment(playerid, PoolCTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, PoolCTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD[playerid][2], 1);

	PoolCTD[playerid][3] = CreatePlayerTextDraw(playerid, 382.000000, 314.000000, "ld_beat:cross");
	PlayerTextDrawFont(playerid, PoolCTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD[playerid][3], 31.000000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, PoolCTD[playerid][3], 1);
	PlayerTextDrawAlignment(playerid, PoolCTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, PoolCTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD[playerid][3], 1);

    PlayerTextDrawShow(playerid, PoolCTD[playerid][0]);
	PlayerTextDrawShow(playerid, PoolCTD[playerid][1]);
	PlayerTextDrawShow(playerid, PoolCTD[playerid][2]);
	PlayerTextDrawShow(playerid, PoolCTD[playerid][3]);
}

ShowController1(playerid)
{
    PoolCTD1[playerid][0] = CreatePlayerTextDraw(playerid, 171.000000, 366.000000, "ld_beat:down");
	PlayerTextDrawFont(playerid, PoolCTD1[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD1[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD1[playerid][0], 26.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD1[playerid][0], 2);
	PlayerTextDrawSetShadow(playerid, PoolCTD1[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PoolCTD1[playerid][0], 2);
	PlayerTextDrawColor(playerid, PoolCTD1[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD1[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD1[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD1[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD1[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD1[playerid][0], 1);

	PoolCTD1[playerid][1] = CreatePlayerTextDraw(playerid, 172.000000, 262.000000, "ld_beat:up");
	PlayerTextDrawFont(playerid, PoolCTD1[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD1[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD1[playerid][1], 26.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD1[playerid][1], 2);
	PlayerTextDrawSetShadow(playerid, PoolCTD1[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PoolCTD1[playerid][1], 2);
	PlayerTextDrawColor(playerid, PoolCTD1[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD1[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD1[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD1[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD1[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD1[playerid][1], 1);

	PoolCTD1[playerid][2] = CreatePlayerTextDraw(playerid, 218.000000, 312.000000, "ld_beat:right");
	PlayerTextDrawFont(playerid, PoolCTD1[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD1[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD1[playerid][2], 27.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD1[playerid][2], 2);
	PlayerTextDrawSetShadow(playerid, PoolCTD1[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PoolCTD1[playerid][2], 2);
	PlayerTextDrawColor(playerid, PoolCTD1[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD1[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD1[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD1[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD1[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD1[playerid][2], 1);

	PoolCTD1[playerid][3] = CreatePlayerTextDraw(playerid, 125.000000, 312.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, PoolCTD1[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD1[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD1[playerid][3], 26.500000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD1[playerid][3], 2);
	PlayerTextDrawSetShadow(playerid, PoolCTD1[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, PoolCTD1[playerid][3], 2);
	PlayerTextDrawColor(playerid, PoolCTD1[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD1[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD1[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD1[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD1[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD1[playerid][3], 1);

	PoolCTD1[playerid][4] = CreatePlayerTextDraw(playerid, 171.000000, 312.000000, "ld_beat:circle");
	PlayerTextDrawFont(playerid, PoolCTD1[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, PoolCTD1[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PoolCTD1[playerid][4], 26.000000, 29.000000);
	PlayerTextDrawSetOutline(playerid, PoolCTD1[playerid][4], 2);
	PlayerTextDrawSetShadow(playerid, PoolCTD1[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, PoolCTD1[playerid][4], 2);
	PlayerTextDrawColor(playerid, PoolCTD1[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, PoolCTD1[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, PoolCTD1[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, PoolCTD1[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, PoolCTD1[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, PoolCTD1[playerid][4], 1);
    
    PlayerTextDrawShow(playerid, PoolCTD1[playerid][0]);
	PlayerTextDrawShow(playerid, PoolCTD1[playerid][1]);
	PlayerTextDrawShow(playerid, PoolCTD1[playerid][2]);
	PlayerTextDrawShow(playerid, PoolCTD1[playerid][3]);
	PlayerTextDrawShow(playerid, PoolCTD1[playerid][4]);
}