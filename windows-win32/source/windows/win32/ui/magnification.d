module windows.win32.ui.magnification;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HWND, RECT;
import windows.win32.graphics.gdi : HRGN;

version (Windows):
extern (Windows):

alias MW_FILTERMODE = uint;
enum : uint
{
    MW_FILTERMODE_EXCLUDE = 0x00000000,
    MW_FILTERMODE_INCLUDE = 0x00000001,
}

BOOL MagInitialize();
BOOL MagUninitialize();
BOOL MagSetWindowSource(HWND hwnd, RECT rect);
BOOL MagGetWindowSource(HWND hwnd, RECT* pRect);
BOOL MagSetWindowTransform(HWND hwnd, MAGTRANSFORM* pTransform);
BOOL MagGetWindowTransform(HWND hwnd, MAGTRANSFORM* pTransform);
BOOL MagSetWindowFilterList(HWND hwnd, MW_FILTERMODE dwFilterMode, int count, HWND* pHWND);
int MagGetWindowFilterList(HWND hwnd, MW_FILTERMODE* pdwFilterMode, int count, HWND* pHWND);
BOOL MagSetImageScalingCallback(HWND hwnd, MagImageScalingCallback callback);
MagImageScalingCallback MagGetImageScalingCallback(HWND hwnd);
BOOL MagSetColorEffect(HWND hwnd, MAGCOLOREFFECT* pEffect);
BOOL MagGetColorEffect(HWND hwnd, MAGCOLOREFFECT* pEffect);
BOOL MagSetFullscreenTransform(float magLevel, int xOffset, int yOffset);
BOOL MagGetFullscreenTransform(float* pMagLevel, int* pxOffset, int* pyOffset);
BOOL MagSetFullscreenColorEffect(MAGCOLOREFFECT* pEffect);
BOOL MagGetFullscreenColorEffect(MAGCOLOREFFECT* pEffect);
BOOL MagSetInputTransform(BOOL fEnabled, const(RECT)* pRectSource, const(RECT)* pRectDest);
BOOL MagGetInputTransform(BOOL* pfEnabled, RECT* pRectSource, RECT* pRectDest);
BOOL MagShowSystemCursor(BOOL fShowCursor);
enum WC_MAGNIFIERA = "Magnifier";
enum WC_MAGNIFIERW = "Magnifier";
enum WC_MAGNIFIER = "Magnifier";
enum MS_SHOWMAGNIFIEDCURSOR = 0x00000001;
enum MS_CLIPAROUNDCURSOR = 0x00000002;
enum MS_INVERTCOLORS = 0x00000004;
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
alias MagImageScalingCallback = BOOL function(HWND hwnd, void* srcdata, MAGIMAGEHEADER srcheader, void* destdata, MAGIMAGEHEADER destheader, RECT unclipped, RECT clipped, HRGN dirty);
