module windows.win32.storage.datadeduplication;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT;
import windows.win32.system.com : IStream, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum DEDUP_CHUNKLIB_MAX_CHUNKS_ENUM = 0x00000400;
struct DEDUP_CONTAINER_EXTENT
{
    uint ContainerIndex;
    long StartOffset;
    long Length;
}
struct DDP_FILE_EXTENT
{
    long Length;
    long Offset;
}
alias DEDUP_BACKUP_SUPPORT_PARAM_TYPE = int;
enum : int
{
    DEDUP_RECONSTRUCT_UNOPTIMIZED = 0x00000001,
    DEDUP_RECONSTRUCT_OPTIMIZED   = 0x00000002,
}

enum IID_IDedupReadFileCallback = GUID(0x7bacc67a, 0x2f1d, 0x42d0, [0x89, 0x7e, 0x6f, 0xf6, 0x2d, 0xd5, 0x33, 0xbb]);
interface IDedupReadFileCallback : IUnknown
{
    HRESULT ReadBackupFile(BSTR, long, uint, ubyte*, uint*, uint);
    HRESULT OrderContainersRestore(uint, BSTR*, uint*, DEDUP_CONTAINER_EXTENT**);
    HRESULT PreviewContainerRead(BSTR, uint, DDP_FILE_EXTENT*);
}
enum IID_IDedupBackupSupport = GUID(0xc719d963, 0x2b2d, 0x415e, [0xac, 0xf7, 0x7e, 0xb7, 0xca, 0x59, 0x6f, 0xf4]);
interface IDedupBackupSupport : IUnknown
{
    HRESULT RestoreFiles(uint, BSTR*, IDedupReadFileCallback, uint, HRESULT*);
}
enum CLSID_DedupBackupSupport = GUID(0x73d6b2ad, 0x2984, 0x4715, [0xb2, 0xe3, 0x92, 0x4c, 0x14, 0x97, 0x44, 0xdd]);
struct DedupBackupSupport
{
}
alias DEDUP_SET_PARAM_TYPE = int;
enum : int
{
    DEDUP_PT_MinChunkSizeBytes            = 0x00000001,
    DEDUP_PT_MaxChunkSizeBytes            = 0x00000002,
    DEDUP_PT_AvgChunkSizeBytes            = 0x00000003,
    DEDUP_PT_InvariantChunking            = 0x00000004,
    DEDUP_PT_DisableStrongHashComputation = 0x00000005,
}

struct DEDUP_CHUNK_INFO_HASH32
{
    uint ChunkFlags;
    ulong ChunkOffsetInStream;
    ulong ChunkSize;
    ubyte[32] HashVal;
}
enum IID_IDedupChunkLibrary = GUID(0xbb5144d7, 0x2720, 0x4dcc, [0x87, 0x77, 0x78, 0x59, 0x74, 0x16, 0xec, 0x23]);
interface IDedupChunkLibrary : IUnknown
{
    HRESULT InitializeForPushBuffers();
    HRESULT Uninitialize();
    HRESULT SetParameter(uint, VARIANT);
    HRESULT StartChunking(GUID, IUnknown*);
}
enum IID_IDedupIterateChunksHash32 = GUID(0x90b584d3, 0x72aa, 0x400f, [0x97, 0x67, 0xca, 0xd8, 0x66, 0xa5, 0xa2, 0xd8]);
interface IDedupIterateChunksHash32 : IUnknown
{
    HRESULT PushBuffer(ubyte*, uint);
    HRESULT Next(uint, DEDUP_CHUNK_INFO_HASH32*, uint*);
    HRESULT Drain();
    HRESULT Reset();
}
alias DedupDataPortManagerOption = int;
enum : int
{
    DedupDataPortManagerOption_None               = 0x00000000,
    DedupDataPortManagerOption_AutoStart          = 0x00000001,
    DedupDataPortManagerOption_SkipReconciliation = 0x00000002,
}

alias DedupDataPortVolumeStatus = int;
enum : int
{
    DedupDataPortVolumeStatus_Unknown      = 0x00000000,
    DedupDataPortVolumeStatus_NotEnabled   = 0x00000001,
    DedupDataPortVolumeStatus_NotAvailable = 0x00000002,
    DedupDataPortVolumeStatus_Initializing = 0x00000003,
    DedupDataPortVolumeStatus_Ready        = 0x00000004,
    DedupDataPortVolumeStatus_Maintenance  = 0x00000005,
    DedupDataPortVolumeStatus_Shutdown     = 0x00000006,
}

alias DedupDataPortRequestStatus = int;
enum : int
{
    DedupDataPortRequestStatus_Unknown    = 0x00000000,
    DedupDataPortRequestStatus_Queued     = 0x00000001,
    DedupDataPortRequestStatus_Processing = 0x00000002,
    DedupDataPortRequestStatus_Partial    = 0x00000003,
    DedupDataPortRequestStatus_Complete   = 0x00000004,
    DedupDataPortRequestStatus_Failed     = 0x00000005,
}

alias DedupChunkFlags = int;
enum : int
{
    DedupChunkFlags_None       = 0x00000000,
    DedupChunkFlags_Compressed = 0x00000001,
}

struct DedupHash
{
    ubyte[32] Hash;
}
struct DedupChunk
{
    DedupHash Hash;
    DedupChunkFlags Flags;
    uint LogicalSize;
    uint DataSize;
}
struct DedupStreamEntry
{
    DedupHash Hash;
    uint LogicalSize;
    ulong Offset;
}
struct DedupStream
{
    BSTR Path;
    ulong Offset;
    ulong Length;
    uint ChunkCount;
}
alias DedupChunkingAlgorithm = int;
enum : int
{
    DedupChunkingAlgorithm_Unknonwn = 0x00000000,
    DedupChunkingAlgorithm_V1       = 0x00000001,
}

alias DedupHashingAlgorithm = int;
enum : int
{
    DedupHashingAlgorithm_Unknonwn = 0x00000000,
    DedupHashingAlgorithm_V1       = 0x00000001,
}

alias DedupCompressionAlgorithm = int;
enum : int
{
    DedupCompressionAlgorithm_Unknonwn = 0x00000000,
    DedupCompressionAlgorithm_Xpress   = 0x00000001,
}

enum IID_IDedupDataPort = GUID(0x7963d734, 0x40a9, 0x4ea3, [0xbb, 0xf6, 0x5a, 0x89, 0xd2, 0x6f, 0x7a, 0xe8]);
interface IDedupDataPort : IUnknown
{
    HRESULT GetStatus(DedupDataPortVolumeStatus*, uint*);
    HRESULT LookupChunks(uint, DedupHash*, GUID*);
    HRESULT InsertChunks(uint, DedupChunk*, uint, ubyte*, GUID*);
    HRESULT InsertChunksWithStream(uint, DedupChunk*, uint, IStream, GUID*);
    HRESULT CommitStreams(uint, DedupStream*, uint, DedupStreamEntry*, GUID*);
    HRESULT CommitStreamsWithStream(uint, DedupStream*, uint, IStream, GUID*);
    HRESULT GetStreams(uint, BSTR*, GUID*);
    HRESULT GetStreamsResults(GUID, uint, uint, uint*, DedupStream**, uint*, DedupStreamEntry**, DedupDataPortRequestStatus*, HRESULT**);
    HRESULT GetChunks(uint, DedupHash*, GUID*);
    HRESULT GetChunksResults(GUID, uint, uint, uint*, DedupChunk**, uint*, ubyte**, DedupDataPortRequestStatus*, HRESULT**);
    HRESULT GetRequestStatus(GUID, DedupDataPortRequestStatus*);
    HRESULT GetRequestResults(GUID, uint, HRESULT*, uint*, DedupDataPortRequestStatus*, HRESULT**);
}
enum IID_IDedupDataPortManager = GUID(0x44677452, 0xb90a, 0x445e, [0x81, 0x92, 0xcd, 0xcf, 0xe8, 0x15, 0x11, 0xfb]);
interface IDedupDataPortManager : IUnknown
{
    HRESULT GetConfiguration(uint*, uint*, DedupChunkingAlgorithm*, DedupHashingAlgorithm*, DedupCompressionAlgorithm*);
    HRESULT GetVolumeStatus(uint, BSTR, DedupDataPortVolumeStatus*);
    HRESULT GetVolumeDataPort(uint, BSTR, IDedupDataPort*);
}
enum CLSID_DedupDataPort = GUID(0x8f107207, 0x1829, 0x48b2, [0xa6, 0x4b, 0xe6, 0x1f, 0x8e, 0xd, 0x9a, 0xcb]);
struct DedupDataPort
{
}
