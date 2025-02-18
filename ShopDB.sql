USE [master]
GO
/****** Object:  Database [ShopDB]    Script Date: 29.12.2024 23:27:02 ******/
CREATE DATABASE [ShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopDB]
GO
/****** Object:  Table [dbo].[Adresy]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Uzytkownika] [int] NULL,
	[Ulica] [nvarchar](100) NULL,
	[Miasto] [nvarchar](50) NULL,
	[KodPocztowy] [nvarchar](20) NULL,
	[Kraj] [nvarchar](50) NULL,
	[TypAdresu] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dostawy]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dostawy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Zamowienia] [int] NULL,
	[FirmaKurierska] [nvarchar](100) NULL,
	[NumerSledzenia] [nvarchar](50) NULL,
	[StatusDostawy] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Koszyk]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koszyk](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Uzytkownika] [int] NULL,
	[DataUtworzenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KoszykProdukty]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KoszykProdukty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Koszyka] [int] NULL,
	[ID_Produktu] [int] NULL,
	[Ilosc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opinie]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opinie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Produktu] [int] NULL,
	[ID_Uzytkownika] [int] NULL,
	[Ocena] [int] NULL,
	[Komentarz] [nvarchar](max) NULL,
	[DataDodania] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platnosci]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platnosci](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Zamowienia] [int] NULL,
	[TypPlatnosci] [nvarchar](20) NULL,
	[StatusPlatnosci] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkty]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NULL,
	[Opis] [nvarchar](max) NULL,
	[Cena] [decimal](10, 2) NULL,
	[IloscDostepna] [int] NULL,
	[ID_RodzajProduktu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rabaty]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rabaty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KodRabatu] [nvarchar](20) NULL,
	[ProcentRabatu] [decimal](5, 2) NULL,
	[DataRozpoczecia] [date] NULL,
	[DataZakonczenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RodzajeProduktow]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RodzajeProduktow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ulubione]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ulubione](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Uzytkownika] [int] NULL,
	[ID_Produktu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](50) NULL,
	[Nazwisko] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Haslo] [nvarchar](255) NULL,
	[Rola] [nvarchar](20) NULL,
	[DataRejestracji] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataZlozenia] [date] NULL,
	[ID_Uzytkownika] [int] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZamowieniaProdukty]    Script Date: 29.12.2024 23:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZamowieniaProdukty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Zamowienia] [int] NULL,
	[ID_Produktu] [int] NULL,
	[Ilosc] [int] NULL,
	[CenaJednostkowa] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adresy] ON 

INSERT [dbo].[Adresy] ([ID], [ID_Uzytkownika], [Ulica], [Miasto], [KodPocztowy], [Kraj], [TypAdresu]) VALUES (1, 1, N'ul. Lipowa 15', N'Warszawa', N'00-001', N'Polska', N'Dostawa')
INSERT [dbo].[Adresy] ([ID], [ID_Uzytkownika], [Ulica], [Miasto], [KodPocztowy], [Kraj], [TypAdresu]) VALUES (2, 2, N'ul. Dębowa 20', N'Kraków', N'30-002', N'Polska', N'Faktura')
INSERT [dbo].[Adresy] ([ID], [ID_Uzytkownika], [Ulica], [Miasto], [KodPocztowy], [Kraj], [TypAdresu]) VALUES (3, 1, N'ul. Klonowa 5', N'Gdańsk', N'80-001', N'Polska', N'Dostawa')
SET IDENTITY_INSERT [dbo].[Adresy] OFF
GO
SET IDENTITY_INSERT [dbo].[Dostawy] ON 

INSERT [dbo].[Dostawy] ([ID], [ID_Zamowienia], [FirmaKurierska], [NumerSledzenia], [StatusDostawy]) VALUES (1, 1, N'DHL', N'1234567890', N'Doręczone')
INSERT [dbo].[Dostawy] ([ID], [ID_Zamowienia], [FirmaKurierska], [NumerSledzenia], [StatusDostawy]) VALUES (2, 2, N'InPost', N'0987654321', N'W drodze')
INSERT [dbo].[Dostawy] ([ID], [ID_Zamowienia], [FirmaKurierska], [NumerSledzenia], [StatusDostawy]) VALUES (3, 3, N'DPD', N'1122334455', N'Anulowane')
SET IDENTITY_INSERT [dbo].[Dostawy] OFF
GO
SET IDENTITY_INSERT [dbo].[Koszyk] ON 

INSERT [dbo].[Koszyk] ([ID], [ID_Uzytkownika], [DataUtworzenia]) VALUES (1, 1, CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Koszyk] ([ID], [ID_Uzytkownika], [DataUtworzenia]) VALUES (2, 2, CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Koszyk] ([ID], [ID_Uzytkownika], [DataUtworzenia]) VALUES (3, 3, CAST(N'2024-12-28' AS Date))
SET IDENTITY_INSERT [dbo].[Koszyk] OFF
GO
SET IDENTITY_INSERT [dbo].[KoszykProdukty] ON 

INSERT [dbo].[KoszykProdukty] ([ID], [ID_Koszyka], [ID_Produktu], [Ilosc]) VALUES (1, 1, 1, 1)
INSERT [dbo].[KoszykProdukty] ([ID], [ID_Koszyka], [ID_Produktu], [Ilosc]) VALUES (2, 1, 2, 2)
INSERT [dbo].[KoszykProdukty] ([ID], [ID_Koszyka], [ID_Produktu], [Ilosc]) VALUES (3, 2, 3, 1)
SET IDENTITY_INSERT [dbo].[KoszykProdukty] OFF
GO
SET IDENTITY_INSERT [dbo].[Opinie] ON 

INSERT [dbo].[Opinie] ([ID], [ID_Produktu], [ID_Uzytkownika], [Ocena], [Komentarz], [DataDodania]) VALUES (1, 1, 1, 5, N'Świetny produkt!', CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Opinie] ([ID], [ID_Produktu], [ID_Uzytkownika], [Ocena], [Komentarz], [DataDodania]) VALUES (2, 2, 2, 4, N'Dobra jakość, ale mogłoby być taniej.', CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Opinie] ([ID], [ID_Produktu], [ID_Uzytkownika], [Ocena], [Komentarz], [DataDodania]) VALUES (3, 3, 1, 3, N'Przydatna książka, ale brakuje przykładów.', CAST(N'2024-12-28' AS Date))
SET IDENTITY_INSERT [dbo].[Opinie] OFF
GO
SET IDENTITY_INSERT [dbo].[Platnosci] ON 

INSERT [dbo].[Platnosci] ([ID], [ID_Zamowienia], [TypPlatnosci], [StatusPlatnosci]) VALUES (1, 1, N'Karta', N'Zrealizowana')
INSERT [dbo].[Platnosci] ([ID], [ID_Zamowienia], [TypPlatnosci], [StatusPlatnosci]) VALUES (2, 2, N'Przelew', N'Oczekująca')
INSERT [dbo].[Platnosci] ([ID], [ID_Zamowienia], [TypPlatnosci], [StatusPlatnosci]) VALUES (3, 3, N'PayPal', N'Anulowana')
SET IDENTITY_INSERT [dbo].[Platnosci] OFF
GO
SET IDENTITY_INSERT [dbo].[Produkty] ON 

INSERT [dbo].[Produkty] ([ID], [Nazwa], [Opis], [Cena], [IloscDostepna], [ID_RodzajProduktu]) VALUES (1, N'Laptop', N'Nowoczesny laptop z 16GB RAM', CAST(3500.99 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Produkty] ([ID], [Nazwa], [Opis], [Cena], [IloscDostepna], [ID_RodzajProduktu]) VALUES (2, N'Koszulka', N'Bawełniana koszulka męska', CAST(59.99 AS Decimal(10, 2)), 50, 2)
INSERT [dbo].[Produkty] ([ID], [Nazwa], [Opis], [Cena], [IloscDostepna], [ID_RodzajProduktu]) VALUES (3, N'Poradnik', N'Poradnik programowania w Python', CAST(89.99 AS Decimal(10, 2)), 30, 3)
SET IDENTITY_INSERT [dbo].[Produkty] OFF
GO
SET IDENTITY_INSERT [dbo].[Rabaty] ON 

INSERT [dbo].[Rabaty] ([ID], [KodRabatu], [ProcentRabatu], [DataRozpoczecia], [DataZakonczenia]) VALUES (1, N'PROMO10', CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-01-01' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Rabaty] ([ID], [KodRabatu], [ProcentRabatu], [DataRozpoczecia], [DataZakonczenia]) VALUES (2, N'WINTER15', CAST(15.00 AS Decimal(5, 2)), CAST(N'2024-12-01' AS Date), CAST(N'2025-02-28' AS Date))
INSERT [dbo].[Rabaty] ([ID], [KodRabatu], [ProcentRabatu], [DataRozpoczecia], [DataZakonczenia]) VALUES (3, N'SUMMER5', CAST(5.00 AS Decimal(5, 2)), CAST(N'2024-07-01' AS Date), CAST(N'2024-08-31' AS Date))
SET IDENTITY_INSERT [dbo].[Rabaty] OFF
GO
SET IDENTITY_INSERT [dbo].[RodzajeProduktow] ON 

INSERT [dbo].[RodzajeProduktow] ([ID], [Nazwa]) VALUES (1, N'Elektronika')
INSERT [dbo].[RodzajeProduktow] ([ID], [Nazwa]) VALUES (2, N'Odzież')
INSERT [dbo].[RodzajeProduktow] ([ID], [Nazwa]) VALUES (3, N'Książki')
SET IDENTITY_INSERT [dbo].[RodzajeProduktow] OFF
GO
SET IDENTITY_INSERT [dbo].[Ulubione] ON 

INSERT [dbo].[Ulubione] ([ID], [ID_Uzytkownika], [ID_Produktu]) VALUES (1, 1, 2)
INSERT [dbo].[Ulubione] ([ID], [ID_Uzytkownika], [ID_Produktu]) VALUES (2, 1, 3)
INSERT [dbo].[Ulubione] ([ID], [ID_Uzytkownika], [ID_Produktu]) VALUES (3, 2, 1)
SET IDENTITY_INSERT [dbo].[Ulubione] OFF
GO
SET IDENTITY_INSERT [dbo].[Uzytkownicy] ON 

INSERT [dbo].[Uzytkownicy] ([ID], [Imie], [Nazwisko], [Email], [Haslo], [Rola], [DataRejestracji]) VALUES (1, N'Jan', N'Kowalski', N'jan.kowalski@example.com', N'password123', N'Klient', CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Uzytkownicy] ([ID], [Imie], [Nazwisko], [Email], [Haslo], [Rola], [DataRejestracji]) VALUES (2, N'Anna', N'Nowak', N'anna.nowak@example.com', N'password456', N'Klient', CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Uzytkownicy] ([ID], [Imie], [Nazwisko], [Email], [Haslo], [Rola], [DataRejestracji]) VALUES (3, N'Piotr', N'Wiśniewski', N'piotr.wisniewski@example.com', N'password789', N'Admin', CAST(N'2024-12-28' AS Date))
SET IDENTITY_INSERT [dbo].[Uzytkownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Zamowienia] ON 

INSERT [dbo].[Zamowienia] ([ID], [DataZlozenia], [ID_Uzytkownika], [Status]) VALUES (1, CAST(N'2024-12-28' AS Date), 1, N'Nowe')
INSERT [dbo].[Zamowienia] ([ID], [DataZlozenia], [ID_Uzytkownika], [Status]) VALUES (2, CAST(N'2024-12-28' AS Date), 2, N'Zrealizowane')
INSERT [dbo].[Zamowienia] ([ID], [DataZlozenia], [ID_Uzytkownika], [Status]) VALUES (3, CAST(N'2024-12-28' AS Date), 1, N'Anulowane')
SET IDENTITY_INSERT [dbo].[Zamowienia] OFF
GO
SET IDENTITY_INSERT [dbo].[ZamowieniaProdukty] ON 

INSERT [dbo].[ZamowieniaProdukty] ([ID], [ID_Zamowienia], [ID_Produktu], [Ilosc], [CenaJednostkowa]) VALUES (1, 1, 1, 1, CAST(3500.99 AS Decimal(10, 2)))
INSERT [dbo].[ZamowieniaProdukty] ([ID], [ID_Zamowienia], [ID_Produktu], [Ilosc], [CenaJednostkowa]) VALUES (2, 1, 3, 2, CAST(89.99 AS Decimal(10, 2)))
INSERT [dbo].[ZamowieniaProdukty] ([ID], [ID_Zamowienia], [ID_Produktu], [Ilosc], [CenaJednostkowa]) VALUES (3, 2, 2, 3, CAST(59.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ZamowieniaProdukty] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Rabaty__7D19F5CBE74DFC13]    Script Date: 29.12.2024 23:27:03 ******/
ALTER TABLE [dbo].[Rabaty] ADD UNIQUE NONCLUSTERED 
(
	[KodRabatu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Uzytkown__A9D10534B4D83B96]    Script Date: 29.12.2024 23:27:03 ******/
ALTER TABLE [dbo].[Uzytkownicy] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Koszyk] ADD  DEFAULT (getdate()) FOR [DataUtworzenia]
GO
ALTER TABLE [dbo].[Opinie] ADD  DEFAULT (getdate()) FOR [DataDodania]
GO
ALTER TABLE [dbo].[Uzytkownicy] ADD  DEFAULT (getdate()) FOR [DataRejestracji]
GO
ALTER TABLE [dbo].[Zamowienia] ADD  DEFAULT (getdate()) FOR [DataZlozenia]
GO
ALTER TABLE [dbo].[Adresy]  WITH CHECK ADD FOREIGN KEY([ID_Uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Dostawy]  WITH CHECK ADD FOREIGN KEY([ID_Zamowienia])
REFERENCES [dbo].[Zamowienia] ([ID])
GO
ALTER TABLE [dbo].[Koszyk]  WITH CHECK ADD FOREIGN KEY([ID_Uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[KoszykProdukty]  WITH CHECK ADD FOREIGN KEY([ID_Koszyka])
REFERENCES [dbo].[Koszyk] ([ID])
GO
ALTER TABLE [dbo].[KoszykProdukty]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID])
GO
ALTER TABLE [dbo].[Opinie]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID])
GO
ALTER TABLE [dbo].[Opinie]  WITH CHECK ADD FOREIGN KEY([ID_Uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Platnosci]  WITH CHECK ADD FOREIGN KEY([ID_Zamowienia])
REFERENCES [dbo].[Zamowienia] ([ID])
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD FOREIGN KEY([ID_RodzajProduktu])
REFERENCES [dbo].[RodzajeProduktow] ([ID])
GO
ALTER TABLE [dbo].[Ulubione]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID])
GO
ALTER TABLE [dbo].[Ulubione]  WITH CHECK ADD FOREIGN KEY([ID_Uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD FOREIGN KEY([ID_Uzytkownika])
REFERENCES [dbo].[Uzytkownicy] ([ID])
GO
ALTER TABLE [dbo].[ZamowieniaProdukty]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID])
GO
ALTER TABLE [dbo].[ZamowieniaProdukty]  WITH CHECK ADD FOREIGN KEY([ID_Zamowienia])
REFERENCES [dbo].[Zamowienia] ([ID])
GO
ALTER TABLE [dbo].[Opinie]  WITH CHECK ADD CHECK  (([Ocena]>=(1) AND [Ocena]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [ShopDB] SET  READ_WRITE 
GO
