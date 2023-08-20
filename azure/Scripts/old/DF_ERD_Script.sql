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
  FOREIGN KEY ([FormId]) REFERENCES [Field]([SectionId])
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
  [Logo] TEXT
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
  [PracticeGroup] INT NOT NULL,
  [FormlogoId] INT,
  FOREIGN KEY ([PracticeGroup]) REFERENCES [PracticeGroup]([Id]),
  FOREIGN KEY ([FormlogoId]) REFERENCES [FormLogos]([Id])
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



--------------------


/****** Object:  Table [pmm].[FileUpload]  Script Date: 7/17/2023 12:20:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE  TABLE [pmm].[FileUpload] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [Name] VARCHAR(MAX) NOT NULL,
  [BinaryData] VARBINARY(MAX)  NOT NULL,
  [UploadedBy] VARCHAR(MAX) NOT NULL,
  [UploadedDate] DATE NOT NULL

);

GO

SELECT * FROM  [pmm].[FileUpload]


Id
BusinessId
ApplicationStatusid
ApplicantName
County
ProiectName
UEI
Magic
FederalTaxIdentifier
Currentstep
CreatedOn
CreatedBy
UpdatedOn
UpdatedBy
SubmitterUserid
Submittedon
ReSubmittedOn
AnalystUserid
AnalystOn
ManagerUserid
ManagerOn
FundingRound
PreviousFundingRound
Approved FundingAmount