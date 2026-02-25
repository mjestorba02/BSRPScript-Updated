new Text:i_textdraw[8];
new PlayerText:i_textdraw1[MAX_PLAYERS][2];
new PlayerText:i_progress[MAX_PLAYERS];
new PlayerText:i_text[MAX_PLAYERS];
new PlayerText:i_phase[MAX_PLAYERS][4];

CreateIntTD(playerid)
{

	i_progress[playerid] = CreatePlayerTextDraw(playerid, 318.700012, 339.000000, "_");
	PlayerTextDrawFont(playerid, i_progress[playerid], 1);
	PlayerTextDrawLetterSize(playerid, i_progress[playerid], 0.600000, -0.450001);
	PlayerTextDrawTextSize(playerid, i_progress[playerid], 298.500000, 38.500000);
	PlayerTextDrawSetOutline(playerid, i_progress[playerid], 1);
	PlayerTextDrawSetShadow(playerid, i_progress[playerid], 0);
	PlayerTextDrawAlignment(playerid, i_progress[playerid], 2);
	PlayerTextDrawColor(playerid, i_progress[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, i_progress[playerid], 255);
	PlayerTextDrawBoxColor(playerid, i_progress[playerid], -1094795521);
	PlayerTextDrawUseBox(playerid, i_progress[playerid], 1);
	PlayerTextDrawSetProportional(playerid, i_progress[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, i_progress[playerid], 0);
	
	i_textdraw1[playerid][0] = CreatePlayerTextDraw(playerid, 319.000000, 308.000000, "Y");
	PlayerTextDrawFont(playerid, i_textdraw1[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, i_textdraw1[playerid][0], 0.879166, 3.099997);
	PlayerTextDrawTextSize(playerid, i_textdraw1[playerid][0], 400.000000, 36.500000);
	PlayerTextDrawSetOutline(playerid, i_textdraw1[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, i_textdraw1[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, i_textdraw1[playerid][0], 2);
	PlayerTextDrawColor(playerid, i_textdraw1[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, i_textdraw1[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, i_textdraw1[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, i_textdraw1[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, i_textdraw1[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, i_textdraw1[playerid][0], 0);

	i_textdraw1[playerid][1] = CreatePlayerTextDraw(playerid, 319.000000, 298.000000, "Press");
	PlayerTextDrawFont(playerid, i_textdraw1[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, i_textdraw1[playerid][1], 0.291666, 1.449998);
	PlayerTextDrawTextSize(playerid, i_textdraw1[playerid][1], 400.000000, 36.500000);
	PlayerTextDrawSetOutline(playerid, i_textdraw1[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, i_textdraw1[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, i_textdraw1[playerid][1], 2);
	PlayerTextDrawColor(playerid, i_textdraw1[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, i_textdraw1[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, i_textdraw1[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, i_textdraw1[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, i_textdraw1[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, i_textdraw1[playerid][1], 0);

	i_phase[playerid][0] = CreatePlayerTextDraw(playerid, 292.000000, 348.000000, "_");
	PlayerTextDrawFont(playerid, i_phase[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, i_phase[playerid][0], 0.600000, 0.649999);
	PlayerTextDrawTextSize(playerid, i_phase[playerid][0], 298.500000, 7.000000);
	PlayerTextDrawSetOutline(playerid, i_phase[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, i_phase[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, i_phase[playerid][0], 2);
	PlayerTextDrawColor(playerid, i_phase[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, i_phase[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, i_phase[playerid][0], -1094795521);
	PlayerTextDrawUseBox(playerid, i_phase[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, i_phase[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, i_phase[playerid][0], 0);

	i_phase[playerid][1] = CreatePlayerTextDraw(playerid, 309.000000, 348.000000, "_");
	PlayerTextDrawFont(playerid, i_phase[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, i_phase[playerid][1], 0.600000, 0.649999);
	PlayerTextDrawTextSize(playerid, i_phase[playerid][1], 298.500000, 7.000000);
	PlayerTextDrawSetOutline(playerid, i_phase[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, i_phase[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, i_phase[playerid][1], 2);
	PlayerTextDrawColor(playerid, i_phase[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, i_phase[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, i_phase[playerid][1], -1094795521);
	PlayerTextDrawUseBox(playerid, i_phase[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, i_phase[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, i_phase[playerid][1], 0);

	i_phase[playerid][2] = CreatePlayerTextDraw(playerid, 326.000000, 348.000000, "_");
	PlayerTextDrawFont(playerid, i_phase[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, i_phase[playerid][2], 0.600000, 0.649999);
	PlayerTextDrawTextSize(playerid, i_phase[playerid][2], 298.500000, 7.000000);
	PlayerTextDrawSetOutline(playerid, i_phase[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, i_phase[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, i_phase[playerid][2], 2);
	PlayerTextDrawColor(playerid, i_phase[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, i_phase[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, i_phase[playerid][2], -1094795521);
	PlayerTextDrawUseBox(playerid, i_phase[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, i_phase[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, i_phase[playerid][2], 0);

	i_phase[playerid][3] = CreatePlayerTextDraw(playerid, 343.000000, 348.000000, "_");
	PlayerTextDrawFont(playerid, i_phase[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, i_phase[playerid][3], 0.600000, 0.649999);
	PlayerTextDrawTextSize(playerid, i_phase[playerid][3], 298.500000, 7.000000);
	PlayerTextDrawSetOutline(playerid, i_phase[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, i_phase[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, i_phase[playerid][3], 2);
	PlayerTextDrawColor(playerid, i_phase[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, i_phase[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, i_phase[playerid][3], -1094795521);
	PlayerTextDrawUseBox(playerid, i_phase[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, i_phase[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, i_phase[playerid][3], 0);

	i_text[playerid] = CreatePlayerTextDraw(playerid, 319.000000, 379.000000, "You are about to loot the player");
	PlayerTextDrawFont(playerid, i_text[playerid], 1);
	PlayerTextDrawLetterSize(playerid, i_text[playerid], 0.224998, 1.499997);
	PlayerTextDrawTextSize(playerid, i_text[playerid], 400.000000, 106.500000);
	PlayerTextDrawSetOutline(playerid, i_text[playerid], 0);
	PlayerTextDrawSetShadow(playerid, i_text[playerid], 0);
	PlayerTextDrawAlignment(playerid, i_text[playerid], 2);
	PlayerTextDrawColor(playerid, i_text[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, i_text[playerid], 255);
	PlayerTextDrawBoxColor(playerid, i_text[playerid], 50);
	PlayerTextDrawUseBox(playerid, i_text[playerid], 0);
	PlayerTextDrawSetProportional(playerid, i_text[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, i_text[playerid], 0);

    SetTimerEx("ShowIntTD", 1000, false, "i", playerid);
    return 1;
}

forward ShowIntTD(playerid);
public ShowIntTD(playerid)
{
    for(new i = 0; i < 8; i++)
    {
		TextDrawShowForPlayer(playerid, i_textdraw[i]);
    }
	for(new b = 0; b < 2; b++)
    {
		PlayerTextDrawShow(playerid, i_textdraw1[playerid][b]);
    }
    for(new a = 0; a < 4; a++)
    {
        PlayerTextDrawShow(playerid, i_phase[playerid][a]);
    }
    PlayerTextDrawShow(playerid, i_progress[playerid]);
	PlayerTextDrawShow(playerid, i_text[playerid]);
    return 1;
}

DestroyIntTD(playerid) 
{
    for(new i = 0; i < 8; i++)
    {
        TextDrawHideForPlayer(playerid, i_textdraw[i]);
    }
	for(new b = 0; b < 2; b++)
    {
        PlayerTextDrawHide(playerid, i_textdraw1[playerid][b]);
    }
    for(new a = 0; a < 4; a++)
    {
        PlayerTextDrawHide(playerid, i_phase[playerid][a]);
    }
    PlayerTextDrawHide(playerid, i_progress[playerid]);
	PlayerTextDrawHide(playerid, i_text[playerid]);


    DestroyIntTD1(playerid);
}

DestroyIntTD1(playerid)
{
	for(new i = 0; i < 2; i++)
    {
        if(i_textdraw1[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
        {
            PlayerTextDrawDestroy(playerid, i_textdraw1[playerid][i]);
            i_textdraw1[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
        }
    }
    for(new a = 0; a < 4; a++)
    {
        if(i_phase[playerid][a] != PlayerText:INVALID_TEXT_DRAW)
        {
            PlayerTextDrawDestroy(playerid, i_phase[playerid][a]);
            i_phase[playerid][a] = PlayerText:INVALID_TEXT_DRAW;
        }
    }
    if(i_progress[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, i_progress[playerid]);
        i_progress[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
	if(i_text[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, i_text[playerid]);
        i_text[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
}