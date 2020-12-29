USE [DWBI]
GO


-- Creating a Staging Table to Load the data from Flat File into the Database
CREATE TABLE [dbo].[Stg_Health_Care_Provider_Credential](
	[CredentialNumber] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[MiddleName] [varchar](255) NULL,
	[CredentialType] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[BirthYear] [varchar](255) NULL,
	[CEDueDate] [varchar](255) NULL,
	[FirstIssueDate] [varchar](255) NULL,
	[LastIssueDate] [varchar](255) NULL,
	[ExpirationDate] [varchar](255) NULL,
	[ActionTaken] [varchar](255) NULL
) ON [PRIMARY]
GO

-- To view the loaded data into the Staging Table
SELECT * FROM Stg_Health_Care_Provider_Credential;

-- To clear data from the Staging Table
TRUNCATE TABLE Stg_Health_Care_Provider_Credential;


-- Creating a SELECT statement to load to data from the Staging Table into to Destination Table with proper Data Types
SELECT [CredentialNumber],
	   [LastName],
	   [FirstName],
	   [MiddleName],
	   [CredentialType],
	   [Status],
	   YEAR(CAST([BirthYear] AS DATE)) AS [BirthYear],
	   CAST([CEDueDate] AS DATE) AS [CEDueDate],
	   CAST([FirstIssueDate] AS DATE) AS [FirstIssueDate],
	   CAST([LastIssueDate] AS DATE) AS [LastIssueDate],
	   CAST([ExpirationDate] AS DATE) AS [ExpirationDate],
	   [ActionTaken]
FROM Stg_Health_Care_Provider_Credential;


-- Creating a Destination Tbale to Load the Data with proper Data Types from the Staging Table
CREATE TABLE [dbo].[Dst_Health_Care_Provider_Credential](
	[CredentialNumber] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[MiddleName] [varchar](255) NULL,
	[CredentialType] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[BirthYear] [date] NULL,
	[CEDueDate] [date] NULL,
	[FirstIssueDate] [date] NULL,
	[LastIssueDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[ActionTaken] [varchar](255) NULL
) ON [PRIMARY]
GO

-- To view the data loaded into the Destination Table
SELECT * FROM Dst_Health_Care_Provider_Credential;

-- TO clear the data from the Destination Table
TRUNCATE TABLE Dst_Health_Care_Provider_Credential;


-- Creating a Reject Table to load the records containing errors into this table
CREATE TABLE [dbo].[Reject_Health_Care_Provider_Credential](
	[CredentialNumber] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[MiddleName] [varchar](255) NULL,
	[CredentialType] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[BirthYear] [varchar](255) NULL,
	[CEDueDate] [varchar](255) NULL,
	[FirstIssueDate] [varchar](255) NULL,
	[LastIssueDate] [varchar](255) NULL,
	[ExpirationDate] [varchar](255) NULL,
	[ActionTaken] [varchar](255) NULL,
	[ErrorType] [varchar](255) NULL
) ON [PRIMARY]
GO

-- To view the records present in the Reject Table
SELECT * FROM Reject_Health_Care_Provider_Credential;

-- To clear the records present in the Reject Table
TRUNCATE TABLE Reject_Health_Care_Provider_Credential;



-- Code Review DDL/DQL

TRUNCATE TABLE Stg_Health_Care_Provider_Credential;
TRUNCATE TABLE Dst_Health_Care_Provider_Credential;
TRUNCATE TABLE Reject_Health_Care_Provider_Credential;

SELECT * FROM Stg_Health_Care_Provider_Credential;
SELECT * FROM Dst_Health_Care_Provider_Credential;
SELECT * FROM Reject_Health_Care_Provider_Credential;

