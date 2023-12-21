#include <a_samp>
#include <YSI\y_hooks>

#define	DIALOG_DAMAGE 1927
#define	MAX_DAMAGES	1000


enum {
	BODY_PART_TORSO =  3,
	BODY_PART_GROIN,
	BODY_PART_RIGHT_ARM,
	BODY_PART_LEFT_ARM,
	BODY_PART_RIGHT_LEG,
	BODY_PART_LEFT_LEG,
	BODY_PART_HEAD
}

GetBodypartName(bodypart)
{
	new bodyname[11];
	switch(bodypart)
	{
		case BODY_PART_TORSO: bodyname = "Than";
		case BODY_PART_GROIN: bodyname = "Hang";
		case BODY_PART_RIGHT_ARM: bodyname = "Tay phai";
		case BODY_PART_LEFT_ARM: bodyname = "Tay trai";
		case BODY_PART_RIGHT_LEG: bodyname = "Chan phai";
		case BODY_PART_LEFT_LEG: bodyname = "Chan trai";
		case BODY_PART_HEAD: bodyname = "Dau";
		default: bodyname = "Null";
	}
	return bodyname;
}

enum dmgInfo
{
	dmgName[128],
	dmgDamage,
	dmgWeapon,
	dmgBodypart,
	dmgKevlarhit,
	dmgSeconds,
	dmgViTri,
	Float:dmgKhoangcach,
	
	dmgName_2[128],
	dmgDamage_2,
	dmgWeapon_2,
	dmgBodypart_2,
	dmgKevlarhit_2,
	dmgSeconds_2,
	dmgViTri_2,
	Float:dmgKhoangcach_2,
	
}

new DamageInfo[MAX_PLAYERS][MAX_DAMAGES][dmgInfo];

CMD:checkdame(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new id;
		if(sscanf(params, "u", id))
			return SendClientMessage(playerid, -1, "{ffffff}USAGE: /satthuong [playerid]");

		if(IsPlayerConnected(id))
			ShowPlayerDamages(id, playerid);
		else
        	SendClientMessage(playerid, -1, "Nguoi nay hien khong ton tai.");
	}
	return 1;
}

CMD:satthuong(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new id;
		if(sscanf(params, "u", id))
			return SendClientMessage(playerid, -1, "{ffffff}USAGE: /satthuong [playerid]");

		if(IsPlayerConnected(id)) {
		    DeletePVar(playerid, "_dCheck");
			ShowPlayerDamages(id, playerid);
			SetPVarInt(playerid, "_dCheck", id);
		}
		else
        	SendClientMessage(playerid, -1, "Nguoi nay hien khong ton tai.");
	}
	else{
	    ShowPlayerDamages(playerid, playerid);
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	ResetPlayerDamages(playerid);
	return 1;
}

ResetPlayerDamages(playerid)
{
	for(new id = 0; id < MAX_DAMAGES; id++)
	{
		if(DamageInfo[playerid][id][dmgDamage] != 0)
		{
		    DamageInfo[playerid][id][dmgName] = 0;
			DamageInfo[playerid][id][dmgDamage] = 0;
			DamageInfo[playerid][id][dmgWeapon] = 0;
			DamageInfo[playerid][id][dmgViTri] = 0;
			DamageInfo[playerid][id][dmgBodypart] = 0;
			DamageInfo[playerid][id][dmgKevlarhit] = 0;
			DamageInfo[playerid][id][dmgSeconds] = 0;
			DamageInfo[playerid][id][dmgKhoangcach] = 0;
			
			DamageInfo[playerid][id][dmgName_2] = 0;
			DamageInfo[playerid][id][dmgDamage_2] = 0;
			DamageInfo[playerid][id][dmgWeapon_2] = 0;
			DamageInfo[playerid][id][dmgViTri_2] = 0;
			DamageInfo[playerid][id][dmgBodypart_2] = 0;
			DamageInfo[playerid][id][dmgKevlarhit_2] = 0;
			DamageInfo[playerid][id][dmgSeconds_2] = 0;
			DamageInfo[playerid][id][dmgKhoangcach_2] = 0;
		}
	}
	return 1;
}

ShowPlayerDamages(playerid, toid)
{
	new str[5000], str1[5000], count = 0, name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	for(new id = 0; id < MAX_DAMAGES; id++)
	{
		if(DamageInfo[playerid][id][dmgDamage] != 0) count++;
	}

	if(count == 0) return ShowPlayerDialog(toid, DIALOG_DAMAGE, DIALOG_STYLE_LIST, name, "Hien tai nguoi nay chua bi ai gay xac thuong het", "Dong y", "");
	else if(count > 0)
	{
		for(new id = 0; id < MAX_DAMAGES; id++)
		{
			if(DamageInfo[playerid][id][dmgDamage] != 0)
			{
				format(str1, sizeof str1, "{ffffff}(%d) (%s) da su dung [%s] gay %d dmg (%0.2fm) | (vi tri : %s) cho (%s) (Time : %ds)\n",
				    id,
				    DamageInfo[playerid][id][dmgName],
				    GetWeaponNameEx(DamageInfo[playerid][id][dmgWeapon]),
					DamageInfo[playerid][id][dmgDamage],
					DamageInfo[playerid][id][dmgKhoangcach],
					GetBodypartName(DamageInfo[playerid][id][dmgViTri]),
					GetPlayerNameEx(playerid),
					DamageInfo[playerid][id][dmgKevlarhit], gettime() - DamageInfo[playerid][id][dmgSeconds]
				);
				strcat(str, str1);
			}
		}
		ShowPlayerDialog(toid, DIALOG_DAMAGE, DIALOG_STYLE_LIST, name, str, "Dong", "");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if (dialogid == DIALOG_DAMAGE) {
		if (response || !response)
			return 1;
	}
	return 1;
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart){
	return 1;
}
