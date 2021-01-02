
CREATE TABLE [dbo].[SincroClientesMySQL_pv_clientes](
	[Id_Cliente] [char](12) NOT NULL,
	[Id_Cliente_Fact] [char](12) NOT NULL,
	[Id_Empresa] [char](2) NOT NULL,
	[Flag_Cliente] [char](1) NOT NULL,
	[Flag_Subclientes] [char](1) NOT NULL,
	[Nombre] [char](100) NOT NULL,
	[Razon_Social] [char](100) NOT NULL,
	[Contacto] [char](100) NOT NULL,
	[Telefono] [char](25) NOT NULL,
	[Movil] [char](15) NOT NULL,
	[Email] [varchar](250) NOT NULL,
 CONSTRAINT [PKSincCliMySQL_pv_clientes2] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC,
	[Id_Empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

