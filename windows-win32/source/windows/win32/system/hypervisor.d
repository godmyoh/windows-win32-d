module windows.win32.system.hypervisor;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, LUID, PSTR, PWSTR;
import windows.win32.networking.winsock : ADDRESS_FAMILY;
import windows.win32.system.hostcomputesystem : HCS_SYSTEM;
import windows.win32.system.power : DEVICE_POWER_STATE;

version (Windows):
extern (Windows):

HRESULT WHvGetCapability(WHV_CAPABILITY_CODE, void*, uint, uint*);
HRESULT WHvCreatePartition(WHV_PARTITION_HANDLE*);
HRESULT WHvSetupPartition(WHV_PARTITION_HANDLE);
HRESULT WHvResetPartition(WHV_PARTITION_HANDLE);
HRESULT WHvDeletePartition(WHV_PARTITION_HANDLE);
HRESULT WHvGetPartitionProperty(WHV_PARTITION_HANDLE, WHV_PARTITION_PROPERTY_CODE, void*, uint, uint*);
HRESULT WHvSetPartitionProperty(WHV_PARTITION_HANDLE, WHV_PARTITION_PROPERTY_CODE, const(void)*, uint);
HRESULT WHvSuspendPartitionTime(WHV_PARTITION_HANDLE);
HRESULT WHvResumePartitionTime(WHV_PARTITION_HANDLE);
HRESULT WHvMapGpaRange(WHV_PARTITION_HANDLE, void*, ulong, ulong, WHV_MAP_GPA_RANGE_FLAGS);
HRESULT WHvMapGpaRange2(WHV_PARTITION_HANDLE, HANDLE, void*, ulong, ulong, WHV_MAP_GPA_RANGE_FLAGS);
HRESULT WHvUnmapGpaRange(WHV_PARTITION_HANDLE, ulong, ulong);
HRESULT WHvTranslateGva(WHV_PARTITION_HANDLE, uint, ulong, WHV_TRANSLATE_GVA_FLAGS, WHV_TRANSLATE_GVA_RESULT*, ulong*);
HRESULT WHvCreateVirtualProcessor(WHV_PARTITION_HANDLE, uint, uint);
HRESULT WHvCreateVirtualProcessor2(WHV_PARTITION_HANDLE, uint, const(WHV_VIRTUAL_PROCESSOR_PROPERTY)*, uint);
HRESULT WHvDeleteVirtualProcessor(WHV_PARTITION_HANDLE, uint);
HRESULT WHvRunVirtualProcessor(WHV_PARTITION_HANDLE, uint, void*, uint);
HRESULT WHvCancelRunVirtualProcessor(WHV_PARTITION_HANDLE, uint, uint);
HRESULT WHvGetVirtualProcessorRegisters(WHV_PARTITION_HANDLE, uint, const(WHV_REGISTER_NAME)*, uint, WHV_REGISTER_VALUE*);
HRESULT WHvSetVirtualProcessorRegisters(WHV_PARTITION_HANDLE, uint, const(WHV_REGISTER_NAME)*, uint, const(WHV_REGISTER_VALUE)*);
HRESULT WHvGetVirtualProcessorInterruptControllerState(WHV_PARTITION_HANDLE, uint, void*, uint, uint*);
HRESULT WHvSetVirtualProcessorInterruptControllerState(WHV_PARTITION_HANDLE, uint, const(void)*, uint);
HRESULT WHvRequestInterrupt(WHV_PARTITION_HANDLE, const(WHV_INTERRUPT_CONTROL)*, uint);
HRESULT WHvGetVirtualProcessorXsaveState(WHV_PARTITION_HANDLE, uint, void*, uint, uint*);
HRESULT WHvSetVirtualProcessorXsaveState(WHV_PARTITION_HANDLE, uint, const(void)*, uint);
HRESULT WHvQueryGpaRangeDirtyBitmap(WHV_PARTITION_HANDLE, ulong, ulong, ulong*, uint);
HRESULT WHvGetPartitionCounters(WHV_PARTITION_HANDLE, WHV_PARTITION_COUNTER_SET, void*, uint, uint*);
HRESULT WHvGetVirtualProcessorCounters(WHV_PARTITION_HANDLE, uint, WHV_PROCESSOR_COUNTER_SET, void*, uint, uint*);
HRESULT WHvGetVirtualProcessorInterruptControllerState2(WHV_PARTITION_HANDLE, uint, void*, uint, uint*);
HRESULT WHvSetVirtualProcessorInterruptControllerState2(WHV_PARTITION_HANDLE, uint, const(void)*, uint);
HRESULT WHvRegisterPartitionDoorbellEvent(WHV_PARTITION_HANDLE, const(WHV_DOORBELL_MATCH_DATA)*, HANDLE);
HRESULT WHvUnregisterPartitionDoorbellEvent(WHV_PARTITION_HANDLE, const(WHV_DOORBELL_MATCH_DATA)*);
HRESULT WHvAdviseGpaRange(WHV_PARTITION_HANDLE, const(WHV_MEMORY_RANGE_ENTRY)*, uint, WHV_ADVISE_GPA_RANGE_CODE, const(void)*, uint);
HRESULT WHvReadGpaRange(WHV_PARTITION_HANDLE, uint, ulong, WHV_ACCESS_GPA_CONTROLS, void*, uint);
HRESULT WHvWriteGpaRange(WHV_PARTITION_HANDLE, uint, ulong, WHV_ACCESS_GPA_CONTROLS, const(void)*, uint);
HRESULT WHvSignalVirtualProcessorSynicEvent(WHV_PARTITION_HANDLE, WHV_SYNIC_EVENT_PARAMETERS, BOOL*);
HRESULT WHvGetVirtualProcessorState(WHV_PARTITION_HANDLE, uint, WHV_VIRTUAL_PROCESSOR_STATE_TYPE, void*, uint, uint*);
HRESULT WHvSetVirtualProcessorState(WHV_PARTITION_HANDLE, uint, WHV_VIRTUAL_PROCESSOR_STATE_TYPE, const(void)*, uint);
HRESULT WHvAllocateVpciResource(const(GUID)*, WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, const(void)*, uint, HANDLE*);
HRESULT WHvCreateVpciDevice(WHV_PARTITION_HANDLE, ulong, HANDLE, WHV_CREATE_VPCI_DEVICE_FLAGS, HANDLE);
HRESULT WHvDeleteVpciDevice(WHV_PARTITION_HANDLE, ulong);
HRESULT WHvGetVpciDeviceProperty(WHV_PARTITION_HANDLE, ulong, WHV_VPCI_DEVICE_PROPERTY_CODE, void*, uint, uint*);
HRESULT WHvGetVpciDeviceNotification(WHV_PARTITION_HANDLE, ulong, WHV_VPCI_DEVICE_NOTIFICATION*, uint);
HRESULT WHvMapVpciDeviceMmioRanges(WHV_PARTITION_HANDLE, ulong, uint*, WHV_VPCI_MMIO_MAPPING**);
HRESULT WHvUnmapVpciDeviceMmioRanges(WHV_PARTITION_HANDLE, ulong);
HRESULT WHvSetVpciDevicePowerState(WHV_PARTITION_HANDLE, ulong, DEVICE_POWER_STATE);
HRESULT WHvReadVpciDeviceRegister(WHV_PARTITION_HANDLE, ulong, const(WHV_VPCI_DEVICE_REGISTER)*, void*);
HRESULT WHvWriteVpciDeviceRegister(WHV_PARTITION_HANDLE, ulong, const(WHV_VPCI_DEVICE_REGISTER)*, const(void)*);
HRESULT WHvMapVpciDeviceInterrupt(WHV_PARTITION_HANDLE, ulong, uint, uint, const(WHV_VPCI_INTERRUPT_TARGET)*, ulong*, uint*);
HRESULT WHvUnmapVpciDeviceInterrupt(WHV_PARTITION_HANDLE, ulong, uint);
HRESULT WHvRetargetVpciDeviceInterrupt(WHV_PARTITION_HANDLE, ulong, ulong, uint, const(WHV_VPCI_INTERRUPT_TARGET)*);
HRESULT WHvRequestVpciDeviceInterrupt(WHV_PARTITION_HANDLE, ulong, ulong, uint);
HRESULT WHvGetVpciDeviceInterruptTarget(WHV_PARTITION_HANDLE, ulong, uint, uint, WHV_VPCI_INTERRUPT_TARGET*, uint, uint*);
HRESULT WHvCreateTrigger(WHV_PARTITION_HANDLE, const(WHV_TRIGGER_PARAMETERS)*, void**, HANDLE*);
HRESULT WHvUpdateTriggerParameters(WHV_PARTITION_HANDLE, const(WHV_TRIGGER_PARAMETERS)*, void*);
HRESULT WHvDeleteTrigger(WHV_PARTITION_HANDLE, void*);
HRESULT WHvCreateNotificationPort(WHV_PARTITION_HANDLE, const(WHV_NOTIFICATION_PORT_PARAMETERS)*, HANDLE, void**);
HRESULT WHvSetNotificationPortProperty(WHV_PARTITION_HANDLE, void*, WHV_NOTIFICATION_PORT_PROPERTY_CODE, ulong);
HRESULT WHvDeleteNotificationPort(WHV_PARTITION_HANDLE, void*);
HRESULT WHvPostVirtualProcessorSynicMessage(WHV_PARTITION_HANDLE, uint, uint, const(void)*, uint);
HRESULT WHvGetVirtualProcessorCpuidOutput(WHV_PARTITION_HANDLE, uint, uint, uint, WHV_CPUID_OUTPUT*);
HRESULT WHvGetInterruptTargetVpSet(WHV_PARTITION_HANDLE, ulong, WHV_INTERRUPT_DESTINATION_MODE, uint*, uint, uint*);
HRESULT WHvStartPartitionMigration(WHV_PARTITION_HANDLE, HANDLE*);
HRESULT WHvCancelPartitionMigration(WHV_PARTITION_HANDLE);
HRESULT WHvCompletePartitionMigration(WHV_PARTITION_HANDLE);
HRESULT WHvAcceptPartitionMigration(HANDLE, WHV_PARTITION_HANDLE*);
HRESULT WHvEmulatorCreateEmulator(const(WHV_EMULATOR_CALLBACKS)*, void**);
HRESULT WHvEmulatorDestroyEmulator(void*);
HRESULT WHvEmulatorTryIoEmulation(void*, void*, const(WHV_VP_EXIT_CONTEXT)*, const(WHV_X64_IO_PORT_ACCESS_CONTEXT)*, WHV_EMULATOR_STATUS*);
HRESULT WHvEmulatorTryMmioEmulation(void*, void*, const(WHV_VP_EXIT_CONTEXT)*, const(WHV_MEMORY_ACCESS_CONTEXT)*, WHV_EMULATOR_STATUS*);
HRESULT HdvInitializeDeviceHost(HCS_SYSTEM, void**);
HRESULT HdvInitializeDeviceHostEx(HCS_SYSTEM, HDV_DEVICE_HOST_FLAGS, void**);
HRESULT HdvTeardownDeviceHost(void*);
HRESULT HdvCreateDeviceInstance(void*, HDV_DEVICE_TYPE, const(GUID)*, const(GUID)*, const(void)*, void*, void**);
HRESULT HdvReadGuestMemory(void*, ulong, uint, ubyte*);
HRESULT HdvWriteGuestMemory(void*, ulong, uint, const(ubyte)*);
HRESULT HdvCreateGuestMemoryAperture(void*, ulong, uint, BOOL, void**);
HRESULT HdvDestroyGuestMemoryAperture(void*, void*);
HRESULT HdvDeliverGuestInterrupt(void*, ulong, uint);
HRESULT HdvRegisterDoorbell(void*, HDV_PCI_BAR_SELECTOR, ulong, ulong, ulong, HANDLE);
HRESULT HdvUnregisterDoorbell(void*, HDV_PCI_BAR_SELECTOR, ulong, ulong, ulong);
HRESULT HdvCreateSectionBackedMmioRange(void*, HDV_PCI_BAR_SELECTOR, ulong, ulong, HDV_MMIO_MAPPING_FLAGS, HANDLE, ulong);
HRESULT HdvDestroySectionBackedMmioRange(void*, HDV_PCI_BAR_SELECTOR, ulong);
HRESULT LocateSavedStateFiles(const(wchar)*, const(wchar)*, PWSTR*, PWSTR*, PWSTR*);
HRESULT LoadSavedStateFile(const(wchar)*, void**);
HRESULT ApplyPendingSavedStateFileReplayLog(const(wchar)*);
HRESULT LoadSavedStateFiles(const(wchar)*, const(wchar)*, void**);
HRESULT ReleaseSavedStateFiles(void*);
HRESULT GetGuestEnabledVirtualTrustLevels(void*, uint*);
HRESULT GetGuestOsInfo(void*, ubyte, GUEST_OS_INFO*);
HRESULT GetVpCount(void*, uint*);
HRESULT GetArchitecture(void*, uint, VIRTUAL_PROCESSOR_ARCH*);
HRESULT ForceArchitecture(void*, uint, VIRTUAL_PROCESSOR_ARCH);
HRESULT GetActiveVirtualTrustLevel(void*, uint, ubyte*);
HRESULT GetEnabledVirtualTrustLevels(void*, uint, uint*);
HRESULT ForceActiveVirtualTrustLevel(void*, uint, ubyte);
HRESULT IsActiveVirtualTrustLevelEnabled(void*, uint, BOOL*);
HRESULT IsNestedVirtualizationEnabled(void*, BOOL*);
HRESULT GetNestedVirtualizationMode(void*, uint, BOOL*);
HRESULT ForceNestedHostMode(void*, uint, BOOL, BOOL*);
HRESULT InKernelSpace(void*, uint, BOOL*);
HRESULT GetRegisterValue(void*, uint, uint, VIRTUAL_PROCESSOR_REGISTER*);
HRESULT GetPagingMode(void*, uint, PAGING_MODE*);
HRESULT ForcePagingMode(void*, uint, PAGING_MODE);
HRESULT ReadGuestPhysicalAddress(void*, ulong, void*, uint, uint*);
HRESULT GuestVirtualAddressToPhysicalAddress(void*, uint, const(ulong), ulong*, ulong*);
HRESULT GetGuestPhysicalMemoryChunks(void*, ulong*, GPA_MEMORY_CHUNK*, ulong*);
HRESULT GuestPhysicalAddressToRawSavedMemoryOffset(void*, ulong, ulong*);
HRESULT ReadGuestRawSavedMemory(void*, ulong, void*, uint, uint*);
HRESULT GetGuestRawSavedMemorySize(void*, ulong*);
HRESULT SetMemoryBlockCacheLimit(void*, ulong);
HRESULT GetMemoryBlockCacheLimit(void*, ulong*);
HRESULT ApplyGuestMemoryFix(void*, uint, ulong, void*, uint);
HRESULT LoadSavedStateSymbolProvider(void*, const(wchar)*, BOOL);
HRESULT ReleaseSavedStateSymbolProvider(void*);
HANDLE GetSavedStateSymbolProviderHandle(void*);
HRESULT SetSavedStateSymbolProviderDebugInfoCallback(void*, GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK);
HRESULT LoadSavedStateModuleSymbols(void*, const(char)*, const(char)*, ulong, uint);
HRESULT LoadSavedStateModuleSymbolsEx(void*, const(char)*, uint, const(char)*, ulong, uint);
HRESULT ResolveSavedStateGlobalVariableAddress(void*, uint, const(char)*, ulong*, uint*);
HRESULT ReadSavedStateGlobalVariable(void*, uint, const(char)*, void*, uint);
HRESULT GetSavedStateSymbolTypeSize(void*, uint, const(char)*, uint*);
HRESULT FindSavedStateSymbolFieldInType(void*, uint, const(char)*, const(wchar)*, uint*, BOOL*);
HRESULT GetSavedStateSymbolFieldInfo(void*, uint, const(char)*, PWSTR*);
HRESULT ScanMemoryForDosImages(void*, uint, ulong, ulong, void*, FOUND_IMAGE_CALLBACK, ulong*, uint);
HRESULT CallStackUnwind(void*, uint, MODULE_INFO*, uint, uint, PWSTR*);
enum HVSOCKET_CONNECT_TIMEOUT = 0x00000001;
enum HVSOCKET_CONNECT_TIMEOUT_MAX = 0x000493e0;
enum HVSOCKET_CONNECTED_SUSPEND = 0x00000004;
enum HVSOCKET_HIGH_VTL = 0x00000008;
enum HV_PROTOCOL_RAW = 0x00000001;
enum HVSOCKET_ADDRESS_FLAG_PASSTHRU = 0x00000001;
enum WHV_PROCESSOR_FEATURES_BANKS_COUNT = 0x00000002;
enum WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_COUNT = 0x00000001;
enum WHV_READ_WRITE_GPA_RANGE_MAX_SIZE = 0x00000010;
enum WHV_HYPERCALL_CONTEXT_MAX_XMM_REGISTERS = 0x00000006;
enum WHV_MAX_DEVICE_ID_SIZE_IN_CHARS = 0x000000c8;
enum WHV_VPCI_TYPE0_BAR_COUNT = 0x00000006;
enum WHV_ANY_VP = 0xffffffff;
enum WHV_SYNIC_MESSAGE_SIZE = 0x00000100;
enum VM_GENCOUNTER_SYMBOLIC_LINK_NAME = "\\VmGenerationCounter";
enum IOCTL_VMGENCOUNTER_READ = 0x0032c004;
enum HDV_PCI_BAR_COUNT = 0x00000006;
enum HV_GUID_ZERO = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum HV_GUID_BROADCAST = GUID(0xffffffff, 0xffff, 0xffff, [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]);
enum HV_GUID_CHILDREN = GUID(0x90db8b89, 0xd35, 0x4f79, [0x8c, 0xe9, 0x49, 0xea, 0xa, 0xc8, 0xb7, 0xcd]);
enum HV_GUID_LOOPBACK = GUID(0xe0e16197, 0xdd56, 0x4a10, [0x91, 0x95, 0x5e, 0xe7, 0xa1, 0x55, 0xa8, 0x38]);
enum HV_GUID_PARENT = GUID(0xa42e7cda, 0xd03f, 0x480c, [0x9c, 0xc2, 0xa4, 0xde, 0x20, 0xab, 0xb8, 0x78]);
enum HV_GUID_SILOHOST = GUID(0x36bd0c5c, 0x7276, 0x4223, [0x88, 0xba, 0x7d, 0x3, 0xb6, 0x54, 0xc5, 0x68]);
enum HV_GUID_VSOCK_TEMPLATE = GUID(0x0, 0xfacb, 0x11e6, [0xbd, 0x58, 0x64, 0x0, 0x6a, 0x79, 0x86, 0xd3]);
enum GUID_DEVINTERFACE_VM_GENCOUNTER = GUID(0x3ff2c92b, 0x6598, 0x4e60, [0x8e, 0x1c, 0xc, 0xcf, 0x49, 0x27, 0xe3, 0x19]);
alias WHV_PARTITION_HANDLE = long;
alias WHV_CAPABILITY_CODE = int;
enum : int
{
    WHvCapabilityCodeHypervisorPresent               = 0x00000000,
    WHvCapabilityCodeFeatures                        = 0x00000001,
    WHvCapabilityCodeExtendedVmExits                 = 0x00000002,
    WHvCapabilityCodeExceptionExitBitmap             = 0x00000003,
    WHvCapabilityCodeX64MsrExitBitmap                = 0x00000004,
    WHvCapabilityCodeGpaRangePopulateFlags           = 0x00000005,
    WHvCapabilityCodeSchedulerFeatures               = 0x00000006,
    WHvCapabilityCodeProcessorVendor                 = 0x00001000,
    WHvCapabilityCodeProcessorFeatures               = 0x00001001,
    WHvCapabilityCodeProcessorClFlushSize            = 0x00001002,
    WHvCapabilityCodeProcessorXsaveFeatures          = 0x00001003,
    WHvCapabilityCodeProcessorClockFrequency         = 0x00001004,
    WHvCapabilityCodeInterruptClockFrequency         = 0x00001005,
    WHvCapabilityCodeProcessorFeaturesBanks          = 0x00001006,
    WHvCapabilityCodeProcessorFrequencyCap           = 0x00001007,
    WHvCapabilityCodeSyntheticProcessorFeaturesBanks = 0x00001008,
    WHvCapabilityCodeProcessorPerfmonFeatures        = 0x00001009,
}

union WHV_CAPABILITY_FEATURES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_EXTENDED_VM_EXITS
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
alias WHV_PROCESSOR_VENDOR = int;
enum : int
{
    WHvProcessorVendorAmd   = 0x00000000,
    WHvProcessorVendorIntel = 0x00000001,
    WHvProcessorVendorHygon = 0x00000002,
}

union WHV_PROCESSOR_FEATURES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_PROCESSOR_FEATURES1
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
struct WHV_PROCESSOR_FEATURES_BANKS
{
    uint BanksCount;
    uint Reserved0;
    union
    {
        struct
        {
            WHV_PROCESSOR_FEATURES Bank0;
            WHV_PROCESSOR_FEATURES1 Bank1;
        }
        ulong[2] AsUINT64;
    }
}
union WHV_SYNTHETIC_PROCESSOR_FEATURES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
struct WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
{
    uint BanksCount;
    uint Reserved0;
    union
    {
        struct
        {
            WHV_SYNTHETIC_PROCESSOR_FEATURES Bank0;
        }
        ulong[1] AsUINT64;
    }
}
alias WHV_PARTITION_PROPERTY_CODE = int;
enum : int
{
    WHvPartitionPropertyCodeExtendedVmExits                 = 0x00000001,
    WHvPartitionPropertyCodeExceptionExitBitmap             = 0x00000002,
    WHvPartitionPropertyCodeSeparateSecurityDomain          = 0x00000003,
    WHvPartitionPropertyCodeNestedVirtualization            = 0x00000004,
    WHvPartitionPropertyCodeX64MsrExitBitmap                = 0x00000005,
    WHvPartitionPropertyCodePrimaryNumaNode                 = 0x00000006,
    WHvPartitionPropertyCodeCpuReserve                      = 0x00000007,
    WHvPartitionPropertyCodeCpuCap                          = 0x00000008,
    WHvPartitionPropertyCodeCpuWeight                       = 0x00000009,
    WHvPartitionPropertyCodeCpuGroupId                      = 0x0000000a,
    WHvPartitionPropertyCodeProcessorFrequencyCap           = 0x0000000b,
    WHvPartitionPropertyCodeAllowDeviceAssignment           = 0x0000000c,
    WHvPartitionPropertyCodeDisableSmt                      = 0x0000000d,
    WHvPartitionPropertyCodeProcessorFeatures               = 0x00001001,
    WHvPartitionPropertyCodeProcessorClFlushSize            = 0x00001002,
    WHvPartitionPropertyCodeCpuidExitList                   = 0x00001003,
    WHvPartitionPropertyCodeCpuidResultList                 = 0x00001004,
    WHvPartitionPropertyCodeLocalApicEmulationMode          = 0x00001005,
    WHvPartitionPropertyCodeProcessorXsaveFeatures          = 0x00001006,
    WHvPartitionPropertyCodeProcessorClockFrequency         = 0x00001007,
    WHvPartitionPropertyCodeInterruptClockFrequency         = 0x00001008,
    WHvPartitionPropertyCodeApicRemoteReadSupport           = 0x00001009,
    WHvPartitionPropertyCodeProcessorFeaturesBanks          = 0x0000100a,
    WHvPartitionPropertyCodeReferenceTime                   = 0x0000100b,
    WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks = 0x0000100c,
    WHvPartitionPropertyCodeCpuidResultList2                = 0x0000100d,
    WHvPartitionPropertyCodeProcessorPerfmonFeatures        = 0x0000100e,
    WHvPartitionPropertyCodeMsrActionList                   = 0x0000100f,
    WHvPartitionPropertyCodeUnimplementedMsrAction          = 0x00001010,
    WHvPartitionPropertyCodeProcessorCount                  = 0x00001fff,
}

union WHV_PROCESSOR_XSAVE_FEATURES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_PROCESSOR_PERFMON_FEATURES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_X64_MSR_EXIT_BITMAP
{
    ulong AsUINT64;
    struct
    {
        ulong _bitfield0;
    }
}
struct WHV_MEMORY_RANGE_ENTRY
{
    ulong GuestAddress;
    ulong SizeInBytes;
}
union WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
{
    uint AsUINT32;
    struct
    {
        uint _bitfield0;
    }
}
alias WHV_MEMORY_ACCESS_TYPE = int;
enum : int
{
    WHvMemoryAccessRead    = 0x00000000,
    WHvMemoryAccessWrite   = 0x00000001,
    WHvMemoryAccessExecute = 0x00000002,
}

struct WHV_ADVISE_GPA_RANGE_POPULATE
{
    WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS Flags;
    WHV_MEMORY_ACCESS_TYPE AccessType;
}
struct WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
{
    uint _bitfield0;
    uint HighestFrequencyMhz;
    uint NominalFrequencyMhz;
    uint LowestFrequencyMhz;
    uint FrequencyStepMhz;
}
union WHV_SCHEDULER_FEATURES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_CAPABILITY
{
    BOOL HypervisorPresent;
    WHV_CAPABILITY_FEATURES Features;
    WHV_EXTENDED_VM_EXITS ExtendedVmExits;
    WHV_PROCESSOR_VENDOR ProcessorVendor;
    WHV_PROCESSOR_FEATURES ProcessorFeatures;
    WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS SyntheticProcessorFeaturesBanks;
    WHV_PROCESSOR_XSAVE_FEATURES ProcessorXsaveFeatures;
    ubyte ProcessorClFlushSize;
    ulong ExceptionExitBitmap;
    WHV_X64_MSR_EXIT_BITMAP X64MsrExitBitmap;
    ulong ProcessorClockFrequency;
    ulong InterruptClockFrequency;
    WHV_PROCESSOR_FEATURES_BANKS ProcessorFeaturesBanks;
    WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS GpaRangePopulateFlags;
    WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP ProcessorFrequencyCap;
    WHV_PROCESSOR_PERFMON_FEATURES ProcessorPerfmonFeatures;
    WHV_SCHEDULER_FEATURES SchedulerFeatures;
}
struct WHV_X64_CPUID_RESULT
{
    uint Function;
    uint[3] Reserved;
    uint Eax;
    uint Ebx;
    uint Ecx;
    uint Edx;
}
alias WHV_X64_CPUID_RESULT2_FLAGS = int;
enum : int
{
    WHvX64CpuidResult2FlagSubleafSpecific = 0x00000001,
    WHvX64CpuidResult2FlagVpSpecific      = 0x00000002,
}

struct WHV_CPUID_OUTPUT
{
    uint Eax;
    uint Ebx;
    uint Ecx;
    uint Edx;
}
struct WHV_X64_CPUID_RESULT2
{
    uint Function;
    uint Index;
    uint VpIndex;
    WHV_X64_CPUID_RESULT2_FLAGS Flags;
    WHV_CPUID_OUTPUT Output;
    WHV_CPUID_OUTPUT Mask;
}
struct WHV_MSR_ACTION_ENTRY
{
    uint Index;
    ubyte ReadAction;
    ubyte WriteAction;
    ushort Reserved;
}
alias WHV_MSR_ACTION = int;
enum : int
{
    WHvMsrActionArchitectureDefault = 0x00000000,
    WHvMsrActionIgnoreWriteReadZero = 0x00000001,
    WHvMsrActionExit                = 0x00000002,
}

alias WHV_EXCEPTION_TYPE = int;
enum : int
{
    WHvX64ExceptionTypeDivideErrorFault             = 0x00000000,
    WHvX64ExceptionTypeDebugTrapOrFault             = 0x00000001,
    WHvX64ExceptionTypeBreakpointTrap               = 0x00000003,
    WHvX64ExceptionTypeOverflowTrap                 = 0x00000004,
    WHvX64ExceptionTypeBoundRangeFault              = 0x00000005,
    WHvX64ExceptionTypeInvalidOpcodeFault           = 0x00000006,
    WHvX64ExceptionTypeDeviceNotAvailableFault      = 0x00000007,
    WHvX64ExceptionTypeDoubleFaultAbort             = 0x00000008,
    WHvX64ExceptionTypeInvalidTaskStateSegmentFault = 0x0000000a,
    WHvX64ExceptionTypeSegmentNotPresentFault       = 0x0000000b,
    WHvX64ExceptionTypeStackFault                   = 0x0000000c,
    WHvX64ExceptionTypeGeneralProtectionFault       = 0x0000000d,
    WHvX64ExceptionTypePageFault                    = 0x0000000e,
    WHvX64ExceptionTypeFloatingPointErrorFault      = 0x00000010,
    WHvX64ExceptionTypeAlignmentCheckFault          = 0x00000011,
    WHvX64ExceptionTypeMachineCheckAbort            = 0x00000012,
    WHvX64ExceptionTypeSimdFloatingPointFault       = 0x00000013,
}

alias WHV_X64_LOCAL_APIC_EMULATION_MODE = int;
enum : int
{
    WHvX64LocalApicEmulationModeNone   = 0x00000000,
    WHvX64LocalApicEmulationModeXApic  = 0x00000001,
    WHvX64LocalApicEmulationModeX2Apic = 0x00000002,
}

union WHV_PARTITION_PROPERTY
{
    WHV_EXTENDED_VM_EXITS ExtendedVmExits;
    WHV_PROCESSOR_FEATURES ProcessorFeatures;
    WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS SyntheticProcessorFeaturesBanks;
    WHV_PROCESSOR_XSAVE_FEATURES ProcessorXsaveFeatures;
    ubyte ProcessorClFlushSize;
    uint ProcessorCount;
    uint[1] CpuidExitList;
    WHV_X64_CPUID_RESULT[1] CpuidResultList;
    WHV_X64_CPUID_RESULT2[1] CpuidResultList2;
    WHV_MSR_ACTION_ENTRY[1] MsrActionList;
    WHV_MSR_ACTION UnimplementedMsrAction;
    ulong ExceptionExitBitmap;
    WHV_X64_LOCAL_APIC_EMULATION_MODE LocalApicEmulationMode;
    BOOL SeparateSecurityDomain;
    BOOL NestedVirtualization;
    WHV_X64_MSR_EXIT_BITMAP X64MsrExitBitmap;
    ulong ProcessorClockFrequency;
    ulong InterruptClockFrequency;
    BOOL ApicRemoteRead;
    WHV_PROCESSOR_FEATURES_BANKS ProcessorFeaturesBanks;
    ulong ReferenceTime;
    ushort PrimaryNumaNode;
    uint CpuReserve;
    uint CpuCap;
    uint CpuWeight;
    ulong CpuGroupId;
    uint ProcessorFrequencyCap;
    BOOL AllowDeviceAssignment;
    WHV_PROCESSOR_PERFMON_FEATURES ProcessorPerfmonFeatures;
    BOOL DisableSmt;
}
alias WHV_MAP_GPA_RANGE_FLAGS = int;
enum : int
{
    WHvMapGpaRangeFlagNone            = 0x00000000,
    WHvMapGpaRangeFlagRead            = 0x00000001,
    WHvMapGpaRangeFlagWrite           = 0x00000002,
    WHvMapGpaRangeFlagExecute         = 0x00000004,
    WHvMapGpaRangeFlagTrackDirtyPages = 0x00000008,
}

alias WHV_TRANSLATE_GVA_FLAGS = int;
enum : int
{
    WHvTranslateGvaFlagNone             = 0x00000000,
    WHvTranslateGvaFlagValidateRead     = 0x00000001,
    WHvTranslateGvaFlagValidateWrite    = 0x00000002,
    WHvTranslateGvaFlagValidateExecute  = 0x00000004,
    WHvTranslateGvaFlagPrivilegeExempt  = 0x00000008,
    WHvTranslateGvaFlagSetPageTableBits = 0x00000010,
    WHvTranslateGvaFlagEnforceSmap      = 0x00000100,
    WHvTranslateGvaFlagOverrideSmap     = 0x00000200,
}

alias WHV_TRANSLATE_GVA_RESULT_CODE = int;
enum : int
{
    WHvTranslateGvaResultSuccess                 = 0x00000000,
    WHvTranslateGvaResultPageNotPresent          = 0x00000001,
    WHvTranslateGvaResultPrivilegeViolation      = 0x00000002,
    WHvTranslateGvaResultInvalidPageTableFlags   = 0x00000003,
    WHvTranslateGvaResultGpaUnmapped             = 0x00000004,
    WHvTranslateGvaResultGpaNoReadAccess         = 0x00000005,
    WHvTranslateGvaResultGpaNoWriteAccess        = 0x00000006,
    WHvTranslateGvaResultGpaIllegalOverlayAccess = 0x00000007,
    WHvTranslateGvaResultIntercept               = 0x00000008,
}

struct WHV_TRANSLATE_GVA_RESULT
{
    WHV_TRANSLATE_GVA_RESULT_CODE ResultCode;
    uint Reserved;
}
union WHV_ADVISE_GPA_RANGE
{
    WHV_ADVISE_GPA_RANGE_POPULATE Populate;
}
alias WHV_CACHE_TYPE = int;
enum : int
{
    WHvCacheTypeUncached       = 0x00000000,
    WHvCacheTypeWriteCombining = 0x00000001,
    WHvCacheTypeWriteThrough   = 0x00000004,
    WHvCacheTypeWriteBack      = 0x00000006,
}

union WHV_ACCESS_GPA_CONTROLS
{
    ulong AsUINT64;
    struct
    {
        WHV_CACHE_TYPE CacheType;
        uint Reserved;
    }
}
alias WHV_REGISTER_NAME = int;
enum : int
{
    WHvX64RegisterRax                         = 0x00000000,
    WHvX64RegisterRcx                         = 0x00000001,
    WHvX64RegisterRdx                         = 0x00000002,
    WHvX64RegisterRbx                         = 0x00000003,
    WHvX64RegisterRsp                         = 0x00000004,
    WHvX64RegisterRbp                         = 0x00000005,
    WHvX64RegisterRsi                         = 0x00000006,
    WHvX64RegisterRdi                         = 0x00000007,
    WHvX64RegisterR8                          = 0x00000008,
    WHvX64RegisterR9                          = 0x00000009,
    WHvX64RegisterR10                         = 0x0000000a,
    WHvX64RegisterR11                         = 0x0000000b,
    WHvX64RegisterR12                         = 0x0000000c,
    WHvX64RegisterR13                         = 0x0000000d,
    WHvX64RegisterR14                         = 0x0000000e,
    WHvX64RegisterR15                         = 0x0000000f,
    WHvX64RegisterRip                         = 0x00000010,
    WHvX64RegisterRflags                      = 0x00000011,
    WHvX64RegisterEs                          = 0x00000012,
    WHvX64RegisterCs                          = 0x00000013,
    WHvX64RegisterSs                          = 0x00000014,
    WHvX64RegisterDs                          = 0x00000015,
    WHvX64RegisterFs                          = 0x00000016,
    WHvX64RegisterGs                          = 0x00000017,
    WHvX64RegisterLdtr                        = 0x00000018,
    WHvX64RegisterTr                          = 0x00000019,
    WHvX64RegisterIdtr                        = 0x0000001a,
    WHvX64RegisterGdtr                        = 0x0000001b,
    WHvX64RegisterCr0                         = 0x0000001c,
    WHvX64RegisterCr2                         = 0x0000001d,
    WHvX64RegisterCr3                         = 0x0000001e,
    WHvX64RegisterCr4                         = 0x0000001f,
    WHvX64RegisterCr8                         = 0x00000020,
    WHvX64RegisterDr0                         = 0x00000021,
    WHvX64RegisterDr1                         = 0x00000022,
    WHvX64RegisterDr2                         = 0x00000023,
    WHvX64RegisterDr3                         = 0x00000024,
    WHvX64RegisterDr6                         = 0x00000025,
    WHvX64RegisterDr7                         = 0x00000026,
    WHvX64RegisterXCr0                        = 0x00000027,
    WHvX64RegisterVirtualCr0                  = 0x00000028,
    WHvX64RegisterVirtualCr3                  = 0x00000029,
    WHvX64RegisterVirtualCr4                  = 0x0000002a,
    WHvX64RegisterVirtualCr8                  = 0x0000002b,
    WHvX64RegisterXmm0                        = 0x00001000,
    WHvX64RegisterXmm1                        = 0x00001001,
    WHvX64RegisterXmm2                        = 0x00001002,
    WHvX64RegisterXmm3                        = 0x00001003,
    WHvX64RegisterXmm4                        = 0x00001004,
    WHvX64RegisterXmm5                        = 0x00001005,
    WHvX64RegisterXmm6                        = 0x00001006,
    WHvX64RegisterXmm7                        = 0x00001007,
    WHvX64RegisterXmm8                        = 0x00001008,
    WHvX64RegisterXmm9                        = 0x00001009,
    WHvX64RegisterXmm10                       = 0x0000100a,
    WHvX64RegisterXmm11                       = 0x0000100b,
    WHvX64RegisterXmm12                       = 0x0000100c,
    WHvX64RegisterXmm13                       = 0x0000100d,
    WHvX64RegisterXmm14                       = 0x0000100e,
    WHvX64RegisterXmm15                       = 0x0000100f,
    WHvX64RegisterFpMmx0                      = 0x00001010,
    WHvX64RegisterFpMmx1                      = 0x00001011,
    WHvX64RegisterFpMmx2                      = 0x00001012,
    WHvX64RegisterFpMmx3                      = 0x00001013,
    WHvX64RegisterFpMmx4                      = 0x00001014,
    WHvX64RegisterFpMmx5                      = 0x00001015,
    WHvX64RegisterFpMmx6                      = 0x00001016,
    WHvX64RegisterFpMmx7                      = 0x00001017,
    WHvX64RegisterFpControlStatus             = 0x00001018,
    WHvX64RegisterXmmControlStatus            = 0x00001019,
    WHvX64RegisterTsc                         = 0x00002000,
    WHvX64RegisterEfer                        = 0x00002001,
    WHvX64RegisterKernelGsBase                = 0x00002002,
    WHvX64RegisterApicBase                    = 0x00002003,
    WHvX64RegisterPat                         = 0x00002004,
    WHvX64RegisterSysenterCs                  = 0x00002005,
    WHvX64RegisterSysenterEip                 = 0x00002006,
    WHvX64RegisterSysenterEsp                 = 0x00002007,
    WHvX64RegisterStar                        = 0x00002008,
    WHvX64RegisterLstar                       = 0x00002009,
    WHvX64RegisterCstar                       = 0x0000200a,
    WHvX64RegisterSfmask                      = 0x0000200b,
    WHvX64RegisterInitialApicId               = 0x0000200c,
    WHvX64RegisterMsrMtrrCap                  = 0x0000200d,
    WHvX64RegisterMsrMtrrDefType              = 0x0000200e,
    WHvX64RegisterMsrMtrrPhysBase0            = 0x00002010,
    WHvX64RegisterMsrMtrrPhysBase1            = 0x00002011,
    WHvX64RegisterMsrMtrrPhysBase2            = 0x00002012,
    WHvX64RegisterMsrMtrrPhysBase3            = 0x00002013,
    WHvX64RegisterMsrMtrrPhysBase4            = 0x00002014,
    WHvX64RegisterMsrMtrrPhysBase5            = 0x00002015,
    WHvX64RegisterMsrMtrrPhysBase6            = 0x00002016,
    WHvX64RegisterMsrMtrrPhysBase7            = 0x00002017,
    WHvX64RegisterMsrMtrrPhysBase8            = 0x00002018,
    WHvX64RegisterMsrMtrrPhysBase9            = 0x00002019,
    WHvX64RegisterMsrMtrrPhysBaseA            = 0x0000201a,
    WHvX64RegisterMsrMtrrPhysBaseB            = 0x0000201b,
    WHvX64RegisterMsrMtrrPhysBaseC            = 0x0000201c,
    WHvX64RegisterMsrMtrrPhysBaseD            = 0x0000201d,
    WHvX64RegisterMsrMtrrPhysBaseE            = 0x0000201e,
    WHvX64RegisterMsrMtrrPhysBaseF            = 0x0000201f,
    WHvX64RegisterMsrMtrrPhysMask0            = 0x00002040,
    WHvX64RegisterMsrMtrrPhysMask1            = 0x00002041,
    WHvX64RegisterMsrMtrrPhysMask2            = 0x00002042,
    WHvX64RegisterMsrMtrrPhysMask3            = 0x00002043,
    WHvX64RegisterMsrMtrrPhysMask4            = 0x00002044,
    WHvX64RegisterMsrMtrrPhysMask5            = 0x00002045,
    WHvX64RegisterMsrMtrrPhysMask6            = 0x00002046,
    WHvX64RegisterMsrMtrrPhysMask7            = 0x00002047,
    WHvX64RegisterMsrMtrrPhysMask8            = 0x00002048,
    WHvX64RegisterMsrMtrrPhysMask9            = 0x00002049,
    WHvX64RegisterMsrMtrrPhysMaskA            = 0x0000204a,
    WHvX64RegisterMsrMtrrPhysMaskB            = 0x0000204b,
    WHvX64RegisterMsrMtrrPhysMaskC            = 0x0000204c,
    WHvX64RegisterMsrMtrrPhysMaskD            = 0x0000204d,
    WHvX64RegisterMsrMtrrPhysMaskE            = 0x0000204e,
    WHvX64RegisterMsrMtrrPhysMaskF            = 0x0000204f,
    WHvX64RegisterMsrMtrrFix64k00000          = 0x00002070,
    WHvX64RegisterMsrMtrrFix16k80000          = 0x00002071,
    WHvX64RegisterMsrMtrrFix16kA0000          = 0x00002072,
    WHvX64RegisterMsrMtrrFix4kC0000           = 0x00002073,
    WHvX64RegisterMsrMtrrFix4kC8000           = 0x00002074,
    WHvX64RegisterMsrMtrrFix4kD0000           = 0x00002075,
    WHvX64RegisterMsrMtrrFix4kD8000           = 0x00002076,
    WHvX64RegisterMsrMtrrFix4kE0000           = 0x00002077,
    WHvX64RegisterMsrMtrrFix4kE8000           = 0x00002078,
    WHvX64RegisterMsrMtrrFix4kF0000           = 0x00002079,
    WHvX64RegisterMsrMtrrFix4kF8000           = 0x0000207a,
    WHvX64RegisterTscAux                      = 0x0000207b,
    WHvX64RegisterBndcfgs                     = 0x0000207c,
    WHvX64RegisterMCount                      = 0x0000207e,
    WHvX64RegisterACount                      = 0x0000207f,
    WHvX64RegisterSpecCtrl                    = 0x00002084,
    WHvX64RegisterPredCmd                     = 0x00002085,
    WHvX64RegisterTscVirtualOffset            = 0x00002087,
    WHvX64RegisterTsxCtrl                     = 0x00002088,
    WHvX64RegisterXss                         = 0x0000208b,
    WHvX64RegisterUCet                        = 0x0000208c,
    WHvX64RegisterSCet                        = 0x0000208d,
    WHvX64RegisterSsp                         = 0x0000208e,
    WHvX64RegisterPl0Ssp                      = 0x0000208f,
    WHvX64RegisterPl1Ssp                      = 0x00002090,
    WHvX64RegisterPl2Ssp                      = 0x00002091,
    WHvX64RegisterPl3Ssp                      = 0x00002092,
    WHvX64RegisterInterruptSspTableAddr       = 0x00002093,
    WHvX64RegisterTscDeadline                 = 0x00002095,
    WHvX64RegisterTscAdjust                   = 0x00002096,
    WHvX64RegisterUmwaitControl               = 0x00002098,
    WHvX64RegisterXfd                         = 0x00002099,
    WHvX64RegisterXfdErr                      = 0x0000209a,
    WHvX64RegisterApicId                      = 0x00003002,
    WHvX64RegisterApicVersion                 = 0x00003003,
    WHvX64RegisterApicTpr                     = 0x00003008,
    WHvX64RegisterApicPpr                     = 0x0000300a,
    WHvX64RegisterApicEoi                     = 0x0000300b,
    WHvX64RegisterApicLdr                     = 0x0000300d,
    WHvX64RegisterApicSpurious                = 0x0000300f,
    WHvX64RegisterApicIsr0                    = 0x00003010,
    WHvX64RegisterApicIsr1                    = 0x00003011,
    WHvX64RegisterApicIsr2                    = 0x00003012,
    WHvX64RegisterApicIsr3                    = 0x00003013,
    WHvX64RegisterApicIsr4                    = 0x00003014,
    WHvX64RegisterApicIsr5                    = 0x00003015,
    WHvX64RegisterApicIsr6                    = 0x00003016,
    WHvX64RegisterApicIsr7                    = 0x00003017,
    WHvX64RegisterApicTmr0                    = 0x00003018,
    WHvX64RegisterApicTmr1                    = 0x00003019,
    WHvX64RegisterApicTmr2                    = 0x0000301a,
    WHvX64RegisterApicTmr3                    = 0x0000301b,
    WHvX64RegisterApicTmr4                    = 0x0000301c,
    WHvX64RegisterApicTmr5                    = 0x0000301d,
    WHvX64RegisterApicTmr6                    = 0x0000301e,
    WHvX64RegisterApicTmr7                    = 0x0000301f,
    WHvX64RegisterApicIrr0                    = 0x00003020,
    WHvX64RegisterApicIrr1                    = 0x00003021,
    WHvX64RegisterApicIrr2                    = 0x00003022,
    WHvX64RegisterApicIrr3                    = 0x00003023,
    WHvX64RegisterApicIrr4                    = 0x00003024,
    WHvX64RegisterApicIrr5                    = 0x00003025,
    WHvX64RegisterApicIrr6                    = 0x00003026,
    WHvX64RegisterApicIrr7                    = 0x00003027,
    WHvX64RegisterApicEse                     = 0x00003028,
    WHvX64RegisterApicIcr                     = 0x00003030,
    WHvX64RegisterApicLvtTimer                = 0x00003032,
    WHvX64RegisterApicLvtThermal              = 0x00003033,
    WHvX64RegisterApicLvtPerfmon              = 0x00003034,
    WHvX64RegisterApicLvtLint0                = 0x00003035,
    WHvX64RegisterApicLvtLint1                = 0x00003036,
    WHvX64RegisterApicLvtError                = 0x00003037,
    WHvX64RegisterApicInitCount               = 0x00003038,
    WHvX64RegisterApicCurrentCount            = 0x00003039,
    WHvX64RegisterApicDivide                  = 0x0000303e,
    WHvX64RegisterApicSelfIpi                 = 0x0000303f,
    WHvRegisterSint0                          = 0x00004000,
    WHvRegisterSint1                          = 0x00004001,
    WHvRegisterSint2                          = 0x00004002,
    WHvRegisterSint3                          = 0x00004003,
    WHvRegisterSint4                          = 0x00004004,
    WHvRegisterSint5                          = 0x00004005,
    WHvRegisterSint6                          = 0x00004006,
    WHvRegisterSint7                          = 0x00004007,
    WHvRegisterSint8                          = 0x00004008,
    WHvRegisterSint9                          = 0x00004009,
    WHvRegisterSint10                         = 0x0000400a,
    WHvRegisterSint11                         = 0x0000400b,
    WHvRegisterSint12                         = 0x0000400c,
    WHvRegisterSint13                         = 0x0000400d,
    WHvRegisterSint14                         = 0x0000400e,
    WHvRegisterSint15                         = 0x0000400f,
    WHvRegisterScontrol                       = 0x00004010,
    WHvRegisterSversion                       = 0x00004011,
    WHvRegisterSiefp                          = 0x00004012,
    WHvRegisterSimp                           = 0x00004013,
    WHvRegisterEom                            = 0x00004014,
    WHvRegisterVpRuntime                      = 0x00005000,
    WHvX64RegisterHypercall                   = 0x00005001,
    WHvRegisterGuestOsId                      = 0x00005002,
    WHvRegisterVpAssistPage                   = 0x00005013,
    WHvRegisterReferenceTsc                   = 0x00005017,
    WHvRegisterReferenceTscSequence           = 0x0000501a,
    WHvRegisterPendingInterruption            = 0x80000000,
    WHvRegisterInterruptState                 = 0x80000001,
    WHvRegisterPendingEvent                   = 0x80000002,
    WHvX64RegisterDeliverabilityNotifications = 0x80000004,
    WHvRegisterInternalActivityState          = 0x80000005,
    WHvX64RegisterPendingDebugException       = 0x80000006,
}

union WHV_UINT128
{
    struct
    {
        ulong Low64;
        ulong High64;
    }
    uint[4] Dword;
}
union WHV_X64_FP_REGISTER
{
    struct
    {
        ulong Mantissa;
        ulong _bitfield0;
    }
    WHV_UINT128 AsUINT128;
}
union WHV_X64_FP_CONTROL_STATUS_REGISTER
{
    struct
    {
        ushort FpControl;
        ushort FpStatus;
        ubyte FpTag;
        ubyte Reserved;
        ushort LastFpOp;
        union
        {
            ulong LastFpRip;
            struct
            {
                uint LastFpEip;
                ushort LastFpCs;
                ushort Reserved2;
            }
        }
    }
    WHV_UINT128 AsUINT128;
}
union WHV_X64_XMM_CONTROL_STATUS_REGISTER
{
    struct
    {
        union
        {
            ulong LastFpRdp;
            struct
            {
                uint LastFpDp;
                ushort LastFpDs;
                ushort Reserved;
            }
        }
        uint XmmStatusControl;
        uint XmmStatusControlMask;
    }
    WHV_UINT128 AsUINT128;
}
struct WHV_X64_SEGMENT_REGISTER
{
    ulong Base;
    uint Limit;
    ushort Selector;
    union
    {
        struct
        {
            ushort _bitfield0;
        }
        ushort Attributes;
    }
}
struct WHV_X64_TABLE_REGISTER
{
    ushort[3] Pad;
    ushort Limit;
    ulong Base;
}
union WHV_X64_INTERRUPT_STATE_REGISTER
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_X64_PENDING_INTERRUPTION_REGISTER
{
    struct
    {
        uint _bitfield0;
        uint ErrorCode;
    }
    ulong AsUINT64;
}
union WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
alias WHV_X64_PENDING_EVENT_TYPE = int;
enum : int
{
    WHvX64PendingEventException = 0x00000000,
    WHvX64PendingEventExtInt    = 0x00000005,
}

union WHV_X64_PENDING_EXCEPTION_EVENT
{
    struct
    {
        uint _bitfield0;
        uint ErrorCode;
        ulong ExceptionParameter;
    }
    WHV_UINT128 AsUINT128;
}
union WHV_X64_PENDING_EXT_INT_EVENT
{
    struct
    {
        ulong _bitfield0;
        ulong Reserved2;
    }
    WHV_UINT128 AsUINT128;
}
union WHV_INTERNAL_ACTIVITY_REGISTER
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
union WHV_X64_PENDING_DEBUG_EXCEPTION
{
    ulong AsUINT64;
    struct
    {
        ulong _bitfield0;
    }
}
struct WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
{
    ushort DeliverableSints;
    ushort Reserved1;
    uint Reserved2;
}
union WHV_REGISTER_VALUE
{
    WHV_UINT128 Reg128;
    ulong Reg64;
    uint Reg32;
    ushort Reg16;
    ubyte Reg8;
    WHV_X64_FP_REGISTER Fp;
    WHV_X64_FP_CONTROL_STATUS_REGISTER FpControlStatus;
    WHV_X64_XMM_CONTROL_STATUS_REGISTER XmmControlStatus;
    WHV_X64_SEGMENT_REGISTER Segment;
    WHV_X64_TABLE_REGISTER Table;
    WHV_X64_INTERRUPT_STATE_REGISTER InterruptState;
    WHV_X64_PENDING_INTERRUPTION_REGISTER PendingInterruption;
    WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER DeliverabilityNotifications;
    WHV_X64_PENDING_EXCEPTION_EVENT ExceptionEvent;
    WHV_X64_PENDING_EXT_INT_EVENT ExtIntEvent;
    WHV_INTERNAL_ACTIVITY_REGISTER InternalActivity;
    WHV_X64_PENDING_DEBUG_EXCEPTION PendingDebugException;
}
alias WHV_RUN_VP_EXIT_REASON = int;
enum : int
{
    WHvRunVpExitReasonNone                   = 0x00000000,
    WHvRunVpExitReasonMemoryAccess           = 0x00000001,
    WHvRunVpExitReasonX64IoPortAccess        = 0x00000002,
    WHvRunVpExitReasonUnrecoverableException = 0x00000004,
    WHvRunVpExitReasonInvalidVpRegisterValue = 0x00000005,
    WHvRunVpExitReasonUnsupportedFeature     = 0x00000006,
    WHvRunVpExitReasonX64InterruptWindow     = 0x00000007,
    WHvRunVpExitReasonX64Halt                = 0x00000008,
    WHvRunVpExitReasonX64ApicEoi             = 0x00000009,
    WHvRunVpExitReasonSynicSintDeliverable   = 0x0000000a,
    WHvRunVpExitReasonX64MsrAccess           = 0x00001000,
    WHvRunVpExitReasonX64Cpuid               = 0x00001001,
    WHvRunVpExitReasonException              = 0x00001002,
    WHvRunVpExitReasonX64Rdtsc               = 0x00001003,
    WHvRunVpExitReasonX64ApicSmiTrap         = 0x00001004,
    WHvRunVpExitReasonHypercall              = 0x00001005,
    WHvRunVpExitReasonX64ApicInitSipiTrap    = 0x00001006,
    WHvRunVpExitReasonX64ApicWriteTrap       = 0x00001007,
    WHvRunVpExitReasonCanceled               = 0x00002001,
}

union WHV_X64_VP_EXECUTION_STATE
{
    struct
    {
        ushort _bitfield0;
    }
    ushort AsUINT16;
}
struct WHV_VP_EXIT_CONTEXT
{
    WHV_X64_VP_EXECUTION_STATE ExecutionState;
    ubyte _bitfield0;
    ubyte Reserved;
    uint Reserved2;
    WHV_X64_SEGMENT_REGISTER Cs;
    ulong Rip;
    ulong Rflags;
}
union WHV_MEMORY_ACCESS_INFO
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUINT32;
}
struct WHV_MEMORY_ACCESS_CONTEXT
{
    ubyte InstructionByteCount;
    ubyte[3] Reserved;
    ubyte[16] InstructionBytes;
    WHV_MEMORY_ACCESS_INFO AccessInfo;
    ulong Gpa;
    ulong Gva;
}
union WHV_X64_IO_PORT_ACCESS_INFO
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUINT32;
}
struct WHV_X64_IO_PORT_ACCESS_CONTEXT
{
    ubyte InstructionByteCount;
    ubyte[3] Reserved;
    ubyte[16] InstructionBytes;
    WHV_X64_IO_PORT_ACCESS_INFO AccessInfo;
    ushort PortNumber;
    ushort[3] Reserved2;
    ulong Rax;
    ulong Rcx;
    ulong Rsi;
    ulong Rdi;
    WHV_X64_SEGMENT_REGISTER Ds;
    WHV_X64_SEGMENT_REGISTER Es;
}
union WHV_X64_MSR_ACCESS_INFO
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUINT32;
}
struct WHV_X64_MSR_ACCESS_CONTEXT
{
    WHV_X64_MSR_ACCESS_INFO AccessInfo;
    uint MsrNumber;
    ulong Rax;
    ulong Rdx;
}
struct WHV_X64_CPUID_ACCESS_CONTEXT
{
    ulong Rax;
    ulong Rcx;
    ulong Rdx;
    ulong Rbx;
    ulong DefaultResultRax;
    ulong DefaultResultRcx;
    ulong DefaultResultRdx;
    ulong DefaultResultRbx;
}
union WHV_VP_EXCEPTION_INFO
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUINT32;
}
struct WHV_VP_EXCEPTION_CONTEXT
{
    ubyte InstructionByteCount;
    ubyte[3] Reserved;
    ubyte[16] InstructionBytes;
    WHV_VP_EXCEPTION_INFO ExceptionInfo;
    ubyte ExceptionType;
    ubyte[3] Reserved2;
    uint ErrorCode;
    ulong ExceptionParameter;
}
alias WHV_X64_UNSUPPORTED_FEATURE_CODE = int;
enum : int
{
    WHvUnsupportedFeatureIntercept     = 0x00000001,
    WHvUnsupportedFeatureTaskSwitchTss = 0x00000002,
}

struct WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
{
    WHV_X64_UNSUPPORTED_FEATURE_CODE FeatureCode;
    uint Reserved;
    ulong FeatureParameter;
}
alias WHV_RUN_VP_CANCEL_REASON = int;
enum : int
{
    WHvRunVpCancelReasonUser = 0x00000000,
}

struct WHV_RUN_VP_CANCELED_CONTEXT
{
    WHV_RUN_VP_CANCEL_REASON CancelReason;
}
alias WHV_X64_PENDING_INTERRUPTION_TYPE = int;
enum : int
{
    WHvX64PendingInterrupt = 0x00000000,
    WHvX64PendingNmi       = 0x00000002,
    WHvX64PendingException = 0x00000003,
}

struct WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
{
    WHV_X64_PENDING_INTERRUPTION_TYPE DeliverableType;
}
struct WHV_X64_APIC_EOI_CONTEXT
{
    uint InterruptVector;
}
union WHV_X64_RDTSC_INFO
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUINT64;
}
struct WHV_X64_RDTSC_CONTEXT
{
    ulong TscAux;
    ulong VirtualOffset;
    ulong Tsc;
    ulong ReferenceTime;
    WHV_X64_RDTSC_INFO RdtscInfo;
}
struct WHV_X64_APIC_SMI_CONTEXT
{
    ulong ApicIcr;
}
struct WHV_HYPERCALL_CONTEXT
{
    ulong Rax;
    ulong Rbx;
    ulong Rcx;
    ulong Rdx;
    ulong R8;
    ulong Rsi;
    ulong Rdi;
    ulong Reserved0;
    WHV_UINT128[6] XmmRegisters;
    ulong[2] Reserved1;
}
struct WHV_X64_APIC_INIT_SIPI_CONTEXT
{
    ulong ApicIcr;
}
alias WHV_X64_APIC_WRITE_TYPE = int;
enum : int
{
    WHvX64ApicWriteTypeLdr   = 0x000000d0,
    WHvX64ApicWriteTypeDfr   = 0x000000e0,
    WHvX64ApicWriteTypeSvr   = 0x000000f0,
    WHvX64ApicWriteTypeLint0 = 0x00000350,
    WHvX64ApicWriteTypeLint1 = 0x00000360,
}

struct WHV_X64_APIC_WRITE_CONTEXT
{
    WHV_X64_APIC_WRITE_TYPE Type;
    uint Reserved;
    ulong WriteValue;
}
struct WHV_RUN_VP_EXIT_CONTEXT
{
    WHV_RUN_VP_EXIT_REASON ExitReason;
    uint Reserved;
    WHV_VP_EXIT_CONTEXT VpContext;
    union
    {
        WHV_MEMORY_ACCESS_CONTEXT MemoryAccess;
        WHV_X64_IO_PORT_ACCESS_CONTEXT IoPortAccess;
        WHV_X64_MSR_ACCESS_CONTEXT MsrAccess;
        WHV_X64_CPUID_ACCESS_CONTEXT CpuidAccess;
        WHV_VP_EXCEPTION_CONTEXT VpException;
        WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT InterruptWindow;
        WHV_X64_UNSUPPORTED_FEATURE_CONTEXT UnsupportedFeature;
        WHV_RUN_VP_CANCELED_CONTEXT CancelReason;
        WHV_X64_APIC_EOI_CONTEXT ApicEoi;
        WHV_X64_RDTSC_CONTEXT ReadTsc;
        WHV_X64_APIC_SMI_CONTEXT ApicSmi;
        WHV_HYPERCALL_CONTEXT Hypercall;
        WHV_X64_APIC_INIT_SIPI_CONTEXT ApicInitSipi;
        WHV_X64_APIC_WRITE_CONTEXT ApicWrite;
        WHV_SYNIC_SINT_DELIVERABLE_CONTEXT SynicSintDeliverable;
    }
}
alias WHV_INTERRUPT_TYPE = int;
enum : int
{
    WHvX64InterruptTypeFixed          = 0x00000000,
    WHvX64InterruptTypeLowestPriority = 0x00000001,
    WHvX64InterruptTypeNmi            = 0x00000004,
    WHvX64InterruptTypeInit           = 0x00000005,
    WHvX64InterruptTypeSipi           = 0x00000006,
    WHvX64InterruptTypeLocalInt1      = 0x00000009,
}

alias WHV_INTERRUPT_DESTINATION_MODE = int;
enum : int
{
    WHvX64InterruptDestinationModePhysical = 0x00000000,
    WHvX64InterruptDestinationModeLogical  = 0x00000001,
}

alias WHV_INTERRUPT_TRIGGER_MODE = int;
enum : int
{
    WHvX64InterruptTriggerModeEdge  = 0x00000000,
    WHvX64InterruptTriggerModeLevel = 0x00000001,
}

struct WHV_INTERRUPT_CONTROL
{
    ulong _bitfield0;
    uint Destination;
    uint Vector;
}
struct WHV_DOORBELL_MATCH_DATA
{
    ulong GuestAddress;
    ulong Value;
    uint Length;
    uint _bitfield0;
}
alias WHV_PARTITION_COUNTER_SET = int;
enum : int
{
    WHvPartitionCounterSetMemory = 0x00000000,
}

struct WHV_PARTITION_MEMORY_COUNTERS
{
    ulong Mapped4KPageCount;
    ulong Mapped2MPageCount;
    ulong Mapped1GPageCount;
}
alias WHV_PROCESSOR_COUNTER_SET = int;
enum : int
{
    WHvProcessorCounterSetRuntime           = 0x00000000,
    WHvProcessorCounterSetIntercepts        = 0x00000001,
    WHvProcessorCounterSetEvents            = 0x00000002,
    WHvProcessorCounterSetApic              = 0x00000003,
    WHvProcessorCounterSetSyntheticFeatures = 0x00000004,
}

struct WHV_PROCESSOR_RUNTIME_COUNTERS
{
    ulong TotalRuntime100ns;
    ulong HypervisorRuntime100ns;
}
struct WHV_PROCESSOR_INTERCEPT_COUNTER
{
    ulong Count;
    ulong Time100ns;
}
struct WHV_PROCESSOR_INTERCEPT_COUNTERS
{
    WHV_PROCESSOR_INTERCEPT_COUNTER PageInvalidations;
    WHV_PROCESSOR_INTERCEPT_COUNTER ControlRegisterAccesses;
    WHV_PROCESSOR_INTERCEPT_COUNTER IoInstructions;
    WHV_PROCESSOR_INTERCEPT_COUNTER HaltInstructions;
    WHV_PROCESSOR_INTERCEPT_COUNTER CpuidInstructions;
    WHV_PROCESSOR_INTERCEPT_COUNTER MsrAccesses;
    WHV_PROCESSOR_INTERCEPT_COUNTER OtherIntercepts;
    WHV_PROCESSOR_INTERCEPT_COUNTER PendingInterrupts;
    WHV_PROCESSOR_INTERCEPT_COUNTER EmulatedInstructions;
    WHV_PROCESSOR_INTERCEPT_COUNTER DebugRegisterAccesses;
    WHV_PROCESSOR_INTERCEPT_COUNTER PageFaultIntercepts;
    WHV_PROCESSOR_INTERCEPT_COUNTER NestedPageFaultIntercepts;
    WHV_PROCESSOR_INTERCEPT_COUNTER Hypercalls;
    WHV_PROCESSOR_INTERCEPT_COUNTER RdpmcInstructions;
}
struct WHV_PROCESSOR_EVENT_COUNTERS
{
    ulong PageFaultCount;
    ulong ExceptionCount;
    ulong InterruptCount;
}
struct WHV_PROCESSOR_APIC_COUNTERS
{
    ulong MmioAccessCount;
    ulong EoiAccessCount;
    ulong TprAccessCount;
    ulong SentIpiCount;
    ulong SelfIpiCount;
}
struct WHV_PROCESSOR_SYNTHETIC_FEATURES_COUNTERS
{
    ulong SyntheticInterruptsCount;
    ulong LongSpinWaitHypercallsCount;
    ulong OtherHypercallsCount;
    ulong SyntheticInterruptHypercallsCount;
    ulong VirtualInterruptHypercallsCount;
    ulong VirtualMmuHypercallsCount;
}
alias WHV_ADVISE_GPA_RANGE_CODE = int;
enum : int
{
    WHvAdviseGpaRangeCodePopulate = 0x00000000,
    WHvAdviseGpaRangeCodePin      = 0x00000001,
    WHvAdviseGpaRangeCodeUnpin    = 0x00000002,
}

alias WHV_VIRTUAL_PROCESSOR_STATE_TYPE = int;
enum : int
{
    WHvVirtualProcessorStateTypeSynicMessagePage          = 0x00000000,
    WHvVirtualProcessorStateTypeSynicEventFlagPage        = 0x00000001,
    WHvVirtualProcessorStateTypeSynicTimerState           = 0x00000002,
    WHvVirtualProcessorStateTypeInterruptControllerState2 = 0x00001000,
    WHvVirtualProcessorStateTypeXsaveState                = 0x00001001,
}

struct WHV_SYNIC_EVENT_PARAMETERS
{
    uint VpIndex;
    ubyte TargetSint;
    ubyte Reserved;
    ushort FlagNumber;
}
alias WHV_ALLOCATE_VPCI_RESOURCE_FLAGS = int;
enum : int
{
    WHvAllocateVpciResourceFlagNone           = 0x00000000,
    WHvAllocateVpciResourceFlagAllowDirectP2P = 0x00000001,
}

struct WHV_SRIOV_RESOURCE_DESCRIPTOR
{
    wchar[200] PnpInstanceId;
    LUID VirtualFunctionId;
    ushort VirtualFunctionIndex;
    ushort Reserved;
}
alias WHV_VPCI_DEVICE_NOTIFICATION_TYPE = int;
enum : int
{
    WHvVpciDeviceNotificationUndefined       = 0x00000000,
    WHvVpciDeviceNotificationMmioRemapping   = 0x00000001,
    WHvVpciDeviceNotificationSurpriseRemoval = 0x00000002,
}

struct WHV_VPCI_DEVICE_NOTIFICATION
{
    WHV_VPCI_DEVICE_NOTIFICATION_TYPE NotificationType;
    uint Reserved1;
    union
    {
        ulong Reserved2;
    }
}
alias WHV_CREATE_VPCI_DEVICE_FLAGS = int;
enum : int
{
    WHvCreateVpciDeviceFlagNone                 = 0x00000000,
    WHvCreateVpciDeviceFlagPhysicallyBacked     = 0x00000001,
    WHvCreateVpciDeviceFlagUseLogicalInterrupts = 0x00000002,
}

alias WHV_VPCI_DEVICE_PROPERTY_CODE = int;
enum : int
{
    WHvVpciDevicePropertyCodeUndefined   = 0x00000000,
    WHvVpciDevicePropertyCodeHardwareIDs = 0x00000001,
    WHvVpciDevicePropertyCodeProbedBARs  = 0x00000002,
}

struct WHV_VPCI_HARDWARE_IDS
{
    ushort VendorID;
    ushort DeviceID;
    ubyte RevisionID;
    ubyte ProgIf;
    ubyte SubClass;
    ubyte BaseClass;
    ushort SubVendorID;
    ushort SubSystemID;
}
alias WHV_VPCI_PROBED_BARS = uint;
alias WHV_VPCI_MMIO_RANGE_FLAGS = int;
enum : int
{
    WHvVpciMmioRangeFlagReadAccess  = 0x00000001,
    WHvVpciMmioRangeFlagWriteAccess = 0x00000002,
}

alias WHV_VPCI_DEVICE_REGISTER_SPACE = int;
enum : int
{
    WHvVpciConfigSpace = 0xffffffff,
    WHvVpciBar0        = 0x00000000,
    WHvVpciBar1        = 0x00000001,
    WHvVpciBar2        = 0x00000002,
    WHvVpciBar3        = 0x00000003,
    WHvVpciBar4        = 0x00000004,
    WHvVpciBar5        = 0x00000005,
}

struct WHV_VPCI_MMIO_MAPPING
{
    WHV_VPCI_DEVICE_REGISTER_SPACE Location;
    WHV_VPCI_MMIO_RANGE_FLAGS Flags;
    ulong SizeInBytes;
    ulong OffsetInBytes;
    void* VirtualAddress;
}
struct WHV_VPCI_DEVICE_REGISTER
{
    WHV_VPCI_DEVICE_REGISTER_SPACE Location;
    uint SizeInBytes;
    ulong OffsetInBytes;
}
alias WHV_VPCI_INTERRUPT_TARGET_FLAGS = int;
enum : int
{
    WHvVpciInterruptTargetFlagNone      = 0x00000000,
    WHvVpciInterruptTargetFlagMulticast = 0x00000001,
}

struct WHV_VPCI_INTERRUPT_TARGET
{
    uint Vector;
    WHV_VPCI_INTERRUPT_TARGET_FLAGS Flags;
    uint ProcessorCount;
    uint[1] Processors;
}
alias WHV_TRIGGER_TYPE = int;
enum : int
{
    WHvTriggerTypeInterrupt       = 0x00000000,
    WHvTriggerTypeSynicEvent      = 0x00000001,
    WHvTriggerTypeDeviceInterrupt = 0x00000002,
}

struct WHV_TRIGGER_PARAMETERS
{
    WHV_TRIGGER_TYPE TriggerType;
    uint Reserved;
    union
    {
        WHV_INTERRUPT_CONTROL Interrupt;
        WHV_SYNIC_EVENT_PARAMETERS SynicEvent;
        struct _DeviceInterrupt_e__Struct
        {
            ulong LogicalDeviceId;
            ulong MsiAddress;
            uint MsiData;
            uint Reserved;
        }
    }
}
alias WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE = int;
enum : int
{
    WHvVirtualProcessorPropertyCodeNumaNode = 0x00000000,
}

struct WHV_VIRTUAL_PROCESSOR_PROPERTY
{
    WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE PropertyCode;
    uint Reserved;
    union
    {
        ushort NumaNode;
        ulong Padding;
    }
}
alias WHV_NOTIFICATION_PORT_TYPE = int;
enum : int
{
    WHvNotificationPortTypeEvent    = 0x00000002,
    WHvNotificationPortTypeDoorbell = 0x00000004,
}

struct WHV_NOTIFICATION_PORT_PARAMETERS
{
    WHV_NOTIFICATION_PORT_TYPE NotificationPortType;
    uint Reserved;
    union
    {
        WHV_DOORBELL_MATCH_DATA Doorbell;
        struct _Event_e__Struct
        {
            uint ConnectionId;
        }
    }
}
alias WHV_NOTIFICATION_PORT_PROPERTY_CODE = int;
enum : int
{
    WHvNotificationPortPropertyPreferredTargetVp       = 0x00000001,
    WHvNotificationPortPropertyPreferredTargetDuration = 0x00000005,
}

union WHV_EMULATOR_STATUS
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUINT32;
}
struct WHV_EMULATOR_MEMORY_ACCESS_INFO
{
    ulong GpaAddress;
    ubyte Direction;
    ubyte AccessSize;
    ubyte[8] Data;
}
struct WHV_EMULATOR_IO_ACCESS_INFO
{
    ubyte Direction;
    ushort Port;
    ushort AccessSize;
    uint Data;
}
alias WHV_EMULATOR_IO_PORT_CALLBACK = HRESULT function(void*, WHV_EMULATOR_IO_ACCESS_INFO*);
alias WHV_EMULATOR_MEMORY_CALLBACK = HRESULT function(void*, WHV_EMULATOR_MEMORY_ACCESS_INFO*);
alias WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = HRESULT function(void*, const(WHV_REGISTER_NAME)*, uint, WHV_REGISTER_VALUE*);
alias WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = HRESULT function(void*, const(WHV_REGISTER_NAME)*, uint, const(WHV_REGISTER_VALUE)*);
alias WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK = HRESULT function(void*, ulong, WHV_TRANSLATE_GVA_FLAGS, WHV_TRANSLATE_GVA_RESULT_CODE*, ulong*);
struct WHV_EMULATOR_CALLBACKS
{
    uint Size;
    uint Reserved;
    WHV_EMULATOR_IO_PORT_CALLBACK WHvEmulatorIoPortCallback;
    WHV_EMULATOR_MEMORY_CALLBACK WHvEmulatorMemoryCallback;
    WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK WHvEmulatorGetVirtualProcessorRegisters;
    WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK WHvEmulatorSetVirtualProcessorRegisters;
    WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK WHvEmulatorTranslateGvaPage;
}
struct SOCKADDR_HV
{
    ADDRESS_FAMILY Family;
    ushort Reserved;
    GUID VmId;
    GUID ServiceId;
}
struct HVSOCKET_ADDRESS_INFO
{
    GUID SystemId;
    GUID VirtualMachineId;
    GUID SiloId;
    uint Flags;
}
struct VM_GENCOUNTER
{
    ulong GenerationCount;
    ulong GenerationCountHigh;
}
alias HDV_DEVICE_TYPE = int;
enum : int
{
    HdvDeviceTypeUndefined = 0x00000000,
    HdvDeviceTypePCI       = 0x00000001,
}

alias HDV_DEVICE_HOST_FLAGS = int;
enum : int
{
    HdvDeviceHostFlagNone                  = 0x00000000,
    HdvDeviceHostFlagInitializeComSecurity = 0x00000001,
}

struct HDV_PCI_PNP_ID
{
    ushort VendorID;
    ushort DeviceID;
    ubyte RevisionID;
    ubyte ProgIf;
    ubyte SubClass;
    ubyte BaseClass;
    ushort SubVendorID;
    ushort SubSystemID;
}
alias HDV_PCI_BAR_SELECTOR = int;
enum : int
{
    HDV_PCI_BAR0 = 0x00000000,
    HDV_PCI_BAR1 = 0x00000001,
    HDV_PCI_BAR2 = 0x00000002,
    HDV_PCI_BAR3 = 0x00000003,
    HDV_PCI_BAR4 = 0x00000004,
    HDV_PCI_BAR5 = 0x00000005,
}

alias HDV_DOORBELL_FLAGS = int;
enum : int
{
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY   = 0x00000000,
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE  = 0x00000001,
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD  = 0x00000002,
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD = 0x00000003,
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD = 0x00000004,
    HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE  = 0x80000000,
}

alias HDV_MMIO_MAPPING_FLAGS = int;
enum : int
{
    HdvMmioMappingFlagNone       = 0x00000000,
    HdvMmioMappingFlagWriteable  = 0x00000001,
    HdvMmioMappingFlagExecutable = 0x00000002,
}

alias HDV_PCI_DEVICE_INITIALIZE = HRESULT function(void*);
alias HDV_PCI_DEVICE_TEARDOWN = void function(void*);
alias HDV_PCI_DEVICE_SET_CONFIGURATION = HRESULT function(void*, uint, const(wchar)**);
alias HDV_PCI_DEVICE_GET_DETAILS = HRESULT function(void*, HDV_PCI_PNP_ID*, uint, uint*);
alias HDV_PCI_DEVICE_START = HRESULT function(void*);
alias HDV_PCI_DEVICE_STOP = void function(void*);
alias HDV_PCI_READ_CONFIG_SPACE = HRESULT function(void*, uint, uint*);
alias HDV_PCI_WRITE_CONFIG_SPACE = HRESULT function(void*, uint, uint);
alias HDV_PCI_READ_INTERCEPTED_MEMORY = HRESULT function(void*, HDV_PCI_BAR_SELECTOR, ulong, ulong, ubyte*);
alias HDV_PCI_WRITE_INTERCEPTED_MEMORY = HRESULT function(void*, HDV_PCI_BAR_SELECTOR, ulong, ulong, const(ubyte)*);
alias HDV_PCI_INTERFACE_VERSION = int;
enum : int
{
    HdvPciDeviceInterfaceVersionInvalid = 0x00000000,
    HdvPciDeviceInterfaceVersion1       = 0x00000001,
}

struct HDV_PCI_DEVICE_INTERFACE
{
    HDV_PCI_INTERFACE_VERSION Version;
    HDV_PCI_DEVICE_INITIALIZE Initialize;
    HDV_PCI_DEVICE_TEARDOWN Teardown;
    HDV_PCI_DEVICE_SET_CONFIGURATION SetConfiguration;
    HDV_PCI_DEVICE_GET_DETAILS GetDetails;
    HDV_PCI_DEVICE_START Start;
    HDV_PCI_DEVICE_STOP Stop;
    HDV_PCI_READ_CONFIG_SPACE ReadConfigSpace;
    HDV_PCI_WRITE_CONFIG_SPACE WriteConfigSpace;
    HDV_PCI_READ_INTERCEPTED_MEMORY ReadInterceptedMemory;
    HDV_PCI_WRITE_INTERCEPTED_MEMORY WriteInterceptedMemory;
}
alias PAGING_MODE = int;
enum : int
{
    Paging_Invalid  = 0x00000000,
    Paging_NonPaged = 0x00000001,
    Paging_32Bit    = 0x00000002,
    Paging_Pae      = 0x00000003,
    Paging_Long     = 0x00000004,
    Paging_Armv8    = 0x00000005,
}

struct GPA_MEMORY_CHUNK
{
    ulong GuestPhysicalStartPageIndex;
    ulong PageCount;
}
alias VIRTUAL_PROCESSOR_ARCH = int;
enum : int
{
    Arch_Unknown = 0x00000000,
    Arch_x86     = 0x00000001,
    Arch_x64     = 0x00000002,
    Arch_Armv8   = 0x00000003,
}

alias VIRTUAL_PROCESSOR_VENDOR = int;
enum : int
{
    ProcessorVendor_Unknown = 0x00000000,
    ProcessorVendor_Amd     = 0x00000001,
    ProcessorVendor_Intel   = 0x00000002,
    ProcessorVendor_Hygon   = 0x00000003,
    ProcessorVendor_Arm     = 0x00000004,
}

alias GUEST_OS_VENDOR = int;
enum : int
{
    GuestOsVendorUndefined = 0x00000000,
    GuestOsVendorMicrosoft = 0x00000001,
    GuestOsVendorHPE       = 0x00000002,
    GuestOsVendorLANCOM    = 0x00000200,
}

alias GUEST_OS_MICROSOFT_IDS = int;
enum : int
{
    GuestOsMicrosoftUndefined = 0x00000000,
    GuestOsMicrosoftMSDOS     = 0x00000001,
    GuestOsMicrosoftWindows3x = 0x00000002,
    GuestOsMicrosoftWindows9x = 0x00000003,
    GuestOsMicrosoftWindowsNT = 0x00000004,
    GuestOsMicrosoftWindowsCE = 0x00000005,
}

alias GUEST_OS_OPENSOURCE_IDS = int;
enum : int
{
    GuestOsOpenSourceUndefined = 0x00000000,
    GuestOsOpenSourceLinux     = 0x00000001,
    GuestOsOpenSourceFreeBSD   = 0x00000002,
    GuestOsOpenSourceXen       = 0x00000003,
    GuestOsOpenSourceIllumos   = 0x00000004,
}

union GUEST_OS_INFO
{
    ulong AsUINT64;
    struct _ClosedSource_e__Struct
    {
        ulong _bitfield0;
    }
    struct _OpenSource_e__Struct
    {
        ulong _bitfield1;
    }
}
alias REGISTER_ID = int;
enum : int
{
    X64_RegisterRax              = 0x00000000,
    X64_RegisterRcx              = 0x00000001,
    X64_RegisterRdx              = 0x00000002,
    X64_RegisterRbx              = 0x00000003,
    X64_RegisterRsp              = 0x00000004,
    X64_RegisterRbp              = 0x00000005,
    X64_RegisterRsi              = 0x00000006,
    X64_RegisterRdi              = 0x00000007,
    X64_RegisterR8               = 0x00000008,
    X64_RegisterR9               = 0x00000009,
    X64_RegisterR10              = 0x0000000a,
    X64_RegisterR11              = 0x0000000b,
    X64_RegisterR12              = 0x0000000c,
    X64_RegisterR13              = 0x0000000d,
    X64_RegisterR14              = 0x0000000e,
    X64_RegisterR15              = 0x0000000f,
    X64_RegisterRip              = 0x00000010,
    X64_RegisterRFlags           = 0x00000011,
    X64_RegisterXmm0             = 0x00000012,
    X64_RegisterXmm1             = 0x00000013,
    X64_RegisterXmm2             = 0x00000014,
    X64_RegisterXmm3             = 0x00000015,
    X64_RegisterXmm4             = 0x00000016,
    X64_RegisterXmm5             = 0x00000017,
    X64_RegisterXmm6             = 0x00000018,
    X64_RegisterXmm7             = 0x00000019,
    X64_RegisterXmm8             = 0x0000001a,
    X64_RegisterXmm9             = 0x0000001b,
    X64_RegisterXmm10            = 0x0000001c,
    X64_RegisterXmm11            = 0x0000001d,
    X64_RegisterXmm12            = 0x0000001e,
    X64_RegisterXmm13            = 0x0000001f,
    X64_RegisterXmm14            = 0x00000020,
    X64_RegisterXmm15            = 0x00000021,
    X64_RegisterFpMmx0           = 0x00000022,
    X64_RegisterFpMmx1           = 0x00000023,
    X64_RegisterFpMmx2           = 0x00000024,
    X64_RegisterFpMmx3           = 0x00000025,
    X64_RegisterFpMmx4           = 0x00000026,
    X64_RegisterFpMmx5           = 0x00000027,
    X64_RegisterFpMmx6           = 0x00000028,
    X64_RegisterFpMmx7           = 0x00000029,
    X64_RegisterFpControlStatus  = 0x0000002a,
    X64_RegisterXmmControlStatus = 0x0000002b,
    X64_RegisterCr0              = 0x0000002c,
    X64_RegisterCr2              = 0x0000002d,
    X64_RegisterCr3              = 0x0000002e,
    X64_RegisterCr4              = 0x0000002f,
    X64_RegisterCr8              = 0x00000030,
    X64_RegisterEfer             = 0x00000031,
    X64_RegisterDr0              = 0x00000032,
    X64_RegisterDr1              = 0x00000033,
    X64_RegisterDr2              = 0x00000034,
    X64_RegisterDr3              = 0x00000035,
    X64_RegisterDr6              = 0x00000036,
    X64_RegisterDr7              = 0x00000037,
    X64_RegisterEs               = 0x00000038,
    X64_RegisterCs               = 0x00000039,
    X64_RegisterSs               = 0x0000003a,
    X64_RegisterDs               = 0x0000003b,
    X64_RegisterFs               = 0x0000003c,
    X64_RegisterGs               = 0x0000003d,
    X64_RegisterLdtr             = 0x0000003e,
    X64_RegisterTr               = 0x0000003f,
    X64_RegisterIdtr             = 0x00000040,
    X64_RegisterGdtr             = 0x00000041,
    X64_RegisterMax              = 0x00000042,
    ARM64_RegisterX0             = 0x00000043,
    ARM64_RegisterX1             = 0x00000044,
    ARM64_RegisterX2             = 0x00000045,
    ARM64_RegisterX3             = 0x00000046,
    ARM64_RegisterX4             = 0x00000047,
    ARM64_RegisterX5             = 0x00000048,
    ARM64_RegisterX6             = 0x00000049,
    ARM64_RegisterX7             = 0x0000004a,
    ARM64_RegisterX8             = 0x0000004b,
    ARM64_RegisterX9             = 0x0000004c,
    ARM64_RegisterX10            = 0x0000004d,
    ARM64_RegisterX11            = 0x0000004e,
    ARM64_RegisterX12            = 0x0000004f,
    ARM64_RegisterX13            = 0x00000050,
    ARM64_RegisterX14            = 0x00000051,
    ARM64_RegisterX15            = 0x00000052,
    ARM64_RegisterX16            = 0x00000053,
    ARM64_RegisterX17            = 0x00000054,
    ARM64_RegisterX18            = 0x00000055,
    ARM64_RegisterX19            = 0x00000056,
    ARM64_RegisterX20            = 0x00000057,
    ARM64_RegisterX21            = 0x00000058,
    ARM64_RegisterX22            = 0x00000059,
    ARM64_RegisterX23            = 0x0000005a,
    ARM64_RegisterX24            = 0x0000005b,
    ARM64_RegisterX25            = 0x0000005c,
    ARM64_RegisterX26            = 0x0000005d,
    ARM64_RegisterX27            = 0x0000005e,
    ARM64_RegisterX28            = 0x0000005f,
    ARM64_RegisterXFp            = 0x00000060,
    ARM64_RegisterXLr            = 0x00000061,
    ARM64_RegisterPc             = 0x00000062,
    ARM64_RegisterSpEl0          = 0x00000063,
    ARM64_RegisterSpEl1          = 0x00000064,
    ARM64_RegisterCpsr           = 0x00000065,
    ARM64_RegisterQ0             = 0x00000066,
    ARM64_RegisterQ1             = 0x00000067,
    ARM64_RegisterQ2             = 0x00000068,
    ARM64_RegisterQ3             = 0x00000069,
    ARM64_RegisterQ4             = 0x0000006a,
    ARM64_RegisterQ5             = 0x0000006b,
    ARM64_RegisterQ6             = 0x0000006c,
    ARM64_RegisterQ7             = 0x0000006d,
    ARM64_RegisterQ8             = 0x0000006e,
    ARM64_RegisterQ9             = 0x0000006f,
    ARM64_RegisterQ10            = 0x00000070,
    ARM64_RegisterQ11            = 0x00000071,
    ARM64_RegisterQ12            = 0x00000072,
    ARM64_RegisterQ13            = 0x00000073,
    ARM64_RegisterQ14            = 0x00000074,
    ARM64_RegisterQ15            = 0x00000075,
    ARM64_RegisterQ16            = 0x00000076,
    ARM64_RegisterQ17            = 0x00000077,
    ARM64_RegisterQ18            = 0x00000078,
    ARM64_RegisterQ19            = 0x00000079,
    ARM64_RegisterQ20            = 0x0000007a,
    ARM64_RegisterQ21            = 0x0000007b,
    ARM64_RegisterQ22            = 0x0000007c,
    ARM64_RegisterQ23            = 0x0000007d,
    ARM64_RegisterQ24            = 0x0000007e,
    ARM64_RegisterQ25            = 0x0000007f,
    ARM64_RegisterQ26            = 0x00000080,
    ARM64_RegisterQ27            = 0x00000081,
    ARM64_RegisterQ28            = 0x00000082,
    ARM64_RegisterQ29            = 0x00000083,
    ARM64_RegisterQ30            = 0x00000084,
    ARM64_RegisterQ31            = 0x00000085,
    ARM64_RegisterFpStatus       = 0x00000086,
    ARM64_RegisterFpControl      = 0x00000087,
    ARM64_RegisterEsrEl1         = 0x00000088,
    ARM64_RegisterSpsrEl1        = 0x00000089,
    ARM64_RegisterFarEl1         = 0x0000008a,
    ARM64_RegisterParEl1         = 0x0000008b,
    ARM64_RegisterElrEl1         = 0x0000008c,
    ARM64_RegisterTtbr0El1       = 0x0000008d,
    ARM64_RegisterTtbr1El1       = 0x0000008e,
    ARM64_RegisterVbarEl1        = 0x0000008f,
    ARM64_RegisterSctlrEl1       = 0x00000090,
    ARM64_RegisterActlrEl1       = 0x00000091,
    ARM64_RegisterTcrEl1         = 0x00000092,
    ARM64_RegisterMairEl1        = 0x00000093,
    ARM64_RegisterAmairEl1       = 0x00000094,
    ARM64_RegisterTpidrEl0       = 0x00000095,
    ARM64_RegisterTpidrroEl0     = 0x00000096,
    ARM64_RegisterTpidrEl1       = 0x00000097,
    ARM64_RegisterContextIdrEl1  = 0x00000098,
    ARM64_RegisterCpacrEl1       = 0x00000099,
    ARM64_RegisterCsselrEl1      = 0x0000009a,
    ARM64_RegisterCntkctlEl1     = 0x0000009b,
    ARM64_RegisterCntvCvalEl0    = 0x0000009c,
    ARM64_RegisterCntvCtlEl0     = 0x0000009d,
    ARM64_RegisterMax            = 0x0000009e,
}

union VIRTUAL_PROCESSOR_REGISTER
{
    ulong Reg64;
    uint Reg32;
    ushort Reg16;
    ubyte Reg8;
    struct _Reg128_e__Struct
    {
        ulong Low64;
        ulong High64;
    }
    union _X64_e__Union
    {
        struct _Segment_e__Struct
        {
            ulong Base;
            uint Limit;
            ushort Selector;
            union
            {
                ushort Attributes;
                struct
                {
                    ushort _bitfield0;
                }
            }
        }
        struct _Table_e__Struct
        {
            ushort Limit;
            ulong Base;
        }
        struct _FpControlStatus_e__Struct
        {
            ushort FpControl;
            ushort FpStatus;
            ubyte FpTag;
            ubyte Reserved;
            ushort LastFpOp;
            union
            {
                ulong LastFpRip;
                struct
                {
                    uint LastFpEip;
                    ushort LastFpCs;
                }
            }
        }
        struct _XmmControlStatus_e__Struct
        {
            union
            {
                ulong LastFpRdp;
                struct
                {
                    uint LastFpDp;
                    ushort LastFpDs;
                }
            }
            uint XmmStatusControl;
            uint XmmStatusControlMask;
        }
    }
}
struct DOS_IMAGE_INFO
{
    const(char)* PdbName;
    ulong ImageBaseAddress;
    uint ImageSize;
    uint Timestamp;
}
alias GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK = void function(const(char)*);
alias FOUND_IMAGE_CALLBACK = BOOL function(void*, DOS_IMAGE_INFO*);
struct MODULE_INFO
{
    const(char)* ProcessImageName;
    DOS_IMAGE_INFO Image;
}
