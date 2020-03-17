USE [master]
GO
/****** Object:  Database [BusReservationSystemDB]    Script Date: 2020-03-17 11:55:48 PM ******/
CREATE DATABASE [BusReservationSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BusReservationSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BusReservationSystemDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BusReservationSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BusReservationSystemDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BusReservationSystemDB] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [BusReservationSystemDB] SET AUTO_CREATE_STATISTICS ON 
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
ALTER DATABASE [BusReservationSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusReservationSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BusReservationSystemDB', N'ON'
GO
USE [BusReservationSystemDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ACCOUNT_MODULE]    Script Date: 2020-03-17 11:55:49 PM ******/
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
@User_Choice varchar(50)=''
As
Begin
	if(@User_Choice = 'Register')
	Begin
		Insert into REGISTER_DETAILS(Name, Email, Phone, Password, Creation_Time, Gender)
		values(@Name, @Email, @Mobile, @Password, GetDate(), @Gender);

		Insert into LOGIN_DETAILS(Login_Id, Flag, Password, Last_Login, USER_ROLE) 
		values(@Email, 'A', @Password, GETDATE(), 'User');
	End

	if(@User_Choice = 'Login')
	Begin
		Select USER_ROLE from LOGIN_DETAILS where Login_Id = @Email and  Password = @Password and Flag = 'A';
	End
End
GO
/****** Object:  StoredProcedure [dbo].[SP_AuthenticateUser]    Script Date: 2020-03-17 11:55:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Some_OtherTask]    Script Date: 2020-03-17 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[LOGIN_DETAILS]    Script Date: 2020-03-17 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[REGISTER_DETAILS]    Script Date: 2020-03-17 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[TBL_EXCEPTION_LOGGER]    Script Date: 2020-03-17 11:55:49 PM ******/
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
INSERT [dbo].[LOGIN_DETAILS] ([Login_Id], [Flag], [Password], [Last_Login], [USER_ROLE]) VALUES (N'deepanshuruhela4@gmail.com', N'A', N'Proton@123', CAST(0x0000AB81018068BE AS DateTime), N'User')
SET IDENTITY_INSERT [dbo].[REGISTER_DETAILS] ON 

INSERT [dbo].[REGISTER_DETAILS] ([Name], [Email], [Phone], [Password], [Creation_Time], [Gender], [Id]) VALUES (N'Deepanshu Ruhela', N'deepanshuruhela4@gmail.com', CAST(9910013771 AS Numeric(10, 0)), N'Proton@123', CAST(0xDC400B00 AS Date), N'Male', 1)
SET IDENTITY_INSERT [dbo].[REGISTER_DETAILS] OFF
USE [master]
GO
ALTER DATABASE [BusReservationSystemDB] SET  READ_WRITE 
GO
