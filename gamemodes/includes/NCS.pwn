// System - NANG CAP SUNG
#pragma disablerecursion
#include "ysi\y_hooks"


#define MAX_LEVELGUN 8

stock GetLevelGun(level)
{
	new name[82];
	switch(level)
	{
		case 0: name = "{FFD700}Binh Thuong{FFFFFF}";
		case 1: name = "{FFD700}Bloody Satan{FFFFFF}";
		case 2: name = "{FFD700}Bloody Gold{FFFFFF}";
		case 3: name = "{FFD700}Bloody Nitro{FFFFFF}";
		case 4: name = "{FFD700}Unique{FFFFFF}";
		case 5: name = "{FFD700}Super Unique{FFFFFF}";
		case 6: name = "{FFD700}Mystic{FFFFFF}";
 		case 7: name = "{FFD700}Toi Thuong{FFFFFF}";
		case 8: name = "{FFD700}Sieu Toi Thuong{FFFFFF}";
		case 9: name = "{FFD700}LEGENDARY{FFFFFF}";
		case 10: name = "{FFD700}SMB-TDM{ffffff}";
	}
	return name;
}

SendDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if(GetPVarInt(damagedid, "IsInArena") >= 0) return 1;

	new Float:TotalDamage, Float:Health, Float:Armor;
   	new PlayerVar;

   	new Float:Crits[MAX_PLAYERS];
	Crits[playerid] = GetDistanceBetweenPlayers(damagedid, playerid);
   	if(weaponid == 24)
   	{
   		PlayerVar = PlayerInfo[playerid][pDeagle];
   		if(Crits[playerid] > 8)
   		{
   		    new crit_deagle = random(100);
   		    switch(crit_deagle)
   		    {
   		        case 0..84:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 36.00;
					if(PlayerVar == 1) TotalDamage = 37.00;
					if(PlayerVar == 2) TotalDamage = 38;
					if(PlayerVar == 3) TotalDamage = 39.00;
					if(PlayerVar == 4) TotalDamage = 40.00;
					if(PlayerVar == 5) TotalDamage = 41.00;
					if(PlayerVar == 6) TotalDamage = 42.00;
					if(PlayerVar == 7) TotalDamage = 43.00;
					if(PlayerVar == 8) TotalDamage = 44.00;
					if(PlayerVar == 9) TotalDamage = 45.00;
					if(PlayerVar == 10) TotalDamage = 46.00;
					if(PlayerVar == 11) TotalDamage = 47.00;
					if(PlayerVar == 12) TotalDamage = 48.54;
				}
				case 85..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 36.84;
					if(PlayerVar == 1) TotalDamage = 37.00;
					if(PlayerVar == 2) TotalDamage = 38.00;
					if(PlayerVar == 3) TotalDamage = 39.25;
					if(PlayerVar == 4) TotalDamage = 40.50;
					if(PlayerVar == 5) TotalDamage = 41.90;
					if(PlayerVar == 6) TotalDamage = 42.10;
					if(PlayerVar == 7) TotalDamage = 43.20;
					if(PlayerVar == 8) TotalDamage = 44.50;
					if(PlayerVar == 9) TotalDamage = 45.90;
					if(PlayerVar == 10) TotalDamage = 46.52;
					if(PlayerVar == 11) TotalDamage = 47.52;
					if(PlayerVar == 12) TotalDamage = 48.54;
				}
			}
		}
		else
		{
		    new crit_deagle = random(100);
   		    switch(crit_deagle)
   		    {
   		        case 0..87:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 36.84;
					if(PlayerVar == 1) TotalDamage = 37.00;
					if(PlayerVar == 2) TotalDamage = 38.00;
					if(PlayerVar == 3) TotalDamage = 39.25;
					if(PlayerVar == 4) TotalDamage = 40.50;
					if(PlayerVar == 5) TotalDamage = 41.90;
					if(PlayerVar == 6) TotalDamage = 42.10;
					if(PlayerVar == 7) TotalDamage = 43.20;
					if(PlayerVar == 8) TotalDamage = 44.50;
					if(PlayerVar == 9) TotalDamage = 45.90;
					if(PlayerVar == 10) TotalDamage = 46.52;
					if(PlayerVar == 11) TotalDamage = 47.52;
					if(PlayerVar == 12) TotalDamage = 48.54;
				}
				case 88..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 36.84;
					if(PlayerVar == 1) TotalDamage = 37.00;
					if(PlayerVar == 2) TotalDamage = 38.00;
					if(PlayerVar == 3) TotalDamage = 39.25;
					if(PlayerVar == 4) TotalDamage = 40.50;
					if(PlayerVar == 5) TotalDamage = 41.90;
					if(PlayerVar == 6) TotalDamage = 42.10;
					if(PlayerVar == 7) TotalDamage = 43.20;
					if(PlayerVar == 8) TotalDamage = 44.50;
					if(PlayerVar == 9) TotalDamage = 45.90;
					if(PlayerVar == 10) TotalDamage = 46.52;
					if(PlayerVar == 11) TotalDamage = 47.52;
					if(PlayerVar == 12) TotalDamage = 48.54;
				}
			}
		}
   	}
  	else if(weaponid == 34)
   	{
   		PlayerVar = PlayerInfo[playerid][pSniper];
   		if(Crits[playerid] > 8)
   		{
   		    new crit_sniper = random(100);
   		    switch(crit_sniper)
   		    {
   		        case 0..85:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 38.21;
					if(PlayerVar == 1) TotalDamage = 39.18;
					if(PlayerVar == 2) TotalDamage = 40.48;
					if(PlayerVar == 3) TotalDamage = 41.36;
					if(PlayerVar == 4) TotalDamage = 42.44;
					if(PlayerVar == 5) TotalDamage = 43.49;
					if(PlayerVar == 6) TotalDamage = 44.65;
					if(PlayerVar == 7) TotalDamage = 45.86;
					if(PlayerVar == 8) TotalDamage = 46.25;
					if(PlayerVar == 9) TotalDamage = 50.86;
					if(PlayerVar == 10) TotalDamage = 51.52;
					if(PlayerVar == 11) TotalDamage = 52.42;
					if(PlayerVar == 12) TotalDamage = 53.54;

				}
				case 86..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 38.21;
					if(PlayerVar == 1) TotalDamage = 39.18;
					if(PlayerVar == 2) TotalDamage = 40.48;
					if(PlayerVar == 3) TotalDamage = 41.36;
					if(PlayerVar == 4) TotalDamage = 42.44;
					if(PlayerVar == 5) TotalDamage = 43.49;
					if(PlayerVar == 6) TotalDamage = 44.65;
					if(PlayerVar == 7) TotalDamage = 45.86;
					if(PlayerVar == 8) TotalDamage = 46.25;
					if(PlayerVar == 9) TotalDamage = 50.86;
					if(PlayerVar == 10) TotalDamage = 51.52;
					if(PlayerVar == 11) TotalDamage = 52.42;
					if(PlayerVar == 12) TotalDamage = 53.54;
				}
			}
		}
		else
		{
		    new crit_sniper = random(100);
   		    switch(crit_sniper)
   		    {
   		        case 0..81:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 35.21;
					if(PlayerVar == 1) TotalDamage = 41.18;
					if(PlayerVar == 2) TotalDamage = 43.48;
					if(PlayerVar == 3) TotalDamage = 44.36;
					if(PlayerVar == 4) TotalDamage = 45.44;
					if(PlayerVar == 5) TotalDamage = 46.49;
					if(PlayerVar == 6) TotalDamage = 47.65;
					if(PlayerVar == 7) TotalDamage = 48.86;
					if(PlayerVar == 8) TotalDamage = 49.25;
					if(PlayerVar == 9) TotalDamage = 50.86;
					if(PlayerVar == 10) TotalDamage = 51.52;
					if(PlayerVar == 11) TotalDamage = 52.42;
					if(PlayerVar == 12) TotalDamage = 53.54;
				}
				case 82..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 35.21;
					if(PlayerVar == 1) TotalDamage = 41.18 +4;
					if(PlayerVar == 2) TotalDamage = 43.48 +5;
					if(PlayerVar == 3) TotalDamage = 44.36 +6;
					if(PlayerVar == 4) TotalDamage = 45.44 +7;
					if(PlayerVar == 5) TotalDamage = 46.49 +8;
					if(PlayerVar == 6) TotalDamage = 47.65 +9;
					if(PlayerVar == 7) TotalDamage = 48.86 +10;
					if(PlayerVar == 8) TotalDamage = 49.25 +11;
					if(PlayerVar == 9) TotalDamage = 50.86 +12;
					if(PlayerVar == 10) TotalDamage = 51.52 +13;
					if(PlayerVar == 11) TotalDamage = 52.42 +14;
					if(PlayerVar == 12) TotalDamage = 53.54 +15;
				}
			}
		}
   	}
   	else if(weaponid == 27)
   	{
   		PlayerVar = PlayerInfo[playerid][pM4];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_m4 = random(100);
   		    switch(crit_m4)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		new damage0 = random(17) + 2;
		new damage1 = random(17) + 2;
		new damage2 = random(17) + 2;
		new damage3 = random(17) + 2;
		new damage4 = random(17) + 2;
		new damage5 = random(18) + 3;
		new damage6 = random(19) + 4;
		new damage7 = random(20) + 5;
   		PlayerVar = PlayerInfo[playerid][pSpas12];
   		if(PlayerVar == 0) TotalDamage = damage0;
		if(PlayerVar == 1) TotalDamage = damage1;
		if(PlayerVar == 2) TotalDamage = damage2;
		if(PlayerVar == 3) TotalDamage = damage3;
		if(PlayerVar == 4) TotalDamage = damage4;
		if(PlayerVar == 5) TotalDamage = damage5;
		if(PlayerVar == 6) TotalDamage = damage6;
		if(PlayerVar == 7) TotalDamage = damage7;
		if(PlayerVar == 8) TotalDamage = 12;
					if(PlayerVar == 9) TotalDamage = 11.50;
					if(PlayerVar == 10) TotalDamage = 11.89;
					if(PlayerVar == 11) TotalDamage = 12.20;
					if(PlayerVar == 12) TotalDamage = 13.50;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    new damage0 = random(17) + 2;
		new damage1 = random(17) + 2;
		new damage2 = random(17) + 2;
		new damage3 = random(17) + 2;
		new damage4 = random(17) + 2;
		new damage5 = random(18) + 3;
		new damage6 = random(19) + 4;
		new damage7 = random(20) + 5;
   		PlayerVar = PlayerInfo[playerid][pSpas12];
   		if(PlayerVar == 0) TotalDamage = damage0;
		if(PlayerVar == 1) TotalDamage = damage1;
		if(PlayerVar == 2) TotalDamage = damage2;
		if(PlayerVar == 3) TotalDamage = damage3;
		if(PlayerVar == 4) TotalDamage = damage4;
		if(PlayerVar == 5) TotalDamage = damage5;
		if(PlayerVar == 6) TotalDamage = damage6;
		if(PlayerVar == 7) TotalDamage = damage7;
		if(PlayerVar == 8) TotalDamage = 12;
					if(PlayerVar == 9) TotalDamage = 11.50 +23;
					if(PlayerVar == 10) TotalDamage = 11.89 +28;
					if(PlayerVar == 11) TotalDamage = 12.20 +29;
					if(PlayerVar == 12) TotalDamage = 13.50 +35;
				}
			}
		}
		else
		{
		    new crit_m4 = random(100);
   		    switch(crit_m4)
   		    {
   		        case 0..87:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		new damage0 = random(17) + 2;
		new damage1 = random(17) + 2;
		new damage2 = random(17) + 2;
		new damage3 = random(17) + 2;
		new damage4 = random(17) + 2;
		new damage5 = random(18) + 3;
		new damage6 = random(19) + 4;
		new damage7 = random(20) + 5;
   		PlayerVar = PlayerInfo[playerid][pSpas12];
   		if(PlayerVar == 0) TotalDamage = damage0;
		if(PlayerVar == 1) TotalDamage = damage1;
		if(PlayerVar == 2) TotalDamage = damage2;
		if(PlayerVar == 3) TotalDamage = damage3;
		if(PlayerVar == 4) TotalDamage = damage4;
		if(PlayerVar == 5) TotalDamage = damage5;
		if(PlayerVar == 6) TotalDamage = damage6;
		if(PlayerVar == 7) TotalDamage = damage7;
		if(PlayerVar == 8) TotalDamage = 12;
					if(PlayerVar == 9) TotalDamage = 11.50;
					if(PlayerVar == 10) TotalDamage = 11.89;
					if(PlayerVar == 11) TotalDamage = 12.20;
					if(PlayerVar == 12) TotalDamage = 13.50;
				}
				case 88..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    new damage0 = random(17) + 2;
		new damage1 = random(17) + 2;
		new damage2 = random(17) + 2;
		new damage3 = random(17) + 2;
		new damage4 = random(17) + 2;
		new damage5 = random(18) + 3;
		new damage6 = random(19) + 4;
		new damage7 = random(20) + 5;
   		PlayerVar = PlayerInfo[playerid][pSpas12];
   		if(PlayerVar == 0) TotalDamage = damage0;
		if(PlayerVar == 1) TotalDamage = damage1;
		if(PlayerVar == 2) TotalDamage = damage2;
		if(PlayerVar == 3) TotalDamage = damage3;
		if(PlayerVar == 4) TotalDamage = damage4;
		if(PlayerVar == 5) TotalDamage = damage5;
		if(PlayerVar == 6) TotalDamage = damage6;
		if(PlayerVar == 7) TotalDamage = damage7;
		if(PlayerVar == 8) TotalDamage = 12;
					if(PlayerVar == 9) TotalDamage = 11.50 +23;
					if(PlayerVar == 10) TotalDamage = 11.89 +28;
					if(PlayerVar == 11) TotalDamage = 12.20 +29;
					if(PlayerVar == 12) TotalDamage = 13.50 +35;
				}
			}
		}
   	}
 	else if(weaponid == 31)
   	{
   		PlayerVar = PlayerInfo[playerid][pM4];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_m4 = random(100);
   		    switch(crit_m4)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 7.00;
					if(PlayerVar == 1) TotalDamage = 7.50;
					if(PlayerVar == 2) TotalDamage = 8.00;
					if(PlayerVar == 3) TotalDamage = 8.50;
					if(PlayerVar == 4) TotalDamage = 9.00;
					if(PlayerVar == 5) TotalDamage = 9.50;
					if(PlayerVar == 6) TotalDamage = 12.50;
					if(PlayerVar == 7) TotalDamage = 10.50;
					if(PlayerVar == 8) TotalDamage = 11.00;
					if(PlayerVar == 9) TotalDamage = 11.50;
					if(PlayerVar == 10) TotalDamage = 12.00;
					if(PlayerVar == 11) TotalDamage = 12.50;
					if(PlayerVar == 12) TotalDamage = 13.00;
					if(PlayerVar == 13) TotalDamage = 49.25;
					if(PlayerVar == 14) TotalDamage = 13.50;
					if(PlayerVar == 15) TotalDamage = 49;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 7.00 + 10;
					if(PlayerVar == 1) TotalDamage = 7.50 + 10;
					if(PlayerVar == 2) TotalDamage = 8.00 +10;
					if(PlayerVar == 3) TotalDamage = 8.50 +10;
					if(PlayerVar == 4) TotalDamage = 9.00 +10;
					if(PlayerVar == 5) TotalDamage = 9.50 +10;
					if(PlayerVar == 6) TotalDamage = 12.50 +10;
					if(PlayerVar == 7) TotalDamage = 10.50 +10;
					if(PlayerVar == 8) TotalDamage = 11.00 +10;
					if(PlayerVar == 9) TotalDamage = 11.50 +10;
					if(PlayerVar == 10) TotalDamage = 12.00 +10;
					if(PlayerVar == 11) TotalDamage = 12.50 +10;
					if(PlayerVar == 12) TotalDamage = 13.00 +10;
					if(PlayerVar == 13) TotalDamage = 49.25 +19;
					if(PlayerVar == 14) TotalDamage = 13.50 +10;
					if(PlayerVar == 15) TotalDamage = 49 +20;
				}
			}
		}
		else
		{
		    new crit_m4 = random(100);
   		    switch(crit_m4)
   		    {
   		        case 0..87:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 7.00;
					if(PlayerVar == 1) TotalDamage = 7.50;
					if(PlayerVar == 2) TotalDamage = 8.00;
					if(PlayerVar == 3) TotalDamage = 8.50;
					if(PlayerVar == 4) TotalDamage = 9.00;
					if(PlayerVar == 5) TotalDamage = 9.50;
					if(PlayerVar == 6) TotalDamage = 12.50;
					if(PlayerVar == 7) TotalDamage = 10.50;
					if(PlayerVar == 8) TotalDamage = 11.00;
					if(PlayerVar == 9) TotalDamage = 11.50;
					if(PlayerVar == 10) TotalDamage = 12.00;
					if(PlayerVar == 11) TotalDamage = 12.50;
					if(PlayerVar == 12) TotalDamage = 13.00;
					if(PlayerVar == 13) TotalDamage = 49.25;
					if(PlayerVar == 14) TotalDamage = 13.50;
					if(PlayerVar == 15) TotalDamage = 49;
				}
				case 88..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 7.00 + 10;
					if(PlayerVar == 1) TotalDamage = 7.50 + 10;
					if(PlayerVar == 2) TotalDamage = 8.00 +10;
					if(PlayerVar == 3) TotalDamage = 8.50 +10;
					if(PlayerVar == 4) TotalDamage = 9.00 +10;
					if(PlayerVar == 5) TotalDamage = 9.50 +10;
					if(PlayerVar == 6) TotalDamage = 12.50 +10;
					if(PlayerVar == 7) TotalDamage = 10.50 +10;
					if(PlayerVar == 8) TotalDamage = 11.00 +10;
					if(PlayerVar == 9) TotalDamage = 11.50 +10;
					if(PlayerVar == 10) TotalDamage = 12.00 +10;
					if(PlayerVar == 11) TotalDamage = 12.50 +10;
					if(PlayerVar == 12) TotalDamage = 13.00 +10;
					if(PlayerVar == 13) TotalDamage = 49.25 +19;
					if(PlayerVar == 14) TotalDamage = 13.50 +10;
					if(PlayerVar == 15) TotalDamage = 49 +20;
				}
			}
		}
   	}
  	else if(weaponid == 29)
   	{
   		PlayerVar = PlayerInfo[playerid][pMP5];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		PlayerVar = PlayerInfo[playerid][pMP5];

					if(PlayerVar == 0) TotalDamage = 6.50;
					if(PlayerVar == 1) TotalDamage = 7.00;
					if(PlayerVar == 2) TotalDamage = 7.50;
					if(PlayerVar == 3) TotalDamage = 8.00;
					if(PlayerVar == 4) TotalDamage = 8.50;
					if(PlayerVar == 5) TotalDamage = 9.00;
					if(PlayerVar == 6) TotalDamage = 9.50;
					if(PlayerVar == 7) TotalDamage = 10.00;
					if(PlayerVar == 8) TotalDamage = 10.50;
					if(PlayerVar == 9) TotalDamage = 11.00;
					if(PlayerVar == 10) TotalDamage = 11.50;
					if(PlayerVar == 11) TotalDamage = 12.00;
					if(PlayerVar == 12) TotalDamage = 13.00;
					if(PlayerVar == 13) TotalDamage = 49.25;
					if(PlayerVar == 14) TotalDamage = 14.21;
					if(PlayerVar == 15) TotalDamage = 49;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 6.50 + 10;
					if(PlayerVar == 1) TotalDamage = 7.00 + 10;
					if(PlayerVar == 2) TotalDamage = 7.50 + 10;
					if(PlayerVar == 3) TotalDamage = 8.00 + 10;
					if(PlayerVar == 4) TotalDamage = 8.50 + 10;
					if(PlayerVar == 5) TotalDamage = 9.00 + 10;
					if(PlayerVar == 6) TotalDamage = 9.50 + 10;
					if(PlayerVar == 7) TotalDamage = 10.00 +10;
					if(PlayerVar == 8) TotalDamage = 10.50 +10;
					if(PlayerVar == 9) TotalDamage = 11.00 +10;
					if(PlayerVar == 10) TotalDamage = 11.50 +10;
					if(PlayerVar == 11) TotalDamage = 12.00 +10;
					if(PlayerVar == 12) TotalDamage = 10.21 +10;
					if(PlayerVar == 13) TotalDamage = 49.25 +10;
					if(PlayerVar == 14) TotalDamage = 14.21 +10;
					if(PlayerVar == 15) TotalDamage = 49 +20;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 6.50;
					if(PlayerVar == 1) TotalDamage = 7.00;
					if(PlayerVar == 2) TotalDamage = 7.50;
					if(PlayerVar == 3) TotalDamage = 8.00;
					if(PlayerVar == 4) TotalDamage = 8.50;
					if(PlayerVar == 5) TotalDamage = 9.00;
					if(PlayerVar == 6) TotalDamage = 9.50;
					if(PlayerVar == 7) TotalDamage = 10.00;
					if(PlayerVar == 8) TotalDamage = 10.50;
					if(PlayerVar == 9) TotalDamage = 11.00;
					if(PlayerVar == 10) TotalDamage = 11.50;
					if(PlayerVar == 11) TotalDamage = 12.00;
					if(PlayerVar == 12) TotalDamage = 13.00;
					if(PlayerVar == 13) TotalDamage = 49.25;
					if(PlayerVar == 14) TotalDamage = 14.21;
					if(PlayerVar == 15) TotalDamage = 49;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 6.50 + 10;
					if(PlayerVar == 1) TotalDamage = 7.00 + 10;
					if(PlayerVar == 2) TotalDamage = 7.50 + 10;
					if(PlayerVar == 3) TotalDamage = 8.00 + 10;
					if(PlayerVar == 4) TotalDamage = 8.50 + 10;
					if(PlayerVar == 5) TotalDamage = 9.00 + 10;
					if(PlayerVar == 6) TotalDamage = 9.50 + 10;
					if(PlayerVar == 7) TotalDamage = 10.00 +10;
					if(PlayerVar == 8) TotalDamage = 10.50 +10;
					if(PlayerVar == 9) TotalDamage = 11.00 +10;
					if(PlayerVar == 10) TotalDamage = 11.50 +10;
					if(PlayerVar == 11) TotalDamage = 12.00 +10;
					if(PlayerVar == 12) TotalDamage = 10.21 +10;
					if(PlayerVar == 13) TotalDamage = 49.25 +10;
					if(PlayerVar == 14) TotalDamage = 14.21 +10;
					if(PlayerVar == 15) TotalDamage = 49 +20;
				}
			}
		}
   	}
   	else if(weaponid == 33)
   	{
   		PlayerVar = PlayerInfo[playerid][pRifle];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_shotgun = random(100);
   		    switch(crit_shotgun)
   		    {
   		        case 0..90:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 43;
					if(PlayerVar == 1) TotalDamage = 35.25;
					if(PlayerVar == 2) TotalDamage = 35.45;
					if(PlayerVar == 3) TotalDamage = 36.86;
					if(PlayerVar == 4) TotalDamage = 37.25;
					if(PlayerVar == 5) TotalDamage = 37.45;
					if(PlayerVar == 6) TotalDamage = 45.55;
					if(PlayerVar == 7) TotalDamage = 44.25;
					if(PlayerVar == 8) TotalDamage = 45.50;
					if(PlayerVar == 9) TotalDamage = 45.75;
					if(PlayerVar == 10) TotalDamage = 46.50;
					if(PlayerVar == 11) TotalDamage = 35;
					if(PlayerVar == 12) TotalDamage = 15.21;
					if(PlayerVar == 13) TotalDamage = 49.25;
					if(PlayerVar == 14) TotalDamage = 14.21;
				}
				case 91..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 43;
					if(PlayerVar == 1) TotalDamage = 35.25 +3;
					if(PlayerVar == 2) TotalDamage = 35.45 +4;
					if(PlayerVar == 3) TotalDamage = 36.86 +5;
					if(PlayerVar == 4) TotalDamage = 37.25 +6;
					if(PlayerVar == 5) TotalDamage = 37.45 +7;
					if(PlayerVar == 6) TotalDamage = 45.55 +5;
					if(PlayerVar == 7) TotalDamage = 44.25 +9;
					if(PlayerVar == 8) TotalDamage = 45.50 +11;
					if(PlayerVar == 9) TotalDamage = 45.75 +12;
					if(PlayerVar == 10) TotalDamage = 46.50 +15;
					if(PlayerVar == 11) TotalDamage = 35 +0;
					if(PlayerVar == 12) TotalDamage = 15.21 +18;
					if(PlayerVar == 13) TotalDamage = 49.25 +19;
					if(PlayerVar == 14) TotalDamage = 14.21 +17;
				}
			}
		}
		else
		{
		    new crit_shotgun = random(100);
   		    switch(crit_shotgun)
   		    {
   		        case 0..83:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			        if(PlayerVar == 0) TotalDamage = 43;
					if(PlayerVar == 1) TotalDamage = 35.25;
					if(PlayerVar == 2) TotalDamage = 35.45;
					if(PlayerVar == 3) TotalDamage = 36.86;
					if(PlayerVar == 4) TotalDamage = 37.25;
					if(PlayerVar == 5) TotalDamage = 37.45;
					if(PlayerVar == 6) TotalDamage = 45.55;
					if(PlayerVar == 7) TotalDamage = 44.25;
					if(PlayerVar == 8) TotalDamage = 45.50;
					if(PlayerVar == 9) TotalDamage = 45.75;
					if(PlayerVar == 10) TotalDamage = 46.50;
					if(PlayerVar == 11) TotalDamage = 35;
					if(PlayerVar == 12) TotalDamage = 15.21;
					if(PlayerVar == 13) TotalDamage = 49.25;
					if(PlayerVar == 14) TotalDamage = 14.21;
				}
				case 84..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

                    if(PlayerVar == 0) TotalDamage = 43;
					if(PlayerVar == 1) TotalDamage = 35.25 +3;
					if(PlayerVar == 2) TotalDamage = 35.45 +4;
					if(PlayerVar == 3) TotalDamage = 36.86 +5;
					if(PlayerVar == 4) TotalDamage = 37.25 +6;
					if(PlayerVar == 5) TotalDamage = 37.45 +7;
					if(PlayerVar == 6) TotalDamage = 45.55 +5;
					if(PlayerVar == 7) TotalDamage = 44.25 +9;
					if(PlayerVar == 8) TotalDamage = 45.50 +11;
					if(PlayerVar == 9) TotalDamage = 45.75 +12;
					if(PlayerVar == 10) TotalDamage = 46.50 +15;
					if(PlayerVar == 11) TotalDamage = 35 +0;
					if(PlayerVar == 12) TotalDamage = 15.21 +18;
					if(PlayerVar == 13) TotalDamage = 49.25 +19;
					if(PlayerVar == 14) TotalDamage = 14.21 +17;
                }
			}
		}
   	}
  	else if(weaponid == 25)
   	{
   		PlayerVar = PlayerInfo[playerid][pShotgun];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 15.20;
					if(PlayerVar == 1) TotalDamage = 14.65;
					if(PlayerVar == 2) TotalDamage = 15.80;
					if(PlayerVar == 3) TotalDamage = 16.90;
					if(PlayerVar == 4) TotalDamage = 17.25;
					if(PlayerVar == 5) TotalDamage = 18.50;
					if(PlayerVar == 6) TotalDamage = 19.80;
					if(PlayerVar == 7) TotalDamage = 20.40;
					if(PlayerVar == 8) TotalDamage = 21.50;
					if(PlayerVar == 9) TotalDamage = 22.89;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 15.20;
					if(PlayerVar == 1) TotalDamage = 14.65 +4;
					if(PlayerVar == 2) TotalDamage = 15.80 +5;
					if(PlayerVar == 3) TotalDamage = 16.90 +6;
					if(PlayerVar == 4) TotalDamage = 17.25 +7;
					if(PlayerVar == 5) TotalDamage = 18.50 +8;
					if(PlayerVar == 6) TotalDamage = 19.80 +9;
					if(PlayerVar == 7) TotalDamage = 20.40 +10;
					if(PlayerVar == 8) TotalDamage = 21.50 +11;
					if(PlayerVar == 9) TotalDamage = 22.89 +12;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 15.20;
					if(PlayerVar == 1) TotalDamage = 14.65;
					if(PlayerVar == 2) TotalDamage = 15.80;
					if(PlayerVar == 3) TotalDamage = 16.90;
					if(PlayerVar == 4) TotalDamage = 17.25;
					if(PlayerVar == 5) TotalDamage = 18.50;
					if(PlayerVar == 6) TotalDamage = 19.80;
					if(PlayerVar == 7) TotalDamage = 20.40;
					if(PlayerVar == 8) TotalDamage = 21.50;
					if(PlayerVar == 9) TotalDamage = 22.89;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 15.20;
					if(PlayerVar == 1) TotalDamage = 14.65 +4;
					if(PlayerVar == 2) TotalDamage = 15.80 +5;
					if(PlayerVar == 3) TotalDamage = 16.90 +6;
					if(PlayerVar == 4) TotalDamage = 17.25 +7;
					if(PlayerVar == 5) TotalDamage = 18.50 +8;
					if(PlayerVar == 6) TotalDamage = 19.80 +9;
					if(PlayerVar == 7) TotalDamage = 20.40 +10;
					if(PlayerVar == 8) TotalDamage = 21.50 +11;
					if(PlayerVar == 9) TotalDamage = 22.89 +12;
                }
			}
		}
   	}
   	else if(weaponid == 22)
   	{
   		PlayerVar = PlayerInfo[playerid][p9mms];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 9.22;
					if(PlayerVar == 1) TotalDamage = 10.22;
					if(PlayerVar == 2) TotalDamage = 12.80;
					if(PlayerVar == 3) TotalDamage = 14.90;
					if(PlayerVar == 4) TotalDamage = 15.25;
					if(PlayerVar == 5) TotalDamage = 16.50;
					if(PlayerVar == 6) TotalDamage = 16.80;
					if(PlayerVar == 7) TotalDamage = 17.40;
					if(PlayerVar == 8) TotalDamage = 18.50;
					if(PlayerVar == 9) TotalDamage = 19.89;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 9.22 +1;
					if(PlayerVar == 1) TotalDamage = 10.22 +2;
					if(PlayerVar == 2) TotalDamage = 12.80 +4;
					if(PlayerVar == 3) TotalDamage = 14.90 +5;
					if(PlayerVar == 4) TotalDamage = 15.25 +6;
					if(PlayerVar == 5) TotalDamage = 16.50 +7;
					if(PlayerVar == 6) TotalDamage = 16.80 +8;
					if(PlayerVar == 7) TotalDamage = 17.40 +9;
					if(PlayerVar == 8) TotalDamage = 18.50 +10;
					if(PlayerVar == 9) TotalDamage = 19.89 +11;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 9.22;
					if(PlayerVar == 1) TotalDamage = 10.22;
					if(PlayerVar == 2) TotalDamage = 12.80;
					if(PlayerVar == 3) TotalDamage = 14.90;
					if(PlayerVar == 4) TotalDamage = 15.25;
					if(PlayerVar == 5) TotalDamage = 16.50;
					if(PlayerVar == 6) TotalDamage = 16.80;
					if(PlayerVar == 7) TotalDamage = 17.40;
					if(PlayerVar == 8) TotalDamage = 18.50;
					if(PlayerVar == 9) TotalDamage = 19.89;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 9.22 +1;
					if(PlayerVar == 1) TotalDamage = 10.22 +2;
					if(PlayerVar == 2) TotalDamage = 12.80 +4;
					if(PlayerVar == 3) TotalDamage = 14.90 +5;
					if(PlayerVar == 4) TotalDamage = 15.25 +6;
					if(PlayerVar == 5) TotalDamage = 16.50 +7;
					if(PlayerVar == 6) TotalDamage = 16.80 +8;
					if(PlayerVar == 7) TotalDamage = 17.40 +9;
					if(PlayerVar == 8) TotalDamage = 18.50 +10;
					if(PlayerVar == 9) TotalDamage = 19.89 +11;
                }
			}
		}
   	}
   	else if(weaponid == 23)
   	{
   		PlayerVar = PlayerInfo[playerid][pSpis];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 10.22;
					if(PlayerVar == 1) TotalDamage = 11.22;
					if(PlayerVar == 2) TotalDamage = 12.80;
					if(PlayerVar == 3) TotalDamage = 13.90;
					if(PlayerVar == 4) TotalDamage = 15.25;
					if(PlayerVar == 5) TotalDamage = 16.50;
					if(PlayerVar == 6) TotalDamage = 18.80;
					if(PlayerVar == 7) TotalDamage = 20.40;
					if(PlayerVar == 8) TotalDamage = 22.50;
					if(PlayerVar == 9) TotalDamage = 24.89;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 10.22 +1;
					if(PlayerVar == 1) TotalDamage = 11.22 +2;
					if(PlayerVar == 2) TotalDamage = 12.80 +4;
					if(PlayerVar == 3) TotalDamage = 13.90 +5;
					if(PlayerVar == 4) TotalDamage = 15.25 +6;
					if(PlayerVar == 5) TotalDamage = 16.50 +8;
					if(PlayerVar == 6) TotalDamage = 18.80 +9;
					if(PlayerVar == 7) TotalDamage = 20.40 +11;
					if(PlayerVar == 8) TotalDamage = 22.50 +12;
					if(PlayerVar == 9) TotalDamage = 24.89 +14;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 10.22;
					if(PlayerVar == 1) TotalDamage = 11.22;
					if(PlayerVar == 2) TotalDamage = 12.80;
					if(PlayerVar == 3) TotalDamage = 13.90;
					if(PlayerVar == 4) TotalDamage = 15.25;
					if(PlayerVar == 5) TotalDamage = 16.50;
					if(PlayerVar == 6) TotalDamage = 18.80;
					if(PlayerVar == 7) TotalDamage = 20.40;
					if(PlayerVar == 8) TotalDamage = 22.50;
					if(PlayerVar == 9) TotalDamage = 24.89;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 10.22 +1;
					if(PlayerVar == 1) TotalDamage = 11.22 +2;
					if(PlayerVar == 2) TotalDamage = 12.80 +4;
					if(PlayerVar == 3) TotalDamage = 13.90 +5;
					if(PlayerVar == 4) TotalDamage = 15.25 +6;
					if(PlayerVar == 5) TotalDamage = 16.50 +8;
					if(PlayerVar == 6) TotalDamage = 18.80 +9;
					if(PlayerVar == 7) TotalDamage = 20.40 +11;
					if(PlayerVar == 8) TotalDamage = 22.50 +12;
					if(PlayerVar == 9) TotalDamage = 24.89 +14;
                }
			}
		}
   	}
   	else if(weaponid == 28)
   	{
   		PlayerVar = PlayerInfo[playerid][pUzis];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 8.22;
					if(PlayerVar == 1) TotalDamage = 9.22;
					if(PlayerVar == 2) TotalDamage = 9.80;
					if(PlayerVar == 3) TotalDamage = 9.90;
					if(PlayerVar == 4) TotalDamage = 9.99;
					if(PlayerVar == 5) TotalDamage = 10;
					if(PlayerVar == 6) TotalDamage = 10.20;
					if(PlayerVar == 7) TotalDamage = 10.40;
					if(PlayerVar == 8) TotalDamage = 10.50;
					if(PlayerVar == 9) TotalDamage = 10.89;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 8.22;
					if(PlayerVar == 1) TotalDamage = 9.22 +2;
					if(PlayerVar == 2) TotalDamage = 9.80 +3;
					if(PlayerVar == 3) TotalDamage = 9.90 +4;
					if(PlayerVar == 4) TotalDamage = 9.99 +5;
					if(PlayerVar == 5) TotalDamage = 10 +6;
					if(PlayerVar == 6) TotalDamage = 10.20 +7;
					if(PlayerVar == 7) TotalDamage = 10.40 +8;
					if(PlayerVar == 8) TotalDamage = 10.50 +9;
					if(PlayerVar == 9) TotalDamage = 10.89 +12;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 8.22;
					if(PlayerVar == 1) TotalDamage = 9.22;
					if(PlayerVar == 2) TotalDamage = 9.80;
					if(PlayerVar == 3) TotalDamage = 9.90;
					if(PlayerVar == 4) TotalDamage = 9.99;
					if(PlayerVar == 5) TotalDamage = 10;
					if(PlayerVar == 6) TotalDamage = 10.20;
					if(PlayerVar == 7) TotalDamage = 10.40;
					if(PlayerVar == 8) TotalDamage = 10.50;
					if(PlayerVar == 9) TotalDamage = 10.89;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 8.22;
					if(PlayerVar == 1) TotalDamage = 9.22 +2;
					if(PlayerVar == 2) TotalDamage = 9.80 +3;
					if(PlayerVar == 3) TotalDamage = 9.90 +4;
					if(PlayerVar == 4) TotalDamage = 9.99 +5;
					if(PlayerVar == 5) TotalDamage = 10 +6;
					if(PlayerVar == 6) TotalDamage = 10.20 +7;
					if(PlayerVar == 7) TotalDamage = 10.40 +8;
					if(PlayerVar == 8) TotalDamage = 10.50 +9;
					if(PlayerVar == 9) TotalDamage = 10.89 +12;
                }
			}
		}
   	}
   	else if(weaponid == 30)
   	{
   		PlayerVar = PlayerInfo[playerid][pAkz];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 7.13;
					if(PlayerVar == 1) TotalDamage = 8.12;
					if(PlayerVar == 2) TotalDamage = 8.20;
					if(PlayerVar == 3) TotalDamage = 8.90;
					if(PlayerVar == 4) TotalDamage = 9.19;
					if(PlayerVar == 5) TotalDamage = 9.89;
					if(PlayerVar == 6) TotalDamage = 10.18;
					if(PlayerVar == 7) TotalDamage = 11.40;
					if(PlayerVar == 8) TotalDamage = 12.50;
					if(PlayerVar == 9) TotalDamage = 13.10;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 7.13 +1;
					if(PlayerVar == 1) TotalDamage = 8.12 +2;
					if(PlayerVar == 2) TotalDamage = 8.20 +3;
					if(PlayerVar == 3) TotalDamage = 8.90 +4;
					if(PlayerVar == 4) TotalDamage = 9.19 +5;
					if(PlayerVar == 5) TotalDamage = 9.89 +6;
					if(PlayerVar == 6) TotalDamage = 10.18 +7;
					if(PlayerVar == 7) TotalDamage = 11.40 +8;
					if(PlayerVar == 8) TotalDamage = 12.50 +9;
					if(PlayerVar == 9) TotalDamage = 13.10 +12;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 7.13;
					if(PlayerVar == 1) TotalDamage = 8.12;
					if(PlayerVar == 2) TotalDamage = 8.20;
					if(PlayerVar == 3) TotalDamage = 8.90;
					if(PlayerVar == 4) TotalDamage = 9.19;
					if(PlayerVar == 5) TotalDamage = 9.89;
					if(PlayerVar == 6) TotalDamage = 10.18;
					if(PlayerVar == 7) TotalDamage = 11.40;
					if(PlayerVar == 8) TotalDamage = 12.50;
					if(PlayerVar == 9) TotalDamage = 13.10;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 9;

				    if(PlayerVar == 0) TotalDamage = 7.13 +1;
					if(PlayerVar == 1) TotalDamage = 8.12 +2;
					if(PlayerVar == 2) TotalDamage = 8.20 +3;
					if(PlayerVar == 3) TotalDamage = 8.90 +4;
					if(PlayerVar == 4) TotalDamage = 9.19 +5;
					if(PlayerVar == 5) TotalDamage = 9.89 +6;
					if(PlayerVar == 6) TotalDamage = 10.18 +7;
					if(PlayerVar == 7) TotalDamage = 11.40 +8;
					if(PlayerVar == 8) TotalDamage = 12.50 +9;
					if(PlayerVar == 9) TotalDamage = 13.10 +12;
                }
			}
		}
   	}
   	else if(weaponid == 0)
   	{
   		PlayerVar = PlayerInfo[playerid][pFistz];

   		if(Crits[playerid] > 8)
   		{
   		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..89:
   		        {
   		        	PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 2;
					if(PlayerVar == 1) TotalDamage = 8.12;
					if(PlayerVar == 2) TotalDamage = 8.20;
					if(PlayerVar == 3) TotalDamage = 8.90;
					if(PlayerVar == 4) TotalDamage = 9.19;
					if(PlayerVar == 5) TotalDamage = 9.89;
					if(PlayerVar == 6) TotalDamage = 10.18;
					if(PlayerVar == 7) TotalDamage = 11.40;
					if(PlayerVar == 8) TotalDamage = 12.50;
					if(PlayerVar == 9) TotalDamage = 13.10;
				}
				case 90..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 0;

				    if(PlayerVar == 0) TotalDamage = 2 +2;
					if(PlayerVar == 1) TotalDamage = 8.12 +2;
					if(PlayerVar == 2) TotalDamage = 8.20 +3;
					if(PlayerVar == 3) TotalDamage = 8.90 +4;
					if(PlayerVar == 4) TotalDamage = 9.19 +5;
					if(PlayerVar == 5) TotalDamage = 9.89 +6;
					if(PlayerVar == 6) TotalDamage = 10.18 +7;
					if(PlayerVar == 7) TotalDamage = 11.40 +8;
					if(PlayerVar == 8) TotalDamage = 12.50 +9;
					if(PlayerVar == 9) TotalDamage = 13.10 +12;
				}
			}
		}
		else
		{
		    new crit_mp5 = random(100);
   		    switch(crit_mp5)
   		    {
   		        case 0..82:
   		        {
   		            PlayerInfo[playerid][pCritDamage] = 0;

			   		if(PlayerVar == 0) TotalDamage = 1.12;
					if(PlayerVar == 1) TotalDamage = 8.12;
					if(PlayerVar == 2) TotalDamage = 8.20;
					if(PlayerVar == 3) TotalDamage = 8.90;
					if(PlayerVar == 4) TotalDamage = 9.19;
					if(PlayerVar == 5) TotalDamage = 9.89;
					if(PlayerVar == 6) TotalDamage = 10.18;
					if(PlayerVar == 7) TotalDamage = 11.40;
					if(PlayerVar == 8) TotalDamage = 12.50;
					if(PlayerVar == 9) TotalDamage = 13.10;
				}
				case 83..100:
				{
				    PlayerInfo[playerid][pCritDamage] = 0;

				    if(PlayerVar == 0) TotalDamage = 1.12 +1;
					if(PlayerVar == 1) TotalDamage = 8.12 +2;
					if(PlayerVar == 2) TotalDamage = 8.20 +3;
					if(PlayerVar == 3) TotalDamage = 8.90 +4;
					if(PlayerVar == 4) TotalDamage = 9.19 +5;
					if(PlayerVar == 5) TotalDamage = 9.89 +6;
					if(PlayerVar == 6) TotalDamage = 10.18 +7;
					if(PlayerVar == 7) TotalDamage = 11.40 +8;
					if(PlayerVar == 8) TotalDamage = 12.50 +9;
					if(PlayerVar == 9) TotalDamage = 13.10 +12;
                }
			}
		}
   	}
   	else TotalDamage = amount;
   	GetPlayerHealth(damagedid, Health);
   	GetPlayerArmour(damagedid, Armor);
   	if(Health > TotalDamage && Armor < 1)
	{
		SetPlayerHealth(damagedid, Health - TotalDamage);
	}
	if(Armor > TotalDamage)
	{
		SetPlayerArmour(damagedid, Armor - TotalDamage);
	}
	else
	{
	 	SetPlayerArmour(damagedid, 0);
	 	SetPlayerHealth(damagedid, (Health - TotalDamage) + Armor);
	}
	SendHistory(playerid, damagedid , TotalDamage , weaponid , PlayerVar, bodypart);
	return 1;
}


SendHistory(playerid, playerid1 , Float:amount , weapon , Levelgun, bodypart)
{
	new string[155], string1[155], Namex[MAX_PLAYER_NAME];
	GetWeaponName(weapon, Namex, MAX_PLAYER_NAME);
		new part[24];
	if(bodypart == 9) part = "dau";
	if(bodypart == 4) part = "Chim";
	if(bodypart == 5) part = "tay trai";
	if(bodypart == 6) part = "tay phai";
	if(bodypart == 7) part = "chan trai";
	if(bodypart == 8) part = "chan phai";
	if(bodypart == 3) part = "than the";
	if(PlayerInfo[playerid][pCritDamage] == 9)
		format(string, 155, "[CHIEN DAU] {00FF00}+%.02f HP {B00E0E}(Crit) {ffffff}[{FFD700}%s %s] ({339966}%s{FFFFFF}) (%.02fm) [%s]", amount , Namex, GetLevelGun(Levelgun), GetPlayerNameEx(playerid1), GetDistanceBetweenPlayers(playerid, playerid1), part);
	else

	if(weapon == 0)
        format(string, 155, "[CHIEN DAU] {5bff44}+%.02f HP {ffffff} [{FFD700}Unarmed{ffffff}] ({339966}%s{FFFFFF}) (%0.2fm) [%s]", amount, GetPlayerNameEx(playerid1), GetDistanceBetweenPlayers(playerid, playerid1), part);
	else
	    format(string, 155, "[CHIEN DAU] {5bff44}+%.02f HP {ffffff}[{FFD700}%s %s] ({339966}%s{FFFFFF}) (%.02fm) [%s]", amount , Namex, GetLevelGun(Levelgun), GetPlayerNameEx(playerid1), GetDistanceBetweenPlayers(playerid, playerid1), part);
	if(PlayerInfo[playerid][pCritDamage] == 9)
		format(string1, 155, "[CHIEN DAU] {FF4444}-%.02f HP {B00E0E}(Crit) {ffffff}[{009cff}%s %s] ({ef891a}%s{ffffff}) (%.02fm) [%s]", amount , Namex, GetLevelGun(Levelgun), GetPlayerNameEx(playerid), GetDistanceBetweenPlayers(playerid1, playerid), part);
	else

	if(weapon == 0)
         format(string1, 155, "[CHIEN DAU] {FF4444}-%.02f HP [{FF9900}Unarmed{ffffff}] ({339966}%s{FFFFFF}) (%0.2fm) [%s]", amount, GetPlayerNameEx(playerid1), GetDistanceBetweenPlayers(playerid, playerid1), part);
	else
		 format(string1, 155, "[CHIEN DAU] {FF4444}-%.02f HP {ffffff}[{009cff}%s %s] ({ef891a}%s{ffffff}) (%.02fm) [%s]", amount , Namex, GetLevelGun(Levelgun), GetPlayerNameEx(playerid), GetDistanceBetweenPlayers(playerid1, playerid), part);
	SendClientMessage(playerid, -1, string);
 	SendClientMessage(playerid1, -1, string1);
 	PlayerPlaySound(playerid, 17804, 0, 0, 0);
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[500];
	if(dialogid == DIALOG_NANGCAPSUNG && response)
	{
		new UpdateWeapons;
		if(listitem == 0)
		{
			if(PlayerInfo[playerid][pDeagle] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pDeagle] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Deagle\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pDeagle]), GetLevelGun(PlayerInfo[playerid][pDeagle]+1));
			SetPVarInt(playerid, "GunID?", 24);
		}
		if(listitem == 1)
		{
			if(PlayerInfo[playerid][pM4] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pM4] + 1) * 200000; // sam
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}M4A1\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pM4]), GetLevelGun(PlayerInfo[playerid][pM4]+1));
			SetPVarInt(playerid, "GunID?", 31);
		}
		if(listitem == 2)
		{
			if(PlayerInfo[playerid][pSniper] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pSniper] + 1) * 200000; // sam
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Sniper\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pSniper]), GetLevelGun(PlayerInfo[playerid][pSniper]+1));
			SetPVarInt(playerid, "GunID?", 34);
		}
		if(listitem == 3)
		{
			if(PlayerInfo[playerid][pMP5] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pMP5] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}MP5\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pMP5]), GetLevelGun(PlayerInfo[playerid][pMP5]+1));
			SetPVarInt(playerid, "GunID?", 29);
		}
		if(listitem == 4)
		{
			if(PlayerInfo[playerid][pShotgun] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pShotgun] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}ShotGun\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pShotgun]), GetLevelGun(PlayerInfo[playerid][pShotgun]+1));
			SetPVarInt(playerid, "GunID?", 25);
		}
		if(listitem == 5)
		{
			if(PlayerInfo[playerid][pSpas12] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pSpas12] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Spas12\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pSpas12]), GetLevelGun(PlayerInfo[playerid][pSpas12]+1));
			SetPVarInt(playerid, "GunID?", 27);
		}
		if(listitem == 6)
		{
			if(PlayerInfo[playerid][pAK] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pAK] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}AK-47\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pAK]), GetLevelGun(PlayerInfo[playerid][pAK]+1));
			SetPVarInt(playerid, "GunID?", 30);
		}
		if(listitem == 7)
		{
			if(PlayerInfo[playerid][pUzi] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pUzi] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Micro Uzi\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pUzi]), GetLevelGun(PlayerInfo[playerid][pUzi]+1));
			SetPVarInt(playerid, "GunID?", 28);
		}
		if(listitem == 8)
		{
			if(PlayerInfo[playerid][pRifle] >= 9) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pRifle] + 1) * 200000;
			format(string, sizeof string, "\n{FF0000}Thong Tin Nang Cap Vu Khi\n\n{FFFF00}Nguyen Lieu Nang Cap\n\n{00ffff}Credits : {ffffff}%d\n\n{00ffff}Vat Lieu: {ffffff}500000\n\n{ff5f00}Ten Vu Khi : {5fff00}Rifle\n\n{ff00af}Cap Do Vu Khi |{FFFFFF} %s -----> %s\n", UpdateWeapons, GetLevelGun(PlayerInfo[playerid][pRifle]), GetLevelGun(PlayerInfo[playerid][pRifle]+1));
			SetPVarInt(playerid, "GunID?", 33);
		}
		SetPVarInt(playerid, "PriceUp?", UpdateWeapons);
		ShowPlayerDialog(playerid, DIALOG_NANGCAPSUNG1, DIALOG_STYLE_MSGBOX, "Nang Cap Vu Khi", string, "Nang", "Huy");
	}
	if(dialogid == DIALOG_NANGCAPSUNG1)
	{
		if(response)
		{
			new gunid = GetPVarInt(playerid, "GunID?") , price = GetPVarInt(playerid, "PriceUp?");
			if(price > PlayerInfo[playerid][pCredits]) return SendClientMessage(playerid, -1, "Ban khong co Credits de Nang Cap Sung");
			if(price > PlayerInfo[playerid][pMats]) return SendClientMessage(playerid, -1, "Ban Khong Du Vat Lieu De Nang Cap Sung");

			if(gunid == 24)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pDeagle] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Deagle Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pDeagle]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [Deagle %s > Deagle %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pDeagle]-1), GetLevelGun(PlayerInfo[playerid][pDeagle]));
                }
			}
			if(gunid == 34)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pSniper] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Sniper Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pSniper]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [Sniper %s > Sniper %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pSniper]-1), GetLevelGun(PlayerInfo[playerid][pSniper]));
                }
			}
			if(gunid == 31)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pM4] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}M4A1 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pM4]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [M4A1 %s > M4A1 %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pM4]-1), GetLevelGun(PlayerInfo[playerid][pM4]));
                }
			}
			if(gunid == 29)
			{
				new rand = random(70);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pMP5] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}MP5 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pMP5]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [MP5 %s > MP5 %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pMP5]-1), GetLevelGun(PlayerInfo[playerid][pMP5]));
                }
			}
			if(gunid == 25)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
               else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pShotgun] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}ShotGun Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pShotgun]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [SHOTGUN %s > SHOTGUN %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pShotgun]-1), GetLevelGun(PlayerInfo[playerid][pShotgun]));
                }
			} // pS9mm
			if(gunid == 27)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pSpas12] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Spas12 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pSpas12]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [SPAS-12 %s > SPAS-12 %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pSpas12]-1), GetLevelGun(PlayerInfo[playerid][pSpas12]));
                }
			}
			if(gunid == 30)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pAK] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}AK-47 Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pAK]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 100000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [AK %s > AK %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pAK]-1), GetLevelGun(PlayerInfo[playerid][pAK]));
                }
			}
			if(gunid == 28)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pUzi] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Micro Uzi Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pUzi]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 100000;
				format(string, sizeof string, "{00ff00}[NANGCAPSUNG THANHCONG]{ffffff} : [Micro Uzi %s > Micro Uzi %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pUzi]-1), GetLevelGun(PlayerInfo[playerid][pUzi]));
                }
			}
			if(gunid == 33)
			{
                new rand = random(50);
                if(rand >= 50 && rand <= 50)
                {
                SendClientMessageEx(playerid, COLOR_WHITE, "{00FF00}[NANGCAPSUNG THATBAI]{ff00ff} Ban Duoc Den Bu (5,000) Kim Cuong");
                PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 500000;
				PlayerInfo[playerid][pCredits] += 5000;
                }
                else if(rand >= 21 && rand <= 99)
                {
                if(PlayerInfo[playerid][pRifle] == 6)
				{
				new str[128];
				format(str, sizeof(str), "{00ff00}[NANGCAPSUNG]{FFFFFF}: Nguoi Choi {00ffff}%s{ffffff} Nang Cap Thanh Cong Vu Khi {FF0000}Rifle Level 7", GetPlayerNameEx(playerid));
		        SendClientMessageToAllEx(COLOR_LIGHTRED, str);
		        }
                PlayerInfo[playerid][pRifle]++;
				PlayerInfo[playerid][pCredits] -= price;
				PlayerInfo[playerid][pMats] -= 100000;
				format(string, sizeof string, "{00ff00}[NANG CAP SUNG THANH CONG]{ffffff} : [Rifle %s > Rifle %s] {FF00FF}/levelgun De Xem", GetLevelGun(PlayerInfo[playerid][pRifle]-1), GetLevelGun(PlayerInfo[playerid][pRifle]));
                }
			}
			SendClientMessage(playerid, -1, string);
		}
		else
		{
			DeletePVar(playerid, "GunID?");
			DeletePVar(playerid, "PriceUp?");
		}
	}
	return 1;
}


CMD:nangcapsung(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_NANGCAPSUNG, DIALOG_STYLE_LIST, "{FF0000}NANG CAP SUNG", "{5fff00}Deagle\n{00ffd7}M4a1\n{ff0000}Sniper\n{ffff00}MP5\n{ff00af}Shotgun\n{0087ff}Spas-12\n{00ff00}AK-47\n{FF00FF}Micro Uzi\n{ff5f00}Rifle", "Chon", "Thoat");
	return 1;
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	SendDamage(playerid, damagedid, amount, weaponid, bodypart);
	return 1;
}
/*
IsAblePedAnimation(playerid)
{
    if(GetPVarInt(playerid, "PlayerCuffed") != 0 || GetPVarInt(playerid, "Injured") == 1 || GetPVarInt(playerid, "IsFrozen") == 1)
	{
   		SendClientMessage(playerid, COLOR_GRAD2, "ban khong the lam dieu do vao thoi diem nay!");
   		return 0;
	}
    if(IsPlayerInAnyVehicle(playerid) == 1)
    {
		SendClientMessage(playerid, COLOR_GRAD2, "Ban Phai O Ngoai xe Moi Co The Su Dung Lenh!");
		return 0;
	}
	return 1;
}
*/
PlayAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}



