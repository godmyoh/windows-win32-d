module windows.win32.system.performance.hardwarecounterprofiling;

import windows.win32.foundation : BOOLEAN, HANDLE;

version (Windows):
extern (Windows):

alias HARDWARE_COUNTER_TYPE = int;
enum : int
{
    PMCCounter             = 0x00000000,
    MaxHardwareCounterType = 0x00000001,
}

struct HARDWARE_COUNTER_DATA
{
    HARDWARE_COUNTER_TYPE Type;
    uint Reserved;
    ulong Value;
}
struct PERFORMANCE_DATA
{
    ushort Size;
    ubyte Version;
    ubyte HwCountersCount;
    uint ContextSwitchCount;
    ulong WaitReasonBitMap;
    ulong CycleTime;
    uint RetryCount;
    uint Reserved;
    HARDWARE_COUNTER_DATA[16] HwCounters;
}
uint EnableThreadProfiling(HANDLE ThreadHandle, uint Flags, ulong HardwareCounters, HANDLE* PerformanceDataHandle);
uint DisableThreadProfiling(HANDLE PerformanceDataHandle);
uint QueryThreadProfiling(HANDLE ThreadHandle, BOOLEAN* Enabled);
uint ReadThreadProfilingData(HANDLE PerformanceDataHandle, uint Flags, PERFORMANCE_DATA* PerformanceData);
