module windows.win32.security.diagnosticdataquery;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, PWSTR;

version (Windows):
extern (Windows):

alias HDIAGNOSTIC_DATA_QUERY_SESSION = void*;
alias HDIAGNOSTIC_REPORT = void*;
alias HDIAGNOSTIC_EVENT_TAG_DESCRIPTION = void*;
alias HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION = void*;
alias HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION = void*;
alias HDIAGNOSTIC_RECORD = void*;
alias DdqAccessLevel = int;
enum : int
{
    NoData          = 0x00000000,
    CurrentUserData = 0x00000001,
    AllUserData     = 0x00000002,
}

struct DIAGNOSTIC_DATA_RECORD
{
    long rowId;
    ulong timestamp;
    ulong eventKeywords;
    PWSTR fullEventName;
    PWSTR providerGroupGuid;
    PWSTR producerName;
    int* privacyTags;
    uint privacyTagCount;
    int* categoryIds;
    uint categoryIdCount;
    BOOL isCoreData;
    PWSTR extra1;
    PWSTR extra2;
    PWSTR extra3;
}
struct DIAGNOSTIC_DATA_SEARCH_CRITERIA
{
    const(wchar)** producerNames;
    uint producerNameCount;
    const(wchar)* textToMatch;
    const(int)* categoryIds;
    uint categoryIdCount;
    const(int)* privacyTags;
    uint privacyTagCount;
    BOOL coreDataOnly;
}
struct DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION
{
    int privacyTag;
    PWSTR name;
    PWSTR description;
}
struct DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION
{
    PWSTR name;
}
struct DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION
{
    int id;
    PWSTR name;
}
struct DIAGNOSTIC_DATA_EVENT_TAG_STATS
{
    int privacyTag;
    uint eventCount;
}
struct DIAGNOSTIC_DATA_EVENT_BINARY_STATS
{
    PWSTR moduleName;
    PWSTR friendlyModuleName;
    uint eventCount;
    ulong uploadSizeBytes;
}
struct DIAGNOSTIC_DATA_GENERAL_STATS
{
    uint optInLevel;
    ulong transcriptSizeBytes;
    ulong oldestEventTimestamp;
    uint totalEventCountLast24Hours;
    float averageDailyEvents;
}
struct DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION
{
    uint hoursOfHistoryToKeep;
    uint maxStoreMegabytes;
    uint requestedMaxStoreMegabytes;
}
struct DIAGNOSTIC_REPORT_PARAMETER
{
    wchar[129] name;
    wchar[260] value;
}
struct DIAGNOSTIC_REPORT_SIGNATURE
{
    wchar[65] eventName;
    DIAGNOSTIC_REPORT_PARAMETER[10] parameters;
}
struct DIAGNOSTIC_REPORT_DATA
{
    DIAGNOSTIC_REPORT_SIGNATURE signature;
    GUID bucketId;
    GUID reportId;
    FILETIME creationTime;
    ulong sizeInBytes;
    PWSTR cabId;
    uint reportStatus;
    GUID reportIntegratorId;
    PWSTR* fileNames;
    uint fileCount;
    PWSTR friendlyEventName;
    PWSTR applicationName;
    PWSTR applicationPath;
    PWSTR description;
    PWSTR bucketIdString;
    ulong legacyBucketId;
    PWSTR reportKey;
}
HRESULT DdqCreateSession(DdqAccessLevel accessLevel, HDIAGNOSTIC_DATA_QUERY_SESSION* hSession);
HRESULT DdqCloseSession(HDIAGNOSTIC_DATA_QUERY_SESSION hSession);
HRESULT DdqGetSessionAccessLevel(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, DdqAccessLevel* accessLevel);
HRESULT DdqGetDiagnosticDataAccessLevelAllowed(DdqAccessLevel* accessLevel);
HRESULT DdqGetDiagnosticRecordStats(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(DIAGNOSTIC_DATA_SEARCH_CRITERIA)* searchCriteria, uint* recordCount, long* minRowId, long* maxRowId);
HRESULT DdqGetDiagnosticRecordPayload(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, long rowId, const(wchar)** payload);
HRESULT DdqGetDiagnosticRecordLocaleTags(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(wchar)* locale, HDIAGNOSTIC_EVENT_TAG_DESCRIPTION* hTagDescription);
HRESULT DdqFreeDiagnosticRecordLocaleTags(HDIAGNOSTIC_EVENT_TAG_DESCRIPTION hTagDescription);
HRESULT DdqGetDiagnosticRecordLocaleTagAtIndex(HDIAGNOSTIC_EVENT_TAG_DESCRIPTION hTagDescription, uint index, DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION* tagDescription);
HRESULT DdqGetDiagnosticRecordLocaleTagCount(HDIAGNOSTIC_EVENT_TAG_DESCRIPTION hTagDescription, uint* tagDescriptionCount);
HRESULT DdqGetDiagnosticRecordProducers(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION* hProducerDescription);
HRESULT DdqFreeDiagnosticRecordProducers(HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION hProducerDescription);
HRESULT DdqGetDiagnosticRecordProducerAtIndex(HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION hProducerDescription, uint index, DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION* producerDescription);
HRESULT DdqGetDiagnosticRecordProducerCount(HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION hProducerDescription, uint* producerDescriptionCount);
HRESULT DdqGetDiagnosticRecordProducerCategories(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(wchar)* producerName, HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION* hCategoryDescription);
HRESULT DdqFreeDiagnosticRecordProducerCategories(HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION hCategoryDescription);
HRESULT DdqGetDiagnosticRecordCategoryAtIndex(HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION hCategoryDescription, uint index, DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION* categoryDescription);
HRESULT DdqGetDiagnosticRecordCategoryCount(HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION hCategoryDescription, uint* categoryDescriptionCount);
HRESULT DdqIsDiagnosticRecordSampledIn(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(GUID)* providerGroup, const(GUID)* providerId, const(wchar)* providerName, const(uint)* eventId, const(wchar)* eventName, const(uint)* eventVersion, const(ulong)* eventKeywords, BOOL* isSampledIn);
HRESULT DdqGetDiagnosticRecordPage(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, DIAGNOSTIC_DATA_SEARCH_CRITERIA* searchCriteria, uint offset, uint pageRecordCount, long baseRowId, HDIAGNOSTIC_RECORD* hRecord);
HRESULT DdqFreeDiagnosticRecordPage(HDIAGNOSTIC_RECORD hRecord);
HRESULT DdqGetDiagnosticRecordAtIndex(HDIAGNOSTIC_RECORD hRecord, uint index, DIAGNOSTIC_DATA_RECORD* record);
HRESULT DdqGetDiagnosticRecordCount(HDIAGNOSTIC_RECORD hRecord, uint* recordCount);
HRESULT DdqGetDiagnosticReportStoreReportCount(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, uint reportStoreType, uint* reportCount);
HRESULT DdqCancelDiagnosticRecordOperation(HDIAGNOSTIC_DATA_QUERY_SESSION hSession);
HRESULT DdqGetDiagnosticReport(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, uint reportStoreType, HDIAGNOSTIC_REPORT* hReport);
HRESULT DdqFreeDiagnosticReport(HDIAGNOSTIC_REPORT hReport);
HRESULT DdqGetDiagnosticReportAtIndex(HDIAGNOSTIC_REPORT hReport, uint index, DIAGNOSTIC_REPORT_DATA* report);
HRESULT DdqGetDiagnosticReportCount(HDIAGNOSTIC_REPORT hReport, uint* reportCount);
HRESULT DdqExtractDiagnosticReport(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, uint reportStoreType, const(wchar)* reportKey, const(wchar)* destinationPath);
HRESULT DdqGetDiagnosticRecordTagDistribution(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(wchar)** producerNames, uint producerNameCount, DIAGNOSTIC_DATA_EVENT_TAG_STATS** tagStats, uint* statCount);
HRESULT DdqGetDiagnosticRecordBinaryDistribution(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(wchar)** producerNames, uint producerNameCount, uint topNBinaries, DIAGNOSTIC_DATA_EVENT_BINARY_STATS** binaryStats, uint* statCount);
HRESULT DdqGetDiagnosticRecordSummary(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(wchar)** producerNames, uint producerNameCount, DIAGNOSTIC_DATA_GENERAL_STATS* generalStats);
HRESULT DdqSetTranscriptConfiguration(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, const(DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION)* desiredConfig);
HRESULT DdqGetTranscriptConfiguration(HDIAGNOSTIC_DATA_QUERY_SESSION hSession, DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION* currentConfig);
