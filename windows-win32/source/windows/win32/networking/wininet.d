module windows.win32.networking.wininet;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, PSTR, PWSTR, SYSTEMTIME;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.networking.winhttp : WIN_HTTP_CREATE_URL_FLAGS;
import windows.win32.security.authentication.identity : SecPkgContext_Bindings, SecPkgContext_CipherInfo, SecPkgContext_ConnectionInfo;
import windows.win32.security.cryptography : ALG_ID, CERT_CHAIN_CONTEXT, CERT_CONTEXT;
import windows.win32.storage.filesystem : WIN32_FIND_DATAA, WIN32_FIND_DATAW;
import windows.win32.system.com : IUnknown;
import windows.win32.system.winrt : IInspectable;

version (Windows):
extern (Windows):

alias CACHE_CONFIG = uint;
enum : uint
{
    CACHE_CONFIG_FORCE_CLEANUP_FC        = 0x00000020,
    CACHE_CONFIG_DISK_CACHE_PATHS_FC     = 0x00000040,
    CACHE_CONFIG_SYNC_MODE_FC            = 0x00000080,
    CACHE_CONFIG_CONTENT_PATHS_FC        = 0x00000100,
    CACHE_CONFIG_HISTORY_PATHS_FC        = 0x00000400,
    CACHE_CONFIG_COOKIES_PATHS_FC        = 0x00000200,
    CACHE_CONFIG_QUOTA_FC                = 0x00000800,
    CACHE_CONFIG_USER_MODE_FC            = 0x00001000,
    CACHE_CONFIG_CONTENT_USAGE_FC        = 0x00002000,
    CACHE_CONFIG_STICKY_CONTENT_USAGE_FC = 0x00004000,
}

alias FTP_FLAGS = uint;
enum : uint
{
    FTP_TRANSFER_TYPE_ASCII       = 0x00000001,
    FTP_TRANSFER_TYPE_BINARY      = 0x00000002,
    FTP_TRANSFER_TYPE_UNKNOWN     = 0x00000000,
    INTERNET_FLAG_TRANSFER_ASCII  = 0x00000001,
    INTERNET_FLAG_TRANSFER_BINARY = 0x00000002,
}

alias INTERNET_CONNECTION = uint;
enum : uint
{
    INTERNET_CONNECTION_CONFIGURED = 0x00000040,
    INTERNET_CONNECTION_LAN        = 0x00000002,
    INTERNET_CONNECTION_MODEM      = 0x00000001,
    INTERNET_CONNECTION_MODEM_BUSY = 0x00000008,
    INTERNET_CONNECTION_OFFLINE    = 0x00000020,
    INTERNET_CONNECTION_PROXY      = 0x00000004,
    INTERNET_RAS_INSTALLED         = 0x00000010,
}

alias HTTP_ADDREQ_FLAG = uint;
enum : uint
{
    HTTP_ADDREQ_FLAG_ADD                     = 0x20000000,
    HTTP_ADDREQ_FLAG_ADD_IF_NEW              = 0x10000000,
    HTTP_ADDREQ_FLAG_COALESCE                = 0x40000000,
    HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA     = 0x40000000,
    HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON = 0x01000000,
    HTTP_ADDREQ_FLAG_REPLACE                 = 0x80000000,
}

alias INTERNET_COOKIE_FLAGS = uint;
enum : uint
{
    INTERNET_COOKIE_HTTPONLY      = 0x00002000,
    INTERNET_COOKIE_THIRD_PARTY   = 0x00000010,
    INTERNET_FLAG_RESTRICTED_ZONE = 0x00020000,
}

alias PROXY_AUTO_DETECT_TYPE = uint;
enum : uint
{
    PROXY_AUTO_DETECT_TYPE_DHCP  = 0x00000001,
    PROXY_AUTO_DETECT_TYPE_DNS_A = 0x00000002,
}

alias INTERNET_AUTODIAL = uint;
enum : uint
{
    INTERNET_AUTODIAL_FAILIFSECURITYCHECK  = 0x00000004,
    INTERNET_AUTODIAL_FORCE_ONLINE         = 0x00000001,
    INTERNET_AUTODIAL_FORCE_UNATTENDED     = 0x00000002,
    INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT = 0x00000008,
}

alias GOPHER_TYPE = uint;
enum : uint
{
    GOPHER_TYPE_ASK            = 0x40000000,
    GOPHER_TYPE_BINARY         = 0x00000200,
    GOPHER_TYPE_BITMAP         = 0x00004000,
    GOPHER_TYPE_CALENDAR       = 0x00080000,
    GOPHER_TYPE_CSO            = 0x00000004,
    GOPHER_TYPE_DIRECTORY      = 0x00000002,
    GOPHER_TYPE_DOS_ARCHIVE    = 0x00000020,
    GOPHER_TYPE_ERROR          = 0x00000008,
    GOPHER_TYPE_GIF            = 0x00001000,
    GOPHER_TYPE_GOPHER_PLUS    = 0x80000000,
    GOPHER_TYPE_HTML           = 0x00020000,
    GOPHER_TYPE_IMAGE          = 0x00002000,
    GOPHER_TYPE_INDEX_SERVER   = 0x00000080,
    GOPHER_TYPE_INLINE         = 0x00100000,
    GOPHER_TYPE_MAC_BINHEX     = 0x00000010,
    GOPHER_TYPE_MOVIE          = 0x00008000,
    GOPHER_TYPE_PDF            = 0x00040000,
    GOPHER_TYPE_REDUNDANT      = 0x00000400,
    GOPHER_TYPE_SOUND          = 0x00010000,
    GOPHER_TYPE_TELNET         = 0x00000100,
    GOPHER_TYPE_TEXT_FILE      = 0x00000001,
    GOPHER_TYPE_TN3270         = 0x00000800,
    GOPHER_TYPE_UNIX_UUENCODED = 0x00000040,
    GOPHER_TYPE_UNKNOWN        = 0x20000000,
}

alias INTERNET_PER_CONN = uint;
enum : uint
{
    INTERNET_PER_CONN_AUTOCONFIG_URL               = 0x00000004,
    INTERNET_PER_CONN_AUTODISCOVERY_FLAGS          = 0x00000005,
    INTERNET_PER_CONN_FLAGS                        = 0x00000001,
    INTERNET_PER_CONN_PROXY_BYPASS                 = 0x00000003,
    INTERNET_PER_CONN_PROXY_SERVER                 = 0x00000002,
    INTERNET_PER_CONN_AUTOCONFIG_SECONDARY_URL     = 0x00000006,
    INTERNET_PER_CONN_AUTOCONFIG_RELOAD_DELAY_MINS = 0x00000007,
    INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_TIME  = 0x00000008,
    INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_URL   = 0x00000009,
}

alias INTERNET_ACCESS_TYPE = uint;
enum : uint
{
    INTERNET_OPEN_TYPE_DIRECT    = 0x00000001,
    INTERNET_OPEN_TYPE_PRECONFIG = 0x00000000,
    INTERNET_OPEN_TYPE_PROXY     = 0x00000003,
}

alias INTERNET_STATE = uint;
enum : uint
{
    INTERNET_STATE_CONNECTED            = 0x00000001,
    INTERNET_STATE_DISCONNECTED         = 0x00000002,
    INTERNET_STATE_DISCONNECTED_BY_USER = 0x00000010,
    INTERNET_STATE_IDLE                 = 0x00000100,
    INTERNET_STATE_BUSY                 = 0x00000200,
}

BOOL InternetTimeFromSystemTimeA(const(SYSTEMTIME)*, uint, PSTR, uint);
BOOL InternetTimeFromSystemTimeW(const(SYSTEMTIME)*, uint, PWSTR, uint);
BOOL InternetTimeFromSystemTime(const(SYSTEMTIME)*, uint, PSTR, uint);
BOOL InternetTimeToSystemTimeA(const(char)*, SYSTEMTIME*, uint);
BOOL InternetTimeToSystemTimeW(const(wchar)*, SYSTEMTIME*, uint);
BOOL InternetTimeToSystemTime(const(char)*, SYSTEMTIME*, uint);
BOOL InternetCrackUrlA(const(char)*, uint, WIN_HTTP_CREATE_URL_FLAGS, URL_COMPONENTSA*);
BOOL InternetCrackUrlW(const(wchar)*, uint, WIN_HTTP_CREATE_URL_FLAGS, URL_COMPONENTSW*);
BOOL InternetCreateUrlA(URL_COMPONENTSA*, uint, PSTR, uint*);
BOOL InternetCreateUrlW(URL_COMPONENTSW*, uint, PWSTR, uint*);
BOOL InternetCanonicalizeUrlA(const(char)*, PSTR, uint*, uint);
BOOL InternetCanonicalizeUrlW(const(wchar)*, PWSTR, uint*, uint);
BOOL InternetCombineUrlA(const(char)*, const(char)*, PSTR, uint*, uint);
BOOL InternetCombineUrlW(const(wchar)*, const(wchar)*, PWSTR, uint*, uint);
void* InternetOpenA(const(char)*, uint, const(char)*, const(char)*, uint);
void* InternetOpenW(const(wchar)*, uint, const(wchar)*, const(wchar)*, uint);
BOOL InternetCloseHandle(void*);
void* InternetConnectA(void*, const(char)*, ushort, const(char)*, const(char)*, uint, uint, ulong);
void* InternetConnectW(void*, const(wchar)*, ushort, const(wchar)*, const(wchar)*, uint, uint, ulong);
void* InternetOpenUrlA(void*, const(char)*, const(char)*, uint, uint, ulong);
void* InternetOpenUrlW(void*, const(wchar)*, const(wchar)*, uint, uint, ulong);
BOOL InternetReadFile(void*, void*, uint, uint*);
BOOL InternetReadFileExA(void*, INTERNET_BUFFERSA*, uint, ulong);
BOOL InternetReadFileExW(void*, INTERNET_BUFFERSW*, uint, ulong);
uint InternetSetFilePointer(void*, int, int*, uint, ulong);
BOOL InternetWriteFile(void*, const(void)*, uint, uint*);
BOOL InternetQueryDataAvailable(void*, uint*, uint, ulong);
BOOL InternetFindNextFileA(void*, void*);
BOOL InternetFindNextFileW(void*, void*);
BOOL InternetQueryOptionA(void*, uint, void*, uint*);
BOOL InternetQueryOptionW(void*, uint, void*, uint*);
BOOL InternetSetOptionA(void*, uint, void*, uint);
BOOL InternetSetOptionW(void*, uint, void*, uint);
BOOL InternetSetOptionExA(void*, uint, void*, uint, uint);
BOOL InternetSetOptionExW(void*, uint, void*, uint, uint);
BOOL InternetLockRequestFile(void*, HANDLE*);
BOOL InternetUnlockRequestFile(HANDLE);
BOOL InternetGetLastResponseInfoA(uint*, PSTR, uint*);
BOOL InternetGetLastResponseInfoW(uint*, PWSTR, uint*);
LPINTERNET_STATUS_CALLBACK InternetSetStatusCallbackA(void*, LPINTERNET_STATUS_CALLBACK);
LPINTERNET_STATUS_CALLBACK InternetSetStatusCallbackW(void*, LPINTERNET_STATUS_CALLBACK);
LPINTERNET_STATUS_CALLBACK InternetSetStatusCallback(void*, LPINTERNET_STATUS_CALLBACK);
void* FtpFindFirstFileA(void*, const(char)*, WIN32_FIND_DATAA*, uint, ulong);
void* FtpFindFirstFileW(void*, const(wchar)*, WIN32_FIND_DATAW*, uint, ulong);
BOOL FtpGetFileA(void*, const(char)*, const(char)*, BOOL, uint, uint, ulong);
BOOL FtpGetFileW(void*, const(wchar)*, const(wchar)*, BOOL, uint, uint, ulong);
BOOL FtpPutFileA(void*, const(char)*, const(char)*, FTP_FLAGS, ulong);
BOOL FtpPutFileW(void*, const(wchar)*, const(wchar)*, FTP_FLAGS, ulong);
BOOL FtpGetFileEx(void*, const(char)*, const(wchar)*, BOOL, uint, uint, ulong);
BOOL FtpPutFileEx(void*, const(wchar)*, const(char)*, uint, ulong);
BOOL FtpDeleteFileA(void*, const(char)*);
BOOL FtpDeleteFileW(void*, const(wchar)*);
BOOL FtpRenameFileA(void*, const(char)*, const(char)*);
BOOL FtpRenameFileW(void*, const(wchar)*, const(wchar)*);
void* FtpOpenFileA(void*, const(char)*, uint, FTP_FLAGS, ulong);
void* FtpOpenFileW(void*, const(wchar)*, uint, FTP_FLAGS, ulong);
BOOL FtpCreateDirectoryA(void*, const(char)*);
BOOL FtpCreateDirectoryW(void*, const(wchar)*);
BOOL FtpRemoveDirectoryA(void*, const(char)*);
BOOL FtpRemoveDirectoryW(void*, const(wchar)*);
BOOL FtpSetCurrentDirectoryA(void*, const(char)*);
BOOL FtpSetCurrentDirectoryW(void*, const(wchar)*);
BOOL FtpGetCurrentDirectoryA(void*, PSTR, uint*);
BOOL FtpGetCurrentDirectoryW(void*, PWSTR, uint*);
BOOL FtpCommandA(void*, BOOL, FTP_FLAGS, const(char)*, ulong, void**);
BOOL FtpCommandW(void*, BOOL, FTP_FLAGS, const(wchar)*, ulong, void**);
uint FtpGetFileSize(void*, uint*);
BOOL GopherCreateLocatorA(const(char)*, ushort, const(char)*, const(char)*, uint, PSTR, uint*);
BOOL GopherCreateLocatorW(const(wchar)*, ushort, const(wchar)*, const(wchar)*, uint, PWSTR, uint*);
BOOL GopherGetLocatorTypeA(const(char)*, uint*);
BOOL GopherGetLocatorTypeW(const(wchar)*, uint*);
void* GopherFindFirstFileA(void*, const(char)*, const(char)*, GOPHER_FIND_DATAA*, uint, ulong);
void* GopherFindFirstFileW(void*, const(wchar)*, const(wchar)*, GOPHER_FIND_DATAW*, uint, ulong);
void* GopherOpenFileA(void*, const(char)*, const(char)*, uint, ulong);
void* GopherOpenFileW(void*, const(wchar)*, const(wchar)*, uint, ulong);
BOOL GopherGetAttributeA(void*, const(char)*, const(char)*, ubyte*, uint, uint*, GOPHER_ATTRIBUTE_ENUMERATOR, ulong);
BOOL GopherGetAttributeW(void*, const(wchar)*, const(wchar)*, ubyte*, uint, uint*, GOPHER_ATTRIBUTE_ENUMERATOR, ulong);
void* HttpOpenRequestA(void*, const(char)*, const(char)*, const(char)*, const(char)*, const(char)**, uint, ulong);
void* HttpOpenRequestW(void*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)**, uint, ulong);
BOOL HttpAddRequestHeadersA(void*, const(char)*, uint, HTTP_ADDREQ_FLAG);
BOOL HttpAddRequestHeadersW(void*, const(wchar)*, uint, HTTP_ADDREQ_FLAG);
BOOL HttpSendRequestA(void*, const(char)*, uint, void*, uint);
BOOL HttpSendRequestW(void*, const(wchar)*, uint, void*, uint);
BOOL HttpSendRequestExA(void*, INTERNET_BUFFERSA*, INTERNET_BUFFERSA*, uint, ulong);
BOOL HttpSendRequestExW(void*, INTERNET_BUFFERSW*, INTERNET_BUFFERSW*, uint, ulong);
BOOL HttpEndRequestA(void*, INTERNET_BUFFERSA*, uint, ulong);
BOOL HttpEndRequestW(void*, INTERNET_BUFFERSW*, uint, ulong);
BOOL HttpQueryInfoA(void*, uint, void*, uint*, uint*);
BOOL HttpQueryInfoW(void*, uint, void*, uint*, uint*);
BOOL InternetSetCookieA(const(char)*, const(char)*, const(char)*);
BOOL InternetSetCookieW(const(wchar)*, const(wchar)*, const(wchar)*);
BOOL InternetGetCookieA(const(char)*, const(char)*, PSTR, uint*);
BOOL InternetGetCookieW(const(wchar)*, const(wchar)*, PWSTR, uint*);
uint InternetSetCookieExA(const(char)*, const(char)*, const(char)*, uint, ulong);
uint InternetSetCookieExW(const(wchar)*, const(wchar)*, const(wchar)*, uint, ulong);
BOOL InternetGetCookieExA(const(char)*, const(char)*, PSTR, uint*, INTERNET_COOKIE_FLAGS, void*);
BOOL InternetGetCookieExW(const(wchar)*, const(wchar)*, PWSTR, uint*, INTERNET_COOKIE_FLAGS, void*);
void InternetFreeCookies(INTERNET_COOKIE2*, uint);
uint InternetGetCookieEx2(const(wchar)*, const(wchar)*, uint, INTERNET_COOKIE2**, uint*);
uint InternetSetCookieEx2(const(wchar)*, const(INTERNET_COOKIE2)*, const(wchar)*, uint, uint*);
uint InternetAttemptConnect(uint);
BOOL InternetCheckConnectionA(const(char)*, uint, uint);
BOOL InternetCheckConnectionW(const(wchar)*, uint, uint);
BOOL ResumeSuspendedDownload(void*, uint);
uint InternetErrorDlg(HWND, void*, uint, uint, void**);
uint InternetConfirmZoneCrossingA(HWND, PSTR, PSTR, BOOL);
uint InternetConfirmZoneCrossingW(HWND, PWSTR, PWSTR, BOOL);
uint InternetConfirmZoneCrossing(HWND, PSTR, PSTR, BOOL);
BOOL CreateUrlCacheEntryA(const(char)*, uint, const(char)*, PSTR, uint);
BOOL CreateUrlCacheEntryW(const(wchar)*, uint, const(wchar)*, PWSTR, uint);
BOOL CommitUrlCacheEntryA(const(char)*, const(char)*, FILETIME, FILETIME, uint, ubyte*, uint, const(char)*, const(char)*);
BOOL CommitUrlCacheEntryW(const(wchar)*, const(wchar)*, FILETIME, FILETIME, uint, PWSTR, uint, const(wchar)*, const(wchar)*);
BOOL RetrieveUrlCacheEntryFileA(const(char)*, INTERNET_CACHE_ENTRY_INFOA*, uint*, uint);
BOOL RetrieveUrlCacheEntryFileW(const(wchar)*, INTERNET_CACHE_ENTRY_INFOW*, uint*, uint);
BOOL UnlockUrlCacheEntryFileA(const(char)*, uint);
BOOL UnlockUrlCacheEntryFileW(const(wchar)*, uint);
BOOL UnlockUrlCacheEntryFile(const(char)*, uint);
HANDLE RetrieveUrlCacheEntryStreamA(const(char)*, INTERNET_CACHE_ENTRY_INFOA*, uint*, BOOL, uint);
HANDLE RetrieveUrlCacheEntryStreamW(const(wchar)*, INTERNET_CACHE_ENTRY_INFOW*, uint*, BOOL, uint);
BOOL ReadUrlCacheEntryStream(HANDLE, uint, void*, uint*, uint);
BOOL ReadUrlCacheEntryStreamEx(HANDLE, ulong, void*, uint*);
BOOL UnlockUrlCacheEntryStream(HANDLE, uint);
BOOL GetUrlCacheEntryInfoA(const(char)*, INTERNET_CACHE_ENTRY_INFOA*, uint*);
BOOL GetUrlCacheEntryInfoW(const(wchar)*, INTERNET_CACHE_ENTRY_INFOW*, uint*);
HANDLE FindFirstUrlCacheGroup(uint, uint, void*, uint, long*, void*);
BOOL FindNextUrlCacheGroup(HANDLE, long*, void*);
BOOL GetUrlCacheGroupAttributeA(long, uint, uint, INTERNET_CACHE_GROUP_INFOA*, uint*, void*);
BOOL GetUrlCacheGroupAttributeW(long, uint, uint, INTERNET_CACHE_GROUP_INFOW*, uint*, void*);
BOOL SetUrlCacheGroupAttributeA(long, uint, uint, INTERNET_CACHE_GROUP_INFOA*, void*);
BOOL SetUrlCacheGroupAttributeW(long, uint, uint, INTERNET_CACHE_GROUP_INFOW*, void*);
BOOL GetUrlCacheEntryInfoExA(const(char)*, INTERNET_CACHE_ENTRY_INFOA*, uint*, PSTR, uint*, void*, uint);
BOOL GetUrlCacheEntryInfoExW(const(wchar)*, INTERNET_CACHE_ENTRY_INFOW*, uint*, PWSTR, uint*, void*, uint);
BOOL SetUrlCacheEntryInfoA(const(char)*, INTERNET_CACHE_ENTRY_INFOA*, uint);
BOOL SetUrlCacheEntryInfoW(const(wchar)*, INTERNET_CACHE_ENTRY_INFOW*, uint);
long CreateUrlCacheGroup(uint, void*);
BOOL DeleteUrlCacheGroup(long, uint, void*);
BOOL SetUrlCacheEntryGroupA(const(char)*, uint, long, ubyte*, uint, void*);
BOOL SetUrlCacheEntryGroupW(const(wchar)*, uint, long, ubyte*, uint, void*);
BOOL SetUrlCacheEntryGroup(const(char)*, uint, long, ubyte*, uint, void*);
HANDLE FindFirstUrlCacheEntryExA(const(char)*, uint, uint, long, INTERNET_CACHE_ENTRY_INFOA*, uint*, void*, uint*, void*);
HANDLE FindFirstUrlCacheEntryExW(const(wchar)*, uint, uint, long, INTERNET_CACHE_ENTRY_INFOW*, uint*, void*, uint*, void*);
BOOL FindNextUrlCacheEntryExA(HANDLE, INTERNET_CACHE_ENTRY_INFOA*, uint*, void*, uint*, void*);
BOOL FindNextUrlCacheEntryExW(HANDLE, INTERNET_CACHE_ENTRY_INFOW*, uint*, void*, uint*, void*);
HANDLE FindFirstUrlCacheEntryA(const(char)*, INTERNET_CACHE_ENTRY_INFOA*, uint*);
HANDLE FindFirstUrlCacheEntryW(const(wchar)*, INTERNET_CACHE_ENTRY_INFOW*, uint*);
BOOL FindNextUrlCacheEntryA(HANDLE, INTERNET_CACHE_ENTRY_INFOA*, uint*);
BOOL FindNextUrlCacheEntryW(HANDLE, INTERNET_CACHE_ENTRY_INFOW*, uint*);
BOOL FindCloseUrlCache(HANDLE);
BOOL DeleteUrlCacheEntryA(const(char)*);
BOOL DeleteUrlCacheEntryW(const(wchar)*);
BOOL DeleteUrlCacheEntry(const(char)*);
uint InternetDialA(HWND, PSTR, uint, ulong*, uint);
uint InternetDialW(HWND, PWSTR, uint, ulong*, uint);
uint InternetDial(HWND, PSTR, uint, uint*, uint);
uint InternetHangUp(ulong, uint);
BOOL InternetGoOnlineA(const(char)*, HWND, uint);
BOOL InternetGoOnlineW(const(wchar)*, HWND, uint);
BOOL InternetGoOnline(PSTR, HWND, uint);
BOOL InternetAutodial(INTERNET_AUTODIAL, HWND);
BOOL InternetAutodialHangup(uint);
BOOL InternetGetConnectedState(INTERNET_CONNECTION*, uint);
BOOL InternetGetConnectedStateExA(INTERNET_CONNECTION*, PSTR, uint, uint);
BOOL InternetGetConnectedStateExW(INTERNET_CONNECTION*, PWSTR, uint, uint);
BOOL DeleteWpadCacheForNetworks(WPAD_CACHE_DELETE);
BOOL InternetInitializeAutoProxyDll(uint);
BOOL DetectAutoProxyUrl(PSTR, uint, PROXY_AUTO_DETECT_TYPE);
BOOL CreateMD5SSOHash(PWSTR, PWSTR, PWSTR, ubyte*);
BOOL InternetGetConnectedStateEx(INTERNET_CONNECTION*, PSTR, uint, uint);
BOOL InternetSetDialStateA(const(char)*, uint, uint);
BOOL InternetSetDialStateW(const(wchar)*, uint, uint);
BOOL InternetSetDialState(const(char)*, uint, uint);
BOOL InternetSetPerSiteCookieDecisionA(const(char)*, uint);
BOOL InternetSetPerSiteCookieDecisionW(const(wchar)*, uint);
BOOL InternetGetPerSiteCookieDecisionA(const(char)*, uint*);
BOOL InternetGetPerSiteCookieDecisionW(const(wchar)*, uint*);
BOOL InternetClearAllPerSiteCookieDecisions();
BOOL InternetEnumPerSiteCookieDecisionA(PSTR, uint*, uint*, uint);
BOOL InternetEnumPerSiteCookieDecisionW(PWSTR, uint*, uint*, uint);
uint PrivacySetZonePreferenceW(uint, uint, uint, const(wchar)*);
uint PrivacyGetZonePreferenceW(uint, uint, uint*, PWSTR, uint*);
uint HttpIsHostHstsEnabled(const(wchar)*, BOOL*);
BOOL InternetAlgIdToStringA(ALG_ID, PSTR, uint*, uint);
BOOL InternetAlgIdToStringW(ALG_ID, PWSTR, uint*, uint);
BOOL InternetSecurityProtocolToStringA(uint, PSTR, uint*, uint);
BOOL InternetSecurityProtocolToStringW(uint, PWSTR, uint*, uint);
BOOL InternetGetSecurityInfoByURLA(PSTR, CERT_CHAIN_CONTEXT**, uint*);
BOOL InternetGetSecurityInfoByURLW(const(wchar)*, CERT_CHAIN_CONTEXT**, uint*);
BOOL InternetGetSecurityInfoByURL(PSTR, CERT_CHAIN_CONTEXT**, uint*);
uint ShowSecurityInfo(HWND, INTERNET_SECURITY_INFO*);
uint ShowX509EncodedCertificate(HWND, ubyte*, uint);
uint ShowClientAuthCerts(HWND);
uint ParseX509EncodedCertificateForListBoxEntry(ubyte*, uint, PSTR, uint*);
BOOL InternetShowSecurityInfoByURLA(PSTR, HWND);
BOOL InternetShowSecurityInfoByURLW(const(wchar)*, HWND);
BOOL InternetShowSecurityInfoByURL(PSTR, HWND);
BOOL InternetFortezzaCommand(uint, HWND, ulong);
BOOL InternetQueryFortezzaStatus(uint*, ulong);
BOOL InternetWriteFileExA(void*, INTERNET_BUFFERSA*, uint, ulong);
BOOL InternetWriteFileExW(void*, INTERNET_BUFFERSW*, uint, ulong);
int FindP3PPolicySymbol(const(char)*);
uint HttpGetServerCredentials(PWSTR, PWSTR*, PWSTR*);
uint HttpPushEnable(void*, HTTP_PUSH_TRANSPORT_SETTING*, HTTP_PUSH_WAIT_HANDLE*);
uint HttpPushWait(HTTP_PUSH_WAIT_HANDLE, HTTP_PUSH_WAIT_TYPE, HTTP_PUSH_NOTIFICATION_STATUS*);
void HttpPushClose(HTTP_PUSH_WAIT_HANDLE);
BOOL HttpCheckDavComplianceA(const(char)*, const(char)*, BOOL*, HWND, void*);
BOOL HttpCheckDavComplianceW(const(wchar)*, const(wchar)*, BOOL*, HWND, void*);
BOOL IsUrlCacheEntryExpiredA(const(char)*, uint, FILETIME*);
BOOL IsUrlCacheEntryExpiredW(const(wchar)*, uint, FILETIME*);
BOOL CreateUrlCacheEntryExW(const(wchar)*, uint, const(wchar)*, PWSTR, uint, BOOL);
uint GetUrlCacheEntryBinaryBlob(const(wchar)*, uint*, FILETIME*, FILETIME*, FILETIME*, ubyte**, uint*);
uint CommitUrlCacheEntryBinaryBlob(const(wchar)*, uint, FILETIME, FILETIME, const(ubyte)*, uint);
BOOL CreateUrlCacheContainerA(const(char)*, const(char)*, const(char)*, uint, uint, uint, void*, uint*);
BOOL CreateUrlCacheContainerW(const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, uint, void*, uint*);
BOOL DeleteUrlCacheContainerA(const(char)*, uint);
BOOL DeleteUrlCacheContainerW(const(wchar)*, uint);
HANDLE FindFirstUrlCacheContainerA(uint*, INTERNET_CACHE_CONTAINER_INFOA*, uint*, uint);
HANDLE FindFirstUrlCacheContainerW(uint*, INTERNET_CACHE_CONTAINER_INFOW*, uint*, uint);
BOOL FindNextUrlCacheContainerA(HANDLE, INTERNET_CACHE_CONTAINER_INFOA*, uint*);
BOOL FindNextUrlCacheContainerW(HANDLE, INTERNET_CACHE_CONTAINER_INFOW*, uint*);
BOOL FreeUrlCacheSpaceA(const(char)*, uint, uint);
BOOL FreeUrlCacheSpaceW(const(wchar)*, uint, uint);
uint UrlCacheFreeGlobalSpace(ulong, uint);
uint UrlCacheGetGlobalCacheSize(uint, ulong*, ulong*);
BOOL GetUrlCacheConfigInfoA(INTERNET_CACHE_CONFIG_INFOA*, uint*, CACHE_CONFIG);
BOOL GetUrlCacheConfigInfoW(INTERNET_CACHE_CONFIG_INFOW*, uint*, CACHE_CONFIG);
BOOL SetUrlCacheConfigInfoA(INTERNET_CACHE_CONFIG_INFOA*, uint);
BOOL SetUrlCacheConfigInfoW(INTERNET_CACHE_CONFIG_INFOW*, uint);
uint RunOnceUrlCache(HWND, HINSTANCE, PSTR, int);
uint DeleteIE3Cache(HWND, HINSTANCE, PSTR, int);
BOOL UpdateUrlCacheContentPath(const(char)*);
BOOL RegisterUrlCacheNotification(HWND, uint, long, uint, uint);
BOOL GetUrlCacheHeaderData(uint, uint*);
BOOL SetUrlCacheHeaderData(uint, uint);
BOOL IncrementUrlCacheHeaderData(uint, uint*);
BOOL LoadUrlCacheContent();
uint AppCacheLookup(const(wchar)*, uint, void**);
uint AppCacheCheckManifest(const(wchar)*, const(wchar)*, const(ubyte)*, uint, const(ubyte)*, uint, APP_CACHE_STATE*, void**);
uint AppCacheGetDownloadList(void*, APP_CACHE_DOWNLOAD_LIST*);
void AppCacheFreeDownloadList(APP_CACHE_DOWNLOAD_LIST*);
uint AppCacheFinalize(void*, const(ubyte)*, uint, APP_CACHE_FINALIZE_STATE*);
uint AppCacheGetFallbackUrl(void*, const(wchar)*, PWSTR*);
uint AppCacheGetManifestUrl(void*, PWSTR*);
uint AppCacheDuplicateHandle(void*, void**);
void AppCacheCloseHandle(void*);
void AppCacheFreeGroupList(APP_CACHE_GROUP_LIST*);
uint AppCacheGetGroupList(APP_CACHE_GROUP_LIST*);
uint AppCacheGetInfo(void*, APP_CACHE_GROUP_INFO*);
uint AppCacheDeleteGroup(const(wchar)*);
uint AppCacheFreeSpace(FILETIME);
uint AppCacheGetIEGroupList(APP_CACHE_GROUP_LIST*);
uint AppCacheDeleteIEGroup(const(wchar)*);
uint AppCacheFreeIESpace(FILETIME);
uint AppCacheCreateAndCommitFile(void*, const(wchar)*, const(wchar)*, const(ubyte)*, uint);
uint HttpOpenDependencyHandle(void*, BOOL, void**);
void HttpCloseDependencyHandle(void*);
uint HttpDuplicateDependencyHandle(void*, void**);
uint HttpIndicatePageLoadComplete(void*);
void UrlCacheFreeEntryInfo(URLCACHE_ENTRY_INFO*);
uint UrlCacheGetEntryInfo(void*, const(wchar)*, URLCACHE_ENTRY_INFO*);
void UrlCacheCloseEntryHandle(void*);
uint UrlCacheRetrieveEntryFile(void*, const(wchar)*, URLCACHE_ENTRY_INFO*, void**);
uint UrlCacheReadEntryStream(void*, ulong, void*, uint, uint*);
uint UrlCacheRetrieveEntryStream(void*, const(wchar)*, BOOL, URLCACHE_ENTRY_INFO*, void**);
uint UrlCacheUpdateEntryExtraData(void*, const(wchar)*, const(ubyte)*, uint);
uint UrlCacheCreateContainer(const(wchar)*, const(wchar)*, const(wchar)*, ulong, uint);
uint UrlCacheCheckEntriesExist(const(wchar)**, uint, BOOL*);
uint UrlCacheGetContentPaths(PWSTR**, uint*);
uint UrlCacheGetGlobalLimit(URL_CACHE_LIMIT_TYPE, ulong*);
uint UrlCacheSetGlobalLimit(URL_CACHE_LIMIT_TYPE, ulong);
uint UrlCacheReloadSettings();
uint UrlCacheContainerSetEntryMaximumAge(const(wchar)*, uint);
uint UrlCacheFindFirstEntry(const(wchar)*, uint, uint, long, URLCACHE_ENTRY_INFO*, HANDLE*);
uint UrlCacheFindNextEntry(HANDLE, URLCACHE_ENTRY_INFO*);
uint UrlCacheServer();
BOOL ReadGuidsForConnectedNetworks(uint*, PWSTR**, BSTR**, PWSTR**, uint*, uint*);
BOOL IsHostInProxyBypassList(INTERNET_SCHEME, const(char)*, uint);
void InternetFreeProxyInfoList(WININET_PROXY_INFO_LIST*);
uint InternetGetProxyForUrl(void*, const(wchar)*, WININET_PROXY_INFO_LIST*);
BOOL DoConnectoidsExist();
BOOL GetDiskInfoA(const(char)*, uint*, ulong*, ulong*);
BOOL PerformOperationOverUrlCacheA(const(char)*, uint, uint, long, void*, uint*, void*, CACHE_OPERATOR, void*);
BOOL IsProfilesEnabled();
uint InternalInternetGetCookie(const(char)*, PSTR, uint*);
BOOL ImportCookieFileA(const(char)*);
BOOL ImportCookieFileW(const(wchar)*);
BOOL ExportCookieFileA(const(char)*, BOOL);
BOOL ExportCookieFileW(const(wchar)*, BOOL);
BOOL IsDomainLegalCookieDomainA(const(char)*, const(char)*);
BOOL IsDomainLegalCookieDomainW(const(wchar)*, const(wchar)*);
void* HttpWebSocketCompleteUpgrade(void*, ulong);
BOOL HttpWebSocketSend(void*, HTTP_WEB_SOCKET_BUFFER_TYPE, void*, uint);
BOOL HttpWebSocketReceive(void*, void*, uint, uint*, HTTP_WEB_SOCKET_BUFFER_TYPE*);
BOOL HttpWebSocketClose(void*, ushort, void*, uint);
BOOL HttpWebSocketShutdown(void*, ushort, void*, uint);
BOOL HttpWebSocketQueryCloseStatus(void*, ushort*, void*, uint, uint*);
uint InternetConvertUrlFromWireToWideChar(const(char)*, uint, const(wchar)*, uint, uint, BOOL, uint, PWSTR*);
enum DIALPROP_USERNAME = "UserName";
enum DIALPROP_PASSWORD = "Password";
enum DIALPROP_DOMAIN = "Domain";
enum DIALPROP_SAVEPASSWORD = "SavePassword";
enum DIALPROP_REDIALCOUNT = "RedialCount";
enum DIALPROP_REDIALINTERVAL = "RedialInterval";
enum DIALPROP_PHONENUMBER = "PhoneNumber";
enum DIALPROP_LASTERROR = "LastError";
enum DIALPROP_RESOLVEDPHONE = "ResolvedPhone";
enum DIALENG_OperationComplete = 0x00010000;
enum DIALENG_RedialAttempt = 0x00010001;
enum DIALENG_RedialWait = 0x00010002;
enum INTERNET_INVALID_PORT_NUMBER = 0x00000000;
enum INTERNET_DEFAULT_FTP_PORT = 0x0015;
enum INTERNET_DEFAULT_GOPHER_PORT = 0x0046;
enum INTERNET_DEFAULT_SOCKS_PORT = 0x0438;
enum INTERNET_MAX_HOST_NAME_LENGTH = 0x00000100;
enum INTERNET_MAX_USER_NAME_LENGTH = 0x00000080;
enum INTERNET_MAX_PASSWORD_LENGTH = 0x00000080;
enum INTERNET_MAX_PORT_NUMBER_LENGTH = 0x00000005;
enum INTERNET_MAX_PORT_NUMBER_VALUE = 0x0000ffff;
enum INTERNET_KEEP_ALIVE_UNKNOWN = 0xffffffff;
enum INTERNET_KEEP_ALIVE_ENABLED = 0x00000001;
enum INTERNET_KEEP_ALIVE_DISABLED = 0x00000000;
enum INTERNET_REQFLAG_FROM_CACHE = 0x00000001;
enum INTERNET_REQFLAG_ASYNC = 0x00000002;
enum INTERNET_REQFLAG_VIA_PROXY = 0x00000004;
enum INTERNET_REQFLAG_NO_HEADERS = 0x00000008;
enum INTERNET_REQFLAG_PASSIVE = 0x00000010;
enum INTERNET_REQFLAG_CACHE_WRITE_DISABLED = 0x00000040;
enum INTERNET_REQFLAG_NET_TIMEOUT = 0x00000080;
enum INTERNET_FLAG_IDN_DIRECT = 0x00000001;
enum INTERNET_FLAG_IDN_PROXY = 0x00000002;
enum INTERNET_FLAG_RELOAD = 0x80000000;
enum INTERNET_FLAG_RAW_DATA = 0x40000000;
enum INTERNET_FLAG_EXISTING_CONNECT = 0x20000000;
enum INTERNET_FLAG_ASYNC = 0x10000000;
enum INTERNET_FLAG_PASSIVE = 0x08000000;
enum INTERNET_FLAG_NO_CACHE_WRITE = 0x04000000;
enum INTERNET_FLAG_DONT_CACHE = 0x04000000;
enum INTERNET_FLAG_MAKE_PERSISTENT = 0x02000000;
enum INTERNET_FLAG_FROM_CACHE = 0x01000000;
enum INTERNET_FLAG_OFFLINE = 0x01000000;
enum INTERNET_FLAG_SECURE = 0x00800000;
enum INTERNET_FLAG_KEEP_CONNECTION = 0x00400000;
enum INTERNET_FLAG_NO_AUTO_REDIRECT = 0x00200000;
enum INTERNET_FLAG_READ_PREFETCH = 0x00100000;
enum INTERNET_FLAG_NO_COOKIES = 0x00080000;
enum INTERNET_FLAG_NO_AUTH = 0x00040000;
enum INTERNET_FLAG_CACHE_IF_NET_FAIL = 0x00010000;
enum INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP = 0x00008000;
enum INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS = 0x00004000;
enum INTERNET_FLAG_IGNORE_CERT_DATE_INVALID = 0x00002000;
enum INTERNET_FLAG_IGNORE_CERT_CN_INVALID = 0x00001000;
enum INTERNET_FLAG_RESYNCHRONIZE = 0x00000800;
enum INTERNET_FLAG_HYPERLINK = 0x00000400;
enum INTERNET_FLAG_NO_UI = 0x00000200;
enum INTERNET_FLAG_PRAGMA_NOCACHE = 0x00000100;
enum INTERNET_FLAG_CACHE_ASYNC = 0x00000080;
enum INTERNET_FLAG_FORMS_SUBMIT = 0x00000040;
enum INTERNET_FLAG_FWD_BACK = 0x00000020;
enum INTERNET_FLAG_NEED_FILE = 0x00000010;
enum INTERNET_FLAG_MUST_CACHE_REQUEST = 0x00000010;
enum INTERNET_ERROR_MASK_INSERT_CDROM = 0x00000001;
enum INTERNET_ERROR_MASK_COMBINED_SEC_CERT = 0x00000002;
enum INTERNET_ERROR_MASK_NEED_MSN_SSPI_PKG = 0x00000004;
enum INTERNET_ERROR_MASK_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = 0x00000008;
enum WININET_API_FLAG_ASYNC = 0x00000001;
enum WININET_API_FLAG_SYNC = 0x00000004;
enum WININET_API_FLAG_USE_CONTEXT = 0x00000008;
enum INTERNET_NO_CALLBACK = 0x00000000;
enum IDSI_FLAG_KEEP_ALIVE = 0x00000001;
enum IDSI_FLAG_SECURE = 0x00000002;
enum IDSI_FLAG_PROXY = 0x00000004;
enum IDSI_FLAG_TUNNEL = 0x00000008;
enum INTERNET_PER_CONN_FLAGS_UI = 0x0000000a;
enum PROXY_TYPE_DIRECT = 0x00000001;
enum PROXY_TYPE_PROXY = 0x00000002;
enum PROXY_TYPE_AUTO_PROXY_URL = 0x00000004;
enum PROXY_TYPE_AUTO_DETECT = 0x00000008;
enum AUTO_PROXY_FLAG_USER_SET = 0x00000001;
enum AUTO_PROXY_FLAG_ALWAYS_DETECT = 0x00000002;
enum AUTO_PROXY_FLAG_DETECTION_RUN = 0x00000004;
enum AUTO_PROXY_FLAG_MIGRATED = 0x00000008;
enum AUTO_PROXY_FLAG_DONT_CACHE_PROXY_RESULT = 0x00000010;
enum AUTO_PROXY_FLAG_CACHE_INIT_RUN = 0x00000020;
enum AUTO_PROXY_FLAG_DETECTION_SUSPECT = 0x00000040;
enum ISO_FORCE_DISCONNECTED = 0x00000001;
enum INTERNET_RFC1123_FORMAT = 0x00000000;
enum INTERNET_RFC1123_BUFSIZE = 0x0000001e;
enum ICU_USERNAME = 0x40000000;
enum INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY = 0x00000004;
enum INTERNET_SERVICE_FTP = 0x00000001;
enum INTERNET_SERVICE_GOPHER = 0x00000002;
enum INTERNET_SERVICE_HTTP = 0x00000003;
enum IRF_ASYNC = 0x00000001;
enum IRF_SYNC = 0x00000004;
enum IRF_USE_CONTEXT = 0x00000008;
enum IRF_NO_WAIT = 0x00000008;
enum ISO_GLOBAL = 0x00000001;
enum ISO_REGISTRY = 0x00000002;
enum INTERNET_OPTION_CALLBACK = 0x00000001;
enum INTERNET_OPTION_CONNECT_TIMEOUT = 0x00000002;
enum INTERNET_OPTION_CONNECT_RETRIES = 0x00000003;
enum INTERNET_OPTION_CONNECT_BACKOFF = 0x00000004;
enum INTERNET_OPTION_SEND_TIMEOUT = 0x00000005;
enum INTERNET_OPTION_CONTROL_SEND_TIMEOUT = 0x00000005;
enum INTERNET_OPTION_RECEIVE_TIMEOUT = 0x00000006;
enum INTERNET_OPTION_CONTROL_RECEIVE_TIMEOUT = 0x00000006;
enum INTERNET_OPTION_DATA_SEND_TIMEOUT = 0x00000007;
enum INTERNET_OPTION_DATA_RECEIVE_TIMEOUT = 0x00000008;
enum INTERNET_OPTION_HANDLE_TYPE = 0x00000009;
enum INTERNET_OPTION_LISTEN_TIMEOUT = 0x0000000b;
enum INTERNET_OPTION_READ_BUFFER_SIZE = 0x0000000c;
enum INTERNET_OPTION_WRITE_BUFFER_SIZE = 0x0000000d;
enum INTERNET_OPTION_ASYNC_ID = 0x0000000f;
enum INTERNET_OPTION_ASYNC_PRIORITY = 0x00000010;
enum INTERNET_OPTION_PARENT_HANDLE = 0x00000015;
enum INTERNET_OPTION_KEEP_CONNECTION = 0x00000016;
enum INTERNET_OPTION_REQUEST_FLAGS = 0x00000017;
enum INTERNET_OPTION_EXTENDED_ERROR = 0x00000018;
enum INTERNET_OPTION_OFFLINE_MODE = 0x0000001a;
enum INTERNET_OPTION_CACHE_STREAM_HANDLE = 0x0000001b;
enum INTERNET_OPTION_USERNAME = 0x0000001c;
enum INTERNET_OPTION_PASSWORD = 0x0000001d;
enum INTERNET_OPTION_ASYNC = 0x0000001e;
enum INTERNET_OPTION_SECURITY_FLAGS = 0x0000001f;
enum INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT = 0x00000020;
enum INTERNET_OPTION_DATAFILE_NAME = 0x00000021;
enum INTERNET_OPTION_URL = 0x00000022;
enum INTERNET_OPTION_SECURITY_CERTIFICATE = 0x00000023;
enum INTERNET_OPTION_SECURITY_KEY_BITNESS = 0x00000024;
enum INTERNET_OPTION_REFRESH = 0x00000025;
enum INTERNET_OPTION_PROXY = 0x00000026;
enum INTERNET_OPTION_SETTINGS_CHANGED = 0x00000027;
enum INTERNET_OPTION_VERSION = 0x00000028;
enum INTERNET_OPTION_USER_AGENT = 0x00000029;
enum INTERNET_OPTION_END_BROWSER_SESSION = 0x0000002a;
enum INTERNET_OPTION_PROXY_USERNAME = 0x0000002b;
enum INTERNET_OPTION_PROXY_PASSWORD = 0x0000002c;
enum INTERNET_OPTION_CONTEXT_VALUE = 0x0000002d;
enum INTERNET_OPTION_CONNECT_LIMIT = 0x0000002e;
enum INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT = 0x0000002f;
enum INTERNET_OPTION_POLICY = 0x00000030;
enum INTERNET_OPTION_DISCONNECTED_TIMEOUT = 0x00000031;
enum INTERNET_OPTION_CONNECTED_STATE = 0x00000032;
enum INTERNET_OPTION_IDLE_STATE = 0x00000033;
enum INTERNET_OPTION_OFFLINE_SEMANTICS = 0x00000034;
enum INTERNET_OPTION_SECONDARY_CACHE_KEY = 0x00000035;
enum INTERNET_OPTION_CALLBACK_FILTER = 0x00000036;
enum INTERNET_OPTION_CONNECT_TIME = 0x00000037;
enum INTERNET_OPTION_SEND_THROUGHPUT = 0x00000038;
enum INTERNET_OPTION_RECEIVE_THROUGHPUT = 0x00000039;
enum INTERNET_OPTION_REQUEST_PRIORITY = 0x0000003a;
enum INTERNET_OPTION_HTTP_VERSION = 0x0000003b;
enum INTERNET_OPTION_RESET_URLCACHE_SESSION = 0x0000003c;
enum INTERNET_OPTION_ERROR_MASK = 0x0000003e;
enum INTERNET_OPTION_FROM_CACHE_TIMEOUT = 0x0000003f;
enum INTERNET_OPTION_BYPASS_EDITED_ENTRY = 0x00000040;
enum INTERNET_OPTION_HTTP_DECODING = 0x00000041;
enum INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO = 0x00000043;
enum INTERNET_OPTION_CODEPAGE = 0x00000044;
enum INTERNET_OPTION_CACHE_TIMESTAMPS = 0x00000045;
enum INTERNET_OPTION_DISABLE_AUTODIAL = 0x00000046;
enum INTERNET_OPTION_MAX_CONNS_PER_SERVER = 0x00000049;
enum INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER = 0x0000004a;
enum INTERNET_OPTION_PER_CONNECTION_OPTION = 0x0000004b;
enum INTERNET_OPTION_DIGEST_AUTH_UNLOAD = 0x0000004c;
enum INTERNET_OPTION_IGNORE_OFFLINE = 0x0000004d;
enum INTERNET_OPTION_IDENTITY = 0x0000004e;
enum INTERNET_OPTION_REMOVE_IDENTITY = 0x0000004f;
enum INTERNET_OPTION_ALTER_IDENTITY = 0x00000050;
enum INTERNET_OPTION_SUPPRESS_BEHAVIOR = 0x00000051;
enum INTERNET_OPTION_AUTODIAL_MODE = 0x00000052;
enum INTERNET_OPTION_AUTODIAL_CONNECTION = 0x00000053;
enum INTERNET_OPTION_CLIENT_CERT_CONTEXT = 0x00000054;
enum INTERNET_OPTION_AUTH_FLAGS = 0x00000055;
enum INTERNET_OPTION_COOKIES_3RD_PARTY = 0x00000056;
enum INTERNET_OPTION_DISABLE_PASSPORT_AUTH = 0x00000057;
enum INTERNET_OPTION_SEND_UTF8_SERVERNAME_TO_PROXY = 0x00000058;
enum INTERNET_OPTION_EXEMPT_CONNECTION_LIMIT = 0x00000059;
enum INTERNET_OPTION_ENABLE_PASSPORT_AUTH = 0x0000005a;
enum INTERNET_OPTION_HIBERNATE_INACTIVE_WORKER_THREADS = 0x0000005b;
enum INTERNET_OPTION_ACTIVATE_WORKER_THREADS = 0x0000005c;
enum INTERNET_OPTION_RESTORE_WORKER_THREAD_DEFAULTS = 0x0000005d;
enum INTERNET_OPTION_SOCKET_SEND_BUFFER_LENGTH = 0x0000005e;
enum INTERNET_OPTION_PROXY_SETTINGS_CHANGED = 0x0000005f;
enum INTERNET_OPTION_DATAFILE_EXT = 0x00000060;
enum INTERNET_OPTION_CODEPAGE_PATH = 0x00000064;
enum INTERNET_OPTION_CODEPAGE_EXTRA = 0x00000065;
enum INTERNET_OPTION_IDN = 0x00000066;
enum INTERNET_OPTION_MAX_CONNS_PER_PROXY = 0x00000067;
enum INTERNET_OPTION_SUPPRESS_SERVER_AUTH = 0x00000068;
enum INTERNET_OPTION_SERVER_CERT_CHAIN_CONTEXT = 0x00000069;
enum INTERNET_OPTION_ENABLE_REDIRECT_CACHE_READ = 0x0000007a;
enum INTERNET_OPTION_COMPRESSED_CONTENT_LENGTH = 0x00000093;
enum INTERNET_OPTION_ENABLE_HTTP_PROTOCOL = 0x00000094;
enum INTERNET_OPTION_HTTP_PROTOCOL_USED = 0x00000095;
enum INTERNET_OPTION_ENCODE_EXTRA = 0x0000009b;
enum INTERNET_OPTION_HSTS = 0x0000009d;
enum INTERNET_OPTION_ENTERPRISE_CONTEXT = 0x0000009f;
enum INTERNET_OPTION_CONNECTION_FILTER = 0x000000a2;
enum INTERNET_OPTION_REFERER_TOKEN_BINDING_HOSTNAME = 0x000000a3;
enum INTERNET_OPTION_TOKEN_BINDING_PUBLIC_KEY = 0x000000b5;
enum INTERNET_OPTION_COOKIES_SAME_SITE_LEVEL = 0x000000bb;
enum INTERNET_OPTION_REQUEST_ANNOTATION = 0x000000c1;
enum INTERNET_FIRST_OPTION = 0x00000001;
enum INTERNET_LAST_OPTION = 0x000000c1;
enum INTERNET_PRIORITY_FOREGROUND = 0x000003e8;
enum HTTP_COOKIES_SAME_SITE_LEVEL_UNKNOWN = 0x00000000;
enum HTTP_COOKIES_SAME_SITE_LEVEL_SAME_SITE = 0x00000001;
enum HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE_LAX = 0x00000002;
enum HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE = 0x00000003;
enum HTTP_COOKIES_SAME_SITE_LEVEL_MAX = 0x00000003;
enum HTTP_PROTOCOL_FLAG_HTTP2 = 0x00000002;
enum HTTP_PROTOCOL_MASK = 0x00000002;
enum INTERNET_OPTION_REQUEST_ANNOTATION_MAX_LENGTH = 0x0000fa00;
enum INTERNET_HANDLE_TYPE_INTERNET = 0x00000001;
enum INTERNET_HANDLE_TYPE_CONNECT_FTP = 0x00000002;
enum INTERNET_HANDLE_TYPE_CONNECT_GOPHER = 0x00000003;
enum INTERNET_HANDLE_TYPE_CONNECT_HTTP = 0x00000004;
enum INTERNET_HANDLE_TYPE_FTP_FIND = 0x00000005;
enum INTERNET_HANDLE_TYPE_FTP_FIND_HTML = 0x00000006;
enum INTERNET_HANDLE_TYPE_FTP_FILE = 0x00000007;
enum INTERNET_HANDLE_TYPE_FTP_FILE_HTML = 0x00000008;
enum INTERNET_HANDLE_TYPE_GOPHER_FIND = 0x00000009;
enum INTERNET_HANDLE_TYPE_GOPHER_FIND_HTML = 0x0000000a;
enum INTERNET_HANDLE_TYPE_GOPHER_FILE = 0x0000000b;
enum INTERNET_HANDLE_TYPE_GOPHER_FILE_HTML = 0x0000000c;
enum INTERNET_HANDLE_TYPE_HTTP_REQUEST = 0x0000000d;
enum INTERNET_HANDLE_TYPE_FILE_REQUEST = 0x0000000e;
enum AUTH_FLAG_DISABLE_NEGOTIATE = 0x00000001;
enum AUTH_FLAG_ENABLE_NEGOTIATE = 0x00000002;
enum AUTH_FLAG_DISABLE_BASIC_CLEARCHANNEL = 0x00000004;
enum AUTH_FLAG_DISABLE_SERVER_AUTH = 0x00000008;
enum SECURITY_FLAG_UNKNOWNBIT = 0x80000000;
enum SECURITY_FLAG_FORTEZZA = 0x08000000;
enum SECURITY_FLAG_NORMALBITNESS = 0x10000000;
enum SECURITY_FLAG_SSL = 0x00000002;
enum SECURITY_FLAG_SSL3 = 0x00000004;
enum SECURITY_FLAG_PCT = 0x00000008;
enum SECURITY_FLAG_PCT4 = 0x00000010;
enum SECURITY_FLAG_IETFSSL4 = 0x00000020;
enum SECURITY_FLAG_40BIT = 0x10000000;
enum SECURITY_FLAG_128BIT = 0x20000000;
enum SECURITY_FLAG_56BIT = 0x40000000;
enum SECURITY_FLAG_IGNORE_REVOCATION = 0x00000080;
enum SECURITY_FLAG_IGNORE_WRONG_USAGE = 0x00000200;
enum SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTPS = 0x00004000;
enum SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTP = 0x00008000;
enum SECURITY_FLAG_IGNORE_WEAK_SIGNATURE = 0x00010000;
enum SECURITY_FLAG_OPT_IN_WEAK_SIGNATURE = 0x00020000;
enum AUTODIAL_MODE_NEVER = 0x00000001;
enum AUTODIAL_MODE_ALWAYS = 0x00000002;
enum AUTODIAL_MODE_NO_NETWORK_PRESENT = 0x00000004;
enum INTERNET_STATUS_RESOLVING_NAME = 0x0000000a;
enum INTERNET_STATUS_NAME_RESOLVED = 0x0000000b;
enum INTERNET_STATUS_CONNECTING_TO_SERVER = 0x00000014;
enum INTERNET_STATUS_CONNECTED_TO_SERVER = 0x00000015;
enum INTERNET_STATUS_SENDING_REQUEST = 0x0000001e;
enum INTERNET_STATUS_REQUEST_SENT = 0x0000001f;
enum INTERNET_STATUS_RECEIVING_RESPONSE = 0x00000028;
enum INTERNET_STATUS_RESPONSE_RECEIVED = 0x00000029;
enum INTERNET_STATUS_CTL_RESPONSE_RECEIVED = 0x0000002a;
enum INTERNET_STATUS_PREFETCH = 0x0000002b;
enum INTERNET_STATUS_CLOSING_CONNECTION = 0x00000032;
enum INTERNET_STATUS_CONNECTION_CLOSED = 0x00000033;
enum INTERNET_STATUS_HANDLE_CREATED = 0x0000003c;
enum INTERNET_STATUS_HANDLE_CLOSING = 0x00000046;
enum INTERNET_STATUS_DETECTING_PROXY = 0x00000050;
enum INTERNET_STATUS_REQUEST_COMPLETE = 0x00000064;
enum INTERNET_STATUS_REDIRECT = 0x0000006e;
enum INTERNET_STATUS_INTERMEDIATE_RESPONSE = 0x00000078;
enum INTERNET_STATUS_USER_INPUT_REQUIRED = 0x0000008c;
enum INTERNET_STATUS_STATE_CHANGE = 0x000000c8;
enum INTERNET_STATUS_COOKIE_SENT = 0x00000140;
enum INTERNET_STATUS_COOKIE_RECEIVED = 0x00000141;
enum INTERNET_STATUS_PRIVACY_IMPACTED = 0x00000144;
enum INTERNET_STATUS_P3P_HEADER = 0x00000145;
enum INTERNET_STATUS_P3P_POLICYREF = 0x00000146;
enum INTERNET_STATUS_COOKIE_HISTORY = 0x00000147;
enum MAX_GOPHER_DISPLAY_TEXT = 0x00000080;
enum MAX_GOPHER_SELECTOR_TEXT = 0x00000100;
enum MAX_GOPHER_HOST_NAME = 0x00000100;
enum MAX_GOPHER_CATEGORY_NAME = 0x00000080;
enum MAX_GOPHER_ATTRIBUTE_NAME = 0x00000080;
enum MIN_GOPHER_ATTRIBUTE_LENGTH = 0x00000100;
enum GOPHER_INFO_CATEGORY = "+INFO";
enum GOPHER_ADMIN_CATEGORY = "+ADMIN";
enum GOPHER_VIEWS_CATEGORY = "+VIEWS";
enum GOPHER_ABSTRACT_CATEGORY = "+ABSTRACT";
enum GOPHER_VERONICA_CATEGORY = "+VERONICA";
enum GOPHER_ADMIN_ATTRIBUTE = "Admin";
enum GOPHER_MOD_DATE_ATTRIBUTE = "Mod-Date";
enum GOPHER_TTL_ATTRIBUTE = "TTL";
enum GOPHER_SCORE_ATTRIBUTE = "Score";
enum GOPHER_RANGE_ATTRIBUTE = "Score-range";
enum GOPHER_SITE_ATTRIBUTE = "Site";
enum GOPHER_ORG_ATTRIBUTE = "Org";
enum GOPHER_LOCATION_ATTRIBUTE = "Loc";
enum GOPHER_GEOG_ATTRIBUTE = "Geog";
enum GOPHER_TIMEZONE_ATTRIBUTE = "TZ";
enum GOPHER_PROVIDER_ATTRIBUTE = "Provider";
enum GOPHER_VERSION_ATTRIBUTE = "Version";
enum GOPHER_ABSTRACT_ATTRIBUTE = "Abstract";
enum GOPHER_VIEW_ATTRIBUTE = "View";
enum GOPHER_TREEWALK_ATTRIBUTE = "treewalk";
enum GOPHER_ATTRIBUTE_ID_BASE = 0xabcccc00;
enum GOPHER_CATEGORY_ID_ALL = 0xabcccc01;
enum GOPHER_CATEGORY_ID_INFO = 0xabcccc02;
enum GOPHER_CATEGORY_ID_ADMIN = 0xabcccc03;
enum GOPHER_CATEGORY_ID_VIEWS = 0xabcccc04;
enum GOPHER_CATEGORY_ID_ABSTRACT = 0xabcccc05;
enum GOPHER_CATEGORY_ID_VERONICA = 0xabcccc06;
enum GOPHER_CATEGORY_ID_ASK = 0xabcccc07;
enum GOPHER_CATEGORY_ID_UNKNOWN = 0xabcccc08;
enum GOPHER_ATTRIBUTE_ID_ALL = 0xabcccc09;
enum GOPHER_ATTRIBUTE_ID_ADMIN = 0xabcccc0a;
enum GOPHER_ATTRIBUTE_ID_MOD_DATE = 0xabcccc0b;
enum GOPHER_ATTRIBUTE_ID_TTL = 0xabcccc0c;
enum GOPHER_ATTRIBUTE_ID_SCORE = 0xabcccc0d;
enum GOPHER_ATTRIBUTE_ID_RANGE = 0xabcccc0e;
enum GOPHER_ATTRIBUTE_ID_SITE = 0xabcccc0f;
enum GOPHER_ATTRIBUTE_ID_ORG = 0xabcccc10;
enum GOPHER_ATTRIBUTE_ID_LOCATION = 0xabcccc11;
enum GOPHER_ATTRIBUTE_ID_GEOG = 0xabcccc12;
enum GOPHER_ATTRIBUTE_ID_TIMEZONE = 0xabcccc13;
enum GOPHER_ATTRIBUTE_ID_PROVIDER = 0xabcccc14;
enum GOPHER_ATTRIBUTE_ID_VERSION = 0xabcccc15;
enum GOPHER_ATTRIBUTE_ID_ABSTRACT = 0xabcccc16;
enum GOPHER_ATTRIBUTE_ID_VIEW = 0xabcccc17;
enum GOPHER_ATTRIBUTE_ID_TREEWALK = 0xabcccc18;
enum GOPHER_ATTRIBUTE_ID_UNKNOWN = 0xabcccc19;
enum HTTP_MAJOR_VERSION = 0x00000001;
enum HTTP_MINOR_VERSION = 0x00000000;
enum HTTP_VERSIONA = "HTTP/1.0";
enum HTTP_VERSIONW = "HTTP/1.0";
enum HTTP_QUERY_MIME_VERSION = 0x00000000;
enum HTTP_QUERY_CONTENT_TYPE = 0x00000001;
enum HTTP_QUERY_CONTENT_TRANSFER_ENCODING = 0x00000002;
enum HTTP_QUERY_CONTENT_ID = 0x00000003;
enum HTTP_QUERY_CONTENT_DESCRIPTION = 0x00000004;
enum HTTP_QUERY_CONTENT_LENGTH = 0x00000005;
enum HTTP_QUERY_CONTENT_LANGUAGE = 0x00000006;
enum HTTP_QUERY_ALLOW = 0x00000007;
enum HTTP_QUERY_PUBLIC = 0x00000008;
enum HTTP_QUERY_DATE = 0x00000009;
enum HTTP_QUERY_EXPIRES = 0x0000000a;
enum HTTP_QUERY_LAST_MODIFIED = 0x0000000b;
enum HTTP_QUERY_MESSAGE_ID = 0x0000000c;
enum HTTP_QUERY_URI = 0x0000000d;
enum HTTP_QUERY_DERIVED_FROM = 0x0000000e;
enum HTTP_QUERY_COST = 0x0000000f;
enum HTTP_QUERY_LINK = 0x00000010;
enum HTTP_QUERY_PRAGMA = 0x00000011;
enum HTTP_QUERY_VERSION = 0x00000012;
enum HTTP_QUERY_STATUS_CODE = 0x00000013;
enum HTTP_QUERY_STATUS_TEXT = 0x00000014;
enum HTTP_QUERY_RAW_HEADERS = 0x00000015;
enum HTTP_QUERY_RAW_HEADERS_CRLF = 0x00000016;
enum HTTP_QUERY_CONNECTION = 0x00000017;
enum HTTP_QUERY_ACCEPT = 0x00000018;
enum HTTP_QUERY_ACCEPT_CHARSET = 0x00000019;
enum HTTP_QUERY_ACCEPT_ENCODING = 0x0000001a;
enum HTTP_QUERY_ACCEPT_LANGUAGE = 0x0000001b;
enum HTTP_QUERY_AUTHORIZATION = 0x0000001c;
enum HTTP_QUERY_CONTENT_ENCODING = 0x0000001d;
enum HTTP_QUERY_FORWARDED = 0x0000001e;
enum HTTP_QUERY_FROM = 0x0000001f;
enum HTTP_QUERY_IF_MODIFIED_SINCE = 0x00000020;
enum HTTP_QUERY_LOCATION = 0x00000021;
enum HTTP_QUERY_ORIG_URI = 0x00000022;
enum HTTP_QUERY_REFERER = 0x00000023;
enum HTTP_QUERY_RETRY_AFTER = 0x00000024;
enum HTTP_QUERY_SERVER = 0x00000025;
enum HTTP_QUERY_TITLE = 0x00000026;
enum HTTP_QUERY_USER_AGENT = 0x00000027;
enum HTTP_QUERY_WWW_AUTHENTICATE = 0x00000028;
enum HTTP_QUERY_PROXY_AUTHENTICATE = 0x00000029;
enum HTTP_QUERY_ACCEPT_RANGES = 0x0000002a;
enum HTTP_QUERY_SET_COOKIE = 0x0000002b;
enum HTTP_QUERY_COOKIE = 0x0000002c;
enum HTTP_QUERY_REQUEST_METHOD = 0x0000002d;
enum HTTP_QUERY_REFRESH = 0x0000002e;
enum HTTP_QUERY_CONTENT_DISPOSITION = 0x0000002f;
enum HTTP_QUERY_AGE = 0x00000030;
enum HTTP_QUERY_CACHE_CONTROL = 0x00000031;
enum HTTP_QUERY_CONTENT_BASE = 0x00000032;
enum HTTP_QUERY_CONTENT_LOCATION = 0x00000033;
enum HTTP_QUERY_CONTENT_MD5 = 0x00000034;
enum HTTP_QUERY_CONTENT_RANGE = 0x00000035;
enum HTTP_QUERY_ETAG = 0x00000036;
enum HTTP_QUERY_HOST = 0x00000037;
enum HTTP_QUERY_IF_MATCH = 0x00000038;
enum HTTP_QUERY_IF_NONE_MATCH = 0x00000039;
enum HTTP_QUERY_IF_RANGE = 0x0000003a;
enum HTTP_QUERY_IF_UNMODIFIED_SINCE = 0x0000003b;
enum HTTP_QUERY_MAX_FORWARDS = 0x0000003c;
enum HTTP_QUERY_PROXY_AUTHORIZATION = 0x0000003d;
enum HTTP_QUERY_RANGE = 0x0000003e;
enum HTTP_QUERY_TRANSFER_ENCODING = 0x0000003f;
enum HTTP_QUERY_UPGRADE = 0x00000040;
enum HTTP_QUERY_VARY = 0x00000041;
enum HTTP_QUERY_VIA = 0x00000042;
enum HTTP_QUERY_WARNING = 0x00000043;
enum HTTP_QUERY_EXPECT = 0x00000044;
enum HTTP_QUERY_PROXY_CONNECTION = 0x00000045;
enum HTTP_QUERY_UNLESS_MODIFIED_SINCE = 0x00000046;
enum HTTP_QUERY_ECHO_REQUEST = 0x00000047;
enum HTTP_QUERY_ECHO_REPLY = 0x00000048;
enum HTTP_QUERY_ECHO_HEADERS = 0x00000049;
enum HTTP_QUERY_ECHO_HEADERS_CRLF = 0x0000004a;
enum HTTP_QUERY_PROXY_SUPPORT = 0x0000004b;
enum HTTP_QUERY_AUTHENTICATION_INFO = 0x0000004c;
enum HTTP_QUERY_PASSPORT_URLS = 0x0000004d;
enum HTTP_QUERY_PASSPORT_CONFIG = 0x0000004e;
enum HTTP_QUERY_X_CONTENT_TYPE_OPTIONS = 0x0000004f;
enum HTTP_QUERY_P3P = 0x00000050;
enum HTTP_QUERY_X_P2P_PEERDIST = 0x00000051;
enum HTTP_QUERY_TRANSLATE = 0x00000052;
enum HTTP_QUERY_X_UA_COMPATIBLE = 0x00000053;
enum HTTP_QUERY_DEFAULT_STYLE = 0x00000054;
enum HTTP_QUERY_X_FRAME_OPTIONS = 0x00000055;
enum HTTP_QUERY_X_XSS_PROTECTION = 0x00000056;
enum HTTP_QUERY_SET_COOKIE2 = 0x00000057;
enum HTTP_QUERY_DO_NOT_TRACK = 0x00000058;
enum HTTP_QUERY_KEEP_ALIVE = 0x00000059;
enum HTTP_QUERY_HTTP2_SETTINGS = 0x0000005a;
enum HTTP_QUERY_STRICT_TRANSPORT_SECURITY = 0x0000005b;
enum HTTP_QUERY_TOKEN_BINDING = 0x0000005c;
enum HTTP_QUERY_INCLUDE_REFERRED_TOKEN_BINDING_ID = 0x0000005d;
enum HTTP_QUERY_INCLUDE_REFERER_TOKEN_BINDING_ID = 0x0000005d;
enum HTTP_QUERY_PUBLIC_KEY_PINS = 0x0000005e;
enum HTTP_QUERY_PUBLIC_KEY_PINS_REPORT_ONLY = 0x0000005f;
enum HTTP_QUERY_MAX = 0x0000005f;
enum HTTP_QUERY_CUSTOM = 0x0000ffff;
enum HTTP_QUERY_FLAG_REQUEST_HEADERS = 0x80000000;
enum HTTP_QUERY_FLAG_SYSTEMTIME = 0x40000000;
enum HTTP_QUERY_FLAG_NUMBER = 0x20000000;
enum HTTP_QUERY_FLAG_COALESCE = 0x10000000;
enum HTTP_QUERY_FLAG_NUMBER64 = 0x08000000;
enum HTTP_QUERY_FLAG_COALESCE_WITH_COMMA = 0x04000000;
enum HTTP_STATUS_MISDIRECTED_REQUEST = 0x000001a5;
enum HTTP_ADDREQ_INDEX_MASK = 0x0000ffff;
enum HTTP_ADDREQ_FLAGS_MASK = 0xffff0000;
enum HSR_ASYNC = 0x00000001;
enum HSR_SYNC = 0x00000004;
enum HSR_USE_CONTEXT = 0x00000008;
enum HSR_INITIATE = 0x00000008;
enum HSR_DOWNLOAD = 0x00000010;
enum HSR_CHUNKED = 0x00000020;
enum INTERNET_COOKIE_IS_SECURE = 0x00000001;
enum INTERNET_COOKIE_IS_SESSION = 0x00000002;
enum INTERNET_COOKIE_PROMPT_REQUIRED = 0x00000020;
enum INTERNET_COOKIE_EVALUATE_P3P = 0x00000040;
enum INTERNET_COOKIE_APPLY_P3P = 0x00000080;
enum INTERNET_COOKIE_P3P_ENABLED = 0x00000100;
enum INTERNET_COOKIE_IS_RESTRICTED = 0x00000200;
enum INTERNET_COOKIE_IE6 = 0x00000400;
enum INTERNET_COOKIE_IS_LEGACY = 0x00000800;
enum INTERNET_COOKIE_NON_SCRIPT = 0x00001000;
enum INTERNET_COOKIE_HOST_ONLY = 0x00004000;
enum INTERNET_COOKIE_APPLY_HOST_ONLY = 0x00008000;
enum INTERNET_COOKIE_HOST_ONLY_APPLIED = 0x00080000;
enum INTERNET_COOKIE_SAME_SITE_STRICT = 0x00100000;
enum INTERNET_COOKIE_SAME_SITE_LAX = 0x00200000;
enum INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE = 0x00400000;
enum FLAG_ICC_FORCE_CONNECTION = 0x00000001;
enum FLAGS_ERROR_UI_FILTER_FOR_ERRORS = 0x00000001;
enum FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS = 0x00000002;
enum FLAGS_ERROR_UI_FLAGS_GENERATE_DATA = 0x00000004;
enum FLAGS_ERROR_UI_FLAGS_NO_UI = 0x00000008;
enum FLAGS_ERROR_UI_SERIALIZE_DIALOGS = 0x00000010;
enum INTERNET_ERROR_BASE = 0x00002ee0;
enum ERROR_INTERNET_OUT_OF_HANDLES = 0x00002ee1;
enum ERROR_INTERNET_TIMEOUT = 0x00002ee2;
enum ERROR_INTERNET_EXTENDED_ERROR = 0x00002ee3;
enum ERROR_INTERNET_INTERNAL_ERROR = 0x00002ee4;
enum ERROR_INTERNET_INVALID_URL = 0x00002ee5;
enum ERROR_INTERNET_UNRECOGNIZED_SCHEME = 0x00002ee6;
enum ERROR_INTERNET_NAME_NOT_RESOLVED = 0x00002ee7;
enum ERROR_INTERNET_PROTOCOL_NOT_FOUND = 0x00002ee8;
enum ERROR_INTERNET_INVALID_OPTION = 0x00002ee9;
enum ERROR_INTERNET_BAD_OPTION_LENGTH = 0x00002eea;
enum ERROR_INTERNET_OPTION_NOT_SETTABLE = 0x00002eeb;
enum ERROR_INTERNET_SHUTDOWN = 0x00002eec;
enum ERROR_INTERNET_INCORRECT_USER_NAME = 0x00002eed;
enum ERROR_INTERNET_INCORRECT_PASSWORD = 0x00002eee;
enum ERROR_INTERNET_LOGIN_FAILURE = 0x00002eef;
enum ERROR_INTERNET_INVALID_OPERATION = 0x00002ef0;
enum ERROR_INTERNET_OPERATION_CANCELLED = 0x00002ef1;
enum ERROR_INTERNET_INCORRECT_HANDLE_TYPE = 0x00002ef2;
enum ERROR_INTERNET_INCORRECT_HANDLE_STATE = 0x00002ef3;
enum ERROR_INTERNET_NOT_PROXY_REQUEST = 0x00002ef4;
enum ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND = 0x00002ef5;
enum ERROR_INTERNET_BAD_REGISTRY_PARAMETER = 0x00002ef6;
enum ERROR_INTERNET_NO_DIRECT_ACCESS = 0x00002ef7;
enum ERROR_INTERNET_NO_CONTEXT = 0x00002ef8;
enum ERROR_INTERNET_NO_CALLBACK = 0x00002ef9;
enum ERROR_INTERNET_REQUEST_PENDING = 0x00002efa;
enum ERROR_INTERNET_INCORRECT_FORMAT = 0x00002efb;
enum ERROR_INTERNET_ITEM_NOT_FOUND = 0x00002efc;
enum ERROR_INTERNET_CANNOT_CONNECT = 0x00002efd;
enum ERROR_INTERNET_CONNECTION_ABORTED = 0x00002efe;
enum ERROR_INTERNET_CONNECTION_RESET = 0x00002eff;
enum ERROR_INTERNET_FORCE_RETRY = 0x00002f00;
enum ERROR_INTERNET_INVALID_PROXY_REQUEST = 0x00002f01;
enum ERROR_INTERNET_NEED_UI = 0x00002f02;
enum ERROR_INTERNET_HANDLE_EXISTS = 0x00002f04;
enum ERROR_INTERNET_SEC_CERT_DATE_INVALID = 0x00002f05;
enum ERROR_INTERNET_SEC_CERT_CN_INVALID = 0x00002f06;
enum ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR = 0x00002f07;
enum ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR = 0x00002f08;
enum ERROR_INTERNET_MIXED_SECURITY = 0x00002f09;
enum ERROR_INTERNET_CHG_POST_IS_NON_SECURE = 0x00002f0a;
enum ERROR_INTERNET_POST_IS_NON_SECURE = 0x00002f0b;
enum ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED = 0x00002f0c;
enum ERROR_INTERNET_INVALID_CA = 0x00002f0d;
enum ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP = 0x00002f0e;
enum ERROR_INTERNET_ASYNC_THREAD_FAILED = 0x00002f0f;
enum ERROR_INTERNET_REDIRECT_SCHEME_CHANGE = 0x00002f10;
enum ERROR_INTERNET_DIALOG_PENDING = 0x00002f11;
enum ERROR_INTERNET_RETRY_DIALOG = 0x00002f12;
enum ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR = 0x00002f14;
enum ERROR_INTERNET_INSERT_CDROM = 0x00002f15;
enum ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED = 0x00002f16;
enum ERROR_INTERNET_SEC_CERT_ERRORS = 0x00002f17;
enum ERROR_INTERNET_SEC_CERT_NO_REV = 0x00002f18;
enum ERROR_INTERNET_SEC_CERT_REV_FAILED = 0x00002f19;
enum ERROR_HTTP_HSTS_REDIRECT_REQUIRED = 0x00002f1c;
enum ERROR_INTERNET_SEC_CERT_WEAK_SIGNATURE = 0x00002f1e;
enum ERROR_FTP_TRANSFER_IN_PROGRESS = 0x00002f4e;
enum ERROR_FTP_DROPPED = 0x00002f4f;
enum ERROR_FTP_NO_PASSIVE_MODE = 0x00002f50;
enum ERROR_GOPHER_PROTOCOL_ERROR = 0x00002f62;
enum ERROR_GOPHER_NOT_FILE = 0x00002f63;
enum ERROR_GOPHER_DATA_ERROR = 0x00002f64;
enum ERROR_GOPHER_END_OF_DATA = 0x00002f65;
enum ERROR_GOPHER_INVALID_LOCATOR = 0x00002f66;
enum ERROR_GOPHER_INCORRECT_LOCATOR_TYPE = 0x00002f67;
enum ERROR_GOPHER_NOT_GOPHER_PLUS = 0x00002f68;
enum ERROR_GOPHER_ATTRIBUTE_NOT_FOUND = 0x00002f69;
enum ERROR_GOPHER_UNKNOWN_LOCATOR = 0x00002f6a;
enum ERROR_HTTP_HEADER_NOT_FOUND = 0x00002f76;
enum ERROR_HTTP_DOWNLEVEL_SERVER = 0x00002f77;
enum ERROR_HTTP_INVALID_SERVER_RESPONSE = 0x00002f78;
enum ERROR_HTTP_INVALID_HEADER = 0x00002f79;
enum ERROR_HTTP_INVALID_QUERY_REQUEST = 0x00002f7a;
enum ERROR_HTTP_HEADER_ALREADY_EXISTS = 0x00002f7b;
enum ERROR_HTTP_REDIRECT_FAILED = 0x00002f7c;
enum ERROR_HTTP_NOT_REDIRECTED = 0x00002f80;
enum ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION = 0x00002f81;
enum ERROR_HTTP_COOKIE_DECLINED = 0x00002f82;
enum ERROR_HTTP_REDIRECT_NEEDS_CONFIRMATION = 0x00002f88;
enum ERROR_INTERNET_SECURITY_CHANNEL_ERROR = 0x00002f7d;
enum ERROR_INTERNET_UNABLE_TO_CACHE_FILE = 0x00002f7e;
enum ERROR_INTERNET_TCPIP_NOT_INSTALLED = 0x00002f7f;
enum ERROR_INTERNET_DISCONNECTED = 0x00002f83;
enum ERROR_INTERNET_SERVER_UNREACHABLE = 0x00002f84;
enum ERROR_INTERNET_PROXY_SERVER_UNREACHABLE = 0x00002f85;
enum ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT = 0x00002f86;
enum ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT = 0x00002f87;
enum ERROR_INTERNET_SEC_INVALID_CERT = 0x00002f89;
enum ERROR_INTERNET_SEC_CERT_REVOKED = 0x00002f8a;
enum ERROR_INTERNET_FAILED_DUETOSECURITYCHECK = 0x00002f8b;
enum ERROR_INTERNET_NOT_INITIALIZED = 0x00002f8c;
enum ERROR_INTERNET_NEED_MSN_SSPI_PKG = 0x00002f8d;
enum ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = 0x00002f8e;
enum ERROR_INTERNET_DECODING_FAILED = 0x00002f8f;
enum ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED_PROXY = 0x00002f9b;
enum ERROR_INTERNET_SECURE_FAILURE_PROXY = 0x00002f9c;
enum ERROR_INTERNET_HTTP_PROTOCOL_MISMATCH = 0x00002f9e;
enum ERROR_INTERNET_GLOBAL_CALLBACK_FAILED = 0x00002f9f;
enum ERROR_INTERNET_FEATURE_DISABLED = 0x00002fa0;
enum INTERNET_ERROR_LAST = 0x00002fa0;
enum NORMAL_CACHE_ENTRY = 0x00000001;
enum STICKY_CACHE_ENTRY = 0x00000004;
enum EDITED_CACHE_ENTRY = 0x00000008;
enum TRACK_OFFLINE_CACHE_ENTRY = 0x00000010;
enum TRACK_ONLINE_CACHE_ENTRY = 0x00000020;
enum SPARSE_CACHE_ENTRY = 0x00010000;
enum COOKIE_CACHE_ENTRY = 0x00100000;
enum URLHISTORY_CACHE_ENTRY = 0x00200000;
enum CACHEGROUP_ATTRIBUTE_GET_ALL = 0xffffffff;
enum CACHEGROUP_ATTRIBUTE_BASIC = 0x00000001;
enum CACHEGROUP_ATTRIBUTE_FLAG = 0x00000002;
enum CACHEGROUP_ATTRIBUTE_TYPE = 0x00000004;
enum CACHEGROUP_ATTRIBUTE_QUOTA = 0x00000008;
enum CACHEGROUP_ATTRIBUTE_GROUPNAME = 0x00000010;
enum CACHEGROUP_ATTRIBUTE_STORAGE = 0x00000020;
enum CACHEGROUP_FLAG_NONPURGEABLE = 0x00000001;
enum CACHEGROUP_FLAG_GIDONLY = 0x00000004;
enum CACHEGROUP_FLAG_FLUSHURL_ONDELETE = 0x00000002;
enum CACHEGROUP_SEARCH_ALL = 0x00000000;
enum CACHEGROUP_SEARCH_BYURL = 0x00000001;
enum CACHEGROUP_TYPE_INVALID = 0x00000001;
enum GROUPNAME_MAX_LENGTH = 0x00000078;
enum GROUP_OWNER_STORAGE_SIZE = 0x00000004;
enum CACHE_ENTRY_ATTRIBUTE_FC = 0x00000004;
enum CACHE_ENTRY_HITRATE_FC = 0x00000010;
enum CACHE_ENTRY_MODTIME_FC = 0x00000040;
enum CACHE_ENTRY_EXPTIME_FC = 0x00000080;
enum CACHE_ENTRY_ACCTIME_FC = 0x00000100;
enum CACHE_ENTRY_SYNCTIME_FC = 0x00000200;
enum CACHE_ENTRY_HEADERINFO_FC = 0x00000400;
enum CACHE_ENTRY_EXEMPT_DELTA_FC = 0x00000800;
enum INTERNET_CACHE_GROUP_ADD = 0x00000000;
enum INTERNET_CACHE_GROUP_REMOVE = 0x00000001;
enum INTERNET_DIAL_FORCE_PROMPT = 0x00002000;
enum INTERNET_DIAL_SHOW_OFFLINE = 0x00004000;
enum INTERNET_DIAL_UNATTENDED = 0x00008000;
enum INTERENT_GOONLINE_REFRESH = 0x00000001;
enum INTERENT_GOONLINE_NOPROMPT = 0x00000002;
enum INTERENT_GOONLINE_MASK = 0x00000003;
enum INTERNET_CUSTOMDIAL_CONNECT = 0x00000000;
enum INTERNET_CUSTOMDIAL_UNATTENDED = 0x00000001;
enum INTERNET_CUSTOMDIAL_DISCONNECT = 0x00000002;
enum INTERNET_CUSTOMDIAL_SHOWOFFLINE = 0x00000004;
enum INTERNET_CUSTOMDIAL_SAFE_FOR_UNATTENDED = 0x00000001;
enum INTERNET_CUSTOMDIAL_WILL_SUPPLY_STATE = 0x00000002;
enum INTERNET_CUSTOMDIAL_CAN_HANGUP = 0x00000004;
enum INTERNET_DIALSTATE_DISCONNECTED = 0x00000001;
enum INTERNET_IDENTITY_FLAG_PRIVATE_CACHE = 0x00000001;
enum INTERNET_IDENTITY_FLAG_SHARED_CACHE = 0x00000002;
enum INTERNET_IDENTITY_FLAG_CLEAR_DATA = 0x00000004;
enum INTERNET_IDENTITY_FLAG_CLEAR_COOKIES = 0x00000008;
enum INTERNET_IDENTITY_FLAG_CLEAR_HISTORY = 0x00000010;
enum INTERNET_IDENTITY_FLAG_CLEAR_CONTENT = 0x00000020;
enum INTERNET_SUPPRESS_RESET_ALL = 0x00000000;
enum INTERNET_SUPPRESS_COOKIE_POLICY = 0x00000001;
enum INTERNET_SUPPRESS_COOKIE_POLICY_RESET = 0x00000002;
enum PRIVACY_TEMPLATE_NO_COOKIES = 0x00000000;
enum PRIVACY_TEMPLATE_HIGH = 0x00000001;
enum PRIVACY_TEMPLATE_MEDIUM_HIGH = 0x00000002;
enum PRIVACY_TEMPLATE_MEDIUM = 0x00000003;
enum PRIVACY_TEMPLATE_MEDIUM_LOW = 0x00000004;
enum PRIVACY_TEMPLATE_LOW = 0x00000005;
enum PRIVACY_TEMPLATE_CUSTOM = 0x00000064;
enum PRIVACY_TEMPLATE_ADVANCED = 0x00000065;
enum PRIVACY_TEMPLATE_MAX = 0x00000005;
enum PRIVACY_TYPE_FIRST_PARTY = 0x00000000;
enum PRIVACY_TYPE_THIRD_PARTY = 0x00000001;
enum MAX_CACHE_ENTRY_INFO_SIZE = 0x00001000;
enum INTERNET_REQFLAG_FROM_APP_CACHE = 0x00000100;
enum INTERNET_FLAG_BGUPDATE = 0x00000008;
enum INTERNET_FLAG_FTP_FOLDER_VIEW = 0x00000004;
enum INTERNET_PREFETCH_PROGRESS = 0x00000000;
enum INTERNET_PREFETCH_COMPLETE = 0x00000001;
enum INTERNET_PREFETCH_ABORTED = 0x00000002;
enum ISO_FORCE_OFFLINE = 0x00000001;
enum DLG_FLAGS_INVALID_CA = 0x01000000;
enum DLG_FLAGS_SEC_CERT_CN_INVALID = 0x02000000;
enum DLG_FLAGS_SEC_CERT_DATE_INVALID = 0x04000000;
enum DLG_FLAGS_WEAK_SIGNATURE = 0x00200000;
enum DLG_FLAGS_INSECURE_FALLBACK = 0x00400000;
enum DLG_FLAGS_SEC_CERT_REV_FAILED = 0x00800000;
enum INTERNET_SERVICE_URL = 0x00000000;
enum INTERNET_OPTION_CONTEXT_VALUE_OLD = 0x0000000a;
enum INTERNET_OPTION_NET_SPEED = 0x0000003d;
enum INTERNET_OPTION_SECURITY_CONNECTION_INFO = 0x00000042;
enum INTERNET_OPTION_DETECT_POST_SEND = 0x00000047;
enum INTERNET_OPTION_DISABLE_NTLM_PREAUTH = 0x00000048;
enum INTERNET_OPTION_ORIGINAL_CONNECT_FLAGS = 0x00000061;
enum INTERNET_OPTION_CERT_ERROR_FLAGS = 0x00000062;
enum INTERNET_OPTION_IGNORE_CERT_ERROR_FLAGS = 0x00000063;
enum INTERNET_OPTION_SESSION_START_TIME = 0x0000006a;
enum INTERNET_OPTION_PROXY_CREDENTIALS = 0x0000006b;
enum INTERNET_OPTION_EXTENDED_CALLBACKS = 0x0000006c;
enum INTERNET_OPTION_PROXY_FROM_REQUEST = 0x0000006d;
enum INTERNET_OPTION_ALLOW_FAILED_CONNECT_CONTENT = 0x0000006e;
enum INTERNET_OPTION_CACHE_PARTITION = 0x0000006f;
enum INTERNET_OPTION_AUTODIAL_HWND = 0x00000070;
enum INTERNET_OPTION_SERVER_CREDENTIALS = 0x00000071;
enum INTERNET_OPTION_WPAD_SLEEP = 0x00000072;
enum INTERNET_OPTION_FAIL_ON_CACHE_WRITE_ERROR = 0x00000073;
enum INTERNET_OPTION_DOWNLOAD_MODE = 0x00000074;
enum INTERNET_OPTION_RESPONSE_RESUMABLE = 0x00000075;
enum INTERNET_OPTION_CM_HANDLE_COPY_REF = 0x00000076;
enum INTERNET_OPTION_CONNECTION_INFO = 0x00000078;
enum INTERNET_OPTION_BACKGROUND_CONNECTIONS = 0x00000079;
enum INTERNET_OPTION_DO_NOT_TRACK = 0x0000007b;
enum INTERNET_OPTION_USE_MODIFIED_HEADER_FILTER = 0x0000007c;
enum INTERNET_OPTION_WWA_MODE = 0x0000007d;
enum INTERNET_OPTION_UPGRADE_TO_WEB_SOCKET = 0x0000007e;
enum INTERNET_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL = 0x0000007f;
enum INTERNET_OPTION_UNLOAD_NOTIFY_EVENT = 0x00000080;
enum INTERNET_OPTION_SOCKET_NODELAY = 0x00000081;
enum INTERNET_OPTION_APP_CACHE = 0x00000082;
enum INTERNET_OPTION_DEPENDENCY_HANDLE = 0x00000083;
enum INTERNET_OPTION_USE_FIRST_AVAILABLE_CONNECTION = 0x00000084;
enum INTERNET_OPTION_TIMED_CONNECTION_LIMIT_BYPASS = 0x00000085;
enum INTERNET_OPTION_WEB_SOCKET_CLOSE_TIMEOUT = 0x00000086;
enum INTERNET_OPTION_FLUSH_STATE = 0x00000087;
enum INTERNET_OPTION_DISALLOW_PREMATURE_EOF = 0x00000089;
enum INTERNET_OPTION_SOCKET_NOTIFICATION_IOCTL = 0x0000008a;
enum INTERNET_OPTION_CACHE_ENTRY_EXTRA_DATA = 0x0000008b;
enum INTERNET_OPTION_MAX_QUERY_BUFFER_SIZE = 0x0000008c;
enum INTERNET_OPTION_FALSE_START = 0x0000008d;
enum INTERNET_OPTION_USER_PASS_SERVER_ONLY = 0x0000008e;
enum INTERNET_OPTION_SERVER_AUTH_SCHEME = 0x0000008f;
enum INTERNET_OPTION_PROXY_AUTH_SCHEME = 0x00000090;
enum INTERNET_OPTION_TUNNEL_ONLY = 0x00000091;
enum INTERNET_OPTION_SOURCE_PORT = 0x00000092;
enum INTERNET_OPTION_ENABLE_DUO = 0x00000094;
enum INTERNET_OPTION_DUO_USED = 0x00000095;
enum INTERNET_OPTION_CHUNK_ENCODE_REQUEST = 0x00000096;
enum INTERNET_OPTION_SECURE_FAILURE = 0x00000097;
enum INTERNET_OPTION_NOTIFY_SENDING_COOKIE = 0x00000098;
enum INTERNET_OPTION_CLIENT_CERT_ISSUER_LIST = 0x00000099;
enum INTERNET_OPTION_RESET = 0x0000009a;
enum INTERNET_OPTION_SERVER_ADDRESS_INFO = 0x0000009c;
enum INTERNET_OPTION_ENABLE_WBOEXT = 0x0000009e;
enum INTERNET_OPTION_DISABLE_INSECURE_FALLBACK = 0x000000a0;
enum INTERNET_OPTION_ALLOW_INSECURE_FALLBACK = 0x000000a1;
enum INTERNET_OPTION_SET_IN_PRIVATE = 0x000000a4;
enum INTERNET_OPTION_DOWNLOAD_MODE_HANDLE = 0x000000a5;
enum INTERNET_OPTION_EDGE_COOKIES = 0x000000a6;
enum INTERNET_OPTION_NO_HTTP_SERVER_AUTH = 0x000000a7;
enum INTERNET_OPTION_ENABLE_HEADER_CALLBACKS = 0x000000a8;
enum INTERNET_OPTION_PRESERVE_REQUEST_SERVER_CREDENTIALS_ON_REDIRECT = 0x000000a9;
enum INTERNET_OPTION_PRESERVE_REFERER_ON_HTTPS_TO_HTTP_REDIRECT = 0x000000aa;
enum INTERNET_OPTION_TCP_FAST_OPEN = 0x000000ab;
enum INTERNET_OPTION_SYNC_MODE_AUTOMATIC_SESSION_DISABLED = 0x000000ac;
enum INTERNET_OPTION_ENABLE_ZLIB_DEFLATE = 0x000000ad;
enum INTERNET_OPTION_ENCODE_FALLBACK_FOR_REDIRECT_URI = 0x000000ae;
enum INTERNET_OPTION_EDGE_COOKIES_TEMP = 0x000000af;
enum INTERNET_OPTION_OPT_IN_WEAK_SIGNATURE = 0x000000b0;
enum INTERNET_OPTION_PARSE_LINE_FOLDING = 0x000000b1;
enum INTERNET_OPTION_FORCE_DECODE = 0x000000b2;
enum INTERNET_OPTION_COOKIES_APPLY_HOST_ONLY = 0x000000b3;
enum INTERNET_OPTION_EDGE_MODE = 0x000000b4;
enum INTERNET_OPTION_CANCEL_CACHE_WRITE = 0x000000b6;
enum INTERNET_OPTION_AUTH_SCHEME_SELECTED = 0x000000b7;
enum INTERNET_OPTION_NOCACHE_WRITE_IN_PRIVATE = 0x000000b8;
enum INTERNET_OPTION_ACTIVITY_ID = 0x000000b9;
enum INTERNET_OPTION_REQUEST_TIMES = 0x000000ba;
enum INTERNET_OPTION_GLOBAL_CALLBACK = 0x000000bc;
enum INTERNET_OPTION_ENABLE_TEST_SIGNING = 0x000000bd;
enum INTERNET_OPTION_DISABLE_PROXY_LINK_LOCAL_NAME_RESOLUTION = 0x000000be;
enum INTERNET_OPTION_HTTP_09 = 0x000000bf;
enum INTERNET_OPTION_CALLER_MODULE = 0x000000c0;
enum INTERNET_LAST_OPTION_INTERNAL = 0x000000c1;
enum INTERNET_OPTION_OFFLINE_TIMEOUT = 0x00000031;
enum INTERNET_OPTION_LINE_STATE = 0x00000032;
enum DUO_PROTOCOL_FLAG_SPDY3 = 0x00000001;
enum DUO_PROTOCOL_MASK = 0x00000001;
enum AUTH_FLAG_RESET = 0x00000000;
enum INTERNET_AUTH_SCHEME_BASIC = 0x00000000;
enum INTERNET_AUTH_SCHEME_DIGEST = 0x00000001;
enum INTERNET_AUTH_SCHEME_NTLM = 0x00000002;
enum INTERNET_AUTH_SCHEME_KERBEROS = 0x00000003;
enum INTERNET_AUTH_SCHEME_NEGOTIATE = 0x00000004;
enum INTERNET_AUTH_SCHEME_PASSPORT = 0x00000005;
enum INTERNET_AUTH_SCHEME_UNKNOWN = 0x00000006;
enum INTERNET_STATUS_SENDING_COOKIE = 0x00000148;
enum INTERNET_STATUS_REQUEST_HEADERS_SET = 0x00000149;
enum INTERNET_STATUS_RESPONSE_HEADERS_SET = 0x0000014a;
enum INTERNET_STATUS_PROXY_CREDENTIALS = 0x00000190;
enum INTERNET_STATUS_SERVER_CREDENTIALS = 0x00000191;
enum INTERNET_STATUS_SERVER_CONNECTION_STATE = 0x0000019a;
enum INTERNET_STATUS_END_BROWSER_SESSION = 0x000001a4;
enum INTERNET_STATUS_COOKIE = 0x000001ae;
enum COOKIE_STATE_LB = 0x00000000;
enum COOKIE_STATE_UB = 0x00000005;
enum MaxPrivacySettings = 0x00004000;
enum INTERNET_STATUS_FILTER_RESOLVING = 0x00000001;
enum INTERNET_STATUS_FILTER_RESOLVED = 0x00000002;
enum INTERNET_STATUS_FILTER_CONNECTING = 0x00000004;
enum INTERNET_STATUS_FILTER_CONNECTED = 0x00000008;
enum INTERNET_STATUS_FILTER_SENDING = 0x00000010;
enum INTERNET_STATUS_FILTER_SENT = 0x00000020;
enum INTERNET_STATUS_FILTER_RECEIVING = 0x00000040;
enum INTERNET_STATUS_FILTER_RECEIVED = 0x00000080;
enum INTERNET_STATUS_FILTER_CLOSING = 0x00000100;
enum INTERNET_STATUS_FILTER_CLOSED = 0x00000200;
enum INTERNET_STATUS_FILTER_HANDLE_CREATED = 0x00000400;
enum INTERNET_STATUS_FILTER_HANDLE_CLOSING = 0x00000800;
enum INTERNET_STATUS_FILTER_PREFETCH = 0x00001000;
enum INTERNET_STATUS_FILTER_REDIRECT = 0x00002000;
enum INTERNET_STATUS_FILTER_STATE_CHANGE = 0x00004000;
enum HTTP_ADDREQ_FLAG_RESPONSE_HEADERS = 0x02000000;
enum HTTP_ADDREQ_FLAG_ALLOW_EMPTY_VALUES = 0x04000000;
enum COOKIE_DONT_ALLOW = 0x00000001;
enum COOKIE_ALLOW = 0x00000002;
enum COOKIE_ALLOW_ALL = 0x00000004;
enum COOKIE_DONT_ALLOW_ALL = 0x00000008;
enum COOKIE_OP_SET = 0x00000001;
enum COOKIE_OP_MODIFY = 0x00000002;
enum COOKIE_OP_GET = 0x00000004;
enum COOKIE_OP_SESSION = 0x00000008;
enum COOKIE_OP_PERSISTENT = 0x00000010;
enum COOKIE_OP_3RD_PARTY = 0x00000020;
enum INTERNET_COOKIE_PERSISTENT_HOST_ONLY = 0x00010000;
enum INTERNET_COOKIE_RESTRICTED_ZONE = 0x00020000;
enum INTERNET_COOKIE_EDGE_COOKIES = 0x00040000;
enum INTERNET_COOKIE_ALL_COOKIES = 0x20000000;
enum INTERNET_COOKIE_NO_CALLBACK = 0x40000000;
enum INTERNET_COOKIE_ECTX_3RDPARTY = 0x80000000;
enum FLAGS_ERROR_UI_SHOW_IDN_HOSTNAME = 0x00000020;
enum ERROR_INTERNET_NO_NEW_CONTAINERS = 0x00002f13;
enum ERROR_INTERNET_SOURCE_PORT_IN_USE = 0x00002f1a;
enum ERROR_INTERNET_INSECURE_FALLBACK_REQUIRED = 0x00002f1b;
enum ERROR_INTERNET_PROXY_ALERT = 0x00002f1d;
enum ERROR_INTERNET_NO_CM_CONNECTION = 0x00002f30;
enum ERROR_HTTP_PUSH_STATUS_CODE_NOT_SUPPORTED = 0x00002f73;
enum ERROR_HTTP_PUSH_RETRY_NOT_SUPPORTED = 0x00002f74;
enum ERROR_HTTP_PUSH_ENABLE_FAILED = 0x00002f75;
enum ERROR_INTERNET_DISALLOW_INPRIVATE = 0x00002f9d;
enum ERROR_INTERNET_OFFLINE = 0x00002f83;
enum INTERNET_INTERNAL_ERROR_BASE = 0x00003264;
enum ERROR_INTERNET_INTERNAL_SOCKET_ERROR = 0x00003265;
enum ERROR_INTERNET_CONNECTION_AVAILABLE = 0x00003266;
enum ERROR_INTERNET_NO_KNOWN_SERVERS = 0x00003267;
enum ERROR_INTERNET_PING_FAILED = 0x00003268;
enum ERROR_INTERNET_NO_PING_SUPPORT = 0x00003269;
enum ERROR_INTERNET_CACHE_SUCCESS = 0x0000326a;
enum ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION_EX = 0x0000326b;
enum HTTP_1_1_CACHE_ENTRY = 0x00000040;
enum STATIC_CACHE_ENTRY = 0x00000080;
enum MUST_REVALIDATE_CACHE_ENTRY = 0x00000100;
enum SHORTPATH_CACHE_ENTRY = 0x00000200;
enum DOWNLOAD_CACHE_ENTRY = 0x00000400;
enum REDIRECT_CACHE_ENTRY = 0x00000800;
enum COOKIE_ACCEPTED_CACHE_ENTRY = 0x00001000;
enum COOKIE_LEASHED_CACHE_ENTRY = 0x00002000;
enum COOKIE_DOWNGRADED_CACHE_ENTRY = 0x00004000;
enum COOKIE_REJECTED_CACHE_ENTRY = 0x00008000;
enum PRIVACY_MODE_CACHE_ENTRY = 0x00020000;
enum XDR_CACHE_ENTRY = 0x00040000;
enum IMMUTABLE_CACHE_ENTRY = 0x00080000;
enum PENDING_DELETE_CACHE_ENTRY = 0x00400000;
enum OTHER_USER_CACHE_ENTRY = 0x00800000;
enum PRIVACY_IMPACTED_CACHE_ENTRY = 0x02000000;
enum POST_RESPONSE_CACHE_ENTRY = 0x04000000;
enum INSTALLED_CACHE_ENTRY = 0x10000000;
enum POST_CHECK_CACHE_ENTRY = 0x20000000;
enum IDENTITY_CACHE_ENTRY = 0x80000000;
enum ANY_CACHE_ENTRY = 0xffffffff;
enum CACHEGROUP_FLAG_VALID = 0x00000007;
enum CACHEGROUP_ID_BUILTIN_STICKY = 0x1000000000000007;
enum INTERNET_CACHE_FLAG_ALLOW_COLLISIONS = 0x00000100;
enum INTERNET_CACHE_FLAG_INSTALLED_ENTRY = 0x00000200;
enum INTERNET_CACHE_FLAG_ENTRY_OR_MAPPING = 0x00000400;
enum INTERNET_CACHE_FLAG_ADD_FILENAME_ONLY = 0x00000800;
enum INTERNET_CACHE_FLAG_GET_STRUCT_ONLY = 0x00001000;
enum CACHE_ENTRY_TYPE_FC = 0x00001000;
enum CACHE_ENTRY_MODIFY_DATA_FC = 0x80000000;
enum INTERNET_CACHE_CONTAINER_NOSUBDIRS = 0x00000001;
enum INTERNET_CACHE_CONTAINER_AUTODELETE = 0x00000002;
enum INTERNET_CACHE_CONTAINER_RESERVED1 = 0x00000004;
enum INTERNET_CACHE_CONTAINER_NODESKTOPINIT = 0x00000008;
enum INTERNET_CACHE_CONTAINER_MAP_ENABLED = 0x00000010;
enum INTERNET_CACHE_CONTAINER_BLOOM_FILTER = 0x00000020;
enum INTERNET_CACHE_CONTAINER_SHARE_READ = 0x00000100;
enum INTERNET_CACHE_CONTAINER_SHARE_READ_WRITE = 0x00000300;
enum CACHE_FIND_CONTAINER_RETURN_NOCHANGE = 0x00000001;
enum CACHE_HEADER_DATA_CURRENT_SETTINGS_VERSION = 0x00000000;
enum CACHE_HEADER_DATA_CONLIST_CHANGE_COUNT = 0x00000001;
enum CACHE_HEADER_DATA_COOKIE_CHANGE_COUNT = 0x00000002;
enum CACHE_HEADER_DATA_NOTIFICATION_HWND = 0x00000003;
enum CACHE_HEADER_DATA_NOTIFICATION_MESG = 0x00000004;
enum CACHE_HEADER_DATA_ROOTGROUP_OFFSET = 0x00000005;
enum CACHE_HEADER_DATA_GID_LOW = 0x00000006;
enum CACHE_HEADER_DATA_GID_HIGH = 0x00000007;
enum CACHE_HEADER_DATA_LAST_SCAVENGE_TIMESTAMP = 0x00000008;
enum CACHE_HEADER_DATA_CACHE_READ_COUNT_SINCE_LAST_SCAVENGE = 0x00000009;
enum CACHE_HEADER_DATA_CACHE_WRITE_COUNT_SINCE_LAST_SCAVENGE = 0x0000000a;
enum CACHE_HEADER_DATA_HSTS_CHANGE_COUNT = 0x0000000b;
enum CACHE_HEADER_DATA_CACHE_RESERVED_12 = 0x0000000c;
enum CACHE_HEADER_DATA_CACHE_RESERVED_13 = 0x0000000d;
enum CACHE_HEADER_DATA_SSL_STATE_COUNT = 0x0000000e;
enum CACHE_HEADER_DATA_DOWNLOAD_PARTIAL = 0x0000000e;
enum CACHE_HEADER_DATA_CACHE_RESERVED_15 = 0x0000000f;
enum CACHE_HEADER_DATA_CACHE_RESERVED_16 = 0x00000010;
enum CACHE_HEADER_DATA_CACHE_RESERVED_17 = 0x00000011;
enum CACHE_HEADER_DATA_CACHE_RESERVED_18 = 0x00000012;
enum CACHE_HEADER_DATA_CACHE_RESERVED_19 = 0x00000013;
enum CACHE_HEADER_DATA_CACHE_RESERVED_20 = 0x00000014;
enum CACHE_HEADER_DATA_NOTIFICATION_FILTER = 0x00000015;
enum CACHE_HEADER_DATA_ROOT_LEAK_OFFSET = 0x00000016;
enum CACHE_HEADER_DATA_CACHE_RESERVED_23 = 0x00000017;
enum CACHE_HEADER_DATA_CACHE_RESERVED_24 = 0x00000018;
enum CACHE_HEADER_DATA_CACHE_RESERVED_25 = 0x00000019;
enum CACHE_HEADER_DATA_CACHE_RESERVED_26 = 0x0000001a;
enum CACHE_HEADER_DATA_ROOT_GROUPLIST_OFFSET = 0x0000001b;
enum CACHE_HEADER_DATA_CACHE_RESERVED_28 = 0x0000001c;
enum CACHE_HEADER_DATA_CACHE_RESERVED_29 = 0x0000001d;
enum CACHE_HEADER_DATA_CACHE_RESERVED_30 = 0x0000001e;
enum CACHE_HEADER_DATA_CACHE_RESERVED_31 = 0x0000001f;
enum CACHE_HEADER_DATA_LAST = 0x0000001f;
enum CACHE_NOTIFY_ADD_URL = 0x00000001;
enum CACHE_NOTIFY_DELETE_URL = 0x00000002;
enum CACHE_NOTIFY_UPDATE_URL = 0x00000004;
enum CACHE_NOTIFY_DELETE_ALL = 0x00000008;
enum CACHE_NOTIFY_URL_SET_STICKY = 0x00000010;
enum CACHE_NOTIFY_URL_UNSET_STICKY = 0x00000020;
enum CACHE_NOTIFY_SET_ONLINE = 0x00000100;
enum CACHE_NOTIFY_SET_OFFLINE = 0x00000200;
enum CACHE_NOTIFY_FILTER_CHANGED = 0x10000000;
enum APP_CACHE_LOOKUP_NO_MASTER_ONLY = 0x00000001;
enum APP_CACHE_ENTRY_TYPE_MASTER = 0x00000001;
enum APP_CACHE_ENTRY_TYPE_EXPLICIT = 0x00000002;
enum APP_CACHE_ENTRY_TYPE_FALLBACK = 0x00000004;
enum APP_CACHE_ENTRY_TYPE_FOREIGN = 0x00000008;
enum APP_CACHE_ENTRY_TYPE_MANIFEST = 0x00000010;
enum CACHE_CONFIG_CONTENT_QUOTA_FC = 0x00008000;
enum CACHE_CONFIG_TOTAL_CONTENT_QUOTA_FC = 0x00010000;
enum CACHE_CONFIG_APPCONTAINER_CONTENT_QUOTA_FC = 0x00020000;
enum CACHE_CONFIG_APPCONTAINER_TOTAL_CONTENT_QUOTA_FC = 0x00040000;
enum INTERNET_AUTOPROXY_INIT_DEFAULT = 0x00000001;
enum INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC = 0x00000002;
enum INTERNET_AUTOPROXY_INIT_QUERYSTATE = 0x00000004;
enum INTERNET_AUTOPROXY_INIT_ONLYQUERY = 0x00000008;
enum REGSTR_DIAL_AUTOCONNECT = "AutoConnect";
enum REGSTR_LEASH_LEGACY_COOKIES = "LeashLegacyCookies";
enum LOCAL_NAMESPACE_PREFIX = "Local\\";
enum LOCAL_NAMESPACE_PREFIX_W = "Local\\";
enum INTERNET_SUPPRESS_COOKIE_PERSIST = 0x00000003;
enum INTERNET_SUPPRESS_COOKIE_PERSIST_RESET = 0x00000004;
enum HTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 0x0000007b;
enum HTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE = 0x00002710;
enum INTERNET_GLOBAL_CALLBACK_SENDING_HTTP_HEADERS = 0x00000001;
enum INTERNET_GLOBAL_CALLBACK_DETECTING_PROXY = 0x00000002;
alias HTTP_PUSH_WAIT_HANDLE = void*;
alias INTERNET_SCHEME = int;
enum : int
{
    INTERNET_SCHEME_PARTIAL    = 0xfffffffe,
    INTERNET_SCHEME_UNKNOWN    = 0xffffffff,
    INTERNET_SCHEME_DEFAULT    = 0x00000000,
    INTERNET_SCHEME_FTP        = 0x00000001,
    INTERNET_SCHEME_GOPHER     = 0x00000002,
    INTERNET_SCHEME_HTTP       = 0x00000003,
    INTERNET_SCHEME_HTTPS      = 0x00000004,
    INTERNET_SCHEME_FILE       = 0x00000005,
    INTERNET_SCHEME_NEWS       = 0x00000006,
    INTERNET_SCHEME_MAILTO     = 0x00000007,
    INTERNET_SCHEME_SOCKS      = 0x00000008,
    INTERNET_SCHEME_JAVASCRIPT = 0x00000009,
    INTERNET_SCHEME_VBSCRIPT   = 0x0000000a,
    INTERNET_SCHEME_RES        = 0x0000000b,
    INTERNET_SCHEME_FIRST      = 0x00000001,
    INTERNET_SCHEME_LAST       = 0x0000000b,
}

struct INTERNET_ASYNC_RESULT
{
    ulong dwResult;
    uint dwError;
}
struct INTERNET_DIAGNOSTIC_SOCKET_INFO
{
    ulong Socket;
    uint SourcePort;
    uint DestPort;
    uint Flags;
}
struct INTERNET_PROXY_INFO
{
    INTERNET_ACCESS_TYPE dwAccessType;
    byte* lpszProxy;
    byte* lpszProxyBypass;
}
struct INTERNET_PER_CONN_OPTIONA
{
    INTERNET_PER_CONN dwOption;
    union Value
    {
        uint dwValue;
        PSTR pszValue;
        FILETIME ftValue;
    }
}
struct INTERNET_PER_CONN_OPTIONW
{
    INTERNET_PER_CONN dwOption;
    union Value
    {
        uint dwValue;
        PWSTR pszValue;
        FILETIME ftValue;
    }
}
struct INTERNET_PER_CONN_OPTION_LISTA
{
    uint dwSize;
    PSTR pszConnection;
    uint dwOptionCount;
    uint dwOptionError;
    INTERNET_PER_CONN_OPTIONA* pOptions;
}
struct INTERNET_PER_CONN_OPTION_LISTW
{
    uint dwSize;
    PWSTR pszConnection;
    uint dwOptionCount;
    uint dwOptionError;
    INTERNET_PER_CONN_OPTIONW* pOptions;
}
struct INTERNET_VERSION_INFO
{
    uint dwMajorVersion;
    uint dwMinorVersion;
}
struct INTERNET_CONNECTED_INFO
{
    INTERNET_STATE dwConnectedState;
    uint dwFlags;
}
struct URL_COMPONENTSA
{
    uint dwStructSize;
    PSTR lpszScheme;
    uint dwSchemeLength;
    INTERNET_SCHEME nScheme;
    PSTR lpszHostName;
    uint dwHostNameLength;
    ushort nPort;
    PSTR lpszUserName;
    uint dwUserNameLength;
    PSTR lpszPassword;
    uint dwPasswordLength;
    PSTR lpszUrlPath;
    uint dwUrlPathLength;
    PSTR lpszExtraInfo;
    uint dwExtraInfoLength;
}
struct URL_COMPONENTSW
{
    uint dwStructSize;
    PWSTR lpszScheme;
    uint dwSchemeLength;
    INTERNET_SCHEME nScheme;
    PWSTR lpszHostName;
    uint dwHostNameLength;
    ushort nPort;
    PWSTR lpszUserName;
    uint dwUserNameLength;
    PWSTR lpszPassword;
    uint dwPasswordLength;
    PWSTR lpszUrlPath;
    uint dwUrlPathLength;
    PWSTR lpszExtraInfo;
    uint dwExtraInfoLength;
}
struct INTERNET_CERTIFICATE_INFO
{
    FILETIME ftExpiry;
    FILETIME ftStart;
    byte* lpszSubjectInfo;
    byte* lpszIssuerInfo;
    byte* lpszProtocolName;
    byte* lpszSignatureAlgName;
    byte* lpszEncryptionAlgName;
    uint dwKeySize;
}
struct INTERNET_BUFFERSA
{
    uint dwStructSize;
    INTERNET_BUFFERSA* Next;
    const(char)* lpcszHeader;
    uint dwHeadersLength;
    uint dwHeadersTotal;
    void* lpvBuffer;
    uint dwBufferLength;
    uint dwBufferTotal;
    uint dwOffsetLow;
    uint dwOffsetHigh;
}
struct INTERNET_BUFFERSW
{
    uint dwStructSize;
    INTERNET_BUFFERSW* Next;
    const(wchar)* lpcszHeader;
    uint dwHeadersLength;
    uint dwHeadersTotal;
    void* lpvBuffer;
    uint dwBufferLength;
    uint dwBufferTotal;
    uint dwOffsetLow;
    uint dwOffsetHigh;
}
alias LPINTERNET_STATUS_CALLBACK = void function(void*, ulong, uint, void*, uint);
alias InternetCookieState = int;
enum : int
{
    COOKIE_STATE_UNKNOWN   = 0x00000000,
    COOKIE_STATE_ACCEPT    = 0x00000001,
    COOKIE_STATE_PROMPT    = 0x00000002,
    COOKIE_STATE_LEASH     = 0x00000003,
    COOKIE_STATE_DOWNGRADE = 0x00000004,
    COOKIE_STATE_REJECT    = 0x00000005,
    COOKIE_STATE_MAX       = 0x00000005,
}

struct IncomingCookieState
{
    int cSession;
    int cPersistent;
    int cAccepted;
    int cLeashed;
    int cDowngraded;
    int cBlocked;
    const(char)* pszLocation;
}
struct OutgoingCookieState
{
    int cSent;
    int cSuppressed;
    const(char)* pszLocation;
}
struct InternetCookieHistory
{
    BOOL fAccepted;
    BOOL fLeashed;
    BOOL fDowngraded;
    BOOL fRejected;
}
struct CookieDecision
{
    uint dwCookieState;
    BOOL fAllowSession;
}
struct GOPHER_FIND_DATAA
{
    CHAR[129] DisplayString;
    GOPHER_TYPE GopherType;
    uint SizeLow;
    uint SizeHigh;
    FILETIME LastModificationTime;
    CHAR[654] Locator;
}
struct GOPHER_FIND_DATAW
{
    wchar[129] DisplayString;
    GOPHER_TYPE GopherType;
    uint SizeLow;
    uint SizeHigh;
    FILETIME LastModificationTime;
    wchar[654] Locator;
}
struct GOPHER_ADMIN_ATTRIBUTE_TYPE
{
    byte* Comment;
    byte* EmailAddress;
}
struct GOPHER_MOD_DATE_ATTRIBUTE_TYPE
{
    FILETIME DateAndTime;
}
struct GOPHER_TTL_ATTRIBUTE_TYPE
{
    uint Ttl;
}
struct GOPHER_SCORE_ATTRIBUTE_TYPE
{
    int Score;
}
struct GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE
{
    int LowerBound;
    int UpperBound;
}
struct GOPHER_SITE_ATTRIBUTE_TYPE
{
    byte* Site;
}
struct GOPHER_ORGANIZATION_ATTRIBUTE_TYPE
{
    byte* Organization;
}
struct GOPHER_LOCATION_ATTRIBUTE_TYPE
{
    byte* Location;
}
struct GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE
{
    int DegreesNorth;
    int MinutesNorth;
    int SecondsNorth;
    int DegreesEast;
    int MinutesEast;
    int SecondsEast;
}
struct GOPHER_TIMEZONE_ATTRIBUTE_TYPE
{
    int Zone;
}
struct GOPHER_PROVIDER_ATTRIBUTE_TYPE
{
    byte* Provider;
}
struct GOPHER_VERSION_ATTRIBUTE_TYPE
{
    byte* Version;
}
struct GOPHER_ABSTRACT_ATTRIBUTE_TYPE
{
    byte* ShortAbstract;
    byte* AbstractFile;
}
struct GOPHER_VIEW_ATTRIBUTE_TYPE
{
    byte* ContentType;
    byte* Language;
    uint Size;
}
struct GOPHER_VERONICA_ATTRIBUTE_TYPE
{
    BOOL TreeWalk;
}
struct GOPHER_ASK_ATTRIBUTE_TYPE
{
    byte* QuestionType;
    byte* QuestionText;
}
struct GOPHER_UNKNOWN_ATTRIBUTE_TYPE
{
    byte* Text;
}
struct GOPHER_ATTRIBUTE_TYPE
{
    uint CategoryId;
    uint AttributeId;
    union AttributeType
    {
        GOPHER_ADMIN_ATTRIBUTE_TYPE Admin;
        GOPHER_MOD_DATE_ATTRIBUTE_TYPE ModDate;
        GOPHER_TTL_ATTRIBUTE_TYPE Ttl;
        GOPHER_SCORE_ATTRIBUTE_TYPE Score;
        GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE ScoreRange;
        GOPHER_SITE_ATTRIBUTE_TYPE Site;
        GOPHER_ORGANIZATION_ATTRIBUTE_TYPE Organization;
        GOPHER_LOCATION_ATTRIBUTE_TYPE Location;
        GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE GeographicalLocation;
        GOPHER_TIMEZONE_ATTRIBUTE_TYPE TimeZone;
        GOPHER_PROVIDER_ATTRIBUTE_TYPE Provider;
        GOPHER_VERSION_ATTRIBUTE_TYPE Version;
        GOPHER_ABSTRACT_ATTRIBUTE_TYPE Abstract;
        GOPHER_VIEW_ATTRIBUTE_TYPE View;
        GOPHER_VERONICA_ATTRIBUTE_TYPE Veronica;
        GOPHER_ASK_ATTRIBUTE_TYPE Ask;
        GOPHER_UNKNOWN_ATTRIBUTE_TYPE Unknown;
    }
}
alias GOPHER_ATTRIBUTE_ENUMERATOR = BOOL function(GOPHER_ATTRIBUTE_TYPE*, uint);
struct INTERNET_COOKIE2
{
    PWSTR pwszName;
    PWSTR pwszValue;
    PWSTR pwszDomain;
    PWSTR pwszPath;
    uint dwFlags;
    FILETIME ftExpires;
    BOOL fExpiresSet;
}
alias PFN_AUTH_NOTIFY = uint function(ulong, uint, void*);
struct INTERNET_AUTH_NOTIFY_DATA
{
    uint cbStruct;
    uint dwOptions;
    PFN_AUTH_NOTIFY pfnNotify;
    ulong dwContext;
}
struct INTERNET_CACHE_ENTRY_INFOA
{
    uint dwStructSize;
    PSTR lpszSourceUrlName;
    PSTR lpszLocalFileName;
    uint CacheEntryType;
    uint dwUseCount;
    uint dwHitRate;
    uint dwSizeLow;
    uint dwSizeHigh;
    FILETIME LastModifiedTime;
    FILETIME ExpireTime;
    FILETIME LastAccessTime;
    FILETIME LastSyncTime;
    PSTR lpHeaderInfo;
    uint dwHeaderInfoSize;
    PSTR lpszFileExtension;
    union
    {
        uint dwReserved;
        uint dwExemptDelta;
    }
}
struct INTERNET_CACHE_ENTRY_INFOW
{
    uint dwStructSize;
    PWSTR lpszSourceUrlName;
    PWSTR lpszLocalFileName;
    uint CacheEntryType;
    uint dwUseCount;
    uint dwHitRate;
    uint dwSizeLow;
    uint dwSizeHigh;
    FILETIME LastModifiedTime;
    FILETIME ExpireTime;
    FILETIME LastAccessTime;
    FILETIME LastSyncTime;
    PWSTR lpHeaderInfo;
    uint dwHeaderInfoSize;
    PWSTR lpszFileExtension;
    union
    {
        uint dwReserved;
        uint dwExemptDelta;
    }
}
struct INTERNET_CACHE_TIMESTAMPS
{
    FILETIME ftExpires;
    FILETIME ftLastModified;
}
struct INTERNET_CACHE_GROUP_INFOA
{
    uint dwGroupSize;
    uint dwGroupFlags;
    uint dwGroupType;
    uint dwDiskUsage;
    uint dwDiskQuota;
    uint[4] dwOwnerStorage;
    CHAR[120] szGroupName;
}
struct INTERNET_CACHE_GROUP_INFOW
{
    uint dwGroupSize;
    uint dwGroupFlags;
    uint dwGroupType;
    uint dwDiskUsage;
    uint dwDiskQuota;
    uint[4] dwOwnerStorage;
    wchar[120] szGroupName;
}
struct AutoProxyHelperVtbl
{
    long IsResolvable;
    long GetIPAddress;
    long ResolveHostName;
    long IsInNet;
    long IsResolvableEx;
    long GetIPAddressEx;
    long ResolveHostNameEx;
    long IsInNetEx;
    long SortIpList;
}
struct AUTO_PROXY_SCRIPT_BUFFER
{
    uint dwStructSize;
    PSTR lpszScriptBuffer;
    uint dwScriptBufferSize;
}
struct AutoProxyHelperFunctions
{
    const(AutoProxyHelperVtbl)* lpVtbl;
}
alias pfnInternetInitializeAutoProxyDll = BOOL function(uint, PSTR, PSTR, AutoProxyHelperFunctions*, AUTO_PROXY_SCRIPT_BUFFER*);
alias pfnInternetDeInitializeAutoProxyDll = BOOL function(PSTR, uint);
alias pfnInternetGetProxyInfo = BOOL function(const(char)*, uint, PSTR, uint, PSTR*, uint*);
alias WPAD_CACHE_DELETE = int;
enum : int
{
    WPAD_CACHE_DELETE_CURRENT = 0x00000000,
    WPAD_CACHE_DELETE_ALL     = 0x00000001,
}

alias PFN_DIAL_HANDLER = uint function(HWND, const(char)*, uint, uint*);
enum IID_IDialEventSink = GUID(0x2d86f4ff, 0x6e2d, 0x4488, [0xb2, 0xe9, 0x69, 0x34, 0xaf, 0xd4, 0x1b, 0xea]);
interface IDialEventSink : IUnknown
{
    HRESULT OnEvent(uint, uint);
}
enum IID_IDialEngine = GUID(0x39fd782b, 0x7905, 0x40d5, [0x91, 0x48, 0x3c, 0x9b, 0x19, 0x4, 0x23, 0xd5]);
interface IDialEngine : IUnknown
{
    HRESULT Initialize(const(wchar)*, IDialEventSink);
    HRESULT GetProperty(const(wchar)*, PWSTR, uint);
    HRESULT SetProperty(const(wchar)*, const(wchar)*);
    HRESULT Dial();
    HRESULT HangUp();
    HRESULT GetConnectedState(uint*);
    HRESULT GetConnectHandle(ulong*);
}
enum IID_IDialBranding = GUID(0x8aecafa9, 0x4306, 0x43cc, [0x8c, 0x5a, 0x76, 0x5f, 0x29, 0x79, 0xcc, 0x16]);
interface IDialBranding : IUnknown
{
    HRESULT Initialize(const(wchar)*);
    HRESULT GetBitmap(uint, HBITMAP*);
}
struct INTERNET_PREFETCH_STATUS
{
    uint dwStatus;
    uint dwSize;
}
struct INTERNET_SECURITY_INFO
{
    uint dwSize;
    const(CERT_CONTEXT)* pCertificate;
    CERT_CHAIN_CONTEXT* pcCertChain;
    SecPkgContext_ConnectionInfo connectionInfo;
    SecPkgContext_CipherInfo cipherInfo;
    CERT_CHAIN_CONTEXT* pcUnverifiedCertChain;
    SecPkgContext_Bindings channelBindingToken;
}
struct INTERNET_SECURITY_CONNECTION_INFO
{
    uint dwSize;
    BOOL fSecure;
    SecPkgContext_ConnectionInfo connectionInfo;
    SecPkgContext_CipherInfo cipherInfo;
}
alias FORTCMD = int;
enum : int
{
    FORTCMD_LOGON           = 0x00000001,
    FORTCMD_LOGOFF          = 0x00000002,
    FORTCMD_CHG_PERSONALITY = 0x00000003,
}

alias FORTSTAT = int;
enum : int
{
    FORTSTAT_INSTALLED = 0x00000001,
    FORTSTAT_LOGGEDON  = 0x00000002,
}

struct INTERNET_DOWNLOAD_MODE_HANDLE
{
    const(wchar)* pcwszFileName;
    HANDLE* phFile;
}
alias REQUEST_TIMES = int;
enum : int
{
    NameResolutionStart          = 0x00000000,
    NameResolutionEnd            = 0x00000001,
    ConnectionEstablishmentStart = 0x00000002,
    ConnectionEstablishmentEnd   = 0x00000003,
    TLSHandshakeStart            = 0x00000004,
    TLSHandshakeEnd              = 0x00000005,
    HttpRequestTimeMax           = 0x00000020,
}

struct HTTP_REQUEST_TIMES
{
    uint cTimes;
    ulong[32] rgTimes;
}
struct INTERNET_SERVER_CONNECTION_STATE
{
    const(wchar)* lpcwszHostName;
    BOOL fProxy;
    uint dwCounter;
    uint dwConnectionLimit;
    uint dwAvailableCreates;
    uint dwAvailableKeepAlives;
    uint dwActiveConnections;
    uint dwWaiters;
}
struct INTERNET_END_BROWSER_SESSION_DATA
{
    void* lpBuffer;
    uint dwBufferLength;
}
struct INTERNET_CALLBACK_COOKIE
{
    const(wchar)* pcwszName;
    const(wchar)* pcwszValue;
    const(wchar)* pcwszDomain;
    const(wchar)* pcwszPath;
    FILETIME ftExpires;
    uint dwFlags;
}
struct INTERNET_CREDENTIALS
{
    const(wchar)* lpcwszHostName;
    uint dwPort;
    uint dwScheme;
    const(wchar)* lpcwszUrl;
    const(wchar)* lpcwszRealm;
    BOOL fAuthIdentity;
    union
    {
        struct
        {
            const(wchar)* lpcwszUserName;
            const(wchar)* lpcwszPassword;
        }
        void* pAuthIdentityOpaque;
    }
}
struct HTTP_PUSH_TRANSPORT_SETTING
{
    GUID TransportSettingId;
    GUID BrokerEventId;
}
struct HTTP_PUSH_NOTIFICATION_STATUS
{
    BOOL ChannelStatusValid;
    uint ChannelStatus;
}
alias HTTP_PUSH_WAIT_TYPE = int;
enum : int
{
    HttpPushWaitEnableComplete  = 0x00000000,
    HttpPushWaitReceiveComplete = 0x00000001,
    HttpPushWaitSendComplete    = 0x00000002,
}

struct INTERNET_COOKIE
{
    uint cbSize;
    PSTR pszName;
    PSTR pszData;
    PSTR pszDomain;
    PSTR pszPath;
    FILETIME* pftExpires;
    uint dwFlags;
    PSTR pszUrl;
    PSTR pszP3PPolicy;
}
struct COOKIE_DLG_INFO
{
    PWSTR pszServer;
    INTERNET_COOKIE* pic;
    uint dwStopWarning;
    int cx;
    int cy;
    PWSTR pszHeader;
    uint dwOperation;
}
struct INTERNET_CACHE_CONFIG_PATH_ENTRYA
{
    CHAR[260] CachePath;
    uint dwCacheSize;
}
struct INTERNET_CACHE_CONFIG_PATH_ENTRYW
{
    wchar[260] CachePath;
    uint dwCacheSize;
}
struct INTERNET_CACHE_CONFIG_INFOA
{
    uint dwStructSize;
    uint dwContainer;
    uint dwQuota;
    uint dwReserved4;
    BOOL fPerUser;
    uint dwSyncMode;
    uint dwNumCachePaths;
    union
    {
        struct
        {
            CHAR[260] CachePath;
            uint dwCacheSize;
        }
        INTERNET_CACHE_CONFIG_PATH_ENTRYA[1] CachePaths;
    }
    uint dwNormalUsage;
    uint dwExemptUsage;
}
struct INTERNET_CACHE_CONFIG_INFOW
{
    uint dwStructSize;
    uint dwContainer;
    uint dwQuota;
    uint dwReserved4;
    BOOL fPerUser;
    uint dwSyncMode;
    uint dwNumCachePaths;
    union
    {
        struct
        {
            wchar[260] CachePath;
            uint dwCacheSize;
        }
        INTERNET_CACHE_CONFIG_PATH_ENTRYW[1] CachePaths;
    }
    uint dwNormalUsage;
    uint dwExemptUsage;
}
struct INTERNET_CACHE_CONTAINER_INFOA
{
    uint dwCacheVersion;
    PSTR lpszName;
    PSTR lpszCachePrefix;
    PSTR lpszVolumeLabel;
    PSTR lpszVolumeTitle;
}
struct INTERNET_CACHE_CONTAINER_INFOW
{
    uint dwCacheVersion;
    PWSTR lpszName;
    PWSTR lpszCachePrefix;
    PWSTR lpszVolumeLabel;
    PWSTR lpszVolumeTitle;
}
alias WININET_SYNC_MODE = int;
enum : int
{
    WININET_SYNC_MODE_NEVER            = 0x00000000,
    WININET_SYNC_MODE_ON_EXPIRY        = 0x00000001,
    WININET_SYNC_MODE_ONCE_PER_SESSION = 0x00000002,
    WININET_SYNC_MODE_ALWAYS           = 0x00000003,
    WININET_SYNC_MODE_AUTOMATIC        = 0x00000004,
    WININET_SYNC_MODE_DEFAULT          = 0x00000004,
}

alias APP_CACHE_STATE = int;
enum : int
{
    AppCacheStateNoUpdateNeeded         = 0x00000000,
    AppCacheStateUpdateNeeded           = 0x00000001,
    AppCacheStateUpdateNeededNew        = 0x00000002,
    AppCacheStateUpdateNeededMasterOnly = 0x00000003,
}

struct APP_CACHE_DOWNLOAD_ENTRY
{
    PWSTR pwszUrl;
    uint dwEntryType;
}
struct APP_CACHE_DOWNLOAD_LIST
{
    uint dwEntryCount;
    APP_CACHE_DOWNLOAD_ENTRY* pEntries;
}
alias APP_CACHE_FINALIZE_STATE = int;
enum : int
{
    AppCacheFinalizeStateIncomplete     = 0x00000000,
    AppCacheFinalizeStateManifestChange = 0x00000001,
    AppCacheFinalizeStateComplete       = 0x00000002,
}

struct APP_CACHE_GROUP_INFO
{
    PWSTR pwszManifestUrl;
    FILETIME ftLastAccessTime;
    ulong ullSize;
}
struct APP_CACHE_GROUP_LIST
{
    uint dwAppCacheGroupCount;
    APP_CACHE_GROUP_INFO* pAppCacheGroups;
}
struct URLCACHE_ENTRY_INFO
{
    PWSTR pwszSourceUrlName;
    PWSTR pwszLocalFileName;
    uint dwCacheEntryType;
    uint dwUseCount;
    uint dwHitRate;
    uint dwSizeLow;
    uint dwSizeHigh;
    FILETIME ftLastModifiedTime;
    FILETIME ftExpireTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastSyncTime;
    ubyte* pbHeaderInfo;
    uint cbHeaderInfoSize;
    ubyte* pbExtraData;
    uint cbExtraDataSize;
}
alias URL_CACHE_LIMIT_TYPE = int;
enum : int
{
    UrlCacheLimitTypeIE                = 0x00000000,
    UrlCacheLimitTypeIETotal           = 0x00000001,
    UrlCacheLimitTypeAppContainer      = 0x00000002,
    UrlCacheLimitTypeAppContainerTotal = 0x00000003,
    UrlCacheLimitTypeNum               = 0x00000004,
}

struct WININET_PROXY_INFO
{
    BOOL fProxy;
    BOOL fBypass;
    INTERNET_SCHEME ProxyScheme;
    PWSTR pwszProxy;
    ushort ProxyPort;
}
struct WININET_PROXY_INFO_LIST
{
    uint dwProxyInfoCount;
    WININET_PROXY_INFO* pProxyInfo;
}
alias CACHE_OPERATOR = BOOL function(INTERNET_CACHE_ENTRY_INFOA*, uint*, void*);
alias HTTP_WEB_SOCKET_OPERATION = int;
enum : int
{
    HTTP_WEB_SOCKET_SEND_OPERATION     = 0x00000000,
    HTTP_WEB_SOCKET_RECEIVE_OPERATION  = 0x00000001,
    HTTP_WEB_SOCKET_CLOSE_OPERATION    = 0x00000002,
    HTTP_WEB_SOCKET_SHUTDOWN_OPERATION = 0x00000003,
}

alias HTTP_WEB_SOCKET_BUFFER_TYPE = int;
enum : int
{
    HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE  = 0x00000000,
    HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE = 0x00000001,
    HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE    = 0x00000002,
    HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE   = 0x00000003,
    HTTP_WEB_SOCKET_CLOSE_TYPE           = 0x00000004,
    HTTP_WEB_SOCKET_PING_TYPE            = 0x00000005,
}

alias HTTP_WEB_SOCKET_CLOSE_STATUS = int;
enum : int
{
    HTTP_WEB_SOCKET_SUCCESS_CLOSE_STATUS                = 0x000003e8,
    HTTP_WEB_SOCKET_ENDPOINT_TERMINATED_CLOSE_STATUS    = 0x000003e9,
    HTTP_WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS         = 0x000003ea,
    HTTP_WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS      = 0x000003eb,
    HTTP_WEB_SOCKET_EMPTY_CLOSE_STATUS                  = 0x000003ed,
    HTTP_WEB_SOCKET_ABORTED_CLOSE_STATUS                = 0x000003ee,
    HTTP_WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS        = 0x000003ef,
    HTTP_WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS       = 0x000003f0,
    HTTP_WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS        = 0x000003f1,
    HTTP_WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 0x000003f2,
    HTTP_WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS           = 0x000003f3,
    HTTP_WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 0x000003f7,
}

struct HTTP_WEB_SOCKET_ASYNC_RESULT
{
    INTERNET_ASYNC_RESULT AsyncResult;
    HTTP_WEB_SOCKET_OPERATION Operation;
    HTTP_WEB_SOCKET_BUFFER_TYPE BufferType;
    uint dwBytesTransferred;
}
alias HTTP_POLICY_EXTENSION_TYPE = int;
enum : int
{
    POLICY_EXTENSION_TYPE_NONE    = 0x00000000,
    POLICY_EXTENSION_TYPE_WINHTTP = 0x00000001,
    POLICY_EXTENSION_TYPE_WININET = 0x00000002,
}

alias HTTP_POLICY_EXTENSION_VERSION = int;
enum : int
{
    POLICY_EXTENSION_VERSION1 = 0x00000001,
}

alias HTTP_POLICY_EXTENSION_INIT = uint function(HTTP_POLICY_EXTENSION_VERSION, HTTP_POLICY_EXTENSION_TYPE, void*, uint);
alias HTTP_POLICY_EXTENSION_SHUTDOWN = uint function(HTTP_POLICY_EXTENSION_TYPE);
struct ProofOfPossessionCookieInfo
{
    PWSTR name;
    PWSTR data;
    uint flags;
    PWSTR p3pHeader;
}
enum IID_IProofOfPossessionCookieInfoManager = GUID(0xcdaece56, 0x4edf, 0x43df, [0xb1, 0x13, 0x88, 0xe4, 0x55, 0x6f, 0xa1, 0xbb]);
interface IProofOfPossessionCookieInfoManager : IUnknown
{
    HRESULT GetCookieInfoForUri(const(wchar)*, uint*, ProofOfPossessionCookieInfo**);
}
enum IID_IProofOfPossessionCookieInfoManager2 = GUID(0x15e41407, 0xb42f, 0x4ae7, [0x99, 0x66, 0x34, 0xa0, 0x87, 0xb2, 0xd7, 0x13]);
interface IProofOfPossessionCookieInfoManager2 : IUnknown
{
    HRESULT GetCookieInfoWithUriForAccount(IInspectable, const(wchar)*, uint*, ProofOfPossessionCookieInfo**);
}
enum CLSID_ProofOfPossessionCookieInfoManager = GUID(0xa9927f85, 0xa304, 0x4390, [0x8b, 0x23, 0xa7, 0x5f, 0x1c, 0x66, 0x86, 0x0]);
struct ProofOfPossessionCookieInfoManager
{
}
