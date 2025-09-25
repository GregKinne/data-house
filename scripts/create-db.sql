IF NOT EXISTS (
		SELECT name
		FROM sys.databases
		WHERE name = 'weather'
		)
BEGIN
	CREATE DATABASE weather;
END;
GO


