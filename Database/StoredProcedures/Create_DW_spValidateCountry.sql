/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    04/06/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateCountry]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateCountry]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateCountry]
Go

/****** Object:  StoredProcedure [stg].[spValidateCountry]    Script Date: 07/04/2016 11:14:44 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [stg].[spValidateCountry]
(
	@BatchDate Datetime = NULL
)
AS

BEGIN 

BEGIN TRY
	SET NOCOUNT ON;

	DECLARE @errorDetail NVARCHAR(max) = ''
	DECLARE @User_ID VARCHAR(50) = System_User
	DECLARE @Update_Timestamp datetime =  GETDATE()

	DECLARE @Country TABLE(
	[FileName] varchar(100) NOT NULL,	
	[TabName] varchar(100) NOT NULL,
	[FileDate] varchar(100) NOT NULL,
	[Country] varchar(100) NULL,
	[MSCI_COUNTRY_NAME] varchar(100) NULL,
	[MSCI_INDEX_ID] varchar(100) NULL,
	[FDS_COUNTRY_NAME] varchar(100) NULL,
	[ISO (#)] varchar(100) NULL,
	[ISO (2)] varchar(100) NULL,
	[ISO (3)] varchar(100) NULL,
	[ISO (FIPS)] varchar(100) NULL,
	[BaseDate] varchar(100) NULL,
	[BaseDate2] varchar(100) NULL,
	[BaseDate3] varchar(100) NULL,
	[Style] varchar(100) NULL,
	[Continent] varchar(100) NULL,	
	[Region] varchar(100) NULL,	
	[CurrencyCode] varchar(100) NULL,	
	[CurrencyName] varchar(100) NULL,	
	[CreatedDate] datetime NOT NULL,
	[CreatedBy] varchar(50) NOT NULL,
	[BatchDate] date NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @Country SELECT *, @errorDetail AS Error FROM [Stg].[Country] ACT WITH (NOLOCK)
	
	UPDATE @Country 
	SET Error =  Error +
	  CASE WHEN ([CurrencyCode] IS NULL) OR RTRIM(LTRIM([CurrencyCode])) = SPACE(0) OR LEN(RTRIM(LTRIM([CurrencyCode]))) > 10 THEN 'The CurrencyCode value ''' + ISNULL([CurrencyCode], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([ISO (3)] IS NULL) OR RTRIM(LTRIM([ISO (3)])) = SPACE(0) OR (([ISO (3)] IS NOT NULL) AND LEN(RTRIM(LTRIM([ISO (3)]))) > 3) OR TRY_CONVERT(char, [ISO (3)]) IS NULL THEN 'The [ISO (3)] value ''' + ISNULL([ISO (3)], '') + ''' is invalid.' else '' end
	+ CASE WHEN (([ISO (2)] IS NOT NULL) AND LEN(RTRIM(LTRIM([ISO (2)]))) > 2) OR TRY_CONVERT(char, [ISO (2)]) IS NULL THEN 'The [ISO (2)] value ''' + ISNULL([ISO (2)], '') + ''' is invalid.' else '' end
	+ CASE WHEN (([ISO (FIPS)] IS NOT NULL) AND LEN(RTRIM(LTRIM([ISO (FIPS)]))) > 10)  THEN 'The [ISO (FIPS)] value ''' + ISNULL([ISO (FIPS)], '') + ''' is invalid.' else '' end	
	+ CASE WHEN TRY_CONVERT(int, [ISO (#)]) IS NULL THEN 'The [ISO (#)] value ''' + ISNULL([ISO (#)], '') + ''' is invalid.' else '' end
	
	WHERE ([CurrencyCode] IS NULL) OR RTRIM(LTRIM([CurrencyCode])) = SPACE(0) OR LEN(RTRIM(LTRIM([CurrencyCode]))) > 10
	OR ([ISO (3)] IS NULL) OR RTRIM(LTRIM([ISO (3)])) = SPACE(0) OR (([ISO (3)] IS NOT NULL) AND LEN(RTRIM(LTRIM([ISO (3)]))) > 3) OR TRY_CONVERT(char, [ISO (3)]) IS NULL
	OR (([ISO (2)] IS NOT NULL) AND LEN(RTRIM(LTRIM([ISO (2)]))) > 2) OR TRY_CONVERT(char, [ISO (2)]) IS NULL
	OR (([ISO (FIPS)] IS NOT NULL) AND LEN(RTRIM(LTRIM([ISO (FIPS)]))) > 10) 
	OR TRY_CONVERT(int, [ISO (#)]) IS NULL

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [ISO (3)] ORDER BY [CreatedDate] DESC)
			As RowNumber,* FROM @Country
	)	
	UPDATE tblTemp SET Error = Error + ' Duplicate Country Record.' WHERE RowNumber > 1	

	

	INSERT INTO [stg].ErrorCountry WITH (ROWLOCK)
	([FileName], TabName, Country, MSCI_COUNTRY_NAME, [MSCI_INDEX_ID], [FDS_COUNTRY_NAME], [ISO (#)], 
		[ISO (2)], [ISO (3)], [ISO (FIPS)], [BaseDate], [BaseDate2], [BaseDate3], 
		[Style], [Continent], [Region], [CurrencyCode], [CurrencyName],
		ErrorDescription, CreatedDate, CreatedBy, BatchDate)
	SELECT  [FileName], TabName, Country, MSCI_COUNTRY_NAME, [MSCI_INDEX_ID], [FDS_COUNTRY_NAME], [ISO (#)], 
		[ISO (2)], [ISO (3)], [ISO (FIPS)], [BaseDate], [BaseDate2], [BaseDate3], 
		[Style], [Continent], [Region], [CurrencyCode], [CurrencyName],
		Error, [CreatedDate], CreatedBy, BatchDate
	FROM @Country 
	WHERE Error <> ''

	SELECT * FROM @Country WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


