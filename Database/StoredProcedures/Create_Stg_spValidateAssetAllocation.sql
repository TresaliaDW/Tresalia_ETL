/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidateAssetAllocation]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spValidateAssetAllocation]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spValidateAssetAllocation]
Go

/****** Object:  StoredProcedure [stg].[spValidateAssetAllocation]    Script Date: 04/04/2016 10:51:44 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [stg].[spValidateAssetAllocation]
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

	DECLARE @AssetAllocation TABLE(
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](100) NOT NULL,
	[TabName] [varchar](100) NOT NULL,
	[Valuation_Date] [varchar](100) NULL,
	[Period_Date] [varchar](100) NULL,
	[Parent_Client_ID] [varchar](100) NULL,
	[Bench_ID] [varchar](100) NULL,
	[Level 1] [varchar](100) NULL,
	[Level 2] [varchar](100) NULL,
	[Level 3] [varchar](100) NULL,
	[Level 4] [varchar](100) NULL,
	[Level 5] [varchar](100) NULL,
	[Wgt] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BatchDate] [date] NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @AssetAllocation SELECT *, @errorDetail AS Error FROM [Stg].[AssetAllocation] ACT WITH (NOLOCK)
	
	UPDATE @AssetAllocation 
	SET Error =  Error +
	  CASE WHEN ([Valuation_Date] IS NULL) OR RTRIM(LTRIM([Valuation_Date])) = SPACE(0) OR LEN(RTRIM(LTRIM([Valuation_Date]))) > 50 OR TRY_CONVERT(datetime, [Valuation_Date] , 101) IS NULL THEN 'The Valuation Date value ''' + ISNULL([Valuation_Date], '') + ''' is invalid.' else '' end
	+ CASE WHEN LEN(RTRIM(LTRIM([Period_Date]))) > 50 OR TRY_CONVERT(datetime, [Valuation_Date] , 101) IS NULL then ' The Period_Date value ''' + ISNULL([Period_Date], '') + ''' is invalid.' else '' end
	+ CASE WHEN LEN(RTRIM(LTRIM(Parent_Client_ID))) > 50 then ' The Parent_Client_ID value ''' + ISNULL(Parent_Client_ID, '') + ''' is invalid.' else '' end
	+ CASE WHEN TRY_CONVERT(bigint, [Bench_ID]) IS NULL then ' The Bench_ID value ''' + ISNULL(Bench_ID, '') + ''' is invalid.' else '' end
	+ CASE WHEN TRY_CONVERT(int, [Level 5]) IS NULL then ' The Level 5 value ''' + ISNULL([Level 5], '') + ''' is invalid.' else '' end
	+ CASE WHEN TRY_CONVERT(int, [Wgt]) IS NULL then ' The Wgt value ''' + ISNULL([Wgt], '') + ''' is invalid.' else '' end
	
	WHERE [Valuation_Date] IS NULL OR rtrim(ltrim([Valuation_Date])) = SPACE(0) OR LEN(RTRIM(LTRIM([Valuation_Date]))) > 50 OR TRY_CONVERT(datetime, [Valuation_Date] , 101) IS NULL
	OR LEN(RTRIM(LTRIM([Period_Date]))) > 50 OR TRY_CONVERT(datetime, [Valuation_Date] , 101) IS NULL
	OR LEN(RTRIM(LTRIM(Parent_Client_ID))) > 50	
	OR TRY_CONVERT(bigint, [Bench_ID]) IS NULL
	OR TRY_CONVERT(int, [Level 5]) IS NULL
	OR TRY_CONVERT(int, [Wgt]) IS NULL
	

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [Valuation_Date],[Period_Date],Parent_Client_ID,Bench_ID,
	   [Level 1],[Level 2],[Level 3],[Level 4],[Level 5],Wgt ORDER BY [Valuation_Date])
			As RowNumber,* FROM @AssetAllocation
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorAssetAllocation WITH (ROWLOCK)
	([FileName], FilePath, TabName,[Valuation_Date],[Period_Date],Parent_Client_ID,Bench_ID,
	   [Level 1],[Level 2],[Level 3],[Level 4],[Level 5],Wgt, ErrorDescription, CreatedDate, CreatedBy, BatchDate)
	SELECT  [FileName], FilePath, TabName,[Valuation_Date],[Period_Date],Parent_Client_ID,Bench_ID,
	   [Level 1],[Level 2],[Level 3],[Level 4],[Level 5],Wgt, Error, GETDATE(), @User_ID, @BatchDate
	FROM @AssetAllocation 
	WHERE Error <> ''

	SELECT * FROM @AssetAllocation  WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END



GO


