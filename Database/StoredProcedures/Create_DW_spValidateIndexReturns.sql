/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    04/06/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateIndexReturns]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateIndexReturns]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateIndexReturns]
Go

/****** Object:  StoredProcedure [stg].[spValidateIndexReturns]    Script Date: 07/04/2016 11:14:44 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [stg].[spValidateIndexReturns]
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

	DECLARE @IndexReturns TABLE(
	[FileName] varchar(100) NOT NULL,	
	[TabName] varchar(100) NOT NULL,	
	[FileDate] varchar(100) NULL,
	[SYMBOL] varchar(100) NULL,
	[SHORTNAM] varchar(100) NULL,
	[GROUP] varchar(100) NULL,
	[CCY] varchar(100) NULL,
	[LONGNAME] varchar(100) NULL,
	[NUMFORMAT] varchar(100) NULL,
	[Date] varchar(100) NULL,
	[Value] varchar(100) NULL,		
	[CreatedDate] datetime NOT NULL,
	[CreatedBy] varchar(50) NOT NULL,
	[BatchDate] date NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @IndexReturns SELECT *, @errorDetail AS Error FROM [Stg].[IndexReturns] ACT WITH (NOLOCK)
	
	UPDATE @IndexReturns 
	SET Error =  Error +
	  CASE WHEN ([SYMBOL] IS NULL) OR RTRIM(LTRIM([SYMBOL])) = SPACE(0) OR (([SYMBOL] IS NOT NULL) AND LEN(RTRIM(LTRIM([SYMBOL]))) > 50) THEN 'The SYMBOL value ''' + ISNULL([SYMBOL], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([CCY] IS NULL) OR RTRIM(LTRIM([CCY])) = SPACE(0) OR (([CCY] IS NOT NULL) AND LEN(RTRIM(LTRIM([CCY]))) > 10) THEN 'The [CCY] value ''' + ISNULL([CCY], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([CreatedDate] IS NULL) OR RTRIM(LTRIM([CreatedDate])) = SPACE(0) OR TRY_CONVERT(DATETIME, CreatedDate) IS NULL THEN 'The [CreatedDate] value ''' + ISNULL([CreatedDate], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Date] IS NULL) OR RTRIM(LTRIM([Date])) = SPACE(0) OR TRY_CONVERT(DATETIME, Date) IS NULL THEN 'The [Date] value ''' + ISNULL([Date], '') + ''' is invalid.' else '' end
	----+ CASE WHEN RTRIM(LTRIM([Value])) = SPACE(0) OR TRY_CONVERT(NUMERIC(22,6), Value) IS NULL THEN 'The [Value] value ''' + ISNULL([Value], '') + ''' is invalid.' else '' end
	
	
	WHERE ([SYMBOL] IS NULL) OR RTRIM(LTRIM([SYMBOL])) = SPACE(0) OR (([SYMBOL] IS NOT NULL) AND LEN(RTRIM(LTRIM([SYMBOL]))) > 50)
	OR ([CCY] IS NULL) OR RTRIM(LTRIM([CCY])) = SPACE(0) OR (([CCY] IS NOT NULL) AND LEN(RTRIM(LTRIM([CCY]))) > 10)
	OR ([CreatedDate] IS NULL) OR RTRIM(LTRIM([CreatedDate])) = SPACE(0) OR TRY_CONVERT(DATETIME, CreatedDate) IS NULL
	OR ([Date] IS NULL) OR RTRIM(LTRIM([Date])) = SPACE(0) OR TRY_CONVERT(DATETIME, Date) IS NULL
	---OR RTRIM(LTRIM([Value])) = SPACE(0) OR TRY_CONVERT(NUMERIC(22,6), Value) IS NULL	

	
	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [SYMBOL],[CCY], [CreatedDate],[Date] ORDER BY [CreatedDate] DESC)
			As RowNumber,* FROM @IndexReturns
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate IndexReturns Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorIndexReturns WITH (ROWLOCK)
	(	
		[FileName],		
		[TabName],		
		[FileDate] ,
		[SYMBOL] ,
		[SHORTNAM] ,
		[GROUP] ,
		[CCY] ,
		[LONGNAME] ,
		[NUMFORMAT] ,
		[Date] ,
		[Value] ,		
		[CreatedDate],
		[CreatedBy],
		[BatchDate],
		[ErrorDescription]
	)
	SELECT  [FileName],		
		[TabName],		
		[FileDate] ,
		[SYMBOL] ,
		[SHORTNAM] ,
		[GROUP] ,
		[CCY] ,
		[LONGNAME] ,
		[NUMFORMAT] ,
		[Date] ,
		[Value] ,		
		[CreatedDate],
		[CreatedBy],
		[BatchDate],
		[Error]
	FROM @IndexReturns 
	WHERE Error <> ''

	SELECT  [FileName],		
		[TabName],		
		[FileDate] ,
		[SYMBOL] ,
		[SHORTNAM] ,
		[GROUP] ,
		[CCY] ,
		[LONGNAME] ,
		[NUMFORMAT] ,
		[Date],
		[Value] ,		
		CAST([CreatedDate] AS DATE) AS 'Upload_Date',
		[CreatedBy],
		[BatchDate],
		[Error]
	FROM @IndexReturns WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


