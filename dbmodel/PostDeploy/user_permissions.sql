SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

IF @@SERVERNAME = 'prod-weatherserver9128'
BEGIN
    ALTER ROLE [db_datareader] ADD MEMBER [hows-the-weather@kinne.solutions];
    ALTER ROLE [db_datawriter] ADD MEMBER [hows-the-weather@kinne.solutions];

    ALTER ROLE [db_owner]      ADD MEMBER [db-deploy@kinne.solutions];
END

IF @@SERVERNAME = 'weatherserver9128'
BEGIN
    ALTER ROLE [db_datareader] ADD MEMBER [hows-the-weather@kinne.dev];
    ALTER ROLE [db_datawriter] ADD MEMBER [hows-the-weather@kinne.dev];

    ALTER ROLE [db_owner]      ADD MEMBER [db-deploy@kinne.dev];
END