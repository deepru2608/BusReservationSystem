USE [master]
GO
/****** Object:  Database [BusReservationSystemDB]    Script Date: 2020-03-18 5:43:05 PM ******/
CREATE DATABASE [BusReservationSystemDB] ON  PRIMARY 
( NAME = N'BusReservationSystemDB', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\BusReservationSystemDB.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BusReservationSystemDB_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\BusReservationSystemDB_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BusReservationSystemDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusReservationSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusReservationSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusReservationSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusReservationSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BusReservationSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusReservationSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusReservationSystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BusReservationSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [BusReservationSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusReservationSystemDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BusReservationSystemDB', N'ON'
GO
USE [BusReservationSystemDB]
GO
/****** Object:  Table [dbo].[AutoIdGenerate]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoIdGenerate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntryTimeStamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutoIdTicketGenerate]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoIdTicketGenerate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntryTimeStamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOKING_MASTER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOOKING_MASTER](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[P_No] [varchar](20) NOT NULL,
	[T_No] [varchar](20) NOT NULL,
	[Source] [varchar](20) NOT NULL,
	[Destination] [varchar](20) NOT NULL,
	[JourneyDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Time_Stamp] [datetime] NULL,
	[Canel_Id] [varchar](20) NULL,
	[T_Amount] [int] NULL,
	[Bus_Id] [int] NULL,
	[NoOfPassenger] [int] NULL,
	[Booking_Status] [int] NULL,
	[Book_By_Id] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUS_MASTER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUS_MASTER](
	[Bus_Id] [int] IDENTITY(1,1) NOT NULL,
	[Bus_Name] [varchar](50) NOT NULL,
	[Bus_Price] [numeric](18, 0) NOT NULL,
	[Seats] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CANCEL_MASTER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CANCEL_MASTER](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cancel_Id] [varchar](20) NOT NULL,
	[Cancel_TimeStamp] [datetime] NULL,
	[P_No] [varchar](50) NOT NULL,
	[T_No] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cancel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHECK_AVAILABILITY]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHECK_AVAILABILITY](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[P_No] [varchar](20) NOT NULL,
	[T_No] [varchar](20) NOT NULL,
	[Booking_Date] [date] NULL,
	[Booking_Status] [int] NULL,
	[Bus_Id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOGIN_DETAILS]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGIN_DETAILS](
	[Login_Id] [varchar](200) NOT NULL,
	[Flag] [varchar](10) NULL,
	[Password] [varchar](1000) NULL,
	[Last_Login] [datetime] NULL,
	[USER_ROLE] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Login_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PASSENGER_MASTER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PASSENGER_MASTER](
	[P_Id] [int] IDENTITY(1,1) NOT NULL,
	[P_No] [varchar](50) NOT NULL,
	[P_Name] [varchar](50) NOT NULL,
	[P_Age] [numeric](18, 0) NOT NULL,
	[T_No] [varchar](50) NOT NULL,
	[P_Address] [varchar](500) NULL,
	[P_Mobile] [numeric](10, 0) NULL,
	[Gender] [varchar](10) NULL,
	[Time_Stamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REGISTER_DETAILS]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REGISTER_DETAILS](
	[Name] [varchar](100) NULL,
	[Email] [varchar](1000) NOT NULL,
	[Phone] [numeric](10, 0) NULL,
	[Password] [varchar](1000) NULL,
	[Creation_Time] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STATUS_CODE_MASTER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STATUS_CODE_MASTER](
	[Code] [int] NOT NULL,
	[Description] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_EXCEPTION_LOGGER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_EXCEPTION_LOGGER](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DATE_TIME] [datetime] NULL,
	[EXCEPTION_MESSAGE] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TICKET_MASTER]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TICKET_MASTER](
	[T_Id] [int] IDENTITY(1,1) NOT NULL,
	[T_No] [varchar](50) NOT NULL,
	[P_No] [varchar](50) NOT NULL,
	[T_Amount] [numeric](18, 0) NOT NULL,
	[Source] [varchar](20) NULL,
	[Destination] [varchar](20) NULL,
	[JourneyDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Time_Stamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[T_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AutoIdGenerate] ON 

INSERT [dbo].[AutoIdGenerate] ([Id], [EntryTimeStamp]) VALUES (1, CAST(N'2020-03-18 07:25:23.743' AS DateTime))
INSERT [dbo].[AutoIdGenerate] ([Id], [EntryTimeStamp]) VALUES (2, CAST(N'2020-03-18 12:07:05.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[AutoIdGenerate] OFF
SET IDENTITY_INSERT [dbo].[AutoIdTicketGenerate] ON 

INSERT [dbo].[AutoIdTicketGenerate] ([Id], [EntryTimeStamp]) VALUES (1, CAST(N'2020-03-18 07:25:25.590' AS DateTime))
INSERT [dbo].[AutoIdTicketGenerate] ([Id], [EntryTimeStamp]) VALUES (2, CAST(N'2020-03-18 12:07:05.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[AutoIdTicketGenerate] OFF
SET IDENTITY_INSERT [dbo].[BOOKING_MASTER] ON 

INSERT [dbo].[BOOKING_MASTER] ([Id], [P_No], [T_No], [Source], [Destination], [JourneyDate], [ReturnDate], [Time_Stamp], [Canel_Id], [T_Amount], [Bus_Id], [NoOfPassenger], [Booking_Status], [Book_By_Id]) VALUES (1, N'P2020318@1', N'T2020318@1', N'Delhi', N'Agra', CAST(N'2020-03-20' AS Date), CAST(N'2020-03-21' AS Date), CAST(N'2020-03-18 07:25:53.697' AS DateTime), NULL, 200, 1, 1, 4, N'deepanshuruhela4@gmail.com')
INSERT [dbo].[BOOKING_MASTER] ([Id], [P_No], [T_No], [Source], [Destination], [JourneyDate], [ReturnDate], [Time_Stamp], [Canel_Id], [T_Amount], [Bus_Id], [NoOfPassenger], [Booking_Status], [Book_By_Id]) VALUES (2, N'P2020318@2', N'T2020318@2', N'Punjab', N'Mumbai', CAST(N'2020-03-23' AS Date), CAST(N'2020-03-27' AS Date), CAST(N'2020-03-18 12:07:05.633' AS DateTime), NULL, 500, 2, 1, 2, N'deepanshuruhela4@gmail.com')
SET IDENTITY_INSERT [dbo].[BOOKING_MASTER] OFF
SET IDENTITY_INSERT [dbo].[BUS_MASTER] ON 

INSERT [dbo].[BUS_MASTER] ([Bus_Id], [Bus_Name], [Bus_Price], [Seats]) VALUES (1, N'Normal Bus', CAST(200 AS Numeric(18, 0)), 20)
INSERT [dbo].[BUS_MASTER] ([Bus_Id], [Bus_Name], [Bus_Price], [Seats]) VALUES (2, N'Delux Bus', CAST(500 AS Numeric(18, 0)), 25)
INSERT [dbo].[BUS_MASTER] ([Bus_Id], [Bus_Name], [Bus_Price], [Seats]) VALUES (3, N'Super Delux Bus', CAST(1000 AS Numeric(18, 0)), 30)
INSERT [dbo].[BUS_MASTER] ([Bus_Id], [Bus_Name], [Bus_Price], [Seats]) VALUES (4, N'Normal AC Bus', CAST(300 AS Numeric(18, 0)), 22)
SET IDENTITY_INSERT [dbo].[BUS_MASTER] OFF
SET IDENTITY_INSERT [dbo].[CANCEL_MASTER] ON 

INSERT [dbo].[CANCEL_MASTER] ([Id], [Cancel_Id], [Cancel_TimeStamp], [P_No], [T_No]) VALUES (1, N'C_T2020318@1', CAST(N'2020-03-18 10:22:44.520' AS DateTime), N'P2020318@1', N'T2020318@1')
SET IDENTITY_INSERT [dbo].[CANCEL_MASTER] OFF
SET IDENTITY_INSERT [dbo].[CHECK_AVAILABILITY] ON 

INSERT [dbo].[CHECK_AVAILABILITY] ([Id], [P_No], [T_No], [Booking_Date], [Booking_Status], [Bus_Id]) VALUES (1, N'P2020318@1', N'T2020318@1', CAST(N'2020-03-21' AS Date), 4, 1)
INSERT [dbo].[CHECK_AVAILABILITY] ([Id], [P_No], [T_No], [Booking_Date], [Booking_Status], [Bus_Id]) VALUES (2, N'P2020318@1', N'T2020318@1', CAST(N'2020-03-20' AS Date), 4, 1)
INSERT [dbo].[CHECK_AVAILABILITY] ([Id], [P_No], [T_No], [Booking_Date], [Booking_Status], [Bus_Id]) VALUES (3, N'P2020318@2', N'T2020318@2', CAST(N'2020-03-27' AS Date), 2, 2)
INSERT [dbo].[CHECK_AVAILABILITY] ([Id], [P_No], [T_No], [Booking_Date], [Booking_Status], [Bus_Id]) VALUES (4, N'P2020318@2', N'T2020318@2', CAST(N'2020-03-23' AS Date), 2, 2)
SET IDENTITY_INSERT [dbo].[CHECK_AVAILABILITY] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (1, N'Delhi')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (2, N'Punjab')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (3, N'Agra')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (4, N'Mumbai')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (5, N'Shimla')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (6, N'Manali')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (7, N'Hapur')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (8, N'Meerut')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (9, N'Patna')
INSERT [dbo].[Location] ([LocationId], [LocationName]) VALUES (10, N'Haridwar')
SET IDENTITY_INSERT [dbo].[Location] OFF
INSERT [dbo].[LOGIN_DETAILS] ([Login_Id], [Flag], [Password], [Last_Login], [USER_ROLE]) VALUES (N'deepanshuruhela4@gmail.com', N'A', N'Proton@123', CAST(N'2020-03-17 23:19:35.460' AS DateTime), N'Vendor')
INSERT [dbo].[LOGIN_DETAILS] ([Login_Id], [Flag], [Password], [Last_Login], [USER_ROLE]) VALUES (N'just1deepak@gmail.com', N'A', N'Booking@123', CAST(N'2020-03-18 12:07:05.650' AS DateTime), N'User')
SET IDENTITY_INSERT [dbo].[PASSENGER_MASTER] ON 

INSERT [dbo].[PASSENGER_MASTER] ([P_Id], [P_No], [P_Name], [P_Age], [T_No], [P_Address], [P_Mobile], [Gender], [Time_Stamp]) VALUES (1, N'P2020318@1', N'Deepanshu Ruhela', CAST(20 AS Numeric(18, 0)), N'T2020318@1', N'U 1 18 First Floor Budhvihar Phase 1', CAST(9910013771 AS Numeric(10, 0)), N'Male', CAST(N'2020-03-18 07:25:53.713' AS DateTime))
INSERT [dbo].[PASSENGER_MASTER] ([P_Id], [P_No], [P_Name], [P_Age], [T_No], [P_Address], [P_Mobile], [Gender], [Time_Stamp]) VALUES (2, N'P2020318@2', N'Deepak Negi', CAST(25 AS Numeric(18, 0)), N'T2020318@2', N'U 1 18 First Floor Budhvihar Phase 1', CAST(9999454614 AS Numeric(10, 0)), N'Male', CAST(N'2020-03-18 12:07:05.633' AS DateTime))
SET IDENTITY_INSERT [dbo].[PASSENGER_MASTER] OFF
SET IDENTITY_INSERT [dbo].[REGISTER_DETAILS] ON 

INSERT [dbo].[REGISTER_DETAILS] ([Name], [Email], [Phone], [Password], [Creation_Time], [Gender], [Id]) VALUES (N'Deepanshu Ruhela', N'deepanshuruhela4@gmail.com', CAST(9910013771 AS Numeric(10, 0)), N'Proton@123', CAST(N'2020-03-17' AS Date), N'Male', 1)
INSERT [dbo].[REGISTER_DETAILS] ([Name], [Email], [Phone], [Password], [Creation_Time], [Gender], [Id]) VALUES (N'Deepak Negi', N'just1deepak@gmail.com', CAST(9999454614 AS Numeric(10, 0)), N'Booking@123', CAST(N'2020-03-18' AS Date), N'Male', 2)
SET IDENTITY_INSERT [dbo].[REGISTER_DETAILS] OFF
INSERT [dbo].[STATUS_CODE_MASTER] ([Code], [Description]) VALUES (1, N'Available')
INSERT [dbo].[STATUS_CODE_MASTER] ([Code], [Description]) VALUES (2, N'Booked')
INSERT [dbo].[STATUS_CODE_MASTER] ([Code], [Description]) VALUES (3, N'Pending')
INSERT [dbo].[STATUS_CODE_MASTER] ([Code], [Description]) VALUES (4, N'Cancel')
SET IDENTITY_INSERT [dbo].[TICKET_MASTER] ON 

INSERT [dbo].[TICKET_MASTER] ([T_Id], [T_No], [P_No], [T_Amount], [Source], [Destination], [JourneyDate], [ReturnDate], [Time_Stamp]) VALUES (1, N'T2020318@1', N'P2020318@1', CAST(200 AS Numeric(18, 0)), N'Delhi', N'Agra', CAST(N'2020-03-20' AS Date), CAST(N'2020-03-21' AS Date), CAST(N'2020-03-18 07:25:53.713' AS DateTime))
INSERT [dbo].[TICKET_MASTER] ([T_Id], [T_No], [P_No], [T_Amount], [Source], [Destination], [JourneyDate], [ReturnDate], [Time_Stamp]) VALUES (2, N'T2020318@2', N'P2020318@2', CAST(500 AS Numeric(18, 0)), N'Punjab', N'Mumbai', CAST(N'2020-03-23' AS Date), CAST(N'2020-03-27' AS Date), CAST(N'2020-03-18 12:07:05.633' AS DateTime))
SET IDENTITY_INSERT [dbo].[TICKET_MASTER] OFF
/****** Object:  StoredProcedure [dbo].[SP_ACCOUNT_MODULE]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ACCOUNT_MODULE]
@Name varchar(100)='',
@Email varchar(200)='',
@Mobile numeric(10)=0,
@Password varchar(1000)='',
@Gender varchar(6)='',
@User_Choice varchar(50)='',
@Role varchar(10)=''
As
Begin
	if(@User_Choice = 'Register')
	Begin
		Insert into REGISTER_DETAILS(Name, Email, Phone, Password, Creation_Time, Gender)
		values(@Name, @Email, @Mobile, @Password, GetDate(), @Gender);

		Insert into LOGIN_DETAILS(Login_Id, Flag, Password, Last_Login, USER_ROLE) 
		values(@Email, 'A', @Password, GETDATE(), @Role);
	End

	if(@User_Choice = 'Login')
	Begin
		Select USER_ROLE from LOGIN_DETAILS where Login_Id = @Email and  Password = @Password and Flag = 'A';
	End
End

GO
/****** Object:  StoredProcedure [dbo].[SP_AuthenticateUser]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_AuthenticateUser]
@UserName nvarchar(100),
@Password nvarchar(200)
as
Begin
  -- Check if the username and password match
  Select * from LOGIN_DETAILS
  where UPPER(Login_Id) = @UserName and UPPER(Password) = @Password and Flag = 'A'
End

GO
/****** Object:  StoredProcedure [dbo].[SP_Some_OtherTask]    Script Date: 2020-03-18 5:43:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Some_OtherTask]
@LogData varchar(MAX)='',
@UserChoice varchar(20)=''
As
Begin
	if (@UserChoice = 'LogException')
	Begin
		Insert into TBL_EXCEPTION_LOGGER (DATE_TIME, EXCEPTION_MESSAGE) values(GETDATE(), @LogData);
	End
End

GO
USE [master]
GO
ALTER DATABASE [BusReservationSystemDB] SET  READ_WRITE 
GO
