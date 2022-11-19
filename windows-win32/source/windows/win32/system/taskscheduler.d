module windows.win32.system.taskscheduler;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, HWND, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.system.com_ : IDispatch, IUnknown, SAFEARRAY, VARIANT;
import windows.win32.ui.controls_ : HPROPSHEETPAGE;

version (Windows):
extern (Windows):

enum TASK_SUNDAY = 0x00000001;
enum TASK_MONDAY = 0x00000002;
enum TASK_TUESDAY = 0x00000004;
enum TASK_WEDNESDAY = 0x00000008;
enum TASK_THURSDAY = 0x00000010;
enum TASK_FRIDAY = 0x00000020;
enum TASK_SATURDAY = 0x00000040;
enum TASK_FIRST_WEEK = 0x00000001;
enum TASK_SECOND_WEEK = 0x00000002;
enum TASK_THIRD_WEEK = 0x00000003;
enum TASK_FOURTH_WEEK = 0x00000004;
enum TASK_LAST_WEEK = 0x00000005;
enum TASK_JANUARY = 0x00000001;
enum TASK_FEBRUARY = 0x00000002;
enum TASK_MARCH = 0x00000004;
enum TASK_APRIL = 0x00000008;
enum TASK_MAY = 0x00000010;
enum TASK_JUNE = 0x00000020;
enum TASK_JULY = 0x00000040;
enum TASK_AUGUST = 0x00000080;
enum TASK_SEPTEMBER = 0x00000100;
enum TASK_OCTOBER = 0x00000200;
enum TASK_NOVEMBER = 0x00000400;
enum TASK_DECEMBER = 0x00000800;
enum TASK_FLAG_INTERACTIVE = 0x00000001;
enum TASK_FLAG_DELETE_WHEN_DONE = 0x00000002;
enum TASK_FLAG_DISABLED = 0x00000004;
enum TASK_FLAG_START_ONLY_IF_IDLE = 0x00000010;
enum TASK_FLAG_KILL_ON_IDLE_END = 0x00000020;
enum TASK_FLAG_DONT_START_IF_ON_BATTERIES = 0x00000040;
enum TASK_FLAG_KILL_IF_GOING_ON_BATTERIES = 0x00000080;
enum TASK_FLAG_RUN_ONLY_IF_DOCKED = 0x00000100;
enum TASK_FLAG_HIDDEN = 0x00000200;
enum TASK_FLAG_RUN_IF_CONNECTED_TO_INTERNET = 0x00000400;
enum TASK_FLAG_RESTART_ON_IDLE_RESUME = 0x00000800;
enum TASK_FLAG_SYSTEM_REQUIRED = 0x00001000;
enum TASK_FLAG_RUN_ONLY_IF_LOGGED_ON = 0x00002000;
enum TASK_TRIGGER_FLAG_HAS_END_DATE = 0x00000001;
enum TASK_TRIGGER_FLAG_KILL_AT_DURATION_END = 0x00000002;
enum TASK_TRIGGER_FLAG_DISABLED = 0x00000004;
enum TASK_MAX_RUN_TIMES = 0x000005a0;
enum CLSID_CTask = GUID(0x148bd520, 0xa2ab, 0x11ce, [0xb1, 0x1f, 0x0, 0xaa, 0x0, 0x53, 0x5, 0x3]);
enum CLSID_CTaskScheduler = GUID(0x148bd52a, 0xa2ab, 0x11ce, [0xb1, 0x1f, 0x0, 0xaa, 0x0, 0x53, 0x5, 0x3]);
alias TASK_TRIGGER_TYPE = int;
enum : int
{
    TASK_TIME_TRIGGER_ONCE            = 0x00000000,
    TASK_TIME_TRIGGER_DAILY           = 0x00000001,
    TASK_TIME_TRIGGER_WEEKLY          = 0x00000002,
    TASK_TIME_TRIGGER_MONTHLYDATE     = 0x00000003,
    TASK_TIME_TRIGGER_MONTHLYDOW      = 0x00000004,
    TASK_EVENT_TRIGGER_ON_IDLE        = 0x00000005,
    TASK_EVENT_TRIGGER_AT_SYSTEMSTART = 0x00000006,
    TASK_EVENT_TRIGGER_AT_LOGON       = 0x00000007,
}

struct DAILY
{
    ushort DaysInterval;
}
struct WEEKLY
{
    ushort WeeksInterval;
    ushort rgfDaysOfTheWeek;
}
struct MONTHLYDATE
{
    uint rgfDays;
    ushort rgfMonths;
}
struct MONTHLYDOW
{
    ushort wWhichWeek;
    ushort rgfDaysOfTheWeek;
    ushort rgfMonths;
}
union TRIGGER_TYPE_UNION
{
    DAILY Daily;
    WEEKLY Weekly;
    MONTHLYDATE MonthlyDate;
    MONTHLYDOW MonthlyDOW;
}
struct TASK_TRIGGER
{
    ushort cbTriggerSize;
    ushort Reserved1;
    ushort wBeginYear;
    ushort wBeginMonth;
    ushort wBeginDay;
    ushort wEndYear;
    ushort wEndMonth;
    ushort wEndDay;
    ushort wStartHour;
    ushort wStartMinute;
    uint MinutesDuration;
    uint MinutesInterval;
    uint rgFlags;
    TASK_TRIGGER_TYPE TriggerType;
    TRIGGER_TYPE_UNION Type;
    ushort Reserved2;
    ushort wRandomMinutesInterval;
}
enum IID_ITaskTrigger = GUID(0x148bd52b, 0xa2ab, 0x11ce, [0xb1, 0x1f, 0x0, 0xaa, 0x0, 0x53, 0x5, 0x3]);
interface ITaskTrigger : IUnknown
{
    HRESULT SetTrigger(const(TASK_TRIGGER)*);
    HRESULT GetTrigger(TASK_TRIGGER*);
    HRESULT GetTriggerString(PWSTR*);
}
enum IID_IScheduledWorkItem = GUID(0xa6b952f0, 0xa4b1, 0x11d0, [0x99, 0x7d, 0x0, 0xaa, 0x0, 0x68, 0x87, 0xec]);
interface IScheduledWorkItem : IUnknown
{
    HRESULT CreateTrigger(ushort*, ITaskTrigger*);
    HRESULT DeleteTrigger(ushort);
    HRESULT GetTriggerCount(ushort*);
    HRESULT GetTrigger(ushort, ITaskTrigger*);
    HRESULT GetTriggerString(ushort, PWSTR*);
    HRESULT GetRunTimes(const(SYSTEMTIME)*, const(SYSTEMTIME)*, ushort*, SYSTEMTIME**);
    HRESULT GetNextRunTime(SYSTEMTIME*);
    HRESULT SetIdleWait(ushort, ushort);
    HRESULT GetIdleWait(ushort*, ushort*);
    HRESULT Run();
    HRESULT Terminate();
    HRESULT EditWorkItem(HWND, uint);
    HRESULT GetMostRecentRunTime(SYSTEMTIME*);
    HRESULT GetStatus(HRESULT*);
    HRESULT GetExitCode(uint*);
    HRESULT SetComment(const(wchar)*);
    HRESULT GetComment(PWSTR*);
    HRESULT SetCreator(const(wchar)*);
    HRESULT GetCreator(PWSTR*);
    HRESULT SetWorkItemData(ushort, ubyte*);
    HRESULT GetWorkItemData(ushort*, ubyte**);
    HRESULT SetErrorRetryCount(ushort);
    HRESULT GetErrorRetryCount(ushort*);
    HRESULT SetErrorRetryInterval(ushort);
    HRESULT GetErrorRetryInterval(ushort*);
    HRESULT SetFlags(uint);
    HRESULT GetFlags(uint*);
    HRESULT SetAccountInformation(const(wchar)*, const(wchar)*);
    HRESULT GetAccountInformation(PWSTR*);
}
enum IID_ITask = GUID(0x148bd524, 0xa2ab, 0x11ce, [0xb1, 0x1f, 0x0, 0xaa, 0x0, 0x53, 0x5, 0x3]);
interface ITask : IScheduledWorkItem
{
    HRESULT SetApplicationName(const(wchar)*);
    HRESULT GetApplicationName(PWSTR*);
    HRESULT SetParameters(const(wchar)*);
    HRESULT GetParameters(PWSTR*);
    HRESULT SetWorkingDirectory(const(wchar)*);
    HRESULT GetWorkingDirectory(PWSTR*);
    HRESULT SetPriority(uint);
    HRESULT GetPriority(uint*);
    HRESULT SetTaskFlags(uint);
    HRESULT GetTaskFlags(uint*);
    HRESULT SetMaxRunTime(uint);
    HRESULT GetMaxRunTime(uint*);
}
enum IID_IEnumWorkItems = GUID(0x148bd528, 0xa2ab, 0x11ce, [0xb1, 0x1f, 0x0, 0xaa, 0x0, 0x53, 0x5, 0x3]);
interface IEnumWorkItems : IUnknown
{
    HRESULT Next(uint, PWSTR**, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumWorkItems*);
}
enum IID_ITaskScheduler = GUID(0x148bd527, 0xa2ab, 0x11ce, [0xb1, 0x1f, 0x0, 0xaa, 0x0, 0x53, 0x5, 0x3]);
interface ITaskScheduler : IUnknown
{
    HRESULT SetTargetComputer(const(wchar)*);
    HRESULT GetTargetComputer(PWSTR*);
    HRESULT Enum(IEnumWorkItems*);
    HRESULT Activate(const(wchar)*, const(GUID)*, IUnknown*);
    HRESULT Delete(const(wchar)*);
    HRESULT NewWorkItem(const(wchar)*, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT AddWorkItem(const(wchar)*, IScheduledWorkItem);
    HRESULT IsOfType(const(wchar)*, const(GUID)*);
}
alias TASKPAGE = int;
enum : int
{
    TASKPAGE_TASK     = 0x00000000,
    TASKPAGE_SCHEDULE = 0x00000001,
    TASKPAGE_SETTINGS = 0x00000002,
}

enum IID_IProvideTaskPage = GUID(0x4086658a, 0xcbbb, 0x11cf, [0xb6, 0x4, 0x0, 0xc0, 0x4f, 0xd8, 0xd5, 0x65]);
interface IProvideTaskPage : IUnknown
{
    HRESULT GetPage(TASKPAGE, BOOL, HPROPSHEETPAGE*);
}
enum CLSID_TaskScheduler = GUID(0xf87369f, 0xa4e5, 0x4cfc, [0xbd, 0x3e, 0x73, 0xe6, 0x15, 0x45, 0x72, 0xdd]);
struct TaskScheduler
{
}
enum CLSID_TaskHandlerPS = GUID(0xf2a69db7, 0xda2c, 0x4352, [0x90, 0x66, 0x86, 0xfe, 0xe6, 0xda, 0xca, 0xc9]);
struct TaskHandlerPS
{
}
enum CLSID_TaskHandlerStatusPS = GUID(0x9f15266d, 0xd7ba, 0x48f0, [0x93, 0xc1, 0xe6, 0x89, 0x5f, 0x6f, 0xe5, 0xac]);
struct TaskHandlerStatusPS
{
}
alias TASK_RUN_FLAGS = int;
enum : int
{
    TASK_RUN_NO_FLAGS           = 0x00000000,
    TASK_RUN_AS_SELF            = 0x00000001,
    TASK_RUN_IGNORE_CONSTRAINTS = 0x00000002,
    TASK_RUN_USE_SESSION_ID     = 0x00000004,
    TASK_RUN_USER_SID           = 0x00000008,
}

alias TASK_ENUM_FLAGS = int;
enum : int
{
    TASK_ENUM_HIDDEN = 0x00000001,
}

alias TASK_LOGON_TYPE = int;
enum : int
{
    TASK_LOGON_NONE                          = 0x00000000,
    TASK_LOGON_PASSWORD                      = 0x00000001,
    TASK_LOGON_S4U                           = 0x00000002,
    TASK_LOGON_INTERACTIVE_TOKEN             = 0x00000003,
    TASK_LOGON_GROUP                         = 0x00000004,
    TASK_LOGON_SERVICE_ACCOUNT               = 0x00000005,
    TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD = 0x00000006,
}

alias TASK_RUNLEVEL_TYPE = int;
enum : int
{
    TASK_RUNLEVEL_LUA     = 0x00000000,
    TASK_RUNLEVEL_HIGHEST = 0x00000001,
}

alias TASK_PROCESSTOKENSID_TYPE = int;
enum : int
{
    TASK_PROCESSTOKENSID_NONE         = 0x00000000,
    TASK_PROCESSTOKENSID_UNRESTRICTED = 0x00000001,
    TASK_PROCESSTOKENSID_DEFAULT      = 0x00000002,
}

alias TASK_STATE = int;
enum : int
{
    TASK_STATE_UNKNOWN  = 0x00000000,
    TASK_STATE_DISABLED = 0x00000001,
    TASK_STATE_QUEUED   = 0x00000002,
    TASK_STATE_READY    = 0x00000003,
    TASK_STATE_RUNNING  = 0x00000004,
}

alias TASK_CREATION = int;
enum : int
{
    TASK_VALIDATE_ONLY                = 0x00000001,
    TASK_CREATE                       = 0x00000002,
    TASK_UPDATE                       = 0x00000004,
    TASK_CREATE_OR_UPDATE             = 0x00000006,
    TASK_DISABLE                      = 0x00000008,
    TASK_DONT_ADD_PRINCIPAL_ACE       = 0x00000010,
    TASK_IGNORE_REGISTRATION_TRIGGERS = 0x00000020,
}

alias TASK_TRIGGER_TYPE2 = int;
enum : int
{
    TASK_TRIGGER_EVENT                = 0x00000000,
    TASK_TRIGGER_TIME                 = 0x00000001,
    TASK_TRIGGER_DAILY                = 0x00000002,
    TASK_TRIGGER_WEEKLY               = 0x00000003,
    TASK_TRIGGER_MONTHLY              = 0x00000004,
    TASK_TRIGGER_MONTHLYDOW           = 0x00000005,
    TASK_TRIGGER_IDLE                 = 0x00000006,
    TASK_TRIGGER_REGISTRATION         = 0x00000007,
    TASK_TRIGGER_BOOT                 = 0x00000008,
    TASK_TRIGGER_LOGON                = 0x00000009,
    TASK_TRIGGER_SESSION_STATE_CHANGE = 0x0000000b,
    TASK_TRIGGER_CUSTOM_TRIGGER_01    = 0x0000000c,
}

alias TASK_SESSION_STATE_CHANGE_TYPE = int;
enum : int
{
    TASK_CONSOLE_CONNECT    = 0x00000001,
    TASK_CONSOLE_DISCONNECT = 0x00000002,
    TASK_REMOTE_CONNECT     = 0x00000003,
    TASK_REMOTE_DISCONNECT  = 0x00000004,
    TASK_SESSION_LOCK       = 0x00000007,
    TASK_SESSION_UNLOCK     = 0x00000008,
}

alias TASK_ACTION_TYPE = int;
enum : int
{
    TASK_ACTION_EXEC         = 0x00000000,
    TASK_ACTION_COM_HANDLER  = 0x00000005,
    TASK_ACTION_SEND_EMAIL   = 0x00000006,
    TASK_ACTION_SHOW_MESSAGE = 0x00000007,
}

alias TASK_INSTANCES_POLICY = int;
enum : int
{
    TASK_INSTANCES_PARALLEL      = 0x00000000,
    TASK_INSTANCES_QUEUE         = 0x00000001,
    TASK_INSTANCES_IGNORE_NEW    = 0x00000002,
    TASK_INSTANCES_STOP_EXISTING = 0x00000003,
}

alias TASK_COMPATIBILITY = int;
enum : int
{
    TASK_COMPATIBILITY_AT   = 0x00000000,
    TASK_COMPATIBILITY_V1   = 0x00000001,
    TASK_COMPATIBILITY_V2   = 0x00000002,
    TASK_COMPATIBILITY_V2_1 = 0x00000003,
    TASK_COMPATIBILITY_V2_2 = 0x00000004,
    TASK_COMPATIBILITY_V2_3 = 0x00000005,
    TASK_COMPATIBILITY_V2_4 = 0x00000006,
}

enum IID_ITaskFolderCollection = GUID(0x79184a66, 0x8664, 0x423f, [0x97, 0xf1, 0x63, 0x73, 0x56, 0xa5, 0xd8, 0x12]);
interface ITaskFolderCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(VARIANT, ITaskFolder*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_ITaskService = GUID(0x2faba4c7, 0x4da9, 0x4013, [0x96, 0x97, 0x20, 0xcc, 0x3f, 0xd4, 0xf, 0x85]);
interface ITaskService : IDispatch
{
    HRESULT GetFolder(BSTR, ITaskFolder*);
    HRESULT GetRunningTasks(int, IRunningTaskCollection*);
    HRESULT NewTask(uint, ITaskDefinition*);
    HRESULT Connect(VARIANT, VARIANT, VARIANT, VARIANT);
    HRESULT get_Connected(VARIANT_BOOL*);
    HRESULT get_TargetServer(BSTR*);
    HRESULT get_ConnectedUser(BSTR*);
    HRESULT get_ConnectedDomain(BSTR*);
    HRESULT get_HighestVersion(uint*);
}
enum IID_ITaskHandler = GUID(0x839d7762, 0x5121, 0x4009, [0x92, 0x34, 0x4f, 0xd, 0x19, 0x39, 0x4f, 0x4]);
interface ITaskHandler : IUnknown
{
    HRESULT Start(IUnknown, BSTR);
    HRESULT Stop(HRESULT*);
    HRESULT Pause();
    HRESULT Resume();
}
enum IID_ITaskHandlerStatus = GUID(0xeaec7a8f, 0x27a0, 0x4ddc, [0x86, 0x75, 0x14, 0x72, 0x6a, 0x1, 0xa3, 0x8a]);
interface ITaskHandlerStatus : IUnknown
{
    HRESULT UpdateStatus(short, BSTR);
    HRESULT TaskCompleted(HRESULT);
}
enum IID_ITaskVariables = GUID(0x3e4c9351, 0xd966, 0x4b8b, [0xbb, 0x87, 0xce, 0xba, 0x68, 0xbb, 0x1, 0x7]);
interface ITaskVariables : IUnknown
{
    HRESULT GetInput(BSTR*);
    HRESULT SetOutput(BSTR);
    HRESULT GetContext(BSTR*);
}
enum IID_ITaskNamedValuePair = GUID(0x39038068, 0x2b46, 0x4afd, [0x86, 0x62, 0x7b, 0xb6, 0xf8, 0x68, 0xd2, 0x21]);
interface ITaskNamedValuePair : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Value(BSTR*);
    HRESULT put_Value(BSTR);
}
enum IID_ITaskNamedValueCollection = GUID(0xb4ef826b, 0x63c3, 0x46e4, [0xa5, 0x4, 0xef, 0x69, 0xe4, 0xf7, 0xea, 0x4d]);
interface ITaskNamedValueCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, ITaskNamedValuePair*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Create(BSTR, BSTR, ITaskNamedValuePair*);
    HRESULT Remove(int);
    HRESULT Clear();
}
enum IID_IRunningTask = GUID(0x653758fb, 0x7b9a, 0x4f1e, [0xa4, 0x71, 0xbe, 0xeb, 0x8e, 0x9b, 0x83, 0x4e]);
interface IRunningTask : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_InstanceGuid(BSTR*);
    HRESULT get_Path(BSTR*);
    HRESULT get_State(TASK_STATE*);
    HRESULT get_CurrentAction(BSTR*);
    HRESULT Stop();
    HRESULT Refresh();
    HRESULT get_EnginePID(uint*);
}
enum IID_IRunningTaskCollection = GUID(0x6a67614b, 0x6828, 0x4fec, [0xaa, 0x54, 0x6d, 0x52, 0xe8, 0xf1, 0xf2, 0xdb]);
interface IRunningTaskCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(VARIANT, IRunningTask*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IRegisteredTask = GUID(0x9c86f320, 0xdee3, 0x4dd1, [0xb9, 0x72, 0xa3, 0x3, 0xf2, 0x6b, 0x6, 0x1e]);
interface IRegisteredTask : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Path(BSTR*);
    HRESULT get_State(TASK_STATE*);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT Run(VARIANT, IRunningTask*);
    HRESULT RunEx(VARIANT, int, int, BSTR, IRunningTask*);
    HRESULT GetInstances(int, IRunningTaskCollection*);
    HRESULT get_LastRunTime(double*);
    HRESULT get_LastTaskResult(int*);
    HRESULT get_NumberOfMissedRuns(int*);
    HRESULT get_NextRunTime(double*);
    HRESULT get_Definition(ITaskDefinition*);
    HRESULT get_Xml(BSTR*);
    HRESULT GetSecurityDescriptor(int, BSTR*);
    HRESULT SetSecurityDescriptor(BSTR, int);
    HRESULT Stop(int);
    HRESULT GetRunTimes(const(SYSTEMTIME)*, const(SYSTEMTIME)*, uint*, SYSTEMTIME**);
}
enum IID_ITrigger = GUID(0x9941815, 0xea89, 0x4b5b, [0x89, 0xe0, 0x2a, 0x77, 0x38, 0x1, 0xfa, 0xc3]);
interface ITrigger : IDispatch
{
    HRESULT get_Type(TASK_TRIGGER_TYPE2*);
    HRESULT get_Id(BSTR*);
    HRESULT put_Id(BSTR);
    HRESULT get_Repetition(IRepetitionPattern*);
    HRESULT put_Repetition(IRepetitionPattern);
    HRESULT get_ExecutionTimeLimit(BSTR*);
    HRESULT put_ExecutionTimeLimit(BSTR);
    HRESULT get_StartBoundary(BSTR*);
    HRESULT put_StartBoundary(BSTR);
    HRESULT get_EndBoundary(BSTR*);
    HRESULT put_EndBoundary(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
}
enum IID_IIdleTrigger = GUID(0xd537d2b0, 0x9fb3, 0x4d34, [0x97, 0x39, 0x1f, 0xf5, 0xce, 0x7b, 0x1e, 0xf3]);
interface IIdleTrigger : ITrigger
{
}
enum IID_ILogonTrigger = GUID(0x72dade38, 0xfae4, 0x4b3e, [0xba, 0xf4, 0x5d, 0x0, 0x9a, 0xf0, 0x2b, 0x1c]);
interface ILogonTrigger : ITrigger
{
    HRESULT get_Delay(BSTR*);
    HRESULT put_Delay(BSTR);
    HRESULT get_UserId(BSTR*);
    HRESULT put_UserId(BSTR);
}
enum IID_ISessionStateChangeTrigger = GUID(0x754da71b, 0x4385, 0x4475, [0x9d, 0xd9, 0x59, 0x82, 0x94, 0xfa, 0x36, 0x41]);
interface ISessionStateChangeTrigger : ITrigger
{
    HRESULT get_Delay(BSTR*);
    HRESULT put_Delay(BSTR);
    HRESULT get_UserId(BSTR*);
    HRESULT put_UserId(BSTR);
    HRESULT get_StateChange(TASK_SESSION_STATE_CHANGE_TYPE*);
    HRESULT put_StateChange(TASK_SESSION_STATE_CHANGE_TYPE);
}
enum IID_IEventTrigger = GUID(0xd45b0167, 0x9653, 0x4eef, [0xb9, 0x4f, 0x7, 0x32, 0xca, 0x7a, 0xf2, 0x51]);
interface IEventTrigger : ITrigger
{
    HRESULT get_Subscription(BSTR*);
    HRESULT put_Subscription(BSTR);
    HRESULT get_Delay(BSTR*);
    HRESULT put_Delay(BSTR);
    HRESULT get_ValueQueries(ITaskNamedValueCollection*);
    HRESULT put_ValueQueries(ITaskNamedValueCollection);
}
enum IID_ITimeTrigger = GUID(0xb45747e0, 0xeba7, 0x4276, [0x9f, 0x29, 0x85, 0xc5, 0xbb, 0x30, 0x0, 0x6]);
interface ITimeTrigger : ITrigger
{
    HRESULT get_RandomDelay(BSTR*);
    HRESULT put_RandomDelay(BSTR);
}
enum IID_IDailyTrigger = GUID(0x126c5cd8, 0xb288, 0x41d5, [0x8d, 0xbf, 0xe4, 0x91, 0x44, 0x6a, 0xdc, 0x5c]);
interface IDailyTrigger : ITrigger
{
    HRESULT get_DaysInterval(short*);
    HRESULT put_DaysInterval(short);
    HRESULT get_RandomDelay(BSTR*);
    HRESULT put_RandomDelay(BSTR);
}
enum IID_IWeeklyTrigger = GUID(0x5038fc98, 0x82ff, 0x436d, [0x87, 0x28, 0xa5, 0x12, 0xa5, 0x7c, 0x9d, 0xc1]);
interface IWeeklyTrigger : ITrigger
{
    HRESULT get_DaysOfWeek(short*);
    HRESULT put_DaysOfWeek(short);
    HRESULT get_WeeksInterval(short*);
    HRESULT put_WeeksInterval(short);
    HRESULT get_RandomDelay(BSTR*);
    HRESULT put_RandomDelay(BSTR);
}
enum IID_IMonthlyTrigger = GUID(0x97c45ef1, 0x6b02, 0x4a1a, [0x9c, 0xe, 0x1e, 0xbf, 0xba, 0x15, 0x0, 0xac]);
interface IMonthlyTrigger : ITrigger
{
    HRESULT get_DaysOfMonth(int*);
    HRESULT put_DaysOfMonth(int);
    HRESULT get_MonthsOfYear(short*);
    HRESULT put_MonthsOfYear(short);
    HRESULT get_RunOnLastDayOfMonth(VARIANT_BOOL*);
    HRESULT put_RunOnLastDayOfMonth(VARIANT_BOOL);
    HRESULT get_RandomDelay(BSTR*);
    HRESULT put_RandomDelay(BSTR);
}
enum IID_IMonthlyDOWTrigger = GUID(0x77d025a3, 0x90fa, 0x43aa, [0xb5, 0x2e, 0xcd, 0xa5, 0x49, 0x9b, 0x94, 0x6a]);
interface IMonthlyDOWTrigger : ITrigger
{
    HRESULT get_DaysOfWeek(short*);
    HRESULT put_DaysOfWeek(short);
    HRESULT get_WeeksOfMonth(short*);
    HRESULT put_WeeksOfMonth(short);
    HRESULT get_MonthsOfYear(short*);
    HRESULT put_MonthsOfYear(short);
    HRESULT get_RunOnLastWeekOfMonth(VARIANT_BOOL*);
    HRESULT put_RunOnLastWeekOfMonth(VARIANT_BOOL);
    HRESULT get_RandomDelay(BSTR*);
    HRESULT put_RandomDelay(BSTR);
}
enum IID_IBootTrigger = GUID(0x2a9c35da, 0xd357, 0x41f4, [0xbb, 0xc1, 0x20, 0x7a, 0xc1, 0xb1, 0xf3, 0xcb]);
interface IBootTrigger : ITrigger
{
    HRESULT get_Delay(BSTR*);
    HRESULT put_Delay(BSTR);
}
enum IID_IRegistrationTrigger = GUID(0x4c8fec3a, 0xc218, 0x4e0c, [0xb2, 0x3d, 0x62, 0x90, 0x24, 0xdb, 0x91, 0xa2]);
interface IRegistrationTrigger : ITrigger
{
    HRESULT get_Delay(BSTR*);
    HRESULT put_Delay(BSTR);
}
enum IID_IAction = GUID(0xbae54997, 0x48b1, 0x4cbe, [0x99, 0x65, 0xd6, 0xbe, 0x26, 0x3e, 0xbe, 0xa4]);
interface IAction : IDispatch
{
    HRESULT get_Id(BSTR*);
    HRESULT put_Id(BSTR);
    HRESULT get_Type(TASK_ACTION_TYPE*);
}
enum IID_IExecAction = GUID(0x4c3d624d, 0xfd6b, 0x49a3, [0xb9, 0xb7, 0x9, 0xcb, 0x3c, 0xd3, 0xf0, 0x47]);
interface IExecAction : IAction
{
    HRESULT get_Path(BSTR*);
    HRESULT put_Path(BSTR);
    HRESULT get_Arguments(BSTR*);
    HRESULT put_Arguments(BSTR);
    HRESULT get_WorkingDirectory(BSTR*);
    HRESULT put_WorkingDirectory(BSTR);
}
enum IID_IExecAction2 = GUID(0xf2a82542, 0xbda5, 0x4e6b, [0x91, 0x43, 0xe2, 0xbf, 0x4f, 0x89, 0x87, 0xb6]);
interface IExecAction2 : IExecAction
{
    HRESULT get_HideAppWindow(VARIANT_BOOL*);
    HRESULT put_HideAppWindow(VARIANT_BOOL);
}
enum IID_IShowMessageAction = GUID(0x505e9e68, 0xaf89, 0x46b8, [0xa3, 0xf, 0x56, 0x16, 0x2a, 0x83, 0xd5, 0x37]);
interface IShowMessageAction : IAction
{
    HRESULT get_Title(BSTR*);
    HRESULT put_Title(BSTR);
    HRESULT get_MessageBody(BSTR*);
    HRESULT put_MessageBody(BSTR);
}
enum IID_IComHandlerAction = GUID(0x6d2fd252, 0x75c5, 0x4f66, [0x90, 0xba, 0x2a, 0x7d, 0x8c, 0xc3, 0x3, 0x9f]);
interface IComHandlerAction : IAction
{
    HRESULT get_ClassId(BSTR*);
    HRESULT put_ClassId(BSTR);
    HRESULT get_Data(BSTR*);
    HRESULT put_Data(BSTR);
}
enum IID_IEmailAction = GUID(0x10f62c64, 0x7e16, 0x4314, [0xa0, 0xc2, 0xc, 0x36, 0x83, 0xf9, 0x9d, 0x40]);
interface IEmailAction : IAction
{
    HRESULT get_Server(BSTR*);
    HRESULT put_Server(BSTR);
    HRESULT get_Subject(BSTR*);
    HRESULT put_Subject(BSTR);
    HRESULT get_To(BSTR*);
    HRESULT put_To(BSTR);
    HRESULT get_Cc(BSTR*);
    HRESULT put_Cc(BSTR);
    HRESULT get_Bcc(BSTR*);
    HRESULT put_Bcc(BSTR);
    HRESULT get_ReplyTo(BSTR*);
    HRESULT put_ReplyTo(BSTR);
    HRESULT get_From(BSTR*);
    HRESULT put_From(BSTR);
    HRESULT get_HeaderFields(ITaskNamedValueCollection*);
    HRESULT put_HeaderFields(ITaskNamedValueCollection);
    HRESULT get_Body(BSTR*);
    HRESULT put_Body(BSTR);
    HRESULT get_Attachments(SAFEARRAY**);
    HRESULT put_Attachments(SAFEARRAY*);
}
enum IID_ITriggerCollection = GUID(0x85df5081, 0x1b24, 0x4f32, [0x87, 0x8a, 0xd9, 0xd1, 0x4d, 0xf4, 0xcb, 0x77]);
interface ITriggerCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, ITrigger*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Create(TASK_TRIGGER_TYPE2, ITrigger*);
    HRESULT Remove(VARIANT);
    HRESULT Clear();
}
enum IID_IActionCollection = GUID(0x2820e19, 0x7b98, 0x4ed2, [0xb2, 0xe8, 0xfd, 0xcc, 0xce, 0xff, 0x61, 0x9b]);
interface IActionCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, IAction*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_XmlText(BSTR*);
    HRESULT put_XmlText(BSTR);
    HRESULT Create(TASK_ACTION_TYPE, IAction*);
    HRESULT Remove(VARIANT);
    HRESULT Clear();
    HRESULT get_Context(BSTR*);
    HRESULT put_Context(BSTR);
}
enum IID_IPrincipal = GUID(0xd98d51e5, 0xc9b4, 0x496a, [0xa9, 0xc1, 0x18, 0x98, 0x2, 0x61, 0xcf, 0xf]);
interface IPrincipal : IDispatch
{
    HRESULT get_Id(BSTR*);
    HRESULT put_Id(BSTR);
    HRESULT get_DisplayName(BSTR*);
    HRESULT put_DisplayName(BSTR);
    HRESULT get_UserId(BSTR*);
    HRESULT put_UserId(BSTR);
    HRESULT get_LogonType(TASK_LOGON_TYPE*);
    HRESULT put_LogonType(TASK_LOGON_TYPE);
    HRESULT get_GroupId(BSTR*);
    HRESULT put_GroupId(BSTR);
    HRESULT get_RunLevel(TASK_RUNLEVEL_TYPE*);
    HRESULT put_RunLevel(TASK_RUNLEVEL_TYPE);
}
enum IID_IPrincipal2 = GUID(0x248919ae, 0xe345, 0x4a6d, [0x8a, 0xeb, 0xe0, 0xd3, 0x16, 0x5c, 0x90, 0x4e]);
interface IPrincipal2 : IDispatch
{
    HRESULT get_ProcessTokenSidType(TASK_PROCESSTOKENSID_TYPE*);
    HRESULT put_ProcessTokenSidType(TASK_PROCESSTOKENSID_TYPE);
    HRESULT get_RequiredPrivilegeCount(int*);
    HRESULT get_RequiredPrivilege(int, BSTR*);
    HRESULT AddRequiredPrivilege(BSTR);
}
enum IID_IRegistrationInfo = GUID(0x416d8b73, 0xcb41, 0x4ea1, [0x80, 0x5c, 0x9b, 0xe9, 0xa5, 0xac, 0x4a, 0x74]);
interface IRegistrationInfo : IDispatch
{
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_Author(BSTR*);
    HRESULT put_Author(BSTR);
    HRESULT get_Version(BSTR*);
    HRESULT put_Version(BSTR);
    HRESULT get_Date(BSTR*);
    HRESULT put_Date(BSTR);
    HRESULT get_Documentation(BSTR*);
    HRESULT put_Documentation(BSTR);
    HRESULT get_XmlText(BSTR*);
    HRESULT put_XmlText(BSTR);
    HRESULT get_URI(BSTR*);
    HRESULT put_URI(BSTR);
    HRESULT get_SecurityDescriptor(VARIANT*);
    HRESULT put_SecurityDescriptor(VARIANT);
    HRESULT get_Source(BSTR*);
    HRESULT put_Source(BSTR);
}
enum IID_ITaskDefinition = GUID(0xf5bc8fc5, 0x536d, 0x4f77, [0xb8, 0x52, 0xfb, 0xc1, 0x35, 0x6f, 0xde, 0xb6]);
interface ITaskDefinition : IDispatch
{
    HRESULT get_RegistrationInfo(IRegistrationInfo*);
    HRESULT put_RegistrationInfo(IRegistrationInfo);
    HRESULT get_Triggers(ITriggerCollection*);
    HRESULT put_Triggers(ITriggerCollection);
    HRESULT get_Settings(ITaskSettings*);
    HRESULT put_Settings(ITaskSettings);
    HRESULT get_Data(BSTR*);
    HRESULT put_Data(BSTR);
    HRESULT get_Principal(IPrincipal*);
    HRESULT put_Principal(IPrincipal);
    HRESULT get_Actions(IActionCollection*);
    HRESULT put_Actions(IActionCollection);
    HRESULT get_XmlText(BSTR*);
    HRESULT put_XmlText(BSTR);
}
enum IID_ITaskSettings = GUID(0x8fd4711d, 0x2d02, 0x4c8c, [0x87, 0xe3, 0xef, 0xf6, 0x99, 0xde, 0x12, 0x7e]);
interface ITaskSettings : IDispatch
{
    HRESULT get_AllowDemandStart(VARIANT_BOOL*);
    HRESULT put_AllowDemandStart(VARIANT_BOOL);
    HRESULT get_RestartInterval(BSTR*);
    HRESULT put_RestartInterval(BSTR);
    HRESULT get_RestartCount(int*);
    HRESULT put_RestartCount(int);
    HRESULT get_MultipleInstances(TASK_INSTANCES_POLICY*);
    HRESULT put_MultipleInstances(TASK_INSTANCES_POLICY);
    HRESULT get_StopIfGoingOnBatteries(VARIANT_BOOL*);
    HRESULT put_StopIfGoingOnBatteries(VARIANT_BOOL);
    HRESULT get_DisallowStartIfOnBatteries(VARIANT_BOOL*);
    HRESULT put_DisallowStartIfOnBatteries(VARIANT_BOOL);
    HRESULT get_AllowHardTerminate(VARIANT_BOOL*);
    HRESULT put_AllowHardTerminate(VARIANT_BOOL);
    HRESULT get_StartWhenAvailable(VARIANT_BOOL*);
    HRESULT put_StartWhenAvailable(VARIANT_BOOL);
    HRESULT get_XmlText(BSTR*);
    HRESULT put_XmlText(BSTR);
    HRESULT get_RunOnlyIfNetworkAvailable(VARIANT_BOOL*);
    HRESULT put_RunOnlyIfNetworkAvailable(VARIANT_BOOL);
    HRESULT get_ExecutionTimeLimit(BSTR*);
    HRESULT put_ExecutionTimeLimit(BSTR);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_DeleteExpiredTaskAfter(BSTR*);
    HRESULT put_DeleteExpiredTaskAfter(BSTR);
    HRESULT get_Priority(int*);
    HRESULT put_Priority(int);
    HRESULT get_Compatibility(TASK_COMPATIBILITY*);
    HRESULT put_Compatibility(TASK_COMPATIBILITY);
    HRESULT get_Hidden(VARIANT_BOOL*);
    HRESULT put_Hidden(VARIANT_BOOL);
    HRESULT get_IdleSettings(IIdleSettings*);
    HRESULT put_IdleSettings(IIdleSettings);
    HRESULT get_RunOnlyIfIdle(VARIANT_BOOL*);
    HRESULT put_RunOnlyIfIdle(VARIANT_BOOL);
    HRESULT get_WakeToRun(VARIANT_BOOL*);
    HRESULT put_WakeToRun(VARIANT_BOOL);
    HRESULT get_NetworkSettings(INetworkSettings*);
    HRESULT put_NetworkSettings(INetworkSettings);
}
enum IID_ITaskSettings2 = GUID(0x2c05c3f0, 0x6eed, 0x4c05, [0xa1, 0x5f, 0xed, 0x7d, 0x7a, 0x98, 0xa3, 0x69]);
interface ITaskSettings2 : IDispatch
{
    HRESULT get_DisallowStartOnRemoteAppSession(VARIANT_BOOL*);
    HRESULT put_DisallowStartOnRemoteAppSession(VARIANT_BOOL);
    HRESULT get_UseUnifiedSchedulingEngine(VARIANT_BOOL*);
    HRESULT put_UseUnifiedSchedulingEngine(VARIANT_BOOL);
}
enum IID_ITaskSettings3 = GUID(0xad9d0d7, 0xc7f, 0x4ebb, [0x9a, 0x5f, 0xd1, 0xc6, 0x48, 0xdc, 0xa5, 0x28]);
interface ITaskSettings3 : ITaskSettings
{
    HRESULT get_DisallowStartOnRemoteAppSession(VARIANT_BOOL*);
    HRESULT put_DisallowStartOnRemoteAppSession(VARIANT_BOOL);
    HRESULT get_UseUnifiedSchedulingEngine(VARIANT_BOOL*);
    HRESULT put_UseUnifiedSchedulingEngine(VARIANT_BOOL);
    HRESULT get_MaintenanceSettings(IMaintenanceSettings*);
    HRESULT put_MaintenanceSettings(IMaintenanceSettings);
    HRESULT CreateMaintenanceSettings(IMaintenanceSettings*);
    HRESULT get_Volatile(VARIANT_BOOL*);
    HRESULT put_Volatile(VARIANT_BOOL);
}
enum IID_IMaintenanceSettings = GUID(0xa6024fa8, 0x9652, 0x4adb, [0xa6, 0xbf, 0x5c, 0xfc, 0xd8, 0x77, 0xa7, 0xba]);
interface IMaintenanceSettings : IDispatch
{
    HRESULT put_Period(BSTR);
    HRESULT get_Period(BSTR*);
    HRESULT put_Deadline(BSTR);
    HRESULT get_Deadline(BSTR*);
    HRESULT put_Exclusive(VARIANT_BOOL);
    HRESULT get_Exclusive(VARIANT_BOOL*);
}
enum IID_IRegisteredTaskCollection = GUID(0x86627eb4, 0x42a7, 0x41e4, [0xa4, 0xd9, 0xac, 0x33, 0xa7, 0x2f, 0x2d, 0x52]);
interface IRegisteredTaskCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(VARIANT, IRegisteredTask*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_ITaskFolder = GUID(0x8cfac062, 0xa080, 0x4c15, [0x9a, 0x88, 0xaa, 0x7c, 0x2a, 0xf8, 0xd, 0xfc]);
interface ITaskFolder : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Path(BSTR*);
    HRESULT GetFolder(BSTR, ITaskFolder*);
    HRESULT GetFolders(int, ITaskFolderCollection*);
    HRESULT CreateFolder(BSTR, VARIANT, ITaskFolder*);
    HRESULT DeleteFolder(BSTR, int);
    HRESULT GetTask(BSTR, IRegisteredTask*);
    HRESULT GetTasks(int, IRegisteredTaskCollection*);
    HRESULT DeleteTask(BSTR, int);
    HRESULT RegisterTask(BSTR, BSTR, int, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*);
    HRESULT RegisterTaskDefinition(BSTR, ITaskDefinition, int, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*);
    HRESULT GetSecurityDescriptor(int, BSTR*);
    HRESULT SetSecurityDescriptor(BSTR, int);
}
enum IID_IIdleSettings = GUID(0x84594461, 0x53, 0x4342, [0xa8, 0xfd, 0x8, 0x8f, 0xab, 0xf1, 0x1f, 0x32]);
interface IIdleSettings : IDispatch
{
    HRESULT get_IdleDuration(BSTR*);
    HRESULT put_IdleDuration(BSTR);
    HRESULT get_WaitTimeout(BSTR*);
    HRESULT put_WaitTimeout(BSTR);
    HRESULT get_StopOnIdleEnd(VARIANT_BOOL*);
    HRESULT put_StopOnIdleEnd(VARIANT_BOOL);
    HRESULT get_RestartOnIdle(VARIANT_BOOL*);
    HRESULT put_RestartOnIdle(VARIANT_BOOL);
}
enum IID_INetworkSettings = GUID(0x9f7dea84, 0xc30b, 0x4245, [0x80, 0xb6, 0x0, 0xe9, 0xf6, 0x46, 0xf1, 0xb4]);
interface INetworkSettings : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Id(BSTR*);
    HRESULT put_Id(BSTR);
}
enum IID_IRepetitionPattern = GUID(0x7fb9acf1, 0x26be, 0x400e, [0x85, 0xb5, 0x29, 0x4b, 0x9c, 0x75, 0xdf, 0xd6]);
interface IRepetitionPattern : IDispatch
{
    HRESULT get_Interval(BSTR*);
    HRESULT put_Interval(BSTR);
    HRESULT get_Duration(BSTR*);
    HRESULT put_Duration(BSTR);
    HRESULT get_StopAtDurationEnd(VARIANT_BOOL*);
    HRESULT put_StopAtDurationEnd(VARIANT_BOOL);
}
