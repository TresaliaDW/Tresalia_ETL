/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                   */
/* Modified on:    03/21/2016 1:30:01 PM                         */
/* Modified by:    Anupam Pathak                        		*/
/*==============================================================*/

/****** Object:  StoredProcedure [Stg].[spCreateFileHistory]    Script Date: 03/21/2016 12:52:40 ******/
If  Exists (Select * From sys.objects Where object_id = Object_Id(N'[Stg].[spCreateFileHistory]') And Type In (N'P', N'PC'))
Drop Procedure [Stg].[spCreateFileHistory]
Go

/****** Object:  StoredProcedure [stg].[spCreateFileHistory]    Script Date: 3/23/2016 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [stg].[spCreateFileHistory]
       @SourceFilePath Varchar(100) = NULL,
       @SourceFileName Varchar(100) = NULL,
       @TabName Varchar(100) = NULL,
	   @TotalRecordsInFile Int  

As
Begin
    Set Nocount On

       
              Insert Into Stg.FileHistory (SourceFilePath,SourceFileName,TabName,TotalRecordsInFile)
              Values (@SourceFilePath,@SourceFileName,@TabName, @TotalRecordsInFile)
       
End



GO