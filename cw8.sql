-- Zadanie 1
WITH expr1 (LoginID, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, VacationHours, SickLeaveHours, Rate)
AS
(
	SELECT LoginID, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, VacationHours, SickLeaveHours, Rate FROM HumanResources.Employee AS e
	INNER JOIN HumanResources.EmployeePayHistory AS p
	ON e.BusinessEntityID = p.BusinessEntityID
)

SELECT * INTO #TempEmployeeInfo FROM expr1;

SELECT * FROM #TempEmployeeInfo;

--SELECT * FROM HumanResources.Employee;


-- Zadanie 2
WITH expr2 (CompanyContact, Revenue)
AS
(
	SELECT CONCAT(CompanyName, ' (', FirstName, LastName,')') AS CompanyContact, TotalDue AS Revenue FROM Sales.SalesOrderHeader AS c
	INNER JOIN Sales.Customer AS s
	ON c.CustomerID = s.CustomerID
)

SELECT * FROM expr2

ORDER BY CompanyContact;

--SELECT * FROM Sales.Customer;


-- Zadanie 3
WITH expr3 (Category, SalesValue)
AS
(
	SELECT pc.Name AS Category, (UnitPrice * OrderQty) AS SalesValue FROM Production.Product AS p
	INNER JOIN Production.ProductCategory AS pc
	ON p.ProductCategoryID = pc.ProductCategoryID
	INNER JOIN Sales.SalesOrderDetail AS s
	ON p.ProductID = s.ProductID
)

SELECT Category, SUM(SalesValue) FROM expr3

GROUP BY Category
ORDER BY Category;

--SELECT * FROM Sales.SalesOrderDetail;

