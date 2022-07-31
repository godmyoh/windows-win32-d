module windows.win32.storage.compression;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

alias COMPRESS_ALGORITHM = uint;
enum : uint
{
    COMPRESS_ALGORITHM_MSZIP       = 0x00000002,
    COMPRESS_ALGORITHM_XPRESS      = 0x00000003,
    COMPRESS_ALGORITHM_XPRESS_HUFF = 0x00000004,
    COMPRESS_ALGORITHM_LZMS        = 0x00000005,
}

BOOL CreateCompressor(COMPRESS_ALGORITHM, COMPRESS_ALLOCATION_ROUTINES*, long*);
BOOL SetCompressorInformation(COMPRESSOR_HANDLE, COMPRESS_INFORMATION_CLASS, const(void)*, ulong);
BOOL QueryCompressorInformation(COMPRESSOR_HANDLE, COMPRESS_INFORMATION_CLASS, void*, ulong);
BOOL Compress(COMPRESSOR_HANDLE, const(void)*, ulong, void*, ulong, ulong*);
BOOL ResetCompressor(COMPRESSOR_HANDLE);
BOOL CloseCompressor(COMPRESSOR_HANDLE);
BOOL CreateDecompressor(COMPRESS_ALGORITHM, COMPRESS_ALLOCATION_ROUTINES*, long*);
BOOL SetDecompressorInformation(long, COMPRESS_INFORMATION_CLASS, const(void)*, ulong);
BOOL QueryDecompressorInformation(long, COMPRESS_INFORMATION_CLASS, void*, ulong);
BOOL Decompress(long, const(void)*, ulong, void*, ulong, ulong*);
BOOL ResetDecompressor(long);
BOOL CloseDecompressor(long);
enum COMPRESS_ALGORITHM_INVALID = 0x00000000;
enum COMPRESS_ALGORITHM_NULL = 0x00000001;
enum COMPRESS_ALGORITHM_MAX = 0x00000006;
enum COMPRESS_RAW = 0x20000000;
alias COMPRESSOR_HANDLE = long;
alias PFN_COMPRESS_ALLOCATE = void* function(void*, ulong);
alias PFN_COMPRESS_FREE = void function(void*, void*);
struct COMPRESS_ALLOCATION_ROUTINES
{
    PFN_COMPRESS_ALLOCATE Allocate;
    PFN_COMPRESS_FREE Free;
    void* UserContext;
}
alias COMPRESS_INFORMATION_CLASS = int;
enum : int
{
    COMPRESS_INFORMATION_CLASS_INVALID    = 0x00000000,
    COMPRESS_INFORMATION_CLASS_BLOCK_SIZE = 0x00000001,
    COMPRESS_INFORMATION_CLASS_LEVEL      = 0x00000002,
}

