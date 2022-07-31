module generator.commentout;

public import generator.type;


constr commentOutUnsupportedDecl(constr decl)
{
    return "/+ [UNSUPPORTED] " ~ decl ~ "\n+/";
}


constr commentOutConflictedDecl(constr decl)
{
    return "/+ [CONFLICTED] " ~ decl ~ "\n+/";
}
