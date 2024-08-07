USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 22/06/2024 2:03:49 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital', N'ON'
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[BancoDeSangre]    Script Date: 22/06/2024 2:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BancoDeSangre](
	[Tipo] [varchar](2) NOT NULL,
	[Rh] [varchar](1) NOT NULL,
	[Litros] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donantes]    Script Date: 22/06/2024 2:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donantes](
	[dni] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[tipo] [varchar](2) NOT NULL,
	[rh] [varchar](1) NOT NULL,
	[litros] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 22/06/2024 2:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[dni] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](100) NULL,
	[tipo] [varchar](2) NOT NULL,
	[rh] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 22/06/2024 2:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Usuario] [varchar](100) NOT NULL,
	[Contrasena] [varchar](100) NOT NULL,
	[estado] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'O', N'+', 80)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'O', N'-', 5)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'A', N'+', 25)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'A', N'-', 25)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'B', N'+', 40)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'B', N'-', 10)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'AB', N'+', 35)
INSERT [dbo].[BancoDeSangre] ([Tipo], [Rh], [Litros]) VALUES (N'AB', N'-', 20)
GO
INSERT [dbo].[Donantes] ([dni], [nombre], [apellido], [tipo], [rh], [litros]) VALUES (56785432, N'Jean', N'Valverde', N'O', N'+', 0.5)
INSERT [dbo].[Donantes] ([dni], [nombre], [apellido], [tipo], [rh], [litros]) VALUES (12345678, N'Test', N'Test', N'A', N'+', 0.5)
INSERT [dbo].[Donantes] ([dni], [nombre], [apellido], [tipo], [rh], [litros]) VALUES (12345678, N'Test', N'Test', N'A', N'+', 5)
GO
INSERT [dbo].[Pacientes] ([dni], [nombre], [apellido], [direccion], [telefono], [tipo], [rh]) VALUES (12345678, N'Juan', N'Perez', N'Calle Falsa 123', N'123456789', N'A', N'+')
INSERT [dbo].[Pacientes] ([dni], [nombre], [apellido], [direccion], [telefono], [tipo], [rh]) VALUES (12344566, N'1', N'1', N'ac', N'1241244', N'A', N'+')
GO
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'admin', N'CA9566EFDEACD79E9ACAE8F4A9A79E8B6EB5408FBA66A2E3FA82DB6F9857CE20', N'N')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'Valle', N'123', N'P')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'Cotrina', N'99EA56CED47C21431D0C56EF904F282AE4256ADB612C4E890B6DAA1B61D0C32C', N'N')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'InvalidUser!', N'Password123', N'A')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'ValidUser', N'Password123', N'N')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'1', N'1', N'A')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'123', N'123', N'N')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'"newuser"', N'"password"', N'N')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'"existinguser"', N'"password"', N'N')
INSERT [dbo].[Personal] ([Usuario], [Contrasena], [estado]) VALUES (N'', N'', N'N')
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
