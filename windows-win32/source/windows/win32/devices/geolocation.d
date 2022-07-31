module windows.win32.devices.geolocation;

import windows.win32.guid : GUID;
import windows.win32.devices.sensors : LOCATION_DESIRED_ACCURACY;
import windows.win32.foundation : BOOL, BSTR, CHAR, FILETIME, HRESULT, HWND, NTSTATUS, SYSTEMTIME;
import windows.win32.system.com_ : IDispatch, IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : PROPERTYKEY;

version (Windows):
extern (Windows):

enum GNSS_DRIVER_VERSION_1 = 0x00000001;
enum GNSS_DRIVER_VERSION_2 = 0x00000002;
enum GNSS_DRIVER_VERSION_3 = 0x00000003;
enum GNSS_DRIVER_VERSION_4 = 0x00000004;
enum GNSS_DRIVER_VERSION_5 = 0x00000005;
enum GNSS_DRIVER_VERSION_6 = 0x00000006;
enum IOCTL_GNSS_SEND_PLATFORM_CAPABILITY = 0x00220004;
enum IOCTL_GNSS_GET_DEVICE_CAPABILITY = 0x00220008;
enum IOCTL_GNSS_SEND_DRIVERCOMMAND = 0x0022000c;
enum IOCTL_GNSS_START_FIXSESSION = 0x00220040;
enum IOCTL_GNSS_MODIFY_FIXSESSION = 0x00220044;
enum IOCTL_GNSS_STOP_FIXSESSION = 0x00220048;
enum IOCTL_GNSS_GET_FIXDATA = 0x0022004c;
enum IOCTL_GNSS_INJECT_AGNSS = 0x00220080;
enum IOCTL_GNSS_LISTEN_AGNSS = 0x002200c0;
enum IOCTL_GNSS_LISTEN_ERROR = 0x002200c4;
enum IOCTL_GNSS_LISTEN_NI = 0x00220100;
enum IOCTL_GNSS_SET_SUPL_HSLP = 0x00220104;
enum IOCTL_GNSS_CONFIG_SUPL_CERT = 0x00220108;
enum IOCTL_GNSS_RESPOND_NI = 0x0022010c;
enum IOCTL_GNSS_EXECUTE_CWTEST = 0x00220110;
enum IOCTL_GNSS_EXECUTE_SELFTEST = 0x00220114;
enum IOCTL_GNSS_GET_CHIPSETINFO = 0x00220118;
enum IOCTL_GNSS_LISTEN_NMEA = 0x0022011c;
enum IOCTL_GNSS_SET_V2UPL_CONFIG = 0x00220120;
enum IOCTL_GNSS_CREATE_GEOFENCE = 0x00220140;
enum IOCTL_GNSS_DELETE_GEOFENCE = 0x00220144;
enum IOCTL_GNSS_LISTEN_GEOFENCE_ALERT = 0x00220148;
enum IOCTL_GNSS_LISTEN_GEOFENCES_TRACKINGSTATUS = 0x0022014c;
enum IOCTL_GNSS_LISTEN_DRIVER_REQUEST = 0x00220180;
enum IOCTL_GNSS_START_BREADCRUMBING = 0x002201c0;
enum IOCTL_GNSS_STOP_BREADCRUMBING = 0x002201c4;
enum IOCTL_GNSS_LISTEN_BREADCRUMBING_ALERT = 0x002201c8;
enum IOCTL_GNSS_POP_BREADCRUMBS = 0x002201cc;
enum GNSS_AGNSSFORMAT_XTRA1 = 0x00000001;
enum GNSS_AGNSSFORMAT_XTRA2 = 0x00000002;
enum GNSS_AGNSSFORMAT_LTO = 0x00000004;
enum GNSS_AGNSSFORMAT_XTRA3 = 0x00000008;
enum GNSS_AGNSSFORMAT_XTRA3_1 = 0x00000010;
enum GNSS_AGNSSFORMAT_XTRA3_2 = 0x00000020;
enum GNSS_AGNSSFORMAT_XTRA_INT = 0x00000040;
enum MAX_SERVER_URL_NAME = 0x00000104;
enum MIN_GEOFENCES_REQUIRED = 0x00000064;
enum BREADCRUMBING_UNSUPPORTED = 0x00000000;
enum BREADCRUMBING_VERSION_1 = 0x00000001;
enum MIN_BREADCRUMBS_SUPPORTED = 0x00000078;
enum GNSS_SATELLITE_ANY = 0x00000000;
enum GNSS_SATELLITE_GPS = 0x00000001;
enum GNSS_SATELLITE_GLONASS = 0x00000002;
enum GNSS_SATELLITE_BEIDOU = 0x00000004;
enum GNSS_SATELLITE_GALILEO = 0x00000008;
enum GNSS_OPERMODE_ANY = 0x00000000;
enum GNSS_OPERMODE_MSA = 0x00000001;
enum GNSS_OPERMODE_MSB = 0x00000002;
enum GNSS_OPERMODE_MSS = 0x00000004;
enum GNSS_OPERMODE_CELLID = 0x00000008;
enum GNSS_OPERMODE_AFLT = 0x00000010;
enum GNSS_OPERMODE_OTDOA = 0x00000020;
enum GNSS_NMEALOGGING_NONE = 0x00000000;
enum GNSS_NMEALOGGING_ALL = 0x000000ff;
enum GNSS_FIXDETAIL_BASIC = 0x00000001;
enum GNSS_FIXDETAIL_ACCURACY = 0x00000002;
enum GNSS_FIXDETAIL_SATELLITE = 0x00000004;
enum GNSS_MAXSATELLITE = 0x00000040;
enum GNSS_GEOFENCESUPPORT_SUPPORTED = 0x00000001;
enum GNSS_GEOFENCESUPPORT_CIRCLE = 0x00000002;
enum LOCATION_API_VERSION = 0x00000001;
enum GUID_DEVINTERFACE_GNSS = GUID(0x3336e5e4, 0x18a, 0x4669, [0x84, 0xc5, 0xbd, 0x5, 0xf3, 0xbd, 0x36, 0x8b]);
enum CLSID_Location = GUID(0xe5b8e079, 0xee6d, 0x4e33, [0xa4, 0x38, 0xc8, 0x7f, 0x2e, 0x95, 0x92, 0x54]);
struct Location
{
}
enum CLSID_DefaultLocation = GUID(0x8b7fbfe0, 0x5cd7, 0x494a, [0xaf, 0x8c, 0x28, 0x3a, 0x65, 0x70, 0x75, 0x6]);
struct DefaultLocation
{
}
enum CLSID_LatLongReport = GUID(0xed81c073, 0x1f84, 0x4ca8, [0xa1, 0x61, 0x18, 0x3c, 0x77, 0x6b, 0xc6, 0x51]);
struct LatLongReport
{
}
enum CLSID_CivicAddressReport = GUID(0xd39e7bdd, 0x7d05, 0x46b8, [0x87, 0x21, 0x80, 0xcf, 0x3, 0x5f, 0x57, 0xd7]);
struct CivicAddressReport
{
}
enum CLSID_LatLongReportFactory = GUID(0x9dcc3cc8, 0x8609, 0x4863, [0xba, 0xd4, 0x3, 0x60, 0x1f, 0x4c, 0x65, 0xe8]);
struct LatLongReportFactory
{
}
enum CLSID_CivicAddressReportFactory = GUID(0x2a11f42c, 0x3e81, 0x4ad4, [0x9c, 0xbe, 0x45, 0x57, 0x9d, 0x89, 0x67, 0x1a]);
struct CivicAddressReportFactory
{
}
enum CLSID_DispLatLongReport = GUID(0x7a7c3277, 0x8f84, 0x4636, [0x95, 0xb2, 0xeb, 0xb5, 0x50, 0x7f, 0xf7, 0x7e]);
struct DispLatLongReport
{
}
enum CLSID_DispCivicAddressReport = GUID(0x4c596aec, 0x8544, 0x4082, [0xba, 0x9f, 0xeb, 0xa, 0x7d, 0x8e, 0x65, 0xc6]);
struct DispCivicAddressReport
{
}
alias LOCATION_REPORT_STATUS = int;
enum : int
{
    REPORT_NOT_SUPPORTED = 0x00000000,
    REPORT_ERROR         = 0x00000001,
    REPORT_ACCESS_DENIED = 0x00000002,
    REPORT_INITIALIZING  = 0x00000003,
    REPORT_RUNNING       = 0x00000004,
}

enum IID_ILocationReport = GUID(0xc8b7f7ee, 0x75d0, 0x4db9, [0xb6, 0x2d, 0x7a, 0xf, 0x36, 0x9c, 0xa4, 0x56]);
interface ILocationReport : IUnknown
{
    HRESULT GetSensorID(GUID*);
    HRESULT GetTimestamp(SYSTEMTIME*);
    HRESULT GetValue(const(PROPERTYKEY)*, PROPVARIANT*);
}
enum IID_ILatLongReport = GUID(0x7fed806d, 0xef8, 0x4f07, [0x80, 0xac, 0x36, 0xa0, 0xbe, 0xae, 0x31, 0x34]);
interface ILatLongReport : ILocationReport
{
    HRESULT GetLatitude(double*);
    HRESULT GetLongitude(double*);
    HRESULT GetErrorRadius(double*);
    HRESULT GetAltitude(double*);
    HRESULT GetAltitudeError(double*);
}
enum IID_ICivicAddressReport = GUID(0xc0b19f70, 0x4adf, 0x445d, [0x87, 0xf2, 0xca, 0xd8, 0xfd, 0x71, 0x17, 0x92]);
interface ICivicAddressReport : ILocationReport
{
    HRESULT GetAddressLine1(BSTR*);
    HRESULT GetAddressLine2(BSTR*);
    HRESULT GetCity(BSTR*);
    HRESULT GetStateProvince(BSTR*);
    HRESULT GetPostalCode(BSTR*);
    HRESULT GetCountryRegion(BSTR*);
    HRESULT GetDetailLevel(uint*);
}
enum IID_ILocation = GUID(0xab2ece69, 0x56d9, 0x4f28, [0xb5, 0x25, 0xde, 0x1b, 0xe, 0xe4, 0x42, 0x37]);
interface ILocation : IUnknown
{
    HRESULT RegisterForReport(ILocationEvents, const(GUID)*, uint);
    HRESULT UnregisterForReport(const(GUID)*);
    HRESULT GetReport(const(GUID)*, ILocationReport*);
    HRESULT GetReportStatus(const(GUID)*, LOCATION_REPORT_STATUS*);
    HRESULT GetReportInterval(const(GUID)*, uint*);
    HRESULT SetReportInterval(const(GUID)*, uint);
    HRESULT GetDesiredAccuracy(const(GUID)*, LOCATION_DESIRED_ACCURACY*);
    HRESULT SetDesiredAccuracy(const(GUID)*, LOCATION_DESIRED_ACCURACY);
    HRESULT RequestPermissions(HWND, GUID*, uint, BOOL);
}
enum IID_ILocationPower = GUID(0x193e7729, 0xab6b, 0x4b12, [0x86, 0x17, 0x75, 0x96, 0xe1, 0xbb, 0x19, 0x1c]);
interface ILocationPower : IUnknown
{
    HRESULT Connect();
    HRESULT Disconnect();
}
enum IID_IDefaultLocation = GUID(0xa65af77e, 0x969a, 0x4a2e, [0x8a, 0xca, 0x33, 0xbb, 0x7c, 0xbb, 0x12, 0x35]);
interface IDefaultLocation : IUnknown
{
    HRESULT SetReport(const(GUID)*, ILocationReport);
    HRESULT GetReport(const(GUID)*, ILocationReport*);
}
enum IID_ILocationEvents = GUID(0xcae02bbf, 0x798b, 0x4508, [0xa2, 0x7, 0x35, 0xa7, 0x90, 0x6d, 0xc7, 0x3d]);
interface ILocationEvents : IUnknown
{
    HRESULT OnLocationChanged(const(GUID)*, ILocationReport);
    HRESULT OnStatusChanged(const(GUID)*, LOCATION_REPORT_STATUS);
}
enum IID_IDispLatLongReport = GUID(0x8ae32723, 0x389b, 0x4a11, [0x99, 0x57, 0x5b, 0xdd, 0x48, 0xfc, 0x96, 0x17]);
interface IDispLatLongReport : IDispatch
{
    HRESULT get_Latitude(double*);
    HRESULT get_Longitude(double*);
    HRESULT get_ErrorRadius(double*);
    HRESULT get_Altitude(double*);
    HRESULT get_AltitudeError(double*);
    HRESULT get_Timestamp(double*);
}
enum IID_IDispCivicAddressReport = GUID(0x16ff1a34, 0x9e30, 0x42c3, [0xb4, 0x4d, 0xe2, 0x25, 0x13, 0xb5, 0x76, 0x7a]);
interface IDispCivicAddressReport : IDispatch
{
    HRESULT get_AddressLine1(BSTR*);
    HRESULT get_AddressLine2(BSTR*);
    HRESULT get_City(BSTR*);
    HRESULT get_StateProvince(BSTR*);
    HRESULT get_PostalCode(BSTR*);
    HRESULT get_CountryRegion(BSTR*);
    HRESULT get_DetailLevel(uint*);
    HRESULT get_Timestamp(double*);
}
enum IID_ILocationReportFactory = GUID(0x2daec322, 0x90b2, 0x47e4, [0xbb, 0x8, 0xd, 0xa8, 0x41, 0x93, 0x5a, 0x6b]);
interface ILocationReportFactory : IDispatch
{
    HRESULT ListenForReports(uint);
    HRESULT StopListeningForReports();
    HRESULT get_Status(uint*);
    HRESULT get_ReportInterval(uint*);
    HRESULT put_ReportInterval(uint);
    HRESULT get_DesiredAccuracy(uint*);
    HRESULT put_DesiredAccuracy(uint);
    HRESULT RequestPermissions(uint*);
}
enum IID_ILatLongReportFactory = GUID(0x3f0804cb, 0xb114, 0x447d, [0x83, 0xdd, 0x39, 0x1, 0x74, 0xeb, 0xb0, 0x82]);
interface ILatLongReportFactory : ILocationReportFactory
{
    HRESULT get_LatLongReport(IDispLatLongReport*);
}
enum IID_ICivicAddressReportFactory = GUID(0xbf773b93, 0xc64f, 0x4bee, [0xbe, 0xb2, 0x67, 0xc0, 0xb8, 0xdf, 0x66, 0xe0]);
interface ICivicAddressReportFactory : ILocationReportFactory
{
    HRESULT get_CivicAddressReport(IDispCivicAddressReport*);
}
enum IID__ILatLongReportFactoryEvents = GUID(0x16ee6cb7, 0xab3c, 0x424b, [0x84, 0x9f, 0x26, 0x9b, 0xe5, 0x51, 0xfc, 0xbc]);
interface _ILatLongReportFactoryEvents : IDispatch
{
}
enum IID__ICivicAddressReportFactoryEvents = GUID(0xc96039ff, 0x72ec, 0x4617, [0x89, 0xbd, 0x84, 0xd8, 0x8b, 0xed, 0xc7, 0x22]);
interface _ICivicAddressReportFactoryEvents : IDispatch
{
}
struct GNSS_SUPL_VERSION
{
    uint MajorVersion;
    uint MinorVersion;
}
struct GNSS_SUPL_VERSION_2
{
    uint MajorVersion;
    uint MinorVersion;
    uint ServiceIndicator;
}
struct GNSS_DEVICE_CAPABILITY
{
    uint Size;
    uint Version;
    BOOL SupportMultipleFixSessions;
    BOOL SupportMultipleAppSessions;
    BOOL RequireAGnssInjection;
    uint AgnssFormatSupported;
    uint AgnssFormatPreferred;
    BOOL SupportDistanceTracking;
    BOOL SupportContinuousTracking;
    uint Reserved1;
    BOOL Reserved2;
    BOOL Reserved3;
    BOOL Reserved4;
    BOOL Reserved5;
    uint GeofencingSupport;
    BOOL Reserved6;
    BOOL Reserved7;
    BOOL SupportCpLocation;
    BOOL SupportUplV2;
    BOOL SupportSuplV1;
    BOOL SupportSuplV2;
    GNSS_SUPL_VERSION SupportedSuplVersion;
    uint MaxGeofencesSupported;
    BOOL SupportMultipleSuplRootCert;
    uint GnssBreadCrumbPayloadVersion;
    uint MaxGnssBreadCrumbFixes;
    ubyte[496] Unused;
}
struct GNSS_PLATFORM_CAPABILITY
{
    uint Size;
    uint Version;
    BOOL SupportAgnssInjection;
    uint AgnssFormatSupported;
    ubyte[516] Unused;
}
alias GNSS_DRIVERCOMMAND_TYPE = int;
enum : int
{
    GNSS_SetLocationServiceEnabled   = 0x00000001,
    GNSS_SetLocationNIRequestAllowed = 0x00000002,
    GNSS_ForceSatelliteSystem        = 0x00000003,
    GNSS_ForceOperationMode          = 0x00000004,
    GNSS_ResetEngine                 = 0x00000009,
    GNSS_ClearAgnssData              = 0x0000000a,
    GNSS_SetSuplVersion              = 0x0000000c,
    GNSS_SetNMEALogging              = 0x0000000d,
    GNSS_SetUplServerAccessInterval  = 0x0000000e,
    GNSS_SetNiTimeoutInterval        = 0x0000000f,
    GNSS_ResetGeofencesTracking      = 0x00000010,
    GNSS_SetSuplVersion2             = 0x00000011,
    GNSS_CustomCommand               = 0x00000100,
}

struct GNSS_DRIVERCOMMAND_PARAM
{
    uint Size;
    uint Version;
    GNSS_DRIVERCOMMAND_TYPE CommandType;
    uint Reserved;
    uint CommandDataSize;
    ubyte[512] Unused;
    ubyte[1] CommandData;
}
alias GNSS_FIXSESSIONTYPE = int;
enum : int
{
    GNSS_FixSession_SingleShot         = 0x00000001,
    GNSS_FixSession_DistanceTracking   = 0x00000002,
    GNSS_FixSession_ContinuousTracking = 0x00000003,
    GNSS_FixSession_LKG                = 0x00000004,
}

struct GNSS_SINGLESHOT_PARAM
{
    uint Size;
    uint Version;
    uint ResponseTime;
}
struct GNSS_DISTANCETRACKING_PARAM
{
    uint Size;
    uint Version;
    uint MovementThreshold;
}
struct GNSS_CONTINUOUSTRACKING_PARAM
{
    uint Size;
    uint Version;
    uint PreferredInterval;
}
struct GNSS_LKGFIX_PARAM
{
    uint Size;
    uint Version;
}
struct GNSS_FIXSESSION_PARAM
{
    uint Size;
    uint Version;
    uint FixSessionID;
    GNSS_FIXSESSIONTYPE SessionType;
    uint HorizontalAccuracy;
    uint HorizontalConfidence;
    uint[9] Reserved;
    uint FixLevelOfDetails;
    union
    {
        GNSS_SINGLESHOT_PARAM SingleShotParam;
        GNSS_DISTANCETRACKING_PARAM DistanceParam;
        GNSS_CONTINUOUSTRACKING_PARAM ContinuousParam;
        GNSS_LKGFIX_PARAM LkgFixParam;
        ubyte[268] UnusedParam;
    }
    ubyte[256] Unused;
}
struct GNSS_STOPFIXSESSION_PARAM
{
    uint Size;
    uint Version;
    uint FixSessionID;
    ubyte[512] Unused;
}
struct GNSS_FIXDATA_BASIC
{
    uint Size;
    uint Version;
    double Latitude;
    double Longitude;
    double Altitude;
    double Speed;
    double Heading;
}
struct GNSS_FIXDATA_BASIC_2
{
    uint Size;
    uint Version;
    double Latitude;
    double Longitude;
    double Altitude;
    double Speed;
    double Heading;
    double AltitudeEllipsoid;
}
struct GNSS_FIXDATA_ACCURACY
{
    uint Size;
    uint Version;
    uint HorizontalAccuracy;
    uint HorizontalErrorMajorAxis;
    uint HorizontalErrorMinorAxis;
    uint HorizontalErrorAngle;
    uint HeadingAccuracy;
    uint AltitudeAccuracy;
    uint SpeedAccuracy;
    uint HorizontalConfidence;
    uint HeadingConfidence;
    uint AltitudeConfidence;
    uint SpeedConfidence;
    float PositionDilutionOfPrecision;
    float HorizontalDilutionOfPrecision;
    float VerticalDilutionOfPrecision;
}
struct GNSS_FIXDATA_ACCURACY_2
{
    uint Size;
    uint Version;
    double HorizontalAccuracy;
    double HorizontalErrorMajorAxis;
    double HorizontalErrorMinorAxis;
    double HorizontalErrorAngle;
    double HeadingAccuracy;
    double AltitudeAccuracy;
    double SpeedAccuracy;
    uint HorizontalConfidence;
    uint HeadingConfidence;
    uint AltitudeConfidence;
    uint SpeedConfidence;
    double PositionDilutionOfPrecision;
    double HorizontalDilutionOfPrecision;
    double VerticalDilutionOfPrecision;
    double GeometricDilutionOfPrecision;
    double TimeDilutionOfPrecision;
}
struct GNSS_SATELLITEINFO
{
    uint SatelliteId;
    BOOL UsedInPositiong;
    double Elevation;
    double Azimuth;
    double SignalToNoiseRatio;
}
struct GNSS_FIXDATA_SATELLITE
{
    uint Size;
    uint Version;
    uint SatelliteCount;
    GNSS_SATELLITEINFO[64] SatelliteArray;
}
struct GNSS_FIXDATA
{
    uint Size;
    uint Version;
    uint FixSessionID;
    FILETIME FixTimeStamp;
    BOOL IsFinalFix;
    NTSTATUS FixStatus;
    uint FixLevelOfDetails;
    GNSS_FIXDATA_BASIC BasicData;
    GNSS_FIXDATA_ACCURACY AccuracyData;
    GNSS_FIXDATA_SATELLITE SatelliteData;
}
struct GNSS_FIXDATA_2
{
    uint Size;
    uint Version;
    uint FixSessionID;
    FILETIME FixTimeStamp;
    BOOL IsFinalFix;
    NTSTATUS FixStatus;
    uint FixLevelOfDetails;
    GNSS_FIXDATA_BASIC_2 BasicData;
    GNSS_FIXDATA_ACCURACY_2 AccuracyData;
    GNSS_FIXDATA_SATELLITE SatelliteData;
}
struct GNSS_BREADCRUMBING_PARAM
{
    uint Size;
    uint Version;
    uint MaximumHorizontalUncertainty;
    uint MinDistanceBetweenFixes;
    uint MaximumErrorTimeoutMs;
    ubyte[512] Unused;
}
struct GNSS_BREADCRUMBING_ALERT_DATA
{
    uint Size;
    uint Version;
    ubyte[512] Unused;
}
struct GNSS_BREADCRUMB_V1
{
    FILETIME FixTimeStamp;
    double Latitude;
    double Longitude;
    uint HorizontalAccuracy;
    ushort Speed;
    ushort SpeedAccuracy;
    short Altitude;
    ushort AltitudeAccuracy;
    short Heading;
    ubyte HeadingAccuracy;
    ubyte FixSuccess;
}
struct GNSS_BREADCRUMB_LIST
{
    uint Size;
    uint Version;
    uint NumCrumbs;
    union
    {
        GNSS_BREADCRUMB_V1[50] v1;
    }
}
alias GNSS_GEOREGIONTYPE = int;
enum : int
{
    GNSS_GeoRegion_Circle = 0x00000001,
}

struct GNSS_GEOREGION_CIRCLE
{
    double Latitude;
    double Longitude;
    double RadiusInMeters;
}
struct GNSS_GEOREGION
{
    uint Size;
    uint Version;
    GNSS_GEOREGIONTYPE GeoRegionType;
    union
    {
        GNSS_GEOREGION_CIRCLE Circle;
        ubyte[512] Unused;
    }
}
alias GNSS_GEOFENCE_STATE = int;
enum : int
{
    GNSS_GeofenceState_Unknown = 0x00000000,
    GNSS_GeofenceState_Entered = 0x00000001,
    GNSS_GeofenceState_Exited  = 0x00000002,
}

struct GNSS_GEOFENCE_CREATE_PARAM
{
    uint Size;
    uint Version;
    uint AlertTypes;
    GNSS_GEOFENCE_STATE InitialState;
    GNSS_GEOREGION Boundary;
    ubyte[512] Unused;
}
struct GNSS_GEOFENCE_CREATE_RESPONSE
{
    uint Size;
    uint Version;
    NTSTATUS CreationStatus;
    uint GeofenceID;
    ubyte[512] Unused;
}
struct GNSS_GEOFENCE_DELETE_PARAM
{
    uint Size;
    uint Version;
    uint GeofenceID;
    ubyte[512] Unused;
}
struct GNSS_GEOFENCE_ALERT_DATA
{
    uint Size;
    uint Version;
    uint GeofenceID;
    GNSS_GEOFENCE_STATE GeofenceState;
    GNSS_FIXDATA_BASIC FixBasicData;
    GNSS_FIXDATA_ACCURACY FixAccuracyData;
    ubyte[512] Unused;
}
struct GNSS_GEOFENCES_TRACKINGSTATUS_DATA
{
    uint Size;
    uint Version;
    NTSTATUS Status;
    FILETIME StatusTimeStamp;
    ubyte[512] Unused;
}
alias GNSS_EVENT_TYPE = int;
enum : int
{
    GNSS_Event_FixAvailable            = 0x00000001,
    GNSS_Event_RequireAgnss            = 0x00000002,
    GNSS_Event_Error                   = 0x00000003,
    GNSS_Event_NiRequest               = 0x0000000c,
    GNSS_Event_NmeaData                = 0x0000000d,
    GNSS_Event_GeofenceAlertData       = 0x0000000e,
    GNSS_Event_GeofencesTrackingStatus = 0x0000000f,
    GNSS_Event_DriverRequest           = 0x00000010,
    GNSS_Event_BreadcrumbAlertEvent    = 0x00000011,
    GNSS_Event_FixAvailable_2          = 0x00000012,
    GNSS_Event_Custom                  = 0x00008000,
}

struct GNSS_ERRORINFO
{
    uint Size;
    uint Version;
    uint ErrorCode;
    BOOL IsRecoverable;
    wchar[256] ErrorDescription;
    ubyte[512] Unused;
}
struct GNSS_NMEA_DATA
{
    uint Size;
    uint Version;
    CHAR[256] NmeaSentences;
}
alias GNSS_AGNSS_REQUEST_TYPE = int;
enum : int
{
    GNSS_AGNSS_TimeInjection     = 0x00000001,
    GNSS_AGNSS_PositionInjection = 0x00000002,
    GNSS_AGNSS_BlobInjection     = 0x00000003,
}

struct GNSS_AGNSS_REQUEST_PARAM
{
    uint Size;
    uint Version;
    GNSS_AGNSS_REQUEST_TYPE RequestType;
    uint BlobFormat;
}
alias GNSS_NI_PLANE_TYPE = int;
enum : int
{
    GNSS_NI_SUPL  = 0x00000001,
    GNSS_NI_CP    = 0x00000002,
    GNSS_NI_V2UPL = 0x00000003,
}

alias GNSS_NI_REQUEST_TYPE = int;
enum : int
{
    GNSS_NI_Request_SingleShot  = 0x00000001,
    GNSS_NI_Request_AreaTrigger = 0x00000002,
}

alias GNSS_NI_NOTIFICATION_TYPE = int;
enum : int
{
    GNSS_NI_NoNotifyNoVerify            = 0x00000001,
    GNSS_NI_NotifyOnly                  = 0x00000002,
    GNSS_NI_NotifyVerifyDefaultAllow    = 0x00000003,
    GNSS_NI_NotifyVerifyDefaultNotAllow = 0x00000004,
    GNSS_NI_PrivacyOverride             = 0x00000005,
}

struct GNSS_SUPL_NI_INFO
{
    uint Size;
    uint Version;
    wchar[260] RequestorId;
    wchar[260] ClientName;
    CHAR[260] SuplNiUrl;
}
struct GNSS_CP_NI_INFO
{
    uint Size;
    uint Version;
    wchar[260] RequestorId;
    wchar[260] NotificationText;
}
struct GNSS_V2UPL_NI_INFO
{
    uint Size;
    uint Version;
    wchar[260] RequestorId;
}
struct GNSS_NI_REQUEST_PARAM
{
    uint Size;
    uint Version;
    uint RequestId;
    GNSS_NI_REQUEST_TYPE RequestType;
    GNSS_NI_NOTIFICATION_TYPE NotificationType;
    GNSS_NI_PLANE_TYPE RequestPlaneType;
    union
    {
        GNSS_SUPL_NI_INFO SuplNiInfo;
        GNSS_CP_NI_INFO CpNiInfo;
        GNSS_V2UPL_NI_INFO V2UplNiInfo;
    }
    uint ResponseTimeInSec;
    BOOL EmergencyLocation;
}
alias GNSS_DRIVER_REQUEST = int;
enum : int
{
    SUPL_CONFIG_DATA = 0x00000001,
}

struct GNSS_DRIVER_REQUEST_DATA
{
    uint Size;
    uint Version;
    GNSS_DRIVER_REQUEST Request;
    uint RequestFlag;
}
struct GNSS_EVENT
{
    uint Size;
    uint Version;
    GNSS_EVENT_TYPE EventType;
    uint EventDataSize;
    ubyte[512] Unused;
    union
    {
        GNSS_FIXDATA FixData;
        GNSS_AGNSS_REQUEST_PARAM AgnssRequest;
        GNSS_NI_REQUEST_PARAM NiRequest;
        GNSS_ERRORINFO ErrorInformation;
        GNSS_NMEA_DATA NmeaData;
        GNSS_GEOFENCE_ALERT_DATA GeofenceAlertData;
        GNSS_BREADCRUMBING_ALERT_DATA BreadcrumbAlertData;
        GNSS_GEOFENCES_TRACKINGSTATUS_DATA GeofencesTrackingStatus;
        GNSS_DRIVER_REQUEST_DATA DriverRequestData;
        ubyte[1] CustomData;
    }
}
struct GNSS_EVENT_2
{
    uint Size;
    uint Version;
    GNSS_EVENT_TYPE EventType;
    uint EventDataSize;
    ubyte[512] Unused;
    union
    {
        GNSS_FIXDATA FixData;
        GNSS_FIXDATA_2 FixData2;
        GNSS_AGNSS_REQUEST_PARAM AgnssRequest;
        GNSS_NI_REQUEST_PARAM NiRequest;
        GNSS_ERRORINFO ErrorInformation;
        GNSS_NMEA_DATA NmeaData;
        GNSS_GEOFENCE_ALERT_DATA GeofenceAlertData;
        GNSS_BREADCRUMBING_ALERT_DATA BreadcrumbAlertData;
        GNSS_GEOFENCES_TRACKINGSTATUS_DATA GeofencesTrackingStatus;
        GNSS_DRIVER_REQUEST_DATA DriverRequestData;
        ubyte[1] CustomData;
    }
}
struct GNSS_AGNSS_INJECTTIME
{
    uint Size;
    uint Version;
    FILETIME UtcTime;
    uint TimeUncertainty;
}
struct GNSS_AGNSS_INJECTPOSITION
{
    uint Size;
    uint Version;
    uint Age;
    GNSS_FIXDATA_BASIC BasicData;
    GNSS_FIXDATA_ACCURACY AccuracyData;
}
struct GNSS_AGNSS_INJECTBLOB
{
    uint Size;
    uint Version;
    uint BlobOui;
    uint BlobVersion;
    uint AgnssFormat;
    uint BlobSize;
    ubyte[1] BlobData;
}
struct GNSS_AGNSS_INJECT
{
    uint Size;
    uint Version;
    GNSS_AGNSS_REQUEST_TYPE InjectionType;
    NTSTATUS InjectionStatus;
    uint InjectionDataSize;
    ubyte[512] Unused;
    union
    {
        GNSS_AGNSS_INJECTTIME Time;
        GNSS_AGNSS_INJECTPOSITION Position;
        GNSS_AGNSS_INJECTBLOB BlobData;
    }
}
struct GNSS_SUPL_HSLP_CONFIG
{
    uint Size;
    uint Version;
    CHAR[260] SuplHslp;
    CHAR[260] SuplHslpFromImsi;
    uint Reserved;
    ubyte[512] Unused;
}
alias GNSS_SUPL_CERT_ACTION = int;
enum : int
{
    GNSS_Supl_Cert_Inject = 0x00000001,
    GNSS_Supl_Cert_Delete = 0x00000002,
    GNSS_Supl_Cert_Purge  = 0x00000003,
}

struct GNSS_SUPL_CERT_CONFIG
{
    uint Size;
    uint Version;
    GNSS_SUPL_CERT_ACTION CertAction;
    CHAR[260] SuplCertName;
    uint CertSize;
    ubyte[512] Unused;
    ubyte[1] CertData;
}
struct GNSS_V2UPL_CONFIG
{
    uint Size;
    uint Version;
    CHAR[260] MPC;
    CHAR[260] PDE;
    ubyte ApplicationTypeIndicator_MR;
    ubyte[512] Unused;
}
alias GNSS_NI_USER_RESPONSE = int;
enum : int
{
    GNSS_Ni_UserResponseAccept  = 0x00000001,
    GNSS_Ni_UserResponseDeny    = 0x00000002,
    GNSS_Ni_UserResponseTimeout = 0x00000003,
}

struct GNSS_NI_RESPONSE
{
    uint Size;
    uint Version;
    uint RequestId;
    GNSS_NI_USER_RESPONSE UserResponse;
}
struct GNSS_CWTESTDATA
{
    uint Size;
    uint Version;
    NTSTATUS TestResultStatus;
    double SignalToNoiseRatio;
    double Frequency;
    ubyte[512] Unused;
}
struct GNSS_SELFTESTCONFIG
{
    uint Size;
    uint Version;
    uint TestType;
    ubyte[512] Unused;
    uint InBufLen;
    ubyte[1] InBuffer;
}
struct GNSS_SELFTESTRESULT
{
    uint Size;
    uint Version;
    NTSTATUS TestResultStatus;
    uint Result;
    uint PinFailedBitMask;
    ubyte[512] Unused;
    uint OutBufLen;
    ubyte[1] OutBuffer;
}
struct GNSS_CHIPSETINFO
{
    uint Size;
    uint Version;
    wchar[25] ManufacturerID;
    wchar[25] HardwareID;
    wchar[20] FirmwareVersion;
    ubyte[512] Unused;
}
