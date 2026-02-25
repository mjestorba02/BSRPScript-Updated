// =====================================
// Anti No-Spread (Simplified Full Build)
// =====================================

// Global storage
new Float:g_LastShotAngle[MAX_PLAYERS];
new Float:g_BlockDamageUntil[MAX_PLAYERS];
new g_Headshots[MAX_PLAYERS];
new g_TotalShots[MAX_PLAYERS];

// =====================================
// Get anglezx between two 2D points
// =====================================
stock Float:GetAngleBetween2D(Float:x1, Float:y1, Float:x2, Float:y2)
{
    new Float:dx = x2 - x1;
    new Float:dy = y2 - y1;
    return atan2(dy, dx);
}

// =====================================
// Automatic weapons only
// =====================================
stock bool:IsAutomaticWeapon(weaponid)
{
    switch (weaponid)
    {
        case 28, 29, 32, 30, 31, 26, 27:
            return true;
    }
    return false;
}

// =====================================
// Block damage temporarily
// =====================================
stock BlockPlayerDamageFor(playerid, seconds)
{
    g_BlockDamageUntil[playerid] = GetTickCount() + (seconds * 1000);
    return 1;
}

// =====================================
// Check if damage is blocked
// =====================================
stock bool:IsDamageBlocked(playerid)
{
    return (GetTickCount() < g_BlockDamageUntil[playerid]);
}

// =====================================
// Headshot check (rough distance test)
// =====================================
stock bool:IsHeadshotFromCoords(targetid, Float:hitX, Float:hitY, Float:hitZ)
{
    new Float:tx, Float:ty, Float:tz;
    GetPlayerPos(targetid, tx, ty, tz);
    // Head is about 0.9 meters above torso
    if (floatabs(hitZ - (tz + 0.9)) <= 0.25)
        return true;
    return false;
}

// =====================================
// Admin notify
// =====================================
stock NotifyAdmins(const message[])
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i) && IsPlayerAdmin(i))
        {
            SendClientMessage(i, 0xFF6347FF, message);
        }
    }
}

// =====================================
// Suspicious log printer
// =====================================
stock LogPlayerSuspicious(playerid, const reason[])
{
    new pname[MAX_PLAYER_NAME], str[144];
    GetPlayerName(playerid, pname, sizeof pname);
    format(str, sizeof str, "[ANTI-CHEAT] %s flagged: %s", pname, reason);
    print(str);
    NotifyAdmins(str);
}

// =====================================
// Action when suspicious
// =====================================
stock TakeActionAgainstPlayer(playerid, Float:risk, Float:mean, Float:variance, Float:hsrate)
{
    BlockPlayerDamageFor(playerid, 10);

    new pname[MAX_PLAYER_NAME], msg[144];
    GetPlayerName(playerid, pname, sizeof pname);
    format(msg, sizeof msg, "AdmCmd: [BETA Anti-NoSpread] %s suspicious (risk: %.2f mean: %.2f var: %.2f hs: %.2f)",
        pname, risk, mean, variance, hsrate);
    NotifyAdmins(msg);

    // Optionally:
    // Kick(playerid);
    // BanEx(playerid, "Detected Aimbot/No-Spread");
}