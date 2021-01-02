CREATE PROCEDURE [dbo].[senMail_07]
--@asunto as varchar(1000),
--@mensaje as varchar(4000),
--@rc as int output,
@id_cliente as varchar(12),
@id_cliente_fact as varchar(12)

as 
begin
	DECLARE @destinatario varchar(500)
	DECLARE @sql nvarchar(4000)
	DECLARE @asunto varchar(1000)
	DECLARE @mensaje varchar(4000)
	
	SET @sql = '
	select TOP 1 Id_Cliente, Id_Cliente_Fact, Id_Empresa, ErrorTime, ErrorProcedure, 
	ErrorLine, ErrorMessage  from (pv_clientes CROSS JOIN SincroClientesMySQLErrorLog) order by Fecha_Scoring desc'
	
	SET @mensaje = @mensaje + 'Por favor, asignar a PROV_EVERIS_N2_BILLING y a la aplicación XENA
              Se han producido los siguientes errores durante la ejecución del Script SincronizacionClienteMySQL:
			  [Listado de errores]
              Por favor, asignar a PROV_EVERIS_N2_BILLING aplicación XENA.' + char(13)

	SET @destinatario = 'operaciones.sistemas@masmovil.com'

	SET @asunto = '[Alarmado] – Error SincronizacionClienteMySQL – NFAC'

exec msdb..sp_send_dbmail
	@profile_name = 'Desarrollo'
	,@recipients = @destinatario
	,@subject = @asunto
	,@body = @mensaje
	,@query = @sql


end
GO