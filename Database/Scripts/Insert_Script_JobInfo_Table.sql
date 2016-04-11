
If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_IndexReturns')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_IndexReturns', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_BNYCFReport')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_BNYCFReport', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_BNYHoldings')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_BNYHoldings', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_MasterETFData')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_MasterETFData', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_FactSetEqBenchmarks')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_FactSetEqBenchmarks', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_FactSetFIBenchmarks')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_FactSetFIBenchmarks', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_FactSetUSFICoverage')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_FactSetUSFICoverage', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_FactSetIntlFICoverage')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_FactSetIntlFICoverage', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_BroadRidgeTrade')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_BroadRidgeTrade', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_EuroDollarSwapCurve')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_EuroDollarSwapCurve', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_SwapCurve')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_SwapCurve', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_EqSurface')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_EqSurface', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_IRSurface')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_IRSurface', 'Daily', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_FX')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_FX', 'Daily', CAST('01/01/2010' AS DATE))           
GO

-----------------------------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_BNYMonthly')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_BNYMonthly', 'Monthly', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_TenorHoldings')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_TenorHoldings', 'Monthly', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_TenorTnc')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_TenorTnc', 'Monthly', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_StoneMiliner')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_StoneMiliner', 'Monthly', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_MarshallWace')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_MarshallWace', 'Monthly', CAST('01/01/2010' AS DATE))           
GO

------------------------------------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_AssetType')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_AssetType', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_Country')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_Country', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_Sector')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_Sector', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_LFI')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_LFI', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_PortfolioMaster')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_PortfolioMaster', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_PotentialManagers')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_PotentialManagers', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_AssetAllocation')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_AssetAllocation', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_Composites')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_Composites', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_CompositeAsset')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_CompositeAsset', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_Futures')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_Futures', 'As Needed', CAST('01/01/2010' AS DATE))           
GO

If not exists (select 1 from stg.JobInfo  where  JobName = 'LoadDataWarehouse_Ratings')
	INSERT INTO [stg].[JobInfo] ([JobName],[JobFrequency],[FileStartDate]) 
	VALUES ('LoadDataWarehouse_Ratings', 'As Needed', CAST('01/01/2010' AS DATE))           
GO
-----------------------------------------------------------------------------------------------------------------------------
