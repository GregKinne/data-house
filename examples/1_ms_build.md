# msbuild

**What is MS-Build/dotnet-build?**

`MSBuild is a build tool that helps automate the process of creating a software product, including compiling the source code, packaging, testing, deployment and creating documentations`

**What Does it have to offer me, a database administrator/developer?**
- A chance to ensure your T-SQL Code Binds and Parses before running it on a database
- A chance to see generic recommendations about your database design
- The creation of an artifact, a .dacpac file, that can be used to create differential scripts

## Show Me

**Building a model of the files in a directory**
```bash
mv hows-the-weather/bin/Debug/net8.0/hows-the-weather.dacpac archive
dotnet build hows-the-weather/hows-the-weather.csproj
```

**An Example of no object to bind to**
```bash
#Update the ms_build_view.sql
dotnet build hows-the-weather/hows-the-weather.csproj
```


so - How can we use this to our advantage?