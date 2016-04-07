DECLARE @v_JobName VARCHAR(100)
DECLARE @v_JobDescription VARCHAR(100)
SET @v_JobName = 'LoadDataWarehouse_AssetType'
SET @v_JobDescription = 'The job loads the AssetType Excel Sheet Data to Stage and DataWarehouse databases.'


BEGIN TRANSACTION
/************************** DELETE OLD JOB *******************************************/
IF EXISTS (select * FROM msdb.dbo.sysjobs_view where name = @v_JobName)
BEGIN
	EXEC msdb.dbo.sp_delete_job @job_name = @v_JobName, @delete_unused_schedule=1
END

/************************************************************************************/
DECLARE @ReturnCode INT
DECLARE @v_PackageFolderPath VARCHAR(1000)
DECLARE @v_DatabaseName VARCHAR(50)
DECLARE @v_ConfigFilePath VARCHAR(1000)
DECLARE @v_Proxy_Name VARCHAR(100)
DECLARE @v_Command VARCHAR(4000)
DECLARE @v_Owner_Login_Name VARCHAR(255)

SET @ReturnCode = 0
--SET @v_PackageFolderPath='D:\Tresalia\DevTest\Tresalia_ETL\'
--SET @v_ConfigFilePath='D:\Tresalia\DevTest\Tresalia_ETL\Config\'
--SET @v_Proxy_Name='svc-hou-gtr4-dmd_proxy'
SET @v_owner_login_name='cscstgD_DBO'


/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 3/26/2016 4:05:59 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=@v_JobName, 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=@v_JobDescription, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=@v_owner_login_name, 
		@job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

/****** Object:  Step [StartJob]    Script Date: 3/3/2014 4:05:59 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load AssetType ExcelSheet Data to Stg.AssetType', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/FILE "\"D:\Tresalia\DevTest\Tresalia_ETL\Pkg_Tresalia_Excel_Stg_AssetType.dtsx\"" /CHECKPOINTING OFF /REPORTING E', 
		@database_name=N'master', 
		@flags=0
		--@proxy_name=N'CSCD_SSIS_PROXY'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'JobSchedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140228, 
		@active_end_date=99991231, 
		@active_start_time=220000, 
		@active_end_time=235959, 
		@schedule_uid=N'bfa0cf18-ae12-4f0f-8c06-92cfa8b63226'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

COMMIT TRANSACTION
GOTO EndSave

QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION

EndSave:

GO


