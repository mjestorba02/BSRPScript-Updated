CreateLogsTD(playerid)
{
    LogsTD[playerid][0] = CreatePlayerTextDraw(playerid, 319.000000, 139.000000, "_");
	PlayerTextDrawFont(playerid, LogsTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, LogsTD[playerid][0], 0.600000, 27.449985);
	PlayerTextDrawTextSize(playerid, LogsTD[playerid][0], 298.500000, 420.000000);
	PlayerTextDrawSetOutline(playerid, LogsTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, LogsTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, LogsTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, LogsTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, LogsTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, LogsTD[playerid][0], -1061109505);
	PlayerTextDrawUseBox(playerid, LogsTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, LogsTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, LogsTD[playerid][0], 0);

	LogsTD[playerid][1] = CreatePlayerTextDraw(playerid, 319.000000, 139.000000, "_");
	PlayerTextDrawFont(playerid, LogsTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, LogsTD[playerid][1], 0.600000, 0.900003);
	PlayerTextDrawTextSize(playerid, LogsTD[playerid][1], 298.500000, 420.000000);
	PlayerTextDrawSetOutline(playerid, LogsTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, LogsTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, LogsTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, LogsTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, LogsTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, LogsTD[playerid][1], 255);
	PlayerTextDrawUseBox(playerid, LogsTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, LogsTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, LogsTD[playerid][1], 0);

	LogsTD[playerid][2] = CreatePlayerTextDraw(playerid, 319.000000, 154.000000, "_");
	PlayerTextDrawFont(playerid, LogsTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, LogsTD[playerid][2], 0.600000, 1.100003);
	PlayerTextDrawTextSize(playerid, LogsTD[playerid][2], 298.500000, 409.500000);
	PlayerTextDrawSetOutline(playerid, LogsTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, LogsTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, LogsTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, LogsTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, LogsTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, LogsTD[playerid][2], 135);
	PlayerTextDrawUseBox(playerid, LogsTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, LogsTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, LogsTD[playerid][2], 0);

	LogsTD[playerid][3] = CreatePlayerTextDraw(playerid, 319.000000, 170.000000, "_");
	PlayerTextDrawFont(playerid, LogsTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, LogsTD[playerid][3], 0.600000, 23.099971);
	PlayerTextDrawTextSize(playerid, LogsTD[playerid][3], 298.500000, 409.500000);
	PlayerTextDrawSetOutline(playerid, LogsTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, LogsTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, LogsTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, LogsTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, LogsTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, LogsTD[playerid][3], 135);
	PlayerTextDrawUseBox(playerid, LogsTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, LogsTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, LogsTD[playerid][3], 0);

	logname[playerid] = CreatePlayerTextDraw(playerid, 110.000000, 138.000000, "ADMIN LOGS");
	PlayerTextDrawFont(playerid, logname[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logname[playerid], 0.195833, 1.050000);
	PlayerTextDrawTextSize(playerid, logname[playerid], 400.000000, 280.500000);
	PlayerTextDrawSetOutline(playerid, logname[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logname[playerid], 0);
	PlayerTextDrawAlignment(playerid, logname[playerid], 1);
	PlayerTextDrawColor(playerid, logname[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logname[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logname[playerid], 50);
	PlayerTextDrawUseBox(playerid, logname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logname[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logname[playerid], 0);

	logclose[playerid] = CreatePlayerTextDraw(playerid, 524.000000, 138.000000, "X");
	PlayerTextDrawFont(playerid, logclose[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logclose[playerid], 0.412500, 1.050000);
	PlayerTextDrawTextSize(playerid, logclose[playerid], 11.000000, 13.000000);
	PlayerTextDrawSetOutline(playerid, logclose[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logclose[playerid], 0);
	PlayerTextDrawAlignment(playerid, logclose[playerid], 2);
	PlayerTextDrawColor(playerid, logclose[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logclose[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logclose[playerid], 50);
	PlayerTextDrawUseBox(playerid, logclose[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logclose[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logclose[playerid], 1);

	logsearch[playerid] = CreatePlayerTextDraw(playerid, 115.000000, 154.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logsearch[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logsearch[playerid], 0.195833, 1.050000);
	PlayerTextDrawTextSize(playerid, logsearch[playerid], 489.500000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logsearch[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logsearch[playerid], 0);
	PlayerTextDrawAlignment(playerid, logsearch[playerid], 1);
	PlayerTextDrawColor(playerid, logsearch[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logsearch[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logsearch[playerid], 50);
	PlayerTextDrawUseBox(playerid, logsearch[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logsearch[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logsearch[playerid], 1);

	logbutton[playerid] = CreatePlayerTextDraw(playerid, 511.000000, 154.000000, "SEARCH");
	PlayerTextDrawFont(playerid, logbutton[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logbutton[playerid], 0.195833, 1.050000);
	PlayerTextDrawTextSize(playerid, logbutton[playerid], 15.000000, 27.500000);
	PlayerTextDrawSetOutline(playerid, logbutton[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logbutton[playerid], 0);
	PlayerTextDrawAlignment(playerid, logbutton[playerid], 2);
	PlayerTextDrawColor(playerid, logbutton[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logbutton[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logbutton[playerid], 50);
	PlayerTextDrawUseBox(playerid, logbutton[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logbutton[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logbutton[playerid], 1);

	logdesc1[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 169.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc1[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc1[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc1[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc1[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc1[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc1[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc1[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc1[playerid], 0);

	logdesc2[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 178.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc2[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc2[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc2[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc2[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc2[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc2[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc2[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc2[playerid], 0);

	logdesc3[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 187.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc3[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc3[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc3[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc3[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc3[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc3[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc3[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc3[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc3[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc3[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc3[playerid], 0);

	logdesc4[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 196.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc4[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc4[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc4[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc4[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc4[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc4[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc4[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc4[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc4[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc4[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc4[playerid], 0);

	logdesc5[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 205.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc5[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc5[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc5[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc5[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc5[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc5[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc5[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc5[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc5[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc5[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc5[playerid], 0);

	logdesc6[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 214.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc6[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc6[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc6[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc6[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc6[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc6[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc6[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc6[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc6[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc6[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc6[playerid], 0);

	logdesc7[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 223.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc7[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc7[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc7[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc7[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc7[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc7[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc7[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc7[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc7[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc7[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc7[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc7[playerid], 0);

	logdesc8[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 232.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc8[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc8[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc8[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc8[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc8[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc8[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc8[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc8[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc8[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc8[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc8[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc8[playerid], 0);

	logdesc9[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 241.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc9[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc9[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc9[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc9[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc9[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc9[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc9[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc9[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc9[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc9[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc9[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc9[playerid], 0);

	logdesc10[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 250.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc10[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc10[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc10[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc10[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc10[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc10[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc10[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc10[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc10[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc10[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc10[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc10[playerid], 0);

	logdesc11[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 259.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc11[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc11[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc11[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc11[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc11[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc11[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc11[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc11[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc11[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc11[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc11[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc11[playerid], 0);

	logdesc12[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 268.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc12[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc12[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc12[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc12[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc12[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc12[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc12[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc12[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc12[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc12[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc12[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc12[playerid], 0);

	logdesc13[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 277.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc13[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc13[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc13[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc13[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc13[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc13[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc13[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc13[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc13[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc13[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc13[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc13[playerid], 0);

	logdesc14[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 286.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc14[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc14[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc14[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc14[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc14[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc14[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc14[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc14[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc14[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc14[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc14[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc14[playerid], 0);

	logdesc15[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 295.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc15[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc15[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc15[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc15[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc15[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc15[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc15[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc15[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc15[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc15[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc15[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc15[playerid], 0);

	logdesc16[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 304.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc16[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc16[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc16[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc16[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc16[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc16[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc16[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc16[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc16[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc16[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc16[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc16[playerid], 0);

	logdesc17[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 313.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc17[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc17[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc17[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc17[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc17[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc17[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc17[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc17[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc17[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc17[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc17[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc17[playerid], 0);

	logdesc18[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 322.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc18[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc18[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc18[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc18[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc18[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc18[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc18[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc18[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc18[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc18[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc18[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc18[playerid], 0);

	logdesc19[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 331.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc19[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc19[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc19[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc19[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc19[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc19[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc19[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc19[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc19[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc19[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc19[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc19[playerid], 0);

	logdesc20[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 340.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc20[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc20[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc20[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc20[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc20[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc20[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc20[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc20[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc20[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc20[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc20[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc20[playerid], 0);

	logdesc21[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 349.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc21[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc21[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc21[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc21[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc21[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc21[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc21[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc21[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc21[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc21[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc21[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc21[playerid], 0);

	logdesc22[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 358.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc22[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc22[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc22[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc22[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc22[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc22[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc22[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc22[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc22[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc22[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc22[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc22[playerid], 0);

	logdesc23[playerid] = CreatePlayerTextDraw(playerid, 114.000000, 367.000000, "Search a keyword");
	PlayerTextDrawFont(playerid, logdesc23[playerid], 1);
	PlayerTextDrawLetterSize(playerid, logdesc23[playerid], 0.145833, 1.050000);
	PlayerTextDrawTextSize(playerid, logdesc23[playerid], 524.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, logdesc23[playerid], 0);
	PlayerTextDrawSetShadow(playerid, logdesc23[playerid], 0);
	PlayerTextDrawAlignment(playerid, logdesc23[playerid], 1);
	PlayerTextDrawColor(playerid, logdesc23[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, logdesc23[playerid], 255);
	PlayerTextDrawBoxColor(playerid, logdesc23[playerid], 50);
	PlayerTextDrawUseBox(playerid, logdesc23[playerid], 0);
	PlayerTextDrawSetProportional(playerid, logdesc23[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, logdesc23[playerid], 0);

    PlayerTextDrawShow(playerid, LogsTD[playerid][0]);
    PlayerTextDrawShow(playerid, LogsTD[playerid][1]);
    PlayerTextDrawShow(playerid, LogsTD[playerid][2]);
    PlayerTextDrawShow(playerid, LogsTD[playerid][3]);
    PlayerTextDrawShow(playerid, logname[playerid]);
    PlayerTextDrawShow(playerid, logclose[playerid]);
    PlayerTextDrawShow(playerid, logsearch[playerid]);
    PlayerTextDrawShow(playerid, logbutton[playerid]);
    PlayerTextDrawShow(playerid, logdesc1[playerid]);
    PlayerTextDrawShow(playerid, logdesc2[playerid]);
    PlayerTextDrawShow(playerid, logdesc3[playerid]);
    PlayerTextDrawShow(playerid, logdesc4[playerid]);
    PlayerTextDrawShow(playerid, logdesc5[playerid]);
    PlayerTextDrawShow(playerid, logdesc6[playerid]);
    PlayerTextDrawShow(playerid, logdesc7[playerid]);
    PlayerTextDrawShow(playerid, logdesc8[playerid]);
    PlayerTextDrawShow(playerid, logdesc9[playerid]);
    PlayerTextDrawShow(playerid, logdesc10[playerid]);
    PlayerTextDrawShow(playerid, logdesc11[playerid]);
    PlayerTextDrawShow(playerid, logdesc12[playerid]);
    PlayerTextDrawShow(playerid, logdesc13[playerid]);
    PlayerTextDrawShow(playerid, logdesc14[playerid]);
    PlayerTextDrawShow(playerid, logdesc15[playerid]);
    PlayerTextDrawShow(playerid, logdesc16[playerid]);
    PlayerTextDrawShow(playerid, logdesc17[playerid]);
    PlayerTextDrawShow(playerid, logdesc18[playerid]);
    PlayerTextDrawShow(playerid, logdesc19[playerid]);
    PlayerTextDrawShow(playerid, logdesc20[playerid]);
    PlayerTextDrawShow(playerid, logdesc21[playerid]);
    PlayerTextDrawShow(playerid, logdesc22[playerid]);
    PlayerTextDrawShow(playerid, logdesc23[playerid]);

    SelectTextDraw(playerid, -1);
    TogglePlayerControllable(playerid, false);
}

DestroyLogsTD(playerid)
{
    // Check and destroy each text draw only if it's valid
    if (LogsTD[playerid][0] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, LogsTD[playerid][0]);
        LogsTD[playerid][0] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (LogsTD[playerid][1] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, LogsTD[playerid][1]);
        LogsTD[playerid][1] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (LogsTD[playerid][2] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, LogsTD[playerid][2]);
        LogsTD[playerid][2] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (LogsTD[playerid][3] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, LogsTD[playerid][3]);
        LogsTD[playerid][3] = PlayerText:INVALID_TEXT_DRAW;
    }

    // Repeat the check for the remaining textdraws
    if (logname[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logname[playerid]);
        logname[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logclose[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logclose[playerid]);
        logclose[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logsearch[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logsearch[playerid]);
        logsearch[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logbutton[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logbutton[playerid]);
        logbutton[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc1[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc1[playerid]);
        logdesc1[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc2[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc2[playerid]);
        logdesc2[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc3[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc3[playerid]);
        logdesc3[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc4[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc4[playerid]);
        logdesc4[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc5[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc5[playerid]);
        logdesc5[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc6[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc6[playerid]);
        logdesc6[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc7[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc7[playerid]);
        logdesc7[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc8[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc8[playerid]);
        logdesc8[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc9[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc9[playerid]);
        logdesc9[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc10[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc10[playerid]);
        logdesc10[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc11[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc11[playerid]);
        logdesc11[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc12[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc12[playerid]);
        logdesc12[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc13[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc13[playerid]);
        logdesc13[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc14[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc14[playerid]);
        logdesc14[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc15[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc15[playerid]);
        logdesc15[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc16[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc16[playerid]);
        logdesc16[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc17[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc17[playerid]);
        logdesc17[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc18[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc18[playerid]);
        logdesc18[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc19[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc19[playerid]);
        logdesc19[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc20[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc20[playerid]);
        logdesc20[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc21[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc21[playerid]);
        logdesc21[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc22[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc22[playerid]);
        logdesc22[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if (logdesc23[playerid] != PlayerText:INVALID_TEXT_DRAW) {
        PlayerTextDrawDestroy(playerid, logdesc23[playerid]);
        logdesc23[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    CancelSelectTextDraw(playerid);
    TogglePlayerControllable(playerid, true);
}