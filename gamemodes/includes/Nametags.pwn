#include <a_samp>
#include <YSI\y_hooks>

	//-------------------------------------------------------------------
	//					Project create by #nDP 						   //
	//					Fb.com/nguyenduyphuong.com  			       //
	//					Copyright by nDP" 							   //
	//-------------------------------------------------------------------

//____________________________________________________________________________//



#include <a_samp>
#include <YSI\y_hooks>

#define NT_DISTANCE 700.0 // Nametag render distance

new Text3D:cNametag[MAX_PLAYERS];

stock GetHealthDots(playerid)
{
	new dots[64];
	new Float:HP;

	GetPlayerHealth(playerid, HP);

	if(HP == 100)
		dots = "••••••••••";
	else if(HP >= 90 && HP < 100)
		dots = "•••••••••{660000}•";
	else if(HP >= 80 && HP < 90)
		dots = "••••••••{660000}••";
	else if(HP >= 70 && HP < 80)
		dots = "•••••••{660000}•••";
	else if(HP >= 60 && HP < 70)
		dots = "••••••{660000}••••";
	else if(HP >= 50 && HP < 60)
		dots = "•••••{660000}•••••";
	else if(HP >= 40 && HP < 50)
		dots = "••••{660000}••••••";
	else if(HP >= 30 && HP < 40)
		dots = "•••{660000}•••••••";
	else if(HP >= 20 && HP < 30)
		dots = "••{660000}••••••••";
	else if(HP >= 10 && HP < 20)
		dots = "••{660000}••••••••";
	else if(HP >= 0 && HP < 10)
		dots = "{660000}••••••••••";

	return dots;
}
stock GetArmorDots(playerid)
{
	new dots[64];
	new Float:AR;

	GetPlayerArmour(playerid, AR);

	if(AR == 100)
		dots = "••••••••••";
	else if(AR >= 90 && AR < 100)
		dots = "•••••••••{666666}•";
	else if(AR >= 80 && AR < 90)
		dots = "••••••••{666666}••";
	else if(AR >= 70 && AR < 80)
		dots = "•••••••{666666}•••";
	else if(AR >= 60 && AR < 70)
		dots = "••••••{666666}••••";
	else if(AR >= 50 && AR < 60)
		dots = "•••••{666666}•••••";
	else if(AR >= 40 && AR < 50)
		dots = "••••{666666}••••••";
	else if(AR >= 30 && AR < 40)
		dots = "•••{666666}•••••••";
	else if(AR >= 20 && AR < 30)
		dots = "••{666666}••••••••";
	else if(AR >= 10 && AR < 20)
		dots = "••{666666}••••••••";
	else if(AR >= 0 && AR < 10)
		dots = "{666666}••••••••••";

	return dots;
}

hook OnPlayerConnect(playerid) {
	cNametag[playerid] = CreateDynamic3DTextLabel("Loading nametag...", 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 0);
	return 1;
}
hook OnPlayerDisconnect(playerid) {
    DestroyDynamic3DTextLabel(cNametag[playerid]);
    return 1;
}

/*hook OnPlayerUpdate(playerid) {
	UpdateNametag();
}*/

task UpdateNametag[500]()
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(IsPlayerConnected(i))
		{
		    new iGroupID = PlayerInfo[i][pMember];
		    
			new nametag[128], playername[MAX_PLAYER_NAME], Float:armour;
			GetPlayerArmour(i, armour);
			GetPlayerName(i, playername, sizeof(playername));
			if(armour > 1.0)
			{
			    if(GetPVarInt(i, "Injured") == 0) {
                    if(PlayerInfo[i][pMember] > 0) {
                        format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s - {FF0000}%s\n{%s}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i), Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                    }
                    else format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s - {FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i));
				}
			}
			else
			{
			    if(GetPVarInt(i, "Injured") == 0) {
                    if(PlayerInfo[i][pMember] > 0) {
                        format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FF0000}%s\n{%s}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i), Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
                    }
                    else format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i));
				}
			}
			UpdateDynamic3DTextLabelText(cNametag[i], 0xFFFFFFFF, nametag);
		}
	}
}

/*stock UpdateNametag(i)
{
    new iGroupID = PlayerInfo[i][pMember];
	new nametag[128], playername[MAX_PLAYER_NAME], Float:armour;
	GetPlayerArmour(i, armour);
	GetPlayerName(i, playername, sizeof(playername));
	if(armour > 1.0)
	{
	    if(GetPVarInt(i, "Injured") == 0) {
            if(PlayerInfo[i][pMember] > 0) {
                format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s - {FF0000}%s\n{%s}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i), Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
            }
            else format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s - {FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i));
		}
	}
	else
	{
	    if(GetPVarInt(i, "Injured") == 0) {
            if(PlayerInfo[i][pMember] > 0) {
                format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FF0000}%s\n{%s}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i), Group_NumToDialogHex(arrGroupData[iGroupID][g_hDutyColour]), arrGroupData[iGroupID][g_szGroupName]);
            }
            else format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i));
		}
	}
	UpdateDynamic3DTextLabelText(cNametag[i], 0xFFFFFFFF, nametag);
}*/

/*hook OnPlayerUpdate(playerid) {
    if(GetPVarInt(playerid, "Injured") == 0) {
    	UpdateNametag(playerid);
	}
}*/

/*forward UpdateAllNametag();
public UpdateAllNametag()
{
    foreach(new playerid: Player) {
        if(IsPlayerConnected(playerid)) {
	        if(GetPVarInt(playerid, "Injured") == 0) {
	        	UpdateNametag(playerid);
			}
		}
    }
}*/
