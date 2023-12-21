#include <YSI\y_hooks>

new bool:BaoTriRank;

CMD:huyghep(playerid)
{
	if (Duel_Accept[playerid] == true)
	{
	SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban da huy ghep thanh cong.");
	Duel_Accept[playerid] = false;
	}
	else SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Hien tai ban khong co ghep rank.");
return 1;
}

CMD:baotri(playerid)
{
	if (PlayerInfo[playerid][pAdmin] > 9998)
	{
	    if (BaoTriRank == false)
	    {
	        BaoTriRank = true;
	    	SendClientMessageEx(playerid, COLOR_GREY, "Ban da bat bao tri rank!.");
	    }
	    else
	    {
	        BaoTriRank = false;
	        SendClientMessageEx(playerid, COLOR_GREY, "Ban da tat bao tri rank!");
	    }
	}
	return 1;
}

CMD:gheprank(playerid, params[])
{
	if (BaoTriRank == true) return SendClientMessageEx(playerid, COLOR_GREY, "He thong rank dang duoc bao tri!");

	if(PlayerInfo[playerid][pPoints] <= -50) return SendClientMessageEx(playerid, COLOR_GREY, "He thong nghi ngo ban buff rank!.");
    if(GetPVarInt(playerid, "Injured") == 1 || PlayerCuffed[ playerid ] >= 1 || PlayerInfo[ playerid ][ pJailTime ] > 0 || PlayerInfo[playerid][pHospital] > 0)
    {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
        return 1;
    }
    if(PlayerCuffed[playerid] != 0)  return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban khong the lam dieu nay khi bi cong tay.");
    if(IsPlayerInAnyVehicle(playerid))  return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban dang o trong xe, ban khong the dau sung .");
    if(GetPVarInt(playerid, "IsInArena") >= 0) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban khong the lam dieu nay khi dang o dau truong!");
//    if(Duel_SQL[playerid] != -1) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban da co mot loi Rank khac dang thuc hien, hay '/huybo thachdau' de huy bo truoc khi su dung cau lenh.");
//    if(Duel_SQL[giveplayerid] != -1) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Nguoi choi nay dang co mot loi moi Rank khac, hay bao ho '/huybo thachdau' truoc khi su dung cau lenh.");
//    if(Duel_Start[giveplayerid]) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Nguoi choi nay dang o trong mot tran dau sung, khong the gui loi moi Rank.");
//    if(giveplayerid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang o trong mot tran dau sung, khong the gui loi moi Rank.");
    if(PlayerInfo[playerid][pUyTin] < 30) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban khong du uy tin de ghep rank.");
   	if (Duel_Accept[playerid] == true)  return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban dang ghep rank roi.");
   	if(Duel_Start[playerid] == true) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban dang trong tran khong the ghep duoc!");


    new string[128];

    Duel_Accept[playerid] = true;
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Bat dau ghep tran, vui long doi.");
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Neu ban muon huy ghep tran, /huyghep.");

	foreach(new i:Player)
	{
	    if(Duel_Accept[i] == true && i != playerid && GetPVarInt(playerid, "IsInArena") < 0 && GetPVarInt(playerid, "Injured") != 1)
	    {
  			format(string, sizeof(string), "[Rank]{FFFFFF}Ban da ghep rank thanh cong voi %s [Rank %s - Points : %d]", GetPlayerNameEx(i), GetRank(i), PlayerInfo[i][pPoints]);
	        SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
	        
  			format(string, sizeof(string), "[Rank]{FFFFFF}Ban da ghep rank thanh cong voi %s [Rank %s - Points : %d]", GetPlayerNameEx(playerid), GetRank(playerid), PlayerInfo[playerid][pPoints]);
	        SendClientMessageEx(i, COLOR_LIGHTRED, string);
	        
         	Duel_Target[playerid] = i, Duel_SQL[playerid] = GetPlayerSQLId(i), Duel_Weapon[playerid] = CheckWeapon();
        	Duel_Target[i] = playerid, Duel_SQL[i] = GetPlayerSQLId(playerid), Duel_Weapon[i] = Duel_Weapon[playerid];
        	AntiFarmRank[playerid] = i;
        	StartingDuel(playerid, i);
        	break;
	    }
	}


	return 1;
}






stock CheckWeapon()
{
	new weaponid;
	new randomweapon = random(3);
	if(randomweapon == 0) weaponid = 24; // Deagle
	else if(randomweapon == 1) weaponid = 31; // M4
	else if(randomweapon == 2) weaponid = 27; // Spas12
	else weaponid = 24;

	return weaponid;
}


stock GetRank(playerid)
{
	new rank[128];
	if(PlayerInfo[playerid][pPoints] >= 0 && PlayerInfo[playerid][pPoints] <= 100) format(rank, sizeof(rank), "Dong");
	else if(PlayerInfo[playerid][pPoints] > 100 && PlayerInfo[playerid][pPoints] <= 200) format(rank, sizeof(rank), "Bac");
	else if(PlayerInfo[playerid][pPoints] > 200 && PlayerInfo[playerid][pPoints] <= 300) format(rank, sizeof(rank), "Vang");
	else if(PlayerInfo[playerid][pPoints] > 300 && PlayerInfo[playerid][pPoints] <= 400) format(rank, sizeof(rank), "Bach Kim");
	else if(PlayerInfo[playerid][pPoints] > 400 && PlayerInfo[playerid][pPoints] <= 500) format(rank, sizeof(rank), "Kim cuong");
	else if(PlayerInfo[playerid][pPoints] > 500 && PlayerInfo[playerid][pPoints] <= 600) format(rank, sizeof(rank), "Thach Dau");

	return rank;
}




stock GetRankSQL(Pointss[])
{
	new rank[128];
	if(strval(Pointss) >= 0 && strval(Pointss) <= 100) format(rank, sizeof(rank), "Dong");
	else if(strval(Pointss) > 100 && strval(Pointss) <= 200) format(rank, sizeof(rank), "Bac");
	else if(strval(Pointss) > 200 && strval(Pointss) <= 300) format(rank, sizeof(rank), "Vang");
	else if(strval(Pointss) > 300 && strval(Pointss) <= 400) format(rank, sizeof(rank), "Bach Kim");
	else if(strval(Pointss) > 400 && strval(Pointss) <= 500) format(rank, sizeof(rank), "Kim cuong");
	else if(strval(Pointss) > 500 && strval(Pointss) <= 600) format(rank, sizeof(rank), "Thach Dau");

	return rank;
}




/*CMD:thachdau(playerid, params[])
{
    new giveplayerid, weapon_name[32], duel_money;

    if(sscanf(params, "us[32]i", giveplayerid, weapon_name, duel_money))
    {
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /thachdau [Player] [Vu khi] [Kim Cuong]");
        SendClientMessageEx(playerid, COLOR_GREY, "Vu khi: Deagle, M4, Shotgun, Spas12,Sniper,9MM,KATANA,Fist,Tec");
        //SendClientMessageEx(playerid, COLOR_GREY, "Thoi Gian Co The Thach Dau");
        //SendClientMessageEx(playerid, COLOR_GREY, "Vao Luc : 12h Trua Den 4h Chieu");
        return 1;
    }
    if(GetPVarInt(playerid, "Injured") == 1 || PlayerCuffed[ playerid ] >= 1 || PlayerInfo[ playerid ][ pJailTime ] > 0 || PlayerInfo[playerid][pHospital] > 0)
    {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
        return 1;
    }
	if(!GetPVarInt(playerid, "PinConfirmed"))
	{
  		PinLogin(playerid);
		return 1;
	}
    if(PlayerInfo[playerid][pKimCuong] < duel_money) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban Khong Du Kim Cuong De Yeu Cau ");
    if(PlayerInfo[giveplayerid][pKimCuong] < duel_money) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Nguoi Choi Do Khong Du Kim Cuong De Yeu Cau");
    if(duel_money < 1000) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Moi Luot Rank It Nhat 1.000 Kim Cuong");
    if(PlayerCuffed[playerid] != 0)  return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban khong the lam dieu nay khi bi cong tay.");
    if(IsPlayerInAnyVehicle(playerid))  return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban dang o trong xe, ban khong the dau sung .");
    if(GetPVarInt(playerid, "IsInArena") >= 0) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban khong the lam dieu nay khi dang o dau truong!");
    if(Duel_SQL[playerid] != -1) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Ban da co mot loi Rank khac dang thuc hien, hay '/huybo thachdau' de huy bo truoc khi su dung cau lenh.");
    if(Duel_SQL[giveplayerid] != -1) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Nguoi choi nay dang co mot loi moi Rank khac, hay bao ho '/huybo thachdau' truoc khi su dung cau lenh.");
    if(Duel_Start[giveplayerid]) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Rank]{FFFFFF}Nguoi choi nay dang o trong mot tran dau sung, khong the gui loi moi Rank.");
    if(giveplayerid == playerid) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang o trong mot tran dau sung, khong the gui loi moi Rank.");
    if(IsPlayerConnected(giveplayerid) && ProxDetectorS(5.0, playerid, giveplayerid))
    {
        new weaponid;

        if(PlayerInfo[playerid][pCredits] < duel_money) return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[Thach Dau]{FFFFFF}Ban khong co du Credits de gui loi moi thach dau.");
        if(duel_money > MAX_DUEL_MONEY)
        {
            new string[128];
            format(string, sizeof(string), "So kim cuong Dung De Thach Dau Khong Duoc Lon Hon %s kim cuong.", number_format(MAX_DUEL_MONEY));
            SendClientMessageEx(playerid, COLOR_GREY, string);
            return 1;
        }

        if(strcmp(weapon_name, "deagle", true) == 0) weaponid = 24;
        else if(strcmp(weapon_name, "m4", true) == 0) weaponid = 31;
        else if(strcmp(weapon_name, "shotgun", true) == 0) weaponid = 25;
        else if(strcmp(weapon_name, "spas12", true) == 0) weaponid = 27;
        // Them vu khi bang cach copy dong phia tren, viet ten va thay doi w
		else if(strcmp(weapon_name, "sniper", true) == 0) weaponid = 34;
		else if(strcmp(weapon_name, "9mm", true) == 0) weaponid = 22;
		else if(strcmp(weapon_name, "katana", true) == 0) weaponid = 8;
		else if(strcmp(weapon_name, "fist", true) == 0) weaponid = 1;
		else if(strcmp(weapon_name, "tec", true) == 0) weaponid = 32;
        // vi du: else if(strcmp(weapon_name, "ak47", true) == 0) weaponid = 30;
        else return SendClientMessageEx(playerid, COLOR_GREY, "Sai ten vu khi");

        Duel_Target[playerid] = giveplayerid, Duel_SQL[playerid] = GetPlayerSQLId(giveplayerid), Duel_Weapon[playerid] = weaponid, Duel_Money[playerid] = duel_money, Duel_Accept[playerid] = true;
        Duel_Target[giveplayerid] = playerid, Duel_SQL[giveplayerid] = GetPlayerSQLId(playerid), Duel_Weapon[giveplayerid] = weaponid, Duel_Money[giveplayerid] = duel_money, Duel_Accept[giveplayerid] = false;

        new string[128];
        format(string, sizeof(string), "* %s (%d) da gui loi thach dau loai vu khi %s voi so KC dat cuoc  la {AA3333}%s{33CCFF} KC.", GetPlayerNameEx(playerid), playerid, GetWeaponNameEx(weaponid), number_format(duel_money));
        SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
        SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, "/chapnhan thachdau' de bat dau,/huybo thachdau de huy bo.");

        format(string, sizeof(string), "* Da gui loi thach dau loai vu khi %s voi so KC dat cuoc  la {AA3333}%s{33CCFF} KC toi %s (%d).", GetWeaponNameEx(weaponid), number_format(duel_money), GetPlayerNameEx(giveplayerid), giveplayerid);
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    }
    else
    {
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Nguoi Do Khong o Gan Ban");
    }
    return 1;
}
*/


StartingDuel(playerid, targetid)
{
    if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;
    if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;
    if(Duel_Text[playerid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid, Duel_Text[playerid]), PlayerTextDrawDestroy(playerid, Duel_Text[playerid]), Duel_Text[playerid] = PlayerText:INVALID_TEXT_DRAW;
    if(Duel_Text[targetid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(targetid, Duel_Text[targetid]), PlayerTextDrawDestroy(targetid, Duel_Text[targetid]), Duel_Text[targetid] = PlayerText:INVALID_TEXT_DRAW;

    Duel_Text[playerid] = CreatePlayerTextDraw(playerid, 315.000000, 150.000000, "Tran_dau_se_bat_dau_sau~n~5s");
    PlayerTextDrawLetterSize(playerid, Duel_Text[playerid], 0.410000, 1.815703);
    PlayerTextDrawAlignment(playerid, Duel_Text[playerid], 2);
    PlayerTextDrawColor(playerid, Duel_Text[playerid], -1);
    PlayerTextDrawSetShadow(playerid, Duel_Text[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, Duel_Text[playerid], 255);
    PlayerTextDrawFont(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawSetProportional(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawSetShadow(playerid, Duel_Text[playerid], 0);
    PlayerTextDrawShow(playerid, Duel_Text[playerid]);

    Duel_Text[targetid] = CreatePlayerTextDraw(targetid, 315.000000, 150.000000, "Tran_dau_se_bat_dau_sau~n~5s");
    PlayerTextDrawLetterSize(targetid, Duel_Text[targetid], 0.410000, 1.815703);
    PlayerTextDrawAlignment(targetid, Duel_Text[targetid], 2);
    PlayerTextDrawColor(targetid, Duel_Text[targetid], -1);
    PlayerTextDrawSetShadow(targetid, Duel_Text[targetid], 0);
    PlayerTextDrawSetOutline(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawBackgroundColor(targetid, Duel_Text[targetid], 255);
    PlayerTextDrawFont(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawSetProportional(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawSetShadow(targetid, Duel_Text[targetid], 0);
    PlayerTextDrawShow(targetid, Duel_Text[targetid]);


    new Float:PosXs, Float:PosYs, Float:PosZs, Float:PosAs, Float:Health, Float:Armour;

    GetPlayerPos(playerid, PosXs, PosYs, PosZs), GetPlayerFacingAngle(playerid, PosAs);
    SetPVarFloat(playerid, "Duel_PosX", PosXs);
    SetPVarFloat(playerid, "Duel_PosY", PosYs);
    SetPVarFloat(playerid, "Duel_PosZ", PosZs);
    SetPVarFloat(playerid, "Duel_PosA", PosAs);
    SetPVarInt(playerid, "Duel_VW", GetPlayerVirtualWorld(playerid));
    SetPVarInt(playerid, "Duel_Int", GetPlayerInterior(playerid));
    GetPlayerHealth(playerid, Health);
    GetPlayerArmour(playerid, Armour);
    SetPVarFloat(playerid, "Duel_Health", Health);
    SetPVarFloat(playerid, "Duel_Armour", Armour);
    SetPVarInt(playerid, "Duel_Tick", GetTickCount());

    GetPlayerPos(targetid, PosXs, PosYs, PosZs), GetPlayerFacingAngle(targetid, PosAs);
    SetPVarFloat(targetid, "Duel_PosX", PosXs);
    SetPVarFloat(targetid, "Duel_PosY", PosYs);
    SetPVarFloat(targetid, "Duel_PosZ", PosZs);
    SetPVarFloat(targetid, "Duel_PosA", PosAs);
    SetPVarInt(targetid, "Duel_VW", GetPlayerVirtualWorld(targetid));
    SetPVarInt(targetid, "Duel_Int", GetPlayerInterior(targetid));
    GetPlayerHealth(targetid, Health);
    GetPlayerArmour(targetid, Armour);
    SetPVarFloat(targetid, "Duel_Health", Health);
    SetPVarFloat(targetid, "Duel_Armour", Armour);
    SetPVarInt(targetid, "Duel_Tick", GetTickCount());


    SetPlayerVirtualWorld(playerid, 999 + playerid), TogglePlayerControllable(playerid, false), SetPlayerHealth(playerid, 100.0), SetPlayerArmour(playerid, 100.0), ResetPlayerWeapons(playerid);
    SetPlayerVirtualWorld(targetid, 999 + playerid), TogglePlayerControllable(targetid, false), SetPlayerHealth(targetid, 100.0), SetPlayerArmour(targetid, 100.0), ResetPlayerWeapons(targetid);

    Duel_Weapon[playerid] = CheckWeapon();
    Duel_Weapon[targetid] = Duel_Weapon[playerid];

	new rand = random(sizeof(rRandomSpawnP1));
	new rRandomInt;
	
	if (rand ==0) rRandomInt = 1;
	else if (rand == 1) rRandomInt = 6;
	else if (rand == 2) rRandomInt =18;
	else if (rand == 3) rRandomInt = 3;
	else if (rand == 4) rRandomInt = 0;

	SetPlayerPos(playerid, rRandomSpawnP1[rand][0], rRandomSpawnP1[rand][1], rRandomSpawnP1[rand][2]);
	SetPlayerInterior(playerid, rRandomInt);
    Player_StreamPrep(playerid, rRandomSpawnP1[rand][0], rRandomSpawnP1[rand][1], rRandomSpawnP1[rand][2], FREEZE_TIME);
    SetPlayerFacingAngle(playerid, rRandomSpawnP1[rand][3]);

	SetPlayerPos(targetid, rRandomSpawnP2[rand][0], rRandomSpawnP2[rand][1], rRandomSpawnP2[rand][2]);
	SetPlayerInterior(targetid, rRandomInt);
    Player_StreamPrep(targetid, rRandomSpawnP2[rand][0], rRandomSpawnP2[rand][1], rRandomSpawnP2[rand][2], FREEZE_TIME);
    SetPlayerFacingAngle(targetid, rRandomSpawnP2[rand][3]);

    //new string[128];
    //GetPlayerPos(playerid, PosXs, PosYs, PosZs);
    //format(string, sizeof(string), "[Player] %s (X: %0.2f | Y: %0.2f | Z: %0.2f | VW: %d | Int: %d)", GetPlayerNameEx(playerid), PosXs, PosYs, PosZs, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    //SendClientMessageToAllEx(COLOR_GREY, string);
    //
    //GetPlayerPos(targetid, PosXs, PosYs, PosZs);
    //format(string, sizeof(string), "[Player] %s (X: %0.2f | Y: %0.2f | Z: %0.2f | VW: %d | Int: %d)", GetPlayerNameEx(targetid), PosXs, PosYs, PosZs, GetPlayerVirtualWorld(targetid), GetPlayerInterior(targetid));
    //SendClientMessageToAllEx(COLOR_GREY, string);

    Duel_Accept[playerid] = false, Duel_Accept[targetid] = false;
    Duel_Start[playerid] = true, Duel_Start[targetid] = true;
    SetPVarInt(playerid, "Duel_Start_Tick", 5), SetPVarInt(targetid, "Duel_Start_Tick", 5);

    Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    Duel_Timer[targetid] = SetTimerEx("DuelStart", 1000, false, "i", targetid);
}


StartingDuelRound(playerid, targetid)
{
    if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;
    if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;
    if(Duel_Text[playerid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid, Duel_Text[playerid]), PlayerTextDrawDestroy(playerid, Duel_Text[playerid]), Duel_Text[playerid] = PlayerText:INVALID_TEXT_DRAW;
    if(Duel_Text[targetid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(targetid, Duel_Text[targetid]), PlayerTextDrawDestroy(targetid, Duel_Text[targetid]), Duel_Text[targetid] = PlayerText:INVALID_TEXT_DRAW;

    Duel_Text[playerid] = CreatePlayerTextDraw(playerid, 315.000000, 150.000000, "Tran_dau_se_bat_dau_sau~n~5s");
    PlayerTextDrawLetterSize(playerid, Duel_Text[playerid], 0.410000, 1.815703);
    PlayerTextDrawAlignment(playerid, Duel_Text[playerid], 2);
    PlayerTextDrawColor(playerid, Duel_Text[playerid], -1);
    PlayerTextDrawSetShadow(playerid, Duel_Text[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, Duel_Text[playerid], 255);
    PlayerTextDrawFont(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawSetProportional(playerid, Duel_Text[playerid], 1);
    PlayerTextDrawSetShadow(playerid, Duel_Text[playerid], 0);
    PlayerTextDrawShow(playerid, Duel_Text[playerid]);

    Duel_Text[targetid] = CreatePlayerTextDraw(targetid, 315.000000, 150.000000, "Tran_dau_se_bat_dau_sau~n~5s");
    PlayerTextDrawLetterSize(targetid, Duel_Text[targetid], 0.410000, 1.815703);
    PlayerTextDrawAlignment(targetid, Duel_Text[targetid], 2);
    PlayerTextDrawColor(targetid, Duel_Text[targetid], -1);
    PlayerTextDrawSetShadow(targetid, Duel_Text[targetid], 0);
    PlayerTextDrawSetOutline(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawBackgroundColor(targetid, Duel_Text[targetid], 255);
    PlayerTextDrawFont(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawSetProportional(targetid, Duel_Text[targetid], 1);
    PlayerTextDrawSetShadow(targetid, Duel_Text[targetid], 0);
    PlayerTextDrawShow(targetid, Duel_Text[targetid]);

    SetPlayerVirtualWorld(playerid, 999 + playerid), TogglePlayerControllable(playerid, false), SetPlayerHealth(playerid, 100.0), SetPlayerArmour(playerid, 100.0), ResetPlayerWeapons(playerid);
    SetPlayerVirtualWorld(targetid, 999 + playerid), TogglePlayerControllable(targetid, false), SetPlayerHealth(targetid, 100.0), SetPlayerArmour(targetid, 100.0), ResetPlayerWeapons(targetid);

	new rand = random(sizeof(rRandomSpawnP1));
	new rRandomInt;
	
	
 	Duel_Weapon[playerid] = CheckWeapon();
    Duel_Weapon[targetid] = Duel_Weapon[playerid];

	
	if (rand == 0) rRandomInt = 1;
	else if (rand == 1) rRandomInt = 6;
	else if (rand == 2) rRandomInt =18;
	else if (rand == 3) rRandomInt = 3;
	else if (rand == 4) rRandomInt = 0;

	SetPlayerPos(playerid, rRandomSpawnP1[rand][0], rRandomSpawnP1[rand][1], rRandomSpawnP1[rand][2]);
	SetPlayerInterior(playerid, rRandomInt);
    Player_StreamPrep(playerid, rRandomSpawnP1[rand][0], rRandomSpawnP1[rand][1], rRandomSpawnP1[rand][2], FREEZE_TIME);
    SetPlayerFacingAngle(playerid, rRandomSpawnP1[rand][3]);

	SetPlayerPos(targetid, rRandomSpawnP2[rand][0], rRandomSpawnP2[rand][1], rRandomSpawnP2[rand][2]);
	SetPlayerInterior(targetid, rRandomInt);
    Player_StreamPrep(targetid, rRandomSpawnP2[rand][0], rRandomSpawnP2[rand][1], rRandomSpawnP2[rand][2], FREEZE_TIME);
    SetPlayerFacingAngle(targetid, rRandomSpawnP2[rand][3]);

    SetPVarInt(playerid, "Duel_Start_Tick", 5), SetPVarInt(targetid, "Duel_Start_Tick", 5);

    Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    Duel_Timer[targetid] = SetTimerEx("DuelStart", 1000, false, "i", targetid);
}

forward DuelStartAgain(playerid,targetid);
public DuelStartAgain(playerid,targetid)
{
//	KillEMSQueue(playerid);
//	ClearAnimations(playerid);
//	SetPlayerHealth(playerid, 100);
    StartingDuelRound(playerid, targetid);
}



forward DuelStart(playerid);
public DuelStart(playerid)
{
    if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;

    if(GetPVarInt(playerid, "Duel_Start_Tick") > 0)
    {
        SetPVarInt(playerid, "Duel_Start_Tick", GetPVarInt(playerid, "Duel_Start_Tick") - 1);

        new string[128];
        format(string, sizeof(string), "Tran dau se bat dau sau~n~%ds", GetPVarInt(playerid, "Duel_Start_Tick"));
        PlayerTextDrawSetString(playerid, Duel_Text[playerid], string);
        PlayerTextDrawShow(playerid, Duel_Text[playerid]);

        Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    }
    else if(GetPVarInt(playerid, "Duel_Start_Tick") == 0)
    {
        SetPVarInt(playerid, "Duel_Start_Tick", -1);

        PlayerTextDrawSetString(playerid, Duel_Text[playerid], "~r~Tran dau bat dau");
        PlayerTextDrawShow(playerid, Duel_Text[playerid]);


        GivePlayerWeapon(playerid, Duel_Weapon[playerid], 9999);
        TogglePlayerControllable(playerid, true);

        Duel_Timer[playerid] = SetTimerEx("DuelStart", 1000, false, "i", playerid);
    }
    else if(GetPVarInt(playerid, "Duel_Start_Tick") == -1)
    {
        if(Duel_Text[playerid] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawHide(playerid, Duel_Text[playerid]), PlayerTextDrawDestroy(playerid, Duel_Text[playerid]), Duel_Text[playerid] = PlayerText:INVALID_TEXT_DRAW;

        DeletePVar(playerid, "Duel_Start_Tick");
    }
}



hook OnPlayerConnect(playerid)
{
    Duel_Target[playerid] = INVALID_PLAYER_ID;
    Duel_SQL[playerid] = -1;
    Duel_Weapon[playerid] = 0;
    Duel_Money[playerid] = 0;
    Duel_Start[playerid] = false;
    Duel_Accept[playerid] = false;
    Duel_Timer[playerid] = -1;
    Duel_Win[playerid] =0;
    Duel_Round[playerid] =0;
    AntiFarmRank[playerid] = -1;
    
    return 1;
}


hook OnPlayerDisconnect(playerid, reason)
{
	if(Duel_Accept[playerid])
	{
		if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;

		new targetid = Duel_Target[playerid];

		if(IsPlayerConnected(targetid) && GetPlayerSQLId(targetid) == Duel_SQL[playerid])
		{
                if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;

                new string[128];
                format(string, sizeof(string), "%s da thoat khoi may chu, tran dau bi huy bo.", GetPlayerNameEx(playerid));
                SendClientMessageEx(targetid, COLOR_GREY, string);

                Duel_Target[targetid] = INVALID_PLAYER_ID;
                Duel_SQL[targetid] = -1;
                Duel_Weapon[targetid] = 0;
                Duel_Money[targetid] = 0;
                Duel_Start[targetid] = false;
                Duel_Accept[targetid] = false;
                Duel_Timer[targetid] = -1;
                Duel_Win[targetid] =0;
        		Duel_Round[targetid] =0;

            //    PlayerInfo[playerid][pUyTin] -=5;
            }
        }

	if(Duel_Start[playerid])
	{
		if(Duel_Timer[playerid] != -1) KillTimer(Duel_Timer[playerid]), Duel_Timer[playerid] = -1;

		SetPlayerPos(playerid, GetPVarFloat(playerid, "Duel_PosX"), GetPVarFloat(playerid, "Duel_PosY"), GetPVarFloat(playerid, "Duel_PosZ"));
		SetPlayerFacingAngle(playerid, GetPVarFloat(playerid, "Duel_PosA"));

		if(GetPVarInt(playerid, "Duel_VW") > 0)
		{
                Player_StreamPrep(playerid, GetPVarFloat(playerid, "Duel_PosX"), GetPVarFloat(playerid, "Duel_PosY"), GetPVarFloat(playerid, "Duel_PosZ"), FREEZE_TIME);
		}

		SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "Duel_VW"));
		SetPlayerInterior(playerid, GetPVarInt(playerid, "Duel_Int"));

		SetPlayerHealth(playerid, GetPVarFloat(playerid, "Duel_Health"));

		if(GetPVarFloat(playerid, "Duel_Armour") > 0.0) SetPlayerArmour(playerid, GetPVarFloat(playerid, "Duel_Armour"));

		new targetid = Duel_Target[playerid];
		if(IsPlayerConnected(targetid) && GetPlayerSQLId(targetid) == Duel_SQL[playerid])
		{
            if(Duel_Timer[targetid] != -1) KillTimer(Duel_Timer[targetid]), Duel_Timer[targetid] = -1;

            new string[128];
            format(string, sizeof(string), "%s da thoat khoi may chu, tran dau bi huy bo.", GetPlayerNameEx(playerid));
            SendClientMessageEx(targetid, COLOR_GREY, string);
            format(string, sizeof(string), "[Rank]{FFFFFF}Nguoi choi se bi tru 5 diem uy tin vi thoat khoi may chu!", GetPlayerNameEx(playerid));
        	SendClientMessageEx(targetid, COLOR_LIGHTBLUE, string);

            Duel_Target[targetid] = INVALID_PLAYER_ID;
            Duel_SQL[targetid] = -1;
            Duel_Weapon[targetid] = 0;
            Duel_Money[targetid] = 0;
            Duel_Start[targetid] = false;
            Duel_Accept[targetid] = false;
            Duel_Win[targetid] =0;
			Duel_Round[targetid] =0;
			

			
           PlayerInfo[playerid][pUyTin] -= 5;

            SetPlayerPos(targetid, GetPVarFloat(targetid, "Duel_PosX"), GetPVarFloat(targetid, "Duel_PosY"), GetPVarFloat(targetid, "Duel_PosZ"));
            SetPlayerFacingAngle(targetid, GetPVarFloat(targetid, "Duel_PosA"));

            if(GetPVarInt(targetid, "Duel_VW") > 0)
            {
                    Player_StreamPrep(targetid, GetPVarFloat(targetid, "Duel_PosX"), GetPVarFloat(targetid, "Duel_PosY"), GetPVarFloat(targetid, "Duel_PosZ"), FREEZE_TIME);
            }

            SetPlayerVirtualWorld(targetid, GetPVarInt(targetid, "Duel_VW"));
            SetPlayerInterior(targetid, GetPVarInt(targetid, "Duel_Int"));

            SetPlayerHealth(targetid, GetPVarFloat(targetid, "Duel_Health"));

            if(GetPVarFloat(targetid, "Duel_Armour") > 0.0) SetPlayerArmour(targetid, GetPVarFloat(targetid, "Duel_Armour"));

            DeletePVar(targetid, "Duel_PosX");
            DeletePVar(targetid, "Duel_PosY");
            DeletePVar(targetid, "Duel_PosZ");
            DeletePVar(targetid, "Duel_PosA");
            DeletePVar(targetid, "Duel_VW");
            DeletePVar(targetid, "Duel_Int");

            Duel_Target[targetid] = INVALID_PLAYER_ID;
            Duel_SQL[targetid] = -1;
            Duel_Weapon[targetid] = 0;
            Duel_Money[targetid] = 0;
            Duel_Start[targetid] = false;
            Duel_Accept[targetid] = false;
            Duel_Timer[targetid] = -1;
            Duel_Timer[targetid] = -1;
            Duel_Win[targetid] =0;
			Duel_Round[targetid] =0;

            SetPlayerWeapons(targetid);
		}
	}
	return 1;
}


