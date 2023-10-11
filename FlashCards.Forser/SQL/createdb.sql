﻿USE master
GO
/****** Object:  Database [FlashCards]    Script Date: 2023-10-02 09:55:54 ******/
CREATE DATABASE [FlashCards]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlashCards', FILENAME = N'CHANGE THIS TO A PATH' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlashCards_log', FILENAME = N'CHANGE THIS TO A PATH' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlashCards] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlashCards].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlashCards] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [FlashCards] SET ANSI_NULLS ON 
GO
ALTER DATABASE [FlashCards] SET ANSI_PADDING ON 
GO
ALTER DATABASE [FlashCards] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [FlashCards] SET ARITHABORT ON 
GO
ALTER DATABASE [FlashCards] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlashCards] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlashCards] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlashCards] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlashCards] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [FlashCards] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [FlashCards] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlashCards] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [FlashCards] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlashCards] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlashCards] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlashCards] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlashCards] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlashCards] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlashCards] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlashCards] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlashCards] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlashCards] SET RECOVERY FULL 
GO
ALTER DATABASE [FlashCards] SET  MULTI_USER 
GO
ALTER DATABASE [FlashCards] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlashCards] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlashCards] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlashCards] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlashCards] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlashCards] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FlashCards] SET QUERY_STORE = OFF
GO
USE [FlashCards]
GO
/****** Object:  Table [dbo].[FlashCards]    Script Date: 2023-10-02 09:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlashCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Front] [nvarchar](max) NOT NULL,
	[Back] [nvarchar](max) NOT NULL,
	[StackId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stacks]    Script Date: 2023-10-02 09:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudyRecords]    Script Date: 2023-10-02 09:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudyRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionDate] [datetime] NOT NULL,
	[StackName] [nvarchar](50) NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_StudyRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlashCards]  WITH CHECK ADD  CONSTRAINT [FK_FlashCards_Stacks] FOREIGN KEY([StackId])
REFERENCES [dbo].[Stacks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FlashCards] CHECK CONSTRAINT [FK_FlashCards_Stacks]
GO
USE [master]
GO
ALTER DATABASE [FlashCards] SET  READ_WRITE 
GO