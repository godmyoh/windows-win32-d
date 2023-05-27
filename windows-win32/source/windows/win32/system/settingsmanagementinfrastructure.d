module windows.win32.system.settingsmanagementinfrastructure;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HMODULE, HRESULT, PWSTR;
import windows.win32.system.com : IStream, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum WCM_SETTINGS_ID_NAME = "name";
enum WCM_SETTINGS_ID_VERSION = "version";
enum WCM_SETTINGS_ID_LANGUAGE = "language";
enum WCM_SETTINGS_ID_ARCHITECTURE = "architecture";
enum WCM_SETTINGS_ID_TOKEN = "token";
enum WCM_SETTINGS_ID_URI = "uri";
enum WCM_SETTINGS_ID_VERSION_SCOPE = "versionScope";
enum WCM_SETTINGS_ID_FLAG_REFERENCE = 0x00000000;
enum WCM_SETTINGS_ID_FLAG_DEFINITION = 0x00000001;
enum LINK_STORE_TO_ENGINE_INSTANCE = 0x00000001;
enum LIMITED_VALIDATION_MODE = 0x00000001;
enum WCM_E_INTERNALERROR = 0xffffffff80220000;
enum WCM_E_STATENODENOTFOUND = 0xffffffff80220001;
enum WCM_E_STATENODENOTALLOWED = 0xffffffff80220002;
enum WCM_E_ATTRIBUTENOTFOUND = 0xffffffff80220003;
enum WCM_E_ATTRIBUTENOTALLOWED = 0xffffffff80220004;
enum WCM_E_INVALIDVALUE = 0xffffffff80220005;
enum WCM_E_INVALIDVALUEFORMAT = 0xffffffff80220006;
enum WCM_E_TYPENOTSPECIFIED = 0xffffffff80220007;
enum WCM_E_INVALIDDATATYPE = 0xffffffff80220008;
enum WCM_E_NOTPOSITIONED = 0xffffffff80220009;
enum WCM_E_READONLYITEM = 0xffffffff8022000a;
enum WCM_E_INVALIDPATH = 0xffffffff8022000b;
enum WCM_E_WRONGESCAPESTRING = 0xffffffff8022000c;
enum WCM_E_INVALIDVERSIONFORMAT = 0xffffffff8022000d;
enum WCM_E_INVALIDLANGUAGEFORMAT = 0xffffffff8022000e;
enum WCM_E_KEYNOTCHANGEABLE = 0xffffffff8022000f;
enum WCM_E_EXPRESSIONNOTFOUND = 0xffffffff80220010;
enum WCM_E_SUBSTITUTIONNOTFOUND = 0xffffffff80220011;
enum WCM_E_USERALREADYREGISTERED = 0xffffffff80220012;
enum WCM_E_USERNOTFOUND = 0xffffffff80220013;
enum WCM_E_NAMESPACENOTFOUND = 0xffffffff80220014;
enum WCM_E_NAMESPACEALREADYREGISTERED = 0xffffffff80220015;
enum WCM_E_STORECORRUPTED = 0xffffffff80220016;
enum WCM_E_INVALIDEXPRESSIONSYNTAX = 0xffffffff80220017;
enum WCM_E_NOTIFICATIONNOTFOUND = 0xffffffff80220018;
enum WCM_E_CONFLICTINGASSERTION = 0xffffffff80220019;
enum WCM_E_ASSERTIONFAILED = 0xffffffff8022001a;
enum WCM_E_DUPLICATENAME = 0xffffffff8022001b;
enum WCM_E_INVALIDKEY = 0xffffffff8022001c;
enum WCM_E_INVALIDSTREAM = 0xffffffff8022001d;
enum WCM_E_HANDLERNOTFOUND = 0xffffffff8022001e;
enum WCM_E_INVALIDHANDLERSYNTAX = 0xffffffff8022001f;
enum WCM_E_VALIDATIONFAILED = 0xffffffff80220020;
enum WCM_E_RESTRICTIONFAILED = 0xffffffff80220021;
enum WCM_E_MANIFESTCOMPILATIONFAILED = 0xffffffff80220022;
enum WCM_E_CYCLICREFERENCE = 0xffffffff80220023;
enum WCM_E_MIXTYPEASSERTION = 0xffffffff80220024;
enum WCM_E_NOTSUPPORTEDFUNCTION = 0xffffffff80220025;
enum WCM_E_VALUETOOBIG = 0xffffffff80220026;
enum WCM_E_INVALIDATTRIBUTECOMBINATION = 0xffffffff80220027;
enum WCM_E_ABORTOPERATION = 0xffffffff80220028;
enum WCM_E_MISSINGCONFIGURATION = 0xffffffff80220029;
enum WCM_E_INVALIDPROCESSORFORMAT = 0xffffffff8022002a;
enum WCM_E_SOURCEMANEMPTYVALUE = 0xffffffff8022002b;
enum WCM_S_INTERNALERROR = 0x00221000;
enum WCM_S_ATTRIBUTENOTFOUND = 0x00221001;
enum WCM_S_LEGACYSETTINGWARNING = 0x00221002;
enum WCM_S_INVALIDATTRIBUTECOMBINATION = 0x00221004;
enum WCM_S_ATTRIBUTENOTALLOWED = 0x00221005;
enum WCM_S_NAMESPACENOTFOUND = 0x00221006;
enum WCM_E_UNKNOWNRESULT = 0xffffffff80221003;
alias WcmTargetMode = int;
enum : int
{
    OfflineMode = 0x00000001,
    OnlineMode  = 0x00000002,
}

alias WcmNamespaceEnumerationFlags = int;
enum : int
{
    SharedEnumeration = 0x00000001,
    UserEnumeration   = 0x00000002,
    AllEnumeration    = 0x00000003,
}

alias WcmDataType = int;
enum : int
{
    dataTypeByte      = 0x00000001,
    dataTypeSByte     = 0x00000002,
    dataTypeUInt16    = 0x00000003,
    dataTypeInt16     = 0x00000004,
    dataTypeUInt32    = 0x00000005,
    dataTypeInt32     = 0x00000006,
    dataTypeUInt64    = 0x00000007,
    dataTypeInt64     = 0x00000008,
    dataTypeBoolean   = 0x0000000b,
    dataTypeString    = 0x0000000c,
    dataTypeFlagArray = 0x00008000,
}

alias WcmSettingType = int;
enum : int
{
    settingTypeScalar  = 0x00000001,
    settingTypeComplex = 0x00000002,
    settingTypeList    = 0x00000003,
}

alias WcmRestrictionFacets = int;
enum : int
{
    restrictionFacetMaxLength    = 0x00000001,
    restrictionFacetEnumeration  = 0x00000002,
    restrictionFacetMaxInclusive = 0x00000004,
    restrictionFacetMinInclusive = 0x00000008,
}

alias WcmUserStatus = int;
enum : int
{
    UnknownStatus    = 0x00000000,
    UserRegistered   = 0x00000001,
    UserUnregistered = 0x00000002,
    UserLoaded       = 0x00000003,
    UserUnloaded     = 0x00000004,
}

alias WcmNamespaceAccess = int;
enum : int
{
    ReadOnlyAccess  = 0x00000001,
    ReadWriteAccess = 0x00000002,
}

enum IID_IItemEnumerator = GUID(0x9f7d7bb7, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface IItemEnumerator : IUnknown
{
    HRESULT Current(VARIANT*);
    HRESULT MoveNext(BOOL*);
    HRESULT Reset();
}
enum IID_ISettingsIdentity = GUID(0x9f7d7bb6, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ISettingsIdentity : IUnknown
{
    HRESULT GetAttribute(void*, const(wchar)*, BSTR*);
    HRESULT SetAttribute(void*, const(wchar)*, const(wchar)*);
    HRESULT GetFlags(uint*);
    HRESULT SetFlags(uint);
}
enum IID_ITargetInfo = GUID(0x9f7d7bb8, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ITargetInfo : IUnknown
{
    HRESULT GetTargetMode(WcmTargetMode*);
    HRESULT SetTargetMode(WcmTargetMode);
    HRESULT GetTemporaryStoreLocation(BSTR*);
    HRESULT SetTemporaryStoreLocation(const(wchar)*);
    HRESULT GetTargetID(BSTR*);
    HRESULT SetTargetID(GUID);
    HRESULT GetTargetProcessorArchitecture(BSTR*);
    HRESULT SetTargetProcessorArchitecture(const(wchar)*);
    HRESULT GetProperty(BOOL, const(wchar)*, BSTR*);
    HRESULT SetProperty(BOOL, const(wchar)*, const(wchar)*);
    HRESULT GetEnumerator(IItemEnumerator*);
    HRESULT ExpandTarget(BOOL, const(wchar)*, BSTR*);
    HRESULT ExpandTargetPath(BOOL, const(wchar)*, BSTR*);
    HRESULT SetModulePath(const(wchar)*, const(wchar)*);
    HRESULT LoadModule(const(wchar)*, HMODULE*);
    HRESULT SetWow64Context(const(wchar)*, ubyte*);
    HRESULT TranslateWow64(const(wchar)*, const(wchar)*, BSTR*);
    HRESULT SetSchemaHiveLocation(const(wchar)*);
    HRESULT GetSchemaHiveLocation(BSTR*);
    HRESULT SetSchemaHiveMountName(const(wchar)*);
    HRESULT GetSchemaHiveMountName(BSTR*);
}
enum IID_ISettingsEngine = GUID(0x9f7d7bb9, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ISettingsEngine : IUnknown
{
    HRESULT GetNamespaces(WcmNamespaceEnumerationFlags, void*, IItemEnumerator*);
    HRESULT GetNamespace(ISettingsIdentity, WcmNamespaceAccess, void*, ISettingsNamespace*);
    HRESULT GetErrorDescription(int, BSTR*);
    HRESULT CreateSettingsIdentity(ISettingsIdentity*);
    HRESULT GetStoreStatus(void*, WcmUserStatus*);
    HRESULT LoadStore(uint);
    HRESULT UnloadStore(void*);
    HRESULT RegisterNamespace(ISettingsIdentity, IStream, BOOL, VARIANT*);
    HRESULT UnregisterNamespace(ISettingsIdentity, BOOL);
    HRESULT CreateTargetInfo(ITargetInfo*);
    HRESULT GetTargetInfo(ITargetInfo*);
    HRESULT SetTargetInfo(ITargetInfo);
    HRESULT CreateSettingsContext(uint, void*, ISettingsContext*);
    HRESULT SetSettingsContext(ISettingsContext);
    HRESULT ApplySettingsContext(ISettingsContext, PWSTR**, ulong*);
    HRESULT GetSettingsContext(ISettingsContext*);
}
enum IID_ISettingsItem = GUID(0x9f7d7bbb, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ISettingsItem : IUnknown
{
    HRESULT GetName(BSTR*);
    HRESULT GetValue(VARIANT*);
    HRESULT SetValue(const(VARIANT)*);
    HRESULT GetSettingType(WcmSettingType*);
    HRESULT GetDataType(WcmDataType*);
    HRESULT GetValueRaw(ubyte**, uint*);
    HRESULT SetValueRaw(int, const(ubyte)*, uint);
    HRESULT HasChild(BOOL*);
    HRESULT Children(IItemEnumerator*);
    HRESULT GetChild(const(wchar)*, ISettingsItem*);
    HRESULT GetSettingByPath(const(wchar)*, ISettingsItem*);
    HRESULT CreateSettingByPath(const(wchar)*, ISettingsItem*);
    HRESULT RemoveSettingByPath(const(wchar)*);
    HRESULT GetListKeyInformation(BSTR*, WcmDataType*);
    HRESULT CreateListElement(const(VARIANT)*, ISettingsItem*);
    HRESULT RemoveListElement(const(wchar)*);
    HRESULT Attributes(IItemEnumerator*);
    HRESULT GetAttribute(const(wchar)*, VARIANT*);
    HRESULT GetPath(BSTR*);
    HRESULT GetRestrictionFacets(WcmRestrictionFacets*);
    HRESULT GetRestriction(WcmRestrictionFacets, VARIANT*);
    HRESULT GetKeyValue(VARIANT*);
}
enum IID_ISettingsNamespace = GUID(0x9f7d7bba, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ISettingsNamespace : IUnknown
{
    HRESULT GetIdentity(ISettingsIdentity*);
    HRESULT Settings(IItemEnumerator*);
    HRESULT Save(BOOL, ISettingsResult*);
    HRESULT GetSettingByPath(const(wchar)*, ISettingsItem*);
    HRESULT CreateSettingByPath(const(wchar)*, ISettingsItem*);
    HRESULT RemoveSettingByPath(const(wchar)*);
    HRESULT GetAttribute(const(wchar)*, VARIANT*);
}
enum IID_ISettingsResult = GUID(0x9f7d7bbc, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ISettingsResult : IUnknown
{
    HRESULT GetDescription(BSTR*);
    HRESULT GetErrorCode(HRESULT*);
    HRESULT GetContextDescription(BSTR*);
    HRESULT GetLine(uint*);
    HRESULT GetColumn(uint*);
    HRESULT GetSource(BSTR*);
}
enum IID_ISettingsContext = GUID(0x9f7d7bbd, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
interface ISettingsContext : IUnknown
{
    HRESULT Serialize(IStream, ITargetInfo);
    HRESULT Deserialize(IStream, ITargetInfo, ISettingsResult**, ulong*);
    HRESULT SetUserData(void*);
    HRESULT GetUserData(void**);
    HRESULT GetNamespaces(IItemEnumerator*);
    HRESULT GetStoredSettings(ISettingsIdentity, IItemEnumerator*, IItemEnumerator*, IItemEnumerator*);
    HRESULT RevertSetting(ISettingsIdentity, const(wchar)*);
}
enum CLSID_SettingsEngine = GUID(0x9f7d7bb5, 0x20b3, 0x11da, [0x81, 0xa5, 0x0, 0x30, 0xf1, 0x64, 0x2e, 0x3c]);
struct SettingsEngine
{
}
