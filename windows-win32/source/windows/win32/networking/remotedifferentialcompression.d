module windows.win32.networking.remotedifferentialcompression;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

enum RDCE_TABLE_FULL = 0x80040001;
enum RDCE_TABLE_CORRUPT = 0x80040002;
enum MSRDC_SIGNATURE_HASHSIZE = 0x00000010;
enum SimilarityFileIdMinSize = 0x00000004;
enum SimilarityFileIdMaxSize = 0x00000020;
enum MSRDC_VERSION = 0x00010000;
enum MSRDC_MINIMUM_COMPATIBLE_APP_VERSION = 0x00010000;
enum MSRDC_MINIMUM_DEPTH = 0x00000001;
enum MSRDC_MAXIMUM_DEPTH = 0x00000008;
enum MSRDC_MINIMUM_COMPAREBUFFER = 0x000186a0;
enum MSRDC_MAXIMUM_COMPAREBUFFER = 0x40000000;
enum MSRDC_DEFAULT_COMPAREBUFFER = 0x0030d400;
enum MSRDC_MINIMUM_INPUTBUFFERSIZE = 0x00000400;
enum MSRDC_MINIMUM_HORIZONSIZE = 0x00000080;
enum MSRDC_MAXIMUM_HORIZONSIZE = 0x00004000;
enum MSRDC_MINIMUM_HASHWINDOWSIZE = 0x00000002;
enum MSRDC_MAXIMUM_HASHWINDOWSIZE = 0x00000060;
enum MSRDC_DEFAULT_HASHWINDOWSIZE_1 = 0x00000030;
enum MSRDC_DEFAULT_HORIZONSIZE_1 = 0x00000400;
enum MSRDC_DEFAULT_HASHWINDOWSIZE_N = 0x00000002;
enum MSRDC_DEFAULT_HORIZONSIZE_N = 0x00000080;
enum MSRDC_MAXIMUM_TRAITVALUE = 0x0000003f;
enum MSRDC_MINIMUM_MATCHESREQUIRED = 0x00000001;
enum MSRDC_MAXIMUM_MATCHESREQUIRED = 0x00000010;
alias RDC_ErrorCode = int;
enum : int
{
    RDC_NoError                = 0x00000000,
    RDC_HeaderVersionNewer     = 0x00000001,
    RDC_HeaderVersionOlder     = 0x00000002,
    RDC_HeaderMissingOrCorrupt = 0x00000003,
    RDC_HeaderWrongType        = 0x00000004,
    RDC_DataMissingOrCorrupt   = 0x00000005,
    RDC_DataTooManyRecords     = 0x00000006,
    RDC_FileChecksumMismatch   = 0x00000007,
    RDC_ApplicationError       = 0x00000008,
    RDC_Aborted                = 0x00000009,
    RDC_Win32Error             = 0x0000000a,
}

alias GeneratorParametersType = int;
enum : int
{
    RDCGENTYPE_Unused    = 0x00000000,
    RDCGENTYPE_FilterMax = 0x00000001,
}

alias RdcNeedType = int;
enum : int
{
    RDCNEED_SOURCE   = 0x00000000,
    RDCNEED_TARGET   = 0x00000001,
    RDCNEED_SEED     = 0x00000002,
    RDCNEED_SEED_MAX = 0x000000ff,
}

struct RdcNeed
{
    RdcNeedType m_BlockType;
    ulong m_FileOffset;
    ulong m_BlockLength;
}
struct RdcBufferPointer
{
    uint m_Size;
    uint m_Used;
    ubyte* m_Data;
}
struct RdcNeedPointer
{
    uint m_Size;
    uint m_Used;
    RdcNeed* m_Data;
}
struct RdcSignature
{
    ubyte[16] m_Signature;
    ushort m_BlockLength;
}
struct RdcSignaturePointer
{
    uint m_Size;
    uint m_Used;
    RdcSignature* m_Data;
}
alias RdcCreatedTables = int;
enum : int
{
    RDCTABLE_InvalidOrUnknown = 0x00000000,
    RDCTABLE_Existing         = 0x00000001,
    RDCTABLE_New              = 0x00000002,
}

alias RdcMappingAccessMode = int;
enum : int
{
    RDCMAPPING_Undefined = 0x00000000,
    RDCMAPPING_ReadOnly  = 0x00000001,
    RDCMAPPING_ReadWrite = 0x00000002,
}

struct SimilarityMappedViewInfo
{
    ubyte* m_Data;
    uint m_Length;
}
struct SimilarityData
{
    ubyte[16] m_Data;
}
struct FindSimilarFileIndexResults
{
    uint m_FileIndex;
    uint m_MatchCount;
}
struct SimilarityDumpData
{
    uint m_FileIndex;
    SimilarityData m_Data;
}
struct SimilarityFileId
{
    ubyte[32] m_FileId;
}
enum IID_IRdcGeneratorParameters = GUID(0x96236a71, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcGeneratorParameters : IUnknown
{
    HRESULT GetGeneratorParametersType(GeneratorParametersType* parametersType);
    HRESULT GetParametersVersion(uint* currentVersion, uint* minimumCompatibleAppVersion);
    HRESULT GetSerializeSize(uint* size);
    HRESULT Serialize(uint size, ubyte* parametersBlob, uint* bytesWritten);
}
enum IID_IRdcGeneratorFilterMaxParameters = GUID(0x96236a72, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcGeneratorFilterMaxParameters : IUnknown
{
    HRESULT GetHorizonSize(uint* horizonSize);
    HRESULT SetHorizonSize(uint horizonSize);
    HRESULT GetHashWindowSize(uint* hashWindowSize);
    HRESULT SetHashWindowSize(uint hashWindowSize);
}
enum IID_IRdcGenerator = GUID(0x96236a73, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcGenerator : IUnknown
{
    HRESULT GetGeneratorParameters(uint level, IRdcGeneratorParameters* iGeneratorParameters);
    HRESULT Process(BOOL endOfInput, BOOL* endOfOutput, RdcBufferPointer* inputBuffer, uint depth, RdcBufferPointer** outputBuffers, RDC_ErrorCode* rdc_ErrorCode);
}
enum IID_IRdcFileReader = GUID(0x96236a74, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcFileReader : IUnknown
{
    HRESULT GetFileSize(ulong* fileSize);
    HRESULT Read(ulong offsetFileStart, uint bytesToRead, uint* bytesActuallyRead, ubyte* buffer, BOOL* eof);
    HRESULT GetFilePosition(ulong* offsetFromStart);
}
enum IID_IRdcFileWriter = GUID(0x96236a75, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcFileWriter : IRdcFileReader
{
    HRESULT Write(ulong offsetFileStart, uint bytesToWrite, ubyte* buffer);
    HRESULT Truncate();
    HRESULT DeleteOnClose();
}
enum IID_IRdcSignatureReader = GUID(0x96236a76, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcSignatureReader : IUnknown
{
    HRESULT ReadHeader(RDC_ErrorCode* rdc_ErrorCode);
    HRESULT ReadSignatures(RdcSignaturePointer* rdcSignaturePointer, BOOL* endOfOutput);
}
enum IID_IRdcComparator = GUID(0x96236a77, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcComparator : IUnknown
{
    HRESULT Process(BOOL endOfInput, BOOL* endOfOutput, RdcBufferPointer* inputBuffer, RdcNeedPointer* outputBuffer, RDC_ErrorCode* rdc_ErrorCode);
}
enum IID_IRdcLibrary = GUID(0x96236a78, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcLibrary : IUnknown
{
    HRESULT ComputeDefaultRecursionDepth(ulong fileSize, uint* depth);
    HRESULT CreateGeneratorParameters(GeneratorParametersType parametersType, uint level, IRdcGeneratorParameters* iGeneratorParameters);
    HRESULT OpenGeneratorParameters(uint size, const(ubyte)* parametersBlob, IRdcGeneratorParameters* iGeneratorParameters);
    HRESULT CreateGenerator(uint depth, IRdcGeneratorParameters* iGeneratorParametersArray, IRdcGenerator* iGenerator);
    HRESULT CreateComparator(IRdcFileReader iSeedSignaturesFile, uint comparatorBufferSize, IRdcComparator* iComparator);
    HRESULT CreateSignatureReader(IRdcFileReader iFileReader, IRdcSignatureReader* iSignatureReader);
    HRESULT GetRDCVersion(uint* currentVersion, uint* minimumCompatibleAppVersion);
}
enum IID_ISimilarityReportProgress = GUID(0x96236a7a, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarityReportProgress : IUnknown
{
    HRESULT ReportProgress(uint percentCompleted);
}
enum IID_ISimilarityTableDumpState = GUID(0x96236a7b, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarityTableDumpState : IUnknown
{
    HRESULT GetNextData(uint resultsSize, uint* resultsUsed, BOOL* eof, SimilarityDumpData* results);
}
enum IID_ISimilarityTraitsMappedView = GUID(0x96236a7c, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarityTraitsMappedView : IUnknown
{
    HRESULT Flush();
    HRESULT Unmap();
    HRESULT Get(ulong index, BOOL dirty, uint numElements, SimilarityMappedViewInfo* viewInfo);
    void GetView(const(ubyte)** mappedPageBegin, const(ubyte)** mappedPageEnd);
}
enum IID_ISimilarityTraitsMapping = GUID(0x96236a7d, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarityTraitsMapping : IUnknown
{
    void CloseMapping();
    HRESULT SetFileSize(ulong fileSize);
    HRESULT GetFileSize(ulong* fileSize);
    HRESULT OpenMapping(RdcMappingAccessMode accessMode, ulong begin, ulong end, ulong* actualEnd);
    HRESULT ResizeMapping(RdcMappingAccessMode accessMode, ulong begin, ulong end, ulong* actualEnd);
    void GetPageSize(uint* pageSize);
    HRESULT CreateView(uint minimumMappedPages, RdcMappingAccessMode accessMode, ISimilarityTraitsMappedView* mappedView);
}
enum IID_ISimilarityTraitsTable = GUID(0x96236a7e, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarityTraitsTable : IUnknown
{
    HRESULT CreateTable(PWSTR path, BOOL truncate, ubyte* securityDescriptor, RdcCreatedTables* isNew);
    HRESULT CreateTableIndirect(ISimilarityTraitsMapping mapping, BOOL truncate, RdcCreatedTables* isNew);
    HRESULT CloseTable(BOOL isValid);
    HRESULT Append(SimilarityData* data, uint fileIndex);
    HRESULT FindSimilarFileIndex(SimilarityData* similarityData, ushort numberOfMatchesRequired, FindSimilarFileIndexResults* findSimilarFileIndexResults, uint resultsSize, uint* resultsUsed);
    HRESULT BeginDump(ISimilarityTableDumpState* similarityTableDumpState);
    HRESULT GetLastIndex(uint* fileIndex);
}
enum IID_ISimilarityFileIdTable = GUID(0x96236a7f, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarityFileIdTable : IUnknown
{
    HRESULT CreateTable(PWSTR path, BOOL truncate, ubyte* securityDescriptor, uint recordSize, RdcCreatedTables* isNew);
    HRESULT CreateTableIndirect(IRdcFileWriter fileIdFile, BOOL truncate, uint recordSize, RdcCreatedTables* isNew);
    HRESULT CloseTable(BOOL isValid);
    HRESULT Append(SimilarityFileId* similarityFileId, uint* similarityFileIndex);
    HRESULT Lookup(uint similarityFileIndex, SimilarityFileId* similarityFileId);
    HRESULT Invalidate(uint similarityFileIndex);
    HRESULT GetRecordCount(uint* recordCount);
}
enum IID_IRdcSimilarityGenerator = GUID(0x96236a80, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IRdcSimilarityGenerator : IUnknown
{
    HRESULT EnableSimilarity();
    HRESULT Results(SimilarityData* similarityData);
}
enum IID_IFindSimilarResults = GUID(0x96236a81, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface IFindSimilarResults : IUnknown
{
    HRESULT GetSize(uint* size);
    HRESULT GetNextFileId(uint* numTraitsMatched, SimilarityFileId* similarityFileId);
}
enum IID_ISimilarity = GUID(0x96236a83, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
interface ISimilarity : IUnknown
{
    HRESULT CreateTable(PWSTR path, BOOL truncate, ubyte* securityDescriptor, uint recordSize, RdcCreatedTables* isNew);
    HRESULT CreateTableIndirect(ISimilarityTraitsMapping mapping, IRdcFileWriter fileIdFile, BOOL truncate, uint recordSize, RdcCreatedTables* isNew);
    HRESULT CloseTable(BOOL isValid);
    HRESULT Append(SimilarityFileId* similarityFileId, SimilarityData* similarityData);
    HRESULT FindSimilarFileId(SimilarityData* similarityData, ushort numberOfMatchesRequired, uint resultsSize, IFindSimilarResults* findSimilarResults);
    HRESULT CopyAndSwap(ISimilarity newSimilarityTables, ISimilarityReportProgress reportProgress);
    HRESULT GetRecordCount(uint* recordCount);
}
enum CLSID_RdcLibrary = GUID(0x96236a85, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcLibrary
{
}
enum CLSID_RdcGeneratorParameters = GUID(0x96236a86, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcGeneratorParameters
{
}
enum CLSID_RdcGeneratorFilterMaxParameters = GUID(0x96236a87, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcGeneratorFilterMaxParameters
{
}
enum CLSID_RdcGenerator = GUID(0x96236a88, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcGenerator
{
}
enum CLSID_RdcFileReader = GUID(0x96236a89, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcFileReader
{
}
enum CLSID_RdcSignatureReader = GUID(0x96236a8a, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcSignatureReader
{
}
enum CLSID_RdcComparator = GUID(0x96236a8b, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcComparator
{
}
enum CLSID_SimilarityReportProgress = GUID(0x96236a8d, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct SimilarityReportProgress
{
}
enum CLSID_SimilarityTableDumpState = GUID(0x96236a8e, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct SimilarityTableDumpState
{
}
enum CLSID_SimilarityTraitsTable = GUID(0x96236a8f, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct SimilarityTraitsTable
{
}
enum CLSID_SimilarityFileIdTable = GUID(0x96236a90, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct SimilarityFileIdTable
{
}
enum CLSID_Similarity = GUID(0x96236a91, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct Similarity
{
}
enum CLSID_RdcSimilarityGenerator = GUID(0x96236a92, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct RdcSimilarityGenerator
{
}
enum CLSID_FindSimilarResults = GUID(0x96236a93, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct FindSimilarResults
{
}
enum CLSID_SimilarityTraitsMapping = GUID(0x96236a94, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct SimilarityTraitsMapping
{
}
enum CLSID_SimilarityTraitsMappedView = GUID(0x96236a95, 0x9dbc, 0x11da, [0x9e, 0x3f, 0x0, 0x11, 0x11, 0x4a, 0xe3, 0x11]);
struct SimilarityTraitsMappedView
{
}
