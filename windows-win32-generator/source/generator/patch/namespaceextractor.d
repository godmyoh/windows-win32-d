module generator.patch.namespaceextractor;

public import generator.interfaces;
public import generator.patch.patchstatus;

import std.algorithm.iteration, std.array;


class NamespaceExtractorPatch : INamespaceExtractor
{
    private
    {
        PatchStatus patchStatus;
        INamespaceExtractor wrappee;

        enum PatchNames
        {
            excludeFoundationMetadata = "excludeFoundationMetadata",
        }
    }

    this(PatchStatus patchStatus, INamespaceExtractor wrappee)
    {
        this.patchStatus = patchStatus;
        this.wrappee = wrappee;

        import std.traits;
        foreach (patchName; EnumMembers!PatchNames)
            patchStatus.addPatchName(patchName);
    }

    override CLINamespace[] extract()
    {
        auto namespaces = wrappee.extract();
        auto filtered = namespaces.filter!(clins => clins.namespace != "Windows.Win32.Foundation.Metadata").array;

        if (namespaces.length != filtered.length)
            patchStatus.logExecuted(PatchNames.excludeFoundationMetadata);

        return filtered;
    }
}
