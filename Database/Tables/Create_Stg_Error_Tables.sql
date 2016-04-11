/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/18/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorAssetType') and   type = 'U')
   drop table Stg.ErrorAssetType
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorSector') and   type = 'U')
   drop table Stg.ErrorSector
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorCountry') and   type = 'U')
   drop table Stg.ErrorCountry
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorCurrency') and   type = 'U')
   drop table Stg.ErrorCurrency
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorComposites') and   type = 'U')
   drop table Stg.ErrorComposites
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorRatings') and   type = 'U')
   drop table Stg.ErrorRatings
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorFX') and   type = 'U')
   drop table Stg.ErrorFX
go


if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorFactSetUSFICoverage') and   type = 'U')
   drop table Stg.ErrorFactSetUSFICoverage
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorFactSetIntlFICoverage') and   type = 'U')
   drop table Stg.ErrorFactSetIntlFICoverage
go


if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorFactSetEqBenchmarks') and   type = 'U')
   drop table Stg.ErrorFactSetEqBenchmarks
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorFactSetFIBenchmarks') and   type = 'U')
   drop table Stg.ErrorFactSetFIBenchmarks
go


if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorPortfolioMaster') and   type = 'U')
   drop table Stg.ErrorPortfolioMaster
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorLFI') and   type = 'U')
   drop table Stg.ErrorLFI
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorMarshallWace') and   type = 'U')
   drop table Stg.ErrorMarshallWace
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorTenorTnc') and   type = 'U')
   drop table Stg.ErrorTenorTnc
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorTenorHoldings') and   type = 'U')
   drop table Stg.ErrorTenorHoldings
go


if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorBNYMonthly') and   type = 'U')
   drop table Stg.ErrorBNYMonthly
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorMgrTNCRM') and   type = 'U')
   drop table Stg.ErrorMgrTNCRM
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorBNYHoldings') and   type = 'U')
   drop table Stg.ErrorBNYHoldings
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorBNYCFReport') and   type = 'U')
   drop table Stg.ErrorBNYCFReport
go


if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorIndexReturns') and   type = 'U')
   drop table Stg.ErrorIndexReturns
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorPotentialManagers') and   type = 'U')
   drop table Stg.ErrorPotentialManagers
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorPotentialManagersCodeIndex') and   type = 'U')
   drop table Stg.ErrorPotentialManagersCodeIndex
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorStoneMiliner') and   type = 'U')
   drop table Stg.ErrorStoneMiliner
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorAssetAllocation') and   type = 'U')
   drop table Stg.ErrorAssetAllocation
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorEuroDollarSwapCurve') and   type = 'U')
   drop table Stg.ErrorEuroDollarSwapCurve
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorIRSurface') and   type = 'U')
   drop table Stg.ErrorIRSurface
go

if exists (select 1 from  sysobjects where  id = object_id('Stg.ErrorTenorPositions') and   type = 'U')
   drop table Stg.ErrorTenorPositions
go

IF EXISTS (SELECT 1 FROM  sysobjects WHERE  id = OBJECT_ID('Stg.ErrorTenorTncOPT') AND   TYPE = 'U')
   DROP TABLE Stg.ErrorTenorTncOPT
GO

IF EXISTS (SELECT 1 FROM  sysobjects WHERE  id = OBJECT_ID('Stg.ErrorEqSurface') AND   TYPE = 'U')
   DROP TABLE Stg.ErrorEqSurface
   
IF EXISTS (SELECT 1 FROM  sysobjects WHERE  id = OBJECT_ID('Stg.ErrorMasterETFData') AND   TYPE = 'U')
   DROP TABLE Stg.ErrorMasterETFData


IF EXISTS (SELECT 1 FROM  sysobjects WHERE  id = OBJECT_ID('Stg.ErrorSwapCurve') AND   TYPE = 'U')
   DROP TABLE Stg.ErrorSwapCurve

   
IF EXISTS (SELECT 1 FROM  sysobjects WHERE  id = OBJECT_ID('Stg.ErrorBroadRidgeTrade') AND   TYPE = 'U')
   DROP TABLE Stg.ErrorBroadRidgeTrade
   
   
IF EXISTS (SELECT 1 FROM  sysobjects WHERE  id = OBJECT_ID('Stg.ErrorCompositeAsset') AND   TYPE = 'U')
   DROP TABLE Stg.ErrorCompositeAsset
GO


/*==============================================================*/
/* Table: TableName                                             */
/*==============================================================*/
create table Stg.ErrorAssetType (


   FileName		Varchar(100)		not null,   
   TabName       varchar(100)		not null,
   FileDate		Varchar(100)		not null,
   [PRODUCT TYPE]        Varchar(100)		 null, 
   DESCRIPTION          Varchar(100)		 null,
   Description2         Varchar(100)		 null,
   Level_1		Varchar(100)		 null,
   Level_2		Varchar(100)		 null,
   Level_3		Varchar(100)		 null,
   Level_4		Varchar(100)		 null,
   Level_5		Varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy			Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate			Date				Not Null
)

/*==============================================================*/
/* Table: TableName                                             */
/*==============================================================*/

create table Stg.ErrorSector (
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName              varchar(100)		not null,
   SYMBOL         	Varchar(100)		 null,
   FS_SEC		Varchar(100)		 null,
   FS_IND		Varchar(100)		 null,
   FSN			Varchar(100)		 null,
   FIN			Varchar(100)		 null,
   GICS_LEVEL_4_CODE	Varchar(100)		 null,
   GICS_LEVEL_1		Varchar(100)		 null,
   GICS_LEVEL_2		Varchar(100)		 null,
   GICS_LEVEL_3		Varchar(100)		 null,
   GICS_LEVEL_4		Varchar(100)		 null,
   BB_INDUSTRY_SECTOR_Code	Varchar(100)		 null,
   BB_INDUSTRY_SECTOR		Varchar(100)		 null,
   BB_INDUSTRY_GROUP_Code	Varchar(100)		 null,
   BB_INDUSTRY_GROUP		Varchar(100)		 null,
   BB_INDUSTRY_SUBGROUP_Code	Varchar(100)		 null,
   BB_INDUSTRY_SUBGROUP		Varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',   
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null
   
)

create table Stg.ErrorCountry (
   
   FileName		Varchar(100)		not null,   
   TabName              varchar(100)		not null,
   FileDate		Varchar(100)		not null,
   Country 		varchar(100)		 null,
   MSCI_COUNTRY_NAME	varchar(100)		 null,
   MSCI_INDEX_ID	varchar(100)		 null,
   FDS_COUNTRY_NAME	varchar(100)		 null,
   [ISO (#)]		varchar(100)		 null,
   [ISO (2)]		varchar(100)		 null,
   [ISO (3)]		varchar(100)		 null,
   [ISO (FIPS)]		varchar(100)		 null,
   BaseDate		varchar(100)		 null,
   BaseDate2		varchar(100)		 null,
   BaseDate3		varchar(100)		 null,
   Style		varchar(100)		 null,
   Continent		varchar(100)		 null,
   Region		varchar(100)		 null,
   CurrencyCode		varchar(100)		 null,
   CurrencyName		varchar(100)		 null, 
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',      
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null
   
)


create table Stg.ErrorCurrency (
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName              varchar(100)		not null,
   Country 		varchar(100)		 null,
   MSCI_COUNTRY_NAME	varchar(100)		 null,
   MSCI_INDEX_ID	varchar(100)		 null,
   FDS_COUNTRY_NAME	varchar(100)		 null,
   [ISO (#)]		varchar(100)		 null,
   [ISO (2)]		varchar(100)		 null,
   [ISO (3)]		varchar(100)		 null,
   [ISO (FIPS)]		varchar(100)		 null,
   BaseDate		varchar(100)		 null,
   BaseDate2		varchar(100)		 null,
   BaseDate3		varchar(100)		 null,
   Style		varchar(100)		 null,
   Continent		varchar(100)		 null,
   Region		varchar(100)		 null,
   CurrencyCode		varchar(100)		 null,
   CurrencyName		varchar(100)		 null, 
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',      
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null
   
)
create table Stg.ErrorComposites (
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName              varchar(100)		not null,
   COMPOSITE_ID	 	varchar(100)		 null,    
   ACCOUNT_ID		varchar(100)		 null,    
   Valuation_Date	varchar(100)		 null,     
   Weight	    	varchar(100)		 null,    
   Frq			varchar(100)		 null, 
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null
   
)

create table Stg.ErrorRatings (
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName              varchar(100)		not null,
   [Moody's LT]	 	varchar(100)		 null,
   [S&P LT]		varchar(100)		 null,
   [Fitch LT]		varchar(100)		 null,
   Grade		varchar(100)		 null,  
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No', 
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null
   
)

create table Stg.ErrorFX (
   
   FileName		Varchar(100)		not null,   
   TabName              varchar(100)		not null,   
   FileDate      varchar(100)		not null,
   [FX CODE]	 	varchar(100)		 null,
   FX_NAME		varchar(100)		 null,
   TGT_FX		varchar(100)		 null,
   BASE_FX		varchar(100)		 null,
   Date			varchar(100)		 null,	
   Value   		varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null   
)



create table Stg.ErrorFactSetUSFICoverage (
   
   [FileName]		Varchar(100)		not null,
   [FilePath]		Varchar(100)		not null,
   [TabName]              varchar(100)		not null,
   [ID_CUSIP] 		varchar(100)		null,
   [CUSIP] 		varchar(100)		null,
   [SEDOL] 		varchar(100)		null,
   [Bloomber Identifier] varchar(100)		null,
   [SECURITY_NAME] 	varchar(100)		null,
   [MARKET_SECTOR_DES]  varchar(100)		null,
   [RTG] 		varchar(100)		null,
   [INDUSTRY_SECTOR]    varchar(100)		null,
   [INDUSTRY_GROUP]     varchar(100)		null,
   [INDUSTRY_SUBGROUP]  varchar(100)		null,
   [CNTRY_OF_RISK]      varchar(100)		null,
   [OAS_CURVE_ID]       varchar(100)		null,
   [DUR_ADJ_OAS_MID]    varchar(100)		null,
   [OAS_SPREAD_DUR_MID] varchar(100)		null,
   [6MO] 		varchar(100)		null,
   [2Y] 		varchar(100)		null,
   [5Y] 		varchar(100)		null,
   [10Y] 		varchar(100)		null,
   [20Y] 		varchar(100)		null,
   [30Y] 		varchar(100)		null,
   [CRNCY] 		varchar(100)		null,
   [CPN] 		varchar(100)		null,
   [YLD_YTM_MID] 	varchar(100)		null,
   [MTY_YEARS_TDY] 	varchar(100)		null,
   [CPN_TYP] 		varchar(100)		null,
   [Convexity] 		varchar(100)		null,
   [INFLATION_LINKED_INDICATOR] varchar(100)	null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		Varchar(50)          not null DEFAULT SUSER_NAME(),
   [BatchDate]			Date				Not Null  
   
)


create table Stg.ErrorFactSetIntlFICoverage (
   
   [FileName]		Varchar(100)		not null,
   [FilePath]		Varchar(100)		not null,
   [TabName]              varchar(100)		not null,
   [ID_CUSIP] 		varchar(100)		null,
   [CUSIP] 		varchar(100)		null,
   [SEDOL] 		varchar(100)		null,
   [Bloomber Identifier] varchar(100)		null,
   [SECURITY_NAME] 	varchar(100)		null,
   [MARKET_SECTOR_DES]  varchar(100)		null,
   [RTG] 		varchar(100)		null,
   [INDUSTRY_SECTOR]    varchar(100)		null,
   [INDUSTRY_GROUP]     varchar(100)		null,
   [INDUSTRY_SUBGROUP]  varchar(100)		null,
   [CNTRY_OF_RISK]      varchar(100)		null,
   [OAS_CURVE_ID]       varchar(100)		null,
   [DUR_ADJ_OAS_MID]    varchar(100)		null,
   [OAS_SPREAD_DUR_MID] varchar(100)		null,
   [6MO] 		varchar(100)		null,
   [2Y] 		varchar(100)		null,
   [5Y] 		varchar(100)		null,
   [10Y] 		varchar(100)		null,
   [20Y] 		varchar(100)		null,
   [30Y] 		varchar(100)		null,
   [CRNCY] 		varchar(100)		null,
   [CPN] 		varchar(100)		null,
   [YLD_YTM_MID] 	varchar(100)		null,
   [MTY_YEARS_TDY] 	varchar(100)		null,
   [CPN_TYP] 		varchar(100)		null,
   [Convexity] 		varchar(100)		null,
   [INFLATION_LINKED_INDICATOR] varchar(100)	null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		Varchar(50)          not null DEFAULT SUSER_NAME(),
   [BatchDate]			Date				Not Null  
   
)



CREATE TABLE Stg.ErrorFactSetEqBenchmarks (
    [FileName]		Varchar(100)		not null,
    [FilePath]		Varchar(100)		not null,
    [TabName]           varchar(100)		not null,
    [NDT/DB] 		varchar(100)		 null,
    [Trust/Asset Class] varchar(100)		 null,
    [Manager] 		varchar(100)		 null,
    [Mellon Account Name] varchar(100)		 null,
    [Strategy] 		varchar(100)		 null,
    [Strategy II] 	varchar(100)		 null,
    [SubTrust/Flag] 	varchar(100)		 null,
    [Reporting Account Name]   varchar(100)		 null,
    [Reporting Account Number] varchar(100)		 null,
    [Total Account Market Value] varchar(100)		 null,
    [Holdings As Of Date] 	 varchar(100)		 null,
    [Mellon Security ID] 	 varchar(100)		 null,
    [Cusip] 			 varchar(100)		 null,
    [ISIN] 			varchar(100)		 null,
    [Sedol] 			varchar(100)		 null,
    [Loan ID] 			varchar(100)		 null,
    [Ticker] 			varchar(100)		 null,
    [Ticker with exchange code] varchar(100)		 null,
    [Current Strike Price] 	varchar(100)		 null,
    [Expire Date] 		varchar(100)		 null,
    [Income Rate Type] 		varchar(100)		 null,
    [Income Rate Type Desc] 	varchar(100)		 null,
    [International Cusip] 	varchar(100)		 null,
    [Issue Type Code]		varchar(100)		 null,
    [Issue Type Description] 	varchar(100)		 null,
    [Issuer Code] 		varchar(100)		 null,
    [Issuer Name] 		varchar(100)		 null,
    [Original Strike Price] 	varchar(100)		 null,
    [Payment Frequency] 	varchar(100)		 null,
    [Payment Frequency Desc] 	varchar(100)		 null,
    [Price Source] 		varchar(100)		 null,
    [Price Source Description] 	varchar(100)		 null,
    [Security Class Code] 	varchar(100)		 null,
    [Security Class Type] 	varchar(100)		 null,
    [Security Description1]     varchar(100)		 null,
    [Security Description2] 	varchar(100)		 null,
    [Security Type] 		varchar(100)		 null,
    [Accrued Dividend Income] 	varchar(100)		 null,
    [Accrued Interest Income] 	varchar(100)		 null,
    [Asset Type Description] 	varchar(100)		 null,
    [Asset Types] 		varchar(100)		 null,
    [Asset Type Code] 		varchar(100)		 null,
    [Base Cost] 		varchar(100)		 null,
    [Base Currency Code] 	varchar(100)		 null,
    [Base Currency Gain/Loss] 	varchar(100)		 null,
    [Base Market Value] 	varchar(100)		 null,
    [Base Notional Cost] 	varchar(100)		 null,
    [Base Notional Market Value] varchar(100)		 null,
    [Base Unit Cost] 		varchar(100)		 null,
    [Coupon Rate] 		varchar(100)		 null,
    [Holdings Price Base] 	varchar(100)		 null,
    [Holdings Price Local] 	varchar(100)		 null,
    [Local Cost] 		varchar(100)		 null,
    [Underlying Security ID] 	varchar(100)		 null,
    [Yield to Maturity]		varchar(100)		 null,
    [Bloomberg Global ID - Alternative Global]  varchar(100)		 null,
    [Bloomberg Global ID - Domestic] 		varchar(100)		 null,
    [Bloomberg Global ID - Global] 		varchar(100)		 null,
    [Country of Issue Code] 			varchar(100)		 null,
    [Country of Issue Name] 			varchar(100)		 null,
    [Derivative Type] 				varchar(100)		 null,
    [Underlying CUSIP] 				varchar(100)		 null,
    [Underlying ISIN] 				varchar(100)		 null,
    [Underlying Loan ID] 			varchar(100)		 null,
    [Underlying Quick] 				varchar(100)		 null,
    [Underlying SEDOL] 				varchar(100)		 null,
    [Underlying Security Description 1] 	varchar(100)		 null,
    [Asset Mix Category] 			varchar(100)		 null,
    [Asset Mix Description] 			varchar(100)		 null,
    [BNYM Classification - Category] 		varchar(100)		 null,
    [BNYM Classification - Segment] 		varchar(100)		 null,
    [Bloomberg Group] 				varchar(100)		 null,
    [Bloomberg Industry Sector] 		varchar(100)		 null,
    [Bloomberg Industry Sub-Group] 		varchar(100)		 null,
    [Bloomberg Market Sector] 			varchar(100)		 null,
    [Shares] 					varchar(100)		 null,
    [Local Notional Market Value] 		varchar(100)		 null,
    [Local Market Value] 			varchar(100)		 null,
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
    [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		  Varchar(50)          not null DEFAULT SUSER_NAME(),
   [BatchDate]			Date				Not Null 

)

CREATE TABLE Stg.ErrorFactSetFIBenchmarks (
    [FileName]									Varchar(100)		not null,
	[FilePath]									Varchar(100)		not null,
	[TabName]									Varchar(100),
	[NDT/DB] varchar(100),
	[Trust/Asset Class] varchar(100),
	[Manager] varchar(100),
	[Mellon Account Name] varchar(100),
	[Strategy] varchar(100),
	[Strategy II] varchar(100),
	[SubTrust/Flag] varchar(100),
	[Reporting Account Name] varchar(100),
	[Reporting Account Number] varchar(100),
	[Total Account Market Value] varchar(100),
	[Holdings As Of Date] float,
	[Mellon Security ID] varchar(100),
	[Cusip] varchar(100),
	[ISIN] varchar(100),
	[Sedol] varchar(100),
	[Loan ID] varchar(100),
	[Ticker] varchar(100),
	[Ticker with exchange code] varchar(100),
	[Current Strike Price] varchar(100),
	[Expire Date] varchar(100),
	[Income Rate Type] varchar(100),
	[Income Rate Type Desc] varchar(100),
	[International Cusip] varchar(100),
	[Issue Type Code] varchar(100),
	[Issue Type Description] varchar(100),
	[Issuer Code] varchar(100),
	[Issuer Name] varchar(100),
	[Original Strike Price] varchar(100),
	[Payment Frequency] varchar(100),
	[Payment Frequency Desc] varchar(100),
	[Price Source] varchar(100),
	[Price Source Description] varchar(100),
	[Security Class Code] varchar(100),
	[Security Class Type] varchar(100),
	[Security Description1] varchar(100),
	[Security Description2] varchar(100),
	[Security Type] varchar(100),
	[Accrued Dividend Income] varchar(100),
	[Accrued Interest Income] varchar(100),
	[Asset Type Description] varchar(100),
	[Asset Types] varchar(100),
	[Asset Type Code] varchar(100),
	[Base Cost] varchar(100),
	[Base Currency Code] varchar(100),
	[Base Currency Gain/Loss] varchar(100),
	[Base Market Value] float,
	[Base Notional Cost] varchar(100),
	[Base Notional Market Value] varchar(100),
	[Base Unit Cost] varchar(100),
	[Coupon Rate] varchar(100),
	[Holdings Price Base] varchar(100),
	[Holdings Price Local] varchar(100),
	[Local Cost] varchar(100),
	[Underlying Security ID] varchar(100),
	[Yield to Maturity] varchar(100),
	[Bloomberg Global ID - Alternative Global] varchar(100),
	[Bloomberg Global ID - Domestic] varchar(100),
	[Bloomberg Global ID - Global] varchar(100),
	[Country of Issue Code] varchar(100),
	[Country of Issue Name] varchar(100),
	[Derivative Type] varchar(100),
	[Underlying CUSIP] varchar(100),
	[Underlying ISIN] varchar(100),
	[Underlying Loan ID] varchar(100),
	[Underlying Quick] varchar(100),
	[Underlying SEDOL] varchar(100),
	[Underlying Security Description 1] varchar(100),
	[Asset Mix Category] varchar(100),
	[Asset Mix Description] varchar(100),
	[BNYM Classification - Category] varchar(100),
	[BNYM Classification - Segment] varchar(100),
	[Bloomberg Group] varchar(100),
	[Bloomberg Industry Sector] varchar(100),
	[Bloomberg Industry Sub-Group] varchar(100),
	[Bloomberg Market Sector] varchar(100),
	[Shares] varchar(100),
	[Local Notional Market Value] varchar(100),
	[Local Market Value] varchar(100),
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
    CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)


create table Stg.ErrorPortfolioMaster (
   
   [FileName]		Varchar(100)		not null,
   [FilePath]		Varchar(100)		not null,
   [TabName]            varchar(100)		not null,
   ACCOUNT_ID		varchar(100)		 null,	
   ACCOUNT_NAME		varchar(100)		 null,
   ACCOUNT_NAME_Long		varchar(100)		 null,
   LEVEL_1		varchar(100)		 null,
   LEVEL_2		varchar(100)		 null,
   LEVEL_3		varchar(100)		 null,
   LEVEL_4		varchar(100)		 null,
   LEVEL_5		varchar(100)		 null,
   Bench_ID		varchar(100)		 null,
   FEE_1_PROXY		varchar(100)		 null,
   FEE_1_AUM		varchar(100)		 null,
   FEE_2_PROXY		varchar(100)		 null,
   FEE_2_AUM		varchar(100)		 null,
   FEE_3_PROXY		varchar(100)		 null,
   FEE_3_AUM		varchar(100)		 null,
   FEE_PAID_DIRECT	varchar(100)		 null,	
   HURDLE_RATE		varchar(100)		 null,
   Account_Type		varchar(100)		 null,
   [Mask 1]		varchar(100)		 null,
   [Mask 2]		varchar(100)		 null,
   [Mask 3]		varchar(100)		 null,
   [Mask 4]		varchar(100)		 null,
   [Asset_Manager]		varchar(100)		 null,
    Pooled		varchar(100)		 null,
    Acct_Inception_Date	varchar(100)		 null,
    Strat_Inception_Date	varchar(100)		 null,
    Calc_Pref		varchar(100)		 null,
    Entity_Type		varchar(100)		 null,
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		  Varchar(50)          not null DEFAULT SUSER_NAME(),
   [BatchDate]			Date				Not Null 
)

create table Stg.ErrorLFI (


   [FileName]		Varchar(100)		not null,
   [FilePath]		Varchar(100)		not null,
   [TabName]            varchar(100)		not null,
   id_cusip		varchar(100)		 null,
   bb_id		varchar(100)		 null,
   security_name	varchar(100)		 null,
   cntry_of_risk	varchar(100)		 null,
   crncy		varchar(100)		 null,
   market_sector_des	varchar(100)		 null,
   rtg			varchar(100)		 null,
   industry_sector	varchar(100)		 null,
   industry_group	varchar(100)		 null,
   industry_subgroup	varchar(100)		 null,
   oas_curve_id		varchar(100)		 null,
   oas_spread_dur_mid	varchar(100)		 null,	
   dur_adj_oas_mid	varchar(100)		 null,
   [6mo]			varchar(100)		 null,
   [partdur1]		varchar(100)		 null,
   [partdur2]		varchar(100)		 null,
   [partdur3]		varchar(100)		 null,
   [partdur4]		varchar(100)		 null,
   [partdur5]		varchar(100)		 null,
   [partdur6]		varchar(100)		 null,
   [partdur7]		varchar(100)		 null,
   [partdur8]		varchar(100)		 null,
   undid		varchar(100)		 null,
   oas			varchar(100)		 null,
   yld_ytm_mid		varchar(100)		 null,
   cpn			varchar(100)		 null,
   mty_years_tdy	varchar(100)		 null,	
   matur2		varchar(100)		 null,
   cpn_typ		varchar(100)		 null,
   inceptiondate	varchar(100)		 null,
   optiontype		varchar(100)		 null,
   convertibleindicator		varchar(100)		 null,
   convertibledelta		varchar(100)		 null,
   convertiblegamma		varchar(100)		 null,
   spreadconvexity		varchar(100)		 null,
   effectiveconvexity		varchar(100)		 null,
   conversionprice		varchar(100)		 null,
   underlyingequityprice	varchar(100)		 null,	
   underlyingequityvolatility	varchar(100)		 null,
   inflation_linked_indicator	varchar(100)		 null,
   lastbondprice		varchar(100)		 null,
   notional			varchar(100)		 null,
   cv_exch_rt_eqy_bond		varchar(100)		 null,
   barrier			varchar(100)		 null,
   underlyinginstrumentmaturity		varchar(100)		 null,
   uppertranche			varchar(100)		 null,
   lowtranche			varchar(100)		 null,
   impliedcorrelation		varchar(100)		 null,	
   underlyingspread 		varchar(100)		 null,
   recoveryrate			varchar(100)		 null,
   underlyingspreadduration	varchar(100)		 null,
   underlyingindex		varchar(100)		 null,
    sectionname			varchar(100)		 null,
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		  Varchar(50)          not null DEFAULT SUSER_NAME(),
   [BatchDate]			Date				Not Null 
)



create table Stg.ErrorMarshallWace (
   
   [FileName]		Varchar(100)		not null,
   [FilePath]		Varchar(100)		not null,
   [TabName]            varchar(100)		not null,
   TradeDate		varchar(100)		 null,
   SEDOL		varchar(100)		 null,
   ISIN			varchar(100)		 null,
   CUSIP		varchar(100)		 null,
   Ticker		varchar(100)		 null,
   Security		varchar(100)		 null,
   InstrumentType	varchar(100)		 null,	
   LocalCcy		varchar(100)		 null,
   Position		varchar(100)		 null,
   PriceLocal		varchar(100)		 null,
   PriceUSD		varchar(100)		 null,
   MarketValueLocal	varchar(100)		 null,	
   MarketValueUSD	varchar(100)		 null,	
   DeltaAdjustedNotionalExposureUSD	varchar(100)		 null,
   Sector		varchar(100)		 null,
   Industry		varchar(100)		 null,
   Country		varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		Varchar(50)          not null DEFAULT SUSER_NAME(),
   [BatchDate]			Date				Not Null  
   
)

CREATE TABLE Stg.ErrorTenorTnc (
	[FileName]									Varchar(100)		not null,
	[FilePath]									Varchar(100)		not null,
	[TabName]									Varchar(100),
	[As Of Date Recent] 						Varchar(100),
	[Account Number] 							Varchar(100),
	[Cusip] 									Varchar(100),
	[Description] 								Varchar(100),
	[Dated Date] 								Varchar(100),
	[Maturity Date] 							Varchar(100),
	[Comp Sec Type Code]						Varchar(100),
	[Comp Sec Type Desc]						Varchar(100),
	[Currency of Settlement Code]      			Varchar(100),
	[Coupon] 									Varchar(100),
	[Par] 										Varchar(100),
	[Payment Frequency Code] 					Varchar(100),
	[Payment Frequency Description] 			Varchar(100),
	[Option Type Desc] 							Varchar(100),
	[Option Broker] 							Varchar(100),
	[Option Broker Name] 						Varchar(100),
	[Ref Entity Name] 							Varchar(100),
	[Ref Entity ID]								Varchar(100),
	[Ref Tranche Name]							Varchar(100),
	[Ref Tranche ID] 							Varchar(100),
	[Interest Payment Method Description] 		Varchar(100),
	[Maturity Date of Underlying Cusip] 		Varchar(100),
	[Current Coupon of Underlying Cusip]		Varchar(100),
	[Accrual Type Cd of Underlying Cusip]		Varchar(100),
	[Dated Date of Underlying Cusip] 			Varchar(100),
	[Int Method Cd Desc of Underlying]			Varchar(100),
	[Pmt Freq Code of Underlying Cusip]			Varchar(100),
	[Pmt Freq Description] 						Varchar(100),
	[Tranche Coupon] 							Varchar(100),
	[Points Upfront] 							Varchar(100),
	[Type] 										Varchar(100),
	[Buy/ Sell Protection] 						Varchar(100),
	[Attachment Point] 							Varchar(100),
	[Detachment Point] 							Varchar(100),
	[Original Tranche]							Varchar(100),
	[Adjustment Factor]							Varchar(100),
	[Underlying Base Correlation]				Varchar(100),
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
	CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)


CREATE TABLE Stg.ErrorTenorHoldings (
	[FileName]									Varchar(100)		not null,
	[FilePath]									Varchar(100)		not null,
	[TabName]									Varchar(100),
	[As Of Date Recent] 						Varchar(100),
	[Account Number] 							Varchar(100),
	[Cusip] 									Varchar(100),
	[Description] 								Varchar(100),
	[Dated Date] 								Varchar(100),
	[Maturity Date] 							Varchar(100),
	[Comp Sec Type Code]						Varchar(100),
	[Comp Sec Type Desc]						Varchar(100),
	[Currency of Settlement Code]      			Varchar(100),
	[Coupon] 									Varchar(100),
	[Par] 										Varchar(100),
	[Payment Frequency Code] 					Varchar(100),
	[Payment Frequency Description] 			Varchar(100),
	[Option Type Desc] 							Varchar(100),
	[Option Broker] 							Varchar(100),
	[Option Broker Name] 						Varchar(100),
	[Ref Entity Name] 							Varchar(100),
	[Ref Entity ID]								Varchar(100),
	[Ref Tranche Name]							Varchar(100),
	[Ref Tranche ID] 							Varchar(100),
	[Interest Payment Method Description] 		Varchar(100),
	[Maturity Date of Underlying Cusip] 		Varchar(100),
	[Current Coupon of Underlying Cusip]		Varchar(100),
	[Accrual Type Cd of Underlying Cusip]		Varchar(100),
	[Dated Date of Underlying Cusip] 			Varchar(100),
	[Int Method Cd Desc of Underlying]			Varchar(100),
	[Pmt Freq Code of Underlying Cusip]			Varchar(100),
	[Pmt Freq Description] 						Varchar(100),
	[Tranche Coupon] 							Varchar(100),
	[Points Upfront] 							Varchar(100),
	[Type] 										Varchar(100),
	[Buy/ Sell Protection] 						Varchar(100),
	[Attachment Point] 							Varchar(100),
	[Detachment Point] 							Varchar(100),
	[Adjustment Factor]							Varchar(100),
	[Underlying Base Correlation]				Varchar(100),
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
	CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)

CREATE TABLE Stg.ErrorBNYMonthly (
[FileName]		Varchar(100)		not null,
    [FilePath]		Varchar(100)		not null,
    [TabName]                      varchar(100),
[Reporting Account Number] varchar(100),
[Reporting Account Name] varchar(100),
[Source Account Number] varchar(100),
[Source Account Name] varchar(100),
[Begin Date] varchar(100),
[End Date] varchar(100),
[Report ID] varchar(100),
[Base Currency] varchar(100),
[Opening Balance] varchar(100),
[Closing Balance] varchar(100),
[Contributions] varchar(100),
[Received from Plan] varchar(100),
[Distributed to Plan] varchar(100),
[Benefit Payments] varchar(100),
[Direct Expense] varchar(100),
[Transfers In] varchar(100),
[Transfers Out] varchar(100),
[Dividend/Interest Income] varchar(100),
[Other Income] varchar(100),
[Realized Gain/Loss] varchar(100),
[Unrealized Gain/Loss] varchar(100),
[Status] varchar(100),
[Acctg Status Update Date] varchar(100),
[Acctg Status Update Time (EST)] varchar(100),
[Calculation 1] varchar(100),
[Calculation 2] varchar(100),
ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)

CREATE TABLE Stg.ErrorMgrTNCRM (
    [FileName]		Varchar(100)		not null,
    [FilePath]		Varchar(100)		not null,
    [TabName]                      varchar(100),
[Report Date] varchar(100),
[FundCode] varchar(100),
[FundDescription] varchar(100),
[Instrument type] varchar(100),
[Instrument Description] varchar(100),
[SecurityName] varchar(100),
[RiskMetricsID] varchar(100),
[ISIN] varchar(100),
[SEDOL] varchar(100),
[CUSIP] varchar(100),
[TICKER] varchar(100),
[F12] varchar(100),
[F13] varchar(100),
[SECID] varchar(100),
[ACID] varchar(100),
[CaliberID] varchar(100),
[Country] varchar(100),
[FXrate] varchar(100),
[LocalCurrency] varchar(100),
[BaseCurrency] varchar(100),
[Base Price] varchar(100),
[Local Price] varchar(100),
[BaseCostPrice] varchar(100),
[Local Market Value] varchar(100),
[Base Market Value] varchar(100),
[BaseDailyPL] varchar(100),
[LocalDailyPL] varchar(100),
[LocalWeekToDatePL] varchar(100),
[BaseWeekToDatePL] varchar(100),
[LocalMonthToDatePL] varchar(100),
[BaseMonthToDatePL] varchar(100),
[ClearerCode] varchar(100),
[ClearerDescription] varchar(100),
[CounterpartyCode] varchar(100),
[CounterpartyDescription] varchar(100),
[Trader] varchar(100),
[Trader Description] varchar(100),
[Sector] varchar(100),
[Sector Description] varchar(100),
[F40] varchar(100),
[StrategyCode] varchar(100),
[Strategy Description] varchar(100),
[ClientTradeId] varchar(100),
[ClientSecurityId] varchar(100),
[ClientCode] varchar(100),
[ClientDescription] varchar(100),
[FundNAV] varchar(100),
[Quantity] varchar(100),
[BaseUnrealizedGainLoss] varchar(100),
[LocalUnrealizedGainLoss] varchar(100),
[Base Total Cost] varchar(100),
[Local Total Cost] varchar(100),
[LocalCostPrice] varchar(100),
[F54] varchar(100),
[Smtype] varchar(100),
[WSO LoanXID] varchar(100),
[RedCode] varchar(100),
[Maturity Date] datetime,
[Coupon] varchar(100),
[PaymentFrequency] varchar(100),
[OccCode] varchar(100),
[LIN] varchar(100),
[LoanXID] varchar(100),
[UnderlyingSec_SecurityName] varchar(100),
[UnderlyingSec_RiskMetricsID] varchar(100),
[UnderlyingSec_ISIN] varchar(100),
[UnderlyingSec_SEDOL] varchar(100),
[UnderlyingSec_CUSIP] varchar(100),
[UnderlyingSec_TICKER] varchar(100),
[UnderlyingSec_RIC] varchar(100),
[UnderlyingSec_OccCode] varchar(100),
[UnderlyingSec_LIN] varchar(100),
[UnderlyingSec_LoanxID] varchar(100),
[UnderlyingSec_RedCode] varchar(100),
[UnderlyingSec_Secid] varchar(100),
[ContractSize] varchar(100),
[CallOrPut] varchar(100),
[StrikePrice] varchar(100),
[OptionExerciseType] varchar(100),
[ExpiryDate] datetime,
[InstrumentID] varchar(100),
[EventBeenTriggered] varchar(100),
[PayAtHit or Expiration] varchar(100),
[SingleDoubleCd] varchar(100),
[SingleBarrierTypeCd] varchar(100),
[UpperBarrierLevel] varchar(100),
[UpperBarrierRebate] varchar(100),
[LowerBarrierLevel] varchar(100),
[LowerBarrierRebate] varchar(100),
[Ccy2] varchar(100),
[Quantity2] varchar(100),
[ProductType] varchar(100),
[RMEI Name] varchar(100),
[PRODUCT Type] varchar(100),
[RM Contract] varchar(100),
[Unit_of_calc] varchar(100),
[Base_Accrued_Income] varchar(100),
[RepoIssueDate] varchar(100),
[RepoFirstAccrualDate] varchar(100),
[RepoFirstPaymentDate] varchar(100),
[RepoDayCountMethod] varchar(100),
[ob_receiveCurrency] varchar(100),
[ob_payEndDate] varchar(100),
[ob_receiveEndDate] varchar(100),
[CdsPremiumCouponRate] varchar(100),
[CdsPremiumFrequency] varchar(100),
[ob_payYieldBasis] varchar(100),
[ob_receiveYieldBasis] varchar(100),
[ob_payStartDate] varchar(100),
[ob_receiveStartDate] varchar(100),
[ob_payRollType] varchar(100),
[ob_receiveRollType] varchar(100),
[FirstCouponDate1] varchar(100),
[FirstCouponDate2] varchar(100),
[ob_payFixingsMade] varchar(100),
[ob_receiveFixingsMade] varchar(100),
[ResetFrequencyCode1] varchar(100),
[ResetFrequencyCode2] varchar(100),
[ob_payReferenceRate] varchar(100),
[ob_receiveReferenceRate] varchar(100),
[ResetDate1] varchar(100),
[ResetDate2] varchar(100),
[ob_payResetBasis] varchar(100),
[ob_receiveResetBasis] varchar(100),
[ResetRate1] varchar(100),
[ResetRate2] varchar(100),
[ob_payCompoundType] varchar(100),
[ob_receiveCompoundType] varchar(100),
[premiumamount] varchar(100),
[premiumcurrency] varchar(100),
[ob_payFloatingOffset] varchar(100),
[ob_receiveFloatingOffset] varchar(100),
[DateConventionCode1] varchar(100),
[DateConventionCode2] varchar(100),
[StubCompoundingCode1] varchar(100),
[StubCompoundingCode2] varchar(100),
[ob_fixedRate] varchar(100),
[CapFloorCode] varchar(100),
[PayReceiveCode] varchar(100),
[ISSUER] varchar(100),
[ExchangePrincipalCode] datetime,
[Volatility2] varchar(100),
[Restructuring] varchar(100),
[Seniority] varchar(100),
[BBGlobalID] varchar(100),
[GM Pay Quantity] varchar(100),
[GM Receive Quantity] varchar(100),
[af_mosweffectiveDate] varchar(100),
[af_moswmaturityDate] varchar(100),
[CapReference] varchar(100),
[CMSFrequency] varchar(100),
[Formula Type] varchar(100),
[Constant1] varchar(100),
[Constant2] varchar(100),
[Constant3] varchar(100),
[Constant4] varchar(100),
[Constant5] varchar(100),
[af_moswreceiverRateFrequency] varchar(100),
[UnderlyingCaliberID] varchar(100),
[SubProductTypeDesc] varchar(100),
[UnderlyingProductType] varchar(100),
[FX Option Type] varchar(100),
[ID_BB_Unique] varchar(100),
[ob_payCurrency] varchar(100),
[ob_payDcPaymentDateAdjust] varchar(100),
[ob_receiveDcPaymentDateAdjust] varchar(100),
[ob_exchangePrincipals] varchar(100),
[af_moswpaymentRateFrequency] varchar(100),
[ob_payDcFixingDateOffset] varchar(100),
[ob_receiveDcFixingDateOffset] varchar(100),
[ob_payPrincipal] varchar(100),
[ob_receivePrincipal] varchar(100),
[ob_fixedLegType] varchar(100),
[af_moswpaymentFrequency] varchar(100),
[ob_maturityDate] varchar(100),
[af_moswdayCountConvention] varchar(100),
[af_moswpaymentDateAdjust] varchar(100),
[af_moswlegReferenceRate] varchar(100),
[af_moswresetFrequency] varchar(100),
[af_moswfixingDateOffset] varchar(100),
[af_moswdayCountConvention2] varchar(100),
[af_moswfixedRate2] varchar(100),
[af_moswpaymentDateAdjust2] varchar(100),
[af_moswpaymentFrequency2] varchar(100),
[client product code] varchar(100),
[UnderlyingSec_ID_BB_Global] varchar(100),
[UnderlyingSec_ID_BB_Unique] varchar(100),
[ob_counterparty] varchar(100),
[Date of Option Premium] varchar(100),
[PL Clearer] varchar(100),
ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)

CREATE TABLE Stg.ErrorBNYHoldings (
    [FileName]		Varchar(100)		not null,
    [FilePath]		Varchar(100)		not null,
    [TabName]            varchar(100),
    [Reporting Account Number]  varchar(100)		 null,
    [Reporting Account Name] 	varchar(100)		 null,
    [Source Account Number] 	varchar(100)		 null,
    [Source Account Name] 	varchar(100)		 null,
    [Client Entity] 		varchar(100)		 null,
    [Holdings As Of Date] 	varchar(100)		 null,
    [Mellon Security ID] 	varchar(100)		 null,
    [Cusip] 			varchar(100)		 null,
    [ISIN] 			varchar(100)		 null,
    [Sedol] 			varchar(100)		 null,
	[Loan ID] varchar(100),
	[Bloomberg Global ID - Global] varchar(100),
	[Bloomberg Global ID - Domestic] varchar(100),
	[Bloomberg Global ID - Alternative Global] varchar(100),
	[Ticker with yellow key] varchar(100),
	[Ticker with exchange code] varchar(100),
	[Security Description1] varchar(100),
	[Security Description2] varchar(100),
	[Asset Category Description] varchar(100),
	[Asset Mix Category] varchar(100),
	[Asset Mix Description] varchar(100),
	[Asset Type Code] varchar(100),
	[Asset Type Description] varchar(100),
	[Shares] varchar(100),
	[Price Scale] varchar(100),
	[Price Type] varchar(100),
	[Holdings Price Local] varchar(100),
	[Holdings Price Base] varchar(100),
	[Local Cost] varchar(100),
	[Base Cost] varchar(100),
	[Local Investment Gain/Loss] varchar(100),
	[Base Investment Gain/Loss] varchar(100),
	[Base Unrealized Gain/Loss] varchar(100),
	[Local Market Value] varchar(100),
	[Local Notional Cost] varchar(100),
	[Local Notional Market Value] varchar(100),
	[Base Notional Cost] varchar(100),
	[Base Notional Market Value] varchar(100),
	[Base Market Value] varchar(100),
	[Future Type] varchar(100),
	[Future Type Description] varchar(100),
	[Futures Asset Type Code] varchar(100),
	[Local Currency Code] varchar(100),
	[Option Maturity Month] varchar(100),
	[Option Maturity Month Number] varchar(100),
	[Option Position Type] varchar(100),
	[Original Face] varchar(100),
	[Pay Date] varchar(100),
	[YTM At Market] varchar(100),
	[Underlying Country of Issue] varchar(100),
	[Country Of Domicile Code] varchar(100),
	[Country Of Domicile Name] varchar(100),
	[Country Of Incorporation Code] varchar(100),
	[Country Of Incorporation Name] varchar(100),
	[Country Of Risk Code] varchar(100),
	[Country Of Risk Name] varchar(100),
	[Country of Issue Code] varchar(100),
	[Country of Issue Name] varchar(100),
	[Current Strike Price] varchar(100),
	[Derivative Type] varchar(100),
	[Expire Date] varchar(100),
	[First Pay Date - Accrual Date] varchar(100),
	[Frequency Requirement] varchar(100),
	[Issuer Code] varchar(100),
	[Issuer Name] varchar(100),
	[LEI Entity Form] varchar(100),
	[Legal Entity Identifier] varchar(100),
	[Maturity Date] varchar(100),
	[Original Strike Price] varchar(100),
	[Payment Frequency] varchar(100),
	[Payment Frequency Desc] varchar(100),
	[Price Source] varchar(100),
	[Underlying ISIN] varchar(100),
	[Underlying Loan ID] varchar(100),
	[Underlying SEDOL] varchar(100),
	[Underlying Security Description 1] varchar(100),
	[Underlying Security Description 2] varchar(100),
	[Underlying Security ID] varchar(100),
	[Underlying Ticker] varchar(100),
	[Underlying VALOREN] varchar(100),
	[S&P Issue Quality Code] varchar(100),
	[S&P Issue Quality Rating] varchar(100),
	[Moody's Issue Quality Code] varchar(100),
	[Moody's Issue Quality Rating] varchar(100),
	[Fitch Issue Quality Code] varchar(100),
	[Fitch Issue Quality Rating] varchar(100),
	[BNYM Classification - Category] varchar(100),
	[BNYM Classification - Segment] varchar(100),
	[Bloomberg Group] varchar(100),
	[Bloomberg Industry Sector] varchar(100),
	[Bloomberg Industry Sub-Group] varchar(100),
	[Bloomberg Market Sector] varchar(100),
	[Current Yield] varchar(100),
	[Modified Duration] varchar(100),
	[Option Adjusted Duration] varchar(100),
	[Yield to Maturity] varchar(100),
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
	CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)


CREATE TABLE Stg.ErrorBNYCFReport (
	[FileName]									Varchar(100)		not null,
	[FilePath]									Varchar(100)		not null,
	[TabName]									Varchar(100),
	
	[Reporting Account Number]					Varchar(100),
	[Reporting Account Name]						Varchar(100),
	[Source Account Number]						Varchar(100),
	[Source Account Name]						Varchar(100),
	[Account Benchmark Number]					Varchar(100),
	[Return Type	Group Label]						Varchar(100),
	[As Of Date]									Varchar(100),
	[Market     Value(M)]							Varchar(100),
	[Percent of Total]							Varchar(100),
	[Month]										Varchar(100),
	[3 Months]									Varchar(100),
	[Fiscal YTD]									Varchar(100),
	[1 Year]										Varchar(100),
	[Annualized 3 Years]							Varchar(100),
	[Annualized 5 Years]						Varchar(100),
	[Annualized ITD]							Varchar(100),
	[Inception Date]						Varchar(100),
	[Reporting Currency]						Varchar(100),
	[Report ID]									Varchar(100),
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
	CreatedDate									datetime             not null DEFAULT GETDATE(),
	CreatedBy									Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate									Date				Not Null
)


go

/*==============================================================*/
/* Table: Stg.ErrorIndexReturns                                 */
/*==============================================================*/
create table Stg.ErrorIndexReturns (
   
   FileName		Varchar(100)		not null,   
   TabName      varchar(100)		not null,   
   FileDate		varchar(100)		 null,
   SYMBOL	 	varchar(100)		 null,
   SHORTNAM		varchar(100)		 null,
   [GROUP]		varchar(100)		 null,
   CCY	 		varchar(100)		 null,
   LONGNAME		varchar(100)		 null,
   NUMFORMAT	varchar(100)		 null,
   [Date]		varchar(100)		 null,	
   Value   		varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate  datetime             not null DEFAULT GETDATE(),
   CreatedBy	Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate	Date				 Not Null   
)


/*==============================================================*/
/* Table: Stg.ErrorPotentialManagers                                 */
/*==============================================================*/
create table Stg.ErrorPotentialManagers (
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName      varchar(100)		not null,
   SYMBOL	 	varchar(100)		 null,
   SHORTNAM		varchar(100)		 null,
   [GROUP]		varchar(100)		 null,
   CCY	 		varchar(100)		 null,
   LONGNAME		varchar(100)		 null,
   NUMFORMAT	varchar(100)		 null,
   [Date]		varchar(100)		 null,	
   Value   		varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate  datetime             not null DEFAULT GETDATE(),
   CreatedBy	Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate	Date				 Not Null   
)

/*==============================================================*/
/* Table: Stg.ErrorPotentialManagersCodeIndex                        */
/*==============================================================*/
create table Stg.ErrorPotentialManagersCodeIndex (
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName      varchar(100)		not null,
   Code	 		varchar(100)		 null,
   Name			varchar(100)		 null,
   [Source]		varchar(100)		 null,   
   CreatedDate  datetime             not null DEFAULT GETDATE(),
   CreatedBy	Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate	Date				 Not Null   
)

/*==============================================================*/
/* Table: Stg.ErrorStoneMiliner                                      */
/*==============================================================*/
create table Stg.ErrorStoneMiliner (
[FileName]					Varchar(100)		not null,
[FilePath]					Varchar(100)		not null,
[TabName]					Varchar(100)		not null,
[PeriodEndDate]				Varchar(100)		not null,
[Instrument Super Type]		Varchar(100)		NULL,
[Instrument Type]			Varchar(100)		NULL,
[Description]				Varchar(100)		NULL,
[Ticker]					Varchar(100)		NULL,
[Instrument Sub Type]		Varchar(100)		NULL,
[ISIN]						Varchar(100)		NULL,
[Issuer]					Varchar(100)		NULL,
[Industry Sector 1]			Varchar(100)		NULL,
[Region]					Varchar(100)		NULL,
[Country of Issue]			Varchar(100)		NULL,
[Investment Ccy]			Varchar(100)		NULL,
[Long/Short Indicator]		Varchar(100)		NULL,
[Number of Contracts]		Varchar(100)		NULL,
[Contract Multiplier]		Varchar(100)		NULL,
[Strike]					Varchar(100)		NULL,
[MaturityExpiration]		Varchar(100)		NULL,
[Notional (USD)]			Varchar(100)		NULL,
[Market Value (USD)]		Varchar(100)		NULL,
[Accrued Interest (USD)]	Varchar(100)		NULL,
[Net Market Value]			Varchar(100)		NULL,
ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
CreatedDate					Datetime             not null DEFAULT GETDATE(),
CreatedBy					Varchar(50)          not null DEFAULT SUSER_NAME(),
BatchDate					Date				Not Null
)

/*==============================================================*/
/* Table: Stg.ErrorAssetAllocation                                   */
/*==============================================================*/
create table Stg.ErrorAssetAllocation (
[FileName]					Varchar(100)		not null,
[FilePath]					Varchar(100)		not null,
[TabName]					Varchar(100)		not null,
[Valuation_Date]			Varchar(100)		NULL,
[Period_Date]				Varchar(100)		NULL,
[Parent_Client_ID]			Varchar(100)		NULL,
[Bench_ID]					Varchar(100)		NULL,
[Level 1]					Varchar(100)		NULL,
[Level 2]					Varchar(100)		NULL,
[Level 3]					Varchar(100)		NULL,
[Level 4]					Varchar(100)		NULL,
[Level 5]					Varchar(100)		NULL,
[Wgt]						Varchar(100)		NULL,
ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
CreatedDate					Datetime             not null DEFAULT GETDATE(),
CreatedBy					Varchar(50)          not null DEFAULT SUSER_NAME(),
BatchDate					Date				Not Null
)

/*==============================================================*/
/* Table: Stg.ErrorEuroDollarSwapCurve                               */
/*==============================================================*/
create table Stg.ErrorEuroDollarSwapCurve (
[FileName]					Varchar(100)		not null,
[FilePath]					Varchar(100)		not null,
[TabName]					Varchar(100)		not null,
[Valuation_Date]			Varchar(100)		NULL,
[Reference]					Varchar(100)		NULL,
[Month]						Varchar(100)		NULL,
[Expiration_Date]			Varchar(100)		NULL,
[Time]						Varchar(100)		NULL,
[Price]						Varchar(100)		NULL,
[Yield]						Varchar(100)		NULL,
[DF]						Varchar(100)		NULL,
[Zero Rate]					Varchar(100)		NULL,
ErrorId				Varchar(100)		 null,
ErrorDescription		Varchar(Max)		 null,
IsRecordModified	    Varchar(10)			null DEFAULT 'No',
CreatedDate					Datetime             not null DEFAULT GETDATE(),
CreatedBy					Varchar(50)          not null DEFAULT SUSER_NAME(),
BatchDate					Date				Not Null
)

/*==============================================================*/
/* Table: Stg.ErrorIRSurface											*/
/*==============================================================*/
create table Stg.ErrorIRSurface (
[FileName]					Varchar(100)		not null,
[FilePath]					Varchar(100)		not null,
[TabName]					Varchar(100)		not null,
[BBID]						Varchar(100)		NULL,	
[Name]						Varchar(100)		NULL,	
[Date]						Varchar(100)		NULL,	
[Expiry]					Varchar(100)		NULL,	
[Tenor]						Varchar(100)		NULL,	
[Surface]					Varchar(100)		NULL,
ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
CreatedDate					Datetime             not null DEFAULT GETDATE(),
CreatedBy					Varchar(50)          not null DEFAULT SUSER_NAME(),
BatchDate					Date				Not Null
)


/*==============================================================*/
/* Table: Stg.ErrorTenorPositions                                      */
/*==============================================================*/
create table Stg.ErrorTenorPositions (


	FileName		Varchar(100)		not null,
	FilePath		Varchar(100)		not null,
	[TabName]		Varchar(100)		null,
	[DATE]							Varchar(100),
	[SECURITY SYMBOL]					Varchar(100),
	[SECURITY SYMBOL TYPE]			Varchar(100),
	[PORTFOLIO NAME]]				Varchar(100),
	[SECURITY NAME]					Varchar(100),
	[Quantity						Varchar(100),
	[PRICE]							Varchar(100),
	[CURRENCY ISO]					Varchar(100),
	[COST]							Varchar(100),
	[TOTAL_COST]						Varchar(100),
	[ACCRUED INTEREST]				Varchar(100),
	[COUPON INCOME]					Varchar(100),
	[PRINCIPAL PAYDOWN]				Varchar(100),
	[FX_Rate]							Varchar(100),
	[MARKET_VALUE_USD]]				Varchar(100),
	[MARKET_VALUE_LOC				Varchar(100),
	[NOTIONAL_USD]					Varchar(100),
	[NOTIONAL_LOC]					Varchar(100),
	[UNREALIZED_G_L]					Varchar(100),
	[ASSET CLASS]						Varchar(100),
	[ASSET TYPE]						Varchar(100),
	[UNDERLYING ID]					Varchar(100),
	[PRICE TYPE]						Varchar(100),
	[STRATEGY GROUP]					Varchar(100),
	[COUNTRY]							Varchar(100),
	[ISSUER COUNTRY]					Varchar(100),
	[SECTOR]							Varchar(100),
	[INDUSTRY]						Varchar(100),
	[ISSUER NAME]						Varchar(100),
	[ISSUER ID]						Varchar(100),
	[COUPON RATE]						Varchar(100),
	[MATURITY DATE]					Varchar(100),
	[YEARS TO MATURITY]				Varchar(100),
	[COUPON FREQUENCY]]				Varchar(100),
	[DAY COUNT CONVENTION			Varchar(100),
	[CURRENT YIELD]					Varchar(100),
	[YIELD TO WORST]				Varchar(100),
	[YIELD TO MATURITY]				Varchar(100),
	[MODIFIED DURATION]				Varchar(100),
	[MODIFIED TO WORST]				Varchar(100),
	[ISSUER RATINGS]					Varchar(100),
	[ISSUER (S&P/Fitch/Moodys)]		Varchar(100),
	[STRIKE PRICE]					Varchar(100),
	[EXPIRATION DATE]					Varchar(100),
	[IMPLIED VOLATILITY]				Varchar(100),
	[DELTA]							Varchar(100),
	[GAMMA]							Varchar(100),
	[RHO]								Varchar(100),
	[VEGA]							Varchar(100),
	[THETA]						Varchar(100),
	[PRICE_FACTOR]					Varchar(100),
	[OPTION  ISO Code]				Varchar(100),
	ErrorId				Varchar(100)		 null,
	ErrorDescription		Varchar(Max)		 null,
	IsRecordModified	    Varchar(10)			null DEFAULT 'No',
	CreatedDate          datetime             not null DEFAULT GETDATE(),
	CreatedBy			Varchar(50)          not null DEFAULT SUSER_NAME(),
	BatchDate			Date				Not Null,
)

/*==============================================================*/
/* Table: Stg.ErrorTenorTncOPT                                     */
/*==============================================================*/

CREATE TABLE Stg.ErrorTenorTncOPT (

    [FileName]		Varchar(100)				not null,
    [FilePath]		Varchar(100)				not null,
    [TabName]           Varchar(100)				not null,
    [As Of Date Recent] Varchar(100)		 null,
[Account] Varchar(100)		null,
[ID Symbol] Varchar(100)		null,
[Description] Varchar(100)		null,
[Exercise Type] Varchar(100)		null,
[Date] Varchar(100)		null,
[Maturity Date] Varchar(100)		null,
[Comp Sec Type Code] Varchar(100)		null,
[Comp Sec Type Desc] Varchar(100)		null,
[Currency Code] Varchar(100)		null,
[Currency of Settlement Desc] Varchar(100)		null,
[# of Contracts Held] float,
[Notional Market Value] float,
[Dividend Yield] Varchar(100)		null,
[Strike Price] float,
[Strike Curr Code] Varchar(100)		null,
[Contract Size] float,
[Reference ID] Varchar(100)		null,
[Put Call Ind Desc] Varchar(100)		null,
[Option Broker] Varchar(100)		null,
[Option Broker Name] Varchar(100)		null,
[Option  Premium] float,
[Option Premium FX Code] Varchar(100)		null,
[Implied Volatility] float,
[Barrier Description] Varchar(100)		null,
[Upper Barrier Type] Varchar(100)		null,
[Hit_Upper_Barrier_Date] Varchar(100)		null,
[Upper_Barrier] Varchar(100)		null,
[Upper_Barrier_Rebate] Varchar(100)		null,
[Lower_Barrier Description] Varchar(100)		null,
[Lower_Barrier Type] Varchar(100)		null,
[Hit_Lower_Barrier_Date] Varchar(100)		null,
[Lower_Barrier] Varchar(100)		null,
[Lower_Barrier_Rebate] Varchar(100)		null,
ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
 [CreatedDate]          datetime             not null DEFAULT GETDATE(),
   [CreatedBy]		Varchar(50)          not null DEFAULT SUSER_NAME(),   
   [BatchDate]			Date				Not Null  
)

/*==============================================================*/
/* Table: Stg.ErrorEqSurface                                     */
/*==============================================================*/

create table Stg.ErrorEqSurface(
   
   FileName		Varchar(100)		not null,
   FilePath		Varchar(100)		not null,
   TabName              varchar(100)		not null,
   [Security_ID]	 	varchar(100)		 null,
   Moneyness		varchar(100)		 null,
   Tenor		varchar(100)		 null,
   [Type]		varchar(100)		 null,
   Date			varchar(100)		 null,	
   Value   		varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate          datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null   
)

/*==============================================================*/
/* Table: Stg.ErrorMasterETFData                                     */
/*==============================================================*/

CREATE TABLE Stg.ErrorMasterETFData(
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](100) NOT NULL,
	[TabName] [varchar](100) NOT NULL,
	[Sponsor] [varchar](100) NULL,
	[Composite Ticker] [varchar](100) NULL,
	[Composite Name] [varchar](100) NULL,
	[Constituent Ticker] [varchar](100) NULL,
	[Constituent Name] [varchar](500) NULL,
	[Weighting] [varchar](100) NULL,
	[Identifier] [varchar](100) NULL,
	[Date] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[Exchange] [varchar](100) NULL,
	[Total Shares Held] [varchar](100) NULL,
	[Notional Value] [varchar](100) NULL,
	[Market Value] [varchar](100) NULL,
	[Sponsor Sector] [varchar](100) NULL,
	[Last Trade] [varchar](100) NULL,
	[Currency] [varchar](100) NULL,
	[BloombergSymbol] [varchar](100) NULL,
	[BloombergExchange] [varchar](100) NULL,
	[Coupon] [varchar](100) NULL,
	[Maturity] [varchar](100) NULL,
	[Rating] [varchar](100) NULL,
	[Type] [varchar](100) NULL,
	[SharesOutstanding] [varchar](100) NULL,
	[MarketCap] [varchar](100) NULL,
	[Earnings] [varchar](100) NULL,
	[PE Ratio] [varchar](100) NULL,
	[Face] [varchar](100) NULL,
	[eSignalTicker] [varchar](100) NULL,
	[TimeZone] [varchar](100) NULL,
	[DividendAmt] [varchar](100) NULL,
	[LastDividendDate] [varchar](100) NULL,
	[DividendYield] [varchar](100) NULL,
	[RIC] [varchar](100) NULL,
	[FutVal] [varchar](100) NULL,
	[BBSector] [varchar](100) NULL,
	[BBIndustry] [varchar](100) NULL,
	[BBSubIndustry] [varchar](100) NULL,
	[CUSIP] [varchar](100) NULL,
	[ISIN] [varchar](100) NULL,
	[SEDOL] [varchar](100) NULL,
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
	[CreatedDate] [datetime] NOT NULL DEFAULT (GETDATE()),
	[CreatedBy] [varchar](50) NOT NULL DEFAULT (SUSER_NAME()),
	[BatchDate] [date] NOT NULL
)

/*==============================================================*/
/* Table: Stg.ErrorSwapCurve                                     */
/*==============================================================*/

create table Stg.ErrorSwapCurve(
   
   FileName			Varchar(100)		not null,
   FilePath			Varchar(100)		not null,
   TabName			varchar(100)		not null,
   [Tenor]	 		varchar(100)		 null,
   Name				varchar(100)		 null,   
   [Security_ID]	varchar(100)		 null,
   [Date]			varchar(100)		 null,	
   Value   			varchar(100)		 null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate      datetime             not null DEFAULT GETDATE(),
   CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate		Date				Not Null   
)


/*==============================================================*/
/* Table: Stg.ErrorBroadRidgeTrade                                     */
/*==============================================================*/

create table Stg.ErrorBroadRidgeTrade(
   
    FileName			Varchar(100)		not null,
    FilePath			Varchar(100)		not null,
    TabName			varchar(100)		not null,
    [Transaction ID] Varchar(100)   null,
	[Trade Entry ID] Varchar(100)   null,
	[Canceled] Varchar(100)   null,
	[Trade Date] Varchar(100)   null,
	[Settle Date] Varchar(100)   null,
	[Transaction Type Name] Varchar(100)   null,
	[Trade Entry Type Name] Varchar(100)   null,
	[Action] Varchar(100)   null,
	[Quantity] Varchar(100)   null,
	[Trade Price] Varchar(100)   null,
	[Trade Currency] Varchar(100)   null,
	[Settle Currency] Varchar(100)   null,
	[Trade Notional] Varchar(100)   null,
	[Trade Commission] Varchar(100)   null,
	[Trade Non-implied Other Fees] Varchar(100)   null,
	[Trade Tax] Varchar(100)   null,
	[Trade Total Consideration] Varchar(100)   null,
	[Fund Code] Varchar(100)   null,
	[Custodian Account] Varchar(100)   null,
	[Custodian Code] Varchar(100)   null,
	[Security Type Name] Varchar(100)   null,
	[Security Name] Varchar(100)   null,
	[Security Symbol] Varchar(100)   null,
	[Security Ticker] Varchar(100)   null,
	[Security Cusip] Varchar(100)   null,
	[Security Sedol] Varchar(100)   null,
	[Security Isin] Varchar(100)   null,
	[Security Ric] Varchar(100)   null,
	[Security Red Code] Varchar(100)   null,
	[Underlying Symbol] Varchar(100)   null,
	[Underlying Name] Varchar(100)   null,
	[Underlying Ticker] Varchar(100)   null,
	[Underlying Cusip] Varchar(100)   null,
	[Underlying Sedol] Varchar(100)   null,
	[Underlying Isin] Varchar(100)   null,
	[Underlying Ric] Varchar(100)   null,
	[Swap Pay Leg Benchmark 1024] Varchar(100)   null,
	[Swap Receive Leg Benchmark 1025] Varchar(100)   null,
	[Pay Leg Rate 1041] Varchar(100)   null,
	[Receive Leg Rate 1042] Varchar(100)   null,
	[Pay Leg Country 1043] Varchar(100)   null,
	[Receive Leg Country 1044] Varchar(100)   null,
	[Long Financing Coupon Benchmark Spread 1049] Varchar(100)   null,
	[Short Financing Coupon Benchmark Spread 1050] Varchar(100)   null,
	[Pay Leg Base Rate Day Offset 1114] Varchar(100)   null,
	[Receive Leg Base Rate Day Offset 1115] Varchar(100)   null,
	[Pay Leg Type Name 1165] Varchar(100)   null,
	[Receive Leg Type Name 1166] Varchar(100)   null,
	[Security Is Put 1028] Varchar(100)   null,
	[Security Strike Price 1029] Varchar(100)   null,
	[Security Expiration Date 1030] Varchar(100)   null,
	[Security Payment Frequency 1072] Varchar(100)   null,
	[Security OCC Code 1151] Varchar(100)   null,
	[Paying Leg Last Coupon Change Date 1091] Varchar(100)   null,
	[Receiving Leg Last Coupon Change Date 1092] Varchar(100)   null,
	ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
    CreatedDate      datetime             not null DEFAULT GETDATE(),
    CreatedBy		Varchar(50)          not null DEFAULT SUSER_NAME(),
    BatchDate		Date				Not Null   
)


/*==============================================================*/
/* Table: Stg.ErrorCompositeAsset                                    */
/*==============================================================*/

create table Stg.ErrorCompositeAsset(
   
   FileName				Varchar(100)		not null,
   FilePath				Varchar(100)		not null,
   TabName				Varchar(100)		not null,
   [Composite_Asset_ID] Varchar(100)			null,
   [Security_ID]		 Varchar(100)			null,
   [Portfolio_ID]		Varchar(100)			null,
   [Composite_ID]		Varchar(100)			null,
   ErrorId				Varchar(100)		 null,
   ErrorDescription		Varchar(Max)		 null,
   IsRecordModified	    Varchar(10)			null DEFAULT 'No',
   CreatedDate		 datetime             not null DEFAULT GETDATE(),
   CreatedBy			Varchar(50)          not null DEFAULT SUSER_NAME(),
   BatchDate			Date				Not Null   
)



GO

 	