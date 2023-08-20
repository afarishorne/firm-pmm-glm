/****** Object:  Table [pmm].[ApplicantsDocs]    Script Date: 7/31/2023 11:13:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[ApplicantsDocs](
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR](MAX) NOT NULL,
	[BinaryData] [VARBINARY](MAX) NOT NULL,
	[UploadedBy] [VARCHAR](MAX) NOT NULL,
	[UploadedDate] [DATETIME] NOT NULL,
	[FormID] [BIGINT] NOT NULL,
	[TenantId] [BIGINT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [pmm].[ApplicantsDocs]  WITH CHECK ADD FOREIGN KEY([FormID])
REFERENCES [pmm].[Form] ([Id])
GO

ALTER TABLE [pmm].[ApplicantsDocs]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [pmm].[Tenant] ([TenantId])
GO





/****** Object:  Table [pmm].[DependencyOperator]    Script Date: 7/31/2023 11:14:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[DependencyOperator](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Label] [NVARCHAR](255) NOT NULL,
	[Order] [INT] NOT NULL,
	[Is_Active] [BIT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO






/****** Object:  Table [pmm].[Field]    Script Date: 7/31/2023 11:16:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Field](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Label] [NVARCHAR](100) NULL,
	[FieldTypeId] [INT] NOT NULL,
	[SectionId] [BIGINT] NOT NULL,
	[Mandatory] [BIT] NOT NULL,
	[Order] [INT] NULL,
	[Deleted] [BIT] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Field_Type_Id] UNIQUE NONCLUSTERED 
(
	[FieldTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [pmm].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Field_Data_Field_Type_Id] FOREIGN KEY([FieldTypeId])
REFERENCES [pmm].[FieldData] ([FieldId])
GO

ALTER TABLE [pmm].[Field] CHECK CONSTRAINT [FK_Field_Data_Field_Type_Id]
GO

ALTER TABLE [pmm].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Field_Type_Id] FOREIGN KEY([FieldTypeId])
REFERENCES [pmm].[FieldType] ([Id])
GO

ALTER TABLE [pmm].[Field] CHECK CONSTRAINT [FK_Field_Type_Id]
GO

ALTER TABLE [pmm].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Option_Field_Type_Id] FOREIGN KEY([FieldTypeId])
REFERENCES [pmm].[Option] ([FieldId])
GO

ALTER TABLE [pmm].[Field] CHECK CONSTRAINT [FK_Option_Field_Type_Id]
GO

ALTER TABLE [pmm].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Section_Id] FOREIGN KEY([SectionId])
REFERENCES [pmm].[Section] ([Id])
GO

ALTER TABLE [pmm].[Field] CHECK CONSTRAINT [FK_Section_Id]
GO





/****** Object:  Table [pmm].[FieldData]    Script Date: 7/31/2023 11:17:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldData](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[RecordId] [NVARCHAR](100) NULL,
	[FieldId] [INT] NOT NULL,
	[TextValue] [NVARCHAR](255) NULL,
	[NumberValue] [DECIMAL](37, 0) NULL,
	[BooleanValue] [BIT] NULL,
	[DateValue] [DATE] NULL,
	[DateTimeValue] [DATETIME] NULL,
	[TimeValue] [DATETIME] NULL,
	[SingleOptionIdValue] [BIGINT] NOT NULL,
	[MultipleOptionIdValue] [NVARCHAR](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Field_Data_Field_Type_Id] UNIQUE NONCLUSTERED 
(
	[FieldId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Field_Data_SingleOptionIdValue] UNIQUE NONCLUSTERED 
(
	[SingleOptionIdValue] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




/****** Object:  Table [pmm].[FieldDataFile]    Script Date: 7/31/2023 11:19:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldDataFile](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Binary] [VARBINARY](MAX) NOT NULL,
	[FileName] [VARCHAR](MAX) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [pmm].[FieldDataFile]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [pmm].[FieldData] ([Id])
GO




/****** Object:  Table [pmm].[FieldDependency]    Script Date: 7/31/2023 11:20:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldDependency](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[DependsOn] [NVARCHAR](100) NULL,
	[DependencyOperatorId] [BIGINT] NULL,
	[TextCondition] [NVARCHAR](255) NULL,
	[NumberCondition] [DECIMAL](37, 0) NULL,
	[BooleanCondition] [BIT] NULL,
	[DataCondition] [DATE] NULL,
	[DateTimeCondition] [DATETIME] NULL,
	[TimeCondition] [DATETIME] NULL,
	[SingleOptionIdCondition] [NVARCHAR](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FieldDependency_Field_Type_DependsOn] UNIQUE NONCLUSTERED 
(
	[DependsOn] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FieldDependency_Field_Type_Id] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FieldDependency_SingleOptionIdCondition] UNIQUE NONCLUSTERED 
(
	[SingleOptionIdCondition] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [pmm].[FieldType]    Script Date: 7/31/2023 11:20:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FieldType](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[Label] [NVARCHAR](50) NOT NULL,
	[Order] [INT] NOT NULL,
	[Is_Active] [BIT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




/****** Object:  Table [pmm].[Form]    Script Date: 7/31/2023 11:21:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Form](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Code] [NVARCHAR](100) NULL,
	[Version] [INT] NOT NULL,
	[FormName] [NVARCHAR](50) NULL,
	[FormDescription] [NVARCHAR](100) NULL,
	[TenantId] [BIGINT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [pmm].[Form]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [pmm].[Tenant] ([TenantId])
GO


/****** Object:  Table [pmm].[FormLogos]    Script Date: 7/31/2023 11:22:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[FormLogos](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Logo] [VARBINARY](MAX) NULL,
	[TenantId] [BIGINT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [pmm].[FormLogos]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [pmm].[Tenant] ([TenantId])
GO





/****** Object:  Table [pmm].[Option]    Script Date: 7/31/2023 11:22:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Option](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[FieldId] [INT] NOT NULL,
	[Name] [NVARCHAR](255) NOT NULL,
	[Order] [INT] NOT NULL,
	[Deleted] [BIT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Option_Field_Type_Id] UNIQUE NONCLUSTERED 
(
	[FieldId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [pmm].[Option]  WITH CHECK ADD  CONSTRAINT [FK_Field_Data_SingleOptionIdValue] FOREIGN KEY([Id])
REFERENCES [pmm].[FieldData] ([SingleOptionIdValue])
GO

ALTER TABLE [pmm].[Option] CHECK CONSTRAINT [FK_Field_Data_SingleOptionIdValue]
GO

ALTER TABLE [pmm].[Option]  WITH CHECK ADD  CONSTRAINT [FK_FieldType_Id] FOREIGN KEY([FieldId])
REFERENCES [pmm].[Field] ([FieldTypeId])
GO

ALTER TABLE [pmm].[Option] CHECK CONSTRAINT [FK_FieldType_Id]
GO


/****** Object:  Table [pmm].[Section]    Script Date: 7/31/2023 11:23:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Section](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[FormId] [BIGINT] NOT NULL,
	[Title] [NVARCHAR](100) NULL,
	[Order] [INT] NULL,
	[Deleted] [BIT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [pmm].[Section]  WITH CHECK ADD FOREIGN KEY([FormId])
REFERENCES [pmm].[Form] ([Id])
GO


/****** Object:  Table [pmm].[Tenant]    Script Date: 7/31/2023 11:24:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Tenant](
	[TenantId] [BIGINT] IDENTITY(1,1) NOT NULL,
	[TenateName] [NVARCHAR](50) NOT NULL,
	[Is_Active] [NVARCHAR](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [pmm].[Users]    Script Date: 7/31/2023 11:24:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Users](
	[Id] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR](100) NULL,
	[Username] [VARCHAR](50) NULL,
	[Password] [VARCHAR](50) NULL,
	[Email] [NVARCHAR](50) NULL,
	[MobilePhone] [VARCHAR](20) NULL,
	[External_id] [NVARCHAR](100) NULL,
	[Creation_Date] [DATETIME] NULL,
	[Last_Login] [DATETIME] NULL,
	[Is_Active] [INT] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [pmm].[UsersExtended]    Script Date: 7/31/2023 11:25:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[UsersExtended](
	[UserId] [BIGINT] IDENTITY(1,1) NOT NULL,
	[TenantId] [BIGINT] NOT NULL,
	[OS_Id] [BIGINT] NOT NULL,
	[Email] [NVARCHAR](50) NOT NULL,
	[Age] [INT] NOT NULL,
	[Ethnicity] [CHAR](50) NOT NULL,
	[GenderId] [CHAR](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [pmm].[UsersExtended]  WITH CHECK ADD FOREIGN KEY([OS_Id])
REFERENCES [pmm].[Users] ([Id])
GO

ALTER TABLE [pmm].[UsersExtended]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [pmm].[Tenant] ([TenantId])
GO


