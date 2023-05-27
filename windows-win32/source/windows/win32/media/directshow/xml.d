module windows.win32.media.directshow.xml;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLElement;
import windows.win32.foundation : BSTR, HRESULT, PWSTR;
import windows.win32.media.directshow : IGraphBuilder;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

enum CLSID_XMLGraphBuilder = GUID(0x1bb05961, 0x5fbf, 0x11d2, [0xa5, 0x21, 0x44, 0xdf, 0x7, 0xc1, 0x0, 0x0]);
enum IID_IXMLGraphBuilder = GUID(0x1bb05960, 0x5fbf, 0x11d2, [0xa5, 0x21, 0x44, 0xdf, 0x7, 0xc1, 0x0, 0x0]);
interface IXMLGraphBuilder : IUnknown
{
    HRESULT BuildFromXML(IGraphBuilder, IXMLElement);
    HRESULT SaveToXML(IGraphBuilder, BSTR*);
    HRESULT BuildFromXMLFile(IGraphBuilder, const(wchar)*, const(wchar)*);
}
