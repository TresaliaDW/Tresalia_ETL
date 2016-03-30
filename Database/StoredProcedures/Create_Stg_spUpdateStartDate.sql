/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spUpdateStartDate]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spUpdateStartDate]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spUpdateStartDate]
Go

/****** Object:  StoredProcedure [stg].[spUpdateStartDate]    Script Date: 3/23/2016 10:56:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [stg].[spUpdateStartDate]
		@PackageName Varchar(255),
		@ParamKey Varchar(100)       
As
Begin
    Set Nocount On

	Declare @MaxJobSequenceNo Int,
			@Batchdate DateTime
    
	Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where JobStatus = 'COMPLETED' AND PackageName = @PackageName)

	If (@MaxJobSequenceNo is Not Null)
	Begin
		Select @Batchdate = rtrim(ltrim(RunDate)) FROM Stg.TresaliaJobLog Where JobStatus = 'COMPLETED' And JobSequenceNo = @MaxJobSequenceNo;
	End
	Else If (@MaxJobSequenceNo is Null)
	Begin
		Select @MaxJobSequenceNo = Max(JobSequenceNo) FROM Stg.TresaliaJobLog Where PackageName = @PackageName
		
		Select @Batchdate = rtrim(ltrim(RunDate)) FROM Stg.TresaliaJobLog Where JobSequenceNo = @MaxJobSequenceNo;		
	End
	
    Update Stg.TresaliaParams 
	Set 
	ParamValue = CONVERT(VARCHAR(50), @Batchdate, 101)
    Where 
		ParamType = 'Config'
	AND ParamKey = @ParamKey
       
End

GO


