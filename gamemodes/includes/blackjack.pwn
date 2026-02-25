#if defined _BLACKJACK_PWN_INCLUDED
    #endinput
#endif
#define _BLACKJACK_PWN_INCLUDED

// blackjack.pwn - Modular Blackjack System
// uses Pawn.CMD format (CMD:blackjack, CMD:hit, CMD:stand, CMD:bjexit)

#define BJ_MAX_TABLES 50
#define MAX_HAND_CARDS 12
#define ENTER_RADIUS 3.0
#define DEFAULT_BET 100000

#define INVALID_BJ_TEXTDRAW PlayerText:-1

// --- Table data ---
new bool:bj_table_active[BJ_MAX_TABLES];
new Float:bj_table_x[BJ_MAX_TABLES];
new Float:bj_table_y[BJ_MAX_TABLES];
new Float:bj_table_z[BJ_MAX_TABLES];
new bj_table_bet[BJ_MAX_TABLES];
new bj_table_owner[BJ_MAX_TABLES];

// --- Per-player blackjack state ---
new PlayerInGame[MAX_PLAYERS];
new PlayerTable[MAX_PLAYERS];
new PlayerBet[MAX_PLAYERS];
new PlayerHandCount[MAX_PLAYERS];
new PlayerHand[MAX_PLAYERS][MAX_HAND_CARDS];
new DealerHandCount[MAX_PLAYERS];
new DealerHand[MAX_PLAYERS][MAX_HAND_CARDS];

// --- deck ---
new deck[52];
new deckTop = 52;

// --- Textdraws ---
new PlayerText:ptdDealerLine1[MAX_PLAYERS] = {INVALID_BJ_TEXTDRAW, ...};
new PlayerText:ptdDealerLine2[MAX_PLAYERS] = {INVALID_BJ_TEXTDRAW, ...};
new PlayerText:ptdPlayerLine1[MAX_PLAYERS] = {INVALID_BJ_TEXTDRAW, ...};
new PlayerText:ptdPlayerLine2[MAX_PLAYERS] = {INVALID_BJ_TEXTDRAW, ...};
new PlayerText:ptdInfo[MAX_PLAYERS]        = {INVALID_BJ_TEXTDRAW, ...};

// forwards
forward ShuffleDeck();
forward DrawCard();
forward CardRank(id);
forward CardSuit(id);
forward _CardName(id, dest[], len);
forward CardValue(id);
forward CalculateScore(cards[], cardcount);
forward CreateBJTextdraws(playerid);
forward UpdateBJTextdraws(playerid);
forward DestroyBJTextdraws(playerid);
forward StartRoundForPlayer(playerid, tableid);
forward EndRoundForPlayer(playerid, reason);
forward EnterBlackjackTable(playerid, tableid);
forward BJ_OnPlayerDisconnect(playerid, reason);

// ---------------- Utility ----------------
stock CardRank(id) { return id % 13; }
stock CardSuit(id) { return id / 13; }

stock _CardName(id, dest[], len)
{
    new rank = CardRank(id), suit = CardSuit(id);
    new rchar[4], schar[2];
    switch(rank)
    {
        case 0: rchar = "A";
        case 1: rchar = "2";
        case 2: rchar = "3";
        case 3: rchar = "4";
        case 4: rchar = "5";
        case 5: rchar = "6";
        case 6: rchar = "7";
        case 7: rchar = "8";
        case 8: rchar = "9";
        case 9: rchar = "10";
        case 10: rchar = "J";
        case 11: rchar = "Q";
        case 12: rchar = "K";
    }
    switch(suit)
    {
        case 0: schar = "C";
        case 1: schar = "D";
        case 2: schar = "H";
        case 3: schar = "S";
    }
    format(dest, len, "%s%s", rchar, schar);
    return 1;
}

stock CardValue(id)
{
    new r = CardRank(id);
    if (r == 0) return 11;
    if (r >= 10) return 10;
    return r + 1;
}

stock ShuffleDeck()
{
    new i, j, tmp;
    for (i = 0; i < 52; i++) deck[i] = i;
    for (i = 51; i > 0; i--)
    {
        j = random(i + 1);
        tmp = deck[i];
        deck[i] = deck[j];
        deck[j] = tmp;
    }
    deckTop = 0;
    return 1;
}

stock DrawCard()
{
    if (deckTop >= 52) ShuffleDeck();
    return deck[deckTop++];
}

stock CalculateScore(cards[], cardcount)
{
    new total = 0, aces = 0, i;
    for (i = 0; i < cardcount; i++)
    {
        new v = CardValue(cards[i]);
        total += v;
        if (CardRank(cards[i]) == 0) aces++;
    }
    while (total > 21 && aces > 0)
    {
        total -= 10; aces--;
    }
    return total;
}

// ---------------- Textdraws ----------------
stock CreateBJTextdraws(playerid)
{
    DestroyBJTextdraws(playerid);

    ptdDealerLine1[playerid] = CreatePlayerTextDraw(playerid, 320.0, 120.0, "Dealer:");
    PlayerTextDrawFont(playerid, ptdDealerLine1[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ptdDealerLine1[playerid], 0.33, 1.15);
    PlayerTextDrawSetOutline(playerid, ptdDealerLine1[playerid], 1);
    PlayerTextDrawShow(playerid, ptdDealerLine1[playerid]);

    ptdDealerLine2[playerid] = CreatePlayerTextDraw(playerid, 320.0, 140.0, "");
    PlayerTextDrawFont(playerid, ptdDealerLine2[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ptdDealerLine2[playerid], 0.33, 1.15);
    PlayerTextDrawShow(playerid, ptdDealerLine2[playerid]);

    ptdPlayerLine1[playerid] = CreatePlayerTextDraw(playerid, 320.0, 200.0, "Your hand:");
    PlayerTextDrawFont(playerid, ptdPlayerLine1[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ptdPlayerLine1[playerid], 0.33, 1.15);
    PlayerTextDrawShow(playerid, ptdPlayerLine1[playerid]);

    ptdPlayerLine2[playerid] = CreatePlayerTextDraw(playerid, 320.0, 220.0, "");
    PlayerTextDrawFont(playerid, ptdPlayerLine2[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ptdPlayerLine2[playerid], 0.33, 1.15);
    PlayerTextDrawShow(playerid, ptdPlayerLine2[playerid]);

    ptdInfo[playerid] = CreatePlayerTextDraw(playerid, 320.0, 260.0, "Press H to Hit | N to Stand | /bjexit");
    PlayerTextDrawFont(playerid, ptdInfo[playerid], 1);
    PlayerTextDrawLetterSize(playerid, ptdInfo[playerid], 0.30, 1.00);
    PlayerTextDrawShow(playerid, ptdInfo[playerid]);
    return 1;
}

stock DestroyBJTextdraws(playerid)
{
    if (ptdDealerLine1[playerid] != INVALID_BJ_TEXTDRAW)
    {
        PlayerTextDrawHide(playerid, ptdDealerLine1[playerid]);
        PlayerTextDrawDestroy(playerid, ptdDealerLine1[playerid]);
        ptdDealerLine1[playerid] = INVALID_BJ_TEXTDRAW;
    }
    if (ptdDealerLine2[playerid] != INVALID_BJ_TEXTDRAW)
    {
        PlayerTextDrawHide(playerid, ptdDealerLine2[playerid]);
        PlayerTextDrawDestroy(playerid, ptdDealerLine2[playerid]);
        ptdDealerLine2[playerid] = INVALID_BJ_TEXTDRAW;
    }
    if (ptdPlayerLine1[playerid] != INVALID_BJ_TEXTDRAW)
    {
        PlayerTextDrawHide(playerid, ptdPlayerLine1[playerid]);
        PlayerTextDrawDestroy(playerid, ptdPlayerLine1[playerid]);
        ptdPlayerLine1[playerid] = INVALID_BJ_TEXTDRAW;
    }
    if (ptdPlayerLine2[playerid] != INVALID_BJ_TEXTDRAW)
    {
        PlayerTextDrawHide(playerid, ptdPlayerLine2[playerid]);
        PlayerTextDrawDestroy(playerid, ptdPlayerLine2[playerid]);
        ptdPlayerLine2[playerid] = INVALID_BJ_TEXTDRAW;
    }
    if (ptdInfo[playerid] != INVALID_BJ_TEXTDRAW)
    {
        PlayerTextDrawHide(playerid, ptdInfo[playerid]);
        PlayerTextDrawDestroy(playerid, ptdInfo[playerid]);
        ptdInfo[playerid] = INVALID_BJ_TEXTDRAW;
    }
    return 1;
}