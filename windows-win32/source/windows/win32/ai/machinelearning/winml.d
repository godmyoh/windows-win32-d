module windows.win32.ai.machinelearning.winml;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PSTR, PWSTR;
import windows.win32.graphics.direct3d12 : ID3D12Device, ID3D12Resource;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT WinMLCreateRuntime(IWinMLRuntime*);
HRESULT MLCreateOperatorRegistry(IMLOperatorRegistry*);
enum WINML_TENSOR_DIMENSION_COUNT_MAX = 0x00000004;
alias WINML_TENSOR_DATA_TYPE = int;
enum : int
{
    WINML_TENSOR_UNDEFINED  = 0x00000000,
    WINML_TENSOR_FLOAT      = 0x00000001,
    WINML_TENSOR_UINT8      = 0x00000002,
    WINML_TENSOR_INT8       = 0x00000003,
    WINML_TENSOR_UINT16     = 0x00000004,
    WINML_TENSOR_INT16      = 0x00000005,
    WINML_TENSOR_INT32      = 0x00000006,
    WINML_TENSOR_INT64      = 0x00000007,
    WINML_TENSOR_STRING     = 0x00000008,
    WINML_TENSOR_BOOLEAN    = 0x00000009,
    WINML_TENSOR_FLOAT16    = 0x0000000a,
    WINML_TENSOR_DOUBLE     = 0x0000000b,
    WINML_TENSOR_UINT32     = 0x0000000c,
    WINML_TENSOR_UINT64     = 0x0000000d,
    WINML_TENSOR_COMPLEX64  = 0x0000000e,
    WINML_TENSOR_COMPLEX128 = 0x0000000f,
}

alias WINML_FEATURE_TYPE = int;
enum : int
{
    WINML_FEATURE_UNDEFINED = 0x00000000,
    WINML_FEATURE_TENSOR    = 0x00000001,
    WINML_FEATURE_SEQUENCE  = 0x00000002,
    WINML_FEATURE_MAP       = 0x00000003,
    WINML_FEATURE_IMAGE     = 0x00000004,
}

alias WINML_BINDING_TYPE = int;
enum : int
{
    WINML_BINDING_UNDEFINED = 0x00000000,
    WINML_BINDING_TENSOR    = 0x00000001,
    WINML_BINDING_SEQUENCE  = 0x00000002,
    WINML_BINDING_MAP       = 0x00000003,
    WINML_BINDING_IMAGE     = 0x00000004,
    WINML_BINDING_RESOURCE  = 0x00000005,
}

struct WINML_TENSOR_BINDING_DESC
{
    WINML_TENSOR_DATA_TYPE DataType;
    uint NumDimensions;
    long* pShape;
    uint DataSize;
    void* pData;
}
struct WINML_SEQUENCE_BINDING_DESC
{
    uint ElementCount;
    WINML_TENSOR_DATA_TYPE ElementType;
    union
    {
        PWSTR* pStrings;
        long* pInts;
        float* pFloats;
        double* pDoubles;
    }
}
struct WINML_MAP_BINDING_DESC
{
    uint ElementCount;
    WINML_TENSOR_DATA_TYPE KeyType;
    union
    {
        PWSTR* pStringKeys;
        long* pIntKeys;
    }
    WINML_TENSOR_DATA_TYPE Fields;
    union
    {
        PWSTR* pStringFields;
        long* pIntFields;
        float* pFloatFields;
        double* pDoubleFields;
    }
}
struct WINML_IMAGE_BINDING_DESC
{
    WINML_TENSOR_DATA_TYPE ElementType;
    uint NumDimensions;
    long* pShape;
    uint DataSize;
    void* pData;
}
struct WINML_RESOURCE_BINDING_DESC
{
    WINML_TENSOR_DATA_TYPE ElementType;
    uint NumDimensions;
    long* pShape;
    ID3D12Resource pResource;
}
struct WINML_BINDING_DESC
{
    const(wchar)* Name;
    WINML_BINDING_TYPE BindType;
    union
    {
        WINML_TENSOR_BINDING_DESC Tensor;
        WINML_SEQUENCE_BINDING_DESC Sequence;
        WINML_MAP_BINDING_DESC Map;
        WINML_IMAGE_BINDING_DESC Image;
        WINML_RESOURCE_BINDING_DESC Resource;
    }
}
struct WINML_TENSOR_VARIABLE_DESC
{
    WINML_TENSOR_DATA_TYPE ElementType;
    uint NumDimensions;
    long* pShape;
}
struct WINML_SEQUENCE_VARIABLE_DESC
{
    WINML_TENSOR_DATA_TYPE ElementType;
}
struct WINML_MAP_VARIABLE_DESC
{
    WINML_TENSOR_DATA_TYPE KeyType;
    WINML_TENSOR_DATA_TYPE Fields;
}
struct WINML_IMAGE_VARIABLE_DESC
{
    WINML_TENSOR_DATA_TYPE ElementType;
    uint NumDimensions;
    long* pShape;
}
struct WINML_VARIABLE_DESC
{
    PWSTR Name;
    PWSTR Description;
    WINML_FEATURE_TYPE FeatureType;
    BOOL Required;
    union
    {
        WINML_TENSOR_VARIABLE_DESC Tensor;
        WINML_SEQUENCE_VARIABLE_DESC Sequence;
        WINML_MAP_VARIABLE_DESC Map;
        WINML_IMAGE_VARIABLE_DESC Image;
    }
}
struct WINML_MODEL_DESC
{
    PWSTR Author;
    PWSTR Name;
    PWSTR Domain;
    PWSTR Description;
    ulong Version;
}
enum IID_IWinMLModel = GUID(0xe2eeb6a9, 0xf31f, 0x4055, [0xa5, 0x21, 0xe3, 0xb, 0x5b, 0x33, 0x66, 0x4a]);
interface IWinMLModel : IUnknown
{
    HRESULT GetDescription(WINML_MODEL_DESC**);
    HRESULT EnumerateMetadata(uint, const(wchar)**, const(wchar)**);
    HRESULT EnumerateModelInputs(uint, WINML_VARIABLE_DESC**);
    HRESULT EnumerateModelOutputs(uint, WINML_VARIABLE_DESC**);
}
enum IID_IWinMLEvaluationContext = GUID(0x95848f9e, 0x583d, 0x4054, [0xaf, 0x12, 0x91, 0x63, 0x87, 0xcd, 0x84, 0x26]);
interface IWinMLEvaluationContext : IUnknown
{
    HRESULT BindValue(WINML_BINDING_DESC*);
    HRESULT GetValueByName(const(wchar)*, WINML_BINDING_DESC**);
    HRESULT Clear();
}
enum IID_IWinMLRuntime = GUID(0xa0425329, 0x40ae, 0x48d9, [0xbc, 0xe3, 0x82, 0x9e, 0xf7, 0xb8, 0xa4, 0x1a]);
interface IWinMLRuntime : IUnknown
{
    HRESULT LoadModel(const(wchar)*, IWinMLModel*);
    HRESULT CreateEvaluationContext(ID3D12Device, IWinMLEvaluationContext*);
    HRESULT EvaluateModel(IWinMLEvaluationContext);
}
alias WINML_RUNTIME_TYPE = int;
enum : int
{
    WINML_RUNTIME_CNTK = 0x00000000,
}

enum IID_IWinMLRuntimeFactory = GUID(0xa807b84d, 0x4ae5, 0x4bc0, [0xa7, 0x6a, 0x94, 0x1a, 0xa2, 0x46, 0xbd, 0x41]);
interface IWinMLRuntimeFactory : IUnknown
{
    HRESULT CreateRuntime(WINML_RUNTIME_TYPE, IWinMLRuntime*);
}
enum MLOperatorAttributeType : uint
{
    Undefined   = 0x00000000,
    Float       = 0x00000002,
    Int         = 0x00000003,
    String      = 0x00000004,
    FloatArray  = 0x00000007,
    IntArray    = 0x00000008,
    StringArray = 0x00000009,
}

enum MLOperatorTensorDataType : uint
{
    Undefined  = 0x00000000,
    Float      = 0x00000001,
    UInt8      = 0x00000002,
    Int8       = 0x00000003,
    UInt16     = 0x00000004,
    Int16      = 0x00000005,
    Int32      = 0x00000006,
    Int64      = 0x00000007,
    String     = 0x00000008,
    Bool       = 0x00000009,
    Float16    = 0x0000000a,
    Double     = 0x0000000b,
    UInt32     = 0x0000000c,
    UInt64     = 0x0000000d,
    Complex64  = 0x0000000e,
    Complex128 = 0x0000000f,
}

enum MLOperatorEdgeType : uint
{
    Undefined = 0x00000000,
    Tensor    = 0x00000001,
}

struct MLOperatorEdgeDescription
{
    MLOperatorEdgeType edgeType;
    union
    {
        ulong reserved;
        MLOperatorTensorDataType tensorDataType;
    }
}
enum IID_IMLOperatorAttributes = GUID(0x4b1b1759, 0xec40, 0x466c, [0xaa, 0xb4, 0xbe, 0xb5, 0x34, 0x7f, 0xd2, 0x4c]);
interface IMLOperatorAttributes : IUnknown
{
    HRESULT GetAttributeElementCount(const(char)*, MLOperatorAttributeType, uint*);
    HRESULT GetAttribute(const(char)*, MLOperatorAttributeType, uint, ulong, void*);
    HRESULT GetStringAttributeElementLength(const(char)*, uint, uint*);
    HRESULT GetStringAttributeElement(const(char)*, uint, uint, PSTR);
}
enum IID_IMLOperatorTensorShapeDescription = GUID(0xf20e8cbe, 0x3b28, 0x4248, [0xbe, 0x95, 0xf9, 0x6f, 0xbc, 0x6e, 0x46, 0x43]);
interface IMLOperatorTensorShapeDescription : IUnknown
{
    HRESULT GetInputTensorDimensionCount(uint, uint*);
    HRESULT GetInputTensorShape(uint, uint, uint*);
    bool HasOutputShapeDescription();
    HRESULT GetOutputTensorDimensionCount(uint, uint*);
    HRESULT GetOutputTensorShape(uint, uint, uint*);
}
enum IID_IMLOperatorKernelCreationContext = GUID(0x5459b53d, 0xa0fc, 0x4665, [0xad, 0xdd, 0x70, 0x17, 0x1e, 0xf7, 0xe6, 0x31]);
interface IMLOperatorKernelCreationContext : IMLOperatorAttributes
{
    uint GetInputCount();
    uint GetOutputCount();
    bool IsInputValid(uint);
    bool IsOutputValid(uint);
    HRESULT GetInputEdgeDescription(uint, MLOperatorEdgeDescription*);
    HRESULT GetOutputEdgeDescription(uint, MLOperatorEdgeDescription*);
    bool HasTensorShapeDescription();
    HRESULT GetTensorShapeDescription(IMLOperatorTensorShapeDescription*);
    void GetExecutionInterface(IUnknown*);
}
enum IID_IMLOperatorTensor = GUID(0x7fe41f41, 0xf430, 0x440e, [0xae, 0xce, 0x54, 0x41, 0x6d, 0xc8, 0xb9, 0xdb]);
interface IMLOperatorTensor : IUnknown
{
    uint GetDimensionCount();
    HRESULT GetShape(uint, uint*);
    MLOperatorTensorDataType GetTensorDataType();
    bool IsCpuData();
    bool IsDataInterface();
    void* GetData();
    void GetDataInterface(IUnknown*);
}
enum IID_IMLOperatorKernelContext = GUID(0x82536a28, 0xf022, 0x4769, [0x9d, 0x3f, 0x8b, 0x27, 0x8f, 0x84, 0xc0, 0xc3]);
interface IMLOperatorKernelContext : IUnknown
{
    HRESULT GetInputTensor(uint, IMLOperatorTensor*);
    HRESULT GetOutputTensor(uint, uint, const(uint)*, IMLOperatorTensor*);
    HRESULT GetOutputTensor(uint, IMLOperatorTensor*);
    HRESULT AllocateTemporaryData(ulong, IUnknown*);
    void GetExecutionInterface(IUnknown*);
}
enum IID_IMLOperatorKernel = GUID(0x11c4b4a0, 0xb467, 0x4eaa, [0xa1, 0xa6, 0xb9, 0x61, 0xd8, 0xd0, 0xed, 0x79]);
interface IMLOperatorKernel : IUnknown
{
    HRESULT Compute(IMLOperatorKernelContext);
}
alias MLOperatorParameterOptions = uint;
enum : uint
{
    Single   = 0x00000000,
    Optional = 0x00000001,
    Variadic = 0x00000002,
}

alias MLOperatorSchemaEdgeTypeFormat = int;
enum : int
{
    EdgeDescription = 0x00000000,
    Label           = 0x00000001,
}

struct MLOperatorSchemaEdgeDescription
{
    MLOperatorParameterOptions options;
    MLOperatorSchemaEdgeTypeFormat typeFormat;
    union
    {
        const(void)* reserved;
        const(char)* typeLabel;
        MLOperatorEdgeDescription edgeDescription;
    }
}
struct MLOperatorEdgeTypeConstraint
{
    const(char)* typeLabel;
    const(MLOperatorEdgeDescription)* allowedTypes;
    uint allowedTypeCount;
}
enum IID_IMLOperatorShapeInferenceContext = GUID(0x105b6b29, 0x5408, 0x4a68, [0x99, 0x59, 0x9, 0xb5, 0x95, 0x5a, 0x34, 0x92]);
interface IMLOperatorShapeInferenceContext : IMLOperatorAttributes
{
    uint GetInputCount();
    uint GetOutputCount();
    bool IsInputValid(uint);
    bool IsOutputValid(uint);
    HRESULT GetInputEdgeDescription(uint, MLOperatorEdgeDescription*);
    HRESULT GetInputTensorDimensionCount(uint, uint*);
    HRESULT GetInputTensorShape(uint, uint, uint*);
    HRESULT SetOutputTensorShape(uint, uint, const(uint)*);
}
enum IID_IMLOperatorTypeInferenceContext = GUID(0xec893bb1, 0xf938, 0x427b, [0x84, 0x88, 0xc8, 0xdc, 0xf7, 0x75, 0xf1, 0x38]);
interface IMLOperatorTypeInferenceContext : IMLOperatorAttributes
{
    uint GetInputCount();
    uint GetOutputCount();
    bool IsInputValid(uint);
    bool IsOutputValid(uint);
    HRESULT GetInputEdgeDescription(uint, MLOperatorEdgeDescription*);
    HRESULT SetOutputEdgeDescription(uint, const(MLOperatorEdgeDescription)*);
}
enum IID_IMLOperatorTypeInferrer = GUID(0x781aeb48, 0x9bcb, 0x4797, [0xbf, 0x77, 0x8b, 0xf4, 0x55, 0x21, 0x7b, 0xeb]);
interface IMLOperatorTypeInferrer : IUnknown
{
    HRESULT InferOutputTypes(IMLOperatorTypeInferenceContext);
}
enum IID_IMLOperatorShapeInferrer = GUID(0x540be5be, 0xa6c9, 0x40ee, [0x83, 0xf6, 0xd2, 0xb8, 0xb4, 0xa, 0x77, 0x98]);
interface IMLOperatorShapeInferrer : IUnknown
{
    HRESULT InferOutputShapes(IMLOperatorShapeInferenceContext);
}
struct MLOperatorAttribute
{
    const(char)* name;
    MLOperatorAttributeType type;
    ubyte required;
}
struct MLOperatorAttributeNameValue
{
    const(char)* name;
    MLOperatorAttributeType type;
    uint valueCount;
    union
    {
        const(void)* reserved;
        const(long)* ints;
        const(byte)** strings;
        const(float)* floats;
    }
}
struct MLOperatorSchemaDescription
{
    const(char)* name;
    int operatorSetVersionAtLastChange;
    const(MLOperatorSchemaEdgeDescription)* inputs;
    uint inputCount;
    const(MLOperatorSchemaEdgeDescription)* outputs;
    uint outputCount;
    const(MLOperatorEdgeTypeConstraint)* typeConstraints;
    uint typeConstraintCount;
    const(MLOperatorAttribute)* attributes;
    uint attributeCount;
    const(MLOperatorAttributeNameValue)* defaultAttributes;
    uint defaultAttributeCount;
}
struct MLOperatorSetId
{
    const(char)* domain;
    int version_;
}
alias MLOperatorKernelOptions = uint;
enum : uint
{
    None                    = 0x00000000,
    AllowDynamicInputShapes = 0x00000001,
}

alias MLOperatorExecutionType = uint;
enum : uint
{
    Undefined = 0x00000000,
    Cpu       = 0x00000001,
    D3D12     = 0x00000002,
}

struct MLOperatorKernelDescription
{
    const(char)* domain;
    const(char)* name;
    int minimumOperatorSetVersion;
    MLOperatorExecutionType executionType;
    const(MLOperatorEdgeTypeConstraint)* typeConstraints;
    uint typeConstraintCount;
    const(MLOperatorAttributeNameValue)* defaultAttributes;
    uint defaultAttributeCount;
    MLOperatorKernelOptions options;
    uint executionOptions;
}
enum IID_IMLOperatorKernelFactory = GUID(0xef15ad6f, 0xdc9, 0x4908, [0xab, 0x35, 0xa5, 0x75, 0xa3, 0xd, 0xfb, 0xf8]);
interface IMLOperatorKernelFactory : IUnknown
{
    HRESULT CreateKernel(IMLOperatorKernelCreationContext, IMLOperatorKernel*);
}
enum IID_IMLOperatorRegistry = GUID(0x2af9dd2d, 0xb516, 0x4672, [0x9a, 0xb5, 0x53, 0xc, 0x20, 0x84, 0x93, 0xad]);
interface IMLOperatorRegistry : IUnknown
{
    HRESULT RegisterOperatorSetSchema(const(MLOperatorSetId)*, int, const(MLOperatorSchemaDescription)**, uint, IMLOperatorTypeInferrer, IMLOperatorShapeInferrer);
    HRESULT RegisterOperatorKernel(const(MLOperatorKernelDescription)*, IMLOperatorKernelFactory, IMLOperatorShapeInferrer);
}
