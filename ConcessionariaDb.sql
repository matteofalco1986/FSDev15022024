USE [master]
GO
/****** Object:  Database [Concessionaria]    Script Date: 15/02/2024 18:44:16 ******/
CREATE DATABASE [Concessionaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Concessionaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Concessionaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Concessionaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Concessionaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Concessionaria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Concessionaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Concessionaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Concessionaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Concessionaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Concessionaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Concessionaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Concessionaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Concessionaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Concessionaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Concessionaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Concessionaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Concessionaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Concessionaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Concessionaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Concessionaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Concessionaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Concessionaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Concessionaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Concessionaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Concessionaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Concessionaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Concessionaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Concessionaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Concessionaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Concessionaria] SET  MULTI_USER 
GO
ALTER DATABASE [Concessionaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Concessionaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Concessionaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Concessionaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Concessionaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Concessionaria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Concessionaria] SET QUERY_STORE = ON
GO
ALTER DATABASE [Concessionaria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Concessionaria]
GO
/****** Object:  Table [dbo].[AnniGaranzia]    Script Date: 15/02/2024 18:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnniGaranzia](
	[ID] [int] NOT NULL,
	[Prezzo] [money] NULL,
 CONSTRAINT [PK_AnniGaranzia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auto]    Script Date: 15/02/2024 18:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Modello] [nvarchar](20) NULL,
	[Marca] [nvarchar](20) NULL,
	[PrezzoBase] [money] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Auto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Optionals]    Script Date: 15/02/2024 18:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Optionals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Optional] [nvarchar](50) NULL,
	[Prezzo] [money] NULL,
	[Descrizione] [nvarchar](max) NULL,
 CONSTRAINT [PK_Optionals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (0, 0.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (1, 120.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (2, 240.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (3, 360.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (4, 480.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (5, 600.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (6, 720.0000)
INSERT [dbo].[AnniGaranzia] ([ID], [Prezzo]) VALUES (7, 840.0000)
GO
SET IDENTITY_INSERT [dbo].[Auto] ON 

INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (1, N'Corolla', N'Toyota', 20025.0000, N'https://m.atcdn.co.uk/vms/media/7b90780942a04ebdb6f7b767bb687dc6.jpg')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (2, N'Civic', N'Honda', 21250.0000, N'https://www.honda.co.uk/content/dam/central/cars/civic-hybrid/overview-v3/Honda-civic-hybrid-17-16x9.png/_jcr_content/renditions/c3.png')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (3, N'F-150', N'Ford', 28940.0000, N'https://build.ford.com/dig/Ford/F-150%20F-150/2023/HD-TILE/Image%5B%7CFord%7CF-150%20F-150%7C2023%7C1%7C1.%7C101A.F1C.122.PUM.LSC.88C.89S.A5GAA.66D.SS6.16G.BLDA4.55D.MFP.91X.RCAB.CLFAF.CLMB5.64C.T72.RWD.99B.60C.98F.50S.50X.76R.F150.58A.SY4.66H.774.44G.X19.CLO.U11.%5D/EXT/1/vehicle.png')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (4, N'Silverado 1500', N'Chevrolet', 28900.0000, N'https://www.chevrolet.com/content/dam/chevrolet/na/us/english/index/vehicles/2024/trucks/silverado-ld-1500/trims/2024-silverado1500-cc10543-3lz-gxp-trimselector.jpg?imwidth=960')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (5, N'RAV4', N'Toyota', 26150.0000, N'https://m.atcdn.co.uk/a/media/%7Bresize%7D/9472f9eccb5941d1b4edd39b421ccd00.jpg')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (6, N'CR-V', N'Honda', 25350.0000, N'data:image/jpeg;base64,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')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (7, N'Rogue', N'Nissan', 25650.0000, N'https://www.motortrend.com/uploads/sites/10/2015/11/2012-nissan-rogue-sv-fwd-suv-angular-front.png?fit=around%7C551:374')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (8, N'Wrangler', N'Jeep', 28295.0000, N'https://www.jeep.co.uk/content/dam/jeep/crossmarket/wrangler-full-model-mca-2024/02-trim-selector/sahara/figurines/sahara-black-565x330.png')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (9, N'Elantra', N'Hyundai', 19650.0000, N'https://s7d1.scene7.com/is/image/hyundai/2024-elantra-limited-intense-blue-vehicle-browse-hero:Browse?fmt=webp-alpha')
INSERT [dbo].[Auto] ([ID], [Modello], [Marca], [PrezzoBase], [Image]) VALUES (10, N'Forte', N'Kia', 17890.0000, N'https://www.motortrend.com/uploads/sites/10/2017/11/2018-kia-forte-ex-sedan-angular-front.png')
SET IDENTITY_INSERT [dbo].[Auto] OFF
GO
SET IDENTITY_INSERT [dbo].[Optionals] ON 

INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (1, N'Navigatore Satellitare', 900.0000, N'Un sistema integrato per la navigazione che fornisce indicazioni stradali in tempo reale.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (2, N'Telecamera di Retromarcia', 650.0000, N'Una telecamera montata sul retro dell''auto per facilitare il parcheggio e le manovre di retromarcia.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (3, N'Sensori di parcheggio', 350.0000, N'Sensori montati sulla carrozzeria dell''auto che emettono avvisi acustici o visivi quando ci si avvicina a ostacoli durante le manovre di parcheggio.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (4, N'Sedili riscaldati', 650.0000, N' Sedili dotati di riscaldamento per i mesi freddi e ventilazione per i mesi caldi per un comfort ottimale.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (5, N'Tetto panoramico', 850.0000, N'Un tetto in vetro più grande del normale che offre una vista panoramica dell''ambiente circostante.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (6, N'Cerchi in lega', 2300.0000, N'Cerchi in lega leggera che migliorano l''aspetto estetico dell''auto e offrono prestazioni superiori rispetto ai cerchi in acciaio.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (7, N'Interni in pelle', 3720.0000, N'Sedili, pannelli delle porte e altri elementi degli interni rivestiti in pelle per un tocco di lusso e comfort.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (8, N'Sistema audio premium', 2100.0000, N'Un sistema audio di alta qualità con altoparlanti migliorati e un''esperienza sonora superiore.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (9, N'Controllo automatico del clima', 1200.0000, N'Un sistema che regola automaticamente la temperatura interna dell''auto per mantenere un comfort ottimale.')
INSERT [dbo].[Optionals] ([ID], [Optional], [Prezzo], [Descrizione]) VALUES (10, N'Fari automatici adattivi', 950.0000, NULL)
SET IDENTITY_INSERT [dbo].[Optionals] OFF
GO
USE [master]
GO
ALTER DATABASE [Concessionaria] SET  READ_WRITE 
GO
