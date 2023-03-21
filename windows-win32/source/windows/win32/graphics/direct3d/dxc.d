module windows.win32.graphics.direct3d.dxc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PSTR, PWSTR;
import windows.win32.system.com_ : IMalloc, IStream, IUnknown;

version (Windows):
extern (Windows):

alias DXC_CP = uint;
enum : uint
{
    DXC_CP_ACP   = 0x00000000,
    DXC_CP_UTF16 = 0x000004b0,
    DXC_CP_UTF8  = 0x0000fde9,
}

HRESULT DxcCreateInstance(const(GUID)*, const(GUID)*, void**);
HRESULT DxcCreateInstance2(IMalloc, const(GUID)*, const(GUID)*, void**);
enum DXC_HASHFLAG_INCLUDES_SOURCE = 0x00000001;
enum DXC_ARG_DEBUG = "-Zi";
enum DXC_ARG_SKIP_VALIDATION = "-Vd";
enum DXC_ARG_SKIP_OPTIMIZATIONS = "-Od";
enum DXC_ARG_PACK_MATRIX_ROW_MAJOR = "-Zpr";
enum DXC_ARG_PACK_MATRIX_COLUMN_MAJOR = "-Zpc";
enum DXC_ARG_AVOID_FLOW_CONTROL = "-Gfa";
enum DXC_ARG_PREFER_FLOW_CONTROL = "-Gfp";
enum DXC_ARG_ENABLE_STRICTNESS = "-Ges";
enum DXC_ARG_ENABLE_BACKWARDS_COMPATIBILITY = "-Gec";
enum DXC_ARG_IEEE_STRICTNESS = "-Gis";
enum DXC_ARG_OPTIMIZATION_LEVEL0 = "-O0";
enum DXC_ARG_OPTIMIZATION_LEVEL1 = "-O1";
enum DXC_ARG_OPTIMIZATION_LEVEL2 = "-O2";
enum DXC_ARG_OPTIMIZATION_LEVEL3 = "-O3";
enum DXC_ARG_WARNINGS_ARE_ERRORS = "-WX";
enum DXC_ARG_RESOURCES_MAY_ALIAS = "-res_may_alias";
enum DXC_ARG_ALL_RESOURCES_BOUND = "-all_resources_bound";
enum DXC_ARG_DEBUG_NAME_FOR_SOURCE = "-Zss";
enum DXC_ARG_DEBUG_NAME_FOR_BINARY = "-Zsb";
enum DXC_EXTRA_OUTPUT_NAME_STDOUT = "*stdout*";
enum DXC_EXTRA_OUTPUT_NAME_STDERR = "*stderr*";
enum DxcValidatorFlags_Default = 0x00000000;
enum DxcValidatorFlags_InPlaceEdit = 0x00000001;
enum DxcValidatorFlags_RootSignatureOnly = 0x00000002;
enum DxcValidatorFlags_ModuleOnly = 0x00000004;
enum DxcValidatorFlags_ValidMask = 0x00000007;
enum DxcVersionInfoFlags_None = 0x00000000;
enum DxcVersionInfoFlags_Debug = 0x00000001;
enum DxcVersionInfoFlags_Internal = 0x00000002;
enum CLSID_DxcCompiler = GUID(0x73e22d93, 0xe6ce, 0x47f3, [0xb5, 0xbf, 0xf0, 0x66, 0x4f, 0x39, 0xc1, 0xb0]);
enum CLSID_DxcLinker = GUID(0xef6a8087, 0xb0ea, 0x4d56, [0x9e, 0x45, 0xd0, 0x7e, 0x1a, 0x8b, 0x78, 0x6]);
enum CLSID_DxcDiaDataSource = GUID(0xcd1f6b73, 0x2ab0, 0x484d, [0x8e, 0xdc, 0xeb, 0xe7, 0xa4, 0x3c, 0xa0, 0x9f]);
enum CLSID_DxcCompilerArgs = GUID(0x3e56ae82, 0x224d, 0x470f, [0xa1, 0xa1, 0xfe, 0x30, 0x16, 0xee, 0x9f, 0x9d]);
enum CLSID_DxcLibrary = GUID(0x6245d6af, 0x66e0, 0x48fd, [0x80, 0xb4, 0x4d, 0x27, 0x17, 0x96, 0x74, 0x8c]);
enum CLSID_DxcValidator = GUID(0x8ca3e215, 0xf728, 0x4cf3, [0x8c, 0xdd, 0x88, 0xaf, 0x91, 0x75, 0x87, 0xa1]);
enum CLSID_DxcAssembler = GUID(0xd728db68, 0xf903, 0x4f80, [0x94, 0xcd, 0xdc, 0xcf, 0x76, 0xec, 0x71, 0x51]);
enum CLSID_DxcContainerReflection = GUID(0xb9f54489, 0x55b8, 0x400c, [0xba, 0x3a, 0x16, 0x75, 0xe4, 0x72, 0x8b, 0x91]);
enum CLSID_DxcOptimizer = GUID(0xae2cd79f, 0xcc22, 0x453f, [0x9b, 0x6b, 0xb1, 0x24, 0xe7, 0xa5, 0x20, 0x4c]);
enum CLSID_DxcContainerBuilder = GUID(0x94134294, 0x411f, 0x4574, [0xb4, 0xd0, 0x87, 0x41, 0xe2, 0x52, 0x40, 0xd2]);
enum CLSID_DxcPdbUtils = GUID(0x54621dfb, 0xf2ce, 0x457e, [0xae, 0x8c, 0xec, 0x35, 0x5f, 0xae, 0xec, 0x7c]);
alias DxcCreateInstanceProc = HRESULT function(const(GUID)*, const(GUID)*, void**);
alias DxcCreateInstance2Proc = HRESULT function(IMalloc, const(GUID)*, const(GUID)*, void**);
struct DxcShaderHash
{
    uint Flags;
    ubyte[16] HashDigest;
}
enum IID_IDxcBlob = GUID(0x8ba5fb08, 0x5195, 0x40e2, [0xac, 0x58, 0xd, 0x98, 0x9c, 0x3a, 0x1, 0x2]);
interface IDxcBlob : IUnknown
{
    void* GetBufferPointer();
    ulong GetBufferSize();
}
enum IID_IDxcBlobEncoding = GUID(0x7241d424, 0x2646, 0x4191, [0x97, 0xc0, 0x98, 0xe9, 0x6e, 0x42, 0xfc, 0x68]);
interface IDxcBlobEncoding : IDxcBlob
{
    HRESULT GetEncoding(BOOL*, DXC_CP*);
}
enum IID_IDxcBlobUtf16 = GUID(0xa3f84eab, 0xfaa, 0x497e, [0xa3, 0x9c, 0xee, 0x6e, 0xd6, 0xb, 0x2d, 0x84]);
interface IDxcBlobUtf16 : IDxcBlobEncoding
{
    PWSTR GetStringPointer();
    ulong GetStringLength();
}
enum IID_IDxcBlobUtf8 = GUID(0x3da636c9, 0xba71, 0x4024, [0xa3, 0x1, 0x30, 0xcb, 0xf1, 0x25, 0x30, 0x5b]);
interface IDxcBlobUtf8 : IDxcBlobEncoding
{
    PSTR GetStringPointer();
    ulong GetStringLength();
}
enum IID_IDxcIncludeHandler = GUID(0x7f61fc7d, 0x950d, 0x467f, [0xb3, 0xe3, 0x3c, 0x2, 0xfb, 0x49, 0x18, 0x7c]);
interface IDxcIncludeHandler : IUnknown
{
    HRESULT LoadSource(const(wchar)*, IDxcBlob*);
}
struct DxcBuffer
{
    const(void)* Ptr;
    ulong Size;
    uint Encoding;
}
struct DxcDefine
{
    const(wchar)* Name;
    const(wchar)* Value;
}
enum IID_IDxcCompilerArgs = GUID(0x73effe2a, 0x70dc, 0x45f8, [0x96, 0x90, 0xef, 0xf6, 0x4c, 0x2, 0x42, 0x9d]);
interface IDxcCompilerArgs : IUnknown
{
    PWSTR* GetArguments();
    uint GetCount();
    HRESULT AddArguments(const(wchar)**, uint);
    HRESULT AddArgumentsUTF8(const(char)**, uint);
    HRESULT AddDefines(const(DxcDefine)*, uint);
}
enum IID_IDxcLibrary = GUID(0xe5204dc7, 0xd18c, 0x4c3c, [0xbd, 0xfb, 0x85, 0x16, 0x73, 0x98, 0xf, 0xe7]);
interface IDxcLibrary : IUnknown
{
    HRESULT SetMalloc(IMalloc);
    HRESULT CreateBlobFromBlob(IDxcBlob, uint, uint, IDxcBlob*);
    HRESULT CreateBlobFromFile(const(wchar)*, DXC_CP*, IDxcBlobEncoding*);
    HRESULT CreateBlobWithEncodingFromPinned(const(void)*, uint, DXC_CP, IDxcBlobEncoding*);
    HRESULT CreateBlobWithEncodingOnHeapCopy(const(void)*, uint, DXC_CP, IDxcBlobEncoding*);
    HRESULT CreateBlobWithEncodingOnMalloc(const(void)*, IMalloc, uint, DXC_CP, IDxcBlobEncoding*);
    HRESULT CreateIncludeHandler(IDxcIncludeHandler*);
    HRESULT CreateStreamFromBlobReadOnly(IDxcBlob, IStream*);
    HRESULT GetBlobAsUtf8(IDxcBlob, IDxcBlobEncoding*);
    HRESULT GetBlobAsUtf16(IDxcBlob, IDxcBlobEncoding*);
}
enum IID_IDxcOperationResult = GUID(0xcedb484a, 0xd4e9, 0x445a, [0xb9, 0x91, 0xca, 0x21, 0xca, 0x15, 0x7d, 0xc2]);
interface IDxcOperationResult : IUnknown
{
    HRESULT GetStatus(HRESULT*);
    HRESULT GetResult(IDxcBlob*);
    HRESULT GetErrorBuffer(IDxcBlobEncoding*);
}
enum IID_IDxcCompiler = GUID(0x8c210bf3, 0x11f, 0x4422, [0x8d, 0x70, 0x6f, 0x9a, 0xcb, 0x8d, 0xb6, 0x17]);
interface IDxcCompiler : IUnknown
{
    HRESULT Compile(IDxcBlob, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)**, uint, const(DxcDefine)*, uint, IDxcIncludeHandler, IDxcOperationResult*);
    HRESULT Preprocess(IDxcBlob, const(wchar)*, const(wchar)**, uint, const(DxcDefine)*, uint, IDxcIncludeHandler, IDxcOperationResult*);
    HRESULT Disassemble(IDxcBlob, IDxcBlobEncoding*);
}
enum IID_IDxcCompiler2 = GUID(0xa005a9d9, 0xb8bb, 0x4594, [0xb5, 0xc9, 0xe, 0x63, 0x3b, 0xec, 0x4d, 0x37]);
interface IDxcCompiler2 : IDxcCompiler
{
    HRESULT CompileWithDebug(IDxcBlob, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)**, uint, const(DxcDefine)*, uint, IDxcIncludeHandler, IDxcOperationResult*, PWSTR*, IDxcBlob*);
}
enum IID_IDxcLinker = GUID(0xf1b5be2a, 0x62dd, 0x4327, [0xa1, 0xc2, 0x42, 0xac, 0x1e, 0x1e, 0x78, 0xe6]);
interface IDxcLinker : IUnknown
{
    HRESULT RegisterLibrary(const(wchar)*, IDxcBlob);
    HRESULT Link(const(wchar)*, const(wchar)*, const(wchar)**, uint, const(wchar)**, uint, IDxcOperationResult*);
}
enum IID_IDxcUtils = GUID(0x4605c4cb, 0x2019, 0x492a, [0xad, 0xa4, 0x65, 0xf2, 0xb, 0xb7, 0xd6, 0x7f]);
interface IDxcUtils : IUnknown
{
    HRESULT CreateBlobFromBlob(IDxcBlob, uint, uint, IDxcBlob*);
    HRESULT CreateBlobFromPinned(const(void)*, uint, DXC_CP, IDxcBlobEncoding*);
    HRESULT MoveToBlob(const(void)*, IMalloc, uint, DXC_CP, IDxcBlobEncoding*);
    HRESULT CreateBlob(const(void)*, uint, DXC_CP, IDxcBlobEncoding*);
    HRESULT LoadFile(const(wchar)*, DXC_CP*, IDxcBlobEncoding*);
    HRESULT CreateReadOnlyStreamFromBlob(IDxcBlob, IStream*);
    HRESULT CreateDefaultIncludeHandler(IDxcIncludeHandler*);
    HRESULT GetBlobAsUtf8(IDxcBlob, IDxcBlobUtf8*);
    HRESULT GetBlobAsUtf16(IDxcBlob, IDxcBlobUtf16*);
    HRESULT GetDxilContainerPart(const(DxcBuffer)*, uint, void**, uint*);
    HRESULT CreateReflection(const(DxcBuffer)*, const(GUID)*, void**);
    HRESULT BuildArguments(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)**, uint, const(DxcDefine)*, uint, IDxcCompilerArgs*);
    HRESULT GetPDBContents(IDxcBlob, IDxcBlob*, IDxcBlob*);
}
alias DXC_OUT_KIND = int;
enum : int
{
    DXC_OUT_NONE           = 0x00000000,
    DXC_OUT_OBJECT         = 0x00000001,
    DXC_OUT_ERRORS         = 0x00000002,
    DXC_OUT_PDB            = 0x00000003,
    DXC_OUT_SHADER_HASH    = 0x00000004,
    DXC_OUT_DISASSEMBLY    = 0x00000005,
    DXC_OUT_HLSL           = 0x00000006,
    DXC_OUT_TEXT           = 0x00000007,
    DXC_OUT_REFLECTION     = 0x00000008,
    DXC_OUT_ROOT_SIGNATURE = 0x00000009,
    DXC_OUT_EXTRA_OUTPUTS  = 0x0000000a,
    DXC_OUT_FORCE_DWORD    = 0xffffffff,
}

enum IID_IDxcResult = GUID(0x58346cda, 0xdde7, 0x4497, [0x94, 0x61, 0x6f, 0x87, 0xaf, 0x5e, 0x6, 0x59]);
interface IDxcResult : IDxcOperationResult
{
    BOOL HasOutput(DXC_OUT_KIND);
    HRESULT GetOutput(DXC_OUT_KIND, const(GUID)*, void**, IDxcBlobUtf16*);
    uint GetNumOutputs();
    DXC_OUT_KIND GetOutputByIndex(uint);
    DXC_OUT_KIND PrimaryOutput();
}
enum IID_IDxcExtraOutputs = GUID(0x319b37a2, 0xa5c2, 0x494a, [0xa5, 0xde, 0x48, 0x1, 0xb2, 0xfa, 0xf9, 0x89]);
interface IDxcExtraOutputs : IUnknown
{
    uint GetOutputCount();
    HRESULT GetOutput(uint, const(GUID)*, void**, IDxcBlobUtf16*, IDxcBlobUtf16*);
}
enum IID_IDxcCompiler3 = GUID(0x228b4687, 0x5a6a, 0x4730, [0x90, 0xc, 0x97, 0x2, 0xb2, 0x20, 0x3f, 0x54]);
interface IDxcCompiler3 : IUnknown
{
    HRESULT Compile(const(DxcBuffer)*, const(wchar)**, uint, IDxcIncludeHandler, const(GUID)*, void**);
    HRESULT Disassemble(const(DxcBuffer)*, const(GUID)*, void**);
}
enum IID_IDxcValidator = GUID(0xa6e82bd2, 0x1fd7, 0x4826, [0x98, 0x11, 0x28, 0x57, 0xe7, 0x97, 0xf4, 0x9a]);
interface IDxcValidator : IUnknown
{
    HRESULT Validate(IDxcBlob, uint, IDxcOperationResult*);
}
enum IID_IDxcValidator2 = GUID(0x458e1fd1, 0xb1b2, 0x4750, [0xa6, 0xe1, 0x9c, 0x10, 0xf0, 0x3b, 0xed, 0x92]);
interface IDxcValidator2 : IDxcValidator
{
    HRESULT ValidateWithDebug(IDxcBlob, uint, DxcBuffer*, IDxcOperationResult*);
}
enum IID_IDxcContainerBuilder = GUID(0x334b1f50, 0x2292, 0x4b35, [0x99, 0xa1, 0x25, 0x58, 0x8d, 0x8c, 0x17, 0xfe]);
interface IDxcContainerBuilder : IUnknown
{
    HRESULT Load(IDxcBlob);
    HRESULT AddPart(uint, IDxcBlob);
    HRESULT RemovePart(uint);
    HRESULT SerializeContainer(IDxcOperationResult*);
}
enum IID_IDxcAssembler = GUID(0x91f7a26, 0x1c1f, 0x4948, [0x90, 0x4b, 0xe6, 0xe3, 0xa8, 0xa7, 0x71, 0xd5]);
interface IDxcAssembler : IUnknown
{
    HRESULT AssembleToContainer(IDxcBlob, IDxcOperationResult*);
}
enum IID_IDxcContainerReflection = GUID(0xd2c21b26, 0x8350, 0x4bdc, [0x97, 0x6a, 0x33, 0x1c, 0xe6, 0xf4, 0xc5, 0x4c]);
interface IDxcContainerReflection : IUnknown
{
    HRESULT Load(IDxcBlob);
    HRESULT GetPartCount(uint*);
    HRESULT GetPartKind(uint, uint*);
    HRESULT GetPartContent(uint, IDxcBlob*);
    HRESULT FindFirstPartKind(uint, uint*);
    HRESULT GetPartReflection(uint, const(GUID)*, void**);
}
enum IID_IDxcOptimizerPass = GUID(0xae2cd79f, 0xcc22, 0x453f, [0x9b, 0x6b, 0xb1, 0x24, 0xe7, 0xa5, 0x20, 0x4c]);
interface IDxcOptimizerPass : IUnknown
{
    HRESULT GetOptionName(PWSTR*);
    HRESULT GetDescription(PWSTR*);
    HRESULT GetOptionArgCount(uint*);
    HRESULT GetOptionArgName(uint, PWSTR*);
    HRESULT GetOptionArgDescription(uint, PWSTR*);
}
enum IID_IDxcOptimizer = GUID(0x25740e2e, 0x9cba, 0x401b, [0x91, 0x19, 0x4f, 0xb4, 0x2f, 0x39, 0xf2, 0x70]);
interface IDxcOptimizer : IUnknown
{
    HRESULT GetAvailablePassCount(uint*);
    HRESULT GetAvailablePass(uint, IDxcOptimizerPass*);
    HRESULT RunOptimizer(IDxcBlob, const(wchar)**, uint, IDxcBlob*, IDxcBlobEncoding*);
}
enum IID_IDxcVersionInfo = GUID(0xb04f5b50, 0x2059, 0x4f12, [0xa8, 0xff, 0xa1, 0xe0, 0xcd, 0xe1, 0xcc, 0x7e]);
interface IDxcVersionInfo : IUnknown
{
    HRESULT GetVersion(uint*, uint*);
    HRESULT GetFlags(uint*);
}
enum IID_IDxcVersionInfo2 = GUID(0xfb6904c4, 0x42f0, 0x4b62, [0x9c, 0x46, 0x98, 0x3a, 0xf7, 0xda, 0x7c, 0x83]);
interface IDxcVersionInfo2 : IDxcVersionInfo
{
    HRESULT GetCommitInfo(uint*, byte**);
}
enum IID_IDxcVersionInfo3 = GUID(0x5e13e843, 0x9d25, 0x473c, [0x9a, 0xd2, 0x3, 0xb2, 0xd0, 0xb4, 0x4b, 0x1e]);
interface IDxcVersionInfo3 : IUnknown
{
    HRESULT GetCustomVersionString(byte**);
}
struct DxcArgPair
{
    const(wchar)* pName;
    const(wchar)* pValue;
}
enum IID_IDxcPdbUtils = GUID(0xe6c9647e, 0x9d6a, 0x4c3b, [0xb9, 0x4c, 0x52, 0x4b, 0x5a, 0x6c, 0x34, 0x3d]);
interface IDxcPdbUtils : IUnknown
{
    HRESULT Load(IDxcBlob);
    HRESULT GetSourceCount(uint*);
    HRESULT GetSource(uint, IDxcBlobEncoding*);
    HRESULT GetSourceName(uint, BSTR*);
    HRESULT GetFlagCount(uint*);
    HRESULT GetFlag(uint, BSTR*);
    HRESULT GetArgCount(uint*);
    HRESULT GetArg(uint, BSTR*);
    HRESULT GetArgPairCount(uint*);
    HRESULT GetArgPair(uint, BSTR*, BSTR*);
    HRESULT GetDefineCount(uint*);
    HRESULT GetDefine(uint, BSTR*);
    HRESULT GetTargetProfile(BSTR*);
    HRESULT GetEntryPoint(BSTR*);
    HRESULT GetMainFileName(BSTR*);
    HRESULT GetHash(IDxcBlob*);
    HRESULT GetName(BSTR*);
    BOOL IsFullPDB();
    HRESULT GetFullPDB(IDxcBlob*);
    HRESULT GetVersionInfo(IDxcVersionInfo*);
    HRESULT SetCompiler(IDxcCompiler3);
    HRESULT CompileForFullPDB(IDxcResult*);
    HRESULT OverrideArgs(DxcArgPair*, uint);
    HRESULT OverrideRootSignature(const(wchar)*);
}
