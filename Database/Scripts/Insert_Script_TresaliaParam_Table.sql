-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'AssetTypeStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'AssetTypeStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'AssetTypeJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'AssetTypeJobName', 'LoadDataWarehouse_AssetType')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'BNYCFReportStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'BNYCFReportStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'BNYCFReportJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'BNYCFReportJobName', 'LoadDataWarehouse_BNYCFReport')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'BNYMonthlyStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'BNYMonthlyStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'BNYMonthlyJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'BNYMonthlyJobName', 'LoadDataWarehouse_BNYMonthly')
go

-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CompositesStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CompositesStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CompositesJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CompositesJobName', 'LoadDataWarehouse_Composites')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CountryStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CountryStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CountryJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CountryJobName', 'LoadDataWarehouse_Country')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetEqBenchmarksStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetEqBenchmarksStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetEqBenchmarksJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetEqBenchmarksJobName', 'LoadDataWarehouse_FactSetEqBenchmarks')
go
------------------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetFIBenchmarksStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetFIBenchmarksStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetFIBenchmarksJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetFIBenchmarksJobName', 'LoadDataWarehouse_FactSetFIBenchmarks')
go
------------------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetIntlFICoverageStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetIntlFICoverageStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetIntlFICoverageJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetIntlFICoverageJobName', 'LoadDataWarehouse_FactSetIntlFICoverage')
go
------------------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetUSFICoverageStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetUSFICoverageStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FactSetUSFICoverageJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FactSetUSFICoverageJobName', 'LoadDataWarehouse_FactSetUSFICoverage')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FXStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FXStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FXJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FXJobName', 'LoadDataWarehouse_FX')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'LFIStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'LFIStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'LFIJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'LFIJobName', 'LoadDataWarehouse_LFI')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'MarshallWaceStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'MarshallWaceStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'MarshallWaceJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'MarshallWaceJobName', 'LoadDataWarehouse_MarshallWace')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'MgrTNCRMStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'MgrTNCRMStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'MgrTNCRMJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'MgrTNCRMJobName', 'LoadDataWarehouse_MgrTNCRM')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'PortfolioMasterStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'PortfolioMasterStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'PortfolioMasterJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'PortfolioMasterJobName', 'LoadDataWarehouse_PortfolioMaster')
go

-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'RatingsStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'RatingsStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'RatingsJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'RatingsJobName', 'LoadDataWarehouse_Ratings')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'SectorStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'SectorStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'SectorJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'SectorJobName', 'LoadDataWarehouse_Sector')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'TenorHoldingsStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'TenorHoldingsStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'TenorHoldingsJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'TenorHoldingsJobName', 'LoadDataWarehouse_TenorHoldings')
go

-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'TenorTncStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'TenorTncStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'TenorTncJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'TenorTncJobName', 'LoadDataWarehouse_TenorTnc')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CountryStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CountryStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CountryJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CountryJobName', 'LoadDataWarehouse_Country')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'IndexReturnsStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'IndexReturnsStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'IndexReturnsJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'IndexReturnsJobName', 'LoadDataWarehouse_IndexReturns')
go

-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'PotentialManagersStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'PotentialManagersStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'PotentialManagersJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'PotentialManagersJobName', 'LoadDataWarehouse_PotentialManagers')
go
-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'EqBenchmarksStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'EqBenchmarksStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'EqBenchmarksJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'EqBenchmarksJobName', 'LoadDataWarehouse_EqBenchmarks')
go
-----------------------------------------------------------------------------------------------------------------
If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FIBenchmarksStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FIBenchmarksStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'FIBenchmarksJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'FIBenchmarksJobName', 'LoadDataWarehouse_FIBenchmarks')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'StoneMilinerStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'StoneMilinerStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'StoneMilinerJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'StoneMilinerJobName', 'LoadDataWarehouse_StoneMiliner')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'AssetAllocationStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'AssetAllocationStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'AssetAllocationJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'AssetAllocationJobName', 'LoadDataWarehouse_AssetAllocation')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'EuroDollarSwapCurveStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'EuroDollarSwapCurveStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'EuroDollarSwapCurveJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'EuroDollarSwapCurveJobName', 'LoadDataWarehouse_EuroDollarSwapCurve')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'IRSurfaceStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'IRSurfaceStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'IRSurfaceJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'IRSurfaceJobName', 'LoadDataWarehouse_IRSurface')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'MasterETFDataStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'MasterETFDataStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'MasterETFDataJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'MasterETFDataJobName', 'LoadDataWarehouse_MasterETFData')
go
-----------------------------------------------------------------------------------------------------------------


If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'EqSurfaceStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'EqSurfaceStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'EqSurfaceJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'EqSurfaceJobName', 'LoadDataWarehouse_EqSurface')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'SwapCurveStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'SwapCurveStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'SwapCurveJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'SwapCurveJobName', 'LoadDataWarehouse_SwapCurve')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'BroadRidgeTradeStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'BroadRidgeTradeStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'BroadRidgeTradeJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'BroadRidgeTradeJobName', 'LoadDataWarehouse_BroadRidgeTrade')
go
-----------------------------------------------------------------------------------------------------------------

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CompositeAssetStartDate')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CompositeAssetStartDate', '01/31/2012')
go

If not exists (select 1 from stg.TresaliaParams  where  ParamKey = 'CompositeAssetJobName')
   INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
	VALUES('Config', 'CompositeAssetJobName', 'LoadDataWarehouse_CompositeAsset')
go
-----------------------------------------------------------------------------------------------------------------