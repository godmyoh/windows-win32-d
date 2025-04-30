module windows.win32.system.distributedtransactioncoordinator;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, CHAR, FILETIME, HANDLE, HRESULT, PSTR, PWSTR;
import windows.win32.system.com : IMoniker, IUnknown;

version (Windows):
extern (Windows):

HRESULT DtcGetTransactionManager(PSTR i_pszHost, PSTR i_pszTmName, const(GUID)* i_riid, uint i_dwReserved1, ushort i_wcbReserved2, void* i_pvReserved2, void** o_ppvObject);
HRESULT DtcGetTransactionManagerC(PSTR i_pszHost, PSTR i_pszTmName, const(GUID)* i_riid, uint i_dwReserved1, ushort i_wcbReserved2, void* i_pvReserved2, void** o_ppvObject);
HRESULT DtcGetTransactionManagerExA(PSTR i_pszHost, PSTR i_pszTmName, const(GUID)* i_riid, uint i_grfOptions, void* i_pvConfigParams, void** o_ppvObject);
HRESULT DtcGetTransactionManagerExW(PWSTR i_pwszHost, PWSTR i_pwszTmName, const(GUID)* i_riid, uint i_grfOptions, void* i_pvConfigParams, void** o_ppvObject);
enum DTCINSTALL_E_CLIENT_ALREADY_INSTALLED = 0x00000180;
enum DTCINSTALL_E_SERVER_ALREADY_INSTALLED = 0x00000181;
enum XA_SWITCH_F_DTC = 0x00000001;
enum XA_FMTID_DTC = 0x00445443;
enum XA_FMTID_DTC_VER1 = 0x01445443;
enum XIDDATASIZE = 0x00000080;
enum MAXGTRIDSIZE = 0x00000040;
enum MAXBQUALSIZE = 0x00000040;
enum RMNAMESZ = 0x00000020;
enum MAXINFOSIZE = 0x00000100;
enum TMNOFLAGS = 0x00000000;
enum TMREGISTER = 0x00000001;
enum TMNOMIGRATE = 0x00000002;
enum TMUSEASYNC = 0x00000004;
enum TMASYNC = 0xffffffff80000000;
enum TMONEPHASE = 0x40000000;
enum TMFAIL = 0x20000000;
enum TMNOWAIT = 0x10000000;
enum TMRESUME = 0x08000000;
enum TMSUCCESS = 0x04000000;
enum TMSUSPEND = 0x02000000;
enum TMSTARTRSCAN = 0x01000000;
enum TMENDRSCAN = 0x00800000;
enum TMMULTIPLE = 0x00400000;
enum TMJOIN = 0x00200000;
enum TMMIGRATE = 0x00100000;
enum TM_JOIN = 0x00000002;
enum TM_RESUME = 0x00000001;
enum TM_OK = 0x00000000;
enum TMER_TMERR = 0xffffffffffffffff;
enum TMER_INVAL = 0xfffffffffffffffe;
enum TMER_PROTO = 0xfffffffffffffffd;
enum XA_RBBASE = 0x00000064;
enum XA_RBROLLBACK = 0x00000064;
enum XA_RBCOMMFAIL = 0x00000065;
enum XA_RBDEADLOCK = 0x00000066;
enum XA_RBINTEGRITY = 0x00000067;
enum XA_RBOTHER = 0x00000068;
enum XA_RBPROTO = 0x00000069;
enum XA_RBTIMEOUT = 0x0000006a;
enum XA_RBTRANSIENT = 0x0000006b;
enum XA_RBEND = 0x0000006b;
enum XA_NOMIGRATE = 0x00000009;
enum XA_HEURHAZ = 0x00000008;
enum XA_HEURCOM = 0x00000007;
enum XA_HEURRB = 0x00000006;
enum XA_HEURMIX = 0x00000005;
enum XA_RETRY = 0x00000004;
enum XA_RDONLY = 0x00000003;
enum XA_OK = 0x00000000;
enum XAER_ASYNC = 0xfffffffffffffffe;
enum XAER_RMERR = 0xfffffffffffffffd;
enum XAER_NOTA = 0xfffffffffffffffc;
enum XAER_INVAL = 0xfffffffffffffffb;
enum XAER_PROTO = 0xfffffffffffffffa;
enum XAER_RMFAIL = 0xfffffffffffffff9;
enum XAER_DUPID = 0xfffffffffffffff8;
enum XAER_OUTSIDE = 0xfffffffffffffff7;
enum DTC_INSTALL_OVERWRITE_CLIENT = 0x00000001;
enum DTC_INSTALL_OVERWRITE_SERVER = 0x00000002;
enum OLE_TM_CONFIG_VERSION_1 = 0x00000001;
enum OLE_TM_CONFIG_VERSION_2 = 0x00000002;
enum OLE_TM_FLAG_NONE = 0x00000000;
enum OLE_TM_FLAG_NODEMANDSTART = 0x00000001;
enum OLE_TM_FLAG_NOAGILERECOVERY = 0x00000002;
enum OLE_TM_FLAG_QUERY_SERVICE_LOCKSTATUS = 0x80000000;
enum OLE_TM_FLAG_INTERNAL_TO_TM = 0x40000000;
enum CLSID_MSDtcTransactionManager = GUID(0x5b18ab61, 0x91d, 0x11d1, [0x97, 0xdf, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
enum CLSID_MSDtcTransaction = GUID(0x39f8d76b, 0x928, 0x11d1, [0x97, 0xdf, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
alias DTC_STATUS_ = int;
enum : int
{
    DTC_STATUS_UNKNOWN       = 0x00000000,
    DTC_STATUS_STARTING      = 0x00000001,
    DTC_STATUS_STARTED       = 0x00000002,
    DTC_STATUS_PAUSING       = 0x00000003,
    DTC_STATUS_PAUSED        = 0x00000004,
    DTC_STATUS_CONTINUING    = 0x00000005,
    DTC_STATUS_STOPPING      = 0x00000006,
    DTC_STATUS_STOPPED       = 0x00000007,
    DTC_STATUS_E_CANTCONTROL = 0x00000008,
    DTC_STATUS_FAILED        = 0x00000009,
}

alias DTC_GET_TRANSACTION_MANAGER = HRESULT function(PSTR pszHost, PSTR pszTmName, const(GUID)* rid, uint dwReserved1, ushort wcbReserved2, void* pvReserved2, void** ppvObject);
alias DTC_GET_TRANSACTION_MANAGER_EX_A = HRESULT function(PSTR i_pszHost, PSTR i_pszTmName, const(GUID)* i_riid, uint i_grfOptions, void* i_pvConfigParams, void** o_ppvObject);
alias DTC_GET_TRANSACTION_MANAGER_EX_W = HRESULT function(PWSTR i_pwszHost, PWSTR i_pwszTmName, const(GUID)* i_riid, uint i_grfOptions, void* i_pvConfigParams, void** o_ppvObject);
alias DTC_INSTALL_CLIENT = HRESULT function(byte* i_pszRemoteTmHostName, uint i_dwProtocol, uint i_dwOverwrite);
struct BOID
{
    ubyte[16] rgb;
}
alias TX_MISC_CONSTANTS = int;
enum : int
{
    MAX_TRAN_DESC = 0x00000028,
}

alias ISOLATIONLEVEL = int;
enum : int
{
    ISOLATIONLEVEL_UNSPECIFIED     = 0xffffffff,
    ISOLATIONLEVEL_CHAOS           = 0x00000010,
    ISOLATIONLEVEL_READUNCOMMITTED = 0x00000100,
    ISOLATIONLEVEL_BROWSE          = 0x00000100,
    ISOLATIONLEVEL_CURSORSTABILITY = 0x00001000,
    ISOLATIONLEVEL_READCOMMITTED   = 0x00001000,
    ISOLATIONLEVEL_REPEATABLEREAD  = 0x00010000,
    ISOLATIONLEVEL_SERIALIZABLE    = 0x00100000,
    ISOLATIONLEVEL_ISOLATED        = 0x00100000,
}

struct XACTTRANSINFO
{
    BOID uow;
    int isoLevel;
    uint isoFlags;
    uint grfTCSupported;
    uint grfRMSupported;
    uint grfTCSupportedRetaining;
    uint grfRMSupportedRetaining;
}
struct XACTSTATS
{
    uint cOpen;
    uint cCommitting;
    uint cCommitted;
    uint cAborting;
    uint cAborted;
    uint cInDoubt;
    uint cHeuristicDecision;
    FILETIME timeTransactionsUp;
}
alias ISOFLAG = int;
enum : int
{
    ISOFLAG_RETAIN_COMMIT_DC = 0x00000001,
    ISOFLAG_RETAIN_COMMIT    = 0x00000002,
    ISOFLAG_RETAIN_COMMIT_NO = 0x00000003,
    ISOFLAG_RETAIN_ABORT_DC  = 0x00000004,
    ISOFLAG_RETAIN_ABORT     = 0x00000008,
    ISOFLAG_RETAIN_ABORT_NO  = 0x0000000c,
    ISOFLAG_RETAIN_DONTCARE  = 0x00000005,
    ISOFLAG_RETAIN_BOTH      = 0x0000000a,
    ISOFLAG_RETAIN_NONE      = 0x0000000f,
    ISOFLAG_OPTIMISTIC       = 0x00000010,
    ISOFLAG_READONLY         = 0x00000020,
}

alias XACTTC = int;
enum : int
{
    XACTTC_NONE           = 0x00000000,
    XACTTC_SYNC_PHASEONE  = 0x00000001,
    XACTTC_SYNC_PHASETWO  = 0x00000002,
    XACTTC_SYNC           = 0x00000002,
    XACTTC_ASYNC_PHASEONE = 0x00000004,
    XACTTC_ASYNC          = 0x00000004,
}

alias XACTRM = int;
enum : int
{
    XACTRM_OPTIMISTICLASTWINS = 0x00000001,
    XACTRM_NOREADONLYPREPARES = 0x00000002,
}

alias XACTCONST = int;
enum : int
{
    XACTCONST_TIMEOUTINFINITE = 0x00000000,
}

alias XACTHEURISTIC = int;
enum : int
{
    XACTHEURISTIC_ABORT  = 0x00000001,
    XACTHEURISTIC_COMMIT = 0x00000002,
    XACTHEURISTIC_DAMAGE = 0x00000003,
    XACTHEURISTIC_DANGER = 0x00000004,
}

alias XACTSTAT = int;
enum : int
{
    XACTSTAT_NONE             = 0x00000000,
    XACTSTAT_OPENNORMAL       = 0x00000001,
    XACTSTAT_OPENREFUSED      = 0x00000002,
    XACTSTAT_PREPARING        = 0x00000004,
    XACTSTAT_PREPARED         = 0x00000008,
    XACTSTAT_PREPARERETAINING = 0x00000010,
    XACTSTAT_PREPARERETAINED  = 0x00000020,
    XACTSTAT_COMMITTING       = 0x00000040,
    XACTSTAT_COMMITRETAINING  = 0x00000080,
    XACTSTAT_ABORTING         = 0x00000100,
    XACTSTAT_ABORTED          = 0x00000200,
    XACTSTAT_COMMITTED        = 0x00000400,
    XACTSTAT_HEURISTIC_ABORT  = 0x00000800,
    XACTSTAT_HEURISTIC_COMMIT = 0x00001000,
    XACTSTAT_HEURISTIC_DAMAGE = 0x00002000,
    XACTSTAT_HEURISTIC_DANGER = 0x00004000,
    XACTSTAT_FORCED_ABORT     = 0x00008000,
    XACTSTAT_FORCED_COMMIT    = 0x00010000,
    XACTSTAT_INDOUBT          = 0x00020000,
    XACTSTAT_CLOSED           = 0x00040000,
    XACTSTAT_OPEN             = 0x00000003,
    XACTSTAT_NOTPREPARED      = 0x0007ffc3,
    XACTSTAT_ALL              = 0x0007ffff,
}

struct XACTOPT
{
    uint ulTimeout;
    ubyte[40] szDescription;
}
enum IID_ITransaction = GUID(0xfb15084, 0xaf41, 0x11ce, [0xbd, 0x2b, 0x20, 0x4c, 0x4f, 0x4f, 0x50, 0x20]);
interface ITransaction : IUnknown
{
    HRESULT Commit(BOOL fRetaining, uint grfTC, uint grfRM);
    HRESULT Abort(BOID* pboidReason, BOOL fRetaining, BOOL fAsync);
    HRESULT GetTransactionInfo(XACTTRANSINFO* pinfo);
}
enum IID_ITransactionCloner = GUID(0x2656950, 0x2152, 0x11d0, [0x94, 0x4c, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface ITransactionCloner : ITransaction
{
    HRESULT CloneWithCommitDisabled(ITransaction* ppITransaction);
}
enum IID_ITransaction2 = GUID(0x34021548, 0x65, 0x11d3, [0xba, 0xc1, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xe2]);
interface ITransaction2 : ITransactionCloner
{
    HRESULT GetTransactionInfo2(XACTTRANSINFO* pinfo);
}
enum IID_ITransactionDispenser = GUID(0x3a6ad9e1, 0x23b9, 0x11cf, [0xad, 0x60, 0x0, 0xaa, 0x0, 0xa7, 0x4c, 0xcd]);
interface ITransactionDispenser : IUnknown
{
    HRESULT GetOptionsObject(ITransactionOptions* ppOptions);
    HRESULT BeginTransaction(IUnknown punkOuter, int isoLevel, uint isoFlags, ITransactionOptions pOptions, ITransaction* ppTransaction);
}
enum IID_ITransactionOptions = GUID(0x3a6ad9e0, 0x23b9, 0x11cf, [0xad, 0x60, 0x0, 0xaa, 0x0, 0xa7, 0x4c, 0xcd]);
interface ITransactionOptions : IUnknown
{
    HRESULT SetOptions(XACTOPT* pOptions);
    HRESULT GetOptions(XACTOPT* pOptions);
}
enum IID_ITransactionOutcomeEvents = GUID(0x3a6ad9e2, 0x23b9, 0x11cf, [0xad, 0x60, 0x0, 0xaa, 0x0, 0xa7, 0x4c, 0xcd]);
interface ITransactionOutcomeEvents : IUnknown
{
    HRESULT Committed(BOOL fRetaining, BOID* pNewUOW, HRESULT hr);
    HRESULT Aborted(BOID* pboidReason, BOOL fRetaining, BOID* pNewUOW, HRESULT hr);
    HRESULT HeuristicDecision(uint dwDecision, BOID* pboidReason, HRESULT hr);
    HRESULT Indoubt();
}
enum IID_ITmNodeName = GUID(0x30274f88, 0x6ee4, 0x474e, [0x9b, 0x95, 0x78, 0x7, 0xbc, 0x9e, 0xf8, 0xcf]);
interface ITmNodeName : IUnknown
{
    HRESULT GetNodeNameSize(uint* pcbNodeNameSize);
    HRESULT GetNodeName(uint cbNodeNameBufferSize, PWSTR pNodeNameBuffer);
}
enum IID_IKernelTransaction = GUID(0x79427a2b, 0xf895, 0x40e0, [0xbe, 0x79, 0xb5, 0x7d, 0xc8, 0x2e, 0xd2, 0x31]);
interface IKernelTransaction : IUnknown
{
    HRESULT GetHandle(HANDLE* pHandle);
}
enum IID_ITransactionResourceAsync = GUID(0x69e971f0, 0x23ce, 0x11cf, [0xad, 0x60, 0x0, 0xaa, 0x0, 0xa7, 0x4c, 0xcd]);
interface ITransactionResourceAsync : IUnknown
{
    HRESULT PrepareRequest(BOOL fRetaining, uint grfRM, BOOL fWantMoniker, BOOL fSinglePhase);
    HRESULT CommitRequest(uint grfRM, BOID* pNewUOW);
    HRESULT AbortRequest(BOID* pboidReason, BOOL fRetaining, BOID* pNewUOW);
    HRESULT TMDown();
}
enum IID_ITransactionLastResourceAsync = GUID(0xc82bd532, 0x5b30, 0x11d3, [0x8a, 0x91, 0x0, 0xc0, 0x4f, 0x79, 0xeb, 0x6d]);
interface ITransactionLastResourceAsync : IUnknown
{
    HRESULT DelegateCommit(uint grfRM);
    HRESULT ForgetRequest(BOID* pNewUOW);
}
enum IID_ITransactionResource = GUID(0xee5ff7b3, 0x4572, 0x11d0, [0x94, 0x52, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface ITransactionResource : IUnknown
{
    HRESULT PrepareRequest(BOOL fRetaining, uint grfRM, BOOL fWantMoniker, BOOL fSinglePhase);
    HRESULT CommitRequest(uint grfRM, BOID* pNewUOW);
    HRESULT AbortRequest(BOID* pboidReason, BOOL fRetaining, BOID* pNewUOW);
    HRESULT TMDown();
}
enum IID_ITransactionEnlistmentAsync = GUID(0xfb15081, 0xaf41, 0x11ce, [0xbd, 0x2b, 0x20, 0x4c, 0x4f, 0x4f, 0x50, 0x20]);
interface ITransactionEnlistmentAsync : IUnknown
{
    HRESULT PrepareRequestDone(HRESULT hr, IMoniker pmk, BOID* pboidReason);
    HRESULT CommitRequestDone(HRESULT hr);
    HRESULT AbortRequestDone(HRESULT hr);
}
enum IID_ITransactionLastEnlistmentAsync = GUID(0xc82bd533, 0x5b30, 0x11d3, [0x8a, 0x91, 0x0, 0xc0, 0x4f, 0x79, 0xeb, 0x6d]);
interface ITransactionLastEnlistmentAsync : IUnknown
{
    HRESULT TransactionOutcome(XACTSTAT XactStat, BOID* pboidReason);
}
enum IID_ITransactionExportFactory = GUID(0xe1cf9b53, 0x8745, 0x11ce, [0xa9, 0xba, 0x0, 0xaa, 0x0, 0x6c, 0x37, 0x6]);
interface ITransactionExportFactory : IUnknown
{
    HRESULT GetRemoteClassId(GUID* pclsid);
    HRESULT Create(uint cbWhereabouts, ubyte* rgbWhereabouts, ITransactionExport* ppExport);
}
enum IID_ITransactionImportWhereabouts = GUID(0x141fda4, 0x8fc0, 0x11ce, [0xbd, 0x18, 0x20, 0x4c, 0x4f, 0x4f, 0x50, 0x20]);
interface ITransactionImportWhereabouts : IUnknown
{
    HRESULT GetWhereaboutsSize(uint* pcbWhereabouts);
    HRESULT GetWhereabouts(uint cbWhereabouts, ubyte* rgbWhereabouts, uint* pcbUsed);
}
enum IID_ITransactionExport = GUID(0x141fda5, 0x8fc0, 0x11ce, [0xbd, 0x18, 0x20, 0x4c, 0x4f, 0x4f, 0x50, 0x20]);
interface ITransactionExport : IUnknown
{
    HRESULT Export(IUnknown punkTransaction, uint* pcbTransactionCookie);
    HRESULT GetTransactionCookie(IUnknown punkTransaction, uint cbTransactionCookie, ubyte* rgbTransactionCookie, uint* pcbUsed);
}
enum IID_ITransactionImport = GUID(0xe1cf9b5a, 0x8745, 0x11ce, [0xa9, 0xba, 0x0, 0xaa, 0x0, 0x6c, 0x37, 0x6]);
interface ITransactionImport : IUnknown
{
    HRESULT Import(uint cbTransactionCookie, ubyte* rgbTransactionCookie, const(GUID)* piid, void** ppvTransaction);
}
enum IID_ITipTransaction = GUID(0x17cf72d0, 0xbac5, 0x11d1, [0xb1, 0xbf, 0x0, 0xc0, 0x4f, 0xc2, 0xf3, 0xef]);
interface ITipTransaction : IUnknown
{
    HRESULT Push(ubyte* i_pszRemoteTmUrl, PSTR* o_ppszRemoteTxUrl);
    HRESULT GetTransactionUrl(PSTR* o_ppszLocalTxUrl);
}
enum IID_ITipHelper = GUID(0x17cf72d1, 0xbac5, 0x11d1, [0xb1, 0xbf, 0x0, 0xc0, 0x4f, 0xc2, 0xf3, 0xef]);
interface ITipHelper : IUnknown
{
    HRESULT Pull(ubyte* i_pszTxUrl, ITransaction* o_ppITransaction);
    HRESULT PullAsync(ubyte* i_pszTxUrl, ITipPullSink i_pTipPullSink, ITransaction* o_ppITransaction);
    HRESULT GetLocalTmUrl(ubyte** o_ppszLocalTmUrl);
}
enum IID_ITipPullSink = GUID(0x17cf72d2, 0xbac5, 0x11d1, [0xb1, 0xbf, 0x0, 0xc0, 0x4f, 0xc2, 0xf3, 0xef]);
interface ITipPullSink : IUnknown
{
    HRESULT PullComplete(HRESULT i_hrPull);
}
enum IID_IDtcNetworkAccessConfig = GUID(0x9797c15d, 0xa428, 0x4291, [0x87, 0xb6, 0x9, 0x95, 0x3, 0x1a, 0x67, 0x8d]);
interface IDtcNetworkAccessConfig : IUnknown
{
    HRESULT GetAnyNetworkAccess(BOOL* pbAnyNetworkAccess);
    HRESULT SetAnyNetworkAccess(BOOL bAnyNetworkAccess);
    HRESULT GetNetworkAdministrationAccess(BOOL* pbNetworkAdministrationAccess);
    HRESULT SetNetworkAdministrationAccess(BOOL bNetworkAdministrationAccess);
    HRESULT GetNetworkTransactionAccess(BOOL* pbNetworkTransactionAccess);
    HRESULT SetNetworkTransactionAccess(BOOL bNetworkTransactionAccess);
    HRESULT GetNetworkClientAccess(BOOL* pbNetworkClientAccess);
    HRESULT SetNetworkClientAccess(BOOL bNetworkClientAccess);
    HRESULT GetNetworkTIPAccess(BOOL* pbNetworkTIPAccess);
    HRESULT SetNetworkTIPAccess(BOOL bNetworkTIPAccess);
    HRESULT GetXAAccess(BOOL* pbXAAccess);
    HRESULT SetXAAccess(BOOL bXAAccess);
    HRESULT RestartDtcService();
}
alias AUTHENTICATION_LEVEL = int;
enum : int
{
    NO_AUTHENTICATION_REQUIRED       = 0x00000000,
    INCOMING_AUTHENTICATION_REQUIRED = 0x00000001,
    MUTUAL_AUTHENTICATION_REQUIRED   = 0x00000002,
}

enum IID_IDtcNetworkAccessConfig2 = GUID(0xa7aa013b, 0xeb7d, 0x4f42, [0xb4, 0x1c, 0xb2, 0xde, 0xc0, 0x9a, 0xe0, 0x34]);
interface IDtcNetworkAccessConfig2 : IDtcNetworkAccessConfig
{
    HRESULT GetNetworkInboundAccess(BOOL* pbInbound);
    HRESULT GetNetworkOutboundAccess(BOOL* pbOutbound);
    HRESULT SetNetworkInboundAccess(BOOL bInbound);
    HRESULT SetNetworkOutboundAccess(BOOL bOutbound);
    HRESULT GetAuthenticationLevel(AUTHENTICATION_LEVEL* pAuthLevel);
    HRESULT SetAuthenticationLevel(AUTHENTICATION_LEVEL AuthLevel);
}
enum IID_IDtcNetworkAccessConfig3 = GUID(0x76e4b4f3, 0x2ca5, 0x466b, [0x89, 0xd5, 0xfd, 0x21, 0x8e, 0xe7, 0x5b, 0x49]);
interface IDtcNetworkAccessConfig3 : IDtcNetworkAccessConfig2
{
    HRESULT GetLUAccess(BOOL* pbLUAccess);
    HRESULT SetLUAccess(BOOL bLUAccess);
}
struct XID
{
    int formatID;
    int gtrid_length;
    int bqual_length;
    CHAR[128] data;
}
struct xa_switch_t
{
    CHAR[32] name;
    int flags;
    int version_;
    long xa_open_entry;
    long xa_close_entry;
    long xa_start_entry;
    long xa_end_entry;
    long xa_rollback_entry;
    long xa_prepare_entry;
    long xa_commit_entry;
    long xa_recover_entry;
    long xa_forget_entry;
    long xa_complete_entry;
}
alias XA_OPEN_EPT = int function(PSTR param0, int param1, int param2);
alias XA_CLOSE_EPT = int function(PSTR param0, int param1, int param2);
alias XA_START_EPT = int function(XID* param0, int param1, int param2);
alias XA_END_EPT = int function(XID* param0, int param1, int param2);
alias XA_ROLLBACK_EPT = int function(XID* param0, int param1, int param2);
alias XA_PREPARE_EPT = int function(XID* param0, int param1, int param2);
alias XA_COMMIT_EPT = int function(XID* param0, int param1, int param2);
alias XA_RECOVER_EPT = int function(XID* param0, int param1, int param2, int param3);
alias XA_FORGET_EPT = int function(XID* param0, int param1, int param2);
alias XA_COMPLETE_EPT = int function(int* param0, int* param1, int param2, int param3);
enum IID_IDtcToXaMapper = GUID(0x64ffabe0, 0x7ce9, 0x11d0, [0x8c, 0xe6, 0x0, 0xc0, 0x4f, 0xdc, 0x87, 0x7e]);
interface IDtcToXaMapper : IUnknown
{
    HRESULT RequestNewResourceManager(PSTR pszDSN, PSTR pszClientDllName, uint* pdwRMCookie);
    HRESULT TranslateTridToXid(uint* pdwITransaction, uint dwRMCookie, XID* pXid);
    HRESULT EnlistResourceManager(uint dwRMCookie, uint* pdwITransaction);
    HRESULT ReleaseResourceManager(uint dwRMCookie);
}
enum IID_IDtcToXaHelperFactory = GUID(0xa9861610, 0x304a, 0x11d1, [0x98, 0x13, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcToXaHelperFactory : IUnknown
{
    HRESULT Create(PSTR pszDSN, PSTR pszClientDllName, GUID* pguidRm, IDtcToXaHelper* ppXaHelper);
}
enum IID_IDtcToXaHelper = GUID(0xa9861611, 0x304a, 0x11d1, [0x98, 0x13, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcToXaHelper : IUnknown
{
    HRESULT Close(BOOL i_fDoRecovery);
    HRESULT TranslateTridToXid(ITransaction pITransaction, GUID* pguidBqual, XID* pXid);
}
enum IID_IDtcToXaHelperSinglePipe = GUID(0x47ed4971, 0x53b3, 0x11d1, [0xbb, 0xb9, 0x0, 0xc0, 0x4f, 0xd6, 0x58, 0xf6]);
interface IDtcToXaHelperSinglePipe : IUnknown
{
    HRESULT XARMCreate(PSTR pszDSN, PSTR pszClientDll, uint* pdwRMCookie);
    HRESULT ConvertTridToXID(uint* pdwITrans, uint dwRMCookie, XID* pxid);
    HRESULT EnlistWithRM(uint dwRMCookie, ITransaction i_pITransaction, ITransactionResourceAsync i_pITransRes, ITransactionEnlistmentAsync* o_ppITransEnslitment);
    void ReleaseRMCookie(uint i_dwRMCookie, BOOL i_fNormal);
}
alias APPLICATIONTYPE = int;
enum : int
{
    LOCAL_APPLICATIONTYPE           = 0x00000000,
    CLUSTERRESOURCE_APPLICATIONTYPE = 0x00000001,
}

struct OLE_TM_CONFIG_PARAMS_V1
{
    uint dwVersion;
    uint dwcConcurrencyHint;
}
struct OLE_TM_CONFIG_PARAMS_V2
{
    uint dwVersion;
    uint dwcConcurrencyHint;
    APPLICATIONTYPE applicationType;
    GUID clusterResourceId;
}
alias XACT_DTC_CONSTANTS = int;
enum : int
{
    XACT_E_CONNECTION_REQUEST_DENIED = 0x8004d100,
    XACT_E_TOOMANY_ENLISTMENTS       = 0x8004d101,
    XACT_E_DUPLICATE_GUID            = 0x8004d102,
    XACT_E_NOTSINGLEPHASE            = 0x8004d103,
    XACT_E_RECOVERYALREADYDONE       = 0x8004d104,
    XACT_E_PROTOCOL                  = 0x8004d105,
    XACT_E_RM_FAILURE                = 0x8004d106,
    XACT_E_RECOVERY_FAILED           = 0x8004d107,
    XACT_E_LU_NOT_FOUND              = 0x8004d108,
    XACT_E_DUPLICATE_LU              = 0x8004d109,
    XACT_E_LU_NOT_CONNECTED          = 0x8004d10a,
    XACT_E_DUPLICATE_TRANSID         = 0x8004d10b,
    XACT_E_LU_BUSY                   = 0x8004d10c,
    XACT_E_LU_NO_RECOVERY_PROCESS    = 0x8004d10d,
    XACT_E_LU_DOWN                   = 0x8004d10e,
    XACT_E_LU_RECOVERING             = 0x8004d10f,
    XACT_E_LU_RECOVERY_MISMATCH      = 0x8004d110,
    XACT_E_RM_UNAVAILABLE            = 0x8004d111,
    XACT_E_LRMRECOVERYALREADYDONE    = 0x8004d112,
    XACT_E_NOLASTRESOURCEINTERFACE   = 0x8004d113,
    XACT_S_NONOTIFY                  = 0x0004d100,
    XACT_OK_NONOTIFY                 = 0x0004d101,
    dwUSER_MS_SQLSERVER              = 0x0000ffff,
}

enum IID_IXATransLookup = GUID(0xf3b1f131, 0xeeda, 0x11ce, [0xae, 0xd4, 0x0, 0xaa, 0x0, 0x51, 0xe2, 0xc4]);
interface IXATransLookup : IUnknown
{
    HRESULT Lookup(ITransaction* ppTransaction);
}
enum IID_IXATransLookup2 = GUID(0xbf193c85, 0xd1a, 0x4290, [0xb8, 0x8f, 0xd2, 0xcb, 0x88, 0x73, 0xd1, 0xe7]);
interface IXATransLookup2 : IUnknown
{
    HRESULT Lookup(XID* pXID, ITransaction* ppTransaction);
}
enum IID_IResourceManagerSink = GUID(0xd563181, 0xdefb, 0x11ce, [0xae, 0xd1, 0x0, 0xaa, 0x0, 0x51, 0xe2, 0xc4]);
interface IResourceManagerSink : IUnknown
{
    HRESULT TMDown();
}
enum IID_IResourceManager = GUID(0x13741d21, 0x87eb, 0x11ce, [0x80, 0x81, 0x0, 0x80, 0xc7, 0x58, 0x52, 0x7e]);
interface IResourceManager : IUnknown
{
    HRESULT Enlist(ITransaction pTransaction, ITransactionResourceAsync pRes, BOID* pUOW, int* pisoLevel, ITransactionEnlistmentAsync* ppEnlist);
    HRESULT Reenlist(ubyte* pPrepInfo, uint cbPrepInfo, uint lTimeout, XACTSTAT* pXactStat);
    HRESULT ReenlistmentComplete();
    HRESULT GetDistributedTransactionManager(const(GUID)* iid, void** ppvObject);
}
enum IID_ILastResourceManager = GUID(0x4d964ad4, 0x5b33, 0x11d3, [0x8a, 0x91, 0x0, 0xc0, 0x4f, 0x79, 0xeb, 0x6d]);
interface ILastResourceManager : IUnknown
{
    HRESULT TransactionCommitted(ubyte* pPrepInfo, uint cbPrepInfo);
    HRESULT RecoveryDone();
}
enum IID_IResourceManager2 = GUID(0xd136c69a, 0xf749, 0x11d1, [0x8f, 0x47, 0x0, 0xc0, 0x4f, 0x8e, 0xe5, 0x7d]);
interface IResourceManager2 : IResourceManager
{
    HRESULT Enlist2(ITransaction pTransaction, ITransactionResourceAsync pResAsync, BOID* pUOW, int* pisoLevel, XID* pXid, ITransactionEnlistmentAsync* ppEnlist);
    HRESULT Reenlist2(XID* pXid, uint dwTimeout, XACTSTAT* pXactStat);
}
enum IID_IResourceManagerRejoinable = GUID(0x6f6de620, 0xb5df, 0x4f3e, [0x9c, 0xfa, 0xc8, 0xae, 0xbd, 0x5, 0x17, 0x2b]);
interface IResourceManagerRejoinable : IResourceManager2
{
    HRESULT Rejoin(ubyte* pPrepInfo, uint cbPrepInfo, uint lTimeout, XACTSTAT* pXactStat);
}
enum IID_IXAConfig = GUID(0xc8a6e3a1, 0x9a8c, 0x11cf, [0xa3, 0x8, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IXAConfig : IUnknown
{
    HRESULT Initialize(GUID clsidHelperDll);
    HRESULT Terminate();
}
enum IID_IRMHelper = GUID(0xe793f6d1, 0xf53d, 0x11cf, [0xa6, 0xd, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IRMHelper : IUnknown
{
    HRESULT RMCount(uint dwcTotalNumberOfRMs);
    HRESULT RMInfo(xa_switch_t* pXa_Switch, BOOL fCDeclCallingConv, PSTR pszOpenString, PSTR pszCloseString, GUID guidRMRecovery);
}
enum IID_IXAObtainRMInfo = GUID(0xe793f6d2, 0xf53d, 0x11cf, [0xa6, 0xd, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IXAObtainRMInfo : IUnknown
{
    HRESULT ObtainRMInfo(IRMHelper pIRMHelper);
}
enum IID_IResourceManagerFactory = GUID(0x13741d20, 0x87eb, 0x11ce, [0x80, 0x81, 0x0, 0x80, 0xc7, 0x58, 0x52, 0x7e]);
interface IResourceManagerFactory : IUnknown
{
    HRESULT Create(GUID* pguidRM, PSTR pszRMName, IResourceManagerSink pIResMgrSink, IResourceManager* ppResMgr);
}
enum IID_IResourceManagerFactory2 = GUID(0x6b369c21, 0xfbd2, 0x11d1, [0x8f, 0x47, 0x0, 0xc0, 0x4f, 0x8e, 0xe5, 0x7d]);
interface IResourceManagerFactory2 : IResourceManagerFactory
{
    HRESULT CreateEx(GUID* pguidRM, PSTR pszRMName, IResourceManagerSink pIResMgrSink, const(GUID)* riidRequested, void** ppvResMgr);
}
enum IID_IPrepareInfo = GUID(0x80c7bfd0, 0x87ee, 0x11ce, [0x80, 0x81, 0x0, 0x80, 0xc7, 0x58, 0x52, 0x7e]);
interface IPrepareInfo : IUnknown
{
    HRESULT GetPrepareInfoSize(uint* pcbPrepInfo);
    HRESULT GetPrepareInfo(ubyte* pPrepInfo);
}
enum IID_IPrepareInfo2 = GUID(0x5fab2547, 0x9779, 0x11d1, [0xb8, 0x86, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface IPrepareInfo2 : IUnknown
{
    HRESULT GetPrepareInfoSize(uint* pcbPrepInfo);
    HRESULT GetPrepareInfo(uint cbPrepareInfo, ubyte* pPrepInfo);
}
enum IID_IGetDispenser = GUID(0xc23cc370, 0x87ef, 0x11ce, [0x80, 0x81, 0x0, 0x80, 0xc7, 0x58, 0x52, 0x7e]);
interface IGetDispenser : IUnknown
{
    HRESULT GetDispenser(const(GUID)* iid, void** ppvObject);
}
enum IID_ITransactionVoterBallotAsync2 = GUID(0x5433376c, 0x414d, 0x11d3, [0xb2, 0x6, 0x0, 0xc0, 0x4f, 0xc2, 0xf3, 0xef]);
interface ITransactionVoterBallotAsync2 : IUnknown
{
    HRESULT VoteRequestDone(HRESULT hr, BOID* pboidReason);
}
enum IID_ITransactionVoterNotifyAsync2 = GUID(0x5433376b, 0x414d, 0x11d3, [0xb2, 0x6, 0x0, 0xc0, 0x4f, 0xc2, 0xf3, 0xef]);
interface ITransactionVoterNotifyAsync2 : ITransactionOutcomeEvents
{
    HRESULT VoteRequest();
}
enum IID_ITransactionVoterFactory2 = GUID(0x5433376a, 0x414d, 0x11d3, [0xb2, 0x6, 0x0, 0xc0, 0x4f, 0xc2, 0xf3, 0xef]);
interface ITransactionVoterFactory2 : IUnknown
{
    HRESULT Create(ITransaction pTransaction, ITransactionVoterNotifyAsync2 pVoterNotify, ITransactionVoterBallotAsync2* ppVoterBallot);
}
enum IID_ITransactionPhase0EnlistmentAsync = GUID(0x82dc88e1, 0xa954, 0x11d1, [0x8f, 0x88, 0x0, 0x60, 0x8, 0x95, 0xe7, 0xd5]);
interface ITransactionPhase0EnlistmentAsync : IUnknown
{
    HRESULT Enable();
    HRESULT WaitForEnlistment();
    HRESULT Phase0Done();
    HRESULT Unenlist();
    HRESULT GetTransaction(ITransaction* ppITransaction);
}
enum IID_ITransactionPhase0NotifyAsync = GUID(0xef081809, 0xc76, 0x11d2, [0x87, 0xa6, 0x0, 0xc0, 0x4f, 0x99, 0xf, 0x34]);
interface ITransactionPhase0NotifyAsync : IUnknown
{
    HRESULT Phase0Request(BOOL fAbortingHint);
    HRESULT EnlistCompleted(HRESULT status);
}
enum IID_ITransactionPhase0Factory = GUID(0x82dc88e0, 0xa954, 0x11d1, [0x8f, 0x88, 0x0, 0x60, 0x8, 0x95, 0xe7, 0xd5]);
interface ITransactionPhase0Factory : IUnknown
{
    HRESULT Create(ITransactionPhase0NotifyAsync pPhase0Notify, ITransactionPhase0EnlistmentAsync* ppPhase0Enlistment);
}
enum IID_ITransactionTransmitter = GUID(0x59313e01, 0xb36c, 0x11cf, [0xa5, 0x39, 0x0, 0xaa, 0x0, 0x68, 0x87, 0xc3]);
interface ITransactionTransmitter : IUnknown
{
    HRESULT Set(ITransaction pTransaction);
    HRESULT GetPropagationTokenSize(uint* pcbToken);
    HRESULT MarshalPropagationToken(uint cbToken, ubyte* rgbToken, uint* pcbUsed);
    HRESULT UnmarshalReturnToken(uint cbReturnToken, ubyte* rgbReturnToken);
    HRESULT Reset();
}
enum IID_ITransactionTransmitterFactory = GUID(0x59313e00, 0xb36c, 0x11cf, [0xa5, 0x39, 0x0, 0xaa, 0x0, 0x68, 0x87, 0xc3]);
interface ITransactionTransmitterFactory : IUnknown
{
    HRESULT Create(ITransactionTransmitter* ppTransmitter);
}
enum IID_ITransactionReceiver = GUID(0x59313e03, 0xb36c, 0x11cf, [0xa5, 0x39, 0x0, 0xaa, 0x0, 0x68, 0x87, 0xc3]);
interface ITransactionReceiver : IUnknown
{
    HRESULT UnmarshalPropagationToken(uint cbToken, ubyte* rgbToken, ITransaction* ppTransaction);
    HRESULT GetReturnTokenSize(uint* pcbReturnToken);
    HRESULT MarshalReturnToken(uint cbReturnToken, ubyte* rgbReturnToken, uint* pcbUsed);
    HRESULT Reset();
}
enum IID_ITransactionReceiverFactory = GUID(0x59313e02, 0xb36c, 0x11cf, [0xa5, 0x39, 0x0, 0xaa, 0x0, 0x68, 0x87, 0xc3]);
interface ITransactionReceiverFactory : IUnknown
{
    HRESULT Create(ITransactionReceiver* ppReceiver);
}
struct PROXY_CONFIG_PARAMS
{
    ushort wcThreadsMax;
}
enum IID_IDtcLuConfigure = GUID(0x4131e760, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuConfigure : IUnknown
{
    HRESULT Add(ubyte* pucLuPair, uint cbLuPair);
    HRESULT Delete(ubyte* pucLuPair, uint cbLuPair);
}
enum IID_IDtcLuRecovery = GUID(0xac2b8ad2, 0xd6f0, 0x11d0, [0xb3, 0x86, 0x0, 0xa0, 0xc9, 0x8, 0x33, 0x65]);
interface IDtcLuRecovery : IUnknown
{
}
enum IID_IDtcLuRecoveryFactory = GUID(0x4131e762, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRecoveryFactory : IUnknown
{
    HRESULT Create(ubyte* pucLuPair, uint cbLuPair, IDtcLuRecovery* ppRecovery);
}
alias DTCINITIATEDRECOVERYWORK = int;
enum : int
{
    DTCINITIATEDRECOVERYWORK_CHECKLUSTATUS = 0x00000001,
    DTCINITIATEDRECOVERYWORK_TRANS         = 0x00000002,
    DTCINITIATEDRECOVERYWORK_TMDOWN        = 0x00000003,
}

alias DTCLUXLN = int;
enum : int
{
    DTCLUXLN_COLD = 0x00000001,
    DTCLUXLN_WARM = 0x00000002,
}

alias DTCLUXLNCONFIRMATION = int;
enum : int
{
    DTCLUXLNCONFIRMATION_CONFIRM          = 0x00000001,
    DTCLUXLNCONFIRMATION_LOGNAMEMISMATCH  = 0x00000002,
    DTCLUXLNCONFIRMATION_COLDWARMMISMATCH = 0x00000003,
    DTCLUXLNCONFIRMATION_OBSOLETE         = 0x00000004,
}

alias DTCLUXLNRESPONSE = int;
enum : int
{
    DTCLUXLNRESPONSE_OK_SENDOURXLNBACK   = 0x00000001,
    DTCLUXLNRESPONSE_OK_SENDCONFIRMATION = 0x00000002,
    DTCLUXLNRESPONSE_LOGNAMEMISMATCH     = 0x00000003,
    DTCLUXLNRESPONSE_COLDWARMMISMATCH    = 0x00000004,
}

alias DTCLUXLNERROR = int;
enum : int
{
    DTCLUXLNERROR_PROTOCOL         = 0x00000001,
    DTCLUXLNERROR_LOGNAMEMISMATCH  = 0x00000002,
    DTCLUXLNERROR_COLDWARMMISMATCH = 0x00000003,
}

alias DTCLUCOMPARESTATE = int;
enum : int
{
    DTCLUCOMPARESTATE_COMMITTED          = 0x00000001,
    DTCLUCOMPARESTATE_HEURISTICCOMMITTED = 0x00000002,
    DTCLUCOMPARESTATE_HEURISTICMIXED     = 0x00000003,
    DTCLUCOMPARESTATE_HEURISTICRESET     = 0x00000004,
    DTCLUCOMPARESTATE_INDOUBT            = 0x00000005,
    DTCLUCOMPARESTATE_RESET              = 0x00000006,
}

alias DTCLUCOMPARESTATESCONFIRMATION = int;
enum : int
{
    DTCLUCOMPARESTATESCONFIRMATION_CONFIRM  = 0x00000001,
    DTCLUCOMPARESTATESCONFIRMATION_PROTOCOL = 0x00000002,
}

alias DTCLUCOMPARESTATESERROR = int;
enum : int
{
    DTCLUCOMPARESTATESERROR_PROTOCOL = 0x00000001,
}

alias DTCLUCOMPARESTATESRESPONSE = int;
enum : int
{
    DTCLUCOMPARESTATESRESPONSE_OK       = 0x00000001,
    DTCLUCOMPARESTATESRESPONSE_PROTOCOL = 0x00000002,
}

enum IID_IDtcLuRecoveryInitiatedByDtcTransWork = GUID(0x4131e765, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRecoveryInitiatedByDtcTransWork : IUnknown
{
    HRESULT GetLogNameSizes(uint* pcbOurLogName, uint* pcbRemoteLogName);
    HRESULT GetOurXln(DTCLUXLN* pXln, ubyte* pOurLogName, ubyte* pRemoteLogName, uint* pdwProtocol);
    HRESULT HandleConfirmationFromOurXln(DTCLUXLNCONFIRMATION Confirmation);
    HRESULT HandleTheirXlnResponse(DTCLUXLN Xln, ubyte* pRemoteLogName, uint cbRemoteLogName, uint dwProtocol, DTCLUXLNCONFIRMATION* pConfirmation);
    HRESULT HandleErrorFromOurXln(DTCLUXLNERROR Error);
    HRESULT CheckForCompareStates(BOOL* fCompareStates);
    HRESULT GetOurTransIdSize(uint* pcbOurTransId);
    HRESULT GetOurCompareStates(ubyte* pOurTransId, DTCLUCOMPARESTATE* pCompareState);
    HRESULT HandleTheirCompareStatesResponse(DTCLUCOMPARESTATE CompareState, DTCLUCOMPARESTATESCONFIRMATION* pConfirmation);
    HRESULT HandleErrorFromOurCompareStates(DTCLUCOMPARESTATESERROR Error);
    HRESULT ConversationLost();
    HRESULT GetRecoverySeqNum(int* plRecoverySeqNum);
    HRESULT ObsoleteRecoverySeqNum(int lNewRecoverySeqNum);
}
enum IID_IDtcLuRecoveryInitiatedByDtcStatusWork = GUID(0x4131e766, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRecoveryInitiatedByDtcStatusWork : IUnknown
{
    HRESULT HandleCheckLuStatus(int lRecoverySeqNum);
}
enum IID_IDtcLuRecoveryInitiatedByDtc = GUID(0x4131e764, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRecoveryInitiatedByDtc : IUnknown
{
    HRESULT GetWork(DTCINITIATEDRECOVERYWORK* pWork, void** ppv);
}
enum IID_IDtcLuRecoveryInitiatedByLuWork = GUID(0xac2b8ad1, 0xd6f0, 0x11d0, [0xb3, 0x86, 0x0, 0xa0, 0xc9, 0x8, 0x33, 0x65]);
interface IDtcLuRecoveryInitiatedByLuWork : IUnknown
{
    HRESULT HandleTheirXln(int lRecoverySeqNum, DTCLUXLN Xln, ubyte* pRemoteLogName, uint cbRemoteLogName, ubyte* pOurLogName, uint cbOurLogName, uint dwProtocol, DTCLUXLNRESPONSE* pResponse);
    HRESULT GetOurLogNameSize(uint* pcbOurLogName);
    HRESULT GetOurXln(DTCLUXLN* pXln, ubyte* pOurLogName, uint* pdwProtocol);
    HRESULT HandleConfirmationOfOurXln(DTCLUXLNCONFIRMATION Confirmation);
    HRESULT HandleTheirCompareStates(ubyte* pRemoteTransId, uint cbRemoteTransId, DTCLUCOMPARESTATE CompareState, DTCLUCOMPARESTATESRESPONSE* pResponse, DTCLUCOMPARESTATE* pCompareState);
    HRESULT HandleConfirmationOfOurCompareStates(DTCLUCOMPARESTATESCONFIRMATION Confirmation);
    HRESULT HandleErrorFromOurCompareStates(DTCLUCOMPARESTATESERROR Error);
    HRESULT ConversationLost();
}
enum IID_IDtcLuRecoveryInitiatedByLu = GUID(0x4131e768, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRecoveryInitiatedByLu : IUnknown
{
    HRESULT GetObjectToHandleWorkFromLu(IDtcLuRecoveryInitiatedByLuWork* ppWork);
}
enum IID_IDtcLuRmEnlistment = GUID(0x4131e769, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRmEnlistment : IUnknown
{
    HRESULT Unplug(BOOL fConversationLost);
    HRESULT BackedOut();
    HRESULT BackOut();
    HRESULT Committed();
    HRESULT Forget();
    HRESULT RequestCommit();
}
enum IID_IDtcLuRmEnlistmentSink = GUID(0x4131e770, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRmEnlistmentSink : IUnknown
{
    HRESULT AckUnplug();
    HRESULT TmDown();
    HRESULT SessionLost();
    HRESULT BackedOut();
    HRESULT BackOut();
    HRESULT Committed();
    HRESULT Forget();
    HRESULT Prepare();
    HRESULT RequestCommit();
}
enum IID_IDtcLuRmEnlistmentFactory = GUID(0x4131e771, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuRmEnlistmentFactory : IUnknown
{
    HRESULT Create(ubyte* pucLuPair, uint cbLuPair, ITransaction pITransaction, ubyte* pTransId, uint cbTransId, IDtcLuRmEnlistmentSink pRmEnlistmentSink, IDtcLuRmEnlistment* ppRmEnlistment);
}
enum IID_IDtcLuSubordinateDtc = GUID(0x4131e773, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuSubordinateDtc : IUnknown
{
    HRESULT Unplug(BOOL fConversationLost);
    HRESULT BackedOut();
    HRESULT BackOut();
    HRESULT Committed();
    HRESULT Forget();
    HRESULT Prepare();
    HRESULT RequestCommit();
}
enum IID_IDtcLuSubordinateDtcSink = GUID(0x4131e774, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuSubordinateDtcSink : IUnknown
{
    HRESULT AckUnplug();
    HRESULT TmDown();
    HRESULT SessionLost();
    HRESULT BackedOut();
    HRESULT BackOut();
    HRESULT Committed();
    HRESULT Forget();
    HRESULT RequestCommit();
}
enum IID_IDtcLuSubordinateDtcFactory = GUID(0x4131e775, 0x1aea, 0x11d0, [0x94, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x6e]);
interface IDtcLuSubordinateDtcFactory : IUnknown
{
    HRESULT Create(ubyte* pucLuPair, uint cbLuPair, IUnknown punkTransactionOuter, int isoLevel, uint isoFlags, ITransactionOptions pOptions, ITransaction* ppTransaction, ubyte* pTransId, uint cbTransId, IDtcLuSubordinateDtcSink pSubordinateDtcSink, IDtcLuSubordinateDtc* ppSubordinateDtc);
}
