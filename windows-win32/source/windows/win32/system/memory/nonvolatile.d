module windows.win32.system.memory.nonvolatile;


version (Windows):
extern (Windows):

uint RtlGetNonVolatileToken(void*, ulong, void**);
uint RtlFreeNonVolatileToken(void*);
uint RtlFlushNonVolatileMemory(void*, void*, ulong, uint);
uint RtlDrainNonVolatileFlush(void*);
uint RtlWriteNonVolatileMemory(void*, void*, const(void)*, ulong, uint);
uint RtlFillNonVolatileMemory(void*, void*, ulong, const(ubyte), uint);
uint RtlFlushNonVolatileMemoryRanges(void*, NV_MEMORY_RANGE*, ulong, uint);
struct NV_MEMORY_RANGE
{
    void* BaseAddress;
    ulong Length;
}
