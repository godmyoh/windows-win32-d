module windows.win32.graphics.direct3d.fxc;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PSTR, PWSTR;
import windows.win32.graphics.direct3d : D3D_SHADER_MACRO, ID3DBlob, ID3DInclude;
import windows.win32.graphics.direct3d10 : ID3D10Effect;
import windows.win32.graphics.direct3d11 : ID3D11FunctionLinkingGraph, ID3D11Linker, ID3D11Module;

version (Windows):
extern (Windows):

HRESULT D3DReadFileToBlob(const(wchar)* pFileName, ID3DBlob* ppContents);
HRESULT D3DWriteBlobToFile(ID3DBlob pBlob, const(wchar)* pFileName, BOOL bOverwrite);
HRESULT D3DCompile(const(void)* pSrcData, ulong SrcDataSize, const(char)* pSourceName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, const(char)* pEntrypoint, const(char)* pTarget, uint Flags1, uint Flags2, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
HRESULT D3DCompile2(const(void)* pSrcData, ulong SrcDataSize, const(char)* pSourceName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, const(char)* pEntrypoint, const(char)* pTarget, uint Flags1, uint Flags2, uint SecondaryDataFlags, const(void)* pSecondaryData, ulong SecondaryDataSize, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
HRESULT D3DCompileFromFile(const(wchar)* pFileName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, const(char)* pEntrypoint, const(char)* pTarget, uint Flags1, uint Flags2, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
HRESULT D3DPreprocess(const(void)* pSrcData, ulong SrcDataSize, const(char)* pSourceName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, ID3DBlob* ppCodeText, ID3DBlob* ppErrorMsgs);
HRESULT D3DGetDebugInfo(const(void)* pSrcData, ulong SrcDataSize, ID3DBlob* ppDebugInfo);
HRESULT D3DReflect(const(void)* pSrcData, ulong SrcDataSize, const(GUID)* pInterface, void** ppReflector);
HRESULT D3DReflectLibrary(const(void)* pSrcData, ulong SrcDataSize, const(GUID)* riid, void** ppReflector);
HRESULT D3DDisassemble(const(void)* pSrcData, ulong SrcDataSize, uint Flags, const(char)* szComments, ID3DBlob* ppDisassembly);
HRESULT D3DDisassembleRegion(const(void)* pSrcData, ulong SrcDataSize, uint Flags, const(char)* szComments, ulong StartByteOffset, ulong NumInsts, ulong* pFinishByteOffset, ID3DBlob* ppDisassembly);
HRESULT D3DCreateLinker(ID3D11Linker* ppLinker);
HRESULT D3DLoadModule(const(void)* pSrcData, ulong cbSrcDataSize, ID3D11Module* ppModule);
HRESULT D3DCreateFunctionLinkingGraph(uint uFlags, ID3D11FunctionLinkingGraph* ppFunctionLinkingGraph);
HRESULT D3DGetTraceInstructionOffsets(const(void)* pSrcData, ulong SrcDataSize, uint Flags, ulong StartInstIndex, ulong NumInsts, ulong* pOffsets, ulong* pTotalInsts);
HRESULT D3DGetInputSignatureBlob(const(void)* pSrcData, ulong SrcDataSize, ID3DBlob* ppSignatureBlob);
HRESULT D3DGetOutputSignatureBlob(const(void)* pSrcData, ulong SrcDataSize, ID3DBlob* ppSignatureBlob);
HRESULT D3DGetInputAndOutputSignatureBlob(const(void)* pSrcData, ulong SrcDataSize, ID3DBlob* ppSignatureBlob);
HRESULT D3DStripShader(const(void)* pShaderBytecode, ulong BytecodeLength, uint uStripFlags, ID3DBlob* ppStrippedBlob);
HRESULT D3DGetBlobPart(const(void)* pSrcData, ulong SrcDataSize, D3D_BLOB_PART Part, uint Flags, ID3DBlob* ppPart);
HRESULT D3DSetBlobPart(const(void)* pSrcData, ulong SrcDataSize, D3D_BLOB_PART Part, uint Flags, const(void)* pPart, ulong PartSize, ID3DBlob* ppNewShader);
HRESULT D3DCreateBlob(ulong Size, ID3DBlob* ppBlob);
HRESULT D3DCompressShaders(uint uNumShaders, D3D_SHADER_DATA* pShaderData, uint uFlags, ID3DBlob* ppCompressedData);
HRESULT D3DDecompressShaders(const(void)* pSrcData, ulong SrcDataSize, uint uNumShaders, uint uStartIndex, uint* pIndices, uint uFlags, ID3DBlob* ppShaders, uint* pTotalShaders);
HRESULT D3DDisassemble10Effect(ID3D10Effect pEffect, uint Flags, ID3DBlob* ppDisassembly);
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
alias pD3DCompile = HRESULT function(const(void)* pSrcData, ulong SrcDataSize, const(char)* pFileName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, const(char)* pEntrypoint, const(char)* pTarget, uint Flags1, uint Flags2, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
alias pD3DPreprocess = HRESULT function(const(void)* pSrcData, ulong SrcDataSize, const(char)* pFileName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, ID3DBlob* ppCodeText, ID3DBlob* ppErrorMsgs);
alias pD3DDisassemble = HRESULT function(const(void)* pSrcData, ulong SrcDataSize, uint Flags, const(char)* szComments, ID3DBlob* ppDisassembly);
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
