USE [master]
GO
/****** Object:  Database [TrabajadoresPrueba ]    Script Date: 16/07/2025 16:49:57 ******/
CREATE DATABASE [TrabajadoresPrueba ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrabajadoresPrueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TrabajadoresPrueba .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrabajadoresPrueba _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TrabajadoresPrueba _log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TrabajadoresPrueba ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrabajadoresPrueba ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET RECOVERY FULL 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET  MULTI_USER 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrabajadoresPrueba ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrabajadoresPrueba ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrabajadoresPrueba ', N'ON'
GO
ALTER DATABASE [TrabajadoresPrueba ] SET QUERY_STORE = ON
GO
ALTER DATABASE [TrabajadoresPrueba ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TrabajadoresPrueba ]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreDepartamento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProvincia] [int] NULL,
	[NombreDistrito] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDepartamento] [int] NULL,
	[NombreProvincia] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](3) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[Nombres] [varchar](500) NULL,
	[Sexo] [varchar](1) NULL,
	[IdDepartamento] [int] NULL,
	[IdProvincia] [int] NULL,
	[IdDistrito] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([Id])
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[Trabajadores]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[Trabajadores]  WITH CHECK ADD FOREIGN KEY([IdDistrito])
REFERENCES [dbo].[Distrito] ([Id])
GO
ALTER TABLE [dbo].[Trabajadores]  WITH CHECK ADD FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarTrabajador]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarTrabajador]
    @id INT, -- ID del trabajador a actualizar
    @tipoDocumento VARCHAR(50),
    @numeroDocumento VARCHAR(20),
    @nombres VARCHAR(100),
    @sexo VARCHAR(10),
    @idDepartamento INT,
    @idProvincia INT,
    @idDistrito INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN 
        UPDATE Trabajadores
        SET
            TipoDocumento = @tipoDocumento,
            NumeroDocumento = @numeroDocumento,
            Nombres = @nombres,
            Sexo = @sexo,
            IdDepartamento = @idDepartamento,
            IdProvincia = @idProvincia,
            IdDistrito = @idDistrito
        WHERE Id = @id;

    END 
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_CrearTrabajador]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CrearTrabajador]
    @TipoDocumento NVARCHAR(50),
    @NumeroDocumento NVARCHAR(20),
    @Nombres NVARCHAR(100),
    @Sexo NVARCHAR(1),
    @IdDepartamento INT,
    @IdProvincia INT,
    @IdDistrito INT
AS
BEGIN
    -- Manejo de errores para DNI duplicado (NumeroDocumento)
    IF EXISTS (SELECT 1 FROM Trabajadores WHERE NumeroDocumento = @NumeroDocumento)
    BEGIN
        -- Puedes lanzar un error personalizado o retornar un código de error
        RAISERROR('El número de documento ya existe para otro trabajador.', 16, 1);
        RETURN -1; -- Retorna un valor para indicar un fallo
    END

    INSERT INTO Trabajadores (TipoDocumento, NumeroDocumento, Nombres, Sexo, IdDepartamento, IdProvincia, IdDistrito)
    VALUES (@TipoDocumento, @NumeroDocumento, @Nombres, @Sexo, @IdDepartamento, @IdProvincia, @IdDistrito);

    SELECT SCOPE_IDENTITY() AS NewId; -- Retorna el ID del nuevo registro insertado
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTrabajador]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarTrabajador]
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN 
        DELETE FROM Trabajadores
        WHERE Id = @id;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetProvinciasByDepartamento]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetProvinciasByDepartamento]
    @IdDepartamento INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, NombreProvincia FROM Provincia WHERE IdDepartamento = @IdDepartamento ORDER BY NombreProvincia;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListaDepartamentos]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListaDepartamentos]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, NombreDepartamento FROM Departamento ORDER BY NombreDepartamento;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListaDistritos_Provincia]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListaDistritos_Provincia]
    @IdProvincia INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, NombreDistrito FROM Distrito WHERE IdProvincia = @IdProvincia ORDER BY NombreDistrito;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListaProvincias_Departamento]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListaProvincias_Departamento]
    @IdDepartamento INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, NombreProvincia FROM Provincia WHERE IdDepartamento = @IdDepartamento ORDER BY NombreProvincia;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTodosTrabajadores]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarTodosTrabajadores]
AS
BEGIN
    SELECT
        Id,
        TipoDocumento,
        NumeroDocumento,
        Nombres,
        Sexo,
        IdDepartamento,
        IdProvincia,
        IdDistrito
    FROM
        Trabajadores
    ORDER BY
        Nombres;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTrabajadores]    Script Date: 16/07/2025 16:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarTrabajadores]
AS
BEGIN
    SELECT
        T.Id,
        T.TipoDocumento,
        T.NumeroDocumento,
        T.Nombres,
        T.Sexo,
        D.NombreDepartamento,             -- Add the names
        P.NombreProvincia,
        Di.NombreDistrito
    FROM Trabajadores AS T
    JOIN Departamento AS D ON T.IdDepartamento = D.Id
    JOIN Provincia AS P ON T.IdProvincia = P.Id
    JOIN Distrito AS Di ON T.IdDistrito = Di.Id;
END

GO
USE [master]
GO
ALTER DATABASE [TrabajadoresPrueba ] SET  READ_WRITE 
GO
