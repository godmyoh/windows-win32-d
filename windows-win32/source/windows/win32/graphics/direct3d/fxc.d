module windows.win32.graphics.direct3d.fxc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PSTR, PWSTR;
import windows.win32.graphics.direct3d : D3D_SHADER_MACRO, ID3DBlob, ID3DInclude;
import windows.win32.graphics.direct3d10 : ID3D10Effect;
import windows.win32.graphics.direct3d11 : ID3D11FunctionLinkingGraph, ID3D11Linker, ID3D11Module;

version (Windows):
extern (Windows):

HRESULT D3DReadFileToBlob(const(wchar)*, ID3DBlob*);
HRESULT D3DWriteBlobToFile(ID3DBlob, const(wchar)*, BOOL);
HRESULT D3DCompile(const(void)*, ulong, const(char)*, const(D3D_SHADER_MACRO)*, ID3DInclude, const(char)*, const(char)*, uint, uint, ID3DBlob*, ID3DBlob*);
HRESULT D3DCompile2(const(void)*, ulong, const(char)*, const(D3D_SHADER_MACRO)*, ID3DInclude, const(char)*, const(char)*, uint, uint, uint, const(void)*, ulong, ID3DBlob*, ID3DBlob*);
HRESULT D3DCompileFromFile(const(wchar)*, const(D3D_SHADER_MACRO)*, ID3DInclude, const(char)*, const(char)*, uint, uint, ID3DBlob*, ID3DBlob*);
HRESULT D3DPreprocess(const(void)*, ulong, const(char)*, const(D3D_SHADER_MACRO)*, ID3DInclude, ID3DBlob*, ID3DBlob*);
HRESULT D3DGetDebugInfo(const(void)*, ulong, ID3DBlob*);
HRESULT D3DReflect(const(void)*, ulong, const(GUID)*, void**);
HRESULT D3DReflectLibrary(const(void)*, ulong, const(GUID)*, void**);
HRESULT D3DDisassemble(const(void)*, ulong, uint, const(char)*, ID3DBlob*);
HRESULT D3DDisassembleRegion(const(void)*, ulong, uint, const(char)*, ulong, ulong, ulong*, ID3DBlob*);
HRESULT D3DCreateLinker(ID3D11Linker*);
HRESULT D3DLoadModule(const(void)*, ulong, ID3D11Module*);
HRESULT D3DCreateFunctionLinkingGraph(uint, ID3D11FunctionLinkingGraph*);
HRESULT D3DGetTraceInstructionOffsets(const(void)*, ulong, uint, ulong, ulong, ulong*, ulong*);
HRESULT D3DGetInputSignatureBlob(const(void)*, ulong, ID3DBlob*);
HRESULT D3DGetOutputSignatureBlob(const(void)*, ulong, ID3DBlob*);
HRESULT D3DGetInputAndOutputSignatureBlob(const(void)*, ulong, ID3DBlob*);
HRESULT D3DStripShader(const(void)*, ulong, uint, ID3DBlob*);
HRESULT D3DGetBlobPart(const(void)*, ulong, D3D_BLOB_PART, uint, ID3DBlob*);
HRESULT D3DSetBlobPart(const(void)*, ulong, D3D_BLOB_PART, uint, const(void)*, ulong, ID3DBlob*);
HRESULT D3DCreateBlob(ulong, ID3DBlob*);
HRESULT D3DCompressShaders(uint, D3D_SHADER_DATA*, uint, ID3DBlob*);
HRESULT D3DDecompressShaders(const(void)*, ulong, uint, uint, uint*, uint, ID3DBlob*, uint*);
HRESULT D3DDisassemble10Effect(ID3D10Effect, uint, ID3DBlob*);
enum D3DCOMPILER_DLL_W = "d3dcompiler_47.dll";
enum D3DCOMPILER_DLL_A = "d3dcompiler_47.dll";
enum D3D_COMPILER_VERSION = 0x0000002f;
enum D3DCOMPILE_DEBUG = 0x00000001;
enum D3DCOMPILE_SKIP_VALIDATION = 0x00000002;
enum D3DCOMPILE_SKIP_OPTIMIZATION = 0x00000004;
enum D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = 0x00000008;
enum D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = 0x00000010;
enum D3DCOMPILE_PARTIAL_PRECISION = 0x00000020;
enum D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = 0x00000040;
enum D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = 0x00000080;
enum D3DCOMPILE_NO_PRESHADER = 0x00000100;
enum D3DCOMPILE_AVOID_FLOW_CONTROL = 0x00000200;
enum D3DCOMPILE_PREFER_FLOW_CONTROL = 0x00000400;
enum D3DCOMPILE_ENABLE_STRICTNESS = 0x00000800;
enum D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = 0x00001000;
enum D3DCOMPILE_IEEE_STRICTNESS = 0x00002000;
enum D3DCOMPILE_OPTIMIZATION_LEVEL0 = 0x00004000;
enum D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0x00000000;
enum D3DCOMPILE_OPTIMIZATION_LEVEL3 = 0x00008000;
enum D3DCOMPILE_RESERVED16 = 0x00010000;
enum D3DCOMPILE_RESERVED17 = 0x00020000;
enum D3DCOMPILE_WARNINGS_ARE_ERRORS = 0x00040000;
enum D3DCOMPILE_RESOURCES_MAY_ALIAS = 0x00080000;
enum D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = 0x00100000;
enum D3DCOMPILE_ALL_RESOURCES_BOUND = 0x00200000;
enum D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = 0x00400000;
enum D3DCOMPILE_DEBUG_NAME_FOR_BINARY = 0x00800000;
enum D3DCOMPILE_EFFECT_CHILD_EFFECT = 0x00000001;
enum D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = 0x00000002;
enum D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0x00000000;
enum D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = 0x00000010;
enum D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = 0x00000020;
enum D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS = 0x00000001;
enum D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS = 0x00000002;
enum D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH = 0x00000004;
enum D3D_DISASM_ENABLE_COLOR_CODE = 0x00000001;
enum D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = 0x00000002;
enum D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 0x00000004;
enum D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = 0x00000008;
enum D3D_DISASM_DISABLE_DEBUG_INFO = 0x00000010;
enum D3D_DISASM_ENABLE_INSTRUCTION_OFFSET = 0x00000020;
enum D3D_DISASM_INSTRUCTION_ONLY = 0x00000040;
enum D3D_DISASM_PRINT_HEX_LITERALS = 0x00000080;
enum D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 0x00000001;
enum D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = 0x00000001;
alias pD3DCompile = HRESULT function(const(void)*, ulong, const(char)*, const(D3D_SHADER_MACRO)*, ID3DInclude, const(char)*, const(char)*, uint, uint, ID3DBlob*, ID3DBlob*);
alias pD3DPreprocess = HRESULT function(const(void)*, ulong, const(char)*, const(D3D_SHADER_MACRO)*, ID3DInclude, ID3DBlob*, ID3DBlob*);
alias pD3DDisassemble = HRESULT function(const(void)*, ulong, uint, const(char)*, ID3DBlob*);
alias D3DCOMPILER_STRIP_FLAGS = int;
enum : int
{
    D3DCOMPILER_STRIP_REFLECTION_DATA = 0x00000001,
    D3DCOMPILER_STRIP_DEBUG_INFO      = 0x00000002,
    D3DCOMPILER_STRIP_TEST_BLOBS      = 0x00000004,
    D3DCOMPILER_STRIP_PRIVATE_DATA    = 0x00000008,
    D3DCOMPILER_STRIP_ROOT_SIGNATURE  = 0x00000010,
}

alias D3D_BLOB_PART = int;
enum : int
{
    D3D_BLOB_INPUT_SIGNATURE_BLOB            = 0x00000000,
    D3D_BLOB_OUTPUT_SIGNATURE_BLOB           = 0x00000001,
    D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB = 0x00000002,
    D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB   = 0x00000003,
    D3D_BLOB_ALL_SIGNATURE_BLOB              = 0x00000004,
    D3D_BLOB_DEBUG_INFO                      = 0x00000005,
    D3D_BLOB_LEGACY_SHADER                   = 0x00000006,
    D3D_BLOB_XNA_PREPASS_SHADER              = 0x00000007,
    D3D_BLOB_XNA_SHADER                      = 0x00000008,
    D3D_BLOB_PDB                             = 0x00000009,
    D3D_BLOB_PRIVATE_DATA                    = 0x0000000a,
    D3D_BLOB_ROOT_SIGNATURE                  = 0x0000000b,
    D3D_BLOB_DEBUG_NAME                      = 0x0000000c,
    D3D_BLOB_TEST_ALTERNATE_SHADER           = 0x00008000,
    D3D_BLOB_TEST_COMPILE_DETAILS            = 0x00008001,
    D3D_BLOB_TEST_COMPILE_PERF               = 0x00008002,
    D3D_BLOB_TEST_COMPILE_REPORT             = 0x00008003,
}

struct D3D_SHADER_DATA
{
    const(void)* pBytecode;
    ulong BytecodeLength;
}
