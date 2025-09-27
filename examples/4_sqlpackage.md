# sqlpackage

```
 SqlPackage is a command-line utility that automates the database development tasks by exposing some of the public Data-Tier Application Framework (DacFx) APIs. The primary use cases for SqlPackage focus on database portability and deployments for the SQL Server, Azure SQL, and Azure Synapse Analytics family of databases. SqlPackage can be automated using Azure Pipelines and GitHub actions or other CI/CD tools.
```

[Website](https://learn.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage?view=sql-server-ver17)

**What Does it have to offer me, a database administrator/developer?**
- Take the build (msbuild or dotnet build) of a database and deploy it against a target
- **only change what is not the same as the model**

## Show Me
**Create a local sql server 2022 instance**
```bash
docker rm sql1 --force
docker run \
    -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=myadminpassword123*" \
    -p 1433:1433 \
    --name sql1 \
    --hostname sql1 \
    -d \
    mcr.microsoft.com/mssql/server:2022-latest
docker logs sql1 -f
```

**Create the "weather" db. Build and deploy the local model**
```bash
# Deploy database if not exists
sqlcmd \
    -S 127.0.0.1,1433 \
    -d master \
    -U sa \
    -P myadminpassword123* \
    -i scripts/create-db.sql \
    -C

# Write datbase name to stdout
sqlcmd \
    -S 127.0.0.1,1433 \
    -d master \
    -U sa \
    -P myadminpassword123* \
    -i scripts/list-dbs.sql \
    -C

# Build the Dacpac
dotnet build hows-the-weather/hows-the-weather.csproj

# Deploy the local model
sqlpackage /Action:Publish \
    /SourceFile:hows-the-weather/bin/Debug/net8.0/hows-the-weather.dacpac \
    /TargetServerName:"127.0.0.1,1433" \
    /TargetDatabaseName:"weather" \
    /TargetUser:"sa" \
    /TargetPassword:"myadminpassword123*" \
    /TargetTrustServerCertificate:True

# Write datbase name to stdout
sqlcmd \
    -S 127.0.0.1,1433 \
    -d master \
    -U sa \
    -P myadminpassword123* \
    -i scripts/list-tables.sql \
    -C
```

**What Happened?**