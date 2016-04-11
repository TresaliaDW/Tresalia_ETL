/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateSwapCurve]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateSwapCurve]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateSwapCurve]
Go
/****** Object:  StoredProcedure [stg].[spValidateSwapCurve]    Script Date: 04/04/2016 10:55:07 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


create PROCEDURE [stg].[spValidateSwapCurve]
(
	@BatchDate Datetime
)
AS

BEGIN 

BEGIN TRY
	SET NOCOUNT ON;

	DECLARE @errorDetail NVARCHAR(max) = ''
	DECLARE @User_ID VARCHAR(50) = System_User

	DECLARE @SwapCurve TABLE(
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](100) NOT NULL,
	[TabName] [varchar](100) NOT NULL,
	[Tenor] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
	[Security_ID] [varchar](100) NULL,
	[Date] [varchar](100) NULL,
	[Value] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BatchDate] [date] NOT NULL,
	[Error] VARCHAR(MAX))
	
	INSERT INTO @SwapCurve SELECT *, @errorDetail AS Error FROM [Stg].[SwapCurve] ACT WITH (NOLOCK)
	
	UPDATE @SwapCurve 
	SET Error =  Error +
	  CASE WHEN (([Name] IS NOT NULL AND RTRIM(LTRIM([Name])) != space(0)) AND (LEN(RTRIM(LTRIM([Name]))) > 50 OR [Name] = '#NAME?')) THEN 'The Name value ''' + ISNULL([Name], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Tenor] IS NOT NULL AND RTRIM(LTRIM([Tenor])) != space(0)) AND LEN(RTRIM(LTRIM([Tenor]))) > 10  THEN 'The Tenor value ''' + ISNULL([Name], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Value] IS NOT NULL AND RTRIM(LTRIM([Value])) != SPACE(0) AND TRY_CONVERT(decimal(22,6), [Value]) IS NULL) THEN 'The value ''' + ISNULL([Value], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Date] IS NOT NULL AND RTRIM(LTRIM([Date])) != space(0)) AND TRY_CONVERT(datetime, [Date], 105) IS NULL THEN 'The Valuation Date value ''' + ISNULL([Date], '') + ''' is invalid.' else '' end
	
	WHERE (([Name] IS NOT NULL AND RTRIM(LTRIM([Name])) != space(0)) AND (LEN(RTRIM(LTRIM([Name]))) > 50 OR [Name] = '#NAME?'))
	OR ([Tenor] IS NOT NULL AND RTRIM(LTRIM([Tenor])) != SPACE(0) AND LEN(RTRIM(LTRIM([Tenor]))) > 10)
	OR ([Value] IS NOT NULL AND RTRIM(LTRIM([Value])) != SPACE(0) AND TRY_CONVERT(decimal(22,6), [Value]) IS NULL)
	OR ([Date] IS NOT NULL AND RTRIM(LTRIM([Date])) != SPACE(0) AND TRY_CONVERT(datetime, [Date], 105) IS NULL)

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [security_Id], [Date], [CreatedDate]  ORDER BY [CreatedDate] DESC)
			As RowNumber,* FROM @SwapCurve
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorSwapCurve WITH (ROWLOCK)
	(
		[FileName], [FilePath], [TabName], [Tenor], [Name], [Security_Id], [Date], [Value], [CreatedDate], [CreatedBy], [BatchDate], [ErrorDescription] 
	)
	SELECT  [FileName], FilePath, TabName, [Tenor], [Name], [Security_Id], [Date], [Value], GETDATE(), @User_ID, @BatchDate, Error
	FROM @SwapCurve 
	WHERE Error <> ''

	SELECT * FROM @SwapCurve  WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


