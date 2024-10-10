USE [master]
GO
/****** Object:  Database [Sports]    Script Date: 10.10.2024 14:22:46 ******/
CREATE DATABASE [Sports]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sporting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Sporting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sporting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Sporting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sports] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sports].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sports] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sports] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sports] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sports] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sports] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sports] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sports] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sports] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sports] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sports] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sports] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sports] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sports] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sports] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sports] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sports] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sports] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sports] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sports] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sports] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sports] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sports] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sports] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sports] SET  MULTI_USER 
GO
ALTER DATABASE [Sports] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sports] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sports] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sports] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sports] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sports] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sports] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sports] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sports]
GO
/****** Object:  Table [dbo].[FemaleMale]    Script Date: 10.10.2024 14:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FemaleMale](
	[Id] [int] NOT NULL,
	[MaleFemaleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MaleFemale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginStatus]    Script Date: 10.10.2024 14:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginStatus](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoginStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.10.2024 14:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[NameRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.10.2024 14:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronomyc] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[SerialPassport] [int] NOT NULL,
	[NumberPassport] [int] NOT NULL,
	[DateBirth] [date] NOT NULL,
	[LastSeenDate] [date] NOT NULL,
	[LastSeenTime] [time](7) NOT NULL,
	[TypeLogin] [int] NOT NULL,
	[MaleFemale] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[FemaleMale] ([Id], [MaleFemaleName]) VALUES (1, N'жен')
INSERT [dbo].[FemaleMale] ([Id], [MaleFemaleName]) VALUES (2, N'муж')
GO
INSERT [dbo].[LoginStatus] ([Id], [Type]) VALUES (1, N'Неуспешно')
INSERT [dbo].[LoginStatus] ([Id], [Type]) VALUES (2, N'Успешно')
GO
INSERT [dbo].[Role] ([Id], [NameRole]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [NameRole]) VALUES (2, N'Исполнитель')
INSERT [dbo].[Role] ([Id], [NameRole]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (1, 3, N'Акимов', N'Ян', N'Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7781) 7855837', 2367, 558134, CAST(N'1993-07-03' AS Date), CAST(N'2023-01-08' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (2, 2, N'Гончарова', N'Ульяна', N'Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'(230) 906-8815', 7101, 669343, CAST(N'1975-06-22' AS Date), CAST(N'2023-01-09' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (3, 1, N'Анохина', N'Елизавета', N'Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'(555 444/8316', 3455, 719630, CAST(N'1991-08-16' AS Date), CAST(N'2023-01-10' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (4, 3, N'Николаев', N'Илья', N'Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'(392 682/4442', 2377, 871623, CAST(N'1970-12-22' AS Date), CAST(N'2023-01-11' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (5, 2, N'Уткин', N'Дмитрий', N'Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'(836 429/0386', 8755, 921148, CAST(N'1999-05-04' AS Date), CAST(N'2023-01-12' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (6, 2, N'Куликова', N'Стефания', N'Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'(283 945/3092', 4355, 104594, CAST(N'1994-12-06' AS Date), CAST(N'2023-01-13' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (7, 2, N'Волков', N'Егор', N'Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'(621 359/3669', 2791, 114390, CAST(N'1995-03-28' AS Date), CAST(N'2023-01-14' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (8, 1, N'Соколова', N'Софья', N'Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'(440 561/0314', 5582, 126286, CAST(N'1977-03-27' AS Date), CAST(N'2023-01-15' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (9, 3, N'Голубева', N'Полина', N'Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'(331 918/2434', 2978, 133653, CAST(N'1975-04-12' AS Date), CAST(N'2023-01-16' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (10, 3, N'Вишневская', N'Мария', N'Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7493) 2193942', 7512, 141956, CAST(N'1975-12-23' AS Date), CAST(N'2023-01-17' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (11, 3, N'Васильева', N'Арина', N'Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7407) 4855030', 5046, 158433, CAST(N'2000-01-22' AS Date), CAST(N'2023-01-18' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (12, 3, N'Павлов', N'Дмитрий', N'Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7919) 4782497', 2460, 169505, CAST(N'1983-10-03' AS Date), CAST(N'2023-01-19' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (13, 2, N'Горбунова', N'Мирослава', N'Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7482) 8029580', 3412, 174593, CAST(N'1998-03-03' AS Date), CAST(N'2023-01-20' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (14, 3, N'Демина', N'София', N'Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7455) 9446449', 4950, 183034, CAST(N'1993-06-08' AS Date), CAST(N'2023-01-21' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (15, 2, N'Петрова', N'Алина', N'Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7710) 3882563', 5829, 219464, CAST(N'1980-09-23' AS Date), CAST(N'2023-01-22' AS Date), CAST(N'13:07:20' AS Time), 1, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (16, 2, N'Плотников', N'Григорий', N'Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7759) 4523846', 6443, 208059, CAST(N'1991-03-13' AS Date), CAST(N'2023-01-23' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (17, 2, N'Прохорова', N'Есения', N'Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7687) 8011332', 7079, 213265, CAST(N'1998-04-14' AS Date), CAST(N'2023-01-24' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (18, 2, N'Чернов', N'Алексей', N'Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'(425) 783-2253', 8207, 522702, CAST(N'1980-04-16' AS Date), CAST(N'2023-01-25' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (19, 3, N'Горбунов', N'Степан', N'Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'(889) 449-4391', 9307, 232158, CAST(N'1993-07-23' AS Date), CAST(N'2023-01-26' AS Date), CAST(N'13:07:20' AS Time), 1, 2)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (20, 2, N'Рябинина', N'Софья', N'Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'(825) 301-8250', 1357, 242839, CAST(N'1990-06-01' AS Date), CAST(N'2023-01-27' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (21, 2, N'Козлова', N'Яна', N'Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'(397) 334-2086', 1167, 256636, CAST(N'1987-12-21' AS Date), CAST(N'2023-01-28' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (22, 3, N'Лукьянова', N'Ульяна', N'Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'(241) 570-3040', 1768, 266986, CAST(N'1981-10-22' AS Date), CAST(N'2023-01-29' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (23, 2, N'Кондрашова', N'Арина', N'Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'(713) 462-8265', 1710, 427875, CAST(N'1976-12-22' AS Date), CAST(N'2023-01-30' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (24, 3, N'Быкова', N'Виктория', N'Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'(854) 822-2331', 1806, 289145, CAST(N'1973-06-14' AS Date), CAST(N'2023-01-31' AS Date), CAST(N'13:07:20' AS Time), 2, 1)
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronomyc], [Email], [Login], [Password], [PhoneNumber], [SerialPassport], [NumberPassport], [DateBirth], [LastSeenDate], [LastSeenTime], [TypeLogin], [MaleFemale]) VALUES (25, 2, N'Гуляев', N'Тимофей', N'Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'(439) 713-6117', 1587, 291249, CAST(N'1987-02-05' AS Date), CAST(N'2023-02-01' AS Date), CAST(N'13:07:20' AS Time), 2, 2)
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_LoginStatus] FOREIGN KEY([TypeLogin])
REFERENCES [dbo].[LoginStatus] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_LoginStatus]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_MaleFemale] FOREIGN KEY([MaleFemale])
REFERENCES [dbo].[FemaleMale] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_MaleFemale]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Sports] SET  READ_WRITE 
GO
