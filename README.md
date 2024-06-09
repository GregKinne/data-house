# data-house

Build & Deploy MSFT SQL variant database code with strong guarentees on quality 

## What does CI/CD mean for a database?

### Build
- Dockerfile Tasks:
  - TSQLLint
  - dotnet build (dacpac generation)
  - Publish Artifact
- Deploy to Dev

### Deploy
- sqlpackage.exe

#### commands
```
sqlpackage /Action:Script /SourceFile:dbmodel/bin/Debug/netstandard2.0/dbmodel.dacpac /DeployScriptPath:PostDeploy/user_creation.sql /TargetConnectionString:"Data Source=weatherserver9128.database.windows.net; Initial Catalog=weather; Authentication=Active Directory Password; UID=db-deploy@kinne.dev; PWD=password"

```

```
sqlpackage /Action:Publish /SourceFile:dbmodel/bin/Debug/netstandard2.0/dbmodel.dacpac /TargetConnectionString:"Data Source=weatherserver9128.database.windows.net; Initial Catalog=weather; Authentication=Active Directory Password; UID=db-deploy@kinne.dev; PWD=password"

```

```
sqlcmd -S weatherserver9128.database.windows.net -d weather -U db-deploy@kinne.dev -P password -i PostDeploy/user_permissions.sql -G
```