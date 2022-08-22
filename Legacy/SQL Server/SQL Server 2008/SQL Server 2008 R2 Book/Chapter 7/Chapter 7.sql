
--Listing 7.1: 

CREATE PROCEDURE GetOrderDetails
AS
SELECT * FROM OrderDetails
GO

--Listing 7.2: 

ALTER PROCEDURE GetOrderDetails
AS
SELECT OrderID, SUM(UnitPrice) AS UnitPrice, SUM(Quantity) AS Quantity
FROM OrderDetails Group By OrderID
GO

--Listing 7.3: 

EXECUTE GetOrderDetails

--Listing 7.4: 

DROP PROCEDURE GetOrderDetails

--Listing 7.5: 

CREATE PROCEDURE GetOrdersCustomers
@MinFreightCharge money,
@DestinationCountry nvarchar(30)
AS
SELECT o.OrderID, c.CustomerID, o.FreightCharges, c.CustCountry
FROM Orders o, Customers c
WHERE o.CustomerID=c.CustomerID
AND o.FreightCharges > @MinFreightCharge
AND c.CustCountry = @DestinationCountry
GO

--Listing 7.7: 

CREATE TYPE Employee_Type AS TABLE
(
EmpID int NOT NULL PRIMARY KEY,
FirstName nvarchar(30) NOT NULL,
LastName nvarchar(30) NULL,
Department nvarchar(50) NOT NULL,
ManagerID int NULL,
Salary money NOT NULL,
HireDate datetime NOT NULL
)

--Listing 7.8: 

CREATE PROCEDURE InsertEmployees
@EmployeeDetails_TVP Employee_Type READONLY
AS
INSERT INTO Employees
(EmpID,FirstName,LastName,Department,ManagerID,Salary,HireDate)
SELECT * FROM @EmployeeDetails_TVP
SELECT * FROM @EmployeeDetails_TVP
SELECT * FROM Employees
GO

--Listing 7.9: 

DECLARE @EmpDetails AS Employee_Type
INSERT INTO @EmpDetails
(EmpID,FirstName,LastName,Department,ManagerID,Salary,HireDate)
VALUES (506, 'George', 'Fernandes', 'Sales', 502, 15000, 6/6/2009)
EXECUTE InsertEmployees @EmpDetails

--Listing 7.10: 

CREATE PROCEDURE GetProductQuantity
@PID int, --input parameter
@price money, --input parameter
@min int OUTPUT, --output parameter
@max int OUTPUT--output parameter
AS
SELECT ProductID,count(OrderID) AS 'Total orders'
FROM OrderDetails
WHERE ProductID=@PID and UnitPrice=@price
GROUP BY ProductID
SELECT @max=max(Quantity) FROM OrderDetails
WHERE ProductID=@PID and UnitPrice=@price
SELECT @min=min(Quantity) FROM OrderDetails
WHERE ProductID=@PID and UnitPrice=@price
GO

--Listing 7.12: 

CREATE FUNCTION FuncGetTotalOrderCost(@OrderID int)
RETURNS money
AS
BEGIN
DECLARE @TotCost money
SELECT @TotCost = sum((UnitPrice * Quantity) - (UnitPrice * Quantity *
Discount))
FROM OrderDetails
WHERE OrderID = @OrderID
RETURN @TotCost
END

--Listing 7.13: 

select dbo.FuncGetTotalOrderCost(701) as 'Total Cost'

--Listing 7.14: 

CREATE FUNCTION FuncGetOrderDetails
(@OrderID int, @ProductID int)
RETURNS @Result TABLE
(
OrderID int primary key NOT NULL,
ProductID int NOT NULL,
UnitPrice money NOT NULL,
Quantity smallint NOT NULL,
Discount real NOT NULL,
NetAmount money NOT NULL
)
AS
BEGIN
DECLARE @UnitPrice AS real, @Quantity AS int, @Discount AS real, @DiscAmt AS real,
@NetAmt AS real
SELECT @UnitPrice= UnitPrice, @Quantity =Quantity, @Discount =Discount
FROM OrderDetails WHERE OrderID=@OrderID AND ProductID =@ProductID
SET @DiscAmt = (@UnitPrice * @Quantity) * @Discount
SET @NetAmt =(@UnitPrice * @Quantity) - @DiscAmt
INSERT INTO @Result
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount, @NetAmt FROM
OrderDetails
WHERE OrderID=@OrderID AND ProductID=@ProductID
RETURN
END
GO
