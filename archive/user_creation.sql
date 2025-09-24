IF @@SERVERNAME = 'prod-weatherserver9128'
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM sys.database_principals
			WHERE name = 'hows-the-weather@kinne.solutions'
			)
	BEGIN
		/* tsqllint-disable invalid-syntax */
		CREATE USER [hows-the-weather@kinne.solutions]
		FOR EXTERNAL PROVIDER
		WITH DEFAULT_SCHEMA = data;
			/* tsqllint-enable invalid-syntax */
	END

	IF NOT EXISTS (
			SELECT 1
			FROM sys.database_principals
			WHERE name = 'db-deploy@kinne.solutions'
			)
	BEGIN
		/* tsqllint-disable invalid-syntax */
		CREATE USER [db-deploy@kinne.solutions]
		FOR EXTERNAL PROVIDER;
			/* tsqllint-enable invalid-syntax */
	END
END
GO

IF @@SERVERNAME = 'weatherserver9128'
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM sys.database_principals
			WHERE name = 'hows-the-weather@kinne.dev'
			)
	BEGIN
		/* tsqllint-disable invalid-syntax */
		CREATE USER [hows-the-weather@kinne.dev]
		FOR EXTERNAL PROVIDER
		WITH DEFAULT_SCHEMA = data;
			/* tsqllint-enable invalid-syntax */
	END

	IF NOT EXISTS (
			SELECT 1
			FROM sys.database_principals
			WHERE name = 'db-deploy@kinne.dev'
			)
	BEGIN
		/* tsqllint-disable invalid-syntax */
		CREATE USER [db-deploy@kinne.dev]
		FOR EXTERNAL PROVIDER;
			/* tsqllint-enable invalid-syntax */
	END
END
