/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spGetStartDate]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spGetStartDate]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spGetStartDate]
Go

/****** Object:  StoredProcedure [stg].[spGetStartDate]    Script Date: 3/23/2016 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spGetStartDate]
       @ParamKey Varchar(255),
	   @StartDate AS DateTime Output 
	   
As
Begin
    Set Nocount On
	SET @StartDate = GetDate()
	Select @StartDate = ParamValue from stg.TresaliaParams where ParamType = 'CONFIG' and ParamKey = @ParamKey
       
End



GO