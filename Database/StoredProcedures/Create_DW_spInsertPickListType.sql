/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spInsertPickListType]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[dw].[spInsertPickListType]') And Type In (N'P', N'PC'))
Drop Procedure [dw].[spInsertPickListType]
Go

/****** Object:  StoredProcedure [dw].[spInsertPickListType]    Script Date: 3/23/2016 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dw].[spInsertPickListType]
       @PickListTypeCode VARCHAR(100),
       @PickListTypeName VARCHAR(100)

AS

BEGIN
    
	SET NOCOUNT ON

	--DECLARE @sequenceId BIGINT

	IF NOT EXISTS (SELECT 1 FROM dw.PickList_Type WHERE PickList_Type_Code = @PickListTypeCode)
	BEGIN
		---SET @sequenceId =  NEXT VALUE FOR dw.SeqPickListTypeId
		INSERT INTO dw.PickList_Type(PickList_Type_Code, PickList_Type_Name, Created_Date, Created_By, Is_Deleted)
		VALUES(@PickListTypeCode, @PickListTypeName, getdate(), suser_name(), 0)
	END

End

GO