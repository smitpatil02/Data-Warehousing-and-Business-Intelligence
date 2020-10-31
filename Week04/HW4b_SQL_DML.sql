USE AdventureWorks2017;


-- 01 Find the employees hired in the last 365 days of the data set. Determine the last 365 days with a query. List first and last name along with department.

SELECT FirstName,
	   LastName,
	   HireDate,
	   d.Name AS DepartmentName,
	   d.GroupName
FROM Person.Person p
JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
WHERE HireDate BETWEEN DATEADD(DAY, -365, (SELECT MAX(HireDate) FROM HumanResources.Employee))
			   AND (SELECT MAX(HireDate) FROM HumanResources.Employee)


-- 02 Show all the employees and add an indicator to the above query showing if they received a raise in the last 365 days.

SELECT FirstName,
	   LastName,
	   Rate,
	   HireDate, 
	   CAST(RateChangeDate AS DATE) AS RateChangeDate,
	   CASE WHEN RateChangeDate > HireDate THEN 1 ELSE 0 END AS RateFlag
FROM Person.Person p
JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
JOIN HumanResources.EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
WHERE RateChangeDate BETWEEN DATEADD(DAY, -365, (SELECT MAX(HireDate) FROM HumanResources.Employee))
					 AND (SELECT MAX(HireDate) FROM HumanResources.Employee)


-- 03 Create a summary sales report by customer show name along with number of orders and the total of the orders.

SELECT CONCAT(FirstName, ' ',MiddleName, ' ',LastName) AS Name, 
	   COUNT(SalesOrderNumber) AS NumberOfOrders,
	   SUM(OrderQty) AS TotalOrderQty,
	   SUM(SubTotal) AS SubTotal,
	   SUM(TaxAmt) AS TaxAmount,
	   SUM(Freight) AS Freight,
	   SUM(TotalDue) AS TotalDue
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY FirstName, MiddleName, LastName


-- 04 Show the credit card info for sales - mask the credit card number data so only the last two digits of the card are visible. For example 123456 would be ****56

SELECT SalesOrderNumber,
	   CONCAT(FirstName, ' ',MiddleName, ' ',LastName) AS Name,
	   CardType, 
	   STUFF(CardNumber, 1, 12, '************') AS CardNumber,
	   ExpMonth,
	   ExpYear,
	   TotalDue
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN Sales.CreditCard cc ON soh.CreditCardID = cc.CreditCardID