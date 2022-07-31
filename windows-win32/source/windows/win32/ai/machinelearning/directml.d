module windows.win32.ai.machinelearning.directml;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PSTR, PWSTR;
import windows.win32.graphics.direct3d12 : D3D12_CPU_DESCRIPTOR_HANDLE, D3D12_GPU_DESCRIPTOR_HANDLE, ID3D12CommandList, ID3D12Device, ID3D12Resource;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT DMLCreateDevice(ID3D12Device, DML_CREATE_DEVICE_FLAGS, const(GUID)*, void**);
HRESULT DMLCreateDevice1(ID3D12Device, DML_CREATE_DEVICE_FLAGS, DML_FEATURE_LEVEL, const(GUID)*, void**);
enum DML_TARGET_VERSION = 0x00004000;
enum DML_TENSOR_DIMENSION_COUNT_MAX = 0x00000005;
enum DML_TENSOR_DIMENSION_COUNT_MAX1 = 0x00000008;
enum DML_TEMPORARY_BUFFER_ALIGNMENT = 0x00000100;
enum DML_PERSISTENT_BUFFER_ALIGNMENT = 0x00000100;
enum DML_MINIMUM_BUFFER_TENSOR_ALIGNMENT = 0x00000010;
alias DML_TENSOR_DATA_TYPE = int;
enum : int
{
    DML_TENSOR_DATA_TYPE_UNKNOWN = 0x00000000,
    DML_TENSOR_DATA_TYPE_FLOAT32 = 0x00000001,
    DML_TENSOR_DATA_TYPE_FLOAT16 = 0x00000002,
    DML_TENSOR_DATA_TYPE_UINT32  = 0x00000003,
    DML_TENSOR_DATA_TYPE_UINT16  = 0x00000004,
    DML_TENSOR_DATA_TYPE_UINT8   = 0x00000005,
    DML_TENSOR_DATA_TYPE_INT32   = 0x00000006,
    DML_TENSOR_DATA_TYPE_INT16   = 0x00000007,
    DML_TENSOR_DATA_TYPE_INT8    = 0x00000008,
    DML_TENSOR_DATA_TYPE_FLOAT64 = 0x00000009,
    DML_TENSOR_DATA_TYPE_UINT64  = 0x0000000a,
    DML_TENSOR_DATA_TYPE_INT64   = 0x0000000b,
}

alias DML_TENSOR_TYPE = int;
enum : int
{
    DML_TENSOR_TYPE_INVALID = 0x00000000,
    DML_TENSOR_TYPE_BUFFER  = 0x00000001,
}

alias DML_TENSOR_FLAGS = uint;
enum : uint
{
    DML_TENSOR_FLAG_NONE         = 0x00000000,
    DML_TENSOR_FLAG_OWNED_BY_DML = 0x00000001,
}

struct DML_BUFFER_TENSOR_DESC
{
    DML_TENSOR_DATA_TYPE DataType;
    DML_TENSOR_FLAGS Flags;
    uint DimensionCount;
    const(uint)* Sizes;
    const(uint)* Strides;
    ulong TotalTensorSizeInBytes;
    uint GuaranteedBaseOffsetAlignment;
}
struct DML_TENSOR_DESC
{
    DML_TENSOR_TYPE Type;
    const(void)* Desc;
}
alias DML_OPERATOR_TYPE = int;
enum : int
{
    DML_OPERATOR_INVALID                                    = 0x00000000,
    DML_OPERATOR_ELEMENT_WISE_IDENTITY                      = 0x00000001,
    DML_OPERATOR_ELEMENT_WISE_ABS                           = 0x00000002,
    DML_OPERATOR_ELEMENT_WISE_ACOS                          = 0x00000003,
    DML_OPERATOR_ELEMENT_WISE_ADD                           = 0x00000004,
    DML_OPERATOR_ELEMENT_WISE_ASIN                          = 0x00000005,
    DML_OPERATOR_ELEMENT_WISE_ATAN                          = 0x00000006,
    DML_OPERATOR_ELEMENT_WISE_CEIL                          = 0x00000007,
    DML_OPERATOR_ELEMENT_WISE_CLIP                          = 0x00000008,
    DML_OPERATOR_ELEMENT_WISE_COS                           = 0x00000009,
    DML_OPERATOR_ELEMENT_WISE_DIVIDE                        = 0x0000000a,
    DML_OPERATOR_ELEMENT_WISE_EXP                           = 0x0000000b,
    DML_OPERATOR_ELEMENT_WISE_FLOOR                         = 0x0000000c,
    DML_OPERATOR_ELEMENT_WISE_LOG                           = 0x0000000d,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_AND                   = 0x0000000e,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_EQUALS                = 0x0000000f,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN          = 0x00000010,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN             = 0x00000011,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_NOT                   = 0x00000012,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_OR                    = 0x00000013,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_XOR                   = 0x00000014,
    DML_OPERATOR_ELEMENT_WISE_MAX                           = 0x00000015,
    DML_OPERATOR_ELEMENT_WISE_MEAN                          = 0x00000016,
    DML_OPERATOR_ELEMENT_WISE_MIN                           = 0x00000017,
    DML_OPERATOR_ELEMENT_WISE_MULTIPLY                      = 0x00000018,
    DML_OPERATOR_ELEMENT_WISE_POW                           = 0x00000019,
    DML_OPERATOR_ELEMENT_WISE_CONSTANT_POW                  = 0x0000001a,
    DML_OPERATOR_ELEMENT_WISE_RECIP                         = 0x0000001b,
    DML_OPERATOR_ELEMENT_WISE_SIN                           = 0x0000001c,
    DML_OPERATOR_ELEMENT_WISE_SQRT                          = 0x0000001d,
    DML_OPERATOR_ELEMENT_WISE_SUBTRACT                      = 0x0000001e,
    DML_OPERATOR_ELEMENT_WISE_TAN                           = 0x0000001f,
    DML_OPERATOR_ELEMENT_WISE_THRESHOLD                     = 0x00000020,
    DML_OPERATOR_ELEMENT_WISE_QUANTIZE_LINEAR               = 0x00000021,
    DML_OPERATOR_ELEMENT_WISE_DEQUANTIZE_LINEAR             = 0x00000022,
    DML_OPERATOR_ACTIVATION_ELU                             = 0x00000023,
    DML_OPERATOR_ACTIVATION_HARDMAX                         = 0x00000024,
    DML_OPERATOR_ACTIVATION_HARD_SIGMOID                    = 0x00000025,
    DML_OPERATOR_ACTIVATION_IDENTITY                        = 0x00000026,
    DML_OPERATOR_ACTIVATION_LEAKY_RELU                      = 0x00000027,
    DML_OPERATOR_ACTIVATION_LINEAR                          = 0x00000028,
    DML_OPERATOR_ACTIVATION_LOG_SOFTMAX                     = 0x00000029,
    DML_OPERATOR_ACTIVATION_PARAMETERIZED_RELU              = 0x0000002a,
    DML_OPERATOR_ACTIVATION_PARAMETRIC_SOFTPLUS             = 0x0000002b,
    DML_OPERATOR_ACTIVATION_RELU                            = 0x0000002c,
    DML_OPERATOR_ACTIVATION_SCALED_ELU                      = 0x0000002d,
    DML_OPERATOR_ACTIVATION_SCALED_TANH                     = 0x0000002e,
    DML_OPERATOR_ACTIVATION_SIGMOID                         = 0x0000002f,
    DML_OPERATOR_ACTIVATION_SOFTMAX                         = 0x00000030,
    DML_OPERATOR_ACTIVATION_SOFTPLUS                        = 0x00000031,
    DML_OPERATOR_ACTIVATION_SOFTSIGN                        = 0x00000032,
    DML_OPERATOR_ACTIVATION_TANH                            = 0x00000033,
    DML_OPERATOR_ACTIVATION_THRESHOLDED_RELU                = 0x00000034,
    DML_OPERATOR_CONVOLUTION                                = 0x00000035,
    DML_OPERATOR_GEMM                                       = 0x00000036,
    DML_OPERATOR_REDUCE                                     = 0x00000037,
    DML_OPERATOR_AVERAGE_POOLING                            = 0x00000038,
    DML_OPERATOR_LP_POOLING                                 = 0x00000039,
    DML_OPERATOR_MAX_POOLING                                = 0x0000003a,
    DML_OPERATOR_ROI_POOLING                                = 0x0000003b,
    DML_OPERATOR_SLICE                                      = 0x0000003c,
    DML_OPERATOR_CAST                                       = 0x0000003d,
    DML_OPERATOR_SPLIT                                      = 0x0000003e,
    DML_OPERATOR_JOIN                                       = 0x0000003f,
    DML_OPERATOR_PADDING                                    = 0x00000040,
    DML_OPERATOR_VALUE_SCALE_2D                             = 0x00000041,
    DML_OPERATOR_UPSAMPLE_2D                                = 0x00000042,
    DML_OPERATOR_GATHER                                     = 0x00000043,
    DML_OPERATOR_SPACE_TO_DEPTH                             = 0x00000044,
    DML_OPERATOR_DEPTH_TO_SPACE                             = 0x00000045,
    DML_OPERATOR_TILE                                       = 0x00000046,
    DML_OPERATOR_TOP_K                                      = 0x00000047,
    DML_OPERATOR_BATCH_NORMALIZATION                        = 0x00000048,
    DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION                = 0x00000049,
    DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION               = 0x0000004a,
    DML_OPERATOR_LP_NORMALIZATION                           = 0x0000004b,
    DML_OPERATOR_RNN                                        = 0x0000004c,
    DML_OPERATOR_LSTM                                       = 0x0000004d,
    DML_OPERATOR_GRU                                        = 0x0000004e,
    DML_OPERATOR_ELEMENT_WISE_SIGN                          = 0x0000004f,
    DML_OPERATOR_ELEMENT_WISE_IS_NAN                        = 0x00000050,
    DML_OPERATOR_ELEMENT_WISE_ERF                           = 0x00000051,
    DML_OPERATOR_ELEMENT_WISE_SINH                          = 0x00000052,
    DML_OPERATOR_ELEMENT_WISE_COSH                          = 0x00000053,
    DML_OPERATOR_ELEMENT_WISE_TANH                          = 0x00000054,
    DML_OPERATOR_ELEMENT_WISE_ASINH                         = 0x00000055,
    DML_OPERATOR_ELEMENT_WISE_ACOSH                         = 0x00000056,
    DML_OPERATOR_ELEMENT_WISE_ATANH                         = 0x00000057,
    DML_OPERATOR_ELEMENT_WISE_IF                            = 0x00000058,
    DML_OPERATOR_ELEMENT_WISE_ADD1                          = 0x00000059,
    DML_OPERATOR_ACTIVATION_SHRINK                          = 0x0000005a,
    DML_OPERATOR_MAX_POOLING1                               = 0x0000005b,
    DML_OPERATOR_MAX_UNPOOLING                              = 0x0000005c,
    DML_OPERATOR_DIAGONAL_MATRIX                            = 0x0000005d,
    DML_OPERATOR_SCATTER_ELEMENTS                           = 0x0000005e,
    DML_OPERATOR_SCATTER                                    = 0x0000005e,
    DML_OPERATOR_ONE_HOT                                    = 0x0000005f,
    DML_OPERATOR_RESAMPLE                                   = 0x00000060,
    DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_LEFT                = 0x00000061,
    DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_RIGHT               = 0x00000062,
    DML_OPERATOR_ELEMENT_WISE_ROUND                         = 0x00000063,
    DML_OPERATOR_ELEMENT_WISE_IS_INFINITY                   = 0x00000064,
    DML_OPERATOR_ELEMENT_WISE_MODULUS_TRUNCATE              = 0x00000065,
    DML_OPERATOR_ELEMENT_WISE_MODULUS_FLOOR                 = 0x00000066,
    DML_OPERATOR_FILL_VALUE_CONSTANT                        = 0x00000067,
    DML_OPERATOR_FILL_VALUE_SEQUENCE                        = 0x00000068,
    DML_OPERATOR_CUMULATIVE_SUMMATION                       = 0x00000069,
    DML_OPERATOR_REVERSE_SUBSEQUENCES                       = 0x0000006a,
    DML_OPERATOR_GATHER_ELEMENTS                            = 0x0000006b,
    DML_OPERATOR_GATHER_ND                                  = 0x0000006c,
    DML_OPERATOR_SCATTER_ND                                 = 0x0000006d,
    DML_OPERATOR_MAX_POOLING2                               = 0x0000006e,
    DML_OPERATOR_SLICE1                                     = 0x0000006f,
    DML_OPERATOR_TOP_K1                                     = 0x00000070,
    DML_OPERATOR_DEPTH_TO_SPACE1                            = 0x00000071,
    DML_OPERATOR_SPACE_TO_DEPTH1                            = 0x00000072,
    DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION1               = 0x00000073,
    DML_OPERATOR_RESAMPLE1                                  = 0x00000074,
    DML_OPERATOR_MATRIX_MULTIPLY_INTEGER                    = 0x00000075,
    DML_OPERATOR_QUANTIZED_LINEAR_MATRIX_MULTIPLY           = 0x00000076,
    DML_OPERATOR_CONVOLUTION_INTEGER                        = 0x00000077,
    DML_OPERATOR_QUANTIZED_LINEAR_CONVOLUTION               = 0x00000078,
    DML_OPERATOR_ELEMENT_WISE_BIT_AND                       = 0x00000079,
    DML_OPERATOR_ELEMENT_WISE_BIT_OR                        = 0x0000007a,
    DML_OPERATOR_ELEMENT_WISE_BIT_XOR                       = 0x0000007b,
    DML_OPERATOR_ELEMENT_WISE_BIT_NOT                       = 0x0000007c,
    DML_OPERATOR_ELEMENT_WISE_BIT_COUNT                     = 0x0000007d,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL = 0x0000007e,
    DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL    = 0x0000007f,
    DML_OPERATOR_ACTIVATION_CELU                            = 0x00000080,
    DML_OPERATOR_ACTIVATION_RELU_GRAD                       = 0x00000081,
    DML_OPERATOR_AVERAGE_POOLING_GRAD                       = 0x00000082,
    DML_OPERATOR_MAX_POOLING_GRAD                           = 0x00000083,
    DML_OPERATOR_RANDOM_GENERATOR                           = 0x00000084,
    DML_OPERATOR_NONZERO_COORDINATES                        = 0x00000085,
    DML_OPERATOR_RESAMPLE_GRAD                              = 0x00000086,
    DML_OPERATOR_SLICE_GRAD                                 = 0x00000087,
    DML_OPERATOR_ADAM_OPTIMIZER                             = 0x00000088,
    DML_OPERATOR_ARGMIN                                     = 0x00000089,
    DML_OPERATOR_ARGMAX                                     = 0x0000008a,
    DML_OPERATOR_ROI_ALIGN                                  = 0x0000008b,
    DML_OPERATOR_GATHER_ND1                                 = 0x0000008c,
    DML_OPERATOR_ELEMENT_WISE_ATAN_YX                       = 0x0000008d,
    DML_OPERATOR_ELEMENT_WISE_CLIP_GRAD                     = 0x0000008e,
    DML_OPERATOR_ELEMENT_WISE_DIFFERENCE_SQUARE             = 0x0000008f,
    DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION_GRAD          = 0x00000090,
    DML_OPERATOR_CUMULATIVE_PRODUCT                         = 0x00000091,
    DML_OPERATOR_BATCH_NORMALIZATION_GRAD                   = 0x00000092,
    DML_OPERATOR_ELEMENT_WISE_QUANTIZED_LINEAR_ADD          = 0x00000093,
    DML_OPERATOR_DYNAMIC_QUANTIZE_LINEAR                    = 0x00000094,
    DML_OPERATOR_ROI_ALIGN1                                 = 0x00000095,
}

alias DML_REDUCE_FUNCTION = int;
enum : int
{
    DML_REDUCE_FUNCTION_ARGMAX      = 0x00000000,
    DML_REDUCE_FUNCTION_ARGMIN      = 0x00000001,
    DML_REDUCE_FUNCTION_AVERAGE     = 0x00000002,
    DML_REDUCE_FUNCTION_L1          = 0x00000003,
    DML_REDUCE_FUNCTION_L2          = 0x00000004,
    DML_REDUCE_FUNCTION_LOG_SUM     = 0x00000005,
    DML_REDUCE_FUNCTION_LOG_SUM_EXP = 0x00000006,
    DML_REDUCE_FUNCTION_MAX         = 0x00000007,
    DML_REDUCE_FUNCTION_MIN         = 0x00000008,
    DML_REDUCE_FUNCTION_MULTIPLY    = 0x00000009,
    DML_REDUCE_FUNCTION_SUM         = 0x0000000a,
    DML_REDUCE_FUNCTION_SUM_SQUARE  = 0x0000000b,
}

alias DML_MATRIX_TRANSFORM = int;
enum : int
{
    DML_MATRIX_TRANSFORM_NONE      = 0x00000000,
    DML_MATRIX_TRANSFORM_TRANSPOSE = 0x00000001,
}

alias DML_CONVOLUTION_MODE = int;
enum : int
{
    DML_CONVOLUTION_MODE_CONVOLUTION       = 0x00000000,
    DML_CONVOLUTION_MODE_CROSS_CORRELATION = 0x00000001,
}

alias DML_CONVOLUTION_DIRECTION = int;
enum : int
{
    DML_CONVOLUTION_DIRECTION_FORWARD  = 0x00000000,
    DML_CONVOLUTION_DIRECTION_BACKWARD = 0x00000001,
}

alias DML_PADDING_MODE = int;
enum : int
{
    DML_PADDING_MODE_CONSTANT   = 0x00000000,
    DML_PADDING_MODE_EDGE       = 0x00000001,
    DML_PADDING_MODE_REFLECTION = 0x00000002,
    DML_PADDING_MODE_SYMMETRIC  = 0x00000003,
}

alias DML_INTERPOLATION_MODE = int;
enum : int
{
    DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0x00000000,
    DML_INTERPOLATION_MODE_LINEAR           = 0x00000001,
}

struct DML_SCALE_BIAS
{
    float Scale;
    float Bias;
}
struct DML_SIZE_2D
{
    uint Width;
    uint Height;
}
alias DML_RECURRENT_NETWORK_DIRECTION = int;
enum : int
{
    DML_RECURRENT_NETWORK_DIRECTION_FORWARD       = 0x00000000,
    DML_RECURRENT_NETWORK_DIRECTION_BACKWARD      = 0x00000001,
    DML_RECURRENT_NETWORK_DIRECTION_BIDIRECTIONAL = 0x00000002,
}

alias DML_ROUNDING_MODE = int;
enum : int
{
    DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN = 0x00000000,
    DML_ROUNDING_MODE_TOWARD_ZERO            = 0x00000001,
    DML_ROUNDING_MODE_TOWARD_INFINITY        = 0x00000002,
}

alias DML_IS_INFINITY_MODE = int;
enum : int
{
    DML_IS_INFINITY_MODE_EITHER   = 0x00000000,
    DML_IS_INFINITY_MODE_POSITIVE = 0x00000001,
    DML_IS_INFINITY_MODE_NEGATIVE = 0x00000002,
}

alias DML_AXIS_DIRECTION = int;
enum : int
{
    DML_AXIS_DIRECTION_INCREASING = 0x00000000,
    DML_AXIS_DIRECTION_DECREASING = 0x00000001,
}

alias DML_DEPTH_SPACE_ORDER = int;
enum : int
{
    DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW = 0x00000000,
    DML_DEPTH_SPACE_ORDER_COLUMN_ROW_DEPTH = 0x00000001,
}

union DML_SCALAR_UNION
{
    ubyte[8] Bytes;
    byte Int8;
    ubyte UInt8;
    short Int16;
    ushort UInt16;
    int Int32;
    uint UInt32;
    long Int64;
    ulong UInt64;
    float Float32;
    double Float64;
}
alias DML_RANDOM_GENERATOR_TYPE = int;
enum : int
{
    DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10 = 0x00000000,
}

struct DML_OPERATOR_DESC
{
    DML_OPERATOR_TYPE Type;
    const(void)* Desc;
}
struct DML_ELEMENT_WISE_IDENTITY_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ABS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ACOS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ADD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_ADD1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_OPERATOR_DESC)* FusedActivation;
}
struct DML_ELEMENT_WISE_ASIN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ATAN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_CEIL_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_CLIP_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
    float Min;
    float Max;
}
struct DML_ELEMENT_WISE_COS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_DIVIDE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_EXP_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_FLOOR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_LOG_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_LOGICAL_AND_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_EQUALS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_NOT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_OR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_XOR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_MAX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_MEAN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_MIN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_MULTIPLY_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_POW_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ExponentTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_CONSTANT_POW_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
    float Exponent;
}
struct DML_ELEMENT_WISE_RECIP_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_SIN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_SQRT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_SUBTRACT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_TAN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_THRESHOLD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
    float Min;
}
struct DML_ELEMENT_WISE_QUANTIZE_LINEAR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ScaleTensor;
    const(DML_TENSOR_DESC)* ZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_DEQUANTIZE_LINEAR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ScaleTensor;
    const(DML_TENSOR_DESC)* ZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_ELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
}
struct DML_ACTIVATION_HARDMAX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_HARD_SIGMOID_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
    float Beta;
}
struct DML_ACTIVATION_IDENTITY_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_LEAKY_RELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
}
struct DML_ACTIVATION_LINEAR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
    float Beta;
}
struct DML_ACTIVATION_LOG_SOFTMAX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_PARAMETERIZED_RELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* SlopeTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_PARAMETRIC_SOFTPLUS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
    float Beta;
}
struct DML_ACTIVATION_RELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_SCALED_ELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
    float Gamma;
}
struct DML_ACTIVATION_SCALED_TANH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
    float Beta;
}
struct DML_ACTIVATION_SIGMOID_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_SOFTMAX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_SOFTPLUS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Steepness;
}
struct DML_ACTIVATION_SOFTSIGN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_TANH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_THRESHOLDED_RELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
}
struct DML_CONVOLUTION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* FilterTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_CONVOLUTION_MODE Mode;
    DML_CONVOLUTION_DIRECTION Direction;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* Dilations;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    const(uint)* OutputPadding;
    uint GroupCount;
    const(DML_OPERATOR_DESC)* FusedActivation;
}
struct DML_GEMM_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* CTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_MATRIX_TRANSFORM TransA;
    DML_MATRIX_TRANSFORM TransB;
    float Alpha;
    float Beta;
    const(DML_OPERATOR_DESC)* FusedActivation;
}
struct DML_REDUCE_OPERATOR_DESC
{
    DML_REDUCE_FUNCTION Function;
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint AxisCount;
    const(uint)* Axes;
}
struct DML_AVERAGE_POOLING_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    BOOL IncludePadding;
}
struct DML_LP_POOLING_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    uint P;
}
struct DML_MAX_POOLING_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
}
struct DML_ROI_POOLING_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ROITensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float SpatialScale;
    DML_SIZE_2D PooledSize;
}
struct DML_SLICE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* Offsets;
    const(uint)* Sizes;
    const(uint)* Strides;
}
struct DML_CAST_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_SPLIT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    uint OutputCount;
    const(DML_TENSOR_DESC)* OutputTensors;
    uint Axis;
}
struct DML_JOIN_OPERATOR_DESC
{
    uint InputCount;
    const(DML_TENSOR_DESC)* InputTensors;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
}
struct DML_PADDING_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_PADDING_MODE PaddingMode;
    float PaddingValue;
    uint DimensionCount;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
}
struct DML_VALUE_SCALE_2D_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Scale;
    uint ChannelCount;
    const(float)* Bias;
}
struct DML_UPSAMPLE_2D_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_SIZE_2D ScaleSize;
    DML_INTERPOLATION_MODE InterpolationMode;
}
struct DML_GATHER_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
    uint IndexDimensions;
}
struct DML_SPACE_TO_DEPTH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint BlockSize;
}
struct DML_DEPTH_TO_SPACE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint BlockSize;
}
struct DML_TILE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint RepeatsCount;
    const(uint)* Repeats;
}
struct DML_TOP_K_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputValueTensor;
    const(DML_TENSOR_DESC)* OutputIndexTensor;
    uint Axis;
    uint K;
}
struct DML_BATCH_NORMALIZATION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* MeanTensor;
    const(DML_TENSOR_DESC)* VarianceTensor;
    const(DML_TENSOR_DESC)* ScaleTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    BOOL Spatial;
    float Epsilon;
    const(DML_OPERATOR_DESC)* FusedActivation;
}
struct DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ScaleTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    BOOL CrossChannel;
    BOOL NormalizeVariance;
    float Epsilon;
    const(DML_OPERATOR_DESC)* FusedActivation;
}
struct DML_LOCAL_RESPONSE_NORMALIZATION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    BOOL CrossChannel;
    uint LocalSize;
    float Alpha;
    float Beta;
    float Bias;
}
struct DML_LP_NORMALIZATION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
    float Epsilon;
    uint P;
}
struct DML_RNN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* WeightTensor;
    const(DML_TENSOR_DESC)* RecurrenceTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* HiddenInitTensor;
    const(DML_TENSOR_DESC)* SequenceLengthsTensor;
    const(DML_TENSOR_DESC)* OutputSequenceTensor;
    const(DML_TENSOR_DESC)* OutputSingleTensor;
    uint ActivationDescCount;
    const(DML_OPERATOR_DESC)* ActivationDescs;
    DML_RECURRENT_NETWORK_DIRECTION Direction;
}
struct DML_LSTM_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* WeightTensor;
    const(DML_TENSOR_DESC)* RecurrenceTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* HiddenInitTensor;
    const(DML_TENSOR_DESC)* CellMemInitTensor;
    const(DML_TENSOR_DESC)* SequenceLengthsTensor;
    const(DML_TENSOR_DESC)* PeepholeTensor;
    const(DML_TENSOR_DESC)* OutputSequenceTensor;
    const(DML_TENSOR_DESC)* OutputSingleTensor;
    const(DML_TENSOR_DESC)* OutputCellSingleTensor;
    uint ActivationDescCount;
    const(DML_OPERATOR_DESC)* ActivationDescs;
    DML_RECURRENT_NETWORK_DIRECTION Direction;
    float ClipThreshold;
    BOOL UseClipThreshold;
    BOOL CoupleInputForget;
}
struct DML_GRU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* WeightTensor;
    const(DML_TENSOR_DESC)* RecurrenceTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* HiddenInitTensor;
    const(DML_TENSOR_DESC)* SequenceLengthsTensor;
    const(DML_TENSOR_DESC)* OutputSequenceTensor;
    const(DML_TENSOR_DESC)* OutputSingleTensor;
    uint ActivationDescCount;
    const(DML_OPERATOR_DESC)* ActivationDescs;
    DML_RECURRENT_NETWORK_DIRECTION Direction;
    BOOL LinearBeforeReset;
}
struct DML_ELEMENT_WISE_SIGN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_IS_NAN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_ERF_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_SINH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_COSH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_TANH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ASINH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ACOSH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_ATANH_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_SCALE_BIAS)* ScaleBias;
}
struct DML_ELEMENT_WISE_IF_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ConditionTensor;
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_SHRINK_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Bias;
    float Threshold;
}
struct DML_MAX_POOLING1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_TENSOR_DESC)* OutputIndicesTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
}
struct DML_MAX_UNPOOLING_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_DIAGONAL_MATRIX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* OutputTensor;
    int Offset;
    float Value;
}
struct DML_SCATTER_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* UpdatesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
}
struct DML_ONE_HOT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* ValuesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
}
struct DML_RESAMPLE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_INTERPOLATION_MODE InterpolationMode;
    uint ScaleCount;
    const(float)* Scales;
}
struct DML_ELEMENT_WISE_BIT_SHIFT_LEFT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_BIT_SHIFT_RIGHT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_ROUND_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_ROUNDING_MODE RoundingMode;
}
struct DML_ELEMENT_WISE_IS_INFINITY_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_IS_INFINITY_MODE InfinityMode;
}
struct DML_ELEMENT_WISE_MODULUS_TRUNCATE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_MODULUS_FLOOR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_FILL_VALUE_CONSTANT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_TENSOR_DATA_TYPE ValueDataType;
    DML_SCALAR_UNION Value;
}
struct DML_FILL_VALUE_SEQUENCE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_TENSOR_DATA_TYPE ValueDataType;
    DML_SCALAR_UNION ValueStart;
    DML_SCALAR_UNION ValueDelta;
}
struct DML_CUMULATIVE_SUMMATION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
    DML_AXIS_DIRECTION AxisDirection;
    BOOL HasExclusiveSum;
}
struct DML_REVERSE_SUBSEQUENCES_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* SequenceLengthsTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
}
struct DML_GATHER_ELEMENTS_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
}
struct DML_GATHER_ND_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint InputDimensionCount;
    uint IndicesDimensionCount;
}
struct DML_SCATTER_ND_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* UpdatesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint InputDimensionCount;
    uint IndicesDimensionCount;
}
struct DML_MAX_POOLING2_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_TENSOR_DESC)* OutputIndicesTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    const(uint)* Dilations;
}
struct DML_SLICE1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* InputWindowOffsets;
    const(uint)* InputWindowSizes;
    const(int)* InputWindowStrides;
}
struct DML_TOP_K1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputValueTensor;
    const(DML_TENSOR_DESC)* OutputIndexTensor;
    uint Axis;
    uint K;
    DML_AXIS_DIRECTION AxisDirection;
}
struct DML_DEPTH_TO_SPACE1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint BlockSize;
    DML_DEPTH_SPACE_ORDER Order;
}
struct DML_SPACE_TO_DEPTH1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint BlockSize;
    DML_DEPTH_SPACE_ORDER Order;
}
struct DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ScaleTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint AxisCount;
    const(uint)* Axes;
    BOOL NormalizeVariance;
    float Epsilon;
    const(DML_OPERATOR_DESC)* FusedActivation;
}
struct DML_RESAMPLE1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_INTERPOLATION_MODE InterpolationMode;
    uint DimensionCount;
    const(float)* Scales;
    const(float)* InputPixelOffsets;
    const(float)* OutputPixelOffsets;
}
struct DML_MATRIX_MULTIPLY_INTEGER_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* AZeroPointTensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* BZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_QUANTIZED_LINEAR_MATRIX_MULTIPLY_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* AScaleTensor;
    const(DML_TENSOR_DESC)* AZeroPointTensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* BScaleTensor;
    const(DML_TENSOR_DESC)* BZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputScaleTensor;
    const(DML_TENSOR_DESC)* OutputZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_CONVOLUTION_INTEGER_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputZeroPointTensor;
    const(DML_TENSOR_DESC)* FilterTensor;
    const(DML_TENSOR_DESC)* FilterZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* Dilations;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    uint GroupCount;
}
struct DML_QUANTIZED_LINEAR_CONVOLUTION_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputScaleTensor;
    const(DML_TENSOR_DESC)* InputZeroPointTensor;
    const(DML_TENSOR_DESC)* FilterTensor;
    const(DML_TENSOR_DESC)* FilterScaleTensor;
    const(DML_TENSOR_DESC)* FilterZeroPointTensor;
    const(DML_TENSOR_DESC)* BiasTensor;
    const(DML_TENSOR_DESC)* OutputScaleTensor;
    const(DML_TENSOR_DESC)* OutputZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* Dilations;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    uint GroupCount;
}
struct DML_ELEMENT_WISE_BIT_AND_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_BIT_OR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_BIT_XOR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_BIT_NOT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_BIT_COUNT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ACTIVATION_CELU_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    float Alpha;
}
struct DML_ACTIVATION_RELU_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
}
struct DML_AVERAGE_POOLING_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    BOOL IncludePadding;
}
struct DML_MAX_POOLING_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    uint DimensionCount;
    const(uint)* Strides;
    const(uint)* WindowSize;
    const(uint)* StartPadding;
    const(uint)* EndPadding;
    const(uint)* Dilations;
}
struct DML_RANDOM_GENERATOR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputStateTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_TENSOR_DESC)* OutputStateTensor;
    DML_RANDOM_GENERATOR_TYPE Type;
}
struct DML_NONZERO_COORDINATES_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputCountTensor;
    const(DML_TENSOR_DESC)* OutputCoordinatesTensor;
}
struct DML_RESAMPLE_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    DML_INTERPOLATION_MODE InterpolationMode;
    uint DimensionCount;
    const(float)* Scales;
    const(float)* InputPixelOffsets;
    const(float)* OutputPixelOffsets;
}
struct DML_SLICE_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    uint DimensionCount;
    const(uint)* InputWindowOffsets;
    const(uint)* InputWindowSizes;
    const(int)* InputWindowStrides;
}
struct DML_ADAM_OPTIMIZER_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputParametersTensor;
    const(DML_TENSOR_DESC)* InputFirstMomentTensor;
    const(DML_TENSOR_DESC)* InputSecondMomentTensor;
    const(DML_TENSOR_DESC)* GradientTensor;
    const(DML_TENSOR_DESC)* TrainingStepTensor;
    const(DML_TENSOR_DESC)* OutputParametersTensor;
    const(DML_TENSOR_DESC)* OutputFirstMomentTensor;
    const(DML_TENSOR_DESC)* OutputSecondMomentTensor;
    float LearningRate;
    float Beta1;
    float Beta2;
    float Epsilon;
}
struct DML_ARGMIN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint AxisCount;
    const(uint)* Axes;
    DML_AXIS_DIRECTION AxisDirection;
}
struct DML_ARGMAX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint AxisCount;
    const(uint)* Axes;
    DML_AXIS_DIRECTION AxisDirection;
}
struct DML_ROI_ALIGN_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ROITensor;
    const(DML_TENSOR_DESC)* BatchIndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_REDUCE_FUNCTION ReductionFunction;
    DML_INTERPOLATION_MODE InterpolationMode;
    float SpatialScaleX;
    float SpatialScaleY;
    float OutOfBoundsInputValue;
    uint MinimumSamplesPerOutput;
    uint MaximumSamplesPerOutput;
}
struct DML_GATHER_ND1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* IndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint InputDimensionCount;
    uint IndicesDimensionCount;
    uint BatchDimensionCount;
}
struct DML_ELEMENT_WISE_ATAN_YX_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_ELEMENT_WISE_CLIP_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    float Min;
    float Max;
}
struct DML_ELEMENT_WISE_DIFFERENCE_SQUARE_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    BOOL CrossChannel;
    uint LocalSize;
    float Alpha;
    float Beta;
    float Bias;
}
struct DML_CUMULATIVE_PRODUCT_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    uint Axis;
    DML_AXIS_DIRECTION AxisDirection;
    BOOL HasExclusiveProduct;
}
struct DML_BATCH_NORMALIZATION_GRAD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* InputGradientTensor;
    const(DML_TENSOR_DESC)* MeanTensor;
    const(DML_TENSOR_DESC)* VarianceTensor;
    const(DML_TENSOR_DESC)* ScaleTensor;
    const(DML_TENSOR_DESC)* OutputGradientTensor;
    const(DML_TENSOR_DESC)* OutputScaleGradientTensor;
    const(DML_TENSOR_DESC)* OutputBiasGradientTensor;
    float Epsilon;
}
struct DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* ATensor;
    const(DML_TENSOR_DESC)* AScaleTensor;
    const(DML_TENSOR_DESC)* AZeroPointTensor;
    const(DML_TENSOR_DESC)* BTensor;
    const(DML_TENSOR_DESC)* BScaleTensor;
    const(DML_TENSOR_DESC)* BZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputScaleTensor;
    const(DML_TENSOR_DESC)* OutputZeroPointTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
}
struct DML_DYNAMIC_QUANTIZE_LINEAR_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    const(DML_TENSOR_DESC)* OutputScaleTensor;
    const(DML_TENSOR_DESC)* OutputZeroPointTensor;
}
struct DML_ROI_ALIGN1_OPERATOR_DESC
{
    const(DML_TENSOR_DESC)* InputTensor;
    const(DML_TENSOR_DESC)* ROITensor;
    const(DML_TENSOR_DESC)* BatchIndicesTensor;
    const(DML_TENSOR_DESC)* OutputTensor;
    DML_REDUCE_FUNCTION ReductionFunction;
    DML_INTERPOLATION_MODE InterpolationMode;
    float SpatialScaleX;
    float SpatialScaleY;
    float InputPixelOffset;
    float OutputPixelOffset;
    float OutOfBoundsInputValue;
    uint MinimumSamplesPerOutput;
    uint MaximumSamplesPerOutput;
    BOOL AlignRegionsToCorners;
}
alias DML_FEATURE_LEVEL = int;
enum : int
{
    DML_FEATURE_LEVEL_1_0 = 0x00001000,
    DML_FEATURE_LEVEL_2_0 = 0x00002000,
    DML_FEATURE_LEVEL_2_1 = 0x00002100,
    DML_FEATURE_LEVEL_3_0 = 0x00003000,
    DML_FEATURE_LEVEL_3_1 = 0x00003100,
    DML_FEATURE_LEVEL_4_0 = 0x00004000,
}

alias DML_FEATURE = int;
enum : int
{
    DML_FEATURE_TENSOR_DATA_TYPE_SUPPORT = 0x00000000,
    DML_FEATURE_FEATURE_LEVELS           = 0x00000001,
}

struct DML_FEATURE_QUERY_TENSOR_DATA_TYPE_SUPPORT
{
    DML_TENSOR_DATA_TYPE DataType;
}
struct DML_FEATURE_DATA_TENSOR_DATA_TYPE_SUPPORT
{
    BOOL IsSupported;
}
struct DML_FEATURE_QUERY_FEATURE_LEVELS
{
    uint RequestedFeatureLevelCount;
    const(DML_FEATURE_LEVEL)* RequestedFeatureLevels;
}
struct DML_FEATURE_DATA_FEATURE_LEVELS
{
    DML_FEATURE_LEVEL MaxSupportedFeatureLevel;
}
struct DML_BINDING_TABLE_DESC
{
    IDMLDispatchable Dispatchable;
    D3D12_CPU_DESCRIPTOR_HANDLE CPUDescriptorHandle;
    D3D12_GPU_DESCRIPTOR_HANDLE GPUDescriptorHandle;
    uint SizeInDescriptors;
}
alias DML_EXECUTION_FLAGS = uint;
enum : uint
{
    DML_EXECUTION_FLAG_NONE                             = 0x00000000,
    DML_EXECUTION_FLAG_ALLOW_HALF_PRECISION_COMPUTATION = 0x00000001,
    DML_EXECUTION_FLAG_DISABLE_META_COMMANDS            = 0x00000002,
    DML_EXECUTION_FLAG_DESCRIPTORS_VOLATILE             = 0x00000004,
}

alias DML_CREATE_DEVICE_FLAGS = uint;
enum : uint
{
    DML_CREATE_DEVICE_FLAG_NONE  = 0x00000000,
    DML_CREATE_DEVICE_FLAG_DEBUG = 0x00000001,
}

enum IID_IDMLObject = GUID(0xc8263aac, 0x9e0c, 0x4a2d, [0x9b, 0x8e, 0x0, 0x75, 0x21, 0xa3, 0x31, 0x7c]);
interface IDMLObject : IUnknown
{
    HRESULT GetPrivateData(const(GUID)*, uint*, void*);
    HRESULT SetPrivateData(const(GUID)*, uint, const(void)*);
    HRESULT SetPrivateDataInterface(const(GUID)*, IUnknown);
    HRESULT SetName(const(wchar)*);
}
enum IID_IDMLDevice = GUID(0x6dbd6437, 0x96fd, 0x423f, [0xa9, 0x8c, 0xae, 0x5e, 0x7c, 0x2a, 0x57, 0x3f]);
interface IDMLDevice : IDMLObject
{
    HRESULT CheckFeatureSupport(DML_FEATURE, uint, const(void)*, uint, void*);
    HRESULT CreateOperator(const(DML_OPERATOR_DESC)*, const(GUID)*, void**);
    HRESULT CompileOperator(IDMLOperator, DML_EXECUTION_FLAGS, const(GUID)*, void**);
    HRESULT CreateOperatorInitializer(uint, IDMLCompiledOperator*, const(GUID)*, void**);
    HRESULT CreateCommandRecorder(const(GUID)*, void**);
    HRESULT CreateBindingTable(const(DML_BINDING_TABLE_DESC)*, const(GUID)*, void**);
    HRESULT Evict(uint, IDMLPageable*);
    HRESULT MakeResident(uint, IDMLPageable*);
    HRESULT GetDeviceRemovedReason();
    HRESULT GetParentDevice(const(GUID)*, void**);
}
enum IID_IDMLDeviceChild = GUID(0x27e83142, 0x8165, 0x49e3, [0x97, 0x4e, 0x2f, 0xd6, 0x6e, 0x4c, 0xb6, 0x9d]);
interface IDMLDeviceChild : IDMLObject
{
    HRESULT GetDevice(const(GUID)*, void**);
}
enum IID_IDMLPageable = GUID(0xb1ab0825, 0x4542, 0x4a4b, [0x86, 0x17, 0x6d, 0xde, 0x6e, 0x8f, 0x62, 0x1]);
interface IDMLPageable : IDMLDeviceChild
{
}
enum IID_IDMLOperator = GUID(0x26caae7a, 0x3081, 0x4633, [0x95, 0x81, 0x22, 0x6f, 0xbe, 0x57, 0x69, 0x5d]);
interface IDMLOperator : IDMLDeviceChild
{
}
struct DML_BINDING_PROPERTIES
{
    uint RequiredDescriptorCount;
    ulong TemporaryResourceSize;
    ulong PersistentResourceSize;
}
enum IID_IDMLDispatchable = GUID(0xdcb821a8, 0x1039, 0x441e, [0x9f, 0x1c, 0xb1, 0x75, 0x9c, 0x2f, 0x3c, 0xec]);
interface IDMLDispatchable : IDMLPageable
{
    DML_BINDING_PROPERTIES GetBindingProperties();
}
enum IID_IDMLCompiledOperator = GUID(0x6b15e56a, 0xbf5c, 0x4902, [0x92, 0xd8, 0xda, 0x3a, 0x65, 0xa, 0xfe, 0xa4]);
interface IDMLCompiledOperator : IDMLDispatchable
{
}
enum IID_IDMLOperatorInitializer = GUID(0x427c1113, 0x435c, 0x469c, [0x86, 0x76, 0x4d, 0x5d, 0xd0, 0x72, 0xf8, 0x13]);
interface IDMLOperatorInitializer : IDMLDispatchable
{
    HRESULT Reset(uint, IDMLCompiledOperator*);
}
alias DML_BINDING_TYPE = int;
enum : int
{
    DML_BINDING_TYPE_NONE         = 0x00000000,
    DML_BINDING_TYPE_BUFFER       = 0x00000001,
    DML_BINDING_TYPE_BUFFER_ARRAY = 0x00000002,
}

struct DML_BINDING_DESC
{
    DML_BINDING_TYPE Type;
    const(void)* Desc;
}
struct DML_BUFFER_BINDING
{
    ID3D12Resource Buffer;
    ulong Offset;
    ulong SizeInBytes;
}
struct DML_BUFFER_ARRAY_BINDING
{
    uint BindingCount;
    const(DML_BUFFER_BINDING)* Bindings;
}
enum IID_IDMLBindingTable = GUID(0x29c687dc, 0xde74, 0x4e3b, [0xab, 0x0, 0x11, 0x68, 0xf2, 0xfc, 0x3c, 0xfc]);
interface IDMLBindingTable : IDMLDeviceChild
{
    void BindInputs(uint, const(DML_BINDING_DESC)*);
    void BindOutputs(uint, const(DML_BINDING_DESC)*);
    void BindTemporaryResource(const(DML_BINDING_DESC)*);
    void BindPersistentResource(const(DML_BINDING_DESC)*);
    HRESULT Reset(const(DML_BINDING_TABLE_DESC)*);
}
enum IID_IDMLCommandRecorder = GUID(0xe6857a76, 0x2e3e, 0x4fdd, [0xbf, 0xf4, 0x5d, 0x2b, 0xa1, 0xf, 0xb4, 0x53]);
interface IDMLCommandRecorder : IDMLDeviceChild
{
    void RecordDispatch(ID3D12CommandList, IDMLDispatchable, IDMLBindingTable);
}
enum IID_IDMLDebugDevice = GUID(0x7d6f3ac9, 0x394a, 0x4ac3, [0x92, 0xa7, 0x39, 0xc, 0xc5, 0x7a, 0x82, 0x17]);
interface IDMLDebugDevice : IUnknown
{
    void SetMuteDebugOutput(BOOL);
}
alias DML_GRAPH_EDGE_TYPE = int;
enum : int
{
    DML_GRAPH_EDGE_TYPE_INVALID      = 0x00000000,
    DML_GRAPH_EDGE_TYPE_INPUT        = 0x00000001,
    DML_GRAPH_EDGE_TYPE_OUTPUT       = 0x00000002,
    DML_GRAPH_EDGE_TYPE_INTERMEDIATE = 0x00000003,
}

struct DML_GRAPH_EDGE_DESC
{
    DML_GRAPH_EDGE_TYPE Type;
    const(void)* Desc;
}
struct DML_INPUT_GRAPH_EDGE_DESC
{
    uint GraphInputIndex;
    uint ToNodeIndex;
    uint ToNodeInputIndex;
    const(char)* Name;
}
struct DML_OUTPUT_GRAPH_EDGE_DESC
{
    uint FromNodeIndex;
    uint FromNodeOutputIndex;
    uint GraphOutputIndex;
    const(char)* Name;
}
struct DML_INTERMEDIATE_GRAPH_EDGE_DESC
{
    uint FromNodeIndex;
    uint FromNodeOutputIndex;
    uint ToNodeIndex;
    uint ToNodeInputIndex;
    const(char)* Name;
}
alias DML_GRAPH_NODE_TYPE = int;
enum : int
{
    DML_GRAPH_NODE_TYPE_INVALID  = 0x00000000,
    DML_GRAPH_NODE_TYPE_OPERATOR = 0x00000001,
}

struct DML_GRAPH_NODE_DESC
{
    DML_GRAPH_NODE_TYPE Type;
    const(void)* Desc;
}
struct DML_OPERATOR_GRAPH_NODE_DESC
{
    IDMLOperator Operator;
    const(char)* Name;
}
struct DML_GRAPH_DESC
{
    uint InputCount;
    uint OutputCount;
    uint NodeCount;
    const(DML_GRAPH_NODE_DESC)* Nodes;
    uint InputEdgeCount;
    const(DML_GRAPH_EDGE_DESC)* InputEdges;
    uint OutputEdgeCount;
    const(DML_GRAPH_EDGE_DESC)* OutputEdges;
    uint IntermediateEdgeCount;
    const(DML_GRAPH_EDGE_DESC)* IntermediateEdges;
}
enum IID_IDMLDevice1 = GUID(0xa0884f9a, 0xd2be, 0x4355, [0xaa, 0x5d, 0x59, 0x1, 0x28, 0x1a, 0xd1, 0xd2]);
interface IDMLDevice1 : IDMLDevice
{
    HRESULT CompileGraph(const(DML_GRAPH_DESC)*, DML_EXECUTION_FLAGS, const(GUID)*, void**);
}
