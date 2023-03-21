module windows.win32.devices.devicequery;

import windows.win32.devices.properties : DEVPROPCOMPKEY, DEVPROPERTY, DEVPROPKEY, DEVPROPSTORE, DEVPROPTYPE;
import windows.win32.foundation : HRESULT, PWSTR;

version (Windows):
extern (Windows):

alias DEVPROP_OPERATOR = uint;
enum : uint
{
    DEVPROP_OPERATOR_MODIFIER_NOT                         = 0x00010000,
    DEVPROP_OPERATOR_MODIFIER_IGNORE_CASE                 = 0x00020000,
    DEVPROP_OPERATOR_NONE                                 = 0x00000000,
    DEVPROP_OPERATOR_EXISTS                               = 0x00000001,
    DEVPROP_OPERATOR_NOT_EXISTS                           = 0x00010001,
    DEVPROP_OPERATOR_EQUALS                               = 0x00000002,
    DEVPROP_OPERATOR_NOT_EQUALS                           = 0x00010002,
    DEVPROP_OPERATOR_GREATER_THAN                         = 0x00000003,
    DEVPROP_OPERATOR_LESS_THAN                            = 0x00000004,
    DEVPROP_OPERATOR_GREATER_THAN_EQUALS                  = 0x00000005,
    DEVPROP_OPERATOR_LESS_THAN_EQUALS                     = 0x00000006,
    DEVPROP_OPERATOR_EQUALS_IGNORE_CASE                   = 0x00020002,
    DEVPROP_OPERATOR_NOT_EQUALS_IGNORE_CASE               = 0x00030002,
    DEVPROP_OPERATOR_BITWISE_AND                          = 0x00000007,
    DEVPROP_OPERATOR_BITWISE_OR                           = 0x00000008,
    DEVPROP_OPERATOR_BEGINS_WITH                          = 0x00000009,
    DEVPROP_OPERATOR_ENDS_WITH                            = 0x0000000a,
    DEVPROP_OPERATOR_CONTAINS                             = 0x0000000b,
    DEVPROP_OPERATOR_BEGINS_WITH_IGNORE_CASE              = 0x00020009,
    DEVPROP_OPERATOR_ENDS_WITH_IGNORE_CASE                = 0x0002000a,
    DEVPROP_OPERATOR_CONTAINS_IGNORE_CASE                 = 0x0002000b,
    DEVPROP_OPERATOR_LIST_CONTAINS                        = 0x00001000,
    DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH             = 0x00002000,
    DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH               = 0x00003000,
    DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS                = 0x00004000,
    DEVPROP_OPERATOR_LIST_CONTAINS_IGNORE_CASE            = 0x00021000,
    DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE = 0x00022000,
    DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH_IGNORE_CASE   = 0x00023000,
    DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS_IGNORE_CASE    = 0x00024000,
    DEVPROP_OPERATOR_AND_OPEN                             = 0x00100000,
    DEVPROP_OPERATOR_AND_CLOSE                            = 0x00200000,
    DEVPROP_OPERATOR_OR_OPEN                              = 0x00300000,
    DEVPROP_OPERATOR_OR_CLOSE                             = 0x00400000,
    DEVPROP_OPERATOR_NOT_OPEN                             = 0x00500000,
    DEVPROP_OPERATOR_NOT_CLOSE                            = 0x00600000,
    DEVPROP_OPERATOR_ARRAY_CONTAINS                       = 0x10000000,
    DEVPROP_OPERATOR_MASK_EVAL                            = 0x00000fff,
    DEVPROP_OPERATOR_MASK_LIST                            = 0x0000f000,
    DEVPROP_OPERATOR_MASK_MODIFIER                        = 0x000f0000,
    DEVPROP_OPERATOR_MASK_NOT_LOGICAL                     = 0xf00fffff,
    DEVPROP_OPERATOR_MASK_LOGICAL                         = 0x0ff00000,
    DEVPROP_OPERATOR_MASK_ARRAY                           = 0xf0000000,
}

struct DEVPROP_FILTER_EXPRESSION
{
    DEVPROP_OPERATOR Operator;
    DEVPROPERTY Property;
}
alias DEV_OBJECT_TYPE = int;
enum : int
{
    DevObjectTypeUnknown                = 0x00000000,
    DevObjectTypeDeviceInterface        = 0x00000001,
    DevObjectTypeDeviceContainer        = 0x00000002,
    DevObjectTypeDevice                 = 0x00000003,
    DevObjectTypeDeviceInterfaceClass   = 0x00000004,
    DevObjectTypeAEP                    = 0x00000005,
    DevObjectTypeAEPContainer           = 0x00000006,
    DevObjectTypeDeviceInstallerClass   = 0x00000007,
    DevObjectTypeDeviceInterfaceDisplay = 0x00000008,
    DevObjectTypeDeviceContainerDisplay = 0x00000009,
    DevObjectTypeAEPService             = 0x0000000a,
    DevObjectTypeDevicePanel            = 0x0000000b,
}

alias DEV_QUERY_FLAGS = int;
enum : int
{
    DevQueryFlagNone          = 0x00000000,
    DevQueryFlagUpdateResults = 0x00000001,
    DevQueryFlagAllProperties = 0x00000002,
    DevQueryFlagLocalize      = 0x00000004,
    DevQueryFlagAsyncClose    = 0x00000008,
}

alias DEV_QUERY_STATE = int;
enum : int
{
    DevQueryStateInitialized   = 0x00000000,
    DevQueryStateEnumCompleted = 0x00000001,
    DevQueryStateAborted       = 0x00000002,
    DevQueryStateClosed        = 0x00000003,
}

alias DEV_QUERY_RESULT_ACTION = int;
enum : int
{
    DevQueryResultStateChange = 0x00000000,
    DevQueryResultAdd         = 0x00000001,
    DevQueryResultUpdate      = 0x00000002,
    DevQueryResultRemove      = 0x00000003,
}

struct DEV_OBJECT
{
    DEV_OBJECT_TYPE ObjectType;
    const(wchar)* pszObjectId;
    uint cPropertyCount;
    const(DEVPROPERTY)* pProperties;
}
struct DEV_QUERY_RESULT_ACTION_DATA
{
    DEV_QUERY_RESULT_ACTION Action;
    union _DEV_QUERY_RESULT_UPDATE_PAYLOAD
    {
        DEV_QUERY_STATE State;
        DEV_OBJECT DeviceObject;
    }
}
struct DEV_QUERY_PARAMETER
{
    DEVPROPKEY Key;
    DEVPROPTYPE Type;
    uint BufferSize;
    void* Buffer;
}
struct HDEVQUERY__
{
    int unused;
}
alias PDEV_QUERY_RESULT_CALLBACK = void function(HDEVQUERY__*, void*, const(DEV_QUERY_RESULT_ACTION_DATA)*);
HRESULT DevCreateObjectQuery(DEV_OBJECT_TYPE, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, PDEV_QUERY_RESULT_CALLBACK, void*, HDEVQUERY__**);
HRESULT DevCreateObjectQueryEx(DEV_OBJECT_TYPE, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, uint, const(DEV_QUERY_PARAMETER)*, PDEV_QUERY_RESULT_CALLBACK, void*, HDEVQUERY__**);
HRESULT DevCreateObjectQueryFromId(DEV_OBJECT_TYPE, const(wchar)*, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, PDEV_QUERY_RESULT_CALLBACK, void*, HDEVQUERY__**);
HRESULT DevCreateObjectQueryFromIdEx(DEV_OBJECT_TYPE, const(wchar)*, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, uint, const(DEV_QUERY_PARAMETER)*, PDEV_QUERY_RESULT_CALLBACK, void*, HDEVQUERY__**);
HRESULT DevCreateObjectQueryFromIds(DEV_OBJECT_TYPE, const(wchar)*, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, PDEV_QUERY_RESULT_CALLBACK, void*, HDEVQUERY__**);
HRESULT DevCreateObjectQueryFromIdsEx(DEV_OBJECT_TYPE, const(wchar)*, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, uint, const(DEV_QUERY_PARAMETER)*, PDEV_QUERY_RESULT_CALLBACK, void*, HDEVQUERY__**);
void DevCloseObjectQuery(HDEVQUERY__*);
HRESULT DevGetObjects(DEV_OBJECT_TYPE, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, uint*, const(DEV_OBJECT)**);
HRESULT DevGetObjectsEx(DEV_OBJECT_TYPE, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEVPROP_FILTER_EXPRESSION)*, uint, const(DEV_QUERY_PARAMETER)*, uint*, const(DEV_OBJECT)**);
void DevFreeObjects(uint, const(DEV_OBJECT)*);
HRESULT DevGetObjectProperties(DEV_OBJECT_TYPE, const(wchar)*, uint, uint, const(DEVPROPCOMPKEY)*, uint*, const(DEVPROPERTY)**);
HRESULT DevGetObjectPropertiesEx(DEV_OBJECT_TYPE, const(wchar)*, uint, uint, const(DEVPROPCOMPKEY)*, uint, const(DEV_QUERY_PARAMETER)*, uint*, const(DEVPROPERTY)**);
void DevFreeObjectProperties(uint, const(DEVPROPERTY)*);
DEVPROPERTY* DevFindProperty(const(DEVPROPKEY)*, DEVPROPSTORE, const(wchar)*, uint, const(DEVPROPERTY)*);
