#include <YSI\y_hooks>
hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    //Anti Crash
    if( hittype != BULLET_HIT_TYPE_NONE ) {
	    if(!( -1000.0 <= fX <= 1000.0 ) || !( -1000.0 <= fY <= 1000.0 ) || !( -1000.0 <= fZ <= 1000.0)) {
			return 0;
		}
	}

	if(PlayerInfo[playerid][pLevel] == 1 && PlayerInfo[playerid][pMember] == INVALID_GROUP_ID && PlayerInfo[playerid][pConnectHours] < 2) {
        if(GetPVarInt(playerid, "IsInArena") == -1 && GetPVarInt( playerid, "EventToken" ) == 0) {
			if(weaponid != 0) {
	            new String[128];
		        format( String, sizeof( String ), "[GOSAMP] Nguoi choi %s , da bi banned vinh vien do su dung hacking (Kill All).", GetPlayerNameEx(playerid));
				ABroadCast( COLOR_LIGHTRED, String, 2 );
				SendClientMessage(playerid, COLOR_LIGHTRED, String );
				SetPVarInt(playerid, "_HACK_WARNINGS", 0);
				RemovePlayerWeapon(playerid, weaponid);
				PlayerInfo[playerid][pBanned] = 3;
				new playerip[32];
				GetPlayerIp(playerid, playerip, sizeof(playerip));
				format( String, sizeof( String ), "AdmCmd: %s (IP:%s) da bi khoa tai khoan, ly do: Hack Kill All", GetPlayerNameEx(playerid), playerip);
				PlayerInfo[playerid][pBanned] = 3;
				Log("logs/ban.log", String);

				new rcon_banip[24], rcon_banned[24];
			    GetPlayerIp(playerid, playerip, sizeof(playerip));
				format(rcon_banip, sizeof(rcon_banip),"banip %s", playerip);
				SendRconCommand(rcon_banip);

				format(rcon_banned, sizeof(rcon_banned),"ban %d", playerid);
				SendRconCommand(rcon_banned);

				SystemBan(playerid, "[System] (Hack KillAll)");
				MySQLBan(GetPlayerSQLId(playerid), playerip, "Hack KillAll", 1,"nDPDz");
				SetTimerEx("KickEx", 1000, 0, "i", playerid);
				TotalAutoBan++;
			}
		}
	}

 	if(GetPVarInt(playerid, "IsInArena") == -1 && GetPVarInt( playerid, "EventToken" ) == 0)
	{
	    if(weaponid == 4 || weaponid == 9 || weaponid == 38)
	    {
	        new String[128];
	        format( String, sizeof( String ), "[GOSAMP] Nguoi choi %s , da bi banned vinh vien do su dung hacking (Kill All).", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, String, 2 );
			SendClientMessage(playerid, COLOR_LIGHTRED, String );
			SetPVarInt(playerid, "_HACK_WARNINGS", 0);
			RemovePlayerWeapon(playerid, weaponid);
			PlayerInfo[playerid][pBanned] = 3;
			new playerip[32];
			GetPlayerIp(playerid, playerip, sizeof(playerip));
			format( String, sizeof( String ), "AdmCmd: %s (IP:%s) da bi khoa tai khoan, ly do: Hack Kill All", GetPlayerNameEx(playerid), playerip);
			PlayerInfo[playerid][pBanned] = 3;
			Log("logs/ban.log", String);

			new rcon_banip[24], rcon_banned[24];
		    GetPlayerIp(playerid, playerip, sizeof(playerip));
			format(rcon_banip, sizeof(rcon_banip),"banip %s", playerip);
			SendRconCommand(rcon_banip);

			format(rcon_banned, sizeof(rcon_banned),"ban %d", playerid);
			SendRconCommand(rcon_banned);

			SystemBan(playerid, "[System] (Hack KillAll)");
			MySQLBan(GetPlayerSQLId(playerid), playerip, "Hack KillAll", 1,"nDPDz");
			SetTimerEx("KickEx", 1000, 0, "i", playerid);
			TotalAutoBan++;
	    }
	}
	if(GetPVarInt(playerid, "IsInArena") == -1 && GetPVarInt( playerid, "EventToken" ) == 0)
	{
	    if(amount > 100)
	    {
	        new String[128];
	        format( String, sizeof( String ), "[GOSAMP] Nguoi choi %s , da bi banned vinh vien do su dung hacking (Kill All).", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, String, 2 );
			SendClientMessage(playerid, COLOR_LIGHTRED, String );
			SetPVarInt(playerid, "_HACK_WARNINGS", 0);
			RemovePlayerWeapon(playerid, weaponid);
			PlayerInfo[playerid][pBanned] = 3;
			new playerip[32];
			GetPlayerIp(playerid, playerip, sizeof(playerip));
			format( String, sizeof( String ), "AdmCmd: %s (IP:%s) da bi khoa tai khoan, ly do: Hack Kill All", GetPlayerNameEx(playerid), playerip);
			PlayerInfo[playerid][pBanned] = 3;
			Log("logs/ban.log", String);

			new rcon_banip[24], rcon_banned[24];
		    GetPlayerIp(playerid, playerip, sizeof(playerip));
			format(rcon_banip, sizeof(rcon_banip),"banip %s", playerip);
			SendRconCommand(rcon_banip);

			format(rcon_banned, sizeof(rcon_banned),"ban %d", playerid);
			SendRconCommand(rcon_banned);

			SystemBan(playerid, "[System] (Hack KillAll)");
			MySQLBan(GetPlayerSQLId(playerid), playerip, "Hack KillAll", 1,"nDPDz");
			SetTimerEx("KickEx", 1000, 0, "i", playerid);
			TotalAutoBan++;
	    }
	}
	if(weaponid != 38)
	{
	    if((gettime() - shotTime[playerid]) < 1) shot[playerid]+=1;
	    
		else shot[playerid]=0; 

		if(shot[playerid] > 15) Kick(playerid);

	    shotTime[playerid] = gettime();
	}
	return 1;
}
