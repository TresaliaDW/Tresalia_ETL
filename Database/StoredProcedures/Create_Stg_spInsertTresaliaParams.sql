/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spInsertTresaliaParams]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[dw].[spInsertTresaliaParams]') And Type In (N'P', N'PC'))
Drop Procedure [stg].[spInsertTresaliaParams]
Go

/****** Object:  StoredProcedure [dw].[spInsertTresaliaParams]    Script Date: 3/23/2016 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [Stg].[spInsertTresaliaParams]
       @ParamType VARCHAR(100),
	   @ParamKey VARCHAR(100),
       @ParamValue VARCHAR(100)

AS

BEGIN
    
	SET NOCOUNT ON

	IF NOT EXISTS (SELECT 1 FROM stg.TresaliaParams  WHERE  ParamKey = @ParamKey)
	BEGIN
		INSERT INTO stg.TresaliaParams (ParamType,ParamKey,ParamValue)
		VALUES(@ParamType, @ParamKey, @ParamValue)
	END
END