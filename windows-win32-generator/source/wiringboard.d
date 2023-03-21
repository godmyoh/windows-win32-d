module wiringboard;

import generator.generator;
import generator.impl.declarationaggregator;
import generator.impl.declarationextractor;
import generator.impl.modulewriter;
import generator.impl.namespaceextractor;
import generator.impl.namespacetomodulemapper;

import generator.resolver.dlangtyperesolver;

import generator.patch.declarationaggregator;
import generator.patch.dlangtyperesolver;
import generator.patch.modulewriter;

import std.file;


auto buildGenerator(string outDir, PatchStatus patchStatus)
{
    auto winmdFile = `.\meta\Windows.Win32.winmd`;
    auto db = new Database(read(winmdFile));

    auto patchedDeclarationAggrigator = new DeclarationAggregatorPatch(patchStatus, new DeclarationAggregator());
    auto patchedModuleWriter = new ModuleWriterPatch(patchStatus, new ModuleWriter());
    auto patchedDlangTypeResolver = new DlangTypeResolverPatch(patchStatus, new DlangTypeResolver());

    return new Win32ModuleGenerator(outDir,
                                    new NamespaceExtractor(db),
                                    new NamespaceToModuleMapper(),
                                    new DeclarationExtractor(db,
                                                             patchedDlangTypeResolver),
                                    patchedDeclarationAggrigator,
                                    patchedModuleWriter
                                    );
}
