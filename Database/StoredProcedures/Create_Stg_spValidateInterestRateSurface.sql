/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateInterestRateSurface]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateInterestRateSurface]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateInterestRateSurface]
Go
/****** Object:  StoredProcedure [stg].[spValidateInterestRateSurface]    Script Date: 04/04/2016 10:55:07 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


create PROCEDURE [stg].[spValidateInterestRateSurface]
(
	@BatchDate Datetime
)
AS

BEGIN 

BEGIN TRY
	SET NOCOUNT ON;

	DECLARE @errorDetail NVARCHAR(max) = ''
	DECLARE @User_ID VARCHAR(50) = System_User
	DECLARE @Update_Timestamp datetime =  GETDATE()

	DECLARE @InterestRateSurface TABLE(
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](100) NOT NULL,
	[TabName] [varchar](100) NOT NULL,
	[BBID] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
	[Date] [varchar](100) NULL,
	[Expiry] [varchar](100) NULL,
	[Tenor] [varchar](100) NULL,
	[Surface] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BatchDate] [date] NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @InterestRateSurface SELECT *, @errorDetail AS Error FROM [Stg].[IRSurface] ACT WITH (NOLOCK)
	
	UPDATE @InterestRateSurface 
	SET Error =  Error +
	  CASE WHEN LEN(RTRIM(LTRIM([Expiry]))) > 10 THEN 'The Expiry value ''' + ISNULL([Expiry], '') + ''' is invalid.' else '' end
	+ CASE WHEN LEN(RTRIM(LTRIM([Tenor]))) > 10 THEN 'The Tenor value ''' + ISNULL([Tenor], '') + ''' is invalid.' else '' end
	+ CASE WHEN TRY_CONVERT(decimal(22,6), [Surface]) IS NULL THEN 'The Surface value ''' + ISNULL([Surface], '') + ''' is invalid.' else '' end
	+ CASE WHEN TRY_CONVERT(datetime, [Date]) IS NULL THEN 'The Date value ''' + ISNULL([Date], '') + ''' is invalid.' else '' end
	
	WHERE LEN(RTRIM(LTRIM([Expiry]))) > 10
	OR LEN(RTRIM(LTRIM([Tenor]))) > 10
	OR TRY_CONVERT(decimal(22,6), [Surface]) IS NULL
	OR TRY_CONVERT(datetime, [Date]) IS NULL
	

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [BBID],[Name], [Date], [Expiry], [Tenor], [Surface]  ORDER BY [BBID])
			As RowNumber,* FROM @InterestRateSurface
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorIRSurface WITH (ROWLOCK)
	(
		[FileName], [FilePath], [TabName], [BBID], [Name], [Date], [Expiry], [Tenor], [Surface], [CreatedDate], [CreatedBy], [BatchDate], [ErrorDescription] 
	)
	SELECT  [FileName], FilePath, TabName, [BBID], [Name], [Date], [Expiry], [Tenor], [Surface], GETDATE(), @User_ID, @BatchDate, Error
	FROM @InterestRateSurface 
	WHERE Error <> ''

	SELECT * FROM @InterestRateSurface  WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


