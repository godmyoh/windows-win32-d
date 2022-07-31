module windows.win32.security.tpm;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum TPMVSC_DEFAULT_ADMIN_ALGORITHM_ID = 0x00000082;
enum CLSID_TpmVirtualSmartCardManager = GUID(0x16a18e86, 0x7f6e, 0x4c20, [0xad, 0x89, 0x4f, 0xfc, 0xd, 0xb7, 0xa9, 0x6a]);
struct TpmVirtualSmartCardManager
{
}
enum CLSID_RemoteTpmVirtualSmartCardManager = GUID(0x152ea2a8, 0x70dc, 0x4c59, [0x8b, 0x2a, 0x32, 0xaa, 0x3c, 0xa0, 0xdc, 0xac]);
struct RemoteTpmVirtualSmartCardManager
{
}
alias TPMVSC_ATTESTATION_TYPE = int;
enum : int
{
    TPMVSC_ATTESTATION_NONE                = 0x00000000,
    TPMVSC_ATTESTATION_AIK_ONLY            = 0x00000001,
    TPMVSC_ATTESTATION_AIK_AND_CERTIFICATE = 0x00000002,
}

alias TPMVSCMGR_STATUS = int;
enum : int
{
    TPMVSCMGR_STATUS_VTPMSMARTCARD_INITIALIZING  = 0x00000000,
    TPMVSCMGR_STATUS_VTPMSMARTCARD_CREATING      = 0x00000001,
    TPMVSCMGR_STATUS_VTPMSMARTCARD_DESTROYING    = 0x00000002,
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_INITIALIZING = 0x00000003,
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_CREATING     = 0x00000004,
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_DESTROYING   = 0x00000005,
    TPMVSCMGR_STATUS_VREADER_INITIALIZING        = 0x00000006,
    TPMVSCMGR_STATUS_VREADER_CREATING            = 0x00000007,
    TPMVSCMGR_STATUS_VREADER_DESTROYING          = 0x00000008,
    TPMVSCMGR_STATUS_GENERATE_WAITING            = 0x00000009,
    TPMVSCMGR_STATUS_GENERATE_AUTHENTICATING     = 0x0000000a,
    TPMVSCMGR_STATUS_GENERATE_RUNNING            = 0x0000000b,
    TPMVSCMGR_STATUS_CARD_CREATED                = 0x0000000c,
    TPMVSCMGR_STATUS_CARD_DESTROYED              = 0x0000000d,
}

alias TPMVSCMGR_ERROR = int;
enum : int
{
    TPMVSCMGR_ERROR_IMPERSONATION                 = 0x00000000,
    TPMVSCMGR_ERROR_PIN_COMPLEXITY                = 0x00000001,
    TPMVSCMGR_ERROR_READER_COUNT_LIMIT            = 0x00000002,
    TPMVSCMGR_ERROR_TERMINAL_SERVICES_SESSION     = 0x00000003,
    TPMVSCMGR_ERROR_VTPMSMARTCARD_INITIALIZE      = 0x00000004,
    TPMVSCMGR_ERROR_VTPMSMARTCARD_CREATE          = 0x00000005,
    TPMVSCMGR_ERROR_VTPMSMARTCARD_DESTROY         = 0x00000006,
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_INITIALIZE     = 0x00000007,
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_CREATE         = 0x00000008,
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_DESTROY        = 0x00000009,
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_WRITE_PROPERTY = 0x0000000a,
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_READ_PROPERTY  = 0x0000000b,
    TPMVSCMGR_ERROR_VREADER_INITIALIZE            = 0x0000000c,
    TPMVSCMGR_ERROR_VREADER_CREATE                = 0x0000000d,
    TPMVSCMGR_ERROR_VREADER_DESTROY               = 0x0000000e,
    TPMVSCMGR_ERROR_GENERATE_LOCATE_READER        = 0x0000000f,
    TPMVSCMGR_ERROR_GENERATE_FILESYSTEM           = 0x00000010,
    TPMVSCMGR_ERROR_CARD_CREATE                   = 0x00000011,
    TPMVSCMGR_ERROR_CARD_DESTROY                  = 0x00000012,
}

enum IID_ITpmVirtualSmartCardManagerStatusCallback = GUID(0x1a1bb35f, 0xabb8, 0x451c, [0xa1, 0xae, 0x33, 0xd9, 0x8f, 0x1b, 0xef, 0x4a]);
interface ITpmVirtualSmartCardManagerStatusCallback : IUnknown
{
    HRESULT ReportProgress(TPMVSCMGR_STATUS);
    HRESULT ReportError(TPMVSCMGR_ERROR);
}
enum IID_ITpmVirtualSmartCardManager = GUID(0x112b1dff, 0xd9dc, 0x41f7, [0x86, 0x9f, 0xd6, 0x7f, 0xee, 0x7c, 0xb5, 0x91]);
interface ITpmVirtualSmartCardManager : IUnknown
{
    HRESULT CreateVirtualSmartCard(const(wchar)*, ubyte, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, BOOL, ITpmVirtualSmartCardManagerStatusCallback, PWSTR*, BOOL*);
    HRESULT DestroyVirtualSmartCard(const(wchar)*, ITpmVirtualSmartCardManagerStatusCallback, BOOL*);
}
enum IID_ITpmVirtualSmartCardManager2 = GUID(0xfdf8a2b9, 0x2de, 0x47f4, [0xbc, 0x26, 0xaa, 0x85, 0xab, 0x5e, 0x52, 0x67]);
interface ITpmVirtualSmartCardManager2 : ITpmVirtualSmartCardManager
{
    HRESULT CreateVirtualSmartCardWithPinPolicy(const(wchar)*, ubyte, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, BOOL, ITpmVirtualSmartCardManagerStatusCallback, PWSTR*, BOOL*);
}
enum IID_ITpmVirtualSmartCardManager3 = GUID(0x3c745a97, 0xf375, 0x4150, [0xbe, 0x17, 0x59, 0x50, 0xf6, 0x94, 0xc6, 0x99]);
interface ITpmVirtualSmartCardManager3 : ITpmVirtualSmartCardManager2
{
    HRESULT CreateVirtualSmartCardWithAttestation(const(wchar)*, ubyte, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, const(ubyte)*, uint, TPMVSC_ATTESTATION_TYPE, BOOL, ITpmVirtualSmartCardManagerStatusCallback, PWSTR*);
}
