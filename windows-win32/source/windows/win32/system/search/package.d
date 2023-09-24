module windows.win32.system.search;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HANDLE, HRESULT, HWND, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.security.authorization : EXPLICIT_ACCESS_W, TRUSTEE_W;
import windows.win32.storage.indexserver : DBID, FILTERREGION, FULLPROPSPEC, IFilter, IPhraseSink, WORDREP_BREAK_TYPE;
import windows.win32.system.com : BLOB, COSERVERINFO, CY, DISPPARAMS, IAuthenticate, IDispatch, IEnumString, IEnumUnknown, IErrorInfo, IMoniker, IPersistStream, ISequentialStream, IStream, ITypeInfo, IUnknown, MULTI_QI;
import windows.win32.system.com.structuredstorage : IStorage, PROPSPEC, PROPVARIANT;
import windows.win32.system.distributedtransactioncoordinator : ITransaction, ITransactionOptions;
import windows.win32.system.search.common : CONDITION_OPERATION, CONDITION_TYPE;
import windows.win32.system.variant : VARENUM, VARIANT;
import windows.win32.ui.shell.common : IObjectArray;
import windows.win32.ui.shell.propertiessystem : PROPERTYKEY;

version (Windows):
extern (Windows):

short SQLBindCol(void*, ushort, short, void*, long, long*);
short SQLBindParam(void*, ushort, short, short, ulong, short, void*, long*);
short SQLColAttribute(void*, ushort, ushort, void*, short, short*, long*);
short SQLDescribeCol(void*, ushort, ubyte*, short, short*, short*, ulong*, short*, short*);
short SQLFetchScroll(void*, short, long);
short SQLGetData(void*, ushort, short, void*, long, long*);
short SQLGetDescRec(void*, short, ubyte*, short, short*, short*, short*, long*, short*, short*, short*);
short SQLPutData(void*, void*, long);
short SQLRowCount(void*, long*);
short SQLSetConnectOption(void*, ushort, ulong);
short SQLSetDescRec(void*, short, short, short, long, short, short, void*, long*, long*);
short SQLSetParam(void*, ushort, short, short, ulong, short, void*, long*);
short SQLSetStmtOption(void*, ushort, ulong);
short SQLColAttributes(void*, ushort, ushort, void*, short, short*, long*);
short SQLDescribeParam(void*, ushort, short*, ulong*, short*, short*);
short SQLExtendedFetch(void*, ushort, long, ulong*, ushort*);
short SQLParamOptions(void*, ulong, ulong*);
short SQLSetPos(void*, ulong, ushort, ushort);
short SQLBindParameter(void*, ushort, short, short, short, ulong, short, void*, long, long*);
short SQLSetScrollOptions(void*, ushort, long, ushort);
short SQLColAttributeW(void*, ushort, ushort, void*, short, short*, long*);
short SQLColAttributesW(void*, ushort, ushort, void*, short, short*, long*);
short SQLDescribeColW(void*, ushort, ushort*, short, short*, short*, ulong*, short*, short*);
short SQLGetDescRecW(void*, short, ushort*, short, short*, short*, short*, long*, short*, short*, short*);
short SQLSetConnectOptionW(void*, ushort, ulong);
short SQLColAttributeA(void*, short, short, void*, short, short*, long*);
short SQLColAttributesA(void*, ushort, ushort, void*, short, short*, long*);
short SQLDescribeColA(void*, ushort, ubyte*, short, short*, short*, ulong*, short*, short*);
short SQLGetDescRecA(void*, short, ubyte*, short, short*, short*, short*, long*, short*, short*, short*);
short SQLSetConnectOptionA(void*, ushort, ulong);
short SQLAllocConnect(void*, void**);
short SQLAllocEnv(void**);
short SQLAllocHandle(short, void*, void**);
short SQLAllocStmt(void*, void**);
/+ [CONFLICTED] short SQLBindCol(void*, ushort, short, void*, int, int*);
+/
/+ [CONFLICTED] short SQLBindParam(void*, ushort, short, short, uint, short, void*, int*);
+/
short SQLCancel(void*);
short SQLCancelHandle(short, void*);
short SQLCloseCursor(void*);
/+ [CONFLICTED] short SQLColAttribute(void*, ushort, ushort, void*, short, short*, void*);
+/
short SQLColumns(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLCompleteAsync(short, void*, short*);
short SQLConnect(void*, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLCopyDesc(void*, void*);
short SQLDataSources(void*, ushort, ubyte*, short, short*, ubyte*, short, short*);
/+ [CONFLICTED] short SQLDescribeCol(void*, ushort, ubyte*, short, short*, short*, uint*, short*, short*);
+/
short SQLDisconnect(void*);
short SQLEndTran(short, void*, short);
short SQLError(void*, void*, void*, ubyte*, int*, ubyte*, short, short*);
short SQLExecDirect(void*, ubyte*, int);
short SQLExecute(void*);
short SQLFetch(void*);
/+ [CONFLICTED] short SQLFetchScroll(void*, short, int);
+/
short SQLFreeConnect(void*);
short SQLFreeEnv(void*);
short SQLFreeHandle(short, void*);
short SQLFreeStmt(void*, ushort);
short SQLGetConnectAttr(void*, int, void*, int, int*);
short SQLGetConnectOption(void*, ushort, void*);
short SQLGetCursorName(void*, ubyte*, short, short*);
/+ [CONFLICTED] short SQLGetData(void*, ushort, short, void*, int, int*);
+/
short SQLGetDescField(void*, short, short, void*, int, int*);
/+ [CONFLICTED] short SQLGetDescRec(void*, short, ubyte*, short, short*, short*, short*, int*, short*, short*, short*);
+/
short SQLGetDiagField(short, void*, short, short, void*, short, short*);
short SQLGetDiagRec(short, void*, short, ubyte*, int*, ubyte*, short, short*);
short SQLGetEnvAttr(void*, int, void*, int, int*);
short SQLGetFunctions(void*, ushort, ushort*);
short SQLGetInfo(void*, ushort, void*, short, short*);
short SQLGetStmtAttr(void*, int, void*, int, int*);
short SQLGetStmtOption(void*, ushort, void*);
short SQLGetTypeInfo(void*, short);
short SQLNumResultCols(void*, short*);
short SQLParamData(void*, void**);
short SQLPrepare(void*, ubyte*, int);
/+ [CONFLICTED] short SQLPutData(void*, void*, int);
+/
/+ [CONFLICTED] short SQLRowCount(void*, int*);
+/
short SQLSetConnectAttr(void*, int, void*, int);
/+ [CONFLICTED] short SQLSetConnectOption(void*, ushort, uint);
+/
short SQLSetCursorName(void*, ubyte*, short);
short SQLSetDescField(void*, short, short, void*, int);
/+ [CONFLICTED] short SQLSetDescRec(void*, short, short, short, int, short, short, void*, int*, int*);
+/
short SQLSetEnvAttr(void*, int, void*, int);
/+ [CONFLICTED] short SQLSetParam(void*, ushort, short, short, uint, short, void*, int*);
+/
short SQLSetStmtAttr(void*, int, void*, int);
/+ [CONFLICTED] short SQLSetStmtOption(void*, ushort, uint);
+/
short SQLSpecialColumns(void*, ushort, ubyte*, short, ubyte*, short, ubyte*, short, ushort, ushort);
short SQLStatistics(void*, ubyte*, short, ubyte*, short, ubyte*, short, ushort, ushort);
short SQLTables(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLTransact(void*, void*, ushort);
int bcp_batch(void*);
short bcp_bind(void*, ubyte*, int, int, ubyte*, int, int, int);
short bcp_colfmt(void*, int, ubyte, int, int, ubyte*, int, int);
short bcp_collen(void*, int, int);
short bcp_colptr(void*, ubyte*, int);
short bcp_columns(void*, int);
short bcp_control(void*, int, void*);
int bcp_done(void*);
short bcp_exec(void*, int*);
short bcp_getcolfmt(void*, int, int, void*, int, int*);
short bcp_initA(void*, const(char)*, const(char)*, const(char)*, int);
short bcp_initW(void*, const(wchar)*, const(wchar)*, const(wchar)*, int);
short bcp_moretext(void*, int, ubyte*);
short bcp_readfmtA(void*, const(char)*);
short bcp_readfmtW(void*, const(wchar)*);
short bcp_sendrow(void*);
short bcp_setcolfmt(void*, int, int, void*, int);
short bcp_writefmtA(void*, const(char)*);
short bcp_writefmtW(void*, const(wchar)*);
PSTR dbprtypeA(int);
PWSTR dbprtypeW(int);
short SQLLinkedServers(void*);
short SQLLinkedCatalogsA(void*, const(char)*, short);
short SQLLinkedCatalogsW(void*, const(wchar)*, short);
HANDLE SQLInitEnumServers(PWSTR, PWSTR);
short SQLGetNextEnumeration(HANDLE, ubyte*, int*);
short SQLCloseEnumServers(HANDLE);
short SQLDriverConnect(void*, long, ubyte*, short, ubyte*, short, short*, ushort);
short SQLBrowseConnect(void*, ubyte*, short, ubyte*, short, short*);
short SQLBulkOperations(void*, short);
/+ [CONFLICTED] short SQLColAttributes(void*, ushort, ushort, void*, short, short*, int*);
+/
short SQLColumnPrivileges(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
/+ [CONFLICTED] short SQLDescribeParam(void*, ushort, short*, uint*, short*, short*);
+/
/+ [CONFLICTED] short SQLExtendedFetch(void*, ushort, int, uint*, ushort*);
+/
short SQLForeignKeys(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLMoreResults(void*);
short SQLNativeSql(void*, ubyte*, int, ubyte*, int, int*);
short SQLNumParams(void*, short*);
/+ [CONFLICTED] short SQLParamOptions(void*, uint, uint*);
+/
short SQLPrimaryKeys(void*, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLProcedureColumns(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLProcedures(void*, ubyte*, short, ubyte*, short, ubyte*, short);
/+ [CONFLICTED] short SQLSetPos(void*, ushort, ushort, ushort);
+/
short SQLTablePrivileges(void*, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLDrivers(void*, ushort, ubyte*, short, short*, ubyte*, short, short*);
/+ [CONFLICTED] short SQLBindParameter(void*, ushort, short, short, short, uint, short, void*, int, int*);
+/
short SQLAllocHandleStd(short, void*, void**);
/+ [CONFLICTED] short SQLSetScrollOptions(void*, ushort, int, ushort);
+/
BOOL ODBCSetTryWaitValue(uint);
uint ODBCGetTryWaitValue();
/+ [CONFLICTED] short SQLColAttributeW(void*, ushort, ushort, void*, short, short*, void*);
+/
/+ [CONFLICTED] short SQLColAttributesW(void*, ushort, ushort, void*, short, short*, int*);
+/
short SQLConnectW(void*, ushort*, short, ushort*, short, ushort*, short);
/+ [CONFLICTED] short SQLDescribeColW(void*, ushort, ushort*, short, short*, short*, uint*, short*, short*);
+/
short SQLErrorW(void*, void*, void*, ushort*, int*, ushort*, short, short*);
short SQLExecDirectW(void*, ushort*, int);
short SQLGetConnectAttrW(void*, int, void*, int, int*);
short SQLGetCursorNameW(void*, ushort*, short, short*);
short SQLSetDescFieldW(void*, short, short, void*, int);
short SQLGetDescFieldW(void*, short, short, void*, int, int*);
/+ [CONFLICTED] short SQLGetDescRecW(void*, short, ushort*, short, short*, short*, short*, int*, short*, short*, short*);
+/
short SQLGetDiagFieldW(short, void*, short, short, void*, short, short*);
short SQLGetDiagRecW(short, void*, short, ushort*, int*, ushort*, short, short*);
short SQLPrepareW(void*, ushort*, int);
short SQLSetConnectAttrW(void*, int, void*, int);
short SQLSetCursorNameW(void*, ushort*, short);
short SQLColumnsW(void*, ushort*, short, ushort*, short, ushort*, short, ushort*, short);
short SQLGetConnectOptionW(void*, ushort, void*);
short SQLGetInfoW(void*, ushort, void*, short, short*);
short SQLGetTypeInfoW(void*, short);
/+ [CONFLICTED] short SQLSetConnectOptionW(void*, ushort, uint);
+/
short SQLSpecialColumnsW(void*, ushort, ushort*, short, ushort*, short, ushort*, short, ushort, ushort);
short SQLStatisticsW(void*, ushort*, short, ushort*, short, ushort*, short, ushort, ushort);
short SQLTablesW(void*, ushort*, short, ushort*, short, ushort*, short, ushort*, short);
short SQLDataSourcesW(void*, ushort, ushort*, short, short*, ushort*, short, short*);
short SQLDriverConnectW(void*, long, ushort*, short, ushort*, short, short*, ushort);
short SQLBrowseConnectW(void*, ushort*, short, ushort*, short, short*);
short SQLColumnPrivilegesW(void*, ushort*, short, ushort*, short, ushort*, short, ushort*, short);
short SQLGetStmtAttrW(void*, int, void*, int, int*);
short SQLSetStmtAttrW(void*, int, void*, int);
short SQLForeignKeysW(void*, ushort*, short, ushort*, short, ushort*, short, ushort*, short, ushort*, short, ushort*, short);
short SQLNativeSqlW(void*, ushort*, int, ushort*, int, int*);
short SQLPrimaryKeysW(void*, ushort*, short, ushort*, short, ushort*, short);
short SQLProcedureColumnsW(void*, ushort*, short, ushort*, short, ushort*, short, ushort*, short);
short SQLProceduresW(void*, ushort*, short, ushort*, short, ushort*, short);
short SQLTablePrivilegesW(void*, ushort*, short, ushort*, short, ushort*, short);
short SQLDriversW(void*, ushort, ushort*, short, short*, ushort*, short, short*);
/+ [CONFLICTED] short SQLColAttributeA(void*, short, short, void*, short, short*, void*);
+/
/+ [CONFLICTED] short SQLColAttributesA(void*, ushort, ushort, void*, short, short*, int*);
+/
short SQLConnectA(void*, ubyte*, short, ubyte*, short, ubyte*, short);
/+ [CONFLICTED] short SQLDescribeColA(void*, ushort, ubyte*, short, short*, short*, uint*, short*, short*);
+/
short SQLErrorA(void*, void*, void*, ubyte*, int*, ubyte*, short, short*);
short SQLExecDirectA(void*, ubyte*, int);
short SQLGetConnectAttrA(void*, int, void*, int, int*);
short SQLGetCursorNameA(void*, ubyte*, short, short*);
short SQLGetDescFieldA(void*, short, short, void*, int, int*);
/+ [CONFLICTED] short SQLGetDescRecA(void*, short, ubyte*, short, short*, short*, short*, int*, short*, short*, short*);
+/
short SQLGetDiagFieldA(short, void*, short, short, void*, short, short*);
short SQLGetDiagRecA(short, void*, short, ubyte*, int*, ubyte*, short, short*);
short SQLGetStmtAttrA(void*, int, void*, int, int*);
short SQLGetTypeInfoA(void*, short);
short SQLPrepareA(void*, ubyte*, int);
short SQLSetConnectAttrA(void*, int, void*, int);
short SQLSetCursorNameA(void*, ubyte*, short);
short SQLColumnsA(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLGetConnectOptionA(void*, ushort, void*);
short SQLGetInfoA(void*, ushort, void*, short, short*);
/+ [CONFLICTED] short SQLSetConnectOptionA(void*, ushort, uint);
+/
short SQLSpecialColumnsA(void*, ushort, ubyte*, short, ubyte*, short, ubyte*, short, ushort, ushort);
short SQLStatisticsA(void*, ubyte*, short, ubyte*, short, ubyte*, short, ushort, ushort);
short SQLTablesA(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLDataSourcesA(void*, ushort, ubyte*, short, short*, ubyte*, short, short*);
short SQLDriverConnectA(void*, long, ubyte*, short, ubyte*, short, short*, ushort);
short SQLBrowseConnectA(void*, ubyte*, short, ubyte*, short, short*);
short SQLColumnPrivilegesA(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLForeignKeysA(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLNativeSqlA(void*, ubyte*, int, ubyte*, int, int*);
short SQLPrimaryKeysA(void*, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLProcedureColumnsA(void*, ubyte*, short, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLProceduresA(void*, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLTablePrivilegesA(void*, ubyte*, short, ubyte*, short, ubyte*, short);
short SQLDriversA(void*, ushort, ubyte*, short, short*, ubyte*, short, short*);
enum SI_TEMPORARY = 0x80000000;
enum SUBSINFO_ALLFLAGS = 0x0000ef7f;
enum RS_READY = 0x00000001;
enum RS_SUSPENDED = 0x00000002;
enum RS_UPDATING = 0x00000004;
enum RS_SUSPENDONIDLE = 0x00010000;
enum RS_MAYBOTHERUSER = 0x00020000;
enum RS_COMPLETED = 0x80000000;
enum SUBSMGRUPDATE_MINIMIZE = 0x00000001;
enum SUBSMGRUPDATE_MASK = 0x00000001;
enum SUBSMGRENUM_TEMP = 0x00000001;
enum SUBSMGRENUM_MASK = 0x00000001;
enum INET_E_AGENT_MAX_SIZE_EXCEEDED = 0xffffffff800c0f80;
enum INET_S_AGENT_PART_FAIL = 0x000c0f81;
enum INET_E_AGENT_CACHE_SIZE_EXCEEDED = 0xffffffff800c0f82;
enum INET_E_AGENT_CONNECTION_FAILED = 0xffffffff800c0f83;
enum INET_E_SCHEDULED_UPDATES_DISABLED = 0xffffffff800c0f84;
enum INET_E_SCHEDULED_UPDATES_RESTRICTED = 0xffffffff800c0f85;
enum INET_E_SCHEDULED_UPDATE_INTERVAL = 0xffffffff800c0f86;
enum INET_E_SCHEDULED_EXCLUDE_RANGE = 0xffffffff800c0f87;
enum INET_E_AGENT_EXCEEDING_CACHE_SIZE = 0xffffffff800c0f90;
enum INET_S_AGENT_INCREASED_CACHE_SIZE = 0x000c0f90;
enum OLEDBVER = 0x00000270;
enum DB_NULL_HACCESSOR = 0x00000000;
enum DB_INVALID_HACCESSOR = 0x00000000;
enum DB_NULL_HROW = 0x00000000;
enum DB_NULL_HCHAPTER = 0x00000000;
enum DB_INVALID_HCHAPTER = 0x00000000;
enum STD_BOOKMARKLENGTH = 0x00000001;
enum DBCIDGUID = GUID(0xc733a81, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum DB_NULLGUID = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum DBGUID_ROWURL = GUID(0xc733ab6, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum DBGUID_ROWDEFAULTSTREAM = GUID(0xc733ab7, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum DBPROPVAL_BMK_NUMERIC = 0x00000001;
enum DBPROPVAL_BMK_KEY = 0x00000002;
enum DBPROPVAL_CL_START = 0x00000001;
enum DBPROPVAL_CL_END = 0x00000002;
enum DBPROPVAL_CU_DML_STATEMENTS = 0x00000001;
enum DBPROPVAL_CU_TABLE_DEFINITION = 0x00000002;
enum DBPROPVAL_CU_INDEX_DEFINITION = 0x00000004;
enum DBPROPVAL_CU_PRIVILEGE_DEFINITION = 0x00000008;
enum DBPROPVAL_CD_NOTNULL = 0x00000001;
enum DBPROPVAL_CB_NULL = 0x00000001;
enum DBPROPVAL_CB_NON_NULL = 0x00000002;
enum DBPROPVAL_FU_NOT_SUPPORTED = 0x00000001;
enum DBPROPVAL_FU_COLUMN = 0x00000002;
enum DBPROPVAL_FU_TABLE = 0x00000004;
enum DBPROPVAL_FU_CATALOG = 0x00000008;
enum DBPROPVAL_GB_NOT_SUPPORTED = 0x00000001;
enum DBPROPVAL_GB_EQUALS_SELECT = 0x00000002;
enum DBPROPVAL_GB_CONTAINS_SELECT = 0x00000004;
enum DBPROPVAL_GB_NO_RELATION = 0x00000008;
enum DBPROPVAL_HT_DIFFERENT_CATALOGS = 0x00000001;
enum DBPROPVAL_HT_DIFFERENT_PROVIDERS = 0x00000002;
enum DBPROPVAL_IC_UPPER = 0x00000001;
enum DBPROPVAL_IC_LOWER = 0x00000002;
enum DBPROPVAL_IC_SENSITIVE = 0x00000004;
enum DBPROPVAL_IC_MIXED = 0x00000008;
enum DBPROPVAL_LM_NONE = 0x00000001;
enum DBPROPVAL_LM_READ = 0x00000002;
enum DBPROPVAL_LM_INTENT = 0x00000004;
enum DBPROPVAL_LM_RITE = 0x00000008;
enum DBPROPVAL_NP_OKTODO = 0x00000001;
enum DBPROPVAL_NP_ABOUTTODO = 0x00000002;
enum DBPROPVAL_NP_SYNCHAFTER = 0x00000004;
enum DBPROPVAL_NP_FAILEDTODO = 0x00000008;
enum DBPROPVAL_NP_DIDEVENT = 0x00000010;
enum DBPROPVAL_NC_END = 0x00000001;
enum DBPROPVAL_NC_HIGH = 0x00000002;
enum DBPROPVAL_NC_LOW = 0x00000004;
enum DBPROPVAL_NC_START = 0x00000008;
enum DBPROPVAL_OO_BLOB = 0x00000001;
enum DBPROPVAL_OO_IPERSIST = 0x00000002;
enum DBPROPVAL_CB_DELETE = 0x00000001;
enum DBPROPVAL_CB_PRESERVE = 0x00000002;
enum DBPROPVAL_SU_DML_STATEMENTS = 0x00000001;
enum DBPROPVAL_SU_TABLE_DEFINITION = 0x00000002;
enum DBPROPVAL_SU_INDEX_DEFINITION = 0x00000004;
enum DBPROPVAL_SU_PRIVILEGE_DEFINITION = 0x00000008;
enum DBPROPVAL_SQ_CORRELATEDSUBQUERIES = 0x00000001;
enum DBPROPVAL_SQ_COMPARISON = 0x00000002;
enum DBPROPVAL_SQ_EXISTS = 0x00000004;
enum DBPROPVAL_SQ_IN = 0x00000008;
enum DBPROPVAL_SQ_QUANTIFIED = 0x00000010;
enum DBPROPVAL_SQ_TABLE = 0x00000020;
enum DBPROPVAL_SS_ISEQUENTIALSTREAM = 0x00000001;
enum DBPROPVAL_SS_ISTREAM = 0x00000002;
enum DBPROPVAL_SS_ISTORAGE = 0x00000004;
enum DBPROPVAL_SS_ILOCKBYTES = 0x00000008;
enum DBPROPVAL_TI_CHAOS = 0x00000010;
enum DBPROPVAL_TI_READUNCOMMITTED = 0x00000100;
enum DBPROPVAL_TI_BROWSE = 0x00000100;
enum DBPROPVAL_TI_CURSORSTABILITY = 0x00001000;
enum DBPROPVAL_TI_READCOMMITTED = 0x00001000;
enum DBPROPVAL_TI_REPEATABLEREAD = 0x00010000;
enum DBPROPVAL_TI_SERIALIZABLE = 0x00100000;
enum DBPROPVAL_TI_ISOLATED = 0x00100000;
enum DBPROPVAL_TR_COMMIT_DC = 0x00000001;
enum DBPROPVAL_TR_COMMIT = 0x00000002;
enum DBPROPVAL_TR_COMMIT_NO = 0x00000004;
enum DBPROPVAL_TR_ABORT_DC = 0x00000008;
enum DBPROPVAL_TR_ABORT = 0x00000010;
enum DBPROPVAL_TR_ABORT_NO = 0x00000020;
enum DBPROPVAL_TR_DONTCARE = 0x00000040;
enum DBPROPVAL_TR_BOTH = 0x00000080;
enum DBPROPVAL_TR_NONE = 0x00000100;
enum DBPROPVAL_TR_OPTIMISTIC = 0x00000200;
enum DBPROPVAL_RT_FREETHREAD = 0x00000001;
enum DBPROPVAL_RT_APTMTTHREAD = 0x00000002;
enum DBPROPVAL_RT_SINGLETHREAD = 0x00000004;
enum DBPROPVAL_UP_CHANGE = 0x00000001;
enum DBPROPVAL_UP_DELETE = 0x00000002;
enum DBPROPVAL_UP_INSERT = 0x00000004;
enum DBPROPVAL_SQL_NONE = 0x00000000;
enum DBPROPVAL_SQL_ODBC_MINIMUM = 0x00000001;
enum DBPROPVAL_SQL_ODBC_CORE = 0x00000002;
enum DBPROPVAL_SQL_ODBC_EXTENDED = 0x00000004;
enum DBPROPVAL_SQL_ANSI89_IEF = 0x00000008;
enum DBPROPVAL_SQL_ANSI92_ENTRY = 0x00000010;
enum DBPROPVAL_SQL_FIPS_TRANSITIONAL = 0x00000020;
enum DBPROPVAL_SQL_ANSI92_INTERMEDIATE = 0x00000040;
enum DBPROPVAL_SQL_ANSI92_FULL = 0x00000080;
enum DBPROPVAL_SQL_ESCAPECLAUSES = 0x00000100;
enum DBPROPVAL_IT_BTREE = 0x00000001;
enum DBPROPVAL_IT_HASH = 0x00000002;
enum DBPROPVAL_IT_CONTENT = 0x00000003;
enum DBPROPVAL_IT_OTHER = 0x00000004;
enum DBPROPVAL_IN_DISALLOWNULL = 0x00000001;
enum DBPROPVAL_IN_IGNORENULL = 0x00000002;
enum DBPROPVAL_IN_IGNOREANYNULL = 0x00000004;
enum DBPROPVAL_TC_NONE = 0x00000000;
enum DBPROPVAL_TC_DML = 0x00000001;
enum DBPROPVAL_TC_DDL_COMMIT = 0x00000002;
enum DBPROPVAL_TC_DDL_IGNORE = 0x00000004;
enum DBPROPVAL_TC_ALL = 0x00000008;
enum DBPROPVAL_OA_NOTSUPPORTED = 0x00000001;
enum DBPROPVAL_OA_ATEXECUTE = 0x00000002;
enum DBPROPVAL_OA_ATROWRELEASE = 0x00000004;
enum DBPROPVAL_MR_NOTSUPPORTED = 0x00000000;
enum DBPROPVAL_MR_SUPPORTED = 0x00000001;
enum DBPROPVAL_MR_CONCURRENT = 0x00000002;
enum DBPROPVAL_PT_GUID_NAME = 0x00000001;
enum DBPROPVAL_PT_GUID_PROPID = 0x00000002;
enum DBPROPVAL_PT_NAME = 0x00000004;
enum DBPROPVAL_PT_GUID = 0x00000008;
enum DBPROPVAL_PT_PROPID = 0x00000010;
enum DBPROPVAL_PT_PGUID_NAME = 0x00000020;
enum DBPROPVAL_PT_PGUID_PROPID = 0x00000040;
enum DBPROPVAL_NT_SINGLEROW = 0x00000001;
enum DBPROPVAL_NT_MULTIPLEROWS = 0x00000002;
enum DBPROPVAL_ASYNCH_INITIALIZE = 0x00000001;
enum DBPROPVAL_ASYNCH_SEQUENTIALPOPULATION = 0x00000002;
enum DBPROPVAL_ASYNCH_RANDOMPOPULATION = 0x00000004;
enum DBPROPVAL_OP_EQUAL = 0x00000001;
enum DBPROPVAL_OP_RELATIVE = 0x00000002;
enum DBPROPVAL_OP_STRING = 0x00000004;
enum DBPROPVAL_CO_EQUALITY = 0x00000001;
enum DBPROPVAL_CO_STRING = 0x00000002;
enum DBPROPVAL_CO_CASESENSITIVE = 0x00000004;
enum DBPROPVAL_CO_CASEINSENSITIVE = 0x00000008;
enum DBPROPVAL_CO_CONTAINS = 0x00000010;
enum DBPROPVAL_CO_BEGINSWITH = 0x00000020;
enum DBPROPVAL_ASYNCH_BACKGROUNDPOPULATION = 0x00000008;
enum DBPROPVAL_ASYNCH_PREPOPULATE = 0x00000010;
enum DBPROPVAL_ASYNCH_POPULATEONDEMAND = 0x00000020;
enum DBPROPVAL_LM_SINGLEROW = 0x00000002;
enum DBPROPVAL_SQL_SUBMINIMUM = 0x00000200;
enum DBPROPVAL_DST_TDP = 0x00000001;
enum DBPROPVAL_DST_MDP = 0x00000002;
enum DBPROPVAL_DST_TDPANDMDP = 0x00000003;
enum MDPROPVAL_AU_UNSUPPORTED = 0x00000000;
enum MDPROPVAL_AU_UNCHANGED = 0x00000001;
enum MDPROPVAL_AU_UNKNOWN = 0x00000002;
enum MDPROPVAL_MF_WITH_CALCMEMBERS = 0x00000001;
enum MDPROPVAL_MF_WITH_NAMEDSETS = 0x00000002;
enum MDPROPVAL_MF_CREATE_CALCMEMBERS = 0x00000004;
enum MDPROPVAL_MF_CREATE_NAMEDSETS = 0x00000008;
enum MDPROPVAL_MF_SCOPE_SESSION = 0x00000010;
enum MDPROPVAL_MF_SCOPE_GLOBAL = 0x00000020;
enum MDPROPVAL_MMF_COUSIN = 0x00000001;
enum MDPROPVAL_MMF_PARALLELPERIOD = 0x00000002;
enum MDPROPVAL_MMF_OPENINGPERIOD = 0x00000004;
enum MDPROPVAL_MMF_CLOSINGPERIOD = 0x00000008;
enum MDPROPVAL_MNF_MEDIAN = 0x00000001;
enum MDPROPVAL_MNF_VAR = 0x00000002;
enum MDPROPVAL_MNF_STDDEV = 0x00000004;
enum MDPROPVAL_MNF_RANK = 0x00000008;
enum MDPROPVAL_MNF_AGGREGATE = 0x00000010;
enum MDPROPVAL_MNF_COVARIANCE = 0x00000020;
enum MDPROPVAL_MNF_CORRELATION = 0x00000040;
enum MDPROPVAL_MNF_LINREGSLOPE = 0x00000080;
enum MDPROPVAL_MNF_LINREGVARIANCE = 0x00000100;
enum MDPROPVAL_MNF_LINREG2 = 0x00000200;
enum MDPROPVAL_MNF_LINREGPOINT = 0x00000400;
enum MDPROPVAL_MNF_DRILLDOWNLEVEL = 0x00000800;
enum MDPROPVAL_MNF_DRILLDOWNMEMBERTOP = 0x00001000;
enum MDPROPVAL_MNF_DRILLDOWNMEMBERBOTTOM = 0x00002000;
enum MDPROPVAL_MNF_DRILLDOWNLEVELTOP = 0x00004000;
enum MDPROPVAL_MNF_DRILLDOWNLEVELBOTTOM = 0x00008000;
enum MDPROPVAL_MNF_DRILLUPMEMBER = 0x00010000;
enum MDPROPVAL_MNF_DRILLUPLEVEL = 0x00020000;
enum MDPROPVAL_MSF_TOPPERCENT = 0x00000001;
enum MDPROPVAL_MSF_BOTTOMPERCENT = 0x00000002;
enum MDPROPVAL_MSF_TOPSUM = 0x00000004;
enum MDPROPVAL_MSF_BOTTOMSUM = 0x00000008;
enum MDPROPVAL_MSF_PERIODSTODATE = 0x00000010;
enum MDPROPVAL_MSF_LASTPERIODS = 0x00000020;
enum MDPROPVAL_MSF_YTD = 0x00000040;
enum MDPROPVAL_MSF_QTD = 0x00000080;
enum MDPROPVAL_MSF_MTD = 0x00000100;
enum MDPROPVAL_MSF_WTD = 0x00000200;
enum MDPROPVAL_MSF_DRILLDOWNMEMBBER = 0x00000400;
enum MDPROPVAL_MSF_DRILLDOWNLEVEL = 0x00000800;
enum MDPROPVAL_MSF_DRILLDOWNMEMBERTOP = 0x00001000;
enum MDPROPVAL_MSF_DRILLDOWNMEMBERBOTTOM = 0x00002000;
enum MDPROPVAL_MSF_DRILLDOWNLEVELTOP = 0x00004000;
enum MDPROPVAL_MSF_DRILLDOWNLEVELBOTTOM = 0x00008000;
enum MDPROPVAL_MSF_DRILLUPMEMBER = 0x00010000;
enum MDPROPVAL_MSF_DRILLUPLEVEL = 0x00020000;
enum MDPROPVAL_MSF_TOGGLEDRILLSTATE = 0x00040000;
enum MDPROPVAL_MD_SELF = 0x00000001;
enum MDPROPVAL_MD_BEFORE = 0x00000002;
enum MDPROPVAL_MD_AFTER = 0x00000004;
enum MDPROPVAL_MSC_LESSTHAN = 0x00000001;
enum MDPROPVAL_MSC_GREATERTHAN = 0x00000002;
enum MDPROPVAL_MSC_LESSTHANEQUAL = 0x00000004;
enum MDPROPVAL_MSC_GREATERTHANEQUAL = 0x00000008;
enum MDPROPVAL_MC_SINGLECASE = 0x00000001;
enum MDPROPVAL_MC_SEARCHEDCASE = 0x00000002;
enum MDPROPVAL_MOQ_OUTERREFERENCE = 0x00000001;
enum MDPROPVAL_MOQ_DATASOURCE_CUBE = 0x00000001;
enum MDPROPVAL_MOQ_CATALOG_CUBE = 0x00000002;
enum MDPROPVAL_MOQ_SCHEMA_CUBE = 0x00000004;
enum MDPROPVAL_MOQ_CUBE_DIM = 0x00000008;
enum MDPROPVAL_MOQ_DIM_HIER = 0x00000010;
enum MDPROPVAL_MOQ_DIMHIER_LEVEL = 0x00000020;
enum MDPROPVAL_MOQ_LEVEL_MEMBER = 0x00000040;
enum MDPROPVAL_MOQ_MEMBER_MEMBER = 0x00000080;
enum MDPROPVAL_MOQ_DIMHIER_MEMBER = 0x00000100;
enum MDPROPVAL_FS_FULL_SUPPORT = 0x00000001;
enum MDPROPVAL_FS_GENERATED_COLUMN = 0x00000002;
enum MDPROPVAL_FS_GENERATED_DIMENSION = 0x00000003;
enum MDPROPVAL_FS_NO_SUPPORT = 0x00000004;
enum MDPROPVAL_NL_NAMEDLEVELS = 0x00000001;
enum MDPROPVAL_NL_NUMBEREDLEVELS = 0x00000002;
enum MDPROPVAL_MJC_SINGLECUBE = 0x00000001;
enum MDPROPVAL_MJC_MULTICUBES = 0x00000002;
enum MDPROPVAL_MJC_IMPLICITCUBE = 0x00000004;
enum MDPROPVAL_RR_NORANGEROWSET = 0x00000001;
enum MDPROPVAL_RR_READONLY = 0x00000002;
enum MDPROPVAL_RR_UPDATE = 0x00000004;
enum MDPROPVAL_MS_MULTIPLETUPLES = 0x00000001;
enum MDPROPVAL_MS_SINGLETUPLE = 0x00000002;
enum MDPROPVAL_NME_ALLDIMENSIONS = 0x00000000;
enum MDPROPVAL_NME_MEASURESONLY = 0x00000001;
enum DBPROPVAL_AO_SEQUENTIAL = 0x00000000;
enum DBPROPVAL_AO_SEQUENTIALSTORAGEOBJECTS = 0x00000001;
enum DBPROPVAL_AO_RANDOM = 0x00000002;
enum DBPROPVAL_BD_ROWSET = 0x00000000;
enum DBPROPVAL_BD_INTRANSACTION = 0x00000001;
enum DBPROPVAL_BD_XTRANSACTION = 0x00000002;
enum DBPROPVAL_BD_REORGANIZATION = 0x00000003;
enum BMK_DURABILITY_ROWSET = 0x00000000;
enum BMK_DURABILITY_INTRANSACTION = 0x00000001;
enum BMK_DURABILITY_XTRANSACTION = 0x00000002;
enum BMK_DURABILITY_REORGANIZATION = 0x00000003;
enum DBPROPVAL_BO_NOLOG = 0x00000000;
enum DBPROPVAL_BO_NOINDEXUPDATE = 0x00000001;
enum DBPROPVAL_BO_REFINTEGRITY = 0x00000002;
enum DBPROPVAL_STGM_DIRECT = 0x00010000;
enum DBPROPVAL_STGM_TRANSACTED = 0x00020000;
enum DBPROPVAL_STGM_CONVERT = 0x00040000;
enum DBPROPVAL_STGM_FAILIFTHERE = 0x00080000;
enum DBPROPVAL_STGM_PRIORITY = 0x00100000;
enum DBPROPVAL_STGM_DELETEONRELEASE = 0x00200000;
enum DBPROPVAL_GB_COLLATE = 0x00000010;
enum DBPROPVAL_CS_UNINITIALIZED = 0x00000000;
enum DBPROPVAL_CS_INITIALIZED = 0x00000001;
enum DBPROPVAL_CS_COMMUNICATIONFAILURE = 0x00000002;
enum DBPROPVAL_RD_RESETALL = 0xffffffffffffffff;
enum DBPROPVAL_OS_RESOURCEPOOLING = 0x00000001;
enum DBPROPVAL_OS_TXNENLISTMENT = 0x00000002;
enum DBPROPVAL_OS_CLIENTCURSOR = 0x00000004;
enum DBPROPVAL_OS_ENABLEALL = 0xffffffffffffffff;
enum DBPROPVAL_BI_CROSSROWSET = 0x00000001;
enum MDPROPVAL_NL_SCHEMAONLY = 0x00000004;
enum DBPROPVAL_OS_DISABLEALL = 0x00000000;
enum DBPROPVAL_OO_ROWOBJECT = 0x00000004;
enum DBPROPVAL_OO_SCOPED = 0x00000008;
enum DBPROPVAL_OO_DIRECTBIND = 0x00000010;
enum DBPROPVAL_DST_DOCSOURCE = 0x00000004;
enum DBPROPVAL_GU_NOTSUPPORTED = 0x00000001;
enum DBPROPVAL_GU_SUFFIX = 0x00000002;
enum DB_BINDFLAGS_DELAYFETCHCOLUMNS = 0x00000001;
enum DB_BINDFLAGS_DELAYFETCHSTREAM = 0x00000002;
enum DB_BINDFLAGS_RECURSIVE = 0x00000004;
enum DB_BINDFLAGS_OUTPUT = 0x00000008;
enum DB_BINDFLAGS_COLLECTION = 0x00000010;
enum DB_BINDFLAGS_OPENIFEXISTS = 0x00000020;
enum DB_BINDFLAGS_OVERWRITE = 0x00000040;
enum DB_BINDFLAGS_ISSTRUCTUREDDOCUMENT = 0x00000080;
enum DBPROPVAL_ORS_TABLE = 0x00000000;
enum DBPROPVAL_ORS_INDEX = 0x00000001;
enum DBPROPVAL_ORS_INTEGRATEDINDEX = 0x00000002;
enum DBPROPVAL_TC_DDL_LOCK = 0x00000010;
enum DBPROPVAL_ORS_STOREDPROC = 0x00000004;
enum DBPROPVAL_IN_ALLOWNULL = 0x00000000;
enum DBPROPVAL_OO_SINGLETON = 0x00000020;
enum DBPROPVAL_OS_AGR_AFTERSESSION = 0x00000008;
enum DBPROPVAL_CM_TRANSACTIONS = 0x00000001;
enum DBPROPVAL_TS_CARDINALITY = 0x00000001;
enum DBPROPVAL_TS_HISTOGRAM = 0x00000002;
enum DBPROPVAL_ORS_HISTOGRAM = 0x00000008;
enum MDPROPVAL_VISUAL_MODE_DEFAULT = 0x00000000;
enum MDPROPVAL_VISUAL_MODE_VISUAL = 0x00000001;
enum MDPROPVAL_VISUAL_MODE_VISUAL_OFF = 0x00000002;
enum DB_IMP_LEVEL_ANONYMOUS = 0x00000000;
enum DB_IMP_LEVEL_IDENTIFY = 0x00000001;
enum DB_IMP_LEVEL_IMPERSONATE = 0x00000002;
enum DB_IMP_LEVEL_DELEGATE = 0x00000003;
enum DBPROMPT_PROMPT = 0x00000001;
enum DBPROMPT_COMPLETE = 0x00000002;
enum DBPROMPT_COMPLETEREQUIRED = 0x00000003;
enum DBPROMPT_NOPROMPT = 0x00000004;
enum DB_PROT_LEVEL_NONE = 0x00000000;
enum DB_PROT_LEVEL_CONNECT = 0x00000001;
enum DB_PROT_LEVEL_CALL = 0x00000002;
enum DB_PROT_LEVEL_PKT = 0x00000003;
enum DB_PROT_LEVEL_PKT_INTEGRITY = 0x00000004;
enum DB_PROT_LEVEL_PKT_PRIVACY = 0x00000005;
enum DB_MODE_READ = 0x00000001;
enum DB_MODE_WRITE = 0x00000002;
enum DB_MODE_READWRITE = 0x00000003;
enum DB_MODE_SHARE_DENY_READ = 0x00000004;
enum DB_MODE_SHARE_DENY_WRITE = 0x00000008;
enum DB_MODE_SHARE_EXCLUSIVE = 0x0000000c;
enum DB_MODE_SHARE_DENY_NONE = 0x00000010;
enum DBCOMPUTEMODE_COMPUTED = 0x00000001;
enum DBCOMPUTEMODE_DYNAMIC = 0x00000002;
enum DBCOMPUTEMODE_NOTCOMPUTED = 0x00000003;
enum DBPROPVAL_DF_INITIALLY_DEFERRED = 0x00000001;
enum DBPROPVAL_DF_INITIALLY_IMMEDIATE = 0x00000002;
enum DBPROPVAL_DF_NOT_DEFERRABLE = 0x00000003;
enum DBPARAMTYPE_INPUT = 0x00000001;
enum DBPARAMTYPE_INPUTOUTPUT = 0x00000002;
enum DBPARAMTYPE_OUTPUT = 0x00000003;
enum DBPARAMTYPE_RETURNVALUE = 0x00000004;
enum DB_PT_UNKNOWN = 0x00000001;
enum DB_PT_PROCEDURE = 0x00000002;
enum DB_PT_FUNCTION = 0x00000003;
enum DB_REMOTE = 0x00000001;
enum DB_LOCAL_SHARED = 0x00000002;
enum DB_LOCAL_EXCLUSIVE = 0x00000003;
enum DB_COLLATION_ASC = 0x00000001;
enum DB_COLLATION_DESC = 0x00000002;
enum DB_UNSEARCHABLE = 0x00000001;
enum DB_LIKE_ONLY = 0x00000002;
enum DB_ALL_EXCEPT_LIKE = 0x00000003;
enum DB_SEARCHABLE = 0x00000004;
enum MDTREEOP_CHILDREN = 0x00000001;
enum MDTREEOP_SIBLINGS = 0x00000002;
enum MDTREEOP_PARENT = 0x00000004;
enum MDTREEOP_SELF = 0x00000008;
enum MDTREEOP_DESCENDANTS = 0x00000010;
enum MDTREEOP_ANCESTORS = 0x00000020;
enum MD_DIMTYPE_UNKNOWN = 0x00000000;
enum MD_DIMTYPE_TIME = 0x00000001;
enum MD_DIMTYPE_MEASURE = 0x00000002;
enum MD_DIMTYPE_OTHER = 0x00000003;
enum MDLEVEL_TYPE_UNKNOWN = 0x00000000;
enum MDLEVEL_TYPE_REGULAR = 0x00000000;
enum MDLEVEL_TYPE_ALL = 0x00000001;
enum MDLEVEL_TYPE_CALCULATED = 0x00000002;
enum MDLEVEL_TYPE_TIME = 0x00000004;
enum MDLEVEL_TYPE_RESERVED1 = 0x00000008;
enum MDLEVEL_TYPE_TIME_YEARS = 0x00000014;
enum MDLEVEL_TYPE_TIME_HALF_YEAR = 0x00000024;
enum MDLEVEL_TYPE_TIME_QUARTERS = 0x00000044;
enum MDLEVEL_TYPE_TIME_MONTHS = 0x00000084;
enum MDLEVEL_TYPE_TIME_WEEKS = 0x00000104;
enum MDLEVEL_TYPE_TIME_DAYS = 0x00000204;
enum MDLEVEL_TYPE_TIME_HOURS = 0x00000304;
enum MDLEVEL_TYPE_TIME_MINUTES = 0x00000404;
enum MDLEVEL_TYPE_TIME_SECONDS = 0x00000804;
enum MDLEVEL_TYPE_TIME_UNDEFINED = 0x00001004;
enum MDMEASURE_AGGR_UNKNOWN = 0x00000000;
enum MDMEASURE_AGGR_SUM = 0x00000001;
enum MDMEASURE_AGGR_COUNT = 0x00000002;
enum MDMEASURE_AGGR_MIN = 0x00000003;
enum MDMEASURE_AGGR_MAX = 0x00000004;
enum MDMEASURE_AGGR_AVG = 0x00000005;
enum MDMEASURE_AGGR_VAR = 0x00000006;
enum MDMEASURE_AGGR_STD = 0x00000007;
enum MDMEASURE_AGGR_CALCULATED = 0x0000007f;
enum MDPROP_MEMBER = 0x00000001;
enum MDPROP_CELL = 0x00000002;
enum MDMEMBER_TYPE_UNKNOWN = 0x00000000;
enum MDMEMBER_TYPE_REGULAR = 0x00000001;
enum MDMEMBER_TYPE_ALL = 0x00000002;
enum MDMEMBER_TYPE_MEASURE = 0x00000003;
enum MDMEMBER_TYPE_FORMULA = 0x00000004;
enum MDMEMBER_TYPE_RESERVE1 = 0x00000005;
enum MDMEMBER_TYPE_RESERVE2 = 0x00000006;
enum MDMEMBER_TYPE_RESERVE3 = 0x00000007;
enum MDMEMBER_TYPE_RESERVE4 = 0x00000008;
enum MDDISPINFO_DRILLED_DOWN = 0x00010000;
enum MDDISPINFO_PARENT_SAME_AS_PREV = 0x00020000;
enum DB_COUNTUNAVAILABLE = 0xffffffffffffffff;
enum MDFF_BOLD = 0x00000001;
enum MDFF_ITALIC = 0x00000002;
enum MDFF_UNDERLINE = 0x00000004;
enum MDFF_STRIKEOUT = 0x00000008;
enum MDAXIS_COLUMNS = 0x00000000;
enum MDAXIS_ROWS = 0x00000001;
enum MDAXIS_PAGES = 0x00000002;
enum MDAXIS_SECTIONS = 0x00000003;
enum MDAXIS_CHAPTERS = 0x00000004;
enum MDAXIS_SLICERS = 0xffffffff;
enum CRESTRICTIONS_DBSCHEMA_ASSERTIONS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_CATALOGS = 0x00000001;
enum CRESTRICTIONS_DBSCHEMA_CHARACTER_SETS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_COLLATIONS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_COLUMNS = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_CHECK_CONSTRAINTS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_CONSTRAINT_COLUMN_USAGE = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_CONSTRAINT_TABLE_USAGE = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_KEY_COLUMN_USAGE = 0x00000007;
enum CRESTRICTIONS_DBSCHEMA_REFERENTIAL_CONSTRAINTS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_TABLE_CONSTRAINTS = 0x00000007;
enum CRESTRICTIONS_DBSCHEMA_COLUMN_DOMAIN_USAGE = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_INDEXES = 0x00000005;
enum CRESTRICTIONS_DBSCHEMA_OBJECT_ACTIONS = 0x00000001;
enum CRESTRICTIONS_DBSCHEMA_OBJECTS = 0x00000001;
enum CRESTRICTIONS_DBSCHEMA_COLUMN_PRIVILEGES = 0x00000006;
enum CRESTRICTIONS_DBSCHEMA_TABLE_PRIVILEGES = 0x00000005;
enum CRESTRICTIONS_DBSCHEMA_USAGE_PRIVILEGES = 0x00000006;
enum CRESTRICTIONS_DBSCHEMA_PROCEDURES = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_SCHEMATA = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_SQL_LANGUAGES = 0x00000000;
enum CRESTRICTIONS_DBSCHEMA_STATISTICS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_TABLES = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_TRANSLATIONS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_PROVIDER_TYPES = 0x00000002;
enum CRESTRICTIONS_DBSCHEMA_VIEWS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_VIEW_COLUMN_USAGE = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_VIEW_TABLE_USAGE = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_PROCEDURE_PARAMETERS = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_FOREIGN_KEYS = 0x00000006;
enum CRESTRICTIONS_DBSCHEMA_PRIMARY_KEYS = 0x00000003;
enum CRESTRICTIONS_DBSCHEMA_PROCEDURE_COLUMNS = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_TABLES_INFO = 0x00000004;
enum CRESTRICTIONS_MDSCHEMA_CUBES = 0x00000003;
enum CRESTRICTIONS_MDSCHEMA_DIMENSIONS = 0x00000005;
enum CRESTRICTIONS_MDSCHEMA_HIERARCHIES = 0x00000006;
enum CRESTRICTIONS_MDSCHEMA_LEVELS = 0x00000007;
enum CRESTRICTIONS_MDSCHEMA_MEASURES = 0x00000005;
enum CRESTRICTIONS_MDSCHEMA_PROPERTIES = 0x00000009;
enum CRESTRICTIONS_MDSCHEMA_MEMBERS = 0x0000000c;
enum CRESTRICTIONS_DBSCHEMA_TRUSTEE = 0x00000004;
enum CRESTRICTIONS_DBSCHEMA_TABLE_STATISTICS = 0x00000007;
enum CRESTRICTIONS_DBSCHEMA_CHECK_CONSTRAINTS_BY_TABLE = 0x00000006;
enum CRESTRICTIONS_MDSCHEMA_FUNCTIONS = 0x00000004;
enum CRESTRICTIONS_MDSCHEMA_ACTIONS = 0x00000008;
enum CRESTRICTIONS_MDSCHEMA_COMMANDS = 0x00000005;
enum CRESTRICTIONS_MDSCHEMA_SETS = 0x00000005;
enum IDENTIFIER_SDK_MASK = 0xf0000000;
enum IDENTIFIER_SDK_ERROR = 0x10000000;
enum CLSID_CISimpleCommandCreator = GUID(0xc7b6c04a, 0xcbb5, 0x11d0, [0xbb, 0x4c, 0x0, 0xc0, 0x4f, 0xc2, 0xf4, 0x10]);
enum DBPROP_MSDAORA_DETERMINEKEYCOLUMNS = 0x00000001;
enum DBPROP_MSDAORA8_DETERMINEKEYCOLUMNS = 0x00000002;
enum PWPROP_OSPVALUE = 0x00000002;
enum STGM_COLLECTION = 0x00002000;
enum STGM_OUTPUT = 0x00008000;
enum STGM_OPEN = 0xffffffff80000000;
enum STGM_RECURSIVE = 0x01000000;
enum STGM_STRICTOPEN = 0x40000000;
enum KAGPROP_QUERYBASEDUPDATES = 0x00000002;
enum KAGPROP_MARSHALLABLE = 0x00000003;
enum KAGPROP_POSITIONONNEWROW = 0x00000004;
enum KAGPROP_IRowsetChangeExtInfo = 0x00000005;
enum KAGPROP_CURSOR = 0x00000006;
enum KAGPROP_CONCURRENCY = 0x00000007;
enum KAGPROP_BLOBSONFOCURSOR = 0x00000008;
enum KAGPROP_INCLUDENONEXACT = 0x00000009;
enum KAGPROP_FORCESSFIREHOSEMODE = 0x0000000a;
enum KAGPROP_FORCENOPARAMETERREBIND = 0x0000000b;
enum KAGPROP_FORCENOPREPARE = 0x0000000c;
enum KAGPROP_FORCENOREEXECUTE = 0x0000000d;
enum KAGPROP_ACCESSIBLEPROCEDURES = 0x00000002;
enum KAGPROP_ACCESSIBLETABLES = 0x00000003;
enum KAGPROP_ODBCSQLOPTIEF = 0x00000004;
enum KAGPROP_OJCAPABILITY = 0x00000005;
enum KAGPROP_PROCEDURES = 0x00000006;
enum KAGPROP_DRIVERNAME = 0x00000007;
enum KAGPROP_DRIVERVER = 0x00000008;
enum KAGPROP_DRIVERODBCVER = 0x00000009;
enum KAGPROP_LIKEESCAPECLAUSE = 0x0000000a;
enum KAGPROP_SPECIALCHARACTERS = 0x0000000b;
enum KAGPROP_MAXCOLUMNSINGROUPBY = 0x0000000c;
enum KAGPROP_MAXCOLUMNSININDEX = 0x0000000d;
enum KAGPROP_MAXCOLUMNSINORDERBY = 0x0000000e;
enum KAGPROP_MAXCOLUMNSINSELECT = 0x0000000f;
enum KAGPROP_MAXCOLUMNSINTABLE = 0x00000010;
enum KAGPROP_NUMERICFUNCTIONS = 0x00000011;
enum KAGPROP_ODBCSQLCONFORMANCE = 0x00000012;
enum KAGPROP_OUTERJOINS = 0x00000013;
enum KAGPROP_STRINGFUNCTIONS = 0x00000014;
enum KAGPROP_SYSTEMFUNCTIONS = 0x00000015;
enum KAGPROP_TIMEDATEFUNCTIONS = 0x00000016;
enum KAGPROP_FILEUSAGE = 0x00000017;
enum KAGPROP_ACTIVESTATEMENTS = 0x00000018;
enum KAGPROP_AUTH_TRUSTEDCONNECTION = 0x00000002;
enum KAGPROP_AUTH_SERVERINTEGRATED = 0x00000003;
enum KAGPROPVAL_CONCUR_ROWVER = 0x00000001;
enum KAGPROPVAL_CONCUR_VALUES = 0x00000002;
enum KAGPROPVAL_CONCUR_LOCK = 0x00000004;
enum KAGPROPVAL_CONCUR_READ_ONLY = 0x00000008;
enum ODBCVER = 0x00000380;
enum ODBC_ADD_DSN = 0x00000001;
enum ODBC_CONFIG_DSN = 0x00000002;
enum ODBC_REMOVE_DSN = 0x00000003;
enum ODBC_ADD_SYS_DSN = 0x00000004;
enum ODBC_CONFIG_SYS_DSN = 0x00000005;
enum ODBC_REMOVE_SYS_DSN = 0x00000006;
enum ODBC_REMOVE_DEFAULT_DSN = 0x00000007;
enum ODBC_INSTALL_INQUIRY = 0x00000001;
enum ODBC_INSTALL_COMPLETE = 0x00000002;
enum ODBC_INSTALL_DRIVER = 0x00000001;
enum ODBC_REMOVE_DRIVER = 0x00000002;
enum ODBC_CONFIG_DRIVER = 0x00000003;
enum ODBC_CONFIG_DRIVER_MAX = 0x00000064;
enum ODBC_BOTH_DSN = 0x00000000;
enum ODBC_USER_DSN = 0x00000001;
enum ODBC_SYSTEM_DSN = 0x00000002;
enum ODBC_ERROR_GENERAL_ERR = 0x00000001;
enum ODBC_ERROR_INVALID_BUFF_LEN = 0x00000002;
enum ODBC_ERROR_INVALID_HWND = 0x00000003;
enum ODBC_ERROR_INVALID_STR = 0x00000004;
enum ODBC_ERROR_INVALID_REQUEST_TYPE = 0x00000005;
enum ODBC_ERROR_COMPONENT_NOT_FOUND = 0x00000006;
enum ODBC_ERROR_INVALID_NAME = 0x00000007;
enum ODBC_ERROR_INVALID_KEYWORD_VALUE = 0x00000008;
enum ODBC_ERROR_INVALID_DSN = 0x00000009;
enum ODBC_ERROR_INVALID_INF = 0x0000000a;
enum ODBC_ERROR_REQUEST_FAILED = 0x0000000b;
enum ODBC_ERROR_INVALID_PATH = 0x0000000c;
enum ODBC_ERROR_LOAD_LIB_FAILED = 0x0000000d;
enum ODBC_ERROR_INVALID_PARAM_SEQUENCE = 0x0000000e;
enum ODBC_ERROR_INVALID_LOG_FILE = 0x0000000f;
enum ODBC_ERROR_USER_CANCELED = 0x00000010;
enum ODBC_ERROR_USAGE_UPDATE_FAILED = 0x00000011;
enum ODBC_ERROR_CREATE_DSN_FAILED = 0x00000012;
enum ODBC_ERROR_WRITING_SYSINFO_FAILED = 0x00000013;
enum ODBC_ERROR_REMOVE_DSN_FAILED = 0x00000014;
enum ODBC_ERROR_OUT_OF_MEM = 0x00000015;
enum ODBC_ERROR_OUTPUT_STRING_TRUNCATED = 0x00000016;
enum ODBC_ERROR_NOTRANINFO = 0x00000017;
enum ODBC_ERROR_MAX = 0x00000017;
enum SQL_MAX_SQLSERVERNAME = 0x00000080;
enum SQL_COPT_SS_BASE = 0x000004b0;
enum SQL_COPT_SS_REMOTE_PWD = 0x000004b1;
enum SQL_COPT_SS_USE_PROC_FOR_PREP = 0x000004b2;
enum SQL_COPT_SS_INTEGRATED_SECURITY = 0x000004b3;
enum SQL_COPT_SS_PRESERVE_CURSORS = 0x000004b4;
enum SQL_COPT_SS_USER_DATA = 0x000004b5;
enum SQL_COPT_SS_FALLBACK_CONNECT = 0x000004ba;
enum SQL_COPT_SS_PERF_DATA = 0x000004bb;
enum SQL_COPT_SS_PERF_DATA_LOG = 0x000004bc;
enum SQL_COPT_SS_PERF_QUERY_INTERVAL = 0x000004bd;
enum SQL_COPT_SS_PERF_QUERY_LOG = 0x000004be;
enum SQL_COPT_SS_PERF_QUERY = 0x000004bf;
enum SQL_COPT_SS_PERF_DATA_LOG_NOW = 0x000004c0;
enum SQL_COPT_SS_QUOTED_IDENT = 0x000004c1;
enum SQL_COPT_SS_ANSI_NPW = 0x000004c2;
enum SQL_COPT_SS_BCP = 0x000004c3;
enum SQL_COPT_SS_TRANSLATE = 0x000004c4;
enum SQL_COPT_SS_ATTACHDBFILENAME = 0x000004c5;
enum SQL_COPT_SS_CONCAT_NULL = 0x000004c6;
enum SQL_COPT_SS_ENCRYPT = 0x000004c7;
enum SQL_COPT_SS_MAX_USED = 0x000004c7;
enum SQL_SOPT_SS_BASE = 0x000004c9;
enum SQL_SOPT_SS_TEXTPTR_LOGGING = 0x000004c9;
enum SQL_SOPT_SS_CURRENT_COMMAND = 0x000004ca;
enum SQL_SOPT_SS_HIDDEN_COLUMNS = 0x000004cb;
enum SQL_SOPT_SS_NOBROWSETABLE = 0x000004cc;
enum SQL_SOPT_SS_REGIONALIZE = 0x000004cd;
enum SQL_SOPT_SS_CURSOR_OPTIONS = 0x000004ce;
enum SQL_SOPT_SS_NOCOUNT_STATUS = 0x000004cf;
enum SQL_SOPT_SS_DEFER_PREPARE = 0x000004d0;
enum SQL_SOPT_SS_MAX_USED = 0x000004d0;
enum SQL_COPT_SS_BASE_EX = 0x000004d8;
enum SQL_COPT_SS_BROWSE_CONNECT = 0x000004d9;
enum SQL_COPT_SS_BROWSE_SERVER = 0x000004da;
enum SQL_COPT_SS_WARN_ON_CP_ERROR = 0x000004db;
enum SQL_COPT_SS_CONNECTION_DEAD = 0x000004dc;
enum SQL_COPT_SS_BROWSE_CACHE_DATA = 0x000004dd;
enum SQL_COPT_SS_RESET_CONNECTION = 0x000004de;
enum SQL_COPT_SS_EX_MAX_USED = 0x000004de;
enum SQL_UP_OFF = 0x00000000;
enum SQL_UP_ON = 0x00000001;
enum SQL_UP_ON_DROP = 0x00000002;
enum SQL_UP_DEFAULT = 0x00000001;
enum SQL_IS_OFF = 0x00000000;
enum SQL_IS_ON = 0x00000001;
enum SQL_IS_DEFAULT = 0x00000000;
enum SQL_PC_OFF = 0x00000000;
enum SQL_PC_ON = 0x00000001;
enum SQL_PC_DEFAULT = 0x00000000;
enum SQL_XL_OFF = 0x00000000;
enum SQL_XL_ON = 0x00000001;
enum SQL_XL_DEFAULT = 0x00000001;
enum SQL_FB_OFF = 0x00000000;
enum SQL_FB_ON = 0x00000001;
enum SQL_FB_DEFAULT = 0x00000000;
enum SQL_BCP_OFF = 0x00000000;
enum SQL_BCP_ON = 0x00000001;
enum SQL_BCP_DEFAULT = 0x00000000;
enum SQL_QI_OFF = 0x00000000;
enum SQL_QI_ON = 0x00000001;
enum SQL_QI_DEFAULT = 0x00000001;
enum SQL_AD_OFF = 0x00000000;
enum SQL_AD_ON = 0x00000001;
enum SQL_AD_DEFAULT = 0x00000001;
enum SQL_CN_OFF = 0x00000000;
enum SQL_CN_ON = 0x00000001;
enum SQL_CN_DEFAULT = 0x00000001;
enum SQL_TL_OFF = 0x00000000;
enum SQL_TL_ON = 0x00000001;
enum SQL_TL_DEFAULT = 0x00000001;
enum SQL_HC_OFF = 0x00000000;
enum SQL_HC_ON = 0x00000001;
enum SQL_HC_DEFAULT = 0x00000000;
enum SQL_NB_OFF = 0x00000000;
enum SQL_NB_ON = 0x00000001;
enum SQL_NB_DEFAULT = 0x00000000;
enum SQL_RE_OFF = 0x00000000;
enum SQL_RE_ON = 0x00000001;
enum SQL_RE_DEFAULT = 0x00000000;
enum SQL_CO_OFF = 0x00000000;
enum SQL_CO_FFO = 0x00000001;
enum SQL_CO_AF = 0x00000002;
enum SQL_CO_FIREHOSE_AF = 0x00000004;
enum SQL_CO_DEFAULT = 0x00000000;
enum SQL_NC_OFF = 0x00000000;
enum SQL_NC_ON = 0x00000001;
enum SQL_DP_OFF = 0x00000000;
enum SQL_DP_ON = 0x00000001;
enum SQL_EN_OFF = 0x00000000;
enum SQL_EN_ON = 0x00000001;
enum SQL_MORE_INFO_NO = 0x00000000;
enum SQL_MORE_INFO_YES = 0x00000001;
enum SQL_CACHE_DATA_NO = 0x00000000;
enum SQL_CACHE_DATA_YES = 0x00000001;
enum SQL_RESET_YES = 0x00000001;
enum SQL_WARN_NO = 0x00000000;
enum SQL_WARN_YES = 0x00000001;
enum SQL_CURSOR_FAST_FORWARD_ONLY = 0x00000008;
enum SQL_CA_SS_BASE = 0x000004b0;
enum SQL_CA_SS_COLUMN_SSTYPE = 0x000004b0;
enum SQL_CA_SS_COLUMN_UTYPE = 0x000004b1;
enum SQL_CA_SS_NUM_ORDERS = 0x000004b2;
enum SQL_CA_SS_COLUMN_ORDER = 0x000004b3;
enum SQL_CA_SS_COLUMN_VARYLEN = 0x000004b4;
enum SQL_CA_SS_NUM_COMPUTES = 0x000004b5;
enum SQL_CA_SS_COMPUTE_ID = 0x000004b6;
enum SQL_CA_SS_COMPUTE_BYLIST = 0x000004b7;
enum SQL_CA_SS_COLUMN_ID = 0x000004b8;
enum SQL_CA_SS_COLUMN_OP = 0x000004b9;
enum SQL_CA_SS_COLUMN_SIZE = 0x000004ba;
enum SQL_CA_SS_COLUMN_HIDDEN = 0x000004bb;
enum SQL_CA_SS_COLUMN_KEY = 0x000004bc;
enum SQL_CA_SS_COLUMN_COLLATION = 0x000004be;
enum SQL_CA_SS_VARIANT_TYPE = 0x000004bf;
enum SQL_CA_SS_VARIANT_SQL_TYPE = 0x000004c0;
enum SQL_CA_SS_VARIANT_SERVER_TYPE = 0x000004c1;
enum SQL_CA_SS_MAX_USED = 0x000004c2;
enum SQLTEXT = 0x00000023;
enum SQLVARBINARY = 0x00000025;
enum SQLINTN = 0x00000026;
enum SQLVARCHAR = 0x00000027;
enum SQLBINARY = 0x0000002d;
enum SQLIMAGE = 0x00000022;
enum SQLCHARACTER = 0x0000002f;
enum SQLINT1 = 0x00000030;
enum SQLBIT = 0x00000032;
enum SQLINT2 = 0x00000034;
enum SQLINT4 = 0x00000038;
enum SQLMONEY = 0x0000003c;
enum SQLDATETIME = 0x0000003d;
enum SQLFLT8 = 0x0000003e;
enum SQLFLTN = 0x0000006d;
enum SQLMONEYN = 0x0000006e;
enum SQLDATETIMN = 0x0000006f;
enum SQLFLT4 = 0x0000003b;
enum SQLMONEY4 = 0x0000007a;
enum SQLDATETIM4 = 0x0000003a;
enum SQLDECIMAL = 0x0000006a;
enum SQLNUMERIC = 0x0000006c;
enum SQLUNIQUEID = 0x00000024;
enum SQLBIGCHAR = 0x000000af;
enum SQLBIGVARCHAR = 0x000000a7;
enum SQLBIGBINARY = 0x000000ad;
enum SQLBIGVARBINARY = 0x000000a5;
enum SQLBITN = 0x00000068;
enum SQLNCHAR = 0x000000ef;
enum SQLNVARCHAR = 0x000000e7;
enum SQLNTEXT = 0x00000063;
enum SQLINT8 = 0x0000007f;
enum SQLVARIANT = 0x00000062;
enum SQLudtBINARY = 0x00000003;
enum SQLudtBIT = 0x00000010;
enum SQLudtBITN = 0x00000000;
enum SQLudtCHAR = 0x00000001;
enum SQLudtDATETIM4 = 0x00000016;
enum SQLudtDATETIME = 0x0000000c;
enum SQLudtDATETIMN = 0x0000000f;
enum SQLudtDECML = 0x00000018;
enum SQLudtDECMLN = 0x0000001a;
enum SQLudtFLT4 = 0x00000017;
enum SQLudtFLT8 = 0x00000008;
enum SQLudtFLTN = 0x0000000e;
enum SQLudtIMAGE = 0x00000014;
enum SQLudtINT1 = 0x00000005;
enum SQLudtINT2 = 0x00000006;
enum SQLudtINT4 = 0x00000007;
enum SQLudtINTN = 0x0000000d;
enum SQLudtMONEY = 0x0000000b;
enum SQLudtMONEY4 = 0x00000015;
enum SQLudtMONEYN = 0x00000011;
enum SQLudtNUM = 0x0000000a;
enum SQLudtNUMN = 0x00000019;
enum SQLudtSYSNAME = 0x00000012;
enum SQLudtTEXT = 0x00000013;
enum SQLudtTIMESTAMP = 0x00000050;
enum SQLudtUNIQUEIDENTIFIER = 0x00000000;
enum SQLudtVARBINARY = 0x00000004;
enum SQLudtVARCHAR = 0x00000002;
enum MIN_USER_DATATYPE = 0x00000100;
enum SQLAOPSTDEV = 0x00000030;
enum SQLAOPSTDEVP = 0x00000031;
enum SQLAOPVAR = 0x00000032;
enum SQLAOPVARP = 0x00000033;
enum SQLAOPCNT = 0x0000004b;
enum SQLAOPSUM = 0x0000004d;
enum SQLAOPAVG = 0x0000004f;
enum SQLAOPMIN = 0x00000051;
enum SQLAOPMAX = 0x00000052;
enum SQLAOPANY = 0x00000053;
enum SQLAOPNOOP = 0x00000056;
enum SQL_INFO_SS_FIRST = 0x000004af;
enum SQL_INFO_SS_NETLIB_NAMEW = 0x000004af;
enum SQL_INFO_SS_NETLIB_NAMEA = 0x000004b0;
enum SQL_INFO_SS_MAX_USED = 0x000004b0;
enum SQL_INFO_SS_NETLIB_NAME = 0x000004af;
enum SQL_SS_VARIANT = 0xffffffffffffff6a;
enum SQL_DIAG_SS_BASE = 0xfffffffffffffb82;
enum SQL_DIAG_SS_MSGSTATE = 0xfffffffffffffb82;
enum SQL_DIAG_SS_SEVERITY = 0xfffffffffffffb81;
enum SQL_DIAG_SS_SRVNAME = 0xfffffffffffffb80;
enum SQL_DIAG_SS_PROCNAME = 0xfffffffffffffb7f;
enum SQL_DIAG_SS_LINE = 0xfffffffffffffb7e;
enum SQL_DIAG_DFC_SS_BASE = 0xffffffffffffff38;
enum SQL_DIAG_DFC_SS_ALTER_DATABASE = 0xffffffffffffff38;
enum SQL_DIAG_DFC_SS_CHECKPOINT = 0xffffffffffffff37;
enum SQL_DIAG_DFC_SS_CONDITION = 0xffffffffffffff36;
enum SQL_DIAG_DFC_SS_CREATE_DATABASE = 0xffffffffffffff35;
enum SQL_DIAG_DFC_SS_CREATE_DEFAULT = 0xffffffffffffff34;
enum SQL_DIAG_DFC_SS_CREATE_PROCEDURE = 0xffffffffffffff33;
enum SQL_DIAG_DFC_SS_CREATE_RULE = 0xffffffffffffff32;
enum SQL_DIAG_DFC_SS_CREATE_TRIGGER = 0xffffffffffffff31;
enum SQL_DIAG_DFC_SS_CURSOR_DECLARE = 0xffffffffffffff30;
enum SQL_DIAG_DFC_SS_CURSOR_OPEN = 0xffffffffffffff2f;
enum SQL_DIAG_DFC_SS_CURSOR_FETCH = 0xffffffffffffff2e;
enum SQL_DIAG_DFC_SS_CURSOR_CLOSE = 0xffffffffffffff2d;
enum SQL_DIAG_DFC_SS_DEALLOCATE_CURSOR = 0xffffffffffffff2c;
enum SQL_DIAG_DFC_SS_DBCC = 0xffffffffffffff2b;
enum SQL_DIAG_DFC_SS_DISK = 0xffffffffffffff2a;
enum SQL_DIAG_DFC_SS_DROP_DATABASE = 0xffffffffffffff29;
enum SQL_DIAG_DFC_SS_DROP_DEFAULT = 0xffffffffffffff28;
enum SQL_DIAG_DFC_SS_DROP_PROCEDURE = 0xffffffffffffff27;
enum SQL_DIAG_DFC_SS_DROP_RULE = 0xffffffffffffff26;
enum SQL_DIAG_DFC_SS_DROP_TRIGGER = 0xffffffffffffff25;
enum SQL_DIAG_DFC_SS_DUMP_DATABASE = 0xffffffffffffff24;
enum SQL_DIAG_DFC_SS_DUMP_TABLE = 0xffffffffffffff23;
enum SQL_DIAG_DFC_SS_DUMP_TRANSACTION = 0xffffffffffffff22;
enum SQL_DIAG_DFC_SS_GOTO = 0xffffffffffffff21;
enum SQL_DIAG_DFC_SS_INSERT_BULK = 0xffffffffffffff20;
enum SQL_DIAG_DFC_SS_KILL = 0xffffffffffffff1f;
enum SQL_DIAG_DFC_SS_LOAD_DATABASE = 0xffffffffffffff1e;
enum SQL_DIAG_DFC_SS_LOAD_HEADERONLY = 0xffffffffffffff1d;
enum SQL_DIAG_DFC_SS_LOAD_TABLE = 0xffffffffffffff1c;
enum SQL_DIAG_DFC_SS_LOAD_TRANSACTION = 0xffffffffffffff1b;
enum SQL_DIAG_DFC_SS_PRINT = 0xffffffffffffff1a;
enum SQL_DIAG_DFC_SS_RAISERROR = 0xffffffffffffff19;
enum SQL_DIAG_DFC_SS_READTEXT = 0xffffffffffffff18;
enum SQL_DIAG_DFC_SS_RECONFIGURE = 0xffffffffffffff17;
enum SQL_DIAG_DFC_SS_RETURN = 0xffffffffffffff16;
enum SQL_DIAG_DFC_SS_SELECT_INTO = 0xffffffffffffff15;
enum SQL_DIAG_DFC_SS_SET = 0xffffffffffffff14;
enum SQL_DIAG_DFC_SS_SET_IDENTITY_INSERT = 0xffffffffffffff13;
enum SQL_DIAG_DFC_SS_SET_ROW_COUNT = 0xffffffffffffff12;
enum SQL_DIAG_DFC_SS_SET_STATISTICS = 0xffffffffffffff11;
enum SQL_DIAG_DFC_SS_SET_TEXTSIZE = 0xffffffffffffff10;
enum SQL_DIAG_DFC_SS_SETUSER = 0xffffffffffffff0f;
enum SQL_DIAG_DFC_SS_SHUTDOWN = 0xffffffffffffff0e;
enum SQL_DIAG_DFC_SS_TRANS_BEGIN = 0xffffffffffffff0d;
enum SQL_DIAG_DFC_SS_TRANS_COMMIT = 0xffffffffffffff0c;
enum SQL_DIAG_DFC_SS_TRANS_PREPARE = 0xffffffffffffff0b;
enum SQL_DIAG_DFC_SS_TRANS_ROLLBACK = 0xffffffffffffff0a;
enum SQL_DIAG_DFC_SS_TRANS_SAVE = 0xffffffffffffff09;
enum SQL_DIAG_DFC_SS_TRUNCATE_TABLE = 0xffffffffffffff08;
enum SQL_DIAG_DFC_SS_UPDATE_STATISTICS = 0xffffffffffffff07;
enum SQL_DIAG_DFC_SS_UPDATETEXT = 0xffffffffffffff06;
enum SQL_DIAG_DFC_SS_USE = 0xffffffffffffff05;
enum SQL_DIAG_DFC_SS_WAITFOR = 0xffffffffffffff04;
enum SQL_DIAG_DFC_SS_WRITETEXT = 0xffffffffffffff03;
enum SQL_DIAG_DFC_SS_DENY = 0xffffffffffffff02;
enum SQL_DIAG_DFC_SS_SET_XCTLVL = 0xffffffffffffff01;
enum EX_ANY = 0x00000000;
enum EX_INFO = 0x0000000a;
enum EX_MAXISEVERITY = 0x0000000a;
enum EX_MISSING = 0x0000000b;
enum EX_TYPE = 0x0000000c;
enum EX_DEADLOCK = 0x0000000d;
enum EX_PERMIT = 0x0000000e;
enum EX_SYNTAX = 0x0000000f;
enum EX_USER = 0x00000010;
enum EX_RESOURCE = 0x00000011;
enum EX_INTOK = 0x00000012;
enum MAXUSEVERITY = 0x00000012;
enum EX_LIMIT = 0x00000013;
enum EX_CMDFATAL = 0x00000014;
enum MINFATALERR = 0x00000014;
enum EX_DBFATAL = 0x00000015;
enum EX_TABCORRUPT = 0x00000016;
enum EX_DBCORRUPT = 0x00000017;
enum EX_HARDWARE = 0x00000018;
enum EX_CONTROL = 0x00000019;
enum DBMAXCHAR = 0x00001f41;
enum MAXNAME = 0x00000081;
enum MAXNUMERICLEN = 0x00000010;
enum SQL_PERF_START = 0x00000001;
enum SQL_PERF_STOP = 0x00000002;
enum SQL_SS_DL_DEFAULT = "STATS.LOG";
enum SQL_SS_QL_DEFAULT = "QUERY.LOG";
enum SQL_SS_QI_DEFAULT = 0x00007530;
enum SUCCEED = 0x00000001;
enum FAIL = 0x00000000;
enum SUCCEED_ABORT = 0x00000002;
enum SUCCEED_ASYNC = 0x00000003;
enum DB_IN = 0x00000001;
enum DB_OUT = 0x00000002;
enum BCPMAXERRS = 0x00000001;
enum BCPFIRST = 0x00000002;
enum BCPLAST = 0x00000003;
enum BCPBATCH = 0x00000004;
enum BCPKEEPNULLS = 0x00000005;
enum BCPABORT = 0x00000006;
enum BCPODBC = 0x00000007;
enum BCPKEEPIDENTITY = 0x00000008;
enum BCP6xFILEFMT = 0x00000009;
enum BCPHINTSA = 0x0000000a;
enum BCPHINTSW = 0x0000000b;
enum BCPFILECP = 0x0000000c;
enum BCPUNICODEFILE = 0x0000000d;
enum BCPTEXTFILE = 0x0000000e;
enum BCPFILEFMT = 0x0000000f;
enum BCPFILECP_ACP = 0x00000000;
enum BCPFILECP_OEMCP = 0x00000001;
enum BCPFILECP_RAW = 0xffffffffffffffff;
enum SQL_VARLEN_DATA = 0xfffffffffffffff6;
enum BCPHINTS = 0x0000000b;
enum BCP_FMT_TYPE = 0x00000001;
enum BCP_FMT_INDICATOR_LEN = 0x00000002;
enum BCP_FMT_DATA_LEN = 0x00000003;
enum BCP_FMT_TERMINATOR = 0x00000004;
enum BCP_FMT_SERVER_COL = 0x00000005;
enum BCP_FMT_COLLATION = 0x00000006;
enum BCP_FMT_COLLATION_ID = 0x00000007;
enum SQL_FAST_CONNECT = 0x000004b0;
enum SQL_FC_OFF = 0x00000000;
enum SQL_FC_ON = 0x00000001;
enum SQL_FC_DEFAULT = 0x00000000;
enum SQL_COPT_SS_ANSI_OEM = 0x000004b6;
enum SQL_AO_OFF = 0x00000000;
enum SQL_AO_ON = 0x00000001;
enum SQL_AO_DEFAULT = 0x00000000;
enum SQL_REMOTE_PWD = 0x000004b1;
enum SQL_USE_PROCEDURE_FOR_PREPARE = 0x000004b2;
enum SQL_INTEGRATED_SECURITY = 0x000004b3;
enum SQL_PRESERVE_CURSORS = 0x000004b4;
enum SQL_TEXTPTR_LOGGING = 0x000004c9;
enum SQLDECIMALN = 0x0000006a;
enum SQLNUMERICN = 0x0000006c;
enum DB_E_BOGUS = 0xffffffff80040eff;
enum DB_E_BADACCESSORHANDLE = 0xffffffff80040e00;
enum DB_E_ROWLIMITEXCEEDED = 0xffffffff80040e01;
enum DB_E_READONLYACCESSOR = 0xffffffff80040e02;
enum DB_E_SCHEMAVIOLATION = 0xffffffff80040e03;
enum DB_E_BADROWHANDLE = 0xffffffff80040e04;
enum DB_E_OBJECTOPEN = 0xffffffff80040e05;
enum DB_E_BADCHAPTER = 0xffffffff80040e06;
enum DB_E_CANTCONVERTVALUE = 0xffffffff80040e07;
enum DB_E_BADBINDINFO = 0xffffffff80040e08;
enum DB_SEC_E_PERMISSIONDENIED = 0xffffffff80040e09;
enum DB_E_NOTAREFERENCECOLUMN = 0xffffffff80040e0a;
enum DB_E_LIMITREJECTED = 0xffffffff80040e0b;
enum DB_E_NOCOMMAND = 0xffffffff80040e0c;
enum DB_E_COSTLIMIT = 0xffffffff80040e0d;
enum DB_E_BADBOOKMARK = 0xffffffff80040e0e;
enum DB_E_BADLOCKMODE = 0xffffffff80040e0f;
enum DB_E_PARAMNOTOPTIONAL = 0xffffffff80040e10;
enum DB_E_BADCOLUMNID = 0xffffffff80040e11;
enum DB_E_BADRATIO = 0xffffffff80040e12;
enum DB_E_BADVALUES = 0xffffffff80040e13;
enum DB_E_ERRORSINCOMMAND = 0xffffffff80040e14;
enum DB_E_CANTCANCEL = 0xffffffff80040e15;
enum DB_E_DIALECTNOTSUPPORTED = 0xffffffff80040e16;
enum DB_E_DUPLICATEDATASOURCE = 0xffffffff80040e17;
enum DB_E_CANNOTRESTART = 0xffffffff80040e18;
enum DB_E_NOTFOUND = 0xffffffff80040e19;
enum DB_E_NEWLYINSERTED = 0xffffffff80040e1b;
enum DB_E_CANNOTFREE = 0xffffffff80040e1a;
enum DB_E_GOALREJECTED = 0xffffffff80040e1c;
enum DB_E_UNSUPPORTEDCONVERSION = 0xffffffff80040e1d;
enum DB_E_BADSTARTPOSITION = 0xffffffff80040e1e;
enum DB_E_NOQUERY = 0xffffffff80040e1f;
enum DB_E_NOTREENTRANT = 0xffffffff80040e20;
enum DB_E_ERRORSOCCURRED = 0xffffffff80040e21;
enum DB_E_NOAGGREGATION = 0xffffffff80040e22;
enum DB_E_DELETEDROW = 0xffffffff80040e23;
enum DB_E_CANTFETCHBACKWARDS = 0xffffffff80040e24;
enum DB_E_ROWSNOTRELEASED = 0xffffffff80040e25;
enum DB_E_BADSTORAGEFLAG = 0xffffffff80040e26;
enum DB_E_BADCOMPAREOP = 0xffffffff80040e27;
enum DB_E_BADSTATUSVALUE = 0xffffffff80040e28;
enum DB_E_CANTSCROLLBACKWARDS = 0xffffffff80040e29;
enum DB_E_BADREGIONHANDLE = 0xffffffff80040e2a;
enum DB_E_NONCONTIGUOUSRANGE = 0xffffffff80040e2b;
enum DB_E_INVALIDTRANSITION = 0xffffffff80040e2c;
enum DB_E_NOTASUBREGION = 0xffffffff80040e2d;
enum DB_E_MULTIPLESTATEMENTS = 0xffffffff80040e2e;
enum DB_E_INTEGRITYVIOLATION = 0xffffffff80040e2f;
enum DB_E_BADTYPENAME = 0xffffffff80040e30;
enum DB_E_ABORTLIMITREACHED = 0xffffffff80040e31;
enum DB_E_ROWSETINCOMMAND = 0xffffffff80040e32;
enum DB_E_CANTTRANSLATE = 0xffffffff80040e33;
enum DB_E_DUPLICATEINDEXID = 0xffffffff80040e34;
enum DB_E_NOINDEX = 0xffffffff80040e35;
enum DB_E_INDEXINUSE = 0xffffffff80040e36;
enum DB_E_NOTABLE = 0xffffffff80040e37;
enum DB_E_CONCURRENCYVIOLATION = 0xffffffff80040e38;
enum DB_E_BADCOPY = 0xffffffff80040e39;
enum DB_E_BADPRECISION = 0xffffffff80040e3a;
enum DB_E_BADSCALE = 0xffffffff80040e3b;
enum DB_E_BADTABLEID = 0xffffffff80040e3c;
enum DB_E_BADID = 0xffffffff80040e3c;
enum DB_E_BADTYPE = 0xffffffff80040e3d;
enum DB_E_DUPLICATECOLUMNID = 0xffffffff80040e3e;
enum DB_E_DUPLICATETABLEID = 0xffffffff80040e3f;
enum DB_E_TABLEINUSE = 0xffffffff80040e40;
enum DB_E_NOLOCALE = 0xffffffff80040e41;
enum DB_E_BADRECORDNUM = 0xffffffff80040e42;
enum DB_E_BOOKMARKSKIPPED = 0xffffffff80040e43;
enum DB_E_BADPROPERTYVALUE = 0xffffffff80040e44;
enum DB_E_INVALID = 0xffffffff80040e45;
enum DB_E_BADACCESSORFLAGS = 0xffffffff80040e46;
enum DB_E_BADSTORAGEFLAGS = 0xffffffff80040e47;
enum DB_E_BYREFACCESSORNOTSUPPORTED = 0xffffffff80040e48;
enum DB_E_NULLACCESSORNOTSUPPORTED = 0xffffffff80040e49;
enum DB_E_NOTPREPARED = 0xffffffff80040e4a;
enum DB_E_BADACCESSORTYPE = 0xffffffff80040e4b;
enum DB_E_WRITEONLYACCESSOR = 0xffffffff80040e4c;
enum DB_SEC_E_AUTH_FAILED = 0xffffffff80040e4d;
enum DB_E_CANCELED = 0xffffffff80040e4e;
enum DB_E_CHAPTERNOTRELEASED = 0xffffffff80040e4f;
enum DB_E_BADSOURCEHANDLE = 0xffffffff80040e50;
enum DB_E_PARAMUNAVAILABLE = 0xffffffff80040e51;
enum DB_E_ALREADYINITIALIZED = 0xffffffff80040e52;
enum DB_E_NOTSUPPORTED = 0xffffffff80040e53;
enum DB_E_MAXPENDCHANGESEXCEEDED = 0xffffffff80040e54;
enum DB_E_BADORDINAL = 0xffffffff80040e55;
enum DB_E_PENDINGCHANGES = 0xffffffff80040e56;
enum DB_E_DATAOVERFLOW = 0xffffffff80040e57;
enum DB_E_BADHRESULT = 0xffffffff80040e58;
enum DB_E_BADLOOKUPID = 0xffffffff80040e59;
enum DB_E_BADDYNAMICERRORID = 0xffffffff80040e5a;
enum DB_E_PENDINGINSERT = 0xffffffff80040e5b;
enum DB_E_BADCONVERTFLAG = 0xffffffff80040e5c;
enum DB_E_BADPARAMETERNAME = 0xffffffff80040e5d;
enum DB_E_MULTIPLESTORAGE = 0xffffffff80040e5e;
enum DB_E_CANTFILTER = 0xffffffff80040e5f;
enum DB_E_CANTORDER = 0xffffffff80040e60;
enum MD_E_BADTUPLE = 0xffffffff80040e61;
enum MD_E_BADCOORDINATE = 0xffffffff80040e62;
enum MD_E_INVALIDAXIS = 0xffffffff80040e63;
enum MD_E_INVALIDCELLRANGE = 0xffffffff80040e64;
enum DB_E_NOCOLUMN = 0xffffffff80040e65;
enum DB_E_COMMANDNOTPERSISTED = 0xffffffff80040e67;
enum DB_E_DUPLICATEID = 0xffffffff80040e68;
enum DB_E_OBJECTCREATIONLIMITREACHED = 0xffffffff80040e69;
enum DB_E_BADINDEXID = 0xffffffff80040e72;
enum DB_E_BADINITSTRING = 0xffffffff80040e73;
enum DB_E_NOPROVIDERSREGISTERED = 0xffffffff80040e74;
enum DB_E_MISMATCHEDPROVIDER = 0xffffffff80040e75;
enum DB_E_BADCOMMANDID = 0xffffffff80040e76;
enum SEC_E_PERMISSIONDENIED = 0xffffffff80040e09;
enum SEC_E_BADTRUSTEEID = 0xffffffff80040e6a;
enum SEC_E_NOTRUSTEEID = 0xffffffff80040e6b;
enum SEC_E_NOMEMBERSHIPSUPPORT = 0xffffffff80040e6c;
enum SEC_E_INVALIDOBJECT = 0xffffffff80040e6d;
enum SEC_E_NOOWNER = 0xffffffff80040e6e;
enum SEC_E_INVALIDACCESSENTRYLIST = 0xffffffff80040e6f;
enum SEC_E_INVALIDOWNER = 0xffffffff80040e70;
enum SEC_E_INVALIDACCESSENTRY = 0xffffffff80040e71;
enum DB_E_BADCONSTRAINTTYPE = 0xffffffff80040e77;
enum DB_E_BADCONSTRAINTFORM = 0xffffffff80040e78;
enum DB_E_BADDEFERRABILITY = 0xffffffff80040e79;
enum DB_E_BADMATCHTYPE = 0xffffffff80040e80;
enum DB_E_BADUPDATEDELETERULE = 0xffffffff80040e8a;
enum DB_E_BADCONSTRAINTID = 0xffffffff80040e8b;
enum DB_E_BADCOMMANDFLAGS = 0xffffffff80040e8c;
enum DB_E_OBJECTMISMATCH = 0xffffffff80040e8d;
enum DB_E_NOSOURCEOBJECT = 0xffffffff80040e91;
enum DB_E_RESOURCELOCKED = 0xffffffff80040e92;
enum DB_E_NOTCOLLECTION = 0xffffffff80040e93;
enum DB_E_READONLY = 0xffffffff80040e94;
enum DB_E_ASYNCNOTSUPPORTED = 0xffffffff80040e95;
enum DB_E_CANNOTCONNECT = 0xffffffff80040e96;
enum DB_E_TIMEOUT = 0xffffffff80040e97;
enum DB_E_RESOURCEEXISTS = 0xffffffff80040e98;
enum DB_E_RESOURCEOUTOFSCOPE = 0xffffffff80040e8e;
enum DB_E_DROPRESTRICTED = 0xffffffff80040e90;
enum DB_E_DUPLICATECONSTRAINTID = 0xffffffff80040e99;
enum DB_E_OUTOFSPACE = 0xffffffff80040e9a;
enum DB_SEC_E_SAFEMODE_DENIED = 0xffffffff80040e9b;
enum DB_E_NOSTATISTIC = 0xffffffff80040e9c;
enum DB_E_ALTERRESTRICTED = 0xffffffff80040e9d;
enum DB_E_RESOURCENOTSUPPORTED = 0xffffffff80040e9e;
enum DB_E_NOCONSTRAINT = 0xffffffff80040e9f;
enum DB_E_COLUMNUNAVAILABLE = 0xffffffff80040ea0;
enum DB_S_ROWLIMITEXCEEDED = 0x00040ec0;
enum DB_S_COLUMNTYPEMISMATCH = 0x00040ec1;
enum DB_S_TYPEINFOOVERRIDDEN = 0x00040ec2;
enum DB_S_BOOKMARKSKIPPED = 0x00040ec3;
enum DB_S_NONEXTROWSET = 0x00040ec5;
enum DB_S_ENDOFROWSET = 0x00040ec6;
enum DB_S_COMMANDREEXECUTED = 0x00040ec7;
enum DB_S_BUFFERFULL = 0x00040ec8;
enum DB_S_NORESULT = 0x00040ec9;
enum DB_S_CANTRELEASE = 0x00040eca;
enum DB_S_GOALCHANGED = 0x00040ecb;
enum DB_S_UNWANTEDOPERATION = 0x00040ecc;
enum DB_S_DIALECTIGNORED = 0x00040ecd;
enum DB_S_UNWANTEDPHASE = 0x00040ece;
enum DB_S_UNWANTEDREASON = 0x00040ecf;
enum DB_S_ASYNCHRONOUS = 0x00040ed0;
enum DB_S_COLUMNSCHANGED = 0x00040ed1;
enum DB_S_ERRORSRETURNED = 0x00040ed2;
enum DB_S_BADROWHANDLE = 0x00040ed3;
enum DB_S_DELETEDROW = 0x00040ed4;
enum DB_S_TOOMANYCHANGES = 0x00040ed5;
enum DB_S_STOPLIMITREACHED = 0x00040ed6;
enum DB_S_LOCKUPGRADED = 0x00040ed8;
enum DB_S_PROPERTIESCHANGED = 0x00040ed9;
enum DB_S_ERRORSOCCURRED = 0x00040eda;
enum DB_S_PARAMUNAVAILABLE = 0x00040edb;
enum DB_S_MULTIPLECHANGES = 0x00040edc;
enum DB_S_NOTSINGLETON = 0x00040ed7;
enum DB_S_NOROWSPECIFICCOLUMNS = 0x00040edd;
enum DBPROPFLAGS_PERSIST = 0x00002000;
enum DBPROPVAL_PERSIST_ADTG = 0x00000000;
enum DBPROPVAL_PERSIST_XML = 0x00000001;
enum DBPROP_PersistFormat = 0x00000002;
enum DBPROP_PersistSchema = 0x00000003;
enum DBPROP_HCHAPTER = 0x00000004;
enum DBPROP_MAINTAINPROPS = 0x00000005;
enum DBPROP_Unicode = 0x00000006;
enum DBPROP_INTERLEAVEDROWS = 0x00000008;
enum MS_PERSIST_PROGID = "MSPersist";
enum DBQUERYGUID = GUID(0x49691c90, 0x7e17, 0x101a, [0xa9, 0x1c, 0x8, 0x0, 0x2b, 0x2e, 0xcd, 0xa9]);
enum DISPID_QUERY_RANKVECTOR = 0x00000002;
enum DISPID_QUERY_RANK = 0x00000003;
enum DISPID_QUERY_HITCOUNT = 0x00000004;
enum DISPID_QUERY_WORKID = 0x00000005;
enum DISPID_QUERY_ALL = 0x00000006;
enum DISPID_QUERY_UNFILTERED = 0x00000007;
enum DISPID_QUERY_REVNAME = 0x00000008;
enum DISPID_QUERY_VIRTUALPATH = 0x00000009;
enum DISPID_QUERY_LASTSEENTIME = 0x0000000a;
enum CQUERYDISPIDS = 0x0000000b;
enum PSGUID_QUERY_METADATA = GUID(0x624c9360, 0x93d0, 0x11cf, [0xa7, 0x87, 0x0, 0x0, 0x4c, 0x75, 0x27, 0x52]);
enum DISPID_QUERY_METADATA_VROOTUSED = 0x00000002;
enum DISPID_QUERY_METADATA_VROOTAUTOMATIC = 0x00000003;
enum DISPID_QUERY_METADATA_VROOTMANUAL = 0x00000004;
enum DISPID_QUERY_METADATA_PROPGUID = 0x00000005;
enum DISPID_QUERY_METADATA_PROPDISPID = 0x00000006;
enum DISPID_QUERY_METADATA_PROPNAME = 0x00000007;
enum DISPID_QUERY_METADATA_STORELEVEL = 0x00000008;
enum DISPID_QUERY_METADATA_PROPMODIFIABLE = 0x00000009;
enum CQUERYMETADISPIDS = 0x0000000a;
enum DBBMKGUID = GUID(0xc8b52232, 0x5cf3, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum PROPID_DBBMK_BOOKMARK = 0x00000002;
enum PROPID_DBBMK_CHAPTER = 0x00000003;
enum CDBBMKDISPIDS = 0x00000008;
enum DBSELFGUID = GUID(0xc8b52231, 0x5cf3, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum PROPID_DBSELF_SELF = 0x00000002;
enum CDBSELFDISPIDS = 0x00000008;
enum CDBCOLDISPIDS = 0x0000001c;
enum CQUERYPROPERTY = 0x00000040;
enum PSGUID_CHARACTERIZATION = GUID(0x560c36c0, 0x503a, 0x11cf, [0xba, 0xa1, 0x0, 0x0, 0x4c, 0x75, 0x2a, 0x9a]);
enum QUERY_VALIDBITS = 0x00000003;
enum RTNone = 0x00000000;
enum RTAnd = 0x00000001;
enum RTOr = 0x00000002;
enum RTNot = 0x00000003;
enum RTContent = 0x00000004;
enum RTProperty = 0x00000005;
enum RTProximity = 0x00000006;
enum RTVector = 0x00000007;
enum RTNatLanguage = 0x00000008;
enum GENERATE_METHOD_PREFIXMATCH = 0x00000001;
enum GENERATE_METHOD_STEMMED = 0x00000002;
enum PRRE = 0x00000006;
enum PRAllBits = 0x00000007;
enum PRSomeBits = 0x00000008;
enum PRAll = 0x00000100;
enum PRAny = 0x00000200;
enum QUERY_SORTXASCEND = 0x00000002;
enum QUERY_SORTXDESCEND = 0x00000003;
enum QUERY_SORTDEFAULT = 0x00000004;
enum CATEGORIZE_UNIQUE = 0x00000000;
enum CATEGORIZE_CLUSTER = 0x00000001;
enum CATEGORIZE_BUCKETS = 0x00000002;
enum BUCKET_LINEAR = 0x00000000;
enum BUCKET_EXPONENTIAL = 0x00000001;
enum CATEGORIZE_RANGE = 0x00000003;
enum OCC_INVALID = 0xffffffff;
enum MAX_QUERY_RANK = 0x000003e8;
enum OSP_IndexLabel = 0x00000000;
enum SQL_NULL_DATA = 0xffffffffffffffff;
enum SQL_DATA_AT_EXEC = 0xfffffffffffffffe;
enum SQL_SUCCESS = 0x00000000;
enum SQL_SUCCESS_WITH_INFO = 0x00000001;
enum SQL_NO_DATA = 0x00000064;
enum SQL_PARAM_DATA_AVAILABLE = 0x00000065;
enum SQL_ERROR = 0xffffffffffffffff;
enum SQL_INVALID_HANDLE = 0xfffffffffffffffe;
enum SQL_STILL_EXECUTING = 0x00000002;
enum SQL_NEED_DATA = 0x00000063;
enum SQL_NTS = 0xfffffffffffffffd;
enum SQL_NTSL = 0xfffffffffffffffd;
enum SQL_MAX_MESSAGE_LENGTH = 0x00000200;
enum SQL_DATE_LEN = 0x0000000a;
enum SQL_TIME_LEN = 0x00000008;
enum SQL_TIMESTAMP_LEN = 0x00000013;
enum SQL_HANDLE_ENV = 0x00000001;
enum SQL_HANDLE_DBC = 0x00000002;
enum SQL_HANDLE_STMT = 0x00000003;
enum SQL_HANDLE_DESC = 0x00000004;
enum SQL_ATTR_OUTPUT_NTS = 0x00002711;
enum SQL_ATTR_AUTO_IPD = 0x00002711;
enum SQL_ATTR_METADATA_ID = 0x0000271e;
enum SQL_ATTR_APP_ROW_DESC = 0x0000271a;
enum SQL_ATTR_APP_PARAM_DESC = 0x0000271b;
enum SQL_ATTR_IMP_ROW_DESC = 0x0000271c;
enum SQL_ATTR_IMP_PARAM_DESC = 0x0000271d;
enum SQL_ATTR_CURSOR_SCROLLABLE = 0xffffffffffffffff;
enum SQL_ATTR_CURSOR_SENSITIVITY = 0xfffffffffffffffe;
enum SQL_NONSCROLLABLE = 0x00000000;
enum SQL_SCROLLABLE = 0x00000001;
enum SQL_DESC_COUNT = 0x000003e9;
enum SQL_DESC_TYPE = 0x000003ea;
enum SQL_DESC_LENGTH = 0x000003eb;
enum SQL_DESC_OCTET_LENGTH_PTR = 0x000003ec;
enum SQL_DESC_PRECISION = 0x000003ed;
enum SQL_DESC_SCALE = 0x000003ee;
enum SQL_DESC_DATETIME_INTERVAL_CODE = 0x000003ef;
enum SQL_DESC_NULLABLE = 0x000003f0;
enum SQL_DESC_INDICATOR_PTR = 0x000003f1;
enum SQL_DESC_DATA_PTR = 0x000003f2;
enum SQL_DESC_NAME = 0x000003f3;
enum SQL_DESC_UNNAMED = 0x000003f4;
enum SQL_DESC_OCTET_LENGTH = 0x000003f5;
enum SQL_DESC_ALLOC_TYPE = 0x0000044b;
enum SQL_DIAG_RETURNCODE = 0x00000001;
enum SQL_DIAG_NUMBER = 0x00000002;
enum SQL_DIAG_ROW_COUNT = 0x00000003;
enum SQL_DIAG_SQLSTATE = 0x00000004;
enum SQL_DIAG_NATIVE = 0x00000005;
enum SQL_DIAG_MESSAGE_TEXT = 0x00000006;
enum SQL_DIAG_DYNAMIC_FUNCTION = 0x00000007;
enum SQL_DIAG_CLASS_ORIGIN = 0x00000008;
enum SQL_DIAG_SUBCLASS_ORIGIN = 0x00000009;
enum SQL_DIAG_CONNECTION_NAME = 0x0000000a;
enum SQL_DIAG_SERVER_NAME = 0x0000000b;
enum SQL_DIAG_DYNAMIC_FUNCTION_CODE = 0x0000000c;
enum SQL_DIAG_ALTER_DOMAIN = 0x00000003;
enum SQL_DIAG_ALTER_TABLE = 0x00000004;
enum SQL_DIAG_CALL = 0x00000007;
enum SQL_DIAG_CREATE_ASSERTION = 0x00000006;
enum SQL_DIAG_CREATE_CHARACTER_SET = 0x00000008;
enum SQL_DIAG_CREATE_COLLATION = 0x0000000a;
enum SQL_DIAG_CREATE_DOMAIN = 0x00000017;
enum SQL_DIAG_CREATE_INDEX = 0xffffffffffffffff;
enum SQL_DIAG_CREATE_SCHEMA = 0x00000040;
enum SQL_DIAG_CREATE_TABLE = 0x0000004d;
enum SQL_DIAG_CREATE_TRANSLATION = 0x0000004f;
enum SQL_DIAG_CREATE_VIEW = 0x00000054;
enum SQL_DIAG_DELETE_WHERE = 0x00000013;
enum SQL_DIAG_DROP_ASSERTION = 0x00000018;
enum SQL_DIAG_DROP_CHARACTER_SET = 0x00000019;
enum SQL_DIAG_DROP_COLLATION = 0x0000001a;
enum SQL_DIAG_DROP_DOMAIN = 0x0000001b;
enum SQL_DIAG_DROP_INDEX = 0xfffffffffffffffe;
enum SQL_DIAG_DROP_SCHEMA = 0x0000001f;
enum SQL_DIAG_DROP_TABLE = 0x00000020;
enum SQL_DIAG_DROP_TRANSLATION = 0x00000021;
enum SQL_DIAG_DROP_VIEW = 0x00000024;
enum SQL_DIAG_DYNAMIC_DELETE_CURSOR = 0x00000026;
enum SQL_DIAG_DYNAMIC_UPDATE_CURSOR = 0x00000051;
enum SQL_DIAG_GRANT = 0x00000030;
enum SQL_DIAG_INSERT = 0x00000032;
enum SQL_DIAG_REVOKE = 0x0000003b;
enum SQL_DIAG_SELECT_CURSOR = 0x00000055;
enum SQL_DIAG_UNKNOWN_STATEMENT = 0x00000000;
enum SQL_DIAG_UPDATE_WHERE = 0x00000052;
enum SQL_UNKNOWN_TYPE = 0x00000000;
enum SQL_CHAR = 0x00000001;
enum SQL_NUMERIC = 0x00000002;
enum SQL_DECIMAL = 0x00000003;
enum SQL_INTEGER = 0x00000004;
enum SQL_SMALLINT = 0x00000005;
enum SQL_FLOAT = 0x00000006;
enum SQL_REAL = 0x00000007;
enum SQL_DOUBLE = 0x00000008;
enum SQL_DATETIME = 0x00000009;
enum SQL_VARCHAR = 0x0000000c;
enum SQL_TYPE_DATE = 0x0000005b;
enum SQL_TYPE_TIME = 0x0000005c;
enum SQL_TYPE_TIMESTAMP = 0x0000005d;
enum SQL_UNSPECIFIED = 0x00000000;
enum SQL_INSENSITIVE = 0x00000001;
enum SQL_SENSITIVE = 0x00000002;
enum SQL_ALL_TYPES = 0x00000000;
enum SQL_DEFAULT = 0x00000063;
enum SQL_ARD_TYPE = 0xffffffffffffff9d;
enum SQL_APD_TYPE = 0xffffffffffffff9c;
enum SQL_CODE_DATE = 0x00000001;
enum SQL_CODE_TIME = 0x00000002;
enum SQL_CODE_TIMESTAMP = 0x00000003;
enum SQL_FALSE = 0x00000000;
enum SQL_TRUE = 0x00000001;
enum SQL_NO_NULLS = 0x00000000;
enum SQL_NULLABLE = 0x00000001;
enum SQL_NULLABLE_UNKNOWN = 0x00000002;
enum SQL_PRED_NONE = 0x00000000;
enum SQL_PRED_CHAR = 0x00000001;
enum SQL_PRED_BASIC = 0x00000002;
enum SQL_NAMED = 0x00000000;
enum SQL_UNNAMED = 0x00000001;
enum SQL_DESC_ALLOC_AUTO = 0x00000001;
enum SQL_DESC_ALLOC_USER = 0x00000002;
enum SQL_CLOSE = 0x00000000;
enum SQL_DROP = 0x00000001;
enum SQL_UNBIND = 0x00000002;
enum SQL_RESET_PARAMS = 0x00000003;
enum SQL_FETCH_NEXT = 0x00000001;
enum SQL_FETCH_FIRST = 0x00000002;
enum SQL_FETCH_LAST = 0x00000003;
enum SQL_FETCH_PRIOR = 0x00000004;
enum SQL_FETCH_ABSOLUTE = 0x00000005;
enum SQL_FETCH_RELATIVE = 0x00000006;
enum SQL_COMMIT = 0x00000000;
enum SQL_ROLLBACK = 0x00000001;
enum SQL_NULL_HENV = 0x00000000;
enum SQL_NULL_HDBC = 0x00000000;
enum SQL_NULL_HSTMT = 0x00000000;
enum SQL_NULL_HDESC = 0x00000000;
enum SQL_NULL_HANDLE = 0x00000000;
enum SQL_SCOPE_CURROW = 0x00000000;
enum SQL_SCOPE_TRANSACTION = 0x00000001;
enum SQL_SCOPE_SESSION = 0x00000002;
enum SQL_PC_UNKNOWN = 0x00000000;
enum SQL_PC_NON_PSEUDO = 0x00000001;
enum SQL_PC_PSEUDO = 0x00000002;
enum SQL_ROW_IDENTIFIER = 0x00000001;
enum SQL_INDEX_UNIQUE = 0x00000000;
enum SQL_INDEX_ALL = 0x00000001;
enum SQL_INDEX_CLUSTERED = 0x00000001;
enum SQL_INDEX_HASHED = 0x00000002;
enum SQL_INDEX_OTHER = 0x00000003;
enum SQL_API_SQLALLOCCONNECT = 0x00000001;
enum SQL_API_SQLALLOCENV = 0x00000002;
enum SQL_API_SQLALLOCHANDLE = 0x000003e9;
enum SQL_API_SQLALLOCSTMT = 0x00000003;
enum SQL_API_SQLBINDCOL = 0x00000004;
enum SQL_API_SQLBINDPARAM = 0x000003ea;
enum SQL_API_SQLCANCEL = 0x00000005;
enum SQL_API_SQLCLOSECURSOR = 0x000003eb;
enum SQL_API_SQLCOLATTRIBUTE = 0x00000006;
enum SQL_API_SQLCOLUMNS = 0x00000028;
enum SQL_API_SQLCONNECT = 0x00000007;
enum SQL_API_SQLCOPYDESC = 0x000003ec;
enum SQL_API_SQLDATASOURCES = 0x00000039;
enum SQL_API_SQLDESCRIBECOL = 0x00000008;
enum SQL_API_SQLDISCONNECT = 0x00000009;
enum SQL_API_SQLENDTRAN = 0x000003ed;
enum SQL_API_SQLERROR = 0x0000000a;
enum SQL_API_SQLEXECDIRECT = 0x0000000b;
enum SQL_API_SQLEXECUTE = 0x0000000c;
enum SQL_API_SQLFETCH = 0x0000000d;
enum SQL_API_SQLFETCHSCROLL = 0x000003fd;
enum SQL_API_SQLFREECONNECT = 0x0000000e;
enum SQL_API_SQLFREEENV = 0x0000000f;
enum SQL_API_SQLFREEHANDLE = 0x000003ee;
enum SQL_API_SQLFREESTMT = 0x00000010;
enum SQL_API_SQLGETCONNECTATTR = 0x000003ef;
enum SQL_API_SQLGETCONNECTOPTION = 0x0000002a;
enum SQL_API_SQLGETCURSORNAME = 0x00000011;
enum SQL_API_SQLGETDATA = 0x0000002b;
enum SQL_API_SQLGETDESCFIELD = 0x000003f0;
enum SQL_API_SQLGETDESCREC = 0x000003f1;
enum SQL_API_SQLGETDIAGFIELD = 0x000003f2;
enum SQL_API_SQLGETDIAGREC = 0x000003f3;
enum SQL_API_SQLGETENVATTR = 0x000003f4;
enum SQL_API_SQLGETFUNCTIONS = 0x0000002c;
enum SQL_API_SQLGETINFO = 0x0000002d;
enum SQL_API_SQLGETSTMTATTR = 0x000003f6;
enum SQL_API_SQLGETSTMTOPTION = 0x0000002e;
enum SQL_API_SQLGETTYPEINFO = 0x0000002f;
enum SQL_API_SQLNUMRESULTCOLS = 0x00000012;
enum SQL_API_SQLPARAMDATA = 0x00000030;
enum SQL_API_SQLPREPARE = 0x00000013;
enum SQL_API_SQLPUTDATA = 0x00000031;
enum SQL_API_SQLROWCOUNT = 0x00000014;
enum SQL_API_SQLSETCONNECTATTR = 0x000003f8;
enum SQL_API_SQLSETCONNECTOPTION = 0x00000032;
enum SQL_API_SQLSETCURSORNAME = 0x00000015;
enum SQL_API_SQLSETDESCFIELD = 0x000003f9;
enum SQL_API_SQLSETDESCREC = 0x000003fa;
enum SQL_API_SQLSETENVATTR = 0x000003fb;
enum SQL_API_SQLSETPARAM = 0x00000016;
enum SQL_API_SQLSETSTMTATTR = 0x000003fc;
enum SQL_API_SQLSETSTMTOPTION = 0x00000033;
enum SQL_API_SQLSPECIALCOLUMNS = 0x00000034;
enum SQL_API_SQLSTATISTICS = 0x00000035;
enum SQL_API_SQLTABLES = 0x00000036;
enum SQL_API_SQLTRANSACT = 0x00000017;
enum SQL_API_SQLCANCELHANDLE = 0x0000060e;
enum SQL_API_SQLCOMPLETEASYNC = 0x0000060f;
enum SQL_MAX_DRIVER_CONNECTIONS = 0x00000000;
enum SQL_MAXIMUM_DRIVER_CONNECTIONS = 0x00000000;
enum SQL_MAX_CONCURRENT_ACTIVITIES = 0x00000001;
enum SQL_MAXIMUM_CONCURRENT_ACTIVITIES = 0x00000001;
enum SQL_DATA_SOURCE_NAME = 0x00000002;
enum SQL_FETCH_DIRECTION = 0x00000008;
enum SQL_SERVER_NAME = 0x0000000d;
enum SQL_SEARCH_PATTERN_ESCAPE = 0x0000000e;
enum SQL_DBMS_NAME = 0x00000011;
enum SQL_DBMS_VER = 0x00000012;
enum SQL_ACCESSIBLE_TABLES = 0x00000013;
enum SQL_ACCESSIBLE_PROCEDURES = 0x00000014;
enum SQL_CURSOR_COMMIT_BEHAVIOR = 0x00000017;
enum SQL_DATA_SOURCE_READ_ONLY = 0x00000019;
enum SQL_DEFAULT_TXN_ISOLATION = 0x0000001a;
enum SQL_IDENTIFIER_CASE = 0x0000001c;
enum SQL_IDENTIFIER_QUOTE_CHAR = 0x0000001d;
enum SQL_MAX_COLUMN_NAME_LEN = 0x0000001e;
enum SQL_MAXIMUM_COLUMN_NAME_LENGTH = 0x0000001e;
enum SQL_MAX_CURSOR_NAME_LEN = 0x0000001f;
enum SQL_MAXIMUM_CURSOR_NAME_LENGTH = 0x0000001f;
enum SQL_MAX_SCHEMA_NAME_LEN = 0x00000020;
enum SQL_MAXIMUM_SCHEMA_NAME_LENGTH = 0x00000020;
enum SQL_MAX_CATALOG_NAME_LEN = 0x00000022;
enum SQL_MAXIMUM_CATALOG_NAME_LENGTH = 0x00000022;
enum SQL_MAX_TABLE_NAME_LEN = 0x00000023;
enum SQL_SCROLL_CONCURRENCY = 0x0000002b;
enum SQL_TXN_CAPABLE = 0x0000002e;
enum SQL_TRANSACTION_CAPABLE = 0x0000002e;
enum SQL_USER_NAME = 0x0000002f;
enum SQL_TXN_ISOLATION_OPTION = 0x00000048;
enum SQL_TRANSACTION_ISOLATION_OPTION = 0x00000048;
enum SQL_INTEGRITY = 0x00000049;
enum SQL_GETDATA_EXTENSIONS = 0x00000051;
enum SQL_NULL_COLLATION = 0x00000055;
enum SQL_ALTER_TABLE = 0x00000056;
enum SQL_ORDER_BY_COLUMNS_IN_SELECT = 0x0000005a;
enum SQL_SPECIAL_CHARACTERS = 0x0000005e;
enum SQL_MAX_COLUMNS_IN_GROUP_BY = 0x00000061;
enum SQL_MAXIMUM_COLUMNS_IN_GROUP_BY = 0x00000061;
enum SQL_MAX_COLUMNS_IN_INDEX = 0x00000062;
enum SQL_MAXIMUM_COLUMNS_IN_INDEX = 0x00000062;
enum SQL_MAX_COLUMNS_IN_ORDER_BY = 0x00000063;
enum SQL_MAXIMUM_COLUMNS_IN_ORDER_BY = 0x00000063;
enum SQL_MAX_COLUMNS_IN_SELECT = 0x00000064;
enum SQL_MAXIMUM_COLUMNS_IN_SELECT = 0x00000064;
enum SQL_MAX_COLUMNS_IN_TABLE = 0x00000065;
enum SQL_MAX_INDEX_SIZE = 0x00000066;
enum SQL_MAXIMUM_INDEX_SIZE = 0x00000066;
enum SQL_MAX_ROW_SIZE = 0x00000068;
enum SQL_MAXIMUM_ROW_SIZE = 0x00000068;
enum SQL_MAX_STATEMENT_LEN = 0x00000069;
enum SQL_MAXIMUM_STATEMENT_LENGTH = 0x00000069;
enum SQL_MAX_TABLES_IN_SELECT = 0x0000006a;
enum SQL_MAXIMUM_TABLES_IN_SELECT = 0x0000006a;
enum SQL_MAX_USER_NAME_LEN = 0x0000006b;
enum SQL_MAXIMUM_USER_NAME_LENGTH = 0x0000006b;
enum SQL_OJ_CAPABILITIES = 0x00000073;
enum SQL_OUTER_JOIN_CAPABILITIES = 0x00000073;
enum SQL_XOPEN_CLI_YEAR = 0x00002710;
enum SQL_CURSOR_SENSITIVITY = 0x00002711;
enum SQL_DESCRIBE_PARAMETER = 0x00002712;
enum SQL_CATALOG_NAME = 0x00002713;
enum SQL_COLLATION_SEQ = 0x00002714;
enum SQL_MAX_IDENTIFIER_LEN = 0x00002715;
enum SQL_MAXIMUM_IDENTIFIER_LENGTH = 0x00002715;
enum SQL_AT_ADD_COLUMN = 0x00000001;
enum SQL_AT_DROP_COLUMN = 0x00000002;
enum SQL_AT_ADD_CONSTRAINT = 0x00000008;
enum SQL_AM_NONE = 0x00000000;
enum SQL_AM_CONNECTION = 0x00000001;
enum SQL_AM_STATEMENT = 0x00000002;
enum SQL_CB_DELETE = 0x00000000;
enum SQL_CB_CLOSE = 0x00000001;
enum SQL_CB_PRESERVE = 0x00000002;
enum SQL_FD_FETCH_NEXT = 0x00000001;
enum SQL_FD_FETCH_FIRST = 0x00000002;
enum SQL_FD_FETCH_LAST = 0x00000004;
enum SQL_FD_FETCH_PRIOR = 0x00000008;
enum SQL_FD_FETCH_ABSOLUTE = 0x00000010;
enum SQL_FD_FETCH_RELATIVE = 0x00000020;
enum SQL_GD_ANY_COLUMN = 0x00000001;
enum SQL_GD_ANY_ORDER = 0x00000002;
enum SQL_IC_UPPER = 0x00000001;
enum SQL_IC_LOWER = 0x00000002;
enum SQL_IC_SENSITIVE = 0x00000003;
enum SQL_IC_MIXED = 0x00000004;
enum SQL_OJ_LEFT = 0x00000001;
enum SQL_OJ_RIGHT = 0x00000002;
enum SQL_OJ_FULL = 0x00000004;
enum SQL_OJ_NESTED = 0x00000008;
enum SQL_OJ_NOT_ORDERED = 0x00000010;
enum SQL_OJ_INNER = 0x00000020;
enum SQL_OJ_ALL_COMPARISON_OPS = 0x00000040;
enum SQL_SCCO_READ_ONLY = 0x00000001;
enum SQL_SCCO_LOCK = 0x00000002;
enum SQL_SCCO_OPT_ROWVER = 0x00000004;
enum SQL_SCCO_OPT_VALUES = 0x00000008;
enum SQL_TC_NONE = 0x00000000;
enum SQL_TC_DML = 0x00000001;
enum SQL_TC_ALL = 0x00000002;
enum SQL_TC_DDL_COMMIT = 0x00000003;
enum SQL_TC_DDL_IGNORE = 0x00000004;
enum SQL_TXN_READ_UNCOMMITTED = 0x00000001;
enum SQL_TRANSACTION_READ_UNCOMMITTED = 0x00000001;
enum SQL_TXN_READ_COMMITTED = 0x00000002;
enum SQL_TRANSACTION_READ_COMMITTED = 0x00000002;
enum SQL_TXN_REPEATABLE_READ = 0x00000004;
enum SQL_TRANSACTION_REPEATABLE_READ = 0x00000004;
enum SQL_TXN_SERIALIZABLE = 0x00000008;
enum SQL_TRANSACTION_SERIALIZABLE = 0x00000008;
enum SQL_NC_HIGH = 0x00000000;
enum SQL_NC_LOW = 0x00000001;
enum SQL_SPEC_MAJOR = 0x00000003;
enum SQL_SPEC_MINOR = 0x00000050;
enum SQL_SPEC_STRING = "03.80";
enum SQL_SQLSTATE_SIZE = 0x00000005;
enum SQL_MAX_DSN_LENGTH = 0x00000020;
enum SQL_MAX_OPTION_STRING_LENGTH = 0x00000100;
enum SQL_NO_DATA_FOUND = 0x00000064;
enum SQL_HANDLE_SENV = 0x00000005;
enum SQL_ATTR_ODBC_VERSION = 0x000000c8;
enum SQL_ATTR_CONNECTION_POOLING = 0x000000c9;
enum SQL_ATTR_CP_MATCH = 0x000000ca;
enum SQL_ATTR_APPLICATION_KEY = 0x000000cb;
enum SQL_CP_OFF = 0x00000000;
enum SQL_CP_ONE_PER_DRIVER = 0x00000001;
enum SQL_CP_ONE_PER_HENV = 0x00000002;
enum SQL_CP_DRIVER_AWARE = 0x00000003;
enum SQL_CP_DEFAULT = 0x00000000;
enum SQL_CP_STRICT_MATCH = 0x00000000;
enum SQL_CP_RELAXED_MATCH = 0x00000001;
enum SQL_CP_MATCH_DEFAULT = 0x00000000;
enum SQL_OV_ODBC2 = 0x00000002;
enum SQL_OV_ODBC3 = 0x00000003;
enum SQL_OV_ODBC3_80 = 0x0000017c;
enum SQL_ACCESS_MODE = 0x00000065;
enum SQL_AUTOCOMMIT = 0x00000066;
enum SQL_LOGIN_TIMEOUT = 0x00000067;
enum SQL_OPT_TRACE = 0x00000068;
enum SQL_OPT_TRACEFILE = 0x00000069;
enum SQL_TRANSLATE_DLL = 0x0000006a;
enum SQL_TRANSLATE_OPTION = 0x0000006b;
enum SQL_TXN_ISOLATION = 0x0000006c;
enum SQL_CURRENT_QUALIFIER = 0x0000006d;
enum SQL_ODBC_CURSORS = 0x0000006e;
enum SQL_QUIET_MODE = 0x0000006f;
enum SQL_PACKET_SIZE = 0x00000070;
enum SQL_ATTR_ACCESS_MODE = 0x00000065;
enum SQL_ATTR_AUTOCOMMIT = 0x00000066;
enum SQL_ATTR_CONNECTION_TIMEOUT = 0x00000071;
enum SQL_ATTR_CURRENT_CATALOG = 0x0000006d;
enum SQL_ATTR_DISCONNECT_BEHAVIOR = 0x00000072;
enum SQL_ATTR_ENLIST_IN_DTC = 0x000004b7;
enum SQL_ATTR_ENLIST_IN_XA = 0x000004b8;
enum SQL_ATTR_LOGIN_TIMEOUT = 0x00000067;
enum SQL_ATTR_ODBC_CURSORS = 0x0000006e;
enum SQL_ATTR_PACKET_SIZE = 0x00000070;
enum SQL_ATTR_QUIET_MODE = 0x0000006f;
enum SQL_ATTR_TRACE = 0x00000068;
enum SQL_ATTR_TRACEFILE = 0x00000069;
enum SQL_ATTR_TRANSLATE_LIB = 0x0000006a;
enum SQL_ATTR_TRANSLATE_OPTION = 0x0000006b;
enum SQL_ATTR_TXN_ISOLATION = 0x0000006c;
enum SQL_ATTR_CONNECTION_DEAD = 0x000004b9;
enum SQL_ATTR_ANSI_APP = 0x00000073;
enum SQL_ATTR_RESET_CONNECTION = 0x00000074;
enum SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE = 0x00000075;
enum SQL_ATTR_ASYNC_DBC_EVENT = 0x00000077;
enum SQL_CONNECT_OPT_DRVR_START = 0x000003e8;
enum SQL_CONN_OPT_MAX = 0x00000070;
enum SQL_CONN_OPT_MIN = 0x00000065;
enum SQL_MODE_READ_WRITE = 0x00000000;
enum SQL_MODE_READ_ONLY = 0x00000001;
enum SQL_MODE_DEFAULT = 0x00000000;
enum SQL_AUTOCOMMIT_OFF = 0x00000000;
enum SQL_AUTOCOMMIT_ON = 0x00000001;
enum SQL_AUTOCOMMIT_DEFAULT = 0x00000001;
enum SQL_LOGIN_TIMEOUT_DEFAULT = 0x0000000f;
enum SQL_OPT_TRACE_OFF = 0x00000000;
enum SQL_OPT_TRACE_ON = 0x00000001;
enum SQL_OPT_TRACE_DEFAULT = 0x00000000;
enum SQL_OPT_TRACE_FILE_DEFAULT = "\\SQL.LOG";
enum SQL_CUR_USE_IF_NEEDED = 0x00000000;
enum SQL_CUR_USE_ODBC = 0x00000001;
enum SQL_CUR_USE_DRIVER = 0x00000002;
enum SQL_CUR_DEFAULT = 0x00000002;
enum SQL_DB_RETURN_TO_POOL = 0x00000000;
enum SQL_DB_DISCONNECT = 0x00000001;
enum SQL_DB_DEFAULT = 0x00000000;
enum SQL_DTC_DONE = 0x00000000;
enum SQL_CD_TRUE = 0x00000001;
enum SQL_CD_FALSE = 0x00000000;
enum SQL_AA_TRUE = 0x00000001;
enum SQL_AA_FALSE = 0x00000000;
enum SQL_RESET_CONNECTION_YES = 0x00000001;
enum SQL_ASYNC_DBC_ENABLE_ON = 0x00000001;
enum SQL_ASYNC_DBC_ENABLE_OFF = 0x00000000;
enum SQL_ASYNC_DBC_ENABLE_DEFAULT = 0x00000000;
enum SQL_QUERY_TIMEOUT = 0x00000000;
enum SQL_MAX_ROWS = 0x00000001;
enum SQL_NOSCAN = 0x00000002;
enum SQL_MAX_LENGTH = 0x00000003;
enum SQL_ASYNC_ENABLE = 0x00000004;
enum SQL_BIND_TYPE = 0x00000005;
enum SQL_CURSOR_TYPE = 0x00000006;
enum SQL_CONCURRENCY = 0x00000007;
enum SQL_KEYSET_SIZE = 0x00000008;
enum SQL_ROWSET_SIZE = 0x00000009;
enum SQL_SIMULATE_CURSOR = 0x0000000a;
enum SQL_RETRIEVE_DATA = 0x0000000b;
enum SQL_USE_BOOKMARKS = 0x0000000c;
enum SQL_GET_BOOKMARK = 0x0000000d;
enum SQL_ROW_NUMBER = 0x0000000e;
enum SQL_ATTR_ASYNC_ENABLE = 0x00000004;
enum SQL_ATTR_CONCURRENCY = 0x00000007;
enum SQL_ATTR_CURSOR_TYPE = 0x00000006;
enum SQL_ATTR_ENABLE_AUTO_IPD = 0x0000000f;
enum SQL_ATTR_FETCH_BOOKMARK_PTR = 0x00000010;
enum SQL_ATTR_KEYSET_SIZE = 0x00000008;
enum SQL_ATTR_MAX_LENGTH = 0x00000003;
enum SQL_ATTR_MAX_ROWS = 0x00000001;
enum SQL_ATTR_NOSCAN = 0x00000002;
enum SQL_ATTR_PARAM_BIND_OFFSET_PTR = 0x00000011;
enum SQL_ATTR_PARAM_BIND_TYPE = 0x00000012;
enum SQL_ATTR_PARAM_OPERATION_PTR = 0x00000013;
enum SQL_ATTR_PARAM_STATUS_PTR = 0x00000014;
enum SQL_ATTR_PARAMS_PROCESSED_PTR = 0x00000015;
enum SQL_ATTR_PARAMSET_SIZE = 0x00000016;
enum SQL_ATTR_QUERY_TIMEOUT = 0x00000000;
enum SQL_ATTR_RETRIEVE_DATA = 0x0000000b;
enum SQL_ATTR_ROW_BIND_OFFSET_PTR = 0x00000017;
enum SQL_ATTR_ROW_BIND_TYPE = 0x00000005;
enum SQL_ATTR_ROW_NUMBER = 0x0000000e;
enum SQL_ATTR_ROW_OPERATION_PTR = 0x00000018;
enum SQL_ATTR_ROW_STATUS_PTR = 0x00000019;
enum SQL_ATTR_ROWS_FETCHED_PTR = 0x0000001a;
enum SQL_ATTR_ROW_ARRAY_SIZE = 0x0000001b;
enum SQL_ATTR_SIMULATE_CURSOR = 0x0000000a;
enum SQL_ATTR_USE_BOOKMARKS = 0x0000000c;
enum SQL_ATTR_ASYNC_STMT_EVENT = 0x0000001d;
enum SQL_STMT_OPT_MAX = 0x0000000e;
enum SQL_STMT_OPT_MIN = 0x00000000;
enum SQL_IS_POINTER = 0xfffffffffffffffc;
enum SQL_IS_UINTEGER = 0xfffffffffffffffb;
enum SQL_IS_INTEGER = 0xfffffffffffffffa;
enum SQL_IS_USMALLINT = 0xfffffffffffffff9;
enum SQL_IS_SMALLINT = 0xfffffffffffffff8;
enum SQL_PARAM_BIND_BY_COLUMN = 0x00000000;
enum SQL_PARAM_BIND_TYPE_DEFAULT = 0x00000000;
enum SQL_QUERY_TIMEOUT_DEFAULT = 0x00000000;
enum SQL_MAX_ROWS_DEFAULT = 0x00000000;
enum SQL_NOSCAN_OFF = 0x00000000;
enum SQL_NOSCAN_ON = 0x00000001;
enum SQL_NOSCAN_DEFAULT = 0x00000000;
enum SQL_MAX_LENGTH_DEFAULT = 0x00000000;
enum SQL_ASYNC_ENABLE_OFF = 0x00000000;
enum SQL_ASYNC_ENABLE_ON = 0x00000001;
enum SQL_ASYNC_ENABLE_DEFAULT = 0x00000000;
enum SQL_BIND_BY_COLUMN = 0x00000000;
enum SQL_BIND_TYPE_DEFAULT = 0x00000000;
enum SQL_CONCUR_READ_ONLY = 0x00000001;
enum SQL_CONCUR_LOCK = 0x00000002;
enum SQL_CONCUR_ROWVER = 0x00000003;
enum SQL_CONCUR_VALUES = 0x00000004;
enum SQL_CONCUR_DEFAULT = 0x00000001;
enum SQL_CURSOR_FORWARD_ONLY = 0x00000000;
enum SQL_CURSOR_KEYSET_DRIVEN = 0x00000001;
enum SQL_CURSOR_DYNAMIC = 0x00000002;
enum SQL_CURSOR_STATIC = 0x00000003;
enum SQL_CURSOR_TYPE_DEFAULT = 0x00000000;
enum SQL_ROWSET_SIZE_DEFAULT = 0x00000001;
enum SQL_KEYSET_SIZE_DEFAULT = 0x00000000;
enum SQL_SC_NON_UNIQUE = 0x00000000;
enum SQL_SC_TRY_UNIQUE = 0x00000001;
enum SQL_SC_UNIQUE = 0x00000002;
enum SQL_RD_OFF = 0x00000000;
enum SQL_RD_ON = 0x00000001;
enum SQL_RD_DEFAULT = 0x00000001;
enum SQL_UB_OFF = 0x00000000;
enum SQL_UB_ON = 0x00000001;
enum SQL_UB_DEFAULT = 0x00000000;
enum SQL_UB_FIXED = 0x00000001;
enum SQL_UB_VARIABLE = 0x00000002;
enum SQL_DESC_ARRAY_SIZE = 0x00000014;
enum SQL_DESC_ARRAY_STATUS_PTR = 0x00000015;
enum SQL_DESC_BASE_COLUMN_NAME = 0x00000016;
enum SQL_DESC_BASE_TABLE_NAME = 0x00000017;
enum SQL_DESC_BIND_OFFSET_PTR = 0x00000018;
enum SQL_DESC_BIND_TYPE = 0x00000019;
enum SQL_DESC_DATETIME_INTERVAL_PRECISION = 0x0000001a;
enum SQL_DESC_LITERAL_PREFIX = 0x0000001b;
enum SQL_DESC_LITERAL_SUFFIX = 0x0000001c;
enum SQL_DESC_LOCAL_TYPE_NAME = 0x0000001d;
enum SQL_DESC_MAXIMUM_SCALE = 0x0000001e;
enum SQL_DESC_MINIMUM_SCALE = 0x0000001f;
enum SQL_DESC_NUM_PREC_RADIX = 0x00000020;
enum SQL_DESC_PARAMETER_TYPE = 0x00000021;
enum SQL_DESC_ROWS_PROCESSED_PTR = 0x00000022;
enum SQL_DESC_ROWVER = 0x00000023;
enum SQL_DIAG_CURSOR_ROW_COUNT = 0xfffffffffffffb1f;
enum SQL_DIAG_ROW_NUMBER = 0xfffffffffffffb20;
enum SQL_DIAG_COLUMN_NUMBER = 0xfffffffffffffb21;
enum SQL_DATE = 0x00000009;
enum SQL_INTERVAL = 0x0000000a;
enum SQL_TIME = 0x0000000a;
enum SQL_TIMESTAMP = 0x0000000b;
enum SQL_LONGVARCHAR = 0xffffffffffffffff;
enum SQL_BINARY = 0xfffffffffffffffe;
enum SQL_VARBINARY = 0xfffffffffffffffd;
enum SQL_LONGVARBINARY = 0xfffffffffffffffc;
enum SQL_BIGINT = 0xfffffffffffffffb;
enum SQL_TINYINT = 0xfffffffffffffffa;
enum SQL_BIT = 0xfffffffffffffff9;
enum SQL_GUID = 0xfffffffffffffff5;
enum SQL_CODE_YEAR = 0x00000001;
enum SQL_CODE_MONTH = 0x00000002;
enum SQL_CODE_DAY = 0x00000003;
enum SQL_CODE_HOUR = 0x00000004;
enum SQL_CODE_MINUTE = 0x00000005;
enum SQL_CODE_SECOND = 0x00000006;
enum SQL_CODE_YEAR_TO_MONTH = 0x00000007;
enum SQL_CODE_DAY_TO_HOUR = 0x00000008;
enum SQL_CODE_DAY_TO_MINUTE = 0x00000009;
enum SQL_CODE_DAY_TO_SECOND = 0x0000000a;
enum SQL_CODE_HOUR_TO_MINUTE = 0x0000000b;
enum SQL_CODE_HOUR_TO_SECOND = 0x0000000c;
enum SQL_CODE_MINUTE_TO_SECOND = 0x0000000d;
enum SQL_INTERVAL_YEAR = 0xffffffffffffffb0;
enum SQL_INTERVAL_MONTH = 0xffffffffffffffaf;
enum SQL_INTERVAL_YEAR_TO_MONTH = 0xffffffffffffffae;
enum SQL_INTERVAL_DAY = 0xffffffffffffffad;
enum SQL_INTERVAL_HOUR = 0xffffffffffffffac;
enum SQL_INTERVAL_MINUTE = 0xffffffffffffffab;
enum SQL_INTERVAL_SECOND = 0xffffffffffffffaa;
enum SQL_INTERVAL_DAY_TO_HOUR = 0xffffffffffffffa9;
enum SQL_INTERVAL_DAY_TO_MINUTE = 0xffffffffffffffa8;
enum SQL_INTERVAL_DAY_TO_SECOND = 0xffffffffffffffa7;
enum SQL_INTERVAL_HOUR_TO_MINUTE = 0xffffffffffffffa6;
enum SQL_INTERVAL_HOUR_TO_SECOND = 0xffffffffffffffa5;
enum SQL_INTERVAL_MINUTE_TO_SECOND = 0xffffffffffffffa4;
enum SQL_UNICODE = 0xffffffffffffffa1;
enum SQL_UNICODE_VARCHAR = 0xffffffffffffffa0;
enum SQL_UNICODE_LONGVARCHAR = 0xffffffffffffff9f;
enum SQL_UNICODE_CHAR = 0xffffffffffffffa1;
enum SQL_TYPE_DRIVER_START = 0xffffffffffffffb0;
enum SQL_TYPE_DRIVER_END = 0xffffffffffffff9f;
enum SQL_C_CHAR = 0x00000001;
enum SQL_C_LONG = 0x00000004;
enum SQL_C_SHORT = 0x00000005;
enum SQL_C_FLOAT = 0x00000007;
enum SQL_C_DOUBLE = 0x00000008;
enum SQL_C_NUMERIC = 0x00000002;
enum SQL_C_DEFAULT = 0x00000063;
enum SQL_SIGNED_OFFSET = 0xffffffffffffffec;
enum SQL_UNSIGNED_OFFSET = 0xffffffffffffffea;
enum SQL_C_DATE = 0x00000009;
enum SQL_C_TIME = 0x0000000a;
enum SQL_C_TIMESTAMP = 0x0000000b;
enum SQL_C_TYPE_DATE = 0x0000005b;
enum SQL_C_TYPE_TIME = 0x0000005c;
enum SQL_C_TYPE_TIMESTAMP = 0x0000005d;
enum SQL_C_INTERVAL_YEAR = 0xffffffffffffffb0;
enum SQL_C_INTERVAL_MONTH = 0xffffffffffffffaf;
enum SQL_C_INTERVAL_DAY = 0xffffffffffffffad;
enum SQL_C_INTERVAL_HOUR = 0xffffffffffffffac;
enum SQL_C_INTERVAL_MINUTE = 0xffffffffffffffab;
enum SQL_C_INTERVAL_SECOND = 0xffffffffffffffaa;
enum SQL_C_INTERVAL_YEAR_TO_MONTH = 0xffffffffffffffae;
enum SQL_C_INTERVAL_DAY_TO_HOUR = 0xffffffffffffffa9;
enum SQL_C_INTERVAL_DAY_TO_MINUTE = 0xffffffffffffffa8;
enum SQL_C_INTERVAL_DAY_TO_SECOND = 0xffffffffffffffa7;
enum SQL_C_INTERVAL_HOUR_TO_MINUTE = 0xffffffffffffffa6;
enum SQL_C_INTERVAL_HOUR_TO_SECOND = 0xffffffffffffffa5;
enum SQL_C_INTERVAL_MINUTE_TO_SECOND = 0xffffffffffffffa4;
enum SQL_C_BINARY = 0xfffffffffffffffe;
enum SQL_C_BIT = 0xfffffffffffffff9;
enum SQL_C_TINYINT = 0xfffffffffffffffa;
enum SQL_C_GUID = 0xfffffffffffffff5;
enum SQL_TYPE_NULL = 0x00000000;
enum SQL_TYPE_MIN = 0xfffffffffffffff9;
enum SQL_TYPE_MAX = 0x0000000c;
enum SQL_DRIVER_C_TYPE_BASE = 0x00004000;
enum SQL_DRIVER_SQL_TYPE_BASE = 0x00004000;
enum SQL_DRIVER_DESC_FIELD_BASE = 0x00004000;
enum SQL_DRIVER_DIAG_FIELD_BASE = 0x00004000;
enum SQL_DRIVER_INFO_TYPE_BASE = 0x00004000;
enum SQL_DRIVER_CONN_ATTR_BASE = 0x00004000;
enum SQL_DRIVER_STMT_ATTR_BASE = 0x00004000;
enum SQL_C_VARBOOKMARK = 0xfffffffffffffffe;
enum SQL_NO_ROW_NUMBER = 0xffffffffffffffff;
enum SQL_NO_COLUMN_NUMBER = 0xffffffffffffffff;
enum SQL_ROW_NUMBER_UNKNOWN = 0xfffffffffffffffe;
enum SQL_COLUMN_NUMBER_UNKNOWN = 0xfffffffffffffffe;
enum SQL_DEFAULT_PARAM = 0xfffffffffffffffb;
enum SQL_IGNORE = 0xfffffffffffffffa;
enum SQL_COLUMN_IGNORE = 0xfffffffffffffffa;
enum SQL_LEN_DATA_AT_EXEC_OFFSET = 0xffffffffffffff9c;
enum SQL_LEN_BINARY_ATTR_OFFSET = 0xffffffffffffff9c;
enum SQL_SETPARAM_VALUE_MAX = 0xffffffffffffffff;
enum SQL_COLUMN_COUNT = 0x00000000;
enum SQL_COLUMN_NAME = 0x00000001;
enum SQL_COLUMN_TYPE = 0x00000002;
enum SQL_COLUMN_LENGTH = 0x00000003;
enum SQL_COLUMN_PRECISION = 0x00000004;
enum SQL_COLUMN_SCALE = 0x00000005;
enum SQL_COLUMN_DISPLAY_SIZE = 0x00000006;
enum SQL_COLUMN_NULLABLE = 0x00000007;
enum SQL_COLUMN_UNSIGNED = 0x00000008;
enum SQL_COLUMN_MONEY = 0x00000009;
enum SQL_COLUMN_UPDATABLE = 0x0000000a;
enum SQL_COLUMN_AUTO_INCREMENT = 0x0000000b;
enum SQL_COLUMN_CASE_SENSITIVE = 0x0000000c;
enum SQL_COLUMN_SEARCHABLE = 0x0000000d;
enum SQL_COLUMN_TYPE_NAME = 0x0000000e;
enum SQL_COLUMN_TABLE_NAME = 0x0000000f;
enum SQL_COLUMN_OWNER_NAME = 0x00000010;
enum SQL_COLUMN_QUALIFIER_NAME = 0x00000011;
enum SQL_COLUMN_LABEL = 0x00000012;
enum SQL_COLATT_OPT_MAX = 0x00000012;
enum SQL_COLUMN_DRIVER_START = 0x000003e8;
enum SQL_COLATT_OPT_MIN = 0x00000000;
enum SQL_ATTR_READONLY = 0x00000000;
enum SQL_ATTR_WRITE = 0x00000001;
enum SQL_ATTR_READWRITE_UNKNOWN = 0x00000002;
enum SQL_UNSEARCHABLE = 0x00000000;
enum SQL_LIKE_ONLY = 0x00000001;
enum SQL_ALL_EXCEPT_LIKE = 0x00000002;
enum SQL_SEARCHABLE = 0x00000003;
enum SQL_PRED_SEARCHABLE = 0x00000003;
enum SQL_NO_TOTAL = 0xfffffffffffffffc;
enum SQL_API_SQLALLOCHANDLESTD = 0x00000049;
enum SQL_API_SQLBULKOPERATIONS = 0x00000018;
enum SQL_API_SQLBINDPARAMETER = 0x00000048;
enum SQL_API_SQLBROWSECONNECT = 0x00000037;
enum SQL_API_SQLCOLATTRIBUTES = 0x00000006;
enum SQL_API_SQLCOLUMNPRIVILEGES = 0x00000038;
enum SQL_API_SQLDESCRIBEPARAM = 0x0000003a;
enum SQL_API_SQLDRIVERCONNECT = 0x00000029;
enum SQL_API_SQLDRIVERS = 0x00000047;
enum SQL_API_SQLPRIVATEDRIVERS = 0x0000004f;
enum SQL_API_SQLEXTENDEDFETCH = 0x0000003b;
enum SQL_API_SQLFOREIGNKEYS = 0x0000003c;
enum SQL_API_SQLMORERESULTS = 0x0000003d;
enum SQL_API_SQLNATIVESQL = 0x0000003e;
enum SQL_API_SQLNUMPARAMS = 0x0000003f;
enum SQL_API_SQLPARAMOPTIONS = 0x00000040;
enum SQL_API_SQLPRIMARYKEYS = 0x00000041;
enum SQL_API_SQLPROCEDURECOLUMNS = 0x00000042;
enum SQL_API_SQLPROCEDURES = 0x00000043;
enum SQL_API_SQLSETPOS = 0x00000044;
enum SQL_API_SQLSETSCROLLOPTIONS = 0x00000045;
enum SQL_API_SQLTABLEPRIVILEGES = 0x00000046;
enum SQL_EXT_API_LAST = 0x00000048;
enum SQL_NUM_FUNCTIONS = 0x00000017;
enum SQL_EXT_API_START = 0x00000028;
enum SQL_API_ALL_FUNCTIONS = 0x00000000;
enum SQL_API_LOADBYORDINAL = 0x000000c7;
enum SQL_API_ODBC3_ALL_FUNCTIONS = 0x000003e7;
enum SQL_API_ODBC3_ALL_FUNCTIONS_SIZE = 0x000000fa;
enum SQL_INFO_FIRST = 0x00000000;
enum SQL_ACTIVE_CONNECTIONS = 0x00000000;
enum SQL_ACTIVE_STATEMENTS = 0x00000001;
enum SQL_DRIVER_HDBC = 0x00000003;
enum SQL_DRIVER_HENV = 0x00000004;
enum SQL_DRIVER_HSTMT = 0x00000005;
enum SQL_DRIVER_NAME = 0x00000006;
enum SQL_DRIVER_VER = 0x00000007;
enum SQL_ODBC_API_CONFORMANCE = 0x00000009;
enum SQL_ODBC_VER = 0x0000000a;
enum SQL_ROW_UPDATES = 0x0000000b;
enum SQL_ODBC_SAG_CLI_CONFORMANCE = 0x0000000c;
enum SQL_ODBC_SQL_CONFORMANCE = 0x0000000f;
enum SQL_PROCEDURES = 0x00000015;
enum SQL_CONCAT_NULL_BEHAVIOR = 0x00000016;
enum SQL_CURSOR_ROLLBACK_BEHAVIOR = 0x00000018;
enum SQL_EXPRESSIONS_IN_ORDERBY = 0x0000001b;
enum SQL_MAX_OWNER_NAME_LEN = 0x00000020;
enum SQL_MAX_PROCEDURE_NAME_LEN = 0x00000021;
enum SQL_MAX_QUALIFIER_NAME_LEN = 0x00000022;
enum SQL_MULT_RESULT_SETS = 0x00000024;
enum SQL_MULTIPLE_ACTIVE_TXN = 0x00000025;
enum SQL_OUTER_JOINS = 0x00000026;
enum SQL_OWNER_TERM = 0x00000027;
enum SQL_PROCEDURE_TERM = 0x00000028;
enum SQL_QUALIFIER_NAME_SEPARATOR = 0x00000029;
enum SQL_QUALIFIER_TERM = 0x0000002a;
enum SQL_SCROLL_OPTIONS = 0x0000002c;
enum SQL_TABLE_TERM = 0x0000002d;
enum SQL_CONVERT_FUNCTIONS = 0x00000030;
enum SQL_NUMERIC_FUNCTIONS = 0x00000031;
enum SQL_STRING_FUNCTIONS = 0x00000032;
enum SQL_SYSTEM_FUNCTIONS = 0x00000033;
enum SQL_TIMEDATE_FUNCTIONS = 0x00000034;
enum SQL_CONVERT_BIGINT = 0x00000035;
enum SQL_CONVERT_BINARY = 0x00000036;
enum SQL_CONVERT_BIT = 0x00000037;
enum SQL_CONVERT_CHAR = 0x00000038;
enum SQL_CONVERT_DATE = 0x00000039;
enum SQL_CONVERT_DECIMAL = 0x0000003a;
enum SQL_CONVERT_DOUBLE = 0x0000003b;
enum SQL_CONVERT_FLOAT = 0x0000003c;
enum SQL_CONVERT_INTEGER = 0x0000003d;
enum SQL_CONVERT_LONGVARCHAR = 0x0000003e;
enum SQL_CONVERT_NUMERIC = 0x0000003f;
enum SQL_CONVERT_REAL = 0x00000040;
enum SQL_CONVERT_SMALLINT = 0x00000041;
enum SQL_CONVERT_TIME = 0x00000042;
enum SQL_CONVERT_TIMESTAMP = 0x00000043;
enum SQL_CONVERT_TINYINT = 0x00000044;
enum SQL_CONVERT_VARBINARY = 0x00000045;
enum SQL_CONVERT_VARCHAR = 0x00000046;
enum SQL_CONVERT_LONGVARBINARY = 0x00000047;
enum SQL_ODBC_SQL_OPT_IEF = 0x00000049;
enum SQL_CORRELATION_NAME = 0x0000004a;
enum SQL_NON_NULLABLE_COLUMNS = 0x0000004b;
enum SQL_DRIVER_HLIB = 0x0000004c;
enum SQL_DRIVER_ODBC_VER = 0x0000004d;
enum SQL_LOCK_TYPES = 0x0000004e;
enum SQL_POS_OPERATIONS = 0x0000004f;
enum SQL_POSITIONED_STATEMENTS = 0x00000050;
enum SQL_BOOKMARK_PERSISTENCE = 0x00000052;
enum SQL_STATIC_SENSITIVITY = 0x00000053;
enum SQL_FILE_USAGE = 0x00000054;
enum SQL_COLUMN_ALIAS = 0x00000057;
enum SQL_GROUP_BY = 0x00000058;
enum SQL_KEYWORDS = 0x00000059;
enum SQL_OWNER_USAGE = 0x0000005b;
enum SQL_QUALIFIER_USAGE = 0x0000005c;
enum SQL_QUOTED_IDENTIFIER_CASE = 0x0000005d;
enum SQL_SUBQUERIES = 0x0000005f;
enum SQL_UNION = 0x00000060;
enum SQL_MAX_ROW_SIZE_INCLUDES_LONG = 0x00000067;
enum SQL_MAX_CHAR_LITERAL_LEN = 0x0000006c;
enum SQL_TIMEDATE_ADD_INTERVALS = 0x0000006d;
enum SQL_TIMEDATE_DIFF_INTERVALS = 0x0000006e;
enum SQL_NEED_LONG_DATA_LEN = 0x0000006f;
enum SQL_MAX_BINARY_LITERAL_LEN = 0x00000070;
enum SQL_LIKE_ESCAPE_CLAUSE = 0x00000071;
enum SQL_QUALIFIER_LOCATION = 0x00000072;
enum SQL_INFO_LAST = 0x00000072;
enum SQL_INFO_DRIVER_START = 0x000003e8;
enum SQL_ACTIVE_ENVIRONMENTS = 0x00000074;
enum SQL_ALTER_DOMAIN = 0x00000075;
enum SQL_SQL_CONFORMANCE = 0x00000076;
enum SQL_DATETIME_LITERALS = 0x00000077;
enum SQL_ASYNC_MODE = 0x00002725;
enum SQL_BATCH_ROW_COUNT = 0x00000078;
enum SQL_BATCH_SUPPORT = 0x00000079;
enum SQL_CATALOG_LOCATION = 0x00000072;
enum SQL_CATALOG_NAME_SEPARATOR = 0x00000029;
enum SQL_CATALOG_TERM = 0x0000002a;
enum SQL_CATALOG_USAGE = 0x0000005c;
enum SQL_CONVERT_WCHAR = 0x0000007a;
enum SQL_CONVERT_INTERVAL_DAY_TIME = 0x0000007b;
enum SQL_CONVERT_INTERVAL_YEAR_MONTH = 0x0000007c;
enum SQL_CONVERT_WLONGVARCHAR = 0x0000007d;
enum SQL_CONVERT_WVARCHAR = 0x0000007e;
enum SQL_CREATE_ASSERTION = 0x0000007f;
enum SQL_CREATE_CHARACTER_SET = 0x00000080;
enum SQL_CREATE_COLLATION = 0x00000081;
enum SQL_CREATE_DOMAIN = 0x00000082;
enum SQL_CREATE_SCHEMA = 0x00000083;
enum SQL_CREATE_TABLE = 0x00000084;
enum SQL_CREATE_TRANSLATION = 0x00000085;
enum SQL_CREATE_VIEW = 0x00000086;
enum SQL_DRIVER_HDESC = 0x00000087;
enum SQL_DROP_ASSERTION = 0x00000088;
enum SQL_DROP_CHARACTER_SET = 0x00000089;
enum SQL_DROP_COLLATION = 0x0000008a;
enum SQL_DROP_DOMAIN = 0x0000008b;
enum SQL_DROP_SCHEMA = 0x0000008c;
enum SQL_DROP_TABLE = 0x0000008d;
enum SQL_DROP_TRANSLATION = 0x0000008e;
enum SQL_DROP_VIEW = 0x0000008f;
enum SQL_DYNAMIC_CURSOR_ATTRIBUTES1 = 0x00000090;
enum SQL_DYNAMIC_CURSOR_ATTRIBUTES2 = 0x00000091;
enum SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES1 = 0x00000092;
enum SQL_FORWARD_ONLY_CURSOR_ATTRIBUTES2 = 0x00000093;
enum SQL_INDEX_KEYWORDS = 0x00000094;
enum SQL_INFO_SCHEMA_VIEWS = 0x00000095;
enum SQL_KEYSET_CURSOR_ATTRIBUTES1 = 0x00000096;
enum SQL_KEYSET_CURSOR_ATTRIBUTES2 = 0x00000097;
enum SQL_MAX_ASYNC_CONCURRENT_STATEMENTS = 0x00002726;
enum SQL_ODBC_INTERFACE_CONFORMANCE = 0x00000098;
enum SQL_PARAM_ARRAY_ROW_COUNTS = 0x00000099;
enum SQL_PARAM_ARRAY_SELECTS = 0x0000009a;
enum SQL_SCHEMA_TERM = 0x00000027;
enum SQL_SCHEMA_USAGE = 0x0000005b;
enum SQL_SQL92_DATETIME_FUNCTIONS = 0x0000009b;
enum SQL_SQL92_FOREIGN_KEY_DELETE_RULE = 0x0000009c;
enum SQL_SQL92_FOREIGN_KEY_UPDATE_RULE = 0x0000009d;
enum SQL_SQL92_GRANT = 0x0000009e;
enum SQL_SQL92_NUMERIC_VALUE_FUNCTIONS = 0x0000009f;
enum SQL_SQL92_PREDICATES = 0x000000a0;
enum SQL_SQL92_RELATIONAL_JOIN_OPERATORS = 0x000000a1;
enum SQL_SQL92_REVOKE = 0x000000a2;
enum SQL_SQL92_ROW_VALUE_CONSTRUCTOR = 0x000000a3;
enum SQL_SQL92_STRING_FUNCTIONS = 0x000000a4;
enum SQL_SQL92_VALUE_EXPRESSIONS = 0x000000a5;
enum SQL_STANDARD_CLI_CONFORMANCE = 0x000000a6;
enum SQL_STATIC_CURSOR_ATTRIBUTES1 = 0x000000a7;
enum SQL_STATIC_CURSOR_ATTRIBUTES2 = 0x000000a8;
enum SQL_AGGREGATE_FUNCTIONS = 0x000000a9;
enum SQL_DDL_INDEX = 0x000000aa;
enum SQL_DM_VER = 0x000000ab;
enum SQL_INSERT_STATEMENT = 0x000000ac;
enum SQL_CONVERT_GUID = 0x000000ad;
enum SQL_UNION_STATEMENT = 0x00000060;
enum SQL_ASYNC_DBC_FUNCTIONS = 0x00002727;
enum SQL_DRIVER_AWARE_POOLING_SUPPORTED = 0x00002728;
enum SQL_ASYNC_NOTIFICATION = 0x00002729;
enum SQL_ASYNC_NOTIFICATION_NOT_CAPABLE = 0x00000000;
enum SQL_ASYNC_NOTIFICATION_CAPABLE = 0x00000001;
enum SQL_DTC_TRANSITION_COST = 0x000006d6;
enum SQL_AT_ADD_COLUMN_SINGLE = 0x00000020;
enum SQL_AT_ADD_COLUMN_DEFAULT = 0x00000040;
enum SQL_AT_ADD_COLUMN_COLLATION = 0x00000080;
enum SQL_AT_SET_COLUMN_DEFAULT = 0x00000100;
enum SQL_AT_DROP_COLUMN_DEFAULT = 0x00000200;
enum SQL_AT_DROP_COLUMN_CASCADE = 0x00000400;
enum SQL_AT_DROP_COLUMN_RESTRICT = 0x00000800;
enum SQL_AT_ADD_TABLE_CONSTRAINT = 0x00001000;
enum SQL_AT_DROP_TABLE_CONSTRAINT_CASCADE = 0x00002000;
enum SQL_AT_DROP_TABLE_CONSTRAINT_RESTRICT = 0x00004000;
enum SQL_AT_CONSTRAINT_NAME_DEFINITION = 0x00008000;
enum SQL_AT_CONSTRAINT_INITIALLY_DEFERRED = 0x00010000;
enum SQL_AT_CONSTRAINT_INITIALLY_IMMEDIATE = 0x00020000;
enum SQL_AT_CONSTRAINT_DEFERRABLE = 0x00040000;
enum SQL_AT_CONSTRAINT_NON_DEFERRABLE = 0x00080000;
enum SQL_CVT_CHAR = 0x00000001;
enum SQL_CVT_NUMERIC = 0x00000002;
enum SQL_CVT_DECIMAL = 0x00000004;
enum SQL_CVT_INTEGER = 0x00000008;
enum SQL_CVT_SMALLINT = 0x00000010;
enum SQL_CVT_FLOAT = 0x00000020;
enum SQL_CVT_REAL = 0x00000040;
enum SQL_CVT_DOUBLE = 0x00000080;
enum SQL_CVT_VARCHAR = 0x00000100;
enum SQL_CVT_LONGVARCHAR = 0x00000200;
enum SQL_CVT_BINARY = 0x00000400;
enum SQL_CVT_VARBINARY = 0x00000800;
enum SQL_CVT_BIT = 0x00001000;
enum SQL_CVT_TINYINT = 0x00002000;
enum SQL_CVT_BIGINT = 0x00004000;
enum SQL_CVT_DATE = 0x00008000;
enum SQL_CVT_TIME = 0x00010000;
enum SQL_CVT_TIMESTAMP = 0x00020000;
enum SQL_CVT_LONGVARBINARY = 0x00040000;
enum SQL_CVT_INTERVAL_YEAR_MONTH = 0x00080000;
enum SQL_CVT_INTERVAL_DAY_TIME = 0x00100000;
enum SQL_CVT_WCHAR = 0x00200000;
enum SQL_CVT_WLONGVARCHAR = 0x00400000;
enum SQL_CVT_WVARCHAR = 0x00800000;
enum SQL_CVT_GUID = 0x01000000;
enum SQL_FN_CVT_CONVERT = 0x00000001;
enum SQL_FN_CVT_CAST = 0x00000002;
enum SQL_FN_STR_CONCAT = 0x00000001;
enum SQL_FN_STR_INSERT = 0x00000002;
enum SQL_FN_STR_LEFT = 0x00000004;
enum SQL_FN_STR_LTRIM = 0x00000008;
enum SQL_FN_STR_LENGTH = 0x00000010;
enum SQL_FN_STR_LOCATE = 0x00000020;
enum SQL_FN_STR_LCASE = 0x00000040;
enum SQL_FN_STR_REPEAT = 0x00000080;
enum SQL_FN_STR_REPLACE = 0x00000100;
enum SQL_FN_STR_RIGHT = 0x00000200;
enum SQL_FN_STR_RTRIM = 0x00000400;
enum SQL_FN_STR_SUBSTRING = 0x00000800;
enum SQL_FN_STR_UCASE = 0x00001000;
enum SQL_FN_STR_ASCII = 0x00002000;
enum SQL_FN_STR_CHAR = 0x00004000;
enum SQL_FN_STR_DIFFERENCE = 0x00008000;
enum SQL_FN_STR_LOCATE_2 = 0x00010000;
enum SQL_FN_STR_SOUNDEX = 0x00020000;
enum SQL_FN_STR_SPACE = 0x00040000;
enum SQL_FN_STR_BIT_LENGTH = 0x00080000;
enum SQL_FN_STR_CHAR_LENGTH = 0x00100000;
enum SQL_FN_STR_CHARACTER_LENGTH = 0x00200000;
enum SQL_FN_STR_OCTET_LENGTH = 0x00400000;
enum SQL_FN_STR_POSITION = 0x00800000;
enum SQL_SSF_CONVERT = 0x00000001;
enum SQL_SSF_LOWER = 0x00000002;
enum SQL_SSF_UPPER = 0x00000004;
enum SQL_SSF_SUBSTRING = 0x00000008;
enum SQL_SSF_TRANSLATE = 0x00000010;
enum SQL_SSF_TRIM_BOTH = 0x00000020;
enum SQL_SSF_TRIM_LEADING = 0x00000040;
enum SQL_SSF_TRIM_TRAILING = 0x00000080;
enum SQL_FN_NUM_ABS = 0x00000001;
enum SQL_FN_NUM_ACOS = 0x00000002;
enum SQL_FN_NUM_ASIN = 0x00000004;
enum SQL_FN_NUM_ATAN = 0x00000008;
enum SQL_FN_NUM_ATAN2 = 0x00000010;
enum SQL_FN_NUM_CEILING = 0x00000020;
enum SQL_FN_NUM_COS = 0x00000040;
enum SQL_FN_NUM_COT = 0x00000080;
enum SQL_FN_NUM_EXP = 0x00000100;
enum SQL_FN_NUM_FLOOR = 0x00000200;
enum SQL_FN_NUM_LOG = 0x00000400;
enum SQL_FN_NUM_MOD = 0x00000800;
enum SQL_FN_NUM_SIGN = 0x00001000;
enum SQL_FN_NUM_SIN = 0x00002000;
enum SQL_FN_NUM_SQRT = 0x00004000;
enum SQL_FN_NUM_TAN = 0x00008000;
enum SQL_FN_NUM_PI = 0x00010000;
enum SQL_FN_NUM_RAND = 0x00020000;
enum SQL_FN_NUM_DEGREES = 0x00040000;
enum SQL_FN_NUM_LOG10 = 0x00080000;
enum SQL_FN_NUM_POWER = 0x00100000;
enum SQL_FN_NUM_RADIANS = 0x00200000;
enum SQL_FN_NUM_ROUND = 0x00400000;
enum SQL_FN_NUM_TRUNCATE = 0x00800000;
enum SQL_SNVF_BIT_LENGTH = 0x00000001;
enum SQL_SNVF_CHAR_LENGTH = 0x00000002;
enum SQL_SNVF_CHARACTER_LENGTH = 0x00000004;
enum SQL_SNVF_EXTRACT = 0x00000008;
enum SQL_SNVF_OCTET_LENGTH = 0x00000010;
enum SQL_SNVF_POSITION = 0x00000020;
enum SQL_FN_TD_NOW = 0x00000001;
enum SQL_FN_TD_CURDATE = 0x00000002;
enum SQL_FN_TD_DAYOFMONTH = 0x00000004;
enum SQL_FN_TD_DAYOFWEEK = 0x00000008;
enum SQL_FN_TD_DAYOFYEAR = 0x00000010;
enum SQL_FN_TD_MONTH = 0x00000020;
enum SQL_FN_TD_QUARTER = 0x00000040;
enum SQL_FN_TD_WEEK = 0x00000080;
enum SQL_FN_TD_YEAR = 0x00000100;
enum SQL_FN_TD_CURTIME = 0x00000200;
enum SQL_FN_TD_HOUR = 0x00000400;
enum SQL_FN_TD_MINUTE = 0x00000800;
enum SQL_FN_TD_SECOND = 0x00001000;
enum SQL_FN_TD_TIMESTAMPADD = 0x00002000;
enum SQL_FN_TD_TIMESTAMPDIFF = 0x00004000;
enum SQL_FN_TD_DAYNAME = 0x00008000;
enum SQL_FN_TD_MONTHNAME = 0x00010000;
enum SQL_FN_TD_CURRENT_DATE = 0x00020000;
enum SQL_FN_TD_CURRENT_TIME = 0x00040000;
enum SQL_FN_TD_CURRENT_TIMESTAMP = 0x00080000;
enum SQL_FN_TD_EXTRACT = 0x00100000;
enum SQL_SDF_CURRENT_DATE = 0x00000001;
enum SQL_SDF_CURRENT_TIME = 0x00000002;
enum SQL_SDF_CURRENT_TIMESTAMP = 0x00000004;
enum SQL_FN_SYS_USERNAME = 0x00000001;
enum SQL_FN_SYS_DBNAME = 0x00000002;
enum SQL_FN_SYS_IFNULL = 0x00000004;
enum SQL_FN_TSI_FRAC_SECOND = 0x00000001;
enum SQL_FN_TSI_SECOND = 0x00000002;
enum SQL_FN_TSI_MINUTE = 0x00000004;
enum SQL_FN_TSI_HOUR = 0x00000008;
enum SQL_FN_TSI_DAY = 0x00000010;
enum SQL_FN_TSI_WEEK = 0x00000020;
enum SQL_FN_TSI_MONTH = 0x00000040;
enum SQL_FN_TSI_QUARTER = 0x00000080;
enum SQL_FN_TSI_YEAR = 0x00000100;
enum SQL_CA1_NEXT = 0x00000001;
enum SQL_CA1_ABSOLUTE = 0x00000002;
enum SQL_CA1_RELATIVE = 0x00000004;
enum SQL_CA1_BOOKMARK = 0x00000008;
enum SQL_CA1_LOCK_NO_CHANGE = 0x00000040;
enum SQL_CA1_LOCK_EXCLUSIVE = 0x00000080;
enum SQL_CA1_LOCK_UNLOCK = 0x00000100;
enum SQL_CA1_POS_POSITION = 0x00000200;
enum SQL_CA1_POS_UPDATE = 0x00000400;
enum SQL_CA1_POS_DELETE = 0x00000800;
enum SQL_CA1_POS_REFRESH = 0x00001000;
enum SQL_CA1_POSITIONED_UPDATE = 0x00002000;
enum SQL_CA1_POSITIONED_DELETE = 0x00004000;
enum SQL_CA1_SELECT_FOR_UPDATE = 0x00008000;
enum SQL_CA1_BULK_ADD = 0x00010000;
enum SQL_CA1_BULK_UPDATE_BY_BOOKMARK = 0x00020000;
enum SQL_CA1_BULK_DELETE_BY_BOOKMARK = 0x00040000;
enum SQL_CA1_BULK_FETCH_BY_BOOKMARK = 0x00080000;
enum SQL_CA2_READ_ONLY_CONCURRENCY = 0x00000001;
enum SQL_CA2_LOCK_CONCURRENCY = 0x00000002;
enum SQL_CA2_OPT_ROWVER_CONCURRENCY = 0x00000004;
enum SQL_CA2_OPT_VALUES_CONCURRENCY = 0x00000008;
enum SQL_CA2_SENSITIVITY_ADDITIONS = 0x00000010;
enum SQL_CA2_SENSITIVITY_DELETIONS = 0x00000020;
enum SQL_CA2_SENSITIVITY_UPDATES = 0x00000040;
enum SQL_CA2_MAX_ROWS_SELECT = 0x00000080;
enum SQL_CA2_MAX_ROWS_INSERT = 0x00000100;
enum SQL_CA2_MAX_ROWS_DELETE = 0x00000200;
enum SQL_CA2_MAX_ROWS_UPDATE = 0x00000400;
enum SQL_CA2_MAX_ROWS_CATALOG = 0x00000800;
enum SQL_CA2_CRC_EXACT = 0x00001000;
enum SQL_CA2_CRC_APPROXIMATE = 0x00002000;
enum SQL_CA2_SIMULATE_NON_UNIQUE = 0x00004000;
enum SQL_CA2_SIMULATE_TRY_UNIQUE = 0x00008000;
enum SQL_CA2_SIMULATE_UNIQUE = 0x00010000;
enum SQL_OAC_NONE = 0x00000000;
enum SQL_OAC_LEVEL1 = 0x00000001;
enum SQL_OAC_LEVEL2 = 0x00000002;
enum SQL_OSCC_NOT_COMPLIANT = 0x00000000;
enum SQL_OSCC_COMPLIANT = 0x00000001;
enum SQL_OSC_MINIMUM = 0x00000000;
enum SQL_OSC_CORE = 0x00000001;
enum SQL_OSC_EXTENDED = 0x00000002;
enum SQL_CB_NULL = 0x00000000;
enum SQL_CB_NON_NULL = 0x00000001;
enum SQL_SO_FORWARD_ONLY = 0x00000001;
enum SQL_SO_KEYSET_DRIVEN = 0x00000002;
enum SQL_SO_DYNAMIC = 0x00000004;
enum SQL_SO_MIXED = 0x00000008;
enum SQL_SO_STATIC = 0x00000010;
enum SQL_FD_FETCH_RESUME = 0x00000040;
enum SQL_FD_FETCH_BOOKMARK = 0x00000080;
enum SQL_TXN_VERSIONING = 0x00000010;
enum SQL_CN_NONE = 0x00000000;
enum SQL_CN_DIFFERENT = 0x00000001;
enum SQL_CN_ANY = 0x00000002;
enum SQL_NNC_NULL = 0x00000000;
enum SQL_NNC_NON_NULL = 0x00000001;
enum SQL_NC_START = 0x00000002;
enum SQL_NC_END = 0x00000004;
enum SQL_FILE_NOT_SUPPORTED = 0x00000000;
enum SQL_FILE_TABLE = 0x00000001;
enum SQL_FILE_QUALIFIER = 0x00000002;
enum SQL_FILE_CATALOG = 0x00000002;
enum SQL_GD_BLOCK = 0x00000004;
enum SQL_GD_BOUND = 0x00000008;
enum SQL_GD_OUTPUT_PARAMS = 0x00000010;
enum SQL_PS_POSITIONED_DELETE = 0x00000001;
enum SQL_PS_POSITIONED_UPDATE = 0x00000002;
enum SQL_PS_SELECT_FOR_UPDATE = 0x00000004;
enum SQL_GB_NOT_SUPPORTED = 0x00000000;
enum SQL_GB_GROUP_BY_EQUALS_SELECT = 0x00000001;
enum SQL_GB_GROUP_BY_CONTAINS_SELECT = 0x00000002;
enum SQL_GB_NO_RELATION = 0x00000003;
enum SQL_GB_COLLATE = 0x00000004;
enum SQL_OU_DML_STATEMENTS = 0x00000001;
enum SQL_OU_PROCEDURE_INVOCATION = 0x00000002;
enum SQL_OU_TABLE_DEFINITION = 0x00000004;
enum SQL_OU_INDEX_DEFINITION = 0x00000008;
enum SQL_OU_PRIVILEGE_DEFINITION = 0x00000010;
enum SQL_SU_DML_STATEMENTS = 0x00000001;
enum SQL_SU_PROCEDURE_INVOCATION = 0x00000002;
enum SQL_SU_TABLE_DEFINITION = 0x00000004;
enum SQL_SU_INDEX_DEFINITION = 0x00000008;
enum SQL_SU_PRIVILEGE_DEFINITION = 0x00000010;
enum SQL_QU_DML_STATEMENTS = 0x00000001;
enum SQL_QU_PROCEDURE_INVOCATION = 0x00000002;
enum SQL_QU_TABLE_DEFINITION = 0x00000004;
enum SQL_QU_INDEX_DEFINITION = 0x00000008;
enum SQL_QU_PRIVILEGE_DEFINITION = 0x00000010;
enum SQL_CU_DML_STATEMENTS = 0x00000001;
enum SQL_CU_PROCEDURE_INVOCATION = 0x00000002;
enum SQL_CU_TABLE_DEFINITION = 0x00000004;
enum SQL_CU_INDEX_DEFINITION = 0x00000008;
enum SQL_CU_PRIVILEGE_DEFINITION = 0x00000010;
enum SQL_SQ_COMPARISON = 0x00000001;
enum SQL_SQ_EXISTS = 0x00000002;
enum SQL_SQ_IN = 0x00000004;
enum SQL_SQ_QUANTIFIED = 0x00000008;
enum SQL_SQ_CORRELATED_SUBQUERIES = 0x00000010;
enum SQL_U_UNION = 0x00000001;
enum SQL_U_UNION_ALL = 0x00000002;
enum SQL_BP_CLOSE = 0x00000001;
enum SQL_BP_DELETE = 0x00000002;
enum SQL_BP_DROP = 0x00000004;
enum SQL_BP_TRANSACTION = 0x00000008;
enum SQL_BP_UPDATE = 0x00000010;
enum SQL_BP_OTHER_HSTMT = 0x00000020;
enum SQL_BP_SCROLL = 0x00000040;
enum SQL_SS_ADDITIONS = 0x00000001;
enum SQL_SS_DELETIONS = 0x00000002;
enum SQL_SS_UPDATES = 0x00000004;
enum SQL_CV_CREATE_VIEW = 0x00000001;
enum SQL_CV_CHECK_OPTION = 0x00000002;
enum SQL_CV_CASCADED = 0x00000004;
enum SQL_CV_LOCAL = 0x00000008;
enum SQL_LCK_NO_CHANGE = 0x00000001;
enum SQL_LCK_EXCLUSIVE = 0x00000002;
enum SQL_LCK_UNLOCK = 0x00000004;
enum SQL_POS_POSITION = 0x00000001;
enum SQL_POS_REFRESH = 0x00000002;
enum SQL_POS_UPDATE = 0x00000004;
enum SQL_POS_DELETE = 0x00000008;
enum SQL_POS_ADD = 0x00000010;
enum SQL_QL_START = 0x00000001;
enum SQL_QL_END = 0x00000002;
enum SQL_AF_AVG = 0x00000001;
enum SQL_AF_COUNT = 0x00000002;
enum SQL_AF_MAX = 0x00000004;
enum SQL_AF_MIN = 0x00000008;
enum SQL_AF_SUM = 0x00000010;
enum SQL_AF_DISTINCT = 0x00000020;
enum SQL_AF_ALL = 0x00000040;
enum SQL_SC_SQL92_ENTRY = 0x00000001;
enum SQL_SC_FIPS127_2_TRANSITIONAL = 0x00000002;
enum SQL_SC_SQL92_INTERMEDIATE = 0x00000004;
enum SQL_SC_SQL92_FULL = 0x00000008;
enum SQL_DL_SQL92_DATE = 0x00000001;
enum SQL_DL_SQL92_TIME = 0x00000002;
enum SQL_DL_SQL92_TIMESTAMP = 0x00000004;
enum SQL_DL_SQL92_INTERVAL_YEAR = 0x00000008;
enum SQL_DL_SQL92_INTERVAL_MONTH = 0x00000010;
enum SQL_DL_SQL92_INTERVAL_DAY = 0x00000020;
enum SQL_DL_SQL92_INTERVAL_HOUR = 0x00000040;
enum SQL_DL_SQL92_INTERVAL_MINUTE = 0x00000080;
enum SQL_DL_SQL92_INTERVAL_SECOND = 0x00000100;
enum SQL_DL_SQL92_INTERVAL_YEAR_TO_MONTH = 0x00000200;
enum SQL_DL_SQL92_INTERVAL_DAY_TO_HOUR = 0x00000400;
enum SQL_DL_SQL92_INTERVAL_DAY_TO_MINUTE = 0x00000800;
enum SQL_DL_SQL92_INTERVAL_DAY_TO_SECOND = 0x00001000;
enum SQL_DL_SQL92_INTERVAL_HOUR_TO_MINUTE = 0x00002000;
enum SQL_DL_SQL92_INTERVAL_HOUR_TO_SECOND = 0x00004000;
enum SQL_DL_SQL92_INTERVAL_MINUTE_TO_SECOND = 0x00008000;
enum SQL_CL_START = 0x00000001;
enum SQL_CL_END = 0x00000002;
enum SQL_BRC_PROCEDURES = 0x00000001;
enum SQL_BRC_EXPLICIT = 0x00000002;
enum SQL_BRC_ROLLED_UP = 0x00000004;
enum SQL_BS_SELECT_EXPLICIT = 0x00000001;
enum SQL_BS_ROW_COUNT_EXPLICIT = 0x00000002;
enum SQL_BS_SELECT_PROC = 0x00000004;
enum SQL_BS_ROW_COUNT_PROC = 0x00000008;
enum SQL_PARC_BATCH = 0x00000001;
enum SQL_PARC_NO_BATCH = 0x00000002;
enum SQL_PAS_BATCH = 0x00000001;
enum SQL_PAS_NO_BATCH = 0x00000002;
enum SQL_PAS_NO_SELECT = 0x00000003;
enum SQL_IK_NONE = 0x00000000;
enum SQL_IK_ASC = 0x00000001;
enum SQL_IK_DESC = 0x00000002;
enum SQL_ISV_ASSERTIONS = 0x00000001;
enum SQL_ISV_CHARACTER_SETS = 0x00000002;
enum SQL_ISV_CHECK_CONSTRAINTS = 0x00000004;
enum SQL_ISV_COLLATIONS = 0x00000008;
enum SQL_ISV_COLUMN_DOMAIN_USAGE = 0x00000010;
enum SQL_ISV_COLUMN_PRIVILEGES = 0x00000020;
enum SQL_ISV_COLUMNS = 0x00000040;
enum SQL_ISV_CONSTRAINT_COLUMN_USAGE = 0x00000080;
enum SQL_ISV_CONSTRAINT_TABLE_USAGE = 0x00000100;
enum SQL_ISV_DOMAIN_CONSTRAINTS = 0x00000200;
enum SQL_ISV_DOMAINS = 0x00000400;
enum SQL_ISV_KEY_COLUMN_USAGE = 0x00000800;
enum SQL_ISV_REFERENTIAL_CONSTRAINTS = 0x00001000;
enum SQL_ISV_SCHEMATA = 0x00002000;
enum SQL_ISV_SQL_LANGUAGES = 0x00004000;
enum SQL_ISV_TABLE_CONSTRAINTS = 0x00008000;
enum SQL_ISV_TABLE_PRIVILEGES = 0x00010000;
enum SQL_ISV_TABLES = 0x00020000;
enum SQL_ISV_TRANSLATIONS = 0x00040000;
enum SQL_ISV_USAGE_PRIVILEGES = 0x00080000;
enum SQL_ISV_VIEW_COLUMN_USAGE = 0x00100000;
enum SQL_ISV_VIEW_TABLE_USAGE = 0x00200000;
enum SQL_ISV_VIEWS = 0x00400000;
enum SQL_AD_CONSTRAINT_NAME_DEFINITION = 0x00000001;
enum SQL_AD_ADD_DOMAIN_CONSTRAINT = 0x00000002;
enum SQL_AD_DROP_DOMAIN_CONSTRAINT = 0x00000004;
enum SQL_AD_ADD_DOMAIN_DEFAULT = 0x00000008;
enum SQL_AD_DROP_DOMAIN_DEFAULT = 0x00000010;
enum SQL_AD_ADD_CONSTRAINT_INITIALLY_DEFERRED = 0x00000020;
enum SQL_AD_ADD_CONSTRAINT_INITIALLY_IMMEDIATE = 0x00000040;
enum SQL_AD_ADD_CONSTRAINT_DEFERRABLE = 0x00000080;
enum SQL_AD_ADD_CONSTRAINT_NON_DEFERRABLE = 0x00000100;
enum SQL_CS_CREATE_SCHEMA = 0x00000001;
enum SQL_CS_AUTHORIZATION = 0x00000002;
enum SQL_CS_DEFAULT_CHARACTER_SET = 0x00000004;
enum SQL_CTR_CREATE_TRANSLATION = 0x00000001;
enum SQL_CA_CREATE_ASSERTION = 0x00000001;
enum SQL_CA_CONSTRAINT_INITIALLY_DEFERRED = 0x00000010;
enum SQL_CA_CONSTRAINT_INITIALLY_IMMEDIATE = 0x00000020;
enum SQL_CA_CONSTRAINT_DEFERRABLE = 0x00000040;
enum SQL_CA_CONSTRAINT_NON_DEFERRABLE = 0x00000080;
enum SQL_CCS_CREATE_CHARACTER_SET = 0x00000001;
enum SQL_CCS_COLLATE_CLAUSE = 0x00000002;
enum SQL_CCS_LIMITED_COLLATION = 0x00000004;
enum SQL_CCOL_CREATE_COLLATION = 0x00000001;
enum SQL_CDO_CREATE_DOMAIN = 0x00000001;
enum SQL_CDO_DEFAULT = 0x00000002;
enum SQL_CDO_CONSTRAINT = 0x00000004;
enum SQL_CDO_COLLATION = 0x00000008;
enum SQL_CDO_CONSTRAINT_NAME_DEFINITION = 0x00000010;
enum SQL_CDO_CONSTRAINT_INITIALLY_DEFERRED = 0x00000020;
enum SQL_CDO_CONSTRAINT_INITIALLY_IMMEDIATE = 0x00000040;
enum SQL_CDO_CONSTRAINT_DEFERRABLE = 0x00000080;
enum SQL_CDO_CONSTRAINT_NON_DEFERRABLE = 0x00000100;
enum SQL_CT_CREATE_TABLE = 0x00000001;
enum SQL_CT_COMMIT_PRESERVE = 0x00000002;
enum SQL_CT_COMMIT_DELETE = 0x00000004;
enum SQL_CT_GLOBAL_TEMPORARY = 0x00000008;
enum SQL_CT_LOCAL_TEMPORARY = 0x00000010;
enum SQL_CT_CONSTRAINT_INITIALLY_DEFERRED = 0x00000020;
enum SQL_CT_CONSTRAINT_INITIALLY_IMMEDIATE = 0x00000040;
enum SQL_CT_CONSTRAINT_DEFERRABLE = 0x00000080;
enum SQL_CT_CONSTRAINT_NON_DEFERRABLE = 0x00000100;
enum SQL_CT_COLUMN_CONSTRAINT = 0x00000200;
enum SQL_CT_COLUMN_DEFAULT = 0x00000400;
enum SQL_CT_COLUMN_COLLATION = 0x00000800;
enum SQL_CT_TABLE_CONSTRAINT = 0x00001000;
enum SQL_CT_CONSTRAINT_NAME_DEFINITION = 0x00002000;
enum SQL_DI_CREATE_INDEX = 0x00000001;
enum SQL_DI_DROP_INDEX = 0x00000002;
enum SQL_DC_DROP_COLLATION = 0x00000001;
enum SQL_DD_DROP_DOMAIN = 0x00000001;
enum SQL_DD_RESTRICT = 0x00000002;
enum SQL_DD_CASCADE = 0x00000004;
enum SQL_DS_DROP_SCHEMA = 0x00000001;
enum SQL_DS_RESTRICT = 0x00000002;
enum SQL_DS_CASCADE = 0x00000004;
enum SQL_DCS_DROP_CHARACTER_SET = 0x00000001;
enum SQL_DA_DROP_ASSERTION = 0x00000001;
enum SQL_DT_DROP_TABLE = 0x00000001;
enum SQL_DT_RESTRICT = 0x00000002;
enum SQL_DT_CASCADE = 0x00000004;
enum SQL_DTR_DROP_TRANSLATION = 0x00000001;
enum SQL_DV_DROP_VIEW = 0x00000001;
enum SQL_DV_RESTRICT = 0x00000002;
enum SQL_DV_CASCADE = 0x00000004;
enum SQL_IS_INSERT_LITERALS = 0x00000001;
enum SQL_IS_INSERT_SEARCHED = 0x00000002;
enum SQL_IS_SELECT_INTO = 0x00000004;
enum SQL_OIC_CORE = 0x00000001;
enum SQL_OIC_LEVEL1 = 0x00000002;
enum SQL_OIC_LEVEL2 = 0x00000003;
enum SQL_SFKD_CASCADE = 0x00000001;
enum SQL_SFKD_NO_ACTION = 0x00000002;
enum SQL_SFKD_SET_DEFAULT = 0x00000004;
enum SQL_SFKD_SET_NULL = 0x00000008;
enum SQL_SFKU_CASCADE = 0x00000001;
enum SQL_SFKU_NO_ACTION = 0x00000002;
enum SQL_SFKU_SET_DEFAULT = 0x00000004;
enum SQL_SFKU_SET_NULL = 0x00000008;
enum SQL_SG_USAGE_ON_DOMAIN = 0x00000001;
enum SQL_SG_USAGE_ON_CHARACTER_SET = 0x00000002;
enum SQL_SG_USAGE_ON_COLLATION = 0x00000004;
enum SQL_SG_USAGE_ON_TRANSLATION = 0x00000008;
enum SQL_SG_WITH_GRANT_OPTION = 0x00000010;
enum SQL_SG_DELETE_TABLE = 0x00000020;
enum SQL_SG_INSERT_TABLE = 0x00000040;
enum SQL_SG_INSERT_COLUMN = 0x00000080;
enum SQL_SG_REFERENCES_TABLE = 0x00000100;
enum SQL_SG_REFERENCES_COLUMN = 0x00000200;
enum SQL_SG_SELECT_TABLE = 0x00000400;
enum SQL_SG_UPDATE_TABLE = 0x00000800;
enum SQL_SG_UPDATE_COLUMN = 0x00001000;
enum SQL_SP_EXISTS = 0x00000001;
enum SQL_SP_ISNOTNULL = 0x00000002;
enum SQL_SP_ISNULL = 0x00000004;
enum SQL_SP_MATCH_FULL = 0x00000008;
enum SQL_SP_MATCH_PARTIAL = 0x00000010;
enum SQL_SP_MATCH_UNIQUE_FULL = 0x00000020;
enum SQL_SP_MATCH_UNIQUE_PARTIAL = 0x00000040;
enum SQL_SP_OVERLAPS = 0x00000080;
enum SQL_SP_UNIQUE = 0x00000100;
enum SQL_SP_LIKE = 0x00000200;
enum SQL_SP_IN = 0x00000400;
enum SQL_SP_BETWEEN = 0x00000800;
enum SQL_SP_COMPARISON = 0x00001000;
enum SQL_SP_QUANTIFIED_COMPARISON = 0x00002000;
enum SQL_SRJO_CORRESPONDING_CLAUSE = 0x00000001;
enum SQL_SRJO_CROSS_JOIN = 0x00000002;
enum SQL_SRJO_EXCEPT_JOIN = 0x00000004;
enum SQL_SRJO_FULL_OUTER_JOIN = 0x00000008;
enum SQL_SRJO_INNER_JOIN = 0x00000010;
enum SQL_SRJO_INTERSECT_JOIN = 0x00000020;
enum SQL_SRJO_LEFT_OUTER_JOIN = 0x00000040;
enum SQL_SRJO_NATURAL_JOIN = 0x00000080;
enum SQL_SRJO_RIGHT_OUTER_JOIN = 0x00000100;
enum SQL_SRJO_UNION_JOIN = 0x00000200;
enum SQL_SR_USAGE_ON_DOMAIN = 0x00000001;
enum SQL_SR_USAGE_ON_CHARACTER_SET = 0x00000002;
enum SQL_SR_USAGE_ON_COLLATION = 0x00000004;
enum SQL_SR_USAGE_ON_TRANSLATION = 0x00000008;
enum SQL_SR_GRANT_OPTION_FOR = 0x00000010;
enum SQL_SR_CASCADE = 0x00000020;
enum SQL_SR_RESTRICT = 0x00000040;
enum SQL_SR_DELETE_TABLE = 0x00000080;
enum SQL_SR_INSERT_TABLE = 0x00000100;
enum SQL_SR_INSERT_COLUMN = 0x00000200;
enum SQL_SR_REFERENCES_TABLE = 0x00000400;
enum SQL_SR_REFERENCES_COLUMN = 0x00000800;
enum SQL_SR_SELECT_TABLE = 0x00001000;
enum SQL_SR_UPDATE_TABLE = 0x00002000;
enum SQL_SR_UPDATE_COLUMN = 0x00004000;
enum SQL_SRVC_VALUE_EXPRESSION = 0x00000001;
enum SQL_SRVC_NULL = 0x00000002;
enum SQL_SRVC_DEFAULT = 0x00000004;
enum SQL_SRVC_ROW_SUBQUERY = 0x00000008;
enum SQL_SVE_CASE = 0x00000001;
enum SQL_SVE_CAST = 0x00000002;
enum SQL_SVE_COALESCE = 0x00000004;
enum SQL_SVE_NULLIF = 0x00000008;
enum SQL_SCC_XOPEN_CLI_VERSION1 = 0x00000001;
enum SQL_SCC_ISO92_CLI = 0x00000002;
enum SQL_US_UNION = 0x00000001;
enum SQL_US_UNION_ALL = 0x00000002;
enum SQL_DRIVER_AWARE_POOLING_NOT_CAPABLE = 0x00000000;
enum SQL_DRIVER_AWARE_POOLING_CAPABLE = 0x00000001;
enum SQL_DTC_ENLIST_EXPENSIVE = 0x00000001;
enum SQL_DTC_UNENLIST_EXPENSIVE = 0x00000002;
enum SQL_ASYNC_DBC_NOT_CAPABLE = 0x00000000;
enum SQL_ASYNC_DBC_CAPABLE = 0x00000001;
enum SQL_FETCH_FIRST_USER = 0x0000001f;
enum SQL_FETCH_FIRST_SYSTEM = 0x00000020;
enum SQL_ENTIRE_ROWSET = 0x00000000;
enum SQL_POSITION = 0x00000000;
enum SQL_REFRESH = 0x00000001;
enum SQL_UPDATE = 0x00000002;
enum SQL_DELETE = 0x00000003;
enum SQL_ADD = 0x00000004;
enum SQL_SETPOS_MAX_OPTION_VALUE = 0x00000004;
enum SQL_UPDATE_BY_BOOKMARK = 0x00000005;
enum SQL_DELETE_BY_BOOKMARK = 0x00000006;
enum SQL_FETCH_BY_BOOKMARK = 0x00000007;
enum SQL_LOCK_NO_CHANGE = 0x00000000;
enum SQL_LOCK_EXCLUSIVE = 0x00000001;
enum SQL_LOCK_UNLOCK = 0x00000002;
enum SQL_SETPOS_MAX_LOCK_VALUE = 0x00000002;
enum SQL_BEST_ROWID = 0x00000001;
enum SQL_ROWVER = 0x00000002;
enum SQL_PC_NOT_PSEUDO = 0x00000001;
enum SQL_QUICK = 0x00000000;
enum SQL_ENSURE = 0x00000001;
enum SQL_TABLE_STAT = 0x00000000;
enum SQL_ALL_CATALOGS = "%";
enum SQL_ALL_SCHEMAS = "%";
enum SQL_ALL_TABLE_TYPES = "%";
enum SQL_DRIVER_NOPROMPT = 0x00000000;
enum SQL_DRIVER_COMPLETE = 0x00000001;
enum SQL_DRIVER_PROMPT = 0x00000002;
enum SQL_DRIVER_COMPLETE_REQUIRED = 0x00000003;
enum SQL_FETCH_BOOKMARK = 0x00000008;
enum SQL_ROW_SUCCESS = 0x00000000;
enum SQL_ROW_DELETED = 0x00000001;
enum SQL_ROW_UPDATED = 0x00000002;
enum SQL_ROW_NOROW = 0x00000003;
enum SQL_ROW_ADDED = 0x00000004;
enum SQL_ROW_ERROR = 0x00000005;
enum SQL_ROW_SUCCESS_WITH_INFO = 0x00000006;
enum SQL_ROW_PROCEED = 0x00000000;
enum SQL_ROW_IGNORE = 0x00000001;
enum SQL_PARAM_SUCCESS = 0x00000000;
enum SQL_PARAM_SUCCESS_WITH_INFO = 0x00000006;
enum SQL_PARAM_ERROR = 0x00000005;
enum SQL_PARAM_UNUSED = 0x00000007;
enum SQL_PARAM_DIAG_UNAVAILABLE = 0x00000001;
enum SQL_PARAM_PROCEED = 0x00000000;
enum SQL_PARAM_IGNORE = 0x00000001;
enum SQL_CASCADE = 0x00000000;
enum SQL_RESTRICT = 0x00000001;
enum SQL_SET_NULL = 0x00000002;
enum SQL_NO_ACTION = 0x00000003;
enum SQL_SET_DEFAULT = 0x00000004;
enum SQL_INITIALLY_DEFERRED = 0x00000005;
enum SQL_INITIALLY_IMMEDIATE = 0x00000006;
enum SQL_NOT_DEFERRABLE = 0x00000007;
enum SQL_PARAM_TYPE_UNKNOWN = 0x00000000;
enum SQL_PARAM_INPUT = 0x00000001;
enum SQL_PARAM_INPUT_OUTPUT = 0x00000002;
enum SQL_RESULT_COL = 0x00000003;
enum SQL_PARAM_OUTPUT = 0x00000004;
enum SQL_RETURN_VALUE = 0x00000005;
enum SQL_PARAM_INPUT_OUTPUT_STREAM = 0x00000008;
enum SQL_PARAM_OUTPUT_STREAM = 0x00000010;
enum SQL_PT_UNKNOWN = 0x00000000;
enum SQL_PT_PROCEDURE = 0x00000001;
enum SQL_PT_FUNCTION = 0x00000002;
enum SQL_ODBC_KEYWORDS = "ABSOLUTE,ACTION,ADA,ADD,ALL,ALLOCATE,ALTER,AND,ANY,ARE,AS,ASC,ASSERTION,AT,AUTHORIZATION,AVG,BEGIN,BETWEEN,BIT,BIT_LENGTH,BOTH,BY,CASCADE,CASCADED,CASE,CAST,CATALOG,CHAR,CHAR_LENGTH,CHARACTER,CHARACTER_LENGTH,CHECK,CLOSE,COALESCE,COLLATE,COLLATION,COLUMN,COMMIT,CONNECT,CONNECTION,CONSTRAINT,CONSTRAINTS,CONTINUE,CONVERT,CORRESPONDING,COUNT,CREATE,CROSS,CURRENT,CURRENT_DATE,CURRENT_TIME,CURRENT_TIMESTAMP,CURRENT_USER,CURSOR,DATE,DAY,DEALLOCATE,DEC,DECIMAL,DECLARE,DEFAULT,DEFERRABLE,DEFERRED,DELETE,DESC,DESCRIBE,DESCRIPTOR,DIAGNOSTICS,DISCONNECT,DISTINCT,DOMAIN,DOUBLE,DROP,ELSE,END,END-EXEC,ESCAPE,EXCEPT,EXCEPTION,EXEC,EXECUTE,EXISTS,EXTERNAL,EXTRACT,FALSE,FETCH,FIRST,FLOAT,FOR,FOREIGN,FORTRAN,FOUND,FROM,FULL,GET,GLOBAL,GO,GOTO,GRANT,GROUP,HAVING,HOUR,IDENTITY,IMMEDIATE,IN,INCLUDE,INDEX,INDICATOR,INITIALLY,INNER,INPUT,INSENSITIVE,INSERT,INT,INTEGER,INTERSECT,INTERVAL,INTO,IS,ISOLATION,JOIN,KEY,LANGUAGE,LAST,LEADING,LEFT,LEVEL,LIKE,LOCAL,LOWER,MATCH,MAX,MIN,MINUTE,MODULE,MONTH,NAMES,NATIONAL,NATURAL,NCHAR,NEXT,NO,NONE,NOT,NULL,NULLIF,NUMERIC,OCTET_LENGTH,OF,ON,ONLY,OPEN,OPTION,OR,ORDER,OUTER,OUTPUT,OVERLAPS,PAD,PARTIAL,PASCAL,PLI,POSITION,PRECISION,PREPARE,PRESERVE,PRIMARY,PRIOR,PRIVILEGES,PROCEDURE,PUBLIC,READ,REAL,REFERENCES,RELATIVE,RESTRICT,REVOKE,RIGHT,ROLLBACK,ROWSSCHEMA,SCROLL,SECOND,SECTION,SELECT,SESSION,SESSION_USER,SET,SIZE,SMALLINT,SOME,SPACE,SQL,SQLCA,SQLCODE,SQLERROR,SQLSTATE,SQLWARNING,SUBSTRING,SUM,SYSTEM_USER,TABLE,TEMPORARY,THEN,TIME,TIMESTAMP,TIMEZONE_HOUR,TIMEZONE_MINUTE,TO,TRAILING,TRANSACTION,TRANSLATE,TRANSLATION,TRIM,TRUE,UNION,UNIQUE,UNKNOWN,UPDATE,UPPER,USAGE,USER,USING,VALUE,VALUES,VARCHAR,VARYING,VIEW,WHEN,WHENEVER,WHERE,WITH,WORK,WRITE,YEAR,ZONE";
enum SQL_YEAR = 0x00000001;
enum SQL_MONTH = 0x00000002;
enum SQL_DAY = 0x00000003;
enum SQL_HOUR = 0x00000004;
enum SQL_MINUTE = 0x00000005;
enum SQL_SECOND = 0x00000006;
enum SQL_YEAR_TO_MONTH = 0x00000007;
enum SQL_DAY_TO_HOUR = 0x00000008;
enum SQL_DAY_TO_MINUTE = 0x00000009;
enum SQL_DAY_TO_SECOND = 0x0000000a;
enum SQL_HOUR_TO_MINUTE = 0x0000000b;
enum SQL_HOUR_TO_SECOND = 0x0000000c;
enum SQL_MINUTE_TO_SECOND = 0x0000000d;
enum SQL_DATABASE_NAME = 0x00000010;
enum SQL_FD_FETCH_PREV = 0x00000008;
enum SQL_FETCH_PREV = 0x00000004;
enum SQL_CONCUR_TIMESTAMP = 0x00000003;
enum SQL_SCCO_OPT_TIMESTAMP = 0x00000004;
enum SQL_CC_DELETE = 0x00000000;
enum SQL_CR_DELETE = 0x00000000;
enum SQL_CC_CLOSE = 0x00000001;
enum SQL_CR_CLOSE = 0x00000001;
enum SQL_CC_PRESERVE = 0x00000002;
enum SQL_CR_PRESERVE = 0x00000002;
enum SQL_FETCH_RESUME = 0x00000007;
enum SQL_SCROLL_FORWARD_ONLY = 0x00000000;
enum SQL_SCROLL_KEYSET_DRIVEN = 0xffffffffffffffff;
enum SQL_SCROLL_DYNAMIC = 0xfffffffffffffffe;
enum SQL_SCROLL_STATIC = 0xfffffffffffffffd;
enum TRACE_VERSION = 0x000003e8;
enum TRACE_ON = 0x00000001;
enum TRACE_VS_EVENT_ON = 0x00000002;
enum ODBC_VS_FLAG_UNICODE_ARG = 0x00000001;
enum ODBC_VS_FLAG_UNICODE_COR = 0x00000002;
enum ODBC_VS_FLAG_RETCODE = 0x00000004;
enum ODBC_VS_FLAG_STOP = 0x00000008;
enum CRESTRICTIONS_DBSCHEMA_LINKEDSERVERS = 0x00000001;
enum SSPROP_ENABLEFASTLOAD = 0x00000002;
enum SSPROP_UNICODELCID = 0x00000002;
enum SSPROP_UNICODECOMPARISONSTYLE = 0x00000003;
enum SSPROP_COLUMNLEVELCOLLATION = 0x00000004;
enum SSPROP_CHARACTERSET = 0x00000005;
enum SSPROP_SORTORDER = 0x00000006;
enum SSPROP_CURRENTCOLLATION = 0x00000007;
enum SSPROP_INIT_CURRENTLANGUAGE = 0x00000004;
enum SSPROP_INIT_NETWORKADDRESS = 0x00000005;
enum SSPROP_INIT_NETWORKLIBRARY = 0x00000006;
enum SSPROP_INIT_USEPROCFORPREP = 0x00000007;
enum SSPROP_INIT_AUTOTRANSLATE = 0x00000008;
enum SSPROP_INIT_PACKETSIZE = 0x00000009;
enum SSPROP_INIT_APPNAME = 0x0000000a;
enum SSPROP_INIT_WSID = 0x0000000b;
enum SSPROP_INIT_FILENAME = 0x0000000c;
enum SSPROP_INIT_ENCRYPT = 0x0000000d;
enum SSPROP_AUTH_REPL_SERVER_NAME = 0x0000000e;
enum SSPROP_INIT_TAGCOLUMNCOLLATION = 0x0000000f;
enum SSPROPVAL_USEPROCFORPREP_OFF = 0x00000000;
enum SSPROPVAL_USEPROCFORPREP_ON = 0x00000001;
enum SSPROPVAL_USEPROCFORPREP_ON_DROP = 0x00000002;
enum SSPROP_QUOTEDCATALOGNAMES = 0x00000002;
enum SSPROP_ALLOWNATIVEVARIANT = 0x00000003;
enum SSPROP_SQLXMLXPROGID = 0x00000004;
enum SSPROP_MAXBLOBLENGTH = 0x00000008;
enum SSPROP_FASTLOADOPTIONS = 0x00000009;
enum SSPROP_FASTLOADKEEPNULLS = 0x0000000a;
enum SSPROP_FASTLOADKEEPIDENTITY = 0x0000000b;
enum SSPROP_CURSORAUTOFETCH = 0x0000000c;
enum SSPROP_DEFERPREPARE = 0x0000000d;
enum SSPROP_IRowsetFastLoad = 0x0000000e;
enum SSPROP_COL_COLLATIONNAME = 0x0000000e;
enum SSPROP_STREAM_MAPPINGSCHEMA = 0x0000000f;
enum SSPROP_STREAM_XSL = 0x00000010;
enum SSPROP_STREAM_BASEPATH = 0x00000011;
enum SSPROP_STREAM_COMMANDTYPE = 0x00000012;
enum SSPROP_STREAM_XMLROOT = 0x00000013;
enum SSPROP_STREAM_FLAGS = 0x00000014;
enum SSPROP_STREAM_CONTENTTYPE = 0x00000017;
enum STREAM_FLAGS_DISALLOW_URL = 0x00000001;
enum STREAM_FLAGS_DISALLOW_ABSOLUTE_PATH = 0x00000002;
enum STREAM_FLAGS_DISALLOW_QUERY = 0x00000004;
enum STREAM_FLAGS_DONTCACHEMAPPINGSCHEMA = 0x00000008;
enum STREAM_FLAGS_DONTCACHETEMPLATE = 0x00000010;
enum STREAM_FLAGS_DONTCACHEXSL = 0x00000020;
enum STREAM_FLAGS_DISALLOW_UPDATEGRAMS = 0x00000040;
enum STREAM_FLAGS_RESERVED = 0xffff0000;
enum SSPROPVAL_COMMANDTYPE_REGULAR = 0x00000015;
enum SSPROPVAL_COMMANDTYPE_BULKLOAD = 0x00000016;
enum DBTYPE_SQLVARIANT = 0x00000090;
enum SQL_HANDLE_DBC_INFO_TOKEN = 0x00000006;
enum SQL_CONN_POOL_RATING_BEST = 0x00000064;
enum SQL_CONN_POOL_RATING_GOOD_ENOUGH = 0x00000063;
enum SQL_CONN_POOL_RATING_USELESS = 0x00000000;
enum SQL_ATTR_DBC_INFO_TOKEN = 0x00000076;
enum SQL_ATTR_ASYNC_DBC_NOTIFICATION_CALLBACK = 0x00000078;
enum SQL_ATTR_ASYNC_DBC_NOTIFICATION_CONTEXT = 0x00000079;
enum SQL_ATTR_ASYNC_STMT_NOTIFICATION_CALLBACK = 0x0000001e;
enum SQL_ATTR_ASYNC_STMT_NOTIFICATION_CONTEXT = 0x0000001f;
enum SQL_MAX_NUMERIC_LEN = 0x00000010;
enum SQL_WCHAR = 0xfffffffffffffff8;
enum SQL_WVARCHAR = 0xfffffffffffffff7;
enum SQL_WLONGVARCHAR = 0xfffffffffffffff6;
enum SQL_C_WCHAR = 0xfffffffffffffff8;
enum SQL_C_TCHAR = 0xfffffffffffffff8;
enum SQL_SQLSTATE_SIZEW = 0x0000000a;
enum PSGUID_STORAGE = GUID(0xb725f130, 0x47ef, 0x101a, [0xa5, 0xf1, 0x2, 0x60, 0x8c, 0x9e, 0xeb, 0xac]);
enum CSTORAGEPROPERTY = 0x00000017;
enum CATEGORY_SEARCH = 0x00000001;
enum CATEGORY_COLLATOR = 0x00000002;
enum CATEGORY_GATHERER = 0x00000003;
enum CATEGORY_INDEXER = 0x00000004;
enum EVENT_SSSEARCH_STARTED = 0x400003eb;
enum EVENT_SSSEARCH_STARTING_SETUP = 0x400003ec;
enum EVENT_SSSEARCH_SETUP_SUCCEEDED = 0x400003ed;
enum EVENT_SSSEARCH_SETUP_FAILED = 0xffffffffc00003ee;
enum EVENT_OUTOFMEMORY = 0xffffffffc00003ef;
enum EVENT_SSSEARCH_SETUP_CLEANUP_STARTED = 0xffffffff800003f0;
enum EVENT_EXCEPTION = 0xffffffffc00003f1;
enum EVENT_SSSEARCH_SETUP_CLEANUP_SUCCEEDED = 0x400003f2;
enum EVENT_SSSEARCH_SETUP_CLEANUP_FAILED = 0xffffffffc00003f3;
enum EVENT_SSSEARCH_STOPPED = 0x400003f5;
enum EVENT_SSSEARCH_CREATE_PATH_RULES_FAILED = 0xffffffff800003f6;
enum EVENT_SSSEARCH_DROPPED_EVENTS = 0xffffffff800003f7;
enum EVENT_SSSEARCH_DATAFILES_MOVE_FAILED = 0xffffffffc00003f8;
enum EVENT_SSSEARCH_DATAFILES_MOVE_SUCCEEDED = 0x400003f9;
enum EVENT_SSSEARCH_DATAFILES_MOVE_ROLLBACK_ERRORS = 0xffffffff800003fa;
enum EVENT_SSSEARCH_CSM_SAVE_FAILED = 0xffffffffc00003fb;
enum EVENT_CONFIG_SYNTAX = 0xffffffff80000414;
enum EVENT_UNPRIVILEGED_SERVICE_ACCOUNT = 0xffffffff8000041c;
enum EVENT_SYSTEM_EXCEPTION = 0xffffffff8000041d;
enum EVENT_CONFIG_ERROR = 0xffffffffc0000bbb;
enum EVENT_GATHERSVC_PERFMON = 0xffffffffc0000bbe;
enum EVENT_GATHERER_PERFMON = 0xffffffffc0000bbf;
enum EVENT_HASHMAP_INSERT = 0xffffffffc0000bc0;
enum EVENT_TRANSLOG_CREATE_TRX = 0xffffffffc0000bc1;
enum EVENT_TRANSLOG_APPEND = 0xffffffffc0000bc2;
enum EVENT_TRANSLOG_UPDATE = 0xffffffffc0000bc3;
enum EVENT_HASHMAP_UPDATE = 0xffffffffc0000bc5;
enum EVENT_GATHER_EXCEPTION = 0xffffffffc0000bc6;
enum EVENT_TRANSACTION_READ = 0xffffffffc0000bc7;
enum EVENT_GATHER_END_CRAWL = 0x40000bca;
enum EVENT_GATHER_START_CRAWL = 0x40000bcb;
enum EVENT_GATHER_INTERNAL = 0xffffffffc0000bcc;
enum EVENT_GATHER_CRAWL_NOT_STARTED = 0xffffffff80000bcf;
enum EVENT_GATHER_CRAWL_SEED_ERROR = 0xffffffff80000bd0;
enum EVENT_GATHER_CRITICAL_ERROR = 0xffffffffc0000bd1;
enum EVENT_GATHER_ADVISE_FAILED = 0xffffffffc0000bd2;
enum EVENT_GATHER_TRANSACTION_FAIL = 0xffffffffc0000bd3;
enum EVENT_GATHER_OBJ_INIT_FAILED = 0xffffffffc0000bd4;
enum EVENT_GATHER_PLUGIN_INIT_FAILED = 0xffffffffc0000bd5;
enum EVENT_GATHER_SERVICE_INIT = 0xffffffffc0000bd6;
enum EVENT_GATHER_CANT_CREATE_DOCID = 0xffffffffc0000bd7;
enum EVENT_GATHER_CANT_DELETE_DOCID = 0xffffffffc0000bd8;
enum EVENT_TRANSLOG_CREATE = 0xffffffffc0000bd9;
enum EVENT_REG_VERSION = 0xffffffffc0000bda;
enum EVENT_GATHER_CRAWL_SEED_FAILED = 0xffffffff80000bdc;
enum EVENT_GATHER_CRAWL_SEED_FAILED_INIT = 0xffffffff80000bdd;
enum EVENT_GATHER_REG_MISSING = 0xffffffff80000bde;
enum EVENT_GATHER_CRAWL_IN_PROGRESS = 0xffffffff80000bdf;
enum EVENT_GATHER_LOCK_FAILED = 0xffffffffc0000be0;
enum EVENT_GATHER_RESET_START = 0x40000be1;
enum EVENT_GATHER_START_PAUSE = 0xffffffff80000be2;
enum EVENT_GATHER_THROTTLE = 0x40000be3;
enum EVENT_GATHER_RESUME = 0x40000be4;
enum EVENT_GATHER_AUTODESCLEN_ADJUSTED = 0xffffffff80000be5;
enum EVENT_GATHER_NO_CRAWL_SEEDS = 0xffffffff80000be6;
enum EVENT_GATHER_END_INCREMENTAL = 0x40000be7;
enum EVENT_GATHER_FROM_NOT_SET = 0xffffffffc0000be8;
enum EVENT_GATHER_DELETING_HISTORY_ITEMS = 0xffffffffc0000bea;
enum EVENT_GATHER_STOP_START = 0x40000bec;
enum EVENT_GATHER_START_CRAWL_IF_RESET = 0xffffffff80000bed;
enum EVENT_GATHER_DISK_FULL = 0xffffffff80000bee;
enum EVENT_GATHER_NO_SCHEMA = 0xffffffff80000bef;
enum EVENT_GATHER_AUTODESCENCODE_INVALID = 0xffffffff80000bf0;
enum EVENT_GATHER_PLUGINMGR_INIT_FAILED = 0xffffffffc0000bf1;
enum EVENT_GATHER_APP_INIT_FAILED = 0xffffffffc0000bf2;
enum EVENT_FAILED_INITIALIZE_CRAWL = 0xffffffffc0000bf3;
enum EVENT_CRAWL_SCHEDULED = 0x40000bf4;
enum EVENT_FAILED_CREATE_GATHERER_LOG = 0xffffffff80000bf5;
enum EVENT_WBREAKER_NOT_LOADED = 0xffffffff80000bf6;
enum EVENT_LEARN_PROPAGATION_COPY_FAILED = 0xffffffff80000bf7;
enum EVENT_LEARN_CREATE_DB_FAILED = 0xffffffff80000bf8;
enum EVENT_LEARN_COMPILE_FAILED = 0xffffffff80000bf9;
enum EVENT_LEARN_PROPAGATION_FAILED = 0xffffffff80000bfa;
enum EVENT_GATHER_END_ADAPTIVE = 0x40000bfb;
enum EVENT_USING_DIFFERENT_WORD_BREAKER = 0xffffffff80000bfc;
enum EVENT_GATHER_RESTORE_COMPLETE = 0x00000bfd;
enum EVENT_GATHER_RESTORE_ERROR = 0xffffffffc0000bfe;
enum EVENT_AUTOCAT_PERFMON = 0xffffffffc0000bff;
enum EVENT_GATHER_DIRTY_STARTUP = 0xffffffff80000c00;
enum EVENT_GATHER_HISTORY_CORRUPTION_DETECTED = 0xffffffff80000c01;
enum EVENT_GATHER_RESTOREAPP_ERROR = 0xffffffffc0000c02;
enum EVENT_GATHER_RESTOREAPP_COMPLETE = 0x00000c03;
enum EVENT_GATHER_BACKUPAPP_ERROR = 0xffffffffc0000c04;
enum EVENT_GATHER_BACKUPAPP_COMPLETE = 0x00000c05;
enum EVENT_GATHER_DAEMON_TERMINATED = 0xffffffff80000c06;
enum EVENT_NOTIFICATION_FAILURE = 0xffffffffc0000c07;
enum EVENT_NOTIFICATION_FAILURE_SCOPE_EXCEEDED_LOGGING = 0xffffffff80000c08;
enum EVENT_NOTIFICATION_RESTORED = 0x40000c09;
enum EVENT_NOTIFICATION_RESTORED_SCOPE_EXCEEDED_LOGGING = 0xffffffff80000c0a;
enum EVENT_GATHER_PROTOCOLHANDLER_LOAD_FAILED = 0xffffffffc0000c0b;
enum EVENT_GATHER_PROTOCOLHANDLER_INIT_FAILED = 0xffffffffc0000c0c;
enum EVENT_GATHER_INVALID_NETWORK_ACCESS_ACCOUNT = 0xffffffffc0000c0d;
enum EVENT_GATHER_SYSTEM_LCID_CHANGED = 0xffffffff80000c0e;
enum EVENT_GATHER_FLUSH_FAILED = 0xffffffffc0000c0f;
enum EVENT_GATHER_CHECKPOINT_FAILED = 0xffffffffc0000c10;
enum EVENT_GATHER_SAVE_FAILED = 0xffffffffc0000c11;
enum EVENT_GATHER_RESTORE_CHECKPOINT_FAILED = 0xffffffffc0000c12;
enum EVENT_GATHER_READ_CHECKPOINT_FAILED = 0xffffffffc0000c13;
enum EVENT_GATHER_CHECKPOINT_CORRUPT = 0xffffffffc0000c14;
enum EVENT_GATHER_CHECKPOINT_FILE_MISSING = 0xffffffffc0000c15;
enum EVENT_STS_INIT_SECURITY_FAILED = 0xffffffff80000c16;
enum EVENT_LOCAL_GROUP_NOT_EXPANDED = 0x40000c17;
enum EVENT_LOCAL_GROUPS_CACHE_FLUSHED = 0x40000c18;
enum EVENT_GATHERER_DATASOURCE = 0xffffffffc0000c19;
enum EVENT_AUTOCAT_CANT_CREATE_FILE_SHARE = 0xffffffffc0000c1a;
enum EVENT_NOTIFICATION_THREAD_EXIT_FAILED = 0xffffffffc0000c1b;
enum EVENT_FILTER_HOST_NOT_INITIALIZED = 0xffffffffc0000c1c;
enum EVENT_FILTER_HOST_NOT_TERMINATED = 0xffffffffc0000c1d;
enum EVENT_FILTERPOOL_ADD_FAILED = 0xffffffffc0000c1e;
enum EVENT_FILTERPOOL_DELETE_FAILED = 0xffffffffc0000c1f;
enum EVENT_ENUMERATE_SESSIONS_FAILED = 0xffffffffc0000c20;
enum EVENT_DETAILED_FILTERPOOL_ADD_FAILED = 0xffffffffc0000c21;
enum EVENT_AUDIENCECOMPUTATION_CANNOTSTART = 0xffffffffc0000e11;
enum EVENT_GATHER_RECOVERY_FAILURE = 0xffffffffc0000e12;
enum EVENT_INDEXER_STARTED = 0x40001b58;
enum EVENT_INDEXER_SCHEMA_COPY_ERROR = 0xffffffffc0001b59;
enum EVENT_INDEXER_INIT_ERROR = 0xffffffffc0001b62;
enum EVENT_INDEXER_INVALID_DIRECTORY = 0xffffffffc0001b63;
enum EVENT_INDEXER_PROP_ERROR = 0xffffffffc0001b64;
enum EVENT_INDEXER_PAUSED_FOR_DISKFULL = 0xffffffffc0001b65;
enum EVENT_INDEXER_PROP_STOPPED = 0xffffffff80001b67;
enum EVENT_INDEXER_PROP_SUCCEEDED = 0x00001b68;
enum EVENT_INDEXER_PROP_STARTED = 0x40001b69;
enum EVENT_INDEXER_NO_SEARCH_SERVERS = 0xffffffff80001b6a;
enum EVENT_INDEXER_ADD_DSS_SUCCEEDED = 0x00001b6b;
enum EVENT_INDEXER_REMOVE_DSS_SUCCEEDED = 0x00001b6c;
enum EVENT_INDEXER_ADD_DSS_FAILED = 0xffffffff80001b6d;
enum EVENT_INDEXER_REMOVE_DSS_FAILED = 0xffffffffc0001b6f;
enum EVENT_INDEXER_DSS_CONTACT_FAILED = 0xffffffffc0001b70;
enum EVENT_INDEXER_BUILD_FAILED = 0xffffffffc0001b73;
enum EVENT_INDEXER_REG_MISSING = 0xffffffffc0001b74;
enum EVENT_INDEXER_PROPSTORE_INIT_FAILED = 0xffffffffc0001b7d;
enum EVENT_INDEXER_CI_LOAD_ERROR = 0xffffffffc0001b7f;
enum EVENT_INDEXER_RESET_FOR_CORRUPTION = 0xffffffffc0001b80;
enum EVENT_INDEXER_SHUTDOWN = 0x40001b82;
enum EVENT_INDEXER_LOAD_FAIL = 0xffffffffc0001b83;
enum EVENT_INDEXER_PROP_STATE_CORRUPT = 0xffffffffc0001b84;
enum EVENT_INDEXER_DSS_ALREADY_ADDED = 0x40001b86;
enum EVENT_INDEXER_BUILD_START = 0x40001b88;
enum EVENT_INDEXER_BUILD_ENDED = 0x40001b89;
enum EVENT_INDEXER_VERIFY_PROP_ACCOUNT = 0xffffffffc0001b90;
enum EVENT_INDEXER_ADD_DSS_DISCONNECT = 0xffffffff80001b97;
enum EVENT_INDEXER_PERFMON = 0xffffffffc0001b98;
enum EVENT_INDEXER_MISSING_APP_DIRECTORY = 0xffffffffc0001b9a;
enum EVENT_INDEXER_REG_ERROR = 0xffffffffc0001b9c;
enum EVENT_INDEXER_DSS_UNABLE_TO_REMOVE = 0xffffffffc0001b9d;
enum EVENT_INDEXER_NEW_PROJECT = 0xffffffffc0001b9e;
enum EVENT_INDEXER_REMOVED_PROJECT = 0xffffffffc0001b9f;
enum EVENT_INDEXER_PROP_COMMITTED = 0x40001ba2;
enum EVENT_INDEXER_PROP_ABORTED = 0x40001ba3;
enum EVENT_DSS_NOT_ENABLED = 0xffffffff80001ba4;
enum EVENT_INDEXER_PROP_COMMIT_FAILED = 0xffffffffc0001ba5;
enum JET_INIT_ERROR = 0xffffffffc0002328;
enum JET_NEW_PROP_STORE_ERROR = 0xffffffffc0002329;
enum JET_GET_PROP_STORE_ERROR = 0xffffffffc000232a;
enum JET_MULTIINSTANCE_DISABLED = 0xffffffff8000232b;
enum EVENT_WARNING_CANNOT_UPGRADE_NOISE_FILES = 0xffffffff8000271d;
enum EVENT_WARNING_CANNOT_UPGRADE_NOISE_FILE = 0xffffffff8000271e;
enum EVENT_WIN32_ERROR = 0xffffffff8000271f;
enum EVENT_PERF_COUNTERS_NOT_LOADED = 0xffffffff80002724;
enum EVENT_PERF_COUNTERS_REGISTRY_TROUBLE = 0xffffffff80002725;
enum EVENT_PERF_COUNTERS_ALREADY_EXISTS = 0xffffffff80002726;
enum EVENT_PROTOCOL_HOST_FORCE_TERMINATE = 0xffffffff80002727;
enum EVENT_FILTER_HOST_FORCE_TERMINATE = 0xffffffff80002728;
enum EVENT_INDEXER_OUT_OF_DATABASE_INSTANCE = 0xffffffffc0002729;
enum EVENT_INDEXER_FAIL_TO_SET_MAX_JETINSTANCE = 0xffffffffc000272a;
enum EVENT_INDEXER_FAIL_TO_CREATE_PER_USER_CATALOG = 0xffffffffc000272b;
enum EVENT_INDEXER_FAIL_TO_UNLOAD_PER_USER_CATALOG = 0xffffffffc000272c;
enum ERROR_SOURCE_NETWORKING = 0x00000300;
enum ERROR_SOURCE_DATASOURCE = 0x00000400;
enum ERROR_SOURCE_COLLATOR = 0x00000500;
enum ERROR_SOURCE_CONNMGR = 0x00000600;
enum ERROR_SOURCE_QUERY = 0x00000700;
enum ERROR_SOURCE_SCHEMA = 0x00000c00;
enum ERROR_SOURCE_GATHERER = 0x00000d00;
enum ERROR_SOURCE_INDEXER = 0x00001100;
enum ERROR_SOURCE_SETUP = 0x00001300;
enum ERROR_SOURCE_SECURITY = 0x00001400;
enum ERROR_SOURCE_CMDLINE = 0x00001500;
enum ERROR_SOURCE_NLADMIN = 0x00001900;
enum ERROR_SOURCE_SCRIPTPI = 0x00002000;
enum ERROR_SOURCE_MSS = 0x00002100;
enum ERROR_SOURCE_XML = 0x00002200;
enum ERROR_SOURCE_DAV = 0x00002300;
enum ERROR_SOURCE_FLTRDMN = 0x00002400;
enum ERROR_SOURCE_OLEDB_BINDER = 0x00002500;
enum ERROR_SOURCE_NOTESPH = 0x00002600;
enum ERROR_SOURCE_EXSTOREPH = 0x00002700;
enum ERROR_SOURCE_SRCH_SCHEMA_CACHE = 0x00003300;
enum ERROR_SOURCE_CONTENT_SOURCE = 0x00003400;
enum ERROR_SOURCE_REMOTE_EXSTOREPH = 0x00003500;
enum ERROR_SOURCE_PEOPLE_IMPORT = 0x00004000;
enum ERROR_FTE = 0x00003600;
enum ERROR_FTE_CB = 0x0000cb00;
enum ERROR_FTE_FD = 0x0000fd00;
enum XML_E_NODEFAULTNS = 0xffffffff80042200;
enum XML_E_BADSXQL = 0xffffffff80042201;
enum MSS_E_INVALIDAPPNAME = 0xffffffff80042100;
enum MSS_E_APPNOTFOUND = 0xffffffff80042101;
enum MSS_E_APPALREADYEXISTS = 0xffffffff80042102;
enum MSS_E_CATALOGNOTFOUND = 0xffffffff80042103;
enum MSS_E_CATALOGSTOPPING = 0xffffffff80042104;
enum MSS_E_UNICODEFILEHEADERMISSING = 0xffffffff80042105;
enum MSS_E_CATALOGALREADYEXISTS = 0xffffffff80042106;
enum NET_E_GENERAL = 0xffffffff80040300;
enum NET_E_DISCONNECTED = 0xffffffff80040303;
enum NET_E_INVALIDPARAMS = 0xffffffff80040308;
enum NET_E_OPERATIONINPROGRESS = 0xffffffff80040309;
enum SEC_E_INVALIDCONTEXT = 0xffffffff80041403;
enum SEC_E_INITFAILED = 0xffffffff80041401;
enum SEC_E_NOTINITIALIZED = 0xffffffff80041402;
enum SEC_E_ACCESSDENIED = 0xffffffff800414ff;
enum DS_E_NOMOREDATA = 0xffffffff80040400;
enum DS_E_INVALIDDATASOURCE = 0xffffffff80040401;
enum DS_E_DATASOURCENOTAVAILABLE = 0xffffffff80040402;
enum DS_E_QUERYCANCELED = 0xffffffff80040403;
enum DS_E_UNKNOWNREQUEST = 0xffffffff80040404;
enum DS_E_BADREQUEST = 0xffffffff80040405;
enum DS_E_SERVERCAPACITY = 0xffffffff80040406;
enum DS_E_BADSEQUENCE = 0xffffffff80040407;
enum DS_E_MESSAGETOOLONG = 0xffffffff80040408;
enum DS_E_SERVERERROR = 0xffffffff80040409;
enum DS_E_CONFIGBAD = 0xffffffff8004040a;
enum DS_E_DATANOTPRESENT = 0xffffffff80040410;
enum DS_E_SETSTATUSINPROGRESS = 0xffffffff80040411;
enum DS_E_DUPLICATEID = 0xffffffff80040412;
enum DS_E_TOOMANYDATASOURCES = 0xffffffff80040413;
enum DS_E_REGISTRY = 0xffffffff80040414;
enum DS_E_DATASOURCENOTDISABLED = 0xffffffff80040415;
enum DS_E_INVALIDTAGDB = 0xffffffff80040416;
enum DS_E_INVALIDCATALOGNAME = 0xffffffff80040417;
enum DS_E_CONFIGNOTRIGHTTYPE = 0xffffffff80040418;
enum DS_E_PROTOCOLVERSION = 0xffffffff80040419;
enum DS_E_ALREADYENABLED = 0xffffffff8004041a;
enum DS_E_INDEXDIRECTORY = 0xffffffff8004041c;
enum DS_E_VALUETOOLARGE = 0xffffffff8004041d;
enum DS_E_UNKNOWNPARAM = 0xffffffff8004041e;
enum DS_E_BUFFERTOOSMALL = 0xffffffff8004041f;
enum DS_E_PARAMOUTOFRANGE = 0xffffffff80040420;
enum DS_E_ALREADYDISABLED = 0xffffffff80040421;
enum DS_E_QUERYHUNG = 0xffffffff80040422;
enum DS_E_BADRESULT = 0xffffffff80040423;
enum DS_E_CANNOTWRITEREGISTRY = 0xffffffff80040424;
enum DS_E_CANNOTREMOVECONCURRENT = 0xffffffff80040425;
enum DS_E_SEARCHCATNAMECOLLISION = 0xffffffff80040426;
enum DS_E_PROPVERSIONMISMATCH = 0xffffffff80040427;
enum DS_E_MISSINGCATALOG = 0xffffffff80040428;
enum COLL_E_BADSEQUENCE = 0xffffffff80040501;
enum COLL_E_NOMOREDATA = 0xffffffff80040502;
enum COLL_E_INCOMPATIBLECOLUMNS = 0xffffffff80040503;
enum COLL_E_BUFFERTOOSMALL = 0xffffffff80040504;
enum COLL_E_BADRESULT = 0xffffffff80040506;
enum COLL_E_NOSORTCOLUMN = 0xffffffff80040507;
enum COLL_E_DUPLICATEDBID = 0xffffffff80040508;
enum COLL_E_TOOMANYMERGECOLUMNS = 0xffffffff80040509;
enum COLL_E_NODEFAULTCATALOG = 0xffffffff8004050a;
enum COLL_E_MAXCONNEXCEEDED = 0xffffffff8004050b;
enum CM_E_TOOMANYDATASERVERS = 0xffffffff80040601;
enum CM_E_TOOMANYDATASOURCES = 0xffffffff80040602;
enum CM_E_NOQUERYCONNECTIONS = 0xffffffff80040603;
enum CM_E_DATASOURCENOTAVAILABLE = 0xffffffff80040604;
enum CM_E_CONNECTIONTIMEOUT = 0xffffffff80040605;
enum CM_E_SERVERNOTFOUND = 0xffffffff80040606;
enum CM_S_NODATASERVERS = 0x00040607;
enum CM_E_REGISTRY = 0xffffffff80040608;
enum CM_E_INVALIDDATASOURCE = 0xffffffff80040609;
enum CM_E_TIMEOUT = 0xffffffff8004060a;
enum CM_E_INSUFFICIENTBUFFER = 0xffffffff8004060b;
enum QRY_E_QUERYSYNTAX = 0xffffffff80040701;
enum QRY_E_TYPEMISMATCH = 0xffffffff80040702;
enum QRY_E_UNHANDLEDTYPE = 0xffffffff80040703;
enum QRY_S_NOROWSFOUND = 0x00040704;
enum QRY_E_TOOMANYCOLUMNS = 0xffffffff80040705;
enum QRY_E_TOOMANYDATABASES = 0xffffffff80040706;
enum QRY_E_STARTHITTOBIG = 0xffffffff80040707;
enum QRY_E_TOOMANYQUERYTERMS = 0xffffffff80040708;
enum QRY_E_NODATASOURCES = 0xffffffff80040709;
enum QRY_E_TIMEOUT = 0xffffffff8004070a;
enum QRY_E_COLUMNNOTSORTABLE = 0xffffffff8004070b;
enum QRY_E_COLUMNNOTSEARCHABLE = 0xffffffff8004070c;
enum QRY_E_INVALIDCOLUMN = 0xffffffff8004070d;
enum QRY_E_QUERYCORRUPT = 0xffffffff8004070e;
enum QRY_E_PREFIXWILDCARD = 0xffffffff8004070f;
enum QRY_E_INFIXWILDCARD = 0xffffffff80040710;
enum QRY_E_WILDCARDPREFIXLENGTH = 0xffffffff80040711;
enum QRY_S_TERMIGNORED = 0x00040712;
enum QRY_E_ENGINEFAILED = 0xffffffff80040713;
enum QRY_E_SEARCHTOOBIG = 0xffffffff80040714;
enum QRY_E_NULLQUERY = 0xffffffff80040715;
enum QRY_S_INEXACTRESULTS = 0x00040716;
enum QRY_E_NOCOLUMNS = 0xffffffff80040717;
enum QRY_E_INVALIDSCOPES = 0xffffffff80040718;
enum QRY_E_INVALIDCATALOG = 0xffffffff80040719;
enum QRY_E_SCOPECARDINALIDY = 0xffffffff8004071a;
enum QRY_E_UNEXPECTED = 0xffffffff8004071b;
enum QRY_E_INVALIDPATH = 0xffffffff8004071c;
enum QRY_E_LMNOTINITIALIZED = 0xffffffff8004071d;
enum QRY_E_INVALIDINTERVAL = 0xffffffff8004071e;
enum QRY_E_NOLOGMANAGER = 0xffffffff8004071f;
enum SCHEMA_E_LOAD_SPECIAL = 0xffffffff80040c01;
enum SCHEMA_E_FILENOTFOUND = 0xffffffff80040c02;
enum SCHEMA_E_NESTEDTAG = 0xffffffff80040c03;
enum SCHEMA_E_UNEXPECTEDTAG = 0xffffffff80040c04;
enum SCHEMA_E_VERSIONMISMATCH = 0xffffffff80040c05;
enum SCHEMA_E_CANNOTCREATEFILE = 0xffffffff80040c06;
enum SCHEMA_E_CANNOTWRITEFILE = 0xffffffff80040c07;
enum SCHEMA_E_EMPTYFILE = 0xffffffff80040c08;
enum SCHEMA_E_INVALIDFILETYPE = 0xffffffff80040c09;
enum SCHEMA_E_INVALIDDATATYPE = 0xffffffff80040c0a;
enum SCHEMA_E_CANNOTCREATENOISEWORDFILE = 0xffffffff80040c0b;
enum SCHEMA_E_ADDSTOPWORDS = 0xffffffff80040c0c;
enum SCHEMA_E_NAMEEXISTS = 0xffffffff80040c0d;
enum SCHEMA_E_INVALIDVALUE = 0xffffffff80040c0e;
enum SCHEMA_E_BADPROPSPEC = 0xffffffff80040c0f;
enum SCHEMA_E_NOMORECOLUMNS = 0xffffffff80040c10;
enum SCHEMA_E_FILECHANGED = 0xffffffff80040c11;
enum SCHEMA_E_BADCOLUMNNAME = 0xffffffff80040c12;
enum SCHEMA_E_BADPROPPID = 0xffffffff80040c13;
enum SCHEMA_E_BADATTRIBUTE = 0xffffffff80040c14;
enum SCHEMA_E_BADFILENAME = 0xffffffff80040c15;
enum SCHEMA_E_PROPEXISTS = 0xffffffff80040c16;
enum SCHEMA_E_DUPLICATENOISE = 0xffffffff80040c17;
enum GTHR_E_DUPLICATE_OBJECT = 0xffffffff80040d02;
enum GTHR_E_UNABLE_TO_READ_REGISTRY = 0xffffffff80040d03;
enum GTHR_E_ERROR_WRITING_REGISTRY = 0xffffffff80040d04;
enum GTHR_E_ERROR_INITIALIZING_PERFMON = 0xffffffff80040d05;
enum GTHR_E_ERROR_OBJECT_NOT_FOUND = 0xffffffff80040d06;
enum GTHR_E_URL_EXCLUDED = 0xffffffff80040d07;
enum GTHR_E_CONFIG_DUP_PROJECT = 0xffffffff80040d0a;
enum GTHR_E_CONFIG_DUP_EXTENSION = 0xffffffff80040d0b;
enum GTHR_E_DUPLICATE_URL = 0xffffffff80040d0d;
enum GTHR_E_TOO_MANY_PLUGINS = 0xffffffff80040d0e;
enum GTHR_E_INVALIDFUNCTION = 0xffffffff80040d0f;
enum GTHR_E_NOFILTERSINK = 0xffffffff80040d10;
enum GTHR_E_FILTER_PROCESS_TERMINATED = 0xffffffff80040d11;
enum GTHR_E_FILTER_INVALID_MESSAGE = 0xffffffff80040d12;
enum GTHR_E_UNSUPPORTED_PROPERTY_TYPE = 0xffffffff80040d13;
enum GTHR_E_NAME_TOO_LONG = 0xffffffff80040d14;
enum GTHR_E_NO_IDENTITY = 0xffffffff80040d15;
enum GTHR_E_FILTER_NOT_FOUND = 0xffffffff80040d16;
enum GTHR_E_FILTER_NO_MORE_THREADS = 0xffffffff80040d17;
enum GTHR_E_PRT_HNDLR_PROGID_MISSING = 0xffffffff80040d18;
enum GTHR_E_FILTER_PROCESS_TERMINATED_QUOTA = 0xffffffff80040d19;
enum GTHR_E_UNKNOWN_PROTOCOL = 0xffffffff80040d1a;
enum GTHR_E_PROJECT_NOT_INITIALIZED = 0xffffffff80040d1b;
enum GTHR_S_STATUS_CHANGE_IGNORED = 0x00040d1c;
enum GTHR_S_STATUS_END_CRAWL = 0x00040d1d;
enum GTHR_S_STATUS_RESET = 0x00040d1e;
enum GTHR_S_STATUS_THROTTLE = 0x00040d1f;
enum GTHR_S_STATUS_RESUME = 0x00040d20;
enum GTHR_S_STATUS_PAUSE = 0x00040d21;
enum GTHR_E_INVALID_PROJECT_NAME = 0xffffffff80040d22;
enum GTHR_E_SHUTTING_DOWN = 0xffffffff80040d23;
enum GTHR_S_END_STD_CHUNKS = 0x00040d24;
enum GTHR_E_VALUE_NOT_AVAILABLE = 0xffffffff80040d25;
enum GTHR_E_OUT_OF_DOC_ID = 0xffffffff80040d26;
enum GTHR_E_NOTIFICATION_START_PAGE = 0xffffffff80040d27;
enum GTHR_E_DUP_PROPERTY_MAPPING = 0xffffffff80040d2a;
enum GTHR_S_NO_CRAWL_SEEDS = 0x00040d2b;
enum GTHR_E_INVALID_ACCOUNT = 0xffffffff80040d2c;
enum GTHR_E_FILTER_INIT = 0xffffffff80040d2e;
enum GTHR_E_INVALID_ACCOUNT_SYNTAX = 0xffffffff80040d2f;
enum GTHR_S_CANNOT_FILTER = 0x00040d30;
enum GTHR_E_PROXY_NAME = 0xffffffff80040d31;
enum GTHR_E_SERVER_UNAVAILABLE = 0xffffffff80040d32;
enum GTHR_S_STATUS_STOP = 0x00040d33;
enum GTHR_E_INVALID_PATH = 0xffffffff80040d34;
enum GTHR_E_FILTER_NO_CODEPAGE = 0xffffffff80040d35;
enum GTHR_S_STATUS_START = 0x00040d36;
enum GTHR_E_NO_PRTCLHNLR = 0xffffffff80040d37;
enum GTHR_E_IE_OFFLINE = 0xffffffff80040d38;
enum GTHR_E_BAD_FILTER_DAEMON = 0xffffffff80040d39;
enum GTHR_E_INVALID_MAPPING = 0xffffffff80040d40;
enum GTHR_E_USER_AGENT_NOT_SPECIFIED = 0xffffffff80040d41;
enum GTHR_E_FROM_NOT_SPECIFIED = 0xffffffff80040d43;
enum GTHR_E_INVALID_STREAM_LOGS_COUNT = 0xffffffff80040d44;
enum GTHR_E_INVALID_EXTENSION = 0xffffffff80040d45;
enum GTHR_E_INVALID_GROW_FACTOR = 0xffffffff80040d46;
enum GTHR_E_INVALID_TIME_OUT = 0xffffffff80040d47;
enum GTHR_E_INVALID_RETRIES = 0xffffffff80040d48;
enum GTHR_E_INVALID_LOG_FILE_NAME = 0xffffffff80040d49;
enum GTHR_E_INVALID_HOST_NAME = 0xffffffff80040d50;
enum GTHR_E_INVALID_START_PAGE = 0xffffffff80040d51;
enum GTHR_E_DUPLICATE_PROJECT = 0xffffffff80040d52;
enum GTHR_E_INVALID_DIRECTORY = 0xffffffff80040d53;
enum GTHR_E_FILTER_INTERRUPTED = 0xffffffff80040d54;
enum GTHR_E_INVALID_PROXY_PORT = 0xffffffff80040d55;
enum GTHR_S_CONFIG_HAS_ACCOUNTS = 0x00040d56;
enum GTHR_E_SECRET_NOT_FOUND = 0xffffffff80040d57;
enum GTHR_E_INVALID_PATH_EXPRESSION = 0xffffffff80040d58;
enum GTHR_E_INVALID_START_PAGE_HOST = 0xffffffff80040d59;
enum GTHR_E_INVALID_START_PAGE_PATH = 0xffffffff80040d60;
enum GTHR_E_APPLICATION_NOT_FOUND = 0xffffffff80040d61;
enum GTHR_E_CANNOT_REMOVE_PLUGINMGR = 0xffffffff80040d62;
enum GTHR_E_INVALID_APPLICATION_NAME = 0xffffffff80040d63;
enum GTHR_E_FILTER_FAULT = 0xffffffff80040d65;
enum GTHR_E_NON_FIXED_DRIVE = 0xffffffff80040d66;
enum GTHR_S_PROB_NOT_MODIFIED = 0x00040d67;
enum GTHR_S_CRAWL_SCHEDULED = 0x00040d68;
enum GTHR_S_TRANSACTION_IGNORED = 0x00040d69;
enum GTHR_S_START_FILTER_FROM_PROTOCOL = 0x00040d6a;
enum GTHR_E_FILTER_SINGLE_THREADED = 0xffffffff80040d6b;
enum GTHR_S_BAD_FILE_LINK = 0x00040d6c;
enum GTHR_E_URL_UNIDENTIFIED = 0xffffffff80040d6d;
enum GTHR_S_NOT_ALL_PARTS = 0x00040d6e;
enum GTHR_E_FORCE_NOTIFICATION_RESET = 0xffffffff80040d6f;
enum GTHR_S_END_PROCESS_LOOP_NOTIFY_QUEUE = 0x00040d70;
enum GTHR_S_START_FILTER_FROM_BODY = 0x00040d71;
enum GTHR_E_CONTENT_ID_CONFLICT = 0xffffffff80040d72;
enum GTHR_E_UNABLE_TO_READ_EXCHANGE_STORE = 0xffffffff80040d73;
enum GTHR_E_RECOVERABLE_EXOLEDB_ERROR = 0xffffffff80040d74;
enum GTHR_E_INVALID_CALL_FROM_WBREAKER = 0xffffffff80040d76;
enum GTHR_E_PROPERTY_LIST_NOT_INITIALIZED = 0xffffffff80040d77;
enum GTHR_S_MODIFIED_PARTS = 0x00040d78;
enum GHTR_E_LOCAL_SERVER_UNAVAILABLE = 0xffffffff80040d79;
enum GTHR_E_SCHEMA_ERRORS_OCCURRED = 0xffffffff80040d7a;
enum GTHR_E_TIMEOUT = 0xffffffff80040d7b;
enum GTHR_S_CRAWL_FULL = 0x00040d83;
enum GTHR_S_CRAWL_INCREMENTAL = 0x00040d84;
enum GTHR_S_CRAWL_ADAPTIVE = 0x00040d85;
enum GTHR_E_NOTIFICATION_START_ADDRESS_INVALID = 0xffffffff80040d86;
enum GTHR_E_NOTIFICATION_TYPE_NOT_SUPPORTED = 0xffffffff80040d87;
enum GTHR_E_NOTIFICATION_FILE_SHARE_INFO_NOT_AVAILABLE = 0xffffffff80040d88;
enum GTHR_E_NOTIFICATION_LOCAL_PATH_MUST_USE_FIXED_DRIVE = 0xffffffff80040d89;
enum GHTR_E_INSUFFICIENT_DISK_SPACE = 0xffffffff80040d8b;
enum GTHR_E_INVALID_RESOURCE_ID = 0xffffffff80040d8d;
enum GTHR_E_NESTED_HIERARCHICAL_START_ADDRESSES = 0xffffffff80040d8e;
enum GTHR_S_NO_INDEX = 0x00040d90;
enum GTHR_S_PAUSE_REASON_EXTERNAL = 0x00040d92;
enum GTHR_S_PAUSE_REASON_UPGRADING = 0x00040d93;
enum GTHR_S_PAUSE_REASON_BACKOFF = 0x00040d94;
enum GTHR_E_RETRY = 0xffffffff80040d95;
enum GTHR_E_JET_BACKUP_ERROR = 0xffffffff80040d96;
enum GTHR_E_JET_RESTORE_ERROR = 0xffffffff80040d97;
enum GTHR_S_OFFICE_CHILD = 0x00040d9a;
enum GTHR_E_PLUGIN_NOT_REGISTERED = 0xffffffff80040d9b;
enum GTHR_E_NOTIF_ACCESS_TOKEN_UPDATED = 0xffffffff80040d9c;
enum GTHR_E_DIRMON_NOT_INITIALZED = 0xffffffff80040d9d;
enum GTHR_E_NOTIF_BEING_REMOVED = 0xffffffff80040d9e;
enum GTHR_E_NOTIF_EXCESSIVE_THROUGHPUT = 0xffffffff80040d9f;
enum GTHR_E_INVALID_PATH_SPEC = 0xffffffff80040da0;
enum GTHR_E_INSUFFICIENT_FEATURE_TERMS = 0xffffffff80040da1;
enum GTHR_E_INSUFFICIENT_EXAMPLE_CATEGORIES = 0xffffffff80040da2;
enum GTHR_E_INSUFFICIENT_EXAMPLE_DOCUMENTS = 0xffffffff80040da3;
enum GTHR_E_AUTOCAT_UNEXPECTED = 0xffffffff80040da4;
enum GTHR_E_SINGLE_THREADED_EMBEDDING = 0xffffffff80040da5;
enum GTHR_S_CANNOT_WORDBREAK = 0x00040da6;
enum GTHR_S_USE_MIME_FILTER = 0x00040da7;
enum GTHR_E_FOLDER_CRAWLED_BY_ANOTHER_WORKSPACE = 0xffffffff80040da9;
enum GTHR_E_EMPTY_DACL = 0xffffffff80040daa;
enum GTHR_E_OBJECT_NOT_VALID = 0xffffffff80040dab;
enum GTHR_E_CANNOT_ENABLE_CHECKPOINT = 0xffffffff80040dae;
enum GTHR_E_SCOPES_EXCEEDED = 0xffffffff80040daf;
enum GTHR_E_PROPERTIES_EXCEEDED = 0xffffffff80040db0;
enum GTHR_E_INVALID_START_ADDRESS = 0xffffffff80040db2;
enum GTHR_S_PAUSE_REASON_PROFILE_IMPORT = 0x00040db3;
enum GTHR_E_PIPE_NOT_CONNECTTED = 0xffffffff80040db4;
enum GTHR_E_BACKUP_VALIDATION_FAIL = 0xffffffff80040db6;
enum GTHR_E_BAD_FILTER_HOST = 0xffffffff80040db7;
enum GTHR_E_NTF_CLIENT_NOT_SUBSCRIBED = 0xffffffffc0040db9;
enum GTHR_E_FILTERPOOL_NOTFOUND = 0xffffffff80040dba;
enum GTHR_E_ADDLINKS_FAILED_WILL_RETRY_PARENT = 0xffffffff80040dbb;
enum IDX_E_INVALIDTAG = 0xffffffff80041101;
enum IDX_E_METAFILE_CORRUPT = 0xffffffff80041102;
enum IDX_E_TOO_MANY_SEARCH_SERVERS = 0xffffffff80041103;
enum IDX_E_SEARCH_SERVER_ALREADY_EXISTS = 0xffffffff80041104;
enum IDX_E_BUILD_IN_PROGRESS = 0xffffffff80041105;
enum IDX_E_IDXLSTFILE_CORRUPT = 0xffffffff80041106;
enum IDX_E_REGISTRY_ENTRY = 0xffffffff80041107;
enum IDX_E_OBJECT_NOT_FOUND = 0xffffffff80041108;
enum IDX_E_SEARCH_SERVER_NOT_FOUND = 0xffffffff80041109;
enum IDX_E_WB_NOTFOUND = 0xffffffff8004110a;
enum IDX_E_NOISELIST_NOTFOUND = 0xffffffff8004110b;
enum IDX_E_STEMMER_NOTFOUND = 0xffffffff8004110c;
enum IDX_E_PROP_STOPPED = 0xffffffff8004110d;
enum IDX_E_DISKFULL = 0xffffffff8004110e;
enum IDX_E_INVALID_INDEX = 0xffffffff8004110f;
enum IDX_E_CORRUPT_INDEX = 0xffffffff80041110;
enum IDX_E_PROPSTORE_INIT_FAILED = 0xffffffff80041112;
enum IDX_E_PROP_STATE_CORRUPT = 0xffffffff80041113;
enum IDX_S_NO_BUILD_IN_PROGRESS = 0x00041114;
enum IDX_S_SEARCH_SERVER_ALREADY_EXISTS = 0x00041115;
enum IDX_S_SEARCH_SERVER_DOES_NOT_EXIST = 0x00041116;
enum IDX_E_NOT_LOADED = 0xffffffff80041117;
enum IDX_E_PROP_MAJOR_VERSION_MISMATCH = 0xffffffff80041118;
enum IDX_E_PROP_MINOR_VERSION_MISMATCH = 0xffffffff80041119;
enum IDX_E_DSS_NOT_CONNECTED = 0xffffffff8004111a;
enum IDX_E_DOCUMENT_ABORTED = 0xffffffff8004111b;
enum IDX_E_CATALOG_DISMOUNTED = 0xffffffff8004111c;
enum IDX_S_DSS_NOT_AVAILABLE = 0x0004111d;
enum IDX_E_USE_DEFAULT_CONTENTCLASS = 0xffffffff8004111f;
enum IDX_E_USE_APPGLOBAL_PROPTABLE = 0xffffffff80041120;
enum JPS_E_JET_ERR = 0xffffffff8004117f;
enum JPS_S_DUPLICATE_DOC_DETECTED = 0x00041180;
enum JPS_E_CATALOG_DECSRIPTION_MISSING = 0xffffffff80041181;
enum JPS_E_MISSING_INFORMATION = 0xffffffff80041182;
enum JPS_E_INSUFFICIENT_VERSION_STORAGE = 0xffffffff80041183;
enum JPS_E_INSUFFICIENT_DATABASE_SESSIONS = 0xffffffff80041184;
enum JPS_E_INSUFFICIENT_DATABASE_RESOURCES = 0xffffffff80041185;
enum JPS_E_SCHEMA_ERROR = 0xffffffff80041186;
enum JPS_E_PROPAGATION_FILE = 0xffffffff80041187;
enum JPS_E_PROPAGATION_CORRUPTION = 0xffffffff80041188;
enum JPS_E_PROPAGATION_VERSION_MISMATCH = 0xffffffff80041189;
enum JPS_E_SHARING_VIOLATION = 0xffffffff8004118a;
enum EXCI_E_NO_CONFIG = 0xffffffff800411a0;
enum EXCI_E_INVALID_SERVER_CONFIG = 0xffffffff800411a1;
enum EXCI_E_ACCESS_DENIED = 0xffffffff800411a2;
enum EXCI_E_INVALID_EXCHANGE_SERVER = 0xffffffff800411a3;
enum EXCI_E_BADCONFIG_OR_ACCESSDENIED = 0xffffffff800411a4;
enum EXCI_E_WRONG_SERVER_OR_ACCT = 0xffffffff800411a5;
enum EXCI_E_NOT_ADMIN_OR_WRONG_SITE = 0xffffffff800411a6;
enum EXCI_E_NO_MAPI = 0xffffffff800411a7;
enum EXCI_E_INVALID_ACCOUNT_INFO = 0xffffffff800411a8;
enum PRTH_E_INTERNAL_ERROR = 0xffffffff80041204;
enum PRTH_S_MAX_GROWTH = 0x00041209;
enum PRTH_E_WININET = 0xffffffff8004120a;
enum PRTH_E_RETRY = 0xffffffff8004120b;
enum PRTH_S_MAX_DOWNLOAD = 0x0004120c;
enum PRTH_E_MIME_EXCLUDED = 0xffffffff8004120d;
enum PRTH_E_CANT_TRANSFORM_EXTERNAL_ACL = 0xffffffff8004120e;
enum PRTH_E_CANT_TRANSFORM_DENIED_ACE = 0xffffffff8004120f;
enum PRTH_E_NO_PROPERTY = 0xffffffff80041213;
enum PRTH_S_USE_ROSEBUD = 0x00041214;
enum PRTH_E_DATABASE_OPEN_ERROR = 0xffffffff80041215;
enum PRTH_E_OPLOCK_BROKEN = 0xffffffff80041216;
enum PRTH_E_LOAD_FAILED = 0xffffffff80041217;
enum PRTH_E_INIT_FAILED = 0xffffffff80041218;
enum PRTH_E_VOLUME_MOUNT_POINT = 0xffffffff80041219;
enum PRTH_E_TRUNCATED = 0xffffffff8004121a;
enum GTHR_E_LOCAL_GROUPS_EXPANSION_INTERNAL_ERROR = 0xffffffff8004121d;
enum PRTH_E_HTTPS_CERTIFICATE_ERROR = 0xffffffff80041223;
enum PRTH_E_HTTPS_REQUIRE_CERTIFICATE = 0xffffffff80041224;
enum PRTH_S_TRY_IMPERSONATING = 0x00041225;
enum CMDLINE_E_UNEXPECTED = 0xffffffff80041501;
enum CMDLINE_E_PAREN = 0xffffffff80041502;
enum CMDLINE_E_PARAM_SIZE = 0xffffffff80041503;
enum CMDLINE_E_NOT_INIT = 0xffffffff80041504;
enum CMDLINE_E_ALREADY_INIT = 0xffffffff80041505;
enum CMDLINE_E_NUM_PARAMS = 0xffffffff80041506;
enum NLADMIN_E_DUPLICATE_CATALOG = 0xffffffff80041901;
enum NLADMIN_S_NOT_ALL_BUILD_CATALOGS_INITIALIZED = 0x00041902;
enum NLADMIN_E_FAILED_TO_GIVE_ACCOUNT_PRIVILEGE = 0xffffffff80041903;
enum NLADMIN_E_BUILD_CATALOG_NOT_INITIALIZED = 0xffffffff80041904;
enum SCRIPTPI_E_CHUNK_NOT_TEXT = 0xffffffff80042000;
enum SCRIPTPI_E_PID_NOT_NAME = 0xffffffff80042001;
enum SCRIPTPI_E_PID_NOT_NUMERIC = 0xffffffff80042002;
enum SCRIPTPI_E_CHUNK_NOT_VALUE = 0xffffffff80042003;
enum SCRIPTPI_E_CANNOT_ALTER_CHUNK = 0xffffffff80042004;
enum SCRIPTPI_E_ALREADY_COMPLETED = 0xffffffff80042005;
enum _MAPI_E_NO_SUPPORT = 0xffffffff80040102;
enum _MAPI_E_BAD_CHARWIDTH = 0xffffffff80040103;
enum _MAPI_E_STRING_TOO_LONG = 0xffffffff80040105;
enum _MAPI_E_UNKNOWN_FLAGS = 0xffffffff80040106;
enum _MAPI_E_INVALID_ENTRYID = 0xffffffff80040107;
enum _MAPI_E_INVALID_OBJECT = 0xffffffff80040108;
enum _MAPI_E_OBJECT_CHANGED = 0xffffffff80040109;
enum _MAPI_E_OBJECT_DELETED = 0xffffffff8004010a;
enum _MAPI_E_BUSY = 0xffffffff8004010b;
enum _MAPI_E_NOT_ENOUGH_DISK = 0xffffffff8004010d;
enum _MAPI_E_NOT_ENOUGH_RESOURCES = 0xffffffff8004010e;
enum _MAPI_E_NOT_FOUND = 0xffffffff8004010f;
enum _MAPI_E_VERSION = 0xffffffff80040110;
enum _MAPI_E_LOGON_FAILED = 0xffffffff80040111;
enum _MAPI_E_SESSION_LIMIT = 0xffffffff80040112;
enum _MAPI_E_USER_CANCEL = 0xffffffff80040113;
enum _MAPI_E_UNABLE_TO_ABORT = 0xffffffff80040114;
enum _MAPI_E_NETWORK_ERROR = 0xffffffff80040115;
enum _MAPI_E_DISK_ERROR = 0xffffffff80040116;
enum _MAPI_E_TOO_COMPLEX = 0xffffffff80040117;
enum _MAPI_E_BAD_COLUMN = 0xffffffff80040118;
enum _MAPI_E_EXTENDED_ERROR = 0xffffffff80040119;
enum _MAPI_E_COMPUTED = 0xffffffff8004011a;
enum _MAPI_E_CORRUPT_DATA = 0xffffffff8004011b;
enum _MAPI_E_UNCONFIGURED = 0xffffffff8004011c;
enum _MAPI_E_FAILONEPROVIDER = 0xffffffff8004011d;
enum _MAPI_E_UNKNOWN_CPID = 0xffffffff8004011e;
enum _MAPI_E_UNKNOWN_LCID = 0xffffffff8004011f;
enum _MAPI_E_PASSWORD_CHANGE_REQUIRED = 0xffffffff80040120;
enum _MAPI_E_PASSWORD_EXPIRED = 0xffffffff80040121;
enum _MAPI_E_INVALID_WORKSTATION_ACCOUNT = 0xffffffff80040122;
enum _MAPI_E_INVALID_ACCESS_TIME = 0xffffffff80040123;
enum _MAPI_E_ACCOUNT_DISABLED = 0xffffffff80040124;
enum _MAPI_E_END_OF_SESSION = 0xffffffff80040200;
enum _MAPI_E_UNKNOWN_ENTRYID = 0xffffffff80040201;
enum _MAPI_E_MISSING_REQUIRED_COLUMN = 0xffffffff80040202;
enum _MAPI_W_NO_SERVICE = 0x00040203;
enum MSG_TEST_MESSAGE = 0x40041000;
enum FLTRDMN_E_UNEXPECTED = 0xffffffff80042401;
enum FLTRDMN_E_QI_FILTER_FAILED = 0xffffffff80042402;
enum FLTRDMN_E_FILTER_INIT_FAILED = 0xffffffff80042404;
enum FLTRDMN_E_ENCRYPTED_DOCUMENT = 0xffffffff80042405;
enum FLTRDMN_E_CANNOT_DECRYPT_PASSWORD = 0xffffffff80042406;
enum OLEDB_BINDER_CUSTOM_ERROR = 0xffffffff80042500;
enum NOTESPH_E_UNEXPECTED_STATE = 0xffffffff80042601;
enum NOTESPH_S_IGNORE_ID = 0x00042602;
enum NOTESPH_E_UNSUPPORTED_CONTENT_FIELD_TYPE = 0xffffffff80042603;
enum NOTESPH_E_ITEM_NOT_FOUND = 0xffffffff80042604;
enum NOTESPH_E_SERVER_CONFIG = 0xffffffff80042605;
enum NOTESPH_E_ATTACHMENTS = 0xffffffff80042606;
enum NOTESPH_E_NO_NTID = 0xffffffff80042607;
enum NOTESPH_E_DB_ACCESS_DENIED = 0xffffffff80042608;
enum NOTESPH_E_NOTESSETUP_ID_MAPPING_ERROR = 0xffffffff80042609;
enum NOTESPH_S_LISTKNOWNFIELDS = 0x00042610;
enum NOTESPH_E_FAIL = 0xffffffff80042611;
enum STS_ABORTXMLPARSE = 0xffffffff80042614;
enum STS_WS_ERROR = 0xffffffff80042616;
enum SPS_WS_ERROR = 0xffffffff80042617;
enum EXSTOREPH_E_UNEXPECTED = 0xffffffff80042701;
enum CERT_E_NOT_FOUND_OR_NO_PERMISSSION = 0xffffffff80042801;
enum SRCH_SCHEMA_CACHE_E_UNEXPECTED = 0xffffffff80043301;
enum CONTENT_SOURCE_E_PROPERTY_MAPPING_READ = 0xffffffff80043401;
enum CONTENT_SOURCE_E_UNEXPECTED_NULL_POINTER = 0xffffffff80043402;
enum CONTENT_SOURCE_E_PROPERTY_MAPPING_BAD_VECTOR_SIZE = 0xffffffff80043403;
enum CONTENT_SOURCE_E_CONTENT_CLASS_READ = 0xffffffff80043404;
enum CONTENT_SOURCE_E_UNEXPECTED_EXCEPTION = 0xffffffff80043405;
enum CONTENT_SOURCE_E_NULL_CONTENT_CLASS_BSTR = 0xffffffff80043406;
enum CONTENT_SOURCE_E_CONTENT_SOURCE_COLUMN_TYPE = 0xffffffff80043407;
enum CONTENT_SOURCE_E_OUT_OF_RANGE = 0xffffffff80043408;
enum CONTENT_SOURCE_E_NULL_URI = 0xffffffff80043409;
enum REXSPH_E_INVALID_CALL = 0xffffffff80043500;
enum REXSPH_S_REDIRECTED = 0x00043501;
enum REXSPH_E_REDIRECT_ON_SECURITY_UPDATE = 0xffffffff80043502;
enum REXSPH_E_MULTIPLE_REDIRECT = 0xffffffff80043503;
enum REXSPH_E_NO_PROPERTY_ON_ROW = 0xffffffff80043504;
enum REXSPH_E_TYPE_MISMATCH_ON_READ = 0xffffffff80043505;
enum REXSPH_E_UNEXPECTED_DATA_STATUS = 0xffffffff80043506;
enum REXSPH_E_UNKNOWN_DATA_TYPE = 0xffffffff80043507;
enum REXSPH_E_UNEXPECTED_FILTER_STATE = 0xffffffff80043508;
enum REXSPH_E_DUPLICATE_PROPERTY = 0xffffffff80043509;
enum PEOPLE_IMPORT_E_DBCONNFAIL = 0xffffffff80044000;
enum PEOPLE_IMPORT_NODSDEFINED = 0xffffffff80044001;
enum PEOPLE_IMPORT_E_FAILTOGETDSDEF = 0xffffffff80044002;
enum PEOPLE_IMPORT_NOMAPPINGDEFINED = 0xffffffff80044003;
enum PEOPLE_IMPORT_E_FAILTOGETDSMAPPING = 0xffffffff80044004;
enum PEOPLE_IMPORT_E_DATATYPENOTSUPPORTED = 0xffffffff80044005;
enum PEOPLE_IMPORT_E_NOCASTINGSUPPORTED = 0xffffffff80044006;
enum PEOPLE_IMPORT_E_UPDATE_DIRSYNC_COOKIE = 0xffffffff80044007;
enum PEOPLE_IMPORT_E_DIRSYNC_ZERO_COOKIE = 0xffffffff80044008;
enum PEOPLE_IMPORT_E_LDAPPATH_TOOLONG = 0xffffffff80044009;
enum PEOPLE_IMPORT_E_CANONICALURL_TOOLONG = 0xffffffff8004400a;
enum PEOPLE_IMPORT_E_USERNAME_NOTRESOLVED = 0xffffffff8004400b;
enum PEOPLE_IMPORT_E_DC_NOT_AVAILABLE = 0xffffffff8004400c;
enum PEOPLE_IMPORT_E_DOMAIN_DISCOVER_FAILED = 0xffffffff8004400d;
enum PEOPLE_IMPORT_E_FAILTOGETLCID = 0xffffffff8004400e;
enum PEOPLE_IMPORT_E_DOMAIN_REMOVED = 0xffffffff8004400f;
enum PEOPLE_IMPORT_E_ENUM_ACCESSDENIED = 0xffffffff80044010;
enum PEOPLE_IMPORT_E_DIRSYNC_NOTREFRESHED = 0xffffffff80044011;
enum FTE_E_SECRET_NOT_FOUND = 0xffffffff80043602;
enum FTE_E_PIPE_NOT_CONNECTED = 0xffffffff80043603;
enum FTE_E_ADMIN_BLOB_CORRUPT = 0xffffffff80043604;
enum FTE_E_FILTER_SINGLE_THREADED = 0xffffffff80043605;
enum FTE_E_ERROR_WRITING_REGISTRY = 0xffffffff80043606;
enum FTE_E_PROJECT_SHUTDOWN = 0xffffffff80043607;
enum FTE_E_PROJECT_NOT_INITALIZED = 0xffffffff80043608;
enum FTE_E_PIPE_DATA_CORRUPTED = 0xffffffff80043609;
enum FTE_E_URB_TOO_BIG = 0xffffffff80043610;
enum FTE_E_INVALID_DOCID = 0xffffffff80043611;
enum FTE_E_PAUSE_EXTERNAL = 0xffffffff80043612;
enum FTE_E_REJECTED_DUE_TO_PROJECT_STATUS = 0xffffffff80043613;
enum FTE_E_FD_DID_NOT_CONNECT = 0xffffffff80043614;
enum FTE_E_PROGID_REQUIRED = 0xffffffff80043616;
enum FTE_E_STATIC_THREAD_INVALID_ARGUMENTS = 0xffffffff80043617;
enum FTE_E_CATALOG_ALREADY_EXISTS = 0xffffffff80043618;
enum FTE_S_RESOURCES_STARTING_TO_GET_LOW = 0x00043619;
enum FTE_E_PATH_TOO_LONG = 0xffffffff8004361a;
enum FTE_INVALID_ADMIN_CLIENT = 0xffffffff8004361b;
enum FTE_E_COM_SIGNATURE_VALIDATION = 0xffffffff8004361c;
enum FTE_E_AFFINITY_MASK = 0xffffffff8004361d;
enum FTE_E_FD_OWNERSHIP_OBSOLETE = 0xffffffff8004361e;
enum FTE_E_EXCEEDED_MAX_PLUGINS = 0xffffffff80043621;
enum FTE_S_BEYOND_QUOTA = 0x00043622;
enum FTE_E_DUPLICATE_OBJECT = 0xffffffff80043624;
enum FTE_S_REDUNDANT = 0x00043625;
enum FTE_E_REDUNDANT_TRAN_FAILURE = 0xffffffff80043626;
enum FTE_E_DEPENDENT_TRAN_FAILED_TO_PERSIST = 0xffffffff80043627;
enum FTE_E_FD_SHUTDOWN = 0xffffffff80043628;
enum FTE_E_CATALOG_DOES_NOT_EXIST = 0xffffffff80043629;
enum FTE_E_NO_PLUGINS = 0xffffffff8004362a;
enum FTE_S_STATUS_CHANGE_REQUEST = 0x0004362b;
enum FTE_E_BATCH_ABORTED = 0xffffffff8004362c;
enum FTE_E_ANOTHER_STATUS_CHANGE_IS_ALREADY_ACTIVE = 0xffffffff8004362d;
enum FTE_S_RESUME = 0x0004362e;
enum FTE_E_NOT_PROCESSED_DUE_TO_PREVIOUS_ERRORS = 0xffffffff8004362f;
enum FTE_E_FD_TIMEOUT = 0xffffffff80043630;
enum FTE_E_RESOURCE_SHUTDOWN = 0xffffffff80043631;
enum FTE_E_INVALID_PROPERTY = 0xffffffff80043632;
enum FTE_E_NO_MORE_PROPERTIES = 0xffffffff80043633;
enum FTE_E_UNKNOWN_PLUGIN = 0xffffffff80043634;
enum FTE_E_LIBRARY_NOT_LOADED = 0xffffffff80043635;
enum FTE_E_PERFMON_FULL = 0xffffffff80043636;
enum FTE_E_FAILED_TO_CREATE_ACCESSOR = 0xffffffff80043637;
enum FTE_E_INVALID_TYPE = 0xffffffff80043638;
enum FTE_E_OUT_OF_RANGE = 0xffffffff80043639;
enum FTE_E_CORRUPT_PROPERTY_STORE = 0xffffffff8004363a;
enum FTE_E_PROPERTY_STORE_WORKID_NOTVALID = 0xffffffff8004363b;
enum FTE_S_PROPERTY_STORE_END_OF_ENUMERATION = 0x0004363c;
enum FTE_E_CORRUPT_GATHERER_HASH_MAP = 0xffffffff8004363d;
enum FTE_E_KEY_NOT_CACHED = 0xffffffff8004363e;
enum FTE_E_UPGRADE_INTERFACE_ALREADY_SHUTDOWN = 0xffffffff8004363f;
enum FTE_E_UPGRADE_INTERFACE_ALREADY_INSTANTIATED = 0xffffffff80043640;
enum FTE_E_STACK_CORRUPTED = 0xffffffff80043641;
enum FTE_E_INVALID_PROG_ID = 0xffffffff80043642;
enum FTE_E_SERIAL_STREAM_CORRUPT = 0xffffffff80043643;
enum FTE_E_READONLY_CATALOG = 0xffffffff80043644;
enum FTE_E_PERF_NOT_LOADED = 0xffffffff80043645;
enum FTE_S_READONLY_CATALOG = 0x00043646;
enum FTE_E_RETRY_HUGE_DOC = 0xffffffff80043648;
enum FTE_E_UNKNOWN_FD_TYPE = 0xffffffff80043649;
enum FTE_E_DOC_TOO_HUGE = 0xffffffff8004364a;
enum FTE_E_DATATYPE_MISALIGNMENT = 0xffffffff8004364b;
enum FTE_E_ALREADY_INITIALIZED = 0xffffffff8004364c;
enum FTE_E_FD_USED_TOO_MUCH_MEMORY = 0xffffffff8004364d;
enum FTE_E_UNEXPECTED_EXIT = 0xffffffff8004364e;
enum FTE_E_HIGH_MEMORY_PRESSURE = 0xffffffff8004364f;
enum FTE_E_INVALID_ISOLATE_ERROR_BATCH = 0xffffffff80043650;
enum FTE_E_RETRY_SINGLE_DOC_PER_BATCH = 0xffffffff80043651;
enum FTE_E_INVALID_PROJECT_ID = 0xffffffff80043652;
enum FTE_E_FAILURE_TO_POST_SETCOMPLETION_STATUS = 0xffffffff80043653;
enum FTE_E_INVALID_CODEPAGE = 0xffffffff80043654;
enum FTE_E_FD_IDLE = 0xffffffff80043655;
enum FTE_E_FD_UNRESPONSIVE = 0xffffffff80043656;
enum FTE_S_TRY_TO_FLUSH = 0x00043657;
enum FTE_S_CATALOG_BLOB_MISMATCHED = 0x00043658;
enum FTE_S_PROPERTY_RESET = 0x00043659;
enum FTE_E_NO_PROPERTY_STORE = 0xffffffffc004365a;
enum FTE_E_CB_OUT_OF_MEMORY = 0xffffffff8004cb00;
enum FTE_E_CB_CBID_OUT_OF_BOUND = 0xffffffff8004cb01;
enum FTE_E_CB_NOT_ENOUGH_AVAIL_PHY_MEM = 0xffffffff8004cb02;
enum FTE_E_CB_NOT_ENOUGH_OCC_BUFFER = 0xffffffff8004cb03;
enum FTE_E_CORRUPT_WORDLIST = 0xffffffff8004cb04;
enum FTE_E_FD_NO_IPERSIST_INTERFACE = 0xffffffff8004fd00;
enum FTE_E_FD_IFILTER_INIT_FAILED = 0xffffffff8004fd01;
enum FTE_E_FD_FAILED_TO_LOAD_IFILTER = 0xffffffff8004fd02;
enum FTE_E_FD_DOC_TIMEOUT = 0xffffffff8004fd03;
enum FTE_E_FD_UNEXPECTED_EXIT = 0xffffffff8004fd04;
enum FTE_E_FD_DOC_UNEXPECTED_EXIT = 0xffffffff8004fd05;
enum FTE_E_FD_NOISE_NO_TEXT_FILTER = 0xffffffff8004fd06;
enum FTE_E_FD_NOISE_NO_IPERSISTSTREAM_ON_TEXT_FILTER = 0xffffffff8004fd07;
enum FTE_E_FD_NOISE_TEXT_FILTER_LOAD_FAILED = 0xffffffff8004fd08;
enum FTE_E_FD_NOISE_TEXT_FILTER_INIT_FAILED = 0xffffffff8004fd09;
enum FTE_E_FD_OCCURRENCE_OVERFLOW = 0xffffffff8004fd0a;
enum FTE_E_FD_FILTER_CAUSED_SHARING_VIOLATION = 0xffffffff8004fd0b;
enum ERROR_SOURCE_PROTHNDLR = 0x00001200;
enum PRTH_E_COMM_ERROR = 0x80041200;
enum PRTH_E_OBJ_NOT_FOUND = 0x80041201;
enum PRTH_E_REQUEST_ERROR = 0x80041202;
enum PRTH_S_NOT_MODIFIED = 0x00041203;
enum PRTH_E_ACCESS_DENIED = 0x80041205;
enum PRTH_E_SERVER_ERROR = 0x80041206;
enum PRTH_E_NOT_REDIRECTED = 0x80041207;
enum PRTH_E_BAD_REQUEST = 0x80041208;
enum PRTH_E_HTTP_CANNOT_CONNECT = 0x80041209;
enum PRTH_S_ACL_IS_READ_EVERYONE = 0x00041210;
enum PRTH_E_ACL_IS_READ_NONE = 0x80041211;
enum PRTH_E_ACL_TOO_BIG = 0x80041212;
enum PRTH_S_NOT_ALL_PARTS = 0x0004121b;
enum QUERY_E_ALLNOISE_AND_NO_RELDOC = 0xffffffff8004160d;
enum QUERY_E_NO_RELDOC = 0xffffffff8004160e;
enum QUERY_E_ALLNOISE_AND_NO_RELPROP = 0xffffffff8004160f;
enum QUERY_E_NO_RELPROP = 0xffffffff80041610;
enum QUERY_E_REPEATED_RELDOC = 0xffffffff80041611;
enum QUERY_E_RELDOC_SYNTAX_NOT_SUPPORTED = 0xffffffff80041612;
enum QUERY_E_INVALID_DOCUMENT_IDENTIFIER = 0xffffffff80041613;
enum QUERY_E_INCORRECT_VERSION = 0xffffffff80041614;
enum QUERY_E_INVALIDSCOPE_COALESCE = 0xffffffff80041615;
enum QUERY_E_INVALIDSORT_COALESCE = 0xffffffff80041616;
enum QUERY_E_INVALIDCOALESCE = 0xffffffff80041617;
enum QUERY_E_UPGRADEINPROGRESS = 0xffffffff80041618;
enum QUERY_E_AGGREGATE_NOT_SUPPORTED = 0xffffffff80041619;
enum QUERY_E_TOP_LEVEL_IN_GROUP = 0xffffffff8004161a;
enum QUERY_E_DUPLICATE_RANGE_NAME = 0xffffffff8004161b;
enum CI_S_NEW_AUXMETADATA = 0x00041829;
enum CI_E_NO_AUXMETADATA = 0xffffffff8004182a;
enum CI_S_CLIENT_REQUESTED_ABORT = 0x0004182b;
enum CI_S_RETRY_DOCUMENT = 0x0004182c;
enum CI_E_CORRUPT_FWIDX = 0xffffffffc004182d;
enum CI_E_DIACRITIC_SETTINGS_DIFFER = 0xffffffffc004182e;
enum CI_E_INVALID_CATALOG_LIST_VERSION = 0xffffffff8004182f;
enum CI_S_CATALOG_RESET = 0x00041830;
enum CI_E_NO_CATALOG_MANAGER = 0xffffffffc0041831;
enum CI_E_INCONSISTENT_TRANSACTION = 0xffffffffc0041832;
enum CI_E_PROTECTED_CATALOG_NOT_AVAILABLE = 0xffffffffc0041833;
enum CI_E_NO_PROTECTED_USER = 0xffffffffc0041834;
enum CI_E_MULTIPLE_PROTECTED_USERS_UNSUPPORTED = 0xffffffffc0041835;
enum CI_E_PROTECTED_CATALOG_SID_MISMATCH = 0xffffffffc0041836;
enum CI_E_PROTECTED_CATALOG_NON_INTERACTIVE_USER = 0xffffffffc0041837;
enum MSG_CI_MASTER_MERGE_STARTED = 0x40001006;
enum MSG_CI_MASTER_MERGE_COMPLETED = 0x40001007;
enum MSG_CI_MASTER_MERGE_ABORTED = 0x40001008;
enum MSG_CI_MASTER_MERGE_CANT_START = 0xffffffffc0001009;
enum MSG_CI_MASTER_MERGE_CANT_RESTART = 0xffffffffc000100a;
enum MSG_CI_MASTER_MERGE_RESTARTED = 0x40001019;
enum MSG_CI_CORRUPT_INDEX_COMPONENT = 0x4000102a;
enum MSG_CI_MASTER_MERGE_ABORTED_LOW_DISK = 0x40001043;
enum MSG_CI_MASTER_MERGE_REASON_EXTERNAL = 0x40001044;
enum MSG_CI_MASTER_MERGE_REASON_INDEX_LIMIT = 0x40001045;
enum MSG_CI_MASTER_MERGE_REASON_EXPECTED_DOCS = 0x40001046;
enum MSG_CI_MASTER_MERGE_REASON_NUMBER = 0x40001047;
enum MSG_CI_CREATE_SEVER_ITEM_FAILED = 0xffffffff80001048;
enum NOT_N_PARSE_ERROR = 0x0008092e;
enum IDS_MON_DEFAULT_ERROR = 0x0004092f;
enum IDS_MON_ILLEGAL_PASSTHROUGH = 0x00040930;
enum IDS_MON_PARSE_ERR_1_PARAM = 0x00040931;
enum IDS_MON_PARSE_ERR_2_PARAM = 0x00040932;
enum IDS_MON_SEMI_COLON = 0x00040933;
enum IDS_MON_ORDINAL_OUT_OF_RANGE = 0x00040934;
enum IDS_MON_VIEW_NOT_DEFINED = 0x00040935;
enum IDS_MON_COLUMN_NOT_DEFINED = 0x00040936;
enum IDS_MON_BUILTIN_VIEW = 0x00040937;
enum IDS_MON_OUT_OF_MEMORY = 0x00040938;
enum IDS_MON_SELECT_STAR = 0x00040939;
enum IDS_MON_OR_NOT = 0x0004093a;
enum IDS_MON_CANNOT_CONVERT = 0x0004093b;
enum IDS_MON_OUT_OF_RANGE = 0x0004093c;
enum IDS_MON_RELATIVE_INTERVAL = 0x0004093d;
enum IDS_MON_NOT_COLUMN_OF_VIEW = 0x0004093e;
enum IDS_MON_BUILTIN_PROPERTY = 0x0004093f;
enum IDS_MON_WEIGHT_OUT_OF_RANGE = 0x00040940;
enum IDS_MON_MATCH_STRING = 0x00040941;
enum IDS_MON_PROPERTY_NAME_IN_VIEW = 0x00040942;
enum IDS_MON_VIEW_ALREADY_DEFINED = 0x00040943;
enum IDS_MON_INVALID_CATALOG = 0x00040944;
enum IDS_MON_INVALIDSELECT_COALESCE = 0x00040945;
enum IDS_MON_CANNOT_CAST = 0x00040946;
enum IDS_MON_DATE_OUT_OF_RANGE = 0x00040947;
enum IDS_MON_INVALID_IN_GROUP_CLAUSE = 0x00040948;
enum DBPROPSET_MSDAORA_ROWSET = GUID(0xe8cc4cbd, 0xfdff, 0x11d0, [0xb8, 0x65, 0x0, 0xa0, 0xc9, 0x8, 0x1c, 0x1d]);
enum DBPROPSET_MSDAORA8_ROWSET = GUID(0x7f06a375, 0xdd6a, 0x43db, [0xb4, 0xe0, 0x1f, 0xc1, 0x21, 0xe5, 0xe6, 0x2b]);
enum CLSID_MSDASQL = GUID(0xc8b522cb, 0x5cf3, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum CLSID_MSDASQL_ENUMERATOR = GUID(0xc8b522cd, 0x5cf3, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
enum DBPROPSET_PROVIDERDATASOURCEINFO = GUID(0x497c60e0, 0x7123, 0x11cf, [0xb1, 0x71, 0x0, 0xaa, 0x0, 0x57, 0x59, 0x9e]);
enum DBPROPSET_PROVIDERROWSET = GUID(0x497c60e1, 0x7123, 0x11cf, [0xb1, 0x71, 0x0, 0xaa, 0x0, 0x57, 0x59, 0x9e]);
enum DBPROPSET_PROVIDERDBINIT = GUID(0x497c60e2, 0x7123, 0x11cf, [0xb1, 0x71, 0x0, 0xaa, 0x0, 0x57, 0x59, 0x9e]);
enum DBPROPSET_PROVIDERSTMTATTR = GUID(0x497c60e3, 0x7123, 0x11cf, [0xb1, 0x71, 0x0, 0xaa, 0x0, 0x57, 0x59, 0x9e]);
enum DBPROPSET_PROVIDERCONNATTR = GUID(0x497c60e4, 0x7123, 0x11cf, [0xb1, 0x71, 0x0, 0xaa, 0x0, 0x57, 0x59, 0x9e]);
enum CLSID_DataShapeProvider = GUID(0x3449a1c8, 0xc56c, 0x11d0, [0xad, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0x98, 0x63]);
enum DBPROPSET_MSDSDBINIT = GUID(0x55cb91a8, 0x5c7a, 0x11d1, [0xad, 0xad, 0x0, 0xc0, 0x4f, 0xc2, 0x98, 0x63]);
enum DBPROPSET_MSDSSESSION = GUID(0xedf17536, 0xafbf, 0x11d1, [0x88, 0x47, 0x0, 0x0, 0xf8, 0x79, 0xf9, 0x8c]);
enum CLSID_MSPersist = GUID(0x7c07e0d0, 0x4418, 0x11d2, [0x92, 0x12, 0x0, 0xc0, 0x4f, 0xbb, 0xbf, 0xb3]);
enum DBPROPSET_PERSIST = GUID(0x4d7839a0, 0x5b8e, 0x11d1, [0xa6, 0xb3, 0x0, 0xa0, 0xc9, 0x13, 0x8c, 0x66]);
enum PROGID_MSPersist_W = "MSPersist";
enum PROGID_MSPersist_Version_W = "MSPersist.1";
enum CLSID_SQLOLEDB = GUID(0xc7ff16c, 0x38e3, 0x11d0, [0x97, 0xab, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum CLSID_SQLOLEDB_ERROR = GUID(0xc0932c62, 0x38e5, 0x11d0, [0x97, 0xab, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum CLSID_SQLOLEDB_ENUMERATOR = GUID(0xdfa22b8e, 0xe68d, 0x11d0, [0x97, 0xe4, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum DBGUID_MSSQLXML = GUID(0x5d531cb2, 0xe6ed, 0x11d2, [0xb2, 0x52, 0x0, 0xc0, 0x4f, 0x68, 0x1b, 0x71]);
enum DBGUID_XPATH = GUID(0xec2a4293, 0xe898, 0x11d2, [0xb1, 0xb7, 0x0, 0xc0, 0x4f, 0x68, 0xc, 0x56]);
enum DBSCHEMA_LINKEDSERVERS = GUID(0x9093caf4, 0x2eac, 0x11d1, [0x98, 0x9, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum DBPROPSET_SQLSERVERDATASOURCE = GUID(0x28efaee4, 0x2d2c, 0x11d1, [0x98, 0x7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum DBPROPSET_SQLSERVERDATASOURCEINFO = GUID(0xdf10cb94, 0x35f6, 0x11d2, [0x9c, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xd3]);
enum DBPROPSET_SQLSERVERDBINIT = GUID(0x5cf4ca10, 0xef21, 0x11d0, [0x97, 0xe7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum DBPROPSET_SQLSERVERROWSET = GUID(0x5cf4ca11, 0xef21, 0x11d0, [0x97, 0xe7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum DBPROPSET_SQLSERVERSESSION = GUID(0x28efaee5, 0x2d2c, 0x11d1, [0x98, 0x7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
enum DBPROPSET_SQLSERVERCOLUMN = GUID(0x3b63fb5e, 0x3fbb, 0x11d3, [0x9f, 0x29, 0x0, 0xc0, 0x4f, 0x8e, 0xe9, 0xdc]);
enum DBPROPSET_SQLSERVERSTREAM = GUID(0x9f79c073, 0x8a6d, 0x4bca, [0xa8, 0xa8, 0xc9, 0xb7, 0x9a, 0x9b, 0x96, 0x2d]);
alias HACCESSOR = void*;
struct DBVECTOR
{
    ulong size;
    void* ptr;
}
struct DBTIMESTAMP
{
    short year;
    ushort month;
    ushort day;
    ushort hour;
    ushort minute;
    ushort second;
    uint fraction;
}
struct SEC_OBJECT_ELEMENT
{
    GUID guidObjectType;
    DBID ObjectID;
}
struct SEC_OBJECT
{
    uint cObjects;
    SEC_OBJECT_ELEMENT* prgObjects;
}
struct DBIMPLICITSESSION
{
    IUnknown pUnkOuter;
    GUID* piid;
    IUnknown pSession;
}
struct DBOBJECT
{
    uint dwFlags;
    GUID iid;
}
struct DBBINDEXT
{
    ubyte* pExtension;
    ulong ulExtension;
}
struct DBBINDING
{
    ulong iOrdinal;
    ulong obValue;
    ulong obLength;
    ulong obStatus;
    ITypeInfo pTypeInfo;
    DBOBJECT* pObject;
    DBBINDEXT* pBindExt;
    uint dwPart;
    uint dwMemOwner;
    uint eParamIO;
    ulong cbMaxLen;
    uint dwFlags;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
struct DBFAILUREINFO
{
    ulong hRow;
    ulong iColumn;
    HRESULT failure;
}
struct DBCOLUMNINFO
{
    PWSTR pwszName;
    ITypeInfo pTypeInfo;
    ulong iOrdinal;
    uint dwFlags;
    ulong ulColumnSize;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
    DBID columnid;
}
struct DBPARAMS
{
    void* pData;
    ulong cParamSets;
    HACCESSOR hAccessor;
}
struct DBPARAMINFO
{
    uint dwFlags;
    ulong iOrdinal;
    PWSTR pwszName;
    ITypeInfo pTypeInfo;
    ulong ulParamSize;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
struct DBPROPIDSET
{
    uint* rgPropertyIDs;
    uint cPropertyIDs;
    GUID guidPropertySet;
}
struct DBPROPINFO
{
    PWSTR pwszDescription;
    uint dwPropertyID;
    uint dwFlags;
    VARENUM vtType;
    VARIANT vValues;
}
struct DBPROPINFOSET
{
    DBPROPINFO* rgPropertyInfos;
    uint cPropertyInfos;
    GUID guidPropertySet;
}
struct DBPROP
{
    uint dwPropertyID;
    uint dwOptions;
    uint dwStatus;
    DBID colid;
    VARIANT vValue;
}
struct DBPROPSET
{
    DBPROP* rgProperties;
    uint cProperties;
    GUID guidPropertySet;
}
struct DBINDEXCOLUMNDESC
{
    DBID* pColumnID;
    uint eIndexColOrder;
}
struct DBCOLUMNDESC
{
    PWSTR pwszTypeName;
    ITypeInfo pTypeInfo;
    DBPROPSET* rgPropertySets;
    GUID* pclsid;
    uint cPropertySets;
    ulong ulColumnSize;
    DBID dbcid;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
struct DBCOLUMNACCESS
{
    void* pData;
    DBID columnid;
    ulong cbDataLen;
    uint dwStatus;
    ulong cbMaxLen;
    ulong dwReserved;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
struct DBCONSTRAINTDESC
{
    DBID* pConstraintID;
    uint ConstraintType;
    ulong cColumns;
    DBID* rgColumnList;
    DBID* pReferencedTableID;
    ulong cForeignKeyColumns;
    DBID* rgForeignKeyColumnList;
    PWSTR pwszConstraintText;
    uint UpdateRule;
    uint DeleteRule;
    uint MatchType;
    uint Deferrability;
    ulong cReserved;
    DBPROPSET* rgReserved;
}
struct MDAXISINFO
{
    ulong cbSize;
    ulong iAxis;
    ulong cDimensions;
    ulong cCoordinates;
    ulong* rgcColumns;
    PWSTR* rgpwszDimensionNames;
}
struct RMTPACK
{
    ISequentialStream pISeqStream;
    uint cbData;
    uint cBSTR;
    BSTR* rgBSTR;
    uint cVARIANT;
    VARIANT* rgVARIANT;
    uint cIDISPATCH;
    IDispatch* rgIDISPATCH;
    uint cIUNKNOWN;
    IUnknown* rgIUNKNOWN;
    uint cPROPVARIANT;
    PROPVARIANT* rgPROPVARIANT;
    uint cArray;
    VARIANT* rgArray;
}
struct DBPARAMBINDINFO
{
    PWSTR pwszDataSourceType;
    PWSTR pwszName;
    ulong ulParamSize;
    uint dwFlags;
    ubyte bPrecision;
    ubyte bScale;
}
struct DBLITERALINFO
{
    PWSTR pwszLiteralValue;
    PWSTR pwszInvalidChars;
    PWSTR pwszInvalidStartingChars;
    uint lt;
    BOOL fSupported;
    uint cchMaxLen;
}
struct ERRORINFO
{
    HRESULT hrError;
    uint dwMinor;
    GUID clsid;
    GUID iid;
    int dispid;
}
struct DBROWWATCHCHANGE
{
    ulong hRegion;
    uint eChangeKind;
    ulong hRow;
    ulong iRow;
}
struct DBCOST
{
    uint eKind;
    uint dwUnits;
    int lValue;
}
enum IID_IWordSink = GUID(0xcc907054, 0xc058, 0x101a, [0xb5, 0x54, 0x8, 0x0, 0x2b, 0x33, 0xb0, 0xe6]);
interface IWordSink : IUnknown
{
    HRESULT PutWord(uint, const(wchar)*, uint, uint);
    HRESULT PutAltWord(uint, const(wchar)*, uint, uint);
    HRESULT StartAltPhrase();
    HRESULT EndAltPhrase();
    HRESULT PutBreak(WORDREP_BREAK_TYPE);
}
alias PFNFILLTEXTBUFFER = HRESULT function(TEXT_SOURCE*);
struct TEXT_SOURCE
{
    PFNFILLTEXTBUFFER pfnFillTextBuffer;
    const(wchar)* awcBuffer;
    uint iEnd;
    uint iCur;
}
enum IID_IWordBreaker = GUID(0xd53552c8, 0x77e3, 0x101a, [0xb5, 0x52, 0x8, 0x0, 0x2b, 0x33, 0xb0, 0xe6]);
interface IWordBreaker : IUnknown
{
    HRESULT Init(BOOL, uint, BOOL*);
    HRESULT BreakText(TEXT_SOURCE*, IWordSink, IPhraseSink);
    HRESULT ComposePhrase(const(wchar)*, uint, const(wchar)*, uint, uint, PWSTR, uint*);
    HRESULT GetLicenseToUse(const(ushort)**);
}
enum IID_IWordFormSink = GUID(0xfe77c330, 0x7f42, 0x11ce, [0xbe, 0x57, 0x0, 0xaa, 0x0, 0x51, 0xfe, 0x20]);
interface IWordFormSink : IUnknown
{
    HRESULT PutAltWord(const(wchar)*, uint);
    HRESULT PutWord(const(wchar)*, uint);
}
enum IID_IStemmer = GUID(0xefbaf140, 0x7f42, 0x11ce, [0xbe, 0x57, 0x0, 0xaa, 0x0, 0x51, 0xfe, 0x20]);
interface IStemmer : IUnknown
{
    HRESULT Init(uint, BOOL*);
    HRESULT GenerateWordForms(const(wchar)*, uint, IWordFormSink);
    HRESULT GetLicenseToUse(const(ushort)**);
}
enum IID_ISimpleCommandCreator = GUID(0x5e341ab7, 0x2d0, 0x11d1, [0x90, 0xc, 0x0, 0xa0, 0xc9, 0x6, 0x37, 0x96]);
interface ISimpleCommandCreator : IUnknown
{
    HRESULT CreateICommand(IUnknown*, IUnknown);
    HRESULT VerifyCatalog(const(wchar)*, const(wchar)*);
    HRESULT GetDefaultCatalog(PWSTR, uint, uint*);
}
enum IID_IColumnMapper = GUID(0xb63e37a, 0x9ccc, 0x11d0, [0xbc, 0xdb, 0x0, 0x80, 0x5f, 0xcc, 0xce, 0x4]);
interface IColumnMapper : IUnknown
{
    HRESULT GetPropInfoFromName(const(wchar)*, DBID**, ushort*, uint*);
    HRESULT GetPropInfoFromId(const(DBID)*, ushort**, ushort*, uint*);
    HRESULT EnumPropInfo(uint, const(ushort)**, DBID**, ushort*, uint*);
    HRESULT IsMapUpToDate();
}
enum IID_IColumnMapperCreator = GUID(0xb63e37b, 0x9ccc, 0x11d0, [0xbc, 0xdb, 0x0, 0x80, 0x5f, 0xcc, 0xce, 0x4]);
interface IColumnMapperCreator : IUnknown
{
    HRESULT GetColumnMapper(const(wchar)*, const(wchar)*, IColumnMapper*);
}
struct FILTERED_DATA_SOURCES
{
    const(wchar)* pwcsExtension;
    const(wchar)* pwcsMime;
    const(GUID)* pClsid;
    const(wchar)* pwcsOverride;
}
enum IID_ILoadFilter = GUID(0xc7310722, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x4f]);
interface ILoadFilter : IUnknown
{
    HRESULT LoadIFilter(const(wchar)*, FILTERED_DATA_SOURCES*, IUnknown, BOOL, GUID*, int*, ushort**, IFilter*);
    HRESULT LoadIFilterFromStorage(IStorage, IUnknown, const(wchar)*, BOOL, GUID*, int*, ushort**, IFilter*);
    HRESULT LoadIFilterFromStream(IStream, FILTERED_DATA_SOURCES*, IUnknown, BOOL, GUID*, int*, ushort**, IFilter*);
}
enum IID_ILoadFilterWithPrivateComActivation = GUID(0x40bdbd34, 0x780b, 0x48d3, [0x9b, 0xb6, 0x12, 0xeb, 0xd4, 0xad, 0x2e, 0x75]);
interface ILoadFilterWithPrivateComActivation : ILoadFilter
{
    HRESULT LoadIFilterWithPrivateComActivation(FILTERED_DATA_SOURCES*, BOOL, GUID*, BOOL*, IFilter*);
}
enum IID_IRichChunk = GUID(0x4fdef69c, 0xdbc9, 0x454e, [0x99, 0x10, 0xb3, 0x4f, 0x3c, 0x64, 0xb5, 0x10]);
interface IRichChunk : IUnknown
{
    HRESULT GetData(uint*, uint*, PWSTR*, PROPVARIANT*);
}
enum IID_ICondition = GUID(0xfc988d4, 0xc935, 0x4b97, [0xa9, 0x73, 0x46, 0x28, 0x2e, 0xa1, 0x75, 0xc8]);
interface ICondition : IPersistStream
{
    HRESULT GetConditionType(CONDITION_TYPE*);
    HRESULT GetSubConditions(const(GUID)*, void**);
    HRESULT GetComparisonInfo(PWSTR*, CONDITION_OPERATION*, PROPVARIANT*);
    HRESULT GetValueType(PWSTR*);
    HRESULT GetValueNormalization(PWSTR*);
    HRESULT GetInputTerms(IRichChunk*, IRichChunk*, IRichChunk*);
    HRESULT Clone(ICondition*);
}
enum IID_ICondition2 = GUID(0xdb8851d, 0x2e5b, 0x47eb, [0x92, 0x8, 0xd2, 0x8c, 0x32, 0x5a, 0x1, 0xd7]);
interface ICondition2 : ICondition
{
    HRESULT GetLocale(PWSTR*);
    HRESULT GetLeafConditionInfo(PROPERTYKEY*, CONDITION_OPERATION*, PROPVARIANT*);
}
struct DB_NUMERIC
{
    ubyte precision;
    ubyte scale;
    ubyte sign;
    ubyte[16] val;
}
/+ [CONFLICTED] struct DBVECTOR
{
    align (2):
    ulong size;
    void* ptr;
}
+/
struct DBDATE
{
    short year;
    ushort month;
    ushort day;
}
struct DBTIME
{
    ushort hour;
    ushort minute;
    ushort second;
}
/+ [CONFLICTED] struct DBTIMESTAMP
{
    align (2):
    short year;
    ushort month;
    ushort day;
    ushort hour;
    ushort minute;
    ushort second;
    uint fraction;
}
+/
struct DB_VARNUMERIC
{
    ubyte precision;
    byte scale;
    ubyte sign;
    ubyte[1] val;
}
/+ [CONFLICTED] struct SEC_OBJECT_ELEMENT
{
    align (2):
    GUID guidObjectType;
    DBID ObjectID;
}
+/
/+ [CONFLICTED] struct SEC_OBJECT
{
    align (2):
    uint cObjects;
    SEC_OBJECT_ELEMENT* prgObjects;
}
+/
/+ [CONFLICTED] struct DBIMPLICITSESSION
{
    align (2):
    IUnknown pUnkOuter;
    GUID* piid;
    IUnknown pSession;
}
+/
alias DBTYPEENUM = int;
enum : int
{
    DBTYPE_EMPTY       = 0x00000000,
    DBTYPE_NULL        = 0x00000001,
    DBTYPE_I2          = 0x00000002,
    DBTYPE_I4          = 0x00000003,
    DBTYPE_R4          = 0x00000004,
    DBTYPE_R8          = 0x00000005,
    DBTYPE_CY          = 0x00000006,
    DBTYPE_DATE        = 0x00000007,
    DBTYPE_BSTR        = 0x00000008,
    DBTYPE_IDISPATCH   = 0x00000009,
    DBTYPE_ERROR       = 0x0000000a,
    DBTYPE_BOOL        = 0x0000000b,
    DBTYPE_VARIANT     = 0x0000000c,
    DBTYPE_IUNKNOWN    = 0x0000000d,
    DBTYPE_DECIMAL     = 0x0000000e,
    DBTYPE_UI1         = 0x00000011,
    DBTYPE_ARRAY       = 0x00002000,
    DBTYPE_BYREF       = 0x00004000,
    DBTYPE_I1          = 0x00000010,
    DBTYPE_UI2         = 0x00000012,
    DBTYPE_UI4         = 0x00000013,
    DBTYPE_I8          = 0x00000014,
    DBTYPE_UI8         = 0x00000015,
    DBTYPE_GUID        = 0x00000048,
    DBTYPE_VECTOR      = 0x00001000,
    DBTYPE_RESERVED    = 0x00008000,
    DBTYPE_BYTES       = 0x00000080,
    DBTYPE_STR         = 0x00000081,
    DBTYPE_WSTR        = 0x00000082,
    DBTYPE_NUMERIC     = 0x00000083,
    DBTYPE_UDT         = 0x00000084,
    DBTYPE_DBDATE      = 0x00000085,
    DBTYPE_DBTIME      = 0x00000086,
    DBTYPE_DBTIMESTAMP = 0x00000087,
}

alias DBTYPEENUM15 = int;
enum : int
{
    DBTYPE_HCHAPTER = 0x00000088,
}

alias DBTYPEENUM20 = int;
enum : int
{
    DBTYPE_FILETIME    = 0x00000040,
    DBTYPE_PROPVARIANT = 0x0000008a,
    DBTYPE_VARNUMERIC  = 0x0000008b,
}

alias DBPARTENUM = int;
enum : int
{
    DBPART_INVALID = 0x00000000,
    DBPART_VALUE   = 0x00000001,
    DBPART_LENGTH  = 0x00000002,
    DBPART_STATUS  = 0x00000004,
}

alias DBPARAMIOENUM = int;
enum : int
{
    DBPARAMIO_NOTPARAM = 0x00000000,
    DBPARAMIO_INPUT    = 0x00000001,
    DBPARAMIO_OUTPUT   = 0x00000002,
}

alias DBBINDFLAGENUM = int;
enum : int
{
    DBBINDFLAG_HTML = 0x00000001,
}

alias DBMEMOWNERENUM = int;
enum : int
{
    DBMEMOWNER_CLIENTOWNED   = 0x00000000,
    DBMEMOWNER_PROVIDEROWNED = 0x00000001,
}

/+ [CONFLICTED] struct DBOBJECT
{
    align (2):
    uint dwFlags;
    GUID iid;
}
+/
alias DBSTATUSENUM = int;
enum : int
{
    DBSTATUS_S_OK                 = 0x00000000,
    DBSTATUS_E_BADACCESSOR        = 0x00000001,
    DBSTATUS_E_CANTCONVERTVALUE   = 0x00000002,
    DBSTATUS_S_ISNULL             = 0x00000003,
    DBSTATUS_S_TRUNCATED          = 0x00000004,
    DBSTATUS_E_SIGNMISMATCH       = 0x00000005,
    DBSTATUS_E_DATAOVERFLOW       = 0x00000006,
    DBSTATUS_E_CANTCREATE         = 0x00000007,
    DBSTATUS_E_UNAVAILABLE        = 0x00000008,
    DBSTATUS_E_PERMISSIONDENIED   = 0x00000009,
    DBSTATUS_E_INTEGRITYVIOLATION = 0x0000000a,
    DBSTATUS_E_SCHEMAVIOLATION    = 0x0000000b,
    DBSTATUS_E_BADSTATUS          = 0x0000000c,
    DBSTATUS_S_DEFAULT            = 0x0000000d,
}

alias DBSTATUSENUM20 = int;
enum : int
{
    MDSTATUS_S_CELLEMPTY = 0x0000000e,
    DBSTATUS_S_IGNORE    = 0x0000000f,
}

alias DBSTATUSENUM21 = int;
enum : int
{
    DBSTATUS_E_DOESNOTEXIST       = 0x00000010,
    DBSTATUS_E_INVALIDURL         = 0x00000011,
    DBSTATUS_E_RESOURCELOCKED     = 0x00000012,
    DBSTATUS_E_RESOURCEEXISTS     = 0x00000013,
    DBSTATUS_E_CANNOTCOMPLETE     = 0x00000014,
    DBSTATUS_E_VOLUMENOTFOUND     = 0x00000015,
    DBSTATUS_E_OUTOFSPACE         = 0x00000016,
    DBSTATUS_S_CANNOTDELETESOURCE = 0x00000017,
    DBSTATUS_E_READONLY           = 0x00000018,
    DBSTATUS_E_RESOURCEOUTOFSCOPE = 0x00000019,
    DBSTATUS_S_ALREADYEXISTS      = 0x0000001a,
}

alias DBBINDURLFLAGENUM = int;
enum : int
{
    DBBINDURLFLAG_READ                 = 0x00000001,
    DBBINDURLFLAG_WRITE                = 0x00000002,
    DBBINDURLFLAG_READWRITE            = 0x00000003,
    DBBINDURLFLAG_SHARE_DENY_READ      = 0x00000004,
    DBBINDURLFLAG_SHARE_DENY_WRITE     = 0x00000008,
    DBBINDURLFLAG_SHARE_EXCLUSIVE      = 0x0000000c,
    DBBINDURLFLAG_SHARE_DENY_NONE      = 0x00000010,
    DBBINDURLFLAG_ASYNCHRONOUS         = 0x00001000,
    DBBINDURLFLAG_COLLECTION           = 0x00002000,
    DBBINDURLFLAG_DELAYFETCHSTREAM     = 0x00004000,
    DBBINDURLFLAG_DELAYFETCHCOLUMNS    = 0x00008000,
    DBBINDURLFLAG_RECURSIVE            = 0x00400000,
    DBBINDURLFLAG_OUTPUT               = 0x00800000,
    DBBINDURLFLAG_WAITFORINIT          = 0x01000000,
    DBBINDURLFLAG_OPENIFEXISTS         = 0x02000000,
    DBBINDURLFLAG_OVERWRITE            = 0x04000000,
    DBBINDURLFLAG_ISSTRUCTUREDDOCUMENT = 0x08000000,
}

alias DBBINDURLSTATUSENUM = int;
enum : int
{
    DBBINDURLSTATUS_S_OK                   = 0x00000000,
    DBBINDURLSTATUS_S_DENYNOTSUPPORTED     = 0x00000001,
    DBBINDURLSTATUS_S_DENYTYPENOTSUPPORTED = 0x00000004,
    DBBINDURLSTATUS_S_REDIRECTED           = 0x00000008,
}

alias DBSTATUSENUM25 = int;
enum : int
{
    DBSTATUS_E_CANCELED      = 0x0000001b,
    DBSTATUS_E_NOTCOLLECTION = 0x0000001c,
}

/+ [CONFLICTED] struct DBBINDEXT
{
    align (2):
    ubyte* pExtension;
    ulong ulExtension;
}
+/
/+ [CONFLICTED] struct DBBINDING
{
    align (2):
    ulong iOrdinal;
    ulong obValue;
    ulong obLength;
    ulong obStatus;
    ITypeInfo pTypeInfo;
    DBOBJECT* pObject;
    DBBINDEXT* pBindExt;
    uint dwPart;
    uint dwMemOwner;
    uint eParamIO;
    ulong cbMaxLen;
    uint dwFlags;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
+/
alias DBROWSTATUSENUM = int;
enum : int
{
    DBROWSTATUS_S_OK                     = 0x00000000,
    DBROWSTATUS_S_MULTIPLECHANGES        = 0x00000002,
    DBROWSTATUS_S_PENDINGCHANGES         = 0x00000003,
    DBROWSTATUS_E_CANCELED               = 0x00000004,
    DBROWSTATUS_E_CANTRELEASE            = 0x00000006,
    DBROWSTATUS_E_CONCURRENCYVIOLATION   = 0x00000007,
    DBROWSTATUS_E_DELETED                = 0x00000008,
    DBROWSTATUS_E_PENDINGINSERT          = 0x00000009,
    DBROWSTATUS_E_NEWLYINSERTED          = 0x0000000a,
    DBROWSTATUS_E_INTEGRITYVIOLATION     = 0x0000000b,
    DBROWSTATUS_E_INVALID                = 0x0000000c,
    DBROWSTATUS_E_MAXPENDCHANGESEXCEEDED = 0x0000000d,
    DBROWSTATUS_E_OBJECTOPEN             = 0x0000000e,
    DBROWSTATUS_E_OUTOFMEMORY            = 0x0000000f,
    DBROWSTATUS_E_PERMISSIONDENIED       = 0x00000010,
    DBROWSTATUS_E_LIMITREACHED           = 0x00000011,
    DBROWSTATUS_E_SCHEMAVIOLATION        = 0x00000012,
    DBROWSTATUS_E_FAIL                   = 0x00000013,
}

alias DBROWSTATUSENUM20 = int;
enum : int
{
    DBROWSTATUS_S_NOCHANGE = 0x00000014,
}

alias DBSTATUSENUM26 = int;
enum : int
{
    DBSTATUS_S_ROWSETCOLUMN = 0x0000001d,
}

/+ [CONFLICTED] struct DBFAILUREINFO
{
    align (2):
    ulong hRow;
    ulong iColumn;
    HRESULT failure;
}
+/
alias DBCOLUMNFLAGSENUM = int;
enum : int
{
    DBCOLUMNFLAGS_ISBOOKMARK    = 0x00000001,
    DBCOLUMNFLAGS_MAYDEFER      = 0x00000002,
    DBCOLUMNFLAGS_WRITE         = 0x00000004,
    DBCOLUMNFLAGS_WRITEUNKNOWN  = 0x00000008,
    DBCOLUMNFLAGS_ISFIXEDLENGTH = 0x00000010,
    DBCOLUMNFLAGS_ISNULLABLE    = 0x00000020,
    DBCOLUMNFLAGS_MAYBENULL     = 0x00000040,
    DBCOLUMNFLAGS_ISLONG        = 0x00000080,
    DBCOLUMNFLAGS_ISROWID       = 0x00000100,
    DBCOLUMNFLAGS_ISROWVER      = 0x00000200,
    DBCOLUMNFLAGS_CACHEDEFERRED = 0x00001000,
}

alias DBCOLUMNFLAGSENUM20 = int;
enum : int
{
    DBCOLUMNFLAGS_SCALEISNEGATIVE = 0x00004000,
    DBCOLUMNFLAGS_RESERVED        = 0x00008000,
}

alias DBCOLUMNFLAGSDEPRECATED = int;
enum : int
{
    DBCOLUMNFLAGS_KEYCOLUMN = 0x00008000,
}

alias DBCOLUMNFLAGS15ENUM = int;
enum : int
{
    DBCOLUMNFLAGS_ISCHAPTER = 0x00002000,
}

alias DBCOLUMNFLAGSENUM21 = int;
enum : int
{
    DBCOLUMNFLAGS_ISROWURL        = 0x00010000,
    DBCOLUMNFLAGS_ISDEFAULTSTREAM = 0x00020000,
    DBCOLUMNFLAGS_ISCOLLECTION    = 0x00040000,
}

alias DBCOLUMNFLAGSENUM26 = int;
enum : int
{
    DBCOLUMNFLAGS_ISSTREAM          = 0x00080000,
    DBCOLUMNFLAGS_ISROWSET          = 0x00100000,
    DBCOLUMNFLAGS_ISROW             = 0x00200000,
    DBCOLUMNFLAGS_ROWSPECIFICCOLUMN = 0x00400000,
}

alias DBTABLESTATISTICSTYPE26 = int;
enum : int
{
    DBSTAT_HISTOGRAM          = 0x00000001,
    DBSTAT_COLUMN_CARDINALITY = 0x00000002,
    DBSTAT_TUPLE_CARDINALITY  = 0x00000004,
}

/+ [CONFLICTED] struct DBCOLUMNINFO
{
    align (2):
    PWSTR pwszName;
    ITypeInfo pTypeInfo;
    ulong iOrdinal;
    uint dwFlags;
    ulong ulColumnSize;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
    DBID columnid;
}
+/
alias DBBOOKMARK = int;
enum : int
{
    DBBMK_INVALID = 0x00000000,
    DBBMK_FIRST   = 0x00000001,
    DBBMK_LAST    = 0x00000002,
}

alias DBPROPENUM = int;
enum : int
{
    DBPROP_ABORTPRESERVE                   = 0x00000002,
    DBPROP_ACTIVESESSIONS                  = 0x00000003,
    DBPROP_APPENDONLY                      = 0x000000bb,
    DBPROP_ASYNCTXNABORT                   = 0x000000a8,
    DBPROP_ASYNCTXNCOMMIT                  = 0x00000004,
    DBPROP_AUTH_CACHE_AUTHINFO             = 0x00000005,
    DBPROP_AUTH_ENCRYPT_PASSWORD           = 0x00000006,
    DBPROP_AUTH_INTEGRATED                 = 0x00000007,
    DBPROP_AUTH_MASK_PASSWORD              = 0x00000008,
    DBPROP_AUTH_PASSWORD                   = 0x00000009,
    DBPROP_AUTH_PERSIST_ENCRYPTED          = 0x0000000a,
    DBPROP_AUTH_PERSIST_SENSITIVE_AUTHINFO = 0x0000000b,
    DBPROP_AUTH_USERID                     = 0x0000000c,
    DBPROP_BLOCKINGSTORAGEOBJECTS          = 0x0000000d,
    DBPROP_BOOKMARKS                       = 0x0000000e,
    DBPROP_BOOKMARKSKIPPED                 = 0x0000000f,
    DBPROP_BOOKMARKTYPE                    = 0x00000010,
    DBPROP_BYREFACCESSORS                  = 0x00000078,
    DBPROP_CACHEDEFERRED                   = 0x00000011,
    DBPROP_CANFETCHBACKWARDS               = 0x00000012,
    DBPROP_CANHOLDROWS                     = 0x00000013,
    DBPROP_CANSCROLLBACKWARDS              = 0x00000015,
    DBPROP_CATALOGLOCATION                 = 0x00000016,
    DBPROP_CATALOGTERM                     = 0x00000017,
    DBPROP_CATALOGUSAGE                    = 0x00000018,
    DBPROP_CHANGEINSERTEDROWS              = 0x000000bc,
    DBPROP_COL_AUTOINCREMENT               = 0x0000001a,
    DBPROP_COL_DEFAULT                     = 0x0000001b,
    DBPROP_COL_DESCRIPTION                 = 0x0000001c,
    DBPROP_COL_FIXEDLENGTH                 = 0x000000a7,
    DBPROP_COL_NULLABLE                    = 0x0000001d,
    DBPROP_COL_PRIMARYKEY                  = 0x0000001e,
    DBPROP_COL_UNIQUE                      = 0x0000001f,
    DBPROP_COLUMNDEFINITION                = 0x00000020,
    DBPROP_COLUMNRESTRICT                  = 0x00000021,
    DBPROP_COMMANDTIMEOUT                  = 0x00000022,
    DBPROP_COMMITPRESERVE                  = 0x00000023,
    DBPROP_CONCATNULLBEHAVIOR              = 0x00000024,
    DBPROP_CURRENTCATALOG                  = 0x00000025,
    DBPROP_DATASOURCENAME                  = 0x00000026,
    DBPROP_DATASOURCEREADONLY              = 0x00000027,
    DBPROP_DBMSNAME                        = 0x00000028,
    DBPROP_DBMSVER                         = 0x00000029,
    DBPROP_DEFERRED                        = 0x0000002a,
    DBPROP_DELAYSTORAGEOBJECTS             = 0x0000002b,
    DBPROP_DSOTHREADMODEL                  = 0x000000a9,
    DBPROP_GROUPBY                         = 0x0000002c,
    DBPROP_HETEROGENEOUSTABLES             = 0x0000002d,
    DBPROP_IAccessor                       = 0x00000079,
    DBPROP_IColumnsInfo                    = 0x0000007a,
    DBPROP_IColumnsRowset                  = 0x0000007b,
    DBPROP_IConnectionPointContainer       = 0x0000007c,
    DBPROP_IConvertType                    = 0x000000c2,
    DBPROP_IRowset                         = 0x0000007e,
    DBPROP_IRowsetChange                   = 0x0000007f,
    DBPROP_IRowsetIdentity                 = 0x00000080,
    DBPROP_IRowsetIndex                    = 0x0000009f,
    DBPROP_IRowsetInfo                     = 0x00000081,
    DBPROP_IRowsetLocate                   = 0x00000082,
    DBPROP_IRowsetResynch                  = 0x00000084,
    DBPROP_IRowsetScroll                   = 0x00000085,
    DBPROP_IRowsetUpdate                   = 0x00000086,
    DBPROP_ISupportErrorInfo               = 0x00000087,
    DBPROP_ILockBytes                      = 0x00000088,
    DBPROP_ISequentialStream               = 0x00000089,
    DBPROP_IStorage                        = 0x0000008a,
    DBPROP_IStream                         = 0x0000008b,
    DBPROP_IDENTIFIERCASE                  = 0x0000002e,
    DBPROP_IMMOBILEROWS                    = 0x0000002f,
    DBPROP_INDEX_AUTOUPDATE                = 0x00000030,
    DBPROP_INDEX_CLUSTERED                 = 0x00000031,
    DBPROP_INDEX_FILLFACTOR                = 0x00000032,
    DBPROP_INDEX_INITIALSIZE               = 0x00000033,
    DBPROP_INDEX_NULLCOLLATION             = 0x00000034,
    DBPROP_INDEX_NULLS                     = 0x00000035,
    DBPROP_INDEX_PRIMARYKEY                = 0x00000036,
    DBPROP_INDEX_SORTBOOKMARKS             = 0x00000037,
    DBPROP_INDEX_TEMPINDEX                 = 0x000000a3,
    DBPROP_INDEX_TYPE                      = 0x00000038,
    DBPROP_INDEX_UNIQUE                    = 0x00000039,
    DBPROP_INIT_DATASOURCE                 = 0x0000003b,
    DBPROP_INIT_HWND                       = 0x0000003c,
    DBPROP_INIT_IMPERSONATION_LEVEL        = 0x0000003d,
    DBPROP_INIT_LCID                       = 0x000000ba,
    DBPROP_INIT_LOCATION                   = 0x0000003e,
    DBPROP_INIT_MODE                       = 0x0000003f,
    DBPROP_INIT_PROMPT                     = 0x00000040,
    DBPROP_INIT_PROTECTION_LEVEL           = 0x00000041,
    DBPROP_INIT_PROVIDERSTRING             = 0x000000a0,
    DBPROP_INIT_TIMEOUT                    = 0x00000042,
    DBPROP_LITERALBOOKMARKS                = 0x00000043,
    DBPROP_LITERALIDENTITY                 = 0x00000044,
    DBPROP_MAXINDEXSIZE                    = 0x00000046,
    DBPROP_MAXOPENROWS                     = 0x00000047,
    DBPROP_MAXPENDINGROWS                  = 0x00000048,
    DBPROP_MAXROWS                         = 0x00000049,
    DBPROP_MAXROWSIZE                      = 0x0000004a,
    DBPROP_MAXROWSIZEINCLUDESBLOB          = 0x0000004b,
    DBPROP_MAXTABLESINSELECT               = 0x0000004c,
    DBPROP_MAYWRITECOLUMN                  = 0x0000004d,
    DBPROP_MEMORYUSAGE                     = 0x0000004e,
    DBPROP_MULTIPLEPARAMSETS               = 0x000000bf,
    DBPROP_MULTIPLERESULTS                 = 0x000000c4,
    DBPROP_MULTIPLESTORAGEOBJECTS          = 0x00000050,
    DBPROP_MULTITABLEUPDATE                = 0x00000051,
    DBPROP_NOTIFICATIONGRANULARITY         = 0x000000c6,
    DBPROP_NOTIFICATIONPHASES              = 0x00000052,
    DBPROP_NOTIFYCOLUMNSET                 = 0x000000ab,
    DBPROP_NOTIFYROWDELETE                 = 0x000000ad,
    DBPROP_NOTIFYROWFIRSTCHANGE            = 0x000000ae,
    DBPROP_NOTIFYROWINSERT                 = 0x000000af,
    DBPROP_NOTIFYROWRESYNCH                = 0x000000b1,
    DBPROP_NOTIFYROWSETCHANGED             = 0x000000d3,
    DBPROP_NOTIFYROWSETRELEASE             = 0x000000b2,
    DBPROP_NOTIFYROWSETFETCHPOSITIONCHANGE = 0x000000b3,
    DBPROP_NOTIFYROWUNDOCHANGE             = 0x000000b4,
    DBPROP_NOTIFYROWUNDODELETE             = 0x000000b5,
    DBPROP_NOTIFYROWUNDOINSERT             = 0x000000b6,
    DBPROP_NOTIFYROWUPDATE                 = 0x000000b7,
    DBPROP_NULLCOLLATION                   = 0x00000053,
    DBPROP_OLEOBJECTS                      = 0x00000054,
    DBPROP_ORDERBYCOLUMNSINSELECT          = 0x00000055,
    DBPROP_ORDEREDBOOKMARKS                = 0x00000056,
    DBPROP_OTHERINSERT                     = 0x00000057,
    DBPROP_OTHERUPDATEDELETE               = 0x00000058,
    DBPROP_OUTPUTPARAMETERAVAILABILITY     = 0x000000b8,
    DBPROP_OWNINSERT                       = 0x00000059,
    DBPROP_OWNUPDATEDELETE                 = 0x0000005a,
    DBPROP_PERSISTENTIDTYPE                = 0x000000b9,
    DBPROP_PREPAREABORTBEHAVIOR            = 0x0000005b,
    DBPROP_PREPARECOMMITBEHAVIOR           = 0x0000005c,
    DBPROP_PROCEDURETERM                   = 0x0000005d,
    DBPROP_PROVIDERNAME                    = 0x00000060,
    DBPROP_PROVIDEROLEDBVER                = 0x00000061,
    DBPROP_PROVIDERVER                     = 0x00000062,
    DBPROP_QUICKRESTART                    = 0x00000063,
    DBPROP_QUOTEDIDENTIFIERCASE            = 0x00000064,
    DBPROP_REENTRANTEVENTS                 = 0x00000065,
    DBPROP_REMOVEDELETED                   = 0x00000066,
    DBPROP_REPORTMULTIPLECHANGES           = 0x00000067,
    DBPROP_RETURNPENDINGINSERTS            = 0x000000bd,
    DBPROP_ROWRESTRICT                     = 0x00000068,
    DBPROP_ROWSETCONVERSIONSONCOMMAND      = 0x000000c0,
    DBPROP_ROWTHREADMODEL                  = 0x00000069,
    DBPROP_SCHEMATERM                      = 0x0000006a,
    DBPROP_SCHEMAUSAGE                     = 0x0000006b,
    DBPROP_SERVERCURSOR                    = 0x0000006c,
    DBPROP_SESS_AUTOCOMMITISOLEVELS        = 0x000000be,
    DBPROP_SQLSUPPORT                      = 0x0000006d,
    DBPROP_STRONGIDENTITY                  = 0x00000077,
    DBPROP_STRUCTUREDSTORAGE               = 0x0000006f,
    DBPROP_SUBQUERIES                      = 0x00000070,
    DBPROP_SUPPORTEDTXNDDL                 = 0x000000a1,
    DBPROP_SUPPORTEDTXNISOLEVELS           = 0x00000071,
    DBPROP_SUPPORTEDTXNISORETAIN           = 0x00000072,
    DBPROP_TABLETERM                       = 0x00000073,
    DBPROP_TBL_TEMPTABLE                   = 0x0000008c,
    DBPROP_TRANSACTEDOBJECT                = 0x00000074,
    DBPROP_UPDATABILITY                    = 0x00000075,
    DBPROP_USERNAME                        = 0x00000076,
}

alias DBPROPENUM15 = int;
enum : int
{
    DBPROP_FILTERCOMPAREOPS = 0x000000d1,
    DBPROP_FINDCOMPAREOPS   = 0x000000d2,
    DBPROP_IChapteredRowset = 0x000000ca,
    DBPROP_IDBAsynchStatus  = 0x000000cb,
    DBPROP_IRowsetFind      = 0x000000cc,
    DBPROP_IRowsetView      = 0x000000d4,
    DBPROP_IViewChapter     = 0x000000d5,
    DBPROP_IViewFilter      = 0x000000d6,
    DBPROP_IViewRowset      = 0x000000d7,
    DBPROP_IViewSort        = 0x000000d8,
    DBPROP_INIT_ASYNCH      = 0x000000c8,
    DBPROP_MAXOPENCHAPTERS  = 0x000000c7,
    DBPROP_MAXORSINFILTER   = 0x000000cd,
    DBPROP_MAXSORTCOLUMNS   = 0x000000ce,
    DBPROP_ROWSET_ASYNCH    = 0x000000c9,
    DBPROP_SORTONINDEX      = 0x000000cf,
}

alias DBPROPENUM20 = int;
enum : int
{
    DBPROP_IMultipleResults           = 0x000000d9,
    DBPROP_DATASOURCE_TYPE            = 0x000000fb,
    MDPROP_AXES                       = 0x000000fc,
    MDPROP_FLATTENING_SUPPORT         = 0x000000fd,
    MDPROP_MDX_JOINCUBES              = 0x000000fe,
    MDPROP_NAMED_LEVELS               = 0x000000ff,
    MDPROP_RANGEROWSET                = 0x00000100,
    MDPROP_MDX_SLICER                 = 0x000000da,
    MDPROP_MDX_CUBEQUALIFICATION      = 0x000000db,
    MDPROP_MDX_OUTERREFERENCE         = 0x000000dc,
    MDPROP_MDX_QUERYBYPROPERTY        = 0x000000dd,
    MDPROP_MDX_CASESUPPORT            = 0x000000de,
    MDPROP_MDX_STRING_COMPOP          = 0x000000e0,
    MDPROP_MDX_DESCFLAGS              = 0x000000e1,
    MDPROP_MDX_SET_FUNCTIONS          = 0x000000e2,
    MDPROP_MDX_MEMBER_FUNCTIONS       = 0x000000e3,
    MDPROP_MDX_NUMERIC_FUNCTIONS      = 0x000000e4,
    MDPROP_MDX_FORMULAS               = 0x000000e5,
    MDPROP_AGGREGATECELL_UPDATE       = 0x000000e6,
    MDPROP_MDX_AGGREGATECELL_UPDATE   = 0x000000e6,
    MDPROP_MDX_OBJQUALIFICATION       = 0x00000105,
    MDPROP_MDX_NONMEASURE_EXPRESSIONS = 0x00000106,
    DBPROP_ACCESSORDER                = 0x000000e7,
    DBPROP_BOOKMARKINFO               = 0x000000e8,
    DBPROP_INIT_CATALOG               = 0x000000e9,
    DBPROP_ROW_BULKOPS                = 0x000000ea,
    DBPROP_PROVIDERFRIENDLYNAME       = 0x000000eb,
    DBPROP_LOCKMODE                   = 0x000000ec,
    DBPROP_MULTIPLECONNECTIONS        = 0x000000ed,
    DBPROP_UNIQUEROWS                 = 0x000000ee,
    DBPROP_SERVERDATAONINSERT         = 0x000000ef,
    DBPROP_STORAGEFLAGS               = 0x000000f0,
    DBPROP_CONNECTIONSTATUS           = 0x000000f4,
    DBPROP_ALTERCOLUMN                = 0x000000f5,
    DBPROP_COLUMNLCID                 = 0x000000f6,
    DBPROP_RESETDATASOURCE            = 0x000000f7,
    DBPROP_INIT_OLEDBSERVICES         = 0x000000f8,
    DBPROP_IRowsetRefresh             = 0x000000f9,
    DBPROP_SERVERNAME                 = 0x000000fa,
    DBPROP_IParentRowset              = 0x00000101,
    DBPROP_HIDDENCOLUMNS              = 0x00000102,
    DBPROP_PROVIDERMEMORY             = 0x00000103,
    DBPROP_CLIENTCURSOR               = 0x00000104,
}

alias DBPROPENUM21 = int;
enum : int
{
    DBPROP_TRUSTEE_USERNAME          = 0x000000f1,
    DBPROP_TRUSTEE_AUTHENTICATION    = 0x000000f2,
    DBPROP_TRUSTEE_NEWAUTHENTICATION = 0x000000f3,
    DBPROP_IRow                      = 0x00000107,
    DBPROP_IRowChange                = 0x00000108,
    DBPROP_IRowSchemaChange          = 0x00000109,
    DBPROP_IGetRow                   = 0x0000010a,
    DBPROP_IScopedOperations         = 0x0000010b,
    DBPROP_IBindResource             = 0x0000010c,
    DBPROP_ICreateRow                = 0x0000010d,
    DBPROP_INIT_BINDFLAGS            = 0x0000010e,
    DBPROP_INIT_LOCKOWNER            = 0x0000010f,
    DBPROP_GENERATEURL               = 0x00000111,
    DBPROP_IDBBinderProperties       = 0x00000112,
    DBPROP_IColumnsInfo2             = 0x00000113,
    DBPROP_IRegisterProvider         = 0x00000114,
    DBPROP_IGetSession               = 0x00000115,
    DBPROP_IGetSourceRow             = 0x00000116,
    DBPROP_IRowsetCurrentIndex       = 0x00000117,
    DBPROP_OPENROWSETSUPPORT         = 0x00000118,
    DBPROP_COL_ISLONG                = 0x00000119,
}

alias DBPROPENUM25 = int;
enum : int
{
    DBPROP_COL_SEED            = 0x0000011a,
    DBPROP_COL_INCREMENT       = 0x0000011b,
    DBPROP_INIT_GENERALTIMEOUT = 0x0000011c,
    DBPROP_COMSERVICES         = 0x0000011d,
}

alias DBPROPENUM26 = int;
enum : int
{
    DBPROP_OUTPUTSTREAM        = 0x0000011e,
    DBPROP_OUTPUTENCODING      = 0x0000011f,
    DBPROP_TABLESTATISTICS     = 0x00000120,
    DBPROP_SKIPROWCOUNTRESULTS = 0x00000123,
    DBPROP_IRowsetBookmark     = 0x00000124,
    MDPROP_VISUALMODE          = 0x00000125,
}

alias DBPROPENUMDEPRECATED = int;
enum : int
{
    DBPROP_IRowsetExactScroll = 0x0000009a,
    DBPROP_MARSHALLABLE       = 0x000000c5,
    DBPROP_FILTEROPS          = 0x000000d0,
}

/+ [CONFLICTED] struct DBPARAMS
{
    align (2):
    void* pData;
    ulong cParamSets;
    HACCESSOR hAccessor;
}
+/
alias DBPARAMFLAGSENUM = int;
enum : int
{
    DBPARAMFLAGS_ISINPUT    = 0x00000001,
    DBPARAMFLAGS_ISOUTPUT   = 0x00000002,
    DBPARAMFLAGS_ISSIGNED   = 0x00000010,
    DBPARAMFLAGS_ISNULLABLE = 0x00000040,
    DBPARAMFLAGS_ISLONG     = 0x00000080,
}

alias DBPARAMFLAGSENUM20 = int;
enum : int
{
    DBPARAMFLAGS_SCALEISNEGATIVE = 0x00000100,
}

/+ [CONFLICTED] struct DBPARAMINFO
{
    align (2):
    uint dwFlags;
    ulong iOrdinal;
    PWSTR pwszName;
    ITypeInfo pTypeInfo;
    ulong ulParamSize;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
+/
/+ [CONFLICTED] struct DBPROPIDSET
{
    align (2):
    uint* rgPropertyIDs;
    uint cPropertyIDs;
    GUID guidPropertySet;
}
+/
alias DBPROPFLAGSENUM = int;
enum : int
{
    DBPROPFLAGS_NOTSUPPORTED     = 0x00000000,
    DBPROPFLAGS_COLUMN           = 0x00000001,
    DBPROPFLAGS_DATASOURCE       = 0x00000002,
    DBPROPFLAGS_DATASOURCECREATE = 0x00000004,
    DBPROPFLAGS_DATASOURCEINFO   = 0x00000008,
    DBPROPFLAGS_DBINIT           = 0x00000010,
    DBPROPFLAGS_INDEX            = 0x00000020,
    DBPROPFLAGS_ROWSET           = 0x00000040,
    DBPROPFLAGS_TABLE            = 0x00000080,
    DBPROPFLAGS_COLUMNOK         = 0x00000100,
    DBPROPFLAGS_READ             = 0x00000200,
    DBPROPFLAGS_WRITE            = 0x00000400,
    DBPROPFLAGS_REQUIRED         = 0x00000800,
    DBPROPFLAGS_SESSION          = 0x00001000,
}

alias DBPROPFLAGSENUM21 = int;
enum : int
{
    DBPROPFLAGS_TRUSTEE = 0x00002000,
}

alias DBPROPFLAGSENUM25 = int;
enum : int
{
    DBPROPFLAGS_VIEW = 0x00004000,
}

alias DBPROPFLAGSENUM26 = int;
enum : int
{
    DBPROPFLAGS_STREAM = 0x00008000,
}

/+ [CONFLICTED] struct DBPROPINFO
{
    align (2):
    PWSTR pwszDescription;
    uint dwPropertyID;
    uint dwFlags;
    VARENUM vtType;
    VARIANT vValues;
}
+/
/+ [CONFLICTED] struct DBPROPINFOSET
{
    align (2):
    DBPROPINFO* rgPropertyInfos;
    uint cPropertyInfos;
    GUID guidPropertySet;
}
+/
alias DBPROPOPTIONSENUM = int;
enum : int
{
    DBPROPOPTIONS_REQUIRED   = 0x00000000,
    DBPROPOPTIONS_SETIFCHEAP = 0x00000001,
    DBPROPOPTIONS_OPTIONAL   = 0x00000001,
}

alias DBPROPSTATUSENUM = int;
enum : int
{
    DBPROPSTATUS_OK             = 0x00000000,
    DBPROPSTATUS_NOTSUPPORTED   = 0x00000001,
    DBPROPSTATUS_BADVALUE       = 0x00000002,
    DBPROPSTATUS_BADOPTION      = 0x00000003,
    DBPROPSTATUS_BADCOLUMN      = 0x00000004,
    DBPROPSTATUS_NOTALLSETTABLE = 0x00000005,
    DBPROPSTATUS_NOTSETTABLE    = 0x00000006,
    DBPROPSTATUS_NOTSET         = 0x00000007,
    DBPROPSTATUS_CONFLICTING    = 0x00000008,
}

alias DBPROPSTATUSENUM21 = int;
enum : int
{
    DBPROPSTATUS_NOTAVAILABLE = 0x00000009,
}

/+ [CONFLICTED] struct DBPROP
{
    align (2):
    uint dwPropertyID;
    uint dwOptions;
    uint dwStatus;
    DBID colid;
    VARIANT vValue;
}
+/
/+ [CONFLICTED] struct DBPROPSET
{
    align (2):
    DBPROP* rgProperties;
    uint cProperties;
    GUID guidPropertySet;
}
+/
alias DBINDEX_COL_ORDERENUM = int;
enum : int
{
    DBINDEX_COL_ORDER_ASC  = 0x00000000,
    DBINDEX_COL_ORDER_DESC = 0x00000001,
}

/+ [CONFLICTED] struct DBINDEXCOLUMNDESC
{
    align (2):
    DBID* pColumnID;
    uint eIndexColOrder;
}
+/
/+ [CONFLICTED] struct DBCOLUMNDESC
{
    align (2):
    PWSTR pwszTypeName;
    ITypeInfo pTypeInfo;
    DBPROPSET* rgPropertySets;
    GUID* pclsid;
    uint cPropertySets;
    ulong ulColumnSize;
    DBID dbcid;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
+/
/+ [CONFLICTED] struct DBCOLUMNACCESS
{
    align (2):
    void* pData;
    DBID columnid;
    ulong cbDataLen;
    uint dwStatus;
    ulong cbMaxLen;
    ulong dwReserved;
    ushort wType;
    ubyte bPrecision;
    ubyte bScale;
}
+/
alias DBCOLUMNDESCFLAGSENUM = int;
enum : int
{
    DBCOLUMNDESCFLAGS_TYPENAME   = 0x00000001,
    DBCOLUMNDESCFLAGS_ITYPEINFO  = 0x00000002,
    DBCOLUMNDESCFLAGS_PROPERTIES = 0x00000004,
    DBCOLUMNDESCFLAGS_CLSID      = 0x00000008,
    DBCOLUMNDESCFLAGS_COLSIZE    = 0x00000010,
    DBCOLUMNDESCFLAGS_DBCID      = 0x00000020,
    DBCOLUMNDESCFLAGS_WTYPE      = 0x00000040,
    DBCOLUMNDESCFLAGS_PRECISION  = 0x00000080,
    DBCOLUMNDESCFLAGS_SCALE      = 0x00000100,
}

alias DBEVENTPHASEENUM = int;
enum : int
{
    DBEVENTPHASE_OKTODO     = 0x00000000,
    DBEVENTPHASE_ABOUTTODO  = 0x00000001,
    DBEVENTPHASE_SYNCHAFTER = 0x00000002,
    DBEVENTPHASE_FAILEDTODO = 0x00000003,
    DBEVENTPHASE_DIDEVENT   = 0x00000004,
}

alias DBREASONENUM = int;
enum : int
{
    DBREASON_ROWSET_FETCHPOSITIONCHANGE = 0x00000000,
    DBREASON_ROWSET_RELEASE             = 0x00000001,
    DBREASON_COLUMN_SET                 = 0x00000002,
    DBREASON_COLUMN_RECALCULATED        = 0x00000003,
    DBREASON_ROW_ACTIVATE               = 0x00000004,
    DBREASON_ROW_RELEASE                = 0x00000005,
    DBREASON_ROW_DELETE                 = 0x00000006,
    DBREASON_ROW_FIRSTCHANGE            = 0x00000007,
    DBREASON_ROW_INSERT                 = 0x00000008,
    DBREASON_ROW_RESYNCH                = 0x00000009,
    DBREASON_ROW_UNDOCHANGE             = 0x0000000a,
    DBREASON_ROW_UNDOINSERT             = 0x0000000b,
    DBREASON_ROW_UNDODELETE             = 0x0000000c,
    DBREASON_ROW_UPDATE                 = 0x0000000d,
    DBREASON_ROWSET_CHANGED             = 0x0000000e,
}

alias DBREASONENUM15 = int;
enum : int
{
    DBREASON_ROWPOSITION_CHANGED        = 0x0000000f,
    DBREASON_ROWPOSITION_CHAPTERCHANGED = 0x00000010,
    DBREASON_ROWPOSITION_CLEARED        = 0x00000011,
    DBREASON_ROW_ASYNCHINSERT           = 0x00000012,
}

alias DBCOMPAREOPSENUM = int;
enum : int
{
    DBCOMPAREOPS_LT              = 0x00000000,
    DBCOMPAREOPS_LE              = 0x00000001,
    DBCOMPAREOPS_EQ              = 0x00000002,
    DBCOMPAREOPS_GE              = 0x00000003,
    DBCOMPAREOPS_GT              = 0x00000004,
    DBCOMPAREOPS_BEGINSWITH      = 0x00000005,
    DBCOMPAREOPS_CONTAINS        = 0x00000006,
    DBCOMPAREOPS_NE              = 0x00000007,
    DBCOMPAREOPS_IGNORE          = 0x00000008,
    DBCOMPAREOPS_CASESENSITIVE   = 0x00001000,
    DBCOMPAREOPS_CASEINSENSITIVE = 0x00002000,
}

alias DBCOMPAREOPSENUM20 = int;
enum : int
{
    DBCOMPAREOPS_NOTBEGINSWITH = 0x00000009,
    DBCOMPAREOPS_NOTCONTAINS   = 0x0000000a,
}

alias DBASYNCHOPENUM = int;
enum : int
{
    DBASYNCHOP_OPEN = 0x00000000,
}

alias DBASYNCHPHASEENUM = int;
enum : int
{
    DBASYNCHPHASE_INITIALIZATION = 0x00000000,
    DBASYNCHPHASE_POPULATION     = 0x00000001,
    DBASYNCHPHASE_COMPLETE       = 0x00000002,
    DBASYNCHPHASE_CANCELED       = 0x00000003,
}

alias DBSORTENUM = int;
enum : int
{
    DBSORT_ASCENDING  = 0x00000000,
    DBSORT_DESCENDING = 0x00000001,
}

alias DBCOMMANDPERSISTFLAGENUM = int;
enum : int
{
    DBCOMMANDPERSISTFLAG_NOSAVE = 0x00000001,
}

alias DBCOMMANDPERSISTFLAGENUM21 = int;
enum : int
{
    DBCOMMANDPERSISTFLAG_DEFAULT          = 0x00000000,
    DBCOMMANDPERSISTFLAG_PERSISTVIEW      = 0x00000002,
    DBCOMMANDPERSISTFLAG_PERSISTPROCEDURE = 0x00000004,
}

alias DBCONSTRAINTTYPEENUM = int;
enum : int
{
    DBCONSTRAINTTYPE_UNIQUE     = 0x00000000,
    DBCONSTRAINTTYPE_FOREIGNKEY = 0x00000001,
    DBCONSTRAINTTYPE_PRIMARYKEY = 0x00000002,
    DBCONSTRAINTTYPE_CHECK      = 0x00000003,
}

alias DBUPDELRULEENUM = int;
enum : int
{
    DBUPDELRULE_NOACTION   = 0x00000000,
    DBUPDELRULE_CASCADE    = 0x00000001,
    DBUPDELRULE_SETNULL    = 0x00000002,
    DBUPDELRULE_SETDEFAULT = 0x00000003,
}

alias DBMATCHTYPEENUM = int;
enum : int
{
    DBMATCHTYPE_FULL    = 0x00000000,
    DBMATCHTYPE_NONE    = 0x00000001,
    DBMATCHTYPE_PARTIAL = 0x00000002,
}

alias DBDEFERRABILITYENUM = int;
enum : int
{
    DBDEFERRABILITY_DEFERRED   = 0x00000001,
    DBDEFERRABILITY_DEFERRABLE = 0x00000002,
}

/+ [CONFLICTED] struct DBCONSTRAINTDESC
{
    align (2):
    DBID* pConstraintID;
    uint ConstraintType;
    ulong cColumns;
    DBID* rgColumnList;
    DBID* pReferencedTableID;
    ulong cForeignKeyColumns;
    DBID* rgForeignKeyColumnList;
    PWSTR pwszConstraintText;
    uint UpdateRule;
    uint DeleteRule;
    uint MatchType;
    uint Deferrability;
    ulong cReserved;
    DBPROPSET* rgReserved;
}
+/
/+ [CONFLICTED] struct MDAXISINFO
{
    align (2):
    ulong cbSize;
    ulong iAxis;
    ulong cDimensions;
    ulong cCoordinates;
    ulong* rgcColumns;
    PWSTR* rgpwszDimensionNames;
}
+/
/+ [CONFLICTED] struct RMTPACK
{
    align (2):
    ISequentialStream pISeqStream;
    uint cbData;
    uint cBSTR;
    BSTR* rgBSTR;
    uint cVARIANT;
    VARIANT* rgVARIANT;
    uint cIDISPATCH;
    IDispatch* rgIDISPATCH;
    uint cIUNKNOWN;
    IUnknown* rgIUNKNOWN;
    uint cPROPVARIANT;
    PROPVARIANT* rgPROPVARIANT;
    uint cArray;
    VARIANT* rgArray;
}
+/
alias DBACCESSORFLAGSENUM = int;
enum : int
{
    DBACCESSOR_INVALID       = 0x00000000,
    DBACCESSOR_PASSBYREF     = 0x00000001,
    DBACCESSOR_ROWDATA       = 0x00000002,
    DBACCESSOR_PARAMETERDATA = 0x00000004,
    DBACCESSOR_OPTIMIZED     = 0x00000008,
    DBACCESSOR_INHERITED     = 0x00000010,
}

alias DBBINDSTATUSENUM = int;
enum : int
{
    DBBINDSTATUS_OK                    = 0x00000000,
    DBBINDSTATUS_BADORDINAL            = 0x00000001,
    DBBINDSTATUS_UNSUPPORTEDCONVERSION = 0x00000002,
    DBBINDSTATUS_BADBINDINFO           = 0x00000003,
    DBBINDSTATUS_BADSTORAGEFLAGS       = 0x00000004,
    DBBINDSTATUS_NOINTERFACE           = 0x00000005,
    DBBINDSTATUS_MULTIPLESTORAGE       = 0x00000006,
}

enum IID_IAccessor = GUID(0xc733a8c, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IAccessor : IUnknown
{
    HRESULT AddRefAccessor(HACCESSOR, uint*);
    HRESULT CreateAccessor(uint, ulong, const(DBBINDING)*, ulong, HACCESSOR*, uint*);
    HRESULT GetBindings(HACCESSOR, uint*, ulong*, DBBINDING**);
    HRESULT ReleaseAccessor(HACCESSOR, uint*);
}
enum IID_IRowset = GUID(0xc733a7c, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowset : IUnknown
{
    HRESULT AddRefRows(ulong, const(ulong)*, uint*, uint*);
    HRESULT GetData(ulong, HACCESSOR, void*);
    HRESULT GetNextRows(ulong, long, long, ulong*, ulong**);
    HRESULT ReleaseRows(ulong, const(ulong)*, uint*, uint*, uint*);
    HRESULT RestartPosition(ulong);
}
enum IID_IRowsetInfo = GUID(0xc733a55, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetInfo : IUnknown
{
    HRESULT GetProperties(const(uint), const(DBPROPIDSET)*, uint*, DBPROPSET**);
    HRESULT GetReferencedRowset(ulong, const(GUID)*, IUnknown*);
    HRESULT GetSpecification(const(GUID)*, IUnknown*);
}
alias DBCOMPAREENUM = int;
enum : int
{
    DBCOMPARE_LT            = 0x00000000,
    DBCOMPARE_EQ            = 0x00000001,
    DBCOMPARE_GT            = 0x00000002,
    DBCOMPARE_NE            = 0x00000003,
    DBCOMPARE_NOTCOMPARABLE = 0x00000004,
}

enum IID_IRowsetLocate = GUID(0xc733a7d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetLocate : IRowset
{
    HRESULT Compare(ulong, ulong, const(ubyte)*, ulong, const(ubyte)*, uint*);
    HRESULT GetRowsAt(ulong, ulong, ulong, const(ubyte)*, long, long, ulong*, ulong**);
    HRESULT GetRowsByBookmark(ulong, ulong, const(ulong)*, const(ubyte)**, ulong*, uint*);
    HRESULT Hash(ulong, ulong, const(ulong)*, const(ubyte)**, ulong*, uint*);
}
enum IID_IRowsetResynch = GUID(0xc733a84, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetResynch : IUnknown
{
    HRESULT GetVisibleData(ulong, HACCESSOR, void*);
    HRESULT ResynchRows(ulong, const(ulong)*, ulong*, ulong**, uint**);
}
enum IID_IRowsetScroll = GUID(0xc733a7e, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetScroll : IRowsetLocate
{
    HRESULT GetApproximatePosition(ulong, ulong, const(ubyte)*, ulong*, ulong*);
    HRESULT GetRowsAtRatio(ulong, ulong, ulong, ulong, long, ulong*, ulong**);
}
enum IID_IChapteredRowset = GUID(0xc733a93, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IChapteredRowset : IUnknown
{
    HRESULT AddRefChapter(ulong, uint*);
    HRESULT ReleaseChapter(ulong, uint*);
}
enum IID_IRowsetFind = GUID(0xc733a9d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetFind : IUnknown
{
    HRESULT FindNextRow(ulong, HACCESSOR, void*, uint, ulong, const(ubyte)*, long, long, ulong*, ulong**);
}
alias DBPOSITIONFLAGSENUM = int;
enum : int
{
    DBPOSITION_OK    = 0x00000000,
    DBPOSITION_NOROW = 0x00000001,
    DBPOSITION_BOF   = 0x00000002,
    DBPOSITION_EOF   = 0x00000003,
}

enum IID_IRowPosition = GUID(0xc733a94, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowPosition : IUnknown
{
    HRESULT ClearRowPosition();
    HRESULT GetRowPosition(ulong*, ulong*, uint*);
    HRESULT GetRowset(const(GUID)*, IUnknown*);
    HRESULT Initialize(IUnknown);
    HRESULT SetRowPosition(ulong, ulong, uint);
}
enum IID_IRowPositionChange = GUID(0x997a571, 0x126e, 0x11d0, [0x9f, 0x8a, 0x0, 0xa0, 0xc9, 0xa0, 0x63, 0x1e]);
interface IRowPositionChange : IUnknown
{
    HRESULT OnRowPositionChange(uint, uint, BOOL);
}
enum IID_IViewRowset = GUID(0xc733a97, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IViewRowset : IUnknown
{
    HRESULT GetSpecification(const(GUID)*, IUnknown*);
    HRESULT OpenViewRowset(IUnknown, const(GUID)*, IUnknown*);
}
enum IID_IViewChapter = GUID(0xc733a98, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IViewChapter : IUnknown
{
    HRESULT GetSpecification(const(GUID)*, IUnknown*);
    HRESULT OpenViewChapter(ulong, ulong*);
}
enum IID_IViewSort = GUID(0xc733a9a, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IViewSort : IUnknown
{
    HRESULT GetSortOrder(ulong*, ulong**, uint**);
    HRESULT SetSortOrder(ulong, const(ulong)*, const(uint)*);
}
enum IID_IViewFilter = GUID(0xc733a9b, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IViewFilter : IUnknown
{
    HRESULT GetFilter(HACCESSOR, ulong*, uint**, void*);
    HRESULT GetFilterBindings(ulong*, DBBINDING**);
    HRESULT SetFilter(HACCESSOR, ulong, uint*, void*);
}
enum IID_IRowsetView = GUID(0xc733a99, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetView : IUnknown
{
    HRESULT CreateView(IUnknown, const(GUID)*, IUnknown*);
    HRESULT GetView(ulong, const(GUID)*, ulong*, IUnknown*);
}
enum IID_IRowsetExactScroll = GUID(0xc733a7f, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetExactScroll : IRowsetScroll
{
    HRESULT GetExactPosition(ulong, ulong, const(ubyte)*, ulong*, ulong*);
}
enum IID_IRowsetChange = GUID(0xc733a05, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetChange : IUnknown
{
    HRESULT DeleteRows(ulong, ulong, const(ulong)*, uint*);
    HRESULT SetData(ulong, HACCESSOR, void*);
    HRESULT InsertRow(ulong, HACCESSOR, void*, ulong*);
}
alias DBPENDINGSTATUSENUM = int;
enum : int
{
    DBPENDINGSTATUS_NEW        = 0x00000001,
    DBPENDINGSTATUS_CHANGED    = 0x00000002,
    DBPENDINGSTATUS_DELETED    = 0x00000004,
    DBPENDINGSTATUS_UNCHANGED  = 0x00000008,
    DBPENDINGSTATUS_INVALIDROW = 0x00000010,
}

enum IID_IRowsetUpdate = GUID(0xc733a6d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetUpdate : IRowsetChange
{
    HRESULT GetOriginalData(ulong, HACCESSOR, void*);
    HRESULT GetPendingRows(ulong, uint, ulong*, ulong**, uint**);
    HRESULT GetRowStatus(ulong, ulong, const(ulong)*, uint*);
    HRESULT Undo(ulong, ulong, const(ulong)*, ulong*, ulong**, uint**);
    HRESULT Update(ulong, ulong, const(ulong)*, ulong*, ulong**, uint**);
}
enum IID_IRowsetIdentity = GUID(0xc733a09, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetIdentity : IUnknown
{
    HRESULT IsSameRow(ulong, ulong);
}
enum IID_IRowsetNotify = GUID(0xc733a83, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetNotify : IUnknown
{
    HRESULT OnFieldChange(IRowset, ulong, ulong, ulong*, uint, uint, BOOL);
    HRESULT OnRowChange(IRowset, ulong, const(ulong)*, uint, uint, BOOL);
    HRESULT OnRowsetChange(IRowset, uint, uint, BOOL);
}
alias DBSEEKENUM = int;
enum : int
{
    DBSEEK_INVALID  = 0x00000000,
    DBSEEK_FIRSTEQ  = 0x00000001,
    DBSEEK_LASTEQ   = 0x00000002,
    DBSEEK_AFTEREQ  = 0x00000004,
    DBSEEK_AFTER    = 0x00000008,
    DBSEEK_BEFOREEQ = 0x00000010,
    DBSEEK_BEFORE   = 0x00000020,
}

alias DBRANGEENUM = int;
enum : int
{
    DBRANGE_INCLUSIVESTART = 0x00000000,
    DBRANGE_INCLUSIVEEND   = 0x00000000,
    DBRANGE_EXCLUSIVESTART = 0x00000001,
    DBRANGE_EXCLUSIVEEND   = 0x00000002,
    DBRANGE_EXCLUDENULLS   = 0x00000004,
    DBRANGE_PREFIX         = 0x00000008,
    DBRANGE_MATCH          = 0x00000010,
}

alias DBRANGEENUM20 = int;
enum : int
{
    DBRANGE_MATCH_N_SHIFT = 0x00000018,
    DBRANGE_MATCH_N_MASK  = 0x000000ff,
}

enum IID_IRowsetIndex = GUID(0xc733a82, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetIndex : IUnknown
{
    HRESULT GetIndexInfo(ulong*, DBINDEXCOLUMNDESC**, uint*, DBPROPSET**);
    HRESULT Seek(HACCESSOR, ulong, void*, uint);
    HRESULT SetRange(HACCESSOR, ulong, void*, ulong, void*, uint);
}
enum IID_ICommand = GUID(0xc733a63, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommand : IUnknown
{
    HRESULT Cancel();
    HRESULT Execute(IUnknown, const(GUID)*, DBPARAMS*, long*, IUnknown*);
    HRESULT GetDBSession(const(GUID)*, IUnknown*);
}
alias DBRESULTFLAGENUM = int;
enum : int
{
    DBRESULTFLAG_DEFAULT = 0x00000000,
    DBRESULTFLAG_ROWSET  = 0x00000001,
    DBRESULTFLAG_ROW     = 0x00000002,
}

enum IID_IMultipleResults = GUID(0xc733a90, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IMultipleResults : IUnknown
{
    HRESULT GetResult(IUnknown, long, const(GUID)*, long*, IUnknown*);
}
alias DBCONVERTFLAGSENUM = int;
enum : int
{
    DBCONVERTFLAGS_COLUMN    = 0x00000000,
    DBCONVERTFLAGS_PARAMETER = 0x00000001,
}

alias DBCONVERTFLAGSENUM20 = int;
enum : int
{
    DBCONVERTFLAGS_ISLONG        = 0x00000002,
    DBCONVERTFLAGS_ISFIXEDLENGTH = 0x00000004,
    DBCONVERTFLAGS_FROMVARIANT   = 0x00000008,
}

enum IID_IConvertType = GUID(0xc733a88, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IConvertType : IUnknown
{
    HRESULT CanConvert(ushort, ushort, uint);
}
enum IID_ICommandPrepare = GUID(0xc733a26, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandPrepare : IUnknown
{
    HRESULT Prepare(uint);
    HRESULT Unprepare();
}
enum IID_ICommandProperties = GUID(0xc733a79, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandProperties : IUnknown
{
    HRESULT GetProperties(const(uint), const(DBPROPIDSET)*, uint*, DBPROPSET**);
    HRESULT SetProperties(uint, DBPROPSET*);
}
enum IID_ICommandText = GUID(0xc733a27, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandText : ICommand
{
    HRESULT GetCommandText(GUID*, PWSTR*);
    HRESULT SetCommandText(const(GUID)*, const(wchar)*);
}
/+ [CONFLICTED] struct DBPARAMBINDINFO
{
    align (2):
    PWSTR pwszDataSourceType;
    PWSTR pwszName;
    ulong ulParamSize;
    uint dwFlags;
    ubyte bPrecision;
    ubyte bScale;
}
+/
enum IID_ICommandWithParameters = GUID(0xc733a64, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandWithParameters : IUnknown
{
    HRESULT GetParameterInfo(ulong*, DBPARAMINFO**, ushort**);
    HRESULT MapParameterNames(ulong, const(wchar)**, long*);
    HRESULT SetParameterInfo(ulong, const(ulong)*, const(DBPARAMBINDINFO)*);
}
enum IID_IColumnsRowset = GUID(0xc733a10, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IColumnsRowset : IUnknown
{
    HRESULT GetAvailableColumns(ulong*, DBID**);
    HRESULT GetColumnsRowset(IUnknown, ulong, const(DBID)*, const(GUID)*, uint, DBPROPSET*, IUnknown*);
}
enum IID_IColumnsInfo = GUID(0xc733a11, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IColumnsInfo : IUnknown
{
    HRESULT GetColumnInfo(ulong*, DBCOLUMNINFO**, ushort**);
    HRESULT MapColumnIDs(ulong, const(DBID)*, ulong*);
}
enum IID_IDBCreateCommand = GUID(0xc733a1d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBCreateCommand : IUnknown
{
    HRESULT CreateCommand(IUnknown, const(GUID)*, IUnknown*);
}
enum IID_IDBCreateSession = GUID(0xc733a5d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBCreateSession : IUnknown
{
    HRESULT CreateSession(IUnknown, const(GUID)*, IUnknown*);
}
alias DBSOURCETYPEENUM = int;
enum : int
{
    DBSOURCETYPE_DATASOURCE = 0x00000001,
    DBSOURCETYPE_ENUMERATOR = 0x00000002,
}

alias DBSOURCETYPEENUM20 = int;
enum : int
{
    DBSOURCETYPE_DATASOURCE_TDP = 0x00000001,
    DBSOURCETYPE_DATASOURCE_MDP = 0x00000003,
}

alias DBSOURCETYPEENUM25 = int;
enum : int
{
    DBSOURCETYPE_BINDER = 0x00000004,
}

enum IID_ISourcesRowset = GUID(0xc733a1e, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ISourcesRowset : IUnknown
{
    HRESULT GetSourcesRowset(IUnknown, const(GUID)*, uint, DBPROPSET*, IUnknown*);
}
enum IID_IDBProperties = GUID(0xc733a8a, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBProperties : IUnknown
{
    HRESULT GetProperties(uint, const(DBPROPIDSET)*, uint*, DBPROPSET**);
    HRESULT GetPropertyInfo(uint, const(DBPROPIDSET)*, uint*, DBPROPINFOSET**, ushort**);
    HRESULT SetProperties(uint, DBPROPSET*);
}
enum IID_IDBInitialize = GUID(0xc733a8b, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBInitialize : IUnknown
{
    HRESULT Initialize();
    HRESULT Uninitialize();
}
alias DBLITERALENUM = int;
enum : int
{
    DBLITERAL_INVALID           = 0x00000000,
    DBLITERAL_BINARY_LITERAL    = 0x00000001,
    DBLITERAL_CATALOG_NAME      = 0x00000002,
    DBLITERAL_CATALOG_SEPARATOR = 0x00000003,
    DBLITERAL_CHAR_LITERAL      = 0x00000004,
    DBLITERAL_COLUMN_ALIAS      = 0x00000005,
    DBLITERAL_COLUMN_NAME       = 0x00000006,
    DBLITERAL_CORRELATION_NAME  = 0x00000007,
    DBLITERAL_CURSOR_NAME       = 0x00000008,
    DBLITERAL_ESCAPE_PERCENT    = 0x00000009,
    DBLITERAL_ESCAPE_UNDERSCORE = 0x0000000a,
    DBLITERAL_INDEX_NAME        = 0x0000000b,
    DBLITERAL_LIKE_PERCENT      = 0x0000000c,
    DBLITERAL_LIKE_UNDERSCORE   = 0x0000000d,
    DBLITERAL_PROCEDURE_NAME    = 0x0000000e,
    DBLITERAL_QUOTE             = 0x0000000f,
    DBLITERAL_SCHEMA_NAME       = 0x00000010,
    DBLITERAL_TABLE_NAME        = 0x00000011,
    DBLITERAL_TEXT_COMMAND      = 0x00000012,
    DBLITERAL_USER_NAME         = 0x00000013,
    DBLITERAL_VIEW_NAME         = 0x00000014,
}

alias DBLITERALENUM20 = int;
enum : int
{
    DBLITERAL_CUBE_NAME        = 0x00000015,
    DBLITERAL_DIMENSION_NAME   = 0x00000016,
    DBLITERAL_HIERARCHY_NAME   = 0x00000017,
    DBLITERAL_LEVEL_NAME       = 0x00000018,
    DBLITERAL_MEMBER_NAME      = 0x00000019,
    DBLITERAL_PROPERTY_NAME    = 0x0000001a,
    DBLITERAL_SCHEMA_SEPARATOR = 0x0000001b,
    DBLITERAL_QUOTE_SUFFIX     = 0x0000001c,
}

alias DBLITERALENUM21 = int;
enum : int
{
    DBLITERAL_ESCAPE_PERCENT_SUFFIX    = 0x0000001d,
    DBLITERAL_ESCAPE_UNDERSCORE_SUFFIX = 0x0000001e,
}

/+ [CONFLICTED] struct DBLITERALINFO
{
    align (2):
    PWSTR pwszLiteralValue;
    PWSTR pwszInvalidChars;
    PWSTR pwszInvalidStartingChars;
    uint lt;
    BOOL fSupported;
    uint cchMaxLen;
}
+/
enum IID_IDBInfo = GUID(0xc733a89, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBInfo : IUnknown
{
    HRESULT GetKeywords(PWSTR*);
    HRESULT GetLiteralInfo(uint, const(uint)*, uint*, DBLITERALINFO**, ushort**);
}
enum IID_IDBDataSourceAdmin = GUID(0xc733a7a, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBDataSourceAdmin : IUnknown
{
    HRESULT CreateDataSource(uint, DBPROPSET*, IUnknown, const(GUID)*, IUnknown*);
    HRESULT DestroyDataSource();
    HRESULT GetCreationProperties(uint, const(DBPROPIDSET)*, uint*, DBPROPINFOSET**, ushort**);
    HRESULT ModifyDataSource(uint, DBPROPSET*);
}
enum IID_IDBAsynchNotify = GUID(0xc733a96, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBAsynchNotify : IUnknown
{
    HRESULT OnLowResource(ulong);
    HRESULT OnProgress(ulong, uint, ulong, ulong, uint, PWSTR);
    HRESULT OnStop(ulong, uint, HRESULT, PWSTR);
}
enum IID_IDBAsynchStatus = GUID(0xc733a95, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBAsynchStatus : IUnknown
{
    HRESULT Abort(ulong, uint);
    HRESULT GetStatus(ulong, uint, ulong*, ulong*, uint*, PWSTR*);
}
enum IID_ISessionProperties = GUID(0xc733a85, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ISessionProperties : IUnknown
{
    HRESULT GetProperties(uint, const(DBPROPIDSET)*, uint*, DBPROPSET**);
    HRESULT SetProperties(uint, DBPROPSET*);
}
enum IID_IIndexDefinition = GUID(0xc733a68, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IIndexDefinition : IUnknown
{
    HRESULT CreateIndex(DBID*, DBID*, ulong, const(DBINDEXCOLUMNDESC)*, uint, DBPROPSET*, DBID**);
    HRESULT DropIndex(DBID*, DBID*);
}
enum IID_ITableDefinition = GUID(0xc733a86, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITableDefinition : IUnknown
{
    HRESULT CreateTable(IUnknown, DBID*, ulong, const(DBCOLUMNDESC)*, const(GUID)*, uint, DBPROPSET*, DBID**, IUnknown*);
    HRESULT DropTable(DBID*);
    HRESULT AddColumn(DBID*, DBCOLUMNDESC*, DBID**);
    HRESULT DropColumn(DBID*, DBID*);
}
enum IID_IOpenRowset = GUID(0xc733a69, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IOpenRowset : IUnknown
{
    HRESULT OpenRowset(IUnknown, DBID*, DBID*, const(GUID)*, uint, DBPROPSET*, IUnknown*);
}
enum IID_IDBSchemaRowset = GUID(0xc733a7b, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBSchemaRowset : IUnknown
{
    HRESULT GetRowset(IUnknown, const(GUID)*, uint, const(VARIANT)*, const(GUID)*, uint, DBPROPSET*, IUnknown*);
    HRESULT GetSchemas(uint*, GUID**, uint**);
}
enum IID_IMDDataset = GUID(0xa07cccd1, 0x8148, 0x11d0, [0x87, 0xbb, 0x0, 0xc0, 0x4f, 0xc3, 0x39, 0x42]);
interface IMDDataset : IUnknown
{
    HRESULT FreeAxisInfo(ulong, MDAXISINFO*);
    HRESULT GetAxisInfo(ulong*, MDAXISINFO**);
    HRESULT GetAxisRowset(IUnknown, ulong, const(GUID)*, uint, DBPROPSET*, IUnknown*);
    HRESULT GetCellData(HACCESSOR, ulong, ulong, void*);
    HRESULT GetSpecification(const(GUID)*, IUnknown*);
}
enum IID_IMDFind = GUID(0xa07cccd2, 0x8148, 0x11d0, [0x87, 0xbb, 0x0, 0xc0, 0x4f, 0xc3, 0x39, 0x42]);
interface IMDFind : IUnknown
{
    HRESULT FindCell(ulong, ulong, PWSTR*, ulong*);
    HRESULT FindTuple(uint, ulong, ulong, PWSTR*, uint*);
}
enum IID_IMDRangeRowset = GUID(0xc733aa0, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IMDRangeRowset : IUnknown
{
    HRESULT GetRangeRowset(IUnknown, ulong, ulong, const(GUID)*, uint, DBPROPSET*, IUnknown*);
}
enum IID_IAlterTable = GUID(0xc733aa5, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IAlterTable : IUnknown
{
    HRESULT AlterColumn(DBID*, DBID*, uint, DBCOLUMNDESC*);
    HRESULT AlterTable(DBID*, DBID*, uint, DBPROPSET*);
}
enum IID_IAlterIndex = GUID(0xc733aa6, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IAlterIndex : IUnknown
{
    HRESULT AlterIndex(DBID*, DBID*, DBID*, uint, DBPROPSET*);
}
enum IID_IRowsetChapterMember = GUID(0xc733aa8, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetChapterMember : IUnknown
{
    HRESULT IsRowInChapter(ulong, ulong);
}
enum IID_ICommandPersist = GUID(0xc733aa7, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandPersist : IUnknown
{
    HRESULT DeleteCommand(DBID*);
    HRESULT GetCurrentCommand(DBID**);
    HRESULT LoadCommand(DBID*, uint);
    HRESULT SaveCommand(DBID*, uint);
}
enum IID_IRowsetRefresh = GUID(0xc733aa9, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetRefresh : IUnknown
{
    HRESULT RefreshVisibleData(ulong, ulong, const(ulong)*, BOOL, ulong*, ulong**, uint**);
    HRESULT GetLastVisibleData(ulong, HACCESSOR, void*);
}
enum IID_IParentRowset = GUID(0xc733aaa, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IParentRowset : IUnknown
{
    HRESULT GetChildRowset(IUnknown, ulong, const(GUID)*, IUnknown*);
}
/+ [CONFLICTED] struct ERRORINFO
{
    align (2):
    HRESULT hrError;
    uint dwMinor;
    GUID clsid;
    GUID iid;
    int dispid;
}
+/
enum IID_IErrorRecords = GUID(0xc733a67, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IErrorRecords : IUnknown
{
    HRESULT AddErrorRecord(ERRORINFO*, uint, DISPPARAMS*, IUnknown, uint);
    HRESULT GetBasicErrorInfo(uint, ERRORINFO*);
    HRESULT GetCustomErrorObject(uint, const(GUID)*, IUnknown*);
    HRESULT GetErrorInfo(uint, uint, IErrorInfo*);
    HRESULT GetErrorParameters(uint, DISPPARAMS*);
    HRESULT GetRecordCount(uint*);
}
enum IID_IErrorLookup = GUID(0xc733a66, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IErrorLookup : IUnknown
{
    HRESULT GetErrorDescription(HRESULT, uint, DISPPARAMS*, uint, BSTR*, BSTR*);
    HRESULT GetHelpInfo(HRESULT, uint, uint, BSTR*, uint*);
    HRESULT ReleaseErrors(const(uint));
}
enum IID_ISQLErrorInfo = GUID(0xc733a74, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ISQLErrorInfo : IUnknown
{
    HRESULT GetSQLInfo(BSTR*, int*);
}
enum IID_IGetDataSource = GUID(0xc733a75, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IGetDataSource : IUnknown
{
    HRESULT GetDataSource(const(GUID)*, IUnknown*);
}
enum IID_ITransactionLocal = GUID(0xc733a5f, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITransactionLocal : ITransaction
{
    HRESULT GetOptionsObject(ITransactionOptions*);
    HRESULT StartTransaction(int, uint, ITransactionOptions, uint*);
}
enum IID_ITransactionJoin = GUID(0xc733a5e, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITransactionJoin : IUnknown
{
    HRESULT GetOptionsObject(ITransactionOptions*);
    HRESULT JoinTransaction(IUnknown, int, uint, ITransactionOptions);
}
enum IID_ITransactionObject = GUID(0xc733a60, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITransactionObject : IUnknown
{
    HRESULT GetTransactionObject(uint, ITransaction*);
}
enum IID_ITrusteeAdmin = GUID(0xc733aa1, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITrusteeAdmin : IUnknown
{
    HRESULT CompareTrustees(TRUSTEE_W*, TRUSTEE_W*);
    HRESULT CreateTrustee(TRUSTEE_W*, uint, DBPROPSET*);
    HRESULT DeleteTrustee(TRUSTEE_W*);
    HRESULT SetTrusteeProperties(TRUSTEE_W*, uint, DBPROPSET*);
    HRESULT GetTrusteeProperties(TRUSTEE_W*, const(uint), const(DBPROPIDSET)*, uint*, DBPROPSET**);
}
enum IID_ITrusteeGroupAdmin = GUID(0xc733aa2, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITrusteeGroupAdmin : IUnknown
{
    HRESULT AddMember(TRUSTEE_W*, TRUSTEE_W*);
    HRESULT DeleteMember(TRUSTEE_W*, TRUSTEE_W*);
    HRESULT IsMember(TRUSTEE_W*, TRUSTEE_W*, BOOL*);
    HRESULT GetMembers(TRUSTEE_W*, uint*, TRUSTEE_W**);
    HRESULT GetMemberships(TRUSTEE_W*, uint*, TRUSTEE_W**);
}
enum IID_IObjectAccessControl = GUID(0xc733aa3, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IObjectAccessControl : IUnknown
{
    HRESULT GetObjectAccessRights(SEC_OBJECT*, uint*, EXPLICIT_ACCESS_W**);
    HRESULT GetObjectOwner(SEC_OBJECT*, TRUSTEE_W**);
    HRESULT IsObjectAccessAllowed(SEC_OBJECT*, EXPLICIT_ACCESS_W*, BOOL*);
    HRESULT SetObjectAccessRights(SEC_OBJECT*, uint, EXPLICIT_ACCESS_W*);
    HRESULT SetObjectOwner(SEC_OBJECT*, TRUSTEE_W*);
}
alias ACCESS_MASKENUM = int;
enum : int
{
    PERM_EXCLUSIVE        = 0x00000200,
    PERM_READDESIGN       = 0x00000400,
    PERM_WRITEDESIGN      = 0x00000800,
    PERM_WITHGRANT        = 0x00001000,
    PERM_REFERENCE        = 0x00002000,
    PERM_CREATE           = 0x00004000,
    PERM_INSERT           = 0x00008000,
    PERM_DELETE           = 0x00010000,
    PERM_READCONTROL      = 0x00020000,
    PERM_WRITEPERMISSIONS = 0x00040000,
    PERM_WRITEOWNER       = 0x00080000,
    PERM_MAXIMUM_ALLOWED  = 0x02000000,
    PERM_ALL              = 0x10000000,
    PERM_EXECUTE          = 0x20000000,
    PERM_READ             = 0x80000000,
    PERM_UPDATE           = 0x40000000,
    PERM_DROP             = 0x00000100,
}

enum IID_ISecurityInfo = GUID(0xc733aa4, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ISecurityInfo : IUnknown
{
    HRESULT GetCurrentTrustee(TRUSTEE_W**);
    HRESULT GetObjectTypes(uint*, GUID**);
    HRESULT GetPermissions(GUID, uint*);
}
enum IID_ITableCreation = GUID(0xc733abc, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITableCreation : ITableDefinition
{
    HRESULT GetTableDefinition(DBID*, ulong*, DBCOLUMNDESC**, uint*, DBPROPSET**, uint*, DBCONSTRAINTDESC**, ushort**);
}
enum IID_ITableDefinitionWithConstraints = GUID(0xc733aab, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITableDefinitionWithConstraints : ITableCreation
{
    HRESULT AddConstraint(DBID*, DBCONSTRAINTDESC*);
    HRESULT CreateTableWithConstraints(IUnknown, DBID*, ulong, DBCOLUMNDESC*, uint, DBCONSTRAINTDESC*, const(GUID)*, uint, DBPROPSET*, DBID**, IUnknown*);
    HRESULT DropConstraint(DBID*, DBID*);
}
enum IID_IRow = GUID(0xc733ab4, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRow : IUnknown
{
    HRESULT GetColumns(ulong, DBCOLUMNACCESS*);
    HRESULT GetSourceRowset(const(GUID)*, IUnknown*, ulong*);
    HRESULT Open(IUnknown, DBID*, const(GUID)*, uint, const(GUID)*, IUnknown*);
}
enum IID_IRowChange = GUID(0xc733ab5, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowChange : IUnknown
{
    HRESULT SetColumns(ulong, DBCOLUMNACCESS*);
}
enum IID_IRowSchemaChange = GUID(0xc733aae, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowSchemaChange : IRowChange
{
    HRESULT DeleteColumns(ulong, const(DBID)*, uint*);
    HRESULT AddColumns(ulong, const(DBCOLUMNINFO)*, DBCOLUMNACCESS*);
}
enum IID_IGetRow = GUID(0xc733aaf, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IGetRow : IUnknown
{
    HRESULT GetRowFromHROW(IUnknown, ulong, const(GUID)*, IUnknown*);
    HRESULT GetURLFromHROW(ulong, PWSTR*);
}
enum IID_IBindResource = GUID(0xc733ab1, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IBindResource : IUnknown
{
    HRESULT Bind(IUnknown, const(wchar)*, uint, const(GUID)*, const(GUID)*, IAuthenticate, DBIMPLICITSESSION*, uint*, IUnknown*);
}
alias DBCOPYFLAGSENUM = int;
enum : int
{
    DBCOPY_ASYNC            = 0x00000100,
    DBCOPY_REPLACE_EXISTING = 0x00000200,
    DBCOPY_ALLOW_EMULATION  = 0x00000400,
    DBCOPY_NON_RECURSIVE    = 0x00000800,
    DBCOPY_ATOMIC           = 0x00001000,
}

alias DBMOVEFLAGSENUM = int;
enum : int
{
    DBMOVE_REPLACE_EXISTING  = 0x00000001,
    DBMOVE_ASYNC             = 0x00000100,
    DBMOVE_DONT_UPDATE_LINKS = 0x00000200,
    DBMOVE_ALLOW_EMULATION   = 0x00000400,
    DBMOVE_ATOMIC            = 0x00001000,
}

alias DBDELETEFLAGSENUM = int;
enum : int
{
    DBDELETE_ASYNC  = 0x00000100,
    DBDELETE_ATOMIC = 0x00001000,
}

enum IID_IScopedOperations = GUID(0xc733ab0, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IScopedOperations : IBindResource
{
    HRESULT Copy(ulong, PWSTR*, PWSTR*, uint, IAuthenticate, uint*, PWSTR*, ushort**);
    HRESULT Move(ulong, PWSTR*, PWSTR*, uint, IAuthenticate, uint*, PWSTR*, ushort**);
    HRESULT Delete(ulong, PWSTR*, uint, uint*);
    HRESULT OpenRowset(IUnknown, DBID*, DBID*, const(GUID)*, uint, DBPROPSET*, IUnknown*);
}
enum IID_ICreateRow = GUID(0xc733ab2, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICreateRow : IUnknown
{
    HRESULT CreateRow(IUnknown, const(wchar)*, uint, const(GUID)*, const(GUID)*, IAuthenticate, DBIMPLICITSESSION*, uint*, PWSTR*, IUnknown*);
}
enum IID_IDBBinderProperties = GUID(0xc733ab3, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBBinderProperties : IDBProperties
{
    HRESULT Reset();
}
enum IID_IColumnsInfo2 = GUID(0xc733ab8, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IColumnsInfo2 : IColumnsInfo
{
    HRESULT GetRestrictedColumnInfo(ulong, const(DBID)*, uint, ulong*, DBID**, DBCOLUMNINFO**, ushort**);
}
enum IID_IRegisterProvider = GUID(0xc733ab9, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRegisterProvider : IUnknown
{
    HRESULT GetURLMapping(const(wchar)*, ulong, GUID*);
    HRESULT SetURLMapping(const(wchar)*, ulong, const(GUID)*);
    HRESULT UnregisterProvider(const(wchar)*, ulong, const(GUID)*);
}
enum IID_IGetSession = GUID(0xc733aba, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IGetSession : IUnknown
{
    HRESULT GetSession(const(GUID)*, IUnknown*);
}
enum IID_IGetSourceRow = GUID(0xc733abb, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IGetSourceRow : IUnknown
{
    HRESULT GetSourceRow(const(GUID)*, IUnknown*);
}
enum IID_IRowsetCurrentIndex = GUID(0xc733abd, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetCurrentIndex : IRowsetIndex
{
    HRESULT GetIndex(DBID**);
    HRESULT SetIndex(DBID*);
}
enum IID_ICommandStream = GUID(0xc733abf, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandStream : IUnknown
{
    HRESULT GetCommandStream(GUID*, GUID*, IUnknown*);
    HRESULT SetCommandStream(const(GUID)*, const(GUID)*, IUnknown);
}
enum IID_IRowsetBookmark = GUID(0xc733ac2, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetBookmark : IUnknown
{
    HRESULT PositionOnBookmark(ulong, ulong, const(ubyte)*);
}
alias STRUCTURED_QUERY_SYNTAX = int;
enum : int
{
    SQS_NO_SYNTAX             = 0x00000000,
    SQS_ADVANCED_QUERY_SYNTAX = 0x00000001,
    SQS_NATURAL_QUERY_SYNTAX  = 0x00000002,
}

alias STRUCTURED_QUERY_SINGLE_OPTION = int;
enum : int
{
    SQSO_SCHEMA               = 0x00000000,
    SQSO_LOCALE_WORD_BREAKING = 0x00000001,
    SQSO_WORD_BREAKER         = 0x00000002,
    SQSO_NATURAL_SYNTAX       = 0x00000003,
    SQSO_AUTOMATIC_WILDCARD   = 0x00000004,
    SQSO_TRACE_LEVEL          = 0x00000005,
    SQSO_LANGUAGE_KEYWORDS    = 0x00000006,
    SQSO_SYNTAX               = 0x00000007,
    SQSO_TIME_ZONE            = 0x00000008,
    SQSO_IMPLICIT_CONNECTOR   = 0x00000009,
    SQSO_CONNECTOR_CASE       = 0x0000000a,
}

alias STRUCTURED_QUERY_MULTIOPTION = int;
enum : int
{
    SQMO_VIRTUAL_PROPERTY   = 0x00000000,
    SQMO_DEFAULT_PROPERTY   = 0x00000001,
    SQMO_GENERATOR_FOR_TYPE = 0x00000002,
    SQMO_MAP_PROPERTY       = 0x00000003,
}

alias STRUCTURED_QUERY_PARSE_ERROR = int;
enum : int
{
    SQPE_NONE                      = 0x00000000,
    SQPE_EXTRA_OPENING_PARENTHESIS = 0x00000001,
    SQPE_EXTRA_CLOSING_PARENTHESIS = 0x00000002,
    SQPE_IGNORED_MODIFIER          = 0x00000003,
    SQPE_IGNORED_CONNECTOR         = 0x00000004,
    SQPE_IGNORED_KEYWORD           = 0x00000005,
    SQPE_UNHANDLED                 = 0x00000006,
}

alias STRUCTURED_QUERY_RESOLVE_OPTION = int;
enum : int
{
    SQRO_DEFAULT                           = 0x00000000,
    SQRO_DONT_RESOLVE_DATETIME             = 0x00000001,
    SQRO_ALWAYS_ONE_INTERVAL               = 0x00000002,
    SQRO_DONT_SIMPLIFY_CONDITION_TREES     = 0x00000004,
    SQRO_DONT_MAP_RELATIONS                = 0x00000008,
    SQRO_DONT_RESOLVE_RANGES               = 0x00000010,
    SQRO_DONT_REMOVE_UNRESTRICTED_KEYWORDS = 0x00000020,
    SQRO_DONT_SPLIT_WORDS                  = 0x00000040,
    SQRO_IGNORE_PHRASE_ORDER               = 0x00000080,
    SQRO_ADD_VALUE_TYPE_FOR_PLAIN_VALUES   = 0x00000100,
    SQRO_ADD_ROBUST_ITEM_NAME              = 0x00000200,
}

alias CASE_REQUIREMENT = int;
enum : int
{
    CASE_REQUIREMENT_ANY          = 0x00000000,
    CASE_REQUIREMENT_UPPER_IF_AQS = 0x00000001,
}

alias INTERVAL_LIMIT_KIND = int;
enum : int
{
    ILK_EXPLICIT_INCLUDED = 0x00000000,
    ILK_EXPLICIT_EXCLUDED = 0x00000001,
    ILK_NEGATIVE_INFINITY = 0x00000002,
    ILK_POSITIVE_INFINITY = 0x00000003,
}

alias QUERY_PARSER_MANAGER_OPTION = int;
enum : int
{
    QPMO_SCHEMA_BINARY_NAME              = 0x00000000,
    QPMO_PRELOCALIZED_SCHEMA_BINARY_PATH = 0x00000001,
    QPMO_UNLOCALIZED_SCHEMA_BINARY_PATH  = 0x00000002,
    QPMO_LOCALIZED_SCHEMA_BINARY_PATH    = 0x00000003,
    QPMO_APPEND_LCID_TO_LOCALIZED_PATH   = 0x00000004,
    QPMO_LOCALIZER_SUPPORT               = 0x00000005,
}

enum IID_IQueryParser = GUID(0x2ebdee67, 0x3505, 0x43f8, [0x99, 0x46, 0xea, 0x44, 0xab, 0xc8, 0xe5, 0xb0]);
interface IQueryParser : IUnknown
{
    HRESULT Parse(const(wchar)*, IEnumUnknown, IQuerySolution*);
    HRESULT SetOption(STRUCTURED_QUERY_SINGLE_OPTION, const(PROPVARIANT)*);
    HRESULT GetOption(STRUCTURED_QUERY_SINGLE_OPTION, PROPVARIANT*);
    HRESULT SetMultiOption(STRUCTURED_QUERY_MULTIOPTION, const(wchar)*, const(PROPVARIANT)*);
    HRESULT GetSchemaProvider(ISchemaProvider*);
    HRESULT RestateToString(ICondition, BOOL, PWSTR*);
    HRESULT ParsePropertyValue(const(wchar)*, const(wchar)*, IQuerySolution*);
    HRESULT RestatePropertyValueToString(ICondition, BOOL, PWSTR*, PWSTR*);
}
enum IID_IConditionFactory = GUID(0xa5efe073, 0xb16f, 0x474f, [0x9f, 0x3e, 0x9f, 0x8b, 0x49, 0x7a, 0x3e, 0x8]);
interface IConditionFactory : IUnknown
{
    HRESULT MakeNot(ICondition, BOOL, ICondition*);
    HRESULT MakeAndOr(CONDITION_TYPE, IEnumUnknown, BOOL, ICondition*);
    HRESULT MakeLeaf(const(wchar)*, CONDITION_OPERATION, const(wchar)*, const(PROPVARIANT)*, IRichChunk, IRichChunk, IRichChunk, BOOL, ICondition*);
    HRESULT Resolve(ICondition, STRUCTURED_QUERY_RESOLVE_OPTION, const(SYSTEMTIME)*, ICondition*);
}
enum IID_IQuerySolution = GUID(0xd6ebc66b, 0x8921, 0x4193, [0xaf, 0xdd, 0xa1, 0x78, 0x9f, 0xb7, 0xff, 0x57]);
interface IQuerySolution : IConditionFactory
{
    HRESULT GetQuery(ICondition*, IEntity*);
    HRESULT GetErrors(const(GUID)*, void**);
    HRESULT GetLexicalData(PWSTR*, ITokenCollection*, uint*, IUnknown*);
}
alias CONDITION_CREATION_OPTIONS = int;
enum : int
{
    CONDITION_CREATION_DEFAULT            = 0x00000000,
    CONDITION_CREATION_NONE               = 0x00000000,
    CONDITION_CREATION_SIMPLIFY           = 0x00000001,
    CONDITION_CREATION_VECTOR_AND         = 0x00000002,
    CONDITION_CREATION_VECTOR_OR          = 0x00000004,
    CONDITION_CREATION_VECTOR_LEAF        = 0x00000008,
    CONDITION_CREATION_USE_CONTENT_LOCALE = 0x00000010,
}

enum IID_IConditionFactory2 = GUID(0x71d222e1, 0x432f, 0x429e, [0x8c, 0x13, 0xb6, 0xda, 0xfd, 0xe5, 0x7, 0x7a]);
interface IConditionFactory2 : IConditionFactory
{
    HRESULT CreateTrueFalse(BOOL, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateNegation(ICondition, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateCompoundFromObjectArray(CONDITION_TYPE, IObjectArray, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateCompoundFromArray(CONDITION_TYPE, ICondition*, uint, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateStringLeaf(const(PROPERTYKEY)*, CONDITION_OPERATION, const(wchar)*, const(wchar)*, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateIntegerLeaf(const(PROPERTYKEY)*, CONDITION_OPERATION, int, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateBooleanLeaf(const(PROPERTYKEY)*, CONDITION_OPERATION, BOOL, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT CreateLeaf(const(PROPERTYKEY)*, CONDITION_OPERATION, const(PROPVARIANT)*, const(wchar)*, const(wchar)*, IRichChunk, IRichChunk, IRichChunk, CONDITION_CREATION_OPTIONS, const(GUID)*, void**);
    HRESULT ResolveCondition(ICondition, STRUCTURED_QUERY_RESOLVE_OPTION, const(SYSTEMTIME)*, const(GUID)*, void**);
}
enum IID_IConditionGenerator = GUID(0x92d2cc58, 0x4386, 0x45a3, [0xb9, 0x8c, 0x7e, 0xc, 0xe6, 0x4a, 0x41, 0x17]);
interface IConditionGenerator : IUnknown
{
    HRESULT Initialize(ISchemaProvider);
    HRESULT RecognizeNamedEntities(const(wchar)*, uint, ITokenCollection, INamedEntityCollector);
    HRESULT GenerateForLeaf(IConditionFactory, const(wchar)*, CONDITION_OPERATION, const(wchar)*, const(wchar)*, const(wchar)*, IRichChunk, IRichChunk, IRichChunk, BOOL, BOOL*, ICondition*);
    HRESULT DefaultPhrase(const(wchar)*, const(PROPVARIANT)*, BOOL, PWSTR*);
}
enum IID_IInterval = GUID(0x6bf0a714, 0x3c18, 0x430b, [0x8b, 0x5d, 0x83, 0xb1, 0xc2, 0x34, 0xd3, 0xdb]);
interface IInterval : IUnknown
{
    HRESULT GetLimits(INTERVAL_LIMIT_KIND*, PROPVARIANT*, INTERVAL_LIMIT_KIND*, PROPVARIANT*);
}
enum IID_IMetaData = GUID(0x780102b0, 0xc43b, 0x4876, [0xbc, 0x7b, 0x5e, 0x9b, 0xa5, 0xc8, 0x87, 0x94]);
interface IMetaData : IUnknown
{
    HRESULT GetData(PWSTR*, PWSTR*);
}
enum IID_IEntity = GUID(0x24264891, 0xe80b, 0x4fd3, [0xb7, 0xce, 0x4f, 0xf2, 0xfa, 0xe8, 0x93, 0x1f]);
interface IEntity : IUnknown
{
    HRESULT Name(PWSTR*);
    HRESULT Base(IEntity*);
    HRESULT Relationships(const(GUID)*, void**);
    HRESULT GetRelationship(const(wchar)*, IRelationship*);
    HRESULT MetaData(const(GUID)*, void**);
    HRESULT NamedEntities(const(GUID)*, void**);
    HRESULT GetNamedEntity(const(wchar)*, INamedEntity*);
    HRESULT DefaultPhrase(PWSTR*);
}
enum IID_IRelationship = GUID(0x2769280b, 0x5108, 0x498c, [0x9c, 0x7f, 0xa5, 0x12, 0x39, 0xb6, 0x31, 0x47]);
interface IRelationship : IUnknown
{
    HRESULT Name(PWSTR*);
    HRESULT IsReal(BOOL*);
    HRESULT Destination(IEntity*);
    HRESULT MetaData(const(GUID)*, void**);
    HRESULT DefaultPhrase(PWSTR*);
}
enum IID_INamedEntity = GUID(0xabdbd0b1, 0x7d54, 0x49fb, [0xab, 0x5c, 0xbf, 0xf4, 0x13, 0x0, 0x4, 0xcd]);
interface INamedEntity : IUnknown
{
    HRESULT GetValue(PWSTR*);
    HRESULT DefaultPhrase(PWSTR*);
}
enum IID_ISchemaProvider = GUID(0x8cf89bcb, 0x394c, 0x49b2, [0xae, 0x28, 0xa5, 0x9d, 0xd4, 0xed, 0x7f, 0x68]);
interface ISchemaProvider : IUnknown
{
    HRESULT Entities(const(GUID)*, void**);
    HRESULT RootEntity(IEntity*);
    HRESULT GetEntity(const(wchar)*, IEntity*);
    HRESULT MetaData(const(GUID)*, void**);
    HRESULT Localize(uint, ISchemaLocalizerSupport);
    HRESULT SaveBinary(const(wchar)*);
    HRESULT LookupAuthoredNamedEntity(IEntity, const(wchar)*, ITokenCollection, uint, uint*, PWSTR*);
}
enum IID_ITokenCollection = GUID(0x22d8b4f2, 0xf577, 0x4adb, [0xa3, 0x35, 0xc2, 0xae, 0x88, 0x41, 0x6f, 0xab]);
interface ITokenCollection : IUnknown
{
    HRESULT NumberOfTokens(uint*);
    HRESULT GetToken(uint, uint*, uint*, PWSTR*);
}
alias NAMED_ENTITY_CERTAINTY = int;
enum : int
{
    NEC_LOW    = 0x00000000,
    NEC_MEDIUM = 0x00000001,
    NEC_HIGH   = 0x00000002,
}

enum IID_INamedEntityCollector = GUID(0xaf2440f6, 0x8afc, 0x47d0, [0x9a, 0x7f, 0x39, 0x6a, 0xa, 0xcf, 0xb4, 0x3d]);
interface INamedEntityCollector : IUnknown
{
    HRESULT Add(uint, uint, uint, uint, IEntity, const(wchar)*, NAMED_ENTITY_CERTAINTY);
}
enum IID_ISchemaLocalizerSupport = GUID(0xca3fdca2, 0xbfbe, 0x4eed, [0x90, 0xd7, 0xc, 0xae, 0xf0, 0xa1, 0xbd, 0xa1]);
interface ISchemaLocalizerSupport : IUnknown
{
    HRESULT Localize(const(wchar)*, PWSTR*);
}
enum IID_IQueryParserManager = GUID(0xa879e3c4, 0xaf77, 0x44fb, [0x8f, 0x37, 0xeb, 0xd1, 0x48, 0x7c, 0xf9, 0x20]);
interface IQueryParserManager : IUnknown
{
    HRESULT CreateLoadedParser(const(wchar)*, ushort, const(GUID)*, void**);
    HRESULT InitializeOptions(BOOL, BOOL, IQueryParser);
    HRESULT SetOption(QUERY_PARSER_MANAGER_OPTION, const(PROPVARIANT)*);
}
struct HITRANGE
{
    uint iPosition;
    uint cLength;
}
enum CLSID_QueryParser = GUID(0xb72f8fd8, 0xfab, 0x4dd9, [0xbd, 0xbf, 0x24, 0x5a, 0x6c, 0xe1, 0x48, 0x5b]);
struct QueryParser
{
}
enum CLSID_NegationCondition = GUID(0x8de9c74c, 0x605a, 0x4acd, [0xbe, 0xe3, 0x2b, 0x22, 0x2a, 0xa2, 0xd2, 0x3d]);
struct NegationCondition
{
}
enum CLSID_CompoundCondition = GUID(0x116f8d13, 0x101e, 0x4fa5, [0x84, 0xd4, 0xff, 0x82, 0x79, 0x38, 0x19, 0x35]);
struct CompoundCondition
{
}
enum CLSID_LeafCondition = GUID(0x52f15c89, 0x5a17, 0x48e1, [0xbb, 0xcd, 0x46, 0xa3, 0xf8, 0x9c, 0x7c, 0xc2]);
struct LeafCondition
{
}
enum CLSID_ConditionFactory = GUID(0xe03e85b0, 0x7be3, 0x4000, [0xba, 0x98, 0x6c, 0x13, 0xde, 0x9f, 0xa4, 0x86]);
struct ConditionFactory
{
}
enum CLSID_Interval = GUID(0xd957171f, 0x4bf9, 0x4de2, [0xbc, 0xd5, 0xc7, 0xa, 0x7c, 0xa5, 0x58, 0x36]);
struct Interval
{
}
enum CLSID_QueryParserManager = GUID(0x5088b39a, 0x29b4, 0x4d9d, [0x82, 0x45, 0x4e, 0xe2, 0x89, 0x22, 0x2f, 0x66]);
struct QueryParserManager
{
}
enum IID_IUrlAccessor = GUID(0xb63e318, 0x9ccc, 0x11d0, [0xbc, 0xdb, 0x0, 0x80, 0x5f, 0xcc, 0xce, 0x4]);
interface IUrlAccessor : IUnknown
{
    HRESULT AddRequestParameter(PROPSPEC*, PROPVARIANT*);
    HRESULT GetDocFormat(PWSTR, uint, uint*);
    HRESULT GetCLSID(GUID*);
    HRESULT GetHost(PWSTR, uint, uint*);
    HRESULT IsDirectory();
    HRESULT GetSize(ulong*);
    HRESULT GetLastModified(FILETIME*);
    HRESULT GetFileName(PWSTR, uint, uint*);
    HRESULT GetSecurityDescriptor(ubyte*, uint, uint*);
    HRESULT GetRedirectedURL(PWSTR, uint, uint*);
    HRESULT GetSecurityProvider(GUID*);
    HRESULT BindToStream(IStream*);
    HRESULT BindToFilter(IFilter*);
}
enum IID_IUrlAccessor2 = GUID(0xc7310734, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x4f]);
interface IUrlAccessor2 : IUrlAccessor
{
    HRESULT GetDisplayUrl(PWSTR, uint, uint*);
    HRESULT IsDocument();
    HRESULT GetCodePage(PWSTR, uint, uint*);
}
enum IID_IUrlAccessor3 = GUID(0x6fbc7005, 0x455, 0x4874, [0xb8, 0xff, 0x74, 0x39, 0x45, 0x2, 0x41, 0xa3]);
interface IUrlAccessor3 : IUrlAccessor2
{
    HRESULT GetImpersonationSidBlobs(const(wchar)*, uint*, BLOB**);
}
enum IID_IUrlAccessor4 = GUID(0x5cc51041, 0xc8d2, 0x41d7, [0xbc, 0xa3, 0x9e, 0x9e, 0x28, 0x62, 0x97, 0xdc]);
interface IUrlAccessor4 : IUrlAccessor3
{
    HRESULT ShouldIndexItemContent(BOOL*);
    HRESULT ShouldIndexProperty(const(PROPERTYKEY)*, BOOL*);
}
enum IID_IOpLockStatus = GUID(0xc731065d, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x4f]);
interface IOpLockStatus : IUnknown
{
    HRESULT IsOplockValid(BOOL*);
    HRESULT IsOplockBroken(BOOL*);
    HRESULT GetOplockEventHandle(HANDLE*);
}
enum IID_ISearchProtocolThreadContext = GUID(0xc73106e1, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x4f]);
interface ISearchProtocolThreadContext : IUnknown
{
    HRESULT ThreadInit();
    HRESULT ThreadShutdown();
    HRESULT ThreadIdle(uint);
}
struct TIMEOUT_INFO
{
    uint dwSize;
    uint dwConnectTimeout;
    uint dwDataTimeout;
}
alias PROXY_ACCESS = int;
enum : int
{
    PROXY_ACCESS_PRECONFIG = 0x00000000,
    PROXY_ACCESS_DIRECT    = 0x00000001,
    PROXY_ACCESS_PROXY     = 0x00000002,
}

struct PROXY_INFO
{
    uint dwSize;
    const(wchar)* pcwszUserAgent;
    PROXY_ACCESS paUseProxy;
    BOOL fLocalBypass;
    uint dwPortNumber;
    const(wchar)* pcwszProxyName;
    const(wchar)* pcwszBypassList;
}
alias AUTH_TYPE = int;
enum : int
{
    eAUTH_TYPE_ANONYMOUS = 0x00000000,
    eAUTH_TYPE_NTLM      = 0x00000001,
    eAUTH_TYPE_BASIC     = 0x00000002,
}

struct AUTHENTICATION_INFO
{
    uint dwSize;
    AUTH_TYPE atAuthenticationType;
    const(wchar)* pcwszUser;
    const(wchar)* pcwszPassword;
}
struct INCREMENTAL_ACCESS_INFO
{
    uint dwSize;
    FILETIME ftLastModifiedTime;
}
struct ITEM_INFO
{
    uint dwSize;
    const(wchar)* pcwszFromEMail;
    const(wchar)* pcwszApplicationName;
    const(wchar)* pcwszCatalogName;
    const(wchar)* pcwszContentClass;
}
enum IID_ISearchProtocol = GUID(0xc73106ba, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x4f]);
interface ISearchProtocol : IUnknown
{
    HRESULT Init(TIMEOUT_INFO*, IProtocolHandlerSite, PROXY_INFO*);
    HRESULT CreateAccessor(const(wchar)*, AUTHENTICATION_INFO*, INCREMENTAL_ACCESS_INFO*, ITEM_INFO*, IUrlAccessor*);
    HRESULT CloseAccessor(IUrlAccessor);
    HRESULT ShutDown();
}
enum IID_ISearchProtocol2 = GUID(0x7789f0b2, 0xb5b2, 0x4722, [0x8b, 0x65, 0x5d, 0xbd, 0x15, 0x6, 0x97, 0xa9]);
interface ISearchProtocol2 : ISearchProtocol
{
    HRESULT CreateAccessorEx(const(wchar)*, AUTHENTICATION_INFO*, INCREMENTAL_ACCESS_INFO*, ITEM_INFO*, const(BLOB)*, IUrlAccessor*);
}
enum IID_IProtocolHandlerSite = GUID(0xb63e385, 0x9ccc, 0x11d0, [0xbc, 0xdb, 0x0, 0x80, 0x5f, 0xcc, 0xce, 0x4]);
interface IProtocolHandlerSite : IUnknown
{
    HRESULT GetFilter(GUID*, const(wchar)*, const(wchar)*, IFilter*);
}
enum IID_ISearchRoot = GUID(0x4c18ccf, 0x1f57, 0x4cbd, [0x88, 0xcc, 0x39, 0x0, 0xf5, 0x19, 0x5c, 0xe3]);
interface ISearchRoot : IUnknown
{
    HRESULT put_Schedule(const(wchar)*);
    HRESULT get_Schedule(PWSTR*);
    HRESULT put_RootURL(const(wchar)*);
    HRESULT get_RootURL(PWSTR*);
    HRESULT put_IsHierarchical(BOOL);
    HRESULT get_IsHierarchical(BOOL*);
    HRESULT put_ProvidesNotifications(BOOL);
    HRESULT get_ProvidesNotifications(BOOL*);
    HRESULT put_UseNotificationsOnly(BOOL);
    HRESULT get_UseNotificationsOnly(BOOL*);
    HRESULT put_EnumerationDepth(uint);
    HRESULT get_EnumerationDepth(uint*);
    HRESULT put_HostDepth(uint);
    HRESULT get_HostDepth(uint*);
    HRESULT put_FollowDirectories(BOOL);
    HRESULT get_FollowDirectories(BOOL*);
    HRESULT put_AuthenticationType(AUTH_TYPE);
    HRESULT get_AuthenticationType(AUTH_TYPE*);
    HRESULT put_User(const(wchar)*);
    HRESULT get_User(PWSTR*);
    HRESULT put_Password(const(wchar)*);
    HRESULT get_Password(PWSTR*);
}
enum IID_IEnumSearchRoots = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x52]);
interface IEnumSearchRoots : IUnknown
{
    HRESULT Next(uint, ISearchRoot*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSearchRoots*);
}
alias FOLLOW_FLAGS = int;
enum : int
{
    FF_INDEXCOMPLEXURLS = 0x00000001,
    FF_SUPPRESSINDEXING = 0x00000002,
}

enum IID_ISearchScopeRule = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x53]);
interface ISearchScopeRule : IUnknown
{
    HRESULT get_PatternOrURL(PWSTR*);
    HRESULT get_IsIncluded(BOOL*);
    HRESULT get_IsDefault(BOOL*);
    HRESULT get_FollowFlags(uint*);
}
enum IID_IEnumSearchScopeRules = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x54]);
interface IEnumSearchScopeRules : IUnknown
{
    HRESULT Next(uint, ISearchScopeRule*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSearchScopeRules*);
}
alias CLUSION_REASON = int;
enum : int
{
    CLUSIONREASON_UNKNOWNSCOPE = 0x00000000,
    CLUSIONREASON_DEFAULT      = 0x00000001,
    CLUSIONREASON_USER         = 0x00000002,
    CLUSIONREASON_GROUPPOLICY  = 0x00000003,
}

enum IID_ISearchCrawlScopeManager = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x55]);
interface ISearchCrawlScopeManager : IUnknown
{
    HRESULT AddDefaultScopeRule(const(wchar)*, BOOL, uint);
    HRESULT AddRoot(ISearchRoot);
    HRESULT RemoveRoot(const(wchar)*);
    HRESULT EnumerateRoots(IEnumSearchRoots*);
    HRESULT AddHierarchicalScope(const(wchar)*, BOOL, BOOL, BOOL);
    HRESULT AddUserScopeRule(const(wchar)*, BOOL, BOOL, uint);
    HRESULT RemoveScopeRule(const(wchar)*);
    HRESULT EnumerateScopeRules(IEnumSearchScopeRules*);
    HRESULT HasParentScopeRule(const(wchar)*, BOOL*);
    HRESULT HasChildScopeRule(const(wchar)*, BOOL*);
    HRESULT IncludedInCrawlScope(const(wchar)*, BOOL*);
    HRESULT IncludedInCrawlScopeEx(const(wchar)*, BOOL*, CLUSION_REASON*);
    HRESULT RevertToDefaultScopes();
    HRESULT SaveAll();
    HRESULT GetParentScopeVersionId(const(wchar)*, int*);
    HRESULT RemoveDefaultScopeRule(const(wchar)*);
}
enum IID_ISearchCrawlScopeManager2 = GUID(0x6292f7ad, 0x4e19, 0x4717, [0xa5, 0x34, 0x8f, 0xc2, 0x2b, 0xcd, 0x5c, 0xcd]);
interface ISearchCrawlScopeManager2 : ISearchCrawlScopeManager
{
    HRESULT GetVersion(int**, HANDLE*);
}
alias SEARCH_KIND_OF_CHANGE = int;
enum : int
{
    SEARCH_CHANGE_ADD                       = 0x00000000,
    SEARCH_CHANGE_DELETE                    = 0x00000001,
    SEARCH_CHANGE_MODIFY                    = 0x00000002,
    SEARCH_CHANGE_MOVE_RENAME               = 0x00000003,
    SEARCH_CHANGE_SEMANTICS_DIRECTORY       = 0x00040000,
    SEARCH_CHANGE_SEMANTICS_SHALLOW         = 0x00080000,
    SEARCH_CHANGE_SEMANTICS_UPDATE_SECURITY = 0x00400000,
}

alias SEARCH_NOTIFICATION_PRIORITY = int;
enum : int
{
    SEARCH_NORMAL_PRIORITY = 0x00000000,
    SEARCH_HIGH_PRIORITY   = 0x00000001,
}

struct SEARCH_ITEM_CHANGE
{
    SEARCH_KIND_OF_CHANGE Change;
    SEARCH_NOTIFICATION_PRIORITY Priority;
    BLOB* pUserData;
    PWSTR lpwszURL;
    PWSTR lpwszOldURL;
}
enum IID_ISearchItemsChangedSink = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x58]);
interface ISearchItemsChangedSink : IUnknown
{
    HRESULT StartedMonitoringScope(const(wchar)*);
    HRESULT StoppedMonitoringScope(const(wchar)*);
    HRESULT OnItemsChanged(uint, SEARCH_ITEM_CHANGE*, uint*, HRESULT*);
}
struct SEARCH_ITEM_PERSISTENT_CHANGE
{
    SEARCH_KIND_OF_CHANGE Change;
    PWSTR URL;
    PWSTR OldURL;
    SEARCH_NOTIFICATION_PRIORITY Priority;
}
enum IID_ISearchPersistentItemsChangedSink = GUID(0xa2ffdf9b, 0x4758, 0x4f84, [0xb7, 0x29, 0xdf, 0x81, 0xa1, 0xa0, 0x61, 0x2f]);
interface ISearchPersistentItemsChangedSink : IUnknown
{
    HRESULT StartedMonitoringScope(const(wchar)*);
    HRESULT StoppedMonitoringScope(const(wchar)*);
    HRESULT OnItemsChanged(uint, SEARCH_ITEM_PERSISTENT_CHANGE*, HRESULT*);
}
enum IID_ISearchViewChangedSink = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x65]);
interface ISearchViewChangedSink : IUnknown
{
    HRESULT OnChange(int*, SEARCH_ITEM_CHANGE*, BOOL*);
}
alias SEARCH_INDEXING_PHASE = int;
enum : int
{
    SEARCH_INDEXING_PHASE_GATHERER  = 0x00000000,
    SEARCH_INDEXING_PHASE_QUERYABLE = 0x00000001,
    SEARCH_INDEXING_PHASE_PERSISTED = 0x00000002,
}

struct SEARCH_ITEM_INDEXING_STATUS
{
    uint dwDocID;
    HRESULT hrIndexingStatus;
}
enum IID_ISearchNotifyInlineSite = GUID(0xb5702e61, 0xe75c, 0x4b64, [0x82, 0xa1, 0x6c, 0xb4, 0xf8, 0x32, 0xfc, 0xcf]);
interface ISearchNotifyInlineSite : IUnknown
{
    HRESULT OnItemIndexedStatusChange(SEARCH_INDEXING_PHASE, uint, SEARCH_ITEM_INDEXING_STATUS*);
    HRESULT OnCatalogStatusChange(const(GUID)*, const(GUID)*, uint);
}
alias CatalogStatus = int;
enum : int
{
    CATALOG_STATUS_IDLE                     = 0x00000000,
    CATALOG_STATUS_PAUSED                   = 0x00000001,
    CATALOG_STATUS_RECOVERING               = 0x00000002,
    CATALOG_STATUS_FULL_CRAWL               = 0x00000003,
    CATALOG_STATUS_INCREMENTAL_CRAWL        = 0x00000004,
    CATALOG_STATUS_PROCESSING_NOTIFICATIONS = 0x00000005,
    CATALOG_STATUS_SHUTTING_DOWN            = 0x00000006,
}

alias CatalogPausedReason = int;
enum : int
{
    CATALOG_PAUSED_REASON_NONE             = 0x00000000,
    CATALOG_PAUSED_REASON_HIGH_IO          = 0x00000001,
    CATALOG_PAUSED_REASON_HIGH_CPU         = 0x00000002,
    CATALOG_PAUSED_REASON_HIGH_NTF_RATE    = 0x00000003,
    CATALOG_PAUSED_REASON_LOW_BATTERY      = 0x00000004,
    CATALOG_PAUSED_REASON_LOW_MEMORY       = 0x00000005,
    CATALOG_PAUSED_REASON_LOW_DISK         = 0x00000006,
    CATALOG_PAUSED_REASON_DELAYED_RECOVERY = 0x00000007,
    CATALOG_PAUSED_REASON_USER_ACTIVE      = 0x00000008,
    CATALOG_PAUSED_REASON_EXTERNAL         = 0x00000009,
    CATALOG_PAUSED_REASON_UPGRADING        = 0x0000000a,
}

enum IID_ISearchCatalogManager = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x50]);
interface ISearchCatalogManager : IUnknown
{
    HRESULT get_Name(PWSTR*);
    HRESULT GetParameter(const(wchar)*, PROPVARIANT**);
    HRESULT SetParameter(const(wchar)*, PROPVARIANT*);
    HRESULT GetCatalogStatus(CatalogStatus*, CatalogPausedReason*);
    HRESULT Reset();
    HRESULT Reindex();
    HRESULT ReindexMatchingURLs(const(wchar)*);
    HRESULT ReindexSearchRoot(const(wchar)*);
    HRESULT put_ConnectTimeout(uint);
    HRESULT get_ConnectTimeout(uint*);
    HRESULT put_DataTimeout(uint);
    HRESULT get_DataTimeout(uint*);
    HRESULT NumberOfItems(int*);
    HRESULT NumberOfItemsToIndex(int*, int*, int*);
    HRESULT URLBeingIndexed(PWSTR*);
    HRESULT GetURLIndexingState(const(wchar)*, uint*);
    HRESULT GetPersistentItemsChangedSink(ISearchPersistentItemsChangedSink*);
    HRESULT RegisterViewForNotification(const(wchar)*, ISearchViewChangedSink, uint*);
    HRESULT GetItemsChangedSink(ISearchNotifyInlineSite, const(GUID)*, void**, GUID*, GUID*, uint*);
    HRESULT UnregisterViewForNotification(uint);
    HRESULT SetExtensionClusion(const(wchar)*, BOOL);
    HRESULT EnumerateExcludedExtensions(IEnumString*);
    HRESULT GetQueryHelper(ISearchQueryHelper*);
    HRESULT put_DiacriticSensitivity(BOOL);
    HRESULT get_DiacriticSensitivity(BOOL*);
    HRESULT GetCrawlScopeManager(ISearchCrawlScopeManager*);
}
alias PRIORITIZE_FLAGS = int;
enum : int
{
    PRIORITIZE_FLAG_RETRYFAILEDITEMS   = 0x00000001,
    PRIORITIZE_FLAG_IGNOREFAILURECOUNT = 0x00000002,
}

enum IID_ISearchCatalogManager2 = GUID(0x7ac3286d, 0x4d1d, 0x4817, [0x84, 0xfc, 0xc1, 0xc8, 0x5e, 0x3a, 0xf0, 0xd9]);
interface ISearchCatalogManager2 : ISearchCatalogManager
{
    HRESULT PrioritizeMatchingURLs(const(wchar)*, PRIORITIZE_FLAGS);
}
alias SEARCH_TERM_EXPANSION = int;
enum : int
{
    SEARCH_TERM_NO_EXPANSION = 0x00000000,
    SEARCH_TERM_PREFIX_ALL   = 0x00000001,
    SEARCH_TERM_STEM_ALL     = 0x00000002,
}

alias SEARCH_QUERY_SYNTAX = int;
enum : int
{
    SEARCH_NO_QUERY_SYNTAX       = 0x00000000,
    SEARCH_ADVANCED_QUERY_SYNTAX = 0x00000001,
    SEARCH_NATURAL_QUERY_SYNTAX  = 0x00000002,
}

struct SEARCH_COLUMN_PROPERTIES
{
    PROPVARIANT Value;
    uint lcid;
}
enum IID_ISearchQueryHelper = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x63]);
interface ISearchQueryHelper : IUnknown
{
    HRESULT get_ConnectionString(PWSTR*);
    HRESULT put_QueryContentLocale(uint);
    HRESULT get_QueryContentLocale(uint*);
    HRESULT put_QueryKeywordLocale(uint);
    HRESULT get_QueryKeywordLocale(uint*);
    HRESULT put_QueryTermExpansion(SEARCH_TERM_EXPANSION);
    HRESULT get_QueryTermExpansion(SEARCH_TERM_EXPANSION*);
    HRESULT put_QuerySyntax(SEARCH_QUERY_SYNTAX);
    HRESULT get_QuerySyntax(SEARCH_QUERY_SYNTAX*);
    HRESULT put_QueryContentProperties(const(wchar)*);
    HRESULT get_QueryContentProperties(PWSTR*);
    HRESULT put_QuerySelectColumns(const(wchar)*);
    HRESULT get_QuerySelectColumns(PWSTR*);
    HRESULT put_QueryWhereRestrictions(const(wchar)*);
    HRESULT get_QueryWhereRestrictions(PWSTR*);
    HRESULT put_QuerySorting(const(wchar)*);
    HRESULT get_QuerySorting(PWSTR*);
    HRESULT GenerateSQLFromUserQuery(const(wchar)*, PWSTR*);
    HRESULT WriteProperties(int, uint, PROPERTYKEY*, SEARCH_COLUMN_PROPERTIES*, FILETIME*);
    HRESULT put_QueryMaxResults(int);
    HRESULT get_QueryMaxResults(int*);
}
alias PRIORITY_LEVEL = int;
enum : int
{
    PRIORITY_LEVEL_FOREGROUND = 0x00000000,
    PRIORITY_LEVEL_HIGH       = 0x00000001,
    PRIORITY_LEVEL_LOW        = 0x00000002,
    PRIORITY_LEVEL_DEFAULT    = 0x00000003,
}

enum IID_IRowsetPrioritization = GUID(0x42811652, 0x79d, 0x481b, [0x87, 0xa2, 0x9, 0xa6, 0x9e, 0xcc, 0x5f, 0x44]);
interface IRowsetPrioritization : IUnknown
{
    HRESULT SetScopePriority(PRIORITY_LEVEL, uint);
    HRESULT GetScopePriority(PRIORITY_LEVEL*, uint*);
    HRESULT GetScopeStatistics(uint*, uint*, uint*);
}
alias ROWSETEVENT_ITEMSTATE = int;
enum : int
{
    ROWSETEVENT_ITEMSTATE_NOTINROWSET = 0x00000000,
    ROWSETEVENT_ITEMSTATE_INROWSET    = 0x00000001,
    ROWSETEVENT_ITEMSTATE_UNKNOWN     = 0x00000002,
}

alias ROWSETEVENT_TYPE = int;
enum : int
{
    ROWSETEVENT_TYPE_DATAEXPIRED     = 0x00000000,
    ROWSETEVENT_TYPE_FOREGROUNDLOST  = 0x00000001,
    ROWSETEVENT_TYPE_SCOPESTATISTICS = 0x00000002,
}

enum IID_IRowsetEvents = GUID(0x1551aea5, 0x5d66, 0x4b11, [0x86, 0xf5, 0xd5, 0x63, 0x4c, 0xb2, 0x11, 0xb9]);
interface IRowsetEvents : IUnknown
{
    HRESULT OnNewItem(const(PROPVARIANT)*, ROWSETEVENT_ITEMSTATE);
    HRESULT OnChangedItem(const(PROPVARIANT)*, ROWSETEVENT_ITEMSTATE, ROWSETEVENT_ITEMSTATE);
    HRESULT OnDeletedItem(const(PROPVARIANT)*, ROWSETEVENT_ITEMSTATE);
    HRESULT OnRowsetEvent(ROWSETEVENT_TYPE, const(PROPVARIANT)*);
}
enum IID_ISearchManager = GUID(0xab310581, 0xac80, 0x11d1, [0x8d, 0xf3, 0x0, 0xc0, 0x4f, 0xb6, 0xef, 0x69]);
interface ISearchManager : IUnknown
{
    HRESULT GetIndexerVersionStr(PWSTR*);
    HRESULT GetIndexerVersion(uint*, uint*);
    HRESULT GetParameter(const(wchar)*, PROPVARIANT**);
    HRESULT SetParameter(const(wchar)*, const(PROPVARIANT)*);
    HRESULT get_ProxyName(PWSTR*);
    HRESULT get_BypassList(PWSTR*);
    HRESULT SetProxy(PROXY_ACCESS, BOOL, uint, const(wchar)*, const(wchar)*);
    HRESULT GetCatalog(const(wchar)*, ISearchCatalogManager*);
    HRESULT get_UserAgent(PWSTR*);
    HRESULT put_UserAgent(const(wchar)*);
    HRESULT get_UseProxy(PROXY_ACCESS*);
    HRESULT get_LocalBypass(BOOL*);
    HRESULT get_PortNumber(uint*);
}
enum IID_ISearchManager2 = GUID(0xdbab3f73, 0xdb19, 0x4a79, [0xbf, 0xc0, 0xa6, 0x1a, 0x93, 0x88, 0x6d, 0xdf]);
interface ISearchManager2 : ISearchManager
{
    HRESULT CreateCatalog(const(wchar)*, ISearchCatalogManager*);
    HRESULT DeleteCatalog(const(wchar)*);
}
enum CLSID_CSearchLanguageSupport = GUID(0x6a68cc80, 0x4337, 0x4dbc, [0xbd, 0x27, 0xfb, 0xfb, 0x10, 0x53, 0x82, 0xb]);
struct CSearchLanguageSupport
{
}
enum IID_ISearchLanguageSupport = GUID(0x24c3cbaa, 0xebc1, 0x491a, [0x9e, 0xf1, 0x9f, 0x6d, 0x8d, 0xeb, 0x1b, 0x8f]);
interface ISearchLanguageSupport : IUnknown
{
    HRESULT SetDiacriticSensitivity(BOOL);
    HRESULT GetDiacriticSensitivity(BOOL*);
    HRESULT LoadWordBreaker(uint, const(GUID)*, void**, uint*);
    HRESULT LoadStemmer(uint, const(GUID)*, void**, uint*);
    HRESULT IsPrefixNormalized(const(wchar)*, uint, const(wchar)*, uint, uint*);
}
enum CLSID_CSearchManager = GUID(0x7d096c5f, 0xac08, 0x4f1f, [0xbe, 0xb7, 0x5c, 0x22, 0xc5, 0x17, 0xce, 0x39]);
struct CSearchManager
{
}
enum CLSID_CSearchRoot = GUID(0x30766bd2, 0xea1c, 0x4f28, [0xbf, 0x27, 0xb, 0x44, 0xe2, 0xf6, 0x8d, 0xb7]);
struct CSearchRoot
{
}
enum CLSID_CSearchScopeRule = GUID(0xe63de750, 0x3bd7, 0x4be5, [0x9c, 0x84, 0x6b, 0x42, 0x81, 0x98, 0x8c, 0x44]);
struct CSearchScopeRule
{
}
enum CLSID_FilterRegistration = GUID(0x9e175b8d, 0xf52a, 0x11d8, [0xb9, 0xa5, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct FilterRegistration
{
}
struct ITEMPROP
{
    VARIANT variantValue;
    PWSTR pwszName;
}
enum IID_IEnumItemProperties = GUID(0xf72c8d96, 0x6dbd, 0x11d1, [0xa1, 0xe8, 0x0, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1]);
interface IEnumItemProperties : IUnknown
{
    HRESULT Next(uint, ITEMPROP*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumItemProperties*);
    HRESULT GetCount(uint*);
}
struct SUBSCRIPTIONITEMINFO
{
    uint cbSize;
    uint dwFlags;
    uint dwPriority;
    GUID ScheduleGroup;
    GUID clsidAgent;
}
enum IID_ISubscriptionItem = GUID(0xa97559f8, 0x6c4a, 0x11d1, [0xa1, 0xe8, 0x0, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1]);
interface ISubscriptionItem : IUnknown
{
    HRESULT GetCookie(GUID*);
    HRESULT GetSubscriptionItemInfo(SUBSCRIPTIONITEMINFO*);
    HRESULT SetSubscriptionItemInfo(const(SUBSCRIPTIONITEMINFO)*);
    HRESULT ReadProperties(uint, const(wchar)**, VARIANT*);
    HRESULT WriteProperties(uint, const(wchar)**, const(VARIANT)*);
    HRESULT EnumProperties(IEnumItemProperties*);
    HRESULT NotifyChanged();
}
enum IID_IEnumSubscription = GUID(0xf72c8d97, 0x6dbd, 0x11d1, [0xa1, 0xe8, 0x0, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1]);
interface IEnumSubscription : IUnknown
{
    HRESULT Next(uint, GUID*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSubscription*);
    HRESULT GetCount(uint*);
}
alias SUBSCRIPTIONTYPE = int;
enum : int
{
    SUBSTYPE_URL            = 0x00000000,
    SUBSTYPE_CHANNEL        = 0x00000001,
    SUBSTYPE_DESKTOPURL     = 0x00000002,
    SUBSTYPE_EXTERNAL       = 0x00000003,
    SUBSTYPE_DESKTOPCHANNEL = 0x00000004,
}

alias SUBSCRIPTIONINFOFLAGS = int;
enum : int
{
    SUBSINFO_SCHEDULE     = 0x00000001,
    SUBSINFO_RECURSE      = 0x00000002,
    SUBSINFO_WEBCRAWL     = 0x00000004,
    SUBSINFO_MAILNOT      = 0x00000008,
    SUBSINFO_MAXSIZEKB    = 0x00000010,
    SUBSINFO_USER         = 0x00000020,
    SUBSINFO_PASSWORD     = 0x00000040,
    SUBSINFO_TASKFLAGS    = 0x00000100,
    SUBSINFO_GLEAM        = 0x00000200,
    SUBSINFO_CHANGESONLY  = 0x00000400,
    SUBSINFO_CHANNELFLAGS = 0x00000800,
    SUBSINFO_FRIENDLYNAME = 0x00002000,
    SUBSINFO_NEEDPASSWORD = 0x00004000,
    SUBSINFO_TYPE         = 0x00008000,
}

alias CREATESUBSCRIPTIONFLAGS = int;
enum : int
{
    CREATESUBS_ADDTOFAVORITES = 0x00000001,
    CREATESUBS_FROMFAVORITES  = 0x00000002,
    CREATESUBS_NOUI           = 0x00000004,
    CREATESUBS_NOSAVE         = 0x00000008,
    CREATESUBS_SOFTWAREUPDATE = 0x00000010,
}

alias SUBSCRIPTIONSCHEDULE = int;
enum : int
{
    SUBSSCHED_AUTO   = 0x00000000,
    SUBSSCHED_DAILY  = 0x00000001,
    SUBSSCHED_WEEKLY = 0x00000002,
    SUBSSCHED_CUSTOM = 0x00000003,
    SUBSSCHED_MANUAL = 0x00000004,
}

struct SUBSCRIPTIONINFO
{
    uint cbSize;
    uint fUpdateFlags;
    SUBSCRIPTIONSCHEDULE schedule;
    GUID customGroupCookie;
    void* pTrigger;
    uint dwRecurseLevels;
    uint fWebcrawlerFlags;
    BOOL bMailNotification;
    BOOL bGleam;
    BOOL bChangesOnly;
    BOOL bNeedPassword;
    uint fChannelFlags;
    BSTR bstrUserName;
    BSTR bstrPassword;
    BSTR bstrFriendlyName;
    uint dwMaxSizeKB;
    SUBSCRIPTIONTYPE subType;
    uint fTaskFlags;
    uint dwReserved;
}
enum IID_ISubscriptionMgr = GUID(0x85fb2c0, 0xdf8, 0x11d1, [0x8f, 0x4b, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x3f]);
interface ISubscriptionMgr : IUnknown
{
    HRESULT DeleteSubscription(const(wchar)*, HWND);
    HRESULT UpdateSubscription(const(wchar)*);
    HRESULT UpdateAll();
    HRESULT IsSubscribed(const(wchar)*, BOOL*);
    HRESULT GetSubscriptionInfo(const(wchar)*, SUBSCRIPTIONINFO*);
    HRESULT GetDefaultInfo(SUBSCRIPTIONTYPE, SUBSCRIPTIONINFO*);
    HRESULT ShowSubscriptionProperties(const(wchar)*, HWND);
    HRESULT CreateSubscription(HWND, const(wchar)*, const(wchar)*, uint, SUBSCRIPTIONTYPE, SUBSCRIPTIONINFO*);
}
enum IID_ISubscriptionMgr2 = GUID(0x614bc270, 0xaedf, 0x11d1, [0xa1, 0xf9, 0x0, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1]);
interface ISubscriptionMgr2 : ISubscriptionMgr
{
    HRESULT GetItemFromURL(const(wchar)*, ISubscriptionItem*);
    HRESULT GetItemFromCookie(const(GUID)*, ISubscriptionItem*);
    HRESULT GetSubscriptionRunState(uint, const(GUID)*, uint*);
    HRESULT EnumSubscriptions(uint, IEnumSubscription*);
    HRESULT UpdateItems(uint, uint, const(GUID)*);
    HRESULT AbortItems(uint, const(GUID)*);
    HRESULT AbortAll();
}
enum CLSID_SubscriptionMgr = GUID(0xabbe31d0, 0x6dae, 0x11d0, [0xbe, 0xca, 0x0, 0xc0, 0x4f, 0xd9, 0x40, 0xbe]);
struct SubscriptionMgr
{
}
alias DELIVERY_AGENT_FLAGS = int;
enum : int
{
    DELIVERY_AGENT_FLAG_NO_BROADCAST    = 0x00000004,
    DELIVERY_AGENT_FLAG_NO_RESTRICTIONS = 0x00000008,
    DELIVERY_AGENT_FLAG_SILENT_DIAL     = 0x00000010,
}

alias WEBCRAWL_RECURSEFLAGS = int;
enum : int
{
    WEBCRAWL_DONT_MAKE_STICKY   = 0x00000001,
    WEBCRAWL_GET_IMAGES         = 0x00000002,
    WEBCRAWL_GET_VIDEOS         = 0x00000004,
    WEBCRAWL_GET_BGSOUNDS       = 0x00000008,
    WEBCRAWL_GET_CONTROLS       = 0x00000010,
    WEBCRAWL_LINKS_ELSEWHERE    = 0x00000020,
    WEBCRAWL_IGNORE_ROBOTSTXT   = 0x00000080,
    WEBCRAWL_ONLY_LINKS_TO_HTML = 0x00000100,
}

alias CHANNEL_AGENT_FLAGS = int;
enum : int
{
    CHANNEL_AGENT_DYNAMIC_SCHEDULE   = 0x00000001,
    CHANNEL_AGENT_PRECACHE_SOME      = 0x00000002,
    CHANNEL_AGENT_PRECACHE_ALL       = 0x00000004,
    CHANNEL_AGENT_PRECACHE_SCRNSAVER = 0x00000008,
}

alias DBDATACONVERTENUM = int;
enum : int
{
    DBDATACONVERT_DEFAULT          = 0x00000000,
    DBDATACONVERT_SETDATABEHAVIOR  = 0x00000001,
    DBDATACONVERT_LENGTHFROMNTS    = 0x00000002,
    DBDATACONVERT_DSTISFIXEDLENGTH = 0x00000004,
    DBDATACONVERT_DECIMALSCALE     = 0x00000008,
}

enum IID_IDataConvert = GUID(0xc733a8d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDataConvert : IUnknown
{
    HRESULT DataConvert(ushort, ushort, ulong, ulong*, void*, void*, ulong, uint, uint*, ubyte, ubyte, uint);
    HRESULT CanConvert(ushort, ushort);
    HRESULT GetConversionSize(ushort, ushort, ulong*, ulong*, void*);
}
alias DCINFOTYPEENUM = int;
enum : int
{
    DCINFOTYPE_VERSION = 0x00000001,
}

struct DCINFO
{
    uint eInfoType;
    VARIANT vData;
}
enum IID_IDCInfo = GUID(0xc733a9c, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDCInfo : IUnknown
{
    HRESULT GetInfo(uint, uint*, DCINFO**);
    HRESULT SetInfo(uint, DCINFO*);
}
enum CLSID_MSDAORA = GUID(0xe8cc4cbe, 0xfdff, 0x11d0, [0xb8, 0x65, 0x0, 0xa0, 0xc9, 0x8, 0x1c, 0x1d]);
struct MSDAORA
{
}
enum CLSID_MSDAORA_ERROR = GUID(0xe8cc4cbf, 0xfdff, 0x11d0, [0xb8, 0x65, 0x0, 0xa0, 0xc9, 0x8, 0x1c, 0x1d]);
struct MSDAORA_ERROR
{
}
enum CLSID_MSDAORA8 = GUID(0x7f06a373, 0xdd6a, 0x43db, [0xb4, 0xe0, 0x1f, 0xc1, 0x21, 0xe5, 0xe6, 0x2b]);
struct MSDAORA8
{
}
enum CLSID_MSDAORA8_ERROR = GUID(0x7f06a374, 0xdd6a, 0x43db, [0xb4, 0xe0, 0x1f, 0xc1, 0x21, 0xe5, 0xe6, 0x2b]);
struct MSDAORA8_ERROR
{
}
enum IID_DataSourceListener = GUID(0x7c0ffab2, 0xcd84, 0x11d0, [0x94, 0x9a, 0x0, 0xa0, 0xc9, 0x11, 0x10, 0xed]);
interface DataSourceListener : IUnknown
{
    HRESULT dataMemberChanged(ushort*);
    HRESULT dataMemberAdded(ushort*);
    HRESULT dataMemberRemoved(ushort*);
}
enum IID_DataSource = GUID(0x7c0ffab3, 0xcd84, 0x11d0, [0x94, 0x9a, 0x0, 0xa0, 0xc9, 0x11, 0x10, 0xed]);
interface DataSource : IUnknown
{
    HRESULT getDataMember(ushort*, const(GUID)*, IUnknown*);
    HRESULT getDataMemberName(int, ushort**);
    HRESULT getDataMemberCount(int*);
    HRESULT addDataSourceListener(DataSourceListener);
    HRESULT removeDataSourceListener(DataSourceListener);
}
alias OSPFORMAT = int;
enum : int
{
    OSPFORMAT_RAW       = 0x00000000,
    OSPFORMAT_DEFAULT   = 0x00000000,
    OSPFORMAT_FORMATTED = 0x00000001,
    OSPFORMAT_HTML      = 0x00000002,
}

alias OSPRW = int;
enum : int
{
    OSPRW_DEFAULT   = 0x00000001,
    OSPRW_READONLY  = 0x00000000,
    OSPRW_READWRITE = 0x00000001,
    OSPRW_MIXED     = 0x00000002,
}

alias OSPFIND = int;
enum : int
{
    OSPFIND_DEFAULT         = 0x00000000,
    OSPFIND_UP              = 0x00000001,
    OSPFIND_CASESENSITIVE   = 0x00000002,
    OSPFIND_UPCASESENSITIVE = 0x00000003,
}

alias OSPCOMP = int;
enum : int
{
    OSPCOMP_EQ      = 0x00000001,
    OSPCOMP_DEFAULT = 0x00000001,
    OSPCOMP_LT      = 0x00000002,
    OSPCOMP_LE      = 0x00000003,
    OSPCOMP_GE      = 0x00000004,
    OSPCOMP_GT      = 0x00000005,
    OSPCOMP_NE      = 0x00000006,
}

alias OSPXFER = int;
enum : int
{
    OSPXFER_COMPLETE = 0x00000000,
    OSPXFER_ABORT    = 0x00000001,
    OSPXFER_ERROR    = 0x00000002,
}

enum IID_OLEDBSimpleProviderListener = GUID(0xe0e270c1, 0xc0be, 0x11d0, [0x8f, 0xe4, 0x0, 0xa0, 0xc9, 0xa, 0x63, 0x41]);
interface OLEDBSimpleProviderListener : IUnknown
{
    HRESULT aboutToChangeCell(long, long);
    HRESULT cellChanged(long, long);
    HRESULT aboutToDeleteRows(long, long);
    HRESULT deletedRows(long, long);
    HRESULT aboutToInsertRows(long, long);
    HRESULT insertedRows(long, long);
    HRESULT rowsAvailable(long, long);
    HRESULT transferComplete(OSPXFER);
}
enum IID_OLEDBSimpleProvider = GUID(0xe0e270c0, 0xc0be, 0x11d0, [0x8f, 0xe4, 0x0, 0xa0, 0xc9, 0xa, 0x63, 0x41]);
interface OLEDBSimpleProvider : IUnknown
{
    HRESULT getRowCount(long*);
    HRESULT getColumnCount(long*);
    HRESULT getRWStatus(long, long, OSPRW*);
    HRESULT getVariant(long, long, OSPFORMAT, VARIANT*);
    HRESULT setVariant(long, long, OSPFORMAT, VARIANT);
    HRESULT getLocale(BSTR*);
    HRESULT deleteRows(long, long, long*);
    HRESULT insertRows(long, long, long*);
    HRESULT find(long, long, VARIANT, OSPFIND, OSPCOMP, long*);
    HRESULT addOLEDBSimpleProviderListener(OLEDBSimpleProviderListener);
    HRESULT removeOLEDBSimpleProviderListener(OLEDBSimpleProviderListener);
    HRESULT isAsync(BOOL*);
    HRESULT getEstimatedRows(long*);
    HRESULT stopTransfer();
}
enum IID_DataSourceObject = GUID(0xae9a4e4, 0x18d4, 0x11d1, [0xb3, 0xb3, 0x0, 0xaa, 0x0, 0xc1, 0xa9, 0x24]);
interface DataSourceObject : IDispatch
{
}
alias EBindInfoOptions = int;
enum : int
{
    BIO_BINDER = 0x00000001,
}

enum IID_IService = GUID(0x6210e88, 0x1f5, 0x11d1, [0xb5, 0x12, 0x0, 0x80, 0xc7, 0x81, 0xc3, 0x84]);
interface IService : IUnknown
{
    HRESULT InvokeService(IUnknown);
}
alias DBPROMPTOPTIONSENUM = int;
enum : int
{
    DBPROMPTOPTIONS_NONE                       = 0x00000000,
    DBPROMPTOPTIONS_WIZARDSHEET                = 0x00000001,
    DBPROMPTOPTIONS_PROPERTYSHEET              = 0x00000002,
    DBPROMPTOPTIONS_BROWSEONLY                 = 0x00000008,
    DBPROMPTOPTIONS_DISABLE_PROVIDER_SELECTION = 0x00000010,
    DBPROMPTOPTIONS_DISABLESAVEPASSWORD        = 0x00000020,
}

enum IID_IDBPromptInitialize = GUID(0x2206ccb0, 0x19c1, 0x11d1, [0x89, 0xe0, 0x0, 0xc0, 0x4f, 0xd7, 0xa8, 0x29]);
interface IDBPromptInitialize : IUnknown
{
    HRESULT PromptDataSource(IUnknown, HWND, uint, uint, uint*, const(wchar)*, const(GUID)*, IUnknown*);
    HRESULT PromptFileName(HWND, uint, const(wchar)*, const(wchar)*, PWSTR*);
}
enum IID_IDataInitialize = GUID(0x2206ccb1, 0x19c1, 0x11d1, [0x89, 0xe0, 0x0, 0xc0, 0x4f, 0xd7, 0xa8, 0x29]);
interface IDataInitialize : IUnknown
{
    HRESULT GetDataSource(IUnknown, uint, const(wchar)*, const(GUID)*, IUnknown*);
    HRESULT GetInitializationString(IUnknown, ubyte, PWSTR*);
    HRESULT CreateDBInstance(const(GUID)*, IUnknown, uint, PWSTR, const(GUID)*, IUnknown*);
    HRESULT CreateDBInstanceEx(const(GUID)*, IUnknown, uint, PWSTR, COSERVERINFO*, uint, MULTI_QI*);
    HRESULT LoadStringFromStorage(const(wchar)*, PWSTR*);
    HRESULT WriteStringToStorage(const(wchar)*, const(wchar)*, uint);
}
enum IID_IDataSourceLocator = GUID(0x2206ccb2, 0x19c1, 0x11d1, [0x89, 0xe0, 0x0, 0xc0, 0x4f, 0xd7, 0xa8, 0x29]);
interface IDataSourceLocator : IDispatch
{
    HRESULT get_hWnd(HWND*);
    HRESULT put_hWnd(HWND);
    HRESULT PromptNew(IDispatch*);
    HRESULT PromptEdit(IDispatch*, VARIANT_BOOL*);
}
enum CLSID_DataLinks = GUID(0x2206cdb2, 0x19c1, 0x11d1, [0x89, 0xe0, 0x0, 0xc0, 0x4f, 0xd7, 0xa8, 0x29]);
struct DataLinks
{
}
enum CLSID_MSDAINITIALIZE = GUID(0x2206cdb0, 0x19c1, 0x11d1, [0x89, 0xe0, 0x0, 0xc0, 0x4f, 0xd7, 0xa8, 0x29]);
struct MSDAINITIALIZE
{
}
enum CLSID_PDPO = GUID(0xccb4ec60, 0xb9dc, 0x11d1, [0xac, 0x80, 0x0, 0xa0, 0xc9, 0x3, 0x48, 0x73]);
struct PDPO
{
}
enum CLSID_RootBinder = GUID(0xff151822, 0xb0bf, 0x11d1, [0xa8, 0xd, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
struct RootBinder
{
}
alias KAGREQDIAGFLAGSENUM = int;
enum : int
{
    KAGREQDIAGFLAGS_HEADER = 0x00000001,
    KAGREQDIAGFLAGS_RECORD = 0x00000002,
}

enum IID_IRowsetChangeExtInfo = GUID(0xc733a8f, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetChangeExtInfo : IUnknown
{
    HRESULT GetOriginalRow(ulong, ulong, ulong*);
    HRESULT GetPendingColumns(ulong, ulong, uint, const(uint)*, uint*);
}
struct KAGREQDIAG
{
    uint ulDiagFlags;
    VARENUM vt;
    short sDiagField;
}
struct KAGGETDIAG
{
    uint ulSize;
    VARIANT vDiagInfo;
    short sDiagField;
}
enum IID_ISQLRequestDiagFields = GUID(0x228972f0, 0xb5ff, 0x11d0, [0x8a, 0x80, 0x0, 0xc0, 0x4f, 0xd6, 0x11, 0xcd]);
interface ISQLRequestDiagFields : IUnknown
{
    HRESULT RequestDiagFields(uint, KAGREQDIAG*);
}
enum IID_ISQLGetDiagField = GUID(0x228972f1, 0xb5ff, 0x11d0, [0x8a, 0x80, 0x0, 0xc0, 0x4f, 0xd6, 0x11, 0xcd]);
interface ISQLGetDiagField : IUnknown
{
    HRESULT GetDiagField(KAGGETDIAG*);
}
alias MSDSDBINITPROPENUM = int;
enum : int
{
    DBPROP_MSDS_DBINIT_DATAPROVIDER = 0x00000002,
}

alias MSDSSESSIONPROPENUM = int;
enum : int
{
    DBPROP_MSDS_SESS_UNIQUENAMES = 0x00000002,
}

struct DATE_STRUCT
{
    short year;
    ushort month;
    ushort day;
}
struct TIME_STRUCT
{
    ushort hour;
    ushort minute;
    ushort second;
}
struct TIMESTAMP_STRUCT
{
    short year;
    ushort month;
    ushort day;
    ushort hour;
    ushort minute;
    ushort second;
    uint fraction;
}
alias SQLINTERVAL = int;
enum : int
{
    SQL_IS_YEAR             = 0x00000001,
    SQL_IS_MONTH            = 0x00000002,
    SQL_IS_DAY              = 0x00000003,
    SQL_IS_HOUR             = 0x00000004,
    SQL_IS_MINUTE           = 0x00000005,
    SQL_IS_SECOND           = 0x00000006,
    SQL_IS_YEAR_TO_MONTH    = 0x00000007,
    SQL_IS_DAY_TO_HOUR      = 0x00000008,
    SQL_IS_DAY_TO_MINUTE    = 0x00000009,
    SQL_IS_DAY_TO_SECOND    = 0x0000000a,
    SQL_IS_HOUR_TO_MINUTE   = 0x0000000b,
    SQL_IS_HOUR_TO_SECOND   = 0x0000000c,
    SQL_IS_MINUTE_TO_SECOND = 0x0000000d,
}

struct SQL_YEAR_MONTH_STRUCT
{
    uint year;
    uint month;
}
struct SQL_DAY_SECOND_STRUCT
{
    uint day;
    uint hour;
    uint minute;
    uint second;
    uint fraction;
}
struct SQL_INTERVAL_STRUCT
{
    SQLINTERVAL interval_type;
    short interval_sign;
    union _intval_e__Union
    {
        SQL_YEAR_MONTH_STRUCT year_month;
        SQL_DAY_SECOND_STRUCT day_second;
    }
}
struct SQL_NUMERIC_STRUCT
{
    ubyte precision;
    byte scale;
    ubyte sign;
    ubyte[16] val;
}
struct DBVARYCHAR
{
    short len;
    byte[8001] str;
}
struct DBVARYBIN
{
    short len;
    ubyte[8001] array;
}
struct DBMONEY
{
    int mnyhigh;
    uint mnylow;
}
struct DBDATETIME
{
    int dtdays;
    uint dttime;
}
struct DBDATETIM4
{
    ushort numdays;
    ushort nummins;
}
struct SQLPERF
{
    uint TimerResolution;
    uint SQLidu;
    uint SQLiduRows;
    uint SQLSelects;
    uint SQLSelectRows;
    uint Transactions;
    uint SQLPrepares;
    uint ExecDirects;
    uint SQLExecutes;
    uint CursorOpens;
    uint CursorSize;
    uint CursorUsed;
    double PercentCursorUsed;
    double AvgFetchTime;
    double AvgCursorSize;
    double AvgCursorUsed;
    uint SQLFetchTime;
    uint SQLFetchCount;
    uint CurrentStmtCount;
    uint MaxOpenStmt;
    uint SumOpenStmt;
    uint CurrentConnectionCount;
    uint MaxConnectionsOpened;
    uint SumConnectionsOpened;
    uint SumConnectiontime;
    double AvgTimeOpened;
    uint ServerRndTrips;
    uint BuffersSent;
    uint BuffersRec;
    uint BytesSent;
    uint BytesRec;
    uint msExecutionTime;
    uint msNetWorkServerTime;
}
alias DBPROPENUM25_DEPRECATED = int;
enum : int
{
    DBPROP_ICommandCost          = 0x0000008d,
    DBPROP_ICommandTree          = 0x0000008e,
    DBPROP_ICommandValidate      = 0x0000008f,
    DBPROP_IDBSchemaCommand      = 0x00000090,
    DBPROP_IProvideMoniker       = 0x0000007d,
    DBPROP_IQuery                = 0x00000092,
    DBPROP_IReadData             = 0x00000093,
    DBPROP_IRowsetAsynch         = 0x00000094,
    DBPROP_IRowsetCopyRows       = 0x00000095,
    DBPROP_IRowsetKeys           = 0x00000097,
    DBPROP_IRowsetNewRowAfter    = 0x00000098,
    DBPROP_IRowsetNextRowset     = 0x00000099,
    DBPROP_IRowsetWatchAll       = 0x0000009b,
    DBPROP_IRowsetWatchNotify    = 0x0000009c,
    DBPROP_IRowsetWatchRegion    = 0x0000009d,
    DBPROP_IRowsetWithParameters = 0x0000009e,
}

alias DBREASONENUM25 = int;
enum : int
{
    DBREASON_ROWSET_ROWSADDED          = 0x00000013,
    DBREASON_ROWSET_POPULATIONCOMPLETE = 0x00000014,
    DBREASON_ROWSET_POPULATIONSTOPPED  = 0x00000015,
}

enum IID_IRowsetNextRowset = GUID(0xc733a72, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetNextRowset : IUnknown
{
    HRESULT GetNextRowset(IUnknown, const(GUID)*, IUnknown*);
}
enum IID_IRowsetNewRowAfter = GUID(0xc733a71, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetNewRowAfter : IUnknown
{
    HRESULT SetNewDataAfter(ulong, uint, const(ubyte)*, HACCESSOR, ubyte*, ulong*);
}
enum IID_IRowsetWithParameters = GUID(0xc733a6e, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetWithParameters : IUnknown
{
    HRESULT GetParameterInfo(ulong*, DBPARAMINFO**, ushort**);
    HRESULT Requery(DBPARAMS*, uint*, ulong*);
}
enum IID_IRowsetAsynch = GUID(0xc733a0f, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetAsynch : IUnknown
{
    HRESULT RatioFinished(ulong*, ulong*, ulong*, BOOL*);
    HRESULT Stop();
}
enum IID_IRowsetKeys = GUID(0xc733a12, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetKeys : IUnknown
{
    HRESULT ListKeys(ulong*, ulong**);
}
enum IID_IRowsetWatchAll = GUID(0xc733a73, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetWatchAll : IUnknown
{
    HRESULT Acknowledge();
    HRESULT Start();
    HRESULT StopWatching();
}
alias DBWATCHNOTIFYENUM = int;
enum : int
{
    DBWATCHNOTIFY_ROWSCHANGED     = 0x00000001,
    DBWATCHNOTIFY_QUERYDONE       = 0x00000002,
    DBWATCHNOTIFY_QUERYREEXECUTED = 0x00000003,
}

enum IID_IRowsetWatchNotify = GUID(0xc733a44, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetWatchNotify : IUnknown
{
    HRESULT OnChange(IRowset, uint);
}
alias DBWATCHMODEENUM = int;
enum : int
{
    DBWATCHMODE_ALL    = 0x00000001,
    DBWATCHMODE_EXTEND = 0x00000002,
    DBWATCHMODE_MOVE   = 0x00000004,
    DBWATCHMODE_COUNT  = 0x00000008,
}

alias DBROWCHANGEKINDENUM = int;
enum : int
{
    DBROWCHANGEKIND_INSERT = 0x00000000,
    DBROWCHANGEKIND_DELETE = 0x00000001,
    DBROWCHANGEKIND_UPDATE = 0x00000002,
    DBROWCHANGEKIND_COUNT  = 0x00000003,
}

/+ [CONFLICTED] struct DBROWWATCHCHANGE
{
    align (2):
    ulong hRegion;
    uint eChangeKind;
    ulong hRow;
    ulong iRow;
}
+/
enum IID_IRowsetWatchRegion = GUID(0xc733a45, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetWatchRegion : IRowsetWatchAll
{
    HRESULT CreateWatchRegion(uint, ulong*);
    HRESULT ChangeWatchMode(ulong, uint);
    HRESULT DeleteWatchRegion(ulong);
    HRESULT GetWatchRegionInfo(ulong, uint*, ulong*, ulong*, ubyte**, long*);
    HRESULT Refresh(ulong*, DBROWWATCHCHANGE**);
    HRESULT ShrinkWatchRegion(ulong, ulong, ulong, ubyte*, long);
}
enum IID_IRowsetCopyRows = GUID(0xc733a6b, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IRowsetCopyRows : IUnknown
{
    HRESULT CloseSource(ushort);
    HRESULT CopyByHROWS(ushort, ulong, long, const(ulong)*, uint);
    HRESULT CopyRows(ushort, ulong, long, uint, ulong*);
    HRESULT DefineSource(const(IRowset), const(ulong), const(long)*, const(long)*, ushort*);
}
enum IID_IReadData = GUID(0xc733a6a, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IReadData : IUnknown
{
    HRESULT ReadData(ulong, ulong, const(ubyte)*, long, HACCESSOR, long, ulong*, ubyte**, ulong*, ubyte**);
    HRESULT ReleaseChapter(ulong);
}
alias DBRESOURCEKINDENUM = int;
enum : int
{
    DBRESOURCE_INVALID  = 0x00000000,
    DBRESOURCE_TOTAL    = 0x00000001,
    DBRESOURCE_CPU      = 0x00000002,
    DBRESOURCE_MEMORY   = 0x00000003,
    DBRESOURCE_DISK     = 0x00000004,
    DBRESOURCE_NETWORK  = 0x00000005,
    DBRESOURCE_RESPONSE = 0x00000006,
    DBRESOURCE_ROWS     = 0x00000007,
    DBRESOURCE_OTHER    = 0x00000008,
}

alias DBCOSTUNITENUM = int;
enum : int
{
    DBUNIT_INVALID      = 0x00000000,
    DBUNIT_WEIGHT       = 0x00000001,
    DBUNIT_PERCENT      = 0x00000002,
    DBUNIT_MAXIMUM      = 0x00000004,
    DBUNIT_MINIMUM      = 0x00000008,
    DBUNIT_MICRO_SECOND = 0x00000010,
    DBUNIT_MILLI_SECOND = 0x00000020,
    DBUNIT_SECOND       = 0x00000040,
    DBUNIT_MINUTE       = 0x00000080,
    DBUNIT_HOUR         = 0x00000100,
    DBUNIT_BYTE         = 0x00000200,
    DBUNIT_KILO_BYTE    = 0x00000400,
    DBUNIT_MEGA_BYTE    = 0x00000800,
    DBUNIT_GIGA_BYTE    = 0x00001000,
    DBUNIT_NUM_MSGS     = 0x00002000,
    DBUNIT_NUM_LOCKS    = 0x00004000,
    DBUNIT_NUM_ROWS     = 0x00008000,
    DBUNIT_OTHER        = 0x00010000,
}

/+ [CONFLICTED] struct DBCOST
{
    align (2):
    uint eKind;
    uint dwUnits;
    int lValue;
}
+/
alias DBEXECLIMITSENUM = int;
enum : int
{
    DBEXECLIMITS_ABORT   = 0x00000001,
    DBEXECLIMITS_STOP    = 0x00000002,
    DBEXECLIMITS_SUSPEND = 0x00000003,
}

enum IID_ICommandCost = GUID(0xc733a4e, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandCost : IUnknown
{
    HRESULT GetAccumulatedCost(const(wchar)*, uint*, DBCOST**);
    HRESULT GetCostEstimate(const(wchar)*, uint*, DBCOST*);
    HRESULT GetCostGoals(const(wchar)*, uint*, DBCOST*);
    HRESULT GetCostLimits(const(wchar)*, uint*, DBCOST*);
    HRESULT SetCostGoals(const(wchar)*, uint, const(DBCOST)*);
    HRESULT SetCostLimits(const(wchar)*, uint, DBCOST*, uint);
}
enum IID_ICommandValidate = GUID(0xc733a18, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICommandValidate : IUnknown
{
    HRESULT ValidateCompletely();
    HRESULT ValidateSyntax();
}
enum IID_ITableRename = GUID(0xc733a77, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ITableRename : IUnknown
{
    HRESULT RenameColumn(DBID*, DBID*, DBID*);
    HRESULT RenameTable(DBID*, DBID*, DBID*, DBID*);
}
enum IID_IDBSchemaCommand = GUID(0xc733a50, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IDBSchemaCommand : IUnknown
{
    HRESULT GetCommand(IUnknown, const(GUID)*, ICommand*);
    HRESULT GetSchemas(uint*, GUID**);
}
enum IID_IProvideMoniker = GUID(0xc733a4d, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface IProvideMoniker : IUnknown
{
    HRESULT GetMoniker(IMoniker*);
}
struct NOTRESTRICTION
{
    RESTRICTION* pRes;
}
struct NODERESTRICTION
{
    uint cRes;
    RESTRICTION** paRes;
    uint reserved;
}
struct VECTORRESTRICTION
{
    NODERESTRICTION Node;
    uint RankMethod;
}
struct CONTENTRESTRICTION
{
    FULLPROPSPEC prop;
    PWSTR pwcsPhrase;
    uint lcid;
    uint ulGenerateMethod;
}
struct NATLANGUAGERESTRICTION
{
    FULLPROPSPEC prop;
    PWSTR pwcsPhrase;
    uint lcid;
}
struct PROPERTYRESTRICTION
{
    uint rel;
    FULLPROPSPEC prop;
    PROPVARIANT prval;
}
struct RESTRICTION
{
    uint rt;
    uint weight;
    union _URes
    {
        NODERESTRICTION ar;
        NODERESTRICTION orRestriction;
        NODERESTRICTION pxr;
        VECTORRESTRICTION vr;
        NOTRESTRICTION nr;
        CONTENTRESTRICTION cr;
        NATLANGUAGERESTRICTION nlr;
        PROPERTYRESTRICTION pr;
    }
}
struct COLUMNSET
{
    uint cCol;
    FULLPROPSPEC* aCol;
}
struct SORTKEY
{
    FULLPROPSPEC propColumn;
    uint dwOrder;
    uint locale;
}
struct SORTSET
{
    uint cCol;
    SORTKEY* aCol;
}
struct BUCKETCATEGORIZE
{
    uint cBuckets;
    uint Distribution;
}
struct RANGECATEGORIZE
{
    uint cRange;
    PROPVARIANT* aRangeBegin;
}
struct CATEGORIZATION
{
    uint ulCatType;
    union
    {
        uint cClusters;
        BUCKETCATEGORIZE bucket;
        RANGECATEGORIZE range;
    }
    COLUMNSET csColumns;
}
struct CATEGORIZATIONSET
{
    uint cCat;
    CATEGORIZATION* aCat;
}
enum IID_ISearchQueryHits = GUID(0xed8ce7e0, 0x106c, 0x11ce, [0x84, 0xe2, 0x0, 0xaa, 0x0, 0x4b, 0x99, 0x86]);
interface ISearchQueryHits : IUnknown
{
    int Init(IFilter, uint);
    int NextHitMoniker(uint*, IMoniker**);
    int NextHitOffset(uint*, FILTERREGION**);
}
enum IID_IRowsetQueryStatus = GUID(0xa7ac77ed, 0xf8d7, 0x11ce, [0xa7, 0x98, 0x0, 0x20, 0xf8, 0x0, 0x80, 0x24]);
interface IRowsetQueryStatus : IUnknown
{
    HRESULT GetStatus(uint*);
    HRESULT GetStatusEx(uint*, uint*, uint*, ulong*, ulong*, ulong, const(ubyte)*, ulong*, ulong*);
}
struct ODBC_VS_ARGS
{
    const(GUID)* pguidEvent;
    uint dwFlags;
    union
    {
        PWSTR wszArg;
        PSTR szArg;
    }
    union
    {
        PWSTR wszCorrelation;
        PSTR szCorrelation;
    }
    short RetCode;
}
alias SQLVARENUM = int;
enum : int
{
    VT_SS_EMPTY         = 0x00000000,
    VT_SS_NULL          = 0x00000001,
    VT_SS_UI1           = 0x00000011,
    VT_SS_I2            = 0x00000002,
    VT_SS_I4            = 0x00000003,
    VT_SS_I8            = 0x00000014,
    VT_SS_R4            = 0x00000004,
    VT_SS_R8            = 0x00000005,
    VT_SS_MONEY         = 0x00000006,
    VT_SS_SMALLMONEY    = 0x000000c8,
    VT_SS_WSTRING       = 0x000000c9,
    VT_SS_WVARSTRING    = 0x000000ca,
    VT_SS_STRING        = 0x000000cb,
    VT_SS_VARSTRING     = 0x000000cc,
    VT_SS_BIT           = 0x0000000b,
    VT_SS_GUID          = 0x00000048,
    VT_SS_NUMERIC       = 0x00000083,
    VT_SS_DECIMAL       = 0x000000cd,
    VT_SS_DATETIME      = 0x00000087,
    VT_SS_SMALLDATETIME = 0x000000ce,
    VT_SS_BINARY        = 0x000000cf,
    VT_SS_VARBINARY     = 0x000000d0,
    VT_SS_UNKNOWN       = 0x000000d1,
}

struct SSVARIANT
{
    ushort vt;
    uint dwReserved1;
    uint dwReserved2;
    union
    {
        ubyte bTinyIntVal;
        short sShortIntVal;
        int lIntVal;
        long llBigIntVal;
        float fltRealVal;
        double dblFloatVal;
        CY cyMoneyVal;
        struct _NCharVal
        {
            short sActualLength;
            short sMaxLength;
            PWSTR pwchNCharVal;
            ubyte[5] rgbReserved;
            uint dwReserved;
            PWSTR pwchReserved;
        }
        struct _CharVal
        {
            short sActualLength;
            short sMaxLength;
            PSTR pchCharVal;
            ubyte[5] rgbReserved;
            uint dwReserved;
            PWSTR pwchReserved;
        }
        VARIANT_BOOL fBitVal;
        ubyte[16] rgbGuidVal;
        DB_NUMERIC numNumericVal;
        struct _BinaryVal
        {
            short sActualLength;
            short sMaxLength;
            ubyte* prgbBinaryVal;
            uint dwReserved;
        }
        DBTIMESTAMP tsDateTimeVal;
        struct _UnknownType
        {
            uint dwActualLength;
            ubyte[16] rgMetadata;
            ubyte* pUnknownData;
        }
        struct _BLOBType
        {
            DBOBJECT dbobj;
            IUnknown pUnk;
        }
    }
}
enum IID_IUMSInitialize = GUID(0x5cf4ca14, 0xef21, 0x11d0, [0x97, 0xe7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
interface IUMSInitialize : IUnknown
{
    HRESULT Initialize(void*);
}
// [Not Found] IID_IUMS
interface IUMS
{
    void SqlUmsSuspend(uint);
    void SqlUmsYield(uint);
    void SqlUmsSwitchPremptive();
    void SqlUmsSwitchNonPremptive();
    BOOL SqlUmsFIsPremptive();
}
struct SSERRORINFO
{
    PWSTR pwszMessage;
    PWSTR pwszServer;
    PWSTR pwszProcedure;
    int lNative;
    ubyte bState;
    ubyte bClass;
    ushort wLineNumber;
}
enum IID_ISQLServerErrorInfo = GUID(0x5cf4ca12, 0xef21, 0x11d0, [0x97, 0xe7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
interface ISQLServerErrorInfo : IUnknown
{
    HRESULT GetErrorInfo(SSERRORINFO**, ushort**);
}
enum IID_IRowsetFastLoad = GUID(0x5cf4ca13, 0xef21, 0x11d0, [0x97, 0xe7, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0x98]);
interface IRowsetFastLoad : IUnknown
{
    HRESULT InsertRow(HACCESSOR, void*);
    HRESULT Commit(BOOL);
}
alias LOCKMODEENUM = int;
enum : int
{
    LOCKMODE_INVALID   = 0x00000000,
    LOCKMODE_EXCLUSIVE = 0x00000001,
    LOCKMODE_SHARED    = 0x00000002,
}

enum IID_ISchemaLock = GUID(0x4c2389fb, 0x2511, 0x11d4, [0xb2, 0x58, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xce]);
interface ISchemaLock : IUnknown
{
    HRESULT GetSchemaLock(DBID*, uint, HANDLE*, ulong*);
    HRESULT ReleaseSchemaLock(HANDLE);
}
alias SQL_ASYNC_NOTIFICATION_CALLBACK = short function(void*, BOOL);
