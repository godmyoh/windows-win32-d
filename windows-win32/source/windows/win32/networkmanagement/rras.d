module windows.win32.networkmanagement.rras;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, CHAR, FILETIME, HANDLE, HINSTANCE, HWND, LUID, PSTR, PWSTR;
import windows.win32.networkmanagement.iphelper : MIB_IPMCAST_MFE;
import windows.win32.networking.winsock : IN6_ADDR, IN_ADDR;
import windows.win32.security.cryptography : CRYPT_INTEGER_BLOB;

version (Windows):
extern (Windows):

alias MPR_INTERFACE_DIAL_MODE = uint;
enum : uint
{
    MPRDM_DialFirst    = 0x00000000,
    MPRDM_DialAll      = 0x00000001,
    MPRDM_DialAsNeeded = 0x00000002,
}

alias RASENTRY_DIAL_MODE = uint;
enum : uint
{
    RASEDM_DialAll      = 0x00000001,
    RASEDM_DialAsNeeded = 0x00000002,
}

alias RAS_FLAGS = uint;
enum : uint
{
    RAS_FLAGS_PPP_CONNECTION     = 0x00000001,
    RAS_FLAGS_MESSENGER_PRESENT  = 0x00000002,
    RAS_FLAGS_QUARANTINE_PRESENT = 0x00000008,
    RAS_FLAGS_ARAP_CONNECTION    = 0x00000010,
    RAS_FLAGS_IKEV2_CONNECTION   = 0x00000010,
    RAS_FLAGS_DORMANT            = 0x00000020,
}

alias MPR_ET = uint;
enum : uint
{
    MPR_ET_None       = 0x00000000,
    MPR_ET_Require    = 0x00000001,
    MPR_ET_RequireMax = 0x00000002,
    MPR_ET_Optional   = 0x00000003,
}

alias RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA = uint;
enum : uint
{
    RASLCPAD_CHAP_MD5  = 0x00000005,
    RASLCPAD_CHAP_MS   = 0x00000080,
    RASLCPAD_CHAP_MSV2 = 0x00000081,
}

alias PPP_LCP = uint;
enum : uint
{
    PPP_LCP_PAP  = 0x0000c023,
    PPP_LCP_CHAP = 0x0000c223,
    PPP_LCP_EAP  = 0x0000c227,
    PPP_LCP_SPAP = 0x0000c027,
}

alias RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL = uint;
enum : uint
{
    RASLCPAP_PAP  = 0x0000c023,
    RASLCPAP_SPAP = 0x0000c027,
    RASLCPAP_CHAP = 0x0000c223,
    RASLCPAP_EAP  = 0x0000c227,
}

alias PPP_LCP_INFO_AUTH_DATA = uint;
enum : uint
{
    PPP_LCP_CHAP_MD5  = 0x00000005,
    PPP_LCP_CHAP_MS   = 0x00000080,
    PPP_LCP_CHAP_MSV2 = 0x00000081,
}

alias RASIKEV_PROJECTION_INFO_FLAGS = uint;
enum : uint
{
    RASIKEv2_FLAGS_MOBIKESUPPORTED  = 0x00000001,
    RASIKEv2_FLAGS_BEHIND_NAT       = 0x00000002,
    RASIKEv2_FLAGS_SERVERBEHIND_NAT = 0x00000004,
}

alias MPR_VS = uint;
enum : uint
{
    MPR_VS_Default   = 0x00000000,
    MPR_VS_PptpOnly  = 0x00000001,
    MPR_VS_PptpFirst = 0x00000002,
    MPR_VS_L2tpOnly  = 0x00000003,
    MPR_VS_L2tpFirst = 0x00000004,
}

alias SECURITY_MESSAGE_MSG_ID = uint;
enum : uint
{
    SECURITYMSG_SUCCESS = 0x00000001,
    SECURITYMSG_FAILURE = 0x00000002,
    SECURITYMSG_ERROR   = 0x00000003,
}

uint RasDialA(RASDIALEXTENSIONS* param0, const(char)* param1, RASDIALPARAMSA* param2, uint param3, void* param4, HRASCONN* param5);
uint RasDialW(RASDIALEXTENSIONS* param0, const(wchar)* param1, RASDIALPARAMSW* param2, uint param3, void* param4, HRASCONN* param5);
uint RasEnumConnectionsA(RASCONNA* param0, uint* param1, uint* param2);
uint RasEnumConnectionsW(RASCONNW* param0, uint* param1, uint* param2);
uint RasEnumEntriesA(const(char)* param0, const(char)* param1, RASENTRYNAMEA* param2, uint* param3, uint* param4);
uint RasEnumEntriesW(const(wchar)* param0, const(wchar)* param1, RASENTRYNAMEW* param2, uint* param3, uint* param4);
uint RasGetConnectStatusA(HRASCONN param0, RASCONNSTATUSA* param1);
uint RasGetConnectStatusW(HRASCONN param0, RASCONNSTATUSW* param1);
uint RasGetErrorStringA(uint ResourceId, PSTR lpszString, uint InBufSize);
uint RasGetErrorStringW(uint ResourceId, PWSTR lpszString, uint InBufSize);
uint RasHangUpA(HRASCONN param0);
uint RasHangUpW(HRASCONN param0);
uint RasGetProjectionInfoA(HRASCONN param0, RASPROJECTION param1, void* param2, uint* param3);
uint RasGetProjectionInfoW(HRASCONN param0, RASPROJECTION param1, void* param2, uint* param3);
uint RasCreatePhonebookEntryA(HWND param0, const(char)* param1);
uint RasCreatePhonebookEntryW(HWND param0, const(wchar)* param1);
uint RasEditPhonebookEntryA(HWND param0, const(char)* param1, const(char)* param2);
uint RasEditPhonebookEntryW(HWND param0, const(wchar)* param1, const(wchar)* param2);
uint RasSetEntryDialParamsA(const(char)* param0, RASDIALPARAMSA* param1, BOOL param2);
uint RasSetEntryDialParamsW(const(wchar)* param0, RASDIALPARAMSW* param1, BOOL param2);
uint RasGetEntryDialParamsA(const(char)* param0, RASDIALPARAMSA* param1, BOOL* param2);
uint RasGetEntryDialParamsW(const(wchar)* param0, RASDIALPARAMSW* param1, BOOL* param2);
uint RasEnumDevicesA(RASDEVINFOA* param0, uint* param1, uint* param2);
uint RasEnumDevicesW(RASDEVINFOW* param0, uint* param1, uint* param2);
uint RasGetCountryInfoA(RASCTRYINFO* param0, uint* param1);
uint RasGetCountryInfoW(RASCTRYINFO* param0, uint* param1);
uint RasGetEntryPropertiesA(const(char)* param0, const(char)* param1, RASENTRYA* param2, uint* param3, ubyte* param4, uint* param5);
uint RasGetEntryPropertiesW(const(wchar)* param0, const(wchar)* param1, RASENTRYW* param2, uint* param3, ubyte* param4, uint* param5);
uint RasSetEntryPropertiesA(const(char)* param0, const(char)* param1, RASENTRYA* param2, uint param3, ubyte* param4, uint param5);
uint RasSetEntryPropertiesW(const(wchar)* param0, const(wchar)* param1, RASENTRYW* param2, uint param3, ubyte* param4, uint param5);
uint RasRenameEntryA(const(char)* param0, const(char)* param1, const(char)* param2);
uint RasRenameEntryW(const(wchar)* param0, const(wchar)* param1, const(wchar)* param2);
uint RasDeleteEntryA(const(char)* param0, const(char)* param1);
uint RasDeleteEntryW(const(wchar)* param0, const(wchar)* param1);
uint RasValidateEntryNameA(const(char)* param0, const(char)* param1);
uint RasValidateEntryNameW(const(wchar)* param0, const(wchar)* param1);
uint RasConnectionNotificationA(HRASCONN param0, HANDLE param1, uint param2);
uint RasConnectionNotificationW(HRASCONN param0, HANDLE param1, uint param2);
uint RasGetSubEntryHandleA(HRASCONN param0, uint param1, HRASCONN* param2);
uint RasGetSubEntryHandleW(HRASCONN param0, uint param1, HRASCONN* param2);
uint RasGetCredentialsA(const(char)* param0, const(char)* param1, RASCREDENTIALSA* param2);
uint RasGetCredentialsW(const(wchar)* param0, const(wchar)* param1, RASCREDENTIALSW* param2);
uint RasSetCredentialsA(const(char)* param0, const(char)* param1, RASCREDENTIALSA* param2, BOOL param3);
uint RasSetCredentialsW(const(wchar)* param0, const(wchar)* param1, RASCREDENTIALSW* param2, BOOL param3);
uint RasGetSubEntryPropertiesA(const(char)* param0, const(char)* param1, uint param2, RASSUBENTRYA* param3, uint* param4, ubyte* param5, uint* param6);
uint RasGetSubEntryPropertiesW(const(wchar)* param0, const(wchar)* param1, uint param2, RASSUBENTRYW* param3, uint* param4, ubyte* param5, uint* param6);
uint RasSetSubEntryPropertiesA(const(char)* param0, const(char)* param1, uint param2, RASSUBENTRYA* param3, uint param4, ubyte* param5, uint param6);
uint RasSetSubEntryPropertiesW(const(wchar)* param0, const(wchar)* param1, uint param2, RASSUBENTRYW* param3, uint param4, ubyte* param5, uint param6);
uint RasGetAutodialAddressA(const(char)* param0, uint* param1, RASAUTODIALENTRYA* param2, uint* param3, uint* param4);
uint RasGetAutodialAddressW(const(wchar)* param0, uint* param1, RASAUTODIALENTRYW* param2, uint* param3, uint* param4);
uint RasSetAutodialAddressA(const(char)* param0, uint param1, RASAUTODIALENTRYA* param2, uint param3, uint param4);
uint RasSetAutodialAddressW(const(wchar)* param0, uint param1, RASAUTODIALENTRYW* param2, uint param3, uint param4);
uint RasEnumAutodialAddressesA(PSTR* lppRasAutodialAddresses, uint* lpdwcbRasAutodialAddresses, uint* lpdwcRasAutodialAddresses);
uint RasEnumAutodialAddressesW(PWSTR* lppRasAutodialAddresses, uint* lpdwcbRasAutodialAddresses, uint* lpdwcRasAutodialAddresses);
uint RasGetAutodialEnableA(uint param0, BOOL* param1);
uint RasGetAutodialEnableW(uint param0, BOOL* param1);
uint RasSetAutodialEnableA(uint param0, BOOL param1);
uint RasSetAutodialEnableW(uint param0, BOOL param1);
uint RasGetAutodialParamA(uint param0, void* param1, uint* param2);
uint RasGetAutodialParamW(uint param0, void* param1, uint* param2);
uint RasSetAutodialParamA(uint param0, void* param1, uint param2);
uint RasSetAutodialParamW(uint param0, void* param1, uint param2);
uint RasGetPCscf(PWSTR lpszPCscf);
uint RasInvokeEapUI(HRASCONN param0, uint param1, RASDIALEXTENSIONS* param2, HWND param3);
uint RasGetLinkStatistics(HRASCONN hRasConn, uint dwSubEntry, RAS_STATS* lpStatistics);
uint RasGetConnectionStatistics(HRASCONN hRasConn, RAS_STATS* lpStatistics);
uint RasClearLinkStatistics(HRASCONN hRasConn, uint dwSubEntry);
uint RasClearConnectionStatistics(HRASCONN hRasConn);
uint RasGetEapUserDataA(HANDLE hToken, const(char)* pszPhonebook, const(char)* pszEntry, ubyte* pbEapData, uint* pdwSizeofEapData);
uint RasGetEapUserDataW(HANDLE hToken, const(wchar)* pszPhonebook, const(wchar)* pszEntry, ubyte* pbEapData, uint* pdwSizeofEapData);
uint RasSetEapUserDataA(HANDLE hToken, const(char)* pszPhonebook, const(char)* pszEntry, ubyte* pbEapData, uint dwSizeofEapData);
uint RasSetEapUserDataW(HANDLE hToken, const(wchar)* pszPhonebook, const(wchar)* pszEntry, ubyte* pbEapData, uint dwSizeofEapData);
uint RasGetCustomAuthDataA(const(char)* pszPhonebook, const(char)* pszEntry, ubyte* pbCustomAuthData, uint* pdwSizeofCustomAuthData);
uint RasGetCustomAuthDataW(const(wchar)* pszPhonebook, const(wchar)* pszEntry, ubyte* pbCustomAuthData, uint* pdwSizeofCustomAuthData);
uint RasSetCustomAuthDataA(const(char)* pszPhonebook, const(char)* pszEntry, ubyte* pbCustomAuthData, uint dwSizeofCustomAuthData);
uint RasSetCustomAuthDataW(const(wchar)* pszPhonebook, const(wchar)* pszEntry, ubyte* pbCustomAuthData, uint dwSizeofCustomAuthData);
uint RasGetEapUserIdentityW(const(wchar)* pszPhonebook, const(wchar)* pszEntry, uint dwFlags, HWND hwnd, RASEAPUSERIDENTITYW** ppRasEapUserIdentity);
uint RasGetEapUserIdentityA(const(char)* pszPhonebook, const(char)* pszEntry, uint dwFlags, HWND hwnd, RASEAPUSERIDENTITYA** ppRasEapUserIdentity);
void RasFreeEapUserIdentityW(RASEAPUSERIDENTITYW* pRasEapUserIdentity);
void RasFreeEapUserIdentityA(RASEAPUSERIDENTITYA* pRasEapUserIdentity);
uint RasDeleteSubEntryA(const(char)* pszPhonebook, const(char)* pszEntry, uint dwSubentryId);
uint RasDeleteSubEntryW(const(wchar)* pszPhonebook, const(wchar)* pszEntry, uint dwSubEntryId);
uint RasUpdateConnection(HRASCONN hrasconn, RASUPDATECONN* lprasupdateconn);
uint RasGetProjectionInfoEx(HRASCONN hrasconn, RAS_PROJECTION_INFO* pRasProjection, uint* lpdwSize);
BOOL RasPhonebookDlgA(PSTR lpszPhonebook, PSTR lpszEntry, RASPBDLGA* lpInfo);
BOOL RasPhonebookDlgW(PWSTR lpszPhonebook, PWSTR lpszEntry, RASPBDLGW* lpInfo);
BOOL RasEntryDlgA(PSTR lpszPhonebook, PSTR lpszEntry, RASENTRYDLGA* lpInfo);
BOOL RasEntryDlgW(PWSTR lpszPhonebook, PWSTR lpszEntry, RASENTRYDLGW* lpInfo);
BOOL RasDialDlgA(PSTR lpszPhonebook, PSTR lpszEntry, PSTR lpszPhoneNumber, RASDIALDLG* lpInfo);
BOOL RasDialDlgW(PWSTR lpszPhonebook, PWSTR lpszEntry, PWSTR lpszPhoneNumber, RASDIALDLG* lpInfo);
uint MprAdminConnectionEnumEx(long hRasServer, MPRAPI_OBJECT_HEADER* pObjectHeader, uint dwPreferedMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, RAS_CONNECTION_EX** ppRasConn, uint* lpdwResumeHandle);
uint MprAdminConnectionGetInfoEx(long hRasServer, HANDLE hRasConnection, RAS_CONNECTION_EX* pRasConnection);
uint MprAdminServerGetInfoEx(long hMprServer, MPR_SERVER_EX1* pServerInfo);
uint MprAdminServerSetInfoEx(long hMprServer, MPR_SERVER_SET_CONFIG_EX1* pServerInfo);
uint MprConfigServerGetInfoEx(HANDLE hMprConfig, MPR_SERVER_EX1* pServerInfo);
uint MprConfigServerSetInfoEx(HANDLE hMprConfig, MPR_SERVER_SET_CONFIG_EX1* pSetServerConfig);
uint MprAdminUpdateConnection(long hRasServer, HANDLE hRasConnection, RAS_UPDATE_CONNECTION* pRasUpdateConnection);
uint MprAdminIsServiceInitialized(PWSTR lpwsServerName, BOOL* fIsServiceInitialized);
uint MprAdminInterfaceSetCustomInfoEx(long hMprServer, HANDLE hInterface, MPR_IF_CUSTOMINFOEX2* pCustomInfo);
uint MprAdminInterfaceGetCustomInfoEx(long hMprServer, HANDLE hInterface, MPR_IF_CUSTOMINFOEX2* pCustomInfo);
uint MprConfigInterfaceGetCustomInfoEx(HANDLE hMprConfig, HANDLE hRouterInterface, MPR_IF_CUSTOMINFOEX2* pCustomInfo);
uint MprConfigInterfaceSetCustomInfoEx(HANDLE hMprConfig, HANDLE hRouterInterface, MPR_IF_CUSTOMINFOEX2* pCustomInfo);
uint MprAdminConnectionEnum(long hRasServer, uint dwLevel, ubyte** lplpbBuffer, uint dwPrefMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, uint* lpdwResumeHandle);
uint MprAdminPortEnum(long hRasServer, uint dwLevel, HANDLE hRasConnection, ubyte** lplpbBuffer, uint dwPrefMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, uint* lpdwResumeHandle);
uint MprAdminConnectionGetInfo(long hRasServer, uint dwLevel, HANDLE hRasConnection, ubyte** lplpbBuffer);
uint MprAdminPortGetInfo(long hRasServer, uint dwLevel, HANDLE hPort, ubyte** lplpbBuffer);
uint MprAdminConnectionClearStats(long hRasServer, HANDLE hRasConnection);
uint MprAdminPortClearStats(long hRasServer, HANDLE hPort);
uint MprAdminPortReset(long hRasServer, HANDLE hPort);
uint MprAdminPortDisconnect(long hRasServer, HANDLE hPort);
uint MprAdminConnectionRemoveQuarantine(HANDLE hRasServer, HANDLE hRasConnection, BOOL fIsIpAddress);
uint MprAdminUserGetInfo(const(wchar)* lpszServer, const(wchar)* lpszUser, uint dwLevel, ubyte* lpbBuffer);
uint MprAdminUserSetInfo(const(wchar)* lpszServer, const(wchar)* lpszUser, uint dwLevel, const(ubyte)* lpbBuffer);
uint MprAdminSendUserMessage(long hMprServer, HANDLE hConnection, PWSTR lpwszMessage);
uint MprAdminGetPDCServer(const(wchar)* lpszDomain, const(wchar)* lpszServer, PWSTR lpszPDCServer);
BOOL MprAdminIsServiceRunning(PWSTR lpwsServerName);
uint MprAdminServerConnect(PWSTR lpwsServerName, long* phMprServer);
void MprAdminServerDisconnect(long hMprServer);
uint MprAdminServerGetCredentials(long hMprServer, uint dwLevel, ubyte** lplpbBuffer);
uint MprAdminServerSetCredentials(long hMprServer, uint dwLevel, ubyte* lpbBuffer);
uint MprAdminBufferFree(void* pBuffer);
uint MprAdminGetErrorString(uint dwError, PWSTR* lplpwsErrorString);
uint MprAdminServerGetInfo(long hMprServer, uint dwLevel, ubyte** lplpbBuffer);
uint MprAdminServerSetInfo(long hMprServer, uint dwLevel, ubyte* lpbBuffer);
uint MprAdminEstablishDomainRasServer(PWSTR pszDomain, PWSTR pszMachine, BOOL bEnable);
uint MprAdminIsDomainRasServer(PWSTR pszDomain, PWSTR pszMachine, BOOL* pbIsRasServer);
uint MprAdminTransportCreate(long hMprServer, uint dwTransportId, PWSTR lpwsTransportName, ubyte* pGlobalInfo, uint dwGlobalInfoSize, ubyte* pClientInterfaceInfo, uint dwClientInterfaceInfoSize, PWSTR lpwsDLLPath);
uint MprAdminTransportSetInfo(long hMprServer, uint dwTransportId, ubyte* pGlobalInfo, uint dwGlobalInfoSize, ubyte* pClientInterfaceInfo, uint dwClientInterfaceInfoSize);
uint MprAdminTransportGetInfo(long hMprServer, uint dwTransportId, ubyte** ppGlobalInfo, uint* lpdwGlobalInfoSize, ubyte** ppClientInterfaceInfo, uint* lpdwClientInterfaceInfoSize);
uint MprAdminDeviceEnum(long hMprServer, uint dwLevel, ubyte** lplpbBuffer, uint* lpdwTotalEntries);
uint MprAdminInterfaceGetHandle(long hMprServer, PWSTR lpwsInterfaceName, HANDLE* phInterface, BOOL fIncludeClientInterfaces);
uint MprAdminInterfaceCreate(long hMprServer, uint dwLevel, ubyte* lpbBuffer, HANDLE* phInterface);
uint MprAdminInterfaceGetInfo(long hMprServer, HANDLE hInterface, uint dwLevel, ubyte** lplpbBuffer);
uint MprAdminInterfaceSetInfo(long hMprServer, HANDLE hInterface, uint dwLevel, ubyte* lpbBuffer);
uint MprAdminInterfaceDelete(long hMprServer, HANDLE hInterface);
uint MprAdminInterfaceDeviceGetInfo(long hMprServer, HANDLE hInterface, uint dwIndex, uint dwLevel, ubyte** lplpBuffer);
uint MprAdminInterfaceDeviceSetInfo(long hMprServer, HANDLE hInterface, uint dwIndex, uint dwLevel, ubyte* lpbBuffer);
uint MprAdminInterfaceTransportRemove(long hMprServer, HANDLE hInterface, uint dwTransportId);
uint MprAdminInterfaceTransportAdd(long hMprServer, HANDLE hInterface, uint dwTransportId, ubyte* pInterfaceInfo, uint dwInterfaceInfoSize);
uint MprAdminInterfaceTransportGetInfo(long hMprServer, HANDLE hInterface, uint dwTransportId, ubyte** ppInterfaceInfo, uint* lpdwInterfaceInfoSize);
uint MprAdminInterfaceTransportSetInfo(long hMprServer, HANDLE hInterface, uint dwTransportId, ubyte* pInterfaceInfo, uint dwInterfaceInfoSize);
uint MprAdminInterfaceEnum(long hMprServer, uint dwLevel, ubyte** lplpbBuffer, uint dwPrefMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, uint* lpdwResumeHandle);
uint MprAdminInterfaceSetCredentials(PWSTR lpwsServer, PWSTR lpwsInterfaceName, PWSTR lpwsUserName, PWSTR lpwsDomainName, PWSTR lpwsPassword);
uint MprAdminInterfaceGetCredentials(PWSTR lpwsServer, PWSTR lpwsInterfaceName, PWSTR lpwsUserName, PWSTR lpwsPassword, PWSTR lpwsDomainName);
uint MprAdminInterfaceSetCredentialsEx(long hMprServer, HANDLE hInterface, uint dwLevel, ubyte* lpbBuffer);
uint MprAdminInterfaceGetCredentialsEx(long hMprServer, HANDLE hInterface, uint dwLevel, ubyte** lplpbBuffer);
uint MprAdminInterfaceConnect(long hMprServer, HANDLE hInterface, HANDLE hEvent, BOOL fSynchronous);
uint MprAdminInterfaceDisconnect(long hMprServer, HANDLE hInterface);
uint MprAdminInterfaceUpdateRoutes(long hMprServer, HANDLE hInterface, uint dwProtocolId, HANDLE hEvent);
uint MprAdminInterfaceQueryUpdateResult(long hMprServer, HANDLE hInterface, uint dwProtocolId, uint* lpdwUpdateResult);
uint MprAdminInterfaceUpdatePhonebookInfo(long hMprServer, HANDLE hInterface);
uint MprAdminRegisterConnectionNotification(long hMprServer, HANDLE hEventNotification);
uint MprAdminDeregisterConnectionNotification(long hMprServer, HANDLE hEventNotification);
uint MprAdminMIBServerConnect(PWSTR lpwsServerName, long* phMibServer);
void MprAdminMIBServerDisconnect(long hMibServer);
uint MprAdminMIBEntryCreate(long hMibServer, uint dwPid, uint dwRoutingPid, void* lpEntry, uint dwEntrySize);
uint MprAdminMIBEntryDelete(long hMibServer, uint dwProtocolId, uint dwRoutingPid, void* lpEntry, uint dwEntrySize);
uint MprAdminMIBEntrySet(long hMibServer, uint dwProtocolId, uint dwRoutingPid, void* lpEntry, uint dwEntrySize);
uint MprAdminMIBEntryGet(long hMibServer, uint dwProtocolId, uint dwRoutingPid, void* lpInEntry, uint dwInEntrySize, void** lplpOutEntry, uint* lpOutEntrySize);
uint MprAdminMIBEntryGetFirst(long hMibServer, uint dwProtocolId, uint dwRoutingPid, void* lpInEntry, uint dwInEntrySize, void** lplpOutEntry, uint* lpOutEntrySize);
uint MprAdminMIBEntryGetNext(long hMibServer, uint dwProtocolId, uint dwRoutingPid, void* lpInEntry, uint dwInEntrySize, void** lplpOutEntry, uint* lpOutEntrySize);
uint MprAdminMIBBufferFree(void* pBuffer);
uint MprConfigServerInstall(uint dwLevel, void* pBuffer);
uint MprConfigServerConnect(PWSTR lpwsServerName, HANDLE* phMprConfig);
void MprConfigServerDisconnect(HANDLE hMprConfig);
uint MprConfigServerRefresh(HANDLE hMprConfig);
uint MprConfigBufferFree(void* pBuffer);
uint MprConfigServerGetInfo(HANDLE hMprConfig, uint dwLevel, ubyte** lplpbBuffer);
uint MprConfigServerSetInfo(long hMprServer, uint dwLevel, ubyte* lpbBuffer);
uint MprConfigServerBackup(HANDLE hMprConfig, PWSTR lpwsPath);
uint MprConfigServerRestore(HANDLE hMprConfig, PWSTR lpwsPath);
uint MprConfigTransportCreate(HANDLE hMprConfig, uint dwTransportId, PWSTR lpwsTransportName, ubyte* pGlobalInfo, uint dwGlobalInfoSize, ubyte* pClientInterfaceInfo, uint dwClientInterfaceInfoSize, PWSTR lpwsDLLPath, HANDLE* phRouterTransport);
uint MprConfigTransportDelete(HANDLE hMprConfig, HANDLE hRouterTransport);
uint MprConfigTransportGetHandle(HANDLE hMprConfig, uint dwTransportId, HANDLE* phRouterTransport);
uint MprConfigTransportSetInfo(HANDLE hMprConfig, HANDLE hRouterTransport, ubyte* pGlobalInfo, uint dwGlobalInfoSize, ubyte* pClientInterfaceInfo, uint dwClientInterfaceInfoSize, PWSTR lpwsDLLPath);
uint MprConfigTransportGetInfo(HANDLE hMprConfig, HANDLE hRouterTransport, ubyte** ppGlobalInfo, uint* lpdwGlobalInfoSize, ubyte** ppClientInterfaceInfo, uint* lpdwClientInterfaceInfoSize, PWSTR* lplpwsDLLPath);
uint MprConfigTransportEnum(HANDLE hMprConfig, uint dwLevel, ubyte** lplpBuffer, uint dwPrefMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, uint* lpdwResumeHandle);
uint MprConfigInterfaceCreate(HANDLE hMprConfig, uint dwLevel, ubyte* lpbBuffer, HANDLE* phRouterInterface);
uint MprConfigInterfaceDelete(HANDLE hMprConfig, HANDLE hRouterInterface);
uint MprConfigInterfaceGetHandle(HANDLE hMprConfig, PWSTR lpwsInterfaceName, HANDLE* phRouterInterface);
uint MprConfigInterfaceGetInfo(HANDLE hMprConfig, HANDLE hRouterInterface, uint dwLevel, ubyte** lplpBuffer, uint* lpdwBufferSize);
uint MprConfigInterfaceSetInfo(HANDLE hMprConfig, HANDLE hRouterInterface, uint dwLevel, ubyte* lpbBuffer);
uint MprConfigInterfaceEnum(HANDLE hMprConfig, uint dwLevel, ubyte** lplpBuffer, uint dwPrefMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, uint* lpdwResumeHandle);
uint MprConfigInterfaceTransportAdd(HANDLE hMprConfig, HANDLE hRouterInterface, uint dwTransportId, PWSTR lpwsTransportName, ubyte* pInterfaceInfo, uint dwInterfaceInfoSize, HANDLE* phRouterIfTransport);
uint MprConfigInterfaceTransportRemove(HANDLE hMprConfig, HANDLE hRouterInterface, HANDLE hRouterIfTransport);
uint MprConfigInterfaceTransportGetHandle(HANDLE hMprConfig, HANDLE hRouterInterface, uint dwTransportId, HANDLE* phRouterIfTransport);
uint MprConfigInterfaceTransportGetInfo(HANDLE hMprConfig, HANDLE hRouterInterface, HANDLE hRouterIfTransport, ubyte** ppInterfaceInfo, uint* lpdwInterfaceInfoSize);
uint MprConfigInterfaceTransportSetInfo(HANDLE hMprConfig, HANDLE hRouterInterface, HANDLE hRouterIfTransport, ubyte* pInterfaceInfo, uint dwInterfaceInfoSize);
uint MprConfigInterfaceTransportEnum(HANDLE hMprConfig, HANDLE hRouterInterface, uint dwLevel, ubyte** lplpBuffer, uint dwPrefMaxLen, uint* lpdwEntriesRead, uint* lpdwTotalEntries, uint* lpdwResumeHandle);
uint MprConfigGetFriendlyName(HANDLE hMprConfig, PWSTR pszGuidName, PWSTR pszBuffer, uint dwBufferSize);
uint MprConfigGetGuidName(HANDLE hMprConfig, PWSTR pszFriendlyName, PWSTR pszBuffer, uint dwBufferSize);
uint MprConfigFilterGetInfo(HANDLE hMprConfig, uint dwLevel, uint dwTransportId, ubyte* lpBuffer);
uint MprConfigFilterSetInfo(HANDLE hMprConfig, uint dwLevel, uint dwTransportId, ubyte* lpBuffer);
uint MprInfoCreate(uint dwVersion, void** lplpNewHeader);
uint MprInfoDelete(void* lpHeader);
uint MprInfoRemoveAll(void* lpHeader, void** lplpNewHeader);
uint MprInfoDuplicate(void* lpHeader, void** lplpNewHeader);
uint MprInfoBlockAdd(void* lpHeader, uint dwInfoType, uint dwItemSize, uint dwItemCount, ubyte* lpItemData, void** lplpNewHeader);
uint MprInfoBlockRemove(void* lpHeader, uint dwInfoType, void** lplpNewHeader);
uint MprInfoBlockSet(void* lpHeader, uint dwInfoType, uint dwItemSize, uint dwItemCount, ubyte* lpItemData, void** lplpNewHeader);
uint MprInfoBlockFind(void* lpHeader, uint dwInfoType, uint* lpdwItemSize, uint* lpdwItemCount, ubyte** lplpItemData);
uint MprInfoBlockQuerySize(void* lpHeader);
uint MgmRegisterMProtocol(ROUTING_PROTOCOL_CONFIG* prpiInfo, uint dwProtocolId, uint dwComponentId, HANDLE* phProtocol);
uint MgmDeRegisterMProtocol(HANDLE hProtocol);
uint MgmTakeInterfaceOwnership(HANDLE hProtocol, uint dwIfIndex, uint dwIfNextHopAddr);
uint MgmReleaseInterfaceOwnership(HANDLE hProtocol, uint dwIfIndex, uint dwIfNextHopAddr);
uint MgmGetProtocolOnInterface(uint dwIfIndex, uint dwIfNextHopAddr, uint* pdwIfProtocolId, uint* pdwIfComponentId);
uint MgmAddGroupMembershipEntry(HANDLE hProtocol, uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint dwIfIndex, uint dwIfNextHopIPAddr, uint dwFlags);
uint MgmDeleteGroupMembershipEntry(HANDLE hProtocol, uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint dwIfIndex, uint dwIfNextHopIPAddr, uint dwFlags);
uint MgmGetMfe(MIB_IPMCAST_MFE* pimm, uint* pdwBufferSize, ubyte* pbBuffer);
uint MgmGetFirstMfe(uint* pdwBufferSize, ubyte* pbBuffer, uint* pdwNumEntries);
uint MgmGetNextMfe(MIB_IPMCAST_MFE* pimmStart, uint* pdwBufferSize, ubyte* pbBuffer, uint* pdwNumEntries);
uint MgmGetMfeStats(MIB_IPMCAST_MFE* pimm, uint* pdwBufferSize, ubyte* pbBuffer, uint dwFlags);
uint MgmGetFirstMfeStats(uint* pdwBufferSize, ubyte* pbBuffer, uint* pdwNumEntries, uint dwFlags);
uint MgmGetNextMfeStats(MIB_IPMCAST_MFE* pimmStart, uint* pdwBufferSize, ubyte* pbBuffer, uint* pdwNumEntries, uint dwFlags);
uint MgmGroupEnumerationStart(HANDLE hProtocol, MGM_ENUM_TYPES metEnumType, HANDLE* phEnumHandle);
uint MgmGroupEnumerationGetNext(HANDLE hEnum, uint* pdwBufferSize, ubyte* pbBuffer, uint* pdwNumEntries);
uint MgmGroupEnumerationEnd(HANDLE hEnum);
uint RtmConvertNetAddressToIpv6AddressAndLength(RTM_NET_ADDRESS* pNetAddress, IN6_ADDR* pAddress, uint* pLength, uint dwAddressSize);
uint RtmConvertIpv6AddressAndLengthToNetAddress(RTM_NET_ADDRESS* pNetAddress, IN6_ADDR Address, uint dwLength, uint dwAddressSize);
uint RtmRegisterEntity(RTM_ENTITY_INFO* RtmEntityInfo, RTM_ENTITY_EXPORT_METHODS* ExportMethods, RTM_EVENT_CALLBACK EventCallback, BOOL ReserveOpaquePointer, RTM_REGN_PROFILE* RtmRegProfile, long* RtmRegHandle);
uint RtmDeregisterEntity(long RtmRegHandle);
uint RtmGetRegisteredEntities(long RtmRegHandle, uint* NumEntities, long* EntityHandles, RTM_ENTITY_INFO* EntityInfos);
uint RtmReleaseEntities(long RtmRegHandle, uint NumEntities, long* EntityHandles);
uint RtmLockDestination(long RtmRegHandle, long DestHandle, BOOL Exclusive, BOOL LockDest);
uint RtmGetOpaqueInformationPointer(long RtmRegHandle, long DestHandle, void** OpaqueInfoPointer);
uint RtmGetEntityMethods(long RtmRegHandle, long EntityHandle, uint* NumMethods, RTM_ENTITY_EXPORT_METHOD* ExptMethods);
uint RtmInvokeMethod(long RtmRegHandle, long EntityHandle, RTM_ENTITY_METHOD_INPUT* Input, uint* OutputSize, RTM_ENTITY_METHOD_OUTPUT* Output);
uint RtmBlockMethods(long RtmRegHandle, HANDLE TargetHandle, ubyte TargetType, uint BlockingFlag);
uint RtmGetEntityInfo(long RtmRegHandle, long EntityHandle, RTM_ENTITY_INFO* EntityInfo);
uint RtmGetDestInfo(long RtmRegHandle, long DestHandle, uint ProtocolId, uint TargetViews, RTM_DEST_INFO* DestInfo);
uint RtmGetRouteInfo(long RtmRegHandle, long RouteHandle, RTM_ROUTE_INFO* RouteInfo, RTM_NET_ADDRESS* DestAddress);
uint RtmGetNextHopInfo(long RtmRegHandle, long NextHopHandle, RTM_NEXTHOP_INFO* NextHopInfo);
uint RtmReleaseEntityInfo(long RtmRegHandle, RTM_ENTITY_INFO* EntityInfo);
uint RtmReleaseDestInfo(long RtmRegHandle, RTM_DEST_INFO* DestInfo);
uint RtmReleaseRouteInfo(long RtmRegHandle, RTM_ROUTE_INFO* RouteInfo);
uint RtmReleaseNextHopInfo(long RtmRegHandle, RTM_NEXTHOP_INFO* NextHopInfo);
uint RtmAddRouteToDest(long RtmRegHandle, long* RouteHandle, RTM_NET_ADDRESS* DestAddress, RTM_ROUTE_INFO* RouteInfo, uint TimeToLive, long RouteListHandle, uint NotifyType, long NotifyHandle, uint* ChangeFlags);
uint RtmDeleteRouteToDest(long RtmRegHandle, long RouteHandle, uint* ChangeFlags);
uint RtmHoldDestination(long RtmRegHandle, long DestHandle, uint TargetViews, uint HoldTime);
uint RtmGetRoutePointer(long RtmRegHandle, long RouteHandle, RTM_ROUTE_INFO** RoutePointer);
uint RtmLockRoute(long RtmRegHandle, long RouteHandle, BOOL Exclusive, BOOL LockRoute, RTM_ROUTE_INFO** RoutePointer);
uint RtmUpdateAndUnlockRoute(long RtmRegHandle, long RouteHandle, uint TimeToLive, long RouteListHandle, uint NotifyType, long NotifyHandle, uint* ChangeFlags);
uint RtmGetExactMatchDestination(long RtmRegHandle, RTM_NET_ADDRESS* DestAddress, uint ProtocolId, uint TargetViews, RTM_DEST_INFO* DestInfo);
uint RtmGetMostSpecificDestination(long RtmRegHandle, RTM_NET_ADDRESS* DestAddress, uint ProtocolId, uint TargetViews, RTM_DEST_INFO* DestInfo);
uint RtmGetLessSpecificDestination(long RtmRegHandle, long DestHandle, uint ProtocolId, uint TargetViews, RTM_DEST_INFO* DestInfo);
uint RtmGetExactMatchRoute(long RtmRegHandle, RTM_NET_ADDRESS* DestAddress, uint MatchingFlags, RTM_ROUTE_INFO* RouteInfo, uint InterfaceIndex, uint TargetViews, long* RouteHandle);
uint RtmIsBestRoute(long RtmRegHandle, long RouteHandle, uint* BestInViews);
uint RtmAddNextHop(long RtmRegHandle, RTM_NEXTHOP_INFO* NextHopInfo, long* NextHopHandle, uint* ChangeFlags);
uint RtmFindNextHop(long RtmRegHandle, RTM_NEXTHOP_INFO* NextHopInfo, long* NextHopHandle, RTM_NEXTHOP_INFO** NextHopPointer);
uint RtmDeleteNextHop(long RtmRegHandle, long NextHopHandle, RTM_NEXTHOP_INFO* NextHopInfo);
uint RtmGetNextHopPointer(long RtmRegHandle, long NextHopHandle, RTM_NEXTHOP_INFO** NextHopPointer);
uint RtmLockNextHop(long RtmRegHandle, long NextHopHandle, BOOL Exclusive, BOOL LockNextHop, RTM_NEXTHOP_INFO** NextHopPointer);
uint RtmCreateDestEnum(long RtmRegHandle, uint TargetViews, uint EnumFlags, RTM_NET_ADDRESS* NetAddress, uint ProtocolId, long* RtmEnumHandle);
uint RtmGetEnumDests(long RtmRegHandle, long EnumHandle, uint* NumDests, RTM_DEST_INFO* DestInfos);
uint RtmReleaseDests(long RtmRegHandle, uint NumDests, RTM_DEST_INFO* DestInfos);
uint RtmCreateRouteEnum(long RtmRegHandle, long DestHandle, uint TargetViews, uint EnumFlags, RTM_NET_ADDRESS* StartDest, uint MatchingFlags, RTM_ROUTE_INFO* CriteriaRoute, uint CriteriaInterface, long* RtmEnumHandle);
uint RtmGetEnumRoutes(long RtmRegHandle, long EnumHandle, uint* NumRoutes, long* RouteHandles);
uint RtmReleaseRoutes(long RtmRegHandle, uint NumRoutes, long* RouteHandles);
uint RtmCreateNextHopEnum(long RtmRegHandle, uint EnumFlags, RTM_NET_ADDRESS* NetAddress, long* RtmEnumHandle);
uint RtmGetEnumNextHops(long RtmRegHandle, long EnumHandle, uint* NumNextHops, long* NextHopHandles);
uint RtmReleaseNextHops(long RtmRegHandle, uint NumNextHops, long* NextHopHandles);
uint RtmDeleteEnumHandle(long RtmRegHandle, long EnumHandle);
uint RtmRegisterForChangeNotification(long RtmRegHandle, uint TargetViews, uint NotifyFlags, void* NotifyContext, long* NotifyHandle);
uint RtmGetChangedDests(long RtmRegHandle, long NotifyHandle, uint* NumDests, RTM_DEST_INFO* ChangedDests);
uint RtmReleaseChangedDests(long RtmRegHandle, long NotifyHandle, uint NumDests, RTM_DEST_INFO* ChangedDests);
uint RtmIgnoreChangedDests(long RtmRegHandle, long NotifyHandle, uint NumDests, long* ChangedDests);
uint RtmGetChangeStatus(long RtmRegHandle, long NotifyHandle, long DestHandle, BOOL* ChangeStatus);
uint RtmMarkDestForChangeNotification(long RtmRegHandle, long NotifyHandle, long DestHandle, BOOL MarkDest);
uint RtmIsMarkedForChangeNotification(long RtmRegHandle, long NotifyHandle, long DestHandle, BOOL* DestMarked);
uint RtmDeregisterFromChangeNotification(long RtmRegHandle, long NotifyHandle);
uint RtmCreateRouteList(long RtmRegHandle, long* RouteListHandle);
uint RtmInsertInRouteList(long RtmRegHandle, long RouteListHandle, uint NumRoutes, long* RouteHandles);
uint RtmCreateRouteListEnum(long RtmRegHandle, long RouteListHandle, long* RtmEnumHandle);
uint RtmGetListEnumRoutes(long RtmRegHandle, long EnumHandle, uint* NumRoutes, long* RouteHandles);
uint RtmDeleteRouteList(long RtmRegHandle, long RouteListHandle);
uint RtmReferenceHandles(long RtmRegHandle, uint NumHandles, HANDLE* RtmHandles);
enum RASNAP_ProbationTime = 0x00000001;
enum RASTUNNELENDPOINT_UNKNOWN = 0x00000000;
enum RASTUNNELENDPOINT_IPv4 = 0x00000001;
enum RASTUNNELENDPOINT_IPv6 = 0x00000002;
enum RAS_MaxDeviceType = 0x00000010;
enum RAS_MaxPhoneNumber = 0x00000080;
enum RAS_MaxIpAddress = 0x0000000f;
enum RAS_MaxIpxAddress = 0x00000015;
enum RAS_MaxEntryName = 0x00000100;
enum RAS_MaxDeviceName = 0x00000080;
enum RAS_MaxCallbackNumber = 0x00000080;
enum RAS_MaxAreaCode = 0x0000000a;
enum RAS_MaxPadType = 0x00000020;
enum RAS_MaxX25Address = 0x000000c8;
enum RAS_MaxFacilities = 0x000000c8;
enum RAS_MaxUserData = 0x000000c8;
enum RAS_MaxReplyMessage = 0x00000400;
enum RAS_MaxDnsSuffix = 0x00000100;
enum RASCF_AllUsers = 0x00000001;
enum RASCF_GlobalCreds = 0x00000002;
enum RASCF_OwnerKnown = 0x00000004;
enum RASCF_OwnerMatch = 0x00000008;
enum RAS_MaxIDSize = 0x00000100;
enum RASCS_PAUSED = 0x00001000;
enum RASCS_DONE = 0x00002000;
enum RASCSS_DONE = 0x00002000;
enum RDEOPT_UsePrefixSuffix = 0x00000001;
enum RDEOPT_PausedStates = 0x00000002;
enum RDEOPT_IgnoreModemSpeaker = 0x00000004;
enum RDEOPT_SetModemSpeaker = 0x00000008;
enum RDEOPT_IgnoreSoftwareCompression = 0x00000010;
enum RDEOPT_SetSoftwareCompression = 0x00000020;
enum RDEOPT_DisableConnectedUI = 0x00000040;
enum RDEOPT_DisableReconnectUI = 0x00000080;
enum RDEOPT_DisableReconnect = 0x00000100;
enum RDEOPT_NoUser = 0x00000200;
enum RDEOPT_PauseOnScript = 0x00000400;
enum RDEOPT_Router = 0x00000800;
enum RDEOPT_CustomDial = 0x00001000;
enum RDEOPT_UseCustomScripting = 0x00002000;
enum RDEOPT_InvokeAutoTriggerCredentialUI = 0x00004000;
enum RDEOPT_EapInfoCryptInCapable = 0x00008000;
enum REN_User = 0x00000000;
enum REN_AllUsers = 0x00000001;
enum RASIPO_VJ = 0x00000001;
enum RASLCPO_PFC = 0x00000001;
enum RASLCPO_ACFC = 0x00000002;
enum RASLCPO_SSHF = 0x00000004;
enum RASLCPO_DES_56 = 0x00000008;
enum RASLCPO_3_DES = 0x00000010;
enum RASLCPO_AES_128 = 0x00000020;
enum RASLCPO_AES_256 = 0x00000040;
enum RASLCPO_AES_192 = 0x00000080;
enum RASLCPO_GCM_AES_128 = 0x00000100;
enum RASLCPO_GCM_AES_192 = 0x00000200;
enum RASLCPO_GCM_AES_256 = 0x00000400;
enum RASCCPCA_MPPC = 0x00000006;
enum RASCCPCA_STAC = 0x00000005;
enum RASCCPO_Compression = 0x00000001;
enum RASCCPO_HistoryLess = 0x00000002;
enum RASCCPO_Encryption56bit = 0x00000010;
enum RASCCPO_Encryption40bit = 0x00000020;
enum RASCCPO_Encryption128bit = 0x00000040;
enum RASIKEv2_AUTH_MACHINECERTIFICATES = 0x00000001;
enum RASIKEv2_AUTH_EAP = 0x00000002;
enum RASIKEv2_AUTH_PSK = 0x00000003;
enum RASDIALEVENT = "RasDialEvent";
enum WM_RASDIALEVENT = 0x0000cccd;
enum ET_None = 0x00000000;
enum ET_Require = 0x00000001;
enum ET_RequireMax = 0x00000002;
enum ET_Optional = 0x00000003;
enum VS_Default = 0x00000000;
enum VS_PptpOnly = 0x00000001;
enum VS_PptpFirst = 0x00000002;
enum VS_L2tpOnly = 0x00000003;
enum VS_L2tpFirst = 0x00000004;
enum VS_SstpOnly = 0x00000005;
enum VS_SstpFirst = 0x00000006;
enum VS_Ikev2Only = 0x00000007;
enum VS_Ikev2First = 0x00000008;
enum VS_GREOnly = 0x00000009;
enum VS_PptpSstp = 0x0000000c;
enum VS_L2tpSstp = 0x0000000d;
enum VS_Ikev2Sstp = 0x0000000e;
enum VS_ProtocolList = 0x0000000f;
enum RASEO_UseCountryAndAreaCodes = 0x00000001;
enum RASEO_SpecificIpAddr = 0x00000002;
enum RASEO_SpecificNameServers = 0x00000004;
enum RASEO_IpHeaderCompression = 0x00000008;
enum RASEO_RemoteDefaultGateway = 0x00000010;
enum RASEO_DisableLcpExtensions = 0x00000020;
enum RASEO_TerminalBeforeDial = 0x00000040;
enum RASEO_TerminalAfterDial = 0x00000080;
enum RASEO_ModemLights = 0x00000100;
enum RASEO_SwCompression = 0x00000200;
enum RASEO_RequireEncryptedPw = 0x00000400;
enum RASEO_RequireMsEncryptedPw = 0x00000800;
enum RASEO_RequireDataEncryption = 0x00001000;
enum RASEO_NetworkLogon = 0x00002000;
enum RASEO_UseLogonCredentials = 0x00004000;
enum RASEO_PromoteAlternates = 0x00008000;
enum RASEO_SecureLocalFiles = 0x00010000;
enum RASEO_RequireEAP = 0x00020000;
enum RASEO_RequirePAP = 0x00040000;
enum RASEO_RequireSPAP = 0x00080000;
enum RASEO_Custom = 0x00100000;
enum RASEO_PreviewPhoneNumber = 0x00200000;
enum RASEO_SharedPhoneNumbers = 0x00800000;
enum RASEO_PreviewUserPw = 0x01000000;
enum RASEO_PreviewDomain = 0x02000000;
enum RASEO_ShowDialingProgress = 0x04000000;
enum RASEO_RequireCHAP = 0x08000000;
enum RASEO_RequireMsCHAP = 0x10000000;
enum RASEO_RequireMsCHAP2 = 0x20000000;
enum RASEO_RequireW95MSCHAP = 0x40000000;
enum RASEO_CustomScript = 0x80000000;
enum RASEO2_SecureFileAndPrint = 0x00000001;
enum RASEO2_SecureClientForMSNet = 0x00000002;
enum RASEO2_DontNegotiateMultilink = 0x00000004;
enum RASEO2_DontUseRasCredentials = 0x00000008;
enum RASEO2_UsePreSharedKey = 0x00000010;
enum RASEO2_Internet = 0x00000020;
enum RASEO2_DisableNbtOverIP = 0x00000040;
enum RASEO2_UseGlobalDeviceSettings = 0x00000080;
enum RASEO2_ReconnectIfDropped = 0x00000100;
enum RASEO2_SharePhoneNumbers = 0x00000200;
enum RASEO2_SecureRoutingCompartment = 0x00000400;
enum RASEO2_UseTypicalSettings = 0x00000800;
enum RASEO2_IPv6SpecificNameServers = 0x00001000;
enum RASEO2_IPv6RemoteDefaultGateway = 0x00002000;
enum RASEO2_RegisterIpWithDNS = 0x00004000;
enum RASEO2_UseDNSSuffixForRegistration = 0x00008000;
enum RASEO2_IPv4ExplicitMetric = 0x00010000;
enum RASEO2_IPv6ExplicitMetric = 0x00020000;
enum RASEO2_DisableIKENameEkuCheck = 0x00040000;
enum RASEO2_DisableClassBasedStaticRoute = 0x00080000;
enum RASEO2_SpecificIPv6Addr = 0x00100000;
enum RASEO2_DisableMobility = 0x00200000;
enum RASEO2_RequireMachineCertificates = 0x00400000;
enum RASEO2_UsePreSharedKeyForIkev2Initiator = 0x00800000;
enum RASEO2_UsePreSharedKeyForIkev2Responder = 0x01000000;
enum RASEO2_CacheCredentials = 0x02000000;
enum RASEO2_AutoTriggerCapable = 0x04000000;
enum RASEO2_IsThirdPartyProfile = 0x08000000;
enum RASEO2_AuthTypeIsOtp = 0x10000000;
enum RASEO2_IsAlwaysOn = 0x20000000;
enum RASEO2_IsPrivateNetwork = 0x40000000;
enum RASEO2_PlumbIKEv2TSAsRoutes = 0x80000000;
enum RASNP_NetBEUI = 0x00000001;
enum RASNP_Ipx = 0x00000002;
enum RASNP_Ip = 0x00000004;
enum RASNP_Ipv6 = 0x00000008;
enum RASFP_Ppp = 0x00000001;
enum RASFP_Slip = 0x00000002;
enum RASFP_Ras = 0x00000004;
enum RASDT_Modem = "modem";
enum RASDT_Isdn = "isdn";
enum RASDT_X25 = "x25";
enum RASDT_Vpn = "vpn";
enum RASDT_Pad = "pad";
enum RASDT_Generic = "GENERIC";
enum RASDT_Serial = "SERIAL";
enum RASDT_FrameRelay = "FRAMERELAY";
enum RASDT_Atm = "ATM";
enum RASDT_Sonet = "SONET";
enum RASDT_SW56 = "SW56";
enum RASDT_Irda = "IRDA";
enum RASDT_Parallel = "PARALLEL";
enum RASDT_PPPoE = "PPPoE";
enum RASET_Phone = 0x00000001;
enum RASET_Vpn = 0x00000002;
enum RASET_Direct = 0x00000003;
enum RASET_Internet = 0x00000004;
enum RASET_Broadband = 0x00000005;
enum RASCN_Connection = 0x00000001;
enum RASCN_Disconnection = 0x00000002;
enum RASCN_BandwidthAdded = 0x00000004;
enum RASCN_BandwidthRemoved = 0x00000008;
enum RASCN_Dormant = 0x00000010;
enum RASCN_ReConnection = 0x00000020;
enum RASCN_EPDGPacketArrival = 0x00000040;
enum RASIDS_Disabled = 0xffffffff;
enum RASIDS_UseGlobalValue = 0x00000000;
enum RASADFLG_PositionDlg = 0x00000001;
enum RASCM_UserName = 0x00000001;
enum RASCM_Password = 0x00000002;
enum RASCM_Domain = 0x00000004;
enum RASCM_DefaultCreds = 0x00000008;
enum RASCM_PreSharedKey = 0x00000010;
enum RASCM_ServerPreSharedKey = 0x00000020;
enum RASCM_DDMPreSharedKey = 0x00000040;
enum RASADP_DisableConnectionQuery = 0x00000000;
enum RASADP_LoginSessionDisable = 0x00000001;
enum RASADP_SavedAddressesLimit = 0x00000002;
enum RASADP_FailedConnectionTimeout = 0x00000003;
enum RASADP_ConnectionQueryTimeout = 0x00000004;
enum RASEAPF_NonInteractive = 0x00000002;
enum RASEAPF_Logon = 0x00000004;
enum RASEAPF_Preview = 0x00000008;
enum RCD_SingleUser = 0x00000000;
enum RCD_AllUsers = 0x00000001;
enum RCD_Eap = 0x00000002;
enum RCD_Logon = 0x00000004;
enum RASPBDEVENT_AddEntry = 0x00000001;
enum RASPBDEVENT_EditEntry = 0x00000002;
enum RASPBDEVENT_RemoveEntry = 0x00000003;
enum RASPBDEVENT_DialEntry = 0x00000004;
enum RASPBDEVENT_EditGlobals = 0x00000005;
enum RASPBDEVENT_NoUser = 0x00000006;
enum RASPBDEVENT_NoUserEdit = 0x00000007;
enum RASNOUSER_SmartCard = 0x00000001;
enum RASPBDFLAG_PositionDlg = 0x00000001;
enum RASPBDFLAG_ForceCloseOnDial = 0x00000002;
enum RASPBDFLAG_NoUser = 0x00000010;
enum RASPBDFLAG_UpdateDefaults = 0x80000000;
enum RASEDFLAG_PositionDlg = 0x00000001;
enum RASEDFLAG_NewEntry = 0x00000002;
enum RASEDFLAG_CloneEntry = 0x00000004;
enum RASEDFLAG_NoRename = 0x00000008;
enum RASEDFLAG_ShellOwned = 0x40000000;
enum RASEDFLAG_NewPhoneEntry = 0x00000010;
enum RASEDFLAG_NewTunnelEntry = 0x00000020;
enum RASEDFLAG_NewDirectEntry = 0x00000040;
enum RASEDFLAG_NewBroadbandEntry = 0x00000080;
enum RASEDFLAG_InternetEntry = 0x00000100;
enum RASEDFLAG_NAT = 0x00000200;
enum RASEDFLAG_IncomingConnection = 0x00000400;
enum RASDDFLAG_PositionDlg = 0x00000001;
enum RASDDFLAG_NoPrompt = 0x00000002;
enum RASDDFLAG_AoacRedial = 0x00000004;
enum RASDDFLAG_LinkFailure = 0x80000000;
enum RRAS_SERVICE_NAME = "RemoteAccess";
enum PID_IPX = 0x0000002b;
enum PID_IP = 0x00000021;
enum PID_IPV6 = 0x00000057;
enum PID_NBF = 0x0000003f;
enum PID_ATALK = 0x00000029;
enum MPR_INTERFACE_OUT_OF_RESOURCES = 0x00000001;
enum MPR_INTERFACE_ADMIN_DISABLED = 0x00000002;
enum MPR_INTERFACE_CONNECTION_FAILURE = 0x00000004;
enum MPR_INTERFACE_SERVICE_PAUSED = 0x00000008;
enum MPR_INTERFACE_DIALOUT_HOURS_RESTRICTION = 0x00000010;
enum MPR_INTERFACE_NO_MEDIA_SENSE = 0x00000020;
enum MPR_INTERFACE_NO_DEVICE = 0x00000040;
enum MPR_MaxDeviceType = 0x00000010;
enum MPR_MaxPhoneNumber = 0x00000080;
enum MPR_MaxIpAddress = 0x0000000f;
enum MPR_MaxIpxAddress = 0x00000015;
enum MPR_MaxEntryName = 0x00000100;
enum MPR_MaxDeviceName = 0x00000080;
enum MPR_MaxCallbackNumber = 0x00000080;
enum MPR_MaxAreaCode = 0x0000000a;
enum MPR_MaxPadType = 0x00000020;
enum MPR_MaxX25Address = 0x000000c8;
enum MPR_MaxFacilities = 0x000000c8;
enum MPR_MaxUserData = 0x000000c8;
enum MPRIO_SpecificIpAddr = 0x00000002;
enum MPRIO_SpecificNameServers = 0x00000004;
enum MPRIO_IpHeaderCompression = 0x00000008;
enum MPRIO_RemoteDefaultGateway = 0x00000010;
enum MPRIO_DisableLcpExtensions = 0x00000020;
enum MPRIO_SwCompression = 0x00000200;
enum MPRIO_RequireEncryptedPw = 0x00000400;
enum MPRIO_RequireMsEncryptedPw = 0x00000800;
enum MPRIO_RequireDataEncryption = 0x00001000;
enum MPRIO_NetworkLogon = 0x00002000;
enum MPRIO_PromoteAlternates = 0x00008000;
enum MPRIO_SecureLocalFiles = 0x00010000;
enum MPRIO_RequireEAP = 0x00020000;
enum MPRIO_RequirePAP = 0x00040000;
enum MPRIO_RequireSPAP = 0x00080000;
enum MPRIO_SharedPhoneNumbers = 0x00800000;
enum MPRIO_RequireCHAP = 0x08000000;
enum MPRIO_RequireMsCHAP = 0x10000000;
enum MPRIO_RequireMsCHAP2 = 0x20000000;
enum MPRIO_IpSecPreSharedKey = 0x80000000;
enum MPRIO_RequireMachineCertificates = 0x01000000;
enum MPRIO_UsePreSharedKeyForIkev2Initiator = 0x02000000;
enum MPRIO_UsePreSharedKeyForIkev2Responder = 0x04000000;
enum MPRNP_Ipx = 0x00000002;
enum MPRNP_Ip = 0x00000004;
enum MPRNP_Ipv6 = 0x00000008;
enum MPRDT_Modem = "modem";
enum MPRDT_Isdn = "isdn";
enum MPRDT_X25 = "x25";
enum MPRDT_Vpn = "vpn";
enum MPRDT_Pad = "pad";
enum MPRDT_Generic = "GENERIC";
enum MPRDT_Serial = "SERIAL";
enum MPRDT_FrameRelay = "FRAMERELAY";
enum MPRDT_Atm = "ATM";
enum MPRDT_Sonet = "SONET";
enum MPRDT_SW56 = "SW56";
enum MPRDT_Irda = "IRDA";
enum MPRDT_Parallel = "PARALLEL";
enum MPRET_Phone = 0x00000001;
enum MPRET_Vpn = 0x00000002;
enum MPRET_Direct = 0x00000003;
enum MPRIDS_Disabled = 0xffffffff;
enum MPRIDS_UseGlobalValue = 0x00000000;
enum MPR_VS_Ikev2Only = 0x00000007;
enum MPR_VS_Ikev2First = 0x00000008;
enum MPR_ENABLE_RAS_ON_DEVICE = 0x00000001;
enum MPR_ENABLE_ROUTING_ON_DEVICE = 0x00000002;
enum IPADDRESSLEN = 0x0000000f;
enum IPXADDRESSLEN = 0x00000016;
enum ATADDRESSLEN = 0x00000020;
enum MAXIPADRESSLEN = 0x00000040;
enum PPP_IPCP_VJ = 0x00000001;
enum PPP_CCP_COMPRESSION = 0x00000001;
enum PPP_CCP_ENCRYPTION40BITOLD = 0x00000010;
enum PPP_CCP_ENCRYPTION40BIT = 0x00000020;
enum PPP_CCP_ENCRYPTION128BIT = 0x00000040;
enum PPP_CCP_ENCRYPTION56BIT = 0x00000080;
enum PPP_CCP_HISTORYLESS = 0x01000000;
enum PPP_LCP_MULTILINK_FRAMING = 0x00000001;
enum PPP_LCP_PFC = 0x00000002;
enum PPP_LCP_ACFC = 0x00000004;
enum PPP_LCP_SSHF = 0x00000008;
enum PPP_LCP_DES_56 = 0x00000010;
enum PPP_LCP_3_DES = 0x00000020;
enum PPP_LCP_AES_128 = 0x00000040;
enum PPP_LCP_AES_256 = 0x00000080;
enum PPP_LCP_AES_192 = 0x00000100;
enum PPP_LCP_GCM_AES_128 = 0x00000200;
enum PPP_LCP_GCM_AES_192 = 0x00000400;
enum PPP_LCP_GCM_AES_256 = 0x00000800;
enum RAS_FLAGS_RAS_CONNECTION = 0x00000004;
enum RASPRIV_NoCallback = 0x00000001;
enum RASPRIV_AdminSetCallback = 0x00000002;
enum RASPRIV_CallerSetCallback = 0x00000004;
enum RASPRIV_DialinPrivilege = 0x00000008;
enum RASPRIV2_DialinPolicy = 0x00000001;
enum MPRAPI_IKEV2_AUTH_USING_CERT = 0x00000001;
enum MPRAPI_IKEV2_AUTH_USING_EAP = 0x00000002;
enum MPRAPI_PPP_PROJECTION_INFO_TYPE = 0x00000001;
enum MPRAPI_IKEV2_PROJECTION_INFO_TYPE = 0x00000002;
enum MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1 = 0x00000001;
enum MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_1 = 0x00000001;
enum MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2 = 0x00000001;
enum MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_3 = 0x00000003;
enum MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_2 = 0x00000002;
enum MPRAPI_IKEV2_SET_TUNNEL_CONFIG_PARAMS = 0x00000001;
enum MPRAPI_L2TP_SET_TUNNEL_CONFIG_PARAMS = 0x00000001;
enum MAX_SSTP_HASH_SIZE = 0x00000020;
enum MPRAPI_MPR_SERVER_OBJECT_REVISION_1 = 0x00000001;
enum MPRAPI_MPR_SERVER_OBJECT_REVISION_2 = 0x00000002;
enum MPRAPI_MPR_SERVER_OBJECT_REVISION_3 = 0x00000003;
enum MPRAPI_MPR_SERVER_OBJECT_REVISION_4 = 0x00000004;
enum MPRAPI_MPR_SERVER_OBJECT_REVISION_5 = 0x00000005;
enum MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1 = 0x00000001;
enum MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_2 = 0x00000002;
enum MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_3 = 0x00000003;
enum MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_4 = 0x00000004;
enum MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_5 = 0x00000005;
enum MPRAPI_SET_CONFIG_PROTOCOL_FOR_PPTP = 0x00000001;
enum MPRAPI_SET_CONFIG_PROTOCOL_FOR_L2TP = 0x00000002;
enum MPRAPI_SET_CONFIG_PROTOCOL_FOR_SSTP = 0x00000004;
enum MPRAPI_SET_CONFIG_PROTOCOL_FOR_IKEV2 = 0x00000008;
enum MPRAPI_SET_CONFIG_PROTOCOL_FOR_GRE = 0x00000010;
enum ALLOW_NO_AUTH = 0x00000001;
enum DO_NOT_ALLOW_NO_AUTH = 0x00000000;
enum MPRAPI_RAS_UPDATE_CONNECTION_OBJECT_REVISION_1 = 0x00000001;
enum MPRAPI_ADMIN_DLL_VERSION_1 = 0x00000001;
enum MPRAPI_ADMIN_DLL_VERSION_2 = 0x00000002;
enum MGM_JOIN_STATE_FLAG = 0x00000001;
enum MGM_FORWARD_STATE_FLAG = 0x00000002;
enum MGM_MFE_STATS_0 = 0x00000001;
enum MGM_MFE_STATS_1 = 0x00000002;
enum RTM_MAX_ADDRESS_SIZE = 0x00000010;
enum RTM_MAX_VIEWS = 0x00000020;
enum RTM_VIEW_ID_UCAST = 0x00000000;
enum RTM_VIEW_ID_MCAST = 0x00000001;
enum RTM_VIEW_MASK_SIZE = 0x00000020;
enum RTM_VIEW_MASK_NONE = 0x00000000;
enum RTM_VIEW_MASK_ANY = 0x00000000;
enum RTM_VIEW_MASK_UCAST = 0x00000001;
enum RTM_VIEW_MASK_MCAST = 0x00000002;
enum RTM_VIEW_MASK_ALL = 0xffffffff;
enum IPV6_ADDRESS_LEN_IN_BYTES = 0x00000010;
enum RTM_DEST_FLAG_NATURAL_NET = 0x00000001;
enum RTM_DEST_FLAG_FWD_ENGIN_ADD = 0x00000002;
enum RTM_DEST_FLAG_DONT_FORWARD = 0x00000004;
enum RTM_ROUTE_STATE_CREATED = 0x00000000;
enum RTM_ROUTE_STATE_DELETING = 0x00000001;
enum RTM_ROUTE_STATE_DELETED = 0x00000002;
enum RTM_ROUTE_FLAGS_MARTIAN = 0x00000001;
enum RTM_ROUTE_FLAGS_BLACKHOLE = 0x00000002;
enum RTM_ROUTE_FLAGS_DISCARD = 0x00000004;
enum RTM_ROUTE_FLAGS_INACTIVE = 0x00000008;
enum RTM_ROUTE_FLAGS_LOCAL = 0x00000010;
enum RTM_ROUTE_FLAGS_REMOTE = 0x00000020;
enum RTM_ROUTE_FLAGS_MYSELF = 0x00000040;
enum RTM_ROUTE_FLAGS_LOOPBACK = 0x00000080;
enum RTM_ROUTE_FLAGS_MCAST = 0x00000100;
enum RTM_ROUTE_FLAGS_LOCAL_MCAST = 0x00000200;
enum RTM_ROUTE_FLAGS_LIMITED_BC = 0x00000400;
enum RTM_ROUTE_FLAGS_ZEROS_NETBC = 0x00001000;
enum RTM_ROUTE_FLAGS_ZEROS_SUBNETBC = 0x00002000;
enum RTM_ROUTE_FLAGS_ONES_NETBC = 0x00004000;
enum RTM_ROUTE_FLAGS_ONES_SUBNETBC = 0x00008000;
enum RTM_NEXTHOP_STATE_CREATED = 0x00000000;
enum RTM_NEXTHOP_STATE_DELETED = 0x00000001;
enum RTM_NEXTHOP_FLAGS_REMOTE = 0x00000001;
enum RTM_NEXTHOP_FLAGS_DOWN = 0x00000002;
enum METHOD_TYPE_ALL_METHODS = 0xffffffff;
enum METHOD_RIP2_NEIGHBOUR_ADDR = 0x00000001;
enum METHOD_RIP2_OUTBOUND_INTF = 0x00000002;
enum METHOD_RIP2_ROUTE_TAG = 0x00000004;
enum METHOD_RIP2_ROUTE_TIMESTAMP = 0x00000008;
enum METHOD_BGP4_AS_PATH = 0x00000001;
enum METHOD_BGP4_PEER_ID = 0x00000002;
enum METHOD_BGP4_PA_ORIGIN = 0x00000004;
enum METHOD_BGP4_NEXTHOP_ATTR = 0x00000008;
enum RTM_RESUME_METHODS = 0x00000000;
enum RTM_BLOCK_METHODS = 0x00000001;
enum RTM_ROUTE_CHANGE_FIRST = 0x00000001;
enum RTM_ROUTE_CHANGE_NEW = 0x00000002;
enum RTM_ROUTE_CHANGE_BEST = 0x00010000;
enum RTM_NEXTHOP_CHANGE_NEW = 0x00000001;
enum RTM_MATCH_NONE = 0x00000000;
enum RTM_MATCH_OWNER = 0x00000001;
enum RTM_MATCH_NEIGHBOUR = 0x00000002;
enum RTM_MATCH_PREF = 0x00000004;
enum RTM_MATCH_NEXTHOP = 0x00000008;
enum RTM_MATCH_INTERFACE = 0x00000010;
enum RTM_MATCH_FULL = 0x0000ffff;
enum RTM_ENUM_START = 0x00000000;
enum RTM_ENUM_NEXT = 0x00000001;
enum RTM_ENUM_RANGE = 0x00000002;
enum RTM_ENUM_ALL_DESTS = 0x00000000;
enum RTM_ENUM_OWN_DESTS = 0x01000000;
enum RTM_ENUM_ALL_ROUTES = 0x00000000;
enum RTM_ENUM_OWN_ROUTES = 0x00010000;
enum RTM_NUM_CHANGE_TYPES = 0x00000003;
enum RTM_CHANGE_TYPE_ALL = 0x00000001;
enum RTM_CHANGE_TYPE_BEST = 0x00000002;
enum RTM_CHANGE_TYPE_FORWARDING = 0x00000004;
enum RTM_NOTIFY_ONLY_MARKED_DESTS = 0x00010000;
enum RASBASE = 0x00000258;
enum PENDING = 0x00000258;
enum ERROR_INVALID_PORT_HANDLE = 0x00000259;
enum ERROR_PORT_ALREADY_OPEN = 0x0000025a;
enum ERROR_BUFFER_TOO_SMALL = 0x0000025b;
enum ERROR_WRONG_INFO_SPECIFIED = 0x0000025c;
enum ERROR_CANNOT_SET_PORT_INFO = 0x0000025d;
enum ERROR_PORT_NOT_CONNECTED = 0x0000025e;
enum ERROR_EVENT_INVALID = 0x0000025f;
enum ERROR_DEVICE_DOES_NOT_EXIST = 0x00000260;
enum ERROR_DEVICETYPE_DOES_NOT_EXIST = 0x00000261;
enum ERROR_BUFFER_INVALID = 0x00000262;
enum ERROR_ROUTE_NOT_AVAILABLE = 0x00000263;
enum ERROR_ROUTE_NOT_ALLOCATED = 0x00000264;
enum ERROR_INVALID_COMPRESSION_SPECIFIED = 0x00000265;
enum ERROR_OUT_OF_BUFFERS = 0x00000266;
enum ERROR_PORT_NOT_FOUND = 0x00000267;
enum ERROR_ASYNC_REQUEST_PENDING = 0x00000268;
enum ERROR_ALREADY_DISCONNECTING = 0x00000269;
enum ERROR_PORT_NOT_OPEN = 0x0000026a;
enum ERROR_PORT_DISCONNECTED = 0x0000026b;
enum ERROR_NO_ENDPOINTS = 0x0000026c;
enum ERROR_CANNOT_OPEN_PHONEBOOK = 0x0000026d;
enum ERROR_CANNOT_LOAD_PHONEBOOK = 0x0000026e;
enum ERROR_CANNOT_FIND_PHONEBOOK_ENTRY = 0x0000026f;
enum ERROR_CANNOT_WRITE_PHONEBOOK = 0x00000270;
enum ERROR_CORRUPT_PHONEBOOK = 0x00000271;
enum ERROR_CANNOT_LOAD_STRING = 0x00000272;
enum ERROR_KEY_NOT_FOUND = 0x00000273;
enum ERROR_DISCONNECTION = 0x00000274;
enum ERROR_REMOTE_DISCONNECTION = 0x00000275;
enum ERROR_HARDWARE_FAILURE = 0x00000276;
enum ERROR_USER_DISCONNECTION = 0x00000277;
enum ERROR_INVALID_SIZE = 0x00000278;
enum ERROR_PORT_NOT_AVAILABLE = 0x00000279;
enum ERROR_CANNOT_PROJECT_CLIENT = 0x0000027a;
enum ERROR_UNKNOWN = 0x0000027b;
enum ERROR_WRONG_DEVICE_ATTACHED = 0x0000027c;
enum ERROR_BAD_STRING = 0x0000027d;
enum ERROR_REQUEST_TIMEOUT = 0x0000027e;
enum ERROR_CANNOT_GET_LANA = 0x0000027f;
enum ERROR_NETBIOS_ERROR = 0x00000280;
enum ERROR_SERVER_OUT_OF_RESOURCES = 0x00000281;
enum ERROR_NAME_EXISTS_ON_NET = 0x00000282;
enum ERROR_SERVER_GENERAL_NET_FAILURE = 0x00000283;
enum WARNING_MSG_ALIAS_NOT_ADDED = 0x00000284;
enum ERROR_AUTH_INTERNAL = 0x00000285;
enum ERROR_RESTRICTED_LOGON_HOURS = 0x00000286;
enum ERROR_ACCT_DISABLED = 0x00000287;
enum ERROR_PASSWD_EXPIRED = 0x00000288;
enum ERROR_NO_DIALIN_PERMISSION = 0x00000289;
enum ERROR_SERVER_NOT_RESPONDING = 0x0000028a;
enum ERROR_FROM_DEVICE = 0x0000028b;
enum ERROR_UNRECOGNIZED_RESPONSE = 0x0000028c;
enum ERROR_MACRO_NOT_FOUND = 0x0000028d;
enum ERROR_MACRO_NOT_DEFINED = 0x0000028e;
enum ERROR_MESSAGE_MACRO_NOT_FOUND = 0x0000028f;
enum ERROR_DEFAULTOFF_MACRO_NOT_FOUND = 0x00000290;
enum ERROR_FILE_COULD_NOT_BE_OPENED = 0x00000291;
enum ERROR_DEVICENAME_TOO_LONG = 0x00000292;
enum ERROR_DEVICENAME_NOT_FOUND = 0x00000293;
enum ERROR_NO_RESPONSES = 0x00000294;
enum ERROR_NO_COMMAND_FOUND = 0x00000295;
enum ERROR_WRONG_KEY_SPECIFIED = 0x00000296;
enum ERROR_UNKNOWN_DEVICE_TYPE = 0x00000297;
enum ERROR_ALLOCATING_MEMORY = 0x00000298;
enum ERROR_PORT_NOT_CONFIGURED = 0x00000299;
enum ERROR_DEVICE_NOT_READY = 0x0000029a;
enum ERROR_READING_INI_FILE = 0x0000029b;
enum ERROR_NO_CONNECTION = 0x0000029c;
enum ERROR_BAD_USAGE_IN_INI_FILE = 0x0000029d;
enum ERROR_READING_SECTIONNAME = 0x0000029e;
enum ERROR_READING_DEVICETYPE = 0x0000029f;
enum ERROR_READING_DEVICENAME = 0x000002a0;
enum ERROR_READING_USAGE = 0x000002a1;
enum ERROR_READING_MAXCONNECTBPS = 0x000002a2;
enum ERROR_READING_MAXCARRIERBPS = 0x000002a3;
enum ERROR_LINE_BUSY = 0x000002a4;
enum ERROR_VOICE_ANSWER = 0x000002a5;
enum ERROR_NO_ANSWER = 0x000002a6;
enum ERROR_NO_CARRIER = 0x000002a7;
enum ERROR_NO_DIALTONE = 0x000002a8;
enum ERROR_IN_COMMAND = 0x000002a9;
enum ERROR_WRITING_SECTIONNAME = 0x000002aa;
enum ERROR_WRITING_DEVICETYPE = 0x000002ab;
enum ERROR_WRITING_DEVICENAME = 0x000002ac;
enum ERROR_WRITING_MAXCONNECTBPS = 0x000002ad;
enum ERROR_WRITING_MAXCARRIERBPS = 0x000002ae;
enum ERROR_WRITING_USAGE = 0x000002af;
enum ERROR_WRITING_DEFAULTOFF = 0x000002b0;
enum ERROR_READING_DEFAULTOFF = 0x000002b1;
enum ERROR_EMPTY_INI_FILE = 0x000002b2;
enum ERROR_AUTHENTICATION_FAILURE = 0x000002b3;
enum ERROR_PORT_OR_DEVICE = 0x000002b4;
enum ERROR_NOT_BINARY_MACRO = 0x000002b5;
enum ERROR_DCB_NOT_FOUND = 0x000002b6;
enum ERROR_STATE_MACHINES_NOT_STARTED = 0x000002b7;
enum ERROR_STATE_MACHINES_ALREADY_STARTED = 0x000002b8;
enum ERROR_PARTIAL_RESPONSE_LOOPING = 0x000002b9;
enum ERROR_UNKNOWN_RESPONSE_KEY = 0x000002ba;
enum ERROR_RECV_BUF_FULL = 0x000002bb;
enum ERROR_CMD_TOO_LONG = 0x000002bc;
enum ERROR_UNSUPPORTED_BPS = 0x000002bd;
enum ERROR_UNEXPECTED_RESPONSE = 0x000002be;
enum ERROR_INTERACTIVE_MODE = 0x000002bf;
enum ERROR_BAD_CALLBACK_NUMBER = 0x000002c0;
enum ERROR_INVALID_AUTH_STATE = 0x000002c1;
enum ERROR_WRITING_INITBPS = 0x000002c2;
enum ERROR_X25_DIAGNOSTIC = 0x000002c3;
enum ERROR_ACCT_EXPIRED = 0x000002c4;
enum ERROR_CHANGING_PASSWORD = 0x000002c5;
enum ERROR_OVERRUN = 0x000002c6;
enum ERROR_RASMAN_CANNOT_INITIALIZE = 0x000002c7;
enum ERROR_BIPLEX_PORT_NOT_AVAILABLE = 0x000002c8;
enum ERROR_NO_ACTIVE_ISDN_LINES = 0x000002c9;
enum ERROR_NO_ISDN_CHANNELS_AVAILABLE = 0x000002ca;
enum ERROR_TOO_MANY_LINE_ERRORS = 0x000002cb;
enum ERROR_IP_CONFIGURATION = 0x000002cc;
enum ERROR_NO_IP_ADDRESSES = 0x000002cd;
enum ERROR_PPP_TIMEOUT = 0x000002ce;
enum ERROR_PPP_REMOTE_TERMINATED = 0x000002cf;
enum ERROR_PPP_NO_PROTOCOLS_CONFIGURED = 0x000002d0;
enum ERROR_PPP_NO_RESPONSE = 0x000002d1;
enum ERROR_PPP_INVALID_PACKET = 0x000002d2;
enum ERROR_PHONE_NUMBER_TOO_LONG = 0x000002d3;
enum ERROR_IPXCP_NO_DIALOUT_CONFIGURED = 0x000002d4;
enum ERROR_IPXCP_NO_DIALIN_CONFIGURED = 0x000002d5;
enum ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE = 0x000002d6;
enum ERROR_ACCESSING_TCPCFGDLL = 0x000002d7;
enum ERROR_NO_IP_RAS_ADAPTER = 0x000002d8;
enum ERROR_SLIP_REQUIRES_IP = 0x000002d9;
enum ERROR_PROJECTION_NOT_COMPLETE = 0x000002da;
enum ERROR_PROTOCOL_NOT_CONFIGURED = 0x000002db;
enum ERROR_PPP_NOT_CONVERGING = 0x000002dc;
enum ERROR_PPP_CP_REJECTED = 0x000002dd;
enum ERROR_PPP_LCP_TERMINATED = 0x000002de;
enum ERROR_PPP_REQUIRED_ADDRESS_REJECTED = 0x000002df;
enum ERROR_PPP_NCP_TERMINATED = 0x000002e0;
enum ERROR_PPP_LOOPBACK_DETECTED = 0x000002e1;
enum ERROR_PPP_NO_ADDRESS_ASSIGNED = 0x000002e2;
enum ERROR_CANNOT_USE_LOGON_CREDENTIALS = 0x000002e3;
enum ERROR_TAPI_CONFIGURATION = 0x000002e4;
enum ERROR_NO_LOCAL_ENCRYPTION = 0x000002e5;
enum ERROR_NO_REMOTE_ENCRYPTION = 0x000002e6;
enum ERROR_REMOTE_REQUIRES_ENCRYPTION = 0x000002e7;
enum ERROR_IPXCP_NET_NUMBER_CONFLICT = 0x000002e8;
enum ERROR_INVALID_SMM = 0x000002e9;
enum ERROR_SMM_UNINITIALIZED = 0x000002ea;
enum ERROR_NO_MAC_FOR_PORT = 0x000002eb;
enum ERROR_SMM_TIMEOUT = 0x000002ec;
enum ERROR_BAD_PHONE_NUMBER = 0x000002ed;
enum ERROR_WRONG_MODULE = 0x000002ee;
enum ERROR_INVALID_CALLBACK_NUMBER = 0x000002ef;
enum ERROR_SCRIPT_SYNTAX = 0x000002f0;
enum ERROR_HANGUP_FAILED = 0x000002f1;
enum ERROR_BUNDLE_NOT_FOUND = 0x000002f2;
enum ERROR_CANNOT_DO_CUSTOMDIAL = 0x000002f3;
enum ERROR_DIAL_ALREADY_IN_PROGRESS = 0x000002f4;
enum ERROR_RASAUTO_CANNOT_INITIALIZE = 0x000002f5;
enum ERROR_CONNECTION_ALREADY_SHARED = 0x000002f6;
enum ERROR_SHARING_CHANGE_FAILED = 0x000002f7;
enum ERROR_SHARING_ROUTER_INSTALL = 0x000002f8;
enum ERROR_SHARE_CONNECTION_FAILED = 0x000002f9;
enum ERROR_SHARING_PRIVATE_INSTALL = 0x000002fa;
enum ERROR_CANNOT_SHARE_CONNECTION = 0x000002fb;
enum ERROR_NO_SMART_CARD_READER = 0x000002fc;
enum ERROR_SHARING_ADDRESS_EXISTS = 0x000002fd;
enum ERROR_NO_CERTIFICATE = 0x000002fe;
enum ERROR_SHARING_MULTIPLE_ADDRESSES = 0x000002ff;
enum ERROR_FAILED_TO_ENCRYPT = 0x00000300;
enum ERROR_BAD_ADDRESS_SPECIFIED = 0x00000301;
enum ERROR_CONNECTION_REJECT = 0x00000302;
enum ERROR_CONGESTION = 0x00000303;
enum ERROR_INCOMPATIBLE = 0x00000304;
enum ERROR_NUMBERCHANGED = 0x00000305;
enum ERROR_TEMPFAILURE = 0x00000306;
enum ERROR_BLOCKED = 0x00000307;
enum ERROR_DONOTDISTURB = 0x00000308;
enum ERROR_OUTOFORDER = 0x00000309;
enum ERROR_UNABLE_TO_AUTHENTICATE_SERVER = 0x0000030a;
enum ERROR_SMART_CARD_REQUIRED = 0x0000030b;
enum ERROR_INVALID_FUNCTION_FOR_ENTRY = 0x0000030c;
enum ERROR_CERT_FOR_ENCRYPTION_NOT_FOUND = 0x0000030d;
enum ERROR_SHARING_RRAS_CONFLICT = 0x0000030e;
enum ERROR_SHARING_NO_PRIVATE_LAN = 0x0000030f;
enum ERROR_NO_DIFF_USER_AT_LOGON = 0x00000310;
enum ERROR_NO_REG_CERT_AT_LOGON = 0x00000311;
enum ERROR_OAKLEY_NO_CERT = 0x00000312;
enum ERROR_OAKLEY_AUTH_FAIL = 0x00000313;
enum ERROR_OAKLEY_ATTRIB_FAIL = 0x00000314;
enum ERROR_OAKLEY_GENERAL_PROCESSING = 0x00000315;
enum ERROR_OAKLEY_NO_PEER_CERT = 0x00000316;
enum ERROR_OAKLEY_NO_POLICY = 0x00000317;
enum ERROR_OAKLEY_TIMED_OUT = 0x00000318;
enum ERROR_OAKLEY_ERROR = 0x00000319;
enum ERROR_UNKNOWN_FRAMED_PROTOCOL = 0x0000031a;
enum ERROR_WRONG_TUNNEL_TYPE = 0x0000031b;
enum ERROR_UNKNOWN_SERVICE_TYPE = 0x0000031c;
enum ERROR_CONNECTING_DEVICE_NOT_FOUND = 0x0000031d;
enum ERROR_NO_EAPTLS_CERTIFICATE = 0x0000031e;
enum ERROR_SHARING_HOST_ADDRESS_CONFLICT = 0x0000031f;
enum ERROR_AUTOMATIC_VPN_FAILED = 0x00000320;
enum ERROR_VALIDATING_SERVER_CERT = 0x00000321;
enum ERROR_READING_SCARD = 0x00000322;
enum ERROR_INVALID_PEAP_COOKIE_CONFIG = 0x00000323;
enum ERROR_INVALID_PEAP_COOKIE_USER = 0x00000324;
enum ERROR_INVALID_MSCHAPV2_CONFIG = 0x00000325;
enum ERROR_VPN_GRE_BLOCKED = 0x00000326;
enum ERROR_VPN_DISCONNECT = 0x00000327;
enum ERROR_VPN_REFUSED = 0x00000328;
enum ERROR_VPN_TIMEOUT = 0x00000329;
enum ERROR_VPN_BAD_CERT = 0x0000032a;
enum ERROR_VPN_BAD_PSK = 0x0000032b;
enum ERROR_SERVER_POLICY = 0x0000032c;
enum ERROR_BROADBAND_ACTIVE = 0x0000032d;
enum ERROR_BROADBAND_NO_NIC = 0x0000032e;
enum ERROR_BROADBAND_TIMEOUT = 0x0000032f;
enum ERROR_FEATURE_DEPRECATED = 0x00000330;
enum ERROR_CANNOT_DELETE = 0x00000331;
enum ERROR_RASQEC_RESOURCE_CREATION_FAILED = 0x00000332;
enum ERROR_RASQEC_NAPAGENT_NOT_ENABLED = 0x00000333;
enum ERROR_RASQEC_NAPAGENT_NOT_CONNECTED = 0x00000334;
enum ERROR_RASQEC_CONN_DOESNOTEXIST = 0x00000335;
enum ERROR_RASQEC_TIMEOUT = 0x00000336;
enum ERROR_PEAP_CRYPTOBINDING_INVALID = 0x00000337;
enum ERROR_PEAP_CRYPTOBINDING_NOTRECEIVED = 0x00000338;
enum ERROR_INVALID_VPNSTRATEGY = 0x00000339;
enum ERROR_EAPTLS_CACHE_CREDENTIALS_INVALID = 0x0000033a;
enum ERROR_IPSEC_SERVICE_STOPPED = 0x0000033b;
enum ERROR_IDLE_TIMEOUT = 0x0000033c;
enum ERROR_LINK_FAILURE = 0x0000033d;
enum ERROR_USER_LOGOFF = 0x0000033e;
enum ERROR_FAST_USER_SWITCH = 0x0000033f;
enum ERROR_HIBERNATION = 0x00000340;
enum ERROR_SYSTEM_SUSPENDED = 0x00000341;
enum ERROR_RASMAN_SERVICE_STOPPED = 0x00000342;
enum ERROR_INVALID_SERVER_CERT = 0x00000343;
enum ERROR_NOT_NAP_CAPABLE = 0x00000344;
enum ERROR_INVALID_TUNNELID = 0x00000345;
enum ERROR_UPDATECONNECTION_REQUEST_IN_PROCESS = 0x00000346;
enum ERROR_PROTOCOL_ENGINE_DISABLED = 0x00000347;
enum ERROR_INTERNAL_ADDRESS_FAILURE = 0x00000348;
enum ERROR_FAILED_CP_REQUIRED = 0x00000349;
enum ERROR_TS_UNACCEPTABLE = 0x0000034a;
enum ERROR_MOBIKE_DISABLED = 0x0000034b;
enum ERROR_CANNOT_INITIATE_MOBIKE_UPDATE = 0x0000034c;
enum ERROR_PEAP_SERVER_REJECTED_CLIENT_TLV = 0x0000034d;
enum ERROR_INVALID_PREFERENCES = 0x0000034e;
enum ERROR_EAPTLS_SCARD_CACHE_CREDENTIALS_INVALID = 0x0000034f;
enum ERROR_SSTP_COOKIE_SET_FAILURE = 0x00000350;
enum ERROR_INVALID_PEAP_COOKIE_ATTRIBUTES = 0x00000351;
enum ERROR_EAP_METHOD_NOT_INSTALLED = 0x00000352;
enum ERROR_EAP_METHOD_DOES_NOT_SUPPORT_SSO = 0x00000353;
enum ERROR_EAP_METHOD_OPERATION_NOT_SUPPORTED = 0x00000354;
enum ERROR_EAP_USER_CERT_INVALID = 0x00000355;
enum ERROR_EAP_USER_CERT_EXPIRED = 0x00000356;
enum ERROR_EAP_USER_CERT_REVOKED = 0x00000357;
enum ERROR_EAP_USER_CERT_OTHER_ERROR = 0x00000358;
enum ERROR_EAP_SERVER_CERT_INVALID = 0x00000359;
enum ERROR_EAP_SERVER_CERT_EXPIRED = 0x0000035a;
enum ERROR_EAP_SERVER_CERT_REVOKED = 0x0000035b;
enum ERROR_EAP_SERVER_CERT_OTHER_ERROR = 0x0000035c;
enum ERROR_EAP_USER_ROOT_CERT_NOT_FOUND = 0x0000035d;
enum ERROR_EAP_USER_ROOT_CERT_INVALID = 0x0000035e;
enum ERROR_EAP_USER_ROOT_CERT_EXPIRED = 0x0000035f;
enum ERROR_EAP_SERVER_ROOT_CERT_NOT_FOUND = 0x00000360;
enum ERROR_EAP_SERVER_ROOT_CERT_INVALID = 0x00000361;
enum ERROR_EAP_SERVER_ROOT_CERT_NAME_REQUIRED = 0x00000362;
enum ERROR_PEAP_IDENTITY_MISMATCH = 0x00000363;
enum ERROR_DNSNAME_NOT_RESOLVABLE = 0x00000364;
enum ERROR_EAPTLS_PASSWD_INVALID = 0x00000365;
enum ERROR_IKEV2_PSK_INTERFACE_ALREADY_EXISTS = 0x00000366;
enum ERROR_INVALID_DESTINATION_IP = 0x00000367;
enum ERROR_INVALID_INTERFACE_CONFIG = 0x00000368;
enum ERROR_VPN_PLUGIN_GENERIC = 0x00000369;
enum ERROR_SSO_CERT_MISSING = 0x0000036a;
enum ERROR_DEVICE_COMPLIANCE = 0x0000036b;
enum ERROR_PLUGIN_NOT_INSTALLED = 0x0000036c;
enum ERROR_ACTION_REQUIRED = 0x0000036d;
enum RASBASEEND = 0x0000036d;
alias HRASCONN = void*;
struct RASCONNW
{
    align (4):
    uint dwSize;
    HRASCONN hrasconn;
    wchar[257] szEntryName;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[260] szPhonebook;
    uint dwSubEntry;
    GUID guidEntry;
    uint dwFlags;
    LUID luid;
    GUID guidCorrelationId;
}
struct RASCONNA
{
    align (4):
    uint dwSize;
    HRASCONN hrasconn;
    CHAR[257] szEntryName;
    CHAR[17] szDeviceType;
    CHAR[129] szDeviceName;
    CHAR[260] szPhonebook;
    uint dwSubEntry;
    GUID guidEntry;
    uint dwFlags;
    LUID luid;
    GUID guidCorrelationId;
}
struct RASDIALPARAMSW
{
    align (4):
    uint dwSize;
    wchar[257] szEntryName;
    wchar[129] szPhoneNumber;
    wchar[129] szCallbackNumber;
    wchar[257] szUserName;
    wchar[257] szPassword;
    wchar[16] szDomain;
    uint dwSubEntry;
    ulong dwCallbackId;
    uint dwIfIndex;
    PWSTR szEncPassword;
}
struct RASDIALPARAMSA
{
    align (4):
    uint dwSize;
    CHAR[257] szEntryName;
    CHAR[129] szPhoneNumber;
    CHAR[129] szCallbackNumber;
    CHAR[257] szUserName;
    CHAR[257] szPassword;
    CHAR[16] szDomain;
    uint dwSubEntry;
    ulong dwCallbackId;
    uint dwIfIndex;
    PSTR szEncPassword;
}
struct RASDEVSPECIFICINFO
{
    align (4):
    uint dwSize;
    ubyte* pbDevSpecificInfo;
}
struct RASIKEV2_PROJECTION_INFO
{
    align (4):
    uint dwIPv4NegotiationError;
    IN_ADDR ipv4Address;
    IN_ADDR ipv4ServerAddress;
    uint dwIPv6NegotiationError;
    IN6_ADDR ipv6Address;
    IN6_ADDR ipv6ServerAddress;
    uint dwPrefixLength;
    uint dwAuthenticationProtocol;
    uint dwEapTypeId;
    RASIKEV_PROJECTION_INFO_FLAGS dwFlags;
    uint dwEncryptionMethod;
    uint numIPv4ServerAddresses;
    IN_ADDR* ipv4ServerAddresses;
    uint numIPv6ServerAddresses;
    IN6_ADDR* ipv6ServerAddresses;
}
struct RASPBDLGW
{
    align (4):
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    ulong dwCallbackId;
    RASPBDLGFUNCW pCallback;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
struct RASPBDLGA
{
    align (4):
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    ulong dwCallbackId;
    RASPBDLGFUNCA pCallback;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
struct RASENTRYDLGW
{
    align (4):
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    wchar[257] szEntry;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
struct RASENTRYDLGA
{
    align (4):
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    CHAR[257] szEntry;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
alias RASAPIVERSION = int;
enum : int
{
    RASAPIVERSION_500 = 0x00000001,
    RASAPIVERSION_501 = 0x00000002,
    RASAPIVERSION_600 = 0x00000003,
    RASAPIVERSION_601 = 0x00000004,
}

struct RASIPADDR
{
    ubyte a;
    ubyte b;
    ubyte c;
    ubyte d;
}
struct RASTUNNELENDPOINT
{
    uint dwType;
    union
    {
        IN_ADDR ipv4;
        IN6_ADDR ipv6;
    }
}
/+ [CONFLICTED] struct RASCONNW
{
    uint dwSize;
    HRASCONN hrasconn;
    wchar[257] szEntryName;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[260] szPhonebook;
    uint dwSubEntry;
    GUID guidEntry;
    uint dwFlags;
    LUID luid;
    GUID guidCorrelationId;
}
+/
/+ [CONFLICTED] struct RASCONNA
{
    uint dwSize;
    HRASCONN hrasconn;
    CHAR[257] szEntryName;
    CHAR[17] szDeviceType;
    CHAR[129] szDeviceName;
    CHAR[260] szPhonebook;
    uint dwSubEntry;
    GUID guidEntry;
    uint dwFlags;
    LUID luid;
    GUID guidCorrelationId;
}
+/
alias RASCONNSTATE = int;
enum : int
{
    RASCS_OpenPort             = 0x00000000,
    RASCS_PortOpened           = 0x00000001,
    RASCS_ConnectDevice        = 0x00000002,
    RASCS_DeviceConnected      = 0x00000003,
    RASCS_AllDevicesConnected  = 0x00000004,
    RASCS_Authenticate         = 0x00000005,
    RASCS_AuthNotify           = 0x00000006,
    RASCS_AuthRetry            = 0x00000007,
    RASCS_AuthCallback         = 0x00000008,
    RASCS_AuthChangePassword   = 0x00000009,
    RASCS_AuthProject          = 0x0000000a,
    RASCS_AuthLinkSpeed        = 0x0000000b,
    RASCS_AuthAck              = 0x0000000c,
    RASCS_ReAuthenticate       = 0x0000000d,
    RASCS_Authenticated        = 0x0000000e,
    RASCS_PrepareForCallback   = 0x0000000f,
    RASCS_WaitForModemReset    = 0x00000010,
    RASCS_WaitForCallback      = 0x00000011,
    RASCS_Projected            = 0x00000012,
    RASCS_StartAuthentication  = 0x00000013,
    RASCS_CallbackComplete     = 0x00000014,
    RASCS_LogonNetwork         = 0x00000015,
    RASCS_SubEntryConnected    = 0x00000016,
    RASCS_SubEntryDisconnected = 0x00000017,
    RASCS_ApplySettings        = 0x00000018,
    RASCS_Interactive          = 0x00001000,
    RASCS_RetryAuthentication  = 0x00001001,
    RASCS_CallbackSetByCaller  = 0x00001002,
    RASCS_PasswordExpired      = 0x00001003,
    RASCS_InvokeEapUI          = 0x00001004,
    RASCS_Connected            = 0x00002000,
    RASCS_Disconnected         = 0x00002001,
}

alias RASCONNSUBSTATE = int;
enum : int
{
    RASCSS_None         = 0x00000000,
    RASCSS_Dormant      = 0x00000001,
    RASCSS_Reconnecting = 0x00000002,
    RASCSS_Reconnected  = 0x00002000,
}

struct RASCONNSTATUSW
{
    uint dwSize;
    RASCONNSTATE rasconnstate;
    uint dwError;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[129] szPhoneNumber;
    RASTUNNELENDPOINT localEndPoint;
    RASTUNNELENDPOINT remoteEndPoint;
    RASCONNSUBSTATE rasconnsubstate;
}
struct RASCONNSTATUSA
{
    uint dwSize;
    RASCONNSTATE rasconnstate;
    uint dwError;
    CHAR[17] szDeviceType;
    CHAR[129] szDeviceName;
    CHAR[129] szPhoneNumber;
    RASTUNNELENDPOINT localEndPoint;
    RASTUNNELENDPOINT remoteEndPoint;
    RASCONNSUBSTATE rasconnsubstate;
}
/+ [CONFLICTED] struct RASDIALPARAMSW
{
    uint dwSize;
    wchar[257] szEntryName;
    wchar[129] szPhoneNumber;
    wchar[129] szCallbackNumber;
    wchar[257] szUserName;
    wchar[257] szPassword;
    wchar[16] szDomain;
    uint dwSubEntry;
    ulong dwCallbackId;
    uint dwIfIndex;
    PWSTR szEncPassword;
}
+/
/+ [CONFLICTED] struct RASDIALPARAMSA
{
    uint dwSize;
    CHAR[257] szEntryName;
    CHAR[129] szPhoneNumber;
    CHAR[129] szCallbackNumber;
    CHAR[257] szUserName;
    CHAR[257] szPassword;
    CHAR[16] szDomain;
    uint dwSubEntry;
    ulong dwCallbackId;
    uint dwIfIndex;
    PSTR szEncPassword;
}
+/
struct RASEAPINFO
{
    align (4):
    uint dwSizeofEapInfo;
    ubyte* pbEapInfo;
}
/+ [CONFLICTED] struct RASDEVSPECIFICINFO
{
    uint dwSize;
    ubyte* pbDevSpecificInfo;
}
+/
struct RASDIALEXTENSIONS
{
    align (4):
    uint dwSize;
    uint dwfOptions;
    HWND hwndParent;
    ulong reserved;
    ulong reserved1;
    RASEAPINFO RasEapInfo;
    BOOL fSkipPppAuth;
    RASDEVSPECIFICINFO RasDevSpecificInfo;
}
struct RASENTRYNAMEW
{
    uint dwSize;
    wchar[257] szEntryName;
    uint dwFlags;
    wchar[261] szPhonebookPath;
}
struct RASENTRYNAMEA
{
    uint dwSize;
    CHAR[257] szEntryName;
    uint dwFlags;
    CHAR[261] szPhonebookPath;
}
alias RASPROJECTION = int;
enum : int
{
    RASP_Amb     = 0x00010000,
    RASP_PppNbf  = 0x0000803f,
    RASP_PppIpx  = 0x0000802b,
    RASP_PppIp   = 0x00008021,
    RASP_PppCcp  = 0x000080fd,
    RASP_PppLcp  = 0x0000c021,
    RASP_PppIpv6 = 0x00008057,
}

struct RASAMBW
{
    uint dwSize;
    uint dwError;
    wchar[17] szNetBiosError;
    ubyte bLana;
}
struct RASAMBA
{
    uint dwSize;
    uint dwError;
    CHAR[17] szNetBiosError;
    ubyte bLana;
}
struct RASPPPNBFW
{
    uint dwSize;
    uint dwError;
    uint dwNetBiosError;
    wchar[17] szNetBiosError;
    wchar[17] szWorkstationName;
    ubyte bLana;
}
struct RASPPPNBFA
{
    uint dwSize;
    uint dwError;
    uint dwNetBiosError;
    CHAR[17] szNetBiosError;
    CHAR[17] szWorkstationName;
    ubyte bLana;
}
struct RASIPXW
{
    uint dwSize;
    uint dwError;
    wchar[22] szIpxAddress;
}
struct RASPPPIPXA
{
    uint dwSize;
    uint dwError;
    CHAR[22] szIpxAddress;
}
struct RASPPPIPW
{
    uint dwSize;
    uint dwError;
    wchar[16] szIpAddress;
    wchar[16] szServerIpAddress;
    uint dwOptions;
    uint dwServerOptions;
}
struct RASPPPIPA
{
    uint dwSize;
    uint dwError;
    CHAR[16] szIpAddress;
    CHAR[16] szServerIpAddress;
    uint dwOptions;
    uint dwServerOptions;
}
struct RASPPPIPV6
{
    uint dwSize;
    uint dwError;
    ubyte[8] bLocalInterfaceIdentifier;
    ubyte[8] bPeerInterfaceIdentifier;
    ubyte[2] bLocalCompressionProtocol;
    ubyte[2] bPeerCompressionProtocol;
}
struct RASPPPLCPW
{
    uint dwSize;
    BOOL fBundled;
    uint dwError;
    uint dwAuthenticationProtocol;
    uint dwAuthenticationData;
    uint dwEapTypeId;
    uint dwServerAuthenticationProtocol;
    uint dwServerAuthenticationData;
    uint dwServerEapTypeId;
    BOOL fMultilink;
    uint dwTerminateReason;
    uint dwServerTerminateReason;
    wchar[1024] szReplyMessage;
    uint dwOptions;
    uint dwServerOptions;
}
struct RASPPPLCPA
{
    uint dwSize;
    BOOL fBundled;
    uint dwError;
    uint dwAuthenticationProtocol;
    uint dwAuthenticationData;
    uint dwEapTypeId;
    uint dwServerAuthenticationProtocol;
    uint dwServerAuthenticationData;
    uint dwServerEapTypeId;
    BOOL fMultilink;
    uint dwTerminateReason;
    uint dwServerTerminateReason;
    CHAR[1024] szReplyMessage;
    uint dwOptions;
    uint dwServerOptions;
}
struct RASPPPCCP
{
    uint dwSize;
    uint dwError;
    uint dwCompressionAlgorithm;
    uint dwOptions;
    uint dwServerCompressionAlgorithm;
    uint dwServerOptions;
}
struct RASPPP_PROJECTION_INFO
{
    uint dwIPv4NegotiationError;
    IN_ADDR ipv4Address;
    IN_ADDR ipv4ServerAddress;
    uint dwIPv4Options;
    uint dwIPv4ServerOptions;
    uint dwIPv6NegotiationError;
    ubyte[8] bInterfaceIdentifier;
    ubyte[8] bServerInterfaceIdentifier;
    BOOL fBundled;
    BOOL fMultilink;
    RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL dwAuthenticationProtocol;
    RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA dwAuthenticationData;
    RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL dwServerAuthenticationProtocol;
    RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA dwServerAuthenticationData;
    uint dwEapTypeId;
    uint dwServerEapTypeId;
    uint dwLcpOptions;
    uint dwLcpServerOptions;
    uint dwCcpError;
    uint dwCcpCompressionAlgorithm;
    uint dwCcpServerCompressionAlgorithm;
    uint dwCcpOptions;
    uint dwCcpServerOptions;
}
/+ [CONFLICTED] struct RASIKEV2_PROJECTION_INFO
{
    uint dwIPv4NegotiationError;
    IN_ADDR ipv4Address;
    IN_ADDR ipv4ServerAddress;
    uint dwIPv6NegotiationError;
    IN6_ADDR ipv6Address;
    IN6_ADDR ipv6ServerAddress;
    uint dwPrefixLength;
    uint dwAuthenticationProtocol;
    uint dwEapTypeId;
    RASIKEV_PROJECTION_INFO_FLAGS dwFlags;
    uint dwEncryptionMethod;
    uint numIPv4ServerAddresses;
    IN_ADDR* ipv4ServerAddresses;
    uint numIPv6ServerAddresses;
    IN6_ADDR* ipv6ServerAddresses;
}
+/
alias RASPROJECTION_INFO_TYPE = int;
enum : int
{
    PROJECTION_INFO_TYPE_PPP   = 0x00000001,
    PROJECTION_INFO_TYPE_IKEv2 = 0x00000002,
}

alias IKEV2_ID_PAYLOAD_TYPE = int;
enum : int
{
    IKEV2_ID_PAYLOAD_TYPE_INVALID      = 0x00000000,
    IKEV2_ID_PAYLOAD_TYPE_IPV4_ADDR    = 0x00000001,
    IKEV2_ID_PAYLOAD_TYPE_FQDN         = 0x00000002,
    IKEV2_ID_PAYLOAD_TYPE_RFC822_ADDR  = 0x00000003,
    IKEV2_ID_PAYLOAD_TYPE_RESERVED1    = 0x00000004,
    IKEV2_ID_PAYLOAD_TYPE_ID_IPV6_ADDR = 0x00000005,
    IKEV2_ID_PAYLOAD_TYPE_RESERVED2    = 0x00000006,
    IKEV2_ID_PAYLOAD_TYPE_RESERVED3    = 0x00000007,
    IKEV2_ID_PAYLOAD_TYPE_RESERVED4    = 0x00000008,
    IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_DN  = 0x00000009,
    IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_GN  = 0x0000000a,
    IKEV2_ID_PAYLOAD_TYPE_KEY_ID       = 0x0000000b,
    IKEV2_ID_PAYLOAD_TYPE_MAX          = 0x0000000c,
}

struct RAS_PROJECTION_INFO
{
    RASAPIVERSION version_;
    RASPROJECTION_INFO_TYPE type;
    union
    {
        RASPPP_PROJECTION_INFO ppp;
        RASIKEV2_PROJECTION_INFO ikev2;
    }
}
alias RASDIALFUNC = void function(uint param0, RASCONNSTATE param1, uint param2);
alias RASDIALFUNC1 = void function(HRASCONN param0, uint param1, RASCONNSTATE param2, uint param3, uint param4);
alias RASDIALFUNC2 = uint function(ulong param0, uint param1, HRASCONN param2, uint param3, RASCONNSTATE param4, uint param5, uint param6);
struct RASDEVINFOW
{
    uint dwSize;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
}
struct RASDEVINFOA
{
    uint dwSize;
    CHAR[17] szDeviceType;
    CHAR[129] szDeviceName;
}
struct RASCTRYINFO
{
    uint dwSize;
    uint dwCountryID;
    uint dwNextCountryID;
    uint dwCountryCode;
    uint dwCountryNameOffset;
}
struct RASENTRYA
{
    uint dwSize;
    uint dwfOptions;
    uint dwCountryID;
    uint dwCountryCode;
    CHAR[11] szAreaCode;
    CHAR[129] szLocalPhoneNumber;
    uint dwAlternateOffset;
    RASIPADDR ipaddr;
    RASIPADDR ipaddrDns;
    RASIPADDR ipaddrDnsAlt;
    RASIPADDR ipaddrWins;
    RASIPADDR ipaddrWinsAlt;
    uint dwFrameSize;
    uint dwfNetProtocols;
    uint dwFramingProtocol;
    CHAR[260] szScript;
    CHAR[260] szAutodialDll;
    CHAR[260] szAutodialFunc;
    CHAR[17] szDeviceType;
    CHAR[129] szDeviceName;
    CHAR[33] szX25PadType;
    CHAR[201] szX25Address;
    CHAR[201] szX25Facilities;
    CHAR[201] szX25UserData;
    uint dwChannels;
    uint dwReserved1;
    uint dwReserved2;
    uint dwSubEntries;
    RASENTRY_DIAL_MODE dwDialMode;
    uint dwDialExtraPercent;
    uint dwDialExtraSampleSeconds;
    uint dwHangUpExtraPercent;
    uint dwHangUpExtraSampleSeconds;
    uint dwIdleDisconnectSeconds;
    uint dwType;
    uint dwEncryptionType;
    uint dwCustomAuthKey;
    GUID guidId;
    CHAR[260] szCustomDialDll;
    uint dwVpnStrategy;
    uint dwfOptions2;
    uint dwfOptions3;
    CHAR[256] szDnsSuffix;
    uint dwTcpWindowSize;
    CHAR[260] szPrerequisitePbk;
    CHAR[257] szPrerequisiteEntry;
    uint dwRedialCount;
    uint dwRedialPause;
    IN6_ADDR ipv6addrDns;
    IN6_ADDR ipv6addrDnsAlt;
    uint dwIPv4InterfaceMetric;
    uint dwIPv6InterfaceMetric;
    IN6_ADDR ipv6addr;
    uint dwIPv6PrefixLength;
    uint dwNetworkOutageTime;
    CHAR[257] szIDi;
    CHAR[257] szIDr;
    BOOL fIsImsConfig;
    IKEV2_ID_PAYLOAD_TYPE IdiType;
    IKEV2_ID_PAYLOAD_TYPE IdrType;
    BOOL fDisableIKEv2Fragmentation;
}
struct RASENTRYW
{
    uint dwSize;
    uint dwfOptions;
    uint dwCountryID;
    uint dwCountryCode;
    wchar[11] szAreaCode;
    wchar[129] szLocalPhoneNumber;
    uint dwAlternateOffset;
    RASIPADDR ipaddr;
    RASIPADDR ipaddrDns;
    RASIPADDR ipaddrDnsAlt;
    RASIPADDR ipaddrWins;
    RASIPADDR ipaddrWinsAlt;
    uint dwFrameSize;
    uint dwfNetProtocols;
    uint dwFramingProtocol;
    wchar[260] szScript;
    wchar[260] szAutodialDll;
    wchar[260] szAutodialFunc;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[33] szX25PadType;
    wchar[201] szX25Address;
    wchar[201] szX25Facilities;
    wchar[201] szX25UserData;
    uint dwChannels;
    uint dwReserved1;
    uint dwReserved2;
    uint dwSubEntries;
    RASENTRY_DIAL_MODE dwDialMode;
    uint dwDialExtraPercent;
    uint dwDialExtraSampleSeconds;
    uint dwHangUpExtraPercent;
    uint dwHangUpExtraSampleSeconds;
    uint dwIdleDisconnectSeconds;
    uint dwType;
    uint dwEncryptionType;
    uint dwCustomAuthKey;
    GUID guidId;
    wchar[260] szCustomDialDll;
    uint dwVpnStrategy;
    uint dwfOptions2;
    uint dwfOptions3;
    wchar[256] szDnsSuffix;
    uint dwTcpWindowSize;
    wchar[260] szPrerequisitePbk;
    wchar[257] szPrerequisiteEntry;
    uint dwRedialCount;
    uint dwRedialPause;
    IN6_ADDR ipv6addrDns;
    IN6_ADDR ipv6addrDnsAlt;
    uint dwIPv4InterfaceMetric;
    uint dwIPv6InterfaceMetric;
    IN6_ADDR ipv6addr;
    uint dwIPv6PrefixLength;
    uint dwNetworkOutageTime;
    wchar[257] szIDi;
    wchar[257] szIDr;
    BOOL fIsImsConfig;
    IKEV2_ID_PAYLOAD_TYPE IdiType;
    IKEV2_ID_PAYLOAD_TYPE IdrType;
    BOOL fDisableIKEv2Fragmentation;
}
alias ORASADFUNC = BOOL function(HWND param0, PSTR param1, uint param2, uint* param3);
struct RASADPARAMS
{
    align (4):
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
}
alias RASADFUNCA = BOOL function(PSTR param0, PSTR param1, RASADPARAMS* param2, uint* param3);
alias RASADFUNCW = BOOL function(PWSTR param0, PWSTR param1, RASADPARAMS* param2, uint* param3);
struct RASSUBENTRYA
{
    uint dwSize;
    uint dwfFlags;
    CHAR[17] szDeviceType;
    CHAR[129] szDeviceName;
    CHAR[129] szLocalPhoneNumber;
    uint dwAlternateOffset;
}
struct RASSUBENTRYW
{
    uint dwSize;
    uint dwfFlags;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[129] szLocalPhoneNumber;
    uint dwAlternateOffset;
}
struct RASCREDENTIALSA
{
    uint dwSize;
    uint dwMask;
    CHAR[257] szUserName;
    CHAR[257] szPassword;
    CHAR[16] szDomain;
}
struct RASCREDENTIALSW
{
    uint dwSize;
    uint dwMask;
    wchar[257] szUserName;
    wchar[257] szPassword;
    wchar[16] szDomain;
}
struct RASAUTODIALENTRYA
{
    uint dwSize;
    uint dwFlags;
    uint dwDialingLocation;
    CHAR[257] szEntry;
}
struct RASAUTODIALENTRYW
{
    uint dwSize;
    uint dwFlags;
    uint dwDialingLocation;
    wchar[257] szEntry;
}
struct RASEAPUSERIDENTITYA
{
    CHAR[257] szUserName;
    uint dwSizeofEapInfo;
    ubyte[1] pbEapInfo;
}
struct RASEAPUSERIDENTITYW
{
    wchar[257] szUserName;
    uint dwSizeofEapInfo;
    ubyte[1] pbEapInfo;
}
alias PFNRASGETBUFFER = uint function(ubyte** ppBuffer, uint* pdwSize);
alias PFNRASFREEBUFFER = uint function(ubyte* pBufer);
alias PFNRASSENDBUFFER = uint function(HANDLE hPort, ubyte* pBuffer, uint dwSize);
alias PFNRASRECEIVEBUFFER = uint function(HANDLE hPort, ubyte* pBuffer, uint* pdwSize, uint dwTimeOut, HANDLE hEvent);
alias PFNRASRETRIEVEBUFFER = uint function(HANDLE hPort, ubyte* pBuffer, uint* pdwSize);
alias RasCustomScriptExecuteFn = uint function(HANDLE hPort, const(wchar)* lpszPhonebook, const(wchar)* lpszEntryName, PFNRASGETBUFFER pfnRasGetBuffer, PFNRASFREEBUFFER pfnRasFreeBuffer, PFNRASSENDBUFFER pfnRasSendBuffer, PFNRASRECEIVEBUFFER pfnRasReceiveBuffer, PFNRASRETRIEVEBUFFER pfnRasRetrieveBuffer, HWND hWnd, RASDIALPARAMSA* pRasDialParams, void* pvReserved);
struct RASCOMMSETTINGS
{
    uint dwSize;
    ubyte bParity;
    ubyte bStop;
    ubyte bByteSize;
    ubyte bAlign;
}
alias PFNRASSETCOMMSETTINGS = uint function(HANDLE hPort, RASCOMMSETTINGS* pRasCommSettings, void* pvReserved);
struct RASCUSTOMSCRIPTEXTENSIONS
{
    align (4):
    uint dwSize;
    PFNRASSETCOMMSETTINGS pfnRasSetCommSettings;
}
struct RAS_STATS
{
    uint dwSize;
    uint dwBytesXmited;
    uint dwBytesRcved;
    uint dwFramesXmited;
    uint dwFramesRcved;
    uint dwCrcErr;
    uint dwTimeoutErr;
    uint dwAlignmentErr;
    uint dwHardwareOverrunErr;
    uint dwFramingErr;
    uint dwBufferOverrunErr;
    uint dwCompressionRatioIn;
    uint dwCompressionRatioOut;
    uint dwBps;
    uint dwConnectDuration;
}
alias RasCustomHangUpFn = uint function(HRASCONN hRasConn);
alias RasCustomDialFn = uint function(HINSTANCE hInstDll, RASDIALEXTENSIONS* lpRasDialExtensions, const(wchar)* lpszPhonebook, RASDIALPARAMSA* lpRasDialParams, uint dwNotifierType, void* lpvNotifier, HRASCONN* lphRasConn, uint dwFlags);
alias RasCustomDeleteEntryNotifyFn = uint function(const(wchar)* lpszPhonebook, const(wchar)* lpszEntry, uint dwFlags);
struct RASUPDATECONN
{
    RASAPIVERSION version_;
    uint dwSize;
    uint dwFlags;
    uint dwIfIndex;
    RASTUNNELENDPOINT localEndPoint;
    RASTUNNELENDPOINT remoteEndPoint;
}
alias RASPBDLGFUNCW = void function(ulong param0, uint param1, PWSTR param2, void* param3);
alias RASPBDLGFUNCA = void function(ulong param0, uint param1, PSTR param2, void* param3);
struct RASNOUSERW
{
    uint dwSize;
    uint dwFlags;
    uint dwTimeoutMs;
    wchar[257] szUserName;
    wchar[257] szPassword;
    wchar[16] szDomain;
}
struct RASNOUSERA
{
    uint dwSize;
    uint dwFlags;
    uint dwTimeoutMs;
    CHAR[257] szUserName;
    CHAR[257] szPassword;
    CHAR[16] szDomain;
}
/+ [CONFLICTED] struct RASPBDLGW
{
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    ulong dwCallbackId;
    RASPBDLGFUNCW pCallback;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
+/
/+ [CONFLICTED] struct RASPBDLGA
{
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    ulong dwCallbackId;
    RASPBDLGFUNCA pCallback;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
+/
/+ [CONFLICTED] struct RASENTRYDLGW
{
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    wchar[257] szEntry;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
+/
/+ [CONFLICTED] struct RASENTRYDLGA
{
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    CHAR[257] szEntry;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
+/
struct RASDIALDLG
{
    align (4):
    uint dwSize;
    HWND hwndOwner;
    uint dwFlags;
    int xDlg;
    int yDlg;
    uint dwSubEntry;
    uint dwError;
    ulong reserved;
    ulong reserved2;
}
alias RasCustomDialDlgFn = BOOL function(HINSTANCE hInstDll, uint dwFlags, PWSTR lpszPhonebook, PWSTR lpszEntry, PWSTR lpszPhoneNumber, RASDIALDLG* lpInfo, void* pvInfo);
alias RasCustomEntryDlgFn = BOOL function(HINSTANCE hInstDll, PWSTR lpszPhonebook, PWSTR lpszEntry, RASENTRYDLGA* lpInfo, uint dwFlags);
alias ROUTER_INTERFACE_TYPE = int;
enum : int
{
    ROUTER_IF_TYPE_CLIENT      = 0x00000000,
    ROUTER_IF_TYPE_HOME_ROUTER = 0x00000001,
    ROUTER_IF_TYPE_FULL_ROUTER = 0x00000002,
    ROUTER_IF_TYPE_DEDICATED   = 0x00000003,
    ROUTER_IF_TYPE_INTERNAL    = 0x00000004,
    ROUTER_IF_TYPE_LOOPBACK    = 0x00000005,
    ROUTER_IF_TYPE_TUNNEL1     = 0x00000006,
    ROUTER_IF_TYPE_DIALOUT     = 0x00000007,
    ROUTER_IF_TYPE_MAX         = 0x00000008,
}

alias ROUTER_CONNECTION_STATE = int;
enum : int
{
    ROUTER_IF_STATE_UNREACHABLE  = 0x00000000,
    ROUTER_IF_STATE_DISCONNECTED = 0x00000001,
    ROUTER_IF_STATE_CONNECTING   = 0x00000002,
    ROUTER_IF_STATE_CONNECTED    = 0x00000003,
}

struct MPR_INTERFACE_0
{
    wchar[257] wszInterfaceName;
    HANDLE hInterface;
    BOOL fEnabled;
    ROUTER_INTERFACE_TYPE dwIfType;
    ROUTER_CONNECTION_STATE dwConnectionState;
    uint fUnReachabilityReasons;
    uint dwLastError;
}
struct MPR_IPINIP_INTERFACE_0
{
    wchar[257] wszFriendlyName;
    GUID Guid;
}
struct MPR_INTERFACE_1
{
    wchar[257] wszInterfaceName;
    HANDLE hInterface;
    BOOL fEnabled;
    ROUTER_INTERFACE_TYPE dwIfType;
    ROUTER_CONNECTION_STATE dwConnectionState;
    uint fUnReachabilityReasons;
    uint dwLastError;
    PWSTR lpwsDialoutHoursRestriction;
}
struct MPR_INTERFACE_2
{
    wchar[257] wszInterfaceName;
    HANDLE hInterface;
    BOOL fEnabled;
    ROUTER_INTERFACE_TYPE dwIfType;
    ROUTER_CONNECTION_STATE dwConnectionState;
    uint fUnReachabilityReasons;
    uint dwLastError;
    uint dwfOptions;
    wchar[129] szLocalPhoneNumber;
    PWSTR szAlternates;
    uint ipaddr;
    uint ipaddrDns;
    uint ipaddrDnsAlt;
    uint ipaddrWins;
    uint ipaddrWinsAlt;
    uint dwfNetProtocols;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[33] szX25PadType;
    wchar[201] szX25Address;
    wchar[201] szX25Facilities;
    wchar[201] szX25UserData;
    uint dwChannels;
    uint dwSubEntries;
    MPR_INTERFACE_DIAL_MODE dwDialMode;
    uint dwDialExtraPercent;
    uint dwDialExtraSampleSeconds;
    uint dwHangUpExtraPercent;
    uint dwHangUpExtraSampleSeconds;
    uint dwIdleDisconnectSeconds;
    uint dwType;
    MPR_ET dwEncryptionType;
    uint dwCustomAuthKey;
    uint dwCustomAuthDataSize;
    ubyte* lpbCustomAuthData;
    GUID guidId;
    MPR_VS dwVpnStrategy;
}
struct MPR_INTERFACE_3
{
    wchar[257] wszInterfaceName;
    HANDLE hInterface;
    BOOL fEnabled;
    ROUTER_INTERFACE_TYPE dwIfType;
    ROUTER_CONNECTION_STATE dwConnectionState;
    uint fUnReachabilityReasons;
    uint dwLastError;
    uint dwfOptions;
    wchar[129] szLocalPhoneNumber;
    PWSTR szAlternates;
    uint ipaddr;
    uint ipaddrDns;
    uint ipaddrDnsAlt;
    uint ipaddrWins;
    uint ipaddrWinsAlt;
    uint dwfNetProtocols;
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[33] szX25PadType;
    wchar[201] szX25Address;
    wchar[201] szX25Facilities;
    wchar[201] szX25UserData;
    uint dwChannels;
    uint dwSubEntries;
    MPR_INTERFACE_DIAL_MODE dwDialMode;
    uint dwDialExtraPercent;
    uint dwDialExtraSampleSeconds;
    uint dwHangUpExtraPercent;
    uint dwHangUpExtraSampleSeconds;
    uint dwIdleDisconnectSeconds;
    uint dwType;
    MPR_ET dwEncryptionType;
    uint dwCustomAuthKey;
    uint dwCustomAuthDataSize;
    ubyte* lpbCustomAuthData;
    GUID guidId;
    MPR_VS dwVpnStrategy;
    uint AddressCount;
    IN6_ADDR ipv6addrDns;
    IN6_ADDR ipv6addrDnsAlt;
    IN6_ADDR* ipv6addr;
}
struct MPR_DEVICE_0
{
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
}
struct MPR_DEVICE_1
{
    wchar[17] szDeviceType;
    wchar[129] szDeviceName;
    wchar[129] szLocalPhoneNumber;
    PWSTR szAlternates;
}
struct MPR_CREDENTIALSEX_0
{
    uint dwSize;
    ubyte* lpbCredentialsInfo;
}
struct MPR_CREDENTIALSEX_1
{
    uint dwSize;
    ubyte* lpbCredentialsInfo;
}
struct MPR_TRANSPORT_0
{
    uint dwTransportId;
    HANDLE hTransport;
    wchar[41] wszTransportName;
}
struct MPR_IFTRANSPORT_0
{
    uint dwTransportId;
    HANDLE hIfTransport;
    wchar[41] wszIfTransportName;
}
struct MPR_SERVER_0
{
    BOOL fLanOnlyMode;
    uint dwUpTime;
    uint dwTotalPorts;
    uint dwPortsInUse;
}
struct MPR_SERVER_1
{
    uint dwNumPptpPorts;
    uint dwPptpPortFlags;
    uint dwNumL2tpPorts;
    uint dwL2tpPortFlags;
}
struct MPR_SERVER_2
{
    uint dwNumPptpPorts;
    uint dwPptpPortFlags;
    uint dwNumL2tpPorts;
    uint dwL2tpPortFlags;
    uint dwNumSstpPorts;
    uint dwSstpPortFlags;
}
alias RAS_PORT_CONDITION = int;
enum : int
{
    RAS_PORT_NON_OPERATIONAL = 0x00000000,
    RAS_PORT_DISCONNECTED    = 0x00000001,
    RAS_PORT_CALLING_BACK    = 0x00000002,
    RAS_PORT_LISTENING       = 0x00000003,
    RAS_PORT_AUTHENTICATING  = 0x00000004,
    RAS_PORT_AUTHENTICATED   = 0x00000005,
    RAS_PORT_INITIALIZING    = 0x00000006,
}

alias RAS_HARDWARE_CONDITION = int;
enum : int
{
    RAS_HARDWARE_OPERATIONAL = 0x00000000,
    RAS_HARDWARE_FAILURE     = 0x00000001,
}

struct RAS_PORT_0
{
    HANDLE hPort;
    HANDLE hConnection;
    RAS_PORT_CONDITION dwPortCondition;
    uint dwTotalNumberOfCalls;
    uint dwConnectDuration;
    wchar[17] wszPortName;
    wchar[17] wszMediaName;
    wchar[129] wszDeviceName;
    wchar[17] wszDeviceType;
}
struct RAS_PORT_1
{
    HANDLE hPort;
    HANDLE hConnection;
    RAS_HARDWARE_CONDITION dwHardwareCondition;
    uint dwLineSpeed;
    uint dwBytesXmited;
    uint dwBytesRcved;
    uint dwFramesXmited;
    uint dwFramesRcved;
    uint dwCrcErr;
    uint dwTimeoutErr;
    uint dwAlignmentErr;
    uint dwHardwareOverrunErr;
    uint dwFramingErr;
    uint dwBufferOverrunErr;
    uint dwCompressionRatioIn;
    uint dwCompressionRatioOut;
}
struct RAS_PORT_2
{
    HANDLE hPort;
    HANDLE hConnection;
    uint dwConn_State;
    wchar[17] wszPortName;
    wchar[17] wszMediaName;
    wchar[129] wszDeviceName;
    wchar[17] wszDeviceType;
    RAS_HARDWARE_CONDITION dwHardwareCondition;
    uint dwLineSpeed;
    uint dwCrcErr;
    uint dwSerialOverRunErrs;
    uint dwTimeoutErr;
    uint dwAlignmentErr;
    uint dwHardwareOverrunErr;
    uint dwFramingErr;
    uint dwBufferOverrunErr;
    uint dwCompressionRatioIn;
    uint dwCompressionRatioOut;
    uint dwTotalErrors;
    ulong ullBytesXmited;
    ulong ullBytesRcved;
    ulong ullFramesXmited;
    ulong ullFramesRcved;
    ulong ullBytesTxUncompressed;
    ulong ullBytesTxCompressed;
    ulong ullBytesRcvUncompressed;
    ulong ullBytesRcvCompressed;
}
struct PPP_NBFCP_INFO
{
    uint dwError;
    wchar[17] wszWksta;
}
struct PPP_IPCP_INFO
{
    uint dwError;
    wchar[16] wszAddress;
    wchar[16] wszRemoteAddress;
}
struct PPP_IPCP_INFO2
{
    uint dwError;
    wchar[16] wszAddress;
    wchar[16] wszRemoteAddress;
    uint dwOptions;
    uint dwRemoteOptions;
}
struct PPP_IPXCP_INFO
{
    uint dwError;
    wchar[23] wszAddress;
}
struct PPP_ATCP_INFO
{
    uint dwError;
    wchar[33] wszAddress;
}
struct PPP_IPV6_CP_INFO
{
    uint dwVersion;
    uint dwSize;
    uint dwError;
    ubyte[8] bInterfaceIdentifier;
    ubyte[8] bRemoteInterfaceIdentifier;
    uint dwOptions;
    uint dwRemoteOptions;
    ubyte[8] bPrefix;
    uint dwPrefixLength;
}
struct PPP_INFO
{
    PPP_NBFCP_INFO nbf;
    PPP_IPCP_INFO ip;
    PPP_IPXCP_INFO ipx;
    PPP_ATCP_INFO at;
}
struct PPP_CCP_INFO
{
    uint dwError;
    uint dwCompressionAlgorithm;
    uint dwOptions;
    uint dwRemoteCompressionAlgorithm;
    uint dwRemoteOptions;
}
struct PPP_LCP_INFO
{
    uint dwError;
    PPP_LCP dwAuthenticationProtocol;
    PPP_LCP_INFO_AUTH_DATA dwAuthenticationData;
    uint dwRemoteAuthenticationProtocol;
    uint dwRemoteAuthenticationData;
    uint dwTerminateReason;
    uint dwRemoteTerminateReason;
    uint dwOptions;
    uint dwRemoteOptions;
    uint dwEapTypeId;
    uint dwRemoteEapTypeId;
}
struct PPP_INFO_2
{
    PPP_NBFCP_INFO nbf;
    PPP_IPCP_INFO2 ip;
    PPP_IPXCP_INFO ipx;
    PPP_ATCP_INFO at;
    PPP_CCP_INFO ccp;
    PPP_LCP_INFO lcp;
}
struct PPP_INFO_3
{
    PPP_NBFCP_INFO nbf;
    PPP_IPCP_INFO2 ip;
    PPP_IPV6_CP_INFO ipv6;
    PPP_CCP_INFO ccp;
    PPP_LCP_INFO lcp;
}
struct RAS_CONNECTION_0
{
    HANDLE hConnection;
    HANDLE hInterface;
    uint dwConnectDuration;
    ROUTER_INTERFACE_TYPE dwInterfaceType;
    RAS_FLAGS dwConnectionFlags;
    wchar[257] wszInterfaceName;
    wchar[257] wszUserName;
    wchar[16] wszLogonDomain;
    wchar[17] wszRemoteComputer;
}
struct RAS_CONNECTION_1
{
    HANDLE hConnection;
    HANDLE hInterface;
    PPP_INFO PppInfo;
    uint dwBytesXmited;
    uint dwBytesRcved;
    uint dwFramesXmited;
    uint dwFramesRcved;
    uint dwCrcErr;
    uint dwTimeoutErr;
    uint dwAlignmentErr;
    uint dwHardwareOverrunErr;
    uint dwFramingErr;
    uint dwBufferOverrunErr;
    uint dwCompressionRatioIn;
    uint dwCompressionRatioOut;
}
struct RAS_CONNECTION_2
{
    HANDLE hConnection;
    wchar[257] wszUserName;
    ROUTER_INTERFACE_TYPE dwInterfaceType;
    GUID guid;
    PPP_INFO_2 PppInfo2;
}
alias RAS_QUARANTINE_STATE = int;
enum : int
{
    RAS_QUAR_STATE_NORMAL      = 0x00000000,
    RAS_QUAR_STATE_QUARANTINE  = 0x00000001,
    RAS_QUAR_STATE_PROBATION   = 0x00000002,
    RAS_QUAR_STATE_NOT_CAPABLE = 0x00000003,
}

struct RAS_CONNECTION_3
{
    uint dwVersion;
    uint dwSize;
    HANDLE hConnection;
    wchar[257] wszUserName;
    ROUTER_INTERFACE_TYPE dwInterfaceType;
    GUID guid;
    PPP_INFO_3 PppInfo3;
    RAS_QUARANTINE_STATE rasQuarState;
    FILETIME timer;
}
struct RAS_USER_0
{
    ubyte bfPrivilege;
    wchar[129] wszPhoneNumber;
}
struct RAS_USER_1
{
    ubyte bfPrivilege;
    wchar[129] wszPhoneNumber;
    ubyte bfPrivilege2;
}
struct MPR_FILTER_0
{
    BOOL fEnable;
}
struct MPRAPI_OBJECT_HEADER
{
    ubyte revision;
    ubyte type;
    ushort size;
}
alias MPRAPI_OBJECT_TYPE = int;
enum : int
{
    MPRAPI_OBJECT_TYPE_RAS_CONNECTION_OBJECT        = 0x00000001,
    MPRAPI_OBJECT_TYPE_MPR_SERVER_OBJECT            = 0x00000002,
    MPRAPI_OBJECT_TYPE_MPR_SERVER_SET_CONFIG_OBJECT = 0x00000003,
    MPRAPI_OBJECT_TYPE_AUTH_VALIDATION_OBJECT       = 0x00000004,
    MPRAPI_OBJECT_TYPE_UPDATE_CONNECTION_OBJECT     = 0x00000005,
    MPRAPI_OBJECT_TYPE_IF_CUSTOM_CONFIG_OBJECT      = 0x00000006,
}

struct PPP_PROJECTION_INFO
{
    uint dwIPv4NegotiationError;
    wchar[16] wszAddress;
    wchar[16] wszRemoteAddress;
    uint dwIPv4Options;
    uint dwIPv4RemoteOptions;
    ulong IPv4SubInterfaceIndex;
    uint dwIPv6NegotiationError;
    ubyte[8] bInterfaceIdentifier;
    ubyte[8] bRemoteInterfaceIdentifier;
    ubyte[8] bPrefix;
    uint dwPrefixLength;
    ulong IPv6SubInterfaceIndex;
    uint dwLcpError;
    PPP_LCP dwAuthenticationProtocol;
    PPP_LCP_INFO_AUTH_DATA dwAuthenticationData;
    PPP_LCP dwRemoteAuthenticationProtocol;
    PPP_LCP_INFO_AUTH_DATA dwRemoteAuthenticationData;
    uint dwLcpTerminateReason;
    uint dwLcpRemoteTerminateReason;
    uint dwLcpOptions;
    uint dwLcpRemoteOptions;
    uint dwEapTypeId;
    uint dwRemoteEapTypeId;
    uint dwCcpError;
    uint dwCompressionAlgorithm;
    uint dwCcpOptions;
    uint dwRemoteCompressionAlgorithm;
    uint dwCcpRemoteOptions;
}
struct PPP_PROJECTION_INFO2
{
    uint dwIPv4NegotiationError;
    wchar[16] wszAddress;
    wchar[16] wszRemoteAddress;
    uint dwIPv4Options;
    uint dwIPv4RemoteOptions;
    ulong IPv4SubInterfaceIndex;
    uint dwIPv6NegotiationError;
    ubyte[8] bInterfaceIdentifier;
    ubyte[8] bRemoteInterfaceIdentifier;
    ubyte[8] bPrefix;
    uint dwPrefixLength;
    ulong IPv6SubInterfaceIndex;
    uint dwLcpError;
    PPP_LCP dwAuthenticationProtocol;
    PPP_LCP_INFO_AUTH_DATA dwAuthenticationData;
    PPP_LCP dwRemoteAuthenticationProtocol;
    PPP_LCP_INFO_AUTH_DATA dwRemoteAuthenticationData;
    uint dwLcpTerminateReason;
    uint dwLcpRemoteTerminateReason;
    uint dwLcpOptions;
    uint dwLcpRemoteOptions;
    uint dwEapTypeId;
    uint dwEmbeddedEAPTypeId;
    uint dwRemoteEapTypeId;
    uint dwCcpError;
    uint dwCompressionAlgorithm;
    uint dwCcpOptions;
    uint dwRemoteCompressionAlgorithm;
    uint dwCcpRemoteOptions;
}
struct IKEV2_PROJECTION_INFO
{
    uint dwIPv4NegotiationError;
    wchar[16] wszAddress;
    wchar[16] wszRemoteAddress;
    ulong IPv4SubInterfaceIndex;
    uint dwIPv6NegotiationError;
    ubyte[8] bInterfaceIdentifier;
    ubyte[8] bRemoteInterfaceIdentifier;
    ubyte[8] bPrefix;
    uint dwPrefixLength;
    ulong IPv6SubInterfaceIndex;
    uint dwOptions;
    uint dwAuthenticationProtocol;
    uint dwEapTypeId;
    uint dwCompressionAlgorithm;
    uint dwEncryptionMethod;
}
struct IKEV2_PROJECTION_INFO2
{
    uint dwIPv4NegotiationError;
    wchar[16] wszAddress;
    wchar[16] wszRemoteAddress;
    ulong IPv4SubInterfaceIndex;
    uint dwIPv6NegotiationError;
    ubyte[8] bInterfaceIdentifier;
    ubyte[8] bRemoteInterfaceIdentifier;
    ubyte[8] bPrefix;
    uint dwPrefixLength;
    ulong IPv6SubInterfaceIndex;
    uint dwOptions;
    uint dwAuthenticationProtocol;
    uint dwEapTypeId;
    uint dwEmbeddedEAPTypeId;
    uint dwCompressionAlgorithm;
    uint dwEncryptionMethod;
}
struct PROJECTION_INFO
{
    ubyte projectionInfoType;
    union
    {
        PPP_PROJECTION_INFO PppProjectionInfo;
        IKEV2_PROJECTION_INFO Ikev2ProjectionInfo;
    }
}
struct PROJECTION_INFO2
{
    ubyte projectionInfoType;
    union
    {
        PPP_PROJECTION_INFO2 PppProjectionInfo;
        IKEV2_PROJECTION_INFO2 Ikev2ProjectionInfo;
    }
}
struct RAS_CONNECTION_EX
{
    MPRAPI_OBJECT_HEADER Header;
    uint dwConnectDuration;
    ROUTER_INTERFACE_TYPE dwInterfaceType;
    RAS_FLAGS dwConnectionFlags;
    wchar[257] wszInterfaceName;
    wchar[257] wszUserName;
    wchar[16] wszLogonDomain;
    wchar[17] wszRemoteComputer;
    GUID guid;
    RAS_QUARANTINE_STATE rasQuarState;
    FILETIME probationTime;
    uint dwBytesXmited;
    uint dwBytesRcved;
    uint dwFramesXmited;
    uint dwFramesRcved;
    uint dwCrcErr;
    uint dwTimeoutErr;
    uint dwAlignmentErr;
    uint dwHardwareOverrunErr;
    uint dwFramingErr;
    uint dwBufferOverrunErr;
    uint dwCompressionRatioIn;
    uint dwCompressionRatioOut;
    uint dwNumSwitchOvers;
    wchar[65] wszRemoteEndpointAddress;
    wchar[65] wszLocalEndpointAddress;
    PROJECTION_INFO ProjectionInfo;
    HANDLE hConnection;
    HANDLE hInterface;
}
struct RAS_CONNECTION_4
{
    uint dwConnectDuration;
    ROUTER_INTERFACE_TYPE dwInterfaceType;
    RAS_FLAGS dwConnectionFlags;
    wchar[257] wszInterfaceName;
    wchar[257] wszUserName;
    wchar[16] wszLogonDomain;
    wchar[17] wszRemoteComputer;
    GUID guid;
    RAS_QUARANTINE_STATE rasQuarState;
    FILETIME probationTime;
    FILETIME connectionStartTime;
    ulong ullBytesXmited;
    ulong ullBytesRcved;
    uint dwFramesXmited;
    uint dwFramesRcved;
    uint dwCrcErr;
    uint dwTimeoutErr;
    uint dwAlignmentErr;
    uint dwHardwareOverrunErr;
    uint dwFramingErr;
    uint dwBufferOverrunErr;
    uint dwCompressionRatioIn;
    uint dwCompressionRatioOut;
    uint dwNumSwitchOvers;
    wchar[65] wszRemoteEndpointAddress;
    wchar[65] wszLocalEndpointAddress;
    PROJECTION_INFO2 ProjectionInfo;
    HANDLE hConnection;
    HANDLE hInterface;
    uint dwDeviceType;
}
struct ROUTER_CUSTOM_IKEv2_POLICY0
{
    uint dwIntegrityMethod;
    uint dwEncryptionMethod;
    uint dwCipherTransformConstant;
    uint dwAuthTransformConstant;
    uint dwPfsGroup;
    uint dwDhGroup;
}
struct ROUTER_IKEv2_IF_CUSTOM_CONFIG0
{
    uint dwSaLifeTime;
    uint dwSaDataSize;
    CRYPT_INTEGER_BLOB certificateName;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
}
struct MPR_IF_CUSTOMINFOEX0
{
    MPRAPI_OBJECT_HEADER Header;
    uint dwFlags;
    ROUTER_IKEv2_IF_CUSTOM_CONFIG0 customIkev2Config;
}
struct MPR_CERT_EKU
{
    uint dwSize;
    BOOL IsEKUOID;
    PWSTR pwszEKU;
}
struct VPN_TS_IP_ADDRESS
{
    ushort Type;
    union
    {
        IN_ADDR v4;
        IN6_ADDR v6;
    }
}
alias MPR_VPN_TS_TYPE = int;
enum : int
{
    MPR_VPN_TS_IPv4_ADDR_RANGE = 0x00000007,
    MPR_VPN_TS_IPv6_ADDR_RANGE = 0x00000008,
}

struct MPR_VPN_TRAFFIC_SELECTOR
{
    MPR_VPN_TS_TYPE type;
    ubyte protocolId;
    ushort portStart;
    ushort portEnd;
    ushort tsPayloadId;
    VPN_TS_IP_ADDRESS addrStart;
    VPN_TS_IP_ADDRESS addrEnd;
}
struct MPR_VPN_TRAFFIC_SELECTORS
{
    uint numTsi;
    uint numTsr;
    MPR_VPN_TRAFFIC_SELECTOR* tsI;
    MPR_VPN_TRAFFIC_SELECTOR* tsR;
}
struct ROUTER_IKEv2_IF_CUSTOM_CONFIG2
{
    uint dwSaLifeTime;
    uint dwSaDataSize;
    CRYPT_INTEGER_BLOB certificateName;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
    CRYPT_INTEGER_BLOB certificateHash;
    uint dwMmSaLifeTime;
    MPR_VPN_TRAFFIC_SELECTORS vpnTrafficSelectors;
}
struct MPR_IF_CUSTOMINFOEX2
{
    MPRAPI_OBJECT_HEADER Header;
    uint dwFlags;
    ROUTER_IKEv2_IF_CUSTOM_CONFIG2 customIkev2Config;
}
struct IKEV2_TUNNEL_CONFIG_PARAMS4
{
    uint dwIdleTimeout;
    uint dwNetworkBlackoutTime;
    uint dwSaLifeTime;
    uint dwSaDataSizeForRenegotiation;
    uint dwConfigOptions;
    uint dwTotalCertificates;
    CRYPT_INTEGER_BLOB* certificateNames;
    CRYPT_INTEGER_BLOB machineCertificateName;
    uint dwEncryptionType;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
    uint dwTotalEkus;
    MPR_CERT_EKU* certificateEKUs;
    CRYPT_INTEGER_BLOB machineCertificateHash;
    uint dwMmSaLifeTime;
}
struct ROUTER_IKEv2_IF_CUSTOM_CONFIG1
{
    uint dwSaLifeTime;
    uint dwSaDataSize;
    CRYPT_INTEGER_BLOB certificateName;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
    CRYPT_INTEGER_BLOB certificateHash;
}
struct MPR_IF_CUSTOMINFOEX1
{
    MPRAPI_OBJECT_HEADER Header;
    uint dwFlags;
    ROUTER_IKEv2_IF_CUSTOM_CONFIG1 customIkev2Config;
}
struct IKEV2_TUNNEL_CONFIG_PARAMS3
{
    uint dwIdleTimeout;
    uint dwNetworkBlackoutTime;
    uint dwSaLifeTime;
    uint dwSaDataSizeForRenegotiation;
    uint dwConfigOptions;
    uint dwTotalCertificates;
    CRYPT_INTEGER_BLOB* certificateNames;
    CRYPT_INTEGER_BLOB machineCertificateName;
    uint dwEncryptionType;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
    uint dwTotalEkus;
    MPR_CERT_EKU* certificateEKUs;
    CRYPT_INTEGER_BLOB machineCertificateHash;
}
struct IKEV2_TUNNEL_CONFIG_PARAMS2
{
    uint dwIdleTimeout;
    uint dwNetworkBlackoutTime;
    uint dwSaLifeTime;
    uint dwSaDataSizeForRenegotiation;
    uint dwConfigOptions;
    uint dwTotalCertificates;
    CRYPT_INTEGER_BLOB* certificateNames;
    CRYPT_INTEGER_BLOB machineCertificateName;
    uint dwEncryptionType;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
}
struct L2TP_TUNNEL_CONFIG_PARAMS2
{
    uint dwIdleTimeout;
    uint dwEncryptionType;
    uint dwSaLifeTime;
    uint dwSaDataSizeForRenegotiation;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
    uint dwMmSaLifeTime;
}
struct L2TP_TUNNEL_CONFIG_PARAMS1
{
    uint dwIdleTimeout;
    uint dwEncryptionType;
    uint dwSaLifeTime;
    uint dwSaDataSizeForRenegotiation;
    ROUTER_CUSTOM_IKEv2_POLICY0* customPolicy;
}
struct IKEV2_CONFIG_PARAMS
{
    uint dwNumPorts;
    uint dwPortFlags;
    uint dwTunnelConfigParamFlags;
    IKEV2_TUNNEL_CONFIG_PARAMS4 TunnelConfigParams;
}
struct PPTP_CONFIG_PARAMS
{
    uint dwNumPorts;
    uint dwPortFlags;
}
struct L2TP_CONFIG_PARAMS1
{
    uint dwNumPorts;
    uint dwPortFlags;
    uint dwTunnelConfigParamFlags;
    L2TP_TUNNEL_CONFIG_PARAMS2 TunnelConfigParams;
}
struct GRE_CONFIG_PARAMS0
{
    uint dwNumPorts;
    uint dwPortFlags;
}
struct L2TP_CONFIG_PARAMS0
{
    uint dwNumPorts;
    uint dwPortFlags;
}
struct SSTP_CERT_INFO
{
    BOOL isDefault;
    CRYPT_INTEGER_BLOB certBlob;
}
struct SSTP_CONFIG_PARAMS
{
    uint dwNumPorts;
    uint dwPortFlags;
    BOOL isUseHttps;
    uint certAlgorithm;
    SSTP_CERT_INFO sstpCertDetails;
}
struct MPRAPI_TUNNEL_CONFIG_PARAMS0
{
    IKEV2_CONFIG_PARAMS IkeConfigParams;
    PPTP_CONFIG_PARAMS PptpConfigParams;
    L2TP_CONFIG_PARAMS1 L2tpConfigParams;
    SSTP_CONFIG_PARAMS SstpConfigParams;
}
struct MPRAPI_TUNNEL_CONFIG_PARAMS1
{
    IKEV2_CONFIG_PARAMS IkeConfigParams;
    PPTP_CONFIG_PARAMS PptpConfigParams;
    L2TP_CONFIG_PARAMS1 L2tpConfigParams;
    SSTP_CONFIG_PARAMS SstpConfigParams;
    GRE_CONFIG_PARAMS0 GREConfigParams;
}
struct MPR_SERVER_EX0
{
    MPRAPI_OBJECT_HEADER Header;
    uint fLanOnlyMode;
    uint dwUpTime;
    uint dwTotalPorts;
    uint dwPortsInUse;
    uint Reserved;
    MPRAPI_TUNNEL_CONFIG_PARAMS0 ConfigParams;
}
struct MPR_SERVER_EX1
{
    MPRAPI_OBJECT_HEADER Header;
    uint fLanOnlyMode;
    uint dwUpTime;
    uint dwTotalPorts;
    uint dwPortsInUse;
    uint Reserved;
    MPRAPI_TUNNEL_CONFIG_PARAMS1 ConfigParams;
}
struct MPR_SERVER_SET_CONFIG_EX0
{
    MPRAPI_OBJECT_HEADER Header;
    uint setConfigForProtocols;
    MPRAPI_TUNNEL_CONFIG_PARAMS0 ConfigParams;
}
struct MPR_SERVER_SET_CONFIG_EX1
{
    MPRAPI_OBJECT_HEADER Header;
    uint setConfigForProtocols;
    MPRAPI_TUNNEL_CONFIG_PARAMS1 ConfigParams;
}
struct AUTH_VALIDATION_EX
{
    MPRAPI_OBJECT_HEADER Header;
    HANDLE hRasConnection;
    wchar[257] wszUserName;
    wchar[16] wszLogonDomain;
    uint AuthInfoSize;
    ubyte[1] AuthInfo;
}
struct RAS_UPDATE_CONNECTION
{
    MPRAPI_OBJECT_HEADER Header;
    uint dwIfIndex;
    wchar[65] wszLocalEndpointAddress;
    wchar[65] wszRemoteEndpointAddress;
}
alias PMPRADMINGETIPADDRESSFORUSER = uint function(PWSTR param0, PWSTR param1, uint* param2, BOOL* param3);
alias PMPRADMINRELEASEIPADRESS = void function(PWSTR param0, PWSTR param1, uint* param2);
alias PMPRADMINGETIPV6ADDRESSFORUSER = uint function(PWSTR param0, PWSTR param1, IN6_ADDR* param2, BOOL* param3);
alias PMPRADMINRELEASEIPV6ADDRESSFORUSER = void function(PWSTR param0, PWSTR param1, IN6_ADDR* param2);
alias PMPRADMINACCEPTNEWCONNECTION = BOOL function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1);
alias PMPRADMINACCEPTNEWCONNECTION2 = BOOL function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1, RAS_CONNECTION_2* param2);
alias PMPRADMINACCEPTNEWCONNECTION3 = BOOL function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1, RAS_CONNECTION_2* param2, RAS_CONNECTION_3* param3);
alias PMPRADMINACCEPTNEWLINK = BOOL function(RAS_PORT_0* param0, RAS_PORT_1* param1);
alias PMPRADMINCONNECTIONHANGUPNOTIFICATION = void function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1);
alias PMPRADMINCONNECTIONHANGUPNOTIFICATION2 = void function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1, RAS_CONNECTION_2* param2);
alias PMPRADMINCONNECTIONHANGUPNOTIFICATION3 = void function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1, RAS_CONNECTION_2* param2, RAS_CONNECTION_3* param3);
alias PMPRADMINLINKHANGUPNOTIFICATION = void function(RAS_PORT_0* param0, RAS_PORT_1* param1);
alias PMPRADMINTERMINATEDLL = uint function();
alias PMPRADMINACCEPTREAUTHENTICATION = BOOL function(RAS_CONNECTION_0* param0, RAS_CONNECTION_1* param1, RAS_CONNECTION_2* param2, RAS_CONNECTION_3* param3);
alias PMPRADMINACCEPTNEWCONNECTIONEX = BOOL function(RAS_CONNECTION_EX* param0);
alias PMPRADMINACCEPTREAUTHENTICATIONEX = BOOL function(RAS_CONNECTION_EX* param0);
alias PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX = BOOL function(RAS_CONNECTION_EX* param0);
alias PMPRADMINCONNECTIONHANGUPNOTIFICATIONEX = void function(RAS_CONNECTION_EX* param0);
alias PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX = uint function(AUTH_VALIDATION_EX* param0);
struct MPRAPI_ADMIN_DLL_CALLBACKS
{
    ubyte revision;
    PMPRADMINGETIPADDRESSFORUSER lpfnMprAdminGetIpAddressForUser;
    PMPRADMINRELEASEIPADRESS lpfnMprAdminReleaseIpAddress;
    PMPRADMINGETIPV6ADDRESSFORUSER lpfnMprAdminGetIpv6AddressForUser;
    PMPRADMINRELEASEIPV6ADDRESSFORUSER lpfnMprAdminReleaseIpV6AddressForUser;
    PMPRADMINACCEPTNEWLINK lpfnRasAdminAcceptNewLink;
    PMPRADMINLINKHANGUPNOTIFICATION lpfnRasAdminLinkHangupNotification;
    PMPRADMINTERMINATEDLL lpfnRasAdminTerminateDll;
    PMPRADMINACCEPTNEWCONNECTIONEX lpfnRasAdminAcceptNewConnectionEx;
    PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX lpfnRasAdminAcceptEndpointChangeEx;
    PMPRADMINACCEPTREAUTHENTICATIONEX lpfnRasAdminAcceptReauthenticationEx;
    PMPRADMINCONNECTIONHANGUPNOTIFICATIONEX lpfnRasAdminConnectionHangupNotificationEx;
    PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX lpfnRASValidatePreAuthenticatedConnectionEx;
}
struct SECURITY_MESSAGE
{
    SECURITY_MESSAGE_MSG_ID dwMsgId;
    long hPort;
    uint dwError;
    CHAR[257] UserName;
    CHAR[16] Domain;
}
struct RAS_SECURITY_INFO
{
    uint LastError;
    uint BytesReceived;
    CHAR[129] DeviceName;
}
alias RASSECURITYPROC = uint function();
struct MGM_IF_ENTRY
{
    uint dwIfIndex;
    uint dwIfNextHopAddr;
    BOOL bIGMP;
    BOOL bIsEnabled;
}
alias PMGM_RPF_CALLBACK = uint function(uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint* pdwInIfIndex, uint* pdwInIfNextHopAddr, uint* pdwUpStreamNbr, uint dwHdrSize, ubyte* pbPacketHdr, ubyte* pbRoute);
alias PMGM_CREATION_ALERT_CALLBACK = uint function(uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint dwInIfIndex, uint dwInIfNextHopAddr, uint dwIfCount, MGM_IF_ENTRY* pmieOutIfList);
alias PMGM_PRUNE_ALERT_CALLBACK = uint function(uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint dwIfIndex, uint dwIfNextHopAddr, BOOL bMemberDelete, uint* pdwTimeout);
alias PMGM_JOIN_ALERT_CALLBACK = uint function(uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, BOOL bMemberUpdate);
alias PMGM_WRONG_IF_CALLBACK = uint function(uint dwSourceAddr, uint dwGroupAddr, uint dwIfIndex, uint dwIfNextHopAddr, uint dwHdrSize, ubyte* pbPacketHdr);
alias PMGM_LOCAL_JOIN_CALLBACK = uint function(uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint dwIfIndex, uint dwIfNextHopAddr);
alias PMGM_LOCAL_LEAVE_CALLBACK = uint function(uint dwSourceAddr, uint dwSourceMask, uint dwGroupAddr, uint dwGroupMask, uint dwIfIndex, uint dwIfNextHopAddr);
alias PMGM_DISABLE_IGMP_CALLBACK = uint function(uint dwIfIndex, uint dwIfNextHopAddr);
alias PMGM_ENABLE_IGMP_CALLBACK = uint function(uint dwIfIndex, uint dwIfNextHopAddr);
struct ROUTING_PROTOCOL_CONFIG
{
    uint dwCallbackFlags;
    PMGM_RPF_CALLBACK pfnRpfCallback;
    PMGM_CREATION_ALERT_CALLBACK pfnCreationAlertCallback;
    PMGM_PRUNE_ALERT_CALLBACK pfnPruneAlertCallback;
    PMGM_JOIN_ALERT_CALLBACK pfnJoinAlertCallback;
    PMGM_WRONG_IF_CALLBACK pfnWrongIfCallback;
    PMGM_LOCAL_JOIN_CALLBACK pfnLocalJoinCallback;
    PMGM_LOCAL_LEAVE_CALLBACK pfnLocalLeaveCallback;
    PMGM_DISABLE_IGMP_CALLBACK pfnDisableIgmpCallback;
    PMGM_ENABLE_IGMP_CALLBACK pfnEnableIgmpCallback;
}
alias MGM_ENUM_TYPES = int;
enum : int
{
    ANY_SOURCE  = 0x00000000,
    ALL_SOURCES = 0x00000001,
}

struct SOURCE_GROUP_ENTRY
{
    uint dwSourceAddr;
    uint dwSourceMask;
    uint dwGroupAddr;
    uint dwGroupMask;
}
struct RTM_REGN_PROFILE
{
    uint MaxNextHopsInRoute;
    uint MaxHandlesInEnum;
    uint ViewsSupported;
    uint NumberOfViews;
}
struct RTM_NET_ADDRESS
{
    ushort AddressFamily;
    ushort NumBits;
    ubyte[16] AddrBits;
}
struct RTM_PREF_INFO
{
    uint Metric;
    uint Preference;
}
struct RTM_NEXTHOP_LIST
{
    ushort NumNextHops;
    long[1] NextHops;
}
struct RTM_DEST_INFO
{
    long DestHandle;
    RTM_NET_ADDRESS DestAddress;
    FILETIME LastChanged;
    uint BelongsToViews;
    uint NumberOfViews;
    struct
    {
        int ViewId;
        uint NumRoutes;
        long Route;
        long Owner;
        uint DestFlags;
        long HoldRoute;
    }
}
struct RTM_ROUTE_INFO
{
    long DestHandle;
    long RouteOwner;
    long Neighbour;
    ubyte State;
    ubyte Flags1;
    ushort Flags;
    RTM_PREF_INFO PrefInfo;
    uint BelongsToViews;
    void* EntitySpecificInfo;
    RTM_NEXTHOP_LIST NextHopsList;
}
struct RTM_NEXTHOP_INFO
{
    RTM_NET_ADDRESS NextHopAddress;
    long NextHopOwner;
    uint InterfaceIndex;
    ushort State;
    ushort Flags;
    void* EntitySpecificInfo;
    long RemoteNextHop;
}
struct RTM_ENTITY_ID
{
    union
    {
        struct
        {
            uint EntityProtocolId;
            uint EntityInstanceId;
        }
        ulong EntityId;
    }
}
struct RTM_ENTITY_INFO
{
    ushort RtmInstanceId;
    ushort AddressFamily;
    RTM_ENTITY_ID EntityId;
}
alias RTM_EVENT_TYPE = int;
enum : int
{
    RTM_ENTITY_REGISTERED   = 0x00000000,
    RTM_ENTITY_DEREGISTERED = 0x00000001,
    RTM_ROUTE_EXPIRED       = 0x00000002,
    RTM_CHANGE_NOTIFICATION = 0x00000003,
}

alias RTM_EVENT_CALLBACK = uint function(long RtmRegHandle, RTM_EVENT_TYPE EventType, void* Context1, void* Context2);
struct RTM_ENTITY_METHOD_INPUT
{
    uint MethodType;
    uint InputSize;
    ubyte[1] InputData;
}
struct RTM_ENTITY_METHOD_OUTPUT
{
    uint MethodType;
    uint MethodStatus;
    uint OutputSize;
    ubyte[1] OutputData;
}
alias RTM_ENTITY_EXPORT_METHOD = void function(long CallerHandle, long CalleeHandle, RTM_ENTITY_METHOD_INPUT* Input, RTM_ENTITY_METHOD_OUTPUT* Output);
struct RTM_ENTITY_EXPORT_METHODS
{
    uint NumMethods;
    RTM_ENTITY_EXPORT_METHOD[1] Methods;
}
