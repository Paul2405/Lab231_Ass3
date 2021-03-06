USE [master]
GO
/****** Object:  Database [LAB231_HanaShop]    Script Date: 6/26/2021 6:24:00 PM ******/
CREATE DATABASE [LAB231_HanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB231_HanaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LAB231_HanaShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB231_HanaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LAB231_HanaShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAB231_HanaShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB231_HanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB231_HanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB231_HanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB231_HanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB231_HanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB231_HanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET RECOVERY FULL 
GO
ALTER DATABASE [LAB231_HanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [LAB231_HanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB231_HanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB231_HanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB231_HanaShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB231_HanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB231_HanaShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LAB231_HanaShop', N'ON'
GO
ALTER DATABASE [LAB231_HanaShop] SET QUERY_STORE = OFF
GO
USE [LAB231_HanaShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/26/2021 6:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CategoryName] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Status] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[RevisionDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Creator] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DiscountPercent] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[Creator] [int] NULL,
	[Code] [varchar](255) NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[CreatedDate] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Ward] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[UserId] [int] NULL,
	[DiscountId] [int] NULL,
	[FinalPrice] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Amount] [float] NULL,
	[OrderId] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductChangeHistorys]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductChangeHistorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColumnName] [nvarchar](max) NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ProductId] [int] NULL,
	[UserChangeId] [int] NULL,
 CONSTRAINT [PK_ProductChangeHistorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](max) NULL,
	[ProductName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[RevisionDate] [datetime] NULL,
	[UniPrice] [float] NULL,
	[Images] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[Status] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[Creator] [int] NULL,
	[Author] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/26/2021 6:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Fullname] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[Balance] [float] NULL,
	[Ward] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Images] [nvarchar](max) NULL,
	[Roles] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Discounts]    Script Date: 6/26/2021 6:24:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Discounts] ON [dbo].[Discounts]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Users] FOREIGN KEY([Creator])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Discounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Discounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users]
GO
ALTER TABLE [dbo].[ProductChangeHistorys]  WITH CHECK ADD  CONSTRAINT [FK_ProductChangeHistorys_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductChangeHistorys] CHECK CONSTRAINT [FK_ProductChangeHistorys_Products]
GO
ALTER TABLE [dbo].[ProductChangeHistorys]  WITH CHECK ADD  CONSTRAINT [FK_ProductChangeHistorys_Users] FOREIGN KEY([UserChangeId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ProductChangeHistorys] CHECK CONSTRAINT [FK_ProductChangeHistorys_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([Creator])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
USE [master]
GO
ALTER DATABASE [LAB231_HanaShop] SET  READ_WRITE 
GO
