--Listing 10.1: 
BEGIN TRANSACTION
UPDATE Products SET UnitPrice = 20 WHERE ProductID = 1
IF @@ERROR <> 0
BEGIN
ROLLBACK TRANSACTION
PRINT ('Transaction rolled back due to an error!')
RETURN
END
COMMIT TRANSACTION

--Listing 10.2: 
ALTER TABLE Products WITH NOCHECK ADD CONSTRAINT CK_Products_UnitPrice
CHECK (UnitPrice >= 0)

--Listing 10.3: 
ALTER TABLE Products WITH NOCHECK ADD CONSTRAINT CK_Products_UnitsInStock
CHECK (UnitsInStock >= 0)

--Listing 10.4: 
BEGIN TRANSACTION TransactA
UPDATE Products SET UnitsOnOrder = 100 WHERE ProductID = 1
SAVE TRANSACTION Savepoint1
UPDATE Products SET UnitsInStock = UnitsInStock - UnitsOnOrder WHERE ProductID = 2
IF (@@ERROR = 547)
BEGIN
ROLLBACK TRANSACTION Savepoint1
END
ELSE
COMMIT TRANSACTION


