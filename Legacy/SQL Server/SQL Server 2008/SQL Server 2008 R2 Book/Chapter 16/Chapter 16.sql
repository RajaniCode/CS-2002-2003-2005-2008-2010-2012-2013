

--Listing 16.12: 

Use Inventory
GO
CREATE TABLE Shipper_New
(
ShipperID int,
ShipperCompanyName nvarchar(40),
ShipperPhone nvarchar(25)
)


--Listing 16.17: 

BULK INSERT Inventory.dbo.Shippers_New
FROM 'D:\Shippers.bcp'
WITH (FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n')

