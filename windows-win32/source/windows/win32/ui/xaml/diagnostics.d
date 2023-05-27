module windows.win32.ui.xaml.diagnostics;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PWSTR, RECT;
import windows.win32.graphics.dxgi.common : DXGI_ALPHA_MODE, DXGI_FORMAT;
import windows.win32.system.com : IUnknown, SAFEARRAY;
import windows.win32.system.winrt : IInspectable;

version (Windows):
extern (Windows):

HRESULT InitializeXamlDiagnostic(const(wchar)*, uint, const(wchar)*, const(wchar)*, GUID);
HRESULT InitializeXamlDiagnosticsEx(const(wchar)*, uint, const(wchar)*, const(wchar)*, GUID, const(wchar)*);
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
    HRESULT OnVisualTreeChange(ParentChildRelation, VisualElement, VisualMutationType);
}
enum IID_IVisualTreeServiceCallback2 = GUID(0xbad9eb88, 0xae77, 0x4397, [0xb9, 0x48, 0x5f, 0xa2, 0xdb, 0xa, 0x19, 0xea]);
interface IVisualTreeServiceCallback2 : IVisualTreeServiceCallback
{
    HRESULT OnElementStateChanged(ulong, VisualElementState, const(wchar)*);
}
enum IID_IVisualTreeService = GUID(0xa593b11a, 0xd17f, 0x48bb, [0x8f, 0x66, 0x83, 0x91, 0x7, 0x31, 0xc8, 0xa5]);
interface IVisualTreeService : IUnknown
{
    HRESULT AdviseVisualTreeChange(IVisualTreeServiceCallback);
    HRESULT UnadviseVisualTreeChange(IVisualTreeServiceCallback);
    HRESULT GetEnums(uint*, EnumType**);
    HRESULT CreateInstance(BSTR, BSTR, ulong*);
    HRESULT GetPropertyValuesChain(ulong, uint*, PropertyChainSource**, uint*, PropertyChainValue**);
    HRESULT SetProperty(ulong, ulong, uint);
    HRESULT ClearProperty(ulong, uint);
    HRESULT GetCollectionCount(ulong, uint*);
    HRESULT GetCollectionElements(ulong, uint, uint*, CollectionElementValue**);
    HRESULT AddChild(ulong, ulong, uint);
    HRESULT RemoveChild(ulong, uint);
    HRESULT ClearChildren(ulong);
}
enum IID_IXamlDiagnostics = GUID(0x18c9e2b6, 0x3f43, 0x4116, [0x9f, 0x2b, 0xff, 0x93, 0x5d, 0x77, 0x70, 0xd2]);
interface IXamlDiagnostics : IUnknown
{
    HRESULT GetDispatcher(IInspectable*);
    HRESULT GetUiLayer(IInspectable*);
    HRESULT GetApplication(IInspectable*);
    HRESULT GetIInspectableFromHandle(ulong, IInspectable*);
    HRESULT GetHandleFromIInspectable(IInspectable, ulong*);
    HRESULT HitTest(RECT, uint*, ulong**);
    HRESULT RegisterInstance(IInspectable, ulong*);
    HRESULT GetInitializationData(BSTR*);
}
enum IID_IBitmapData = GUID(0xd1a34ef2, 0xcad8, 0x4635, [0xa3, 0xd2, 0xfc, 0xda, 0x8d, 0x3f, 0x3c, 0xaf]);
interface IBitmapData : IUnknown
{
    HRESULT CopyBytesTo(uint, uint, ubyte*, uint*);
    HRESULT GetStride(uint*);
    HRESULT GetBitmapDescription(BitmapDescription*);
    HRESULT GetSourceBitmapDescription(BitmapDescription*);
}
enum IID_IVisualTreeService2 = GUID(0x130f5136, 0xec43, 0x4f61, [0x89, 0xc7, 0x98, 0x1, 0xa3, 0x6d, 0x2e, 0x95]);
interface IVisualTreeService2 : IVisualTreeService
{
    HRESULT GetPropertyIndex(ulong, const(wchar)*, uint*);
    HRESULT GetProperty(ulong, uint, ulong*);
    HRESULT ReplaceResource(ulong, ulong, ulong);
    HRESULT RenderTargetBitmap(ulong, RenderTargetBitmapOptions, uint, uint, IBitmapData*);
}
enum IID_IVisualTreeService3 = GUID(0xe79c6e0, 0x85a0, 0x4be8, [0xb4, 0x1a, 0x65, 0x5c, 0xf1, 0xfd, 0x19, 0xbd]);
interface IVisualTreeService3 : IVisualTreeService2
{
    HRESULT ResolveResource(ulong, const(wchar)*, ResourceType, uint);
    HRESULT GetDictionaryItem(ulong, const(wchar)*, BOOL, ulong*);
    HRESULT AddDictionaryItem(ulong, ulong, ulong);
    HRESULT RemoveDictionaryItem(ulong, ulong);
}
