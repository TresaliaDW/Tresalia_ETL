IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='stg')
BEGIN
	EXEC ('CREATE SCHEMA [stg] AUTHORIZATION [DBO]');
END
GO