namespace wServer
{
    public enum PacketID : byte
    {
        FAILURE = 0, //slotid: 1
        CREATE_SUCCESS = 58, //slotid: 2
        CREATE = 48, //slotid: 3
        PLAYERSHOOT = 41, //slotid: 4
        MOVE = 24, //slotid: 5
        PLAYERTEXT = 9, //slotid: 6
        TEXT = 34, //slotid: 7
        SHOOT2 = 1, //slotid: 8
        DAMAGE = 52, //slotid: 9
        UPDATE = 44, //slotid: 10
        UPDATEACK = 96, //slotid: 11
        NOTIFICATION = 20, //slotid: 12
        NEW_TICK = 31, //slotid: 13
        INVSWAP = 64, //slotid: 14
        USEITEM = 3, //slotid: 15
        SHOW_EFFECT = 78, //slotid: 16
        HELLO = 86, //slotid: 17
        GOTO = 92, //slotid: 18
        INVDROP = 97, //slotid: 19
        INVRESULT = 18, //slotid: 20
        RECONNECT = 68, //slotid: 21
        PING = 8, //slotid: 22
        PONG = 83, //slotid: 23
        MAPINFO = 28, //slotid: 24
        LOAD = 63, //slotid: 25
        PIC = 88, //slotid: 26
        SETCONDITION = 36, //slotid: 27
        TELEPORT = 5, //slotid: 28
        USEPORTAL = 23, //slotid: 29
        DEATH = 12, //slotid: 30
        BUY = 77, //slotid: 31
        BUYRESULT = 56, //slotid: 32
        AOE = 7, //slotid: 33
        GROUNDDAMAGE = 84, //slotid: 34
        PLAYERHIT = 37, //slotid: 35
        ENEMYHIT = 94, //slotid: 36
        AOEACK = 89, //slotid: 37
        SHOOTACK = 10, //slotid: 38
        OTHERHIT = 6, //slotid: 39
        SQUAREHIT = 59, //slotid: 40
        GOTOACK = 99, //slotid: 41
        EDITACCOUNTLIST = 87, //slotid: 42
        ACCOUNTLIST = 53, //slotid: 43
        QUESTOBJID = 4, //slotid: 44
        CHOOSENAME = 25, //slotid: 45
        NAMERESULT = 62, //slotid: 46
        CREATEGUILD = 11, //slotid: 47
        CREATEGUILDRESULT = 95, //slotid: 48
        GUILDREMOVE = 75, //slotid: 49
        GUILDINVITE = 85, //slotid: 50
        ALLYSHOOT = 49, //slotid: 51
        SHOOT = 90, //slotid: 52
        REQUESTTRADE = 82, //slotid: 53
        TRADEREQUESTED = 51, //slotid: 54
        TRADESTART = 74, //slotid: 55
        CHANGETRADE = 101, //slotid: 56
        TRADECHANGED = 38, //slotid: 57
        ACCEPTTRADE = 26, //slotid: 58
        CANCELTRADE = 22, //slotid: 59
        TRADEDONE = 35, //slotid: 60
        TRADEACCEPTED = 100, //slotid: 61
        CLIENTSTAT = 57, //slotid: 62
        CHECKCREDITS = 27, //slotid: 63
        ESCAPE = 16, //slotid: 64
        FILE = 33, //slotid: 65
        INVITEDTOGUILD = 14, //slotid: 66
        JOINGUILD = 67, //slotid: 67
        CHANGEGUILDRANK = 81, //slotid: 68
        PLAYSOUND = 17, //slotid: 69
        GLOBAL_NOTIFICATION = 40, //slotid: 70
        RESKIN = 46, //slotid: 71
        NEWABILITYUNLOCKED = 76, //slotid: 75
        HATCHEGG = 30, //slotid: 79
        ENTER_ARENA = 45, //slotid: 80
        ENTER_TEST = 102,
        ENTER_WACKAMOLE = 103,
        ARENANEXTWAVE = 65, //slotid: 81
        ARENADEATH = 55, //slotid: 82
        LEAVEARENA = 15, //slotid: 83
        VERIFYEMAILDIALOG = 80, //slotid: 84
        RESKIN2 = 13, //slotid: 85
        PASSWORDPROMPT = 61, //slotid: 86
        VIEWQUESTS = 91, //slotid: 87
        TINKERQUEST = 98, //slotid: 88
        QUESTFETCHRESPONSE = 60, //slotid: 89
        QUESTREDEEMRESPONSE = 93, //slotid: 90
        KEY_INFO_REQUEST = 66,
        KEY_INFO_RESPONSE = 19,
        SwitchMusic = 104,
    }
}