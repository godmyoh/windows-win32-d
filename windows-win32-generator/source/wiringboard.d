module wiringboard;

import generator.generator;
import generator.impl.declarationaggregator;
import generator.impl.declarationextractor;
import generator.impl.modulewriter;
import generator.impl.namespaceextractor;
import generator.impl.namespacetomodulemapper;
import generator.impl.namespacetomoduleorpackagemodulemapper;

import generator.resolver.dlangtyperesolver;

import generator.patch.declarationaggregator;
import generator.patch.dlangtyperesolver;
import generator.patch.modulewriter;
import generator.patch.namespaceextractor;

import std.file;

enum ConflictedModuleNaming
{
    appendUnderscore,
    usePackageModule,
}

auto buildGenerator(string outDir, PatchStatus patchStatus, ConflictedModuleNaming conflictedModuleNaming)
{
    auto winmdFile = `.\meta\Windows.Win32.winmd`;
    auto db = new Database(read(winmdFile));

    auto patchedNamespaceExtractor = new NamespaceExtractorPatch(patchStatus, new NamespaceExtractor(db));
    auto patchedDeclarationAggrigator = new DeclarationAggregatorPatch(patchStatus, new DeclarationAggregator());
    auto patchedModuleWriter = new ModuleWriterPatch(patchStatus, new ModuleWriter());
    auto patchedDlangTypeResolver = new DlangTypeResolverPatch(patchStatus, new DlangTypeResolver());

    INamespaceToModuleMapper namespaceToModuleMapper = conflictedModuleNaming == ConflictedModuleNaming.appendUnderscore
        ? cast(INamespaceToModuleMapper)new NamespaceToModuleMapper() : new NamespaceToModuleOrPackageModuleMapper();

    return new Win32ModuleGenerator(outDir,
                                    patchedNamespaceExtractor,
                                    namespaceToModuleMapper,
                                    new DeclarationExtractor(db,
                                                             patchedDlangTypeResolver),
                                    patchedDeclarationAggrigator,
                                    patchedModuleWriter
                                    );
}
