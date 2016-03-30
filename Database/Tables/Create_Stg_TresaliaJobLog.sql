if exists (select 1 from  sysobjects where  id = object_id('STG.TresaliaJobLog') and   type = 'U')
   drop table STG.TresaliaJobLog
go


/*==============================================================*/
/* Table: TresaliaJobLog                                        */
/*==============================================================*/
Create Table Stg.TresaliaJobLog(
	JobSequenceNo Numeric(19, 0) Identity(1,1) Not Null,
       PackageId Varchar(255) Not Null,
	   PackageName Varchar(255) Not Null,
	   JobName Varchar(255) Not Null,
       JobStatus Varchar(255) Not Null,
       RunDate              Datetime,
       StartTime Datetime Null,
       EndDate         Datetime    Null   
) 
GO
