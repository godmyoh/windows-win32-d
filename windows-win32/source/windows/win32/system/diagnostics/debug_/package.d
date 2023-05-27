module windows.win32.system.diagnostics.debug_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, HANDLE, HMODULE, HRESULT, HWND, NTSTATUS, PSTR, PWSTR, SYSTEMTIME;
import windows.win32.security.wintrust : WIN_CERTIFICATE;
import windows.win32.storage.filesystem : VS_FIXEDFILEINFO;
import windows.win32.system.com : IUnknown;
import windows.win32.system.com.structuredstorage : ILockBytes;
import windows.win32.system.kernel : EXCEPTION_ROUTINE, FLOATING_SAVE_AREA, LIST_ENTRY;
import windows.win32.system.memory : VIRTUAL_ALLOCATION_TYPE;
import windows.win32.system.ole : CADWORD, CALPOLESTR;
import windows.win32.system.systeminformation : IMAGE_FILE_MACHINE, PROCESSOR_ARCHITECTURE;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE;
import windows.win32.system.time : TIME_ZONE_INFORMATION;
import windows.win32.system.variant : VARIANT;
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
    HANDLE_LIVE_DUMP                                         = 0x000001ec,
    HANDLE_ERROR_ON_CRITICAL_THREAD                          = 0x000001ed,
    MPSDRV_QUERY_USER                                        = 0x400001ee,
    VMBUS_LIVEDUMP                                           = 0x400001ef,
    USB4_HARDWARE_VIOLATION                                  = 0x000001f0,
    KASAN_ENLIGHTENMENT_VIOLATION                            = 0x000001f1,
    KASAN_ILLEGAL_ACCESS                                     = 0x000001f2,
    IORING                                                   = 0x000001f3,
    MDL_CACHE                                                = 0x000001f4,
    MISALIGNED_POINTER_PARAMETER                             = 0x000001f6,
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
    XBOX_MANUALLY_INITIATED_CRASH                            = 0x00030006,
    MANUALLY_INITIATED_BLACKSCREEN_HOTKEY_LIVE_DUMP          = 0x000021c8,
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

alias IMAGE_DIRECTORY_ENTRY = ushort;
enum : ushort
{
    IMAGE_DIRECTORY_ENTRY_ARCHITECTURE   = 0x0007,
    IMAGE_DIRECTORY_ENTRY_BASERELOC      = 0x0005,
    IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT   = 0x000b,
    IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 0x000e,
    IMAGE_DIRECTORY_ENTRY_DEBUG          = 0x0006,
    IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT   = 0x000d,
    IMAGE_DIRECTORY_ENTRY_EXCEPTION      = 0x0003,
    IMAGE_DIRECTORY_ENTRY_EXPORT         = 0x0000,
    IMAGE_DIRECTORY_ENTRY_GLOBALPTR      = 0x0008,
    IMAGE_DIRECTORY_ENTRY_IAT            = 0x000c,
    IMAGE_DIRECTORY_ENTRY_IMPORT         = 0x0001,
    IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG    = 0x000a,
    IMAGE_DIRECTORY_ENTRY_RESOURCE       = 0x0002,
    IMAGE_DIRECTORY_ENTRY_SECURITY       = 0x0004,
    IMAGE_DIRECTORY_ENTRY_TLS            = 0x0009,
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

alias CONTEXT_FLAGS = uint;
enum : uint
{
    CONTEXT_AMD64                     = 0x00100000,
    CONTEXT_CONTROL_AMD64             = 0x00100001,
    CONTEXT_INTEGER_AMD64             = 0x00100002,
    CONTEXT_SEGMENTS_AMD64            = 0x00100004,
    CONTEXT_FLOATING_POINT_AMD64      = 0x00100008,
    CONTEXT_DEBUG_REGISTERS_AMD64     = 0x00100010,
    CONTEXT_FULL_AMD64                = 0x0010000b,
    CONTEXT_ALL_AMD64                 = 0x0010001f,
    CONTEXT_XSTATE_AMD64              = 0x00100040,
    CONTEXT_KERNEL_CET_AMD64          = 0x00100080,
    CONTEXT_KERNEL_DEBUGGER_AMD64     = 0x04000000,
    CONTEXT_EXCEPTION_ACTIVE_AMD64    = 0x08000000,
    CONTEXT_SERVICE_ACTIVE_AMD64      = 0x10000000,
    CONTEXT_EXCEPTION_REQUEST_AMD64   = 0x40000000,
    CONTEXT_EXCEPTION_REPORTING_AMD64 = 0x80000000,
    CONTEXT_UNWOUND_TO_CALL_AMD64     = 0x20000000,
    CONTEXT_X86                       = 0x00010000,
    CONTEXT_CONTROL_X86               = 0x00010001,
    CONTEXT_INTEGER_X86               = 0x00010002,
    CONTEXT_SEGMENTS_X86              = 0x00010004,
    CONTEXT_FLOATING_POINT_X86        = 0x00010008,
    CONTEXT_DEBUG_REGISTERS_X86       = 0x00010010,
    CONTEXT_EXTENDED_REGISTERS_X86    = 0x00010020,
    CONTEXT_FULL_X86                  = 0x00010007,
    CONTEXT_ALL_X86                   = 0x0001003f,
    CONTEXT_XSTATE_X86                = 0x00010040,
    CONTEXT_EXCEPTION_ACTIVE_X86      = 0x08000000,
    CONTEXT_SERVICE_ACTIVE_X86        = 0x10000000,
    CONTEXT_EXCEPTION_REQUEST_X86     = 0x40000000,
    CONTEXT_EXCEPTION_REPORTING_X86   = 0x80000000,
    CONTEXT_ARM64                     = 0x00400000,
    CONTEXT_CONTROL_ARM64             = 0x00400001,
    CONTEXT_INTEGER_ARM64             = 0x00400002,
    CONTEXT_FLOATING_POINT_ARM64      = 0x00400004,
    CONTEXT_DEBUG_REGISTERS_ARM64     = 0x00400008,
    CONTEXT_X18_ARM64                 = 0x00400010,
    CONTEXT_FULL_ARM64                = 0x00400007,
    CONTEXT_ALL_ARM64                 = 0x0040001f,
    CONTEXT_EXCEPTION_ACTIVE_ARM64    = 0x08000000,
    CONTEXT_SERVICE_ACTIVE_ARM64      = 0x10000000,
    CONTEXT_EXCEPTION_REQUEST_ARM64   = 0x40000000,
    CONTEXT_EXCEPTION_REPORTING_ARM64 = 0x80000000,
    CONTEXT_UNWOUND_TO_CALL_ARM64     = 0x20000000,
    CONTEXT_RET_TO_GUEST_ARM64        = 0x40000000,
    CONTEXT_ARM                       = 0x00200000,
    CONTEXT_CONTROL_ARM               = 0x00200001,
    CONTEXT_INTEGER_ARM               = 0x00200002,
    CONTEXT_FLOATING_POINT_ARM        = 0x00200004,
    CONTEXT_DEBUG_REGISTERS_ARM       = 0x00200008,
    CONTEXT_FULL_ARM                  = 0x00200007,
    CONTEXT_ALL_ARM                   = 0x0020000f,
    CONTEXT_EXCEPTION_ACTIVE_ARM      = 0x08000000,
    CONTEXT_SERVICE_ACTIVE_ARM        = 0x10000000,
    CONTEXT_EXCEPTION_REQUEST_ARM     = 0x40000000,
    CONTEXT_EXCEPTION_REPORTING_ARM   = 0x80000000,
    CONTEXT_UNWOUND_TO_CALL_ARM       = 0x20000000,
}

alias WOW64_CONTEXT_FLAGS = uint;
enum : uint
{
    WOW64_CONTEXT_X86                 = 0x00010000,
    WOW64_CONTEXT_CONTROL             = 0x00010001,
    WOW64_CONTEXT_INTEGER             = 0x00010002,
    WOW64_CONTEXT_SEGMENTS            = 0x00010004,
    WOW64_CONTEXT_FLOATING_POINT      = 0x00010008,
    WOW64_CONTEXT_DEBUG_REGISTERS     = 0x00010010,
    WOW64_CONTEXT_EXTENDED_REGISTERS  = 0x00010020,
    WOW64_CONTEXT_FULL                = 0x00010007,
    WOW64_CONTEXT_ALL                 = 0x0001003f,
    WOW64_CONTEXT_XSTATE              = 0x00010040,
    WOW64_CONTEXT_EXCEPTION_ACTIVE    = 0x08000000,
    WOW64_CONTEXT_SERVICE_ACTIVE      = 0x10000000,
    WOW64_CONTEXT_EXCEPTION_REQUEST   = 0x40000000,
    WOW64_CONTEXT_EXCEPTION_REPORTING = 0x80000000,
}

BOOLEAN RtlAddFunctionTable(IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*, uint, ulong);
BOOLEAN RtlDeleteFunctionTable(IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*);
BOOLEAN RtlInstallFunctionTableCallback(ulong, ulong, uint, PGET_RUNTIME_FUNCTION_CALLBACK, void*, const(wchar)*);
uint RtlAddGrowableFunctionTable(void**, IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*, uint, uint, ulong, ulong);
IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY* RtlLookupFunctionEntry(ulong, ulong*, UNWIND_HISTORY_TABLE*);
EXCEPTION_ROUTINE RtlVirtualUnwind(RTL_VIRTUAL_UNWIND_HANDLER_TYPE, ulong, ulong, IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY*, CONTEXT*, void**, ulong*, KNONVOLATILE_CONTEXT_POINTERS_ARM64*);
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
BOOL ContinueDebugEvent(uint, uint, NTSTATUS);
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
BOOL StackWalk2(uint, HANDLE, HANDLE, STACKFRAME_EX*, void*, PREAD_PROCESS_MEMORY_ROUTINE64, PFUNCTION_TABLE_ACCESS_ROUTINE64, PGET_MODULE_BASE_ROUTINE64, PTRANSLATE_ADDRESS_ROUTINE64, PGET_TARGET_ATTRIBUTE_VALUE64, uint);
BOOL StackWalk(uint, HANDLE, HANDLE, STACKFRAME*, void*, PREAD_PROCESS_MEMORY_ROUTINE, PFUNCTION_TABLE_ACCESS_ROUTINE, PGET_MODULE_BASE_ROUTINE, PTRANSLATE_ADDRESS_ROUTINE);
API_VERSION* ImagehlpApiVersion();
API_VERSION* ImagehlpApiVersionEx(API_VERSION*);
uint GetTimestampForLoadedLibrary(HMODULE);
BOOL SymSetParentWindow(HWND);
PSTR SymSetHomeDirectory(HANDLE, const(char)*);
PWSTR SymSetHomeDirectoryW(HANDLE, const(wchar)*);
PSTR SymGetHomeDirectory(uint, PSTR, ulong);
PWSTR SymGetHomeDirectoryW(uint, PWSTR, ulong);
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
BOOL SymGetSymbolFile(HANDLE, const(char)*, const(char)*, uint, PSTR, ulong, PSTR, ulong);
BOOL SymGetSymbolFileW(HANDLE, const(wchar)*, const(wchar)*, uint, PWSTR, ulong, PWSTR, ulong);
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
BOOL CopyContext(CONTEXT*, CONTEXT_FLAGS, CONTEXT*);
BOOL InitializeContext(void*, CONTEXT_FLAGS, CONTEXT**, uint*);
BOOL InitializeContext2(void*, CONTEXT_FLAGS, CONTEXT**, uint*, ulong);
ulong GetEnabledXStateFeatures();
BOOL GetXStateFeaturesMask(CONTEXT*, ulong*);
void* LocateXStateFeature(CONTEXT*, uint, uint*);
BOOL SetXStateFeaturesMask(CONTEXT*, ulong);
enum WOW64_SIZE_OF_80387_REGISTERS = 0x00000050;
enum WOW64_MAXIMUM_SUPPORTED_EXTENSION = 0x00000200;
enum RESTORE_LAST_ERROR_NAME_A = "RestoreLastError";
enum RESTORE_LAST_ERROR_NAME_W = "RestoreLastError";
enum RESTORE_LAST_ERROR_NAME = "RestoreLastError";
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
enum TARGET_ATTRIBUTE_PACMASK = 0x00000001;
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
enum INTERFACESAFE_FOR_UNTRUSTED_CALLER = 0x00000001;
enum INTERFACESAFE_FOR_UNTRUSTED_DATA = 0x00000002;
enum INTERFACE_USES_DISPEX = 0x00000004;
enum INTERFACE_USES_SECURITY_MANAGER = 0x00000008;
enum WCT_MAX_NODE_COUNT = 0x00000010;
enum WCT_OBJNAME_LENGTH = 0x00000080;
enum WCT_NETWORK_IO_FLAG = 0x00000008;
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
enum WHEA_ROW_FAIL_CHECK_EXTENT = 0x00000011;
enum WHEA_ROW_FAIL_CHECK_ENABLE = 0x00000012;
enum WHEA_ROW_FAIL_CHECK_THRESHOLD = 0x00000013;
enum IPMI_OS_SEL_RECORD_VERSION_1 = 0x00000001;
enum IPMI_OS_SEL_RECORD_VERSION = 0x00000001;
enum IPMI_IOCTL_INDEX = 0x00000400;
enum IOCTL_IPMI_INTERNAL_RECORD_SEL_EVENT = 0x00221000;
enum IPMI_OS_SEL_RECORD_MASK = 0x0000ffff;
enum sevMax = 0x00000004;
struct CONTEXT
{
    CONTEXT_FLAGS ContextFlags;
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
struct APC_CALLBACK_DATA
{
    ulong Parameter;
    CONTEXT* ContextRecord;
    ulong Reserved0;
    ulong Reserved1;
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
    CONTEXT_FLAGS ContextFlags;
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
struct MINIDUMP_EXCEPTION_INFORMATION
{
    align (4):
    uint ThreadId;
    EXCEPTION_POINTERS* ExceptionPointers;
    BOOL ClientPointers;
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
struct MINIDUMP_CALLBACK_INFORMATION
{
    align (4):
    MINIDUMP_CALLBACK_ROUTINE CallbackRoutine;
    void* CallbackParam;
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
    CONTEXT_FLAGS ContextFlags;
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
    WOW64_CONTEXT_FLAGS ContextFlags;
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
    uint GuardMemcpyFunctionPointer;
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
    ulong GuardMemcpyFunctionPointer;
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
            long Timeout;
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
/+ [CONFLICTED] struct MINIDUMP_EXCEPTION_INFORMATION
{
    uint ThreadId;
    EXCEPTION_POINTERS* ExceptionPointers;
    BOOL ClientPointers;
}
+/
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
/+ [CONFLICTED] struct MINIDUMP_USER_STREAM
{
    uint Type;
    uint BufferSize;
    void* Buffer;
}
+/
/+ [CONFLICTED] struct MINIDUMP_USER_STREAM_INFORMATION
{
    uint UserStreamCount;
    MINIDUMP_USER_STREAM* UserStreamArray;
}
+/
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
alias MINIDUMP_TYPE = int;
enum : int
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
/+ [CONFLICTED] struct MINIDUMP_CALLBACK_INFORMATION
{
    MINIDUMP_CALLBACK_ROUTINE CallbackRoutine;
    void* CallbackParam;
}
+/
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
alias PGET_TARGET_ATTRIBUTE_VALUE64 = BOOL function(HANDLE, uint, ulong, ulong*);
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
    long RequiredDumpSpace;
    ubyte[16] _reserved2;
    long SystemUpTime;
    long SystemTime;
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
    long RequiredDumpSpace;
    long SystemTime;
    CHAR[128] Comment;
    long SystemUpTime;
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
    WheaErrSrcTypeSea          = 0x00000011,
    WheaErrSrcTypeSei          = 0x00000012,
    WheaErrSrcTypeMax          = 0x00000013,
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
    long ErrStatusAddress;
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
    long ErrStatusAddress;
    WHEA_NOTIFICATION_DESCRIPTOR Notify;
    ubyte ReadAckAddressSpaceID;
    ubyte ReadAckAddressBitWidth;
    ubyte ReadAckAddressBitOffset;
    ubyte ReadAckAddressAccessSize;
    long ReadAckAddress;
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
alias DBGPROP_ATTRIB_FLAGS = int;
enum : int
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

alias DBGPROP_INFO = int;
enum : int
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
