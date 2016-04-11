/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    04/Apr/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spValidatePortfolioMaster]    Script Date: 03/21/2016 12:52:40 ******/
If  EXISTS (Select * From sys.objects WHERE object_id = Object_Id(N'[stg].[spValidatePortfolioMaster]') And Type In (N'P', N'PC'))
Drop Procedure [stg].[spValidatePortfolioMaster]
Go

/****** Object:  StoredProcedure [stg].[spValidatePortfolioMaster]    Script Date: 4/4/2016 12:59:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [stg].[spValidatePortfolioMaster]
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

	DECLARE @PortfolioMaster TABLE(
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](100) NOT NULL,
	[TabName] [varchar](100) NOT NULL,
	[ACCOUNT_ID] [varchar](100) NULL,
	[ACCOUNT_NAME] [varchar](100) NULL,
	[ACCOUNT_NAME_Long] [varchar](100) NULL,
	[LEVEL_1] [varchar](100) NULL,
	[LEVEL_2] [varchar](100) NULL,
	[LEVEL_3] [varchar](100) NULL,
	[LEVEL_4] [varchar](100) NULL,
	[LEVEL_5] [varchar](100) NULL,
	[Bench_ID] [varchar](100) NULL,
	[FEE_1_PROXY] [varchar](100) NULL,
	[FEE_1_AUM] [varchar](100) NULL,
	[FEE_2_PROXY] [varchar](100) NULL,
	[FEE_2_AUM] [varchar](100) NULL,
	[FEE_3_PROXY] [varchar](100) NULL,
	[FEE_3_AUM] [varchar](100) NULL,
	[FEE_PAID_DIRECT] [varchar](100) NULL,
	[HURDLE_RATE] [varchar](100) NULL,
	[Account_Type] [varchar](100) NULL,
	[Mask 1] [varchar](100) NULL,
	[Mask 2] [varchar](100) NULL,
	[Mask 3] [varchar](100) NULL,
	[Mask 4] [varchar](100) NULL,
	[Asset_Manager] [varchar](100) NULL,
	[Pooled] [varchar](100) NULL,
	[Acct_Inception_Date] [varchar](100) NULL,
	[Strat_Inception_Date] [varchar](100) NULL,
	[Calc_Pref] [varchar](100) NULL,
	[Entity_Type] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BatchDate] [date] NOT NULL,
	[Error] Varchar(max))
	
	INSERT INTO @PortfolioMaster SELECT *, @errorDetail AS Error FROM [Stg].[PortfolioMaster] PRT WITH (NOLOCK)
	
	UPDATE @PortfolioMaster 
	SET Error =  Error +
	  CASE WHEN ([ACCOUNT_ID] IS NULL) OR RTRIM(LTRIM([ACCOUNT_ID])) = SPACE(0) OR LEN(RTRIM(LTRIM([ACCOUNT_ID]))) > 50 THEN 'The Account Id value ''' + ISNULL([ACCOUNT_ID], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([ACCOUNT_Name] IS NULL) OR RTRIM(LTRIM([ACCOUNT_Name])) = SPACE(0) THEN 'The Account Name value ''' + ISNULL([ACCOUNT_Name], '') + ''' is invalid.' else '' end
	--+ CASE WHEN ([Bench_ID] IS NULL) OR RTRIM(LTRIM([Bench_ID])) = SPACE(0) OR TRY_CONVERT(bigint, [Bench_ID]) IS NULL THEN 'The Benchmark Id value ''' + ISNULL([ACCOUNT_ID], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Hurdle_Rate] IS NOT NULL OR rtrim(ltrim(Hurdle_Rate)) != space(0)) AND TRY_CONVERT(int, [Hurdle_Rate]) IS NULL THEN 'The Hurdle Rate value ''' + ISNULL([Hurdle_Rate], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Pooled] IS NOT NULL OR rtrim(ltrim(Pooled)) != space(0)) AND TRY_CONVERT(int, [Pooled]) IS NULL THEN 'The Pooled value ''' + ISNULL([Pooled], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Acct_Inception_Date] IS NOT NULL OR rtrim(ltrim([Acct_Inception_Date])) != space(0)) AND TRY_CONVERT(datetime, [Acct_Inception_Date]) IS NULL THEN 'The Account Inception date value ''' + ISNULL([Acct_Inception_Date], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Strat_Inception_Date] IS NOT NULL OR rtrim(ltrim([Strat_Inception_Date])) != space(0)) AND TRY_CONVERT(datetime, [Strat_Inception_Date]) IS NULL THEN 'The strategy Inception date value ''' + ISNULL([Strat_Inception_Date], '') + ''' is invalid.' else '' end
	+ CASE WHEN ([Entity_Type] IS NOT NULL OR rtrim(ltrim([Entity_Type])) != space(0)) AND LEN(RTRIM(LTRIM([Entity_Type]))) > 50 then ' The Entity Type value ''' + ISNULL([Entity_Type], '') + ''' is invalid.' else '' end
	
	WHERE ([ACCOUNT_ID] IS NULL) OR RTRIM(LTRIM([ACCOUNT_ID])) = SPACE(0) OR LEN(RTRIM(LTRIM([ACCOUNT_ID]))) > 50
	OR ([ACCOUNT_Name] IS NULL) OR RTRIM(LTRIM([ACCOUNT_Name])) = SPACE(0)
	--OR ([Bench_ID] IS NULL) OR RTRIM(LTRIM([Bench_ID])) = SPACE(0) OR TRY_CONVERT(bigint, [Bench_ID]) IS NULL
	OR TRY_CONVERT(int, [Hurdle_Rate]) IS NULL
	OR TRY_CONVERT(int, [Pooled]) IS NULL
	OR TRY_CONVERT(datetime, [Acct_Inception_Date]) IS NULL
	OR TRY_CONVERT(datetime, [Strat_Inception_Date]) IS NULL 
	OR LEN(RTRIM(LTRIM([Entity_Type]))) > 50

	;WITH tblTemp AS
	(
	   SELECT ROW_NUMBER() Over(PARTITION BY [ACCOUNT_ID], [ACCOUNT_NAME], [ACCOUNT_NAME_Long], [LEVEL_1], [LEVEL_2], [LEVEL_3], [LEVEL_4], [LEVEL_5], [Bench_ID], [FEE_1_PROXY], [FEE_1_AUM], [FEE_2_PROXY], [FEE_2_AUM], [FEE_3_PROXY], [FEE_3_AUM], [FEE_PAID_DIRECT], [HURDLE_RATE], [Account_Type], [Mask 1], [Mask 2], [Mask 3], [Mask 4], [Asset_Manager], [Pooled], [Acct_Inception_Date], [Strat_Inception_Date], [Calc_Pref], [Entity_Type] ORDER BY [ACCOUNT_ID])
			As RowNumber,* FROM @PortfolioMaster
	)
	UPDATE tblTemp SET Error = Error + ' Duplicate Record.' WHERE RowNumber > 1	

	INSERT INTO [stg].ErrorPortfolioMaster WITH (ROWLOCK)
	(	
		[FileName], FilePath, TabName,
		[ACCOUNT_ID], [ACCOUNT_NAME], [ACCOUNT_NAME_Long], [LEVEL_1], [LEVEL_2], [LEVEL_3], [LEVEL_4], [LEVEL_5], [Bench_ID], [FEE_1_PROXY], [FEE_1_AUM], [FEE_2_PROXY], [FEE_2_AUM], 
		[FEE_3_PROXY], [FEE_3_AUM], [FEE_PAID_DIRECT], [HURDLE_RATE], [Account_Type], [Mask 1], [Mask 2], [Mask 3], [Mask 4], [Asset_Manager], [Pooled], [Acct_Inception_Date], 
		[Strat_Inception_Date], [Calc_Pref], [Entity_Type],
		ErrorDescription, CreatedDate, CreatedBy, BatchDate)
	SELECT [FileName], FilePath, TabName,
			[ACCOUNT_ID], [ACCOUNT_NAME], [ACCOUNT_NAME_Long], [LEVEL_1], [LEVEL_2], [LEVEL_3], [LEVEL_4], [LEVEL_5], [Bench_ID], [FEE_1_PROXY], [FEE_1_AUM], [FEE_2_PROXY], [FEE_2_AUM], 
			[FEE_3_PROXY], [FEE_3_AUM], [FEE_PAID_DIRECT], [HURDLE_RATE], [Account_Type], [Mask 1], [Mask 2], [Mask 3], [Mask 4], [Asset_Manager], [Pooled], [Acct_Inception_Date], 
			[Strat_Inception_Date], [Calc_Pref], [Entity_Type],
			Error, GETDATE(), @User_ID, @BatchDate
	FROM @PortfolioMaster 
	WHERE Error <> ''

	SELECT PM.*, AC.Account_ID  AS AccountIdFK FROM @PortfolioMaster PM LEFT JOIN dw.Account AC ON PM.Bench_ID = AC.Account_Code
	WHERE Error = '' ORDER BY CreatedDate ASC

END TRY

BEGIN CATCH
	
END CATCH

END


