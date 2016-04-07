
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
	@ExecutionStatus Varchar(1),
	@ParamJobNameKey Varchar(255) ,			
	@PackageName Varchar(255),
	@JobID Int OUTPUT,	
	@BatchDate DateTime OUTPUT
	
As
Begin
    Set Nocount On
	DECLARE @JobName Varchar(255) = NULL			
	DECLARE @ParamType AS VARCHAR(100) = 'Config'
	Declare @MaxJobSequenceNo Int

	Select @JobName = ParamValue from stg.TresaliaParams where ParamType = @ParamType and ParamKey = @ParamJobNameKey
	

	If @JobName is NULL or @JobName = '' 
	Begin
		Set @JobName = 'LoadDataWarehouse_Tresalia'
	End

	If (@ExecutionStatus = 'S')
	Begin
		INSERT INTO Stg.JobIdHistory(JobName, CreatedDate, CreatedBy, BatchDate)
		VALUES (@JobName, GETDATE(), SUSER_NAME(), GETDATE())

		SELECT @JobID = MAX(JobID)	FROM Stg.JobIdHistory  WHERE JobName = @JobName

		SELECT @BatchDate = CAST(BatchDate AS DATETIME)
		FROM Stg.JobIdHistory  WHERE JobID = @JobID

		INSERT INTO Stg.TresaliaJobLog (JobId,PackageName, JobName,JobStatus,RunDate, Starttime)
		VALUES (@JobID,@PackageName, @JobName,'STARTED', GETDATE(), GETDATE())
	End

	If (@ExecutionStatus = 'U')
	Begin				
		SELECT @JobID = MAX(JobID) FROM Stg.JobIdHistory  WHERE JobName = @JobName

		INSERT INTO Stg.TresaliaJobLog (JobId,PackageName, JobName,JobStatus,RunDate, EndDate)
		VALUES (@JobID,@PackageName, @JobName,'COMPLETED', GETDATE(), GETDATE())

		--Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where PackageName = @PackageName AND JobName = @JobName)
		--Update Stg.TresaliaJobLog 
		--Set JobStatus = 'COMPLETED'
		--,	EndDate = GetDate()
		--Where 
		--	JobSequenceNo = @MaxJobSequenceNo
		--And PackageName = @PackageName
		--And JobName = @JobName
	End
	ELSE If (@ExecutionStatus = 'E')
	Begin
		SELECT @JobID = MAX(JobID) FROM Stg.JobIdHistory  WHERE JobName = @JobName

		INSERT INTO Stg.TresaliaJobLog (JobId,PackageName, JobName,JobStatus,RunDate, Starttime, EndDate)
		VALUES (@JobID,@PackageName, @JobName,'ERROR', GETDATE(), GETDATE(), GETDATE())
				
		--Set @MaxJobSequenceNo = (Select MAX(JobSequenceNo) From Stg.TresaliaJobLog Where PackageName = @PackageName AND JobName = @JobName)
		
		--If(@MaxJobSequenceNo is Not Null)
		--Begin
		--	Update Stg.TresaliaJobLog
		--	Set JobStatus = 'ERROR'
		--	,	EndDate = GetDate()
		--	Where 
		--		JobSequenceNo = @MaxJobSequenceNo
		--	And PackageName = @PackageName
		--	And JobName = @JobName
		--End
		--Else If(@MaxJobSequenceNo is Null) 
		--Begin
		--	Insert Into Stg.TresaliaJobLog (PackageId,PackageName, JobName,JobStatus,RunDate, Starttime, EndDate)
		--	Values (@PackageID,@PackageName, @JobName,'ERROR', GETDATE(), GETDATE(), GETDATE())
		--End
	End
End


GO


