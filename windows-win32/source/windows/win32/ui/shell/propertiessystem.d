module windows.win32.ui.shell.propertiessystem;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, HANDLE, HRESULT, HWND, POINTL, POINTS, PROPERTYKEY, PSTR, PWSTR, RECTL;
import windows.win32.system.com : IBindCtx, IStream, IUnknown;
import windows.win32.system.com.structuredstorage : IPropertyBag, IPropertySetStorage, IPropertyStorage, PROPSPEC, PROPVARIANT;
import windows.win32.system.search.common : CONDITION_OPERATION;
import windows.win32.system.variant : VARENUM, VARIANT;
import windows.win32.ui.shell.common : ITEMIDLIST;

version (Windows):
extern (Windows):

HRESULT PSFormatForDisplay(const(PROPERTYKEY)* propkey, const(PROPVARIANT)* propvar, PROPDESC_FORMAT_FLAGS pdfFlags, PWSTR pwszText, uint cchText);
HRESULT PSFormatForDisplayAlloc(const(PROPERTYKEY)* key, const(PROPVARIANT)* propvar, PROPDESC_FORMAT_FLAGS pdff, PWSTR* ppszDisplay);
HRESULT PSFormatPropertyValue(IPropertyStore pps, IPropertyDescription ppd, PROPDESC_FORMAT_FLAGS pdff, PWSTR* ppszDisplay);
HRESULT PSGetImageReferenceForValue(const(PROPERTYKEY)* propkey, const(PROPVARIANT)* propvar, PWSTR* ppszImageRes);
HRESULT PSStringFromPropertyKey(const(PROPERTYKEY)* pkey, PWSTR psz, uint cch);
HRESULT PSPropertyKeyFromString(const(wchar)* pszString, PROPERTYKEY* pkey);
HRESULT PSCreateMemoryPropertyStore(const(GUID)* riid, void** ppv);
HRESULT PSCreateDelayedMultiplexPropertyStore(GETPROPERTYSTOREFLAGS flags, IDelayedPropertyStoreFactory pdpsf, const(uint)* rgStoreIds, uint cStores, const(GUID)* riid, void** ppv);
HRESULT PSCreateMultiplexPropertyStore(IUnknown* prgpunkStores, uint cStores, const(GUID)* riid, void** ppv);
HRESULT PSCreatePropertyChangeArray(const(PROPERTYKEY)* rgpropkey, const(PKA_FLAGS)* rgflags, const(PROPVARIANT)* rgpropvar, uint cChanges, const(GUID)* riid, void** ppv);
HRESULT PSCreateSimplePropertyChange(PKA_FLAGS flags, const(PROPERTYKEY)* key, const(PROPVARIANT)* propvar, const(GUID)* riid, void** ppv);
HRESULT PSGetPropertyDescription(const(PROPERTYKEY)* propkey, const(GUID)* riid, void** ppv);
HRESULT PSGetPropertyDescriptionByName(const(wchar)* pszCanonicalName, const(GUID)* riid, void** ppv);
HRESULT PSLookupPropertyHandlerCLSID(const(wchar)* pszFilePath, GUID* pclsid);
HRESULT PSGetItemPropertyHandler(IUnknown punkItem, BOOL fReadWrite, const(GUID)* riid, void** ppv);
HRESULT PSGetItemPropertyHandlerWithCreateObject(IUnknown punkItem, BOOL fReadWrite, IUnknown punkCreateObject, const(GUID)* riid, void** ppv);
HRESULT PSGetPropertyValue(IPropertyStore pps, IPropertyDescription ppd, PROPVARIANT* ppropvar);
HRESULT PSSetPropertyValue(IPropertyStore pps, IPropertyDescription ppd, const(PROPVARIANT)* propvar);
HRESULT PSRegisterPropertySchema(const(wchar)* pszPath);
HRESULT PSUnregisterPropertySchema(const(wchar)* pszPath);
HRESULT PSRefreshPropertySchema();
HRESULT PSEnumeratePropertyDescriptions(PROPDESC_ENUMFILTER filterOn, const(GUID)* riid, void** ppv);
HRESULT PSGetPropertyKeyFromName(const(wchar)* pszName, PROPERTYKEY* ppropkey);
HRESULT PSGetNameFromPropertyKey(const(PROPERTYKEY)* propkey, PWSTR* ppszCanonicalName);
HRESULT PSCoerceToCanonicalValue(const(PROPERTYKEY)* key, PROPVARIANT* ppropvar);
HRESULT PSGetPropertyDescriptionListFromString(const(wchar)* pszPropList, const(GUID)* riid, void** ppv);
HRESULT PSCreatePropertyStoreFromPropertySetStorage(IPropertySetStorage ppss, uint grfMode, const(GUID)* riid, void** ppv);
HRESULT PSCreatePropertyStoreFromObject(IUnknown punk, uint grfMode, const(GUID)* riid, void** ppv);
HRESULT PSCreateAdapterFromPropertyStore(IPropertyStore pps, const(GUID)* riid, void** ppv);
HRESULT PSGetPropertySystem(const(GUID)* riid, void** ppv);
HRESULT PSGetPropertyFromPropertyStorage(PCUSERIALIZEDPROPSTORAGE psps, uint cb, const(PROPERTYKEY)* rpkey, PROPVARIANT* ppropvar);
HRESULT PSGetNamedPropertyFromPropertyStorage(PCUSERIALIZEDPROPSTORAGE psps, uint cb, const(wchar)* pszName, PROPVARIANT* ppropvar);
HRESULT PSPropertyBag_ReadType(IPropertyBag propBag, const(wchar)* propName, VARIANT* var, VARENUM type);
HRESULT PSPropertyBag_ReadStr(IPropertyBag propBag, const(wchar)* propName, PWSTR value, int characterCount);
HRESULT PSPropertyBag_ReadStrAlloc(IPropertyBag propBag, const(wchar)* propName, PWSTR* value);
HRESULT PSPropertyBag_ReadBSTR(IPropertyBag propBag, const(wchar)* propName, BSTR* value);
HRESULT PSPropertyBag_WriteStr(IPropertyBag propBag, const(wchar)* propName, const(wchar)* value);
HRESULT PSPropertyBag_WriteBSTR(IPropertyBag propBag, const(wchar)* propName, BSTR value);
HRESULT PSPropertyBag_ReadInt(IPropertyBag propBag, const(wchar)* propName, int* value);
HRESULT PSPropertyBag_WriteInt(IPropertyBag propBag, const(wchar)* propName, int value);
HRESULT PSPropertyBag_ReadSHORT(IPropertyBag propBag, const(wchar)* propName, short* value);
HRESULT PSPropertyBag_WriteSHORT(IPropertyBag propBag, const(wchar)* propName, short value);
HRESULT PSPropertyBag_ReadLONG(IPropertyBag propBag, const(wchar)* propName, int* value);
HRESULT PSPropertyBag_WriteLONG(IPropertyBag propBag, const(wchar)* propName, int value);
HRESULT PSPropertyBag_ReadDWORD(IPropertyBag propBag, const(wchar)* propName, uint* value);
HRESULT PSPropertyBag_WriteDWORD(IPropertyBag propBag, const(wchar)* propName, uint value);
HRESULT PSPropertyBag_ReadBOOL(IPropertyBag propBag, const(wchar)* propName, BOOL* value);
HRESULT PSPropertyBag_WriteBOOL(IPropertyBag propBag, const(wchar)* propName, BOOL value);
HRESULT PSPropertyBag_ReadPOINTL(IPropertyBag propBag, const(wchar)* propName, POINTL* value);
HRESULT PSPropertyBag_WritePOINTL(IPropertyBag propBag, const(wchar)* propName, const(POINTL)* value);
HRESULT PSPropertyBag_ReadPOINTS(IPropertyBag propBag, const(wchar)* propName, POINTS* value);
HRESULT PSPropertyBag_WritePOINTS(IPropertyBag propBag, const(wchar)* propName, const(POINTS)* value);
HRESULT PSPropertyBag_ReadRECTL(IPropertyBag propBag, const(wchar)* propName, RECTL* value);
HRESULT PSPropertyBag_WriteRECTL(IPropertyBag propBag, const(wchar)* propName, const(RECTL)* value);
HRESULT PSPropertyBag_ReadStream(IPropertyBag propBag, const(wchar)* propName, IStream* value);
HRESULT PSPropertyBag_WriteStream(IPropertyBag propBag, const(wchar)* propName, IStream value);
HRESULT PSPropertyBag_Delete(IPropertyBag propBag, const(wchar)* propName);
HRESULT PSPropertyBag_ReadULONGLONG(IPropertyBag propBag, const(wchar)* propName, ulong* value);
HRESULT PSPropertyBag_WriteULONGLONG(IPropertyBag propBag, const(wchar)* propName, ulong value);
HRESULT PSPropertyBag_ReadUnknown(IPropertyBag propBag, const(wchar)* propName, const(GUID)* riid, void** ppv);
HRESULT PSPropertyBag_WriteUnknown(IPropertyBag propBag, const(wchar)* propName, IUnknown punk);
HRESULT PSPropertyBag_ReadGUID(IPropertyBag propBag, const(wchar)* propName, GUID* value);
HRESULT PSPropertyBag_WriteGUID(IPropertyBag propBag, const(wchar)* propName, const(GUID)* value);
HRESULT PSPropertyBag_ReadPropertyKey(IPropertyBag propBag, const(wchar)* propName, PROPERTYKEY* value);
HRESULT PSPropertyBag_WritePropertyKey(IPropertyBag propBag, const(wchar)* propName, const(PROPERTYKEY)* value);
HRESULT SHGetPropertyStoreFromIDList(ITEMIDLIST* pidl, GETPROPERTYSTOREFLAGS flags, const(GUID)* riid, void** ppv);
HRESULT SHGetPropertyStoreFromParsingName(const(wchar)* pszPath, IBindCtx pbc, GETPROPERTYSTOREFLAGS flags, const(GUID)* riid, void** ppv);
HRESULT SHAddDefaultPropertiesByExt(const(wchar)* pszExt, IPropertyStore pPropStore);
HANDLE PifMgr_OpenProperties(const(wchar)* pszApp, const(wchar)* pszPIF, uint hInf, uint flOpt);
int PifMgr_GetProperties(HANDLE hProps, const(char)* pszGroup, void* lpProps, int cbProps, uint flOpt);
int PifMgr_SetProperties(HANDLE hProps, const(char)* pszGroup, const(void)* lpProps, int cbProps, uint flOpt);
HANDLE PifMgr_CloseProperties(HANDLE hProps, uint flOpt);
HRESULT SHPropStgCreate(IPropertySetStorage psstg, const(GUID)* fmtid, const(GUID)* pclsid, uint grfFlags, uint grfMode, uint dwDisposition, IPropertyStorage* ppstg, uint* puCodePage);
HRESULT SHPropStgReadMultiple(IPropertyStorage pps, uint uCodePage, uint cpspec, const(PROPSPEC)* rgpspec, PROPVARIANT* rgvar);
HRESULT SHPropStgWriteMultiple(IPropertyStorage pps, uint* puCodePage, uint cpspec, const(PROPSPEC)* rgpspec, PROPVARIANT* rgvar, uint propidNameFirst);
HRESULT SHGetPropertyStoreForWindow(HWND hwnd, const(GUID)* riid, void** ppv);
enum PKEY_PIDSTR_MAX = 0x0000000a;
alias SERIALIZEDPROPSTORAGE = long;
alias PCUSERIALIZEDPROPSTORAGE = long;
enum IID_IInitializeWithFile = GUID(0xb7d14566, 0x509, 0x4cce, [0xa7, 0x1f, 0xa, 0x55, 0x42, 0x33, 0xbd, 0x9b]);
interface IInitializeWithFile : IUnknown
{
    HRESULT Initialize(const(wchar)* pszFilePath, uint grfMode);
}
enum IID_IInitializeWithStream = GUID(0xb824b49d, 0x22ac, 0x4161, [0xac, 0x8a, 0x99, 0x16, 0xe8, 0xfa, 0x3f, 0x7f]);
interface IInitializeWithStream : IUnknown
{
    HRESULT Initialize(IStream pstream, uint grfMode);
}
enum IID_IPropertyStore = GUID(0x886d8eeb, 0x8cf2, 0x4446, [0x8d, 0x2, 0xcd, 0xba, 0x1d, 0xbd, 0xcf, 0x99]);
interface IPropertyStore : IUnknown
{
    HRESULT GetCount(uint* cProps);
    HRESULT GetAt(uint iProp, PROPERTYKEY* pkey);
    HRESULT GetValue(const(PROPERTYKEY)* key, PROPVARIANT* pv);
    HRESULT SetValue(const(PROPERTYKEY)* key, const(PROPVARIANT)* propvar);
    HRESULT Commit();
}
enum IID_INamedPropertyStore = GUID(0x71604b0f, 0x97b0, 0x4764, [0x85, 0x77, 0x2f, 0x13, 0xe9, 0x8a, 0x14, 0x22]);
interface INamedPropertyStore : IUnknown
{
    HRESULT GetNamedValue(const(wchar)* pszName, PROPVARIANT* ppropvar);
    HRESULT SetNamedValue(const(wchar)* pszName, const(PROPVARIANT)* propvar);
    HRESULT GetNameCount(uint* pdwCount);
    HRESULT GetNameAt(uint iProp, BSTR* pbstrName);
}
alias GETPROPERTYSTOREFLAGS = int;
enum : int
{
    GPS_DEFAULT                 = 0x00000000,
    GPS_HANDLERPROPERTIESONLY   = 0x00000001,
    GPS_READWRITE               = 0x00000002,
    GPS_TEMPORARY               = 0x00000004,
    GPS_FASTPROPERTIESONLY      = 0x00000008,
    GPS_OPENSLOWITEM            = 0x00000010,
    GPS_DELAYCREATION           = 0x00000020,
    GPS_BESTEFFORT              = 0x00000040,
    GPS_NO_OPLOCK               = 0x00000080,
    GPS_PREFERQUERYPROPERTIES   = 0x00000100,
    GPS_EXTRINSICPROPERTIES     = 0x00000200,
    GPS_EXTRINSICPROPERTIESONLY = 0x00000400,
    GPS_VOLATILEPROPERTIES      = 0x00000800,
    GPS_VOLATILEPROPERTIESONLY  = 0x00001000,
    GPS_MASK_VALID              = 0x00001fff,
}

enum IID_IObjectWithPropertyKey = GUID(0xfc0ca0a7, 0xc316, 0x4fd2, [0x90, 0x31, 0x3e, 0x62, 0x8e, 0x6d, 0x4f, 0x23]);
interface IObjectWithPropertyKey : IUnknown
{
    HRESULT SetPropertyKey(const(PROPERTYKEY)* key);
    HRESULT GetPropertyKey(PROPERTYKEY* pkey);
}
alias PKA_FLAGS = int;
enum : int
{
    PKA_SET    = 0x00000000,
    PKA_APPEND = 0x00000001,
    PKA_DELETE = 0x00000002,
}

enum IID_IPropertyChange = GUID(0xf917bc8a, 0x1bba, 0x4478, [0xa2, 0x45, 0x1b, 0xde, 0x3, 0xeb, 0x94, 0x31]);
interface IPropertyChange : IObjectWithPropertyKey
{
    HRESULT ApplyToPropVariant(const(PROPVARIANT)* propvarIn, PROPVARIANT* ppropvarOut);
}
enum IID_IPropertyChangeArray = GUID(0x380f5cad, 0x1b5e, 0x42f2, [0x80, 0x5d, 0x63, 0x7f, 0xd3, 0x92, 0xd3, 0x1e]);
interface IPropertyChangeArray : IUnknown
{
    HRESULT GetCount(uint* pcOperations);
    HRESULT GetAt(uint iIndex, const(GUID)* riid, void** ppv);
    HRESULT InsertAt(uint iIndex, IPropertyChange ppropChange);
    HRESULT Append(IPropertyChange ppropChange);
    HRESULT AppendOrReplace(IPropertyChange ppropChange);
    HRESULT RemoveAt(uint iIndex);
    HRESULT IsKeyInArray(const(PROPERTYKEY)* key);
}
enum IID_IPropertyStoreCapabilities = GUID(0xc8e2d566, 0x186e, 0x4d49, [0xbf, 0x41, 0x69, 0x9, 0xea, 0xd5, 0x6a, 0xcc]);
interface IPropertyStoreCapabilities : IUnknown
{
    HRESULT IsPropertyWritable(const(PROPERTYKEY)* key);
}
alias PSC_STATE = int;
enum : int
{
    PSC_NORMAL      = 0x00000000,
    PSC_NOTINSOURCE = 0x00000001,
    PSC_DIRTY       = 0x00000002,
    PSC_READONLY    = 0x00000003,
}

enum IID_IPropertyStoreCache = GUID(0x3017056d, 0x9a91, 0x4e90, [0x93, 0x7d, 0x74, 0x6c, 0x72, 0xab, 0xbf, 0x4f]);
interface IPropertyStoreCache : IPropertyStore
{
    HRESULT GetState(const(PROPERTYKEY)* key, PSC_STATE* pstate);
    HRESULT GetValueAndState(const(PROPERTYKEY)* key, PROPVARIANT* ppropvar, PSC_STATE* pstate);
    HRESULT SetState(const(PROPERTYKEY)* key, PSC_STATE state);
    HRESULT SetValueAndState(const(PROPERTYKEY)* key, const(PROPVARIANT)* ppropvar, PSC_STATE state);
}
alias PROPENUMTYPE = int;
enum : int
{
    PET_DISCRETEVALUE = 0x00000000,
    PET_RANGEDVALUE   = 0x00000001,
    PET_DEFAULTVALUE  = 0x00000002,
    PET_ENDRANGE      = 0x00000003,
}

enum IID_IPropertyEnumType = GUID(0x11e1fbf9, 0x2d56, 0x4a6b, [0x8d, 0xb3, 0x7c, 0xd1, 0x93, 0xa4, 0x71, 0xf2]);
interface IPropertyEnumType : IUnknown
{
    HRESULT GetEnumType(PROPENUMTYPE* penumtype);
    HRESULT GetValue(PROPVARIANT* ppropvar);
    HRESULT GetRangeMinValue(PROPVARIANT* ppropvarMin);
    HRESULT GetRangeSetValue(PROPVARIANT* ppropvarSet);
    HRESULT GetDisplayText(PWSTR* ppszDisplay);
}
enum IID_IPropertyEnumType2 = GUID(0x9b6e051c, 0x5ddd, 0x4321, [0x90, 0x70, 0xfe, 0x2a, 0xcb, 0x55, 0xe7, 0x94]);
interface IPropertyEnumType2 : IPropertyEnumType
{
    HRESULT GetImageReference(PWSTR* ppszImageRes);
}
enum IID_IPropertyEnumTypeList = GUID(0xa99400f4, 0x3d84, 0x4557, [0x94, 0xba, 0x12, 0x42, 0xfb, 0x2c, 0xc9, 0xa6]);
interface IPropertyEnumTypeList : IUnknown
{
    HRESULT GetCount(uint* pctypes);
    HRESULT GetAt(uint itype, const(GUID)* riid, void** ppv);
    HRESULT GetConditionAt(uint nIndex, const(GUID)* riid, void** ppv);
    HRESULT FindMatchingIndex(const(PROPVARIANT)* propvarCmp, uint* pnIndex);
}
alias PROPDESC_TYPE_FLAGS = uint;
enum : uint
{
    PDTF_DEFAULT                   = 0x00000000,
    PDTF_MULTIPLEVALUES            = 0x00000001,
    PDTF_ISINNATE                  = 0x00000002,
    PDTF_ISGROUP                   = 0x00000004,
    PDTF_CANGROUPBY                = 0x00000008,
    PDTF_CANSTACKBY                = 0x00000010,
    PDTF_ISTREEPROPERTY            = 0x00000020,
    PDTF_INCLUDEINFULLTEXTQUERY    = 0x00000040,
    PDTF_ISVIEWABLE                = 0x00000080,
    PDTF_ISQUERYABLE               = 0x00000100,
    PDTF_CANBEPURGED               = 0x00000200,
    PDTF_SEARCHRAWVALUE            = 0x00000400,
    PDTF_DONTCOERCEEMPTYSTRINGS    = 0x00000800,
    PDTF_ALWAYSINSUPPLEMENTALSTORE = 0x00001000,
    PDTF_ISSYSTEMPROPERTY          = 0x80000000,
    PDTF_MASK_ALL                  = 0x80001fff,
}

alias PROPDESC_VIEW_FLAGS = int;
enum : int
{
    PDVF_DEFAULT             = 0x00000000,
    PDVF_CENTERALIGN         = 0x00000001,
    PDVF_RIGHTALIGN          = 0x00000002,
    PDVF_BEGINNEWGROUP       = 0x00000004,
    PDVF_FILLAREA            = 0x00000008,
    PDVF_SORTDESCENDING      = 0x00000010,
    PDVF_SHOWONLYIFPRESENT   = 0x00000020,
    PDVF_SHOWBYDEFAULT       = 0x00000040,
    PDVF_SHOWINPRIMARYLIST   = 0x00000080,
    PDVF_SHOWINSECONDARYLIST = 0x00000100,
    PDVF_HIDELABEL           = 0x00000200,
    PDVF_HIDDEN              = 0x00000800,
    PDVF_CANWRAP             = 0x00001000,
    PDVF_MASK_ALL            = 0x00001bff,
}

alias PROPDESC_DISPLAYTYPE = int;
enum : int
{
    PDDT_STRING     = 0x00000000,
    PDDT_NUMBER     = 0x00000001,
    PDDT_BOOLEAN    = 0x00000002,
    PDDT_DATETIME   = 0x00000003,
    PDDT_ENUMERATED = 0x00000004,
}

alias PROPDESC_GROUPING_RANGE = int;
enum : int
{
    PDGR_DISCRETE     = 0x00000000,
    PDGR_ALPHANUMERIC = 0x00000001,
    PDGR_SIZE         = 0x00000002,
    PDGR_DYNAMIC      = 0x00000003,
    PDGR_DATE         = 0x00000004,
    PDGR_PERCENT      = 0x00000005,
    PDGR_ENUMERATED   = 0x00000006,
}

alias PROPDESC_FORMAT_FLAGS = int;
enum : int
{
    PDFF_DEFAULT              = 0x00000000,
    PDFF_PREFIXNAME           = 0x00000001,
    PDFF_FILENAME             = 0x00000002,
    PDFF_ALWAYSKB             = 0x00000004,
    PDFF_RESERVED_RIGHTTOLEFT = 0x00000008,
    PDFF_SHORTTIME            = 0x00000010,
    PDFF_LONGTIME             = 0x00000020,
    PDFF_HIDETIME             = 0x00000040,
    PDFF_SHORTDATE            = 0x00000080,
    PDFF_LONGDATE             = 0x00000100,
    PDFF_HIDEDATE             = 0x00000200,
    PDFF_RELATIVEDATE         = 0x00000400,
    PDFF_USEEDITINVITATION    = 0x00000800,
    PDFF_READONLY             = 0x00001000,
    PDFF_NOAUTOREADINGORDER   = 0x00002000,
}

alias PROPDESC_SORTDESCRIPTION = int;
enum : int
{
    PDSD_GENERAL          = 0x00000000,
    PDSD_A_Z              = 0x00000001,
    PDSD_LOWEST_HIGHEST   = 0x00000002,
    PDSD_SMALLEST_BIGGEST = 0x00000003,
    PDSD_OLDEST_NEWEST    = 0x00000004,
}

alias PROPDESC_RELATIVEDESCRIPTION_TYPE = int;
enum : int
{
    PDRDT_GENERAL  = 0x00000000,
    PDRDT_DATE     = 0x00000001,
    PDRDT_SIZE     = 0x00000002,
    PDRDT_COUNT    = 0x00000003,
    PDRDT_REVISION = 0x00000004,
    PDRDT_LENGTH   = 0x00000005,
    PDRDT_DURATION = 0x00000006,
    PDRDT_SPEED    = 0x00000007,
    PDRDT_RATE     = 0x00000008,
    PDRDT_RATING   = 0x00000009,
    PDRDT_PRIORITY = 0x0000000a,
}

alias PROPDESC_AGGREGATION_TYPE = int;
enum : int
{
    PDAT_DEFAULT   = 0x00000000,
    PDAT_FIRST     = 0x00000001,
    PDAT_SUM       = 0x00000002,
    PDAT_AVERAGE   = 0x00000003,
    PDAT_DATERANGE = 0x00000004,
    PDAT_UNION     = 0x00000005,
    PDAT_MAX       = 0x00000006,
    PDAT_MIN       = 0x00000007,
}

alias PROPDESC_CONDITION_TYPE = int;
enum : int
{
    PDCOT_NONE     = 0x00000000,
    PDCOT_STRING   = 0x00000001,
    PDCOT_SIZE     = 0x00000002,
    PDCOT_DATETIME = 0x00000003,
    PDCOT_BOOLEAN  = 0x00000004,
    PDCOT_NUMBER   = 0x00000005,
}

enum IID_IPropertyDescription = GUID(0x6f79d558, 0x3e96, 0x4549, [0xa1, 0xd1, 0x7d, 0x75, 0xd2, 0x28, 0x88, 0x14]);
interface IPropertyDescription : IUnknown
{
    HRESULT GetPropertyKey(PROPERTYKEY* pkey);
    HRESULT GetCanonicalName(PWSTR* ppszName);
    HRESULT GetPropertyType(ushort* pvartype);
    HRESULT GetDisplayName(PWSTR* ppszName);
    HRESULT GetEditInvitation(PWSTR* ppszInvite);
    HRESULT GetTypeFlags(PROPDESC_TYPE_FLAGS mask, PROPDESC_TYPE_FLAGS* ppdtFlags);
    HRESULT GetViewFlags(PROPDESC_VIEW_FLAGS* ppdvFlags);
    HRESULT GetDefaultColumnWidth(uint* pcxChars);
    HRESULT GetDisplayType(PROPDESC_DISPLAYTYPE* pdisplaytype);
    HRESULT GetColumnState(uint* pcsFlags);
    HRESULT GetGroupingRange(PROPDESC_GROUPING_RANGE* pgr);
    HRESULT GetRelativeDescriptionType(PROPDESC_RELATIVEDESCRIPTION_TYPE* prdt);
    HRESULT GetRelativeDescription(const(PROPVARIANT)* propvar1, const(PROPVARIANT)* propvar2, PWSTR* ppszDesc1, PWSTR* ppszDesc2);
    HRESULT GetSortDescription(PROPDESC_SORTDESCRIPTION* psd);
    HRESULT GetSortDescriptionLabel(BOOL fDescending, PWSTR* ppszDescription);
    HRESULT GetAggregationType(PROPDESC_AGGREGATION_TYPE* paggtype);
    HRESULT GetConditionType(PROPDESC_CONDITION_TYPE* pcontype, CONDITION_OPERATION* popDefault);
    HRESULT GetEnumTypeList(const(GUID)* riid, void** ppv);
    HRESULT CoerceToCanonicalValue(PROPVARIANT* ppropvar);
    HRESULT FormatForDisplay(const(PROPVARIANT)* propvar, PROPDESC_FORMAT_FLAGS pdfFlags, PWSTR* ppszDisplay);
    HRESULT IsValueCanonical(const(PROPVARIANT)* propvar);
}
enum IID_IPropertyDescription2 = GUID(0x57d2eded, 0x5062, 0x400e, [0xb1, 0x7, 0x5d, 0xae, 0x79, 0xfe, 0x57, 0xa6]);
interface IPropertyDescription2 : IPropertyDescription
{
    HRESULT GetImageReferenceForValue(const(PROPVARIANT)* propvar, PWSTR* ppszImageRes);
}
enum IID_IPropertyDescriptionAliasInfo = GUID(0xf67104fc, 0x2af9, 0x46fd, [0xb3, 0x2d, 0x24, 0x3c, 0x14, 0x4, 0xf3, 0xd1]);
interface IPropertyDescriptionAliasInfo : IPropertyDescription
{
    HRESULT GetSortByAlias(const(GUID)* riid, void** ppv);
    HRESULT GetAdditionalSortByAliases(const(GUID)* riid, void** ppv);
}
alias PROPDESC_SEARCHINFO_FLAGS = int;
enum : int
{
    PDSIF_DEFAULT         = 0x00000000,
    PDSIF_ININVERTEDINDEX = 0x00000001,
    PDSIF_ISCOLUMN        = 0x00000002,
    PDSIF_ISCOLUMNSPARSE  = 0x00000004,
    PDSIF_ALWAYSINCLUDE   = 0x00000008,
    PDSIF_USEFORTYPEAHEAD = 0x00000010,
}

alias PROPDESC_COLUMNINDEX_TYPE = int;
enum : int
{
    PDCIT_NONE         = 0x00000000,
    PDCIT_ONDISK       = 0x00000001,
    PDCIT_INMEMORY     = 0x00000002,
    PDCIT_ONDEMAND     = 0x00000003,
    PDCIT_ONDISKALL    = 0x00000004,
    PDCIT_ONDISKVECTOR = 0x00000005,
}

enum IID_IPropertyDescriptionSearchInfo = GUID(0x78f91bd, 0x29a2, 0x440f, [0x92, 0x4e, 0x46, 0xa2, 0x91, 0x52, 0x45, 0x20]);
interface IPropertyDescriptionSearchInfo : IPropertyDescription
{
    HRESULT GetSearchInfoFlags(PROPDESC_SEARCHINFO_FLAGS* ppdsiFlags);
    HRESULT GetColumnIndexType(PROPDESC_COLUMNINDEX_TYPE* ppdciType);
    HRESULT GetProjectionString(PWSTR* ppszProjection);
    HRESULT GetMaxSize(uint* pcbMaxSize);
}
enum IID_IPropertyDescriptionRelatedPropertyInfo = GUID(0x507393f4, 0x2a3d, 0x4a60, [0xb5, 0x9e, 0xd9, 0xc7, 0x57, 0x16, 0xc2, 0xdd]);
interface IPropertyDescriptionRelatedPropertyInfo : IPropertyDescription
{
    HRESULT GetRelatedProperty(const(wchar)* pszRelationshipName, const(GUID)* riid, void** ppv);
}
alias PROPDESC_ENUMFILTER = int;
enum : int
{
    PDEF_ALL             = 0x00000000,
    PDEF_SYSTEM          = 0x00000001,
    PDEF_NONSYSTEM       = 0x00000002,
    PDEF_VIEWABLE        = 0x00000003,
    PDEF_QUERYABLE       = 0x00000004,
    PDEF_INFULLTEXTQUERY = 0x00000005,
    PDEF_COLUMN          = 0x00000006,
}

enum IID_IPropertySystem = GUID(0xca724e8a, 0xc3e6, 0x442b, [0x88, 0xa4, 0x6f, 0xb0, 0xdb, 0x80, 0x35, 0xa3]);
interface IPropertySystem : IUnknown
{
    HRESULT GetPropertyDescription(const(PROPERTYKEY)* propkey, const(GUID)* riid, void** ppv);
    HRESULT GetPropertyDescriptionByName(const(wchar)* pszCanonicalName, const(GUID)* riid, void** ppv);
    HRESULT GetPropertyDescriptionListFromString(const(wchar)* pszPropList, const(GUID)* riid, void** ppv);
    HRESULT EnumeratePropertyDescriptions(PROPDESC_ENUMFILTER filterOn, const(GUID)* riid, void** ppv);
    HRESULT FormatForDisplay(const(PROPERTYKEY)* key, const(PROPVARIANT)* propvar, PROPDESC_FORMAT_FLAGS pdff, PWSTR pszText, uint cchText);
    HRESULT FormatForDisplayAlloc(const(PROPERTYKEY)* key, const(PROPVARIANT)* propvar, PROPDESC_FORMAT_FLAGS pdff, PWSTR* ppszDisplay);
    HRESULT RegisterPropertySchema(const(wchar)* pszPath);
    HRESULT UnregisterPropertySchema(const(wchar)* pszPath);
    HRESULT RefreshPropertySchema();
}
enum IID_IPropertyDescriptionList = GUID(0x1f9fc1d0, 0xc39b, 0x4b26, [0x81, 0x7f, 0x1, 0x19, 0x67, 0xd3, 0x44, 0xe]);
interface IPropertyDescriptionList : IUnknown
{
    HRESULT GetCount(uint* pcElem);
    HRESULT GetAt(uint iElem, const(GUID)* riid, void** ppv);
}
enum IID_IPropertyStoreFactory = GUID(0xbc110b6d, 0x57e8, 0x4148, [0xa9, 0xc6, 0x91, 0x1, 0x5a, 0xb2, 0xf3, 0xa5]);
interface IPropertyStoreFactory : IUnknown
{
    HRESULT GetPropertyStore(GETPROPERTYSTOREFLAGS flags, IUnknown pUnkFactory, const(GUID)* riid, void** ppv);
    HRESULT GetPropertyStoreForKeys(const(PROPERTYKEY)* rgKeys, uint cKeys, GETPROPERTYSTOREFLAGS flags, const(GUID)* riid, void** ppv);
}
enum IID_IDelayedPropertyStoreFactory = GUID(0x40d4577f, 0xe237, 0x4bdb, [0xbd, 0x69, 0x58, 0xf0, 0x89, 0x43, 0x1b, 0x6a]);
interface IDelayedPropertyStoreFactory : IPropertyStoreFactory
{
    HRESULT GetDelayedPropertyStore(GETPROPERTYSTOREFLAGS flags, uint dwStoreId, const(GUID)* riid, void** ppv);
}
alias _PERSIST_SPROPSTORE_FLAGS = int;
enum : int
{
    FPSPS_DEFAULT                   = 0x00000000,
    FPSPS_READONLY                  = 0x00000001,
    FPSPS_TREAT_NEW_VALUES_AS_DIRTY = 0x00000002,
}

enum IID_IPersistSerializedPropStorage = GUID(0xe318ad57, 0xaa0, 0x450f, [0xac, 0xa5, 0x6f, 0xab, 0x71, 0x3, 0xd9, 0x17]);
interface IPersistSerializedPropStorage : IUnknown
{
    HRESULT SetFlags(int flags);
    HRESULT SetPropertyStorage(PCUSERIALIZEDPROPSTORAGE psps, uint cb);
    HRESULT GetPropertyStorage(SERIALIZEDPROPSTORAGE** ppsps, uint* pcb);
}
enum IID_IPersistSerializedPropStorage2 = GUID(0x77effa68, 0x4f98, 0x4366, [0xba, 0x72, 0x57, 0x3b, 0x3d, 0x88, 0x5, 0x71]);
interface IPersistSerializedPropStorage2 : IPersistSerializedPropStorage
{
    HRESULT GetPropertyStorageSize(uint* pcb);
    HRESULT GetPropertyStorageBuffer(SERIALIZEDPROPSTORAGE* psps, uint cb, uint* pcbWritten);
}
enum IID_IPropertySystemChangeNotify = GUID(0xfa955fd9, 0x38be, 0x4879, [0xa6, 0xce, 0x82, 0x4c, 0xf5, 0x2d, 0x60, 0x9f]);
interface IPropertySystemChangeNotify : IUnknown
{
    HRESULT SchemaRefreshed();
}
enum IID_ICreateObject = GUID(0x75121952, 0xe0d0, 0x43e5, [0x93, 0x80, 0x1d, 0x80, 0x48, 0x3a, 0xcf, 0x72]);
interface ICreateObject : IUnknown
{
    HRESULT CreateObject(const(GUID)* clsid, IUnknown pUnkOuter, const(GUID)* riid, void** ppv);
}
enum CLSID_InMemoryPropertyStore = GUID(0x9a02e012, 0x6303, 0x4e1e, [0xb9, 0xa1, 0x63, 0xf, 0x80, 0x25, 0x92, 0xc5]);
struct InMemoryPropertyStore
{
}
enum CLSID_InMemoryPropertyStoreMarshalByValue = GUID(0xd4ca0e2d, 0x6da7, 0x4b75, [0xa9, 0x7c, 0x5f, 0x30, 0x6f, 0xe, 0xae, 0xdc]);
struct InMemoryPropertyStoreMarshalByValue
{
}
enum CLSID_PropertySystem = GUID(0xb8967f85, 0x58ae, 0x4f46, [0x9f, 0xb2, 0x5d, 0x79, 0x4, 0x79, 0x8f, 0x4b]);
struct PropertySystem
{
}
alias SYNC_TRANSFER_STATUS = int;
enum : int
{
    STS_NONE                   = 0x00000000,
    STS_NEEDSUPLOAD            = 0x00000001,
    STS_NEEDSDOWNLOAD          = 0x00000002,
    STS_TRANSFERRING           = 0x00000004,
    STS_PAUSED                 = 0x00000008,
    STS_HASERROR               = 0x00000010,
    STS_FETCHING_METADATA      = 0x00000020,
    STS_USER_REQUESTED_REFRESH = 0x00000040,
    STS_HASWARNING             = 0x00000080,
    STS_EXCLUDED               = 0x00000100,
    STS_INCOMPLETE             = 0x00000200,
    STS_PLACEHOLDER_IFEMPTY    = 0x00000400,
}

alias PLACEHOLDER_STATES = int;
enum : int
{
    PS_NONE                            = 0x00000000,
    PS_MARKED_FOR_OFFLINE_AVAILABILITY = 0x00000001,
    PS_FULL_PRIMARY_STREAM_AVAILABLE   = 0x00000002,
    PS_CREATE_FILE_ACCESSIBLE          = 0x00000004,
    PS_CLOUDFILE_PLACEHOLDER           = 0x00000008,
    PS_DEFAULT                         = 0x00000007,
    PS_ALL                             = 0x0000000f,
}

alias PROPERTYUI_NAME_FLAGS = int;
enum : int
{
    PUIFNF_DEFAULT  = 0x00000000,
    PUIFNF_MNEMONIC = 0x00000001,
}

alias PROPERTYUI_FLAGS = int;
enum : int
{
    PUIF_DEFAULT          = 0x00000000,
    PUIF_RIGHTALIGN       = 0x00000001,
    PUIF_NOLABELININFOTIP = 0x00000002,
}

alias PROPERTYUI_FORMAT_FLAGS = int;
enum : int
{
    PUIFFDF_DEFAULT      = 0x00000000,
    PUIFFDF_RIGHTTOLEFT  = 0x00000001,
    PUIFFDF_SHORTFORMAT  = 0x00000002,
    PUIFFDF_NOTIME       = 0x00000004,
    PUIFFDF_FRIENDLYDATE = 0x00000008,
}

enum IID_IPropertyUI = GUID(0x757a7d9f, 0x919a, 0x4118, [0x99, 0xd7, 0xdb, 0xb2, 0x8, 0xc8, 0xcc, 0x66]);
interface IPropertyUI : IUnknown
{
    HRESULT ParsePropertyName(const(wchar)* pszName, GUID* pfmtid, uint* ppid, uint* pchEaten);
    HRESULT GetCannonicalName(const(GUID)* fmtid, uint pid, PWSTR pwszText, uint cchText);
    HRESULT GetDisplayName(const(GUID)* fmtid, uint pid, PROPERTYUI_NAME_FLAGS flags, PWSTR pwszText, uint cchText);
    HRESULT GetPropertyDescription(const(GUID)* fmtid, uint pid, PWSTR pwszText, uint cchText);
    HRESULT GetDefaultWidth(const(GUID)* fmtid, uint pid, uint* pcxChars);
    HRESULT GetFlags(const(GUID)* fmtid, uint pid, PROPERTYUI_FLAGS* pflags);
    HRESULT FormatForDisplay(const(GUID)* fmtid, uint pid, const(PROPVARIANT)* ppropvar, PROPERTYUI_FORMAT_FLAGS puiff, PWSTR pwszText, uint cchText);
    HRESULT GetHelpInfo(const(GUID)* fmtid, uint pid, PWSTR pwszHelpFile, uint cch, uint* puHelpID);
}
alias PDOPSTATUS = int;
enum : int
{
    PDOPS_RUNNING   = 0x00000001,
    PDOPS_PAUSED    = 0x00000002,
    PDOPS_CANCELLED = 0x00000003,
    PDOPS_STOPPED   = 0x00000004,
    PDOPS_ERRORS    = 0x00000005,
}

alias SYNC_ENGINE_STATE_FLAGS = int;
enum : int
{
    SESF_NONE                          = 0x00000000,
    SESF_SERVICE_QUOTA_NEARING_LIMIT   = 0x00000001,
    SESF_SERVICE_QUOTA_EXCEEDED_LIMIT  = 0x00000002,
    SESF_AUTHENTICATION_ERROR          = 0x00000004,
    SESF_PAUSED_DUE_TO_METERED_NETWORK = 0x00000008,
    SESF_PAUSED_DUE_TO_DISK_SPACE_FULL = 0x00000010,
    SESF_PAUSED_DUE_TO_CLIENT_POLICY   = 0x00000020,
    SESF_PAUSED_DUE_TO_SERVICE_POLICY  = 0x00000040,
    SESF_SERVICE_UNAVAILABLE           = 0x00000080,
    SESF_PAUSED_DUE_TO_USER_REQUEST    = 0x00000100,
    SESF_ALL_FLAGS                     = 0x000001ff,
}

struct PROPPRG
{
    align (1):
    ushort flPrg;
    ushort flPrgInit;
    CHAR[30] achTitle;
    CHAR[128] achCmdLine;
    CHAR[64] achWorkDir;
    ushort wHotKey;
    CHAR[80] achIconFile;
    ushort wIconIndex;
    uint dwEnhModeFlags;
    uint dwRealModeFlags;
    CHAR[80] achOtherFile;
    CHAR[260] achPIFFile;
}
