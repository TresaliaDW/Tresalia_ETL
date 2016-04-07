USE [Tresalia]
GO
/****** Object:  StoredProcedure [stg].[spGetStagingData]    Script Date: 01/04/2016 08:28:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [stg].[spGetStagingData]
	   @EntityType Varchar(100)

As
Begin
    Set Nocount On

	If UPPER(@EntityType) = 'ASSETTYPE' 
	Begin
		SELECT * FROM Stg.AssetType
	End

	If UPPER(@EntityType) = 'BNYCFREPORT' 
	Begin
		SELECT * FROM Stg.BNYCFReport
	End

	If UPPER(@EntityType) = 'BNYHOLDINGS' 
	Begin
		SELECT * FROM Stg.BNYHoldings
	End

	If UPPER(@EntityType) = 'BNYMONTHLY' 
	Begin
		SELECT * FROM Stg.BNYMonthly
	End

	If UPPER(@EntityType) = 'COMPOSITES' 
	Begin
		SELECT * FROM Stg.Composites
	End

	If UPPER(@EntityType) = 'COUNTRY' 
	Begin
		SELECT * FROM Stg.Country
	End

	If UPPER(@EntityType) = 'EQBENCHMARKS' 
	Begin
		SELECT * FROM Stg.FactSetEqBenchmarks
	End
	If UPPER(@EntityType) = 'FIBENCHMARKS' 
	Begin
		SELECT * FROM Stg.FactSetFIBenchmarks
	End

	If UPPER(@EntityType) = 'FACTSETINTLFICOVERAGE' 
	Begin
		SELECT * FROM Stg.FactSetIntlFICoverage
	End

	If UPPER(@EntityType) = 'FACTSETUSFICOVERAGE' 
	Begin
		SELECT * FROM Stg.FactSetUSFICoverage
	End

	If UPPER(@EntityType) = 'FX' 
	Begin
		SELECT * FROM Stg.FX
	End

	If UPPER(@EntityType) = 'LFI' 
	Begin
		SELECT * FROM Stg.LFI
	End

	If UPPER(@EntityType) = 'MARSHALLWACE' 
	Begin
		SELECT * FROM Stg.MarshallWace
	End
	------This Entity MgrTNCRM is not available in Input folder as on 23MAR2016
	If UPPER(@EntityType) = 'MGRTNCRM' 
	Begin
		SELECT * FROM Stg.MgrTNCRM
	End

	If UPPER(@EntityType) = 'PORTFOLIOMASTER' 
	Begin
		SELECT * FROM Stg.PortfolioMaster
	End

	If UPPER(@EntityType) = 'RATINGS' 
	Begin
		SELECT * FROM Stg.Ratings
	End

	If UPPER(@EntityType) = 'SECTOR' 
	Begin
		SELECT * FROM Stg.Sector
	End

	If UPPER(@EntityType) = 'TENORHOLDINGS' 
	Begin
		SELECT * FROM Stg.TenorHoldings
	End

	If UPPER(@EntityType) = 'TENORTNC' 
	Begin
		SELECT * FROM Stg.TenorTnc
	End

	If UPPER(@EntityType) = 'INDEXRETURNS' 
	Begin
		SELECT * FROM Stg.IndexReturns
	End

	If UPPER(@EntityType) = 'POTENTIALMANAGERS'
	Begin
		SELECT * FROM Stg.PotentialManagers Where TabName = 'Monthly$'
	End

	If UPPER(@EntityType) = 'POTENTIALMANAGERSCODEINDEX' 
	Begin
		SELECT * FROM Stg.PotentialManagersCodeIndex
	End

	If UPPER(@EntityType) = 'STONEMILINER' 
	Begin
		SELECT * FROM Stg.StoneMiliner
	End
    
	If UPPER(@EntityType) = 'ASSETALLOCATION' 
	Begin
		SELECT * FROM Stg.AssetAllocation
	End
    
	If UPPER(@EntityType) = 'EURODOLLARSWAPCURVE' 
	Begin
		SELECT * FROM Stg.EuroDollarSwapCurve
	End
    
	If UPPER(@EntityType) = 'IRSURFACE' 
	Begin
		SELECT * FROM Stg.IRSurface
	End
	If UPPER(@EntityType) = 'TENORPOSITIONS'
	Begin
		SELECT * FROM Stg.TenorPositions
	End
	If UPPER(@EntityType) = 'TENORTNCOPT'
	Begin
		SELECT * FROM Stg.TenorTncOPT
	End

	If UPPER(@EntityType) = 'EQSURFACE'
	Begin
		SELECT * FROM Stg.EqSurface
	End
	
	If UPPER(@EntityType) = 'MASTERETFDATA'
	Begin
		SELECT * FROM Stg.MasterETFData
	End	
    
	If UPPER(@EntityType) = 'SWAPCURVE'
	Begin
		SELECT * FROM Stg.SwapCurve
	End

	If UPPER(@EntityType) = 'BROADRIDGETRADE'
	Begin
		SELECT * FROM Stg.BroadRidgeTrade
	End

	If UPPER(@EntityType) = 'COMPOSITEASSET'
	Begin
		SELECT * FROM Stg.CompositeAsset
	End

	If UPPER(@EntityType) = 'REFTABLE'
	Begin
		SELECT * FROM Stg.RefTable
	End

	If UPPER(@EntityType) = 'FUTURES'
	Begin
		SELECT * FROM Stg.Futures
	End
End

