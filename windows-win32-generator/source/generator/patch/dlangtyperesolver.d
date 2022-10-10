module generator.patch.dlangtyperesolver;

public import generator.impl.interfaces;


class DlangTypeResolverPatch : IDlangTypeResolver
{
    private
    {
        IDlangTypeResolver wrappee;
    }

    this(IDlangTypeResolver wrappee)
    {
        this.wrappee = wrappee;
    }

    override constr toDlangType(CLIType cliType, bool isConst)
    {
        if (cliType == CLIType_Guid)
            return isConst ? "const(GUID)" : "GUID";

        // Avoid conflict with enum VIRTUAL_KEY.VK_F
        if (cliType.namespace == "Windows.Win32.UI.Input.KeyboardAndMouse" && cliType.typeName == "VK_F")
            return "VK_F_";

        if (isConst)
        {
            auto dlangType = cliType.typeName;

            if (dlangType == "PWSTR")
                return "const(wchar)*";
            else if (dlangType == "PSTR")
                return "const(char)*";
        }

        return wrappee.toDlangType(cliType, isConst);
    }
}
