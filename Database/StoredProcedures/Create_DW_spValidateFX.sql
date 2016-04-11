/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    04/08/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateFX]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateFX]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateFX]
Go

/****** Object:  StoredProcedure [stg].[spValidateFX]    Script Date: 07/04/2016 11:14:44 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [stg].[spValidateFX]
(
	@BatchDate Varchar(20) = NULL
)
AS

BEGIN 

BEGIN TRY
	SET NOCOUNT ON;

	DECLARE @errorDetail NVARCHAR(max) = ''
	DECLARE @User_ID VARCHAR(50) = System_User
	DECLARE @Update_Timestamp datetime =  GETDATE()

	DECLARE @FX TABLE(
	[FileName] varchar(100) NOT NULL,	
	[TabName] varchar(100) NOT NULL,	
	[FileDate] varchar(100) NULL,
	[FX CODE] varchar(100) NULL,
	[FX_NAME] varchar(100) NULL,
	[TGT_FX] varchar(100) NULL,
	[BASE_FX] varchar(100) NULL,	
	[Date] varchar(100) NULL,
	[Value] varchar(100) NULL,		
	[CreatedDate] datetime NOT NULL,
	[CreatedBy] varchar(50) NOT NULL,
	[BatchDate] date NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @FX SELECT *, @errorDetail AS Error FROM [Stg].[FX] ACT WITH (NOLOCK)
	
	
	UPDATE @FX 
	SET Error =  Error +
	  CASE WHEN ([TGT_FX] IS NULL) OR RTRIM(LTRIM([TGT_FX])) = SPACE(0) OR (([TGT_FX] IS NOT NULL) AND LEN(RTRIM(LTRIM([TGT_FX]))) > 10) THEN 'The [TGT_FX] value ''' + ISNULL([TGT_FX], '') + ''' is invalid.' else '' end	
	+ CASE WHEN ([Date] IS NULL) OR RTRIM(LTRIM([Date])) = SPACE(0) OR TRY_CONVERT(DATETIME, [Date]) IS NULL THEN 'The [Date] value ''' + ISNULL([Date], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([CreatedDate] IS NULL) OR RTRIM(LTRIM([CreatedDate])) = SPACE(0) OR TRY_CONVERT(DATETIME, CreatedDate) IS NULL THEN 'The [CreatedDate] value ''' + ISNULL([CreatedDate], '') + ''' is invalid.' else '' end
	--+ CASE WHEN ([Value] IS NULL) OR RTRIM(LTRIM([Value])) = SPACE(0) OR ISNUMERIC(Value) <> 1 THEN 'The [Value] value ''' + ISNULL([Value], '') + ''' is invalid.' else '' end
	
	WHERE ([TGT_FX] IS NULL) OR RTRIM(LTRIM([TGT_FX])) = SPACE(0) OR (([TGT_FX] IS NOT NULL) AND LEN(RTRIM(LTRIM([TGT_FX]))) > 10)
	OR ([Date] IS NULL) OR RTRIM(LTRIM([Date])) = SPACE(0) OR TRY_CONVERT(DATETIME, [Date]) IS NULL
	OR ([CreatedDate] IS NULL) OR RTRIM(LTRIM([CreatedDate])) = SPACE(0) OR TRY_CONVERT(DATETIME, CreatedDate) IS NULL
	--OR ([Value] IS NULL) OR RTRIM(LTRIM([Value])) = SPACE(0) OR ISNUMERIC(Value) <> 1 
		
	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [TGT_FX], [Date], [CreatedDate] ORDER BY [CreatedDate] DESC)
			As RowNumber,* FROM @FX
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate FX Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorFX WITH (ROWLOCK)
	([FileName]    
    ,[TabName]    
    ,[FileDate]
    ,[FX CODE]
    ,[FX_NAME]
    ,[TGT_FX]
    ,[BASE_FX]
    ,[Date]
    ,[Value]    
    ,[CreatedDate]
    ,[CreatedBy]
    ,[BatchDate]
	,[ErrorDescription]
	)
	SELECT  
	[FileName]    
    ,[TabName]    
    ,[FileDate]
    ,[FX CODE]
    ,[FX_NAME]
    ,[TGT_FX]
    ,[BASE_FX]
    ,[Date]
    ,[Value]    
    ,[CreatedDate]
    ,[CreatedBy]
    ,[BatchDate]
	, [Error]
	FROM @FX 
	WHERE Error <> ''

	SELECT 
	[FileName]    
    ,[TabName]    
    ,[FileDate]
    ,[FX CODE]
    ,[FX_NAME]
    ,[TGT_FX]
    ,[BASE_FX]
    ,CAST(CAST([Date] AS DATE) AS VARCHAR(100)) AS'Date'
    ,[Value]    
    ,CAST([CreatedDate] AS DATE) AS 'Upload_Date'
    ,[CreatedBy]
    ,[BatchDate]
	, [Error]
	FROM @FX WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


