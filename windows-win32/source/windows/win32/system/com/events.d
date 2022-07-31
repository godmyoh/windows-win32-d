module windows.win32.system.com.events;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT;
import windows.win32.system.com_ : IDispatch, IUnknown, VARIANT;

version (Windows):
extern (Windows):

enum CLSID_CEventSystem = GUID(0x4e14fba2, 0x2e22, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
struct CEventSystem
{
}
enum CLSID_CEventPublisher = GUID(0xab944620, 0x79c6, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
struct CEventPublisher
{
}
enum CLSID_CEventClass = GUID(0xcdbec9c0, 0x7a68, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
struct CEventClass
{
}
enum CLSID_CEventSubscription = GUID(0x7542e960, 0x79c7, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
struct CEventSubscription
{
}
enum CLSID_EventObjectChange = GUID(0xd0565000, 0x9df4, 0x11d1, [0xa2, 0x81, 0x0, 0xc0, 0x4f, 0xca, 0xa, 0xa7]);
struct EventObjectChange
{
}
enum CLSID_EventObjectChange2 = GUID(0xbb07bacd, 0xcd56, 0x4e63, [0xa8, 0xff, 0xcb, 0xf0, 0x35, 0x5f, 0xb9, 0xf4]);
struct EventObjectChange2
{
}
enum IID_IEventSystem = GUID(0x4e14fb9f, 0x2e22, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventSystem : IDispatch
{
    HRESULT Query(BSTR, BSTR, int*, IUnknown*);
    HRESULT Store(BSTR, IUnknown);
    HRESULT Remove(BSTR, BSTR, int*);
    HRESULT get_EventObjectChangeEventClassID(BSTR*);
    HRESULT QueryS(BSTR, BSTR, IUnknown*);
    HRESULT RemoveS(BSTR, BSTR);
}
enum IID_IEventPublisher = GUID(0xe341516b, 0x2e32, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventPublisher : IDispatch
{
    HRESULT get_PublisherID(BSTR*);
    HRESULT put_PublisherID(BSTR);
    HRESULT get_PublisherName(BSTR*);
    HRESULT put_PublisherName(BSTR);
    HRESULT get_PublisherType(BSTR*);
    HRESULT put_PublisherType(BSTR);
    HRESULT get_OwnerSID(BSTR*);
    HRESULT put_OwnerSID(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT GetDefaultProperty(BSTR, VARIANT*);
    HRESULT PutDefaultProperty(BSTR, VARIANT*);
    HRESULT RemoveDefaultProperty(BSTR);
    HRESULT GetDefaultPropertyCollection(IEventObjectCollection*);
}
enum IID_IEventClass = GUID(0xfb2b72a0, 0x7a68, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IEventClass : IDispatch
{
    HRESULT get_EventClassID(BSTR*);
    HRESULT put_EventClassID(BSTR);
    HRESULT get_EventClassName(BSTR*);
    HRESULT put_EventClassName(BSTR);
    HRESULT get_OwnerSID(BSTR*);
    HRESULT put_OwnerSID(BSTR);
    HRESULT get_FiringInterfaceID(BSTR*);
    HRESULT put_FiringInterfaceID(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_CustomConfigCLSID(BSTR*);
    HRESULT put_CustomConfigCLSID(BSTR);
    HRESULT get_TypeLib(BSTR*);
    HRESULT put_TypeLib(BSTR);
}
enum IID_IEventClass2 = GUID(0xfb2b72a1, 0x7a68, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IEventClass2 : IEventClass
{
    HRESULT get_PublisherID(BSTR*);
    HRESULT put_PublisherID(BSTR);
    HRESULT get_MultiInterfacePublisherFilterCLSID(BSTR*);
    HRESULT put_MultiInterfacePublisherFilterCLSID(BSTR);
    HRESULT get_AllowInprocActivation(BOOL*);
    HRESULT put_AllowInprocActivation(BOOL);
    HRESULT get_FireInParallel(BOOL*);
    HRESULT put_FireInParallel(BOOL);
}
enum IID_IEventSubscription = GUID(0x4a6b0e15, 0x2e38, 0x11d1, [0x99, 0x65, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventSubscription : IDispatch
{
    HRESULT get_SubscriptionID(BSTR*);
    HRESULT put_SubscriptionID(BSTR);
    HRESULT get_SubscriptionName(BSTR*);
    HRESULT put_SubscriptionName(BSTR);
    HRESULT get_PublisherID(BSTR*);
    HRESULT put_PublisherID(BSTR);
    HRESULT get_EventClassID(BSTR*);
    HRESULT put_EventClassID(BSTR);
    HRESULT get_MethodName(BSTR*);
    HRESULT put_MethodName(BSTR);
    HRESULT get_SubscriberCLSID(BSTR*);
    HRESULT put_SubscriberCLSID(BSTR);
    HRESULT get_SubscriberInterface(IUnknown*);
    HRESULT put_SubscriberInterface(IUnknown);
    HRESULT get_PerUser(BOOL*);
    HRESULT put_PerUser(BOOL);
    HRESULT get_OwnerSID(BSTR*);
    HRESULT put_OwnerSID(BSTR);
    HRESULT get_Enabled(BOOL*);
    HRESULT put_Enabled(BOOL);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_MachineName(BSTR*);
    HRESULT put_MachineName(BSTR);
    HRESULT GetPublisherProperty(BSTR, VARIANT*);
    HRESULT PutPublisherProperty(BSTR, VARIANT*);
    HRESULT RemovePublisherProperty(BSTR);
    HRESULT GetPublisherPropertyCollection(IEventObjectCollection*);
    HRESULT GetSubscriberProperty(BSTR, VARIANT*);
    HRESULT PutSubscriberProperty(BSTR, VARIANT*);
    HRESULT RemoveSubscriberProperty(BSTR);
    HRESULT GetSubscriberPropertyCollection(IEventObjectCollection*);
    HRESULT get_InterfaceID(BSTR*);
    HRESULT put_InterfaceID(BSTR);
}
enum IID_IFiringControl = GUID(0xe0498c93, 0x4efe, 0x11d1, [0x99, 0x71, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IFiringControl : IDispatch
{
    HRESULT FireSubscription(IEventSubscription);
}
enum IID_IPublisherFilter = GUID(0x465e5cc0, 0x7b26, 0x11d1, [0x88, 0xfb, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IPublisherFilter : IUnknown
{
    HRESULT Initialize(BSTR, IDispatch);
    HRESULT PrepareToFire(BSTR, IFiringControl);
}
enum IID_IMultiInterfacePublisherFilter = GUID(0x465e5cc1, 0x7b26, 0x11d1, [0x88, 0xfb, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IMultiInterfacePublisherFilter : IUnknown
{
    HRESULT Initialize(IMultiInterfaceEventControl);
    HRESULT PrepareToFire(const(GUID)*, BSTR, IFiringControl);
}
alias EOC_ChangeType = int;
enum : int
{
    EOC_NewObject      = 0x00000000,
    EOC_ModifiedObject = 0x00000001,
    EOC_DeletedObject  = 0x00000002,
}

enum IID_IEventObjectChange = GUID(0xf4a07d70, 0x2e25, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventObjectChange : IUnknown
{
    HRESULT ChangedSubscription(EOC_ChangeType, BSTR);
    HRESULT ChangedEventClass(EOC_ChangeType, BSTR);
    HRESULT ChangedPublisher(EOC_ChangeType, BSTR);
}
struct COMEVENTSYSCHANGEINFO
{
    uint cbSize;
    EOC_ChangeType changeType;
    BSTR objectId;
    BSTR partitionId;
    BSTR applicationId;
    GUID[10] reserved;
}
enum IID_IEventObjectChange2 = GUID(0x7701a9c3, 0xbd68, 0x438f, [0x83, 0xe0, 0x67, 0xbf, 0x4f, 0x53, 0xa4, 0x22]);
interface IEventObjectChange2 : IUnknown
{
    HRESULT ChangedSubscription(COMEVENTSYSCHANGEINFO*);
    HRESULT ChangedEventClass(COMEVENTSYSCHANGEINFO*);
}
enum IID_IEnumEventObject = GUID(0xf4a07d63, 0x2e25, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEnumEventObject : IUnknown
{
    HRESULT Clone(IEnumEventObject*);
    HRESULT Next(uint, IUnknown*, uint*);
    HRESULT Reset();
    HRESULT Skip(uint);
}
enum IID_IEventObjectCollection = GUID(0xf89ac270, 0xd4eb, 0x11d1, [0xb6, 0x82, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x16]);
interface IEventObjectCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(BSTR, VARIANT*);
    HRESULT get_NewEnum(IEnumEventObject*);
    HRESULT get_Count(int*);
    HRESULT Add(VARIANT*, BSTR);
    HRESULT Remove(BSTR);
}
enum IID_IEventProperty = GUID(0xda538ee2, 0xf4de, 0x11d1, [0xb6, 0xbb, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x16]);
interface IEventProperty : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT*);
}
enum IID_IEventControl = GUID(0x343e2f4, 0x86f6, 0x11d1, [0xb7, 0x60, 0x0, 0xc0, 0x4f, 0xb9, 0x26, 0xaf]);
interface IEventControl : IDispatch
{
    HRESULT SetPublisherFilter(BSTR, IPublisherFilter);
    HRESULT get_AllowInprocActivation(BOOL*);
    HRESULT put_AllowInprocActivation(BOOL);
    HRESULT GetSubscriptions(BSTR, BSTR, int*, IEventObjectCollection*);
    HRESULT SetDefaultQuery(BSTR, BSTR, int*);
}
enum IID_IMultiInterfaceEventControl = GUID(0x343e2f5, 0x86f6, 0x11d1, [0xb7, 0x60, 0x0, 0xc0, 0x4f, 0xb9, 0x26, 0xaf]);
interface IMultiInterfaceEventControl : IUnknown
{
    HRESULT SetMultiInterfacePublisherFilter(IMultiInterfacePublisherFilter);
    HRESULT GetSubscriptions(const(GUID)*, BSTR, BSTR, int*, IEventObjectCollection*);
    HRESULT SetDefaultQuery(const(GUID)*, BSTR, BSTR, int*);
    HRESULT get_AllowInprocActivation(BOOL*);
    HRESULT put_AllowInprocActivation(BOOL);
    HRESULT get_FireInParallel(BOOL*);
    HRESULT put_FireInParallel(BOOL);
}
enum IID_IDontSupportEventSubscription = GUID(0x784121f1, 0x62a6, 0x4b89, [0x85, 0x5f, 0xd6, 0x5f, 0x29, 0x6d, 0xe8, 0x3a]);
interface IDontSupportEventSubscription : IUnknown
{
}
