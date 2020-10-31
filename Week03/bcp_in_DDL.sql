USE [bcp]
GO

/****** Object:  Table  [dbo].[Health_Care_Provider_Credential]   Script Date: 02-Oct-20 7:24:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Health_Care_Provider_Credential](
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