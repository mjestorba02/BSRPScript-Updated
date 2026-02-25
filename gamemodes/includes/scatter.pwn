#define SCATTER_RANK 1
#define SCATTER_SUIT 3

#define CLUB_SUIT     0
#define HEART_SUIT    1
#define SPADE_SUIT    2
#define DIAMOND_SUIT  3

// ===== Helpers & storage =====
static const _SuitChars[] = "cdhs"; // clubs, diamonds, hearts, spades

// Build a sprite name like "ld_card:cd10h"
stock BuildCardSprite(rank /*1..13*/, suitIndex /*0..3*/, dest[], size)
{
    // Safety clamps
    if(rank < 1) rank = 1;
    if(rank > 13) rank = 13;
    if(suitIndex < 0) suitIndex = 0;
    if(suitIndex > 3) suitIndex = 3;

    // Format: ld_card:cd{rank}{suit}
    format(dest, size, "ld_card:cd%d%c", rank, _SuitChars[suitIndex]);
    return 1;
}

// Randomize all 20 cards
stock RandomizeAllCards(playerid)
{
    new sprite[24];
    for(new i = 0; i < 20; i++)
    {
        new rank = 1 + random(13);
        new suit = random(4);

        // Save values for scatter logic
        slotRanks[playerid][i] = rank;
        slotSuits[playerid][i] = suit;

        BuildCardSprite(rank, suit, sprite, sizeof(sprite));

        switch(i)
        {
            case 0: PlayerTextDrawSetString(playerid, card1[playerid], sprite);
            case 1: PlayerTextDrawSetString(playerid, card2[playerid], sprite);
            case 2: PlayerTextDrawSetString(playerid, card3[playerid], sprite);
            case 3: PlayerTextDrawSetString(playerid, card4[playerid], sprite);
            case 4: PlayerTextDrawSetString(playerid, card5[playerid], sprite);
            case 5: PlayerTextDrawSetString(playerid, card6[playerid], sprite);
            case 6: PlayerTextDrawSetString(playerid, card7[playerid], sprite);
            case 7: PlayerTextDrawSetString(playerid, card8[playerid], sprite);
            case 8: PlayerTextDrawSetString(playerid, card9[playerid], sprite);
            case 9: PlayerTextDrawSetString(playerid, card10[playerid], sprite);
            case 10: PlayerTextDrawSetString(playerid, card11[playerid], sprite);
            case 11: PlayerTextDrawSetString(playerid, card12[playerid], sprite);
            case 12: PlayerTextDrawSetString(playerid, card13[playerid], sprite);
            case 13: PlayerTextDrawSetString(playerid, card14[playerid], sprite);
            case 14: PlayerTextDrawSetString(playerid, card15[playerid], sprite);
            case 15: PlayerTextDrawSetString(playerid, card16[playerid], sprite);
            case 16: PlayerTextDrawSetString(playerid, card17[playerid], sprite);
            case 17: PlayerTextDrawSetString(playerid, card18[playerid], sprite);
            case 18: PlayerTextDrawSetString(playerid, card19[playerid], sprite);
            case 19: PlayerTextDrawSetString(playerid, card20[playerid], sprite);
        }
    }
    return 1;
}

forward HandleAutoScatter(playerid);
public HandleAutoScatter(playerid)
{
    if(pData[playerid][pScatterAuto])
    {
        new string[128];
        if(pData[playerid][pScatterBet] <= 0)
		{
            pData[playerid][pScatterAuto] = false;
			return SCM(playerid, COLOR_SYNTAX, "Your auto spin has been stopped as your bet is still in 0");
		}
		if(pData[playerid][pCash] < pData[playerid][pScatterBet])
		{
            pData[playerid][pScatterAuto] = false;
			return SCM(playerid, COLOR_SYNTAX, "Your auto spin has been stopped as you don't have enough cash for the bet.");
		}

        SetPVarInt(playerid, "scatterspinning", 1);
        if(SpinTimer[playerid]) KillTimer(SpinTimer[playerid]); // safety
    	SpinTicks[playerid] = 0;
    	SpinTimer[playerid] = SetTimerEx("_SpinTick", 500, true, "d", playerid);

		PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);

		if(pData[playerid][pFreeSpins] > 0)
		{
			pData[playerid][pFreeSpins]--;

			PlayerTextDrawHide(playerid, Popup1[playerid]);
			PlayerTextDrawHide(playerid, Popup2[playerid]);
			PlayerTextDrawSetString(playerid, Popup1[playerid], "Scater!!!");
			format(string, sizeof(string), "Free %d spins", pData[playerid][pFreeSpins]);
			PlayerTextDrawSetString(playerid, Popup2[playerid], string);
			PlayerTextDrawShow(playerid, Popup1[playerid]);
			PlayerTextDrawShow(playerid, Popup2[playerid]);
		}
		if(pData[playerid][pFreeSpins] <= 0)
		{
			GivePlayerCash(playerid, -pData[playerid][pScatterBet]);
			PlayerTextDrawHide(playerid, Popup1[playerid]);
			PlayerTextDrawHide(playerid, Popup2[playerid]);
		}

		if(pData[playerid][pFreeSpins] == 1)
		{
			PlayerTextDrawHide(playerid, Popup1[playerid]);
			PlayerTextDrawHide(playerid, Popup2[playerid]);
			pData[playerid][pScatterMultiplier] = 1;

			PlayerTextDrawHide(playerid, multiplier2x[playerid]);
			PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x1");
			PlayerTextDrawShow(playerid, multiplier2x[playerid]);

			PlayerTextDrawHide(playerid, multiplier4x[playerid]);
			PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~w~x2");
			PlayerTextDrawShow(playerid, multiplier4x[playerid]);

			PlayerTextDrawHide(playerid, multiplier6x[playerid]);
			PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~w~x3");
			PlayerTextDrawShow(playerid, multiplier6x[playerid]);

			PlayerTextDrawHide(playerid, multiplier10x[playerid]);
			PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~w~x5");
			PlayerTextDrawShow(playerid, multiplier10x[playerid]);
		}

		PlayerTextDrawHide(playerid, scatterBalance[playerid]);
		format(string, sizeof(string), "Balance ~w~%s", FormatNumber(pData[playerid][pCash]));
		PlayerTextDrawSetString(playerid, scatterBalance[playerid], string);
		PlayerTextDrawShow(playerid, scatterBalance[playerid]);

		PlayerTextDrawHide(playerid, scatterWin[playerid]);
		PlayerTextDrawSetString(playerid, scatterWin[playerid], "Win ~w~$0");
		PlayerTextDrawShow(playerid, scatterWin[playerid]);

        // Keep selection mode active so they can click again
        SelectTextDraw(playerid, 0x33CCFFFF);
    }
    return 1;
}

stock HandleMultiplier(playerid)
{
    if(pData[playerid][pFreeSpins] > 0)
    {
        if(pData[playerid][pScatterMultiplier] == 1)
        {
            pData[playerid][pScatterMultiplier] = 2;
        }
        else
        {
            pData[playerid][pScatterMultiplier] += 2;
        }

        if(pData[playerid][pScatterMultiplier] == 2)
        {
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~w~x4");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~w~x6");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~w~x10");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
        else if(pData[playerid][pScatterMultiplier] == 4)
        {
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~y~x4");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~w~x6");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~w~x10");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
        else if(pData[playerid][pScatterMultiplier] == 6)
        {
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~y~x4");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~y~x6");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~y~x10");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
        else if(pData[playerid][pScatterMultiplier] == 8)
        {
            pData[playerid][pScatterMultiplier] += 2;
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~y~x4");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~y~x6");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~y~x10");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
    }
    else if(pData[playerid][pFreeSpins] <= 0)
    {
        pData[playerid][pScatterMultiplier] += 1;

        if(pData[playerid][pScatterMultiplier] == 2)
        {
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x1");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~w~x3");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~w~x5");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
        else if(pData[playerid][pScatterMultiplier] == 3)
        {
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x1");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~y~x3");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~w~x5");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
        else if(pData[playerid][pScatterMultiplier] == 4)
        {
            pData[playerid][pScatterMultiplier] += 1;
            PlayerTextDrawHide(playerid, multiplier2x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x1");
            PlayerTextDrawShow(playerid, multiplier2x[playerid]);

            PlayerTextDrawHide(playerid, multiplier4x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~y~x2");
            PlayerTextDrawShow(playerid, multiplier4x[playerid]);

            PlayerTextDrawHide(playerid, multiplier6x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~y~x3");
            PlayerTextDrawShow(playerid, multiplier6x[playerid]);

            PlayerTextDrawHide(playerid, multiplier10x[playerid]);
            PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~y~x5");
            PlayerTextDrawShow(playerid, multiplier10x[playerid]);
        }
    }
}

stock CheckWin(playerid)
{
    new scatterCount = 0;
    new Float:scatterMultiplier = 1.0;
    new win[128];

    // Count scatters and apply multipliers
    for (new i = 0; i < 20; i++)
    {
        if (slotRanks[playerid][i] == SCATTER_RANK) // Found a scatter
        {
            // Suit-based multipliers
            switch (slotSuits[playerid][i])
            {
                case CLUB_SUIT:    scatterMultiplier = 2.0;
                case HEART_SUIT:   scatterMultiplier = 3.0;
                case SPADE_SUIT:   scatterMultiplier = 4.0;
                case DIAMOND_SUIT: scatterMultiplier = 1.0;
            }
        }
        if(slotRanks[playerid][i] == SCATTER_RANK &&
           slotSuits[playerid][i] == SCATTER_SUIT)
        {
            scatterCount++;
        }
    }

    if(scatterCount >= 3)
    {
        pData[playerid][pFreeSpins] += 10;

        PlayerTextDrawHide(playerid, Popup1[playerid]);
        PlayerTextDrawHide(playerid, Popup2[playerid]);
        PlayerTextDrawSetString(playerid, Popup1[playerid], "Scater!!!");
        PlayerTextDrawSetString(playerid, Popup2[playerid], "Free 10 spins");
        PlayerTextDrawShow(playerid, Popup1[playerid]);
        PlayerTextDrawShow(playerid, Popup2[playerid]);
    }

    // Example SUPER ACE JACKPOT (Three Aces)
    new c1 = slotRanks[playerid][0];
    new c2 = slotRanks[playerid][1];
    new c3 = slotRanks[playerid][2];

    // if (c1 == 1 && c2 == 1 && c3 == 1)
    // {
    //     if(PopupTimer[playerid]) KillTimer(PopupTimer[playerid]); // safety
    // 	PopupTimer[playerid] = 0;
    // 	PopupTimer[playerid] = SetTimerEx("PopupTimer", 3000, false, "d", playerid);

    //     PlayerTextDrawHide(playerid, Popup1[playerid]);
    //     PlayerTextDrawHide(playerid, Popup2[playerid]);
    //     PlayerTextDrawSetString(playerid, Popup1[playerid], "Scater!!!");
    //     PlayerTextDrawSetString(playerid, Popup2[playerid], "Free 10 spins");
    //     PlayerTextDrawShow(playerid, Popup1[playerid]);
    //     PlayerTextDrawShow(playerid, Popup2[playerid]);
        
    //     new jackpotMsg[128];
    //     format(jackpotMsg, sizeof jackpotMsg, "[JACKPOT] SUPER ACE!!! You win x100 (%.1f Multiplier)!", scatterMultiplier);
    //     SendClientMessage(playerid, -1, jackpotMsg);
    //     return 1;
    // }

    // Three of a kind
    if (c1 == c2 && c2 == c3)
    {
        if(pData[playerid][pScatterMultiplier] > 0)
        {
            pData[playerid][pScatterWin] += pData[playerid][pScatterMultiplier] * floatround(pData[playerid][pScatterBet] * scatterMultiplier);
        }
        else
        {
            pData[playerid][pScatterWin] += floatround(pData[playerid][pScatterBet] * scatterMultiplier);
        }

        HandleMultiplier(playerid);

        if(pData[playerid][pFreeSpins] <= 0)
        {
            if(PopupTimer[playerid]) KillTimer(PopupTimer[playerid]); // safety
            PopupTimer[playerid] = 0;
            PopupTimer[playerid] = SetTimerEx("_PopupTimer", 2000, false, "d", playerid);

            PlayerTextDrawHide(playerid, Popup1[playerid]);
            PlayerTextDrawHide(playerid, Popup2[playerid]);
            PlayerTextDrawSetString(playerid, Popup1[playerid], "Three of a Kind!");
            PlayerTextDrawSetString(playerid, Popup2[playerid], FormatNumber(pData[playerid][pScatterWin]));
            PlayerTextDrawShow(playerid, Popup1[playerid]);
            PlayerTextDrawShow(playerid, Popup2[playerid]);

            PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
        }

        PlayerTextDrawHide(playerid, scatterWin[playerid]);
        format(win, sizeof(win), "Win ~w~%s", FormatNumber(pData[playerid][pScatterWin]));
        PlayerTextDrawSetString(playerid, scatterWin[playerid], win);
        PlayerTextDrawShow(playerid, scatterWin[playerid]);

        SetPVarInt(playerid, "scatterspinning", 1);
        if(SpinTimer[playerid]) KillTimer(SpinTimer[playerid]); // safety
    	SpinTicks[playerid] = 0;
    	SpinTimer[playerid] = SetTimerEx("_SpinTick", 500, true, "d", playerid);

        PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

        SetPVarInt(playerid, "scatterWon", 1);
        return 1;
    }

    // Two of a kind
    if (c1 == c2 || c2 == c3 || c1 == c3)
    {
        if(pData[playerid][pScatterMultiplier] > 0)
        {
            pData[playerid][pScatterWin] += pData[playerid][pScatterMultiplier] * floatround(pData[playerid][pScatterBet] * scatterMultiplier);
        }
        else
        {
            pData[playerid][pScatterWin] += floatround(pData[playerid][pScatterBet] * scatterMultiplier);
        }

        HandleMultiplier(playerid);

        if(pData[playerid][pFreeSpins] <= 0)
        {
            if(PopupTimer[playerid]) KillTimer(PopupTimer[playerid]); // safety
            PopupTimer[playerid] = 0;
            PopupTimer[playerid] = SetTimerEx("_PopupTimer", 2000, false, "d", playerid);

            PlayerTextDrawHide(playerid, Popup1[playerid]);
            PlayerTextDrawHide(playerid, Popup2[playerid]);
            PlayerTextDrawSetString(playerid, Popup1[playerid], "Two of a Kind!");
            PlayerTextDrawSetString(playerid, Popup2[playerid], FormatNumber(pData[playerid][pScatterWin]));
            PlayerTextDrawShow(playerid, Popup1[playerid]);
            PlayerTextDrawShow(playerid, Popup2[playerid]);
        }

        PlayerTextDrawHide(playerid, scatterWin[playerid]);
        format(win, sizeof(win), "Win ~w~%s", FormatNumber(pData[playerid][pScatterWin]));
        PlayerTextDrawSetString(playerid, scatterWin[playerid], win);
        PlayerTextDrawShow(playerid, scatterWin[playerid]);

        PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

        SetPVarInt(playerid, "scatterspinning", 1);
        SetPVarInt(playerid, "scatterWon", 1);
        if(SpinTimer[playerid]) KillTimer(SpinTimer[playerid]); // safety
    	SpinTicks[playerid] = 0;
    	SpinTimer[playerid] = SetTimerEx("_SpinTick", 500, true, "d", playerid);
        return 1;
    }

    if(scatterCount == 2)
    {
        PlayerTextDrawHide(playerid, Popup1[playerid]);
        PlayerTextDrawHide(playerid, Popup2[playerid]);
        PlayerTextDrawSetString(playerid, Popup1[playerid], "You almost got");
        PlayerTextDrawSetString(playerid, Popup2[playerid], "Scater!!");
        PlayerTextDrawShow(playerid, Popup1[playerid]);
        PlayerTextDrawShow(playerid, Popup2[playerid]);
    }
    
    pData[playerid][pScatterMultiplier] = 1;

    if(pData[playerid][pFreeSpins] <= 0)
    {
        PlayerTextDrawHide(playerid, multiplier2x[playerid]);
        PlayerTextDrawSetString(playerid, multiplier2x[playerid], "~y~x1");
        PlayerTextDrawShow(playerid, multiplier2x[playerid]);

        PlayerTextDrawHide(playerid, multiplier4x[playerid]);
        PlayerTextDrawSetString(playerid, multiplier4x[playerid], "~w~x2");
        PlayerTextDrawShow(playerid, multiplier4x[playerid]);

        PlayerTextDrawHide(playerid, multiplier6x[playerid]);
        PlayerTextDrawSetString(playerid, multiplier6x[playerid], "~w~x3");
        PlayerTextDrawShow(playerid, multiplier6x[playerid]);

        PlayerTextDrawHide(playerid, multiplier10x[playerid]);
        PlayerTextDrawSetString(playerid, multiplier10x[playerid], "~w~x5");
        PlayerTextDrawShow(playerid, multiplier10x[playerid]);
    }
    PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
    GivePlayerCash(playerid, pData[playerid][pScatterWin]);
    DeletePVar(playerid, "scatterWon");
    SetTimerEx("HandleAutoScatter", 500, false, "i", playerid);
    return 1;
}

// CMD:scatterbet(playerid, params[])
// {
//     if(!pData[playerid][pOpenScatter])
//     {
//         return SCM(playerid, COLOR_SYNTAX, "You must open a royal flush first so you can place a bet.");
//     }
//     if(pData[playerid][pScatterAuto])
//     {
//         return SCM(playerid, COLOR_SYNTAX, "Your auto spin is enabled, turn it off first.");
//     }
//     if(pData[playerid][pFreeSpins] > 0)
//     {
//         return SCM(playerid, COLOR_SYNTAX, "You still have free spins!");
//     }
//     if(GetPVarInt(playerid, "scatterspinning"))
//     {
//         return SCM(playerid, COLOR_SYNTAX, "You were still spinning, please wait.");
//     }
//     ShowPlayerDialogEx(playerid, DIALOG_BETSCATTER, DIALOG_STYLE_INPUT, ""SVRCLR"Royal Flush - KUSH", ""WHITE"Enter the amount you want to bet.", "Bet", "Cancel");
//     return 1;
// }

// CMD:scatter(playerid, params[])
// {
// 	if(pData[playerid][pColorG])
// 	{
// 		return SCM(playerid, COLOR_SYNTAX, "You can't play royal flush while you are playing color game!");
// 	}
// 	if(pData[playerid][pOpenInv])
// 	{
// 		return SCM(playerid, COLOR_SYNTAX, "You can't royal flush while you are in your inventory!");
// 	}
// 	if(openingInv[playerid] > 0)
// 	{
// 	    return SM(playerid, COLOR_GREY, "You can't spam royal flush. Wait for %d second/s before you can use it", openingInv[playerid]);
// 	}
// 	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED || pData[playerid][pInjured] > 0 || pData[playerid][pHospital] > 0 || pData[playerid][pMiningTime] > 0 || pData[playerid][pTazedTime] > 0 || pData[playerid][pCuffed] > 0 || pData[playerid][pLootTime] > 0 || pData[playerid][pPaintball] > 0 || pData[playerid][pCustomPaintball] > 0)
// 	{
// 	    return SendClientMessage(playerid, COLOR_GREY, "You're currently unable to use phone at this moment.");
// 	}
// 	if(!pData[playerid][pInvCustomized])
// 	{
// 	    return SM(playerid, COLOR_GREY, "You must customize your inventory design before you can access this command. (( /settings > Inventory ))");
// 	}
// 	if(!pData[playerid][pOpenScatter])
// 	{
// 		openingInv[playerid] = 3;
// 		ShowSlotTDs(playerid);
//         RandomizeAllCards(playerid);
// 		SendProximityMessage(playerid, 20.0, SERVER_COLOR, "{C2A2DA}** %s turn on the slot machine as he starts playing it.", GetRPName(playerid));
//         SCM(playerid, COLOR_WHITE, "[TIPS!] Type '/scatterbet' if you can't click the 'Bet Button'");
// 	}
// 	else if(pData[playerid][pOpenScatter])
// 	{
//         if(GetPVarInt(playerid, "scatterspinning"))
//         {
//             return SCM(playerid, COLOR_SYNTAX, "You were still spinning, please wait.");
//         }
//         if(pData[playerid][pFreeSpins] > 0)
//         {
//             return SCM(playerid, COLOR_SYNTAX, "You still have free spins, spend it first.");
//         }
// 		HideSlotTDs(playerid);
// 		CancelSelectTextDraw(playerid);
// 		SendProximityMessage(playerid, 20.0, SERVER_COLOR, "{C2A2DA}** %s turn off the slot machine.", GetRPName(playerid));
// 		pData[playerid][pOpenScatter] = false;
//         pData[playerid][pScatterBet] = 0;
//         pData[playerid][pScatterWin] = 0;
//         pData[playerid][pScatterMultiplier] = 0;
//         pData[playerid][pScatterAuto] = false;
//         pData[playerid][pFreeSpins] = 0;
// 	}
// 	return 1;
// }

CMD:scatter(playerid, params[])
{
    return SCM(playerid, COLOR_SYNTAX, "Temporaily Disabled.");
}

stock HideSlotTDs(playerid)
{
    if(multiplier2x[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, multiplier2x[playerid]);
        multiplier2x[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(multiplier6x[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, multiplier6x[playerid]);
        multiplier6x[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(multiplier10x[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, multiplier10x[playerid]);
        multiplier10x[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(scatterSpin[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, scatterSpin[playerid]);
        scatterSpin[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(multiplier4x[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, multiplier4x[playerid]);
        multiplier4x[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(scatterAuto[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, scatterAuto[playerid]);
        scatterAuto[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(scatterBet[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, scatterBet[playerid]);
        scatterBet[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(clickbet[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, clickbet[playerid]);
        clickbet[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(scatterWin[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, scatterWin[playerid]);
        scatterWin[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(scatterBalance[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, scatterBalance[playerid]);
        scatterBalance[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(Popup1[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, Popup1[playerid]);
        Popup1[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(Popup2[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, Popup2[playerid]);
        Popup2[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card1[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card1[playerid]);
        card1[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card2[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card2[playerid]);
        card2[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card3[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card3[playerid]);
        card3[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card4[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card4[playerid]);
        card4[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card5[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card5[playerid]);
        card5[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card6[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card6[playerid]);
        card6[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card7[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card7[playerid]);
        card7[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card8[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card8[playerid]);
        card8[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card9[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card9[playerid]);
        card9[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card10[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card10[playerid]);
        card10[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card11[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card11[playerid]);
        card11[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card12[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card12[playerid]);
        card12[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card13[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card13[playerid]);
        card13[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card14[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card14[playerid]);
        card14[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card15[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card15[playerid]);
        card15[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card16[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card16[playerid]);
        card16[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card17[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card17[playerid]);
        card17[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card18[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card18[playerid]);
        card18[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card19[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card19[playerid]);
        card19[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(card20[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, card20[playerid]);
        card20[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    if(buy10spin[playerid] != PlayerText:INVALID_TEXT_DRAW)
    {
        PlayerTextDrawDestroy(playerid, buy10spin[playerid]);
        buy10spin[playerid] = PlayerText:INVALID_TEXT_DRAW;
    }
    for(new i=0; i<14; i++) TextDrawHideForPlayer(playerid, ScatterTD[i]);
}

stock ShowSlotTDs(playerid)
{
    pData[playerid][pOpenScatter] = true;

    card1[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 191.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card1[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card1[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card1[playerid], 0);
	PlayerTextDrawAlignment(playerid, card1[playerid], 1);
	PlayerTextDrawColor(playerid, card1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card1[playerid], 50);
	PlayerTextDrawUseBox(playerid, card1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card1[playerid], 0);

	card2[playerid] = CreatePlayerTextDraw(playerid, 521.000000, 191.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card2[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card2[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card2[playerid], 0);
	PlayerTextDrawAlignment(playerid, card2[playerid], 1);
	PlayerTextDrawColor(playerid, card2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card2[playerid], 50);
	PlayerTextDrawUseBox(playerid, card2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card2[playerid], 0);

	card3[playerid] = CreatePlayerTextDraw(playerid, 543.000000, 191.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card3[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card3[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card3[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card3[playerid], 0);
	PlayerTextDrawAlignment(playerid, card3[playerid], 1);
	PlayerTextDrawColor(playerid, card3[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card3[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card3[playerid], 50);
	PlayerTextDrawUseBox(playerid, card3[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card3[playerid], 0);

	card4[playerid] = CreatePlayerTextDraw(playerid, 565.000000, 191.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card4[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card4[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card4[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card4[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card4[playerid], 0);
	PlayerTextDrawAlignment(playerid, card4[playerid], 1);
	PlayerTextDrawColor(playerid, card4[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card4[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card4[playerid], 50);
	PlayerTextDrawUseBox(playerid, card4[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card4[playerid], 0);

	card5[playerid] = CreatePlayerTextDraw(playerid, 587.000000, 191.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card5[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card5[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card5[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card5[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card5[playerid], 0);
	PlayerTextDrawAlignment(playerid, card5[playerid], 1);
	PlayerTextDrawColor(playerid, card5[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card5[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card5[playerid], 50);
	PlayerTextDrawUseBox(playerid, card5[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card5[playerid], 0);

	card6[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 220.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card6[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card6[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card6[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card6[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card6[playerid], 0);
	PlayerTextDrawAlignment(playerid, card6[playerid], 1);
	PlayerTextDrawColor(playerid, card6[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card6[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card6[playerid], 50);
	PlayerTextDrawUseBox(playerid, card6[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card6[playerid], 0);

	card7[playerid] = CreatePlayerTextDraw(playerid, 521.000000, 220.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card7[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card7[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card7[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card7[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card7[playerid], 0);
	PlayerTextDrawAlignment(playerid, card7[playerid], 1);
	PlayerTextDrawColor(playerid, card7[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card7[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card7[playerid], 50);
	PlayerTextDrawUseBox(playerid, card7[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card7[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card7[playerid], 0);

	card8[playerid] = CreatePlayerTextDraw(playerid, 543.000000, 220.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card8[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card8[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card8[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card8[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card8[playerid], 0);
	PlayerTextDrawAlignment(playerid, card8[playerid], 1);
	PlayerTextDrawColor(playerid, card8[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card8[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card8[playerid], 50);
	PlayerTextDrawUseBox(playerid, card8[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card8[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card8[playerid], 0);

	card9[playerid] = CreatePlayerTextDraw(playerid, 565.000000, 220.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card9[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card9[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card9[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card9[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card9[playerid], 0);
	PlayerTextDrawAlignment(playerid, card9[playerid], 1);
	PlayerTextDrawColor(playerid, card9[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card9[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card9[playerid], 50);
	PlayerTextDrawUseBox(playerid, card9[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card9[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card9[playerid], 0);

	card10[playerid] = CreatePlayerTextDraw(playerid, 587.000000, 220.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card10[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card10[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card10[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card10[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card10[playerid], 0);
	PlayerTextDrawAlignment(playerid, card10[playerid], 1);
	PlayerTextDrawColor(playerid, card10[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card10[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card10[playerid], 50);
	PlayerTextDrawUseBox(playerid, card10[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card10[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card10[playerid], 0);

	card11[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 249.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card11[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card11[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card11[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card11[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card11[playerid], 0);
	PlayerTextDrawAlignment(playerid, card11[playerid], 1);
	PlayerTextDrawColor(playerid, card11[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card11[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card11[playerid], 50);
	PlayerTextDrawUseBox(playerid, card11[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card11[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card11[playerid], 0);

	card12[playerid] = CreatePlayerTextDraw(playerid, 521.000000, 249.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card12[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card12[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card12[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card12[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card12[playerid], 0);
	PlayerTextDrawAlignment(playerid, card12[playerid], 1);
	PlayerTextDrawColor(playerid, card12[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card12[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card12[playerid], 50);
	PlayerTextDrawUseBox(playerid, card12[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card12[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card12[playerid], 0);

	card13[playerid] = CreatePlayerTextDraw(playerid, 543.000000, 249.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card13[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card13[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card13[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card13[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card13[playerid], 0);
	PlayerTextDrawAlignment(playerid, card13[playerid], 1);
	PlayerTextDrawColor(playerid, card13[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card13[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card13[playerid], 50);
	PlayerTextDrawUseBox(playerid, card13[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card13[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card13[playerid], 0);

	card14[playerid] = CreatePlayerTextDraw(playerid, 565.000000, 249.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card14[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card14[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card14[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card14[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card14[playerid], 0);
	PlayerTextDrawAlignment(playerid, card14[playerid], 1);
	PlayerTextDrawColor(playerid, card14[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card14[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card14[playerid], 50);
	PlayerTextDrawUseBox(playerid, card14[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card14[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card14[playerid], 0);

	card15[playerid] = CreatePlayerTextDraw(playerid, 587.000000, 249.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card15[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card15[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card15[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card15[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card15[playerid], 0);
	PlayerTextDrawAlignment(playerid, card15[playerid], 1);
	PlayerTextDrawColor(playerid, card15[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card15[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card15[playerid], 50);
	PlayerTextDrawUseBox(playerid, card15[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card15[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card15[playerid], 0);

	card16[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 278.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card16[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card16[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card16[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card16[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card16[playerid], 0);
	PlayerTextDrawAlignment(playerid, card16[playerid], 1);
	PlayerTextDrawColor(playerid, card16[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card16[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card16[playerid], 50);
	PlayerTextDrawUseBox(playerid, card16[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card16[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card16[playerid], 0);

	card17[playerid] = CreatePlayerTextDraw(playerid, 521.000000, 278.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card17[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card17[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card17[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card17[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card17[playerid], 0);
	PlayerTextDrawAlignment(playerid, card17[playerid], 1);
	PlayerTextDrawColor(playerid, card17[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card17[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card17[playerid], 50);
	PlayerTextDrawUseBox(playerid, card17[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card17[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card17[playerid], 0);

	card18[playerid] = CreatePlayerTextDraw(playerid, 543.000000, 278.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card18[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card18[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card18[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card18[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card18[playerid], 0);
	PlayerTextDrawAlignment(playerid, card18[playerid], 1);
	PlayerTextDrawColor(playerid, card18[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card18[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card18[playerid], 50);
	PlayerTextDrawUseBox(playerid, card18[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card18[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card18[playerid], 0);

	card19[playerid] = CreatePlayerTextDraw(playerid, 565.000000, 278.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card19[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card19[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card19[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card19[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card19[playerid], 0);
	PlayerTextDrawAlignment(playerid, card19[playerid], 1);
	PlayerTextDrawColor(playerid, card19[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card19[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card19[playerid], 50);
	PlayerTextDrawUseBox(playerid, card19[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card19[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card19[playerid], 0);

	card20[playerid] = CreatePlayerTextDraw(playerid, 587.000000, 278.000000, "ld_card:cd10h");
	PlayerTextDrawFont(playerid, card20[playerid], 4);
	PlayerTextDrawLetterSize(playerid, card20[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, card20[playerid], 20.000000, 26.500000);
	PlayerTextDrawSetOutline(playerid, card20[playerid], 1);
	PlayerTextDrawSetShadow(playerid, card20[playerid], 0);
	PlayerTextDrawAlignment(playerid, card20[playerid], 1);
	PlayerTextDrawColor(playerid, card20[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, card20[playerid], 255);
	PlayerTextDrawBoxColor(playerid, card20[playerid], 50);
	PlayerTextDrawUseBox(playerid, card20[playerid], 1);
	PlayerTextDrawSetProportional(playerid, card20[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, card20[playerid], 0);

	multiplier2x[playerid] = CreatePlayerTextDraw(playerid, 525.000000, 171.000000, "~y~x1");
	PlayerTextDrawFont(playerid, multiplier2x[playerid], 1);
	PlayerTextDrawLetterSize(playerid, multiplier2x[playerid], 0.274998, 1.449998);
	PlayerTextDrawTextSize(playerid, multiplier2x[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, multiplier2x[playerid], 0);
	PlayerTextDrawSetShadow(playerid, multiplier2x[playerid], 0);
	PlayerTextDrawAlignment(playerid, multiplier2x[playerid], 2);
	PlayerTextDrawColor(playerid, multiplier2x[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, multiplier2x[playerid], 255);
	PlayerTextDrawBoxColor(playerid, multiplier2x[playerid], 50);
	PlayerTextDrawUseBox(playerid, multiplier2x[playerid], 0);
	PlayerTextDrawSetProportional(playerid, multiplier2x[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, multiplier2x[playerid], 0);

	multiplier6x[playerid] = CreatePlayerTextDraw(playerid, 562.000000, 171.000000, "x3");
	PlayerTextDrawFont(playerid, multiplier6x[playerid], 1);
	PlayerTextDrawLetterSize(playerid, multiplier6x[playerid], 0.274998, 1.449998);
	PlayerTextDrawTextSize(playerid, multiplier6x[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, multiplier6x[playerid], 0);
	PlayerTextDrawSetShadow(playerid, multiplier6x[playerid], 0);
	PlayerTextDrawAlignment(playerid, multiplier6x[playerid], 2);
	PlayerTextDrawColor(playerid, multiplier6x[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, multiplier6x[playerid], 255);
	PlayerTextDrawBoxColor(playerid, multiplier6x[playerid], 50);
	PlayerTextDrawUseBox(playerid, multiplier6x[playerid], 0);
	PlayerTextDrawSetProportional(playerid, multiplier6x[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, multiplier6x[playerid], 0);

	multiplier10x[playerid] = CreatePlayerTextDraw(playerid, 581.000000, 171.000000, "x5");
	PlayerTextDrawFont(playerid, multiplier10x[playerid], 1);
	PlayerTextDrawLetterSize(playerid, multiplier10x[playerid], 0.274998, 1.449998);
	PlayerTextDrawTextSize(playerid, multiplier10x[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, multiplier10x[playerid], 0);
	PlayerTextDrawSetShadow(playerid, multiplier10x[playerid], 0);
	PlayerTextDrawAlignment(playerid, multiplier10x[playerid], 2);
	PlayerTextDrawColor(playerid, multiplier10x[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, multiplier10x[playerid], 255);
	PlayerTextDrawBoxColor(playerid, multiplier10x[playerid], 50);
	PlayerTextDrawUseBox(playerid, multiplier10x[playerid], 0);
	PlayerTextDrawSetProportional(playerid, multiplier10x[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, multiplier10x[playerid], 0);

	scatterSpin[playerid] = CreatePlayerTextDraw(playerid, 554.000000, 334.000000, "Spin");
	PlayerTextDrawFont(playerid, scatterSpin[playerid], 2);
	PlayerTextDrawLetterSize(playerid, scatterSpin[playerid], 0.216665, 1.250000);
	PlayerTextDrawTextSize(playerid, scatterSpin[playerid], 20.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, scatterSpin[playerid], 0);
	PlayerTextDrawSetShadow(playerid, scatterSpin[playerid], 0);
	PlayerTextDrawAlignment(playerid, scatterSpin[playerid], 2);
	PlayerTextDrawColor(playerid, scatterSpin[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, scatterSpin[playerid], 255);
	PlayerTextDrawBoxColor(playerid, scatterSpin[playerid], 50);
	PlayerTextDrawUseBox(playerid, scatterSpin[playerid], 0);
	PlayerTextDrawSetProportional(playerid, scatterSpin[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, scatterSpin[playerid], 1);

	multiplier4x[playerid] = CreatePlayerTextDraw(playerid, 544.000000, 171.000000, "x2");
	PlayerTextDrawFont(playerid, multiplier4x[playerid], 1);
	PlayerTextDrawLetterSize(playerid, multiplier4x[playerid], 0.274998, 1.449998);
	PlayerTextDrawTextSize(playerid, multiplier4x[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, multiplier4x[playerid], 0);
	PlayerTextDrawSetShadow(playerid, multiplier4x[playerid], 0);
	PlayerTextDrawAlignment(playerid, multiplier4x[playerid], 2);
	PlayerTextDrawColor(playerid, multiplier4x[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, multiplier4x[playerid], 255);
	PlayerTextDrawBoxColor(playerid, multiplier4x[playerid], 50);
	PlayerTextDrawUseBox(playerid, multiplier4x[playerid], 0);
	PlayerTextDrawSetProportional(playerid, multiplier4x[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, multiplier4x[playerid], 0);

	scatterAuto[playerid] = CreatePlayerTextDraw(playerid, 587.000000, 337.000000, "AUTO");
	PlayerTextDrawFont(playerid, scatterAuto[playerid], 2);
	PlayerTextDrawLetterSize(playerid, scatterAuto[playerid], 0.145833, 0.899999);
	PlayerTextDrawTextSize(playerid, scatterAuto[playerid], 15.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, scatterAuto[playerid], 0);
	PlayerTextDrawSetShadow(playerid, scatterAuto[playerid], 0);
	PlayerTextDrawAlignment(playerid, scatterAuto[playerid], 2);
	PlayerTextDrawColor(playerid, scatterAuto[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, scatterAuto[playerid], 255);
	PlayerTextDrawBoxColor(playerid, scatterAuto[playerid], 50);
	PlayerTextDrawUseBox(playerid, scatterAuto[playerid], 0);
	PlayerTextDrawSetProportional(playerid, scatterAuto[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, scatterAuto[playerid], 1);

    clickbet[playerid] = CreatePlayerTextDraw(playerid, 494.000000, 320.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, clickbet[playerid], 4);
	PlayerTextDrawLetterSize(playerid, clickbet[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, clickbet[playerid], 46.000000, 33.000000);
	PlayerTextDrawSetOutline(playerid, clickbet[playerid], 1);
	PlayerTextDrawSetShadow(playerid, clickbet[playerid], 0);
	PlayerTextDrawAlignment(playerid, clickbet[playerid], 1);
	PlayerTextDrawColor(playerid, clickbet[playerid], 522795007);
	PlayerTextDrawBackgroundColor(playerid, clickbet[playerid], 255);
	PlayerTextDrawBoxColor(playerid, clickbet[playerid], 50);
	PlayerTextDrawUseBox(playerid, clickbet[playerid], 1);
	PlayerTextDrawSetProportional(playerid, clickbet[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, clickbet[playerid], 1);

	scatterBet[playerid] = CreatePlayerTextDraw(playerid, 517.000000, 332.000000, "BET");
	PlayerTextDrawFont(playerid, scatterBet[playerid], 2);
	PlayerTextDrawLetterSize(playerid, scatterBet[playerid], 0.133332, 0.899999);
	PlayerTextDrawTextSize(playerid, scatterBet[playerid], 15.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, scatterBet[playerid], 0);
	PlayerTextDrawSetShadow(playerid, scatterBet[playerid], 0);
	PlayerTextDrawAlignment(playerid, scatterBet[playerid], 2);
	PlayerTextDrawColor(playerid, scatterBet[playerid], 9109759);
	PlayerTextDrawBackgroundColor(playerid, scatterBet[playerid], 255);
	PlayerTextDrawBoxColor(playerid, scatterBet[playerid], -206);
	PlayerTextDrawUseBox(playerid, scatterBet[playerid], 0);
	PlayerTextDrawSetProportional(playerid, scatterBet[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, scatterBet[playerid], 0);

	scatterWin[playerid] = CreatePlayerTextDraw(playerid, 526.000000, 311.000000, "WIN ~w~$1,000");
	PlayerTextDrawFont(playerid, scatterWin[playerid], 2);
	PlayerTextDrawLetterSize(playerid, scatterWin[playerid], 0.179166, 1.100000);
	PlayerTextDrawTextSize(playerid, scatterWin[playerid], 635.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, scatterWin[playerid], 0);
	PlayerTextDrawSetShadow(playerid, scatterWin[playerid], 0);
	PlayerTextDrawAlignment(playerid, scatterWin[playerid], 1);
	PlayerTextDrawColor(playerid, scatterWin[playerid], -65281);
	PlayerTextDrawBackgroundColor(playerid, scatterWin[playerid], 255);
	PlayerTextDrawBoxColor(playerid, scatterWin[playerid], -16777166);
	PlayerTextDrawUseBox(playerid, scatterWin[playerid], 0);
	PlayerTextDrawSetProportional(playerid, scatterWin[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, scatterWin[playerid], 0);

	scatterBalance[playerid] = CreatePlayerTextDraw(playerid, 497.000000, 353.000000, "Balance ~w~$1,000,000");
	PlayerTextDrawFont(playerid, scatterBalance[playerid], 2);
	PlayerTextDrawLetterSize(playerid, scatterBalance[playerid], 0.125000, 1.149999);
	PlayerTextDrawTextSize(playerid, scatterBalance[playerid], 635.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, scatterBalance[playerid], 0);
	PlayerTextDrawSetShadow(playerid, scatterBalance[playerid], 0);
	PlayerTextDrawAlignment(playerid, scatterBalance[playerid], 1);
	PlayerTextDrawColor(playerid, scatterBalance[playerid], -65281);
	PlayerTextDrawBackgroundColor(playerid, scatterBalance[playerid], 255);
	PlayerTextDrawBoxColor(playerid, scatterBalance[playerid], -16777166);
	PlayerTextDrawUseBox(playerid, scatterBalance[playerid], 0);
	PlayerTextDrawSetProportional(playerid, scatterBalance[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, scatterBalance[playerid], 0);

	Popup1[playerid] = CreatePlayerTextDraw(playerid, 554.000000, 116.000000, "TWO OF A KIND");
	PlayerTextDrawFont(playerid, Popup1[playerid], 2);
	PlayerTextDrawLetterSize(playerid, Popup1[playerid], 0.349999, 1.600000);
	PlayerTextDrawTextSize(playerid, Popup1[playerid], 400.000000, 168.000000);
	PlayerTextDrawSetOutline(playerid, Popup1[playerid], 0);
	PlayerTextDrawSetShadow(playerid, Popup1[playerid], 0);
	PlayerTextDrawAlignment(playerid, Popup1[playerid], 2);
	PlayerTextDrawColor(playerid, Popup1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Popup1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Popup1[playerid], 50);
	PlayerTextDrawUseBox(playerid, Popup1[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Popup1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Popup1[playerid], 0);

	Popup2[playerid] = CreatePlayerTextDraw(playerid, 554.000000, 128.000000, "x1.5");
	PlayerTextDrawFont(playerid, Popup2[playerid], 2);
	PlayerTextDrawLetterSize(playerid, Popup2[playerid], 0.349999, 1.600000);
	PlayerTextDrawTextSize(playerid, Popup2[playerid], 400.000000, 168.000000);
	PlayerTextDrawSetOutline(playerid, Popup2[playerid], 0);
	PlayerTextDrawSetShadow(playerid, Popup2[playerid], 0);
	PlayerTextDrawAlignment(playerid, Popup2[playerid], 2);
	PlayerTextDrawColor(playerid, Popup2[playerid], -65281);
	PlayerTextDrawBackgroundColor(playerid, Popup2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Popup2[playerid], 50);
	PlayerTextDrawUseBox(playerid, Popup2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Popup2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Popup2[playerid], 0);

    buy10spin[playerid] = CreatePlayerTextDraw(playerid, 587.000000, 313.000000, "BUY 10 Spin");
	PlayerTextDrawFont(playerid, buy10spin[playerid], 2);
	PlayerTextDrawLetterSize(playerid, buy10spin[playerid], 0.124999, 1.100000);
	PlayerTextDrawTextSize(playerid, buy10spin[playerid], 15.000000, 177.000000);
	PlayerTextDrawSetOutline(playerid, buy10spin[playerid], 0);
	PlayerTextDrawSetShadow(playerid, buy10spin[playerid], 0);
	PlayerTextDrawAlignment(playerid, buy10spin[playerid], 2);
	PlayerTextDrawColor(playerid, buy10spin[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, buy10spin[playerid], 255);
	PlayerTextDrawBoxColor(playerid, buy10spin[playerid], -16777166);
	PlayerTextDrawUseBox(playerid, buy10spin[playerid], 0);
	PlayerTextDrawSetProportional(playerid, buy10spin[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, buy10spin[playerid], 1);

    SetTimerEx("ShowAllScatter", 1000, false, "i", playerid);

    // Show 20 card tiles
    PlayerTextDrawShow(playerid, card1[playerid]);
    PlayerTextDrawShow(playerid, card2[playerid]);
    PlayerTextDrawShow(playerid, card3[playerid]);
    PlayerTextDrawShow(playerid, card4[playerid]);
    PlayerTextDrawShow(playerid, card5[playerid]);
    PlayerTextDrawShow(playerid, card6[playerid]);
    PlayerTextDrawShow(playerid, card7[playerid]);
    PlayerTextDrawShow(playerid, card8[playerid]);
    PlayerTextDrawShow(playerid, card9[playerid]);
    PlayerTextDrawShow(playerid, card10[playerid]);
    PlayerTextDrawShow(playerid, card11[playerid]);
    PlayerTextDrawShow(playerid, card12[playerid]);
    PlayerTextDrawShow(playerid, card13[playerid]);
    PlayerTextDrawShow(playerid, card14[playerid]);
    PlayerTextDrawShow(playerid, card15[playerid]);
    PlayerTextDrawShow(playerid, card16[playerid]);
    PlayerTextDrawShow(playerid, card17[playerid]);
    PlayerTextDrawShow(playerid, card18[playerid]);
    PlayerTextDrawShow(playerid, card19[playerid]);
    PlayerTextDrawShow(playerid, card20[playerid]);
    PlayerTextDrawShow(playerid, multiplier2x[playerid]);
    PlayerTextDrawShow(playerid, multiplier6x[playerid]);
    PlayerTextDrawShow(playerid, multiplier10x[playerid]);
    PlayerTextDrawShow(playerid, scatterSpin[playerid]);
    PlayerTextDrawShow(playerid, multiplier4x[playerid]);
    PlayerTextDrawShow(playerid, scatterAuto[playerid]);
    PlayerTextDrawShow(playerid, scatterBet[playerid]);
    PlayerTextDrawShow(playerid, clickbet[playerid]);
    PlayerTextDrawShow(playerid, scatterWin[playerid]);
    PlayerTextDrawShow(playerid, scatterBalance[playerid]);
    PlayerTextDrawShow(playerid, buy10spin[playerid]);

    new string[50];
    PlayerTextDrawHide(playerid, scatterBalance[playerid]);
    format(string, sizeof(string), "Balance ~w~%s", FormatNumber(pData[playerid][pCash]));
    PlayerTextDrawSetString(playerid, scatterBalance[playerid], string);
    PlayerTextDrawShow(playerid, scatterBalance[playerid]);

    PlayerTextDrawHide(playerid, scatterWin[playerid]);
    PlayerTextDrawSetString(playerid, scatterWin[playerid], "Win ~w~$0");
    PlayerTextDrawShow(playerid, scatterWin[playerid]);

    // Show global bars
    for(new i=0; i<14; i++) TextDrawShowForPlayer(playerid, ScatterTD[i]);

    // Enable mouse select for clicking Spin (keeps cursor on)
    SelectTextDraw(playerid, 0x33CCFFFF);
}