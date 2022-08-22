--Listing 11.4: 

CREATE PROCEDURE DMLInsertProducts
AS
DECLARE @er int
INSERT INTO Products (ProductID,SupplierID,UnitPrice,UnitsInStock,
UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (6,108,13,40,70,20,0)
SELECT @er=@@ERROR
IF @er =547
BEGIN
PRINT 'An error occurred due to CHECK or FOREIGN KEY constraint violation.'
PRINT @er
RETURN
END
IF @er =515
BEGIN
PRINT 'Attempt to insert null value in a non-null column failed.'
PRINT @er
RETURN
END
GO


--Listing 11.5: 

EXECUTE DMLInsertProducts


--Listing 11.5: 

CREATE PROCEDURE DMLDeleteProducts
AS
DROP TABLE Products
DECLARE @er int
SET @er =@@ERROR
IF @er <> 0
BEGIN
RAISERROR ('An error occurred while deleting the Products table',10,1)
END


--Listing 11.6: 

EXECUTE DMLDeleteProducts


--Listing 11.7: 

sp_addmessage @msgnum =50002,
@severity =10,
@msgtext ='An error occurred while deleting the Customers table'


--Listing 11.9: 

ALTER TABLE Products WITH NOCHECK ADD CONSTRAINT CK_Products_UnitPrice
CHECK (([UnitPrice] >= 0))
GO
ALTER TABLE Products CHECK CONSTRAINT CK_Products_UnitPrice
GO


--Listing 11.10: 

BEGIN TRANSACTION
USE Inventory
BEGIN TRY
UPDATE Products SET UnitPrice=-21 WHERE ProductID=1
UPDATE Products SET UnitPrice=22 WHERE ProductID=2
COMMIT TRANSACTION
END TRY
BEGIN CATCH
PRINT 'Error occurred in the UPDATE statement. Transaction rolled back'
ROLLBACK TRANSACTION
END CATCH


--Listing 11.11: 

BEGIN TRANSACTION
USE Inventory
BEGIN TRY
UPDATE products SET unitprice=-21 WHERE productid=1
UPDATE products SET unitprice=22 WHERE productid=2
COMMIT TRANSACTION
END TRY
BEGIN CATCH
PRINT 'Error occurred in the UPDATE statement. Transaction rolled back'
SELECT ERROR_NUMBER()AS 'Error Number',
ERROR_MESSAGE()AS 'Description',
ERROR_LINE()AS 'Error Line Number',
ERROR_SEVERITY()AS 'Error Severity Level'
ROLLBACK TRANSACTION
END CATCH


--Listing 11.12: 

EXEC sp_addmessage
@msgnum = 56001,
@msgtext = N'Procedure: This operation cannot be performed on %s table',
@severity = 14, @lang = 'us_english',
@with_log = true
RAISERROR(56001,14,1,'Employees','Insert')


--Listing 11.13: 

EXEC master..xp_logevent 60000,'Test message'


--Listing 11.14: 

RAISERROR ('An error occured',14,1) WITH LOG


--Listing 11.15: 

CREATE Procedure GetTotal
(
@num1 int,
@total int OUTPUT
)
AS
DECLARE @num2 int
SET @total = @num1 + @num2
RETURN


--Listing 11.16: 

DECLARE @num int
EXEC GetTotal 5,@num OUTPUT
SELECT @num


--Listing 11.17: 

ALTER Procedure GetTotal
(
@num1 int,
@total int OUTPUT
)
AS
DECLARE @num2 int = 0
SET @total = @num1 + @num2
RETURN
