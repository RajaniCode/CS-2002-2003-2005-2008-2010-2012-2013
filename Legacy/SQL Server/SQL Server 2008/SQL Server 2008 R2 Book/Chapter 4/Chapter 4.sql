--Listing 4.1: 
SELECT OrderID, SUM(Quantity) AS Quantity FROM OrderDetails GROUP BY OrderID
HAVING SUM(Quantity) > 30 ORDER BY OrderID ASC

--Listing 4.2: 
INSERT INTO Customers (CustomerID, CustName, CustCompanyName, CustDesignation,
CustAddress, CustCity, CustState, CustPostalCode, CustCountry, CustPhone)
VALUES (406, 'Marie Bertrand', 'Que Delicia', 'Marketing Assistant', 'Gran Via,
1', 'Anchorage', 'Alaska', 99407, 'USA', '(906) 555-5749')

--Listing 4.3: 
UPDATE Customers
SET CustCompanyName = 'Quick-Stop', CustAddress = 'P.O. Box 555'
WHERE CustomerID = 405

--Listing 4.4: 
DELETE FROM Customers
WHERE CustomerID = 406

--Listing 4.5: 
SELECT ProductID, UnitsInStock + 10 AS UnitsInStock, UnitPrice * 2 AS UnitPrice
FROM Products

--Listing 4.6: 
SELECT * FROM Products WHERE SupplierID = 101 AND UnitPrice < 20

--Listing 4.7: 
SELECT * FROM Customers WHERE CustCountry IN ('USA', 'Canada', 'Brazil') AND
CustDesignation = 'Sales Manager' OR CustDesignation = 'Accounting Manager'

--Listing 4.8: 
SELECT CustID = CustomerID, Name = CustName, CustAddress, CustCity, CustCountry
FROM Customers

--Listing 4.9: 
UPDATE Products
SET UnitPrice += UnitPrice * 5 / 100, UnitsInStock *= 2

--Listing 4.10: 
SELECT UnitsInStock & UnitsOnOrder AS Units FROM Products WHERE ProductID = 2

--Listing 4.11: 
SELECT ProductID, -UnitsInStock AS UnitsInStock FROM Products WHERE ProductID = 3

--Listing 4.12: 
SELECT EmpID, FirstName + ' ' + LastName AS Name, Department, Salary FROM
Employees

--Listing 4.13: 
DECLARE @id hierarchyid
SELECT @id = hierarchyid::GetRoot()
PRINT 'The root of the hierarchy is: ' + @id.ToString()

--Listing 4.14: 
SELECT COUNT(ProductID) AS COUNT, MIN(UnitPrice) AS MIN, SUM(UnitsInStock) AS SUM
FROM Products

--Listing 4.15: 
Declare @var1 int = 25
Declare @var2 datetime = GETDATE()
Declare @var3 varchar(50)= 'Using Scalar Functions'
SELECT SQRT(@var1) AS FirstColumn, Year(@var2) AS SecondColumn, SUBSTRING(@var3,
6, 17) AS ThirdColumn

--Listing 4.16: 
SELECT * FROM OPENDATASOURCE('SQLNCLI',
'Data Source=JITENDRA;Integrated Security=SSPI')
.Inventory.dbo.Employees

--Listing 4.17: 
SELECT OrderID, ProductID, Quantity,
RANK() OVER (PARTITION BY OrderID ORDER BY Quantity DESC) AS 'RANK'
FROM OrderDetails


