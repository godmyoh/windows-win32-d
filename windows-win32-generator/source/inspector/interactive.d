module inspector.interactive;

import database.reader.database;
import database.schema;
import inspector.interfaces;

import std.stdio;
import std.string;
import std.traits;
import std.typecons;


class Interactive
{
    struct Config
    {
        bool autoStrip = true;
    }

    private
    {
        Database db;
        Config _config;
        Nullable!int exitCode;

        string currentTable;
        uint currentTableSize;

        IRowPrinter[string] rowPrinters;
        ISearcher[string] searchers;

        ITableSummary[] tables;
    }

    this(Database db)
    {
        this.db = db;

        import inspector.rowprinter.typedef;
        import inspector.rowprinter.typeref;
        import inspector.rowprinter.customattribute;
        import inspector.rowprinter.field;
        import inspector.rowprinter.interfaceimpl;

        rowPrinters[db.TypeDef.name] = new TypeDefPrinter(db);
        rowPrinters[db.TypeRef.name] = new TypeRefPrinter(db);
        rowPrinters[db.CustomAttribute.name] = new CustomAttributePrinter(db);
        rowPrinters[db.Field.name] = new FieldPrinter(db);
        rowPrinters[db.InterfaceImpl.name] = new InterfaceImplPrinter(db);

        import inspector.searcher.typedef;
        import inspector.searcher.customattribute;

        searchers[db.TypeDef.name] = new TypeDefSearcher(db);
        searchers[db.CustomAttribute.name] = new CustomAttributeSearcher(db);

        tables = [
            cast(ITableSummary)db.Module,
            db.TypeRef,
            db.TypeDef,
            db.Field,
            db.MethodDef,
            db.Param,
            db.InterfaceImpl,
            db.MemberRef,
            db.Constant,
            db.CustomAttribute,
            db.FieldMarshal,
            db.DeclSecurity,
            db.ClassLayout,
            db.FieldLayout,
            db.StandAloneSig,
            db.EventMap,
            db.Event,
            db.PropertyMap,
            db.Property,
            db.MethodSemantics,
            db.MethodImpl,
            db.ModuleRef,
            db.TypeSpec,
            db.ImplMap,
            db.FieldRVA,
            db.Assembly,
            db.AssemblyProcessor,
            db.AssemblyOS,
            db.AssemblyRef,
            db.AssemblyRefProcessor,
            db.AssemblyRefOS,
            db.File,
            db.ExportedType,
            db.ManifestResource,
            db.NestedClass,
            db.GenericParam,
            db.MethodSpec,
            db.GenericParamConstraint,
        ];

        switchCurrentTable(db.TypeDef.name);
    }

    int execute()
    {
        while (exitCode.isNull)
        {
            writef("%s(%d)> ", currentTable, currentTableSize);

            auto input = readln();

            if (_config.autoStrip)
                input = input.strip();

            if (input.empty)
                continue;

            try
            {
                processLineInput(input);
            }
            catch (Exception e)
            {
                writefln("%s", e.msg);
            }
        }

        return exitCode.get;
    }

    void exit(int code) nothrow
    {
        exitCode = code;
    }

    private void switchCurrentTable(string tableName)
    {
        currentTable = tableName;
        foreach (table; tables)
            if (table.name == tableName)
                currentTableSize = table.size;
    }

    private void processLineInput(string input)
    {
        if (isHelpCommand(input))
        {
            writefln("tables        : Print name of tables in this database.");
            writefln("[Table Name]  : Switch current table to [Table Name].");
            writefln("[RID]         : Print data in a row at [RID].");
            writefln("[RID1]-[RID2] : Print data in rows between [RID1] to [RID2].");
            writefln("[Text]        : Search [Text] in current table.");
            writefln("Ctrl+C        : Exit inspector.");
            return;
        }
        else if (isTablesCommand(input))
        {
            foreach (i, table; tables)
            {
                uint size = table.size;
                if (size > 0 && input == "tables")
                    writefln("%s(%d)", table.name, size);
            }
            writeln();
            return;
        }
        else if (isTableName(input))
        {
            switchCurrentTable(input);
            return;
        }
        else if (auto rid = isRID(input))
        {
            if (auto p = currentTable in rowPrinters)
            {
                if (rid.isSingle)
                    (*p).print(rid.rid);
                else
                    inspectForRange(rid.ridBegin, rid.ridEnd, &p.print);
            }
            else
                writefln("%s not implemented.", currentTable);
            return;
        }
        else
        {
            if (auto p = currentTable in searchers)
            {
                if (auto p2 = currentTable in rowPrinters)
                {
                    ISearcher searcher = *p;
                    IRowPrinter rowPrinter = *p2;
                    uint found = 0;
                    while (true)
                    {
                        found = searcher.searchNext(input, found);
                        if (found == 0)
                            break;
                        rowPrinter.print(found);
                    }

                    return;
                }
            }

            writefln("%s not implemented.", currentTable);
        }
    }

    private bool isHelpCommand(string input)
    {
        return input == "help";
    }

    private bool isTablesCommand(string input)
    {
        return input == "tables";
    }

    private bool isTableName(string input)
    {
        foreach (table; tables)
        {
            if (input == table.name)
                return true;
        }

        return false;
    }

    private static class ByRIDCommand
    {
        uint rid;
        uint ridBegin;
        uint ridEnd;

        bool isSingle() const
        {
            return rid > 0 || (ridBegin == 0 && ridEnd == 0);
        }

        bool isRange() const
        {
            return !isSingle;
        }
    }

    private ByRIDCommand isRID(string input)
    {
        try
        {
            ByRIDCommand ret = new ByRIDCommand;

            import std.conv;
            uint rid;
            uint ridBegin, ridEnd;

            auto tokens = input.split("-");

            if (tokens.length == 1)
            {
                ret.rid = input.to!uint;
            }
            else if (tokens.length == 2)
            {
                ret.ridBegin = tokens[0].to!uint;
                ret.ridEnd = tokens[1].to!uint + 1;
            }

            return ret;
        }
        catch (Exception)
        {
            return null;
        }
    }

    private void inspectForRange(uint begin, uint end, void delegate(uint) dg)
    {
        foreach (rid; begin..end)
            dg(rid);
    }
}
