--Listing 5.1: 
SELECT CustomerID, CAST(CustName AS varchar(50)) AS Name FROM Customers

--Listing 5.2: 
SELECT EmpID, CONVERT(varchar(50), HireDate, 101) AS HireDate FROM Employees

--Listing 5.3: 
BEGIN TRANSACTION
BEGIN
INSERT INTO Employees (EmpID, FirstName, LastName, Department, Salary,
HireDate) VALUES(506, 'Mark', 'Anthony', 'Sales', 20000, GETDATE())
COMMIT TRANSACTION
END

--Listing 5.4: 
IF (SELECT COUNT(*) FROM Customers WHERE CustCountry = 'Brazil') <> 0
SELECT CustomerID, CustName, CustAddress, CustCity, CustState, CustCountry FROM
Customers WHERE CustCountry = 'Brazil'
ELSE
PRINT 'No customer of Brazil!'

--Listing 5.5: 
DECLARE @count AS int = 1
WHILE @count < 10
BEGIN
SET @count += 1
IF @count = 3
CONTINUE
IF @count = 8
BREAK
PRINT 'Value of counter is: ' + CONVERT(varchar(12), @count)
END

--Listing 5.6: 
DECLARE @count AS int = 1
WHILE @count < 10
BEGIN
SET @count += 1
IF @count = 5 GOTO Label2 -- Jumping to Label2
IF @count = 6 GOTO Label1 -- This line will never execute
END
Label1:
PRINT 'Label1 is executing'
Label2:
PRINT 'Label2 is executing'

--Listing 5.7: 
CREATE PROCEDURE sp_ReturnStatement
AS
IF (SELECT COUNT(CustomerID) FROM Customers) < 10
RETURN 1
ELSE
RETURN 2
GO
DECLARE @result AS int
EXECUTE @result = sp_ReturnStatement
PRINT 'Value returned is: ' + CONVERT(varchar(12), @result)
GO

--Listing 5.8: 
CREATE PROCEDURE sp_WaitFor
AS
SELECT * FROM Customers WHERE CustomerID = 404
GO
BEGIN
WAITFOR DELAY '00:02'
EXECUTE sp_WaitFor
END
GO

--Listing 5.9: 
CREATE TABLE ProductsMaster(ProductID int, ProductName varchar(20))
CREATE TABLE NewProducts(ProductID int, ProductName varchar(20))
INSERT INTO ProductsMaster
VALUES(1, 'Chocolate'), (2, 'Perth Pasties'), (3, 'Ipoh Coffee'), (4, 'Scottish
Longbreads')
INSERT INTO NewProducts
VALUES(1, 'Chocolate'), (5, 'Boston Crab Meat')

--Listing 5.10: 
SELECT * FROM ProductsMaster

--Listing 5.11: 
SELECT * FROM NewProducts

--Listing 5.12: 
MERGE ProductsMaster AS target
USING (SELECT ProductID, ProductName FROM NewProducts) AS source
ON target.ProductID = source.ProductID
WHEN MATCHED THEN
UPDATE SET target.ProductName = source.ProductName
WHEN NOT MATCHED THEN
INSERT (ProductID, ProductName) VALUES (source.ProductID, source.ProductName);

--Listing 5.13: 
SELECT TOP(3) CustomerID, CustName, CustAddress, CustCity, CustState, CustCountry
FROM Customers

--Listing 5.14: 
CREATE TABLE Customers_USA(CustID int, Name varchar(20))
CREATE TABLE Customers_UK(CustID int, Name varchar(20))
INSERT INTO Customers_USA
VALUES(401, 'Rene Philips'), (402, 'Paula Wilson'), (403, 'Joleen Mathews'),
(404, 'Mark Anthony')
INSERT INTO Customers_UK
VALUES(501, 'Mark Thompson'), (502, 'Maria Joseph'), (503, 'Ariya Vincent'),
(504, 'Christeen Ferrari')

--Listing 5.15: 
SELECT * FROM Customers_USA
UNION
SELECT * FROM Customers_UK

--Listing 5.16: 
SELECT ProductID FROM Products
EXCEPT
SELECT ProductID FROM OrderDetails

--Listing 5.17: 
SELECT ProductID FROM Products
INTERSECT
SELECT ProductID FROM OrderDetails

--Listing 5.18: 
CREATE DATABASE Test

--Listing 5.19: 
DROP DATABASE Test

--Listing 5.20: 
CREATE TABLE Users(UserID int, Name nvarchar(30), UserAddress nvarchar(50))

--Listing 5.21: 
INSERT INTO Users(UserID, Name, UserAddress)
VALUES (101, 'Maria Anders', 'Obere Str. 57')

--Listing 5.22: 
SELECT * FROM Users

--Listing 5.23: 
ALTER TABLE Users DROP COLUMN UserAddress

--Listing 5.24: 
TRUNCATE TABLE Users

--Listing 5.25: 
DROP TABLE Users



