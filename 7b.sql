--Zadanie 1

CREATE OR ALTER FUNCTION Fibon (@n INT)
RETURNS INT
AS
BEGIN
DECLARE @n1 INT = 0, @n2 INT = 1, @k INT = 0,  @t INT
	WHILE @k < @n
	BEGIN
		SET @t = @n2
		SET @n2 = @n1 + @n2
		SET @n1 = @t
		SET @k += 1
	END
RETURN @t
END

GO
CREATE OR ALTER PROCEDURE Fibonacci (@n INT)
AS
BEGIN
DECLARE @k INT = 1,	@wynik INT
	WHILE @k <= @n
	BEGIN
		SET @wynik = dbo.Fibon(@k)
		PRINT CONVERT( VARCHAR, @k ) + ' liczba ciagu to  ' + CONVERT( VARCHAR, @wynik )
		SET @k += 1
	END
END

EXEC Fibonacci 10

DROP FUNCTION dbo.Fibon
DROP PROCEDURE dbo.Fibonacci


--Zadanie 2

GO
CREATE OR ALTER TRIGGER Nazwisko_up
ON Person.Person
AFTER INSERT
AS
BEGIN 
  UPDATE s SET s.LastName = UPPER(n.LastName)
  FROM Person.Person AS s INNER JOIN Inserted AS n
  ON s.LastName = n.LastName;
END


DROP TRIGGER Person.Nazwisko_up

INSERT INTO Person.Person VALUES(20778, 'IN', 0, NULL, 'Isabella', NULL, 'Brad', NULL, 2, NULL, NULL, 'D0A499A2-C258-43E9-AB06-F61543A71234', '2014-05-24 00:00:00.000') 

SELECT TOP 5 * FROM Person.Person ORDER BY BusinessEntityID DESC


--Zadanie 3

GO

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate 
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT s.TaxRate, n.TaxRate FROM deleted AS n INNER JOIN Inserted AS s
	ON n.TaxRate * 0.7 > s.TaxRate OR n.TaxRate * 1.3 < s.TaxRate) 
	BEGIN
	PRINT 'B³¹d, zmiana wartoœci TaxRate o wiêcej ni¿ 30% !';
	END
END


DROP TRIGGER Sales.taxRateMonitoring

UPDATE Sales.SalesTaxRate
SET TaxRate = 14
WHERE SalesTaxRateID = 1


SELECT TOP 5 * FROM Sales.SalesTaxRate 


