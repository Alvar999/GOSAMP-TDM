// public OnPlayerShootDynamicObject
if(objectid == conboss[BossID]) {
	    if(conboss[BossTrangThai] != 1) return true;
		new gString[128];
		new satthuong = random(100);
		if(weaponid == 31) satthuong += 200;
		else satthuong += 50;
		conboss[BossMau] -= satthuong;
		format(gString,sizeof(gString), "~y~BOSS:~d~HAI TAC~n~~y~MAU CON LAI:~g~%d", conboss[BossMau]);
		GameTextForPlayer(playerid, gString, 1000, 4);
		new rand = random(12);
		switch(rand) {
		    case 0: {
		    }
		    case 1: {
		    	CreateExplosion(conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 6, 10.0);
		    }
		    case 2: {
		        CreateExplosion(conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 6, 10.0);
		    }
		    case 3: {
				new ngau = random(4);
                if(ngau == 0) conboss[BossPosX] += 2;
                if(ngau == 1) conboss[BossPosY] += 2;
                if(ngau == 2) conboss[BossPosZ] += 2;
                if(ngau == 3 && conboss[BossPosY]!= 770.5491) conboss[BossPosY] = 770.5491;
		        MoveDynamicObject(conboss[BossID], conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 1.5);
		    }
		    case 4: {
		    }
		    case 5: {
		        CreateExplosion(conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 6, 10.0);
		    }
		    case 6: {
		    }
		    case 7: {
		        CreateExplosion(conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 6, 10.0);
		    }
		    case 8: {
		    }
		    case 9: {
		        CreateExplosion(conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 6, 10.0);
		    }
		    case 10: {
		        CreateExplosion(conboss[BossPosX], conboss[BossPosY], conboss[BossPosZ], 6, 10.0);
		    }
		    case 11: {
		    }
		}
		if(conboss[BossMau] <= 0) {
		    DestroyDynamicObject(conboss[BossID]);
		    conboss[BossTrangThai] = 0;
		    GameTextForPlayer(playerid, "~g~Ban Da Tieu Diet Boss", 1000, 4);
			new amount = 100000 + random(150000);
		    GivePlayerCash(playerid, amount);
			GivePlayerValidWeapon(playerid, 25, 300);
            PlayerInfo[playerid][pExp] += 1;
			format(gString,sizeof(gString), "Ban Nhan Duoc: %d + Shotgun V� 1EXP vi da giet duoc boss", amount);
		    SendClientMessage(playerid, COLOR_YELLOW, gString);
		}
	}
	return true;
}
//enum
enum bossinfo
    {Float: BossPosX, Float: BossPosY, Float: BossPosZ, BossID, BossTrangThai, BossTime, BossMau}
new conboss[bossinfo];
// add task
task TimeEventBoss[60000]()
{
	if(DaBatDauEvent == 1)
	{
	    if(TimeEvent > 0)
	    {
	        TimeEvent--;
	    }
	    if(TimeEvent == 10 || TimeEvent == 5 || TimeEvent == 3)
	    {
	        new string[1280];
	        format(string, sizeof(string), "[EVENT SAN BOSS] Thoi gian con lai %d phut , hay nhanh chong tieu diet boss de nhan thuong~.", TimeEvent);
	        SendClientMessageToAll(-1, string);
	    }
	    if(TimeEvent == 0)
	    {
	        if(HealthEvent > 0)
	        {
	            SendClientMessageToAllEx(COLOR_YELLOW, "----------------------------------------------------------------.");
			    SendClientMessageToAllEx(COLOR_YELLOW, "TAU HAI TAC , DA XAM NHAP THANH CONG VAO THANH PHO.");
			    SendClientMessageToAllEx(COLOR_YELLOW, "----------------------------------------------------------------.");
			    
			    DaBatDauEvent = 0;
	        	DestroyObject(ObjEvent);
	        }
			else
			{
			    SendClientMessageToAllEx(COLOR_YELLOW, "----------------------------------------------------------------.");
			    SendClientMessageToAllEx(COLOR_YELLOW, "BOSS DA BIET TIEU DIET , CHUNG MUNG NHUNG ANH HUNG DA CHIEN DAU'.");
			    SendClientMessageToAllEx(COLOR_YELLOW, "----------------------------------------------------------------.");

			    DaBatDauEvent = 0;
	        	DestroyObject(ObjEvent);
			}
	    }
	}
}

task DieBoss[2000]()
{
    if(DaBatDauEvent == 1)
	{
	    if(TimeEvent > 0)
	    {
	        if(HealthEvent < 0)
	        {
	            SendClientMessageToAllEx(COLOR_YELLOW, "----------------------------------------------------------------.");
			    SendClientMessageToAllEx(COLOR_YELLOW, "BOSS DA BIET TIEU DIET , CHUNG MUNG NHUNG ANH HUNG DA CHIEN DAU'.");
			    SendClientMessageToAllEx(COLOR_YELLOW, "----------------------------------------------------------------.");

			    DaBatDauEvent = 0;
	        	DestroyObject(ObjEvent);
	        }
	    }
	}
}
//cuoi gm
CMD:startboss(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1338)
	{
	    if(DaBatDauEvent == 0)
	    {
		    new thongbao[1280];
		    format(thongbao, sizeof(thongbao), "{8000ff}Phia Ben {00ff00}%s{ffffff} {00fff9}Da Khoi Dong Tau Ngam Tan Cong.", GetPlayerNameEx(playerid));
		    SendClientMessageToAllEx(-1, thongbao);
		    SendClientMessageToAllEx(-1, "[{8000ff}Tau Ngam By Bayside] {00fff9}DA XUAT HIEN V2 , Hay Tieu Diet Tau Ngam  Bao Ve Thanh Pho {00ff38}SAN FIERRO.");
		    DaBatDauEvent = 1;

		    ObjEvent = CreateObject(9958, -1408.12524, 1003.56537, 8.34930,   0.00000, 0.00000, 0.24000);
			MoveObject(ObjEvent, -1412.00720, 564.18243, 8.34930, 1.0);

			HealthEvent = 50000;
			TimeEvent = 300;
		    return 1;
	    }else SendClientMessageEx(playerid, COLOR_GREEN, "Event dang duoc bat dau khong the bat dau tiep tuc. {00ff00}(( /ngungevent ))");
    }else SendClientMessageEx(playerid, COLOR_GREEN, "Ban khong the su dung lenh nay.");
	return 1;
}

CMD:ngungevent(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 99999)
	{
	    if(DaBatDauEvent == 1)
	    {
	        new thongbao[1280];
	        format(thongbao, sizeof(thongbao), "[{8000ff}Tau Ngam By Bayside] Ben Phia {00ff00}%s{ffffff} Da Rut Lui Cai Tien Tau Ngam.", GetPlayerNameEx(playerid));
	        SendClientMessageToAllEx(-1, thongbao);
	        DaBatDauEvent = 0;
	        DestroyObject(ObjEvent);
	        return 1;
	    }else SendClientMessageEx(playerid, COLOR_GREEN, "Event chua duoc bat dau. {00ff00}(( /startboss ))");
	}else SendClientMessageEx(playerid, COLOR_GREEN, "Ban khong the su dung lenh nay.");
	return 1;
}