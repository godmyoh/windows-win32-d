module windows.win32.graphics.gdiplus;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HINSTANCE, HRESULT, HWND, PSTR, PWSTR, RECT, RECTL, SIZE;
import windows.win32.graphics.directdraw : IDirectDrawSurface7;
import windows.win32.graphics.gdi : BITMAPINFO, HBITMAP, HDC, HENHMETAFILE, HMETAFILE, HPALETTE, HRGN, LOGFONTA, LOGFONTW, METAHEADER;
import windows.win32.system.com : IStream, IUnknown;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

void* GdipAlloc(ulong);
void GdipFree(void*);
Status GdiplusStartup(ulong*, const(GdiplusStartupInput)*, GdiplusStartupOutput*);
void GdiplusShutdown(ulong);
Status GdipCreateEffect(const(GUID), CGpEffect**);
Status GdipDeleteEffect(CGpEffect*);
Status GdipGetEffectParameterSize(CGpEffect*, uint*);
Status GdipSetEffectParameters(CGpEffect*, const(void)*, const(uint));
Status GdipGetEffectParameters(CGpEffect*, uint*, void*);
Status GdipCreatePath(FillMode, GpPath**);
Status GdipCreatePath2(const(PointF)*, const(ubyte)*, int, FillMode, GpPath**);
Status GdipCreatePath2I(const(Point)*, const(ubyte)*, int, FillMode, GpPath**);
Status GdipClonePath(GpPath*, GpPath**);
Status GdipDeletePath(GpPath*);
Status GdipResetPath(GpPath*);
Status GdipGetPointCount(GpPath*, int*);
Status GdipGetPathTypes(GpPath*, ubyte*, int);
Status GdipGetPathPoints(GpPath*, PointF*, int);
Status GdipGetPathPointsI(GpPath*, Point*, int);
Status GdipGetPathFillMode(GpPath*, FillMode*);
Status GdipSetPathFillMode(GpPath*, FillMode);
Status GdipGetPathData(GpPath*, PathData*);
Status GdipStartPathFigure(GpPath*);
Status GdipClosePathFigure(GpPath*);
Status GdipClosePathFigures(GpPath*);
Status GdipSetPathMarker(GpPath*);
Status GdipClearPathMarkers(GpPath*);
Status GdipReversePath(GpPath*);
Status GdipGetPathLastPoint(GpPath*, PointF*);
Status GdipAddPathLine(GpPath*, float, float, float, float);
Status GdipAddPathLine2(GpPath*, const(PointF)*, int);
Status GdipAddPathArc(GpPath*, float, float, float, float, float, float);
Status GdipAddPathBezier(GpPath*, float, float, float, float, float, float, float, float);
Status GdipAddPathBeziers(GpPath*, const(PointF)*, int);
Status GdipAddPathCurve(GpPath*, const(PointF)*, int);
Status GdipAddPathCurve2(GpPath*, const(PointF)*, int, float);
Status GdipAddPathCurve3(GpPath*, const(PointF)*, int, int, int, float);
Status GdipAddPathClosedCurve(GpPath*, const(PointF)*, int);
Status GdipAddPathClosedCurve2(GpPath*, const(PointF)*, int, float);
Status GdipAddPathRectangle(GpPath*, float, float, float, float);
Status GdipAddPathRectangles(GpPath*, const(RectF)*, int);
Status GdipAddPathEllipse(GpPath*, float, float, float, float);
Status GdipAddPathPie(GpPath*, float, float, float, float, float, float);
Status GdipAddPathPolygon(GpPath*, const(PointF)*, int);
Status GdipAddPathPath(GpPath*, const(GpPath)*, BOOL);
Status GdipAddPathString(GpPath*, const(wchar)*, int, const(GpFontFamily)*, int, float, const(RectF)*, const(GpStringFormat)*);
Status GdipAddPathStringI(GpPath*, const(wchar)*, int, const(GpFontFamily)*, int, float, const(Rect)*, const(GpStringFormat)*);
Status GdipAddPathLineI(GpPath*, int, int, int, int);
Status GdipAddPathLine2I(GpPath*, const(Point)*, int);
Status GdipAddPathArcI(GpPath*, int, int, int, int, float, float);
Status GdipAddPathBezierI(GpPath*, int, int, int, int, int, int, int, int);
Status GdipAddPathBeziersI(GpPath*, const(Point)*, int);
Status GdipAddPathCurveI(GpPath*, const(Point)*, int);
Status GdipAddPathCurve2I(GpPath*, const(Point)*, int, float);
Status GdipAddPathCurve3I(GpPath*, const(Point)*, int, int, int, float);
Status GdipAddPathClosedCurveI(GpPath*, const(Point)*, int);
Status GdipAddPathClosedCurve2I(GpPath*, const(Point)*, int, float);
Status GdipAddPathRectangleI(GpPath*, int, int, int, int);
Status GdipAddPathRectanglesI(GpPath*, const(Rect)*, int);
Status GdipAddPathEllipseI(GpPath*, int, int, int, int);
Status GdipAddPathPieI(GpPath*, int, int, int, int, float, float);
Status GdipAddPathPolygonI(GpPath*, const(Point)*, int);
Status GdipFlattenPath(GpPath*, Matrix*, float);
Status GdipWindingModeOutline(GpPath*, Matrix*, float);
Status GdipWidenPath(GpPath*, GpPen*, Matrix*, float);
Status GdipWarpPath(GpPath*, Matrix*, const(PointF)*, int, float, float, float, float, WarpMode, float);
Status GdipTransformPath(GpPath*, Matrix*);
Status GdipGetPathWorldBounds(GpPath*, RectF*, const(Matrix)*, const(GpPen)*);
Status GdipGetPathWorldBoundsI(GpPath*, Rect*, const(Matrix)*, const(GpPen)*);
Status GdipIsVisiblePathPoint(GpPath*, float, float, GpGraphics*, BOOL*);
Status GdipIsVisiblePathPointI(GpPath*, int, int, GpGraphics*, BOOL*);
Status GdipIsOutlineVisiblePathPoint(GpPath*, float, float, GpPen*, GpGraphics*, BOOL*);
Status GdipIsOutlineVisiblePathPointI(GpPath*, int, int, GpPen*, GpGraphics*, BOOL*);
Status GdipCreatePathIter(GpPathIterator**, GpPath*);
Status GdipDeletePathIter(GpPathIterator*);
Status GdipPathIterNextSubpath(GpPathIterator*, int*, int*, int*, BOOL*);
Status GdipPathIterNextSubpathPath(GpPathIterator*, int*, GpPath*, BOOL*);
Status GdipPathIterNextPathType(GpPathIterator*, int*, ubyte*, int*, int*);
Status GdipPathIterNextMarker(GpPathIterator*, int*, int*, int*);
Status GdipPathIterNextMarkerPath(GpPathIterator*, int*, GpPath*);
Status GdipPathIterGetCount(GpPathIterator*, int*);
Status GdipPathIterGetSubpathCount(GpPathIterator*, int*);
Status GdipPathIterIsValid(GpPathIterator*, BOOL*);
Status GdipPathIterHasCurve(GpPathIterator*, BOOL*);
Status GdipPathIterRewind(GpPathIterator*);
Status GdipPathIterEnumerate(GpPathIterator*, int*, PointF*, ubyte*, int);
Status GdipPathIterCopyData(GpPathIterator*, int*, PointF*, ubyte*, int, int);
Status GdipCreateMatrix(Matrix**);
Status GdipCreateMatrix2(float, float, float, float, float, float, Matrix**);
Status GdipCreateMatrix3(const(RectF)*, const(PointF)*, Matrix**);
Status GdipCreateMatrix3I(const(Rect)*, const(Point)*, Matrix**);
Status GdipCloneMatrix(Matrix*, Matrix**);
Status GdipDeleteMatrix(Matrix*);
Status GdipSetMatrixElements(Matrix*, float, float, float, float, float, float);
Status GdipMultiplyMatrix(Matrix*, Matrix*, MatrixOrder);
Status GdipTranslateMatrix(Matrix*, float, float, MatrixOrder);
Status GdipScaleMatrix(Matrix*, float, float, MatrixOrder);
Status GdipRotateMatrix(Matrix*, float, MatrixOrder);
Status GdipShearMatrix(Matrix*, float, float, MatrixOrder);
Status GdipInvertMatrix(Matrix*);
Status GdipTransformMatrixPoints(Matrix*, PointF*, int);
Status GdipTransformMatrixPointsI(Matrix*, Point*, int);
Status GdipVectorTransformMatrixPoints(Matrix*, PointF*, int);
Status GdipVectorTransformMatrixPointsI(Matrix*, Point*, int);
Status GdipGetMatrixElements(const(Matrix)*, float*);
Status GdipIsMatrixInvertible(const(Matrix)*, BOOL*);
Status GdipIsMatrixIdentity(const(Matrix)*, BOOL*);
Status GdipIsMatrixEqual(const(Matrix)*, const(Matrix)*, BOOL*);
Status GdipCreateRegion(GpRegion**);
Status GdipCreateRegionRect(const(RectF)*, GpRegion**);
Status GdipCreateRegionRectI(const(Rect)*, GpRegion**);
Status GdipCreateRegionPath(GpPath*, GpRegion**);
Status GdipCreateRegionRgnData(const(ubyte)*, int, GpRegion**);
Status GdipCreateRegionHrgn(HRGN, GpRegion**);
Status GdipCloneRegion(GpRegion*, GpRegion**);
Status GdipDeleteRegion(GpRegion*);
Status GdipSetInfinite(GpRegion*);
Status GdipSetEmpty(GpRegion*);
Status GdipCombineRegionRect(GpRegion*, const(RectF)*, CombineMode);
Status GdipCombineRegionRectI(GpRegion*, const(Rect)*, CombineMode);
Status GdipCombineRegionPath(GpRegion*, GpPath*, CombineMode);
Status GdipCombineRegionRegion(GpRegion*, GpRegion*, CombineMode);
Status GdipTranslateRegion(GpRegion*, float, float);
Status GdipTranslateRegionI(GpRegion*, int, int);
Status GdipTransformRegion(GpRegion*, Matrix*);
Status GdipGetRegionBounds(GpRegion*, GpGraphics*, RectF*);
Status GdipGetRegionBoundsI(GpRegion*, GpGraphics*, Rect*);
Status GdipGetRegionHRgn(GpRegion*, GpGraphics*, HRGN*);
Status GdipIsEmptyRegion(GpRegion*, GpGraphics*, BOOL*);
Status GdipIsInfiniteRegion(GpRegion*, GpGraphics*, BOOL*);
Status GdipIsEqualRegion(GpRegion*, GpRegion*, GpGraphics*, BOOL*);
Status GdipGetRegionDataSize(GpRegion*, uint*);
Status GdipGetRegionData(GpRegion*, ubyte*, uint, uint*);
Status GdipIsVisibleRegionPoint(GpRegion*, float, float, GpGraphics*, BOOL*);
Status GdipIsVisibleRegionPointI(GpRegion*, int, int, GpGraphics*, BOOL*);
Status GdipIsVisibleRegionRect(GpRegion*, float, float, float, float, GpGraphics*, BOOL*);
Status GdipIsVisibleRegionRectI(GpRegion*, int, int, int, int, GpGraphics*, BOOL*);
Status GdipGetRegionScansCount(GpRegion*, uint*, Matrix*);
Status GdipGetRegionScans(GpRegion*, RectF*, int*, Matrix*);
Status GdipGetRegionScansI(GpRegion*, Rect*, int*, Matrix*);
Status GdipCloneBrush(GpBrush*, GpBrush**);
Status GdipDeleteBrush(GpBrush*);
Status GdipGetBrushType(GpBrush*, BrushType*);
Status GdipCreateHatchBrush(HatchStyle, uint, uint, GpHatch**);
Status GdipGetHatchStyle(GpHatch*, HatchStyle*);
Status GdipGetHatchForegroundColor(GpHatch*, uint*);
Status GdipGetHatchBackgroundColor(GpHatch*, uint*);
Status GdipCreateTexture(GpImage*, WrapMode, GpTexture**);
Status GdipCreateTexture2(GpImage*, WrapMode, float, float, float, float, GpTexture**);
Status GdipCreateTextureIA(GpImage*, const(GpImageAttributes)*, float, float, float, float, GpTexture**);
Status GdipCreateTexture2I(GpImage*, WrapMode, int, int, int, int, GpTexture**);
Status GdipCreateTextureIAI(GpImage*, const(GpImageAttributes)*, int, int, int, int, GpTexture**);
Status GdipGetTextureTransform(GpTexture*, Matrix*);
Status GdipSetTextureTransform(GpTexture*, const(Matrix)*);
Status GdipResetTextureTransform(GpTexture*);
Status GdipMultiplyTextureTransform(GpTexture*, const(Matrix)*, MatrixOrder);
Status GdipTranslateTextureTransform(GpTexture*, float, float, MatrixOrder);
Status GdipScaleTextureTransform(GpTexture*, float, float, MatrixOrder);
Status GdipRotateTextureTransform(GpTexture*, float, MatrixOrder);
Status GdipSetTextureWrapMode(GpTexture*, WrapMode);
Status GdipGetTextureWrapMode(GpTexture*, WrapMode*);
Status GdipGetTextureImage(GpTexture*, GpImage**);
Status GdipCreateSolidFill(uint, GpSolidFill**);
Status GdipSetSolidFillColor(GpSolidFill*, uint);
Status GdipGetSolidFillColor(GpSolidFill*, uint*);
Status GdipCreateLineBrush(const(PointF)*, const(PointF)*, uint, uint, WrapMode, GpLineGradient**);
Status GdipCreateLineBrushI(const(Point)*, const(Point)*, uint, uint, WrapMode, GpLineGradient**);
Status GdipCreateLineBrushFromRect(const(RectF)*, uint, uint, LinearGradientMode, WrapMode, GpLineGradient**);
Status GdipCreateLineBrushFromRectI(const(Rect)*, uint, uint, LinearGradientMode, WrapMode, GpLineGradient**);
Status GdipCreateLineBrushFromRectWithAngle(const(RectF)*, uint, uint, float, BOOL, WrapMode, GpLineGradient**);
Status GdipCreateLineBrushFromRectWithAngleI(const(Rect)*, uint, uint, float, BOOL, WrapMode, GpLineGradient**);
Status GdipSetLineColors(GpLineGradient*, uint, uint);
Status GdipGetLineColors(GpLineGradient*, uint*);
Status GdipGetLineRect(GpLineGradient*, RectF*);
Status GdipGetLineRectI(GpLineGradient*, Rect*);
Status GdipSetLineGammaCorrection(GpLineGradient*, BOOL);
Status GdipGetLineGammaCorrection(GpLineGradient*, BOOL*);
Status GdipGetLineBlendCount(GpLineGradient*, int*);
Status GdipGetLineBlend(GpLineGradient*, float*, float*, int);
Status GdipSetLineBlend(GpLineGradient*, const(float)*, const(float)*, int);
Status GdipGetLinePresetBlendCount(GpLineGradient*, int*);
Status GdipGetLinePresetBlend(GpLineGradient*, uint*, float*, int);
Status GdipSetLinePresetBlend(GpLineGradient*, const(uint)*, const(float)*, int);
Status GdipSetLineSigmaBlend(GpLineGradient*, float, float);
Status GdipSetLineLinearBlend(GpLineGradient*, float, float);
Status GdipSetLineWrapMode(GpLineGradient*, WrapMode);
Status GdipGetLineWrapMode(GpLineGradient*, WrapMode*);
Status GdipGetLineTransform(GpLineGradient*, Matrix*);
Status GdipSetLineTransform(GpLineGradient*, const(Matrix)*);
Status GdipResetLineTransform(GpLineGradient*);
Status GdipMultiplyLineTransform(GpLineGradient*, const(Matrix)*, MatrixOrder);
Status GdipTranslateLineTransform(GpLineGradient*, float, float, MatrixOrder);
Status GdipScaleLineTransform(GpLineGradient*, float, float, MatrixOrder);
Status GdipRotateLineTransform(GpLineGradient*, float, MatrixOrder);
Status GdipCreatePathGradient(const(PointF)*, int, WrapMode, GpPathGradient**);
Status GdipCreatePathGradientI(const(Point)*, int, WrapMode, GpPathGradient**);
Status GdipCreatePathGradientFromPath(const(GpPath)*, GpPathGradient**);
Status GdipGetPathGradientCenterColor(GpPathGradient*, uint*);
Status GdipSetPathGradientCenterColor(GpPathGradient*, uint);
Status GdipGetPathGradientSurroundColorsWithCount(GpPathGradient*, uint*, int*);
Status GdipSetPathGradientSurroundColorsWithCount(GpPathGradient*, const(uint)*, int*);
Status GdipGetPathGradientPath(GpPathGradient*, GpPath*);
Status GdipSetPathGradientPath(GpPathGradient*, const(GpPath)*);
Status GdipGetPathGradientCenterPoint(GpPathGradient*, PointF*);
Status GdipGetPathGradientCenterPointI(GpPathGradient*, Point*);
Status GdipSetPathGradientCenterPoint(GpPathGradient*, const(PointF)*);
Status GdipSetPathGradientCenterPointI(GpPathGradient*, const(Point)*);
Status GdipGetPathGradientRect(GpPathGradient*, RectF*);
Status GdipGetPathGradientRectI(GpPathGradient*, Rect*);
Status GdipGetPathGradientPointCount(GpPathGradient*, int*);
Status GdipGetPathGradientSurroundColorCount(GpPathGradient*, int*);
Status GdipSetPathGradientGammaCorrection(GpPathGradient*, BOOL);
Status GdipGetPathGradientGammaCorrection(GpPathGradient*, BOOL*);
Status GdipGetPathGradientBlendCount(GpPathGradient*, int*);
Status GdipGetPathGradientBlend(GpPathGradient*, float*, float*, int);
Status GdipSetPathGradientBlend(GpPathGradient*, const(float)*, const(float)*, int);
Status GdipGetPathGradientPresetBlendCount(GpPathGradient*, int*);
Status GdipGetPathGradientPresetBlend(GpPathGradient*, uint*, float*, int);
Status GdipSetPathGradientPresetBlend(GpPathGradient*, const(uint)*, const(float)*, int);
Status GdipSetPathGradientSigmaBlend(GpPathGradient*, float, float);
Status GdipSetPathGradientLinearBlend(GpPathGradient*, float, float);
Status GdipGetPathGradientWrapMode(GpPathGradient*, WrapMode*);
Status GdipSetPathGradientWrapMode(GpPathGradient*, WrapMode);
Status GdipGetPathGradientTransform(GpPathGradient*, Matrix*);
Status GdipSetPathGradientTransform(GpPathGradient*, Matrix*);
Status GdipResetPathGradientTransform(GpPathGradient*);
Status GdipMultiplyPathGradientTransform(GpPathGradient*, const(Matrix)*, MatrixOrder);
Status GdipTranslatePathGradientTransform(GpPathGradient*, float, float, MatrixOrder);
Status GdipScalePathGradientTransform(GpPathGradient*, float, float, MatrixOrder);
Status GdipRotatePathGradientTransform(GpPathGradient*, float, MatrixOrder);
Status GdipGetPathGradientFocusScales(GpPathGradient*, float*, float*);
Status GdipSetPathGradientFocusScales(GpPathGradient*, float, float);
Status GdipCreatePen1(uint, float, Unit, GpPen**);
Status GdipCreatePen2(GpBrush*, float, Unit, GpPen**);
Status GdipClonePen(GpPen*, GpPen**);
Status GdipDeletePen(GpPen*);
Status GdipSetPenWidth(GpPen*, float);
Status GdipGetPenWidth(GpPen*, float*);
Status GdipSetPenUnit(GpPen*, Unit);
Status GdipGetPenUnit(GpPen*, Unit*);
Status GdipSetPenLineCap197819(GpPen*, LineCap, LineCap, DashCap);
Status GdipSetPenStartCap(GpPen*, LineCap);
Status GdipSetPenEndCap(GpPen*, LineCap);
Status GdipSetPenDashCap197819(GpPen*, DashCap);
Status GdipGetPenStartCap(GpPen*, LineCap*);
Status GdipGetPenEndCap(GpPen*, LineCap*);
Status GdipGetPenDashCap197819(GpPen*, DashCap*);
Status GdipSetPenLineJoin(GpPen*, LineJoin);
Status GdipGetPenLineJoin(GpPen*, LineJoin*);
Status GdipSetPenCustomStartCap(GpPen*, GpCustomLineCap*);
Status GdipGetPenCustomStartCap(GpPen*, GpCustomLineCap**);
Status GdipSetPenCustomEndCap(GpPen*, GpCustomLineCap*);
Status GdipGetPenCustomEndCap(GpPen*, GpCustomLineCap**);
Status GdipSetPenMiterLimit(GpPen*, float);
Status GdipGetPenMiterLimit(GpPen*, float*);
Status GdipSetPenMode(GpPen*, PenAlignment);
Status GdipGetPenMode(GpPen*, PenAlignment*);
Status GdipSetPenTransform(GpPen*, Matrix*);
Status GdipGetPenTransform(GpPen*, Matrix*);
Status GdipResetPenTransform(GpPen*);
Status GdipMultiplyPenTransform(GpPen*, const(Matrix)*, MatrixOrder);
Status GdipTranslatePenTransform(GpPen*, float, float, MatrixOrder);
Status GdipScalePenTransform(GpPen*, float, float, MatrixOrder);
Status GdipRotatePenTransform(GpPen*, float, MatrixOrder);
Status GdipSetPenColor(GpPen*, uint);
Status GdipGetPenColor(GpPen*, uint*);
Status GdipSetPenBrushFill(GpPen*, GpBrush*);
Status GdipGetPenBrushFill(GpPen*, GpBrush**);
Status GdipGetPenFillType(GpPen*, PenType*);
Status GdipGetPenDashStyle(GpPen*, DashStyle*);
Status GdipSetPenDashStyle(GpPen*, DashStyle);
Status GdipGetPenDashOffset(GpPen*, float*);
Status GdipSetPenDashOffset(GpPen*, float);
Status GdipGetPenDashCount(GpPen*, int*);
Status GdipSetPenDashArray(GpPen*, const(float)*, int);
Status GdipGetPenDashArray(GpPen*, float*, int);
Status GdipGetPenCompoundCount(GpPen*, int*);
Status GdipSetPenCompoundArray(GpPen*, const(float)*, int);
Status GdipGetPenCompoundArray(GpPen*, float*, int);
Status GdipCreateCustomLineCap(GpPath*, GpPath*, LineCap, float, GpCustomLineCap**);
Status GdipDeleteCustomLineCap(GpCustomLineCap*);
Status GdipCloneCustomLineCap(GpCustomLineCap*, GpCustomLineCap**);
Status GdipGetCustomLineCapType(GpCustomLineCap*, CustomLineCapType*);
Status GdipSetCustomLineCapStrokeCaps(GpCustomLineCap*, LineCap, LineCap);
Status GdipGetCustomLineCapStrokeCaps(GpCustomLineCap*, LineCap*, LineCap*);
Status GdipSetCustomLineCapStrokeJoin(GpCustomLineCap*, LineJoin);
Status GdipGetCustomLineCapStrokeJoin(GpCustomLineCap*, LineJoin*);
Status GdipSetCustomLineCapBaseCap(GpCustomLineCap*, LineCap);
Status GdipGetCustomLineCapBaseCap(GpCustomLineCap*, LineCap*);
Status GdipSetCustomLineCapBaseInset(GpCustomLineCap*, float);
Status GdipGetCustomLineCapBaseInset(GpCustomLineCap*, float*);
Status GdipSetCustomLineCapWidthScale(GpCustomLineCap*, float);
Status GdipGetCustomLineCapWidthScale(GpCustomLineCap*, float*);
Status GdipCreateAdjustableArrowCap(float, float, BOOL, GpAdjustableArrowCap**);
Status GdipSetAdjustableArrowCapHeight(GpAdjustableArrowCap*, float);
Status GdipGetAdjustableArrowCapHeight(GpAdjustableArrowCap*, float*);
Status GdipSetAdjustableArrowCapWidth(GpAdjustableArrowCap*, float);
Status GdipGetAdjustableArrowCapWidth(GpAdjustableArrowCap*, float*);
Status GdipSetAdjustableArrowCapMiddleInset(GpAdjustableArrowCap*, float);
Status GdipGetAdjustableArrowCapMiddleInset(GpAdjustableArrowCap*, float*);
Status GdipSetAdjustableArrowCapFillState(GpAdjustableArrowCap*, BOOL);
Status GdipGetAdjustableArrowCapFillState(GpAdjustableArrowCap*, BOOL*);
Status GdipLoadImageFromStream(IStream, GpImage**);
Status GdipLoadImageFromFile(const(wchar)*, GpImage**);
Status GdipLoadImageFromStreamICM(IStream, GpImage**);
Status GdipLoadImageFromFileICM(const(wchar)*, GpImage**);
Status GdipCloneImage(GpImage*, GpImage**);
Status GdipDisposeImage(GpImage*);
Status GdipSaveImageToFile(GpImage*, const(wchar)*, const(GUID)*, const(EncoderParameters)*);
Status GdipSaveImageToStream(GpImage*, IStream, const(GUID)*, const(EncoderParameters)*);
Status GdipSaveAdd(GpImage*, const(EncoderParameters)*);
Status GdipSaveAddImage(GpImage*, GpImage*, const(EncoderParameters)*);
Status GdipGetImageGraphicsContext(GpImage*, GpGraphics**);
Status GdipGetImageBounds(GpImage*, RectF*, Unit*);
Status GdipGetImageDimension(GpImage*, float*, float*);
Status GdipGetImageType(GpImage*, ImageType*);
Status GdipGetImageWidth(GpImage*, uint*);
Status GdipGetImageHeight(GpImage*, uint*);
Status GdipGetImageHorizontalResolution(GpImage*, float*);
Status GdipGetImageVerticalResolution(GpImage*, float*);
Status GdipGetImageFlags(GpImage*, uint*);
Status GdipGetImageRawFormat(GpImage*, GUID*);
Status GdipGetImagePixelFormat(GpImage*, int*);
Status GdipGetImageThumbnail(GpImage*, uint, uint, GpImage**, long, void*);
Status GdipGetEncoderParameterListSize(GpImage*, const(GUID)*, uint*);
Status GdipGetEncoderParameterList(GpImage*, const(GUID)*, uint, EncoderParameters*);
Status GdipImageGetFrameDimensionsCount(GpImage*, uint*);
Status GdipImageGetFrameDimensionsList(GpImage*, GUID*, uint);
Status GdipImageGetFrameCount(GpImage*, const(GUID)*, uint*);
Status GdipImageSelectActiveFrame(GpImage*, const(GUID)*, uint);
Status GdipImageRotateFlip(GpImage*, RotateFlipType);
Status GdipGetImagePalette(GpImage*, ColorPalette*, int);
Status GdipSetImagePalette(GpImage*, const(ColorPalette)*);
Status GdipGetImagePaletteSize(GpImage*, int*);
Status GdipGetPropertyCount(GpImage*, uint*);
Status GdipGetPropertyIdList(GpImage*, uint, uint*);
Status GdipGetPropertyItemSize(GpImage*, uint, uint*);
Status GdipGetPropertyItem(GpImage*, uint, uint, PropertyItem*);
Status GdipGetPropertySize(GpImage*, uint*, uint*);
Status GdipGetAllPropertyItems(GpImage*, uint, uint, PropertyItem*);
Status GdipRemovePropertyItem(GpImage*, uint);
Status GdipSetPropertyItem(GpImage*, const(PropertyItem)*);
Status GdipFindFirstImageItem(GpImage*, ImageItemData*);
Status GdipFindNextImageItem(GpImage*, ImageItemData*);
Status GdipGetImageItemData(GpImage*, ImageItemData*);
Status GdipImageForceValidation(GpImage*);
Status GdipCreateBitmapFromStream(IStream, GpBitmap**);
Status GdipCreateBitmapFromFile(const(wchar)*, GpBitmap**);
Status GdipCreateBitmapFromStreamICM(IStream, GpBitmap**);
Status GdipCreateBitmapFromFileICM(const(wchar)*, GpBitmap**);
Status GdipCreateBitmapFromScan0(int, int, int, int, ubyte*, GpBitmap**);
Status GdipCreateBitmapFromGraphics(int, int, GpGraphics*, GpBitmap**);
Status GdipCreateBitmapFromDirectDrawSurface(IDirectDrawSurface7, GpBitmap**);
Status GdipCreateBitmapFromGdiDib(const(BITMAPINFO)*, void*, GpBitmap**);
Status GdipCreateBitmapFromHBITMAP(HBITMAP, HPALETTE, GpBitmap**);
Status GdipCreateHBITMAPFromBitmap(GpBitmap*, HBITMAP*, uint);
Status GdipCreateBitmapFromHICON(HICON, GpBitmap**);
Status GdipCreateHICONFromBitmap(GpBitmap*, HICON*);
Status GdipCreateBitmapFromResource(HINSTANCE, const(wchar)*, GpBitmap**);
Status GdipCloneBitmapArea(float, float, float, float, int, GpBitmap*, GpBitmap**);
Status GdipCloneBitmapAreaI(int, int, int, int, int, GpBitmap*, GpBitmap**);
Status GdipBitmapLockBits(GpBitmap*, const(Rect)*, uint, int, BitmapData*);
Status GdipBitmapUnlockBits(GpBitmap*, BitmapData*);
Status GdipBitmapGetPixel(GpBitmap*, int, int, uint*);
Status GdipBitmapSetPixel(GpBitmap*, int, int, uint);
Status GdipImageSetAbort(GpImage*, GdiplusAbort);
Status GdipGraphicsSetAbort(GpGraphics*, GdiplusAbort);
Status GdipBitmapConvertFormat(GpBitmap*, int, DitherType, PaletteType, ColorPalette*, float);
Status GdipInitializePalette(ColorPalette*, PaletteType, int, BOOL, GpBitmap*);
Status GdipBitmapApplyEffect(GpBitmap*, CGpEffect*, RECT*, BOOL, void**, int*);
Status GdipBitmapCreateApplyEffect(GpBitmap**, int, CGpEffect*, RECT*, RECT*, GpBitmap**, BOOL, void**, int*);
Status GdipBitmapGetHistogram(GpBitmap*, HistogramFormat, uint, uint*, uint*, uint*, uint*);
Status GdipBitmapGetHistogramSize(HistogramFormat, uint*);
Status GdipBitmapSetResolution(GpBitmap*, float, float);
Status GdipCreateImageAttributes(GpImageAttributes**);
Status GdipCloneImageAttributes(const(GpImageAttributes)*, GpImageAttributes**);
Status GdipDisposeImageAttributes(GpImageAttributes*);
Status GdipSetImageAttributesToIdentity(GpImageAttributes*, ColorAdjustType);
Status GdipResetImageAttributes(GpImageAttributes*, ColorAdjustType);
Status GdipSetImageAttributesColorMatrix(GpImageAttributes*, ColorAdjustType, BOOL, const(ColorMatrix)*, const(ColorMatrix)*, ColorMatrixFlags);
Status GdipSetImageAttributesThreshold(GpImageAttributes*, ColorAdjustType, BOOL, float);
Status GdipSetImageAttributesGamma(GpImageAttributes*, ColorAdjustType, BOOL, float);
Status GdipSetImageAttributesNoOp(GpImageAttributes*, ColorAdjustType, BOOL);
Status GdipSetImageAttributesColorKeys(GpImageAttributes*, ColorAdjustType, BOOL, uint, uint);
Status GdipSetImageAttributesOutputChannel(GpImageAttributes*, ColorAdjustType, BOOL, ColorChannelFlags);
Status GdipSetImageAttributesOutputChannelColorProfile(GpImageAttributes*, ColorAdjustType, BOOL, const(wchar)*);
Status GdipSetImageAttributesRemapTable(GpImageAttributes*, ColorAdjustType, BOOL, uint, const(ColorMap)*);
Status GdipSetImageAttributesWrapMode(GpImageAttributes*, WrapMode, uint, BOOL);
Status GdipGetImageAttributesAdjustedPalette(GpImageAttributes*, ColorPalette*, ColorAdjustType);
Status GdipFlush(GpGraphics*, FlushIntention);
Status GdipCreateFromHDC(HDC, GpGraphics**);
Status GdipCreateFromHDC2(HDC, HANDLE, GpGraphics**);
Status GdipCreateFromHWND(HWND, GpGraphics**);
Status GdipCreateFromHWNDICM(HWND, GpGraphics**);
Status GdipDeleteGraphics(GpGraphics*);
Status GdipGetDC(GpGraphics*, HDC*);
Status GdipReleaseDC(GpGraphics*, HDC);
Status GdipSetCompositingMode(GpGraphics*, CompositingMode);
Status GdipGetCompositingMode(GpGraphics*, CompositingMode*);
Status GdipSetRenderingOrigin(GpGraphics*, int, int);
Status GdipGetRenderingOrigin(GpGraphics*, int*, int*);
Status GdipSetCompositingQuality(GpGraphics*, CompositingQuality);
Status GdipGetCompositingQuality(GpGraphics*, CompositingQuality*);
Status GdipSetSmoothingMode(GpGraphics*, SmoothingMode);
Status GdipGetSmoothingMode(GpGraphics*, SmoothingMode*);
Status GdipSetPixelOffsetMode(GpGraphics*, PixelOffsetMode);
Status GdipGetPixelOffsetMode(GpGraphics*, PixelOffsetMode*);
Status GdipSetTextRenderingHint(GpGraphics*, TextRenderingHint);
Status GdipGetTextRenderingHint(GpGraphics*, TextRenderingHint*);
Status GdipSetTextContrast(GpGraphics*, uint);
Status GdipGetTextContrast(GpGraphics*, uint*);
Status GdipSetInterpolationMode(GpGraphics*, InterpolationMode);
Status GdipGetInterpolationMode(GpGraphics*, InterpolationMode*);
Status GdipSetWorldTransform(GpGraphics*, Matrix*);
Status GdipResetWorldTransform(GpGraphics*);
Status GdipMultiplyWorldTransform(GpGraphics*, const(Matrix)*, MatrixOrder);
Status GdipTranslateWorldTransform(GpGraphics*, float, float, MatrixOrder);
Status GdipScaleWorldTransform(GpGraphics*, float, float, MatrixOrder);
Status GdipRotateWorldTransform(GpGraphics*, float, MatrixOrder);
Status GdipGetWorldTransform(GpGraphics*, Matrix*);
Status GdipResetPageTransform(GpGraphics*);
Status GdipGetPageUnit(GpGraphics*, Unit*);
Status GdipGetPageScale(GpGraphics*, float*);
Status GdipSetPageUnit(GpGraphics*, Unit);
Status GdipSetPageScale(GpGraphics*, float);
Status GdipGetDpiX(GpGraphics*, float*);
Status GdipGetDpiY(GpGraphics*, float*);
Status GdipTransformPoints(GpGraphics*, CoordinateSpace, CoordinateSpace, PointF*, int);
Status GdipTransformPointsI(GpGraphics*, CoordinateSpace, CoordinateSpace, Point*, int);
Status GdipGetNearestColor(GpGraphics*, uint*);
HPALETTE GdipCreateHalftonePalette();
Status GdipDrawLine(GpGraphics*, GpPen*, float, float, float, float);
Status GdipDrawLineI(GpGraphics*, GpPen*, int, int, int, int);
Status GdipDrawLines(GpGraphics*, GpPen*, const(PointF)*, int);
Status GdipDrawLinesI(GpGraphics*, GpPen*, const(Point)*, int);
Status GdipDrawArc(GpGraphics*, GpPen*, float, float, float, float, float, float);
Status GdipDrawArcI(GpGraphics*, GpPen*, int, int, int, int, float, float);
Status GdipDrawBezier(GpGraphics*, GpPen*, float, float, float, float, float, float, float, float);
Status GdipDrawBezierI(GpGraphics*, GpPen*, int, int, int, int, int, int, int, int);
Status GdipDrawBeziers(GpGraphics*, GpPen*, const(PointF)*, int);
Status GdipDrawBeziersI(GpGraphics*, GpPen*, const(Point)*, int);
Status GdipDrawRectangle(GpGraphics*, GpPen*, float, float, float, float);
Status GdipDrawRectangleI(GpGraphics*, GpPen*, int, int, int, int);
Status GdipDrawRectangles(GpGraphics*, GpPen*, const(RectF)*, int);
Status GdipDrawRectanglesI(GpGraphics*, GpPen*, const(Rect)*, int);
Status GdipDrawEllipse(GpGraphics*, GpPen*, float, float, float, float);
Status GdipDrawEllipseI(GpGraphics*, GpPen*, int, int, int, int);
Status GdipDrawPie(GpGraphics*, GpPen*, float, float, float, float, float, float);
Status GdipDrawPieI(GpGraphics*, GpPen*, int, int, int, int, float, float);
Status GdipDrawPolygon(GpGraphics*, GpPen*, const(PointF)*, int);
Status GdipDrawPolygonI(GpGraphics*, GpPen*, const(Point)*, int);
Status GdipDrawPath(GpGraphics*, GpPen*, GpPath*);
Status GdipDrawCurve(GpGraphics*, GpPen*, const(PointF)*, int);
Status GdipDrawCurveI(GpGraphics*, GpPen*, const(Point)*, int);
Status GdipDrawCurve2(GpGraphics*, GpPen*, const(PointF)*, int, float);
Status GdipDrawCurve2I(GpGraphics*, GpPen*, const(Point)*, int, float);
Status GdipDrawCurve3(GpGraphics*, GpPen*, const(PointF)*, int, int, int, float);
Status GdipDrawCurve3I(GpGraphics*, GpPen*, const(Point)*, int, int, int, float);
Status GdipDrawClosedCurve(GpGraphics*, GpPen*, const(PointF)*, int);
Status GdipDrawClosedCurveI(GpGraphics*, GpPen*, const(Point)*, int);
Status GdipDrawClosedCurve2(GpGraphics*, GpPen*, const(PointF)*, int, float);
Status GdipDrawClosedCurve2I(GpGraphics*, GpPen*, const(Point)*, int, float);
Status GdipGraphicsClear(GpGraphics*, uint);
Status GdipFillRectangle(GpGraphics*, GpBrush*, float, float, float, float);
Status GdipFillRectangleI(GpGraphics*, GpBrush*, int, int, int, int);
Status GdipFillRectangles(GpGraphics*, GpBrush*, const(RectF)*, int);
Status GdipFillRectanglesI(GpGraphics*, GpBrush*, const(Rect)*, int);
Status GdipFillPolygon(GpGraphics*, GpBrush*, const(PointF)*, int, FillMode);
Status GdipFillPolygonI(GpGraphics*, GpBrush*, const(Point)*, int, FillMode);
Status GdipFillPolygon2(GpGraphics*, GpBrush*, const(PointF)*, int);
Status GdipFillPolygon2I(GpGraphics*, GpBrush*, const(Point)*, int);
Status GdipFillEllipse(GpGraphics*, GpBrush*, float, float, float, float);
Status GdipFillEllipseI(GpGraphics*, GpBrush*, int, int, int, int);
Status GdipFillPie(GpGraphics*, GpBrush*, float, float, float, float, float, float);
Status GdipFillPieI(GpGraphics*, GpBrush*, int, int, int, int, float, float);
Status GdipFillPath(GpGraphics*, GpBrush*, GpPath*);
Status GdipFillClosedCurve(GpGraphics*, GpBrush*, const(PointF)*, int);
Status GdipFillClosedCurveI(GpGraphics*, GpBrush*, const(Point)*, int);
Status GdipFillClosedCurve2(GpGraphics*, GpBrush*, const(PointF)*, int, float, FillMode);
Status GdipFillClosedCurve2I(GpGraphics*, GpBrush*, const(Point)*, int, float, FillMode);
Status GdipFillRegion(GpGraphics*, GpBrush*, GpRegion*);
Status GdipDrawImageFX(GpGraphics*, GpImage*, RectF*, Matrix*, CGpEffect*, GpImageAttributes*, Unit);
Status GdipDrawImage(GpGraphics*, GpImage*, float, float);
Status GdipDrawImageI(GpGraphics*, GpImage*, int, int);
Status GdipDrawImageRect(GpGraphics*, GpImage*, float, float, float, float);
Status GdipDrawImageRectI(GpGraphics*, GpImage*, int, int, int, int);
Status GdipDrawImagePoints(GpGraphics*, GpImage*, const(PointF)*, int);
Status GdipDrawImagePointsI(GpGraphics*, GpImage*, const(Point)*, int);
Status GdipDrawImagePointRect(GpGraphics*, GpImage*, float, float, float, float, float, float, Unit);
Status GdipDrawImagePointRectI(GpGraphics*, GpImage*, int, int, int, int, int, int, Unit);
Status GdipDrawImageRectRect(GpGraphics*, GpImage*, float, float, float, float, float, float, float, float, Unit, const(GpImageAttributes)*, long, void*);
Status GdipDrawImageRectRectI(GpGraphics*, GpImage*, int, int, int, int, int, int, int, int, Unit, const(GpImageAttributes)*, long, void*);
Status GdipDrawImagePointsRect(GpGraphics*, GpImage*, const(PointF)*, int, float, float, float, float, Unit, const(GpImageAttributes)*, long, void*);
Status GdipDrawImagePointsRectI(GpGraphics*, GpImage*, const(Point)*, int, int, int, int, int, Unit, const(GpImageAttributes)*, long, void*);
Status GdipEnumerateMetafileDestPoint(GpGraphics*, const(GpMetafile)*, const(PointF)*, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileDestPointI(GpGraphics*, const(GpMetafile)*, const(Point)*, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileDestRect(GpGraphics*, const(GpMetafile)*, const(RectF)*, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileDestRectI(GpGraphics*, const(GpMetafile)*, const(Rect)*, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileDestPoints(GpGraphics*, const(GpMetafile)*, const(PointF)*, int, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileDestPointsI(GpGraphics*, const(GpMetafile)*, const(Point)*, int, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileSrcRectDestPoint(GpGraphics*, const(GpMetafile)*, const(PointF)*, const(RectF)*, Unit, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileSrcRectDestPointI(GpGraphics*, const(GpMetafile)*, const(Point)*, const(Rect)*, Unit, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileSrcRectDestRect(GpGraphics*, const(GpMetafile)*, const(RectF)*, const(RectF)*, Unit, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileSrcRectDestRectI(GpGraphics*, const(GpMetafile)*, const(Rect)*, const(Rect)*, Unit, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileSrcRectDestPoints(GpGraphics*, const(GpMetafile)*, const(PointF)*, int, const(RectF)*, Unit, long, void*, const(GpImageAttributes)*);
Status GdipEnumerateMetafileSrcRectDestPointsI(GpGraphics*, const(GpMetafile)*, const(Point)*, int, const(Rect)*, Unit, long, void*, const(GpImageAttributes)*);
Status GdipPlayMetafileRecord(const(GpMetafile)*, EmfPlusRecordType, uint, uint, const(ubyte)*);
Status GdipSetClipGraphics(GpGraphics*, GpGraphics*, CombineMode);
Status GdipSetClipRect(GpGraphics*, float, float, float, float, CombineMode);
Status GdipSetClipRectI(GpGraphics*, int, int, int, int, CombineMode);
Status GdipSetClipPath(GpGraphics*, GpPath*, CombineMode);
Status GdipSetClipRegion(GpGraphics*, GpRegion*, CombineMode);
Status GdipSetClipHrgn(GpGraphics*, HRGN, CombineMode);
Status GdipResetClip(GpGraphics*);
Status GdipTranslateClip(GpGraphics*, float, float);
Status GdipTranslateClipI(GpGraphics*, int, int);
Status GdipGetClip(GpGraphics*, GpRegion*);
Status GdipGetClipBounds(GpGraphics*, RectF*);
Status GdipGetClipBoundsI(GpGraphics*, Rect*);
Status GdipIsClipEmpty(GpGraphics*, BOOL*);
Status GdipGetVisibleClipBounds(GpGraphics*, RectF*);
Status GdipGetVisibleClipBoundsI(GpGraphics*, Rect*);
Status GdipIsVisibleClipEmpty(GpGraphics*, BOOL*);
Status GdipIsVisiblePoint(GpGraphics*, float, float, BOOL*);
Status GdipIsVisiblePointI(GpGraphics*, int, int, BOOL*);
Status GdipIsVisibleRect(GpGraphics*, float, float, float, float, BOOL*);
Status GdipIsVisibleRectI(GpGraphics*, int, int, int, int, BOOL*);
Status GdipSaveGraphics(GpGraphics*, uint*);
Status GdipRestoreGraphics(GpGraphics*, uint);
Status GdipBeginContainer(GpGraphics*, const(RectF)*, const(RectF)*, Unit, uint*);
Status GdipBeginContainerI(GpGraphics*, const(Rect)*, const(Rect)*, Unit, uint*);
Status GdipBeginContainer2(GpGraphics*, uint*);
Status GdipEndContainer(GpGraphics*, uint);
Status GdipGetMetafileHeaderFromWmf(HMETAFILE, const(WmfPlaceableFileHeader)*, MetafileHeader*);
Status GdipGetMetafileHeaderFromEmf(HENHMETAFILE, MetafileHeader*);
Status GdipGetMetafileHeaderFromFile(const(wchar)*, MetafileHeader*);
Status GdipGetMetafileHeaderFromStream(IStream, MetafileHeader*);
Status GdipGetMetafileHeaderFromMetafile(GpMetafile*, MetafileHeader*);
Status GdipGetHemfFromMetafile(GpMetafile*, HENHMETAFILE*);
Status GdipCreateStreamOnFile(const(wchar)*, uint, IStream*);
Status GdipCreateMetafileFromWmf(HMETAFILE, BOOL, const(WmfPlaceableFileHeader)*, GpMetafile**);
Status GdipCreateMetafileFromEmf(HENHMETAFILE, BOOL, GpMetafile**);
Status GdipCreateMetafileFromFile(const(wchar)*, GpMetafile**);
Status GdipCreateMetafileFromWmfFile(const(wchar)*, const(WmfPlaceableFileHeader)*, GpMetafile**);
Status GdipCreateMetafileFromStream(IStream, GpMetafile**);
Status GdipRecordMetafile(HDC, EmfType, const(RectF)*, MetafileFrameUnit, const(wchar)*, GpMetafile**);
Status GdipRecordMetafileI(HDC, EmfType, const(Rect)*, MetafileFrameUnit, const(wchar)*, GpMetafile**);
Status GdipRecordMetafileFileName(const(wchar)*, HDC, EmfType, const(RectF)*, MetafileFrameUnit, const(wchar)*, GpMetafile**);
Status GdipRecordMetafileFileNameI(const(wchar)*, HDC, EmfType, const(Rect)*, MetafileFrameUnit, const(wchar)*, GpMetafile**);
Status GdipRecordMetafileStream(IStream, HDC, EmfType, const(RectF)*, MetafileFrameUnit, const(wchar)*, GpMetafile**);
Status GdipRecordMetafileStreamI(IStream, HDC, EmfType, const(Rect)*, MetafileFrameUnit, const(wchar)*, GpMetafile**);
Status GdipSetMetafileDownLevelRasterizationLimit(GpMetafile*, uint);
Status GdipGetMetafileDownLevelRasterizationLimit(const(GpMetafile)*, uint*);
Status GdipGetImageDecodersSize(uint*, uint*);
Status GdipGetImageDecoders(uint, uint, ImageCodecInfo*);
Status GdipGetImageEncodersSize(uint*, uint*);
Status GdipGetImageEncoders(uint, uint, ImageCodecInfo*);
Status GdipComment(GpGraphics*, uint, const(ubyte)*);
Status GdipCreateFontFamilyFromName(const(wchar)*, GpFontCollection*, GpFontFamily**);
Status GdipDeleteFontFamily(GpFontFamily*);
Status GdipCloneFontFamily(GpFontFamily*, GpFontFamily**);
Status GdipGetGenericFontFamilySansSerif(GpFontFamily**);
Status GdipGetGenericFontFamilySerif(GpFontFamily**);
Status GdipGetGenericFontFamilyMonospace(GpFontFamily**);
Status GdipGetFamilyName(const(GpFontFamily)*, PWSTR, ushort);
Status GdipIsStyleAvailable(const(GpFontFamily)*, int, BOOL*);
Status GdipGetEmHeight(const(GpFontFamily)*, int, ushort*);
Status GdipGetCellAscent(const(GpFontFamily)*, int, ushort*);
Status GdipGetCellDescent(const(GpFontFamily)*, int, ushort*);
Status GdipGetLineSpacing(const(GpFontFamily)*, int, ushort*);
Status GdipCreateFontFromDC(HDC, GpFont**);
Status GdipCreateFontFromLogfontA(HDC, const(LOGFONTA)*, GpFont**);
Status GdipCreateFontFromLogfontW(HDC, const(LOGFONTW)*, GpFont**);
Status GdipCreateFont(const(GpFontFamily)*, float, int, Unit, GpFont**);
Status GdipCloneFont(GpFont*, GpFont**);
Status GdipDeleteFont(GpFont*);
Status GdipGetFamily(GpFont*, GpFontFamily**);
Status GdipGetFontStyle(GpFont*, int*);
Status GdipGetFontSize(GpFont*, float*);
Status GdipGetFontUnit(GpFont*, Unit*);
Status GdipGetFontHeight(const(GpFont)*, const(GpGraphics)*, float*);
Status GdipGetFontHeightGivenDPI(const(GpFont)*, float, float*);
Status GdipGetLogFontA(GpFont*, GpGraphics*, LOGFONTA*);
Status GdipGetLogFontW(GpFont*, GpGraphics*, LOGFONTW*);
Status GdipNewInstalledFontCollection(GpFontCollection**);
Status GdipNewPrivateFontCollection(GpFontCollection**);
Status GdipDeletePrivateFontCollection(GpFontCollection**);
Status GdipGetFontCollectionFamilyCount(GpFontCollection*, int*);
Status GdipGetFontCollectionFamilyList(GpFontCollection*, int, GpFontFamily**, int*);
Status GdipPrivateAddFontFile(GpFontCollection*, const(wchar)*);
Status GdipPrivateAddMemoryFont(GpFontCollection*, const(void)*, int);
Status GdipDrawString(GpGraphics*, const(wchar)*, int, const(GpFont)*, const(RectF)*, const(GpStringFormat)*, const(GpBrush)*);
Status GdipMeasureString(GpGraphics*, const(wchar)*, int, const(GpFont)*, const(RectF)*, const(GpStringFormat)*, RectF*, int*, int*);
Status GdipMeasureCharacterRanges(GpGraphics*, const(wchar)*, int, const(GpFont)*, const(RectF)*, const(GpStringFormat)*, int, GpRegion**);
Status GdipDrawDriverString(GpGraphics*, const(ushort)*, int, const(GpFont)*, const(GpBrush)*, const(PointF)*, int, const(Matrix)*);
Status GdipMeasureDriverString(GpGraphics*, const(ushort)*, int, const(GpFont)*, const(PointF)*, int, const(Matrix)*, RectF*);
Status GdipCreateStringFormat(int, ushort, GpStringFormat**);
Status GdipStringFormatGetGenericDefault(GpStringFormat**);
Status GdipStringFormatGetGenericTypographic(GpStringFormat**);
Status GdipDeleteStringFormat(GpStringFormat*);
Status GdipCloneStringFormat(const(GpStringFormat)*, GpStringFormat**);
Status GdipSetStringFormatFlags(GpStringFormat*, int);
Status GdipGetStringFormatFlags(const(GpStringFormat)*, int*);
Status GdipSetStringFormatAlign(GpStringFormat*, StringAlignment);
Status GdipGetStringFormatAlign(const(GpStringFormat)*, StringAlignment*);
Status GdipSetStringFormatLineAlign(GpStringFormat*, StringAlignment);
Status GdipGetStringFormatLineAlign(const(GpStringFormat)*, StringAlignment*);
Status GdipSetStringFormatTrimming(GpStringFormat*, StringTrimming);
Status GdipGetStringFormatTrimming(const(GpStringFormat)*, StringTrimming*);
Status GdipSetStringFormatHotkeyPrefix(GpStringFormat*, int);
Status GdipGetStringFormatHotkeyPrefix(const(GpStringFormat)*, int*);
Status GdipSetStringFormatTabStops(GpStringFormat*, float, int, const(float)*);
Status GdipGetStringFormatTabStops(const(GpStringFormat)*, int, float*, float*);
Status GdipGetStringFormatTabStopCount(const(GpStringFormat)*, int*);
Status GdipSetStringFormatDigitSubstitution(GpStringFormat*, ushort, StringDigitSubstitute);
Status GdipGetStringFormatDigitSubstitution(const(GpStringFormat)*, ushort*, StringDigitSubstitute*);
Status GdipGetStringFormatMeasurableCharacterRangeCount(const(GpStringFormat)*, int*);
Status GdipSetStringFormatMeasurableCharacterRanges(GpStringFormat*, int, const(CharacterRange)*);
Status GdipCreateCachedBitmap(GpBitmap*, GpGraphics*, GpCachedBitmap**);
Status GdipDeleteCachedBitmap(GpCachedBitmap*);
Status GdipDrawCachedBitmap(GpGraphics*, GpCachedBitmap*, int, int);
uint GdipEmfToWmfBits(HENHMETAFILE, uint, ubyte*, int, int);
Status GdipSetImageAttributesCachedBackground(GpImageAttributes*, BOOL);
Status GdipTestControl(GpTestControlEnum, void*);
Status GdiplusNotificationHook(ulong*);
void GdiplusNotificationUnhook(ulong);
Status GdipConvertToEmfPlus(const(GpGraphics)*, GpMetafile*, int*, EmfType, const(wchar)*, GpMetafile**);
Status GdipConvertToEmfPlusToFile(const(GpGraphics)*, GpMetafile*, int*, const(wchar)*, EmfType, const(wchar)*, GpMetafile**);
Status GdipConvertToEmfPlusToStream(const(GpGraphics)*, GpMetafile*, int*, IStream, EmfType, const(wchar)*, GpMetafile**);
enum GDIP_EMFPLUS_RECORD_BASE = 0x00004000;
enum GDIP_WMF_RECORD_BASE = 0x00010000;
enum ImageFormatUndefined = GUID(0xb96b3ca9, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatMemoryBMP = GUID(0xb96b3caa, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatBMP = GUID(0xb96b3cab, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatEMF = GUID(0xb96b3cac, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatWMF = GUID(0xb96b3cad, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatJPEG = GUID(0xb96b3cae, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatPNG = GUID(0xb96b3caf, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatGIF = GUID(0xb96b3cb0, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatTIFF = GUID(0xb96b3cb1, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatEXIF = GUID(0xb96b3cb2, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatIcon = GUID(0xb96b3cb5, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatHEIF = GUID(0xb96b3cb6, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum ImageFormatWEBP = GUID(0xb96b3cb7, 0x728, 0x11d3, [0x9d, 0x7b, 0x0, 0x0, 0xf8, 0x1e, 0xf3, 0x2e]);
enum FrameDimensionTime = GUID(0x6aedbd6d, 0x3fb5, 0x418a, [0x83, 0xa6, 0x7f, 0x45, 0x22, 0x9d, 0xc8, 0x72]);
enum FrameDimensionResolution = GUID(0x84236f7b, 0x3bd3, 0x428f, [0x8d, 0xab, 0x4e, 0xa1, 0x43, 0x9c, 0xa3, 0x15]);
enum FrameDimensionPage = GUID(0x7462dc86, 0x6180, 0x4c7e, [0x8e, 0x3f, 0xee, 0x73, 0x33, 0xa7, 0xa4, 0x83]);
enum FormatIDImageInformation = GUID(0xe5836cbe, 0x5eef, 0x4f1d, [0xac, 0xde, 0xae, 0x4c, 0x43, 0xb6, 0x8, 0xce]);
enum FormatIDJpegAppHeaders = GUID(0x1c4afdcd, 0x6177, 0x43cf, [0xab, 0xc7, 0x5f, 0x51, 0xaf, 0x39, 0xee, 0x85]);
enum EncoderCompression = GUID(0xe09d739d, 0xccd4, 0x44ee, [0x8e, 0xba, 0x3f, 0xbf, 0x8b, 0xe4, 0xfc, 0x58]);
enum EncoderColorDepth = GUID(0x66087055, 0xad66, 0x4c7c, [0x9a, 0x18, 0x38, 0xa2, 0x31, 0xb, 0x83, 0x37]);
enum EncoderScanMethod = GUID(0x3a4e2661, 0x3109, 0x4e56, [0x85, 0x36, 0x42, 0xc1, 0x56, 0xe7, 0xdc, 0xfa]);
enum EncoderVersion = GUID(0x24d18c76, 0x814a, 0x41a4, [0xbf, 0x53, 0x1c, 0x21, 0x9c, 0xcc, 0xf7, 0x97]);
enum EncoderRenderMethod = GUID(0x6d42c53a, 0x229a, 0x4825, [0x8b, 0xb7, 0x5c, 0x99, 0xe2, 0xb9, 0xa8, 0xb8]);
enum EncoderQuality = GUID(0x1d5be4b5, 0xfa4a, 0x452d, [0x9c, 0xdd, 0x5d, 0xb3, 0x51, 0x5, 0xe7, 0xeb]);
enum EncoderTransformation = GUID(0x8d0eb2d1, 0xa58e, 0x4ea8, [0xaa, 0x14, 0x10, 0x80, 0x74, 0xb7, 0xb6, 0xf9]);
enum EncoderLuminanceTable = GUID(0xedb33bce, 0x266, 0x4a77, [0xb9, 0x4, 0x27, 0x21, 0x60, 0x99, 0xe7, 0x17]);
enum EncoderChrominanceTable = GUID(0xf2e455dc, 0x9b3, 0x4316, [0x82, 0x60, 0x67, 0x6a, 0xda, 0x32, 0x48, 0x1c]);
enum EncoderSaveFlag = GUID(0x292266fc, 0xac40, 0x47bf, [0x8c, 0xfc, 0xa8, 0x5b, 0x89, 0xa6, 0x55, 0xde]);
enum EncoderColorSpace = GUID(0xae7a62a0, 0xee2c, 0x49d8, [0x9d, 0x7, 0x1b, 0xa8, 0xa9, 0x27, 0x59, 0x6e]);
enum EncoderImageItems = GUID(0x63875e13, 0x1f1d, 0x45ab, [0x91, 0x95, 0xa2, 0x9b, 0x60, 0x66, 0xa6, 0x50]);
enum EncoderSaveAsCMYK = GUID(0xa219bbc9, 0xa9d, 0x4005, [0xa3, 0xee, 0x3a, 0x42, 0x1b, 0x8b, 0xb0, 0x6c]);
enum CodecIImageBytes = GUID(0x25d1823, 0x6c7d, 0x447b, [0xbb, 0xdb, 0xa3, 0xcb, 0xc3, 0xdf, 0xa2, 0xfc]);
enum PropertyTagTypeByte = 0x00000001;
enum PropertyTagTypeASCII = 0x00000002;
enum PropertyTagTypeShort = 0x00000003;
enum PropertyTagTypeLong = 0x00000004;
enum PropertyTagTypeRational = 0x00000005;
enum PropertyTagTypeUndefined = 0x00000007;
enum PropertyTagTypeSLONG = 0x00000009;
enum PropertyTagTypeSRational = 0x0000000a;
enum PropertyTagExifIFD = 0x00008769;
enum PropertyTagGpsIFD = 0x00008825;
enum PropertyTagNewSubfileType = 0x000000fe;
enum PropertyTagSubfileType = 0x000000ff;
enum PropertyTagImageWidth = 0x00000100;
enum PropertyTagImageHeight = 0x00000101;
enum PropertyTagBitsPerSample = 0x00000102;
enum PropertyTagCompression = 0x00000103;
enum PropertyTagPhotometricInterp = 0x00000106;
enum PropertyTagThreshHolding = 0x00000107;
enum PropertyTagCellWidth = 0x00000108;
enum PropertyTagCellHeight = 0x00000109;
enum PropertyTagFillOrder = 0x0000010a;
enum PropertyTagDocumentName = 0x0000010d;
enum PropertyTagImageDescription = 0x0000010e;
enum PropertyTagEquipMake = 0x0000010f;
enum PropertyTagEquipModel = 0x00000110;
enum PropertyTagStripOffsets = 0x00000111;
enum PropertyTagOrientation = 0x00000112;
enum PropertyTagSamplesPerPixel = 0x00000115;
enum PropertyTagRowsPerStrip = 0x00000116;
enum PropertyTagStripBytesCount = 0x00000117;
enum PropertyTagMinSampleValue = 0x00000118;
enum PropertyTagMaxSampleValue = 0x00000119;
enum PropertyTagXResolution = 0x0000011a;
enum PropertyTagYResolution = 0x0000011b;
enum PropertyTagPlanarConfig = 0x0000011c;
enum PropertyTagPageName = 0x0000011d;
enum PropertyTagXPosition = 0x0000011e;
enum PropertyTagYPosition = 0x0000011f;
enum PropertyTagFreeOffset = 0x00000120;
enum PropertyTagFreeByteCounts = 0x00000121;
enum PropertyTagGrayResponseUnit = 0x00000122;
enum PropertyTagGrayResponseCurve = 0x00000123;
enum PropertyTagT4Option = 0x00000124;
enum PropertyTagT6Option = 0x00000125;
enum PropertyTagResolutionUnit = 0x00000128;
enum PropertyTagPageNumber = 0x00000129;
enum PropertyTagTransferFuncition = 0x0000012d;
enum PropertyTagSoftwareUsed = 0x00000131;
enum PropertyTagDateTime = 0x00000132;
enum PropertyTagArtist = 0x0000013b;
enum PropertyTagHostComputer = 0x0000013c;
enum PropertyTagPredictor = 0x0000013d;
enum PropertyTagWhitePoint = 0x0000013e;
enum PropertyTagPrimaryChromaticities = 0x0000013f;
enum PropertyTagColorMap = 0x00000140;
enum PropertyTagHalftoneHints = 0x00000141;
enum PropertyTagTileWidth = 0x00000142;
enum PropertyTagTileLength = 0x00000143;
enum PropertyTagTileOffset = 0x00000144;
enum PropertyTagTileByteCounts = 0x00000145;
enum PropertyTagInkSet = 0x0000014c;
enum PropertyTagInkNames = 0x0000014d;
enum PropertyTagNumberOfInks = 0x0000014e;
enum PropertyTagDotRange = 0x00000150;
enum PropertyTagTargetPrinter = 0x00000151;
enum PropertyTagExtraSamples = 0x00000152;
enum PropertyTagSampleFormat = 0x00000153;
enum PropertyTagSMinSampleValue = 0x00000154;
enum PropertyTagSMaxSampleValue = 0x00000155;
enum PropertyTagTransferRange = 0x00000156;
enum PropertyTagJPEGProc = 0x00000200;
enum PropertyTagJPEGInterFormat = 0x00000201;
enum PropertyTagJPEGInterLength = 0x00000202;
enum PropertyTagJPEGRestartInterval = 0x00000203;
enum PropertyTagJPEGLosslessPredictors = 0x00000205;
enum PropertyTagJPEGPointTransforms = 0x00000206;
enum PropertyTagJPEGQTables = 0x00000207;
enum PropertyTagJPEGDCTables = 0x00000208;
enum PropertyTagJPEGACTables = 0x00000209;
enum PropertyTagYCbCrCoefficients = 0x00000211;
enum PropertyTagYCbCrSubsampling = 0x00000212;
enum PropertyTagYCbCrPositioning = 0x00000213;
enum PropertyTagREFBlackWhite = 0x00000214;
enum PropertyTagICCProfile = 0x00008773;
enum PropertyTagGamma = 0x00000301;
enum PropertyTagICCProfileDescriptor = 0x00000302;
enum PropertyTagSRGBRenderingIntent = 0x00000303;
enum PropertyTagImageTitle = 0x00000320;
enum PropertyTagCopyright = 0x00008298;
enum PropertyTagResolutionXUnit = 0x00005001;
enum PropertyTagResolutionYUnit = 0x00005002;
enum PropertyTagResolutionXLengthUnit = 0x00005003;
enum PropertyTagResolutionYLengthUnit = 0x00005004;
enum PropertyTagPrintFlags = 0x00005005;
enum PropertyTagPrintFlagsVersion = 0x00005006;
enum PropertyTagPrintFlagsCrop = 0x00005007;
enum PropertyTagPrintFlagsBleedWidth = 0x00005008;
enum PropertyTagPrintFlagsBleedWidthScale = 0x00005009;
enum PropertyTagHalftoneLPI = 0x0000500a;
enum PropertyTagHalftoneLPIUnit = 0x0000500b;
enum PropertyTagHalftoneDegree = 0x0000500c;
enum PropertyTagHalftoneShape = 0x0000500d;
enum PropertyTagHalftoneMisc = 0x0000500e;
enum PropertyTagHalftoneScreen = 0x0000500f;
enum PropertyTagJPEGQuality = 0x00005010;
enum PropertyTagGridSize = 0x00005011;
enum PropertyTagThumbnailFormat = 0x00005012;
enum PropertyTagThumbnailWidth = 0x00005013;
enum PropertyTagThumbnailHeight = 0x00005014;
enum PropertyTagThumbnailColorDepth = 0x00005015;
enum PropertyTagThumbnailPlanes = 0x00005016;
enum PropertyTagThumbnailRawBytes = 0x00005017;
enum PropertyTagThumbnailSize = 0x00005018;
enum PropertyTagThumbnailCompressedSize = 0x00005019;
enum PropertyTagColorTransferFunction = 0x0000501a;
enum PropertyTagThumbnailData = 0x0000501b;
enum PropertyTagThumbnailImageWidth = 0x00005020;
enum PropertyTagThumbnailImageHeight = 0x00005021;
enum PropertyTagThumbnailBitsPerSample = 0x00005022;
enum PropertyTagThumbnailCompression = 0x00005023;
enum PropertyTagThumbnailPhotometricInterp = 0x00005024;
enum PropertyTagThumbnailImageDescription = 0x00005025;
enum PropertyTagThumbnailEquipMake = 0x00005026;
enum PropertyTagThumbnailEquipModel = 0x00005027;
enum PropertyTagThumbnailStripOffsets = 0x00005028;
enum PropertyTagThumbnailOrientation = 0x00005029;
enum PropertyTagThumbnailSamplesPerPixel = 0x0000502a;
enum PropertyTagThumbnailRowsPerStrip = 0x0000502b;
enum PropertyTagThumbnailStripBytesCount = 0x0000502c;
enum PropertyTagThumbnailResolutionX = 0x0000502d;
enum PropertyTagThumbnailResolutionY = 0x0000502e;
enum PropertyTagThumbnailPlanarConfig = 0x0000502f;
enum PropertyTagThumbnailResolutionUnit = 0x00005030;
enum PropertyTagThumbnailTransferFunction = 0x00005031;
enum PropertyTagThumbnailSoftwareUsed = 0x00005032;
enum PropertyTagThumbnailDateTime = 0x00005033;
enum PropertyTagThumbnailArtist = 0x00005034;
enum PropertyTagThumbnailWhitePoint = 0x00005035;
enum PropertyTagThumbnailPrimaryChromaticities = 0x00005036;
enum PropertyTagThumbnailYCbCrCoefficients = 0x00005037;
enum PropertyTagThumbnailYCbCrSubsampling = 0x00005038;
enum PropertyTagThumbnailYCbCrPositioning = 0x00005039;
enum PropertyTagThumbnailRefBlackWhite = 0x0000503a;
enum PropertyTagThumbnailCopyRight = 0x0000503b;
enum PropertyTagLuminanceTable = 0x00005090;
enum PropertyTagChrominanceTable = 0x00005091;
enum PropertyTagFrameDelay = 0x00005100;
enum PropertyTagLoopCount = 0x00005101;
enum PropertyTagGlobalPalette = 0x00005102;
enum PropertyTagIndexBackground = 0x00005103;
enum PropertyTagIndexTransparent = 0x00005104;
enum PropertyTagPixelUnit = 0x00005110;
enum PropertyTagPixelPerUnitX = 0x00005111;
enum PropertyTagPixelPerUnitY = 0x00005112;
enum PropertyTagPaletteHistogram = 0x00005113;
enum PropertyTagExifExposureTime = 0x0000829a;
enum PropertyTagExifFNumber = 0x0000829d;
enum PropertyTagExifExposureProg = 0x00008822;
enum PropertyTagExifSpectralSense = 0x00008824;
enum PropertyTagExifISOSpeed = 0x00008827;
enum PropertyTagExifOECF = 0x00008828;
enum PropertyTagExifVer = 0x00009000;
enum PropertyTagExifDTOrig = 0x00009003;
enum PropertyTagExifDTDigitized = 0x00009004;
enum PropertyTagExifCompConfig = 0x00009101;
enum PropertyTagExifCompBPP = 0x00009102;
enum PropertyTagExifShutterSpeed = 0x00009201;
enum PropertyTagExifAperture = 0x00009202;
enum PropertyTagExifBrightness = 0x00009203;
enum PropertyTagExifExposureBias = 0x00009204;
enum PropertyTagExifMaxAperture = 0x00009205;
enum PropertyTagExifSubjectDist = 0x00009206;
enum PropertyTagExifMeteringMode = 0x00009207;
enum PropertyTagExifLightSource = 0x00009208;
enum PropertyTagExifFlash = 0x00009209;
enum PropertyTagExifFocalLength = 0x0000920a;
enum PropertyTagExifSubjectArea = 0x00009214;
enum PropertyTagExifMakerNote = 0x0000927c;
enum PropertyTagExifUserComment = 0x00009286;
enum PropertyTagExifDTSubsec = 0x00009290;
enum PropertyTagExifDTOrigSS = 0x00009291;
enum PropertyTagExifDTDigSS = 0x00009292;
enum PropertyTagExifFPXVer = 0x0000a000;
enum PropertyTagExifColorSpace = 0x0000a001;
enum PropertyTagExifPixXDim = 0x0000a002;
enum PropertyTagExifPixYDim = 0x0000a003;
enum PropertyTagExifRelatedWav = 0x0000a004;
enum PropertyTagExifInterop = 0x0000a005;
enum PropertyTagExifFlashEnergy = 0x0000a20b;
enum PropertyTagExifSpatialFR = 0x0000a20c;
enum PropertyTagExifFocalXRes = 0x0000a20e;
enum PropertyTagExifFocalYRes = 0x0000a20f;
enum PropertyTagExifFocalResUnit = 0x0000a210;
enum PropertyTagExifSubjectLoc = 0x0000a214;
enum PropertyTagExifExposureIndex = 0x0000a215;
enum PropertyTagExifSensingMethod = 0x0000a217;
enum PropertyTagExifFileSource = 0x0000a300;
enum PropertyTagExifSceneType = 0x0000a301;
enum PropertyTagExifCfaPattern = 0x0000a302;
enum PropertyTagExifCustomRendered = 0x0000a401;
enum PropertyTagExifExposureMode = 0x0000a402;
enum PropertyTagExifWhiteBalance = 0x0000a403;
enum PropertyTagExifDigitalZoomRatio = 0x0000a404;
enum PropertyTagExifFocalLengthIn35mmFilm = 0x0000a405;
enum PropertyTagExifSceneCaptureType = 0x0000a406;
enum PropertyTagExifGainControl = 0x0000a407;
enum PropertyTagExifContrast = 0x0000a408;
enum PropertyTagExifSaturation = 0x0000a409;
enum PropertyTagExifSharpness = 0x0000a40a;
enum PropertyTagExifDeviceSettingDesc = 0x0000a40b;
enum PropertyTagExifSubjectDistanceRange = 0x0000a40c;
enum PropertyTagExifUniqueImageID = 0x0000a420;
enum PropertyTagGpsVer = 0x00000000;
enum PropertyTagGpsLatitudeRef = 0x00000001;
enum PropertyTagGpsLatitude = 0x00000002;
enum PropertyTagGpsLongitudeRef = 0x00000003;
enum PropertyTagGpsLongitude = 0x00000004;
enum PropertyTagGpsAltitudeRef = 0x00000005;
enum PropertyTagGpsAltitude = 0x00000006;
enum PropertyTagGpsGpsTime = 0x00000007;
enum PropertyTagGpsGpsSatellites = 0x00000008;
enum PropertyTagGpsGpsStatus = 0x00000009;
enum PropertyTagGpsGpsMeasureMode = 0x0000000a;
enum PropertyTagGpsGpsDop = 0x0000000b;
enum PropertyTagGpsSpeedRef = 0x0000000c;
enum PropertyTagGpsSpeed = 0x0000000d;
enum PropertyTagGpsTrackRef = 0x0000000e;
enum PropertyTagGpsTrack = 0x0000000f;
enum PropertyTagGpsImgDirRef = 0x00000010;
enum PropertyTagGpsImgDir = 0x00000011;
enum PropertyTagGpsMapDatum = 0x00000012;
enum PropertyTagGpsDestLatRef = 0x00000013;
enum PropertyTagGpsDestLat = 0x00000014;
enum PropertyTagGpsDestLongRef = 0x00000015;
enum PropertyTagGpsDestLong = 0x00000016;
enum PropertyTagGpsDestBearRef = 0x00000017;
enum PropertyTagGpsDestBear = 0x00000018;
enum PropertyTagGpsDestDistRef = 0x00000019;
enum PropertyTagGpsDestDist = 0x0000001a;
enum PropertyTagGpsProcessingMethod = 0x0000001b;
enum PropertyTagGpsAreaInformation = 0x0000001c;
enum PropertyTagGpsDate = 0x0000001d;
enum PropertyTagGpsDifferential = 0x0000001e;
enum GDIP_EMFPLUSFLAGS_DISPLAY = 0x00000001;
enum ALPHA_SHIFT = 0x00000018;
enum RED_SHIFT = 0x00000010;
enum GREEN_SHIFT = 0x00000008;
enum BLUE_SHIFT = 0x00000000;
enum PixelFormatIndexed = 0x00010000;
enum PixelFormatGDI = 0x00020000;
enum PixelFormatAlpha = 0x00040000;
enum PixelFormatPAlpha = 0x00080000;
enum PixelFormatExtended = 0x00100000;
enum PixelFormatCanonical = 0x00200000;
enum PixelFormatUndefined = 0x00000000;
enum PixelFormatDontCare = 0x00000000;
enum PixelFormatMax = 0x00000010;
enum FlatnessDefault = 0.250000;
enum BlurEffectGuid = GUID(0x633c80a4, 0x1843, 0x482b, [0x9e, 0xf2, 0xbe, 0x28, 0x34, 0xc5, 0xfd, 0xd4]);
enum SharpenEffectGuid = GUID(0x63cbf3ee, 0xc526, 0x402c, [0x8f, 0x71, 0x62, 0xc5, 0x40, 0xbf, 0x51, 0x42]);
enum ColorMatrixEffectGuid = GUID(0x718f2615, 0x7933, 0x40e3, [0xa5, 0x11, 0x5f, 0x68, 0xfe, 0x14, 0xdd, 0x74]);
enum ColorLUTEffectGuid = GUID(0xa7ce72a9, 0xf7f, 0x40d7, [0xb3, 0xcc, 0xd0, 0xc0, 0x2d, 0x5c, 0x32, 0x12]);
enum BrightnessContrastEffectGuid = GUID(0xd3a1dbe1, 0x8ec4, 0x4c17, [0x9f, 0x4c, 0xea, 0x97, 0xad, 0x1c, 0x34, 0x3d]);
enum HueSaturationLightnessEffectGuid = GUID(0x8b2dd6c3, 0xeb07, 0x4d87, [0xa5, 0xf0, 0x71, 0x8, 0xe2, 0x6a, 0x9c, 0x5f]);
enum LevelsEffectGuid = GUID(0x99c354ec, 0x2a31, 0x4f3a, [0x8c, 0x34, 0x17, 0xa8, 0x3, 0xb3, 0x3a, 0x25]);
enum TintEffectGuid = GUID(0x1077af00, 0x2848, 0x4441, [0x94, 0x89, 0x44, 0xad, 0x4c, 0x2d, 0x7a, 0x2c]);
enum ColorBalanceEffectGuid = GUID(0x537e597d, 0x251e, 0x48da, [0x96, 0x64, 0x29, 0xca, 0x49, 0x6b, 0x70, 0xf8]);
enum RedEyeCorrectionEffectGuid = GUID(0x74d29d05, 0x69a4, 0x4266, [0x95, 0x49, 0x3c, 0xc5, 0x28, 0x36, 0xb6, 0x32]);
enum ColorCurveEffectGuid = GUID(0xdd6a0022, 0x58e4, 0x4a67, [0x9d, 0x9b, 0xd4, 0x8e, 0xb8, 0x81, 0xa5, 0x3d]);
alias PathData = long;
alias GpGraphics = long;
alias GpBrush = long;
alias GpTexture = long;
alias GpSolidFill = long;
alias GpLineGradient = long;
alias GpPathGradient = long;
alias GpHatch = long;
alias GpPen = long;
alias GpCustomLineCap = long;
alias GpAdjustableArrowCap = long;
alias GpImage = long;
alias GpBitmap = long;
alias GpMetafile = long;
alias GpImageAttributes = long;
alias GpPath = long;
alias GpRegion = long;
alias GpPathIterator = long;
alias GpFontFamily = long;
alias GpFont = long;
alias GpStringFormat = long;
alias GpFontCollection = long;
alias GpInstalledFontCollection = long;
alias GpPrivateFontCollection = long;
alias GpCachedBitmap = long;
alias CGpEffect = long;
alias Matrix = long;
alias Font = long;
alias FontCollection = long;
alias InstalledFontCollection = long;
alias PrivateFontCollection = long;
alias Image = long;
alias Bitmap = long;
alias CustomLineCap = long;
alias CachedBitmap = long;
alias Metafile = long;
alias FontFamily = long;
alias Region = long;
alias FillMode = int;
enum : int
{
    FillModeAlternate = 0x00000000,
    FillModeWinding   = 0x00000001,
}

alias QualityMode = int;
enum : int
{
    QualityModeInvalid = 0xffffffff,
    QualityModeDefault = 0x00000000,
    QualityModeLow     = 0x00000001,
    QualityModeHigh    = 0x00000002,
}

alias CompositingMode = int;
enum : int
{
    CompositingModeSourceOver = 0x00000000,
    CompositingModeSourceCopy = 0x00000001,
}

alias CompositingQuality = int;
enum : int
{
    CompositingQualityInvalid        = 0xffffffff,
    CompositingQualityDefault        = 0x00000000,
    CompositingQualityHighSpeed      = 0x00000001,
    CompositingQualityHighQuality    = 0x00000002,
    CompositingQualityGammaCorrected = 0x00000003,
    CompositingQualityAssumeLinear   = 0x00000004,
}

alias Unit = int;
enum : int
{
    UnitWorld      = 0x00000000,
    UnitDisplay    = 0x00000001,
    UnitPixel      = 0x00000002,
    UnitPoint      = 0x00000003,
    UnitInch       = 0x00000004,
    UnitDocument   = 0x00000005,
    UnitMillimeter = 0x00000006,
}

alias MetafileFrameUnit = int;
enum : int
{
    MetafileFrameUnitPixel      = 0x00000002,
    MetafileFrameUnitPoint      = 0x00000003,
    MetafileFrameUnitInch       = 0x00000004,
    MetafileFrameUnitDocument   = 0x00000005,
    MetafileFrameUnitMillimeter = 0x00000006,
    MetafileFrameUnitGdi        = 0x00000007,
}

alias CoordinateSpace = int;
enum : int
{
    CoordinateSpaceWorld  = 0x00000000,
    CoordinateSpacePage   = 0x00000001,
    CoordinateSpaceDevice = 0x00000002,
}

alias WrapMode = int;
enum : int
{
    WrapModeTile       = 0x00000000,
    WrapModeTileFlipX  = 0x00000001,
    WrapModeTileFlipY  = 0x00000002,
    WrapModeTileFlipXY = 0x00000003,
    WrapModeClamp      = 0x00000004,
}

alias HatchStyle = int;
enum : int
{
    HatchStyleHorizontal             = 0x00000000,
    HatchStyleVertical               = 0x00000001,
    HatchStyleForwardDiagonal        = 0x00000002,
    HatchStyleBackwardDiagonal       = 0x00000003,
    HatchStyleCross                  = 0x00000004,
    HatchStyleDiagonalCross          = 0x00000005,
    HatchStyle05Percent              = 0x00000006,
    HatchStyle10Percent              = 0x00000007,
    HatchStyle20Percent              = 0x00000008,
    HatchStyle25Percent              = 0x00000009,
    HatchStyle30Percent              = 0x0000000a,
    HatchStyle40Percent              = 0x0000000b,
    HatchStyle50Percent              = 0x0000000c,
    HatchStyle60Percent              = 0x0000000d,
    HatchStyle70Percent              = 0x0000000e,
    HatchStyle75Percent              = 0x0000000f,
    HatchStyle80Percent              = 0x00000010,
    HatchStyle90Percent              = 0x00000011,
    HatchStyleLightDownwardDiagonal  = 0x00000012,
    HatchStyleLightUpwardDiagonal    = 0x00000013,
    HatchStyleDarkDownwardDiagonal   = 0x00000014,
    HatchStyleDarkUpwardDiagonal     = 0x00000015,
    HatchStyleWideDownwardDiagonal   = 0x00000016,
    HatchStyleWideUpwardDiagonal     = 0x00000017,
    HatchStyleLightVertical          = 0x00000018,
    HatchStyleLightHorizontal        = 0x00000019,
    HatchStyleNarrowVertical         = 0x0000001a,
    HatchStyleNarrowHorizontal       = 0x0000001b,
    HatchStyleDarkVertical           = 0x0000001c,
    HatchStyleDarkHorizontal         = 0x0000001d,
    HatchStyleDashedDownwardDiagonal = 0x0000001e,
    HatchStyleDashedUpwardDiagonal   = 0x0000001f,
    HatchStyleDashedHorizontal       = 0x00000020,
    HatchStyleDashedVertical         = 0x00000021,
    HatchStyleSmallConfetti          = 0x00000022,
    HatchStyleLargeConfetti          = 0x00000023,
    HatchStyleZigZag                 = 0x00000024,
    HatchStyleWave                   = 0x00000025,
    HatchStyleDiagonalBrick          = 0x00000026,
    HatchStyleHorizontalBrick        = 0x00000027,
    HatchStyleWeave                  = 0x00000028,
    HatchStylePlaid                  = 0x00000029,
    HatchStyleDivot                  = 0x0000002a,
    HatchStyleDottedGrid             = 0x0000002b,
    HatchStyleDottedDiamond          = 0x0000002c,
    HatchStyleShingle                = 0x0000002d,
    HatchStyleTrellis                = 0x0000002e,
    HatchStyleSphere                 = 0x0000002f,
    HatchStyleSmallGrid              = 0x00000030,
    HatchStyleSmallCheckerBoard      = 0x00000031,
    HatchStyleLargeCheckerBoard      = 0x00000032,
    HatchStyleOutlinedDiamond        = 0x00000033,
    HatchStyleSolidDiamond           = 0x00000034,
    HatchStyleTotal                  = 0x00000035,
    HatchStyleLargeGrid              = 0x00000004,
    HatchStyleMin                    = 0x00000000,
    HatchStyleMax                    = 0x00000034,
}

alias DashStyle = int;
enum : int
{
    DashStyleSolid      = 0x00000000,
    DashStyleDash       = 0x00000001,
    DashStyleDot        = 0x00000002,
    DashStyleDashDot    = 0x00000003,
    DashStyleDashDotDot = 0x00000004,
    DashStyleCustom     = 0x00000005,
}

alias DashCap = int;
enum : int
{
    DashCapFlat     = 0x00000000,
    DashCapRound    = 0x00000002,
    DashCapTriangle = 0x00000003,
}

alias LineCap = int;
enum : int
{
    LineCapFlat          = 0x00000000,
    LineCapSquare        = 0x00000001,
    LineCapRound         = 0x00000002,
    LineCapTriangle      = 0x00000003,
    LineCapNoAnchor      = 0x00000010,
    LineCapSquareAnchor  = 0x00000011,
    LineCapRoundAnchor   = 0x00000012,
    LineCapDiamondAnchor = 0x00000013,
    LineCapArrowAnchor   = 0x00000014,
    LineCapCustom        = 0x000000ff,
    LineCapAnchorMask    = 0x000000f0,
}

alias CustomLineCapType = int;
enum : int
{
    CustomLineCapTypeDefault         = 0x00000000,
    CustomLineCapTypeAdjustableArrow = 0x00000001,
}

alias LineJoin = int;
enum : int
{
    LineJoinMiter        = 0x00000000,
    LineJoinBevel        = 0x00000001,
    LineJoinRound        = 0x00000002,
    LineJoinMiterClipped = 0x00000003,
}

alias PathPointType = int;
enum : int
{
    PathPointTypeStart        = 0x00000000,
    PathPointTypeLine         = 0x00000001,
    PathPointTypeBezier       = 0x00000003,
    PathPointTypePathTypeMask = 0x00000007,
    PathPointTypeDashMode     = 0x00000010,
    PathPointTypePathMarker   = 0x00000020,
    PathPointTypeCloseSubpath = 0x00000080,
    PathPointTypeBezier3      = 0x00000003,
}

alias WarpMode = int;
enum : int
{
    WarpModePerspective = 0x00000000,
    WarpModeBilinear    = 0x00000001,
}

alias LinearGradientMode = int;
enum : int
{
    LinearGradientModeHorizontal       = 0x00000000,
    LinearGradientModeVertical         = 0x00000001,
    LinearGradientModeForwardDiagonal  = 0x00000002,
    LinearGradientModeBackwardDiagonal = 0x00000003,
}

alias CombineMode = int;
enum : int
{
    CombineModeReplace    = 0x00000000,
    CombineModeIntersect  = 0x00000001,
    CombineModeUnion      = 0x00000002,
    CombineModeXor        = 0x00000003,
    CombineModeExclude    = 0x00000004,
    CombineModeComplement = 0x00000005,
}

alias ImageType = int;
enum : int
{
    ImageTypeUnknown  = 0x00000000,
    ImageTypeBitmap   = 0x00000001,
    ImageTypeMetafile = 0x00000002,
}

alias InterpolationMode = int;
enum : int
{
    InterpolationModeInvalid             = 0xffffffff,
    InterpolationModeDefault             = 0x00000000,
    InterpolationModeLowQuality          = 0x00000001,
    InterpolationModeHighQuality         = 0x00000002,
    InterpolationModeBilinear            = 0x00000003,
    InterpolationModeBicubic             = 0x00000004,
    InterpolationModeNearestNeighbor     = 0x00000005,
    InterpolationModeHighQualityBilinear = 0x00000006,
    InterpolationModeHighQualityBicubic  = 0x00000007,
}

alias PenAlignment = int;
enum : int
{
    PenAlignmentCenter = 0x00000000,
    PenAlignmentInset  = 0x00000001,
}

alias BrushType = int;
enum : int
{
    BrushTypeSolidColor     = 0x00000000,
    BrushTypeHatchFill      = 0x00000001,
    BrushTypeTextureFill    = 0x00000002,
    BrushTypePathGradient   = 0x00000003,
    BrushTypeLinearGradient = 0x00000004,
}

alias PenType = int;
enum : int
{
    PenTypeSolidColor     = 0x00000000,
    PenTypeHatchFill      = 0x00000001,
    PenTypeTextureFill    = 0x00000002,
    PenTypePathGradient   = 0x00000003,
    PenTypeLinearGradient = 0x00000004,
    PenTypeUnknown        = 0xffffffff,
}

alias MatrixOrder = int;
enum : int
{
    MatrixOrderPrepend = 0x00000000,
    MatrixOrderAppend  = 0x00000001,
}

alias GenericFontFamily = int;
enum : int
{
    GenericFontFamilySerif     = 0x00000000,
    GenericFontFamilySansSerif = 0x00000001,
    GenericFontFamilyMonospace = 0x00000002,
}

alias FontStyle = int;
enum : int
{
    FontStyleRegular    = 0x00000000,
    FontStyleBold       = 0x00000001,
    FontStyleItalic     = 0x00000002,
    FontStyleBoldItalic = 0x00000003,
    FontStyleUnderline  = 0x00000004,
    FontStyleStrikeout  = 0x00000008,
}

alias SmoothingMode = int;
enum : int
{
    SmoothingModeInvalid      = 0xffffffff,
    SmoothingModeDefault      = 0x00000000,
    SmoothingModeHighSpeed    = 0x00000001,
    SmoothingModeHighQuality  = 0x00000002,
    SmoothingModeNone         = 0x00000003,
    SmoothingModeAntiAlias    = 0x00000004,
    SmoothingModeAntiAlias8x4 = 0x00000004,
    SmoothingModeAntiAlias8x8 = 0x00000005,
}

alias PixelOffsetMode = int;
enum : int
{
    PixelOffsetModeInvalid     = 0xffffffff,
    PixelOffsetModeDefault     = 0x00000000,
    PixelOffsetModeHighSpeed   = 0x00000001,
    PixelOffsetModeHighQuality = 0x00000002,
    PixelOffsetModeNone        = 0x00000003,
    PixelOffsetModeHalf        = 0x00000004,
}

alias TextRenderingHint = int;
enum : int
{
    TextRenderingHintSystemDefault            = 0x00000000,
    TextRenderingHintSingleBitPerPixelGridFit = 0x00000001,
    TextRenderingHintSingleBitPerPixel        = 0x00000002,
    TextRenderingHintAntiAliasGridFit         = 0x00000003,
    TextRenderingHintAntiAlias                = 0x00000004,
    TextRenderingHintClearTypeGridFit         = 0x00000005,
}

alias MetafileType = int;
enum : int
{
    MetafileTypeInvalid      = 0x00000000,
    MetafileTypeWmf          = 0x00000001,
    MetafileTypeWmfPlaceable = 0x00000002,
    MetafileTypeEmf          = 0x00000003,
    MetafileTypeEmfPlusOnly  = 0x00000004,
    MetafileTypeEmfPlusDual  = 0x00000005,
}

alias EmfType = int;
enum : int
{
    EmfTypeEmfOnly     = 0x00000003,
    EmfTypeEmfPlusOnly = 0x00000004,
    EmfTypeEmfPlusDual = 0x00000005,
}

alias ObjectType = int;
enum : int
{
    ObjectTypeInvalid         = 0x00000000,
    ObjectTypeBrush           = 0x00000001,
    ObjectTypePen             = 0x00000002,
    ObjectTypePath            = 0x00000003,
    ObjectTypeRegion          = 0x00000004,
    ObjectTypeImage           = 0x00000005,
    ObjectTypeFont            = 0x00000006,
    ObjectTypeStringFormat    = 0x00000007,
    ObjectTypeImageAttributes = 0x00000008,
    ObjectTypeCustomLineCap   = 0x00000009,
    ObjectTypeGraphics        = 0x0000000a,
    ObjectTypeMax             = 0x0000000a,
    ObjectTypeMin             = 0x00000001,
}

alias EmfPlusRecordType = int;
enum : int
{
    WmfRecordTypeSetBkColor                  = 0x00010201,
    WmfRecordTypeSetBkMode                   = 0x00010102,
    WmfRecordTypeSetMapMode                  = 0x00010103,
    WmfRecordTypeSetROP2                     = 0x00010104,
    WmfRecordTypeSetRelAbs                   = 0x00010105,
    WmfRecordTypeSetPolyFillMode             = 0x00010106,
    WmfRecordTypeSetStretchBltMode           = 0x00010107,
    WmfRecordTypeSetTextCharExtra            = 0x00010108,
    WmfRecordTypeSetTextColor                = 0x00010209,
    WmfRecordTypeSetTextJustification        = 0x0001020a,
    WmfRecordTypeSetWindowOrg                = 0x0001020b,
    WmfRecordTypeSetWindowExt                = 0x0001020c,
    WmfRecordTypeSetViewportOrg              = 0x0001020d,
    WmfRecordTypeSetViewportExt              = 0x0001020e,
    WmfRecordTypeOffsetWindowOrg             = 0x0001020f,
    WmfRecordTypeScaleWindowExt              = 0x00010410,
    WmfRecordTypeOffsetViewportOrg           = 0x00010211,
    WmfRecordTypeScaleViewportExt            = 0x00010412,
    WmfRecordTypeLineTo                      = 0x00010213,
    WmfRecordTypeMoveTo                      = 0x00010214,
    WmfRecordTypeExcludeClipRect             = 0x00010415,
    WmfRecordTypeIntersectClipRect           = 0x00010416,
    WmfRecordTypeArc                         = 0x00010817,
    WmfRecordTypeEllipse                     = 0x00010418,
    WmfRecordTypeFloodFill                   = 0x00010419,
    WmfRecordTypePie                         = 0x0001081a,
    WmfRecordTypeRectangle                   = 0x0001041b,
    WmfRecordTypeRoundRect                   = 0x0001061c,
    WmfRecordTypePatBlt                      = 0x0001061d,
    WmfRecordTypeSaveDC                      = 0x0001001e,
    WmfRecordTypeSetPixel                    = 0x0001041f,
    WmfRecordTypeOffsetClipRgn               = 0x00010220,
    WmfRecordTypeTextOut                     = 0x00010521,
    WmfRecordTypeBitBlt                      = 0x00010922,
    WmfRecordTypeStretchBlt                  = 0x00010b23,
    WmfRecordTypePolygon                     = 0x00010324,
    WmfRecordTypePolyline                    = 0x00010325,
    WmfRecordTypeEscape                      = 0x00010626,
    WmfRecordTypeRestoreDC                   = 0x00010127,
    WmfRecordTypeFillRegion                  = 0x00010228,
    WmfRecordTypeFrameRegion                 = 0x00010429,
    WmfRecordTypeInvertRegion                = 0x0001012a,
    WmfRecordTypePaintRegion                 = 0x0001012b,
    WmfRecordTypeSelectClipRegion            = 0x0001012c,
    WmfRecordTypeSelectObject                = 0x0001012d,
    WmfRecordTypeSetTextAlign                = 0x0001012e,
    WmfRecordTypeDrawText                    = 0x0001062f,
    WmfRecordTypeChord                       = 0x00010830,
    WmfRecordTypeSetMapperFlags              = 0x00010231,
    WmfRecordTypeExtTextOut                  = 0x00010a32,
    WmfRecordTypeSetDIBToDev                 = 0x00010d33,
    WmfRecordTypeSelectPalette               = 0x00010234,
    WmfRecordTypeRealizePalette              = 0x00010035,
    WmfRecordTypeAnimatePalette              = 0x00010436,
    WmfRecordTypeSetPalEntries               = 0x00010037,
    WmfRecordTypePolyPolygon                 = 0x00010538,
    WmfRecordTypeResizePalette               = 0x00010139,
    WmfRecordTypeDIBBitBlt                   = 0x00010940,
    WmfRecordTypeDIBStretchBlt               = 0x00010b41,
    WmfRecordTypeDIBCreatePatternBrush       = 0x00010142,
    WmfRecordTypeStretchDIB                  = 0x00010f43,
    WmfRecordTypeExtFloodFill                = 0x00010548,
    WmfRecordTypeSetLayout                   = 0x00010149,
    WmfRecordTypeResetDC                     = 0x0001014c,
    WmfRecordTypeStartDoc                    = 0x0001014d,
    WmfRecordTypeStartPage                   = 0x0001004f,
    WmfRecordTypeEndPage                     = 0x00010050,
    WmfRecordTypeAbortDoc                    = 0x00010052,
    WmfRecordTypeEndDoc                      = 0x0001005e,
    WmfRecordTypeDeleteObject                = 0x000101f0,
    WmfRecordTypeCreatePalette               = 0x000100f7,
    WmfRecordTypeCreateBrush                 = 0x000100f8,
    WmfRecordTypeCreatePatternBrush          = 0x000101f9,
    WmfRecordTypeCreatePenIndirect           = 0x000102fa,
    WmfRecordTypeCreateFontIndirect          = 0x000102fb,
    WmfRecordTypeCreateBrushIndirect         = 0x000102fc,
    WmfRecordTypeCreateBitmapIndirect        = 0x000102fd,
    WmfRecordTypeCreateBitmap                = 0x000106fe,
    WmfRecordTypeCreateRegion                = 0x000106ff,
    EmfRecordTypeHeader                      = 0x00000001,
    EmfRecordTypePolyBezier                  = 0x00000002,
    EmfRecordTypePolygon                     = 0x00000003,
    EmfRecordTypePolyline                    = 0x00000004,
    EmfRecordTypePolyBezierTo                = 0x00000005,
    EmfRecordTypePolyLineTo                  = 0x00000006,
    EmfRecordTypePolyPolyline                = 0x00000007,
    EmfRecordTypePolyPolygon                 = 0x00000008,
    EmfRecordTypeSetWindowExtEx              = 0x00000009,
    EmfRecordTypeSetWindowOrgEx              = 0x0000000a,
    EmfRecordTypeSetViewportExtEx            = 0x0000000b,
    EmfRecordTypeSetViewportOrgEx            = 0x0000000c,
    EmfRecordTypeSetBrushOrgEx               = 0x0000000d,
    EmfRecordTypeEOF                         = 0x0000000e,
    EmfRecordTypeSetPixelV                   = 0x0000000f,
    EmfRecordTypeSetMapperFlags              = 0x00000010,
    EmfRecordTypeSetMapMode                  = 0x00000011,
    EmfRecordTypeSetBkMode                   = 0x00000012,
    EmfRecordTypeSetPolyFillMode             = 0x00000013,
    EmfRecordTypeSetROP2                     = 0x00000014,
    EmfRecordTypeSetStretchBltMode           = 0x00000015,
    EmfRecordTypeSetTextAlign                = 0x00000016,
    EmfRecordTypeSetColorAdjustment          = 0x00000017,
    EmfRecordTypeSetTextColor                = 0x00000018,
    EmfRecordTypeSetBkColor                  = 0x00000019,
    EmfRecordTypeOffsetClipRgn               = 0x0000001a,
    EmfRecordTypeMoveToEx                    = 0x0000001b,
    EmfRecordTypeSetMetaRgn                  = 0x0000001c,
    EmfRecordTypeExcludeClipRect             = 0x0000001d,
    EmfRecordTypeIntersectClipRect           = 0x0000001e,
    EmfRecordTypeScaleViewportExtEx          = 0x0000001f,
    EmfRecordTypeScaleWindowExtEx            = 0x00000020,
    EmfRecordTypeSaveDC                      = 0x00000021,
    EmfRecordTypeRestoreDC                   = 0x00000022,
    EmfRecordTypeSetWorldTransform           = 0x00000023,
    EmfRecordTypeModifyWorldTransform        = 0x00000024,
    EmfRecordTypeSelectObject                = 0x00000025,
    EmfRecordTypeCreatePen                   = 0x00000026,
    EmfRecordTypeCreateBrushIndirect         = 0x00000027,
    EmfRecordTypeDeleteObject                = 0x00000028,
    EmfRecordTypeAngleArc                    = 0x00000029,
    EmfRecordTypeEllipse                     = 0x0000002a,
    EmfRecordTypeRectangle                   = 0x0000002b,
    EmfRecordTypeRoundRect                   = 0x0000002c,
    EmfRecordTypeArc                         = 0x0000002d,
    EmfRecordTypeChord                       = 0x0000002e,
    EmfRecordTypePie                         = 0x0000002f,
    EmfRecordTypeSelectPalette               = 0x00000030,
    EmfRecordTypeCreatePalette               = 0x00000031,
    EmfRecordTypeSetPaletteEntries           = 0x00000032,
    EmfRecordTypeResizePalette               = 0x00000033,
    EmfRecordTypeRealizePalette              = 0x00000034,
    EmfRecordTypeExtFloodFill                = 0x00000035,
    EmfRecordTypeLineTo                      = 0x00000036,
    EmfRecordTypeArcTo                       = 0x00000037,
    EmfRecordTypePolyDraw                    = 0x00000038,
    EmfRecordTypeSetArcDirection             = 0x00000039,
    EmfRecordTypeSetMiterLimit               = 0x0000003a,
    EmfRecordTypeBeginPath                   = 0x0000003b,
    EmfRecordTypeEndPath                     = 0x0000003c,
    EmfRecordTypeCloseFigure                 = 0x0000003d,
    EmfRecordTypeFillPath                    = 0x0000003e,
    EmfRecordTypeStrokeAndFillPath           = 0x0000003f,
    EmfRecordTypeStrokePath                  = 0x00000040,
    EmfRecordTypeFlattenPath                 = 0x00000041,
    EmfRecordTypeWidenPath                   = 0x00000042,
    EmfRecordTypeSelectClipPath              = 0x00000043,
    EmfRecordTypeAbortPath                   = 0x00000044,
    EmfRecordTypeReserved_069                = 0x00000045,
    EmfRecordTypeGdiComment                  = 0x00000046,
    EmfRecordTypeFillRgn                     = 0x00000047,
    EmfRecordTypeFrameRgn                    = 0x00000048,
    EmfRecordTypeInvertRgn                   = 0x00000049,
    EmfRecordTypePaintRgn                    = 0x0000004a,
    EmfRecordTypeExtSelectClipRgn            = 0x0000004b,
    EmfRecordTypeBitBlt                      = 0x0000004c,
    EmfRecordTypeStretchBlt                  = 0x0000004d,
    EmfRecordTypeMaskBlt                     = 0x0000004e,
    EmfRecordTypePlgBlt                      = 0x0000004f,
    EmfRecordTypeSetDIBitsToDevice           = 0x00000050,
    EmfRecordTypeStretchDIBits               = 0x00000051,
    EmfRecordTypeExtCreateFontIndirect       = 0x00000052,
    EmfRecordTypeExtTextOutA                 = 0x00000053,
    EmfRecordTypeExtTextOutW                 = 0x00000054,
    EmfRecordTypePolyBezier16                = 0x00000055,
    EmfRecordTypePolygon16                   = 0x00000056,
    EmfRecordTypePolyline16                  = 0x00000057,
    EmfRecordTypePolyBezierTo16              = 0x00000058,
    EmfRecordTypePolylineTo16                = 0x00000059,
    EmfRecordTypePolyPolyline16              = 0x0000005a,
    EmfRecordTypePolyPolygon16               = 0x0000005b,
    EmfRecordTypePolyDraw16                  = 0x0000005c,
    EmfRecordTypeCreateMonoBrush             = 0x0000005d,
    EmfRecordTypeCreateDIBPatternBrushPt     = 0x0000005e,
    EmfRecordTypeExtCreatePen                = 0x0000005f,
    EmfRecordTypePolyTextOutA                = 0x00000060,
    EmfRecordTypePolyTextOutW                = 0x00000061,
    EmfRecordTypeSetICMMode                  = 0x00000062,
    EmfRecordTypeCreateColorSpace            = 0x00000063,
    EmfRecordTypeSetColorSpace               = 0x00000064,
    EmfRecordTypeDeleteColorSpace            = 0x00000065,
    EmfRecordTypeGLSRecord                   = 0x00000066,
    EmfRecordTypeGLSBoundedRecord            = 0x00000067,
    EmfRecordTypePixelFormat                 = 0x00000068,
    EmfRecordTypeDrawEscape                  = 0x00000069,
    EmfRecordTypeExtEscape                   = 0x0000006a,
    EmfRecordTypeStartDoc                    = 0x0000006b,
    EmfRecordTypeSmallTextOut                = 0x0000006c,
    EmfRecordTypeForceUFIMapping             = 0x0000006d,
    EmfRecordTypeNamedEscape                 = 0x0000006e,
    EmfRecordTypeColorCorrectPalette         = 0x0000006f,
    EmfRecordTypeSetICMProfileA              = 0x00000070,
    EmfRecordTypeSetICMProfileW              = 0x00000071,
    EmfRecordTypeAlphaBlend                  = 0x00000072,
    EmfRecordTypeSetLayout                   = 0x00000073,
    EmfRecordTypeTransparentBlt              = 0x00000074,
    EmfRecordTypeReserved_117                = 0x00000075,
    EmfRecordTypeGradientFill                = 0x00000076,
    EmfRecordTypeSetLinkedUFIs               = 0x00000077,
    EmfRecordTypeSetTextJustification        = 0x00000078,
    EmfRecordTypeColorMatchToTargetW         = 0x00000079,
    EmfRecordTypeCreateColorSpaceW           = 0x0000007a,
    EmfRecordTypeMax                         = 0x0000007a,
    EmfRecordTypeMin                         = 0x00000001,
    EmfPlusRecordTypeInvalid                 = 0x00004000,
    EmfPlusRecordTypeHeader                  = 0x00004001,
    EmfPlusRecordTypeEndOfFile               = 0x00004002,
    EmfPlusRecordTypeComment                 = 0x00004003,
    EmfPlusRecordTypeGetDC                   = 0x00004004,
    EmfPlusRecordTypeMultiFormatStart        = 0x00004005,
    EmfPlusRecordTypeMultiFormatSection      = 0x00004006,
    EmfPlusRecordTypeMultiFormatEnd          = 0x00004007,
    EmfPlusRecordTypeObject                  = 0x00004008,
    EmfPlusRecordTypeClear                   = 0x00004009,
    EmfPlusRecordTypeFillRects               = 0x0000400a,
    EmfPlusRecordTypeDrawRects               = 0x0000400b,
    EmfPlusRecordTypeFillPolygon             = 0x0000400c,
    EmfPlusRecordTypeDrawLines               = 0x0000400d,
    EmfPlusRecordTypeFillEllipse             = 0x0000400e,
    EmfPlusRecordTypeDrawEllipse             = 0x0000400f,
    EmfPlusRecordTypeFillPie                 = 0x00004010,
    EmfPlusRecordTypeDrawPie                 = 0x00004011,
    EmfPlusRecordTypeDrawArc                 = 0x00004012,
    EmfPlusRecordTypeFillRegion              = 0x00004013,
    EmfPlusRecordTypeFillPath                = 0x00004014,
    EmfPlusRecordTypeDrawPath                = 0x00004015,
    EmfPlusRecordTypeFillClosedCurve         = 0x00004016,
    EmfPlusRecordTypeDrawClosedCurve         = 0x00004017,
    EmfPlusRecordTypeDrawCurve               = 0x00004018,
    EmfPlusRecordTypeDrawBeziers             = 0x00004019,
    EmfPlusRecordTypeDrawImage               = 0x0000401a,
    EmfPlusRecordTypeDrawImagePoints         = 0x0000401b,
    EmfPlusRecordTypeDrawString              = 0x0000401c,
    EmfPlusRecordTypeSetRenderingOrigin      = 0x0000401d,
    EmfPlusRecordTypeSetAntiAliasMode        = 0x0000401e,
    EmfPlusRecordTypeSetTextRenderingHint    = 0x0000401f,
    EmfPlusRecordTypeSetTextContrast         = 0x00004020,
    EmfPlusRecordTypeSetInterpolationMode    = 0x00004021,
    EmfPlusRecordTypeSetPixelOffsetMode      = 0x00004022,
    EmfPlusRecordTypeSetCompositingMode      = 0x00004023,
    EmfPlusRecordTypeSetCompositingQuality   = 0x00004024,
    EmfPlusRecordTypeSave                    = 0x00004025,
    EmfPlusRecordTypeRestore                 = 0x00004026,
    EmfPlusRecordTypeBeginContainer          = 0x00004027,
    EmfPlusRecordTypeBeginContainerNoParams  = 0x00004028,
    EmfPlusRecordTypeEndContainer            = 0x00004029,
    EmfPlusRecordTypeSetWorldTransform       = 0x0000402a,
    EmfPlusRecordTypeResetWorldTransform     = 0x0000402b,
    EmfPlusRecordTypeMultiplyWorldTransform  = 0x0000402c,
    EmfPlusRecordTypeTranslateWorldTransform = 0x0000402d,
    EmfPlusRecordTypeScaleWorldTransform     = 0x0000402e,
    EmfPlusRecordTypeRotateWorldTransform    = 0x0000402f,
    EmfPlusRecordTypeSetPageTransform        = 0x00004030,
    EmfPlusRecordTypeResetClip               = 0x00004031,
    EmfPlusRecordTypeSetClipRect             = 0x00004032,
    EmfPlusRecordTypeSetClipPath             = 0x00004033,
    EmfPlusRecordTypeSetClipRegion           = 0x00004034,
    EmfPlusRecordTypeOffsetClip              = 0x00004035,
    EmfPlusRecordTypeDrawDriverString        = 0x00004036,
    EmfPlusRecordTypeStrokeFillPath          = 0x00004037,
    EmfPlusRecordTypeSerializableObject      = 0x00004038,
    EmfPlusRecordTypeSetTSGraphics           = 0x00004039,
    EmfPlusRecordTypeSetTSClip               = 0x0000403a,
    EmfPlusRecordTotal                       = 0x0000403b,
    EmfPlusRecordTypeMax                     = 0x0000403a,
    EmfPlusRecordTypeMin                     = 0x00004001,
}

alias StringFormatFlags = int;
enum : int
{
    StringFormatFlagsDirectionRightToLeft  = 0x00000001,
    StringFormatFlagsDirectionVertical     = 0x00000002,
    StringFormatFlagsNoFitBlackBox         = 0x00000004,
    StringFormatFlagsDisplayFormatControl  = 0x00000020,
    StringFormatFlagsNoFontFallback        = 0x00000400,
    StringFormatFlagsMeasureTrailingSpaces = 0x00000800,
    StringFormatFlagsNoWrap                = 0x00001000,
    StringFormatFlagsLineLimit             = 0x00002000,
    StringFormatFlagsNoClip                = 0x00004000,
    StringFormatFlagsBypassGDI             = 0x80000000,
}

alias StringTrimming = int;
enum : int
{
    StringTrimmingNone              = 0x00000000,
    StringTrimmingCharacter         = 0x00000001,
    StringTrimmingWord              = 0x00000002,
    StringTrimmingEllipsisCharacter = 0x00000003,
    StringTrimmingEllipsisWord      = 0x00000004,
    StringTrimmingEllipsisPath      = 0x00000005,
}

alias StringDigitSubstitute = int;
enum : int
{
    StringDigitSubstituteUser        = 0x00000000,
    StringDigitSubstituteNone        = 0x00000001,
    StringDigitSubstituteNational    = 0x00000002,
    StringDigitSubstituteTraditional = 0x00000003,
}

alias HotkeyPrefix = int;
enum : int
{
    HotkeyPrefixNone = 0x00000000,
    HotkeyPrefixShow = 0x00000001,
    HotkeyPrefixHide = 0x00000002,
}

alias StringAlignment = int;
enum : int
{
    StringAlignmentNear   = 0x00000000,
    StringAlignmentCenter = 0x00000001,
    StringAlignmentFar    = 0x00000002,
}

alias DriverStringOptions = int;
enum : int
{
    DriverStringOptionsCmapLookup      = 0x00000001,
    DriverStringOptionsVertical        = 0x00000002,
    DriverStringOptionsRealizedAdvance = 0x00000004,
    DriverStringOptionsLimitSubpixel   = 0x00000008,
}

alias FlushIntention = int;
enum : int
{
    FlushIntentionFlush = 0x00000000,
    FlushIntentionSync  = 0x00000001,
}

alias EncoderParameterValueType = int;
enum : int
{
    EncoderParameterValueTypeByte          = 0x00000001,
    EncoderParameterValueTypeASCII         = 0x00000002,
    EncoderParameterValueTypeShort         = 0x00000003,
    EncoderParameterValueTypeLong          = 0x00000004,
    EncoderParameterValueTypeRational      = 0x00000005,
    EncoderParameterValueTypeLongRange     = 0x00000006,
    EncoderParameterValueTypeUndefined     = 0x00000007,
    EncoderParameterValueTypeRationalRange = 0x00000008,
    EncoderParameterValueTypePointer       = 0x00000009,
}

alias EncoderValue = int;
enum : int
{
    EncoderValueColorTypeCMYK            = 0x00000000,
    EncoderValueColorTypeYCCK            = 0x00000001,
    EncoderValueCompressionLZW           = 0x00000002,
    EncoderValueCompressionCCITT3        = 0x00000003,
    EncoderValueCompressionCCITT4        = 0x00000004,
    EncoderValueCompressionRle           = 0x00000005,
    EncoderValueCompressionNone          = 0x00000006,
    EncoderValueScanMethodInterlaced     = 0x00000007,
    EncoderValueScanMethodNonInterlaced  = 0x00000008,
    EncoderValueVersionGif87             = 0x00000009,
    EncoderValueVersionGif89             = 0x0000000a,
    EncoderValueRenderProgressive        = 0x0000000b,
    EncoderValueRenderNonProgressive     = 0x0000000c,
    EncoderValueTransformRotate90        = 0x0000000d,
    EncoderValueTransformRotate180       = 0x0000000e,
    EncoderValueTransformRotate270       = 0x0000000f,
    EncoderValueTransformFlipHorizontal  = 0x00000010,
    EncoderValueTransformFlipVertical    = 0x00000011,
    EncoderValueMultiFrame               = 0x00000012,
    EncoderValueLastFrame                = 0x00000013,
    EncoderValueFlush                    = 0x00000014,
    EncoderValueFrameDimensionTime       = 0x00000015,
    EncoderValueFrameDimensionResolution = 0x00000016,
    EncoderValueFrameDimensionPage       = 0x00000017,
    EncoderValueColorTypeGray            = 0x00000018,
    EncoderValueColorTypeRGB             = 0x00000019,
}

alias EmfToWmfBitsFlags = int;
enum : int
{
    EmfToWmfBitsFlagsDefault          = 0x00000000,
    EmfToWmfBitsFlagsEmbedEmf         = 0x00000001,
    EmfToWmfBitsFlagsIncludePlaceable = 0x00000002,
    EmfToWmfBitsFlagsNoXORClip        = 0x00000004,
}

alias ConvertToEmfPlusFlags = int;
enum : int
{
    ConvertToEmfPlusFlagsDefault       = 0x00000000,
    ConvertToEmfPlusFlagsRopUsed       = 0x00000001,
    ConvertToEmfPlusFlagsText          = 0x00000002,
    ConvertToEmfPlusFlagsInvalidRecord = 0x00000004,
}

alias GpTestControlEnum = int;
enum : int
{
    TestControlForceBilinear  = 0x00000000,
    TestControlNoICM          = 0x00000001,
    TestControlGetBuildNumber = 0x00000002,
}

alias ImageAbort = BOOL function(void*);
alias DrawImageAbort = BOOL function();
alias GetThumbnailImageAbort = BOOL function();
alias EnumerateMetafileProc = BOOL function(EmfPlusRecordType, uint, uint, const(ubyte)*, void*);
// [Not Found] IID_GdiplusAbort
interface GdiplusAbort
{
    HRESULT Abort();
}
alias Status = int;
enum : int
{
    Ok                        = 0x00000000,
    GenericError              = 0x00000001,
    InvalidParameter          = 0x00000002,
    OutOfMemory               = 0x00000003,
    ObjectBusy                = 0x00000004,
    InsufficientBuffer        = 0x00000005,
    NotImplemented            = 0x00000006,
    Win32Error                = 0x00000007,
    WrongState                = 0x00000008,
    Aborted                   = 0x00000009,
    FileNotFound              = 0x0000000a,
    ValueOverflow             = 0x0000000b,
    AccessDenied              = 0x0000000c,
    UnknownImageFormat        = 0x0000000d,
    FontFamilyNotFound        = 0x0000000e,
    FontStyleNotFound         = 0x0000000f,
    NotTrueTypeFont           = 0x00000010,
    UnsupportedGdiplusVersion = 0x00000011,
    GdiplusNotInitialized     = 0x00000012,
    PropertyNotFound          = 0x00000013,
    PropertyNotSupported      = 0x00000014,
    ProfileNotFound           = 0x00000015,
}

struct SizeF
{
    float Width;
    float Height;
}
struct Size
{
    int Width;
    int Height;
}
struct PointF
{
    float X;
    float Y;
}
struct Point
{
    int X;
    int Y;
}
struct RectF
{
    float X;
    float Y;
    float Width;
    float Height;
}
struct Rect
{
    int X;
    int Y;
    int Width;
    int Height;
}
struct CharacterRange
{
    int First;
    int Length;
}
alias DebugEventLevel = int;
enum : int
{
    DebugEventLevelFatal   = 0x00000000,
    DebugEventLevelWarning = 0x00000001,
}

alias DebugEventProc = void function(DebugEventLevel, PSTR);
alias NotificationHookProc = Status function(ulong*);
alias NotificationUnhookProc = void function(ulong);
struct GdiplusStartupInput
{
    uint GdiplusVersion;
    long DebugEventCallback;
    BOOL SuppressBackgroundThread;
    BOOL SuppressExternalCodecs;
}
struct GdiplusStartupInputEx
{
    GdiplusStartupInput Base;
    int StartupParameters;
}
alias GdiplusStartupParams = int;
enum : int
{
    GdiplusStartupDefault          = 0x00000000,
    GdiplusStartupNoSetRound       = 0x00000001,
    GdiplusStartupSetPSValue       = 0x00000002,
    GdiplusStartupTransparencyMask = 0xff000000,
}

struct GdiplusStartupOutput
{
    long NotificationHook;
    long NotificationUnhook;
}
alias PaletteType = int;
enum : int
{
    PaletteTypeCustom           = 0x00000000,
    PaletteTypeOptimal          = 0x00000001,
    PaletteTypeFixedBW          = 0x00000002,
    PaletteTypeFixedHalftone8   = 0x00000003,
    PaletteTypeFixedHalftone27  = 0x00000004,
    PaletteTypeFixedHalftone64  = 0x00000005,
    PaletteTypeFixedHalftone125 = 0x00000006,
    PaletteTypeFixedHalftone216 = 0x00000007,
    PaletteTypeFixedHalftone252 = 0x00000008,
    PaletteTypeFixedHalftone256 = 0x00000009,
}

alias DitherType = int;
enum : int
{
    DitherTypeNone           = 0x00000000,
    DitherTypeSolid          = 0x00000001,
    DitherTypeOrdered4x4     = 0x00000002,
    DitherTypeOrdered8x8     = 0x00000003,
    DitherTypeOrdered16x16   = 0x00000004,
    DitherTypeSpiral4x4      = 0x00000005,
    DitherTypeSpiral8x8      = 0x00000006,
    DitherTypeDualSpiral4x4  = 0x00000007,
    DitherTypeDualSpiral8x8  = 0x00000008,
    DitherTypeErrorDiffusion = 0x00000009,
    DitherTypeMax            = 0x0000000a,
}

alias PaletteFlags = int;
enum : int
{
    PaletteFlagsHasAlpha  = 0x00000001,
    PaletteFlagsGrayScale = 0x00000002,
    PaletteFlagsHalftone  = 0x00000004,
}

struct ColorPalette
{
    uint Flags;
    uint Count;
    uint[1] Entries;
}
alias ColorMode = int;
enum : int
{
    ColorModeARGB32 = 0x00000000,
    ColorModeARGB64 = 0x00000001,
}

alias ColorChannelFlags = int;
enum : int
{
    ColorChannelFlagsC    = 0x00000000,
    ColorChannelFlagsM    = 0x00000001,
    ColorChannelFlagsY    = 0x00000002,
    ColorChannelFlagsK    = 0x00000003,
    ColorChannelFlagsLast = 0x00000004,
}

struct Color
{
    uint Argb;
    int AliceBlue;
    int AntiqueWhite;
    int Aqua;
    int Aquamarine;
    int Azure;
    int Beige;
    int Bisque;
    int Black;
    int BlanchedAlmond;
    int Blue;
    int BlueViolet;
    int Brown;
    int BurlyWood;
    int CadetBlue;
    int Chartreuse;
    int Chocolate;
    int Coral;
    int CornflowerBlue;
    int Cornsilk;
    int Crimson;
    int Cyan;
    int DarkBlue;
    int DarkCyan;
    int DarkGoldenrod;
    int DarkGray;
    int DarkGreen;
    int DarkKhaki;
    int DarkMagenta;
    int DarkOliveGreen;
    int DarkOrange;
    int DarkOrchid;
    int DarkRed;
    int DarkSalmon;
    int DarkSeaGreen;
    int DarkSlateBlue;
    int DarkSlateGray;
    int DarkTurquoise;
    int DarkViolet;
    int DeepPink;
    int DeepSkyBlue;
    int DimGray;
    int DodgerBlue;
    int Firebrick;
    int FloralWhite;
    int ForestGreen;
    int Fuchsia;
    int Gainsboro;
    int GhostWhite;
    int Gold;
    int Goldenrod;
    int Gray;
    int Green;
    int GreenYellow;
    int Honeydew;
    int HotPink;
    int IndianRed;
    int Indigo;
    int Ivory;
    int Khaki;
    int Lavender;
    int LavenderBlush;
    int LawnGreen;
    int LemonChiffon;
    int LightBlue;
    int LightCoral;
    int LightCyan;
    int LightGoldenrodYellow;
    int LightGray;
    int LightGreen;
    int LightPink;
    int LightSalmon;
    int LightSeaGreen;
    int LightSkyBlue;
    int LightSlateGray;
    int LightSteelBlue;
    int LightYellow;
    int Lime;
    int LimeGreen;
    int Linen;
    int Magenta;
    int Maroon;
    int MediumAquamarine;
    int MediumBlue;
    int MediumOrchid;
    int MediumPurple;
    int MediumSeaGreen;
    int MediumSlateBlue;
    int MediumSpringGreen;
    int MediumTurquoise;
    int MediumVioletRed;
    int MidnightBlue;
    int MintCream;
    int MistyRose;
    int Moccasin;
    int NavajoWhite;
    int Navy;
    int OldLace;
    int Olive;
    int OliveDrab;
    int Orange;
    int OrangeRed;
    int Orchid;
    int PaleGoldenrod;
    int PaleGreen;
    int PaleTurquoise;
    int PaleVioletRed;
    int PapayaWhip;
    int PeachPuff;
    int Peru;
    int Pink;
    int Plum;
    int PowderBlue;
    int Purple;
    int Red;
    int RosyBrown;
    int RoyalBlue;
    int SaddleBrown;
    int Salmon;
    int SandyBrown;
    int SeaGreen;
    int SeaShell;
    int Sienna;
    int Silver;
    int SkyBlue;
    int SlateBlue;
    int SlateGray;
    int Snow;
    int SpringGreen;
    int SteelBlue;
    int Tan;
    int Teal;
    int Thistle;
    int Tomato;
    int Transparent;
    int Turquoise;
    int Violet;
    int Wheat;
    int White;
    int WhiteSmoke;
    int Yellow;
    int YellowGreen;
    int AlphaShift;
    int RedShift;
    int GreenShift;
    int BlueShift;
    int AlphaMask;
    int RedMask;
    int GreenMask;
    int BlueMask;
}
struct ENHMETAHEADER3
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
}
struct PWMFRect16
{
    short Left;
    short Top;
    short Right;
    short Bottom;
}
struct WmfPlaceableFileHeader
{
    align (2):
    uint Key;
    short Hmf;
    PWMFRect16 BoundingBox;
    short Inch;
    uint Reserved;
    short Checksum;
}
struct MetafileHeader
{
    MetafileType Type;
    uint Size;
    uint Version;
    uint EmfPlusFlags;
    float DpiX;
    float DpiY;
    int X;
    int Y;
    int Width;
    int Height;
    union
    {
        METAHEADER WmfHeader;
        ENHMETAHEADER3 EmfHeader;
    }
    int EmfPlusHeaderSize;
    int LogicalDpiX;
    int LogicalDpiY;
}
enum IID_IImageBytes = GUID(0x25d1823, 0x6c7d, 0x447b, [0xbb, 0xdb, 0xa3, 0xcb, 0xc3, 0xdf, 0xa2, 0xfc]);
interface IImageBytes : IUnknown
{
    HRESULT CountBytes(uint*);
    HRESULT LockBytes(uint, uint, const(void)**);
    HRESULT UnlockBytes(const(void)*, uint, uint);
}
struct ImageCodecInfo
{
    GUID Clsid;
    GUID FormatID;
    const(wchar)* CodecName;
    const(wchar)* DllName;
    const(wchar)* FormatDescription;
    const(wchar)* FilenameExtension;
    const(wchar)* MimeType;
    uint Flags;
    uint Version;
    uint SigCount;
    uint SigSize;
    const(ubyte)* SigPattern;
    const(ubyte)* SigMask;
}
alias ImageCodecFlags = int;
enum : int
{
    ImageCodecFlagsEncoder        = 0x00000001,
    ImageCodecFlagsDecoder        = 0x00000002,
    ImageCodecFlagsSupportBitmap  = 0x00000004,
    ImageCodecFlagsSupportVector  = 0x00000008,
    ImageCodecFlagsSeekableEncode = 0x00000010,
    ImageCodecFlagsBlockingDecode = 0x00000020,
    ImageCodecFlagsBuiltin        = 0x00010000,
    ImageCodecFlagsSystem         = 0x00020000,
    ImageCodecFlagsUser           = 0x00040000,
}

alias ImageLockMode = int;
enum : int
{
    ImageLockModeRead         = 0x00000001,
    ImageLockModeWrite        = 0x00000002,
    ImageLockModeUserInputBuf = 0x00000004,
}

struct BitmapData
{
    uint Width;
    uint Height;
    int Stride;
    int PixelFormat;
    void* Scan0;
    ulong Reserved;
}
alias ImageFlags = int;
enum : int
{
    ImageFlagsNone              = 0x00000000,
    ImageFlagsScalable          = 0x00000001,
    ImageFlagsHasAlpha          = 0x00000002,
    ImageFlagsHasTranslucent    = 0x00000004,
    ImageFlagsPartiallyScalable = 0x00000008,
    ImageFlagsColorSpaceRGB     = 0x00000010,
    ImageFlagsColorSpaceCMYK    = 0x00000020,
    ImageFlagsColorSpaceGRAY    = 0x00000040,
    ImageFlagsColorSpaceYCBCR   = 0x00000080,
    ImageFlagsColorSpaceYCCK    = 0x00000100,
    ImageFlagsHasRealDPI        = 0x00001000,
    ImageFlagsHasRealPixelSize  = 0x00002000,
    ImageFlagsReadOnly          = 0x00010000,
    ImageFlagsCaching           = 0x00020000,
}

alias RotateFlipType = int;
enum : int
{
    RotateNoneFlipNone = 0x00000000,
    Rotate90FlipNone   = 0x00000001,
    Rotate180FlipNone  = 0x00000002,
    Rotate270FlipNone  = 0x00000003,
    RotateNoneFlipX    = 0x00000004,
    Rotate90FlipX      = 0x00000005,
    Rotate180FlipX     = 0x00000006,
    Rotate270FlipX     = 0x00000007,
    RotateNoneFlipY    = 0x00000006,
    Rotate90FlipY      = 0x00000007,
    Rotate180FlipY     = 0x00000004,
    Rotate270FlipY     = 0x00000005,
    RotateNoneFlipXY   = 0x00000002,
    Rotate90FlipXY     = 0x00000003,
    Rotate180FlipXY    = 0x00000000,
    Rotate270FlipXY    = 0x00000001,
}

struct EncoderParameter
{
    GUID Guid;
    uint NumberOfValues;
    uint Type;
    void* Value;
}
struct EncoderParameters
{
    uint Count;
    EncoderParameter[1] Parameter;
}
alias ItemDataPosition = int;
enum : int
{
    ItemDataPositionAfterHeader  = 0x00000000,
    ItemDataPositionAfterPalette = 0x00000001,
    ItemDataPositionAfterBits    = 0x00000002,
}

struct ImageItemData
{
    uint Size;
    uint Position;
    void* Desc;
    uint DescSize;
    void* Data;
    uint DataSize;
    uint Cookie;
}
struct PropertyItem
{
    uint id;
    uint length;
    ushort type;
    void* value;
}
alias HistogramFormat = int;
enum : int
{
    HistogramFormatARGB  = 0x00000000,
    HistogramFormatPARGB = 0x00000001,
    HistogramFormatRGB   = 0x00000002,
    HistogramFormatGray  = 0x00000003,
    HistogramFormatB     = 0x00000004,
    HistogramFormatG     = 0x00000005,
    HistogramFormatR     = 0x00000006,
    HistogramFormatA     = 0x00000007,
}

struct ColorMatrix
{
    float[25] m;
}
alias ColorMatrixFlags = int;
enum : int
{
    ColorMatrixFlagsDefault   = 0x00000000,
    ColorMatrixFlagsSkipGrays = 0x00000001,
    ColorMatrixFlagsAltGray   = 0x00000002,
}

alias ColorAdjustType = int;
enum : int
{
    ColorAdjustTypeDefault = 0x00000000,
    ColorAdjustTypeBitmap  = 0x00000001,
    ColorAdjustTypeBrush   = 0x00000002,
    ColorAdjustTypePen     = 0x00000003,
    ColorAdjustTypeText    = 0x00000004,
    ColorAdjustTypeCount   = 0x00000005,
    ColorAdjustTypeAny     = 0x00000006,
}

struct ColorMap
{
    Color oldColor;
    Color newColor;
}
struct SharpenParams
{
    float radius;
    float amount;
}
struct BlurParams
{
    float radius;
    BOOL expandEdge;
}
struct BrightnessContrastParams
{
    int brightnessLevel;
    int contrastLevel;
}
struct RedEyeCorrectionParams
{
    uint numberOfAreas;
    RECT* areas;
}
struct HueSaturationLightnessParams
{
    int hueLevel;
    int saturationLevel;
    int lightnessLevel;
}
struct TintParams
{
    int hue;
    int amount;
}
struct LevelsParams
{
    int highlight;
    int midtone;
    int shadow;
}
struct ColorBalanceParams
{
    int cyanRed;
    int magentaGreen;
    int yellowBlue;
}
struct ColorLUTParams
{
    ubyte[256] lutB;
    ubyte[256] lutG;
    ubyte[256] lutR;
    ubyte[256] lutA;
}
alias CurveAdjustments = int;
enum : int
{
    AdjustExposure        = 0x00000000,
    AdjustDensity         = 0x00000001,
    AdjustContrast        = 0x00000002,
    AdjustHighlight       = 0x00000003,
    AdjustShadow          = 0x00000004,
    AdjustMidtone         = 0x00000005,
    AdjustWhiteSaturation = 0x00000006,
    AdjustBlackSaturation = 0x00000007,
}

alias CurveChannel = int;
enum : int
{
    CurveChannelAll   = 0x00000000,
    CurveChannelRed   = 0x00000001,
    CurveChannelGreen = 0x00000002,
    CurveChannelBlue  = 0x00000003,
}

struct ColorCurveParams
{
    CurveAdjustments adjustment;
    CurveChannel channel;
    int adjustValue;
}
struct Effect
{
    void** lpVtbl;
    CGpEffect* nativeEffect;
    int auxDataSize;
    void* auxData;
    BOOL useAuxData;
}
struct Blur
{
    Effect Base;
}
struct Sharpen
{
    Effect Base;
}
struct RedEyeCorrection
{
    Effect Base;
}
struct BrightnessContrast
{
    Effect Base;
}
struct HueSaturationLightness
{
    Effect Base;
}
struct Levels
{
    Effect Base;
}
struct Tint
{
    Effect Base;
}
struct ColorBalance
{
    Effect Base;
}
struct ColorMatrixEffect
{
    Effect Base;
}
struct ColorLUT
{
    Effect Base;
}
struct ColorCurve
{
    Effect Base;
}
