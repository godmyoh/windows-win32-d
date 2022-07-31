module windows.win32.system.serverbackup;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOLEAN, HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum WSB_MAX_OB_STATUS_VALUE_TYPE_PAIR = 0x00000005;
enum WSB_MAX_OB_STATUS_ENTRY = 0x00000005;
enum WSBAPP_ASYNC_IN_PROGRESS = 0x007a0004;
enum IID_IWsbApplicationBackupSupport = GUID(0x1eff3510, 0x4a27, 0x46ad, [0xb9, 0xe0, 0x8, 0x33, 0x2f, 0xf, 0x4f, 0x6d]);
interface IWsbApplicationBackupSupport : IUnknown
{
    HRESULT CheckConsistency(PWSTR, PWSTR, PWSTR, uint, PWSTR*, PWSTR*, IWsbApplicationAsync*);
}
enum IID_IWsbApplicationRestoreSupport = GUID(0x8d3bdb38, 0x4ee8, 0x4718, [0x85, 0xf9, 0xc7, 0xdb, 0xc4, 0xab, 0x77, 0xaa]);
interface IWsbApplicationRestoreSupport : IUnknown
{
    HRESULT PreRestore(PWSTR, PWSTR, PWSTR, BOOLEAN);
    HRESULT PostRestore(PWSTR, PWSTR, PWSTR, BOOLEAN);
    HRESULT OrderComponents(uint, PWSTR*, PWSTR*, PWSTR**, PWSTR**);
    HRESULT IsRollForwardSupported(ubyte*);
}
enum IID_IWsbApplicationAsync = GUID(0x843f6f7, 0x895c, 0x44a6, [0xb0, 0xc2, 0x5, 0xa5, 0x2, 0x2a, 0xa3, 0xa1]);
interface IWsbApplicationAsync : IUnknown
{
    HRESULT QueryStatus(HRESULT*);
    HRESULT Abort();
}
alias WSB_OB_STATUS_ENTRY_PAIR_TYPE = int;
enum : int
{
    WSB_OB_ET_UNDEFINED = 0x00000000,
    WSB_OB_ET_STRING    = 0x00000001,
    WSB_OB_ET_NUMBER    = 0x00000002,
    WSB_OB_ET_DATETIME  = 0x00000003,
    WSB_OB_ET_TIME      = 0x00000004,
    WSB_OB_ET_SIZE      = 0x00000005,
    WSB_OB_ET_MAX       = 0x00000006,
}

struct WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR
{
    PWSTR m_wszObStatusEntryPairValue;
    WSB_OB_STATUS_ENTRY_PAIR_TYPE m_ObStatusEntryPairType;
}
struct WSB_OB_STATUS_ENTRY
{
    uint m_dwIcon;
    uint m_dwStatusEntryName;
    uint m_dwStatusEntryValue;
    uint m_cValueTypePair;
    WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR* m_rgValueTypePair;
}
struct WSB_OB_STATUS_INFO
{
    GUID m_guidSnapinId;
    uint m_cStatusEntry;
    WSB_OB_STATUS_ENTRY* m_rgStatusEntry;
}
struct WSB_OB_REGISTRATION_INFO
{
    PWSTR m_wszResourceDLL;
    GUID m_guidSnapinId;
    uint m_dwProviderName;
    uint m_dwProviderIcon;
    BOOLEAN m_bSupportsRemoting;
}
