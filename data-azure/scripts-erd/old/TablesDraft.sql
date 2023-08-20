CREATE TABLE [Entity_Tables_Relation] (
  [TableId] Type,
  [TableName] Type,
  [TableDescription] Type,
  PRIMARY KEY ([TableId])
);

CREATE TABLE [Attributes_Columns] (
  [Columnid] Type,
  [TableId] Type,
  [ColumName] Type,
  [DataType] Type,
  [Size] Type,
  [IsNullable] Type,
  [IsPrimaryKey] Type,
  PRIMARY KEY ([Columnid])
);

CREATE TABLE [Rows_Tuples_Values] (
  [RowId] <type>,
  [TableId] <type>,
  [Columnid] <type>,
  [Value] <type>,
  PRIMARY KEY ([RowId])
);


CREATE TABLE Rows_Tuples_Values (
  RowID INT IDENTITY(1,1) PRIMARY KEY,
  TableID INT,
  ColumnID INT,
  Value NVARCHAR(MAX),
  FOREIGN KEY (TableID) REFERENCES Entity_Tables_Relation(TableID),
  FOREIGN KEY (ColumnID) REFERENCES Attributes_Columns(ColumnID)
);






CREATE TABLE [Program_Tenante_Id] (
  [Tenante_ID] Type,
  [TenateName] Type,
  [TableId] Type,
  [Columnid] Type,
  [RowId] Type,
  PRIMARY KEY ([Tenante_ID])
);



CREATE TABLE [Applicant] (
  [Id] <type>,
  [BusinessId] <type>,
  [ProiectName] <type>,
  [SubmitterUserid] <type>,
  [Tenante_ID] <type>,
  PRIMARY KEY ([Id])
);





