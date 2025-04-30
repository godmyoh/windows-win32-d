module windows.win32.ui.xaml.diagnostics;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PWSTR, RECT;
import windows.win32.graphics.dxgi.common : DXGI_ALPHA_MODE, DXGI_FORMAT;
import windows.win32.system.com : IUnknown, SAFEARRAY;
import windows.win32.system.winrt : IInspectable;

version (Windows):
extern (Windows):

HRESULT InitializeXamlDiagnostic(const(wchar)* endPointName, uint pid, const(wchar)* wszDllXamlDiagnostics, const(wchar)* wszTAPDllName, GUID tapClsid);
HRESULT InitializeXamlDiagnosticsEx(const(wchar)* endPointName, uint pid, const(wchar)* wszDllXamlDiagnostics, const(wchar)* wszTAPDllName, GUID tapClsid, const(wchar)* wszInitializationData);
enum E_UNKNOWNTYPE = 0xffffffff802b0028;
alias VisualMutationType = int;
enum : int
{
    Add     = 0x00000000,
    Remove  = 0x00000001,
}

alias BaseValueSource = int;
enum : int
{
    BaseValueSourceUnknown      = 0x00000000,
    BaseValueSourceDefault      = 0x00000001,
    BaseValueSourceBuiltInStyle = 0x00000002,
    BaseValueSourceStyle        = 0x00000003,
    BaseValueSourceLocal        = 0x00000004,
    Inherited                   = 0x00000005,
    DefaultStyleTrigger         = 0x00000006,
    TemplateTrigger             = 0x00000007,
    StyleTrigger                = 0x00000008,
    ImplicitStyleReference      = 0x00000009,
    ParentTemplate              = 0x0000000a,
    ParentTemplateTrigger       = 0x0000000b,
    Animation                   = 0x0000000c,
    Coercion                    = 0x0000000d,
    BaseValueSourceVisualState  = 0x0000000e,
}

struct SourceInfo
{
    BSTR FileName;
    uint LineNumber;
    uint ColumnNumber;
    uint CharPosition;
    BSTR Hash;
}
struct ParentChildRelation
{
    ulong Parent;
    ulong Child;
    uint ChildIndex;
}
struct VisualElement
{
    ulong Handle;
    SourceInfo SrcInfo;
    BSTR Type;
    BSTR Name;
    uint NumChildren;
}
struct PropertyChainSource
{
    ulong Handle;
    BSTR TargetType;
    BSTR Name;
    BaseValueSource Source;
    SourceInfo SrcInfo;
}
alias MetadataBit = int;
enum : int
{
    None                           = 0x00000000,
    IsValueHandle                  = 0x00000001,
    IsPropertyReadOnly             = 0x00000002,
    IsValueCollection              = 0x00000004,
    IsValueCollectionReadOnly      = 0x00000008,
    IsValueBindingExpression       = 0x00000010,
    IsValueNull                    = 0x00000020,
    IsValueHandleAndEvaluatedValue = 0x00000040,
}

struct PropertyChainValue
{
    uint Index;
    BSTR Type;
    BSTR DeclaringType;
    BSTR ValueType;
    BSTR ItemType;
    BSTR Value;
    BOOL Overridden;
    long MetadataBits;
    BSTR PropertyName;
    uint PropertyChainIndex;
}
struct EnumType
{
    BSTR Name;
    SAFEARRAY* ValueInts;
    SAFEARRAY* ValueStrings;
}
struct CollectionElementValue
{
    uint Index;
    BSTR ValueType;
    BSTR Value;
    long MetadataBits;
}
alias RenderTargetBitmapOptions = int;
enum : int
{
    RenderTarget            = 0x00000000,
    RenderTargetAndChildren = 0x00000001,
}

struct BitmapDescription
{
    uint Width;
    uint Height;
    DXGI_FORMAT Format;
    DXGI_ALPHA_MODE AlphaMode;
}
alias ResourceType = int;
enum : int
{
    ResourceTypeStatic = 0x00000000,
    ResourceTypeTheme  = 0x00000001,
}

alias VisualElementState = int;
enum : int
{
    ErrorResolved         = 0x00000000,
    ErrorResourceNotFound = 0x00000001,
    ErrorInvalidResource  = 0x00000002,
}

enum IID_IVisualTreeServiceCallback = GUID(0xaa7a8931, 0x80e4, 0x4fec, [0x8f, 0x3b, 0x55, 0x3f, 0x87, 0xb4, 0x96, 0x6e]);
interface IVisualTreeServiceCallback : IUnknown
{
    HRESULT OnVisualTreeChange(ParentChildRelation relation, VisualElement element, VisualMutationType mutationType);
}
enum IID_IVisualTreeServiceCallback2 = GUID(0xbad9eb88, 0xae77, 0x4397, [0xb9, 0x48, 0x5f, 0xa2, 0xdb, 0xa, 0x19, 0xea]);
interface IVisualTreeServiceCallback2 : IVisualTreeServiceCallback
{
    HRESULT OnElementStateChanged(ulong element, VisualElementState elementState, const(wchar)* context);
}
enum IID_IVisualTreeService = GUID(0xa593b11a, 0xd17f, 0x48bb, [0x8f, 0x66, 0x83, 0x91, 0x7, 0x31, 0xc8, 0xa5]);
interface IVisualTreeService : IUnknown
{
    HRESULT AdviseVisualTreeChange(IVisualTreeServiceCallback pCallback);
    HRESULT UnadviseVisualTreeChange(IVisualTreeServiceCallback pCallback);
    HRESULT GetEnums(uint* pCount, EnumType** ppEnums);
    HRESULT CreateInstance(BSTR typeName, BSTR value, ulong* pInstanceHandle);
    HRESULT GetPropertyValuesChain(ulong instanceHandle, uint* pSourceCount, PropertyChainSource** ppPropertySources, uint* pPropertyCount, PropertyChainValue** ppPropertyValues);
    HRESULT SetProperty(ulong instanceHandle, ulong value, uint propertyIndex);
    HRESULT ClearProperty(ulong instanceHandle, uint propertyIndex);
    HRESULT GetCollectionCount(ulong instanceHandle, uint* pCollectionSize);
    HRESULT GetCollectionElements(ulong instanceHandle, uint startIndex, uint* pElementCount, CollectionElementValue** ppElementValues);
    HRESULT AddChild(ulong parent, ulong child, uint index);
    HRESULT RemoveChild(ulong parent, uint index);
    HRESULT ClearChildren(ulong parent);
}
enum IID_IXamlDiagnostics = GUID(0x18c9e2b6, 0x3f43, 0x4116, [0x9f, 0x2b, 0xff, 0x93, 0x5d, 0x77, 0x70, 0xd2]);
interface IXamlDiagnostics : IUnknown
{
    HRESULT GetDispatcher(IInspectable* ppDispatcher);
    HRESULT GetUiLayer(IInspectable* ppLayer);
    HRESULT GetApplication(IInspectable* ppApplication);
    HRESULT GetIInspectableFromHandle(ulong instanceHandle, IInspectable* ppInstance);
    HRESULT GetHandleFromIInspectable(IInspectable pInstance, ulong* pHandle);
    HRESULT HitTest(RECT rect, uint* pCount, ulong** ppInstanceHandles);
    HRESULT RegisterInstance(IInspectable pInstance, ulong* pInstanceHandle);
    HRESULT GetInitializationData(BSTR* pInitializationData);
}
enum IID_IBitmapData = GUID(0xd1a34ef2, 0xcad8, 0x4635, [0xa3, 0xd2, 0xfc, 0xda, 0x8d, 0x3f, 0x3c, 0xaf]);
interface IBitmapData : IUnknown
{
    HRESULT CopyBytesTo(uint sourceOffsetInBytes, uint maxBytesToCopy, ubyte* pvBytes, uint* numberOfBytesCopied);
    HRESULT GetStride(uint* pStride);
    HRESULT GetBitmapDescription(BitmapDescription* pBitmapDescription);
    HRESULT GetSourceBitmapDescription(BitmapDescription* pBitmapDescription);
}
enum IID_IVisualTreeService2 = GUID(0x130f5136, 0xec43, 0x4f61, [0x89, 0xc7, 0x98, 0x1, 0xa3, 0x6d, 0x2e, 0x95]);
interface IVisualTreeService2 : IVisualTreeService
{
    HRESULT GetPropertyIndex(ulong object, const(wchar)* propertyName, uint* pPropertyIndex);
    HRESULT GetProperty(ulong object, uint propertyIndex, ulong* pValue);
    HRESULT ReplaceResource(ulong resourceDictionary, ulong key, ulong newValue);
    HRESULT RenderTargetBitmap(ulong handle, RenderTargetBitmapOptions options, uint maxPixelWidth, uint maxPixelHeight, IBitmapData* ppBitmapData);
}
enum IID_IVisualTreeService3 = GUID(0xe79c6e0, 0x85a0, 0x4be8, [0xb4, 0x1a, 0x65, 0x5c, 0xf1, 0xfd, 0x19, 0xbd]);
interface IVisualTreeService3 : IVisualTreeService2
{
    HRESULT ResolveResource(ulong resourceContext, const(wchar)* resourceName, ResourceType resourceType, uint propertyIndex);
    HRESULT GetDictionaryItem(ulong dictionaryHandle, const(wchar)* resourceName, BOOL resourceIsImplicitStyle, ulong* resourceHandle);
    HRESULT AddDictionaryItem(ulong dictionaryHandle, ulong resourceKey, ulong resourceHandle);
    HRESULT RemoveDictionaryItem(ulong dictionaryHandle, ulong resourceKey);
}
