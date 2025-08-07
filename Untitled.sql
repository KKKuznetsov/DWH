CREATE TABLE [reports] (
  [ReportId] integer PRIMARY KEY,
  [ReportName] nvarchar(255),
  [DistributorId] nvarchar(255),
  [Year] integer,
  [Month] integer,
  [Type_functions] nvarchar(255)
)
GO

CREATE TABLE [Report_provider_mapping] (
  [DistributorId] integer PRIMARY KEY,
  [DistributorType] nvarchar(255),
  [DistributorName] nvarchar(255)
)
GO

CREATE TABLE [Fact] (
  [ReportId] integer,
  [Id_RNC] integer,
  [SKU_Hash] nvarchar(255),
  [Distib_Hash] nvarchar(255),
  [Client_Hash] nvarchar(255),
  [Market] nvarchar(255),
  [Amount] integer
)
GO

CREATE TABLE [Clients] (
  [Id_RNC] integer PRIMARY KEY,
  [Adress] nvarchar(255),
  [INN] nvarchar(255),
  [inlaw] nvarchar(255),
  [GeoCoordinate] nvarchar(255),
  [Client_type] nvarchar(255),
  [Subjects] nvarchar(255),
  [City] nvarchar(255),
  [Municipality] nvarchar(255),
  [AO_Moscow] nvarchar(255)
)
GO

CREATE TABLE [SKU] (
  [SKU_Hash] nvarchar(255) PRIMARY KEY,
  [SKU] nvarchar(255),
  [SKU_ish] nvarchar(255),
  [Product_Brand] nvarchar(255)
)
GO

CREATE TABLE [Distrib_in_Report] (
  [Distrib_Hash] nvarchar(255) PRIMARY KEY,
  [Distributor] nvarchar(255),
  [Distributor_Filial] nvarchar(255),
  [Distributor_Type] nvarchar(255)
)
GO

CREATE TABLE [Raw_Clients] (
  [Client_Hash] nvarchar(255) PRIMARY KEY,
  [Adress_ish] nvarchar(255),
  [Name_ish] nvarchar(255),
  [inlaw_ish] nvarchar(255),
  [INN_ish] nvarchar(255),
  [pharmacy_number_ish] nvarchar(255),
  [Region_ish] nvarchar(255),
  [City_ish] nvarchar(255)
)
GO

ALTER TABLE [reports] ADD FOREIGN KEY ([DistributorId]) REFERENCES [Report_provider_mapping] ([DistributorId])
GO

ALTER TABLE [reports] ADD FOREIGN KEY ([ReportId]) REFERENCES [Fact] ([ReportId])
GO

ALTER TABLE [Fact] ADD FOREIGN KEY ([Id_RNC]) REFERENCES [Clients] ([Id_RNC])
GO

ALTER TABLE [Fact] ADD FOREIGN KEY ([SKU_Hash]) REFERENCES [SKU] ([SKU_Hash])
GO

ALTER TABLE [Fact] ADD FOREIGN KEY ([Distib_Hash]) REFERENCES [Distrib_in_Report] ([Distrib_Hash])
GO

ALTER TABLE [Fact] ADD FOREIGN KEY ([Client_Hash]) REFERENCES [Raw_Clients] ([Client_Hash])
GO
