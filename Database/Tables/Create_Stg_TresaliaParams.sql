if exists (select 1 from  sysobjects where  id = object_id('Stg.TresaliaParams') and   type = 'U')
   drop table Stg.TresaliaParams
go

/*==============================================================*/
/* Table: TresaliaParams                                        */
/*==============================================================*/
create table Stg.TresaliaParams (
   ParamType            varchar(50)           not null,
   ParamKey             varchar(50)           not null,
   ParamValue           varchar(50)           not null
)
go
