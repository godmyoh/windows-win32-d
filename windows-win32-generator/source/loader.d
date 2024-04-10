module loader;

public import database.reader.database;


auto loadDatabase()
{
    import std.file;
    auto winmdFile = `.\meta\Windows.Win32.winmd`;
    return new Database(read(winmdFile));
}


version (unittest)
{
    __gshared Database testdb;
    shared static this()
    {
        testdb = loadDatabase();
    }
}
