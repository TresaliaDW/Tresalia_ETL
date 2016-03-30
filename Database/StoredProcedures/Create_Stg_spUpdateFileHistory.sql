/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spUpdateFileHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spUpdateFileHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spUpdateFileHistory]
Go

/****** Object:  StoredProcedure [stg].[spUpdateFileHistory]    Script Date: 3/23/2016 10:56:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [stg].[spUpdateFileHistory]
       @ArchivedFilePath Varchar(100),
       @ArchivedFileName Varchar(100),	             
	   @ProcessingStatus Varchar(100),
	   @SourceFilePath Varchar(100),       
       @TabName Varchar(100),
	   @TotalRecordsInFile Int,	
	   @EntityType Varchar(100)

As
Begin
    Set Nocount On
	DECLARE @ProcessedRecordsInFile Int = 0
	DECLARE @MaxFileID Int = 0

	If UPPER(@EntityType) = 'ASSETTYPE' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.AssetType
	End

	If UPPER(@EntityType) = 'BNYCFREPORT' 
	Begin
		SELECT @ProcessedRecordsInFile  = COUNT(*)   FROM Stg.BNYCFReport
	End

	If UPPER(@EntityType) = 'BNYHOLDINGS' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.BNYHoldings
	End

	If UPPER(@EntityType) = 'BNYMONTHLY' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.BNYMonthly
	End

	If UPPER(@EntityType) = 'COMPOSITES' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.Composites
	End

	If UPPER(@EntityType) = 'COUNTRY' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.Country
	End

	If UPPER(@EntityType) = 'EQBENCHMARKS' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.FactSetEqBenchmarks
	End
	If UPPER(@EntityType) = 'FIBENCHMARKS' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.FactSetFIBenchmarks
	End

	If UPPER(@EntityType) = 'FACTSETINTLFICOVERAGE' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.FactSetIntlFICoverage
	End

	If UPPER(@EntityType) = 'FACTSETUSFICOVERAGE' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.FactSetUSFICoverage
	End

	If UPPER(@EntityType) = 'FX' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.FX
	End

	If UPPER(@EntityType) = 'LFI' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.LFI
	End

	If UPPER(@EntityType) = 'MARSHALLWACE' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.MarshallWace
	End
	------This Entity MgrTNCRM is not available in Input folder as on 23MAR2016
	If UPPER(@EntityType) = 'MGRTNCRM' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.MgrTNCRM
	End

	If UPPER(@EntityType) = 'PORTFOLIOMASTER' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.PortfolioMaster
	End

	If UPPER(@EntityType) = 'RATINGS' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.Ratings
	End

	If UPPER(@EntityType) = 'SECTOR' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.Sector
	End

	If UPPER(@EntityType) = 'TENORHOLDINGS' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.TenorHoldings
	End

	If UPPER(@EntityType) = 'TENORTNC' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.TenorTnc
	End

	If UPPER(@EntityType) = 'INDEXRETURNS' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.IndexReturns
	End

	If UPPER(@EntityType) = 'POTENTIALMANAGERS' AND UPPER(@TabName) = 'MONTHLY$'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.PotentialManagers Where TabName = 'Monthly$'
	End

	If UPPER(@EntityType) = 'POTENTIALMANAGERS' AND UPPER(@TabName) = 'QUARTERLY$'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.PotentialManagers Where TabName = 'Quarterly$'
	End

	If UPPER(@EntityType) = 'POTENTIALMANAGERSCODEINDEX' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.PotentialManagersCodeIndex
	End

	If UPPER(@EntityType) = 'STONEMILINER' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.StoneMiliner
	End
    
	If UPPER(@EntityType) = 'ASSETALLOCATION' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.AssetAllocation
	End
    
	If UPPER(@EntityType) = 'EURODOLLARSWAPCURVE' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.EuroDollarSwapCurve
	End
    
	If UPPER(@EntityType) = 'IRSURFACE' 
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.IRSurface
	End
	If UPPER(@EntityType) = 'TENORPOSITIONS'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.TenorPositions
	End
	If UPPER(@EntityType) = 'TENORTNCOPT'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.TenorTncOPT
	End

	If UPPER(@EntityType) = 'EQSURFACE'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.EqSurface
	End
	
	If UPPER(@EntityType) = 'MASTERETFDATA'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.MasterETFData
	End	
    
	If UPPER(@EntityType) = 'SWAPCURVE'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.SwapCurve
	End

	If UPPER(@EntityType) = 'BROADRIDGETRADE'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.BroadRidgeTrade
	End

	If UPPER(@EntityType) = 'COMPOSITEASSET'
	Begin
		SELECT @ProcessedRecordsInFile = COUNT(*)  FROM Stg.CompositeAsset
	End

	SET @MaxFileID = (SELECT MAX(FileID) FROM  Stg.FileHistory  
	WHERE SourceFilePath = @SourceFilePath
	AND	SourceFileName = @ArchivedFileName
	AND   TabName = @TabName)

	UPDATE Stg.FileHistory 
	SET 
	ArchivedFilePath = @ArchivedFilePath ,
	ArchivedFileName = @ArchivedFileName, 
	TotalRecordsInFile = @TotalRecordsInFile, 
	ProcessedRecordsInFile = @ProcessedRecordsInFile,
	ProcessingStatus = @ProcessingStatus
	WHERE
		FileID = @MaxFileID 
	AND	SourceFilePath = @SourceFilePath
	AND	SourceFileName = @ArchivedFileName
	AND   TabName = @TabName
       
End

GO


