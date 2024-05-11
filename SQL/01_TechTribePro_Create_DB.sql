USE [master]

IF db_id('TechTribePro') IS NULL
  CREATE DATABASE [TechTribePro]
GO

USE [TechTribePro]
GO

DROP TABLE IF EXISTS [EmployeeTickets];
DROP TABLE IF EXISTS [Customers];
DROP TABLE IF EXISTS [ServiceTickets];
DROP TABLE IF EXISTS [Employees];
DROP TABLE IF EXISTS [UserType];
DROP TABLE IF EXISTS [UserProfile];
GO

CREATE TABLE [UserType] (
  [Id] integer PRIMARY KEY IDENTITY,
  [Name] nvarchar(20) NOT NULL
)

CREATE TABLE [UserProfile] (
  [Id] integer PRIMARY KEY IDENTITY,
  [FirstName] nvarchar(50) NOT NULL,
  [LastName] nvarchar(50) NOT NULL,
  [Email] nvarchar(200) NOT NULL,
  [Password] nvarchar(200) NOT NULL,
  [ImageLocation] nvarchar(255),
  [UserTypeId] integer NOT NULL,

  CONSTRAINT [FK_User_UserType] FOREIGN KEY ([UserTypeId]) REFERENCES [UserType] ([Id]),
)

CREATE TABLE [Employees] (
  [Id] integer PRIMARY KEY IDENTITY,
  [Specialty] nvarchar(255) NOT NULL,
  [Rate] decimal NOT NULL,
  [UserProfileId] integer NOT NULL,
  
  CONSTRAINT [FK_Employees_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [Customers] (
  [Id] integer PRIMARY KEY IDENTITY,
  [Address] nvarchar(50) NOT NULL,
  [PhoneNumber] nvarchar(50) NOT NULL,
  [UserProfileId] integer NOT NULL,
  
  CONSTRAINT [FK_Customers_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [ServiceTickets] (
  [Id] integer PRIMARY KEY IDENTITY,
  [UserProfileId] integer NOT NULL,
  [Description] text NOT NULL,
  [IsEmergency] bit NOT NULL,
  [DateCompleted] datetime NOT NULL,

  CONSTRAINT [FK_ServiceTickets_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
)

CREATE TABLE [EmployeeTickets] (
  [Id] integer PRIMARY KEY IDENTITY,
  [EmployeeId] integer NOT NULL,
  [ServiceTicketId] integer NOT NULL,

  CONSTRAINT [FK_EmployeeTickets_ServiceTickets] FOREIGN KEY ([ServiceTicketId]) REFERENCES [ServiceTickets] ([Id]),
  CONSTRAINT [FK_EmployeeTickets_Employees] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id])
)

GO
