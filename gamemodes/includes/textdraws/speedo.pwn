ShowSpeedo(playerid)
{
    speed_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 320.0002, 377.0818, "Elegy");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][2], 0.2737, 1.3179);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][2], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][2], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][2], 0x1F1B18FF);
	PlayerTextDrawSetOutline(playerid, speed_PTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][2], 0);

	speed_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 319.7336, 392.4298, "0");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][3], 0.2533, 1.7493);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][3], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][3], 0xFFA500FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][3], 0xFFA5000D);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][3], 2);
	PlayerTextDrawSetOutline(playerid, speed_PTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][3], 0);

	speed_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 361.8334, 395.0483, "D");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][4], -0.3073, 1.7256);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][4], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][4], 0x3CB6FFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][4], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][4], 0);

	speed_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 361.6334, 393.8038, "=");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][5], 0.2367, 1.7879);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][5], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][5], 0x3CB6FFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][5], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][5], 0);

	speed_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 367.3667, 400.1894, "-");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][6], -0.6156, 1.3415);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][6], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][6], 0x3CB6FFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][6], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][6], 0);

	speed_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 380.8007, 398.2332, "0");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][7], 0.3847, 1.3374);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][7], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][7], 0xA52A2AFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][7], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][7], 0);

	speed_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 382.0007, 401.6813, "U");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][8], 0.2813, -0.3716);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][8], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][8], 0xA52A2AFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][8], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][8], 0);

	speed_PTD[playerid][9] = CreatePlayerTextDraw(playerid, 252.0000, 393.9335, "0");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][9], 0.4617, 1.9662);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][9], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][9], 0xFFFF00FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][9], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][9], 0);

	speed_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 256.8333, 401.6854, "/");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][10], 0.1630, 0.4385);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][10], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][10], 0xFFFF00FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][10], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][10], 0);

	speed_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 278.2999, 398.3373, "U");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][11], 0.2660, 1.4797);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][11], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][11], 0x008000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][11], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][11], 0);

	speed_PTD[playerid][12] = CreatePlayerTextDraw(playerid, 276.3334, 409.7668, "J");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][12], 0.2306, -1.4817);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][12], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][12], 0x008000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][12], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][12], 0);

	speed_PTD[playerid][13] = CreatePlayerTextDraw(playerid, 287.2340, 409.7668, "J");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][13], -0.2374, -1.4817);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][13], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][13], 0x008000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][13], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][13], 0);

	speed_PTD[playerid][14] = CreatePlayerTextDraw(playerid, 317.1669, 433.5225, "(");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][14], 0.3823, 0.8450);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][14], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][14], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][14], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][14], 0);

	speed_PTD[playerid][15] = CreatePlayerTextDraw(playerid, 319.2665, 430.8926, "o");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][15], 0.2130, 1.0619);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][15], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][15], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][15], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][15], 0x000000FF);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][15], 0);

	speed_PTD[playerid][16] = CreatePlayerTextDraw(playerid, 318.5669, 432.2077, ")");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][16], 0.3333, 0.8989);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][16], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][16], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][16], 0xFFFFFFFF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][16], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][16], 0);

	speed_PTD[playerid][17] = CreatePlayerTextDraw(playerid, 392.3999, 424.9703, "38.5");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][17], 0.2003, 1.0027);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][17], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][17], 1);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][17], 0xFFA900FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][17], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][17], 0);

	speed_PTD[playerid][18] = CreatePlayerTextDraw(playerid,281.0002, 414.1855, "ENGINE");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][18], 0.1940, 0.8699);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][18], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][18], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][18], 0x000000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][18], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][18], 0);

	speed_PTD[playerid][19] = CreatePlayerTextDraw(playerid, 360.2010, 414.1855, "LIGHT");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][19], 0.1940, 0.8699);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][19], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][19], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][19], 0x000000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][19], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][19], 0);

	speed_PTD[playerid][20] = CreatePlayerTextDraw(playerid,385.4013, 414.1855, "DOORS");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][20], 0.1940, 0.8699);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][20], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][20], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][20], 0x000000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][20], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][20], 0);

	speed_PTD[playerid][21] = CreatePlayerTextDraw(playerid, 257.0000, 414.1855, "BELT");
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][21], 0.1940, 0.8699);
	PlayerTextDrawTextSize(playerid, speed_PTD[playerid][21], 1280.0000, 1280.0000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][21], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][21], 0x000000FF);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][21], 0x000000FF);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][21], 0);

    SetTimerEx("ShowAllSpeedo", 500, false, "i", playerid);
    return 1;
}