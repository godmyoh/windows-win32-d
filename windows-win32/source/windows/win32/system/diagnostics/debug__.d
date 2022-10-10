module windows.win32.system.diagnostics.debug__;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, FARPROC, HANDLE, HANDLE_PTR, HINSTANCE, HRESULT, HWND, LARGE_INTEGER, NTSTATUS, PSTR, PWSTR, SYSTEMTIME;
import windows.win32.security.wintrust : WIN_CERTIFICATE;
import windows.win32.storage.filesystem : VS_FIXEDFILEINFO;
import windows.win32.system.com_ : DISPPARAMS, EXCEPINFO, IDispatch, IStream, ITypeInfo, IUnknown, TYPEDESC, VARENUM, VARIANT;
import windows.win32.system.com.structuredstorage : ILockBytes;
import windows.win32.system.kernel : EXCEPTION_ROUTINE, FLOATING_SAVE_AREA, LIST_ENTRY, LIST_ENTRY32, LIST_ENTRY64;
import windows.win32.system.memory_ : MEMORY_BASIC_INFORMATION64, VIRTUAL_ALLOCATION_TYPE;
import windows.win32.system.ole : CADWORD, CALPOLESTR;
import windows.win32.system.systeminformation : IMAGE_FILE_MACHINE;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE;
import windows.win32.system.time : TIME_ZONE_INFORMATION;
import windows.win32.ui.windowsandmessaging : MESSAGEBOX_STYLE;

version (Windows):
extern (Windows):

alias SYM_LOAD_FLAGS = uint;
enum : uint
{
    SLMFLAG_NONE       = 0x00000000,
    SLMFLAG_VIRTUAL    = 0x00000001,
    SLMFLAG_ALT_INDEX  = 0x00000002,
    SLMFLAG_NO_SYMBOLS = 0x00000004,
}

alias IMAGE_SECTION_CHARACTERISTICS = uint;
enum : uint
{
    IMAGE_SCN_TYPE_NO_PAD            = 0x00000008,
    IMAGE_SCN_CNT_CODE               = 0x00000020,
    IMAGE_SCN_CNT_INITIALIZED_DATA   = 0x00000040,
    IMAGE_SCN_CNT_UNINITIALIZED_DATA = 0x00000080,
    IMAGE_SCN_LNK_OTHER              = 0x00000100,
    IMAGE_SCN_LNK_INFO               = 0x00000200,
    IMAGE_SCN_LNK_REMOVE             = 0x00000800,
    IMAGE_SCN_LNK_COMDAT             = 0x00001000,
    IMAGE_SCN_NO_DEFER_SPEC_EXC      = 0x00004000,
    IMAGE_SCN_GPREL                  = 0x00008000,
    IMAGE_SCN_MEM_FARDATA            = 0x00008000,
    IMAGE_SCN_MEM_PURGEABLE          = 0x00020000,
    IMAGE_SCN_MEM_16BIT              = 0x00020000,
    IMAGE_SCN_MEM_LOCKED             = 0x00040000,
    IMAGE_SCN_MEM_PRELOAD            = 0x00080000,
    IMAGE_SCN_ALIGN_1BYTES           = 0x00100000,
    IMAGE_SCN_ALIGN_2BYTES           = 0x00200000,
    IMAGE_SCN_ALIGN_4BYTES           = 0x00300000,
    IMAGE_SCN_ALIGN_8BYTES           = 0x00400000,
    IMAGE_SCN_ALIGN_16BYTES          = 0x00500000,
    IMAGE_SCN_ALIGN_32BYTES          = 0x00600000,
    IMAGE_SCN_ALIGN_64BYTES          = 0x00700000,
    IMAGE_SCN_ALIGN_128BYTES         = 0x00800000,
    IMAGE_SCN_ALIGN_256BYTES         = 0x00900000,
    IMAGE_SCN_ALIGN_512BYTES         = 0x00a00000,
    IMAGE_SCN_ALIGN_1024BYTES        = 0x00b00000,
    IMAGE_SCN_ALIGN_2048BYTES        = 0x00c00000,
    IMAGE_SCN_ALIGN_4096BYTES        = 0x00d00000,
    IMAGE_SCN_ALIGN_8192BYTES        = 0x00e00000,
    IMAGE_SCN_ALIGN_MASK             = 0x00f00000,
    IMAGE_SCN_LNK_NRELOC_OVFL        = 0x01000000,
    IMAGE_SCN_MEM_DISCARDABLE        = 0x02000000,
    IMAGE_SCN_MEM_NOT_CACHED         = 0x04000000,
    IMAGE_SCN_MEM_NOT_PAGED          = 0x08000000,
    IMAGE_SCN_MEM_SHARED             = 0x10000000,
    IMAGE_SCN_MEM_EXECUTE            = 0x20000000,
    IMAGE_SCN_MEM_READ               = 0x40000000,
    IMAGE_SCN_MEM_WRITE              = 0x80000000,
    IMAGE_SCN_SCALE_INDEX            = 0x00000001,
}

alias IMAGE_SUBSYSTEM = ushort;
enum : ushort
{
    IMAGE_SUBSYSTEM_UNKNOWN                  = 0x0000,
    IMAGE_SUBSYSTEM_NATIVE                   = 0x0001,
    IMAGE_SUBSYSTEM_WINDOWS_GUI              = 0x0002,
    IMAGE_SUBSYSTEM_WINDOWS_CUI              = 0x0003,
    IMAGE_SUBSYSTEM_OS2_CUI                  = 0x0005,
    IMAGE_SUBSYSTEM_POSIX_CUI                = 0x0007,
    IMAGE_SUBSYSTEM_NATIVE_WINDOWS           = 0x0008,
    IMAGE_SUBSYSTEM_WINDOWS_CE_GUI           = 0x0009,
    IMAGE_SUBSYSTEM_EFI_APPLICATION          = 0x000a,
    IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER  = 0x000b,
    IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER       = 0x000c,
    IMAGE_SUBSYSTEM_EFI_ROM                  = 0x000d,
    IMAGE_SUBSYSTEM_XBOX                     = 0x000e,
    IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 0x0010,
    IMAGE_SUBSYSTEM_XBOX_CODE_CATALOG        = 0x0011,
}

alias IMAGE_DLL_CHARACTERISTICS = ushort;
enum : ushort
{
    IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA                               = 0x0020,
    IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE                                  = 0x0040,
    IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY                               = 0x0080,
    IMAGE_DLLCHARACTERISTICS_NX_COMPAT                                     = 0x0100,
    IMAGE_DLLCHARACTERISTICS_NO_ISOLATION                                  = 0x0200,
    IMAGE_DLLCHARACTERISTICS_NO_SEH                                        = 0x0400,
    IMAGE_DLLCHARACTERISTICS_NO_BIND                                       = 0x0800,
    IMAGE_DLLCHARACTERISTICS_APPCONTAINER                                  = 0x1000,
    IMAGE_DLLCHARACTERISTICS_WDM_DRIVER                                    = 0x2000,
    IMAGE_DLLCHARACTERISTICS_GUARD_CF                                      = 0x4000,
    IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE                         = 0x8000,
    IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT                                 = 0x0001,
    IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT_STRICT_MODE                     = 0x0002,
    IMAGE_DLLCHARACTERISTICS_EX_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE = 0x0004,
    IMAGE_DLLCHARACTERISTICS_EX_CET_DYNAMIC_APIS_ALLOW_IN_PROC             = 0x0008,
    IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_1                             = 0x0010,
    IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_2                             = 0x0020,
}

alias IMAGE_OPTIONAL_HEADER_MAGIC = ushort;
enum : ushort
{
    IMAGE_NT_OPTIONAL_HDR_MAGIC   = 0x020b,
    IMAGE_NT_OPTIONAL_HDR32_MAGIC = 0x010b,
    IMAGE_NT_OPTIONAL_HDR64_MAGIC = 0x020b,
    IMAGE_ROM_OPTIONAL_HDR_MAGIC  = 0x0107,
}

alias BUGCHECK_ERROR = uint;
enum : uint
{
    HARDWARE_PROFILE_UNDOCKED_STRING                         = 0x40010001,
    HARDWARE_PROFILE_DOCKED_STRING                           = 0x40010002,
    HARDWARE_PROFILE_UNKNOWN_STRING                          = 0x40010003,
    WINDOWS_NT_BANNER                                        = 0x4000007e,
    WINDOWS_NT_CSD_STRING                                    = 0x40000087,
    WINDOWS_NT_INFO_STRING                                   = 0x40000088,
    WINDOWS_NT_MP_STRING                                     = 0x40000089,
    THREAD_TERMINATE_HELD_MUTEX                              = 0x4000008a,
    WINDOWS_NT_INFO_STRING_PLURAL                            = 0x4000009d,
    WINDOWS_NT_RC_STRING                                     = 0x4000009e,
    APC_INDEX_MISMATCH                                       = 0x00000001,
    DEVICE_QUEUE_NOT_BUSY                                    = 0x00000002,
    INVALID_AFFINITY_SET                                     = 0x00000003,
    INVALID_DATA_ACCESS_TRAP                                 = 0x00000004,
    INVALID_PROCESS_ATTACH_ATTEMPT                           = 0x00000005,
    INVALID_PROCESS_DETACH_ATTEMPT                           = 0x00000006,
    INVALID_SOFTWARE_INTERRUPT                               = 0x00000007,
    IRQL_NOT_DISPATCH_LEVEL                                  = 0x00000008,
    IRQL_NOT_GREATER_OR_EQUAL                                = 0x00000009,
    IRQL_NOT_LESS_OR_EQUAL                                   = 0x0000000a,
    NO_EXCEPTION_HANDLING_SUPPORT                            = 0x0000000b,
    MAXIMUM_WAIT_OBJECTS_EXCEEDED                            = 0x0000000c,
    MUTEX_LEVEL_NUMBER_VIOLATION                             = 0x0000000d,
    NO_USER_MODE_CONTEXT                                     = 0x0000000e,
    SPIN_LOCK_ALREADY_OWNED                                  = 0x0000000f,
    SPIN_LOCK_NOT_OWNED                                      = 0x00000010,
    THREAD_NOT_MUTEX_OWNER                                   = 0x00000011,
    TRAP_CAUSE_UNKNOWN                                       = 0x00000012,
    EMPTY_THREAD_REAPER_LIST                                 = 0x00000013,
    CREATE_DELETE_LOCK_NOT_LOCKED                            = 0x00000014,
    LAST_CHANCE_CALLED_FROM_KMODE                            = 0x00000015,
    CID_HANDLE_CREATION                                      = 0x00000016,
    CID_HANDLE_DELETION                                      = 0x00000017,
    REFERENCE_BY_POINTER                                     = 0x00000018,
    BAD_POOL_HEADER                                          = 0x00000019,
    MEMORY_MANAGEMENT                                        = 0x0000001a,
    PFN_SHARE_COUNT                                          = 0x0000001b,
    PFN_REFERENCE_COUNT                                      = 0x0000001c,
    NO_SPIN_LOCK_AVAILABLE                                   = 0x0000001d,
    KMODE_EXCEPTION_NOT_HANDLED                              = 0x0000001e,
    SHARED_RESOURCE_CONV_ERROR                               = 0x0000001f,
    KERNEL_APC_PENDING_DURING_EXIT                           = 0x00000020,
    QUOTA_UNDERFLOW                                          = 0x00000021,
    FILE_SYSTEM                                              = 0x00000022,
    FAT_FILE_SYSTEM                                          = 0x00000023,
    NTFS_FILE_SYSTEM                                         = 0x00000024,
    NPFS_FILE_SYSTEM                                         = 0x00000025,
    CDFS_FILE_SYSTEM                                         = 0x00000026,
    RDR_FILE_SYSTEM                                          = 0x00000027,
    CORRUPT_ACCESS_TOKEN                                     = 0x00000028,
    SECURITY_SYSTEM                                          = 0x00000029,
    INCONSISTENT_IRP                                         = 0x0000002a,
    PANIC_STACK_SWITCH                                       = 0x0000002b,
    PORT_DRIVER_INTERNAL                                     = 0x0000002c,
    SCSI_DISK_DRIVER_INTERNAL                                = 0x0000002d,
    DATA_BUS_ERROR                                           = 0x0000002e,
    INSTRUCTION_BUS_ERROR                                    = 0x0000002f,
    SET_OF_INVALID_CONTEXT                                   = 0x00000030,
    PHASE0_INITIALIZATION_FAILED                             = 0x00000031,
    PHASE1_INITIALIZATION_FAILED                             = 0x00000032,
    UNEXPECTED_INITIALIZATION_CALL                           = 0x00000033,
    CACHE_MANAGER                                            = 0x00000034,
    NO_MORE_IRP_STACK_LOCATIONS                              = 0x00000035,
    DEVICE_REFERENCE_COUNT_NOT_ZERO                          = 0x00000036,
    FLOPPY_INTERNAL_ERROR                                    = 0x00000037,
    SERIAL_DRIVER_INTERNAL                                   = 0x00000038,
    SYSTEM_EXIT_OWNED_MUTEX                                  = 0x00000039,
    SYSTEM_UNWIND_PREVIOUS_USER                              = 0x0000003a,
    SYSTEM_SERVICE_EXCEPTION                                 = 0x0000003b,
    INTERRUPT_UNWIND_ATTEMPTED                               = 0x0000003c,
    INTERRUPT_EXCEPTION_NOT_HANDLED                          = 0x0000003d,
    MULTIPROCESSOR_CONFIGURATION_NOT_SUPPORTED               = 0x0000003e,
    NO_MORE_SYSTEM_PTES                                      = 0x0000003f,
    TARGET_MDL_TOO_SMALL                                     = 0x00000040,
    MUST_SUCCEED_POOL_EMPTY                                  = 0x00000041,
    ATDISK_DRIVER_INTERNAL                                   = 0x00000042,
    NO_SUCH_PARTITION                                        = 0x00000043,
    MULTIPLE_IRP_COMPLETE_REQUESTS                           = 0x00000044,
    INSUFFICIENT_SYSTEM_MAP_REGS                             = 0x00000045,
    DEREF_UNKNOWN_LOGON_SESSION                              = 0x00000046,
    REF_UNKNOWN_LOGON_SESSION                                = 0x00000047,
    CANCEL_STATE_IN_COMPLETED_IRP                            = 0x00000048,
    PAGE_FAULT_WITH_INTERRUPTS_OFF                           = 0x00000049,
    IRQL_GT_ZERO_AT_SYSTEM_SERVICE                           = 0x0000004a,
    STREAMS_INTERNAL_ERROR                                   = 0x0000004b,
    FATAL_UNHANDLED_HARD_ERROR                               = 0x0000004c,
    NO_PAGES_AVAILABLE                                       = 0x0000004d,
    PFN_LIST_CORRUPT                                         = 0x0000004e,
    NDIS_INTERNAL_ERROR                                      = 0x0000004f,
    PAGE_FAULT_IN_NONPAGED_AREA                              = 0x00000050,
    PAGE_FAULT_IN_NONPAGED_AREA_M                            = 0x10000050,
    REGISTRY_ERROR                                           = 0x00000051,
    MAILSLOT_FILE_SYSTEM                                     = 0x00000052,
    NO_BOOT_DEVICE                                           = 0x00000053,
    LM_SERVER_INTERNAL_ERROR                                 = 0x00000054,
    DATA_COHERENCY_EXCEPTION                                 = 0x00000055,
    INSTRUCTION_COHERENCY_EXCEPTION                          = 0x00000056,
    XNS_INTERNAL_ERROR                                       = 0x00000057,
    VOLMGRX_INTERNAL_ERROR                                   = 0x00000058,
    PINBALL_FILE_SYSTEM                                      = 0x00000059,
    CRITICAL_SERVICE_FAILED                                  = 0x0000005a,
    SET_ENV_VAR_FAILED                                       = 0x0000005b,
    HAL_INITIALIZATION_FAILED                                = 0x0000005c,
    UNSUPPORTED_PROCESSOR                                    = 0x0000005d,
    OBJECT_INITIALIZATION_FAILED                             = 0x0000005e,
    SECURITY_INITIALIZATION_FAILED                           = 0x0000005f,
    PROCESS_INITIALIZATION_FAILED                            = 0x00000060,
    HAL1_INITIALIZATION_FAILED                               = 0x00000061,
    OBJECT1_INITIALIZATION_FAILED                            = 0x00000062,
    SECURITY1_INITIALIZATION_FAILED                          = 0x00000063,
    SYMBOLIC_INITIALIZATION_FAILED                           = 0x00000064,
    MEMORY1_INITIALIZATION_FAILED                            = 0x00000065,
    CACHE_INITIALIZATION_FAILED                              = 0x00000066,
    CONFIG_INITIALIZATION_FAILED                             = 0x00000067,
    FILE_INITIALIZATION_FAILED                               = 0x00000068,
    IO1_INITIALIZATION_FAILED                                = 0x00000069,
    LPC_INITIALIZATION_FAILED                                = 0x0000006a,
    PROCESS1_INITIALIZATION_FAILED                           = 0x0000006b,
    REFMON_INITIALIZATION_FAILED                             = 0x0000006c,
    SESSION1_INITIALIZATION_FAILED                           = 0x0000006d,
    BOOTPROC_INITIALIZATION_FAILED                           = 0x0000006e,
    VSL_INITIALIZATION_FAILED                                = 0x0000006f,
    SOFT_RESTART_FATAL_ERROR                                 = 0x00000070,
    ASSIGN_DRIVE_LETTERS_FAILED                              = 0x00000072,
    CONFIG_LIST_FAILED                                       = 0x00000073,
    BAD_SYSTEM_CONFIG_INFO                                   = 0x00000074,
    CANNOT_WRITE_CONFIGURATION                               = 0x00000075,
    PROCESS_HAS_LOCKED_PAGES                                 = 0x00000076,
    KERNEL_STACK_INPAGE_ERROR                                = 0x00000077,
    PHASE0_EXCEPTION                                         = 0x00000078,
    MISMATCHED_HAL                                           = 0x00000079,
    KERNEL_DATA_INPAGE_ERROR                                 = 0x0000007a,
    INACCESSIBLE_BOOT_DEVICE                                 = 0x0000007b,
    BUGCODE_NDIS_DRIVER                                      = 0x0000007c,
    INSTALL_MORE_MEMORY                                      = 0x0000007d,
    SYSTEM_THREAD_EXCEPTION_NOT_HANDLED                      = 0x0000007e,
    SYSTEM_THREAD_EXCEPTION_NOT_HANDLED_M                    = 0x1000007e,
    UNEXPECTED_KERNEL_MODE_TRAP                              = 0x0000007f,
    UNEXPECTED_KERNEL_MODE_TRAP_M                            = 0x1000007f,
    NMI_HARDWARE_FAILURE                                     = 0x00000080,
    SPIN_LOCK_INIT_FAILURE                                   = 0x00000081,
    DFS_FILE_SYSTEM                                          = 0x00000082,
    OFS_FILE_SYSTEM                                          = 0x00000083,
    RECOM_DRIVER                                             = 0x00000084,
    SETUP_FAILURE                                            = 0x00000085,
    AUDIT_FAILURE                                            = 0x00000086,
    MBR_CHECKSUM_MISMATCH                                    = 0x0000008b,
    KERNEL_MODE_EXCEPTION_NOT_HANDLED                        = 0x0000008e,
    KERNEL_MODE_EXCEPTION_NOT_HANDLED_M                      = 0x1000008e,
    PP0_INITIALIZATION_FAILED                                = 0x0000008f,
    PP1_INITIALIZATION_FAILED                                = 0x00000090,
    WIN32K_INIT_OR_RIT_FAILURE                               = 0x00000091,
    UP_DRIVER_ON_MP_SYSTEM                                   = 0x00000092,
    INVALID_KERNEL_HANDLE                                    = 0x00000093,
    KERNEL_STACK_LOCKED_AT_EXIT                              = 0x00000094,
    PNP_INTERNAL_ERROR                                       = 0x00000095,
    INVALID_WORK_QUEUE_ITEM                                  = 0x00000096,
    BOUND_IMAGE_UNSUPPORTED                                  = 0x00000097,
    END_OF_NT_EVALUATION_PERIOD                              = 0x00000098,
    INVALID_REGION_OR_SEGMENT                                = 0x00000099,
    SYSTEM_LICENSE_VIOLATION                                 = 0x0000009a,
    UDFS_FILE_SYSTEM                                         = 0x0000009b,
    MACHINE_CHECK_EXCEPTION                                  = 0x0000009c,
    USER_MODE_HEALTH_MONITOR                                 = 0x0000009e,
    DRIVER_POWER_STATE_FAILURE                               = 0x0000009f,
    INTERNAL_POWER_ERROR                                     = 0x000000a0,
    PCI_BUS_DRIVER_INTERNAL                                  = 0x000000a1,
    MEMORY_IMAGE_CORRUPT                                     = 0x000000a2,
    ACPI_DRIVER_INTERNAL                                     = 0x000000a3,
    CNSS_FILE_SYSTEM_FILTER                                  = 0x000000a4,
    ACPI_BIOS_ERROR                                          = 0x000000a5,
    FP_EMULATION_ERROR                                       = 0x000000a6,
    BAD_EXHANDLE                                             = 0x000000a7,
    BOOTING_IN_SAFEMODE_MINIMAL                              = 0x000000a8,
    BOOTING_IN_SAFEMODE_NETWORK                              = 0x000000a9,
    BOOTING_IN_SAFEMODE_DSREPAIR                             = 0x000000aa,
    SESSION_HAS_VALID_POOL_ON_EXIT                           = 0x000000ab,
    HAL_MEMORY_ALLOCATION                                    = 0x000000ac,
    VIDEO_DRIVER_DEBUG_REPORT_REQUEST                        = 0x400000ad,
    BGI_DETECTED_VIOLATION                                   = 0x000000b1,
    VIDEO_DRIVER_INIT_FAILURE                                = 0x000000b4,
    BOOTLOG_LOADED                                           = 0x000000b5,
    BOOTLOG_NOT_LOADED                                       = 0x000000b6,
    BOOTLOG_ENABLED                                          = 0x000000b7,
    ATTEMPTED_SWITCH_FROM_DPC                                = 0x000000b8,
    CHIPSET_DETECTED_ERROR                                   = 0x000000b9,
    SESSION_HAS_VALID_VIEWS_ON_EXIT                          = 0x000000ba,
    NETWORK_BOOT_INITIALIZATION_FAILED                       = 0x000000bb,
    NETWORK_BOOT_DUPLICATE_ADDRESS                           = 0x000000bc,
    INVALID_HIBERNATED_STATE                                 = 0x000000bd,
    ATTEMPTED_WRITE_TO_READONLY_MEMORY                       = 0x000000be,
    MUTEX_ALREADY_OWNED                                      = 0x000000bf,
    PCI_CONFIG_SPACE_ACCESS_FAILURE                          = 0x000000c0,
    SPECIAL_POOL_DETECTED_MEMORY_CORRUPTION                  = 0x000000c1,
    BAD_POOL_CALLER                                          = 0x000000c2,
    SYSTEM_IMAGE_BAD_SIGNATURE                               = 0x000000c3,
    DRIVER_VERIFIER_DETECTED_VIOLATION                       = 0x000000c4,
    DRIVER_CORRUPTED_EXPOOL                                  = 0x000000c5,
    DRIVER_CAUGHT_MODIFYING_FREED_POOL                       = 0x000000c6,
    TIMER_OR_DPC_INVALID                                     = 0x000000c7,
    IRQL_UNEXPECTED_VALUE                                    = 0x000000c8,
    DRIVER_VERIFIER_IOMANAGER_VIOLATION                      = 0x000000c9,
    PNP_DETECTED_FATAL_ERROR                                 = 0x000000ca,
    DRIVER_LEFT_LOCKED_PAGES_IN_PROCESS                      = 0x000000cb,
    PAGE_FAULT_IN_FREED_SPECIAL_POOL                         = 0x000000cc,
    PAGE_FAULT_BEYOND_END_OF_ALLOCATION                      = 0x000000cd,
    DRIVER_UNLOADED_WITHOUT_CANCELLING_PENDING_OPERATIONS    = 0x000000ce,
    TERMINAL_SERVER_DRIVER_MADE_INCORRECT_MEMORY_REFERENCE   = 0x000000cf,
    DRIVER_CORRUPTED_MMPOOL                                  = 0x000000d0,
    DRIVER_IRQL_NOT_LESS_OR_EQUAL                            = 0x000000d1,
    BUGCODE_ID_DRIVER                                        = 0x000000d2,
    DRIVER_PORTION_MUST_BE_NONPAGED                          = 0x000000d3,
    SYSTEM_SCAN_AT_RAISED_IRQL_CAUGHT_IMPROPER_DRIVER_UNLOAD = 0x000000d4,
    DRIVER_PAGE_FAULT_IN_FREED_SPECIAL_POOL                  = 0x000000d5,
    DRIVER_PAGE_FAULT_BEYOND_END_OF_ALLOCATION               = 0x000000d6,
    DRIVER_PAGE_FAULT_BEYOND_END_OF_ALLOCATION_M             = 0x100000d6,
    DRIVER_UNMAPPING_INVALID_VIEW                            = 0x000000d7,
    DRIVER_USED_EXCESSIVE_PTES                               = 0x000000d8,
    LOCKED_PAGES_TRACKER_CORRUPTION                          = 0x000000d9,
    SYSTEM_PTE_MISUSE                                        = 0x000000da,
    DRIVER_CORRUPTED_SYSPTES                                 = 0x000000db,
    DRIVER_INVALID_STACK_ACCESS                              = 0x000000dc,
    POOL_CORRUPTION_IN_FILE_AREA                             = 0x000000de,
    IMPERSONATING_WORKER_THREAD                              = 0x000000df,
    ACPI_BIOS_FATAL_ERROR                                    = 0x000000e0,
    WORKER_THREAD_RETURNED_AT_BAD_IRQL                       = 0x000000e1,
    MANUALLY_INITIATED_CRASH                                 = 0x000000e2,
    RESOURCE_NOT_OWNED                                       = 0x000000e3,
    WORKER_INVALID                                           = 0x000000e4,
    POWER_FAILURE_SIMULATE                                   = 0x000000e5,
    DRIVER_VERIFIER_DMA_VIOLATION                            = 0x000000e6,
    INVALID_FLOATING_POINT_STATE                             = 0x000000e7,
    INVALID_CANCEL_OF_FILE_OPEN                              = 0x000000e8,
    ACTIVE_EX_WORKER_THREAD_TERMINATION                      = 0x000000e9,
    SAVER_UNSPECIFIED                                        = 0x0000f000,
    SAVER_BLANKSCREEN                                        = 0x0000f002,
    SAVER_INPUT                                              = 0x0000f003,
    SAVER_WATCHDOG                                           = 0x0000f004,
    SAVER_STARTNOTVISIBLE                                    = 0x0000f005,
    SAVER_NAVIGATIONMODEL                                    = 0x0000f006,
    SAVER_OUTOFMEMORY                                        = 0x0000f007,
    SAVER_GRAPHICS                                           = 0x0000f008,
    SAVER_NAVSERVERTIMEOUT                                   = 0x0000f009,
    SAVER_CHROMEPROCESSCRASH                                 = 0x0000f00a,
    SAVER_NOTIFICATIONDISMISSAL                              = 0x0000f00b,
    SAVER_SPEECHDISMISSAL                                    = 0x0000f00c,
    SAVER_CALLDISMISSAL                                      = 0x0000f00d,
    SAVER_APPBARDISMISSAL                                    = 0x0000f00e,
    SAVER_RILADAPTATIONCRASH                                 = 0x0000f00f,
    SAVER_APPLISTUNREACHABLE                                 = 0x0000f010,
    SAVER_REPORTNOTIFICATIONFAILURE                          = 0x0000f011,
    SAVER_UNEXPECTEDSHUTDOWN                                 = 0x0000f012,
    SAVER_RPCFAILURE                                         = 0x0000f013,
    SAVER_AUXILIARYFULLDUMP                                  = 0x0000f014,
    SAVER_ACCOUNTPROVSVCINITFAILURE                          = 0x0000f015,
    SAVER_MTBFCOMMANDTIMEOUT                                 = 0x00000315,
    SAVER_MTBFCOMMANDHANG                                    = 0x0000f101,
    SAVER_MTBFPASSBUGCHECK                                   = 0x0000f102,
    SAVER_MTBFIOERROR                                        = 0x0000f103,
    SAVER_RENDERTHREADHANG                                   = 0x0000f200,
    SAVER_RENDERMOBILEUIOOM                                  = 0x0000f201,
    SAVER_DEVICEUPDATEUNSPECIFIED                            = 0x0000f300,
    SAVER_AUDIODRIVERHANG                                    = 0x0000f400,
    SAVER_BATTERYPULLOUT                                     = 0x0000f500,
    SAVER_MEDIACORETESTHANG                                  = 0x0000f600,
    SAVER_RESOURCEMANAGEMENT                                 = 0x0000f700,
    SAVER_CAPTURESERVICE                                     = 0x0000f800,
    SAVER_WAITFORSHELLREADY                                  = 0x0000f900,
    SAVER_NONRESPONSIVEPROCESS                               = 0x00000194,
    SAVER_SICKAPPLICATION                                    = 0x00008866,
    THREAD_STUCK_IN_DEVICE_DRIVER                            = 0x000000ea,
    THREAD_STUCK_IN_DEVICE_DRIVER_M                          = 0x100000ea,
    DIRTY_MAPPED_PAGES_CONGESTION                            = 0x000000eb,
    SESSION_HAS_VALID_SPECIAL_POOL_ON_EXIT                   = 0x000000ec,
    UNMOUNTABLE_BOOT_VOLUME                                  = 0x000000ed,
    CRITICAL_PROCESS_DIED                                    = 0x000000ef,
    STORAGE_MINIPORT_ERROR                                   = 0x000000f0,
    SCSI_VERIFIER_DETECTED_VIOLATION                         = 0x000000f1,
    HARDWARE_INTERRUPT_STORM                                 = 0x000000f2,
    DISORDERLY_SHUTDOWN                                      = 0x000000f3,
    CRITICAL_OBJECT_TERMINATION                              = 0x000000f4,
    FLTMGR_FILE_SYSTEM                                       = 0x000000f5,
    PCI_VERIFIER_DETECTED_VIOLATION                          = 0x000000f6,
    DRIVER_OVERRAN_STACK_BUFFER                              = 0x000000f7,
    RAMDISK_BOOT_INITIALIZATION_FAILED                       = 0x000000f8,
    DRIVER_RETURNED_STATUS_REPARSE_FOR_VOLUME_OPEN           = 0x000000f9,
    HTTP_DRIVER_CORRUPTED                                    = 0x000000fa,
    RECURSIVE_MACHINE_CHECK                                  = 0x000000fb,
    ATTEMPTED_EXECUTE_OF_NOEXECUTE_MEMORY                    = 0x000000fc,
    DIRTY_NOWRITE_PAGES_CONGESTION                           = 0x000000fd,
    BUGCODE_USB_DRIVER                                       = 0x000000fe,
    BC_BLUETOOTH_VERIFIER_FAULT                              = 0x00000bfe,
    BC_BTHMINI_VERIFIER_FAULT                                = 0x00000bff,
    RESERVE_QUEUE_OVERFLOW                                   = 0x000000ff,
    LOADER_BLOCK_MISMATCH                                    = 0x00000100,
    CLOCK_WATCHDOG_TIMEOUT                                   = 0x00000101,
    DPC_WATCHDOG_TIMEOUT                                     = 0x00000102,
    MUP_FILE_SYSTEM                                          = 0x00000103,
    AGP_INVALID_ACCESS                                       = 0x00000104,
    AGP_GART_CORRUPTION                                      = 0x00000105,
    AGP_ILLEGALLY_REPROGRAMMED                               = 0x00000106,
    KERNEL_EXPAND_STACK_ACTIVE                               = 0x00000107,
    THIRD_PARTY_FILE_SYSTEM_FAILURE                          = 0x00000108,
    CRITICAL_STRUCTURE_CORRUPTION                            = 0x00000109,
    APP_TAGGING_INITIALIZATION_FAILED                        = 0x0000010a,
    DFSC_FILE_SYSTEM                                         = 0x0000010b,
    FSRTL_EXTRA_CREATE_PARAMETER_VIOLATION                   = 0x0000010c,
    WDF_VIOLATION                                            = 0x0000010d,
    VIDEO_MEMORY_MANAGEMENT_INTERNAL                         = 0x0000010e,
    DRIVER_INVALID_CRUNTIME_PARAMETER                        = 0x00000110,
    RECURSIVE_NMI                                            = 0x00000111,
    MSRPC_STATE_VIOLATION                                    = 0x00000112,
    VIDEO_DXGKRNL_FATAL_ERROR                                = 0x00000113,
    VIDEO_SHADOW_DRIVER_FATAL_ERROR                          = 0x00000114,
    AGP_INTERNAL                                             = 0x00000115,
    VIDEO_TDR_FAILURE                                        = 0x00000116,
    VIDEO_TDR_TIMEOUT_DETECTED                               = 0x00000117,
    NTHV_GUEST_ERROR                                         = 0x00000118,
    VIDEO_SCHEDULER_INTERNAL_ERROR                           = 0x00000119,
    EM_INITIALIZATION_ERROR                                  = 0x0000011a,
    DRIVER_RETURNED_HOLDING_CANCEL_LOCK                      = 0x0000011b,
    ATTEMPTED_WRITE_TO_CM_PROTECTED_STORAGE                  = 0x0000011c,
    EVENT_TRACING_FATAL_ERROR                                = 0x0000011d,
    TOO_MANY_RECURSIVE_FAULTS                                = 0x0000011e,
    INVALID_DRIVER_HANDLE                                    = 0x0000011f,
    BITLOCKER_FATAL_ERROR                                    = 0x00000120,
    DRIVER_VIOLATION                                         = 0x00000121,
    WHEA_INTERNAL_ERROR                                      = 0x00000122,
    CRYPTO_SELF_TEST_FAILURE                                 = 0x00000123,
    WHEA_UNCORRECTABLE_ERROR                                 = 0x00000124,
    NMR_INVALID_STATE                                        = 0x00000125,
    NETIO_INVALID_POOL_CALLER                                = 0x00000126,
    PAGE_NOT_ZERO                                            = 0x00000127,
    WORKER_THREAD_RETURNED_WITH_BAD_IO_PRIORITY              = 0x00000128,
    WORKER_THREAD_RETURNED_WITH_BAD_PAGING_IO_PRIORITY       = 0x00000129,
    MUI_NO_VALID_SYSTEM_LANGUAGE                             = 0x0000012a,
    FAULTY_HARDWARE_CORRUPTED_PAGE                           = 0x0000012b,
    EXFAT_FILE_SYSTEM                                        = 0x0000012c,
    VOLSNAP_OVERLAPPED_TABLE_ACCESS                          = 0x0000012d,
    INVALID_MDL_RANGE                                        = 0x0000012e,
    VHD_BOOT_INITIALIZATION_FAILED                           = 0x0000012f,
    DYNAMIC_ADD_PROCESSOR_MISMATCH                           = 0x00000130,
    INVALID_EXTENDED_PROCESSOR_STATE                         = 0x00000131,
    RESOURCE_OWNER_POINTER_INVALID                           = 0x00000132,
    DPC_WATCHDOG_VIOLATION                                   = 0x00000133,
    DRIVE_EXTENDER                                           = 0x00000134,
    REGISTRY_FILTER_DRIVER_EXCEPTION                         = 0x00000135,
    VHD_BOOT_HOST_VOLUME_NOT_ENOUGH_SPACE                    = 0x00000136,
    WIN32K_HANDLE_MANAGER                                    = 0x00000137,
    GPIO_CONTROLLER_DRIVER_ERROR                             = 0x00000138,
    KERNEL_SECURITY_CHECK_FAILURE                            = 0x00000139,
    KERNEL_MODE_HEAP_CORRUPTION                              = 0x0000013a,
    PASSIVE_INTERRUPT_ERROR                                  = 0x0000013b,
    INVALID_IO_BOOST_STATE                                   = 0x0000013c,
    CRITICAL_INITIALIZATION_FAILURE                          = 0x0000013d,
    ERRATA_WORKAROUND_UNSUCCESSFUL                           = 0x0000013e,
    REGISTRY_CALLBACK_DRIVER_EXCEPTION                       = 0x0000013f,
    STORAGE_DEVICE_ABNORMALITY_DETECTED                      = 0x00000140,
    VIDEO_ENGINE_TIMEOUT_DETECTED                            = 0x00000141,
    VIDEO_TDR_APPLICATION_BLOCKED                            = 0x00000142,
    PROCESSOR_DRIVER_INTERNAL                                = 0x00000143,
    BUGCODE_USB3_DRIVER                                      = 0x00000144,
    SECURE_BOOT_VIOLATION                                    = 0x00000145,
    NDIS_NET_BUFFER_LIST_INFO_ILLEGALLY_TRANSFERRED          = 0x00000146,
    ABNORMAL_RESET_DETECTED                                  = 0x00000147,
    IO_OBJECT_INVALID                                        = 0x00000148,
    REFS_FILE_SYSTEM                                         = 0x00000149,
    KERNEL_WMI_INTERNAL                                      = 0x0000014a,
    SOC_SUBSYSTEM_FAILURE                                    = 0x0000014b,
    FATAL_ABNORMAL_RESET_ERROR                               = 0x0000014c,
    EXCEPTION_SCOPE_INVALID                                  = 0x0000014d,
    SOC_CRITICAL_DEVICE_REMOVED                              = 0x0000014e,
    PDC_WATCHDOG_TIMEOUT                                     = 0x0000014f,
    TCPIP_AOAC_NIC_ACTIVE_REFERENCE_LEAK                     = 0x00000150,
    UNSUPPORTED_INSTRUCTION_MODE                             = 0x00000151,
    INVALID_PUSH_LOCK_FLAGS                                  = 0x00000152,
    KERNEL_LOCK_ENTRY_LEAKED_ON_THREAD_TERMINATION           = 0x00000153,
    UNEXPECTED_STORE_EXCEPTION                               = 0x00000154,
    OS_DATA_TAMPERING                                        = 0x00000155,
    WINSOCK_DETECTED_HUNG_CLOSESOCKET_LIVEDUMP               = 0x00000156,
    KERNEL_THREAD_PRIORITY_FLOOR_VIOLATION                   = 0x00000157,
    ILLEGAL_IOMMU_PAGE_FAULT                                 = 0x00000158,
    HAL_ILLEGAL_IOMMU_PAGE_FAULT                             = 0x00000159,
    SDBUS_INTERNAL_ERROR                                     = 0x0000015a,
    WORKER_THREAD_RETURNED_WITH_SYSTEM_PAGE_PRIORITY_ACTIVE  = 0x0000015b,
    PDC_WATCHDOG_TIMEOUT_LIVEDUMP                            = 0x0000015c,
    SOC_SUBSYSTEM_FAILURE_LIVEDUMP                           = 0x0000015d,
    BUGCODE_NDIS_DRIVER_LIVE_DUMP                            = 0x0000015e,
    CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP              = 0x0000015f,
    WIN32K_ATOMIC_CHECK_FAILURE                              = 0x00000160,
    LIVE_SYSTEM_DUMP                                         = 0x00000161,
    KERNEL_AUTO_BOOST_INVALID_LOCK_RELEASE                   = 0x00000162,
    WORKER_THREAD_TEST_CONDITION                             = 0x00000163,
    WIN32K_CRITICAL_FAILURE                                  = 0x00000164,
    CLUSTER_CSV_STATUS_IO_TIMEOUT_LIVEDUMP                   = 0x00000165,
    CLUSTER_RESOURCE_CALL_TIMEOUT_LIVEDUMP                   = 0x00000166,
    CLUSTER_CSV_SNAPSHOT_DEVICE_INFO_TIMEOUT_LIVEDUMP        = 0x00000167,
    CLUSTER_CSV_STATE_TRANSITION_TIMEOUT_LIVEDUMP            = 0x00000168,
    CLUSTER_CSV_VOLUME_ARRIVAL_LIVEDUMP                      = 0x00000169,
    CLUSTER_CSV_VOLUME_REMOVAL_LIVEDUMP                      = 0x0000016a,
    CLUSTER_CSV_CLUSTER_WATCHDOG_LIVEDUMP                    = 0x0000016b,
    INVALID_RUNDOWN_PROTECTION_FLAGS                         = 0x0000016c,
    INVALID_SLOT_ALLOCATOR_FLAGS                             = 0x0000016d,
    ERESOURCE_INVALID_RELEASE                                = 0x0000016e,
    CLUSTER_CSV_STATE_TRANSITION_INTERVAL_TIMEOUT_LIVEDUMP   = 0x0000016f,
    CLUSTER_CSV_CLUSSVC_DISCONNECT_WATCHDOG                  = 0x00000170,
    CRYPTO_LIBRARY_INTERNAL_ERROR                            = 0x00000171,
    COREMSGCALL_INTERNAL_ERROR                               = 0x00000173,
    COREMSG_INTERNAL_ERROR                                   = 0x00000174,
    PREVIOUS_FATAL_ABNORMAL_RESET_ERROR                      = 0x00000175,
    ELAM_DRIVER_DETECTED_FATAL_ERROR                         = 0x00000178,
    CLUSTER_CLUSPORT_STATUS_IO_TIMEOUT_LIVEDUMP              = 0x00000179,
    PROFILER_CONFIGURATION_ILLEGAL                           = 0x0000017b,
    PDC_LOCK_WATCHDOG_LIVEDUMP                               = 0x0000017c,
    PDC_UNEXPECTED_REVOCATION_LIVEDUMP                       = 0x0000017d,
    MICROCODE_REVISION_MISMATCH                              = 0x0000017e,
    HYPERGUARD_INITIALIZATION_FAILURE                        = 0x0000017f,
    WVR_LIVEDUMP_REPLICATION_IOCONTEXT_TIMEOUT               = 0x00000180,
    WVR_LIVEDUMP_STATE_TRANSITION_TIMEOUT                    = 0x00000181,
    WVR_LIVEDUMP_RECOVERY_IOCONTEXT_TIMEOUT                  = 0x00000182,
    WVR_LIVEDUMP_APP_IO_TIMEOUT                              = 0x00000183,
    WVR_LIVEDUMP_MANUALLY_INITIATED                          = 0x00000184,
    WVR_LIVEDUMP_STATE_FAILURE                               = 0x00000185,
    WVR_LIVEDUMP_CRITICAL_ERROR                              = 0x00000186,
    VIDEO_DWMINIT_TIMEOUT_FALLBACK_BDD                       = 0x00000187,
    CLUSTER_CSVFS_LIVEDUMP                                   = 0x00000188,
    BAD_OBJECT_HEADER                                        = 0x00000189,
    SILO_CORRUPT                                             = 0x0000018a,
    SECURE_KERNEL_ERROR                                      = 0x0000018b,
    HYPERGUARD_VIOLATION                                     = 0x0000018c,
    SECURE_FAULT_UNHANDLED                                   = 0x0000018d,
    KERNEL_PARTITION_REFERENCE_VIOLATION                     = 0x0000018e,
    SYNTHETIC_EXCEPTION_UNHANDLED                            = 0x0000018f,
    WIN32K_CRITICAL_FAILURE_LIVEDUMP                         = 0x00000190,
    PF_DETECTED_CORRUPTION                                   = 0x00000191,
    KERNEL_AUTO_BOOST_LOCK_ACQUISITION_WITH_RAISED_IRQL      = 0x00000192,
    VIDEO_DXGKRNL_LIVEDUMP                                   = 0x00000193,
    KERNEL_STORAGE_SLOT_IN_USE                               = 0x00000199,
    SMB_SERVER_LIVEDUMP                                      = 0x00000195,
    LOADER_ROLLBACK_DETECTED                                 = 0x00000196,
    WIN32K_SECURITY_FAILURE                                  = 0x00000197,
    UFX_LIVEDUMP                                             = 0x00000198,
    WORKER_THREAD_RETURNED_WHILE_ATTACHED_TO_SILO            = 0x0000019a,
    TTM_FATAL_ERROR                                          = 0x0000019b,
    WIN32K_POWER_WATCHDOG_TIMEOUT                            = 0x0000019c,
    CLUSTER_SVHDX_LIVEDUMP                                   = 0x0000019d,
    BUGCODE_NETADAPTER_DRIVER                                = 0x0000019e,
    PDC_PRIVILEGE_CHECK_LIVEDUMP                             = 0x0000019f,
    TTM_WATCHDOG_TIMEOUT                                     = 0x000001a0,
    WIN32K_CALLOUT_WATCHDOG_LIVEDUMP                         = 0x000001a1,
    WIN32K_CALLOUT_WATCHDOG_BUGCHECK                         = 0x000001a2,
    CALL_HAS_NOT_RETURNED_WATCHDOG_TIMEOUT_LIVEDUMP          = 0x000001a3,
    DRIPS_SW_HW_DIVERGENCE_LIVEDUMP                          = 0x000001a4,
    USB_DRIPS_BLOCKER_SURPRISE_REMOVAL_LIVEDUMP              = 0x000001a5,
    BLUETOOTH_ERROR_RECOVERY_LIVEDUMP                        = 0x000001a6,
    SMB_REDIRECTOR_LIVEDUMP                                  = 0x000001a7,
    VIDEO_DXGKRNL_BLACK_SCREEN_LIVEDUMP                      = 0x000001a8,
    DIRECTED_FX_TRANSITION_LIVEDUMP                          = 0x000001a9,
    EXCEPTION_ON_INVALID_STACK                               = 0x000001aa,
    UNWIND_ON_INVALID_STACK                                  = 0x000001ab,
    VIDEO_MINIPORT_FAILED_LIVEDUMP                           = 0x000001b0,
    VIDEO_MINIPORT_BLACK_SCREEN_LIVEDUMP                     = 0x000001b8,
    DRIVER_VERIFIER_DETECTED_VIOLATION_LIVEDUMP              = 0x000001c4,
    IO_THREADPOOL_DEADLOCK_LIVEDUMP                          = 0x000001c5,
    FAST_ERESOURCE_PRECONDITION_VIOLATION                    = 0x000001c6,
    STORE_DATA_STRUCTURE_CORRUPTION                          = 0x000001c7,
    MANUALLY_INITIATED_POWER_BUTTON_HOLD                     = 0x000001c8,
    USER_MODE_HEALTH_MONITOR_LIVEDUMP                        = 0x000001c9,
    SYNTHETIC_WATCHDOG_TIMEOUT                               = 0x000001ca,
    INVALID_SILO_DETACH                                      = 0x000001cb,
    EXRESOURCE_TIMEOUT_LIVEDUMP                              = 0x000001cc,
    INVALID_CALLBACK_STACK_ADDRESS                           = 0x000001cd,
    INVALID_KERNEL_STACK_ADDRESS                             = 0x000001ce,
    HARDWARE_WATCHDOG_TIMEOUT                                = 0x000001cf,
    ACPI_FIRMWARE_WATCHDOG_TIMEOUT                           = 0x000001d0,
    TELEMETRY_ASSERTS_LIVEDUMP                               = 0x000001d1,
    WORKER_THREAD_INVALID_STATE                              = 0x000001d2,
    WFP_INVALID_OPERATION                                    = 0x000001d3,
    UCMUCSI_LIVEDUMP                                         = 0x000001d4,
    DRIVER_PNP_WATCHDOG                                      = 0x000001d5,
    WORKER_THREAD_RETURNED_WITH_NON_DEFAULT_WORKLOAD_CLASS   = 0x000001d6,
    EFS_FATAL_ERROR                                          = 0x000001d7,
    UCMUCSI_FAILURE                                          = 0x000001d8,
    HAL_IOMMU_INTERNAL_ERROR                                 = 0x000001d9,
    HAL_BLOCKED_PROCESSOR_INTERNAL_ERROR                     = 0x000001da,
    IPI_WATCHDOG_TIMEOUT                                     = 0x000001db,
    DMA_COMMON_BUFFER_VECTOR_ERROR                           = 0x000001dc,
    BUGCODE_MBBADAPTER_DRIVER                                = 0x000001dd,
    BUGCODE_WIFIADAPTER_DRIVER                               = 0x000001de,
    PROCESSOR_START_TIMEOUT                                  = 0x000001df,
    INVALID_ALTERNATE_SYSTEM_CALL_HANDLER_REGISTRATION       = 0x000001e0,
    DEVICE_DIAGNOSTIC_LOG_LIVEDUMP                           = 0x000001e1,
    AZURE_DEVICE_FW_DUMP                                     = 0x000001e2,
    BREAKAWAY_CABLE_TRANSITION                               = 0x000001e3,
    VIDEO_DXGKRNL_SYSMM_FATAL_ERROR                          = 0x000001e4,
    DRIVER_VERIFIER_TRACKING_LIVE_DUMP                       = 0x000001e5,
    CRASHDUMP_WATCHDOG_TIMEOUT                               = 0x000001e6,
    REGISTRY_LIVE_DUMP                                       = 0x000001e7,
    INVALID_THREAD_AFFINITY_STATE                            = 0x000001e8,
    ILLEGAL_ATS_INITIALIZATION                               = 0x000001e9,
    SECURE_PCI_CONFIG_SPACE_ACCESS_VIOLATION                 = 0x000001ea,
    DAM_WATCHDOG_TIMEOUT                                     = 0x000001eb,
    XBOX_VMCTRL_CS_TIMEOUT                                   = 0x00000356,
    XBOX_CORRUPTED_IMAGE                                     = 0x00000357,
    XBOX_INVERTED_FUNCTION_TABLE_OVERFLOW                    = 0x00000358,
    XBOX_CORRUPTED_IMAGE_BASE                                = 0x00000359,
    XBOX_XDS_WATCHDOG_TIMEOUT                                = 0x0000035a,
    XBOX_SHUTDOWN_WATCHDOG_TIMEOUT                           = 0x0000035b,
    XBOX_360_SYSTEM_CRASH                                    = 0x00000360,
    XBOX_360_SYSTEM_CRASH_RESERVED                           = 0x00000420,
    XBOX_SECURITY_FAILUE                                     = 0x00000421,
    KERNEL_CFG_INIT_FAILURE                                  = 0x00000422,
    MANUALLY_INITIATED_POWER_BUTTON_HOLD_LIVE_DUMP           = 0x000011c8,
    HYPERVISOR_ERROR                                         = 0x00020001,
    WINLOGON_FATAL_ERROR                                     = 0xc000021a,
    MANUALLY_INITIATED_CRASH1                                = 0xdeaddead,
    BUGCHECK_CONTEXT_MODIFIER                                = 0x80000000,
}

alias FACILITY_CODE = uint;
enum : uint
{
    FACILITY_NULL                                     = 0x00000000,
    FACILITY_RPC                                      = 0x00000001,
    FACILITY_DISPATCH                                 = 0x00000002,
    FACILITY_STORAGE                                  = 0x00000003,
    FACILITY_ITF                                      = 0x00000004,
    FACILITY_WIN32                                    = 0x00000007,
    FACILITY_WINDOWS                                  = 0x00000008,
    FACILITY_SSPI                                     = 0x00000009,
    FACILITY_SECURITY                                 = 0x00000009,
    FACILITY_CONTROL                                  = 0x0000000a,
    FACILITY_CERT                                     = 0x0000000b,
    FACILITY_INTERNET                                 = 0x0000000c,
    FACILITY_MEDIASERVER                              = 0x0000000d,
    FACILITY_MSMQ                                     = 0x0000000e,
    FACILITY_SETUPAPI                                 = 0x0000000f,
    FACILITY_SCARD                                    = 0x00000010,
    FACILITY_COMPLUS                                  = 0x00000011,
    FACILITY_AAF                                      = 0x00000012,
    FACILITY_URT                                      = 0x00000013,
    FACILITY_ACS                                      = 0x00000014,
    FACILITY_DPLAY                                    = 0x00000015,
    FACILITY_UMI                                      = 0x00000016,
    FACILITY_SXS                                      = 0x00000017,
    FACILITY_WINDOWS_CE                               = 0x00000018,
    FACILITY_HTTP                                     = 0x00000019,
    FACILITY_USERMODE_COMMONLOG                       = 0x0000001a,
    FACILITY_WER                                      = 0x0000001b,
    FACILITY_USERMODE_FILTER_MANAGER                  = 0x0000001f,
    FACILITY_BACKGROUNDCOPY                           = 0x00000020,
    FACILITY_CONFIGURATION                            = 0x00000021,
    FACILITY_WIA                                      = 0x00000021,
    FACILITY_STATE_MANAGEMENT                         = 0x00000022,
    FACILITY_METADIRECTORY                            = 0x00000023,
    FACILITY_WINDOWSUPDATE                            = 0x00000024,
    FACILITY_DIRECTORYSERVICE                         = 0x00000025,
    FACILITY_GRAPHICS                                 = 0x00000026,
    FACILITY_SHELL                                    = 0x00000027,
    FACILITY_NAP                                      = 0x00000027,
    FACILITY_TPM_SERVICES                             = 0x00000028,
    FACILITY_TPM_SOFTWARE                             = 0x00000029,
    FACILITY_UI                                       = 0x0000002a,
    FACILITY_XAML                                     = 0x0000002b,
    FACILITY_ACTION_QUEUE                             = 0x0000002c,
    FACILITY_PLA                                      = 0x00000030,
    FACILITY_WINDOWS_SETUP                            = 0x00000030,
    FACILITY_FVE                                      = 0x00000031,
    FACILITY_FWP                                      = 0x00000032,
    FACILITY_WINRM                                    = 0x00000033,
    FACILITY_NDIS                                     = 0x00000034,
    FACILITY_USERMODE_HYPERVISOR                      = 0x00000035,
    FACILITY_CMI                                      = 0x00000036,
    FACILITY_USERMODE_VIRTUALIZATION                  = 0x00000037,
    FACILITY_USERMODE_VOLMGR                          = 0x00000038,
    FACILITY_BCD                                      = 0x00000039,
    FACILITY_USERMODE_VHD                             = 0x0000003a,
    FACILITY_USERMODE_HNS                             = 0x0000003b,
    FACILITY_SDIAG                                    = 0x0000003c,
    FACILITY_WEBSERVICES                              = 0x0000003d,
    FACILITY_WINPE                                    = 0x0000003d,
    FACILITY_WPN                                      = 0x0000003e,
    FACILITY_WINDOWS_STORE                            = 0x0000003f,
    FACILITY_INPUT                                    = 0x00000040,
    FACILITY_QUIC                                     = 0x00000041,
    FACILITY_EAP                                      = 0x00000042,
    FACILITY_IORING                                   = 0x00000046,
    FACILITY_WINDOWS_DEFENDER                         = 0x00000050,
    FACILITY_OPC                                      = 0x00000051,
    FACILITY_XPS                                      = 0x00000052,
    FACILITY_MBN                                      = 0x00000054,
    FACILITY_POWERSHELL                               = 0x00000054,
    FACILITY_RAS                                      = 0x00000053,
    FACILITY_P2P_INT                                  = 0x00000062,
    FACILITY_P2P                                      = 0x00000063,
    FACILITY_DAF                                      = 0x00000064,
    FACILITY_BLUETOOTH_ATT                            = 0x00000065,
    FACILITY_AUDIO                                    = 0x00000066,
    FACILITY_STATEREPOSITORY                          = 0x00000067,
    FACILITY_VISUALCPP                                = 0x0000006d,
    FACILITY_SCRIPT                                   = 0x00000070,
    FACILITY_PARSE                                    = 0x00000071,
    FACILITY_BLB                                      = 0x00000078,
    FACILITY_BLB_CLI                                  = 0x00000079,
    FACILITY_WSBAPP                                   = 0x0000007a,
    FACILITY_BLBUI                                    = 0x00000080,
    FACILITY_USN                                      = 0x00000081,
    FACILITY_USERMODE_VOLSNAP                         = 0x00000082,
    FACILITY_TIERING                                  = 0x00000083,
    FACILITY_WSB_ONLINE                               = 0x00000085,
    FACILITY_ONLINE_ID                                = 0x00000086,
    FACILITY_DEVICE_UPDATE_AGENT                      = 0x00000087,
    FACILITY_DRVSERVICING                             = 0x00000088,
    FACILITY_DLS                                      = 0x00000099,
    FACILITY_DELIVERY_OPTIMIZATION                    = 0x000000d0,
    FACILITY_USERMODE_SPACES                          = 0x000000e7,
    FACILITY_USER_MODE_SECURITY_CORE                  = 0x000000e8,
    FACILITY_USERMODE_LICENSING                       = 0x000000ea,
    FACILITY_SOS                                      = 0x000000a0,
    FACILITY_OCP_UPDATE_AGENT                         = 0x000000ad,
    FACILITY_DEBUGGERS                                = 0x000000b0,
    FACILITY_SPP                                      = 0x00000100,
    FACILITY_RESTORE                                  = 0x00000100,
    FACILITY_DMSERVER                                 = 0x00000100,
    FACILITY_DEPLOYMENT_SERVICES_SERVER               = 0x00000101,
    FACILITY_DEPLOYMENT_SERVICES_IMAGING              = 0x00000102,
    FACILITY_DEPLOYMENT_SERVICES_MANAGEMENT           = 0x00000103,
    FACILITY_DEPLOYMENT_SERVICES_UTIL                 = 0x00000104,
    FACILITY_DEPLOYMENT_SERVICES_BINLSVC              = 0x00000105,
    FACILITY_DEPLOYMENT_SERVICES_PXE                  = 0x00000107,
    FACILITY_DEPLOYMENT_SERVICES_TFTP                 = 0x00000108,
    FACILITY_DEPLOYMENT_SERVICES_TRANSPORT_MANAGEMENT = 0x00000110,
    FACILITY_DEPLOYMENT_SERVICES_DRIVER_PROVISIONING  = 0x00000116,
    FACILITY_DEPLOYMENT_SERVICES_MULTICAST_SERVER     = 0x00000121,
    FACILITY_DEPLOYMENT_SERVICES_MULTICAST_CLIENT     = 0x00000122,
    FACILITY_DEPLOYMENT_SERVICES_CONTENT_PROVIDER     = 0x00000125,
    FACILITY_HSP_SERVICES                             = 0x00000128,
    FACILITY_HSP_SOFTWARE                             = 0x00000129,
    FACILITY_LINGUISTIC_SERVICES                      = 0x00000131,
    FACILITY_AUDIOSTREAMING                           = 0x00000446,
    FACILITY_TTD                                      = 0x000005d2,
    FACILITY_ACCELERATOR                              = 0x00000600,
    FACILITY_WMAAECMA                                 = 0x000007cc,
    FACILITY_DIRECTMUSIC                              = 0x00000878,
    FACILITY_DIRECT3D10                               = 0x00000879,
    FACILITY_DXGI                                     = 0x0000087a,
    FACILITY_DXGI_DDI                                 = 0x0000087b,
    FACILITY_DIRECT3D11                               = 0x0000087c,
    FACILITY_DIRECT3D11_DEBUG                         = 0x0000087d,
    FACILITY_DIRECT3D12                               = 0x0000087e,
    FACILITY_DIRECT3D12_DEBUG                         = 0x0000087f,
    FACILITY_DXCORE                                   = 0x00000880,
    FACILITY_PRESENTATION                             = 0x00000881,
    FACILITY_LEAP                                     = 0x00000888,
    FACILITY_AUDCLNT                                  = 0x00000889,
    FACILITY_WINCODEC_DWRITE_DWM                      = 0x00000898,
    FACILITY_WINML                                    = 0x00000890,
    FACILITY_DIRECT2D                                 = 0x00000899,
    FACILITY_DEFRAG                                   = 0x00000900,
    FACILITY_USERMODE_SDBUS                           = 0x00000901,
    FACILITY_JSCRIPT                                  = 0x00000902,
    FACILITY_PIDGENX                                  = 0x00000a01,
    FACILITY_EAS                                      = 0x00000055,
    FACILITY_WEB                                      = 0x00000375,
    FACILITY_WEB_SOCKET                               = 0x00000376,
    FACILITY_MOBILE                                   = 0x00000701,
    FACILITY_SQLITE                                   = 0x000007af,
    FACILITY_SERVICE_FABRIC                           = 0x000007b0,
    FACILITY_UTC                                      = 0x000007c5,
    FACILITY_WEP                                      = 0x00000801,
    FACILITY_SYNCENGINE                               = 0x00000802,
    FACILITY_XBOX                                     = 0x00000923,
    FACILITY_GAME                                     = 0x00000924,
    FACILITY_PIX                                      = 0x00000abc,
    FACILITY_NT_BIT                                   = 0x10000000,
}

alias THREAD_ERROR_MODE = uint;
enum : uint
{
    SEM_ALL_ERRORS             = 0x00000000,
    SEM_FAILCRITICALERRORS     = 0x00000001,
    SEM_NOGPFAULTERRORBOX      = 0x00000002,
    SEM_NOOPENFILEERRORBOX     = 0x00008000,
    SEM_NOALIGNMENTFAULTEXCEPT = 0x00000004,
}

alias FORMAT_MESSAGE_OPTIONS = uint;
enum : uint
{
    FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100,
    FORMAT_MESSAGE_ARGUMENT_ARRAY  = 0x00002000,
    FORMAT_MESSAGE_FROM_HMODULE    = 0x00000800,
    FORMAT_MESSAGE_FROM_STRING     = 0x00000400,
    FORMAT_MESSAGE_FROM_SYSTEM     = 0x00001000,
    FORMAT_MESSAGE_IGNORE_INSERTS  = 0x00000200,
}

alias RTL_VIRTUAL_UNWIND_HANDLER_TYPE = uint;
enum : uint
{
    UNW_FLAG_NHANDLER  = 0x00000000,
    UNW_FLAG_EHANDLER  = 0x00000001,
    UNW_FLAG_UHANDLER  = 0x00000002,
    UNW_FLAG_CHAININFO = 0x00000004,
}

alias OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS = uint;
enum : uint
{
    WCT_ASYNC_OPEN_FLAG = 0x00000001,
}

alias SYM_SRV_STORE_FILE_FLAGS = uint;
enum : uint
{
    SYMSTOREOPT_COMPRESS       = 0x00000001,
    SYMSTOREOPT_OVERWRITE      = 0x00000002,
    SYMSTOREOPT_PASS_IF_EXISTS = 0x00000040,
    SYMSTOREOPT_POINTER        = 0x00000008,
    SYMSTOREOPT_RETURNINDEX    = 0x00000004,
}

alias PROCESSOR_ARCHITECTURE = ushort;
enum : ushort
{
    PROCESSOR_ARCHITECTURE_AMD64   = 0x0009,
    PROCESSOR_ARCHITECTURE_IA64    = 0x0006,
    PROCESSOR_ARCHITECTURE_INTEL   = 0x0000,
    PROCESSOR_ARCHITECTURE_ARM     = 0x0005,
    PROCESSOR_ARCHITECTURE_UNKNOWN = 0xffff,
}

alias IMAGE_DIRECTORY_ENTRY = uint;
enum : uint
{
    IMAGE_DIRECTORY_ENTRY_ARCHITECTURE   = 0x00000007,
    IMAGE_DIRECTORY_ENTRY_BASERELOC      = 0x00000005,
    IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT   = 0x0000000b,
    IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 0x0000000e,
    IMAGE_DIRECTORY_ENTRY_DEBUG          = 0x00000006,
    IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT   = 0x0000000d,
    IMAGE_DIRECTORY_ENTRY_EXCEPTION      = 0x00000003,
    IMAGE_DIRECTORY_ENTRY_EXPORT         = 0x00000000,
    IMAGE_DIRECTORY_ENTRY_GLOBALPTR      = 0x00000008,
    IMAGE_DIRECTORY_ENTRY_IAT            = 0x0000000c,
    IMAGE_DIRECTORY_ENTRY_IMPORT         = 0x00000001,
    IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG    = 0x0000000a,
    IMAGE_DIRECTORY_ENTRY_RESOURCE       = 0x00000002,
    IMAGE_DIRECTORY_ENTRY_SECURITY       = 0x00000004,
    IMAGE_DIRECTORY_ENTRY_TLS            = 0x00000009,
}

alias WAIT_CHAIN_THREAD_OPTIONS = uint;
enum : uint
{
    WCT_OUT_OF_PROC_COM_FLAG = 0x00000002,
    WCT_OUT_OF_PROC_CS_FLAG  = 0x00000004,
    WCT_OUT_OF_PROC_FLAG     = 0x00000001,
}

alias SYM_FIND_ID_OPTION = uint;
enum : uint
{
    SSRVOPT_DWORD    = 0x00000002,
    SSRVOPT_DWORDPTR = 0x00000004,
    SSRVOPT_GUIDPTR  = 0x00000008,
}

alias IMAGE_FILE_CHARACTERISTICS = ushort;
enum : ushort
{
    IMAGE_FILE_RELOCS_STRIPPED         = 0x0001,
    IMAGE_FILE_EXECUTABLE_IMAGE        = 0x0002,
    IMAGE_FILE_LINE_NUMS_STRIPPED      = 0x0004,
    IMAGE_FILE_LOCAL_SYMS_STRIPPED     = 0x0008,
    IMAGE_FILE_AGGRESIVE_WS_TRIM       = 0x0010,
    IMAGE_FILE_LARGE_ADDRESS_AWARE     = 0x0020,
    IMAGE_FILE_BYTES_REVERSED_LO       = 0x0080,
    IMAGE_FILE_32BIT_MACHINE           = 0x0100,
    IMAGE_FILE_DEBUG_STRIPPED          = 0x0200,
    IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP = 0x0400,
    IMAGE_FILE_NET_RUN_FROM_SWAP       = 0x0800,
    IMAGE_FILE_SYSTEM                  = 0x1000,
    IMAGE_FILE_DLL                     = 0x2000,
    IMAGE_FILE_UP_SYSTEM_ONLY          = 0x4000,
    IMAGE_FILE_BYTES_REVERSED_HI       = 0x8000,
}

alias IMAGE_FILE_CHARACTERISTICS2 = uint;
enum : uint
{
    IMAGE_FILE_RELOCS_STRIPPED2         = 0x00000001,
    IMAGE_FILE_EXECUTABLE_IMAGE2        = 0x00000002,
    IMAGE_FILE_LINE_NUMS_STRIPPED2      = 0x00000004,
    IMAGE_FILE_LOCAL_SYMS_STRIPPED2     = 0x00000008,
    IMAGE_FILE_AGGRESIVE_WS_TRIM2       = 0x00000010,
    IMAGE_FILE_LARGE_ADDRESS_AWARE2     = 0x00000020,
    IMAGE_FILE_BYTES_REVERSED_LO2       = 0x00000080,
    IMAGE_FILE_32BIT_MACHINE2           = 0x00000100,
    IMAGE_FILE_DEBUG_STRIPPED2          = 0x00000200,
    IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP2 = 0x00000400,
    IMAGE_FILE_NET_RUN_FROM_SWAP2       = 0x00000800,
    IMAGE_FILE_SYSTEM_2                 = 0x00001000,
    IMAGE_FILE_DLL_2                    = 0x00002000,
    IMAGE_FILE_UP_SYSTEM_ONLY_2         = 0x00004000,
    IMAGE_FILE_BYTES_REVERSED_HI_2      = 0x00008000,
}

alias SYMBOL_INFO_FLAGS = uint;
enum : uint
{
    SYMFLAG_CLR_TOKEN    = 0x00040000,
    SYMFLAG_CONSTANT     = 0x00000100,
    SYMFLAG_EXPORT       = 0x00000200,
    SYMFLAG_FORWARDER    = 0x00000400,
    SYMFLAG_FRAMEREL     = 0x00000020,
    SYMFLAG_FUNCTION     = 0x00000800,
    SYMFLAG_ILREL        = 0x00010000,
    SYMFLAG_LOCAL        = 0x00000080,
    SYMFLAG_METADATA     = 0x00020000,
    SYMFLAG_PARAMETER    = 0x00000040,
    SYMFLAG_REGISTER     = 0x00000008,
    SYMFLAG_REGREL       = 0x00000010,
    SYMFLAG_SLOT         = 0x00008000,
    SYMFLAG_THUNK        = 0x00002000,
    SYMFLAG_TLSREL       = 0x00004000,
    SYMFLAG_VALUEPRESENT = 0x00000001,
    SYMFLAG_VIRTUAL      = 0x00001000,
}

alias IMAGEHLP_CBA_EVENT_SEVERITY = uint;
enum : uint
{
    sevInfo    = 0x00000000,
    sevProblem = 0x00000001,
    sevAttn    = 0x00000002,
    sevFatal   = 0x00000003,
}

alias IMAGEHLP_GET_TYPE_INFO_FLAGS = uint;
enum : uint
{
    IMAGEHLP_GET_TYPE_INFO_CHILDREN = 0x00000002,
    IMAGEHLP_GET_TYPE_INFO_UNCACHED = 0x00000001,
}

alias RIP_INFO_TYPE = uint;
enum : uint
{
    SLE_ERROR      = 0x00000001,
    SLE_MINORERROR = 0x00000002,
    SLE_WARNING    = 0x00000003,
}

alias VER_PLATFORM = uint;
enum : uint
{
    VER_PLATFORM_WIN32s        = 0x00000000,
    VER_PLATFORM_WIN32_WINDOWS = 0x00000001,
    VER_PLATFORM_WIN32_NT      = 0x00000002,
}

alias IMAGE_DEBUG_TYPE = uint;
enum : uint
{
    IMAGE_DEBUG_TYPE_UNKNOWN   = 0x00000000,
    IMAGE_DEBUG_TYPE_COFF      = 0x00000001,
    IMAGE_DEBUG_TYPE_CODEVIEW  = 0x00000002,
    IMAGE_DEBUG_TYPE_FPO       = 0x00000003,
    IMAGE_DEBUG_TYPE_MISC      = 0x00000004,
    IMAGE_DEBUG_TYPE_EXCEPTION = 0x00000005,
    IMAGE_DEBUG_TYPE_FIXUP     = 0x00000006,
    IMAGE_DEBUG_TYPE_BORLAND   = 0x00000009,
}

alias MINIDUMP_THREAD_INFO_DUMP_FLAGS = uint;
enum : uint
{
    MINIDUMP_THREAD_INFO_ERROR_THREAD    = 0x00000001,
    MINIDUMP_THREAD_INFO_EXITED_THREAD   = 0x00000004,
    MINIDUMP_THREAD_INFO_INVALID_CONTEXT = 0x00000010,
    MINIDUMP_THREAD_INFO_INVALID_INFO    = 0x00000008,
    MINIDUMP_THREAD_INFO_INVALID_TEB     = 0x00000020,
    MINIDUMP_THREAD_INFO_WRITING_THREAD  = 0x00000002,
}

alias DEBUG_EVENT_CODE = uint;
enum : uint
{
    CREATE_PROCESS_DEBUG_EVENT = 0x00000003,
    CREATE_THREAD_DEBUG_EVENT  = 0x00000002,
    EXCEPTION_DEBUG_EVENT      = 0x00000001,
    EXIT_PROCESS_DEBUG_EVENT   = 0x00000005,
    EXIT_THREAD_DEBUG_EVENT    = 0x00000004,
    LOAD_DLL_DEBUG_EVENT       = 0x00000006,
    OUTPUT_DEBUG_STRING_EVENT  = 0x00000008,
    RIP_EVENT                  = 0x00000009,
    UNLOAD_DLL_DEBUG_EVENT     = 0x00000007,
}

alias MINIDUMP_MISC_INFO_FLAGS = uint;
enum : uint
{
    MINIDUMP_MISC1_PROCESS_ID    = 0x00000001,
    MINIDUMP_MISC1_PROCESS_TIMES = 0x00000002,
}

alias MODLOAD_DATA_TYPE = uint;
enum : uint
{
    DBHHEADER_DEBUGDIRS = 0x00000001,
    DBHHEADER_CVMISC    = 0x00000002,
}

BOOLEAN RtlAddFunctionTable(IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*, uint, ulong);
BOOLEAN RtlDeleteFunctionTable(IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*);
BOOLEAN RtlInstallFunctionTableCallback(ulong, ulong, uint, PGET_RUNTIME_FUNCTION_CALLBACK, void*, const(wchar)*);
uint RtlAddGrowableFunctionTable(void**, IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*, uint, uint, ulong, ulong);
IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY* RtlLookupFunctionEntry(ulong, ulong*, UNWIND_HISTORY_TABLE*);
EXCEPTION_ROUTINE RtlVirtualUnwind(RTL_VIRTUAL_UNWIND_HANDLER_TYPE, ulong, ulong, IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*, CONTEXT*, void**, ulong*, KNONVOLATILE_CONTEXT_POINTERS_ARM64*);
HRESULT DebugConnect(const(char)*, const(GUID)*, void**);
HRESULT DebugConnectWide(const(wchar)*, const(GUID)*, void**);
HRESULT DebugCreate(const(GUID)*, void**);
HRESULT DebugCreateEx(const(GUID)*, uint, void**);
HRESULT CreateDataModelManager(IDebugHost, IDataModelManager*);
BOOL ReadProcessMemory(HANDLE, const(void)*, void*, ulong, ulong*);
BOOL WriteProcessMemory(HANDLE, void*, const(void)*, ulong, ulong*);
BOOL GetThreadContext(HANDLE, CONTEXT*);
BOOL SetThreadContext(HANDLE, const(CONTEXT)*);
BOOL FlushInstructionCache(HANDLE, const(void)*, ulong);
BOOL Wow64GetThreadContext(HANDLE, WOW64_CONTEXT*);
BOOL Wow64SetThreadContext(HANDLE, const(WOW64_CONTEXT)*);
void RtlCaptureContext2(CONTEXT*);
/+ [CONFLICTED] BOOLEAN RtlAddFunctionTable(IMAGE_RUNTIME_FUNCTION_ENTRY*, uint, ulong);
+/
/+ [CONFLICTED] BOOLEAN RtlDeleteFunctionTable(IMAGE_RUNTIME_FUNCTION_ENTRY*);
+/
/+ [CONFLICTED] BOOLEAN RtlInstallFunctionTableCallback(ulong, ulong, uint, PGET_RUNTIME_FUNCTION_CALLBACK, void*, const(wchar)*);
+/
/+ [CONFLICTED] uint RtlAddGrowableFunctionTable(void**, IMAGE_RUNTIME_FUNCTION_ENTRY*, uint, uint, ulong, ulong);
+/
void RtlGrowFunctionTable(void*, uint);
void RtlDeleteGrowableFunctionTable(void*);
/+ [CONFLICTED] IMAGE_RUNTIME_FUNCTION_ENTRY* RtlLookupFunctionEntry(ulong, ulong*, UNWIND_HISTORY_TABLE*);
+/
void RtlUnwindEx(void*, void*, EXCEPTION_RECORD*, void*, CONTEXT*, UNWIND_HISTORY_TABLE*);
/+ [CONFLICTED] EXCEPTION_ROUTINE RtlVirtualUnwind(RTL_VIRTUAL_UNWIND_HANDLER_TYPE, ulong, ulong, IMAGE_RUNTIME_FUNCTION_ENTRY*, CONTEXT*, void**, ulong*, KNONVOLATILE_CONTEXT_POINTERS*);
+/
IMAGE_NT_HEADERS64* CheckSumMappedFile(void*, uint, uint*, uint*);
BOOL GetImageConfigInformation(LOADED_IMAGE*, IMAGE_LOAD_CONFIG_DIRECTORY64*);
BOOL SetImageConfigInformation(LOADED_IMAGE*, IMAGE_LOAD_CONFIG_DIRECTORY64*);
IMAGE_NT_HEADERS64* ImageNtHeader(void*);
IMAGE_SECTION_HEADER* ImageRvaToSection(IMAGE_NT_HEADERS64*, void*, uint);
void* ImageRvaToVa(IMAGE_NT_HEADERS64*, void*, uint, IMAGE_SECTION_HEADER**);
ushort RtlCaptureStackBackTrace(uint, uint, void**, uint*);
void RtlCaptureContext(CONTEXT*);
void RtlUnwind(void*, void*, EXCEPTION_RECORD*, void*);
void RtlRestoreContext(CONTEXT*, EXCEPTION_RECORD*);
void RtlRaiseException(EXCEPTION_RECORD*);
void* RtlPcToFileHeader(void*, void**);
BOOL IsDebuggerPresent();
void DebugBreak();
void OutputDebugStringA(const(char)*);
void OutputDebugStringW(const(wchar)*);
BOOL ContinueDebugEvent(uint, uint, uint);
BOOL WaitForDebugEvent(DEBUG_EVENT*, uint);
BOOL DebugActiveProcess(uint);
BOOL DebugActiveProcessStop(uint);
BOOL CheckRemoteDebuggerPresent(HANDLE, BOOL*);
BOOL WaitForDebugEventEx(DEBUG_EVENT*, uint);
void* EncodePointer(void*);
void* DecodePointer(void*);
void* EncodeSystemPointer(void*);
void* DecodeSystemPointer(void*);
HRESULT EncodeRemotePointer(HANDLE, void*, void**);
HRESULT DecodeRemotePointer(HANDLE, void*, void**);
BOOL Beep(uint, uint);
void RaiseException(uint, uint, uint, const(ulong)*);
int UnhandledExceptionFilter(EXCEPTION_POINTERS*);
LPTOP_LEVEL_EXCEPTION_FILTER SetUnhandledExceptionFilter(LPTOP_LEVEL_EXCEPTION_FILTER);
uint GetErrorMode();
uint SetErrorMode(THREAD_ERROR_MODE);
void* AddVectoredExceptionHandler(uint, PVECTORED_EXCEPTION_HANDLER);
uint RemoveVectoredExceptionHandler(void*);
void* AddVectoredContinueHandler(uint, PVECTORED_EXCEPTION_HANDLER);
uint RemoveVectoredContinueHandler(void*);
void RaiseFailFastException(EXCEPTION_RECORD*, CONTEXT*, uint);
void FatalAppExitA(uint, const(char)*);
void FatalAppExitW(uint, const(wchar)*);
uint GetThreadErrorMode();
BOOL SetThreadErrorMode(THREAD_ERROR_MODE, THREAD_ERROR_MODE*);
void TerminateProcessOnMemoryExhaustion(ulong);
void* OpenThreadWaitChainSession(OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS, PWAITCHAINCALLBACK);
void CloseThreadWaitChainSession(void*);
BOOL GetThreadWaitChain(void*, ulong, WAIT_CHAIN_THREAD_OPTIONS, uint, uint*, WAITCHAIN_NODE_INFO*, int*);
void RegisterWaitChainCOMCallback(PCOGETCALLSTATE, PCOGETACTIVATIONSTATE);
BOOL MiniDumpWriteDump(HANDLE, uint, HANDLE, MINIDUMP_TYPE, MINIDUMP_EXCEPTION_INFORMATION*, MINIDUMP_USER_STREAM_INFORMATION*, MINIDUMP_CALLBACK_INFORMATION*);
BOOL MiniDumpReadDumpStream(void*, uint, MINIDUMP_DIRECTORY**, void**, uint*);
BOOL BindImage(const(char)*, const(char)*, const(char)*);
BOOL BindImageEx(uint, const(char)*, const(char)*, const(char)*, PIMAGEHLP_STATUS_ROUTINE);
BOOL ReBaseImage(const(char)*, const(char)*, BOOL, BOOL, BOOL, uint, uint*, ulong*, uint*, ulong*, uint);
BOOL ReBaseImage64(const(char)*, const(char)*, BOOL, BOOL, BOOL, uint, uint*, ulong*, uint*, ulong*, uint);
/+ [CONFLICTED] IMAGE_NT_HEADERS32* CheckSumMappedFile(void*, uint, uint*, uint*);
+/
uint MapFileAndCheckSumA(const(char)*, uint*, uint*);
uint MapFileAndCheckSumW(const(wchar)*, uint*, uint*);
/+ [CONFLICTED] BOOL GetImageConfigInformation(LOADED_IMAGE*, IMAGE_LOAD_CONFIG_DIRECTORY32*);
+/
uint GetImageUnusedHeaderBytes(LOADED_IMAGE*, uint*);
/+ [CONFLICTED] BOOL SetImageConfigInformation(LOADED_IMAGE*, IMAGE_LOAD_CONFIG_DIRECTORY32*);
+/
BOOL ImageGetDigestStream(HANDLE, uint, DIGEST_FUNCTION, void*);
BOOL ImageAddCertificate(HANDLE, WIN_CERTIFICATE*, uint*);
BOOL ImageRemoveCertificate(HANDLE, uint);
BOOL ImageEnumerateCertificates(HANDLE, ushort, uint*, uint*, uint);
BOOL ImageGetCertificateData(HANDLE, uint, WIN_CERTIFICATE*, uint*);
BOOL ImageGetCertificateHeader(HANDLE, uint, WIN_CERTIFICATE*);
LOADED_IMAGE* ImageLoad(const(char)*, const(char)*);
BOOL ImageUnload(LOADED_IMAGE*);
BOOL MapAndLoad(const(char)*, const(char)*, LOADED_IMAGE*, BOOL, BOOL);
BOOL UnMapAndLoad(LOADED_IMAGE*);
BOOL TouchFileTimes(HANDLE, SYSTEMTIME*);
BOOL UpdateDebugInfoFile(const(char)*, const(char)*, PSTR, IMAGE_NT_HEADERS32*);
BOOL UpdateDebugInfoFileEx(const(char)*, const(char)*, PSTR, IMAGE_NT_HEADERS32*, uint);
HANDLE SymFindDebugInfoFile(HANDLE, const(char)*, PSTR, PFIND_DEBUG_FILE_CALLBACK, void*);
HANDLE SymFindDebugInfoFileW(HANDLE, const(wchar)*, PWSTR, PFIND_DEBUG_FILE_CALLBACKW, void*);
HANDLE FindDebugInfoFile(const(char)*, const(char)*, PSTR);
HANDLE FindDebugInfoFileEx(const(char)*, const(char)*, PSTR, PFIND_DEBUG_FILE_CALLBACK, void*);
HANDLE FindDebugInfoFileExW(const(wchar)*, const(wchar)*, PWSTR, PFIND_DEBUG_FILE_CALLBACKW, void*);
BOOL SymFindFileInPath(HANDLE, const(char)*, const(char)*, void*, uint, uint, SYM_FIND_ID_OPTION, PSTR, PFINDFILEINPATHCALLBACK, void*);
BOOL SymFindFileInPathW(HANDLE, const(wchar)*, const(wchar)*, void*, uint, uint, SYM_FIND_ID_OPTION, PWSTR, PFINDFILEINPATHCALLBACKW, void*);
HANDLE SymFindExecutableImage(HANDLE, const(char)*, PSTR, PFIND_EXE_FILE_CALLBACK, void*);
HANDLE SymFindExecutableImageW(HANDLE, const(wchar)*, PWSTR, PFIND_EXE_FILE_CALLBACKW, void*);
HANDLE FindExecutableImage(const(char)*, const(char)*, PSTR);
HANDLE FindExecutableImageEx(const(char)*, const(char)*, PSTR, PFIND_EXE_FILE_CALLBACK, void*);
HANDLE FindExecutableImageExW(const(wchar)*, const(wchar)*, PWSTR, PFIND_EXE_FILE_CALLBACKW, void*);
/+ [CONFLICTED] IMAGE_NT_HEADERS32* ImageNtHeader(void*);
+/
void* ImageDirectoryEntryToDataEx(void*, BOOLEAN, IMAGE_DIRECTORY_ENTRY, uint*, IMAGE_SECTION_HEADER**);
void* ImageDirectoryEntryToData(void*, BOOLEAN, IMAGE_DIRECTORY_ENTRY, uint*);
/+ [CONFLICTED] IMAGE_SECTION_HEADER* ImageRvaToSection(IMAGE_NT_HEADERS32*, void*, uint);
+/
/+ [CONFLICTED] void* ImageRvaToVa(IMAGE_NT_HEADERS32*, void*, uint, IMAGE_SECTION_HEADER**);
+/
BOOL SearchTreeForFile(const(char)*, const(char)*, PSTR);
BOOL SearchTreeForFileW(const(wchar)*, const(wchar)*, PWSTR);
BOOL EnumDirTree(HANDLE, const(char)*, const(char)*, PSTR, PENUMDIRTREE_CALLBACK, void*);
BOOL EnumDirTreeW(HANDLE, const(wchar)*, const(wchar)*, PWSTR, PENUMDIRTREE_CALLBACKW, void*);
BOOL MakeSureDirectoryPathExists(const(char)*);
uint UnDecorateSymbolName(const(char)*, PSTR, uint, uint);
uint UnDecorateSymbolNameW(const(wchar)*, PWSTR, uint, uint);
BOOL StackWalk64(uint, HANDLE, HANDLE, STACKFRAME64*, void*, PREAD_PROCESS_MEMORY_ROUTINE64, PFUNCTION_TABLE_ACCESS_ROUTINE64, PGET_MODULE_BASE_ROUTINE64, PTRANSLATE_ADDRESS_ROUTINE64);
BOOL StackWalkEx(uint, HANDLE, HANDLE, STACKFRAME_EX*, void*, PREAD_PROCESS_MEMORY_ROUTINE64, PFUNCTION_TABLE_ACCESS_ROUTINE64, PGET_MODULE_BASE_ROUTINE64, PTRANSLATE_ADDRESS_ROUTINE64, uint);
BOOL StackWalk(uint, HANDLE, HANDLE, STACKFRAME*, void*, PREAD_PROCESS_MEMORY_ROUTINE, PFUNCTION_TABLE_ACCESS_ROUTINE, PGET_MODULE_BASE_ROUTINE, PTRANSLATE_ADDRESS_ROUTINE);
API_VERSION* ImagehlpApiVersion();
API_VERSION* ImagehlpApiVersionEx(API_VERSION*);
uint GetTimestampForLoadedLibrary(HINSTANCE);
BOOL SymSetParentWindow(HWND);
PSTR SymSetHomeDirectory(HANDLE, const(char)*);
PWSTR SymSetHomeDirectoryW(HANDLE, const(wchar)*);
PSTR SymGetHomeDirectory(IMAGEHLP_HD_TYPE, PSTR, ulong);
PWSTR SymGetHomeDirectoryW(IMAGEHLP_HD_TYPE, PWSTR, ulong);
BOOL SymGetOmaps(HANDLE, ulong, OMAP**, ulong*, OMAP**, ulong*);
uint SymSetOptions(uint);
uint SymGetOptions();
BOOL SymCleanup(HANDLE);
BOOL SymGetExtendedOption(IMAGEHLP_EXTENDED_OPTIONS);
BOOL SymSetExtendedOption(IMAGEHLP_EXTENDED_OPTIONS, BOOL);
BOOL SymMatchString(const(char)*, const(char)*, BOOL);
BOOL SymMatchStringA(const(char)*, const(char)*, BOOL);
BOOL SymMatchStringW(const(wchar)*, const(wchar)*, BOOL);
BOOL SymEnumSourceFiles(HANDLE, ulong, const(char)*, PSYM_ENUMSOURCEFILES_CALLBACK, void*);
BOOL SymEnumSourceFilesW(HANDLE, ulong, const(wchar)*, PSYM_ENUMSOURCEFILES_CALLBACKW, void*);
BOOL SymEnumerateModules64(HANDLE, PSYM_ENUMMODULES_CALLBACK64, void*);
BOOL SymEnumerateModulesW64(HANDLE, PSYM_ENUMMODULES_CALLBACKW64, void*);
BOOL SymEnumerateModules(HANDLE, PSYM_ENUMMODULES_CALLBACK, void*);
BOOL EnumerateLoadedModulesEx(HANDLE, PENUMLOADED_MODULES_CALLBACK64, void*);
BOOL EnumerateLoadedModulesExW(HANDLE, PENUMLOADED_MODULES_CALLBACKW64, void*);
BOOL EnumerateLoadedModules64(HANDLE, PENUMLOADED_MODULES_CALLBACK64, void*);
BOOL EnumerateLoadedModulesW64(HANDLE, PENUMLOADED_MODULES_CALLBACKW64, void*);
BOOL EnumerateLoadedModules(HANDLE, PENUMLOADED_MODULES_CALLBACK, void*);
void* SymFunctionTableAccess64(HANDLE, ulong);
void* SymFunctionTableAccess64AccessRoutines(HANDLE, ulong, PREAD_PROCESS_MEMORY_ROUTINE64, PGET_MODULE_BASE_ROUTINE64);
void* SymFunctionTableAccess(HANDLE, uint);
BOOL SymGetUnwindInfo(HANDLE, ulong, void*, uint*);
BOOL SymGetModuleInfo64(HANDLE, ulong, IMAGEHLP_MODULE64*);
BOOL SymGetModuleInfoW64(HANDLE, ulong, IMAGEHLP_MODULEW64*);
BOOL SymGetModuleInfo(HANDLE, uint, IMAGEHLP_MODULE*);
BOOL SymGetModuleInfoW(HANDLE, uint, IMAGEHLP_MODULEW*);
ulong SymGetModuleBase64(HANDLE, ulong);
uint SymGetModuleBase(HANDLE, uint);
BOOL SymEnumLines(HANDLE, ulong, const(char)*, const(char)*, PSYM_ENUMLINES_CALLBACK, void*);
BOOL SymEnumLinesW(HANDLE, ulong, const(wchar)*, const(wchar)*, PSYM_ENUMLINES_CALLBACKW, void*);
BOOL SymGetLineFromAddr64(HANDLE, ulong, uint*, IMAGEHLP_LINE64*);
BOOL SymGetLineFromAddrW64(HANDLE, ulong, uint*, IMAGEHLP_LINEW64*);
BOOL SymGetLineFromInlineContext(HANDLE, ulong, uint, ulong, uint*, IMAGEHLP_LINE64*);
BOOL SymGetLineFromInlineContextW(HANDLE, ulong, uint, ulong, uint*, IMAGEHLP_LINEW64*);
BOOL SymEnumSourceLines(HANDLE, ulong, const(char)*, const(char)*, uint, uint, PSYM_ENUMLINES_CALLBACK, void*);
BOOL SymEnumSourceLinesW(HANDLE, ulong, const(wchar)*, const(wchar)*, uint, uint, PSYM_ENUMLINES_CALLBACKW, void*);
uint SymAddrIncludeInlineTrace(HANDLE, ulong);
uint SymCompareInlineTrace(HANDLE, ulong, uint, ulong, ulong, ulong);
BOOL SymQueryInlineTrace(HANDLE, ulong, uint, ulong, ulong, uint*, uint*);
BOOL SymGetLineFromAddr(HANDLE, uint, uint*, IMAGEHLP_LINE*);
BOOL SymGetLineFromName64(HANDLE, const(char)*, const(char)*, uint, int*, IMAGEHLP_LINE64*);
BOOL SymGetLineFromNameW64(HANDLE, const(wchar)*, const(wchar)*, uint, int*, IMAGEHLP_LINEW64*);
BOOL SymGetLineFromName(HANDLE, const(char)*, const(char)*, uint, int*, IMAGEHLP_LINE*);
BOOL SymGetLineNext64(HANDLE, IMAGEHLP_LINE64*);
BOOL SymGetLineNextW64(HANDLE, IMAGEHLP_LINEW64*);
BOOL SymGetLineNext(HANDLE, IMAGEHLP_LINE*);
BOOL SymGetLinePrev64(HANDLE, IMAGEHLP_LINE64*);
BOOL SymGetLinePrevW64(HANDLE, IMAGEHLP_LINEW64*);
BOOL SymGetLinePrev(HANDLE, IMAGEHLP_LINE*);
uint SymGetFileLineOffsets64(HANDLE, const(char)*, const(char)*, ulong*, uint);
BOOL SymMatchFileName(const(char)*, const(char)*, PSTR*, PSTR*);
BOOL SymMatchFileNameW(const(wchar)*, const(wchar)*, PWSTR*, PWSTR*);
BOOL SymGetSourceFile(HANDLE, ulong, const(char)*, const(char)*, PSTR, uint);
BOOL SymGetSourceFileW(HANDLE, ulong, const(wchar)*, const(wchar)*, PWSTR, uint);
BOOL SymGetSourceFileToken(HANDLE, ulong, const(char)*, void**, uint*);
BOOL SymGetSourceFileTokenByTokenName(HANDLE, ulong, const(char)*, const(char)*, const(char)*, void**, uint*);
BOOL SymGetSourceFileChecksumW(HANDLE, ulong, const(wchar)*, uint*, ubyte*, uint, uint*);
BOOL SymGetSourceFileChecksum(HANDLE, ulong, const(char)*, uint*, ubyte*, uint, uint*);
BOOL SymGetSourceFileTokenW(HANDLE, ulong, const(wchar)*, void**, uint*);
BOOL SymGetSourceFileTokenByTokenNameW(HANDLE, ulong, const(wchar)*, const(wchar)*, const(wchar)*, void**, uint*);
BOOL SymGetSourceFileFromToken(HANDLE, void*, const(char)*, PSTR, uint);
BOOL SymGetSourceFileFromTokenByTokenName(HANDLE, void*, const(char)*, const(char)*, PSTR, uint);
BOOL SymGetSourceFileFromTokenW(HANDLE, void*, const(wchar)*, PWSTR, uint);
BOOL SymGetSourceFileFromTokenByTokenNameW(HANDLE, void*, const(wchar)*, const(wchar)*, PWSTR, uint);
BOOL SymGetSourceVarFromToken(HANDLE, void*, const(char)*, const(char)*, PSTR, uint);
BOOL SymGetSourceVarFromTokenW(HANDLE, void*, const(wchar)*, const(wchar)*, PWSTR, uint);
BOOL SymEnumSourceFileTokens(HANDLE, ulong, PENUMSOURCEFILETOKENSCALLBACK);
BOOL SymInitialize(HANDLE, const(char)*, BOOL);
BOOL SymInitializeW(HANDLE, const(wchar)*, BOOL);
BOOL SymGetSearchPath(HANDLE, PSTR, uint);
BOOL SymGetSearchPathW(HANDLE, PWSTR, uint);
BOOL SymSetSearchPath(HANDLE, const(char)*);
BOOL SymSetSearchPathW(HANDLE, const(wchar)*);
ulong SymLoadModuleEx(HANDLE, HANDLE, const(char)*, const(char)*, ulong, uint, MODLOAD_DATA*, SYM_LOAD_FLAGS);
ulong SymLoadModuleExW(HANDLE, HANDLE, const(wchar)*, const(wchar)*, ulong, uint, MODLOAD_DATA*, SYM_LOAD_FLAGS);
BOOL SymUnloadModule64(HANDLE, ulong);
BOOL SymUnloadModule(HANDLE, uint);
BOOL SymUnDName64(IMAGEHLP_SYMBOL64*, PSTR, uint);
BOOL SymUnDName(IMAGEHLP_SYMBOL*, PSTR, uint);
BOOL SymRegisterCallback64(HANDLE, PSYMBOL_REGISTERED_CALLBACK64, ulong);
BOOL SymRegisterCallbackW64(HANDLE, PSYMBOL_REGISTERED_CALLBACK64, ulong);
BOOL SymRegisterFunctionEntryCallback64(HANDLE, PSYMBOL_FUNCENTRY_CALLBACK64, ulong);
BOOL SymRegisterCallback(HANDLE, PSYMBOL_REGISTERED_CALLBACK, void*);
BOOL SymRegisterFunctionEntryCallback(HANDLE, PSYMBOL_FUNCENTRY_CALLBACK, void*);
BOOL SymSetContext(HANDLE, IMAGEHLP_STACK_FRAME*, void*);
BOOL SymSetScopeFromAddr(HANDLE, ulong);
BOOL SymSetScopeFromInlineContext(HANDLE, ulong, uint);
BOOL SymSetScopeFromIndex(HANDLE, ulong, uint);
BOOL SymEnumProcesses(PSYM_ENUMPROCESSES_CALLBACK, void*);
BOOL SymFromAddr(HANDLE, ulong, ulong*, SYMBOL_INFO*);
BOOL SymFromAddrW(HANDLE, ulong, ulong*, SYMBOL_INFOW*);
BOOL SymFromInlineContext(HANDLE, ulong, uint, ulong*, SYMBOL_INFO*);
BOOL SymFromInlineContextW(HANDLE, ulong, uint, ulong*, SYMBOL_INFOW*);
BOOL SymFromToken(HANDLE, ulong, uint, SYMBOL_INFO*);
BOOL SymFromTokenW(HANDLE, ulong, uint, SYMBOL_INFOW*);
BOOL SymNext(HANDLE, SYMBOL_INFO*);
BOOL SymNextW(HANDLE, SYMBOL_INFOW*);
BOOL SymPrev(HANDLE, SYMBOL_INFO*);
BOOL SymPrevW(HANDLE, SYMBOL_INFOW*);
BOOL SymFromName(HANDLE, const(char)*, SYMBOL_INFO*);
BOOL SymFromNameW(HANDLE, const(wchar)*, SYMBOL_INFOW*);
BOOL SymEnumSymbols(HANDLE, ulong, const(char)*, PSYM_ENUMERATESYMBOLS_CALLBACK, void*);
BOOL SymEnumSymbolsEx(HANDLE, ulong, const(char)*, PSYM_ENUMERATESYMBOLS_CALLBACK, void*, uint);
BOOL SymEnumSymbolsW(HANDLE, ulong, const(wchar)*, PSYM_ENUMERATESYMBOLS_CALLBACKW, void*);
BOOL SymEnumSymbolsExW(HANDLE, ulong, const(wchar)*, PSYM_ENUMERATESYMBOLS_CALLBACKW, void*, uint);
BOOL SymEnumSymbolsForAddr(HANDLE, ulong, PSYM_ENUMERATESYMBOLS_CALLBACK, void*);
BOOL SymEnumSymbolsForAddrW(HANDLE, ulong, PSYM_ENUMERATESYMBOLS_CALLBACKW, void*);
BOOL SymSearch(HANDLE, ulong, uint, uint, const(char)*, ulong, PSYM_ENUMERATESYMBOLS_CALLBACK, void*, uint);
BOOL SymSearchW(HANDLE, ulong, uint, uint, const(wchar)*, ulong, PSYM_ENUMERATESYMBOLS_CALLBACKW, void*, uint);
BOOL SymGetScope(HANDLE, ulong, uint, SYMBOL_INFO*);
BOOL SymGetScopeW(HANDLE, ulong, uint, SYMBOL_INFOW*);
BOOL SymFromIndex(HANDLE, ulong, uint, SYMBOL_INFO*);
BOOL SymFromIndexW(HANDLE, ulong, uint, SYMBOL_INFOW*);
BOOL SymGetTypeInfo(HANDLE, ulong, uint, IMAGEHLP_SYMBOL_TYPE_INFO, void*);
BOOL SymGetTypeInfoEx(HANDLE, ulong, IMAGEHLP_GET_TYPE_INFO_PARAMS*);
BOOL SymEnumTypes(HANDLE, ulong, PSYM_ENUMERATESYMBOLS_CALLBACK, void*);
BOOL SymEnumTypesW(HANDLE, ulong, PSYM_ENUMERATESYMBOLS_CALLBACKW, void*);
BOOL SymEnumTypesByName(HANDLE, ulong, const(char)*, PSYM_ENUMERATESYMBOLS_CALLBACK, void*);
BOOL SymEnumTypesByNameW(HANDLE, ulong, const(wchar)*, PSYM_ENUMERATESYMBOLS_CALLBACKW, void*);
BOOL SymGetTypeFromName(HANDLE, ulong, const(char)*, SYMBOL_INFO*);
BOOL SymGetTypeFromNameW(HANDLE, ulong, const(wchar)*, SYMBOL_INFOW*);
BOOL SymAddSymbol(HANDLE, ulong, const(char)*, ulong, uint, uint);
BOOL SymAddSymbolW(HANDLE, ulong, const(wchar)*, ulong, uint, uint);
BOOL SymDeleteSymbol(HANDLE, ulong, const(char)*, ulong, uint);
BOOL SymDeleteSymbolW(HANDLE, ulong, const(wchar)*, ulong, uint);
BOOL SymRefreshModuleList(HANDLE);
BOOL SymAddSourceStream(HANDLE, ulong, const(char)*, ubyte*, ulong);
BOOL SymAddSourceStreamA(HANDLE, ulong, const(char)*, ubyte*, ulong);
BOOL SymAddSourceStreamW(HANDLE, ulong, const(wchar)*, ubyte*, ulong);
BOOL SymSrvIsStoreW(HANDLE, const(wchar)*);
BOOL SymSrvIsStore(HANDLE, const(char)*);
PSTR SymSrvDeltaName(HANDLE, const(char)*, const(char)*, const(char)*, const(char)*);
PWSTR SymSrvDeltaNameW(HANDLE, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
PSTR SymSrvGetSupplement(HANDLE, const(char)*, const(char)*, const(char)*);
PWSTR SymSrvGetSupplementW(HANDLE, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL SymSrvGetFileIndexes(const(char)*, GUID*, uint*, uint*, uint);
BOOL SymSrvGetFileIndexesW(const(wchar)*, GUID*, uint*, uint*, uint);
BOOL SymSrvGetFileIndexStringW(HANDLE, const(wchar)*, const(wchar)*, PWSTR, ulong, uint);
BOOL SymSrvGetFileIndexString(HANDLE, const(char)*, const(char)*, PSTR, ulong, uint);
BOOL SymSrvGetFileIndexInfo(const(char)*, SYMSRV_INDEX_INFO*, uint);
BOOL SymSrvGetFileIndexInfoW(const(wchar)*, SYMSRV_INDEX_INFOW*, uint);
PSTR SymSrvStoreSupplement(HANDLE, const(char)*, const(char)*, const(char)*, uint);
PWSTR SymSrvStoreSupplementW(HANDLE, const(wchar)*, const(wchar)*, const(wchar)*, uint);
PSTR SymSrvStoreFile(HANDLE, const(char)*, const(char)*, SYM_SRV_STORE_FILE_FLAGS);
PWSTR SymSrvStoreFileW(HANDLE, const(wchar)*, const(wchar)*, SYM_SRV_STORE_FILE_FLAGS);
BOOL SymGetSymbolFile(HANDLE, const(char)*, const(char)*, IMAGEHLP_SF_TYPE, PSTR, ulong, PSTR, ulong);
BOOL SymGetSymbolFileW(HANDLE, const(wchar)*, const(wchar)*, IMAGEHLP_SF_TYPE, PWSTR, ulong, PWSTR, ulong);
BOOL DbgHelpCreateUserDump(const(char)*, PDBGHELP_CREATE_USER_DUMP_CALLBACK, void*);
BOOL DbgHelpCreateUserDumpW(const(wchar)*, PDBGHELP_CREATE_USER_DUMP_CALLBACK, void*);
BOOL SymGetSymFromAddr64(HANDLE, ulong, ulong*, IMAGEHLP_SYMBOL64*);
BOOL SymGetSymFromAddr(HANDLE, uint, uint*, IMAGEHLP_SYMBOL*);
BOOL SymGetSymFromName64(HANDLE, const(char)*, IMAGEHLP_SYMBOL64*);
BOOL SymGetSymFromName(HANDLE, const(char)*, IMAGEHLP_SYMBOL*);
BOOL FindFileInPath(HANDLE, const(char)*, const(char)*, void*, uint, uint, uint, PSTR);
BOOL FindFileInSearchPath(HANDLE, const(char)*, const(char)*, uint, uint, uint, PSTR);
BOOL SymEnumSym(HANDLE, ulong, PSYM_ENUMERATESYMBOLS_CALLBACK, void*);
BOOL SymEnumerateSymbols64(HANDLE, ulong, PSYM_ENUMSYMBOLS_CALLBACK64, void*);
BOOL SymEnumerateSymbolsW64(HANDLE, ulong, PSYM_ENUMSYMBOLS_CALLBACK64W, void*);
BOOL SymEnumerateSymbols(HANDLE, uint, PSYM_ENUMSYMBOLS_CALLBACK, void*);
BOOL SymEnumerateSymbolsW(HANDLE, uint, PSYM_ENUMSYMBOLS_CALLBACKW, void*);
ulong SymLoadModule64(HANDLE, HANDLE, const(char)*, const(char)*, ulong, uint);
uint SymLoadModule(HANDLE, HANDLE, const(char)*, const(char)*, uint, uint);
BOOL SymGetSymNext64(HANDLE, IMAGEHLP_SYMBOL64*);
BOOL SymGetSymNext(HANDLE, IMAGEHLP_SYMBOL*);
BOOL SymGetSymPrev64(HANDLE, IMAGEHLP_SYMBOL64*);
BOOL SymGetSymPrev(HANDLE, IMAGEHLP_SYMBOL*);
void SetCheckUserInterruptShared(LPCALL_BACK_USER_INTERRUPT_ROUTINE);
uint GetSymLoadError();
void SetSymLoadError(uint);
BOOL ReportSymbolLoadSummary(HANDLE, const(wchar)*, DBGHELP_DATA_REPORT_STRUCT*);
void RemoveInvalidModuleList(HANDLE);
void* RangeMapCreate();
void RangeMapFree(void*);
BOOL RangeMapAddPeImageSections(void*, const(wchar)*, void*, uint, ulong, ulong, uint);
BOOL RangeMapRemove(void*, ulong);
BOOL RangeMapRead(void*, ulong, void*, uint, uint, uint*);
BOOL RangeMapWrite(void*, ulong, void*, uint, uint, uint*);
BOOL MessageBeep(MESSAGEBOX_STYLE);
void FatalExit(int);
BOOL GetThreadSelectorEntry(HANDLE, uint, LDT_ENTRY*);
BOOL Wow64GetThreadSelectorEntry(HANDLE, uint, WOW64_LDT_ENTRY*);
BOOL DebugSetProcessKillOnExit(BOOL);
BOOL DebugBreakProcess(HANDLE);
uint FormatMessageA(FORMAT_MESSAGE_OPTIONS, const(void)*, uint, uint, PSTR, uint, byte**);
uint FormatMessageW(FORMAT_MESSAGE_OPTIONS, const(void)*, uint, uint, PWSTR, uint, byte**);
BOOL CopyContext(CONTEXT*, uint, CONTEXT*);
BOOL InitializeContext(void*, uint, CONTEXT**, uint*);
BOOL InitializeContext2(void*, uint, CONTEXT**, uint*, ulong);
ulong GetEnabledXStateFeatures();
BOOL GetXStateFeaturesMask(CONTEXT*, ulong*);
void* LocateXStateFeature(CONTEXT*, uint, uint*);
BOOL SetXStateFeaturesMask(CONTEXT*, ulong);
enum WOW64_CONTEXT_i386 = 0x00010000;
enum WOW64_CONTEXT_i486 = 0x00010000;
enum WOW64_CONTEXT_EXCEPTION_ACTIVE = 0x08000000;
enum WOW64_CONTEXT_SERVICE_ACTIVE = 0x10000000;
enum WOW64_CONTEXT_EXCEPTION_REQUEST = 0x40000000;
enum WOW64_CONTEXT_EXCEPTION_REPORTING = 0x80000000;
enum WOW64_SIZE_OF_80387_REGISTERS = 0x00000050;
enum WOW64_MAXIMUM_SUPPORTED_EXTENSION = 0x00000200;
enum ERROR_DBG_CANCELLED = 0xc00004c7;
enum ERROR_DBG_TIMEOUT = 0xc00005b4;
enum DEBUG_GET_TEXT_COMPLETIONS_NO_DOT_COMMANDS = 0x00000001;
enum DEBUG_GET_TEXT_COMPLETIONS_NO_EXTENSION_COMMANDS = 0x00000002;
enum DEBUG_GET_TEXT_COMPLETIONS_NO_SYMBOLS = 0x00000004;
enum DEBUG_GET_TEXT_COMPLETIONS_IS_DOT_COMMAND = 0x00000001;
enum DEBUG_GET_TEXT_COMPLETIONS_IS_EXTENSION_COMMAND = 0x00000002;
enum DEBUG_GET_TEXT_COMPLETIONS_IS_SYMBOL = 0x00000004;
enum DEBUG_REQUEST_SOURCE_PATH_HAS_SOURCE_SERVER = 0x00000000;
enum DEBUG_REQUEST_TARGET_EXCEPTION_CONTEXT = 0x00000001;
enum DEBUG_REQUEST_TARGET_EXCEPTION_THREAD = 0x00000002;
enum DEBUG_REQUEST_TARGET_EXCEPTION_RECORD = 0x00000003;
enum DEBUG_REQUEST_GET_ADDITIONAL_CREATE_OPTIONS = 0x00000004;
enum DEBUG_REQUEST_SET_ADDITIONAL_CREATE_OPTIONS = 0x00000005;
enum DEBUG_REQUEST_GET_WIN32_MAJOR_MINOR_VERSIONS = 0x00000006;
enum DEBUG_REQUEST_READ_USER_MINIDUMP_STREAM = 0x00000007;
enum DEBUG_REQUEST_TARGET_CAN_DETACH = 0x00000008;
enum DEBUG_REQUEST_SET_LOCAL_IMPLICIT_COMMAND_LINE = 0x00000009;
enum DEBUG_REQUEST_GET_CAPTURED_EVENT_CODE_OFFSET = 0x0000000a;
enum DEBUG_REQUEST_READ_CAPTURED_EVENT_CODE_STREAM = 0x0000000b;
enum DEBUG_REQUEST_EXT_TYPED_DATA_ANSI = 0x0000000c;
enum DEBUG_REQUEST_GET_EXTENSION_SEARCH_PATH_WIDE = 0x0000000d;
enum DEBUG_REQUEST_GET_TEXT_COMPLETIONS_WIDE = 0x0000000e;
enum DEBUG_REQUEST_GET_CACHED_SYMBOL_INFO = 0x0000000f;
enum DEBUG_REQUEST_ADD_CACHED_SYMBOL_INFO = 0x00000010;
enum DEBUG_REQUEST_REMOVE_CACHED_SYMBOL_INFO = 0x00000011;
enum DEBUG_REQUEST_GET_TEXT_COMPLETIONS_ANSI = 0x00000012;
enum DEBUG_REQUEST_CURRENT_OUTPUT_CALLBACKS_ARE_DML_AWARE = 0x00000013;
enum DEBUG_REQUEST_GET_OFFSET_UNWIND_INFORMATION = 0x00000014;
enum DEBUG_REQUEST_GET_DUMP_HEADER = 0x00000015;
enum DEBUG_REQUEST_SET_DUMP_HEADER = 0x00000016;
enum DEBUG_REQUEST_MIDORI = 0x00000017;
enum DEBUG_REQUEST_PROCESS_DESCRIPTORS = 0x00000018;
enum DEBUG_REQUEST_MISC_INFORMATION = 0x00000019;
enum DEBUG_REQUEST_OPEN_PROCESS_TOKEN = 0x0000001a;
enum DEBUG_REQUEST_OPEN_THREAD_TOKEN = 0x0000001b;
enum DEBUG_REQUEST_DUPLICATE_TOKEN = 0x0000001c;
enum DEBUG_REQUEST_QUERY_INFO_TOKEN = 0x0000001d;
enum DEBUG_REQUEST_CLOSE_TOKEN = 0x0000001e;
enum DEBUG_REQUEST_WOW_PROCESS = 0x0000001f;
enum DEBUG_REQUEST_WOW_MODULE = 0x00000020;
enum DEBUG_LIVE_USER_NON_INVASIVE = 0x00000021;
enum DEBUG_REQUEST_RESUME_THREAD = 0x00000022;
enum DEBUG_REQUEST_INLINE_QUERY = 0x00000023;
enum DEBUG_REQUEST_TL_INSTRUMENTATION_AWARE = 0x00000024;
enum DEBUG_REQUEST_GET_INSTRUMENTATION_VERSION = 0x00000025;
enum DEBUG_REQUEST_GET_MODULE_ARCHITECTURE = 0x00000026;
enum DEBUG_SRCFILE_SYMBOL_TOKEN = 0x00000000;
enum DEBUG_SRCFILE_SYMBOL_TOKEN_SOURCE_COMMAND_WIDE = 0x00000001;
enum DEBUG_SRCFILE_SYMBOL_CHECKSUMINFO = 0x00000002;
enum DEBUG_SYMINFO_BREAKPOINT_SOURCE_LINE = 0x00000000;
enum DEBUG_SYMINFO_IMAGEHLP_MODULEW64 = 0x00000001;
enum DEBUG_SYMINFO_GET_SYMBOL_NAME_BY_OFFSET_AND_TAG_WIDE = 0x00000002;
enum DEBUG_SYMINFO_GET_MODULE_SYMBOL_NAMES_AND_OFFSETS = 0x00000003;
enum DEBUG_SYSOBJINFO_THREAD_BASIC_INFORMATION = 0x00000000;
enum DEBUG_SYSOBJINFO_THREAD_NAME_WIDE = 0x00000001;
enum DEBUG_SYSOBJINFO_CURRENT_PROCESS_COOKIE = 0x00000002;
enum DEBUG_TBINFO_EXIT_STATUS = 0x00000001;
enum DEBUG_TBINFO_PRIORITY_CLASS = 0x00000002;
enum DEBUG_TBINFO_PRIORITY = 0x00000004;
enum DEBUG_TBINFO_TIMES = 0x00000008;
enum DEBUG_TBINFO_START_OFFSET = 0x00000010;
enum DEBUG_TBINFO_AFFINITY = 0x00000020;
enum DEBUG_TBINFO_ALL = 0x0000003f;
enum DEBUG_BREAKPOINT_CODE = 0x00000000;
enum DEBUG_BREAKPOINT_DATA = 0x00000001;
enum DEBUG_BREAKPOINT_TIME = 0x00000002;
enum DEBUG_BREAKPOINT_INLINE = 0x00000003;
enum DEBUG_BREAKPOINT_GO_ONLY = 0x00000001;
enum DEBUG_BREAKPOINT_DEFERRED = 0x00000002;
enum DEBUG_BREAKPOINT_ENABLED = 0x00000004;
enum DEBUG_BREAKPOINT_ADDER_ONLY = 0x00000008;
enum DEBUG_BREAKPOINT_ONE_SHOT = 0x00000010;
enum DEBUG_BREAK_READ = 0x00000001;
enum DEBUG_BREAK_WRITE = 0x00000002;
enum DEBUG_BREAK_EXECUTE = 0x00000004;
enum DEBUG_BREAK_IO = 0x00000008;
enum DEBUG_ATTACH_KERNEL_CONNECTION = 0x00000000;
enum DEBUG_ATTACH_LOCAL_KERNEL = 0x00000001;
enum DEBUG_ATTACH_EXDI_DRIVER = 0x00000002;
enum DEBUG_ATTACH_INSTALL_DRIVER = 0x00000004;
enum DEBUG_GET_PROC_DEFAULT = 0x00000000;
enum DEBUG_GET_PROC_FULL_MATCH = 0x00000001;
enum DEBUG_GET_PROC_ONLY_MATCH = 0x00000002;
enum DEBUG_GET_PROC_SERVICE_NAME = 0x00000004;
enum DEBUG_PROC_DESC_DEFAULT = 0x00000000;
enum DEBUG_PROC_DESC_NO_PATHS = 0x00000001;
enum DEBUG_PROC_DESC_NO_SERVICES = 0x00000002;
enum DEBUG_PROC_DESC_NO_MTS_PACKAGES = 0x00000004;
enum DEBUG_PROC_DESC_NO_COMMAND_LINE = 0x00000008;
enum DEBUG_PROC_DESC_NO_SESSION_ID = 0x00000010;
enum DEBUG_PROC_DESC_NO_USER_NAME = 0x00000020;
enum DEBUG_PROC_DESC_WITH_PACKAGEFAMILY = 0x00000040;
enum DEBUG_ATTACH_DEFAULT = 0x00000000;
enum DEBUG_ATTACH_NONINVASIVE = 0x00000001;
enum DEBUG_ATTACH_EXISTING = 0x00000002;
enum DEBUG_ATTACH_NONINVASIVE_NO_SUSPEND = 0x00000004;
enum DEBUG_ATTACH_INVASIVE_NO_INITIAL_BREAK = 0x00000008;
enum DEBUG_ATTACH_INVASIVE_RESUME_PROCESS = 0x00000010;
enum DEBUG_ATTACH_NONINVASIVE_ALLOW_PARTIAL = 0x00000020;
enum DEBUG_ECREATE_PROCESS_DEFAULT = 0x00000000;
enum DEBUG_ECREATE_PROCESS_INHERIT_HANDLES = 0x00000001;
enum DEBUG_ECREATE_PROCESS_USE_VERIFIER_FLAGS = 0x00000002;
enum DEBUG_ECREATE_PROCESS_USE_IMPLICIT_COMMAND_LINE = 0x00000004;
enum DEBUG_PROCESS_DETACH_ON_EXIT = 0x00000001;
enum DEBUG_PROCESS_ONLY_THIS_PROCESS = 0x00000002;
enum DEBUG_CONNECT_SESSION_DEFAULT = 0x00000000;
enum DEBUG_CONNECT_SESSION_NO_VERSION = 0x00000001;
enum DEBUG_CONNECT_SESSION_NO_ANNOUNCE = 0x00000002;
enum DEBUG_SERVERS_DEBUGGER = 0x00000001;
enum DEBUG_SERVERS_PROCESS = 0x00000002;
enum DEBUG_SERVERS_ALL = 0x00000003;
enum DEBUG_END_PASSIVE = 0x00000000;
enum DEBUG_END_ACTIVE_TERMINATE = 0x00000001;
enum DEBUG_END_ACTIVE_DETACH = 0x00000002;
enum DEBUG_END_REENTRANT = 0x00000003;
enum DEBUG_END_DISCONNECT = 0x00000004;
enum DEBUG_OUTPUT_NORMAL = 0x00000001;
enum DEBUG_OUTPUT_ERROR = 0x00000002;
enum DEBUG_OUTPUT_WARNING = 0x00000004;
enum DEBUG_OUTPUT_VERBOSE = 0x00000008;
enum DEBUG_OUTPUT_PROMPT = 0x00000010;
enum DEBUG_OUTPUT_PROMPT_REGISTERS = 0x00000020;
enum DEBUG_OUTPUT_EXTENSION_WARNING = 0x00000040;
enum DEBUG_OUTPUT_DEBUGGEE = 0x00000080;
enum DEBUG_OUTPUT_DEBUGGEE_PROMPT = 0x00000100;
enum DEBUG_OUTPUT_SYMBOLS = 0x00000200;
enum DEBUG_OUTPUT_STATUS = 0x00000400;
enum DEBUG_OUTPUT_XML = 0x00000800;
enum DEBUG_IOUTPUT_KD_PROTOCOL = 0x80000000;
enum DEBUG_IOUTPUT_REMOTING = 0x40000000;
enum DEBUG_IOUTPUT_BREAKPOINT = 0x20000000;
enum DEBUG_IOUTPUT_EVENT = 0x10000000;
enum DEBUG_IOUTPUT_ADDR_TRANSLATE = 0x08000000;
enum DEBUG_OUTPUT_IDENTITY_DEFAULT = 0x00000000;
enum DEBUG_CLIENT_UNKNOWN = 0x00000000;
enum DEBUG_CLIENT_VSINT = 0x00000001;
enum DEBUG_CLIENT_NTSD = 0x00000002;
enum DEBUG_CLIENT_NTKD = 0x00000003;
enum DEBUG_CLIENT_CDB = 0x00000004;
enum DEBUG_CLIENT_KD = 0x00000005;
enum DEBUG_CLIENT_WINDBG = 0x00000006;
enum DEBUG_CLIENT_WINIDE = 0x00000007;
enum DEBUG_FORMAT_DEFAULT = 0x00000000;
enum DEBUG_FORMAT_CAB_SECONDARY_ALL_IMAGES = 0x10000000;
enum DEBUG_FORMAT_WRITE_CAB = 0x20000000;
enum DEBUG_FORMAT_CAB_SECONDARY_FILES = 0x40000000;
enum DEBUG_FORMAT_NO_OVERWRITE = 0x80000000;
enum DEBUG_FORMAT_USER_SMALL_FULL_MEMORY = 0x00000001;
enum DEBUG_FORMAT_USER_SMALL_HANDLE_DATA = 0x00000002;
enum DEBUG_FORMAT_USER_SMALL_UNLOADED_MODULES = 0x00000004;
enum DEBUG_FORMAT_USER_SMALL_INDIRECT_MEMORY = 0x00000008;
enum DEBUG_FORMAT_USER_SMALL_DATA_SEGMENTS = 0x00000010;
enum DEBUG_FORMAT_USER_SMALL_FILTER_MEMORY = 0x00000020;
enum DEBUG_FORMAT_USER_SMALL_FILTER_PATHS = 0x00000040;
enum DEBUG_FORMAT_USER_SMALL_PROCESS_THREAD_DATA = 0x00000080;
enum DEBUG_FORMAT_USER_SMALL_PRIVATE_READ_WRITE_MEMORY = 0x00000100;
enum DEBUG_FORMAT_USER_SMALL_NO_OPTIONAL_DATA = 0x00000200;
enum DEBUG_FORMAT_USER_SMALL_FULL_MEMORY_INFO = 0x00000400;
enum DEBUG_FORMAT_USER_SMALL_THREAD_INFO = 0x00000800;
enum DEBUG_FORMAT_USER_SMALL_CODE_SEGMENTS = 0x00001000;
enum DEBUG_FORMAT_USER_SMALL_NO_AUXILIARY_STATE = 0x00002000;
enum DEBUG_FORMAT_USER_SMALL_FULL_AUXILIARY_STATE = 0x00004000;
enum DEBUG_FORMAT_USER_SMALL_MODULE_HEADERS = 0x00008000;
enum DEBUG_FORMAT_USER_SMALL_FILTER_TRIAGE = 0x00010000;
enum DEBUG_FORMAT_USER_SMALL_ADD_AVX_XSTATE_CONTEXT = 0x00020000;
enum DEBUG_FORMAT_USER_SMALL_IPT_TRACE = 0x00040000;
enum DEBUG_FORMAT_USER_SMALL_IGNORE_INACCESSIBLE_MEM = 0x08000000;
enum DEBUG_FORMAT_USER_SMALL_SCAN_PARTIAL_PAGES = 0x10000000;
enum DEBUG_DUMP_FILE_BASE = 0xffffffff;
enum DEBUG_DUMP_FILE_PAGE_FILE_DUMP = 0x00000000;
enum DEBUG_DUMP_FILE_LOAD_FAILED_INDEX = 0xffffffff;
enum DEBUG_DUMP_FILE_ORIGINAL_CAB_INDEX = 0xfffffffe;
enum DEBUG_STATUS_NO_CHANGE = 0x00000000;
enum DEBUG_STATUS_GO = 0x00000001;
enum DEBUG_STATUS_GO_HANDLED = 0x00000002;
enum DEBUG_STATUS_GO_NOT_HANDLED = 0x00000003;
enum DEBUG_STATUS_STEP_OVER = 0x00000004;
enum DEBUG_STATUS_STEP_INTO = 0x00000005;
enum DEBUG_STATUS_BREAK = 0x00000006;
enum DEBUG_STATUS_NO_DEBUGGEE = 0x00000007;
enum DEBUG_STATUS_STEP_BRANCH = 0x00000008;
enum DEBUG_STATUS_IGNORE_EVENT = 0x00000009;
enum DEBUG_STATUS_RESTART_REQUESTED = 0x0000000a;
enum DEBUG_STATUS_REVERSE_GO = 0x0000000b;
enum DEBUG_STATUS_REVERSE_STEP_BRANCH = 0x0000000c;
enum DEBUG_STATUS_REVERSE_STEP_OVER = 0x0000000d;
enum DEBUG_STATUS_REVERSE_STEP_INTO = 0x0000000e;
enum DEBUG_STATUS_OUT_OF_SYNC = 0x0000000f;
enum DEBUG_STATUS_WAIT_INPUT = 0x00000010;
enum DEBUG_STATUS_TIMEOUT = 0x00000011;
enum DEBUG_STATUS_MASK = 0x0000001f;
enum DEBUG_STATUS_INSIDE_WAIT = 0x0000000100000000;
enum DEBUG_STATUS_WAIT_TIMEOUT = 0x0000000200000000;
enum DEBUG_OUTCTL_THIS_CLIENT = 0x00000000;
enum DEBUG_OUTCTL_ALL_CLIENTS = 0x00000001;
enum DEBUG_OUTCTL_ALL_OTHER_CLIENTS = 0x00000002;
enum DEBUG_OUTCTL_IGNORE = 0x00000003;
enum DEBUG_OUTCTL_LOG_ONLY = 0x00000004;
enum DEBUG_OUTCTL_SEND_MASK = 0x00000007;
enum DEBUG_OUTCTL_NOT_LOGGED = 0x00000008;
enum DEBUG_OUTCTL_OVERRIDE_MASK = 0x00000010;
enum DEBUG_OUTCTL_DML = 0x00000020;
enum DEBUG_OUTCTL_AMBIENT_DML = 0xfffffffe;
enum DEBUG_OUTCTL_AMBIENT_TEXT = 0xffffffff;
enum DEBUG_OUTCTL_AMBIENT = 0xffffffff;
enum DEBUG_INTERRUPT_ACTIVE = 0x00000000;
enum DEBUG_INTERRUPT_PASSIVE = 0x00000001;
enum DEBUG_INTERRUPT_EXIT = 0x00000002;
enum DEBUG_CURRENT_DEFAULT = 0x0000000f;
enum DEBUG_CURRENT_SYMBOL = 0x00000001;
enum DEBUG_CURRENT_DISASM = 0x00000002;
enum DEBUG_CURRENT_REGISTERS = 0x00000004;
enum DEBUG_CURRENT_SOURCE_LINE = 0x00000008;
enum DEBUG_DISASM_EFFECTIVE_ADDRESS = 0x00000001;
enum DEBUG_DISASM_MATCHING_SYMBOLS = 0x00000002;
enum DEBUG_DISASM_SOURCE_LINE_NUMBER = 0x00000004;
enum DEBUG_DISASM_SOURCE_FILE_NAME = 0x00000008;
enum DEBUG_LEVEL_SOURCE = 0x00000000;
enum DEBUG_LEVEL_ASSEMBLY = 0x00000001;
enum DEBUG_ENGOPT_IGNORE_DBGHELP_VERSION = 0x00000001;
enum DEBUG_ENGOPT_IGNORE_EXTENSION_VERSIONS = 0x00000002;
enum DEBUG_ENGOPT_ALLOW_NETWORK_PATHS = 0x00000004;
enum DEBUG_ENGOPT_DISALLOW_NETWORK_PATHS = 0x00000008;
enum DEBUG_ENGOPT_IGNORE_LOADER_EXCEPTIONS = 0x00000010;
enum DEBUG_ENGOPT_INITIAL_BREAK = 0x00000020;
enum DEBUG_ENGOPT_INITIAL_MODULE_BREAK = 0x00000040;
enum DEBUG_ENGOPT_FINAL_BREAK = 0x00000080;
enum DEBUG_ENGOPT_NO_EXECUTE_REPEAT = 0x00000100;
enum DEBUG_ENGOPT_FAIL_INCOMPLETE_INFORMATION = 0x00000200;
enum DEBUG_ENGOPT_ALLOW_READ_ONLY_BREAKPOINTS = 0x00000400;
enum DEBUG_ENGOPT_SYNCHRONIZE_BREAKPOINTS = 0x00000800;
enum DEBUG_ENGOPT_DISALLOW_SHELL_COMMANDS = 0x00001000;
enum DEBUG_ENGOPT_KD_QUIET_MODE = 0x00002000;
enum DEBUG_ENGOPT_DISABLE_MANAGED_SUPPORT = 0x00004000;
enum DEBUG_ENGOPT_DISABLE_MODULE_SYMBOL_LOAD = 0x00008000;
enum DEBUG_ENGOPT_DISABLE_EXECUTION_COMMANDS = 0x00010000;
enum DEBUG_ENGOPT_DISALLOW_IMAGE_FILE_MAPPING = 0x00020000;
enum DEBUG_ENGOPT_PREFER_DML = 0x00040000;
enum DEBUG_ENGOPT_DISABLESQM = 0x00080000;
enum DEBUG_ENGOPT_DISABLE_STEPLINES_OPTIONS = 0x00200000;
enum DEBUG_ENGOPT_DEBUGGING_SENSITIVE_DATA = 0x00400000;
enum DEBUG_ENGOPT_PREFER_TRACE_FILES = 0x00800000;
enum DEBUG_ENGOPT_ALL = 0x00efffff;
enum DEBUG_ANY_ID = 0xffffffff;
enum DBG_FRAME_DEFAULT = 0x00000000;
enum DBG_FRAME_IGNORE_INLINE = 0xffffffff;
enum STACK_FRAME_TYPE_INIT = 0x00000000;
enum STACK_FRAME_TYPE_STACK = 0x00000001;
enum STACK_FRAME_TYPE_INLINE = 0x00000002;
enum STACK_FRAME_TYPE_RA = 0x00000080;
enum STACK_FRAME_TYPE_IGNORE = 0x000000ff;
enum DEBUG_STACK_ARGUMENTS = 0x00000001;
enum DEBUG_STACK_FUNCTION_INFO = 0x00000002;
enum DEBUG_STACK_SOURCE_LINE = 0x00000004;
enum DEBUG_STACK_FRAME_ADDRESSES = 0x00000008;
enum DEBUG_STACK_COLUMN_NAMES = 0x00000010;
enum DEBUG_STACK_NONVOLATILE_REGISTERS = 0x00000020;
enum DEBUG_STACK_FRAME_NUMBERS = 0x00000040;
enum DEBUG_STACK_PARAMETERS = 0x00000080;
enum DEBUG_STACK_FRAME_ADDRESSES_RA_ONLY = 0x00000100;
enum DEBUG_STACK_FRAME_MEMORY_USAGE = 0x00000200;
enum DEBUG_STACK_PARAMETERS_NEWLINE = 0x00000400;
enum DEBUG_STACK_DML = 0x00000800;
enum DEBUG_STACK_FRAME_OFFSETS = 0x00001000;
enum DEBUG_STACK_PROVIDER = 0x00002000;
enum DEBUG_STACK_FRAME_ARCH = 0x00004000;
enum DEBUG_CLASS_UNINITIALIZED = 0x00000000;
enum DEBUG_CLASS_KERNEL = 0x00000001;
enum DEBUG_CLASS_USER_WINDOWS = 0x00000002;
enum DEBUG_CLASS_IMAGE_FILE = 0x00000003;
enum DEBUG_DUMP_SMALL = 0x00000400;
enum DEBUG_DUMP_DEFAULT = 0x00000401;
enum DEBUG_DUMP_FULL = 0x00000402;
enum DEBUG_DUMP_IMAGE_FILE = 0x00000403;
enum DEBUG_DUMP_TRACE_LOG = 0x00000404;
enum DEBUG_DUMP_WINDOWS_CE = 0x00000405;
enum DEBUG_DUMP_ACTIVE = 0x00000406;
enum DEBUG_KERNEL_CONNECTION = 0x00000000;
enum DEBUG_KERNEL_LOCAL = 0x00000001;
enum DEBUG_KERNEL_EXDI_DRIVER = 0x00000002;
enum DEBUG_KERNEL_IDNA = 0x00000003;
enum DEBUG_KERNEL_INSTALL_DRIVER = 0x00000004;
enum DEBUG_KERNEL_REPT = 0x00000005;
enum DEBUG_KERNEL_SMALL_DUMP = 0x00000400;
enum DEBUG_KERNEL_DUMP = 0x00000401;
enum DEBUG_KERNEL_ACTIVE_DUMP = 0x00000406;
enum DEBUG_KERNEL_FULL_DUMP = 0x00000402;
enum DEBUG_KERNEL_TRACE_LOG = 0x00000404;
enum DEBUG_USER_WINDOWS_PROCESS = 0x00000000;
enum DEBUG_USER_WINDOWS_PROCESS_SERVER = 0x00000001;
enum DEBUG_USER_WINDOWS_IDNA = 0x00000002;
enum DEBUG_USER_WINDOWS_REPT = 0x00000003;
enum DEBUG_USER_WINDOWS_SMALL_DUMP = 0x00000400;
enum DEBUG_USER_WINDOWS_DUMP = 0x00000401;
enum DEBUG_USER_WINDOWS_DUMP_WINDOWS_CE = 0x00000405;
enum DEBUG_EXTENSION_AT_ENGINE = 0x00000000;
enum DEBUG_EXECUTE_DEFAULT = 0x00000000;
enum DEBUG_EXECUTE_ECHO = 0x00000001;
enum DEBUG_EXECUTE_NOT_LOGGED = 0x00000002;
enum DEBUG_EXECUTE_NO_REPEAT = 0x00000004;
enum DEBUG_EXECUTE_USER_TYPED = 0x00000008;
enum DEBUG_EXECUTE_USER_CLICKED = 0x00000010;
enum DEBUG_EXECUTE_EXTENSION = 0x00000020;
enum DEBUG_EXECUTE_INTERNAL = 0x00000040;
enum DEBUG_EXECUTE_SCRIPT = 0x00000080;
enum DEBUG_EXECUTE_TOOLBAR = 0x00000100;
enum DEBUG_EXECUTE_MENU = 0x00000200;
enum DEBUG_EXECUTE_HOTKEY = 0x00000400;
enum DEBUG_EXECUTE_EVENT = 0x00000800;
enum DEBUG_FILTER_CREATE_THREAD = 0x00000000;
enum DEBUG_FILTER_EXIT_THREAD = 0x00000001;
enum DEBUG_FILTER_CREATE_PROCESS = 0x00000002;
enum DEBUG_FILTER_EXIT_PROCESS = 0x00000003;
enum DEBUG_FILTER_LOAD_MODULE = 0x00000004;
enum DEBUG_FILTER_UNLOAD_MODULE = 0x00000005;
enum DEBUG_FILTER_SYSTEM_ERROR = 0x00000006;
enum DEBUG_FILTER_INITIAL_BREAKPOINT = 0x00000007;
enum DEBUG_FILTER_INITIAL_MODULE_LOAD = 0x00000008;
enum DEBUG_FILTER_DEBUGGEE_OUTPUT = 0x00000009;
enum DEBUG_FILTER_BREAK = 0x00000000;
enum DEBUG_FILTER_SECOND_CHANCE_BREAK = 0x00000001;
enum DEBUG_FILTER_OUTPUT = 0x00000002;
enum DEBUG_FILTER_IGNORE = 0x00000003;
enum DEBUG_FILTER_REMOVE = 0x00000004;
enum DEBUG_FILTER_GO_HANDLED = 0x00000000;
enum DEBUG_FILTER_GO_NOT_HANDLED = 0x00000001;
enum DEBUG_WAIT_DEFAULT = 0x00000000;
enum DEBUG_VALUE_INVALID = 0x00000000;
enum DEBUG_VALUE_INT8 = 0x00000001;
enum DEBUG_VALUE_INT16 = 0x00000002;
enum DEBUG_VALUE_INT32 = 0x00000003;
enum DEBUG_VALUE_INT64 = 0x00000004;
enum DEBUG_VALUE_FLOAT32 = 0x00000005;
enum DEBUG_VALUE_FLOAT64 = 0x00000006;
enum DEBUG_VALUE_FLOAT80 = 0x00000007;
enum DEBUG_VALUE_FLOAT82 = 0x00000008;
enum DEBUG_VALUE_FLOAT128 = 0x00000009;
enum DEBUG_VALUE_VECTOR64 = 0x0000000a;
enum DEBUG_VALUE_VECTOR128 = 0x0000000b;
enum DEBUG_VALUE_TYPES = 0x0000000c;
enum DEBUG_OUT_TEXT_REPL_DEFAULT = 0x00000000;
enum DEBUG_ASMOPT_DEFAULT = 0x00000000;
enum DEBUG_ASMOPT_VERBOSE = 0x00000001;
enum DEBUG_ASMOPT_NO_CODE_BYTES = 0x00000002;
enum DEBUG_ASMOPT_IGNORE_OUTPUT_WIDTH = 0x00000004;
enum DEBUG_ASMOPT_SOURCE_LINE_NUMBER = 0x00000008;
enum DEBUG_EXPR_MASM = 0x00000000;
enum DEBUG_EXPR_CPLUSPLUS = 0x00000001;
enum DEBUG_EINDEX_NAME = 0x00000000;
enum DEBUG_EINDEX_FROM_START = 0x00000000;
enum DEBUG_EINDEX_FROM_END = 0x00000001;
enum DEBUG_EINDEX_FROM_CURRENT = 0x00000002;
enum DEBUG_LOG_DEFAULT = 0x00000000;
enum DEBUG_LOG_APPEND = 0x00000001;
enum DEBUG_LOG_UNICODE = 0x00000002;
enum DEBUG_LOG_DML = 0x00000004;
enum DEBUG_SYSVERSTR_SERVICE_PACK = 0x00000000;
enum DEBUG_SYSVERSTR_BUILD = 0x00000001;
enum DEBUG_MANAGED_DISABLED = 0x00000000;
enum DEBUG_MANAGED_ALLOWED = 0x00000001;
enum DEBUG_MANAGED_DLL_LOADED = 0x00000002;
enum DEBUG_MANSTR_NONE = 0x00000000;
enum DEBUG_MANSTR_LOADED_SUPPORT_DLL = 0x00000001;
enum DEBUG_MANSTR_LOAD_STATUS = 0x00000002;
enum DEBUG_MANRESET_DEFAULT = 0x00000000;
enum DEBUG_MANRESET_LOAD_DLL = 0x00000001;
enum DEBUG_EXEC_FLAGS_NONBLOCK = 0x00000001;
enum DEBUG_DATA_SPACE_VIRTUAL = 0x00000000;
enum DEBUG_DATA_SPACE_PHYSICAL = 0x00000001;
enum DEBUG_DATA_SPACE_CONTROL = 0x00000002;
enum DEBUG_DATA_SPACE_IO = 0x00000003;
enum DEBUG_DATA_SPACE_MSR = 0x00000004;
enum DEBUG_DATA_SPACE_BUS_DATA = 0x00000005;
enum DEBUG_DATA_SPACE_DEBUGGER_DATA = 0x00000006;
enum DEBUG_DATA_SPACE_COUNT = 0x00000007;
enum DEBUG_DATA_KernBase = 0x00000018;
enum DEBUG_DATA_BreakpointWithStatusAddr = 0x00000020;
enum DEBUG_DATA_SavedContextAddr = 0x00000028;
enum DEBUG_DATA_KiCallUserModeAddr = 0x00000038;
enum DEBUG_DATA_KeUserCallbackDispatcherAddr = 0x00000040;
enum DEBUG_DATA_PsLoadedModuleListAddr = 0x00000048;
enum DEBUG_DATA_PsActiveProcessHeadAddr = 0x00000050;
enum DEBUG_DATA_PspCidTableAddr = 0x00000058;
enum DEBUG_DATA_ExpSystemResourcesListAddr = 0x00000060;
enum DEBUG_DATA_ExpPagedPoolDescriptorAddr = 0x00000068;
enum DEBUG_DATA_ExpNumberOfPagedPoolsAddr = 0x00000070;
enum DEBUG_DATA_KeTimeIncrementAddr = 0x00000078;
enum DEBUG_DATA_KeBugCheckCallbackListHeadAddr = 0x00000080;
enum DEBUG_DATA_KiBugcheckDataAddr = 0x00000088;
enum DEBUG_DATA_IopErrorLogListHeadAddr = 0x00000090;
enum DEBUG_DATA_ObpRootDirectoryObjectAddr = 0x00000098;
enum DEBUG_DATA_ObpTypeObjectTypeAddr = 0x000000a0;
enum DEBUG_DATA_MmSystemCacheStartAddr = 0x000000a8;
enum DEBUG_DATA_MmSystemCacheEndAddr = 0x000000b0;
enum DEBUG_DATA_MmSystemCacheWsAddr = 0x000000b8;
enum DEBUG_DATA_MmPfnDatabaseAddr = 0x000000c0;
enum DEBUG_DATA_MmSystemPtesStartAddr = 0x000000c8;
enum DEBUG_DATA_MmSystemPtesEndAddr = 0x000000d0;
enum DEBUG_DATA_MmSubsectionBaseAddr = 0x000000d8;
enum DEBUG_DATA_MmNumberOfPagingFilesAddr = 0x000000e0;
enum DEBUG_DATA_MmLowestPhysicalPageAddr = 0x000000e8;
enum DEBUG_DATA_MmHighestPhysicalPageAddr = 0x000000f0;
enum DEBUG_DATA_MmNumberOfPhysicalPagesAddr = 0x000000f8;
enum DEBUG_DATA_MmMaximumNonPagedPoolInBytesAddr = 0x00000100;
enum DEBUG_DATA_MmNonPagedSystemStartAddr = 0x00000108;
enum DEBUG_DATA_MmNonPagedPoolStartAddr = 0x00000110;
enum DEBUG_DATA_MmNonPagedPoolEndAddr = 0x00000118;
enum DEBUG_DATA_MmPagedPoolStartAddr = 0x00000120;
enum DEBUG_DATA_MmPagedPoolEndAddr = 0x00000128;
enum DEBUG_DATA_MmPagedPoolInformationAddr = 0x00000130;
enum DEBUG_DATA_MmPageSize = 0x00000138;
enum DEBUG_DATA_MmSizeOfPagedPoolInBytesAddr = 0x00000140;
enum DEBUG_DATA_MmTotalCommitLimitAddr = 0x00000148;
enum DEBUG_DATA_MmTotalCommittedPagesAddr = 0x00000150;
enum DEBUG_DATA_MmSharedCommitAddr = 0x00000158;
enum DEBUG_DATA_MmDriverCommitAddr = 0x00000160;
enum DEBUG_DATA_MmProcessCommitAddr = 0x00000168;
enum DEBUG_DATA_MmPagedPoolCommitAddr = 0x00000170;
enum DEBUG_DATA_MmExtendedCommitAddr = 0x00000178;
enum DEBUG_DATA_MmZeroedPageListHeadAddr = 0x00000180;
enum DEBUG_DATA_MmFreePageListHeadAddr = 0x00000188;
enum DEBUG_DATA_MmStandbyPageListHeadAddr = 0x00000190;
enum DEBUG_DATA_MmModifiedPageListHeadAddr = 0x00000198;
enum DEBUG_DATA_MmModifiedNoWritePageListHeadAddr = 0x000001a0;
enum DEBUG_DATA_MmAvailablePagesAddr = 0x000001a8;
enum DEBUG_DATA_MmResidentAvailablePagesAddr = 0x000001b0;
enum DEBUG_DATA_PoolTrackTableAddr = 0x000001b8;
enum DEBUG_DATA_NonPagedPoolDescriptorAddr = 0x000001c0;
enum DEBUG_DATA_MmHighestUserAddressAddr = 0x000001c8;
enum DEBUG_DATA_MmSystemRangeStartAddr = 0x000001d0;
enum DEBUG_DATA_MmUserProbeAddressAddr = 0x000001d8;
enum DEBUG_DATA_KdPrintCircularBufferAddr = 0x000001e0;
enum DEBUG_DATA_KdPrintCircularBufferEndAddr = 0x000001e8;
enum DEBUG_DATA_KdPrintWritePointerAddr = 0x000001f0;
enum DEBUG_DATA_KdPrintRolloverCountAddr = 0x000001f8;
enum DEBUG_DATA_MmLoadedUserImageListAddr = 0x00000200;
enum DEBUG_DATA_NtBuildLabAddr = 0x00000208;
enum DEBUG_DATA_KiNormalSystemCall = 0x00000210;
enum DEBUG_DATA_KiProcessorBlockAddr = 0x00000218;
enum DEBUG_DATA_MmUnloadedDriversAddr = 0x00000220;
enum DEBUG_DATA_MmLastUnloadedDriverAddr = 0x00000228;
enum DEBUG_DATA_MmTriageActionTakenAddr = 0x00000230;
enum DEBUG_DATA_MmSpecialPoolTagAddr = 0x00000238;
enum DEBUG_DATA_KernelVerifierAddr = 0x00000240;
enum DEBUG_DATA_MmVerifierDataAddr = 0x00000248;
enum DEBUG_DATA_MmAllocatedNonPagedPoolAddr = 0x00000250;
enum DEBUG_DATA_MmPeakCommitmentAddr = 0x00000258;
enum DEBUG_DATA_MmTotalCommitLimitMaximumAddr = 0x00000260;
enum DEBUG_DATA_CmNtCSDVersionAddr = 0x00000268;
enum DEBUG_DATA_MmPhysicalMemoryBlockAddr = 0x00000270;
enum DEBUG_DATA_MmSessionBase = 0x00000278;
enum DEBUG_DATA_MmSessionSize = 0x00000280;
enum DEBUG_DATA_MmSystemParentTablePage = 0x00000288;
enum DEBUG_DATA_MmVirtualTranslationBase = 0x00000290;
enum DEBUG_DATA_OffsetKThreadNextProcessor = 0x00000298;
enum DEBUG_DATA_OffsetKThreadTeb = 0x0000029a;
enum DEBUG_DATA_OffsetKThreadKernelStack = 0x0000029c;
enum DEBUG_DATA_OffsetKThreadInitialStack = 0x0000029e;
enum DEBUG_DATA_OffsetKThreadApcProcess = 0x000002a0;
enum DEBUG_DATA_OffsetKThreadState = 0x000002a2;
enum DEBUG_DATA_OffsetKThreadBStore = 0x000002a4;
enum DEBUG_DATA_OffsetKThreadBStoreLimit = 0x000002a6;
enum DEBUG_DATA_SizeEProcess = 0x000002a8;
enum DEBUG_DATA_OffsetEprocessPeb = 0x000002aa;
enum DEBUG_DATA_OffsetEprocessParentCID = 0x000002ac;
enum DEBUG_DATA_OffsetEprocessDirectoryTableBase = 0x000002ae;
enum DEBUG_DATA_SizePrcb = 0x000002b0;
enum DEBUG_DATA_OffsetPrcbDpcRoutine = 0x000002b2;
enum DEBUG_DATA_OffsetPrcbCurrentThread = 0x000002b4;
enum DEBUG_DATA_OffsetPrcbMhz = 0x000002b6;
enum DEBUG_DATA_OffsetPrcbCpuType = 0x000002b8;
enum DEBUG_DATA_OffsetPrcbVendorString = 0x000002ba;
enum DEBUG_DATA_OffsetPrcbProcessorState = 0x000002bc;
enum DEBUG_DATA_OffsetPrcbNumber = 0x000002be;
enum DEBUG_DATA_SizeEThread = 0x000002c0;
enum DEBUG_DATA_KdPrintCircularBufferPtrAddr = 0x000002c8;
enum DEBUG_DATA_KdPrintBufferSizeAddr = 0x000002d0;
enum DEBUG_DATA_MmBadPagesDetected = 0x00000320;
enum DEBUG_DATA_EtwpDebuggerData = 0x00000330;
enum DEBUG_DATA_PteBase = 0x00000360;
enum DEBUG_DATA_PaeEnabled = 0x000186a0;
enum DEBUG_DATA_SharedUserData = 0x000186a8;
enum DEBUG_DATA_ProductType = 0x000186b0;
enum DEBUG_DATA_SuiteMask = 0x000186b8;
enum DEBUG_DATA_DumpWriterStatus = 0x000186c0;
enum DEBUG_DATA_DumpFormatVersion = 0x000186c8;
enum DEBUG_DATA_DumpWriterVersion = 0x000186d0;
enum DEBUG_DATA_DumpPowerState = 0x000186d8;
enum DEBUG_DATA_DumpMmStorage = 0x000186e0;
enum DEBUG_DATA_DumpAttributes = 0x000186e8;
enum DEBUG_DATA_KPCR_OFFSET = 0x00000000;
enum DEBUG_DATA_KPRCB_OFFSET = 0x00000001;
enum DEBUG_DATA_KTHREAD_OFFSET = 0x00000002;
enum DEBUG_DATA_BASE_TRANSLATION_VIRTUAL_OFFSET = 0x00000003;
enum DEBUG_DATA_PROCESSOR_IDENTIFICATION = 0x00000004;
enum DEBUG_DATA_PROCESSOR_SPEED = 0x00000005;
enum DEBUG_HANDLE_DATA_TYPE_BASIC = 0x00000000;
enum DEBUG_HANDLE_DATA_TYPE_TYPE_NAME = 0x00000001;
enum DEBUG_HANDLE_DATA_TYPE_OBJECT_NAME = 0x00000002;
enum DEBUG_HANDLE_DATA_TYPE_HANDLE_COUNT = 0x00000003;
enum DEBUG_HANDLE_DATA_TYPE_TYPE_NAME_WIDE = 0x00000004;
enum DEBUG_HANDLE_DATA_TYPE_OBJECT_NAME_WIDE = 0x00000005;
enum DEBUG_HANDLE_DATA_TYPE_MINI_THREAD_1 = 0x00000006;
enum DEBUG_HANDLE_DATA_TYPE_MINI_MUTANT_1 = 0x00000007;
enum DEBUG_HANDLE_DATA_TYPE_MINI_MUTANT_2 = 0x00000008;
enum DEBUG_HANDLE_DATA_TYPE_PER_HANDLE_OPERATIONS = 0x00000009;
enum DEBUG_HANDLE_DATA_TYPE_ALL_HANDLE_OPERATIONS = 0x0000000a;
enum DEBUG_HANDLE_DATA_TYPE_MINI_PROCESS_1 = 0x0000000b;
enum DEBUG_HANDLE_DATA_TYPE_MINI_PROCESS_2 = 0x0000000c;
enum DEBUG_HANDLE_DATA_TYPE_MINI_EVENT_1 = 0x0000000d;
enum DEBUG_HANDLE_DATA_TYPE_MINI_SECTION_1 = 0x0000000e;
enum DEBUG_HANDLE_DATA_TYPE_MINI_SEMAPHORE_1 = 0x0000000f;
enum DEBUG_OFFSINFO_VIRTUAL_SOURCE = 0x00000001;
enum DEBUG_VSOURCE_INVALID = 0x00000000;
enum DEBUG_VSOURCE_DEBUGGEE = 0x00000001;
enum DEBUG_VSOURCE_MAPPED_IMAGE = 0x00000002;
enum DEBUG_VSOURCE_DUMP_WITHOUT_MEMINFO = 0x00000003;
enum DEBUG_VSEARCH_DEFAULT = 0x00000000;
enum DEBUG_VSEARCH_WRITABLE_ONLY = 0x00000001;
enum DEBUG_PHYSICAL_DEFAULT = 0x00000000;
enum DEBUG_PHYSICAL_CACHED = 0x00000001;
enum DEBUG_PHYSICAL_UNCACHED = 0x00000002;
enum DEBUG_PHYSICAL_WRITE_COMBINED = 0x00000003;
enum DEBUG_EVENT_BREAKPOINT = 0x00000001;
enum DEBUG_EVENT_EXCEPTION = 0x00000002;
enum DEBUG_EVENT_CREATE_THREAD = 0x00000004;
enum DEBUG_EVENT_EXIT_THREAD = 0x00000008;
enum DEBUG_EVENT_CREATE_PROCESS = 0x00000010;
enum DEBUG_EVENT_EXIT_PROCESS = 0x00000020;
enum DEBUG_EVENT_LOAD_MODULE = 0x00000040;
enum DEBUG_EVENT_UNLOAD_MODULE = 0x00000080;
enum DEBUG_EVENT_SYSTEM_ERROR = 0x00000100;
enum DEBUG_EVENT_SESSION_STATUS = 0x00000200;
enum DEBUG_EVENT_CHANGE_DEBUGGEE_STATE = 0x00000400;
enum DEBUG_EVENT_CHANGE_ENGINE_STATE = 0x00000800;
enum DEBUG_EVENT_CHANGE_SYMBOL_STATE = 0x00001000;
enum DEBUG_EVENT_SERVICE_EXCEPTION = 0x00002000;
enum DEBUG_SESSION_ACTIVE = 0x00000000;
enum DEBUG_SESSION_END_SESSION_ACTIVE_TERMINATE = 0x00000001;
enum DEBUG_SESSION_END_SESSION_ACTIVE_DETACH = 0x00000002;
enum DEBUG_SESSION_END_SESSION_PASSIVE = 0x00000003;
enum DEBUG_SESSION_END = 0x00000004;
enum DEBUG_SESSION_REBOOT = 0x00000005;
enum DEBUG_SESSION_HIBERNATE = 0x00000006;
enum DEBUG_SESSION_FAILURE = 0x00000007;
enum DEBUG_CDS_ALL = 0xffffffff;
enum DEBUG_CDS_REGISTERS = 0x00000001;
enum DEBUG_CDS_DATA = 0x00000002;
enum DEBUG_CDS_REFRESH = 0x00000004;
enum DEBUG_CDS_REFRESH_EVALUATE = 0x00000001;
enum DEBUG_CDS_REFRESH_EXECUTE = 0x00000002;
enum DEBUG_CDS_REFRESH_EXECUTECOMMANDFILE = 0x00000003;
enum DEBUG_CDS_REFRESH_ADDBREAKPOINT = 0x00000004;
enum DEBUG_CDS_REFRESH_REMOVEBREAKPOINT = 0x00000005;
enum DEBUG_CDS_REFRESH_WRITEVIRTUAL = 0x00000006;
enum DEBUG_CDS_REFRESH_WRITEVIRTUALUNCACHED = 0x00000007;
enum DEBUG_CDS_REFRESH_WRITEPHYSICAL = 0x00000008;
enum DEBUG_CDS_REFRESH_WRITEPHYSICAL2 = 0x00000009;
enum DEBUG_CDS_REFRESH_SETVALUE = 0x0000000a;
enum DEBUG_CDS_REFRESH_SETVALUE2 = 0x0000000b;
enum DEBUG_CDS_REFRESH_SETSCOPE = 0x0000000c;
enum DEBUG_CDS_REFRESH_SETSCOPEFRAMEBYINDEX = 0x0000000d;
enum DEBUG_CDS_REFRESH_SETSCOPEFROMJITDEBUGINFO = 0x0000000e;
enum DEBUG_CDS_REFRESH_SETSCOPEFROMSTOREDEVENT = 0x0000000f;
enum DEBUG_CDS_REFRESH_INLINESTEP = 0x00000010;
enum DEBUG_CDS_REFRESH_INLINESTEP_PSEUDO = 0x00000011;
enum DEBUG_CES_ALL = 0xffffffff;
enum DEBUG_CES_CURRENT_THREAD = 0x00000001;
enum DEBUG_CES_EFFECTIVE_PROCESSOR = 0x00000002;
enum DEBUG_CES_BREAKPOINTS = 0x00000004;
enum DEBUG_CES_CODE_LEVEL = 0x00000008;
enum DEBUG_CES_EXECUTION_STATUS = 0x00000010;
enum DEBUG_CES_ENGINE_OPTIONS = 0x00000020;
enum DEBUG_CES_LOG_FILE = 0x00000040;
enum DEBUG_CES_RADIX = 0x00000080;
enum DEBUG_CES_EVENT_FILTERS = 0x00000100;
enum DEBUG_CES_PROCESS_OPTIONS = 0x00000200;
enum DEBUG_CES_EXTENSIONS = 0x00000400;
enum DEBUG_CES_SYSTEMS = 0x00000800;
enum DEBUG_CES_ASSEMBLY_OPTIONS = 0x00001000;
enum DEBUG_CES_EXPRESSION_SYNTAX = 0x00002000;
enum DEBUG_CES_TEXT_REPLACEMENTS = 0x00004000;
enum DEBUG_CSS_ALL = 0xffffffff;
enum DEBUG_CSS_LOADS = 0x00000001;
enum DEBUG_CSS_UNLOADS = 0x00000002;
enum DEBUG_CSS_SCOPE = 0x00000004;
enum DEBUG_CSS_PATHS = 0x00000008;
enum DEBUG_CSS_SYMBOL_OPTIONS = 0x00000010;
enum DEBUG_CSS_TYPE_OPTIONS = 0x00000020;
enum DEBUG_CSS_COLLAPSE_CHILDREN = 0x00000040;
enum DEBUG_OUTCBI_EXPLICIT_FLUSH = 0x00000001;
enum DEBUG_OUTCBI_TEXT = 0x00000002;
enum DEBUG_OUTCBI_DML = 0x00000004;
enum DEBUG_OUTCBI_ANY_FORMAT = 0x00000006;
enum DEBUG_OUTCB_TEXT = 0x00000000;
enum DEBUG_OUTCB_DML = 0x00000001;
enum DEBUG_OUTCB_EXPLICIT_FLUSH = 0x00000002;
enum DEBUG_OUTCBF_COMBINED_EXPLICIT_FLUSH = 0x00000001;
enum DEBUG_OUTCBF_DML_HAS_TAGS = 0x00000002;
enum DEBUG_OUTCBF_DML_HAS_SPECIAL_CHARACTERS = 0x00000004;
enum DEBUG_REGISTERS_DEFAULT = 0x00000000;
enum DEBUG_REGISTERS_INT32 = 0x00000001;
enum DEBUG_REGISTERS_INT64 = 0x00000002;
enum DEBUG_REGISTERS_FLOAT = 0x00000004;
enum DEBUG_REGISTERS_ALL = 0x00000007;
enum DEBUG_REGISTER_SUB_REGISTER = 0x00000001;
enum DEBUG_REGSRC_DEBUGGEE = 0x00000000;
enum DEBUG_REGSRC_EXPLICIT = 0x00000001;
enum DEBUG_REGSRC_FRAME = 0x00000002;
enum DEBUG_OUTPUT_SYMBOLS_DEFAULT = 0x00000000;
enum DEBUG_OUTPUT_SYMBOLS_NO_NAMES = 0x00000001;
enum DEBUG_OUTPUT_SYMBOLS_NO_OFFSETS = 0x00000002;
enum DEBUG_OUTPUT_SYMBOLS_NO_VALUES = 0x00000004;
enum DEBUG_OUTPUT_SYMBOLS_NO_TYPES = 0x00000010;
enum DEBUG_OUTPUT_NAME_END = "**NAME**";
enum DEBUG_OUTPUT_OFFSET_END = "**OFF**";
enum DEBUG_OUTPUT_VALUE_END = "**VALUE**";
enum DEBUG_OUTPUT_TYPE_END = "**TYPE**";
enum DEBUG_OUTPUT_NAME_END_WIDE = "**NAME**";
enum DEBUG_OUTPUT_OFFSET_END_WIDE = "**OFF**";
enum DEBUG_OUTPUT_VALUE_END_WIDE = "**VALUE**";
enum DEBUG_OUTPUT_TYPE_END_WIDE = "**TYPE**";
enum DEBUG_OUTPUT_NAME_END_T = "**NAME**";
enum DEBUG_OUTPUT_OFFSET_END_T = "**OFF**";
enum DEBUG_OUTPUT_VALUE_END_T = "**VALUE**";
enum DEBUG_OUTPUT_TYPE_END_T = "**TYPE**";
enum DEBUG_SYMBOL_EXPANSION_LEVEL_MASK = 0x0000000f;
enum DEBUG_SYMBOL_EXPANDED = 0x00000010;
enum DEBUG_SYMBOL_READ_ONLY = 0x00000020;
enum DEBUG_SYMBOL_IS_ARRAY = 0x00000040;
enum DEBUG_SYMBOL_IS_FLOAT = 0x00000080;
enum DEBUG_SYMBOL_IS_ARGUMENT = 0x00000100;
enum DEBUG_SYMBOL_IS_LOCAL = 0x00000200;
enum DEBUG_SYMENT_IS_CODE = 0x00000001;
enum DEBUG_SYMENT_IS_DATA = 0x00000002;
enum DEBUG_SYMENT_IS_PARAMETER = 0x00000004;
enum DEBUG_SYMENT_IS_LOCAL = 0x00000008;
enum DEBUG_SYMENT_IS_MANAGED = 0x00000010;
enum DEBUG_SYMENT_IS_SYNTHETIC = 0x00000020;
enum DEBUG_MODULE_LOADED = 0x00000000;
enum DEBUG_MODULE_UNLOADED = 0x00000001;
enum DEBUG_MODULE_USER_MODE = 0x00000002;
enum DEBUG_MODULE_EXE_MODULE = 0x00000004;
enum DEBUG_MODULE_EXPLICIT = 0x00000008;
enum DEBUG_MODULE_SECONDARY = 0x00000010;
enum DEBUG_MODULE_SYNTHETIC = 0x00000020;
enum DEBUG_MODULE_SYM_BAD_CHECKSUM = 0x00010000;
enum DEBUG_SYMTYPE_NONE = 0x00000000;
enum DEBUG_SYMTYPE_COFF = 0x00000001;
enum DEBUG_SYMTYPE_CODEVIEW = 0x00000002;
enum DEBUG_SYMTYPE_PDB = 0x00000003;
enum DEBUG_SYMTYPE_EXPORT = 0x00000004;
enum DEBUG_SYMTYPE_DEFERRED = 0x00000005;
enum DEBUG_SYMTYPE_SYM = 0x00000006;
enum DEBUG_SYMTYPE_DIA = 0x00000007;
enum DEBUG_SCOPE_GROUP_ARGUMENTS = 0x00000001;
enum DEBUG_SCOPE_GROUP_LOCALS = 0x00000002;
enum DEBUG_SCOPE_GROUP_ALL = 0x00000003;
enum DEBUG_SCOPE_GROUP_BY_DATAMODEL = 0x00000004;
enum DEBUG_OUTTYPE_DEFAULT = 0x00000000;
enum DEBUG_OUTTYPE_NO_INDENT = 0x00000001;
enum DEBUG_OUTTYPE_NO_OFFSET = 0x00000002;
enum DEBUG_OUTTYPE_VERBOSE = 0x00000004;
enum DEBUG_OUTTYPE_COMPACT_OUTPUT = 0x00000008;
enum DEBUG_OUTTYPE_ADDRESS_OF_FIELD = 0x00010000;
enum DEBUG_OUTTYPE_ADDRESS_AT_END = 0x00020000;
enum DEBUG_OUTTYPE_BLOCK_RECURSE = 0x00200000;
enum DEBUG_FIND_SOURCE_DEFAULT = 0x00000000;
enum DEBUG_FIND_SOURCE_FULL_PATH = 0x00000001;
enum DEBUG_FIND_SOURCE_BEST_MATCH = 0x00000002;
enum DEBUG_FIND_SOURCE_NO_SRCSRV = 0x00000004;
enum DEBUG_FIND_SOURCE_TOKEN_LOOKUP = 0x00000008;
enum DEBUG_FIND_SOURCE_WITH_CHECKSUM = 0x00000010;
enum DEBUG_FIND_SOURCE_WITH_CHECKSUM_STRICT = 0x00000020;
enum MODULE_ORDERS_MASK = 0xf0000000;
enum MODULE_ORDERS_LOADTIME = 0x10000000;
enum MODULE_ORDERS_MODULENAME = 0x20000000;
enum DEBUG_MODNAME_IMAGE = 0x00000000;
enum DEBUG_MODNAME_MODULE = 0x00000001;
enum DEBUG_MODNAME_LOADED_IMAGE = 0x00000002;
enum DEBUG_MODNAME_SYMBOL_FILE = 0x00000003;
enum DEBUG_MODNAME_MAPPED_IMAGE = 0x00000004;
enum DEBUG_TYPEOPTS_UNICODE_DISPLAY = 0x00000001;
enum DEBUG_TYPEOPTS_LONGSTATUS_DISPLAY = 0x00000002;
enum DEBUG_TYPEOPTS_FORCERADIX_OUTPUT = 0x00000004;
enum DEBUG_TYPEOPTS_MATCH_MAXSIZE = 0x00000008;
enum DEBUG_GETMOD_DEFAULT = 0x00000000;
enum DEBUG_GETMOD_NO_LOADED_MODULES = 0x00000001;
enum DEBUG_GETMOD_NO_UNLOADED_MODULES = 0x00000002;
enum DEBUG_ADDSYNTHMOD_DEFAULT = 0x00000000;
enum DEBUG_ADDSYNTHMOD_ZEROBASE = 0x00000001;
enum DEBUG_ADDSYNTHSYM_DEFAULT = 0x00000000;
enum DEBUG_OUTSYM_DEFAULT = 0x00000000;
enum DEBUG_OUTSYM_FORCE_OFFSET = 0x00000001;
enum DEBUG_OUTSYM_SOURCE_LINE = 0x00000002;
enum DEBUG_OUTSYM_ALLOW_DISPLACEMENT = 0x00000004;
enum DEBUG_GETFNENT_DEFAULT = 0x00000000;
enum DEBUG_GETFNENT_RAW_ENTRY_ONLY = 0x00000001;
enum DEBUG_SOURCE_IS_STATEMENT = 0x00000001;
enum DEBUG_GSEL_DEFAULT = 0x00000000;
enum DEBUG_GSEL_NO_SYMBOL_LOADS = 0x00000001;
enum DEBUG_GSEL_ALLOW_LOWER = 0x00000002;
enum DEBUG_GSEL_ALLOW_HIGHER = 0x00000004;
enum DEBUG_GSEL_NEAREST_ONLY = 0x00000008;
enum DEBUG_GSEL_INLINE_CALLSITE = 0x00000010;
enum DEBUG_FRAME_DEFAULT = 0x00000000;
enum DEBUG_FRAME_IGNORE_INLINE = 0x00000001;
enum DEBUG_COMMAND_EXCEPTION_ID = 0xdbe00dbe;
enum DEBUG_CMDEX_INVALID = 0x00000000;
enum DEBUG_CMDEX_ADD_EVENT_STRING = 0x00000001;
enum DEBUG_CMDEX_RESET_EVENT_STRINGS = 0x00000002;
enum DEBUG_EXTINIT_HAS_COMMAND_HELP = 0x00000001;
enum DEBUG_NOTIFY_SESSION_ACTIVE = 0x00000000;
enum DEBUG_NOTIFY_SESSION_INACTIVE = 0x00000001;
enum DEBUG_NOTIFY_SESSION_ACCESSIBLE = 0x00000002;
enum DEBUG_NOTIFY_SESSION_INACCESSIBLE = 0x00000003;
enum DEBUG_KNOWN_STRUCT_GET_NAMES = 0x00000001;
enum DEBUG_KNOWN_STRUCT_GET_SINGLE_LINE_OUTPUT = 0x00000002;
enum DEBUG_KNOWN_STRUCT_SUPPRESS_TYPE_NAME = 0x00000003;
enum DEBUG_EXT_QVALUE_DEFAULT = 0x00000000;
enum DEBUG_EXT_PVALUE_DEFAULT = 0x00000000;
enum DEBUG_EXT_PVTYPE_IS_VALUE = 0x00000000;
enum DEBUG_EXT_PVTYPE_IS_POINTER = 0x00000001;
enum CROSS_PLATFORM_MAXIMUM_PROCESSORS = 0x00000800;
enum EXT_API_VERSION_NUMBER = 0x00000005;
enum EXT_API_VERSION_NUMBER32 = 0x00000005;
enum EXT_API_VERSION_NUMBER64 = 0x00000006;
enum IG_KD_CONTEXT = 0x00000001;
enum IG_READ_CONTROL_SPACE = 0x00000002;
enum IG_WRITE_CONTROL_SPACE = 0x00000003;
enum IG_READ_IO_SPACE = 0x00000004;
enum IG_WRITE_IO_SPACE = 0x00000005;
enum IG_READ_PHYSICAL = 0x00000006;
enum IG_WRITE_PHYSICAL = 0x00000007;
enum IG_READ_IO_SPACE_EX = 0x00000008;
enum IG_WRITE_IO_SPACE_EX = 0x00000009;
enum IG_KSTACK_HELP = 0x0000000a;
enum IG_SET_THREAD = 0x0000000b;
enum IG_READ_MSR = 0x0000000c;
enum IG_WRITE_MSR = 0x0000000d;
enum IG_GET_DEBUGGER_DATA = 0x0000000e;
enum IG_GET_KERNEL_VERSION = 0x0000000f;
enum IG_RELOAD_SYMBOLS = 0x00000010;
enum IG_GET_SET_SYMPATH = 0x00000011;
enum IG_GET_EXCEPTION_RECORD = 0x00000012;
enum IG_IS_PTR64 = 0x00000013;
enum IG_GET_BUS_DATA = 0x00000014;
enum IG_SET_BUS_DATA = 0x00000015;
enum IG_DUMP_SYMBOL_INFO = 0x00000016;
enum IG_LOWMEM_CHECK = 0x00000017;
enum IG_SEARCH_MEMORY = 0x00000018;
enum IG_GET_CURRENT_THREAD = 0x00000019;
enum IG_GET_CURRENT_PROCESS = 0x0000001a;
enum IG_GET_TYPE_SIZE = 0x0000001b;
enum IG_GET_CURRENT_PROCESS_HANDLE = 0x0000001c;
enum IG_GET_INPUT_LINE = 0x0000001d;
enum IG_GET_EXPRESSION_EX = 0x0000001e;
enum IG_TRANSLATE_VIRTUAL_TO_PHYSICAL = 0x0000001f;
enum IG_GET_CACHE_SIZE = 0x00000020;
enum IG_READ_PHYSICAL_WITH_FLAGS = 0x00000021;
enum IG_WRITE_PHYSICAL_WITH_FLAGS = 0x00000022;
enum IG_POINTER_SEARCH_PHYSICAL = 0x00000023;
enum IG_OBSOLETE_PLACEHOLDER_36 = 0x00000024;
enum IG_GET_THREAD_OS_INFO = 0x00000025;
enum IG_GET_CLR_DATA_INTERFACE = 0x00000026;
enum IG_MATCH_PATTERN_A = 0x00000027;
enum IG_FIND_FILE = 0x00000028;
enum IG_TYPED_DATA_OBSOLETE = 0x00000029;
enum IG_QUERY_TARGET_INTERFACE = 0x0000002a;
enum IG_TYPED_DATA = 0x0000002b;
enum IG_DISASSEMBLE_BUFFER = 0x0000002c;
enum IG_GET_ANY_MODULE_IN_RANGE = 0x0000002d;
enum IG_VIRTUAL_TO_PHYSICAL = 0x0000002e;
enum IG_PHYSICAL_TO_VIRTUAL = 0x0000002f;
enum IG_GET_CONTEXT_EX = 0x00000030;
enum IG_GET_TEB_ADDRESS = 0x00000080;
enum IG_GET_PEB_ADDRESS = 0x00000081;
enum PHYS_FLAG_DEFAULT = 0x00000000;
enum PHYS_FLAG_CACHED = 0x00000001;
enum PHYS_FLAG_UNCACHED = 0x00000002;
enum PHYS_FLAG_WRITE_COMBINED = 0x00000003;
enum PTR_SEARCH_PHYS_ALL_HITS = 0x00000001;
enum PTR_SEARCH_PHYS_PTE = 0x00000002;
enum PTR_SEARCH_PHYS_RANGE_CHECK_ONLY = 0x00000004;
enum PTR_SEARCH_PHYS_SIZE_SHIFT = 0x00000003;
enum PTR_SEARCH_NO_SYMBOL_CHECK = 0x80000000;
enum EXT_FIND_FILE_ALLOW_GIVEN_PATH = 0x00000001;
enum DEBUG_TYPED_DATA_IS_IN_MEMORY = 0x00000001;
enum DEBUG_TYPED_DATA_PHYSICAL_DEFAULT = 0x00000002;
enum DEBUG_TYPED_DATA_PHYSICAL_CACHED = 0x00000004;
enum DEBUG_TYPED_DATA_PHYSICAL_UNCACHED = 0x00000006;
enum DEBUG_TYPED_DATA_PHYSICAL_WRITE_COMBINED = 0x00000008;
enum DEBUG_TYPED_DATA_PHYSICAL_MEMORY = 0x0000000e;
enum EXT_TDF_PHYSICAL_DEFAULT = 0x00000002;
enum EXT_TDF_PHYSICAL_CACHED = 0x00000004;
enum EXT_TDF_PHYSICAL_UNCACHED = 0x00000006;
enum EXT_TDF_PHYSICAL_WRITE_COMBINED = 0x00000008;
enum EXT_TDF_PHYSICAL_MEMORY = 0x0000000e;
enum WDBGEXTS_ADDRESS_DEFAULT = 0x00000000;
enum WDBGEXTS_ADDRESS_SEG16 = 0x00000001;
enum WDBGEXTS_ADDRESS_SEG32 = 0x00000002;
enum WDBGEXTS_ADDRESS_RESERVED0 = 0x80000000;
enum DBGKD_VERS_FLAG_MP = 0x00000001;
enum DBGKD_VERS_FLAG_DATA = 0x00000002;
enum DBGKD_VERS_FLAG_PTR64 = 0x00000004;
enum DBGKD_VERS_FLAG_NOMM = 0x00000008;
enum DBGKD_VERS_FLAG_HSS = 0x00000010;
enum DBGKD_VERS_FLAG_PARTITIONS = 0x00000020;
enum DBGKD_VERS_FLAG_HAL_IN_NTOS = 0x00000040;
enum KD_SECONDARY_VERSION_DEFAULT = 0x00000000;
enum KD_SECONDARY_VERSION_AMD64_OBSOLETE_CONTEXT_1 = 0x00000000;
enum KD_SECONDARY_VERSION_AMD64_OBSOLETE_CONTEXT_2 = 0x00000001;
enum KD_SECONDARY_VERSION_AMD64_CONTEXT = 0x00000002;
enum CURRENT_KD_SECONDARY_VERSION = 0x00000002;
enum DBG_DUMP_NO_INDENT = 0x00000001;
enum DBG_DUMP_NO_OFFSET = 0x00000002;
enum DBG_DUMP_VERBOSE = 0x00000004;
enum DBG_DUMP_CALL_FOR_EACH = 0x00000008;
enum DBG_DUMP_LIST = 0x00000020;
enum DBG_DUMP_NO_PRINT = 0x00000040;
enum DBG_DUMP_GET_SIZE_ONLY = 0x00000080;
enum DBG_DUMP_COMPACT_OUT = 0x00002000;
enum DBG_DUMP_ARRAY = 0x00008000;
enum DBG_DUMP_ADDRESS_OF_FIELD = 0x00010000;
enum DBG_DUMP_ADDRESS_AT_END = 0x00020000;
enum DBG_DUMP_COPY_TYPE_DATA = 0x00040000;
enum DBG_DUMP_READ_PHYSICAL = 0x00080000;
enum DBG_DUMP_FUNCTION_FORMAT = 0x00100000;
enum DBG_DUMP_BLOCK_RECURSE = 0x00200000;
enum DBG_DUMP_MATCH_SIZE = 0x00400000;
enum DBG_RETURN_TYPE = 0x00000000;
enum DBG_RETURN_SUBTYPES = 0x00000000;
enum DBG_RETURN_TYPE_VALUES = 0x00000000;
enum DBG_DUMP_FIELD_CALL_BEFORE_PRINT = 0x00000001;
enum DBG_DUMP_FIELD_NO_CALLBACK_REQ = 0x00000002;
enum DBG_DUMP_FIELD_RECUR_ON_THIS = 0x00000004;
enum DBG_DUMP_FIELD_FULL_NAME = 0x00000008;
enum DBG_DUMP_FIELD_ARRAY = 0x00000010;
enum DBG_DUMP_FIELD_COPY_FIELD_DATA = 0x00000020;
enum DBG_DUMP_FIELD_RETURN_ADDRESS = 0x00001000;
enum DBG_DUMP_FIELD_SIZE_IN_BITS = 0x00002000;
enum DBG_DUMP_FIELD_NO_PRINT = 0x00004000;
enum DBG_DUMP_FIELD_DEFAULT_STRING = 0x00010000;
enum DBG_DUMP_FIELD_WCHAR_STRING = 0x00020000;
enum DBG_DUMP_FIELD_MULTI_STRING = 0x00040000;
enum DBG_DUMP_FIELD_GUID_STRING = 0x00080000;
enum DBG_DUMP_FIELD_UTF32_STRING = 0x00100000;
enum MEMORY_READ_ERROR = 0x00000001;
enum SYMBOL_TYPE_INDEX_NOT_FOUND = 0x00000002;
enum SYMBOL_TYPE_INFO_NOT_FOUND = 0x00000003;
enum FIELDS_DID_NOT_MATCH = 0x00000004;
enum NULL_SYM_DUMP_PARAM = 0x00000005;
enum NULL_FIELD_NAME = 0x00000006;
enum INCORRECT_VERSION_INFO = 0x00000007;
enum EXIT_ON_CONTROLC = 0x00000008;
enum CANNOT_ALLOCATE_MEMORY = 0x00000009;
enum INSUFFICIENT_SPACE_TO_COPY = 0x0000000a;
enum ADDRESS_TYPE_INDEX_NOT_FOUND = 0x0000000b;
enum UNAVAILABLE_ERROR = 0x0000000c;
enum CATID_ActiveScript = GUID(0xf0b7a1a1, 0x9847, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
enum CATID_ActiveScriptParse = GUID(0xf0b7a1a2, 0x9847, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
enum CATID_ActiveScriptEncode = GUID(0xf0b7a1a3, 0x9847, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
enum OID_VBSSIP = GUID(0x1629f04e, 0x2799, 0x4db5, [0x8f, 0xe5, 0xac, 0xe1, 0xf, 0x17, 0xeb, 0xab]);
enum OID_JSSIP = GUID(0x6c9e010, 0x38ce, 0x11d4, [0xa2, 0xa3, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
enum OID_WSFSIP = GUID(0x1a610570, 0x38ce, 0x11d4, [0xa2, 0xa3, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
enum SCRIPTITEM_ISVISIBLE = 0x00000002;
enum SCRIPTITEM_ISSOURCE = 0x00000004;
enum SCRIPTITEM_GLOBALMEMBERS = 0x00000008;
enum SCRIPTITEM_ISPERSISTENT = 0x00000040;
enum SCRIPTITEM_CODEONLY = 0x00000200;
enum SCRIPTITEM_NOCODE = 0x00000400;
enum SCRIPTTYPELIB_ISCONTROL = 0x00000010;
enum SCRIPTTYPELIB_ISPERSISTENT = 0x00000040;
enum SCRIPTTEXT_DELAYEXECUTION = 0x00000001;
enum SCRIPTTEXT_ISVISIBLE = 0x00000002;
enum SCRIPTTEXT_ISEXPRESSION = 0x00000020;
enum SCRIPTTEXT_ISPERSISTENT = 0x00000040;
enum SCRIPTTEXT_HOSTMANAGESSOURCE = 0x00000080;
enum SCRIPTTEXT_ISXDOMAIN = 0x00000100;
enum SCRIPTTEXT_ISNONUSERCODE = 0x00000200;
enum SCRIPTPROC_ISEXPRESSION = 0x00000020;
enum SCRIPTPROC_HOSTMANAGESSOURCE = 0x00000080;
enum SCRIPTPROC_IMPLICIT_THIS = 0x00000100;
enum SCRIPTPROC_IMPLICIT_PARENTS = 0x00000200;
enum SCRIPTPROC_ISXDOMAIN = 0x00000400;
enum SCRIPTINFO_IUNKNOWN = 0x00000001;
enum SCRIPTINFO_ITYPEINFO = 0x00000002;
enum SCRIPTINTERRUPT_DEBUG = 0x00000001;
enum SCRIPTINTERRUPT_RAISEEXCEPTION = 0x00000002;
enum SCRIPTSTAT_STATEMENT_COUNT = 0x00000001;
enum SCRIPTSTAT_INSTRUCTION_COUNT = 0x00000002;
enum SCRIPTSTAT_INTSTRUCTION_TIME = 0x00000003;
enum SCRIPTSTAT_TOTAL_TIME = 0x00000004;
enum SCRIPT_ENCODE_SECTION = 0x00000001;
enum SCRIPT_ENCODE_DEFAULT_LANGUAGE = 0x00000001;
enum SCRIPT_ENCODE_NO_ASP_LANGUAGE = 0x00000002;
enum SCRIPTPROP_NAME = 0x00000000;
enum SCRIPTPROP_MAJORVERSION = 0x00000001;
enum SCRIPTPROP_MINORVERSION = 0x00000002;
enum SCRIPTPROP_BUILDNUMBER = 0x00000003;
enum SCRIPTPROP_DELAYEDEVENTSINKING = 0x00001000;
enum SCRIPTPROP_CATCHEXCEPTION = 0x00001001;
enum SCRIPTPROP_CONVERSIONLCID = 0x00001002;
enum SCRIPTPROP_HOSTSTACKREQUIRED = 0x00001003;
enum SCRIPTPROP_SCRIPTSAREFULLYTRUSTED = 0x00001004;
enum SCRIPTPROP_DEBUGGER = 0x00001100;
enum SCRIPTPROP_JITDEBUG = 0x00001101;
enum SCRIPTPROP_GCCONTROLSOFTCLOSE = 0x00002000;
enum SCRIPTPROP_INTEGERMODE = 0x00003000;
enum SCRIPTPROP_STRINGCOMPAREINSTANCE = 0x00003001;
enum SCRIPTPROP_INVOKEVERSIONING = 0x00004000;
enum SCRIPTPROP_HACK_FIBERSUPPORT = 0x70000000;
enum SCRIPTPROP_HACK_TRIDENTEVENTSINK = 0x70000001;
enum SCRIPTPROP_ABBREVIATE_GLOBALNAME_RESOLUTION = 0x70000002;
enum SCRIPTPROP_HOSTKEEPALIVE = 0x70000004;
enum SCRIPT_E_RECORDED = 0xffffffff86664004;
enum SCRIPT_E_REPORTED = 0xffffffff80020101;
enum SCRIPT_E_PROPAGATE = 0xffffffff80020102;
enum MINIDUMP_VERSION = 0x0000a793;
enum MINIDUMP_MISC1_PROCESSOR_POWER_INFO = 0x00000004;
enum MINIDUMP_MISC3_PROCESS_INTEGRITY = 0x00000010;
enum MINIDUMP_MISC3_PROCESS_EXECUTE_FLAGS = 0x00000020;
enum MINIDUMP_MISC3_TIMEZONE = 0x00000040;
enum MINIDUMP_MISC3_PROTECTED_PROCESS = 0x00000080;
enum MINIDUMP_MISC4_BUILDSTRING = 0x00000100;
enum MINIDUMP_MISC5_PROCESS_COOKIE = 0x00000200;
enum MINIDUMP_SYSMEMINFO1_FILECACHE_TRANSITIONREPURPOSECOUNT_FLAGS = 0x00000001;
enum MINIDUMP_SYSMEMINFO1_BASICPERF = 0x00000002;
enum MINIDUMP_SYSMEMINFO1_PERF_CCTOTALDIRTYPAGES_CCDIRTYPAGETHRESHOLD = 0x00000004;
enum MINIDUMP_SYSMEMINFO1_PERF_RESIDENTAVAILABLEPAGES_SHAREDCOMMITPAGES = 0x00000008;
enum MINIDUMP_PROCESS_VM_COUNTERS = 0x00000001;
enum MINIDUMP_PROCESS_VM_COUNTERS_VIRTUALSIZE = 0x00000002;
enum MINIDUMP_PROCESS_VM_COUNTERS_EX = 0x00000004;
enum MINIDUMP_PROCESS_VM_COUNTERS_EX2 = 0x00000008;
enum MINIDUMP_PROCESS_VM_COUNTERS_JOB = 0x00000010;
enum MAX_SYM_NAME = 0x000007d0;
enum BIND_NO_BOUND_IMPORTS = 0x00000001;
enum BIND_NO_UPDATE = 0x00000002;
enum BIND_ALL_IMAGES = 0x00000004;
enum BIND_CACHE_IMPORT_DLLS = 0x00000008;
enum BIND_REPORT_64BIT_VA = 0x00000010;
enum CHECKSUM_SUCCESS = 0x00000000;
enum CHECKSUM_OPEN_FAILURE = 0x00000001;
enum CHECKSUM_MAP_FAILURE = 0x00000002;
enum CHECKSUM_MAPVIEW_FAILURE = 0x00000003;
enum CHECKSUM_UNICODE_FAILURE = 0x00000004;
enum SPLITSYM_REMOVE_PRIVATE = 0x00000001;
enum SPLITSYM_EXTRACT_ALL = 0x00000002;
enum SPLITSYM_SYMBOLPATH_IS_SRC = 0x00000004;
enum CERT_PE_IMAGE_DIGEST_DEBUG_INFO = 0x00000001;
enum CERT_PE_IMAGE_DIGEST_RESOURCES = 0x00000002;
enum CERT_PE_IMAGE_DIGEST_ALL_IMPORT_INFO = 0x00000004;
enum CERT_PE_IMAGE_DIGEST_NON_PE_INFO = 0x00000008;
enum CERT_SECTION_TYPE_ANY = 0x000000ff;
enum ERROR_IMAGE_NOT_STRIPPED = 0x00008800;
enum ERROR_NO_DBG_POINTER = 0x00008801;
enum ERROR_NO_PDB_POINTER = 0x00008802;
enum UNDNAME_COMPLETE = 0x00000000;
enum UNDNAME_NO_LEADING_UNDERSCORES = 0x00000001;
enum UNDNAME_NO_MS_KEYWORDS = 0x00000002;
enum UNDNAME_NO_FUNCTION_RETURNS = 0x00000004;
enum UNDNAME_NO_ALLOCATION_MODEL = 0x00000008;
enum UNDNAME_NO_ALLOCATION_LANGUAGE = 0x00000010;
enum UNDNAME_NO_MS_THISTYPE = 0x00000020;
enum UNDNAME_NO_CV_THISTYPE = 0x00000040;
enum UNDNAME_NO_THISTYPE = 0x00000060;
enum UNDNAME_NO_ACCESS_SPECIFIERS = 0x00000080;
enum UNDNAME_NO_THROW_SIGNATURES = 0x00000100;
enum UNDNAME_NO_MEMBER_TYPE = 0x00000200;
enum UNDNAME_NO_RETURN_UDT_MODEL = 0x00000400;
enum UNDNAME_32_BIT_DECODE = 0x00000800;
enum UNDNAME_NAME_ONLY = 0x00001000;
enum UNDNAME_NO_ARGUMENTS = 0x00002000;
enum UNDNAME_NO_SPECIAL_SYMS = 0x00004000;
enum DBHHEADER_PDBGUID = 0x00000003;
enum INLINE_FRAME_CONTEXT_INIT = 0x00000000;
enum INLINE_FRAME_CONTEXT_IGNORE = 0xffffffff;
enum SYM_STKWALK_DEFAULT = 0x00000000;
enum SYM_STKWALK_FORCE_FRAMEPTR = 0x00000001;
enum SYM_STKWALK_ZEROEXTEND_PTRS = 0x00000002;
enum API_VERSION_NUMBER = 0x0000000c;
enum SYMFLAG_NULL = 0x00080000;
enum SYMFLAG_FUNC_NO_RETURN = 0x00100000;
enum SYMFLAG_SYNTHETIC_ZEROBASE = 0x00200000;
enum SYMFLAG_PUBLIC_CODE = 0x00400000;
enum SYMFLAG_REGREL_ALIASINDIR = 0x00800000;
enum SYMFLAG_FIXUP_ARM64X = 0x01000000;
enum SYMFLAG_GLOBAL = 0x02000000;
enum SYMFLAG_RESET = 0x80000000;
enum IMAGEHLP_MODULE_REGION_DLLBASE = 0x00000001;
enum IMAGEHLP_MODULE_REGION_DLLRANGE = 0x00000002;
enum IMAGEHLP_MODULE_REGION_ADDITIONAL = 0x00000004;
enum IMAGEHLP_MODULE_REGION_JIT = 0x00000008;
enum IMAGEHLP_MODULE_REGION_ALL = 0x000000ff;
enum CBA_DEFERRED_SYMBOL_LOAD_START = 0x00000001;
enum CBA_DEFERRED_SYMBOL_LOAD_COMPLETE = 0x00000002;
enum CBA_DEFERRED_SYMBOL_LOAD_FAILURE = 0x00000003;
enum CBA_SYMBOLS_UNLOADED = 0x00000004;
enum CBA_DUPLICATE_SYMBOL = 0x00000005;
enum CBA_READ_MEMORY = 0x00000006;
enum CBA_DEFERRED_SYMBOL_LOAD_CANCEL = 0x00000007;
enum CBA_SET_OPTIONS = 0x00000008;
enum CBA_EVENT = 0x00000010;
enum CBA_DEFERRED_SYMBOL_LOAD_PARTIAL = 0x00000020;
enum CBA_DEBUG_INFO = 0x10000000;
enum CBA_SRCSRV_INFO = 0x20000000;
enum CBA_SRCSRV_EVENT = 0x40000000;
enum CBA_UPDATE_STATUS_BAR = 0x50000000;
enum CBA_ENGINE_PRESENT = 0x60000000;
enum CBA_CHECK_ENGOPT_DISALLOW_NETWORK_PATHS = 0x70000000;
enum CBA_CHECK_ARM_MACHINE_THUMB_TYPE_OVERRIDE = 0x80000000;
enum CBA_XML_LOG = 0x90000000;
enum CBA_MAP_JIT_SYMBOL = 0xa0000000;
enum EVENT_SRCSPEW_START = 0x00000064;
enum EVENT_SRCSPEW = 0x00000064;
enum EVENT_SRCSPEW_END = 0x000000c7;
enum DSLFLAG_MISMATCHED_PDB = 0x00000001;
enum DSLFLAG_MISMATCHED_DBG = 0x00000002;
enum FLAG_ENGINE_PRESENT = 0x00000004;
enum FLAG_ENGOPT_DISALLOW_NETWORK_PATHS = 0x00000008;
enum FLAG_OVERRIDE_ARM_MACHINE_TYPE = 0x00000010;
enum SYMOPT_CASE_INSENSITIVE = 0x00000001;
enum SYMOPT_UNDNAME = 0x00000002;
enum SYMOPT_DEFERRED_LOADS = 0x00000004;
enum SYMOPT_NO_CPP = 0x00000008;
enum SYMOPT_LOAD_LINES = 0x00000010;
enum SYMOPT_OMAP_FIND_NEAREST = 0x00000020;
enum SYMOPT_LOAD_ANYTHING = 0x00000040;
enum SYMOPT_IGNORE_CVREC = 0x00000080;
enum SYMOPT_NO_UNQUALIFIED_LOADS = 0x00000100;
enum SYMOPT_FAIL_CRITICAL_ERRORS = 0x00000200;
enum SYMOPT_EXACT_SYMBOLS = 0x00000400;
enum SYMOPT_ALLOW_ABSOLUTE_SYMBOLS = 0x00000800;
enum SYMOPT_IGNORE_NT_SYMPATH = 0x00001000;
enum SYMOPT_INCLUDE_32BIT_MODULES = 0x00002000;
enum SYMOPT_PUBLICS_ONLY = 0x00004000;
enum SYMOPT_NO_PUBLICS = 0x00008000;
enum SYMOPT_AUTO_PUBLICS = 0x00010000;
enum SYMOPT_NO_IMAGE_SEARCH = 0x00020000;
enum SYMOPT_SECURE = 0x00040000;
enum SYMOPT_NO_PROMPTS = 0x00080000;
enum SYMOPT_OVERWRITE = 0x00100000;
enum SYMOPT_IGNORE_IMAGEDIR = 0x00200000;
enum SYMOPT_FLAT_DIRECTORY = 0x00400000;
enum SYMOPT_FAVOR_COMPRESSED = 0x00800000;
enum SYMOPT_ALLOW_ZERO_ADDRESS = 0x01000000;
enum SYMOPT_DISABLE_SYMSRV_AUTODETECT = 0x02000000;
enum SYMOPT_READONLY_CACHE = 0x04000000;
enum SYMOPT_SYMPATH_LAST = 0x08000000;
enum SYMOPT_DISABLE_FAST_SYMBOLS = 0x10000000;
enum SYMOPT_DISABLE_SYMSRV_TIMEOUT = 0x20000000;
enum SYMOPT_DISABLE_SRVSTAR_ON_STARTUP = 0x40000000;
enum SYMOPT_DEBUG = 0x80000000;
enum SYM_INLINE_COMP_ERROR = 0x00000000;
enum SYM_INLINE_COMP_IDENTICAL = 0x00000001;
enum SYM_INLINE_COMP_STEPIN = 0x00000002;
enum SYM_INLINE_COMP_STEPOUT = 0x00000003;
enum SYM_INLINE_COMP_STEPOVER = 0x00000004;
enum SYM_INLINE_COMP_DIFFERENT = 0x00000005;
enum ESLFLAG_FULLPATH = 0x00000001;
enum ESLFLAG_NEAREST = 0x00000002;
enum ESLFLAG_PREV = 0x00000004;
enum ESLFLAG_NEXT = 0x00000008;
enum ESLFLAG_INLINE_SITE = 0x00000010;
enum SYMENUM_OPTIONS_DEFAULT = 0x00000001;
enum SYMENUM_OPTIONS_INLINE = 0x00000002;
enum SYMSEARCH_MASKOBJS = 0x00000001;
enum SYMSEARCH_RECURSE = 0x00000002;
enum SYMSEARCH_GLOBALSONLY = 0x00000004;
enum SYMSEARCH_ALLITEMS = 0x00000008;
enum EXT_OUTPUT_VER = 0x00000001;
enum SYMSRV_VERSION = 0x00000002;
enum SSRVOPT_CALLBACK = 0x00000001;
enum SSRVOPT_OLDGUIDPTR = 0x00000010;
enum SSRVOPT_UNATTENDED = 0x00000020;
enum SSRVOPT_NOCOPY = 0x00000040;
enum SSRVOPT_GETPATH = 0x00000040;
enum SSRVOPT_PARENTWIN = 0x00000080;
enum SSRVOPT_PARAMTYPE = 0x00000100;
enum SSRVOPT_SECURE = 0x00000200;
enum SSRVOPT_TRACE = 0x00000400;
enum SSRVOPT_SETCONTEXT = 0x00000800;
enum SSRVOPT_PROXY = 0x00001000;
enum SSRVOPT_DOWNSTREAM_STORE = 0x00002000;
enum SSRVOPT_OVERWRITE = 0x00004000;
enum SSRVOPT_RESETTOU = 0x00008000;
enum SSRVOPT_CALLBACKW = 0x00010000;
enum SSRVOPT_FLAT_DEFAULT_STORE = 0x00020000;
enum SSRVOPT_PROXYW = 0x00040000;
enum SSRVOPT_MESSAGE = 0x00080000;
enum SSRVOPT_SERVICE = 0x00100000;
enum SSRVOPT_FAVOR_COMPRESSED = 0x00200000;
enum SSRVOPT_STRING = 0x00400000;
enum SSRVOPT_WINHTTP = 0x00800000;
enum SSRVOPT_WININET = 0x01000000;
enum SSRVOPT_DONT_UNCOMPRESS = 0x02000000;
enum SSRVOPT_DISABLE_PING_HOST = 0x04000000;
enum SSRVOPT_DISABLE_TIMEOUT = 0x08000000;
enum SSRVOPT_ENABLE_COMM_MSG = 0x10000000;
enum SSRVOPT_URI_FILTER = 0x20000000;
enum SSRVOPT_URI_TIERS = 0x40000000;
enum SSRVOPT_RETRY_APP_HANG = 0x80000000;
enum SSRVOPT_MAX = 0x80000000;
enum NUM_SSRVOPTS = 0x00000020;
enum SSRVURI_HTTP_NORMAL = 0x00000001;
enum SSRVURI_HTTP_COMPRESSED = 0x00000002;
enum SSRVURI_HTTP_FILEPTR = 0x00000004;
enum SSRVURI_UNC_NORMAL = 0x00000010;
enum SSRVURI_UNC_COMPRESSED = 0x00000020;
enum SSRVURI_UNC_FILEPTR = 0x00000040;
enum SSRVURI_HTTP_MASK = 0x0000000f;
enum SSRVURI_UNC_MASK = 0x000000f0;
enum SSRVURI_ALL = 0x000000ff;
enum SSRVURI_NORMAL = 0x00000001;
enum SSRVURI_COMPRESSED = 0x00000002;
enum SSRVURI_FILEPTR = 0x00000004;
enum SSRVACTION_TRACE = 0x00000001;
enum SSRVACTION_QUERYCANCEL = 0x00000002;
enum SSRVACTION_EVENT = 0x00000003;
enum SSRVACTION_EVENTW = 0x00000004;
enum SSRVACTION_SIZE = 0x00000005;
enum SSRVACTION_HTTPSTATUS = 0x00000006;
enum SSRVACTION_XMLOUTPUT = 0x00000007;
enum SSRVACTION_CHECKSUMSTATUS = 0x00000008;
enum SYMSTOREOPT_ALT_INDEX = 0x00000010;
enum SYMSTOREOPT_UNICODE = 0x00000020;
enum SYMF_OMAP_GENERATED = 0x00000001;
enum SYMF_OMAP_MODIFIED = 0x00000002;
enum SYMF_REGISTER = 0x00000008;
enum SYMF_REGREL = 0x00000010;
enum SYMF_FRAMEREL = 0x00000020;
enum SYMF_PARAMETER = 0x00000040;
enum SYMF_LOCAL = 0x00000080;
enum SYMF_CONSTANT = 0x00000100;
enum SYMF_EXPORT = 0x00000200;
enum SYMF_FORWARDER = 0x00000400;
enum SYMF_FUNCTION = 0x00000800;
enum SYMF_VIRTUAL = 0x00001000;
enum SYMF_THUNK = 0x00002000;
enum SYMF_TLSREL = 0x00004000;
enum IMAGEHLP_SYMBOL_INFO_VALUEPRESENT = 0x00000001;
enum IMAGEHLP_SYMBOL_INFO_REGISTER = 0x00000008;
enum IMAGEHLP_SYMBOL_INFO_REGRELATIVE = 0x00000010;
enum IMAGEHLP_SYMBOL_INFO_FRAMERELATIVE = 0x00000020;
enum IMAGEHLP_SYMBOL_INFO_PARAMETER = 0x00000040;
enum IMAGEHLP_SYMBOL_INFO_LOCAL = 0x00000080;
enum IMAGEHLP_SYMBOL_INFO_CONSTANT = 0x00000100;
enum IMAGEHLP_SYMBOL_FUNCTION = 0x00000800;
enum IMAGEHLP_SYMBOL_VIRTUAL = 0x00001000;
enum IMAGEHLP_SYMBOL_THUNK = 0x00002000;
enum IMAGEHLP_SYMBOL_INFO_TLSRELATIVE = 0x00004000;
enum IMAGEHLP_RMAP_MAPPED_FLAT = 0x00000001;
enum IMAGEHLP_RMAP_BIG_ENDIAN = 0x00000002;
enum IMAGEHLP_RMAP_IGNORE_MISCOMPARE = 0x00000004;
enum IMAGEHLP_RMAP_FIXUP_ARM64X = 0x10000000;
enum IMAGEHLP_RMAP_LOAD_RW_DATA_SECTIONS = 0x20000000;
enum IMAGEHLP_RMAP_OMIT_SHARED_RW_DATA_SECTIONS = 0x40000000;
enum IMAGEHLP_RMAP_FIXUP_IMAGEBASE = 0x80000000;
enum WCT_MAX_NODE_COUNT = 0x00000010;
enum WCT_OBJNAME_LENGTH = 0x00000080;
enum WCT_NETWORK_IO_FLAG = 0x00000008;
enum RESTORE_LAST_ERROR_NAME_A = "RestoreLastError";
enum RESTORE_LAST_ERROR_NAME_W = "RestoreLastError";
enum RESTORE_LAST_ERROR_NAME = "RestoreLastError";
enum APPBREAKFLAG_DEBUGGER_BLOCK = 0x00000001;
enum APPBREAKFLAG_DEBUGGER_HALT = 0x00000002;
enum APPBREAKFLAG_STEP = 0x00010000;
enum APPBREAKFLAG_NESTED = 0x00020000;
enum APPBREAKFLAG_STEPTYPE_SOURCE = 0x00000000;
enum APPBREAKFLAG_STEPTYPE_BYTECODE = 0x00100000;
enum APPBREAKFLAG_STEPTYPE_MACHINE = 0x00200000;
enum APPBREAKFLAG_STEPTYPE_MASK = 0x00f00000;
enum APPBREAKFLAG_IN_BREAKPOINT = 0x80000000;
enum SOURCETEXT_ATTR_KEYWORD = 0x00000001;
enum SOURCETEXT_ATTR_COMMENT = 0x00000002;
enum SOURCETEXT_ATTR_NONSOURCE = 0x00000004;
enum SOURCETEXT_ATTR_OPERATOR = 0x00000008;
enum SOURCETEXT_ATTR_NUMBER = 0x00000010;
enum SOURCETEXT_ATTR_STRING = 0x00000020;
enum SOURCETEXT_ATTR_FUNCTION_START = 0x00000040;
enum TEXT_DOC_ATTR_READONLY = 0x00000001;
enum TEXT_DOC_ATTR_TYPE_PRIMARY = 0x00000002;
enum TEXT_DOC_ATTR_TYPE_WORKER = 0x00000004;
enum TEXT_DOC_ATTR_TYPE_SCRIPT = 0x00000008;
enum DEBUG_TEXT_ISEXPRESSION = 0x00000001;
enum DEBUG_TEXT_RETURNVALUE = 0x00000002;
enum DEBUG_TEXT_NOSIDEEFFECTS = 0x00000004;
enum DEBUG_TEXT_ALLOWBREAKPOINTS = 0x00000008;
enum DEBUG_TEXT_ALLOWERRORREPORT = 0x00000010;
enum DEBUG_TEXT_EVALUATETOCODECONTEXT = 0x00000020;
enum DEBUG_TEXT_ISNONUSERCODE = 0x00000040;
enum THREAD_STATE_RUNNING = 0x00000001;
enum THREAD_STATE_SUSPENDED = 0x00000002;
enum THREAD_BLOCKED = 0x00000004;
enum THREAD_OUT_OF_CONTEXT = 0x00000008;
enum CATID_ActiveScriptAuthor = GUID(0xaee2a92, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
enum FACILITY_JsDEBUG = 0x00000dc7;
enum E_JsDEBUG_MISMATCHED_RUNTIME = 0xffffffff8dc70001;
enum E_JsDEBUG_UNKNOWN_THREAD = 0xffffffff8dc70002;
enum E_JsDEBUG_OUTSIDE_OF_VM = 0xffffffff8dc70004;
enum E_JsDEBUG_INVALID_MEMORY_ADDRESS = 0xffffffff8dc70005;
enum E_JsDEBUG_SOURCE_LOCATION_NOT_FOUND = 0xffffffff8dc70006;
enum E_JsDEBUG_RUNTIME_NOT_IN_DEBUG_MODE = 0xffffffff8dc70007;
enum DMP_PHYSICAL_MEMORY_BLOCK_SIZE_32 = 0x000002bc;
enum DMP_CONTEXT_RECORD_SIZE_32 = 0x000004b0;
enum DMP_RESERVED_0_SIZE_32 = 0x000006e0;
enum DMP_RESERVED_2_SIZE_32 = 0x00000010;
enum DMP_RESERVED_3_SIZE_32 = 0x00000038;
enum DMP_PHYSICAL_MEMORY_BLOCK_SIZE_64 = 0x000002bc;
enum DMP_CONTEXT_RECORD_SIZE_64 = 0x00000bb8;
enum DMP_RESERVED_0_SIZE_64 = 0x00000fa8;
enum DMP_HEADER_COMMENT_SIZE = 0x00000080;
enum DUMP_SUMMARY_VALID_KERNEL_VA = 0x00000001;
enum DUMP_SUMMARY_VALID_CURRENT_USER_VA = 0x00000002;
enum INTERFACESAFE_FOR_UNTRUSTED_CALLER = 0x00000001;
enum INTERFACESAFE_FOR_UNTRUSTED_DATA = 0x00000002;
enum INTERFACE_USES_DISPEX = 0x00000004;
enum INTERFACE_USES_SECURITY_MANAGER = 0x00000008;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_10 = 0x0000000a;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_11 = 0x0000000b;
enum WHEA_MAX_MC_BANKS = 0x00000020;
enum WHEA_ERROR_SOURCE_FLAG_FIRMWAREFIRST = 0x00000001;
enum WHEA_ERROR_SOURCE_FLAG_GLOBAL = 0x00000002;
enum WHEA_ERROR_SOURCE_FLAG_GHES_ASSIST = 0x00000004;
enum WHEA_ERROR_SOURCE_FLAG_DEFAULTSOURCE = 0x80000000;
enum WHEA_ERROR_SOURCE_INVALID_RELATED_SOURCE = 0x0000ffff;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFMCE = 0x00000000;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFCMC = 0x00000001;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFNMI = 0x00000002;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFMCA = 0x00000003;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCMC = 0x00000004;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCPE = 0x00000005;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERROOTPORT = 0x00000006;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERENDPOINT = 0x00000007;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERBRIDGE = 0x00000008;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC = 0x00000009;
enum WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC_V2 = 0x0000000a;
enum WHEA_XPF_MC_BANK_STATUSFORMAT_IA32MCA = 0x00000000;
enum WHEA_XPF_MC_BANK_STATUSFORMAT_Intel64MCA = 0x00000001;
enum WHEA_XPF_MC_BANK_STATUSFORMAT_AMD64MCA = 0x00000002;
enum WHEA_NOTIFICATION_TYPE_POLLED = 0x00000000;
enum WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT = 0x00000001;
enum WHEA_NOTIFICATION_TYPE_LOCALINTERRUPT = 0x00000002;
enum WHEA_NOTIFICATION_TYPE_SCI = 0x00000003;
enum WHEA_NOTIFICATION_TYPE_NMI = 0x00000004;
enum WHEA_NOTIFICATION_TYPE_CMCI = 0x00000005;
enum WHEA_NOTIFICATION_TYPE_MCE = 0x00000006;
enum WHEA_NOTIFICATION_TYPE_GPIO_SIGNAL = 0x00000007;
enum WHEA_NOTIFICATION_TYPE_ARMV8_SEA = 0x00000008;
enum WHEA_NOTIFICATION_TYPE_ARMV8_SEI = 0x00000009;
enum WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT_GSIV = 0x0000000a;
enum WHEA_NOTIFICATION_TYPE_SDEI = 0x0000000b;
enum WHEA_DEVICE_DRIVER_CONFIG_V1 = 0x00000001;
enum WHEA_DEVICE_DRIVER_CONFIG_V2 = 0x00000002;
enum WHEA_DEVICE_DRIVER_CONFIG_MIN = 0x00000001;
enum WHEA_DEVICE_DRIVER_CONFIG_MAX = 0x00000002;
enum WHEA_DEVICE_DRIVER_BUFFER_SET_V1 = 0x00000001;
enum WHEA_DEVICE_DRIVER_BUFFER_SET_MIN = 0x00000001;
enum WHEA_DEVICE_DRIVER_BUFFER_SET_MAX = 0x00000001;
enum WHEA_DISABLE_OFFLINE = 0x00000000;
enum WHEA_MEM_PERSISTOFFLINE = 0x00000001;
enum WHEA_MEM_PFA_DISABLE = 0x00000002;
enum WHEA_MEM_PFA_PAGECOUNT = 0x00000003;
enum WHEA_MEM_PFA_THRESHOLD = 0x00000004;
enum WHEA_MEM_PFA_TIMEOUT = 0x00000005;
enum WHEA_DISABLE_DUMMY_WRITE = 0x00000006;
enum WHEA_RESTORE_CMCI_ENABLED = 0x00000007;
enum WHEA_RESTORE_CMCI_ATTEMPTS = 0x00000008;
enum WHEA_RESTORE_CMCI_ERR_LIMIT = 0x00000009;
enum WHEA_CMCI_THRESHOLD_COUNT = 0x0000000a;
enum WHEA_CMCI_THRESHOLD_TIME = 0x0000000b;
enum WHEA_CMCI_THRESHOLD_POLL_COUNT = 0x0000000c;
enum WHEA_PENDING_PAGE_LIST_SZ = 0x0000000d;
enum WHEA_BAD_PAGE_LIST_MAX_SIZE = 0x0000000e;
enum WHEA_BAD_PAGE_LIST_LOCATION = 0x0000000f;
enum WHEA_NOTIFY_ALL_OFFLINES = 0x00000010;
enum IPMI_OS_SEL_RECORD_VERSION_1 = 0x00000001;
enum IPMI_OS_SEL_RECORD_VERSION = 0x00000001;
enum IPMI_IOCTL_INDEX = 0x00000400;
enum IOCTL_IPMI_INTERNAL_RECORD_SEL_EVENT = 0x00221000;
enum IPMI_OS_SEL_RECORD_MASK = 0x0000ffff;
enum DBGKD_SIMULATION_NONE = 0x00000000;
enum DBGKD_SIMULATION_EXDI = 0x00000001;
enum ACTIVPROF_E_PROFILER_PRESENT = 0xffffffff80040200;
enum ACTIVPROF_E_PROFILER_ABSENT = 0xffffffff80040201;
enum ACTIVPROF_E_UNABLE_TO_APPLY_ACTION = 0xffffffff80040202;
enum PROFILER_HEAP_OBJECT_NAME_ID_UNAVAILABLE = 0xffffffff;
enum sevMax = 0x00000004;
enum fasaPreferInternalHandler = 0x00000001;
enum fasaSupportInternalHandler = 0x00000002;
enum fasaCaseSensitive = 0x00000004;
enum SCRIPT_CMPL_NOLIST = 0x00000000;
enum SCRIPT_CMPL_MEMBERLIST = 0x00000001;
enum SCRIPT_CMPL_ENUMLIST = 0x00000002;
enum SCRIPT_CMPL_PARAMTIP = 0x00000004;
enum SCRIPT_CMPL_GLOBALLIST = 0x00000008;
enum SCRIPT_CMPL_ENUM_TRIGGER = 0x00000001;
enum SCRIPT_CMPL_MEMBER_TRIGGER = 0x00000002;
enum SCRIPT_CMPL_PARAM_TRIGGER = 0x00000003;
enum SCRIPT_CMPL_COMMIT = 0x00000004;
enum GETATTRTYPE_NORMAL = 0x00000000;
enum GETATTRTYPE_DEPSCAN = 0x00000001;
enum GETATTRFLAG_THIS = 0x00000100;
enum GETATTRFLAG_HUMANTEXT = 0x00008000;
enum SOURCETEXT_ATTR_HUMANTEXT = 0x00008000;
enum SOURCETEXT_ATTR_IDENTIFIER = 0x00000100;
enum SOURCETEXT_ATTR_MEMBERLOOKUP = 0x00000200;
enum SOURCETEXT_ATTR_THIS = 0x00000400;
struct CONTEXT
{
    uint ContextFlags;
    uint Cpsr;
    union
    {
        struct
        {
            ulong X0;
            ulong X1;
            ulong X2;
            ulong X3;
            ulong X4;
            ulong X5;
            ulong X6;
            ulong X7;
            ulong X8;
            ulong X9;
            ulong X10;
            ulong X11;
            ulong X12;
            ulong X13;
            ulong X14;
            ulong X15;
            ulong X16;
            ulong X17;
            ulong X18;
            ulong X19;
            ulong X20;
            ulong X21;
            ulong X22;
            ulong X23;
            ulong X24;
            ulong X25;
            ulong X26;
            ulong X27;
            ulong X28;
            ulong Fp;
            ulong Lr;
        }
        ulong[31] X;
    }
    ulong Sp;
    ulong Pc;
    ARM64_NT_NEON128[32] V;
    uint Fpcr;
    uint Fpsr;
    uint[8] Bcr;
    ulong[8] Bvr;
    uint[2] Wcr;
    ulong[2] Wvr;
}
struct DISPATCHER_CONTEXT
{
    ulong ControlPc;
    ulong ImageBase;
    IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY* FunctionEntry;
    ulong EstablisherFrame;
    ulong TargetPc;
    CONTEXT* ContextRecord;
    EXCEPTION_ROUTINE LanguageHandler;
    void* HandlerData;
    UNWIND_HISTORY_TABLE* HistoryTable;
    uint ScopeIndex;
    BOOLEAN ControlPcIsUnwound;
    ubyte* NonVolatileRegisters;
}
alias PGET_RUNTIME_FUNCTION_CALLBACK = IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY* function(ulong, void*);
struct KNONVOLATILE_CONTEXT_POINTERS_ARM64
{
    ulong* X19;
    ulong* X20;
    ulong* X21;
    ulong* X22;
    ulong* X23;
    ulong* X24;
    ulong* X25;
    ulong* X26;
    ulong* X27;
    ulong* X28;
    ulong* Fp;
    ulong* Lr;
    ulong* D8;
    ulong* D9;
    ulong* D10;
    ulong* D11;
    ulong* D12;
    ulong* D13;
    ulong* D14;
    ulong* D15;
}
struct UNWIND_HISTORY_TABLE_ENTRY
{
    ulong ImageBase;
    IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY* FunctionEntry;
}
struct MINIDUMP_THREAD_CALLBACK
{
    align (4):
    uint ThreadId;
    HANDLE ThreadHandle;
    uint Pad;
    CONTEXT Context;
    uint SizeOfContext;
    ulong StackBase;
    ulong StackEnd;
}
struct MINIDUMP_THREAD_EX_CALLBACK
{
    align (4):
    uint ThreadId;
    HANDLE ThreadHandle;
    uint Pad;
    CONTEXT Context;
    uint SizeOfContext;
    ulong StackBase;
    ulong StackEnd;
    ulong BackingStoreBase;
    ulong BackingStoreEnd;
}
struct EXCEPTION_DEBUG_INFO
{
    EXCEPTION_RECORD ExceptionRecord;
    uint dwFirstChance;
}
struct CREATE_THREAD_DEBUG_INFO
{
    HANDLE hThread;
    void* lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
}
struct CREATE_PROCESS_DEBUG_INFO
{
    HANDLE hFile;
    HANDLE hProcess;
    HANDLE hThread;
    void* lpBaseOfImage;
    uint dwDebugInfoFileOffset;
    uint nDebugInfoSize;
    void* lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
    void* lpImageName;
    ushort fUnicode;
}
struct EXIT_THREAD_DEBUG_INFO
{
    uint dwExitCode;
}
struct EXIT_PROCESS_DEBUG_INFO
{
    uint dwExitCode;
}
struct LOAD_DLL_DEBUG_INFO
{
    HANDLE hFile;
    void* lpBaseOfDll;
    uint dwDebugInfoFileOffset;
    uint nDebugInfoSize;
    void* lpImageName;
    ushort fUnicode;
}
struct UNLOAD_DLL_DEBUG_INFO
{
    void* lpBaseOfDll;
}
struct OUTPUT_DEBUG_STRING_INFO
{
    PSTR lpDebugStringData;
    ushort fUnicode;
    ushort nDebugStringLength;
}
struct RIP_INFO
{
    uint dwError;
    RIP_INFO_TYPE dwType;
}
struct DEBUG_EVENT
{
    DEBUG_EVENT_CODE dwDebugEventCode;
    uint dwProcessId;
    uint dwThreadId;
    union _u_e__Union
    {
        EXCEPTION_DEBUG_INFO Exception;
        CREATE_THREAD_DEBUG_INFO CreateThread;
        CREATE_PROCESS_DEBUG_INFO CreateProcessInfo;
        EXIT_THREAD_DEBUG_INFO ExitThread;
        EXIT_PROCESS_DEBUG_INFO ExitProcess;
        LOAD_DLL_DEBUG_INFO LoadDll;
        UNLOAD_DLL_DEBUG_INFO UnloadDll;
        OUTPUT_DEBUG_STRING_INFO DebugString;
        RIP_INFO RipInfo;
    }
}
struct DEBUG_OFFSET_REGION
{
    ulong Base;
    ulong Size;
}
enum IID_IDebugAdvanced = GUID(0xf2df5f53, 0x71f, 0x47bd, [0x9d, 0xe6, 0x57, 0x34, 0xc3, 0xfe, 0xd6, 0x89]);
interface IDebugAdvanced : IUnknown
{
    HRESULT GetThreadContext(void*, uint);
    HRESULT SetThreadContext(void*, uint);
}
struct DEBUG_READ_USER_MINIDUMP_STREAM
{
    uint StreamType;
    uint Flags;
    ulong Offset;
    void* Buffer;
    uint BufferSize;
    uint BufferUsed;
}
struct DEBUG_GET_TEXT_COMPLETIONS_IN
{
    uint Flags;
    uint MatchCountLimit;
    ulong[3] Reserved;
}
struct DEBUG_GET_TEXT_COMPLETIONS_OUT
{
    uint Flags;
    uint ReplaceIndex;
    uint MatchCount;
    uint Reserved1;
    ulong[2] Reserved2;
}
struct DEBUG_CACHED_SYMBOL_INFO
{
    ulong ModBase;
    ulong Arg1;
    ulong Arg2;
    uint Id;
    uint Arg3;
}
struct PROCESS_NAME_ENTRY
{
    uint ProcessId;
    uint NameOffset;
    uint NameSize;
    uint NextEntry;
}
struct DEBUG_THREAD_BASIC_INFORMATION
{
    uint Valid;
    uint ExitStatus;
    uint PriorityClass;
    uint Priority;
    ulong CreateTime;
    ulong ExitTime;
    ulong KernelTime;
    ulong UserTime;
    ulong StartOffset;
    ulong Affinity;
}
enum IID_IDebugAdvanced2 = GUID(0x716d14c9, 0x119b, 0x4ba5, [0xaf, 0x1f, 0x8, 0x90, 0xe6, 0x72, 0x41, 0x6a]);
interface IDebugAdvanced2 : IUnknown
{
    HRESULT GetThreadContext(void*, uint);
    HRESULT SetThreadContext(void*, uint);
    HRESULT Request(uint, void*, uint, void*, uint, uint*);
    HRESULT GetSourceFileInformation(uint, PSTR, ulong, uint, void*, uint, uint*);
    HRESULT FindSourceFileAndToken(uint, ulong, const(char)*, uint, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSymbolInformation(uint, ulong, uint, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSystemObjectInformation(uint, ulong, uint, void*, uint, uint*);
}
enum IID_IDebugAdvanced3 = GUID(0xcba4abb4, 0x84c4, 0x444d, [0x87, 0xca, 0xa0, 0x4e, 0x13, 0x28, 0x67, 0x39]);
interface IDebugAdvanced3 : IUnknown
{
    HRESULT GetThreadContext(void*, uint);
    HRESULT SetThreadContext(void*, uint);
    HRESULT Request(uint, void*, uint, void*, uint, uint*);
    HRESULT GetSourceFileInformation(uint, PSTR, ulong, uint, void*, uint, uint*);
    HRESULT FindSourceFileAndToken(uint, ulong, const(char)*, uint, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSymbolInformation(uint, ulong, uint, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSystemObjectInformation(uint, ulong, uint, void*, uint, uint*);
    HRESULT GetSourceFileInformationWide(uint, PWSTR, ulong, uint, void*, uint, uint*);
    HRESULT FindSourceFileAndTokenWide(uint, ulong, const(wchar)*, uint, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetSymbolInformationWide(uint, ulong, uint, void*, uint, uint*, PWSTR, uint, uint*);
}
struct SYMBOL_INFO_EX
{
    uint SizeOfStruct;
    uint TypeOfInfo;
    ulong Offset;
    uint Line;
    uint Displacement;
    uint[4] Reserved;
}
enum IID_IDebugAdvanced4 = GUID(0xd1069067, 0x2a65, 0x4bf0, [0xae, 0x97, 0x76, 0x18, 0x4b, 0x67, 0x85, 0x6b]);
interface IDebugAdvanced4 : IUnknown
{
    HRESULT GetThreadContext(void*, uint);
    HRESULT SetThreadContext(void*, uint);
    HRESULT Request(uint, void*, uint, void*, uint, uint*);
    HRESULT GetSourceFileInformation(uint, PSTR, ulong, uint, void*, uint, uint*);
    HRESULT FindSourceFileAndToken(uint, ulong, const(char)*, uint, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSymbolInformation(uint, ulong, uint, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSystemObjectInformation(uint, ulong, uint, void*, uint, uint*);
    HRESULT GetSourceFileInformationWide(uint, PWSTR, ulong, uint, void*, uint, uint*);
    HRESULT FindSourceFileAndTokenWide(uint, ulong, const(wchar)*, uint, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetSymbolInformationWide(uint, ulong, uint, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetSymbolInformationWideEx(uint, ulong, uint, void*, uint, uint*, PWSTR, uint, uint*, SYMBOL_INFO_EX*);
}
struct DEBUG_BREAKPOINT_PARAMETERS
{
    ulong Offset;
    uint Id;
    uint BreakType;
    uint ProcType;
    uint Flags;
    uint DataSize;
    uint DataAccessType;
    uint PassCount;
    uint CurrentPassCount;
    uint MatchThread;
    uint CommandSize;
    uint OffsetExpressionSize;
}
enum IID_IDebugBreakpoint = GUID(0x5bd9d474, 0x5975, 0x423a, [0xb8, 0x8b, 0x65, 0xa8, 0xe7, 0x11, 0xe, 0x65]);
interface IDebugBreakpoint : IUnknown
{
    HRESULT GetId(uint*);
    HRESULT GetType(uint*, uint*);
    HRESULT GetAdder(IDebugClient*);
    HRESULT GetFlags(uint*);
    HRESULT AddFlags(uint);
    HRESULT RemoveFlags(uint);
    HRESULT SetFlags(uint);
    HRESULT GetOffset(ulong*);
    HRESULT SetOffset(ulong);
    HRESULT GetDataParameters(uint*, uint*);
    HRESULT SetDataParameters(uint, uint);
    HRESULT GetPassCount(uint*);
    HRESULT SetPassCount(uint);
    HRESULT GetCurrentPassCount(uint*);
    HRESULT GetMatchThreadId(uint*);
    HRESULT SetMatchThreadId(uint);
    HRESULT GetCommand(PSTR, uint, uint*);
    HRESULT SetCommand(const(char)*);
    HRESULT GetOffsetExpression(PSTR, uint, uint*);
    HRESULT SetOffsetExpression(const(char)*);
    HRESULT GetParameters(DEBUG_BREAKPOINT_PARAMETERS*);
}
enum IID_IDebugBreakpoint2 = GUID(0x1b278d20, 0x79f2, 0x426e, [0xa3, 0xf9, 0xc1, 0xdd, 0xf3, 0x75, 0xd4, 0x8e]);
interface IDebugBreakpoint2 : IUnknown
{
    HRESULT GetId(uint*);
    HRESULT GetType(uint*, uint*);
    HRESULT GetAdder(IDebugClient*);
    HRESULT GetFlags(uint*);
    HRESULT AddFlags(uint);
    HRESULT RemoveFlags(uint);
    HRESULT SetFlags(uint);
    HRESULT GetOffset(ulong*);
    HRESULT SetOffset(ulong);
    HRESULT GetDataParameters(uint*, uint*);
    HRESULT SetDataParameters(uint, uint);
    HRESULT GetPassCount(uint*);
    HRESULT SetPassCount(uint);
    HRESULT GetCurrentPassCount(uint*);
    HRESULT GetMatchThreadId(uint*);
    HRESULT SetMatchThreadId(uint);
    HRESULT GetCommand(PSTR, uint, uint*);
    HRESULT SetCommand(const(char)*);
    HRESULT GetOffsetExpression(PSTR, uint, uint*);
    HRESULT SetOffsetExpression(const(char)*);
    HRESULT GetParameters(DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT GetCommandWide(PWSTR, uint, uint*);
    HRESULT SetCommandWide(const(wchar)*);
    HRESULT GetOffsetExpressionWide(PWSTR, uint, uint*);
    HRESULT SetOffsetExpressionWide(const(wchar)*);
}
enum IID_IDebugBreakpoint3 = GUID(0x38f5c249, 0xb448, 0x43bb, [0x98, 0x35, 0x57, 0x9d, 0x4e, 0xc0, 0x22, 0x49]);
interface IDebugBreakpoint3 : IUnknown
{
    HRESULT GetId(uint*);
    HRESULT GetType(uint*, uint*);
    HRESULT GetAdder(IDebugClient*);
    HRESULT GetFlags(uint*);
    HRESULT AddFlags(uint);
    HRESULT RemoveFlags(uint);
    HRESULT SetFlags(uint);
    HRESULT GetOffset(ulong*);
    HRESULT SetOffset(ulong);
    HRESULT GetDataParameters(uint*, uint*);
    HRESULT SetDataParameters(uint, uint);
    HRESULT GetPassCount(uint*);
    HRESULT SetPassCount(uint);
    HRESULT GetCurrentPassCount(uint*);
    HRESULT GetMatchThreadId(uint*);
    HRESULT SetMatchThreadId(uint);
    HRESULT GetCommand(PSTR, uint, uint*);
    HRESULT SetCommand(const(char)*);
    HRESULT GetOffsetExpression(PSTR, uint, uint*);
    HRESULT SetOffsetExpression(const(char)*);
    HRESULT GetParameters(DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT GetCommandWide(PWSTR, uint, uint*);
    HRESULT SetCommandWide(const(wchar)*);
    HRESULT GetOffsetExpressionWide(PWSTR, uint, uint*);
    HRESULT SetOffsetExpressionWide(const(wchar)*);
    HRESULT GetGuid(GUID*);
}
struct DEBUG_CREATE_PROCESS_OPTIONS
{
    uint CreateFlags;
    uint EngCreateFlags;
    uint VerifierFlags;
    uint Reserved;
}
struct DEBUG_CLIENT_CONTEXT
{
    uint cbSize;
    uint eClient;
}
enum IID_IDebugClient = GUID(0x27fe5639, 0x8407, 0x4f47, [0x83, 0x64, 0xee, 0x11, 0x8f, 0xb0, 0x8a, 0xc8]);
interface IDebugClient : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
}
enum IID_IDebugClient2 = GUID(0xedbed635, 0x372e, 0x4dab, [0xbb, 0xfe, 0xed, 0xd, 0x2f, 0x63, 0xbe, 0x81]);
interface IDebugClient2 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
}
enum IID_IDebugClient3 = GUID(0xdd492d7f, 0x71b8, 0x4ad6, [0xa8, 0xdc, 0x1c, 0x88, 0x74, 0x79, 0xff, 0x91]);
interface IDebugClient3 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
    HRESULT GetRunningProcessSystemIdByExecutableNameWide(ulong, const(wchar)*, uint, uint*);
    HRESULT GetRunningProcessDescriptionWide(ulong, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT CreateProcessWide(ulong, PWSTR, uint);
    HRESULT CreateProcessAndAttachWide(ulong, PWSTR, uint, uint, uint);
}
enum IID_IDebugClient4 = GUID(0xca83c3de, 0x5089, 0x4cf8, [0x93, 0xc8, 0xd8, 0x92, 0x38, 0x7f, 0x2a, 0x5e]);
interface IDebugClient4 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
    HRESULT GetRunningProcessSystemIdByExecutableNameWide(ulong, const(wchar)*, uint, uint*);
    HRESULT GetRunningProcessDescriptionWide(ulong, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT CreateProcessWide(ulong, PWSTR, uint);
    HRESULT CreateProcessAndAttachWide(ulong, PWSTR, uint, uint, uint);
    HRESULT OpenDumpFileWide(const(wchar)*, ulong);
    HRESULT WriteDumpFileWide(const(wchar)*, ulong, uint, uint, const(wchar)*);
    HRESULT AddDumpInformationFileWide(const(wchar)*, ulong, uint);
    HRESULT GetNumberDumpFiles(uint*);
    HRESULT GetDumpFile(uint, PSTR, uint, uint*, ulong*, uint*);
    HRESULT GetDumpFileWide(uint, PWSTR, uint, uint*, ulong*, uint*);
}
enum IID_IDebugClient5 = GUID(0xe3acb9d7, 0x7ec2, 0x4f0c, [0xa0, 0xda, 0xe8, 0x1e, 0xc, 0xbb, 0xe6, 0x28]);
interface IDebugClient5 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
    HRESULT GetRunningProcessSystemIdByExecutableNameWide(ulong, const(wchar)*, uint, uint*);
    HRESULT GetRunningProcessDescriptionWide(ulong, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT CreateProcessWide(ulong, PWSTR, uint);
    HRESULT CreateProcessAndAttachWide(ulong, PWSTR, uint, uint, uint);
    HRESULT OpenDumpFileWide(const(wchar)*, ulong);
    HRESULT WriteDumpFileWide(const(wchar)*, ulong, uint, uint, const(wchar)*);
    HRESULT AddDumpInformationFileWide(const(wchar)*, ulong, uint);
    HRESULT GetNumberDumpFiles(uint*);
    HRESULT GetDumpFile(uint, PSTR, uint, uint*, ulong*, uint*);
    HRESULT GetDumpFileWide(uint, PWSTR, uint, uint*, ulong*, uint*);
    HRESULT AttachKernelWide(uint, const(wchar)*);
    HRESULT GetKernelConnectionOptionsWide(PWSTR, uint, uint*);
    HRESULT SetKernelConnectionOptionsWide(const(wchar)*);
    HRESULT StartProcessServerWide(uint, const(wchar)*, void*);
    HRESULT ConnectProcessServerWide(const(wchar)*, ulong*);
    HRESULT StartServerWide(const(wchar)*);
    HRESULT OutputServersWide(uint, const(wchar)*, uint);
    HRESULT GetOutputCallbacksWide(IDebugOutputCallbacksWide*);
    HRESULT SetOutputCallbacksWide(IDebugOutputCallbacksWide);
    HRESULT GetOutputLinePrefixWide(PWSTR, uint, uint*);
    HRESULT SetOutputLinePrefixWide(const(wchar)*);
    HRESULT GetIdentityWide(PWSTR, uint, uint*);
    HRESULT OutputIdentityWide(uint, uint, const(wchar)*);
    HRESULT GetEventCallbacksWide(IDebugEventCallbacksWide*);
    HRESULT SetEventCallbacksWide(IDebugEventCallbacksWide);
    HRESULT CreateProcess2(ulong, PSTR, void*, uint, const(char)*, const(char)*);
    HRESULT CreateProcess2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*);
    HRESULT CreateProcessAndAttach2(ulong, PSTR, void*, uint, const(char)*, const(char)*, uint, uint);
    HRESULT CreateProcessAndAttach2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT PushOutputLinePrefix(const(char)*, ulong*);
    HRESULT PushOutputLinePrefixWide(const(wchar)*, ulong*);
    HRESULT PopOutputLinePrefix(ulong);
    HRESULT GetNumberInputCallbacks(uint*);
    HRESULT GetNumberOutputCallbacks(uint*);
    HRESULT GetNumberEventCallbacks(uint, uint*);
    HRESULT GetQuitLockString(PSTR, uint, uint*);
    HRESULT SetQuitLockString(const(char)*);
    HRESULT GetQuitLockStringWide(PWSTR, uint, uint*);
    HRESULT SetQuitLockStringWide(const(wchar)*);
}
enum IID_IDebugClient6 = GUID(0xfd28b4c5, 0xc498, 0x4686, [0xa2, 0x8e, 0x62, 0xca, 0xd2, 0x15, 0x4e, 0xb3]);
interface IDebugClient6 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
    HRESULT GetRunningProcessSystemIdByExecutableNameWide(ulong, const(wchar)*, uint, uint*);
    HRESULT GetRunningProcessDescriptionWide(ulong, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT CreateProcessWide(ulong, PWSTR, uint);
    HRESULT CreateProcessAndAttachWide(ulong, PWSTR, uint, uint, uint);
    HRESULT OpenDumpFileWide(const(wchar)*, ulong);
    HRESULT WriteDumpFileWide(const(wchar)*, ulong, uint, uint, const(wchar)*);
    HRESULT AddDumpInformationFileWide(const(wchar)*, ulong, uint);
    HRESULT GetNumberDumpFiles(uint*);
    HRESULT GetDumpFile(uint, PSTR, uint, uint*, ulong*, uint*);
    HRESULT GetDumpFileWide(uint, PWSTR, uint, uint*, ulong*, uint*);
    HRESULT AttachKernelWide(uint, const(wchar)*);
    HRESULT GetKernelConnectionOptionsWide(PWSTR, uint, uint*);
    HRESULT SetKernelConnectionOptionsWide(const(wchar)*);
    HRESULT StartProcessServerWide(uint, const(wchar)*, void*);
    HRESULT ConnectProcessServerWide(const(wchar)*, ulong*);
    HRESULT StartServerWide(const(wchar)*);
    HRESULT OutputServersWide(uint, const(wchar)*, uint);
    HRESULT GetOutputCallbacksWide(IDebugOutputCallbacksWide*);
    HRESULT SetOutputCallbacksWide(IDebugOutputCallbacksWide);
    HRESULT GetOutputLinePrefixWide(PWSTR, uint, uint*);
    HRESULT SetOutputLinePrefixWide(const(wchar)*);
    HRESULT GetIdentityWide(PWSTR, uint, uint*);
    HRESULT OutputIdentityWide(uint, uint, const(wchar)*);
    HRESULT GetEventCallbacksWide(IDebugEventCallbacksWide*);
    HRESULT SetEventCallbacksWide(IDebugEventCallbacksWide);
    HRESULT CreateProcess2(ulong, PSTR, void*, uint, const(char)*, const(char)*);
    HRESULT CreateProcess2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*);
    HRESULT CreateProcessAndAttach2(ulong, PSTR, void*, uint, const(char)*, const(char)*, uint, uint);
    HRESULT CreateProcessAndAttach2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT PushOutputLinePrefix(const(char)*, ulong*);
    HRESULT PushOutputLinePrefixWide(const(wchar)*, ulong*);
    HRESULT PopOutputLinePrefix(ulong);
    HRESULT GetNumberInputCallbacks(uint*);
    HRESULT GetNumberOutputCallbacks(uint*);
    HRESULT GetNumberEventCallbacks(uint, uint*);
    HRESULT GetQuitLockString(PSTR, uint, uint*);
    HRESULT SetQuitLockString(const(char)*);
    HRESULT GetQuitLockStringWide(PWSTR, uint, uint*);
    HRESULT SetQuitLockStringWide(const(wchar)*);
    HRESULT SetEventContextCallbacks(IDebugEventContextCallbacks);
}
enum IID_IDebugClient7 = GUID(0x13586be3, 0x542e, 0x481e, [0xb1, 0xf2, 0x84, 0x97, 0xba, 0x74, 0xf9, 0xa9]);
interface IDebugClient7 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
    HRESULT GetRunningProcessSystemIdByExecutableNameWide(ulong, const(wchar)*, uint, uint*);
    HRESULT GetRunningProcessDescriptionWide(ulong, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT CreateProcessWide(ulong, PWSTR, uint);
    HRESULT CreateProcessAndAttachWide(ulong, PWSTR, uint, uint, uint);
    HRESULT OpenDumpFileWide(const(wchar)*, ulong);
    HRESULT WriteDumpFileWide(const(wchar)*, ulong, uint, uint, const(wchar)*);
    HRESULT AddDumpInformationFileWide(const(wchar)*, ulong, uint);
    HRESULT GetNumberDumpFiles(uint*);
    HRESULT GetDumpFile(uint, PSTR, uint, uint*, ulong*, uint*);
    HRESULT GetDumpFileWide(uint, PWSTR, uint, uint*, ulong*, uint*);
    HRESULT AttachKernelWide(uint, const(wchar)*);
    HRESULT GetKernelConnectionOptionsWide(PWSTR, uint, uint*);
    HRESULT SetKernelConnectionOptionsWide(const(wchar)*);
    HRESULT StartProcessServerWide(uint, const(wchar)*, void*);
    HRESULT ConnectProcessServerWide(const(wchar)*, ulong*);
    HRESULT StartServerWide(const(wchar)*);
    HRESULT OutputServersWide(uint, const(wchar)*, uint);
    HRESULT GetOutputCallbacksWide(IDebugOutputCallbacksWide*);
    HRESULT SetOutputCallbacksWide(IDebugOutputCallbacksWide);
    HRESULT GetOutputLinePrefixWide(PWSTR, uint, uint*);
    HRESULT SetOutputLinePrefixWide(const(wchar)*);
    HRESULT GetIdentityWide(PWSTR, uint, uint*);
    HRESULT OutputIdentityWide(uint, uint, const(wchar)*);
    HRESULT GetEventCallbacksWide(IDebugEventCallbacksWide*);
    HRESULT SetEventCallbacksWide(IDebugEventCallbacksWide);
    HRESULT CreateProcess2(ulong, PSTR, void*, uint, const(char)*, const(char)*);
    HRESULT CreateProcess2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*);
    HRESULT CreateProcessAndAttach2(ulong, PSTR, void*, uint, const(char)*, const(char)*, uint, uint);
    HRESULT CreateProcessAndAttach2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT PushOutputLinePrefix(const(char)*, ulong*);
    HRESULT PushOutputLinePrefixWide(const(wchar)*, ulong*);
    HRESULT PopOutputLinePrefix(ulong);
    HRESULT GetNumberInputCallbacks(uint*);
    HRESULT GetNumberOutputCallbacks(uint*);
    HRESULT GetNumberEventCallbacks(uint, uint*);
    HRESULT GetQuitLockString(PSTR, uint, uint*);
    HRESULT SetQuitLockString(const(char)*);
    HRESULT GetQuitLockStringWide(PWSTR, uint, uint*);
    HRESULT SetQuitLockStringWide(const(wchar)*);
    HRESULT SetEventContextCallbacks(IDebugEventContextCallbacks);
    HRESULT SetClientContext(void*, uint);
}
enum IID_IDebugClient8 = GUID(0xcec43add, 0x6375, 0x469e, [0x83, 0xd5, 0x41, 0x4e, 0x40, 0x33, 0xc1, 0x9a]);
interface IDebugClient8 : IUnknown
{
    HRESULT AttachKernel(uint, const(char)*);
    HRESULT GetKernelConnectionOptions(PSTR, uint, uint*);
    HRESULT SetKernelConnectionOptions(const(char)*);
    HRESULT StartProcessServer(uint, const(char)*, void*);
    HRESULT ConnectProcessServer(const(char)*, ulong*);
    HRESULT DisconnectProcessServer(ulong);
    HRESULT GetRunningProcessSystemIds(ulong, uint*, uint, uint*);
    HRESULT GetRunningProcessSystemIdByExecutableName(ulong, const(char)*, uint, uint*);
    HRESULT GetRunningProcessDescription(ulong, uint, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT AttachProcess(ulong, uint, uint);
    HRESULT CreateProcessA(ulong, PSTR, uint);
    HRESULT CreateProcessAndAttach(ulong, PSTR, uint, uint, uint);
    HRESULT GetProcessOptions(uint*);
    HRESULT AddProcessOptions(uint);
    HRESULT RemoveProcessOptions(uint);
    HRESULT SetProcessOptions(uint);
    HRESULT OpenDumpFile(const(char)*);
    HRESULT WriteDumpFile(const(char)*, uint);
    HRESULT ConnectSession(uint, uint);
    HRESULT StartServer(const(char)*);
    HRESULT OutputServers(uint, const(char)*, uint);
    HRESULT TerminateProcesses();
    HRESULT DetachProcesses();
    HRESULT EndSession(uint);
    HRESULT GetExitCode(uint*);
    HRESULT DispatchCallbacks(uint);
    HRESULT ExitDispatch(IDebugClient);
    HRESULT CreateClient(IDebugClient*);
    HRESULT GetInputCallbacks(IDebugInputCallbacks*);
    HRESULT SetInputCallbacks(IDebugInputCallbacks);
    HRESULT GetOutputCallbacks(IDebugOutputCallbacks*);
    HRESULT SetOutputCallbacks(IDebugOutputCallbacks);
    HRESULT GetOutputMask(uint*);
    HRESULT SetOutputMask(uint);
    HRESULT GetOtherOutputMask(IDebugClient, uint*);
    HRESULT SetOtherOutputMask(IDebugClient, uint);
    HRESULT GetOutputWidth(uint*);
    HRESULT SetOutputWidth(uint);
    HRESULT GetOutputLinePrefix(PSTR, uint, uint*);
    HRESULT SetOutputLinePrefix(const(char)*);
    HRESULT GetIdentity(PSTR, uint, uint*);
    HRESULT OutputIdentity(uint, uint, const(char)*);
    HRESULT GetEventCallbacks(IDebugEventCallbacks*);
    HRESULT SetEventCallbacks(IDebugEventCallbacks);
    HRESULT FlushCallbacks();
    HRESULT WriteDumpFile2(const(char)*, uint, uint, const(char)*);
    HRESULT AddDumpInformationFile(const(char)*, uint);
    HRESULT EndProcessServer(ulong);
    HRESULT WaitForProcessServerEnd(uint);
    HRESULT IsKernelDebuggerEnabled();
    HRESULT TerminateCurrentProcess();
    HRESULT DetachCurrentProcess();
    HRESULT AbandonCurrentProcess();
    HRESULT GetRunningProcessSystemIdByExecutableNameWide(ulong, const(wchar)*, uint, uint*);
    HRESULT GetRunningProcessDescriptionWide(ulong, uint, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT CreateProcessWide(ulong, PWSTR, uint);
    HRESULT CreateProcessAndAttachWide(ulong, PWSTR, uint, uint, uint);
    HRESULT OpenDumpFileWide(const(wchar)*, ulong);
    HRESULT WriteDumpFileWide(const(wchar)*, ulong, uint, uint, const(wchar)*);
    HRESULT AddDumpInformationFileWide(const(wchar)*, ulong, uint);
    HRESULT GetNumberDumpFiles(uint*);
    HRESULT GetDumpFile(uint, PSTR, uint, uint*, ulong*, uint*);
    HRESULT GetDumpFileWide(uint, PWSTR, uint, uint*, ulong*, uint*);
    HRESULT AttachKernelWide(uint, const(wchar)*);
    HRESULT GetKernelConnectionOptionsWide(PWSTR, uint, uint*);
    HRESULT SetKernelConnectionOptionsWide(const(wchar)*);
    HRESULT StartProcessServerWide(uint, const(wchar)*, void*);
    HRESULT ConnectProcessServerWide(const(wchar)*, ulong*);
    HRESULT StartServerWide(const(wchar)*);
    HRESULT OutputServersWide(uint, const(wchar)*, uint);
    HRESULT GetOutputCallbacksWide(IDebugOutputCallbacksWide*);
    HRESULT SetOutputCallbacksWide(IDebugOutputCallbacksWide);
    HRESULT GetOutputLinePrefixWide(PWSTR, uint, uint*);
    HRESULT SetOutputLinePrefixWide(const(wchar)*);
    HRESULT GetIdentityWide(PWSTR, uint, uint*);
    HRESULT OutputIdentityWide(uint, uint, const(wchar)*);
    HRESULT GetEventCallbacksWide(IDebugEventCallbacksWide*);
    HRESULT SetEventCallbacksWide(IDebugEventCallbacksWide);
    HRESULT CreateProcess2(ulong, PSTR, void*, uint, const(char)*, const(char)*);
    HRESULT CreateProcess2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*);
    HRESULT CreateProcessAndAttach2(ulong, PSTR, void*, uint, const(char)*, const(char)*, uint, uint);
    HRESULT CreateProcessAndAttach2Wide(ulong, PWSTR, void*, uint, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT PushOutputLinePrefix(const(char)*, ulong*);
    HRESULT PushOutputLinePrefixWide(const(wchar)*, ulong*);
    HRESULT PopOutputLinePrefix(ulong);
    HRESULT GetNumberInputCallbacks(uint*);
    HRESULT GetNumberOutputCallbacks(uint*);
    HRESULT GetNumberEventCallbacks(uint, uint*);
    HRESULT GetQuitLockString(PSTR, uint, uint*);
    HRESULT SetQuitLockString(const(char)*);
    HRESULT GetQuitLockStringWide(PWSTR, uint, uint*);
    HRESULT SetQuitLockStringWide(const(wchar)*);
    HRESULT SetEventContextCallbacks(IDebugEventContextCallbacks);
    HRESULT SetClientContext(void*, uint);
    HRESULT OpenDumpFileWide2(const(wchar)*, ulong, uint);
}
enum IID_IDebugPlmClient = GUID(0xa02b66c4, 0xaea3, 0x4234, [0xa9, 0xf7, 0xfe, 0x4c, 0x38, 0x3d, 0x4e, 0x29]);
interface IDebugPlmClient : IUnknown
{
    HRESULT LaunchPlmPackageForDebugWide(ulong, uint, const(wchar)*, const(wchar)*, const(wchar)*, uint*, uint*);
}
enum IID_IDebugPlmClient2 = GUID(0x597c980d, 0xe7bd, 0x4309, [0x96, 0x2c, 0x9d, 0x9b, 0x69, 0xa7, 0x37, 0x2c]);
interface IDebugPlmClient2 : IUnknown
{
    HRESULT LaunchPlmPackageForDebugWide(ulong, uint, const(wchar)*, const(wchar)*, const(wchar)*, uint*, uint*);
    HRESULT LaunchPlmBgTaskForDebugWide(ulong, uint, const(wchar)*, const(wchar)*, uint*, uint*);
}
enum IID_IDebugPlmClient3 = GUID(0xd4a5dbd1, 0xca02, 0x4d90, [0x85, 0x6a, 0x2a, 0x92, 0xbf, 0xd0, 0xf2, 0xf]);
interface IDebugPlmClient3 : IUnknown
{
    HRESULT LaunchPlmPackageForDebugWide(ulong, uint, const(wchar)*, const(wchar)*, const(wchar)*, uint*, uint*);
    HRESULT LaunchPlmBgTaskForDebugWide(ulong, uint, const(wchar)*, const(wchar)*, uint*, uint*);
    HRESULT QueryPlmPackageWide(ulong, const(wchar)*, IDebugOutputStream);
    HRESULT QueryPlmPackageList(ulong, IDebugOutputStream);
    HRESULT EnablePlmPackageDebugWide(ulong, const(wchar)*);
    HRESULT DisablePlmPackageDebugWide(ulong, const(wchar)*);
    HRESULT SuspendPlmPackageWide(ulong, const(wchar)*);
    HRESULT ResumePlmPackageWide(ulong, const(wchar)*);
    HRESULT TerminatePlmPackageWide(ulong, const(wchar)*);
    HRESULT LaunchAndDebugPlmAppWide(ulong, const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT ActivateAndDebugPlmBgTaskWide(ulong, const(wchar)*, const(wchar)*);
}
enum IID_IDebugOutputStream = GUID(0x7782d8f2, 0x2b85, 0x4059, [0xab, 0x88, 0x28, 0xce, 0xdd, 0xca, 0x1c, 0x80]);
interface IDebugOutputStream : IUnknown
{
    HRESULT Write(const(wchar)*);
}
struct DEBUG_STACK_FRAME
{
    ulong InstructionOffset;
    ulong ReturnOffset;
    ulong FrameOffset;
    ulong StackOffset;
    ulong FuncTableEntry;
    ulong[4] Params;
    ulong[6] Reserved;
    BOOL Virtual;
    uint FrameNumber;
}
struct DEBUG_STACK_FRAME_EX
{
    ulong InstructionOffset;
    ulong ReturnOffset;
    ulong FrameOffset;
    ulong StackOffset;
    ulong FuncTableEntry;
    ulong[4] Params;
    ulong[6] Reserved;
    BOOL Virtual;
    uint FrameNumber;
    uint InlineFrameContext;
    uint Reserved1;
}
union INLINE_FRAME_CONTEXT
{
    uint ContextValue;
    struct
    {
        ubyte FrameId;
        ubyte FrameType;
        ushort FrameSignature;
    }
}
struct STACK_SRC_INFO
{
    const(wchar)* ImagePath;
    const(wchar)* ModuleName;
    const(wchar)* Function;
    uint Displacement;
    uint Row;
    uint Column;
}
struct STACK_SYM_FRAME_INFO
{
    DEBUG_STACK_FRAME_EX StackFrameEx;
    STACK_SRC_INFO SrcInfo;
}
struct DEBUG_SPECIFIC_FILTER_PARAMETERS
{
    uint ExecutionOption;
    uint ContinueOption;
    uint TextSize;
    uint CommandSize;
    uint ArgumentSize;
}
struct DEBUG_EXCEPTION_FILTER_PARAMETERS
{
    uint ExecutionOption;
    uint ContinueOption;
    uint TextSize;
    uint CommandSize;
    uint SecondCommandSize;
    uint ExceptionCode;
}
struct DEBUG_LAST_EVENT_INFO_BREAKPOINT
{
    uint Id;
}
struct DEBUG_LAST_EVENT_INFO_EXCEPTION
{
    EXCEPTION_RECORD64 ExceptionRecord;
    uint FirstChance;
}
struct DEBUG_LAST_EVENT_INFO_EXIT_THREAD
{
    uint ExitCode;
}
struct DEBUG_LAST_EVENT_INFO_EXIT_PROCESS
{
    uint ExitCode;
}
struct DEBUG_LAST_EVENT_INFO_LOAD_MODULE
{
    ulong Base;
}
struct DEBUG_LAST_EVENT_INFO_UNLOAD_MODULE
{
    ulong Base;
}
struct DEBUG_LAST_EVENT_INFO_SYSTEM_ERROR
{
    uint Error;
    uint Level;
}
struct DEBUG_LAST_EVENT_INFO_SERVICE_EXCEPTION
{
    uint Kind;
    uint DataSize;
    ulong Address;
}
struct DEBUG_VALUE
{
    union
    {
        ubyte I8;
        ushort I16;
        uint I32;
        struct
        {
            ulong I64;
            BOOL Nat;
        }
        float F32;
        double F64;
        ubyte[10] F80Bytes;
        ubyte[11] F82Bytes;
        ubyte[16] F128Bytes;
        ubyte[16] VI8;
        ushort[8] VI16;
        uint[4] VI32;
        ulong[2] VI64;
        float[4] VF32;
        double[2] VF64;
        struct _I64Parts32_e__Struct
        {
            uint LowPart;
            uint HighPart;
        }
        struct _F128Parts64_e__Struct
        {
            ulong LowPart;
            long HighPart;
        }
        ubyte[24] RawBytes;
    }
    uint TailOfRawBytes;
    uint Type;
}
enum IID_IDebugControl = GUID(0x5182e668, 0x105e, 0x416e, [0xad, 0x92, 0x24, 0xef, 0x80, 0x4, 0x24, 0xba]);
interface IDebugControl : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
}
enum IID_IDebugControl2 = GUID(0xd4366723, 0x44df, 0x4bed, [0x8c, 0x7e, 0x4c, 0x5, 0x42, 0x4f, 0x45, 0x88]);
interface IDebugControl2 : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetCurrentTimeDate(uint*);
    HRESULT GetCurrentSystemUpTime(uint*);
    HRESULT GetDumpFormatFlags(uint*);
    HRESULT GetNumberTextReplacements(uint*);
    HRESULT GetTextReplacement(const(char)*, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT SetTextReplacement(const(char)*, const(char)*);
    HRESULT RemoveTextReplacements();
    HRESULT OutputTextReplacements(uint, uint);
}
enum IID_IDebugControl3 = GUID(0x7df74a86, 0xb03f, 0x407f, [0x90, 0xab, 0xa2, 0xd, 0xad, 0xce, 0xad, 0x8]);
interface IDebugControl3 : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetCurrentTimeDate(uint*);
    HRESULT GetCurrentSystemUpTime(uint*);
    HRESULT GetDumpFormatFlags(uint*);
    HRESULT GetNumberTextReplacements(uint*);
    HRESULT GetTextReplacement(const(char)*, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT SetTextReplacement(const(char)*, const(char)*);
    HRESULT RemoveTextReplacements();
    HRESULT OutputTextReplacements(uint, uint);
    HRESULT GetAssemblyOptions(uint*);
    HRESULT AddAssemblyOptions(uint);
    HRESULT RemoveAssemblyOptions(uint);
    HRESULT SetAssemblyOptions(uint);
    HRESULT GetExpressionSyntax(uint*);
    HRESULT SetExpressionSyntax(uint);
    HRESULT SetExpressionSyntaxByName(const(char)*);
    HRESULT GetNumberExpressionSyntaxes(uint*);
    HRESULT GetExpressionSyntaxNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetNumberEvents(uint*);
    HRESULT GetEventIndexDescription(uint, uint, PSTR, uint, uint*);
    HRESULT GetCurrentEventIndex(uint*);
    HRESULT SetNextEventIndex(uint, uint, uint*);
}
enum IID_IDebugControl4 = GUID(0x94e60ce9, 0x9b41, 0x4b19, [0x9f, 0xc0, 0x6d, 0x9e, 0xb3, 0x52, 0x72, 0xb3]);
interface IDebugControl4 : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetCurrentTimeDate(uint*);
    HRESULT GetCurrentSystemUpTime(uint*);
    HRESULT GetDumpFormatFlags(uint*);
    HRESULT GetNumberTextReplacements(uint*);
    HRESULT GetTextReplacement(const(char)*, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT SetTextReplacement(const(char)*, const(char)*);
    HRESULT RemoveTextReplacements();
    HRESULT OutputTextReplacements(uint, uint);
    HRESULT GetAssemblyOptions(uint*);
    HRESULT AddAssemblyOptions(uint);
    HRESULT RemoveAssemblyOptions(uint);
    HRESULT SetAssemblyOptions(uint);
    HRESULT GetExpressionSyntax(uint*);
    HRESULT SetExpressionSyntax(uint);
    HRESULT SetExpressionSyntaxByName(const(char)*);
    HRESULT GetNumberExpressionSyntaxes(uint*);
    HRESULT GetExpressionSyntaxNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetNumberEvents(uint*);
    HRESULT GetEventIndexDescription(uint, uint, PSTR, uint, uint*);
    HRESULT GetCurrentEventIndex(uint*);
    HRESULT SetNextEventIndex(uint, uint, uint*);
    HRESULT GetLogFileWide(PWSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFileWide(const(wchar)*, BOOL);
    HRESULT InputWide(PWSTR, uint, uint*);
    HRESULT ReturnInputWide(const(wchar)*);
    HRESULT OutputWide(uint, const(wchar)*);
    HRESULT OutputVaListWide(uint, const(wchar)*, byte*);
    HRESULT ControlledOutputWide(uint, uint, const(wchar)*);
    HRESULT ControlledOutputVaListWide(uint, uint, const(wchar)*, byte*);
    HRESULT OutputPromptWide(uint, const(wchar)*);
    HRESULT OutputPromptVaListWide(uint, const(wchar)*, byte*);
    HRESULT GetPromptTextWide(PWSTR, uint, uint*);
    HRESULT AssembleWide(ulong, const(wchar)*, ulong*);
    HRESULT DisassembleWide(ulong, uint, PWSTR, uint, uint*, ulong*);
    HRESULT GetProcessorTypeNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextMacroWide(uint, PWSTR, uint, uint*);
    HRESULT SetTextMacroWide(uint, const(wchar)*);
    HRESULT EvaluateWide(const(wchar)*, uint, DEBUG_VALUE*, uint*);
    HRESULT ExecuteWide(uint, const(wchar)*, uint);
    HRESULT ExecuteCommandFileWide(uint, const(wchar)*, uint);
    HRESULT GetBreakpointByIndex2(uint, IDebugBreakpoint2*);
    HRESULT GetBreakpointById2(uint, IDebugBreakpoint2*);
    HRESULT AddBreakpoint2(uint, uint, IDebugBreakpoint2*);
    HRESULT RemoveBreakpoint2(IDebugBreakpoint2);
    HRESULT AddExtensionWide(const(wchar)*, uint, ulong*);
    HRESULT GetExtensionByPathWide(const(wchar)*, ulong*);
    HRESULT CallExtensionWide(ulong, const(wchar)*, const(wchar)*);
    HRESULT GetExtensionFunctionWide(ulong, const(wchar)*, FARPROC*);
    HRESULT GetEventFilterTextWide(uint, PWSTR, uint, uint*);
    HRESULT GetEventFilterCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetEventFilterCommandWide(uint, const(wchar)*);
    HRESULT GetSpecificFilterArgumentWide(uint, PWSTR, uint, uint*);
    HRESULT SetSpecificFilterArgumentWide(uint, const(wchar)*);
    HRESULT GetExceptionFilterSecondCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommandWide(uint, const(wchar)*);
    HRESULT GetLastEventInformationWide(uint*, uint*, uint*, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextReplacementWide(const(wchar)*, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT SetTextReplacementWide(const(wchar)*, const(wchar)*);
    HRESULT SetExpressionSyntaxByNameWide(const(wchar)*);
    HRESULT GetExpressionSyntaxNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetEventIndexDescriptionWide(uint, uint, PWSTR, uint, uint*);
    HRESULT GetLogFile2(PSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2(const(char)*, uint);
    HRESULT GetLogFile2Wide(PWSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2Wide(const(wchar)*, uint);
    HRESULT GetSystemVersionValues(uint*, uint*, uint*, uint*, uint*);
    HRESULT GetSystemVersionString(uint, PSTR, uint, uint*);
    HRESULT GetSystemVersionStringWide(uint, PWSTR, uint, uint*);
    HRESULT GetContextStackTrace(void*, uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTrace(uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint);
    HRESULT GetStoredEventInformation(uint*, uint*, uint*, void*, uint, uint*, void*, uint, uint*);
    HRESULT GetManagedStatus(uint*, uint, PSTR, uint, uint*);
    HRESULT GetManagedStatusWide(uint*, uint, PWSTR, uint, uint*);
    HRESULT ResetManagedStatus(uint);
}
enum IID_IDebugControl5 = GUID(0xb2ffe162, 0x2412, 0x429f, [0x8d, 0x1d, 0x5b, 0xf6, 0xdd, 0x82, 0x46, 0x96]);
interface IDebugControl5 : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetCurrentTimeDate(uint*);
    HRESULT GetCurrentSystemUpTime(uint*);
    HRESULT GetDumpFormatFlags(uint*);
    HRESULT GetNumberTextReplacements(uint*);
    HRESULT GetTextReplacement(const(char)*, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT SetTextReplacement(const(char)*, const(char)*);
    HRESULT RemoveTextReplacements();
    HRESULT OutputTextReplacements(uint, uint);
    HRESULT GetAssemblyOptions(uint*);
    HRESULT AddAssemblyOptions(uint);
    HRESULT RemoveAssemblyOptions(uint);
    HRESULT SetAssemblyOptions(uint);
    HRESULT GetExpressionSyntax(uint*);
    HRESULT SetExpressionSyntax(uint);
    HRESULT SetExpressionSyntaxByName(const(char)*);
    HRESULT GetNumberExpressionSyntaxes(uint*);
    HRESULT GetExpressionSyntaxNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetNumberEvents(uint*);
    HRESULT GetEventIndexDescription(uint, uint, PSTR, uint, uint*);
    HRESULT GetCurrentEventIndex(uint*);
    HRESULT SetNextEventIndex(uint, uint, uint*);
    HRESULT GetLogFileWide(PWSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFileWide(const(wchar)*, BOOL);
    HRESULT InputWide(PWSTR, uint, uint*);
    HRESULT ReturnInputWide(const(wchar)*);
    HRESULT OutputWide(uint, const(wchar)*);
    HRESULT OutputVaListWide(uint, const(wchar)*, byte*);
    HRESULT ControlledOutputWide(uint, uint, const(wchar)*);
    HRESULT ControlledOutputVaListWide(uint, uint, const(wchar)*, byte*);
    HRESULT OutputPromptWide(uint, const(wchar)*);
    HRESULT OutputPromptVaListWide(uint, const(wchar)*, byte*);
    HRESULT GetPromptTextWide(PWSTR, uint, uint*);
    HRESULT AssembleWide(ulong, const(wchar)*, ulong*);
    HRESULT DisassembleWide(ulong, uint, PWSTR, uint, uint*, ulong*);
    HRESULT GetProcessorTypeNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextMacroWide(uint, PWSTR, uint, uint*);
    HRESULT SetTextMacroWide(uint, const(wchar)*);
    HRESULT EvaluateWide(const(wchar)*, uint, DEBUG_VALUE*, uint*);
    HRESULT ExecuteWide(uint, const(wchar)*, uint);
    HRESULT ExecuteCommandFileWide(uint, const(wchar)*, uint);
    HRESULT GetBreakpointByIndex2(uint, IDebugBreakpoint2*);
    HRESULT GetBreakpointById2(uint, IDebugBreakpoint2*);
    HRESULT AddBreakpoint2(uint, uint, IDebugBreakpoint2*);
    HRESULT RemoveBreakpoint2(IDebugBreakpoint2);
    HRESULT AddExtensionWide(const(wchar)*, uint, ulong*);
    HRESULT GetExtensionByPathWide(const(wchar)*, ulong*);
    HRESULT CallExtensionWide(ulong, const(wchar)*, const(wchar)*);
    HRESULT GetExtensionFunctionWide(ulong, const(wchar)*, FARPROC*);
    HRESULT GetEventFilterTextWide(uint, PWSTR, uint, uint*);
    HRESULT GetEventFilterCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetEventFilterCommandWide(uint, const(wchar)*);
    HRESULT GetSpecificFilterArgumentWide(uint, PWSTR, uint, uint*);
    HRESULT SetSpecificFilterArgumentWide(uint, const(wchar)*);
    HRESULT GetExceptionFilterSecondCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommandWide(uint, const(wchar)*);
    HRESULT GetLastEventInformationWide(uint*, uint*, uint*, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextReplacementWide(const(wchar)*, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT SetTextReplacementWide(const(wchar)*, const(wchar)*);
    HRESULT SetExpressionSyntaxByNameWide(const(wchar)*);
    HRESULT GetExpressionSyntaxNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetEventIndexDescriptionWide(uint, uint, PWSTR, uint, uint*);
    HRESULT GetLogFile2(PSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2(const(char)*, uint);
    HRESULT GetLogFile2Wide(PWSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2Wide(const(wchar)*, uint);
    HRESULT GetSystemVersionValues(uint*, uint*, uint*, uint*, uint*);
    HRESULT GetSystemVersionString(uint, PSTR, uint, uint*);
    HRESULT GetSystemVersionStringWide(uint, PWSTR, uint, uint*);
    HRESULT GetContextStackTrace(void*, uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTrace(uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint);
    HRESULT GetStoredEventInformation(uint*, uint*, uint*, void*, uint, uint*, void*, uint, uint*);
    HRESULT GetManagedStatus(uint*, uint, PSTR, uint, uint*);
    HRESULT GetManagedStatusWide(uint*, uint, PWSTR, uint, uint*);
    HRESULT ResetManagedStatus(uint);
    HRESULT GetStackTraceEx(ulong, ulong, ulong, DEBUG_STACK_FRAME_EX*, uint, uint*);
    HRESULT OutputStackTraceEx(uint, DEBUG_STACK_FRAME_EX*, uint, uint);
    HRESULT GetContextStackTraceEx(void*, uint, DEBUG_STACK_FRAME_EX*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTraceEx(uint, DEBUG_STACK_FRAME_EX*, uint, void*, uint, uint, uint);
    HRESULT GetBreakpointByGuid(GUID*, IDebugBreakpoint3*);
}
enum IID_IDebugControl6 = GUID(0xbc0d583f, 0x126d, 0x43a1, [0x9c, 0xc4, 0xa8, 0x60, 0xab, 0x1d, 0x53, 0x7b]);
interface IDebugControl6 : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetCurrentTimeDate(uint*);
    HRESULT GetCurrentSystemUpTime(uint*);
    HRESULT GetDumpFormatFlags(uint*);
    HRESULT GetNumberTextReplacements(uint*);
    HRESULT GetTextReplacement(const(char)*, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT SetTextReplacement(const(char)*, const(char)*);
    HRESULT RemoveTextReplacements();
    HRESULT OutputTextReplacements(uint, uint);
    HRESULT GetAssemblyOptions(uint*);
    HRESULT AddAssemblyOptions(uint);
    HRESULT RemoveAssemblyOptions(uint);
    HRESULT SetAssemblyOptions(uint);
    HRESULT GetExpressionSyntax(uint*);
    HRESULT SetExpressionSyntax(uint);
    HRESULT SetExpressionSyntaxByName(const(char)*);
    HRESULT GetNumberExpressionSyntaxes(uint*);
    HRESULT GetExpressionSyntaxNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetNumberEvents(uint*);
    HRESULT GetEventIndexDescription(uint, uint, PSTR, uint, uint*);
    HRESULT GetCurrentEventIndex(uint*);
    HRESULT SetNextEventIndex(uint, uint, uint*);
    HRESULT GetLogFileWide(PWSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFileWide(const(wchar)*, BOOL);
    HRESULT InputWide(PWSTR, uint, uint*);
    HRESULT ReturnInputWide(const(wchar)*);
    HRESULT OutputWide(uint, const(wchar)*);
    HRESULT OutputVaListWide(uint, const(wchar)*, byte*);
    HRESULT ControlledOutputWide(uint, uint, const(wchar)*);
    HRESULT ControlledOutputVaListWide(uint, uint, const(wchar)*, byte*);
    HRESULT OutputPromptWide(uint, const(wchar)*);
    HRESULT OutputPromptVaListWide(uint, const(wchar)*, byte*);
    HRESULT GetPromptTextWide(PWSTR, uint, uint*);
    HRESULT AssembleWide(ulong, const(wchar)*, ulong*);
    HRESULT DisassembleWide(ulong, uint, PWSTR, uint, uint*, ulong*);
    HRESULT GetProcessorTypeNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextMacroWide(uint, PWSTR, uint, uint*);
    HRESULT SetTextMacroWide(uint, const(wchar)*);
    HRESULT EvaluateWide(const(wchar)*, uint, DEBUG_VALUE*, uint*);
    HRESULT ExecuteWide(uint, const(wchar)*, uint);
    HRESULT ExecuteCommandFileWide(uint, const(wchar)*, uint);
    HRESULT GetBreakpointByIndex2(uint, IDebugBreakpoint2*);
    HRESULT GetBreakpointById2(uint, IDebugBreakpoint2*);
    HRESULT AddBreakpoint2(uint, uint, IDebugBreakpoint2*);
    HRESULT RemoveBreakpoint2(IDebugBreakpoint2);
    HRESULT AddExtensionWide(const(wchar)*, uint, ulong*);
    HRESULT GetExtensionByPathWide(const(wchar)*, ulong*);
    HRESULT CallExtensionWide(ulong, const(wchar)*, const(wchar)*);
    HRESULT GetExtensionFunctionWide(ulong, const(wchar)*, FARPROC*);
    HRESULT GetEventFilterTextWide(uint, PWSTR, uint, uint*);
    HRESULT GetEventFilterCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetEventFilterCommandWide(uint, const(wchar)*);
    HRESULT GetSpecificFilterArgumentWide(uint, PWSTR, uint, uint*);
    HRESULT SetSpecificFilterArgumentWide(uint, const(wchar)*);
    HRESULT GetExceptionFilterSecondCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommandWide(uint, const(wchar)*);
    HRESULT GetLastEventInformationWide(uint*, uint*, uint*, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextReplacementWide(const(wchar)*, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT SetTextReplacementWide(const(wchar)*, const(wchar)*);
    HRESULT SetExpressionSyntaxByNameWide(const(wchar)*);
    HRESULT GetExpressionSyntaxNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetEventIndexDescriptionWide(uint, uint, PWSTR, uint, uint*);
    HRESULT GetLogFile2(PSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2(const(char)*, uint);
    HRESULT GetLogFile2Wide(PWSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2Wide(const(wchar)*, uint);
    HRESULT GetSystemVersionValues(uint*, uint*, uint*, uint*, uint*);
    HRESULT GetSystemVersionString(uint, PSTR, uint, uint*);
    HRESULT GetSystemVersionStringWide(uint, PWSTR, uint, uint*);
    HRESULT GetContextStackTrace(void*, uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTrace(uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint);
    HRESULT GetStoredEventInformation(uint*, uint*, uint*, void*, uint, uint*, void*, uint, uint*);
    HRESULT GetManagedStatus(uint*, uint, PSTR, uint, uint*);
    HRESULT GetManagedStatusWide(uint*, uint, PWSTR, uint, uint*);
    HRESULT ResetManagedStatus(uint);
    HRESULT GetStackTraceEx(ulong, ulong, ulong, DEBUG_STACK_FRAME_EX*, uint, uint*);
    HRESULT OutputStackTraceEx(uint, DEBUG_STACK_FRAME_EX*, uint, uint);
    HRESULT GetContextStackTraceEx(void*, uint, DEBUG_STACK_FRAME_EX*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTraceEx(uint, DEBUG_STACK_FRAME_EX*, uint, void*, uint, uint, uint);
    HRESULT GetBreakpointByGuid(GUID*, IDebugBreakpoint3*);
    HRESULT GetExecutionStatusEx(uint*);
    HRESULT GetSynchronizationStatus(uint*, uint*);
}
enum IID_IDebugControl7 = GUID(0xb86fb3b1, 0x80d4, 0x475b, [0xae, 0xa3, 0xcf, 0x6, 0x53, 0x9c, 0xf6, 0x3a]);
interface IDebugControl7 : IUnknown
{
    HRESULT GetInterrupt();
    HRESULT SetInterrupt(uint);
    HRESULT GetInterruptTimeout(uint*);
    HRESULT SetInterruptTimeout(uint);
    HRESULT GetLogFile(PSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFile(const(char)*, BOOL);
    HRESULT CloseLogFile();
    HRESULT GetLogMask(uint*);
    HRESULT SetLogMask(uint);
    HRESULT Input(PSTR, uint, uint*);
    HRESULT ReturnInput(const(char)*);
    HRESULT Output(uint, const(char)*);
    HRESULT OutputVaList(uint, const(char)*, byte*);
    HRESULT ControlledOutput(uint, uint, const(char)*);
    HRESULT ControlledOutputVaList(uint, uint, const(char)*, byte*);
    HRESULT OutputPrompt(uint, const(char)*);
    HRESULT OutputPromptVaList(uint, const(char)*, byte*);
    HRESULT GetPromptText(PSTR, uint, uint*);
    HRESULT OutputCurrentState(uint, uint);
    HRESULT OutputVersionInformation(uint);
    HRESULT GetNotifyEventHandle(ulong*);
    HRESULT SetNotifyEventHandle(ulong);
    HRESULT Assemble(ulong, const(char)*, ulong*);
    HRESULT Disassemble(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetDisassembleEffectiveOffset(ulong*);
    HRESULT OutputDisassembly(uint, ulong, uint, ulong*);
    HRESULT OutputDisassemblyLines(uint, uint, uint, ulong, uint, uint*, ulong*, ulong*, ulong*);
    HRESULT GetNearInstruction(ulong, int, ulong*);
    HRESULT GetStackTrace(ulong, ulong, ulong, DEBUG_STACK_FRAME*, uint, uint*);
    HRESULT GetReturnOffset(ulong*);
    HRESULT OutputStackTrace(uint, DEBUG_STACK_FRAME*, uint, uint);
    HRESULT GetDebuggeeType(uint*, uint*);
    HRESULT GetActualProcessorType(uint*);
    HRESULT GetExecutingProcessorType(uint*);
    HRESULT GetNumberPossibleExecutingProcessorTypes(uint*);
    HRESULT GetPossibleExecutingProcessorTypes(uint, uint, uint*);
    HRESULT GetNumberProcessors(uint*);
    HRESULT GetSystemVersion(uint*, uint*, uint*, PSTR, uint, uint*, uint*, PSTR, uint, uint*);
    HRESULT GetPageSize(uint*);
    HRESULT IsPointer64Bit();
    HRESULT ReadBugCheckData(uint*, ulong*, ulong*, ulong*, ulong*);
    HRESULT GetNumberSupportedProcessorTypes(uint*);
    HRESULT GetSupportedProcessorTypes(uint, uint, uint*);
    HRESULT GetProcessorTypeNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetEffectiveProcessorType(uint*);
    HRESULT SetEffectiveProcessorType(uint);
    HRESULT GetExecutionStatus(uint*);
    HRESULT SetExecutionStatus(uint);
    HRESULT GetCodeLevel(uint*);
    HRESULT SetCodeLevel(uint);
    HRESULT GetEngineOptions(uint*);
    HRESULT AddEngineOptions(uint);
    HRESULT RemoveEngineOptions(uint);
    HRESULT SetEngineOptions(uint);
    HRESULT GetSystemErrorControl(uint*, uint*);
    HRESULT SetSystemErrorControl(uint, uint);
    HRESULT GetTextMacro(uint, PSTR, uint, uint*);
    HRESULT SetTextMacro(uint, const(char)*);
    HRESULT GetRadix(uint*);
    HRESULT SetRadix(uint);
    HRESULT Evaluate(const(char)*, uint, DEBUG_VALUE*, uint*);
    HRESULT CoerceValue(DEBUG_VALUE*, uint, DEBUG_VALUE*);
    HRESULT CoerceValues(uint, DEBUG_VALUE*, uint*, DEBUG_VALUE*);
    HRESULT Execute(uint, const(char)*, uint);
    HRESULT ExecuteCommandFile(uint, const(char)*, uint);
    HRESULT GetNumberBreakpoints(uint*);
    HRESULT GetBreakpointByIndex(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointById(uint, IDebugBreakpoint*);
    HRESULT GetBreakpointParameters(uint, uint*, uint, DEBUG_BREAKPOINT_PARAMETERS*);
    HRESULT AddBreakpoint(uint, uint, IDebugBreakpoint*);
    HRESULT RemoveBreakpoint(IDebugBreakpoint);
    HRESULT AddExtension(const(char)*, uint, ulong*);
    HRESULT RemoveExtension(ulong);
    HRESULT GetExtensionByPath(const(char)*, ulong*);
    HRESULT CallExtension(ulong, const(char)*, const(char)*);
    HRESULT GetExtensionFunction(ulong, const(char)*, FARPROC*);
    HRESULT GetWindbgExtensionApis32(WINDBG_EXTENSION_APIS32*);
    HRESULT GetWindbgExtensionApis64(WINDBG_EXTENSION_APIS64*);
    HRESULT GetNumberEventFilters(uint*, uint*, uint*);
    HRESULT GetEventFilterText(uint, PSTR, uint, uint*);
    HRESULT GetEventFilterCommand(uint, PSTR, uint, uint*);
    HRESULT SetEventFilterCommand(uint, const(char)*);
    HRESULT GetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT SetSpecificFilterParameters(uint, uint, DEBUG_SPECIFIC_FILTER_PARAMETERS*);
    HRESULT GetSpecificFilterArgument(uint, PSTR, uint, uint*);
    HRESULT SetSpecificFilterArgument(uint, const(char)*);
    HRESULT GetExceptionFilterParameters(uint, uint*, uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT SetExceptionFilterParameters(uint, DEBUG_EXCEPTION_FILTER_PARAMETERS*);
    HRESULT GetExceptionFilterSecondCommand(uint, PSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommand(uint, const(char)*);
    HRESULT WaitForEvent(uint, uint);
    HRESULT GetLastEventInformation(uint*, uint*, uint*, void*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetCurrentTimeDate(uint*);
    HRESULT GetCurrentSystemUpTime(uint*);
    HRESULT GetDumpFormatFlags(uint*);
    HRESULT GetNumberTextReplacements(uint*);
    HRESULT GetTextReplacement(const(char)*, uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT SetTextReplacement(const(char)*, const(char)*);
    HRESULT RemoveTextReplacements();
    HRESULT OutputTextReplacements(uint, uint);
    HRESULT GetAssemblyOptions(uint*);
    HRESULT AddAssemblyOptions(uint);
    HRESULT RemoveAssemblyOptions(uint);
    HRESULT SetAssemblyOptions(uint);
    HRESULT GetExpressionSyntax(uint*);
    HRESULT SetExpressionSyntax(uint);
    HRESULT SetExpressionSyntaxByName(const(char)*);
    HRESULT GetNumberExpressionSyntaxes(uint*);
    HRESULT GetExpressionSyntaxNames(uint, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetNumberEvents(uint*);
    HRESULT GetEventIndexDescription(uint, uint, PSTR, uint, uint*);
    HRESULT GetCurrentEventIndex(uint*);
    HRESULT SetNextEventIndex(uint, uint, uint*);
    HRESULT GetLogFileWide(PWSTR, uint, uint*, BOOL*);
    HRESULT OpenLogFileWide(const(wchar)*, BOOL);
    HRESULT InputWide(PWSTR, uint, uint*);
    HRESULT ReturnInputWide(const(wchar)*);
    HRESULT OutputWide(uint, const(wchar)*);
    HRESULT OutputVaListWide(uint, const(wchar)*, byte*);
    HRESULT ControlledOutputWide(uint, uint, const(wchar)*);
    HRESULT ControlledOutputVaListWide(uint, uint, const(wchar)*, byte*);
    HRESULT OutputPromptWide(uint, const(wchar)*);
    HRESULT OutputPromptVaListWide(uint, const(wchar)*, byte*);
    HRESULT GetPromptTextWide(PWSTR, uint, uint*);
    HRESULT AssembleWide(ulong, const(wchar)*, ulong*);
    HRESULT DisassembleWide(ulong, uint, PWSTR, uint, uint*, ulong*);
    HRESULT GetProcessorTypeNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextMacroWide(uint, PWSTR, uint, uint*);
    HRESULT SetTextMacroWide(uint, const(wchar)*);
    HRESULT EvaluateWide(const(wchar)*, uint, DEBUG_VALUE*, uint*);
    HRESULT ExecuteWide(uint, const(wchar)*, uint);
    HRESULT ExecuteCommandFileWide(uint, const(wchar)*, uint);
    HRESULT GetBreakpointByIndex2(uint, IDebugBreakpoint2*);
    HRESULT GetBreakpointById2(uint, IDebugBreakpoint2*);
    HRESULT AddBreakpoint2(uint, uint, IDebugBreakpoint2*);
    HRESULT RemoveBreakpoint2(IDebugBreakpoint2);
    HRESULT AddExtensionWide(const(wchar)*, uint, ulong*);
    HRESULT GetExtensionByPathWide(const(wchar)*, ulong*);
    HRESULT CallExtensionWide(ulong, const(wchar)*, const(wchar)*);
    HRESULT GetExtensionFunctionWide(ulong, const(wchar)*, FARPROC*);
    HRESULT GetEventFilterTextWide(uint, PWSTR, uint, uint*);
    HRESULT GetEventFilterCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetEventFilterCommandWide(uint, const(wchar)*);
    HRESULT GetSpecificFilterArgumentWide(uint, PWSTR, uint, uint*);
    HRESULT SetSpecificFilterArgumentWide(uint, const(wchar)*);
    HRESULT GetExceptionFilterSecondCommandWide(uint, PWSTR, uint, uint*);
    HRESULT SetExceptionFilterSecondCommandWide(uint, const(wchar)*);
    HRESULT GetLastEventInformationWide(uint*, uint*, uint*, void*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetTextReplacementWide(const(wchar)*, uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT SetTextReplacementWide(const(wchar)*, const(wchar)*);
    HRESULT SetExpressionSyntaxByNameWide(const(wchar)*);
    HRESULT GetExpressionSyntaxNamesWide(uint, PWSTR, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetEventIndexDescriptionWide(uint, uint, PWSTR, uint, uint*);
    HRESULT GetLogFile2(PSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2(const(char)*, uint);
    HRESULT GetLogFile2Wide(PWSTR, uint, uint*, uint*);
    HRESULT OpenLogFile2Wide(const(wchar)*, uint);
    HRESULT GetSystemVersionValues(uint*, uint*, uint*, uint*, uint*);
    HRESULT GetSystemVersionString(uint, PSTR, uint, uint*);
    HRESULT GetSystemVersionStringWide(uint, PWSTR, uint, uint*);
    HRESULT GetContextStackTrace(void*, uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTrace(uint, DEBUG_STACK_FRAME*, uint, void*, uint, uint, uint);
    HRESULT GetStoredEventInformation(uint*, uint*, uint*, void*, uint, uint*, void*, uint, uint*);
    HRESULT GetManagedStatus(uint*, uint, PSTR, uint, uint*);
    HRESULT GetManagedStatusWide(uint*, uint, PWSTR, uint, uint*);
    HRESULT ResetManagedStatus(uint);
    HRESULT GetStackTraceEx(ulong, ulong, ulong, DEBUG_STACK_FRAME_EX*, uint, uint*);
    HRESULT OutputStackTraceEx(uint, DEBUG_STACK_FRAME_EX*, uint, uint);
    HRESULT GetContextStackTraceEx(void*, uint, DEBUG_STACK_FRAME_EX*, uint, void*, uint, uint, uint*);
    HRESULT OutputContextStackTraceEx(uint, DEBUG_STACK_FRAME_EX*, uint, void*, uint, uint, uint);
    HRESULT GetBreakpointByGuid(GUID*, IDebugBreakpoint3*);
    HRESULT GetExecutionStatusEx(uint*);
    HRESULT GetSynchronizationStatus(uint*, uint*);
    HRESULT GetDebuggeeType2(uint, uint*, uint*);
}
struct DEBUG_PROCESSOR_IDENTIFICATION_ALPHA
{
    uint Type;
    uint Revision;
}
struct DEBUG_PROCESSOR_IDENTIFICATION_AMD64
{
    uint Family;
    uint Model;
    uint Stepping;
    CHAR[16] VendorString;
}
struct DEBUG_PROCESSOR_IDENTIFICATION_IA64
{
    uint Model;
    uint Revision;
    uint Family;
    uint ArchRev;
    CHAR[16] VendorString;
}
struct DEBUG_PROCESSOR_IDENTIFICATION_X86
{
    uint Family;
    uint Model;
    uint Stepping;
    CHAR[16] VendorString;
}
struct DEBUG_PROCESSOR_IDENTIFICATION_ARM
{
    uint Model;
    uint Revision;
    CHAR[16] VendorString;
}
struct DEBUG_PROCESSOR_IDENTIFICATION_ARM64
{
    uint Model;
    uint Revision;
    CHAR[16] VendorString;
}
union DEBUG_PROCESSOR_IDENTIFICATION_ALL
{
    DEBUG_PROCESSOR_IDENTIFICATION_ALPHA Alpha;
    DEBUG_PROCESSOR_IDENTIFICATION_AMD64 Amd64;
    DEBUG_PROCESSOR_IDENTIFICATION_IA64 Ia64;
    DEBUG_PROCESSOR_IDENTIFICATION_X86 X86;
    DEBUG_PROCESSOR_IDENTIFICATION_ARM Arm;
    DEBUG_PROCESSOR_IDENTIFICATION_ARM64 Arm64;
}
enum IID_IDebugDataSpaces = GUID(0x88f7dfab, 0x3ea7, 0x4c3a, [0xae, 0xfb, 0xc4, 0xe8, 0x10, 0x61, 0x73, 0xaa]);
interface IDebugDataSpaces : IUnknown
{
    HRESULT ReadVirtual(ulong, void*, uint, uint*);
    HRESULT WriteVirtual(ulong, void*, uint, uint*);
    HRESULT SearchVirtual(ulong, ulong, void*, uint, uint, ulong*);
    HRESULT ReadVirtualUncached(ulong, void*, uint, uint*);
    HRESULT WriteVirtualUncached(ulong, void*, uint, uint*);
    HRESULT ReadPointersVirtual(uint, ulong, ulong*);
    HRESULT WritePointersVirtual(uint, ulong, ulong*);
    HRESULT ReadPhysical(ulong, void*, uint, uint*);
    HRESULT WritePhysical(ulong, void*, uint, uint*);
    HRESULT ReadControl(uint, ulong, void*, uint, uint*);
    HRESULT WriteControl(uint, ulong, void*, uint, uint*);
    HRESULT ReadIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT WriteIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT ReadMsr(uint, ulong*);
    HRESULT WriteMsr(uint, ulong);
    HRESULT ReadBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT WriteBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT CheckLowMemory();
    HRESULT ReadDebuggerData(uint, void*, uint, uint*);
    HRESULT ReadProcessorSystemData(uint, uint, void*, uint, uint*);
}
struct DEBUG_HANDLE_DATA_BASIC
{
    uint TypeNameSize;
    uint ObjectNameSize;
    uint Attributes;
    uint GrantedAccess;
    uint HandleCount;
    uint PointerCount;
}
enum IID_IDebugDataSpaces2 = GUID(0x7a5e852f, 0x96e9, 0x468f, [0xac, 0x1b, 0xb, 0x3a, 0xdd, 0xc4, 0xa0, 0x49]);
interface IDebugDataSpaces2 : IUnknown
{
    HRESULT ReadVirtual(ulong, void*, uint, uint*);
    HRESULT WriteVirtual(ulong, void*, uint, uint*);
    HRESULT SearchVirtual(ulong, ulong, void*, uint, uint, ulong*);
    HRESULT ReadVirtualUncached(ulong, void*, uint, uint*);
    HRESULT WriteVirtualUncached(ulong, void*, uint, uint*);
    HRESULT ReadPointersVirtual(uint, ulong, ulong*);
    HRESULT WritePointersVirtual(uint, ulong, ulong*);
    HRESULT ReadPhysical(ulong, void*, uint, uint*);
    HRESULT WritePhysical(ulong, void*, uint, uint*);
    HRESULT ReadControl(uint, ulong, void*, uint, uint*);
    HRESULT WriteControl(uint, ulong, void*, uint, uint*);
    HRESULT ReadIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT WriteIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT ReadMsr(uint, ulong*);
    HRESULT WriteMsr(uint, ulong);
    HRESULT ReadBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT WriteBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT CheckLowMemory();
    HRESULT ReadDebuggerData(uint, void*, uint, uint*);
    HRESULT ReadProcessorSystemData(uint, uint, void*, uint, uint*);
    HRESULT VirtualToPhysical(ulong, ulong*);
    HRESULT GetVirtualTranslationPhysicalOffsets(ulong, ulong*, uint, uint*);
    HRESULT ReadHandleData(ulong, uint, void*, uint, uint*);
    HRESULT FillVirtual(ulong, uint, void*, uint, uint*);
    HRESULT FillPhysical(ulong, uint, void*, uint, uint*);
    HRESULT QueryVirtual(ulong, MEMORY_BASIC_INFORMATION64*);
}
enum IID_IDebugDataSpaces3 = GUID(0x23f79d6c, 0x8aaf, 0x4f7c, [0xa6, 0x7, 0x99, 0x95, 0xf5, 0x40, 0x7e, 0x63]);
interface IDebugDataSpaces3 : IUnknown
{
    HRESULT ReadVirtual(ulong, void*, uint, uint*);
    HRESULT WriteVirtual(ulong, void*, uint, uint*);
    HRESULT SearchVirtual(ulong, ulong, void*, uint, uint, ulong*);
    HRESULT ReadVirtualUncached(ulong, void*, uint, uint*);
    HRESULT WriteVirtualUncached(ulong, void*, uint, uint*);
    HRESULT ReadPointersVirtual(uint, ulong, ulong*);
    HRESULT WritePointersVirtual(uint, ulong, ulong*);
    HRESULT ReadPhysical(ulong, void*, uint, uint*);
    HRESULT WritePhysical(ulong, void*, uint, uint*);
    HRESULT ReadControl(uint, ulong, void*, uint, uint*);
    HRESULT WriteControl(uint, ulong, void*, uint, uint*);
    HRESULT ReadIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT WriteIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT ReadMsr(uint, ulong*);
    HRESULT WriteMsr(uint, ulong);
    HRESULT ReadBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT WriteBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT CheckLowMemory();
    HRESULT ReadDebuggerData(uint, void*, uint, uint*);
    HRESULT ReadProcessorSystemData(uint, uint, void*, uint, uint*);
    HRESULT VirtualToPhysical(ulong, ulong*);
    HRESULT GetVirtualTranslationPhysicalOffsets(ulong, ulong*, uint, uint*);
    HRESULT ReadHandleData(ulong, uint, void*, uint, uint*);
    HRESULT FillVirtual(ulong, uint, void*, uint, uint*);
    HRESULT FillPhysical(ulong, uint, void*, uint, uint*);
    HRESULT QueryVirtual(ulong, MEMORY_BASIC_INFORMATION64*);
    HRESULT ReadImageNtHeaders(ulong, IMAGE_NT_HEADERS64*);
    HRESULT ReadTagged(GUID*, uint, void*, uint, uint*);
    HRESULT StartEnumTagged(ulong*);
    HRESULT GetNextTagged(ulong, GUID*, uint*);
    HRESULT EndEnumTagged(ulong);
}
enum IID_IDebugDataSpaces4 = GUID(0xd98ada1f, 0x29e9, 0x4ef5, [0xa6, 0xc0, 0xe5, 0x33, 0x49, 0x88, 0x32, 0x12]);
interface IDebugDataSpaces4 : IUnknown
{
    HRESULT ReadVirtual(ulong, void*, uint, uint*);
    HRESULT WriteVirtual(ulong, void*, uint, uint*);
    HRESULT SearchVirtual(ulong, ulong, void*, uint, uint, ulong*);
    HRESULT ReadVirtualUncached(ulong, void*, uint, uint*);
    HRESULT WriteVirtualUncached(ulong, void*, uint, uint*);
    HRESULT ReadPointersVirtual(uint, ulong, ulong*);
    HRESULT WritePointersVirtual(uint, ulong, ulong*);
    HRESULT ReadPhysical(ulong, void*, uint, uint*);
    HRESULT WritePhysical(ulong, void*, uint, uint*);
    HRESULT ReadControl(uint, ulong, void*, uint, uint*);
    HRESULT WriteControl(uint, ulong, void*, uint, uint*);
    HRESULT ReadIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT WriteIo(uint, uint, uint, ulong, void*, uint, uint*);
    HRESULT ReadMsr(uint, ulong*);
    HRESULT WriteMsr(uint, ulong);
    HRESULT ReadBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT WriteBusData(uint, uint, uint, uint, void*, uint, uint*);
    HRESULT CheckLowMemory();
    HRESULT ReadDebuggerData(uint, void*, uint, uint*);
    HRESULT ReadProcessorSystemData(uint, uint, void*, uint, uint*);
    HRESULT VirtualToPhysical(ulong, ulong*);
    HRESULT GetVirtualTranslationPhysicalOffsets(ulong, ulong*, uint, uint*);
    HRESULT ReadHandleData(ulong, uint, void*, uint, uint*);
    HRESULT FillVirtual(ulong, uint, void*, uint, uint*);
    HRESULT FillPhysical(ulong, uint, void*, uint, uint*);
    HRESULT QueryVirtual(ulong, MEMORY_BASIC_INFORMATION64*);
    HRESULT ReadImageNtHeaders(ulong, IMAGE_NT_HEADERS64*);
    HRESULT ReadTagged(GUID*, uint, void*, uint, uint*);
    HRESULT StartEnumTagged(ulong*);
    HRESULT GetNextTagged(ulong, GUID*, uint*);
    HRESULT EndEnumTagged(ulong);
    HRESULT GetOffsetInformation(uint, uint, ulong, void*, uint, uint*);
    HRESULT GetNextDifferentlyValidOffsetVirtual(ulong, ulong*);
    HRESULT GetValidRegionVirtual(ulong, uint, ulong*, uint*);
    HRESULT SearchVirtual2(ulong, ulong, uint, void*, uint, uint, ulong*);
    HRESULT ReadMultiByteStringVirtual(ulong, uint, PSTR, uint, uint*);
    HRESULT ReadMultiByteStringVirtualWide(ulong, uint, uint, PWSTR, uint, uint*);
    HRESULT ReadUnicodeStringVirtual(ulong, uint, uint, PSTR, uint, uint*);
    HRESULT ReadUnicodeStringVirtualWide(ulong, uint, PWSTR, uint, uint*);
    HRESULT ReadPhysical2(ulong, uint, void*, uint, uint*);
    HRESULT WritePhysical2(ulong, uint, void*, uint, uint*);
}
enum IID_IDebugEventCallbacks = GUID(0x337be28b, 0x5036, 0x4d72, [0xb6, 0xbf, 0xc4, 0x5f, 0xbb, 0x9f, 0x2e, 0xaa]);
interface IDebugEventCallbacks : IUnknown
{
    HRESULT GetInterestMask(uint*);
    HRESULT Breakpoint(IDebugBreakpoint);
    HRESULT Exception(EXCEPTION_RECORD64*, uint);
    HRESULT CreateThread(ulong, ulong, ulong);
    HRESULT ExitThread(uint);
    HRESULT CreateProcessA(ulong, ulong, ulong, uint, const(char)*, const(char)*, uint, uint, ulong, ulong, ulong);
    HRESULT ExitProcess(uint);
    HRESULT LoadModule(ulong, ulong, uint, const(char)*, const(char)*, uint, uint);
    HRESULT UnloadModule(const(char)*, ulong);
    HRESULT SystemError(uint, uint);
    HRESULT SessionStatus(uint);
    HRESULT ChangeDebuggeeState(uint, ulong);
    HRESULT ChangeEngineState(uint, ulong);
    HRESULT ChangeSymbolState(uint, ulong);
}
enum IID_IDebugEventCallbacksWide = GUID(0x690e046, 0x9c23, 0x45ac, [0xa0, 0x4f, 0x98, 0x7a, 0xc2, 0x9a, 0xd0, 0xd3]);
interface IDebugEventCallbacksWide : IUnknown
{
    HRESULT GetInterestMask(uint*);
    HRESULT Breakpoint(IDebugBreakpoint2);
    HRESULT Exception(EXCEPTION_RECORD64*, uint);
    HRESULT CreateThread(ulong, ulong, ulong);
    HRESULT ExitThread(uint);
    HRESULT CreateProcessA(ulong, ulong, ulong, uint, const(wchar)*, const(wchar)*, uint, uint, ulong, ulong, ulong);
    HRESULT ExitProcess(uint);
    HRESULT LoadModule(ulong, ulong, uint, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT UnloadModule(const(wchar)*, ulong);
    HRESULT SystemError(uint, uint);
    HRESULT SessionStatus(uint);
    HRESULT ChangeDebuggeeState(uint, ulong);
    HRESULT ChangeEngineState(uint, ulong);
    HRESULT ChangeSymbolState(uint, ulong);
}
struct DEBUG_EVENT_CONTEXT
{
    uint Size;
    uint ProcessEngineId;
    uint ThreadEngineId;
    uint FrameEngineId;
}
enum IID_IDebugEventContextCallbacks = GUID(0x61a4905b, 0x23f9, 0x4247, [0xb3, 0xc5, 0x53, 0xd0, 0x87, 0x52, 0x9a, 0xb7]);
interface IDebugEventContextCallbacks : IUnknown
{
    HRESULT GetInterestMask(uint*);
    HRESULT Breakpoint(IDebugBreakpoint2, void*, uint);
    HRESULT Exception(EXCEPTION_RECORD64*, uint, void*, uint);
    HRESULT CreateThread(ulong, ulong, ulong, void*, uint);
    HRESULT ExitThread(uint, void*, uint);
    HRESULT CreateProcessA(ulong, ulong, ulong, uint, const(wchar)*, const(wchar)*, uint, uint, ulong, ulong, ulong, void*, uint);
    HRESULT ExitProcess(uint, void*, uint);
    HRESULT LoadModule(ulong, ulong, uint, const(wchar)*, const(wchar)*, uint, uint, void*, uint);
    HRESULT UnloadModule(const(wchar)*, ulong, void*, uint);
    HRESULT SystemError(uint, uint, void*, uint);
    HRESULT SessionStatus(uint);
    HRESULT ChangeDebuggeeState(uint, ulong, void*, uint);
    HRESULT ChangeEngineState(uint, ulong, void*, uint);
    HRESULT ChangeSymbolState(uint, ulong);
}
enum IID_IDebugInputCallbacks = GUID(0x9f50e42c, 0xf136, 0x499e, [0x9a, 0x97, 0x73, 0x3, 0x6c, 0x94, 0xed, 0x2d]);
interface IDebugInputCallbacks : IUnknown
{
    HRESULT StartInput(uint);
    HRESULT EndInput();
}
enum IID_IDebugOutputCallbacks = GUID(0x4bf58045, 0xd654, 0x4c40, [0xb0, 0xaf, 0x68, 0x30, 0x90, 0xf3, 0x56, 0xdc]);
interface IDebugOutputCallbacks : IUnknown
{
    HRESULT Output(uint, const(char)*);
}
enum IID_IDebugOutputCallbacksWide = GUID(0x4c7fd663, 0xc394, 0x4e26, [0x8e, 0xf1, 0x34, 0xad, 0x5e, 0xd3, 0x76, 0x4c]);
interface IDebugOutputCallbacksWide : IUnknown
{
    HRESULT Output(uint, const(wchar)*);
}
enum IID_IDebugOutputCallbacks2 = GUID(0x67721fe9, 0x56d2, 0x4a44, [0xa3, 0x25, 0x2b, 0x65, 0x51, 0x3c, 0xe6, 0xeb]);
interface IDebugOutputCallbacks2 : IUnknown
{
    HRESULT Output(uint, const(char)*);
    HRESULT GetInterestMask(uint*);
    HRESULT Output2(uint, uint, ulong, const(wchar)*);
}
struct DEBUG_REGISTER_DESCRIPTION
{
    uint Type;
    uint Flags;
    uint SubregMaster;
    uint SubregLength;
    ulong SubregMask;
    uint SubregShift;
    uint Reserved0;
}
enum IID_IDebugRegisters = GUID(0xce289126, 0x9e84, 0x45a7, [0x93, 0x7e, 0x67, 0xbb, 0x18, 0x69, 0x14, 0x93]);
interface IDebugRegisters : IUnknown
{
    HRESULT GetNumberRegisters(uint*);
    HRESULT GetDescription(uint, PSTR, uint, uint*, DEBUG_REGISTER_DESCRIPTION*);
    HRESULT GetIndexByName(const(char)*, uint*);
    HRESULT GetValue(uint, DEBUG_VALUE*);
    HRESULT SetValue(uint, DEBUG_VALUE*);
    HRESULT GetValues(uint, uint*, uint, DEBUG_VALUE*);
    HRESULT SetValues(uint, uint*, uint, DEBUG_VALUE*);
    HRESULT OutputRegisters(uint, uint);
    HRESULT GetInstructionOffset(ulong*);
    HRESULT GetStackOffset(ulong*);
    HRESULT GetFrameOffset(ulong*);
}
enum IID_IDebugRegisters2 = GUID(0x1656afa9, 0x19c6, 0x4e3a, [0x97, 0xe7, 0x5d, 0xc9, 0x16, 0xc, 0xf9, 0xc4]);
interface IDebugRegisters2 : IUnknown
{
    HRESULT GetNumberRegisters(uint*);
    HRESULT GetDescription(uint, PSTR, uint, uint*, DEBUG_REGISTER_DESCRIPTION*);
    HRESULT GetIndexByName(const(char)*, uint*);
    HRESULT GetValue(uint, DEBUG_VALUE*);
    HRESULT SetValue(uint, DEBUG_VALUE*);
    HRESULT GetValues(uint, uint*, uint, DEBUG_VALUE*);
    HRESULT SetValues(uint, uint*, uint, DEBUG_VALUE*);
    HRESULT OutputRegisters(uint, uint);
    HRESULT GetInstructionOffset(ulong*);
    HRESULT GetStackOffset(ulong*);
    HRESULT GetFrameOffset(ulong*);
    HRESULT GetDescriptionWide(uint, PWSTR, uint, uint*, DEBUG_REGISTER_DESCRIPTION*);
    HRESULT GetIndexByNameWide(const(wchar)*, uint*);
    HRESULT GetNumberPseudoRegisters(uint*);
    HRESULT GetPseudoDescription(uint, PSTR, uint, uint*, ulong*, uint*);
    HRESULT GetPseudoDescriptionWide(uint, PWSTR, uint, uint*, ulong*, uint*);
    HRESULT GetPseudoIndexByName(const(char)*, uint*);
    HRESULT GetPseudoIndexByNameWide(const(wchar)*, uint*);
    HRESULT GetPseudoValues(uint, uint, uint*, uint, DEBUG_VALUE*);
    HRESULT SetPseudoValues(uint, uint, uint*, uint, DEBUG_VALUE*);
    HRESULT GetValues2(uint, uint, uint*, uint, DEBUG_VALUE*);
    HRESULT SetValues2(uint, uint, uint*, uint, DEBUG_VALUE*);
    HRESULT OutputRegisters2(uint, uint, uint);
    HRESULT GetInstructionOffset2(uint, ulong*);
    HRESULT GetStackOffset2(uint, ulong*);
    HRESULT GetFrameOffset2(uint, ulong*);
}
struct DEBUG_SYMBOL_PARAMETERS
{
    ulong Module;
    uint TypeId;
    uint ParentSymbol;
    uint SubElements;
    uint Flags;
    ulong Reserved;
}
enum IID_IDebugSymbolGroup = GUID(0xf2528316, 0xf1a, 0x4431, [0xae, 0xed, 0x11, 0xd0, 0x96, 0xe1, 0xe2, 0xab]);
interface IDebugSymbolGroup : IUnknown
{
    HRESULT GetNumberSymbols(uint*);
    HRESULT AddSymbol(const(char)*, uint*);
    HRESULT RemoveSymbolByName(const(char)*);
    HRESULT RemoveSymbolByIndex(uint);
    HRESULT GetSymbolName(uint, PSTR, uint, uint*);
    HRESULT GetSymbolParameters(uint, uint, DEBUG_SYMBOL_PARAMETERS*);
    HRESULT ExpandSymbol(uint, BOOL);
    HRESULT OutputSymbols(uint, uint, uint, uint);
    HRESULT WriteSymbol(uint, const(char)*);
    HRESULT OutputAsType(uint, const(char)*);
}
struct DEBUG_SYMBOL_ENTRY
{
    ulong ModuleBase;
    ulong Offset;
    ulong Id;
    ulong Arg64;
    uint Size;
    uint Flags;
    uint TypeId;
    uint NameSize;
    uint Token;
    uint Tag;
    uint Arg32;
    uint Reserved;
}
enum IID_IDebugSymbolGroup2 = GUID(0x6a7ccc5f, 0xfb5e, 0x4dcc, [0xb4, 0x1c, 0x6c, 0x20, 0x30, 0x7b, 0xcc, 0xc7]);
interface IDebugSymbolGroup2 : IUnknown
{
    HRESULT GetNumberSymbols(uint*);
    HRESULT AddSymbol(const(char)*, uint*);
    HRESULT RemoveSymbolByName(const(char)*);
    HRESULT RemoveSymbolByIndex(uint);
    HRESULT GetSymbolName(uint, PSTR, uint, uint*);
    HRESULT GetSymbolParameters(uint, uint, DEBUG_SYMBOL_PARAMETERS*);
    HRESULT ExpandSymbol(uint, BOOL);
    HRESULT OutputSymbols(uint, uint, uint, uint);
    HRESULT WriteSymbol(uint, const(char)*);
    HRESULT OutputAsType(uint, const(char)*);
    HRESULT AddSymbolWide(const(wchar)*, uint*);
    HRESULT RemoveSymbolByNameWide(const(wchar)*);
    HRESULT GetSymbolNameWide(uint, PWSTR, uint, uint*);
    HRESULT WriteSymbolWide(uint, const(wchar)*);
    HRESULT OutputAsTypeWide(uint, const(wchar)*);
    HRESULT GetSymbolTypeName(uint, PSTR, uint, uint*);
    HRESULT GetSymbolTypeNameWide(uint, PWSTR, uint, uint*);
    HRESULT GetSymbolSize(uint, uint*);
    HRESULT GetSymbolOffset(uint, ulong*);
    HRESULT GetSymbolRegister(uint, uint*);
    HRESULT GetSymbolValueText(uint, PSTR, uint, uint*);
    HRESULT GetSymbolValueTextWide(uint, PWSTR, uint, uint*);
    HRESULT GetSymbolEntryInformation(uint, DEBUG_SYMBOL_ENTRY*);
}
struct DEBUG_MODULE_PARAMETERS
{
    ulong Base;
    uint Size;
    uint TimeDateStamp;
    uint Checksum;
    uint Flags;
    uint SymbolType;
    uint ImageNameSize;
    uint ModuleNameSize;
    uint LoadedImageNameSize;
    uint SymbolFileNameSize;
    uint MappedImageNameSize;
    ulong[2] Reserved;
}
enum IID_IDebugSymbols = GUID(0x8c31e98c, 0x983a, 0x48a5, [0x90, 0x16, 0x6f, 0xe5, 0xd6, 0x67, 0xa9, 0x50]);
interface IDebugSymbols : IUnknown
{
    HRESULT GetSymbolOptions(uint*);
    HRESULT AddSymbolOptions(uint);
    HRESULT RemoveSymbolOptions(uint);
    HRESULT SetSymbolOptions(uint);
    HRESULT GetNameByOffset(ulong, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByName(const(char)*, ulong*);
    HRESULT GetNearNameByOffset(ulong, int, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffset(ulong, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLine(uint, const(char)*, ulong*);
    HRESULT GetNumberModules(uint*, uint*);
    HRESULT GetModuleByIndex(uint, ulong*);
    HRESULT GetModuleByModuleName(const(char)*, uint, uint*, ulong*);
    HRESULT GetModuleByOffset(ulong, uint, uint*, ulong*);
    HRESULT GetModuleNames(uint, ulong, PSTR, uint, uint*, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetModuleParameters(uint, ulong*, uint, DEBUG_MODULE_PARAMETERS*);
    HRESULT GetSymbolModule(const(char)*, ulong*);
    HRESULT GetTypeName(ulong, uint, PSTR, uint, uint*);
    HRESULT GetTypeId(ulong, const(char)*, uint*);
    HRESULT GetTypeSize(ulong, uint, uint*);
    HRESULT GetFieldOffset(ulong, uint, const(char)*, uint*);
    HRESULT GetSymbolTypeId(const(char)*, uint*, ulong*);
    HRESULT GetOffsetTypeId(ulong, uint*, ulong*);
    HRESULT ReadTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataVirtual(uint, ulong, ulong, uint, uint);
    HRESULT ReadTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataPhysical(uint, ulong, ulong, uint, uint);
    HRESULT GetScope(ulong*, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT SetScope(ulong, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT ResetScope();
    HRESULT GetScopeSymbolGroup(uint, IDebugSymbolGroup, IDebugSymbolGroup*);
    HRESULT CreateSymbolGroup(IDebugSymbolGroup*);
    HRESULT StartSymbolMatch(const(char)*, ulong*);
    HRESULT GetNextSymbolMatch(ulong, PSTR, uint, uint*, ulong*);
    HRESULT EndSymbolMatch(ulong);
    HRESULT Reload(const(char)*);
    HRESULT GetSymbolPath(PSTR, uint, uint*);
    HRESULT SetSymbolPath(const(char)*);
    HRESULT AppendSymbolPath(const(char)*);
    HRESULT GetImagePath(PSTR, uint, uint*);
    HRESULT SetImagePath(const(char)*);
    HRESULT AppendImagePath(const(char)*);
    HRESULT GetSourcePath(PSTR, uint, uint*);
    HRESULT GetSourcePathElement(uint, PSTR, uint, uint*);
    HRESULT SetSourcePath(const(char)*);
    HRESULT AppendSourcePath(const(char)*);
    HRESULT FindSourceFile(uint, const(char)*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsets(const(char)*, ulong*, uint, uint*);
}
enum IID_IDebugSymbols2 = GUID(0x3a707211, 0xafdd, 0x4495, [0xad, 0x4f, 0x56, 0xfe, 0xcd, 0xf8, 0x16, 0x3f]);
interface IDebugSymbols2 : IUnknown
{
    HRESULT GetSymbolOptions(uint*);
    HRESULT AddSymbolOptions(uint);
    HRESULT RemoveSymbolOptions(uint);
    HRESULT SetSymbolOptions(uint);
    HRESULT GetNameByOffset(ulong, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByName(const(char)*, ulong*);
    HRESULT GetNearNameByOffset(ulong, int, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffset(ulong, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLine(uint, const(char)*, ulong*);
    HRESULT GetNumberModules(uint*, uint*);
    HRESULT GetModuleByIndex(uint, ulong*);
    HRESULT GetModuleByModuleName(const(char)*, uint, uint*, ulong*);
    HRESULT GetModuleByOffset(ulong, uint, uint*, ulong*);
    HRESULT GetModuleNames(uint, ulong, PSTR, uint, uint*, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetModuleParameters(uint, ulong*, uint, DEBUG_MODULE_PARAMETERS*);
    HRESULT GetSymbolModule(const(char)*, ulong*);
    HRESULT GetTypeName(ulong, uint, PSTR, uint, uint*);
    HRESULT GetTypeId(ulong, const(char)*, uint*);
    HRESULT GetTypeSize(ulong, uint, uint*);
    HRESULT GetFieldOffset(ulong, uint, const(char)*, uint*);
    HRESULT GetSymbolTypeId(const(char)*, uint*, ulong*);
    HRESULT GetOffsetTypeId(ulong, uint*, ulong*);
    HRESULT ReadTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataVirtual(uint, ulong, ulong, uint, uint);
    HRESULT ReadTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataPhysical(uint, ulong, ulong, uint, uint);
    HRESULT GetScope(ulong*, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT SetScope(ulong, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT ResetScope();
    HRESULT GetScopeSymbolGroup(uint, IDebugSymbolGroup, IDebugSymbolGroup*);
    HRESULT CreateSymbolGroup(IDebugSymbolGroup*);
    HRESULT StartSymbolMatch(const(char)*, ulong*);
    HRESULT GetNextSymbolMatch(ulong, PSTR, uint, uint*, ulong*);
    HRESULT EndSymbolMatch(ulong);
    HRESULT Reload(const(char)*);
    HRESULT GetSymbolPath(PSTR, uint, uint*);
    HRESULT SetSymbolPath(const(char)*);
    HRESULT AppendSymbolPath(const(char)*);
    HRESULT GetImagePath(PSTR, uint, uint*);
    HRESULT SetImagePath(const(char)*);
    HRESULT AppendImagePath(const(char)*);
    HRESULT GetSourcePath(PSTR, uint, uint*);
    HRESULT GetSourcePathElement(uint, PSTR, uint, uint*);
    HRESULT SetSourcePath(const(char)*);
    HRESULT AppendSourcePath(const(char)*);
    HRESULT FindSourceFile(uint, const(char)*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsets(const(char)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformation(uint, ulong, const(char)*, void*, uint, uint*);
    HRESULT GetModuleNameString(uint, uint, ulong, PSTR, uint, uint*);
    HRESULT GetConstantName(ulong, uint, ulong, PSTR, uint, uint*);
    HRESULT GetFieldName(ulong, uint, uint, PSTR, uint, uint*);
    HRESULT GetTypeOptions(uint*);
    HRESULT AddTypeOptions(uint);
    HRESULT RemoveTypeOptions(uint);
    HRESULT SetTypeOptions(uint);
}
struct DEBUG_MODULE_AND_ID
{
    ulong ModuleBase;
    ulong Id;
}
struct DEBUG_SYMBOL_SOURCE_ENTRY
{
    ulong ModuleBase;
    ulong Offset;
    ulong FileNameId;
    ulong EngineInternal;
    uint Size;
    uint Flags;
    uint FileNameSize;
    uint StartLine;
    uint EndLine;
    uint StartColumn;
    uint EndColumn;
    uint Reserved;
}
enum IID_IDebugSymbols3 = GUID(0xf02fbecc, 0x50ac, 0x4f36, [0x9a, 0xd9, 0xc9, 0x75, 0xe8, 0xf3, 0x2f, 0xf8]);
interface IDebugSymbols3 : IUnknown
{
    HRESULT GetSymbolOptions(uint*);
    HRESULT AddSymbolOptions(uint);
    HRESULT RemoveSymbolOptions(uint);
    HRESULT SetSymbolOptions(uint);
    HRESULT GetNameByOffset(ulong, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByName(const(char)*, ulong*);
    HRESULT GetNearNameByOffset(ulong, int, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffset(ulong, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLine(uint, const(char)*, ulong*);
    HRESULT GetNumberModules(uint*, uint*);
    HRESULT GetModuleByIndex(uint, ulong*);
    HRESULT GetModuleByModuleName(const(char)*, uint, uint*, ulong*);
    HRESULT GetModuleByOffset(ulong, uint, uint*, ulong*);
    HRESULT GetModuleNames(uint, ulong, PSTR, uint, uint*, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetModuleParameters(uint, ulong*, uint, DEBUG_MODULE_PARAMETERS*);
    HRESULT GetSymbolModule(const(char)*, ulong*);
    HRESULT GetTypeName(ulong, uint, PSTR, uint, uint*);
    HRESULT GetTypeId(ulong, const(char)*, uint*);
    HRESULT GetTypeSize(ulong, uint, uint*);
    HRESULT GetFieldOffset(ulong, uint, const(char)*, uint*);
    HRESULT GetSymbolTypeId(const(char)*, uint*, ulong*);
    HRESULT GetOffsetTypeId(ulong, uint*, ulong*);
    HRESULT ReadTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataVirtual(uint, ulong, ulong, uint, uint);
    HRESULT ReadTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataPhysical(uint, ulong, ulong, uint, uint);
    HRESULT GetScope(ulong*, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT SetScope(ulong, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT ResetScope();
    HRESULT GetScopeSymbolGroup(uint, IDebugSymbolGroup, IDebugSymbolGroup*);
    HRESULT CreateSymbolGroup(IDebugSymbolGroup*);
    HRESULT StartSymbolMatch(const(char)*, ulong*);
    HRESULT GetNextSymbolMatch(ulong, PSTR, uint, uint*, ulong*);
    HRESULT EndSymbolMatch(ulong);
    HRESULT Reload(const(char)*);
    HRESULT GetSymbolPath(PSTR, uint, uint*);
    HRESULT SetSymbolPath(const(char)*);
    HRESULT AppendSymbolPath(const(char)*);
    HRESULT GetImagePath(PSTR, uint, uint*);
    HRESULT SetImagePath(const(char)*);
    HRESULT AppendImagePath(const(char)*);
    HRESULT GetSourcePath(PSTR, uint, uint*);
    HRESULT GetSourcePathElement(uint, PSTR, uint, uint*);
    HRESULT SetSourcePath(const(char)*);
    HRESULT AppendSourcePath(const(char)*);
    HRESULT FindSourceFile(uint, const(char)*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsets(const(char)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformation(uint, ulong, const(char)*, void*, uint, uint*);
    HRESULT GetModuleNameString(uint, uint, ulong, PSTR, uint, uint*);
    HRESULT GetConstantName(ulong, uint, ulong, PSTR, uint, uint*);
    HRESULT GetFieldName(ulong, uint, uint, PSTR, uint, uint*);
    HRESULT GetTypeOptions(uint*);
    HRESULT AddTypeOptions(uint);
    HRESULT RemoveTypeOptions(uint);
    HRESULT SetTypeOptions(uint);
    HRESULT GetNameByOffsetWide(ulong, PWSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByNameWide(const(wchar)*, ulong*);
    HRESULT GetNearNameByOffsetWide(ulong, int, PWSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffsetWide(ulong, uint*, PWSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLineWide(uint, const(wchar)*, ulong*);
    HRESULT GetModuleByModuleNameWide(const(wchar)*, uint, uint*, ulong*);
    HRESULT GetSymbolModuleWide(const(wchar)*, ulong*);
    HRESULT GetTypeNameWide(ulong, uint, PWSTR, uint, uint*);
    HRESULT GetTypeIdWide(ulong, const(wchar)*, uint*);
    HRESULT GetFieldOffsetWide(ulong, uint, const(wchar)*, uint*);
    HRESULT GetSymbolTypeIdWide(const(wchar)*, uint*, ulong*);
    HRESULT GetScopeSymbolGroup2(uint, IDebugSymbolGroup2, IDebugSymbolGroup2*);
    HRESULT CreateSymbolGroup2(IDebugSymbolGroup2*);
    HRESULT StartSymbolMatchWide(const(wchar)*, ulong*);
    HRESULT GetNextSymbolMatchWide(ulong, PWSTR, uint, uint*, ulong*);
    HRESULT ReloadWide(const(wchar)*);
    HRESULT GetSymbolPathWide(PWSTR, uint, uint*);
    HRESULT SetSymbolPathWide(const(wchar)*);
    HRESULT AppendSymbolPathWide(const(wchar)*);
    HRESULT GetImagePathWide(PWSTR, uint, uint*);
    HRESULT SetImagePathWide(const(wchar)*);
    HRESULT AppendImagePathWide(const(wchar)*);
    HRESULT GetSourcePathWide(PWSTR, uint, uint*);
    HRESULT GetSourcePathElementWide(uint, PWSTR, uint, uint*);
    HRESULT SetSourcePathWide(const(wchar)*);
    HRESULT AppendSourcePathWide(const(wchar)*);
    HRESULT FindSourceFileWide(uint, const(wchar)*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsetsWide(const(wchar)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformationWide(uint, ulong, const(wchar)*, void*, uint, uint*);
    HRESULT GetModuleNameStringWide(uint, uint, ulong, PWSTR, uint, uint*);
    HRESULT GetConstantNameWide(ulong, uint, ulong, PWSTR, uint, uint*);
    HRESULT GetFieldNameWide(ulong, uint, uint, PWSTR, uint, uint*);
    HRESULT IsManagedModule(uint, ulong);
    HRESULT GetModuleByModuleName2(const(char)*, uint, uint, uint*, ulong*);
    HRESULT GetModuleByModuleName2Wide(const(wchar)*, uint, uint, uint*, ulong*);
    HRESULT GetModuleByOffset2(ulong, uint, uint, uint*, ulong*);
    HRESULT AddSyntheticModule(ulong, uint, const(char)*, const(char)*, uint);
    HRESULT AddSyntheticModuleWide(ulong, uint, const(wchar)*, const(wchar)*, uint);
    HRESULT RemoveSyntheticModule(ulong);
    HRESULT GetCurrentScopeFrameIndex(uint*);
    HRESULT SetScopeFrameByIndex(uint);
    HRESULT SetScopeFromJitDebugInfo(uint, ulong);
    HRESULT SetScopeFromStoredEvent();
    HRESULT OutputSymbolByOffset(uint, uint, ulong);
    HRESULT GetFunctionEntryByOffset(ulong, uint, void*, uint, uint*);
    HRESULT GetFieldTypeAndOffset(ulong, uint, const(char)*, uint*, uint*);
    HRESULT GetFieldTypeAndOffsetWide(ulong, uint, const(wchar)*, uint*, uint*);
    HRESULT AddSyntheticSymbol(ulong, uint, const(char)*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT AddSyntheticSymbolWide(ulong, uint, const(wchar)*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT RemoveSyntheticSymbol(DEBUG_MODULE_AND_ID*);
    HRESULT GetSymbolEntriesByOffset(ulong, uint, DEBUG_MODULE_AND_ID*, ulong*, uint, uint*);
    HRESULT GetSymbolEntriesByName(const(char)*, uint, DEBUG_MODULE_AND_ID*, uint, uint*);
    HRESULT GetSymbolEntriesByNameWide(const(wchar)*, uint, DEBUG_MODULE_AND_ID*, uint, uint*);
    HRESULT GetSymbolEntryByToken(ulong, uint, DEBUG_MODULE_AND_ID*);
    HRESULT GetSymbolEntryInformation(DEBUG_MODULE_AND_ID*, DEBUG_SYMBOL_ENTRY*);
    HRESULT GetSymbolEntryString(DEBUG_MODULE_AND_ID*, uint, PSTR, uint, uint*);
    HRESULT GetSymbolEntryStringWide(DEBUG_MODULE_AND_ID*, uint, PWSTR, uint, uint*);
    HRESULT GetSymbolEntryOffsetRegions(DEBUG_MODULE_AND_ID*, uint, DEBUG_OFFSET_REGION*, uint, uint*);
    HRESULT GetSymbolEntryBySymbolEntry(DEBUG_MODULE_AND_ID*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT GetSourceEntriesByOffset(ulong, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntriesByLine(uint, const(char)*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntriesByLineWide(uint, const(wchar)*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntryString(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, PSTR, uint, uint*);
    HRESULT GetSourceEntryStringWide(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, PWSTR, uint, uint*);
    HRESULT GetSourceEntryOffsetRegions(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, DEBUG_OFFSET_REGION*, uint, uint*);
    HRESULT GetSourceEntryBySourceEntry(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*);
}
enum IID_IDebugSymbols4 = GUID(0xe391bbd8, 0x9d8c, 0x4418, [0x84, 0xb, 0xc0, 0x6, 0x59, 0x2a, 0x17, 0x52]);
interface IDebugSymbols4 : IUnknown
{
    HRESULT GetSymbolOptions(uint*);
    HRESULT AddSymbolOptions(uint);
    HRESULT RemoveSymbolOptions(uint);
    HRESULT SetSymbolOptions(uint);
    HRESULT GetNameByOffset(ulong, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByName(const(char)*, ulong*);
    HRESULT GetNearNameByOffset(ulong, int, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffset(ulong, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLine(uint, const(char)*, ulong*);
    HRESULT GetNumberModules(uint*, uint*);
    HRESULT GetModuleByIndex(uint, ulong*);
    HRESULT GetModuleByModuleName(const(char)*, uint, uint*, ulong*);
    HRESULT GetModuleByOffset(ulong, uint, uint*, ulong*);
    HRESULT GetModuleNames(uint, ulong, PSTR, uint, uint*, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetModuleParameters(uint, ulong*, uint, DEBUG_MODULE_PARAMETERS*);
    HRESULT GetSymbolModule(const(char)*, ulong*);
    HRESULT GetTypeName(ulong, uint, PSTR, uint, uint*);
    HRESULT GetTypeId(ulong, const(char)*, uint*);
    HRESULT GetTypeSize(ulong, uint, uint*);
    HRESULT GetFieldOffset(ulong, uint, const(char)*, uint*);
    HRESULT GetSymbolTypeId(const(char)*, uint*, ulong*);
    HRESULT GetOffsetTypeId(ulong, uint*, ulong*);
    HRESULT ReadTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataVirtual(uint, ulong, ulong, uint, uint);
    HRESULT ReadTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataPhysical(uint, ulong, ulong, uint, uint);
    HRESULT GetScope(ulong*, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT SetScope(ulong, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT ResetScope();
    HRESULT GetScopeSymbolGroup(uint, IDebugSymbolGroup, IDebugSymbolGroup*);
    HRESULT CreateSymbolGroup(IDebugSymbolGroup*);
    HRESULT StartSymbolMatch(const(char)*, ulong*);
    HRESULT GetNextSymbolMatch(ulong, PSTR, uint, uint*, ulong*);
    HRESULT EndSymbolMatch(ulong);
    HRESULT Reload(const(char)*);
    HRESULT GetSymbolPath(PSTR, uint, uint*);
    HRESULT SetSymbolPath(const(char)*);
    HRESULT AppendSymbolPath(const(char)*);
    HRESULT GetImagePath(PSTR, uint, uint*);
    HRESULT SetImagePath(const(char)*);
    HRESULT AppendImagePath(const(char)*);
    HRESULT GetSourcePath(PSTR, uint, uint*);
    HRESULT GetSourcePathElement(uint, PSTR, uint, uint*);
    HRESULT SetSourcePath(const(char)*);
    HRESULT AppendSourcePath(const(char)*);
    HRESULT FindSourceFile(uint, const(char)*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsets(const(char)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformation(uint, ulong, const(char)*, void*, uint, uint*);
    HRESULT GetModuleNameString(uint, uint, ulong, PSTR, uint, uint*);
    HRESULT GetConstantName(ulong, uint, ulong, PSTR, uint, uint*);
    HRESULT GetFieldName(ulong, uint, uint, PSTR, uint, uint*);
    HRESULT GetTypeOptions(uint*);
    HRESULT AddTypeOptions(uint);
    HRESULT RemoveTypeOptions(uint);
    HRESULT SetTypeOptions(uint);
    HRESULT GetNameByOffsetWide(ulong, PWSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByNameWide(const(wchar)*, ulong*);
    HRESULT GetNearNameByOffsetWide(ulong, int, PWSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffsetWide(ulong, uint*, PWSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLineWide(uint, const(wchar)*, ulong*);
    HRESULT GetModuleByModuleNameWide(const(wchar)*, uint, uint*, ulong*);
    HRESULT GetSymbolModuleWide(const(wchar)*, ulong*);
    HRESULT GetTypeNameWide(ulong, uint, PWSTR, uint, uint*);
    HRESULT GetTypeIdWide(ulong, const(wchar)*, uint*);
    HRESULT GetFieldOffsetWide(ulong, uint, const(wchar)*, uint*);
    HRESULT GetSymbolTypeIdWide(const(wchar)*, uint*, ulong*);
    HRESULT GetScopeSymbolGroup2(uint, IDebugSymbolGroup2, IDebugSymbolGroup2*);
    HRESULT CreateSymbolGroup2(IDebugSymbolGroup2*);
    HRESULT StartSymbolMatchWide(const(wchar)*, ulong*);
    HRESULT GetNextSymbolMatchWide(ulong, PWSTR, uint, uint*, ulong*);
    HRESULT ReloadWide(const(wchar)*);
    HRESULT GetSymbolPathWide(PWSTR, uint, uint*);
    HRESULT SetSymbolPathWide(const(wchar)*);
    HRESULT AppendSymbolPathWide(const(wchar)*);
    HRESULT GetImagePathWide(PWSTR, uint, uint*);
    HRESULT SetImagePathWide(const(wchar)*);
    HRESULT AppendImagePathWide(const(wchar)*);
    HRESULT GetSourcePathWide(PWSTR, uint, uint*);
    HRESULT GetSourcePathElementWide(uint, PWSTR, uint, uint*);
    HRESULT SetSourcePathWide(const(wchar)*);
    HRESULT AppendSourcePathWide(const(wchar)*);
    HRESULT FindSourceFileWide(uint, const(wchar)*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsetsWide(const(wchar)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformationWide(uint, ulong, const(wchar)*, void*, uint, uint*);
    HRESULT GetModuleNameStringWide(uint, uint, ulong, PWSTR, uint, uint*);
    HRESULT GetConstantNameWide(ulong, uint, ulong, PWSTR, uint, uint*);
    HRESULT GetFieldNameWide(ulong, uint, uint, PWSTR, uint, uint*);
    HRESULT IsManagedModule(uint, ulong);
    HRESULT GetModuleByModuleName2(const(char)*, uint, uint, uint*, ulong*);
    HRESULT GetModuleByModuleName2Wide(const(wchar)*, uint, uint, uint*, ulong*);
    HRESULT GetModuleByOffset2(ulong, uint, uint, uint*, ulong*);
    HRESULT AddSyntheticModule(ulong, uint, const(char)*, const(char)*, uint);
    HRESULT AddSyntheticModuleWide(ulong, uint, const(wchar)*, const(wchar)*, uint);
    HRESULT RemoveSyntheticModule(ulong);
    HRESULT GetCurrentScopeFrameIndex(uint*);
    HRESULT SetScopeFrameByIndex(uint);
    HRESULT SetScopeFromJitDebugInfo(uint, ulong);
    HRESULT SetScopeFromStoredEvent();
    HRESULT OutputSymbolByOffset(uint, uint, ulong);
    HRESULT GetFunctionEntryByOffset(ulong, uint, void*, uint, uint*);
    HRESULT GetFieldTypeAndOffset(ulong, uint, const(char)*, uint*, uint*);
    HRESULT GetFieldTypeAndOffsetWide(ulong, uint, const(wchar)*, uint*, uint*);
    HRESULT AddSyntheticSymbol(ulong, uint, const(char)*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT AddSyntheticSymbolWide(ulong, uint, const(wchar)*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT RemoveSyntheticSymbol(DEBUG_MODULE_AND_ID*);
    HRESULT GetSymbolEntriesByOffset(ulong, uint, DEBUG_MODULE_AND_ID*, ulong*, uint, uint*);
    HRESULT GetSymbolEntriesByName(const(char)*, uint, DEBUG_MODULE_AND_ID*, uint, uint*);
    HRESULT GetSymbolEntriesByNameWide(const(wchar)*, uint, DEBUG_MODULE_AND_ID*, uint, uint*);
    HRESULT GetSymbolEntryByToken(ulong, uint, DEBUG_MODULE_AND_ID*);
    HRESULT GetSymbolEntryInformation(DEBUG_MODULE_AND_ID*, DEBUG_SYMBOL_ENTRY*);
    HRESULT GetSymbolEntryString(DEBUG_MODULE_AND_ID*, uint, PSTR, uint, uint*);
    HRESULT GetSymbolEntryStringWide(DEBUG_MODULE_AND_ID*, uint, PWSTR, uint, uint*);
    HRESULT GetSymbolEntryOffsetRegions(DEBUG_MODULE_AND_ID*, uint, DEBUG_OFFSET_REGION*, uint, uint*);
    HRESULT GetSymbolEntryBySymbolEntry(DEBUG_MODULE_AND_ID*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT GetSourceEntriesByOffset(ulong, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntriesByLine(uint, const(char)*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntriesByLineWide(uint, const(wchar)*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntryString(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, PSTR, uint, uint*);
    HRESULT GetSourceEntryStringWide(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, PWSTR, uint, uint*);
    HRESULT GetSourceEntryOffsetRegions(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, DEBUG_OFFSET_REGION*, uint, uint*);
    HRESULT GetSourceEntryBySourceEntry(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*);
    HRESULT GetScopeEx(ulong*, DEBUG_STACK_FRAME_EX*, void*, uint);
    HRESULT SetScopeEx(ulong, DEBUG_STACK_FRAME_EX*, void*, uint);
    HRESULT GetNameByInlineContext(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetNameByInlineContextWide(ulong, uint, PWSTR, uint, uint*, ulong*);
    HRESULT GetLineByInlineContext(ulong, uint, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByInlineContextWide(ulong, uint, uint*, PWSTR, uint, uint*, ulong*);
    HRESULT OutputSymbolByInlineContext(uint, uint, ulong, uint);
}
enum IID_IDebugSymbols5 = GUID(0xc65fa83e, 0x1e69, 0x475e, [0x8e, 0xe, 0xb5, 0xd7, 0x9e, 0x9c, 0xc1, 0x7e]);
interface IDebugSymbols5 : IUnknown
{
    HRESULT GetSymbolOptions(uint*);
    HRESULT AddSymbolOptions(uint);
    HRESULT RemoveSymbolOptions(uint);
    HRESULT SetSymbolOptions(uint);
    HRESULT GetNameByOffset(ulong, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByName(const(char)*, ulong*);
    HRESULT GetNearNameByOffset(ulong, int, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffset(ulong, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLine(uint, const(char)*, ulong*);
    HRESULT GetNumberModules(uint*, uint*);
    HRESULT GetModuleByIndex(uint, ulong*);
    HRESULT GetModuleByModuleName(const(char)*, uint, uint*, ulong*);
    HRESULT GetModuleByOffset(ulong, uint, uint*, ulong*);
    HRESULT GetModuleNames(uint, ulong, PSTR, uint, uint*, PSTR, uint, uint*, PSTR, uint, uint*);
    HRESULT GetModuleParameters(uint, ulong*, uint, DEBUG_MODULE_PARAMETERS*);
    HRESULT GetSymbolModule(const(char)*, ulong*);
    HRESULT GetTypeName(ulong, uint, PSTR, uint, uint*);
    HRESULT GetTypeId(ulong, const(char)*, uint*);
    HRESULT GetTypeSize(ulong, uint, uint*);
    HRESULT GetFieldOffset(ulong, uint, const(char)*, uint*);
    HRESULT GetSymbolTypeId(const(char)*, uint*, ulong*);
    HRESULT GetOffsetTypeId(ulong, uint*, ulong*);
    HRESULT ReadTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataVirtual(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataVirtual(uint, ulong, ulong, uint, uint);
    HRESULT ReadTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT WriteTypedDataPhysical(ulong, ulong, uint, void*, uint, uint*);
    HRESULT OutputTypedDataPhysical(uint, ulong, ulong, uint, uint);
    HRESULT GetScope(ulong*, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT SetScope(ulong, DEBUG_STACK_FRAME*, void*, uint);
    HRESULT ResetScope();
    HRESULT GetScopeSymbolGroup(uint, IDebugSymbolGroup, IDebugSymbolGroup*);
    HRESULT CreateSymbolGroup(IDebugSymbolGroup*);
    HRESULT StartSymbolMatch(const(char)*, ulong*);
    HRESULT GetNextSymbolMatch(ulong, PSTR, uint, uint*, ulong*);
    HRESULT EndSymbolMatch(ulong);
    HRESULT Reload(const(char)*);
    HRESULT GetSymbolPath(PSTR, uint, uint*);
    HRESULT SetSymbolPath(const(char)*);
    HRESULT AppendSymbolPath(const(char)*);
    HRESULT GetImagePath(PSTR, uint, uint*);
    HRESULT SetImagePath(const(char)*);
    HRESULT AppendImagePath(const(char)*);
    HRESULT GetSourcePath(PSTR, uint, uint*);
    HRESULT GetSourcePathElement(uint, PSTR, uint, uint*);
    HRESULT SetSourcePath(const(char)*);
    HRESULT AppendSourcePath(const(char)*);
    HRESULT FindSourceFile(uint, const(char)*, uint, uint*, PSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsets(const(char)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformation(uint, ulong, const(char)*, void*, uint, uint*);
    HRESULT GetModuleNameString(uint, uint, ulong, PSTR, uint, uint*);
    HRESULT GetConstantName(ulong, uint, ulong, PSTR, uint, uint*);
    HRESULT GetFieldName(ulong, uint, uint, PSTR, uint, uint*);
    HRESULT GetTypeOptions(uint*);
    HRESULT AddTypeOptions(uint);
    HRESULT RemoveTypeOptions(uint);
    HRESULT SetTypeOptions(uint);
    HRESULT GetNameByOffsetWide(ulong, PWSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByNameWide(const(wchar)*, ulong*);
    HRESULT GetNearNameByOffsetWide(ulong, int, PWSTR, uint, uint*, ulong*);
    HRESULT GetLineByOffsetWide(ulong, uint*, PWSTR, uint, uint*, ulong*);
    HRESULT GetOffsetByLineWide(uint, const(wchar)*, ulong*);
    HRESULT GetModuleByModuleNameWide(const(wchar)*, uint, uint*, ulong*);
    HRESULT GetSymbolModuleWide(const(wchar)*, ulong*);
    HRESULT GetTypeNameWide(ulong, uint, PWSTR, uint, uint*);
    HRESULT GetTypeIdWide(ulong, const(wchar)*, uint*);
    HRESULT GetFieldOffsetWide(ulong, uint, const(wchar)*, uint*);
    HRESULT GetSymbolTypeIdWide(const(wchar)*, uint*, ulong*);
    HRESULT GetScopeSymbolGroup2(uint, IDebugSymbolGroup2, IDebugSymbolGroup2*);
    HRESULT CreateSymbolGroup2(IDebugSymbolGroup2*);
    HRESULT StartSymbolMatchWide(const(wchar)*, ulong*);
    HRESULT GetNextSymbolMatchWide(ulong, PWSTR, uint, uint*, ulong*);
    HRESULT ReloadWide(const(wchar)*);
    HRESULT GetSymbolPathWide(PWSTR, uint, uint*);
    HRESULT SetSymbolPathWide(const(wchar)*);
    HRESULT AppendSymbolPathWide(const(wchar)*);
    HRESULT GetImagePathWide(PWSTR, uint, uint*);
    HRESULT SetImagePathWide(const(wchar)*);
    HRESULT AppendImagePathWide(const(wchar)*);
    HRESULT GetSourcePathWide(PWSTR, uint, uint*);
    HRESULT GetSourcePathElementWide(uint, PWSTR, uint, uint*);
    HRESULT SetSourcePathWide(const(wchar)*);
    HRESULT AppendSourcePathWide(const(wchar)*);
    HRESULT FindSourceFileWide(uint, const(wchar)*, uint, uint*, PWSTR, uint, uint*);
    HRESULT GetSourceFileLineOffsetsWide(const(wchar)*, ulong*, uint, uint*);
    HRESULT GetModuleVersionInformationWide(uint, ulong, const(wchar)*, void*, uint, uint*);
    HRESULT GetModuleNameStringWide(uint, uint, ulong, PWSTR, uint, uint*);
    HRESULT GetConstantNameWide(ulong, uint, ulong, PWSTR, uint, uint*);
    HRESULT GetFieldNameWide(ulong, uint, uint, PWSTR, uint, uint*);
    HRESULT IsManagedModule(uint, ulong);
    HRESULT GetModuleByModuleName2(const(char)*, uint, uint, uint*, ulong*);
    HRESULT GetModuleByModuleName2Wide(const(wchar)*, uint, uint, uint*, ulong*);
    HRESULT GetModuleByOffset2(ulong, uint, uint, uint*, ulong*);
    HRESULT AddSyntheticModule(ulong, uint, const(char)*, const(char)*, uint);
    HRESULT AddSyntheticModuleWide(ulong, uint, const(wchar)*, const(wchar)*, uint);
    HRESULT RemoveSyntheticModule(ulong);
    HRESULT GetCurrentScopeFrameIndex(uint*);
    HRESULT SetScopeFrameByIndex(uint);
    HRESULT SetScopeFromJitDebugInfo(uint, ulong);
    HRESULT SetScopeFromStoredEvent();
    HRESULT OutputSymbolByOffset(uint, uint, ulong);
    HRESULT GetFunctionEntryByOffset(ulong, uint, void*, uint, uint*);
    HRESULT GetFieldTypeAndOffset(ulong, uint, const(char)*, uint*, uint*);
    HRESULT GetFieldTypeAndOffsetWide(ulong, uint, const(wchar)*, uint*, uint*);
    HRESULT AddSyntheticSymbol(ulong, uint, const(char)*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT AddSyntheticSymbolWide(ulong, uint, const(wchar)*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT RemoveSyntheticSymbol(DEBUG_MODULE_AND_ID*);
    HRESULT GetSymbolEntriesByOffset(ulong, uint, DEBUG_MODULE_AND_ID*, ulong*, uint, uint*);
    HRESULT GetSymbolEntriesByName(const(char)*, uint, DEBUG_MODULE_AND_ID*, uint, uint*);
    HRESULT GetSymbolEntriesByNameWide(const(wchar)*, uint, DEBUG_MODULE_AND_ID*, uint, uint*);
    HRESULT GetSymbolEntryByToken(ulong, uint, DEBUG_MODULE_AND_ID*);
    HRESULT GetSymbolEntryInformation(DEBUG_MODULE_AND_ID*, DEBUG_SYMBOL_ENTRY*);
    HRESULT GetSymbolEntryString(DEBUG_MODULE_AND_ID*, uint, PSTR, uint, uint*);
    HRESULT GetSymbolEntryStringWide(DEBUG_MODULE_AND_ID*, uint, PWSTR, uint, uint*);
    HRESULT GetSymbolEntryOffsetRegions(DEBUG_MODULE_AND_ID*, uint, DEBUG_OFFSET_REGION*, uint, uint*);
    HRESULT GetSymbolEntryBySymbolEntry(DEBUG_MODULE_AND_ID*, uint, DEBUG_MODULE_AND_ID*);
    HRESULT GetSourceEntriesByOffset(ulong, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntriesByLine(uint, const(char)*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntriesByLineWide(uint, const(wchar)*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*, uint, uint*);
    HRESULT GetSourceEntryString(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, PSTR, uint, uint*);
    HRESULT GetSourceEntryStringWide(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, PWSTR, uint, uint*);
    HRESULT GetSourceEntryOffsetRegions(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, DEBUG_OFFSET_REGION*, uint, uint*);
    HRESULT GetSourceEntryBySourceEntry(DEBUG_SYMBOL_SOURCE_ENTRY*, uint, DEBUG_SYMBOL_SOURCE_ENTRY*);
    HRESULT GetScopeEx(ulong*, DEBUG_STACK_FRAME_EX*, void*, uint);
    HRESULT SetScopeEx(ulong, DEBUG_STACK_FRAME_EX*, void*, uint);
    HRESULT GetNameByInlineContext(ulong, uint, PSTR, uint, uint*, ulong*);
    HRESULT GetNameByInlineContextWide(ulong, uint, PWSTR, uint, uint*, ulong*);
    HRESULT GetLineByInlineContext(ulong, uint, uint*, PSTR, uint, uint*, ulong*);
    HRESULT GetLineByInlineContextWide(ulong, uint, uint*, PWSTR, uint, uint*, ulong*);
    HRESULT OutputSymbolByInlineContext(uint, uint, ulong, uint);
    HRESULT GetCurrentScopeFrameIndexEx(uint, uint*);
    HRESULT SetScopeFrameByIndexEx(uint, uint);
}
enum IID_IDebugSystemObjects = GUID(0x6b86fe2c, 0x2c4f, 0x4f0c, [0x9d, 0xa2, 0x17, 0x43, 0x11, 0xac, 0xc3, 0x27]);
interface IDebugSystemObjects : IUnknown
{
    HRESULT GetEventThread(uint*);
    HRESULT GetEventProcess(uint*);
    HRESULT GetCurrentThreadId(uint*);
    HRESULT SetCurrentThreadId(uint);
    HRESULT GetCurrentProcessId(uint*);
    HRESULT SetCurrentProcessId(uint);
    HRESULT GetNumberThreads(uint*);
    HRESULT GetTotalNumberThreads(uint*, uint*);
    HRESULT GetThreadIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetThreadIdByProcessor(uint, uint*);
    HRESULT GetCurrentThreadDataOffset(ulong*);
    HRESULT GetThreadIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentThreadTeb(ulong*);
    HRESULT GetThreadIdByTeb(ulong, uint*);
    HRESULT GetCurrentThreadSystemId(uint*);
    HRESULT GetThreadIdBySystemId(uint, uint*);
    HRESULT GetCurrentThreadHandle(ulong*);
    HRESULT GetThreadIdByHandle(ulong, uint*);
    HRESULT GetNumberProcesses(uint*);
    HRESULT GetProcessIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetCurrentProcessDataOffset(ulong*);
    HRESULT GetProcessIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentProcessPeb(ulong*);
    HRESULT GetProcessIdByPeb(ulong, uint*);
    HRESULT GetCurrentProcessSystemId(uint*);
    HRESULT GetProcessIdBySystemId(uint, uint*);
    HRESULT GetCurrentProcessHandle(ulong*);
    HRESULT GetProcessIdByHandle(ulong, uint*);
    HRESULT GetCurrentProcessExecutableName(PSTR, uint, uint*);
}
enum IID_IDebugSystemObjects2 = GUID(0xae9f5ff, 0x1852, 0x4679, [0xb0, 0x55, 0x49, 0x4b, 0xee, 0x64, 0x7, 0xee]);
interface IDebugSystemObjects2 : IUnknown
{
    HRESULT GetEventThread(uint*);
    HRESULT GetEventProcess(uint*);
    HRESULT GetCurrentThreadId(uint*);
    HRESULT SetCurrentThreadId(uint);
    HRESULT GetCurrentProcessId(uint*);
    HRESULT SetCurrentProcessId(uint);
    HRESULT GetNumberThreads(uint*);
    HRESULT GetTotalNumberThreads(uint*, uint*);
    HRESULT GetThreadIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetThreadIdByProcessor(uint, uint*);
    HRESULT GetCurrentThreadDataOffset(ulong*);
    HRESULT GetThreadIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentThreadTeb(ulong*);
    HRESULT GetThreadIdByTeb(ulong, uint*);
    HRESULT GetCurrentThreadSystemId(uint*);
    HRESULT GetThreadIdBySystemId(uint, uint*);
    HRESULT GetCurrentThreadHandle(ulong*);
    HRESULT GetThreadIdByHandle(ulong, uint*);
    HRESULT GetNumberProcesses(uint*);
    HRESULT GetProcessIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetCurrentProcessDataOffset(ulong*);
    HRESULT GetProcessIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentProcessPeb(ulong*);
    HRESULT GetProcessIdByPeb(ulong, uint*);
    HRESULT GetCurrentProcessSystemId(uint*);
    HRESULT GetProcessIdBySystemId(uint, uint*);
    HRESULT GetCurrentProcessHandle(ulong*);
    HRESULT GetProcessIdByHandle(ulong, uint*);
    HRESULT GetCurrentProcessExecutableName(PSTR, uint, uint*);
    HRESULT GetCurrentProcessUpTime(uint*);
    HRESULT GetImplicitThreadDataOffset(ulong*);
    HRESULT SetImplicitThreadDataOffset(ulong);
    HRESULT GetImplicitProcessDataOffset(ulong*);
    HRESULT SetImplicitProcessDataOffset(ulong);
}
enum IID_IDebugSystemObjects3 = GUID(0xe9676e2f, 0xe286, 0x4ea3, [0xb0, 0xf9, 0xdf, 0xe5, 0xd9, 0xfc, 0x33, 0xe]);
interface IDebugSystemObjects3 : IUnknown
{
    HRESULT GetEventThread(uint*);
    HRESULT GetEventProcess(uint*);
    HRESULT GetCurrentThreadId(uint*);
    HRESULT SetCurrentThreadId(uint);
    HRESULT GetCurrentProcessId(uint*);
    HRESULT SetCurrentProcessId(uint);
    HRESULT GetNumberThreads(uint*);
    HRESULT GetTotalNumberThreads(uint*, uint*);
    HRESULT GetThreadIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetThreadIdByProcessor(uint, uint*);
    HRESULT GetCurrentThreadDataOffset(ulong*);
    HRESULT GetThreadIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentThreadTeb(ulong*);
    HRESULT GetThreadIdByTeb(ulong, uint*);
    HRESULT GetCurrentThreadSystemId(uint*);
    HRESULT GetThreadIdBySystemId(uint, uint*);
    HRESULT GetCurrentThreadHandle(ulong*);
    HRESULT GetThreadIdByHandle(ulong, uint*);
    HRESULT GetNumberProcesses(uint*);
    HRESULT GetProcessIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetCurrentProcessDataOffset(ulong*);
    HRESULT GetProcessIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentProcessPeb(ulong*);
    HRESULT GetProcessIdByPeb(ulong, uint*);
    HRESULT GetCurrentProcessSystemId(uint*);
    HRESULT GetProcessIdBySystemId(uint, uint*);
    HRESULT GetCurrentProcessHandle(ulong*);
    HRESULT GetProcessIdByHandle(ulong, uint*);
    HRESULT GetCurrentProcessExecutableName(PSTR, uint, uint*);
    HRESULT GetCurrentProcessUpTime(uint*);
    HRESULT GetImplicitThreadDataOffset(ulong*);
    HRESULT SetImplicitThreadDataOffset(ulong);
    HRESULT GetImplicitProcessDataOffset(ulong*);
    HRESULT SetImplicitProcessDataOffset(ulong);
    HRESULT GetEventSystem(uint*);
    HRESULT GetCurrentSystemId(uint*);
    HRESULT SetCurrentSystemId(uint);
    HRESULT GetNumberSystems(uint*);
    HRESULT GetSystemIdsByIndex(uint, uint, uint*);
    HRESULT GetTotalNumberThreadsAndProcesses(uint*, uint*, uint*, uint*, uint*);
    HRESULT GetCurrentSystemServer(ulong*);
    HRESULT GetSystemByServer(ulong, uint*);
    HRESULT GetCurrentSystemServerName(PSTR, uint, uint*);
}
enum IID_IDebugSystemObjects4 = GUID(0x489468e6, 0x7d0f, 0x4af5, [0x87, 0xab, 0x25, 0x20, 0x74, 0x54, 0xd5, 0x53]);
interface IDebugSystemObjects4 : IUnknown
{
    HRESULT GetEventThread(uint*);
    HRESULT GetEventProcess(uint*);
    HRESULT GetCurrentThreadId(uint*);
    HRESULT SetCurrentThreadId(uint);
    HRESULT GetCurrentProcessId(uint*);
    HRESULT SetCurrentProcessId(uint);
    HRESULT GetNumberThreads(uint*);
    HRESULT GetTotalNumberThreads(uint*, uint*);
    HRESULT GetThreadIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetThreadIdByProcessor(uint, uint*);
    HRESULT GetCurrentThreadDataOffset(ulong*);
    HRESULT GetThreadIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentThreadTeb(ulong*);
    HRESULT GetThreadIdByTeb(ulong, uint*);
    HRESULT GetCurrentThreadSystemId(uint*);
    HRESULT GetThreadIdBySystemId(uint, uint*);
    HRESULT GetCurrentThreadHandle(ulong*);
    HRESULT GetThreadIdByHandle(ulong, uint*);
    HRESULT GetNumberProcesses(uint*);
    HRESULT GetProcessIdsByIndex(uint, uint, uint*, uint*);
    HRESULT GetCurrentProcessDataOffset(ulong*);
    HRESULT GetProcessIdByDataOffset(ulong, uint*);
    HRESULT GetCurrentProcessPeb(ulong*);
    HRESULT GetProcessIdByPeb(ulong, uint*);
    HRESULT GetCurrentProcessSystemId(uint*);
    HRESULT GetProcessIdBySystemId(uint, uint*);
    HRESULT GetCurrentProcessHandle(ulong*);
    HRESULT GetProcessIdByHandle(ulong, uint*);
    HRESULT GetCurrentProcessExecutableName(PSTR, uint, uint*);
    HRESULT GetCurrentProcessUpTime(uint*);
    HRESULT GetImplicitThreadDataOffset(ulong*);
    HRESULT SetImplicitThreadDataOffset(ulong);
    HRESULT GetImplicitProcessDataOffset(ulong*);
    HRESULT SetImplicitProcessDataOffset(ulong);
    HRESULT GetEventSystem(uint*);
    HRESULT GetCurrentSystemId(uint*);
    HRESULT SetCurrentSystemId(uint);
    HRESULT GetNumberSystems(uint*);
    HRESULT GetSystemIdsByIndex(uint, uint, uint*);
    HRESULT GetTotalNumberThreadsAndProcesses(uint*, uint*, uint*, uint*, uint*);
    HRESULT GetCurrentSystemServer(ulong*);
    HRESULT GetSystemByServer(ulong, uint*);
    HRESULT GetCurrentSystemServerName(PSTR, uint, uint*);
    HRESULT GetCurrentProcessExecutableNameWide(PWSTR, uint, uint*);
    HRESULT GetCurrentSystemServerNameWide(PWSTR, uint, uint*);
}
alias PDEBUG_EXTENSION_INITIALIZE = HRESULT function(uint*, uint*);
alias PDEBUG_EXTENSION_UNINITIALIZE = void function();
alias PDEBUG_EXTENSION_CANUNLOAD = HRESULT function();
alias PDEBUG_EXTENSION_UNLOAD = void function();
alias PDEBUG_EXTENSION_NOTIFY = void function(uint, ulong);
alias PDEBUG_EXTENSION_CALL = HRESULT function(IDebugClient, const(char)*);
alias PDEBUG_EXTENSION_KNOWN_STRUCT = HRESULT function(uint, ulong, PSTR, PSTR, uint*);
alias PDEBUG_EXTENSION_KNOWN_STRUCT_EX = HRESULT function(IDebugClient, uint, ulong, const(char)*, PSTR, uint*);
alias PDEBUG_EXTENSION_QUERY_VALUE_NAMES = HRESULT function(IDebugClient, uint, PWSTR, uint, uint*);
alias PDEBUG_EXTENSION_PROVIDE_VALUE = HRESULT function(IDebugClient, uint, const(wchar)*, ulong*, ulong*, uint*, uint*);
alias PDEBUG_STACK_PROVIDER_BEGINTHREADSTACKRECONSTRUCTION = HRESULT function(uint, void*, uint);
alias PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK = HRESULT function(uint, DEBUG_STACK_FRAME_EX*, uint, STACK_SYM_FRAME_INFO**, uint*);
alias PDEBUG_STACK_PROVIDER_FREESTACKSYMFRAMES = HRESULT function(STACK_SYM_FRAME_INFO*);
alias PDEBUG_STACK_PROVIDER_ENDTHREADSTACKRECONSTRUCTION = HRESULT function();
// [Not Found] IID_DebugBaseEventCallbacks
interface DebugBaseEventCallbacks : IDebugEventCallbacks
{
}
// [Not Found] IID_DebugBaseEventCallbacksWide
interface DebugBaseEventCallbacksWide : IDebugEventCallbacksWide
{
}
struct Location
{
    ulong HostDefined;
    ulong Offset;
}
alias ModelObjectKind = int;
enum : int
{
    ObjectPropertyAccessor      = 0x00000000,
    ObjectContext               = 0x00000001,
    ObjectTargetObject          = 0x00000002,
    ObjectTargetObjectReference = 0x00000003,
    ObjectSynthetic             = 0x00000004,
    ObjectNoValue               = 0x00000005,
    ObjectError                 = 0x00000006,
    ObjectIntrinsic             = 0x00000007,
    ObjectMethod                = 0x00000008,
    ObjectKeyReference          = 0x00000009,
}

alias SymbolKind = int;
enum : int
{
    Symbol          = 0x00000000,
    SymbolModule    = 0x00000001,
    SymbolType      = 0x00000002,
    SymbolField     = 0x00000003,
    SymbolConstant  = 0x00000004,
    SymbolData      = 0x00000005,
    SymbolBaseClass = 0x00000006,
    SymbolPublic    = 0x00000007,
    SymbolFunction  = 0x00000008,
}

alias TypeKind = int;
enum : int
{
    TypeUDT           = 0x00000000,
    TypePointer       = 0x00000001,
    TypeMemberPointer = 0x00000002,
    TypeArray         = 0x00000003,
    TypeFunction      = 0x00000004,
    TypeTypedef       = 0x00000005,
    TypeEnum          = 0x00000006,
    TypeIntrinsic     = 0x00000007,
    TypeExtendedArray = 0x00000008,
}

alias IntrinsicKind = int;
enum : int
{
    IntrinsicVoid    = 0x00000000,
    IntrinsicBool    = 0x00000001,
    IntrinsicChar    = 0x00000002,
    IntrinsicWChar   = 0x00000003,
    IntrinsicInt     = 0x00000004,
    IntrinsicUInt    = 0x00000005,
    IntrinsicLong    = 0x00000006,
    IntrinsicULong   = 0x00000007,
    IntrinsicFloat   = 0x00000008,
    IntrinsicHRESULT = 0x00000009,
    IntrinsicChar16  = 0x0000000a,
    IntrinsicChar32  = 0x0000000b,
}

alias PointerKind = int;
enum : int
{
    PointerStandard         = 0x00000000,
    PointerReference        = 0x00000001,
    PointerRValueReference  = 0x00000002,
    PointerCXHat            = 0x00000003,
    PointerManagedReference = 0x00000004,
}

alias CallingConventionKind = int;
enum : int
{
    CallingConventionUnknown  = 0x00000000,
    CallingConventionCDecl    = 0x00000001,
    CallingConventionFastCall = 0x00000002,
    CallingConventionStdCall  = 0x00000003,
    CallingConventionSysCall  = 0x00000004,
    CallingConventionThisCall = 0x00000005,
}

alias LocationKind = int;
enum : int
{
    LocationMember   = 0x00000000,
    LocationStatic   = 0x00000001,
    LocationConstant = 0x00000002,
    LocationNone     = 0x00000003,
}

alias PreferredFormat = int;
enum : int
{
    FormatNone                   = 0x00000000,
    FormatSingleCharacter        = 0x00000001,
    FormatQuotedString           = 0x00000002,
    FormatString                 = 0x00000003,
    FormatQuotedUnicodeString    = 0x00000004,
    FormatUnicodeString          = 0x00000005,
    FormatQuotedUTF8String       = 0x00000006,
    FormatUTF8String             = 0x00000007,
    FormatBSTRString             = 0x00000008,
    FormatQuotedHString          = 0x00000009,
    FormatHString                = 0x0000000a,
    FormatRaw                    = 0x0000000b,
    FormatEnumNameOnly           = 0x0000000c,
    FormatEscapedStringWithQuote = 0x0000000d,
    FormatUTF32String            = 0x0000000e,
    FormatQuotedUTF32String      = 0x0000000f,
}

enum IID_IHostDataModelAccess = GUID(0xf2bce54e, 0x4835, 0x4f8a, [0x83, 0x6e, 0x79, 0x81, 0xe2, 0x99, 0x4, 0xd1]);
interface IHostDataModelAccess : IUnknown
{
    HRESULT GetDataModel(IDataModelManager*, IDebugHost*);
}
enum IID_IKeyStore = GUID(0xfc7557d, 0x401d, 0x4fca, [0x93, 0x65, 0xda, 0x1e, 0x98, 0x50, 0x69, 0x7c]);
interface IKeyStore : IUnknown
{
    HRESULT GetKey(const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT SetKey(const(wchar)*, IModelObject, IKeyStore);
    HRESULT GetKeyValue(const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT SetKeyValue(const(wchar)*, IModelObject);
    HRESULT ClearKeys();
}
alias RawSearchFlags = int;
enum : int
{
    RawSearchNone    = 0x00000000,
    RawSearchNoBases = 0x00000001,
}

enum IID_IModelObject = GUID(0xe28c7893, 0x3f4b, 0x4b96, [0xba, 0xca, 0x29, 0x3c, 0xdc, 0x55, 0xf4, 0x5d]);
interface IModelObject : IUnknown
{
    HRESULT GetContext(IDebugHostContext*);
    HRESULT GetKind(ModelObjectKind*);
    HRESULT GetIntrinsicValue(VARIANT*);
    HRESULT GetIntrinsicValueAs(VARENUM, VARIANT*);
    HRESULT GetKeyValue(const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT SetKeyValue(const(wchar)*, IModelObject);
    HRESULT EnumerateKeyValues(IKeyEnumerator*);
    HRESULT GetRawValue(SymbolKind, const(wchar)*, uint, IModelObject*);
    HRESULT EnumerateRawValues(SymbolKind, uint, IRawEnumerator*);
    HRESULT Dereference(IModelObject*);
    HRESULT TryCastToRuntimeType(IModelObject*);
    HRESULT GetConcept(const(GUID)*, IUnknown*, IKeyStore*);
    HRESULT GetLocation(Location*);
    HRESULT GetTypeInfo(IDebugHostType*);
    HRESULT GetTargetInfo(Location*, IDebugHostType*);
    HRESULT GetNumberOfParentModels(ulong*);
    HRESULT GetParentModel(ulong, IModelObject*, IModelObject*);
    HRESULT AddParentModel(IModelObject, IModelObject, ubyte);
    HRESULT RemoveParentModel(IModelObject);
    HRESULT GetKey(const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT GetKeyReference(const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT SetKey(const(wchar)*, IModelObject, IKeyStore);
    HRESULT ClearKeys();
    HRESULT EnumerateKeys(IKeyEnumerator*);
    HRESULT EnumerateKeyReferences(IKeyEnumerator*);
    HRESULT SetConcept(const(GUID)*, IUnknown, IKeyStore);
    HRESULT ClearConcepts();
    HRESULT GetRawReference(SymbolKind, const(wchar)*, uint, IModelObject*);
    HRESULT EnumerateRawReferences(SymbolKind, uint, IRawEnumerator*);
    HRESULT SetContextForDataModel(IModelObject, IUnknown);
    HRESULT GetContextForDataModel(IModelObject, IUnknown*);
    HRESULT Compare(IModelObject, IModelObject*);
    HRESULT IsEqualTo(IModelObject, bool*);
}
enum IID_IDataModelManager = GUID(0x73fe19f4, 0xa110, 0x4500, [0x8e, 0xd9, 0x3c, 0x28, 0x89, 0x6f, 0x50, 0x8c]);
interface IDataModelManager : IUnknown
{
    HRESULT Close();
    HRESULT CreateNoValue(IModelObject*);
    HRESULT CreateErrorObject(HRESULT, const(wchar)*, IModelObject*);
    HRESULT CreateTypedObject(IDebugHostContext, Location, IDebugHostType, IModelObject*);
    HRESULT CreateTypedObjectReference(IDebugHostContext, Location, IDebugHostType, IModelObject*);
    HRESULT CreateSyntheticObject(IDebugHostContext, IModelObject*);
    HRESULT CreateDataModelObject(IDataModelConcept, IModelObject*);
    HRESULT CreateIntrinsicObject(ModelObjectKind, VARIANT*, IModelObject*);
    HRESULT CreateTypedIntrinsicObject(VARIANT*, IDebugHostType, IModelObject*);
    HRESULT GetModelForTypeSignature(IDebugHostTypeSignature, IModelObject*);
    HRESULT GetModelForType(IDebugHostType, IModelObject*, IDebugHostTypeSignature*, IDebugHostSymbolEnumerator*);
    HRESULT RegisterModelForTypeSignature(IDebugHostTypeSignature, IModelObject);
    HRESULT UnregisterModelForTypeSignature(IModelObject, IDebugHostTypeSignature);
    HRESULT RegisterExtensionForTypeSignature(IDebugHostTypeSignature, IModelObject);
    HRESULT UnregisterExtensionForTypeSignature(IModelObject, IDebugHostTypeSignature);
    HRESULT CreateMetadataStore(IKeyStore, IKeyStore*);
    HRESULT GetRootNamespace(IModelObject*);
    HRESULT RegisterNamedModel(const(wchar)*, IModelObject);
    HRESULT UnregisterNamedModel(const(wchar)*);
    HRESULT AcquireNamedModel(const(wchar)*, IModelObject*);
}
enum IID_IModelKeyReference = GUID(0x5253dcf8, 0x5aff, 0x4c62, [0xb3, 0x2, 0x56, 0xa2, 0x89, 0xe0, 0x9, 0x98]);
interface IModelKeyReference : IUnknown
{
    HRESULT GetKeyName(BSTR*);
    HRESULT GetOriginalObject(IModelObject*);
    HRESULT GetContextObject(IModelObject*);
    HRESULT GetKey(IModelObject*, IKeyStore*);
    HRESULT GetKeyValue(IModelObject*, IKeyStore*);
    HRESULT SetKey(IModelObject, IKeyStore);
    HRESULT SetKeyValue(IModelObject);
}
enum IID_IModelPropertyAccessor = GUID(0x5a0c63d9, 0x526, 0x42b8, [0x96, 0xc, 0x95, 0x16, 0xa3, 0x25, 0x4c, 0x85]);
interface IModelPropertyAccessor : IUnknown
{
    HRESULT GetValue(const(wchar)*, IModelObject, IModelObject*);
    HRESULT SetValue(const(wchar)*, IModelObject, IModelObject);
}
enum IID_IModelMethod = GUID(0x80600c1f, 0xb90b, 0x4896, [0x82, 0xad, 0x1c, 0x0, 0x20, 0x79, 0x9, 0xe8]);
interface IModelMethod : IUnknown
{
    HRESULT Call(IModelObject, ulong, IModelObject*, IModelObject*, IKeyStore*);
}
enum IID_IKeyEnumerator = GUID(0x345fa92e, 0x5e00, 0x4319, [0x9c, 0xae, 0x97, 0x1f, 0x76, 0x1, 0xcd, 0xcf]);
interface IKeyEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(BSTR*, IModelObject*, IKeyStore*);
}
enum IID_IRawEnumerator = GUID(0xe13613f9, 0x3a3c, 0x40b5, [0x8f, 0x48, 0x1e, 0x5e, 0xbf, 0xb9, 0xb2, 0x1b]);
interface IRawEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(BSTR*, SymbolKind*, IModelObject*);
}
enum IID_IDataModelConcept = GUID(0xfcb98d1d, 0x1114, 0x4fbf, [0xb2, 0x4c, 0xef, 0xfc, 0xb5, 0xde, 0xf0, 0xd3]);
interface IDataModelConcept : IUnknown
{
    HRESULT InitializeObject(IModelObject, IDebugHostTypeSignature, IDebugHostSymbolEnumerator);
    HRESULT GetName(BSTR*);
}
enum IID_IStringDisplayableConcept = GUID(0xd28e8d70, 0x6c00, 0x4205, [0x94, 0xd, 0x50, 0x10, 0x16, 0x60, 0x1e, 0xa3]);
interface IStringDisplayableConcept : IUnknown
{
    HRESULT ToDisplayString(IModelObject, IKeyStore, BSTR*);
}
enum IID_ICodeAddressConcept = GUID(0xc7371568, 0x5c78, 0x4a00, [0xa4, 0xab, 0x6e, 0xf8, 0x82, 0x31, 0x84, 0xcb]);
interface ICodeAddressConcept : IUnknown
{
    HRESULT GetContainingSymbol(IModelObject, IDebugHostSymbol*);
}
enum IID_IModelIterator = GUID(0xe4622136, 0x927d, 0x4490, [0x87, 0x4f, 0x58, 0x1f, 0x3e, 0x4e, 0x36, 0x88]);
interface IModelIterator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(IModelObject*, ulong, IModelObject*, IKeyStore*);
}
enum IID_IIterableConcept = GUID(0xf5d49d0c, 0xb02, 0x4301, [0x9c, 0x9b, 0xb3, 0xa6, 0x3, 0x76, 0x28, 0xf3]);
interface IIterableConcept : IUnknown
{
    HRESULT GetDefaultIndexDimensionality(IModelObject, ulong*);
    HRESULT GetIterator(IModelObject, IModelIterator*);
}
enum IID_IIndexableConcept = GUID(0xd1fad99f, 0x3f53, 0x4457, [0x85, 0xc, 0x80, 0x51, 0xdf, 0x2d, 0x3f, 0xb5]);
interface IIndexableConcept : IUnknown
{
    HRESULT GetDimensionality(IModelObject, ulong*);
    HRESULT GetAt(IModelObject, ulong, IModelObject*, IModelObject*, IKeyStore*);
    HRESULT SetAt(IModelObject, ulong, IModelObject*, IModelObject);
}
enum IID_IPreferredRuntimeTypeConcept = GUID(0x9d6c1d7b, 0xa76f, 0x4618, [0x80, 0x68, 0x5f, 0x76, 0xbd, 0x9a, 0x4e, 0x8a]);
interface IPreferredRuntimeTypeConcept : IUnknown
{
    HRESULT CastToPreferredRuntimeType(IModelObject, IModelObject*);
}
enum IID_IDebugHost = GUID(0xb8c74943, 0x6b2c, 0x4eeb, [0xb5, 0xc5, 0x35, 0xd3, 0x78, 0xa6, 0xd9, 0x9d]);
interface IDebugHost : IUnknown
{
    HRESULT GetHostDefinedInterface(IUnknown*);
    HRESULT GetCurrentContext(IDebugHostContext*);
    HRESULT GetDefaultMetadata(IKeyStore*);
}
enum IID_IDebugHostContext = GUID(0xa68c70d8, 0x5ec0, 0x46e5, [0xb7, 0x75, 0x31, 0x34, 0xa4, 0x8e, 0xa2, 0xe3]);
interface IDebugHostContext : IUnknown
{
    HRESULT IsEqualTo(IDebugHostContext, bool*);
}
alias ErrorClass = int;
enum : int
{
    ErrorClassWarning = 0x00000000,
    ErrorClassError   = 0x00000001,
}

enum IID_IDebugHostErrorSink = GUID(0xc8ff0f0b, 0xfce9, 0x467e, [0x8b, 0xb3, 0x5d, 0x69, 0xef, 0x10, 0x9c, 0x0]);
interface IDebugHostErrorSink : IUnknown
{
    HRESULT ReportError(ErrorClass, HRESULT, const(wchar)*);
}
enum IID_IDebugHostSymbol = GUID(0xf819103, 0x87de, 0x4e96, [0x82, 0x77, 0xe0, 0x5c, 0xd4, 0x41, 0xfb, 0x22]);
interface IDebugHostSymbol : IUnknown
{
    HRESULT GetContext(IDebugHostContext*);
    HRESULT EnumerateChildren(SymbolKind, const(wchar)*, IDebugHostSymbolEnumerator*);
    HRESULT GetSymbolKind(SymbolKind*);
    HRESULT GetName(BSTR*);
    HRESULT GetType(IDebugHostType*);
    HRESULT GetContainingModule(IDebugHostModule*);
    HRESULT CompareAgainst(IDebugHostSymbol, uint, bool*);
}
enum IID_IDebugHostSymbolEnumerator = GUID(0x28d96c86, 0x10a3, 0x4976, [0xb1, 0x4e, 0xea, 0xef, 0x47, 0x90, 0xaa, 0x1f]);
interface IDebugHostSymbolEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(IDebugHostSymbol*);
}
enum IID_IDebugHostModule = GUID(0xc9ba3e18, 0xd070, 0x4378, [0xbb, 0xd0, 0x34, 0x61, 0x3b, 0x34, 0x6e, 0x1e]);
interface IDebugHostModule : IDebugHostSymbol
{
    HRESULT GetImageName(ubyte, BSTR*);
    HRESULT GetBaseLocation(Location*);
    HRESULT GetVersion(ulong*, ulong*);
    HRESULT FindTypeByName(const(wchar)*, IDebugHostType*);
    HRESULT FindSymbolByRVA(ulong, IDebugHostSymbol*);
    HRESULT FindSymbolByName(const(wchar)*, IDebugHostSymbol*);
}
struct ArrayDimension
{
    long LowerBound;
    ulong Length;
    ulong Stride;
}
enum IID_IDebugHostType = GUID(0x3aadc353, 0x2b14, 0x4abb, [0x98, 0x93, 0x5e, 0x3, 0x45, 0x8e, 0x7, 0xee]);
interface IDebugHostType : IDebugHostSymbol
{
    HRESULT GetTypeKind(TypeKind*);
    HRESULT GetSize(ulong*);
    HRESULT GetBaseType(IDebugHostType*);
    HRESULT GetHashCode(uint*);
    HRESULT GetIntrinsicType(IntrinsicKind*, ushort*);
    HRESULT GetBitField(uint*, uint*);
    HRESULT GetPointerKind(PointerKind*);
    HRESULT GetMemberType(IDebugHostType*);
    HRESULT CreatePointerTo(PointerKind, IDebugHostType*);
    HRESULT GetArrayDimensionality(ulong*);
    HRESULT GetArrayDimensions(ulong, ArrayDimension*);
    HRESULT CreateArrayOf(ulong, ArrayDimension*, IDebugHostType*);
    HRESULT GetFunctionCallingConvention(CallingConventionKind*);
    HRESULT GetFunctionReturnType(IDebugHostType*);
    HRESULT GetFunctionParameterTypeCount(ulong*);
    HRESULT GetFunctionParameterTypeAt(ulong, IDebugHostType*);
    HRESULT IsGeneric(bool*);
    HRESULT GetGenericArgumentCount(ulong*);
    HRESULT GetGenericArgumentAt(ulong, IDebugHostSymbol*);
}
enum IID_IDebugHostConstant = GUID(0x62787edc, 0xfa76, 0x4690, [0xbd, 0x71, 0x5e, 0x8c, 0x3e, 0x29, 0x37, 0xec]);
interface IDebugHostConstant : IDebugHostSymbol
{
    HRESULT GetValue(VARIANT*);
}
enum IID_IDebugHostField = GUID(0xe06f6495, 0x16bc, 0x4cc9, [0xb1, 0x1d, 0x2a, 0x6b, 0x23, 0xfa, 0x72, 0xf3]);
interface IDebugHostField : IDebugHostSymbol
{
    HRESULT GetLocationKind(LocationKind*);
    HRESULT GetOffset(ulong*);
    HRESULT GetLocation(Location*);
    HRESULT GetValue(VARIANT*);
}
enum IID_IDebugHostData = GUID(0xa3d64993, 0x826c, 0x44fa, [0x89, 0x7d, 0x92, 0x6f, 0x2f, 0xe7, 0xad, 0xb]);
interface IDebugHostData : IDebugHostSymbol
{
    HRESULT GetLocationKind(LocationKind*);
    HRESULT GetLocation(Location*);
    HRESULT GetValue(VARIANT*);
}
enum IID_IDebugHostPublic = GUID(0x6c597ac9, 0xfb4d, 0x4f6d, [0x9f, 0x39, 0x22, 0x48, 0x85, 0x39, 0xf8, 0xf4]);
interface IDebugHostPublic : IDebugHostSymbol
{
    HRESULT GetLocationKind(LocationKind*);
    HRESULT GetLocation(Location*);
}
enum IID_IDebugHostBaseClass = GUID(0xb94d57d2, 0x390b, 0x40f7, [0xb5, 0xb4, 0xb6, 0xdb, 0x89, 0x7d, 0x97, 0x4b]);
interface IDebugHostBaseClass : IDebugHostSymbol
{
    HRESULT GetOffset(ulong*);
}
enum IID_IDebugHostSymbols = GUID(0x854fd751, 0xc2e1, 0x4eb2, [0xb5, 0x25, 0x66, 0x19, 0xcb, 0x97, 0xa5, 0x88]);
interface IDebugHostSymbols : IUnknown
{
    HRESULT CreateModuleSignature(const(wchar)*, const(wchar)*, const(wchar)*, IDebugHostModuleSignature*);
    HRESULT CreateTypeSignature(const(wchar)*, IDebugHostModule, IDebugHostTypeSignature*);
    HRESULT CreateTypeSignatureForModuleRange(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IDebugHostTypeSignature*);
    HRESULT EnumerateModules(IDebugHostContext, IDebugHostSymbolEnumerator*);
    HRESULT FindModuleByName(IDebugHostContext, const(wchar)*, IDebugHostModule*);
    HRESULT FindModuleByLocation(IDebugHostContext, Location, IDebugHostModule*);
    HRESULT GetMostDerivedObject(IDebugHostContext, Location, IDebugHostType, Location*, IDebugHostType*);
}
enum IID_IDebugHostMemory = GUID(0x212149c9, 0x9183, 0x4a3e, [0xb0, 0xe, 0x4f, 0xd1, 0xdc, 0x95, 0x33, 0x9b]);
interface IDebugHostMemory : IUnknown
{
    HRESULT ReadBytes(IDebugHostContext, Location, void*, ulong, ulong*);
    HRESULT WriteBytes(IDebugHostContext, Location, void*, ulong, ulong*);
    HRESULT ReadPointers(IDebugHostContext, Location, ulong, ulong*);
    HRESULT WritePointers(IDebugHostContext, Location, ulong, ulong*);
    HRESULT GetDisplayStringForLocation(IDebugHostContext, Location, ubyte, BSTR*);
}
enum IID_IDebugHostEvaluator = GUID(0xfef9a21, 0x577e, 0x4997, [0xac, 0x7b, 0x1c, 0x48, 0x83, 0x24, 0x1d, 0x99]);
interface IDebugHostEvaluator : IUnknown
{
    HRESULT EvaluateExpression(IDebugHostContext, const(wchar)*, IModelObject, IModelObject*, IKeyStore*);
    HRESULT EvaluateExtendedExpression(IDebugHostContext, const(wchar)*, IModelObject, IModelObject*, IKeyStore*);
}
alias SignatureComparison = int;
enum : int
{
    Unrelated    = 0x00000000,
    Ambiguous    = 0x00000001,
    LessSpecific = 0x00000002,
    MoreSpecific = 0x00000003,
    Identical    = 0x00000004,
}

enum IID_IDebugHostModuleSignature = GUID(0x31e53a5a, 0x1ee, 0x4bbb, [0xb8, 0x99, 0x4b, 0x46, 0xae, 0x7d, 0x59, 0x5c]);
interface IDebugHostModuleSignature : IUnknown
{
    HRESULT IsMatch(IDebugHostModule, bool*);
}
enum IID_IDebugHostTypeSignature = GUID(0x3aadc353, 0x2b14, 0x4abb, [0x98, 0x93, 0x5e, 0x3, 0x45, 0x8e, 0x7, 0xee]);
interface IDebugHostTypeSignature : IUnknown
{
    HRESULT GetHashCode(uint*);
    HRESULT IsMatch(IDebugHostType, bool*, IDebugHostSymbolEnumerator*);
    HRESULT CompareAgainst(IDebugHostTypeSignature, SignatureComparison*);
}
alias SymbolSearchOptions = int;
enum : int
{
    SymbolSearchNone            = 0x00000000,
    SymbolSearchCompletion      = 0x00000001,
    SymbolSearchCaseInsensitive = 0x00000002,
}

alias LanguageKind = int;
enum : int
{
    LanguageUnknown  = 0x00000000,
    LanguageC        = 0x00000001,
    LanguageCPP      = 0x00000002,
    LanguageAssembly = 0x00000003,
}

enum IID_IDebugHostSymbol2 = GUID(0x21515b67, 0x6720, 0x4257, [0x8a, 0x68, 0x7, 0x7d, 0xc9, 0x44, 0x47, 0x1c]);
interface IDebugHostSymbol2 : IDebugHostSymbol
{
    HRESULT GetLanguage(LanguageKind*);
}
alias VarArgsKind = int;
enum : int
{
    VarArgsNone   = 0x00000000,
    VarArgsCStyle = 0x00000001,
}

enum IID_IDebugHostType2 = GUID(0xb28632b9, 0x8506, 0x4676, [0x87, 0xce, 0x8f, 0x7e, 0x5, 0xe5, 0x98, 0x76]);
interface IDebugHostType2 : IDebugHostType
{
    HRESULT IsTypedef(bool*);
    HRESULT GetTypedefBaseType(IDebugHostType2*);
    HRESULT GetTypedefFinalBaseType(IDebugHostType2*);
    HRESULT GetFunctionVarArgsKind(VarArgsKind*);
    HRESULT GetFunctionInstancePointerType(IDebugHostType2*);
}
enum IID_IDebugHostStatus = GUID(0x4f3e1ce2, 0x86b2, 0x4c7a, [0x9c, 0x65, 0xd0, 0xa9, 0xd0, 0xee, 0xcf, 0x44]);
interface IDebugHostStatus : IUnknown
{
    HRESULT PollUserInterrupt(bool*);
}
enum IID_IDataModelScriptClient = GUID(0x3b362b0e, 0x89f0, 0x46c6, [0xa6, 0x63, 0xdf, 0xdc, 0x95, 0x19, 0x4a, 0xef]);
interface IDataModelScriptClient : IUnknown
{
    HRESULT ReportError(ErrorClass, HRESULT, const(wchar)*, uint, uint);
}
enum IID_IDataModelScriptTemplate = GUID(0x1303dec4, 0xfa3b, 0x4f1b, [0x92, 0x24, 0xb9, 0x53, 0xd1, 0x6b, 0xab, 0xb5]);
interface IDataModelScriptTemplate : IUnknown
{
    HRESULT GetName(BSTR*);
    HRESULT GetDescription(BSTR*);
    HRESULT GetContent(IStream*);
}
enum IID_IDataModelScript = GUID(0x7b4d30fc, 0xb14a, 0x49f8, [0x8d, 0x87, 0xd9, 0xa1, 0x48, 0xc, 0x97, 0xf7]);
interface IDataModelScript : IUnknown
{
    HRESULT GetName(BSTR*);
    HRESULT Rename(const(wchar)*);
    HRESULT Populate(IStream);
    HRESULT Execute(IDataModelScriptClient);
    HRESULT Unlink();
    HRESULT IsInvocable(bool*);
    HRESULT InvokeMain(IDataModelScriptClient);
}
enum IID_IDataModelScriptTemplateEnumerator = GUID(0x69ce6ae2, 0x2268, 0x4e6f, [0xb0, 0x62, 0x20, 0xce, 0x62, 0xbf, 0xe6, 0x77]);
interface IDataModelScriptTemplateEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(IDataModelScriptTemplate*);
}
enum IID_IDataModelScriptProvider = GUID(0x513461e0, 0x4fca, 0x48ce, [0x86, 0x58, 0x32, 0xf3, 0xe2, 0x5, 0x6f, 0x3b]);
interface IDataModelScriptProvider : IUnknown
{
    HRESULT GetName(BSTR*);
    HRESULT GetExtension(BSTR*);
    HRESULT CreateScript(IDataModelScript*);
    HRESULT GetDefaultTemplateContent(IDataModelScriptTemplate*);
    HRESULT EnumerateTemplates(IDataModelScriptTemplateEnumerator*);
}
enum IID_IDataModelScriptProviderEnumerator = GUID(0x95ba00e2, 0x704a, 0x4fe2, [0xa8, 0xf1, 0xa7, 0xe7, 0xd8, 0xfb, 0x9, 0x41]);
interface IDataModelScriptProviderEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(IDataModelScriptProvider*);
}
enum IID_IDataModelScriptManager = GUID(0x6fd11e33, 0xe5ad, 0x410b, [0x80, 0x11, 0x68, 0xc6, 0xbc, 0x4b, 0xf8, 0xd]);
interface IDataModelScriptManager : IUnknown
{
    HRESULT GetDefaultNameBinder(IDataModelNameBinder*);
    HRESULT RegisterScriptProvider(IDataModelScriptProvider);
    HRESULT UnregisterScriptProvider(IDataModelScriptProvider);
    HRESULT FindProviderForScriptType(const(wchar)*, IDataModelScriptProvider*);
    HRESULT FindProviderForScriptExtension(const(wchar)*, IDataModelScriptProvider*);
    HRESULT EnumerateScriptProviders(IDataModelScriptProviderEnumerator*);
}
enum IID_IDynamicKeyProviderConcept = GUID(0xe7983fa1, 0x80a7, 0x498c, [0x98, 0x8f, 0x51, 0x8d, 0xdc, 0x5d, 0x40, 0x25]);
interface IDynamicKeyProviderConcept : IUnknown
{
    HRESULT GetKey(IModelObject, const(wchar)*, IModelObject*, IKeyStore*, bool*);
    HRESULT SetKey(IModelObject, const(wchar)*, IModelObject, IKeyStore);
    HRESULT EnumerateKeys(IModelObject, IKeyEnumerator*);
}
enum IID_IDynamicConceptProviderConcept = GUID(0x95a7f7dd, 0x602e, 0x483f, [0x9d, 0x6, 0xa1, 0x5c, 0xe, 0xe1, 0x31, 0x74]);
interface IDynamicConceptProviderConcept : IUnknown
{
    HRESULT GetConcept(IModelObject, const(GUID)*, IUnknown*, IKeyStore*, bool*);
    HRESULT SetConcept(IModelObject, const(GUID)*, IUnknown, IKeyStore);
    HRESULT NotifyParent(IModelObject);
    HRESULT NotifyParentChange(IModelObject);
    HRESULT NotifyDestruct();
}
alias ScriptChangeKind = int;
enum : int
{
    ScriptRename = 0x00000000,
}

enum IID_IDataModelScriptHostContext = GUID(0x14d366a, 0x1f23, 0x4981, [0x92, 0x19, 0xb2, 0xdb, 0x8b, 0x40, 0x20, 0x54]);
interface IDataModelScriptHostContext : IUnknown
{
    HRESULT NotifyScriptChange(IDataModelScript, ScriptChangeKind);
    HRESULT GetNamespaceObject(IModelObject*);
}
enum IID_IDebugHostScriptHost = GUID(0xb70334a4, 0xb92c, 0x4570, [0x93, 0xa1, 0xd3, 0xeb, 0x68, 0x66, 0x49, 0xa0]);
interface IDebugHostScriptHost : IUnknown
{
    HRESULT CreateContext(IDataModelScript, IDataModelScriptHostContext*);
}
enum IID_IDataModelNameBinder = GUID(0xaf352b7b, 0x8292, 0x4c01, [0xb3, 0x60, 0x2d, 0xc3, 0x69, 0x6c, 0x65, 0xe7]);
interface IDataModelNameBinder : IUnknown
{
    HRESULT BindValue(IModelObject, const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT BindReference(IModelObject, const(wchar)*, IModelObject*, IKeyStore*);
    HRESULT EnumerateValues(IModelObject, IKeyEnumerator*);
    HRESULT EnumerateReferences(IModelObject, IKeyEnumerator*);
}
enum IID_IModelKeyReference2 = GUID(0x80e2f7c5, 0x7159, 0x4e92, [0x88, 0x7e, 0x7e, 0x3, 0x47, 0xe8, 0x84, 0x6]);
interface IModelKeyReference2 : IModelKeyReference
{
    HRESULT OverrideContextObject(IModelObject);
}
enum IID_IDebugHostEvaluator2 = GUID(0xa117a435, 0x1fb4, 0x4092, [0xa2, 0xab, 0xa9, 0x29, 0x57, 0x6c, 0x1e, 0x87]);
interface IDebugHostEvaluator2 : IDebugHostEvaluator
{
    HRESULT AssignTo(IModelObject, IModelObject, IModelObject*, IKeyStore*);
}
enum IID_IDataModelManager2 = GUID(0xf412c5ea, 0x2284, 0x4622, [0xa6, 0x60, 0xa6, 0x97, 0x16, 0xd, 0x33, 0x12]);
interface IDataModelManager2 : IDataModelManager
{
    HRESULT AcquireSubNamespace(const(wchar)*, const(wchar)*, const(wchar)*, IKeyStore, IModelObject*);
    HRESULT CreateTypedIntrinsicObjectEx(IDebugHostContext, VARIANT*, IDebugHostType, IModelObject*);
}
enum IID_IDebugHostMemory2 = GUID(0xeea033de, 0x38f6, 0x416b, [0xa2, 0x51, 0x1d, 0x37, 0x71, 0x0, 0x12, 0x70]);
interface IDebugHostMemory2 : IDebugHostMemory
{
    HRESULT LinearizeLocation(IDebugHostContext, Location, Location*);
}
enum IID_IDebugHostExtensibility = GUID(0x3c2b24e1, 0x11d0, 0x4f86, [0x8a, 0xe5, 0x4d, 0xf1, 0x66, 0xf7, 0x32, 0x53]);
interface IDebugHostExtensibility : IUnknown
{
    HRESULT CreateFunctionAlias(const(wchar)*, IModelObject);
    HRESULT DestroyFunctionAlias(const(wchar)*);
}
alias ScriptDebugState = int;
enum : int
{
    ScriptDebugNoDebugger   = 0x00000000,
    ScriptDebugNotExecuting = 0x00000001,
    ScriptDebugExecuting    = 0x00000002,
    ScriptDebugBreak        = 0x00000003,
}

alias ScriptDebugEventFilter = int;
enum : int
{
    ScriptDebugEventFilterEntry              = 0x00000000,
    ScriptDebugEventFilterException          = 0x00000001,
    ScriptDebugEventFilterUnhandledException = 0x00000002,
    ScriptDebugEventFilterAbort              = 0x00000003,
}

alias ScriptDebugEvent = int;
enum : int
{
    ScriptDebugBreakpoint = 0x00000000,
    ScriptDebugStep       = 0x00000001,
    ScriptDebugException  = 0x00000002,
    ScriptDebugAsyncBreak = 0x00000003,
}

alias ScriptExecutionKind = int;
enum : int
{
    ScriptExecutionNormal   = 0x00000000,
    ScriptExecutionStepIn   = 0x00000001,
    ScriptExecutionStepOut  = 0x00000002,
    ScriptExecutionStepOver = 0x00000003,
}

struct ScriptDebugPosition
{
    uint Line;
    uint Column;
}
struct ScriptDebugEventInformation
{
    ScriptDebugEvent DebugEvent;
    ScriptDebugPosition EventPosition;
    ScriptDebugPosition EventSpanEnd;
    union _u_e__Union
    {
        struct _ExceptionInformation_e__Struct
        {
            ubyte IsUncaught;
        }
        struct _BreakpointInformation_e__Struct
        {
            ulong BreakpointId;
        }
    }
}
enum IID_IDataModelScriptDebugClient = GUID(0x53159b6d, 0xd4c4, 0x471b, [0xa8, 0x63, 0x5b, 0x11, 0xc, 0xa8, 0x0, 0xca]);
interface IDataModelScriptDebugClient : IUnknown
{
    HRESULT NotifyDebugEvent(ScriptDebugEventInformation*, IDataModelScript, IModelObject, ScriptExecutionKind*);
}
enum IID_IDataModelScriptDebugVariableSetEnumerator = GUID(0xf9feed7, 0xd045, 0x4ac3, [0x98, 0xa8, 0xa9, 0x89, 0x42, 0xcf, 0x6a, 0x35]);
interface IDataModelScriptDebugVariableSetEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(BSTR*, IModelObject*, IKeyStore*);
}
enum IID_IDataModelScriptDebugStackFrame = GUID(0xdec6ed5e, 0x6360, 0x4941, [0xab, 0x4c, 0xa2, 0x64, 0x9, 0xde, 0x4f, 0x82]);
interface IDataModelScriptDebugStackFrame : IUnknown
{
    HRESULT GetName(BSTR*);
    HRESULT GetPosition(ScriptDebugPosition*, ScriptDebugPosition*, BSTR*);
    HRESULT IsTransitionPoint(bool*);
    HRESULT GetTransition(IDataModelScript*, bool*);
    HRESULT Evaluate(const(wchar)*, IModelObject*);
    HRESULT EnumerateLocals(IDataModelScriptDebugVariableSetEnumerator*);
    HRESULT EnumerateArguments(IDataModelScriptDebugVariableSetEnumerator*);
}
enum IID_IDataModelScriptDebugStack = GUID(0x51364dd, 0xe449, 0x443e, [0x97, 0x62, 0xfe, 0x57, 0x8f, 0x4a, 0x54, 0x73]);
interface IDataModelScriptDebugStack : IUnknown
{
    ulong GetFrameCount();
    HRESULT GetStackFrame(ulong, IDataModelScriptDebugStackFrame*);
}
enum IID_IDataModelScriptDebugBreakpoint = GUID(0x6bb27b35, 0x2e6, 0x47cb, [0x90, 0xa0, 0x53, 0x71, 0x24, 0x40, 0x32, 0xde]);
interface IDataModelScriptDebugBreakpoint : IUnknown
{
    ulong GetId();
    bool IsEnabled();
    void Enable();
    void Disable();
    void Remove();
    HRESULT GetPosition(ScriptDebugPosition*, ScriptDebugPosition*, BSTR*);
}
enum IID_IDataModelScriptDebugBreakpointEnumerator = GUID(0x39484a75, 0xb4f3, 0x4799, [0x86, 0xda, 0x69, 0x1a, 0xfa, 0x57, 0xb2, 0x99]);
interface IDataModelScriptDebugBreakpointEnumerator : IUnknown
{
    HRESULT Reset();
    HRESULT GetNext(IDataModelScriptDebugBreakpoint*);
}
enum IID_IDataModelScriptDebug = GUID(0xde8e0945, 0x9750, 0x4471, [0xab, 0x76, 0xa8, 0xf7, 0x9d, 0x6e, 0xc3, 0x50]);
interface IDataModelScriptDebug : IUnknown
{
    ScriptDebugState GetDebugState();
    HRESULT GetCurrentPosition(ScriptDebugPosition*, ScriptDebugPosition*, BSTR*);
    HRESULT GetStack(IDataModelScriptDebugStack*);
    HRESULT SetBreakpoint(uint, uint, IDataModelScriptDebugBreakpoint*);
    HRESULT FindBreakpointById(ulong, IDataModelScriptDebugBreakpoint*);
    HRESULT EnumerateBreakpoints(IDataModelScriptDebugBreakpointEnumerator*);
    HRESULT GetEventFilter(ScriptDebugEventFilter, bool*);
    HRESULT SetEventFilter(ScriptDebugEventFilter, ubyte);
    HRESULT StartDebugging(IDataModelScriptDebugClient);
    HRESULT StopDebugging(IDataModelScriptDebugClient);
}
enum IID_IDataModelScriptDebug2 = GUID(0xcbb10ed3, 0x839e, 0x426c, [0x92, 0x43, 0xe2, 0x35, 0x35, 0xc1, 0xae, 0x1a]);
interface IDataModelScriptDebug2 : IDataModelScriptDebug
{
    HRESULT SetBreakpointAtFunction(const(wchar)*, IDataModelScriptDebugBreakpoint*);
}
enum IID_IDebugHostModule2 = GUID(0xb51887e8, 0xbcd0, 0x4e8f, [0xa8, 0xc7, 0x43, 0x43, 0x98, 0xb7, 0x8c, 0x37]);
interface IDebugHostModule2 : IDebugHostModule
{
    HRESULT FindContainingSymbolByRVA(ulong, IDebugHostSymbol*, ulong*);
}
enum IID_IComparableConcept = GUID(0xa7830646, 0x9f0c, 0x4a31, [0xba, 0x19, 0x50, 0x3f, 0x33, 0xe6, 0xc8, 0xa3]);
interface IComparableConcept : IUnknown
{
    HRESULT CompareObjects(IModelObject, IModelObject, int*);
}
enum IID_IEquatableConcept = GUID(0xc52d5d3d, 0x609d, 0x4d5d, [0x8a, 0x82, 0x46, 0xb0, 0xac, 0xde, 0xc4, 0xf4]);
interface IEquatableConcept : IUnknown
{
    HRESULT AreObjectsEqual(IModelObject, IModelObject, bool*);
}
alias PWINDBG_OUTPUT_ROUTINE = void function(const(char)*);
alias PWINDBG_GET_EXPRESSION = ulong function(const(char)*);
alias PWINDBG_GET_EXPRESSION32 = uint function(const(char)*);
alias PWINDBG_GET_EXPRESSION64 = ulong function(const(char)*);
alias PWINDBG_GET_SYMBOL = void function(void*, PSTR, ulong*);
alias PWINDBG_GET_SYMBOL32 = void function(uint, PSTR, uint*);
alias PWINDBG_GET_SYMBOL64 = void function(ulong, PSTR, ulong*);
alias PWINDBG_DISASM = uint function(ulong*, const(char)*, uint);
alias PWINDBG_DISASM32 = uint function(uint*, const(char)*, uint);
alias PWINDBG_DISASM64 = uint function(ulong*, const(char)*, uint);
alias PWINDBG_CHECK_CONTROL_C = uint function();
alias PWINDBG_READ_PROCESS_MEMORY_ROUTINE = uint function(ulong, void*, uint, uint*);
alias PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 = uint function(uint, void*, uint, uint*);
alias PWINDBG_READ_PROCESS_MEMORY_ROUTINE64 = uint function(ulong, void*, uint, uint*);
alias PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE = uint function(ulong, const(void)*, uint, uint*);
alias PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE32 = uint function(uint, const(void)*, uint, uint*);
alias PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE64 = uint function(ulong, const(void)*, uint, uint*);
alias PWINDBG_GET_THREAD_CONTEXT_ROUTINE = uint function(uint, CONTEXT*, uint);
alias PWINDBG_SET_THREAD_CONTEXT_ROUTINE = uint function(uint, CONTEXT*, uint);
alias PWINDBG_IOCTL_ROUTINE = uint function(ushort, void*, uint);
alias PWINDBG_OLDKD_READ_PHYSICAL_MEMORY = uint function(ulong, void*, uint, uint*);
alias PWINDBG_OLDKD_WRITE_PHYSICAL_MEMORY = uint function(ulong, void*, uint, uint*);
struct EXTSTACKTRACE
{
    uint FramePointer;
    uint ProgramCounter;
    uint ReturnAddress;
    uint[4] Args;
}
struct EXTSTACKTRACE32
{
    uint FramePointer;
    uint ProgramCounter;
    uint ReturnAddress;
    uint[4] Args;
}
struct EXTSTACKTRACE64
{
    ulong FramePointer;
    ulong ProgramCounter;
    ulong ReturnAddress;
    ulong[4] Args;
}
alias PWINDBG_STACKTRACE_ROUTINE = uint function(uint, uint, uint, EXTSTACKTRACE*, uint);
alias PWINDBG_STACKTRACE_ROUTINE32 = uint function(uint, uint, uint, EXTSTACKTRACE32*, uint);
alias PWINDBG_STACKTRACE_ROUTINE64 = uint function(ulong, ulong, ulong, EXTSTACKTRACE64*, uint);
struct WINDBG_EXTENSION_APIS
{
    uint nSize;
    PWINDBG_OUTPUT_ROUTINE lpOutputRoutine;
    PWINDBG_GET_EXPRESSION lpGetExpressionRoutine;
    PWINDBG_GET_SYMBOL lpGetSymbolRoutine;
    PWINDBG_DISASM lpDisasmRoutine;
    PWINDBG_CHECK_CONTROL_C lpCheckControlCRoutine;
    PWINDBG_READ_PROCESS_MEMORY_ROUTINE lpReadProcessMemoryRoutine;
    PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE lpWriteProcessMemoryRoutine;
    PWINDBG_GET_THREAD_CONTEXT_ROUTINE lpGetThreadContextRoutine;
    PWINDBG_SET_THREAD_CONTEXT_ROUTINE lpSetThreadContextRoutine;
    PWINDBG_IOCTL_ROUTINE lpIoctlRoutine;
    PWINDBG_STACKTRACE_ROUTINE lpStackTraceRoutine;
}
struct WINDBG_EXTENSION_APIS32
{
    uint nSize;
    PWINDBG_OUTPUT_ROUTINE lpOutputRoutine;
    PWINDBG_GET_EXPRESSION32 lpGetExpressionRoutine;
    PWINDBG_GET_SYMBOL32 lpGetSymbolRoutine;
    PWINDBG_DISASM32 lpDisasmRoutine;
    PWINDBG_CHECK_CONTROL_C lpCheckControlCRoutine;
    PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 lpReadProcessMemoryRoutine;
    PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE32 lpWriteProcessMemoryRoutine;
    PWINDBG_GET_THREAD_CONTEXT_ROUTINE lpGetThreadContextRoutine;
    PWINDBG_SET_THREAD_CONTEXT_ROUTINE lpSetThreadContextRoutine;
    PWINDBG_IOCTL_ROUTINE lpIoctlRoutine;
    PWINDBG_STACKTRACE_ROUTINE32 lpStackTraceRoutine;
}
struct WINDBG_EXTENSION_APIS64
{
    uint nSize;
    PWINDBG_OUTPUT_ROUTINE lpOutputRoutine;
    PWINDBG_GET_EXPRESSION64 lpGetExpressionRoutine;
    PWINDBG_GET_SYMBOL64 lpGetSymbolRoutine;
    PWINDBG_DISASM64 lpDisasmRoutine;
    PWINDBG_CHECK_CONTROL_C lpCheckControlCRoutine;
    PWINDBG_READ_PROCESS_MEMORY_ROUTINE64 lpReadProcessMemoryRoutine;
    PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE64 lpWriteProcessMemoryRoutine;
    PWINDBG_GET_THREAD_CONTEXT_ROUTINE lpGetThreadContextRoutine;
    PWINDBG_SET_THREAD_CONTEXT_ROUTINE lpSetThreadContextRoutine;
    PWINDBG_IOCTL_ROUTINE lpIoctlRoutine;
    PWINDBG_STACKTRACE_ROUTINE64 lpStackTraceRoutine;
}
struct WINDBG_OLD_EXTENSION_APIS
{
    uint nSize;
    PWINDBG_OUTPUT_ROUTINE lpOutputRoutine;
    PWINDBG_GET_EXPRESSION lpGetExpressionRoutine;
    PWINDBG_GET_SYMBOL lpGetSymbolRoutine;
    PWINDBG_DISASM lpDisasmRoutine;
    PWINDBG_CHECK_CONTROL_C lpCheckControlCRoutine;
}
struct WINDBG_OLDKD_EXTENSION_APIS
{
    uint nSize;
    PWINDBG_OUTPUT_ROUTINE lpOutputRoutine;
    PWINDBG_GET_EXPRESSION32 lpGetExpressionRoutine;
    PWINDBG_GET_SYMBOL32 lpGetSymbolRoutine;
    PWINDBG_DISASM32 lpDisasmRoutine;
    PWINDBG_CHECK_CONTROL_C lpCheckControlCRoutine;
    PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 lpReadVirtualMemRoutine;
    PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE32 lpWriteVirtualMemRoutine;
    PWINDBG_OLDKD_READ_PHYSICAL_MEMORY lpReadPhysicalMemRoutine;
    PWINDBG_OLDKD_WRITE_PHYSICAL_MEMORY lpWritePhysicalMemRoutine;
}
alias PWINDBG_OLD_EXTENSION_ROUTINE = void function(uint, WINDBG_EXTENSION_APIS*, const(char)*);
alias PWINDBG_EXTENSION_ROUTINE = void function(HANDLE, HANDLE, uint, uint, const(char)*);
alias PWINDBG_EXTENSION_ROUTINE32 = void function(HANDLE, HANDLE, uint, uint, const(char)*);
alias PWINDBG_EXTENSION_ROUTINE64 = void function(HANDLE, HANDLE, ulong, uint, const(char)*);
alias PWINDBG_OLDKD_EXTENSION_ROUTINE = void function(uint, WINDBG_OLDKD_EXTENSION_APIS*, const(char)*);
alias PWINDBG_EXTENSION_DLL_INIT = void function(WINDBG_EXTENSION_APIS*, ushort, ushort);
alias PWINDBG_EXTENSION_DLL_INIT32 = void function(WINDBG_EXTENSION_APIS32*, ushort, ushort);
alias PWINDBG_EXTENSION_DLL_INIT64 = void function(WINDBG_EXTENSION_APIS64*, ushort, ushort);
alias PWINDBG_CHECK_VERSION = uint function();
struct EXT_API_VERSION
{
    ushort MajorVersion;
    ushort MinorVersion;
    ushort Revision;
    ushort Reserved;
}
alias PWINDBG_EXTENSION_API_VERSION = EXT_API_VERSION* function();
struct PROCESSORINFO
{
    ushort Processor;
    ushort NumberProcessors;
}
struct READCONTROLSPACE
{
    ushort Processor;
    uint Address;
    uint BufLen;
    ubyte[1] Buf;
}
struct READCONTROLSPACE32
{
    ushort Processor;
    uint Address;
    uint BufLen;
    ubyte[1] Buf;
}
struct READCONTROLSPACE64
{
    ushort Processor;
    ulong Address;
    uint BufLen;
    ubyte[1] Buf;
}
struct IOSPACE
{
    uint Address;
    uint Length;
    uint Data;
}
struct IOSPACE32
{
    uint Address;
    uint Length;
    uint Data;
}
struct IOSPACE64
{
    ulong Address;
    uint Length;
    uint Data;
}
struct IOSPACE_EX
{
    uint Address;
    uint Length;
    uint Data;
    uint InterfaceType;
    uint BusNumber;
    uint AddressSpace;
}
struct IOSPACE_EX32
{
    uint Address;
    uint Length;
    uint Data;
    uint InterfaceType;
    uint BusNumber;
    uint AddressSpace;
}
struct IOSPACE_EX64
{
    ulong Address;
    uint Length;
    uint Data;
    uint InterfaceType;
    uint BusNumber;
    uint AddressSpace;
}
struct BUSDATA
{
    uint BusDataType;
    uint BusNumber;
    uint SlotNumber;
    void* Buffer;
    uint Offset;
    uint Length;
}
struct SEARCHMEMORY
{
    ulong SearchAddress;
    ulong SearchLength;
    ulong FoundAddress;
    uint PatternLength;
    void* Pattern;
}
struct PHYSICAL
{
    ulong Address;
    uint BufLen;
    ubyte[1] Buf;
}
struct PHYSICAL_WITH_FLAGS
{
    ulong Address;
    uint BufLen;
    uint Flags;
    ubyte[1] Buf;
}
struct READ_WRITE_MSR
{
    uint Msr;
    long Value;
}
struct GET_SET_SYMPATH
{
    const(char)* Args;
    PSTR Result;
    int Length;
}
struct GET_TEB_ADDRESS
{
    ulong Address;
}
struct GET_PEB_ADDRESS
{
    ulong CurrentThread;
    ulong Address;
}
struct GET_CURRENT_THREAD_ADDRESS
{
    uint Processor;
    ulong Address;
}
struct GET_CURRENT_PROCESS_ADDRESS
{
    uint Processor;
    ulong CurrentThread;
    ulong Address;
}
struct GET_INPUT_LINE
{
    const(char)* Prompt;
    PSTR Buffer;
    uint BufferSize;
    uint InputSize;
}
struct GET_EXPRESSION_EX
{
    const(char)* Expression;
    const(char)* Remainder;
    ulong Value;
}
struct TRANSLATE_VIRTUAL_TO_PHYSICAL
{
    ulong Virtual;
    ulong Physical;
}
struct VIRTUAL_TO_PHYSICAL
{
    uint Status;
    uint Size;
    ulong PdeAddress;
    ulong Virtual;
    ulong Physical;
}
struct PHYSICAL_TO_VIRTUAL
{
    uint Status;
    uint Size;
    ulong PdeAddress;
}
struct GET_CONTEXT_EX
{
    uint Status;
    uint ContextSize;
    void* pContext;
}
struct POINTER_SEARCH_PHYSICAL
{
    ulong Offset;
    ulong Length;
    ulong PointerMin;
    ulong PointerMax;
    uint Flags;
    ulong* MatchOffsets;
    uint MatchOffsetsSize;
    uint MatchOffsetsCount;
}
struct WDBGEXTS_THREAD_OS_INFO
{
    uint ThreadId;
    uint ExitStatus;
    uint PriorityClass;
    uint Priority;
    ulong CreateTime;
    ulong ExitTime;
    ulong KernelTime;
    ulong UserTime;
    ulong StartOffset;
    ulong Affinity;
}
struct WDBGEXTS_CLR_DATA_INTERFACE
{
    const(GUID)* Iid;
    void* Iface;
}
struct EXT_MATCH_PATTERN_A
{
    const(char)* Str;
    const(char)* Pattern;
    uint CaseSensitive;
}
struct EXT_FIND_FILE
{
    const(wchar)* FileName;
    ulong IndexedSize;
    uint ImageTimeDateStamp;
    uint ImageCheckSum;
    void* ExtraInfo;
    uint ExtraInfoSize;
    uint Flags;
    void* FileMapping;
    ulong FileMappingSize;
    HANDLE FileHandle;
    PWSTR FoundFileName;
    uint FoundFileNameChars;
}
struct DEBUG_TYPED_DATA
{
    ulong ModBase;
    ulong Offset;
    ulong EngineHandle;
    ulong Data;
    uint Size;
    uint Flags;
    uint TypeId;
    uint BaseTypeId;
    uint Tag;
    uint Register;
    ulong[9] Internal;
}
alias EXT_TDOP = int;
enum : int
{
    EXT_TDOP_COPY                         = 0x00000000,
    EXT_TDOP_RELEASE                      = 0x00000001,
    EXT_TDOP_SET_FROM_EXPR                = 0x00000002,
    EXT_TDOP_SET_FROM_U64_EXPR            = 0x00000003,
    EXT_TDOP_GET_FIELD                    = 0x00000004,
    EXT_TDOP_EVALUATE                     = 0x00000005,
    EXT_TDOP_GET_TYPE_NAME                = 0x00000006,
    EXT_TDOP_OUTPUT_TYPE_NAME             = 0x00000007,
    EXT_TDOP_OUTPUT_SIMPLE_VALUE          = 0x00000008,
    EXT_TDOP_OUTPUT_FULL_VALUE            = 0x00000009,
    EXT_TDOP_HAS_FIELD                    = 0x0000000a,
    EXT_TDOP_GET_FIELD_OFFSET             = 0x0000000b,
    EXT_TDOP_GET_ARRAY_ELEMENT            = 0x0000000c,
    EXT_TDOP_GET_DEREFERENCE              = 0x0000000d,
    EXT_TDOP_GET_TYPE_SIZE                = 0x0000000e,
    EXT_TDOP_OUTPUT_TYPE_DEFINITION       = 0x0000000f,
    EXT_TDOP_GET_POINTER_TO               = 0x00000010,
    EXT_TDOP_SET_FROM_TYPE_ID_AND_U64     = 0x00000011,
    EXT_TDOP_SET_PTR_FROM_TYPE_ID_AND_U64 = 0x00000012,
    EXT_TDOP_COUNT                        = 0x00000013,
}

struct EXT_TYPED_DATA
{
    EXT_TDOP Operation;
    uint Flags;
    DEBUG_TYPED_DATA InData;
    DEBUG_TYPED_DATA OutData;
    uint InStrIndex;
    uint In32;
    uint Out32;
    ulong In64;
    ulong Out64;
    uint StrBufferIndex;
    uint StrBufferChars;
    uint StrCharsNeeded;
    uint DataBufferIndex;
    uint DataBufferBytes;
    uint DataBytesNeeded;
    HRESULT Status;
    ulong[8] Reserved;
}
struct WDBGEXTS_QUERY_INTERFACE
{
    const(GUID)* Iid;
    void* Iface;
}
struct WDBGEXTS_DISASSEMBLE_BUFFER
{
    ulong InOffset;
    ulong OutOffset;
    uint AddrFlags;
    uint FormatFlags;
    uint DataBufferBytes;
    uint DisasmBufferChars;
    void* DataBuffer;
    PWSTR DisasmBuffer;
    ulong[3] Reserved0;
}
struct WDBGEXTS_MODULE_IN_RANGE
{
    ulong Start;
    ulong End;
    ulong FoundModBase;
    uint FoundModSize;
}
alias DBGKD_MAJOR_TYPES = int;
enum : int
{
    DBGKD_MAJOR_NT          = 0x00000000,
    DBGKD_MAJOR_XBOX        = 0x00000001,
    DBGKD_MAJOR_BIG         = 0x00000002,
    DBGKD_MAJOR_EXDI        = 0x00000003,
    DBGKD_MAJOR_NTBD        = 0x00000004,
    DBGKD_MAJOR_EFI         = 0x00000005,
    DBGKD_MAJOR_TNT         = 0x00000006,
    DBGKD_MAJOR_SINGULARITY = 0x00000007,
    DBGKD_MAJOR_HYPERVISOR  = 0x00000008,
    DBGKD_MAJOR_MIDORI      = 0x00000009,
    DBGKD_MAJOR_CE          = 0x0000000a,
    DBGKD_MAJOR_COUNT       = 0x0000000b,
}

struct DBGKD_GET_VERSION32
{
    ushort MajorVersion;
    ushort MinorVersion;
    ushort ProtocolVersion;
    ushort Flags;
    uint KernBase;
    uint PsLoadedModuleList;
    ushort MachineType;
    ushort ThCallbackStack;
    ushort NextCallback;
    ushort FramePointer;
    uint KiCallUserMode;
    uint KeUserCallbackDispatcher;
    uint BreakpointWithStatus;
    uint DebuggerDataList;
}
struct DBGKD_DEBUG_DATA_HEADER32
{
    LIST_ENTRY32 List;
    uint OwnerTag;
    uint Size;
}
struct KDDEBUGGER_DATA32
{
    DBGKD_DEBUG_DATA_HEADER32 Header;
    uint KernBase;
    uint BreakpointWithStatus;
    uint SavedContext;
    ushort ThCallbackStack;
    ushort NextCallback;
    ushort FramePointer;
    ushort _bitfield0;
    uint KiCallUserMode;
    uint KeUserCallbackDispatcher;
    uint PsLoadedModuleList;
    uint PsActiveProcessHead;
    uint PspCidTable;
    uint ExpSystemResourcesList;
    uint ExpPagedPoolDescriptor;
    uint ExpNumberOfPagedPools;
    uint KeTimeIncrement;
    uint KeBugCheckCallbackListHead;
    uint KiBugcheckData;
    uint IopErrorLogListHead;
    uint ObpRootDirectoryObject;
    uint ObpTypeObjectType;
    uint MmSystemCacheStart;
    uint MmSystemCacheEnd;
    uint MmSystemCacheWs;
    uint MmPfnDatabase;
    uint MmSystemPtesStart;
    uint MmSystemPtesEnd;
    uint MmSubsectionBase;
    uint MmNumberOfPagingFiles;
    uint MmLowestPhysicalPage;
    uint MmHighestPhysicalPage;
    uint MmNumberOfPhysicalPages;
    uint MmMaximumNonPagedPoolInBytes;
    uint MmNonPagedSystemStart;
    uint MmNonPagedPoolStart;
    uint MmNonPagedPoolEnd;
    uint MmPagedPoolStart;
    uint MmPagedPoolEnd;
    uint MmPagedPoolInformation;
    uint MmPageSize;
    uint MmSizeOfPagedPoolInBytes;
    uint MmTotalCommitLimit;
    uint MmTotalCommittedPages;
    uint MmSharedCommit;
    uint MmDriverCommit;
    uint MmProcessCommit;
    uint MmPagedPoolCommit;
    uint MmExtendedCommit;
    uint MmZeroedPageListHead;
    uint MmFreePageListHead;
    uint MmStandbyPageListHead;
    uint MmModifiedPageListHead;
    uint MmModifiedNoWritePageListHead;
    uint MmAvailablePages;
    uint MmResidentAvailablePages;
    uint PoolTrackTable;
    uint NonPagedPoolDescriptor;
    uint MmHighestUserAddress;
    uint MmSystemRangeStart;
    uint MmUserProbeAddress;
    uint KdPrintCircularBuffer;
    uint KdPrintCircularBufferEnd;
    uint KdPrintWritePointer;
    uint KdPrintRolloverCount;
    uint MmLoadedUserImageList;
}
struct DBGKD_GET_VERSION64
{
    ushort MajorVersion;
    ushort MinorVersion;
    ubyte ProtocolVersion;
    ubyte KdSecondaryVersion;
    ushort Flags;
    ushort MachineType;
    ubyte MaxPacketType;
    ubyte MaxStateChange;
    ubyte MaxManipulate;
    ubyte Simulation;
    ushort[1] Unused;
    ulong KernBase;
    ulong PsLoadedModuleList;
    ulong DebuggerDataList;
}
struct DBGKD_DEBUG_DATA_HEADER64
{
    LIST_ENTRY64 List;
    uint OwnerTag;
    uint Size;
}
struct KDDEBUGGER_DATA64
{
    DBGKD_DEBUG_DATA_HEADER64 Header;
    ulong KernBase;
    ulong BreakpointWithStatus;
    ulong SavedContext;
    ushort ThCallbackStack;
    ushort NextCallback;
    ushort FramePointer;
    ushort _bitfield0;
    ulong KiCallUserMode;
    ulong KeUserCallbackDispatcher;
    ulong PsLoadedModuleList;
    ulong PsActiveProcessHead;
    ulong PspCidTable;
    ulong ExpSystemResourcesList;
    ulong ExpPagedPoolDescriptor;
    ulong ExpNumberOfPagedPools;
    ulong KeTimeIncrement;
    ulong KeBugCheckCallbackListHead;
    ulong KiBugcheckData;
    ulong IopErrorLogListHead;
    ulong ObpRootDirectoryObject;
    ulong ObpTypeObjectType;
    ulong MmSystemCacheStart;
    ulong MmSystemCacheEnd;
    ulong MmSystemCacheWs;
    ulong MmPfnDatabase;
    ulong MmSystemPtesStart;
    ulong MmSystemPtesEnd;
    ulong MmSubsectionBase;
    ulong MmNumberOfPagingFiles;
    ulong MmLowestPhysicalPage;
    ulong MmHighestPhysicalPage;
    ulong MmNumberOfPhysicalPages;
    ulong MmMaximumNonPagedPoolInBytes;
    ulong MmNonPagedSystemStart;
    ulong MmNonPagedPoolStart;
    ulong MmNonPagedPoolEnd;
    ulong MmPagedPoolStart;
    ulong MmPagedPoolEnd;
    ulong MmPagedPoolInformation;
    ulong MmPageSize;
    ulong MmSizeOfPagedPoolInBytes;
    ulong MmTotalCommitLimit;
    ulong MmTotalCommittedPages;
    ulong MmSharedCommit;
    ulong MmDriverCommit;
    ulong MmProcessCommit;
    ulong MmPagedPoolCommit;
    ulong MmExtendedCommit;
    ulong MmZeroedPageListHead;
    ulong MmFreePageListHead;
    ulong MmStandbyPageListHead;
    ulong MmModifiedPageListHead;
    ulong MmModifiedNoWritePageListHead;
    ulong MmAvailablePages;
    ulong MmResidentAvailablePages;
    ulong PoolTrackTable;
    ulong NonPagedPoolDescriptor;
    ulong MmHighestUserAddress;
    ulong MmSystemRangeStart;
    ulong MmUserProbeAddress;
    ulong KdPrintCircularBuffer;
    ulong KdPrintCircularBufferEnd;
    ulong KdPrintWritePointer;
    ulong KdPrintRolloverCount;
    ulong MmLoadedUserImageList;
    ulong NtBuildLab;
    ulong KiNormalSystemCall;
    ulong KiProcessorBlock;
    ulong MmUnloadedDrivers;
    ulong MmLastUnloadedDriver;
    ulong MmTriageActionTaken;
    ulong MmSpecialPoolTag;
    ulong KernelVerifier;
    ulong MmVerifierData;
    ulong MmAllocatedNonPagedPool;
    ulong MmPeakCommitment;
    ulong MmTotalCommitLimitMaximum;
    ulong CmNtCSDVersion;
    ulong MmPhysicalMemoryBlock;
    ulong MmSessionBase;
    ulong MmSessionSize;
    ulong MmSystemParentTablePage;
    ulong MmVirtualTranslationBase;
    ushort OffsetKThreadNextProcessor;
    ushort OffsetKThreadTeb;
    ushort OffsetKThreadKernelStack;
    ushort OffsetKThreadInitialStack;
    ushort OffsetKThreadApcProcess;
    ushort OffsetKThreadState;
    ushort OffsetKThreadBStore;
    ushort OffsetKThreadBStoreLimit;
    ushort SizeEProcess;
    ushort OffsetEprocessPeb;
    ushort OffsetEprocessParentCID;
    ushort OffsetEprocessDirectoryTableBase;
    ushort SizePrcb;
    ushort OffsetPrcbDpcRoutine;
    ushort OffsetPrcbCurrentThread;
    ushort OffsetPrcbMhz;
    ushort OffsetPrcbCpuType;
    ushort OffsetPrcbVendorString;
    ushort OffsetPrcbProcStateContext;
    ushort OffsetPrcbNumber;
    ushort SizeEThread;
    ubyte L1tfHighPhysicalBitIndex;
    ubyte L1tfSwizzleBitIndex;
    uint Padding0;
    ulong KdPrintCircularBufferPtr;
    ulong KdPrintBufferSize;
    ulong KeLoaderBlock;
    ushort SizePcr;
    ushort OffsetPcrSelfPcr;
    ushort OffsetPcrCurrentPrcb;
    ushort OffsetPcrContainedPrcb;
    ushort OffsetPcrInitialBStore;
    ushort OffsetPcrBStoreLimit;
    ushort OffsetPcrInitialStack;
    ushort OffsetPcrStackLimit;
    ushort OffsetPrcbPcrPage;
    ushort OffsetPrcbProcStateSpecialReg;
    ushort GdtR0Code;
    ushort GdtR0Data;
    ushort GdtR0Pcr;
    ushort GdtR3Code;
    ushort GdtR3Data;
    ushort GdtR3Teb;
    ushort GdtLdt;
    ushort GdtTss;
    ushort Gdt64R3CmCode;
    ushort Gdt64R3CmTeb;
    ulong IopNumTriageDumpDataBlocks;
    ulong IopTriageDumpDataBlocks;
    ulong VfCrashDataBlock;
    ulong MmBadPagesDetected;
    ulong MmZeroedPageSingleBitErrorsDetected;
    ulong EtwpDebuggerData;
    ushort OffsetPrcbContext;
    ushort OffsetPrcbMaxBreakpoints;
    ushort OffsetPrcbMaxWatchpoints;
    uint OffsetKThreadStackLimit;
    uint OffsetKThreadStackBase;
    uint OffsetKThreadQueueListEntry;
    uint OffsetEThreadIrpList;
    ushort OffsetPrcbIdleThread;
    ushort OffsetPrcbNormalDpcState;
    ushort OffsetPrcbDpcStack;
    ushort OffsetPrcbIsrStack;
    ushort SizeKDPC_STACK_FRAME;
    ushort OffsetKPriQueueThreadListHead;
    ushort OffsetKThreadWaitReason;
    ushort Padding1;
    ulong PteBase;
    ulong RetpolineStubFunctionTable;
    uint RetpolineStubFunctionTableSize;
    uint RetpolineStubOffset;
    uint RetpolineStubSize;
    ushort OffsetEProcessMmHotPatchContext;
}
alias PSYM_DUMP_FIELD_CALLBACK = uint function(FIELD_INFO*, void*);
struct FIELD_INFO
{
    ubyte* fName;
    ubyte* printName;
    uint size;
    uint fOptions;
    ulong address;
    union
    {
        void* fieldCallBack;
        void* pBuffer;
    }
    uint TypeId;
    uint FieldOffset;
    uint BufferSize;
    struct _BitField
    {
        ushort Position;
        ushort Size;
    }
    uint _bitfield0;
}
struct SYM_DUMP_PARAM
{
    uint size;
    ubyte* sName;
    uint Options;
    ulong addr;
    FIELD_INFO* listLink;
    union
    {
        void* Context;
        void* pBuffer;
    }
    PSYM_DUMP_FIELD_CALLBACK CallbackRoutine;
    uint nFields;
    FIELD_INFO* Fields;
    ulong ModBase;
    uint TypeId;
    uint TypeSize;
    uint BufferSize;
    uint _bitfield0;
}
struct XSAVE_FORMAT
{
    ushort ControlWord;
    ushort StatusWord;
    ubyte TagWord;
    ubyte Reserved1;
    ushort ErrorOpcode;
    uint ErrorOffset;
    ushort ErrorSelector;
    ushort Reserved2;
    uint DataOffset;
    ushort DataSelector;
    ushort Reserved3;
    uint MxCsr;
    uint MxCsr_Mask;
    M128A[8] FloatRegisters;
    M128A[16] XmmRegisters;
    ubyte[96] Reserved4;
}
struct XSTATE_CONTEXT
{
    ulong Mask;
    uint Length;
    uint Reserved1;
    XSAVE_AREA* Area;
    void* Buffer;
}
/+ [CONFLICTED] struct CONTEXT
{
    ulong P1Home;
    ulong P2Home;
    ulong P3Home;
    ulong P4Home;
    ulong P5Home;
    ulong P6Home;
    uint ContextFlags;
    uint MxCsr;
    ushort SegCs;
    ushort SegDs;
    ushort SegEs;
    ushort SegFs;
    ushort SegGs;
    ushort SegSs;
    uint EFlags;
    ulong Dr0;
    ulong Dr1;
    ulong Dr2;
    ulong Dr3;
    ulong Dr6;
    ulong Dr7;
    ulong Rax;
    ulong Rcx;
    ulong Rdx;
    ulong Rbx;
    ulong Rsp;
    ulong Rbp;
    ulong Rsi;
    ulong Rdi;
    ulong R8;
    ulong R9;
    ulong R10;
    ulong R11;
    ulong R12;
    ulong R13;
    ulong R14;
    ulong R15;
    ulong Rip;
    union
    {
        XSAVE_FORMAT FltSave;
        struct
        {
            M128A[2] Header;
            M128A[8] Legacy;
            M128A Xmm0;
            M128A Xmm1;
            M128A Xmm2;
            M128A Xmm3;
            M128A Xmm4;
            M128A Xmm5;
            M128A Xmm6;
            M128A Xmm7;
            M128A Xmm8;
            M128A Xmm9;
            M128A Xmm10;
            M128A Xmm11;
            M128A Xmm12;
            M128A Xmm13;
            M128A Xmm14;
            M128A Xmm15;
        }
    }
    M128A[26] VectorRegister;
    ulong VectorControl;
    ulong DebugControl;
    ulong LastBranchToRip;
    ulong LastBranchFromRip;
    ulong LastExceptionToRip;
    ulong LastExceptionFromRip;
}
+/
/+ [CONFLICTED] alias PGET_RUNTIME_FUNCTION_CALLBACK = IMAGE_RUNTIME_FUNCTION_ENTRY* function(ulong, void*);
+/
/+ [CONFLICTED] struct DISPATCHER_CONTEXT
{
    ulong ControlPc;
    ulong ImageBase;
    IMAGE_RUNTIME_FUNCTION_ENTRY* FunctionEntry;
    ulong EstablisherFrame;
    ulong TargetIp;
    CONTEXT* ContextRecord;
    EXCEPTION_ROUTINE LanguageHandler;
    void* HandlerData;
    UNWIND_HISTORY_TABLE* HistoryTable;
    uint ScopeIndex;
    uint Fill0;
}
+/
struct KNONVOLATILE_CONTEXT_POINTERS
{
    union
    {
        M128A*[16] FloatingContext;
        struct
        {
            M128A* Xmm0;
            M128A* Xmm1;
            M128A* Xmm2;
            M128A* Xmm3;
            M128A* Xmm4;
            M128A* Xmm5;
            M128A* Xmm6;
            M128A* Xmm7;
            M128A* Xmm8;
            M128A* Xmm9;
            M128A* Xmm10;
            M128A* Xmm11;
            M128A* Xmm12;
            M128A* Xmm13;
            M128A* Xmm14;
            M128A* Xmm15;
        }
    }
    union
    {
        ulong*[16] IntegerContext;
        struct
        {
            ulong* Rax;
            ulong* Rcx;
            ulong* Rdx;
            ulong* Rbx;
            ulong* Rsp;
            ulong* Rbp;
            ulong* Rsi;
            ulong* Rdi;
            ulong* R8;
            ulong* R9;
            ulong* R10;
            ulong* R11;
            ulong* R12;
            ulong* R13;
            ulong* R14;
            ulong* R15;
        }
    }
}
/+ [CONFLICTED] struct UNWIND_HISTORY_TABLE_ENTRY
{
    ulong ImageBase;
    IMAGE_RUNTIME_FUNCTION_ENTRY* FunctionEntry;
}
+/
struct UNWIND_HISTORY_TABLE
{
    uint Count;
    ubyte LocalHint;
    ubyte GlobalHint;
    ubyte Search;
    ubyte Once;
    ulong LowAddress;
    ulong HighAddress;
    UNWIND_HISTORY_TABLE_ENTRY[12] Entry;
}
struct LOADED_IMAGE
{
    PSTR ModuleName;
    HANDLE hFile;
    ubyte* MappedAddress;
    IMAGE_NT_HEADERS64* FileHeader;
    IMAGE_SECTION_HEADER* LastRvaSection;
    uint NumberOfSections;
    IMAGE_SECTION_HEADER* Sections;
    IMAGE_FILE_CHARACTERISTICS2 Characteristics;
    BOOLEAN fSystemImage;
    BOOLEAN fDOSImage;
    BOOLEAN fReadOnly;
    ubyte Version;
    LIST_ENTRY Links;
    uint SizeOfImage;
}
struct M128A
{
    ulong Low;
    long High;
}
/+ [CONFLICTED] struct XSAVE_FORMAT
{
    ushort ControlWord;
    ushort StatusWord;
    ubyte TagWord;
    ubyte Reserved1;
    ushort ErrorOpcode;
    uint ErrorOffset;
    ushort ErrorSelector;
    ushort Reserved2;
    uint DataOffset;
    ushort DataSelector;
    ushort Reserved3;
    uint MxCsr;
    uint MxCsr_Mask;
    M128A[8] FloatRegisters;
    M128A[8] XmmRegisters;
    ubyte[224] Reserved4;
}
+/
struct XSAVE_AREA_HEADER
{
    ulong Mask;
    ulong CompactionMask;
    ulong[6] Reserved2;
}
struct XSAVE_AREA
{
    XSAVE_FORMAT LegacyState;
    XSAVE_AREA_HEADER Header;
}
/+ [CONFLICTED] struct XSTATE_CONTEXT
{
    ulong Mask;
    uint Length;
    uint Reserved1;
    XSAVE_AREA* Area;
    uint Reserved2;
    void* Buffer;
    uint Reserved3;
}
+/
union ARM64_NT_NEON128
{
    struct
    {
        ulong Low;
        long High;
    }
    double[2] D;
    float[4] S;
    ushort[8] H;
    ubyte[16] B;
}
struct ARM64_NT_CONTEXT
{
    uint ContextFlags;
    uint Cpsr;
    union
    {
        struct
        {
            ulong X0;
            ulong X1;
            ulong X2;
            ulong X3;
            ulong X4;
            ulong X5;
            ulong X6;
            ulong X7;
            ulong X8;
            ulong X9;
            ulong X10;
            ulong X11;
            ulong X12;
            ulong X13;
            ulong X14;
            ulong X15;
            ulong X16;
            ulong X17;
            ulong X18;
            ulong X19;
            ulong X20;
            ulong X21;
            ulong X22;
            ulong X23;
            ulong X24;
            ulong X25;
            ulong X26;
            ulong X27;
            ulong X28;
            ulong Fp;
            ulong Lr;
        }
        ulong[31] X;
    }
    ulong Sp;
    ulong Pc;
    ARM64_NT_NEON128[32] V;
    uint Fpcr;
    uint Fpsr;
    uint[8] Bcr;
    ulong[8] Bvr;
    uint[2] Wcr;
    ulong[2] Wvr;
}
/+ [CONFLICTED] struct CONTEXT
{
    uint ContextFlags;
    uint Dr0;
    uint Dr1;
    uint Dr2;
    uint Dr3;
    uint Dr6;
    uint Dr7;
    FLOATING_SAVE_AREA FloatSave;
    uint SegGs;
    uint SegFs;
    uint SegEs;
    uint SegDs;
    uint Edi;
    uint Esi;
    uint Ebx;
    uint Edx;
    uint Ecx;
    uint Eax;
    uint Ebp;
    uint Eip;
    uint SegCs;
    uint EFlags;
    uint Esp;
    uint SegSs;
    ubyte[512] ExtendedRegisters;
}
+/
struct LDT_ENTRY
{
    ushort LimitLow;
    ushort BaseLow;
    union _HighWord_e__Union
    {
        struct _Bytes_e__Struct
        {
            ubyte BaseMid;
            ubyte Flags1;
            ubyte Flags2;
            ubyte BaseHi;
        }
        struct _Bits_e__Struct
        {
            uint _bitfield0;
        }
    }
}
/+ [CONFLICTED] struct KNONVOLATILE_CONTEXT_POINTERS
{
    uint Dummy;
}
+/
struct WOW64_FLOATING_SAVE_AREA
{
    uint ControlWord;
    uint StatusWord;
    uint TagWord;
    uint ErrorOffset;
    uint ErrorSelector;
    uint DataOffset;
    uint DataSelector;
    ubyte[80] RegisterArea;
    uint Cr0NpxState;
}
struct WOW64_CONTEXT
{
    uint ContextFlags;
    uint Dr0;
    uint Dr1;
    uint Dr2;
    uint Dr3;
    uint Dr6;
    uint Dr7;
    WOW64_FLOATING_SAVE_AREA FloatSave;
    uint SegGs;
    uint SegFs;
    uint SegEs;
    uint SegDs;
    uint Edi;
    uint Esi;
    uint Ebx;
    uint Edx;
    uint Ecx;
    uint Eax;
    uint Ebp;
    uint Eip;
    uint SegCs;
    uint EFlags;
    uint Esp;
    uint SegSs;
    ubyte[512] ExtendedRegisters;
}
struct WOW64_LDT_ENTRY
{
    ushort LimitLow;
    ushort BaseLow;
    union _HighWord_e__Union
    {
        struct _Bytes_e__Struct
        {
            ubyte BaseMid;
            ubyte Flags1;
            ubyte Flags2;
            ubyte BaseHi;
        }
        struct _Bits_e__Struct
        {
            uint _bitfield0;
        }
    }
}
struct WOW64_DESCRIPTOR_TABLE_ENTRY
{
    uint Selector;
    WOW64_LDT_ENTRY Descriptor;
}
struct EXCEPTION_RECORD
{
    NTSTATUS ExceptionCode;
    uint ExceptionFlags;
    EXCEPTION_RECORD* ExceptionRecord;
    void* ExceptionAddress;
    uint NumberParameters;
    ulong[15] ExceptionInformation;
}
struct EXCEPTION_RECORD32
{
    NTSTATUS ExceptionCode;
    uint ExceptionFlags;
    uint ExceptionRecord;
    uint ExceptionAddress;
    uint NumberParameters;
    uint[15] ExceptionInformation;
}
struct EXCEPTION_RECORD64
{
    NTSTATUS ExceptionCode;
    uint ExceptionFlags;
    ulong ExceptionRecord;
    ulong ExceptionAddress;
    uint NumberParameters;
    uint __unusedAlignment;
    ulong[15] ExceptionInformation;
}
struct EXCEPTION_POINTERS
{
    EXCEPTION_RECORD* ExceptionRecord;
    CONTEXT* ContextRecord;
}
struct XSTATE_FEATURE
{
    uint Offset;
    uint Size;
}
struct XSTATE_CONFIGURATION
{
    ulong EnabledFeatures;
    ulong EnabledVolatileFeatures;
    uint Size;
    union
    {
        uint ControlFlags;
        struct
        {
            uint _bitfield0;
        }
    }
    XSTATE_FEATURE[64] Features;
    ulong EnabledSupervisorFeatures;
    ulong AlignedFeatures;
    uint AllFeatureSize;
    uint[64] AllFeatures;
    ulong EnabledUserVisibleSupervisorFeatures;
    ulong ExtendedFeatureDisableFeatures;
    uint AllNonLargeFeatureSize;
    uint Spare;
}
struct IMAGE_FILE_HEADER
{
    IMAGE_FILE_MACHINE Machine;
    ushort NumberOfSections;
    uint TimeDateStamp;
    uint PointerToSymbolTable;
    uint NumberOfSymbols;
    ushort SizeOfOptionalHeader;
    IMAGE_FILE_CHARACTERISTICS Characteristics;
}
struct IMAGE_DATA_DIRECTORY
{
    uint VirtualAddress;
    uint Size;
}
struct IMAGE_OPTIONAL_HEADER32
{
    IMAGE_OPTIONAL_HEADER_MAGIC Magic;
    ubyte MajorLinkerVersion;
    ubyte MinorLinkerVersion;
    uint SizeOfCode;
    uint SizeOfInitializedData;
    uint SizeOfUninitializedData;
    uint AddressOfEntryPoint;
    uint BaseOfCode;
    uint BaseOfData;
    uint ImageBase;
    uint SectionAlignment;
    uint FileAlignment;
    ushort MajorOperatingSystemVersion;
    ushort MinorOperatingSystemVersion;
    ushort MajorImageVersion;
    ushort MinorImageVersion;
    ushort MajorSubsystemVersion;
    ushort MinorSubsystemVersion;
    uint Win32VersionValue;
    uint SizeOfImage;
    uint SizeOfHeaders;
    uint CheckSum;
    IMAGE_SUBSYSTEM Subsystem;
    IMAGE_DLL_CHARACTERISTICS DllCharacteristics;
    uint SizeOfStackReserve;
    uint SizeOfStackCommit;
    uint SizeOfHeapReserve;
    uint SizeOfHeapCommit;
    uint LoaderFlags;
    uint NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY[16] DataDirectory;
}
struct IMAGE_ROM_OPTIONAL_HEADER
{
    ushort Magic;
    ubyte MajorLinkerVersion;
    ubyte MinorLinkerVersion;
    uint SizeOfCode;
    uint SizeOfInitializedData;
    uint SizeOfUninitializedData;
    uint AddressOfEntryPoint;
    uint BaseOfCode;
    uint BaseOfData;
    uint BaseOfBss;
    uint GprMask;
    uint[4] CprMask;
    uint GpValue;
}
struct IMAGE_OPTIONAL_HEADER64
{
    align (4):
    IMAGE_OPTIONAL_HEADER_MAGIC Magic;
    ubyte MajorLinkerVersion;
    ubyte MinorLinkerVersion;
    uint SizeOfCode;
    uint SizeOfInitializedData;
    uint SizeOfUninitializedData;
    uint AddressOfEntryPoint;
    uint BaseOfCode;
    ulong ImageBase;
    uint SectionAlignment;
    uint FileAlignment;
    ushort MajorOperatingSystemVersion;
    ushort MinorOperatingSystemVersion;
    ushort MajorImageVersion;
    ushort MinorImageVersion;
    ushort MajorSubsystemVersion;
    ushort MinorSubsystemVersion;
    uint Win32VersionValue;
    uint SizeOfImage;
    uint SizeOfHeaders;
    uint CheckSum;
    IMAGE_SUBSYSTEM Subsystem;
    IMAGE_DLL_CHARACTERISTICS DllCharacteristics;
    ulong SizeOfStackReserve;
    ulong SizeOfStackCommit;
    ulong SizeOfHeapReserve;
    ulong SizeOfHeapCommit;
    uint LoaderFlags;
    uint NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY[16] DataDirectory;
}
struct IMAGE_NT_HEADERS64
{
    uint Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER64 OptionalHeader;
}
struct IMAGE_NT_HEADERS32
{
    uint Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER32 OptionalHeader;
}
struct IMAGE_ROM_HEADERS
{
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_ROM_OPTIONAL_HEADER OptionalHeader;
}
struct IMAGE_SECTION_HEADER
{
    ubyte[8] Name;
    union _Misc_e__Union
    {
        uint PhysicalAddress;
        uint VirtualSize;
    }
    uint VirtualAddress;
    uint SizeOfRawData;
    uint PointerToRawData;
    uint PointerToRelocations;
    uint PointerToLinenumbers;
    ushort NumberOfRelocations;
    ushort NumberOfLinenumbers;
    IMAGE_SECTION_CHARACTERISTICS Characteristics;
}
struct IMAGE_LOAD_CONFIG_CODE_INTEGRITY
{
    ushort Flags;
    ushort Catalog;
    uint CatalogOffset;
    uint Reserved;
}
struct IMAGE_LOAD_CONFIG_DIRECTORY32
{
    uint Size;
    uint TimeDateStamp;
    ushort MajorVersion;
    ushort MinorVersion;
    uint GlobalFlagsClear;
    uint GlobalFlagsSet;
    uint CriticalSectionDefaultTimeout;
    uint DeCommitFreeBlockThreshold;
    uint DeCommitTotalFreeThreshold;
    uint LockPrefixTable;
    uint MaximumAllocationSize;
    uint VirtualMemoryThreshold;
    uint ProcessHeapFlags;
    uint ProcessAffinityMask;
    ushort CSDVersion;
    ushort DependentLoadFlags;
    uint EditList;
    uint SecurityCookie;
    uint SEHandlerTable;
    uint SEHandlerCount;
    uint GuardCFCheckFunctionPointer;
    uint GuardCFDispatchFunctionPointer;
    uint GuardCFFunctionTable;
    uint GuardCFFunctionCount;
    uint GuardFlags;
    IMAGE_LOAD_CONFIG_CODE_INTEGRITY CodeIntegrity;
    uint GuardAddressTakenIatEntryTable;
    uint GuardAddressTakenIatEntryCount;
    uint GuardLongJumpTargetTable;
    uint GuardLongJumpTargetCount;
    uint DynamicValueRelocTable;
    uint CHPEMetadataPointer;
    uint GuardRFFailureRoutine;
    uint GuardRFFailureRoutineFunctionPointer;
    uint DynamicValueRelocTableOffset;
    ushort DynamicValueRelocTableSection;
    ushort Reserved2;
    uint GuardRFVerifyStackPointerFunctionPointer;
    uint HotPatchTableOffset;
    uint Reserved3;
    uint EnclaveConfigurationPointer;
    uint VolatileMetadataPointer;
    uint GuardEHContinuationTable;
    uint GuardEHContinuationCount;
    uint GuardXFGCheckFunctionPointer;
    uint GuardXFGDispatchFunctionPointer;
    uint GuardXFGTableDispatchFunctionPointer;
    uint CastGuardOsDeterminedFailureMode;
}
struct IMAGE_LOAD_CONFIG_DIRECTORY64
{
    align (4):
    uint Size;
    uint TimeDateStamp;
    ushort MajorVersion;
    ushort MinorVersion;
    uint GlobalFlagsClear;
    uint GlobalFlagsSet;
    uint CriticalSectionDefaultTimeout;
    ulong DeCommitFreeBlockThreshold;
    ulong DeCommitTotalFreeThreshold;
    ulong LockPrefixTable;
    ulong MaximumAllocationSize;
    ulong VirtualMemoryThreshold;
    ulong ProcessAffinityMask;
    uint ProcessHeapFlags;
    ushort CSDVersion;
    ushort DependentLoadFlags;
    ulong EditList;
    ulong SecurityCookie;
    ulong SEHandlerTable;
    ulong SEHandlerCount;
    ulong GuardCFCheckFunctionPointer;
    ulong GuardCFDispatchFunctionPointer;
    ulong GuardCFFunctionTable;
    ulong GuardCFFunctionCount;
    uint GuardFlags;
    IMAGE_LOAD_CONFIG_CODE_INTEGRITY CodeIntegrity;
    ulong GuardAddressTakenIatEntryTable;
    ulong GuardAddressTakenIatEntryCount;
    ulong GuardLongJumpTargetTable;
    ulong GuardLongJumpTargetCount;
    ulong DynamicValueRelocTable;
    ulong CHPEMetadataPointer;
    ulong GuardRFFailureRoutine;
    ulong GuardRFFailureRoutineFunctionPointer;
    uint DynamicValueRelocTableOffset;
    ushort DynamicValueRelocTableSection;
    ushort Reserved2;
    ulong GuardRFVerifyStackPointerFunctionPointer;
    uint HotPatchTableOffset;
    uint Reserved3;
    ulong EnclaveConfigurationPointer;
    ulong VolatileMetadataPointer;
    ulong GuardEHContinuationTable;
    ulong GuardEHContinuationCount;
    ulong GuardXFGCheckFunctionPointer;
    ulong GuardXFGDispatchFunctionPointer;
    ulong GuardXFGTableDispatchFunctionPointer;
    ulong CastGuardOsDeterminedFailureMode;
}
struct IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY
{
    uint BeginAddress;
    union
    {
        uint UnwindData;
        struct
        {
            uint _bitfield0;
        }
    }
}
struct IMAGE_RUNTIME_FUNCTION_ENTRY
{
    uint BeginAddress;
    uint EndAddress;
    union
    {
        uint UnwindInfoAddress;
        uint UnwindData;
    }
}
struct IMAGE_DEBUG_DIRECTORY
{
    uint Characteristics;
    uint TimeDateStamp;
    ushort MajorVersion;
    ushort MinorVersion;
    IMAGE_DEBUG_TYPE Type;
    uint SizeOfData;
    uint AddressOfRawData;
    uint PointerToRawData;
}
struct IMAGE_COFF_SYMBOLS_HEADER
{
    uint NumberOfSymbols;
    uint LvaToFirstSymbol;
    uint NumberOfLinenumbers;
    uint LvaToFirstLinenumber;
    uint RvaToFirstByteOfCode;
    uint RvaToLastByteOfCode;
    uint RvaToFirstByteOfData;
    uint RvaToLastByteOfData;
}
struct FPO_DATA
{
    uint ulOffStart;
    uint cbProcSize;
    uint cdwLocals;
    ushort cdwParams;
    ushort _bitfield0;
}
struct IMAGE_FUNCTION_ENTRY
{
    uint StartingAddress;
    uint EndingAddress;
    uint EndOfPrologue;
}
struct IMAGE_FUNCTION_ENTRY64
{
    align (4):
    ulong StartingAddress;
    ulong EndingAddress;
    union
    {
        align (4):
        ulong EndOfPrologue;
        ulong UnwindInfoAddress;
    }
}
struct IMAGE_COR20_HEADER
{
    uint cb;
    ushort MajorRuntimeVersion;
    ushort MinorRuntimeVersion;
    IMAGE_DATA_DIRECTORY MetaData;
    uint Flags;
    union
    {
        uint EntryPointToken;
        uint EntryPointRVA;
    }
    IMAGE_DATA_DIRECTORY Resources;
    IMAGE_DATA_DIRECTORY StrongNameSignature;
    IMAGE_DATA_DIRECTORY CodeManagerTable;
    IMAGE_DATA_DIRECTORY VTableFixups;
    IMAGE_DATA_DIRECTORY ExportAddressTableJumps;
    IMAGE_DATA_DIRECTORY ManagedNativeHeader;
}
alias PVECTORED_EXCEPTION_HANDLER = int function(EXCEPTION_POINTERS*);
alias LPTOP_LEVEL_EXCEPTION_FILTER = int function(EXCEPTION_POINTERS*);
alias WCT_OBJECT_TYPE = int;
enum : int
{
    WctCriticalSectionType = 0x00000001,
    WctSendMessageType     = 0x00000002,
    WctMutexType           = 0x00000003,
    WctAlpcType            = 0x00000004,
    WctComType             = 0x00000005,
    WctThreadWaitType      = 0x00000006,
    WctProcessWaitType     = 0x00000007,
    WctThreadType          = 0x00000008,
    WctComActivationType   = 0x00000009,
    WctUnknownType         = 0x0000000a,
    WctSocketIoType        = 0x0000000b,
    WctSmbIoType           = 0x0000000c,
    WctMaxType             = 0x0000000d,
}

alias WCT_OBJECT_STATUS = int;
enum : int
{
    WctStatusNoAccess     = 0x00000001,
    WctStatusRunning      = 0x00000002,
    WctStatusBlocked      = 0x00000003,
    WctStatusPidOnly      = 0x00000004,
    WctStatusPidOnlyRpcss = 0x00000005,
    WctStatusOwned        = 0x00000006,
    WctStatusNotOwned     = 0x00000007,
    WctStatusAbandoned    = 0x00000008,
    WctStatusUnknown      = 0x00000009,
    WctStatusError        = 0x0000000a,
    WctStatusMax          = 0x0000000b,
}

struct WAITCHAIN_NODE_INFO
{
    WCT_OBJECT_TYPE ObjectType;
    WCT_OBJECT_STATUS ObjectStatus;
    union
    {
        struct _LockObject_e__Struct
        {
            wchar[128] ObjectName;
            LARGE_INTEGER Timeout;
            BOOL Alertable;
        }
        struct _ThreadObject_e__Struct
        {
            uint ProcessId;
            uint ThreadId;
            uint WaitTime;
            uint ContextSwitches;
        }
    }
}
alias PWAITCHAINCALLBACK = void function(void*, ulong, uint, uint*, WAITCHAIN_NODE_INFO*, int*);
alias PCOGETCALLSTATE = HRESULT function(int, uint*);
alias PCOGETACTIVATIONSTATE = HRESULT function(GUID, uint, uint*);
struct MINIDUMP_LOCATION_DESCRIPTOR
{
    align (4):
    uint DataSize;
    uint Rva;
}
struct MINIDUMP_LOCATION_DESCRIPTOR64
{
    align (4):
    ulong DataSize;
    ulong Rva;
}
struct MINIDUMP_MEMORY_DESCRIPTOR
{
    align (4):
    ulong StartOfMemoryRange;
    MINIDUMP_LOCATION_DESCRIPTOR Memory;
}
struct MINIDUMP_MEMORY_DESCRIPTOR64
{
    align (4):
    ulong StartOfMemoryRange;
    ulong DataSize;
}
struct MINIDUMP_HEADER
{
    align (4):
    uint Signature;
    uint Version;
    uint NumberOfStreams;
    uint StreamDirectoryRva;
    uint CheckSum;
    union
    {
        uint Reserved;
        uint TimeDateStamp;
    }
    ulong Flags;
}
struct MINIDUMP_DIRECTORY
{
    align (4):
    uint StreamType;
    MINIDUMP_LOCATION_DESCRIPTOR Location;
}
struct MINIDUMP_STRING
{
    align (4):
    uint Length;
    wchar[1] Buffer;
}
alias MINIDUMP_STREAM_TYPE = int;
enum : int
{
    UnusedStream                = 0x00000000,
    ReservedStream0             = 0x00000001,
    ReservedStream1             = 0x00000002,
    ThreadListStream            = 0x00000003,
    ModuleListStream            = 0x00000004,
    MemoryListStream            = 0x00000005,
    ExceptionStream             = 0x00000006,
    SystemInfoStream            = 0x00000007,
    ThreadExListStream          = 0x00000008,
    Memory64ListStream          = 0x00000009,
    CommentStreamA              = 0x0000000a,
    CommentStreamW              = 0x0000000b,
    HandleDataStream            = 0x0000000c,
    FunctionTableStream         = 0x0000000d,
    UnloadedModuleListStream    = 0x0000000e,
    MiscInfoStream              = 0x0000000f,
    MemoryInfoListStream        = 0x00000010,
    ThreadInfoListStream        = 0x00000011,
    HandleOperationListStream   = 0x00000012,
    TokenStream                 = 0x00000013,
    JavaScriptDataStream        = 0x00000014,
    SystemMemoryInfoStream      = 0x00000015,
    ProcessVmCountersStream     = 0x00000016,
    IptTraceStream              = 0x00000017,
    ThreadNamesStream           = 0x00000018,
    ceStreamNull                = 0x00008000,
    ceStreamSystemInfo          = 0x00008001,
    ceStreamException           = 0x00008002,
    ceStreamModuleList          = 0x00008003,
    ceStreamProcessList         = 0x00008004,
    ceStreamThreadList          = 0x00008005,
    ceStreamThreadContextList   = 0x00008006,
    ceStreamThreadCallStackList = 0x00008007,
    ceStreamMemoryVirtualList   = 0x00008008,
    ceStreamMemoryPhysicalList  = 0x00008009,
    ceStreamBucketParameters    = 0x0000800a,
    ceStreamProcessModuleMap    = 0x0000800b,
    ceStreamDiagnosisList       = 0x0000800c,
    LastReservedStream          = 0x0000ffff,
}

union CPU_INFORMATION
{
    struct _X86CpuInfo_e__Struct
    {
        uint[3] VendorId;
        uint VersionInformation;
        uint FeatureInformation;
        uint AMDExtendedCpuFeatures;
    }
    struct _OtherCpuInfo_e__Struct
    {
        align (4):
        ulong[2] ProcessorFeatures;
    }
}
struct MINIDUMP_SYSTEM_INFO
{
    align (4):
    PROCESSOR_ARCHITECTURE ProcessorArchitecture;
    ushort ProcessorLevel;
    ushort ProcessorRevision;
    union
    {
        ushort Reserved0;
        struct
        {
            ubyte NumberOfProcessors;
            ubyte ProductType;
        }
    }
    uint MajorVersion;
    uint MinorVersion;
    uint BuildNumber;
    VER_PLATFORM PlatformId;
    uint CSDVersionRva;
    union
    {
        uint Reserved1;
        struct
        {
            ushort SuiteMask;
            ushort Reserved2;
        }
    }
    CPU_INFORMATION Cpu;
}
struct MINIDUMP_THREAD
{
    align (4):
    uint ThreadId;
    uint SuspendCount;
    uint PriorityClass;
    uint Priority;
    ulong Teb;
    MINIDUMP_MEMORY_DESCRIPTOR Stack;
    MINIDUMP_LOCATION_DESCRIPTOR ThreadContext;
}
struct MINIDUMP_THREAD_LIST
{
    align (4):
    uint NumberOfThreads;
    MINIDUMP_THREAD[1] Threads;
}
struct MINIDUMP_THREAD_EX
{
    align (4):
    uint ThreadId;
    uint SuspendCount;
    uint PriorityClass;
    uint Priority;
    ulong Teb;
    MINIDUMP_MEMORY_DESCRIPTOR Stack;
    MINIDUMP_LOCATION_DESCRIPTOR ThreadContext;
    MINIDUMP_MEMORY_DESCRIPTOR BackingStore;
}
struct MINIDUMP_THREAD_EX_LIST
{
    align (4):
    uint NumberOfThreads;
    MINIDUMP_THREAD_EX[1] Threads;
}
struct MINIDUMP_EXCEPTION
{
    align (4):
    uint ExceptionCode;
    uint ExceptionFlags;
    ulong ExceptionRecord;
    ulong ExceptionAddress;
    uint NumberParameters;
    uint __unusedAlignment;
    ulong[15] ExceptionInformation;
}
struct MINIDUMP_EXCEPTION_STREAM
{
    align (4):
    uint ThreadId;
    uint __alignment;
    MINIDUMP_EXCEPTION ExceptionRecord;
    MINIDUMP_LOCATION_DESCRIPTOR ThreadContext;
}
struct MINIDUMP_MODULE
{
    align (4):
    ulong BaseOfImage;
    uint SizeOfImage;
    uint CheckSum;
    uint TimeDateStamp;
    uint ModuleNameRva;
    VS_FIXEDFILEINFO VersionInfo;
    MINIDUMP_LOCATION_DESCRIPTOR CvRecord;
    MINIDUMP_LOCATION_DESCRIPTOR MiscRecord;
    ulong Reserved0;
    ulong Reserved1;
}
struct MINIDUMP_MODULE_LIST
{
    align (4):
    uint NumberOfModules;
    MINIDUMP_MODULE[1] Modules;
}
struct MINIDUMP_MEMORY_LIST
{
    align (4):
    uint NumberOfMemoryRanges;
    MINIDUMP_MEMORY_DESCRIPTOR[1] MemoryRanges;
}
struct MINIDUMP_MEMORY64_LIST
{
    align (4):
    ulong NumberOfMemoryRanges;
    ulong BaseRva;
    MINIDUMP_MEMORY_DESCRIPTOR64[1] MemoryRanges;
}
struct MINIDUMP_EXCEPTION_INFORMATION
{
    align (4):
    uint ThreadId;
    EXCEPTION_POINTERS* ExceptionPointers;
    BOOL ClientPointers;
}
struct MINIDUMP_EXCEPTION_INFORMATION64
{
    align (4):
    uint ThreadId;
    ulong ExceptionRecord;
    ulong ContextRecord;
    BOOL ClientPointers;
}
alias MINIDUMP_HANDLE_OBJECT_INFORMATION_TYPE = int;
enum : int
{
    MiniHandleObjectInformationNone    = 0x00000000,
    MiniThreadInformation1             = 0x00000001,
    MiniMutantInformation1             = 0x00000002,
    MiniMutantInformation2             = 0x00000003,
    MiniProcessInformation1            = 0x00000004,
    MiniProcessInformation2            = 0x00000005,
    MiniEventInformation1              = 0x00000006,
    MiniSectionInformation1            = 0x00000007,
    MiniSemaphoreInformation1          = 0x00000008,
    MiniHandleObjectInformationTypeMax = 0x00000009,
}

struct MINIDUMP_HANDLE_OBJECT_INFORMATION
{
    align (4):
    uint NextInfoRva;
    uint InfoType;
    uint SizeOfInfo;
}
struct MINIDUMP_HANDLE_DESCRIPTOR
{
    align (4):
    ulong Handle;
    uint TypeNameRva;
    uint ObjectNameRva;
    uint Attributes;
    uint GrantedAccess;
    uint HandleCount;
    uint PointerCount;
}
struct MINIDUMP_HANDLE_DESCRIPTOR_2
{
    align (4):
    ulong Handle;
    uint TypeNameRva;
    uint ObjectNameRva;
    uint Attributes;
    uint GrantedAccess;
    uint HandleCount;
    uint PointerCount;
    uint ObjectInfoRva;
    uint Reserved0;
}
struct MINIDUMP_HANDLE_DATA_STREAM
{
    align (4):
    uint SizeOfHeader;
    uint SizeOfDescriptor;
    uint NumberOfDescriptors;
    uint Reserved;
}
struct MINIDUMP_HANDLE_OPERATION_LIST
{
    align (4):
    uint SizeOfHeader;
    uint SizeOfEntry;
    uint NumberOfEntries;
    uint Reserved;
}
struct MINIDUMP_FUNCTION_TABLE_DESCRIPTOR
{
    align (4):
    ulong MinimumAddress;
    ulong MaximumAddress;
    ulong BaseAddress;
    uint EntryCount;
    uint SizeOfAlignPad;
}
struct MINIDUMP_FUNCTION_TABLE_STREAM
{
    align (4):
    uint SizeOfHeader;
    uint SizeOfDescriptor;
    uint SizeOfNativeDescriptor;
    uint SizeOfFunctionEntry;
    uint NumberOfDescriptors;
    uint SizeOfAlignPad;
}
struct MINIDUMP_UNLOADED_MODULE
{
    align (4):
    ulong BaseOfImage;
    uint SizeOfImage;
    uint CheckSum;
    uint TimeDateStamp;
    uint ModuleNameRva;
}
struct MINIDUMP_UNLOADED_MODULE_LIST
{
    align (4):
    uint SizeOfHeader;
    uint SizeOfEntry;
    uint NumberOfEntries;
}
struct XSTATE_CONFIG_FEATURE_MSC_INFO
{
    align (4):
    uint SizeOfInfo;
    uint ContextSize;
    ulong EnabledFeatures;
    XSTATE_FEATURE[64] Features;
}
struct MINIDUMP_MISC_INFO
{
    align (4):
    uint SizeOfInfo;
    MINIDUMP_MISC_INFO_FLAGS Flags1;
    uint ProcessId;
    uint ProcessCreateTime;
    uint ProcessUserTime;
    uint ProcessKernelTime;
}
struct MINIDUMP_MISC_INFO_2
{
    align (4):
    uint SizeOfInfo;
    uint Flags1;
    uint ProcessId;
    uint ProcessCreateTime;
    uint ProcessUserTime;
    uint ProcessKernelTime;
    uint ProcessorMaxMhz;
    uint ProcessorCurrentMhz;
    uint ProcessorMhzLimit;
    uint ProcessorMaxIdleState;
    uint ProcessorCurrentIdleState;
}
struct MINIDUMP_MISC_INFO_3
{
    align (4):
    uint SizeOfInfo;
    uint Flags1;
    uint ProcessId;
    uint ProcessCreateTime;
    uint ProcessUserTime;
    uint ProcessKernelTime;
    uint ProcessorMaxMhz;
    uint ProcessorCurrentMhz;
    uint ProcessorMhzLimit;
    uint ProcessorMaxIdleState;
    uint ProcessorCurrentIdleState;
    uint ProcessIntegrityLevel;
    uint ProcessExecuteFlags;
    uint ProtectedProcess;
    uint TimeZoneId;
    TIME_ZONE_INFORMATION TimeZone;
}
struct MINIDUMP_MISC_INFO_4
{
    align (4):
    uint SizeOfInfo;
    uint Flags1;
    uint ProcessId;
    uint ProcessCreateTime;
    uint ProcessUserTime;
    uint ProcessKernelTime;
    uint ProcessorMaxMhz;
    uint ProcessorCurrentMhz;
    uint ProcessorMhzLimit;
    uint ProcessorMaxIdleState;
    uint ProcessorCurrentIdleState;
    uint ProcessIntegrityLevel;
    uint ProcessExecuteFlags;
    uint ProtectedProcess;
    uint TimeZoneId;
    TIME_ZONE_INFORMATION TimeZone;
    wchar[260] BuildString;
    wchar[40] DbgBldStr;
}
struct MINIDUMP_MISC_INFO_5
{
    align (4):
    uint SizeOfInfo;
    uint Flags1;
    uint ProcessId;
    uint ProcessCreateTime;
    uint ProcessUserTime;
    uint ProcessKernelTime;
    uint ProcessorMaxMhz;
    uint ProcessorCurrentMhz;
    uint ProcessorMhzLimit;
    uint ProcessorMaxIdleState;
    uint ProcessorCurrentIdleState;
    uint ProcessIntegrityLevel;
    uint ProcessExecuteFlags;
    uint ProtectedProcess;
    uint TimeZoneId;
    TIME_ZONE_INFORMATION TimeZone;
    wchar[260] BuildString;
    wchar[40] DbgBldStr;
    XSTATE_CONFIG_FEATURE_MSC_INFO XStateData;
    uint ProcessCookie;
}
struct MINIDUMP_MEMORY_INFO
{
    align (4):
    ulong BaseAddress;
    ulong AllocationBase;
    uint AllocationProtect;
    uint __alignment1;
    ulong RegionSize;
    VIRTUAL_ALLOCATION_TYPE State;
    uint Protect;
    uint Type;
    uint __alignment2;
}
struct MINIDUMP_MEMORY_INFO_LIST
{
    align (4):
    uint SizeOfHeader;
    uint SizeOfEntry;
    ulong NumberOfEntries;
}
struct MINIDUMP_THREAD_NAME
{
    align (4):
    uint ThreadId;
    ulong RvaOfThreadName;
}
struct MINIDUMP_THREAD_NAME_LIST
{
    align (4):
    uint NumberOfThreadNames;
    MINIDUMP_THREAD_NAME[1] ThreadNames;
}
struct MINIDUMP_THREAD_INFO
{
    align (4):
    uint ThreadId;
    MINIDUMP_THREAD_INFO_DUMP_FLAGS DumpFlags;
    uint DumpError;
    uint ExitStatus;
    ulong CreateTime;
    ulong ExitTime;
    ulong KernelTime;
    ulong UserTime;
    ulong StartAddress;
    ulong Affinity;
}
struct MINIDUMP_THREAD_INFO_LIST
{
    align (4):
    uint SizeOfHeader;
    uint SizeOfEntry;
    uint NumberOfEntries;
}
struct MINIDUMP_TOKEN_INFO_HEADER
{
    align (4):
    uint TokenSize;
    uint TokenId;
    ulong TokenHandle;
}
struct MINIDUMP_TOKEN_INFO_LIST
{
    align (4):
    uint TokenListSize;
    uint TokenListEntries;
    uint ListHeaderSize;
    uint ElementHeaderSize;
}
struct MINIDUMP_SYSTEM_BASIC_INFORMATION
{
    align (4):
    uint TimerResolution;
    uint PageSize;
    uint NumberOfPhysicalPages;
    uint LowestPhysicalPageNumber;
    uint HighestPhysicalPageNumber;
    uint AllocationGranularity;
    ulong MinimumUserModeAddress;
    ulong MaximumUserModeAddress;
    ulong ActiveProcessorsAffinityMask;
    uint NumberOfProcessors;
}
struct MINIDUMP_SYSTEM_FILECACHE_INFORMATION
{
    align (4):
    ulong CurrentSize;
    ulong PeakSize;
    uint PageFaultCount;
    ulong MinimumWorkingSet;
    ulong MaximumWorkingSet;
    ulong CurrentSizeIncludingTransitionInPages;
    ulong PeakSizeIncludingTransitionInPages;
    uint TransitionRePurposeCount;
    uint Flags;
}
struct MINIDUMP_SYSTEM_BASIC_PERFORMANCE_INFORMATION
{
    align (4):
    ulong AvailablePages;
    ulong CommittedPages;
    ulong CommitLimit;
    ulong PeakCommitment;
}
struct MINIDUMP_SYSTEM_PERFORMANCE_INFORMATION
{
    align (4):
    ulong IdleProcessTime;
    ulong IoReadTransferCount;
    ulong IoWriteTransferCount;
    ulong IoOtherTransferCount;
    uint IoReadOperationCount;
    uint IoWriteOperationCount;
    uint IoOtherOperationCount;
    uint AvailablePages;
    uint CommittedPages;
    uint CommitLimit;
    uint PeakCommitment;
    uint PageFaultCount;
    uint CopyOnWriteCount;
    uint TransitionCount;
    uint CacheTransitionCount;
    uint DemandZeroCount;
    uint PageReadCount;
    uint PageReadIoCount;
    uint CacheReadCount;
    uint CacheIoCount;
    uint DirtyPagesWriteCount;
    uint DirtyWriteIoCount;
    uint MappedPagesWriteCount;
    uint MappedWriteIoCount;
    uint PagedPoolPages;
    uint NonPagedPoolPages;
    uint PagedPoolAllocs;
    uint PagedPoolFrees;
    uint NonPagedPoolAllocs;
    uint NonPagedPoolFrees;
    uint FreeSystemPtes;
    uint ResidentSystemCodePage;
    uint TotalSystemDriverPages;
    uint TotalSystemCodePages;
    uint NonPagedPoolLookasideHits;
    uint PagedPoolLookasideHits;
    uint AvailablePagedPoolPages;
    uint ResidentSystemCachePage;
    uint ResidentPagedPoolPage;
    uint ResidentSystemDriverPage;
    uint CcFastReadNoWait;
    uint CcFastReadWait;
    uint CcFastReadResourceMiss;
    uint CcFastReadNotPossible;
    uint CcFastMdlReadNoWait;
    uint CcFastMdlReadWait;
    uint CcFastMdlReadResourceMiss;
    uint CcFastMdlReadNotPossible;
    uint CcMapDataNoWait;
    uint CcMapDataWait;
    uint CcMapDataNoWaitMiss;
    uint CcMapDataWaitMiss;
    uint CcPinMappedDataCount;
    uint CcPinReadNoWait;
    uint CcPinReadWait;
    uint CcPinReadNoWaitMiss;
    uint CcPinReadWaitMiss;
    uint CcCopyReadNoWait;
    uint CcCopyReadWait;
    uint CcCopyReadNoWaitMiss;
    uint CcCopyReadWaitMiss;
    uint CcMdlReadNoWait;
    uint CcMdlReadWait;
    uint CcMdlReadNoWaitMiss;
    uint CcMdlReadWaitMiss;
    uint CcReadAheadIos;
    uint CcLazyWriteIos;
    uint CcLazyWritePages;
    uint CcDataFlushes;
    uint CcDataPages;
    uint ContextSwitches;
    uint FirstLevelTbFills;
    uint SecondLevelTbFills;
    uint SystemCalls;
    ulong CcTotalDirtyPages;
    ulong CcDirtyPageThreshold;
    long ResidentAvailablePages;
    ulong SharedCommittedPages;
}
struct MINIDUMP_SYSTEM_MEMORY_INFO_1
{
    align (4):
    ushort Revision;
    ushort Flags;
    MINIDUMP_SYSTEM_BASIC_INFORMATION BasicInfo;
    MINIDUMP_SYSTEM_FILECACHE_INFORMATION FileCacheInfo;
    MINIDUMP_SYSTEM_BASIC_PERFORMANCE_INFORMATION BasicPerfInfo;
    MINIDUMP_SYSTEM_PERFORMANCE_INFORMATION PerfInfo;
}
struct MINIDUMP_PROCESS_VM_COUNTERS_1
{
    align (4):
    ushort Revision;
    uint PageFaultCount;
    ulong PeakWorkingSetSize;
    ulong WorkingSetSize;
    ulong QuotaPeakPagedPoolUsage;
    ulong QuotaPagedPoolUsage;
    ulong QuotaPeakNonPagedPoolUsage;
    ulong QuotaNonPagedPoolUsage;
    ulong PagefileUsage;
    ulong PeakPagefileUsage;
    ulong PrivateUsage;
}
struct MINIDUMP_PROCESS_VM_COUNTERS_2
{
    align (4):
    ushort Revision;
    ushort Flags;
    uint PageFaultCount;
    ulong PeakWorkingSetSize;
    ulong WorkingSetSize;
    ulong QuotaPeakPagedPoolUsage;
    ulong QuotaPagedPoolUsage;
    ulong QuotaPeakNonPagedPoolUsage;
    ulong QuotaNonPagedPoolUsage;
    ulong PagefileUsage;
    ulong PeakPagefileUsage;
    ulong PeakVirtualSize;
    ulong VirtualSize;
    ulong PrivateUsage;
    ulong PrivateWorkingSetSize;
    ulong SharedCommitUsage;
    ulong JobSharedCommitUsage;
    ulong JobPrivateCommitUsage;
    ulong JobPeakPrivateCommitUsage;
    ulong JobPrivateCommitLimit;
    ulong JobTotalCommitLimit;
}
struct MINIDUMP_USER_RECORD
{
    align (4):
    uint Type;
    MINIDUMP_LOCATION_DESCRIPTOR Memory;
}
struct MINIDUMP_USER_STREAM
{
    align (4):
    uint Type;
    uint BufferSize;
    void* Buffer;
}
struct MINIDUMP_USER_STREAM_INFORMATION
{
    align (4):
    uint UserStreamCount;
    MINIDUMP_USER_STREAM* UserStreamArray;
}
alias MINIDUMP_CALLBACK_TYPE = int;
enum : int
{
    ModuleCallback               = 0x00000000,
    ThreadCallback               = 0x00000001,
    ThreadExCallback             = 0x00000002,
    IncludeThreadCallback        = 0x00000003,
    IncludeModuleCallback        = 0x00000004,
    MemoryCallback               = 0x00000005,
    CancelCallback               = 0x00000006,
    WriteKernelMinidumpCallback  = 0x00000007,
    KernelMinidumpStatusCallback = 0x00000008,
    RemoveMemoryCallback         = 0x00000009,
    IncludeVmRegionCallback      = 0x0000000a,
    IoStartCallback              = 0x0000000b,
    IoWriteAllCallback           = 0x0000000c,
    IoFinishCallback             = 0x0000000d,
    ReadMemoryFailureCallback    = 0x0000000e,
    SecondaryFlagsCallback       = 0x0000000f,
    IsProcessSnapshotCallback    = 0x00000010,
    VmStartCallback              = 0x00000011,
    VmQueryCallback              = 0x00000012,
    VmPreReadCallback            = 0x00000013,
    VmPostReadCallback           = 0x00000014,
}

/+ [CONFLICTED] struct MINIDUMP_THREAD_CALLBACK
{
    align (4):
    uint ThreadId;
    HANDLE ThreadHandle;
    CONTEXT Context;
    uint SizeOfContext;
    ulong StackBase;
    ulong StackEnd;
}
+/
/+ [CONFLICTED] struct MINIDUMP_THREAD_EX_CALLBACK
{
    align (4):
    uint ThreadId;
    HANDLE ThreadHandle;
    CONTEXT Context;
    uint SizeOfContext;
    ulong StackBase;
    ulong StackEnd;
    ulong BackingStoreBase;
    ulong BackingStoreEnd;
}
+/
struct MINIDUMP_INCLUDE_THREAD_CALLBACK
{
    align (4):
    uint ThreadId;
}
alias THREAD_WRITE_FLAGS = int;
enum : int
{
    ThreadWriteThread            = 0x00000001,
    ThreadWriteStack             = 0x00000002,
    ThreadWriteContext           = 0x00000004,
    ThreadWriteBackingStore      = 0x00000008,
    ThreadWriteInstructionWindow = 0x00000010,
    ThreadWriteThreadData        = 0x00000020,
    ThreadWriteThreadInfo        = 0x00000040,
}

struct MINIDUMP_MODULE_CALLBACK
{
    align (4):
    PWSTR FullPath;
    ulong BaseOfImage;
    uint SizeOfImage;
    uint CheckSum;
    uint TimeDateStamp;
    VS_FIXEDFILEINFO VersionInfo;
    void* CvRecord;
    uint SizeOfCvRecord;
    void* MiscRecord;
    uint SizeOfMiscRecord;
}
struct MINIDUMP_INCLUDE_MODULE_CALLBACK
{
    align (4):
    ulong BaseOfImage;
}
alias MODULE_WRITE_FLAGS = int;
enum : int
{
    ModuleWriteModule        = 0x00000001,
    ModuleWriteDataSeg       = 0x00000002,
    ModuleWriteMiscRecord    = 0x00000004,
    ModuleWriteCvRecord      = 0x00000008,
    ModuleReferencedByMemory = 0x00000010,
    ModuleWriteTlsData       = 0x00000020,
    ModuleWriteCodeSegs      = 0x00000040,
}

struct MINIDUMP_IO_CALLBACK
{
    align (4):
    HANDLE Handle;
    ulong Offset;
    void* Buffer;
    uint BufferBytes;
}
struct MINIDUMP_READ_MEMORY_FAILURE_CALLBACK
{
    align (4):
    ulong Offset;
    uint Bytes;
    HRESULT FailureStatus;
}
struct MINIDUMP_VM_QUERY_CALLBACK
{
    align (4):
    ulong Offset;
}
struct MINIDUMP_VM_PRE_READ_CALLBACK
{
    align (4):
    ulong Offset;
    void* Buffer;
    uint Size;
}
struct MINIDUMP_VM_POST_READ_CALLBACK
{
    align (4):
    ulong Offset;
    void* Buffer;
    uint Size;
    uint Completed;
    HRESULT Status;
}
struct MINIDUMP_CALLBACK_INPUT
{
    align (4):
    uint ProcessId;
    HANDLE ProcessHandle;
    uint CallbackType;
    union
    {
        HRESULT Status;
        MINIDUMP_THREAD_CALLBACK Thread;
        MINIDUMP_THREAD_EX_CALLBACK ThreadEx;
        MINIDUMP_MODULE_CALLBACK Module;
        MINIDUMP_INCLUDE_THREAD_CALLBACK IncludeThread;
        MINIDUMP_INCLUDE_MODULE_CALLBACK IncludeModule;
        MINIDUMP_IO_CALLBACK Io;
        MINIDUMP_READ_MEMORY_FAILURE_CALLBACK ReadMemoryFailure;
        uint SecondaryFlags;
        MINIDUMP_VM_QUERY_CALLBACK VmQuery;
        MINIDUMP_VM_PRE_READ_CALLBACK VmPreRead;
        MINIDUMP_VM_POST_READ_CALLBACK VmPostRead;
    }
}
struct MINIDUMP_CALLBACK_OUTPUT
{
    align (4):
    union
    {
        uint ModuleWriteFlags;
        uint ThreadWriteFlags;
        uint SecondaryFlags;
        struct
        {
            align (4):
            ulong MemoryBase;
            uint MemorySize;
        }
        struct
        {
            BOOL CheckCancel;
            BOOL Cancel;
        }
        HANDLE Handle;
        struct
        {
            MINIDUMP_MEMORY_INFO VmRegion;
            BOOL Continue;
        }
        struct
        {
            HRESULT VmQueryStatus;
            MINIDUMP_MEMORY_INFO VmQueryResult;
        }
        struct
        {
            HRESULT VmReadStatus;
            uint VmReadBytesCompleted;
        }
        HRESULT Status;
    }
}
alias MINIDUMP_TYPE = uint;
enum : uint
{
    MiniDumpNormal                         = 0x00000000,
    MiniDumpWithDataSegs                   = 0x00000001,
    MiniDumpWithFullMemory                 = 0x00000002,
    MiniDumpWithHandleData                 = 0x00000004,
    MiniDumpFilterMemory                   = 0x00000008,
    MiniDumpScanMemory                     = 0x00000010,
    MiniDumpWithUnloadedModules            = 0x00000020,
    MiniDumpWithIndirectlyReferencedMemory = 0x00000040,
    MiniDumpFilterModulePaths              = 0x00000080,
    MiniDumpWithProcessThreadData          = 0x00000100,
    MiniDumpWithPrivateReadWriteMemory     = 0x00000200,
    MiniDumpWithoutOptionalData            = 0x00000400,
    MiniDumpWithFullMemoryInfo             = 0x00000800,
    MiniDumpWithThreadInfo                 = 0x00001000,
    MiniDumpWithCodeSegs                   = 0x00002000,
    MiniDumpWithoutAuxiliaryState          = 0x00004000,
    MiniDumpWithFullAuxiliaryState         = 0x00008000,
    MiniDumpWithPrivateWriteCopyMemory     = 0x00010000,
    MiniDumpIgnoreInaccessibleMemory       = 0x00020000,
    MiniDumpWithTokenInformation           = 0x00040000,
    MiniDumpWithModuleHeaders              = 0x00080000,
    MiniDumpFilterTriage                   = 0x00100000,
    MiniDumpWithAvxXStateContext           = 0x00200000,
    MiniDumpWithIptTrace                   = 0x00400000,
    MiniDumpScanInaccessiblePartialPages   = 0x00800000,
    MiniDumpFilterWriteCombinedMemory      = 0x01000000,
    MiniDumpValidTypeFlags                 = 0x01ffffff,
}

alias MINIDUMP_SECONDARY_FLAGS = int;
enum : int
{
    MiniSecondaryWithoutPowerInfo = 0x00000001,
    MiniSecondaryValidFlags       = 0x00000001,
}

alias MINIDUMP_CALLBACK_ROUTINE = BOOL function(void*, MINIDUMP_CALLBACK_INPUT*, MINIDUMP_CALLBACK_OUTPUT*);
struct MINIDUMP_CALLBACK_INFORMATION
{
    align (4):
    MINIDUMP_CALLBACK_ROUTINE CallbackRoutine;
    void* CallbackParam;
}
enum CLSID_ProcessDebugManager = GUID(0x78a51822, 0x51f4, 0x11d0, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
struct ProcessDebugManager
{
}
enum CLSID_DebugHelper = GUID(0xbfcc060, 0x8c1d, 0x11d0, [0xac, 0xcd, 0x0, 0xaa, 0x0, 0x60, 0x27, 0x5c]);
struct DebugHelper
{
}
enum CLSID_CDebugDocumentHelper = GUID(0x83b8bca6, 0x687c, 0x11d0, [0xa4, 0x5, 0x0, 0xaa, 0x0, 0x60, 0x27, 0x5c]);
struct CDebugDocumentHelper
{
}
enum CLSID_MachineDebugManager_RETAIL = GUID(0xc0a3666, 0x30c9, 0x11d0, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
struct MachineDebugManager_RETAIL
{
}
enum CLSID_MachineDebugManager_DEBUG = GUID(0x49769cec, 0x3a55, 0x4bb0, [0xb6, 0x97, 0x88, 0xfe, 0xde, 0x77, 0xe8, 0xea]);
struct MachineDebugManager_DEBUG
{
}
enum CLSID_DefaultDebugSessionProvider = GUID(0x834128a2, 0x51f4, 0x11d0, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
struct DefaultDebugSessionProvider
{
}
alias SCRIPTLANGUAGEVERSION = int;
enum : int
{
    SCRIPTLANGUAGEVERSION_DEFAULT = 0x00000000,
    SCRIPTLANGUAGEVERSION_5_7     = 0x00000001,
    SCRIPTLANGUAGEVERSION_5_8     = 0x00000002,
    SCRIPTLANGUAGEVERSION_MAX     = 0x000000ff,
}

alias SCRIPTSTATE = int;
enum : int
{
    SCRIPTSTATE_UNINITIALIZED = 0x00000000,
    SCRIPTSTATE_INITIALIZED   = 0x00000005,
    SCRIPTSTATE_STARTED       = 0x00000001,
    SCRIPTSTATE_CONNECTED     = 0x00000002,
    SCRIPTSTATE_DISCONNECTED  = 0x00000003,
    SCRIPTSTATE_CLOSED        = 0x00000004,
}

alias SCRIPTTRACEINFO = int;
enum : int
{
    SCRIPTTRACEINFO_SCRIPTSTART    = 0x00000000,
    SCRIPTTRACEINFO_SCRIPTEND      = 0x00000001,
    SCRIPTTRACEINFO_COMCALLSTART   = 0x00000002,
    SCRIPTTRACEINFO_COMCALLEND     = 0x00000003,
    SCRIPTTRACEINFO_CREATEOBJSTART = 0x00000004,
    SCRIPTTRACEINFO_CREATEOBJEND   = 0x00000005,
    SCRIPTTRACEINFO_GETOBJSTART    = 0x00000006,
    SCRIPTTRACEINFO_GETOBJEND      = 0x00000007,
}

alias SCRIPTTHREADSTATE = int;
enum : int
{
    SCRIPTTHREADSTATE_NOTINSCRIPT = 0x00000000,
    SCRIPTTHREADSTATE_RUNNING     = 0x00000001,
}

alias SCRIPTGCTYPE = int;
enum : int
{
    SCRIPTGCTYPE_NORMAL     = 0x00000000,
    SCRIPTGCTYPE_EXHAUSTIVE = 0x00000001,
}

alias SCRIPTUICITEM = int;
enum : int
{
    SCRIPTUICITEM_INPUTBOX = 0x00000001,
    SCRIPTUICITEM_MSGBOX   = 0x00000002,
}

alias SCRIPTUICHANDLING = int;
enum : int
{
    SCRIPTUICHANDLING_ALLOW       = 0x00000000,
    SCRIPTUICHANDLING_NOUIERROR   = 0x00000001,
    SCRIPTUICHANDLING_NOUIDEFAULT = 0x00000002,
}

enum IID_IActiveScriptSite = GUID(0xdb01a1e3, 0xa42b, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptSite : IUnknown
{
    HRESULT GetLCID(uint*);
    HRESULT GetItemInfo(const(wchar)*, uint, IUnknown*, ITypeInfo*);
    HRESULT GetDocVersionString(BSTR*);
    HRESULT OnScriptTerminate(const(VARIANT)*, const(EXCEPINFO)*);
    HRESULT OnStateChange(SCRIPTSTATE);
    HRESULT OnScriptError(IActiveScriptError);
    HRESULT OnEnterScript();
    HRESULT OnLeaveScript();
}
enum IID_IActiveScriptError = GUID(0xeae1ba61, 0xa4ed, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptError : IUnknown
{
    HRESULT GetExceptionInfo(EXCEPINFO*);
    HRESULT GetSourcePosition(uint*, uint*, int*);
    HRESULT GetSourceLineText(BSTR*);
}
enum IID_IActiveScriptError64 = GUID(0xb21fb2a1, 0x5b8f, 0x4963, [0x8c, 0x21, 0x21, 0x45, 0xf, 0x84, 0xed, 0x7f]);
interface IActiveScriptError64 : IActiveScriptError
{
    HRESULT GetSourcePosition64(ulong*, uint*, int*);
}
enum IID_IActiveScriptSiteWindow = GUID(0xd10f6761, 0x83e9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptSiteWindow : IUnknown
{
    HRESULT GetWindow(HWND*);
    HRESULT EnableModeless(BOOL);
}
enum IID_IActiveScriptSiteUIControl = GUID(0xaedae97e, 0xd7ee, 0x4796, [0xb9, 0x60, 0x7f, 0x9, 0x2a, 0xe8, 0x44, 0xab]);
interface IActiveScriptSiteUIControl : IUnknown
{
    HRESULT GetUIBehavior(SCRIPTUICITEM, SCRIPTUICHANDLING*);
}
enum IID_IActiveScriptSiteInterruptPoll = GUID(0x539698a0, 0xcdca, 0x11cf, [0xa5, 0xeb, 0x0, 0xaa, 0x0, 0x47, 0xa0, 0x63]);
interface IActiveScriptSiteInterruptPoll : IUnknown
{
    HRESULT QueryContinue();
}
enum IID_IActiveScript = GUID(0xbb1a2ae1, 0xa4f9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScript : IUnknown
{
    HRESULT SetScriptSite(IActiveScriptSite);
    HRESULT GetScriptSite(const(GUID)*, void**);
    HRESULT SetScriptState(SCRIPTSTATE);
    HRESULT GetScriptState(SCRIPTSTATE*);
    HRESULT Close();
    HRESULT AddNamedItem(const(wchar)*, uint);
    HRESULT AddTypeLib(const(GUID)*, uint, uint, uint);
    HRESULT GetScriptDispatch(const(wchar)*, IDispatch*);
    HRESULT GetCurrentScriptThreadID(uint*);
    HRESULT GetScriptThreadID(uint, uint*);
    HRESULT GetScriptThreadState(uint, SCRIPTTHREADSTATE*);
    HRESULT InterruptScriptThread(uint, const(EXCEPINFO)*, uint);
    HRESULT Clone(IActiveScript*);
}
enum IID_IActiveScriptParse32 = GUID(0xbb1a2ae2, 0xa4f9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptParse32 : IUnknown
{
    HRESULT InitNew();
    HRESULT AddScriptlet(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, uint, BSTR*, EXCEPINFO*);
    HRESULT ParseScriptText(const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, uint, uint, uint, VARIANT*, EXCEPINFO*);
}
enum IID_IActiveScriptParse64 = GUID(0xc7ef7658, 0xe1ee, 0x480e, [0x97, 0xea, 0xd5, 0x2c, 0xb4, 0xd7, 0x6d, 0x17]);
interface IActiveScriptParse64 : IUnknown
{
    HRESULT InitNew();
    HRESULT AddScriptlet(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, ulong, uint, uint, BSTR*, EXCEPINFO*);
    HRESULT ParseScriptText(const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, ulong, uint, uint, VARIANT*, EXCEPINFO*);
}
enum IID_IActiveScriptParseProcedureOld32 = GUID(0x1cff0050, 0x6fdd, 0x11d0, [0x93, 0x28, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptParseProcedureOld32 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, uint, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedureOld64 = GUID(0x21f57128, 0x8c9, 0x4638, [0xba, 0x12, 0x22, 0xd1, 0x5d, 0x88, 0xdc, 0x5c]);
interface IActiveScriptParseProcedureOld64 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, ulong, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedure32 = GUID(0xaa5b6a80, 0xb834, 0x11d0, [0x93, 0x2f, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptParseProcedure32 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, uint, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedure64 = GUID(0xc64713b6, 0xe029, 0x4cc5, [0x92, 0x0, 0x43, 0x8b, 0x72, 0x89, 0xb, 0x6a]);
interface IActiveScriptParseProcedure64 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, ulong, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedure2_32 = GUID(0x71ee5b20, 0xfb04, 0x11d1, [0xb3, 0xa8, 0x0, 0xa0, 0xc9, 0x11, 0xe8, 0xb2]);
interface IActiveScriptParseProcedure2_32 : IActiveScriptParseProcedure32
{
}
enum IID_IActiveScriptParseProcedure2_64 = GUID(0xfe7c4271, 0x210c, 0x448d, [0x9f, 0x54, 0x76, 0xda, 0xb7, 0x4, 0x7b, 0x28]);
interface IActiveScriptParseProcedure2_64 : IActiveScriptParseProcedure64
{
}
enum IID_IActiveScriptEncode = GUID(0xbb1a2ae3, 0xa4f9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptEncode : IUnknown
{
    HRESULT EncodeSection(const(wchar)*, uint, PWSTR, uint, uint*);
    HRESULT DecodeScript(const(wchar)*, uint, PWSTR, uint, uint*);
    HRESULT GetEncodeProgId(BSTR*);
}
enum IID_IActiveScriptHostEncode = GUID(0xbee9b76e, 0xcfe3, 0x11d1, [0xb7, 0x47, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IActiveScriptHostEncode : IUnknown
{
    HRESULT EncodeScriptHostFile(BSTR, BSTR*, uint, BSTR);
}
enum IID_IBindEventHandler = GUID(0x63cdbcb0, 0xc1b1, 0x11d0, [0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IBindEventHandler : IUnknown
{
    HRESULT BindHandler(const(wchar)*, IDispatch);
}
enum IID_IActiveScriptStats = GUID(0xb8da6310, 0xe19b, 0x11d0, [0x93, 0x3c, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptStats : IUnknown
{
    HRESULT GetStat(uint, uint*, uint*);
    HRESULT GetStatEx(const(GUID)*, uint*, uint*);
    HRESULT ResetStats();
}
enum IID_IActiveScriptProperty = GUID(0x4954e0d0, 0xfbc7, 0x11d1, [0x84, 0x10, 0x0, 0x60, 0x8, 0xc3, 0xfb, 0xfc]);
interface IActiveScriptProperty : IUnknown
{
    HRESULT GetProperty(uint, VARIANT*, VARIANT*);
    HRESULT SetProperty(uint, VARIANT*, VARIANT*);
}
enum IID_ITridentEventSink = GUID(0x1dc9ca50, 0x6ef, 0x11d2, [0x84, 0x15, 0x0, 0x60, 0x8, 0xc3, 0xfb, 0xfc]);
interface ITridentEventSink : IUnknown
{
    HRESULT FireEvent(const(wchar)*, DISPPARAMS*, VARIANT*, EXCEPINFO*);
}
enum IID_IActiveScriptGarbageCollector = GUID(0x6aa2c4a0, 0x2b53, 0x11d4, [0xa2, 0xa0, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
interface IActiveScriptGarbageCollector : IUnknown
{
    HRESULT CollectGarbage(SCRIPTGCTYPE);
}
enum IID_IActiveScriptSIPInfo = GUID(0x764651d0, 0x38de, 0x11d4, [0xa2, 0xa3, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
interface IActiveScriptSIPInfo : IUnknown
{
    HRESULT GetSIPOID(GUID*);
}
enum IID_IActiveScriptSiteTraceInfo = GUID(0x4b7272ae, 0x1955, 0x4bfe, [0x98, 0xb0, 0x78, 0x6, 0x21, 0x88, 0x85, 0x69]);
interface IActiveScriptSiteTraceInfo : IUnknown
{
    HRESULT SendScriptTraceInfo(SCRIPTTRACEINFO, GUID, uint, int, int, ulong);
}
enum IID_IActiveScriptTraceInfo = GUID(0xc35456e7, 0xbebf, 0x4a1b, [0x86, 0xa9, 0x24, 0xd5, 0x6b, 0xe8, 0xb3, 0x69]);
interface IActiveScriptTraceInfo : IUnknown
{
    HRESULT StartScriptTracing(IActiveScriptSiteTraceInfo, GUID);
    HRESULT StopScriptTracing();
}
enum IID_IActiveScriptStringCompare = GUID(0x58562769, 0xed52, 0x42f7, [0x84, 0x3, 0x49, 0x63, 0x51, 0x4e, 0x1f, 0x11]);
interface IActiveScriptStringCompare : IUnknown
{
    HRESULT StrComp(BSTR, BSTR, int*);
}
alias DBGPROP_ATTRIB_FLAGS = uint;
enum : uint
{
    DBGPROP_ATTRIB_NO_ATTRIB              = 0x00000000,
    DBGPROP_ATTRIB_VALUE_IS_INVALID       = 0x00000008,
    DBGPROP_ATTRIB_VALUE_IS_EXPANDABLE    = 0x00000010,
    DBGPROP_ATTRIB_VALUE_IS_FAKE          = 0x00000020,
    DBGPROP_ATTRIB_VALUE_IS_METHOD        = 0x00000100,
    DBGPROP_ATTRIB_VALUE_IS_EVENT         = 0x00000200,
    DBGPROP_ATTRIB_VALUE_IS_RAW_STRING    = 0x00000400,
    DBGPROP_ATTRIB_VALUE_READONLY         = 0x00000800,
    DBGPROP_ATTRIB_ACCESS_PUBLIC          = 0x00001000,
    DBGPROP_ATTRIB_ACCESS_PRIVATE         = 0x00002000,
    DBGPROP_ATTRIB_ACCESS_PROTECTED       = 0x00004000,
    DBGPROP_ATTRIB_ACCESS_FINAL           = 0x00008000,
    DBGPROP_ATTRIB_STORAGE_GLOBAL         = 0x00010000,
    DBGPROP_ATTRIB_STORAGE_STATIC         = 0x00020000,
    DBGPROP_ATTRIB_STORAGE_FIELD          = 0x00040000,
    DBGPROP_ATTRIB_STORAGE_VIRTUAL        = 0x00080000,
    DBGPROP_ATTRIB_TYPE_IS_CONSTANT       = 0x00100000,
    DBGPROP_ATTRIB_TYPE_IS_SYNCHRONIZED   = 0x00200000,
    DBGPROP_ATTRIB_TYPE_IS_VOLATILE       = 0x00400000,
    DBGPROP_ATTRIB_HAS_EXTENDED_ATTRIBS   = 0x00800000,
    DBGPROP_ATTRIB_FRAME_INTRYBLOCK       = 0x01000000,
    DBGPROP_ATTRIB_FRAME_INCATCHBLOCK     = 0x02000000,
    DBGPROP_ATTRIB_FRAME_INFINALLYBLOCK   = 0x04000000,
    DBGPROP_ATTRIB_VALUE_IS_RETURN_VALUE  = 0x08000000,
    DBGPROP_ATTRIB_VALUE_PENDING_MUTATION = 0x10000000,
}

alias DBGPROP_INFO = uint;
enum : uint
{
    DBGPROP_INFO_NAME         = 0x00000001,
    DBGPROP_INFO_TYPE         = 0x00000002,
    DBGPROP_INFO_VALUE        = 0x00000004,
    DBGPROP_INFO_FULLNAME     = 0x00000020,
    DBGPROP_INFO_ATTRIBUTES   = 0x00000008,
    DBGPROP_INFO_DEBUGPROP    = 0x00000010,
    DBGPROP_INFO_BEAUTIFY     = 0x02000000,
    DBGPROP_INFO_CALLTOSTRING = 0x04000000,
    DBGPROP_INFO_AUTOEXPAND   = 0x08000000,
}

alias OBJECT_ATTRIB_FLAGS = int;
enum : int
{
    OBJECT_ATTRIB_NO_ATTRIB            = 0x00000000,
    OBJECT_ATTRIB_NO_NAME              = 0x00000001,
    OBJECT_ATTRIB_NO_TYPE              = 0x00000002,
    OBJECT_ATTRIB_NO_VALUE             = 0x00000004,
    OBJECT_ATTRIB_VALUE_IS_INVALID     = 0x00000008,
    OBJECT_ATTRIB_VALUE_IS_OBJECT      = 0x00000010,
    OBJECT_ATTRIB_VALUE_IS_ENUM        = 0x00000020,
    OBJECT_ATTRIB_VALUE_IS_CUSTOM      = 0x00000040,
    OBJECT_ATTRIB_OBJECT_IS_EXPANDABLE = 0x00000070,
    OBJECT_ATTRIB_VALUE_HAS_CODE       = 0x00000080,
    OBJECT_ATTRIB_TYPE_IS_OBJECT       = 0x00000100,
    OBJECT_ATTRIB_TYPE_HAS_CODE        = 0x00000200,
    OBJECT_ATTRIB_TYPE_IS_EXPANDABLE   = 0x00000100,
    OBJECT_ATTRIB_SLOT_IS_CATEGORY     = 0x00000400,
    OBJECT_ATTRIB_VALUE_READONLY       = 0x00000800,
    OBJECT_ATTRIB_ACCESS_PUBLIC        = 0x00001000,
    OBJECT_ATTRIB_ACCESS_PRIVATE       = 0x00002000,
    OBJECT_ATTRIB_ACCESS_PROTECTED     = 0x00004000,
    OBJECT_ATTRIB_ACCESS_FINAL         = 0x00008000,
    OBJECT_ATTRIB_STORAGE_GLOBAL       = 0x00010000,
    OBJECT_ATTRIB_STORAGE_STATIC       = 0x00020000,
    OBJECT_ATTRIB_STORAGE_FIELD        = 0x00040000,
    OBJECT_ATTRIB_STORAGE_VIRTUAL      = 0x00080000,
    OBJECT_ATTRIB_TYPE_IS_CONSTANT     = 0x00100000,
    OBJECT_ATTRIB_TYPE_IS_SYNCHRONIZED = 0x00200000,
    OBJECT_ATTRIB_TYPE_IS_VOLATILE     = 0x00400000,
    OBJECT_ATTRIB_HAS_EXTENDED_ATTRIBS = 0x00800000,
    OBJECT_ATTRIB_IS_CLASS             = 0x01000000,
    OBJECT_ATTRIB_IS_FUNCTION          = 0x02000000,
    OBJECT_ATTRIB_IS_VARIABLE          = 0x04000000,
    OBJECT_ATTRIB_IS_PROPERTY          = 0x08000000,
    OBJECT_ATTRIB_IS_MACRO             = 0x10000000,
    OBJECT_ATTRIB_IS_TYPE              = 0x20000000,
    OBJECT_ATTRIB_IS_INHERITED         = 0x40000000,
    OBJECT_ATTRIB_IS_INTERFACE         = 0x80000000,
}

alias PROP_INFO_FLAGS = int;
enum : int
{
    PROP_INFO_NAME       = 0x00000001,
    PROP_INFO_TYPE       = 0x00000002,
    PROP_INFO_VALUE      = 0x00000004,
    PROP_INFO_FULLNAME   = 0x00000020,
    PROP_INFO_ATTRIBUTES = 0x00000008,
    PROP_INFO_DEBUGPROP  = 0x00000010,
    PROP_INFO_AUTOEXPAND = 0x08000000,
}

struct DebugPropertyInfo
{
    uint m_dwValidFields;
    BSTR m_bstrName;
    BSTR m_bstrType;
    BSTR m_bstrValue;
    BSTR m_bstrFullName;
    uint m_dwAttrib;
    IDebugProperty m_pDebugProp;
}
alias EX_PROP_INFO_FLAGS = int;
enum : int
{
    EX_PROP_INFO_ID           = 0x00000100,
    EX_PROP_INFO_NTYPE        = 0x00000200,
    EX_PROP_INFO_NVALUE       = 0x00000400,
    EX_PROP_INFO_LOCKBYTES    = 0x00000800,
    EX_PROP_INFO_DEBUGEXTPROP = 0x00001000,
}

struct ExtendedDebugPropertyInfo
{
    uint dwValidFields;
    PWSTR pszName;
    PWSTR pszType;
    PWSTR pszValue;
    PWSTR pszFullName;
    uint dwAttrib;
    IDebugProperty pDebugProp;
    uint nDISPID;
    uint nType;
    VARIANT varValue;
    ILockBytes plbValue;
    IDebugExtendedProperty pDebugExtProp;
}
enum IID_IDebugProperty = GUID(0x51973c50, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugProperty : IUnknown
{
    HRESULT GetPropertyInfo(uint, uint, DebugPropertyInfo*);
    HRESULT GetExtendedInfo(uint, GUID*, VARIANT*);
    HRESULT SetValueAsString(const(wchar)*, uint);
    HRESULT EnumMembers(uint, uint, const(GUID)*, IEnumDebugPropertyInfo*);
    HRESULT GetParent(IDebugProperty*);
}
enum IID_IEnumDebugPropertyInfo = GUID(0x51973c51, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugPropertyInfo : IUnknown
{
    HRESULT Next(uint, DebugPropertyInfo*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugPropertyInfo*);
    HRESULT GetCount(uint*);
}
enum IID_IDebugExtendedProperty = GUID(0x51973c52, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExtendedProperty : IDebugProperty
{
    HRESULT GetExtendedPropertyInfo(uint, uint, ExtendedDebugPropertyInfo*);
    HRESULT EnumExtendedMembers(uint, uint, IEnumDebugExtendedPropertyInfo*);
}
enum IID_IEnumDebugExtendedPropertyInfo = GUID(0x51973c53, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugExtendedPropertyInfo : IUnknown
{
    HRESULT Next(uint, ExtendedDebugPropertyInfo*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugExtendedPropertyInfo*);
    HRESULT GetCount(uint*);
}
enum IID_IPerPropertyBrowsing2 = GUID(0x51973c54, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IPerPropertyBrowsing2 : IUnknown
{
    HRESULT GetDisplayString(int, BSTR*);
    HRESULT MapPropertyToPage(int, GUID*);
    HRESULT GetPredefinedStrings(int, CALPOLESTR*, CADWORD*);
    HRESULT SetPredefinedValue(int, uint);
}
enum IID_IDebugPropertyEnumType_All = GUID(0x51973c55, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugPropertyEnumType_All : IUnknown
{
    HRESULT GetName(BSTR*);
}
enum IID_IDebugPropertyEnumType_Locals = GUID(0x51973c56, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugPropertyEnumType_Locals : IDebugPropertyEnumType_All
{
}
enum IID_IDebugPropertyEnumType_Arguments = GUID(0x51973c57, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugPropertyEnumType_Arguments : IDebugPropertyEnumType_All
{
}
enum IID_IDebugPropertyEnumType_LocalsPlusArgs = GUID(0x51973c58, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugPropertyEnumType_LocalsPlusArgs : IDebugPropertyEnumType_All
{
}
enum IID_IDebugPropertyEnumType_Registers = GUID(0x51973c59, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugPropertyEnumType_Registers : IDebugPropertyEnumType_All
{
}
alias BREAKPOINT_STATE = int;
enum : int
{
    BREAKPOINT_DELETED  = 0x00000000,
    BREAKPOINT_DISABLED = 0x00000001,
    BREAKPOINT_ENABLED  = 0x00000002,
}

alias BREAKREASON = int;
enum : int
{
    BREAKREASON_STEP                = 0x00000000,
    BREAKREASON_BREAKPOINT          = 0x00000001,
    BREAKREASON_DEBUGGER_BLOCK      = 0x00000002,
    BREAKREASON_HOST_INITIATED      = 0x00000003,
    BREAKREASON_LANGUAGE_INITIATED  = 0x00000004,
    BREAKREASON_DEBUGGER_HALT       = 0x00000005,
    BREAKREASON_ERROR               = 0x00000006,
    BREAKREASON_JIT                 = 0x00000007,
    BREAKREASON_MUTATION_BREAKPOINT = 0x00000008,
}

alias BREAKRESUMEACTION = int;
enum : int
{
    BREAKRESUMEACTION_ABORT         = 0x00000000,
    BREAKRESUMEACTION_CONTINUE      = 0x00000001,
    BREAKRESUMEACTION_STEP_INTO     = 0x00000002,
    BREAKRESUMEACTION_STEP_OVER     = 0x00000003,
    BREAKRESUMEACTION_STEP_OUT      = 0x00000004,
    BREAKRESUMEACTION_IGNORE        = 0x00000005,
    BREAKRESUMEACTION_STEP_DOCUMENT = 0x00000006,
}

alias ERRORRESUMEACTION = int;
enum : int
{
    ERRORRESUMEACTION_ReexecuteErrorStatement         = 0x00000000,
    ERRORRESUMEACTION_AbortCallAndReturnErrorToCaller = 0x00000001,
    ERRORRESUMEACTION_SkipErrorStatement              = 0x00000002,
}

alias DOCUMENTNAMETYPE = int;
enum : int
{
    DOCUMENTNAMETYPE_APPNODE        = 0x00000000,
    DOCUMENTNAMETYPE_TITLE          = 0x00000001,
    DOCUMENTNAMETYPE_FILE_TAIL      = 0x00000002,
    DOCUMENTNAMETYPE_URL            = 0x00000003,
    DOCUMENTNAMETYPE_UNIQUE_TITLE   = 0x00000004,
    DOCUMENTNAMETYPE_SOURCE_MAP_URL = 0x00000005,
}

enum IID_IActiveScriptDebug32 = GUID(0x51973c10, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IActiveScriptDebug32 : IUnknown
{
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetScriptletTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT EnumCodeContextsOfPosition(uint, uint, uint, IEnumDebugCodeContexts*);
}
enum IID_IActiveScriptDebug64 = GUID(0xbc437e23, 0xf5b8, 0x47f4, [0xbb, 0x79, 0x7d, 0x1c, 0xe5, 0x48, 0x3b, 0x86]);
interface IActiveScriptDebug64 : IUnknown
{
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetScriptletTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT EnumCodeContextsOfPosition(ulong, uint, uint, IEnumDebugCodeContexts*);
}
enum IID_IActiveScriptSiteDebug32 = GUID(0x51973c11, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IActiveScriptSiteDebug32 : IUnknown
{
    HRESULT GetDocumentContextFromPosition(uint, uint, uint, IDebugDocumentContext*);
    HRESULT GetApplication(IDebugApplication32*);
    HRESULT GetRootApplicationNode(IDebugApplicationNode*);
    HRESULT OnScriptErrorDebug(IActiveScriptErrorDebug, BOOL*, BOOL*);
}
enum IID_IActiveScriptSiteDebug64 = GUID(0xd6b96b0a, 0x7463, 0x402c, [0x92, 0xac, 0x89, 0x98, 0x42, 0x26, 0x94, 0x2f]);
interface IActiveScriptSiteDebug64 : IUnknown
{
    HRESULT GetDocumentContextFromPosition(ulong, uint, uint, IDebugDocumentContext*);
    HRESULT GetApplication(IDebugApplication64*);
    HRESULT GetRootApplicationNode(IDebugApplicationNode*);
    HRESULT OnScriptErrorDebug(IActiveScriptErrorDebug, BOOL*, BOOL*);
}
enum IID_IActiveScriptSiteDebugEx = GUID(0xbb722ccb, 0x6ad2, 0x41c6, [0xb7, 0x80, 0xaf, 0x9c, 0x3, 0xee, 0x69, 0xf5]);
interface IActiveScriptSiteDebugEx : IUnknown
{
    HRESULT OnCanNotJITScriptErrorDebug(IActiveScriptErrorDebug, BOOL*);
}
enum IID_IActiveScriptErrorDebug = GUID(0x51973c12, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IActiveScriptErrorDebug : IActiveScriptError
{
    HRESULT GetDocumentContext(IDebugDocumentContext*);
    HRESULT GetStackFrame(IDebugStackFrame*);
}
enum IID_IDebugCodeContext = GUID(0x51973c13, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugCodeContext : IUnknown
{
    HRESULT GetDocumentContext(IDebugDocumentContext*);
    HRESULT SetBreakPoint(BREAKPOINT_STATE);
}
enum IID_IDebugExpression = GUID(0x51973c14, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExpression : IUnknown
{
    HRESULT Start(IDebugExpressionCallBack);
    HRESULT Abort();
    HRESULT QueryIsComplete();
    HRESULT GetResultAsString(HRESULT*, BSTR*);
    HRESULT GetResultAsDebugProperty(HRESULT*, IDebugProperty*);
}
enum IID_IDebugExpressionContext = GUID(0x51973c15, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExpressionContext : IUnknown
{
    HRESULT ParseLanguageText(const(wchar)*, uint, const(wchar)*, uint, IDebugExpression*);
    HRESULT GetLanguageInfo(BSTR*, GUID*);
}
enum IID_IDebugExpressionCallBack = GUID(0x51973c16, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExpressionCallBack : IUnknown
{
    HRESULT onComplete();
}
enum IID_IDebugStackFrame = GUID(0x51973c17, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugStackFrame : IUnknown
{
    HRESULT GetCodeContext(IDebugCodeContext*);
    HRESULT GetDescriptionString(BOOL, BSTR*);
    HRESULT GetLanguageString(BOOL, BSTR*);
    HRESULT GetThread(IDebugApplicationThread*);
    HRESULT GetDebugProperty(IDebugProperty*);
}
enum IID_IDebugStackFrameSniffer = GUID(0x51973c18, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugStackFrameSniffer : IUnknown
{
    HRESULT EnumStackFrames(IEnumDebugStackFrames*);
}
enum IID_IDebugStackFrameSnifferEx32 = GUID(0x51973c19, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugStackFrameSnifferEx32 : IDebugStackFrameSniffer
{
    HRESULT EnumStackFramesEx32(uint, IEnumDebugStackFrames*);
}
enum IID_IDebugStackFrameSnifferEx64 = GUID(0x8cd12af4, 0x49c1, 0x4d52, [0x8d, 0x8a, 0xc1, 0x46, 0xf4, 0x75, 0x81, 0xaa]);
interface IDebugStackFrameSnifferEx64 : IDebugStackFrameSniffer
{
    HRESULT EnumStackFramesEx64(ulong, IEnumDebugStackFrames64*);
}
enum IID_IDebugSyncOperation = GUID(0x51973c1a, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugSyncOperation : IUnknown
{
    HRESULT GetTargetThread(IDebugApplicationThread*);
    HRESULT Execute(IUnknown*);
    HRESULT InProgressAbort();
}
enum IID_IDebugAsyncOperation = GUID(0x51973c1b, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugAsyncOperation : IUnknown
{
    HRESULT GetSyncDebugOperation(IDebugSyncOperation*);
    HRESULT Start(IDebugAsyncOperationCallBack);
    HRESULT Abort();
    HRESULT QueryIsComplete();
    HRESULT GetResult(HRESULT*, IUnknown*);
}
enum IID_IDebugAsyncOperationCallBack = GUID(0x51973c1c, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugAsyncOperationCallBack : IUnknown
{
    HRESULT onComplete();
}
enum IID_IEnumDebugCodeContexts = GUID(0x51973c1d, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugCodeContexts : IUnknown
{
    HRESULT Next(uint, IDebugCodeContext*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugCodeContexts*);
}
struct DebugStackFrameDescriptor
{
    IDebugStackFrame pdsf;
    uint dwMin;
    uint dwLim;
    BOOL fFinal;
    IUnknown punkFinal;
}
struct DebugStackFrameDescriptor64
{
    IDebugStackFrame pdsf;
    ulong dwMin;
    ulong dwLim;
    BOOL fFinal;
    IUnknown punkFinal;
}
enum IID_IEnumDebugStackFrames = GUID(0x51973c1e, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugStackFrames : IUnknown
{
    HRESULT Next(uint, DebugStackFrameDescriptor*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugStackFrames*);
}
enum IID_IEnumDebugStackFrames64 = GUID(0xdc38853, 0xc1b0, 0x4176, [0xa9, 0x84, 0xb2, 0x98, 0x36, 0x10, 0x27, 0xaf]);
interface IEnumDebugStackFrames64 : IEnumDebugStackFrames
{
    HRESULT Next64(uint, DebugStackFrameDescriptor64*, uint*);
}
enum IID_IDebugDocumentInfo = GUID(0x51973c1f, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentInfo : IUnknown
{
    HRESULT GetName(DOCUMENTNAMETYPE, BSTR*);
    HRESULT GetDocumentClassId(GUID*);
}
enum IID_IDebugDocumentProvider = GUID(0x51973c20, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentProvider : IDebugDocumentInfo
{
    HRESULT GetDocument(IDebugDocument*);
}
enum IID_IDebugDocument = GUID(0x51973c21, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocument : IDebugDocumentInfo
{
}
enum IID_IDebugDocumentText = GUID(0x51973c22, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentText : IDebugDocument
{
    HRESULT GetDocumentAttributes(uint*);
    HRESULT GetSize(uint*, uint*);
    HRESULT GetPositionOfLine(uint, uint*);
    HRESULT GetLineOfPosition(uint, uint*, uint*);
    HRESULT GetText(uint, PWSTR, ushort*, uint*, uint);
    HRESULT GetPositionOfContext(IDebugDocumentContext, uint*, uint*);
    HRESULT GetContextOfPosition(uint, uint, IDebugDocumentContext*);
}
enum IID_IDebugDocumentTextEvents = GUID(0x51973c23, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentTextEvents : IUnknown
{
    HRESULT onDestroy();
    HRESULT onInsertText(uint, uint);
    HRESULT onRemoveText(uint, uint);
    HRESULT onReplaceText(uint, uint);
    HRESULT onUpdateTextAttributes(uint, uint);
    HRESULT onUpdateDocumentAttributes(uint);
}
enum IID_IDebugDocumentTextAuthor = GUID(0x51973c24, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentTextAuthor : IDebugDocumentText
{
    HRESULT InsertText(uint, uint, PWSTR);
    HRESULT RemoveText(uint, uint);
    HRESULT ReplaceText(uint, uint, PWSTR);
}
enum IID_IDebugDocumentTextExternalAuthor = GUID(0x51973c25, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentTextExternalAuthor : IUnknown
{
    HRESULT GetPathName(BSTR*, BOOL*);
    HRESULT GetFileName(BSTR*);
    HRESULT NotifyChanged();
}
enum IID_IDebugDocumentHelper32 = GUID(0x51973c26, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentHelper32 : IUnknown
{
    HRESULT Init(IDebugApplication32, const(wchar)*, const(wchar)*, uint);
    HRESULT Attach(IDebugDocumentHelper32);
    HRESULT Detach();
    HRESULT AddUnicodeText(const(wchar)*);
    HRESULT AddDBCSText(const(char)*);
    HRESULT SetDebugDocumentHost(IDebugDocumentHost);
    HRESULT AddDeferredText(uint, uint);
    HRESULT DefineScriptBlock(uint, uint, IActiveScript, BOOL, uint*);
    HRESULT SetDefaultTextAttr(ushort);
    HRESULT SetTextAttributes(uint, uint, ushort*);
    HRESULT SetLongName(const(wchar)*);
    HRESULT SetShortName(const(wchar)*);
    HRESULT SetDocumentAttr(uint);
    HRESULT GetDebugApplicationNode(IDebugApplicationNode*);
    HRESULT GetScriptBlockInfo(uint, IActiveScript*, uint*, uint*);
    HRESULT CreateDebugDocumentContext(uint, uint, IDebugDocumentContext*);
    HRESULT BringDocumentToTop();
    HRESULT BringDocumentContextToTop(IDebugDocumentContext);
}
enum IID_IDebugDocumentHelper64 = GUID(0xc4c7363c, 0x20fd, 0x47f9, [0xbd, 0x82, 0x48, 0x55, 0xe0, 0x15, 0x8, 0x71]);
interface IDebugDocumentHelper64 : IUnknown
{
    HRESULT Init(IDebugApplication64, const(wchar)*, const(wchar)*, uint);
    HRESULT Attach(IDebugDocumentHelper64);
    HRESULT Detach();
    HRESULT AddUnicodeText(const(wchar)*);
    HRESULT AddDBCSText(const(char)*);
    HRESULT SetDebugDocumentHost(IDebugDocumentHost);
    HRESULT AddDeferredText(uint, uint);
    HRESULT DefineScriptBlock(uint, uint, IActiveScript, BOOL, ulong*);
    HRESULT SetDefaultTextAttr(ushort);
    HRESULT SetTextAttributes(uint, uint, ushort*);
    HRESULT SetLongName(const(wchar)*);
    HRESULT SetShortName(const(wchar)*);
    HRESULT SetDocumentAttr(uint);
    HRESULT GetDebugApplicationNode(IDebugApplicationNode*);
    HRESULT GetScriptBlockInfo(ulong, IActiveScript*, uint*, uint*);
    HRESULT CreateDebugDocumentContext(uint, uint, IDebugDocumentContext*);
    HRESULT BringDocumentToTop();
    HRESULT BringDocumentContextToTop(IDebugDocumentContext);
}
enum IID_IDebugDocumentHost = GUID(0x51973c27, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentHost : IUnknown
{
    HRESULT GetDeferredText(uint, PWSTR, ushort*, uint*, uint);
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT OnCreateDocumentContext(IUnknown*);
    HRESULT GetPathName(BSTR*, BOOL*);
    HRESULT GetFileName(BSTR*);
    HRESULT NotifyChanged();
}
enum IID_IDebugDocumentContext = GUID(0x51973c28, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentContext : IUnknown
{
    HRESULT GetDocument(IDebugDocument*);
    HRESULT EnumCodeContexts(IEnumDebugCodeContexts*);
}
enum IID_IDebugSessionProvider = GUID(0x51973c29, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugSessionProvider : IUnknown
{
    HRESULT StartDebugSession(IRemoteDebugApplication);
}
enum IID_IApplicationDebugger = GUID(0x51973c2a, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IApplicationDebugger : IUnknown
{
    HRESULT QueryAlive();
    HRESULT CreateInstanceAtDebugger(const(GUID)*, IUnknown, uint, const(GUID)*, IUnknown*);
    HRESULT onDebugOutput(const(wchar)*);
    HRESULT onHandleBreakPoint(IRemoteDebugApplicationThread, BREAKREASON, IActiveScriptErrorDebug);
    HRESULT onClose();
    HRESULT onDebuggerEvent(const(GUID)*, IUnknown);
}
enum IID_IApplicationDebuggerUI = GUID(0x51973c2b, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IApplicationDebuggerUI : IUnknown
{
    HRESULT BringDocumentToTop(IDebugDocumentText);
    HRESULT BringDocumentContextToTop(IDebugDocumentContext);
}
enum IID_IMachineDebugManager = GUID(0x51973c2c, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IMachineDebugManager : IUnknown
{
    HRESULT AddApplication(IRemoteDebugApplication, uint*);
    HRESULT RemoveApplication(uint);
    HRESULT EnumApplications(IEnumRemoteDebugApplications*);
}
enum IID_IMachineDebugManagerCookie = GUID(0x51973c2d, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IMachineDebugManagerCookie : IUnknown
{
    HRESULT AddApplication(IRemoteDebugApplication, uint, uint*);
    HRESULT RemoveApplication(uint, uint);
    HRESULT EnumApplications(IEnumRemoteDebugApplications*);
}
enum IID_IMachineDebugManagerEvents = GUID(0x51973c2e, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IMachineDebugManagerEvents : IUnknown
{
    HRESULT onAddApplication(IRemoteDebugApplication, uint);
    HRESULT onRemoveApplication(IRemoteDebugApplication, uint);
}
enum IID_IProcessDebugManager32 = GUID(0x51973c2f, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IProcessDebugManager32 : IUnknown
{
    HRESULT CreateApplication(IDebugApplication32*);
    HRESULT GetDefaultApplication(IDebugApplication32*);
    HRESULT AddApplication(IDebugApplication32, uint*);
    HRESULT RemoveApplication(uint);
    HRESULT CreateDebugDocumentHelper(IUnknown, IDebugDocumentHelper32*);
}
enum IID_IProcessDebugManager64 = GUID(0x56b9fc1c, 0x63a9, 0x4cc1, [0xac, 0x21, 0x8, 0x7d, 0x69, 0xa1, 0x7f, 0xab]);
interface IProcessDebugManager64 : IUnknown
{
    HRESULT CreateApplication(IDebugApplication64*);
    HRESULT GetDefaultApplication(IDebugApplication64*);
    HRESULT AddApplication(IDebugApplication64, uint*);
    HRESULT RemoveApplication(uint);
    HRESULT CreateDebugDocumentHelper(IUnknown, IDebugDocumentHelper64*);
}
enum IID_IRemoteDebugApplication = GUID(0x51973c30, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IRemoteDebugApplication : IUnknown
{
    HRESULT ResumeFromBreakPoint(IRemoteDebugApplicationThread, BREAKRESUMEACTION, ERRORRESUMEACTION);
    HRESULT CauseBreak();
    HRESULT ConnectDebugger(IApplicationDebugger);
    HRESULT DisconnectDebugger();
    HRESULT GetDebugger(IApplicationDebugger*);
    HRESULT CreateInstanceAtApplication(const(GUID)*, IUnknown, uint, const(GUID)*, IUnknown*);
    HRESULT QueryAlive();
    HRESULT EnumThreads(IEnumRemoteDebugApplicationThreads*);
    HRESULT GetName(BSTR*);
    HRESULT GetRootNode(IDebugApplicationNode*);
    HRESULT EnumGlobalExpressionContexts(IEnumDebugExpressionContexts*);
}
enum IID_IDebugApplication32 = GUID(0x51973c32, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplication32 : IRemoteDebugApplication
{
    HRESULT SetName(const(wchar)*);
    HRESULT StepOutComplete();
    HRESULT DebugOutput(const(wchar)*);
    HRESULT StartDebugSession();
    HRESULT HandleBreakPoint(BREAKREASON, BREAKRESUMEACTION*);
    HRESULT Close();
    HRESULT GetBreakFlags(uint*, IRemoteDebugApplicationThread*);
    HRESULT GetCurrentThread(IDebugApplicationThread*);
    HRESULT CreateAsyncDebugOperation(IDebugSyncOperation, IDebugAsyncOperation*);
    HRESULT AddStackFrameSniffer(IDebugStackFrameSniffer, uint*);
    HRESULT RemoveStackFrameSniffer(uint);
    HRESULT QueryCurrentThreadIsDebuggerThread();
    HRESULT SynchronousCallInDebuggerThread(IDebugThreadCall32, uint, uint, uint);
    HRESULT CreateApplicationNode(IDebugApplicationNode*);
    HRESULT FireDebuggerEvent(const(GUID)*, IUnknown);
    HRESULT HandleRuntimeError(IActiveScriptErrorDebug, IActiveScriptSite, BREAKRESUMEACTION*, ERRORRESUMEACTION*, BOOL*);
    BOOL FCanJitDebug();
    BOOL FIsAutoJitDebugEnabled();
    HRESULT AddGlobalExpressionContextProvider(IProvideExpressionContexts, uint*);
    HRESULT RemoveGlobalExpressionContextProvider(uint);
}
enum IID_IDebugApplication64 = GUID(0x4dedc754, 0x4c7, 0x4f10, [0x9e, 0x60, 0x16, 0xa3, 0x90, 0xfe, 0x6e, 0x62]);
interface IDebugApplication64 : IRemoteDebugApplication
{
    HRESULT SetName(const(wchar)*);
    HRESULT StepOutComplete();
    HRESULT DebugOutput(const(wchar)*);
    HRESULT StartDebugSession();
    HRESULT HandleBreakPoint(BREAKREASON, BREAKRESUMEACTION*);
    HRESULT Close();
    HRESULT GetBreakFlags(uint*, IRemoteDebugApplicationThread*);
    HRESULT GetCurrentThread(IDebugApplicationThread*);
    HRESULT CreateAsyncDebugOperation(IDebugSyncOperation, IDebugAsyncOperation*);
    HRESULT AddStackFrameSniffer(IDebugStackFrameSniffer, uint*);
    HRESULT RemoveStackFrameSniffer(uint);
    HRESULT QueryCurrentThreadIsDebuggerThread();
    HRESULT SynchronousCallInDebuggerThread(IDebugThreadCall64, ulong, ulong, ulong);
    HRESULT CreateApplicationNode(IDebugApplicationNode*);
    HRESULT FireDebuggerEvent(const(GUID)*, IUnknown);
    HRESULT HandleRuntimeError(IActiveScriptErrorDebug, IActiveScriptSite, BREAKRESUMEACTION*, ERRORRESUMEACTION*, BOOL*);
    BOOL FCanJitDebug();
    BOOL FIsAutoJitDebugEnabled();
    HRESULT AddGlobalExpressionContextProvider(IProvideExpressionContexts, ulong*);
    HRESULT RemoveGlobalExpressionContextProvider(ulong);
}
enum IID_IRemoteDebugApplicationEvents = GUID(0x51973c33, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IRemoteDebugApplicationEvents : IUnknown
{
    HRESULT OnConnectDebugger(IApplicationDebugger);
    HRESULT OnDisconnectDebugger();
    HRESULT OnSetName(const(wchar)*);
    HRESULT OnDebugOutput(const(wchar)*);
    HRESULT OnClose();
    HRESULT OnEnterBreakPoint(IRemoteDebugApplicationThread);
    HRESULT OnLeaveBreakPoint(IRemoteDebugApplicationThread);
    HRESULT OnCreateThread(IRemoteDebugApplicationThread);
    HRESULT OnDestroyThread(IRemoteDebugApplicationThread);
    HRESULT OnBreakFlagChange(uint, IRemoteDebugApplicationThread);
}
enum IID_IDebugApplicationNode = GUID(0x51973c34, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplicationNode : IDebugDocumentProvider
{
    HRESULT EnumChildren(IEnumDebugApplicationNodes*);
    HRESULT GetParent(IDebugApplicationNode*);
    HRESULT SetDocumentProvider(IDebugDocumentProvider);
    HRESULT Close();
    HRESULT Attach(IDebugApplicationNode);
    HRESULT Detach();
}
enum IID_IDebugApplicationNodeEvents = GUID(0x51973c35, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplicationNodeEvents : IUnknown
{
    HRESULT onAddChild(IDebugApplicationNode);
    HRESULT onRemoveChild(IDebugApplicationNode);
    HRESULT onDetach();
    HRESULT onAttach(IDebugApplicationNode);
}
enum IID_AsyncIDebugApplicationNodeEvents = GUID(0xa2e3aa3b, 0xaa8d, 0x4ebf, [0x84, 0xcd, 0x64, 0x8b, 0x73, 0x7b, 0x8c, 0x13]);
interface AsyncIDebugApplicationNodeEvents : IUnknown
{
    HRESULT Begin_onAddChild(IDebugApplicationNode);
    HRESULT Finish_onAddChild();
    HRESULT Begin_onRemoveChild(IDebugApplicationNode);
    HRESULT Finish_onRemoveChild();
    HRESULT Begin_onDetach();
    HRESULT Finish_onDetach();
    HRESULT Begin_onAttach(IDebugApplicationNode);
    HRESULT Finish_onAttach();
}
enum IID_IDebugThreadCall32 = GUID(0x51973c36, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugThreadCall32 : IUnknown
{
    HRESULT ThreadCallHandler(uint, uint, uint);
}
enum IID_IDebugThreadCall64 = GUID(0xcb3fa335, 0xe979, 0x42fd, [0x9f, 0xcf, 0xa7, 0x54, 0x6a, 0xf, 0x39, 0x5]);
interface IDebugThreadCall64 : IUnknown
{
    HRESULT ThreadCallHandler(ulong, ulong, ulong);
}
enum IID_IRemoteDebugApplicationThread = GUID(0x51973c37, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IRemoteDebugApplicationThread : IUnknown
{
    HRESULT GetSystemThreadId(uint*);
    HRESULT GetApplication(IRemoteDebugApplication*);
    HRESULT EnumStackFrames(IEnumDebugStackFrames*);
    HRESULT GetDescription(BSTR*, BSTR*);
    HRESULT SetNextStatement(IDebugStackFrame, IDebugCodeContext);
    HRESULT GetState(uint*);
    HRESULT Suspend(uint*);
    HRESULT Resume(uint*);
    HRESULT GetSuspendCount(uint*);
}
enum IID_IDebugApplicationThread = GUID(0x51973c38, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplicationThread : IRemoteDebugApplicationThread
{
    HRESULT SynchronousCallIntoThread32(IDebugThreadCall32, uint, uint, uint);
    HRESULT QueryIsCurrentThread();
    HRESULT QueryIsDebuggerThread();
    HRESULT SetDescription(const(wchar)*);
    HRESULT SetStateString(const(wchar)*);
}
enum IID_IDebugApplicationThread64 = GUID(0x9dac5886, 0xdbad, 0x456d, [0x9d, 0xee, 0x5d, 0xec, 0x39, 0xab, 0x3d, 0xda]);
interface IDebugApplicationThread64 : IDebugApplicationThread
{
    HRESULT SynchronousCallIntoThread64(IDebugThreadCall64, ulong, ulong, ulong);
}
enum IID_IDebugCookie = GUID(0x51973c39, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugCookie : IUnknown
{
    HRESULT SetDebugCookie(uint);
}
enum IID_IEnumDebugApplicationNodes = GUID(0x51973c3a, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugApplicationNodes : IUnknown
{
    HRESULT Next(uint, IDebugApplicationNode*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugApplicationNodes*);
}
enum IID_IEnumRemoteDebugApplications = GUID(0x51973c3b, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumRemoteDebugApplications : IUnknown
{
    HRESULT Next(uint, IRemoteDebugApplication*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumRemoteDebugApplications*);
}
enum IID_IEnumRemoteDebugApplicationThreads = GUID(0x51973c3c, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumRemoteDebugApplicationThreads : IUnknown
{
    HRESULT Next(uint, IRemoteDebugApplicationThread*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumRemoteDebugApplicationThreads*);
}
enum IID_IDebugFormatter = GUID(0x51973c05, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugFormatter : IUnknown
{
    HRESULT GetStringForVariant(VARIANT*, uint, BSTR*);
    HRESULT GetVariantForString(const(wchar)*, VARIANT*);
    HRESULT GetStringForVarType(VARENUM, TYPEDESC*, BSTR*);
}
enum IID_ISimpleConnectionPoint = GUID(0x51973c3e, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface ISimpleConnectionPoint : IUnknown
{
    HRESULT GetEventCount(uint*);
    HRESULT DescribeEvents(uint, uint, int*, BSTR*, uint*);
    HRESULT Advise(IDispatch, uint*);
    HRESULT Unadvise(uint);
}
enum IID_IDebugHelper = GUID(0x51973c3f, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugHelper : IUnknown
{
    HRESULT CreatePropertyBrowser(VARIANT*, const(wchar)*, IDebugApplicationThread, IDebugProperty*);
    HRESULT CreatePropertyBrowserEx(VARIANT*, const(wchar)*, IDebugApplicationThread, IDebugFormatter, IDebugProperty*);
    HRESULT CreateSimpleConnectionPoint(IDispatch, ISimpleConnectionPoint*);
}
enum IID_IEnumDebugExpressionContexts = GUID(0x51973c40, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugExpressionContexts : IUnknown
{
    HRESULT Next(uint, IDebugExpressionContext*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugExpressionContexts*);
}
enum IID_IProvideExpressionContexts = GUID(0x51973c41, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IProvideExpressionContexts : IUnknown
{
    HRESULT EnumExpressionContexts(IEnumDebugExpressionContexts*);
}
alias PROFILER_SCRIPT_TYPE = int;
enum : int
{
    PROFILER_SCRIPT_TYPE_USER    = 0x00000000,
    PROFILER_SCRIPT_TYPE_DYNAMIC = 0x00000001,
    PROFILER_SCRIPT_TYPE_NATIVE  = 0x00000002,
    PROFILER_SCRIPT_TYPE_DOM     = 0x00000003,
}

alias PROFILER_EVENT_MASK = uint;
enum : uint
{
    PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL = 0x00000001,
    PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL = 0x00000002,
    PROFILER_EVENT_MASK_TRACE_DOM_FUNCTION_CALL    = 0x00000004,
    PROFILER_EVENT_MASK_TRACE_ALL                  = 0x00000003,
    PROFILER_EVENT_MASK_TRACE_ALL_WITH_DOM         = 0x00000007,
}

enum IID_IActiveScriptProfilerControl = GUID(0x784b5ff0, 0x69b0, 0x47d1, [0xa7, 0xdc, 0x25, 0x18, 0xf4, 0x23, 0xe, 0x90]);
interface IActiveScriptProfilerControl : IUnknown
{
    HRESULT StartProfiling(const(GUID)*, uint, uint);
    HRESULT SetProfilerEventMask(uint);
    HRESULT StopProfiling(HRESULT);
}
enum IID_IActiveScriptProfilerControl2 = GUID(0x47810165, 0x498f, 0x40be, [0x94, 0xf1, 0x65, 0x35, 0x57, 0xe9, 0xe7, 0xda]);
interface IActiveScriptProfilerControl2 : IActiveScriptProfilerControl
{
    HRESULT CompleteProfilerStart();
    HRESULT PrepareProfilerStop();
}
alias PROFILER_HEAP_OBJECT_FLAGS = uint;
enum : uint
{
    PROFILER_HEAP_OBJECT_FLAGS_NEW_OBJECT            = 0x00000001,
    PROFILER_HEAP_OBJECT_FLAGS_IS_ROOT               = 0x00000002,
    PROFILER_HEAP_OBJECT_FLAGS_SITE_CLOSED           = 0x00000004,
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL              = 0x00000008,
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_UNKNOWN      = 0x00000010,
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_DISPATCH     = 0x00000020,
    PROFILER_HEAP_OBJECT_FLAGS_SIZE_APPROXIMATE      = 0x00000040,
    PROFILER_HEAP_OBJECT_FLAGS_SIZE_UNAVAILABLE      = 0x00000080,
    PROFILER_HEAP_OBJECT_FLAGS_NEW_STATE_UNAVAILABLE = 0x00000100,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_INSTANCE        = 0x00000200,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_RUNTIMECLASS    = 0x00000400,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_DELEGATE        = 0x00000800,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_NAMESPACE       = 0x00001000,
}

alias PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE = int;
enum : int
{
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_PROTOTYPE                  = 0x00000001,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_FUNCTION_NAME              = 0x00000002,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SCOPE_LIST                 = 0x00000003,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INTERNAL_PROPERTY          = 0x00000004,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_NAME_PROPERTIES            = 0x00000005,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INDEX_PROPERTIES           = 0x00000006,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_ATTRIBUTES_SIZE    = 0x00000007,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_TEXT_CHILDREN_SIZE = 0x00000008,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_RELATIONSHIPS              = 0x00000009,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WINRTEVENTS                = 0x0000000a,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WEAKMAP_COLLECTION_LIST    = 0x0000000b,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAP_COLLECTION_LIST        = 0x0000000c,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SET_COLLECTION_LIST        = 0x0000000d,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAX_VALUE                  = 0x0000000d,
}

alias PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS = uint;
enum : uint
{
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_NONE            = 0x00000000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_GET_ACCESSOR = 0x00010000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_SET_ACCESSOR = 0x00020000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_LET_VARIABLE    = 0x00040000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_CONST_VARIABLE  = 0x00080000,
}

alias PROFILER_HEAP_ENUM_FLAGS = uint;
enum : uint
{
    PROFILER_HEAP_ENUM_FLAGS_NONE                     = 0x00000000,
    PROFILER_HEAP_ENUM_FLAGS_STORE_RELATIONSHIP_FLAGS = 0x00000001,
    PROFILER_HEAP_ENUM_FLAGS_SUBSTRINGS               = 0x00000002,
    PROFILER_HEAP_ENUM_FLAGS_RELATIONSHIP_SUBSTRINGS  = 0x00000003,
}

struct PROFILER_HEAP_OBJECT_SCOPE_LIST
{
    uint count;
    ulong[1] scopes;
}
alias PROFILER_RELATIONSHIP_INFO = int;
enum : int
{
    PROFILER_PROPERTY_TYPE_NUMBER          = 0x00000001,
    PROFILER_PROPERTY_TYPE_STRING          = 0x00000002,
    PROFILER_PROPERTY_TYPE_HEAP_OBJECT     = 0x00000003,
    PROFILER_PROPERTY_TYPE_EXTERNAL_OBJECT = 0x00000004,
    PROFILER_PROPERTY_TYPE_BSTR            = 0x00000005,
    PROFILER_PROPERTY_TYPE_SUBSTRING       = 0x00000006,
}

struct PROFILER_PROPERTY_TYPE_SUBSTRING_INFO
{
    uint length;
    const(wchar)* value;
}
struct PROFILER_HEAP_OBJECT_RELATIONSHIP
{
    uint relationshipId;
    PROFILER_RELATIONSHIP_INFO relationshipInfo;
    union
    {
        double numberValue;
        const(wchar)* stringValue;
        BSTR bstrValue;
        ulong objectId;
        void* externalObjectAddress;
        PROFILER_PROPERTY_TYPE_SUBSTRING_INFO* subString;
    }
}
struct PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST
{
    uint count;
    PROFILER_HEAP_OBJECT_RELATIONSHIP[1] elements;
}
struct PROFILER_HEAP_OBJECT_OPTIONAL_INFO
{
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE infoType;
    union
    {
        ulong prototype;
        const(wchar)* functionName;
        uint elementAttributesSize;
        uint elementTextChildrenSize;
        PROFILER_HEAP_OBJECT_SCOPE_LIST* scopeList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP* internalProperty;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* namePropertyList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* indexPropertyList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* relationshipList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* eventList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* weakMapCollectionList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* mapCollectionList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* setCollectionList;
    }
}
struct PROFILER_HEAP_OBJECT
{
    uint size;
    union
    {
        ulong objectId;
        void* externalObjectAddress;
    }
    uint typeNameId;
    uint flags;
    ushort unused;
    ushort optionalInfoCount;
}
enum IID_IActiveScriptProfilerHeapEnum = GUID(0x32e4694e, 0xd37, 0x419b, [0xb9, 0x3d, 0xfa, 0x20, 0xde, 0xd6, 0xe8, 0xea]);
interface IActiveScriptProfilerHeapEnum : IUnknown
{
    HRESULT Next(uint, PROFILER_HEAP_OBJECT**, uint*);
    HRESULT GetOptionalInfo(PROFILER_HEAP_OBJECT*, uint, PROFILER_HEAP_OBJECT_OPTIONAL_INFO*);
    HRESULT FreeObjectAndOptionalInfo(uint, PROFILER_HEAP_OBJECT**);
    HRESULT GetNameIdMap(PWSTR***, uint*);
}
enum IID_IActiveScriptProfilerControl3 = GUID(0xb403015, 0xf381, 0x4023, [0xa5, 0xd0, 0x6f, 0xed, 0x7, 0x6d, 0xe7, 0x16]);
interface IActiveScriptProfilerControl3 : IActiveScriptProfilerControl2
{
    HRESULT EnumHeap(IActiveScriptProfilerHeapEnum*);
}
alias PROFILER_HEAP_SUMMARY_VERSION = int;
enum : int
{
    PROFILER_HEAP_SUMMARY_VERSION_1 = 0x00000001,
}

struct PROFILER_HEAP_SUMMARY
{
    PROFILER_HEAP_SUMMARY_VERSION version_;
    uint totalHeapSize;
}
enum IID_IActiveScriptProfilerControl4 = GUID(0x160f94fd, 0x9dbc, 0x40d4, [0x9e, 0xac, 0x2b, 0x71, 0xdb, 0x31, 0x32, 0xf4]);
interface IActiveScriptProfilerControl4 : IActiveScriptProfilerControl3
{
    HRESULT SummarizeHeap(PROFILER_HEAP_SUMMARY*);
}
enum IID_IActiveScriptProfilerControl5 = GUID(0x1c01a2d1, 0x8f0f, 0x46a5, [0x97, 0x20, 0xd, 0x7e, 0xd2, 0xc6, 0x2f, 0xa]);
interface IActiveScriptProfilerControl5 : IActiveScriptProfilerControl4
{
    HRESULT EnumHeap2(PROFILER_HEAP_ENUM_FLAGS, IActiveScriptProfilerHeapEnum*);
}
enum IID_IActiveScriptProfilerCallback = GUID(0x740eca23, 0x7d9d, 0x42e5, [0xba, 0x9d, 0xf8, 0xb2, 0x4b, 0x1c, 0x7a, 0x9b]);
interface IActiveScriptProfilerCallback : IUnknown
{
    HRESULT Initialize(uint);
    HRESULT Shutdown(HRESULT);
    HRESULT ScriptCompiled(int, PROFILER_SCRIPT_TYPE, IUnknown);
    HRESULT FunctionCompiled(int, int, const(wchar)*, const(wchar)*, IUnknown);
    HRESULT OnFunctionEnter(int, int);
    HRESULT OnFunctionExit(int, int);
}
enum IID_IActiveScriptProfilerCallback2 = GUID(0x31b7f8ad, 0xa637, 0x409c, [0xb2, 0x2f, 0x4, 0x9, 0x95, 0xb6, 0x10, 0x3d]);
interface IActiveScriptProfilerCallback2 : IActiveScriptProfilerCallback
{
    HRESULT OnFunctionEnterByName(const(wchar)*, PROFILER_SCRIPT_TYPE);
    HRESULT OnFunctionExitByName(const(wchar)*, PROFILER_SCRIPT_TYPE);
}
enum IID_IActiveScriptProfilerCallback3 = GUID(0x6ac5ad25, 0x2037, 0x4687, [0x91, 0xdf, 0xb5, 0x99, 0x79, 0xd9, 0x3d, 0x73]);
interface IActiveScriptProfilerCallback3 : IActiveScriptProfilerCallback2
{
    HRESULT SetWebWorkerId(uint);
}
/+ [CONFLICTED] struct LOADED_IMAGE
{
    PSTR ModuleName;
    HANDLE hFile;
    ubyte* MappedAddress;
    IMAGE_NT_HEADERS32* FileHeader;
    IMAGE_SECTION_HEADER* LastRvaSection;
    uint NumberOfSections;
    IMAGE_SECTION_HEADER* Sections;
    IMAGE_FILE_CHARACTERISTICS2 Characteristics;
    BOOLEAN fSystemImage;
    BOOLEAN fDOSImage;
    BOOLEAN fReadOnly;
    ubyte Version;
    LIST_ENTRY Links;
    uint SizeOfImage;
}
+/
alias IMAGEHLP_STATUS_REASON = int;
enum : int
{
    BindOutOfMemory           = 0x00000000,
    BindRvaToVaFailed         = 0x00000001,
    BindNoRoomInImage         = 0x00000002,
    BindImportModuleFailed    = 0x00000003,
    BindImportProcedureFailed = 0x00000004,
    BindImportModule          = 0x00000005,
    BindImportProcedure       = 0x00000006,
    BindForwarder             = 0x00000007,
    BindForwarderNOT          = 0x00000008,
    BindImageModified         = 0x00000009,
    BindExpandFileHeaders     = 0x0000000a,
    BindImageComplete         = 0x0000000b,
    BindMismatchedSymbols     = 0x0000000c,
    BindSymbolsNotUpdated     = 0x0000000d,
    BindImportProcedure32     = 0x0000000e,
    BindImportProcedure64     = 0x0000000f,
    BindForwarder32           = 0x00000010,
    BindForwarder64           = 0x00000011,
    BindForwarderNOT32        = 0x00000012,
    BindForwarderNOT64        = 0x00000013,
}

alias PIMAGEHLP_STATUS_ROUTINE = BOOL function(IMAGEHLP_STATUS_REASON, const(char)*, const(char)*, ulong, ulong);
alias PIMAGEHLP_STATUS_ROUTINE32 = BOOL function(IMAGEHLP_STATUS_REASON, const(char)*, const(char)*, uint, ulong);
alias PIMAGEHLP_STATUS_ROUTINE64 = BOOL function(IMAGEHLP_STATUS_REASON, const(char)*, const(char)*, ulong, ulong);
alias DIGEST_FUNCTION = BOOL function(void*, ubyte*, uint);
alias PFIND_DEBUG_FILE_CALLBACK = BOOL function(HANDLE, const(char)*, void*);
alias PFIND_DEBUG_FILE_CALLBACKW = BOOL function(HANDLE, const(wchar)*, void*);
alias PFINDFILEINPATHCALLBACK = BOOL function(const(char)*, void*);
alias PFINDFILEINPATHCALLBACKW = BOOL function(const(wchar)*, void*);
alias PFIND_EXE_FILE_CALLBACK = BOOL function(HANDLE, const(char)*, void*);
alias PFIND_EXE_FILE_CALLBACKW = BOOL function(HANDLE, const(wchar)*, void*);
struct IMAGE_DEBUG_INFORMATION
{
    LIST_ENTRY List;
    uint ReservedSize;
    void* ReservedMappedBase;
    ushort ReservedMachine;
    ushort ReservedCharacteristics;
    uint ReservedCheckSum;
    uint ImageBase;
    uint SizeOfImage;
    uint ReservedNumberOfSections;
    IMAGE_SECTION_HEADER* ReservedSections;
    uint ReservedExportedNamesSize;
    PSTR ReservedExportedNames;
    uint ReservedNumberOfFunctionTableEntries;
    IMAGE_FUNCTION_ENTRY* ReservedFunctionTableEntries;
    uint ReservedLowestFunctionStartingAddress;
    uint ReservedHighestFunctionEndingAddress;
    uint ReservedNumberOfFpoTableEntries;
    FPO_DATA* ReservedFpoTableEntries;
    uint SizeOfCoffSymbols;
    IMAGE_COFF_SYMBOLS_HEADER* CoffSymbols;
    uint ReservedSizeOfCodeViewSymbols;
    void* ReservedCodeViewSymbols;
    PSTR ImageFilePath;
    PSTR ImageFileName;
    PSTR ReservedDebugFilePath;
    uint ReservedTimeDateStamp;
    BOOL ReservedRomImage;
    IMAGE_DEBUG_DIRECTORY* ReservedDebugDirectory;
    uint ReservedNumberOfDebugDirectories;
    uint ReservedOriginalFunctionTableBaseAddress;
    uint[2] Reserved;
}
alias PENUMDIRTREE_CALLBACK = BOOL function(const(char)*, void*);
alias PENUMDIRTREE_CALLBACKW = BOOL function(const(wchar)*, void*);
struct MODLOAD_DATA
{
    uint ssize;
    MODLOAD_DATA_TYPE ssig;
    void* data;
    uint size;
    uint flags;
}
struct MODLOAD_CVMISC
{
    uint oCV;
    ulong cCV;
    uint oMisc;
    ulong cMisc;
    uint dtImage;
    uint cImage;
}
struct MODLOAD_PDBGUID_PDBAGE
{
    GUID PdbGuid;
    uint PdbAge;
}
alias ADDRESS_MODE = int;
enum : int
{
    AddrMode1616 = 0x00000000,
    AddrMode1632 = 0x00000001,
    AddrModeReal = 0x00000002,
    AddrModeFlat = 0x00000003,
}

struct ADDRESS64
{
    ulong Offset;
    ushort Segment;
    ADDRESS_MODE Mode;
}
struct ADDRESS
{
    uint Offset;
    ushort Segment;
    ADDRESS_MODE Mode;
}
struct KDHELP64
{
    ulong Thread;
    uint ThCallbackStack;
    uint ThCallbackBStore;
    uint NextCallback;
    uint FramePointer;
    ulong KiCallUserMode;
    ulong KeUserCallbackDispatcher;
    ulong SystemRangeStart;
    ulong KiUserExceptionDispatcher;
    ulong StackBase;
    ulong StackLimit;
    uint BuildVersion;
    uint RetpolineStubFunctionTableSize;
    ulong RetpolineStubFunctionTable;
    uint RetpolineStubOffset;
    uint RetpolineStubSize;
    ulong[2] Reserved0;
}
struct KDHELP
{
    uint Thread;
    uint ThCallbackStack;
    uint NextCallback;
    uint FramePointer;
    uint KiCallUserMode;
    uint KeUserCallbackDispatcher;
    uint SystemRangeStart;
    uint ThCallbackBStore;
    uint KiUserExceptionDispatcher;
    uint StackBase;
    uint StackLimit;
    uint[5] Reserved;
}
struct STACKFRAME64
{
    ADDRESS64 AddrPC;
    ADDRESS64 AddrReturn;
    ADDRESS64 AddrFrame;
    ADDRESS64 AddrStack;
    ADDRESS64 AddrBStore;
    void* FuncTableEntry;
    ulong[4] Params;
    BOOL Far;
    BOOL Virtual;
    ulong[3] Reserved;
    KDHELP64 KdHelp;
}
struct STACKFRAME_EX
{
    ADDRESS64 AddrPC;
    ADDRESS64 AddrReturn;
    ADDRESS64 AddrFrame;
    ADDRESS64 AddrStack;
    ADDRESS64 AddrBStore;
    void* FuncTableEntry;
    ulong[4] Params;
    BOOL Far;
    BOOL Virtual;
    ulong[3] Reserved;
    KDHELP64 KdHelp;
    uint StackFrameSize;
    uint InlineFrameContext;
}
struct STACKFRAME
{
    ADDRESS AddrPC;
    ADDRESS AddrReturn;
    ADDRESS AddrFrame;
    ADDRESS AddrStack;
    void* FuncTableEntry;
    uint[4] Params;
    BOOL Far;
    BOOL Virtual;
    uint[3] Reserved;
    KDHELP KdHelp;
    ADDRESS AddrBStore;
}
alias PREAD_PROCESS_MEMORY_ROUTINE64 = BOOL function(HANDLE, ulong, void*, uint, uint*);
alias PFUNCTION_TABLE_ACCESS_ROUTINE64 = void* function(HANDLE, ulong);
alias PGET_MODULE_BASE_ROUTINE64 = ulong function(HANDLE, ulong);
alias PTRANSLATE_ADDRESS_ROUTINE64 = ulong function(HANDLE, HANDLE, ADDRESS64*);
alias PREAD_PROCESS_MEMORY_ROUTINE = BOOL function(HANDLE, uint, void*, uint, uint*);
alias PFUNCTION_TABLE_ACCESS_ROUTINE = void* function(HANDLE, uint);
alias PGET_MODULE_BASE_ROUTINE = uint function(HANDLE, uint);
alias PTRANSLATE_ADDRESS_ROUTINE = uint function(HANDLE, HANDLE, ADDRESS*);
struct API_VERSION
{
    ushort MajorVersion;
    ushort MinorVersion;
    ushort Revision;
    ushort Reserved;
}
alias PSYM_ENUMMODULES_CALLBACK64 = BOOL function(const(char)*, ulong, void*);
alias PSYM_ENUMMODULES_CALLBACKW64 = BOOL function(const(wchar)*, ulong, void*);
alias PENUMLOADED_MODULES_CALLBACK64 = BOOL function(const(char)*, ulong, uint, void*);
alias PENUMLOADED_MODULES_CALLBACKW64 = BOOL function(const(wchar)*, ulong, uint, void*);
alias PSYM_ENUMSYMBOLS_CALLBACK64 = BOOL function(const(char)*, ulong, uint, void*);
alias PSYM_ENUMSYMBOLS_CALLBACK64W = BOOL function(const(wchar)*, ulong, uint, void*);
alias PSYMBOL_REGISTERED_CALLBACK64 = BOOL function(HANDLE, uint, ulong, ulong);
alias PSYMBOL_FUNCENTRY_CALLBACK = void* function(HANDLE, uint, void*);
alias PSYMBOL_FUNCENTRY_CALLBACK64 = void* function(HANDLE, ulong, ulong);
alias PSYM_ENUMMODULES_CALLBACK = BOOL function(const(char)*, uint, void*);
alias PSYM_ENUMSYMBOLS_CALLBACK = BOOL function(const(char)*, uint, uint, void*);
alias PSYM_ENUMSYMBOLS_CALLBACKW = BOOL function(const(wchar)*, uint, uint, void*);
alias PENUMLOADED_MODULES_CALLBACK = BOOL function(const(char)*, uint, uint, void*);
alias PSYMBOL_REGISTERED_CALLBACK = BOOL function(HANDLE, uint, void*, void*);
alias SYM_TYPE = int;
enum : int
{
    SymNone     = 0x00000000,
    SymCoff     = 0x00000001,
    SymCv       = 0x00000002,
    SymPdb      = 0x00000003,
    SymExport   = 0x00000004,
    SymDeferred = 0x00000005,
    SymSym      = 0x00000006,
    SymDia      = 0x00000007,
    SymVirtual  = 0x00000008,
    NumSymTypes = 0x00000009,
}

struct IMAGEHLP_SYMBOL64
{
    uint SizeOfStruct;
    ulong Address;
    uint Size;
    uint Flags;
    uint MaxNameLength;
    CHAR[1] Name;
}
struct IMAGEHLP_SYMBOL64_PACKAGE
{
    IMAGEHLP_SYMBOL64 sym;
    CHAR[2001] name;
}
struct IMAGEHLP_SYMBOLW64
{
    uint SizeOfStruct;
    ulong Address;
    uint Size;
    uint Flags;
    uint MaxNameLength;
    wchar[1] Name;
}
struct IMAGEHLP_SYMBOLW64_PACKAGE
{
    IMAGEHLP_SYMBOLW64 sym;
    wchar[2001] name;
}
struct IMAGEHLP_SYMBOL
{
    uint SizeOfStruct;
    uint Address;
    uint Size;
    uint Flags;
    uint MaxNameLength;
    CHAR[1] Name;
}
struct IMAGEHLP_SYMBOL_PACKAGE
{
    IMAGEHLP_SYMBOL sym;
    CHAR[2001] name;
}
struct IMAGEHLP_SYMBOLW
{
    uint SizeOfStruct;
    uint Address;
    uint Size;
    uint Flags;
    uint MaxNameLength;
    wchar[1] Name;
}
struct IMAGEHLP_SYMBOLW_PACKAGE
{
    IMAGEHLP_SYMBOLW sym;
    wchar[2001] name;
}
struct IMAGEHLP_MODULE64
{
    uint SizeOfStruct;
    ulong BaseOfImage;
    uint ImageSize;
    uint TimeDateStamp;
    uint CheckSum;
    uint NumSyms;
    SYM_TYPE SymType;
    CHAR[32] ModuleName;
    CHAR[256] ImageName;
    CHAR[256] LoadedImageName;
    CHAR[256] LoadedPdbName;
    uint CVSig;
    CHAR[780] CVData;
    uint PdbSig;
    GUID PdbSig70;
    uint PdbAge;
    BOOL PdbUnmatched;
    BOOL DbgUnmatched;
    BOOL LineNumbers;
    BOOL GlobalSymbols;
    BOOL TypeInfo;
    BOOL SourceIndexed;
    BOOL Publics;
    uint MachineType;
    uint Reserved;
}
struct IMAGEHLP_MODULE64_EX
{
    IMAGEHLP_MODULE64 Module;
    uint RegionFlags;
}
struct IMAGEHLP_MODULEW64
{
    uint SizeOfStruct;
    ulong BaseOfImage;
    uint ImageSize;
    uint TimeDateStamp;
    uint CheckSum;
    uint NumSyms;
    SYM_TYPE SymType;
    wchar[32] ModuleName;
    wchar[256] ImageName;
    wchar[256] LoadedImageName;
    wchar[256] LoadedPdbName;
    uint CVSig;
    wchar[780] CVData;
    uint PdbSig;
    GUID PdbSig70;
    uint PdbAge;
    BOOL PdbUnmatched;
    BOOL DbgUnmatched;
    BOOL LineNumbers;
    BOOL GlobalSymbols;
    BOOL TypeInfo;
    BOOL SourceIndexed;
    BOOL Publics;
    uint MachineType;
    uint Reserved;
}
struct IMAGEHLP_MODULEW64_EX
{
    IMAGEHLP_MODULEW64 Module;
    uint RegionFlags;
}
struct IMAGEHLP_MODULE
{
    uint SizeOfStruct;
    uint BaseOfImage;
    uint ImageSize;
    uint TimeDateStamp;
    uint CheckSum;
    uint NumSyms;
    SYM_TYPE SymType;
    CHAR[32] ModuleName;
    CHAR[256] ImageName;
    CHAR[256] LoadedImageName;
}
struct IMAGEHLP_MODULEW
{
    uint SizeOfStruct;
    uint BaseOfImage;
    uint ImageSize;
    uint TimeDateStamp;
    uint CheckSum;
    uint NumSyms;
    SYM_TYPE SymType;
    wchar[32] ModuleName;
    wchar[256] ImageName;
    wchar[256] LoadedImageName;
}
struct IMAGEHLP_LINE64
{
    uint SizeOfStruct;
    void* Key;
    uint LineNumber;
    PSTR FileName;
    ulong Address;
}
struct IMAGEHLP_LINEW64
{
    uint SizeOfStruct;
    void* Key;
    uint LineNumber;
    PWSTR FileName;
    ulong Address;
}
struct IMAGEHLP_LINE
{
    uint SizeOfStruct;
    void* Key;
    uint LineNumber;
    PSTR FileName;
    uint Address;
}
struct IMAGEHLP_LINEW
{
    uint SizeOfStruct;
    void* Key;
    uint LineNumber;
    PSTR FileName;
    ulong Address;
}
struct SOURCEFILE
{
    ulong ModBase;
    PSTR FileName;
}
struct SOURCEFILEW
{
    ulong ModBase;
    PWSTR FileName;
}
struct IMAGEHLP_CBA_READ_MEMORY
{
    ulong addr;
    void* buf;
    uint bytes;
    uint* bytesread;
}
struct IMAGEHLP_CBA_EVENT
{
    IMAGEHLP_CBA_EVENT_SEVERITY severity;
    uint code;
    PSTR desc;
    void* object;
}
struct IMAGEHLP_CBA_EVENTW
{
    IMAGEHLP_CBA_EVENT_SEVERITY severity;
    uint code;
    const(wchar)* desc;
    void* object;
}
struct IMAGEHLP_DEFERRED_SYMBOL_LOAD64
{
    uint SizeOfStruct;
    ulong BaseOfImage;
    uint CheckSum;
    uint TimeDateStamp;
    CHAR[260] FileName;
    BOOLEAN Reparse;
    HANDLE hFile;
    uint Flags;
}
struct IMAGEHLP_DEFERRED_SYMBOL_LOADW64
{
    uint SizeOfStruct;
    ulong BaseOfImage;
    uint CheckSum;
    uint TimeDateStamp;
    wchar[261] FileName;
    BOOLEAN Reparse;
    HANDLE hFile;
    uint Flags;
}
struct IMAGEHLP_DEFERRED_SYMBOL_LOAD
{
    uint SizeOfStruct;
    uint BaseOfImage;
    uint CheckSum;
    uint TimeDateStamp;
    CHAR[260] FileName;
    BOOLEAN Reparse;
    HANDLE hFile;
}
struct IMAGEHLP_DUPLICATE_SYMBOL64
{
    uint SizeOfStruct;
    uint NumberOfDups;
    IMAGEHLP_SYMBOL64* Symbol;
    uint SelectedSymbol;
}
struct IMAGEHLP_DUPLICATE_SYMBOL
{
    uint SizeOfStruct;
    uint NumberOfDups;
    IMAGEHLP_SYMBOL* Symbol;
    uint SelectedSymbol;
}
struct IMAGEHLP_JIT_SYMBOLMAP
{
    uint SizeOfStruct;
    ulong Address;
    ulong BaseOfImage;
}
alias IMAGEHLP_HD_TYPE = int;
enum : int
{
    hdBase  = 0x00000000,
    hdSym   = 0x00000001,
    hdSrc   = 0x00000002,
    hdMax   = 0x00000003,
}

struct OMAP
{
    uint rva;
    uint rvaTo;
}
alias IMAGEHLP_EXTENDED_OPTIONS = int;
enum : int
{
    SYMOPT_EX_DISABLEACCESSTIMEUPDATE = 0x00000000,
    SYMOPT_EX_LASTVALIDDEBUGDIRECTORY = 0x00000001,
    SYMOPT_EX_NOIMPLICITPATTERNSEARCH = 0x00000002,
    SYMOPT_EX_NEVERLOADSYMBOLS        = 0x00000003,
    SYMOPT_EX_MAX                     = 0x00000004,
}

alias PSYM_ENUMSOURCEFILES_CALLBACK = BOOL function(SOURCEFILE*, void*);
alias PSYM_ENUMSOURCEFILES_CALLBACKW = BOOL function(SOURCEFILEW*, void*);
struct SRCCODEINFO
{
    uint SizeOfStruct;
    void* Key;
    ulong ModBase;
    CHAR[261] Obj;
    CHAR[261] FileName;
    uint LineNumber;
    ulong Address;
}
struct SRCCODEINFOW
{
    uint SizeOfStruct;
    void* Key;
    ulong ModBase;
    wchar[261] Obj;
    wchar[261] FileName;
    uint LineNumber;
    ulong Address;
}
alias PSYM_ENUMLINES_CALLBACK = BOOL function(SRCCODEINFO*, void*);
alias PSYM_ENUMLINES_CALLBACKW = BOOL function(SRCCODEINFOW*, void*);
alias PENUMSOURCEFILETOKENSCALLBACK = BOOL function(void*, ulong);
struct IMAGEHLP_SYMBOL_SRC
{
    uint sizeofstruct;
    uint type;
    CHAR[260] file;
}
struct MODULE_TYPE_INFO
{
    ushort dataLength;
    ushort leaf;
    ubyte[1] data;
}
struct SYMBOL_INFO
{
    uint SizeOfStruct;
    uint TypeIndex;
    ulong[2] Reserved;
    uint Index;
    uint Size;
    ulong ModBase;
    SYMBOL_INFO_FLAGS Flags;
    ulong Value;
    ulong Address;
    uint Register;
    uint Scope;
    uint Tag;
    uint NameLen;
    uint MaxNameLen;
    CHAR[1] Name;
}
struct SYMBOL_INFO_PACKAGE
{
    SYMBOL_INFO si;
    CHAR[2001] name;
}
struct SYMBOL_INFOW
{
    uint SizeOfStruct;
    uint TypeIndex;
    ulong[2] Reserved;
    uint Index;
    uint Size;
    ulong ModBase;
    SYMBOL_INFO_FLAGS Flags;
    ulong Value;
    ulong Address;
    uint Register;
    uint Scope;
    uint Tag;
    uint NameLen;
    uint MaxNameLen;
    wchar[1] Name;
}
struct SYMBOL_INFO_PACKAGEW
{
    SYMBOL_INFOW si;
    wchar[2001] name;
}
struct IMAGEHLP_STACK_FRAME
{
    ulong InstructionOffset;
    ulong ReturnOffset;
    ulong FrameOffset;
    ulong StackOffset;
    ulong BackingStoreOffset;
    ulong FuncTableEntry;
    ulong[4] Params;
    ulong[5] Reserved;
    BOOL Virtual;
    uint Reserved2;
}
alias PSYM_ENUMPROCESSES_CALLBACK = BOOL function(HANDLE, void*);
alias PSYM_ENUMERATESYMBOLS_CALLBACK = BOOL function(SYMBOL_INFO*, uint, void*);
alias PSYM_ENUMERATESYMBOLS_CALLBACKW = BOOL function(SYMBOL_INFOW*, uint, void*);
alias IMAGEHLP_SYMBOL_TYPE_INFO = int;
enum : int
{
    TI_GET_SYMTAG                   = 0x00000000,
    TI_GET_SYMNAME                  = 0x00000001,
    TI_GET_LENGTH                   = 0x00000002,
    TI_GET_TYPE                     = 0x00000003,
    TI_GET_TYPEID                   = 0x00000004,
    TI_GET_BASETYPE                 = 0x00000005,
    TI_GET_ARRAYINDEXTYPEID         = 0x00000006,
    TI_FINDCHILDREN                 = 0x00000007,
    TI_GET_DATAKIND                 = 0x00000008,
    TI_GET_ADDRESSOFFSET            = 0x00000009,
    TI_GET_OFFSET                   = 0x0000000a,
    TI_GET_VALUE                    = 0x0000000b,
    TI_GET_COUNT                    = 0x0000000c,
    TI_GET_CHILDRENCOUNT            = 0x0000000d,
    TI_GET_BITPOSITION              = 0x0000000e,
    TI_GET_VIRTUALBASECLASS         = 0x0000000f,
    TI_GET_VIRTUALTABLESHAPEID      = 0x00000010,
    TI_GET_VIRTUALBASEPOINTEROFFSET = 0x00000011,
    TI_GET_CLASSPARENTID            = 0x00000012,
    TI_GET_NESTED                   = 0x00000013,
    TI_GET_SYMINDEX                 = 0x00000014,
    TI_GET_LEXICALPARENT            = 0x00000015,
    TI_GET_ADDRESS                  = 0x00000016,
    TI_GET_THISADJUST               = 0x00000017,
    TI_GET_UDTKIND                  = 0x00000018,
    TI_IS_EQUIV_TO                  = 0x00000019,
    TI_GET_CALLING_CONVENTION       = 0x0000001a,
    TI_IS_CLOSE_EQUIV_TO            = 0x0000001b,
    TI_GTIEX_REQS_VALID             = 0x0000001c,
    TI_GET_VIRTUALBASEOFFSET        = 0x0000001d,
    TI_GET_VIRTUALBASEDISPINDEX     = 0x0000001e,
    TI_GET_IS_REFERENCE             = 0x0000001f,
    TI_GET_INDIRECTVIRTUALBASECLASS = 0x00000020,
    TI_GET_VIRTUALBASETABLETYPE     = 0x00000021,
    TI_GET_OBJECTPOINTERTYPE        = 0x00000022,
    IMAGEHLP_SYMBOL_TYPE_INFO_MAX   = 0x00000023,
}

struct TI_FINDCHILDREN_PARAMS
{
    uint Count;
    uint Start;
    uint[1] ChildId;
}
struct IMAGEHLP_GET_TYPE_INFO_PARAMS
{
    uint SizeOfStruct;
    IMAGEHLP_GET_TYPE_INFO_FLAGS Flags;
    uint NumIds;
    uint* TypeIds;
    ulong TagFilter;
    uint NumReqs;
    IMAGEHLP_SYMBOL_TYPE_INFO* ReqKinds;
    ulong* ReqOffsets;
    uint* ReqSizes;
    ulong ReqStride;
    ulong BufferSize;
    void* Buffer;
    uint EntriesMatched;
    uint EntriesFilled;
    ulong TagsFound;
    ulong AllReqsValid;
    uint NumReqsValid;
    ulong* ReqsValid;
}
alias SYMADDSOURCESTREAM = BOOL function(HANDLE, ulong, const(char)*, ubyte*, ulong);
alias SYMADDSOURCESTREAMA = BOOL function(HANDLE, ulong, const(char)*, ubyte*, ulong);
struct SYMSRV_INDEX_INFO
{
    uint sizeofstruct;
    CHAR[261] file;
    BOOL stripped;
    uint timestamp;
    uint size;
    CHAR[261] dbgfile;
    CHAR[261] pdbfile;
    GUID guid;
    uint sig;
    uint age;
}
struct SYMSRV_INDEX_INFOW
{
    uint sizeofstruct;
    wchar[261] file;
    BOOL stripped;
    uint timestamp;
    uint size;
    wchar[261] dbgfile;
    wchar[261] pdbfile;
    GUID guid;
    uint sig;
    uint age;
}
alias IMAGEHLP_SF_TYPE = int;
enum : int
{
    sfImage = 0x00000000,
    sfDbg   = 0x00000001,
    sfPdb   = 0x00000002,
    sfMpd   = 0x00000003,
    sfMax   = 0x00000004,
}

alias PDBGHELP_CREATE_USER_DUMP_CALLBACK = BOOL function(uint, void**, uint*, void*);
struct SYMSRV_EXTENDED_OUTPUT_DATA
{
    uint sizeOfStruct;
    uint version_;
    wchar[261] filePtrMsg;
}
alias PSYMBOLSERVERPROC = BOOL function(const(char)*, const(char)*, void*, uint, uint, PSTR);
alias PSYMBOLSERVERPROCA = BOOL function(const(char)*, const(char)*, void*, uint, uint, PSTR);
alias PSYMBOLSERVERPROCW = BOOL function(const(wchar)*, const(wchar)*, void*, uint, uint, PWSTR);
alias PSYMBOLSERVERBYINDEXPROC = BOOL function(const(char)*, const(char)*, const(char)*, PSTR);
alias PSYMBOLSERVERBYINDEXPROCA = BOOL function(const(char)*, const(char)*, const(char)*, PSTR);
alias PSYMBOLSERVERBYINDEXPROCW = BOOL function(const(wchar)*, const(wchar)*, const(wchar)*, PWSTR);
alias PSYMBOLSERVEROPENPROC = BOOL function();
alias PSYMBOLSERVERCLOSEPROC = BOOL function();
alias PSYMBOLSERVERSETOPTIONSPROC = BOOL function(ulong, ulong);
alias PSYMBOLSERVERSETOPTIONSWPROC = BOOL function(ulong, ulong);
alias PSYMBOLSERVERCALLBACKPROC = BOOL function(ulong, ulong, ulong);
alias PSYMBOLSERVERGETOPTIONSPROC = ulong function();
alias PSYMBOLSERVERPINGPROC = BOOL function(const(char)*);
alias PSYMBOLSERVERPINGPROCA = BOOL function(const(char)*);
alias PSYMBOLSERVERPINGPROCW = BOOL function(const(wchar)*);
alias PSYMBOLSERVERGETVERSION = BOOL function(API_VERSION*);
alias PSYMBOLSERVERDELTANAME = BOOL function(const(char)*, void*, uint, uint, void*, uint, uint, PSTR, ulong);
alias PSYMBOLSERVERDELTANAMEW = BOOL function(const(wchar)*, void*, uint, uint, void*, uint, uint, PWSTR, ulong);
alias PSYMBOLSERVERGETSUPPLEMENT = BOOL function(const(char)*, const(char)*, const(char)*, PSTR, ulong);
alias PSYMBOLSERVERGETSUPPLEMENTW = BOOL function(const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, ulong);
alias PSYMBOLSERVERSTORESUPPLEMENT = BOOL function(const(char)*, const(char)*, const(char)*, PSTR, ulong, uint);
alias PSYMBOLSERVERSTORESUPPLEMENTW = BOOL function(const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, ulong, uint);
alias PSYMBOLSERVERGETINDEXSTRING = BOOL function(void*, uint, uint, PSTR, ulong);
alias PSYMBOLSERVERGETINDEXSTRINGW = BOOL function(void*, uint, uint, PWSTR, ulong);
alias PSYMBOLSERVERSTOREFILE = BOOL function(const(char)*, const(char)*, void*, uint, uint, PSTR, ulong, uint);
alias PSYMBOLSERVERSTOREFILEW = BOOL function(const(wchar)*, const(wchar)*, void*, uint, uint, PWSTR, ulong, uint);
alias PSYMBOLSERVERISSTORE = BOOL function(const(char)*);
alias PSYMBOLSERVERISSTOREW = BOOL function(const(wchar)*);
alias PSYMBOLSERVERVERSION = uint function();
alias PSYMBOLSERVERMESSAGEPROC = BOOL function(ulong, ulong, ulong);
alias PSYMBOLSERVERWEXPROC = BOOL function(const(wchar)*, const(wchar)*, void*, uint, uint, PWSTR, SYMSRV_EXTENDED_OUTPUT_DATA*);
alias PSYMBOLSERVERPINGPROCWEX = BOOL function(const(wchar)*);
alias PSYMBOLSERVERGETOPTIONDATAPROC = BOOL function(ulong, ulong*);
alias PSYMBOLSERVERSETHTTPAUTHHEADER = BOOL function(const(wchar)*);
alias LPCALL_BACK_USER_INTERRUPT_ROUTINE = uint function();
struct DBGHELP_DATA_REPORT_STRUCT
{
    const(wchar)* pBinPathNonExist;
    const(wchar)* pSymbolPathNonExist;
}
enum IID_IScriptNode = GUID(0xaee2a94, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IScriptNode : IUnknown
{
    HRESULT Alive();
    HRESULT Delete();
    HRESULT GetParent(IScriptNode*);
    HRESULT GetIndexInParent(uint*);
    HRESULT GetCookie(uint*);
    HRESULT GetNumberOfChildren(uint*);
    HRESULT GetChild(uint, IScriptNode*);
    HRESULT GetLanguage(BSTR*);
    HRESULT CreateChildEntry(uint, uint, const(wchar)*, IScriptEntry*);
    HRESULT CreateChildHandler(const(wchar)*, PWSTR*, uint, const(wchar)*, const(wchar)*, ITypeInfo, uint, uint, uint, IScriptEntry*);
}
enum IID_IScriptEntry = GUID(0xaee2a95, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IScriptEntry : IScriptNode
{
    HRESULT GetText(BSTR*);
    HRESULT SetText(const(wchar)*);
    HRESULT GetBody(BSTR*);
    HRESULT SetBody(const(wchar)*);
    HRESULT GetName(BSTR*);
    HRESULT SetName(const(wchar)*);
    HRESULT GetItemName(BSTR*);
    HRESULT SetItemName(const(wchar)*);
    HRESULT GetSignature(ITypeInfo*, uint*);
    HRESULT SetSignature(ITypeInfo, uint);
    HRESULT GetRange(uint*, uint*);
}
enum IID_IScriptScriptlet = GUID(0xaee2a96, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IScriptScriptlet : IScriptEntry
{
    HRESULT GetSubItemName(BSTR*);
    HRESULT SetSubItemName(const(wchar)*);
    HRESULT GetEventName(BSTR*);
    HRESULT SetEventName(const(wchar)*);
    HRESULT GetSimpleEventName(BSTR*);
    HRESULT SetSimpleEventName(const(wchar)*);
}
enum IID_IActiveScriptAuthor = GUID(0x9c109da0, 0x7006, 0x11d1, [0xb3, 0x6c, 0x0, 0xa0, 0xc9, 0x11, 0xe8, 0xb2]);
interface IActiveScriptAuthor : IUnknown
{
    HRESULT AddNamedItem(const(wchar)*, uint, IDispatch);
    HRESULT AddScriptlet(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT ParseScriptText(const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetScriptletTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetRoot(IScriptNode*);
    HRESULT GetLanguageFlags(uint*);
    HRESULT GetEventHandler(IDispatch, const(wchar)*, const(wchar)*, const(wchar)*, IScriptEntry*);
    HRESULT RemoveNamedItem(const(wchar)*);
    HRESULT AddTypeLib(const(GUID)*, uint, uint, uint);
    HRESULT RemoveTypeLib(const(GUID)*, uint, uint);
    HRESULT GetChars(uint, BSTR*);
    HRESULT GetInfoFromContext(const(wchar)*, uint, uint, uint, uint*, uint*, uint*, int*, int*, IUnknown*);
    HRESULT IsCommitChar(wchar, BOOL*);
}
enum IID_IActiveScriptAuthorProcedure = GUID(0x7e2d4b70, 0xbd9a, 0x11d0, [0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptAuthorProcedure : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, IDispatch);
}
alias APPLICATION_NODE_EVENT_FILTER = int;
enum : int
{
    FILTER_EXCLUDE_NOTHING        = 0x00000000,
    FILTER_EXCLUDE_ANONYMOUS_CODE = 0x00000001,
    FILTER_EXCLUDE_EVAL_CODE      = 0x00000002,
}

struct TEXT_DOCUMENT_ARRAY
{
    uint dwCount;
    IDebugDocumentText* Members;
}
enum IID_IDebugApplicationNode100 = GUID(0x90a7734e, 0x841b, 0x4f77, [0x93, 0x84, 0xa2, 0x89, 0x1e, 0x76, 0xe7, 0xe2]);
interface IDebugApplicationNode100 : IUnknown
{
    HRESULT SetFilterForEventSink(uint, APPLICATION_NODE_EVENT_FILTER);
    HRESULT GetExcludedDocuments(APPLICATION_NODE_EVENT_FILTER, TEXT_DOCUMENT_ARRAY*);
    HRESULT QueryIsChildNode(IDebugDocument);
}
enum IID_IWebAppDiagnosticsSetup = GUID(0x379bfbe1, 0xc6c9, 0x432a, [0x93, 0xe1, 0x6d, 0x17, 0x65, 0x6c, 0x53, 0x8c]);
interface IWebAppDiagnosticsSetup : IUnknown
{
    HRESULT DiagnosticsSupported(short*);
    HRESULT CreateObjectWithSiteAtWebApp(const(GUID)*, uint, const(GUID)*, ulong);
}
alias SCRIPT_DEBUGGER_OPTIONS = int;
enum : int
{
    SDO_NONE                           = 0x00000000,
    SDO_ENABLE_FIRST_CHANCE_EXCEPTIONS = 0x00000001,
    SDO_ENABLE_WEB_WORKER_SUPPORT      = 0x00000002,
    SDO_ENABLE_NONUSER_CODE_SUPPORT    = 0x00000004,
    SDO_ENABLE_LIBRARY_STACK_FRAME     = 0x00000008,
}

enum IID_IRemoteDebugApplication110 = GUID(0xd5fe005b, 0x2836, 0x485e, [0xb1, 0xf9, 0x89, 0xd9, 0x1a, 0xa2, 0x4f, 0xd4]);
interface IRemoteDebugApplication110 : IUnknown
{
    HRESULT SetDebuggerOptions(SCRIPT_DEBUGGER_OPTIONS, SCRIPT_DEBUGGER_OPTIONS);
    HRESULT GetCurrentDebuggerOptions(SCRIPT_DEBUGGER_OPTIONS*);
    HRESULT GetMainThread(IRemoteDebugApplicationThread*);
}
enum IID_IDebugApplication11032 = GUID(0xbdb3b5de, 0x89f2, 0x4e11, [0x84, 0xa5, 0x97, 0x44, 0x5f, 0x94, 0x1c, 0x7d]);
interface IDebugApplication11032 : IRemoteDebugApplication110
{
    HRESULT SynchronousCallInMainThread(IDebugThreadCall32, ulong, ulong, ulong);
    HRESULT AsynchronousCallInMainThread(IDebugThreadCall32, ulong, ulong, ulong);
    HRESULT CallableWaitForHandles(uint, const(HANDLE)*, uint*);
}
enum IID_IDebugApplication11064 = GUID(0x2039d958, 0x4eeb, 0x496a, [0x87, 0xbb, 0x2e, 0x52, 0x1, 0xea, 0xde, 0xef]);
interface IDebugApplication11064 : IRemoteDebugApplication110
{
    HRESULT SynchronousCallInMainThread(IDebugThreadCall64, ulong, ulong, ulong);
    HRESULT AsynchronousCallInMainThread(IDebugThreadCall64, ulong, ulong, ulong);
    HRESULT CallableWaitForHandles(uint, const(HANDLE)*, uint*);
}
enum IID_IWebAppDiagnosticsObjectInitialization = GUID(0x16ff3a42, 0xa5f5, 0x432b, [0xb6, 0x25, 0x8e, 0x8e, 0x16, 0xf5, 0x7e, 0x15]);
interface IWebAppDiagnosticsObjectInitialization : IUnknown
{
    HRESULT Initialize(HANDLE_PTR, IUnknown);
}
enum IID_IActiveScriptWinRTErrorDebug = GUID(0x73a3f82a, 0xfe9, 0x4b33, [0xba, 0x3b, 0xfe, 0x9, 0x5f, 0x69, 0x7e, 0xa]);
interface IActiveScriptWinRTErrorDebug : IActiveScriptError
{
    HRESULT GetRestrictedErrorString(BSTR*);
    HRESULT GetRestrictedErrorReference(BSTR*);
    HRESULT GetCapabilitySid(BSTR*);
}
alias SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND = int;
enum : int
{
    ETK_FIRST_CHANCE   = 0x00000000,
    ETK_USER_UNHANDLED = 0x00000001,
    ETK_UNHANDLED      = 0x00000002,
}

enum IID_IActiveScriptErrorDebug110 = GUID(0x516e42b6, 0x89a8, 0x4530, [0x93, 0x7b, 0x5f, 0x7, 0x8, 0x43, 0x14, 0x42]);
interface IActiveScriptErrorDebug110 : IUnknown
{
    HRESULT GetExceptionThrownKind(SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND*);
}
enum IID_IDebugApplicationThreadEvents110 = GUID(0x84e5e468, 0xd5da, 0x48a8, [0x83, 0xf4, 0x40, 0x36, 0x64, 0x29, 0x0, 0x7b]);
interface IDebugApplicationThreadEvents110 : IUnknown
{
    HRESULT OnSuspendForBreakPoint();
    HRESULT OnResumeFromBreakPoint();
    HRESULT OnThreadRequestComplete();
    HRESULT OnBeginThreadRequest();
}
enum IID_IDebugApplicationThread11032 = GUID(0x2194ac5c, 0x6561, 0x404a, [0xa2, 0xe9, 0xf5, 0x7d, 0x72, 0xde, 0x37, 0x2]);
interface IDebugApplicationThread11032 : IUnknown
{
    HRESULT GetActiveThreadRequestCount(uint*);
    HRESULT IsSuspendedForBreakPoint(BOOL*);
    HRESULT IsThreadCallable(BOOL*);
    HRESULT AsynchronousCallIntoThread(IDebugThreadCall32, ulong, ulong, ulong);
}
enum IID_IDebugApplicationThread11064 = GUID(0x420aa4cc, 0xefd8, 0x4dac, [0x98, 0x3b, 0x47, 0x12, 0x78, 0x26, 0x91, 0x7d]);
interface IDebugApplicationThread11064 : IUnknown
{
    HRESULT GetActiveThreadRequestCount(uint*);
    HRESULT IsSuspendedForBreakPoint(BOOL*);
    HRESULT IsThreadCallable(BOOL*);
    HRESULT AsynchronousCallIntoThread(IDebugThreadCall64, ulong, ulong, ulong);
}
enum IID_IRemoteDebugCriticalErrorEvent110 = GUID(0x2f69c611, 0x6b14, 0x47e8, [0x92, 0x60, 0x4b, 0xb7, 0xc5, 0x2f, 0x50, 0x4b]);
interface IRemoteDebugCriticalErrorEvent110 : IUnknown
{
    HRESULT GetErrorInfo(BSTR*, int*, BSTR*, IDebugDocumentContext*);
}
alias SCRIPT_INVOCATION_CONTEXT_TYPE = int;
enum : int
{
    SICT_Event                      = 0x00000000,
    SICT_SetTimeout                 = 0x00000001,
    SICT_SetInterval                = 0x00000002,
    SICT_SetImmediate               = 0x00000003,
    SICT_RequestAnimationFrame      = 0x00000004,
    SICT_ToString                   = 0x00000005,
    SICT_MutationObserverCheckpoint = 0x00000006,
    SICT_WWAExecUnsafeLocalFunction = 0x00000007,
    SICT_WWAExecAtPriority          = 0x00000008,
}

enum IID_IScriptInvocationContext = GUID(0x5d7741b7, 0xaf7e, 0x4a2a, [0x85, 0xe5, 0xc7, 0x7f, 0x4d, 0x6, 0x59, 0xfb]);
interface IScriptInvocationContext : IUnknown
{
    HRESULT GetContextType(SCRIPT_INVOCATION_CONTEXT_TYPE*);
    HRESULT GetContextDescription(BSTR*);
    HRESULT GetContextObject(IUnknown*);
}
alias DEBUG_STACKFRAME_TYPE = int;
enum : int
{
    DST_SCRIPT_FRAME     = 0x00000000,
    DST_INTERNAL_FRAME   = 0x00000001,
    DST_INVOCATION_FRAME = 0x00000002,
}

enum IID_IDebugStackFrame110 = GUID(0x4b509611, 0xb6ea, 0x4b24, [0xad, 0xcb, 0xd0, 0xcc, 0xfd, 0x1a, 0x7e, 0x33]);
interface IDebugStackFrame110 : IDebugStackFrame
{
    HRESULT GetStackFrameType(DEBUG_STACKFRAME_TYPE*);
    HRESULT GetScriptInvocationContext(IScriptInvocationContext*);
}
alias DEBUG_EVENT_INFO_TYPE = int;
enum : int
{
    DEIT_GENERAL            = 0x00000000,
    DEIT_ASMJS_IN_DEBUGGING = 0x00000001,
    DEIT_ASMJS_SUCCEEDED    = 0x00000002,
    DEIT_ASMJS_FAILED       = 0x00000003,
}

enum IID_IRemoteDebugInfoEvent110 = GUID(0x9ff56bb6, 0xeb89, 0x4c0f, [0x88, 0x23, 0xcc, 0x2a, 0x4c, 0xb, 0x7f, 0x26]);
interface IRemoteDebugInfoEvent110 : IUnknown
{
    HRESULT GetEventInfo(DEBUG_EVENT_INFO_TYPE*, BSTR*, BSTR*, IDebugDocumentContext*);
}
enum IID_IJsDebug = GUID(0xbe0e89da, 0x2ac5, 0x4c04, [0xac, 0x5e, 0x59, 0x95, 0x6a, 0xae, 0x36, 0x13]);
interface IJsDebug : IUnknown
{
    HRESULT OpenVirtualProcess(uint, ulong, IJsDebugDataTarget, IJsDebugProcess*);
}
enum IID_IJsDebugProcess = GUID(0x3d587168, 0x6a2d, 0x4041, [0xbd, 0x3b, 0xd, 0xe6, 0x74, 0x50, 0x28, 0x62]);
interface IJsDebugProcess : IUnknown
{
    HRESULT CreateStackWalker(uint, IJsDebugStackWalker*);
    HRESULT CreateBreakPoint(ulong, uint, uint, BOOL, IJsDebugBreakPoint*);
    HRESULT PerformAsyncBreak(uint);
    HRESULT GetExternalStepAddress(ulong*);
}
enum IID_IJsDebugStackWalker = GUID(0xdb24b094, 0x73c4, 0x456c, [0xa4, 0xec, 0xe9, 0xe, 0xa0, 0xb, 0xdf, 0xe3]);
interface IJsDebugStackWalker : IUnknown
{
    HRESULT GetNext(IJsDebugFrame*);
}
enum IID_IJsDebugFrame = GUID(0xc9196637, 0xab9d, 0x44b2, [0xba, 0xd2, 0x13, 0xb9, 0x5b, 0x3f, 0x39, 0xe]);
interface IJsDebugFrame : IUnknown
{
    HRESULT GetStackRange(ulong*, ulong*);
    HRESULT GetName(BSTR*);
    HRESULT GetDocumentPositionWithId(ulong*, uint*, uint*);
    HRESULT GetDocumentPositionWithName(BSTR*, uint*, uint*);
    HRESULT GetDebugProperty(IJsDebugProperty*);
    HRESULT GetReturnAddress(ulong*);
    HRESULT Evaluate(const(wchar)*, IJsDebugProperty*, BSTR*);
}
alias JS_PROPERTY_MEMBERS = int;
enum : int
{
    JS_PROPERTY_MEMBERS_ALL       = 0x00000000,
    JS_PROPERTY_MEMBERS_ARGUMENTS = 0x00000001,
}

alias JS_PROPERTY_ATTRIBUTES = int;
enum : int
{
    JS_PROPERTY_ATTRIBUTE_NONE       = 0x00000000,
    JS_PROPERTY_HAS_CHILDREN         = 0x00000001,
    JS_PROPERTY_FAKE                 = 0x00000002,
    JS_PROPERTY_METHOD               = 0x00000004,
    JS_PROPERTY_READONLY             = 0x00000008,
    JS_PROPERTY_NATIVE_WINRT_POINTER = 0x00000010,
    JS_PROPERTY_FRAME_INTRYBLOCK     = 0x00000020,
    JS_PROPERTY_FRAME_INCATCHBLOCK   = 0x00000040,
    JS_PROPERTY_FRAME_INFINALLYBLOCK = 0x00000080,
}

struct JsDebugPropertyInfo
{
    BSTR name;
    BSTR type;
    BSTR value;
    BSTR fullName;
    JS_PROPERTY_ATTRIBUTES attr;
}
enum IID_IJsDebugProperty = GUID(0xf8ffcf2b, 0x3aa4, 0x4320, [0x85, 0xc3, 0x52, 0xa3, 0x12, 0xba, 0x96, 0x33]);
interface IJsDebugProperty : IUnknown
{
    HRESULT GetPropertyInfo(uint, JsDebugPropertyInfo*);
    HRESULT GetMembers(JS_PROPERTY_MEMBERS, IJsEnumDebugProperty*);
}
enum IID_IJsEnumDebugProperty = GUID(0x4092432f, 0x2f0f, 0x4fe1, [0xb6, 0x38, 0x5b, 0x74, 0xa5, 0x2c, 0xdc, 0xbe]);
interface IJsEnumDebugProperty : IUnknown
{
    HRESULT Next(uint, IJsDebugProperty*, uint*);
    HRESULT GetCount(uint*);
}
enum IID_IJsDebugBreakPoint = GUID(0xdf6773e3, 0xed8d, 0x488b, [0x8a, 0x3e, 0x58, 0x12, 0x57, 0x7d, 0x15, 0x42]);
interface IJsDebugBreakPoint : IUnknown
{
    HRESULT IsEnabled(BOOL*);
    HRESULT Enable();
    HRESULT Disable();
    HRESULT Delete();
    HRESULT GetDocumentPosition(ulong*, uint*, uint*);
}
struct JS_NATIVE_FRAME
{
    ulong InstructionOffset;
    ulong ReturnOffset;
    ulong FrameOffset;
    ulong StackOffset;
}
enum IID_IEnumJsStackFrames = GUID(0x5e7da34b, 0xfb51, 0x4791, [0xab, 0xe7, 0xcb, 0x5b, 0xdf, 0x41, 0x97, 0x55]);
interface IEnumJsStackFrames : IUnknown
{
    HRESULT Next(uint, JS_NATIVE_FRAME*, uint*);
    HRESULT Reset();
}
alias JsDebugReadMemoryFlags = int;
enum : int
{
    None                    = 0x00000000,
    JsDebugAllowPartialRead = 0x00000001,
}

enum IID_IJsDebugDataTarget = GUID(0x53b28977, 0x53a1, 0x48e5, [0x90, 0x0, 0x5d, 0xd, 0xfa, 0x89, 0x39, 0x31]);
interface IJsDebugDataTarget : IUnknown
{
    HRESULT ReadMemory(ulong, JsDebugReadMemoryFlags, ubyte*, uint, uint*);
    HRESULT WriteMemory(ulong, ubyte*, uint);
    HRESULT AllocateVirtualMemory(ulong, uint, uint, uint, ulong*);
    HRESULT FreeVirtualMemory(ulong, uint, uint);
    HRESULT GetTlsValue(uint, uint, ulong*);
    HRESULT ReadBSTR(ulong, BSTR*);
    HRESULT ReadNullTerminatedString(ulong, ushort, uint, BSTR*);
    HRESULT CreateStackFrameEnumerator(uint, IEnumJsStackFrames*);
    HRESULT GetThreadContext(uint, uint, uint, void*);
}
alias DUMP_TYPE = int;
enum : int
{
    DUMP_TYPE_INVALID       = 0xffffffff,
    DUMP_TYPE_UNKNOWN       = 0x00000000,
    DUMP_TYPE_FULL          = 0x00000001,
    DUMP_TYPE_SUMMARY       = 0x00000002,
    DUMP_TYPE_HEADER        = 0x00000003,
    DUMP_TYPE_TRIAGE        = 0x00000004,
    DUMP_TYPE_BITMAP_FULL   = 0x00000005,
    DUMP_TYPE_BITMAP_KERNEL = 0x00000006,
    DUMP_TYPE_AUTOMATIC     = 0x00000007,
}

struct PHYSICAL_MEMORY_RUN32
{
    uint BasePage;
    uint PageCount;
}
struct PHYSICAL_MEMORY_DESCRIPTOR32
{
    uint NumberOfRuns;
    uint NumberOfPages;
    PHYSICAL_MEMORY_RUN32[1] Run;
}
struct PHYSICAL_MEMORY_RUN64
{
    ulong BasePage;
    ulong PageCount;
}
struct PHYSICAL_MEMORY_DESCRIPTOR64
{
    uint NumberOfRuns;
    ulong NumberOfPages;
    PHYSICAL_MEMORY_RUN64[1] Run;
}
union DUMP_FILE_ATTRIBUTES
{
    struct
    {
        uint _bitfield0;
    }
    uint Attributes;
}
struct DUMP_HEADER32
{
    uint Signature;
    uint ValidDump;
    uint MajorVersion;
    uint MinorVersion;
    uint DirectoryTableBase;
    uint PfnDataBase;
    uint PsLoadedModuleList;
    uint PsActiveProcessHead;
    uint MachineImageType;
    uint NumberProcessors;
    uint BugCheckCode;
    uint BugCheckParameter1;
    uint BugCheckParameter2;
    uint BugCheckParameter3;
    uint BugCheckParameter4;
    CHAR[32] VersionUser;
    ubyte PaeEnabled;
    ubyte KdSecondaryVersion;
    ubyte[2] Spare3;
    uint KdDebuggerDataBlock;
    union
    {
        PHYSICAL_MEMORY_DESCRIPTOR32 PhysicalMemoryBlock;
        ubyte[700] PhysicalMemoryBlockBuffer;
    }
    ubyte[1200] ContextRecord;
    EXCEPTION_RECORD32 Exception;
    CHAR[128] Comment;
    DUMP_FILE_ATTRIBUTES Attributes;
    uint BootId;
    ubyte[1760] _reserved0;
    uint DumpType;
    uint MiniDumpFields;
    uint SecondaryDataState;
    uint ProductType;
    uint SuiteMask;
    uint WriterStatus;
    LARGE_INTEGER RequiredDumpSpace;
    ubyte[16] _reserved2;
    LARGE_INTEGER SystemUpTime;
    LARGE_INTEGER SystemTime;
    ubyte[56] _reserved3;
}
struct DUMP_HEADER64
{
    uint Signature;
    uint ValidDump;
    uint MajorVersion;
    uint MinorVersion;
    ulong DirectoryTableBase;
    ulong PfnDataBase;
    ulong PsLoadedModuleList;
    ulong PsActiveProcessHead;
    uint MachineImageType;
    uint NumberProcessors;
    uint BugCheckCode;
    ulong BugCheckParameter1;
    ulong BugCheckParameter2;
    ulong BugCheckParameter3;
    ulong BugCheckParameter4;
    CHAR[32] VersionUser;
    ulong KdDebuggerDataBlock;
    union
    {
        PHYSICAL_MEMORY_DESCRIPTOR64 PhysicalMemoryBlock;
        ubyte[700] PhysicalMemoryBlockBuffer;
    }
    ubyte[3000] ContextRecord;
    EXCEPTION_RECORD64 Exception;
    uint DumpType;
    LARGE_INTEGER RequiredDumpSpace;
    LARGE_INTEGER SystemTime;
    CHAR[128] Comment;
    LARGE_INTEGER SystemUpTime;
    uint MiniDumpFields;
    uint SecondaryDataState;
    uint ProductType;
    uint SuiteMask;
    uint WriterStatus;
    ubyte Unused1;
    ubyte KdSecondaryVersion;
    ubyte[2] Unused;
    DUMP_FILE_ATTRIBUTES Attributes;
    uint BootId;
    ubyte[4008] _reserved0;
}
enum IID_IObjectSafety = GUID(0xcb5bdc81, 0x93c1, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IObjectSafety : IUnknown
{
    HRESULT GetInterfaceSafetyOptions(const(GUID)*, uint*, uint*);
    HRESULT SetInterfaceSafetyOptions(const(GUID)*, uint, uint);
}
alias WHEA_ERROR_SOURCE_TYPE = int;
enum : int
{
    WheaErrSrcTypeMCE          = 0x00000000,
    WheaErrSrcTypeCMC          = 0x00000001,
    WheaErrSrcTypeCPE          = 0x00000002,
    WheaErrSrcTypeNMI          = 0x00000003,
    WheaErrSrcTypePCIe         = 0x00000004,
    WheaErrSrcTypeGeneric      = 0x00000005,
    WheaErrSrcTypeINIT         = 0x00000006,
    WheaErrSrcTypeBOOT         = 0x00000007,
    WheaErrSrcTypeSCIGeneric   = 0x00000008,
    WheaErrSrcTypeIPFMCA       = 0x00000009,
    WheaErrSrcTypeIPFCMC       = 0x0000000a,
    WheaErrSrcTypeIPFCPE       = 0x0000000b,
    WheaErrSrcTypeGenericV2    = 0x0000000c,
    WheaErrSrcTypeSCIGenericV2 = 0x0000000d,
    WheaErrSrcTypeBMC          = 0x0000000e,
    WheaErrSrcTypePMEM         = 0x0000000f,
    WheaErrSrcTypeDeviceDriver = 0x00000010,
    WheaErrSrcTypeMax          = 0x00000011,
}

alias WHEA_ERROR_SOURCE_STATE = int;
enum : int
{
    WheaErrSrcStateStopped       = 0x00000001,
    WheaErrSrcStateStarted       = 0x00000002,
    WheaErrSrcStateRemoved       = 0x00000003,
    WheaErrSrcStateRemovePending = 0x00000004,
}

alias WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER = NTSTATUS function(void*, uint);
alias WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER = void function(void*);
alias WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER = NTSTATUS function(void*, uint*);
struct WHEA_ERROR_SOURCE_CONFIGURATION_DD
{
    align (1):
    WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER Initialize;
    WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER Uninitialize;
    WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER Correct;
}
struct WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER_V1
{
    align (1):
    uint Version;
    GUID SourceGuid;
    ushort LogTag;
    ubyte[6] Reserved;
    WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER Initialize;
    WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER Uninitialize;
}
struct WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER
{
    align (1):
    uint Version;
    GUID SourceGuid;
    ushort LogTag;
    ubyte[6] Reserved;
    WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER Initialize;
    WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER Uninitialize;
    uint MaxSectionDataLength;
    uint MaxSectionsPerReport;
    GUID CreatorId;
    GUID PartitionId;
}
struct WHEA_DRIVER_BUFFER_SET
{
    align (1):
    uint Version;
    ubyte* Data;
    uint DataSize;
    GUID* SectionTypeGuid;
    ubyte* SectionFriendlyName;
    ubyte* Flags;
}
union WHEA_NOTIFICATION_FLAGS
{
    align (1):
    struct
    {
        align (1):
        ushort _bitfield0;
    }
    ushort AsUSHORT;
}
union XPF_MC_BANK_FLAGS
{
    struct
    {
        ubyte _bitfield0;
    }
    ubyte AsUCHAR;
}
union XPF_MCE_FLAGS
{
    align (1):
    struct
    {
        align (1):
        uint _bitfield0;
    }
    uint AsULONG;
}
union AER_ROOTPORT_DESCRIPTOR_FLAGS
{
    align (1):
    struct
    {
        align (1):
        ushort _bitfield0;
    }
    ushort AsUSHORT;
}
union AER_ENDPOINT_DESCRIPTOR_FLAGS
{
    align (1):
    struct
    {
        align (1):
        ushort _bitfield0;
    }
    ushort AsUSHORT;
}
union AER_BRIDGE_DESCRIPTOR_FLAGS
{
    align (1):
    struct
    {
        align (1):
        ushort _bitfield0;
    }
    ushort AsUSHORT;
}
struct WHEA_NOTIFICATION_DESCRIPTOR
{
    ubyte Type;
    ubyte Length;
    WHEA_NOTIFICATION_FLAGS Flags;
    union _u_e__Union
    {
        struct _Polled_e__Struct
        {
            align (1):
            uint PollInterval;
        }
        struct _Interrupt_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
        struct _LocalInterrupt_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
        struct _Sci_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
        struct _Nmi_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
        struct _Sea_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
        struct _Sei_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
        struct _Gsiv_e__Struct
        {
            align (1):
            uint PollInterval;
            uint Vector;
            uint SwitchToPollingThreshold;
            uint SwitchToPollingWindow;
            uint ErrorThreshold;
            uint ErrorThresholdWindow;
        }
    }
}
struct WHEA_XPF_MC_BANK_DESCRIPTOR
{
    align (1):
    ubyte BankNumber;
    BOOLEAN ClearOnInitialization;
    ubyte StatusDataFormat;
    XPF_MC_BANK_FLAGS Flags;
    uint ControlMsr;
    uint StatusMsr;
    uint AddressMsr;
    uint MiscMsr;
    ulong ControlData;
}
struct WHEA_XPF_MCE_DESCRIPTOR
{
    align (1):
    ushort Type;
    ubyte Enabled;
    ubyte NumberOfBanks;
    XPF_MCE_FLAGS Flags;
    ulong MCG_Capability;
    ulong MCG_GlobalControl;
    WHEA_XPF_MC_BANK_DESCRIPTOR[32] Banks;
}
struct WHEA_XPF_CMC_DESCRIPTOR
{
    align (1):
    ushort Type;
    BOOLEAN Enabled;
    ubyte NumberOfBanks;
    uint Reserved;
    WHEA_NOTIFICATION_DESCRIPTOR Notify;
    WHEA_XPF_MC_BANK_DESCRIPTOR[32] Banks;
}
struct WHEA_PCI_SLOT_NUMBER
{
    union _u_e__Union
    {
        align (1):
        struct _bits_e__Struct
        {
            align (1):
            uint _bitfield0;
        }
        uint AsULONG;
    }
}
struct WHEA_XPF_NMI_DESCRIPTOR
{
    align (1):
    ushort Type;
    BOOLEAN Enabled;
}
struct WHEA_AER_ROOTPORT_DESCRIPTOR
{
    align (1):
    ushort Type;
    BOOLEAN Enabled;
    ubyte Reserved;
    uint BusNumber;
    WHEA_PCI_SLOT_NUMBER Slot;
    ushort DeviceControl;
    AER_ROOTPORT_DESCRIPTOR_FLAGS Flags;
    uint UncorrectableErrorMask;
    uint UncorrectableErrorSeverity;
    uint CorrectableErrorMask;
    uint AdvancedCapsAndControl;
    uint RootErrorCommand;
}
struct WHEA_AER_ENDPOINT_DESCRIPTOR
{
    align (1):
    ushort Type;
    BOOLEAN Enabled;
    ubyte Reserved;
    uint BusNumber;
    WHEA_PCI_SLOT_NUMBER Slot;
    ushort DeviceControl;
    AER_ENDPOINT_DESCRIPTOR_FLAGS Flags;
    uint UncorrectableErrorMask;
    uint UncorrectableErrorSeverity;
    uint CorrectableErrorMask;
    uint AdvancedCapsAndControl;
}
struct WHEA_AER_BRIDGE_DESCRIPTOR
{
    align (1):
    ushort Type;
    BOOLEAN Enabled;
    ubyte Reserved;
    uint BusNumber;
    WHEA_PCI_SLOT_NUMBER Slot;
    ushort DeviceControl;
    AER_BRIDGE_DESCRIPTOR_FLAGS Flags;
    uint UncorrectableErrorMask;
    uint UncorrectableErrorSeverity;
    uint CorrectableErrorMask;
    uint AdvancedCapsAndControl;
    uint SecondaryUncorrectableErrorMask;
    uint SecondaryUncorrectableErrorSev;
    uint SecondaryCapsAndControl;
}
struct WHEA_GENERIC_ERROR_DESCRIPTOR
{
    align (1):
    ushort Type;
    ubyte Reserved;
    ubyte Enabled;
    uint ErrStatusBlockLength;
    uint RelatedErrorSourceId;
    ubyte ErrStatusAddressSpaceID;
    ubyte ErrStatusAddressBitWidth;
    ubyte ErrStatusAddressBitOffset;
    ubyte ErrStatusAddressAccessSize;
    LARGE_INTEGER ErrStatusAddress;
    WHEA_NOTIFICATION_DESCRIPTOR Notify;
}
struct WHEA_GENERIC_ERROR_DESCRIPTOR_V2
{
    align (1):
    ushort Type;
    ubyte Reserved;
    ubyte Enabled;
    uint ErrStatusBlockLength;
    uint RelatedErrorSourceId;
    ubyte ErrStatusAddressSpaceID;
    ubyte ErrStatusAddressBitWidth;
    ubyte ErrStatusAddressBitOffset;
    ubyte ErrStatusAddressAccessSize;
    LARGE_INTEGER ErrStatusAddress;
    WHEA_NOTIFICATION_DESCRIPTOR Notify;
    ubyte ReadAckAddressSpaceID;
    ubyte ReadAckAddressBitWidth;
    ubyte ReadAckAddressBitOffset;
    ubyte ReadAckAddressAccessSize;
    LARGE_INTEGER ReadAckAddress;
    ulong ReadAckPreserveMask;
    ulong ReadAckWriteMask;
}
struct WHEA_DEVICE_DRIVER_DESCRIPTOR
{
    align (1):
    ushort Type;
    BOOLEAN Enabled;
    ubyte Reserved;
    GUID SourceGuid;
    ushort LogTag;
    ushort Reserved2;
    uint PacketLength;
    uint PacketCount;
    ubyte* PacketBuffer;
    WHEA_ERROR_SOURCE_CONFIGURATION_DD Config;
    GUID CreatorId;
    GUID PartitionId;
    uint MaxSectionDataLength;
    uint MaxSectionsPerRecord;
    ubyte* PacketStateBuffer;
    int OpenHandles;
}
struct WHEA_IPF_MCA_DESCRIPTOR
{
    align (1):
    ushort Type;
    ubyte Enabled;
    ubyte Reserved;
}
struct WHEA_IPF_CMC_DESCRIPTOR
{
    align (1):
    ushort Type;
    ubyte Enabled;
    ubyte Reserved;
}
struct WHEA_IPF_CPE_DESCRIPTOR
{
    align (1):
    ushort Type;
    ubyte Enabled;
    ubyte Reserved;
}
struct WHEA_ERROR_SOURCE_DESCRIPTOR
{
    align (1):
    uint Length;
    uint Version;
    WHEA_ERROR_SOURCE_TYPE Type;
    WHEA_ERROR_SOURCE_STATE State;
    uint MaxRawDataLength;
    uint NumRecordsToPreallocate;
    uint MaxSectionsPerRecord;
    uint ErrorSourceId;
    uint PlatformErrorSourceId;
    uint Flags;
    union _Info_e__Union
    {
        WHEA_XPF_MCE_DESCRIPTOR XpfMceDescriptor;
        WHEA_XPF_CMC_DESCRIPTOR XpfCmcDescriptor;
        WHEA_XPF_NMI_DESCRIPTOR XpfNmiDescriptor;
        WHEA_IPF_MCA_DESCRIPTOR IpfMcaDescriptor;
        WHEA_IPF_CMC_DESCRIPTOR IpfCmcDescriptor;
        WHEA_IPF_CPE_DESCRIPTOR IpfCpeDescriptor;
        WHEA_AER_ROOTPORT_DESCRIPTOR AerRootportDescriptor;
        WHEA_AER_ENDPOINT_DESCRIPTOR AerEndpointDescriptor;
        WHEA_AER_BRIDGE_DESCRIPTOR AerBridgeDescriptor;
        WHEA_GENERIC_ERROR_DESCRIPTOR GenErrDescriptor;
        WHEA_GENERIC_ERROR_DESCRIPTOR_V2 GenErrDescriptorV2;
        WHEA_DEVICE_DRIVER_DESCRIPTOR DeviceDriverDescriptor;
    }
}
alias IPMI_OS_SEL_RECORD_TYPE = int;
enum : int
{
    IpmiOsSelRecordTypeWhea             = 0x00000000,
    IpmiOsSelRecordTypeOther            = 0x00000001,
    IpmiOsSelRecordTypeWheaErrorXpfMca  = 0x00000002,
    IpmiOsSelRecordTypeWheaErrorPci     = 0x00000003,
    IpmiOsSelRecordTypeWheaErrorNmi     = 0x00000004,
    IpmiOsSelRecordTypeWheaErrorOther   = 0x00000005,
    IpmiOsSelRecordTypeRaw              = 0x00000006,
    IpmiOsSelRecordTypeDriver           = 0x00000007,
    IpmiOsSelRecordTypeBugcheckRecovery = 0x00000008,
    IpmiOsSelRecordTypeBugcheckData     = 0x00000009,
    IpmiOsSelRecordTypeMax              = 0x0000000a,
}

struct IPMI_OS_SEL_RECORD
{
    align (1):
    uint Signature;
    uint Version;
    uint Length;
    IPMI_OS_SEL_RECORD_TYPE RecordType;
    uint DataLength;
    ubyte[1] Data;
}
