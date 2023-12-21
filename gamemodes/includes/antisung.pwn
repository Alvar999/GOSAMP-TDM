
#include <YSI\y_timers>


#undef MAX_PLAYERS
#define MAX_PLAYERS 150

#define COLOR_LIGHTRED 0xFF6347AA

static stock Float:pos[3], string[128], name[MAX_PLAYER_NAME + 1];

task Deletespam[150]()
{
	foreach(new playerid : Player)
	{
	    DeletePVar(playerid, "SpamTele");
	}
}

task Telespam[100]()
{
    foreach(new playerid : Player)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 10.0, GetPVarFloat(playerid, "PX"), GetPVarFloat(playerid, "PY"), GetPVarFloat(playerid, "PZ")) && GetPlayerVehicleID(playerid) == 0) {
			if(GetPVarInt(playerid, "SpamTele") == 2) {
			    format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., ly do: Hacking ", GetPlayerName(playerid, name, sizeof(name)));
	            SendClientMessageToAll(COLOR_LIGHTRED, string);
	            SetPlayerHealth(playerid, 0);
			} else SetPVarInt(playerid, "SpamTele", GetPVarInt(playerid, "SpamTele")+1);
		}
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		SetPVarFloat(playerid, "PX", pos[0]); SetPVarFloat(playerid, "PY", pos[1]); SetPVarFloat(playerid, "PZ", pos[2]);
	}
}

#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS 100

#define         COLT_DELAY_HIT          200
#define         SILENCE_HIT_DELAY       400
#define         DEAGLE_HIT_DELAY        400
#define         SHOTGUN_HIT_DELAY       0
#define         SAWNOFF_HIT_DELAY       300
#define         COMBAT_HIT_DELAY        200
#define         UZI_HIT_DELAY           400
#define         MP5_HIT_DELAY           200
#define         AK_HIT_DELAY            400
#define         M4_HIT_DELAY            400
#define         TEC_HIT_DELAY           300
#define         RIFLE_HIT_DELAY         0
#define         SNIPER_HIT_DELAY        0
#define         MINIGUN_HIT_DELAY       0
#define         KNIFE_HIT_DELAY       0
#define         FLAMETHROWER_HIT_DELAY       0
static  LastShotTime[MAX_PLAYERS];

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(hittype == BULLET_HIT_TYPE_PLAYER)
    {
        new LastShotDelay = GetTickCount() - LastShotTime[playerid];
        switch(weaponid)
        {
            // Colt 45
            case 22: if(LastShotDelay < COLT_DELAY_HIT) return 0;
            case 23: if(LastShotDelay < SILENCE_HIT_DELAY) return 0;
            case 24: if(LastShotDelay < DEAGLE_HIT_DELAY) return 0;
            case 25: if(LastShotDelay < SHOTGUN_HIT_DELAY) return 0;
            case 26: if(LastShotDelay < SAWNOFF_HIT_DELAY) return 0;
            case 27: if(LastShotDelay < COMBAT_HIT_DELAY) return 0;
            case 28: if(LastShotDelay < UZI_HIT_DELAY) return 0;
            case 29: if(LastShotDelay < MP5_HIT_DELAY) return 0;
            case 30: if(LastShotDelay < AK_HIT_DELAY) return 0;
            case 31: if(LastShotDelay < M4_HIT_DELAY) return 0;
            case 32: if(LastShotDelay < TEC_HIT_DELAY) return 0;
            case 33: if(LastShotDelay < RIFLE_HIT_DELAY) return 0;
            case 34: if(LastShotDelay < SNIPER_HIT_DELAY) return 0;
            case 38: if(LastShotDelay < MINIGUN_HIT_DELAY) return 0;
            case 4: if(LastShotDelay < KNIFE_HIT_DELAY) return 0;
            case 37: if(LastShotDelay < FLAMETHROWER_HIT_DELAY) return 0;
        }
    }
    LastShotTime[playerid] = GetTickCount();
    return CallLocalFunction("Limiter_OnPlayerWeaponShot", "iiiifff", playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
}

#if defined _ALS_OnPlayerWeaponShot
    #undef OnPlayerWeaponShot
#else
    #define _ALS_OnPlayerWeaponShot
#endif
#define OnPlayerWeaponShot Limiter_OnPlayerWeaponShot

forward Limiter_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS 150

#define RED 0xFF6347AA
#define KICKMESSAGE 1
public OnPlayerWeaponShot(playerid, weaponid)
{
	switch(weaponid) {
		case 24: {
			if(GetPVarInt(playerid,"de") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "de1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Deagle Va Cbug By Laur.");
					DeletePVar(playerid,"de1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Deagle Va Cbug By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Deagle Va Cbug By Laur.");
				}
				SetPVarInt(playerid, "de1", GetPVarInt(playerid, "de1")+1);
			}
			SetPVarInt(playerid,"de",GetTickCount()+400);
		}
		case 27: {
			if(GetPVarInt(playerid,"spas") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "spas1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Spass va Cbug By Laur.");
					DeletePVar(playerid,"spas1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Spass va Cbug By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Spass va Cbug By Laur.");
				}
				SetPVarInt(playerid, "spas1", GetPVarInt(playerid, "spas1")+1);
			}
			SetPVarInt(playerid,"spas",GetTickCount()+200);
		}
		case 29..31 : { //m4, ak
		    if((gettime() - shotTime[playerid]) < 1) {
		        shot[playerid]+=1;
	  		}
		    else {
		        shot[playerid]=0;
			}

		    if(shot[playerid] > 10) {
		        SetPlayerHealth(playerid, 0.0);
		        KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack M4 Va Mp5 Va Cbug By Laur.");
		        format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack M4 Va Mp5 Va Cbug By Laur.", GetPlayerNameEx(playerid));
                SendClientMessageToAllEx(COLOR_LIGHTRED, string);
                KickWithMessage(playerid, "Ban da bi kick, ly do: Hack M4 Va Mp5 Va Cbug By Laur.");
			}
		    shotTime[playerid] = gettime();
		}
		case 34: {
			if(GetPVarInt(playerid,"sni") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "sni1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Sniper Va Cbug By Laur.");
					DeletePVar(playerid,"sni1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Sniper Va Cbug By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Sniper Va Cbug By Laur.");
				}
				SetPVarInt(playerid, "sni1", GetPVarInt(playerid, "sni1")+1);
			}
			SetPVarInt(playerid,"sni",GetTickCount()+500);
		}
		case 38: {
			if(GetPVarInt(playerid,"minigun") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "minigun1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Minigun By Laur.");
					DeletePVar(playerid,"minigun1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Minigun By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Minigun");
				}
				SetPVarInt(playerid, "minigun1", GetPVarInt(playerid, "minigun1")+1);
			}
			SetPVarInt(playerid,"minigun",GetTickCount()+200);
		}
			//case 28: {
			//if(GetPVarInt(playerid,"UZI") > GetTickCount())
			//{
			    //if(GetPVarInt(playerid, "UZI1") > 1) {
					//SetPlayerHealth(playerid, 0.0);
					//KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Uzi By Laur.");
					//DeletePVar(playerid,"UZI1");
					//format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack UZI By Laur.", GetPlayerNameEx(playerid));
					//SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					//KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Uzi By Laur.");
				//}
				//SetPVarInt(playerid, "UZI1", GetPVarInt(playerid, "UZI1")+1);
			//}
			//SetPVarInt(playerid,"UZI",GetTickCount()+200);
		//}
		case 4: {
			if(GetPVarInt(playerid,"Knife") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "Knife1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Knife By Laur.");
					DeletePVar(playerid,"Knife1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Knife By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Knife");
				}
				SetPVarInt(playerid, "Knife1", GetPVarInt(playerid, "Knife1")+1);
			}
			SetPVarInt(playerid,"Knife",GetTickCount()+200);
		}
		case 37: {
			if(GetPVarInt(playerid,"Flamethrower") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "Flamethrower1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Flamethrower By Laur.");
					DeletePVar(playerid,"Flamethrower1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Flamethrower By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Flamethrower");
				}
				SetPVarInt(playerid, "Flamethrower1", GetPVarInt(playerid, "Flamethrower1")+1);
			}
			SetPVarInt(playerid,"Flamethrower",GetTickCount()+200);
		}
		case 32: {
			if(GetPVarInt(playerid,"TEC") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "TEC1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack TEC By Laur.");
					DeletePVar(playerid,"TEC1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack TEC By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack TEC");
				}
				SetPVarInt(playerid, "TEC1", GetPVarInt(playerid, "TEC1")+1);
			}
			SetPVarInt(playerid,"TEC",GetTickCount()+200);
		}
		case 33: {
			if(GetPVarInt(playerid,"ril") > GetTickCount())
			{
			    if(GetPVarInt(playerid, "ril1") > 1) {
					SetPlayerHealth(playerid, 0.0);
					KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Rillfe va Cbug By Laur.");
					DeletePVar(playerid,"ril1");
					format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Rillfe va Cbug By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Rillfe va Cbug By Laur.");
				}
				SetPVarInt(playerid, "ril1", GetPVarInt(playerid, "ril1")+1);
			}
			SetPVarInt(playerid,"ril",GetTickCount()+500);
		}
		case 25: {
			if(GetPVarInt(playerid,"shot") > gettime())
			{
				SetPlayerHealth(playerid, 0.0);
				KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack ShotGun Va Cbug By Laur.");
				format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack ShotGun Va Cbug By Laur.", GetPlayerNameEx(playerid));
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				KickWithMessage(playerid, "Ban da bi kick, ly do: Hack ShotGun Va Cbug By Laur.");

			}
			SetPVarInt(playerid,"shot",gettime()+1);
		}
	}
    if(PlayerInfo[playerid][pLevel] == 1 && PlayerInfo[playerid][pMember] == INVALID_GROUP_ID && PlayerInfo[playerid][pConnectHours] < 2) {
        if(GetPVarInt(playerid, "IsInArena") == -1 && GetPVarInt( playerid, "EventToken" ) == 0) {
			if(weaponid != 0) {
	            new String[128];
		        format( String, sizeof( String ), "[Laur.] Nguoi choi %s , da bi banned vinh vien do su dung hacking (Kill All).", GetPlayerNameEx(playerid));
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
	        format( String, sizeof( String ), "[Laur.] Nguoi choi %s , da bi banned vinh vien do su dung hacking (Kill All).", GetPlayerNameEx(playerid));
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
	        format( String, sizeof( String ), "[Laur.] Nguoi choi %s , da bi banned vinh vien do su dung hacking (Kill All).", GetPlayerNameEx(playerid));
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
	return 1;
}
