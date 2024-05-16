# data-house

Build & Deploy MSFT SQL variant database code with strong guarentees on quality 

## What does CI/CD mean for a database?

### Build
- TSQLLint
- dotnet build (dacpac generation)
- Publish Artifact

### Deploy
- sqlpackage.exe
