
---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spGetJobIdAndBatchDate]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spGetJobIdAndBatchDate]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spGetJobIdAndBatchDate]
Go


/****** Object:  StoredProcedure [stg].[spGetJobIdAndBatchDate]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spGetJobIdAndBatchDate]							
	@JobName Varchar(255),
	@JobID Int = 0 OUTPUT,	
	@BatchDate VARCHAR(20) = NULL OUTPUT
	
As
Begin
    Set Nocount On
	
	SET @JobID = (SELECT MAX(JEH.JobId) AS 'JobId' FROM Stg.JobInfo JI 
					INNER JOIN  Stg.JobExecutionHistory JEH ON JI.JobInfoId = JEH.JobInfoId
					WHERE JI.JobName = @JobName 
					AND JEH.JobStatus = 'STARTED'
					AND JEH.BatchDate = JI.BatchDate)

	SET @BatchDate = (SELECT CONVERT(VARCHAR(20), JI.BatchDate, 101) AS 'BatchDate' FROM Stg.JobInfo JI WHERE JI.JobName = @JobName)
End


GO


