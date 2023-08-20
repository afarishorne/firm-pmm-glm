/****** Object:  Table pmm.[Users] Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE pmm.[Users] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Name] VARCHAR(100)  NULL ,
  [Username] VARCHAR(50) NULL,
  [Password] VARCHAR(50) NULL,
  [Email] NVARCHAR(50) NULL,
  [MobilePhone] VARCHAR(20) NULL,
  [External_id] NVARCHAR(100) NULL,
  [Creation_Date] DATETIME NULL,
  [Last_Login] DATETIME NULL,
  [Is_Active] INT NULL,
);
GO


/****** Object:  Table pmm.[UsersExtended] Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE pmm.[UsersExtended] (
  [UserId] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [TenantId] BIGINT NOT NULL,
  [OS_Id] BIGINT NOT NULL,
  [Email] NVARCHAR(50) NOT NULL,
  [Age] INT NOT NULL,
  [Ethnicity] CHAR(50) NOT NULL,
  [GenderId] CHAR(50) NOT NULL,
  FOREIGN KEY ([OS_Id]) REFERENCES [pmm].[Users] ([Id]),
  FOREIGN KEY ([TenantId]) REFERENCES [pmm].[Tenant] ([TenantId]),
);
GO 



/****** Object:  Table pmm.[Tenant]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE pmm.[Tenant] (
  [TenantId] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [TenateName] NVARCHAR(50) NOT NULL,
  [Is_Active] NVARCHAR(50) NOT NULL,
  
);
GO


/****** Object:  Table [pmm].[ApplicantsDocs]   Script Date: 7/24/2023 4:40:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[ApplicantsDocs](
	[ID] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [VARCHAR](MAX) NOT NULL,
	[BinaryData] VARBINARY(MAX) NOT NULL,
	[UploadedBy] VARCHAR(MAX) NOT NULL,
	[UploadedDate] DATETIME NOT NULL,
	[FormID] BIGINT NOT NULL,
	[TenantId] BIGINT NOT NULL,
	FOREIGN KEY ([FormID]) REFERENCES [pmm].[Form] ([Id]),
	FOREIGN KEY ([TenantId]) REFERENCES [pmm].[Tenant] ([TenantId]),
);
GO


/****** Object:  Table [pmm].[Form]   Script Date: 7/24/2023 4:40:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Form] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Code] NVARCHAR(100) NULL,
  [Version] INT  NOT NULL,
  [FormName] NVARCHAR(50) NULL,
  [FormDescription] NVARCHAR(100) NULL,
  [TenantId] BIGINT NOT NULL,
  FOREIGN KEY ([TenantId]) REFERENCES pmm.[Tenant]([TenantId]),
);
GO



/****** Object:  Table [pmm].[FormLogos]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FormLogos] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Logo] VARBINARY(MAX) NULL,
  [TenantId] BIGINT NOT NULL,
 FOREIGN KEY ([TenantId]) REFERENCES pmm.[Tenant]([TenantId]),
);
GO



/****** Object:  Table [pmm].[Section]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Section] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY,
  [FormId] BIGINT NOT NULL,
  [Title] NVARCHAR(100) NULL,
  [Order] INT null,
  [Deleted] BIT NOT NULL,
  FOREIGN KEY ([FormId]) REFERENCES pmm.[Form]([ID]),
);
GO


/****** Object:  Table [pmm].[FieldType]    Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldType] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
  [Label] NVARCHAR(50) NOT NULL,
  [Order] INT NOT NULL,
  [Is_Active] BIT NOT NULL
);
GO 


--====================================================================================================
/****** Object:  Table [pmm].[Field]    Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE PMM.Field ALTER COLUMN FieldTypeId BIGINT NOT NULL
CREATE TABLE [pmm].[Field] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT Null,
  [Label] NVARCHAR(100) NULL,
  [FieldTypeId] BIGINT NOT NULL,
  [SectionId] BIGINT NOT NULL,
  [Mandatory] BIT NOT NULL,
  [Order] INT NULL ,
  [Deleted] BIT NULL,
  --FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldType] ([ID]),
  --FOREIGN KEY ([SectionId]) REFERENCES [pmm].[Section] ([Id]),
  --FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldData] ([FieldId]),
  --FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[Option] ([FieldId]),
  --FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldDependency] ([Id]),
  --FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldDependency] ([DependsOn]),

);

GO

ALTER TABLE [pmm].[Field] ADD CONSTRAINT FK_Field_Type_Id  FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldType] ([ID]);
ALTER TABLE [pmm].[Field] ADD CONSTRAINT FK_Section_Id     FOREIGN KEY ([SectionId]) REFERENCES [pmm].[Section] ([Id]);

ALTER TABLE [pmm].[FieldData] ADD CONSTRAINT UQ_Field_Data_Field_Type_Id  UNIQUE ([FieldId]);
ALTER TABLE [pmm].[Field] ADD CONSTRAINT FK_Field_Data_Field_Type_Id  FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldData] ([FieldId]);

ALTER TABLE [pmm].[Option] ADD CONSTRAINT UQ_Option_Field_Type_Id  UNIQUE ([FieldId]);
ALTER TABLE [pmm].[Field] ADD CONSTRAINT FK_Option_Field_Type_Id  FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[Option] ([FieldId]);


ALTER TABLE [pmm].[FieldDependency] ADD CONSTRAINT UQ_FieldDependency_Field_Type_Id  UNIQUE ([Id]);
--ALTER TABLE [pmm].[Field] ADD CONSTRAINT FK_FieldDependency_Field_Type_Id  FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldDependency] ([Id]);

ALTER TABLE [pmm].[FieldDependency]  DROP CONSTRAINT UQ_FieldDependency_Field_Type_DependsOn
ALTER TABLE [pmm].[FieldDependency] ADD CONSTRAINT UQ_FieldDependency_Field_Type_DependsOn UNIQUE ([DependsOn]);
--ALTER TABLE [pmm].[Field] ADD CONSTRAINT FK_FieldDependency_Field_Type_DependsOn  FOREIGN KEY ([FieldTypeId]) REFERENCES [pmm].[FieldDependency] ([DependsOn]);




/****** Object:  Table [pmm].[Option]    Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE pmm.[Option] ALTER COLUMN FieldId INT 
CREATE TABLE [pmm].[Option] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [FieldId] NVARCHAR(100) NOT NULL,
  [Name] NVARCHAR(255) NOT NULL,
  [Order] INT NOT NULL,
  [Deleted] BIT NOT NULL,
  --FOREIGN KEY ([FieldId]) REFERENCES [pmm].[Field] ([FieldTypeId]),
  --FOREIGN KEY ([FieldId]) REFERENCES [pmm].[FieldDependency] ([SingleOptionIdCondition]),
  --FOREIGN KEY ([Id]) REFERENCES [pmm].[FieldData] ([SingleOptionIdValue]),

);

GO

ALTER TABLE [pmm].[Field] ADD CONSTRAINT UQ_Field_Type_Id  UNIQUE ([FieldTypeId]);
ALTER TABLE [pmm].[Option] ADD CONSTRAINT FK_FieldType_Id FOREIGN KEY ([FieldId]) REFERENCES [pmm].[Field] ([FieldTypeId]);

ALTER TABLE [pmm].[FieldDependency] ADD CONSTRAINT UQ_FieldDependency_SingleOptionIdCondition  UNIQUE ([SingleOptionIdCondition]);
--ALTER TABLE [pmm].[Option] ADD CONSTRAINT FK_FieldDependency_SingleOptionIdCondition FOREIGN KEY ([FieldId]) REFERENCES [pmm].[FieldDependency] ([SingleOptionIdCondition]);

ALTER TABLE [pmm].[FieldData]  DROP CONSTRAINT UQ_Field_Data_SingleOptionIdValue
ALTER TABLE [pmm].[FieldData] ADD CONSTRAINT UQ_Field_Data_SingleOptionIdValue  UNIQUE ([SingleOptionIdValue]);
ALTER TABLE [pmm].[Option] ADD CONSTRAINT FK_Field_Data_SingleOptionIdValue FOREIGN KEY ([Id]) REFERENCES [pmm].[FieldData] ([SingleOptionIdValue]);





/****** Object:  Table [pmm].[FieldDependency]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE pmm.FieldDependency ALTER COLUMN Id INT NOT NULL 
CREATE TABLE [pmm].[FieldDependency] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [DependsOn] NVARCHAR(100)  NULL,
  [DependencyOperatorId] BIGINT NULL,
  [TextCondition] NVARCHAR(255) NULL,
  [NumberCondition] DECIMAL(37) NULL,
  [BooleanCondition] BIT NULL,
  [DataCondition] DATE NULL,
  [DateTimeCondition] DATETIME  NULL,
  [TimeCondition] DATETIME  NULL,
  [SingleOptionIdCondition] NVARCHAR(100) NULL,
  --FOREIGN KEY ([Id]) REFERENCES [pmm].[Field]([FieldTypeID]),
  --FOREIGN KEY ([DependsOn]) REFERENCES [pmm].[Field]([FieldTypeID]),
  --FOREIGN KEY ([DependencyOperatorId]) REFERENCES [pmm].[DependencyOperatorId]([Id]),
  --FOREIGN KEY ([SingleOptionIdCondition]) REFERENCES [pmm].[Option]([FieldId])
);
GO


/****** Object:  Table [pmm].[DependencyOperator]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[DependencyOperator] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Label] NVARCHAR(255) NOT NULL,
  [Order] INT NOT NULL,
  [Is_Active] BIT NOT NULL,
  --FOREIGN KEY ([Id]) REFERENCES [pmm].[FieldDependency] ([DependencyOperatorId]),
);
GO
ALTER TABLE [pmm].[FieldData] ADD CONSTRAINT UQ_Field_Data_SingleOptionIdValue  UNIQUE ([SingleOptionIdValue]);
ALTER TABLE [pmm].[DependencyOperator] ADD CONSTRAINT FK_Dependency_Operator FOREIGN KEY ([Id]) REFERENCES [pmm].[FieldDependency] ([DependencyOperatorId]));








/****** Object:  Table [pmm].[FieldData]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE pmm.FieldData ALTER COLUMN SingleOptionIdValue BIGINT NOT NULL
CREATE TABLE [pmm].[FieldData] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
  [RecordId] NVARCHAR(100) NULL, 
  [FieldId] NVARCHAR(255) NULL,
  [TextValue] NVARCHAR(255) NULL,
  [NumberValue] DECIMAL(37) NULL,
  [BooleanValue] BIT NULL,
  [DateValue] DATE NULL,
  [DateTimeValue] DATETIME NULL,
  [TimeValue] DATETIME NULL,
  [SingleOptionIdValue] NVARCHAR(100) NULL,
  [MultipleOptionIdValue] NVARCHAR(100) NULL,
  --FOREIGN KEY ([FieldId]) REFERENCES [pmm].[Field] ([FieldTypeId]),
  --FOREIGN KEY ([SingleOptionIdValue]) REFERENCES [pmm].[Option] ([Id]),
  --FOREIGN KEY ([Id]) REFERENCES [pmm].[FieldDataFile] ([Id]),

);
GO


/****** Object:  Table [pmm].[FieldDataFile]   Script Date: 7/24/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[FieldDataFile] (
  [Id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Binary] VARBINARY(MAX) NOT NULL,
  [FileName] VARCHAR(MAX) NOT NULL,
 FOREIGN KEY ([Id]) REFERENCES [pmm].[FieldData] ([Id]),

);
GO

