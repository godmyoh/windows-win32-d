module windows.win32.system.eventnotificationservice;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PSTR, PWSTR;
import windows.win32.system.com : IDispatch;

version (Windows):
extern (Windows):

alias SENS_CONNECTION_TYPE = uint;
enum : uint
{
    CONNECTION_LAN = 0x00000000,
    CONNECTION_WAN = 0x00000001,
}

BOOL IsDestinationReachableA(const(char)* lpszDestination, QOCINFO* lpQOCInfo);
BOOL IsDestinationReachableW(const(wchar)* lpszDestination, QOCINFO* lpQOCInfo);
BOOL IsNetworkAlive(uint* lpdwFlags);
enum NETWORK_ALIVE_LAN = 0x00000001;
enum NETWORK_ALIVE_WAN = 0x00000002;
enum NETWORK_ALIVE_AOL = 0x00000004;
enum NETWORK_ALIVE_INTERNET = 0x00000008;
enum CONNECTION_AOL = 0x00000004;
enum SENSGUID_PUBLISHER = GUID(0x5fee1bd6, 0x5b9b, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
enum SENSGUID_SUBSCRIBER_LCE = GUID(0xd3938ab0, 0x5b9d, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
enum SENSGUID_SUBSCRIBER_WININET = GUID(0xd3938ab5, 0x5b9d, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
enum SENSGUID_EVENTCLASS_NETWORK = GUID(0xd5978620, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
enum SENSGUID_EVENTCLASS_LOGON = GUID(0xd5978630, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
enum SENSGUID_EVENTCLASS_ONNOW = GUID(0xd5978640, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
enum SENSGUID_EVENTCLASS_LOGON2 = GUID(0xd5978650, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
struct QOCINFO
{
    uint dwSize;
    uint dwFlags;
    uint dwInSpeed;
    uint dwOutSpeed;
}
struct SENS_QOCINFO
{
    uint dwSize;
    uint dwFlags;
    uint dwOutSpeed;
    uint dwInSpeed;
}
enum IID_ISensNetwork = GUID(0xd597bab1, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
interface ISensNetwork : IDispatch
{
    HRESULT ConnectionMade(BSTR bstrConnection, uint ulType, SENS_QOCINFO* lpQOCInfo);
    HRESULT ConnectionMadeNoQOCInfo(BSTR bstrConnection, uint ulType);
    HRESULT ConnectionLost(BSTR bstrConnection, SENS_CONNECTION_TYPE ulType);
    HRESULT DestinationReachable(BSTR bstrDestination, BSTR bstrConnection, uint ulType, SENS_QOCINFO* lpQOCInfo);
    HRESULT DestinationReachableNoQOCInfo(BSTR bstrDestination, BSTR bstrConnection, uint ulType);
}
enum IID_ISensOnNow = GUID(0xd597bab2, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
interface ISensOnNow : IDispatch
{
    HRESULT OnACPower();
    HRESULT OnBatteryPower(uint dwBatteryLifePercent);
    HRESULT BatteryLow(uint dwBatteryLifePercent);
}
enum IID_ISensLogon = GUID(0xd597bab3, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
interface ISensLogon : IDispatch
{
    HRESULT Logon(BSTR bstrUserName);
    HRESULT Logoff(BSTR bstrUserName);
    HRESULT StartShell(BSTR bstrUserName);
    HRESULT DisplayLock(BSTR bstrUserName);
    HRESULT DisplayUnlock(BSTR bstrUserName);
    HRESULT StartScreenSaver(BSTR bstrUserName);
    HRESULT StopScreenSaver(BSTR bstrUserName);
}
enum IID_ISensLogon2 = GUID(0xd597bab4, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
interface ISensLogon2 : IDispatch
{
    HRESULT Logon(BSTR bstrUserName, uint dwSessionId);
    HRESULT Logoff(BSTR bstrUserName, uint dwSessionId);
    HRESULT SessionDisconnect(BSTR bstrUserName, uint dwSessionId);
    HRESULT SessionReconnect(BSTR bstrUserName, uint dwSessionId);
    HRESULT PostShell(BSTR bstrUserName, uint dwSessionId);
}
enum CLSID_SENS = GUID(0xd597cafe, 0x5b9f, 0x11d1, [0x8d, 0xd2, 0x0, 0xaa, 0x0, 0x4a, 0xbd, 0x5e]);
struct SENS
{
}
