--Listing 8.1: 
CREATE TRIGGER Insert_Products
ON Products
AFTER
INSERT
AS
PRINT 'Record inserted in the Products table!'

--Listing 8.2: 
INSERT INTO Products(ProductID, ProductName, SupplierID, UnitPrice, UnitsInStock,
UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(6, 'Perth Pasties', 102, 18.3276, 20, 0, 10, 'TRUE')

--Listing 8.3: 
CREATE TRIGGER Delete_Products
ON Products
INSTEAD OF
DELETE
AS
PRINT 'You are not allowed to delete a record from the Products table!'

--Listing 8.4: 
DELETE FROM Products
WHERE ProductID = 5

--Listing 8.6: 
CREATE ASSEMBLY RecentRow
FROM 'D:\Books\Black Book\SQL Server 2008 R2 Black Book\Applications\Chapter
8\CLRTrigger\CLRTrigger\bin\Debug\CLRTrigger.dll'

--Listing 8.7: 
CREATE TRIGGER CLRTrigger
ON Products
AFTER INSERT
AS
EXTERNAL NAME RecentRow.[CLRTrigger.Triggers].GetLastRow

--Listing 8.8: 
INSERT INTO Products(ProductID, ProductName, SupplierID, UnitPrice,
UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(7, 'Ipoh Coffee', 104, 22.5485, 25, 0, 20, 'FALSE')

--Listing 8.9: 
CREATE TRIGGER Alter_Database_Table
ON DATABASE
AFTER ALTER_TABLE
AS
PRINT 'A table in the current database is modified!'

--Listing 8.10: 
ALTER TABLE Employees
ADD EmpPhone nvarchar(25) NULL

--Listing 8.11: 
CREATE TRIGGER Connection_Limit
ON ALL SERVER WITH EXECUTE AS 'Jitendra\Jitendra Arya'
FOR LOGON
AS
BEGIN
IF ORIGINAL_LOGIN() = 'Jitendra\Jitendra Arya'
AND (SELECT COUNT(*) FROM sys.dm_exec_sessions
WHERE is_user_process = 1 AND original_login_name = 'Jitendra\Jitendra Arya') >
1
ROLLBACK
END

--Listing 8.12: 
ALTER TRIGGER Insert_Products
ON Products
INSTEAD OF
INSERT
AS
PRINT 'An attempt was made to insert records into the Products table!'

--Listing 8.13: 
INSERT INTO Products(ProductID, ProductName, SupplierID, UnitPrice, UnitsInStock,
UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(8, 'Chocolade', 103, 15.6294, 50, 25, 20, 'TRUE')

--Listing 8.14: 
DROP TRIGGER Alter_Database_Table
ON DATABASE

