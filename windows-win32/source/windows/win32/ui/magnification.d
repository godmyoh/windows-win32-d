module windows.win32.ui.magnification;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HWND, RECT;
import windows.win32.graphics.gdi : HRGN;

version (Windows):
extern (Windows):

BOOL MagInitialize();
BOOL MagUninitialize();
BOOL MagSetWindowSource(HWND, RECT);
BOOL MagGetWindowSource(HWND, RECT*);
BOOL MagSetWindowTransform(HWND, MAGTRANSFORM*);
BOOL MagGetWindowTransform(HWND, MAGTRANSFORM*);
BOOL MagSetWindowFilterList(HWND, uint, int, HWND*);
int MagGetWindowFilterList(HWND, uint*, int, HWND*);
BOOL MagSetImageScalingCallback(HWND, MagImageScalingCallback);
MagImageScalingCallback MagGetImageScalingCallback(HWND);
BOOL MagSetColorEffect(HWND, MAGCOLOREFFECT*);
BOOL MagGetColorEffect(HWND, MAGCOLOREFFECT*);
BOOL MagSetFullscreenTransform(float, int, int);
BOOL MagGetFullscreenTransform(float*, int*, int*);
BOOL MagSetFullscreenColorEffect(MAGCOLOREFFECT*);
BOOL MagGetFullscreenColorEffect(MAGCOLOREFFECT*);
BOOL MagSetInputTransform(BOOL, const(RECT)*, const(RECT)*);
BOOL MagGetInputTransform(BOOL*, RECT*, RECT*);
BOOL MagShowSystemCursor(BOOL);
enum WC_MAGNIFIERA = "Magnifier";
enum WC_MAGNIFIERW = "Magnifier";
enum WC_MAGNIFIER = "Magnifier";
enum MS_SHOWMAGNIFIEDCURSOR = 0x00000001;
enum MS_CLIPAROUNDCURSOR = 0x00000002;
enum MS_INVERTCOLORS = 0x00000004;
enum MW_FILTERMODE_EXCLUDE = 0x00000000;
enum MW_FILTERMODE_INCLUDE = 0x00000001;
struct MAGTRANSFORM
{
    float[9] v;
}
struct MAGIMAGEHEADER
{
    uint width;
    uint height;
    GUID format;
    uint stride;
    uint offset;
    ulong cbSize;
}
struct MAGCOLOREFFECT
{
    float[25] transform;
}
alias MagImageScalingCallback = BOOL function(HWND, void*, MAGIMAGEHEADER, void*, MAGIMAGEHEADER, RECT, RECT, HRGN);
