USE [TalyCap]
GO
/****** Object:  StoredProcedure [dbo].[LIST_CLIMA]    Script Date: 20/09/2022 9:26:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC LIST_TIPO_TEMPERATURA

AS
BEGIN
	
		   --CONSULTAR EL REGISTRO EN LA BASE DE DATOS.
		   SELECT *
		   FROM tipo_temperatura


END;

SELECT * FROM USUARIO