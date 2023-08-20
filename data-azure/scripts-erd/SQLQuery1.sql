CREATE TABLE pmm.[Users] (
  [Id] NVARCHAR(50) IDENTITY (1,1) PRIMARY KEY NOT NULL,
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



CREATE TABLE pmm.[Users] (
  [Id] BIGINT PRIMARY KEY NOT NULL,
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
