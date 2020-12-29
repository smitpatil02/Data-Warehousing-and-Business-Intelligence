USE DWBI;

-- Creating a Staging Table for Employees Data Processing
CREATE TABLE Stg_Employee_SCD_Processing
	(
		ID			VARCHAR(255)	NULL,
		[First]		VARCHAR(255)	NULL,
		[Last]		VARCHAR(255)	NULL,
		Rate		VARCHAR(255)	NULL,
		Title		VARCHAR(255)	NULL,
		Zip_Code	VARCHAR(255)	NULL
	);

-- Drop the Stagging Table
DROP TABLE Stg_Employee_SCD_Processing;

-- Retrive all records from the Staging Table
SELECT * FROM Stg_Employee_SCD_Processing;

-- Delete all records from the Staging Table
TRUNCATE TABLE Stg_Employee_SCD_Processing;


--Creating a Employee Dimension table to perfom SCD Processing
CREATE TABLE DIM_EMPLOYEE
	(
		DimEmpID		INT IDENTITY(1,1)    NOT NULL,
		EmpID			INT,
		FirstName		VARCHAR(255),
		LastName		VARCHAR(255),
		Rate			VARCHAR(255),
		Title			VARCHAR(255),
		Zip				CHAR(5),
		StartDate		DATE,
		EndDate			DATE,
		LastUpdateDate	DATE,
		PriorZip		CHAR(5)
	);

-- Drop the Employee Dimension table
DROP TABLE DIM_EMPLOYEE;

-- Retrive all records from Employee Dimension table
SELECT * FROM DIM_EMPLOYEE;

-- Delete all records from Employee Dimension table
TRUNCATE TABLE DIM_EMPLOYEE;


-- Select records from the staging table with proper data type formating
SELECT CAST(ID AS INT) AS EmpID,
       [First] AS FirstName,
	   [Last] AS LastName,
	   Rate,
	   Title,
	   CAST(Zip_Code AS CHAR(5)) AS Zip
FROM Stg_Employee_SCD_Processing;


-- Code Review Select all records from all tables
SELECT * FROM Stg_Employee_SCD_Processing;
SELECT * FROM DIM_EMPLOYEE;

-- Code Review Truncate all records from all tables
TRUNCATE TABLE Stg_Employee_SCD_Processing;
TRUNCATE TABLE DIM_EMPLOYEE;