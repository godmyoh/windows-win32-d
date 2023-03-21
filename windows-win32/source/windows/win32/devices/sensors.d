module windows.win32.devices.sensors;

import windows.win32.guid : GUID;
import windows.win32.devices.portabledevices : IPortableDeviceKeyCollection, IPortableDeviceValues;
import windows.win32.devices.properties : DEVPROPTYPE;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, FILETIME, HRESULT, HWND, NTSTATUS, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.system.com_ : IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : PROPERTYKEY;

version (Windows):
extern (Windows):

NTSTATUS GetPerformanceTime(uint*);
HRESULT InitPropVariantFromFloat(float, PROPVARIANT*);
NTSTATUS PropKeyFindKeyGetPropVariant(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, BOOLEAN, PROPVARIANT*);
NTSTATUS PropKeyFindKeySetPropVariant(SENSOR_COLLECTION_LIST*, const(PROPERTYKEY)*, BOOLEAN, PROPVARIANT*);
NTSTATUS PropKeyFindKeyGetFileTime(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, FILETIME*);
NTSTATUS PropKeyFindKeyGetGuid(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, GUID*);
NTSTATUS PropKeyFindKeyGetBool(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, BOOL*);
NTSTATUS PropKeyFindKeyGetUlong(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, uint*);
NTSTATUS PropKeyFindKeyGetUshort(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, ushort*);
NTSTATUS PropKeyFindKeyGetFloat(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, float*);
NTSTATUS PropKeyFindKeyGetDouble(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, double*);
NTSTATUS PropKeyFindKeyGetInt32(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, int*);
NTSTATUS PropKeyFindKeyGetInt64(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, long*);
NTSTATUS PropKeyFindKeyGetNthUlong(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, const(uint), uint*);
NTSTATUS PropKeyFindKeyGetNthUshort(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, const(uint), ushort*);
NTSTATUS PropKeyFindKeyGetNthInt64(const(SENSOR_COLLECTION_LIST)*, const(PROPERTYKEY)*, const(uint), long*);
BOOLEAN IsKeyPresentInPropertyList(SENSOR_PROPERTY_LIST*, const(PROPERTYKEY)*);
BOOLEAN IsKeyPresentInCollectionList(SENSOR_COLLECTION_LIST*, const(PROPERTYKEY)*);
BOOLEAN IsCollectionListSame(const(SENSOR_COLLECTION_LIST)*, const(SENSOR_COLLECTION_LIST)*);
NTSTATUS PropVariantGetInformation(const(PROPVARIANT)*, uint*, uint*, void**, DEVPROPTYPE*);
NTSTATUS PropertiesListCopy(SENSOR_PROPERTY_LIST*, const(SENSOR_PROPERTY_LIST)*);
uint PropertiesListGetFillableCount(uint);
uint CollectionsListGetMarshalledSize(const(SENSOR_COLLECTION_LIST)*);
NTSTATUS CollectionsListCopyAndMarshall(SENSOR_COLLECTION_LIST*, const(SENSOR_COLLECTION_LIST)*);
NTSTATUS CollectionsListMarshall(SENSOR_COLLECTION_LIST*);
uint CollectionsListGetMarshalledSizeWithoutSerialization(const(SENSOR_COLLECTION_LIST)*);
NTSTATUS CollectionsListUpdateMarshalledPointer(SENSOR_COLLECTION_LIST*);
NTSTATUS SerializationBufferAllocate(uint, ubyte**);
void SerializationBufferFree(ubyte*);
uint CollectionsListGetSerializedSize(const(SENSOR_COLLECTION_LIST)*);
NTSTATUS CollectionsListSerializeToBuffer(const(SENSOR_COLLECTION_LIST)*, uint, ubyte*);
NTSTATUS CollectionsListAllocateBufferAndSerialize(const(SENSOR_COLLECTION_LIST)*, uint*, ubyte**);
NTSTATUS CollectionsListDeserializeFromBuffer(uint, const(ubyte)*, SENSOR_COLLECTION_LIST*);
NTSTATUS SensorCollectionGetAt(uint, SENSOR_COLLECTION_LIST*, PROPERTYKEY*, PROPVARIANT*);
uint CollectionsListGetFillableCount(uint);
BOOLEAN EvaluateActivityThresholds(SENSOR_COLLECTION_LIST*, SENSOR_COLLECTION_LIST*, SENSOR_COLLECTION_LIST*);
NTSTATUS CollectionsListSortSubscribedActivitiesByConfidence(SENSOR_COLLECTION_LIST*, SENSOR_COLLECTION_LIST*);
HRESULT InitPropVariantFromCLSIDArray(GUID*, uint, PROPVARIANT*);
BOOLEAN IsSensorSubscribed(SENSOR_COLLECTION_LIST*, GUID);
BOOLEAN IsGUIDPresentInList(const(GUID)*, const(uint), const(GUID)*);
enum GUID_DEVINTERFACE_SENSOR = GUID(0xba1bb692, 0x9b7a, 0x4833, [0x9a, 0x1e, 0x52, 0x5e, 0xd1, 0x34, 0xe7, 0xe2]);
enum SENSOR_EVENT_STATE_CHANGED = GUID(0xbfd96016, 0x6bd7, 0x4560, [0xad, 0x34, 0xf2, 0xf6, 0x60, 0x7e, 0x8f, 0x81]);
enum SENSOR_EVENT_DATA_UPDATED = GUID(0x2ed0f2a4, 0x87, 0x41d3, [0x87, 0xdb, 0x67, 0x73, 0x37, 0xb, 0x3c, 0x88]);
enum SENSOR_EVENT_PROPERTY_CHANGED = GUID(0x2358f099, 0x84c9, 0x4d3d, [0x90, 0xdf, 0xc2, 0x42, 0x1e, 0x2b, 0x20, 0x45]);
enum SENSOR_EVENT_ACCELEROMETER_SHAKE = GUID(0x825f5a94, 0xf48, 0x4396, [0x9c, 0xa0, 0x6e, 0xcb, 0x5c, 0x99, 0xd9, 0x15]);
enum SENSOR_EVENT_PARAMETER_COMMON_GUID = GUID(0x64346e30, 0x8728, 0x4b34, [0xbd, 0xf6, 0x4f, 0x52, 0x44, 0x2c, 0x5c, 0x28]);
//enum SENSOR_EVENT_PARAMETER_EVENT_ID = [MISSING];
//enum SENSOR_EVENT_PARAMETER_STATE = [MISSING];
enum SENSOR_ERROR_PARAMETER_COMMON_GUID = GUID(0x77112bcd, 0xfce1, 0x4f43, [0xb8, 0xb8, 0xa8, 0x82, 0x56, 0xad, 0xb4, 0xb3]);
enum SENSOR_PROPERTY_COMMON_GUID = GUID(0x7f8383ec, 0xd3ec, 0x495c, [0xa8, 0xcf, 0xb8, 0xbb, 0xe8, 0x5c, 0x29, 0x20]);
//enum SENSOR_PROPERTY_TYPE = [MISSING];
//enum SENSOR_PROPERTY_STATE = [MISSING];
//enum SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID = [MISSING];
//enum SENSOR_PROPERTY_MANUFACTURER = [MISSING];
//enum SENSOR_PROPERTY_MODEL = [MISSING];
//enum SENSOR_PROPERTY_SERIAL_NUMBER = [MISSING];
//enum SENSOR_PROPERTY_FRIENDLY_NAME = [MISSING];
//enum SENSOR_PROPERTY_DESCRIPTION = [MISSING];
//enum SENSOR_PROPERTY_CONNECTION_TYPE = [MISSING];
//enum SENSOR_PROPERTY_MIN_REPORT_INTERVAL = [MISSING];
//enum SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL = [MISSING];
//enum SENSOR_PROPERTY_CHANGE_SENSITIVITY = [MISSING];
//enum SENSOR_PROPERTY_DEVICE_PATH = [MISSING];
//enum SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE = [MISSING];
//enum SENSOR_PROPERTY_ACCURACY = [MISSING];
//enum SENSOR_PROPERTY_RESOLUTION = [MISSING];
//enum SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY = [MISSING];
//enum SENSOR_PROPERTY_RANGE_MINIMUM = [MISSING];
//enum SENSOR_PROPERTY_RANGE_MAXIMUM = [MISSING];
//enum SENSOR_PROPERTY_HID_USAGE = [MISSING];
//enum SENSOR_PROPERTY_RADIO_STATE = [MISSING];
//enum SENSOR_PROPERTY_RADIO_STATE_PREVIOUS = [MISSING];
enum SENSOR_CATEGORY_ALL = GUID(0xc317c286, 0xc468, 0x4288, [0x99, 0x75, 0xd4, 0xc4, 0x58, 0x7c, 0x44, 0x2c]);
enum SENSOR_CATEGORY_LOCATION = GUID(0xbfa794e4, 0xf964, 0x4fdb, [0x90, 0xf6, 0x51, 0x5, 0x6b, 0xfe, 0x4b, 0x44]);
enum SENSOR_CATEGORY_ENVIRONMENTAL = GUID(0x323439aa, 0x7f66, 0x492b, [0xba, 0xc, 0x73, 0xe9, 0xaa, 0xa, 0x65, 0xd5]);
enum SENSOR_CATEGORY_MOTION = GUID(0xcd09daf1, 0x3b2e, 0x4c3d, [0xb5, 0x98, 0xb5, 0xe5, 0xff, 0x93, 0xfd, 0x46]);
enum SENSOR_CATEGORY_ORIENTATION = GUID(0x9e6c04b6, 0x96fe, 0x4954, [0xb7, 0x26, 0x68, 0x68, 0x2a, 0x47, 0x3f, 0x69]);
enum SENSOR_CATEGORY_MECHANICAL = GUID(0x8d131d68, 0x8ef7, 0x4656, [0x80, 0xb5, 0xcc, 0xcb, 0xd9, 0x37, 0x91, 0xc5]);
enum SENSOR_CATEGORY_ELECTRICAL = GUID(0xfb73fcd8, 0xfc4a, 0x483c, [0xac, 0x58, 0x27, 0xb6, 0x91, 0xc6, 0xbe, 0xff]);
enum SENSOR_CATEGORY_BIOMETRIC = GUID(0xca19690f, 0xa2c7, 0x477d, [0xa9, 0x9e, 0x99, 0xec, 0x6e, 0x2b, 0x56, 0x48]);
enum SENSOR_CATEGORY_LIGHT = GUID(0x17a665c0, 0x9063, 0x4216, [0xb2, 0x2, 0x5c, 0x7a, 0x25, 0x5e, 0x18, 0xce]);
enum SENSOR_CATEGORY_SCANNER = GUID(0xb000e77e, 0xf5b5, 0x420f, [0x81, 0x5d, 0x2, 0x70, 0xa7, 0x26, 0xf2, 0x70]);
enum SENSOR_CATEGORY_OTHER = GUID(0x2c90e7a9, 0xf4c9, 0x4fa2, [0xaf, 0x37, 0x56, 0xd4, 0x71, 0xfe, 0x5a, 0x3d]);
enum SENSOR_CATEGORY_UNSUPPORTED = GUID(0x2beae7fa, 0x19b0, 0x48c5, [0xa1, 0xf6, 0xb5, 0x48, 0xd, 0xc2, 0x6, 0xb0]);
enum SENSOR_TYPE_LOCATION_GPS = GUID(0xed4ca589, 0x327a, 0x4ff9, [0xa5, 0x60, 0x91, 0xda, 0x4b, 0x48, 0x27, 0x5e]);
enum SENSOR_TYPE_LOCATION_STATIC = GUID(0x95f8184, 0xfa9, 0x4445, [0x8e, 0x6e, 0xb7, 0xf, 0x32, 0xb, 0x6b, 0x4c]);
enum SENSOR_TYPE_LOCATION_LOOKUP = GUID(0x3b2eae4a, 0x72ce, 0x436d, [0x96, 0xd2, 0x3c, 0x5b, 0x85, 0x70, 0xe9, 0x87]);
enum SENSOR_TYPE_LOCATION_TRIANGULATION = GUID(0x691c341a, 0x5406, 0x4fe1, [0x94, 0x2f, 0x22, 0x46, 0xcb, 0xeb, 0x39, 0xe0]);
enum SENSOR_TYPE_LOCATION_OTHER = GUID(0x9b2d0566, 0x368, 0x4f71, [0xb8, 0x8d, 0x53, 0x3f, 0x13, 0x20, 0x31, 0xde]);
enum SENSOR_TYPE_LOCATION_BROADCAST = GUID(0xd26988cf, 0x5162, 0x4039, [0xbb, 0x17, 0x4c, 0x58, 0xb6, 0x98, 0xe4, 0x4a]);
enum SENSOR_TYPE_LOCATION_DEAD_RECKONING = GUID(0x1a37d538, 0xf28b, 0x42da, [0x9f, 0xce, 0xa9, 0xd0, 0xa2, 0xa6, 0xd8, 0x29]);
enum SENSOR_TYPE_ENVIRONMENTAL_TEMPERATURE = GUID(0x4fd0ec4, 0xd5da, 0x45fa, [0x95, 0xa9, 0x5d, 0xb3, 0x8e, 0xe1, 0x93, 0x6]);
enum SENSOR_TYPE_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE = GUID(0xe903829, 0xff8a, 0x4a93, [0x97, 0xdf, 0x3d, 0xcb, 0xde, 0x40, 0x22, 0x88]);
enum SENSOR_TYPE_ENVIRONMENTAL_HUMIDITY = GUID(0x5c72bf67, 0xbd7e, 0x4257, [0x99, 0xb, 0x98, 0xa3, 0xba, 0x3b, 0x40, 0xa]);
enum SENSOR_TYPE_ENVIRONMENTAL_WIND_SPEED = GUID(0xdd50607b, 0xa45f, 0x42cd, [0x8e, 0xfd, 0xec, 0x61, 0x76, 0x1c, 0x42, 0x26]);
enum SENSOR_TYPE_ENVIRONMENTAL_WIND_DIRECTION = GUID(0x9ef57a35, 0x9306, 0x434d, [0xaf, 0x9, 0x37, 0xfa, 0x5a, 0x9c, 0x0, 0xbd]);
enum SENSOR_TYPE_ACCELEROMETER_1D = GUID(0xc04d2387, 0x7340, 0x4cc2, [0x99, 0x1e, 0x3b, 0x18, 0xcb, 0x8e, 0xf2, 0xf4]);
enum SENSOR_TYPE_ACCELEROMETER_2D = GUID(0xb2c517a8, 0xf6b5, 0x4ba6, [0xa4, 0x23, 0x5d, 0xf5, 0x60, 0xb4, 0xcc, 0x7]);
enum SENSOR_TYPE_ACCELEROMETER_3D = GUID(0xc2fb0f5f, 0xe2d2, 0x4c78, [0xbc, 0xd0, 0x35, 0x2a, 0x95, 0x82, 0x81, 0x9d]);
enum SENSOR_TYPE_MOTION_DETECTOR = GUID(0x5c7c1a12, 0x30a5, 0x43b9, [0xa4, 0xb2, 0xcf, 0x9, 0xec, 0x5b, 0x7b, 0xe8]);
enum SENSOR_TYPE_GYROMETER_1D = GUID(0xfa088734, 0xf552, 0x4584, [0x83, 0x24, 0xed, 0xfa, 0xf6, 0x49, 0x65, 0x2c]);
enum SENSOR_TYPE_GYROMETER_2D = GUID(0x31ef4f83, 0x919b, 0x48bf, [0x8d, 0xe0, 0x5d, 0x7a, 0x9d, 0x24, 0x5, 0x56]);
enum SENSOR_TYPE_GYROMETER_3D = GUID(0x9485f5a, 0x759e, 0x42c2, [0xbd, 0x4b, 0xa3, 0x49, 0xb7, 0x5c, 0x86, 0x43]);
enum SENSOR_TYPE_SPEEDOMETER = GUID(0x6bd73c1f, 0xbb4, 0x4310, [0x81, 0xb2, 0xdf, 0xc1, 0x8a, 0x52, 0xbf, 0x94]);
enum SENSOR_TYPE_COMPASS_1D = GUID(0xa415f6c5, 0xcb50, 0x49d0, [0x8e, 0x62, 0xa8, 0x27, 0xb, 0xd7, 0xa2, 0x6c]);
enum SENSOR_TYPE_COMPASS_2D = GUID(0x15655cc0, 0x997a, 0x4d30, [0x84, 0xdb, 0x57, 0xca, 0xba, 0x36, 0x48, 0xbb]);
enum SENSOR_TYPE_COMPASS_3D = GUID(0x76b5ce0d, 0x17dd, 0x414d, [0x93, 0xa1, 0xe1, 0x27, 0xf4, 0xb, 0xdf, 0x6e]);
enum SENSOR_TYPE_INCLINOMETER_1D = GUID(0xb96f98c5, 0x7a75, 0x4ba7, [0x94, 0xe9, 0xac, 0x86, 0x8c, 0x96, 0x6d, 0xd8]);
enum SENSOR_TYPE_INCLINOMETER_2D = GUID(0xab140f6d, 0x83eb, 0x4264, [0xb7, 0xb, 0xb1, 0x6a, 0x5b, 0x25, 0x6a, 0x1]);
enum SENSOR_TYPE_INCLINOMETER_3D = GUID(0xb84919fb, 0xea85, 0x4976, [0x84, 0x44, 0x6f, 0x6f, 0x5c, 0x6d, 0x31, 0xdb]);
enum SENSOR_TYPE_DISTANCE_1D = GUID(0x5f14ab2f, 0x1407, 0x4306, [0xa9, 0x3f, 0xb1, 0xdb, 0xab, 0xe4, 0xf9, 0xc0]);
enum SENSOR_TYPE_DISTANCE_2D = GUID(0x5cf9a46c, 0xa9a2, 0x4e55, [0xb6, 0xa1, 0xa0, 0x4a, 0xaf, 0xa9, 0x5a, 0x92]);
enum SENSOR_TYPE_DISTANCE_3D = GUID(0xa20cae31, 0xe25, 0x4772, [0x9f, 0xe5, 0x96, 0x60, 0x8a, 0x13, 0x54, 0xb2]);
enum SENSOR_TYPE_AGGREGATED_QUADRANT_ORIENTATION = GUID(0x9f81f1af, 0xc4ab, 0x4307, [0x99, 0x4, 0xc8, 0x28, 0xbf, 0xb9, 0x8, 0x29]);
enum SENSOR_TYPE_AGGREGATED_DEVICE_ORIENTATION = GUID(0xcdb5d8f7, 0x3cfd, 0x41c8, [0x85, 0x42, 0xcc, 0xe6, 0x22, 0xcf, 0x5d, 0x6e]);
enum SENSOR_TYPE_AGGREGATED_SIMPLE_DEVICE_ORIENTATION = GUID(0x86a19291, 0x482, 0x402c, [0xbf, 0x4c, 0xad, 0xda, 0xc5, 0x2b, 0x1c, 0x39]);
enum SENSOR_TYPE_VOLTAGE = GUID(0xc5484637, 0x4fb7, 0x4953, [0x98, 0xb8, 0xa5, 0x6d, 0x8a, 0xa1, 0xfb, 0x1e]);
enum SENSOR_TYPE_CURRENT = GUID(0x5adc9fce, 0x15a0, 0x4bbe, [0xa1, 0xad, 0x2d, 0x38, 0xa9, 0xae, 0x83, 0x1c]);
enum SENSOR_TYPE_CAPACITANCE = GUID(0xca2ffb1c, 0x2317, 0x49c0, [0xa0, 0xb4, 0xb6, 0x3c, 0xe6, 0x34, 0x61, 0xa0]);
enum SENSOR_TYPE_RESISTANCE = GUID(0x9993d2c8, 0xc157, 0x4a52, [0xa7, 0xb5, 0x19, 0x5c, 0x76, 0x3, 0x72, 0x31]);
enum SENSOR_TYPE_INDUCTANCE = GUID(0xdc1d933f, 0xc435, 0x4c7d, [0xa2, 0xfe, 0x60, 0x71, 0x92, 0xa5, 0x24, 0xd3]);
enum SENSOR_TYPE_ELECTRICAL_POWER = GUID(0x212f10f5, 0x14ab, 0x4376, [0x9a, 0x43, 0xa7, 0x79, 0x40, 0x98, 0xc2, 0xfe]);
enum SENSOR_TYPE_POTENTIOMETER = GUID(0x2b3681a9, 0xcadc, 0x45aa, [0xa6, 0xff, 0x54, 0x95, 0x7c, 0x8b, 0xb4, 0x40]);
enum SENSOR_TYPE_FREQUENCY = GUID(0x8cd2cbb6, 0x73e6, 0x4640, [0xa7, 0x9, 0x72, 0xae, 0x8f, 0xb6, 0xd, 0x7f]);
enum SENSOR_TYPE_BOOLEAN_SWITCH = GUID(0x9c7e371f, 0x1041, 0x460b, [0x8d, 0x5c, 0x71, 0xe4, 0x75, 0x2e, 0x35, 0xc]);
enum SENSOR_TYPE_MULTIVALUE_SWITCH = GUID(0xb3ee4d76, 0x37a4, 0x4402, [0xb2, 0x5e, 0x99, 0xc6, 0xa, 0x77, 0x5f, 0xa1]);
enum SENSOR_TYPE_FORCE = GUID(0xc2ab2b02, 0x1a1c, 0x4778, [0xa8, 0x1b, 0x95, 0x4a, 0x17, 0x88, 0xcc, 0x75]);
enum SENSOR_TYPE_SCALE = GUID(0xc06dd92c, 0x7feb, 0x438e, [0x9b, 0xf6, 0x82, 0x20, 0x7f, 0xff, 0x5b, 0xb8]);
enum SENSOR_TYPE_PRESSURE = GUID(0x26d31f34, 0x6352, 0x41cf, [0xb7, 0x93, 0xea, 0x7, 0x13, 0xd5, 0x3d, 0x77]);
enum SENSOR_TYPE_STRAIN = GUID(0xc6d1ec0e, 0x6803, 0x4361, [0xad, 0x3d, 0x85, 0xbc, 0xc5, 0x8c, 0x6d, 0x29]);
enum SENSOR_TYPE_BOOLEAN_SWITCH_ARRAY = GUID(0x545c8ba5, 0xb143, 0x4545, [0x86, 0x8f, 0xca, 0x7f, 0xd9, 0x86, 0xb4, 0xf6]);
enum SENSOR_TYPE_HUMAN_PRESENCE = GUID(0xc138c12b, 0xad52, 0x451c, [0x93, 0x75, 0x87, 0xf5, 0x18, 0xff, 0x10, 0xc6]);
enum SENSOR_TYPE_HUMAN_PROXIMITY = GUID(0x5220dae9, 0x3179, 0x4430, [0x9f, 0x90, 0x6, 0x26, 0x6d, 0x2a, 0x34, 0xde]);
enum SENSOR_TYPE_TOUCH = GUID(0x17db3018, 0x6c4, 0x4f7d, [0x81, 0xaf, 0x92, 0x74, 0xb7, 0x59, 0x9c, 0x27]);
enum SENSOR_TYPE_AMBIENT_LIGHT = GUID(0x97f115c8, 0x599a, 0x4153, [0x88, 0x94, 0xd2, 0xd1, 0x28, 0x99, 0x91, 0x8a]);
enum SENSOR_TYPE_RFID_SCANNER = GUID(0x44328ef5, 0x2dd, 0x4e8d, [0xad, 0x5d, 0x92, 0x49, 0x83, 0x2b, 0x2e, 0xca]);
enum SENSOR_TYPE_BARCODE_SCANNER = GUID(0x990b3d8f, 0x85bb, 0x45ff, [0x91, 0x4d, 0x99, 0x8c, 0x4, 0xf3, 0x72, 0xdf]);
enum SENSOR_TYPE_CUSTOM = GUID(0xe83af229, 0x8640, 0x4d18, [0xa2, 0x13, 0xe2, 0x26, 0x75, 0xeb, 0xb2, 0xc3]);
enum SENSOR_TYPE_UNKNOWN = GUID(0x10ba83e3, 0xef4f, 0x41ed, [0x98, 0x85, 0xa8, 0x7d, 0x64, 0x35, 0xa8, 0xe1]);
enum SENSOR_DATA_TYPE_COMMON_GUID = GUID(0xdb5e0cf2, 0xcf1f, 0x4c18, [0xb4, 0x6c, 0xd8, 0x60, 0x11, 0xd6, 0x21, 0x50]);
//enum SENSOR_DATA_TYPE_TIMESTAMP = [MISSING];
enum SENSOR_DATA_TYPE_LOCATION_GUID = GUID(0x55c74d8, 0xca6f, 0x47d6, [0x95, 0xc6, 0x1e, 0xd3, 0x63, 0x7a, 0xf, 0xf4]);
//enum SENSOR_DATA_TYPE_LATITUDE_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_LONGITUDE_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_SPEED_KNOTS = [MISSING];
//enum SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_VARIATION = [MISSING];
//enum SENSOR_DATA_TYPE_FIX_QUALITY = [MISSING];
//enum SENSOR_DATA_TYPE_FIX_TYPE = [MISSING];
//enum SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION = [MISSING];
//enum SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION = [MISSING];
//enum SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_USED_COUNT = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_USED_PRNS = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_IN_VIEW = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO = [MISSING];
//enum SENSOR_DATA_TYPE_ERROR_RADIUS_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_ADDRESS1 = [MISSING];
//enum SENSOR_DATA_TYPE_ADDRESS2 = [MISSING];
//enum SENSOR_DATA_TYPE_CITY = [MISSING];
//enum SENSOR_DATA_TYPE_STATE_PROVINCE = [MISSING];
//enum SENSOR_DATA_TYPE_POSTALCODE = [MISSING];
//enum SENSOR_DATA_TYPE_COUNTRY_REGION = [MISSING];
//enum SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_GPS_SELECTION_MODE = [MISSING];
//enum SENSOR_DATA_TYPE_GPS_OPERATION_MODE = [MISSING];
//enum SENSOR_DATA_TYPE_GPS_STATUS = [MISSING];
//enum SENSOR_DATA_TYPE_GEOIDAL_SEPARATION = [MISSING];
//enum SENSOR_DATA_TYPE_DGPS_DATA_AGE = [MISSING];
//enum SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID = [MISSING];
//enum SENSOR_DATA_TYPE_NMEA_SENTENCE = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID = [MISSING];
//enum SENSOR_DATA_TYPE_LOCATION_SOURCE = [MISSING];
//enum SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS = [MISSING];
enum SENSOR_DATA_TYPE_ENVIRONMENTAL_GUID = GUID(0x8b0aa2f1, 0x2d57, 0x42ee, [0x8c, 0xc0, 0x4d, 0x27, 0x62, 0x2b, 0x46, 0xc4]);
//enum SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS = [MISSING];
//enum SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT = [MISSING];
//enum SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR = [MISSING];
//enum SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE = [MISSING];
//enum SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND = [MISSING];
enum SENSOR_DATA_TYPE_MOTION_GUID = GUID(0x3f8a69a2, 0x7c5, 0x4e48, [0xa9, 0x65, 0xcd, 0x79, 0x7a, 0xab, 0x56, 0xd5]);
//enum SENSOR_DATA_TYPE_ACCELERATION_X_G = [MISSING];
//enum SENSOR_DATA_TYPE_ACCELERATION_Y_G = [MISSING];
//enum SENSOR_DATA_TYPE_ACCELERATION_Z_G = [MISSING];
//enum SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED = [MISSING];
//enum SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED = [MISSING];
//enum SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED = [MISSING];
//enum SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND = [MISSING];
//enum SENSOR_DATA_TYPE_MOTION_STATE = [MISSING];
//enum SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND = [MISSING];
//enum SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND = [MISSING];
//enum SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND = [MISSING];
enum SENSOR_DATA_TYPE_ORIENTATION_GUID = GUID(0x1637d8a2, 0x4248, 0x4275, [0x86, 0x5d, 0x55, 0x8d, 0xe8, 0x4a, 0xed, 0xfd]);
//enum SENSOR_DATA_TYPE_TILT_X_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_TILT_Y_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_TILT_Z_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_DISTANCE_X_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_DISTANCE_Y_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_DISTANCE_Z_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES = [MISSING];
//enum SENSOR_DATA_TYPE_ROTATION_MATRIX = [MISSING];
//enum SENSOR_DATA_TYPE_QUATERNION = [MISSING];
//enum SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS = [MISSING];
//enum SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY = [MISSING];
enum SENSOR_DATA_TYPE_GUID_MECHANICAL_GUID = GUID(0x38564a7c, 0xf2f2, 0x49bb, [0x9b, 0x2b, 0xba, 0x60, 0xf6, 0x6a, 0x58, 0xdf]);
//enum SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE = [MISSING];
//enum SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE = [MISSING];
//enum SENSOR_DATA_TYPE_FORCE_NEWTONS = [MISSING];
//enum SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL = [MISSING];
//enum SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL = [MISSING];
//enum SENSOR_DATA_TYPE_STRAIN = [MISSING];
//enum SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS = [MISSING];
//enum SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES = [MISSING];
enum SENSOR_DATA_TYPE_BIOMETRIC_GUID = GUID(0x2299288a, 0x6d9e, 0x4b0b, [0xb7, 0xec, 0x35, 0x28, 0xf8, 0x9e, 0x40, 0xaf]);
//enum SENSOR_DATA_TYPE_HUMAN_PRESENCE = [MISSING];
//enum SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS = [MISSING];
//enum SENSOR_DATA_TYPE_TOUCH_STATE = [MISSING];
enum SENSOR_DATA_TYPE_LIGHT_GUID = GUID(0xe4c77ce2, 0xdcb7, 0x46e9, [0x84, 0x39, 0x4f, 0xec, 0x54, 0x88, 0x33, 0xa6]);
//enum SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX = [MISSING];
//enum SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN = [MISSING];
//enum SENSOR_DATA_TYPE_LIGHT_CHROMACITY = [MISSING];
enum SENSOR_DATA_TYPE_SCANNER_GUID = GUID(0xd7a59a3c, 0x3421, 0x44ab, [0x8d, 0x3a, 0x9d, 0xe8, 0xab, 0x6c, 0x4c, 0xae]);
//enum SENSOR_DATA_TYPE_RFID_TAG_40_BIT = [MISSING];
enum SENSOR_DATA_TYPE_ELECTRICAL_GUID = GUID(0xbbb246d1, 0xe242, 0x4780, [0xa2, 0xd3, 0xcd, 0xed, 0x84, 0xf3, 0x58, 0x42]);
//enum SENSOR_DATA_TYPE_VOLTAGE_VOLTS = [MISSING];
//enum SENSOR_DATA_TYPE_CURRENT_AMPS = [MISSING];
//enum SENSOR_DATA_TYPE_CAPACITANCE_FARAD = [MISSING];
//enum SENSOR_DATA_TYPE_RESISTANCE_OHMS = [MISSING];
//enum SENSOR_DATA_TYPE_INDUCTANCE_HENRY = [MISSING];
//enum SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS = [MISSING];
//enum SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE = [MISSING];
//enum SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ = [MISSING];
enum SENSOR_DATA_TYPE_CUSTOM_GUID = GUID(0xb14c764f, 0x7cf, 0x41e8, [0x9d, 0x82, 0xeb, 0xe3, 0xd0, 0x77, 0x6a, 0x6f]);
//enum SENSOR_DATA_TYPE_CUSTOM_USAGE = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE1 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE2 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE3 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE4 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE5 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE6 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE7 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE8 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE9 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE10 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE11 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE12 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE13 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE14 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE15 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE16 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE17 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE18 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE19 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE20 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE21 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE22 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE23 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE24 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE25 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE26 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE27 = [MISSING];
//enum SENSOR_DATA_TYPE_CUSTOM_VALUE28 = [MISSING];
enum SENSOR_PROPERTY_TEST_GUID = GUID(0xe1e962f4, 0x6e65, 0x45f7, [0x9c, 0x36, 0xd4, 0x87, 0xb7, 0xb1, 0xbd, 0x34]);
//enum SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA = [MISSING];
//enum SENSOR_PROPERTY_TURN_ON_OFF_NMEA = [MISSING];
enum GNSS_CLEAR_ALL_ASSISTANCE_DATA = 0x00000001;
enum GUID_SensorCategory_All = GUID(0xc317c286, 0xc468, 0x4288, [0x99, 0x75, 0xd4, 0xc4, 0x58, 0x7c, 0x44, 0x2c]);
enum GUID_SensorCategory_Biometric = GUID(0xca19690f, 0xa2c7, 0x477d, [0xa9, 0x9e, 0x99, 0xec, 0x6e, 0x2b, 0x56, 0x48]);
enum GUID_SensorCategory_Electrical = GUID(0xfb73fcd8, 0xfc4a, 0x483c, [0xac, 0x58, 0x27, 0xb6, 0x91, 0xc6, 0xbe, 0xff]);
enum GUID_SensorCategory_Environmental = GUID(0x323439aa, 0x7f66, 0x492b, [0xba, 0xc, 0x73, 0xe9, 0xaa, 0xa, 0x65, 0xd5]);
enum GUID_SensorCategory_Light = GUID(0x17a665c0, 0x9063, 0x4216, [0xb2, 0x2, 0x5c, 0x7a, 0x25, 0x5e, 0x18, 0xce]);
enum GUID_SensorCategory_Location = GUID(0xbfa794e4, 0xf964, 0x4fdb, [0x90, 0xf6, 0x51, 0x5, 0x6b, 0xfe, 0x4b, 0x44]);
enum GUID_SensorCategory_Mechanical = GUID(0x8d131d68, 0x8ef7, 0x4656, [0x80, 0xb5, 0xcc, 0xcb, 0xd9, 0x37, 0x91, 0xc5]);
enum GUID_SensorCategory_Motion = GUID(0xcd09daf1, 0x3b2e, 0x4c3d, [0xb5, 0x98, 0xb5, 0xe5, 0xff, 0x93, 0xfd, 0x46]);
enum GUID_SensorCategory_Orientation = GUID(0x9e6c04b6, 0x96fe, 0x4954, [0xb7, 0x26, 0x68, 0x68, 0x2a, 0x47, 0x3f, 0x69]);
enum GUID_SensorCategory_Other = GUID(0x2c90e7a9, 0xf4c9, 0x4fa2, [0xaf, 0x37, 0x56, 0xd4, 0x71, 0xfe, 0x5a, 0x3d]);
enum GUID_SensorCategory_PersonalActivity = GUID(0xf1609081, 0x1e12, 0x412b, [0xa1, 0x4d, 0xcb, 0xb0, 0xe9, 0x5b, 0xd2, 0xe5]);
enum GUID_SensorCategory_Scanner = GUID(0xb000e77e, 0xf5b5, 0x420f, [0x81, 0x5d, 0x2, 0x70, 0xa7, 0x26, 0xf2, 0x70]);
enum GUID_SensorCategory_Unsupported = GUID(0x2beae7fa, 0x19b0, 0x48c5, [0xa1, 0xf6, 0xb5, 0x48, 0xd, 0xc2, 0x6, 0xb0]);
enum GUID_SensorType_Accelerometer3D = GUID(0xc2fb0f5f, 0xe2d2, 0x4c78, [0xbc, 0xd0, 0x35, 0x2a, 0x95, 0x82, 0x81, 0x9d]);
enum GUID_SensorType_ActivityDetection = GUID(0x9d9e0118, 0x1807, 0x4f2e, [0x96, 0xe4, 0x2c, 0xe5, 0x71, 0x42, 0xe1, 0x96]);
enum GUID_SensorType_AmbientLight = GUID(0x97f115c8, 0x599a, 0x4153, [0x88, 0x94, 0xd2, 0xd1, 0x28, 0x99, 0x91, 0x8a]);
enum GUID_SensorType_Barometer = GUID(0xe903829, 0xff8a, 0x4a93, [0x97, 0xdf, 0x3d, 0xcb, 0xde, 0x40, 0x22, 0x88]);
enum GUID_SensorType_Custom = GUID(0xe83af229, 0x8640, 0x4d18, [0xa2, 0x13, 0xe2, 0x26, 0x75, 0xeb, 0xb2, 0xc3]);
enum GUID_SensorType_FloorElevation = GUID(0xade4987f, 0x7ac4, 0x4dfa, [0x97, 0x22, 0xa, 0x2, 0x71, 0x81, 0xc7, 0x47]);
enum GUID_SensorType_GeomagneticOrientation = GUID(0xe77195f8, 0x2d1f, 0x4823, [0x97, 0x1b, 0x1c, 0x44, 0x67, 0x55, 0x6c, 0x9d]);
enum GUID_SensorType_GravityVector = GUID(0x3b52c73, 0xbb76, 0x463f, [0x95, 0x24, 0x38, 0xde, 0x76, 0xeb, 0x70, 0xb]);
enum GUID_SensorType_Gyrometer3D = GUID(0x9485f5a, 0x759e, 0x42c2, [0xbd, 0x4b, 0xa3, 0x49, 0xb7, 0x5c, 0x86, 0x43]);
enum GUID_SensorType_Humidity = GUID(0x5c72bf67, 0xbd7e, 0x4257, [0x99, 0xb, 0x98, 0xa3, 0xba, 0x3b, 0x40, 0xa]);
enum GUID_SensorType_LinearAccelerometer = GUID(0x38b0283, 0x97b4, 0x41c8, [0xbc, 0x24, 0x5f, 0xf1, 0xaa, 0x48, 0xfe, 0xc7]);
enum GUID_SensorType_Magnetometer3D = GUID(0x55e5effb, 0x15c7, 0x40df, [0x86, 0x98, 0xa8, 0x4b, 0x7c, 0x86, 0x3c, 0x53]);
enum GUID_SensorType_Orientation = GUID(0xcdb5d8f7, 0x3cfd, 0x41c8, [0x85, 0x42, 0xcc, 0xe6, 0x22, 0xcf, 0x5d, 0x6e]);
enum GUID_SensorType_Pedometer = GUID(0xb19f89af, 0xe3eb, 0x444b, [0x8d, 0xea, 0x20, 0x25, 0x75, 0xa7, 0x15, 0x99]);
enum GUID_SensorType_Proximity = GUID(0x5220dae9, 0x3179, 0x4430, [0x9f, 0x90, 0x6, 0x26, 0x6d, 0x2a, 0x34, 0xde]);
enum GUID_SensorType_RelativeOrientation = GUID(0x40993b51, 0x4706, 0x44dc, [0x98, 0xd5, 0xc9, 0x20, 0xc0, 0x37, 0xff, 0xab]);
enum GUID_SensorType_SimpleDeviceOrientation = GUID(0x86a19291, 0x482, 0x402c, [0xbf, 0x4c, 0xad, 0xda, 0xc5, 0x2b, 0x1c, 0x39]);
enum GUID_SensorType_Temperature = GUID(0x4fd0ec4, 0xd5da, 0x45fa, [0x95, 0xa9, 0x5d, 0xb3, 0x8e, 0xe1, 0x93, 0x6]);
enum GUID_SensorType_HingeAngle = GUID(0x82358065, 0xf4c4, 0x4da1, [0xb2, 0x72, 0x13, 0xc2, 0x33, 0x32, 0xa2, 0x7]);
enum SENSOR_PROPERTY_LIST_HEADER_SIZE = 0x00000008;
enum CLSID_SensorManager = GUID(0x77a1c827, 0xfcd2, 0x4689, [0x89, 0x15, 0x9d, 0x61, 0x3c, 0xc5, 0xfa, 0x3e]);
struct SensorManager
{
}
enum CLSID_SensorCollection = GUID(0x79c43adb, 0xa429, 0x469f, [0xaa, 0x39, 0x2f, 0x2b, 0x74, 0xb7, 0x59, 0x37]);
struct SensorCollection
{
}
enum CLSID_Sensor = GUID(0xe97ced00, 0x523a, 0x4133, [0xbf, 0x6f, 0xd3, 0xa2, 0xda, 0xe7, 0xf6, 0xba]);
struct Sensor
{
}
enum CLSID_SensorDataReport = GUID(0x4ea9d6ef, 0x694b, 0x4218, [0x88, 0x16, 0xcc, 0xda, 0x8d, 0xa7, 0x4b, 0xba]);
struct SensorDataReport
{
}
alias SensorState = int;
enum : int
{
    SENSOR_STATE_MIN           = 0x00000000,
    SENSOR_STATE_READY         = 0x00000000,
    SENSOR_STATE_NOT_AVAILABLE = 0x00000001,
    SENSOR_STATE_NO_DATA       = 0x00000002,
    SENSOR_STATE_INITIALIZING  = 0x00000003,
    SENSOR_STATE_ACCESS_DENIED = 0x00000004,
    SENSOR_STATE_ERROR         = 0x00000005,
    SENSOR_STATE_MAX           = 0x00000005,
}

alias SensorConnectionType = int;
enum : int
{
    SENSOR_CONNECTION_TYPE_PC_INTEGRATED = 0x00000000,
    SENSOR_CONNECTION_TYPE_PC_ATTACHED   = 0x00000001,
    SENSOR_CONNECTION_TYPE_PC_EXTERNAL   = 0x00000002,
}

alias LOCATION_DESIRED_ACCURACY = int;
enum : int
{
    LOCATION_DESIRED_ACCURACY_DEFAULT = 0x00000000,
    LOCATION_DESIRED_ACCURACY_HIGH    = 0x00000001,
}

alias LOCATION_POSITION_SOURCE = int;
enum : int
{
    LOCATION_POSITION_SOURCE_CELLULAR  = 0x00000000,
    LOCATION_POSITION_SOURCE_SATELLITE = 0x00000001,
    LOCATION_POSITION_SOURCE_WIFI      = 0x00000002,
    LOCATION_POSITION_SOURCE_IPADDRESS = 0x00000003,
    LOCATION_POSITION_SOURCE_UNKNOWN   = 0x00000004,
}

alias SimpleDeviceOrientation = int;
enum : int
{
    SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED       = 0x00000000,
    SIMPLE_DEVICE_ORIENTATION_ROTATED_90        = 0x00000001,
    SIMPLE_DEVICE_ORIENTATION_ROTATED_180       = 0x00000002,
    SIMPLE_DEVICE_ORIENTATION_ROTATED_270       = 0x00000003,
    SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP   = 0x00000004,
    SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN = 0x00000005,
}

alias MagnetometerAccuracy = int;
enum : int
{
    MAGNETOMETER_ACCURACY_UNKNOWN     = 0x00000000,
    MAGNETOMETER_ACCURACY_UNRELIABLE  = 0x00000001,
    MAGNETOMETER_ACCURACY_APPROXIMATE = 0x00000002,
    MAGNETOMETER_ACCURACY_HIGH        = 0x00000003,
}

enum IID_ISensorManager = GUID(0xbd77db67, 0x45a8, 0x42dc, [0x8d, 0x0, 0x6d, 0xcf, 0x15, 0xf8, 0x37, 0x7a]);
interface ISensorManager : IUnknown
{
    HRESULT GetSensorsByCategory(GUID*, ISensorCollection*);
    HRESULT GetSensorsByType(GUID*, ISensorCollection*);
    HRESULT GetSensorByID(GUID*, ISensor*);
    HRESULT SetEventSink(ISensorManagerEvents);
    HRESULT RequestPermissions(HWND, ISensorCollection, BOOL);
}
enum IID_ILocationPermissions = GUID(0xd5fb0a7f, 0xe74e, 0x44f5, [0x8e, 0x2, 0x48, 0x6, 0x86, 0x3a, 0x27, 0x4f]);
interface ILocationPermissions : IUnknown
{
    HRESULT GetGlobalLocationPermission(BOOL*);
    HRESULT CheckLocationCapability(uint);
}
enum IID_ISensorCollection = GUID(0x23571e11, 0xe545, 0x4dd8, [0xa3, 0x37, 0xb8, 0x9b, 0xf4, 0x4b, 0x10, 0xdf]);
interface ISensorCollection : IUnknown
{
    HRESULT GetAt(uint, ISensor*);
    HRESULT GetCount(uint*);
    HRESULT Add(ISensor);
    HRESULT Remove(ISensor);
    HRESULT RemoveByID(GUID*);
    HRESULT Clear();
}
enum IID_ISensor = GUID(0x5fa08f80, 0x2657, 0x458e, [0xaf, 0x75, 0x46, 0xf7, 0x3f, 0xa6, 0xac, 0x5c]);
interface ISensor : IUnknown
{
    HRESULT GetID(GUID*);
    HRESULT GetCategory(GUID*);
    HRESULT GetType(GUID*);
    HRESULT GetFriendlyName(BSTR*);
    HRESULT GetProperty(const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT GetProperties(IPortableDeviceKeyCollection, IPortableDeviceValues*);
    HRESULT GetSupportedDataFields(IPortableDeviceKeyCollection*);
    HRESULT SetProperties(IPortableDeviceValues, IPortableDeviceValues*);
    HRESULT SupportsDataField(const(PROPERTYKEY)*, VARIANT_BOOL*);
    HRESULT GetState(SensorState*);
    HRESULT GetData(ISensorDataReport*);
    HRESULT SupportsEvent(const(GUID)*, VARIANT_BOOL*);
    HRESULT GetEventInterest(GUID**, uint*);
    HRESULT SetEventInterest(GUID*, uint);
    HRESULT SetEventSink(ISensorEvents);
}
enum IID_ISensorDataReport = GUID(0xab9df9b, 0xc4b5, 0x4796, [0x88, 0x98, 0x4, 0x70, 0x70, 0x6a, 0x2e, 0x1d]);
interface ISensorDataReport : IUnknown
{
    HRESULT GetTimestamp(SYSTEMTIME*);
    HRESULT GetSensorValue(const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT GetSensorValues(IPortableDeviceKeyCollection, IPortableDeviceValues*);
}
enum IID_ISensorManagerEvents = GUID(0x9b3b0b86, 0x266a, 0x4aad, [0xb2, 0x1f, 0xfd, 0xe5, 0x50, 0x10, 0x1, 0xb7]);
interface ISensorManagerEvents : IUnknown
{
    HRESULT OnSensorEnter(ISensor, SensorState);
}
enum IID_ISensorEvents = GUID(0x5d8dcc91, 0x4641, 0x47e7, [0xb7, 0xc3, 0xb7, 0x4f, 0x48, 0xa6, 0xc3, 0x91]);
interface ISensorEvents : IUnknown
{
    HRESULT OnStateChanged(ISensor, SensorState);
    HRESULT OnDataUpdated(ISensor, ISensorDataReport);
    HRESULT OnEvent(ISensor, const(GUID)*, IPortableDeviceValues);
    HRESULT OnLeave(GUID*);
}
alias ACTIVITY_STATE_COUNT = int;
enum : int
{
    ActivityStateCount = 0x00000008,
}

alias ACTIVITY_STATE = int;
enum : int
{
    ActivityState_Unknown     = 0x00000001,
    ActivityState_Stationary  = 0x00000002,
    ActivityState_Fidgeting   = 0x00000004,
    ActivityState_Walking     = 0x00000008,
    ActivityState_Running     = 0x00000010,
    ActivityState_InVehicle   = 0x00000020,
    ActivityState_Biking      = 0x00000040,
    ActivityState_Idle        = 0x00000080,
    ActivityState_Max         = 0x00000100,
    ActivityState_Force_Dword = 0xffffffff,
}

alias ELEVATION_CHANGE_MODE = int;
enum : int
{
    ElevationChangeMode_Unknown     = 0x00000000,
    ElevationChangeMode_Elevator    = 0x00000001,
    ElevationChangeMode_Stepping    = 0x00000002,
    ElevationChangeMode_Max         = 0x00000003,
    ElevationChangeMode_Force_Dword = 0xffffffff,
}

alias MAGNETOMETER_ACCURACY = int;
enum : int
{
    MagnetometerAccuracy_Unknown     = 0x00000000,
    MagnetometerAccuracy_Unreliable  = 0x00000001,
    MagnetometerAccuracy_Approximate = 0x00000002,
    MagnetometerAccuracy_High        = 0x00000003,
}

alias PEDOMETER_STEP_TYPE_COUNT = int;
enum : int
{
    PedometerStepTypeCount = 0x00000003,
}

alias PEDOMETER_STEP_TYPE = int;
enum : int
{
    PedometerStepType_Unknown     = 0x00000001,
    PedometerStepType_Walking     = 0x00000002,
    PedometerStepType_Running     = 0x00000004,
    PedometerStepType_Max         = 0x00000008,
    PedometerStepType_Force_Dword = 0xffffffff,
}

alias PROXIMITY_TYPE = int;
enum : int
{
    ProximityType_ObjectProximity = 0x00000000,
    ProximityType_HumanProximity  = 0x00000001,
    ProximityType_Force_Dword     = 0xffffffff,
}

alias HUMAN_PRESENCE_DETECTION_TYPE_COUNT = int;
enum : int
{
    HumanPresenceDetectionTypeCount = 0x00000004,
}

alias HUMAN_PRESENCE_DETECTION_TYPE = int;
enum : int
{
    HumanPresenceDetectionType_VendorDefinedNonBiometric = 0x00000001,
    HumanPresenceDetectionType_VendorDefinedBiometric    = 0x00000002,
    HumanPresenceDetectionType_FacialBiometric           = 0x00000004,
    HumanPresenceDetectionType_AudioBiometric            = 0x00000008,
    HumanPresenceDetectionType_Force_Dword               = 0xffffffff,
}

alias PROXIMITY_SENSOR_CAPABILITIES = int;
enum : int
{
    Proximity_Sensor_Human_Presence_Capable   = 0x00000001,
    Proximity_Sensor_Human_Engagement_Capable = 0x00000002,
    Proximity_Sensor_Supported_Capabilities   = 0x00000003,
}

alias SIMPLE_DEVICE_ORIENTATION = int;
enum : int
{
    SimpleDeviceOrientation_NotRotated                        = 0x00000000,
    SimpleDeviceOrientation_Rotated90DegreesCounterclockwise  = 0x00000001,
    SimpleDeviceOrientation_Rotated180DegreesCounterclockwise = 0x00000002,
    SimpleDeviceOrientation_Rotated270DegreesCounterclockwise = 0x00000003,
    SimpleDeviceOrientation_Faceup                            = 0x00000004,
    SimpleDeviceOrientation_Facedown                          = 0x00000005,
}

alias SENSOR_STATE = int;
enum : int
{
    SensorState_Initializing = 0x00000000,
    SensorState_Idle         = 0x00000001,
    SensorState_Active       = 0x00000002,
    SensorState_Error        = 0x00000003,
}

alias SENSOR_CONNECTION_TYPES = int;
enum : int
{
    SensorConnectionType_Integrated = 0x00000000,
    SensorConnectionType_Attached   = 0x00000001,
    SensorConnectionType_External   = 0x00000002,
}

struct SENSOR_VALUE_PAIR
{
    PROPERTYKEY Key;
    PROPVARIANT Value;
}
struct SENSOR_COLLECTION_LIST
{
    uint AllocatedSizeInBytes;
    uint Count;
    SENSOR_VALUE_PAIR[1] List;
}
struct SENSOR_PROPERTY_LIST
{
    uint AllocatedSizeInBytes;
    uint Count;
    PROPERTYKEY[1] List;
}
struct VEC3D
{
    float X;
    float Y;
    float Z;
}
struct MATRIX3X3
{
    union
    {
        struct
        {
            float A11;
            float A12;
            float A13;
            float A21;
            float A22;
            float A23;
            float A31;
            float A32;
            float A33;
        }
        struct
        {
            VEC3D V1;
            VEC3D V2;
            VEC3D V3;
        }
        float[9] M;
    }
}
struct QUATERNION
{
    float X;
    float Y;
    float Z;
    float W;
}
alias AXIS = int;
enum : int
{
    AXIS_X   = 0x00000000,
    AXIS_Y   = 0x00000001,
    AXIS_Z   = 0x00000002,
    AXIS_MAX = 0x00000003,
}

