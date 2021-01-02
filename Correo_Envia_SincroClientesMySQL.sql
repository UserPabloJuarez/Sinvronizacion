CREATE PROCEDURE [dbo].[Correo_Envia_SincroClientesMySQL]
AS

		declare @id int
		declare @asunto varchar(100)
		declare @destinatario varchar(500)
		declare @mensaje varchar(1000)
		declare @id_cliente as varchar(12)
		declare @id_cliente_fact as varchar(12)
		declare @CantidadRegistros int
		declare @mensajeError varchar(1000)
		
		BEGIN TRY
		
					begin
						--Llamamos al procedimiento que envia el correo
						exec nfac.dbo.senMail_07 @id_cliente, @id_cliente_fact
					end


				END TRY
				BEGIN CATCH
					--Hay un error, enviamos el mensaje de error
					set @mensajeError='“Por favor, asignar a PROV_EVERIS_N2_BILLING y a la aplicación XENA
              Se han producido los siguientes errores durante la ejecución del Script SincronizacionClienteMySQL:
			  [Listado de errores] Por favor, asignar a PROV_EVERIS_N2_BILLING aplicación XENA”' + ERROR_MESSAGE() 
					
					exec msdb..sp_send_dbmail 
					@profile_name = N'Desarrollo'
					,@recipients = 'operaciones.sistemas@masmovil.com '	--'recipients [ ; ...n ]' ]
					,@subject =  '[Alarmado] – Error SincronizacionClienteMySQL – NFAC'
					,@body = @mensajeError
					
					
				END CATCH


GO