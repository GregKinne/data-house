# PoorSQL

```
 This is a free and open-source SQL (T-SQL) formatter:

    - Handles complete multi-batch scripts, including object definition scripts such as stored procedures, triggers, etc.
    - Provides formatting options to cater to different common formatting styles/standards
    - Optionally outputs "colorized" html code rather than just the formatted SQL
    - Also provides "minifier" option to strip out comments and whitespace, to obfuscate rather than pretty-print your code
    - Available ready-to-use in a variety of forms
        - SSMS (SQL Server Management Studio) and Visual Studio Addin/Extension that allows you to format the current file or selected text with a single hotkey - supports any version of SSMS or SSMS Express, and any Full (not Express) version of Visual Studio.
        - Notepad++ plugin, for quick single-key formatting in your favorite general-purpose text editor.
        - Command-line utility that lets you format any number of files in bulk, or format from some other arbitrary program - for windows (.Net) or any environment (node/npm)
        - Winforms app for easy offline formatting (also lets you look at the token stream and parse tree)
        - WinMerge plugin, for automatically formatting SQL files before comparison, allowing WinMerge to display content changes only, ignoring formatting differences.
        - JS library that exposes the same functionality in any browser or other Javascript-based context, used in the demo/online formatting site http://poorsql.com
    - Also available as a .Net 2.0/3.5 library, downloadable here or through NuGet
    - Written in C# using a pluggable design that should allow for other SQL dialects to be supported in future
```

[Website](https://poorsql.com/)

SSMS Plugin Available!

**What Does it have to offer me, a database administrator/developer?**
- Opinionated format of tsql
- less cognative load deciphering other's writing style

## Show Me
```bash
echo "select a from b join c on b.id = c.id where abc = 123 and def = N'whatêver' " | sqlformat

echo "SeleCT a,b,c as d, e, f from f join g on f.id = g.id where x = 1 and y = 2 and z = 3 group by 1,2,3,4,5,6" | sqlformat
```
