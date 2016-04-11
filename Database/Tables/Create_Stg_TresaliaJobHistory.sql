if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Stg.JobExecutionHistory') and o.name = 'FK_JobExecutionHistory_JobInfo')
	
	alter table Stg.JobExecutionHistory drop constraint FK_JobExecutionHistory_JobInfo
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Stg.PackageExecutionHistory') and o.name = 'FK_PackageExecutionHistory_JobExecutionHistory')
	
	alter table Stg.PackageExecutionHistory drop constraint FK_PackageExecutionHistory_JobExecutionHistory
go


if exists (select 1 from  sysobjects where  id = object_id('STG.JobInfo') and   type = 'U')
   drop table STG.JobInfo
go

if exists (select 1 from  sysobjects where  id = object_id('STG.JobExecutionHistory') and   type = 'U')
   drop table STG.JobExecutionHistory
go

if exists (select 1 from  sysobjects where  id = object_id('STG.PackageExecutionHistory') and   type = 'U')
   drop table STG.PackageExecutionHistory
go

/*==============================================================*/
/* Table: JobInfo                                        */
/*==============================================================*/
Create Table Stg.JobInfo(
	   JobInfoId		INT Identity(1,1) Not Null PRIMARY KEY,       	   
	   JobName			Varchar(255) Not Null,
	   JobFrequency		Varchar(20) Not Null,
       FileStartDate	Date Not Null,
       BatchDate		Date DEFAULT GETDATE() ,
	   CreatedBy		Varchar(100) NOT NULL DEFAULT SUSER_NAME(),
	   CreatedDate		DateTime NOT NULL DEFAULT GETDATE(),
	   UpdatedBy		Varchar(100) NULL ,
	   UpdatedDate		DateTime NULL      
) 
GO
-----------------------------------------------------------------------------------------------------------
/*==============================================================*/
/* Table: JobExecutionHistory                                        */
/*==============================================================*/
Create Table Stg.JobExecutionHistory(
	   JobId			INT Identity(1,1) Not Null PRIMARY KEY,
	   JobInfoId		INT Not Null,       	   
	   JobStatus		Varchar(255) Null,
	   JobStartDate		DateTime  Null,
	   JobEndDate		DateTime  Null,
       BatchDate		Date NULL,
	   CreatedBy		Varchar(100) NOT NULL DEFAULT SUSER_NAME(),
	   CreatedDate		DateTime NOT NULL DEFAULT GETDATE(),
	   UpdatedBy		Varchar(100) NULL ,
	   UpdatedDate		DateTime  NULL ,      
) 
GO

-------------------------------------------------------------------------------------------------------------------------------------

/*==============================================================*/
/* Table: PackageExecutionHistory                                        */
/*==============================================================*/
Create Table Stg.PackageExecutionHistory(
	   PackageId		INT Identity(1,1) Not Null PRIMARY KEY,
	   JobId			INT Null,	          	   
	   PackageName		Varchar(255) Null,
	   PackageStatus	Varchar(255) Null,	   	   
       BatchDate		Date NULL,
	   CreatedBy		Varchar(100) NOT NULL DEFAULT SUSER_NAME(),
	   CreatedDate		DateTime NOT NULL DEFAULT GETDATE()
) 
GO


ALTER TABLE Stg.JobExecutionHistory  WITH CHECK ADD  CONSTRAINT [FK_JobExecutionHistory_JobInfo] FOREIGN KEY([JobInfoId])
REFERENCES Stg.JobInfo ([JobInfoId])
GO

ALTER TABLE Stg.PackageExecutionHistory  WITH CHECK ADD  CONSTRAINT [FK_PackageExecutionHistory_JobExecutionHistory] FOREIGN KEY([JobId])
REFERENCES Stg.JobExecutionHistory ([JobId])
GO