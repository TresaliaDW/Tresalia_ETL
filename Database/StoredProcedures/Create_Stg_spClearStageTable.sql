---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spClearStageTable]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spClearStageTable]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spClearStageTable]
Go


/****** Object:  StoredProcedure [stg].[spClearStageTable]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spClearStageTable]
	@StageTableName Varchar(100)	
As
Begin
    Set Nocount On
		
	If UPPER(@StageTableName) = 'ASSETTYPE' 
	Begin
		TRUNCATE TABLE Stg.AssetType
	End

	If UPPER(@StageTableName) = 'BNYCFREPORT' 
	Begin
		TRUNCATE TABLE Stg.BNYCFReport
	End

	If UPPER(@StageTableName) = 'BNYHOLDINGS' 
	Begin
		TRUNCATE TABLE Stg.BNYHoldings
	End

	If UPPER(@StageTableName) = 'BNYMONTHLY' 
	Begin
		TRUNCATE TABLE Stg.BNYMonthly
	End

	If UPPER(@StageTableName) = 'COMPOSITES' 
	Begin
		TRUNCATE TABLE Stg.Composites
	End

	If UPPER(@StageTableName) = 'COUNTRY' 
	Begin
		TRUNCATE TABLE Stg.Country
	End

	If UPPER(@StageTableName) = 'EQBENCHMARKS' 
	Begin
		TRUNCATE TABLE Stg.FactSetEqBenchmarks
	End
	If UPPER(@StageTableName) = 'FIBENCHMARKS' 
	Begin
		TRUNCATE TABLE Stg.FactSetFIBenchmarks
	End

	If UPPER(@StageTableName) = 'FACTSETINTLFICOVERAGE' 
	Begin
		TRUNCATE TABLE Stg.FactSetIntlFICoverage
	End

	If UPPER(@StageTableName) = 'FACTSETUSFICOVERAGE' 
	Begin
		TRUNCATE TABLE Stg.FactSetUSFICoverage
	End

	If UPPER(@StageTableName) = 'FX' 
	Begin
		TRUNCATE TABLE Stg.FX
	End

	If UPPER(@StageTableName) = 'LFI' 
	Begin
		TRUNCATE TABLE Stg.LFI
	End

	If UPPER(@StageTableName) = 'MARSHALLWACE' 
	Begin
		TRUNCATE TABLE Stg.MarshallWace
	End
	------This Entity MgrTNCRM is not available in Input folder as on 23MAR2016
	If UPPER(@StageTableName) = 'MGRTNCRM' 
	Begin
		TRUNCATE TABLE Stg.MgrTNCRM
	End

	If UPPER(@StageTableName) = 'PORTFOLIOMASTER' 
	Begin
		TRUNCATE TABLE Stg.PortfolioMaster
	End

	If UPPER(@StageTableName) = 'RATINGS' 
	Begin
		TRUNCATE TABLE Stg.Ratings
	End

	If UPPER(@StageTableName) = 'SECTOR' 
	Begin
		TRUNCATE TABLE Stg.Sector
	End

	If UPPER(@StageTableName) = 'TENORHOLDINGS' 
	Begin
		TRUNCATE TABLE Stg.TenorHoldings
	End

	If UPPER(@StageTableName) = 'TENORTNC' 
	Begin
		TRUNCATE TABLE Stg.TenorTnc
	End

	If UPPER(@StageTableName) = 'INDEXRETURNS' 
	Begin
		TRUNCATE TABLE Stg.IndexReturns
	End

	If UPPER(@StageTableName) = 'POTENTIALMANAGERS' 
	Begin
		TRUNCATE TABLE Stg.PotentialManagers
	End

	If UPPER(@StageTableName) = 'POTENTIALMANAGERSCODEINDEX' 
	Begin
		TRUNCATE TABLE Stg.PotentialManagersCodeIndex
	End
	
	If UPPER(@StageTableName) = 'STONEMILINER' 
	Begin
		TRUNCATE TABLE Stg.StoneMiliner
	End
	
	If UPPER(@StageTableName) = 'ASSETALLOCATION' 
	Begin
		TRUNCATE TABLE Stg.AssetAllocation
	End
	
	If UPPER(@StageTableName) = 'EURODOLLARSWAPCURVE' 
	Begin
		TRUNCATE TABLE Stg.EuroDollarSwapCurve
	End
	
	If UPPER(@StageTableName) = 'IRSURFACE' 
	Begin
		TRUNCATE TABLE Stg.IRSurface
	End

	If UPPER(@StageTableName) = 'TENORPOSITIONS' 
	Begin
		TRUNCATE TABLE Stg.TenorPositions
	End

	If UPPER(@StageTableName) = 'TENORTNCOPT' 
	Begin
		TRUNCATE TABLE Stg.TenorTncOPT
	End
	
	If UPPER(@StageTableName) = 'EQSURFACE' 
	Begin
		TRUNCATE TABLE Stg.EqSurface
	End

	If UPPER(@StageTableName) = 'MASTERETFDATA' 
	Begin
		TRUNCATE TABLE Stg.MasterETFData
	End
	
	If UPPER(@StageTableName) = 'SWAPCURVE' 
	Begin
		TRUNCATE TABLE Stg.SwapCurve
	End
	
	If UPPER(@StageTableName) = 'BROADRIDGETRADE' 
	Begin
		TRUNCATE TABLE Stg.BroadRidgeTrade
	End
	
	If UPPER(@StageTableName) = 'COMPOSITEASSET' 
	Begin
		TRUNCATE TABLE Stg.CompositeAsset
	End
End


GO


