IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='Dw')
BEGIN
	EXEC ('CREATE SCHEMA [dw] AUTHORIZATION [DBO]');
END
GO