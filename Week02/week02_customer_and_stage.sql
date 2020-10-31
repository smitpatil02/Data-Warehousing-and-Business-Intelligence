USE [week02]
GO
-- create a table to house customer data

CREATE TABLE 
	[dbo].[customer] (
		[id] [int] NOT NULL,
		[fname] [char](20) NOT NULL,
		[lname] [char](20) NOT NULL
) ON [PRIMARY]
GO

-- create a table to house the customer data as part of staging
-- notice the lack of null contraints and character id fields

CREATE TABLE 
	[dbo].[customer_STG] (
	[id] [char](10) NULL,
	[fname] [char](20) NULL,
	[lname] [char](20) NULL
) ON [PRIMARY]
GO

-- this is a command line bcp command  this doesn't work from SSMS
bcp customer_STG in c:\tmp\week02\badinput.txt -f input.fmt -S vindesk09\ss2019 -T -d week02






