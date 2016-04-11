
---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spUpdatePackageExecutionHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spUpdatePackageExecutionHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spUpdatePackageExecutionHistory]
Go


/****** Object:  StoredProcedure [stg].[spUpdatePackageExecutionHistory]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spUpdatePackageExecutionHistory]		
	@ExecutionStatus Varchar(1),
	@ParamJobNameKey Varchar(255) ,			
	@PackageName Varchar(255),
	@JobID Int,	
	@BatchDate DateTime
	
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

	If (@ExecutionStatus = 'U')
	Begin						
		INSERT INTO Stg.TresaliaJobLog (JobId,PackageName, JobName,JobStatus,RunDate, EndDate)
		VALUES (@JobID,@PackageName, @JobName,'COMPLETED', @BatchDate, GETDATE())
	End
	ELSE If (@ExecutionStatus = 'E')
	Begin
		
		INSERT INTO Stg.TresaliaJobLog (JobId,PackageName, JobName,JobStatus,RunDate, Starttime, EndDate)
		VALUES (@JobID,@PackageName, @JobName,'ERROR', @BatchDate, GETDATE(), GETDATE())		
	End
End


GO


