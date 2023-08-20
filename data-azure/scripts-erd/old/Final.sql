/****** Object:  Table pmm.[Users] Script Date: 7/23/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE pmm.[Users] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Name] VARCHAR(100) NOT NULL ,
  [Username] VARCHAR(50) NOT NULL,
  [Password] VARCHAR(50) NOT NULL,
  [Email] NVARCHAR(50) NOT NULL,
  [MobilePhone] VARCHAR(20) NOT NULL,
  [External_id] NVARCHAR(50) NOT NULL,
  [Creation_Date] DATE NOT NULL,
  [Last_Login] DATE NOT NULL,
  [Is_Active] VARCHAR(15) NOT NULL,
);
GO


/****** Object:  Table pmm.[UsersExtended] Script Date: 7/23/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE pmm.[UsersExtended] (
  [UserId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [TenantId] NVARCHAR(100) NOT NULL,
  [OS_Id] INT NOT NULL,
  [Email] NVARCHAR(50) NOT NULL,
  [Age] INT NOT NULL,
  [Ethnicity] CHAR(50) NOT NULL,
  [GenderId] CHAR(50) NOT NULL,
  FOREIGN KEY ([OS_Id]) REFERENCES [pmm].[Users] ([Id]),
  FOREIGN KEY ([Tenant_Id]) REFERENCES [pmm].[Tenant] ([TenantId]),
);
GO 


/****** Object:  Table pmm.[Tenant]   Script Date: 7/23/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE pmm.[Tenant] (
  [TenantId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [TenateName] NVARCHAR(50) NOT NULL,
  [Is_Active] NVARCHAR(50) NOT NULL,
  
);
GO


/****** Object:  Table [pmm].[ApplicantsDocs]   Script Date: 7/23/2023 4:40:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[ApplicantsDocs](
	[ID] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [VARCHAR](MAX) NOT NULL,
	[BinaryData] [VARBINARY](MAX) NOT NULL,
	[UploadedBy] [VARCHAR](MAX) NOT NULL,
	[UploadedDate] [DATE] NOT NULL,
	[FormID] INT NOT NULL,
	[TenantId] INT NOT NULL,
	FOREIGN KEY ([FormID]) REFERENCES [pmm].[Form] ([Id]),
	FOREIGN KEY ([TenantId]) REFERENCES [pmm].[Tenant] ([TenantId]),
);
GO


/****** Object:  Table [pmm].[Form]   Script Date: 7/23/2023 4:40:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Form] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Code] VARCHAR(50) NULL,
  [Version] VARCHAR(50) NULL,
  [FormName] VARCHAR(50) NULL,
  [FormDescription] VARCHAR(50) NULL,
  [TenantId] INT NOT NULL,
  FOREIGN KEY ([TenantId]) REFERENCES pmm.[Tenant]([TenantId]),
);
GO



/****** Object:  Table [pmm].[FormLogos]   Script Date: 7/23/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FormLogos] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Logo] BINARY NOT NULL,
  [TenantId] INT NOT NULL,
 FOREIGN KEY ([TenantId]) REFERENCES pmm.[Tenant]([TenantId]),
);
GO



/****** Object:  Table [pmm].[Section]   Script Date: 7/23/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Section] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [FormId] INT NOT NULL,
  [Title] NVARCHAR(50) NOT NULL,
  [Order] INT null,
  [Deleted] BIT NOT NULL,
  FOREIGN KEY ([FormId]) REFERENCES pmm.[Form]([ID]),
);
GO


/****** Object:  Table [pmm].[FieldType]    Script Date: 7/23/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldType] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Label] TEXT NOT NULL,
  [Order] INT NOT NULL,
  [Is_Active] BIT NOT NULL
);
GO 






/****** Object:  Table [pmm].[Field]    Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Field] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Label] TEXT NOT NULL,
  [FieldTypeId] INT NOT NULL,
  [SectionId] INT NOT NULL,
  [Mandatory] BIT NOT NULL,
  [Order] INT,
  [Deleted] BIT NOT NULL,
  FOREIGN KEY ([FieldTypeID]) REFERENCES [FieldType]([Id]),
  FOREIGN KEY ([SectionID]) REFERENCES [Section]([Id])
);

Go





