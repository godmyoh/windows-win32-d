module generator.patch.patchstatus;


class PatchStatus
{
    private
    {
        int[string] patchNameToCount;
    }

    void addPatchName(string patchName)
    {
        if (patchName in patchNameToCount)
            throw new Exception("Conflicts: patchName = " ~ patchName);

        patchNameToCount[patchName] = 0;
    }

    void logExecuted(string patchName)
    {
        if (patchName !in patchNameToCount)
            throw new Exception("Not Exists: patchName = " ~ patchName);

        patchNameToCount[patchName] = patchNameToCount[patchName] + 1;
    }

    bool hasDanglingPatch()
    {
        foreach (count; patchNameToCount.byValue())
            if (count == 0)
                return true;
        return false;
    }

    string report()
    {
        import std.conv;
        string buf;
        foreach (kv; patchNameToCount.byKeyValue())
        {
            buf ~= kv.key;
            buf ~= ": ";
            buf ~= kv.value.to!string;
            buf ~= "\n";
        }

        return buf[];
    }
}
