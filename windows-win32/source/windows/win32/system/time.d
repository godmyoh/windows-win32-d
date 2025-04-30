module windows.win32.system.time;

import windows.win32.foundation : BOOL, BOOLEAN, FILETIME, SYSTEMTIME;

version (Windows):
extern (Windows):

BOOL SystemTimeToTzSpecificLocalTime(const(TIME_ZONE_INFORMATION)* lpTimeZoneInformation, const(SYSTEMTIME)* lpUniversalTime, SYSTEMTIME* lpLocalTime);
BOOL TzSpecificLocalTimeToSystemTime(const(TIME_ZONE_INFORMATION)* lpTimeZoneInformation, const(SYSTEMTIME)* lpLocalTime, SYSTEMTIME* lpUniversalTime);
BOOL FileTimeToSystemTime(const(FILETIME)* lpFileTime, SYSTEMTIME* lpSystemTime);
BOOL SystemTimeToFileTime(const(SYSTEMTIME)* lpSystemTime, FILETIME* lpFileTime);
uint GetTimeZoneInformation(TIME_ZONE_INFORMATION* lpTimeZoneInformation);
BOOL SetTimeZoneInformation(const(TIME_ZONE_INFORMATION)* lpTimeZoneInformation);
BOOL SetDynamicTimeZoneInformation(const(DYNAMIC_TIME_ZONE_INFORMATION)* lpTimeZoneInformation);
uint GetDynamicTimeZoneInformation(DYNAMIC_TIME_ZONE_INFORMATION* pTimeZoneInformation);
BOOL GetTimeZoneInformationForYear(ushort wYear, DYNAMIC_TIME_ZONE_INFORMATION* pdtzi, TIME_ZONE_INFORMATION* ptzi);
uint EnumDynamicTimeZoneInformation(const(uint) dwIndex, DYNAMIC_TIME_ZONE_INFORMATION* lpTimeZoneInformation);
uint GetDynamicTimeZoneInformationEffectiveYears(const(DYNAMIC_TIME_ZONE_INFORMATION)* lpTimeZoneInformation, uint* FirstYear, uint* LastYear);
BOOL SystemTimeToTzSpecificLocalTimeEx(const(DYNAMIC_TIME_ZONE_INFORMATION)* lpTimeZoneInformation, const(SYSTEMTIME)* lpUniversalTime, SYSTEMTIME* lpLocalTime);
BOOL TzSpecificLocalTimeToSystemTimeEx(const(DYNAMIC_TIME_ZONE_INFORMATION)* lpTimeZoneInformation, const(SYSTEMTIME)* lpLocalTime, SYSTEMTIME* lpUniversalTime);
BOOL LocalFileTimeToLocalSystemTime(const(TIME_ZONE_INFORMATION)* timeZoneInformation, const(FILETIME)* localFileTime, SYSTEMTIME* localSystemTime);
BOOL LocalSystemTimeToLocalFileTime(const(TIME_ZONE_INFORMATION)* timeZoneInformation, const(SYSTEMTIME)* localSystemTime, FILETIME* localFileTime);
enum wszW32TimeRegKeyTimeProviders = "System\\CurrentControlSet\\Services\\W32Time\\TimeProviders";
enum wszW32TimeRegKeyPolicyTimeProviders = "Software\\Policies\\Microsoft\\W32Time\\TimeProviders";
enum wszW32TimeRegValueEnabled = "Enabled";
enum wszW32TimeRegValueDllName = "DllName";
enum wszW32TimeRegValueInputProvider = "InputProvider";
enum wszW32TimeRegValueMetaDataProvider = "MetaDataProvider";
enum TSF_Hardware = 0x00000001;
enum TSF_Authenticated = 0x00000002;
enum TSF_IPv6 = 0x00000004;
enum TSF_SignatureAuthenticated = 0x00000008;
enum TIME_ZONE_ID_INVALID = 0xffffffff;
struct TIME_ZONE_INFORMATION
{
    int Bias;
    wchar[32] StandardName;
    SYSTEMTIME StandardDate;
    int StandardBias;
    wchar[32] DaylightName;
    SYSTEMTIME DaylightDate;
    int DaylightBias;
}
struct DYNAMIC_TIME_ZONE_INFORMATION
{
    int Bias;
    wchar[32] StandardName;
    SYSTEMTIME StandardDate;
    int StandardBias;
    wchar[32] DaylightName;
    SYSTEMTIME DaylightDate;
    int DaylightBias;
    wchar[128] TimeZoneKeyName;
    BOOLEAN DynamicDaylightTimeDisabled;
}
