#include <YSI\y_hooks>

new TrollCar[MAX_PLAYERS];



stock PutPlayerInVehicleBe(playerid, vehicleid, seatid)
{
    if(vehicleid != INVALID_VEHICLE_ID && seatid != 128)
		TrollCar[playerid] = vehicleid;
	PutPlayerInVehicle(playerid, vehicleid, seatid);
	return 1;
}

stock GetSpeedPlayer(playerid)
{
	new	Float:pos[3], Float:PlayerSpeedDistance;
 	GetPlayerVelocity(playerid, pos[0], pos[1], pos[2]);
	PlayerSpeedDistance = floatmul(floatsqroot(floatadd(floatadd(floatpower(pos[0], 2), floatpower(pos[1], 2)),  floatpower(pos[2], 2))), 170.0);
	new
 		spe = floatround(PlayerSpeedDistance * 1);
	return spe;
}

stock GetSpeedKM(playerid)
{
	new	Float:pos[3], Float:PlayerSpeedDistance;
 	GetVehicleVelocity(GetPlayerVehicleID(playerid), pos[0], pos[1], pos[2]);
	PlayerSpeedDistance = floatmul(floatsqroot(floatadd(floatadd(floatpower(pos[0], 2), floatpower(pos[1], 2)),  floatpower(pos[2], 2))), 170.0);
	new
 		spe = floatround(PlayerSpeedDistance * 1);
	return spe;
}

hook OnPlayerConnect(playerid)
{
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    TrollCar[playerid] = INVALID_PLAYER_ID;
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    TrollCar[playerid] = vehicleid;
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

forward KickPublic(playerid);
public KickPublic(playerid) { Kick(playerid); }

KickWithMessage(playerid, message[])
{
	new string[640];
    //SendClientMessageEx(playerid, COLOR_LIGHTRED, message);
    format(string, sizeof(string), "%s\n\nNeu day la mot nham lan tai khoan xin hay lien he voi BQT de khieu nai.\nVui long Khong Hack Neu Thac Mac Lien He NgPhi Hung - Laur.[]", message);
    ShowPlayerDialog(playerid,KICKMESSAGE,DIALOG_STYLE_MSGBOX,"Canh Bao",string,"Thoat","");
    SetTimerEx("KickPublic", 1000, 0, "d", playerid);
}
//___________________________________________________________________________
#if defined _ALS_PutPlayerInVehicle
#undef PutPlayerInVehicle
#else
#define _ALS_PutPlayerInVehicle
#endif
#define PutPlayerInVehicle PutPlayerInVehicleBe
task KiemTraDan[1000]() {
	foreach(new playerid: Player) {
		if(GetPVarInt(playerid, "IsInArena") == -1 && GetPVarInt( playerid, "EventToken" ) == 0) { // && PlayerInfo[playerid][pMember] == INVALID_GROUP_ID
	        if(GetPlayerWeapon(playerid) == 22) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][1] + 20) {

	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "9mm", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][1]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			RemovePlayerWeapon(playerid, 22);
	    			//GivePlayerValidWeapon(playerid, 22, PlayerInfo[playerid][pAmmo][1]);
	        	}
	        }
	        else if(GetPlayerWeapon(playerid) == 23) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][1] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "S-9mm", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][1]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 23);
	    			//GivePlayerValidWeapon(playerid, 23, PlayerInfo[playerid][pAmmo][1]);
	        	}
	        }
	        else if(GetPlayerWeapon(playerid) == 24) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][1] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Deagle", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][1]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 24);
	    			//GivePlayerValidWeapon(playerid, 24, PlayerInfo[playerid][pAmmo][1]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 25) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][2] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Shotgun", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][2]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 25);
	    			//GivePlayerValidWeapon(playerid, 25, PlayerInfo[playerid][pAmmo][2]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 27) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][2] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Spas-12", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][2]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 27);
	    			//GivePlayerValidWeapon(playerid, 27, PlayerInfo[playerid][pAmmo][2]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 28) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][3] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Uzi", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][3]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 28);
	    			//GivePlayerValidWeapon(playerid, 28, PlayerInfo[playerid][pAmmo][3]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 29) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][3] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "MP5", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][3]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 29);
	    			//GivePlayerValidWeapon(playerid, 29, PlayerInfo[playerid][pAmmo][3]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 32) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][3] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Uzi", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][3]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 32);
	    			//GivePlayerValidWeapon(playerid, 32, PlayerInfo[playerid][pAmmo][3]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 30) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][4] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "AK-47", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][4]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 30);
	    			//GivePlayerValidWeapon(playerid, 30, PlayerInfo[playerid][pAmmo][4]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 31) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][4] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "M4a1", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][4]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 31);
	    			//GivePlayerValidWeapon(playerid, 31, PlayerInfo[playerid][pAmmo][4]);
	        	}
	        }

	        else if(GetPlayerWeapon(playerid) == 33) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][5] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Rifle", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][5]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 33);
	    			//GivePlayerValidWeapon(playerid, 33, PlayerInfo[playerid][pAmmo][5]);
	        	}
	        }

	        if(GetPlayerWeapon(playerid) == 34) {
	        	if(GetPlayerAmmo(playerid) > PlayerInfo[playerid][pAmmo][5] + 20) {
	        		new string[1280];
	        		format(string, sizeof(string), "[GOSAMP] Nguoi choi %s co the dang su dung hack ammo vu khi %s. [%d / %d]", GetPlayerNameEx(playerid), "Sniper", GetPlayerAmmo(playerid), PlayerInfo[playerid][pAmmo][5]);
	    			ABroadCast(COLOR_LIGHTRED, string, 2);

	    			//RemovePlayerWeapon(playerid, 34);
	    			//GivePlayerValidWeapon(playerid, 34, PlayerInfo[playerid][pAmmo][5]);
	        	}
	        }
		}
	}
}
// Anti TeleMap
task AntiTeleMap[500]()
{
    new Float:pos[3];
    foreach(new playerid : Player) {
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		if(GetPVarInt(playerid, "ClickMapa") > gettime())
		{
		    if(PlayerInfo[playerid][pAdmin] == 0) {
				if(!IsPlayerInRangeOfPoint(playerid, 30.0, GetPVarFloat(playerid, "PX"), GetPVarFloat(playerid, "PY"), GetPVarFloat(playerid, "PZ")))
				{
					DeletePVar(playerid, "SpamTele");
					FlagTele[playerid] = 0;

					new string[1280];
					format(string,sizeof(string),"{AA3333}GOSAMP{FFFF00}: %s (ID: %d) co the dang hack teleport by GOSAMP.",GetPlayerNameEx(playerid), playerid);
					ABroadCast(COLOR_YELLOW , string, 2);
				}
		 	}
			SetPVarFloat(playerid, "PX", pos[0]); SetPVarFloat(playerid, "PY", pos[1]); SetPVarFloat(playerid, "PZ", pos[2]);
		}
	}
}

stock Error(playerid, text[])
{
	return SendClientMessage(playerid, COLOR_RED, text);
}
// Anti Thong Bao
task ThongBaoAll[600000]()
{
    SendClientMessageToAllEx(-1, "[GOSAMP] Xin Thong Bao Toan The Sever TDM : ");
    SendClientMessageToAllEx(-1, "    + Discord (( {00ffff}https://discord.gg/sZKawzhC{FFFFFF} )).");
    SendClientMessageToAllEx(-1, "    + Nghiem Cam Su Dung Cheat/Hacking (( Group : {00ff00} fb.com/groups/gosamp.top ))");
    SendClientMessageToAllEx(COLOR_YELLOW, "    + Neu Nguoi Choi Can Thiet Lien He Admin, Hoac La Nguoi Moi Choi Ban Co The Su Dung Cac Chuc Nang Nhu: (/fixketvw) , (/baocao) , (/sf).");
}
//forward AntiSpamCar();
//public AntiSpamCar()
task AntiSpamCar[500]()
{
    foreach(new playerid : Player) {
		if(GetPlayerVehicleID(playerid) != 0) {
		    if(TrollCar[playerid] != GetPlayerVehicleID(playerid))
			{
			    if(GetPVarInt(playerid, "KhongHacking") == 0 && GetPVarInt(playerid, "spam3") == 0)
			    {
			        SetTimerEx("spam4", 5000, 0, "d", playerid);
					SetPVarInt( playerid, "spam3", 1);

	                //==================//
	                new string[256];
					format(string, sizeof(string), "{AA3333}Laur.[]{FFFF00}: %s (ID %d) da bi sut' ra khoi may chu Ly do : Hack Troll Car By Laur.[].", GetPlayerNameEx(playerid), playerid);
			        SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			        KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Troll Car By Laur.[]");
					//==================//
				}
			}
		}
	}
}
//forward AntiHackFly();
//public AntiHackFly() alo anh phuong con song khong
task AntiHackFly[500]()
{
    foreach(new playerid : Player) {
	    new closestcar = GetClosestCar(playerid);
	    // M dang admin thi sao test dc anti hack
	 	// PlayerInfo[playerid][pAdmin] == 0 | Nay la dieu kien m khong phai admin ne
		if(PlayerInfo[playerid][pAdmin] == 0 && GetPVarInt(playerid, "Injured") == 0 && GetPlayerAnimationIndex(playerid) != 1130 && GetPlayerAnimationIndex(playerid) != 984)
		{
			if(!IsPlayerInAnyVehicle(playerid))
			{
				if(!IsPlayerInRangeOfVehicle(playerid, closestcar, 20.0))
				{
					if(GetSpeedPlayer(playerid) > 200)
					{
						new string[128];
						format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur.[], ly do: Hack Fly By Laur.", GetPlayerNameEx(playerid));
						SendClientMessageToAll(COLOR_LIGHTRED, string);
						KickWithMessage(playerid, "Ban da bi kick, Ly do: Hack Fly By Laur.");
					    
					}
				}
			}
		}
	}
}
//forward AntiHackSpeedCar();
//public AntiHackSpeedCar()

task AntiHackSpeedCar[500]()
{
    foreach(new playerid : Player) {
		new newcar = GetPlayerVehicleID(playerid), Float:pos[3];
	    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsAPlane(newcar) && !IsABoat(newcar))
		{
	        if(GetSpeedKM(playerid) > TocDoGioiHan)
	        {
				GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
				TPPlayer(playerid, pos[0], pos[1], pos[2]+5);
				SendClientMessageEx(playerid, COLOR_GRAD1, "Ban dang su dung: Hacking Speed Car , vui long tat neu con mot lan nua ban se bi kick By Laur.");
				FlyCar[playerid] += 1;
				//====//
				if(FlyCar[playerid] == 2)
				{
				    new string[256];
				    format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Speed Car By Laur.", GetPlayerNameEx(playerid));
					SendClientMessageToAllEx(COLOR_LIGHTRED, string);
					KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Speed Car By Laur.");
				   
				}
			}
		}
	}
}
task AntiSlap[500]()
{
    foreach(new playerid : Player) {
		if(PlayerInfo[playerid][pAdmin] < 2 && GetPVarInt(playerid, "spam1") == 0)
	    {
			new Float:Pos_x,Float:Pos_y,Float:Pos_z;
			new anim = GetPlayerAnimationIndex(playerid);
			GetPlayerVelocity(playerid,Pos_x,Pos_y,Pos_z);
			if(Pos_x <= -0.8  || Pos_y <= -0.8 || Pos_y <= -0.9 && anim != 0)
	       	if(GetPlayerSurfingVehicleID(playerid) ==  INVALID_VEHICLE_ID)
			{
                new string[128];
		        format(string, sizeof(string), "AdmCmd: %s da bi kick boi Laur., Ly do: Hack Slap Va Fly By Laur.",GetPlayerNameEx(playerid));
				ABroadCast(COLOR_YELLOW , string, 2);
				SetTimerEx("spam2", 5000, 0, "d", playerid);
				SetPVarInt( playerid, "spam1", 1 );
			    SendClientMessageToAllEx(COLOR_LIGHTRED, string);
		        KickWithMessage(playerid, "Ban da bi kick, ly do: Hack Slap va Fly By Laur.");
				
			}
		}
	}
}
forward spam2(playerid);
public spam2(playerid)
{
    DeletePVar(playerid, "spam1");
    return 1;
}
forward spam4(playerid);
public spam4(playerid)
{
    DeletePVar(playerid, "spam3");
    return 1;
}

forward spam6(playerid);
public spam6(playerid)
{
    DeletePVar(playerid, "spam5");
    return 1;
}
task AntiSkinCJ[500]()
{
    foreach(new playerid : Player){
	    new Laur;
	    Laur = GetPlayerSkin(playerid);

		if(Laur == 0 || Laur == 92 || Laur == 99)
		{
		    if(PlayerInfo[playerid][pAdmin] == 0){
			    new skin = random(311);
	      		SetPlayerSkin(playerid, skin);
	      		PlayerInfo[playerid][pModel] = skin;
      		}
		}
	}
}
task CheckHackFly[500]()
{
    foreach(new playerid : Player)
	{
		new string[128];
		pSpeed[playerid] = LaySpeedPlayerid(playerid);
		if(pSpeed[playerid] >= 200.0 && PlayerInfo[playerid][pAdmin] == 0 && JetPack[playerid] == 0)
		{
			if(ReloadTime[playerid] < gettime())
			{
			    format(string, sizeof(string), "{AA3333}GOSAMP{FFFF00}: %s co the dang hack Slap by Laur. .", GetPlayerNameEx(playerid), LaySpeedPlayerid(playerid));
			    ABroadCast(COLOR_YELLOW, string, 2);
			    ReloadTime[playerid] = gettime()+5;
			}
		}
	}
	return 1;
}
forward Float: LaySpeedPlayerid(playerid);
public Float: LaySpeedPlayerid(playerid)
{
	new Float: fVelocity[3];
	GetPlayerVelocity(playerid, fVelocity[0], fVelocity[1], fVelocity[2]);
	return floatsqroot((fVelocity[0] * fVelocity[0]) + (fVelocity[1] * fVelocity[1]) + (fVelocity[2] * fVelocity[2])) * 100;
}
forward spam10(playerid);
public spam10(playerid)
{
    DeletePVar(playerid, "spam9");
    return 1;
}
forward spam15(playerid);
public spam15(playerid)
{
    DeletePVar(playerid, "spam20");
    return 1;
}
// 
//Anti Teleport
public OnPlayerTeleport(playerid, Float:distance)
{
	if (IsPlayerConnected(playerid)){
        if (PlayerInfo[playerid][pAdmin] == 2 && TeleP[playerid] != 1){
			new playerip[32], string[128];
		    GetPlayerIp(playerid, playerip, sizeof(playerip));
		    if(ReloadTime[playerid] < gettime())
	    	format(string,sizeof(string),"{AA3333}GOSAMP{FFFF00}: %s (ID: %d) Co The Dang Hack TeLePort By Laur. Nho Spec Ki Dung Voi Banned.",GetPlayerNameEx(playerid), playerid);
		    ReloadTime[playerid] = gettime()+5;
            ABroadCast(COLOR_YELLOW, string, 2);
		}
	}
	TeleP[playerid] = 0;
	return 1;
}
// Anti AFK-Ghost
