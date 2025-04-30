module windows.win32.system.com.events;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT;
import windows.win32.system.com : IDispatch, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum IID_IEventSystem = GUID(0x4e14fb9f, 0x2e22, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventSystem : IDispatch
{
    HRESULT Query(BSTR progID, BSTR queryCriteria, int* errorIndex, IUnknown* ppInterface);
    HRESULT Store(BSTR ProgID, IUnknown pInterface);
    HRESULT Remove(BSTR progID, BSTR queryCriteria, int* errorIndex);
    HRESULT get_EventObjectChangeEventClassID(BSTR* pbstrEventClassID);
    HRESULT QueryS(BSTR progID, BSTR queryCriteria, IUnknown* ppInterface);
    HRESULT RemoveS(BSTR progID, BSTR queryCriteria);
}
enum IID_IEventPublisher = GUID(0xe341516b, 0x2e32, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventPublisher : IDispatch
{
    HRESULT get_PublisherID(BSTR* pbstrPublisherID);
    HRESULT put_PublisherID(BSTR bstrPublisherID);
    HRESULT get_PublisherName(BSTR* pbstrPublisherName);
    HRESULT put_PublisherName(BSTR bstrPublisherName);
    HRESULT get_PublisherType(BSTR* pbstrPublisherType);
    HRESULT put_PublisherType(BSTR bstrPublisherType);
    HRESULT get_OwnerSID(BSTR* pbstrOwnerSID);
    HRESULT put_OwnerSID(BSTR bstrOwnerSID);
    HRESULT get_Description(BSTR* pbstrDescription);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT GetDefaultProperty(BSTR bstrPropertyName, VARIANT* propertyValue);
    HRESULT PutDefaultProperty(BSTR bstrPropertyName, VARIANT* propertyValue);
    HRESULT RemoveDefaultProperty(BSTR bstrPropertyName);
    HRESULT GetDefaultPropertyCollection(IEventObjectCollection* collection);
}
enum IID_IEventClass = GUID(0xfb2b72a0, 0x7a68, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IEventClass : IDispatch
{
    HRESULT get_EventClassID(BSTR* pbstrEventClassID);
    HRESULT put_EventClassID(BSTR bstrEventClassID);
    HRESULT get_EventClassName(BSTR* pbstrEventClassName);
    HRESULT put_EventClassName(BSTR bstrEventClassName);
    HRESULT get_OwnerSID(BSTR* pbstrOwnerSID);
    HRESULT put_OwnerSID(BSTR bstrOwnerSID);
    HRESULT get_FiringInterfaceID(BSTR* pbstrFiringInterfaceID);
    HRESULT put_FiringInterfaceID(BSTR bstrFiringInterfaceID);
    HRESULT get_Description(BSTR* pbstrDescription);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_CustomConfigCLSID(BSTR* pbstrCustomConfigCLSID);
    HRESULT put_CustomConfigCLSID(BSTR bstrCustomConfigCLSID);
    HRESULT get_TypeLib(BSTR* pbstrTypeLib);
    HRESULT put_TypeLib(BSTR bstrTypeLib);
}
enum IID_IEventClass2 = GUID(0xfb2b72a1, 0x7a68, 0x11d1, [0x88, 0xf9, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IEventClass2 : IEventClass
{
    HRESULT get_PublisherID(BSTR* pbstrPublisherID);
    HRESULT put_PublisherID(BSTR bstrPublisherID);
    HRESULT get_MultiInterfacePublisherFilterCLSID(BSTR* pbstrPubFilCLSID);
    HRESULT put_MultiInterfacePublisherFilterCLSID(BSTR bstrPubFilCLSID);
    HRESULT get_AllowInprocActivation(BOOL* pfAllowInprocActivation);
    HRESULT put_AllowInprocActivation(BOOL fAllowInprocActivation);
    HRESULT get_FireInParallel(BOOL* pfFireInParallel);
    HRESULT put_FireInParallel(BOOL fFireInParallel);
}
enum IID_IEventSubscription = GUID(0x4a6b0e15, 0x2e38, 0x11d1, [0x99, 0x65, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEventSubscription : IDispatch
{
    HRESULT get_SubscriptionID(BSTR* pbstrSubscriptionID);
    HRESULT put_SubscriptionID(BSTR bstrSubscriptionID);
    HRESULT get_SubscriptionName(BSTR* pbstrSubscriptionName);
    HRESULT put_SubscriptionName(BSTR bstrSubscriptionName);
    HRESULT get_PublisherID(BSTR* pbstrPublisherID);
    HRESULT put_PublisherID(BSTR bstrPublisherID);
    HRESULT get_EventClassID(BSTR* pbstrEventClassID);
    HRESULT put_EventClassID(BSTR bstrEventClassID);
    HRESULT get_MethodName(BSTR* pbstrMethodName);
    HRESULT put_MethodName(BSTR bstrMethodName);
    HRESULT get_SubscriberCLSID(BSTR* pbstrSubscriberCLSID);
    HRESULT put_SubscriberCLSID(BSTR bstrSubscriberCLSID);
    HRESULT get_SubscriberInterface(IUnknown* ppSubscriberInterface);
    HRESULT put_SubscriberInterface(IUnknown pSubscriberInterface);
    HRESULT get_PerUser(BOOL* pfPerUser);
    HRESULT put_PerUser(BOOL fPerUser);
    HRESULT get_OwnerSID(BSTR* pbstrOwnerSID);
    HRESULT put_OwnerSID(BSTR bstrOwnerSID);
    HRESULT get_Enabled(BOOL* pfEnabled);
    HRESULT put_Enabled(BOOL fEnabled);
    HRESULT get_Description(BSTR* pbstrDescription);
    HRESULT put_Description(BSTR bstrDescription);
    HRESULT get_MachineName(BSTR* pbstrMachineName);
    HRESULT put_MachineName(BSTR bstrMachineName);
    HRESULT GetPublisherProperty(BSTR bstrPropertyName, VARIANT* propertyValue);
    HRESULT PutPublisherProperty(BSTR bstrPropertyName, VARIANT* propertyValue);
    HRESULT RemovePublisherProperty(BSTR bstrPropertyName);
    HRESULT GetPublisherPropertyCollection(IEventObjectCollection* collection);
    HRESULT GetSubscriberProperty(BSTR bstrPropertyName, VARIANT* propertyValue);
    HRESULT PutSubscriberProperty(BSTR bstrPropertyName, VARIANT* propertyValue);
    HRESULT RemoveSubscriberProperty(BSTR bstrPropertyName);
    HRESULT GetSubscriberPropertyCollection(IEventObjectCollection* collection);
    HRESULT get_InterfaceID(BSTR* pbstrInterfaceID);
    HRESULT put_InterfaceID(BSTR bstrInterfaceID);
}
enum IID_IFiringControl = GUID(0xe0498c93, 0x4efe, 0x11d1, [0x99, 0x71, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IFiringControl : IDispatch
{
    HRESULT FireSubscription(IEventSubscription subscription);
}
enum IID_IPublisherFilter = GUID(0x465e5cc0, 0x7b26, 0x11d1, [0x88, 0xfb, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IPublisherFilter : IUnknown
{
    HRESULT Initialize(BSTR methodName, IDispatch dispUserDefined);
    HRESULT PrepareToFire(BSTR methodName, IFiringControl firingControl);
}
enum IID_IMultiInterfacePublisherFilter = GUID(0x465e5cc1, 0x7b26, 0x11d1, [0x88, 0xfb, 0x0, 0x80, 0xc7, 0xd7, 0x71, 0xbf]);
interface IMultiInterfacePublisherFilter : IUnknown
{
    HRESULT Initialize(IMultiInterfaceEventControl pEIC);
    HRESULT PrepareToFire(const(GUID)* iid, BSTR methodName, IFiringControl firingControl);
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
    HRESULT ChangedSubscription(EOC_ChangeType changeType, BSTR bstrSubscriptionID);
    HRESULT ChangedEventClass(EOC_ChangeType changeType, BSTR bstrEventClassID);
    HRESULT ChangedPublisher(EOC_ChangeType changeType, BSTR bstrPublisherID);
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
    HRESULT ChangedSubscription(COMEVENTSYSCHANGEINFO* pInfo);
    HRESULT ChangedEventClass(COMEVENTSYSCHANGEINFO* pInfo);
}
enum IID_IEnumEventObject = GUID(0xf4a07d63, 0x2e25, 0x11d1, [0x99, 0x64, 0x0, 0xc0, 0x4f, 0xbb, 0xb3, 0x45]);
interface IEnumEventObject : IUnknown
{
    HRESULT Clone(IEnumEventObject* ppInterface);
    HRESULT Next(uint cReqElem, IUnknown* ppInterface, uint* cRetElem);
    HRESULT Reset();
    HRESULT Skip(uint cSkipElem);
}
enum IID_IEventObjectCollection = GUID(0xf89ac270, 0xd4eb, 0x11d1, [0xb6, 0x82, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x16]);
interface IEventObjectCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown* ppUnkEnum);
    HRESULT get_Item(BSTR objectID, VARIANT* pItem);
    HRESULT get_NewEnum(IEnumEventObject* ppEnum);
    HRESULT get_Count(int* pCount);
    HRESULT Add(VARIANT* item, BSTR objectID);
    HRESULT Remove(BSTR objectID);
}
enum IID_IEventProperty = GUID(0xda538ee2, 0xf4de, 0x11d1, [0xb6, 0xbb, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x16]);
interface IEventProperty : IDispatch
{
    HRESULT get_Name(BSTR* propertyName);
    HRESULT put_Name(BSTR propertyName);
    HRESULT get_Value(VARIANT* propertyValue);
    HRESULT put_Value(VARIANT* propertyValue);
}
enum IID_IEventControl = GUID(0x343e2f4, 0x86f6, 0x11d1, [0xb7, 0x60, 0x0, 0xc0, 0x4f, 0xb9, 0x26, 0xaf]);
interface IEventControl : IDispatch
{
    HRESULT SetPublisherFilter(BSTR methodName, IPublisherFilter pPublisherFilter);
    HRESULT get_AllowInprocActivation(BOOL* pfAllowInprocActivation);
    HRESULT put_AllowInprocActivation(BOOL fAllowInprocActivation);
    HRESULT GetSubscriptions(BSTR methodName, BSTR optionalCriteria, int* optionalErrorIndex, IEventObjectCollection* ppCollection);
    HRESULT SetDefaultQuery(BSTR methodName, BSTR criteria, int* errorIndex);
}
enum IID_IMultiInterfaceEventControl = GUID(0x343e2f5, 0x86f6, 0x11d1, [0xb7, 0x60, 0x0, 0xc0, 0x4f, 0xb9, 0x26, 0xaf]);
interface IMultiInterfaceEventControl : IUnknown
{
    HRESULT SetMultiInterfacePublisherFilter(IMultiInterfacePublisherFilter classFilter);
    HRESULT GetSubscriptions(const(GUID)* eventIID, BSTR bstrMethodName, BSTR optionalCriteria, int* optionalErrorIndex, IEventObjectCollection* ppCollection);
    HRESULT SetDefaultQuery(const(GUID)* eventIID, BSTR bstrMethodName, BSTR bstrCriteria, int* errorIndex);
    HRESULT get_AllowInprocActivation(BOOL* pfAllowInprocActivation);
    HRESULT put_AllowInprocActivation(BOOL fAllowInprocActivation);
    HRESULT get_FireInParallel(BOOL* pfFireInParallel);
    HRESULT put_FireInParallel(BOOL fFireInParallel);
}
enum IID_IDontSupportEventSubscription = GUID(0x784121f1, 0x62a6, 0x4b89, [0x85, 0x5f, 0xd6, 0x5f, 0x29, 0x6d, 0xe8, 0x3a]);
interface IDontSupportEventSubscription : IUnknown
{
}
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
