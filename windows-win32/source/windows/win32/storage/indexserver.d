module windows.win32.storage.indexserver;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.com_ : IStream, IUnknown;
import windows.win32.system.com.structuredstorage : IStorage, PROPSPEC, PROPVARIANT;

version (Windows):
extern (Windows):

HRESULT LoadIFilter(const(wchar)*, IUnknown, void**);
HRESULT LoadIFilterEx(const(wchar)*, uint, const(GUID)*, void**);
HRESULT BindIFilterFromStorage(IStorage, IUnknown, void**);
HRESULT BindIFilterFromStream(IStream, IUnknown, void**);
enum CI_VERSION_WDS30 = 0x00000102;
enum CI_VERSION_WDS40 = 0x00000109;
enum CI_VERSION_WIN70 = 0x00000700;
enum CINULLCATALOG = "::_noindex_::";
enum CIADMIN = "::_nodocstore_::";
enum LIFF_LOAD_DEFINED_FILTER = 0x00000001;
enum LIFF_IMPLEMENT_TEXT_FILTER_FALLBACK_POLICY = 0x00000002;
enum LIFF_FORCE_TEXT_FILTER_FALLBACK = 0x00000003;
enum PID_FILENAME = 0x00000064;
enum DBPROP_CI_CATALOG_NAME = 0x00000002;
enum DBPROP_CI_INCLUDE_SCOPES = 0x00000003;
enum DBPROP_CI_DEPTHS = 0x00000004;
enum DBPROP_CI_SCOPE_FLAGS = 0x00000004;
enum DBPROP_CI_EXCLUDE_SCOPES = 0x00000005;
enum DBPROP_CI_SECURITY_ID = 0x00000006;
enum DBPROP_CI_QUERY_TYPE = 0x00000007;
enum DBPROP_CI_PROVIDER = 0x00000008;
enum CI_PROVIDER_MSSEARCH = 0x00000001;
enum CI_PROVIDER_INDEXING_SERVICE = 0x00000002;
enum CI_PROVIDER_ALL = 0xffffffff;
enum DBPROP_DEFAULT_EQUALS_BEHAVIOR = 0x00000002;
enum DBPROP_USECONTENTINDEX = 0x00000002;
enum DBPROP_DEFERNONINDEXEDTRIMMING = 0x00000003;
enum DBPROP_USEEXTENDEDDBTYPES = 0x00000004;
enum DBPROP_IGNORENOISEONLYCLAUSES = 0x00000005;
enum DBPROP_GENERICOPTIONS_STRING = 0x00000006;
enum DBPROP_FIRSTROWS = 0x00000007;
enum DBPROP_DEFERCATALOGVERIFICATION = 0x00000008;
enum DBPROP_CATALOGLISTID = 0x00000009;
enum DBPROP_GENERATEPARSETREE = 0x0000000a;
enum DBPROP_APPLICATION_NAME = 0x0000000b;
enum DBPROP_FREETEXTANYTERM = 0x0000000c;
enum DBPROP_FREETEXTUSESTEMMING = 0x0000000d;
enum DBPROP_IGNORESBRI = 0x0000000e;
enum DBPROP_DONOTCOMPUTEEXPENSIVEPROPS = 0x0000000f;
enum DBPROP_ENABLEROWSETEVENTS = 0x00000010;
enum DBPROP_MACHINE = 0x00000002;
enum DBPROP_CLIENT_CLSID = 0x00000003;
enum MSIDXSPROP_ROWSETQUERYSTATUS = 0x00000002;
enum MSIDXSPROP_COMMAND_LOCALE_STRING = 0x00000003;
enum MSIDXSPROP_QUERY_RESTRICTION = 0x00000004;
enum MSIDXSPROP_PARSE_TREE = 0x00000005;
enum MSIDXSPROP_MAX_RANK = 0x00000006;
enum MSIDXSPROP_RESULTS_FOUND = 0x00000007;
enum MSIDXSPROP_WHEREID = 0x00000008;
enum MSIDXSPROP_SERVER_VERSION = 0x00000009;
enum MSIDXSPROP_SERVER_WINVER_MAJOR = 0x0000000a;
enum MSIDXSPROP_SERVER_WINVER_MINOR = 0x0000000b;
enum MSIDXSPROP_SERVER_NLSVERSION = 0x0000000c;
enum MSIDXSPROP_SERVER_NLSVER_DEFINED = 0x0000000d;
enum MSIDXSPROP_SAME_SORTORDER_USED = 0x0000000e;
enum STAT_BUSY = 0x00000000;
enum STAT_ERROR = 0x00000001;
enum STAT_DONE = 0x00000002;
enum STAT_REFRESH = 0x00000003;
enum STAT_PARTIAL_SCOPE = 0x00000008;
enum STAT_NOISE_WORDS = 0x00000010;
enum STAT_CONTENT_OUT_OF_DATE = 0x00000020;
enum STAT_REFRESH_INCOMPLETE = 0x00000040;
enum STAT_CONTENT_QUERY_INCOMPLETE = 0x00000080;
enum STAT_TIME_LIMIT_EXCEEDED = 0x00000100;
enum STAT_SHARING_VIOLATION = 0x00000200;
enum STAT_MISSING_RELDOC = 0x00000400;
enum STAT_MISSING_PROP_IN_RELDOC = 0x00000800;
enum STAT_RELDOC_ACCESS_DENIED = 0x00001000;
enum STAT_COALESCE_COMP_ALL_NOISE = 0x00002000;
enum QUERY_SHALLOW = 0x00000000;
enum QUERY_DEEP = 0x00000001;
enum QUERY_PHYSICAL_PATH = 0x00000000;
enum QUERY_VIRTUAL_PATH = 0x00000002;
enum PROPID_QUERY_WORKID = 0x00000005;
enum PROPID_QUERY_UNFILTERED = 0x00000007;
enum PROPID_QUERY_VIRTUALPATH = 0x00000009;
enum PROPID_QUERY_LASTSEENTIME = 0x0000000a;
enum CICAT_STOPPED = 0x00000001;
enum CICAT_READONLY = 0x00000002;
enum CICAT_WRITABLE = 0x00000004;
enum CICAT_NO_QUERY = 0x00000008;
enum CICAT_GET_STATE = 0x00000010;
enum CICAT_ALL_OPENED = 0x00000020;
enum CI_STATE_SHADOW_MERGE = 0x00000001;
enum CI_STATE_MASTER_MERGE = 0x00000002;
enum CI_STATE_CONTENT_SCAN_REQUIRED = 0x00000004;
enum CI_STATE_ANNEALING_MERGE = 0x00000008;
enum CI_STATE_SCANNING = 0x00000010;
enum CI_STATE_RECOVERING = 0x00000020;
enum CI_STATE_INDEX_MIGRATION_MERGE = 0x00000040;
enum CI_STATE_LOW_MEMORY = 0x00000080;
enum CI_STATE_HIGH_IO = 0x00000100;
enum CI_STATE_MASTER_MERGE_PAUSED = 0x00000200;
enum CI_STATE_READ_ONLY = 0x00000400;
enum CI_STATE_BATTERY_POWER = 0x00000800;
enum CI_STATE_USER_ACTIVE = 0x00001000;
enum CI_STATE_STARTING = 0x00002000;
enum CI_STATE_READING_USNS = 0x00004000;
enum CI_STATE_DELETION_MERGE = 0x00008000;
enum CI_STATE_LOW_DISK = 0x00010000;
enum CI_STATE_HIGH_CPU = 0x00020000;
enum CI_STATE_BATTERY_POLICY = 0x00040000;
enum GENERATE_METHOD_EXACT = 0x00000000;
enum GENERATE_METHOD_PREFIX = 0x00000001;
enum GENERATE_METHOD_INFLECT = 0x00000002;
enum SCOPE_FLAG_MASK = 0x000000ff;
enum SCOPE_FLAG_INCLUDE = 0x00000001;
enum SCOPE_FLAG_DEEP = 0x00000002;
enum SCOPE_TYPE_MASK = 0xffffff00;
enum SCOPE_TYPE_WINPATH = 0x00000100;
enum SCOPE_TYPE_VPATH = 0x00000200;
enum PROPID_QUERY_RANKVECTOR = 0x00000002;
enum PROPID_QUERY_RANK = 0x00000003;
enum PROPID_QUERY_HITCOUNT = 0x00000004;
enum PROPID_QUERY_ALL = 0x00000006;
enum PROPID_STG_CONTENTS = 0x00000013;
enum VECTOR_RANK_MIN = 0x00000000;
enum VECTOR_RANK_MAX = 0x00000001;
enum VECTOR_RANK_INNER = 0x00000002;
enum VECTOR_RANK_DICE = 0x00000003;
enum VECTOR_RANK_JACCARD = 0x00000004;
enum DBSETFUNC_NONE = 0x00000000;
enum DBSETFUNC_ALL = 0x00000001;
enum DBSETFUNC_DISTINCT = 0x00000002;
enum PROXIMITY_UNIT_WORD = 0x00000000;
enum PROXIMITY_UNIT_SENTENCE = 0x00000001;
enum PROXIMITY_UNIT_PARAGRAPH = 0x00000002;
enum PROXIMITY_UNIT_CHAPTER = 0x00000003;
enum NOT_AN_ERROR = 0x00080000;
enum FILTER_E_END_OF_CHUNKS = 0xffffffff80041700;
enum FILTER_E_NO_MORE_TEXT = 0xffffffff80041701;
enum FILTER_E_NO_MORE_VALUES = 0xffffffff80041702;
enum FILTER_E_ACCESS = 0xffffffff80041703;
enum FILTER_W_MONIKER_CLIPPED = 0x00041704;
enum FILTER_E_NO_TEXT = 0xffffffff80041705;
enum FILTER_E_NO_VALUES = 0xffffffff80041706;
enum FILTER_E_EMBEDDING_UNAVAILABLE = 0xffffffff80041707;
enum FILTER_E_LINK_UNAVAILABLE = 0xffffffff80041708;
enum FILTER_S_LAST_TEXT = 0x00041709;
enum FILTER_S_LAST_VALUES = 0x0004170a;
enum FILTER_E_PASSWORD = 0xffffffff8004170b;
enum FILTER_E_UNKNOWNFORMAT = 0xffffffff8004170c;
struct CI_STATE
{
    uint cbStruct;
    uint cWordList;
    uint cPersistentIndex;
    uint cQueries;
    uint cDocuments;
    uint cFreshTest;
    uint dwMergeProgress;
    uint eState;
    uint cFilteredDocuments;
    uint cTotalDocuments;
    uint cPendingScans;
    uint dwIndexSize;
    uint cUniqueKeys;
    uint cSecQDocuments;
    uint dwPropCacheSize;
}
struct FULLPROPSPEC
{
    GUID guidPropSet;
    PROPSPEC psProperty;
}
alias IFILTER_INIT = int;
enum : int
{
    IFILTER_INIT_CANON_PARAGRAPHS        = 0x00000001,
    IFILTER_INIT_HARD_LINE_BREAKS        = 0x00000002,
    IFILTER_INIT_CANON_HYPHENS           = 0x00000004,
    IFILTER_INIT_CANON_SPACES            = 0x00000008,
    IFILTER_INIT_APPLY_INDEX_ATTRIBUTES  = 0x00000010,
    IFILTER_INIT_APPLY_OTHER_ATTRIBUTES  = 0x00000020,
    IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES  = 0x00000100,
    IFILTER_INIT_INDEXING_ONLY           = 0x00000040,
    IFILTER_INIT_SEARCH_LINKS            = 0x00000080,
    IFILTER_INIT_FILTER_OWNED_VALUE_OK   = 0x00000200,
    IFILTER_INIT_FILTER_AGGRESSIVE_BREAK = 0x00000400,
    IFILTER_INIT_DISABLE_EMBEDDED        = 0x00000800,
    IFILTER_INIT_EMIT_FORMATTING         = 0x00001000,
}

alias IFILTER_FLAGS = int;
enum : int
{
    IFILTER_FLAGS_OLE_PROPERTIES = 0x00000001,
}

alias CHUNKSTATE = int;
enum : int
{
    CHUNK_TEXT               = 0x00000001,
    CHUNK_VALUE              = 0x00000002,
    CHUNK_FILTER_OWNED_VALUE = 0x00000004,
}

alias CHUNK_BREAKTYPE = int;
enum : int
{
    CHUNK_NO_BREAK = 0x00000000,
    CHUNK_EOW      = 0x00000001,
    CHUNK_EOS      = 0x00000002,
    CHUNK_EOP      = 0x00000003,
    CHUNK_EOC      = 0x00000004,
}

struct FILTERREGION
{
    uint idChunk;
    uint cwcStart;
    uint cwcExtent;
}
struct STAT_CHUNK
{
    uint idChunk;
    CHUNK_BREAKTYPE breakType;
    CHUNKSTATE flags;
    uint locale;
    FULLPROPSPEC attribute;
    uint idChunkSource;
    uint cwcStartSource;
    uint cwcLenSource;
}
enum IID_IFilter = GUID(0x89bcb740, 0x6119, 0x101a, [0xbc, 0xb7, 0x0, 0xdd, 0x1, 0x6, 0x55, 0xaf]);
interface IFilter : IUnknown
{
    int Init(uint, uint, const(FULLPROPSPEC)*, uint*);
    int GetChunk(STAT_CHUNK*);
    int GetText(uint*, PWSTR);
    int GetValue(PROPVARIANT**);
    int BindRegion(FILTERREGION, const(GUID)*, void**);
}
enum IID_IPhraseSink = GUID(0xcc906ff0, 0xc058, 0x101a, [0xb5, 0x54, 0x8, 0x0, 0x2b, 0x33, 0xb0, 0xe6]);
interface IPhraseSink : IUnknown
{
    HRESULT PutSmallPhrase(const(wchar)*, uint, const(wchar)*, uint, uint);
    HRESULT PutPhrase(const(wchar)*, uint);
}
alias WORDREP_BREAK_TYPE = int;
enum : int
{
    WORDREP_BREAK_EOW = 0x00000000,
    WORDREP_BREAK_EOS = 0x00000001,
    WORDREP_BREAK_EOP = 0x00000002,
    WORDREP_BREAK_EOC = 0x00000003,
}

alias DBKINDENUM = int;
enum : int
{
    DBKIND_GUID_NAME    = 0x00000000,
    DBKIND_GUID_PROPID  = 0x00000001,
    DBKIND_NAME         = 0x00000002,
    DBKIND_PGUID_NAME   = 0x00000003,
    DBKIND_PGUID_PROPID = 0x00000004,
    DBKIND_PROPID       = 0x00000005,
    DBKIND_GUID         = 0x00000006,
}

struct DBID
{
    union _uGuid_e__Union
    {
        GUID guid;
        GUID* pguid;
    }
    uint eKind;
    union _uName_e__Union
    {
        PWSTR pwszName;
        uint ulPropid;
    }
}
/+ [CONFLICTED] struct DBID
{
    align (2):
    union _uGuid_e__Union
    {
        align (2):
        GUID guid;
        GUID* pguid;
    }
    uint eKind;
    union _uName_e__Union
    {
        align (2):
        PWSTR pwszName;
        uint ulPropid;
    }
}
+/