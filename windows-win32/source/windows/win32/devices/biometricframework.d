module windows.win32.devices.biometricframework;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, HANDLE, HRESULT, HWND, POINT, PWSTR, RECT;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

alias WINBIO_SETTING_SOURCE = uint;
enum : uint
{
    WINBIO_SETTING_SOURCE_INVALID = 0x00000000,
    WINBIO_SETTING_SOURCE_DEFAULT = 0x00000001,
    WINBIO_SETTING_SOURCE_LOCAL   = 0x00000003,
    WINBIO_SETTING_SOURCE_POLICY  = 0x00000002,
}

alias WINBIO_COMPONENT = uint;
enum : uint
{
    WINBIO_COMPONENT_SENSOR  = 0x00000001,
    WINBIO_COMPONENT_ENGINE  = 0x00000002,
    WINBIO_COMPONENT_STORAGE = 0x00000003,
}

alias WINBIO_POOL = uint;
enum : uint
{
    WINBIO_POOL_SYSTEM  = 0x00000001,
    WINBIO_POOL_PRIVATE = 0x00000002,
}

HRESULT WinBioEnumServiceProviders(uint Factor, WINBIO_BSP_SCHEMA** BspSchemaArray, ulong* BspCount);
HRESULT WinBioEnumBiometricUnits(uint Factor, WINBIO_UNIT_SCHEMA** UnitSchemaArray, ulong* UnitCount);
HRESULT WinBioEnumDatabases(uint Factor, WINBIO_STORAGE_SCHEMA** StorageSchemaArray, ulong* StorageCount);
HRESULT WinBioAsyncOpenFramework(WINBIO_ASYNC_NOTIFICATION_METHOD NotificationMethod, HWND TargetWindow, uint MessageCode, PWINBIO_ASYNC_COMPLETION_CALLBACK CallbackRoutine, void* UserData, BOOL AsynchronousOpen, uint* FrameworkHandle);
HRESULT WinBioCloseFramework(uint FrameworkHandle);
HRESULT WinBioAsyncEnumServiceProviders(uint FrameworkHandle, uint Factor);
HRESULT WinBioAsyncEnumBiometricUnits(uint FrameworkHandle, uint Factor);
HRESULT WinBioAsyncEnumDatabases(uint FrameworkHandle, uint Factor);
HRESULT WinBioAsyncMonitorFrameworkChanges(uint FrameworkHandle, uint ChangeTypes);
HRESULT WinBioOpenSession(uint Factor, WINBIO_POOL PoolType, uint Flags, uint* UnitArray, ulong UnitCount, GUID* DatabaseId, uint* SessionHandle);
HRESULT WinBioAsyncOpenSession(uint Factor, WINBIO_POOL PoolType, uint Flags, uint* UnitArray, ulong UnitCount, GUID* DatabaseId, WINBIO_ASYNC_NOTIFICATION_METHOD NotificationMethod, HWND TargetWindow, uint MessageCode, PWINBIO_ASYNC_COMPLETION_CALLBACK CallbackRoutine, void* UserData, BOOL AsynchronousOpen, uint* SessionHandle);
HRESULT WinBioCloseSession(uint SessionHandle);
HRESULT WinBioVerify(uint SessionHandle, WINBIO_IDENTITY* Identity, ubyte SubFactor, uint* UnitId, ubyte* Match, uint* RejectDetail);
HRESULT WinBioVerifyWithCallback(uint SessionHandle, WINBIO_IDENTITY* Identity, ubyte SubFactor, PWINBIO_VERIFY_CALLBACK VerifyCallback, void* VerifyCallbackContext);
HRESULT WinBioIdentify(uint SessionHandle, uint* UnitId, WINBIO_IDENTITY* Identity, ubyte* SubFactor, uint* RejectDetail);
HRESULT WinBioIdentifyWithCallback(uint SessionHandle, PWINBIO_IDENTIFY_CALLBACK IdentifyCallback, void* IdentifyCallbackContext);
HRESULT WinBioWait(uint SessionHandle);
HRESULT WinBioCancel(uint SessionHandle);
HRESULT WinBioLocateSensor(uint SessionHandle, uint* UnitId);
HRESULT WinBioLocateSensorWithCallback(uint SessionHandle, PWINBIO_LOCATE_SENSOR_CALLBACK LocateCallback, void* LocateCallbackContext);
HRESULT WinBioEnrollBegin(uint SessionHandle, ubyte SubFactor, uint UnitId);
HRESULT WinBioEnrollSelect(uint SessionHandle, ulong SelectorValue);
HRESULT WinBioEnrollCapture(uint SessionHandle, uint* RejectDetail);
HRESULT WinBioEnrollCaptureWithCallback(uint SessionHandle, PWINBIO_ENROLL_CAPTURE_CALLBACK EnrollCallback, void* EnrollCallbackContext);
HRESULT WinBioEnrollCommit(uint SessionHandle, WINBIO_IDENTITY* Identity, ubyte* IsNewTemplate);
HRESULT WinBioEnrollDiscard(uint SessionHandle);
HRESULT WinBioEnumEnrollments(uint SessionHandle, uint UnitId, WINBIO_IDENTITY* Identity, ubyte** SubFactorArray, ulong* SubFactorCount);
HRESULT WinBioImproveBegin(uint SessionHandle, uint UnitId);
HRESULT WinBioImproveEnd(uint SessionHandle);
HRESULT WinBioRegisterEventMonitor(uint SessionHandle, uint EventMask, PWINBIO_EVENT_CALLBACK EventCallback, void* EventCallbackContext);
HRESULT WinBioUnregisterEventMonitor(uint SessionHandle);
HRESULT WinBioMonitorPresence(uint SessionHandle, uint UnitId);
HRESULT WinBioCaptureSample(uint SessionHandle, ubyte Purpose, ubyte Flags, uint* UnitId, WINBIO_BIR** Sample, ulong* SampleSize, uint* RejectDetail);
HRESULT WinBioCaptureSampleWithCallback(uint SessionHandle, ubyte Purpose, ubyte Flags, PWINBIO_CAPTURE_CALLBACK CaptureCallback, void* CaptureCallbackContext);
HRESULT WinBioDeleteTemplate(uint SessionHandle, uint UnitId, WINBIO_IDENTITY* Identity, ubyte SubFactor);
HRESULT WinBioLockUnit(uint SessionHandle, uint UnitId);
HRESULT WinBioUnlockUnit(uint SessionHandle, uint UnitId);
HRESULT WinBioControlUnit(uint SessionHandle, uint UnitId, WINBIO_COMPONENT Component, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
HRESULT WinBioControlUnitPrivileged(uint SessionHandle, uint UnitId, WINBIO_COMPONENT Component, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
HRESULT WinBioGetProperty(uint SessionHandle, uint PropertyType, uint PropertyId, uint UnitId, WINBIO_IDENTITY* Identity, ubyte SubFactor, void** PropertyBuffer, ulong* PropertyBufferSize);
HRESULT WinBioSetProperty(uint SessionHandle, uint PropertyType, uint PropertyId, uint UnitId, WINBIO_IDENTITY* Identity, ubyte SubFactor, void* PropertyBuffer, ulong PropertyBufferSize);
HRESULT WinBioFree(void* Address);
HRESULT WinBioSetCredential(WINBIO_CREDENTIAL_TYPE Type, ubyte* Credential, ulong CredentialSize, WINBIO_CREDENTIAL_FORMAT Format);
HRESULT WinBioRemoveCredential(WINBIO_IDENTITY Identity, WINBIO_CREDENTIAL_TYPE Type);
HRESULT WinBioRemoveAllCredentials();
HRESULT WinBioRemoveAllDomainCredentials();
HRESULT WinBioGetCredentialState(WINBIO_IDENTITY Identity, WINBIO_CREDENTIAL_TYPE Type, WINBIO_CREDENTIAL_STATE* CredentialState);
HRESULT WinBioLogonIdentifiedUser(uint SessionHandle);
HRESULT WinBioGetEnrolledFactors(WINBIO_IDENTITY* AccountOwner, uint* EnrolledFactors);
void WinBioGetEnabledSetting(ubyte* Value, WINBIO_SETTING_SOURCE* Source);
void WinBioGetLogonSetting(ubyte* Value, WINBIO_SETTING_SOURCE* Source);
void WinBioGetDomainLogonSetting(ubyte* Value, WINBIO_SETTING_SOURCE* Source);
HRESULT WinBioAcquireFocus();
HRESULT WinBioReleaseFocus();
enum WINBIO_MAX_STRING_LEN = 0x00000100;
enum WINBIO_SCP_VERSION_1 = 0x00000001;
enum WINBIO_SCP_RANDOM_SIZE_V1 = 0x00000020;
enum WINBIO_SCP_DIGEST_SIZE_V1 = 0x00000020;
enum WINBIO_SCP_CURVE_FIELD_SIZE_V1 = 0x00000020;
enum WINBIO_SCP_PUBLIC_KEY_SIZE_V1 = 0x00000041;
enum WINBIO_SCP_PRIVATE_KEY_SIZE_V1 = 0x00000020;
enum WINBIO_SCP_SIGNATURE_SIZE_V1 = 0x00000040;
enum WINBIO_SCP_ENCRYPTION_BLOCK_SIZE_V1 = 0x00000010;
enum WINBIO_SCP_ENCRYPTION_KEY_SIZE_V1 = 0x00000020;
enum WINBIO_BIR_ALIGN_SIZE = 0x00000008;
enum WINBIO_BIR_ALGIN_SIZE = 0x00000008;
enum WINBIO_DATA_FLAG_PRIVACY = 0x0002;
enum WINBIO_DATA_FLAG_INTEGRITY = 0x0001;
enum WINBIO_DATA_FLAG_SIGNED = 0x0004;
enum WINBIO_DATA_FLAG_RAW = 0x0020;
enum WINBIO_DATA_FLAG_INTERMEDIATE = 0x0040;
enum WINBIO_DATA_FLAG_PROCESSED = 0x0080;
enum WINBIO_DATA_FLAG_OPTION_MASK_PRESENT = 0x0008;
enum WINBIO_ANSI_381_PIXELS_PER_INCH = 0x0001;
enum WINBIO_ANSI_381_PIXELS_PER_CM = 0x0002;
enum WINBIO_ANSI_381_IMG_UNCOMPRESSED = 0x0000;
enum WINBIO_ANSI_381_IMG_BIT_PACKED = 0x0001;
enum WINBIO_ANSI_381_IMG_COMPRESSED_WSQ = 0x0002;
enum WINBIO_ANSI_381_IMG_COMPRESSED_JPEG = 0x0003;
enum WINBIO_ANSI_381_IMG_COMPRESSED_JPEG2000 = 0x0004;
enum WINBIO_ANSI_381_IMG_COMPRESSED_PNG = 0x0005;
enum WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_PLAIN = 0x0000;
enum WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_ROLLED = 0x0001;
enum WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_PLAIN = 0x0002;
enum WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_ROLLED = 0x0003;
enum WINBIO_ANSI_381_IMP_TYPE_LATENT = 0x0007;
enum WINBIO_ANSI_381_IMP_TYPE_SWIPE = 0x0008;
enum WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_CONTACTLESS = 0x0009;
enum FACILITY_WINBIO = 0x00000009;
enum FACILITY_NONE = 0x00000000;
enum WINBIO_E_UNSUPPORTED_FACTOR = 0xffffffff80098001;
enum WINBIO_E_INVALID_UNIT = 0xffffffff80098002;
enum WINBIO_E_UNKNOWN_ID = 0xffffffff80098003;
enum WINBIO_E_CANCELED = 0xffffffff80098004;
enum WINBIO_E_NO_MATCH = 0xffffffff80098005;
enum WINBIO_E_CAPTURE_ABORTED = 0xffffffff80098006;
enum WINBIO_E_ENROLLMENT_IN_PROGRESS = 0xffffffff80098007;
enum WINBIO_E_BAD_CAPTURE = 0xffffffff80098008;
enum WINBIO_E_INVALID_CONTROL_CODE = 0xffffffff80098009;
enum WINBIO_E_DATA_COLLECTION_IN_PROGRESS = 0xffffffff8009800b;
enum WINBIO_E_UNSUPPORTED_DATA_FORMAT = 0xffffffff8009800c;
enum WINBIO_E_UNSUPPORTED_DATA_TYPE = 0xffffffff8009800d;
enum WINBIO_E_UNSUPPORTED_PURPOSE = 0xffffffff8009800e;
enum WINBIO_E_INVALID_DEVICE_STATE = 0xffffffff8009800f;
enum WINBIO_E_DEVICE_BUSY = 0xffffffff80098010;
enum WINBIO_E_DATABASE_CANT_CREATE = 0xffffffff80098011;
enum WINBIO_E_DATABASE_CANT_OPEN = 0xffffffff80098012;
enum WINBIO_E_DATABASE_CANT_CLOSE = 0xffffffff80098013;
enum WINBIO_E_DATABASE_CANT_ERASE = 0xffffffff80098014;
enum WINBIO_E_DATABASE_CANT_FIND = 0xffffffff80098015;
enum WINBIO_E_DATABASE_ALREADY_EXISTS = 0xffffffff80098016;
enum WINBIO_E_DATABASE_FULL = 0xffffffff80098018;
enum WINBIO_E_DATABASE_LOCKED = 0xffffffff80098019;
enum WINBIO_E_DATABASE_CORRUPTED = 0xffffffff8009801a;
enum WINBIO_E_DATABASE_NO_SUCH_RECORD = 0xffffffff8009801b;
enum WINBIO_E_DUPLICATE_ENROLLMENT = 0xffffffff8009801c;
enum WINBIO_E_DATABASE_READ_ERROR = 0xffffffff8009801d;
enum WINBIO_E_DATABASE_WRITE_ERROR = 0xffffffff8009801e;
enum WINBIO_E_DATABASE_NO_RESULTS = 0xffffffff8009801f;
enum WINBIO_E_DATABASE_NO_MORE_RECORDS = 0xffffffff80098020;
enum WINBIO_E_DATABASE_EOF = 0xffffffff80098021;
enum WINBIO_E_DATABASE_BAD_INDEX_VECTOR = 0xffffffff80098022;
enum WINBIO_E_INCORRECT_BSP = 0xffffffff80098024;
enum WINBIO_E_INCORRECT_SENSOR_POOL = 0xffffffff80098025;
enum WINBIO_E_NO_CAPTURE_DATA = 0xffffffff80098026;
enum WINBIO_E_INVALID_SENSOR_MODE = 0xffffffff80098027;
enum WINBIO_E_LOCK_VIOLATION = 0xffffffff8009802a;
enum WINBIO_E_DUPLICATE_TEMPLATE = 0xffffffff8009802b;
enum WINBIO_E_INVALID_OPERATION = 0xffffffff8009802c;
enum WINBIO_E_SESSION_BUSY = 0xffffffff8009802d;
enum WINBIO_E_CRED_PROV_DISABLED = 0xffffffff80098030;
enum WINBIO_E_CRED_PROV_NO_CREDENTIAL = 0xffffffff80098031;
enum WINBIO_E_DISABLED = 0xffffffff80098032;
enum WINBIO_E_CONFIGURATION_FAILURE = 0xffffffff80098033;
enum WINBIO_E_SENSOR_UNAVAILABLE = 0xffffffff80098034;
enum WINBIO_E_SAS_ENABLED = 0xffffffff80098035;
enum WINBIO_E_DEVICE_FAILURE = 0xffffffff80098036;
enum WINBIO_E_FAST_USER_SWITCH_DISABLED = 0xffffffff80098037;
enum WINBIO_E_NOT_ACTIVE_CONSOLE = 0xffffffff80098038;
enum WINBIO_E_EVENT_MONITOR_ACTIVE = 0xffffffff80098039;
enum WINBIO_E_INVALID_PROPERTY_TYPE = 0xffffffff8009803a;
enum WINBIO_E_INVALID_PROPERTY_ID = 0xffffffff8009803b;
enum WINBIO_E_UNSUPPORTED_PROPERTY = 0xffffffff8009803c;
enum WINBIO_E_ADAPTER_INTEGRITY_FAILURE = 0xffffffff8009803d;
enum WINBIO_E_INCORRECT_SESSION_TYPE = 0xffffffff8009803e;
enum WINBIO_E_SESSION_HANDLE_CLOSED = 0xffffffff8009803f;
enum WINBIO_E_DEADLOCK_DETECTED = 0xffffffff80098040;
enum WINBIO_E_NO_PREBOOT_IDENTITY = 0xffffffff80098041;
enum WINBIO_E_MAX_ERROR_COUNT_EXCEEDED = 0xffffffff80098042;
enum WINBIO_E_AUTO_LOGON_DISABLED = 0xffffffff80098043;
enum WINBIO_E_INVALID_TICKET = 0xffffffff80098044;
enum WINBIO_E_TICKET_QUOTA_EXCEEDED = 0xffffffff80098045;
enum WINBIO_E_DATA_PROTECTION_FAILURE = 0xffffffff80098046;
enum WINBIO_E_CRED_PROV_SECURITY_LOCKOUT = 0xffffffff80098047;
enum WINBIO_E_UNSUPPORTED_POOL_TYPE = 0xffffffff80098048;
enum WINBIO_E_SELECTION_REQUIRED = 0xffffffff80098049;
enum WINBIO_E_PRESENCE_MONITOR_ACTIVE = 0xffffffff8009804a;
enum WINBIO_E_INVALID_SUBFACTOR = 0xffffffff8009804b;
enum WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY = 0xffffffff8009804c;
enum WINBIO_E_NO_SUPPORTED_CALIBRATION_FORMAT = 0xffffffff8009804d;
enum WINBIO_E_UNSUPPORTED_SENSOR_CALIBRATION_FORMAT = 0xffffffff8009804e;
enum WINBIO_E_CALIBRATION_BUFFER_TOO_SMALL = 0xffffffff8009804f;
enum WINBIO_E_CALIBRATION_BUFFER_TOO_LARGE = 0xffffffff80098050;
enum WINBIO_E_CALIBRATION_BUFFER_INVALID = 0xffffffff80098051;
enum WINBIO_E_INVALID_KEY_IDENTIFIER = 0xffffffff80098052;
enum WINBIO_E_KEY_CREATION_FAILED = 0xffffffff80098053;
enum WINBIO_E_KEY_IDENTIFIER_BUFFER_TOO_SMALL = 0xffffffff80098054;
enum WINBIO_E_PROPERTY_UNAVAILABLE = 0xffffffff80098055;
enum WINBIO_E_POLICY_PROTECTION_UNAVAILABLE = 0xffffffff80098056;
enum WINBIO_E_INSECURE_SENSOR = 0xffffffff80098057;
enum WINBIO_E_INVALID_BUFFER_ID = 0xffffffff80098058;
enum WINBIO_E_INVALID_BUFFER = 0xffffffff80098059;
enum WINBIO_E_TRUSTLET_INTEGRITY_FAIL = 0xffffffff8009805a;
enum WINBIO_E_ENROLLMENT_CANCELED_BY_SUSPEND = 0xffffffff8009805b;
enum WINBIO_I_MORE_DATA = 0x00090001;
enum WINBIO_I_EXTENDED_STATUS_INFORMATION = 0x00090002;
enum GUID_DEVINTERFACE_BIOMETRIC_READER = GUID(0xe2b5183a, 0x99ea, 0x4cc3, [0xad, 0x6b, 0x80, 0xca, 0x8d, 0x71, 0x5b, 0x80]);
enum IOCTL_BIOMETRIC_VENDOR = 0x00442000;
enum WINBIO_WBDI_MAJOR_VERSION = 0x00000001;
enum WINBIO_WBDI_MINOR_VERSION = 0x00000000;
alias WINIBIO_SENSOR_CONTEXT = long;
alias WINIBIO_ENGINE_CONTEXT = long;
alias WINIBIO_STORAGE_CONTEXT = long;
struct WINBIO_VERSION
{
    uint MajorVersion;
    uint MinorVersion;
}
struct WINBIO_IDENTITY
{
    uint Type;
    union Value
    {
        uint Null;
        uint Wildcard;
        GUID TemplateGuid;
        struct AccountSid
        {
            uint Size;
            ubyte[68] Data;
        }
        ubyte[32] SecureId;
    }
}
struct WINBIO_SECURE_CONNECTION_PARAMS
{
    uint PayloadSize;
    ushort Version;
    ushort Flags;
}
struct WINBIO_SECURE_CONNECTION_DATA
{
    uint Size;
    ushort Version;
    ushort Flags;
    uint ModelCertificateSize;
    uint IntermediateCA1Size;
    uint IntermediateCA2Size;
}
struct WINBIO_BIR_DATA
{
    uint Size;
    uint Offset;
}
struct WINBIO_BIR
{
    WINBIO_BIR_DATA HeaderBlock;
    WINBIO_BIR_DATA StandardDataBlock;
    WINBIO_BIR_DATA VendorDataBlock;
    WINBIO_BIR_DATA SignatureBlock;
}
struct WINBIO_REGISTERED_FORMAT
{
    ushort Owner;
    ushort Type;
}
struct WINBIO_BIR_HEADER
{
    ushort ValidFields;
    ubyte HeaderVersion;
    ubyte PatronHeaderVersion;
    ubyte DataFlags;
    uint Type;
    ubyte Subtype;
    ubyte Purpose;
    byte DataQuality;
    long CreationDate;
    struct ValidityPeriod
    {
        long BeginDate;
        long EndDate;
    }
    WINBIO_REGISTERED_FORMAT BiometricDataFormat;
    WINBIO_REGISTERED_FORMAT ProductId;
}
struct WINBIO_BDB_ANSI_381_HEADER
{
    ulong RecordLength;
    uint FormatIdentifier;
    uint VersionNumber;
    WINBIO_REGISTERED_FORMAT ProductId;
    ushort CaptureDeviceId;
    ushort ImageAcquisitionLevel;
    ushort HorizontalScanResolution;
    ushort VerticalScanResolution;
    ushort HorizontalImageResolution;
    ushort VerticalImageResolution;
    ubyte ElementCount;
    ubyte ScaleUnits;
    ubyte PixelDepth;
    ubyte ImageCompressionAlg;
    ushort Reserved;
}
struct WINBIO_BDB_ANSI_381_RECORD
{
    uint BlockLength;
    ushort HorizontalLineLength;
    ushort VerticalLineLength;
    ubyte Position;
    ubyte CountOfViews;
    ubyte ViewNumber;
    ubyte ImageQuality;
    ubyte ImpressionType;
    ubyte Reserved;
}
struct WINBIO_SECURE_BUFFER_HEADER_V1
{
    uint Type;
    uint Size;
    uint Flags;
    ulong ValidationTag;
}
struct WINBIO_EVENT
{
    uint Type;
    union Parameters
    {
        struct Unclaimed
        {
            uint UnitId;
            uint RejectDetail;
        }
        struct UnclaimedIdentify
        {
            uint UnitId;
            WINBIO_IDENTITY Identity;
            ubyte SubFactor;
            uint RejectDetail;
        }
        struct Error
        {
            HRESULT ErrorCode;
        }
    }
}
union WINBIO_PRESENCE_PROPERTIES
{
    struct FacialFeatures
    {
        RECT BoundingBox;
        int Distance;
        struct OpaqueEngineData
        {
            GUID AdapterId;
            uint[78] Data;
        }
    }
    struct Iris
    {
        RECT EyeBoundingBox_1;
        RECT EyeBoundingBox_2;
        POINT PupilCenter_1;
        POINT PupilCenter_2;
        int Distance;
    }
}
struct WINBIO_PRESENCE
{
    uint Factor;
    ubyte SubFactor;
    HRESULT Status;
    uint RejectDetail;
    WINBIO_IDENTITY Identity;
    ulong TrackingId;
    ulong Ticket;
    WINBIO_PRESENCE_PROPERTIES Properties;
    struct Authorization
    {
        uint Size;
        ubyte[32] Data;
    }
}
struct WINBIO_BSP_SCHEMA
{
    uint BiometricFactor;
    GUID BspId;
    ushort[256] Description;
    ushort[256] Vendor;
    WINBIO_VERSION Version;
}
struct WINBIO_UNIT_SCHEMA
{
    uint UnitId;
    uint PoolType;
    uint BiometricFactor;
    uint SensorSubType;
    uint Capabilities;
    ushort[256] DeviceInstanceId;
    ushort[256] Description;
    ushort[256] Manufacturer;
    ushort[256] Model;
    ushort[256] SerialNumber;
    WINBIO_VERSION FirmwareVersion;
}
struct WINBIO_STORAGE_SCHEMA
{
    uint BiometricFactor;
    GUID DatabaseId;
    GUID DataFormat;
    uint Attributes;
    ushort[256] FilePath;
    ushort[256] ConnectionString;
}
struct WINBIO_EXTENDED_SENSOR_INFO
{
    uint GenericSensorCapabilities;
    uint Factor;
    union Specific
    {
        uint Null;
        struct FacialFeatures
        {
            RECT FrameSize;
            POINT FrameOffset;
            uint MandatoryOrientation;
            struct HardwareInfo
            {
                wchar[260] ColorSensorId;
                wchar[260] InfraredSensorId;
                uint InfraredSensorRotationAngle;
            }
        }
        struct Fingerprint
        {
            uint Reserved;
        }
        struct Iris
        {
            RECT FrameSize;
            POINT FrameOffset;
            uint MandatoryOrientation;
        }
        struct Voice
        {
            uint Reserved;
        }
    }
}
struct WINBIO_EXTENDED_ENGINE_INFO
{
    uint GenericEngineCapabilities;
    uint Factor;
    union Specific
    {
        uint Null;
        struct FacialFeatures
        {
            uint Capabilities;
            struct EnrollmentRequirements
            {
                uint Null;
            }
        }
        struct Fingerprint
        {
            uint Capabilities;
            struct EnrollmentRequirements
            {
                uint GeneralSamples;
                uint Center;
                uint TopEdge;
                uint BottomEdge;
                uint LeftEdge;
                uint RightEdge;
            }
        }
        struct Iris
        {
            uint Capabilities;
            struct EnrollmentRequirements
            {
                uint Null;
            }
        }
        struct Voice
        {
            uint Capabilities;
            struct EnrollmentRequirements
            {
                uint Null;
            }
        }
    }
}
struct WINBIO_EXTENDED_STORAGE_INFO
{
    uint GenericStorageCapabilities;
    uint Factor;
    union Specific
    {
        uint Null;
        struct FacialFeatures
        {
            uint Capabilities;
        }
        struct Fingerprint
        {
            uint Capabilities;
        }
        struct Iris
        {
            uint Capabilities;
        }
        struct Voice
        {
            uint Capabilities;
        }
    }
}
struct WINBIO_EXTENDED_ENROLLMENT_STATUS
{
    HRESULT TemplateStatus;
    uint RejectDetail;
    uint PercentComplete;
    uint Factor;
    ubyte SubFactor;
    union Specific
    {
        uint Null;
        struct FacialFeatures
        {
            RECT BoundingBox;
            int Distance;
            struct OpaqueEngineData
            {
                GUID AdapterId;
                uint[78] Data;
            }
        }
        struct Fingerprint
        {
            uint GeneralSamples;
            uint Center;
            uint TopEdge;
            uint BottomEdge;
            uint LeftEdge;
            uint RightEdge;
        }
        struct Iris
        {
            RECT EyeBoundingBox_1;
            RECT EyeBoundingBox_2;
            POINT PupilCenter_1;
            POINT PupilCenter_2;
            int Distance;
            uint GridPointCompletionPercent;
            ushort GridPointIndex;
            struct Point3D
            {
                double X;
                double Y;
                double Z;
            }
            BOOL StopCaptureAndShowCriticalFeedback;
        }
        struct Voice
        {
            uint Reserved;
        }
    }
}
struct WINBIO_EXTENDED_UNIT_STATUS
{
    uint Availability;
    uint ReasonCode;
}
struct WINBIO_FP_BU_STATE
{
    BOOL SensorAttached;
    HRESULT CreationResult;
}
alias WINBIO_ANTI_SPOOF_POLICY_ACTION = int;
enum : int
{
    WINBIO_ANTI_SPOOF_DISABLE = 0x00000000,
    WINBIO_ANTI_SPOOF_ENABLE  = 0x00000001,
    WINBIO_ANTI_SPOOF_REMOVE  = 0x00000002,
}

alias WINBIO_POLICY_SOURCE = int;
enum : int
{
    WINBIO_POLICY_UNKNOWN = 0x00000000,
    WINBIO_POLICY_DEFAULT = 0x00000001,
    WINBIO_POLICY_LOCAL   = 0x00000002,
    WINBIO_POLICY_ADMIN   = 0x00000003,
}

struct WINBIO_ANTI_SPOOF_POLICY
{
    WINBIO_ANTI_SPOOF_POLICY_ACTION Action;
    WINBIO_POLICY_SOURCE Source;
}
alias WINBIO_CREDENTIAL_TYPE = int;
enum : int
{
    WINBIO_CREDENTIAL_PASSWORD = 0x00000001,
    WINBIO_CREDENTIAL_ALL      = 0xffffffff,
}

alias WINBIO_CREDENTIAL_FORMAT = int;
enum : int
{
    WINBIO_PASSWORD_GENERIC   = 0x00000001,
    WINBIO_PASSWORD_PACKED    = 0x00000002,
    WINBIO_PASSWORD_PROTECTED = 0x00000003,
}

alias WINBIO_CREDENTIAL_STATE = int;
enum : int
{
    WINBIO_CREDENTIAL_NOT_SET = 0x00000001,
    WINBIO_CREDENTIAL_SET     = 0x00000002,
}

struct WINBIO_EXTENDED_ENROLLMENT_PARAMETERS
{
    ulong Size;
    ubyte SubFactor;
}
struct WINBIO_ACCOUNT_POLICY
{
    WINBIO_IDENTITY Identity;
    WINBIO_ANTI_SPOOF_POLICY_ACTION AntiSpoofBehavior;
}
struct WINBIO_PROTECTION_POLICY
{
    uint Version;
    WINBIO_IDENTITY Identity;
    GUID DatabaseId;
    ulong UserState;
    ulong PolicySize;
    ubyte[128] Policy;
}
struct WINBIO_GESTURE_METADATA
{
    ulong Size;
    uint BiometricType;
    uint MatchType;
    uint ProtectionType;
}
alias WINBIO_ASYNC_NOTIFICATION_METHOD = int;
enum : int
{
    WINBIO_ASYNC_NOTIFY_NONE          = 0x00000000,
    WINBIO_ASYNC_NOTIFY_CALLBACK      = 0x00000001,
    WINBIO_ASYNC_NOTIFY_MESSAGE       = 0x00000002,
    WINBIO_ASYNC_NOTIFY_MAXIMUM_VALUE = 0x00000003,
}

struct WINBIO_ASYNC_RESULT
{
    uint SessionHandle;
    uint Operation;
    ulong SequenceNumber;
    long TimeStamp;
    HRESULT ApiStatus;
    uint UnitId;
    void* UserData;
    union Parameters
    {
        struct Verify
        {
            BOOLEAN Match;
            uint RejectDetail;
        }
        struct Identify
        {
            WINBIO_IDENTITY Identity;
            ubyte SubFactor;
            uint RejectDetail;
        }
        struct EnrollBegin
        {
            ubyte SubFactor;
        }
        struct EnrollCapture
        {
            uint RejectDetail;
        }
        struct EnrollCommit
        {
            WINBIO_IDENTITY Identity;
            BOOLEAN IsNewTemplate;
        }
        struct EnumEnrollments
        {
            WINBIO_IDENTITY Identity;
            ulong SubFactorCount;
            ubyte* SubFactorArray;
        }
        struct CaptureSample
        {
            WINBIO_BIR* Sample;
            ulong SampleSize;
            uint RejectDetail;
        }
        struct DeleteTemplate
        {
            WINBIO_IDENTITY Identity;
            ubyte SubFactor;
        }
        struct GetProperty
        {
            uint PropertyType;
            uint PropertyId;
            WINBIO_IDENTITY Identity;
            ubyte SubFactor;
            ulong PropertyBufferSize;
            void* PropertyBuffer;
        }
        struct SetProperty
        {
            uint PropertyType;
            uint PropertyId;
            WINBIO_IDENTITY Identity;
            ubyte SubFactor;
            ulong PropertyBufferSize;
            void* PropertyBuffer;
        }
        struct GetEvent
        {
            WINBIO_EVENT Event;
        }
        struct ControlUnit
        {
            WINBIO_COMPONENT Component;
            uint ControlCode;
            uint OperationStatus;
            ubyte* SendBuffer;
            ulong SendBufferSize;
            ubyte* ReceiveBuffer;
            ulong ReceiveBufferSize;
            ulong ReceiveDataSize;
        }
        struct EnumServiceProviders
        {
            ulong BspCount;
            WINBIO_BSP_SCHEMA* BspSchemaArray;
        }
        struct EnumBiometricUnits
        {
            ulong UnitCount;
            WINBIO_UNIT_SCHEMA* UnitSchemaArray;
        }
        struct EnumDatabases
        {
            ulong StorageCount;
            WINBIO_STORAGE_SCHEMA* StorageSchemaArray;
        }
        struct VerifyAndReleaseTicket
        {
            BOOLEAN Match;
            uint RejectDetail;
            ulong Ticket;
        }
        struct IdentifyAndReleaseTicket
        {
            WINBIO_IDENTITY Identity;
            ubyte SubFactor;
            uint RejectDetail;
            ulong Ticket;
        }
        struct EnrollSelect
        {
            ulong SelectorValue;
        }
        struct MonitorPresence
        {
            uint ChangeType;
            ulong PresenceCount;
            WINBIO_PRESENCE* PresenceArray;
        }
        struct GetProtectionPolicy
        {
            WINBIO_IDENTITY Identity;
            WINBIO_PROTECTION_POLICY Policy;
        }
        struct NotifyUnitStatusChange
        {
            WINBIO_EXTENDED_UNIT_STATUS ExtendedStatus;
        }
    }
}
alias PWINBIO_ASYNC_COMPLETION_CALLBACK = void function(WINBIO_ASYNC_RESULT* AsyncResult);
alias PWINBIO_VERIFY_CALLBACK = void function(void* VerifyCallbackContext, HRESULT OperationStatus, uint UnitId, BOOLEAN Match, uint RejectDetail);
alias PWINBIO_IDENTIFY_CALLBACK = void function(void* IdentifyCallbackContext, HRESULT OperationStatus, uint UnitId, WINBIO_IDENTITY* Identity, ubyte SubFactor, uint RejectDetail);
alias PWINBIO_LOCATE_SENSOR_CALLBACK = void function(void* LocateCallbackContext, HRESULT OperationStatus, uint UnitId);
alias PWINBIO_ENROLL_CAPTURE_CALLBACK = void function(void* EnrollCallbackContext, HRESULT OperationStatus, uint RejectDetail);
alias PWINBIO_EVENT_CALLBACK = void function(void* EventCallbackContext, HRESULT OperationStatus, WINBIO_EVENT* Event);
alias PWINBIO_CAPTURE_CALLBACK = void function(void* CaptureCallbackContext, HRESULT OperationStatus, uint UnitId, WINBIO_BIR* Sample, ulong SampleSize, uint RejectDetail);
struct WINBIO_STORAGE_RECORD
{
    WINBIO_IDENTITY* Identity;
    ubyte SubFactor;
    uint* IndexVector;
    ulong IndexElementCount;
    ubyte* TemplateBlob;
    ulong TemplateBlobSize;
    ubyte* PayloadBlob;
    ulong PayloadBlobSize;
}
struct WINBIO_PIPELINE
{
    HANDLE SensorHandle;
    HANDLE EngineHandle;
    HANDLE StorageHandle;
    WINBIO_SENSOR_INTERFACE* SensorInterface;
    WINBIO_ENGINE_INTERFACE* EngineInterface;
    WINBIO_STORAGE_INTERFACE* StorageInterface;
    WINIBIO_SENSOR_CONTEXT* SensorContext;
    WINIBIO_ENGINE_CONTEXT* EngineContext;
    WINIBIO_STORAGE_CONTEXT* StorageContext;
    WINBIO_FRAMEWORK_INTERFACE* FrameworkInterface;
}
struct WINBIO_ADAPTER_INTERFACE_VERSION
{
    ushort MajorVersion;
    ushort MinorVersion;
}
alias PIBIO_SENSOR_ATTACH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_DETACH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_CLEAR_CONTEXT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_QUERY_STATUS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint* Status);
alias PIBIO_SENSOR_RESET_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_SET_MODE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint Mode);
alias PIBIO_SENSOR_SET_INDICATOR_STATUS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint IndicatorStatus);
alias PIBIO_SENSOR_GET_INDICATOR_STATUS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint* IndicatorStatus);
alias PIBIO_SENSOR_START_CAPTURE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte Purpose, OVERLAPPED** Overlapped);
alias PIBIO_SENSOR_FINISH_CAPTURE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint* RejectDetail);
alias PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_BIR** SampleBuffer, ulong* SampleSize);
alias PIBIO_SENSOR_CANCEL_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte Purpose, ubyte Flags, uint* RejectDetail);
alias PIBIO_SENSOR_CONTROL_UNIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
alias PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
alias PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint PowerEventType);
alias PIBIO_SENSOR_PIPELINE_INIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_PIPELINE_CLEANUP_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_ACTIVATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_DEACTIVATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_EXTENDED_SENSOR_INFO* SensorInfo, ulong SensorInfoSize);
alias PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* FormatArray, ulong FormatArraySize, ulong* FormatCount);
alias PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* Format);
alias PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte* CalibrationBuffer, ulong CalibrationBufferSize);
alias PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte* RawBufferAddress, ulong RawBufferSize, ubyte** ResultBufferAddress, ulong* ResultBufferSize);
alias PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID SecureBufferIdentifier, ubyte* MetadataBufferAddress, ulong MetadataBufferSize, ubyte** ResultBufferAddress, ulong* ResultBufferSize);
alias PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte* TypeInfoBufferAddress, ulong TypeInfoBufferSize, ulong* TypeInfoDataSize);
alias PIBIO_SENSOR_CONNECT_SECURE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, const(WINBIO_SECURE_CONNECTION_PARAMS)* ConnectionParams, WINBIO_SECURE_CONNECTION_DATA** ConnectionData);
alias PIBIO_SENSOR_START_CAPTURE_EX_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte Purpose, const(ubyte)* Nonce, ulong NonceSize, ubyte Flags, OVERLAPPED** Overlapped);
alias PIBIO_SENSOR_START_NOTIFY_WAKE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, OVERLAPPED** Overlapped);
alias PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint* Reason);
struct WINBIO_SENSOR_INTERFACE
{
    WINBIO_ADAPTER_INTERFACE_VERSION Version;
    uint Type;
    ulong Size;
    GUID AdapterId;
    PIBIO_SENSOR_ATTACH_FN Attach;
    PIBIO_SENSOR_DETACH_FN Detach;
    PIBIO_SENSOR_CLEAR_CONTEXT_FN ClearContext;
    PIBIO_SENSOR_QUERY_STATUS_FN QueryStatus;
    PIBIO_SENSOR_RESET_FN Reset;
    PIBIO_SENSOR_SET_MODE_FN SetMode;
    PIBIO_SENSOR_SET_INDICATOR_STATUS_FN SetIndicatorStatus;
    PIBIO_SENSOR_GET_INDICATOR_STATUS_FN GetIndicatorStatus;
    PIBIO_SENSOR_START_CAPTURE_FN StartCapture;
    PIBIO_SENSOR_FINISH_CAPTURE_FN FinishCapture;
    PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN ExportSensorData;
    PIBIO_SENSOR_CANCEL_FN Cancel;
    PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN PushDataToEngine;
    PIBIO_SENSOR_CONTROL_UNIT_FN ControlUnit;
    PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN ControlUnitPrivileged;
    PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN NotifyPowerChange;
    PIBIO_SENSOR_PIPELINE_INIT_FN PipelineInit;
    PIBIO_SENSOR_PIPELINE_CLEANUP_FN PipelineCleanup;
    PIBIO_SENSOR_ACTIVATE_FN Activate;
    PIBIO_SENSOR_DEACTIVATE_FN Deactivate;
    PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN QueryExtendedInfo;
    PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN QueryCalibrationFormats;
    PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN SetCalibrationFormat;
    PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN AcceptCalibrationData;
    PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN AsyncImportRawBuffer;
    PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN AsyncImportSecureBuffer;
    PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN QueryPrivateSensorType;
    PIBIO_SENSOR_CONNECT_SECURE_FN ConnectSecure;
    PIBIO_SENSOR_START_CAPTURE_EX_FN StartCaptureEx;
    PIBIO_SENSOR_START_NOTIFY_WAKE_FN StartNotifyWake;
    PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN FinishNotifyWake;
}
alias PWINBIO_QUERY_SENSOR_INTERFACE_FN = HRESULT function(WINBIO_SENSOR_INTERFACE** SensorInterface);
alias PIBIO_ENGINE_ATTACH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_DETACH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_CLEAR_CONTEXT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_REGISTERED_FORMAT* StandardFormat, GUID* VendorFormat);
alias PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* IndexElementCount);
alias PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* AlgorithmCount, ulong* AlgorithmBufferSize, ubyte** AlgorithmBuffer);
alias PIBIO_ENGINE_SET_HASH_ALGORITHM_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong AlgorithmBufferSize, ubyte* AlgorithmBuffer);
alias PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* SampleHint);
alias PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_BIR* SampleBuffer, ulong SampleSize, ubyte Purpose, uint* RejectDetail);
alias PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte Flags, WINBIO_BIR** SampleBuffer, ulong* SampleSize);
alias PIBIO_ENGINE_VERIFY_FEATURE_SET_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte SubFactor, BOOLEAN* Match, ubyte** PayloadBlob, ulong* PayloadBlobSize, ubyte** HashValue, ulong* HashSize, uint* RejectDetail);
alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte* SubFactor, ubyte** PayloadBlob, ulong* PayloadBlobSize, ubyte** HashValue, ulong* HashSize, uint* RejectDetail);
alias PIBIO_ENGINE_CREATE_ENROLLMENT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_UPDATE_ENROLLMENT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint* RejectDetail);
alias PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint* RejectDetail);
alias PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte** HashValue, ulong* HashSize);
alias PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte* SubFactor, BOOLEAN* Duplicate);
alias PIBIO_ENGINE_COMMIT_ENROLLMENT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte SubFactor, ubyte* PayloadBlob, ulong PayloadBlobSize);
alias PIBIO_ENGINE_DISCARD_ENROLLMENT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_CONTROL_UNIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
alias PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
alias PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint PowerEventType);
alias PIBIO_ENGINE_RESERVED_1_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity);
alias PIBIO_ENGINE_PIPELINE_INIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_PIPELINE_CLEANUP_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_ACTIVATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_DEACTIVATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_EXTENDED_ENGINE_INFO* EngineInfo, ulong EngineInfoSize);
alias PIBIO_ENGINE_IDENTIFY_ALL_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* PresenceCount, WINBIO_PRESENCE** PresenceArray);
alias PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong SelectorValue);
alias PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_EXTENDED_ENROLLMENT_PARAMETERS* Parameters);
alias PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_EXTENDED_ENROLLMENT_STATUS* EnrollmentStatus, ulong EnrollmentStatusSize);
alias PIBIO_ENGINE_REFRESH_CACHE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* FormatArray, ulong FormatCount, GUID* SelectedFormat, ulong* MaxBufferSize);
alias PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, BOOLEAN* DiscardAndRepeatCapture, ubyte* CalibrationBuffer, ulong* CalibrationBufferSize, ulong MaxBufferSize);
alias PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_ACCOUNT_POLICY* PolicyItemArray, ulong PolicyItemCount);
alias PIBIO_ENGINE_CREATE_KEY_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, const(ubyte)* Key, ulong KeySize, ubyte* KeyIdentifier, ulong KeyIdentifierSize, ulong* ResultSize);
alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, const(ubyte)* Nonce, ulong NonceSize, const(ubyte)* KeyIdentifier, ulong KeyIdentifierSize, WINBIO_IDENTITY* Identity, ubyte* SubFactor, uint* RejectDetail, ubyte** Authorization, ulong* AuthorizationSize);
alias PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, const(ubyte)* TypeInfoBufferAddress, ulong TypeInfoBufferSize);
alias PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte** Nonce, ulong* NonceSize);
alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, const(ubyte)* Nonce, ulong NonceSize, WINBIO_IDENTITY* Identity, ubyte* SubFactor, uint* RejectDetail, ubyte** Authentication, ulong* AuthenticationSize);
struct WINBIO_ENGINE_INTERFACE
{
    WINBIO_ADAPTER_INTERFACE_VERSION Version;
    uint Type;
    ulong Size;
    GUID AdapterId;
    PIBIO_ENGINE_ATTACH_FN Attach;
    PIBIO_ENGINE_DETACH_FN Detach;
    PIBIO_ENGINE_CLEAR_CONTEXT_FN ClearContext;
    PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN QueryPreferredFormat;
    PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN QueryIndexVectorSize;
    PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN QueryHashAlgorithms;
    PIBIO_ENGINE_SET_HASH_ALGORITHM_FN SetHashAlgorithm;
    PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN QuerySampleHint;
    PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN AcceptSampleData;
    PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN ExportEngineData;
    PIBIO_ENGINE_VERIFY_FEATURE_SET_FN VerifyFeatureSet;
    PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN IdentifyFeatureSet;
    PIBIO_ENGINE_CREATE_ENROLLMENT_FN CreateEnrollment;
    PIBIO_ENGINE_UPDATE_ENROLLMENT_FN UpdateEnrollment;
    PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN GetEnrollmentStatus;
    PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN GetEnrollmentHash;
    PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN CheckForDuplicate;
    PIBIO_ENGINE_COMMIT_ENROLLMENT_FN CommitEnrollment;
    PIBIO_ENGINE_DISCARD_ENROLLMENT_FN DiscardEnrollment;
    PIBIO_ENGINE_CONTROL_UNIT_FN ControlUnit;
    PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN ControlUnitPrivileged;
    PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN NotifyPowerChange;
    PIBIO_ENGINE_RESERVED_1_FN Reserved_1;
    PIBIO_ENGINE_PIPELINE_INIT_FN PipelineInit;
    PIBIO_ENGINE_PIPELINE_CLEANUP_FN PipelineCleanup;
    PIBIO_ENGINE_ACTIVATE_FN Activate;
    PIBIO_ENGINE_DEACTIVATE_FN Deactivate;
    PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN QueryExtendedInfo;
    PIBIO_ENGINE_IDENTIFY_ALL_FN IdentifyAll;
    PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN SetEnrollmentSelector;
    PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN SetEnrollmentParameters;
    PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN QueryExtendedEnrollmentStatus;
    PIBIO_ENGINE_REFRESH_CACHE_FN RefreshCache;
    PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN SelectCalibrationFormat;
    PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN QueryCalibrationData;
    PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN SetAccountPolicy;
    PIBIO_ENGINE_CREATE_KEY_FN CreateKey;
    PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN IdentifyFeatureSetSecure;
    PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN AcceptPrivateSensorTypeInfo;
    PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN CreateEnrollmentAuthenticated;
    PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN IdentifyFeatureSetAuthenticated;
}
alias PWINBIO_QUERY_ENGINE_INTERFACE_FN = HRESULT function(WINBIO_ENGINE_INTERFACE** EngineInterface);
alias PIBIO_STORAGE_ATTACH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_DETACH_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_CLEAR_CONTEXT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_CREATE_DATABASE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* DatabaseId, uint Factor, GUID* Format, const(wchar)* FilePath, const(wchar)* ConnectString, ulong IndexElementCount, ulong InitialSize);
alias PIBIO_STORAGE_ERASE_DATABASE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* DatabaseId, const(wchar)* FilePath, const(wchar)* ConnectString);
alias PIBIO_STORAGE_OPEN_DATABASE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* DatabaseId, const(wchar)* FilePath, const(wchar)* ConnectString);
alias PIBIO_STORAGE_CLOSE_DATABASE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_GET_DATA_FORMAT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID* Format, WINBIO_VERSION* Version);
alias PIBIO_STORAGE_GET_DATABASE_SIZE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* AvailableRecordCount, ulong* TotalRecordCount);
alias PIBIO_STORAGE_ADD_RECORD_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_STORAGE_RECORD* RecordContents);
alias PIBIO_STORAGE_DELETE_RECORD_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte SubFactor);
alias PIBIO_STORAGE_QUERY_BY_SUBJECT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte SubFactor);
alias PIBIO_STORAGE_QUERY_BY_CONTENT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte SubFactor, uint* IndexVector, ulong IndexElementCount);
alias PIBIO_STORAGE_GET_RECORD_COUNT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* RecordCount);
alias PIBIO_STORAGE_FIRST_RECORD_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_NEXT_RECORD_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_GET_CURRENT_RECORD_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_STORAGE_RECORD* RecordContents);
alias PIBIO_STORAGE_CONTROL_UNIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
alias PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint ControlCode, ubyte* SendBuffer, ulong SendBufferSize, ubyte* ReceiveBuffer, ulong ReceiveBufferSize, ulong* ReceiveDataSize, uint* OperationStatus);
alias PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint PowerEventType);
alias PIBIO_STORAGE_PIPELINE_INIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_PIPELINE_CLEANUP_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_ACTIVATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_DEACTIVATE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_EXTENDED_STORAGE_INFO* StorageInfo, ulong StorageInfoSize);
alias PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, BOOLEAN RecordsAdded);
alias PIBIO_STORAGE_RESERVED_1_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ulong* Reserved1, ulong* Reserved2);
alias PIBIO_STORAGE_RESERVED_2_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity);
alias PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ubyte SubFactor, WINBIO_STORAGE_RECORD* RecordContents);
alias PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_STORAGE_RECORD* RecordContents);
struct WINBIO_STORAGE_INTERFACE
{
    WINBIO_ADAPTER_INTERFACE_VERSION Version;
    uint Type;
    ulong Size;
    GUID AdapterId;
    PIBIO_STORAGE_ATTACH_FN Attach;
    PIBIO_STORAGE_DETACH_FN Detach;
    PIBIO_STORAGE_CLEAR_CONTEXT_FN ClearContext;
    PIBIO_STORAGE_CREATE_DATABASE_FN CreateDatabase;
    PIBIO_STORAGE_ERASE_DATABASE_FN EraseDatabase;
    PIBIO_STORAGE_OPEN_DATABASE_FN OpenDatabase;
    PIBIO_STORAGE_CLOSE_DATABASE_FN CloseDatabase;
    PIBIO_STORAGE_GET_DATA_FORMAT_FN GetDataFormat;
    PIBIO_STORAGE_GET_DATABASE_SIZE_FN GetDatabaseSize;
    PIBIO_STORAGE_ADD_RECORD_FN AddRecord;
    PIBIO_STORAGE_DELETE_RECORD_FN DeleteRecord;
    PIBIO_STORAGE_QUERY_BY_SUBJECT_FN QueryBySubject;
    PIBIO_STORAGE_QUERY_BY_CONTENT_FN QueryByContent;
    PIBIO_STORAGE_GET_RECORD_COUNT_FN GetRecordCount;
    PIBIO_STORAGE_FIRST_RECORD_FN FirstRecord;
    PIBIO_STORAGE_NEXT_RECORD_FN NextRecord;
    PIBIO_STORAGE_GET_CURRENT_RECORD_FN GetCurrentRecord;
    PIBIO_STORAGE_CONTROL_UNIT_FN ControlUnit;
    PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN ControlUnitPrivileged;
    PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN NotifyPowerChange;
    PIBIO_STORAGE_PIPELINE_INIT_FN PipelineInit;
    PIBIO_STORAGE_PIPELINE_CLEANUP_FN PipelineCleanup;
    PIBIO_STORAGE_ACTIVATE_FN Activate;
    PIBIO_STORAGE_DEACTIVATE_FN Deactivate;
    PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN QueryExtendedInfo;
    PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN NotifyDatabaseChange;
    PIBIO_STORAGE_RESERVED_1_FN Reserved1;
    PIBIO_STORAGE_RESERVED_2_FN Reserved2;
    PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN UpdateRecordBegin;
    PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN UpdateRecordCommit;
}
alias PWINBIO_QUERY_STORAGE_INTERFACE_FN = HRESULT function(WINBIO_STORAGE_INTERFACE** StorageInterface);
alias PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_EXTENDED_UNIT_STATUS* ExtendedStatus, ulong ExtendedStatusSize);
alias PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong RequiredCapacity, ulong* MaxBufferSize);
alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte* BufferAddress, ulong BufferSize);
alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong* RequiredCapacity, ulong* MaxBufferSize);
alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte* BufferAddress, ulong BufferSize, ulong* ReturnedDataSize);
alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong Reserved1, ulong* Reserved2);
alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ubyte* Reserved1, ulong Reserved2);
alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN = HRESULT function(WINBIO_PIPELINE* Pipeline);
alias PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, ulong AllocationSize, void** Address);
alias PIBIO_FRAMEWORK_FREE_MEMORY_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, void* Address);
alias PIBIO_FRAMEWORK_GET_PROPERTY_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, uint PropertyType, uint PropertyId, WINBIO_IDENTITY* Identity, ubyte SubFactor, void** PropertyBuffer, ulong* PropertyBufferSize);
alias PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID SecureBufferIdentifier, void** SecureBufferAddress, ulong* SecureBufferSize);
alias PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, GUID SecureBufferIdentifier);
alias PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, WINBIO_IDENTITY* Identity, ulong* SecureIdentityCount, WINBIO_IDENTITY** SecureIdentities);
alias PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN = HRESULT function(WINBIO_PIPELINE* Pipeline, const(ubyte)* Authentication, ulong AuthenticationSize, const(ubyte)* Iv, ulong IvSize, ubyte* EncryptedData, ulong EncryptedDataSize);
struct WINBIO_FRAMEWORK_INTERFACE
{
    WINBIO_ADAPTER_INTERFACE_VERSION Version;
    uint Type;
    ulong Size;
    GUID AdapterId;
    PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN SetUnitStatus;
    PIBIO_STORAGE_ATTACH_FN VsmStorageAttach;
    PIBIO_STORAGE_DETACH_FN VsmStorageDetach;
    PIBIO_STORAGE_CLEAR_CONTEXT_FN VsmStorageClearContext;
    PIBIO_STORAGE_CREATE_DATABASE_FN VsmStorageCreateDatabase;
    PIBIO_STORAGE_OPEN_DATABASE_FN VsmStorageOpenDatabase;
    PIBIO_STORAGE_CLOSE_DATABASE_FN VsmStorageCloseDatabase;
    PIBIO_STORAGE_DELETE_RECORD_FN VsmStorageDeleteRecord;
    PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN VsmStorageNotifyPowerChange;
    PIBIO_STORAGE_PIPELINE_INIT_FN VsmStoragePipelineInit;
    PIBIO_STORAGE_PIPELINE_CLEANUP_FN VsmStoragePipelineCleanup;
    PIBIO_STORAGE_ACTIVATE_FN VsmStorageActivate;
    PIBIO_STORAGE_DEACTIVATE_FN VsmStorageDeactivate;
    PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN VsmStorageQueryExtendedInfo;
    PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN VsmStorageCacheClear;
    PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN VsmStorageCacheImportBegin;
    PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN VsmStorageCacheImportNext;
    PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN VsmStorageCacheImportEnd;
    PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN VsmStorageCacheExportBegin;
    PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN VsmStorageCacheExportNext;
    PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN VsmStorageCacheExportEnd;
    PIBIO_SENSOR_ATTACH_FN VsmSensorAttach;
    PIBIO_SENSOR_DETACH_FN VsmSensorDetach;
    PIBIO_SENSOR_CLEAR_CONTEXT_FN VsmSensorClearContext;
    PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN VsmSensorPushDataToEngine;
    PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN VsmSensorNotifyPowerChange;
    PIBIO_SENSOR_PIPELINE_INIT_FN VsmSensorPipelineInit;
    PIBIO_SENSOR_PIPELINE_CLEANUP_FN VsmSensorPipelineCleanup;
    PIBIO_SENSOR_ACTIVATE_FN VsmSensorActivate;
    PIBIO_SENSOR_DEACTIVATE_FN VsmSensorDeactivate;
    PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN VsmSensorAsyncImportRawBuffer;
    PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN VsmSensorAsyncImportSecureBuffer;
    PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN Reserved1;
    PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN Reserved2;
    PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN Reserved3;
    PIBIO_STORAGE_RESERVED_1_FN Reserved4;
    PIBIO_STORAGE_RESERVED_2_FN Reserved5;
    PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN AllocateMemory;
    PIBIO_FRAMEWORK_FREE_MEMORY_FN FreeMemory;
    PIBIO_FRAMEWORK_GET_PROPERTY_FN GetProperty;
    PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN LockAndValidateSecureBuffer;
    PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN ReleaseSecureBuffer;
    PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN QueryAuthorizedEnrollments;
    PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN DecryptSample;
}
struct WINBIO_SENSOR_ATTRIBUTES
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    WINBIO_VERSION WinBioVersion;
    uint SensorType;
    uint SensorSubType;
    uint Capabilities;
    ushort[256] ManufacturerName;
    ushort[256] ModelName;
    ushort[256] SerialNumber;
    WINBIO_VERSION FirmwareVersion;
    uint SupportedFormatEntries;
    WINBIO_REGISTERED_FORMAT[1] SupportedFormat;
}
struct WINBIO_DATA
{
    uint Size;
    ubyte[1] Data;
}
struct WINBIO_UPDATE_FIRMWARE
{
    uint PayloadSize;
    WINBIO_DATA FirmwareData;
}
struct WINBIO_CALIBRATION_INFO
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    WINBIO_DATA CalibrationData;
}
struct WINBIO_DIAGNOSTICS
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    uint SensorStatus;
    WINBIO_DATA VendorDiagnostics;
}
struct WINBIO_BLANK_PAYLOAD
{
    uint PayloadSize;
    HRESULT WinBioHresult;
}
struct WINBIO_CAPTURE_PARAMETERS
{
    uint PayloadSize;
    ubyte Purpose;
    WINBIO_REGISTERED_FORMAT Format;
    GUID VendorFormat;
    ubyte Flags;
}
struct WINBIO_CAPTURE_DATA
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    uint SensorStatus;
    uint RejectDetail;
    WINBIO_DATA CaptureData;
}
struct WINBIO_SUPPORTED_ALGORITHMS
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    uint NumberOfAlgorithms;
    WINBIO_DATA AlgorithmData;
}
struct WINBIO_GET_INDICATOR
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    uint IndicatorStatus;
}
struct WINBIO_SET_INDICATOR
{
    uint PayloadSize;
    uint IndicatorStatus;
}
struct WINBIO_PRIVATE_SENSOR_TYPE_INFO
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    WINBIO_DATA PrivateSensorTypeInfo;
}
struct WINBIO_ENCRYPTED_CAPTURE_PARAMS
{
    uint PayloadSize;
    ubyte Purpose;
    WINBIO_REGISTERED_FORMAT Format;
    GUID VendorFormat;
    ubyte Flags;
    uint NonceSize;
}
struct WINBIO_NOTIFY_WAKE
{
    uint PayloadSize;
    HRESULT WinBioHresult;
    uint Reason;
}
