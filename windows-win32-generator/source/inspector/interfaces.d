module inspector.interfaces;


interface IRowPrinter
{
    void print(uint rid);
}


interface ISearcher
{
    uint searchNext(string text, uint prevRid);
}
