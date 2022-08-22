
--Listing 6.1:

CREATE TABLE SuppliersSample(
SupplierID int NOT NULL CONSTRAINT pkSuppID PRIMARY KEY,
SupplierName nvarchar(40) NOT NULL,
SupplierContactName nvarchar(30) NULL,
SupplierContactDesignation nvarchar(30) NULL,
SupplierAddress nvarchar(100) NULL,
SupplierCity nvarchar(30) NULL,
SupplierState nvarchar(30) NULL,
SupplierPostalCode nvarchar(10) NULL,
SupplierCountry nvarchar(30) NULL,
SupplierPhone nvarchar(25) NULL)

--Listing 6.2: 

CREATE TABLE SuppliersSample(
SupplierID int NOT NULL CONSTRAINT pkSuppID PRIMARY KEY,
SupplierName nvarchar(40) NOT NULL,
SupplierContactName nvarchar(30) NULL,
SupplierContactDesignation nvarchar(30) NULL,
SupplierAddress nvarchar(100) NULL,
SupplierCity nvarchar(30) NULL,
SupplierState nvarchar(30) NULL,
SupplierPostalCode nvarchar(10) NULL,
SupplierCountry nvarchar(30) NULL,
SupplierPhone nvarchar(25) NULL CONSTRAINT uqSuppID UNIQUE)

--Listing 6.3: 

CREATE TABLE ProductsSample(
ProductID int NOT NULL CONSTRAINT pkProdID PRIMARY KEY,
ProductName nvarchar(50) NOT NULL,
SupplierID int NOT NULL CONSTRAINT fkSuppID REFERENCES SuppliersSample
(SupplierID),
UnitPrice money NOT NULL,
UnitsInStock smallint NULL,
UnitsOnOrder smallint NULL,
ReorderLevel smallint NULL,
Discontinued bit NOT NULL)

--Listing 6.4: 

CREATE TABLE ProductsSample(
ProductID int NOT NULL CONSTRAINT pkProdID PRIMARY KEY,
ProductName nvarchar(50) NOT NULL,
SupplierID int NOT NULL CONSTRAINT fkSuppID REFERENCES SuppliersSample
(SupplierID),
UnitPrice money NOT NULL,
UnitsInStock smallint NULL,
UnitsOnOrder smallint NULL,
ReorderLevel smallint NULL CONSTRAINT chkReorderLvl CHECK (ReorderLevel >= 0
and ReorderLevel <= 50),
Discontinued bit NOT NULL)

--Listing 6.5: 

CREATE RULE ReorderLvl_chk AS @reordlvl BETWEEN 0 and 50

--Listing 6.6: 

sp_bindrule ReorderLvl_chk, 'ProductsSample.ReorderLevel'

--Listing 6.7: 

sp_unbindrule 'ProductsSample.ReorderLevel'

--Listing 6.8: 

DROP RULE ReorderLvl_chk

--Listing 6.9: 

SELECT p.ProductID, p.ProductName, p.UnitPrice,
s.SupplierName, s.SupplierContactName, s.SupplierPhone
FROM Products p
CROSS JOIN Suppliers s

--Listing 6.10: 

SELECT p.ProductID, p.ProductName, p.UnitPrice,
s.SupplierName, s.SupplierContactName, s.SupplierPhone
FROM Products p
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID

--Listing 6.11: 

SELECT s.SupplierName, s.SupplierContactName, s.SupplierPhone,
p.ProductID, p.ProductName, p.UnitPrice
FROM Suppliers s
LEFT OUTER JOIN Products p
ON s.SupplierID = p.SupplierID

--Listing 6.12: 

SELECT p.ProductID, p.ProductName, p.UnitPrice,
s.SupplierName, s.SupplierContactName, s.SupplierPhone
FROM Products p
RIGHT OUTER JOIN Suppliers s
ON p.SupplierID = s.SupplierID

--Listing 6.13: 

SELECT p.ProductID, p.ProductName, p.UnitPrice,
s.SupplierName, s.SupplierContactName, s.SupplierPhone
FROM Products p
FULL OUTER JOIN Suppliers s
ON p.SupplierID = s.SupplierID

--Listing 6.14: 

SELECT e.FirstName + ' ' + e.LastName AS Employee,
emp.FirstName + ' ' + emp.LastName AS Manager
FROM Employees AS e
LEFT OUTER JOIN Employees AS emp
ON e.ManagerID = emp.EmpID

--Listing 6.15: 

CREATE VIEW vw_Suppliers
AS
SELECT SupplierID, SupplierName, SupplierContactName, SupplierContactDesignation,
SupplierAddress, SupplierPhone
FROM Suppliers
WHERE SupplierCity='Manchester'

--Listing 6.16: 

ALTER VIEW vw_Suppliers
AS
SELECT SupplierID, SupplierName, SupplierContactName, SupplierContactDesignation,
SupplierAddress, SupplierPhone
FROM Suppliers
WHERE SupplierCity='Manchester'
AND SupplierContactDesignation ='Export Administrator'

--Listing 6.17: 

drop view vw_Suppliers

--Listing 6.18: 

SELECT * FROM Suppliers
WHERE SupplierCity IN
(SELECT SupplierCity FROM Suppliers
WHERE SupplierName = 'Star Biscuits, Ltd.')

--Listing 6.19: 

SELECT c.CustomerID, c.CustName, c.CustCompanyName,
COUNT(o.OrderID) AS TotalOrders
FROM Customers c LEFT OUTER JOIN
(SELECT * FROM Orders WHERE YEAR (Orders.OrderDate) = 1996) AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustName, c.CustCompanyName

--Listing 6.20: 

WITH OrdCust_CTE (CustomerID, CustName, CustCompanyName, TotalOrders)
AS
(
SELECT c.CustomerID, c.CustName, c.CustCompanyName, COUNT(o.OrderID) AS
TotalOrders
from Customers c LEFT OUTER JOIN
Orders o ON c.CustomerID = o.CustomerID
group by c.CustomerID, c.CustName, c.CustCompanyName
)
SELECT * FROM OrdCust_CTE
ORDER BY CustomerID;

--Listing 6.21: 

SELECT OrderID, ProductID, UnitPrice, Quantity, Discount,
(UnitPrice * Quantity) - (UnitPrice * Quantity * Discount) AS 'Total Cost'
FROM OrderDetails
