/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spInsertPickList]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[dw].[spInsertPickList]') And Type In (N'P', N'PC'))
Drop Procedure [dw].[spInsertPickList]
Go

/****** Object:  StoredProcedure [dw].[spInsertPickList]    Script Date: 3/23/2016 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dw].[spInsertPickList]
       @PickListTypeCode VARCHAR(100),
	   @PickListCode VARCHAR(100),
       @PickListName VARCHAR(100)

AS

BEGIN
    
	SET NOCOUNT ON

	DECLARE @PickListTypeId BIGINT
	DECLARE @sequenceId BIGINT

	SELECT @PickListTypeId = PickList_Type_Id FROM dw.PickList_Type WHERE PickList_Type_Code = @PickListTypeCode

	IF NOT EXISTS (SELECT 1 FROM dw.PickList WHERE PickList_Type_Id = @PickListTypeId AND PickList_Code = @PickListCode)
	BEGIN
		SET @sequenceId =  NEXT VALUE FOR dw.PickList_SEQ
		INSERT INTO dw.PickList(PickList_ID, PickList_Type_ID, PickList_Code, PickList_Name, Created_Date, Created_By, Is_Deleted)
		VALUES(@sequenceId, @PickListTypeId, @PickListCode, @PickListName, getdate(), suser_name(), 0)
	END

End

GO