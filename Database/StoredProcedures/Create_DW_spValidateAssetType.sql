/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidatePortfolioMaster]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateAssetType]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateAssetType]
Go

/****** Object:  StoredProcedure [stg].[spValidateAssetType]    Script Date: 04/04/2016 11:00:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [stg].[spValidateAssetType]
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

	DECLARE @AssetType TABLE(
	[FileName] varchar(100) NOT NULL,	
	[TabName] varchar(100) NOT NULL,
	[FileDate] varchar(100) NOT NULL,
	[PRODUCT TYPE] varchar(100) NULL,
	[DESCRIPTION] varchar(100) NULL,
	[Description2] varchar(100) NULL,
	[Level_1] varchar(100) NULL,
	[Level_2] varchar(100) NULL,
	[Level_3] varchar(100) NULL,
	[Level_4] varchar(100) NULL,
	[Level_5] varchar(100) NULL,
	[CreatedDate] datetime NOT NULL,
	[CreatedBy] varchar(50) NOT NULL,
	[BatchDate] date NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @AssetType 
	
	SELECT *, @errorDetail AS Error FROM [Stg].[AssetType] ACT WITH (NOLOCK)
	--UNION ALL
	--SELECT * FROM Stg.ErrorAssetType EAT WITH (NOLOCK) WHERE ART.IsRecordModified = 'Yes'
	
	
	UPDATE @AssetType 
	SET Error =  Error +
	  CASE WHEN ([PRODUCT TYPE] IS NULL) OR RTRIM(LTRIM([PRODUCT TYPE])) = SPACE(0) OR (([PRODUCT TYPE] IS NOT NULL) AND LEN(RTRIM(LTRIM([PRODUCT TYPE]))) > 50) THEN 'The Product Type value ''' + ISNULL([PRODUCT TYPE], '') + ''' is invalid.' else '' end
	+ CASE WHEN (([DESCRIPTION] IS NOT NULL) AND LEN(RTRIM(LTRIM([DESCRIPTION]))) > 50) then ' The Descriptione value ''' + ISNULL([DESCRIPTION], '') + ''' is invalid.' else '' end
	+ CASE WHEN (([Description2] IS NOT NULL) AND LEN(RTRIM(LTRIM(Description2))) > 50) then ' The Asset Type Description value ''' + ISNULL(Description2, '') + ''' is invalid.' else '' end
	+ CASE WHEN (([Level_1] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_1))) > 50) then ' The Level 1 value ''' + ISNULL(Level_1, '') + ''' is invalid.' else '' end
	+ CASE WHEN (([Level_2] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_2))) > 50) then ' The Level 2 value ''' + ISNULL(Level_2, '') + ''' is invalid.' else '' end
	+ CASE WHEN (([Level_3] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_3))) > 50) then ' The Level 3 value ''' + ISNULL(Level_3, '') + ''' is invalid.' else '' end
	+ CASE WHEN (([Level_4] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_4))) > 50) then ' The Level 4 value ''' + ISNULL(Level_4, '') + ''' is invalid.' else '' end
	+ CASE WHEN (([Level_5] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_5))) > 50) then ' The Level 5 value ''' + ISNULL(Level_5, '') + ''' is invalid.' else '' end
	
	WHERE ([PRODUCT TYPE] IS NULL) OR RTRIM(LTRIM([PRODUCT TYPE])) = SPACE(0) OR (([PRODUCT TYPE] IS NOT NULL) AND LEN(RTRIM(LTRIM([PRODUCT TYPE]))) > 50)
	OR (([DESCRIPTION] IS NOT NULL) AND LEN(RTRIM(LTRIM([DESCRIPTION]))) > 50)
	OR (([Description2] IS NOT NULL) AND LEN(RTRIM(LTRIM(Description2))) > 50)
	OR (([Level_1] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_1))) > 50)
	OR (([Level_2] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_2))) > 50)
	OR (([Level_3] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_3))) > 50)
	OR (([Level_4] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_4))) > 50)
	OR (([Level_5] IS NOT NULL) AND LEN(RTRIM(LTRIM(Level_5))) > 50)

	

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [PRODUCT TYPE] ORDER BY CreatedDate DESC)
			As RowNumber,* FROM @AssetType
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorAssetType WITH (ROWLOCK)
	([FileName], TabName, [PRODUCT TYPE], [DESCRIPTION], Description2, 
		Level_1, Level_2, Level_3, Level_4, Level_5, ErrorDescription, CreatedDate, CreatedBy, BatchDate)
	SELECT  [FileName], TabName, [PRODUCT TYPE], [DESCRIPTION], Description2, 
		Level_1, Level_2, Level_3, Level_4, Level_5, Error, CreatedDate, CreatedBy, BatchDate
	FROM @AssetType 
	WHERE Error <> ''

	SELECT * FROM @AssetType WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


