module windows.win32.graphics.imaging;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, GENERIC_ACCESS_RIGHTS, HANDLE, HRESULT, PWSTR;
import windows.win32.graphics.direct2d.common : D2D1_PIXEL_FORMAT;
import windows.win32.graphics.dxgi.common : DXGI_FORMAT, DXGI_JPEG_AC_HUFFMAN_TABLE, DXGI_JPEG_DC_HUFFMAN_TABLE, DXGI_JPEG_QUANTIZATION_TABLE;
import windows.win32.graphics.gdi : HBITMAP, HPALETTE;
import windows.win32.system.com : IEnumString, IEnumUnknown, IPersistStream, IStream, IUnknown;
import windows.win32.system.com.structuredstorage : IPropertyBag2, PROPBAG2, PROPVARIANT;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

HRESULT WICConvertBitmapSource(GUID*, IWICBitmapSource, IWICBitmapSource*);
HRESULT WICCreateBitmapFromSection(uint, uint, GUID*, HANDLE, uint, uint, IWICBitmap*);
HRESULT WICCreateBitmapFromSectionEx(uint, uint, GUID*, HANDLE, uint, uint, WICSectionAccessLevel, IWICBitmap*);
HRESULT WICMapGuidToShortName(const(GUID)*, uint, PWSTR, uint*);
HRESULT WICMapShortNameToGuid(const(wchar)*, GUID*);
HRESULT WICMapSchemaToName(const(GUID)*, PWSTR, uint, PWSTR, uint*);
HRESULT WICMatchMetadataContent(const(GUID)*, const(GUID)*, IStream, GUID*);
HRESULT WICSerializeMetadataContent(const(GUID)*, IWICMetadataWriter, uint, IStream);
HRESULT WICGetMetadataContentSize(const(GUID)*, IWICMetadataWriter, ulong*);
enum WINCODEC_SDK_VERSION1 = 0x00000236;
enum WINCODEC_SDK_VERSION2 = 0x00000237;
enum CLSID_WICImagingFactory = GUID(0xcacaf262, 0x9370, 0x4615, [0xa1, 0x3b, 0x9f, 0x55, 0x39, 0xda, 0x4c, 0xa]);
enum CLSID_WICImagingFactory1 = GUID(0xcacaf262, 0x9370, 0x4615, [0xa1, 0x3b, 0x9f, 0x55, 0x39, 0xda, 0x4c, 0xa]);
enum CLSID_WICImagingFactory2 = GUID(0x317d06e8, 0x5f24, 0x433d, [0xbd, 0xf7, 0x79, 0xce, 0x68, 0xd8, 0xab, 0xc2]);
enum WINCODEC_SDK_VERSION = 0x00000237;
enum GUID_VendorMicrosoft = GUID(0xf0e749ca, 0xedef, 0x4589, [0xa7, 0x3a, 0xee, 0xe, 0x62, 0x6a, 0x2a, 0x2b]);
enum GUID_VendorMicrosoftBuiltIn = GUID(0x257a30fd, 0x6b6, 0x462b, [0xae, 0xa4, 0x63, 0xf7, 0xb, 0x86, 0xe5, 0x33]);
enum CLSID_WICPngDecoder = GUID(0x389ea17b, 0x5078, 0x4cde, [0xb6, 0xef, 0x25, 0xc1, 0x51, 0x75, 0xc7, 0x51]);
enum CLSID_WICPngDecoder1 = GUID(0x389ea17b, 0x5078, 0x4cde, [0xb6, 0xef, 0x25, 0xc1, 0x51, 0x75, 0xc7, 0x51]);
enum CLSID_WICPngDecoder2 = GUID(0xe018945b, 0xaa86, 0x4008, [0x9b, 0xd4, 0x67, 0x77, 0xa1, 0xe4, 0xc, 0x11]);
enum CLSID_WICBmpDecoder = GUID(0x6b462062, 0x7cbf, 0x400d, [0x9f, 0xdb, 0x81, 0x3d, 0xd1, 0xf, 0x27, 0x78]);
enum CLSID_WICIcoDecoder = GUID(0xc61bfcdf, 0x2e0f, 0x4aad, [0xa8, 0xd7, 0xe0, 0x6b, 0xaf, 0xeb, 0xcd, 0xfe]);
enum CLSID_WICJpegDecoder = GUID(0x9456a480, 0xe88b, 0x43ea, [0x9e, 0x73, 0xb, 0x2d, 0x9b, 0x71, 0xb1, 0xca]);
enum CLSID_WICGifDecoder = GUID(0x381dda3c, 0x9ce9, 0x4834, [0xa2, 0x3e, 0x1f, 0x98, 0xf8, 0xfc, 0x52, 0xbe]);
enum CLSID_WICTiffDecoder = GUID(0xb54e85d9, 0xfe23, 0x499f, [0x8b, 0x88, 0x6a, 0xce, 0xa7, 0x13, 0x75, 0x2b]);
enum CLSID_WICWmpDecoder = GUID(0xa26cec36, 0x234c, 0x4950, [0xae, 0x16, 0xe3, 0x4a, 0xac, 0xe7, 0x1d, 0xd]);
enum CLSID_WICDdsDecoder = GUID(0x9053699f, 0xa341, 0x429d, [0x9e, 0x90, 0xee, 0x43, 0x7c, 0xf8, 0xc, 0x73]);
enum CLSID_WICBmpEncoder = GUID(0x69be8bb4, 0xd66d, 0x47c8, [0x86, 0x5a, 0xed, 0x15, 0x89, 0x43, 0x37, 0x82]);
enum CLSID_WICPngEncoder = GUID(0x27949969, 0x876a, 0x41d7, [0x94, 0x47, 0x56, 0x8f, 0x6a, 0x35, 0xa4, 0xdc]);
enum CLSID_WICJpegEncoder = GUID(0x1a34f5c1, 0x4a5a, 0x46dc, [0xb6, 0x44, 0x1f, 0x45, 0x67, 0xe7, 0xa6, 0x76]);
enum CLSID_WICGifEncoder = GUID(0x114f5598, 0xb22, 0x40a0, [0x86, 0xa1, 0xc8, 0x3e, 0xa4, 0x95, 0xad, 0xbd]);
enum CLSID_WICTiffEncoder = GUID(0x131be10, 0x2001, 0x4c5f, [0xa9, 0xb0, 0xcc, 0x88, 0xfa, 0xb6, 0x4c, 0xe8]);
enum CLSID_WICWmpEncoder = GUID(0xac4ce3cb, 0xe1c1, 0x44cd, [0x82, 0x15, 0x5a, 0x16, 0x65, 0x50, 0x9e, 0xc2]);
enum CLSID_WICDdsEncoder = GUID(0xa61dde94, 0x66ce, 0x4ac1, [0x88, 0x1b, 0x71, 0x68, 0x5, 0x88, 0x89, 0x5e]);
enum CLSID_WICAdngDecoder = GUID(0x981d9411, 0x909e, 0x42a7, [0x8f, 0x5d, 0xa7, 0x47, 0xff, 0x5, 0x2e, 0xdb]);
enum CLSID_WICJpegQualcommPhoneEncoder = GUID(0x68ed5c62, 0xf534, 0x4979, [0xb2, 0xb3, 0x68, 0x6a, 0x12, 0xb2, 0xb3, 0x4c]);
enum CLSID_WICHeifDecoder = GUID(0xe9a4a80a, 0x44fe, 0x4de4, [0x89, 0x71, 0x71, 0x50, 0xb1, 0xa, 0x51, 0x99]);
enum CLSID_WICHeifEncoder = GUID(0xdbecec1, 0x9eb3, 0x4860, [0x9c, 0x6f, 0xdd, 0xbe, 0x86, 0x63, 0x45, 0x75]);
enum CLSID_WICWebpDecoder = GUID(0x7693e886, 0x51c9, 0x4070, [0x84, 0x19, 0x9f, 0x70, 0x73, 0x8e, 0xc8, 0xfa]);
enum CLSID_WICRAWDecoder = GUID(0x41945702, 0x8302, 0x44a6, [0x94, 0x45, 0xac, 0x98, 0xe8, 0xaf, 0xa0, 0x86]);
enum GUID_ContainerFormatBmp = GUID(0xaf1d87e, 0xfcfe, 0x4188, [0xbd, 0xeb, 0xa7, 0x90, 0x64, 0x71, 0xcb, 0xe3]);
enum GUID_ContainerFormatPng = GUID(0x1b7cfaf4, 0x713f, 0x473c, [0xbb, 0xcd, 0x61, 0x37, 0x42, 0x5f, 0xae, 0xaf]);
enum GUID_ContainerFormatIco = GUID(0xa3a860c4, 0x338f, 0x4c17, [0x91, 0x9a, 0xfb, 0xa4, 0xb5, 0x62, 0x8f, 0x21]);
enum GUID_ContainerFormatJpeg = GUID(0x19e4a5aa, 0x5662, 0x4fc5, [0xa0, 0xc0, 0x17, 0x58, 0x2, 0x8e, 0x10, 0x57]);
enum GUID_ContainerFormatTiff = GUID(0x163bcc30, 0xe2e9, 0x4f0b, [0x96, 0x1d, 0xa3, 0xe9, 0xfd, 0xb7, 0x88, 0xa3]);
enum GUID_ContainerFormatGif = GUID(0x1f8a5601, 0x7d4d, 0x4cbd, [0x9c, 0x82, 0x1b, 0xc8, 0xd4, 0xee, 0xb9, 0xa5]);
enum GUID_ContainerFormatWmp = GUID(0x57a37caa, 0x367a, 0x4540, [0x91, 0x6b, 0xf1, 0x83, 0xc5, 0x9, 0x3a, 0x4b]);
enum GUID_ContainerFormatDds = GUID(0x9967cb95, 0x2e85, 0x4ac8, [0x8c, 0xa2, 0x83, 0xd7, 0xcc, 0xd4, 0x25, 0xc9]);
enum GUID_ContainerFormatAdng = GUID(0xf3ff6d0d, 0x38c0, 0x41c4, [0xb1, 0xfe, 0x1f, 0x38, 0x24, 0xf1, 0x7b, 0x84]);
enum GUID_ContainerFormatHeif = GUID(0xe1e62521, 0x6787, 0x405b, [0xa3, 0x39, 0x50, 0x7, 0x15, 0xb5, 0x76, 0x3f]);
enum GUID_ContainerFormatWebp = GUID(0xe094b0e2, 0x67f2, 0x45b3, [0xb0, 0xea, 0x11, 0x53, 0x37, 0xca, 0x7c, 0xf3]);
enum GUID_ContainerFormatRaw = GUID(0xfe99ce60, 0xf19c, 0x433c, [0xa3, 0xae, 0x0, 0xac, 0xef, 0xa9, 0xca, 0x21]);
enum CLSID_WICImagingCategories = GUID(0xfae3d380, 0xfea4, 0x4623, [0x8c, 0x75, 0xc6, 0xb6, 0x11, 0x10, 0xb6, 0x81]);
enum CATID_WICBitmapDecoders = GUID(0x7ed96837, 0x96f0, 0x4812, [0xb2, 0x11, 0xf1, 0x3c, 0x24, 0x11, 0x7e, 0xd3]);
enum CATID_WICBitmapEncoders = GUID(0xac757296, 0x3522, 0x4e11, [0x98, 0x62, 0xc1, 0x7b, 0xe5, 0xa1, 0x76, 0x7e]);
enum CATID_WICPixelFormats = GUID(0x2b46e70f, 0xcda7, 0x473e, [0x89, 0xf6, 0xdc, 0x96, 0x30, 0xa2, 0x39, 0xb]);
enum CATID_WICFormatConverters = GUID(0x7835eae8, 0xbf14, 0x49d1, [0x93, 0xce, 0x53, 0x3a, 0x40, 0x7b, 0x22, 0x48]);
enum CATID_WICMetadataReader = GUID(0x5af94d8, 0x7174, 0x4cd2, [0xbe, 0x4a, 0x41, 0x24, 0xb8, 0xe, 0xe4, 0xb8]);
enum CATID_WICMetadataWriter = GUID(0xabe3b9a4, 0x257d, 0x4b97, [0xbd, 0x1a, 0x29, 0x4a, 0xf4, 0x96, 0x22, 0x2e]);
enum CLSID_WICDefaultFormatConverter = GUID(0x1a3f11dc, 0xb514, 0x4b17, [0x8c, 0x5f, 0x21, 0x54, 0x51, 0x38, 0x52, 0xf1]);
enum CLSID_WICFormatConverterHighColor = GUID(0xac75d454, 0x9f37, 0x48f8, [0xb9, 0x72, 0x4e, 0x19, 0xbc, 0x85, 0x60, 0x11]);
enum CLSID_WICFormatConverterNChannel = GUID(0xc17cabb2, 0xd4a3, 0x47d7, [0xa5, 0x57, 0x33, 0x9b, 0x2e, 0xfb, 0xd4, 0xf1]);
enum CLSID_WICFormatConverterWMPhoto = GUID(0x9cb5172b, 0xd600, 0x46ba, [0xab, 0x77, 0x77, 0xbb, 0x7e, 0x3a, 0x0, 0xd9]);
enum CLSID_WICPlanarFormatConverter = GUID(0x184132b8, 0x32f8, 0x4784, [0x91, 0x31, 0xdd, 0x72, 0x24, 0xb2, 0x34, 0x38]);
enum WIC_JPEG_MAX_COMPONENT_COUNT = 0x00000004;
enum WIC_JPEG_MAX_TABLE_INDEX = 0x00000003;
enum WIC_JPEG_SAMPLE_FACTORS_ONE = 0x00000011;
enum WIC_JPEG_SAMPLE_FACTORS_THREE_420 = 0x00111122;
enum WIC_JPEG_SAMPLE_FACTORS_THREE_422 = 0x00111121;
enum WIC_JPEG_SAMPLE_FACTORS_THREE_440 = 0x00111112;
enum WIC_JPEG_SAMPLE_FACTORS_THREE_444 = 0x00111111;
enum WIC_JPEG_QUANTIZATION_BASELINE_ONE = 0x00000000;
enum WIC_JPEG_QUANTIZATION_BASELINE_THREE = 0x00010100;
enum WIC_JPEG_HUFFMAN_BASELINE_ONE = 0x00000000;
enum WIC_JPEG_HUFFMAN_BASELINE_THREE = 0x00111100;
enum GUID_WICPixelFormatDontCare = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0]);
enum GUID_WICPixelFormat1bppIndexed = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1]);
enum GUID_WICPixelFormat2bppIndexed = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2]);
enum GUID_WICPixelFormat4bppIndexed = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3]);
enum GUID_WICPixelFormat8bppIndexed = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x4]);
enum GUID_WICPixelFormatBlackWhite = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x5]);
enum GUID_WICPixelFormat2bppGray = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x6]);
enum GUID_WICPixelFormat4bppGray = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x7]);
enum GUID_WICPixelFormat8bppGray = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x8]);
enum GUID_WICPixelFormat8bppAlpha = GUID(0xe6cd0116, 0xeeba, 0x4161, [0xaa, 0x85, 0x27, 0xdd, 0x9f, 0xb3, 0xa8, 0x95]);
enum GUID_WICPixelFormat16bppBGR555 = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x9]);
enum GUID_WICPixelFormat16bppBGR565 = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0xa]);
enum GUID_WICPixelFormat16bppBGRA5551 = GUID(0x5ec7c2b, 0xf1e6, 0x4961, [0xad, 0x46, 0xe1, 0xcc, 0x81, 0xa, 0x87, 0xd2]);
enum GUID_WICPixelFormat16bppGray = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0xb]);
enum GUID_WICPixelFormat24bppBGR = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0xc]);
enum GUID_WICPixelFormat24bppRGB = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0xd]);
enum GUID_WICPixelFormat32bppBGR = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0xe]);
enum GUID_WICPixelFormat32bppBGRA = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0xf]);
enum GUID_WICPixelFormat32bppPBGRA = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x10]);
enum GUID_WICPixelFormat32bppGrayFloat = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x11]);
enum GUID_WICPixelFormat32bppRGB = GUID(0xd98c6b95, 0x3efe, 0x47d6, [0xbb, 0x25, 0xeb, 0x17, 0x48, 0xab, 0xc, 0xf1]);
enum GUID_WICPixelFormat32bppRGBA = GUID(0xf5c7ad2d, 0x6a8d, 0x43dd, [0xa7, 0xa8, 0xa2, 0x99, 0x35, 0x26, 0x1a, 0xe9]);
enum GUID_WICPixelFormat32bppPRGBA = GUID(0x3cc4a650, 0xa527, 0x4d37, [0xa9, 0x16, 0x31, 0x42, 0xc7, 0xeb, 0xed, 0xba]);
enum GUID_WICPixelFormat48bppRGB = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x15]);
enum GUID_WICPixelFormat48bppBGR = GUID(0xe605a384, 0xb468, 0x46ce, [0xbb, 0x2e, 0x36, 0xf1, 0x80, 0xe6, 0x43, 0x13]);
enum GUID_WICPixelFormat64bppRGB = GUID(0xa1182111, 0x186d, 0x4d42, [0xbc, 0x6a, 0x9c, 0x83, 0x3, 0xa8, 0xdf, 0xf9]);
enum GUID_WICPixelFormat64bppRGBA = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x16]);
enum GUID_WICPixelFormat64bppBGRA = GUID(0x1562ff7c, 0xd352, 0x46f9, [0x97, 0x9e, 0x42, 0x97, 0x6b, 0x79, 0x22, 0x46]);
enum GUID_WICPixelFormat64bppPRGBA = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x17]);
enum GUID_WICPixelFormat64bppPBGRA = GUID(0x8c518e8e, 0xa4ec, 0x468b, [0xae, 0x70, 0xc9, 0xa3, 0x5a, 0x9c, 0x55, 0x30]);
enum GUID_WICPixelFormat16bppGrayFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x13]);
enum GUID_WICPixelFormat32bppBGR101010 = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x14]);
enum GUID_WICPixelFormat48bppRGBFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x12]);
enum GUID_WICPixelFormat48bppBGRFixedPoint = GUID(0x49ca140e, 0xcab6, 0x493b, [0x9d, 0xdf, 0x60, 0x18, 0x7c, 0x37, 0x53, 0x2a]);
enum GUID_WICPixelFormat96bppRGBFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x18]);
enum GUID_WICPixelFormat96bppRGBFloat = GUID(0xe3fed78f, 0xe8db, 0x4acf, [0x84, 0xc1, 0xe9, 0x7f, 0x61, 0x36, 0xb3, 0x27]);
enum GUID_WICPixelFormat128bppRGBAFloat = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x19]);
enum GUID_WICPixelFormat128bppPRGBAFloat = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1a]);
enum GUID_WICPixelFormat128bppRGBFloat = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1b]);
enum GUID_WICPixelFormat32bppCMYK = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1c]);
enum GUID_WICPixelFormat64bppRGBAFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1d]);
enum GUID_WICPixelFormat64bppBGRAFixedPoint = GUID(0x356de33c, 0x54d2, 0x4a23, [0xbb, 0x4, 0x9b, 0x7b, 0xf9, 0xb1, 0xd4, 0x2d]);
enum GUID_WICPixelFormat64bppRGBFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x40]);
enum GUID_WICPixelFormat128bppRGBAFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1e]);
enum GUID_WICPixelFormat128bppRGBFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x41]);
enum GUID_WICPixelFormat64bppRGBAHalf = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3a]);
enum GUID_WICPixelFormat64bppPRGBAHalf = GUID(0x58ad26c2, 0xc623, 0x4d9d, [0xb3, 0x20, 0x38, 0x7e, 0x49, 0xf8, 0xc4, 0x42]);
enum GUID_WICPixelFormat64bppRGBHalf = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x42]);
enum GUID_WICPixelFormat48bppRGBHalf = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3b]);
enum GUID_WICPixelFormat32bppRGBE = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3d]);
enum GUID_WICPixelFormat16bppGrayHalf = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3e]);
enum GUID_WICPixelFormat32bppGrayFixedPoint = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3f]);
enum GUID_WICPixelFormat32bppRGBA1010102 = GUID(0x25238d72, 0xfcf9, 0x4522, [0xb5, 0x14, 0x55, 0x78, 0xe5, 0xad, 0x55, 0xe0]);
enum GUID_WICPixelFormat32bppRGBA1010102XR = GUID(0xde6b9a, 0xc101, 0x434b, [0xb5, 0x2, 0xd0, 0x16, 0x5e, 0xe1, 0x12, 0x2c]);
enum GUID_WICPixelFormat32bppR10G10B10A2 = GUID(0x604e1bb5, 0x8a3c, 0x4b65, [0xb1, 0x1c, 0xbc, 0xb, 0x8d, 0xd7, 0x5b, 0x7f]);
enum GUID_WICPixelFormat32bppR10G10B10A2HDR10 = GUID(0x9c215c5d, 0x1acc, 0x4f0e, [0xa4, 0xbc, 0x70, 0xfb, 0x3a, 0xe8, 0xfd, 0x28]);
enum GUID_WICPixelFormat64bppCMYK = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1f]);
enum GUID_WICPixelFormat24bpp3Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x20]);
enum GUID_WICPixelFormat32bpp4Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x21]);
enum GUID_WICPixelFormat40bpp5Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x22]);
enum GUID_WICPixelFormat48bpp6Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x23]);
enum GUID_WICPixelFormat56bpp7Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x24]);
enum GUID_WICPixelFormat64bpp8Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x25]);
enum GUID_WICPixelFormat48bpp3Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x26]);
enum GUID_WICPixelFormat64bpp4Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x27]);
enum GUID_WICPixelFormat80bpp5Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x28]);
enum GUID_WICPixelFormat96bpp6Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x29]);
enum GUID_WICPixelFormat112bpp7Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2a]);
enum GUID_WICPixelFormat128bpp8Channels = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2b]);
enum GUID_WICPixelFormat40bppCMYKAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2c]);
enum GUID_WICPixelFormat80bppCMYKAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2d]);
enum GUID_WICPixelFormat32bpp3ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2e]);
enum GUID_WICPixelFormat40bpp4ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2f]);
enum GUID_WICPixelFormat48bpp5ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x30]);
enum GUID_WICPixelFormat56bpp6ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x31]);
enum GUID_WICPixelFormat64bpp7ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x32]);
enum GUID_WICPixelFormat72bpp8ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x33]);
enum GUID_WICPixelFormat64bpp3ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x34]);
enum GUID_WICPixelFormat80bpp4ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x35]);
enum GUID_WICPixelFormat96bpp5ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x36]);
enum GUID_WICPixelFormat112bpp6ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x37]);
enum GUID_WICPixelFormat128bpp7ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x38]);
enum GUID_WICPixelFormat144bpp8ChannelsAlpha = GUID(0x6fddc324, 0x4e03, 0x4bfe, [0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x39]);
enum GUID_WICPixelFormat8bppY = GUID(0x91b4db54, 0x2df9, 0x42f0, [0xb4, 0x49, 0x29, 0x9, 0xbb, 0x3d, 0xf8, 0x8e]);
enum GUID_WICPixelFormat8bppCb = GUID(0x1339f224, 0x6bfe, 0x4c3e, [0x93, 0x2, 0xe4, 0xf3, 0xa6, 0xd0, 0xca, 0x2a]);
enum GUID_WICPixelFormat8bppCr = GUID(0xb8145053, 0x2116, 0x49f0, [0x88, 0x35, 0xed, 0x84, 0x4b, 0x20, 0x5c, 0x51]);
enum GUID_WICPixelFormat16bppCbCr = GUID(0xff95ba6e, 0x11e0, 0x4263, [0xbb, 0x45, 0x1, 0x72, 0x1f, 0x34, 0x60, 0xa4]);
enum GUID_WICPixelFormat16bppYQuantizedDctCoefficients = GUID(0xa355f433, 0x48e8, 0x4a42, [0x84, 0xd8, 0xe2, 0xaa, 0x26, 0xca, 0x80, 0xa4]);
enum GUID_WICPixelFormat16bppCbQuantizedDctCoefficients = GUID(0xd2c4ff61, 0x56a5, 0x49c2, [0x8b, 0x5c, 0x4c, 0x19, 0x25, 0x96, 0x48, 0x37]);
enum GUID_WICPixelFormat16bppCrQuantizedDctCoefficients = GUID(0x2fe354f0, 0x1680, 0x42d8, [0x92, 0x31, 0xe7, 0x3c, 0x5, 0x65, 0xbf, 0xc1]);
enum FACILITY_WINCODEC_ERR = 0x00000898;
enum WINCODEC_ERR_BASE = 0x00002000;
enum WINCODEC_ERR_GENERIC_ERROR = 0xffffffff80004005;
enum WINCODEC_ERR_INVALIDPARAMETER = 0xffffffff80070057;
enum WINCODEC_ERR_OUTOFMEMORY = 0xffffffff8007000e;
enum WINCODEC_ERR_NOTIMPLEMENTED = 0xffffffff80004001;
enum WINCODEC_ERR_ABORTED = 0xffffffff80004004;
enum WINCODEC_ERR_ACCESSDENIED = 0xffffffff80070005;
enum WICRawChangeNotification_ExposureCompensation = 0x00000001;
enum WICRawChangeNotification_NamedWhitePoint = 0x00000002;
enum WICRawChangeNotification_KelvinWhitePoint = 0x00000004;
enum WICRawChangeNotification_RGBWhitePoint = 0x00000008;
enum WICRawChangeNotification_Contrast = 0x00000010;
enum WICRawChangeNotification_Gamma = 0x00000020;
enum WICRawChangeNotification_Sharpness = 0x00000040;
enum WICRawChangeNotification_Saturation = 0x00000080;
enum WICRawChangeNotification_Tint = 0x00000100;
enum WICRawChangeNotification_NoiseReduction = 0x00000200;
enum WICRawChangeNotification_DestinationColorContext = 0x00000400;
enum WICRawChangeNotification_ToneCurve = 0x00000800;
enum WICRawChangeNotification_Rotation = 0x00001000;
enum WICRawChangeNotification_RenderMode = 0x00002000;
enum GUID_MetadataFormatUnknown = GUID(0xa45e592f, 0x9078, 0x4a7c, [0xad, 0xb5, 0x4e, 0xdc, 0x4f, 0xd6, 0x1b, 0x1f]);
enum GUID_MetadataFormatIfd = GUID(0x537396c6, 0x2d8a, 0x4bb6, [0x9b, 0xf8, 0x2f, 0xa, 0x8e, 0x2a, 0x3a, 0xdf]);
enum GUID_MetadataFormatSubIfd = GUID(0x58a2e128, 0x2db9, 0x4e57, [0xbb, 0x14, 0x51, 0x77, 0x89, 0x1e, 0xd3, 0x31]);
enum GUID_MetadataFormatExif = GUID(0x1c3c4f9d, 0xb84a, 0x467d, [0x94, 0x93, 0x36, 0xcf, 0xbd, 0x59, 0xea, 0x57]);
enum GUID_MetadataFormatGps = GUID(0x7134ab8a, 0x9351, 0x44ad, [0xaf, 0x62, 0x44, 0x8d, 0xb6, 0xb5, 0x2, 0xec]);
enum GUID_MetadataFormatInterop = GUID(0xed686f8e, 0x681f, 0x4c8b, [0xbd, 0x41, 0xa8, 0xad, 0xdb, 0xf6, 0xb3, 0xfc]);
enum GUID_MetadataFormatApp0 = GUID(0x79007028, 0x268d, 0x45d6, [0xa3, 0xc2, 0x35, 0x4e, 0x6a, 0x50, 0x4b, 0xc9]);
enum GUID_MetadataFormatApp1 = GUID(0x8fd3dfc3, 0xf951, 0x492b, [0x81, 0x7f, 0x69, 0xc2, 0xe6, 0xd9, 0xa5, 0xb0]);
enum GUID_MetadataFormatApp13 = GUID(0x326556a2, 0xf502, 0x4354, [0x9c, 0xc0, 0x8e, 0x3f, 0x48, 0xea, 0xf6, 0xb5]);
enum GUID_MetadataFormatIPTC = GUID(0x4fab0914, 0xe129, 0x4087, [0xa1, 0xd1, 0xbc, 0x81, 0x2d, 0x45, 0xa7, 0xb5]);
enum GUID_MetadataFormatIRB = GUID(0x16100d66, 0x8570, 0x4bb9, [0xb9, 0x2d, 0xfd, 0xa4, 0xb2, 0x3e, 0xce, 0x67]);
enum GUID_MetadataFormat8BIMIPTC = GUID(0x10568c, 0x852, 0x4e6a, [0xb1, 0x91, 0x5c, 0x33, 0xac, 0x5b, 0x4, 0x30]);
enum GUID_MetadataFormat8BIMResolutionInfo = GUID(0x739f305d, 0x81db, 0x43cb, [0xac, 0x5e, 0x55, 0x1, 0x3e, 0xf9, 0xf0, 0x3]);
enum GUID_MetadataFormat8BIMIPTCDigest = GUID(0x1ca32285, 0x9ccd, 0x4786, [0x8b, 0xd8, 0x79, 0x53, 0x9d, 0xb6, 0xa0, 0x6]);
enum GUID_MetadataFormatXMP = GUID(0xbb5acc38, 0xf216, 0x4cec, [0xa6, 0xc5, 0x5f, 0x6e, 0x73, 0x97, 0x63, 0xa9]);
enum GUID_MetadataFormatThumbnail = GUID(0x243dcee9, 0x8703, 0x40ee, [0x8e, 0xf0, 0x22, 0xa6, 0x0, 0xb8, 0x5, 0x8c]);
enum GUID_MetadataFormatChunktEXt = GUID(0x568d8936, 0xc0a9, 0x4923, [0x90, 0x5d, 0xdf, 0x2b, 0x38, 0x23, 0x8f, 0xbc]);
enum GUID_MetadataFormatXMPStruct = GUID(0x22383cf1, 0xed17, 0x4e2e, [0xaf, 0x17, 0xd8, 0x5b, 0x8f, 0x6b, 0x30, 0xd0]);
enum GUID_MetadataFormatXMPBag = GUID(0x833cca5f, 0xdcb7, 0x4516, [0x80, 0x6f, 0x65, 0x96, 0xab, 0x26, 0xdc, 0xe4]);
enum GUID_MetadataFormatXMPSeq = GUID(0x63e8df02, 0xeb6c, 0x456c, [0xa2, 0x24, 0xb2, 0x5e, 0x79, 0x4f, 0xd6, 0x48]);
enum GUID_MetadataFormatXMPAlt = GUID(0x7b08a675, 0x91aa, 0x481b, [0xa7, 0x98, 0x4d, 0xa9, 0x49, 0x8, 0x61, 0x3b]);
enum GUID_MetadataFormatLSD = GUID(0xe256031e, 0x6299, 0x4929, [0xb9, 0x8d, 0x5a, 0xc8, 0x84, 0xaf, 0xba, 0x92]);
enum GUID_MetadataFormatIMD = GUID(0xbd2bb086, 0x4d52, 0x48dd, [0x96, 0x77, 0xdb, 0x48, 0x3e, 0x85, 0xae, 0x8f]);
enum GUID_MetadataFormatGCE = GUID(0x2a25cad8, 0xdeeb, 0x4c69, [0xa7, 0x88, 0xe, 0xc2, 0x26, 0x6d, 0xca, 0xfd]);
enum GUID_MetadataFormatAPE = GUID(0x2e043dc2, 0xc967, 0x4e05, [0x87, 0x5e, 0x61, 0x8b, 0xf6, 0x7e, 0x85, 0xc3]);
enum GUID_MetadataFormatJpegChrominance = GUID(0xf73d0dcf, 0xcec6, 0x4f85, [0x9b, 0xe, 0x1c, 0x39, 0x56, 0xb1, 0xbe, 0xf7]);
enum GUID_MetadataFormatJpegLuminance = GUID(0x86908007, 0xedfc, 0x4860, [0x8d, 0x4b, 0x4e, 0xe6, 0xe8, 0x3e, 0x60, 0x58]);
enum GUID_MetadataFormatJpegComment = GUID(0x220e5f33, 0xafd3, 0x474e, [0x9d, 0x31, 0x7d, 0x4f, 0xe7, 0x30, 0xf5, 0x57]);
enum GUID_MetadataFormatGifComment = GUID(0xc4b6e0e0, 0xcfb4, 0x4ad3, [0xab, 0x33, 0x9a, 0xad, 0x23, 0x55, 0xa3, 0x4a]);
enum GUID_MetadataFormatChunkgAMA = GUID(0xf00935a5, 0x1d5d, 0x4cd1, [0x81, 0xb2, 0x93, 0x24, 0xd7, 0xec, 0xa7, 0x81]);
enum GUID_MetadataFormatChunkbKGD = GUID(0xe14d3571, 0x6b47, 0x4dea, [0xb6, 0xa, 0x87, 0xce, 0xa, 0x78, 0xdf, 0xb7]);
enum GUID_MetadataFormatChunkiTXt = GUID(0xc2bec729, 0xb68, 0x4b77, [0xaa, 0xe, 0x62, 0x95, 0xa6, 0xac, 0x18, 0x14]);
enum GUID_MetadataFormatChunkcHRM = GUID(0x9db3655b, 0x2842, 0x44b3, [0x80, 0x67, 0x12, 0xe9, 0xb3, 0x75, 0x55, 0x6a]);
enum GUID_MetadataFormatChunkhIST = GUID(0xc59a82da, 0xdb74, 0x48a4, [0xbd, 0x6a, 0xb6, 0x9c, 0x49, 0x31, 0xef, 0x95]);
enum GUID_MetadataFormatChunkiCCP = GUID(0xeb4349ab, 0xb685, 0x450f, [0x91, 0xb5, 0xe8, 0x2, 0xe8, 0x92, 0x53, 0x6c]);
enum GUID_MetadataFormatChunksRGB = GUID(0xc115fd36, 0xcc6f, 0x4e3f, [0x83, 0x63, 0x52, 0x4b, 0x87, 0xc6, 0xb0, 0xd9]);
enum GUID_MetadataFormatChunktIME = GUID(0x6b00ae2d, 0xe24b, 0x460a, [0x98, 0xb6, 0x87, 0x8b, 0xd0, 0x30, 0x72, 0xfd]);
enum GUID_MetadataFormatDds = GUID(0x4a064603, 0x8c33, 0x4e60, [0x9c, 0x29, 0x13, 0x62, 0x31, 0x70, 0x2d, 0x8]);
enum GUID_MetadataFormatHeif = GUID(0x817ef3e1, 0x1288, 0x45f4, [0xa8, 0x52, 0x26, 0xd, 0x9e, 0x7c, 0xce, 0x83]);
enum GUID_MetadataFormatHeifHDR = GUID(0x568b8d8a, 0x1e65, 0x438c, [0x89, 0x68, 0xd6, 0xe, 0x10, 0x12, 0xbe, 0xb9]);
enum GUID_MetadataFormatWebpANIM = GUID(0x6dc4fda6, 0x78e6, 0x4102, [0xae, 0x35, 0xbc, 0xfa, 0x1e, 0xdc, 0xc7, 0x8b]);
enum GUID_MetadataFormatWebpANMF = GUID(0x43c105ee, 0xb93b, 0x4abb, [0xb0, 0x3, 0xa0, 0x8c, 0xd, 0x87, 0x4, 0x71]);
enum CLSID_WICUnknownMetadataReader = GUID(0x699745c2, 0x5066, 0x4b82, [0xa8, 0xe3, 0xd4, 0x4, 0x78, 0xdb, 0xec, 0x8c]);
enum CLSID_WICUnknownMetadataWriter = GUID(0xa09cca86, 0x27ba, 0x4f39, [0x90, 0x53, 0x12, 0x1f, 0xa4, 0xdc, 0x8, 0xfc]);
enum CLSID_WICApp0MetadataWriter = GUID(0xf3c633a2, 0x46c8, 0x498e, [0x8f, 0xbb, 0xcc, 0x6f, 0x72, 0x1b, 0xbc, 0xde]);
enum CLSID_WICApp0MetadataReader = GUID(0x43324b33, 0xa78f, 0x480f, [0x91, 0x11, 0x96, 0x38, 0xaa, 0xcc, 0xc8, 0x32]);
enum CLSID_WICApp1MetadataWriter = GUID(0xee366069, 0x1832, 0x420f, [0xb3, 0x81, 0x4, 0x79, 0xad, 0x6, 0x6f, 0x19]);
enum CLSID_WICApp1MetadataReader = GUID(0xdde33513, 0x774e, 0x4bcd, [0xae, 0x79, 0x2, 0xf4, 0xad, 0xfe, 0x62, 0xfc]);
enum CLSID_WICApp13MetadataWriter = GUID(0x7b19a919, 0xa9d6, 0x49e5, [0xbd, 0x45, 0x2, 0xc3, 0x4e, 0x4e, 0x4c, 0xd5]);
enum CLSID_WICApp13MetadataReader = GUID(0xaa7e3c50, 0x864c, 0x4604, [0xbc, 0x4, 0x8b, 0xb, 0x76, 0xe6, 0x37, 0xf6]);
enum CLSID_WICIfdMetadataReader = GUID(0x8f914656, 0x9d0a, 0x4eb2, [0x90, 0x19, 0xb, 0xf9, 0x6d, 0x8a, 0x9e, 0xe6]);
enum CLSID_WICIfdMetadataWriter = GUID(0xb1ebfc28, 0xc9bd, 0x47a2, [0x8d, 0x33, 0xb9, 0x48, 0x76, 0x97, 0x77, 0xa7]);
enum CLSID_WICSubIfdMetadataReader = GUID(0x50d42f09, 0xecd1, 0x4b41, [0xb6, 0x5d, 0xda, 0x1f, 0xda, 0xa7, 0x56, 0x63]);
enum CLSID_WICSubIfdMetadataWriter = GUID(0x8ade5386, 0x8e9b, 0x4f4c, [0xac, 0xf2, 0xf0, 0x0, 0x87, 0x6, 0xb2, 0x38]);
enum CLSID_WICExifMetadataReader = GUID(0xd9403860, 0x297f, 0x4a49, [0xbf, 0x9b, 0x77, 0x89, 0x81, 0x50, 0xa4, 0x42]);
enum CLSID_WICExifMetadataWriter = GUID(0xc9a14cda, 0xc339, 0x460b, [0x90, 0x78, 0xd4, 0xde, 0xbc, 0xfa, 0xbe, 0x91]);
enum CLSID_WICGpsMetadataReader = GUID(0x3697790b, 0x223b, 0x484e, [0x99, 0x25, 0xc4, 0x86, 0x92, 0x18, 0xf1, 0x7a]);
enum CLSID_WICGpsMetadataWriter = GUID(0xcb8c13e4, 0x62b5, 0x4c96, [0xa4, 0x8b, 0x6b, 0xa6, 0xac, 0xe3, 0x9c, 0x76]);
enum CLSID_WICInteropMetadataReader = GUID(0xb5c8b898, 0x74, 0x459f, [0xb7, 0x0, 0x86, 0xd, 0x46, 0x51, 0xea, 0x14]);
enum CLSID_WICInteropMetadataWriter = GUID(0x122ec645, 0xcd7e, 0x44d8, [0xb1, 0x86, 0x2c, 0x8c, 0x20, 0xc3, 0xb5, 0xf]);
enum CLSID_WICThumbnailMetadataReader = GUID(0xfb012959, 0xf4f6, 0x44d7, [0x9d, 0x9, 0xda, 0xa0, 0x87, 0xa9, 0xdb, 0x57]);
enum CLSID_WICThumbnailMetadataWriter = GUID(0xd049b20c, 0x5dd0, 0x44fe, [0xb0, 0xb3, 0x8f, 0x92, 0xc8, 0xe6, 0xd0, 0x80]);
enum CLSID_WICIPTCMetadataReader = GUID(0x3012959, 0xf4f6, 0x44d7, [0x9d, 0x9, 0xda, 0xa0, 0x87, 0xa9, 0xdb, 0x57]);
enum CLSID_WICIPTCMetadataWriter = GUID(0x1249b20c, 0x5dd0, 0x44fe, [0xb0, 0xb3, 0x8f, 0x92, 0xc8, 0xe6, 0xd0, 0x80]);
enum CLSID_WICIRBMetadataReader = GUID(0xd4dcd3d7, 0xb4c2, 0x47d9, [0xa6, 0xbf, 0xb8, 0x9b, 0xa3, 0x96, 0xa4, 0xa3]);
enum CLSID_WICIRBMetadataWriter = GUID(0x5c5c1935, 0x235, 0x4434, [0x80, 0xbc, 0x25, 0x1b, 0xc1, 0xec, 0x39, 0xc6]);
enum CLSID_WIC8BIMIPTCMetadataReader = GUID(0x10668c, 0x801, 0x4da6, [0xa4, 0xa4, 0x82, 0x65, 0x22, 0xb6, 0xd2, 0x8f]);
enum CLSID_WIC8BIMIPTCMetadataWriter = GUID(0x108226, 0xee41, 0x44a2, [0x9e, 0x9c, 0x4b, 0xe4, 0xd5, 0xb1, 0xd2, 0xcd]);
enum CLSID_WIC8BIMResolutionInfoMetadataReader = GUID(0x5805137a, 0xe348, 0x4f7c, [0xb3, 0xcc, 0x6d, 0xb9, 0x96, 0x5a, 0x5, 0x99]);
enum CLSID_WIC8BIMResolutionInfoMetadataWriter = GUID(0x4ff2fe0e, 0xe74a, 0x4b71, [0x98, 0xc4, 0xab, 0x7d, 0xc1, 0x67, 0x7, 0xba]);
enum CLSID_WIC8BIMIPTCDigestMetadataReader = GUID(0x2805f1e, 0xd5aa, 0x415b, [0x82, 0xc5, 0x61, 0xc0, 0x33, 0xa9, 0x88, 0xa6]);
enum CLSID_WIC8BIMIPTCDigestMetadataWriter = GUID(0x2db5e62b, 0xd67, 0x495f, [0x8f, 0x9d, 0xc2, 0xf0, 0x18, 0x86, 0x47, 0xac]);
enum CLSID_WICPngTextMetadataReader = GUID(0x4b59afcc, 0xb8c3, 0x408a, [0xb6, 0x70, 0x89, 0xe5, 0xfa, 0xb6, 0xfd, 0xa7]);
enum CLSID_WICPngTextMetadataWriter = GUID(0xb5ebafb9, 0x253e, 0x4a72, [0xa7, 0x44, 0x7, 0x62, 0xd2, 0x68, 0x56, 0x83]);
enum CLSID_WICXMPMetadataReader = GUID(0x72b624df, 0xae11, 0x4948, [0xa6, 0x5c, 0x35, 0x1e, 0xb0, 0x82, 0x94, 0x19]);
enum CLSID_WICXMPMetadataWriter = GUID(0x1765e14e, 0x1bd4, 0x462e, [0xb6, 0xb1, 0x59, 0xb, 0xf1, 0x26, 0x2a, 0xc6]);
enum CLSID_WICXMPStructMetadataReader = GUID(0x1b90d9a, 0x8209, 0x47f7, [0x9c, 0x52, 0xe1, 0x24, 0x4b, 0xf5, 0xc, 0xed]);
enum CLSID_WICXMPStructMetadataWriter = GUID(0x22c21f93, 0x7ddb, 0x411c, [0x9b, 0x17, 0xc5, 0xb7, 0xbd, 0x6, 0x4a, 0xbc]);
enum CLSID_WICXMPBagMetadataReader = GUID(0xe7e79a30, 0x4f2c, 0x4fab, [0x8d, 0x0, 0x39, 0x4f, 0x2d, 0x6b, 0xbe, 0xbe]);
enum CLSID_WICXMPBagMetadataWriter = GUID(0xed822c8c, 0xd6be, 0x4301, [0xa6, 0x31, 0xe, 0x14, 0x16, 0xba, 0xd2, 0x8f]);
enum CLSID_WICXMPSeqMetadataReader = GUID(0x7f12e753, 0xfc71, 0x43d7, [0xa5, 0x1d, 0x92, 0xf3, 0x59, 0x77, 0xab, 0xb5]);
enum CLSID_WICXMPSeqMetadataWriter = GUID(0x6d68d1de, 0xd432, 0x4b0f, [0x92, 0x3a, 0x9, 0x11, 0x83, 0xa9, 0xbd, 0xa7]);
enum CLSID_WICXMPAltMetadataReader = GUID(0xaa94dcc2, 0xb8b0, 0x4898, [0xb8, 0x35, 0x0, 0xa, 0xab, 0xd7, 0x43, 0x93]);
enum CLSID_WICXMPAltMetadataWriter = GUID(0x76c2a6c, 0xf78f, 0x4c46, [0xa7, 0x23, 0x35, 0x83, 0xe7, 0x8, 0x76, 0xea]);
enum CLSID_WICLSDMetadataReader = GUID(0x41070793, 0x59e4, 0x479a, [0xa1, 0xf7, 0x95, 0x4a, 0xdc, 0x2e, 0xf5, 0xfc]);
enum CLSID_WICLSDMetadataWriter = GUID(0x73c037e7, 0xe5d9, 0x4954, [0x87, 0x6a, 0x6d, 0xa8, 0x1d, 0x6e, 0x57, 0x68]);
enum CLSID_WICGCEMetadataReader = GUID(0xb92e345d, 0xf52d, 0x41f3, [0xb5, 0x62, 0x8, 0x1b, 0xc7, 0x72, 0xe3, 0xb9]);
enum CLSID_WICGCEMetadataWriter = GUID(0xaf95dc76, 0x16b2, 0x47f4, [0xb3, 0xea, 0x3c, 0x31, 0x79, 0x66, 0x93, 0xe7]);
enum CLSID_WICIMDMetadataReader = GUID(0x7447a267, 0x15, 0x42c8, [0xa8, 0xf1, 0xfb, 0x3b, 0x94, 0xc6, 0x83, 0x61]);
enum CLSID_WICIMDMetadataWriter = GUID(0x8c89071f, 0x452e, 0x4e95, [0x96, 0x82, 0x9d, 0x10, 0x24, 0x62, 0x71, 0x72]);
enum CLSID_WICAPEMetadataReader = GUID(0x1767b93a, 0xb021, 0x44ea, [0x92, 0xf, 0x86, 0x3c, 0x11, 0xf4, 0xf7, 0x68]);
enum CLSID_WICAPEMetadataWriter = GUID(0xbd6edfca, 0x2890, 0x482f, [0xb2, 0x33, 0x8d, 0x73, 0x39, 0xa1, 0xcf, 0x8d]);
enum CLSID_WICJpegChrominanceMetadataReader = GUID(0x50b1904b, 0xf28f, 0x4574, [0x93, 0xf4, 0xb, 0xad, 0xe8, 0x2c, 0x69, 0xe9]);
enum CLSID_WICJpegChrominanceMetadataWriter = GUID(0x3ff566f0, 0x6e6b, 0x49d4, [0x96, 0xe6, 0xb7, 0x88, 0x86, 0x69, 0x2c, 0x62]);
enum CLSID_WICJpegLuminanceMetadataReader = GUID(0x356f2f88, 0x5a6, 0x4728, [0xb9, 0xa4, 0x1b, 0xfb, 0xce, 0x4, 0xd8, 0x38]);
enum CLSID_WICJpegLuminanceMetadataWriter = GUID(0x1d583abc, 0x8a0e, 0x4657, [0x99, 0x82, 0xa3, 0x80, 0xca, 0x58, 0xfb, 0x4b]);
enum CLSID_WICJpegCommentMetadataReader = GUID(0x9f66347c, 0x60c4, 0x4c4d, [0xab, 0x58, 0xd2, 0x35, 0x86, 0x85, 0xf6, 0x7]);
enum CLSID_WICJpegCommentMetadataWriter = GUID(0xe573236f, 0x55b1, 0x4eda, [0x81, 0xea, 0x9f, 0x65, 0xdb, 0x2, 0x90, 0xd3]);
enum CLSID_WICGifCommentMetadataReader = GUID(0x32557d3b, 0x69dc, 0x4f95, [0x83, 0x6e, 0xf5, 0x97, 0x2b, 0x2f, 0x61, 0x59]);
enum CLSID_WICGifCommentMetadataWriter = GUID(0xa02797fc, 0xc4ae, 0x418c, [0xaf, 0x95, 0xe6, 0x37, 0xc7, 0xea, 0xd2, 0xa1]);
enum CLSID_WICPngGamaMetadataReader = GUID(0x3692ca39, 0xe082, 0x4350, [0x9e, 0x1f, 0x37, 0x4, 0xcb, 0x8, 0x3c, 0xd5]);
enum CLSID_WICPngGamaMetadataWriter = GUID(0xff036d13, 0x5d4b, 0x46dd, [0xb1, 0xf, 0x10, 0x66, 0x93, 0xd9, 0xfe, 0x4f]);
enum CLSID_WICPngBkgdMetadataReader = GUID(0xce7a4a6, 0x3e8, 0x4a60, [0x9d, 0x15, 0x28, 0x2e, 0xf3, 0x2e, 0xe7, 0xda]);
enum CLSID_WICPngBkgdMetadataWriter = GUID(0x68e3f2fd, 0x31ae, 0x4441, [0xbb, 0x6a, 0xfd, 0x70, 0x47, 0x52, 0x5f, 0x90]);
enum CLSID_WICPngItxtMetadataReader = GUID(0xaabfb2fa, 0x3e1e, 0x4a8f, [0x89, 0x77, 0x55, 0x56, 0xfb, 0x94, 0xea, 0x23]);
enum CLSID_WICPngItxtMetadataWriter = GUID(0x31879719, 0xe751, 0x4df8, [0x98, 0x1d, 0x68, 0xdf, 0xf6, 0x77, 0x4, 0xed]);
enum CLSID_WICPngChrmMetadataReader = GUID(0xf90b5f36, 0x367b, 0x402a, [0x9d, 0xd1, 0xbc, 0xf, 0xd5, 0x9d, 0x8f, 0x62]);
enum CLSID_WICPngChrmMetadataWriter = GUID(0xe23ce3eb, 0x5608, 0x4e83, [0xbc, 0xef, 0x27, 0xb1, 0x98, 0x7e, 0x51, 0xd7]);
enum CLSID_WICPngHistMetadataReader = GUID(0x877a0bb7, 0xa313, 0x4491, [0x87, 0xb5, 0x2e, 0x6d, 0x5, 0x94, 0xf5, 0x20]);
enum CLSID_WICPngHistMetadataWriter = GUID(0x8a03e749, 0x672e, 0x446e, [0xbf, 0x1f, 0x2c, 0x11, 0xd2, 0x33, 0xb6, 0xff]);
enum CLSID_WICPngIccpMetadataReader = GUID(0xf5d3e63b, 0xcb0f, 0x4628, [0xa4, 0x78, 0x6d, 0x82, 0x44, 0xbe, 0x36, 0xb1]);
enum CLSID_WICPngIccpMetadataWriter = GUID(0x16671e5f, 0xce6, 0x4cc4, [0x97, 0x68, 0xe8, 0x9f, 0xe5, 0x1, 0x8a, 0xde]);
enum CLSID_WICPngSrgbMetadataReader = GUID(0xfb40360c, 0x547e, 0x4956, [0xa3, 0xb9, 0xd4, 0x41, 0x88, 0x59, 0xba, 0x66]);
enum CLSID_WICPngSrgbMetadataWriter = GUID(0xa6ee35c6, 0x87ec, 0x47df, [0x9f, 0x22, 0x1d, 0x5a, 0xad, 0x84, 0xc, 0x82]);
enum CLSID_WICPngTimeMetadataReader = GUID(0xd94edf02, 0xefe5, 0x4f0d, [0x85, 0xc8, 0xf5, 0xa6, 0x8b, 0x30, 0x0, 0xb1]);
enum CLSID_WICPngTimeMetadataWriter = GUID(0x1ab78400, 0xb5a3, 0x4d91, [0x8a, 0xce, 0x33, 0xfc, 0xd1, 0x49, 0x9b, 0xe6]);
enum CLSID_WICDdsMetadataReader = GUID(0x276c88ca, 0x7533, 0x4a86, [0xb6, 0x76, 0x66, 0xb3, 0x60, 0x80, 0xd4, 0x84]);
enum CLSID_WICDdsMetadataWriter = GUID(0xfd688bbd, 0x31ed, 0x4db7, [0xa7, 0x23, 0x93, 0x49, 0x27, 0xd3, 0x83, 0x67]);
enum CLSID_WICHeifMetadataReader = GUID(0xacddfc3f, 0x85ec, 0x41bc, [0xbd, 0xef, 0x1b, 0xc2, 0x62, 0xe4, 0xdb, 0x5]);
enum CLSID_WICHeifMetadataWriter = GUID(0x3ae45e79, 0x40bc, 0x4401, [0xac, 0xe5, 0xdd, 0x3c, 0xb1, 0x6e, 0x6a, 0xfe]);
enum CLSID_WICHeifHDRMetadataReader = GUID(0x2438de3d, 0x94d9, 0x4be8, [0x84, 0xa8, 0x4d, 0xe9, 0x5a, 0x57, 0x5e, 0x75]);
enum CLSID_WICWebpAnimMetadataReader = GUID(0x76f9911, 0xa348, 0x465c, [0xa8, 0x7, 0xa2, 0x52, 0xf3, 0xf2, 0xd3, 0xde]);
enum CLSID_WICWebpAnmfMetadataReader = GUID(0x85a10b03, 0xc9f6, 0x439f, [0xbe, 0x5e, 0xc0, 0xfb, 0xef, 0x67, 0x80, 0x7c]);
struct WICRect
{
    int X;
    int Y;
    int Width;
    int Height;
}
alias WICColorContextType = int;
enum : int
{
    WICColorContextUninitialized  = 0x00000000,
    WICColorContextProfile        = 0x00000001,
    WICColorContextExifColorSpace = 0x00000002,
}

alias WICBitmapCreateCacheOption = int;
enum : int
{
    WICBitmapNoCache       = 0x00000000,
    WICBitmapCacheOnDemand = 0x00000001,
    WICBitmapCacheOnLoad   = 0x00000002,
}

alias WICDecodeOptions = int;
enum : int
{
    WICDecodeMetadataCacheOnDemand = 0x00000000,
    WICDecodeMetadataCacheOnLoad   = 0x00000001,
}

alias WICBitmapEncoderCacheOption = int;
enum : int
{
    WICBitmapEncoderCacheInMemory = 0x00000000,
    WICBitmapEncoderCacheTempFile = 0x00000001,
    WICBitmapEncoderNoCache       = 0x00000002,
}

alias WICComponentType = int;
enum : int
{
    WICDecoder              = 0x00000001,
    WICEncoder              = 0x00000002,
    WICPixelFormatConverter = 0x00000004,
    WICMetadataReader       = 0x00000008,
    WICMetadataWriter       = 0x00000010,
    WICPixelFormat          = 0x00000020,
    WICAllComponents        = 0x0000003f,
}

alias WICComponentEnumerateOptions = int;
enum : int
{
    WICComponentEnumerateDefault     = 0x00000000,
    WICComponentEnumerateRefresh     = 0x00000001,
    WICComponentEnumerateDisabled    = 0x80000000,
    WICComponentEnumerateUnsigned    = 0x40000000,
    WICComponentEnumerateBuiltInOnly = 0x20000000,
}

struct WICBitmapPattern
{
    ulong Position;
    uint Length;
    ubyte* Pattern;
    ubyte* Mask;
    BOOL EndOfStream;
}
alias WICBitmapInterpolationMode = int;
enum : int
{
    WICBitmapInterpolationModeNearestNeighbor  = 0x00000000,
    WICBitmapInterpolationModeLinear           = 0x00000001,
    WICBitmapInterpolationModeCubic            = 0x00000002,
    WICBitmapInterpolationModeFant             = 0x00000003,
    WICBitmapInterpolationModeHighQualityCubic = 0x00000004,
}

alias WICBitmapPaletteType = int;
enum : int
{
    WICBitmapPaletteTypeCustom           = 0x00000000,
    WICBitmapPaletteTypeMedianCut        = 0x00000001,
    WICBitmapPaletteTypeFixedBW          = 0x00000002,
    WICBitmapPaletteTypeFixedHalftone8   = 0x00000003,
    WICBitmapPaletteTypeFixedHalftone27  = 0x00000004,
    WICBitmapPaletteTypeFixedHalftone64  = 0x00000005,
    WICBitmapPaletteTypeFixedHalftone125 = 0x00000006,
    WICBitmapPaletteTypeFixedHalftone216 = 0x00000007,
    WICBitmapPaletteTypeFixedWebPalette  = 0x00000007,
    WICBitmapPaletteTypeFixedHalftone252 = 0x00000008,
    WICBitmapPaletteTypeFixedHalftone256 = 0x00000009,
    WICBitmapPaletteTypeFixedGray4       = 0x0000000a,
    WICBitmapPaletteTypeFixedGray16      = 0x0000000b,
    WICBitmapPaletteTypeFixedGray256     = 0x0000000c,
}

alias WICBitmapDitherType = int;
enum : int
{
    WICBitmapDitherTypeNone           = 0x00000000,
    WICBitmapDitherTypeSolid          = 0x00000000,
    WICBitmapDitherTypeOrdered4x4     = 0x00000001,
    WICBitmapDitherTypeOrdered8x8     = 0x00000002,
    WICBitmapDitherTypeOrdered16x16   = 0x00000003,
    WICBitmapDitherTypeSpiral4x4      = 0x00000004,
    WICBitmapDitherTypeSpiral8x8      = 0x00000005,
    WICBitmapDitherTypeDualSpiral4x4  = 0x00000006,
    WICBitmapDitherTypeDualSpiral8x8  = 0x00000007,
    WICBitmapDitherTypeErrorDiffusion = 0x00000008,
}

alias WICBitmapAlphaChannelOption = int;
enum : int
{
    WICBitmapUseAlpha              = 0x00000000,
    WICBitmapUsePremultipliedAlpha = 0x00000001,
    WICBitmapIgnoreAlpha           = 0x00000002,
}

alias WICBitmapTransformOptions = int;
enum : int
{
    WICBitmapTransformRotate0        = 0x00000000,
    WICBitmapTransformRotate90       = 0x00000001,
    WICBitmapTransformRotate180      = 0x00000002,
    WICBitmapTransformRotate270      = 0x00000003,
    WICBitmapTransformFlipHorizontal = 0x00000008,
    WICBitmapTransformFlipVertical   = 0x00000010,
}

alias WICBitmapLockFlags = int;
enum : int
{
    WICBitmapLockRead  = 0x00000001,
    WICBitmapLockWrite = 0x00000002,
}

alias WICBitmapDecoderCapabilities = int;
enum : int
{
    WICBitmapDecoderCapabilitySameEncoder          = 0x00000001,
    WICBitmapDecoderCapabilityCanDecodeAllImages   = 0x00000002,
    WICBitmapDecoderCapabilityCanDecodeSomeImages  = 0x00000004,
    WICBitmapDecoderCapabilityCanEnumerateMetadata = 0x00000008,
    WICBitmapDecoderCapabilityCanDecodeThumbnail   = 0x00000010,
}

alias WICProgressOperation = int;
enum : int
{
    WICProgressOperationCopyPixels  = 0x00000001,
    WICProgressOperationWritePixels = 0x00000002,
    WICProgressOperationAll         = 0x0000ffff,
}

alias WICProgressNotification = int;
enum : int
{
    WICProgressNotificationBegin    = 0x00010000,
    WICProgressNotificationEnd      = 0x00020000,
    WICProgressNotificationFrequent = 0x00040000,
    WICProgressNotificationAll      = 0xffff0000,
}

alias WICComponentSigning = int;
enum : int
{
    WICComponentSigned   = 0x00000001,
    WICComponentUnsigned = 0x00000002,
    WICComponentSafe     = 0x00000004,
    WICComponentDisabled = 0x80000000,
}

alias WICGifLogicalScreenDescriptorProperties = uint;
enum : uint
{
    WICGifLogicalScreenSignature                      = 0x00000001,
    WICGifLogicalScreenDescriptorWidth                = 0x00000002,
    WICGifLogicalScreenDescriptorHeight               = 0x00000003,
    WICGifLogicalScreenDescriptorGlobalColorTableFlag = 0x00000004,
    WICGifLogicalScreenDescriptorColorResolution      = 0x00000005,
    WICGifLogicalScreenDescriptorSortFlag             = 0x00000006,
    WICGifLogicalScreenDescriptorGlobalColorTableSize = 0x00000007,
    WICGifLogicalScreenDescriptorBackgroundColorIndex = 0x00000008,
    WICGifLogicalScreenDescriptorPixelAspectRatio     = 0x00000009,
}

alias WICGifImageDescriptorProperties = uint;
enum : uint
{
    WICGifImageDescriptorLeft                = 0x00000001,
    WICGifImageDescriptorTop                 = 0x00000002,
    WICGifImageDescriptorWidth               = 0x00000003,
    WICGifImageDescriptorHeight              = 0x00000004,
    WICGifImageDescriptorLocalColorTableFlag = 0x00000005,
    WICGifImageDescriptorInterlaceFlag       = 0x00000006,
    WICGifImageDescriptorSortFlag            = 0x00000007,
    WICGifImageDescriptorLocalColorTableSize = 0x00000008,
}

alias WICGifGraphicControlExtensionProperties = uint;
enum : uint
{
    WICGifGraphicControlExtensionDisposal              = 0x00000001,
    WICGifGraphicControlExtensionUserInputFlag         = 0x00000002,
    WICGifGraphicControlExtensionTransparencyFlag      = 0x00000003,
    WICGifGraphicControlExtensionDelay                 = 0x00000004,
    WICGifGraphicControlExtensionTransparentColorIndex = 0x00000005,
}

alias WICGifApplicationExtensionProperties = uint;
enum : uint
{
    WICGifApplicationExtensionApplication = 0x00000001,
    WICGifApplicationExtensionData        = 0x00000002,
}

alias WICGifCommentExtensionProperties = uint;
enum : uint
{
    WICGifCommentExtensionText = 0x00000001,
}

alias WICJpegCommentProperties = uint;
enum : uint
{
    WICJpegCommentText = 0x00000001,
}

alias WICJpegLuminanceProperties = uint;
enum : uint
{
    WICJpegLuminanceTable = 0x00000001,
}

alias WICJpegChrominanceProperties = uint;
enum : uint
{
    WICJpegChrominanceTable = 0x00000001,
}

alias WIC8BIMIptcProperties = uint;
enum : uint
{
    WIC8BIMIptcPString      = 0x00000000,
    WIC8BIMIptcEmbeddedIPTC = 0x00000001,
}

alias WIC8BIMResolutionInfoProperties = uint;
enum : uint
{
    WIC8BIMResolutionInfoPString         = 0x00000001,
    WIC8BIMResolutionInfoHResolution     = 0x00000002,
    WIC8BIMResolutionInfoHResolutionUnit = 0x00000003,
    WIC8BIMResolutionInfoWidthUnit       = 0x00000004,
    WIC8BIMResolutionInfoVResolution     = 0x00000005,
    WIC8BIMResolutionInfoVResolutionUnit = 0x00000006,
    WIC8BIMResolutionInfoHeightUnit      = 0x00000007,
}

alias WIC8BIMIptcDigestProperties = uint;
enum : uint
{
    WIC8BIMIptcDigestPString    = 0x00000001,
    WIC8BIMIptcDigestIptcDigest = 0x00000002,
}

alias WICPngGamaProperties = uint;
enum : uint
{
    WICPngGamaGamma = 0x00000001,
}

alias WICPngBkgdProperties = uint;
enum : uint
{
    WICPngBkgdBackgroundColor = 0x00000001,
}

alias WICPngItxtProperties = uint;
enum : uint
{
    WICPngItxtKeyword           = 0x00000001,
    WICPngItxtCompressionFlag   = 0x00000002,
    WICPngItxtLanguageTag       = 0x00000003,
    WICPngItxtTranslatedKeyword = 0x00000004,
    WICPngItxtText              = 0x00000005,
}

alias WICPngChrmProperties = uint;
enum : uint
{
    WICPngChrmWhitePointX = 0x00000001,
    WICPngChrmWhitePointY = 0x00000002,
    WICPngChrmRedX        = 0x00000003,
    WICPngChrmRedY        = 0x00000004,
    WICPngChrmGreenX      = 0x00000005,
    WICPngChrmGreenY      = 0x00000006,
    WICPngChrmBlueX       = 0x00000007,
    WICPngChrmBlueY       = 0x00000008,
}

alias WICPngHistProperties = uint;
enum : uint
{
    WICPngHistFrequencies = 0x00000001,
}

alias WICPngIccpProperties = uint;
enum : uint
{
    WICPngIccpProfileName = 0x00000001,
    WICPngIccpProfileData = 0x00000002,
}

alias WICPngSrgbProperties = uint;
enum : uint
{
    WICPngSrgbRenderingIntent = 0x00000001,
}

alias WICPngTimeProperties = uint;
enum : uint
{
    WICPngTimeYear   = 0x00000001,
    WICPngTimeMonth  = 0x00000002,
    WICPngTimeDay    = 0x00000003,
    WICPngTimeHour   = 0x00000004,
    WICPngTimeMinute = 0x00000005,
    WICPngTimeSecond = 0x00000006,
}

alias WICHeifProperties = uint;
enum : uint
{
    WICHeifOrientation = 0x00000001,
}

alias WICHeifHdrProperties = uint;
enum : uint
{
    WICHeifHdrMaximumLuminanceLevel                 = 0x00000001,
    WICHeifHdrMaximumFrameAverageLuminanceLevel     = 0x00000002,
    WICHeifHdrMinimumMasteringDisplayLuminanceLevel = 0x00000003,
    WICHeifHdrMaximumMasteringDisplayLuminanceLevel = 0x00000004,
    WICHeifHdrCustomVideoPrimaries                  = 0x00000005,
}

alias WICWebpAnimProperties = uint;
enum : uint
{
    WICWebpAnimLoopCount = 0x00000001,
}

alias WICWebpAnmfProperties = uint;
enum : uint
{
    WICWebpAnmfFrameDuration = 0x00000001,
}

alias WICSectionAccessLevel = uint;
enum : uint
{
    WICSectionAccessLevelRead      = 0x00000001,
    WICSectionAccessLevelReadWrite = 0x00000003,
}

alias WICPixelFormatNumericRepresentation = uint;
enum : uint
{
    WICPixelFormatNumericRepresentationUnspecified     = 0x00000000,
    WICPixelFormatNumericRepresentationIndexed         = 0x00000001,
    WICPixelFormatNumericRepresentationUnsignedInteger = 0x00000002,
    WICPixelFormatNumericRepresentationSignedInteger   = 0x00000003,
    WICPixelFormatNumericRepresentationFixed           = 0x00000004,
    WICPixelFormatNumericRepresentationFloat           = 0x00000005,
}

alias WICPlanarOptions = int;
enum : int
{
    WICPlanarOptionsDefault             = 0x00000000,
    WICPlanarOptionsPreserveSubsampling = 0x00000001,
}

alias WICJpegIndexingOptions = uint;
enum : uint
{
    WICJpegIndexingOptionsGenerateOnDemand = 0x00000000,
    WICJpegIndexingOptionsGenerateOnLoad   = 0x00000001,
}

alias WICJpegTransferMatrix = uint;
enum : uint
{
    WICJpegTransferMatrixIdentity = 0x00000000,
    WICJpegTransferMatrixBT601    = 0x00000001,
}

alias WICJpegScanType = uint;
enum : uint
{
    WICJpegScanTypeInterleaved      = 0x00000000,
    WICJpegScanTypePlanarComponents = 0x00000001,
    WICJpegScanTypeProgressive      = 0x00000002,
}

struct WICImageParameters
{
    D2D1_PIXEL_FORMAT PixelFormat;
    float DpiX;
    float DpiY;
    float Top;
    float Left;
    uint PixelWidth;
    uint PixelHeight;
}
struct WICBitmapPlaneDescription
{
    GUID Format;
    uint Width;
    uint Height;
}
struct WICBitmapPlane
{
    GUID Format;
    ubyte* pbBuffer;
    uint cbStride;
    uint cbBufferSize;
}
struct WICJpegFrameHeader
{
    uint Width;
    uint Height;
    WICJpegTransferMatrix TransferMatrix;
    WICJpegScanType ScanType;
    uint cComponents;
    uint ComponentIdentifiers;
    uint SampleFactors;
    uint QuantizationTableIndices;
}
struct WICJpegScanHeader
{
    uint cComponents;
    uint RestartInterval;
    uint ComponentSelectors;
    uint HuffmanTableIndices;
    ubyte StartSpectralSelection;
    ubyte EndSpectralSelection;
    ubyte SuccessiveApproximationHigh;
    ubyte SuccessiveApproximationLow;
}
enum IID_IWICPalette = GUID(0x40, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICPalette : IUnknown
{
    HRESULT InitializePredefined(WICBitmapPaletteType, BOOL);
    HRESULT InitializeCustom(uint*, uint);
    HRESULT InitializeFromBitmap(IWICBitmapSource, uint, BOOL);
    HRESULT InitializeFromPalette(IWICPalette);
    HRESULT GetType(WICBitmapPaletteType*);
    HRESULT GetColorCount(uint*);
    HRESULT GetColors(uint, uint*, uint*);
    HRESULT IsBlackWhite(BOOL*);
    HRESULT IsGrayscale(BOOL*);
    HRESULT HasAlpha(BOOL*);
}
enum IID_IWICBitmapSource = GUID(0x120, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICBitmapSource : IUnknown
{
    HRESULT GetSize(uint*, uint*);
    HRESULT GetPixelFormat(GUID*);
    HRESULT GetResolution(double*, double*);
    HRESULT CopyPalette(IWICPalette);
    HRESULT CopyPixels(const(WICRect)*, uint, uint, ubyte*);
}
enum IID_IWICFormatConverter = GUID(0x301, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICFormatConverter : IWICBitmapSource
{
    HRESULT Initialize(IWICBitmapSource, GUID*, WICBitmapDitherType, IWICPalette, double, WICBitmapPaletteType);
    HRESULT CanConvert(GUID*, GUID*, BOOL*);
}
enum IID_IWICPlanarFormatConverter = GUID(0xbebee9cb, 0x83b0, 0x4dcc, [0x81, 0x32, 0xb0, 0xaa, 0xa5, 0x5e, 0xac, 0x96]);
interface IWICPlanarFormatConverter : IWICBitmapSource
{
    HRESULT Initialize(IWICBitmapSource*, uint, GUID*, WICBitmapDitherType, IWICPalette, double, WICBitmapPaletteType);
    HRESULT CanConvert(const(GUID)*, uint, GUID*, BOOL*);
}
enum IID_IWICBitmapScaler = GUID(0x302, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICBitmapScaler : IWICBitmapSource
{
    HRESULT Initialize(IWICBitmapSource, uint, uint, WICBitmapInterpolationMode);
}
enum IID_IWICBitmapClipper = GUID(0xe4fbcf03, 0x223d, 0x4e81, [0x93, 0x33, 0xd6, 0x35, 0x55, 0x6d, 0xd1, 0xb5]);
interface IWICBitmapClipper : IWICBitmapSource
{
    HRESULT Initialize(IWICBitmapSource, const(WICRect)*);
}
enum IID_IWICBitmapFlipRotator = GUID(0x5009834f, 0x2d6a, 0x41ce, [0x9e, 0x1b, 0x17, 0xc5, 0xaf, 0xf7, 0xa7, 0x82]);
interface IWICBitmapFlipRotator : IWICBitmapSource
{
    HRESULT Initialize(IWICBitmapSource, WICBitmapTransformOptions);
}
enum IID_IWICBitmapLock = GUID(0x123, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICBitmapLock : IUnknown
{
    HRESULT GetSize(uint*, uint*);
    HRESULT GetStride(uint*);
    HRESULT GetDataPointer(uint*, ubyte**);
    HRESULT GetPixelFormat(GUID*);
}
enum IID_IWICBitmap = GUID(0x121, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICBitmap : IWICBitmapSource
{
    HRESULT Lock(const(WICRect)*, uint, IWICBitmapLock*);
    HRESULT SetPalette(IWICPalette);
    HRESULT SetResolution(double, double);
}
enum IID_IWICColorContext = GUID(0x3c613a02, 0x34b2, 0x44ea, [0x9a, 0x7c, 0x45, 0xae, 0xa9, 0xc6, 0xfd, 0x6d]);
interface IWICColorContext : IUnknown
{
    HRESULT InitializeFromFilename(const(wchar)*);
    HRESULT InitializeFromMemory(const(ubyte)*, uint);
    HRESULT InitializeFromExifColorSpace(uint);
    HRESULT GetType(WICColorContextType*);
    HRESULT GetProfileBytes(uint, ubyte*, uint*);
    HRESULT GetExifColorSpace(uint*);
}
enum IID_IWICColorTransform = GUID(0xb66f034f, 0xd0e2, 0x40ab, [0xb4, 0x36, 0x6d, 0xe3, 0x9e, 0x32, 0x1a, 0x94]);
interface IWICColorTransform : IWICBitmapSource
{
    HRESULT Initialize(IWICBitmapSource, IWICColorContext, IWICColorContext, GUID*);
}
enum IID_IWICFastMetadataEncoder = GUID(0xb84e2c09, 0x78c9, 0x4ac4, [0x8b, 0xd3, 0x52, 0x4a, 0xe1, 0x66, 0x3a, 0x2f]);
interface IWICFastMetadataEncoder : IUnknown
{
    HRESULT Commit();
    HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter*);
}
enum IID_IWICStream = GUID(0x135ff860, 0x22b7, 0x4ddf, [0xb0, 0xf6, 0x21, 0x8f, 0x4f, 0x29, 0x9a, 0x43]);
interface IWICStream : IStream
{
    HRESULT InitializeFromIStream(IStream);
    HRESULT InitializeFromFilename(const(wchar)*, uint);
    HRESULT InitializeFromMemory(ubyte*, uint);
    HRESULT InitializeFromIStreamRegion(IStream, ulong, ulong);
}
enum IID_IWICEnumMetadataItem = GUID(0xdc2bb46d, 0x3f07, 0x481e, [0x86, 0x25, 0x22, 0xc, 0x4a, 0xed, 0xbb, 0x33]);
interface IWICEnumMetadataItem : IUnknown
{
    HRESULT Next(uint, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IWICEnumMetadataItem*);
}
enum IID_IWICMetadataQueryReader = GUID(0x30989668, 0xe1c9, 0x4597, [0xb3, 0x95, 0x45, 0x8e, 0xed, 0xb8, 0x8, 0xdf]);
interface IWICMetadataQueryReader : IUnknown
{
    HRESULT GetContainerFormat(GUID*);
    HRESULT GetLocation(uint, PWSTR, uint*);
    HRESULT GetMetadataByName(const(wchar)*, PROPVARIANT*);
    HRESULT GetEnumerator(IEnumString*);
}
enum IID_IWICMetadataQueryWriter = GUID(0xa721791a, 0xdef, 0x4d06, [0xbd, 0x91, 0x21, 0x18, 0xbf, 0x1d, 0xb1, 0xb]);
interface IWICMetadataQueryWriter : IWICMetadataQueryReader
{
    HRESULT SetMetadataByName(const(wchar)*, const(PROPVARIANT)*);
    HRESULT RemoveMetadataByName(const(wchar)*);
}
enum IID_IWICBitmapEncoder = GUID(0x103, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICBitmapEncoder : IUnknown
{
    HRESULT Initialize(IStream, WICBitmapEncoderCacheOption);
    HRESULT GetContainerFormat(GUID*);
    HRESULT GetEncoderInfo(IWICBitmapEncoderInfo*);
    HRESULT SetColorContexts(uint, IWICColorContext*);
    HRESULT SetPalette(IWICPalette);
    HRESULT SetThumbnail(IWICBitmapSource);
    HRESULT SetPreview(IWICBitmapSource);
    HRESULT CreateNewFrame(IWICBitmapFrameEncode*, IPropertyBag2*);
    HRESULT Commit();
    HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter*);
}
enum IID_IWICBitmapFrameEncode = GUID(0x105, 0xa8f2, 0x4877, [0xba, 0xa, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94]);
interface IWICBitmapFrameEncode : IUnknown
{
    HRESULT Initialize(IPropertyBag2);
    HRESULT SetSize(uint, uint);
    HRESULT SetResolution(double, double);
    HRESULT SetPixelFormat(GUID*);
    HRESULT SetColorContexts(uint, IWICColorContext*);
    HRESULT SetPalette(IWICPalette);
    HRESULT SetThumbnail(IWICBitmapSource);
    HRESULT WritePixels(uint, uint, uint, ubyte*);
    HRESULT WriteSource(IWICBitmapSource, WICRect*);
    HRESULT Commit();
    HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter*);
}
enum IID_IWICPlanarBitmapFrameEncode = GUID(0xf928b7b8, 0x2221, 0x40c1, [0xb7, 0x2e, 0x7e, 0x82, 0xf1, 0x97, 0x4d, 0x1a]);
interface IWICPlanarBitmapFrameEncode : IUnknown
{
    HRESULT WritePixels(uint, WICBitmapPlane*, uint);
    HRESULT WriteSource(IWICBitmapSource*, uint, WICRect*);
}
enum IID_IWICBitmapDecoder = GUID(0x9edde9e7, 0x8dee, 0x47ea, [0x99, 0xdf, 0xe6, 0xfa, 0xf2, 0xed, 0x44, 0xbf]);
interface IWICBitmapDecoder : IUnknown
{
    HRESULT QueryCapability(IStream, uint*);
    HRESULT Initialize(IStream, WICDecodeOptions);
    HRESULT GetContainerFormat(GUID*);
    HRESULT GetDecoderInfo(IWICBitmapDecoderInfo*);
    HRESULT CopyPalette(IWICPalette);
    HRESULT GetMetadataQueryReader(IWICMetadataQueryReader*);
    HRESULT GetPreview(IWICBitmapSource*);
    HRESULT GetColorContexts(uint, IWICColorContext*, uint*);
    HRESULT GetThumbnail(IWICBitmapSource*);
    HRESULT GetFrameCount(uint*);
    HRESULT GetFrame(uint, IWICBitmapFrameDecode*);
}
enum IID_IWICBitmapSourceTransform = GUID(0x3b16811b, 0x6a43, 0x4ec9, [0xb7, 0x13, 0x3d, 0x5a, 0xc, 0x13, 0xb9, 0x40]);
interface IWICBitmapSourceTransform : IUnknown
{
    HRESULT CopyPixels(const(WICRect)*, uint, uint, GUID*, WICBitmapTransformOptions, uint, uint, ubyte*);
    HRESULT GetClosestSize(uint*, uint*);
    HRESULT GetClosestPixelFormat(GUID*);
    HRESULT DoesSupportTransform(WICBitmapTransformOptions, BOOL*);
}
enum IID_IWICPlanarBitmapSourceTransform = GUID(0x3aff9cce, 0xbe95, 0x4303, [0xb9, 0x27, 0xe7, 0xd1, 0x6f, 0xf4, 0xa6, 0x13]);
interface IWICPlanarBitmapSourceTransform : IUnknown
{
    HRESULT DoesSupportTransform(uint*, uint*, WICBitmapTransformOptions, WICPlanarOptions, const(GUID)*, WICBitmapPlaneDescription*, uint, BOOL*);
    HRESULT CopyPixels(const(WICRect)*, uint, uint, WICBitmapTransformOptions, WICPlanarOptions, const(WICBitmapPlane)*, uint);
}
enum IID_IWICBitmapFrameDecode = GUID(0x3b16811b, 0x6a43, 0x4ec9, [0xa8, 0x13, 0x3d, 0x93, 0xc, 0x13, 0xb9, 0x40]);
interface IWICBitmapFrameDecode : IWICBitmapSource
{
    HRESULT GetMetadataQueryReader(IWICMetadataQueryReader*);
    HRESULT GetColorContexts(uint, IWICColorContext*, uint*);
    HRESULT GetThumbnail(IWICBitmapSource*);
}
enum IID_IWICProgressiveLevelControl = GUID(0xdaac296f, 0x7aa5, 0x4dbf, [0x8d, 0x15, 0x22, 0x5c, 0x59, 0x76, 0xf8, 0x91]);
interface IWICProgressiveLevelControl : IUnknown
{
    HRESULT GetLevelCount(uint*);
    HRESULT GetCurrentLevel(uint*);
    HRESULT SetCurrentLevel(uint);
}
enum IID_IWICProgressCallback = GUID(0x4776f9cd, 0x9517, 0x45fa, [0xbf, 0x24, 0xe8, 0x9c, 0x5e, 0xc5, 0xc6, 0xc]);
interface IWICProgressCallback : IUnknown
{
    HRESULT Notify(uint, WICProgressOperation, double);
}
alias PFNProgressNotification = HRESULT function(void*, uint, WICProgressOperation, double);
enum IID_IWICBitmapCodecProgressNotification = GUID(0x64c1024e, 0xc3cf, 0x4462, [0x80, 0x78, 0x88, 0xc2, 0xb1, 0x1c, 0x46, 0xd9]);
interface IWICBitmapCodecProgressNotification : IUnknown
{
    HRESULT RegisterProgressNotification(PFNProgressNotification, void*, uint);
}
enum IID_IWICComponentInfo = GUID(0x23bc3f0a, 0x698b, 0x4357, [0x88, 0x6b, 0xf2, 0x4d, 0x50, 0x67, 0x13, 0x34]);
interface IWICComponentInfo : IUnknown
{
    HRESULT GetComponentType(WICComponentType*);
    HRESULT GetCLSID(GUID*);
    HRESULT GetSigningStatus(uint*);
    HRESULT GetAuthor(uint, PWSTR, uint*);
    HRESULT GetVendorGUID(GUID*);
    HRESULT GetVersion(uint, PWSTR, uint*);
    HRESULT GetSpecVersion(uint, PWSTR, uint*);
    HRESULT GetFriendlyName(uint, PWSTR, uint*);
}
enum IID_IWICFormatConverterInfo = GUID(0x9f34fb65, 0x13f4, 0x4f15, [0xbc, 0x57, 0x37, 0x26, 0xb5, 0xe5, 0x3d, 0x9f]);
interface IWICFormatConverterInfo : IWICComponentInfo
{
    HRESULT GetPixelFormats(uint, GUID*, uint*);
    HRESULT CreateInstance(IWICFormatConverter*);
}
enum IID_IWICBitmapCodecInfo = GUID(0xe87a44c4, 0xb76e, 0x4c47, [0x8b, 0x9, 0x29, 0x8e, 0xb1, 0x2a, 0x27, 0x14]);
interface IWICBitmapCodecInfo : IWICComponentInfo
{
    HRESULT GetContainerFormat(GUID*);
    HRESULT GetPixelFormats(uint, GUID*, uint*);
    HRESULT GetColorManagementVersion(uint, PWSTR, uint*);
    HRESULT GetDeviceManufacturer(uint, PWSTR, uint*);
    HRESULT GetDeviceModels(uint, PWSTR, uint*);
    HRESULT GetMimeTypes(uint, PWSTR, uint*);
    HRESULT GetFileExtensions(uint, PWSTR, uint*);
    HRESULT DoesSupportAnimation(BOOL*);
    HRESULT DoesSupportChromakey(BOOL*);
    HRESULT DoesSupportLossless(BOOL*);
    HRESULT DoesSupportMultiframe(BOOL*);
    HRESULT MatchesMimeType(const(wchar)*, BOOL*);
}
enum IID_IWICBitmapEncoderInfo = GUID(0x94c9b4ee, 0xa09f, 0x4f92, [0x8a, 0x1e, 0x4a, 0x9b, 0xce, 0x7e, 0x76, 0xfb]);
interface IWICBitmapEncoderInfo : IWICBitmapCodecInfo
{
    HRESULT CreateInstance(IWICBitmapEncoder*);
}
enum IID_IWICBitmapDecoderInfo = GUID(0xd8cd007f, 0xd08f, 0x4191, [0x9b, 0xfc, 0x23, 0x6e, 0xa7, 0xf0, 0xe4, 0xb5]);
interface IWICBitmapDecoderInfo : IWICBitmapCodecInfo
{
    HRESULT GetPatterns(uint, WICBitmapPattern*, uint*, uint*);
    HRESULT MatchesPattern(IStream, BOOL*);
    HRESULT CreateInstance(IWICBitmapDecoder*);
}
enum IID_IWICPixelFormatInfo = GUID(0xe8eda601, 0x3d48, 0x431a, [0xab, 0x44, 0x69, 0x5, 0x9b, 0xe8, 0x8b, 0xbe]);
interface IWICPixelFormatInfo : IWICComponentInfo
{
    HRESULT GetFormatGUID(GUID*);
    HRESULT GetColorContext(IWICColorContext*);
    HRESULT GetBitsPerPixel(uint*);
    HRESULT GetChannelCount(uint*);
    HRESULT GetChannelMask(uint, uint, ubyte*, uint*);
}
enum IID_IWICPixelFormatInfo2 = GUID(0xa9db33a2, 0xaf5f, 0x43c7, [0xb6, 0x79, 0x74, 0xf5, 0x98, 0x4b, 0x5a, 0xa4]);
interface IWICPixelFormatInfo2 : IWICPixelFormatInfo
{
    HRESULT SupportsTransparency(BOOL*);
    HRESULT GetNumericRepresentation(WICPixelFormatNumericRepresentation*);
}
enum IID_IWICImagingFactory = GUID(0xec5ec8a9, 0xc395, 0x4314, [0x9c, 0x77, 0x54, 0xd7, 0xa9, 0x35, 0xff, 0x70]);
interface IWICImagingFactory : IUnknown
{
    HRESULT CreateDecoderFromFilename(const(wchar)*, const(GUID)*, GENERIC_ACCESS_RIGHTS, WICDecodeOptions, IWICBitmapDecoder*);
    HRESULT CreateDecoderFromStream(IStream, const(GUID)*, WICDecodeOptions, IWICBitmapDecoder*);
    HRESULT CreateDecoderFromFileHandle(ulong, const(GUID)*, WICDecodeOptions, IWICBitmapDecoder*);
    HRESULT CreateComponentInfo(const(GUID)*, IWICComponentInfo*);
    HRESULT CreateDecoder(const(GUID)*, const(GUID)*, IWICBitmapDecoder*);
    HRESULT CreateEncoder(const(GUID)*, const(GUID)*, IWICBitmapEncoder*);
    HRESULT CreatePalette(IWICPalette*);
    HRESULT CreateFormatConverter(IWICFormatConverter*);
    HRESULT CreateBitmapScaler(IWICBitmapScaler*);
    HRESULT CreateBitmapClipper(IWICBitmapClipper*);
    HRESULT CreateBitmapFlipRotator(IWICBitmapFlipRotator*);
    HRESULT CreateStream(IWICStream*);
    HRESULT CreateColorContext(IWICColorContext*);
    HRESULT CreateColorTransformer(IWICColorTransform*);
    HRESULT CreateBitmap(uint, uint, GUID*, WICBitmapCreateCacheOption, IWICBitmap*);
    HRESULT CreateBitmapFromSource(IWICBitmapSource, WICBitmapCreateCacheOption, IWICBitmap*);
    HRESULT CreateBitmapFromSourceRect(IWICBitmapSource, uint, uint, uint, uint, IWICBitmap*);
    HRESULT CreateBitmapFromMemory(uint, uint, GUID*, uint, uint, ubyte*, IWICBitmap*);
    HRESULT CreateBitmapFromHBITMAP(HBITMAP, HPALETTE, WICBitmapAlphaChannelOption, IWICBitmap*);
    HRESULT CreateBitmapFromHICON(HICON, IWICBitmap*);
    HRESULT CreateComponentEnumerator(uint, uint, IEnumUnknown*);
    HRESULT CreateFastMetadataEncoderFromDecoder(IWICBitmapDecoder, IWICFastMetadataEncoder*);
    HRESULT CreateFastMetadataEncoderFromFrameDecode(IWICBitmapFrameDecode, IWICFastMetadataEncoder*);
    HRESULT CreateQueryWriter(const(GUID)*, const(GUID)*, IWICMetadataQueryWriter*);
    HRESULT CreateQueryWriterFromReader(IWICMetadataQueryReader, const(GUID)*, IWICMetadataQueryWriter*);
}
alias WICTiffCompressionOption = int;
enum : int
{
    WICTiffCompressionDontCare         = 0x00000000,
    WICTiffCompressionNone             = 0x00000001,
    WICTiffCompressionCCITT3           = 0x00000002,
    WICTiffCompressionCCITT4           = 0x00000003,
    WICTiffCompressionLZW              = 0x00000004,
    WICTiffCompressionRLE              = 0x00000005,
    WICTiffCompressionZIP              = 0x00000006,
    WICTiffCompressionLZWHDifferencing = 0x00000007,
}

alias WICJpegYCrCbSubsamplingOption = int;
enum : int
{
    WICJpegYCrCbSubsamplingDefault = 0x00000000,
    WICJpegYCrCbSubsampling420     = 0x00000001,
    WICJpegYCrCbSubsampling422     = 0x00000002,
    WICJpegYCrCbSubsampling444     = 0x00000003,
    WICJpegYCrCbSubsampling440     = 0x00000004,
}

alias WICPngFilterOption = int;
enum : int
{
    WICPngFilterUnspecified = 0x00000000,
    WICPngFilterNone        = 0x00000001,
    WICPngFilterSub         = 0x00000002,
    WICPngFilterUp          = 0x00000003,
    WICPngFilterAverage     = 0x00000004,
    WICPngFilterPaeth       = 0x00000005,
    WICPngFilterAdaptive    = 0x00000006,
}

alias WICNamedWhitePoint = int;
enum : int
{
    WICWhitePointDefault          = 0x00000001,
    WICWhitePointDaylight         = 0x00000002,
    WICWhitePointCloudy           = 0x00000004,
    WICWhitePointShade            = 0x00000008,
    WICWhitePointTungsten         = 0x00000010,
    WICWhitePointFluorescent      = 0x00000020,
    WICWhitePointFlash            = 0x00000040,
    WICWhitePointUnderwater       = 0x00000080,
    WICWhitePointCustom           = 0x00000100,
    WICWhitePointAutoWhiteBalance = 0x00000200,
    WICWhitePointAsShot           = 0x00000001,
}

alias WICRawCapabilities = int;
enum : int
{
    WICRawCapabilityNotSupported   = 0x00000000,
    WICRawCapabilityGetSupported   = 0x00000001,
    WICRawCapabilityFullySupported = 0x00000002,
}

alias WICRawRotationCapabilities = int;
enum : int
{
    WICRawRotationCapabilityNotSupported           = 0x00000000,
    WICRawRotationCapabilityGetSupported           = 0x00000001,
    WICRawRotationCapabilityNinetyDegreesSupported = 0x00000002,
    WICRawRotationCapabilityFullySupported         = 0x00000003,
}

struct WICRawCapabilitiesInfo
{
    uint cbSize;
    uint CodecMajorVersion;
    uint CodecMinorVersion;
    WICRawCapabilities ExposureCompensationSupport;
    WICRawCapabilities ContrastSupport;
    WICRawCapabilities RGBWhitePointSupport;
    WICRawCapabilities NamedWhitePointSupport;
    uint NamedWhitePointSupportMask;
    WICRawCapabilities KelvinWhitePointSupport;
    WICRawCapabilities GammaSupport;
    WICRawCapabilities TintSupport;
    WICRawCapabilities SaturationSupport;
    WICRawCapabilities SharpnessSupport;
    WICRawCapabilities NoiseReductionSupport;
    WICRawCapabilities DestinationColorProfileSupport;
    WICRawCapabilities ToneCurveSupport;
    WICRawRotationCapabilities RotationSupport;
    WICRawCapabilities RenderModeSupport;
}
alias WICRawParameterSet = int;
enum : int
{
    WICAsShotParameterSet       = 0x00000001,
    WICUserAdjustedParameterSet = 0x00000002,
    WICAutoAdjustedParameterSet = 0x00000003,
}

alias WICRawRenderMode = int;
enum : int
{
    WICRawRenderModeDraft       = 0x00000001,
    WICRawRenderModeNormal      = 0x00000002,
    WICRawRenderModeBestQuality = 0x00000003,
}

struct WICRawToneCurvePoint
{
    double Input;
    double Output;
}
struct WICRawToneCurve
{
    uint cPoints;
    WICRawToneCurvePoint[1] aPoints;
}
enum IID_IWICDevelopRawNotificationCallback = GUID(0x95c75a6e, 0x3e8c, 0x4ec2, [0x85, 0xa8, 0xae, 0xbc, 0xc5, 0x51, 0xe5, 0x9b]);
interface IWICDevelopRawNotificationCallback : IUnknown
{
    HRESULT Notify(uint);
}
enum IID_IWICDevelopRaw = GUID(0xfbec5e44, 0xf7be, 0x4b65, [0xb7, 0xf8, 0xc0, 0xc8, 0x1f, 0xef, 0x2, 0x6d]);
interface IWICDevelopRaw : IWICBitmapFrameDecode
{
    HRESULT QueryRawCapabilitiesInfo(WICRawCapabilitiesInfo*);
    HRESULT LoadParameterSet(WICRawParameterSet);
    HRESULT GetCurrentParameterSet(IPropertyBag2*);
    HRESULT SetExposureCompensation(double);
    HRESULT GetExposureCompensation(double*);
    HRESULT SetWhitePointRGB(uint, uint, uint);
    HRESULT GetWhitePointRGB(uint*, uint*, uint*);
    HRESULT SetNamedWhitePoint(WICNamedWhitePoint);
    HRESULT GetNamedWhitePoint(WICNamedWhitePoint*);
    HRESULT SetWhitePointKelvin(uint);
    HRESULT GetWhitePointKelvin(uint*);
    HRESULT GetKelvinRangeInfo(uint*, uint*, uint*);
    HRESULT SetContrast(double);
    HRESULT GetContrast(double*);
    HRESULT SetGamma(double);
    HRESULT GetGamma(double*);
    HRESULT SetSharpness(double);
    HRESULT GetSharpness(double*);
    HRESULT SetSaturation(double);
    HRESULT GetSaturation(double*);
    HRESULT SetTint(double);
    HRESULT GetTint(double*);
    HRESULT SetNoiseReduction(double);
    HRESULT GetNoiseReduction(double*);
    HRESULT SetDestinationColorContext(IWICColorContext);
    HRESULT SetToneCurve(uint, const(WICRawToneCurve)*);
    HRESULT GetToneCurve(uint, WICRawToneCurve*, uint*);
    HRESULT SetRotation(double);
    HRESULT GetRotation(double*);
    HRESULT SetRenderMode(WICRawRenderMode);
    HRESULT GetRenderMode(WICRawRenderMode*);
    HRESULT SetNotificationCallback(IWICDevelopRawNotificationCallback);
}
alias WICDdsDimension = int;
enum : int
{
    WICDdsTexture1D   = 0x00000000,
    WICDdsTexture2D   = 0x00000001,
    WICDdsTexture3D   = 0x00000002,
    WICDdsTextureCube = 0x00000003,
}

alias WICDdsAlphaMode = int;
enum : int
{
    WICDdsAlphaModeUnknown       = 0x00000000,
    WICDdsAlphaModeStraight      = 0x00000001,
    WICDdsAlphaModePremultiplied = 0x00000002,
    WICDdsAlphaModeOpaque        = 0x00000003,
    WICDdsAlphaModeCustom        = 0x00000004,
}

struct WICDdsParameters
{
    uint Width;
    uint Height;
    uint Depth;
    uint MipLevels;
    uint ArraySize;
    DXGI_FORMAT DxgiFormat;
    WICDdsDimension Dimension;
    WICDdsAlphaMode AlphaMode;
}
enum IID_IWICDdsDecoder = GUID(0x409cd537, 0x8532, 0x40cb, [0x97, 0x74, 0xe2, 0xfe, 0xb2, 0xdf, 0x4e, 0x9c]);
interface IWICDdsDecoder : IUnknown
{
    HRESULT GetParameters(WICDdsParameters*);
    HRESULT GetFrame(uint, uint, uint, IWICBitmapFrameDecode*);
}
enum IID_IWICDdsEncoder = GUID(0x5cacdb4c, 0x407e, 0x41b3, [0xb9, 0x36, 0xd0, 0xf0, 0x10, 0xcd, 0x67, 0x32]);
interface IWICDdsEncoder : IUnknown
{
    HRESULT SetParameters(WICDdsParameters*);
    HRESULT GetParameters(WICDdsParameters*);
    HRESULT CreateNewFrame(IWICBitmapFrameEncode*, uint*, uint*, uint*);
}
struct WICDdsFormatInfo
{
    DXGI_FORMAT DxgiFormat;
    uint BytesPerBlock;
    uint BlockWidth;
    uint BlockHeight;
}
enum IID_IWICDdsFrameDecode = GUID(0x3d4c0c61, 0x18a4, 0x41e4, [0xbd, 0x80, 0x48, 0x1a, 0x4f, 0xc9, 0xf4, 0x64]);
interface IWICDdsFrameDecode : IUnknown
{
    HRESULT GetSizeInBlocks(uint*, uint*);
    HRESULT GetFormatInfo(WICDdsFormatInfo*);
    HRESULT CopyBlocks(const(WICRect)*, uint, uint, ubyte*);
}
enum IID_IWICJpegFrameDecode = GUID(0x8939f66e, 0xc46a, 0x4c21, [0xa9, 0xd1, 0x98, 0xb3, 0x27, 0xce, 0x16, 0x79]);
interface IWICJpegFrameDecode : IUnknown
{
    HRESULT DoesSupportIndexing(BOOL*);
    HRESULT SetIndexing(WICJpegIndexingOptions, uint);
    HRESULT ClearIndexing();
    HRESULT GetAcHuffmanTable(uint, uint, DXGI_JPEG_AC_HUFFMAN_TABLE*);
    HRESULT GetDcHuffmanTable(uint, uint, DXGI_JPEG_DC_HUFFMAN_TABLE*);
    HRESULT GetQuantizationTable(uint, uint, DXGI_JPEG_QUANTIZATION_TABLE*);
    HRESULT GetFrameHeader(WICJpegFrameHeader*);
    HRESULT GetScanHeader(uint, WICJpegScanHeader*);
    HRESULT CopyScan(uint, uint, uint, ubyte*, uint*);
    HRESULT CopyMinimalStream(uint, uint, ubyte*, uint*);
}
enum IID_IWICJpegFrameEncode = GUID(0x2f0c601f, 0xd2c6, 0x468c, [0xab, 0xfa, 0x49, 0x49, 0x5d, 0x98, 0x3e, 0xd1]);
interface IWICJpegFrameEncode : IUnknown
{
    HRESULT GetAcHuffmanTable(uint, uint, DXGI_JPEG_AC_HUFFMAN_TABLE*);
    HRESULT GetDcHuffmanTable(uint, uint, DXGI_JPEG_DC_HUFFMAN_TABLE*);
    HRESULT GetQuantizationTable(uint, uint, DXGI_JPEG_QUANTIZATION_TABLE*);
    HRESULT WriteScan(uint, const(ubyte)*);
}
alias WICMetadataCreationOptions = int;
enum : int
{
    WICMetadataCreationDefault      = 0x00000000,
    WICMetadataCreationAllowUnknown = 0x00000000,
    WICMetadataCreationFailUnknown  = 0x00010000,
    WICMetadataCreationMask         = 0xffff0000,
}

alias WICPersistOptions = int;
enum : int
{
    WICPersistOptionDefault       = 0x00000000,
    WICPersistOptionLittleEndian  = 0x00000000,
    WICPersistOptionBigEndian     = 0x00000001,
    WICPersistOptionStrictFormat  = 0x00000002,
    WICPersistOptionNoCacheStream = 0x00000004,
    WICPersistOptionPreferUTF8    = 0x00000008,
    WICPersistOptionMask          = 0x0000ffff,
}

enum IID_IWICMetadataBlockReader = GUID(0xfeaa2a8d, 0xb3f3, 0x43e4, [0xb2, 0x5c, 0xd1, 0xde, 0x99, 0xa, 0x1a, 0xe1]);
interface IWICMetadataBlockReader : IUnknown
{
    HRESULT GetContainerFormat(GUID*);
    HRESULT GetCount(uint*);
    HRESULT GetReaderByIndex(uint, IWICMetadataReader*);
    HRESULT GetEnumerator(IEnumUnknown*);
}
enum IID_IWICMetadataBlockWriter = GUID(0x8fb9676, 0xb444, 0x41e8, [0x8d, 0xbe, 0x6a, 0x53, 0xa5, 0x42, 0xbf, 0xf1]);
interface IWICMetadataBlockWriter : IWICMetadataBlockReader
{
    HRESULT InitializeFromBlockReader(IWICMetadataBlockReader);
    HRESULT GetWriterByIndex(uint, IWICMetadataWriter*);
    HRESULT AddWriter(IWICMetadataWriter);
    HRESULT SetWriterByIndex(uint, IWICMetadataWriter);
    HRESULT RemoveWriterByIndex(uint);
}
enum IID_IWICMetadataReader = GUID(0x9204fe99, 0xd8fc, 0x4fd5, [0xa0, 0x1, 0x95, 0x36, 0xb0, 0x67, 0xa8, 0x99]);
interface IWICMetadataReader : IUnknown
{
    HRESULT GetMetadataFormat(GUID*);
    HRESULT GetMetadataHandlerInfo(IWICMetadataHandlerInfo*);
    HRESULT GetCount(uint*);
    HRESULT GetValueByIndex(uint, PROPVARIANT*, PROPVARIANT*, PROPVARIANT*);
    HRESULT GetValue(const(PROPVARIANT)*, const(PROPVARIANT)*, PROPVARIANT*);
    HRESULT GetEnumerator(IWICEnumMetadataItem*);
}
enum IID_IWICMetadataWriter = GUID(0xf7836e16, 0x3be0, 0x470b, [0x86, 0xbb, 0x16, 0xd, 0xa, 0xec, 0xd7, 0xde]);
interface IWICMetadataWriter : IWICMetadataReader
{
    HRESULT SetValue(const(PROPVARIANT)*, const(PROPVARIANT)*, const(PROPVARIANT)*);
    HRESULT SetValueByIndex(uint, const(PROPVARIANT)*, const(PROPVARIANT)*, const(PROPVARIANT)*);
    HRESULT RemoveValue(const(PROPVARIANT)*, const(PROPVARIANT)*);
    HRESULT RemoveValueByIndex(uint);
}
enum IID_IWICStreamProvider = GUID(0x449494bc, 0xb468, 0x4927, [0x96, 0xd7, 0xba, 0x90, 0xd3, 0x1a, 0xb5, 0x5]);
interface IWICStreamProvider : IUnknown
{
    HRESULT GetStream(IStream*);
    HRESULT GetPersistOptions(uint*);
    HRESULT GetPreferredVendorGUID(GUID*);
    HRESULT RefreshStream();
}
enum IID_IWICPersistStream = GUID(0x675040, 0x6908, 0x45f8, [0x86, 0xa3, 0x49, 0xc7, 0xdf, 0xd6, 0xd9, 0xad]);
interface IWICPersistStream : IPersistStream
{
    HRESULT LoadEx(IStream, const(GUID)*, uint);
    HRESULT SaveEx(IStream, uint, BOOL);
}
enum IID_IWICMetadataHandlerInfo = GUID(0xaba958bf, 0xc672, 0x44d1, [0x8d, 0x61, 0xce, 0x6d, 0xf2, 0xe6, 0x82, 0xc2]);
interface IWICMetadataHandlerInfo : IWICComponentInfo
{
    HRESULT GetMetadataFormat(GUID*);
    HRESULT GetContainerFormats(uint, GUID*, uint*);
    HRESULT GetDeviceManufacturer(uint, PWSTR, uint*);
    HRESULT GetDeviceModels(uint, PWSTR, uint*);
    HRESULT DoesRequireFullStream(BOOL*);
    HRESULT DoesSupportPadding(BOOL*);
    HRESULT DoesRequireFixedSize(BOOL*);
}
struct WICMetadataPattern
{
    ulong Position;
    uint Length;
    ubyte* Pattern;
    ubyte* Mask;
    ulong DataOffset;
}
enum IID_IWICMetadataReaderInfo = GUID(0xeebf1f5b, 0x7c1, 0x4447, [0xa3, 0xab, 0x22, 0xac, 0xaf, 0x78, 0xa8, 0x4]);
interface IWICMetadataReaderInfo : IWICMetadataHandlerInfo
{
    HRESULT GetPatterns(const(GUID)*, uint, WICMetadataPattern*, uint*, uint*);
    HRESULT MatchesPattern(const(GUID)*, IStream, BOOL*);
    HRESULT CreateInstance(IWICMetadataReader*);
}
struct WICMetadataHeader
{
    ulong Position;
    uint Length;
    ubyte* Header;
    ulong DataOffset;
}
enum IID_IWICMetadataWriterInfo = GUID(0xb22e3fba, 0x3925, 0x4323, [0xb5, 0xc1, 0x9e, 0xbf, 0xc4, 0x30, 0xf2, 0x36]);
interface IWICMetadataWriterInfo : IWICMetadataHandlerInfo
{
    HRESULT GetHeader(const(GUID)*, uint, WICMetadataHeader*, uint*);
    HRESULT CreateInstance(IWICMetadataWriter*);
}
enum IID_IWICComponentFactory = GUID(0x412d0c3a, 0x9650, 0x44fa, [0xaf, 0x5b, 0xdd, 0x2a, 0x6, 0xc8, 0xe8, 0xfb]);
interface IWICComponentFactory : IWICImagingFactory
{
    HRESULT CreateMetadataReader(const(GUID)*, const(GUID)*, uint, IStream, IWICMetadataReader*);
    HRESULT CreateMetadataReaderFromContainer(const(GUID)*, const(GUID)*, uint, IStream, IWICMetadataReader*);
    HRESULT CreateMetadataWriter(const(GUID)*, const(GUID)*, uint, IWICMetadataWriter*);
    HRESULT CreateMetadataWriterFromReader(IWICMetadataReader, const(GUID)*, IWICMetadataWriter*);
    HRESULT CreateQueryReaderFromBlockReader(IWICMetadataBlockReader, IWICMetadataQueryReader*);
    HRESULT CreateQueryWriterFromBlockWriter(IWICMetadataBlockWriter, IWICMetadataQueryWriter*);
    HRESULT CreateEncoderPropertyBag(PROPBAG2*, uint, IPropertyBag2*);
}
