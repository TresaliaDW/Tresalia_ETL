
---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spUpdateJobExecutionHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spUpdateJobExecutionHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spUpdateJobExecutionHistory]
Go


/****** Object:  StoredProcedure [stg].[spUpdateJobExecutionHistory]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spUpdateJobExecutionHistory]		
	@ExecutionStatus Varchar(1),				
	@JobName Varchar(255),
	@JobID Int	
As
Begin
    Set Nocount On
	DECLARE @JobInfoId Int = 0

	SET @JobInfoId = (SELECT JobInfoId FROM Stg.JobInfo WHERE JobName = @JobName)

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


