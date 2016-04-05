/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateCompositeAsset]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateCompositeAsset]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateCompositeAsset]
Go
/****** Object:  StoredProcedure [stg].[spValidateCompositeAsset]    Script Date: 04/04/2016 10:55:07 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


create PROCEDURE [stg].[spValidateCompositeAsset]
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

	DECLARE @CompositeAsset TABLE(
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](100) NOT NULL,
	[TabName] [varchar](100) NOT NULL,
	[Composite_Asset_ID] [varchar](100) NULL,
	[Security_ID] [varchar](100) NULL,
	[Portfolio_ID] [varchar](100) NULL,	
	[Composite_ID] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BatchDate] [date] NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @CompositeAsset SELECT *, @errorDetail AS Error FROM [Stg].[CompositeAsset] ACT WITH (NOLOCK)
	
	UPDATE @CompositeAsset 
	SET Error =  Error +
	  CASE WHEN ([Composite_Asset_ID] IS NULL) OR RTRIM(LTRIM([Composite_Asset_ID])) = SPACE(0) OR LEN(RTRIM(LTRIM([Composite_Asset_ID]))) > 50 THEN 'The Composite Asset ID value ''' + ISNULL([Composite_Asset_ID], '') + ''' is invalid.' else '' end
	+ CASE WHEN LEN(RTRIM(LTRIM([Security_ID]))) > 50 then ' The Security_ID value ''' + ISNULL([Security_ID], '') + ''' is invalid.' else '' end
	+ CASE WHEN LEN(RTRIM(LTRIM(Portfolio_ID))) > 50 then ' The Portfolio_ID value ''' + ISNULL(Portfolio_ID, '') + ''' is invalid.' else '' end
	+ CASE WHEN LEN(RTRIM(LTRIM(Composite_ID))) > 50 then ' The Composite_ID value ''' + ISNULL(Composite_ID, '') + ''' is invalid.' else '' end
	
	
	WHERE [Composite_Asset_ID] IS NULL OR rtrim(ltrim([Composite_Asset_ID])) = SPACE(0) OR LEN(RTRIM(LTRIM([Composite_Asset_ID]))) > 50
	OR LEN(RTRIM(LTRIM([Security_ID]))) > 50
	OR LEN(RTRIM(LTRIM(Portfolio_ID))) > 50	
	OR LEN(RTRIM(LTRIM(Composite_ID))) > 50
	

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [Composite_Asset_ID],[Security_ID],Portfolio_ID,Composite_ID ORDER BY [Composite_Asset_ID])
			As RowNumber,* FROM @CompositeAsset
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorCompositeAsset WITH (ROWLOCK)
	([FileName], FilePath, TabName,[Composite_Asset_ID],[Security_ID],[Portfolio_ID],
	[Composite_ID], ErrorDescription, CreatedDate, CreatedBy, BatchDate)
	SELECT  [FileName], FilePath, TabName,[Composite_Asset_ID],[Security_ID],[Portfolio_ID],
	[Composite_ID], Error, GETDATE(), @User_ID, @BatchDate
	FROM @CompositeAsset 
	WHERE Error <> ''

	SELECT * FROM @CompositeAsset  WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


