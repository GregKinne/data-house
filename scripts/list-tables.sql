USE [WEATHER];

SELECT OBJECT_NAME(object_id) AS [name],
	SCHEMA_NAME(schema_id) AS [schema]
FROM sys.tables;
