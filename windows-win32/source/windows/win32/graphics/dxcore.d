module windows.win32.graphics.dxcore;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, LUID;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT DXCoreCreateAdapterFactory(const(GUID)*, void**);
enum _FACDXCORE = 0x00000880;
enum DXCORE_ADAPTER_ATTRIBUTE_D3D11_GRAPHICS = GUID(0x8c47866b, 0x7583, 0x450d, [0xf0, 0xf0, 0x6b, 0xad, 0xa8, 0x95, 0xaf, 0x4b]);
enum DXCORE_ADAPTER_ATTRIBUTE_D3D12_GRAPHICS = GUID(0xc9ece4d, 0x2f6e, 0x4f01, [0x8c, 0x96, 0xe8, 0x9e, 0x33, 0x1b, 0x47, 0xb1]);
enum DXCORE_ADAPTER_ATTRIBUTE_D3D12_CORE_COMPUTE = GUID(0x248e2800, 0xa793, 0x4724, [0xab, 0xaa, 0x23, 0xa6, 0xde, 0x1b, 0xe0, 0x90]);
alias DXCoreAdapterProperty = uint;
enum : uint
{
    InstanceLuid                  = 0x00000000,
    DriverVersion                 = 0x00000001,
    DriverDescription             = 0x00000002,
    HardwareID                    = 0x00000003,
    KmdModelVersion               = 0x00000004,
    ComputePreemptionGranularity  = 0x00000005,
    GraphicsPreemptionGranularity = 0x00000006,
    DedicatedAdapterMemory        = 0x00000007,
    DedicatedSystemMemory         = 0x00000008,
    SharedSystemMemory            = 0x00000009,
    AcgCompatible                 = 0x0000000a,
    IsHardware                    = 0x0000000b,
    IsIntegrated                  = 0x0000000c,
    IsDetachable                  = 0x0000000d,
    HardwareIDParts               = 0x0000000e,
}

alias DXCoreAdapterState = uint;
enum : uint
{
    IsDriverUpdateInProgress = 0x00000000,
    AdapterMemoryBudget      = 0x00000001,
}

alias DXCoreSegmentGroup = uint;
enum : uint
{
    Local    = 0x00000000,
    NonLocal = 0x00000001,
}

alias DXCoreNotificationType = uint;
enum : uint
{
    AdapterListStale                         = 0x00000000,
    AdapterNoLongerValid                     = 0x00000001,
    AdapterBudgetChange                      = 0x00000002,
    AdapterHardwareContentProtectionTeardown = 0x00000003,
}

alias DXCoreAdapterPreference = uint;
enum : uint
{
    Hardware        = 0x00000000,
    MinimumPower    = 0x00000001,
    HighPerformance = 0x00000002,
}

struct DXCoreHardwareID
{
    uint vendorID;
    uint deviceID;
    uint subSysID;
    uint revision;
}
struct DXCoreHardwareIDParts
{
    uint vendorID;
    uint deviceID;
    uint subSystemID;
    uint subVendorID;
    uint revisionID;
}
struct DXCoreAdapterMemoryBudgetNodeSegmentGroup
{
    uint nodeIndex;
    DXCoreSegmentGroup segmentGroup;
}
struct DXCoreAdapterMemoryBudget
{
    ulong budget;
    ulong currentUsage;
    ulong availableForReservation;
    ulong currentReservation;
}
alias PFN_DXCORE_NOTIFICATION_CALLBACK = void function(DXCoreNotificationType, IUnknown, void*);
enum IID_IDXCoreAdapter = GUID(0xf0db4c7f, 0xfe5a, 0x42a2, [0xbd, 0x62, 0xf2, 0xa6, 0xcf, 0x6f, 0xc8, 0x3e]);
interface IDXCoreAdapter : IUnknown
{
    bool IsValid();
    bool IsAttributeSupported(const(GUID)*);
    bool IsPropertySupported(DXCoreAdapterProperty);
    HRESULT GetProperty(DXCoreAdapterProperty, ulong, void*);
    HRESULT GetPropertySize(DXCoreAdapterProperty, ulong*);
    bool IsQueryStateSupported(DXCoreAdapterState);
    HRESULT QueryState(DXCoreAdapterState, ulong, const(void)*, ulong, void*);
    bool IsSetStateSupported(DXCoreAdapterState);
    HRESULT SetState(DXCoreAdapterState, ulong, const(void)*, ulong, const(void)*);
    HRESULT GetFactory(const(GUID)*, void**);
}
enum IID_IDXCoreAdapterList = GUID(0x526c7776, 0x40e9, 0x459b, [0xb7, 0x11, 0xf3, 0x2a, 0xd7, 0x6d, 0xfc, 0x28]);
interface IDXCoreAdapterList : IUnknown
{
    HRESULT GetAdapter(uint, const(GUID)*, void**);
    uint GetAdapterCount();
    bool IsStale();
    HRESULT GetFactory(const(GUID)*, void**);
    HRESULT Sort(uint, const(DXCoreAdapterPreference)*);
    bool IsAdapterPreferenceSupported(DXCoreAdapterPreference);
}
enum IID_IDXCoreAdapterFactory = GUID(0x78ee5945, 0xc36e, 0x4b13, [0xa6, 0x69, 0x0, 0x5d, 0xd1, 0x1c, 0xf, 0x6]);
interface IDXCoreAdapterFactory : IUnknown
{
    HRESULT CreateAdapterList(uint, const(GUID)*, const(GUID)*, void**);
    HRESULT GetAdapterByLuid(const(LUID)*, const(GUID)*, void**);
    bool IsNotificationTypeSupported(DXCoreNotificationType);
    HRESULT RegisterEventNotification(IUnknown, DXCoreNotificationType, PFN_DXCORE_NOTIFICATION_CALLBACK, void*, uint*);
    HRESULT UnregisterEventNotification(uint);
}
