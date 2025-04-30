module windows.win32.system.memory.nonvolatile;


version (Windows):
extern (Windows):

uint RtlGetNonVolatileToken(void* NvBuffer, ulong Size, void** NvToken);
uint RtlFreeNonVolatileToken(void* NvToken);
uint RtlFlushNonVolatileMemory(void* NvToken, void* NvBuffer, ulong Size, uint Flags);
uint RtlDrainNonVolatileFlush(void* NvToken);
uint RtlWriteNonVolatileMemory(void* NvToken, void* NvDestination, const(void)* Source, ulong Size, uint Flags);
uint RtlFillNonVolatileMemory(void* NvToken, void* NvDestination, ulong Size, const(ubyte) Value, uint Flags);
uint RtlFlushNonVolatileMemoryRanges(void* NvToken, NV_MEMORY_RANGE* NvRanges, ulong NumRanges, uint Flags);
struct NV_MEMORY_RANGE
{
    void* BaseAddress;
    ulong Length;
}
