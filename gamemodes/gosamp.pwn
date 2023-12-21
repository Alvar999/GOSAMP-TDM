#pragma warning disable 202,208,213,216,219,235,201,209,214 // ko sao
#pragma disablerecursion // vao code t xem
#define SERVER_GM_TEXT "GOSAMP.TOP"

#include <a_samp>
#include <a_mysql>	
#include <streamer>
#include <yom_buttons>
#include <ZCMD>
#include <sscanf2>
#include <foreach>
#include <OnPlayerTeleport>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <crashdetect>
#include <compat>
#if defined SOCKET_ENABLED
#include <socket>
#endif
#include "./includes/defines.pwn"
#include "./includes/enums.pwn"
#include "./includes/variables.pwn"
#include "./includes/timers.pwn"
#include "./includes/functions.pwn"
#include "./includes/commands.pwn"
#include "./includes/mysql.pwn"
#include "./includes/OnPlayerLoad.pwn"
#include "./includes/callbacks.pwn"
#include "./includes/textdraws.pwn"
#include "./includes/streamer.pwn"
#include "./includes/OnDialogResponse.pwn"
#include "./includes/repfam.pwn"
#include "./includes/DamageCheck.pwn"
#include "./includes/antigod.pwn"
#include "./includes/antihack.pwn"
#include "./includes/antisung.pwn"
#include "./includes/antishot.pwn"
#include "./includes/xoa.pwn"
#include "./includes/NCS.pwn"
#include "./includes/Nametags.pwn"
#include "./includes/Food.pwn"
#include "./includes/Speedo.pwn"
#include "./includes/CameraKos.pwn"
#include "./includes/CuopNha.pwn"
#include "./includes/PartyAI.pwn"
#include "./includes/hienten.pwn"


main() {}

public OnGameModeInit()
{
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
    Actorvipsf = CreateActor(171,1808.6239,-1567.3849,13.4681,236.0201);
   	ApplyActorAnimation(Actorvipsf, "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0);
	CreateDynamic3DTextLabel("{FF0000}[VIP LOCKER]\n{00FFFF}USE : [Y] De Tuong Tac", -1, 1808.6239,-1567.3849,13.4681+1.1,13.0);
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
