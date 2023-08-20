/****** Object:  Table [pmm].[Attributes_Columns]    Script Date: 7/23/2023 4:35:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Attributes_Columns](
	[ColumnId] [INT] IDENTITY(1,1) NOT NULL,
	[TableId] [INT] NOT NULL,
	[ColumnName] [NVARCHAR](255) NOT NULL,
	[DataType] [NVARCHAR](50) NULL,
	[Size] [INT] NULL,
	[IsNullable] [BIT] NULL,
	[IsPrimaryKey] [BIT] NULL,
PRIMARY KEY CLUSTERED 
(
	[ColumnId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [pmm].[Attributes_Columns]  WITH CHECK ADD FOREIGN KEY([TableId])
REFERENCES [pmm].[Entity_Tables_Relation] ([TableId])
GO




/****** Object:  Table [pmm].[Entity_Tables_Relation]    Script Date: 7/23/2023 4:36:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Entity_Tables_Relation](
	[TableId] [INT] IDENTITY(1,1) NOT NULL,
	[TableName] [NVARCHAR](255) NOT NULL,
	[TableDescription] [NVARCHAR](MAX) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****** Object:  Table [pmm].[Rows_Tuples_Values]    Script Date: 7/23/2023 4:37:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [pmm].[Rows_Tuples_Values](
	[RowId] [INT] IDENTITY(1,1) NOT NULL,
	[TableId] [INT] NOT NULL,
	[ColumnId] [INT] NOT NULL,
	[Value] [NVARCHAR](MAX) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [pmm].[Rows_Tuples_Values]  WITH CHECK ADD FOREIGN KEY([ColumnId])
REFERENCES [pmm].[Attributes_Columns] ([ColumnId])
GO

ALTER TABLE [pmm].[Rows_Tuples_Values]  WITH CHECK ADD FOREIGN KEY([TableId])
REFERENCES [pmm].[Entity_Tables_Relation] ([TableId])
GO












