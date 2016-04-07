IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[SeqPickListId]') AND type = 'SO')
BEGIN
	DROP SEQUENCE [dw].[SeqPickListId]
END

IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[SeqPickListTypeId]') AND type = 'SO')
BEGIN
	DROP SEQUENCE [dw].[SeqPickListTypeId]
END

CREATE SEQUENCE dw.SeqPickListId
 AS BIGINT
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 NO MAXVALUE
 NO CYCLE;

 CREATE SEQUENCE dw.SeqPickListTypeId
 AS BIGINT
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 NO MAXVALUE
 NO CYCLE;


