module windows.win32.system.time;

import windows.win32.foundation : BOOL, BOOLEAN, FILETIME, SYSTEMTIME;

version (Windows):
extern (Windows):

BOOL SystemTimeToTzSpecificLocalTime(const(TIME_ZONE_INFORMATION)*, const(SYSTEMTIME)*, SYSTEMTIME*);
BOOL TzSpecificLocalTimeToSystemTime(const(TIME_ZONE_INFORMATION)*, const(SYSTEMTIME)*, SYSTEMTIME*);
BOOL FileTimeToSystemTime(const(FILETIME)*, SYSTEMTIME*);
BOOL SystemTimeToFileTime(const(SYSTEMTIME)*, FILETIME*);
uint GetTimeZoneInformation(TIME_ZONE_INFORMATION*);
BOOL SetTimeZoneInformation(const(TIME_ZONE_INFORMATION)*);
BOOL SetDynamicTimeZoneInformation(const(DYNAMIC_TIME_ZONE_INFORMATION)*);
uint GetDynamicTimeZoneInformation(DYNAMIC_TIME_ZONE_INFORMATION*);
BOOL GetTimeZoneInformationForYear(ushort, DYNAMIC_TIME_ZONE_INFORMATION*, TIME_ZONE_INFORMATION*);
uint EnumDynamicTimeZoneInformation(const(uint), DYNAMIC_TIME_ZONE_INFORMATION*);
uint GetDynamicTimeZoneInformationEffectiveYears(const(DYNAMIC_TIME_ZONE_INFORMATION)*, uint*, uint*);
BOOL SystemTimeToTzSpecificLocalTimeEx(const(DYNAMIC_TIME_ZONE_INFORMATION)*, const(SYSTEMTIME)*, SYSTEMTIME*);
BOOL TzSpecificLocalTimeToSystemTimeEx(const(DYNAMIC_TIME_ZONE_INFORMATION)*, const(SYSTEMTIME)*, SYSTEMTIME*);
BOOL LocalFileTimeToLocalSystemTime(const(TIME_ZONE_INFORMATION)*, const(FILETIME)*, SYSTEMTIME*);
BOOL LocalSystemTimeToLocalFileTime(const(TIME_ZONE_INFORMATION)*, const(SYSTEMTIME)*, FILETIME*);
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
