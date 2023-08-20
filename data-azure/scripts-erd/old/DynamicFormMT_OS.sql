/****** Object:  Table [pmm].[FieldType]    Script Date: 7/17/2023 12:20:33 PM ******/
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

/****** Object:  Table [pmm].[Option]    Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Option] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [FieldId] INT NOT NULL,
  [Name] TEXT NOT NULL,
  [Order] INT NOT NULL,
  [Deleted] BIT NOT NULL,
  FOREIGN KEY ([FieldId]) REFERENCES [Field]([Id])
);

GO


/****** Object:  Table [pmm].[FieldDependency]   Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldDependency] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [DependsOn] INT NOT NULL,
  [DependencyOperatorId] INT NOT NULL,
  [TextCondition] TEXT NULL,
  [NumberCondition] INT NULL,
  [BooleanCondition] BIT NULL,
  [DataCondition] DATE NULL,
  [DateTimeCondition] DATETIME NOT NULL,
  [TimeCondition] TIME NOT NULL,
  [SingleOptionIdCondition] INT NULL,
  FOREIGN KEY ([DependsOn]) REFERENCES [Field]([FieldTypeID]),
  FOREIGN KEY ([DependencyOperatorId]) REFERENCES [Field]([FieldTypeID])
);
GO


/****** Object:  Table [pmm].[Section]   Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Section] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [FormId] INT NOT NULL,
  [Title] TEXT NOT NULL,
  [Order] INT,
  [Deleted] BIT NOT NULL,
  FOREIGN KEY ([FormId]) REFERENCES pmm.[Form]([ID]),
);
GO

/****** Object:  Table [pmm].[PracticeGroup]    Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[PracticeGroup] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Label] TEXT NOT NULL,
  [Order] INT NOT NULL,
  [Is_Active] BIT NOT NULL
);
GO

/****** Object:  Table [pmm].[FieldData]    Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [pmm].[FieldData] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [RecordId] TEXT NOT NULL, -- 
  [FieldId] INT NOT NULL,
  [TextValue] TEXT NULL,
  [NumberValue] INT NULL,
  [BooleanValue] BIT NULL,
  [DateValue] DATE NOT NULL,
  [DateTimeValue] DATETIME NOT NULL,
  [TimeValue] TIME,
  [SingleOptionIdCondition] INT,
  [MultipleOptionIdValue] INT,
  FOREIGN KEY ([RecordId]) REFERENCES [Field]([Id]),
  FOREIGN KEY ([FieldId]) REFERENCES [Field]([Id]),
  FOREIGN KEY ([SingleOptionIdCondition]) REFERENCES [Option]([Id])
);
GO

/****** Object:  Table [pmm].[DependencyOperator]   Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[DependencyOperator] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Label] TEXT NOT NULL,
  [Order] INT,
  [Is_Active] BIT NOT NULL
);
GO


/****** Object:  Table [pmm].[FormLogos]   Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FormLogos] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Logo] BINARY NOT NULL,
  [Program_Tenant_ID] INT NOT NULL,
 FOREIGN KEY ([Program_Tenant_ID]) REFERENCES pmm.[Program_Tenant_Id]([Program_Tenant_ID]),
);
GO



/****** Object:  Table [pmm].[Form]   Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Form] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Code] TEXT NOT NULL,
  [Version] TEXT NOT NULL,
  [FormName] TEXT NOT NULL,
  [FormDescription] TEXT NOT NULL,
--  [PracticeGroup] INT NOT NULL,
  [Program_Tenant_ID] INT NOT NULL,
 --  [FormlogoId] INT,
  FOREIGN KEY ([Program_Tenant_ID]) REFERENCES pmm.[Program_Tenant_Id]([Program_Tenant_ID]),
 -- FOREIGN KEY ([FormlogoId]) REFERENCES [FormLogos]([Id])
);
GO

/****** Object:  Table [pmm].[FieldDataFile]   Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[FieldDataFile] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Binary] VARBINARY(MAX) NOT NULL,
  [FileName] TEXT NOT NULL
);




CREATE TABLE pmm.[OS_users_Table] (
  [OS_User_Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Name] VARCHAR(100) NOT NULL ,
  [Username] VARCHAR(50) NOT NULL,
  [Password] VARCHAR(50) NOT NULL,
  [Email] NVARCHAR(50) NOT NULL,
  [MobilePhone] VARCHAR(20) NOT NULL,
  [External_id ] NVARCHAR(50) NOT NULL,
  [Creation_Date] DATE NOT NULL,
  [Last_Login] DATE NOT NULL,
  [Is_Active] VARCHAR(15) NOT NULL,
);



CREATE TABLE Pmm.[Users_Extended_MT] (
  [MT_User_id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Tenant_ID] NVARCHAR(100) NOT NULL,
  [OS_Id] INT,
  [Email] NVARCHAR(50) NOT NULL,
  [Field] NVARCHAR(50) NOT NULL,
  [Ethnicity] CHAR(50) NOT NULL,
  [GenderID] CHAR(50) NOT NULL,
  FOREIGN KEY ([OS_Id]) REFERENCES [pmm].[OS_users_Table] ([OS_User_Id]),
  FOREIGN KEY ([Tenant_ID]) REFERENCES [pmm].[Program_Tenant_Id] ([Program_Tenant_ID]),
);



CREATE TABLE pmm.[Program_Tenant_Id] (
  [Program_Tenant_ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [TenateName] NVARCHAR(50) NOT NULL,
  [Is_Active] NVARCHAR(50) NOT NULL,
  
);

