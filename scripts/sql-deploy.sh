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