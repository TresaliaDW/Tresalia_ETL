
---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spLogPackageExecutionHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spLogPackageExecutionHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spLogPackageExecutionHistory]
Go


/****** Object:  StoredProcedure [stg].[spLogPackageExecutionHistory]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spLogPackageExecutionHistory]
	@PackageName Varchar(255),
	@PackageID Varchar(255),
	@ExecutionStatus Varchar(1),
	@JobName Varchar(255) = NULL


As
Begin
    Set Nocount On

	--Ading this step as existing SSIS packages will NULL in JobName, the new ones will pass the proper Job Name
	--If JobName passed as NULL, set to default JobName
	If @JobName is NULL or @JobName = '' 
		Begin
		 Set @JobName = 'LoadDataWarehouse_Tresalia'
		End

	Declare @MaxJobSequenceNo Int

	If (@ExecutionStatus = 'S')
	Begin
		Insert Into Stg.TresaliaJobLog (JobId,JobName,JobStatus,RunDate, Starttime)
		Values (@PackageID,@JobName,'STARTED', GETDATE(), GETDATE())
	End

	If (@ExecutionStatus = 'U')
	Begin		
		Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where JobName = @JobName)
		
		Update Stg.TresaliaJobLog 
		Set JobStatus = 'COMPLETED'
		, EndDate = GetDate()
		Where JobSequenceNo = @MaxJobSequenceNo
		And JobName = @JobName
	End
	ELSE If (@ExecutionStatus = 'E')
	Begin		
		Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where JobName = @JobName)
		
		If(@MaxJobSequenceNo is Not Null)
		Begin
			Update Stg.TresaliaJobLog
			Set JobStatus = 'ERROR'
			, EndDate = GetDate()
			Where JobSequenceNo = @MaxJobSequenceNo
			And JobName = @JobName
		End
		Else If(@MaxJobSequenceNo is Null) 
		Begin
			Insert Into Stg.TresaliaJobLog (JobId,JobName,JobStatus,RunDate, Starttime, EndDate)
			Values (@PackageID,@JobName,'ERROR', GETDATE(), GETDATE(), GETDATE())
		End
	End
End


GO


