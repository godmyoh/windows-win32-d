module windows.win32.graphics.gdi;

import windows.win32.foundation : BOOL, CHAR, COLORREF, HANDLE, HGLOBAL, HINSTANCE, HMODULE, HWND, LPARAM, POINT, POINTL, POINTS, PSTR, PWSTR, RECT, RECTL, SIZE, WPARAM;

version (Windows):
extern (Windows):

alias R2_MODE = int;
enum : int
{
    R2_BLACK       = 0x00000001,
    R2_NOTMERGEPEN = 0x00000002,
    R2_MASKNOTPEN  = 0x00000003,
    R2_NOTCOPYPEN  = 0x00000004,
    R2_MASKPENNOT  = 0x00000005,
    R2_NOT         = 0x00000006,
    R2_XORPEN      = 0x00000007,
    R2_NOTMASKPEN  = 0x00000008,
    R2_MASKPEN     = 0x00000009,
    R2_NOTXORPEN   = 0x0000000a,
    R2_NOP         = 0x0000000b,
    R2_MERGENOTPEN = 0x0000000c,
    R2_COPYPEN     = 0x0000000d,
    R2_MERGEPENNOT = 0x0000000e,
    R2_MERGEPEN    = 0x0000000f,
    R2_WHITE       = 0x00000010,
    R2_LAST        = 0x00000010,
}

alias RGN_COMBINE_MODE = int;
enum : int
{
    RGN_AND  = 0x00000001,
    RGN_OR   = 0x00000002,
    RGN_XOR  = 0x00000003,
    RGN_DIFF = 0x00000004,
    RGN_COPY = 0x00000005,
    RGN_MIN  = 0x00000001,
    RGN_MAX  = 0x00000005,
}

alias ETO_OPTIONS = uint;
enum : uint
{
    ETO_OPAQUE            = 0x00000002,
    ETO_CLIPPED           = 0x00000004,
    ETO_GLYPH_INDEX       = 0x00000010,
    ETO_RTLREADING        = 0x00000080,
    ETO_NUMERICSLOCAL     = 0x00000400,
    ETO_NUMERICSLATIN     = 0x00000800,
    ETO_IGNORELANGUAGE    = 0x00001000,
    ETO_PDY               = 0x00002000,
    ETO_REVERSE_INDEX_MAP = 0x00010000,
}

alias OBJ_TYPE = int;
enum : int
{
    OBJ_PEN         = 0x00000001,
    OBJ_BRUSH       = 0x00000002,
    OBJ_DC          = 0x00000003,
    OBJ_METADC      = 0x00000004,
    OBJ_PAL         = 0x00000005,
    OBJ_FONT        = 0x00000006,
    OBJ_BITMAP      = 0x00000007,
    OBJ_REGION      = 0x00000008,
    OBJ_METAFILE    = 0x00000009,
    OBJ_MEMDC       = 0x0000000a,
    OBJ_EXTPEN      = 0x0000000b,
    OBJ_ENHMETADC   = 0x0000000c,
    OBJ_ENHMETAFILE = 0x0000000d,
    OBJ_COLORSPACE  = 0x0000000e,
}

alias DIB_USAGE = uint;
enum : uint
{
    DIB_RGB_COLORS = 0x00000000,
    DIB_PAL_COLORS = 0x00000001,
}

struct MONITORINFOEXA
{
    MONITORINFO monitorInfo;
    CHAR[32] szDevice;
}
struct MONITORINFOEXW
{
    MONITORINFO monitorInfo;
    wchar[32] szDevice;
}
int GetObjectA(HGDIOBJ h, int c, void* pv);
int AddFontResourceA(const(char)* param0);
int AddFontResourceW(const(wchar)* param0);
BOOL AnimatePalette(HPALETTE hPal, uint iStartIndex, uint cEntries, const(PALETTEENTRY)* ppe);
BOOL Arc(HDC hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4);
BOOL BitBlt(HDC hdc, int x, int y, int cx, int cy, HDC hdcSrc, int x1, int y1, ROP_CODE rop);
BOOL CancelDC(HDC hdc);
BOOL Chord(HDC hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4);
HMETAFILE CloseMetaFile(HDC hdc);
GDI_REGION_TYPE CombineRgn(HRGN hrgnDst, HRGN hrgnSrc1, HRGN hrgnSrc2, RGN_COMBINE_MODE iMode);
HMETAFILE CopyMetaFileA(HMETAFILE param0, const(char)* param1);
HMETAFILE CopyMetaFileW(HMETAFILE param0, const(wchar)* param1);
HBITMAP CreateBitmap(int nWidth, int nHeight, uint nPlanes, uint nBitCount, const(void)* lpBits);
HBITMAP CreateBitmapIndirect(const(BITMAP)* pbm);
HBRUSH CreateBrushIndirect(const(LOGBRUSH)* plbrush);
HBITMAP CreateCompatibleBitmap(HDC hdc, int cx, int cy);
HBITMAP CreateDiscardableBitmap(HDC hdc, int cx, int cy);
HDC CreateCompatibleDC(HDC hdc);
HDC CreateDCA(const(char)* pwszDriver, const(char)* pwszDevice, const(char)* pszPort, const(DEVMODEA)* pdm);
HDC CreateDCW(const(wchar)* pwszDriver, const(wchar)* pwszDevice, const(wchar)* pszPort, const(DEVMODEW)* pdm);
HBITMAP CreateDIBitmap(HDC hdc, const(BITMAPINFOHEADER)* pbmih, uint flInit, const(void)* pjBits, const(BITMAPINFO)* pbmi, DIB_USAGE iUsage);
HBRUSH CreateDIBPatternBrush(HGLOBAL h, DIB_USAGE iUsage);
HBRUSH CreateDIBPatternBrushPt(const(void)* lpPackedDIB, DIB_USAGE iUsage);
HRGN CreateEllipticRgn(int x1, int y1, int x2, int y2);
HRGN CreateEllipticRgnIndirect(const(RECT)* lprect);
HFONT CreateFontIndirectA(const(LOGFONTA)* lplf);
HFONT CreateFontIndirectW(const(LOGFONTW)* lplf);
HFONT CreateFontA(int cHeight, int cWidth, int cEscapement, int cOrientation, int cWeight, uint bItalic, uint bUnderline, uint bStrikeOut, uint iCharSet, uint iOutPrecision, uint iClipPrecision, uint iQuality, uint iPitchAndFamily, const(char)* pszFaceName);
HFONT CreateFontW(int cHeight, int cWidth, int cEscapement, int cOrientation, int cWeight, uint bItalic, uint bUnderline, uint bStrikeOut, uint iCharSet, uint iOutPrecision, uint iClipPrecision, uint iQuality, uint iPitchAndFamily, const(wchar)* pszFaceName);
HBRUSH CreateHatchBrush(HATCH_BRUSH_STYLE iHatch, COLORREF color);
HDC CreateICA(const(char)* pszDriver, const(char)* pszDevice, const(char)* pszPort, const(DEVMODEA)* pdm);
HDC CreateICW(const(wchar)* pszDriver, const(wchar)* pszDevice, const(wchar)* pszPort, const(DEVMODEW)* pdm);
HDC CreateMetaFileA(const(char)* pszFile);
HDC CreateMetaFileW(const(wchar)* pszFile);
HPALETTE CreatePalette(const(LOGPALETTE)* plpal);
HPEN CreatePen(PEN_STYLE iStyle, int cWidth, COLORREF color);
HPEN CreatePenIndirect(const(LOGPEN)* plpen);
HRGN CreatePolyPolygonRgn(const(POINT)* pptl, const(int)* pc, int cPoly, CREATE_POLYGON_RGN_MODE iMode);
HBRUSH CreatePatternBrush(HBITMAP hbm);
HRGN CreateRectRgn(int x1, int y1, int x2, int y2);
HRGN CreateRectRgnIndirect(const(RECT)* lprect);
HRGN CreateRoundRectRgn(int x1, int y1, int x2, int y2, int w, int h);
BOOL CreateScalableFontResourceA(uint fdwHidden, const(char)* lpszFont, const(char)* lpszFile, const(char)* lpszPath);
BOOL CreateScalableFontResourceW(uint fdwHidden, const(wchar)* lpszFont, const(wchar)* lpszFile, const(wchar)* lpszPath);
HBRUSH CreateSolidBrush(COLORREF color);
BOOL DeleteDC(HDC hdc);
BOOL DeleteMetaFile(HMETAFILE hmf);
BOOL DeleteObject(HGDIOBJ ho);
int DrawEscape(HDC hdc, int iEscape, int cjIn, const(char)* lpIn);
BOOL Ellipse(HDC hdc, int left, int top, int right, int bottom);
int EnumFontFamiliesExA(HDC hdc, LOGFONTA* lpLogfont, FONTENUMPROCA lpProc, LPARAM lParam, uint dwFlags);
int EnumFontFamiliesExW(HDC hdc, LOGFONTW* lpLogfont, FONTENUMPROCW lpProc, LPARAM lParam, uint dwFlags);
int EnumFontFamiliesA(HDC hdc, const(char)* lpLogfont, FONTENUMPROCA lpProc, LPARAM lParam);
int EnumFontFamiliesW(HDC hdc, const(wchar)* lpLogfont, FONTENUMPROCW lpProc, LPARAM lParam);
int EnumFontsA(HDC hdc, const(char)* lpLogfont, FONTENUMPROCA lpProc, LPARAM lParam);
int EnumFontsW(HDC hdc, const(wchar)* lpLogfont, FONTENUMPROCW lpProc, LPARAM lParam);
int EnumObjects(HDC hdc, OBJ_TYPE nType, GOBJENUMPROC lpFunc, LPARAM lParam);
BOOL EqualRgn(HRGN hrgn1, HRGN hrgn2);
GDI_REGION_TYPE ExcludeClipRect(HDC hdc, int left, int top, int right, int bottom);
HRGN ExtCreateRegion(const(XFORM)* lpx, uint nCount, const(RGNDATA)* lpData);
BOOL ExtFloodFill(HDC hdc, int x, int y, COLORREF color, EXT_FLOOD_FILL_TYPE type);
BOOL FillRgn(HDC hdc, HRGN hrgn, HBRUSH hbr);
BOOL FloodFill(HDC hdc, int x, int y, COLORREF color);
BOOL FrameRgn(HDC hdc, HRGN hrgn, HBRUSH hbr, int w, int h);
R2_MODE GetROP2(HDC hdc);
BOOL GetAspectRatioFilterEx(HDC hdc, SIZE* lpsize);
COLORREF GetBkColor(HDC hdc);
COLORREF GetDCBrushColor(HDC hdc);
COLORREF GetDCPenColor(HDC hdc);
int GetBkMode(HDC hdc);
int GetBitmapBits(HBITMAP hbit, int cb, void* lpvBits);
BOOL GetBitmapDimensionEx(HBITMAP hbit, SIZE* lpsize);
uint GetBoundsRect(HDC hdc, RECT* lprect, uint flags);
BOOL GetBrushOrgEx(HDC hdc, POINT* lppt);
BOOL GetCharWidthA(HDC hdc, uint iFirst, uint iLast, int* lpBuffer);
BOOL GetCharWidthW(HDC hdc, uint iFirst, uint iLast, int* lpBuffer);
BOOL GetCharWidth32A(HDC hdc, uint iFirst, uint iLast, int* lpBuffer);
BOOL GetCharWidth32W(HDC hdc, uint iFirst, uint iLast, int* lpBuffer);
BOOL GetCharWidthFloatA(HDC hdc, uint iFirst, uint iLast, float* lpBuffer);
BOOL GetCharWidthFloatW(HDC hdc, uint iFirst, uint iLast, float* lpBuffer);
BOOL GetCharABCWidthsA(HDC hdc, uint wFirst, uint wLast, ABC* lpABC);
BOOL GetCharABCWidthsW(HDC hdc, uint wFirst, uint wLast, ABC* lpABC);
BOOL GetCharABCWidthsFloatA(HDC hdc, uint iFirst, uint iLast, ABCFLOAT* lpABC);
BOOL GetCharABCWidthsFloatW(HDC hdc, uint iFirst, uint iLast, ABCFLOAT* lpABC);
GDI_REGION_TYPE GetClipBox(HDC hdc, RECT* lprect);
int GetClipRgn(HDC hdc, HRGN hrgn);
int GetMetaRgn(HDC hdc, HRGN hrgn);
HGDIOBJ GetCurrentObject(HDC hdc, uint type);
BOOL GetCurrentPositionEx(HDC hdc, POINT* lppt);
int GetDeviceCaps(HDC hdc, int index);
int GetDIBits(HDC hdc, HBITMAP hbm, uint start, uint cLines, void* lpvBits, BITMAPINFO* lpbmi, DIB_USAGE usage);
uint GetFontData(HDC hdc, uint dwTable, uint dwOffset, void* pvBuffer, uint cjBuffer);
uint GetGlyphOutlineA(HDC hdc, uint uChar, GET_GLYPH_OUTLINE_FORMAT fuFormat, GLYPHMETRICS* lpgm, uint cjBuffer, void* pvBuffer, const(MAT2)* lpmat2);
uint GetGlyphOutlineW(HDC hdc, uint uChar, GET_GLYPH_OUTLINE_FORMAT fuFormat, GLYPHMETRICS* lpgm, uint cjBuffer, void* pvBuffer, const(MAT2)* lpmat2);
int GetGraphicsMode(HDC hdc);
HDC_MAP_MODE GetMapMode(HDC hdc);
uint GetMetaFileBitsEx(HMETAFILE hMF, uint cbBuffer, void* lpData);
HMETAFILE GetMetaFileA(const(char)* lpName);
HMETAFILE GetMetaFileW(const(wchar)* lpName);
COLORREF GetNearestColor(HDC hdc, COLORREF color);
uint GetNearestPaletteIndex(HPALETTE h, COLORREF color);
uint GetObjectType(HGDIOBJ h);
uint GetOutlineTextMetricsA(HDC hdc, uint cjCopy, OUTLINETEXTMETRICA* potm);
uint GetOutlineTextMetricsW(HDC hdc, uint cjCopy, OUTLINETEXTMETRICW* potm);
uint GetPaletteEntries(HPALETTE hpal, uint iStart, uint cEntries, PALETTEENTRY* pPalEntries);
COLORREF GetPixel(HDC hdc, int x, int y);
int GetPolyFillMode(HDC hdc);
BOOL GetRasterizerCaps(RASTERIZER_STATUS* lpraststat, uint cjBytes);
int GetRandomRgn(HDC hdc, HRGN hrgn, int i);
uint GetRegionData(HRGN hrgn, uint nCount, RGNDATA* lpRgnData);
GDI_REGION_TYPE GetRgnBox(HRGN hrgn, RECT* lprc);
HGDIOBJ GetStockObject(GET_STOCK_OBJECT_FLAGS i);
int GetStretchBltMode(HDC hdc);
uint GetSystemPaletteEntries(HDC hdc, uint iStart, uint cEntries, PALETTEENTRY* pPalEntries);
uint GetSystemPaletteUse(HDC hdc);
int GetTextCharacterExtra(HDC hdc);
TEXT_ALIGN_OPTIONS GetTextAlign(HDC hdc);
COLORREF GetTextColor(HDC hdc);
BOOL GetTextExtentPointA(HDC hdc, const(char)* lpString, int c, SIZE* lpsz);
BOOL GetTextExtentPointW(HDC hdc, const(wchar)* lpString, int c, SIZE* lpsz);
BOOL GetTextExtentPoint32A(HDC hdc, const(char)* lpString, int c, SIZE* psizl);
BOOL GetTextExtentPoint32W(HDC hdc, const(wchar)* lpString, int c, SIZE* psizl);
BOOL GetTextExtentExPointA(HDC hdc, const(char)* lpszString, int cchString, int nMaxExtent, int* lpnFit, int* lpnDx, SIZE* lpSize);
BOOL GetTextExtentExPointW(HDC hdc, const(wchar)* lpszString, int cchString, int nMaxExtent, int* lpnFit, int* lpnDx, SIZE* lpSize);
uint GetFontLanguageInfo(HDC hdc);
uint GetCharacterPlacementA(HDC hdc, const(char)* lpString, int nCount, int nMexExtent, GCP_RESULTSA* lpResults, GET_CHARACTER_PLACEMENT_FLAGS dwFlags);
uint GetCharacterPlacementW(HDC hdc, const(wchar)* lpString, int nCount, int nMexExtent, GCP_RESULTSW* lpResults, GET_CHARACTER_PLACEMENT_FLAGS dwFlags);
uint GetFontUnicodeRanges(HDC hdc, GLYPHSET* lpgs);
uint GetGlyphIndicesA(HDC hdc, const(char)* lpstr, int c, ushort* pgi, uint fl);
uint GetGlyphIndicesW(HDC hdc, const(wchar)* lpstr, int c, ushort* pgi, uint fl);
BOOL GetTextExtentPointI(HDC hdc, ushort* pgiIn, int cgi, SIZE* psize);
BOOL GetTextExtentExPointI(HDC hdc, ushort* lpwszString, int cwchString, int nMaxExtent, int* lpnFit, int* lpnDx, SIZE* lpSize);
BOOL GetCharWidthI(HDC hdc, uint giFirst, uint cgi, ushort* pgi, int* piWidths);
BOOL GetCharABCWidthsI(HDC hdc, uint giFirst, uint cgi, ushort* pgi, ABC* pabc);
int AddFontResourceExA(const(char)* name, FONT_RESOURCE_CHARACTERISTICS fl, void* res);
int AddFontResourceExW(const(wchar)* name, FONT_RESOURCE_CHARACTERISTICS fl, void* res);
BOOL RemoveFontResourceExA(const(char)* name, uint fl, void* pdv);
BOOL RemoveFontResourceExW(const(wchar)* name, uint fl, void* pdv);
HANDLE AddFontMemResourceEx(void* pFileView, uint cjSize, void* pvResrved, uint* pNumFonts);
BOOL RemoveFontMemResourceEx(HANDLE h);
HFONT CreateFontIndirectExA(const(ENUMLOGFONTEXDVA)* param0);
HFONT CreateFontIndirectExW(const(ENUMLOGFONTEXDVW)* param0);
BOOL GetViewportExtEx(HDC hdc, SIZE* lpsize);
BOOL GetViewportOrgEx(HDC hdc, POINT* lppoint);
BOOL GetWindowExtEx(HDC hdc, SIZE* lpsize);
BOOL GetWindowOrgEx(HDC hdc, POINT* lppoint);
GDI_REGION_TYPE IntersectClipRect(HDC hdc, int left, int top, int right, int bottom);
BOOL InvertRgn(HDC hdc, HRGN hrgn);
BOOL LineDDA(int xStart, int yStart, int xEnd, int yEnd, LINEDDAPROC lpProc, LPARAM data);
BOOL LineTo(HDC hdc, int x, int y);
BOOL MaskBlt(HDC hdcDest, int xDest, int yDest, int width, int height, HDC hdcSrc, int xSrc, int ySrc, HBITMAP hbmMask, int xMask, int yMask, uint rop);
BOOL PlgBlt(HDC hdcDest, const(POINT)* lpPoint, HDC hdcSrc, int xSrc, int ySrc, int width, int height, HBITMAP hbmMask, int xMask, int yMask);
GDI_REGION_TYPE OffsetClipRgn(HDC hdc, int x, int y);
GDI_REGION_TYPE OffsetRgn(HRGN hrgn, int x, int y);
BOOL PatBlt(HDC hdc, int x, int y, int w, int h, ROP_CODE rop);
BOOL Pie(HDC hdc, int left, int top, int right, int bottom, int xr1, int yr1, int xr2, int yr2);
BOOL PlayMetaFile(HDC hdc, HMETAFILE hmf);
BOOL PaintRgn(HDC hdc, HRGN hrgn);
BOOL PolyPolygon(HDC hdc, const(POINT)* apt, const(int)* asz, int csz);
BOOL PtInRegion(HRGN hrgn, int x, int y);
BOOL PtVisible(HDC hdc, int x, int y);
BOOL RectInRegion(HRGN hrgn, const(RECT)* lprect);
BOOL RectVisible(HDC hdc, const(RECT)* lprect);
BOOL Rectangle(HDC hdc, int left, int top, int right, int bottom);
BOOL RestoreDC(HDC hdc, int nSavedDC);
HDC ResetDCA(HDC hdc, const(DEVMODEA)* lpdm);
HDC ResetDCW(HDC hdc, const(DEVMODEW)* lpdm);
uint RealizePalette(HDC hdc);
BOOL RemoveFontResourceA(const(char)* lpFileName);
BOOL RemoveFontResourceW(const(wchar)* lpFileName);
BOOL RoundRect(HDC hdc, int left, int top, int right, int bottom, int width, int height);
BOOL ResizePalette(HPALETTE hpal, uint n);
int SaveDC(HDC hdc);
GDI_REGION_TYPE SelectClipRgn(HDC hdc, HRGN hrgn);
GDI_REGION_TYPE ExtSelectClipRgn(HDC hdc, HRGN hrgn, RGN_COMBINE_MODE mode);
GDI_REGION_TYPE SetMetaRgn(HDC hdc);
HGDIOBJ SelectObject(HDC hdc, HGDIOBJ h);
HPALETTE SelectPalette(HDC hdc, HPALETTE hPal, BOOL bForceBkgd);
COLORREF SetBkColor(HDC hdc, COLORREF color);
COLORREF SetDCBrushColor(HDC hdc, COLORREF color);
COLORREF SetDCPenColor(HDC hdc, COLORREF color);
int SetBkMode(HDC hdc, int mode);
int SetBitmapBits(HBITMAP hbm, uint cb, const(void)* pvBits);
uint SetBoundsRect(HDC hdc, const(RECT)* lprect, SET_BOUNDS_RECT_FLAGS flags);
int SetDIBits(HDC hdc, HBITMAP hbm, uint start, uint cLines, const(void)* lpBits, const(BITMAPINFO)* lpbmi, DIB_USAGE ColorUse);
int SetDIBitsToDevice(HDC hdc, int xDest, int yDest, uint w, uint h, int xSrc, int ySrc, uint StartScan, uint cLines, const(void)* lpvBits, const(BITMAPINFO)* lpbmi, DIB_USAGE ColorUse);
uint SetMapperFlags(HDC hdc, uint flags);
int SetGraphicsMode(HDC hdc, GRAPHICS_MODE iMode);
int SetMapMode(HDC hdc, HDC_MAP_MODE iMode);
uint SetLayout(HDC hdc, DC_LAYOUT l);
uint GetLayout(HDC hdc);
HMETAFILE SetMetaFileBitsEx(uint cbBuffer, const(ubyte)* lpData);
uint SetPaletteEntries(HPALETTE hpal, uint iStart, uint cEntries, const(PALETTEENTRY)* pPalEntries);
COLORREF SetPixel(HDC hdc, int x, int y, COLORREF color);
BOOL SetPixelV(HDC hdc, int x, int y, COLORREF color);
int SetPolyFillMode(HDC hdc, CREATE_POLYGON_RGN_MODE mode);
BOOL StretchBlt(HDC hdcDest, int xDest, int yDest, int wDest, int hDest, HDC hdcSrc, int xSrc, int ySrc, int wSrc, int hSrc, ROP_CODE rop);
BOOL SetRectRgn(HRGN hrgn, int left, int top, int right, int bottom);
int StretchDIBits(HDC hdc, int xDest, int yDest, int DestWidth, int DestHeight, int xSrc, int ySrc, int SrcWidth, int SrcHeight, const(void)* lpBits, const(BITMAPINFO)* lpbmi, DIB_USAGE iUsage, ROP_CODE rop);
int SetROP2(HDC hdc, R2_MODE rop2);
int SetStretchBltMode(HDC hdc, STRETCH_BLT_MODE mode);
uint SetSystemPaletteUse(HDC hdc, SYSTEM_PALETTE_USE use);
int SetTextCharacterExtra(HDC hdc, int extra);
COLORREF SetTextColor(HDC hdc, COLORREF color);
uint SetTextAlign(HDC hdc, TEXT_ALIGN_OPTIONS align_);
BOOL SetTextJustification(HDC hdc, int extra, int count);
BOOL UpdateColors(HDC hdc);
BOOL AlphaBlend(HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, BLENDFUNCTION ftn);
BOOL TransparentBlt(HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, uint crTransparent);
BOOL GradientFill(HDC hdc, TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nMesh, GRADIENT_FILL ulMode);
BOOL GdiAlphaBlend(HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, BLENDFUNCTION ftn);
BOOL GdiTransparentBlt(HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, uint crTransparent);
BOOL GdiGradientFill(HDC hdc, TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nCount, GRADIENT_FILL ulMode);
BOOL PlayMetaFileRecord(HDC hdc, HANDLETABLE* lpHandleTable, METARECORD* lpMR, uint noObjs);
BOOL EnumMetaFile(HDC hdc, HMETAFILE hmf, MFENUMPROC proc, LPARAM param3);
HENHMETAFILE CloseEnhMetaFile(HDC hdc);
HENHMETAFILE CopyEnhMetaFileA(HENHMETAFILE hEnh, const(char)* lpFileName);
HENHMETAFILE CopyEnhMetaFileW(HENHMETAFILE hEnh, const(wchar)* lpFileName);
HDC CreateEnhMetaFileA(HDC hdc, const(char)* lpFilename, const(RECT)* lprc, const(char)* lpDesc);
HDC CreateEnhMetaFileW(HDC hdc, const(wchar)* lpFilename, const(RECT)* lprc, const(wchar)* lpDesc);
BOOL DeleteEnhMetaFile(HENHMETAFILE hmf);
BOOL EnumEnhMetaFile(HDC hdc, HENHMETAFILE hmf, ENHMFENUMPROC proc, void* param3, const(RECT)* lpRect);
HENHMETAFILE GetEnhMetaFileA(const(char)* lpName);
HENHMETAFILE GetEnhMetaFileW(const(wchar)* lpName);
uint GetEnhMetaFileBits(HENHMETAFILE hEMF, uint nSize, ubyte* lpData);
uint GetEnhMetaFileDescriptionA(HENHMETAFILE hemf, uint cchBuffer, PSTR lpDescription);
uint GetEnhMetaFileDescriptionW(HENHMETAFILE hemf, uint cchBuffer, PWSTR lpDescription);
uint GetEnhMetaFileHeader(HENHMETAFILE hemf, uint nSize, ENHMETAHEADER* lpEnhMetaHeader);
uint GetEnhMetaFilePaletteEntries(HENHMETAFILE hemf, uint nNumEntries, PALETTEENTRY* lpPaletteEntries);
uint GetWinMetaFileBits(HENHMETAFILE hemf, uint cbData16, ubyte* pData16, int iMapMode, HDC hdcRef);
BOOL PlayEnhMetaFile(HDC hdc, HENHMETAFILE hmf, const(RECT)* lprect);
BOOL PlayEnhMetaFileRecord(HDC hdc, HANDLETABLE* pht, const(ENHMETARECORD)* pmr, uint cht);
HENHMETAFILE SetEnhMetaFileBits(uint nSize, const(ubyte)* pb);
BOOL GdiComment(HDC hdc, uint nSize, const(ubyte)* lpData);
BOOL GetTextMetricsA(HDC hdc, TEXTMETRICA* lptm);
BOOL GetTextMetricsW(HDC hdc, TEXTMETRICW* lptm);
BOOL AngleArc(HDC hdc, int x, int y, uint r, float StartAngle, float SweepAngle);
BOOL PolyPolyline(HDC hdc, const(POINT)* apt, const(uint)* asz, uint csz);
BOOL GetWorldTransform(HDC hdc, XFORM* lpxf);
BOOL SetWorldTransform(HDC hdc, const(XFORM)* lpxf);
BOOL ModifyWorldTransform(HDC hdc, const(XFORM)* lpxf, MODIFY_WORLD_TRANSFORM_MODE mode);
BOOL CombineTransform(XFORM* lpxfOut, const(XFORM)* lpxf1, const(XFORM)* lpxf2);
HBITMAP CreateDIBSection(HDC hdc, const(BITMAPINFO)* pbmi, DIB_USAGE usage, void** ppvBits, HANDLE hSection, uint offset);
uint GetDIBColorTable(HDC hdc, uint iStart, uint cEntries, RGBQUAD* prgbq);
uint SetDIBColorTable(HDC hdc, uint iStart, uint cEntries, const(RGBQUAD)* prgbq);
BOOL SetColorAdjustment(HDC hdc, const(COLORADJUSTMENT)* lpca);
BOOL GetColorAdjustment(HDC hdc, COLORADJUSTMENT* lpca);
HPALETTE CreateHalftonePalette(HDC hdc);
BOOL AbortPath(HDC hdc);
BOOL ArcTo(HDC hdc, int left, int top, int right, int bottom, int xr1, int yr1, int xr2, int yr2);
BOOL BeginPath(HDC hdc);
BOOL CloseFigure(HDC hdc);
BOOL EndPath(HDC hdc);
BOOL FillPath(HDC hdc);
BOOL FlattenPath(HDC hdc);
int GetPath(HDC hdc, POINT* apt, ubyte* aj, int cpt);
HRGN PathToRegion(HDC hdc);
BOOL PolyDraw(HDC hdc, const(POINT)* apt, const(ubyte)* aj, int cpt);
BOOL SelectClipPath(HDC hdc, RGN_COMBINE_MODE mode);
int SetArcDirection(HDC hdc, ARC_DIRECTION dir);
BOOL SetMiterLimit(HDC hdc, float limit, float* old);
BOOL StrokeAndFillPath(HDC hdc);
BOOL StrokePath(HDC hdc);
BOOL WidenPath(HDC hdc);
HPEN ExtCreatePen(uint iPenStyle, uint cWidth, const(LOGBRUSH)* plbrush, uint cStyle, const(uint)* pstyle);
BOOL GetMiterLimit(HDC hdc, float* plimit);
int GetArcDirection(HDC hdc);
int GetObjectW(HGDIOBJ h, int c, void* pv);
BOOL MoveToEx(HDC hdc, int x, int y, POINT* lppt);
BOOL TextOutA(HDC hdc, int x, int y, const(char)* lpString, int c);
BOOL TextOutW(HDC hdc, int x, int y, const(wchar)* lpString, int c);
BOOL ExtTextOutA(HDC hdc, int x, int y, ETO_OPTIONS options, const(RECT)* lprect, const(char)* lpString, uint c, const(int)* lpDx);
BOOL ExtTextOutW(HDC hdc, int x, int y, ETO_OPTIONS options, const(RECT)* lprect, const(wchar)* lpString, uint c, const(int)* lpDx);
BOOL PolyTextOutA(HDC hdc, const(POLYTEXTA)* ppt, int nstrings);
BOOL PolyTextOutW(HDC hdc, const(POLYTEXTW)* ppt, int nstrings);
HRGN CreatePolygonRgn(const(POINT)* pptl, int cPoint, CREATE_POLYGON_RGN_MODE iMode);
BOOL DPtoLP(HDC hdc, POINT* lppt, int c);
BOOL LPtoDP(HDC hdc, POINT* lppt, int c);
BOOL Polygon(HDC hdc, const(POINT)* apt, int cpt);
BOOL Polyline(HDC hdc, const(POINT)* apt, int cpt);
BOOL PolyBezier(HDC hdc, const(POINT)* apt, uint cpt);
BOOL PolyBezierTo(HDC hdc, const(POINT)* apt, uint cpt);
BOOL PolylineTo(HDC hdc, const(POINT)* apt, uint cpt);
BOOL SetViewportExtEx(HDC hdc, int x, int y, SIZE* lpsz);
BOOL SetViewportOrgEx(HDC hdc, int x, int y, POINT* lppt);
BOOL SetWindowExtEx(HDC hdc, int x, int y, SIZE* lpsz);
BOOL SetWindowOrgEx(HDC hdc, int x, int y, POINT* lppt);
BOOL OffsetViewportOrgEx(HDC hdc, int x, int y, POINT* lppt);
BOOL OffsetWindowOrgEx(HDC hdc, int x, int y, POINT* lppt);
BOOL ScaleViewportExtEx(HDC hdc, int xn, int dx, int yn, int yd, SIZE* lpsz);
BOOL ScaleWindowExtEx(HDC hdc, int xn, int xd, int yn, int yd, SIZE* lpsz);
BOOL SetBitmapDimensionEx(HBITMAP hbm, int w, int h, SIZE* lpsz);
BOOL SetBrushOrgEx(HDC hdc, int x, int y, POINT* lppt);
int GetTextFaceA(HDC hdc, int c, PSTR lpName);
int GetTextFaceW(HDC hdc, int c, PWSTR lpName);
uint GetKerningPairsA(HDC hdc, uint nPairs, KERNINGPAIR* lpKernPair);
uint GetKerningPairsW(HDC hdc, uint nPairs, KERNINGPAIR* lpKernPair);
BOOL GetDCOrgEx(HDC hdc, POINT* lppt);
BOOL FixBrushOrgEx(HDC hdc, int x, int y, POINT* ptl);
BOOL UnrealizeObject(HGDIOBJ h);
BOOL GdiFlush();
uint GdiSetBatchLimit(uint dw);
uint GdiGetBatchLimit();
uint wglSwapMultipleBuffers(uint param0, const(WGLSWAP)* param1);
uint CreateFontPackage(const(ubyte)* puchSrcBuffer, const(uint) ulSrcBufferSize, ubyte** ppuchFontPackageBuffer, uint* pulFontPackageBufferSize, uint* pulBytesWritten, const(ushort) usFlag, const(ushort) usTTCIndex, const(ushort) usSubsetFormat, const(ushort) usSubsetLanguage, const(CREATE_FONT_PACKAGE_SUBSET_PLATFORM) usSubsetPlatform, const(CREATE_FONT_PACKAGE_SUBSET_ENCODING) usSubsetEncoding, const(ushort)* pusSubsetKeepList, const(ushort) usSubsetListCount, CFP_ALLOCPROC lpfnAllocate, CFP_REALLOCPROC lpfnReAllocate, CFP_FREEPROC lpfnFree, void* lpvReserved);
uint MergeFontPackage(const(ubyte)* puchMergeFontBuffer, const(uint) ulMergeFontBufferSize, const(ubyte)* puchFontPackageBuffer, const(uint) ulFontPackageBufferSize, ubyte** ppuchDestBuffer, uint* pulDestBufferSize, uint* pulBytesWritten, const(ushort) usMode, CFP_ALLOCPROC lpfnAllocate, CFP_REALLOCPROC lpfnReAllocate, CFP_FREEPROC lpfnFree, void* lpvReserved);
int TTEmbedFont(HDC hDC, TTEMBED_FLAGS ulFlags, EMBED_FONT_CHARSET ulCharSet, EMBEDDED_FONT_PRIV_STATUS* pulPrivStatus, uint* pulStatus, WRITEEMBEDPROC lpfnWriteToStream, void* lpvWriteStream, ushort* pusCharCodeSet, ushort usCharCodeCount, ushort usLanguage, TTEMBEDINFO* pTTEmbedInfo);
int TTEmbedFontFromFileA(HDC hDC, const(char)* szFontFileName, ushort usTTCIndex, TTEMBED_FLAGS ulFlags, EMBED_FONT_CHARSET ulCharSet, EMBEDDED_FONT_PRIV_STATUS* pulPrivStatus, uint* pulStatus, WRITEEMBEDPROC lpfnWriteToStream, void* lpvWriteStream, ushort* pusCharCodeSet, ushort usCharCodeCount, ushort usLanguage, TTEMBEDINFO* pTTEmbedInfo);
int TTLoadEmbeddedFont(HANDLE* phFontReference, uint ulFlags, EMBEDDED_FONT_PRIV_STATUS* pulPrivStatus, FONT_LICENSE_PRIVS ulPrivs, TTLOAD_EMBEDDED_FONT_STATUS* pulStatus, READEMBEDPROC lpfnReadFromStream, void* lpvReadStream, PWSTR szWinFamilyName, PSTR szMacFamilyName, TTLOADINFO* pTTLoadInfo);
int TTGetEmbeddedFontInfo(TTEMBED_FLAGS ulFlags, uint* pulPrivStatus, FONT_LICENSE_PRIVS ulPrivs, uint* pulStatus, READEMBEDPROC lpfnReadFromStream, void* lpvReadStream, TTLOADINFO* pTTLoadInfo);
int TTDeleteEmbeddedFont(HANDLE hFontReference, uint ulFlags, uint* pulStatus);
int TTGetEmbeddingType(HDC hDC, EMBEDDED_FONT_PRIV_STATUS* pulEmbedType);
int TTCharToUnicode(HDC hDC, ubyte* pucCharCodes, uint ulCharCodeSize, ushort* pusShortCodes, uint ulShortCodeSize, uint ulFlags);
int TTRunValidationTests(HDC hDC, TTVALIDATIONTESTSPARAMS* pTestParam);
int TTIsEmbeddingEnabled(HDC hDC, BOOL* pbEnabled);
int TTIsEmbeddingEnabledForFacename(const(char)* lpszFacename, BOOL* pbEnabled);
int TTEnableEmbeddingForFacename(const(char)* lpszFacename, BOOL bEnable);
int TTEmbedFontEx(HDC hDC, TTEMBED_FLAGS ulFlags, EMBED_FONT_CHARSET ulCharSet, EMBEDDED_FONT_PRIV_STATUS* pulPrivStatus, uint* pulStatus, WRITEEMBEDPROC lpfnWriteToStream, void* lpvWriteStream, uint* pulCharCodeSet, ushort usCharCodeCount, ushort usLanguage, TTEMBEDINFO* pTTEmbedInfo);
int TTRunValidationTestsEx(HDC hDC, TTVALIDATIONTESTSPARAMSEX* pTestParam);
int TTGetNewFontName(HANDLE* phFontReference, PWSTR wzWinFamilyName, int cchMaxWinName, PSTR szMacFamilyName, int cchMaxMacName);
BOOL DrawEdge(HDC hdc, RECT* qrc, DRAWEDGE_FLAGS edge, DRAW_EDGE_FLAGS grfFlags);
BOOL DrawFrameControl(HDC param0, RECT* param1, DFC_TYPE param2, DFCS_STATE param3);
BOOL DrawCaption(HWND hwnd, HDC hdc, const(RECT)* lprect, DRAW_CAPTION_FLAGS flags);
BOOL DrawAnimatedRects(HWND hwnd, int idAni, const(RECT)* lprcFrom, const(RECT)* lprcTo);
int DrawTextA(HDC hdc, const(char)* lpchText, int cchText, RECT* lprc, DRAW_TEXT_FORMAT format);
int DrawTextW(HDC hdc, const(wchar)* lpchText, int cchText, RECT* lprc, DRAW_TEXT_FORMAT format);
int DrawTextExA(HDC hdc, PSTR lpchText, int cchText, RECT* lprc, DRAW_TEXT_FORMAT format, DRAWTEXTPARAMS* lpdtp);
int DrawTextExW(HDC hdc, PWSTR lpchText, int cchText, RECT* lprc, DRAW_TEXT_FORMAT format, DRAWTEXTPARAMS* lpdtp);
BOOL GrayStringA(HDC hDC, HBRUSH hBrush, GRAYSTRINGPROC lpOutputFunc, LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight);
BOOL GrayStringW(HDC hDC, HBRUSH hBrush, GRAYSTRINGPROC lpOutputFunc, LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight);
BOOL DrawStateA(HDC hdc, HBRUSH hbrFore, DRAWSTATEPROC qfnCallBack, LPARAM lData, WPARAM wData, int x, int y, int cx, int cy, DRAWSTATE_FLAGS uFlags);
BOOL DrawStateW(HDC hdc, HBRUSH hbrFore, DRAWSTATEPROC qfnCallBack, LPARAM lData, WPARAM wData, int x, int y, int cx, int cy, DRAWSTATE_FLAGS uFlags);
int TabbedTextOutA(HDC hdc, int x, int y, const(char)* lpString, int chCount, int nTabPositions, const(int)* lpnTabStopPositions, int nTabOrigin);
int TabbedTextOutW(HDC hdc, int x, int y, const(wchar)* lpString, int chCount, int nTabPositions, const(int)* lpnTabStopPositions, int nTabOrigin);
uint GetTabbedTextExtentA(HDC hdc, const(char)* lpString, int chCount, int nTabPositions, const(int)* lpnTabStopPositions);
uint GetTabbedTextExtentW(HDC hdc, const(wchar)* lpString, int chCount, int nTabPositions, const(int)* lpnTabStopPositions);
BOOL UpdateWindow(HWND hWnd);
BOOL PaintDesktop(HDC hdc);
HWND WindowFromDC(HDC hDC);
HDC GetDC(HWND hWnd);
HDC GetDCEx(HWND hWnd, HRGN hrgnClip, GET_DCX_FLAGS flags);
HDC GetWindowDC(HWND hWnd);
int ReleaseDC(HWND hWnd, HDC hDC);
HDC BeginPaint(HWND hWnd, PAINTSTRUCT* lpPaint);
BOOL EndPaint(HWND hWnd, const(PAINTSTRUCT)* lpPaint);
BOOL GetUpdateRect(HWND hWnd, RECT* lpRect, BOOL bErase);
GDI_REGION_TYPE GetUpdateRgn(HWND hWnd, HRGN hRgn, BOOL bErase);
int SetWindowRgn(HWND hWnd, HRGN hRgn, BOOL bRedraw);
GDI_REGION_TYPE GetWindowRgn(HWND hWnd, HRGN hRgn);
GDI_REGION_TYPE GetWindowRgnBox(HWND hWnd, RECT* lprc);
int ExcludeUpdateRgn(HDC hDC, HWND hWnd);
BOOL InvalidateRect(HWND hWnd, const(RECT)* lpRect, BOOL bErase);
BOOL ValidateRect(HWND hWnd, const(RECT)* lpRect);
BOOL InvalidateRgn(HWND hWnd, HRGN hRgn, BOOL bErase);
BOOL ValidateRgn(HWND hWnd, HRGN hRgn);
BOOL RedrawWindow(HWND hWnd, const(RECT)* lprcUpdate, HRGN hrgnUpdate, REDRAW_WINDOW_FLAGS flags);
BOOL LockWindowUpdate(HWND hWndLock);
BOOL ClientToScreen(HWND hWnd, POINT* lpPoint);
BOOL ScreenToClient(HWND hWnd, POINT* lpPoint);
int MapWindowPoints(HWND hWndFrom, HWND hWndTo, POINT* lpPoints, uint cPoints);
uint GetSysColor(SYS_COLOR_INDEX nIndex);
HBRUSH GetSysColorBrush(SYS_COLOR_INDEX nIndex);
BOOL SetSysColors(int cElements, const(int)* lpaElements, const(COLORREF)* lpaRgbValues);
BOOL DrawFocusRect(HDC hDC, const(RECT)* lprc);
int FillRect(HDC hDC, const(RECT)* lprc, HBRUSH hbr);
int FrameRect(HDC hDC, const(RECT)* lprc, HBRUSH hbr);
BOOL InvertRect(HDC hDC, const(RECT)* lprc);
BOOL SetRect(RECT* lprc, int xLeft, int yTop, int xRight, int yBottom);
BOOL SetRectEmpty(RECT* lprc);
BOOL CopyRect(RECT* lprcDst, const(RECT)* lprcSrc);
BOOL InflateRect(RECT* lprc, int dx, int dy);
BOOL IntersectRect(RECT* lprcDst, const(RECT)* lprcSrc1, const(RECT)* lprcSrc2);
BOOL UnionRect(RECT* lprcDst, const(RECT)* lprcSrc1, const(RECT)* lprcSrc2);
BOOL SubtractRect(RECT* lprcDst, const(RECT)* lprcSrc1, const(RECT)* lprcSrc2);
BOOL OffsetRect(RECT* lprc, int dx, int dy);
BOOL IsRectEmpty(const(RECT)* lprc);
BOOL EqualRect(const(RECT)* lprc1, const(RECT)* lprc2);
BOOL PtInRect(const(RECT)* lprc, POINT pt);
HBITMAP LoadBitmapA(HINSTANCE hInstance, const(char)* lpBitmapName);
HBITMAP LoadBitmapW(HINSTANCE hInstance, const(wchar)* lpBitmapName);
DISP_CHANGE ChangeDisplaySettingsA(DEVMODEA* lpDevMode, CDS_TYPE dwFlags);
DISP_CHANGE ChangeDisplaySettingsW(DEVMODEW* lpDevMode, CDS_TYPE dwFlags);
DISP_CHANGE ChangeDisplaySettingsExA(const(char)* lpszDeviceName, DEVMODEA* lpDevMode, HWND hwnd, CDS_TYPE dwflags, void* lParam);
DISP_CHANGE ChangeDisplaySettingsExW(const(wchar)* lpszDeviceName, DEVMODEW* lpDevMode, HWND hwnd, CDS_TYPE dwflags, void* lParam);
BOOL EnumDisplaySettingsA(const(char)* lpszDeviceName, ENUM_DISPLAY_SETTINGS_MODE iModeNum, DEVMODEA* lpDevMode);
BOOL EnumDisplaySettingsW(const(wchar)* lpszDeviceName, ENUM_DISPLAY_SETTINGS_MODE iModeNum, DEVMODEW* lpDevMode);
BOOL EnumDisplaySettingsExA(const(char)* lpszDeviceName, ENUM_DISPLAY_SETTINGS_MODE iModeNum, DEVMODEA* lpDevMode, ENUM_DISPLAY_SETTINGS_FLAGS dwFlags);
BOOL EnumDisplaySettingsExW(const(wchar)* lpszDeviceName, ENUM_DISPLAY_SETTINGS_MODE iModeNum, DEVMODEW* lpDevMode, ENUM_DISPLAY_SETTINGS_FLAGS dwFlags);
BOOL EnumDisplayDevicesA(const(char)* lpDevice, uint iDevNum, DISPLAY_DEVICEA* lpDisplayDevice, uint dwFlags);
BOOL EnumDisplayDevicesW(const(wchar)* lpDevice, uint iDevNum, DISPLAY_DEVICEW* lpDisplayDevice, uint dwFlags);
HMONITOR MonitorFromPoint(POINT pt, MONITOR_FROM_FLAGS dwFlags);
HMONITOR MonitorFromRect(RECT* lprc, MONITOR_FROM_FLAGS dwFlags);
HMONITOR MonitorFromWindow(HWND hwnd, MONITOR_FROM_FLAGS dwFlags);
BOOL GetMonitorInfoA(HMONITOR hMonitor, MONITORINFO* lpmi);
BOOL GetMonitorInfoW(HMONITOR hMonitor, MONITORINFO* lpmi);
BOOL EnumDisplayMonitors(HDC hdc, RECT* lprcClip, MONITORENUMPROC lpfnEnum, LPARAM dwData);
enum GDI_ERROR = 0xffffffffffffffff;
enum ERROR = 0x00000000;
enum MAXSTRETCHBLTMODE = 0x00000004;
enum POLYFILL_LAST = 0x00000002;
enum LAYOUT_BTT = 0x00000002;
enum LAYOUT_VBH = 0x00000004;
enum ASPECT_FILTERING = 0x00000001;
enum META_SETBKCOLOR = 0x00000201;
enum META_SETBKMODE = 0x00000102;
enum META_SETMAPMODE = 0x00000103;
enum META_SETROP2 = 0x00000104;
enum META_SETRELABS = 0x00000105;
enum META_SETPOLYFILLMODE = 0x00000106;
enum META_SETSTRETCHBLTMODE = 0x00000107;
enum META_SETTEXTCHAREXTRA = 0x00000108;
enum META_SETTEXTCOLOR = 0x00000209;
enum META_SETTEXTJUSTIFICATION = 0x0000020a;
enum META_SETWINDOWORG = 0x0000020b;
enum META_SETWINDOWEXT = 0x0000020c;
enum META_SETVIEWPORTORG = 0x0000020d;
enum META_SETVIEWPORTEXT = 0x0000020e;
enum META_OFFSETWINDOWORG = 0x0000020f;
enum META_SCALEWINDOWEXT = 0x00000410;
enum META_OFFSETVIEWPORTORG = 0x00000211;
enum META_SCALEVIEWPORTEXT = 0x00000412;
enum META_LINETO = 0x00000213;
enum META_MOVETO = 0x00000214;
enum META_EXCLUDECLIPRECT = 0x00000415;
enum META_INTERSECTCLIPRECT = 0x00000416;
enum META_ARC = 0x00000817;
enum META_ELLIPSE = 0x00000418;
enum META_FLOODFILL = 0x00000419;
enum META_PIE = 0x0000081a;
enum META_RECTANGLE = 0x0000041b;
enum META_ROUNDRECT = 0x0000061c;
enum META_PATBLT = 0x0000061d;
enum META_SAVEDC = 0x0000001e;
enum META_SETPIXEL = 0x0000041f;
enum META_OFFSETCLIPRGN = 0x00000220;
enum META_TEXTOUT = 0x00000521;
enum META_BITBLT = 0x00000922;
enum META_STRETCHBLT = 0x00000b23;
enum META_POLYGON = 0x00000324;
enum META_POLYLINE = 0x00000325;
enum META_ESCAPE = 0x00000626;
enum META_RESTOREDC = 0x00000127;
enum META_FILLREGION = 0x00000228;
enum META_FRAMEREGION = 0x00000429;
enum META_INVERTREGION = 0x0000012a;
enum META_PAINTREGION = 0x0000012b;
enum META_SELECTCLIPREGION = 0x0000012c;
enum META_SELECTOBJECT = 0x0000012d;
enum META_SETTEXTALIGN = 0x0000012e;
enum META_CHORD = 0x00000830;
enum META_SETMAPPERFLAGS = 0x00000231;
enum META_EXTTEXTOUT = 0x00000a32;
enum META_SETDIBTODEV = 0x00000d33;
enum META_SELECTPALETTE = 0x00000234;
enum META_REALIZEPALETTE = 0x00000035;
enum META_ANIMATEPALETTE = 0x00000436;
enum META_SETPALENTRIES = 0x00000037;
enum META_POLYPOLYGON = 0x00000538;
enum META_RESIZEPALETTE = 0x00000139;
enum META_DIBBITBLT = 0x00000940;
enum META_DIBSTRETCHBLT = 0x00000b41;
enum META_DIBCREATEPATTERNBRUSH = 0x00000142;
enum META_STRETCHDIB = 0x00000f43;
enum META_EXTFLOODFILL = 0x00000548;
enum META_SETLAYOUT = 0x00000149;
enum META_DELETEOBJECT = 0x000001f0;
enum META_CREATEPALETTE = 0x000000f7;
enum META_CREATEPATTERNBRUSH = 0x000001f9;
enum META_CREATEPENINDIRECT = 0x000002fa;
enum META_CREATEFONTINDIRECT = 0x000002fb;
enum META_CREATEBRUSHINDIRECT = 0x000002fc;
enum META_CREATEREGION = 0x000006ff;
enum NEWFRAME = 0x00000001;
enum ABORTDOC = 0x00000002;
enum NEXTBAND = 0x00000003;
enum SETCOLORTABLE = 0x00000004;
enum GETCOLORTABLE = 0x00000005;
enum FLUSHOUTPUT = 0x00000006;
enum DRAFTMODE = 0x00000007;
enum QUERYESCSUPPORT = 0x00000008;
enum SETABORTPROC = 0x00000009;
enum STARTDOC = 0x0000000a;
enum ENDDOC = 0x0000000b;
enum GETPHYSPAGESIZE = 0x0000000c;
enum GETPRINTINGOFFSET = 0x0000000d;
enum GETSCALINGFACTOR = 0x0000000e;
enum MFCOMMENT = 0x0000000f;
enum GETPENWIDTH = 0x00000010;
enum SETCOPYCOUNT = 0x00000011;
enum SELECTPAPERSOURCE = 0x00000012;
enum DEVICEDATA = 0x00000013;
enum PASSTHROUGH = 0x00000013;
enum GETTECHNOLGY = 0x00000014;
enum GETTECHNOLOGY = 0x00000014;
enum SETLINECAP = 0x00000015;
enum SETLINEJOIN = 0x00000016;
enum SETMITERLIMIT = 0x00000017;
enum BANDINFO = 0x00000018;
enum DRAWPATTERNRECT = 0x00000019;
enum GETVECTORPENSIZE = 0x0000001a;
enum GETVECTORBRUSHSIZE = 0x0000001b;
enum ENABLEDUPLEX = 0x0000001c;
enum GETSETPAPERBINS = 0x0000001d;
enum GETSETPRINTORIENT = 0x0000001e;
enum ENUMPAPERBINS = 0x0000001f;
enum SETDIBSCALING = 0x00000020;
enum EPSPRINTING = 0x00000021;
enum ENUMPAPERMETRICS = 0x00000022;
enum GETSETPAPERMETRICS = 0x00000023;
enum POSTSCRIPT_DATA = 0x00000025;
enum POSTSCRIPT_IGNORE = 0x00000026;
enum MOUSETRAILS = 0x00000027;
enum GETDEVICEUNITS = 0x0000002a;
enum GETEXTENDEDTEXTMETRICS = 0x00000100;
enum GETEXTENTTABLE = 0x00000101;
enum GETPAIRKERNTABLE = 0x00000102;
enum GETTRACKKERNTABLE = 0x00000103;
enum EXTTEXTOUT = 0x00000200;
enum GETFACENAME = 0x00000201;
enum DOWNLOADFACE = 0x00000202;
enum ENABLERELATIVEWIDTHS = 0x00000300;
enum ENABLEPAIRKERNING = 0x00000301;
enum SETKERNTRACK = 0x00000302;
enum SETALLJUSTVALUES = 0x00000303;
enum SETCHARSET = 0x00000304;
enum STRETCHBLT = 0x00000800;
enum METAFILE_DRIVER = 0x00000801;
enum GETSETSCREENPARAMS = 0x00000c00;
enum QUERYDIBSUPPORT = 0x00000c01;
enum BEGIN_PATH = 0x00001000;
enum CLIP_TO_PATH = 0x00001001;
enum END_PATH = 0x00001002;
enum EXT_DEVICE_CAPS = 0x00001003;
enum RESTORE_CTM = 0x00001004;
enum SAVE_CTM = 0x00001005;
enum SET_ARC_DIRECTION = 0x00001006;
enum SET_BACKGROUND_COLOR = 0x00001007;
enum SET_POLY_MODE = 0x00001008;
enum SET_SCREEN_ANGLE = 0x00001009;
enum SET_SPREAD = 0x0000100a;
enum TRANSFORM_CTM = 0x0000100b;
enum SET_CLIP_BOX = 0x0000100c;
enum SET_BOUNDS = 0x0000100d;
enum SET_MIRROR_MODE = 0x0000100e;
enum OPENCHANNEL = 0x0000100e;
enum DOWNLOADHEADER = 0x0000100f;
enum CLOSECHANNEL = 0x00001010;
enum POSTSCRIPT_PASSTHROUGH = 0x00001013;
enum ENCAPSULATED_POSTSCRIPT = 0x00001014;
enum POSTSCRIPT_IDENTIFY = 0x00001015;
enum POSTSCRIPT_INJECTION = 0x00001016;
enum CHECKJPEGFORMAT = 0x00001017;
enum CHECKPNGFORMAT = 0x00001018;
enum GET_PS_FEATURESETTING = 0x00001019;
enum GDIPLUS_TS_QUERYVER = 0x0000101a;
enum GDIPLUS_TS_RECORD = 0x0000101b;
enum MILCORE_TS_QUERYVER_RESULT_FALSE = 0x00000000;
enum MILCORE_TS_QUERYVER_RESULT_TRUE = 0x7fffffff;
enum SPCLPASSTHROUGH2 = 0x000011d8;
enum PSIDENT_GDICENTRIC = 0x00000000;
enum PSIDENT_PSCENTRIC = 0x00000001;
enum PSINJECT_DLFONT = 0xdddddddd;
enum FEATURESETTING_NUP = 0x00000000;
enum FEATURESETTING_OUTPUT = 0x00000001;
enum FEATURESETTING_PSLEVEL = 0x00000002;
enum FEATURESETTING_CUSTPAPER = 0x00000003;
enum FEATURESETTING_MIRROR = 0x00000004;
enum FEATURESETTING_NEGATIVE = 0x00000005;
enum FEATURESETTING_PROTOCOL = 0x00000006;
enum FEATURESETTING_PRIVATE_BEGIN = 0x00001000;
enum FEATURESETTING_PRIVATE_END = 0x00001fff;
enum PSPROTOCOL_ASCII = 0x00000000;
enum PSPROTOCOL_BCP = 0x00000001;
enum PSPROTOCOL_TBCP = 0x00000002;
enum PSPROTOCOL_BINARY = 0x00000003;
enum QDI_SETDIBITS = 0x00000001;
enum QDI_GETDIBITS = 0x00000002;
enum QDI_DIBTOSCREEN = 0x00000004;
enum QDI_STRETCHDIB = 0x00000008;
enum SP_NOTREPORTED = 0x00004000;
enum SP_ERROR = 0xffffffffffffffff;
enum SP_APPABORT = 0xfffffffffffffffe;
enum SP_USERABORT = 0xfffffffffffffffd;
enum SP_OUTOFDISK = 0xfffffffffffffffc;
enum SP_OUTOFMEMORY = 0xfffffffffffffffb;
enum PR_JOBSTATUS = 0x00000000;
enum LCS_GM_BUSINESS = 0x00000001;
enum LCS_GM_GRAPHICS = 0x00000002;
enum LCS_GM_IMAGES = 0x00000004;
enum LCS_GM_ABS_COLORIMETRIC = 0x00000008;
enum CM_OUT_OF_GAMUT = 0x000000ff;
enum CM_IN_GAMUT = 0x00000000;
enum NTM_REGULAR = 0x00000040;
enum NTM_BOLD = 0x00000020;
enum NTM_ITALIC = 0x00000001;
enum NTM_NONNEGATIVE_AC = 0x00010000;
enum NTM_PS_OPENTYPE = 0x00020000;
enum NTM_TT_OPENTYPE = 0x00040000;
enum NTM_MULTIPLEMASTER = 0x00080000;
enum NTM_TYPE1 = 0x00100000;
enum NTM_DSIG = 0x00200000;
enum LF_FACESIZE = 0x00000020;
enum LF_FULLFACESIZE = 0x00000040;
enum CLEARTYPE_NATURAL_QUALITY = 0x00000006;
enum MONO_FONT = 0x00000008;
enum FS_LATIN1 = 0x00000001;
enum FS_LATIN2 = 0x00000002;
enum FS_CYRILLIC = 0x00000004;
enum FS_GREEK = 0x00000008;
enum FS_TURKISH = 0x00000010;
enum FS_HEBREW = 0x00000020;
enum FS_ARABIC = 0x00000040;
enum FS_BALTIC = 0x00000080;
enum FS_VIETNAMESE = 0x00000100;
enum FS_THAI = 0x00010000;
enum FS_JISJAPAN = 0x00020000;
enum FS_CHINESESIMP = 0x00040000;
enum FS_WANSUNG = 0x00080000;
enum FS_CHINESETRAD = 0x00100000;
enum FS_JOHAB = 0x00200000;
enum FS_SYMBOL = 0xffffffff80000000;
enum PANOSE_COUNT = 0x0000000a;
enum PAN_FAMILYTYPE_INDEX = 0x00000000;
enum PAN_SERIFSTYLE_INDEX = 0x00000001;
enum PAN_PROPORTION_INDEX = 0x00000003;
enum PAN_STROKEVARIATION_INDEX = 0x00000005;
enum PAN_ARMSTYLE_INDEX = 0x00000006;
enum PAN_LETTERFORM_INDEX = 0x00000007;
enum PAN_CULTURE_LATIN = 0x00000000;
enum PAN_ANY = 0x00000000;
enum PAN_NO_FIT = 0x00000001;
enum ELF_VENDOR_SIZE = 0x00000004;
enum ELF_VERSION = 0x00000000;
enum ELF_CULTURE_LATIN = 0x00000000;
enum RASTER_FONTTYPE = 0x00000001;
enum DEVICE_FONTTYPE = 0x00000002;
enum TRUETYPE_FONTTYPE = 0x00000004;
enum PC_RESERVED = 0x00000001;
enum PC_EXPLICIT = 0x00000002;
enum PC_NOCOLLAPSE = 0x00000004;
enum BKMODE_LAST = 0x00000002;
enum GM_LAST = 0x00000002;
enum PT_CLOSEFIGURE = 0x00000001;
enum PT_LINETO = 0x00000002;
enum PT_BEZIERTO = 0x00000004;
enum PT_MOVETO = 0x00000006;
enum ABSOLUTE = 0x00000001;
enum RELATIVE = 0x00000002;
enum STOCK_LAST = 0x00000013;
enum CLR_INVALID = 0xffffffff;
enum HS_API_MAX = 0x0000000c;
enum DT_PLOTTER = 0x00000000;
enum DT_RASDISPLAY = 0x00000001;
enum DT_RASPRINTER = 0x00000002;
enum DT_RASCAMERA = 0x00000003;
enum DT_CHARSTREAM = 0x00000004;
enum DT_METAFILE = 0x00000005;
enum DT_DISPFILE = 0x00000006;
enum CC_NONE = 0x00000000;
enum CC_CIRCLES = 0x00000001;
enum CC_PIE = 0x00000002;
enum CC_CHORD = 0x00000004;
enum CC_ELLIPSES = 0x00000008;
enum CC_WIDE = 0x00000010;
enum CC_STYLED = 0x00000020;
enum CC_WIDESTYLED = 0x00000040;
enum CC_INTERIORS = 0x00000080;
enum CC_ROUNDRECT = 0x00000100;
enum LC_NONE = 0x00000000;
enum LC_POLYLINE = 0x00000002;
enum LC_MARKER = 0x00000004;
enum LC_POLYMARKER = 0x00000008;
enum LC_WIDE = 0x00000010;
enum LC_STYLED = 0x00000020;
enum LC_WIDESTYLED = 0x00000040;
enum LC_INTERIORS = 0x00000080;
enum PC_NONE = 0x00000000;
enum PC_POLYGON = 0x00000001;
enum PC_RECTANGLE = 0x00000002;
enum PC_WINDPOLYGON = 0x00000004;
enum PC_TRAPEZOID = 0x00000004;
enum PC_SCANLINE = 0x00000008;
enum PC_WIDE = 0x00000010;
enum PC_STYLED = 0x00000020;
enum PC_WIDESTYLED = 0x00000040;
enum PC_INTERIORS = 0x00000080;
enum PC_POLYPOLYGON = 0x00000100;
enum PC_PATHS = 0x00000200;
enum CP_NONE = 0x00000000;
enum CP_RECTANGLE = 0x00000001;
enum CP_REGION = 0x00000002;
enum TC_OP_CHARACTER = 0x00000001;
enum TC_OP_STROKE = 0x00000002;
enum TC_CP_STROKE = 0x00000004;
enum TC_CR_90 = 0x00000008;
enum TC_CR_ANY = 0x00000010;
enum TC_SF_X_YINDEP = 0x00000020;
enum TC_SA_DOUBLE = 0x00000040;
enum TC_SA_INTEGER = 0x00000080;
enum TC_SA_CONTIN = 0x00000100;
enum TC_EA_DOUBLE = 0x00000200;
enum TC_IA_ABLE = 0x00000400;
enum TC_UA_ABLE = 0x00000800;
enum TC_SO_ABLE = 0x00001000;
enum TC_RA_ABLE = 0x00002000;
enum TC_VA_ABLE = 0x00004000;
enum TC_RESERVED = 0x00008000;
enum TC_SCROLLBLT = 0x00010000;
enum RC_BITBLT = 0x00000001;
enum RC_BANDING = 0x00000002;
enum RC_SCALING = 0x00000004;
enum RC_BITMAP64 = 0x00000008;
enum RC_GDI20_OUTPUT = 0x00000010;
enum RC_GDI20_STATE = 0x00000020;
enum RC_SAVEBITMAP = 0x00000040;
enum RC_DI_BITMAP = 0x00000080;
enum RC_PALETTE = 0x00000100;
enum RC_DIBTODEV = 0x00000200;
enum RC_BIGFONT = 0x00000400;
enum RC_STRETCHBLT = 0x00000800;
enum RC_FLOODFILL = 0x00001000;
enum RC_STRETCHDIB = 0x00002000;
enum RC_OP_DX_OUTPUT = 0x00004000;
enum RC_DEVBITS = 0x00008000;
enum SB_NONE = 0x00000000;
enum SB_CONST_ALPHA = 0x00000001;
enum SB_PIXEL_ALPHA = 0x00000002;
enum SB_PREMULT_ALPHA = 0x00000004;
enum SB_GRAD_RECT = 0x00000010;
enum SB_GRAD_TRI = 0x00000020;
enum CM_NONE = 0x00000000;
enum CM_DEVICE_ICM = 0x00000001;
enum CM_GAMMA_RAMP = 0x00000002;
enum CM_CMYK_COLOR = 0x00000004;
enum SYSPAL_ERROR = 0x00000000;
enum CBM_INIT = 0x00000004;
enum CCHFORMNAME = 0x00000020;
enum DMORIENT_PORTRAIT = 0x00000001;
enum DMORIENT_LANDSCAPE = 0x00000002;
enum DMPAPER_LETTER = 0x00000001;
enum DMPAPER_LETTERSMALL = 0x00000002;
enum DMPAPER_TABLOID = 0x00000003;
enum DMPAPER_LEDGER = 0x00000004;
enum DMPAPER_LEGAL = 0x00000005;
enum DMPAPER_STATEMENT = 0x00000006;
enum DMPAPER_EXECUTIVE = 0x00000007;
enum DMPAPER_A3 = 0x00000008;
enum DMPAPER_A4 = 0x00000009;
enum DMPAPER_A4SMALL = 0x0000000a;
enum DMPAPER_A5 = 0x0000000b;
enum DMPAPER_B4 = 0x0000000c;
enum DMPAPER_B5 = 0x0000000d;
enum DMPAPER_FOLIO = 0x0000000e;
enum DMPAPER_QUARTO = 0x0000000f;
enum DMPAPER_10X14 = 0x00000010;
enum DMPAPER_11X17 = 0x00000011;
enum DMPAPER_NOTE = 0x00000012;
enum DMPAPER_ENV_9 = 0x00000013;
enum DMPAPER_ENV_10 = 0x00000014;
enum DMPAPER_ENV_11 = 0x00000015;
enum DMPAPER_ENV_12 = 0x00000016;
enum DMPAPER_ENV_14 = 0x00000017;
enum DMPAPER_CSHEET = 0x00000018;
enum DMPAPER_DSHEET = 0x00000019;
enum DMPAPER_ESHEET = 0x0000001a;
enum DMPAPER_ENV_DL = 0x0000001b;
enum DMPAPER_ENV_C5 = 0x0000001c;
enum DMPAPER_ENV_C3 = 0x0000001d;
enum DMPAPER_ENV_C4 = 0x0000001e;
enum DMPAPER_ENV_C6 = 0x0000001f;
enum DMPAPER_ENV_C65 = 0x00000020;
enum DMPAPER_ENV_B4 = 0x00000021;
enum DMPAPER_ENV_B5 = 0x00000022;
enum DMPAPER_ENV_B6 = 0x00000023;
enum DMPAPER_ENV_ITALY = 0x00000024;
enum DMPAPER_ENV_MONARCH = 0x00000025;
enum DMPAPER_ENV_PERSONAL = 0x00000026;
enum DMPAPER_FANFOLD_US = 0x00000027;
enum DMPAPER_FANFOLD_STD_GERMAN = 0x00000028;
enum DMPAPER_FANFOLD_LGL_GERMAN = 0x00000029;
enum DMPAPER_ISO_B4 = 0x0000002a;
enum DMPAPER_JAPANESE_POSTCARD = 0x0000002b;
enum DMPAPER_9X11 = 0x0000002c;
enum DMPAPER_10X11 = 0x0000002d;
enum DMPAPER_15X11 = 0x0000002e;
enum DMPAPER_ENV_INVITE = 0x0000002f;
enum DMPAPER_RESERVED_48 = 0x00000030;
enum DMPAPER_RESERVED_49 = 0x00000031;
enum DMPAPER_LETTER_EXTRA = 0x00000032;
enum DMPAPER_LEGAL_EXTRA = 0x00000033;
enum DMPAPER_TABLOID_EXTRA = 0x00000034;
enum DMPAPER_A4_EXTRA = 0x00000035;
enum DMPAPER_LETTER_TRANSVERSE = 0x00000036;
enum DMPAPER_A4_TRANSVERSE = 0x00000037;
enum DMPAPER_LETTER_EXTRA_TRANSVERSE = 0x00000038;
enum DMPAPER_A_PLUS = 0x00000039;
enum DMPAPER_B_PLUS = 0x0000003a;
enum DMPAPER_LETTER_PLUS = 0x0000003b;
enum DMPAPER_A4_PLUS = 0x0000003c;
enum DMPAPER_A5_TRANSVERSE = 0x0000003d;
enum DMPAPER_B5_TRANSVERSE = 0x0000003e;
enum DMPAPER_A3_EXTRA = 0x0000003f;
enum DMPAPER_A5_EXTRA = 0x00000040;
enum DMPAPER_B5_EXTRA = 0x00000041;
enum DMPAPER_A2 = 0x00000042;
enum DMPAPER_A3_TRANSVERSE = 0x00000043;
enum DMPAPER_A3_EXTRA_TRANSVERSE = 0x00000044;
enum DMPAPER_DBL_JAPANESE_POSTCARD = 0x00000045;
enum DMPAPER_A6 = 0x00000046;
enum DMPAPER_JENV_KAKU2 = 0x00000047;
enum DMPAPER_JENV_KAKU3 = 0x00000048;
enum DMPAPER_JENV_CHOU3 = 0x00000049;
enum DMPAPER_JENV_CHOU4 = 0x0000004a;
enum DMPAPER_LETTER_ROTATED = 0x0000004b;
enum DMPAPER_A3_ROTATED = 0x0000004c;
enum DMPAPER_A4_ROTATED = 0x0000004d;
enum DMPAPER_A5_ROTATED = 0x0000004e;
enum DMPAPER_B4_JIS_ROTATED = 0x0000004f;
enum DMPAPER_B5_JIS_ROTATED = 0x00000050;
enum DMPAPER_JAPANESE_POSTCARD_ROTATED = 0x00000051;
enum DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED = 0x00000052;
enum DMPAPER_A6_ROTATED = 0x00000053;
enum DMPAPER_JENV_KAKU2_ROTATED = 0x00000054;
enum DMPAPER_JENV_KAKU3_ROTATED = 0x00000055;
enum DMPAPER_JENV_CHOU3_ROTATED = 0x00000056;
enum DMPAPER_JENV_CHOU4_ROTATED = 0x00000057;
enum DMPAPER_B6_JIS = 0x00000058;
enum DMPAPER_B6_JIS_ROTATED = 0x00000059;
enum DMPAPER_12X11 = 0x0000005a;
enum DMPAPER_JENV_YOU4 = 0x0000005b;
enum DMPAPER_JENV_YOU4_ROTATED = 0x0000005c;
enum DMPAPER_P16K = 0x0000005d;
enum DMPAPER_P32K = 0x0000005e;
enum DMPAPER_P32KBIG = 0x0000005f;
enum DMPAPER_PENV_1 = 0x00000060;
enum DMPAPER_PENV_2 = 0x00000061;
enum DMPAPER_PENV_3 = 0x00000062;
enum DMPAPER_PENV_4 = 0x00000063;
enum DMPAPER_PENV_5 = 0x00000064;
enum DMPAPER_PENV_6 = 0x00000065;
enum DMPAPER_PENV_7 = 0x00000066;
enum DMPAPER_PENV_8 = 0x00000067;
enum DMPAPER_PENV_9 = 0x00000068;
enum DMPAPER_PENV_10 = 0x00000069;
enum DMPAPER_P16K_ROTATED = 0x0000006a;
enum DMPAPER_P32K_ROTATED = 0x0000006b;
enum DMPAPER_P32KBIG_ROTATED = 0x0000006c;
enum DMPAPER_PENV_1_ROTATED = 0x0000006d;
enum DMPAPER_PENV_2_ROTATED = 0x0000006e;
enum DMPAPER_PENV_3_ROTATED = 0x0000006f;
enum DMPAPER_PENV_4_ROTATED = 0x00000070;
enum DMPAPER_PENV_5_ROTATED = 0x00000071;
enum DMPAPER_PENV_6_ROTATED = 0x00000072;
enum DMPAPER_PENV_7_ROTATED = 0x00000073;
enum DMPAPER_PENV_8_ROTATED = 0x00000074;
enum DMPAPER_PENV_9_ROTATED = 0x00000075;
enum DMPAPER_PENV_10_ROTATED = 0x00000076;
enum DMPAPER_LAST = 0x00000076;
enum DMPAPER_USER = 0x00000100;
enum DMBIN_UPPER = 0x00000001;
enum DMBIN_ONLYONE = 0x00000001;
enum DMBIN_LOWER = 0x00000002;
enum DMBIN_MIDDLE = 0x00000003;
enum DMBIN_MANUAL = 0x00000004;
enum DMBIN_ENVELOPE = 0x00000005;
enum DMBIN_ENVMANUAL = 0x00000006;
enum DMBIN_AUTO = 0x00000007;
enum DMBIN_TRACTOR = 0x00000008;
enum DMBIN_SMALLFMT = 0x00000009;
enum DMBIN_LARGEFMT = 0x0000000a;
enum DMBIN_LARGECAPACITY = 0x0000000b;
enum DMBIN_CASSETTE = 0x0000000e;
enum DMBIN_FORMSOURCE = 0x0000000f;
enum DMBIN_LAST = 0x0000000f;
enum DMBIN_USER = 0x00000100;
enum DMRES_DRAFT = 0xffffffffffffffff;
enum DMRES_LOW = 0xfffffffffffffffe;
enum DMRES_MEDIUM = 0xfffffffffffffffd;
enum DMRES_HIGH = 0xfffffffffffffffc;
enum DMDISPLAYFLAGS_TEXTMODE = 0x00000004;
enum DMNUP_SYSTEM = 0x00000001;
enum DMNUP_ONEUP = 0x00000002;
enum DMICMMETHOD_NONE = 0x00000001;
enum DMICMMETHOD_SYSTEM = 0x00000002;
enum DMICMMETHOD_DRIVER = 0x00000003;
enum DMICMMETHOD_DEVICE = 0x00000004;
enum DMICMMETHOD_USER = 0x00000100;
enum DMICM_SATURATE = 0x00000001;
enum DMICM_CONTRAST = 0x00000002;
enum DMICM_COLORIMETRIC = 0x00000003;
enum DMICM_ABS_COLORIMETRIC = 0x00000004;
enum DMICM_USER = 0x00000100;
enum DMMEDIA_STANDARD = 0x00000001;
enum DMMEDIA_TRANSPARENCY = 0x00000002;
enum DMMEDIA_GLOSSY = 0x00000003;
enum DMMEDIA_USER = 0x00000100;
enum DMDITHER_NONE = 0x00000001;
enum DMDITHER_COARSE = 0x00000002;
enum DMDITHER_FINE = 0x00000003;
enum DMDITHER_LINEART = 0x00000004;
enum DMDITHER_ERRORDIFFUSION = 0x00000005;
enum DMDITHER_RESERVED6 = 0x00000006;
enum DMDITHER_RESERVED7 = 0x00000007;
enum DMDITHER_RESERVED8 = 0x00000008;
enum DMDITHER_RESERVED9 = 0x00000009;
enum DMDITHER_GRAYSCALE = 0x0000000a;
enum DMDITHER_USER = 0x00000100;
enum DISPLAYCONFIG_MAXPATH = 0x00000400;
enum DISPLAYCONFIG_PATH_MODE_IDX_INVALID = 0xffffffff;
enum DISPLAYCONFIG_PATH_TARGET_MODE_IDX_INVALID = 0x0000ffff;
enum DISPLAYCONFIG_PATH_DESKTOP_IMAGE_IDX_INVALID = 0x0000ffff;
enum DISPLAYCONFIG_PATH_SOURCE_MODE_IDX_INVALID = 0x0000ffff;
enum DISPLAYCONFIG_PATH_CLONE_GROUP_INVALID = 0x0000ffff;
enum DISPLAYCONFIG_SOURCE_IN_USE = 0x00000001;
enum DISPLAYCONFIG_TARGET_IN_USE = 0x00000001;
enum DISPLAYCONFIG_TARGET_FORCIBLE = 0x00000002;
enum DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_BOOT = 0x00000004;
enum DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_PATH = 0x00000008;
enum DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_SYSTEM = 0x00000010;
enum DISPLAYCONFIG_TARGET_IS_HMD = 0x00000020;
enum DISPLAYCONFIG_PATH_ACTIVE = 0x00000001;
enum DISPLAYCONFIG_PATH_PREFERRED_UNSCALED = 0x00000004;
enum DISPLAYCONFIG_PATH_SUPPORT_VIRTUAL_MODE = 0x00000008;
enum DISPLAYCONFIG_PATH_VALID_FLAGS = 0x0000001d;
enum RDH_RECTANGLES = 0x00000001;
enum SYSRGN = 0x00000004;
enum TT_POLYGON_TYPE = 0x00000018;
enum TT_PRIM_LINE = 0x00000001;
enum TT_PRIM_QSPLINE = 0x00000002;
enum TT_PRIM_CSPLINE = 0x00000003;
enum GCP_DBCS = 0x00000001;
enum GCP_ERROR = 0x00008000;
enum FLI_MASK = 0x0000103b;
enum FLI_GLYPHS = 0x00040000;
enum GCP_JUSTIFYIN = 0x00200000;
enum GCPCLASS_LATIN = 0x00000001;
enum GCPCLASS_HEBREW = 0x00000002;
enum GCPCLASS_ARABIC = 0x00000002;
enum GCPCLASS_NEUTRAL = 0x00000003;
enum GCPCLASS_LOCALNUMBER = 0x00000004;
enum GCPCLASS_LATINNUMBER = 0x00000005;
enum GCPCLASS_LATINNUMERICTERMINATOR = 0x00000006;
enum GCPCLASS_LATINNUMERICSEPARATOR = 0x00000007;
enum GCPCLASS_NUMERICSEPARATOR = 0x00000008;
enum GCPCLASS_PREBOUNDLTR = 0x00000080;
enum GCPCLASS_PREBOUNDRTL = 0x00000040;
enum GCPCLASS_POSTBOUNDLTR = 0x00000020;
enum GCPCLASS_POSTBOUNDRTL = 0x00000010;
enum GCPGLYPH_LINKBEFORE = 0x00008000;
enum GCPGLYPH_LINKAFTER = 0x00004000;
enum TT_AVAILABLE = 0x00000001;
enum TT_ENABLED = 0x00000002;
enum DC_BINADJUST = 0x00000013;
enum DC_EMF_COMPLIANT = 0x00000014;
enum DC_DATATYPE_PRODUCED = 0x00000015;
enum DC_MANUFACTURER = 0x00000017;
enum DC_MODEL = 0x00000018;
enum PRINTRATEUNIT_PPM = 0x00000001;
enum PRINTRATEUNIT_CPS = 0x00000002;
enum PRINTRATEUNIT_LPM = 0x00000003;
enum PRINTRATEUNIT_IPM = 0x00000004;
enum DCTT_BITMAP = 0x00000001;
enum DCTT_DOWNLOAD = 0x00000002;
enum DCTT_SUBDEV = 0x00000004;
enum DCTT_DOWNLOAD_OUTLINE = 0x00000008;
enum DCBA_FACEUPNONE = 0x00000000;
enum DCBA_FACEUPCENTER = 0x00000001;
enum DCBA_FACEUPLEFT = 0x00000002;
enum DCBA_FACEUPRIGHT = 0x00000003;
enum DCBA_FACEDOWNNONE = 0x00000100;
enum DCBA_FACEDOWNCENTER = 0x00000101;
enum DCBA_FACEDOWNLEFT = 0x00000102;
enum DCBA_FACEDOWNRIGHT = 0x00000103;
enum GS_8BIT_INDICES = 0x00000001;
enum GGI_MARK_NONEXISTING_GLYPHS = 0x00000001;
enum MM_MAX_NUMAXES = 0x00000010;
enum MM_MAX_AXES_NAMELEN = 0x00000010;
enum GDIREGISTERDDRAWPACKETVERSION = 0x00000001;
enum AC_SRC_OVER = 0x00000000;
enum AC_SRC_ALPHA = 0x00000001;
enum GRADIENT_FILL_OP_FLAG = 0x000000ff;
enum CA_NEGATIVE = 0x00000001;
enum CA_LOG_FILTER = 0x00000002;
enum ILLUMINANT_DEVICE_DEFAULT = 0x00000000;
enum ILLUMINANT_A = 0x00000001;
enum ILLUMINANT_B = 0x00000002;
enum ILLUMINANT_C = 0x00000003;
enum ILLUMINANT_D50 = 0x00000004;
enum ILLUMINANT_D55 = 0x00000005;
enum ILLUMINANT_D65 = 0x00000006;
enum ILLUMINANT_D75 = 0x00000007;
enum ILLUMINANT_F2 = 0x00000008;
enum ILLUMINANT_MAX_INDEX = 0x00000008;
enum ILLUMINANT_TUNGSTEN = 0x00000001;
enum ILLUMINANT_DAYLIGHT = 0x00000003;
enum ILLUMINANT_FLUORESCENT = 0x00000008;
enum ILLUMINANT_NTSC = 0x00000003;
enum DI_APPBANDING = 0x00000001;
enum DI_ROPS_READ_DESTINATION = 0x00000002;
enum FONTMAPPER_MAX = 0x0000000a;
enum ENHMETA_SIGNATURE = 0x464d4520;
enum ENHMETA_STOCK_OBJECT = 0x80000000;
enum SETICMPROFILE_EMBEDED = 0x00000001;
enum CREATECOLORSPACE_EMBEDED = 0x00000001;
enum COLORMATCHTOTARGET_EMBEDED = 0x00000001;
enum GDICOMMENT_IDENTIFIER = 0x43494447;
enum GDICOMMENT_WINDOWS_METAFILE = 0x80000001;
enum GDICOMMENT_BEGINGROUP = 0x00000002;
enum GDICOMMENT_ENDGROUP = 0x00000003;
enum GDICOMMENT_MULTIFORMATS = 0x40000004;
enum EPS_SIGNATURE = 0x46535045;
enum GDICOMMENT_UNICODE_STRING = 0x00000040;
enum GDICOMMENT_UNICODE_END = 0x00000080;
enum WGL_FONT_LINES = 0x00000000;
enum WGL_FONT_POLYGONS = 0x00000001;
enum LPD_DOUBLEBUFFER = 0x00000001;
enum LPD_STEREO = 0x00000002;
enum LPD_SUPPORT_GDI = 0x00000010;
enum LPD_SUPPORT_OPENGL = 0x00000020;
enum LPD_SHARE_DEPTH = 0x00000040;
enum LPD_SHARE_STENCIL = 0x00000080;
enum LPD_SHARE_ACCUM = 0x00000100;
enum LPD_SWAP_EXCHANGE = 0x00000200;
enum LPD_SWAP_COPY = 0x00000400;
enum LPD_TRANSPARENT = 0x00001000;
enum LPD_TYPE_RGBA = 0x00000000;
enum LPD_TYPE_COLORINDEX = 0x00000001;
enum WGL_SWAP_MAIN_PLANE = 0x00000001;
enum WGL_SWAP_OVERLAY1 = 0x00000002;
enum WGL_SWAP_OVERLAY2 = 0x00000004;
enum WGL_SWAP_OVERLAY3 = 0x00000008;
enum WGL_SWAP_OVERLAY4 = 0x00000010;
enum WGL_SWAP_OVERLAY5 = 0x00000020;
enum WGL_SWAP_OVERLAY6 = 0x00000040;
enum WGL_SWAP_OVERLAY7 = 0x00000080;
enum WGL_SWAP_OVERLAY8 = 0x00000100;
enum WGL_SWAP_OVERLAY9 = 0x00000200;
enum WGL_SWAP_OVERLAY10 = 0x00000400;
enum WGL_SWAP_OVERLAY11 = 0x00000800;
enum WGL_SWAP_OVERLAY12 = 0x00001000;
enum WGL_SWAP_OVERLAY13 = 0x00002000;
enum WGL_SWAP_OVERLAY14 = 0x00004000;
enum WGL_SWAP_OVERLAY15 = 0x00008000;
enum WGL_SWAP_UNDERLAY1 = 0x00010000;
enum WGL_SWAP_UNDERLAY2 = 0x00020000;
enum WGL_SWAP_UNDERLAY3 = 0x00040000;
enum WGL_SWAP_UNDERLAY4 = 0x00080000;
enum WGL_SWAP_UNDERLAY5 = 0x00100000;
enum WGL_SWAP_UNDERLAY6 = 0x00200000;
enum WGL_SWAP_UNDERLAY7 = 0x00400000;
enum WGL_SWAP_UNDERLAY8 = 0x00800000;
enum WGL_SWAP_UNDERLAY9 = 0x01000000;
enum WGL_SWAP_UNDERLAY10 = 0x02000000;
enum WGL_SWAP_UNDERLAY11 = 0x04000000;
enum WGL_SWAP_UNDERLAY12 = 0x08000000;
enum WGL_SWAP_UNDERLAY13 = 0x10000000;
enum WGL_SWAP_UNDERLAY14 = 0x20000000;
enum WGL_SWAP_UNDERLAY15 = 0x40000000;
enum WGL_SWAPMULTIPLE_MAX = 0x00000010;
enum NEWTRANSPARENT = 0x00000003;
enum QUERYROPSUPPORT = 0x00000028;
enum SELECTDIB = 0x00000029;
enum SC_SCREENSAVE = 0x0000f140;
enum TTFCFP_SUBSET = 0x00000000;
enum TTFCFP_SUBSET1 = 0x00000001;
enum TTFCFP_DELTA = 0x00000002;
enum TTFCFP_APPLE_PLATFORMID = 0x00000001;
enum TTFCFP_MS_PLATFORMID = 0x00000003;
enum TTFCFP_DONT_CARE = 0x0000ffff;
enum TTFCFP_LANG_KEEP_ALL = 0x00000000;
enum TTFCFP_FLAGS_SUBSET = 0x00000001;
enum TTFCFP_FLAGS_COMPRESS = 0x00000002;
enum TTFCFP_FLAGS_TTC = 0x00000004;
enum TTFCFP_FLAGS_GLYPHLIST = 0x00000008;
enum TTFMFP_SUBSET = 0x00000000;
enum TTFMFP_SUBSET1 = 0x00000001;
enum TTFMFP_DELTA = 0x00000002;
enum ERR_GENERIC = 0x000003e8;
enum ERR_READOUTOFBOUNDS = 0x000003e9;
enum ERR_WRITEOUTOFBOUNDS = 0x000003ea;
enum ERR_READCONTROL = 0x000003eb;
enum ERR_WRITECONTROL = 0x000003ec;
enum ERR_MEM = 0x000003ed;
enum ERR_FORMAT = 0x000003ee;
enum ERR_WOULD_GROW = 0x000003ef;
enum ERR_VERSION = 0x000003f0;
enum ERR_NO_GLYPHS = 0x000003f1;
enum ERR_INVALID_MERGE_FORMATS = 0x000003f2;
enum ERR_INVALID_MERGE_CHECKSUMS = 0x000003f3;
enum ERR_INVALID_MERGE_NUMGLYPHS = 0x000003f4;
enum ERR_INVALID_DELTA_FORMAT = 0x000003f5;
enum ERR_NOT_TTC = 0x000003f6;
enum ERR_INVALID_TTC_INDEX = 0x000003f7;
enum ERR_MISSING_CMAP = 0x00000406;
enum ERR_MISSING_GLYF = 0x00000407;
enum ERR_MISSING_HEAD = 0x00000408;
enum ERR_MISSING_HHEA = 0x00000409;
enum ERR_MISSING_HMTX = 0x0000040a;
enum ERR_MISSING_LOCA = 0x0000040b;
enum ERR_MISSING_MAXP = 0x0000040c;
enum ERR_MISSING_NAME = 0x0000040d;
enum ERR_MISSING_POST = 0x0000040e;
enum ERR_MISSING_OS2 = 0x0000040f;
enum ERR_MISSING_VHEA = 0x00000410;
enum ERR_MISSING_VMTX = 0x00000411;
enum ERR_MISSING_HHEA_OR_VHEA = 0x00000412;
enum ERR_MISSING_HMTX_OR_VMTX = 0x00000413;
enum ERR_MISSING_EBDT = 0x00000414;
enum ERR_INVALID_CMAP = 0x00000424;
enum ERR_INVALID_GLYF = 0x00000425;
enum ERR_INVALID_HEAD = 0x00000426;
enum ERR_INVALID_HHEA = 0x00000427;
enum ERR_INVALID_HMTX = 0x00000428;
enum ERR_INVALID_LOCA = 0x00000429;
enum ERR_INVALID_MAXP = 0x0000042a;
enum ERR_INVALID_NAME = 0x0000042b;
enum ERR_INVALID_POST = 0x0000042c;
enum ERR_INVALID_OS2 = 0x0000042d;
enum ERR_INVALID_VHEA = 0x0000042e;
enum ERR_INVALID_VMTX = 0x0000042f;
enum ERR_INVALID_HHEA_OR_VHEA = 0x00000430;
enum ERR_INVALID_HMTX_OR_VMTX = 0x00000431;
enum ERR_INVALID_TTO = 0x00000438;
enum ERR_INVALID_GSUB = 0x00000439;
enum ERR_INVALID_GPOS = 0x0000043a;
enum ERR_INVALID_GDEF = 0x0000043b;
enum ERR_INVALID_JSTF = 0x0000043c;
enum ERR_INVALID_BASE = 0x0000043d;
enum ERR_INVALID_EBLC = 0x0000043e;
enum ERR_INVALID_LTSH = 0x0000043f;
enum ERR_INVALID_VDMX = 0x00000440;
enum ERR_INVALID_HDMX = 0x00000441;
enum ERR_PARAMETER0 = 0x0000044c;
enum ERR_PARAMETER1 = 0x0000044d;
enum ERR_PARAMETER2 = 0x0000044e;
enum ERR_PARAMETER3 = 0x0000044f;
enum ERR_PARAMETER4 = 0x00000450;
enum ERR_PARAMETER5 = 0x00000451;
enum ERR_PARAMETER6 = 0x00000452;
enum ERR_PARAMETER7 = 0x00000453;
enum ERR_PARAMETER8 = 0x00000454;
enum ERR_PARAMETER9 = 0x00000455;
enum ERR_PARAMETER10 = 0x00000456;
enum ERR_PARAMETER11 = 0x00000457;
enum ERR_PARAMETER12 = 0x00000458;
enum ERR_PARAMETER13 = 0x00000459;
enum ERR_PARAMETER14 = 0x0000045a;
enum ERR_PARAMETER15 = 0x0000045b;
enum ERR_PARAMETER16 = 0x0000045c;
enum CHARSET_DEFAULT = 0x00000001;
enum CHARSET_GLYPHIDX = 0x00000003;
enum TTEMBED_FAILIFVARIATIONSIMULATED = 0x00000010;
enum TTEMBED_WEBOBJECT = 0x00000080;
enum TTEMBED_XORENCRYPTDATA = 0x10000000;
enum TTEMBED_VARIATIONSIMULATED = 0x00000001;
enum TTEMBED_EUDCEMBEDDED = 0x00000002;
enum TTEMBED_SUBSETCANCEL = 0x00000004;
enum TTLOAD_PRIVATE = 0x00000001;
enum TTLOAD_EUDC_OVERWRITE = 0x00000002;
enum TTLOAD_EUDC_SET = 0x00000004;
enum TTDELETE_DONTREMOVEFONT = 0x00000001;
enum E_NONE = 0x00000000;
enum E_API_NOTIMPL = 0x00000001;
enum E_CHARCODECOUNTINVALID = 0x00000002;
enum E_CHARCODESETINVALID = 0x00000003;
enum E_DEVICETRUETYPEFONT = 0x00000004;
enum E_HDCINVALID = 0x00000006;
enum E_NOFREEMEMORY = 0x00000007;
enum E_FONTREFERENCEINVALID = 0x00000008;
enum E_NOTATRUETYPEFONT = 0x0000000a;
enum E_ERRORACCESSINGFONTDATA = 0x0000000c;
enum E_ERRORACCESSINGFACENAME = 0x0000000d;
enum E_ERRORUNICODECONVERSION = 0x00000011;
enum E_ERRORCONVERTINGCHARS = 0x00000012;
enum E_EXCEPTION = 0x00000013;
enum E_RESERVEDPARAMNOTNULL = 0x00000014;
enum E_CHARSETINVALID = 0x00000015;
enum E_FILE_NOT_FOUND = 0x00000017;
enum E_TTC_INDEX_OUT_OF_RANGE = 0x00000018;
enum E_INPUTPARAMINVALID = 0x00000019;
enum E_ERRORCOMPRESSINGFONTDATA = 0x00000100;
enum E_FONTDATAINVALID = 0x00000102;
enum E_NAMECHANGEFAILED = 0x00000103;
enum E_FONTNOTEMBEDDABLE = 0x00000104;
enum E_PRIVSINVALID = 0x00000105;
enum E_SUBSETTINGFAILED = 0x00000106;
enum E_READFROMSTREAMFAILED = 0x00000107;
enum E_SAVETOSTREAMFAILED = 0x00000108;
enum E_NOOS2 = 0x00000109;
enum E_T2NOFREEMEMORY = 0x0000010a;
enum E_ERRORREADINGFONTDATA = 0x0000010b;
enum E_FLAGSINVALID = 0x0000010c;
enum E_ERRORCREATINGFONTFILE = 0x0000010d;
enum E_FONTALREADYEXISTS = 0x0000010e;
enum E_FONTNAMEALREADYEXISTS = 0x0000010f;
enum E_FONTINSTALLFAILED = 0x00000110;
enum E_ERRORDECOMPRESSINGFONTDATA = 0x00000111;
enum E_ERRORACCESSINGEXCLUDELIST = 0x00000112;
enum E_FACENAMEINVALID = 0x00000113;
enum E_STREAMINVALID = 0x00000114;
enum E_STATUSINVALID = 0x00000115;
enum E_PRIVSTATUSINVALID = 0x00000116;
enum E_PERMISSIONSINVALID = 0x00000117;
enum E_PBENABLEDINVALID = 0x00000118;
enum E_SUBSETTINGEXCEPTION = 0x00000119;
enum E_SUBSTRING_TEST_FAIL = 0x0000011a;
enum E_FONTVARIATIONSIMULATED = 0x0000011b;
enum E_FONTFAMILYNAMENOTINFULL = 0x0000011d;
enum E_ADDFONTFAILED = 0x00000200;
enum E_COULDNTCREATETEMPFILE = 0x00000201;
enum E_FONTFILECREATEFAILED = 0x00000203;
enum E_WINDOWSAPI = 0x00000204;
enum E_FONTFILENOTFOUND = 0x00000205;
enum E_RESOURCEFILECREATEFAILED = 0x00000206;
enum E_ERROREXPANDINGFONTDATA = 0x00000207;
enum E_ERRORGETTINGDC = 0x00000208;
enum E_EXCEPTIONINDECOMPRESSION = 0x00000209;
enum E_EXCEPTIONINCOMPRESSION = 0x0000020a;
alias DRAWEDGE_FLAGS = uint;
enum : uint
{
    BDR_RAISEDOUTER = 0x00000001,
    BDR_SUNKENOUTER = 0x00000002,
    BDR_RAISEDINNER = 0x00000004,
    BDR_SUNKENINNER = 0x00000008,
    BDR_OUTER       = 0x00000003,
    BDR_INNER       = 0x0000000c,
    BDR_RAISED      = 0x00000005,
    BDR_SUNKEN      = 0x0000000a,
    EDGE_RAISED     = 0x00000005,
    EDGE_SUNKEN     = 0x0000000a,
    EDGE_ETCHED     = 0x00000006,
    EDGE_BUMP       = 0x00000009,
}

alias DFC_TYPE = uint;
enum : uint
{
    DFC_CAPTION   = 0x00000001,
    DFC_MENU      = 0x00000002,
    DFC_SCROLL    = 0x00000003,
    DFC_BUTTON    = 0x00000004,
    DFC_POPUPMENU = 0x00000005,
}

alias DFCS_STATE = uint;
enum : uint
{
    DFCS_CAPTIONCLOSE        = 0x00000000,
    DFCS_CAPTIONMIN          = 0x00000001,
    DFCS_CAPTIONMAX          = 0x00000002,
    DFCS_CAPTIONRESTORE      = 0x00000003,
    DFCS_CAPTIONHELP         = 0x00000004,
    DFCS_MENUARROW           = 0x00000000,
    DFCS_MENUCHECK           = 0x00000001,
    DFCS_MENUBULLET          = 0x00000002,
    DFCS_MENUARROWRIGHT      = 0x00000004,
    DFCS_SCROLLUP            = 0x00000000,
    DFCS_SCROLLDOWN          = 0x00000001,
    DFCS_SCROLLLEFT          = 0x00000002,
    DFCS_SCROLLRIGHT         = 0x00000003,
    DFCS_SCROLLCOMBOBOX      = 0x00000005,
    DFCS_SCROLLSIZEGRIP      = 0x00000008,
    DFCS_SCROLLSIZEGRIPRIGHT = 0x00000010,
    DFCS_BUTTONCHECK         = 0x00000000,
    DFCS_BUTTONRADIOIMAGE    = 0x00000001,
    DFCS_BUTTONRADIOMASK     = 0x00000002,
    DFCS_BUTTONRADIO         = 0x00000004,
    DFCS_BUTTON3STATE        = 0x00000008,
    DFCS_BUTTONPUSH          = 0x00000010,
    DFCS_INACTIVE            = 0x00000100,
    DFCS_PUSHED              = 0x00000200,
    DFCS_CHECKED             = 0x00000400,
    DFCS_TRANSPARENT         = 0x00000800,
    DFCS_HOT                 = 0x00001000,
    DFCS_ADJUSTRECT          = 0x00002000,
    DFCS_FLAT                = 0x00004000,
    DFCS_MONO                = 0x00008000,
}

alias CDS_TYPE = uint;
enum : uint
{
    CDS_FULLSCREEN           = 0x00000004,
    CDS_GLOBAL               = 0x00000008,
    CDS_NORESET              = 0x10000000,
    CDS_RESET                = 0x40000000,
    CDS_SET_PRIMARY          = 0x00000010,
    CDS_TEST                 = 0x00000002,
    CDS_UPDATEREGISTRY       = 0x00000001,
    CDS_VIDEOPARAMETERS      = 0x00000020,
    CDS_ENABLE_UNSAFE_MODES  = 0x00000100,
    CDS_DISABLE_UNSAFE_MODES = 0x00000200,
    CDS_RESET_EX             = 0x20000000,
}

alias DISP_CHANGE = int;
enum : int
{
    DISP_CHANGE_SUCCESSFUL  = 0x00000000,
    DISP_CHANGE_RESTART     = 0x00000001,
    DISP_CHANGE_FAILED      = 0xffffffff,
    DISP_CHANGE_BADMODE     = 0xfffffffe,
    DISP_CHANGE_NOTUPDATED  = 0xfffffffd,
    DISP_CHANGE_BADFLAGS    = 0xfffffffc,
    DISP_CHANGE_BADPARAM    = 0xfffffffb,
    DISP_CHANGE_BADDUALVIEW = 0xfffffffa,
}

alias DRAWSTATE_FLAGS = uint;
enum : uint
{
    DST_COMPLEX    = 0x00000000,
    DST_TEXT       = 0x00000001,
    DST_PREFIXTEXT = 0x00000002,
    DST_ICON       = 0x00000003,
    DST_BITMAP     = 0x00000004,
    DSS_NORMAL     = 0x00000000,
    DSS_UNION      = 0x00000010,
    DSS_DISABLED   = 0x00000020,
    DSS_MONO       = 0x00000080,
    DSS_HIDEPREFIX = 0x00000200,
    DSS_PREFIXONLY = 0x00000400,
    DSS_RIGHT      = 0x00008000,
}

alias REDRAW_WINDOW_FLAGS = uint;
enum : uint
{
    RDW_INVALIDATE      = 0x00000001,
    RDW_INTERNALPAINT   = 0x00000002,
    RDW_ERASE           = 0x00000004,
    RDW_VALIDATE        = 0x00000008,
    RDW_NOINTERNALPAINT = 0x00000010,
    RDW_NOERASE         = 0x00000020,
    RDW_NOCHILDREN      = 0x00000040,
    RDW_ALLCHILDREN     = 0x00000080,
    RDW_UPDATENOW       = 0x00000100,
    RDW_ERASENOW        = 0x00000200,
    RDW_FRAME           = 0x00000400,
    RDW_NOFRAME         = 0x00000800,
}

alias ENUM_DISPLAY_SETTINGS_MODE = uint;
enum : uint
{
    ENUM_CURRENT_SETTINGS  = 0xffffffff,
    ENUM_REGISTRY_SETTINGS = 0xfffffffe,
}

alias TEXT_ALIGN_OPTIONS = uint;
enum : uint
{
    TA_NOUPDATECP = 0x00000000,
    TA_UPDATECP   = 0x00000001,
    TA_LEFT       = 0x00000000,
    TA_RIGHT      = 0x00000002,
    TA_CENTER     = 0x00000006,
    TA_TOP        = 0x00000000,
    TA_BOTTOM     = 0x00000008,
    TA_BASELINE   = 0x00000018,
    TA_RTLREADING = 0x00000100,
    TA_MASK       = 0x0000011f,
    VTA_BASELINE  = 0x00000018,
    VTA_LEFT      = 0x00000008,
    VTA_RIGHT     = 0x00000000,
    VTA_CENTER    = 0x00000006,
    VTA_BOTTOM    = 0x00000002,
    VTA_TOP       = 0x00000000,
}

alias PEN_STYLE = int;
enum : int
{
    PS_GEOMETRIC     = 0x00010000,
    PS_COSMETIC      = 0x00000000,
    PS_SOLID         = 0x00000000,
    PS_DASH          = 0x00000001,
    PS_DOT           = 0x00000002,
    PS_DASHDOT       = 0x00000003,
    PS_DASHDOTDOT    = 0x00000004,
    PS_NULL          = 0x00000005,
    PS_INSIDEFRAME   = 0x00000006,
    PS_USERSTYLE     = 0x00000007,
    PS_ALTERNATE     = 0x00000008,
    PS_STYLE_MASK    = 0x0000000f,
    PS_ENDCAP_ROUND  = 0x00000000,
    PS_ENDCAP_SQUARE = 0x00000100,
    PS_ENDCAP_FLAT   = 0x00000200,
    PS_ENDCAP_MASK   = 0x00000f00,
    PS_JOIN_ROUND    = 0x00000000,
    PS_JOIN_BEVEL    = 0x00001000,
    PS_JOIN_MITER    = 0x00002000,
    PS_JOIN_MASK     = 0x0000f000,
    PS_TYPE_MASK     = 0x000f0000,
}

alias TTEMBED_FLAGS = uint;
enum : uint
{
    TTEMBED_EMBEDEUDC    = 0x00000020,
    TTEMBED_RAW          = 0x00000000,
    TTEMBED_SUBSET       = 0x00000001,
    TTEMBED_TTCOMPRESSED = 0x00000004,
}

alias DRAW_TEXT_FORMAT = uint;
enum : uint
{
    DT_BOTTOM               = 0x00000008,
    DT_CALCRECT             = 0x00000400,
    DT_CENTER               = 0x00000001,
    DT_EDITCONTROL          = 0x00002000,
    DT_END_ELLIPSIS         = 0x00008000,
    DT_EXPANDTABS           = 0x00000040,
    DT_EXTERNALLEADING      = 0x00000200,
    DT_HIDEPREFIX           = 0x00100000,
    DT_INTERNAL             = 0x00001000,
    DT_LEFT                 = 0x00000000,
    DT_MODIFYSTRING         = 0x00010000,
    DT_NOCLIP               = 0x00000100,
    DT_NOFULLWIDTHCHARBREAK = 0x00080000,
    DT_NOPREFIX             = 0x00000800,
    DT_PATH_ELLIPSIS        = 0x00004000,
    DT_PREFIXONLY           = 0x00200000,
    DT_RIGHT                = 0x00000002,
    DT_RTLREADING           = 0x00020000,
    DT_SINGLELINE           = 0x00000020,
    DT_TABSTOP              = 0x00000080,
    DT_TOP                  = 0x00000000,
    DT_VCENTER              = 0x00000004,
    DT_WORDBREAK            = 0x00000010,
    DT_WORD_ELLIPSIS        = 0x00040000,
}

alias EMBED_FONT_CHARSET = uint;
enum : uint
{
    CHARSET_UNICODE = 0x00000001,
    CHARSET_SYMBOL  = 0x00000002,
}

alias GET_DCX_FLAGS = uint;
enum : uint
{
    DCX_WINDOW           = 0x00000001,
    DCX_CACHE            = 0x00000002,
    DCX_PARENTCLIP       = 0x00000020,
    DCX_CLIPSIBLINGS     = 0x00000010,
    DCX_CLIPCHILDREN     = 0x00000008,
    DCX_NORESETATTRS     = 0x00000004,
    DCX_LOCKWINDOWUPDATE = 0x00000400,
    DCX_EXCLUDERGN       = 0x00000040,
    DCX_INTERSECTRGN     = 0x00000080,
    DCX_INTERSECTUPDATE  = 0x00000200,
    DCX_VALIDATE         = 0x00200000,
}

alias GET_GLYPH_OUTLINE_FORMAT = uint;
enum : uint
{
    GGO_BEZIER       = 0x00000003,
    GGO_BITMAP       = 0x00000001,
    GGO_GLYPH_INDEX  = 0x00000080,
    GGO_GRAY2_BITMAP = 0x00000004,
    GGO_GRAY4_BITMAP = 0x00000005,
    GGO_GRAY8_BITMAP = 0x00000006,
    GGO_METRICS      = 0x00000000,
    GGO_NATIVE       = 0x00000002,
    GGO_UNHINTED     = 0x00000100,
}

alias SET_BOUNDS_RECT_FLAGS = uint;
enum : uint
{
    DCB_ACCUMULATE = 0x00000002,
    DCB_DISABLE    = 0x00000008,
    DCB_ENABLE     = 0x00000004,
    DCB_RESET      = 0x00000001,
}

alias GET_STOCK_OBJECT_FLAGS = int;
enum : int
{
    BLACK_BRUSH         = 0x00000004,
    DKGRAY_BRUSH        = 0x00000003,
    DC_BRUSH            = 0x00000012,
    GRAY_BRUSH          = 0x00000002,
    HOLLOW_BRUSH        = 0x00000005,
    LTGRAY_BRUSH        = 0x00000001,
    NULL_BRUSH          = 0x00000005,
    WHITE_BRUSH         = 0x00000000,
    BLACK_PEN           = 0x00000007,
    DC_PEN              = 0x00000013,
    NULL_PEN            = 0x00000008,
    WHITE_PEN           = 0x00000006,
    ANSI_FIXED_FONT     = 0x0000000b,
    ANSI_VAR_FONT       = 0x0000000c,
    DEVICE_DEFAULT_FONT = 0x0000000e,
    DEFAULT_GUI_FONT    = 0x00000011,
    OEM_FIXED_FONT      = 0x0000000a,
    SYSTEM_FONT         = 0x0000000d,
    SYSTEM_FIXED_FONT   = 0x00000010,
    DEFAULT_PALETTE     = 0x0000000f,
}

alias MODIFY_WORLD_TRANSFORM_MODE = uint;
enum : uint
{
    MWT_IDENTITY      = 0x00000001,
    MWT_LEFTMULTIPLY  = 0x00000002,
    MWT_RIGHTMULTIPLY = 0x00000003,
}

alias FONT_CLIP_PRECISION = ubyte;
enum : ubyte
{
    CLIP_DEFAULT_PRECIS   = 0x00,
    CLIP_CHARACTER_PRECIS = 0x01,
    CLIP_STROKE_PRECIS    = 0x02,
    CLIP_MASK             = 0x0f,
    CLIP_LH_ANGLES        = 0x10,
    CLIP_TT_ALWAYS        = 0x20,
    CLIP_DFA_DISABLE      = 0x40,
    CLIP_EMBEDDED         = 0x80,
    CLIP_DFA_OVERRIDE     = 0x40,
}

alias CREATE_POLYGON_RGN_MODE = int;
enum : int
{
    ALTERNATE = 0x00000001,
    WINDING   = 0x00000002,
}

alias EMBEDDED_FONT_PRIV_STATUS = uint;
enum : uint
{
    EMBED_PREVIEWPRINT = 0x00000001,
    EMBED_EDITABLE     = 0x00000002,
    EMBED_INSTALLABLE  = 0x00000003,
    EMBED_NOEMBEDDING  = 0x00000004,
}

alias MONITOR_FROM_FLAGS = uint;
enum : uint
{
    MONITOR_DEFAULTTONEAREST = 0x00000002,
    MONITOR_DEFAULTTONULL    = 0x00000000,
    MONITOR_DEFAULTTOPRIMARY = 0x00000001,
}

alias FONT_RESOURCE_CHARACTERISTICS = uint;
enum : uint
{
    FR_PRIVATE  = 0x00000010,
    FR_NOT_ENUM = 0x00000020,
}

alias DC_LAYOUT = uint;
enum : uint
{
    LAYOUT_BITMAPORIENTATIONPRESERVED = 0x00000008,
    LAYOUT_RTL                        = 0x00000001,
}

alias GET_DEVICE_CAPS_INDEX = uint;
enum : uint
{
    DRIVERVERSION   = 0x00000000,
    TECHNOLOGY      = 0x00000002,
    HORZSIZE        = 0x00000004,
    VERTSIZE        = 0x00000006,
    HORZRES         = 0x00000008,
    VERTRES         = 0x0000000a,
    BITSPIXEL       = 0x0000000c,
    PLANES          = 0x0000000e,
    NUMBRUSHES      = 0x00000010,
    NUMPENS         = 0x00000012,
    NUMMARKERS      = 0x00000014,
    NUMFONTS        = 0x00000016,
    NUMCOLORS       = 0x00000018,
    PDEVICESIZE     = 0x0000001a,
    CURVECAPS       = 0x0000001c,
    LINECAPS        = 0x0000001e,
    POLYGONALCAPS   = 0x00000020,
    TEXTCAPS        = 0x00000022,
    CLIPCAPS        = 0x00000024,
    RASTERCAPS      = 0x00000026,
    ASPECTX         = 0x00000028,
    ASPECTY         = 0x0000002a,
    ASPECTXY        = 0x0000002c,
    LOGPIXELSX      = 0x00000058,
    LOGPIXELSY      = 0x0000005a,
    SIZEPALETTE     = 0x00000068,
    NUMRESERVED     = 0x0000006a,
    COLORRES        = 0x0000006c,
    PHYSICALWIDTH   = 0x0000006e,
    PHYSICALHEIGHT  = 0x0000006f,
    PHYSICALOFFSETX = 0x00000070,
    PHYSICALOFFSETY = 0x00000071,
    SCALINGFACTORX  = 0x00000072,
    SCALINGFACTORY  = 0x00000073,
    VREFRESH        = 0x00000074,
    DESKTOPVERTRES  = 0x00000075,
    DESKTOPHORZRES  = 0x00000076,
    BLTALIGNMENT    = 0x00000077,
    SHADEBLENDCAPS  = 0x00000078,
    COLORMGMTCAPS   = 0x00000079,
}

alias FONT_OUTPUT_PRECISION = ubyte;
enum : ubyte
{
    OUT_DEFAULT_PRECIS        = 0x00,
    OUT_STRING_PRECIS         = 0x01,
    OUT_CHARACTER_PRECIS      = 0x02,
    OUT_STROKE_PRECIS         = 0x03,
    OUT_TT_PRECIS             = 0x04,
    OUT_DEVICE_PRECIS         = 0x05,
    OUT_RASTER_PRECIS         = 0x06,
    OUT_TT_ONLY_PRECIS        = 0x07,
    OUT_OUTLINE_PRECIS        = 0x08,
    OUT_SCREEN_OUTLINE_PRECIS = 0x09,
    OUT_PS_ONLY_PRECIS        = 0x0a,
}

alias FONT_WEIGHT = uint;
enum : uint
{
    FW_DONTCARE   = 0x00000000,
    FW_THIN       = 0x00000064,
    FW_EXTRALIGHT = 0x000000c8,
    FW_LIGHT      = 0x0000012c,
    FW_NORMAL     = 0x00000190,
    FW_MEDIUM     = 0x000001f4,
    FW_SEMIBOLD   = 0x00000258,
    FW_BOLD       = 0x000002bc,
    FW_EXTRABOLD  = 0x00000320,
    FW_HEAVY      = 0x00000384,
    FW_ULTRALIGHT = 0x000000c8,
    FW_REGULAR    = 0x00000190,
    FW_DEMIBOLD   = 0x00000258,
    FW_ULTRABOLD  = 0x00000320,
    FW_BLACK      = 0x00000384,
}

alias FONT_CHARSET = ubyte;
enum : ubyte
{
    ANSI_CHARSET        = 0x00,
    DEFAULT_CHARSET     = 0x01,
    SYMBOL_CHARSET      = 0x02,
    SHIFTJIS_CHARSET    = 0x80,
    HANGEUL_CHARSET     = 0x81,
    HANGUL_CHARSET      = 0x81,
    GB2312_CHARSET      = 0x86,
    CHINESEBIG5_CHARSET = 0x88,
    OEM_CHARSET         = 0xff,
    JOHAB_CHARSET       = 0x82,
    HEBREW_CHARSET      = 0xb1,
    ARABIC_CHARSET      = 0xb2,
    GREEK_CHARSET       = 0xa1,
    TURKISH_CHARSET     = 0xa2,
    VIETNAMESE_CHARSET  = 0xa3,
    THAI_CHARSET        = 0xde,
    EASTEUROPE_CHARSET  = 0xee,
    RUSSIAN_CHARSET     = 0xcc,
    MAC_CHARSET         = 0x4d,
    BALTIC_CHARSET      = 0xba,
}

alias ARC_DIRECTION = int;
enum : int
{
    AD_COUNTERCLOCKWISE = 0x00000001,
    AD_CLOCKWISE        = 0x00000002,
}

alias TTLOAD_EMBEDDED_FONT_STATUS = uint;
enum : uint
{
    TTLOAD_FONT_SUBSETTED     = 0x00000001,
    TTLOAD_FONT_IN_SYSSTARTUP = 0x00000002,
}

alias STRETCH_BLT_MODE = int;
enum : int
{
    BLACKONWHITE        = 0x00000001,
    COLORONCOLOR        = 0x00000003,
    HALFTONE            = 0x00000004,
    STRETCH_ANDSCANS    = 0x00000001,
    STRETCH_DELETESCANS = 0x00000003,
    STRETCH_HALFTONE    = 0x00000004,
    STRETCH_ORSCANS     = 0x00000002,
    WHITEONBLACK        = 0x00000002,
}

alias FONT_QUALITY = ubyte;
enum : ubyte
{
    DEFAULT_QUALITY        = 0x00,
    DRAFT_QUALITY          = 0x01,
    PROOF_QUALITY          = 0x02,
    NONANTIALIASED_QUALITY = 0x03,
    ANTIALIASED_QUALITY    = 0x04,
    CLEARTYPE_QUALITY      = 0x05,
}

alias BACKGROUND_MODE = uint;
enum : uint
{
    OPAQUE      = 0x00000002,
    TRANSPARENT = 0x00000001,
}

alias GET_CHARACTER_PLACEMENT_FLAGS = uint;
enum : uint
{
    GCP_CLASSIN         = 0x00080000,
    GCP_DIACRITIC       = 0x00000100,
    GCP_DISPLAYZWG      = 0x00400000,
    GCP_GLYPHSHAPE      = 0x00000010,
    GCP_JUSTIFY         = 0x00010000,
    GCP_KASHIDA         = 0x00000400,
    GCP_LIGATE          = 0x00000020,
    GCP_MAXEXTENT       = 0x00100000,
    GCP_NEUTRALOVERRIDE = 0x02000000,
    GCP_NUMERICOVERRIDE = 0x01000000,
    GCP_NUMERICSLATIN   = 0x04000000,
    GCP_NUMERICSLOCAL   = 0x08000000,
    GCP_REORDER         = 0x00000002,
    GCP_SYMSWAPOFF      = 0x00800000,
    GCP_USEKERNING      = 0x00000008,
}

alias DRAW_EDGE_FLAGS = uint;
enum : uint
{
    BF_ADJUST                  = 0x00002000,
    BF_BOTTOM                  = 0x00000008,
    BF_BOTTOMLEFT              = 0x00000009,
    BF_BOTTOMRIGHT             = 0x0000000c,
    BF_DIAGONAL                = 0x00000010,
    BF_DIAGONAL_ENDBOTTOMLEFT  = 0x00000019,
    BF_DIAGONAL_ENDBOTTOMRIGHT = 0x0000001c,
    BF_DIAGONAL_ENDTOPLEFT     = 0x00000013,
    BF_DIAGONAL_ENDTOPRIGHT    = 0x00000016,
    BF_FLAT                    = 0x00004000,
    BF_LEFT                    = 0x00000001,
    BF_MIDDLE                  = 0x00000800,
    BF_MONO                    = 0x00008000,
    BF_RECT                    = 0x0000000f,
    BF_RIGHT                   = 0x00000004,
    BF_SOFT                    = 0x00001000,
    BF_TOP                     = 0x00000002,
    BF_TOPLEFT                 = 0x00000003,
    BF_TOPRIGHT                = 0x00000006,
}

alias SYS_COLOR_INDEX = int;
enum : int
{
    COLOR_SCROLLBAR               = 0x00000000,
    COLOR_BACKGROUND              = 0x00000001,
    COLOR_ACTIVECAPTION           = 0x00000002,
    COLOR_INACTIVECAPTION         = 0x00000003,
    COLOR_MENU                    = 0x00000004,
    COLOR_WINDOW                  = 0x00000005,
    COLOR_WINDOWFRAME             = 0x00000006,
    COLOR_MENUTEXT                = 0x00000007,
    COLOR_WINDOWTEXT              = 0x00000008,
    COLOR_CAPTIONTEXT             = 0x00000009,
    COLOR_ACTIVEBORDER            = 0x0000000a,
    COLOR_INACTIVEBORDER          = 0x0000000b,
    COLOR_APPWORKSPACE            = 0x0000000c,
    COLOR_HIGHLIGHT               = 0x0000000d,
    COLOR_HIGHLIGHTTEXT           = 0x0000000e,
    COLOR_BTNFACE                 = 0x0000000f,
    COLOR_BTNSHADOW               = 0x00000010,
    COLOR_GRAYTEXT                = 0x00000011,
    COLOR_BTNTEXT                 = 0x00000012,
    COLOR_INACTIVECAPTIONTEXT     = 0x00000013,
    COLOR_BTNHIGHLIGHT            = 0x00000014,
    COLOR_3DDKSHADOW              = 0x00000015,
    COLOR_3DLIGHT                 = 0x00000016,
    COLOR_INFOTEXT                = 0x00000017,
    COLOR_INFOBK                  = 0x00000018,
    COLOR_HOTLIGHT                = 0x0000001a,
    COLOR_GRADIENTACTIVECAPTION   = 0x0000001b,
    COLOR_GRADIENTINACTIVECAPTION = 0x0000001c,
    COLOR_MENUHILIGHT             = 0x0000001d,
    COLOR_MENUBAR                 = 0x0000001e,
    COLOR_DESKTOP                 = 0x00000001,
    COLOR_3DFACE                  = 0x0000000f,
    COLOR_3DSHADOW                = 0x00000010,
    COLOR_3DHIGHLIGHT             = 0x00000014,
    COLOR_3DHILIGHT               = 0x00000014,
    COLOR_BTNHILIGHT              = 0x00000014,
}

alias FONT_LICENSE_PRIVS = uint;
enum : uint
{
    LICENSE_PREVIEWPRINT = 0x00000004,
    LICENSE_EDITABLE     = 0x00000008,
    LICENSE_INSTALLABLE  = 0x00000000,
    LICENSE_NOEMBEDDING  = 0x00000002,
    LICENSE_DEFAULT      = 0x00000000,
}

alias GRADIENT_FILL = uint;
enum : uint
{
    GRADIENT_FILL_RECT_H   = 0x00000000,
    GRADIENT_FILL_RECT_V   = 0x00000001,
    GRADIENT_FILL_TRIANGLE = 0x00000002,
}

alias CREATE_FONT_PACKAGE_SUBSET_ENCODING = short;
enum : short
{
    TTFCFP_STD_MAC_CHAR_SET = 0x0000,
    TTFCFP_SYMBOL_CHAR_SET  = 0x0000,
    TTFCFP_UNICODE_CHAR_SET = 0x0001,
}

alias EXT_FLOOD_FILL_TYPE = uint;
enum : uint
{
    FLOODFILLBORDER  = 0x00000000,
    FLOODFILLSURFACE = 0x00000001,
}

alias HATCH_BRUSH_STYLE = int;
enum : int
{
    HS_BDIAGONAL  = 0x00000003,
    HS_CROSS      = 0x00000004,
    HS_DIAGCROSS  = 0x00000005,
    HS_FDIAGONAL  = 0x00000002,
    HS_HORIZONTAL = 0x00000000,
    HS_VERTICAL   = 0x00000001,
}

alias DRAW_CAPTION_FLAGS = uint;
enum : uint
{
    DC_ACTIVE   = 0x00000001,
    DC_BUTTONS  = 0x00001000,
    DC_GRADIENT = 0x00000020,
    DC_ICON     = 0x00000004,
    DC_INBUTTON = 0x00000010,
    DC_SMALLCAP = 0x00000002,
    DC_TEXT     = 0x00000008,
}

alias SYSTEM_PALETTE_USE = uint;
enum : uint
{
    SYSPAL_NOSTATIC    = 0x00000002,
    SYSPAL_NOSTATIC256 = 0x00000003,
    SYSPAL_STATIC      = 0x00000001,
}

alias GRAPHICS_MODE = int;
enum : int
{
    GM_COMPATIBLE = 0x00000001,
    GM_ADVANCED   = 0x00000002,
}

alias FONT_PITCH = ubyte;
enum : ubyte
{
    DEFAULT_PITCH  = 0x00,
    FIXED_PITCH    = 0x01,
    VARIABLE_PITCH = 0x02,
}

alias FONT_FAMILY = ubyte;
enum : ubyte
{
    FF_DECORATIVE = 0x50,
    FF_DONTCARE   = 0x00,
    FF_MODERN     = 0x30,
    FF_ROMAN      = 0x10,
    FF_SCRIPT     = 0x40,
    FF_SWISS      = 0x20,
}

alias ROP_CODE = uint;
enum : uint
{
    BLACKNESS      = 0x00000042,
    NOTSRCERASE    = 0x001100a6,
    NOTSRCCOPY     = 0x00330008,
    SRCERASE       = 0x00440328,
    DSTINVERT      = 0x00550009,
    PATINVERT      = 0x005a0049,
    SRCINVERT      = 0x00660046,
    SRCAND         = 0x008800c6,
    MERGEPAINT     = 0x00bb0226,
    MERGECOPY      = 0x00c000ca,
    SRCCOPY        = 0x00cc0020,
    SRCPAINT       = 0x00ee0086,
    PATCOPY        = 0x00f00021,
    PATPAINT       = 0x00fb0a09,
    WHITENESS      = 0x00ff0062,
    CAPTUREBLT     = 0x40000000,
    NOMIRRORBITMAP = 0x80000000,
}

alias CREATE_FONT_PACKAGE_SUBSET_PLATFORM = short;
enum : short
{
    TTFCFP_UNICODE_PLATFORMID = 0x0000,
    TTFCFP_ISO_PLATFORMID     = 0x0002,
}

alias HDC_MAP_MODE = int;
enum : int
{
    MM_ANISOTROPIC = 0x00000008,
    MM_HIENGLISH   = 0x00000005,
    MM_HIMETRIC    = 0x00000003,
    MM_ISOTROPIC   = 0x00000007,
    MM_LOENGLISH   = 0x00000004,
    MM_LOMETRIC    = 0x00000002,
    MM_TEXT        = 0x00000001,
    MM_TWIPS       = 0x00000006,
}

alias GDI_REGION_TYPE = int;
enum : int
{
    RGN_ERROR     = 0x00000000,
    NULLREGION    = 0x00000001,
    SIMPLEREGION  = 0x00000002,
    COMPLEXREGION = 0x00000003,
}

alias BRUSH_STYLE = uint;
enum : uint
{
    BS_SOLID         = 0x00000000,
    BS_NULL          = 0x00000001,
    BS_HOLLOW        = 0x00000001,
    BS_HATCHED       = 0x00000002,
    BS_PATTERN       = 0x00000003,
    BS_INDEXED       = 0x00000004,
    BS_DIBPATTERN    = 0x00000005,
    BS_DIBPATTERNPT  = 0x00000006,
    BS_PATTERN8X8    = 0x00000007,
    BS_DIBPATTERN8X8 = 0x00000008,
    BS_MONOPATTERN   = 0x00000009,
}

alias TMPF_FLAGS = ubyte;
enum : ubyte
{
    TMPF_FIXED_PITCH = 0x01,
    TMPF_VECTOR      = 0x02,
    TMPF_DEVICE      = 0x08,
    TMPF_TRUETYPE    = 0x04,
}

alias BI_COMPRESSION = uint;
enum : uint
{
    BI_RGB       = 0x00000000,
    BI_RLE8      = 0x00000001,
    BI_RLE4      = 0x00000002,
    BI_BITFIELDS = 0x00000003,
    BI_JPEG      = 0x00000004,
    BI_PNG       = 0x00000005,
}

alias ENHANCED_METAFILE_RECORD_TYPE = uint;
enum : uint
{
    EMR_HEADER                  = 0x00000001,
    EMR_POLYBEZIER              = 0x00000002,
    EMR_POLYGON                 = 0x00000003,
    EMR_POLYLINE                = 0x00000004,
    EMR_POLYBEZIERTO            = 0x00000005,
    EMR_POLYLINETO              = 0x00000006,
    EMR_POLYPOLYLINE            = 0x00000007,
    EMR_POLYPOLYGON             = 0x00000008,
    EMR_SETWINDOWEXTEX          = 0x00000009,
    EMR_SETWINDOWORGEX          = 0x0000000a,
    EMR_SETVIEWPORTEXTEX        = 0x0000000b,
    EMR_SETVIEWPORTORGEX        = 0x0000000c,
    EMR_SETBRUSHORGEX           = 0x0000000d,
    EMR_EOF                     = 0x0000000e,
    EMR_SETPIXELV               = 0x0000000f,
    EMR_SETMAPPERFLAGS          = 0x00000010,
    EMR_SETMAPMODE              = 0x00000011,
    EMR_SETBKMODE               = 0x00000012,
    EMR_SETPOLYFILLMODE         = 0x00000013,
    EMR_SETROP2                 = 0x00000014,
    EMR_SETSTRETCHBLTMODE       = 0x00000015,
    EMR_SETTEXTALIGN            = 0x00000016,
    EMR_SETCOLORADJUSTMENT      = 0x00000017,
    EMR_SETTEXTCOLOR            = 0x00000018,
    EMR_SETBKCOLOR              = 0x00000019,
    EMR_OFFSETCLIPRGN           = 0x0000001a,
    EMR_MOVETOEX                = 0x0000001b,
    EMR_SETMETARGN              = 0x0000001c,
    EMR_EXCLUDECLIPRECT         = 0x0000001d,
    EMR_INTERSECTCLIPRECT       = 0x0000001e,
    EMR_SCALEVIEWPORTEXTEX      = 0x0000001f,
    EMR_SCALEWINDOWEXTEX        = 0x00000020,
    EMR_SAVEDC                  = 0x00000021,
    EMR_RESTOREDC               = 0x00000022,
    EMR_SETWORLDTRANSFORM       = 0x00000023,
    EMR_MODIFYWORLDTRANSFORM    = 0x00000024,
    EMR_SELECTOBJECT            = 0x00000025,
    EMR_CREATEPEN               = 0x00000026,
    EMR_CREATEBRUSHINDIRECT     = 0x00000027,
    EMR_DELETEOBJECT            = 0x00000028,
    EMR_ANGLEARC                = 0x00000029,
    EMR_ELLIPSE                 = 0x0000002a,
    EMR_RECTANGLE               = 0x0000002b,
    EMR_ROUNDRECT               = 0x0000002c,
    EMR_ARC                     = 0x0000002d,
    EMR_CHORD                   = 0x0000002e,
    EMR_PIE                     = 0x0000002f,
    EMR_SELECTPALETTE           = 0x00000030,
    EMR_CREATEPALETTE           = 0x00000031,
    EMR_SETPALETTEENTRIES       = 0x00000032,
    EMR_RESIZEPALETTE           = 0x00000033,
    EMR_REALIZEPALETTE          = 0x00000034,
    EMR_EXTFLOODFILL            = 0x00000035,
    EMR_LINETO                  = 0x00000036,
    EMR_ARCTO                   = 0x00000037,
    EMR_POLYDRAW                = 0x00000038,
    EMR_SETARCDIRECTION         = 0x00000039,
    EMR_SETMITERLIMIT           = 0x0000003a,
    EMR_BEGINPATH               = 0x0000003b,
    EMR_ENDPATH                 = 0x0000003c,
    EMR_CLOSEFIGURE             = 0x0000003d,
    EMR_FILLPATH                = 0x0000003e,
    EMR_STROKEANDFILLPATH       = 0x0000003f,
    EMR_STROKEPATH              = 0x00000040,
    EMR_FLATTENPATH             = 0x00000041,
    EMR_WIDENPATH               = 0x00000042,
    EMR_SELECTCLIPPATH          = 0x00000043,
    EMR_ABORTPATH               = 0x00000044,
    EMR_GDICOMMENT              = 0x00000046,
    EMR_FILLRGN                 = 0x00000047,
    EMR_FRAMERGN                = 0x00000048,
    EMR_INVERTRGN               = 0x00000049,
    EMR_PAINTRGN                = 0x0000004a,
    EMR_EXTSELECTCLIPRGN        = 0x0000004b,
    EMR_BITBLT                  = 0x0000004c,
    EMR_STRETCHBLT              = 0x0000004d,
    EMR_MASKBLT                 = 0x0000004e,
    EMR_PLGBLT                  = 0x0000004f,
    EMR_SETDIBITSTODEVICE       = 0x00000050,
    EMR_STRETCHDIBITS           = 0x00000051,
    EMR_EXTCREATEFONTINDIRECTW  = 0x00000052,
    EMR_EXTTEXTOUTA             = 0x00000053,
    EMR_EXTTEXTOUTW             = 0x00000054,
    EMR_POLYBEZIER16            = 0x00000055,
    EMR_POLYGON16               = 0x00000056,
    EMR_POLYLINE16              = 0x00000057,
    EMR_POLYBEZIERTO16          = 0x00000058,
    EMR_POLYLINETO16            = 0x00000059,
    EMR_POLYPOLYLINE16          = 0x0000005a,
    EMR_POLYPOLYGON16           = 0x0000005b,
    EMR_POLYDRAW16              = 0x0000005c,
    EMR_CREATEMONOBRUSH         = 0x0000005d,
    EMR_CREATEDIBPATTERNBRUSHPT = 0x0000005e,
    EMR_EXTCREATEPEN            = 0x0000005f,
    EMR_POLYTEXTOUTA            = 0x00000060,
    EMR_POLYTEXTOUTW            = 0x00000061,
    EMR_SETICMMODE              = 0x00000062,
    EMR_CREATECOLORSPACE        = 0x00000063,
    EMR_SETCOLORSPACE           = 0x00000064,
    EMR_DELETECOLORSPACE        = 0x00000065,
    EMR_GLSRECORD               = 0x00000066,
    EMR_GLSBOUNDEDRECORD        = 0x00000067,
    EMR_PIXELFORMAT             = 0x00000068,
    EMR_RESERVED_105            = 0x00000069,
    EMR_RESERVED_106            = 0x0000006a,
    EMR_RESERVED_107            = 0x0000006b,
    EMR_RESERVED_108            = 0x0000006c,
    EMR_RESERVED_109            = 0x0000006d,
    EMR_RESERVED_110            = 0x0000006e,
    EMR_COLORCORRECTPALETTE     = 0x0000006f,
    EMR_SETICMPROFILEA          = 0x00000070,
    EMR_SETICMPROFILEW          = 0x00000071,
    EMR_ALPHABLEND              = 0x00000072,
    EMR_SETLAYOUT               = 0x00000073,
    EMR_TRANSPARENTBLT          = 0x00000074,
    EMR_RESERVED_117            = 0x00000075,
    EMR_GRADIENTFILL            = 0x00000076,
    EMR_RESERVED_119            = 0x00000077,
    EMR_RESERVED_120            = 0x00000078,
    EMR_COLORMATCHTOTARGETW     = 0x00000079,
    EMR_CREATECOLORSPACEW       = 0x0000007a,
    EMR_MIN                     = 0x00000001,
    EMR_MAX                     = 0x0000007a,
}

alias DEVMODE_FIELD_FLAGS = uint;
enum : uint
{
    DM_SPECVERSION        = 0x00000401,
    DM_ORIENTATION        = 0x00000001,
    DM_PAPERSIZE          = 0x00000002,
    DM_PAPERLENGTH        = 0x00000004,
    DM_PAPERWIDTH         = 0x00000008,
    DM_SCALE              = 0x00000010,
    DM_POSITION           = 0x00000020,
    DM_NUP                = 0x00000040,
    DM_DISPLAYORIENTATION = 0x00000080,
    DM_COPIES             = 0x00000100,
    DM_DEFAULTSOURCE      = 0x00000200,
    DM_PRINTQUALITY       = 0x00000400,
    DM_COLOR              = 0x00000800,
    DM_DUPLEX             = 0x00001000,
    DM_YRESOLUTION        = 0x00002000,
    DM_TTOPTION           = 0x00004000,
    DM_COLLATE            = 0x00008000,
    DM_FORMNAME           = 0x00010000,
    DM_LOGPIXELS          = 0x00020000,
    DM_BITSPERPEL         = 0x00040000,
    DM_PELSWIDTH          = 0x00080000,
    DM_PELSHEIGHT         = 0x00100000,
    DM_DISPLAYFLAGS       = 0x00200000,
    DM_DISPLAYFREQUENCY   = 0x00400000,
    DM_ICMMETHOD          = 0x00800000,
    DM_ICMINTENT          = 0x01000000,
    DM_MEDIATYPE          = 0x02000000,
    DM_DITHERTYPE         = 0x04000000,
    DM_PANNINGWIDTH       = 0x08000000,
    DM_PANNINGHEIGHT      = 0x10000000,
    DM_DISPLAYFIXEDOUTPUT = 0x20000000,
    DM_INTERLACED         = 0x00000002,
    DM_UPDATE             = 0x00000001,
    DM_COPY               = 0x00000002,
    DM_PROMPT             = 0x00000004,
    DM_MODIFY             = 0x00000008,
    DM_IN_BUFFER          = 0x00000008,
    DM_IN_PROMPT          = 0x00000004,
    DM_OUT_BUFFER         = 0x00000002,
    DM_OUT_DEFAULT        = 0x00000001,
}

alias DEVMODE_COLOR = short;
enum : short
{
    DMCOLOR_MONOCHROME = 0x0001,
    DMCOLOR_COLOR      = 0x0002,
}

alias DEVMODE_DUPLEX = short;
enum : short
{
    DMDUP_SIMPLEX    = 0x0001,
    DMDUP_VERTICAL   = 0x0002,
    DMDUP_HORIZONTAL = 0x0003,
}

alias DEVMODE_COLLATE = short;
enum : short
{
    DMCOLLATE_FALSE = 0x0000,
    DMCOLLATE_TRUE  = 0x0001,
}

alias DEVMODE_DISPLAY_ORIENTATION = uint;
enum : uint
{
    DMDO_DEFAULT = 0x00000000,
    DMDO_90      = 0x00000001,
    DMDO_180     = 0x00000002,
    DMDO_270     = 0x00000003,
}

alias DEVMODE_DISPLAY_FIXED_OUTPUT = uint;
enum : uint
{
    DMDFO_DEFAULT = 0x00000000,
    DMDFO_STRETCH = 0x00000001,
    DMDFO_CENTER  = 0x00000002,
}

alias DEVMODE_TRUETYPE_OPTION = short;
enum : short
{
    DMTT_BITMAP           = 0x0001,
    DMTT_DOWNLOAD         = 0x0002,
    DMTT_SUBDEV           = 0x0003,
    DMTT_DOWNLOAD_OUTLINE = 0x0004,
}

alias PAN_FAMILY_TYPE = ubyte;
enum : ubyte
{
    PAN_FAMILY_ANY          = 0x00,
    PAN_FAMILY_NO_FIT       = 0x01,
    PAN_FAMILY_TEXT_DISPLAY = 0x02,
    PAN_FAMILY_SCRIPT       = 0x03,
    PAN_FAMILY_DECORATIVE   = 0x04,
    PAN_FAMILY_PICTORIAL    = 0x05,
}

alias PAN_SERIF_STYLE = ubyte;
enum : ubyte
{
    PAN_SERIF_ANY                = 0x00,
    PAN_SERIF_NO_FIT             = 0x01,
    PAN_SERIF_COVE               = 0x02,
    PAN_SERIF_OBTUSE_COVE        = 0x03,
    PAN_SERIF_SQUARE_COVE        = 0x04,
    PAN_SERIF_OBTUSE_SQUARE_COVE = 0x05,
    PAN_SERIF_SQUARE             = 0x06,
    PAN_SERIF_THIN               = 0x07,
    PAN_SERIF_BONE               = 0x08,
    PAN_SERIF_EXAGGERATED        = 0x09,
    PAN_SERIF_TRIANGLE           = 0x0a,
    PAN_SERIF_NORMAL_SANS        = 0x0b,
    PAN_SERIF_OBTUSE_SANS        = 0x0c,
    PAN_SERIF_PERP_SANS          = 0x0d,
    PAN_SERIF_FLARED             = 0x0e,
    PAN_SERIF_ROUNDED            = 0x0f,
}

alias PAN_WEIGHT = ubyte;
enum : ubyte
{
    PAN_WEIGHT_ANY        = 0x00,
    PAN_WEIGHT_NO_FIT     = 0x01,
    PAN_WEIGHT_INDEX      = 0x02,
    PAN_WEIGHT_VERY_LIGHT = 0x02,
    PAN_WEIGHT_LIGHT      = 0x03,
    PAN_WEIGHT_THIN       = 0x04,
    PAN_WEIGHT_BOOK       = 0x05,
    PAN_WEIGHT_MEDIUM     = 0x06,
    PAN_WEIGHT_DEMI       = 0x07,
    PAN_WEIGHT_BOLD       = 0x08,
    PAN_WEIGHT_HEAVY      = 0x09,
    PAN_WEIGHT_BLACK      = 0x0a,
    PAN_WEIGHT_NORD       = 0x0b,
}

alias PAN_STROKE_VARIATION = ubyte;
enum : ubyte
{
    PAN_STROKE_ANY          = 0x00,
    PAN_STROKE_NO_FIT       = 0x01,
    PAN_STROKE_GRADUAL_DIAG = 0x02,
    PAN_STROKE_GRADUAL_TRAN = 0x03,
    PAN_STROKE_GRADUAL_VERT = 0x04,
    PAN_STROKE_GRADUAL_HORZ = 0x05,
    PAN_STROKE_RAPID_VERT   = 0x06,
    PAN_STROKE_RAPID_HORZ   = 0x07,
    PAN_STROKE_INSTANT_VERT = 0x08,
}

alias PAN_PROPORTION = ubyte;
enum : ubyte
{
    PAN_PROP_ANY            = 0x00,
    PAN_PROP_NO_FIT         = 0x01,
    PAN_PROP_OLD_STYLE      = 0x02,
    PAN_PROP_MODERN         = 0x03,
    PAN_PROP_EVEN_WIDTH     = 0x04,
    PAN_PROP_EXPANDED       = 0x05,
    PAN_PROP_CONDENSED      = 0x06,
    PAN_PROP_VERY_EXPANDED  = 0x07,
    PAN_PROP_VERY_CONDENSED = 0x08,
    PAN_PROP_MONOSPACED     = 0x09,
}

alias PAN_CONTRAST = ubyte;
enum : ubyte
{
    PAN_CONTRAST_ANY         = 0x00,
    PAN_CONTRAST_NO_FIT      = 0x01,
    PAN_CONTRAST_INDEX       = 0x04,
    PAN_CONTRAST_NONE        = 0x02,
    PAN_CONTRAST_VERY_LOW    = 0x03,
    PAN_CONTRAST_LOW         = 0x04,
    PAN_CONTRAST_MEDIUM_LOW  = 0x05,
    PAN_CONTRAST_MEDIUM      = 0x06,
    PAN_CONTRAST_MEDIUM_HIGH = 0x07,
    PAN_CONTRAST_HIGH        = 0x08,
    PAN_CONTRAST_VERY_HIGH   = 0x09,
}

alias PAN_ARM_STYLE = ubyte;
enum : ubyte
{
    PAN_ARM_ANY                    = 0x00,
    PAN_ARM_NO_FIT                 = 0x01,
    PAN_STRAIGHT_ARMS_HORZ         = 0x02,
    PAN_STRAIGHT_ARMS_WEDGE        = 0x03,
    PAN_STRAIGHT_ARMS_VERT         = 0x04,
    PAN_STRAIGHT_ARMS_SINGLE_SERIF = 0x05,
    PAN_STRAIGHT_ARMS_DOUBLE_SERIF = 0x06,
    PAN_BENT_ARMS_HORZ             = 0x07,
    PAN_BENT_ARMS_WEDGE            = 0x08,
    PAN_BENT_ARMS_VERT             = 0x09,
    PAN_BENT_ARMS_SINGLE_SERIF     = 0x0a,
    PAN_BENT_ARMS_DOUBLE_SERIF     = 0x0b,
}

alias PAN_LETT_FORM = ubyte;
enum : ubyte
{
    PAN_LETT_FORM_ANY           = 0x00,
    PAN_LETT_FORM_NO_FIT        = 0x01,
    PAN_LETT_NORMAL_CONTACT     = 0x02,
    PAN_LETT_NORMAL_WEIGHTED    = 0x03,
    PAN_LETT_NORMAL_BOXED       = 0x04,
    PAN_LETT_NORMAL_FLATTENED   = 0x05,
    PAN_LETT_NORMAL_ROUNDED     = 0x06,
    PAN_LETT_NORMAL_OFF_CENTER  = 0x07,
    PAN_LETT_NORMAL_SQUARE      = 0x08,
    PAN_LETT_OBLIQUE_CONTACT    = 0x09,
    PAN_LETT_OBLIQUE_WEIGHTED   = 0x0a,
    PAN_LETT_OBLIQUE_BOXED      = 0x0b,
    PAN_LETT_OBLIQUE_FLATTENED  = 0x0c,
    PAN_LETT_OBLIQUE_ROUNDED    = 0x0d,
    PAN_LETT_OBLIQUE_OFF_CENTER = 0x0e,
    PAN_LETT_OBLIQUE_SQUARE     = 0x0f,
}

alias PAN_MIDLINE = ubyte;
enum : ubyte
{
    PAN_MIDLINE_ANY              = 0x00,
    PAN_MIDLINE_NO_FIT           = 0x01,
    PAN_MIDLINE_INDEX            = 0x08,
    PAN_MIDLINE_STANDARD_TRIMMED = 0x02,
    PAN_MIDLINE_STANDARD_POINTED = 0x03,
    PAN_MIDLINE_STANDARD_SERIFED = 0x04,
    PAN_MIDLINE_HIGH_TRIMMED     = 0x05,
    PAN_MIDLINE_HIGH_POINTED     = 0x06,
    PAN_MIDLINE_HIGH_SERIFED     = 0x07,
    PAN_MIDLINE_CONSTANT_TRIMMED = 0x08,
    PAN_MIDLINE_CONSTANT_POINTED = 0x09,
    PAN_MIDLINE_CONSTANT_SERIFED = 0x0a,
    PAN_MIDLINE_LOW_TRIMMED      = 0x0b,
    PAN_MIDLINE_LOW_POINTED      = 0x0c,
    PAN_MIDLINE_LOW_SERIFED      = 0x0d,
}

alias PAN_XHEIGHT = ubyte;
enum : ubyte
{
    PAN_XHEIGHT_ANY            = 0x00,
    PAN_XHEIGHT_NO_FIT         = 0x01,
    PAN_XHEIGHT_INDEX          = 0x09,
    PAN_XHEIGHT_CONSTANT_SMALL = 0x02,
    PAN_XHEIGHT_CONSTANT_STD   = 0x03,
    PAN_XHEIGHT_CONSTANT_LARGE = 0x04,
    PAN_XHEIGHT_DUCKING_SMALL  = 0x05,
    PAN_XHEIGHT_DUCKING_STD    = 0x06,
    PAN_XHEIGHT_DUCKING_LARGE  = 0x07,
}

alias ENUM_DISPLAY_SETTINGS_FLAGS = uint;
enum : uint
{
    EDS_RAWMODE     = 0x00000002,
    EDS_ROTATEDMODE = 0x00000004,
}

alias DISPLAY_DEVICE_STATE_FLAGS = uint;
enum : uint
{
    DISPLAY_DEVICE_ATTACHED_TO_DESKTOP = 0x00000001,
    DISPLAY_DEVICE_MULTI_DRIVER        = 0x00000002,
    DISPLAY_DEVICE_PRIMARY_DEVICE      = 0x00000004,
    DISPLAY_DEVICE_MIRRORING_DRIVER    = 0x00000008,
    DISPLAY_DEVICE_VGA_COMPATIBLE      = 0x00000010,
    DISPLAY_DEVICE_REMOVABLE           = 0x00000020,
    DISPLAY_DEVICE_ACC_DRIVER          = 0x00000040,
    DISPLAY_DEVICE_MODESPRUNED         = 0x08000000,
    DISPLAY_DEVICE_RDPUDD              = 0x01000000,
    DISPLAY_DEVICE_REMOTE              = 0x04000000,
    DISPLAY_DEVICE_DISCONNECT          = 0x02000000,
    DISPLAY_DEVICE_TS_COMPATIBLE       = 0x00200000,
    DISPLAY_DEVICE_UNSAFE_MODES_ON     = 0x00080000,
    DISPLAY_DEVICE_ACTIVE              = 0x00000001,
    DISPLAY_DEVICE_ATTACHED            = 0x00000002,
}

alias HBITMAP = void*;
alias HRGN = void*;
alias HPEN = void*;
alias HBRUSH = void*;
alias HFONT = void*;
alias HMETAFILE = void*;
alias HENHMETAFILE = void*;
alias HPALETTE = void*;
alias HDC = void*;
alias HGDIOBJ = void*;
alias HMONITOR = void*;
struct XFORM
{
    float eM11;
    float eM12;
    float eM21;
    float eM22;
    float eDx;
    float eDy;
}
struct BITMAP
{
    int bmType;
    int bmWidth;
    int bmHeight;
    int bmWidthBytes;
    ushort bmPlanes;
    ushort bmBitsPixel;
    void* bmBits;
}
struct RGBTRIPLE
{
    ubyte rgbtBlue;
    ubyte rgbtGreen;
    ubyte rgbtRed;
}
struct RGBQUAD
{
    ubyte rgbBlue;
    ubyte rgbGreen;
    ubyte rgbRed;
    ubyte rgbReserved;
}
struct CIEXYZ
{
    int ciexyzX;
    int ciexyzY;
    int ciexyzZ;
}
struct CIEXYZTRIPLE
{
    CIEXYZ ciexyzRed;
    CIEXYZ ciexyzGreen;
    CIEXYZ ciexyzBlue;
}
struct BITMAPCOREHEADER
{
    uint bcSize;
    ushort bcWidth;
    ushort bcHeight;
    ushort bcPlanes;
    ushort bcBitCount;
}
struct BITMAPINFOHEADER
{
    uint biSize;
    int biWidth;
    int biHeight;
    ushort biPlanes;
    ushort biBitCount;
    uint biCompression;
    uint biSizeImage;
    int biXPelsPerMeter;
    int biYPelsPerMeter;
    uint biClrUsed;
    uint biClrImportant;
}
struct BITMAPV4HEADER
{
    uint bV4Size;
    int bV4Width;
    int bV4Height;
    ushort bV4Planes;
    ushort bV4BitCount;
    BI_COMPRESSION bV4V4Compression;
    uint bV4SizeImage;
    int bV4XPelsPerMeter;
    int bV4YPelsPerMeter;
    uint bV4ClrUsed;
    uint bV4ClrImportant;
    uint bV4RedMask;
    uint bV4GreenMask;
    uint bV4BlueMask;
    uint bV4AlphaMask;
    uint bV4CSType;
    CIEXYZTRIPLE bV4Endpoints;
    uint bV4GammaRed;
    uint bV4GammaGreen;
    uint bV4GammaBlue;
}
struct BITMAPV5HEADER
{
    uint bV5Size;
    int bV5Width;
    int bV5Height;
    ushort bV5Planes;
    ushort bV5BitCount;
    BI_COMPRESSION bV5Compression;
    uint bV5SizeImage;
    int bV5XPelsPerMeter;
    int bV5YPelsPerMeter;
    uint bV5ClrUsed;
    uint bV5ClrImportant;
    uint bV5RedMask;
    uint bV5GreenMask;
    uint bV5BlueMask;
    uint bV5AlphaMask;
    uint bV5CSType;
    CIEXYZTRIPLE bV5Endpoints;
    uint bV5GammaRed;
    uint bV5GammaGreen;
    uint bV5GammaBlue;
    uint bV5Intent;
    uint bV5ProfileData;
    uint bV5ProfileSize;
    uint bV5Reserved;
}
struct BITMAPINFO
{
    BITMAPINFOHEADER bmiHeader;
    RGBQUAD[1] bmiColors;
}
struct BITMAPCOREINFO
{
    BITMAPCOREHEADER bmciHeader;
    RGBTRIPLE[1] bmciColors;
}
struct BITMAPFILEHEADER
{
    align (2):
    ushort bfType;
    uint bfSize;
    ushort bfReserved1;
    ushort bfReserved2;
    uint bfOffBits;
}
struct HANDLETABLE
{
    HGDIOBJ[1] objectHandle;
}
struct METARECORD
{
    uint rdSize;
    ushort rdFunction;
    ushort[1] rdParm;
}
struct METAHEADER
{
    align (2):
    ushort mtType;
    ushort mtHeaderSize;
    ushort mtVersion;
    uint mtSize;
    ushort mtNoObjects;
    uint mtMaxRecord;
    ushort mtNoParameters;
}
struct ENHMETARECORD
{
    ENHANCED_METAFILE_RECORD_TYPE iType;
    uint nSize;
    uint[1] dParm;
}
struct ENHMETAHEADER
{
    uint iType;
    uint nSize;
    RECTL rclBounds;
    RECTL rclFrame;
    uint dSignature;
    uint nVersion;
    uint nBytes;
    uint nRecords;
    ushort nHandles;
    ushort sReserved;
    uint nDescription;
    uint offDescription;
    uint nPalEntries;
    SIZE szlDevice;
    SIZE szlMillimeters;
    uint cbPixelFormat;
    uint offPixelFormat;
    uint bOpenGL;
    SIZE szlMicrometers;
}
struct TEXTMETRICA
{
    int tmHeight;
    int tmAscent;
    int tmDescent;
    int tmInternalLeading;
    int tmExternalLeading;
    int tmAveCharWidth;
    int tmMaxCharWidth;
    int tmWeight;
    int tmOverhang;
    int tmDigitizedAspectX;
    int tmDigitizedAspectY;
    ubyte tmFirstChar;
    ubyte tmLastChar;
    ubyte tmDefaultChar;
    ubyte tmBreakChar;
    ubyte tmItalic;
    ubyte tmUnderlined;
    ubyte tmStruckOut;
    TMPF_FLAGS tmPitchAndFamily;
    ubyte tmCharSet;
}
struct TEXTMETRICW
{
    int tmHeight;
    int tmAscent;
    int tmDescent;
    int tmInternalLeading;
    int tmExternalLeading;
    int tmAveCharWidth;
    int tmMaxCharWidth;
    int tmWeight;
    int tmOverhang;
    int tmDigitizedAspectX;
    int tmDigitizedAspectY;
    wchar tmFirstChar;
    wchar tmLastChar;
    wchar tmDefaultChar;
    wchar tmBreakChar;
    ubyte tmItalic;
    ubyte tmUnderlined;
    ubyte tmStruckOut;
    TMPF_FLAGS tmPitchAndFamily;
    ubyte tmCharSet;
}
struct NEWTEXTMETRICA
{
    int tmHeight;
    int tmAscent;
    int tmDescent;
    int tmInternalLeading;
    int tmExternalLeading;
    int tmAveCharWidth;
    int tmMaxCharWidth;
    int tmWeight;
    int tmOverhang;
    int tmDigitizedAspectX;
    int tmDigitizedAspectY;
    ubyte tmFirstChar;
    ubyte tmLastChar;
    ubyte tmDefaultChar;
    ubyte tmBreakChar;
    ubyte tmItalic;
    ubyte tmUnderlined;
    ubyte tmStruckOut;
    TMPF_FLAGS tmPitchAndFamily;
    ubyte tmCharSet;
    uint ntmFlags;
    uint ntmSizeEM;
    uint ntmCellHeight;
    uint ntmAvgWidth;
}
struct NEWTEXTMETRICW
{
    int tmHeight;
    int tmAscent;
    int tmDescent;
    int tmInternalLeading;
    int tmExternalLeading;
    int tmAveCharWidth;
    int tmMaxCharWidth;
    int tmWeight;
    int tmOverhang;
    int tmDigitizedAspectX;
    int tmDigitizedAspectY;
    wchar tmFirstChar;
    wchar tmLastChar;
    wchar tmDefaultChar;
    wchar tmBreakChar;
    ubyte tmItalic;
    ubyte tmUnderlined;
    ubyte tmStruckOut;
    TMPF_FLAGS tmPitchAndFamily;
    ubyte tmCharSet;
    uint ntmFlags;
    uint ntmSizeEM;
    uint ntmCellHeight;
    uint ntmAvgWidth;
}
struct PELARRAY
{
    int paXCount;
    int paYCount;
    int paXExt;
    int paYExt;
    ubyte paRGBs;
}
struct LOGBRUSH
{
    BRUSH_STYLE lbStyle;
    COLORREF lbColor;
    ulong lbHatch;
}
struct LOGBRUSH32
{
    BRUSH_STYLE lbStyle;
    COLORREF lbColor;
    uint lbHatch;
}
struct LOGPEN
{
    uint lopnStyle;
    POINT lopnWidth;
    COLORREF lopnColor;
}
struct EXTLOGPEN
{
    uint elpPenStyle;
    uint elpWidth;
    uint elpBrushStyle;
    COLORREF elpColor;
    ulong elpHatch;
    uint elpNumEntries;
    uint[1] elpStyleEntry;
}
struct EXTLOGPEN32
{
    uint elpPenStyle;
    uint elpWidth;
    uint elpBrushStyle;
    COLORREF elpColor;
    uint elpHatch;
    uint elpNumEntries;
    uint[1] elpStyleEntry;
}
struct PALETTEENTRY
{
    ubyte peRed;
    ubyte peGreen;
    ubyte peBlue;
    ubyte peFlags;
}
struct LOGPALETTE
{
    ushort palVersion;
    ushort palNumEntries;
    PALETTEENTRY[1] palPalEntry;
}
struct LOGFONTA
{
    int lfHeight;
    int lfWidth;
    int lfEscapement;
    int lfOrientation;
    int lfWeight;
    ubyte lfItalic;
    ubyte lfUnderline;
    ubyte lfStrikeOut;
    FONT_CHARSET lfCharSet;
    FONT_OUTPUT_PRECISION lfOutPrecision;
    FONT_CLIP_PRECISION lfClipPrecision;
    FONT_QUALITY lfQuality;
    ubyte lfPitchAndFamily;
    CHAR[32] lfFaceName;
}
struct LOGFONTW
{
    int lfHeight;
    int lfWidth;
    int lfEscapement;
    int lfOrientation;
    int lfWeight;
    ubyte lfItalic;
    ubyte lfUnderline;
    ubyte lfStrikeOut;
    FONT_CHARSET lfCharSet;
    FONT_OUTPUT_PRECISION lfOutPrecision;
    FONT_CLIP_PRECISION lfClipPrecision;
    FONT_QUALITY lfQuality;
    ubyte lfPitchAndFamily;
    wchar[32] lfFaceName;
}
struct ENUMLOGFONTA
{
    LOGFONTA elfLogFont;
    ubyte[64] elfFullName;
    ubyte[32] elfStyle;
}
struct ENUMLOGFONTW
{
    LOGFONTW elfLogFont;
    wchar[64] elfFullName;
    wchar[32] elfStyle;
}
struct ENUMLOGFONTEXA
{
    LOGFONTA elfLogFont;
    ubyte[64] elfFullName;
    ubyte[32] elfStyle;
    ubyte[32] elfScript;
}
struct ENUMLOGFONTEXW
{
    LOGFONTW elfLogFont;
    wchar[64] elfFullName;
    wchar[32] elfStyle;
    wchar[32] elfScript;
}
struct PANOSE
{
    PAN_FAMILY_TYPE bFamilyType;
    PAN_SERIF_STYLE bSerifStyle;
    PAN_WEIGHT bWeight;
    PAN_PROPORTION bProportion;
    PAN_CONTRAST bContrast;
    PAN_STROKE_VARIATION bStrokeVariation;
    PAN_ARM_STYLE bArmStyle;
    PAN_LETT_FORM bLetterform;
    PAN_MIDLINE bMidline;
    PAN_XHEIGHT bXHeight;
}
struct EXTLOGFONTA
{
    LOGFONTA elfLogFont;
    ubyte[64] elfFullName;
    ubyte[32] elfStyle;
    uint elfVersion;
    uint elfStyleSize;
    uint elfMatch;
    uint elfReserved;
    ubyte[4] elfVendorId;
    uint elfCulture;
    PANOSE elfPanose;
}
struct EXTLOGFONTW
{
    LOGFONTW elfLogFont;
    wchar[64] elfFullName;
    wchar[32] elfStyle;
    uint elfVersion;
    uint elfStyleSize;
    uint elfMatch;
    uint elfReserved;
    ubyte[4] elfVendorId;
    uint elfCulture;
    PANOSE elfPanose;
}
struct DEVMODEA
{
    ubyte[32] dmDeviceName;
    ushort dmSpecVersion;
    ushort dmDriverVersion;
    ushort dmSize;
    ushort dmDriverExtra;
    DEVMODE_FIELD_FLAGS dmFields;
    union
    {
        struct
        {
            short dmOrientation;
            short dmPaperSize;
            short dmPaperLength;
            short dmPaperWidth;
            short dmScale;
            short dmCopies;
            short dmDefaultSource;
            short dmPrintQuality;
        }
        struct
        {
            POINTL dmPosition;
            DEVMODE_DISPLAY_ORIENTATION dmDisplayOrientation;
            DEVMODE_DISPLAY_FIXED_OUTPUT dmDisplayFixedOutput;
        }
    }
    DEVMODE_COLOR dmColor;
    DEVMODE_DUPLEX dmDuplex;
    short dmYResolution;
    DEVMODE_TRUETYPE_OPTION dmTTOption;
    DEVMODE_COLLATE dmCollate;
    ubyte[32] dmFormName;
    ushort dmLogPixels;
    uint dmBitsPerPel;
    uint dmPelsWidth;
    uint dmPelsHeight;
    union
    {
        uint dmDisplayFlags;
        uint dmNup;
    }
    uint dmDisplayFrequency;
    uint dmICMMethod;
    uint dmICMIntent;
    uint dmMediaType;
    uint dmDitherType;
    uint dmReserved1;
    uint dmReserved2;
    uint dmPanningWidth;
    uint dmPanningHeight;
}
struct DEVMODEW
{
    wchar[32] dmDeviceName;
    ushort dmSpecVersion;
    ushort dmDriverVersion;
    ushort dmSize;
    ushort dmDriverExtra;
    DEVMODE_FIELD_FLAGS dmFields;
    union
    {
        struct
        {
            short dmOrientation;
            short dmPaperSize;
            short dmPaperLength;
            short dmPaperWidth;
            short dmScale;
            short dmCopies;
            short dmDefaultSource;
            short dmPrintQuality;
        }
        struct
        {
            POINTL dmPosition;
            DEVMODE_DISPLAY_ORIENTATION dmDisplayOrientation;
            DEVMODE_DISPLAY_FIXED_OUTPUT dmDisplayFixedOutput;
        }
    }
    DEVMODE_COLOR dmColor;
    DEVMODE_DUPLEX dmDuplex;
    short dmYResolution;
    DEVMODE_TRUETYPE_OPTION dmTTOption;
    DEVMODE_COLLATE dmCollate;
    wchar[32] dmFormName;
    ushort dmLogPixels;
    uint dmBitsPerPel;
    uint dmPelsWidth;
    uint dmPelsHeight;
    union
    {
        uint dmDisplayFlags;
        uint dmNup;
    }
    uint dmDisplayFrequency;
    uint dmICMMethod;
    uint dmICMIntent;
    uint dmMediaType;
    uint dmDitherType;
    uint dmReserved1;
    uint dmReserved2;
    uint dmPanningWidth;
    uint dmPanningHeight;
}
struct DISPLAY_DEVICEA
{
    uint cb;
    CHAR[32] DeviceName;
    CHAR[128] DeviceString;
    DISPLAY_DEVICE_STATE_FLAGS StateFlags;
    CHAR[128] DeviceID;
    CHAR[128] DeviceKey;
}
struct DISPLAY_DEVICEW
{
    uint cb;
    wchar[32] DeviceName;
    wchar[128] DeviceString;
    DISPLAY_DEVICE_STATE_FLAGS StateFlags;
    wchar[128] DeviceID;
    wchar[128] DeviceKey;
}
alias DISPLAYCONFIG_COLOR_ENCODING = int;
enum : int
{
    DISPLAYCONFIG_COLOR_ENCODING_RGB       = 0x00000000,
    DISPLAYCONFIG_COLOR_ENCODING_YCBCR444  = 0x00000001,
    DISPLAYCONFIG_COLOR_ENCODING_YCBCR422  = 0x00000002,
    DISPLAYCONFIG_COLOR_ENCODING_YCBCR420  = 0x00000003,
    DISPLAYCONFIG_COLOR_ENCODING_INTENSITY = 0x00000004,
}

struct RGNDATAHEADER
{
    uint dwSize;
    uint iType;
    uint nCount;
    uint nRgnSize;
    RECT rcBound;
}
struct RGNDATA
{
    RGNDATAHEADER rdh;
    CHAR[1] Buffer;
}
struct ABC
{
    int abcA;
    uint abcB;
    int abcC;
}
struct ABCFLOAT
{
    float abcfA;
    float abcfB;
    float abcfC;
}
struct OUTLINETEXTMETRICA
{
    uint otmSize;
    TEXTMETRICA otmTextMetrics;
    ubyte otmFiller;
    PANOSE otmPanoseNumber;
    uint otmfsSelection;
    uint otmfsType;
    int otmsCharSlopeRise;
    int otmsCharSlopeRun;
    int otmItalicAngle;
    uint otmEMSquare;
    int otmAscent;
    int otmDescent;
    uint otmLineGap;
    uint otmsCapEmHeight;
    uint otmsXHeight;
    RECT otmrcFontBox;
    int otmMacAscent;
    int otmMacDescent;
    uint otmMacLineGap;
    uint otmusMinimumPPEM;
    POINT otmptSubscriptSize;
    POINT otmptSubscriptOffset;
    POINT otmptSuperscriptSize;
    POINT otmptSuperscriptOffset;
    uint otmsStrikeoutSize;
    int otmsStrikeoutPosition;
    int otmsUnderscoreSize;
    int otmsUnderscorePosition;
    PSTR otmpFamilyName;
    PSTR otmpFaceName;
    PSTR otmpStyleName;
    PSTR otmpFullName;
}
struct OUTLINETEXTMETRICW
{
    uint otmSize;
    TEXTMETRICW otmTextMetrics;
    ubyte otmFiller;
    PANOSE otmPanoseNumber;
    uint otmfsSelection;
    uint otmfsType;
    int otmsCharSlopeRise;
    int otmsCharSlopeRun;
    int otmItalicAngle;
    uint otmEMSquare;
    int otmAscent;
    int otmDescent;
    uint otmLineGap;
    uint otmsCapEmHeight;
    uint otmsXHeight;
    RECT otmrcFontBox;
    int otmMacAscent;
    int otmMacDescent;
    uint otmMacLineGap;
    uint otmusMinimumPPEM;
    POINT otmptSubscriptSize;
    POINT otmptSubscriptOffset;
    POINT otmptSuperscriptSize;
    POINT otmptSuperscriptOffset;
    uint otmsStrikeoutSize;
    int otmsStrikeoutPosition;
    int otmsUnderscoreSize;
    int otmsUnderscorePosition;
    PSTR otmpFamilyName;
    PSTR otmpFaceName;
    PSTR otmpStyleName;
    PSTR otmpFullName;
}
struct POLYTEXTA
{
    int x;
    int y;
    uint n;
    const(char)* lpstr;
    uint uiFlags;
    RECT rcl;
    int* pdx;
}
struct POLYTEXTW
{
    int x;
    int y;
    uint n;
    const(wchar)* lpstr;
    uint uiFlags;
    RECT rcl;
    int* pdx;
}
struct FIXED
{
    ushort fract;
    short value;
}
struct MAT2
{
    FIXED eM11;
    FIXED eM12;
    FIXED eM21;
    FIXED eM22;
}
struct GLYPHMETRICS
{
    uint gmBlackBoxX;
    uint gmBlackBoxY;
    POINT gmptGlyphOrigin;
    short gmCellIncX;
    short gmCellIncY;
}
struct POINTFX
{
    FIXED x;
    FIXED y;
}
struct TTPOLYCURVE
{
    ushort wType;
    ushort cpfx;
    POINTFX[1] apfx;
}
struct TTPOLYGONHEADER
{
    uint cb;
    uint dwType;
    POINTFX pfxStart;
}
struct GCP_RESULTSA
{
    uint lStructSize;
    PSTR lpOutString;
    uint* lpOrder;
    int* lpDx;
    int* lpCaretPos;
    PSTR lpClass;
    PWSTR lpGlyphs;
    uint nGlyphs;
    int nMaxFit;
}
struct GCP_RESULTSW
{
    uint lStructSize;
    PWSTR lpOutString;
    uint* lpOrder;
    int* lpDx;
    int* lpCaretPos;
    PSTR lpClass;
    PWSTR lpGlyphs;
    uint nGlyphs;
    int nMaxFit;
}
struct RASTERIZER_STATUS
{
    short nSize;
    short wFlags;
    short nLanguageID;
}
alias FONTENUMPROCA = int function(const(LOGFONTA)* param0, const(TEXTMETRICA)* param1, uint param2, LPARAM param3);
alias FONTENUMPROCW = int function(const(LOGFONTW)* param0, const(TEXTMETRICW)* param1, uint param2, LPARAM param3);
alias GOBJENUMPROC = int function(void* param0, LPARAM param1);
alias LINEDDAPROC = void function(int param0, int param1, LPARAM param2);
alias LPFNDEVMODE = uint function(HWND param0, HMODULE param1, DEVMODEA* param2, PSTR param3, PSTR param4, DEVMODEA* param5, PSTR param6, uint param7);
alias LPFNDEVCAPS = uint function(PSTR param0, PSTR param1, uint param2, PSTR param3, DEVMODEA* param4);
struct WCRANGE
{
    wchar wcLow;
    ushort cGlyphs;
}
struct GLYPHSET
{
    uint cbThis;
    uint flAccel;
    uint cGlyphsSupported;
    uint cRanges;
    WCRANGE[1] ranges;
}
struct DESIGNVECTOR
{
    uint dvReserved;
    uint dvNumAxes;
    int[16] dvValues;
}
struct AXISINFOA
{
    int axMinValue;
    int axMaxValue;
    ubyte[16] axAxisName;
}
struct AXISINFOW
{
    int axMinValue;
    int axMaxValue;
    wchar[16] axAxisName;
}
struct AXESLISTA
{
    uint axlReserved;
    uint axlNumAxes;
    AXISINFOA[16] axlAxisInfo;
}
struct AXESLISTW
{
    uint axlReserved;
    uint axlNumAxes;
    AXISINFOW[16] axlAxisInfo;
}
struct ENUMLOGFONTEXDVA
{
    ENUMLOGFONTEXA elfEnumLogfontEx;
    DESIGNVECTOR elfDesignVector;
}
struct ENUMLOGFONTEXDVW
{
    ENUMLOGFONTEXW elfEnumLogfontEx;
    DESIGNVECTOR elfDesignVector;
}
struct TRIVERTEX
{
    int x;
    int y;
    ushort Red;
    ushort Green;
    ushort Blue;
    ushort Alpha;
}
struct GRADIENT_TRIANGLE
{
    uint Vertex1;
    uint Vertex2;
    uint Vertex3;
}
struct GRADIENT_RECT
{
    uint UpperLeft;
    uint LowerRight;
}
struct BLENDFUNCTION
{
    ubyte BlendOp;
    ubyte BlendFlags;
    ubyte SourceConstantAlpha;
    ubyte AlphaFormat;
}
alias MFENUMPROC = int function(HDC hdc, HANDLETABLE* lpht, METARECORD* lpMR, int nObj, LPARAM param4);
alias ENHMFENUMPROC = int function(HDC hdc, HANDLETABLE* lpht, const(ENHMETARECORD)* lpmr, int nHandles, LPARAM data);
struct DIBSECTION
{
    BITMAP dsBm;
    BITMAPINFOHEADER dsBmih;
    uint[3] dsBitfields;
    HANDLE dshSection;
    uint dsOffset;
}
struct COLORADJUSTMENT
{
    ushort caSize;
    ushort caFlags;
    ushort caIlluminantIndex;
    ushort caRedGamma;
    ushort caGreenGamma;
    ushort caBlueGamma;
    ushort caReferenceBlack;
    ushort caReferenceWhite;
    short caContrast;
    short caBrightness;
    short caColorfulness;
    short caRedGreenTint;
}
struct KERNINGPAIR
{
    ushort wFirst;
    ushort wSecond;
    int iKernAmount;
}
struct EMR
{
    ENHANCED_METAFILE_RECORD_TYPE iType;
    uint nSize;
}
struct EMRTEXT
{
    POINTL ptlReference;
    uint nChars;
    uint offString;
    uint fOptions;
    RECTL rcl;
    uint offDx;
}
struct ABORTPATH
{
    EMR emr;
}
struct EMRSELECTCLIPPATH
{
    EMR emr;
    uint iMode;
}
struct EMRSETMITERLIMIT
{
    EMR emr;
    float eMiterLimit;
}
struct EMRRESTOREDC
{
    EMR emr;
    int iRelative;
}
struct EMRSETARCDIRECTION
{
    EMR emr;
    uint iArcDirection;
}
struct EMRSETMAPPERFLAGS
{
    EMR emr;
    uint dwFlags;
}
struct EMRSETTEXTCOLOR
{
    EMR emr;
    COLORREF crColor;
}
struct EMRSELECTOBJECT
{
    EMR emr;
    uint ihObject;
}
struct EMRSELECTPALETTE
{
    EMR emr;
    uint ihPal;
}
struct EMRRESIZEPALETTE
{
    EMR emr;
    uint ihPal;
    uint cEntries;
}
struct EMRSETPALETTEENTRIES
{
    EMR emr;
    uint ihPal;
    uint iStart;
    uint cEntries;
    PALETTEENTRY[1] aPalEntries;
}
struct EMRSETCOLORADJUSTMENT
{
    EMR emr;
    COLORADJUSTMENT ColorAdjustment;
}
struct EMRGDICOMMENT
{
    EMR emr;
    uint cbData;
    ubyte[1] Data;
}
struct EMREOF
{
    EMR emr;
    uint nPalEntries;
    uint offPalEntries;
    uint nSizeLast;
}
struct EMRLINETO
{
    EMR emr;
    POINTL ptl;
}
struct EMROFFSETCLIPRGN
{
    EMR emr;
    POINTL ptlOffset;
}
struct EMRFILLPATH
{
    EMR emr;
    RECTL rclBounds;
}
struct EMREXCLUDECLIPRECT
{
    EMR emr;
    RECTL rclClip;
}
struct EMRSETVIEWPORTORGEX
{
    EMR emr;
    POINTL ptlOrigin;
}
struct EMRSETVIEWPORTEXTEX
{
    EMR emr;
    SIZE szlExtent;
}
struct EMRSCALEVIEWPORTEXTEX
{
    EMR emr;
    int xNum;
    int xDenom;
    int yNum;
    int yDenom;
}
struct EMRSETWORLDTRANSFORM
{
    EMR emr;
    XFORM xform;
}
struct EMRMODIFYWORLDTRANSFORM
{
    EMR emr;
    XFORM xform;
    MODIFY_WORLD_TRANSFORM_MODE iMode;
}
struct EMRSETPIXELV
{
    EMR emr;
    POINTL ptlPixel;
    COLORREF crColor;
}
struct EMREXTFLOODFILL
{
    EMR emr;
    POINTL ptlStart;
    COLORREF crColor;
    uint iMode;
}
struct EMRELLIPSE
{
    EMR emr;
    RECTL rclBox;
}
struct EMRROUNDRECT
{
    EMR emr;
    RECTL rclBox;
    SIZE szlCorner;
}
struct EMRARC
{
    EMR emr;
    RECTL rclBox;
    POINTL ptlStart;
    POINTL ptlEnd;
}
struct EMRANGLEARC
{
    EMR emr;
    POINTL ptlCenter;
    uint nRadius;
    float eStartAngle;
    float eSweepAngle;
}
struct EMRPOLYLINE
{
    EMR emr;
    RECTL rclBounds;
    uint cptl;
    POINTL[1] aptl;
}
struct EMRPOLYLINE16
{
    EMR emr;
    RECTL rclBounds;
    uint cpts;
    POINTS[1] apts;
}
struct EMRPOLYDRAW
{
    EMR emr;
    RECTL rclBounds;
    uint cptl;
    POINTL[1] aptl;
    ubyte[1] abTypes;
}
struct EMRPOLYDRAW16
{
    EMR emr;
    RECTL rclBounds;
    uint cpts;
    POINTS[1] apts;
    ubyte[1] abTypes;
}
struct EMRPOLYPOLYLINE
{
    EMR emr;
    RECTL rclBounds;
    uint nPolys;
    uint cptl;
    uint[1] aPolyCounts;
    POINTL[1] aptl;
}
struct EMRPOLYPOLYLINE16
{
    EMR emr;
    RECTL rclBounds;
    uint nPolys;
    uint cpts;
    uint[1] aPolyCounts;
    POINTS[1] apts;
}
struct EMRINVERTRGN
{
    EMR emr;
    RECTL rclBounds;
    uint cbRgnData;
    ubyte[1] RgnData;
}
struct EMRFILLRGN
{
    EMR emr;
    RECTL rclBounds;
    uint cbRgnData;
    uint ihBrush;
    ubyte[1] RgnData;
}
struct EMRFRAMERGN
{
    EMR emr;
    RECTL rclBounds;
    uint cbRgnData;
    uint ihBrush;
    SIZE szlStroke;
    ubyte[1] RgnData;
}
struct EMREXTSELECTCLIPRGN
{
    EMR emr;
    uint cbRgnData;
    uint iMode;
    ubyte[1] RgnData;
}
struct EMREXTTEXTOUTA
{
    EMR emr;
    RECTL rclBounds;
    uint iGraphicsMode;
    float exScale;
    float eyScale;
    EMRTEXT emrtext;
}
struct EMRPOLYTEXTOUTA
{
    EMR emr;
    RECTL rclBounds;
    uint iGraphicsMode;
    float exScale;
    float eyScale;
    int cStrings;
    EMRTEXT[1] aemrtext;
}
struct EMRBITBLT
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int cxDest;
    int cyDest;
    uint dwRop;
    int xSrc;
    int ySrc;
    XFORM xformSrc;
    COLORREF crBkColorSrc;
    uint iUsageSrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
}
struct EMRSTRETCHBLT
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int cxDest;
    int cyDest;
    uint dwRop;
    int xSrc;
    int ySrc;
    XFORM xformSrc;
    COLORREF crBkColorSrc;
    uint iUsageSrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    int cxSrc;
    int cySrc;
}
struct EMRMASKBLT
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int cxDest;
    int cyDest;
    uint dwRop;
    int xSrc;
    int ySrc;
    XFORM xformSrc;
    COLORREF crBkColorSrc;
    uint iUsageSrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    int xMask;
    int yMask;
    uint iUsageMask;
    uint offBmiMask;
    uint cbBmiMask;
    uint offBitsMask;
    uint cbBitsMask;
}
struct EMRPLGBLT
{
    EMR emr;
    RECTL rclBounds;
    POINTL[3] aptlDest;
    int xSrc;
    int ySrc;
    int cxSrc;
    int cySrc;
    XFORM xformSrc;
    COLORREF crBkColorSrc;
    uint iUsageSrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    int xMask;
    int yMask;
    uint iUsageMask;
    uint offBmiMask;
    uint cbBmiMask;
    uint offBitsMask;
    uint cbBitsMask;
}
struct EMRSETDIBITSTODEVICE
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int xSrc;
    int ySrc;
    int cxSrc;
    int cySrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    uint iUsageSrc;
    uint iStartScan;
    uint cScans;
}
struct EMRSTRETCHDIBITS
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int xSrc;
    int ySrc;
    int cxSrc;
    int cySrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    uint iUsageSrc;
    uint dwRop;
    int cxDest;
    int cyDest;
}
struct EMREXTCREATEFONTINDIRECTW
{
    EMR emr;
    uint ihFont;
    EXTLOGFONTW elfw;
}
struct EMRCREATEPALETTE
{
    EMR emr;
    uint ihPal;
    LOGPALETTE lgpl;
}
struct EMRCREATEPEN
{
    EMR emr;
    uint ihPen;
    LOGPEN lopn;
}
struct EMREXTCREATEPEN
{
    EMR emr;
    uint ihPen;
    uint offBmi;
    uint cbBmi;
    uint offBits;
    uint cbBits;
    EXTLOGPEN32 elp;
}
struct EMRCREATEBRUSHINDIRECT
{
    EMR emr;
    uint ihBrush;
    LOGBRUSH32 lb;
}
struct EMRCREATEMONOBRUSH
{
    EMR emr;
    uint ihBrush;
    uint iUsage;
    uint offBmi;
    uint cbBmi;
    uint offBits;
    uint cbBits;
}
struct EMRCREATEDIBPATTERNBRUSHPT
{
    EMR emr;
    uint ihBrush;
    uint iUsage;
    uint offBmi;
    uint cbBmi;
    uint offBits;
    uint cbBits;
}
struct EMRFORMAT
{
    uint dSignature;
    uint nVersion;
    uint cbData;
    uint offData;
}
struct EMRGLSRECORD
{
    EMR emr;
    uint cbData;
    ubyte[1] Data;
}
struct EMRGLSBOUNDEDRECORD
{
    EMR emr;
    RECTL rclBounds;
    uint cbData;
    ubyte[1] Data;
}
struct EMRSETCOLORSPACE
{
    EMR emr;
    uint ihCS;
}
struct EMREXTESCAPE
{
    EMR emr;
    int iEscape;
    int cbEscData;
    ubyte[1] EscData;
}
struct EMRNAMEDESCAPE
{
    EMR emr;
    int iEscape;
    int cbDriver;
    int cbEscData;
    ubyte[1] EscData;
}
struct EMRSETICMPROFILE
{
    EMR emr;
    uint dwFlags;
    uint cbName;
    uint cbData;
    ubyte[1] Data;
}
struct EMRCOLORMATCHTOTARGET
{
    EMR emr;
    uint dwAction;
    uint dwFlags;
    uint cbName;
    uint cbData;
    ubyte[1] Data;
}
struct EMRCOLORCORRECTPALETTE
{
    EMR emr;
    uint ihPalette;
    uint nFirstEntry;
    uint nPalEntries;
    uint nReserved;
}
struct EMRALPHABLEND
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int cxDest;
    int cyDest;
    uint dwRop;
    int xSrc;
    int ySrc;
    XFORM xformSrc;
    COLORREF crBkColorSrc;
    uint iUsageSrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    int cxSrc;
    int cySrc;
}
struct EMRGRADIENTFILL
{
    EMR emr;
    RECTL rclBounds;
    uint nVer;
    uint nTri;
    GRADIENT_FILL ulMode;
    TRIVERTEX[1] Ver;
}
struct EMRTRANSPARENTBLT
{
    EMR emr;
    RECTL rclBounds;
    int xDest;
    int yDest;
    int cxDest;
    int cyDest;
    uint dwRop;
    int xSrc;
    int ySrc;
    XFORM xformSrc;
    COLORREF crBkColorSrc;
    uint iUsageSrc;
    uint offBmiSrc;
    uint cbBmiSrc;
    uint offBitsSrc;
    uint cbBitsSrc;
    int cxSrc;
    int cySrc;
}
struct WGLSWAP
{
    HDC hdc;
    uint uiFlags;
}
alias CFP_ALLOCPROC = void* function(ulong param0);
alias CFP_REALLOCPROC = void* function(void* param0, ulong param1);
alias CFP_FREEPROC = void function(void* param0);
alias READEMBEDPROC = uint function(void* param0, void* param1, const(uint) param2);
alias WRITEEMBEDPROC = uint function(void* param0, const(void)* param1, const(uint) param2);
struct TTLOADINFO
{
    ushort usStructSize;
    ushort usRefStrSize;
    ushort* pusRefStr;
}
struct TTEMBEDINFO
{
    ushort usStructSize;
    ushort usRootStrSize;
    ushort* pusRootStr;
}
struct TTVALIDATIONTESTSPARAMS
{
    uint ulStructSize;
    int lTestFromSize;
    int lTestToSize;
    uint ulCharSet;
    ushort usReserved1;
    ushort usCharCodeCount;
    ushort* pusCharCodeSet;
}
struct TTVALIDATIONTESTSPARAMSEX
{
    uint ulStructSize;
    int lTestFromSize;
    int lTestToSize;
    uint ulCharSet;
    ushort usReserved1;
    ushort usCharCodeCount;
    uint* pulCharCodeSet;
}
alias GRAYSTRINGPROC = BOOL function(HDC param0, LPARAM param1, int param2);
alias DRAWSTATEPROC = BOOL function(HDC hdc, LPARAM lData, WPARAM wData, int cx, int cy);
struct PAINTSTRUCT
{
    HDC hdc;
    BOOL fErase;
    RECT rcPaint;
    BOOL fRestore;
    BOOL fIncUpdate;
    ubyte[32] rgbReserved;
}
struct DRAWTEXTPARAMS
{
    uint cbSize;
    int iTabLength;
    int iLeftMargin;
    int iRightMargin;
    uint uiLengthDrawn;
}
struct MONITORINFO
{
    uint cbSize;
    RECT rcMonitor;
    RECT rcWork;
    uint dwFlags;
}
alias MONITORENUMPROC = BOOL function(HMONITOR param0, HDC param1, RECT* param2, LPARAM param3);
