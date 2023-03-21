module windows.win32.system.jobobjects;

import windows.win32.foundation : BOOL, HANDLE, PSTR, PWSTR;
import windows.win32.security_ : SECURITY_ATTRIBUTES, TOKEN_GROUPS, TOKEN_PRIVILEGES;
import windows.win32.system.threading : IO_COUNTERS;

version (Windows):
extern (Windows):

alias JOB_OBJECT_LIMIT = uint;
enum : uint
{
    JOB_OBJECT_LIMIT_WORKINGSET                 = 0x00000001,
    JOB_OBJECT_LIMIT_PROCESS_TIME               = 0x00000002,
    JOB_OBJECT_LIMIT_JOB_TIME                   = 0x00000004,
    JOB_OBJECT_LIMIT_ACTIVE_PROCESS             = 0x00000008,
    JOB_OBJECT_LIMIT_AFFINITY                   = 0x00000010,
    JOB_OBJECT_LIMIT_PRIORITY_CLASS             = 0x00000020,
    JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME          = 0x00000040,
    JOB_OBJECT_LIMIT_SCHEDULING_CLASS           = 0x00000080,
    JOB_OBJECT_LIMIT_PROCESS_MEMORY             = 0x00000100,
    JOB_OBJECT_LIMIT_JOB_MEMORY                 = 0x00000200,
    JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH            = 0x00000200,
    JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION = 0x00000400,
    JOB_OBJECT_LIMIT_BREAKAWAY_OK               = 0x00000800,
    JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK        = 0x00001000,
    JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE          = 0x00002000,
    JOB_OBJECT_LIMIT_SUBSET_AFFINITY            = 0x00004000,
    JOB_OBJECT_LIMIT_JOB_MEMORY_LOW             = 0x00008000,
    JOB_OBJECT_LIMIT_JOB_READ_BYTES             = 0x00010000,
    JOB_OBJECT_LIMIT_JOB_WRITE_BYTES            = 0x00020000,
    JOB_OBJECT_LIMIT_RATE_CONTROL               = 0x00040000,
    JOB_OBJECT_LIMIT_CPU_RATE_CONTROL           = 0x00040000,
    JOB_OBJECT_LIMIT_IO_RATE_CONTROL            = 0x00080000,
    JOB_OBJECT_LIMIT_NET_RATE_CONTROL           = 0x00100000,
    JOB_OBJECT_LIMIT_VALID_FLAGS                = 0x0007ffff,
    JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS          = 0x000000ff,
    JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS       = 0x00007fff,
    JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS   = 0x001f8204,
}

alias JOB_OBJECT_UILIMIT = uint;
enum : uint
{
    JOB_OBJECT_UILIMIT_NONE             = 0x00000000,
    JOB_OBJECT_UILIMIT_HANDLES          = 0x00000001,
    JOB_OBJECT_UILIMIT_READCLIPBOARD    = 0x00000002,
    JOB_OBJECT_UILIMIT_WRITECLIPBOARD   = 0x00000004,
    JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS = 0x00000008,
    JOB_OBJECT_UILIMIT_DISPLAYSETTINGS  = 0x00000010,
    JOB_OBJECT_UILIMIT_GLOBALATOMS      = 0x00000020,
    JOB_OBJECT_UILIMIT_DESKTOP          = 0x00000040,
    JOB_OBJECT_UILIMIT_EXITWINDOWS      = 0x00000080,
}

alias JOB_OBJECT_SECURITY = uint;
enum : uint
{
    JOB_OBJECT_SECURITY_NO_ADMIN         = 0x00000001,
    JOB_OBJECT_SECURITY_RESTRICTED_TOKEN = 0x00000002,
    JOB_OBJECT_SECURITY_ONLY_TOKEN       = 0x00000004,
    JOB_OBJECT_SECURITY_FILTER_TOKENS    = 0x00000008,
    JOB_OBJECT_SECURITY_VALID_FLAGS      = 0x0000000f,
}

alias JOB_OBJECT_CPU_RATE_CONTROL = uint;
enum : uint
{
    JOB_OBJECT_CPU_RATE_CONTROL_ENABLE       = 0x00000001,
    JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED = 0x00000002,
    JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP     = 0x00000004,
    JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY       = 0x00000008,
    JOB_OBJECT_CPU_RATE_CONTROL_MIN_MAX_RATE = 0x00000010,
    JOB_OBJECT_CPU_RATE_CONTROL_VALID_FLAGS  = 0x0000001f,
}

alias JOB_OBJECT_TERMINATE_AT_END_ACTION = uint;
enum : uint
{
    JOB_OBJECT_TERMINATE_AT_END_OF_JOB = 0x00000000,
    JOB_OBJECT_POST_AT_END_OF_JOB      = 0x00000001,
}

struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION
{
    long MaxIops;
    long MaxBandwidth;
    long ReservationIops;
    const(wchar)* VolumeName;
    uint BaseIoSize;
    JOB_OBJECT_IO_RATE_CONTROL_FLAGS ControlFlags;
}
BOOL IsProcessInJob(HANDLE, HANDLE, BOOL*);
HANDLE CreateJobObjectW(SECURITY_ATTRIBUTES*, const(wchar)*);
void FreeMemoryJobObject(void*);
HANDLE OpenJobObjectW(uint, BOOL, const(wchar)*);
BOOL AssignProcessToJobObject(HANDLE, HANDLE);
BOOL TerminateJobObject(HANDLE, uint);
BOOL SetInformationJobObject(HANDLE, JOBOBJECTINFOCLASS, void*, uint);
uint SetIoRateControlInformationJobObject(HANDLE, JOBOBJECT_IO_RATE_CONTROL_INFORMATION*);
BOOL QueryInformationJobObject(HANDLE, JOBOBJECTINFOCLASS, void*, uint, uint*);
uint QueryIoRateControlInformationJobObject(HANDLE, const(wchar)*, JOBOBJECT_IO_RATE_CONTROL_INFORMATION**, uint*);
BOOL UserHandleGrantAccess(HANDLE, HANDLE, BOOL);
HANDLE CreateJobObjectA(SECURITY_ATTRIBUTES*, const(char)*);
HANDLE OpenJobObjectA(uint, BOOL, const(char)*);
BOOL CreateJobSet(uint, JOB_SET_ARRAY*, uint);
struct JOB_SET_ARRAY
{
    HANDLE JobHandle;
    uint MemberLevel;
    uint Flags;
}
struct JOBOBJECT_BASIC_ACCOUNTING_INFORMATION
{
    long TotalUserTime;
    long TotalKernelTime;
    long ThisPeriodTotalUserTime;
    long ThisPeriodTotalKernelTime;
    uint TotalPageFaultCount;
    uint TotalProcesses;
    uint ActiveProcesses;
    uint TotalTerminatedProcesses;
}
struct JOBOBJECT_BASIC_LIMIT_INFORMATION
{
    long PerProcessUserTimeLimit;
    long PerJobUserTimeLimit;
    JOB_OBJECT_LIMIT LimitFlags;
    ulong MinimumWorkingSetSize;
    ulong MaximumWorkingSetSize;
    uint ActiveProcessLimit;
    ulong Affinity;
    uint PriorityClass;
    uint SchedulingClass;
}
struct JOBOBJECT_EXTENDED_LIMIT_INFORMATION
{
    JOBOBJECT_BASIC_LIMIT_INFORMATION BasicLimitInformation;
    IO_COUNTERS IoInfo;
    ulong ProcessMemoryLimit;
    ulong JobMemoryLimit;
    ulong PeakProcessMemoryUsed;
    ulong PeakJobMemoryUsed;
}
struct JOBOBJECT_BASIC_PROCESS_ID_LIST
{
    uint NumberOfAssignedProcesses;
    uint NumberOfProcessIdsInList;
    ulong[1] ProcessIdList;
}
struct JOBOBJECT_BASIC_UI_RESTRICTIONS
{
    JOB_OBJECT_UILIMIT UIRestrictionsClass;
}
struct JOBOBJECT_SECURITY_LIMIT_INFORMATION
{
    JOB_OBJECT_SECURITY SecurityLimitFlags;
    HANDLE JobToken;
    TOKEN_GROUPS* SidsToDisable;
    TOKEN_PRIVILEGES* PrivilegesToDelete;
    TOKEN_GROUPS* RestrictedSids;
}
struct JOBOBJECT_END_OF_JOB_TIME_INFORMATION
{
    JOB_OBJECT_TERMINATE_AT_END_ACTION EndOfJobTimeAction;
}
struct JOBOBJECT_ASSOCIATE_COMPLETION_PORT
{
    void* CompletionKey;
    HANDLE CompletionPort;
}
struct JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION
{
    JOBOBJECT_BASIC_ACCOUNTING_INFORMATION BasicInfo;
    IO_COUNTERS IoInfo;
}
struct JOBOBJECT_JOBSET_INFORMATION
{
    uint MemberLevel;
}
alias JOBOBJECT_RATE_CONTROL_TOLERANCE = int;
enum : int
{
    ToleranceLow    = 0x00000001,
    ToleranceMedium = 0x00000002,
    ToleranceHigh   = 0x00000003,
}

alias JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL = int;
enum : int
{
    ToleranceIntervalShort  = 0x00000001,
    ToleranceIntervalMedium = 0x00000002,
    ToleranceIntervalLong   = 0x00000003,
}

struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION
{
    ulong IoReadBytesLimit;
    ulong IoWriteBytesLimit;
    long PerJobUserTimeLimit;
    ulong JobMemoryLimit;
    JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlTolerance;
    JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL RateControlToleranceInterval;
    JOB_OBJECT_LIMIT LimitFlags;
}
struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2
{
    ulong IoReadBytesLimit;
    ulong IoWriteBytesLimit;
    long PerJobUserTimeLimit;
    union
    {
        ulong JobHighMemoryLimit;
        ulong JobMemoryLimit;
    }
    union
    {
        JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlTolerance;
        JOBOBJECT_RATE_CONTROL_TOLERANCE CpuRateControlTolerance;
    }
    union
    {
        JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL RateControlToleranceInterval;
        JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL CpuRateControlToleranceInterval;
    }
    JOB_OBJECT_LIMIT LimitFlags;
    JOBOBJECT_RATE_CONTROL_TOLERANCE IoRateControlTolerance;
    ulong JobLowMemoryLimit;
    JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL IoRateControlToleranceInterval;
    JOBOBJECT_RATE_CONTROL_TOLERANCE NetRateControlTolerance;
    JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL NetRateControlToleranceInterval;
}
struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION
{
    JOB_OBJECT_LIMIT LimitFlags;
    JOB_OBJECT_LIMIT ViolationLimitFlags;
    ulong IoReadBytes;
    ulong IoReadBytesLimit;
    ulong IoWriteBytes;
    ulong IoWriteBytesLimit;
    long PerJobUserTime;
    long PerJobUserTimeLimit;
    ulong JobMemory;
    ulong JobMemoryLimit;
    JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlTolerance;
    JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlToleranceLimit;
}
struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2
{
    JOB_OBJECT_LIMIT LimitFlags;
    JOB_OBJECT_LIMIT ViolationLimitFlags;
    ulong IoReadBytes;
    ulong IoReadBytesLimit;
    ulong IoWriteBytes;
    ulong IoWriteBytesLimit;
    long PerJobUserTime;
    long PerJobUserTimeLimit;
    ulong JobMemory;
    union
    {
        ulong JobHighMemoryLimit;
        ulong JobMemoryLimit;
    }
    union
    {
        JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlTolerance;
        JOBOBJECT_RATE_CONTROL_TOLERANCE CpuRateControlTolerance;
    }
    union
    {
        JOBOBJECT_RATE_CONTROL_TOLERANCE RateControlToleranceLimit;
        JOBOBJECT_RATE_CONTROL_TOLERANCE CpuRateControlToleranceLimit;
    }
    ulong JobLowMemoryLimit;
    JOBOBJECT_RATE_CONTROL_TOLERANCE IoRateControlTolerance;
    JOBOBJECT_RATE_CONTROL_TOLERANCE IoRateControlToleranceLimit;
    JOBOBJECT_RATE_CONTROL_TOLERANCE NetRateControlTolerance;
    JOBOBJECT_RATE_CONTROL_TOLERANCE NetRateControlToleranceLimit;
}
struct JOBOBJECT_CPU_RATE_CONTROL_INFORMATION
{
    JOB_OBJECT_CPU_RATE_CONTROL ControlFlags;
    union
    {
        uint CpuRate;
        uint Weight;
        struct
        {
            ushort MinRate;
            ushort MaxRate;
        }
    }
}
alias JOB_OBJECT_NET_RATE_CONTROL_FLAGS = int;
enum : int
{
    JOB_OBJECT_NET_RATE_CONTROL_ENABLE        = 0x00000001,
    JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH = 0x00000002,
    JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG      = 0x00000004,
    JOB_OBJECT_NET_RATE_CONTROL_VALID_FLAGS   = 0x00000007,
}

struct JOBOBJECT_NET_RATE_CONTROL_INFORMATION
{
    ulong MaxBandwidth;
    JOB_OBJECT_NET_RATE_CONTROL_FLAGS ControlFlags;
    ubyte DscpTag;
}
alias JOB_OBJECT_IO_RATE_CONTROL_FLAGS = int;
enum : int
{
    JOB_OBJECT_IO_RATE_CONTROL_ENABLE                        = 0x00000001,
    JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME             = 0x00000002,
    JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL         = 0x00000004,
    JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP = 0x00000008,
    JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS                   = 0x0000000f,
}

struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V1
{
    long MaxIops;
    long MaxBandwidth;
    long ReservationIops;
    PWSTR VolumeName;
    uint BaseIoSize;
    JOB_OBJECT_IO_RATE_CONTROL_FLAGS ControlFlags;
    ushort VolumeNameLength;
}
struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V2
{
    long MaxIops;
    long MaxBandwidth;
    long ReservationIops;
    PWSTR VolumeName;
    uint BaseIoSize;
    JOB_OBJECT_IO_RATE_CONTROL_FLAGS ControlFlags;
    ushort VolumeNameLength;
    long CriticalReservationIops;
    long ReservationBandwidth;
    long CriticalReservationBandwidth;
    long MaxTimePercent;
    long ReservationTimePercent;
    long CriticalReservationTimePercent;
}
struct JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V3
{
    long MaxIops;
    long MaxBandwidth;
    long ReservationIops;
    PWSTR VolumeName;
    uint BaseIoSize;
    JOB_OBJECT_IO_RATE_CONTROL_FLAGS ControlFlags;
    ushort VolumeNameLength;
    long CriticalReservationIops;
    long ReservationBandwidth;
    long CriticalReservationBandwidth;
    long MaxTimePercent;
    long ReservationTimePercent;
    long CriticalReservationTimePercent;
    long SoftMaxIops;
    long SoftMaxBandwidth;
    long SoftMaxTimePercent;
    long LimitExcessNotifyIops;
    long LimitExcessNotifyBandwidth;
    long LimitExcessNotifyTimePercent;
}
alias JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS = int;
enum : int
{
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE      = 0x00000001,
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE     = 0x00000002,
    JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS = 0x00000003,
}

struct JOBOBJECT_IO_ATTRIBUTION_STATS
{
    ulong IoCount;
    ulong TotalNonOverlappedQueueTime;
    ulong TotalNonOverlappedServiceTime;
    ulong TotalSize;
}
struct JOBOBJECT_IO_ATTRIBUTION_INFORMATION
{
    uint ControlFlags;
    JOBOBJECT_IO_ATTRIBUTION_STATS ReadStats;
    JOBOBJECT_IO_ATTRIBUTION_STATS WriteStats;
}
alias JOBOBJECTINFOCLASS = int;
enum : int
{
    JobObjectBasicAccountingInformation         = 0x00000001,
    JobObjectBasicLimitInformation              = 0x00000002,
    JobObjectBasicProcessIdList                 = 0x00000003,
    JobObjectBasicUIRestrictions                = 0x00000004,
    JobObjectSecurityLimitInformation           = 0x00000005,
    JobObjectEndOfJobTimeInformation            = 0x00000006,
    JobObjectAssociateCompletionPortInformation = 0x00000007,
    JobObjectBasicAndIoAccountingInformation    = 0x00000008,
    JobObjectExtendedLimitInformation           = 0x00000009,
    JobObjectJobSetInformation                  = 0x0000000a,
    JobObjectGroupInformation                   = 0x0000000b,
    JobObjectNotificationLimitInformation       = 0x0000000c,
    JobObjectLimitViolationInformation          = 0x0000000d,
    JobObjectGroupInformationEx                 = 0x0000000e,
    JobObjectCpuRateControlInformation          = 0x0000000f,
    JobObjectCompletionFilter                   = 0x00000010,
    JobObjectCompletionCounter                  = 0x00000011,
    JobObjectReserved1Information               = 0x00000012,
    JobObjectReserved2Information               = 0x00000013,
    JobObjectReserved3Information               = 0x00000014,
    JobObjectReserved4Information               = 0x00000015,
    JobObjectReserved5Information               = 0x00000016,
    JobObjectReserved6Information               = 0x00000017,
    JobObjectReserved7Information               = 0x00000018,
    JobObjectReserved8Information               = 0x00000019,
    JobObjectReserved9Information               = 0x0000001a,
    JobObjectReserved10Information              = 0x0000001b,
    JobObjectReserved11Information              = 0x0000001c,
    JobObjectReserved12Information              = 0x0000001d,
    JobObjectReserved13Information              = 0x0000001e,
    JobObjectReserved14Information              = 0x0000001f,
    JobObjectNetRateControlInformation          = 0x00000020,
    JobObjectNotificationLimitInformation2      = 0x00000021,
    JobObjectLimitViolationInformation2         = 0x00000022,
    JobObjectCreateSilo                         = 0x00000023,
    JobObjectSiloBasicInformation               = 0x00000024,
    JobObjectReserved15Information              = 0x00000025,
    JobObjectReserved16Information              = 0x00000026,
    JobObjectReserved17Information              = 0x00000027,
    JobObjectReserved18Information              = 0x00000028,
    JobObjectReserved19Information              = 0x00000029,
    JobObjectReserved20Information              = 0x0000002a,
    JobObjectReserved21Information              = 0x0000002b,
    JobObjectReserved22Information              = 0x0000002c,
    JobObjectReserved23Information              = 0x0000002d,
    JobObjectReserved24Information              = 0x0000002e,
    JobObjectReserved25Information              = 0x0000002f,
    JobObjectReserved26Information              = 0x00000030,
    JobObjectReserved27Information              = 0x00000031,
    MaxJobObjectInfoClass                       = 0x00000032,
}

