module generator.impl.helper.stringhelper;

public import generator.type;

class StringHelper
{
    private
    {
        const char[20] spaces;
    }

    this()
    {
        spaces[] = ' ';
    }

    constr getIndentation(int level) return
    {
        assert(level * 4 <= spaces.length);
        return spaces[0..level*4];
    }
}
