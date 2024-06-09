SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

IF @@SERVERNAME = 'prod-weatherserver9128'
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'hows-the-weather@kinne.solutions')
    BEGIN
        CREATE USER [hows-the-weather@kinne.solutions] FROM EXTERNAL PROVIDER;
    END
    IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db-deploy@kinne.solutions')
    BEGIN
        CREATE USER [db-deploy@kinne.solutions] FROM EXTERNAL PROVIDER;
    END
END

IF @@SERVERNAME = 'weatherserver9128'
BEGIN
    IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'hows-the-weather@kinne.dev')
    BEGIN
        CREATE USER [hows-the-weather@kinne.dev] FROM EXTERNAL PROVIDER; 
    END
    IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db-deploy@kinne.dev')
    BEGIN
        CREATE USER [db-deploy@kinne.dev] FROM EXTERNAL PROVIDER;
    END
END