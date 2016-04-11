
---------------------------------------------------------------------
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spCreatePackageExecutionHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spCreatePackageExecutionHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spCreatePackageExecutionHistory]
Go


/****** Object:  StoredProcedure [stg].[spCreatePackageExecutionHistory]    Script Date: 03/21/2016 2:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spCreatePackageExecutionHistory]		
	@ExecutionStatus Varchar(1),				
	@PackageName Varchar(255),
	@JobID Int,	
	@BatchDate VARCHAR(20)
	
As
Begin
    Set Nocount On
	
	If (@ExecutionStatus = 'S')
	Begin		
		INSERT INTO Stg.PackageExecutionHistory (JobId,PackageName, PackageStatus,BatchDate)		
		VALUES (@JobID,@PackageName, 'STARTED', CONVERT(DATE, @BatchDate, 101))			
	End
	
	If (@ExecutionStatus = 'U')
	Begin
		
		INSERT INTO Stg.PackageExecutionHistory (JobId,PackageName, PackageStatus,BatchDate)
		VALUES (@JobID,@PackageName, 'COMPLETED', CONVERT(DATE, @BatchDate, 101))
	End

	If (@ExecutionStatus = 'E')
	Begin
		
		INSERT INTO Stg.PackageExecutionHistory (JobId,PackageName, PackageStatus,BatchDate)
		VALUES (@JobID,@PackageName, 'ERROR', CONVERT(DATE, @BatchDate, 101))
	End
End


GO


