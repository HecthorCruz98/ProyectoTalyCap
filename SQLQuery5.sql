USE [TalyCap]
GO
/****** Object:  StoredProcedure [dbo].[SP_LOGIN]    Script Date: 21/09/2022 12:28:37 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_LOGIN]
@User varchar(10),
@Pass varchar(10)

AS
BEGIN
	
		   --CONSULTAR EL REGISTRO EN LA BASE DE DATOS.
		   SELECT usuario,pass
		   FROM usuario
		   WHERE usuario =@User AND pass= @Pass


END;