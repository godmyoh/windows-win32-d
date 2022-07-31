module windows.win32.system.eventcollector;

import windows.win32.foundation : BOOL, PWSTR;

version (Windows):
extern (Windows):

long EcOpenSubscriptionEnum(uint);
BOOL EcEnumNextSubscription(long, uint, PWSTR, uint*);
long EcOpenSubscription(const(wchar)*, uint, uint);
BOOL EcSetSubscriptionProperty(long, EC_SUBSCRIPTION_PROPERTY_ID, uint, EC_VARIANT*);
BOOL EcGetSubscriptionProperty(long, EC_SUBSCRIPTION_PROPERTY_ID, uint, uint, EC_VARIANT*, uint*);
BOOL EcSaveSubscription(long, uint);
BOOL EcDeleteSubscription(const(wchar)*, uint);
BOOL EcGetObjectArraySize(long, uint*);
BOOL EcSetObjectArrayProperty(long, EC_SUBSCRIPTION_PROPERTY_ID, uint, uint, EC_VARIANT*);
BOOL EcGetObjectArrayProperty(long, EC_SUBSCRIPTION_PROPERTY_ID, uint, uint, uint, EC_VARIANT*, uint*);
BOOL EcInsertObjectArrayElement(long, uint);
BOOL EcRemoveObjectArrayElement(long, uint);
BOOL EcGetSubscriptionRunTimeStatus(const(wchar)*, EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID, const(wchar)*, uint, uint, EC_VARIANT*, uint*);
BOOL EcRetrySubscription(const(wchar)*, const(wchar)*, uint);
BOOL EcClose(long);
enum EC_VARIANT_TYPE_MASK = 0x0000007f;
enum EC_VARIANT_TYPE_ARRAY = 0x00000080;
enum EC_READ_ACCESS = 0x00000001;
enum EC_WRITE_ACCESS = 0x00000002;
enum EC_OPEN_ALWAYS = 0x00000000;
enum EC_CREATE_NEW = 0x00000001;
enum EC_OPEN_EXISTING = 0x00000002;
alias EC_SUBSCRIPTION_PROPERTY_ID = int;
enum : int
{
    EcSubscriptionEnabled                      = 0x00000000,
    EcSubscriptionEventSources                 = 0x00000001,
    EcSubscriptionEventSourceAddress           = 0x00000002,
    EcSubscriptionEventSourceEnabled           = 0x00000003,
    EcSubscriptionEventSourceUserName          = 0x00000004,
    EcSubscriptionEventSourcePassword          = 0x00000005,
    EcSubscriptionDescription                  = 0x00000006,
    EcSubscriptionURI                          = 0x00000007,
    EcSubscriptionConfigurationMode            = 0x00000008,
    EcSubscriptionExpires                      = 0x00000009,
    EcSubscriptionQuery                        = 0x0000000a,
    EcSubscriptionTransportName                = 0x0000000b,
    EcSubscriptionTransportPort                = 0x0000000c,
    EcSubscriptionDeliveryMode                 = 0x0000000d,
    EcSubscriptionDeliveryMaxItems             = 0x0000000e,
    EcSubscriptionDeliveryMaxLatencyTime       = 0x0000000f,
    EcSubscriptionHeartbeatInterval            = 0x00000010,
    EcSubscriptionLocale                       = 0x00000011,
    EcSubscriptionContentFormat                = 0x00000012,
    EcSubscriptionLogFile                      = 0x00000013,
    EcSubscriptionPublisherName                = 0x00000014,
    EcSubscriptionCredentialsType              = 0x00000015,
    EcSubscriptionCommonUserName               = 0x00000016,
    EcSubscriptionCommonPassword               = 0x00000017,
    EcSubscriptionHostName                     = 0x00000018,
    EcSubscriptionReadExistingEvents           = 0x00000019,
    EcSubscriptionDialect                      = 0x0000001a,
    EcSubscriptionType                         = 0x0000001b,
    EcSubscriptionAllowedIssuerCAs             = 0x0000001c,
    EcSubscriptionAllowedSubjects              = 0x0000001d,
    EcSubscriptionDeniedSubjects               = 0x0000001e,
    EcSubscriptionAllowedSourceDomainComputers = 0x0000001f,
    EcSubscriptionPropertyIdEND                = 0x00000020,
}

alias EC_SUBSCRIPTION_CREDENTIALS_TYPE = int;
enum : int
{
    EcSubscriptionCredDefault      = 0x00000000,
    EcSubscriptionCredNegotiate    = 0x00000001,
    EcSubscriptionCredDigest       = 0x00000002,
    EcSubscriptionCredBasic        = 0x00000003,
    EcSubscriptionCredLocalMachine = 0x00000004,
}

alias EC_SUBSCRIPTION_TYPE = int;
enum : int
{
    EcSubscriptionTypeSourceInitiated    = 0x00000000,
    EcSubscriptionTypeCollectorInitiated = 0x00000001,
}

alias EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID = int;
enum : int
{
    EcSubscriptionRunTimeStatusActive            = 0x00000000,
    EcSubscriptionRunTimeStatusLastError         = 0x00000001,
    EcSubscriptionRunTimeStatusLastErrorMessage  = 0x00000002,
    EcSubscriptionRunTimeStatusLastErrorTime     = 0x00000003,
    EcSubscriptionRunTimeStatusNextRetryTime     = 0x00000004,
    EcSubscriptionRunTimeStatusEventSources      = 0x00000005,
    EcSubscriptionRunTimeStatusLastHeartbeatTime = 0x00000006,
    EcSubscriptionRunTimeStatusInfoIdEND         = 0x00000007,
}

alias EC_VARIANT_TYPE = int;
enum : int
{
    EcVarTypeNull                  = 0x00000000,
    EcVarTypeBoolean               = 0x00000001,
    EcVarTypeUInt32                = 0x00000002,
    EcVarTypeDateTime              = 0x00000003,
    EcVarTypeString                = 0x00000004,
    EcVarObjectArrayPropertyHandle = 0x00000005,
}

struct EC_VARIANT
{
    union
    {
        BOOL BooleanVal;
        uint UInt32Val;
        ulong DateTimeVal;
        const(wchar)* StringVal;
        ubyte* BinaryVal;
        BOOL* BooleanArr;
        int* Int32Arr;
        PWSTR* StringArr;
        long PropertyHandleVal;
    }
    uint Count;
    uint Type;
}
alias EC_SUBSCRIPTION_CONFIGURATION_MODE = int;
enum : int
{
    EcConfigurationModeNormal       = 0x00000000,
    EcConfigurationModeCustom       = 0x00000001,
    EcConfigurationModeMinLatency   = 0x00000002,
    EcConfigurationModeMinBandwidth = 0x00000003,
}

alias EC_SUBSCRIPTION_DELIVERY_MODE = int;
enum : int
{
    EcDeliveryModePull = 0x00000001,
    EcDeliveryModePush = 0x00000002,
}

alias EC_SUBSCRIPTION_CONTENT_FORMAT = int;
enum : int
{
    EcContentFormatEvents       = 0x00000001,
    EcContentFormatRenderedText = 0x00000002,
}

alias EC_SUBSCRIPTION_RUNTIME_STATUS_ACTIVE_STATUS = int;
enum : int
{
    EcRuntimeStatusActiveStatusDisabled = 0x00000001,
    EcRuntimeStatusActiveStatusActive   = 0x00000002,
    EcRuntimeStatusActiveStatusInactive = 0x00000003,
    EcRuntimeStatusActiveStatusTrying   = 0x00000004,
}

