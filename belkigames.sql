USE [master]
GO
/****** Object:  Database [belkigames]    Script Date: 3/04/2022 4:03:17 p. m. ******/
CREATE DATABASE [belkigames]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'belkigames', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\belkigames.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'belkigames_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\belkigames_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [belkigames] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [belkigames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [belkigames] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [belkigames] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [belkigames] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [belkigames] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [belkigames] SET ARITHABORT OFF 
GO
ALTER DATABASE [belkigames] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [belkigames] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [belkigames] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [belkigames] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [belkigames] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [belkigames] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [belkigames] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [belkigames] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [belkigames] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [belkigames] SET  ENABLE_BROKER 
GO
ALTER DATABASE [belkigames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [belkigames] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [belkigames] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [belkigames] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [belkigames] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [belkigames] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [belkigames] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [belkigames] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [belkigames] SET  MULTI_USER 
GO
ALTER DATABASE [belkigames] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [belkigames] SET DB_CHAINING OFF 
GO
ALTER DATABASE [belkigames] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [belkigames] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [belkigames] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [belkigames] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [belkigames] SET QUERY_STORE = OFF
GO
USE [belkigames]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 3/04/2022 4:03:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[correo] [varchar](50) NOT NULL,
	[nombre_cliente] [varchar](30) NOT NULL,
	[apellidos_cliente] [varchar](45) NOT NULL,
	[pais] [varchar](56) NOT NULL,
	[usuario] [varchar](25) NOT NULL,
	[contraseña] [varchar](20) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desarrolladoras]    Script Date: 3/04/2022 4:03:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desarrolladoras](
	[nit] [varchar](11) NOT NULL,
	[nombre_empresa] [varchar](69) NOT NULL,
	[correo_empresarial] [varchar](50) NOT NULL,
	[telefono] [varchar](12) NOT NULL,
	[ubicacion] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 3/04/2022 4:03:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[id_pedido] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[total] [int] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[juegos_factura]    Script Date: 3/04/2022 4:03:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[juegos_factura](
	[id_pedido] [int] NOT NULL,
	[id_juego] [varchar](15) NOT NULL,
 CONSTRAINT [pk_juego_factura] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC,
	[id_juego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videojuegos]    Script Date: 3/04/2022 4:03:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videojuegos](
	[id_juego] [varchar](15) NOT NULL,
	[nit] [varchar](11) NOT NULL,
	[nombre_juego] [varchar](140) NOT NULL,
	[categoria] [varchar](20) NOT NULL,
	[fecha_lanzamiento] [date] NOT NULL,
	[descripcion] [text] NOT NULL,
	[precio] [int] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_juego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[clientes] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[desarrolladoras] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[facturas] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[videojuegos] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [pk_factura] FOREIGN KEY([correo])
REFERENCES [dbo].[clientes] ([correo])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [pk_factura]
GO
ALTER TABLE [dbo].[juegos_factura]  WITH CHECK ADD FOREIGN KEY([id_juego])
REFERENCES [dbo].[videojuegos] ([id_juego])
GO
ALTER TABLE [dbo].[juegos_factura]  WITH CHECK ADD FOREIGN KEY([id_pedido])
REFERENCES [dbo].[facturas] ([id_pedido])
GO
ALTER TABLE [dbo].[videojuegos]  WITH CHECK ADD  CONSTRAINT [pk_videojuego] FOREIGN KEY([nit])
REFERENCES [dbo].[desarrolladoras] ([nit])
GO
ALTER TABLE [dbo].[videojuegos] CHECK CONSTRAINT [pk_videojuego]
GO
USE [master]
GO
ALTER DATABASE [belkigames] SET  READ_WRITE 
GO
