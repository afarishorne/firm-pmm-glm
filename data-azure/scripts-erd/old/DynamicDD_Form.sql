/****** Object:  Table [pmm].[Entity_Tables_Relation]  Script Date: 7/17/2023 12:20:33 PM ******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[Entity_Tables_Relation] (
  [TableId] INT IDENTITY(1,1) PRIMARY KEY,
  [TableName] NVARCHAR(255) NOT NULL,
  [TableDescription] NVARCHAR(MAX) NOT NULL,
);
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[Attributes_Columns] (
  [ColumnId] INT IDENTITY(1,1) PRIMARY KEY,
  [TableId] INT NOT NULL,
  [ColumnName] NVARCHAR(255) NOT NULL,
  [DataType] NVARCHAR(50),
  [Size] INT,
  [IsNullable] BIT,
  [IsPrimaryKey] BIT,
  FOREIGN KEY ([TableId]) REFERENCES [pmm].[Entity_Tables_Relation]([TableId])
);
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pmm].[Rows_Tuples_Values] (
  [RowId] INT IDENTITY(1,1) PRIMARY KEY,
  [TableId] INT NOT NULL,
  [ColumnId] INT NOT NULL,
  [Value] NVARCHAR(MAX) NOT NULL,
  FOREIGN KEY ([TableId]) REFERENCES [pmm].[Entity_Tables_Relation]([TableId]),
  FOREIGN KEY ([ColumnId]) REFERENCES [pmm].[Attributes_Columns]([ColumnId])
);
GO