#include <a_samp>
#define CURRENT_MESSAGES 4 /*
This the the amount of messages you have. This number must be the exact number at ALL times!
*/
#define MESSAGE_COLOR 0xFCC500 /*
This is the color you want your random messages to be
*/
#define MESSAGE_INTERVAL 90 /*
This is the amount of seconds between each randomly sent message.
*/
new RM[CURRENT_MESSAGES][128];
forward SendRandomMessage();
public OnFilterScriptInit()
{
        print("\n------------------------------------------");
        print(" Load BotSystem ... [Thanh cong] ");
        print("--------------------------------------------\n");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] Disscor Sever: https://discord.gg/sZKawzhC ");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] Server Duoc Thanh Lap By :  NgPhi Hung - Laur.[]  ");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] fb.com/groups/gosamp.top");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] Noi Khong Voi Hacking Tai GOSAMP.TOP");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] TDM Los Santos 2024 By GOSAMP.TOP");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] Keu Moi Nguoi Vao Choi Se Vui Hon Nhieu Nhe");
        AddRandomMessage("{00ffff}[GOSAMP.TOP] Ban Muon Chat Kenh The Gioi By GOSAMP.TOP vui long /sf chat noi dung vao");
        SetTimer("SendRandomMessage", MESSAGE_INTERVAL * 9000, 1);
        return 1;
}

public SendRandomMessage()
{
        static lastmessage = 0;
        new rand = random(CURRENT_MESSAGES);
        while(rand == lastmessage && CURRENT_MESSAGES != 1)     { rand = random(CURRENT_MESSAGES);  }
        lastmessage = rand;
        SendClientMessageToAll(MESSAGE_COLOR, RM[lastmessage]);
}

stock AddRandomMessage(text[])
{
        for(new m; m < CURRENT_MESSAGES; m++)
        {
            if(!strlen(RM[m]))
                {
                        strmid(RM[m], text, 0, 127);
                        return 1;
                }
        }
        return 0;
}
