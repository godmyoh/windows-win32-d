module windows.win32.storage.nvme;

import windows.win32.guid : GUID;
import windows.win32.foundation : CHAR;

version (Windows):
extern (Windows):

enum NVME_IDENTIFY_CNS_DESCRIPTOR_NAMESPACE_SIZE = 0x00001000;
enum GUID_OCP_DEVICE_SMART_INFORMATIONGuid = GUID(0x2810afc5, 0xbfea, 0xa4f2, [0x9c, 0x4f, 0x6f, 0x7c, 0xc9, 0x14, 0xd5, 0xaf]);
enum GUID_OCP_DEVICE_SMART_INFORMATION = GUID(0x2810afc5, 0xbfea, 0xa4f2, [0x9c, 0x4f, 0x6f, 0x7c, 0xc9, 0x14, 0xd5, 0xaf]);
enum GUID_WCS_DEVICE_SMART_ATTRIBUTESGuid = GUID(0x2810afc5, 0xbfea, 0xa4f2, [0x9c, 0x4f, 0x6f, 0x7c, 0xc9, 0x14, 0xd5, 0xaf]);
enum GUID_WCS_DEVICE_SMART_ATTRIBUTES = GUID(0x2810afc5, 0xbfea, 0xa4f2, [0x9c, 0x4f, 0x6f, 0x7c, 0xc9, 0x14, 0xd5, 0xaf]);
enum GUID_OCP_DEVICE_ERROR_RECOVERYGuid = GUID(0x2131d944, 0x30fe, 0xae34, [0xab, 0x4d, 0xfd, 0x3d, 0xba, 0x83, 0x19, 0x5a]);
enum GUID_OCP_DEVICE_ERROR_RECOVERY = GUID(0x2131d944, 0x30fe, 0xae34, [0xab, 0x4d, 0xfd, 0x3d, 0xba, 0x83, 0x19, 0x5a]);
enum GUID_WCS_DEVICE_ERROR_RECOVERYGuid = GUID(0x2131d944, 0x30fe, 0xae34, [0xab, 0x4d, 0xfd, 0x3d, 0xba, 0x83, 0x19, 0x5a]);
enum GUID_WCS_DEVICE_ERROR_RECOVERY = GUID(0x2131d944, 0x30fe, 0xae34, [0xab, 0x4d, 0xfd, 0x3d, 0xba, 0x83, 0x19, 0x5a]);
enum GUID_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORYGuid = GUID(0x769a796d, 0xdab4, 0xa3f6, [0xe2, 0x4d, 0xb2, 0x8a, 0xac, 0xf3, 0x1c, 0xd1]);
enum GUID_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY = GUID(0x769a796d, 0xdab4, 0xa3f6, [0xe2, 0x4d, 0xb2, 0x8a, 0xac, 0xf3, 0x1c, 0xd1]);
enum GUID_OCP_DEVICE_LATENCY_MONITORGuid = GUID(0x8cc07a92, 0x84d0, 0x9c6c, [0x70, 0x43, 0xe6, 0xd4, 0x58, 0x5e, 0xd4, 0x85]);
enum GUID_OCP_DEVICE_LATENCY_MONITOR = GUID(0x8cc07a92, 0x84d0, 0x9c6c, [0x70, 0x43, 0xe6, 0xd4, 0x58, 0x5e, 0xd4, 0x85]);
enum GUID_OCP_DEVICE_DEVICE_CAPABILITIESGuid = GUID(0xd054297, 0xe1d1, 0x98c9, [0x5d, 0x49, 0x58, 0x4b, 0x91, 0x3c, 0x5, 0xb7]);
enum GUID_OCP_DEVICE_DEVICE_CAPABILITIES = GUID(0xd054297, 0xe1d1, 0x98c9, [0x5d, 0x49, 0x58, 0x4b, 0x91, 0x3c, 0x5, 0xb7]);
enum GUID_OCP_DEVICE_UNSUPPORTED_REQUIREMENTSGuid = GUID(0xe9c722f, 0x2399, 0xbb2c, [0x63, 0x48, 0x32, 0xd0, 0xb7, 0x98, 0xbb, 0xc7]);
enum GUID_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS = GUID(0xe9c722f, 0x2399, 0xbb2c, [0x63, 0x48, 0x32, 0xd0, 0xb7, 0x98, 0xbb, 0xc7]);
enum GUID_OCP_DEVICE_TCG_CONFIGURATIONGuid = GUID(0xbd244006, 0xe07e, 0x83e6, [0xc0, 0x47, 0x54, 0xfa, 0x9d, 0x2a, 0xe0, 0x54]);
enum GUID_OCP_DEVICE_TCG_CONFIGURATION = GUID(0xbd244006, 0xe07e, 0x83e6, [0xc0, 0x47, 0x54, 0xfa, 0x9d, 0x2a, 0xe0, 0x54]);
enum GUID_OCP_DEVICE_TCG_HISTORYGuid = GUID(0x704b513e, 0x9c6, 0x9490, [0x27, 0x4e, 0xd0, 0x96, 0x96, 0x90, 0xd7, 0x88]);
enum GUID_OCP_DEVICE_TCG_HISTORY = GUID(0x704b513e, 0x9c6, 0x9490, [0x27, 0x4e, 0xd0, 0x96, 0x96, 0x90, 0xd7, 0x88]);
enum GUID_MFND_CHILD_CONTROLLER_EVENT_LOG_PAGEGuid = GUID(0x98bcce18, 0xa5f0, 0xbf35, [0xa5, 0x44, 0xd9, 0x7f, 0x25, 0x9d, 0x66, 0x9c]);
enum GUID_MFND_CHILD_CONTROLLER_EVENT_LOG_PAGE = GUID(0x98bcce18, 0xa5f0, 0xbf35, [0xa5, 0x44, 0xd9, 0x7f, 0x25, 0x9d, 0x66, 0x9c]);
enum NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_VERSION_2 = 0x00000002;
enum NVME_OCP_DEVICE_SMART_INFORMATION_LOG_VERSION_3 = 0x00000003;
enum NVME_WCS_DEVICE_ERROR_RECOVERY_LOG_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_ERROR_RECOVERY_LOG_VERSION_2 = 0x00000002;
enum FIRMWARE_ACTIVATION_HISTORY_ENTRY_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY_LOG_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_LATENCY_MONITOR_LOG_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_CAPABILITIES_LOG_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS_LOG_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_TCG_CONFIGURATION_LOG_VERSION_1 = 0x00000001;
enum TCG_HISTORY_ENTRY_VERSION_1 = 0x00000001;
enum NVME_OCP_DEVICE_TCG_HISTORY_LOG_VERSION_1 = 0x00000001;
enum NVME_MAX_HOST_IDENTIFIER_SIZE = 0x00000010;
enum NVME_HOST_IDENTIFIER_SIZE = 0x00000008;
enum NVME_EXTENDED_HOST_IDENTIFIER_SIZE = 0x00000010;
enum NVME_MAX_LOG_SIZE = 0x00001000;
enum NVME_TELEMETRY_DATA_BLOCK_SIZE = 0x00000200;
enum NVME_STREAMS_ID_MIN = 0x00000001;
enum NVME_STREAMS_ID_MAX = 0x0000ffff;
enum NVME_STREAMS_GET_STATUS_MAX_IDS = 0x0000ffff;
enum NVME_NAMESPACE_ALL = 0xffffffff;
alias NVME_AMS_OPTION = int;
enum : int
{
    NVME_AMS_ROUND_ROBIN                 = 0x00000000,
    NVME_AMS_WEIGHTED_ROUND_ROBIN_URGENT = 0x00000001,
}

union NVME_CONTROLLER_CAPABILITIES
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUlonglong;
}
union NVME_VERSION
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_CC_SHN_SHUTDOWN_NOTIFICATIONS = int;
enum : int
{
    NVME_CC_SHN_NO_NOTIFICATION = 0x00000000,
    NVME_CC_SHN_NORMAL_SHUTDOWN = 0x00000001,
    NVME_CC_SHN_ABRUPT_SHUTDOWN = 0x00000002,
}

alias NVME_CSS_COMMAND_SETS = int;
enum : int
{
    NVME_CSS_NVM_COMMAND_SET              = 0x00000000,
    NVME_CSS_ALL_SUPPORTED_IO_COMMAND_SET = 0x00000006,
    NVME_CSS_ADMIN_COMMAND_SET_ONLY       = 0x00000007,
}

union NVME_CONTROLLER_CONFIGURATION
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_CSTS_SHST_SHUTDOWN_STATUS = int;
enum : int
{
    NVME_CSTS_SHST_NO_SHUTDOWN         = 0x00000000,
    NVME_CSTS_SHST_SHUTDOWN_IN_PROCESS = 0x00000001,
    NVME_CSTS_SHST_SHUTDOWN_COMPLETED  = 0x00000002,
}

union NVME_CONTROLLER_STATUS
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_NVM_SUBSYSTEM_RESET
{
    uint NSSRC;
}
union NVME_ADMIN_QUEUE_ATTRIBUTES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_ADMIN_SUBMISSION_QUEUE_BASE_ADDRESS
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUlonglong;
}
union NVME_ADMIN_COMPLETION_QUEUE_BASE_ADDRESS
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUlonglong;
}
union NVME_CONTROLLER_MEMORY_BUFFER_LOCATION
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_CMBSZ_SIZE_UNITS = int;
enum : int
{
    NVME_CMBSZ_SIZE_UNITS_4KB   = 0x00000000,
    NVME_CMBSZ_SIZE_UNITS_64KB  = 0x00000001,
    NVME_CMBSZ_SIZE_UNITS_1MB   = 0x00000002,
    NVME_CMBSZ_SIZE_UNITS_16MB  = 0x00000003,
    NVME_CMBSZ_SIZE_UNITS_256MB = 0x00000004,
    NVME_CMBSZ_SIZE_UNITS_4GB   = 0x00000005,
    NVME_CMBSZ_SIZE_UNITS_64GB  = 0x00000006,
}

union NVME_CONTROLLER_MEMORY_BUFFER_SIZE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_SUBMISSION_QUEUE_TAIL_DOORBELL
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_COMPLETION_QUEUE_HEAD_DOORBELL
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_CONTROLLER_REGISTERS
{
    NVME_CONTROLLER_CAPABILITIES CAP;
    NVME_VERSION VS;
    uint INTMS;
    uint INTMC;
    NVME_CONTROLLER_CONFIGURATION CC;
    uint Reserved0;
    NVME_CONTROLLER_STATUS CSTS;
    NVME_NVM_SUBSYSTEM_RESET NSSR;
    NVME_ADMIN_QUEUE_ATTRIBUTES AQA;
    NVME_ADMIN_SUBMISSION_QUEUE_BASE_ADDRESS ASQ;
    NVME_ADMIN_COMPLETION_QUEUE_BASE_ADDRESS ACQ;
    NVME_CONTROLLER_MEMORY_BUFFER_LOCATION CMBLOC;
    NVME_CONTROLLER_MEMORY_BUFFER_SIZE CMBSZ;
    uint[944] Reserved2;
    uint[64] Reserved3;
    uint[1] Doorbells;
}
union NVME_COMMAND_STATUS
{
    struct
    {
        ushort _bitfield0;
    }
    ushort AsUshort;
}
struct NVME_COMPLETION_ENTRY
{
    uint DW0;
    uint DW1;
    union _DW2_e__Union
    {
        struct
        {
            ushort SQHD;
            ushort SQID;
        }
        uint AsUlong;
    }
    union _DW3_e__Union
    {
        struct
        {
            ushort CID;
            NVME_COMMAND_STATUS Status;
        }
        uint AsUlong;
    }
}
alias NVME_ASYNC_EVENT_TYPES = int;
enum : int
{
    NVME_ASYNC_EVENT_TYPE_ERROR_STATUS          = 0x00000000,
    NVME_ASYNC_EVENT_TYPE_HEALTH_STATUS         = 0x00000001,
    NVME_ASYNC_EVENT_TYPE_NOTICE                = 0x00000002,
    NVME_ASYNC_EVENT_TYPE_IO_COMMAND_SET_STATUS = 0x00000006,
    NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC       = 0x00000007,
}

alias NVME_ASYNC_EVENT_ERROR_STATUS_CODES = int;
enum : int
{
    NVME_ASYNC_ERROR_INVALID_SUBMISSION_QUEUE         = 0x00000000,
    NVME_ASYNC_ERROR_INVALID_DOORBELL_WRITE_VALUE     = 0x00000001,
    NVME_ASYNC_ERROR_DIAG_FAILURE                     = 0x00000002,
    NVME_ASYNC_ERROR_PERSISTENT_INTERNAL_DEVICE_ERROR = 0x00000003,
    NVME_ASYNC_ERROR_TRANSIENT_INTERNAL_DEVICE_ERROR  = 0x00000004,
    NVME_ASYNC_ERROR_FIRMWARE_IMAGE_LOAD_ERROR        = 0x00000005,
}

alias NVME_ASYNC_EVENT_HEALTH_STATUS_CODES = int;
enum : int
{
    NVME_ASYNC_HEALTH_NVM_SUBSYSTEM_RELIABILITY = 0x00000000,
    NVME_ASYNC_HEALTH_TEMPERATURE_THRESHOLD     = 0x00000001,
    NVME_ASYNC_HEALTH_SPARE_BELOW_THRESHOLD     = 0x00000002,
}

alias NVME_ASYNC_EVENT_NOTICE_CODES = int;
enum : int
{
    NVME_ASYNC_NOTICE_NAMESPACE_ATTRIBUTE_CHANGED                    = 0x00000000,
    NVME_ASYNC_NOTICE_FIRMWARE_ACTIVATION_STARTING                   = 0x00000001,
    NVME_ASYNC_NOTICE_TELEMETRY_LOG_CHANGED                          = 0x00000002,
    NVME_ASYNC_NOTICE_ASYMMETRIC_ACCESS_CHANGE                       = 0x00000003,
    NVME_ASYNC_NOTICE_PREDICTABLE_LATENCY_EVENT_AGGREGATE_LOG_CHANGE = 0x00000004,
    NVME_ASYNC_NOTICE_LBA_STATUS_INFORMATION_ALERT                   = 0x00000005,
    NVME_ASYNC_NOTICE_ENDURANCE_GROUP_EVENT_AGGREGATE_LOG_CHANGE     = 0x00000006,
    NVME_ASYNC_NOTICE_ZONE_DESCRIPTOR_CHANGED                        = 0x000000ef,
}

alias NVME_ASYNC_EVENT_IO_COMMAND_SET_STATUS_CODES = int;
enum : int
{
    NVME_ASYNC_IO_CMD_SET_RESERVATION_LOG_PAGE_AVAILABLE                        = 0x00000000,
    NVME_ASYNC_IO_CMD_SANITIZE_OPERATION_COMPLETED                              = 0x00000001,
    NVME_ASYNC_IO_CMD_SANITIZE_OPERATION_COMPLETED_WITH_UNEXPECTED_DEALLOCATION = 0x00000002,
}

struct NVME_COMPLETION_DW0_ASYNC_EVENT_REQUEST
{
    uint _bitfield0;
}
alias NVME_STATUS_TYPES = int;
enum : int
{
    NVME_STATUS_TYPE_GENERIC_COMMAND  = 0x00000000,
    NVME_STATUS_TYPE_COMMAND_SPECIFIC = 0x00000001,
    NVME_STATUS_TYPE_MEDIA_ERROR      = 0x00000002,
    NVME_STATUS_TYPE_VENDOR_SPECIFIC  = 0x00000007,
}

alias NVME_STATUS_GENERIC_COMMAND_CODES = int;
enum : int
{
    NVME_STATUS_SUCCESS_COMPLETION                             = 0x00000000,
    NVME_STATUS_INVALID_COMMAND_OPCODE                         = 0x00000001,
    NVME_STATUS_INVALID_FIELD_IN_COMMAND                       = 0x00000002,
    NVME_STATUS_COMMAND_ID_CONFLICT                            = 0x00000003,
    NVME_STATUS_DATA_TRANSFER_ERROR                            = 0x00000004,
    NVME_STATUS_COMMAND_ABORTED_DUE_TO_POWER_LOSS_NOTIFICATION = 0x00000005,
    NVME_STATUS_INTERNAL_DEVICE_ERROR                          = 0x00000006,
    NVME_STATUS_COMMAND_ABORT_REQUESTED                        = 0x00000007,
    NVME_STATUS_COMMAND_ABORTED_DUE_TO_SQ_DELETION             = 0x00000008,
    NVME_STATUS_COMMAND_ABORTED_DUE_TO_FAILED_FUSED_COMMAND    = 0x00000009,
    NVME_STATUS_COMMAND_ABORTED_DUE_TO_FAILED_MISSING_COMMAND  = 0x0000000a,
    NVME_STATUS_INVALID_NAMESPACE_OR_FORMAT                    = 0x0000000b,
    NVME_STATUS_COMMAND_SEQUENCE_ERROR                         = 0x0000000c,
    NVME_STATUS_INVALID_SGL_LAST_SEGMENT_DESCR                 = 0x0000000d,
    NVME_STATUS_INVALID_NUMBER_OF_SGL_DESCR                    = 0x0000000e,
    NVME_STATUS_DATA_SGL_LENGTH_INVALID                        = 0x0000000f,
    NVME_STATUS_METADATA_SGL_LENGTH_INVALID                    = 0x00000010,
    NVME_STATUS_SGL_DESCR_TYPE_INVALID                         = 0x00000011,
    NVME_STATUS_INVALID_USE_OF_CONTROLLER_MEMORY_BUFFER        = 0x00000012,
    NVME_STATUS_PRP_OFFSET_INVALID                             = 0x00000013,
    NVME_STATUS_ATOMIC_WRITE_UNIT_EXCEEDED                     = 0x00000014,
    NVME_STATUS_OPERATION_DENIED                               = 0x00000015,
    NVME_STATUS_SGL_OFFSET_INVALID                             = 0x00000016,
    NVME_STATUS_RESERVED                                       = 0x00000017,
    NVME_STATUS_HOST_IDENTIFIER_INCONSISTENT_FORMAT            = 0x00000018,
    NVME_STATUS_KEEP_ALIVE_TIMEOUT_EXPIRED                     = 0x00000019,
    NVME_STATUS_KEEP_ALIVE_TIMEOUT_INVALID                     = 0x0000001a,
    NVME_STATUS_COMMAND_ABORTED_DUE_TO_PREEMPT_ABORT           = 0x0000001b,
    NVME_STATUS_SANITIZE_FAILED                                = 0x0000001c,
    NVME_STATUS_SANITIZE_IN_PROGRESS                           = 0x0000001d,
    NVME_STATUS_SGL_DATA_BLOCK_GRANULARITY_INVALID             = 0x0000001e,
    NVME_STATUS_DIRECTIVE_TYPE_INVALID                         = 0x00000070,
    NVME_STATUS_DIRECTIVE_ID_INVALID                           = 0x00000071,
    NVME_STATUS_NVM_LBA_OUT_OF_RANGE                           = 0x00000080,
    NVME_STATUS_NVM_CAPACITY_EXCEEDED                          = 0x00000081,
    NVME_STATUS_NVM_NAMESPACE_NOT_READY                        = 0x00000082,
    NVME_STATUS_NVM_RESERVATION_CONFLICT                       = 0x00000083,
    NVME_STATUS_FORMAT_IN_PROGRESS                             = 0x00000084,
}

alias NVME_STATUS_COMMAND_SPECIFIC_CODES = int;
enum : int
{
    NVME_STATUS_COMPLETION_QUEUE_INVALID                         = 0x00000000,
    NVME_STATUS_INVALID_QUEUE_IDENTIFIER                         = 0x00000001,
    NVME_STATUS_MAX_QUEUE_SIZE_EXCEEDED                          = 0x00000002,
    NVME_STATUS_ABORT_COMMAND_LIMIT_EXCEEDED                     = 0x00000003,
    NVME_STATUS_ASYNC_EVENT_REQUEST_LIMIT_EXCEEDED               = 0x00000005,
    NVME_STATUS_INVALID_FIRMWARE_SLOT                            = 0x00000006,
    NVME_STATUS_INVALID_FIRMWARE_IMAGE                           = 0x00000007,
    NVME_STATUS_INVALID_INTERRUPT_VECTOR                         = 0x00000008,
    NVME_STATUS_INVALID_LOG_PAGE                                 = 0x00000009,
    NVME_STATUS_INVALID_FORMAT                                   = 0x0000000a,
    NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_CONVENTIONAL_RESET  = 0x0000000b,
    NVME_STATUS_INVALID_QUEUE_DELETION                           = 0x0000000c,
    NVME_STATUS_FEATURE_ID_NOT_SAVEABLE                          = 0x0000000d,
    NVME_STATUS_FEATURE_NOT_CHANGEABLE                           = 0x0000000e,
    NVME_STATUS_FEATURE_NOT_NAMESPACE_SPECIFIC                   = 0x0000000f,
    NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_NVM_SUBSYSTEM_RESET = 0x00000010,
    NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_RESET               = 0x00000011,
    NVME_STATUS_FIRMWARE_ACTIVATION_REQUIRES_MAX_TIME_VIOLATION  = 0x00000012,
    NVME_STATUS_FIRMWARE_ACTIVATION_PROHIBITED                   = 0x00000013,
    NVME_STATUS_OVERLAPPING_RANGE                                = 0x00000014,
    NVME_STATUS_NAMESPACE_INSUFFICIENT_CAPACITY                  = 0x00000015,
    NVME_STATUS_NAMESPACE_IDENTIFIER_UNAVAILABLE                 = 0x00000016,
    NVME_STATUS_NAMESPACE_ALREADY_ATTACHED                       = 0x00000018,
    NVME_STATUS_NAMESPACE_IS_PRIVATE                             = 0x00000019,
    NVME_STATUS_NAMESPACE_NOT_ATTACHED                           = 0x0000001a,
    NVME_STATUS_NAMESPACE_THIN_PROVISIONING_NOT_SUPPORTED        = 0x0000001b,
    NVME_STATUS_CONTROLLER_LIST_INVALID                          = 0x0000001c,
    NVME_STATUS_DEVICE_SELF_TEST_IN_PROGRESS                     = 0x0000001d,
    NVME_STATUS_BOOT_PARTITION_WRITE_PROHIBITED                  = 0x0000001e,
    NVME_STATUS_INVALID_CONTROLLER_IDENTIFIER                    = 0x0000001f,
    NVME_STATUS_INVALID_SECONDARY_CONTROLLER_STATE               = 0x00000020,
    NVME_STATUS_INVALID_NUMBER_OF_CONTROLLER_RESOURCES           = 0x00000021,
    NVME_STATUS_INVALID_RESOURCE_IDENTIFIER                      = 0x00000022,
    NVME_STATUS_SANITIZE_PROHIBITED_ON_PERSISTENT_MEMORY         = 0x00000023,
    NVME_STATUS_INVALID_ANA_GROUP_IDENTIFIER                     = 0x00000024,
    NVME_STATUS_ANA_ATTACH_FAILED                                = 0x00000025,
    NVME_IO_COMMAND_SET_NOT_SUPPORTED                            = 0x00000029,
    NVME_IO_COMMAND_SET_NOT_ENABLED                              = 0x0000002a,
    NVME_IO_COMMAND_SET_COMBINATION_REJECTED                     = 0x0000002b,
    NVME_IO_COMMAND_SET_INVALID                                  = 0x0000002c,
    NVME_STATUS_STREAM_RESOURCE_ALLOCATION_FAILED                = 0x0000007f,
    NVME_STATUS_ZONE_INVALID_FORMAT                              = 0x0000007f,
    NVME_STATUS_NVM_CONFLICTING_ATTRIBUTES                       = 0x00000080,
    NVME_STATUS_NVM_INVALID_PROTECTION_INFORMATION               = 0x00000081,
    NVME_STATUS_NVM_ATTEMPTED_WRITE_TO_READ_ONLY_RANGE           = 0x00000082,
    NVME_STATUS_NVM_COMMAND_SIZE_LIMIT_EXCEEDED                  = 0x00000083,
    NVME_STATUS_ZONE_BOUNDARY_ERROR                              = 0x000000b8,
    NVME_STATUS_ZONE_FULL                                        = 0x000000b9,
    NVME_STATUS_ZONE_READ_ONLY                                   = 0x000000ba,
    NVME_STATUS_ZONE_OFFLINE                                     = 0x000000bb,
    NVME_STATUS_ZONE_INVALID_WRITE                               = 0x000000bc,
    NVME_STATUS_ZONE_TOO_MANY_ACTIVE                             = 0x000000bd,
    NVME_STATUS_ZONE_TOO_MANY_OPEN                               = 0x000000be,
    NVME_STATUS_ZONE_INVALID_STATE_TRANSITION                    = 0x000000bf,
}

alias NVME_STATUS_MEDIA_ERROR_CODES = int;
enum : int
{
    NVME_STATUS_NVM_WRITE_FAULT                            = 0x00000080,
    NVME_STATUS_NVM_UNRECOVERED_READ_ERROR                 = 0x00000081,
    NVME_STATUS_NVM_END_TO_END_GUARD_CHECK_ERROR           = 0x00000082,
    NVME_STATUS_NVM_END_TO_END_APPLICATION_TAG_CHECK_ERROR = 0x00000083,
    NVME_STATUS_NVM_END_TO_END_REFERENCE_TAG_CHECK_ERROR   = 0x00000084,
    NVME_STATUS_NVM_COMPARE_FAILURE                        = 0x00000085,
    NVME_STATUS_NVM_ACCESS_DENIED                          = 0x00000086,
    NVME_STATUS_NVM_DEALLOCATED_OR_UNWRITTEN_LOGICAL_BLOCK = 0x00000087,
}

alias NVME_ADMIN_COMMANDS = int;
enum : int
{
    NVME_ADMIN_COMMAND_DELETE_IO_SQ              = 0x00000000,
    NVME_ADMIN_COMMAND_CREATE_IO_SQ              = 0x00000001,
    NVME_ADMIN_COMMAND_GET_LOG_PAGE              = 0x00000002,
    NVME_ADMIN_COMMAND_DELETE_IO_CQ              = 0x00000004,
    NVME_ADMIN_COMMAND_CREATE_IO_CQ              = 0x00000005,
    NVME_ADMIN_COMMAND_IDENTIFY                  = 0x00000006,
    NVME_ADMIN_COMMAND_ABORT                     = 0x00000008,
    NVME_ADMIN_COMMAND_SET_FEATURES              = 0x00000009,
    NVME_ADMIN_COMMAND_GET_FEATURES              = 0x0000000a,
    NVME_ADMIN_COMMAND_ASYNC_EVENT_REQUEST       = 0x0000000c,
    NVME_ADMIN_COMMAND_NAMESPACE_MANAGEMENT      = 0x0000000d,
    NVME_ADMIN_COMMAND_FIRMWARE_ACTIVATE         = 0x00000010,
    NVME_ADMIN_COMMAND_FIRMWARE_COMMIT           = 0x00000010,
    NVME_ADMIN_COMMAND_FIRMWARE_IMAGE_DOWNLOAD   = 0x00000011,
    NVME_ADMIN_COMMAND_DEVICE_SELF_TEST          = 0x00000014,
    NVME_ADMIN_COMMAND_NAMESPACE_ATTACHMENT      = 0x00000015,
    NVME_ADMIN_COMMAND_DIRECTIVE_SEND            = 0x00000019,
    NVME_ADMIN_COMMAND_DIRECTIVE_RECEIVE         = 0x0000001a,
    NVME_ADMIN_COMMAND_VIRTUALIZATION_MANAGEMENT = 0x0000001c,
    NVME_ADMIN_COMMAND_NVME_MI_SEND              = 0x0000001d,
    NVME_ADMIN_COMMAND_NVME_MI_RECEIVE           = 0x0000001e,
    NVME_ADMIN_COMMAND_DOORBELL_BUFFER_CONFIG    = 0x0000007c,
    NVME_ADMIN_COMMAND_FORMAT_NVM                = 0x00000080,
    NVME_ADMIN_COMMAND_SECURITY_SEND             = 0x00000081,
    NVME_ADMIN_COMMAND_SECURITY_RECEIVE          = 0x00000082,
    NVME_ADMIN_COMMAND_SANITIZE                  = 0x00000084,
    NVME_ADMIN_COMMAND_GET_LBA_STATUS            = 0x00000086,
}

alias NVME_FEATURES = int;
enum : int
{
    NVME_FEATURE_ARBITRATION                            = 0x00000001,
    NVME_FEATURE_POWER_MANAGEMENT                       = 0x00000002,
    NVME_FEATURE_LBA_RANGE_TYPE                         = 0x00000003,
    NVME_FEATURE_TEMPERATURE_THRESHOLD                  = 0x00000004,
    NVME_FEATURE_ERROR_RECOVERY                         = 0x00000005,
    NVME_FEATURE_VOLATILE_WRITE_CACHE                   = 0x00000006,
    NVME_FEATURE_NUMBER_OF_QUEUES                       = 0x00000007,
    NVME_FEATURE_INTERRUPT_COALESCING                   = 0x00000008,
    NVME_FEATURE_INTERRUPT_VECTOR_CONFIG                = 0x00000009,
    NVME_FEATURE_WRITE_ATOMICITY                        = 0x0000000a,
    NVME_FEATURE_ASYNC_EVENT_CONFIG                     = 0x0000000b,
    NVME_FEATURE_AUTONOMOUS_POWER_STATE_TRANSITION      = 0x0000000c,
    NVME_FEATURE_HOST_MEMORY_BUFFER                     = 0x0000000d,
    NVME_FEATURE_TIMESTAMP                              = 0x0000000e,
    NVME_FEATURE_KEEP_ALIVE                             = 0x0000000f,
    NVME_FEATURE_HOST_CONTROLLED_THERMAL_MANAGEMENT     = 0x00000010,
    NVME_FEATURE_NONOPERATIONAL_POWER_STATE             = 0x00000011,
    NVME_FEATURE_READ_RECOVERY_LEVEL_CONFIG             = 0x00000012,
    NVME_FEATURE_PREDICTABLE_LATENCY_MODE_CONFIG        = 0x00000013,
    NVME_FEATURE_PREDICTABLE_LATENCY_MODE_WINDOW        = 0x00000014,
    NVME_FEATURE_LBA_STATUS_INFORMATION_REPORT_INTERVAL = 0x00000015,
    NVME_FEATURE_HOST_BEHAVIOR_SUPPORT                  = 0x00000016,
    NVME_FEATURE_SANITIZE_CONFIG                        = 0x00000017,
    NVME_FEATURE_ENDURANCE_GROUP_EVENT_CONFIG           = 0x00000018,
    NVME_FEATURE_IO_COMMAND_SET_PROFILE                 = 0x00000019,
    NVME_FEATURE_ENHANCED_CONTROLLER_METADATA           = 0x0000007d,
    NVME_FEATURE_CONTROLLER_METADATA                    = 0x0000007e,
    NVME_FEATURE_NAMESPACE_METADATA                     = 0x0000007f,
    NVME_FEATURE_NVM_SOFTWARE_PROGRESS_MARKER           = 0x00000080,
    NVME_FEATURE_NVM_HOST_IDENTIFIER                    = 0x00000081,
    NVME_FEATURE_NVM_RESERVATION_NOTIFICATION_MASK      = 0x00000082,
    NVME_FEATURE_NVM_RESERVATION_PERSISTANCE            = 0x00000083,
    NVME_FEATURE_NVM_NAMESPACE_WRITE_PROTECTION_CONFIG  = 0x00000084,
    NVME_FEATURE_ERROR_INJECTION                        = 0x000000c0,
    NVME_FEATURE_CLEAR_FW_UPDATE_HISTORY                = 0x000000c1,
    NVME_FEATURE_READONLY_WRITETHROUGH_MODE             = 0x000000c2,
    NVME_FEATURE_CLEAR_PCIE_CORRECTABLE_ERROR_COUNTERS  = 0x000000c3,
    NVME_FEATURE_ENABLE_IEEE1667_SILO                   = 0x000000c4,
    NVME_FEATURE_PLP_HEALTH_MONITOR                     = 0x000000c5,
}

union NVME_CDW10_ABORT
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_IDENTIFY_CNS_CODES = int;
enum : int
{
    NVME_IDENTIFY_CNS_SPECIFIC_NAMESPACE                     = 0x00000000,
    NVME_IDENTIFY_CNS_CONTROLLER                             = 0x00000001,
    NVME_IDENTIFY_CNS_ACTIVE_NAMESPACES                      = 0x00000002,
    NVME_IDENTIFY_CNS_DESCRIPTOR_NAMESPACE                   = 0x00000003,
    NVME_IDENTIFY_CNS_NVM_SET                                = 0x00000004,
    NVME_IDENTIFY_CNS_SPECIFIC_NAMESPACE_IO_COMMAND_SET      = 0x00000005,
    NVME_IDENTIFY_CNS_SPECIFIC_CONTROLLER_IO_COMMAND_SET     = 0x00000006,
    NVME_IDENTIFY_CNS_ACTIVE_NAMESPACE_LIST_IO_COMMAND_SET   = 0x00000007,
    NVME_IDENTIFY_CNS_ALLOCATED_NAMESPACE_LIST               = 0x00000010,
    NVME_IDENTIFY_CNS_ALLOCATED_NAMESPACE                    = 0x00000011,
    NVME_IDENTIFY_CNS_CONTROLLER_LIST_OF_NSID                = 0x00000012,
    NVME_IDENTIFY_CNS_CONTROLLER_LIST_OF_NVM_SUBSYSTEM       = 0x00000013,
    NVME_IDENTIFY_CNS_PRIMARY_CONTROLLER_CAPABILITIES        = 0x00000014,
    NVME_IDENTIFY_CNS_SECONDARY_CONTROLLER_LIST              = 0x00000015,
    NVME_IDENTIFY_CNS_NAMESPACE_GRANULARITY_LIST             = 0x00000016,
    NVME_IDENTIFY_CNS_UUID_LIST                              = 0x00000017,
    NVME_IDENTIFY_CNS_DOMAIN_LIST                            = 0x00000018,
    NVME_IDENTIFY_CNS_ENDURANCE_GROUP_LIST                   = 0x00000019,
    NVME_IDENTIFY_CNS_ALLOCATED_NAMSPACE_LIST_IO_COMMAND_SET = 0x0000001a,
    NVME_IDENTIFY_CNS_ALLOCATED_NAMESPACE_IO_COMMAND_SET     = 0x0000001b,
    NVME_IDENTIFY_CNS_IO_COMMAND_SET                         = 0x0000001c,
}

alias NVME_COMMAND_SET_IDENTIFIERS = int;
enum : int
{
    NVME_COMMAND_SET_NVM             = 0x00000000,
    NVME_COMMAND_SET_KEY_VALUE       = 0x00000001,
    NVME_COMMAND_SET_ZONED_NAMESPACE = 0x00000002,
}

union NVME_CDW10_IDENTIFY
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_IDENTIFY
{
    struct
    {
        ushort NVMSETID;
        ushort Reserved;
    }
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_LBA_FORMAT
{
    struct
    {
        ushort MS;
        ubyte LBADS;
        ubyte _bitfield0;
    }
    uint AsUlong;
}
union NVM_RESERVATION_CAPABILITIES
{
    struct
    {
        ubyte _bitfield0;
    }
    ubyte AsUchar;
}
struct NVME_IDENTIFY_NAMESPACE_DATA
{
    ulong NSZE;
    ulong NCAP;
    ulong NUSE;
    struct _NSFEAT_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte NLBAF;
    struct _FLBAS_e__Struct
    {
        ubyte _bitfield1;
    }
    struct _MC_e__Struct
    {
        ubyte _bitfield2;
    }
    struct _DPC_e__Struct
    {
        ubyte _bitfield3;
    }
    struct _DPS_e__Struct
    {
        ubyte _bitfield4;
    }
    struct _NMIC_e__Struct
    {
        ubyte _bitfield5;
    }
    NVM_RESERVATION_CAPABILITIES RESCAP;
    struct _FPI_e__Struct
    {
        ubyte _bitfield6;
    }
    struct _DLFEAT_e__Struct
    {
        ubyte _bitfield7;
    }
    ushort NAWUN;
    ushort NAWUPF;
    ushort NACWU;
    ushort NABSN;
    ushort NABO;
    ushort NABSPF;
    ushort NOIOB;
    ubyte[16] NVMCAP;
    ushort NPWG;
    ushort NPWA;
    ushort NPDG;
    ushort NPDA;
    ushort NOWS;
    ushort MSSRL;
    uint MCL;
    ubyte MSRC;
    ubyte[11] Reserved2;
    uint ANAGRPID;
    ubyte[3] Reserved3;
    struct _NSATTR_e__Struct
    {
        ubyte _bitfield8;
    }
    ushort NVMSETID;
    ushort ENDGID;
    ubyte[16] NGUID;
    ubyte[8] EUI64;
    NVME_LBA_FORMAT[16] LBAF;
    ubyte[192] Reserved4;
    ubyte[3712] VS;
}
struct NVME_POWER_STATE_DESC
{
    ushort MP;
    ubyte Reserved0;
    ubyte _bitfield1;
    uint ENLAT;
    uint EXLAT;
    ubyte _bitfield2;
    ubyte _bitfield3;
    ubyte _bitfield4;
    ubyte _bitfield5;
    ushort IDLP;
    ubyte _bitfield6;
    ubyte Reserved7;
    ushort ACTP;
    ubyte _bitfield7;
    ubyte[9] Reserved9;
}
struct NVME_IDENTIFY_CONTROLLER_DATA
{
    ushort VID;
    ushort SSVID;
    ubyte[20] SN;
    ubyte[40] MN;
    ubyte[8] FR;
    ubyte RAB;
    ubyte[3] IEEE;
    struct _CMIC_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte MDTS;
    ushort CNTLID;
    uint VER;
    uint RTD3R;
    uint RTD3E;
    struct _OAES_e__Struct
    {
        uint _bitfield1;
    }
    struct _CTRATT_e__Struct
    {
        uint _bitfield2;
    }
    struct _RRLS_e__Struct
    {
        ushort _bitfield3;
    }
    ubyte[9] Reserved0;
    ubyte CNTRLTYPE;
    ubyte[16] FGUID;
    ushort CRDT1;
    ushort CRDT2;
    ushort CRDT3;
    ubyte[106] Reserved0_1;
    ubyte[16] ReservedForManagement;
    struct _OACS_e__Struct
    {
        ushort _bitfield4;
    }
    ubyte ACL;
    ubyte AERL;
    struct _FRMW_e__Struct
    {
        ubyte _bitfield5;
    }
    struct _LPA_e__Struct
    {
        ubyte _bitfield6;
    }
    ubyte ELPE;
    ubyte NPSS;
    struct _AVSCC_e__Struct
    {
        ubyte _bitfield7;
    }
    struct _APSTA_e__Struct
    {
        ubyte _bitfield8;
    }
    ushort WCTEMP;
    ushort CCTEMP;
    ushort MTFA;
    uint HMPRE;
    uint HMMIN;
    ubyte[16] TNVMCAP;
    ubyte[16] UNVMCAP;
    struct _RPMBS_e__Struct
    {
        uint _bitfield9;
    }
    ushort EDSTT;
    ubyte DSTO;
    ubyte FWUG;
    ushort KAS;
    struct _HCTMA_e__Struct
    {
        ushort _bitfield10;
    }
    ushort MNTMT;
    ushort MXTMT;
    struct _SANICAP_e__Struct
    {
        uint _bitfield11;
    }
    uint HMMINDS;
    ushort HMMAXD;
    ushort NSETIDMAX;
    ushort ENDGIDMAX;
    ubyte ANATT;
    struct _ANACAP_e__Struct
    {
        ubyte _bitfield12;
    }
    uint ANAGRPMAX;
    uint NANAGRPID;
    uint PELS;
    ubyte[156] Reserved1;
    struct _SQES_e__Struct
    {
        ubyte _bitfield13;
    }
    struct _CQES_e__Struct
    {
        ubyte _bitfield14;
    }
    ushort MAXCMD;
    uint NN;
    struct _ONCS_e__Struct
    {
        ushort _bitfield15;
    }
    struct _FUSES_e__Struct
    {
        ushort _bitfield16;
    }
    struct _FNA_e__Struct
    {
        ubyte _bitfield17;
    }
    struct _VWC_e__Struct
    {
        ubyte _bitfield18;
    }
    ushort AWUN;
    ushort AWUPF;
    struct _NVSCC_e__Struct
    {
        ubyte _bitfield19;
    }
    struct _NWPC_e__Struct
    {
        ubyte _bitfield20;
    }
    ushort ACWU;
    ubyte[2] Reserved4;
    struct _SGLS_e__Struct
    {
        uint _bitfield21;
    }
    uint MNAN;
    ubyte[224] Reserved6;
    ubyte[256] SUBNQN;
    ubyte[768] Reserved7;
    ubyte[256] Reserved8;
    NVME_POWER_STATE_DESC[32] PDS;
    ubyte[1024] VS;
}
alias NVME_IDENTIFIER_TYPE = int;
enum : int
{
    NVME_IDENTIFIER_TYPE_EUI64 = 0x00000001,
    NVME_IDENTIFIER_TYPE_NGUID = 0x00000002,
    NVME_IDENTIFIER_TYPE_UUID  = 0x00000003,
    NVME_IDENTIFIER_TYPE_CSI   = 0x00000004,
}

alias NVME_IDENTIFIER_TYPE_LENGTH = int;
enum : int
{
    NVME_IDENTIFIER_TYPE_EUI64_LENGTH = 0x00000008,
    NVME_IDENTIFIER_TYPE_NGUID_LENGTH = 0x00000010,
    NVME_IDENTIFIER_TYPE_UUID_LENGTH  = 0x00000010,
    NVME_IDENTIFIER_TYPE_CSI_LENGTH   = 0x00000001,
}

struct NVME_ACTIVE_NAMESPACE_ID_LIST
{
    uint[1024] NSID;
}
struct NVME_IDENTIFY_NAMESPACE_DESCRIPTOR
{
    ubyte NIDT;
    ubyte NIDL;
    ubyte[2] Reserved;
    ubyte[1] NID;
}
struct NVME_SET_ATTRIBUTES_ENTRY
{
    ushort Identifier;
    ushort ENDGID;
    uint Reserved1;
    uint Random4KBReadTypical;
    uint OptimalWriteSize;
    ubyte[16] TotalCapacity;
    ubyte[16] UnallocatedCapacity;
    ubyte[80] Reserved2;
}
struct NVM_SET_LIST
{
    ubyte IdentifierCount;
    ubyte[127] Reserved;
    NVME_SET_ATTRIBUTES_ENTRY[1] Entry;
}
struct NVME_LBA_ZONE_FORMAT
{
    ulong ZoneSize;
    ubyte ZDES;
    ubyte[7] Reserved;
}
struct NVME_IDENTIFY_SPECIFIC_NAMESPACE_IO_COMMAND_SET
{
    struct _ZOC_e__Struct
    {
        ushort _bitfield0;
    }
    struct _OZCS_e__Struct
    {
        ushort _bitfield1;
    }
    uint MAR;
    uint MOR;
    uint RRL;
    uint FRL;
    ubyte[2796] Reserved0;
    NVME_LBA_ZONE_FORMAT[16] LBAEF;
    ubyte[768] Reserved1;
    ubyte[256] VS;
}
struct NVME_IDENTIFY_NVM_SPECIFIC_CONTROLLER_IO_COMMAND_SET
{
    ubyte VSL;
    ubyte WZSL;
    ubyte WUSL;
    ubyte DMRL;
    uint DMRSL;
    ulong DMSL;
    ubyte[4080] Reserved;
}
struct NVME_IDENTIFY_ZNS_SPECIFIC_CONTROLLER_IO_COMMAND_SET
{
    ubyte ZASL;
    ubyte[4095] Reserved;
}
struct NVME_CONTROLLER_LIST
{
    ushort NumberOfIdentifiers;
    ushort[2047] ControllerID;
}
struct NVME_IDENTIFY_IO_COMMAND_SET
{
    ulong[512] IOCommandSetVector;
}
alias NVME_LBA_RANGE_TYPES = int;
enum : int
{
    NVME_LBA_RANGE_TYPE_RESERVED       = 0x00000000,
    NVME_LBA_RANGE_TYPE_FILESYSTEM     = 0x00000001,
    NVME_LBA_RANGE_TYPE_RAID           = 0x00000002,
    NVME_LBA_RANGE_TYPE_CACHE          = 0x00000003,
    NVME_LBA_RANGE_TYPE_PAGE_SWAP_FILE = 0x00000004,
}

struct NVME_LBA_RANGET_TYPE_ENTRY
{
    ubyte Type;
    struct _Attributes_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte[14] Reserved0;
    ulong SLBA;
    ulong NLB;
    ubyte[16] GUID;
    ubyte[16] Reserved1;
}
alias NVME_VENDOR_LOG_PAGES = int;
enum : int
{
    NVME_LOG_PAGE_OCP_DEVICE_SMART_INFORMATION    = 0x000000c0,
    NVME_LOG_PAGE_OCP_DEVICE_ERROR_RECOVERY       = 0x000000c1,
    NVME_LOG_PAGE_OCP_FIRMWARE_ACTIVATION_HISTORY = 0x000000c2,
    NVME_LOG_PAGE_OCP_LATENCY_MONITOR             = 0x000000c3,
    NVME_LOG_PAGE_OCP_DEVICE_CAPABILITIES         = 0x000000c4,
    NVME_LOG_PAGE_OCP_UNSUPPORTED_REQUIREMENTS    = 0x000000c5,
    NVME_LOG_PAGE_OCP_TCG_CONFIGURATION           = 0x000000c8,
    NVME_LOG_PAGE_OCP_TCG_HISTORY                 = 0x000000c9,
}

alias NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_CODES = int;
enum : int
{
    NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_RESERVED     = 0x00000000,
    NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_DEVICE_PANIC = 0x00000001,
}

struct NVME_WCS_DEVICE_RESET_ACTION
{
    union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte AsUCHAR;
    }
}
struct NVME_WCS_DEVICE_CAPABILITIES
{
    union
    {
        struct
        {
            uint _bitfield0;
        }
        uint AsULONG;
    }
}
alias NVME_WCS_DEVICE_RECOVERY_ACTION1 = int;
enum : int
{
    NVMeDeviceRecoveryNoAction              = 0x00000000,
    NVMeDeviceRecoveryFormatNVM             = 0x00000001,
    NVMeDeviceRecoveryVendorSpecificCommand = 0x00000002,
    NVMeDeviceRecoveryVendorAnalysis        = 0x00000003,
    NVMeDeviceRecoveryDeviceReplacement     = 0x00000004,
    NVMeDeviceRecoverySanitize              = 0x00000005,
    NVMeDeviceRecovery1Max                  = 0x0000000f,
}

alias NVME_WCS_DEVICE_RECOVERY_ACTION2 = int;
enum : int
{
    NVMeDeviceRecoveryControllerReset   = 0x00000000,
    NVMeDeviceRecoverySubsystemReset    = 0x00000001,
    NVMeDeviceRecoveryPcieFunctionReset = 0x00000002,
    NVMeDeviceRecoveryPERST             = 0x00000003,
    NVMeDeviceRecoveryPowerCycle        = 0x00000004,
    NVMeDeviceRecoveryPcieHotReset      = 0x00000005,
    NVMeDeviceRecovery2Max              = 0x0000000f,
}

struct NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG
{
    align (1):
    ubyte[494] VersionSpecificData;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2
{
    align (1):
    ubyte[16] MediaUnitsWritten;
    ubyte[16] MediaUnitsRead;
    struct _BadUserNANDBlockCount_e__Struct
    {
        ubyte[6] RawCount;
        ubyte[2] Normalized;
    }
    struct _BadSystemNANDBlockCount_e__Struct
    {
        ubyte[6] RawCount;
        ubyte[2] Normalized;
    }
    ulong XORRecoveryCount;
    ulong UnrecoverableReadErrorCount;
    ulong SoftECCErrorCount;
    struct _EndToEndCorrectionCounts_e__Struct
    {
        align (1):
        uint DetectedCounts;
        uint CorrectedCounts;
    }
    ubyte PercentageSystemDataUsed;
    ubyte[7] RefreshCount;
    struct _UserDataEraseCounts_e__Struct
    {
        align (1):
        uint MaximumCount;
        uint MinimumCount;
    }
    struct _ThermalThrottling_e__Struct
    {
        ubyte EventCount;
        ubyte Status;
    }
    ubyte[6] Reserved0;
    ulong PCIeCorrectableErrorCount;
    uint IncompleteShutdownCount;
    uint Reserved1;
    ubyte PercentageFreeBlocks;
    ubyte[7] Reserved2;
    ushort CapacitorHealth;
    ubyte[6] Reserved3;
    ulong UnalignedIOCount;
    ulong SecurityVersionNumber;
    ulong NUSE;
    ubyte[16] PLPStartCount;
    ubyte[16] EnduranceEstimate;
    ubyte[302] Reserved4;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3
{
    align (1):
    ubyte[16] MediaUnitsWritten;
    ubyte[16] MediaUnitsRead;
    struct _BadUserNANDBlockCount_e__Struct
    {
        ubyte[6] RawCount;
        ubyte[2] Normalized;
    }
    struct _BadSystemNANDBlockCount_e__Struct
    {
        ubyte[6] RawCount;
        ubyte[2] Normalized;
    }
    ulong XORRecoveryCount;
    ulong UnrecoverableReadErrorCount;
    ulong SoftECCErrorCount;
    struct _EndToEndCorrectionCounts_e__Struct
    {
        align (1):
        uint DetectedCounts;
        uint CorrectedCounts;
    }
    ubyte PercentageSystemDataUsed;
    ubyte[7] RefreshCount;
    struct _UserDataEraseCounts_e__Struct
    {
        align (1):
        uint MaximumCount;
        uint MinimumCount;
    }
    struct _ThermalThrottling_e__Struct
    {
        ubyte EventCount;
        ubyte Status;
    }
    ubyte[6] DSSDSpecVersion;
    ulong PCIeCorrectableErrorCount;
    uint IncompleteShutdownCount;
    uint Reserved1;
    ubyte PercentageFreeBlocks;
    ubyte[7] Reserved2;
    ushort CapacitorHealth;
    ubyte NvmeErrata;
    ubyte[5] Reserved3;
    ulong UnalignedIOCount;
    ulong SecurityVersionNumber;
    ulong NUSE;
    ubyte[16] PLPStartCount;
    ubyte[16] EnduranceEstimate;
    ulong PCIeLinkRetrainingCount;
    ulong PowerStateChangeCount;
    ubyte[286] Reserved4;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct NVME_WCS_DEVICE_ERROR_RECOVERY_LOG
{
    align (1):
    ushort PanicResetWaitTime;
    NVME_WCS_DEVICE_RESET_ACTION PanicResetAction;
    ubyte DriveRecoveryAction;
    ulong PanicId;
    NVME_WCS_DEVICE_CAPABILITIES DeviceCapabilitiesA;
    ubyte VendorSpecificRecoveryCode;
    ubyte[3] Reserved0;
    uint VendorSpecificCommandCDW12;
    uint VendorSpecificCommandCDW13;
    ubyte[466] Reserved1;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct NVME_OCP_DEVICE_ERROR_RECOVERY_LOG_V2
{
    align (1):
    ushort PanicResetWaitTime;
    NVME_WCS_DEVICE_RESET_ACTION PanicResetAction;
    ubyte DeviceRecoveryAction1;
    ulong PanicId;
    NVME_WCS_DEVICE_CAPABILITIES DeviceCapabilitiesA;
    ubyte VendorSpecificRecoveryCode;
    ubyte[3] Reserved0;
    uint VendorSpecificCommandCDW12;
    uint VendorSpecificCommandCDW13;
    ubyte VendorSpecificCommandTimeout;
    ubyte DeviceRecoveryAction2;
    ubyte DeviceRecoveryAction2Timeout;
    ubyte[463] Reserved1;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct FIRMWARE_ACTIVATION_HISTORY_ENTRY
{
    align (1):
    ubyte VersionNumber;
    ubyte Length;
    ushort Reserved0;
    ushort ActivationCount;
    ulong Timestamp;
    ulong Reserved1;
    ulong PowerCycleCount;
    ulong PreviousFirmware;
    ulong NewFirmware;
    ubyte SlotNumber;
    ubyte CommitActionType;
    ushort Result;
    ubyte[14] Reserved2;
}
struct NVME_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY_LOG
{
    align (1):
    ubyte LID;
    ubyte[3] Reserved0;
    uint ValidNumberOfEntries;
    FIRMWARE_ACTIVATION_HISTORY_ENTRY[20] Entries;
    ubyte[2790] Reserved1;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct LATENCY_MONITOR_FEATURE_STATUS
{
    union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte AsUchar;
    }
}
struct ACTIVE_LATENCY_CONFIGURATION
{
    union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield0;
        }
        ushort AsUshort;
    }
}
struct BUCKET_COUNTER
{
    align (1):
    uint Reserved;
    uint Trim;
    uint Write;
    uint Read;
}
struct LATENCY_STAMP
{
    align (1):
    ulong Trim3;
    ulong Write3;
    ulong Read3;
    ulong Trim2;
    ulong Write2;
    ulong Read2;
    ulong Trim1;
    ulong Write1;
    ulong Read1;
    ulong Trim0;
    ulong Write0;
    ulong Read0;
}
struct MEASURED_LATENCY
{
    align (1):
    ushort Trim3;
    ushort Write3;
    ushort Read3;
    ushort Trim2;
    ushort Write2;
    ushort Read2;
    ushort Trim1;
    ushort Write1;
    ushort Read1;
    ushort Trim0;
    ushort Write0;
    ushort Read0;
}
struct LATENCY_STAMP_UNITS
{
    align (1):
    ushort _bitfield0;
}
struct DEBUG_BIT_FIELD
{
    align (1):
    ushort _bitfield0;
}
struct NVME_OCP_DEVICE_LATENCY_MONITOR_LOG
{
    align (1):
    LATENCY_MONITOR_FEATURE_STATUS FeatureStatus;
    ubyte Reserved0;
    ushort ActiveBucketTimer;
    ushort ActiveBucketTimerThreshold;
    ubyte ActiveThresholdA;
    ubyte ActiveThresholdB;
    ubyte ActiveThresholdC;
    ubyte ActiveThresholdD;
    ACTIVE_LATENCY_CONFIGURATION ActiveLatencyConfig;
    ubyte ActiveLatencyMinimumWindow;
    ubyte[19] Reserved1;
    BUCKET_COUNTER ActiveBucketCounter0;
    BUCKET_COUNTER ActiveBucketCounter1;
    BUCKET_COUNTER ActiveBucketCounter2;
    BUCKET_COUNTER ActiveBucketCounter3;
    LATENCY_STAMP ActiveLatencyStamp;
    MEASURED_LATENCY ActiveMeasuredLatency;
    LATENCY_STAMP_UNITS ActiveLatencyStampUnits;
    ubyte[22] Reserved2;
    BUCKET_COUNTER StaticBucketCounter0;
    BUCKET_COUNTER StaticBucketCounter1;
    BUCKET_COUNTER StaticBucketCounter2;
    BUCKET_COUNTER StaticBucketCounter3;
    LATENCY_STAMP StaticLatencyStamp;
    MEASURED_LATENCY StaticMeasuredLatency;
    LATENCY_STAMP_UNITS StaticLatencyStampUnits;
    ubyte[22] Reserved3;
    DEBUG_BIT_FIELD DebugLogTriggerEnable;
    ushort DebugLogMeasuredLatency;
    ulong DebugLogLatencyStamp;
    ushort DebugLogPointer;
    DEBUG_BIT_FIELD DebugCounterTriggerSource;
    union _DebugLogStampUnits_e__Union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte AsUchar;
    }
    ubyte[29] Reserved4;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct DSSD_POWER_STATE_DESCRIPTOR
{
    ubyte _bitfield0;
}
struct NVME_OCP_DEVICE_CAPABILITIES_LOG
{
    align (1):
    ushort PciePorts;
    union _OobMgmtSupport_e__Union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield0;
        }
        ushort AsUshort;
    }
    union _WriteZeroesCommand_e__Union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield1;
        }
        ushort AsUshort;
    }
    union _SanitizeCommand_e__Union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield2;
        }
        ushort AsUshort;
    }
    union _DatasetMgmtCommand_e__Union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield3;
        }
        ushort AsUshort;
    }
    union _WriteUncorrectableCommand_e__Union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield4;
        }
        ushort AsUshort;
    }
    union _FusedCommand_e__Union
    {
        align (1):
        struct
        {
            align (1):
            ushort _bitfield5;
        }
        ushort AsUshort;
    }
    ushort MinimumValidDSSDPowerState;
    ubyte Reserved0;
    DSSD_POWER_STATE_DESCRIPTOR[127] DssdDescriptors;
    ubyte[3934] Reserved1;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct UNSUPPORTED_REQUIREMENT
{
    ubyte[16] ReqId;
}
struct NVME_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS_LOG
{
    align (1):
    ushort UnsupportedCount;
    ubyte[14] Reserved0;
    UNSUPPORTED_REQUIREMENT[253] UnsupportedReqList;
    ubyte[14] Reserved1;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct NVME_OCP_DEVICE_TCG_CONFIGURATION_LOG
{
    align (1):
    union _State_e__Union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte AsUchar;
    }
    ubyte[3] Reserved0;
    ubyte LSPActivationCount;
    ubyte TPRevertCount;
    ubyte LSPRevertCount;
    ubyte LOCount;
    ubyte SUMLOCount;
    ubyte RPLOCount;
    ubyte NPLOCount;
    ubyte RLLOCount;
    ubyte WLLOCount;
    ubyte RULOCount;
    ubyte WULOCount;
    ubyte Reserved1;
    uint SIDAuthTryCount;
    uint SIDAuthTryLimit;
    uint ResetCount;
    uint ResetLockCount;
    ubyte[462] Reserved2;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
struct TCG_HISTORY_ENTRY
{
    align (1):
    ubyte VersionNumber;
    ubyte EntryLength;
    ushort PowerCycleCount;
    uint TcgCommandCount;
    ulong TcgCommandCompletionTS;
    ulong InvokingId;
    ulong MethodId;
    ushort ComId;
    ubyte ProtocolId;
    ubyte TcgStatus;
    ushort ProcessTime;
    ubyte[10] CommandSpecific;
}
struct TCG_AUTH_METHOD_SPECIFIC
{
    align (1):
    ulong AuthorityId;
    ubyte TriesCount;
}
struct TCG_ACTIVATE_METHOD_SPECIFIC
{
    ubyte RangeStartLengthPolicy;
}
struct TCG_REACTIVATE_METHOD_SPECIFIC
{
    ubyte RangeStartLengthPolicy;
}
struct TCG_ASSIGN_METHOD_SPECIFIC
{
    align (1):
    uint NamespaceId;
}
struct TCG_BLOCKSID_METHOD_SPECIFIC
{
    ubyte ClearEvents;
}
struct NVME_OCP_DEVICE_TCG_HISTORY_LOG
{
    align (1):
    ubyte LID;
    ubyte[3] Reserved0;
    uint HistoryEntryCount;
    TCG_HISTORY_ENTRY[84] HistoryEntries;
    ubyte[38] Reserved1;
    ushort LogPageVersionNumber;
    GUID LogPageGUID;
}
union NVME_CDW10_CREATE_IO_QUEUE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_CREATE_IO_CQ
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_NVM_QUEUE_PRIORITIES = int;
enum : int
{
    NVME_NVM_QUEUE_PRIORITY_URGENT = 0x00000000,
    NVME_NVM_QUEUE_PRIORITY_HIGH   = 0x00000001,
    NVME_NVM_QUEUE_PRIORITY_MEDIUM = 0x00000002,
    NVME_NVM_QUEUE_PRIORITY_LOW    = 0x00000003,
}

union NVME_CDW11_CREATE_IO_SQ
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_FEATURE_VALUE_CODES = int;
enum : int
{
    NVME_FEATURE_VALUE_CURRENT                = 0x00000000,
    NVME_FEATURE_VALUE_DEFAULT                = 0x00000001,
    NVME_FEATURE_VALUE_SAVED                  = 0x00000002,
    NVME_FEATURE_VALUE_SUPPORTED_CAPABILITIES = 0x00000003,
}

union NVME_CDW10_GET_FEATURES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW10_SET_FEATURES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_NUMBER_OF_QUEUES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_INTERRUPT_COALESCING
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_LBA_RANGE_TYPE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_ARBITRATION
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_SUPPORTED_CAPABILITY
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_POWER_MANAGEMENT
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_AUTO_POWER_STATE_TRANSITION_ENTRY
{
    uint _bitfield0;
    uint Reserved1;
}
alias NVME_TEMPERATURE_THRESHOLD_TYPES = int;
enum : int
{
    NVME_TEMPERATURE_OVER_THRESHOLD  = 0x00000000,
    NVME_TEMPERATURE_UNDER_THRESHOLD = 0x00000001,
}

union NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_ERROR_RECOVERY
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW12_FEATURE_HOST_MEMORY_BUFFER
{
    struct
    {
        uint HSIZE;
    }
    uint AsUlong;
}
union NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER
{
    struct
    {
        uint HMDLUA;
    }
    uint AsUlong;
}
union NVME_CDW15_FEATURE_HOST_MEMORY_BUFFER
{
    struct
    {
        uint HMDLEC;
    }
    uint AsUlong;
}
struct NVME_HOST_MEMORY_BUFFER_DESCRIPTOR_ENTRY
{
    ulong BADD;
    uint BSIZE;
    uint Reserved;
}
union NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_GET_HOST_METADATA
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_HOST_METADATA_ELEMENT_ACTIONS = int;
enum : int
{
    NVME_HOST_METADATA_ADD_REPLACE_ENTRY     = 0x00000000,
    NVME_HOST_METADATA_DELETE_ENTRY_MULTIPLE = 0x00000001,
    NVME_HOST_METADATA_ADD_ENTRY_MULTIPLE    = 0x00000002,
}

union NVME_CDW11_FEATURE_SET_HOST_METADATA
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_CONTROLLER_METADATA_ELEMENT_TYPES = int;
enum : int
{
    NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_CONTROLLER_NAME = 0x00000001,
    NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_NAME     = 0x00000002,
    NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_VERSION  = 0x00000003,
    NVME_CONTROLLER_METADATA_PREBOOT_CONTROLLER_NAME          = 0x00000004,
    NVME_CONTROLLER_METADATA_PREBOOT_DRIVER_NAME              = 0x00000005,
    NVME_CONTROLLER_METADATA_PREBOOT_DRIVER_VERSION           = 0x00000006,
    NVME_CONTROLLER_METADATA_SYSTEM_PROCESSOR_MODEL           = 0x00000007,
    NVME_CONTROLLER_METADATA_CHIPSET_DRIVER_NAME              = 0x00000008,
    NVME_CONTROLLER_METADATA_CHIPSET_DRIVER_VERSION           = 0x00000009,
    NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_NAME_AND_BUILD  = 0x0000000a,
    NVME_CONTROLLER_METADATA_SYSTEM_PRODUCT_NAME              = 0x0000000b,
    NVME_CONTROLLER_METADATA_FIRMWARE_VERSION                 = 0x0000000c,
    NVME_CONTROLLER_METADATA_OPERATING_SYSTEM_DRIVER_FILENAME = 0x0000000d,
    NVME_CONTROLLER_METADATA_DISPLAY_DRIVER_NAME              = 0x0000000e,
    NVME_CONTROLLER_METADATA_DISPLAY_DRIVER_VERSION           = 0x0000000f,
    NVME_CONTROLLER_METADATA_HOST_DETERMINED_FAILURE_RECORD   = 0x00000010,
}

alias NVME_NAMESPACE_METADATA_ELEMENT_TYPES = int;
enum : int
{
    NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME             = 0x00000001,
    NVME_NAMESPACE_METADATA_PREBOOT_NAMESPACE_NAME                      = 0x00000002,
    NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_1 = 0x00000003,
    NVME_NAMESPACE_METADATA_OPERATING_SYSTEM_NAMESPACE_NAME_QUALIFIER_2 = 0x00000004,
}

struct NVME_HOST_METADATA_ELEMENT_DESCRIPTOR
{
    uint _bitfield0;
    ubyte[1] EVAL;
}
struct NVME_FEATURE_HOST_METADATA_DATA
{
    ubyte NumberOfMetadataElementDescriptors;
    ubyte Reserved0;
    ubyte[4094] MetadataElementDescriptors;
}
union NVME_CDW0_FEATURE_ERROR_INJECTION
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_ERROR_INJECTION_ENTRY
{
    union _Flags_e__Union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte AsUchar;
    }
    ubyte Reserved1;
    ushort ErrorInjectionType;
    ubyte[28] ErrorInjectionTypeSpecific;
}
alias NVME_ERROR_INJECTION_TYPES = int;
enum : int
{
    NVME_ERROR_INJECTION_TYPE_RESERVED0                                = 0x00000000,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_CPU_CONTROLLER_HANG         = 0x00000001,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_NAND_HANG                   = 0x00000002,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_PLP_DEFECT                  = 0x00000003,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_LOGICAL_FW_ERROR            = 0x00000004,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_DRAM_CORRUPTION_CRITICAL    = 0x00000005,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_DRAM_CORRUPTION_NONCRITICAL = 0x00000006,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_NAND_CORRUPTION             = 0x00000007,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_SRAM_CORRUPTION             = 0x00000008,
    NVME_ERROR_INJECTION_TYPE_DEVICE_PANIC_HW_MALFUNCTION              = 0x00000009,
    NVME_ERROR_INJECTION_TYPE_RESERVED1                                = 0x0000000a,
    NVME_ERROR_INJECTION_TYPE_MAX                                      = 0x0000ffff,
}

union NVME_CDW11_FEATURE_CLEAR_FW_UPDATE_HISTORY
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_READONLY_WRITETHROUGH_MODE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW0_FEATURE_READONLY_WRITETHROUGH_MODE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_CLEAR_PCIE_CORRECTABLE_ERROR_COUNTERS
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_FEATURE_ENABLE_IEEE1667_SILO
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW0_FEATURE_ENABLE_IEEE1667_SILO
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_CDW11_FEATURE_HOST_IDENTIFIER
{
    uint _bitfield0;
}
struct NVME_FEATURE_HOST_IDENTIFIER_DATA
{
    ubyte[16] HOSTID;
}
struct NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE
{
    uint _bitfield0;
}
struct NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK
{
    uint _bitfield0;
}
union NVME_CDW11_FEATURES
{
    NVME_CDW11_FEATURE_NUMBER_OF_QUEUES NumberOfQueues;
    NVME_CDW11_FEATURE_INTERRUPT_COALESCING InterruptCoalescing;
    NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG InterruptVectorConfig;
    NVME_CDW11_FEATURE_LBA_RANGE_TYPE LbaRangeType;
    NVME_CDW11_FEATURE_ARBITRATION Arbitration;
    NVME_CDW11_FEATURE_VOLATILE_WRITE_CACHE VolatileWriteCache;
    NVME_CDW11_FEATURE_ASYNC_EVENT_CONFIG AsyncEventConfig;
    NVME_CDW11_FEATURE_POWER_MANAGEMENT PowerManagement;
    NVME_CDW11_FEATURE_AUTO_POWER_STATE_TRANSITION AutoPowerStateTransition;
    NVME_CDW11_FEATURE_TEMPERATURE_THRESHOLD TemperatureThreshold;
    NVME_CDW11_FEATURE_ERROR_RECOVERY ErrorRecovery;
    NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER HostMemoryBuffer;
    NVME_CDW11_FEATURE_WRITE_ATOMICITY_NORMAL WriteAtomicityNormal;
    NVME_CDW11_FEATURE_NON_OPERATIONAL_POWER_STATE NonOperationalPowerState;
    NVME_CDW11_FEATURE_IO_COMMAND_SET_PROFILE IoCommandSetProfile;
    NVME_CDW0_FEATURE_ERROR_INJECTION ErrorInjection;
    NVME_CDW11_FEATURE_HOST_IDENTIFIER HostIdentifier;
    NVME_CDW11_FEATURE_RESERVATION_PERSISTENCE ReservationPersistence;
    NVME_CDW11_FEATURE_RESERVATION_NOTIFICATION_MASK ReservationNotificationMask;
    NVME_CDW11_FEATURE_GET_HOST_METADATA GetHostMetadata;
    NVME_CDW11_FEATURE_SET_HOST_METADATA SetHostMetadata;
    uint AsUlong;
}
union NVME_CDW12_FEATURES
{
    NVME_CDW12_FEATURE_HOST_MEMORY_BUFFER HostMemoryBuffer;
    uint AsUlong;
}
union NVME_CDW13_FEATURES
{
    NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER HostMemoryBuffer;
    uint AsUlong;
}
union NVME_CDW14_FEATURES
{
    NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER HostMemoryBuffer;
    uint AsUlong;
}
union NVME_CDW15_FEATURES
{
    NVME_CDW15_FEATURE_HOST_MEMORY_BUFFER HostMemoryBuffer;
    uint AsUlong;
}
alias NVME_LOG_PAGES = int;
enum : int
{
    NVME_LOG_PAGE_ERROR_INFO                          = 0x00000001,
    NVME_LOG_PAGE_HEALTH_INFO                         = 0x00000002,
    NVME_LOG_PAGE_FIRMWARE_SLOT_INFO                  = 0x00000003,
    NVME_LOG_PAGE_CHANGED_NAMESPACE_LIST              = 0x00000004,
    NVME_LOG_PAGE_COMMAND_EFFECTS                     = 0x00000005,
    NVME_LOG_PAGE_DEVICE_SELF_TEST                    = 0x00000006,
    NVME_LOG_PAGE_TELEMETRY_HOST_INITIATED            = 0x00000007,
    NVME_LOG_PAGE_TELEMETRY_CTLR_INITIATED            = 0x00000008,
    NVME_LOG_PAGE_ENDURANCE_GROUP_INFORMATION         = 0x00000009,
    NVME_LOG_PAGE_PREDICTABLE_LATENCY_NVM_SET         = 0x0000000a,
    NVME_LOG_PAGE_PREDICTABLE_LATENCY_EVENT_AGGREGATE = 0x0000000b,
    NVME_LOG_PAGE_ASYMMETRIC_NAMESPACE_ACCESS         = 0x0000000c,
    NVME_LOG_PAGE_PERSISTENT_EVENT_LOG                = 0x0000000d,
    NVME_LOG_PAGE_LBA_STATUS_INFORMATION              = 0x0000000e,
    NVME_LOG_PAGE_ENDURANCE_GROUP_EVENT_AGGREGATE     = 0x0000000f,
    NVME_LOG_PAGE_RESERVATION_NOTIFICATION            = 0x00000080,
    NVME_LOG_PAGE_SANITIZE_STATUS                     = 0x00000081,
    NVME_LOG_PAGE_CHANGED_ZONE_LIST                   = 0x000000bf,
}

union NVME_CDW10_GET_LOG_PAGE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW10_GET_LOG_PAGE_V13
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_GET_LOG_PAGE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_CDW12_GET_LOG_PAGE
{
    uint LPOL;
}
struct NVME_CDW13_GET_LOG_PAGE
{
    uint LPOU;
}
union NVME_CDW14_GET_LOG_PAGE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_ERROR_INFO_LOG
{
    ulong ErrorCount;
    ushort SQID;
    ushort CMDID;
    NVME_COMMAND_STATUS Status;
    struct _ParameterErrorLocation_e__Struct
    {
        ushort _bitfield0;
    }
    ulong Lba;
    uint NameSpace;
    ubyte VendorInfoAvailable;
    ubyte[3] Reserved0;
    ulong CommandSpecificInfo;
    ubyte[24] Reserved1;
}
struct NVME_HEALTH_INFO_LOG
{
    union _CriticalWarning_e__Union
    {
        struct
        {
            ubyte _bitfield0;
        }
        ubyte AsUchar;
    }
    ubyte[2] Temperature;
    ubyte AvailableSpare;
    ubyte AvailableSpareThreshold;
    ubyte PercentageUsed;
    ubyte[26] Reserved0;
    ubyte[16] DataUnitRead;
    ubyte[16] DataUnitWritten;
    ubyte[16] HostReadCommands;
    ubyte[16] HostWrittenCommands;
    ubyte[16] ControllerBusyTime;
    ubyte[16] PowerCycle;
    ubyte[16] PowerOnHours;
    ubyte[16] UnsafeShutdowns;
    ubyte[16] MediaErrors;
    ubyte[16] ErrorInfoLogEntryCount;
    uint WarningCompositeTemperatureTime;
    uint CriticalCompositeTemperatureTime;
    ushort TemperatureSensor1;
    ushort TemperatureSensor2;
    ushort TemperatureSensor3;
    ushort TemperatureSensor4;
    ushort TemperatureSensor5;
    ushort TemperatureSensor6;
    ushort TemperatureSensor7;
    ushort TemperatureSensor8;
    ubyte[296] Reserved1;
}
struct NVME_TELEMETRY_HOST_INITIATED_LOG
{
    ubyte LogIdentifier;
    ubyte[4] Reserved0;
    ubyte[3] OrganizationID;
    ushort Area1LastBlock;
    ushort Area2LastBlock;
    ushort Area3LastBlock;
    ubyte[2] Reserved1;
    uint Area4LastBlock;
    ubyte[361] Reserved2;
    ubyte HostInitiatedDataGenerationNumber;
    ubyte ControllerInitiatedDataAvailable;
    ubyte ControllerInitiatedDataGenerationNumber;
    ubyte[128] ReasonIdentifier;
}
struct NVME_TELEMETRY_CONTROLLER_INITIATED_LOG
{
    ubyte LogIdentifier;
    ubyte[4] Reserved0;
    ubyte[3] OrganizationID;
    ushort Area1LastBlock;
    ushort Area2LastBlock;
    ushort Area3LastBlock;
    ubyte[2] Reserved1;
    uint Area4LastBlock;
    ubyte[362] Reserved2;
    ubyte ControllerInitiatedDataAvailable;
    ubyte ControllerInitiatedDataGenerationNumber;
    ubyte[128] ReasonIdentifier;
}
struct NVME_FIRMWARE_SLOT_INFO_LOG
{
    struct _AFI_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte[7] Reserved0;
    ulong[7] FRS;
    ubyte[448] Reserved1;
}
struct NVME_CHANGED_NAMESPACE_LIST_LOG
{
    uint[1024] NSID;
}
struct NVME_CHANGED_ZONE_LIST_LOG
{
    ushort ZoneIdentifiersCount;
    ubyte[6] Reserved;
    ulong[511] ZoneIdentifier;
}
alias NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMITS = int;
enum : int
{
    NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_NONE                  = 0x00000000,
    NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_SINGLE_PER_NAMESPACE  = 0x00000001,
    NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_SINGLE_PER_CONTROLLER = 0x00000002,
}

union NVME_COMMAND_EFFECTS_DATA
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_COMMAND_EFFECTS_LOG
{
    NVME_COMMAND_EFFECTS_DATA[256] ACS;
    NVME_COMMAND_EFFECTS_DATA[256] IOCS;
    ubyte[2048] Reserved;
}
struct NVME_DEVICE_SELF_TEST_RESULT_DATA
{
    align (1):
    struct _Status_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte SegmentNumber;
    struct _ValidDiagnostics_e__Struct
    {
        ubyte _bitfield1;
    }
    ubyte Reserved;
    ulong POH;
    uint NSID;
    ulong FailingLBA;
    struct _StatusCodeType_e__Struct
    {
        ubyte _bitfield2;
    }
    ubyte StatusCode;
    ushort VendorSpecific;
}
struct NVME_DEVICE_SELF_TEST_LOG
{
    struct _CurrentOperation_e__Struct
    {
        ubyte _bitfield0;
    }
    struct _CurrentCompletion_e__Struct
    {
        ubyte _bitfield1;
    }
    ubyte[2] Reserved;
    NVME_DEVICE_SELF_TEST_RESULT_DATA[20] ResultData;
}
struct NVME_ENDURANCE_GROUP_LOG
{
    align (1):
    uint Reserved0;
    ubyte AvailableSpareThreshold;
    ubyte PercentageUsed;
    ubyte[26] Reserved1;
    ubyte[16] EnduranceEstimate;
    ubyte[16] DataUnitsRead;
    ubyte[16] DataUnitsWritten;
    ubyte[16] MediaUnitsWritten;
    ubyte[416] Reserved2;
}
struct NVME_PERSISTENT_EVENT_LOG_HEADER
{
    align (1):
    ubyte LogIdentifier;
    ubyte[3] Reserved0;
    uint TotalNumberOfEvents;
    ulong TotalLogLength;
    ubyte LogRevision;
    ubyte Reserved1;
    ushort LogHeaderLength;
    ulong Timestamp;
    ubyte[16] PowerOnHours;
    ulong PowerCycleCount;
    ushort PciVendorId;
    ushort PciSubsystemVendorId;
    ubyte[20] SerialNumber;
    ubyte[40] ModelNumber;
    ubyte[256] NVMSubsystemNVMeQualifiedName;
    ubyte[108] Reserved;
    ubyte[32] SupportedEventsBitmap;
}
struct NVME_PERSISTENT_EVENT_LOG_EVENT_HEADER
{
    align (1):
    ubyte EventType;
    ubyte EventTypeRevision;
    ubyte EventHeaderLength;
    ubyte Reserved0;
    ushort ControllerIdentifier;
    ulong EventTimestamp;
    ubyte[6] Reserved1;
    ushort VendorSpecificInformationLength;
    ushort EventLength;
}
alias NVME_PERSISTENT_EVENT_LOG_EVENT_TYPES = int;
enum : int
{
    NVME_PERSISTENT_EVENT_TYPE_RESERVED0                    = 0x00000000,
    NVME_PERSISTENT_EVENT_TYPE_SMART_HEALTH_LOG_SNAPSHOT    = 0x00000001,
    NVME_PERSISTENT_EVENT_TYPE_FIRMWARE_COMMIT              = 0x00000002,
    NVME_PERSISTENT_EVENT_TYPE_TIMESTAMP_CHANGE             = 0x00000003,
    NVME_PERSISTENT_EVENT_TYPE_POWER_ON_OR_RESET            = 0x00000004,
    NVME_PERSISTENT_EVENT_TYPE_NVM_SUBSYSTEM_HARDWARE_ERROR = 0x00000005,
    NVME_PERSISTENT_EVENT_TYPE_CHANGE_NAMESPACE             = 0x00000006,
    NVME_PERSISTENT_EVENT_TYPE_FORMAT_NVM_START             = 0x00000007,
    NVME_PERSISTENT_EVENT_TYPE_FORMAT_NVM_COMPLETION        = 0x00000008,
    NVME_PERSISTENT_EVENT_TYPE_SANITIZE_START               = 0x00000009,
    NVME_PERSISTENT_EVENT_TYPE_SANITIZE_COMPLETION          = 0x0000000a,
    NVME_PERSISTENT_EVENT_TYPE_SET_FEATURE                  = 0x0000000b,
    NVME_PERSISTENT_EVENT_TYPE_TELEMETRY_LOG_CREATED        = 0x0000000c,
    NVME_PERSISTENT_EVENT_TYPE_THERMAL_EXCURSION            = 0x0000000d,
    NVME_PERSISTENT_EVENT_TYPE_RESERVED1_BEGIN              = 0x0000000e,
    NVME_PERSISTENT_EVENT_TYPE_RESERVED1_END                = 0x000000dd,
    NVME_PERSISTENT_EVENT_TYPE_VENDOR_SPECIFIC_EVENT        = 0x000000de,
    NVME_PERSISTENT_EVENT_TYPE_TCG_DEFINED                  = 0x000000df,
    NVME_PERSISTENT_EVENT_TYPE_RESERVED2_BEGIN              = 0x000000e0,
    NVME_PERSISTENT_EVENT_TYPE_RESERVED2_END                = 0x000000ff,
    NVME_PERSISTENT_EVENT_TYPE_MAX                          = 0x000000ff,
}

alias NVME_RESERVATION_NOTIFICATION_TYPES = int;
enum : int
{
    NVME_RESERVATION_NOTIFICATION_TYPE_EMPTY_LOG_PAGE         = 0x00000000,
    NVME_RESERVATION_NOTIFICATION_TYPE_REGISTRATION_PREEMPTED = 0x00000001,
    NVME_RESERVATION_NOTIFICATION_TYPE_REGISTRATION_RELEASED  = 0x00000002,
    NVME_RESERVATION_NOTIFICATION_TYPE_RESERVATION_PREEPMPTED = 0x00000003,
}

struct NVME_RESERVATION_NOTIFICATION_LOG
{
    ulong LogPageCount;
    ubyte LogPageType;
    ubyte AvailableLogPageCount;
    ubyte[2] Reserved0;
    uint NameSpaceId;
    ubyte[48] Reserved1;
}
alias NVME_SANITIZE_OPERATION_STATUS = int;
enum : int
{
    NVME_SANITIZE_OPERATION_NONE                               = 0x00000000,
    NVME_SANITIZE_OPERATION_SUCCEEDED                          = 0x00000001,
    NVME_SANITIZE_OPERATION_IN_PROGRESS                        = 0x00000002,
    NVME_SANITIZE_OPERATION_FAILED                             = 0x00000003,
    NVME_SANITIZE_OPERATION_SUCCEEDED_WITH_FORCED_DEALLOCATION = 0x00000004,
}

struct NVME_SANITIZE_STATUS
{
    ushort _bitfield0;
}
struct NVME_SANITIZE_STATUS_LOG
{
    ushort SPROG;
    NVME_SANITIZE_STATUS SSTAT;
    uint SCDW10;
    uint EstimatedTimeForOverwrite;
    uint EstimatedTimeForBlockErase;
    uint EstimatedTimeForCryptoErase;
    uint EstimatedTimeForOverwriteWithNoDeallocateMediaModification;
    uint EstimatedTimeForBlockEraseWithNoDeallocateMediaModification;
    uint EstimatedTimeForCryptoEraseWithNoDeallocateMediaModification;
    ubyte[480] Reserved;
}
struct NVME_CDW10_FIRMWARE_DOWNLOAD
{
    uint NUMD;
}
struct NVME_CDW11_FIRMWARE_DOWNLOAD
{
    uint OFST;
}
alias NVME_FIRMWARE_ACTIVATE_ACTIONS = int;
enum : int
{
    NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT                        = 0x00000000,
    NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE           = 0x00000001,
    NVME_FIRMWARE_ACTIVATE_ACTION_ACTIVATE                                = 0x00000002,
    NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE_IMMEDIATE = 0x00000003,
}

union NVME_CDW10_FIRMWARE_ACTIVATE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_PROTECTION_INFORMATION_TYPES = int;
enum : int
{
    NVME_PROTECTION_INFORMATION_NOT_ENABLED = 0x00000000,
    NVME_PROTECTION_INFORMATION_TYPE1       = 0x00000001,
    NVME_PROTECTION_INFORMATION_TYPE2       = 0x00000002,
    NVME_PROTECTION_INFORMATION_TYPE3       = 0x00000003,
}

alias NVME_SECURE_ERASE_SETTINGS = int;
enum : int
{
    NVME_SECURE_ERASE_NONE          = 0x00000000,
    NVME_SECURE_ERASE_USER_DATA     = 0x00000001,
    NVME_SECURE_ERASE_CRYPTOGRAPHIC = 0x00000002,
}

union NVME_CDW10_FORMAT_NVM
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_NO_DEALLOCATE_MODIFIES_MEDIA_AFTER_SANITIZE = int;
enum : int
{
    NVME_MEDIA_ADDITIONALLY_MODIFIED_AFTER_SANITIZE_NOT_DEFINED = 0x00000000,
    NVME_MEDIA_NOT_ADDITIONALLY_MODIFIED_AFTER_SANITIZE         = 0x00000001,
    NVME_MEDIA_ADDITIONALLY_MOFIDIED_AFTER_SANITIZE             = 0x00000002,
}

alias NVME_SANITIZE_ACTION = int;
enum : int
{
    NVME_SANITIZE_ACTION_RESERVED                    = 0x00000000,
    NVME_SANITIZE_ACTION_EXIT_FAILURE_MODE           = 0x00000001,
    NVME_SANITIZE_ACTION_START_BLOCK_ERASE_SANITIZE  = 0x00000002,
    NVME_SANITIZE_ACTION_START_OVERWRITE_SANITIZE    = 0x00000003,
    NVME_SANITIZE_ACTION_START_CRYPTO_ERASE_SANITIZE = 0x00000004,
}

union NVME_CDW10_SANITIZE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_SANITIZE
{
    struct
    {
        uint OVRPAT;
    }
    uint AsUlong;
}
alias NVME_RESERVATION_TYPES = int;
enum : int
{
    NVME_RESERVATION_TYPE_RESERVED                          = 0x00000000,
    NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE                   = 0x00000001,
    NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS                  = 0x00000002,
    NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_REGISTRANTS_ONLY  = 0x00000003,
    NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_REGISTRANTS_ONLY = 0x00000004,
    NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_ALL_REGISTRANTS   = 0x00000005,
    NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_ALL_REGISTRANTS  = 0x00000006,
}

alias NVME_RESERVATION_ACQUIRE_ACTIONS = int;
enum : int
{
    NVME_RESERVATION_ACQUIRE_ACTION_ACQUIRE           = 0x00000000,
    NVME_RESERVATION_ACQUIRE_ACTION_PREEMPT           = 0x00000001,
    NVME_RESERVATION_ACQUIRE_ACTION_PREEMPT_AND_ABORT = 0x00000002,
}

struct NVME_CDW0_RESERVATION_PERSISTENCE
{
    uint _bitfield0;
}
union NVME_CDW10_RESERVATION_ACQUIRE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_RESERVATION_ACQUIRE_DATA_STRUCTURE
{
    ulong CRKEY;
    ulong PRKEY;
}
alias NVME_RESERVATION_REGISTER_ACTIONS = int;
enum : int
{
    NVME_RESERVATION_REGISTER_ACTION_REGISTER   = 0x00000000,
    NVME_RESERVATION_REGISTER_ACTION_UNREGISTER = 0x00000001,
    NVME_RESERVATION_REGISTER_ACTION_REPLACE    = 0x00000002,
}

alias NVME_RESERVATION_REGISTER_PTPL_STATE_CHANGES = int;
enum : int
{
    NVME_RESERVATION_REGISTER_PTPL_STATE_NO_CHANGE = 0x00000000,
    NVME_RESERVATION_REGISTER_PTPL_STATE_RESERVED  = 0x00000001,
    NVME_RESERVATION_REGISTER_PTPL_STATE_SET_TO_0  = 0x00000002,
    NVME_RESERVATION_REGISTER_PTPL_STATE_SET_TO_1  = 0x00000003,
}

union NVME_CDW10_RESERVATION_REGISTER
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_RESERVATION_REGISTER_DATA_STRUCTURE
{
    ulong CRKEY;
    ulong NRKEY;
}
alias NVME_RESERVATION_RELEASE_ACTIONS = int;
enum : int
{
    NVME_RESERVATION_RELEASE_ACTION_RELEASE = 0x00000000,
    NVME_RESERVATION_RELEASE_ACTION_CLEAR   = 0x00000001,
}

union NVME_CDW10_RESERVATION_RELEASE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_RESERVATION_RELEASE_DATA_STRUCTURE
{
    ulong CRKEY;
}
union NVME_CDW10_RESERVATION_REPORT
{
    struct
    {
        uint NUMD;
    }
    uint AsUlong;
}
union NVME_CDW11_RESERVATION_REPORT
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_RESERVATION_REPORT_STATUS_HEADER
{
    align (1):
    uint GEN;
    ubyte RTYPE;
    ushort REGCTL;
    ubyte[2] Reserved;
    ubyte PTPLS;
    ubyte[14] Reserved1;
}
struct NVME_REGISTERED_CONTROLLER_DATA
{
    ushort CNTLID;
    struct _RCSTS_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte[5] Reserved;
    ubyte[8] HOSTID;
    ulong RKEY;
}
struct NVME_RESERVATION_REPORT_STATUS_DATA_STRUCTURE
{
    NVME_RESERVATION_REPORT_STATUS_HEADER Header;
    NVME_REGISTERED_CONTROLLER_DATA[1] RegisteredControllersData;
}
struct NVME_REGISTERED_CONTROLLER_EXTENDED_DATA
{
    ushort CNTLID;
    struct _RCSTS_e__Struct
    {
        ubyte _bitfield0;
    }
    ubyte[5] Reserved;
    ulong RKEY;
    ubyte[16] HOSTID;
    ubyte[32] Reserved1;
}
struct NVME_RESERVATION_REPORT_STATUS_EXTENDED_DATA_STRUCTURE
{
    NVME_RESERVATION_REPORT_STATUS_HEADER Header;
    ubyte[40] Reserved1;
    NVME_REGISTERED_CONTROLLER_EXTENDED_DATA[1] RegisteredControllersExtendedData;
}
alias NVME_DIRECTIVE_TYPES = int;
enum : int
{
    NVME_DIRECTIVE_TYPE_IDENTIFY = 0x00000000,
    NVME_DIRECTIVE_TYPE_STREAMS  = 0x00000001,
}

struct NVME_CDW10_DIRECTIVE_RECEIVE
{
    uint NUMD;
}
union NVME_CDW11_DIRECTIVE_RECEIVE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_CDW10_DIRECTIVE_SEND
{
    uint NUMD;
}
union NVME_CDW11_DIRECTIVE_SEND
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_DIRECTIVE_RECEIVE_IDENTIFY_OPERATIONS = int;
enum : int
{
    NVME_DIRECTIVE_RECEIVE_IDENTIFY_OPERATION_RETURN_PARAMETERS = 0x00000001,
}

alias NVME_DIRECTIVE_SEND_IDENTIFY_OPERATIONS = int;
enum : int
{
    NVME_DIRECTIVE_SEND_IDENTIFY_OPERATION_ENABLE_DIRECTIVE = 0x00000001,
}

struct NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR
{
    ubyte _bitfield0;
    ubyte[31] Reserved1;
}
struct NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS
{
    NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR DirectivesSupported;
    NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR DirectivesEnabled;
}
union NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATIONS = int;
enum : int
{
    NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_RETURN_PARAMETERS  = 0x00000001,
    NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_GET_STATUS         = 0x00000002,
    NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_ALLOCATE_RESOURCES = 0x00000003,
}

alias NVME_DIRECTIVE_SEND_STREAMS_OPERATIONS = int;
enum : int
{
    NVME_DIRECTIVE_SEND_STREAMS_OPERATION_RELEASE_IDENTIFIER = 0x00000001,
    NVME_DIRECTIVE_SEND_STREAMS_OPERATION_RELEASE_RESOURCES  = 0x00000002,
}

struct NVME_DIRECTIVE_STREAMS_RETURN_PARAMETERS
{
    ushort MSL;
    ushort NSSA;
    ushort NSSO;
    ubyte[10] Reserved0;
    uint SWS;
    ushort SGS;
    ushort NSA;
    ushort NSO;
    ubyte[6] Reserved1;
}
struct NVME_DIRECTIVE_STREAMS_GET_STATUS_DATA
{
    ushort OpenStreamCount;
    ushort[65535] StreamIdentifiers;
}
union NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_COMPLETION_DW0_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW12_DIRECTIVE_SEND
{
    NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE EnableDirective;
    uint AsUlong;
}
union NVME_CDW12_DIRECTIVE_RECEIVE
{
    NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES AllocateResources;
    uint AsUlong;
}
union NVME_CDW10_SECURITY_SEND_RECEIVE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_CDW11_SECURITY_SEND
{
    uint TL;
}
struct NVME_CDW11_SECURITY_RECEIVE
{
    uint AL;
}
alias NVME_NVM_COMMANDS = int;
enum : int
{
    NVME_NVM_COMMAND_FLUSH                   = 0x00000000,
    NVME_NVM_COMMAND_WRITE                   = 0x00000001,
    NVME_NVM_COMMAND_READ                    = 0x00000002,
    NVME_NVM_COMMAND_WRITE_UNCORRECTABLE     = 0x00000004,
    NVME_NVM_COMMAND_COMPARE                 = 0x00000005,
    NVME_NVM_COMMAND_WRITE_ZEROES            = 0x00000008,
    NVME_NVM_COMMAND_DATASET_MANAGEMENT      = 0x00000009,
    NVME_NVM_COMMAND_VERIFY                  = 0x0000000c,
    NVME_NVM_COMMAND_RESERVATION_REGISTER    = 0x0000000d,
    NVME_NVM_COMMAND_RESERVATION_REPORT      = 0x0000000e,
    NVME_NVM_COMMAND_RESERVATION_ACQUIRE     = 0x00000011,
    NVME_NVM_COMMAND_RESERVATION_RELEASE     = 0x00000015,
    NVME_NVM_COMMAND_COPY                    = 0x00000019,
    NVME_NVM_COMMAND_ZONE_MANAGEMENT_SEND    = 0x00000079,
    NVME_NVM_COMMAND_ZONE_MANAGEMENT_RECEIVE = 0x0000007a,
    NVME_NVM_COMMAND_ZONE_APPEND             = 0x0000007d,
}

union NVME_CDW12_READ_WRITE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_ACCESS_FREQUENCIES = int;
enum : int
{
    NVME_ACCESS_FREQUENCY_NONE                 = 0x00000000,
    NVME_ACCESS_FREQUENCY_TYPICAL              = 0x00000001,
    NVME_ACCESS_FREQUENCY_INFR_WRITE_INFR_READ = 0x00000002,
    NVME_ACCESS_FREQUENCY_INFR_WRITE_FR_READ   = 0x00000003,
    NVME_ACCESS_FREQUENCY_FR_WRITE_INFR_READ   = 0x00000004,
    NVME_ACCESS_FREQUENCY_FR_WRITE_FR_READ     = 0x00000005,
    NVME_ACCESS_FREQUENCY_ONE_TIME_READ        = 0x00000006,
    NVME_ACCESS_FREQUENCY_SPECULATIVE_READ     = 0x00000007,
    NVME_ACCESS_FREQUENCY_WILL_BE_OVERWRITTEN  = 0x00000008,
}

alias NVME_ACCESS_LATENCIES = int;
enum : int
{
    NVME_ACCESS_LATENCY_NONE   = 0x00000000,
    NVME_ACCESS_LATENCY_IDLE   = 0x00000001,
    NVME_ACCESS_LATENCY_NORMAL = 0x00000002,
    NVME_ACCESS_LATENCY_LOW    = 0x00000003,
}

union NVME_CDW13_READ_WRITE
{
    struct
    {
        struct _DSM_e__Struct
        {
            ubyte _bitfield0;
        }
        ubyte Reserved;
        ushort DSPEC;
    }
    uint AsUlong;
}
union NVME_CDW15_READ_WRITE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CONTEXT_ATTRIBUTES
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_LBA_RANGE
{
    NVME_CONTEXT_ATTRIBUTES Attributes;
    uint LogicalBlockCount;
    ulong StartingLBA;
}
union NVME_CDW10_DATASET_MANAGEMENT
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW11_DATASET_MANAGEMENT
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_ZONE_DESCRIPTOR
{
    struct
    {
        ubyte _bitfield0;
    }
    struct
    {
        ubyte _bitfield1;
    }
    struct _ZA_e__Struct
    {
        ubyte _bitfield2;
    }
    ubyte[5] Reserved3;
    ulong ZCAP;
    ulong ZSLBA;
    ulong WritePointer;
    ubyte[32] Reserved4;
}
alias ZONE_STATE = int;
enum : int
{
    NVME_STATE_ZSE  = 0x00000001,
    NVME_STATE_ZSIO = 0x00000002,
    NVME_STATE_ZSEO = 0x00000003,
    NVME_STATE_ZSC  = 0x00000004,
    NVME_STATE_ZSRO = 0x0000000d,
    NVME_STATE_ZSF  = 0x0000000e,
    NVME_STATE_ZSO  = 0x0000000f,
}

alias NVME_ZONE_SEND_ACTION = int;
enum : int
{
    NVME_ZONE_SEND_CLOSE               = 0x00000001,
    NVME_ZONE_SEND_FINISH              = 0x00000002,
    NVME_ZONE_SEND_OPEN                = 0x00000003,
    NVME_ZONE_SEND_RESET               = 0x00000004,
    NVME_ZONE_SEND_OFFLINE             = 0x00000005,
    NVME_ZONE_SEND_SET_ZONE_DESCRIPTOR = 0x00000010,
}

struct NVME_CDW10_ZONE_MANAGEMENT_SEND
{
    ulong SLBA;
}
union NVME_CDW13_ZONE_MANAGEMENT_SEND
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_REPORT_ZONE_INFO
{
    ulong ZoneCount;
    ulong[7] Reserved;
    NVME_ZONE_DESCRIPTOR[1] ZoneDescriptor;
}
struct NVME_ZONE_DESCRIPTOR_EXTENSION
{
    ubyte[64] ZoneDescriptorExtensionInfo;
}
struct NVME_ZONE_EXTENDED_REPORT_ZONE_DESC
{
    NVME_ZONE_DESCRIPTOR ZoneDescriptor;
    NVME_ZONE_DESCRIPTOR_EXTENSION[1] ZoneDescriptorExtension;
}
struct NVME_EXTENDED_REPORT_ZONE_INFO
{
    ulong ZoneCount;
    ulong[7] Reserved;
    NVME_ZONE_EXTENDED_REPORT_ZONE_DESC[1] Desc;
}
alias NVME_ZONE_RECEIVE_ACTION = int;
enum : int
{
    NVME_ZONE_RECEIVE_REPORT_ZONES          = 0x00000000,
    NVME_ZONE_RECEIVE_EXTENDED_REPORT_ZONES = 0x00000001,
}

alias NVME_ZONE_RECEIVE_ACTION_SPECIFIC = int;
enum : int
{
    NVME_ZRA_ALL_ZONES           = 0x00000000,
    NVME_ZRA_EMPTY_STATE_ZONES   = 0x00000001,
    NVME_ZRA_IO_STATE_ZONES      = 0x00000002,
    NVME_ZRA_EO_STATE_ZONES      = 0x00000003,
    NVME_ZRA_CLOSED_STATE_ZONES  = 0x00000004,
    NVME_ZRA_FULL_STATE_ZONES    = 0x00000005,
    NVME_ZRA_RO_STATE_ZONES      = 0x00000006,
    NVME_ZRA_OFFLINE_STATE_ZONES = 0x00000007,
}

struct NVME_CDW10_ZONE_MANAGEMENT_RECEIVE
{
    ulong SLBA;
}
union NVME_CDW13_ZONE_MANAGEMENT_RECEIVE
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
struct NVME_CDW10_ZONE_APPEND
{
    ulong SLBA;
}
union NVME_CDW12_ZONE_APPEND
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_CDW15_ZONE_APPEND
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
union NVME_COMMAND_DWORD0
{
    struct
    {
        uint _bitfield0;
    }
    uint AsUlong;
}
alias NVME_FUSED_OPERATION_CODES = int;
enum : int
{
    NVME_FUSED_OPERATION_NORMAL     = 0x00000000,
    NVME_FUSED_OPERATION_FIRST_CMD  = 0x00000001,
    NVME_FUSED_OPERATION_SECOND_CMD = 0x00000002,
}

union NVME_PRP_ENTRY
{
    struct
    {
        ulong _bitfield0;
    }
    ulong AsUlonglong;
}
struct NVME_COMMAND
{
    NVME_COMMAND_DWORD0 CDW0;
    uint NSID;
    uint[2] Reserved0;
    ulong MPTR;
    ulong PRP1;
    ulong PRP2;
    union _u_e__Union
    {
        struct _GENERAL_e__Struct
        {
            uint CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _IDENTIFY_e__Struct
        {
            NVME_CDW10_IDENTIFY CDW10;
            NVME_CDW11_IDENTIFY CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _ABORT_e__Struct
        {
            NVME_CDW10_ABORT CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _GETFEATURES_e__Struct
        {
            NVME_CDW10_GET_FEATURES CDW10;
            NVME_CDW11_FEATURES CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _SETFEATURES_e__Struct
        {
            NVME_CDW10_SET_FEATURES CDW10;
            NVME_CDW11_FEATURES CDW11;
            NVME_CDW12_FEATURES CDW12;
            NVME_CDW13_FEATURES CDW13;
            NVME_CDW14_FEATURES CDW14;
            NVME_CDW15_FEATURES CDW15;
        }
        struct _GETLOGPAGE_e__Struct
        {
            union
            {
                NVME_CDW10_GET_LOG_PAGE CDW10;
                NVME_CDW10_GET_LOG_PAGE_V13 CDW10_V13;
            }
            NVME_CDW11_GET_LOG_PAGE CDW11;
            NVME_CDW12_GET_LOG_PAGE CDW12;
            NVME_CDW13_GET_LOG_PAGE CDW13;
            NVME_CDW14_GET_LOG_PAGE CDW14;
            uint CDW15;
        }
        struct _CREATEIOCQ_e__Struct
        {
            NVME_CDW10_CREATE_IO_QUEUE CDW10;
            NVME_CDW11_CREATE_IO_CQ CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _CREATEIOSQ_e__Struct
        {
            NVME_CDW10_CREATE_IO_QUEUE CDW10;
            NVME_CDW11_CREATE_IO_SQ CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _DATASETMANAGEMENT_e__Struct
        {
            NVME_CDW10_DATASET_MANAGEMENT CDW10;
            NVME_CDW11_DATASET_MANAGEMENT CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _SECURITYSEND_e__Struct
        {
            NVME_CDW10_SECURITY_SEND_RECEIVE CDW10;
            NVME_CDW11_SECURITY_SEND CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _SECURITYRECEIVE_e__Struct
        {
            NVME_CDW10_SECURITY_SEND_RECEIVE CDW10;
            NVME_CDW11_SECURITY_RECEIVE CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _FIRMWAREDOWNLOAD_e__Struct
        {
            NVME_CDW10_FIRMWARE_DOWNLOAD CDW10;
            NVME_CDW11_FIRMWARE_DOWNLOAD CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _FIRMWAREACTIVATE_e__Struct
        {
            NVME_CDW10_FIRMWARE_ACTIVATE CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _FORMATNVM_e__Struct
        {
            NVME_CDW10_FORMAT_NVM CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _DIRECTIVERECEIVE_e__Struct
        {
            NVME_CDW10_DIRECTIVE_RECEIVE CDW10;
            NVME_CDW11_DIRECTIVE_RECEIVE CDW11;
            NVME_CDW12_DIRECTIVE_RECEIVE CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _DIRECTIVESEND_e__Struct
        {
            NVME_CDW10_DIRECTIVE_SEND CDW10;
            NVME_CDW11_DIRECTIVE_SEND CDW11;
            NVME_CDW12_DIRECTIVE_SEND CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _SANITIZE_e__Struct
        {
            NVME_CDW10_SANITIZE CDW10;
            NVME_CDW11_SANITIZE CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _READWRITE_e__Struct
        {
            uint LBALOW;
            uint LBAHIGH;
            NVME_CDW12_READ_WRITE CDW12;
            NVME_CDW13_READ_WRITE CDW13;
            uint CDW14;
            NVME_CDW15_READ_WRITE CDW15;
        }
        struct _RESERVATIONACQUIRE_e__Struct
        {
            NVME_CDW10_RESERVATION_ACQUIRE CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _RESERVATIONREGISTER_e__Struct
        {
            NVME_CDW10_RESERVATION_REGISTER CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _RESERVATIONRELEASE_e__Struct
        {
            NVME_CDW10_RESERVATION_RELEASE CDW10;
            uint CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _RESERVATIONREPORT_e__Struct
        {
            NVME_CDW10_RESERVATION_REPORT CDW10;
            NVME_CDW11_RESERVATION_REPORT CDW11;
            uint CDW12;
            uint CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _ZONEMANAGEMENTSEND_e__Struct
        {
            NVME_CDW10_ZONE_MANAGEMENT_SEND CDW1011;
            uint CDW12;
            NVME_CDW13_ZONE_MANAGEMENT_SEND CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _ZONEMANAGEMENTRECEIVE_e__Struct
        {
            NVME_CDW10_ZONE_MANAGEMENT_RECEIVE CDW1011;
            uint DWORDCOUNT;
            NVME_CDW13_ZONE_MANAGEMENT_RECEIVE CDW13;
            uint CDW14;
            uint CDW15;
        }
        struct _ZONEAPPEND_e__Struct
        {
            NVME_CDW10_ZONE_APPEND CDW1011;
            NVME_CDW12_ZONE_APPEND CDW12;
            uint CDW13;
            uint ILBRT;
            NVME_CDW15_ZONE_APPEND CDW15;
        }
    }
}
struct NVME_SCSI_NAME_STRING
{
    CHAR[4] PCIVendorID;
    CHAR[40] ModelNumber;
    CHAR[4] NamespaceID;
    CHAR[20] SerialNumber;
}
