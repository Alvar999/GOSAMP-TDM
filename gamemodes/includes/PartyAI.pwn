// HE THONG DANH BOSS
// FARM : CREDITS / EXP
//_____________________________________________________________________________//

#include <YSI\y_hooks>

#define         PartyAI         (6027)

new ThamGiaRoom1[MAX_PLAYERS];
new PartyAI_1; // BOSS ROOM 1
new PartyRoom1, PartyRoom2, PartyRoom3, PartyRoom4, PartyRoom5;

CMD:xemparty(playerid, params[])
{
    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], str5[1280], str6[1280], str7[1280], name[1280];
	format(str1, sizeof(str), "_____________________________________________________________________", GetPlayerNameEx(playerid));
    format(str2, sizeof(str), "PHONG 1 : %d / 5 | PHAN THUONG : {00ff00}EXP{FFFFFF} / {00ffff}CREDITS{FFFFFF}", PartyRoom1);
    format(str3, sizeof(str), "PHONG 2 : %d / 5 | PHAN THUONG : {00ff00}EXP{FFFFFF} / {00ffff}CREDITS{FFFFFF}", PartyRoom2);
    format(str4, sizeof(str), "PHONG 3 : %d / 5 | PHAN THUONG : {00ff00}EXP{FFFFFF} / {00ffff}CREDITS{FFFFFF}", PartyRoom3);
    format(str5, sizeof(str), "PHONG 4 : %d / 5 | PHAN THUONG : {00ff00}EXP{FFFFFF} / {00ffff}CREDITS{FFFFFF}", PartyRoom4);
    format(str6, sizeof(str), "PHONG 5 : %d / 5 | PHAN THUONG : {00ff00}EXP{FFFFFF} / {00ffff}CREDITS{FFFFFF}", PartyRoom5);
    format(str7, sizeof(str), "_____________________________________________________________________");
    format(str, sizeof(str), "%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s", str1,str2,str3,str4,str5,str6,str7);
    format(name, sizeof(name), "HE THONG DANH BOSS");
	ShowPlayerDialog(playerid, PartyAI, DIALOG_STYLE_LIST, name, str, "Tham gia", "Huy bo");
	return 1;
}

hook OnPlayerConnect(playerid)
{
    PartyAI_1 = CreateObject(3528, 1827.786987, -1589.626831, 15.678555, 0.000000, 0.000000, 87.300048, 300.00);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    DisConnectParty(playerid);
	return 1;
}

hook OnPlayerUpdate(playerid)
{
    ThongBaoThamGia(playerid);
	return 1;
}

//____________________________________________________________________________//
stock DisConnectParty(playerid)
{
	if(ThamGiaRoom1[playerid] == 1)
	{
	    ThamGiaRoom1[playerid] = 0;
	    PartyRoom1 -= 1;
	    ResetPlayerWeapons(playerid);
	    return 1;
	}
	return 1;
}
stock ThongBaoThamGia(playerid)
{
	if(ThamGiaRoom1[playerid] == 1)
    {
        new string[1280];
        format(string, sizeof(string), "[THONG BAO] Mot nguoi nao do, da tham gia vao he thong party (( ROOM 1 )) | Thanh Vien : %d / 5", PartyRoom1);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		return 1;
    }
    return 1;
}

stock BatDauRoom1()
{
    new string[1280];
	if(PartyRoom1 == 5)
	{
	    for(new i = 0; i < MAX_PLAYERS; i++)
	    {
			if(ThamGiaRoom1[i] == 1)
			{
			    format(string, sizeof(string), "[THONG BAO] Party (( ROOM 1 )) chung bi bat dau trong vong 60s hay san sang");
				SendClientMessageEx(i, COLOR_YELLOW, string);
				
				SetPVarInt(i, "Party_TimeR1", 60);
				SetTimerEx("Party_Room1", 1000, 0, "d", i);
				return 1;
			}
			return 1;
		}
	    return 1;
	}
	return 1;
}

forward Party_Room1(playerid);
public Party_Room1(playerid)
{
    SetPVarInt(playerid, "Party_TimeR1", GetPVarInt(playerid, "Party_TimeR1")-1);

    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "Party_TimeR1"));
    GameTextForPlayer(playerid, string, 1100, 3);
    ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0,1);
    if(GetPVarInt(playerid, "Party_TimeR1") > 0) SetTimerEx("Party_Room1", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "Party_TimeR1") == 5)
    {
        SendClientMessageEx(playerid, COLOR_GRAD2, "-> Quai vat chung bi xuat hien...");
    }

    if(GetPVarInt(playerid, "Party_TimeR1") <= 0)
    {
        DeletePVar(playerid, "Party_TimeR1");
        DeletePVar(playerid, "Party_Room1");

        TogglePlayerControllable(playerid, 1);
        ClearAnimations(playerid);
        
        PartyAI_1 = CreateObject(3528, 1827.786987, -1589.626831, 15.678555, 0.000000, 0.000000, 87.300048, 300.00);
        return 1;
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == PartyAI)
	{
	    if(response)
	    {
	        if(listitem == 1) // ROOM 1
		    {
		        if(ThamGiaRoom1[playerid] == 0)
		        {
			        if(PartyRoom1 <= 5)
			        {
			            PartyRoom1 += 1;
			            ThamGiaRoom1[playerid] = 1;
			            SetPlayerPos(playerid, 1306.3932,268.5187,19.5547);
						SetPlayerFacingAngle(playerid, 65.8813);
						SetPlayerVirtualWorld(playerid, 5); // The Gioi Ao ID : 5
			            SendClientMessageEx(playerid, COLOR_GRAD2, "[ROOM 1] Ban da tham gia thanh cong , hay chung bi san sang chien dau.");
			            return 1;
			        }else SendClientMessageEx(playerid, COLOR_GRAD2, "[ROOM 1] Hien tai dang day, vui long doi.");
		        }else SendClientMessageEx(playerid, COLOR_GRAD2, "[ROOM 1] Ban da tham gia mot party roi , khong the tiep tuc.");
		    }
	    }
	}
	return 1;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(hittype == 3) { // Object type
        new
            objectId = hitid;

        if(PartyAI_1 == objectId) {
            GameTextForPlayer(playerid, "KILL BOSS", 5000, 2);

        }
    }
    return 1;
}
