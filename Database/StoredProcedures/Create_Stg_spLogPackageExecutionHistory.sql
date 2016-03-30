
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
	@PackageID Varchar(255),	
	@PackageName Varchar(255),
	@ParamKey Varchar(255),	
	@ExecutionStatus Varchar(1)
	
As
Begin
    Set Nocount On
	DECLARE @JobName Varchar(255) = NULL
	DECLARE @ParamType AS VARCHAR(100) = 'Config'
	Declare @MaxJobSequenceNo Int

	Select @JobName = ParamValue from stg.TresaliaParams where ParamType = @ParamType and ParamKey = @ParamKey

	If @JobName is NULL or @JobName = '' 
	Begin
		Set @JobName = 'LoadDataWarehouse_Tresalia'
	End

	If (@ExecutionStatus = 'S')
	Begin
		Insert Into Stg.TresaliaJobLog (PackageId,PackageName, JobName,JobStatus,RunDate, Starttime)
		Values (@PackageID,@PackageName, @JobName,'STARTED', GETDATE(), GETDATE())
	End

	If (@ExecutionStatus = 'U')
	Begin		
		Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where PackageName = @PackageName AND JobName = @JobName)
		
		Update Stg.TresaliaJobLog 
		Set JobStatus = 'COMPLETED'
		,	EndDate = GetDate()
		Where 
			JobSequenceNo = @MaxJobSequenceNo
		And PackageName = @PackageName
		And JobName = @JobName
	End
	ELSE If (@ExecutionStatus = 'E')
	Begin		
		Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where PackageName = @PackageName AND JobName = @JobName)
		
		If(@MaxJobSequenceNo is Not Null)
		Begin
			Update Stg.TresaliaJobLog
			Set JobStatus = 'ERROR'
			,	EndDate = GetDate()
			Where 
				JobSequenceNo = @MaxJobSequenceNo
			And PackageName = @PackageName
			And JobName = @JobName
		End
		Else If(@MaxJobSequenceNo is Null) 
		Begin
			Insert Into Stg.TresaliaJobLog (PackageId,PackageName, JobName,JobStatus,RunDate, Starttime, EndDate)
			Values (@PackageID,@PackageName, @JobName,'ERROR', GETDATE(), GETDATE(), GETDATE())
		End
	End
End


GO


