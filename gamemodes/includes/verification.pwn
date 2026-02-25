#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>

#define DISCORDS
#if defined DISCORDS

// Cipher Verification System - 10/02/22
#define MINUTES_TO_EXPIRE	5 // minutes before the code expires

#define BOT_CHANNEL_ID 	"1339590872484020294" // Your text-channel where you want the command to work (right click on text channel and click COPY ID)
#define DISCORD_ID		"874512846220840970" // Your Discord Server ID (right-click on your discord server and click COPY ID)
#define ROLE_ID			"1312710386465771580" // Your role ID (right click on the role you want and click COPY ID)

new DCC_Guild:discord;
new DCC_Channel:bot_channel;
new DCC_Role:verified_role;

SendEmbedMessage(DCC_Channel:channel, color, const title[], const message[])
{
    new DCC_Embed:embed= DCC_CreateEmbed(title);
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedDescription(embed, message);
    DCC_SendChannelEmbedMessage(channel, embed);
}

SendVerificationMessage(DCC_Channel:channel, color, const title[], const message[])
{
    new DCC_Embed:embed= DCC_CreateEmbed(title);
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedDescription(embed, message);
    DCC_SendChannelEmbedMessage(channel, embed);
    
    // Image
    new Image[128];
    format(Image, sizeof(Image), "https://cdn.discordapp.com/attachments/1323549869385711738/1326623611355926538/Messenger_creation_79B72E94-F491-4FD4-8CD4-D978CFF79DB2.jpg?ex=67816b84&is=67801a04&hm=f41fc128a1f3e063ffed18929362f3ac1c35ce8c68bf477000714c56ddafa3ee&");
    DCC_SetEmbedImage(embed, Image);
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		if(!IsPlayerDCVerified(playerid))
		{
			SendClientMessage(playerid, -1, "You haven't verified yourself yet, use /verify to verify yourself.");
			ClearAnimations(playerid);
		}
	}
	return 1;
}

hook OnGameModeInit()
{
	// Discord Server ID
	discord = DCC_FindGuildById(DISCORD_ID);

	// Discord Channel ID (where !verify have to work)
	bot_channel = DCC_FindChannelById(BOT_CHANNEL_ID);

	// Verified Role ID
	verified_role = DCC_FindRoleById(ROLE_ID);
    return 1;
}

public OnDiscordCommandAttempt(DCC_User:user, DCC_Channel:channel, cmdtext[]) {

    if(!strcmp(cmdtext, "verify"))
	{
		new bool:has_role, szString[256];
		IsDiscordUserVerified(user, has_role);

		if(channel != bot_channel)
		{
			new channel_name[64];
			DCC_GetChannelName(bot_channel, channel_name, sizeof(channel_name));

			format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
			SendEmbedMessage(channel, 0xFF0000, "Wrong Channel!", szString);
			return 0;
		}

		if(has_role == true)
		{
			SendEmbedMessage(bot_channel, 0xFF0000, "Already Verified!", "You are already verified on another account!");
			return 0;
		}
    }
    return 1;
}

forward OnPlayerVerifiedCheck(playerid);
public OnPlayerVerifiedCheck(playerid)
{
	new string[256 * 2], str[(1024 * 2)];

	if(cache_get_row_count(connectionID))
	{
        if(cache_get_field_content_int(0, "verified"))
        {
	    	SendClientMessage(playerid, -1, "You are already verified or this code was already used to verify another account!");
	    	return 1;
        }
		else 
		{
			new code = random(9000) + 1000;

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), 
				"UPDATE verified_users SET code = %d, expiration = %d WHERE username = '%e'", 
				code, 
				(gettime() + 60 * MINUTES_TO_EXPIRE), 
				pData[playerid][pUsername]);
			mysql_tquery(connectionID, queryBuffer);

			format(string, sizeof(string), "{FFFFFF}Use the code {33AA33}%d{FFFFFF} to link your in game account to your discord.\n{FFFFFF}To verify your account, send '"GREEN"!verify %d"WHITE" on "GREEN"#verification"WHITE" discord channel:\n\n{FF0000}You have %d minutes before this code expires!", code, code, MINUTES_TO_EXPIRE);
			strcat(str, string);

			ShowPlayerDialog(playerid, DIALOG_REGISTER_DISCORD, DIALOG_STYLE_MSGBOX, "Account Verification!", str, "Back", "");
		}

    }
	else
	{
		new code = strlen(pData[playerid]) + 1000 + (random(999) + 1); // XXXX
		str[0] = EOS;

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "INSERT INTO verified_users (playerid, Username, code, expiration) VALUES(%d, '%e', %d, %d)", playerid, pData[playerid][pUsername], code, (gettime() + 60 * MINUTES_TO_EXPIRE));
		mysql_tquery(connectionID, queryBuffer);

		format(string, sizeof(string), "{FFFFFF}Use the code {33AA33}%d{FFFFFF} to link your in game account to your discord.\n{FFFFFF}To verify your account, send '"GREEN"!verify %d"WHITE" on "GREEN"#verification"WHITE" discord channel:\n\n{FF0000}You have %d minutes before this code expires!", code, code, MINUTES_TO_EXPIRE);
		strcat(str, string);

		ShowPlayerDialog(playerid, DIALOG_REGISTER_DISCORD, DIALOG_STYLE_MSGBOX, "Account Verification!", str, "Back", "");
	}
	return 1;
}

forward OnVerifiedCheck(playerid);
public OnVerifiedCheck(playerid)
{
	if(cache_get_row_count(connectionID))
	{
		pData[playerid][pVerified] = cache_get_field_content_int(0, "verified");

		if(cache_get_field_content_int(0, "code") && gettime() >= cache_get_field_content_int(0, "expiration")) // if the code has expired.
		{
			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM verified_users WHERE Username = '%e'", pData[playerid][pUsername]);
			mysql_tquery(connectionID, queryBuffer);

			pData[playerid][pVerified] = 0;
			return 1;
		}
	}
	else
	{
		pData[playerid][pVerified] = 0;
	}
	return 1;
}

forward OnVerifiedCodeSearch(DCC_User:user, code);
public OnVerifiedCodeSearch(DCC_User:user, code)
{
    new playerid = INVALID_PLAYER_ID, user_name[DCC_USERNAME_SIZE], user_id[DCC_ID_SIZE], discord_tag[24];
	new player_name[MAX_PLAYER_NAME], bool:has_role;

    DCC_GetUserId(user, user_id, sizeof(user_id));
	new DCC_User:confirmed_user = DCC_FindUserById(user_id);

	new szString[500];

    if(cache_get_row_count(connectionID))
	{
		cache_get_field_content(0, "Username", player_name, sizeof(player_name));
		IsDiscordUserVerified(user, has_role);

		if(has_role == true)
		{
			DCC_GetUserName(confirmed_user, user_name, sizeof(user_name));
			DCC_GetUserDiscriminator(confirmed_user, discord_tag, sizeof(discord_tag));

			SendClientMessageEx(playerid, -1, "%s#%d is already verified to another account.", user_name, discord_tag);
			SendEmbedMessage(bot_channel, 0xFF0000, "Already Verified!", "You are already verified on another account!");
			return 1;
		}

		if(cache_get_field_content_int(0, "verified"))
		{
			SendClientMessage(playerid, -1, "You are already verified or this code was already used to verify another account!");
			SendEmbedMessage(bot_channel, 0xFF0000, "Already Verified!", "You are already verified or this code was already used to verify another account!");
			return 1;
		}

		if(gettime() >= cache_get_field_content_int(0, "expiration"))
		{
			SendClientMessage(playerid, -1, "This code has passed the 5 minute mark, and is therefore expired.");

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM verified_users WHERE code = %d", code);
			mysql_tquery(connectionID, queryBuffer);

			SendEmbedMessage(bot_channel, 0xFF0000, "Code Expired!", "This code has passed the 5 minute mark, and is therefore expired.");
			return 1;
		}

		foreach(new i : Player)
		{
			if(!strcmp(player_name, pData[i][pUsername]))
			{
				playerid = i;
				break;
			}
		}

		if(IsPlayerConnected(playerid))
		{
			DCC_GetUserName(confirmed_user, user_name, sizeof(user_name));
			DCC_GetUserDiscriminator(confirmed_user, discord_tag, sizeof(discord_tag));

			SendClientMessageEx(playerid, -1, "Your account is verified! (Linked to %s#%s)", user_name, discord_tag);
			SendClientMessage(playerid, 0xA9C4E4FF, "You will now be able to access the whole features in the server.");
			format(szString, sizeof(szString), "The account **%s** has been successfully linked to your discord account. You will now be able access the features in the server and much more.\n\n**Welcome to %s!**", pData[playerid][pUsername], SERVER_NAME);
			SendVerificationMessage(bot_channel, 0x00FF00, "Successfully Verified!", szString);

			printf("[Verification] A discord user with ID %s has linked their account to %s and is now verified.", user_id, pData[playerid][pUsername]);

			// Discord perks
			DCC_AddGuildMemberRole(discord, confirmed_user, verified_role);
			DCC_SetGuildMemberNickname(discord, confirmed_user, GetRPName(playerid));

			pData[playerid][pVerified] = 1;
			CharacterCreation(playerid);

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET verify = %i WHERE uid = %i", pData[playerid][pVerified], pData[playerid][pID]);
			mysql_tquery(connectionID, queryBuffer);

			mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE verified_users SET code = 0, verified = 1, playerid = %d WHERE code = %d", playerid, code);
			mysql_tquery(connectionID, queryBuffer);
		}
		else
		{
			format(szString, sizeof(szString), "Code %d is registered to user %s. That player is not online in the server.", code, player_name);
			SendEmbedMessage(bot_channel, 0xFF0000, "Player Not Online", szString);
		}
	}
	else
	{
        format(szString, sizeof(szString), "We cannot find a user with this code in the database.\n\nPlease try to check the code again in the /verify command **in-game**.");
        SendEmbedMessage(bot_channel, 0xFF0000, "Invalid Code!", szString);
    }
	return 1;
}

forward SendVerifiedBotMessage(DCC_User:user, color, const title[], const message[]);
public SendVerifiedBotMessage(DCC_User:user, color, const title[], const message[])
{
    new DCC_Embed:embed= DCC_CreateEmbed(title);
	new DCC_Channel:channel = DCC_GetCreatedPrivateChannel();
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedDescription(embed, message);
    DCC_SendChannelEmbedMessage(channel, embed);
}

forward OnVerifiedUserLeft(DCC_User:user, user_id[]);
public OnVerifiedUserLeft(DCC_User:user, user_id[])
{
	if(cache_get_row_count(connectionID))
	{
		new player_name[MAX_PLAYER_NAME];
		cache_get_field_content(0, "Username", player_name, sizeof(player_name));

		for(new i = 0, j = MAX_PLAYERS; i <= j; i++)
		{
			if(!strcmp(player_name, pData[i][pUsername], false))
			{
				pData[i][pVerified] = 0;
				break;
			}
		}

		new szString[500];
		format(szString, sizeof(szString), "You left **%s**, your discord account has been automatically unverified from your in game account %s.\n\nYou will have to use the command /verify in game again to verify and link your account.\n\n- **%s**", SERVER_NAME, player_name, SERVER_NAME);
		SendEmbedMessage(bot_channel, 0xFF0000, "Unlink Notice", szString);

		printf("[Verification Complete] User ID %s is verified to %s and was unverified since they left the discord server.", user_id, player_name);

		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "DELETE FROM verified_users WHERE Username = '%e'", player_name);
		mysql_tquery(connectionID, queryBuffer);
	}
	else
	{
		printf("[Verification Complete] User ID %s is not verified in game.", user_id);
	}
	return 1;
}

// discord callbacks
public DCC_OnGuildMemberRemove(DCC_Guild:guild, DCC_User:user) // if a user leaves or was removed from the Discord Server
{
	if(guild == discord) // guild must be equal to your server's.
	{
		// check if the removed user has a verified account.
		new user_id[DCC_ID_SIZE];
		DCC_GetUserId(user, user_id, sizeof(user_id));
		printf("[Verified User] A user with the ID of %s has left the discord server, checking if they are verified in game...", user_id);
		mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT * FROM verified_users WHERE verified_id = '%e'", user_id);
		mysql_tquery(connectionID, queryBuffer, "OnVerifiedUserLeft", "ds", _:user, user_id);
	}
	return 1;
}

// functions
IsDiscordUserVerified(DCC_User:user, &bool:has_role)
{
	DCC_HasGuildMemberRole(discord, user, verified_role, has_role);
}

IsPlayerDCVerified(playerid)
{
	return pData[playerid][pVerified];
}

task VerifiedTiker[1000]()
{
    foreach (new i : Player)
	{
	    NotVerified(i);
	}
}

NotVerified(playerid)
{
	if(!pData[playerid][pVerified] && pData[playerid][pLogged])
	{
        if(!IsPlayerInRangeOfPoint(playerid, 15.0, 1446.634155, -2286.765625, 13.546875))
        {
            SetPlayerPos(playerid, 1446.634155, -2286.765625, 13.546875);
			SetPlayerFacingAngle(playerid, 84.62);
			SendClientMessage(playerid, -1, "You are not Verified.");
        }
	}
}


// discord command
DCMD:verify(user, channel, params[])
{
    new code, szString[500];

	if(sscanf(params, "i", code))
	{
	    SendEmbedMessage(bot_channel, 0xFF0000, "Wrong Command Usage", "Usage: !verify [code]");
		return 1;
	}

	if(channel != bot_channel)
	{
		new channel_name[64];
		DCC_GetChannelName(bot_channel, channel_name, sizeof(channel_name));

		format(szString, sizeof(szString), "This command should only be used on #%s!", channel_name);
		SendEmbedMessage(channel, 0xFF0000, "Wrong Channel!", szString);
		return 0;
	}

    if(code == 0)
    {
        format(szString, sizeof(szString), "We cannot find a user with this code in the database.\n\nPlease try to check the code again in the /verify command **in-game**.");
        SendEmbedMessage(bot_channel, 0xFF0000, "Invalid Code!", szString);
        return 1;
    }

	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT * FROM verified_users WHERE code = %i", code);
	mysql_tquery(connectionID, queryBuffer, "OnVerifiedCodeSearch", "dd", _:user, code);
	return 1;
}

// in game command
CMD:verify(playerid, params[])
{
	SendClientMessage(playerid, -1, "Checking if you have any valid verification code...");

	SetTimerEx("OnPlayerVerifying", 3000, false, "i", playerid);
	return 1;
}

forward OnPlayerVerifying(playerid);
public OnPlayerVerifying(playerid)
{
    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "SELECT * FROM verified_users WHERE Username = '%e' LIMIT 1;", pData[playerid][pUsername]);
	mysql_tquery(connectionID, queryBuffer, "OnPlayerVerifiedCheck", "d", playerid);
	return 1;
}

#endif