
---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spCreateJobExecutionHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spCreateJobExecutionHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spCreateJobExecutionHistory]
Go


/****** Object:  StoredProcedure [stg].[spCreateJobExecutionHistory]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spCreateJobExecutionHistory]		
	@ExecutionStatus Varchar(1),				
	@JobName Varchar(255),
	@JobID Int = 0 OUTPUT,	
	@BatchDate Varchar(20) = NULL OUTPUT,
	@FileStartDate DateTime = NULL OUTPUT	
As
Begin
    Set Nocount On
	DECLARE @JobInfoId Int = 0

	SET @JobInfoId = (SELECT JobInfoId FROM Stg.JobInfo WHERE JobName = @JobName)

	If (@ExecutionStatus = 'S')
	Begin
		
		SET @FileStartDate = (SELECT FileStartDate FROM Stg.JobInfo WHERE JobName = @JobName)
		SET @BatchDate = (SELECT CONVERT(VARCHAR(20), BatchDate, 101)  FROM Stg.JobInfo WHERE JobName = @JobName)

		INSERT INTO Stg.JobExecutionHistory (JobInfoId, JobStatus, JobStartDate, BatchDate)
		VALUES (@JobInfoId,'STARTED', GETDATE(), CONVERT(DATE, @BatchDate, 101))

		SET @JobID = (SELECT MAX(JobId) FROM Stg.JobExecutionHistory WHERE JobInfoId = @JobInfoId)
	End
	
	If (@ExecutionStatus = 'U')
	Begin
		
		UPDATE Stg.JobExecutionHistory 
		SET JobStatus = 'COMPLETED'
		,	JobEndDate = GETDATE()
		,	UpdatedBy = SUSER_NAME()
		,	UpdatedDate = GETDATE()
		WHERE 
		JobId = @JobID

		UPDATE Stg.JobInfo
		SET FileStartDate = CONVERT(DATE, GETDATE(), 101)
		,	BatchDate = CONVERT(DATE, GETDATE(), 101)
		,	UpdatedBy = SUSER_NAME()
		,	UpdatedDate = GETDATE()
		WHERE 
		JobInfoId = @JobInfoId
	End

	If (@ExecutionStatus = 'E')
	Begin
		
		UPDATE Stg.JobExecutionHistory 
		SET JobStatus = 'ERROR'
		,	JobEndDate = GETDATE()
		,	UpdatedBy = SUSER_NAME()
		,	UpdatedDate = GETDATE()
		WHERE 
		JobId = @JobID

	End
End


GO


