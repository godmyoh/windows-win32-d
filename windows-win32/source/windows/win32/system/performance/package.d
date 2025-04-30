module windows.win32.system.performance;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, FILETIME, HANDLE, HRESULT, HWND, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.system.com : IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.ole : IFontDisp;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

alias PERF_DETAIL = uint;
enum : uint
{
    PERF_DETAIL_NOVICE   = 0x00000064,
    PERF_DETAIL_ADVANCED = 0x000000c8,
    PERF_DETAIL_EXPERT   = 0x0000012c,
    PERF_DETAIL_WIZARD   = 0x00000190,
}

alias REAL_TIME_DATA_SOURCE_ID_FLAGS = uint;
enum : uint
{
    DATA_SOURCE_REGISTRY = 0x00000001,
    DATA_SOURCE_WBEM     = 0x00000004,
}

alias PDH_PATH_FLAGS = uint;
enum : uint
{
    PDH_PATH_WBEM_RESULT = 0x00000001,
    PDH_PATH_WBEM_INPUT  = 0x00000002,
    PDH_PATH_WBEM_NONE   = 0x00000000,
}

alias PDH_FMT = uint;
enum : uint
{
    PDH_FMT_DOUBLE = 0x00000200,
    PDH_FMT_LARGE  = 0x00000400,
    PDH_FMT_LONG   = 0x00000100,
}

alias PDH_LOG_TYPE = uint;
enum : uint
{
    PDH_LOG_TYPE_UNDEFINED = 0x00000000,
    PDH_LOG_TYPE_CSV       = 0x00000001,
    PDH_LOG_TYPE_SQL       = 0x00000007,
    PDH_LOG_TYPE_TSV       = 0x00000002,
    PDH_LOG_TYPE_BINARY    = 0x00000008,
    PDH_LOG_TYPE_PERFMON   = 0x00000006,
}

alias PDH_LOG = uint;
enum : uint
{
    PDH_LOG_READ_ACCESS   = 0x00010000,
    PDH_LOG_WRITE_ACCESS  = 0x00020000,
    PDH_LOG_UPDATE_ACCESS = 0x00040000,
}

alias PDH_SELECT_DATA_SOURCE_FLAGS = uint;
enum : uint
{
    PDH_FLAGS_FILE_BROWSER_ONLY = 0x00000001,
    PDH_FLAGS_NONE              = 0x00000000,
}

alias PDH_DLL_VERSION = uint;
enum : uint
{
    PDH_CVERSION_WIN50 = 0x00000500,
    PDH_VERSION        = 0x00000503,
}

alias PERF_COUNTER_AGGREGATE_FUNC = uint;
enum : uint
{
    PERF_AGGREGATE_UNDEFINED = 0x00000000,
    PERF_AGGREGATE_TOTAL     = 0x00000001,
    PERF_AGGREGATE_AVG       = 0x00000002,
    PERF_AGGREGATE_MIN       = 0x00000003,
    PERF_AGGREGATE_MAX       = 0x00000004,
}

BOOL QueryPerformanceCounter(long* lpPerformanceCount);
BOOL QueryPerformanceFrequency(long* lpFrequency);
uint InstallPerfDllW(const(wchar)* szComputerName, const(wchar)* lpIniFile, ulong dwFlags);
uint InstallPerfDllA(const(char)* szComputerName, const(char)* lpIniFile, ulong dwFlags);
uint LoadPerfCounterTextStringsA(PSTR lpCommandLine, BOOL bQuietModeArg);
uint LoadPerfCounterTextStringsW(PWSTR lpCommandLine, BOOL bQuietModeArg);
uint UnloadPerfCounterTextStringsW(PWSTR lpCommandLine, BOOL bQuietModeArg);
uint UnloadPerfCounterTextStringsA(PSTR lpCommandLine, BOOL bQuietModeArg);
uint UpdatePerfNameFilesA(const(char)* szNewCtrFilePath, const(char)* szNewHlpFilePath, PSTR szLanguageID, ulong dwFlags);
uint UpdatePerfNameFilesW(const(wchar)* szNewCtrFilePath, const(wchar)* szNewHlpFilePath, PWSTR szLanguageID, ulong dwFlags);
uint SetServiceAsTrustedA(const(char)* szReserved, const(char)* szServiceName);
uint SetServiceAsTrustedW(const(wchar)* szReserved, const(wchar)* szServiceName);
uint BackupPerfRegistryToFileW(const(wchar)* szFileName, const(wchar)* szCommentString);
uint RestorePerfRegistryFromFileW(const(wchar)* szFileName, const(wchar)* szLangId);
uint PerfStartProvider(GUID* ProviderGuid, PERFLIBREQUEST ControlCallback, HANDLE* phProvider);
uint PerfStartProviderEx(GUID* ProviderGuid, PERF_PROVIDER_CONTEXT* ProviderContext, HANDLE* Provider);
uint PerfStopProvider(HANDLE ProviderHandle);
uint PerfSetCounterSetInfo(HANDLE ProviderHandle, PERF_COUNTERSET_INFO* Template, uint TemplateSize);
PERF_COUNTERSET_INSTANCE* PerfCreateInstance(HANDLE ProviderHandle, const(GUID)* CounterSetGuid, const(wchar)* Name, uint Id);
uint PerfDeleteInstance(HANDLE Provider, PERF_COUNTERSET_INSTANCE* InstanceBlock);
PERF_COUNTERSET_INSTANCE* PerfQueryInstance(HANDLE ProviderHandle, const(GUID)* CounterSetGuid, const(wchar)* Name, uint Id);
uint PerfSetCounterRefValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, void* Address);
uint PerfSetULongCounterValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, uint Value);
uint PerfSetULongLongCounterValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, ulong Value);
uint PerfIncrementULongCounterValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, uint Value);
uint PerfIncrementULongLongCounterValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, ulong Value);
uint PerfDecrementULongCounterValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, uint Value);
uint PerfDecrementULongLongCounterValue(HANDLE Provider, PERF_COUNTERSET_INSTANCE* Instance, uint CounterId, ulong Value);
uint PerfEnumerateCounterSet(const(wchar)* szMachine, GUID* pCounterSetIds, uint cCounterSetIds, uint* pcCounterSetIdsActual);
uint PerfEnumerateCounterSetInstances(const(wchar)* szMachine, const(GUID)* pCounterSetId, PERF_INSTANCE_HEADER* pInstances, uint cbInstances, uint* pcbInstancesActual);
uint PerfQueryCounterSetRegistrationInfo(const(wchar)* szMachine, const(GUID)* pCounterSetId, PerfRegInfoType requestCode, uint requestLangId, ubyte* pbRegInfo, uint cbRegInfo, uint* pcbRegInfoActual);
uint PerfOpenQueryHandle(const(wchar)* szMachine, HANDLE* phQuery);
uint PerfCloseQueryHandle(HANDLE hQuery);
uint PerfQueryCounterInfo(HANDLE hQuery, PERF_COUNTER_IDENTIFIER* pCounters, uint cbCounters, uint* pcbCountersActual);
uint PerfQueryCounterData(HANDLE hQuery, PERF_DATA_HEADER* pCounterBlock, uint cbCounterBlock, uint* pcbCounterBlockActual);
uint PerfAddCounters(HANDLE hQuery, PERF_COUNTER_IDENTIFIER* pCounters, uint cbCounters);
uint PerfDeleteCounters(HANDLE hQuery, PERF_COUNTER_IDENTIFIER* pCounters, uint cbCounters);
uint PdhGetDllVersion(PDH_DLL_VERSION* lpdwVersion);
uint PdhOpenQueryW(const(wchar)* szDataSource, ulong dwUserData, PDH_HQUERY* phQuery);
uint PdhOpenQueryA(const(char)* szDataSource, ulong dwUserData, PDH_HQUERY* phQuery);
uint PdhAddCounterW(PDH_HQUERY hQuery, const(wchar)* szFullCounterPath, ulong dwUserData, PDH_HCOUNTER* phCounter);
uint PdhAddCounterA(PDH_HQUERY hQuery, const(char)* szFullCounterPath, ulong dwUserData, PDH_HCOUNTER* phCounter);
uint PdhAddEnglishCounterW(PDH_HQUERY hQuery, const(wchar)* szFullCounterPath, ulong dwUserData, PDH_HCOUNTER* phCounter);
uint PdhAddEnglishCounterA(PDH_HQUERY hQuery, const(char)* szFullCounterPath, ulong dwUserData, PDH_HCOUNTER* phCounter);
uint PdhCollectQueryDataWithTime(PDH_HQUERY hQuery, long* pllTimeStamp);
uint PdhValidatePathExW(PDH_HLOG hDataSource, const(wchar)* szFullPathBuffer);
uint PdhValidatePathExA(PDH_HLOG hDataSource, const(char)* szFullPathBuffer);
uint PdhRemoveCounter(PDH_HCOUNTER hCounter);
uint PdhCollectQueryData(PDH_HQUERY hQuery);
uint PdhCloseQuery(PDH_HQUERY hQuery);
uint PdhGetFormattedCounterValue(PDH_HCOUNTER hCounter, PDH_FMT dwFormat, uint* lpdwType, PDH_FMT_COUNTERVALUE* pValue);
uint PdhGetFormattedCounterArrayA(PDH_HCOUNTER hCounter, PDH_FMT dwFormat, uint* lpdwBufferSize, uint* lpdwItemCount, PDH_FMT_COUNTERVALUE_ITEM_A* ItemBuffer);
uint PdhGetFormattedCounterArrayW(PDH_HCOUNTER hCounter, PDH_FMT dwFormat, uint* lpdwBufferSize, uint* lpdwItemCount, PDH_FMT_COUNTERVALUE_ITEM_W* ItemBuffer);
uint PdhGetRawCounterValue(PDH_HCOUNTER hCounter, uint* lpdwType, PDH_RAW_COUNTER* pValue);
uint PdhGetRawCounterArrayA(PDH_HCOUNTER hCounter, uint* lpdwBufferSize, uint* lpdwItemCount, PDH_RAW_COUNTER_ITEM_A* ItemBuffer);
uint PdhGetRawCounterArrayW(PDH_HCOUNTER hCounter, uint* lpdwBufferSize, uint* lpdwItemCount, PDH_RAW_COUNTER_ITEM_W* ItemBuffer);
uint PdhCalculateCounterFromRawValue(PDH_HCOUNTER hCounter, PDH_FMT dwFormat, PDH_RAW_COUNTER* rawValue1, PDH_RAW_COUNTER* rawValue2, PDH_FMT_COUNTERVALUE* fmtValue);
uint PdhComputeCounterStatistics(PDH_HCOUNTER hCounter, PDH_FMT dwFormat, uint dwFirstEntry, uint dwNumEntries, PDH_RAW_COUNTER* lpRawValueArray, PDH_STATISTICS* data);
uint PdhGetCounterInfoW(PDH_HCOUNTER hCounter, BOOLEAN bRetrieveExplainText, uint* pdwBufferSize, PDH_COUNTER_INFO_W* lpBuffer);
uint PdhGetCounterInfoA(PDH_HCOUNTER hCounter, BOOLEAN bRetrieveExplainText, uint* pdwBufferSize, PDH_COUNTER_INFO_A* lpBuffer);
uint PdhSetCounterScaleFactor(PDH_HCOUNTER hCounter, int lFactor);
uint PdhConnectMachineW(const(wchar)* szMachineName);
uint PdhConnectMachineA(const(char)* szMachineName);
uint PdhEnumMachinesW(const(wchar)* szDataSource, PWSTR mszMachineList, uint* pcchBufferSize);
uint PdhEnumMachinesA(const(char)* szDataSource, PSTR mszMachineList, uint* pcchBufferSize);
uint PdhEnumObjectsW(const(wchar)* szDataSource, const(wchar)* szMachineName, PWSTR mszObjectList, uint* pcchBufferSize, PERF_DETAIL dwDetailLevel, BOOL bRefresh);
uint PdhEnumObjectsA(const(char)* szDataSource, const(char)* szMachineName, PSTR mszObjectList, uint* pcchBufferSize, PERF_DETAIL dwDetailLevel, BOOL bRefresh);
uint PdhEnumObjectItemsW(const(wchar)* szDataSource, const(wchar)* szMachineName, const(wchar)* szObjectName, PWSTR mszCounterList, uint* pcchCounterListLength, PWSTR mszInstanceList, uint* pcchInstanceListLength, PERF_DETAIL dwDetailLevel, uint dwFlags);
uint PdhEnumObjectItemsA(const(char)* szDataSource, const(char)* szMachineName, const(char)* szObjectName, PSTR mszCounterList, uint* pcchCounterListLength, PSTR mszInstanceList, uint* pcchInstanceListLength, PERF_DETAIL dwDetailLevel, uint dwFlags);
uint PdhMakeCounterPathW(PDH_COUNTER_PATH_ELEMENTS_W* pCounterPathElements, PWSTR szFullPathBuffer, uint* pcchBufferSize, PDH_PATH_FLAGS dwFlags);
uint PdhMakeCounterPathA(PDH_COUNTER_PATH_ELEMENTS_A* pCounterPathElements, PSTR szFullPathBuffer, uint* pcchBufferSize, PDH_PATH_FLAGS dwFlags);
uint PdhParseCounterPathW(const(wchar)* szFullPathBuffer, PDH_COUNTER_PATH_ELEMENTS_W* pCounterPathElements, uint* pdwBufferSize, uint dwFlags);
uint PdhParseCounterPathA(const(char)* szFullPathBuffer, PDH_COUNTER_PATH_ELEMENTS_A* pCounterPathElements, uint* pdwBufferSize, uint dwFlags);
uint PdhParseInstanceNameW(const(wchar)* szInstanceString, PWSTR szInstanceName, uint* pcchInstanceNameLength, PWSTR szParentName, uint* pcchParentNameLength, uint* lpIndex);
uint PdhParseInstanceNameA(const(char)* szInstanceString, PSTR szInstanceName, uint* pcchInstanceNameLength, PSTR szParentName, uint* pcchParentNameLength, uint* lpIndex);
uint PdhValidatePathW(const(wchar)* szFullPathBuffer);
uint PdhValidatePathA(const(char)* szFullPathBuffer);
uint PdhGetDefaultPerfObjectW(const(wchar)* szDataSource, const(wchar)* szMachineName, PWSTR szDefaultObjectName, uint* pcchBufferSize);
uint PdhGetDefaultPerfObjectA(const(char)* szDataSource, const(char)* szMachineName, PSTR szDefaultObjectName, uint* pcchBufferSize);
uint PdhGetDefaultPerfCounterW(const(wchar)* szDataSource, const(wchar)* szMachineName, const(wchar)* szObjectName, PWSTR szDefaultCounterName, uint* pcchBufferSize);
uint PdhGetDefaultPerfCounterA(const(char)* szDataSource, const(char)* szMachineName, const(char)* szObjectName, PSTR szDefaultCounterName, uint* pcchBufferSize);
uint PdhBrowseCountersW(PDH_BROWSE_DLG_CONFIG_W* pBrowseDlgData);
uint PdhBrowseCountersA(PDH_BROWSE_DLG_CONFIG_A* pBrowseDlgData);
uint PdhExpandCounterPathW(const(wchar)* szWildCardPath, PWSTR mszExpandedPathList, uint* pcchPathListLength);
uint PdhExpandCounterPathA(const(char)* szWildCardPath, PSTR mszExpandedPathList, uint* pcchPathListLength);
uint PdhLookupPerfNameByIndexW(const(wchar)* szMachineName, uint dwNameIndex, PWSTR szNameBuffer, uint* pcchNameBufferSize);
uint PdhLookupPerfNameByIndexA(const(char)* szMachineName, uint dwNameIndex, PSTR szNameBuffer, uint* pcchNameBufferSize);
uint PdhLookupPerfIndexByNameW(const(wchar)* szMachineName, const(wchar)* szNameBuffer, uint* pdwIndex);
uint PdhLookupPerfIndexByNameA(const(char)* szMachineName, const(char)* szNameBuffer, uint* pdwIndex);
uint PdhExpandWildCardPathA(const(char)* szDataSource, const(char)* szWildCardPath, PSTR mszExpandedPathList, uint* pcchPathListLength, uint dwFlags);
uint PdhExpandWildCardPathW(const(wchar)* szDataSource, const(wchar)* szWildCardPath, PWSTR mszExpandedPathList, uint* pcchPathListLength, uint dwFlags);
uint PdhOpenLogW(const(wchar)* szLogFileName, PDH_LOG dwAccessFlags, PDH_LOG_TYPE* lpdwLogType, PDH_HQUERY hQuery, uint dwMaxSize, const(wchar)* szUserCaption, PDH_HLOG* phLog);
uint PdhOpenLogA(const(char)* szLogFileName, PDH_LOG dwAccessFlags, PDH_LOG_TYPE* lpdwLogType, PDH_HQUERY hQuery, uint dwMaxSize, const(char)* szUserCaption, PDH_HLOG* phLog);
uint PdhUpdateLogW(PDH_HLOG hLog, const(wchar)* szUserString);
uint PdhUpdateLogA(PDH_HLOG hLog, const(char)* szUserString);
uint PdhUpdateLogFileCatalog(PDH_HLOG hLog);
uint PdhGetLogFileSize(PDH_HLOG hLog, long* llSize);
uint PdhCloseLog(PDH_HLOG hLog, uint dwFlags);
uint PdhSelectDataSourceW(HWND hWndOwner, PDH_SELECT_DATA_SOURCE_FLAGS dwFlags, PWSTR szDataSource, uint* pcchBufferLength);
uint PdhSelectDataSourceA(HWND hWndOwner, PDH_SELECT_DATA_SOURCE_FLAGS dwFlags, PSTR szDataSource, uint* pcchBufferLength);
BOOL PdhIsRealTimeQuery(PDH_HQUERY hQuery);
uint PdhSetQueryTimeRange(PDH_HQUERY hQuery, PDH_TIME_INFO* pInfo);
uint PdhGetDataSourceTimeRangeW(const(wchar)* szDataSource, uint* pdwNumEntries, PDH_TIME_INFO* pInfo, uint* pdwBufferSize);
uint PdhGetDataSourceTimeRangeA(const(char)* szDataSource, uint* pdwNumEntries, PDH_TIME_INFO* pInfo, uint* pdwBufferSize);
uint PdhCollectQueryDataEx(PDH_HQUERY hQuery, uint dwIntervalTime, HANDLE hNewDataEvent);
uint PdhFormatFromRawValue(uint dwCounterType, PDH_FMT dwFormat, long* pTimeBase, PDH_RAW_COUNTER* pRawValue1, PDH_RAW_COUNTER* pRawValue2, PDH_FMT_COUNTERVALUE* pFmtValue);
uint PdhGetCounterTimeBase(PDH_HCOUNTER hCounter, long* pTimeBase);
uint PdhReadRawLogRecord(PDH_HLOG hLog, FILETIME ftRecord, PDH_RAW_LOG_RECORD* pRawLogRecord, uint* pdwBufferLength);
uint PdhSetDefaultRealTimeDataSource(REAL_TIME_DATA_SOURCE_ID_FLAGS dwDataSourceId);
uint PdhBindInputDataSourceW(PDH_HLOG* phDataSource, const(wchar)* LogFileNameList);
uint PdhBindInputDataSourceA(PDH_HLOG* phDataSource, const(char)* LogFileNameList);
uint PdhOpenQueryH(PDH_HLOG hDataSource, ulong dwUserData, PDH_HQUERY* phQuery);
uint PdhEnumMachinesHW(PDH_HLOG hDataSource, PWSTR mszMachineList, uint* pcchBufferSize);
uint PdhEnumMachinesHA(PDH_HLOG hDataSource, PSTR mszMachineList, uint* pcchBufferSize);
uint PdhEnumObjectsHW(PDH_HLOG hDataSource, const(wchar)* szMachineName, PWSTR mszObjectList, uint* pcchBufferSize, PERF_DETAIL dwDetailLevel, BOOL bRefresh);
uint PdhEnumObjectsHA(PDH_HLOG hDataSource, const(char)* szMachineName, PSTR mszObjectList, uint* pcchBufferSize, PERF_DETAIL dwDetailLevel, BOOL bRefresh);
uint PdhEnumObjectItemsHW(PDH_HLOG hDataSource, const(wchar)* szMachineName, const(wchar)* szObjectName, PWSTR mszCounterList, uint* pcchCounterListLength, PWSTR mszInstanceList, uint* pcchInstanceListLength, PERF_DETAIL dwDetailLevel, uint dwFlags);
uint PdhEnumObjectItemsHA(PDH_HLOG hDataSource, const(char)* szMachineName, const(char)* szObjectName, PSTR mszCounterList, uint* pcchCounterListLength, PSTR mszInstanceList, uint* pcchInstanceListLength, PERF_DETAIL dwDetailLevel, uint dwFlags);
uint PdhExpandWildCardPathHW(PDH_HLOG hDataSource, const(wchar)* szWildCardPath, PWSTR mszExpandedPathList, uint* pcchPathListLength, uint dwFlags);
uint PdhExpandWildCardPathHA(PDH_HLOG hDataSource, const(char)* szWildCardPath, PSTR mszExpandedPathList, uint* pcchPathListLength, uint dwFlags);
uint PdhGetDataSourceTimeRangeH(PDH_HLOG hDataSource, uint* pdwNumEntries, PDH_TIME_INFO* pInfo, uint* pdwBufferSize);
uint PdhGetDefaultPerfObjectHW(PDH_HLOG hDataSource, const(wchar)* szMachineName, PWSTR szDefaultObjectName, uint* pcchBufferSize);
uint PdhGetDefaultPerfObjectHA(PDH_HLOG hDataSource, const(char)* szMachineName, PSTR szDefaultObjectName, uint* pcchBufferSize);
uint PdhGetDefaultPerfCounterHW(PDH_HLOG hDataSource, const(wchar)* szMachineName, const(wchar)* szObjectName, PWSTR szDefaultCounterName, uint* pcchBufferSize);
uint PdhGetDefaultPerfCounterHA(PDH_HLOG hDataSource, const(char)* szMachineName, const(char)* szObjectName, PSTR szDefaultCounterName, uint* pcchBufferSize);
uint PdhBrowseCountersHW(PDH_BROWSE_DLG_CONFIG_HW* pBrowseDlgData);
uint PdhBrowseCountersHA(PDH_BROWSE_DLG_CONFIG_HA* pBrowseDlgData);
uint PdhVerifySQLDBW(const(wchar)* szDataSource);
uint PdhVerifySQLDBA(const(char)* szDataSource);
uint PdhCreateSQLTablesW(const(wchar)* szDataSource);
uint PdhCreateSQLTablesA(const(char)* szDataSource);
uint PdhEnumLogSetNamesW(const(wchar)* szDataSource, PWSTR mszDataSetNameList, uint* pcchBufferLength);
uint PdhEnumLogSetNamesA(const(char)* szDataSource, PSTR mszDataSetNameList, uint* pcchBufferLength);
uint PdhGetLogSetGUID(PDH_HLOG hLog, GUID* pGuid, int* pRunId);
uint PdhSetLogSetRunID(PDH_HLOG hLog, int RunId);
enum MAX_COUNTER_PATH = 0x00000100;
enum PDH_MAX_COUNTER_NAME = 0x00000400;
enum PDH_MAX_INSTANCE_NAME = 0x00000400;
enum PDH_MAX_COUNTER_PATH = 0x00000800;
enum PDH_MAX_DATASOURCE_PATH = 0x00000400;
enum H_WBEM_DATASOURCE = 0xffffffffffffffff;
enum PDH_MAX_SCALE = 0x00000007;
enum PDH_MIN_SCALE = 0xfffffffffffffff9;
enum PDH_NOEXPANDCOUNTERS = 0x00000001;
enum PDH_NOEXPANDINSTANCES = 0x00000002;
enum PDH_REFRESHCOUNTERS = 0x00000004;
enum PDH_LOG_TYPE_RETIRED_BIN = 0x00000003;
enum PDH_LOG_TYPE_TRACE_KERNEL = 0x00000004;
enum PDH_LOG_TYPE_TRACE_GENERIC = 0x00000005;
enum PERF_PROVIDER_USER_MODE = 0x00000000;
enum PERF_PROVIDER_KERNEL_MODE = 0x00000001;
enum PERF_PROVIDER_DRIVER = 0x00000002;
enum PERF_COUNTERSET_FLAG_MULTIPLE = 0x00000002;
enum PERF_COUNTERSET_FLAG_AGGREGATE = 0x00000004;
enum PERF_COUNTERSET_FLAG_HISTORY = 0x00000008;
enum PERF_COUNTERSET_FLAG_INSTANCE = 0x00000010;
enum PERF_COUNTERSET_SINGLE_INSTANCE = 0x00000000;
enum PERF_COUNTERSET_MULTI_INSTANCES = 0x00000002;
enum PERF_COUNTERSET_SINGLE_AGGREGATE = 0x00000004;
enum PERF_ATTRIB_BY_REFERENCE = 0x0000000000000001;
enum PERF_ATTRIB_NO_DISPLAYABLE = 0x0000000000000002;
enum PERF_ATTRIB_NO_GROUP_SEPARATOR = 0x0000000000000004;
enum PERF_ATTRIB_DISPLAY_AS_REAL = 0x0000000000000008;
enum PERF_ATTRIB_DISPLAY_AS_HEX = 0x0000000000000010;
enum PERF_WILDCARD_COUNTER = 0xffffffff;
enum PERF_WILDCARD_INSTANCE = "*";
enum PERF_AGGREGATE_INSTANCE = "_Total";
enum PERF_MAX_INSTANCE_NAME = 0x00000400;
enum PERF_ADD_COUNTER = 0x00000001;
enum PERF_REMOVE_COUNTER = 0x00000002;
enum PERF_ENUM_INSTANCES = 0x00000003;
enum PERF_COLLECT_START = 0x00000005;
enum PERF_COLLECT_END = 0x00000006;
enum PERF_FILTER = 0x00000009;
enum PERF_DATA_VERSION = 0x00000001;
enum PERF_DATA_REVISION = 0x00000001;
enum PERF_NO_INSTANCES = 0xffffffffffffffff;
enum PERF_METADATA_MULTIPLE_INSTANCES = 0xfffffffffffffffe;
enum PERF_METADATA_NO_INSTANCES = 0xfffffffffffffffd;
enum PERF_SIZE_DWORD = 0x00000000;
enum PERF_SIZE_LARGE = 0x00000100;
enum PERF_SIZE_ZERO = 0x00000200;
enum PERF_SIZE_VARIABLE_LEN = 0x00000300;
enum PERF_TYPE_NUMBER = 0x00000000;
enum PERF_TYPE_COUNTER = 0x00000400;
enum PERF_TYPE_TEXT = 0x00000800;
enum PERF_TYPE_ZERO = 0x00000c00;
enum PERF_NUMBER_HEX = 0x00000000;
enum PERF_NUMBER_DECIMAL = 0x00010000;
enum PERF_NUMBER_DEC_1000 = 0x00020000;
enum PERF_COUNTER_VALUE = 0x00000000;
enum PERF_COUNTER_RATE = 0x00010000;
enum PERF_COUNTER_FRACTION = 0x00020000;
enum PERF_COUNTER_BASE = 0x00030000;
enum PERF_COUNTER_ELAPSED = 0x00040000;
enum PERF_COUNTER_QUEUELEN = 0x00050000;
enum PERF_COUNTER_HISTOGRAM = 0x00060000;
enum PERF_COUNTER_PRECISION = 0x00070000;
enum PERF_TEXT_UNICODE = 0x00000000;
enum PERF_TEXT_ASCII = 0x00010000;
enum PERF_TIMER_TICK = 0x00000000;
enum PERF_TIMER_100NS = 0x00100000;
enum PERF_OBJECT_TIMER = 0x00200000;
enum PERF_DELTA_COUNTER = 0x00400000;
enum PERF_DELTA_BASE = 0x00800000;
enum PERF_INVERSE_COUNTER = 0x01000000;
enum PERF_MULTI_COUNTER = 0x02000000;
enum PERF_DISPLAY_NO_SUFFIX = 0x00000000;
enum PERF_DISPLAY_PER_SEC = 0x10000000;
enum PERF_DISPLAY_PERCENT = 0x20000000;
enum PERF_DISPLAY_SECONDS = 0x30000000;
enum PERF_DISPLAY_NOSHOW = 0x40000000;
enum PERF_COUNTER_HISTOGRAM_TYPE = 0x80000000;
enum PERF_NO_UNIQUE_ID = 0xffffffffffffffff;
enum MAX_PERF_OBJECTS_IN_QUERY_FUNCTION = 0x00000040;
enum WINPERF_LOG_NONE = 0x00000000;
enum WINPERF_LOG_USER = 0x00000001;
enum WINPERF_LOG_DEBUG = 0x00000002;
enum WINPERF_LOG_VERBOSE = 0x00000003;
enum LIBID_SystemMonitor = GUID(0x1b773e42, 0x2509, 0x11cf, [0x94, 0x2f, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
enum DIID_DICounterItem = GUID(0xc08c4ff2, 0xe2e, 0x11cf, [0x94, 0x2c, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
enum DIID_DILogFileItem = GUID(0x8d093ffc, 0xf777, 0x4917, [0x82, 0xd1, 0x83, 0x3f, 0xbc, 0x54, 0xc5, 0x8f]);
enum DIID_DISystemMonitor = GUID(0x13d73d81, 0xc32e, 0x11cf, [0x93, 0x98, 0x0, 0xaa, 0x0, 0xa3, 0xdd, 0xea]);
enum DIID_DISystemMonitorInternal = GUID(0x194eb242, 0xc32c, 0x11cf, [0x93, 0x98, 0x0, 0xaa, 0x0, 0xa3, 0xdd, 0xea]);
enum DIID_DISystemMonitorEvents = GUID(0x84979930, 0x4ab3, 0x11cf, [0x94, 0x3a, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
enum PDH_CSTATUS_VALID_DATA = 0x00000000;
enum PDH_CSTATUS_NEW_DATA = 0x00000001;
enum PDH_CSTATUS_NO_MACHINE = 0x800007d0;
enum PDH_CSTATUS_NO_INSTANCE = 0x800007d1;
enum PDH_MORE_DATA = 0x800007d2;
enum PDH_CSTATUS_ITEM_NOT_VALIDATED = 0x800007d3;
enum PDH_RETRY = 0x800007d4;
enum PDH_NO_DATA = 0x800007d5;
enum PDH_CALC_NEGATIVE_DENOMINATOR = 0x800007d6;
enum PDH_CALC_NEGATIVE_TIMEBASE = 0x800007d7;
enum PDH_CALC_NEGATIVE_VALUE = 0x800007d8;
enum PDH_DIALOG_CANCELLED = 0x800007d9;
enum PDH_END_OF_LOG_FILE = 0x800007da;
enum PDH_ASYNC_QUERY_TIMEOUT = 0x800007db;
enum PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE = 0x800007dc;
enum PDH_UNABLE_MAP_NAME_FILES = 0x80000bd5;
enum PDH_PLA_VALIDATION_WARNING = 0x80000bf3;
enum PDH_CSTATUS_NO_OBJECT = 0xc0000bb8;
enum PDH_CSTATUS_NO_COUNTER = 0xc0000bb9;
enum PDH_CSTATUS_INVALID_DATA = 0xc0000bba;
enum PDH_MEMORY_ALLOCATION_FAILURE = 0xc0000bbb;
enum PDH_INVALID_HANDLE = 0xc0000bbc;
enum PDH_INVALID_ARGUMENT = 0xc0000bbd;
enum PDH_FUNCTION_NOT_FOUND = 0xc0000bbe;
enum PDH_CSTATUS_NO_COUNTERNAME = 0xc0000bbf;
enum PDH_CSTATUS_BAD_COUNTERNAME = 0xc0000bc0;
enum PDH_INVALID_BUFFER = 0xc0000bc1;
enum PDH_INSUFFICIENT_BUFFER = 0xc0000bc2;
enum PDH_CANNOT_CONNECT_MACHINE = 0xc0000bc3;
enum PDH_INVALID_PATH = 0xc0000bc4;
enum PDH_INVALID_INSTANCE = 0xc0000bc5;
enum PDH_INVALID_DATA = 0xc0000bc6;
enum PDH_NO_DIALOG_DATA = 0xc0000bc7;
enum PDH_CANNOT_READ_NAME_STRINGS = 0xc0000bc8;
enum PDH_LOG_FILE_CREATE_ERROR = 0xc0000bc9;
enum PDH_LOG_FILE_OPEN_ERROR = 0xc0000bca;
enum PDH_LOG_TYPE_NOT_FOUND = 0xc0000bcb;
enum PDH_NO_MORE_DATA = 0xc0000bcc;
enum PDH_ENTRY_NOT_IN_LOG_FILE = 0xc0000bcd;
enum PDH_DATA_SOURCE_IS_LOG_FILE = 0xc0000bce;
enum PDH_DATA_SOURCE_IS_REAL_TIME = 0xc0000bcf;
enum PDH_UNABLE_READ_LOG_HEADER = 0xc0000bd0;
enum PDH_FILE_NOT_FOUND = 0xc0000bd1;
enum PDH_FILE_ALREADY_EXISTS = 0xc0000bd2;
enum PDH_NOT_IMPLEMENTED = 0xc0000bd3;
enum PDH_STRING_NOT_FOUND = 0xc0000bd4;
enum PDH_UNKNOWN_LOG_FORMAT = 0xc0000bd6;
enum PDH_UNKNOWN_LOGSVC_COMMAND = 0xc0000bd7;
enum PDH_LOGSVC_QUERY_NOT_FOUND = 0xc0000bd8;
enum PDH_LOGSVC_NOT_OPENED = 0xc0000bd9;
enum PDH_WBEM_ERROR = 0xc0000bda;
enum PDH_ACCESS_DENIED = 0xc0000bdb;
enum PDH_LOG_FILE_TOO_SMALL = 0xc0000bdc;
enum PDH_INVALID_DATASOURCE = 0xc0000bdd;
enum PDH_INVALID_SQLDB = 0xc0000bde;
enum PDH_NO_COUNTERS = 0xc0000bdf;
enum PDH_SQL_ALLOC_FAILED = 0xc0000be0;
enum PDH_SQL_ALLOCCON_FAILED = 0xc0000be1;
enum PDH_SQL_EXEC_DIRECT_FAILED = 0xc0000be2;
enum PDH_SQL_FETCH_FAILED = 0xc0000be3;
enum PDH_SQL_ROWCOUNT_FAILED = 0xc0000be4;
enum PDH_SQL_MORE_RESULTS_FAILED = 0xc0000be5;
enum PDH_SQL_CONNECT_FAILED = 0xc0000be6;
enum PDH_SQL_BIND_FAILED = 0xc0000be7;
enum PDH_CANNOT_CONNECT_WMI_SERVER = 0xc0000be8;
enum PDH_PLA_COLLECTION_ALREADY_RUNNING = 0xc0000be9;
enum PDH_PLA_ERROR_SCHEDULE_OVERLAP = 0xc0000bea;
enum PDH_PLA_COLLECTION_NOT_FOUND = 0xc0000beb;
enum PDH_PLA_ERROR_SCHEDULE_ELAPSED = 0xc0000bec;
enum PDH_PLA_ERROR_NOSTART = 0xc0000bed;
enum PDH_PLA_ERROR_ALREADY_EXISTS = 0xc0000bee;
enum PDH_PLA_ERROR_TYPE_MISMATCH = 0xc0000bef;
enum PDH_PLA_ERROR_FILEPATH = 0xc0000bf0;
enum PDH_PLA_SERVICE_ERROR = 0xc0000bf1;
enum PDH_PLA_VALIDATION_ERROR = 0xc0000bf2;
enum PDH_PLA_ERROR_NAME_TOO_LONG = 0xc0000bf4;
enum PDH_INVALID_SQL_LOG_FORMAT = 0xc0000bf5;
enum PDH_COUNTER_ALREADY_IN_QUERY = 0xc0000bf6;
enum PDH_BINARY_LOG_CORRUPT = 0xc0000bf7;
enum PDH_LOG_SAMPLE_TOO_SMALL = 0xc0000bf8;
enum PDH_OS_LATER_VERSION = 0xc0000bf9;
enum PDH_OS_EARLIER_VERSION = 0xc0000bfa;
enum PDH_INCORRECT_APPEND_TIME = 0xc0000bfb;
enum PDH_UNMATCHED_APPEND_COUNTER = 0xc0000bfc;
enum PDH_SQL_ALTER_DETAIL_FAILED = 0xc0000bfd;
enum PDH_QUERY_PERF_DATA_TIMEOUT = 0xc0000bfe;
enum PLA_CAPABILITY_LOCAL = 0x10000000;
enum PLA_CAPABILITY_V1_SVC = 0x00000001;
enum PLA_CAPABILITY_V1_SESSION = 0x00000002;
enum PLA_CAPABILITY_V1_SYSTEM = 0x00000004;
enum PLA_CAPABILITY_LEGACY_SESSION = 0x00000008;
enum PLA_CAPABILITY_LEGACY_SVC = 0x00000010;
enum PLA_CAPABILITY_AUTOLOGGER = 0x00000020;
enum PLAL_ALERT_CMD_LINE_SINGLE = 0x00000100;
enum PLAL_ALERT_CMD_LINE_A_NAME = 0x00000200;
enum PLAL_ALERT_CMD_LINE_C_NAME = 0x00000400;
enum PLAL_ALERT_CMD_LINE_D_TIME = 0x00000800;
enum PLAL_ALERT_CMD_LINE_L_VAL = 0x00001000;
enum PLAL_ALERT_CMD_LINE_M_VAL = 0x00002000;
enum PLAL_ALERT_CMD_LINE_U_TEXT = 0x00004000;
enum PLAL_ALERT_CMD_LINE_MASK = 0x00007f00;
enum S_PDH = GUID(0x4d66358, 0xc4a1, 0x419b, [0x80, 0x23, 0x23, 0xb7, 0x39, 0x2, 0xde, 0x2c]);
alias PDH_HLOG = void*;
alias PDH_HQUERY = void*;
alias PDH_HCOUNTER = void*;
alias DataCollectorType = int;
enum : int
{
    plaPerformanceCounter = 0x00000000,
    plaTrace              = 0x00000001,
    plaConfiguration      = 0x00000002,
    plaAlert              = 0x00000003,
    plaApiTrace           = 0x00000004,
}

alias FileFormat = int;
enum : int
{
    plaCommaSeparated = 0x00000000,
    plaTabSeparated   = 0x00000001,
    plaSql            = 0x00000002,
    plaBinary         = 0x00000003,
}

alias AutoPathFormat = int;
enum : int
{
    plaNone               = 0x00000000,
    plaPattern            = 0x00000001,
    plaComputer           = 0x00000002,
    plaMonthDayHour       = 0x00000100,
    plaSerialNumber       = 0x00000200,
    plaYearDayOfYear      = 0x00000400,
    plaYearMonth          = 0x00000800,
    plaYearMonthDay       = 0x00001000,
    plaYearMonthDayHour   = 0x00002000,
    plaMonthDayHourMinute = 0x00004000,
}

alias DataCollectorSetStatus = int;
enum : int
{
    plaStopped   = 0x00000000,
    plaRunning   = 0x00000001,
    plaCompiling = 0x00000002,
    plaPending   = 0x00000003,
    plaUndefined = 0x00000004,
}

alias ClockType = int;
enum : int
{
    plaTimeStamp   = 0x00000000,
    plaPerformance = 0x00000001,
    plaSystem      = 0x00000002,
    plaCycle       = 0x00000003,
}

alias StreamMode = int;
enum : int
{
    plaFile      = 0x00000001,
    plaRealTime  = 0x00000002,
    plaBoth      = 0x00000003,
    plaBuffering = 0x00000004,
}

alias CommitMode = int;
enum : int
{
    plaCreateNew             = 0x00000001,
    plaModify                = 0x00000002,
    plaCreateOrModify        = 0x00000003,
    plaUpdateRunningInstance = 0x00000010,
    plaFlushTrace            = 0x00000020,
    plaValidateOnly          = 0x00001000,
}

alias ValueMapType = int;
enum : int
{
    plaIndex      = 0x00000001,
    plaFlag       = 0x00000002,
    plaFlagArray  = 0x00000003,
    plaValidation = 0x00000004,
}

alias WeekDays = int;
enum : int
{
    plaRunOnce   = 0x00000000,
    plaSunday    = 0x00000001,
    plaMonday    = 0x00000002,
    plaTuesday   = 0x00000004,
    plaWednesday = 0x00000008,
    plaThursday  = 0x00000010,
    plaFriday    = 0x00000020,
    plaSaturday  = 0x00000040,
    plaEveryday  = 0x0000007f,
}

alias ResourcePolicy = int;
enum : int
{
    plaDeleteLargest = 0x00000000,
    plaDeleteOldest  = 0x00000001,
}

alias DataManagerSteps = int;
enum : int
{
    plaCreateReport    = 0x00000001,
    plaRunRules        = 0x00000002,
    plaCreateHtml      = 0x00000004,
    plaFolderActions   = 0x00000008,
    plaResourceFreeing = 0x00000010,
}

alias FolderActionSteps = int;
enum : int
{
    plaCreateCab    = 0x00000001,
    plaDeleteData   = 0x00000002,
    plaSendCab      = 0x00000004,
    plaDeleteCab    = 0x00000008,
    plaDeleteReport = 0x00000010,
}

alias PLA_CABEXTRACT_CALLBACK = void function(const(wchar)* FileName, void* Context);
enum IID_IDataCollectorSet = GUID(0x3837520, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IDataCollectorSet : IDispatch
{
    HRESULT get_DataCollectors(IDataCollectorCollection* collectors);
    HRESULT get_Duration(uint* seconds);
    HRESULT put_Duration(uint seconds);
    HRESULT get_Description(BSTR* description);
    HRESULT put_Description(BSTR description);
    HRESULT get_DescriptionUnresolved(BSTR* Descr);
    HRESULT get_DisplayName(BSTR* DisplayName);
    HRESULT put_DisplayName(BSTR DisplayName);
    HRESULT get_DisplayNameUnresolved(BSTR* name);
    HRESULT get_Keywords(SAFEARRAY** keywords);
    HRESULT put_Keywords(SAFEARRAY* keywords);
    HRESULT get_LatestOutputLocation(BSTR* path);
    HRESULT put_LatestOutputLocation(BSTR path);
    HRESULT get_Name(BSTR* name);
    HRESULT get_OutputLocation(BSTR* path);
    HRESULT get_RootPath(BSTR* folder);
    HRESULT put_RootPath(BSTR folder);
    HRESULT get_Segment(VARIANT_BOOL* segment);
    HRESULT put_Segment(VARIANT_BOOL segment);
    HRESULT get_SegmentMaxDuration(uint* seconds);
    HRESULT put_SegmentMaxDuration(uint seconds);
    HRESULT get_SegmentMaxSize(uint* size);
    HRESULT put_SegmentMaxSize(uint size);
    HRESULT get_SerialNumber(uint* index);
    HRESULT put_SerialNumber(uint index);
    HRESULT get_Server(BSTR* server);
    HRESULT get_Status(DataCollectorSetStatus* status);
    HRESULT get_Subdirectory(BSTR* folder);
    HRESULT put_Subdirectory(BSTR folder);
    HRESULT get_SubdirectoryFormat(AutoPathFormat* format);
    HRESULT put_SubdirectoryFormat(AutoPathFormat format);
    HRESULT get_SubdirectoryFormatPattern(BSTR* pattern);
    HRESULT put_SubdirectoryFormatPattern(BSTR pattern);
    HRESULT get_Task(BSTR* task);
    HRESULT put_Task(BSTR task);
    HRESULT get_TaskRunAsSelf(VARIANT_BOOL* RunAsSelf);
    HRESULT put_TaskRunAsSelf(VARIANT_BOOL RunAsSelf);
    HRESULT get_TaskArguments(BSTR* task);
    HRESULT put_TaskArguments(BSTR task);
    HRESULT get_TaskUserTextArguments(BSTR* UserText);
    HRESULT put_TaskUserTextArguments(BSTR UserText);
    HRESULT get_Schedules(IScheduleCollection* ppSchedules);
    HRESULT get_SchedulesEnabled(VARIANT_BOOL* enabled);
    HRESULT put_SchedulesEnabled(VARIANT_BOOL enabled);
    HRESULT get_UserAccount(BSTR* user);
    HRESULT get_Xml(BSTR* xml);
    HRESULT get_Security(BSTR* pbstrSecurity);
    HRESULT put_Security(BSTR bstrSecurity);
    HRESULT get_StopOnCompletion(VARIANT_BOOL* Stop);
    HRESULT put_StopOnCompletion(VARIANT_BOOL Stop);
    HRESULT get_DataManager(IDataManager* DataManager);
    HRESULT SetCredentials(BSTR user, BSTR password);
    HRESULT Query(BSTR name, BSTR server);
    HRESULT Commit(BSTR name, BSTR server, CommitMode mode, IValueMap* validation);
    HRESULT Delete();
    HRESULT Start(VARIANT_BOOL Synchronous);
    HRESULT Stop(VARIANT_BOOL Synchronous);
    HRESULT SetXml(BSTR xml, IValueMap* validation);
    HRESULT SetValue(BSTR key, BSTR value);
    HRESULT GetValue(BSTR key, BSTR* value);
}
enum IID_IDataManager = GUID(0x3837541, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IDataManager : IDispatch
{
    HRESULT get_Enabled(VARIANT_BOOL* pfEnabled);
    HRESULT put_Enabled(VARIANT_BOOL fEnabled);
    HRESULT get_CheckBeforeRunning(VARIANT_BOOL* pfCheck);
    HRESULT put_CheckBeforeRunning(VARIANT_BOOL fCheck);
    HRESULT get_MinFreeDisk(uint* MinFreeDisk);
    HRESULT put_MinFreeDisk(uint MinFreeDisk);
    HRESULT get_MaxSize(uint* pulMaxSize);
    HRESULT put_MaxSize(uint ulMaxSize);
    HRESULT get_MaxFolderCount(uint* pulMaxFolderCount);
    HRESULT put_MaxFolderCount(uint ulMaxFolderCount);
    HRESULT get_ResourcePolicy(ResourcePolicy* pPolicy);
    HRESULT put_ResourcePolicy(ResourcePolicy Policy);
    HRESULT get_FolderActions(IFolderActionCollection* Actions);
    HRESULT get_ReportSchema(BSTR* ReportSchema);
    HRESULT put_ReportSchema(BSTR ReportSchema);
    HRESULT get_ReportFileName(BSTR* pbstrFilename);
    HRESULT put_ReportFileName(BSTR pbstrFilename);
    HRESULT get_RuleTargetFileName(BSTR* Filename);
    HRESULT put_RuleTargetFileName(BSTR Filename);
    HRESULT get_EventsFileName(BSTR* pbstrFilename);
    HRESULT put_EventsFileName(BSTR pbstrFilename);
    HRESULT get_Rules(BSTR* pbstrXml);
    HRESULT put_Rules(BSTR bstrXml);
    HRESULT Run(DataManagerSteps Steps, BSTR bstrFolder, IValueMap* Errors);
    HRESULT Extract(BSTR CabFilename, BSTR DestinationPath);
}
enum IID_IFolderAction = GUID(0x3837543, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IFolderAction : IDispatch
{
    HRESULT get_Age(uint* pulAge);
    HRESULT put_Age(uint ulAge);
    HRESULT get_Size(uint* pulAge);
    HRESULT put_Size(uint ulAge);
    HRESULT get_Actions(FolderActionSteps* Steps);
    HRESULT put_Actions(FolderActionSteps Steps);
    HRESULT get_SendCabTo(BSTR* pbstrDestination);
    HRESULT put_SendCabTo(BSTR bstrDestination);
}
enum IID_IFolderActionCollection = GUID(0x3837544, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IFolderActionCollection : IDispatch
{
    HRESULT get_Count(uint* Count);
    HRESULT get_Item(VARIANT Index, IFolderAction* Action);
    HRESULT get__NewEnum(IUnknown* Enum);
    HRESULT Add(IFolderAction Action);
    HRESULT Remove(VARIANT Index);
    HRESULT Clear();
    HRESULT AddRange(IFolderActionCollection Actions);
    HRESULT CreateFolderAction(IFolderAction* FolderAction);
}
enum IID_IDataCollector = GUID(0x38374ff, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IDataCollector : IDispatch
{
    HRESULT get_DataCollectorSet(IDataCollectorSet* group);
    HRESULT put_DataCollectorSet(IDataCollectorSet group);
    HRESULT get_DataCollectorType(DataCollectorType* type);
    HRESULT get_FileName(BSTR* name);
    HRESULT put_FileName(BSTR name);
    HRESULT get_FileNameFormat(AutoPathFormat* format);
    HRESULT put_FileNameFormat(AutoPathFormat format);
    HRESULT get_FileNameFormatPattern(BSTR* pattern);
    HRESULT put_FileNameFormatPattern(BSTR pattern);
    HRESULT get_LatestOutputLocation(BSTR* path);
    HRESULT put_LatestOutputLocation(BSTR path);
    HRESULT get_LogAppend(VARIANT_BOOL* append);
    HRESULT put_LogAppend(VARIANT_BOOL append);
    HRESULT get_LogCircular(VARIANT_BOOL* circular);
    HRESULT put_LogCircular(VARIANT_BOOL circular);
    HRESULT get_LogOverwrite(VARIANT_BOOL* overwrite);
    HRESULT put_LogOverwrite(VARIANT_BOOL overwrite);
    HRESULT get_Name(BSTR* name);
    HRESULT put_Name(BSTR name);
    HRESULT get_OutputLocation(BSTR* path);
    HRESULT get_Index(int* index);
    HRESULT put_Index(int index);
    HRESULT get_Xml(BSTR* Xml);
    HRESULT SetXml(BSTR Xml, IValueMap* Validation);
    HRESULT CreateOutputLocation(VARIANT_BOOL Latest, BSTR* Location);
}
enum IID_IPerformanceCounterDataCollector = GUID(0x3837506, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IPerformanceCounterDataCollector : IDataCollector
{
    HRESULT get_DataSourceName(BSTR* dsn);
    HRESULT put_DataSourceName(BSTR dsn);
    HRESULT get_PerformanceCounters(SAFEARRAY** counters);
    HRESULT put_PerformanceCounters(SAFEARRAY* counters);
    HRESULT get_LogFileFormat(FileFormat* format);
    HRESULT put_LogFileFormat(FileFormat format);
    HRESULT get_SampleInterval(uint* interval);
    HRESULT put_SampleInterval(uint interval);
    HRESULT get_SegmentMaxRecords(uint* records);
    HRESULT put_SegmentMaxRecords(uint records);
}
enum IID_ITraceDataCollector = GUID(0x383750b, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface ITraceDataCollector : IDataCollector
{
    HRESULT get_BufferSize(uint* size);
    HRESULT put_BufferSize(uint size);
    HRESULT get_BuffersLost(uint* buffers);
    HRESULT put_BuffersLost(uint buffers);
    HRESULT get_BuffersWritten(uint* buffers);
    HRESULT put_BuffersWritten(uint buffers);
    HRESULT get_ClockType(ClockType* clock);
    HRESULT put_ClockType(ClockType clock);
    HRESULT get_EventsLost(uint* events);
    HRESULT put_EventsLost(uint events);
    HRESULT get_ExtendedModes(uint* mode);
    HRESULT put_ExtendedModes(uint mode);
    HRESULT get_FlushTimer(uint* seconds);
    HRESULT put_FlushTimer(uint seconds);
    HRESULT get_FreeBuffers(uint* buffers);
    HRESULT put_FreeBuffers(uint buffers);
    HRESULT get_Guid(GUID* guid);
    HRESULT put_Guid(GUID guid);
    HRESULT get_IsKernelTrace(VARIANT_BOOL* kernel);
    HRESULT get_MaximumBuffers(uint* buffers);
    HRESULT put_MaximumBuffers(uint buffers);
    HRESULT get_MinimumBuffers(uint* buffers);
    HRESULT put_MinimumBuffers(uint buffers);
    HRESULT get_NumberOfBuffers(uint* buffers);
    HRESULT put_NumberOfBuffers(uint buffers);
    HRESULT get_PreallocateFile(VARIANT_BOOL* allocate);
    HRESULT put_PreallocateFile(VARIANT_BOOL allocate);
    HRESULT get_ProcessMode(VARIANT_BOOL* process);
    HRESULT put_ProcessMode(VARIANT_BOOL process);
    HRESULT get_RealTimeBuffersLost(uint* buffers);
    HRESULT put_RealTimeBuffersLost(uint buffers);
    HRESULT get_SessionId(ulong* id);
    HRESULT put_SessionId(ulong id);
    HRESULT get_SessionName(BSTR* name);
    HRESULT put_SessionName(BSTR name);
    HRESULT get_SessionThreadId(uint* tid);
    HRESULT put_SessionThreadId(uint tid);
    HRESULT get_StreamMode(StreamMode* mode);
    HRESULT put_StreamMode(StreamMode mode);
    HRESULT get_TraceDataProviders(ITraceDataProviderCollection* providers);
}
enum IID_IConfigurationDataCollector = GUID(0x3837514, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IConfigurationDataCollector : IDataCollector
{
    HRESULT get_FileMaxCount(uint* count);
    HRESULT put_FileMaxCount(uint count);
    HRESULT get_FileMaxRecursiveDepth(uint* depth);
    HRESULT put_FileMaxRecursiveDepth(uint depth);
    HRESULT get_FileMaxTotalSize(uint* size);
    HRESULT put_FileMaxTotalSize(uint size);
    HRESULT get_Files(SAFEARRAY** Files);
    HRESULT put_Files(SAFEARRAY* Files);
    HRESULT get_ManagementQueries(SAFEARRAY** Queries);
    HRESULT put_ManagementQueries(SAFEARRAY* Queries);
    HRESULT get_QueryNetworkAdapters(VARIANT_BOOL* network);
    HRESULT put_QueryNetworkAdapters(VARIANT_BOOL network);
    HRESULT get_RegistryKeys(SAFEARRAY** query);
    HRESULT put_RegistryKeys(SAFEARRAY* query);
    HRESULT get_RegistryMaxRecursiveDepth(uint* depth);
    HRESULT put_RegistryMaxRecursiveDepth(uint depth);
    HRESULT get_SystemStateFile(BSTR* FileName);
    HRESULT put_SystemStateFile(BSTR FileName);
}
enum IID_IAlertDataCollector = GUID(0x3837516, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IAlertDataCollector : IDataCollector
{
    HRESULT get_AlertThresholds(SAFEARRAY** alerts);
    HRESULT put_AlertThresholds(SAFEARRAY* alerts);
    HRESULT get_EventLog(VARIANT_BOOL* log);
    HRESULT put_EventLog(VARIANT_BOOL log);
    HRESULT get_SampleInterval(uint* interval);
    HRESULT put_SampleInterval(uint interval);
    HRESULT get_Task(BSTR* task);
    HRESULT put_Task(BSTR task);
    HRESULT get_TaskRunAsSelf(VARIANT_BOOL* RunAsSelf);
    HRESULT put_TaskRunAsSelf(VARIANT_BOOL RunAsSelf);
    HRESULT get_TaskArguments(BSTR* task);
    HRESULT put_TaskArguments(BSTR task);
    HRESULT get_TaskUserTextArguments(BSTR* task);
    HRESULT put_TaskUserTextArguments(BSTR task);
    HRESULT get_TriggerDataCollectorSet(BSTR* name);
    HRESULT put_TriggerDataCollectorSet(BSTR name);
}
enum IID_IApiTracingDataCollector = GUID(0x383751a, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IApiTracingDataCollector : IDataCollector
{
    HRESULT get_LogApiNamesOnly(VARIANT_BOOL* logapinames);
    HRESULT put_LogApiNamesOnly(VARIANT_BOOL logapinames);
    HRESULT get_LogApisRecursively(VARIANT_BOOL* logrecursively);
    HRESULT put_LogApisRecursively(VARIANT_BOOL logrecursively);
    HRESULT get_ExePath(BSTR* exepath);
    HRESULT put_ExePath(BSTR exepath);
    HRESULT get_LogFilePath(BSTR* logfilepath);
    HRESULT put_LogFilePath(BSTR logfilepath);
    HRESULT get_IncludeModules(SAFEARRAY** includemodules);
    HRESULT put_IncludeModules(SAFEARRAY* includemodules);
    HRESULT get_IncludeApis(SAFEARRAY** includeapis);
    HRESULT put_IncludeApis(SAFEARRAY* includeapis);
    HRESULT get_ExcludeApis(SAFEARRAY** excludeapis);
    HRESULT put_ExcludeApis(SAFEARRAY* excludeapis);
}
enum IID_IDataCollectorCollection = GUID(0x3837502, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IDataCollectorCollection : IDispatch
{
    HRESULT get_Count(int* retVal);
    HRESULT get_Item(VARIANT index, IDataCollector* collector);
    HRESULT get__NewEnum(IUnknown* retVal);
    HRESULT Add(IDataCollector collector);
    HRESULT Remove(VARIANT collector);
    HRESULT Clear();
    HRESULT AddRange(IDataCollectorCollection collectors);
    HRESULT CreateDataCollectorFromXml(BSTR bstrXml, IValueMap* pValidation, IDataCollector* pCollector);
    HRESULT CreateDataCollector(DataCollectorType Type, IDataCollector* Collector);
}
enum IID_IDataCollectorSetCollection = GUID(0x3837524, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IDataCollectorSetCollection : IDispatch
{
    HRESULT get_Count(int* retVal);
    HRESULT get_Item(VARIANT index, IDataCollectorSet* set);
    HRESULT get__NewEnum(IUnknown* retVal);
    HRESULT Add(IDataCollectorSet set);
    HRESULT Remove(VARIANT set);
    HRESULT Clear();
    HRESULT AddRange(IDataCollectorSetCollection sets);
    HRESULT GetDataCollectorSets(BSTR server, BSTR filter);
}
enum IID_ITraceDataProvider = GUID(0x3837512, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface ITraceDataProvider : IDispatch
{
    HRESULT get_DisplayName(BSTR* name);
    HRESULT put_DisplayName(BSTR name);
    HRESULT get_Guid(GUID* guid);
    HRESULT put_Guid(GUID guid);
    HRESULT get_Level(IValueMap* ppLevel);
    HRESULT get_KeywordsAny(IValueMap* ppKeywords);
    HRESULT get_KeywordsAll(IValueMap* ppKeywords);
    HRESULT get_Properties(IValueMap* ppProperties);
    HRESULT get_FilterEnabled(VARIANT_BOOL* FilterEnabled);
    HRESULT put_FilterEnabled(VARIANT_BOOL FilterEnabled);
    HRESULT get_FilterType(uint* pulType);
    HRESULT put_FilterType(uint ulType);
    HRESULT get_FilterData(SAFEARRAY** ppData);
    HRESULT put_FilterData(SAFEARRAY* pData);
    HRESULT Query(BSTR bstrName, BSTR bstrServer);
    HRESULT Resolve(IDispatch pFrom);
    HRESULT SetSecurity(BSTR Sddl);
    HRESULT GetSecurity(uint SecurityInfo, BSTR* Sddl);
    HRESULT GetRegisteredProcesses(IValueMap* Processes);
}
enum IID_ITraceDataProviderCollection = GUID(0x3837510, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface ITraceDataProviderCollection : IDispatch
{
    HRESULT get_Count(int* retVal);
    HRESULT get_Item(VARIANT index, ITraceDataProvider* ppProvider);
    HRESULT get__NewEnum(IUnknown* retVal);
    HRESULT Add(ITraceDataProvider pProvider);
    HRESULT Remove(VARIANT vProvider);
    HRESULT Clear();
    HRESULT AddRange(ITraceDataProviderCollection providers);
    HRESULT CreateTraceDataProvider(ITraceDataProvider* Provider);
    HRESULT GetTraceDataProviders(BSTR server);
    HRESULT GetTraceDataProvidersByProcess(BSTR Server, uint Pid);
}
enum IID_ISchedule = GUID(0x383753a, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface ISchedule : IDispatch
{
    HRESULT get_StartDate(VARIANT* start);
    HRESULT put_StartDate(VARIANT start);
    HRESULT get_EndDate(VARIANT* end);
    HRESULT put_EndDate(VARIANT end);
    HRESULT get_StartTime(VARIANT* start);
    HRESULT put_StartTime(VARIANT start);
    HRESULT get_Days(WeekDays* days);
    HRESULT put_Days(WeekDays days);
}
enum IID_IScheduleCollection = GUID(0x383753d, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IScheduleCollection : IDispatch
{
    HRESULT get_Count(int* retVal);
    HRESULT get_Item(VARIANT index, ISchedule* ppSchedule);
    HRESULT get__NewEnum(IUnknown* ienum);
    HRESULT Add(ISchedule pSchedule);
    HRESULT Remove(VARIANT vSchedule);
    HRESULT Clear();
    HRESULT AddRange(IScheduleCollection pSchedules);
    HRESULT CreateSchedule(ISchedule* Schedule);
}
enum IID_IValueMapItem = GUID(0x3837533, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IValueMapItem : IDispatch
{
    HRESULT get_Description(BSTR* description);
    HRESULT put_Description(BSTR description);
    HRESULT get_Enabled(VARIANT_BOOL* enabled);
    HRESULT put_Enabled(VARIANT_BOOL enabled);
    HRESULT get_Key(BSTR* key);
    HRESULT put_Key(BSTR key);
    HRESULT get_Value(VARIANT* Value);
    HRESULT put_Value(VARIANT Value);
    HRESULT get_ValueMapType(ValueMapType* type);
    HRESULT put_ValueMapType(ValueMapType type);
}
enum IID_IValueMap = GUID(0x3837534, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface IValueMap : IDispatch
{
    HRESULT get_Count(int* retVal);
    HRESULT get_Item(VARIANT index, IValueMapItem* value);
    HRESULT get__NewEnum(IUnknown* retVal);
    HRESULT get_Description(BSTR* description);
    HRESULT put_Description(BSTR description);
    HRESULT get_Value(VARIANT* Value);
    HRESULT put_Value(VARIANT Value);
    HRESULT get_ValueMapType(ValueMapType* type);
    HRESULT put_ValueMapType(ValueMapType type);
    HRESULT Add(VARIANT value);
    HRESULT Remove(VARIANT value);
    HRESULT Clear();
    HRESULT AddRange(IValueMap map);
    HRESULT CreateValueMapItem(IValueMapItem* Item);
}
enum CLSID_DataCollectorSet = GUID(0x3837521, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct DataCollectorSet
{
}
enum CLSID_TraceSession = GUID(0x383751c, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct TraceSession
{
}
enum CLSID_TraceSessionCollection = GUID(0x3837530, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct TraceSessionCollection
{
}
enum CLSID_TraceDataProvider = GUID(0x3837513, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct TraceDataProvider
{
}
enum CLSID_TraceDataProviderCollection = GUID(0x3837511, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct TraceDataProviderCollection
{
}
enum CLSID_DataCollectorSetCollection = GUID(0x3837525, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct DataCollectorSetCollection
{
}
enum CLSID_LegacyDataCollectorSet = GUID(0x3837526, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct LegacyDataCollectorSet
{
}
enum CLSID_LegacyDataCollectorSetCollection = GUID(0x3837527, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct LegacyDataCollectorSetCollection
{
}
enum CLSID_LegacyTraceSession = GUID(0x3837528, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct LegacyTraceSession
{
}
enum CLSID_LegacyTraceSessionCollection = GUID(0x3837529, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct LegacyTraceSessionCollection
{
}
enum CLSID_ServerDataCollectorSet = GUID(0x3837531, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct ServerDataCollectorSet
{
}
enum CLSID_ServerDataCollectorSetCollection = GUID(0x3837532, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct ServerDataCollectorSetCollection
{
}
enum CLSID_SystemDataCollectorSet = GUID(0x3837546, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct SystemDataCollectorSet
{
}
enum CLSID_SystemDataCollectorSetCollection = GUID(0x3837547, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct SystemDataCollectorSetCollection
{
}
enum CLSID_BootTraceSession = GUID(0x3837538, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct BootTraceSession
{
}
enum CLSID_BootTraceSessionCollection = GUID(0x3837539, 0x98b, 0x11d8, [0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
struct BootTraceSessionCollection
{
}
struct PERF_OBJECT_TYPE
{
    uint TotalByteLength;
    uint DefinitionLength;
    uint HeaderLength;
    uint ObjectNameTitleIndex;
    uint ObjectNameTitle;
    uint ObjectHelpTitleIndex;
    uint ObjectHelpTitle;
    uint DetailLevel;
    uint NumCounters;
    int DefaultCounter;
    int NumInstances;
    uint CodePage;
    long PerfTime;
    long PerfFreq;
}
struct PERF_COUNTER_DEFINITION
{
    uint ByteLength;
    uint CounterNameTitleIndex;
    uint CounterNameTitle;
    uint CounterHelpTitleIndex;
    uint CounterHelpTitle;
    int DefaultScale;
    uint DetailLevel;
    uint CounterType;
    uint CounterSize;
    uint CounterOffset;
}
struct PERF_COUNTERSET_INFO
{
    GUID CounterSetGuid;
    GUID ProviderGuid;
    uint NumCounters;
    uint InstanceType;
}
struct PERF_COUNTER_INFO
{
    uint CounterId;
    uint Type;
    ulong Attrib;
    uint Size;
    uint DetailLevel;
    int Scale;
    uint Offset;
}
struct PERF_COUNTERSET_INSTANCE
{
    GUID CounterSetGuid;
    uint dwSize;
    uint InstanceId;
    uint InstanceNameOffset;
    uint InstanceNameSize;
}
struct PERF_COUNTER_IDENTITY
{
    GUID CounterSetGuid;
    uint BufferSize;
    uint CounterId;
    uint InstanceId;
    uint MachineOffset;
    uint NameOffset;
    uint Reserved;
}
alias PERFLIBREQUEST = uint function(uint RequestCode, void* Buffer, uint BufferSize);
alias PERF_MEM_ALLOC = void* function(ulong AllocSize, void* pContext);
alias PERF_MEM_FREE = void function(void* pBuffer, void* pContext);
struct PERF_PROVIDER_CONTEXT
{
    uint ContextSize;
    uint Reserved;
    PERFLIBREQUEST ControlCallback;
    PERF_MEM_ALLOC MemAllocRoutine;
    PERF_MEM_FREE MemFreeRoutine;
    void* pMemContext;
}
struct PERF_INSTANCE_HEADER
{
    uint Size;
    uint InstanceId;
}
alias PerfRegInfoType = int;
enum : int
{
    PERF_REG_COUNTERSET_STRUCT       = 0x00000001,
    PERF_REG_COUNTER_STRUCT          = 0x00000002,
    PERF_REG_COUNTERSET_NAME_STRING  = 0x00000003,
    PERF_REG_COUNTERSET_HELP_STRING  = 0x00000004,
    PERF_REG_COUNTER_NAME_STRINGS    = 0x00000005,
    PERF_REG_COUNTER_HELP_STRINGS    = 0x00000006,
    PERF_REG_PROVIDER_NAME           = 0x00000007,
    PERF_REG_PROVIDER_GUID           = 0x00000008,
    PERF_REG_COUNTERSET_ENGLISH_NAME = 0x00000009,
    PERF_REG_COUNTER_ENGLISH_NAMES   = 0x0000000a,
}

struct PERF_COUNTERSET_REG_INFO
{
    GUID CounterSetGuid;
    uint CounterSetType;
    uint DetailLevel;
    uint NumCounters;
    uint InstanceType;
}
struct PERF_COUNTER_REG_INFO
{
    uint CounterId;
    uint Type;
    ulong Attrib;
    uint DetailLevel;
    int DefaultScale;
    uint BaseCounterId;
    uint PerfTimeId;
    uint PerfFreqId;
    uint MultiId;
    PERF_COUNTER_AGGREGATE_FUNC AggregateFunc;
    uint Reserved;
}
struct PERF_STRING_BUFFER_HEADER
{
    uint dwSize;
    uint dwCounters;
}
struct PERF_STRING_COUNTER_HEADER
{
    uint dwCounterId;
    uint dwOffset;
}
struct PERF_COUNTER_IDENTIFIER
{
    GUID CounterSetGuid;
    uint Status;
    uint Size;
    uint CounterId;
    uint InstanceId;
    uint Index;
    uint Reserved;
}
struct PERF_DATA_HEADER
{
    uint dwTotalSize;
    uint dwNumCounters;
    long PerfTimeStamp;
    long PerfTime100NSec;
    long PerfFreq;
    SYSTEMTIME SystemTime;
}
alias PerfCounterDataType = int;
enum : int
{
    PERF_ERROR_RETURN       = 0x00000000,
    PERF_SINGLE_COUNTER     = 0x00000001,
    PERF_MULTIPLE_COUNTERS  = 0x00000002,
    PERF_MULTIPLE_INSTANCES = 0x00000004,
    PERF_COUNTERSET         = 0x00000006,
}

struct PERF_COUNTER_HEADER
{
    uint dwStatus;
    PerfCounterDataType dwType;
    uint dwSize;
    uint Reserved;
}
struct PERF_MULTI_INSTANCES
{
    uint dwTotalSize;
    uint dwInstances;
}
struct PERF_MULTI_COUNTERS
{
    uint dwSize;
    uint dwCounters;
}
struct PERF_COUNTER_DATA
{
    uint dwDataSize;
    uint dwSize;
}
struct PERF_DATA_BLOCK
{
    wchar[4] Signature;
    uint LittleEndian;
    uint Version;
    uint Revision;
    uint TotalByteLength;
    uint HeaderLength;
    uint NumObjectTypes;
    int DefaultObject;
    SYSTEMTIME SystemTime;
    long PerfTime;
    long PerfFreq;
    long PerfTime100nSec;
    uint SystemNameLength;
    uint SystemNameOffset;
}
/+ [CONFLICTED] struct PERF_OBJECT_TYPE
{
    uint TotalByteLength;
    uint DefinitionLength;
    uint HeaderLength;
    uint ObjectNameTitleIndex;
    PWSTR ObjectNameTitle;
    uint ObjectHelpTitleIndex;
    PWSTR ObjectHelpTitle;
    uint DetailLevel;
    uint NumCounters;
    int DefaultCounter;
    int NumInstances;
    uint CodePage;
    long PerfTime;
    long PerfFreq;
}
+/
/+ [CONFLICTED] struct PERF_COUNTER_DEFINITION
{
    uint ByteLength;
    uint CounterNameTitleIndex;
    PWSTR CounterNameTitle;
    uint CounterHelpTitleIndex;
    PWSTR CounterHelpTitle;
    int DefaultScale;
    uint DetailLevel;
    uint CounterType;
    uint CounterSize;
    uint CounterOffset;
}
+/
struct PERF_INSTANCE_DEFINITION
{
    uint ByteLength;
    uint ParentObjectTitleIndex;
    uint ParentObjectInstance;
    int UniqueID;
    uint NameOffset;
    uint NameLength;
}
struct PERF_COUNTER_BLOCK
{
    uint ByteLength;
}
alias PM_OPEN_PROC = uint function(PWSTR pContext);
alias PM_COLLECT_PROC = uint function(PWSTR pValueName, void** ppData, uint* pcbTotalBytes, uint* pNumObjectTypes);
alias PM_CLOSE_PROC = uint function();
struct PDH_RAW_COUNTER
{
    uint CStatus;
    FILETIME TimeStamp;
    long FirstValue;
    long SecondValue;
    uint MultiCount;
}
struct PDH_RAW_COUNTER_ITEM_A
{
    PSTR szName;
    PDH_RAW_COUNTER RawValue;
}
struct PDH_RAW_COUNTER_ITEM_W
{
    PWSTR szName;
    PDH_RAW_COUNTER RawValue;
}
struct PDH_FMT_COUNTERVALUE
{
    uint CStatus;
    union
    {
        int longValue;
        double doubleValue;
        long largeValue;
        const(char)* AnsiStringValue;
        const(wchar)* WideStringValue;
    }
}
struct PDH_FMT_COUNTERVALUE_ITEM_A
{
    PSTR szName;
    PDH_FMT_COUNTERVALUE FmtValue;
}
struct PDH_FMT_COUNTERVALUE_ITEM_W
{
    PWSTR szName;
    PDH_FMT_COUNTERVALUE FmtValue;
}
struct PDH_STATISTICS
{
    uint dwFormat;
    uint count;
    PDH_FMT_COUNTERVALUE min;
    PDH_FMT_COUNTERVALUE max;
    PDH_FMT_COUNTERVALUE mean;
}
struct PDH_COUNTER_PATH_ELEMENTS_A
{
    PSTR szMachineName;
    PSTR szObjectName;
    PSTR szInstanceName;
    PSTR szParentInstance;
    uint dwInstanceIndex;
    PSTR szCounterName;
}
struct PDH_COUNTER_PATH_ELEMENTS_W
{
    PWSTR szMachineName;
    PWSTR szObjectName;
    PWSTR szInstanceName;
    PWSTR szParentInstance;
    uint dwInstanceIndex;
    PWSTR szCounterName;
}
struct PDH_DATA_ITEM_PATH_ELEMENTS_A
{
    PSTR szMachineName;
    GUID ObjectGUID;
    uint dwItemId;
    PSTR szInstanceName;
}
struct PDH_DATA_ITEM_PATH_ELEMENTS_W
{
    PWSTR szMachineName;
    GUID ObjectGUID;
    uint dwItemId;
    PWSTR szInstanceName;
}
struct PDH_COUNTER_INFO_A
{
    uint dwLength;
    uint dwType;
    uint CVersion;
    uint CStatus;
    int lScale;
    int lDefaultScale;
    ulong dwUserData;
    ulong dwQueryUserData;
    PSTR szFullPath;
    union
    {
        PDH_DATA_ITEM_PATH_ELEMENTS_A DataItemPath;
        PDH_COUNTER_PATH_ELEMENTS_A CounterPath;
        struct
        {
            PSTR szMachineName;
            PSTR szObjectName;
            PSTR szInstanceName;
            PSTR szParentInstance;
            uint dwInstanceIndex;
            PSTR szCounterName;
        }
    }
    PSTR szExplainText;
    uint[1] DataBuffer;
}
struct PDH_COUNTER_INFO_W
{
    uint dwLength;
    uint dwType;
    uint CVersion;
    uint CStatus;
    int lScale;
    int lDefaultScale;
    ulong dwUserData;
    ulong dwQueryUserData;
    PWSTR szFullPath;
    union
    {
        PDH_DATA_ITEM_PATH_ELEMENTS_W DataItemPath;
        PDH_COUNTER_PATH_ELEMENTS_W CounterPath;
        struct
        {
            PWSTR szMachineName;
            PWSTR szObjectName;
            PWSTR szInstanceName;
            PWSTR szParentInstance;
            uint dwInstanceIndex;
            PWSTR szCounterName;
        }
    }
    PWSTR szExplainText;
    uint[1] DataBuffer;
}
struct PDH_TIME_INFO
{
    long StartTime;
    long EndTime;
    uint SampleCount;
}
struct PDH_RAW_LOG_RECORD
{
    uint dwStructureSize;
    PDH_LOG_TYPE dwRecordType;
    uint dwItems;
    ubyte[1] RawBytes;
}
struct PDH_LOG_SERVICE_QUERY_INFO_A
{
    uint dwSize;
    uint dwFlags;
    uint dwLogQuota;
    PSTR szLogFileCaption;
    PSTR szDefaultDir;
    PSTR szBaseFileName;
    uint dwFileType;
    uint dwReserved;
    union
    {
        struct
        {
            uint PdlAutoNameInterval;
            uint PdlAutoNameUnits;
            PSTR PdlCommandFilename;
            PSTR PdlCounterList;
            uint PdlAutoNameFormat;
            uint PdlSampleInterval;
            FILETIME PdlLogStartTime;
            FILETIME PdlLogEndTime;
        }
        struct
        {
            uint TlNumberOfBuffers;
            uint TlMinimumBuffers;
            uint TlMaximumBuffers;
            uint TlFreeBuffers;
            uint TlBufferSize;
            uint TlEventsLost;
            uint TlLoggerThreadId;
            uint TlBuffersWritten;
            uint TlLogHandle;
            PSTR TlLogFileName;
        }
    }
}
struct PDH_LOG_SERVICE_QUERY_INFO_W
{
    uint dwSize;
    uint dwFlags;
    uint dwLogQuota;
    PWSTR szLogFileCaption;
    PWSTR szDefaultDir;
    PWSTR szBaseFileName;
    uint dwFileType;
    uint dwReserved;
    union
    {
        struct
        {
            uint PdlAutoNameInterval;
            uint PdlAutoNameUnits;
            PWSTR PdlCommandFilename;
            PWSTR PdlCounterList;
            uint PdlAutoNameFormat;
            uint PdlSampleInterval;
            FILETIME PdlLogStartTime;
            FILETIME PdlLogEndTime;
        }
        struct
        {
            uint TlNumberOfBuffers;
            uint TlMinimumBuffers;
            uint TlMaximumBuffers;
            uint TlFreeBuffers;
            uint TlBufferSize;
            uint TlEventsLost;
            uint TlLoggerThreadId;
            uint TlBuffersWritten;
            uint TlLogHandle;
            PWSTR TlLogFileName;
        }
    }
}
alias CounterPathCallBack = int function(ulong param0);
struct PDH_BROWSE_DLG_CONFIG_HW
{
    uint _bitfield0;
    HWND hWndOwner;
    PDH_HLOG hDataSource;
    PWSTR szReturnPathBuffer;
    uint cchReturnPathLength;
    CounterPathCallBack pCallBack;
    ulong dwCallBackArg;
    int CallBackStatus;
    PERF_DETAIL dwDefaultDetailLevel;
    PWSTR szDialogBoxCaption;
}
struct PDH_BROWSE_DLG_CONFIG_HA
{
    uint _bitfield0;
    HWND hWndOwner;
    PDH_HLOG hDataSource;
    PSTR szReturnPathBuffer;
    uint cchReturnPathLength;
    CounterPathCallBack pCallBack;
    ulong dwCallBackArg;
    int CallBackStatus;
    PERF_DETAIL dwDefaultDetailLevel;
    PSTR szDialogBoxCaption;
}
struct PDH_BROWSE_DLG_CONFIG_W
{
    uint _bitfield0;
    HWND hWndOwner;
    PWSTR szDataSource;
    PWSTR szReturnPathBuffer;
    uint cchReturnPathLength;
    CounterPathCallBack pCallBack;
    ulong dwCallBackArg;
    int CallBackStatus;
    PERF_DETAIL dwDefaultDetailLevel;
    PWSTR szDialogBoxCaption;
}
struct PDH_BROWSE_DLG_CONFIG_A
{
    uint _bitfield0;
    HWND hWndOwner;
    PSTR szDataSource;
    PSTR szReturnPathBuffer;
    uint cchReturnPathLength;
    CounterPathCallBack pCallBack;
    ulong dwCallBackArg;
    int CallBackStatus;
    PERF_DETAIL dwDefaultDetailLevel;
    PSTR szDialogBoxCaption;
}
alias DisplayTypeConstants = int;
enum : int
{
    sysmonLineGraph        = 0x00000001,
    sysmonHistogram        = 0x00000002,
    sysmonReport           = 0x00000003,
    sysmonChartArea        = 0x00000004,
    sysmonChartStackedArea = 0x00000005,
}

alias ReportValueTypeConstants = int;
enum : int
{
    sysmonDefaultValue = 0x00000000,
    sysmonCurrentValue = 0x00000001,
    sysmonAverage      = 0x00000002,
    sysmonMinimum      = 0x00000003,
    sysmonMaximum      = 0x00000004,
}

alias DataSourceTypeConstants = int;
enum : int
{
    sysmonNullDataSource  = 0xffffffff,
    sysmonCurrentActivity = 0x00000001,
    sysmonLogFiles        = 0x00000002,
    sysmonSqlLog          = 0x00000003,
}

alias SysmonFileType = int;
enum : int
{
    sysmonFileHtml       = 0x00000001,
    sysmonFileReport     = 0x00000002,
    sysmonFileCsv        = 0x00000003,
    sysmonFileTsv        = 0x00000004,
    sysmonFileBlg        = 0x00000005,
    sysmonFileRetiredBlg = 0x00000006,
    sysmonFileGif        = 0x00000007,
}

alias SysmonDataType = int;
enum : int
{
    sysmonDataAvg   = 0x00000001,
    sysmonDataMin   = 0x00000002,
    sysmonDataMax   = 0x00000003,
    sysmonDataTime  = 0x00000004,
    sysmonDataCount = 0x00000005,
}

alias SysmonBatchReason = int;
enum : int
{
    sysmonBatchNone                 = 0x00000000,
    sysmonBatchAddFiles             = 0x00000001,
    sysmonBatchAddCounters          = 0x00000002,
    sysmonBatchAddFilesAutoCounters = 0x00000003,
}

enum IID_ICounterItem = GUID(0x771a9520, 0xee28, 0x11ce, [0x94, 0x1e, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
interface ICounterItem : IUnknown
{
    HRESULT get_Value(double* pdblValue);
    HRESULT put_Color(uint Color);
    HRESULT get_Color(uint* pColor);
    HRESULT put_Width(int iWidth);
    HRESULT get_Width(int* piValue);
    HRESULT put_LineStyle(int iLineStyle);
    HRESULT get_LineStyle(int* piValue);
    HRESULT put_ScaleFactor(int iScale);
    HRESULT get_ScaleFactor(int* piValue);
    HRESULT get_Path(BSTR* pstrValue);
    HRESULT GetValue(double* Value, int* Status);
    HRESULT GetStatistics(double* Max, double* Min, double* Avg, int* Status);
}
enum IID_ICounterItem2 = GUID(0xeefcd4e1, 0xea1c, 0x4435, [0xb7, 0xf4, 0xe3, 0x41, 0xba, 0x3, 0xb4, 0xf9]);
interface ICounterItem2 : ICounterItem
{
    HRESULT put_Selected(VARIANT_BOOL bState);
    HRESULT get_Selected(VARIANT_BOOL* pbState);
    HRESULT put_Visible(VARIANT_BOOL bState);
    HRESULT get_Visible(VARIANT_BOOL* pbState);
    HRESULT GetDataAt(int iIndex, SysmonDataType iWhich, VARIANT* pVariant);
}
enum IID__ICounterItemUnion = GUID(0xde1a6b74, 0x9182, 0x4c41, [0x8e, 0x2c, 0x24, 0xc2, 0xcd, 0x30, 0xee, 0x83]);
interface _ICounterItemUnion : IUnknown
{
    HRESULT get_Value(double* pdblValue);
    HRESULT put_Color(uint Color);
    HRESULT get_Color(uint* pColor);
    HRESULT put_Width(int iWidth);
    HRESULT get_Width(int* piValue);
    HRESULT put_LineStyle(int iLineStyle);
    HRESULT get_LineStyle(int* piValue);
    HRESULT put_ScaleFactor(int iScale);
    HRESULT get_ScaleFactor(int* piValue);
    HRESULT get_Path(BSTR* pstrValue);
    HRESULT GetValue(double* Value, int* Status);
    HRESULT GetStatistics(double* Max, double* Min, double* Avg, int* Status);
    HRESULT put_Selected(VARIANT_BOOL bState);
    HRESULT get_Selected(VARIANT_BOOL* pbState);
    HRESULT put_Visible(VARIANT_BOOL bState);
    HRESULT get_Visible(VARIANT_BOOL* pbState);
    HRESULT GetDataAt(int iIndex, SysmonDataType iWhich, VARIANT* pVariant);
}
enum IID_DICounterItem = GUID(0xc08c4ff2, 0xe2e, 0x11cf, [0x94, 0x2c, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
interface DICounterItem : IDispatch
{
}
enum IID_ICounters = GUID(0x79167962, 0x28fc, 0x11cf, [0x94, 0x2f, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
interface ICounters : IDispatch
{
    HRESULT get_Count(int* pLong);
    HRESULT get__NewEnum(IUnknown* ppIunk);
    HRESULT get_Item(VARIANT index, DICounterItem* ppI);
    HRESULT Add(BSTR pathname, DICounterItem* ppI);
    HRESULT Remove(VARIANT index);
}
enum IID_ILogFileItem = GUID(0xd6b518dd, 0x5c7, 0x418a, [0x89, 0xe6, 0x4f, 0x9c, 0xe8, 0xc6, 0x84, 0x1e]);
interface ILogFileItem : IUnknown
{
    HRESULT get_Path(BSTR* pstrValue);
}
enum IID_DILogFileItem = GUID(0x8d093ffc, 0xf777, 0x4917, [0x82, 0xd1, 0x83, 0x3f, 0xbc, 0x54, 0xc5, 0x8f]);
interface DILogFileItem : IDispatch
{
}
enum IID_ILogFiles = GUID(0x6a2a97e6, 0x6851, 0x41ea, [0x87, 0xad, 0x2a, 0x82, 0x25, 0x33, 0x58, 0x65]);
interface ILogFiles : IDispatch
{
    HRESULT get_Count(int* pLong);
    HRESULT get__NewEnum(IUnknown* ppIunk);
    HRESULT get_Item(VARIANT index, DILogFileItem* ppI);
    HRESULT Add(BSTR pathname, DILogFileItem* ppI);
    HRESULT Remove(VARIANT index);
}
enum IID_ISystemMonitor = GUID(0x194eb241, 0xc32c, 0x11cf, [0x93, 0x98, 0x0, 0xaa, 0x0, 0xa3, 0xdd, 0xea]);
interface ISystemMonitor : IUnknown
{
    HRESULT get_Appearance(int* iAppearance);
    HRESULT put_Appearance(int iAppearance);
    HRESULT get_BackColor(uint* pColor);
    HRESULT put_BackColor(uint Color);
    HRESULT get_BorderStyle(int* iBorderStyle);
    HRESULT put_BorderStyle(int iBorderStyle);
    HRESULT get_ForeColor(uint* pColor);
    HRESULT put_ForeColor(uint Color);
    HRESULT get_Font(IFontDisp* ppFont);
    HRESULT putref_Font(IFontDisp pFont);
    HRESULT get_Counters(ICounters* ppICounters);
    HRESULT put_ShowVerticalGrid(VARIANT_BOOL bState);
    HRESULT get_ShowVerticalGrid(VARIANT_BOOL* pbState);
    HRESULT put_ShowHorizontalGrid(VARIANT_BOOL bState);
    HRESULT get_ShowHorizontalGrid(VARIANT_BOOL* pbState);
    HRESULT put_ShowLegend(VARIANT_BOOL bState);
    HRESULT get_ShowLegend(VARIANT_BOOL* pbState);
    HRESULT put_ShowScaleLabels(VARIANT_BOOL bState);
    HRESULT get_ShowScaleLabels(VARIANT_BOOL* pbState);
    HRESULT put_ShowValueBar(VARIANT_BOOL bState);
    HRESULT get_ShowValueBar(VARIANT_BOOL* pbState);
    HRESULT put_MaximumScale(int iValue);
    HRESULT get_MaximumScale(int* piValue);
    HRESULT put_MinimumScale(int iValue);
    HRESULT get_MinimumScale(int* piValue);
    HRESULT put_UpdateInterval(float fValue);
    HRESULT get_UpdateInterval(float* pfValue);
    HRESULT put_DisplayType(DisplayTypeConstants eDisplayType);
    HRESULT get_DisplayType(DisplayTypeConstants* peDisplayType);
    HRESULT put_ManualUpdate(VARIANT_BOOL bState);
    HRESULT get_ManualUpdate(VARIANT_BOOL* pbState);
    HRESULT put_GraphTitle(BSTR bsTitle);
    HRESULT get_GraphTitle(BSTR* pbsTitle);
    HRESULT put_YAxisLabel(BSTR bsTitle);
    HRESULT get_YAxisLabel(BSTR* pbsTitle);
    HRESULT CollectSample();
    HRESULT UpdateGraph();
    HRESULT BrowseCounters();
    HRESULT DisplayProperties();
    HRESULT Counter(int iIndex, ICounterItem* ppICounter);
    HRESULT AddCounter(BSTR bsPath, ICounterItem* ppICounter);
    HRESULT DeleteCounter(ICounterItem pCtr);
    HRESULT get_BackColorCtl(uint* pColor);
    HRESULT put_BackColorCtl(uint Color);
    HRESULT put_LogFileName(BSTR bsFileName);
    HRESULT get_LogFileName(BSTR* bsFileName);
    HRESULT put_LogViewStart(double StartTime);
    HRESULT get_LogViewStart(double* StartTime);
    HRESULT put_LogViewStop(double StopTime);
    HRESULT get_LogViewStop(double* StopTime);
    HRESULT get_GridColor(uint* pColor);
    HRESULT put_GridColor(uint Color);
    HRESULT get_TimeBarColor(uint* pColor);
    HRESULT put_TimeBarColor(uint Color);
    HRESULT get_Highlight(VARIANT_BOOL* pbState);
    HRESULT put_Highlight(VARIANT_BOOL bState);
    HRESULT get_ShowToolbar(VARIANT_BOOL* pbState);
    HRESULT put_ShowToolbar(VARIANT_BOOL bState);
    HRESULT Paste();
    HRESULT Copy();
    HRESULT Reset();
    HRESULT put_ReadOnly(VARIANT_BOOL bState);
    HRESULT get_ReadOnly(VARIANT_BOOL* pbState);
    HRESULT put_ReportValueType(ReportValueTypeConstants eReportValueType);
    HRESULT get_ReportValueType(ReportValueTypeConstants* peReportValueType);
    HRESULT put_MonitorDuplicateInstances(VARIANT_BOOL bState);
    HRESULT get_MonitorDuplicateInstances(VARIANT_BOOL* pbState);
    HRESULT put_DisplayFilter(int iValue);
    HRESULT get_DisplayFilter(int* piValue);
    HRESULT get_LogFiles(ILogFiles* ppILogFiles);
    HRESULT put_DataSourceType(DataSourceTypeConstants eDataSourceType);
    HRESULT get_DataSourceType(DataSourceTypeConstants* peDataSourceType);
    HRESULT put_SqlDsnName(BSTR bsSqlDsnName);
    HRESULT get_SqlDsnName(BSTR* bsSqlDsnName);
    HRESULT put_SqlLogSetName(BSTR bsSqlLogSetName);
    HRESULT get_SqlLogSetName(BSTR* bsSqlLogSetName);
}
enum IID_ISystemMonitor2 = GUID(0x8e3206a, 0x5fd2, 0x4fde, [0xa8, 0xa5, 0x8c, 0xb3, 0xb6, 0x3d, 0x26, 0x77]);
interface ISystemMonitor2 : ISystemMonitor
{
    HRESULT put_EnableDigitGrouping(VARIANT_BOOL bState);
    HRESULT get_EnableDigitGrouping(VARIANT_BOOL* pbState);
    HRESULT put_EnableToolTips(VARIANT_BOOL bState);
    HRESULT get_EnableToolTips(VARIANT_BOOL* pbState);
    HRESULT put_ShowTimeAxisLabels(VARIANT_BOOL bState);
    HRESULT get_ShowTimeAxisLabels(VARIANT_BOOL* pbState);
    HRESULT put_ChartScroll(VARIANT_BOOL bScroll);
    HRESULT get_ChartScroll(VARIANT_BOOL* pbScroll);
    HRESULT put_DataPointCount(int iNewCount);
    HRESULT get_DataPointCount(int* piDataPointCount);
    HRESULT ScaleToFit(VARIANT_BOOL bSelectedCountersOnly);
    HRESULT SaveAs(BSTR bstrFileName, SysmonFileType eSysmonFileType);
    HRESULT Relog(BSTR bstrFileName, SysmonFileType eSysmonFileType, int iFilter);
    HRESULT ClearData();
    HRESULT get_LogSourceStartTime(double* pDate);
    HRESULT get_LogSourceStopTime(double* pDate);
    HRESULT SetLogViewRange(double StartTime, double StopTime);
    HRESULT GetLogViewRange(double* StartTime, double* StopTime);
    HRESULT BatchingLock(VARIANT_BOOL fLock, SysmonBatchReason eBatchReason);
    HRESULT LoadSettings(BSTR bstrSettingFileName);
}
enum IID__ISystemMonitorUnion = GUID(0xc8a77338, 0x265f, 0x4de5, [0xaa, 0x25, 0xc7, 0xda, 0x1c, 0xe5, 0xa8, 0xf4]);
interface _ISystemMonitorUnion : IUnknown
{
    HRESULT get_Appearance(int* iAppearance);
    HRESULT put_Appearance(int iAppearance);
    HRESULT get_BackColor(uint* pColor);
    HRESULT put_BackColor(uint Color);
    HRESULT get_BorderStyle(int* iBorderStyle);
    HRESULT put_BorderStyle(int iBorderStyle);
    HRESULT get_ForeColor(uint* pColor);
    HRESULT put_ForeColor(uint Color);
    HRESULT get_Font(IFontDisp* ppFont);
    HRESULT putref_Font(IFontDisp pFont);
    HRESULT get_Counters(ICounters* ppICounters);
    HRESULT put_ShowVerticalGrid(VARIANT_BOOL bState);
    HRESULT get_ShowVerticalGrid(VARIANT_BOOL* pbState);
    HRESULT put_ShowHorizontalGrid(VARIANT_BOOL bState);
    HRESULT get_ShowHorizontalGrid(VARIANT_BOOL* pbState);
    HRESULT put_ShowLegend(VARIANT_BOOL bState);
    HRESULT get_ShowLegend(VARIANT_BOOL* pbState);
    HRESULT put_ShowScaleLabels(VARIANT_BOOL bState);
    HRESULT get_ShowScaleLabels(VARIANT_BOOL* pbState);
    HRESULT put_ShowValueBar(VARIANT_BOOL bState);
    HRESULT get_ShowValueBar(VARIANT_BOOL* pbState);
    HRESULT put_MaximumScale(int iValue);
    HRESULT get_MaximumScale(int* piValue);
    HRESULT put_MinimumScale(int iValue);
    HRESULT get_MinimumScale(int* piValue);
    HRESULT put_UpdateInterval(float fValue);
    HRESULT get_UpdateInterval(float* pfValue);
    HRESULT put_DisplayType(DisplayTypeConstants eDisplayType);
    HRESULT get_DisplayType(DisplayTypeConstants* peDisplayType);
    HRESULT put_ManualUpdate(VARIANT_BOOL bState);
    HRESULT get_ManualUpdate(VARIANT_BOOL* pbState);
    HRESULT put_GraphTitle(BSTR bsTitle);
    HRESULT get_GraphTitle(BSTR* pbsTitle);
    HRESULT put_YAxisLabel(BSTR bsTitle);
    HRESULT get_YAxisLabel(BSTR* pbsTitle);
    HRESULT CollectSample();
    HRESULT UpdateGraph();
    HRESULT BrowseCounters();
    HRESULT DisplayProperties();
    HRESULT Counter(int iIndex, ICounterItem* ppICounter);
    HRESULT AddCounter(BSTR bsPath, ICounterItem* ppICounter);
    HRESULT DeleteCounter(ICounterItem pCtr);
    HRESULT get_BackColorCtl(uint* pColor);
    HRESULT put_BackColorCtl(uint Color);
    HRESULT put_LogFileName(BSTR bsFileName);
    HRESULT get_LogFileName(BSTR* bsFileName);
    HRESULT put_LogViewStart(double StartTime);
    HRESULT get_LogViewStart(double* StartTime);
    HRESULT put_LogViewStop(double StopTime);
    HRESULT get_LogViewStop(double* StopTime);
    HRESULT get_GridColor(uint* pColor);
    HRESULT put_GridColor(uint Color);
    HRESULT get_TimeBarColor(uint* pColor);
    HRESULT put_TimeBarColor(uint Color);
    HRESULT get_Highlight(VARIANT_BOOL* pbState);
    HRESULT put_Highlight(VARIANT_BOOL bState);
    HRESULT get_ShowToolbar(VARIANT_BOOL* pbState);
    HRESULT put_ShowToolbar(VARIANT_BOOL bState);
    HRESULT Paste();
    HRESULT Copy();
    HRESULT Reset();
    HRESULT put_ReadOnly(VARIANT_BOOL bState);
    HRESULT get_ReadOnly(VARIANT_BOOL* pbState);
    HRESULT put_ReportValueType(ReportValueTypeConstants eReportValueType);
    HRESULT get_ReportValueType(ReportValueTypeConstants* peReportValueType);
    HRESULT put_MonitorDuplicateInstances(VARIANT_BOOL bState);
    HRESULT get_MonitorDuplicateInstances(VARIANT_BOOL* pbState);
    HRESULT put_DisplayFilter(int iValue);
    HRESULT get_DisplayFilter(int* piValue);
    HRESULT get_LogFiles(ILogFiles* ppILogFiles);
    HRESULT put_DataSourceType(DataSourceTypeConstants eDataSourceType);
    HRESULT get_DataSourceType(DataSourceTypeConstants* peDataSourceType);
    HRESULT put_SqlDsnName(BSTR bsSqlDsnName);
    HRESULT get_SqlDsnName(BSTR* bsSqlDsnName);
    HRESULT put_SqlLogSetName(BSTR bsSqlLogSetName);
    HRESULT get_SqlLogSetName(BSTR* bsSqlLogSetName);
    HRESULT put_EnableDigitGrouping(VARIANT_BOOL bState);
    HRESULT get_EnableDigitGrouping(VARIANT_BOOL* pbState);
    HRESULT put_EnableToolTips(VARIANT_BOOL bState);
    HRESULT get_EnableToolTips(VARIANT_BOOL* pbState);
    HRESULT put_ShowTimeAxisLabels(VARIANT_BOOL bState);
    HRESULT get_ShowTimeAxisLabels(VARIANT_BOOL* pbState);
    HRESULT put_ChartScroll(VARIANT_BOOL bScroll);
    HRESULT get_ChartScroll(VARIANT_BOOL* pbScroll);
    HRESULT put_DataPointCount(int iNewCount);
    HRESULT get_DataPointCount(int* piDataPointCount);
    HRESULT ScaleToFit(VARIANT_BOOL bSelectedCountersOnly);
    HRESULT SaveAs(BSTR bstrFileName, SysmonFileType eSysmonFileType);
    HRESULT Relog(BSTR bstrFileName, SysmonFileType eSysmonFileType, int iFilter);
    HRESULT ClearData();
    HRESULT get_LogSourceStartTime(double* pDate);
    HRESULT get_LogSourceStopTime(double* pDate);
    HRESULT SetLogViewRange(double StartTime, double StopTime);
    HRESULT GetLogViewRange(double* StartTime, double* StopTime);
    HRESULT BatchingLock(VARIANT_BOOL fLock, SysmonBatchReason eBatchReason);
    HRESULT LoadSettings(BSTR bstrSettingFileName);
}
enum IID_DISystemMonitor = GUID(0x13d73d81, 0xc32e, 0x11cf, [0x93, 0x98, 0x0, 0xaa, 0x0, 0xa3, 0xdd, 0xea]);
interface DISystemMonitor : IDispatch
{
}
enum IID_DISystemMonitorInternal = GUID(0x194eb242, 0xc32c, 0x11cf, [0x93, 0x98, 0x0, 0xaa, 0x0, 0xa3, 0xdd, 0xea]);
interface DISystemMonitorInternal : IDispatch
{
}
enum IID_ISystemMonitorEvents = GUID(0xee660ea0, 0x4abd, 0x11cf, [0x94, 0x3a, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
interface ISystemMonitorEvents : IUnknown
{
    void OnCounterSelected(int Index);
    void OnCounterAdded(int Index);
    void OnCounterDeleted(int Index);
    void OnSampleCollected();
    void OnDblClick(int Index);
}
enum IID_DISystemMonitorEvents = GUID(0x84979930, 0x4ab3, 0x11cf, [0x94, 0x3a, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
interface DISystemMonitorEvents : IDispatch
{
}
enum CLSID_SystemMonitor = GUID(0xc4d2d8e0, 0xd1dd, 0x11ce, [0x94, 0xf, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
struct SystemMonitor
{
}
enum CLSID_CounterItem = GUID(0xc4d2d8e0, 0xd1dd, 0x11ce, [0x94, 0xf, 0x0, 0x80, 0x29, 0x0, 0x43, 0x48]);
struct CounterItem
{
}
enum CLSID_Counters = GUID(0xb2b066d2, 0x2aac, 0x11cf, [0x94, 0x2f, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
struct Counters
{
}
enum CLSID_LogFileItem = GUID(0x16ec5be8, 0xdf93, 0x4237, [0x94, 0xe4, 0x9e, 0xe9, 0x18, 0x11, 0x1d, 0x71]);
struct LogFileItem
{
}
enum CLSID_LogFiles = GUID(0x2735d9fd, 0xf6b9, 0x4f19, [0xa5, 0xd9, 0xe2, 0xd0, 0x68, 0x58, 0x4b, 0xc5]);
struct LogFiles
{
}
enum CLSID_CounterItem2 = GUID(0x43196c62, 0xc31f, 0x4ce3, [0xa0, 0x2e, 0x79, 0xef, 0xe0, 0xf6, 0xa5, 0x25]);
struct CounterItem2
{
}
enum CLSID_SystemMonitor2 = GUID(0x7f30578c, 0x5f38, 0x4612, [0xac, 0xfe, 0x6e, 0xd0, 0x4c, 0x7b, 0x7a, 0xf8]);
struct SystemMonitor2
{
}
enum CLSID_AppearPropPage = GUID(0xe49741e9, 0x93a8, 0x4ab1, [0x8e, 0x96, 0xbf, 0x44, 0x82, 0x28, 0x2e, 0x9c]);
struct AppearPropPage
{
}
enum CLSID_GeneralPropPage = GUID(0xc3e5d3d2, 0x1a03, 0x11cf, [0x94, 0x2d, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
struct GeneralPropPage
{
}
enum CLSID_GraphPropPage = GUID(0xc3e5d3d3, 0x1a03, 0x11cf, [0x94, 0x2d, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
struct GraphPropPage
{
}
enum CLSID_SourcePropPage = GUID(0xcf32aa1, 0x7571, 0x11d0, [0x93, 0xc4, 0x0, 0xaa, 0x0, 0xa3, 0xdd, 0xea]);
struct SourcePropPage
{
}
enum CLSID_CounterPropPage = GUID(0xcf948561, 0xede8, 0x11ce, [0x94, 0x1e, 0x0, 0x80, 0x29, 0x0, 0x43, 0x47]);
struct CounterPropPage
{
}
