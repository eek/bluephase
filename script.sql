USE [master]
GO
/****** Object:  Database [Bluephase]    Script Date: 17/05/2014 09:34:25 ******/
CREATE DATABASE [Bluephase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bluephase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bluephase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bluephase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bluephase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bluephase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bluephase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bluephase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bluephase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bluephase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bluephase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bluephase] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bluephase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bluephase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bluephase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bluephase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bluephase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bluephase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bluephase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bluephase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bluephase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bluephase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bluephase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bluephase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bluephase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bluephase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bluephase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bluephase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bluephase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bluephase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bluephase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bluephase] SET  MULTI_USER 
GO
ALTER DATABASE [Bluephase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bluephase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bluephase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bluephase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Bluephase]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](60) NOT NULL,
	[AddressLine2] [varchar](60) NULL,
	[City] [varchar](30) NOT NULL,
	[StateOrProvince] [varchar](50) NOT NULL,
	[PostalCode] [varchar](15) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactDetails](
	[ContactDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactDetails] PRIMARY KEY CLUSTERED 
(
	[ContactDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerAddresses]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerAddresses](
	[CustomerId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerContacts]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerContacts](
	[CustomerId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[Position] [varchar](30) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerContacts] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Terms] [varchar](30) NOT NULL,
	[VATNumber] [varchar](20) NOT NULL,
	[Approved] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_Customers_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_Customers_VATNumber] UNIQUE NONCLUSTERED 
(
	[VATNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentAudits]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentAudits](
	[DocumentAuditId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentVersionId] [int] NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DocumentAudits] PRIMARY KEY CLUSTERED 
(
	[DocumentAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[DocumentTypeId] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[PermissionsBytes] [varbinary](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentTypes]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentTypes](
	[DocumentTypeId] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DocumentTypes] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_DocumentTypes_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentVersions]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentVersions](
	[DocumentVersionId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[UniqueName] [uniqueidentifier] NOT NULL,
	[SHA1Hash] [binary](20) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DocumentVersions] PRIMARY KEY CLUSTERED 
(
	[DocumentVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeGroups]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeGroups](
	[EmployeeGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Description] [varchar](255) NULL,
	[Permissions] [varbinary](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_EmployeeGroups] PRIMARY KEY CLUSTERED 
(
	[EmployeeGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_EmployeeGroups_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Password] [char](88) NOT NULL,
	[Salt] [char](24) NOT NULL,
	[EmployeeGroupId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_Employees_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaterialForms]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaterialForms](
	[MaterialFormId] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[ParentMaterialFormId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StockForms] PRIMARY KEY CLUSTERED 
(
	[MaterialFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_StockForms_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MaterialFormId] [int] NOT NULL,
	[MinStockLevel] [float] NULL,
	[MaxStockLevel] [float] NULL,
	[UnitOfMeasurement] [varchar](20) NOT NULL,
	[ImageBytes] [varbinary](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_Materials_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaterialSuppliers]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSuppliers](
	[MaterialId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[SupplierContactId] [int] NOT NULL,
	[TenderDate] [datetime] NOT NULL,
	[Cost] [money] NOT NULL,
	[CostPer] [float] NOT NULL,
	[LeadTimeInDays] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MaterialSuppliers] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC,
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NonConformancies]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NonConformancies](
	[NonConformancyId] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderItemId] [int] NOT NULL,
	[PartVersionId] [int] NOT NULL,
	[RaisedOn] [datetime] NOT NULL,
	[RaisedBy] [int] NOT NULL,
	[QuantityAffected] [int] NOT NULL,
	[QuantityRejected] [int] NOT NULL,
	[Reason] [varchar](max) NOT NULL,
	[RemedialAction] [varchar](max) NOT NULL,
	[PreventativeAction] [varchar](max) NOT NULL,
	[ClosedOn] [datetime] NULL,
	[ClosedBy] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_NonConformancies] PRIMARY KEY CLUSTERED 
(
	[NonConformancyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartDocuments]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartDocuments](
	[PartId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PartDocuments] PRIMARY KEY CLUSTERED 
(
	[PartId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parts]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parts](
	[PartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DrawingNumber] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[AssemblyPartId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[PartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_Parts_CustomerId_DrawingNumber] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[DrawingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartVersionDocuments]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartVersionDocuments](
	[PartVersionId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PartVersionDocuments] PRIMARY KEY CLUSTERED 
(
	[PartVersionId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartVersionMaterials]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartVersionMaterials](
	[PartVersionMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[PartVersionId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[QuantityRequired] [float] NOT NULL,
	[QuantityPer] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PartVersionMaterials] PRIMARY KEY CLUSTERED 
(
	[PartVersionMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartVersions]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartVersions](
	[PartVersionId] [int] IDENTITY(1,1) NOT NULL,
	[PartId] [int] NOT NULL,
	[VersionNumber] [varchar](10) NOT NULL,
	[ImageBytes] [varbinary](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PartVersions] PRIMARY KEY CLUSTERED 
(
	[PartVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_PartVersions_PartId_VersionNumber] UNIQUE NONCLUSTERED 
(
	[PartId] ASC,
	[VersionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[People]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[People](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](8) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Suffix] [varchar](10) NULL,
	[NickName] [varchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonAddresses]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonAddresses](
	[PersonId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonAddresses] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonContactDetails]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonContactDetails](
	[PersonId] [int] NOT NULL,
	[ContactDetailId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonContactDetails] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[ContactDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionCentres]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionCentres](
	[ProductionCentreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UniqueName] [varchar](50) NOT NULL,
	[ProductionCentreTypeId] [int] NOT NULL,
	[HourlyRate] [money] NULL,
	[HoursPerWeek] [float] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionCentres] PRIMARY KEY CLUSTERED 
(
	[ProductionCentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_ProductionCentres_UniqueName] UNIQUE NONCLUSTERED 
(
	[UniqueName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductionCentreTypes]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionCentreTypes](
	[ProductionCentreTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DefaultHourlyRate] [money] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionCentreTypes] PRIMARY KEY CLUSTERED 
(
	[ProductionCentreTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_ProductionCentreTypes_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductionOperationDocuments]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionOperationDocuments](
	[ProductionOperationId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionOperationDocuments] PRIMARY KEY CLUSTERED 
(
	[ProductionOperationId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionOperationMaterials]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionOperationMaterials](
	[ProductionOperationMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[ProductionOperationId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[QuantityRequired] [float] NOT NULL,
	[QuantityPer] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionOperationMaterials] PRIMARY KEY CLUSTERED 
(
	[ProductionOperationMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionOperations]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionOperations](
	[ProductionOperationId] [int] IDENTITY(1,1) NOT NULL,
	[PartVersionId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[SetupTime] [float] NULL,
	[CycleTime] [float] NULL,
	[ProductionCentreId] [int] NOT NULL,
	[CostUpliftPercentage] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionOperations] PRIMARY KEY CLUSTERED 
(
	[ProductionOperationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductionOrderOperations]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionOrderOperations](
	[ProductionOrderOperationId] [int] IDENTITY(1,1) NOT NULL,
	[ProductionOrderId] [int] NOT NULL,
	[ProductionOperationId] [int] NOT NULL,
	[QuantityFinished] [int] NOT NULL,
	[ActualProductionCentreId] [int] NOT NULL,
	[ActualSetupTime] [float] NOT NULL,
	[ActualCycleTime] [float] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionOrderOperationId] PRIMARY KEY CLUSTERED 
(
	[ProductionOrderOperationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductionOrders]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionOrders](
	[ProductionOrderId] [int] NOT NULL,
	[SalesOrderItemId] [int] NOT NULL,
	[InternalReference] [varchar](10) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionOrders] PRIMARY KEY CLUSTERED 
(
	[ProductionOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrderItems]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrderItems](
	[PurchaseOrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[ProductionOrderId] [int] NULL,
	[Quantity] [float] NOT NULL,
	[ExpectedDelivery] [date] NOT NULL,
	[ActualDelivery] [date] NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderItems] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[SupplierPersonId] [int] NOT NULL,
	[InternalReference] [varchar](20) NULL,
	[OrderedOn] [datetime] NOT NULL,
	[HasBeenSent] [bit] NOT NULL,
	[HasBeenApproved] [bit] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesOrderItemBatches]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesOrderItemBatches](
	[SalesOrderItemBatchId] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderItemId] [int] NOT NULL,
	[BatchQuantity] [int] NOT NULL,
	[RequestedDeliveryDate] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrderItemBatches] PRIMARY KEY CLUSTERED 
(
	[SalesOrderItemBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesOrderItems]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesOrderItems](
	[SalesOrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderId] [int] NOT NULL,
	[CustomerOrderItemNumber] [varchar](10) NULL,
	[PartVersionId] [int] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrderItems] PRIMARY KEY CLUSTERED 
(
	[SalesOrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesOrders]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesOrders](
	[SalesOrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderNumber] [varchar](50) NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[PersonId] [int] NOT NULL,
	[HasBeenAcknowledged] [bit] NOT NULL,
	[HasBeenApproved] [bit] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED 
(
	[SalesOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierAddresses]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierAddresses](
	[SupplierId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SupplierAddresses] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC,
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierContacts]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierContacts](
	[SupplierId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[Position] [varchar](30) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SupplierContacts] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 17/05/2014 09:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Terms] [varchar](30) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedDate] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UIX_Suppliers_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_DocumentAudits_DocumentVersionId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_DocumentAudits_DocumentVersionId] ON [dbo].[DocumentAudits]
(
	[DocumentVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Documents_DocumentTypeId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_Documents_DocumentTypeId] ON [dbo].[Documents]
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Documents_FileName]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_Documents_FileName] ON [dbo].[Documents]
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NonConformancies_PartVersionId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_NonConformancies_PartVersionId] ON [dbo].[NonConformancies]
(
	[PartVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NonConformancies_SalesOrderItemId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_NonConformancies_SalesOrderItemId] ON [dbo].[NonConformancies]
(
	[SalesOrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Parts_Name]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_Parts_Name] ON [dbo].[Parts]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PartVersionMaterials_MaterialId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PartVersionMaterials_MaterialId] ON [dbo].[PartVersionMaterials]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PartVersionMaterials_PartVersionId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PartVersionMaterials_PartVersionId] ON [dbo].[PartVersionMaterials]
(
	[PartVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductionOperationMaterials_MaterialId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_ProductionOperationMaterials_MaterialId] ON [dbo].[ProductionOperationMaterials]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductionOperationMaterials_ProductionOperationId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_ProductionOperationMaterials_ProductionOperationId] ON [dbo].[ProductionOperationMaterials]
(
	[ProductionOperationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderItems_MaterialId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderItems_MaterialId] ON [dbo].[PurchaseOrderItems]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderItems_ProductionOrderId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderItems_ProductionOrderId] ON [dbo].[PurchaseOrderItems]
(
	[ProductionOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrderItems_PurchaseOrderId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderItems_PurchaseOrderId] ON [dbo].[PurchaseOrderItems]
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrders_SupplierContactId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrders_SupplierContactId] ON [dbo].[PurchaseOrders]
(
	[SupplierPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseOrders_SupplierId]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseOrders_SupplierId] ON [dbo].[PurchaseOrders]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Suppliers_IsApproved]    Script Date: 17/05/2014 09:34:25 ******/
CREATE NONCLUSTERED INDEX [IX_Suppliers_IsApproved] ON [dbo].[Suppliers]
(
	[IsApproved] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_ModifiedDate]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ContactDetails] ADD  CONSTRAINT [DF_ContactDetails_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ContactDetails] ADD  CONSTRAINT [DF_ContactDetails_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[CustomerAddresses] ADD  CONSTRAINT [DF_CustomerAddresses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[CustomerAddresses] ADD  CONSTRAINT [DF_CustomerAddresses_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[CustomerContacts] ADD  CONSTRAINT [DF_CustomerContacts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[CustomerContacts] ADD  CONSTRAINT [DF_CustomerContacts_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Terms]  DEFAULT ('Undefined') FOR [Terms]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_VATNumber]  DEFAULT ('Undefined') FOR [VATNumber]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Approved]  DEFAULT ((1)) FOR [Approved]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[DocumentAudits] ADD  CONSTRAINT [DF_DocumentAudits_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[DocumentTypes] ADD  CONSTRAINT [DF_DocumentTypes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[DocumentTypes] ADD  CONSTRAINT [DF_DocumentTypes_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[DocumentVersions] ADD  CONSTRAINT [DF_DocumentVersions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[EmployeeGroups] ADD  CONSTRAINT [DF_EmployeeGroups_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[EmployeeGroups] ADD  CONSTRAINT [DF_EmployeeGroups_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MaterialForms] ADD  CONSTRAINT [DF_MaterialForms_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MaterialForms] ADD  CONSTRAINT [DF_MaterialForms_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Materials] ADD  CONSTRAINT [DF_Materials_UnitOfMeasurement]  DEFAULT ('Undefined') FOR [UnitOfMeasurement]
GO
ALTER TABLE [dbo].[Materials] ADD  CONSTRAINT [DF_Materials_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Materials] ADD  CONSTRAINT [DF_Materials_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MaterialSuppliers] ADD  CONSTRAINT [DF_MaterialSuppliers_TenderDate]  DEFAULT (getdate()) FOR [TenderDate]
GO
ALTER TABLE [dbo].[MaterialSuppliers] ADD  CONSTRAINT [DF_MaterialSuppliers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MaterialSuppliers] ADD  CONSTRAINT [DF_MaterialSuppliers_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[NonConformancies] ADD  CONSTRAINT [DF_NonConformancies_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[NonConformancies] ADD  CONSTRAINT [DF_NonConformancies_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PartDocuments] ADD  CONSTRAINT [DF_PartDocuments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PartDocuments] ADD  CONSTRAINT [DF_PartDocuments_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Parts] ADD  CONSTRAINT [DF_Parts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Parts] ADD  CONSTRAINT [DF_Parts_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PartVersionDocuments] ADD  CONSTRAINT [DF_PartVersionDocuments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PartVersionDocuments] ADD  CONSTRAINT [DF_PartVersionDocuments_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PartVersionMaterials] ADD  CONSTRAINT [DF_PartVersionMaterials_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PartVersionMaterials] ADD  CONSTRAINT [DF_PartVersionMaterials_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PartVersions] ADD  CONSTRAINT [DF_PartVersions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PartVersions] ADD  CONSTRAINT [DF_PartVersions_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_People_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_People_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PersonContactDetails] ADD  CONSTRAINT [DF_PersonContactDetails_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PersonContactDetails] ADD  CONSTRAINT [DF_PersonContactDetails_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionCentres] ADD  CONSTRAINT [DF_ProductionCentres_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionCentres] ADD  CONSTRAINT [DF_ProductionCentres_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionCentreTypes] ADD  CONSTRAINT [DF_ProductionCentreTypes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionCentreTypes] ADD  CONSTRAINT [DF_ProductionCentreTypes_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionOperationDocuments] ADD  CONSTRAINT [DF_ProductionOperationDocuments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionOperationDocuments] ADD  CONSTRAINT [DF_ProductionOperationDocuments_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionOperationMaterials] ADD  CONSTRAINT [DF_ProductionOperationMaterials_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionOperationMaterials] ADD  CONSTRAINT [DF_ProductionOperationMaterials_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionOperations] ADD  CONSTRAINT [DF_PartVersionOperations_UpliftPercentage]  DEFAULT ((0)) FOR [CostUpliftPercentage]
GO
ALTER TABLE [dbo].[ProductionOperations] ADD  CONSTRAINT [DF_ProductionOperations_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionOperations] ADD  CONSTRAINT [DF_ProductionOperations_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionOrderOperations] ADD  CONSTRAINT [DF_ProductionOrderOperationId_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[ProductionOrderOperations] ADD  CONSTRAINT [DF_ProductionOrderOperations_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionOrderOperations] ADD  CONSTRAINT [DF_ProductionOrderOperations_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ProductionOrders] ADD  CONSTRAINT [DF_ProductionOrders_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[ProductionOrders] ADD  CONSTRAINT [DF_ProductionOrders_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductionOrders] ADD  CONSTRAINT [DF_ProductionOrders_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PurchaseOrderItems] ADD  CONSTRAINT [DF_PurchaseOrderItems_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[PurchaseOrderItems] ADD  CONSTRAINT [DF_PurchaseOrderItems_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PurchaseOrderItems] ADD  CONSTRAINT [DF_PurchaseOrderItems_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  CONSTRAINT [DF_PurchaseOrders_OrderedOn]  DEFAULT (getdate()) FOR [OrderedOn]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  CONSTRAINT [DF_PurchaseOrders_HasBeenSent]  DEFAULT ((0)) FOR [HasBeenSent]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  CONSTRAINT [DF_PurchaseOrders_HasBeenApproved]  DEFAULT ((0)) FOR [HasBeenApproved]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  CONSTRAINT [DF_PurchaseOrders_Status]  DEFAULT ('Not approved') FOR [Status]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  CONSTRAINT [DF_PurchaseOrders_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  CONSTRAINT [DF_PurchaseOrders_ModifiedOn_1]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[SalesOrderItemBatches] ADD  CONSTRAINT [DF_SalesOrderItemBatches_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[SalesOrderItemBatches] ADD  CONSTRAINT [DF_SalesOrderItemBatches_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SalesOrderItemBatches] ADD  CONSTRAINT [DF_SalesOrderItemBatches_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[SalesOrderItems] ADD  CONSTRAINT [DF_SalesOrderItems_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[SalesOrderItems] ADD  CONSTRAINT [DF_SalesOrderItems_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SalesOrderItems] ADD  CONSTRAINT [DF_SalesOrderItems_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[SalesOrders] ADD  CONSTRAINT [DF_SalesOrders_HasBeenAcknowledged]  DEFAULT ((0)) FOR [HasBeenAcknowledged]
GO
ALTER TABLE [dbo].[SalesOrders] ADD  CONSTRAINT [DF_SalesOrders_HasBeenApproved]  DEFAULT ((0)) FOR [HasBeenApproved]
GO
ALTER TABLE [dbo].[SalesOrders] ADD  CONSTRAINT [DF_SalesOrders_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[SalesOrders] ADD  CONSTRAINT [DF_SalesOrders_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SalesOrders] ADD  CONSTRAINT [DF_SalesOrders_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[SupplierAddresses] ADD  CONSTRAINT [DF_SupplierAddresses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SupplierAddresses] ADD  CONSTRAINT [DF_SupplierAddresses_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[SupplierContacts] ADD  CONSTRAINT [DF_SupplierContacts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SupplierContacts] ADD  CONSTRAINT [DF_SupplierContacts_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_Terms]  DEFAULT ('Undefined') FOR [Terms]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_IsApproved]  DEFAULT ((1)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_ApprovedDate]  DEFAULT (getdate()) FOR [ApprovedDate]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[CustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddresses_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[CustomerAddresses] CHECK CONSTRAINT [FK_CustomerAddresses_Addresses]
GO
ALTER TABLE [dbo].[CustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddresses_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddresses] CHECK CONSTRAINT [FK_CustomerAddresses_Customers]
GO
ALTER TABLE [dbo].[CustomerContacts]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContacts_Contacts] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[CustomerContacts] CHECK CONSTRAINT [FK_CustomerContacts_Contacts]
GO
ALTER TABLE [dbo].[CustomerContacts]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContacts_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerContacts] CHECK CONSTRAINT [FK_CustomerContacts_Customers]
GO
ALTER TABLE [dbo].[DocumentAudits]  WITH CHECK ADD  CONSTRAINT [FK_DocumentAudits_DocumentVersions] FOREIGN KEY([DocumentVersionId])
REFERENCES [dbo].[DocumentVersions] ([DocumentVersionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DocumentAudits] CHECK CONSTRAINT [FK_DocumentAudits_DocumentVersions]
GO
ALTER TABLE [dbo].[DocumentAudits]  WITH CHECK ADD  CONSTRAINT [FK_DocumentAudits_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[DocumentAudits] CHECK CONSTRAINT [FK_DocumentAudits_Employees]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_DocumentTypes] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentTypes] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_DocumentTypes]
GO
ALTER TABLE [dbo].[DocumentVersions]  WITH CHECK ADD  CONSTRAINT [FK_DocumentVersions_Documents] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
GO
ALTER TABLE [dbo].[DocumentVersions] CHECK CONSTRAINT [FK_DocumentVersions_Documents]
GO
ALTER TABLE [dbo].[EmployeeGroups]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeGroups_EmployeeGroups] FOREIGN KEY([EmployeeGroupId])
REFERENCES [dbo].[EmployeeGroups] ([EmployeeGroupId])
GO
ALTER TABLE [dbo].[EmployeeGroups] CHECK CONSTRAINT [FK_EmployeeGroups_EmployeeGroups]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeeGroups] FOREIGN KEY([EmployeeGroupId])
REFERENCES [dbo].[EmployeeGroups] ([EmployeeGroupId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeeGroups]
GO
ALTER TABLE [dbo].[MaterialForms]  WITH NOCHECK ADD  CONSTRAINT [FK_MaterialForms_MaterialForms] FOREIGN KEY([ParentMaterialFormId])
REFERENCES [dbo].[MaterialForms] ([MaterialFormId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MaterialForms] NOCHECK CONSTRAINT [FK_MaterialForms_MaterialForms]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialForms] FOREIGN KEY([MaterialFormId])
REFERENCES [dbo].[MaterialForms] ([MaterialFormId])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_MaterialForms]
GO
ALTER TABLE [dbo].[MaterialSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[MaterialSuppliers] CHECK CONSTRAINT [FK_MaterialSuppliers_Materials]
GO
ALTER TABLE [dbo].[MaterialSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[MaterialSuppliers] CHECK CONSTRAINT [FK_MaterialSuppliers_Suppliers]
GO
ALTER TABLE [dbo].[NonConformancies]  WITH CHECK ADD  CONSTRAINT [FK_NonConformancies_PartVersions] FOREIGN KEY([PartVersionId])
REFERENCES [dbo].[PartVersions] ([PartVersionId])
GO
ALTER TABLE [dbo].[NonConformancies] CHECK CONSTRAINT [FK_NonConformancies_PartVersions]
GO
ALTER TABLE [dbo].[NonConformancies]  WITH NOCHECK ADD  CONSTRAINT [FK_NonConformancies_People_ClosedBy] FOREIGN KEY([ClosedBy])
REFERENCES [dbo].[People] ([PersonId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[NonConformancies] NOCHECK CONSTRAINT [FK_NonConformancies_People_ClosedBy]
GO
ALTER TABLE [dbo].[NonConformancies]  WITH CHECK ADD  CONSTRAINT [FK_NonConformancies_People_RaisedBy] FOREIGN KEY([RaisedBy])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[NonConformancies] CHECK CONSTRAINT [FK_NonConformancies_People_RaisedBy]
GO
ALTER TABLE [dbo].[NonConformancies]  WITH CHECK ADD  CONSTRAINT [FK_NonConformancies_SalesOrderItems] FOREIGN KEY([SalesOrderItemId])
REFERENCES [dbo].[SalesOrderItems] ([SalesOrderItemId])
GO
ALTER TABLE [dbo].[NonConformancies] CHECK CONSTRAINT [FK_NonConformancies_SalesOrderItems]
GO
ALTER TABLE [dbo].[PartDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PartDocuments_Documents] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
GO
ALTER TABLE [dbo].[PartDocuments] CHECK CONSTRAINT [FK_PartDocuments_Documents]
GO
ALTER TABLE [dbo].[PartDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PartDocuments_Parts] FOREIGN KEY([PartId])
REFERENCES [dbo].[Parts] ([PartId])
GO
ALTER TABLE [dbo].[PartDocuments] CHECK CONSTRAINT [FK_PartDocuments_Parts]
GO
ALTER TABLE [dbo].[Parts]  WITH CHECK ADD  CONSTRAINT [FK_Parts_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Parts] CHECK CONSTRAINT [FK_Parts_Customers]
GO
ALTER TABLE [dbo].[Parts]  WITH NOCHECK ADD  CONSTRAINT [FK_Parts_Parts] FOREIGN KEY([AssemblyPartId])
REFERENCES [dbo].[Parts] ([PartId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Parts] NOCHECK CONSTRAINT [FK_Parts_Parts]
GO
ALTER TABLE [dbo].[PartVersionDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PartVersionDocuments_Documents] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
GO
ALTER TABLE [dbo].[PartVersionDocuments] CHECK CONSTRAINT [FK_PartVersionDocuments_Documents]
GO
ALTER TABLE [dbo].[PartVersionDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PartVersionDocuments_PartVersions] FOREIGN KEY([PartVersionId])
REFERENCES [dbo].[PartVersions] ([PartVersionId])
GO
ALTER TABLE [dbo].[PartVersionDocuments] CHECK CONSTRAINT [FK_PartVersionDocuments_PartVersions]
GO
ALTER TABLE [dbo].[PartVersionMaterials]  WITH CHECK ADD  CONSTRAINT [FK_PartVersionMaterials_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[PartVersionMaterials] CHECK CONSTRAINT [FK_PartVersionMaterials_Materials]
GO
ALTER TABLE [dbo].[PartVersionMaterials]  WITH CHECK ADD  CONSTRAINT [FK_PartVersionMaterials_PartVersions] FOREIGN KEY([PartVersionId])
REFERENCES [dbo].[PartVersions] ([PartVersionId])
GO
ALTER TABLE [dbo].[PartVersionMaterials] CHECK CONSTRAINT [FK_PartVersionMaterials_PartVersions]
GO
ALTER TABLE [dbo].[PartVersions]  WITH CHECK ADD  CONSTRAINT [FK_PartVersions_Parts] FOREIGN KEY([PartId])
REFERENCES [dbo].[Parts] ([PartId])
GO
ALTER TABLE [dbo].[PartVersions] CHECK CONSTRAINT [FK_PartVersions_Parts]
GO
ALTER TABLE [dbo].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Addresses]
GO
ALTER TABLE [dbo].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_People]
GO
ALTER TABLE [dbo].[PersonContactDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonContactDetails_ContactDetails] FOREIGN KEY([ContactDetailId])
REFERENCES [dbo].[ContactDetails] ([ContactDetailId])
GO
ALTER TABLE [dbo].[PersonContactDetails] CHECK CONSTRAINT [FK_PersonContactDetails_ContactDetails]
GO
ALTER TABLE [dbo].[PersonContactDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonContactDetails_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[PersonContactDetails] CHECK CONSTRAINT [FK_PersonContactDetails_People]
GO
ALTER TABLE [dbo].[ProductionCentres]  WITH CHECK ADD  CONSTRAINT [FK_ProductionCentres_ProductionCentreTypes] FOREIGN KEY([ProductionCentreTypeId])
REFERENCES [dbo].[ProductionCentreTypes] ([ProductionCentreTypeId])
GO
ALTER TABLE [dbo].[ProductionCentres] CHECK CONSTRAINT [FK_ProductionCentres_ProductionCentreTypes]
GO
ALTER TABLE [dbo].[ProductionOperationDocuments]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOperationDocuments_Documents] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
GO
ALTER TABLE [dbo].[ProductionOperationDocuments] CHECK CONSTRAINT [FK_ProductionOperationDocuments_Documents]
GO
ALTER TABLE [dbo].[ProductionOperationDocuments]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOperationDocuments_ProductionOperations] FOREIGN KEY([ProductionOperationId])
REFERENCES [dbo].[ProductionOperations] ([ProductionOperationId])
GO
ALTER TABLE [dbo].[ProductionOperationDocuments] CHECK CONSTRAINT [FK_ProductionOperationDocuments_ProductionOperations]
GO
ALTER TABLE [dbo].[ProductionOperationMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOperationMaterials_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[ProductionOperationMaterials] CHECK CONSTRAINT [FK_ProductionOperationMaterials_Materials]
GO
ALTER TABLE [dbo].[ProductionOperationMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOperationMaterials_ProductionOperations] FOREIGN KEY([ProductionOperationId])
REFERENCES [dbo].[ProductionOperations] ([ProductionOperationId])
GO
ALTER TABLE [dbo].[ProductionOperationMaterials] CHECK CONSTRAINT [FK_ProductionOperationMaterials_ProductionOperations]
GO
ALTER TABLE [dbo].[ProductionOperations]  WITH CHECK ADD  CONSTRAINT [FK_PartVersionOperations_PartVersions] FOREIGN KEY([PartVersionId])
REFERENCES [dbo].[PartVersions] ([PartVersionId])
GO
ALTER TABLE [dbo].[ProductionOperations] CHECK CONSTRAINT [FK_PartVersionOperations_PartVersions]
GO
ALTER TABLE [dbo].[ProductionOperations]  WITH CHECK ADD  CONSTRAINT [FK_PartVersionOperations_ProductionCentres] FOREIGN KEY([ProductionCentreId])
REFERENCES [dbo].[ProductionCentres] ([ProductionCentreId])
GO
ALTER TABLE [dbo].[ProductionOperations] CHECK CONSTRAINT [FK_PartVersionOperations_ProductionCentres]
GO
ALTER TABLE [dbo].[ProductionOrderOperations]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrderOperationId_ProductionCentres] FOREIGN KEY([ActualProductionCentreId])
REFERENCES [dbo].[ProductionCentres] ([ProductionCentreId])
GO
ALTER TABLE [dbo].[ProductionOrderOperations] CHECK CONSTRAINT [FK_ProductionOrderOperationId_ProductionCentres]
GO
ALTER TABLE [dbo].[ProductionOrderOperations]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrderOperationId_ProductionOperations] FOREIGN KEY([ProductionOperationId])
REFERENCES [dbo].[ProductionOperations] ([ProductionOperationId])
GO
ALTER TABLE [dbo].[ProductionOrderOperations] CHECK CONSTRAINT [FK_ProductionOrderOperationId_ProductionOperations]
GO
ALTER TABLE [dbo].[ProductionOrderOperations]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrderOperationId_ProductionOrders] FOREIGN KEY([ProductionOrderId])
REFERENCES [dbo].[ProductionOrders] ([ProductionOrderId])
GO
ALTER TABLE [dbo].[ProductionOrderOperations] CHECK CONSTRAINT [FK_ProductionOrderOperationId_ProductionOrders]
GO
ALTER TABLE [dbo].[ProductionOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductionOrders_SalesOrderItems] FOREIGN KEY([SalesOrderItemId])
REFERENCES [dbo].[SalesOrderItems] ([SalesOrderItemId])
GO
ALTER TABLE [dbo].[ProductionOrders] CHECK CONSTRAINT [FK_ProductionOrders_SalesOrderItems]
GO
ALTER TABLE [dbo].[PurchaseOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItems_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[PurchaseOrderItems] CHECK CONSTRAINT [FK_PurchaseOrderItems_Materials]
GO
ALTER TABLE [dbo].[PurchaseOrderItems]  WITH NOCHECK ADD  CONSTRAINT [FK_PurchaseOrderItems_ProductionOrders] FOREIGN KEY([ProductionOrderId])
REFERENCES [dbo].[ProductionOrders] ([ProductionOrderId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PurchaseOrderItems] NOCHECK CONSTRAINT [FK_PurchaseOrderItems_ProductionOrders]
GO
ALTER TABLE [dbo].[PurchaseOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrders] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[PurchaseOrderItems] CHECK CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrders]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_People] FOREIGN KEY([SupplierPersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurchaseOrders_People]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurchaseOrders_Suppliers]
GO
ALTER TABLE [dbo].[SalesOrderItemBatches]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderItemBatches_SalesOrderItems] FOREIGN KEY([SalesOrderItemId])
REFERENCES [dbo].[SalesOrderItems] ([SalesOrderItemId])
GO
ALTER TABLE [dbo].[SalesOrderItemBatches] CHECK CONSTRAINT [FK_SalesOrderItemBatches_SalesOrderItems]
GO
ALTER TABLE [dbo].[SalesOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderItems_PartVersions] FOREIGN KEY([PartVersionId])
REFERENCES [dbo].[PartVersions] ([PartVersionId])
GO
ALTER TABLE [dbo].[SalesOrderItems] CHECK CONSTRAINT [FK_SalesOrderItems_PartVersions]
GO
ALTER TABLE [dbo].[SalesOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderItems_SalesOrders] FOREIGN KEY([SalesOrderId])
REFERENCES [dbo].[SalesOrders] ([SalesOrderId])
GO
ALTER TABLE [dbo].[SalesOrderItems] CHECK CONSTRAINT [FK_SalesOrderItems_SalesOrders]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Customers]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_People]
GO
ALTER TABLE [dbo].[SupplierAddresses]  WITH CHECK ADD  CONSTRAINT [FK_SupplierAddresses_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[SupplierAddresses] CHECK CONSTRAINT [FK_SupplierAddresses_Addresses]
GO
ALTER TABLE [dbo].[SupplierAddresses]  WITH CHECK ADD  CONSTRAINT [FK_SupplierAddresses_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[SupplierAddresses] CHECK CONSTRAINT [FK_SupplierAddresses_Suppliers]
GO
ALTER TABLE [dbo].[SupplierContacts]  WITH CHECK ADD  CONSTRAINT [FK_SupplierContacts_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO
ALTER TABLE [dbo].[SupplierContacts] CHECK CONSTRAINT [FK_SupplierContacts_People]
GO
ALTER TABLE [dbo].[SupplierContacts]  WITH CHECK ADD  CONSTRAINT [FK_SupplierContacts_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[SupplierContacts] CHECK CONSTRAINT [FK_SupplierContacts_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [Bluephase] SET  READ_WRITE 
GO
