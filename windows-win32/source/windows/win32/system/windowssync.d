module windows.win32.system.windowssync;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, PROPERTYKEY, PWSTR;
import windows.win32.system.com : IUnknown;
import windows.win32.ui.shell.propertiessystem : IPropertyStore;

version (Windows):
extern (Windows):

enum SYNC_VERSION_FLAG_FROM_FEED = 0x00000001;
enum SYNC_VERSION_FLAG_HAS_BY = 0x00000002;
enum SYNC_SERIALIZE_REPLICA_KEY_MAP = 0x00000001;
enum SYNC_FILTER_INFO_FLAG_ITEM_LIST = 0x00000001;
enum SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST = 0x00000002;
enum SYNC_FILTER_INFO_FLAG_CUSTOM = 0x00000004;
enum SYNC_FILTER_INFO_COMBINED = 0x00000008;
enum SYNC_CHANGE_FLAG_DELETED = 0x00000001;
enum SYNC_CHANGE_FLAG_DOES_NOT_EXIST = 0x00000002;
enum SYNC_CHANGE_FLAG_GHOST = 0x00000004;
enum SCC_DEFAULT = 0x00000000;
enum SCC_CAN_CREATE_WITHOUT_UI = 0x00000001;
enum SCC_CAN_MODIFY_WITHOUT_UI = 0x00000002;
enum SCC_CREATE_NOT_SUPPORTED = 0x00000004;
enum SCC_MODIFY_NOT_SUPPORTED = 0x00000008;
enum SPC_DEFAULT = 0x00000000;
enum SYNC_PROVIDER_STATE_ENABLED = 0x00000001;
enum SYNC_PROVIDER_STATE_DIRTY = 0x00000002;
enum SYNC_PROVIDER_CONFIGURATION_VERSION = 0x00000001;
enum SYNC_PROVIDER_CONFIGUI_CONFIGURATION_VERSION = 0x00000001;
enum SYNC_32_BIT_SUPPORTED = 0x00000001;
enum SYNC_64_BIT_SUPPORTED = 0x00000002;
enum PKEY_PROVIDER_INSTANCEID = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 2);
enum PKEY_PROVIDER_CLSID = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 3);
enum PKEY_PROVIDER_CONFIGUI = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 4);
enum PKEY_PROVIDER_CONTENTTYPE = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 5);
enum PKEY_PROVIDER_CAPABILITIES = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 6);
enum PKEY_PROVIDER_SUPPORTED_ARCHITECTURE = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 7);
enum PKEY_PROVIDER_NAME = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 8);
enum PKEY_PROVIDER_DESCRIPTION = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 9);
enum PKEY_PROVIDER_TOOLTIPS = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 10);
enum PKEY_PROVIDER_ICON = PROPERTYKEY(GUID(2216140385, 24822, 19484, [136, 237, 241, 197, 49, 179, 43, 218]), 11);
enum PKEY_CONFIGUI_INSTANCEID = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 2);
enum PKEY_CONFIGUI_CLSID = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 3);
enum PKEY_CONFIGUI_CONTENTTYPE = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 4);
enum PKEY_CONFIGUI_CAPABILITIES = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 5);
enum PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 6);
enum PKEY_CONFIGUI_IS_GLOBAL = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 7);
enum PKEY_CONFIGUI_NAME = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 8);
enum PKEY_CONFIGUI_DESCRIPTION = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 9);
enum PKEY_CONFIGUI_TOOLTIPS = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 10);
enum PKEY_CONFIGUI_ICON = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 11);
enum PKEY_CONFIGUI_MENUITEM_NOUI = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 12);
enum PKEY_CONFIGUI_MENUITEM = PROPERTYKEY(GUID(1430988010, 59619, 17850, [147, 82, 223, 181, 97, 225, 113, 228]), 13);
struct ID_PARAMETER_PAIR
{
    BOOL fIsVariable;
    ushort cbIdSize;
}
struct ID_PARAMETERS
{
    uint dwSize;
    ID_PARAMETER_PAIR replicaId;
    ID_PARAMETER_PAIR itemId;
    ID_PARAMETER_PAIR changeUnitId;
}
struct SYNC_SESSION_STATISTICS
{
    uint dwChangesApplied;
    uint dwChangesFailed;
}
struct SYNC_VERSION
{
    uint dwLastUpdatingReplicaKey;
    ulong ullTickCount;
}
struct SYNC_RANGE
{
    ubyte* pbClosedLowerBound;
    ubyte* pbClosedUpperBound;
}
struct SYNC_TIME
{
    uint dwDate;
    uint dwTime;
}
struct SYNC_FILTER_CHANGE
{
    BOOL fMoveIn;
    SYNC_VERSION moveVersion;
}
alias SYNC_PROVIDER_ROLE = int;
enum : int
{
    SPR_SOURCE      = 0x00000000,
    SPR_DESTINATION = 0x00000001,
}

alias CONFLICT_RESOLUTION_POLICY = int;
enum : int
{
    CRP_NONE                      = 0x00000000,
    CRP_DESTINATION_PROVIDER_WINS = 0x00000001,
    CRP_SOURCE_PROVIDER_WINS      = 0x00000002,
    CRP_LAST                      = 0x00000003,
}

alias SYNC_PROGRESS_STAGE = int;
enum : int
{
    SPS_CHANGE_DETECTION   = 0x00000000,
    SPS_CHANGE_ENUMERATION = 0x00000001,
    SPS_CHANGE_APPLICATION = 0x00000002,
}

alias SYNC_FULL_ENUMERATION_ACTION = int;
enum : int
{
    SFEA_FULL_ENUMERATION = 0x00000000,
    SFEA_PARTIAL_SYNC     = 0x00000001,
    SFEA_ABORT            = 0x00000002,
}

alias SYNC_RESOLVE_ACTION = int;
enum : int
{
    SRA_DEFER                       = 0x00000000,
    SRA_ACCEPT_DESTINATION_PROVIDER = 0x00000001,
    SRA_ACCEPT_SOURCE_PROVIDER      = 0x00000002,
    SRA_MERGE                       = 0x00000003,
    SRA_TRANSFER_AND_DEFER          = 0x00000004,
    SRA_LAST                        = 0x00000005,
}

alias SYNC_STATISTICS = int;
enum : int
{
    SYNC_STATISTICS_RANGE_COUNT = 0x00000000,
}

alias SYNC_SERIALIZATION_VERSION = int;
enum : int
{
    SYNC_SERIALIZATION_VERSION_V1 = 0x00000001,
    SYNC_SERIALIZATION_VERSION_V2 = 0x00000004,
    SYNC_SERIALIZATION_VERSION_V3 = 0x00000005,
}

alias FILTERING_TYPE = int;
enum : int
{
    FT_CURRENT_ITEMS_ONLY                             = 0x00000000,
    FT_CURRENT_ITEMS_AND_VERSIONS_FOR_MOVED_OUT_ITEMS = 0x00000001,
}

alias SYNC_CONSTRAINT_RESOLVE_ACTION = int;
enum : int
{
    SCRA_DEFER                       = 0x00000000,
    SCRA_ACCEPT_DESTINATION_PROVIDER = 0x00000001,
    SCRA_ACCEPT_SOURCE_PROVIDER      = 0x00000002,
    SCRA_TRANSFER_AND_DEFER          = 0x00000003,
    SCRA_MERGE                       = 0x00000004,
    SCRA_RENAME_SOURCE               = 0x00000005,
    SCRA_RENAME_DESTINATION          = 0x00000006,
}

alias CONSTRAINT_CONFLICT_REASON = int;
enum : int
{
    CCR_OTHER     = 0x00000000,
    CCR_COLLISION = 0x00000001,
    CCR_NOPARENT  = 0x00000002,
    CCR_IDENTITY  = 0x00000003,
}

alias KNOWLEDGE_COOKIE_COMPARISON_RESULT = int;
enum : int
{
    KCCR_COOKIE_KNOWLEDGE_EQUAL          = 0x00000000,
    KCCR_COOKIE_KNOWLEDGE_CONTAINED      = 0x00000001,
    KCCR_COOKIE_KNOWLEDGE_CONTAINS       = 0x00000002,
    KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE = 0x00000003,
}

enum IID_IClockVectorElement = GUID(0xe71c4250, 0xadf8, 0x4a07, [0x8f, 0xae, 0x56, 0x69, 0x59, 0x69, 0x9, 0xc1]);
interface IClockVectorElement : IUnknown
{
    HRESULT GetReplicaKey(uint* pdwReplicaKey);
    HRESULT GetTickCount(ulong* pullTickCount);
}
enum IID_IFeedClockVectorElement = GUID(0xa40b46d2, 0xe97b, 0x4156, [0xb6, 0xda, 0x99, 0x1f, 0x50, 0x1b, 0xf, 0x5]);
interface IFeedClockVectorElement : IClockVectorElement
{
    HRESULT GetSyncTime(SYNC_TIME* pSyncTime);
    HRESULT GetFlags(ubyte* pbFlags);
}
enum IID_IClockVector = GUID(0x14b2274a, 0x8698, 0x4cc6, [0x93, 0x33, 0xf8, 0x9b, 0xd1, 0xd4, 0x7b, 0xc4]);
interface IClockVector : IUnknown
{
    HRESULT GetClockVectorElements(const(GUID)* riid, void** ppiEnumClockVector);
    HRESULT GetClockVectorElementCount(uint* pdwCount);
}
enum IID_IFeedClockVector = GUID(0x8d1d98d1, 0x9fb8, 0x4ec9, [0xa5, 0x53, 0x54, 0xdd, 0x92, 0x4e, 0xf, 0x67]);
interface IFeedClockVector : IClockVector
{
    HRESULT GetUpdateCount(uint* pdwUpdateCount);
    HRESULT IsNoConflictsSpecified(BOOL* pfIsNoConflictsSpecified);
}
enum IID_IEnumClockVector = GUID(0x525844db, 0x2837, 0x4799, [0x9e, 0x80, 0x81, 0xa6, 0x6e, 0x2, 0x22, 0xc]);
interface IEnumClockVector : IUnknown
{
    HRESULT Next(uint cClockVectorElements, IClockVectorElement* ppiClockVectorElements, uint* pcFetched);
    HRESULT Skip(uint cSyncVersions);
    HRESULT Reset();
    HRESULT Clone(IEnumClockVector* ppiEnum);
}
enum IID_IEnumFeedClockVector = GUID(0x550f763d, 0x146a, 0x48f6, [0xab, 0xeb, 0x6c, 0x88, 0xc7, 0xf7, 0x5, 0x14]);
interface IEnumFeedClockVector : IUnknown
{
    HRESULT Next(uint cClockVectorElements, IFeedClockVectorElement* ppiClockVectorElements, uint* pcFetched);
    HRESULT Skip(uint cSyncVersions);
    HRESULT Reset();
    HRESULT Clone(IEnumFeedClockVector* ppiEnum);
}
enum IID_ICoreFragment = GUID(0x613b2ab5, 0xb304, 0x47d9, [0x9c, 0x31, 0xce, 0x6c, 0x54, 0x40, 0x1a, 0x15]);
interface ICoreFragment : IUnknown
{
    HRESULT NextColumn(ubyte* pChangeUnitId, uint* pChangeUnitIdSize);
    HRESULT NextRange(ubyte* pItemId, uint* pItemIdSize, IClockVector* piClockVector);
    HRESULT Reset();
    HRESULT GetColumnCount(uint* pColumnCount);
    HRESULT GetRangeCount(uint* pRangeCount);
}
enum IID_ICoreFragmentInspector = GUID(0xf7fcc5fd, 0xae26, 0x4679, [0xba, 0x16, 0x96, 0xaa, 0xc5, 0x83, 0xc1, 0x34]);
interface ICoreFragmentInspector : IUnknown
{
    HRESULT NextCoreFragments(uint requestedCount, ICoreFragment* ppiCoreFragments, uint* pFetchedCount);
    HRESULT Reset();
}
enum IID_IRangeException = GUID(0x75ae8777, 0x6848, 0x49f7, [0x95, 0x6c, 0xa3, 0xa9, 0x2f, 0x50, 0x96, 0xe8]);
interface IRangeException : IUnknown
{
    HRESULT GetClosedRangeStart(ubyte* pbClosedRangeStart, uint* pcbIdSize);
    HRESULT GetClosedRangeEnd(ubyte* pbClosedRangeEnd, uint* pcbIdSize);
    HRESULT GetClockVector(const(GUID)* riid, void** ppUnk);
}
enum IID_IEnumRangeExceptions = GUID(0x944439f, 0xddb1, 0x4176, [0xb7, 0x3, 0x4, 0x6f, 0xf2, 0x2a, 0x23, 0x86]);
interface IEnumRangeExceptions : IUnknown
{
    HRESULT Next(uint cExceptions, IRangeException* ppRangeException, uint* pcFetched);
    HRESULT Skip(uint cExceptions);
    HRESULT Reset();
    HRESULT Clone(IEnumRangeExceptions* ppEnum);
}
enum IID_ISingleItemException = GUID(0x892fb9b0, 0x7c55, 0x4a18, [0x93, 0x16, 0xfd, 0xf4, 0x49, 0x56, 0x9b, 0x64]);
interface ISingleItemException : IUnknown
{
    HRESULT GetItemId(ubyte* pbItemId, uint* pcbIdSize);
    HRESULT GetClockVector(const(GUID)* riid, void** ppUnk);
}
enum IID_IEnumSingleItemExceptions = GUID(0xe563381c, 0x1b4d, 0x4c66, [0x97, 0x96, 0xc8, 0x6f, 0xac, 0xcd, 0xcd, 0x40]);
interface IEnumSingleItemExceptions : IUnknown
{
    HRESULT Next(uint cExceptions, ISingleItemException* ppSingleItemException, uint* pcFetched);
    HRESULT Skip(uint cExceptions);
    HRESULT Reset();
    HRESULT Clone(IEnumSingleItemExceptions* ppEnum);
}
enum IID_IChangeUnitException = GUID(0xcd7ee7c, 0xfec0, 0x4021, [0x99, 0xee, 0xf0, 0xe5, 0x34, 0x8f, 0x2a, 0x5f]);
interface IChangeUnitException : IUnknown
{
    HRESULT GetItemId(ubyte* pbItemId, uint* pcbIdSize);
    HRESULT GetChangeUnitId(ubyte* pbChangeUnitId, uint* pcbIdSize);
    HRESULT GetClockVector(const(GUID)* riid, void** ppUnk);
}
enum IID_IEnumChangeUnitExceptions = GUID(0x3074e802, 0x9319, 0x4420, [0xbe, 0x21, 0x10, 0x22, 0xe2, 0xe2, 0x1d, 0xa8]);
interface IEnumChangeUnitExceptions : IUnknown
{
    HRESULT Next(uint cExceptions, IChangeUnitException* ppChangeUnitException, uint* pcFetched);
    HRESULT Skip(uint cExceptions);
    HRESULT Reset();
    HRESULT Clone(IEnumChangeUnitExceptions* ppEnum);
}
enum IID_IReplicaKeyMap = GUID(0x2209f4fc, 0xfd10, 0x4ff0, [0x84, 0xa8, 0xf0, 0xa1, 0x98, 0x2e, 0x44, 0xe]);
interface IReplicaKeyMap : IUnknown
{
    HRESULT LookupReplicaKey(const(ubyte)* pbReplicaId, uint* pdwReplicaKey);
    HRESULT LookupReplicaId(uint dwReplicaKey, ubyte* pbReplicaId, uint* pcbIdSize);
    HRESULT Serialize(ubyte* pbReplicaKeyMap, uint* pcbReplicaKeyMap);
}
enum IID_IConstructReplicaKeyMap = GUID(0xded10970, 0xec85, 0x4115, [0xb5, 0x2c, 0x44, 0x5, 0x84, 0x56, 0x42, 0xa5]);
interface IConstructReplicaKeyMap : IUnknown
{
    HRESULT FindOrAddReplica(const(ubyte)* pbReplicaId, uint* pdwReplicaKey);
}
enum IID_ISyncKnowledge = GUID(0x615bbb53, 0xc945, 0x4203, [0xbf, 0x4b, 0x2c, 0xb6, 0x59, 0x19, 0xa0, 0xaa]);
interface ISyncKnowledge : IUnknown
{
    HRESULT GetOwnerReplicaId(ubyte* pbReplicaId, uint* pcbIdSize);
    HRESULT Serialize(BOOL fSerializeReplicaKeyMap, ubyte* pbKnowledge, uint* pcbKnowledge);
    HRESULT SetLocalTickCount(ulong ullTickCount);
    HRESULT ContainsChange(const(ubyte)* pbVersionOwnerReplicaId, const(ubyte)* pgidItemId, const(SYNC_VERSION)* pSyncVersion);
    HRESULT ContainsChangeUnit(const(ubyte)* pbVersionOwnerReplicaId, const(ubyte)* pbItemId, const(ubyte)* pbChangeUnitId, const(SYNC_VERSION)* pSyncVersion);
    HRESULT GetScopeVector(const(GUID)* riid, void** ppUnk);
    HRESULT GetReplicaKeyMap(IReplicaKeyMap* ppReplicaKeyMap);
    HRESULT Clone(ISyncKnowledge* ppClonedKnowledge);
    HRESULT ConvertVersion(ISyncKnowledge pKnowledgeIn, const(ubyte)* pbCurrentOwnerId, const(SYNC_VERSION)* pVersionIn, ubyte* pbNewOwnerId, uint* pcbIdSize, SYNC_VERSION* pVersionOut);
    HRESULT MapRemoteToLocal(ISyncKnowledge pRemoteKnowledge, ISyncKnowledge* ppMappedKnowledge);
    HRESULT Union(ISyncKnowledge pKnowledge);
    HRESULT ProjectOntoItem(const(ubyte)* pbItemId, ISyncKnowledge* ppKnowledgeOut);
    HRESULT ProjectOntoChangeUnit(const(ubyte)* pbItemId, const(ubyte)* pbChangeUnitId, ISyncKnowledge* ppKnowledgeOut);
    HRESULT ProjectOntoRange(const(SYNC_RANGE)* psrngSyncRange, ISyncKnowledge* ppKnowledgeOut);
    HRESULT ExcludeItem(const(ubyte)* pbItemId);
    HRESULT ExcludeChangeUnit(const(ubyte)* pbItemId, const(ubyte)* pbChangeUnitId);
    HRESULT ContainsKnowledge(ISyncKnowledge pKnowledge);
    HRESULT FindMinTickCountForReplica(const(ubyte)* pbReplicaId, ulong* pullReplicaTickCount);
    HRESULT GetRangeExceptions(const(GUID)* riid, void** ppUnk);
    HRESULT GetSingleItemExceptions(const(GUID)* riid, void** ppUnk);
    HRESULT GetChangeUnitExceptions(const(GUID)* riid, void** ppUnk);
    HRESULT FindClockVectorForItem(const(ubyte)* pbItemId, const(GUID)* riid, void** ppUnk);
    HRESULT FindClockVectorForChangeUnit(const(ubyte)* pbItemId, const(ubyte)* pbChangeUnitId, const(GUID)* riid, void** ppUnk);
    HRESULT GetVersion(uint* pdwVersion);
}
enum IID_IForgottenKnowledge = GUID(0x456e0f96, 0x6036, 0x452b, [0x9f, 0x9d, 0xbc, 0xc4, 0xb4, 0xa8, 0x5d, 0xb2]);
interface IForgottenKnowledge : ISyncKnowledge
{
    HRESULT ForgetToVersion(ISyncKnowledge pKnowledge, const(SYNC_VERSION)* pVersion);
}
enum IID_ISyncKnowledge2 = GUID(0xed0addc0, 0x3b4b, 0x46a1, [0x9a, 0x45, 0x45, 0x66, 0x1d, 0x21, 0x14, 0xc8]);
interface ISyncKnowledge2 : ISyncKnowledge
{
    HRESULT GetIdParameters(ID_PARAMETERS* pIdParameters);
    HRESULT ProjectOntoColumnSet(const(ubyte)** ppColumns, uint count, ISyncKnowledge2* ppiKnowledgeOut);
    HRESULT SerializeWithOptions(SYNC_SERIALIZATION_VERSION targetFormatVersion, uint dwFlags, ubyte* pbBuffer, uint* pdwSerializedSize);
    HRESULT GetLowestUncontainedId(ISyncKnowledge2 piSyncKnowledge, ubyte* pbItemId, uint* pcbItemIdSize);
    HRESULT GetInspector(const(GUID)* riid, void** ppiInspector);
    HRESULT GetMinimumSupportedVersion(SYNC_SERIALIZATION_VERSION* pVersion);
    HRESULT GetStatistics(SYNC_STATISTICS which, uint* pValue);
    HRESULT ContainsKnowledgeForItem(ISyncKnowledge pKnowledge, const(ubyte)* pbItemId);
    HRESULT ContainsKnowledgeForChangeUnit(ISyncKnowledge pKnowledge, const(ubyte)* pbItemId, const(ubyte)* pbChangeUnitId);
    HRESULT ProjectOntoKnowledgeWithPrerequisite(ISyncKnowledge pPrerequisiteKnowledge, ISyncKnowledge pTemplateKnowledge, ISyncKnowledge* ppProjectedKnowledge);
    HRESULT Complement(ISyncKnowledge pSyncKnowledge, ISyncKnowledge* ppComplementedKnowledge);
    HRESULT IntersectsWithKnowledge(ISyncKnowledge pSyncKnowledge);
    HRESULT GetKnowledgeCookie(IUnknown* ppKnowledgeCookie);
    HRESULT CompareToKnowledgeCookie(IUnknown pKnowledgeCookie, KNOWLEDGE_COOKIE_COMPARISON_RESULT* pResult);
}
enum IID_IRecoverableErrorData = GUID(0xb37c4a0a, 0x4b7d, 0x4c2d, [0x97, 0x11, 0x3b, 0x0, 0xd1, 0x19, 0xb1, 0xc8]);
interface IRecoverableErrorData : IUnknown
{
    HRESULT Initialize(const(wchar)* pcszItemDisplayName, const(wchar)* pcszErrorDescription);
    HRESULT GetItemDisplayName(PWSTR pszItemDisplayName, uint* pcchItemDisplayName);
    HRESULT GetErrorDescription(PWSTR pszErrorDescription, uint* pcchErrorDescription);
}
enum IID_IRecoverableError = GUID(0xf5625e8, 0xa7b, 0x45ee, [0x96, 0x37, 0x1c, 0xe1, 0x36, 0x45, 0x90, 0x9e]);
interface IRecoverableError : IUnknown
{
    HRESULT GetStage(SYNC_PROGRESS_STAGE* pStage);
    HRESULT GetProvider(SYNC_PROVIDER_ROLE* pProviderRole);
    HRESULT GetChangeWithRecoverableError(ISyncChange* ppChangeWithRecoverableError);
    HRESULT GetRecoverableErrorDataForChange(HRESULT* phrError, IRecoverableErrorData* ppErrorData);
    HRESULT GetRecoverableErrorDataForChangeUnit(ISyncChangeUnit pChangeUnit, HRESULT* phrError, IRecoverableErrorData* ppErrorData);
}
enum IID_IChangeConflict = GUID(0x14ebf97, 0x9f20, 0x4f7a, [0xbd, 0xd4, 0x25, 0x97, 0x9c, 0x77, 0xc0, 0x2]);
interface IChangeConflict : IUnknown
{
    HRESULT GetDestinationProviderConflictingChange(ISyncChange* ppConflictingChange);
    HRESULT GetSourceProviderConflictingChange(ISyncChange* ppConflictingChange);
    HRESULT GetDestinationProviderConflictingData(IUnknown* ppConflictingData);
    HRESULT GetSourceProviderConflictingData(IUnknown* ppConflictingData);
    HRESULT GetResolveActionForChange(SYNC_RESOLVE_ACTION* pResolveAction);
    HRESULT SetResolveActionForChange(SYNC_RESOLVE_ACTION resolveAction);
    HRESULT GetResolveActionForChangeUnit(ISyncChangeUnit pChangeUnit, SYNC_RESOLVE_ACTION* pResolveAction);
    HRESULT SetResolveActionForChangeUnit(ISyncChangeUnit pChangeUnit, SYNC_RESOLVE_ACTION resolveAction);
}
enum IID_IConstraintConflict = GUID(0xd2302e, 0x1cf8, 0x4835, [0xb8, 0x5f, 0xb7, 0xca, 0x4f, 0x79, 0x9e, 0xa]);
interface IConstraintConflict : IUnknown
{
    HRESULT GetDestinationProviderConflictingChange(ISyncChange* ppConflictingChange);
    HRESULT GetSourceProviderConflictingChange(ISyncChange* ppConflictingChange);
    HRESULT GetDestinationProviderOriginalChange(ISyncChange* ppOriginalChange);
    HRESULT GetDestinationProviderConflictingData(IUnknown* ppConflictingData);
    HRESULT GetSourceProviderConflictingData(IUnknown* ppConflictingData);
    HRESULT GetDestinationProviderOriginalData(IUnknown* ppOriginalData);
    HRESULT GetConstraintResolveActionForChange(SYNC_CONSTRAINT_RESOLVE_ACTION* pConstraintResolveAction);
    HRESULT SetConstraintResolveActionForChange(SYNC_CONSTRAINT_RESOLVE_ACTION constraintResolveAction);
    HRESULT GetConstraintResolveActionForChangeUnit(ISyncChangeUnit pChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION* pConstraintResolveAction);
    HRESULT SetConstraintResolveActionForChangeUnit(ISyncChangeUnit pChangeUnit, SYNC_CONSTRAINT_RESOLVE_ACTION constraintResolveAction);
    HRESULT GetConstraintConflictReason(CONSTRAINT_CONFLICT_REASON* pConstraintConflictReason);
    HRESULT IsTemporary();
}
enum IID_ISyncCallback = GUID(0x599797f, 0x5ed9, 0x485c, [0xae, 0x36, 0xc, 0x5d, 0x1b, 0xf2, 0xe7, 0xa5]);
interface ISyncCallback : IUnknown
{
    HRESULT OnProgress(SYNC_PROVIDER_ROLE provider, SYNC_PROGRESS_STAGE syncStage, uint dwCompletedWork, uint dwTotalWork);
    HRESULT OnChange(ISyncChange pSyncChange);
    HRESULT OnConflict(IChangeConflict pConflict);
    HRESULT OnFullEnumerationNeeded(SYNC_FULL_ENUMERATION_ACTION* pFullEnumerationAction);
    HRESULT OnRecoverableError(IRecoverableError pRecoverableError);
}
enum IID_ISyncCallback2 = GUID(0x47ce84af, 0x7442, 0x4ead, [0x86, 0x30, 0x12, 0x1, 0x5e, 0x3, 0xa, 0xd7]);
interface ISyncCallback2 : ISyncCallback
{
    HRESULT OnChangeApplied(uint dwChangesApplied, uint dwChangesFailed);
    HRESULT OnChangeFailed(uint dwChangesApplied, uint dwChangesFailed);
}
enum IID_ISyncConstraintCallback = GUID(0x8af3843e, 0x75b3, 0x438c, [0xbb, 0x51, 0x6f, 0x2, 0xd, 0x70, 0xd3, 0xcb]);
interface ISyncConstraintCallback : IUnknown
{
    HRESULT OnConstraintConflict(IConstraintConflict pConflict);
}
enum IID_ISyncProvider = GUID(0x8f657056, 0x2bce, 0x4a17, [0x8c, 0x68, 0xc7, 0xbb, 0x78, 0x98, 0xb5, 0x6f]);
interface ISyncProvider : IUnknown
{
    HRESULT GetIdParameters(ID_PARAMETERS* pIdParameters);
}
enum IID_ISyncSessionState = GUID(0xb8a940fe, 0x9f01, 0x483b, [0x94, 0x34, 0xc3, 0x7d, 0x36, 0x12, 0x25, 0xd9]);
interface ISyncSessionState : IUnknown
{
    HRESULT IsCanceled(BOOL* pfIsCanceled);
    HRESULT GetInfoForChangeApplication(ubyte* pbChangeApplierInfo, uint* pcbChangeApplierInfo);
    HRESULT LoadInfoFromChangeApplication(const(ubyte)* pbChangeApplierInfo, uint cbChangeApplierInfo);
    HRESULT GetForgottenKnowledgeRecoveryRangeStart(ubyte* pbRangeStart, uint* pcbRangeStart);
    HRESULT GetForgottenKnowledgeRecoveryRangeEnd(ubyte* pbRangeEnd, uint* pcbRangeEnd);
    HRESULT SetForgottenKnowledgeRecoveryRange(const(SYNC_RANGE)* pRange);
    HRESULT OnProgress(SYNC_PROVIDER_ROLE provider, SYNC_PROGRESS_STAGE syncStage, uint dwCompletedWork, uint dwTotalWork);
}
enum IID_ISyncSessionExtendedErrorInfo = GUID(0x326c6810, 0x790a, 0x409b, [0xb7, 0x41, 0x69, 0x99, 0x38, 0x87, 0x61, 0xeb]);
interface ISyncSessionExtendedErrorInfo : IUnknown
{
    HRESULT GetSyncProviderWithError(ISyncProvider* ppProviderWithError);
}
enum IID_ISyncSessionState2 = GUID(0x9e37cfa3, 0x9e38, 0x4c61, [0x9c, 0xa3, 0xff, 0xe8, 0x10, 0xb4, 0x5c, 0xa2]);
interface ISyncSessionState2 : ISyncSessionState
{
    HRESULT SetProviderWithError(BOOL fSelf);
    HRESULT GetSessionErrorStatus(HRESULT* phrSessionError);
}
enum IID_ISyncFilterInfo = GUID(0x794eaaf8, 0x3f2e, 0x47e6, [0x97, 0x28, 0x17, 0xe6, 0xfc, 0xf9, 0x4c, 0xb7]);
interface ISyncFilterInfo : IUnknown
{
    HRESULT Serialize(ubyte* pbBuffer, uint* pcbBuffer);
}
enum IID_ISyncFilterInfo2 = GUID(0x19b394ba, 0xe3d0, 0x468c, [0x93, 0x4d, 0x32, 0x19, 0x68, 0xb2, 0xab, 0x34]);
interface ISyncFilterInfo2 : ISyncFilterInfo
{
    HRESULT GetFlags(uint* pdwFlags);
}
enum IID_IChangeUnitListFilterInfo = GUID(0xf2837671, 0xbdf, 0x43fa, [0xb5, 0x2, 0x23, 0x23, 0x75, 0xfb, 0x50, 0xc2]);
interface IChangeUnitListFilterInfo : ISyncFilterInfo
{
    HRESULT Initialize(const(ubyte)** ppbChangeUnitIds, uint dwChangeUnitCount);
    HRESULT GetChangeUnitIdCount(uint* pdwChangeUnitIdCount);
    HRESULT GetChangeUnitId(uint dwChangeUnitIdIndex, ubyte* pbChangeUnitId, uint* pcbIdSize);
}
enum IID_ISyncFilter = GUID(0x87a3f15, 0xfcb, 0x44c1, [0x96, 0x39, 0x53, 0xc1, 0x4e, 0x2b, 0x55, 0x6]);
interface ISyncFilter : IUnknown
{
    HRESULT IsIdentical(ISyncFilter pSyncFilter);
    HRESULT Serialize(ubyte* pbSyncFilter, uint* pcbSyncFilter);
}
enum IID_ISyncFilterDeserializer = GUID(0xb45b7a72, 0xe5c7, 0x46be, [0x9c, 0x82, 0x77, 0xb8, 0xb1, 0x5d, 0xab, 0x8a]);
interface ISyncFilterDeserializer : IUnknown
{
    HRESULT DeserializeSyncFilter(const(ubyte)* pbSyncFilter, uint dwCbSyncFilter, ISyncFilter* ppISyncFilter);
}
enum IID_ICustomFilterInfo = GUID(0x1d335dff, 0x6f88, 0x4e4d, [0x91, 0xa8, 0xa3, 0xf3, 0x51, 0xcf, 0xd4, 0x73]);
interface ICustomFilterInfo : ISyncFilterInfo
{
    HRESULT GetSyncFilter(ISyncFilter* pISyncFilter);
}
alias FILTER_COMBINATION_TYPE = int;
enum : int
{
    FCT_INTERSECTION = 0x00000000,
}

enum IID_ICombinedFilterInfo = GUID(0x11f9de71, 0x2818, 0x4779, [0xb2, 0xac, 0x42, 0xd4, 0x50, 0x56, 0x5f, 0x45]);
interface ICombinedFilterInfo : ISyncFilterInfo
{
    HRESULT GetFilterCount(uint* pdwFilterCount);
    HRESULT GetFilterInfo(uint dwFilterIndex, ISyncFilterInfo* ppIFilterInfo);
    HRESULT GetFilterCombinationType(FILTER_COMBINATION_TYPE* pFilterCombinationType);
}
enum IID_IEnumSyncChanges = GUID(0x5f86be4a, 0x5e78, 0x4e32, [0xac, 0x1c, 0xc2, 0x4f, 0xd2, 0x23, 0xef, 0x85]);
interface IEnumSyncChanges : IUnknown
{
    HRESULT Next(uint cChanges, ISyncChange* ppChange, uint* pcFetched);
    HRESULT Skip(uint cChanges);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncChanges* ppEnum);
}
enum IID_ISyncChangeBuilder = GUID(0x56f14771, 0x8677, 0x484f, [0xa1, 0x70, 0xe3, 0x86, 0xe4, 0x18, 0xa6, 0x76]);
interface ISyncChangeBuilder : IUnknown
{
    HRESULT AddChangeUnitMetadata(const(ubyte)* pbChangeUnitId, const(SYNC_VERSION)* pChangeUnitVersion);
}
enum IID_IFilterTrackingSyncChangeBuilder = GUID(0x295024a0, 0x70da, 0x4c58, [0x88, 0x3c, 0xce, 0x2a, 0xfb, 0x30, 0x8d, 0xb]);
interface IFilterTrackingSyncChangeBuilder : IUnknown
{
    HRESULT AddFilterChange(uint dwFilterKey, const(SYNC_FILTER_CHANGE)* pFilterChange);
    HRESULT SetAllChangeUnitsPresentFlag();
}
enum IID_ISyncChangeBatchBase = GUID(0x52f6e694, 0x6a71, 0x4494, [0xa1, 0x84, 0xa8, 0x31, 0x1b, 0xf5, 0xd2, 0x27]);
interface ISyncChangeBatchBase : IUnknown
{
    HRESULT GetChangeEnumerator(IEnumSyncChanges* ppEnum);
    HRESULT GetIsLastBatch(BOOL* pfLastBatch);
    HRESULT GetWorkEstimateForBatch(uint* pdwWorkForBatch);
    HRESULT GetRemainingWorkEstimateForSession(uint* pdwRemainingWorkForSession);
    HRESULT BeginOrderedGroup(const(ubyte)* pbLowerBound);
    HRESULT EndOrderedGroup(const(ubyte)* pbUpperBound, ISyncKnowledge pMadeWithKnowledge);
    HRESULT AddItemMetadataToGroup(const(ubyte)* pbOwnerReplicaId, const(ubyte)* pbItemId, const(SYNC_VERSION)* pChangeVersion, const(SYNC_VERSION)* pCreationVersion, uint dwFlags, uint dwWorkForChange, ISyncChangeBuilder* ppChangeBuilder);
    HRESULT GetLearnedKnowledge(ISyncKnowledge* ppLearnedKnowledge);
    HRESULT GetPrerequisiteKnowledge(ISyncKnowledge* ppPrerequisteKnowledge);
    HRESULT GetSourceForgottenKnowledge(IForgottenKnowledge* ppSourceForgottenKnowledge);
    HRESULT SetLastBatch();
    HRESULT SetWorkEstimateForBatch(uint dwWorkForBatch);
    HRESULT SetRemainingWorkEstimateForSession(uint dwRemainingWorkForSession);
    HRESULT Serialize(ubyte* pbChangeBatch, uint* pcbChangeBatch);
}
enum IID_ISyncChangeBatch = GUID(0x70c64dee, 0x380f, 0x4c2e, [0x8f, 0x70, 0x31, 0xc5, 0x5b, 0xd5, 0xf9, 0xb3]);
interface ISyncChangeBatch : ISyncChangeBatchBase
{
    HRESULT BeginUnorderedGroup();
    HRESULT EndUnorderedGroup(ISyncKnowledge pMadeWithKnowledge, BOOL fAllChangesForKnowledge);
    HRESULT AddLoggedConflict(const(ubyte)* pbOwnerReplicaId, const(ubyte)* pbItemId, const(SYNC_VERSION)* pChangeVersion, const(SYNC_VERSION)* pCreationVersion, uint dwFlags, uint dwWorkForChange, ISyncKnowledge pConflictKnowledge, ISyncChangeBuilder* ppChangeBuilder);
}
enum IID_ISyncFullEnumerationChangeBatch = GUID(0xef64197d, 0x4f44, 0x4ea2, [0xb3, 0x55, 0x45, 0x24, 0x71, 0x3e, 0x3b, 0xed]);
interface ISyncFullEnumerationChangeBatch : ISyncChangeBatchBase
{
    HRESULT GetLearnedKnowledgeAfterRecoveryComplete(ISyncKnowledge* ppLearnedKnowledgeAfterRecoveryComplete);
    HRESULT GetClosedLowerBoundItemId(ubyte* pbClosedLowerBoundItemId, uint* pcbIdSize);
    HRESULT GetClosedUpperBoundItemId(ubyte* pbClosedUpperBoundItemId, uint* pcbIdSize);
}
enum IID_ISyncChangeBatchWithPrerequisite = GUID(0x97f13be, 0x5b92, 0x4048, [0xb3, 0xf2, 0x7b, 0x42, 0xa2, 0x51, 0x5e, 0x7]);
interface ISyncChangeBatchWithPrerequisite : ISyncChangeBatchBase
{
    HRESULT SetPrerequisiteKnowledge(ISyncKnowledge pPrerequisiteKnowledge);
    HRESULT GetLearnedKnowledgeWithPrerequisite(ISyncKnowledge pDestinationKnowledge, ISyncKnowledge* ppLearnedWithPrerequisiteKnowledge);
    HRESULT GetLearnedForgottenKnowledge(IForgottenKnowledge* ppLearnedForgottenKnowledge);
}
enum IID_ISyncChangeBatchBase2 = GUID(0x6fdb596a, 0xd755, 0x4584, [0xbd, 0xc, 0xc0, 0xc2, 0x3a, 0x54, 0x8f, 0xbf]);
interface ISyncChangeBatchBase2 : ISyncChangeBatchBase
{
    HRESULT SerializeWithOptions(SYNC_SERIALIZATION_VERSION targetFormatVersion, uint dwFlags, ubyte* pbBuffer, uint* pdwSerializedSize);
}
enum IID_ISyncChangeBatchAdvanced = GUID(0xf1a4995, 0xcbc8, 0x421d, [0xb5, 0x50, 0x5d, 0xb, 0xeb, 0xf3, 0xe9, 0xa5]);
interface ISyncChangeBatchAdvanced : IUnknown
{
    HRESULT GetFilterInfo(ISyncFilterInfo* ppFilterInfo);
    HRESULT ConvertFullEnumerationChangeBatchToRegularChangeBatch(ISyncChangeBatch* ppChangeBatch);
    HRESULT GetUpperBoundItemId(ubyte* pbItemId, uint* pcbIdSize);
    HRESULT GetBatchLevelKnowledgeShouldBeApplied(BOOL* pfBatchKnowledgeShouldBeApplied);
}
enum IID_ISyncChangeBatch2 = GUID(0x225f4a33, 0xf5ee, 0x4cc7, [0xb0, 0x39, 0x67, 0xa2, 0x62, 0xb4, 0xb2, 0xac]);
interface ISyncChangeBatch2 : ISyncChangeBatch
{
    HRESULT AddMergeTombstoneMetadataToGroup(const(ubyte)* pbOwnerReplicaId, const(ubyte)* pbWinnerItemId, const(ubyte)* pbItemId, const(SYNC_VERSION)* pChangeVersion, const(SYNC_VERSION)* pCreationVersion, uint dwWorkForChange, ISyncChangeBuilder* ppChangeBuilder);
    HRESULT AddMergeTombstoneLoggedConflict(const(ubyte)* pbOwnerReplicaId, const(ubyte)* pbWinnerItemId, const(ubyte)* pbItemId, const(SYNC_VERSION)* pChangeVersion, const(SYNC_VERSION)* pCreationVersion, uint dwWorkForChange, ISyncKnowledge pConflictKnowledge, ISyncChangeBuilder* ppChangeBuilder);
}
enum IID_ISyncFullEnumerationChangeBatch2 = GUID(0xe06449f4, 0xa205, 0x4b65, [0x97, 0x24, 0x1, 0xb2, 0x21, 0x1, 0xee, 0xc1]);
interface ISyncFullEnumerationChangeBatch2 : ISyncFullEnumerationChangeBatch
{
    HRESULT AddMergeTombstoneMetadataToGroup(const(ubyte)* pbOwnerReplicaId, const(ubyte)* pbWinnerItemId, const(ubyte)* pbItemId, const(SYNC_VERSION)* pChangeVersion, const(SYNC_VERSION)* pCreationVersion, uint dwWorkForChange, ISyncChangeBuilder* ppChangeBuilder);
}
enum IID_IKnowledgeSyncProvider = GUID(0x43434a49, 0x8da4, 0x47f2, [0x81, 0x72, 0xad, 0x7b, 0x8b, 0x2, 0x49, 0x78]);
interface IKnowledgeSyncProvider : ISyncProvider
{
    HRESULT BeginSession(SYNC_PROVIDER_ROLE role, ISyncSessionState pSessionState);
    HRESULT GetSyncBatchParameters(ISyncKnowledge* ppSyncKnowledge, uint* pdwRequestedBatchSize);
    HRESULT GetChangeBatch(uint dwBatchSize, ISyncKnowledge pSyncKnowledge, ISyncChangeBatch* ppSyncChangeBatch, IUnknown* ppUnkDataRetriever);
    HRESULT GetFullEnumerationChangeBatch(uint dwBatchSize, const(ubyte)* pbLowerEnumerationBound, ISyncKnowledge pSyncKnowledge, ISyncFullEnumerationChangeBatch* ppSyncChangeBatch, IUnknown* ppUnkDataRetriever);
    HRESULT ProcessChangeBatch(CONFLICT_RESOLUTION_POLICY resolutionPolicy, ISyncChangeBatch pSourceChangeBatch, IUnknown pUnkDataRetriever, ISyncCallback pCallback, SYNC_SESSION_STATISTICS* pSyncSessionStatistics);
    HRESULT ProcessFullEnumerationChangeBatch(CONFLICT_RESOLUTION_POLICY resolutionPolicy, ISyncFullEnumerationChangeBatch pSourceChangeBatch, IUnknown pUnkDataRetriever, ISyncCallback pCallback, SYNC_SESSION_STATISTICS* pSyncSessionStatistics);
    HRESULT EndSession(ISyncSessionState pSessionState);
}
enum IID_ISyncChangeUnit = GUID(0x60edd8ca, 0x7341, 0x4bb7, [0x95, 0xce, 0xfa, 0xb6, 0x39, 0x4b, 0x51, 0xcb]);
interface ISyncChangeUnit : IUnknown
{
    HRESULT GetItemChange(ISyncChange* ppSyncChange);
    HRESULT GetChangeUnitId(ubyte* pbChangeUnitId, uint* pcbIdSize);
    HRESULT GetChangeUnitVersion(const(ubyte)* pbCurrentReplicaId, SYNC_VERSION* pVersion);
}
enum IID_IEnumSyncChangeUnits = GUID(0x346b35f1, 0x8703, 0x4c6d, [0xab, 0x1a, 0x4d, 0xbc, 0xa2, 0xcf, 0xf9, 0x7f]);
interface IEnumSyncChangeUnits : IUnknown
{
    HRESULT Next(uint cChanges, ISyncChangeUnit* ppChangeUnit, uint* pcFetched);
    HRESULT Skip(uint cChanges);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncChangeUnits* ppEnum);
}
enum IID_ISyncChange = GUID(0xa1952beb, 0xf6b, 0x4711, [0xb1, 0x36, 0x1, 0xda, 0x85, 0xb9, 0x68, 0xa6]);
interface ISyncChange : IUnknown
{
    HRESULT GetOwnerReplicaId(ubyte* pbReplicaId, uint* pcbIdSize);
    HRESULT GetRootItemId(ubyte* pbRootItemId, uint* pcbIdSize);
    HRESULT GetChangeVersion(const(ubyte)* pbCurrentReplicaId, SYNC_VERSION* pVersion);
    HRESULT GetCreationVersion(const(ubyte)* pbCurrentReplicaId, SYNC_VERSION* pVersion);
    HRESULT GetFlags(uint* pdwFlags);
    HRESULT GetWorkEstimate(uint* pdwWork);
    HRESULT GetChangeUnits(IEnumSyncChangeUnits* ppEnum);
    HRESULT GetMadeWithKnowledge(ISyncKnowledge* ppMadeWithKnowledge);
    HRESULT GetLearnedKnowledge(ISyncKnowledge* ppLearnedKnowledge);
    HRESULT SetWorkEstimate(uint dwWork);
}
enum IID_ISyncChangeWithPrerequisite = GUID(0x9e38382f, 0x1589, 0x48c3, [0x92, 0xe4, 0x5, 0xec, 0xdc, 0xb4, 0xf3, 0xf7]);
interface ISyncChangeWithPrerequisite : IUnknown
{
    HRESULT GetPrerequisiteKnowledge(ISyncKnowledge* ppPrerequisiteKnowledge);
    HRESULT GetLearnedKnowledgeWithPrerequisite(ISyncKnowledge pDestinationKnowledge, ISyncKnowledge* ppLearnedKnowledgeWithPrerequisite);
}
enum IID_ISyncFullEnumerationChange = GUID(0x9785e0bd, 0xbdff, 0x40c4, [0x98, 0xc5, 0xb3, 0x4b, 0x2f, 0x19, 0x91, 0xb3]);
interface ISyncFullEnumerationChange : IUnknown
{
    HRESULT GetLearnedKnowledgeAfterRecoveryComplete(ISyncKnowledge* ppLearnedKnowledge);
    HRESULT GetLearnedForgottenKnowledge(IForgottenKnowledge* ppLearnedForgottenKnowledge);
}
enum IID_ISyncMergeTombstoneChange = GUID(0x6ec62597, 0x903, 0x484c, [0xad, 0x61, 0x36, 0xd6, 0xe9, 0x38, 0xf4, 0x7b]);
interface ISyncMergeTombstoneChange : IUnknown
{
    HRESULT GetWinnerItemId(ubyte* pbWinnerItemId, uint* pcbIdSize);
}
enum IID_IEnumItemIds = GUID(0x43aa3f61, 0x4b2e, 0x4b60, [0x83, 0xdf, 0xb1, 0x10, 0xd3, 0xe1, 0x48, 0xf1]);
interface IEnumItemIds : IUnknown
{
    HRESULT Next(ubyte* pbItemId, uint* pcbItemIdSize);
}
enum IID_IFilterKeyMap = GUID(0xca169652, 0x7c6, 0x4708, [0xa3, 0xda, 0x6e, 0x4e, 0xba, 0x8d, 0x22, 0x97]);
interface IFilterKeyMap : IUnknown
{
    HRESULT GetCount(uint* pdwCount);
    HRESULT AddFilter(ISyncFilter pISyncFilter, uint* pdwFilterKey);
    HRESULT GetFilter(uint dwFilterKey, ISyncFilter* ppISyncFilter);
    HRESULT Serialize(ubyte* pbFilterKeyMap, uint* pcbFilterKeyMap);
}
enum IID_ISyncChangeWithFilterKeyMap = GUID(0xbfe1ef00, 0xe87d, 0x42fd, [0xa4, 0xe9, 0x24, 0x2d, 0x70, 0x41, 0x4a, 0xef]);
interface ISyncChangeWithFilterKeyMap : IUnknown
{
    HRESULT GetFilterCount(uint* pdwFilterCount);
    HRESULT GetFilterChange(uint dwFilterKey, SYNC_FILTER_CHANGE* pFilterChange);
    HRESULT GetAllChangeUnitsPresentFlag(BOOL* pfAllChangeUnitsPresent);
    HRESULT GetFilterForgottenKnowledge(uint dwFilterKey, ISyncKnowledge* ppIFilterForgottenKnowledge);
    HRESULT GetFilteredReplicaLearnedKnowledge(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, ISyncKnowledge* ppLearnedKnowledge);
    HRESULT GetLearnedFilterForgottenKnowledge(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, uint dwFilterKey, ISyncKnowledge* ppLearnedFilterForgottenKnowledge);
    HRESULT GetFilteredReplicaLearnedForgottenKnowledge(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, ISyncKnowledge* ppLearnedForgottenKnowledge);
    HRESULT GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, ISyncKnowledge* ppLearnedForgottenKnowledge);
    HRESULT GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, uint dwFilterKey, ISyncKnowledge* ppLearnedFilterForgottenKnowledge);
}
enum IID_ISyncChangeBatchWithFilterKeyMap = GUID(0xde247002, 0x566d, 0x459a, [0xa6, 0xed, 0xa5, 0xaa, 0xb3, 0x45, 0x9f, 0xb7]);
interface ISyncChangeBatchWithFilterKeyMap : IUnknown
{
    HRESULT GetFilterKeyMap(IFilterKeyMap* ppIFilterKeyMap);
    HRESULT SetFilterKeyMap(IFilterKeyMap pIFilterKeyMap);
    HRESULT SetFilterForgottenKnowledge(uint dwFilterKey, ISyncKnowledge pFilterForgottenKnowledge);
    HRESULT GetFilteredReplicaLearnedKnowledge(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, ISyncKnowledge* ppLearnedForgottenKnowledge);
    HRESULT GetLearnedFilterForgottenKnowledge(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, uint dwFilterKey, ISyncKnowledge* ppLearnedFilterForgottenKnowledge);
    HRESULT GetFilteredReplicaLearnedForgottenKnowledge(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, ISyncKnowledge* ppLearnedForgottenKnowledge);
    HRESULT GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, ISyncKnowledge* ppLearnedForgottenKnowledge);
    HRESULT GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete(ISyncKnowledge pDestinationKnowledge, IEnumItemIds pNewMoveins, uint dwFilterKey, ISyncKnowledge* ppLearnedFilterForgottenKnowledge);
}
enum IID_IDataRetrieverCallback = GUID(0x71b4863b, 0xf969, 0x4676, [0xbb, 0xc3, 0x3d, 0x9f, 0xdc, 0x3f, 0xb2, 0xc7]);
interface IDataRetrieverCallback : IUnknown
{
    HRESULT LoadChangeDataComplete(IUnknown pUnkData);
    HRESULT LoadChangeDataError(HRESULT hrError);
}
enum IID_ILoadChangeContext = GUID(0x44a4aaca, 0xec39, 0x46d5, [0xb5, 0xc9, 0xd6, 0x33, 0xc0, 0xee, 0x67, 0xe2]);
interface ILoadChangeContext : IUnknown
{
    HRESULT GetSyncChange(ISyncChange* ppSyncChange);
    HRESULT SetRecoverableErrorOnChange(HRESULT hrError, IRecoverableErrorData pErrorData);
    HRESULT SetRecoverableErrorOnChangeUnit(HRESULT hrError, ISyncChangeUnit pChangeUnit, IRecoverableErrorData pErrorData);
}
enum IID_ISynchronousDataRetriever = GUID(0x9b22f2a9, 0xa4cd, 0x4648, [0x9d, 0x8e, 0x3a, 0x51, 0xd, 0x4d, 0xa0, 0x4b]);
interface ISynchronousDataRetriever : IUnknown
{
    HRESULT GetIdParameters(ID_PARAMETERS* pIdParameters);
    HRESULT LoadChangeData(ILoadChangeContext pLoadChangeContext, IUnknown* ppUnkData);
}
enum IID_IAsynchronousDataRetriever = GUID(0x9fc7e470, 0x61ea, 0x4a88, [0x9b, 0xe4, 0xdf, 0x56, 0xa2, 0x7c, 0xfe, 0xf2]);
interface IAsynchronousDataRetriever : IUnknown
{
    HRESULT GetIdParameters(ID_PARAMETERS* pIdParameters);
    HRESULT RegisterCallback(IDataRetrieverCallback pDataRetrieverCallback);
    HRESULT RevokeCallback(IDataRetrieverCallback pDataRetrieverCallback);
    HRESULT LoadChangeData(ILoadChangeContext pLoadChangeContext);
}
enum IID_IFilterRequestCallback = GUID(0x82df8873, 0x6360, 0x463a, [0xa8, 0xa1, 0xed, 0xe5, 0xe1, 0xa1, 0x59, 0x4d]);
interface IFilterRequestCallback : IUnknown
{
    HRESULT RequestFilter(IUnknown pFilter, FILTERING_TYPE filteringType);
}
enum IID_IRequestFilteredSync = GUID(0x2e020184, 0x6d18, 0x46a7, [0xa3, 0x2a, 0xda, 0x4a, 0xeb, 0x6, 0x69, 0x6c]);
interface IRequestFilteredSync : IUnknown
{
    HRESULT SpecifyFilter(IFilterRequestCallback pCallback);
}
enum IID_ISupportFilteredSync = GUID(0x3d128ded, 0xd555, 0x4e0d, [0xbf, 0x4b, 0xfb, 0x21, 0x3a, 0x8a, 0x93, 0x2]);
interface ISupportFilteredSync : IUnknown
{
    HRESULT AddFilter(IUnknown pFilter, FILTERING_TYPE filteringType);
}
enum IID_IFilterTrackingRequestCallback = GUID(0x713ca7bb, 0xc858, 0x4674, [0xb4, 0xb6, 0x11, 0x22, 0x43, 0x65, 0x87, 0xa9]);
interface IFilterTrackingRequestCallback : IUnknown
{
    HRESULT RequestTrackedFilter(ISyncFilter pFilter);
}
enum IID_IFilterTrackingProvider = GUID(0x743383c0, 0xfc4e, 0x45ba, [0xad, 0x81, 0xd9, 0xd8, 0x4c, 0x7a, 0x24, 0xf8]);
interface IFilterTrackingProvider : IUnknown
{
    HRESULT SpecifyTrackedFilters(IFilterTrackingRequestCallback pCallback);
    HRESULT AddTrackedFilter(ISyncFilter pFilter);
}
enum IID_ISupportLastWriteTime = GUID(0xeadf816f, 0xd0bd, 0x43ca, [0x8f, 0x40, 0x5a, 0xcd, 0xc6, 0xc0, 0x6f, 0x7a]);
interface ISupportLastWriteTime : IUnknown
{
    HRESULT GetItemChangeTime(const(ubyte)* pbItemId, ulong* pullTimestamp);
    HRESULT GetChangeUnitChangeTime(const(ubyte)* pbItemId, const(ubyte)* pbChangeUnitId, ulong* pullTimestamp);
}
enum IID_IProviderConverter = GUID(0x809b7276, 0x98cf, 0x4957, [0x93, 0xa5, 0xe, 0xbd, 0xd3, 0xdd, 0xdf, 0xfd]);
interface IProviderConverter : IUnknown
{
    HRESULT Initialize(ISyncProvider pISyncProvider);
}
enum IID_ISyncDataConverter = GUID(0x435d4861, 0x68d5, 0x44aa, [0xa0, 0xf9, 0x72, 0xa0, 0xb0, 0xe, 0xf9, 0xcf]);
interface ISyncDataConverter : IUnknown
{
    HRESULT ConvertDataRetrieverFromProviderFormat(IUnknown pUnkDataRetrieverIn, IEnumSyncChanges pEnumSyncChanges, IUnknown* ppUnkDataOut);
    HRESULT ConvertDataRetrieverToProviderFormat(IUnknown pUnkDataRetrieverIn, IEnumSyncChanges pEnumSyncChanges, IUnknown* ppUnkDataOut);
    HRESULT ConvertDataFromProviderFormat(ILoadChangeContext pDataContext, IUnknown pUnkDataIn, IUnknown* ppUnkDataOut);
    HRESULT ConvertDataToProviderFormat(ILoadChangeContext pDataContext, IUnknown pUnkDataOut, IUnknown* ppUnkDataout);
}
struct SyncProviderConfiguration
{
    uint dwVersion;
    GUID guidInstanceId;
    GUID clsidProvider;
    GUID guidConfigUIInstanceId;
    GUID guidContentType;
    uint dwCapabilities;
    uint dwSupportedArchitecture;
}
struct SyncProviderConfigUIConfiguration
{
    uint dwVersion;
    GUID guidInstanceId;
    GUID clsidConfigUI;
    GUID guidContentType;
    uint dwCapabilities;
    uint dwSupportedArchitecture;
    BOOL fIsGlobal;
}
enum IID_ISyncProviderRegistration = GUID(0xcb45953b, 0x7624, 0x47bc, [0xa4, 0x72, 0xeb, 0x8c, 0xac, 0x6b, 0x22, 0x2e]);
interface ISyncProviderRegistration : IUnknown
{
    HRESULT CreateSyncProviderConfigUIRegistrationInstance(const(SyncProviderConfigUIConfiguration)* pConfigUIConfig, ISyncProviderConfigUIInfo* ppConfigUIInfo);
    HRESULT UnregisterSyncProviderConfigUI(const(GUID)* pguidInstanceId);
    HRESULT EnumerateSyncProviderConfigUIs(const(GUID)* pguidContentType, uint dwSupportedArchitecture, IEnumSyncProviderConfigUIInfos* ppEnumSyncProviderConfigUIInfos);
    HRESULT CreateSyncProviderRegistrationInstance(const(SyncProviderConfiguration)* pProviderConfiguration, ISyncProviderInfo* ppProviderInfo);
    HRESULT UnregisterSyncProvider(const(GUID)* pguidInstanceId);
    HRESULT GetSyncProviderConfigUIInfoforProvider(const(GUID)* pguidProviderInstanceId, ISyncProviderConfigUIInfo* ppProviderConfigUIInfo);
    HRESULT EnumerateSyncProviders(const(GUID)* pguidContentType, uint dwStateFlagsToFilterMask, uint dwStateFlagsToFilter, const(GUID)* refProviderClsId, uint dwSupportedArchitecture, IEnumSyncProviderInfos* ppEnumSyncProviderInfos);
    HRESULT GetSyncProviderInfo(const(GUID)* pguidInstanceId, ISyncProviderInfo* ppProviderInfo);
    HRESULT GetSyncProviderFromInstanceId(const(GUID)* pguidInstanceId, uint dwClsContext, IRegisteredSyncProvider* ppSyncProvider);
    HRESULT GetSyncProviderConfigUIInfo(const(GUID)* pguidInstanceId, ISyncProviderConfigUIInfo* ppConfigUIInfo);
    HRESULT GetSyncProviderConfigUIFromInstanceId(const(GUID)* pguidInstanceId, uint dwClsContext, ISyncProviderConfigUI* ppConfigUI);
    HRESULT GetSyncProviderState(const(GUID)* pguidInstanceId, uint* pdwStateFlags);
    HRESULT SetSyncProviderState(const(GUID)* pguidInstanceId, uint dwStateFlagsMask, uint dwStateFlags);
    HRESULT RegisterForEvent(HANDLE* phEvent);
    HRESULT RevokeEvent(HANDLE hEvent);
    HRESULT GetChange(HANDLE hEvent, ISyncRegistrationChange* ppChange);
}
enum IID_IEnumSyncProviderConfigUIInfos = GUID(0xf6be2602, 0x17c6, 0x4658, [0xa2, 0xd7, 0x68, 0xed, 0x33, 0x30, 0xf6, 0x41]);
interface IEnumSyncProviderConfigUIInfos : IUnknown
{
    HRESULT Next(uint cFactories, ISyncProviderConfigUIInfo* ppSyncProviderConfigUIInfo, uint* pcFetched);
    HRESULT Skip(uint cFactories);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncProviderConfigUIInfos* ppEnum);
}
enum IID_IEnumSyncProviderInfos = GUID(0xa04ba850, 0x5eb1, 0x460d, [0xa9, 0x73, 0x39, 0x3f, 0xcb, 0x60, 0x8a, 0x11]);
interface IEnumSyncProviderInfos : IUnknown
{
    HRESULT Next(uint cInstances, ISyncProviderInfo* ppSyncProviderInfo, uint* pcFetched);
    HRESULT Skip(uint cInstances);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncProviderInfos* ppEnum);
}
enum IID_ISyncProviderInfo = GUID(0x1ee135de, 0x88a4, 0x4504, [0xb0, 0xd0, 0xf7, 0x92, 0xd, 0x7e, 0x5b, 0xa6]);
interface ISyncProviderInfo : IPropertyStore
{
    HRESULT GetSyncProvider(uint dwClsContext, IRegisteredSyncProvider* ppSyncProvider);
}
enum IID_ISyncProviderConfigUIInfo = GUID(0x214141ae, 0x33d7, 0x4d8d, [0x8e, 0x37, 0xf2, 0x27, 0xe8, 0x80, 0xce, 0x50]);
interface ISyncProviderConfigUIInfo : IPropertyStore
{
    HRESULT GetSyncProviderConfigUI(uint dwClsContext, ISyncProviderConfigUI* ppSyncProviderConfigUI);
}
enum IID_ISyncProviderConfigUI = GUID(0x7b0705f6, 0xcbcd, 0x4071, [0xab, 0x5, 0x3b, 0xdc, 0x36, 0x4d, 0x4a, 0xc]);
interface ISyncProviderConfigUI : IUnknown
{
    HRESULT Init(const(GUID)* pguidInstanceId, const(GUID)* pguidContentType, IPropertyStore pConfigurationProperties);
    HRESULT GetRegisteredProperties(IPropertyStore* ppConfigUIProperties);
    HRESULT CreateAndRegisterNewSyncProvider(HWND hwndParent, IUnknown pUnkContext, ISyncProviderInfo* ppProviderInfo);
    HRESULT ModifySyncProvider(HWND hwndParent, IUnknown pUnkContext, ISyncProviderInfo pProviderInfo);
}
enum IID_IRegisteredSyncProvider = GUID(0x913bcf76, 0x47c1, 0x40b5, [0xa8, 0x96, 0x5e, 0x8a, 0x9c, 0x41, 0x4c, 0x14]);
interface IRegisteredSyncProvider : IUnknown
{
    HRESULT Init(const(GUID)* pguidInstanceId, const(GUID)* pguidContentType, IPropertyStore pContextPropertyStore);
    HRESULT GetInstanceId(GUID* pguidInstanceId);
    HRESULT Reset();
}
alias SYNC_REGISTRATION_EVENT = int;
enum : int
{
    SRE_PROVIDER_ADDED         = 0x00000000,
    SRE_PROVIDER_REMOVED       = 0x00000001,
    SRE_PROVIDER_UPDATED       = 0x00000002,
    SRE_PROVIDER_STATE_CHANGED = 0x00000003,
    SRE_CONFIGUI_ADDED         = 0x00000004,
    SRE_CONFIGUI_REMOVED       = 0x00000005,
    SRE_CONFIGUI_UPDATED       = 0x00000006,
}

enum IID_ISyncRegistrationChange = GUID(0xeea0d9ae, 0x6b29, 0x43b4, [0x9e, 0x70, 0xe3, 0xae, 0x33, 0xbb, 0x2c, 0x3b]);
interface ISyncRegistrationChange : IUnknown
{
    HRESULT GetEvent(SYNC_REGISTRATION_EVENT* psreEvent);
    HRESULT GetInstanceId(GUID* pguidInstanceId);
}
enum CLSID_SyncProviderRegistration = GUID(0xf82b4ef1, 0x93a9, 0x4dde, [0x80, 0x15, 0xf7, 0x95, 0xa, 0x1a, 0x6e, 0x31]);
struct SyncProviderRegistration
{
}
