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

BOOL CreateCompressor(COMPRESS_ALGORITHM Algorithm, COMPRESS_ALLOCATION_ROUTINES* AllocationRoutines, COMPRESSOR_HANDLE* CompressorHandle);
BOOL SetCompressorInformation(COMPRESSOR_HANDLE CompressorHandle, COMPRESS_INFORMATION_CLASS CompressInformationClass, const(void)* CompressInformation, ulong CompressInformationSize);
BOOL QueryCompressorInformation(COMPRESSOR_HANDLE CompressorHandle, COMPRESS_INFORMATION_CLASS CompressInformationClass, void* CompressInformation, ulong CompressInformationSize);
BOOL Compress(COMPRESSOR_HANDLE CompressorHandle, const(void)* UncompressedData, ulong UncompressedDataSize, void* CompressedBuffer, ulong CompressedBufferSize, ulong* CompressedDataSize);
BOOL ResetCompressor(COMPRESSOR_HANDLE CompressorHandle);
BOOL CloseCompressor(COMPRESSOR_HANDLE CompressorHandle);
BOOL CreateDecompressor(COMPRESS_ALGORITHM Algorithm, COMPRESS_ALLOCATION_ROUTINES* AllocationRoutines, DECOMPRESSOR_HANDLE* DecompressorHandle);
BOOL SetDecompressorInformation(DECOMPRESSOR_HANDLE DecompressorHandle, COMPRESS_INFORMATION_CLASS CompressInformationClass, const(void)* CompressInformation, ulong CompressInformationSize);
BOOL QueryDecompressorInformation(DECOMPRESSOR_HANDLE DecompressorHandle, COMPRESS_INFORMATION_CLASS CompressInformationClass, void* CompressInformation, ulong CompressInformationSize);
BOOL Decompress(DECOMPRESSOR_HANDLE DecompressorHandle, const(void)* CompressedData, ulong CompressedDataSize, void* UncompressedBuffer, ulong UncompressedBufferSize, ulong* UncompressedDataSize);
BOOL ResetDecompressor(DECOMPRESSOR_HANDLE DecompressorHandle);
BOOL CloseDecompressor(DECOMPRESSOR_HANDLE DecompressorHandle);
enum COMPRESS_ALGORITHM_INVALID = 0x00000000;
enum COMPRESS_ALGORITHM_NULL = 0x00000001;
enum COMPRESS_ALGORITHM_MAX = 0x00000006;
enum COMPRESS_RAW = 0x20000000;
alias COMPRESSOR_HANDLE = void*;
alias DECOMPRESSOR_HANDLE = void*;
alias PFN_COMPRESS_ALLOCATE = void* function(void* UserContext, ulong Size);
alias PFN_COMPRESS_FREE = void function(void* UserContext, void* Memory);
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

