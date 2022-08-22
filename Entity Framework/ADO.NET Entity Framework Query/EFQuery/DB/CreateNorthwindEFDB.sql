/*
** Copyright Microsoft, Inc. 1994 - 2000
** All Rights Reserved.
*/

SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='NorthwindEF')
		drop database NorthwindEF
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE NorthwindEF
  ON PRIMARY (NAME = N''NorthwindEF'', FILENAME = N''' + @device_directory + N'nwndEF.mdf'')
  LOG ON (NAME = N''NorthwindEF_log'',  FILENAME = N''' + @device_directory + N'nwndEF.ldf'')')
go

exec sp_dboption 'NorthwindEF','trunc. log on chkpt.','true'
exec sp_dboption 'NorthwindEF','select into/bulkcopy','true'
GO

set quoted_identifier on
GO

/* Set DATEFORMAT so that the date strings are interpreted correctly regardless of
   the default DATEFORMAT on the server.
*/
SET DATEFORMAT ymd
GO
use "NorthwindEF"
go
if exists (select * from sysobjects where id = object_id('dbo.Employee Sales by Country') and sysstat & 0xf = 4)
	drop procedure "dbo"."Employee Sales by Country"
GO
if exists (select * from sysobjects where id = object_id('dbo.Sales by Year') and sysstat & 0xf = 4)
	drop procedure "dbo"."Sales by Year"
GO
if exists (select * from sysobjects where id = object_id('dbo.Ten Most Expensive Products') and sysstat & 0xf = 4)
	drop procedure "dbo"."Ten Most Expensive Products"
GO
if exists (select * from sysobjects where id = object_id('dbo.Category Sales for 1997') and sysstat & 0xf = 2)
	drop view "dbo"."Category Sales for 1997"
GO
if exists (select * from sysobjects where id = object_id('dbo.Sales by Category') and sysstat & 0xf = 2)
	drop view "dbo"."Sales by Category"
GO
if exists (select * from sysobjects where id = object_id('dbo.Sales Totals by Amount') and sysstat & 0xf = 2)
	drop view "dbo"."Sales Totals by Amount"
GO
if exists (select * from sysobjects where id = object_id('dbo.Summary of Sales by Quarter') and sysstat & 0xf = 2)
	drop view "dbo"."Summary of Sales by Quarter"
GO
if exists (select * from sysobjects where id = object_id('dbo.Summary of Sales by Year') and sysstat & 0xf = 2)
	drop view "dbo"."Summary of Sales by Year"
GO
if exists (select * from sysobjects where id = object_id('dbo.Invoices') and sysstat & 0xf = 2)
	drop view "dbo"."Invoices"
GO
if exists (select * from sysobjects where id = object_id('dbo.Order Details Extended') and sysstat & 0xf = 2)
	drop view "dbo"."Order Details Extended"
GO
if exists (select * from sysobjects where id = object_id('dbo.Order Subtotals') and sysstat & 0xf = 2)
	drop view "dbo"."Order Subtotals"
GO
if exists (select * from sysobjects where id = object_id('dbo.Product Sales for 1997') and sysstat & 0xf = 2)
	drop view "dbo"."Product Sales for 1997"
GO
if exists (select * from sysobjects where id = object_id('dbo.Alphabetical list of products') and sysstat & 0xf = 2)
	drop view "dbo"."Alphabetical list of products"
GO
if exists (select * from sysobjects where id = object_id('dbo.Current Product List') and sysstat & 0xf = 2)
	drop view "dbo"."Current Product List"
GO
if exists (select * from sysobjects where id = object_id('dbo.Orders Qry') and sysstat & 0xf = 2)
	drop view "dbo"."Orders Qry"
GO
if exists (select * from sysobjects where id = object_id('dbo.Products Above Average Price') and sysstat & 0xf = 2)
	drop view "dbo"."Products Above Average Price"
GO
if exists (select * from sysobjects where id = object_id('dbo.Products by Category') and sysstat & 0xf = 2)
	drop view "dbo"."Products by Category"
GO
if exists (select * from sysobjects where id = object_id('dbo.Quarterly Orders') and sysstat & 0xf = 2)
	drop view "dbo"."Quarterly Orders"
GO
if exists (select * from sysobjects where id = object_id('dbo.Customer and Suppliers by City') and sysstat & 0xf = 2)
	drop view "dbo"."Customer and Suppliers by City"
GO
if exists (select * from sysobjects where id = object_id('dbo.Order Details') and sysstat & 0xf = 3)
	drop table "dbo"."Order Details"
GO
if exists (select * from sysobjects where id = object_id('dbo.Orders') and sysstat & 0xf = 3)
	drop table "dbo"."Orders"
GO
if exists (select * from sysobjects where id = object_id('dbo.Products') and sysstat & 0xf = 3)
	drop table "dbo"."Products"
GO
if exists (select * from sysobjects where id = object_id('dbo.Categories') and sysstat & 0xf = 3)
	drop table "dbo"."Categories"
GO
if exists (select * from sysobjects where id = object_id('dbo.Customers') and sysstat & 0xf = 3)
	drop table "dbo"."Customers"
GO
if exists (select * from sysobjects where id = object_id('dbo.Shippers') and sysstat & 0xf = 3)
	drop table "dbo"."Shippers"
GO
if exists (select * from sysobjects where id = object_id('dbo.Suppliers') and sysstat & 0xf = 3)
	drop table "dbo"."Suppliers"
GO
if exists (select * from sysobjects where id = object_id('dbo.Employees') and sysstat & 0xf = 3)
	drop table "dbo"."Employees"
GO
if exists (select * from sysobjects where id = object_id('dbo.InternationalOrders') and sysstat & 0xf = 3)
	drop table "dbo"."InternationalOrders"
GO
if exists (select * from sysobjects where id = object_id('dbo.OrderDetails') and sysstat & 0xf = 3)
	drop table "dbo"."OrderDetails"
GO
if exists (select * from sysobjects where id = object_id('dbo.PreviousEmployees') and sysstat & 0xf = 3)
	drop table "dbo"."PreviousEmployees"
GO
if exists (select * from sysobjects where id = object_id('dbo.EmployeesTerritories') and sysstat & 0xf = 3)
	drop table "dbo"."EmployeesTerritories"
GO
if exists (select * from sysobjects where id = object_id('dbo.CustomerCustomerDemo') and sysstat & 0xf = 3)
	drop table "dbo"."CustomerCustomerDemo"
GO
if exists (select * from sysobjects where id = object_id('dbo.CustomerDemographics') and sysstat & 0xf = 3)
	drop table "dbo"."CustomerDemographics"
GO
if exists (select * from sysobjects where id = object_id('dbo.Region') and sysstat & 0xf = 3)
	drop table "dbo"."Region"
GO

if exists (select * from sysobjects where id = object_id('dbo.Territories') and sysstat & 0xf = 3)
	drop table "dbo"."Territories"
GO

create table [dbo].[InternationalOrders] (
    [OrderID] [int] not null,
    [CustomsDescription] [nvarchar](100) not null,
    [ExciseTax] [money] not null,
    primary key ([OrderID])
);
create table [dbo].[OrderDetails] (
    [OrderID] [int] not null,
    [ProductID] [int] not null,
    [UnitPrice] [money] not null,
    [Quantity] [smallint] not null,
    [Discount] [real] not null,
    primary key ([OrderID], [ProductID])
);
create table [dbo].[PreviousEmployees] (
    [EmployeeID] [int] not null,
    [LastName] [nvarchar](20) not null,
    [FirstName] [nvarchar](10) not null,
    [Title] [nvarchar](30) null,
    [TitleOfCourtesy] [nvarchar](25) null,
    [BirthDate] [datetime] null,
    [HireDate] [datetime] null,
    [Address] [nvarchar](60) null,
    [City] [nvarchar](15) null,
    [Region] [nvarchar](15) null,
    [PostalCode] [nvarchar](10) null,
    [Country] [nvarchar](15) null,
    [HomePhone] [nvarchar](24) null,
    [Extension] [nvarchar](4) null,
    [Photo] [image] null,
    [Notes] [ntext] null,
    [PhotoPath] [nvarchar](255) null,
    primary key ([EmployeeID])
);
CREATE TABLE [dbo].[EmployeesTerritories] 
	([EmployeeID] [int] NOT NULL,
	[TerritoryID] [nvarchar] (20) NOT NULL 
) ON [PRIMARY]

CREATE TABLE [dbo].[CustomerCustomerDemo] 
	([CustomerID] nchar (5) NOT NULL,
	[CustomerTypeID] [nchar] (10) NOT NULL
) ON [PRIMARY] 
GO

CREATE TABLE [dbo].[CustomerDemographics] 
	([CustomerTypeID] [nchar] (10) NOT NULL ,
	[CustomerDesc] [ntext] NULL 
)  ON [PRIMARY] 
GO		
	
CREATE TABLE [dbo].[Region] 
	( [RegionID] [int] NOT NULL ,
	[RegionDescription] [nchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Territories] 
	([TerritoryID] [nvarchar] (20) NOT NULL ,
	[TerritoryDescription] [nchar] (50) NOT NULL ,
        [RegionID] [int] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE "Employees" (
	"EmployeeID" "int" IDENTITY (1, 1) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL , 
	"TitleOfCourtesy" nvarchar (25) NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Extension" nvarchar (4) NULL ,
	"Photo" "image" NULL ,
	"Notes" "ntext" NULL ,
	"ReportsTo" "int" NULL ,
	"PhotoPath" nvarchar (255) NULL ,
	CONSTRAINT "PK_Employees" PRIMARY KEY  CLUSTERED 
	(
		"EmployeeID"
	),
	CONSTRAINT "FK_Employees_Employees" FOREIGN KEY 
	(
		"ReportsTo"
	) REFERENCES "dbo"."Employees" (
		"EmployeeID"
	),
	CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate())
)
GO
 CREATE  INDEX "LastName" ON "dbo"."Employees"("LastName")
GO
 CREATE  INDEX "PostalCode" ON "dbo"."Employees"("PostalCode")
GO

CREATE TABLE "Categories" (
	"CategoryID" "int" IDENTITY (1, 1) NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" nvarchar(4000) NULL ,
	"Picture" varbinary(8000) NULL ,
	CONSTRAINT "PK_Categories" PRIMARY KEY  CLUSTERED 
	(
		"CategoryID"
	)
)
GO
 CREATE  INDEX "CategoryName" ON "dbo"."Categories"("CategoryName")
GO

CREATE TABLE "Customers" (
	"CustomerID" nchar (5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	CONSTRAINT "PK_Customers" PRIMARY KEY  CLUSTERED 
	(
		"CustomerID"
	)
)
GO
 CREATE  INDEX "City" ON "dbo"."Customers"("City")
GO
 CREATE  INDEX "CompanyName" ON "dbo"."Customers"("CompanyName")
GO
 CREATE  INDEX "PostalCode" ON "dbo"."Customers"("PostalCode")
GO
 CREATE  INDEX "Region" ON "dbo"."Customers"("Region")
GO

CREATE TABLE "Shippers" (
	"ShipperID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "PK_Shippers" PRIMARY KEY  CLUSTERED 
	(
		"ShipperID"
	)
)
GO
CREATE TABLE "Suppliers" (
	"SupplierID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	"HomePage" "ntext" NULL ,
	CONSTRAINT "PK_Suppliers" PRIMARY KEY  CLUSTERED 
	(
		"SupplierID"
	)
)
GO
 CREATE  INDEX "CompanyName" ON "dbo"."Suppliers"("CompanyName")
GO
 CREATE  INDEX "PostalCode" ON "dbo"."Suppliers"("PostalCode")
GO

CREATE TABLE "Orders" (
	"OrderID" "int" IDENTITY (1, 1) NOT NULL ,
	"CustomerID" nchar (5) NULL ,
	"EmployeeID" "int" NULL ,
	"OrderDate" "datetime" NULL ,
	"RequiredDate" "datetime" NULL ,
	"ShippedDate" "datetime" NULL ,
	"ShipVia" "int" NULL ,
	"Freight" "money" NULL CONSTRAINT "DF_Orders_Freight" DEFAULT (0),
	"ShipName" nvarchar (40) NULL ,
	"ShipAddress" nvarchar (60) NULL ,
	"ShipCity" nvarchar (15) NULL ,
	"ShipRegion" nvarchar (15) NULL ,
	"ShipPostalCode" nvarchar (10) NULL ,
	"ShipCountry" nvarchar (15) NULL ,
	CONSTRAINT "PK_Orders" PRIMARY KEY  CLUSTERED 
	(
		"OrderID"
	),
	CONSTRAINT "FK_Orders_Customers" FOREIGN KEY 
	(
		"CustomerID"
	) REFERENCES "dbo"."Customers" (
		"CustomerID"
	),
	CONSTRAINT "FK_Orders_Employees" FOREIGN KEY 
	(
		"EmployeeID"
	) REFERENCES "dbo"."Employees" (
		"EmployeeID"
	),
	CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY 
	(
		"ShipVia"
	) REFERENCES "dbo"."Shippers" (
		"ShipperID"
	)
)
GO
 CREATE  INDEX "CustomerID" ON "dbo"."Orders"("CustomerID")
GO
 CREATE  INDEX "CustomersOrders" ON "dbo"."Orders"("CustomerID")
GO
 CREATE  INDEX "EmployeeID" ON "dbo"."Orders"("EmployeeID")
GO
 CREATE  INDEX "EmployeesOrders" ON "dbo"."Orders"("EmployeeID")
GO
 CREATE  INDEX "OrderDate" ON "dbo"."Orders"("OrderDate")
GO
 CREATE  INDEX "ShippedDate" ON "dbo"."Orders"("ShippedDate")
GO
 CREATE  INDEX "ShippersOrders" ON "dbo"."Orders"("ShipVia")
GO
 CREATE  INDEX "ShipPostalCode" ON "dbo"."Orders"("ShipPostalCode")
GO

CREATE TABLE "Products" (
	"ProductID" "int" IDENTITY (1, 1) NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"SupplierID" "int" NULL ,
	"CategoryID" "int" NULL ,
	"QuantityPerUnit" nvarchar (20) NULL ,
	"UnitPrice" "money" NULL CONSTRAINT "DF_Products_UnitPrice" DEFAULT (0),
	"UnitsInStock" "smallint" NULL CONSTRAINT "DF_Products_UnitsInStock" DEFAULT (0),
	"UnitsOnOrder" "smallint" NULL CONSTRAINT "DF_Products_UnitsOnOrder" DEFAULT (0),
	"ReorderLevel" "smallint" NULL CONSTRAINT "DF_Products_ReorderLevel" DEFAULT (0),
	"Discontinued" "bit" NOT NULL CONSTRAINT "DF_Products_Discontinued" DEFAULT (0),
	"DiscontinuedDate" "datetime" null,
	CONSTRAINT "PK_Products" PRIMARY KEY  CLUSTERED 
	(
		"ProductID"
	),
	CONSTRAINT "FK_Products_Categories" FOREIGN KEY 
	(
		"CategoryID"
	) REFERENCES "dbo"."Categories" (
		"CategoryID"
	),
	CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY 
	(
		"SupplierID"
	) REFERENCES "dbo"."Suppliers" (
		"SupplierID"
	),
	CONSTRAINT "CK_Products_UnitPrice" CHECK (UnitPrice >= 0),
	CONSTRAINT "CK_ReorderLevel" CHECK (ReorderLevel >= 0),
	CONSTRAINT "CK_UnitsInStock" CHECK (UnitsInStock >= 0),
	CONSTRAINT "CK_UnitsOnOrder" CHECK (UnitsOnOrder >= 0)
)
GO
 CREATE  INDEX "CategoriesProducts" ON "dbo"."Products"("CategoryID")
GO
 CREATE  INDEX "CategoryID" ON "dbo"."Products"("CategoryID")
GO
 CREATE  INDEX "ProductName" ON "dbo"."Products"("ProductName")
GO
 CREATE  INDEX "SupplierID" ON "dbo"."Products"("SupplierID")
GO
 CREATE  INDEX "SuppliersProducts" ON "dbo"."Products"("SupplierID")
GO

CREATE TABLE "Order Details" (
	"OrderID" "int" NOT NULL ,
	"ProductID" "int" NOT NULL ,
	"UnitPrice" "money" NOT NULL CONSTRAINT "DF_Order_Details_UnitPrice" DEFAULT (0),
	"Quantity" "smallint" NOT NULL CONSTRAINT "DF_Order_Details_Quantity" DEFAULT (1),
	"Discount" "real" NOT NULL CONSTRAINT "DF_Order_Details_Discount" DEFAULT (0),
	CONSTRAINT "PK_Order_Details" PRIMARY KEY  CLUSTERED 
	(
		"OrderID",
		"ProductID"
	),
	CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY 
	(
		"OrderID"
	) REFERENCES "dbo"."Orders" (
		"OrderID"
	),
	CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES "dbo"."Products" (
		"ProductID"
	),
	CONSTRAINT "CK_Discount" CHECK (Discount >= 0 and (Discount <= 1)),
	CONSTRAINT "CK_Quantity" CHECK (Quantity > 0),
	CONSTRAINT "CK_UnitPrice" CHECK (UnitPrice >= 0)
)
GO
 CREATE  INDEX "OrderID" ON "dbo"."Order Details"("OrderID")
GO
 CREATE  INDEX "OrdersOrder_Details" ON "dbo"."Order Details"("OrderID")
GO
 CREATE  INDEX "ProductID" ON "dbo"."Order Details"("ProductID")
GO
 CREATE  INDEX "ProductsOrder_Details" ON "dbo"."Order Details"("ProductID")
GO

create view "Customer and Suppliers by City" AS
SELECT City, CompanyName, ContactName, 'Customers' AS Relationship 
FROM Customers
UNION SELECT City, CompanyName, ContactName, 'Suppliers'
FROM Suppliers
--ORDER BY City, CompanyName
GO

create view "Alphabetical list of products" AS
SELECT Products.*, Categories.CategoryName
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE (((Products.Discontinued)=0))
GO

create view "Current Product List" AS
SELECT Product_List.ProductID, Product_List.ProductName
FROM Products AS Product_List
WHERE (((Product_List.Discontinued)=0))
--ORDER BY Product_List.ProductName
GO

create view "Orders Qry" AS
SELECT Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, 
	Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, 
	Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, 
	Customers.CompanyName, Customers.Address, Customers.City, Customers.Region, Customers.PostalCode, Customers.Country
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GO

create view "Products Above Average Price" AS
SELECT Products.ProductName, Products.UnitPrice
FROM Products
WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products)
--ORDER BY Products.UnitPrice DESC
GO

create view "Products by Category" AS
SELECT Categories.CategoryName, Products.ProductName, Products.QuantityPerUnit, Products.UnitsInStock, Products.Discontinued
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Products.Discontinued <> 1
--ORDER BY Categories.CategoryName, Products.ProductName
GO

create view "Quarterly Orders" AS
SELECT DISTINCT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country
FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
GO

create view Invoices AS
SELECT Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, 
	Orders.ShipCountry, Orders.CustomerID, Customers.CompanyName AS CustomerName, Customers.Address, Customers.City, 
	Customers.Region, Customers.PostalCode, Customers.Country, 
	(FirstName + ' ' + LastName) AS Salesperson, 
	Orders.OrderID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Shippers.CompanyName As ShipperName, 
	"Order Details".ProductID, Products.ProductName, "Order Details".UnitPrice, "Order Details".Quantity, 
	"Order Details".Discount, 
	(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice, Orders.Freight
FROM 	Shippers INNER JOIN 
		(Products INNER JOIN 
			(
				(Employees INNER JOIN 
					(Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) 
				ON Employees.EmployeeID = Orders.EmployeeID) 
			INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
		ON Products.ProductID = "Order Details".ProductID) 
	ON Shippers.ShipperID = Orders.ShipVia
GO

create view "Order Details Extended" AS
SELECT "Order Details".OrderID, "Order Details".ProductID, Products.ProductName, 
	"Order Details".UnitPrice, "Order Details".Quantity, "Order Details".Discount, 
	(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice
FROM Products INNER JOIN "Order Details" ON Products.ProductID = "Order Details".ProductID
--ORDER BY "Order Details".OrderID
GO

create view "Order Subtotals" AS
SELECT "Order Details".OrderID, Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal
FROM "Order Details"
GROUP BY "Order Details".OrderID
GO

create view "Product Sales for 1997" AS
SELECT Categories.CategoryName, Products.ProductName, 
Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales
FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 
	INNER JOIN (Orders 
		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 
	ON Products.ProductID = "Order Details".ProductID
WHERE (((Orders.ShippedDate) Between '19970101' And '19971231'))
GROUP BY Categories.CategoryName, Products.ProductName
GO

create view "Category Sales for 1997" AS
SELECT "Product Sales for 1997".CategoryName, Sum("Product Sales for 1997".ProductSales) AS CategorySales
FROM "Product Sales for 1997"
GROUP BY "Product Sales for 1997".CategoryName
GO

create view "Sales by Category" AS
SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName, 
	Sum("Order Details Extended".ExtendedPrice) AS ProductSales
FROM 	Categories INNER JOIN 
		(Products INNER JOIN 
			(Orders INNER JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID) 
		ON Products.ProductID = "Order Details Extended".ProductID) 
	ON Categories.CategoryID = Products.CategoryID
WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
--ORDER BY Products.ProductName
GO

create view "Sales Totals by Amount" AS
SELECT "Order Subtotals".Subtotal AS SaleAmount, Orders.OrderID, Customers.CompanyName, Orders.ShippedDate
FROM 	Customers INNER JOIN 
		(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
	ON Customers.CustomerID = Orders.CustomerID
WHERE ("Order Subtotals".Subtotal >2500) AND (Orders.ShippedDate BETWEEN '19970101' And '19971231')
GO

create view "Summary of Sales by Quarter" AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate
GO

create view "Summary of Sales by Year" AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate IS NOT NULL
--ORDER BY Orders.ShippedDate
GO

create procedure "Ten Most Expensive Products" AS
SET ROWCOUNT 10
SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC
GO

create procedure "Employee Sales by Country" 
@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Employees.Country, Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
FROM Employees INNER JOIN 
	(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
	ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO

create procedure "Sales by Year" 
	@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO

------ Data Insertion starts here
INSERT INTO "Territories" Values ('01581', 'Westboro',1);
INSERT INTO "Territories" Values ('01730', 'Bedford',1);
INSERT INTO "Territories" Values ('01833', 'Georgetow',1);
INSERT INTO "Territories" Values ('02116', 'Boston',1);
INSERT INTO "Territories" Values ('02139', 'Cambridge',1);
INSERT INTO "Territories" Values ('02184', 'Braintree',1);
INSERT INTO "Territories" Values ('02903', 'Providence',1);
INSERT INTO "Territories" Values ('03049', 'Hollis',3);
INSERT INTO "Territories" Values ('03801', 'Portsmouth',3);
INSERT INTO "Territories" Values ('06897', 'Wilton',1);
INSERT INTO "Territories" Values ('07960', 'Morristown',1);
INSERT INTO "Territories" Values ('08837', 'Edison',1);
INSERT INTO "Territories" Values ('10019', 'New York',1);
INSERT INTO "Territories" Values ('10038', 'New York',1);
INSERT INTO "Territories" Values ('11747', 'Mellvile',1);
INSERT INTO "Territories" Values ('14450', 'Fairport',1);
INSERT INTO "Territories" Values ('19428', 'Philadelphia',3);
INSERT INTO "Territories" Values ('19713', 'Neward',1);
INSERT INTO "Territories" Values ('20852', 'Rockville',1);
INSERT INTO "Territories" Values ('27403', 'Greensboro',1);
INSERT INTO "Territories" Values ('27511', 'Cary',1);
INSERT INTO "Territories" Values ('29202', 'Columbia',4);
INSERT INTO "Territories" Values ('30346', 'Atlanta',4);
INSERT INTO "Territories" Values ('31406', 'Savannah',4);
INSERT INTO "Territories" Values ('32859', 'Orlando',4);
INSERT INTO "Territories" Values ('33607', 'Tampa',4);
INSERT INTO "Territories" Values ('40222', 'Louisville',1);
INSERT INTO "Territories" Values ('44122', 'Beachwood',3);
INSERT INTO "Territories" Values ('45839', 'Findlay',3);
INSERT INTO "Territories" Values ('48075', 'Southfield',3);
INSERT INTO "Territories" Values ('48084', 'Troy',3);
INSERT INTO "Territories" Values ('48304', 'Bloomfield Hills',3);
INSERT INTO "Territories" Values ('53404', 'Racine',3);
INSERT INTO "Territories" Values ('55113', 'Roseville',3);
INSERT INTO "Territories" Values ('55439', 'Minneapolis',3);
INSERT INTO "Territories" Values ('60179', 'Hoffman Estates',2);
INSERT INTO "Territories" Values ('60601', 'Chicago',2);
INSERT INTO "Territories" Values ('72716', 'Bentonville',4);
INSERT INTO "Territories" Values ('75234', 'Dallas',4);
INSERT INTO "Territories" Values ('78759', 'Austin',4);
INSERT INTO "Territories" Values ('80202', 'Denver',2);
INSERT INTO "Territories" Values ('80909', 'Colorado Springs',2);
INSERT INTO "Territories" Values ('85014', 'Phoenix',2);
INSERT INTO "Territories" Values ('85251', 'Scottsdale',2);
INSERT INTO "Territories" Values ('90405', 'Santa Monica',2);
INSERT INTO "Territories" Values ('94025', 'Menlo Park',2);
INSERT INTO "Territories" Values ('94105', 'San Francisco',2);
INSERT INTO "Territories" Values ('95008', 'Campbell',2);
INSERT INTO "Territories" Values ('95054', 'Santa Clara',2);
INSERT INTO "Territories" Values ('95060', 'Santa Cruz',2);
INSERT INTO "Territories" Values ('98004', 'Bellevue',2);
INSERT INTO "Territories" Values ('98052', 'Redmond',2);
INSERT INTO "Territories" Values ('98104', 'Seattle',2);

set quoted_identifier on
go
set identity_insert "Suppliers" on
go
ALTER TABLE "Suppliers" NOCHECK CONSTRAINT ALL
go
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(1,'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London',NULL,'EC1 4SD', 'UK', '(171) 555-2222',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(2,'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822',NULL,'#CAJUN.HTM#');
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(3,'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(4,'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo',NULL,'100', 'Japan', '(03) 3555-5011',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(5,'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(6,'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka',NULL,'545', 'Japan', '(06) 431-7877',NULL,'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(7,'Pavlova,Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(8,'Specialty Biscuits,Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester',NULL,'M14 GSD', 'UK', '(161) 555-4448',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(9,'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg',NULL,'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(10,'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo',NULL,'5442', 'Brazil', '(11) 555 4640',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(11,'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin',NULL,'10785', 'Germany', '(010) 9984510',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(12,'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt',NULL,'60439', 'Germany', '(069) 992755',NULL,'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(13,'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven',NULL,'27478', 'Germany', '(04721) 8713', '(04721) 8714',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(14,'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante,75', 'Ravenna',NULL,'48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(15,'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika',NULL,'1320', 'Norway', '(0)2-953010',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(16,'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(17,'Svensk Sjöföda AB', 'Michael Björn', 'Sales Representative', 'Brovallavägen 231', 'Stockholm',NULL,'S-123 45', 'Sweden', '08-123 45 67',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(18,'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '203,Rue des Francs-Bourgeois', 'Paris',NULL,'75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(19,'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(20,'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop,Suite #402', 'Singapore',NULL,'0512', 'Singapore', '555-8787',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(21,'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby',NULL,'2800', 'Denmark', '43844108', '43844115',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(22,'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam',NULL,'9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(23,'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta',NULL,'53120', 'Finland', '(953) 10956',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(24,'G''day,Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(25,'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9022',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(26,'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini,153', 'Salerno',NULL,'84100', 'Italy', '(089) 6547665', '(089) 6547667',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(27,'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22,rue H. Voiron', 'Montceau',NULL,'71300', 'France', '85.57.00.07',NULL,NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(28,'Gai pâturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3,rue des Alpes', 'Annecy',NULL,'74000', 'France', '38.76.98.06', '38.76.98.58',NULL);
INSERT INTO "Suppliers"("SupplierID","CompanyName","ContactName","ContactTitle","Address","City","Region","PostalCode","Country","Phone","Fax","HomePage") VALUES(29,'Forêts d''érables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921',NULL);
go
set identity_insert "Suppliers" off
go
ALTER TABLE "Suppliers" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Categories" on
go
ALTER TABLE "Categories" NOCHECK CONSTRAINT ALL
go
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(1,'Beverages', 'Soft drinks,coffees,teas,beers,and ales', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(2,'Condiments', 'Sweet and savory sauces,relishes,spreads,and seasonings', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(3,'Confections', 'Desserts,candies,and sweet breads', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(4,'Dairy Products', 'Cheeses', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(5,'Grains/Cereals', 'Breads,crackers,pasta,and cereal', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(6,'Meat/Poultry', 'Prepared meats', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(7,'Produce', 'Dried fruit and bean curd', NULL);
INSERT INTO "Categories"("CategoryID","CategoryName","Description","Picture") VALUES(8,'Seafood', 'Seaweed and fish', NULL);
go
set identity_insert "Categories" off
go
ALTER TABLE "Categories" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Shippers" on
go
ALTER TABLE "Shippers" NOCHECK CONSTRAINT ALL
go
INSERT INTO "Shippers"("ShipperID","CompanyName","Phone") VALUES(1,'Speedy Express', '(503) 555-9831');
INSERT INTO "Shippers"("ShipperID","CompanyName","Phone") VALUES(2,'United Package', '(503) 555-3199');
INSERT INTO "Shippers"("ShipperID","CompanyName","Phone") VALUES(3,'Federal Shipping', '(503) 555-9931');
go
set identity_insert "Shippers" off
go
ALTER TABLE "Shippers" CHECK CONSTRAINT ALL
go

INSERT INTO "Customers" VALUES('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO "Customers" VALUES('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.',NULL,'05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO "Customers" VALUES('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico', '(5) 555-3932',NULL);
INSERT INTO "Customers" VALUES('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London',NULL,'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO "Customers" VALUES('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO "Customers" VALUES('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO "Customers" VALUES('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO "Customers" VALUES('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil,67', 'Madrid',NULL,'28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO "Customers" VALUES('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO "Customers" VALUES('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO "Customers" VALUES('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK', '(171) 555-1212',NULL);
INSERT INTO "Customers" VALUES('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO "Customers" VALUES('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.',NULL,'05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO "Customers" VALUES('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern',NULL,'3012', 'Switzerland', '0452-076545',NULL);
INSERT INTO "Customers" VALUES('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas,23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647',NULL);
INSERT INTO "Customers" VALUES('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12 Brewery', 'London',NULL,'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO "Customers" VALUES('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO "Customers" VALUES('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67,rue des Cinquante Otages', 'Nantes',NULL,'44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO "Customers" VALUES('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London',NULL,'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO "Customers" VALUES('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO "Customers" VALUES('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857',NULL);
INSERT INTO "Customers" VALUES('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal,86', 'Madrid',NULL,'28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO "Customers" VALUES('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistant Sales Agent', '184,chaussée de Tournai', 'Lille',NULL,'59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO "Customers" VALUES('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Owner', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden', '0695-34 67 21',NULL);
INSERT INTO "Customers" VALUES('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO "Customers" VALUES('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54,rue Royale', 'Nantes',NULL,'44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO "Customers" VALUES('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO "Customers" VALUES('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO "Customers" VALUES('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña,23', 'Barcelona',NULL,'08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO "Customers" VALUES('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain', '(95) 555 82 82',NULL);
INSERT INTO "Customers" VALUES('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482',NULL);
INSERT INTO "Customers" VALUES('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555',NULL);
INSERT INTO "Customers" VALUES('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO "Customers" VALUES('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO "Customers" VALUES('HILAA', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO "Customers" VALUES('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO "Customers" VALUES('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland', '2967 542', '2967 3333');
INSERT INTO "Customers" VALUES('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888',NULL);
INSERT INTO "Customers" VALUES('KOENE', 'Königlich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany', '0555-09876',NULL);
INSERT INTO "Customers" VALUES('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67,avenue de l''Europe', 'Versailles',NULL,'78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO "Customers" VALUES('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO "Customers" VALUES('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO "Customers" VALUES('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO "Customers" VALUES('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO "Customers" VALUES('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938',NULL);
INSERT INTO "Customers" VALUES('LILAS', 'LILA-Supermercado', 'Carlos González', 'Accounting Manager', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO "Customers" VALUES('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO "Customers" VALUES('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO "Customers" VALUES('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy', '035-640230', '035-640231');
INSERT INTO "Customers" VALUES('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO "Customers" VALUES('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Marketing Assistant', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO "Customers" VALUES('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig',NULL,'04179', 'Germany', '0342-023176',NULL);
INSERT INTO "Customers" VALUES('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London',NULL,'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO "Customers" VALUES('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires',NULL,'1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO "Customers" VALUES('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO "Customers" VALUES('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO "Customers" VALUES('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Owner', '265,boulevard Charonne', 'Paris',NULL,'75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO "Customers" VALUES('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO "Customers" VALUES('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO "Customers" VALUES('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saúde n. 58', 'Lisboa',NULL,'1756', 'Portugal', '(1) 356-5634',NULL);
INSERT INTO "Customers" VALUES('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO "Customers" VALUES('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Marketing Assistant', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189',NULL);
INSERT INTO "Customers" VALUES('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany', '0372-035188',NULL);
INSERT INTO "Customers" VALUES('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires',NULL,'1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO "Customers" VALUES('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO "Customers" VALUES('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO "Customers" VALUES('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412',NULL);
INSERT INTO "Customers" VALUES('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genève',NULL,'1203', 'Switzerland', '0897-034214',NULL);
INSERT INTO "Customers" VALUES('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Vía,1', 'Madrid',NULL,'28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO "Customers" VALUES('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO "Customers" VALUES('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097',NULL);
INSERT INTO "Customers" VALUES('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO "Customers" VALUES('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO "Customers" VALUES('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Marketing Manager', '25,rue Lauriston', 'Paris',NULL,'75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO "Customers" VALUES('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO "Customers" VALUES('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO "Customers" VALUES('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612',NULL);
INSERT INTO "Customers" VALUES('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO "Customers" VALUES('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO "Customers" VALUES('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico', '(5) 555-2933',NULL);
INSERT INTO "Customers" VALUES('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO "Customers" VALUES('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO "Customers" VALUES('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO "Customers" VALUES('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO "Customers" VALUES('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims',NULL,'51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO "Customers" VALUES('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO "Customers" VALUES('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland', '981-443655', '981-443655');
INSERT INTO "Customers" VALUES('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122',NULL);
INSERT INTO "Customers" VALUES('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO "Customers" VALUES('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO "Customers" VALUES('WOLZA', 'Wolski Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');

set quoted_identifier on
go
set identity_insert "Employees" on
go
ALTER TABLE "Employees" NOCHECK CONSTRAINT ALL
go
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(2,'Fuller', 'Andrew', 'Vice President,Sales', 'Dr.','1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', NULL, 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981. He is fluent in French and Italian and reads German. He joined the company as a sales representative,was promoted to sales manager in January 1992 and to vice president of sales in March 1993. Andrew is a member of the Sales Management Roundtable,the Seattle Chamber of Commerce,and the Pacific Rim Importers Association.',NULL,'http://accweb/emmployees/fuller.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(1,'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', NULL, 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed "The Art of the Cold Call."  Nancy is a member of Toastmasters International.',2,'http://accweb/emmployees/davolio.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(3,'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', NULL, 'Janet has a BS degree in chemistry from Boston College (1984). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.',2,'http://accweb/emmployees/leverling.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(4,'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', NULL, 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966). She was assigned to the London office temporarily from July through November 1992.',2,'http://accweb/emmployees/peacock.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(5,'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London',NULL,'SW1 8JR', 'UK', '(71) 555-4848', '3453', NULL, 'Steven Buchanan graduated from St. Andrews University,Scotland,with a BSC degree in 1976. Upon joining the company as a sales representative in 1992,he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London. He was promoted to sales manager in March 1993. Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management." He is fluent in French.',2,'http://accweb/emmployees/buchanan.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(6,'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House Miner Rd.', 'London',NULL,'EC2 7JR', 'UK', '(71) 555-7773', '428', NULL, 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses "Multi-Cultural Selling" and "Time Management for the Sales Professional."  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.',5,'http://accweb/emmployees/davolio.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(7,'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham HollowWinchester Way', 'London',NULL,'RG1 9SP', 'UK', '(71) 555-5598', '465', NULL, 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled "Selling in Europe," he was transferred to the London office in March 1993.',5,'http://accweb/emmployees/davolio.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(8,'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', NULL, 'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.',2,'http://accweb/emmployees/davolio.bmp');
INSERT INTO "Employees"("EmployeeID","LastName","FirstName","Title","TitleOfCourtesy","BirthDate","HireDate","Address","City","Region","PostalCode","Country","HomePhone","Extension","Photo","Notes","ReportsTo","PhotoPath") VALUES(9,'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London',NULL,'WG2 7LT', 'UK', '(71) 555-4444', '452', NULL, 'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.',5,'http://accweb/emmployees/davolio.bmp');
go
set identity_insert "Employees" off
go
ALTER TABLE "Employees" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Orders" on
go
ALTER TABLE "Orders" NOCHECK CONSTRAINT ALL
go
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10248,'VINET',5, '1996-07-04', '1996-08-01', '1996-07-16',3,32.38,'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims',NULL,'51100', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10249,'TOMSP',6, '1996-07-05', '1996-08-16', '1996-07-10',1,11.61,'Toms Spezialitäten', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10250,'HANAR',4, '1996-07-08', '1996-08-05', '1996-07-12',2,65.83,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10251,'VICTE',3, '1996-07-08', '1996-08-05', '1996-07-15',1,41.34,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10252,'SUPRD',4, '1996-07-09', '1996-08-06', '1996-07-11',2,51.30,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10253,'HANAR',3, '1996-07-10', '1996-07-24', '1996-07-16',2,58.17,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10254,'CHOPS',5, '1996-07-11', '1996-08-08', '1996-07-23',2,22.98,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10255,'RICSU',9, '1996-07-12', '1996-08-09', '1996-07-15',3,148.33,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10256,'WELLI',3, '1996-07-15', '1996-08-12', '1996-07-17',2,13.97,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10257,'HILAA',4, '1996-07-16', '1996-08-13', '1996-07-22',3,81.91,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10258,'ERNSH',1, '1996-07-17', '1996-08-14', '1996-07-23',1,140.51,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10259,'CENTC',4, '1996-07-18', '1996-08-15', '1996-07-25',3,3.25,'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.',NULL,'05022', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10260,'OTTIK',4, '1996-07-19', '1996-08-16', '1996-07-29',1,55.09,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10261,'QUEDE',4, '1996-07-19', '1996-08-16', '1996-07-30',2,3.05,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10262,'RATTC',8, '1996-07-22', '1996-08-19', '1996-07-25',3,48.29,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10263,'ERNSH',9, '1996-07-23', '1996-08-20', '1996-07-31',3,146.06,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10264,'FOLKO',6, '1996-07-24', '1996-08-21', '1996-08-23',3,3.67,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10265,'BLONP',2, '1996-07-25', '1996-08-22', '1996-08-12',1,55.28,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10266,'WARTH',3, '1996-07-26', '1996-09-06', '1996-07-31',3,25.73,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10267,'FRANK',4, '1996-07-29', '1996-08-26', '1996-08-06',1,208.58,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10268,'GROSR',8, '1996-07-30', '1996-08-27', '1996-08-02',3,66.29,'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10269,'WHITC',5, '1996-07-31', '1996-08-14', '1996-08-09',1,4.56,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10270,'WARTH',1, '1996-08-01', '1996-08-29', '1996-08-02',1,136.54,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10271,'SPLIR',6, '1996-08-01', '1996-08-29', '1996-08-30',2,4.54,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10272,'RATTC',6, '1996-08-02', '1996-08-30', '1996-08-06',2,98.03,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10273,'QUICK',3, '1996-08-05', '1996-09-02', '1996-08-12',3,76.07,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10274,'VINET',6, '1996-08-06', '1996-09-03', '1996-08-16',1,6.01,'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims',NULL,'51100', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10275,'MAGAA',1, '1996-08-07', '1996-09-04', '1996-08-09',1,26.93,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10276,'TORTU',8, '1996-08-08', '1996-08-22', '1996-08-14',3,13.84,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10277,'MORGK',2, '1996-08-09', '1996-09-06', '1996-08-13',3,125.77,'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig',NULL,'04179', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10278,'BERGS',8, '1996-08-12', '1996-09-09', '1996-08-16',2,92.69,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10279,'LEHMS',8, '1996-08-13', '1996-09-10', '1996-08-16',2,25.83,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10280,'BERGS',2, '1996-08-14', '1996-09-11', '1996-09-12',1,8.98,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10281,'ROMEY',4, '1996-08-14', '1996-08-28', '1996-08-21',1,2.94,'Romero y tomillo', 'Gran Vía,1', 'Madrid',NULL,'28001', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10282,'ROMEY',4, '1996-08-15', '1996-09-12', '1996-08-21',1,12.69,'Romero y tomillo', 'Gran Vía,1', 'Madrid',NULL,'28001', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10283,'LILAS',3, '1996-08-16', '1996-09-13', '1996-08-23',3,84.81,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10284,'LEHMS',4, '1996-08-19', '1996-09-16', '1996-08-27',1,76.56,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10285,'QUICK',1, '1996-08-20', '1996-09-17', '1996-08-26',2,76.83,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10286,'QUICK',8, '1996-08-21', '1996-09-18', '1996-08-30',3,229.24,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10287,'RICAR',8, '1996-08-22', '1996-09-19', '1996-08-28',3,12.76,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10288,'REGGC',4, '1996-08-23', '1996-09-20', '1996-09-03',1,7.45,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10289,'BSBEV',7, '1996-08-26', '1996-09-23', '1996-08-28',3,22.77,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10290,'COMMI',8, '1996-08-27', '1996-09-24', '1996-09-03',1,79.70,'Comércio Mineiro', 'Av. dos Lusíadas,23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10291,'QUEDE',6, '1996-08-27', '1996-09-24', '1996-09-04',2,6.40,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10292,'TRADH',1, '1996-08-28', '1996-09-25', '1996-09-02',2,1.35,'Tradiçao Hipermercados', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10293,'TORTU',1, '1996-08-29', '1996-09-26', '1996-09-11',3,21.18,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10294,'RATTC',4, '1996-08-30', '1996-09-27', '1996-09-05',2,147.26,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10295,'VINET',2, '1996-09-02', '1996-09-30', '1996-09-10',2,1.15,'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims',NULL,'51100', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10296,'LILAS',6, '1996-09-03', '1996-10-01', '1996-09-11',1,0.12,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10297,'BLONP',5, '1996-09-04', '1996-10-16', '1996-09-10',2,5.74,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10298,'HUNGO',6, '1996-09-05', '1996-10-03', '1996-09-11',2,168.22,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10299,'RICAR',4, '1996-09-06', '1996-10-04', '1996-09-13',2,29.76,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10300,'MAGAA',2, '1996-09-09', '1996-10-07', '1996-09-18',2,17.68,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10301,'WANDK',8, '1996-09-09', '1996-10-07', '1996-09-17',2,45.08,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10302,'SUPRD',4, '1996-09-10', '1996-10-08', '1996-10-09',2,6.27,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10303,'GODOS',7, '1996-09-11', '1996-10-09', '1996-09-18',2,107.83,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10304,'TORTU',1, '1996-09-12', '1996-10-10', '1996-09-17',2,63.79,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10305,'OLDWO',8, '1996-09-13', '1996-10-11', '1996-10-09',3,257.62,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10306,'ROMEY',1, '1996-09-16', '1996-10-14', '1996-09-23',3,7.56,'Romero y tomillo', 'Gran Vía,1', 'Madrid',NULL,'28001', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10307,'LONEP',2, '1996-09-17', '1996-10-15', '1996-09-25',2,0.56,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10308,'ANATR',7, '1996-09-18', '1996-10-16', '1996-09-24',3,1.61,'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.',NULL,'05021', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10309,'HUNGO',3, '1996-09-19', '1996-10-17', '1996-10-23',1,47.30,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10310,'THEBI',8, '1996-09-20', '1996-10-18', '1996-09-27',2,17.52,'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10311,'DUMON',1, '1996-09-20', '1996-10-04', '1996-09-26',3,24.69,'Du monde entier', '67,rue des Cinquante Otages', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10312,'WANDK',2, '1996-09-23', '1996-10-21', '1996-10-03',2,40.26,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10313,'QUICK',2, '1996-09-24', '1996-10-22', '1996-10-04',2,1.96,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10314,'RATTC',1, '1996-09-25', '1996-10-23', '1996-10-04',2,74.16,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10315,'ISLAT',4, '1996-09-26', '1996-10-24', '1996-10-03',2,41.76,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10316,'RATTC',1, '1996-09-27', '1996-10-25', '1996-10-08',3,150.15,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10317,'LONEP',6, '1996-09-30', '1996-10-28', '1996-10-10',1,12.69,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10318,'ISLAT',8, '1996-10-01', '1996-10-29', '1996-10-04',2,4.73,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10319,'TORTU',7, '1996-10-02', '1996-10-30', '1996-10-11',3,64.50,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10320,'WARTH',5, '1996-10-03', '1996-10-17', '1996-10-18',3,34.57,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10321,'ISLAT',3, '1996-10-03', '1996-10-31', '1996-10-11',2,3.43,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10322,'PERIC',7, '1996-10-04', '1996-11-01', '1996-10-23',3,0.40,'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10323,'KOENE',4, '1996-10-07', '1996-11-04', '1996-10-14',1,4.88,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10324,'SAVEA',9, '1996-10-08', '1996-11-05', '1996-10-10',1,214.27,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10325,'KOENE',1, '1996-10-09', '1996-10-23', '1996-10-14',3,64.86,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10326,'BOLID',4, '1996-10-10', '1996-11-07', '1996-10-14',2,77.92,'Bólido Comidas preparadas', 'C/ Araquil,67', 'Madrid',NULL,'28023', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10327,'FOLKO',2, '1996-10-11', '1996-11-08', '1996-10-14',1,63.36,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10328,'FURIB',4, '1996-10-14', '1996-11-11', '1996-10-17',3,87.03,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10329,'SPLIR',4, '1996-10-15', '1996-11-26', '1996-10-23',2,191.67,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10330,'LILAS',3, '1996-10-16', '1996-11-13', '1996-10-28',1,12.75,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10331,'BONAP',9, '1996-10-16', '1996-11-27', '1996-10-21',1,10.19,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10332,'MEREP',3, '1996-10-17', '1996-11-28', '1996-10-21',2,52.84,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10333,'WARTH',5, '1996-10-18', '1996-11-15', '1996-10-25',3,0.59,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10334,'VICTE',8, '1996-10-21', '1996-11-18', '1996-10-28',2,8.56,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10335,'HUNGO',7, '1996-10-22', '1996-11-19', '1996-10-24',2,42.11,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10336,'PRINI',7, '1996-10-23', '1996-11-20', '1996-10-25',2,15.51,'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa',NULL,'1756', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10337,'FRANK',4, '1996-10-24', '1996-11-21', '1996-10-29',3,108.26,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10338,'OLDWO',4, '1996-10-25', '1996-11-22', '1996-10-29',3,84.21,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10339,'MEREP',2, '1996-10-28', '1996-11-25', '1996-11-04',2,15.66,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10340,'BONAP',1, '1996-10-29', '1996-11-26', '1996-11-08',3,166.31,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10341,'SIMOB',7, '1996-10-29', '1996-11-26', '1996-11-05',3,26.78,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10342,'FRANK',4, '1996-10-30', '1996-11-13', '1996-11-04',2,54.83,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10343,'LEHMS',4, '1996-10-31', '1996-11-28', '1996-11-06',1,110.37,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10344,'WHITC',4, '1996-11-01', '1996-11-29', '1996-11-05',2,23.29,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10345,'QUICK',2, '1996-11-04', '1996-12-02', '1996-11-11',2,249.06,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10346,'RATTC',3, '1996-11-05', '1996-12-17', '1996-11-08',3,142.08,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10347,'FAMIA',4, '1996-11-06', '1996-12-04', '1996-11-08',3,3.10,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10348,'WANDK',4, '1996-11-07', '1996-12-05', '1996-11-15',2,0.78,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10349,'SPLIR',7, '1996-11-08', '1996-12-06', '1996-11-15',1,8.63,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10350,'LAMAI',6, '1996-11-11', '1996-12-09', '1996-12-03',2,64.19,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10351,'ERNSH',1, '1996-11-11', '1996-12-09', '1996-11-20',1,162.33,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10352,'FURIB',3, '1996-11-12', '1996-11-26', '1996-11-18',3,1.30,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10353,'PICCO',7, '1996-11-13', '1996-12-11', '1996-11-25',3,360.63,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10354,'PERIC',8, '1996-11-14', '1996-12-12', '1996-11-20',3,53.80,'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10355,'AROUT',6, '1996-11-15', '1996-12-13', '1996-11-20',1,41.95,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10356,'WANDK',6, '1996-11-18', '1996-12-16', '1996-11-27',2,36.71,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10357,'LILAS',1, '1996-11-19', '1996-12-17', '1996-12-02',3,34.88,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10358,'LAMAI',5, '1996-11-20', '1996-12-18', '1996-11-27',1,19.64,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10359,'SEVES',5, '1996-11-21', '1996-12-19', '1996-11-26',3,288.43,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10360,'BLONP',4, '1996-11-22', '1996-12-20', '1996-12-02',3,131.70,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10361,'QUICK',1, '1996-11-22', '1996-12-20', '1996-12-03',2,183.17,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10362,'BONAP',3, '1996-11-25', '1996-12-23', '1996-11-28',1,96.04,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10363,'DRACD',4, '1996-11-26', '1996-12-24', '1996-12-04',3,30.54,'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10364,'EASTC',1, '1996-11-26', '1997-01-07', '1996-12-04',1,71.97,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10365,'ANTON',3, '1996-11-27', '1996-12-25', '1996-12-02',2,22.00,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10366,'GALED',8, '1996-11-28', '1997-01-09', '1996-12-30',2,10.14,'Galería del gastronómo', 'Rambla de Cataluña,23', 'Barcelona',NULL,'8022', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10367,'VAFFE',7, '1996-11-28', '1996-12-26', '1996-12-02',3,13.55,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10368,'ERNSH',2, '1996-11-29', '1996-12-27', '1996-12-02',2,101.95,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10369,'SPLIR',8, '1996-12-02', '1996-12-30', '1996-12-09',2,195.68,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10370,'CHOPS',6, '1996-12-03', '1996-12-31', '1996-12-27',2,1.17,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10371,'LAMAI',1, '1996-12-03', '1996-12-31', '1996-12-24',1,0.45,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10372,'QUEEN',5, '1996-12-04', '1997-01-01', '1996-12-09',2,890.78,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10373,'HUNGO',4, '1996-12-05', '1997-01-02', '1996-12-11',3,124.12,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10374,'WOLZA',1, '1996-12-05', '1997-01-02', '1996-12-09',3,3.94,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10375,'HUNGC',3, '1996-12-06', '1997-01-03', '1996-12-09',2,20.12,'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10376,'MEREP',1, '1996-12-09', '1997-01-06', '1996-12-13',2,20.39,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10377,'SEVES',1, '1996-12-09', '1997-01-06', '1996-12-13',3,22.21,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10378,'FOLKO',5, '1996-12-10', '1997-01-07', '1996-12-19',3,5.44,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10379,'QUEDE',2, '1996-12-11', '1997-01-08', '1996-12-13',1,45.03,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10380,'HUNGO',8, '1996-12-12', '1997-01-09', '1997-01-16',3,35.03,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10381,'LILAS',3, '1996-12-12', '1997-01-09', '1996-12-13',3,7.99,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10382,'ERNSH',4, '1996-12-13', '1997-01-10', '1996-12-16',1,94.77,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10383,'AROUT',8, '1996-12-16', '1997-01-13', '1996-12-18',3,34.24,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10384,'BERGS',3, '1996-12-16', '1997-01-13', '1996-12-20',3,168.64,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10385,'SPLIR',1, '1996-12-17', '1997-01-14', '1996-12-23',2,30.96,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10386,'FAMIA',9, '1996-12-18', '1997-01-01', '1996-12-25',3,13.99,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10387,'SANTG',1, '1996-12-18', '1997-01-15', '1996-12-20',2,93.63,'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10388,'SEVES',2, '1996-12-19', '1997-01-16', '1996-12-20',1,34.86,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10389,'BOTTM',4, '1996-12-20', '1997-01-17', '1996-12-24',2,47.42,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10390,'ERNSH',6, '1996-12-23', '1997-01-20', '1996-12-26',1,126.38,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10391,'DRACD',3, '1996-12-23', '1997-01-20', '1996-12-31',3,5.45,'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10392,'PICCO',2, '1996-12-24', '1997-01-21', '1997-01-01',3,122.46,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10393,'SAVEA',1, '1996-12-25', '1997-01-22', '1997-01-03',3,126.56,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10394,'HUNGC',1, '1996-12-25', '1997-01-22', '1997-01-03',3,30.34,'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10395,'HILAA',6, '1996-12-26', '1997-01-23', '1997-01-03',1,184.41,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10396,'FRANK',1, '1996-12-27', '1997-01-10', '1997-01-06',3,135.35,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10397,'PRINI',5, '1996-12-27', '1997-01-24', '1997-01-02',1,60.26,'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa',NULL,'1756', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10398,'SAVEA',2, '1996-12-30', '1997-01-27', '1997-01-09',3,89.16,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10399,'VAFFE',8, '1996-12-31', '1997-01-14', '1997-01-08',3,27.36,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10400,'EASTC',1, '1997-01-01', '1997-01-29', '1997-01-16',3,83.93,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10401,'RATTC',1, '1997-01-01', '1997-01-29', '1997-01-10',1,12.51,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10402,'ERNSH',8, '1997-01-02', '1997-02-13', '1997-01-10',2,67.88,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10403,'ERNSH',4, '1997-01-03', '1997-01-31', '1997-01-09',3,73.79,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10404,'MAGAA',2, '1997-01-03', '1997-01-31', '1997-01-08',1,155.97,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10405,'LINOD',1, '1997-01-06', '1997-02-03', '1997-01-22',1,34.82,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10406,'QUEEN',7, '1997-01-07', '1997-02-18', '1997-01-13',1,108.04,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10407,'OTTIK',2, '1997-01-07', '1997-02-04', '1997-01-30',2,91.48,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10408,'FOLIG',8, '1997-01-08', '1997-02-05', '1997-01-14',1,11.26,'Folies gourmandes', '184,chaussée de Tournai', 'Lille',NULL,'59000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10409,'OCEAN',3, '1997-01-09', '1997-02-06', '1997-01-14',1,29.83,'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10410,'BOTTM',3, '1997-01-10', '1997-02-07', '1997-01-15',3,2.40,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10411,'BOTTM',9, '1997-01-10', '1997-02-07', '1997-01-21',3,23.65,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10412,'WARTH',8, '1997-01-13', '1997-02-10', '1997-01-15',2,3.77,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10413,'LAMAI',3, '1997-01-14', '1997-02-11', '1997-01-16',2,95.66,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10414,'FAMIA',2, '1997-01-14', '1997-02-11', '1997-01-17',3,21.48,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10415,'HUNGC',3, '1997-01-15', '1997-02-12', '1997-01-24',1,0.20,'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10416,'WARTH',8, '1997-01-16', '1997-02-13', '1997-01-27',3,22.72,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10417,'SIMOB',4, '1997-01-16', '1997-02-13', '1997-01-28',3,70.29,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10418,'QUICK',4, '1997-01-17', '1997-02-14', '1997-01-24',1,17.55,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10419,'RICSU',4, '1997-01-20', '1997-02-17', '1997-01-30',2,137.35,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10420,'WELLI',3, '1997-01-21', '1997-02-18', '1997-01-27',1,44.12,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10421,'QUEDE',8, '1997-01-21', '1997-03-04', '1997-01-27',1,99.23,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10422,'FRANS',2, '1997-01-22', '1997-02-19', '1997-01-31',1,3.02,'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10423,'GOURL',6, '1997-01-23', '1997-02-06', '1997-02-24',3,24.50,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10424,'MEREP',7, '1997-01-23', '1997-02-20', '1997-01-27',2,370.61,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10425,'LAMAI',6, '1997-01-24', '1997-02-21', '1997-02-14',2,7.93,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10426,'GALED',4, '1997-01-27', '1997-02-24', '1997-02-06',1,18.69,'Galería del gastronómo', 'Rambla de Cataluña,23', 'Barcelona',NULL,'8022', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10427,'PICCO',4, '1997-01-27', '1997-02-24', '1997-03-03',2,31.29,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10428,'REGGC',7, '1997-01-28', '1997-02-25', '1997-02-04',1,11.09,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10429,'HUNGO',3, '1997-01-29', '1997-03-12', '1997-02-07',2,56.63,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10430,'ERNSH',4, '1997-01-30', '1997-02-13', '1997-02-03',1,458.78,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10431,'BOTTM',4, '1997-01-30', '1997-02-13', '1997-02-07',2,44.17,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10432,'SPLIR',3, '1997-01-31', '1997-02-14', '1997-02-07',2,4.34,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10433,'PRINI',3, '1997-02-03', '1997-03-03', '1997-03-04',3,73.83,'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa',NULL,'1756', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10434,'FOLKO',3, '1997-02-03', '1997-03-03', '1997-02-13',2,17.92,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10435,'CONSH',8, '1997-02-04', '1997-03-18', '1997-02-07',2,9.21,'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London',NULL,'WX1 6LT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10436,'BLONP',3, '1997-02-05', '1997-03-05', '1997-02-11',2,156.66,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10437,'WARTH',8, '1997-02-05', '1997-03-05', '1997-02-12',1,19.97,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10438,'TOMSP',3, '1997-02-06', '1997-03-06', '1997-02-14',2,8.24,'Toms Spezialitäten', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10439,'MEREP',6, '1997-02-07', '1997-03-07', '1997-02-10',3,4.07,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10440,'SAVEA',4, '1997-02-10', '1997-03-10', '1997-02-28',2,86.53,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10441,'OLDWO',3, '1997-02-10', '1997-03-24', '1997-03-14',2,73.02,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10442,'ERNSH',3, '1997-02-11', '1997-03-11', '1997-02-18',2,47.94,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10443,'REGGC',8, '1997-02-12', '1997-03-12', '1997-02-14',1,13.95,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10444,'BERGS',3, '1997-02-12', '1997-03-12', '1997-02-21',3,3.50,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10445,'BERGS',3, '1997-02-13', '1997-03-13', '1997-02-20',1,9.30,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10446,'TOMSP',6, '1997-02-14', '1997-03-14', '1997-02-19',1,14.68,'Toms Spezialitäten', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10447,'RICAR',4, '1997-02-14', '1997-03-14', '1997-03-07',2,68.66,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10448,'RANCH',4, '1997-02-17', '1997-03-17', '1997-02-24',2,38.82,'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10449,'BLONP',3, '1997-02-18', '1997-03-18', '1997-02-27',2,53.30,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10450,'VICTE',8, '1997-02-19', '1997-03-19', '1997-03-11',2,7.23,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10451,'QUICK',4, '1997-02-19', '1997-03-05', '1997-03-12',3,189.09,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10452,'SAVEA',8, '1997-02-20', '1997-03-20', '1997-02-26',1,140.26,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10453,'AROUT',1, '1997-02-21', '1997-03-21', '1997-02-26',2,25.36,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10454,'LAMAI',4, '1997-02-21', '1997-03-21', '1997-02-25',3,2.74,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10455,'WARTH',8, '1997-02-24', '1997-04-07', '1997-03-03',2,180.45,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10456,'KOENE',8, '1997-02-25', '1997-04-08', '1997-02-28',2,8.12,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10457,'KOENE',2, '1997-02-25', '1997-03-25', '1997-03-03',1,11.57,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10458,'SUPRD',7, '1997-02-26', '1997-03-26', '1997-03-04',3,147.06,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10459,'VICTE',4, '1997-02-27', '1997-03-27', '1997-02-28',2,25.09,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10460,'FOLKO',8, '1997-02-28', '1997-03-28', '1997-03-03',1,16.27,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10461,'LILAS',1, '1997-02-28', '1997-03-28', '1997-03-05',3,148.61,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10462,'CONSH',2, '1997-03-03', '1997-03-31', '1997-03-18',1,6.17,'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London',NULL,'WX1 6LT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10463,'SUPRD',5, '1997-03-04', '1997-04-01', '1997-03-06',3,14.78,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10464,'FURIB',4, '1997-03-04', '1997-04-01', '1997-03-14',2,89.00,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10465,'VAFFE',1, '1997-03-05', '1997-04-02', '1997-03-14',3,145.04,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10466,'COMMI',4, '1997-03-06', '1997-04-03', '1997-03-13',1,11.93,'Comércio Mineiro', 'Av. dos Lusíadas,23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10467,'MAGAA',8, '1997-03-06', '1997-04-03', '1997-03-11',2,4.93,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10468,'KOENE',3, '1997-03-07', '1997-04-04', '1997-03-12',3,44.12,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10469,'WHITC',1, '1997-03-10', '1997-04-07', '1997-03-14',1,60.18,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10470,'BONAP',4, '1997-03-11', '1997-04-08', '1997-03-14',2,64.56,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10471,'BSBEV',2, '1997-03-11', '1997-04-08', '1997-03-18',3,45.59,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10472,'SEVES',8, '1997-03-12', '1997-04-09', '1997-03-19',1,4.20,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10473,'ISLAT',1, '1997-03-13', '1997-03-27', '1997-03-21',3,16.37,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10474,'PERIC',5, '1997-03-13', '1997-04-10', '1997-03-21',2,83.49,'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10475,'SUPRD',9, '1997-03-14', '1997-04-11', '1997-04-04',1,68.52,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10476,'HILAA',8, '1997-03-17', '1997-04-14', '1997-03-24',3,4.41,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10477,'PRINI',5, '1997-03-17', '1997-04-14', '1997-03-25',2,13.02,'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa',NULL,'1756', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10478,'VICTE',2, '1997-03-18', '1997-04-01', '1997-03-26',3,4.81,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10479,'RATTC',3, '1997-03-19', '1997-04-16', '1997-03-21',3,708.95,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10480,'FOLIG',6, '1997-03-20', '1997-04-17', '1997-03-24',2,1.35,'Folies gourmandes', '184,chaussée de Tournai', 'Lille',NULL,'59000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10481,'RICAR',8, '1997-03-20', '1997-04-17', '1997-03-25',2,64.33,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10482,'LAZYK',1, '1997-03-21', '1997-04-18', '1997-04-10',3,7.48,'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10483,'WHITC',7, '1997-03-24', '1997-04-21', '1997-04-25',2,15.28,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10484,'BSBEV',3, '1997-03-24', '1997-04-21', '1997-04-01',3,6.88,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10485,'LINOD',4, '1997-03-25', '1997-04-08', '1997-03-31',2,64.45,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10486,'HILAA',1, '1997-03-26', '1997-04-23', '1997-04-02',2,30.53,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10487,'QUEEN',2, '1997-03-26', '1997-04-23', '1997-03-28',2,71.07,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10488,'FRANK',8, '1997-03-27', '1997-04-24', '1997-04-02',2,4.93,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10489,'PICCO',6, '1997-03-28', '1997-04-25', '1997-04-09',2,5.29,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10490,'HILAA',7, '1997-03-31', '1997-04-28', '1997-04-03',2,210.19,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10491,'FURIB',8, '1997-03-31', '1997-04-28', '1997-04-08',3,16.96,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10492,'BOTTM',3, '1997-04-01', '1997-04-29', '1997-04-11',1,62.89,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10493,'LAMAI',4, '1997-04-02', '1997-04-30', '1997-04-10',3,10.64,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10494,'COMMI',4, '1997-04-02', '1997-04-30', '1997-04-09',2,65.99,'Comércio Mineiro', 'Av. dos Lusíadas,23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10495,'LAUGB',3, '1997-04-03', '1997-05-01', '1997-04-11',3,4.65,'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10496,'TRADH',7, '1997-04-04', '1997-05-02', '1997-04-07',2,46.77,'Tradiçao Hipermercados', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10497,'LEHMS',7, '1997-04-04', '1997-05-02', '1997-04-07',1,36.21,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10498,'HILAA',8, '1997-04-07', '1997-05-05', '1997-04-11',2,29.75,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10499,'LILAS',4, '1997-04-08', '1997-05-06', '1997-04-16',2,102.02,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10500,'LAMAI',6, '1997-04-09', '1997-05-07', '1997-04-17',1,42.68,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10501,'BLAUS',9, '1997-04-09', '1997-05-07', '1997-04-16',3,8.85,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10502,'PERIC',2, '1997-04-10', '1997-05-08', '1997-04-29',1,69.32,'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10503,'HUNGO',6, '1997-04-11', '1997-05-09', '1997-04-16',2,16.74,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10504,'WHITC',4, '1997-04-11', '1997-05-09', '1997-04-18',3,59.13,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10505,'MEREP',3, '1997-04-14', '1997-05-12', '1997-04-21',3,7.13,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10506,'KOENE',9, '1997-04-15', '1997-05-13', '1997-05-02',2,21.19,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10507,'ANTON',7, '1997-04-15', '1997-05-13', '1997-04-22',1,47.45,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10508,'OTTIK',1, '1997-04-16', '1997-05-14', '1997-05-13',2,4.99,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10509,'BLAUS',4, '1997-04-17', '1997-05-15', '1997-04-29',1,0.15,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10510,'SAVEA',6, '1997-04-18', '1997-05-16', '1997-04-28',3,367.63,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10511,'BONAP',4, '1997-04-18', '1997-05-16', '1997-04-21',3,350.64,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10512,'FAMIA',7, '1997-04-21', '1997-05-19', '1997-04-24',2,3.53,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10513,'WANDK',7, '1997-04-22', '1997-06-03', '1997-04-28',1,105.65,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10514,'ERNSH',3, '1997-04-22', '1997-05-20', '1997-05-16',2,789.95,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10515,'QUICK',2, '1997-04-23', '1997-05-07', '1997-05-23',1,204.47,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10516,'HUNGO',2, '1997-04-24', '1997-05-22', '1997-05-01',3,62.78,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10517,'NORTS',3, '1997-04-24', '1997-05-22', '1997-04-29',3,32.07,'North/South', 'South House 300 Queensbridge', 'London',NULL,'SW7 1RZ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10518,'TORTU',4, '1997-04-25', '1997-05-09', '1997-05-05',2,218.15,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10519,'CHOPS',6, '1997-04-28', '1997-05-26', '1997-05-01',3,91.76,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10520,'SANTG',7, '1997-04-29', '1997-05-27', '1997-05-01',1,13.37,'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10521,'CACTU',8, '1997-04-29', '1997-05-27', '1997-05-02',2,17.22,'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10522,'LEHMS',4, '1997-04-30', '1997-05-28', '1997-05-06',1,45.33,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10523,'SEVES',7, '1997-05-01', '1997-05-29', '1997-05-30',2,77.63,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10524,'BERGS',1, '1997-05-01', '1997-05-29', '1997-05-07',2,244.79,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10525,'BONAP',1, '1997-05-02', '1997-05-30', '1997-05-23',2,11.06,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10526,'WARTH',4, '1997-05-05', '1997-06-02', '1997-05-15',2,58.59,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10527,'QUICK',7, '1997-05-05', '1997-06-02', '1997-05-07',1,41.90,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10528,'GREAL',6, '1997-05-06', '1997-05-20', '1997-05-09',2,3.35,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10529,'MAISD',5, '1997-05-07', '1997-06-04', '1997-05-09',2,66.69,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10530,'PICCO',3, '1997-05-08', '1997-06-05', '1997-05-12',2,339.22,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10531,'OCEAN',7, '1997-05-08', '1997-06-05', '1997-05-19',1,8.12,'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10532,'EASTC',7, '1997-05-09', '1997-06-06', '1997-05-12',3,74.46,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10533,'FOLKO',8, '1997-05-12', '1997-06-09', '1997-05-22',1,188.04,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10534,'LEHMS',8, '1997-05-12', '1997-06-09', '1997-05-14',2,27.94,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10535,'ANTON',4, '1997-05-13', '1997-06-10', '1997-05-21',1,15.64,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10536,'LEHMS',3, '1997-05-14', '1997-06-11', '1997-06-06',2,58.88,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10537,'RICSU',1, '1997-05-14', '1997-05-28', '1997-05-19',1,78.85,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10538,'BSBEV',9, '1997-05-15', '1997-06-12', '1997-05-16',3,4.87,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10539,'BSBEV',6, '1997-05-16', '1997-06-13', '1997-05-23',3,12.36,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10540,'QUICK',3, '1997-05-19', '1997-06-16', '1997-06-13',3,1007.64,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10541,'HANAR',2, '1997-05-19', '1997-06-16', '1997-05-29',1,68.65,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10542,'KOENE',1, '1997-05-20', '1997-06-17', '1997-05-26',3,10.95,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10543,'LILAS',8, '1997-05-21', '1997-06-18', '1997-05-23',2,48.17,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10544,'LONEP',4, '1997-05-21', '1997-06-18', '1997-05-30',1,24.91,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10545,'LAZYK',8, '1997-05-22', '1997-06-19', '1997-06-26',2,11.92,'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10546,'VICTE',1, '1997-05-23', '1997-06-20', '1997-05-27',3,194.72,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10547,'SEVES',3, '1997-05-23', '1997-06-20', '1997-06-02',2,178.43,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10548,'TOMSP',3, '1997-05-26', '1997-06-23', '1997-06-02',2,1.43,'Toms Spezialitäten', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10549,'QUICK',5, '1997-05-27', '1997-06-10', '1997-05-30',1,171.24,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10550,'GODOS',7, '1997-05-28', '1997-06-25', '1997-06-06',3,4.32,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10551,'FURIB',4, '1997-05-28', '1997-07-09', '1997-06-06',3,72.95,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10552,'HILAA',2, '1997-05-29', '1997-06-26', '1997-06-05',1,83.22,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10553,'WARTH',2, '1997-05-30', '1997-06-27', '1997-06-03',2,149.49,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10554,'OTTIK',4, '1997-05-30', '1997-06-27', '1997-06-05',3,120.97,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10555,'SAVEA',6, '1997-06-02', '1997-06-30', '1997-06-04',3,252.49,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10556,'SIMOB',2, '1997-06-03', '1997-07-15', '1997-06-13',1,9.80,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10557,'LEHMS',9, '1997-06-03', '1997-06-17', '1997-06-06',2,96.72,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10558,'AROUT',1, '1997-06-04', '1997-07-02', '1997-06-10',2,72.97,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10559,'BLONP',6, '1997-06-05', '1997-07-03', '1997-06-13',1,8.05,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10560,'FRANK',8, '1997-06-06', '1997-07-04', '1997-06-09',1,36.65,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10561,'FOLKO',2, '1997-06-06', '1997-07-04', '1997-06-09',2,242.21,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10562,'REGGC',1, '1997-06-09', '1997-07-07', '1997-06-12',1,22.95,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10563,'RICAR',2, '1997-06-10', '1997-07-22', '1997-06-24',2,60.43,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10564,'RATTC',4, '1997-06-10', '1997-07-08', '1997-06-16',3,13.75,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10565,'MEREP',8, '1997-06-11', '1997-07-09', '1997-06-18',2,7.15,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10566,'BLONP',9, '1997-06-12', '1997-07-10', '1997-06-18',1,88.40,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10567,'HUNGO',1, '1997-06-12', '1997-07-10', '1997-06-17',1,33.97,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10568,'GALED',3, '1997-06-13', '1997-07-11', '1997-07-09',3,6.54,'Galería del gastronómo', 'Rambla de Cataluña,23', 'Barcelona',NULL,'8022', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10569,'RATTC',5, '1997-06-16', '1997-07-14', '1997-07-11',1,58.98,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10570,'MEREP',3, '1997-06-17', '1997-07-15', '1997-06-19',3,188.99,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10571,'ERNSH',8, '1997-06-17', '1997-07-29', '1997-07-04',3,26.06,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10572,'BERGS',3, '1997-06-18', '1997-07-16', '1997-06-25',2,116.43,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10573,'ANTON',7, '1997-06-19', '1997-07-17', '1997-06-20',3,84.84,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10574,'TRAIH',4, '1997-06-19', '1997-07-17', '1997-06-30',2,37.60,'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10575,'MORGK',5, '1997-06-20', '1997-07-04', '1997-06-30',1,127.34,'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig',NULL,'04179', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10576,'TORTU',3, '1997-06-23', '1997-07-07', '1997-06-30',3,18.56,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10577,'TRAIH',9, '1997-06-23', '1997-08-04', '1997-06-30',2,25.41,'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10578,'BSBEV',4, '1997-06-24', '1997-07-22', '1997-07-25',3,29.60,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10579,'LETSS',1, '1997-06-25', '1997-07-23', '1997-07-04',2,13.73,'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10580,'OTTIK',4, '1997-06-26', '1997-07-24', '1997-07-01',3,75.89,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10581,'FAMIA',3, '1997-06-26', '1997-07-24', '1997-07-02',1,3.01,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10582,'BLAUS',3, '1997-06-27', '1997-07-25', '1997-07-14',2,27.71,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10583,'WARTH',2, '1997-06-30', '1997-07-28', '1997-07-04',2,7.28,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10584,'BLONP',4, '1997-06-30', '1997-07-28', '1997-07-04',1,59.14,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10585,'WELLI',7, '1997-07-01', '1997-07-29', '1997-07-10',1,13.41,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10586,'REGGC',9, '1997-07-02', '1997-07-30', '1997-07-09',1,0.48,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10587,'QUEDE',1, '1997-07-02', '1997-07-30', '1997-07-09',1,62.52,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10588,'QUICK',2, '1997-07-03', '1997-07-31', '1997-07-10',3,194.67,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10589,'GREAL',8, '1997-07-04', '1997-08-01', '1997-07-14',2,4.42,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10590,'MEREP',4, '1997-07-07', '1997-08-04', '1997-07-14',3,44.77,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10591,'VAFFE',1, '1997-07-07', '1997-07-21', '1997-07-16',1,55.92,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10592,'LEHMS',3, '1997-07-08', '1997-08-05', '1997-07-16',1,32.10,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10593,'LEHMS',7, '1997-07-09', '1997-08-06', '1997-08-13',2,174.20,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10594,'OLDWO',3, '1997-07-09', '1997-08-06', '1997-07-16',2,5.24,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10595,'ERNSH',2, '1997-07-10', '1997-08-07', '1997-07-14',1,96.78,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10596,'WHITC',8, '1997-07-11', '1997-08-08', '1997-08-12',1,16.34,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10597,'PICCO',7, '1997-07-11', '1997-08-08', '1997-07-18',3,35.12,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10598,'RATTC',1, '1997-07-14', '1997-08-11', '1997-07-18',3,44.42,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10599,'BSBEV',6, '1997-07-15', '1997-08-26', '1997-07-21',3,29.98,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10600,'HUNGC',4, '1997-07-16', '1997-08-13', '1997-07-21',1,45.13,'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10601,'HILAA',7, '1997-07-16', '1997-08-27', '1997-07-22',1,58.30,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10602,'VAFFE',8, '1997-07-17', '1997-08-14', '1997-07-22',2,2.92,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10603,'SAVEA',8, '1997-07-18', '1997-08-15', '1997-08-08',2,48.77,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10604,'FURIB',1, '1997-07-18', '1997-08-15', '1997-07-29',1,7.46,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10605,'MEREP',1, '1997-07-21', '1997-08-18', '1997-07-29',2,379.13,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10606,'TRADH',4, '1997-07-22', '1997-08-19', '1997-07-31',3,79.40,'Tradiçao Hipermercados', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10607,'SAVEA',5, '1997-07-22', '1997-08-19', '1997-07-25',1,200.24,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10608,'TOMSP',4, '1997-07-23', '1997-08-20', '1997-08-01',2,27.79,'Toms Spezialitäten', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10609,'DUMON',7, '1997-07-24', '1997-08-21', '1997-07-30',2,1.85,'Du monde entier', '67,rue des Cinquante Otages', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10610,'LAMAI',8, '1997-07-25', '1997-08-22', '1997-08-06',1,26.78,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10611,'WOLZA',6, '1997-07-25', '1997-08-22', '1997-08-01',2,80.65,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10612,'SAVEA',1, '1997-07-28', '1997-08-25', '1997-08-01',2,544.08,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10613,'HILAA',4, '1997-07-29', '1997-08-26', '1997-08-01',2,8.11,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10614,'BLAUS',8, '1997-07-29', '1997-08-26', '1997-08-01',3,1.93,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10615,'WILMK',2, '1997-07-30', '1997-08-27', '1997-08-06',3,0.75,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10616,'GREAL',1, '1997-07-31', '1997-08-28', '1997-08-05',2,116.53,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10617,'GREAL',4, '1997-07-31', '1997-08-28', '1997-08-04',2,18.53,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10618,'MEREP',1, '1997-08-01', '1997-09-12', '1997-08-08',1,154.68,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10619,'MEREP',3, '1997-08-04', '1997-09-01', '1997-08-07',3,91.05,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10620,'LAUGB',2, '1997-08-05', '1997-09-02', '1997-08-14',3,0.94,'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10621,'ISLAT',4, '1997-08-05', '1997-09-02', '1997-08-11',2,23.73,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10622,'RICAR',4, '1997-08-06', '1997-09-03', '1997-08-11',3,50.97,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10623,'FRANK',8, '1997-08-07', '1997-09-04', '1997-08-12',2,97.18,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10624,'THECR',4, '1997-08-07', '1997-09-04', '1997-08-19',2,94.80,'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10625,'ANATR',3, '1997-08-08', '1997-09-05', '1997-08-14',1,43.90,'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.',NULL,'05021', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10626,'BERGS',1, '1997-08-11', '1997-09-08', '1997-08-20',2,138.69,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10627,'SAVEA',8, '1997-08-11', '1997-09-22', '1997-08-21',3,107.46,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10628,'BLONP',4, '1997-08-12', '1997-09-09', '1997-08-20',3,30.36,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10629,'GODOS',4, '1997-08-12', '1997-09-09', '1997-08-20',3,85.46,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10630,'KOENE',1, '1997-08-13', '1997-09-10', '1997-08-19',2,32.35,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10631,'LAMAI',8, '1997-08-14', '1997-09-11', '1997-08-15',1,0.87,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10632,'WANDK',8, '1997-08-14', '1997-09-11', '1997-08-19',1,41.38,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10633,'ERNSH',7, '1997-08-15', '1997-09-12', '1997-08-18',3,477.90,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10634,'FOLIG',4, '1997-08-15', '1997-09-12', '1997-08-21',3,487.38,'Folies gourmandes', '184,chaussée de Tournai', 'Lille',NULL,'59000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10635,'MAGAA',8, '1997-08-18', '1997-09-15', '1997-08-21',3,47.46,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10636,'WARTH',4, '1997-08-19', '1997-09-16', '1997-08-26',1,1.15,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10637,'QUEEN',6, '1997-08-19', '1997-09-16', '1997-08-26',1,201.29,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10638,'LINOD',3, '1997-08-20', '1997-09-17', '1997-09-01',1,158.44,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10639,'SANTG',7, '1997-08-20', '1997-09-17', '1997-08-27',3,38.64,'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10640,'WANDK',4, '1997-08-21', '1997-09-18', '1997-08-28',1,23.55,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10641,'HILAA',4, '1997-08-22', '1997-09-19', '1997-08-26',2,179.61,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10642,'SIMOB',7, '1997-08-22', '1997-09-19', '1997-09-05',3,41.89,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10643,'ALFKI',6, '1997-08-25', '1997-09-22', '1997-09-02',1,29.46,'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10644,'WELLI',3, '1997-08-25', '1997-09-22', '1997-09-01',2,0.14,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10645,'HANAR',4, '1997-08-26', '1997-09-23', '1997-09-02',1,12.41,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10646,'HUNGO',9, '1997-08-27', '1997-10-08', '1997-09-03',3,142.33,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10647,'QUEDE',4, '1997-08-27', '1997-09-10', '1997-09-03',2,45.54,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10648,'RICAR',5, '1997-08-28', '1997-10-09', '1997-09-09',2,14.25,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10649,'MAISD',5, '1997-08-28', '1997-09-25', '1997-08-29',3,6.20,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10650,'FAMIA',5, '1997-08-29', '1997-09-26', '1997-09-03',3,176.81,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10651,'WANDK',8, '1997-09-01', '1997-09-29', '1997-09-11',2,20.60,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10652,'GOURL',4, '1997-09-01', '1997-09-29', '1997-09-08',2,7.14,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10653,'FRANK',1, '1997-09-02', '1997-09-30', '1997-09-19',1,93.25,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10654,'BERGS',5, '1997-09-02', '1997-09-30', '1997-09-11',1,55.26,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10655,'REGGC',1, '1997-09-03', '1997-10-01', '1997-09-11',2,4.41,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10656,'GREAL',6, '1997-09-04', '1997-10-02', '1997-09-10',1,57.15,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10657,'SAVEA',2, '1997-09-04', '1997-10-02', '1997-09-15',2,352.69,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10658,'QUICK',4, '1997-09-05', '1997-10-03', '1997-09-08',1,364.15,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10659,'QUEEN',7, '1997-09-05', '1997-10-03', '1997-09-10',2,105.81,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10660,'HUNGC',8, '1997-09-08', '1997-10-06', '1997-10-15',1,111.29,'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10661,'HUNGO',7, '1997-09-09', '1997-10-07', '1997-09-15',3,17.55,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10662,'LONEP',3, '1997-09-09', '1997-10-07', '1997-09-18',2,1.28,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10663,'BONAP',2, '1997-09-10', '1997-09-24', '1997-10-03',2,113.15,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10664,'FURIB',1, '1997-09-10', '1997-10-08', '1997-09-19',3,1.27,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10665,'LONEP',1, '1997-09-11', '1997-10-09', '1997-09-17',2,26.31,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10666,'RICSU',7, '1997-09-12', '1997-10-10', '1997-09-22',2,232.42,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10667,'ERNSH',7, '1997-09-12', '1997-10-10', '1997-09-19',1,78.09,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10668,'WANDK',1, '1997-09-15', '1997-10-13', '1997-09-23',2,47.22,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10669,'SIMOB',2, '1997-09-15', '1997-10-13', '1997-09-22',1,24.39,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10670,'FRANK',4, '1997-09-16', '1997-10-14', '1997-09-18',1,203.48,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10671,'FRANR',1, '1997-09-17', '1997-10-15', '1997-09-24',1,30.34,'France restauration', '54,rue Royale', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10672,'BERGS',9, '1997-09-17', '1997-10-01', '1997-09-26',2,95.75,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10673,'WILMK',2, '1997-09-18', '1997-10-16', '1997-09-19',1,22.76,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10674,'ISLAT',4, '1997-09-18', '1997-10-16', '1997-09-30',2,0.90,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10675,'FRANK',5, '1997-09-19', '1997-10-17', '1997-09-23',2,31.85,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10676,'TORTU',2, '1997-09-22', '1997-10-20', '1997-09-29',2,2.01,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10677,'ANTON',1, '1997-09-22', '1997-10-20', '1997-09-26',3,4.03,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10678,'SAVEA',7, '1997-09-23', '1997-10-21', '1997-10-16',3,388.98,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10679,'BLONP',8, '1997-09-23', '1997-10-21', '1997-09-30',3,27.94,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10680,'OLDWO',1, '1997-09-24', '1997-10-22', '1997-09-26',1,26.61,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10681,'GREAL',3, '1997-09-25', '1997-10-23', '1997-09-30',3,76.13,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10682,'ANTON',3, '1997-09-25', '1997-10-23', '1997-10-01',2,36.13,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10683,'DUMON',2, '1997-09-26', '1997-10-24', '1997-10-01',1,4.40,'Du monde entier', '67,rue des Cinquante Otages', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10684,'OTTIK',3, '1997-09-26', '1997-10-24', '1997-09-30',1,145.63,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10685,'GOURL',4, '1997-09-29', '1997-10-13', '1997-10-03',2,33.75,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10686,'PICCO',2, '1997-09-30', '1997-10-28', '1997-10-08',1,96.50,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10687,'HUNGO',9, '1997-09-30', '1997-10-28', '1997-10-30',2,296.43,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10688,'VAFFE',4, '1997-10-01', '1997-10-15', '1997-10-07',2,299.09,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10689,'BERGS',1, '1997-10-01', '1997-10-29', '1997-10-07',2,13.42,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10690,'HANAR',1, '1997-10-02', '1997-10-30', '1997-10-03',1,15.80,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10691,'QUICK',2, '1997-10-03', '1997-11-14', '1997-10-22',2,810.05,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10692,'ALFKI',4, '1997-10-03', '1997-10-31', '1997-10-13',2,61.02,'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10693,'WHITC',3, '1997-10-06', '1997-10-20', '1997-10-10',3,139.34,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10694,'QUICK',8, '1997-10-06', '1997-11-03', '1997-10-09',3,398.36,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10695,'WILMK',7, '1997-10-07', '1997-11-18', '1997-10-14',1,16.72,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10696,'WHITC',8, '1997-10-08', '1997-11-19', '1997-10-14',3,102.55,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10697,'LINOD',3, '1997-10-08', '1997-11-05', '1997-10-14',1,45.52,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10698,'ERNSH',4, '1997-10-09', '1997-11-06', '1997-10-17',1,272.47,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10699,'MORGK',3, '1997-10-09', '1997-11-06', '1997-10-13',3,0.58,'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig',NULL,'04179', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10700,'SAVEA',3, '1997-10-10', '1997-11-07', '1997-10-16',1,65.10,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10701,'HUNGO',6, '1997-10-13', '1997-10-27', '1997-10-15',3,220.31,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10702,'ALFKI',4, '1997-10-13', '1997-11-24', '1997-10-21',1,23.94,'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10703,'FOLKO',6, '1997-10-14', '1997-11-11', '1997-10-20',2,152.30,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10704,'QUEEN',6, '1997-10-14', '1997-11-11', '1997-11-07',1,4.78,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10705,'HILAA',9, '1997-10-15', '1997-11-12', '1997-11-18',2,3.52,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10706,'OLDWO',8, '1997-10-16', '1997-11-13', '1997-10-21',3,135.63,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10707,'AROUT',4, '1997-10-16', '1997-10-30', '1997-10-23',3,21.74,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10708,'THEBI',6, '1997-10-17', '1997-11-28', '1997-11-05',2,2.96,'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10709,'GOURL',1, '1997-10-17', '1997-11-14', '1997-11-20',3,210.80,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10710,'FRANS',1, '1997-10-20', '1997-11-17', '1997-10-23',1,4.98,'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10711,'SAVEA',5, '1997-10-21', '1997-12-02', '1997-10-29',2,52.41,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10712,'HUNGO',3, '1997-10-21', '1997-11-18', '1997-10-31',1,89.93,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10713,'SAVEA',1, '1997-10-22', '1997-11-19', '1997-10-24',1,167.05,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10714,'SAVEA',5, '1997-10-22', '1997-11-19', '1997-10-27',3,24.49,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10715,'BONAP',3, '1997-10-23', '1997-11-06', '1997-10-29',1,63.20,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10716,'RANCH',4, '1997-10-24', '1997-11-21', '1997-10-27',2,22.57,'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10717,'FRANK',1, '1997-10-24', '1997-11-21', '1997-10-29',2,59.25,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10718,'KOENE',1, '1997-10-27', '1997-11-24', '1997-10-29',3,170.88,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10719,'LETSS',8, '1997-10-27', '1997-11-24', '1997-11-05',2,51.44,'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10720,'QUEDE',8, '1997-10-28', '1997-11-11', '1997-11-05',2,9.53,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10721,'QUICK',5, '1997-10-29', '1997-11-26', '1997-10-31',3,48.92,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10722,'SAVEA',8, '1997-10-29', '1997-12-10', '1997-11-04',1,74.58,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10723,'WHITC',3, '1997-10-30', '1997-11-27', '1997-11-25',1,21.72,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10724,'MEREP',8, '1997-10-30', '1997-12-11', '1997-11-05',2,57.75,'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10725,'FAMIA',4, '1997-10-31', '1997-11-28', '1997-11-05',3,10.83,'Familia Arquibaldo', 'Rua Orós,92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10726,'EASTC',4, '1997-11-03', '1997-11-17', '1997-12-05',1,16.56,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10727,'REGGC',2, '1997-11-03', '1997-12-01', '1997-12-05',1,89.90,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10728,'QUEEN',4, '1997-11-04', '1997-12-02', '1997-11-11',2,58.33,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10729,'LINOD',8, '1997-11-04', '1997-12-16', '1997-11-14',3,141.06,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10730,'BONAP',5, '1997-11-05', '1997-12-03', '1997-11-14',1,20.12,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10731,'CHOPS',7, '1997-11-06', '1997-12-04', '1997-11-14',1,96.65,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10732,'BONAP',3, '1997-11-06', '1997-12-04', '1997-11-07',1,16.97,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10733,'BERGS',1, '1997-11-07', '1997-12-05', '1997-11-10',3,110.11,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10734,'GOURL',2, '1997-11-07', '1997-12-05', '1997-11-12',3,1.63,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10735,'LETSS',6, '1997-11-10', '1997-12-08', '1997-11-21',2,45.97,'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10736,'HUNGO',9, '1997-11-11', '1997-12-09', '1997-11-21',2,44.10,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10737,'VINET',2, '1997-11-11', '1997-12-09', '1997-11-18',2,7.79,'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims',NULL,'51100', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10738,'SPECD',2, '1997-11-12', '1997-12-10', '1997-11-18',1,2.91,'Spécialités du monde', '25,rue Lauriston', 'Paris',NULL,'75016', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10739,'VINET',3, '1997-11-12', '1997-12-10', '1997-11-17',3,11.08,'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims',NULL,'51100', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10740,'WHITC',4, '1997-11-13', '1997-12-11', '1997-11-25',2,81.88,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10741,'AROUT',4, '1997-11-14', '1997-11-28', '1997-11-18',3,10.96,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10742,'BOTTM',3, '1997-11-14', '1997-12-12', '1997-11-18',3,243.73,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10743,'AROUT',1, '1997-11-17', '1997-12-15', '1997-11-21',2,23.72,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10744,'VAFFE',6, '1997-11-17', '1997-12-15', '1997-11-24',1,69.19,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10745,'QUICK',9, '1997-11-18', '1997-12-16', '1997-11-27',1,3.52,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10746,'CHOPS',1, '1997-11-19', '1997-12-17', '1997-11-21',3,31.43,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10747,'PICCO',6, '1997-11-19', '1997-12-17', '1997-11-26',1,117.33,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10748,'SAVEA',3, '1997-11-20', '1997-12-18', '1997-11-28',1,232.55,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10749,'ISLAT',4, '1997-11-20', '1997-12-18', '1997-12-19',2,61.53,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10750,'WARTH',9, '1997-11-21', '1997-12-19', '1997-11-24',1,79.30,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10751,'RICSU',3, '1997-11-24', '1997-12-22', '1997-12-03',3,130.79,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10752,'NORTS',2, '1997-11-24', '1997-12-22', '1997-11-28',3,1.39,'North/South', 'South House 300 Queensbridge', 'London',NULL,'SW7 1RZ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10753,'FRANS',3, '1997-11-25', '1997-12-23', '1997-11-27',1,7.70,'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10754,'MAGAA',6, '1997-11-25', '1997-12-23', '1997-11-27',3,2.38,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10755,'BONAP',4, '1997-11-26', '1997-12-24', '1997-11-28',2,16.71,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10756,'SPLIR',8, '1997-11-27', '1997-12-25', '1997-12-02',2,73.21,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10757,'SAVEA',6, '1997-11-27', '1997-12-25', '1997-12-15',1,8.19,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10758,'RICSU',3, '1997-11-28', '1997-12-26', '1997-12-04',3,138.17,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10759,'ANATR',3, '1997-11-28', '1997-12-26', '1997-12-12',3,11.99,'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.',NULL,'05021', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10760,'MAISD',4, '1997-12-01', '1997-12-29', '1997-12-10',1,155.64,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10761,'RATTC',5, '1997-12-02', '1997-12-30', '1997-12-08',2,18.66,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10762,'FOLKO',3, '1997-12-02', '1997-12-30', '1997-12-09',1,328.74,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10763,'FOLIG',3, '1997-12-03', '1997-12-31', '1997-12-08',3,37.35,'Folies gourmandes', '184,chaussée de Tournai', 'Lille',NULL,'59000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10764,'ERNSH',6, '1997-12-03', '1997-12-31', '1997-12-08',3,145.45,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10765,'QUICK',3, '1997-12-04', '1998-01-01', '1997-12-09',3,42.74,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10766,'OTTIK',4, '1997-12-05', '1998-01-02', '1997-12-09',1,157.55,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10767,'SUPRD',4, '1997-12-05', '1998-01-02', '1997-12-15',3,1.59,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10768,'AROUT',3, '1997-12-08', '1998-01-05', '1997-12-15',2,146.32,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10769,'VAFFE',3, '1997-12-08', '1998-01-05', '1997-12-12',1,65.06,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10770,'HANAR',8, '1997-12-09', '1998-01-06', '1997-12-17',3,5.32,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10771,'ERNSH',9, '1997-12-10', '1998-01-07', '1998-01-02',2,11.19,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10772,'LEHMS',3, '1997-12-10', '1998-01-07', '1997-12-19',2,91.28,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10773,'ERNSH',1, '1997-12-11', '1998-01-08', '1997-12-16',3,96.43,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10774,'FOLKO',4, '1997-12-11', '1997-12-25', '1997-12-12',1,48.20,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10775,'THECR',7, '1997-12-12', '1998-01-09', '1997-12-26',1,20.25,'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10776,'ERNSH',1, '1997-12-15', '1998-01-12', '1997-12-18',3,351.53,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10777,'GOURL',7, '1997-12-15', '1997-12-29', '1998-01-21',2,3.01,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10778,'BERGS',3, '1997-12-16', '1998-01-13', '1997-12-24',1,6.79,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10779,'MORGK',3, '1997-12-16', '1998-01-13', '1998-01-14',2,58.13,'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig',NULL,'04179', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10780,'LILAS',2, '1997-12-16', '1997-12-30', '1997-12-25',1,42.13,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10781,'WARTH',2, '1997-12-17', '1998-01-14', '1997-12-19',3,73.16,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10782,'CACTU',9, '1997-12-17', '1998-01-14', '1997-12-22',3,1.10,'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10783,'HANAR',4, '1997-12-18', '1998-01-15', '1997-12-19',2,124.98,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10784,'MAGAA',4, '1997-12-18', '1998-01-15', '1997-12-22',3,70.09,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10785,'GROSR',1, '1997-12-18', '1998-01-15', '1997-12-24',3,1.51,'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10786,'QUEEN',8, '1997-12-19', '1998-01-16', '1997-12-23',1,110.87,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10787,'LAMAI',2, '1997-12-19', '1998-01-02', '1997-12-26',1,249.93,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10788,'QUICK',1, '1997-12-22', '1998-01-19', '1998-01-19',2,42.70,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10789,'FOLIG',1, '1997-12-22', '1998-01-19', '1997-12-31',2,100.60,'Folies gourmandes', '184,chaussée de Tournai', 'Lille',NULL,'59000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10790,'GOURL',6, '1997-12-22', '1998-01-19', '1997-12-26',1,28.23,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10791,'FRANK',6, '1997-12-23', '1998-01-20', '1998-01-01',2,16.85,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10792,'WOLZA',1, '1997-12-23', '1998-01-20', '1997-12-31',3,23.79,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10793,'AROUT',3, '1997-12-24', '1998-01-21', '1998-01-08',3,4.52,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10794,'QUEDE',6, '1997-12-24', '1998-01-21', '1998-01-02',1,21.49,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10795,'ERNSH',8, '1997-12-24', '1998-01-21', '1998-01-20',2,126.66,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10796,'HILAA',3, '1997-12-25', '1998-01-22', '1998-01-14',1,26.52,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10797,'DRACD',7, '1997-12-25', '1998-01-22', '1998-01-05',2,33.35,'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10798,'ISLAT',2, '1997-12-26', '1998-01-23', '1998-01-05',1,2.33,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10799,'KOENE',9, '1997-12-26', '1998-02-06', '1998-01-05',3,30.76,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10800,'SEVES',1, '1997-12-26', '1998-01-23', '1998-01-05',3,137.44,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10801,'BOLID',4, '1997-12-29', '1998-01-26', '1997-12-31',2,97.09,'Bólido Comidas preparadas', 'C/ Araquil,67', 'Madrid',NULL,'28023', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10802,'SIMOB',4, '1997-12-29', '1998-01-26', '1998-01-02',2,257.26,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10803,'WELLI',4, '1997-12-30', '1998-01-27', '1998-01-06',1,55.23,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10804,'SEVES',6, '1997-12-30', '1998-01-27', '1998-01-07',2,27.33,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10805,'THEBI',2, '1997-12-30', '1998-01-27', '1998-01-09',3,237.34,'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10806,'VICTE',3, '1997-12-31', '1998-01-28', '1998-01-05',2,22.11,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10807,'FRANS',4, '1997-12-31', '1998-01-28', '1998-01-30',1,1.36,'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10808,'OLDWO',2, '1998-01-01', '1998-01-29', '1998-01-09',3,45.53,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10809,'WELLI',7, '1998-01-01', '1998-01-29', '1998-01-07',1,4.87,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10810,'LAUGB',2, '1998-01-01', '1998-01-29', '1998-01-07',3,4.33,'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10811,'LINOD',8, '1998-01-02', '1998-01-30', '1998-01-08',1,31.22,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10812,'REGGC',5, '1998-01-02', '1998-01-30', '1998-01-12',1,59.78,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10813,'RICAR',1, '1998-01-05', '1998-02-02', '1998-01-09',1,47.38,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10814,'VICTE',3, '1998-01-05', '1998-02-02', '1998-01-14',3,130.94,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10815,'SAVEA',2, '1998-01-05', '1998-02-02', '1998-01-14',3,14.62,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10816,'GREAL',4, '1998-01-06', '1998-02-03', '1998-02-04',2,719.78,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10817,'KOENE',3, '1998-01-06', '1998-01-20', '1998-01-13',2,306.07,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10818,'MAGAA',7, '1998-01-07', '1998-02-04', '1998-01-12',3,65.48,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10819,'CACTU',2, '1998-01-07', '1998-02-04', '1998-01-16',3,19.76,'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10820,'RATTC',3, '1998-01-07', '1998-02-04', '1998-01-13',2,37.52,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10821,'SPLIR',1, '1998-01-08', '1998-02-05', '1998-01-15',1,36.68,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10822,'TRAIH',6, '1998-01-08', '1998-02-05', '1998-01-16',3,7.00,'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10823,'LILAS',5, '1998-01-09', '1998-02-06', '1998-01-13',2,163.97,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10824,'FOLKO',8, '1998-01-09', '1998-02-06', '1998-01-30',1,1.23,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10825,'DRACD',1, '1998-01-09', '1998-02-06', '1998-01-14',1,79.25,'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10826,'BLONP',6, '1998-01-12', '1998-02-09', '1998-02-06',1,7.09,'Blondel père et fils', '24,place Kléber', 'Strasbourg',NULL,'67000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10827,'BONAP',1, '1998-01-12', '1998-01-26', '1998-02-06',2,63.54,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10828,'RANCH',9, '1998-01-13', '1998-01-27', '1998-02-04',1,90.85,'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10829,'ISLAT',9, '1998-01-13', '1998-02-10', '1998-01-23',1,154.72,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10830,'TRADH',4, '1998-01-13', '1998-02-24', '1998-01-21',2,81.83,'Tradiçao Hipermercados', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10831,'SANTG',3, '1998-01-14', '1998-02-11', '1998-01-23',2,72.19,'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10832,'LAMAI',2, '1998-01-14', '1998-02-11', '1998-01-19',2,43.26,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10833,'OTTIK',6, '1998-01-15', '1998-02-12', '1998-01-23',2,71.49,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10834,'TRADH',1, '1998-01-15', '1998-02-12', '1998-01-19',3,29.78,'Tradiçao Hipermercados', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10835,'ALFKI',1, '1998-01-15', '1998-02-12', '1998-01-21',3,69.53,'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10836,'ERNSH',7, '1998-01-16', '1998-02-13', '1998-01-21',1,411.88,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10837,'BERGS',9, '1998-01-16', '1998-02-13', '1998-01-23',3,13.32,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10838,'LINOD',3, '1998-01-19', '1998-02-16', '1998-01-23',3,59.28,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10839,'TRADH',3, '1998-01-19', '1998-02-16', '1998-01-22',3,35.43,'Tradiçao Hipermercados', 'Av. Inês de Castro,414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10840,'LINOD',4, '1998-01-19', '1998-03-02', '1998-02-16',2,2.71,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10841,'SUPRD',5, '1998-01-20', '1998-02-17', '1998-01-29',2,424.30,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10842,'TORTU',1, '1998-01-20', '1998-02-17', '1998-01-29',3,54.42,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10843,'VICTE',4, '1998-01-21', '1998-02-18', '1998-01-26',2,9.26,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10844,'PICCO',8, '1998-01-21', '1998-02-18', '1998-01-26',2,25.22,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10845,'QUICK',8, '1998-01-21', '1998-02-04', '1998-01-30',1,212.98,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10846,'SUPRD',2, '1998-01-22', '1998-03-05', '1998-01-23',3,56.46,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10847,'SAVEA',4, '1998-01-22', '1998-02-05', '1998-02-10',3,487.57,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10848,'CONSH',7, '1998-01-23', '1998-02-20', '1998-01-29',2,38.24,'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London',NULL,'WX1 6LT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10849,'KOENE',9, '1998-01-23', '1998-02-20', '1998-01-30',2,0.56,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10850,'VICTE',1, '1998-01-23', '1998-03-06', '1998-01-30',1,49.19,'Victuailles en stock', '2,rue du Commerce', 'Lyon',NULL,'69004', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10851,'RICAR',5, '1998-01-26', '1998-02-23', '1998-02-02',1,160.55,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10852,'RATTC',8, '1998-01-26', '1998-02-09', '1998-01-30',1,174.05,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10853,'BLAUS',9, '1998-01-27', '1998-02-24', '1998-02-03',2,53.83,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10854,'ERNSH',3, '1998-01-27', '1998-02-24', '1998-02-05',2,100.22,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10855,'OLDWO',3, '1998-01-27', '1998-02-24', '1998-02-04',1,170.97,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10856,'ANTON',3, '1998-01-28', '1998-02-25', '1998-02-10',2,58.43,'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.',NULL,'05023', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10857,'BERGS',8, '1998-01-28', '1998-02-25', '1998-02-06',2,188.85,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10858,'LACOR',2, '1998-01-29', '1998-02-26', '1998-02-03',1,52.51,'La corne d''abondance', '67,avenue de l''Europe', 'Versailles',NULL,'78000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10859,'FRANK',1, '1998-01-29', '1998-02-26', '1998-02-02',2,76.10,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10860,'FRANR',3, '1998-01-29', '1998-02-26', '1998-02-04',3,19.26,'France restauration', '54,rue Royale', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10861,'WHITC',4, '1998-01-30', '1998-02-27', '1998-02-17',2,14.93,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10862,'LEHMS',8, '1998-01-30', '1998-03-13', '1998-02-02',2,53.23,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10863,'HILAA',4, '1998-02-02', '1998-03-02', '1998-02-17',2,30.26,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10864,'AROUT',4, '1998-02-02', '1998-03-02', '1998-02-09',2,3.04,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10865,'QUICK',2, '1998-02-02', '1998-02-16', '1998-02-12',1,348.14,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10866,'BERGS',5, '1998-02-03', '1998-03-03', '1998-02-12',1,109.11,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10867,'LONEP',6, '1998-02-03', '1998-03-17', '1998-02-11',1,1.93,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10868,'QUEEN',7, '1998-02-04', '1998-03-04', '1998-02-23',2,191.27,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10869,'SEVES',5, '1998-02-04', '1998-03-04', '1998-02-09',1,143.28,'Seven Seas Imports', '90 Wadhurst Rd.', 'London',NULL,'OX15 4NB', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10870,'WOLZA',5, '1998-02-04', '1998-03-04', '1998-02-13',3,12.04,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10871,'BONAP',9, '1998-02-05', '1998-03-05', '1998-02-10',2,112.27,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10872,'GODOS',5, '1998-02-05', '1998-03-05', '1998-02-09',2,175.32,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10873,'WILMK',4, '1998-02-06', '1998-03-06', '1998-02-09',1,0.82,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10874,'GODOS',5, '1998-02-06', '1998-03-06', '1998-02-11',2,19.58,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10875,'BERGS',4, '1998-02-06', '1998-03-06', '1998-03-03',2,32.37,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10876,'BONAP',7, '1998-02-09', '1998-03-09', '1998-02-12',3,60.42,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10877,'RICAR',1, '1998-02-09', '1998-03-09', '1998-02-19',1,38.06,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10878,'QUICK',4, '1998-02-10', '1998-03-10', '1998-02-12',1,46.69,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10879,'WILMK',3, '1998-02-10', '1998-03-10', '1998-02-12',3,8.50,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10880,'FOLKO',7, '1998-02-10', '1998-03-24', '1998-02-18',1,88.01,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10881,'CACTU',4, '1998-02-11', '1998-03-11', '1998-02-18',1,2.84,'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10882,'SAVEA',4, '1998-02-11', '1998-03-11', '1998-02-20',3,23.10,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10883,'LONEP',8, '1998-02-12', '1998-03-12', '1998-02-20',3,0.53,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10884,'LETSS',4, '1998-02-12', '1998-03-12', '1998-02-13',2,90.97,'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10885,'SUPRD',6, '1998-02-12', '1998-03-12', '1998-02-18',3,5.64,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10886,'HANAR',1, '1998-02-13', '1998-03-13', '1998-03-02',1,4.99,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10887,'GALED',8, '1998-02-13', '1998-03-13', '1998-02-16',3,1.25,'Galería del gastronómo', 'Rambla de Cataluña,23', 'Barcelona',NULL,'8022', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10888,'GODOS',1, '1998-02-16', '1998-03-16', '1998-02-23',2,51.87,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10889,'RATTC',9, '1998-02-16', '1998-03-16', '1998-02-23',3,280.61,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10890,'DUMON',7, '1998-02-16', '1998-03-16', '1998-02-18',1,32.76,'Du monde entier', '67,rue des Cinquante Otages', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10891,'LEHMS',7, '1998-02-17', '1998-03-17', '1998-02-19',2,20.37,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10892,'MAISD',4, '1998-02-17', '1998-03-17', '1998-02-19',2,120.27,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10893,'KOENE',9, '1998-02-18', '1998-03-18', '1998-02-20',2,77.78,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10894,'SAVEA',1, '1998-02-18', '1998-03-18', '1998-02-20',1,116.13,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10895,'ERNSH',3, '1998-02-18', '1998-03-18', '1998-02-23',1,162.75,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10896,'MAISD',7, '1998-02-19', '1998-03-19', '1998-02-27',3,32.45,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10897,'HUNGO',3, '1998-02-19', '1998-03-19', '1998-02-25',2,603.54,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10898,'OCEAN',4, '1998-02-20', '1998-03-20', '1998-03-06',2,1.27,'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10899,'LILAS',5, '1998-02-20', '1998-03-20', '1998-02-26',3,1.21,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10900,'WELLI',1, '1998-02-20', '1998-03-20', '1998-03-04',2,1.66,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10901,'HILAA',4, '1998-02-23', '1998-03-23', '1998-02-26',1,62.09,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10902,'FOLKO',1, '1998-02-23', '1998-03-23', '1998-03-03',1,44.15,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10903,'HANAR',3, '1998-02-24', '1998-03-24', '1998-03-04',3,36.71,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10904,'WHITC',3, '1998-02-24', '1998-03-24', '1998-02-27',3,162.95,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10905,'WELLI',9, '1998-02-24', '1998-03-24', '1998-03-06',2,13.72,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10906,'WOLZA',4, '1998-02-25', '1998-03-11', '1998-03-03',3,26.29,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10907,'SPECD',6, '1998-02-25', '1998-03-25', '1998-02-27',3,9.19,'Spécialités du monde', '25,rue Lauriston', 'Paris',NULL,'75016', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10908,'REGGC',4, '1998-02-26', '1998-03-26', '1998-03-06',2,32.96,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10909,'SANTG',1, '1998-02-26', '1998-03-26', '1998-03-10',2,53.05,'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10910,'WILMK',1, '1998-02-26', '1998-03-26', '1998-03-04',3,38.11,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10911,'GODOS',3, '1998-02-26', '1998-03-26', '1998-03-05',1,38.19,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10912,'HUNGO',2, '1998-02-26', '1998-03-26', '1998-03-18',2,580.91,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10913,'QUEEN',4, '1998-02-26', '1998-03-26', '1998-03-04',1,33.05,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10914,'QUEEN',6, '1998-02-27', '1998-03-27', '1998-03-02',1,21.19,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10915,'TORTU',2, '1998-02-27', '1998-03-27', '1998-03-02',2,3.51,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10916,'RANCH',1, '1998-02-27', '1998-03-27', '1998-03-09',2,63.77,'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10917,'ROMEY',4, '1998-03-02', '1998-03-30', '1998-03-11',2,8.29,'Romero y tomillo', 'Gran Vía,1', 'Madrid',NULL,'28001', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10918,'BOTTM',3, '1998-03-02', '1998-03-30', '1998-03-11',3,48.83,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10919,'LINOD',2, '1998-03-02', '1998-03-30', '1998-03-04',2,19.80,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10920,'AROUT',4, '1998-03-03', '1998-03-31', '1998-03-09',2,29.61,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10921,'VAFFE',1, '1998-03-03', '1998-04-14', '1998-03-09',1,176.48,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10922,'HANAR',5, '1998-03-03', '1998-03-31', '1998-03-05',3,62.74,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10923,'LAMAI',7, '1998-03-03', '1998-04-14', '1998-03-13',3,68.26,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10924,'BERGS',3, '1998-03-04', '1998-04-01', '1998-04-08',2,151.52,'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå',NULL,'S-958 22', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10925,'HANAR',3, '1998-03-04', '1998-04-01', '1998-03-13',1,2.27,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10926,'ANATR',4, '1998-03-04', '1998-04-01', '1998-03-11',3,39.92,'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.',NULL,'05021', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10927,'LACOR',4, '1998-03-05', '1998-04-02', '1998-04-08',1,19.79,'La corne d''abondance', '67,avenue de l''Europe', 'Versailles',NULL,'78000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10928,'GALED',1, '1998-03-05', '1998-04-02', '1998-03-18',1,1.36,'Galería del gastronómo', 'Rambla de Cataluña,23', 'Barcelona',NULL,'8022', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10929,'FRANK',6, '1998-03-05', '1998-04-02', '1998-03-12',1,33.93,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10930,'SUPRD',4, '1998-03-06', '1998-04-17', '1998-03-18',3,15.55,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10931,'RICSU',4, '1998-03-06', '1998-03-20', '1998-03-19',2,13.60,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10932,'BONAP',8, '1998-03-06', '1998-04-03', '1998-03-24',1,134.64,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10933,'ISLAT',6, '1998-03-06', '1998-04-03', '1998-03-16',3,54.15,'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10934,'LEHMS',3, '1998-03-09', '1998-04-06', '1998-03-12',3,32.01,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10935,'WELLI',4, '1998-03-09', '1998-04-06', '1998-03-18',3,47.59,'Wellington Importadora', 'Rua do Mercado,12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10936,'GREAL',3, '1998-03-09', '1998-04-06', '1998-03-18',2,33.68,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10937,'CACTU',7, '1998-03-10', '1998-03-24', '1998-03-13',3,31.51,'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10938,'QUICK',3, '1998-03-10', '1998-04-07', '1998-03-16',2,31.89,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10939,'MAGAA',2, '1998-03-10', '1998-04-07', '1998-03-13',2,76.33,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10940,'BONAP',8, '1998-03-11', '1998-04-08', '1998-03-23',3,19.77,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10941,'SAVEA',7, '1998-03-11', '1998-04-08', '1998-03-20',2,400.81,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10942,'REGGC',9, '1998-03-11', '1998-04-08', '1998-03-18',3,17.95,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10943,'BSBEV',4, '1998-03-11', '1998-04-08', '1998-03-19',2,2.17,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10944,'BOTTM',6, '1998-03-12', '1998-03-26', '1998-03-13',3,52.92,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10945,'MORGK',4, '1998-03-12', '1998-04-09', '1998-03-18',1,10.22,'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig',NULL,'04179', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10946,'VAFFE',1, '1998-03-12', '1998-04-09', '1998-03-19',2,27.20,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10947,'BSBEV',3, '1998-03-13', '1998-04-10', '1998-03-16',2,3.26,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10948,'GODOS',3, '1998-03-13', '1998-04-10', '1998-03-19',3,23.39,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10949,'BOTTM',2, '1998-03-13', '1998-04-10', '1998-03-17',3,74.44,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10950,'MAGAA',1, '1998-03-16', '1998-04-13', '1998-03-23',2,2.50,'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo',NULL,'24100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10951,'RICSU',9, '1998-03-16', '1998-04-27', '1998-04-07',2,30.85,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10952,'ALFKI',1, '1998-03-16', '1998-04-27', '1998-03-24',1,40.42,'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10953,'AROUT',9, '1998-03-16', '1998-03-30', '1998-03-25',2,23.72,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10954,'LINOD',5, '1998-03-17', '1998-04-28', '1998-03-20',1,27.91,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10955,'FOLKO',8, '1998-03-17', '1998-04-14', '1998-03-20',2,3.26,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10956,'BLAUS',6, '1998-03-17', '1998-04-28', '1998-03-20',2,44.65,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10957,'HILAA',8, '1998-03-18', '1998-04-15', '1998-03-27',3,105.36,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10958,'OCEAN',7, '1998-03-18', '1998-04-15', '1998-03-27',2,49.56,'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10959,'GOURL',6, '1998-03-18', '1998-04-29', '1998-03-23',2,4.98,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10960,'HILAA',3, '1998-03-19', '1998-04-02', '1998-04-08',1,2.08,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10961,'QUEEN',8, '1998-03-19', '1998-04-16', '1998-03-30',1,104.47,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10962,'QUICK',8, '1998-03-19', '1998-04-16', '1998-03-23',2,275.79,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10963,'FURIB',9, '1998-03-19', '1998-04-16', '1998-03-26',3,2.70,'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa',NULL,'1675', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10964,'SPECD',3, '1998-03-20', '1998-04-17', '1998-03-24',2,87.38,'Spécialités du monde', '25,rue Lauriston', 'Paris',NULL,'75016', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10965,'OLDWO',6, '1998-03-20', '1998-04-17', '1998-03-30',3,144.38,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10966,'CHOPS',4, '1998-03-20', '1998-04-17', '1998-04-08',1,27.19,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10967,'TOMSP',2, '1998-03-23', '1998-04-20', '1998-04-02',2,62.22,'Toms Spezialitäten', 'Luisenstr. 48', 'Münster',NULL,'44087', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10968,'ERNSH',1, '1998-03-23', '1998-04-20', '1998-04-01',3,74.60,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10969,'COMMI',1, '1998-03-23', '1998-04-20', '1998-03-30',2,0.21,'Comércio Mineiro', 'Av. dos Lusíadas,23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10970,'BOLID',9, '1998-03-24', '1998-04-07', '1998-04-24',1,16.16,'Bólido Comidas preparadas', 'C/ Araquil,67', 'Madrid',NULL,'28023', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10971,'FRANR',2, '1998-03-24', '1998-04-21', '1998-04-02',2,121.82,'France restauration', '54,rue Royale', 'Nantes',NULL,'44000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10972,'LACOR',4, '1998-03-24', '1998-04-21', '1998-03-26',2,0.02,'La corne d''abondance', '67,avenue de l''Europe', 'Versailles',NULL,'78000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10973,'LACOR',6, '1998-03-24', '1998-04-21', '1998-03-27',2,15.17,'La corne d''abondance', '67,avenue de l''Europe', 'Versailles',NULL,'78000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10974,'SPLIR',3, '1998-03-25', '1998-04-08', '1998-04-03',3,12.96,'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10975,'BOTTM',1, '1998-03-25', '1998-04-22', '1998-03-27',3,32.27,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10976,'HILAA',1, '1998-03-25', '1998-05-06', '1998-04-03',1,37.97,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10977,'FOLKO',8, '1998-03-26', '1998-04-23', '1998-04-10',3,208.50,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10978,'MAISD',9, '1998-03-26', '1998-04-23', '1998-04-23',2,32.82,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10979,'ERNSH',8, '1998-03-26', '1998-04-23', '1998-03-31',2,353.07,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10980,'FOLKO',4, '1998-03-27', '1998-05-08', '1998-04-17',1,1.26,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10981,'HANAR',1, '1998-03-27', '1998-04-24', '1998-04-02',2,193.37,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10982,'BOTTM',2, '1998-03-27', '1998-04-24', '1998-04-08',1,14.01,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10983,'SAVEA',2, '1998-03-27', '1998-04-24', '1998-04-06',2,657.54,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10984,'SAVEA',1, '1998-03-30', '1998-04-27', '1998-04-03',3,211.22,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10985,'HUNGO',2, '1998-03-30', '1998-04-27', '1998-04-02',1,91.51,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10986,'OCEAN',8, '1998-03-30', '1998-04-27', '1998-04-21',2,217.86,'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10987,'EASTC',8, '1998-03-31', '1998-04-28', '1998-04-06',1,185.48,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10988,'RATTC',3, '1998-03-31', '1998-04-28', '1998-04-10',2,61.14,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10989,'QUEDE',2, '1998-03-31', '1998-04-28', '1998-04-02',1,34.76,'Que Delícia', 'Rua da Panificadora,12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10990,'ERNSH',2, '1998-04-01', '1998-05-13', '1998-04-07',3,117.61,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10991,'QUICK',1, '1998-04-01', '1998-04-29', '1998-04-07',1,38.51,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10992,'THEBI',1, '1998-04-01', '1998-04-29', '1998-04-03',3,4.27,'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10993,'FOLKO',7, '1998-04-01', '1998-04-29', '1998-04-10',3,8.81,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10994,'VAFFE',2, '1998-04-02', '1998-04-16', '1998-04-09',3,65.53,'Vaffeljernet', 'Smagsloget 45', 'Århus',NULL,'8200', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10995,'PERIC',1, '1998-04-02', '1998-04-30', '1998-04-06',3,46.00,'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10996,'QUICK',4, '1998-04-02', '1998-04-30', '1998-04-10',2,1.12,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10997,'LILAS',8, '1998-04-03', '1998-05-15', '1998-04-13',2,73.91,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10998,'WOLZA',8, '1998-04-03', '1998-04-17', '1998-04-17',2,20.31,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (10999,'OTTIK',6, '1998-04-03', '1998-05-01', '1998-04-10',2,96.35,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11000,'RATTC',2, '1998-04-06', '1998-05-04', '1998-04-14',3,55.12,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11001,'FOLKO',2, '1998-04-06', '1998-05-04', '1998-04-14',2,197.30,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11002,'SAVEA',4, '1998-04-06', '1998-05-04', '1998-04-16',1,141.16,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11003,'THECR',3, '1998-04-06', '1998-05-04', '1998-04-08',3,14.91,'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11004,'MAISD',3, '1998-04-07', '1998-05-05', '1998-04-20',1,44.84,'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles',NULL,'B-1180', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11005,'WILMK',2, '1998-04-07', '1998-05-05', '1998-04-10',1,0.75,'Wilman Kala', 'Keskuskatu 45', 'Helsinki',NULL,'21240', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11006,'GREAL',3, '1998-04-07', '1998-05-05', '1998-04-15',2,25.19,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11007,'PRINI',8, '1998-04-08', '1998-05-06', '1998-04-13',2,202.24,'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa',NULL,'1756', 'Portugal');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11008,'ERNSH',7, '1998-04-08', '1998-05-06',NULL,3,79.46,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11009,'GODOS',2, '1998-04-08', '1998-05-06', '1998-04-10',1,59.11,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11010,'REGGC',2, '1998-04-09', '1998-05-07', '1998-04-21',2,28.71,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11011,'ALFKI',3, '1998-04-09', '1998-05-07', '1998-04-13',1,1.21,'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin',NULL,'12209', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11012,'FRANK',1, '1998-04-09', '1998-04-23', '1998-04-17',3,242.95,'Frankenversand', 'Berliner Platz 43', 'München',NULL,'80805', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11013,'ROMEY',2, '1998-04-09', '1998-05-07', '1998-04-10',1,32.99,'Romero y tomillo', 'Gran Vía,1', 'Madrid',NULL,'28001', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11014,'LINOD',2, '1998-04-10', '1998-05-08', '1998-04-15',3,23.60,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11015,'SANTG',2, '1998-04-10', '1998-04-24', '1998-04-20',2,4.62,'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern',NULL,'4110', 'Norway');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11016,'AROUT',9, '1998-04-10', '1998-05-08', '1998-04-13',2,33.80,'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11017,'ERNSH',9, '1998-04-13', '1998-05-11', '1998-04-20',2,754.26,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11018,'LONEP',4, '1998-04-13', '1998-05-11', '1998-04-16',2,11.65,'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11019,'RANCH',6, '1998-04-13', '1998-05-11',NULL,3,3.17,'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11020,'OTTIK',2, '1998-04-14', '1998-05-12', '1998-04-16',2,43.30,'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln',NULL,'50739', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11021,'QUICK',3, '1998-04-14', '1998-05-12', '1998-04-21',1,297.18,'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde',NULL,'01307', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11022,'HANAR',9, '1998-04-14', '1998-05-12', '1998-05-04',2,6.27,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11023,'BSBEV',1, '1998-04-14', '1998-04-28', '1998-04-24',2,123.83,'B''s Beverages', 'Fauntleroy Circus', 'London',NULL,'EC2 5NT', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11024,'EASTC',4, '1998-04-15', '1998-05-13', '1998-04-20',1,74.36,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11025,'WARTH',6, '1998-04-15', '1998-05-13', '1998-04-24',3,29.17,'Wartian Herkku', 'Torikatu 38', 'Oulu',NULL,'90110', 'Finland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11026,'FRANS',4, '1998-04-15', '1998-05-13', '1998-04-28',1,47.09,'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11027,'BOTTM',1, '1998-04-16', '1998-05-14', '1998-04-20',1,52.52,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11028,'KOENE',2, '1998-04-16', '1998-05-14', '1998-04-22',1,29.59,'Königlich Essen', 'Maubelstr. 90', 'Brandenburg',NULL,'14776', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11029,'CHOPS',4, '1998-04-16', '1998-05-14', '1998-04-27',1,47.84,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11030,'SAVEA',7, '1998-04-17', '1998-05-15', '1998-04-27',2,830.75,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11031,'SAVEA',6, '1998-04-17', '1998-05-15', '1998-04-24',2,227.22,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11032,'WHITC',2, '1998-04-17', '1998-05-15', '1998-04-23',3,606.19,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11033,'RICSU',7, '1998-04-17', '1998-05-15', '1998-04-23',3,84.74,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11034,'OLDWO',8, '1998-04-20', '1998-06-01', '1998-04-27',1,40.32,'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11035,'SUPRD',2, '1998-04-20', '1998-05-18', '1998-04-24',2,0.17,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11036,'DRACD',8, '1998-04-20', '1998-05-18', '1998-04-22',3,149.47,'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11037,'GODOS',7, '1998-04-21', '1998-05-19', '1998-04-27',1,3.20,'Godos Cocina Típica', 'C/ Romero,33', 'Sevilla',NULL,'41101', 'Spain');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11038,'SUPRD',1, '1998-04-21', '1998-05-19', '1998-04-30',2,29.59,'Suprêmes délices', 'Boulevard Tirou,255', 'Charleroi',NULL,'B-6000', 'Belgium');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11039,'LINOD',1, '1998-04-21', '1998-05-19',NULL,2,65.00,'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11040,'GREAL',4, '1998-04-22', '1998-05-20',NULL,3,18.84,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11041,'CHOPS',3, '1998-04-22', '1998-05-20', '1998-04-28',2,48.22,'Chop-suey Chinese', 'Hauptstr. 31', 'Bern',NULL,'3012', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11042,'COMMI',2, '1998-04-22', '1998-05-06', '1998-05-01',1,29.99,'Comércio Mineiro', 'Av. dos Lusíadas,23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11043,'SPECD',5, '1998-04-22', '1998-05-20', '1998-04-29',2,8.80,'Spécialités du monde', '25,rue Lauriston', 'Paris',NULL,'75016', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11044,'WOLZA',4, '1998-04-23', '1998-05-21', '1998-05-01',1,8.72,'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa',NULL,'01-012', 'Poland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11045,'BOTTM',6, '1998-04-23', '1998-05-21',NULL,2,70.58,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11046,'WANDK',8, '1998-04-23', '1998-05-21', '1998-04-24',2,71.64,'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart',NULL,'70563', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11047,'EASTC',7, '1998-04-24', '1998-05-22', '1998-05-01',3,46.62,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11048,'BOTTM',7, '1998-04-24', '1998-05-22', '1998-04-30',3,24.12,'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11049,'GOURL',3, '1998-04-24', '1998-05-22', '1998-05-04',1,8.34,'Gourmet Lanchonetes', 'Av. Brasil,442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11050,'FOLKO',8, '1998-04-27', '1998-05-25', '1998-05-05',2,59.41,'Folk och fä HB', 'Åkergatan 24', 'Bräcke',NULL,'S-844 67', 'Sweden');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11051,'LAMAI',7, '1998-04-27', '1998-05-25',NULL,3,2.79,'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse',NULL,'31000', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11052,'HANAR',3, '1998-04-27', '1998-05-25', '1998-05-01',1,67.26,'Hanari Carnes', 'Rua do Paço,67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11053,'PICCO',2, '1998-04-27', '1998-05-25', '1998-04-29',2,53.05,'Piccolo und mehr', 'Geislweg 14', 'Salzburg',NULL,'5020', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11054,'CACTU',8, '1998-04-28', '1998-05-26',NULL,1,0.33,'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires',NULL,'1010', 'Argentina');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11055,'HILAA',7, '1998-04-28', '1998-05-26', '1998-05-05',2,120.92,'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11056,'EASTC',8, '1998-04-28', '1998-05-12', '1998-05-01',2,278.96,'Eastern Connection', '35 King George', 'London',NULL,'WX3 6FW', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11057,'NORTS',3, '1998-04-29', '1998-05-27', '1998-05-01',3,4.13,'North/South', 'South House 300 Queensbridge', 'London',NULL,'SW7 1RZ', 'UK');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11058,'BLAUS',9, '1998-04-29', '1998-05-27',NULL,3,31.14,'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim',NULL,'68306', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11059,'RICAR',2, '1998-04-29', '1998-06-10',NULL,2,85.80,'Ricardo Adocicados', 'Av. Copacabana,267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11060,'FRANS',2, '1998-04-30', '1998-05-28', '1998-05-04',2,10.98,'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino',NULL,'10100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11061,'GREAL',4, '1998-04-30', '1998-06-11',NULL,3,14.01,'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11062,'REGGC',4, '1998-04-30', '1998-05-28',NULL,2,29.93,'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia',NULL,'42100', 'Italy');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11063,'HUNGO',3, '1998-04-30', '1998-05-28', '1998-05-06',2,81.73,'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork',NULL,'Ireland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11064,'SAVEA',1, '1998-05-01', '1998-05-29', '1998-05-04',1,30.09,'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11065,'LILAS',8, '1998-05-01', '1998-05-29',NULL,1,12.91,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11066,'WHITC',7, '1998-05-01', '1998-05-29', '1998-05-04',2,44.72,'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11067,'DRACD',1, '1998-05-04', '1998-05-18', '1998-05-06',2,7.98,'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen',NULL,'52066', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11068,'QUEEN',8, '1998-05-04', '1998-06-01',NULL,2,81.75,'Queen Cozinha', 'Alameda dos Canàrios,891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11069,'TORTU',1, '1998-05-04', '1998-06-01', '1998-05-06',2,15.67,'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11070,'LEHMS',2, '1998-05-05', '1998-06-02',NULL,1,136.00,'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.',NULL,'60528', 'Germany');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11071,'LILAS',1, '1998-05-05', '1998-06-02',NULL,1,0.93,'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11072,'ERNSH',4, '1998-05-05', '1998-06-02',NULL,2,258.64,'Ernst Handel', 'Kirchgasse 6', 'Graz',NULL,'8010', 'Austria');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11073,'PERIC',2, '1998-05-05', '1998-06-02',NULL,2,24.95,'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.',NULL,'05033', 'Mexico');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11074,'SIMOB',7, '1998-05-06', '1998-06-03',NULL,2,18.44,'Simons bistro', 'Vinbæltet 34', 'Kobenhavn',NULL,'1734', 'Denmark');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11075,'RICSU',8, '1998-05-06', '1998-06-03',NULL,2,6.19,'Richter Supermarkt', 'Starenweg 5', 'Genève',NULL,'1204', 'Switzerland');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11076,'BONAP',4, '1998-05-06', '1998-06-03',NULL,2,38.28,'Bon app''', '12,rue des Bouchers', 'Marseille',NULL,'13008', 'France');
INSERT INTO "Orders" ("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate","ShippedDate","ShipVia","Freight","ShipName","ShipAddress","ShipCity","ShipRegion","ShipPostalCode","ShipCountry") VALUES (11077,'RATTC',1, '1998-05-06', '1998-06-03',NULL,2,8.53,'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
go
set identity_insert "Orders" off
go
ALTER TABLE "Orders" CHECK CONSTRAINT ALL
go

set quoted_identifier on
go
set identity_insert "Products" on
go
ALTER TABLE "Products" NOCHECK CONSTRAINT ALL
go
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(1,'Chai',1,1,'10 boxes x 20 bags',18,39,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(2,'Chang',1,1,'24 - 12 oz bottles',19,17,40,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10,13,70,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22,53,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.35,0,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(6,'Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25,120,0,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(7,'Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30,15,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40,6,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97,29,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(10,'Ikura',4,8,'12 - 200 ml jars',31,31,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(11,'Queso Cabrales',5,4,'1 kg pkg.',21,22,30,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,86,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(13,'Konbu',6,8,'2 kg box',6,24,0,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(14,'Tofu',6,7,'40 - 100 g pkgs.',23.25,35,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(15,'Genen Shouyu',6,2,'24 - 250 ml bottles',15.5,39,0,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(16,'Pavlova',7,3,'32 - 500 g boxes',17.45,29,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(17,'Alice Mutton',7,6,'20 - 1 kg tins',39,0,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(18,'Carnarvon Tigers',7,8,'16 kg pkg.',62.5,42,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(19,'Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9.2,25,0,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(20,'Sir Rodney''s Marmalade',8,3,'30 gift boxes',81,40,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(21,'Sir Rodney''s Scones',8,3,'24 pkgs. x 4 pieces',10,3,40,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(22,'Gustaf''s Knäckebröd',9,5,'24 - 500 g pkgs.',21,104,0,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(23,'Tunnbröd',9,5,'12 - 250 g pkgs.',9,61,0,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(24,'Guaraná Fantástica',10,1,'12 - 355 ml cans',4.5,20,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(25,'NuNuCa Nuß-Nougat-Creme',11,3,'20 - 450 g glasses',14,76,0,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(26,'Gumbär Gummibärchen',11,3,'100 - 250 g bags',31.23,15,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(27,'Schoggi Schokolade',11,3,'100 - 100 g pieces',43.9,49,0,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(28,'Rössle Sauerkraut',12,7,'25 - 825 g cans',45.6,26,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(29,'Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',123.79,0,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(30,'Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89,10,0,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(31,'Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.5,0,70,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(32,'Mascarpone Fabioli',14,4,'24 - 200 g pkgs.',32,9,40,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(33,'Geitost',15,4,'500 g',2.5,112,0,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(34,'Sasquatch Ale',16,1,'24 - 12 oz bottles',14,111,0,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(35,'Steeleye Stout',16,1,'24 - 12 oz bottles',18,20,0,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(36,'Inlagd Sill',17,8,'24 - 250 g jars',19,112,0,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(37,'Gravad lax',17,8,'12 - 500 g pkgs.',26,11,50,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(38,'Côte de Blaye',18,1,'12 - 75 cl bottles',263.5,17,0,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(39,'Chartreuse verte',18,1,'750 cc per bottle',18,69,0,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(40,'Boston Crab Meat',19,8,'24 - 4 oz tins',18.4,123,0,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(41,'Jack''s New England Clam Chowder',19,8,'12 - 12 oz cans',9.65,85,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(42,'Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14,26,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(43,'Ipoh Coffee',20,1,'16 - 500 g tins',46,17,10,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(44,'Gula Malacca',20,2,'20 - 2 kg bags',19.45,27,0,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(45,'Rogede sild',21,8,'1k pkg.',9.5,5,70,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(46,'Spegesild',21,8,'4 - 450 g glasses',12,95,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(47,'Zaanse koeken',22,3,'10 - 4 oz boxes',9.5,36,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(48,'Chocolade',22,3,'10 pkgs.',12.75,15,70,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(49,'Maxilaku',23,3,'24 - 50 g pkgs.',20,10,60,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(50,'Valkoinen suklaa',23,3,'12 - 100 g bars',16.25,65,0,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(51,'Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53,20,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(52,'Filo Mix',24,5,'16 - 2 kg boxes',7,38,0,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(53,'Perth Pasties',24,6,'48 pieces',32.8,0,0,0,1);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(54,'Tourtière',25,6,'16 pies',7.45,21,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(55,'Pâté chinois',25,6,'24 boxes x 2 pies',24,115,0,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(56,'Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38,21,10,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(57,'Ravioli Angelo',26,5,'24 - 250 g pkgs.',19.5,36,0,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(58,'Escargots de Bourgogne',27,8,'24 pieces',13.25,62,0,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(59,'Raclette Courdavault',28,4,'5 kg pkg.',55,79,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(60,'Camembert Pierrot',28,4,'15 - 300 g rounds',34,19,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(61,'Sirop d''érable',29,2,'24 - 500 ml bottles',28.5,113,0,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(62,'Tarte au sucre',29,3,'48 pies',49.3,17,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(63,'Vegie-spread',7,2,'15 - 625 g jars',43.9,24,0,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(64,'Wimmers gute Semmelknödel',12,5,'20 bags x 4 pieces',33.25,22,80,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05,76,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17,4,100,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(67,'Laughing Lumberjack Lager',16,1,'24 - 12 oz bottles',14,52,0,10,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(68,'Scottish Longbreads',8,3,'10 boxes x 8 pieces',12.5,6,10,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(69,'Gudbrandsdalsost',15,4,'10 kg pkg.',36,26,0,15,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(70,'Outback Lager',7,1,'24 - 355 ml bottles',15,15,10,30,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(71,'Flotemysost',15,4,'10 - 500 g pkgs.',21.5,26,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.8,14,0,0,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(73,'Röd Kaviar',17,8,'24 - 150 g jars',15,101,0,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(74,'Longlife Tofu',4,7,'5 kg pkg.',10,4,20,5,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(75,'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',7.75,125,0,25,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(76,'Lakkalikööri',23,1,'500 ml',18,57,0,20,0);
INSERT INTO "Products"("ProductID","ProductName","SupplierID","CategoryID","QuantityPerUnit","UnitPrice","UnitsInStock","UnitsOnOrder","ReorderLevel","Discontinued") VALUES(77,'Original Frankfurter grüne Soße',12,2,'12 boxes',13,32,0,15,0);
go
set identity_insert "Products" off
go
ALTER TABLE "Products" CHECK CONSTRAINT ALL
go

INSERT INTO "OrderDetails" VALUES(10248,11,14,12,0);
INSERT INTO "OrderDetails" VALUES(10248,42,9.8,10,0);
INSERT INTO "OrderDetails" VALUES(10248,72,34.8,5,0);
INSERT INTO "OrderDetails" VALUES(10249,14,18.6,9,0);
INSERT INTO "OrderDetails" VALUES(10249,51,42.4,40,0);
INSERT INTO "OrderDetails" VALUES(10250,41,7.7,10,0);
INSERT INTO "OrderDetails" VALUES(10250,51,42.4,35,0.15);
INSERT INTO "OrderDetails" VALUES(10250,65,16.8,15,0.15);
INSERT INTO "OrderDetails" VALUES(10251,22,16.8,6,0.05);
INSERT INTO "OrderDetails" VALUES(10251,57,15.6,15,0.05);
INSERT INTO "OrderDetails" VALUES(10251,65,16.8,20,0);
INSERT INTO "OrderDetails" VALUES(10252,20,64.8,40,0.05);
INSERT INTO "OrderDetails" VALUES(10252,33,2,25,0.05);
INSERT INTO "OrderDetails" VALUES(10252,60,27.2,40,0);
INSERT INTO "OrderDetails" VALUES(10253,31,10,20,0);
INSERT INTO "OrderDetails" VALUES(10253,39,14.4,42,0);
INSERT INTO "OrderDetails" VALUES(10253,49,16,40,0);
INSERT INTO "OrderDetails" VALUES(10254,24,3.6,15,0.15);
INSERT INTO "OrderDetails" VALUES(10254,55,19.2,21,0.15);
INSERT INTO "OrderDetails" VALUES(10254,74,8,21,0);
INSERT INTO "OrderDetails" VALUES(10255,2,15.2,20,0);
INSERT INTO "OrderDetails" VALUES(10255,16,13.9,35,0);
INSERT INTO "OrderDetails" VALUES(10255,36,15.2,25,0);
INSERT INTO "OrderDetails" VALUES(10255,59,44,30,0);
INSERT INTO "OrderDetails" VALUES(10256,53,26.2,15,0);
INSERT INTO "OrderDetails" VALUES(10256,77,10.4,12,0);
INSERT INTO "OrderDetails" VALUES(10257,27,35.1,25,0);
INSERT INTO "OrderDetails" VALUES(10257,39,14.4,6,0);
INSERT INTO "OrderDetails" VALUES(10257,77,10.4,15,0);
INSERT INTO "OrderDetails" VALUES(10258,2,15.2,50,0.2);
INSERT INTO "OrderDetails" VALUES(10258,5,17,65,0.2);
INSERT INTO "OrderDetails" VALUES(10258,32,25.6,6,0.2);
INSERT INTO "OrderDetails" VALUES(10259,21,8,10,0);
INSERT INTO "OrderDetails" VALUES(10259,37,20.8,1,0);
INSERT INTO "OrderDetails" VALUES(10260,41,7.7,16,0.25);
INSERT INTO "OrderDetails" VALUES(10260,57,15.6,50,0);
INSERT INTO "OrderDetails" VALUES(10260,62,39.4,15,0.25);
INSERT INTO "OrderDetails" VALUES(10260,70,12,21,0.25);
INSERT INTO "OrderDetails" VALUES(10261,21,8,20,0);
INSERT INTO "OrderDetails" VALUES(10261,35,14.4,20,0);
INSERT INTO "OrderDetails" VALUES(10262,5,17,12,0.2);
INSERT INTO "OrderDetails" VALUES(10262,7,24,15,0);
INSERT INTO "OrderDetails" VALUES(10262,56,30.4,2,0);
INSERT INTO "OrderDetails" VALUES(10263,16,13.9,60,0.25);
INSERT INTO "OrderDetails" VALUES(10263,24,3.6,28,0);
INSERT INTO "OrderDetails" VALUES(10263,30,20.7,60,0.25);
INSERT INTO "OrderDetails" VALUES(10263,74,8,36,0.25);
INSERT INTO "OrderDetails" VALUES(10264,2,15.2,35,0);
INSERT INTO "OrderDetails" VALUES(10264,41,7.7,25,0.15);
INSERT INTO "OrderDetails" VALUES(10265,17,31.2,30,0);
INSERT INTO "OrderDetails" VALUES(10265,70,12,20,0);
INSERT INTO "OrderDetails" VALUES(10266,12,30.4,12,0.05);
INSERT INTO "OrderDetails" VALUES(10267,40,14.7,50,0);
INSERT INTO "OrderDetails" VALUES(10267,59,44,70,0.15);
INSERT INTO "OrderDetails" VALUES(10267,76,14.4,15,0.15);
INSERT INTO "OrderDetails" VALUES(10268,29,99,10,0);
INSERT INTO "OrderDetails" VALUES(10268,72,27.8,4,0);
INSERT INTO "OrderDetails" VALUES(10269,33,2,60,0.05);
INSERT INTO "OrderDetails" VALUES(10269,72,27.8,20,0.05);
INSERT INTO "OrderDetails" VALUES(10270,36,15.2,30,0);
INSERT INTO "OrderDetails" VALUES(10270,43,36.8,25,0);
INSERT INTO "OrderDetails" VALUES(10271,33,2,24,0);
INSERT INTO "OrderDetails" VALUES(10272,20,64.8,6,0);
INSERT INTO "OrderDetails" VALUES(10272,31,10,40,0);
INSERT INTO "OrderDetails" VALUES(10272,72,27.8,24,0);
INSERT INTO "OrderDetails" VALUES(10273,10,24.8,24,0.05);
INSERT INTO "OrderDetails" VALUES(10273,31,10,15,0.05);
INSERT INTO "OrderDetails" VALUES(10273,33,2,20,0);
INSERT INTO "OrderDetails" VALUES(10273,40,14.7,60,0.05);
INSERT INTO "OrderDetails" VALUES(10273,76,14.4,33,0.05);
INSERT INTO "OrderDetails" VALUES(10274,71,17.2,20,0);
INSERT INTO "OrderDetails" VALUES(10274,72,27.8,7,0);
INSERT INTO "OrderDetails" VALUES(10275,24,3.6,12,0.05);
INSERT INTO "OrderDetails" VALUES(10275,59,44,6,0.05);
INSERT INTO "OrderDetails" VALUES(10276,10,24.8,15,0);
INSERT INTO "OrderDetails" VALUES(10276,13,4.8,10,0);
INSERT INTO "OrderDetails" VALUES(10277,28,36.4,20,0);
INSERT INTO "OrderDetails" VALUES(10277,62,39.4,12,0);
INSERT INTO "OrderDetails" VALUES(10278,44,15.5,16,0);
INSERT INTO "OrderDetails" VALUES(10278,59,44,15,0);
INSERT INTO "OrderDetails" VALUES(10278,63,35.1,8,0);
INSERT INTO "OrderDetails" VALUES(10278,73,12,25,0);
INSERT INTO "OrderDetails" VALUES(10279,17,31.2,15,0.25);
INSERT INTO "OrderDetails" VALUES(10280,24,3.6,12,0);
INSERT INTO "OrderDetails" VALUES(10280,55,19.2,20,0);
INSERT INTO "OrderDetails" VALUES(10280,75,6.2,30,0);
INSERT INTO "OrderDetails" VALUES(10281,19,7.3,1,0);
INSERT INTO "OrderDetails" VALUES(10281,24,3.6,6,0);
INSERT INTO "OrderDetails" VALUES(10281,35,14.4,4,0);
INSERT INTO "OrderDetails" VALUES(10282,30,20.7,6,0);
INSERT INTO "OrderDetails" VALUES(10282,57,15.6,2,0);
INSERT INTO "OrderDetails" VALUES(10283,15,12.4,20,0);
INSERT INTO "OrderDetails" VALUES(10283,19,7.3,18,0);
INSERT INTO "OrderDetails" VALUES(10283,60,27.2,35,0);
INSERT INTO "OrderDetails" VALUES(10283,72,27.8,3,0);
INSERT INTO "OrderDetails" VALUES(10284,27,35.1,15,0.25);
INSERT INTO "OrderDetails" VALUES(10284,44,15.5,21,0);
INSERT INTO "OrderDetails" VALUES(10284,60,27.2,20,0.25);
INSERT INTO "OrderDetails" VALUES(10284,67,11.2,5,0.25);
INSERT INTO "OrderDetails" VALUES(10285,1,14.4,45,0.2);
INSERT INTO "OrderDetails" VALUES(10285,40,14.7,40,0.2);
INSERT INTO "OrderDetails" VALUES(10285,53,26.2,36,0.2);
INSERT INTO "OrderDetails" VALUES(10286,35,14.4,100,0);
INSERT INTO "OrderDetails" VALUES(10286,62,39.4,40,0);
INSERT INTO "OrderDetails" VALUES(10287,16,13.9,40,0.15);
INSERT INTO "OrderDetails" VALUES(10287,34,11.2,20,0);
INSERT INTO "OrderDetails" VALUES(10287,46,9.6,15,0.15);
INSERT INTO "OrderDetails" VALUES(10288,54,5.9,10,0.1);
INSERT INTO "OrderDetails" VALUES(10288,68,10,3,0.1);
INSERT INTO "OrderDetails" VALUES(10289,3,8,30,0);
INSERT INTO "OrderDetails" VALUES(10289,64,26.6,9,0);
INSERT INTO "OrderDetails" VALUES(10290,5,17,20,0);
INSERT INTO "OrderDetails" VALUES(10290,29,99,15,0);
INSERT INTO "OrderDetails" VALUES(10290,49,16,15,0);
INSERT INTO "OrderDetails" VALUES(10290,77,10.4,10,0);
INSERT INTO "OrderDetails" VALUES(10291,13,4.8,20,0.1);
INSERT INTO "OrderDetails" VALUES(10291,44,15.5,24,0.1);
INSERT INTO "OrderDetails" VALUES(10291,51,42.4,2,0.1);
INSERT INTO "OrderDetails" VALUES(10292,20,64.8,20,0);
INSERT INTO "OrderDetails" VALUES(10293,18,50,12,0);
INSERT INTO "OrderDetails" VALUES(10293,24,3.6,10,0);
INSERT INTO "OrderDetails" VALUES(10293,63,35.1,5,0);
INSERT INTO "OrderDetails" VALUES(10293,75,6.2,6,0);
INSERT INTO "OrderDetails" VALUES(10294,1,14.4,18,0);
INSERT INTO "OrderDetails" VALUES(10294,17,31.2,15,0);
INSERT INTO "OrderDetails" VALUES(10294,43,36.8,15,0);
INSERT INTO "OrderDetails" VALUES(10294,60,27.2,21,0);
INSERT INTO "OrderDetails" VALUES(10294,75,6.2,6,0);
INSERT INTO "OrderDetails" VALUES(10295,56,30.4,4,0);
INSERT INTO "OrderDetails" VALUES(10296,11,16.8,12,0);
INSERT INTO "OrderDetails" VALUES(10296,16,13.9,30,0);
INSERT INTO "OrderDetails" VALUES(10296,69,28.8,15,0);
INSERT INTO "OrderDetails" VALUES(10297,39,14.4,60,0);
INSERT INTO "OrderDetails" VALUES(10297,72,27.8,20,0);
INSERT INTO "OrderDetails" VALUES(10298,2,15.2,40,0);
INSERT INTO "OrderDetails" VALUES(10298,36,15.2,40,0.25);
INSERT INTO "OrderDetails" VALUES(10298,59,44,30,0.25);
INSERT INTO "OrderDetails" VALUES(10298,62,39.4,15,0);
INSERT INTO "OrderDetails" VALUES(10299,19,7.3,15,0);
INSERT INTO "OrderDetails" VALUES(10299,70,12,20,0);
INSERT INTO "OrderDetails" VALUES(10300,66,13.6,30,0);
INSERT INTO "OrderDetails" VALUES(10300,68,10,20,0);
INSERT INTO "OrderDetails" VALUES(10301,40,14.7,10,0);
INSERT INTO "OrderDetails" VALUES(10301,56,30.4,20,0);
INSERT INTO "OrderDetails" VALUES(10302,17,31.2,40,0);
INSERT INTO "OrderDetails" VALUES(10302,28,36.4,28,0);
INSERT INTO "OrderDetails" VALUES(10302,43,36.8,12,0);
INSERT INTO "OrderDetails" VALUES(10303,40,14.7,40,0.1);
INSERT INTO "OrderDetails" VALUES(10303,65,16.8,30,0.1);
INSERT INTO "OrderDetails" VALUES(10303,68,10,15,0.1);
INSERT INTO "OrderDetails" VALUES(10304,49,16,30,0);
INSERT INTO "OrderDetails" VALUES(10304,59,44,10,0);
INSERT INTO "OrderDetails" VALUES(10304,71,17.2,2,0);
INSERT INTO "OrderDetails" VALUES(10305,18,50,25,0.1);
INSERT INTO "OrderDetails" VALUES(10305,29,99,25,0.1);
INSERT INTO "OrderDetails" VALUES(10305,39,14.4,30,0.1);
INSERT INTO "OrderDetails" VALUES(10306,30,20.7,10,0);
INSERT INTO "OrderDetails" VALUES(10306,53,26.2,10,0);
INSERT INTO "OrderDetails" VALUES(10306,54,5.9,5,0);
INSERT INTO "OrderDetails" VALUES(10307,62,39.4,10,0);
INSERT INTO "OrderDetails" VALUES(10307,68,10,3,0);
INSERT INTO "OrderDetails" VALUES(10308,69,28.8,1,0);
INSERT INTO "OrderDetails" VALUES(10308,70,12,5,0);
INSERT INTO "OrderDetails" VALUES(10309,4,17.6,20,0);
INSERT INTO "OrderDetails" VALUES(10309,6,20,30,0);
INSERT INTO "OrderDetails" VALUES(10309,42,11.2,2,0);
INSERT INTO "OrderDetails" VALUES(10309,43,36.8,20,0);
INSERT INTO "OrderDetails" VALUES(10309,71,17.2,3,0);
INSERT INTO "OrderDetails" VALUES(10310,16,13.9,10,0);
INSERT INTO "OrderDetails" VALUES(10310,62,39.4,5,0);
INSERT INTO "OrderDetails" VALUES(10311,42,11.2,6,0);
INSERT INTO "OrderDetails" VALUES(10311,69,28.8,7,0);
INSERT INTO "OrderDetails" VALUES(10312,28,36.4,4,0);
INSERT INTO "OrderDetails" VALUES(10312,43,36.8,24,0);
INSERT INTO "OrderDetails" VALUES(10312,53,26.2,20,0);
INSERT INTO "OrderDetails" VALUES(10312,75,6.2,10,0);
INSERT INTO "OrderDetails" VALUES(10313,36,15.2,12,0);
INSERT INTO "OrderDetails" VALUES(10314,32,25.6,40,0.1);
INSERT INTO "OrderDetails" VALUES(10314,58,10.6,30,0.1);
INSERT INTO "OrderDetails" VALUES(10314,62,39.4,25,0.1);
INSERT INTO "OrderDetails" VALUES(10315,34,11.2,14,0);
INSERT INTO "OrderDetails" VALUES(10315,70,12,30,0);
INSERT INTO "OrderDetails" VALUES(10316,41,7.7,10,0);
INSERT INTO "OrderDetails" VALUES(10316,62,39.4,70,0);
INSERT INTO "OrderDetails" VALUES(10317,1,14.4,20,0);
INSERT INTO "OrderDetails" VALUES(10318,41,7.7,20,0);
INSERT INTO "OrderDetails" VALUES(10318,76,14.4,6,0);
INSERT INTO "OrderDetails" VALUES(10319,17,31.2,8,0);
INSERT INTO "OrderDetails" VALUES(10319,28,36.4,14,0);
INSERT INTO "OrderDetails" VALUES(10319,76,14.4,30,0);
INSERT INTO "OrderDetails" VALUES(10320,71,17.2,30,0);
INSERT INTO "OrderDetails" VALUES(10321,35,14.4,10,0);
INSERT INTO "OrderDetails" VALUES(10322,52,5.6,20,0);
INSERT INTO "OrderDetails" VALUES(10323,15,12.4,5,0);
INSERT INTO "OrderDetails" VALUES(10323,25,11.2,4,0);
INSERT INTO "OrderDetails" VALUES(10323,39,14.4,4,0);
INSERT INTO "OrderDetails" VALUES(10324,16,13.9,21,0.15);
INSERT INTO "OrderDetails" VALUES(10324,35,14.4,70,0.15);
INSERT INTO "OrderDetails" VALUES(10324,46,9.6,30,0);
INSERT INTO "OrderDetails" VALUES(10324,59,44,40,0.15);
INSERT INTO "OrderDetails" VALUES(10324,63,35.1,80,0.15);
INSERT INTO "OrderDetails" VALUES(10325,6,20,6,0);
INSERT INTO "OrderDetails" VALUES(10325,13,4.8,12,0);
INSERT INTO "OrderDetails" VALUES(10325,14,18.6,9,0);
INSERT INTO "OrderDetails" VALUES(10325,31,10,4,0);
INSERT INTO "OrderDetails" VALUES(10325,72,27.8,40,0);
INSERT INTO "OrderDetails" VALUES(10326,4,17.6,24,0);
INSERT INTO "OrderDetails" VALUES(10326,57,15.6,16,0);
INSERT INTO "OrderDetails" VALUES(10326,75,6.2,50,0);
INSERT INTO "OrderDetails" VALUES(10327,2,15.2,25,0.2);
INSERT INTO "OrderDetails" VALUES(10327,11,16.8,50,0.2);
INSERT INTO "OrderDetails" VALUES(10327,30,20.7,35,0.2);
INSERT INTO "OrderDetails" VALUES(10327,58,10.6,30,0.2);
INSERT INTO "OrderDetails" VALUES(10328,59,44,9,0);
INSERT INTO "OrderDetails" VALUES(10328,65,16.8,40,0);
INSERT INTO "OrderDetails" VALUES(10328,68,10,10,0);
INSERT INTO "OrderDetails" VALUES(10329,19,7.3,10,0.05);
INSERT INTO "OrderDetails" VALUES(10329,30,20.7,8,0.05);
INSERT INTO "OrderDetails" VALUES(10329,38,210.8,20,0.05);
INSERT INTO "OrderDetails" VALUES(10329,56,30.4,12,0.05);
INSERT INTO "OrderDetails" VALUES(10330,26,24.9,50,0.15);
INSERT INTO "OrderDetails" VALUES(10330,72,27.8,25,0.15);
INSERT INTO "OrderDetails" VALUES(10331,54,5.9,15,0);
INSERT INTO "OrderDetails" VALUES(10332,18,50,40,0.2);
INSERT INTO "OrderDetails" VALUES(10332,42,11.2,10,0.2);
INSERT INTO "OrderDetails" VALUES(10332,47,7.6,16,0.2);
INSERT INTO "OrderDetails" VALUES(10333,14,18.6,10,0);
INSERT INTO "OrderDetails" VALUES(10333,21,8,10,0.1);
INSERT INTO "OrderDetails" VALUES(10333,71,17.2,40,0.1);
INSERT INTO "OrderDetails" VALUES(10334,52,5.6,8,0);
INSERT INTO "OrderDetails" VALUES(10334,68,10,10,0);
INSERT INTO "OrderDetails" VALUES(10335,2,15.2,7,0.2);
INSERT INTO "OrderDetails" VALUES(10335,31,10,25,0.2);
INSERT INTO "OrderDetails" VALUES(10335,32,25.6,6,0.2);
INSERT INTO "OrderDetails" VALUES(10335,51,42.4,48,0.2);
INSERT INTO "OrderDetails" VALUES(10336,4,17.6,18,0.1);
INSERT INTO "OrderDetails" VALUES(10337,23,7.2,40,0);
INSERT INTO "OrderDetails" VALUES(10337,26,24.9,24,0);
INSERT INTO "OrderDetails" VALUES(10337,36,15.2,20,0);
INSERT INTO "OrderDetails" VALUES(10337,37,20.8,28,0);
INSERT INTO "OrderDetails" VALUES(10337,72,27.8,25,0);
INSERT INTO "OrderDetails" VALUES(10338,17,31.2,20,0);
INSERT INTO "OrderDetails" VALUES(10338,30,20.7,15,0);
INSERT INTO "OrderDetails" VALUES(10339,4,17.6,10,0);
INSERT INTO "OrderDetails" VALUES(10339,17,31.2,70,0.05);
INSERT INTO "OrderDetails" VALUES(10339,62,39.4,28,0);
INSERT INTO "OrderDetails" VALUES(10340,18,50,20,0.05);
INSERT INTO "OrderDetails" VALUES(10340,41,7.7,12,0.05);
INSERT INTO "OrderDetails" VALUES(10340,43,36.8,40,0.05);
INSERT INTO "OrderDetails" VALUES(10341,33,2,8,0);
INSERT INTO "OrderDetails" VALUES(10341,59,44,9,0.15);
INSERT INTO "OrderDetails" VALUES(10342,2,15.2,24,0.2);
INSERT INTO "OrderDetails" VALUES(10342,31,10,56,0.2);
INSERT INTO "OrderDetails" VALUES(10342,36,15.2,40,0.2);
INSERT INTO "OrderDetails" VALUES(10342,55,19.2,40,0.2);
INSERT INTO "OrderDetails" VALUES(10343,64,26.6,50,0);
INSERT INTO "OrderDetails" VALUES(10343,68,10,4,0.05);
INSERT INTO "OrderDetails" VALUES(10343,76,14.4,15,0);
INSERT INTO "OrderDetails" VALUES(10344,4,17.6,35,0);
INSERT INTO "OrderDetails" VALUES(10344,8,32,70,0.25);
INSERT INTO "OrderDetails" VALUES(10345,8,32,70,0);
INSERT INTO "OrderDetails" VALUES(10345,19,7.3,80,0);
INSERT INTO "OrderDetails" VALUES(10345,42,11.2,9,0);
INSERT INTO "OrderDetails" VALUES(10346,17,31.2,36,0.1);
INSERT INTO "OrderDetails" VALUES(10346,56,30.4,20,0);
INSERT INTO "OrderDetails" VALUES(10347,25,11.2,10,0);
INSERT INTO "OrderDetails" VALUES(10347,39,14.4,50,0.15);
INSERT INTO "OrderDetails" VALUES(10347,40,14.7,4,0);
INSERT INTO "OrderDetails" VALUES(10347,75,6.2,6,0.15);
INSERT INTO "OrderDetails" VALUES(10348,1,14.4,15,0.15);
INSERT INTO "OrderDetails" VALUES(10348,23,7.2,25,0);
INSERT INTO "OrderDetails" VALUES(10349,54,5.9,24,0);
INSERT INTO "OrderDetails" VALUES(10350,50,13,15,0.1);
INSERT INTO "OrderDetails" VALUES(10350,69,28.8,18,0.1);
INSERT INTO "OrderDetails" VALUES(10351,38,210.8,20,0.05);
INSERT INTO "OrderDetails" VALUES(10351,41,7.7,13,0);
INSERT INTO "OrderDetails" VALUES(10351,44,15.5,77,0.05);
INSERT INTO "OrderDetails" VALUES(10351,65,16.8,10,0.05);
INSERT INTO "OrderDetails" VALUES(10352,24,3.6,10,0);
INSERT INTO "OrderDetails" VALUES(10352,54,5.9,20,0.15);
INSERT INTO "OrderDetails" VALUES(10353,11,16.8,12,0.2);
INSERT INTO "OrderDetails" VALUES(10353,38,210.8,50,0.2);
INSERT INTO "OrderDetails" VALUES(10354,1,14.4,12,0);
INSERT INTO "OrderDetails" VALUES(10354,29,99,4,0);
INSERT INTO "OrderDetails" VALUES(10355,24,3.6,25,0);
INSERT INTO "OrderDetails" VALUES(10355,57,15.6,25,0);
INSERT INTO "OrderDetails" VALUES(10356,31,10,30,0);
INSERT INTO "OrderDetails" VALUES(10356,55,19.2,12,0);
INSERT INTO "OrderDetails" VALUES(10356,69,28.8,20,0);
INSERT INTO "OrderDetails" VALUES(10357,10,24.8,30,0.2);
INSERT INTO "OrderDetails" VALUES(10357,26,24.9,16,0);
INSERT INTO "OrderDetails" VALUES(10357,60,27.2,8,0.2);
INSERT INTO "OrderDetails" VALUES(10358,24,3.6,10,0.05);
INSERT INTO "OrderDetails" VALUES(10358,34,11.2,10,0.05);
INSERT INTO "OrderDetails" VALUES(10358,36,15.2,20,0.05);
INSERT INTO "OrderDetails" VALUES(10359,16,13.9,56,0.05);
INSERT INTO "OrderDetails" VALUES(10359,31,10,70,0.05);
INSERT INTO "OrderDetails" VALUES(10359,60,27.2,80,0.05);
INSERT INTO "OrderDetails" VALUES(10360,28,36.4,30,0);
INSERT INTO "OrderDetails" VALUES(10360,29,99,35,0);
INSERT INTO "OrderDetails" VALUES(10360,38,210.8,10,0);
INSERT INTO "OrderDetails" VALUES(10360,49,16,35,0);
INSERT INTO "OrderDetails" VALUES(10360,54,5.9,28,0);
INSERT INTO "OrderDetails" VALUES(10361,39,14.4,54,0.1);
INSERT INTO "OrderDetails" VALUES(10361,60,27.2,55,0.1);
INSERT INTO "OrderDetails" VALUES(10362,25,11.2,50,0);
INSERT INTO "OrderDetails" VALUES(10362,51,42.4,20,0);
INSERT INTO "OrderDetails" VALUES(10362,54,5.9,24,0);
INSERT INTO "OrderDetails" VALUES(10363,31,10,20,0);
INSERT INTO "OrderDetails" VALUES(10363,75,6.2,12,0);
INSERT INTO "OrderDetails" VALUES(10363,76,14.4,12,0);
INSERT INTO "OrderDetails" VALUES(10364,69,28.8,30,0);
INSERT INTO "OrderDetails" VALUES(10364,71,17.2,5,0);
INSERT INTO "OrderDetails" VALUES(10365,11,16.8,24,0);
INSERT INTO "OrderDetails" VALUES(10366,65,16.8,5,0);
INSERT INTO "OrderDetails" VALUES(10366,77,10.4,5,0);
INSERT INTO "OrderDetails" VALUES(10367,34,11.2,36,0);
INSERT INTO "OrderDetails" VALUES(10367,54,5.9,18,0);
INSERT INTO "OrderDetails" VALUES(10367,65,16.8,15,0);
INSERT INTO "OrderDetails" VALUES(10367,77,10.4,7,0);
INSERT INTO "OrderDetails" VALUES(10368,21,8,5,0.1);
INSERT INTO "OrderDetails" VALUES(10368,28,36.4,13,0.1);
INSERT INTO "OrderDetails" VALUES(10368,57,15.6,25,0);
INSERT INTO "OrderDetails" VALUES(10368,64,26.6,35,0.1);
INSERT INTO "OrderDetails" VALUES(10369,29,99,20,0);
INSERT INTO "OrderDetails" VALUES(10369,56,30.4,18,0.25);
INSERT INTO "OrderDetails" VALUES(10370,1,14.4,15,0.15);
INSERT INTO "OrderDetails" VALUES(10370,64,26.6,30,0);
INSERT INTO "OrderDetails" VALUES(10370,74,8,20,0.15);
INSERT INTO "OrderDetails" VALUES(10371,36,15.2,6,0.2);
INSERT INTO "OrderDetails" VALUES(10372,20,64.8,12,0.25);
INSERT INTO "OrderDetails" VALUES(10372,38,210.8,40,0.25);
INSERT INTO "OrderDetails" VALUES(10372,60,27.2,70,0.25);
INSERT INTO "OrderDetails" VALUES(10372,72,27.8,42,0.25);
INSERT INTO "OrderDetails" VALUES(10373,58,10.6,80,0.2);
INSERT INTO "OrderDetails" VALUES(10373,71,17.2,50,0.2);
INSERT INTO "OrderDetails" VALUES(10374,31,10,30,0);
INSERT INTO "OrderDetails" VALUES(10374,58,10.6,15,0);
INSERT INTO "OrderDetails" VALUES(10375,14,18.6,15,0);
INSERT INTO "OrderDetails" VALUES(10375,54,5.9,10,0);
INSERT INTO "OrderDetails" VALUES(10376,31,10,42,0.05);
INSERT INTO "OrderDetails" VALUES(10377,28,36.4,20,0.15);
INSERT INTO "OrderDetails" VALUES(10377,39,14.4,20,0.15);
INSERT INTO "OrderDetails" VALUES(10378,71,17.2,6,0);
INSERT INTO "OrderDetails" VALUES(10379,41,7.7,8,0.1);
INSERT INTO "OrderDetails" VALUES(10379,63,35.1,16,0.1);
INSERT INTO "OrderDetails" VALUES(10379,65,16.8,20,0.1);
INSERT INTO "OrderDetails" VALUES(10380,30,20.7,18,0.1);
INSERT INTO "OrderDetails" VALUES(10380,53,26.2,20,0.1);
INSERT INTO "OrderDetails" VALUES(10380,60,27.2,6,0.1);
INSERT INTO "OrderDetails" VALUES(10380,70,12,30,0);
INSERT INTO "OrderDetails" VALUES(10381,74,8,14,0);
INSERT INTO "OrderDetails" VALUES(10382,5,17,32,0);
INSERT INTO "OrderDetails" VALUES(10382,18,50,9,0);
INSERT INTO "OrderDetails" VALUES(10382,29,99,14,0);
INSERT INTO "OrderDetails" VALUES(10382,33,2,60,0);
INSERT INTO "OrderDetails" VALUES(10382,74,8,50,0);
INSERT INTO "OrderDetails" VALUES(10383,13,4.8,20,0);
INSERT INTO "OrderDetails" VALUES(10383,50,13,15,0);
INSERT INTO "OrderDetails" VALUES(10383,56,30.4,20,0);
INSERT INTO "OrderDetails" VALUES(10384,20,64.8,28,0);
INSERT INTO "OrderDetails" VALUES(10384,60,27.2,15,0);
INSERT INTO "OrderDetails" VALUES(10385,7,24,10,0.2);
INSERT INTO "OrderDetails" VALUES(10385,60,27.2,20,0.2);
INSERT INTO "OrderDetails" VALUES(10385,68,10,8,0.2);
INSERT INTO "OrderDetails" VALUES(10386,24,3.6,15,0);
INSERT INTO "OrderDetails" VALUES(10386,34,11.2,10,0);
INSERT INTO "OrderDetails" VALUES(10387,24,3.6,15,0);
INSERT INTO "OrderDetails" VALUES(10387,28,36.4,6,0);
INSERT INTO "OrderDetails" VALUES(10387,59,44,12,0);
INSERT INTO "OrderDetails" VALUES(10387,71,17.2,15,0);
INSERT INTO "OrderDetails" VALUES(10388,45,7.6,15,0.2);
INSERT INTO "OrderDetails" VALUES(10388,52,5.6,20,0.2);
INSERT INTO "OrderDetails" VALUES(10388,53,26.2,40,0);
INSERT INTO "OrderDetails" VALUES(10389,10,24.8,16,0);
INSERT INTO "OrderDetails" VALUES(10389,55,19.2,15,0);
INSERT INTO "OrderDetails" VALUES(10389,62,39.4,20,0);
INSERT INTO "OrderDetails" VALUES(10389,70,12,30,0);
INSERT INTO "OrderDetails" VALUES(10390,31,10,60,0.1);
INSERT INTO "OrderDetails" VALUES(10390,35,14.4,40,0.1);
INSERT INTO "OrderDetails" VALUES(10390,46,9.6,45,0);
INSERT INTO "OrderDetails" VALUES(10390,72,27.8,24,0.1);
INSERT INTO "OrderDetails" VALUES(10391,13,4.8,18,0);
INSERT INTO "OrderDetails" VALUES(10392,69,28.8,50,0);
INSERT INTO "OrderDetails" VALUES(10393,2,15.2,25,0.25);
INSERT INTO "OrderDetails" VALUES(10393,14,18.6,42,0.25);
INSERT INTO "OrderDetails" VALUES(10393,25,11.2,7,0.25);
INSERT INTO "OrderDetails" VALUES(10393,26,24.9,70,0.25);
INSERT INTO "OrderDetails" VALUES(10393,31,10,32,0);
INSERT INTO "OrderDetails" VALUES(10394,13,4.8,10,0);
INSERT INTO "OrderDetails" VALUES(10394,62,39.4,10,0);
INSERT INTO "OrderDetails" VALUES(10395,46,9.6,28,0.1);
INSERT INTO "OrderDetails" VALUES(10395,53,26.2,70,0.1);
INSERT INTO "OrderDetails" VALUES(10395,69,28.8,8,0);
INSERT INTO "OrderDetails" VALUES(10396,23,7.2,40,0);
INSERT INTO "OrderDetails" VALUES(10396,71,17.2,60,0);
INSERT INTO "OrderDetails" VALUES(10396,72,27.8,21,0);
INSERT INTO "OrderDetails" VALUES(10397,21,8,10,0.15);
INSERT INTO "OrderDetails" VALUES(10397,51,42.4,18,0.15);
INSERT INTO "OrderDetails" VALUES(10398,35,14.4,30,0);
INSERT INTO "OrderDetails" VALUES(10398,55,19.2,120,0.1);
INSERT INTO "OrderDetails" VALUES(10399,68,10,60,0);
INSERT INTO "OrderDetails" VALUES(10399,71,17.2,30,0);
INSERT INTO "OrderDetails" VALUES(10399,76,14.4,35,0);
INSERT INTO "OrderDetails" VALUES(10399,77,10.4,14,0);
INSERT INTO "OrderDetails" VALUES(10400,29,99,21,0);
INSERT INTO "OrderDetails" VALUES(10400,35,14.4,35,0);
INSERT INTO "OrderDetails" VALUES(10400,49,16,30,0);
INSERT INTO "OrderDetails" VALUES(10401,30,20.7,18,0);
INSERT INTO "OrderDetails" VALUES(10401,56,30.4,70,0);
INSERT INTO "OrderDetails" VALUES(10401,65,16.8,20,0);
INSERT INTO "OrderDetails" VALUES(10401,71,17.2,60,0);
INSERT INTO "OrderDetails" VALUES(10402,23,7.2,60,0);
INSERT INTO "OrderDetails" VALUES(10402,63,35.1,65,0);
INSERT INTO "OrderDetails" VALUES(10403,16,13.9,21,0.15);
INSERT INTO "OrderDetails" VALUES(10403,48,10.2,70,0.15);
INSERT INTO "OrderDetails" VALUES(10404,26,24.9,30,0.05);
INSERT INTO "OrderDetails" VALUES(10404,42,11.2,40,0.05);
INSERT INTO "OrderDetails" VALUES(10404,49,16,30,0.05);
INSERT INTO "OrderDetails" VALUES(10405,3,8,50,0);
INSERT INTO "OrderDetails" VALUES(10406,1,14.4,10,0);
INSERT INTO "OrderDetails" VALUES(10406,21,8,30,0.1);
INSERT INTO "OrderDetails" VALUES(10406,28,36.4,42,0.1);
INSERT INTO "OrderDetails" VALUES(10406,36,15.2,5,0.1);
INSERT INTO "OrderDetails" VALUES(10406,40,14.7,2,0.1);
INSERT INTO "OrderDetails" VALUES(10407,11,16.8,30,0);
INSERT INTO "OrderDetails" VALUES(10407,69,28.8,15,0);
INSERT INTO "OrderDetails" VALUES(10407,71,17.2,15,0);
INSERT INTO "OrderDetails" VALUES(10408,37,20.8,10,0);
INSERT INTO "OrderDetails" VALUES(10408,54,5.9,6,0);
INSERT INTO "OrderDetails" VALUES(10408,62,39.4,35,0);
INSERT INTO "OrderDetails" VALUES(10409,14,18.6,12,0);
INSERT INTO "OrderDetails" VALUES(10409,21,8,12,0);
INSERT INTO "OrderDetails" VALUES(10410,33,2,49,0);
INSERT INTO "OrderDetails" VALUES(10410,59,44,16,0);
INSERT INTO "OrderDetails" VALUES(10411,41,7.7,25,0.2);
INSERT INTO "OrderDetails" VALUES(10411,44,15.5,40,0.2);
INSERT INTO "OrderDetails" VALUES(10411,59,44,9,0.2);
INSERT INTO "OrderDetails" VALUES(10412,14,18.6,20,0.1);
INSERT INTO "OrderDetails" VALUES(10413,1,14.4,24,0);
INSERT INTO "OrderDetails" VALUES(10413,62,39.4,40,0);
INSERT INTO "OrderDetails" VALUES(10413,76,14.4,14,0);
INSERT INTO "OrderDetails" VALUES(10414,19,7.3,18,0.05);
INSERT INTO "OrderDetails" VALUES(10414,33,2,50,0);
INSERT INTO "OrderDetails" VALUES(10415,17,31.2,2,0);
INSERT INTO "OrderDetails" VALUES(10415,33,2,20,0);
INSERT INTO "OrderDetails" VALUES(10416,19,7.3,20,0);
INSERT INTO "OrderDetails" VALUES(10416,53,26.2,10,0);
INSERT INTO "OrderDetails" VALUES(10416,57,15.6,20,0);
INSERT INTO "OrderDetails" VALUES(10417,38,210.8,50,0);
INSERT INTO "OrderDetails" VALUES(10417,46,9.6,2,0.25);
INSERT INTO "OrderDetails" VALUES(10417,68,10,36,0.25);
INSERT INTO "OrderDetails" VALUES(10417,77,10.4,35,0);
INSERT INTO "OrderDetails" VALUES(10418,2,15.2,60,0);
INSERT INTO "OrderDetails" VALUES(10418,47,7.6,55,0);
INSERT INTO "OrderDetails" VALUES(10418,61,22.8,16,0);
INSERT INTO "OrderDetails" VALUES(10418,74,8,15,0);
INSERT INTO "OrderDetails" VALUES(10419,60,27.2,60,0.05);
INSERT INTO "OrderDetails" VALUES(10419,69,28.8,20,0.05);
INSERT INTO "OrderDetails" VALUES(10420,9,77.6,20,0.1);
INSERT INTO "OrderDetails" VALUES(10420,13,4.8,2,0.1);
INSERT INTO "OrderDetails" VALUES(10420,70,12,8,0.1);
INSERT INTO "OrderDetails" VALUES(10420,73,12,20,0.1);
INSERT INTO "OrderDetails" VALUES(10421,19,7.3,4,0.15);
INSERT INTO "OrderDetails" VALUES(10421,26,24.9,30,0);
INSERT INTO "OrderDetails" VALUES(10421,53,26.2,15,0.15);
INSERT INTO "OrderDetails" VALUES(10421,77,10.4,10,0.15);
INSERT INTO "OrderDetails" VALUES(10422,26,24.9,2,0);
INSERT INTO "OrderDetails" VALUES(10423,31,10,14,0);
INSERT INTO "OrderDetails" VALUES(10423,59,44,20,0);
INSERT INTO "OrderDetails" VALUES(10424,35,14.4,60,0.2);
INSERT INTO "OrderDetails" VALUES(10424,38,210.8,49,0.2);
INSERT INTO "OrderDetails" VALUES(10424,68,10,30,0.2);
INSERT INTO "OrderDetails" VALUES(10425,55,19.2,10,0.25);
INSERT INTO "OrderDetails" VALUES(10425,76,14.4,20,0.25);
INSERT INTO "OrderDetails" VALUES(10426,56,30.4,5,0);
INSERT INTO "OrderDetails" VALUES(10426,64,26.6,7,0);
INSERT INTO "OrderDetails" VALUES(10427,14,18.6,35,0);
INSERT INTO "OrderDetails" VALUES(10428,46,9.6,20,0);
INSERT INTO "OrderDetails" VALUES(10429,50,13,40,0);
INSERT INTO "OrderDetails" VALUES(10429,63,35.1,35,0.25);
INSERT INTO "OrderDetails" VALUES(10430,17,31.2,45,0.2);
INSERT INTO "OrderDetails" VALUES(10430,21,8,50,0);
INSERT INTO "OrderDetails" VALUES(10430,56,30.4,30,0);
INSERT INTO "OrderDetails" VALUES(10430,59,44,70,0.2);
INSERT INTO "OrderDetails" VALUES(10431,17,31.2,50,0.25);
INSERT INTO "OrderDetails" VALUES(10431,40,14.7,50,0.25);
INSERT INTO "OrderDetails" VALUES(10431,47,7.6,30,0.25);
INSERT INTO "OrderDetails" VALUES(10432,26,24.9,10,0);
INSERT INTO "OrderDetails" VALUES(10432,54,5.9,40,0);
INSERT INTO "OrderDetails" VALUES(10433,56,30.4,28,0);
INSERT INTO "OrderDetails" VALUES(10434,11,16.8,6,0);
INSERT INTO "OrderDetails" VALUES(10434,76,14.4,18,0.15);
INSERT INTO "OrderDetails" VALUES(10435,2,15.2,10,0);
INSERT INTO "OrderDetails" VALUES(10435,22,16.8,12,0);
INSERT INTO "OrderDetails" VALUES(10435,72,27.8,10,0);
INSERT INTO "OrderDetails" VALUES(10436,46,9.6,5,0);
INSERT INTO "OrderDetails" VALUES(10436,56,30.4,40,0.1);
INSERT INTO "OrderDetails" VALUES(10436,64,26.6,30,0.1);
INSERT INTO "OrderDetails" VALUES(10436,75,6.2,24,0.1);
INSERT INTO "OrderDetails" VALUES(10437,53,26.2,15,0);
INSERT INTO "OrderDetails" VALUES(10438,19,7.3,15,0.2);
INSERT INTO "OrderDetails" VALUES(10438,34,11.2,20,0.2);
INSERT INTO "OrderDetails" VALUES(10438,57,15.6,15,0.2);
INSERT INTO "OrderDetails" VALUES(10439,12,30.4,15,0);
INSERT INTO "OrderDetails" VALUES(10439,16,13.9,16,0);
INSERT INTO "OrderDetails" VALUES(10439,64,26.6,6,0);
INSERT INTO "OrderDetails" VALUES(10439,74,8,30,0);
INSERT INTO "OrderDetails" VALUES(10440,2,15.2,45,0.15);
INSERT INTO "OrderDetails" VALUES(10440,16,13.9,49,0.15);
INSERT INTO "OrderDetails" VALUES(10440,29,99,24,0.15);
INSERT INTO "OrderDetails" VALUES(10440,61,22.8,90,0.15);
INSERT INTO "OrderDetails" VALUES(10441,27,35.1,50,0);
INSERT INTO "OrderDetails" VALUES(10442,11,16.8,30,0);
INSERT INTO "OrderDetails" VALUES(10442,54,5.9,80,0);
INSERT INTO "OrderDetails" VALUES(10442,66,13.6,60,0);
INSERT INTO "OrderDetails" VALUES(10443,11,16.8,6,0.2);
INSERT INTO "OrderDetails" VALUES(10443,28,36.4,12,0);
INSERT INTO "OrderDetails" VALUES(10444,17,31.2,10,0);
INSERT INTO "OrderDetails" VALUES(10444,26,24.9,15,0);
INSERT INTO "OrderDetails" VALUES(10444,35,14.4,8,0);
INSERT INTO "OrderDetails" VALUES(10444,41,7.7,30,0);
INSERT INTO "OrderDetails" VALUES(10445,39,14.4,6,0);
INSERT INTO "OrderDetails" VALUES(10445,54,5.9,15,0);
INSERT INTO "OrderDetails" VALUES(10446,19,7.3,12,0.1);
INSERT INTO "OrderDetails" VALUES(10446,24,3.6,20,0.1);
INSERT INTO "OrderDetails" VALUES(10446,31,10,3,0.1);
INSERT INTO "OrderDetails" VALUES(10446,52,5.6,15,0.1);
INSERT INTO "OrderDetails" VALUES(10447,19,7.3,40,0);
INSERT INTO "OrderDetails" VALUES(10447,65,16.8,35,0);
INSERT INTO "OrderDetails" VALUES(10447,71,17.2,2,0);
INSERT INTO "OrderDetails" VALUES(10448,26,24.9,6,0);
INSERT INTO "OrderDetails" VALUES(10448,40,14.7,20,0);
INSERT INTO "OrderDetails" VALUES(10449,10,24.8,14,0);
INSERT INTO "OrderDetails" VALUES(10449,52,5.6,20,0);
INSERT INTO "OrderDetails" VALUES(10449,62,39.4,35,0);
INSERT INTO "OrderDetails" VALUES(10450,10,24.8,20,0.2);
INSERT INTO "OrderDetails" VALUES(10450,54,5.9,6,0.2);
INSERT INTO "OrderDetails" VALUES(10451,55,19.2,120,0.1);
INSERT INTO "OrderDetails" VALUES(10451,64,26.6,35,0.1);
INSERT INTO "OrderDetails" VALUES(10451,65,16.8,28,0.1);
INSERT INTO "OrderDetails" VALUES(10451,77,10.4,55,0.1);
INSERT INTO "OrderDetails" VALUES(10452,28,36.4,15,0);
INSERT INTO "OrderDetails" VALUES(10452,44,15.5,100,0.05);
INSERT INTO "OrderDetails" VALUES(10453,48,10.2,15,0.1);
INSERT INTO "OrderDetails" VALUES(10453,70,12,25,0.1);
INSERT INTO "OrderDetails" VALUES(10454,16,13.9,20,0.2);
INSERT INTO "OrderDetails" VALUES(10454,33,2,20,0.2);
INSERT INTO "OrderDetails" VALUES(10454,46,9.6,10,0.2);
INSERT INTO "OrderDetails" VALUES(10455,39,14.4,20,0);
INSERT INTO "OrderDetails" VALUES(10455,53,26.2,50,0);
INSERT INTO "OrderDetails" VALUES(10455,61,22.8,25,0);
INSERT INTO "OrderDetails" VALUES(10455,71,17.2,30,0);
INSERT INTO "OrderDetails" VALUES(10456,21,8,40,0.15);
INSERT INTO "OrderDetails" VALUES(10456,49,16,21,0.15);
INSERT INTO "OrderDetails" VALUES(10457,59,44,36,0);
INSERT INTO "OrderDetails" VALUES(10458,26,24.9,30,0);
INSERT INTO "OrderDetails" VALUES(10458,28,36.4,30,0);
INSERT INTO "OrderDetails" VALUES(10458,43,36.8,20,0);
INSERT INTO "OrderDetails" VALUES(10458,56,30.4,15,0);
INSERT INTO "OrderDetails" VALUES(10458,71,17.2,50,0);
INSERT INTO "OrderDetails" VALUES(10459,7,24,16,0.05);
INSERT INTO "OrderDetails" VALUES(10459,46,9.6,20,0.05);
INSERT INTO "OrderDetails" VALUES(10459,72,27.8,40,0);
INSERT INTO "OrderDetails" VALUES(10460,68,10,21,0.25);
INSERT INTO "OrderDetails" VALUES(10460,75,6.2,4,0.25);
INSERT INTO "OrderDetails" VALUES(10461,21,8,40,0.25);
INSERT INTO "OrderDetails" VALUES(10461,30,20.7,28,0.25);
INSERT INTO "OrderDetails" VALUES(10461,55,19.2,60,0.25);
INSERT INTO "OrderDetails" VALUES(10462,13,4.8,1,0);
INSERT INTO "OrderDetails" VALUES(10462,23,7.2,21,0);
INSERT INTO "OrderDetails" VALUES(10463,19,7.3,21,0);
INSERT INTO "OrderDetails" VALUES(10463,42,11.2,50,0);
INSERT INTO "OrderDetails" VALUES(10464,4,17.6,16,0.2);
INSERT INTO "OrderDetails" VALUES(10464,43,36.8,3,0);
INSERT INTO "OrderDetails" VALUES(10464,56,30.4,30,0.2);
INSERT INTO "OrderDetails" VALUES(10464,60,27.2,20,0);
INSERT INTO "OrderDetails" VALUES(10465,24,3.6,25,0);
INSERT INTO "OrderDetails" VALUES(10465,29,99,18,0.1);
INSERT INTO "OrderDetails" VALUES(10465,40,14.7,20,0);
INSERT INTO "OrderDetails" VALUES(10465,45,7.6,30,0.1);
INSERT INTO "OrderDetails" VALUES(10465,50,13,25,0);
INSERT INTO "OrderDetails" VALUES(10466,11,16.8,10,0);
INSERT INTO "OrderDetails" VALUES(10466,46,9.6,5,0);
INSERT INTO "OrderDetails" VALUES(10467,24,3.6,28,0);
INSERT INTO "OrderDetails" VALUES(10467,25,11.2,12,0);
INSERT INTO "OrderDetails" VALUES(10468,30,20.7,8,0);
INSERT INTO "OrderDetails" VALUES(10468,43,36.8,15,0);
INSERT INTO "OrderDetails" VALUES(10469,2,15.2,40,0.15);
INSERT INTO "OrderDetails" VALUES(10469,16,13.9,35,0.15);
INSERT INTO "OrderDetails" VALUES(10469,44,15.5,2,0.15);
INSERT INTO "OrderDetails" VALUES(10470,18,50,30,0);
INSERT INTO "OrderDetails" VALUES(10470,23,7.2,15,0);
INSERT INTO "OrderDetails" VALUES(10470,64,26.6,8,0);
INSERT INTO "OrderDetails" VALUES(10471,7,24,30,0);
INSERT INTO "OrderDetails" VALUES(10471,56,30.4,20,0);
INSERT INTO "OrderDetails" VALUES(10472,24,3.6,80,0.05);
INSERT INTO "OrderDetails" VALUES(10472,51,42.4,18,0);
INSERT INTO "OrderDetails" VALUES(10473,33,2,12,0);
INSERT INTO "OrderDetails" VALUES(10473,71,17.2,12,0);
INSERT INTO "OrderDetails" VALUES(10474,14,18.6,12,0);
INSERT INTO "OrderDetails" VALUES(10474,28,36.4,18,0);
INSERT INTO "OrderDetails" VALUES(10474,40,14.7,21,0);
INSERT INTO "OrderDetails" VALUES(10474,75,6.2,10,0);
INSERT INTO "OrderDetails" VALUES(10475,31,10,35,0.15);
INSERT INTO "OrderDetails" VALUES(10475,66,13.6,60,0.15);
INSERT INTO "OrderDetails" VALUES(10475,76,14.4,42,0.15);
INSERT INTO "OrderDetails" VALUES(10476,55,19.2,2,0.05);
INSERT INTO "OrderDetails" VALUES(10476,70,12,12,0);
INSERT INTO "OrderDetails" VALUES(10477,1,14.4,15,0);
INSERT INTO "OrderDetails" VALUES(10477,21,8,21,0.25);
INSERT INTO "OrderDetails" VALUES(10477,39,14.4,20,0.25);
INSERT INTO "OrderDetails" VALUES(10478,10,24.8,20,0.05);
INSERT INTO "OrderDetails" VALUES(10479,38,210.8,30,0);
INSERT INTO "OrderDetails" VALUES(10479,53,26.2,28,0);
INSERT INTO "OrderDetails" VALUES(10479,59,44,60,0);
INSERT INTO "OrderDetails" VALUES(10479,64,26.6,30,0);
INSERT INTO "OrderDetails" VALUES(10480,47,7.6,30,0);
INSERT INTO "OrderDetails" VALUES(10480,59,44,12,0);
INSERT INTO "OrderDetails" VALUES(10481,49,16,24,0);
INSERT INTO "OrderDetails" VALUES(10481,60,27.2,40,0);
INSERT INTO "OrderDetails" VALUES(10482,40,14.7,10,0);
INSERT INTO "OrderDetails" VALUES(10483,34,11.2,35,0.05);
INSERT INTO "OrderDetails" VALUES(10483,77,10.4,30,0.05);
INSERT INTO "OrderDetails" VALUES(10484,21,8,14,0);
INSERT INTO "OrderDetails" VALUES(10484,40,14.7,10,0);
INSERT INTO "OrderDetails" VALUES(10484,51,42.4,3,0);
INSERT INTO "OrderDetails" VALUES(10485,2,15.2,20,0.1);
INSERT INTO "OrderDetails" VALUES(10485,3,8,20,0.1);
INSERT INTO "OrderDetails" VALUES(10485,55,19.2,30,0.1);
INSERT INTO "OrderDetails" VALUES(10485,70,12,60,0.1);
INSERT INTO "OrderDetails" VALUES(10486,11,16.8,5,0);
INSERT INTO "OrderDetails" VALUES(10486,51,42.4,25,0);
INSERT INTO "OrderDetails" VALUES(10486,74,8,16,0);
INSERT INTO "OrderDetails" VALUES(10487,19,7.3,5,0);
INSERT INTO "OrderDetails" VALUES(10487,26,24.9,30,0);
INSERT INTO "OrderDetails" VALUES(10487,54,5.9,24,0.25);
INSERT INTO "OrderDetails" VALUES(10488,59,44,30,0);
INSERT INTO "OrderDetails" VALUES(10488,73,12,20,0.2);
INSERT INTO "OrderDetails" VALUES(10489,11,16.8,15,0.25);
INSERT INTO "OrderDetails" VALUES(10489,16,13.9,18,0);
INSERT INTO "OrderDetails" VALUES(10490,59,44,60,0);
INSERT INTO "OrderDetails" VALUES(10490,68,10,30,0);
INSERT INTO "OrderDetails" VALUES(10490,75,6.2,36,0);
INSERT INTO "OrderDetails" VALUES(10491,44,15.5,15,0.15);
INSERT INTO "OrderDetails" VALUES(10491,77,10.4,7,0.15);
INSERT INTO "OrderDetails" VALUES(10492,25,11.2,60,0.05);
INSERT INTO "OrderDetails" VALUES(10492,42,11.2,20,0.05);
INSERT INTO "OrderDetails" VALUES(10493,65,16.8,15,0.1);
INSERT INTO "OrderDetails" VALUES(10493,66,13.6,10,0.1);
INSERT INTO "OrderDetails" VALUES(10493,69,28.8,10,0.1);
INSERT INTO "OrderDetails" VALUES(10494,56,30.4,30,0);
INSERT INTO "OrderDetails" VALUES(10495,23,7.2,10,0);
INSERT INTO "OrderDetails" VALUES(10495,41,7.7,20,0);
INSERT INTO "OrderDetails" VALUES(10495,77,10.4,5,0);
INSERT INTO "OrderDetails" VALUES(10496,31,10,20,0.05);
INSERT INTO "OrderDetails" VALUES(10497,56,30.4,14,0);
INSERT INTO "OrderDetails" VALUES(10497,72,27.8,25,0);
INSERT INTO "OrderDetails" VALUES(10497,77,10.4,25,0);
INSERT INTO "OrderDetails" VALUES(10498,24,4.5,14,0);
INSERT INTO "OrderDetails" VALUES(10498,40,18.4,5,0);
INSERT INTO "OrderDetails" VALUES(10498,42,14,30,0);
INSERT INTO "OrderDetails" VALUES(10499,28,45.6,20,0);
INSERT INTO "OrderDetails" VALUES(10499,49,20,25,0);
INSERT INTO "OrderDetails" VALUES(10500,15,15.5,12,0.05);
INSERT INTO "OrderDetails" VALUES(10500,28,45.6,8,0.05);
INSERT INTO "OrderDetails" VALUES(10501,54,7.45,20,0);
INSERT INTO "OrderDetails" VALUES(10502,45,9.5,21,0);
INSERT INTO "OrderDetails" VALUES(10502,53,32.8,6,0);
INSERT INTO "OrderDetails" VALUES(10502,67,14,30,0);
INSERT INTO "OrderDetails" VALUES(10503,14,23.25,70,0);
INSERT INTO "OrderDetails" VALUES(10503,65,21.05,20,0);
INSERT INTO "OrderDetails" VALUES(10504,2,19,12,0);
INSERT INTO "OrderDetails" VALUES(10504,21,10,12,0);
INSERT INTO "OrderDetails" VALUES(10504,53,32.8,10,0);
INSERT INTO "OrderDetails" VALUES(10504,61,28.5,25,0);
INSERT INTO "OrderDetails" VALUES(10505,62,49.3,3,0);
INSERT INTO "OrderDetails" VALUES(10506,25,14,18,0.1);
INSERT INTO "OrderDetails" VALUES(10506,70,15,14,0.1);
INSERT INTO "OrderDetails" VALUES(10507,43,46,15,0.15);
INSERT INTO "OrderDetails" VALUES(10507,48,12.75,15,0.15);
INSERT INTO "OrderDetails" VALUES(10508,13,6,10,0);
INSERT INTO "OrderDetails" VALUES(10508,39,18,10,0);
INSERT INTO "OrderDetails" VALUES(10509,28,45.6,3,0);
INSERT INTO "OrderDetails" VALUES(10510,29,123.79,36,0);
INSERT INTO "OrderDetails" VALUES(10510,75,7.75,36,0.1);
INSERT INTO "OrderDetails" VALUES(10511,4,22,50,0.15);
INSERT INTO "OrderDetails" VALUES(10511,7,30,50,0.15);
INSERT INTO "OrderDetails" VALUES(10511,8,40,10,0.15);
INSERT INTO "OrderDetails" VALUES(10512,24,4.5,10,0.15);
INSERT INTO "OrderDetails" VALUES(10512,46,12,9,0.15);
INSERT INTO "OrderDetails" VALUES(10512,47,9.5,6,0.15);
INSERT INTO "OrderDetails" VALUES(10512,60,34,12,0.15);
INSERT INTO "OrderDetails" VALUES(10513,21,10,40,0.2);
INSERT INTO "OrderDetails" VALUES(10513,32,32,50,0.2);
INSERT INTO "OrderDetails" VALUES(10513,61,28.5,15,0.2);
INSERT INTO "OrderDetails" VALUES(10514,20,81,39,0);
INSERT INTO "OrderDetails" VALUES(10514,28,45.6,35,0);
INSERT INTO "OrderDetails" VALUES(10514,56,38,70,0);
INSERT INTO "OrderDetails" VALUES(10514,65,21.05,39,0);
INSERT INTO "OrderDetails" VALUES(10514,75,7.75,50,0);
INSERT INTO "OrderDetails" VALUES(10515,9,97,16,0.15);
INSERT INTO "OrderDetails" VALUES(10515,16,17.45,50,0);
INSERT INTO "OrderDetails" VALUES(10515,27,43.9,120,0);
INSERT INTO "OrderDetails" VALUES(10515,33,2.5,16,0.15);
INSERT INTO "OrderDetails" VALUES(10515,60,34,84,0.15);
INSERT INTO "OrderDetails" VALUES(10516,18,62.5,25,0.1);
INSERT INTO "OrderDetails" VALUES(10516,41,9.65,80,0.1);
INSERT INTO "OrderDetails" VALUES(10516,42,14,20,0);
INSERT INTO "OrderDetails" VALUES(10517,52,7,6,0);
INSERT INTO "OrderDetails" VALUES(10517,59,55,4,0);
INSERT INTO "OrderDetails" VALUES(10517,70,15,6,0);
INSERT INTO "OrderDetails" VALUES(10518,24,4.5,5,0);
INSERT INTO "OrderDetails" VALUES(10518,38,263.5,15,0);
INSERT INTO "OrderDetails" VALUES(10518,44,19.45,9,0);
INSERT INTO "OrderDetails" VALUES(10519,10,31,16,0.05);
INSERT INTO "OrderDetails" VALUES(10519,56,38,40,0);
INSERT INTO "OrderDetails" VALUES(10519,60,34,10,0.05);
INSERT INTO "OrderDetails" VALUES(10520,24,4.5,8,0);
INSERT INTO "OrderDetails" VALUES(10520,53,32.8,5,0);
INSERT INTO "OrderDetails" VALUES(10521,35,18,3,0);
INSERT INTO "OrderDetails" VALUES(10521,41,9.65,10,0);
INSERT INTO "OrderDetails" VALUES(10521,68,12.5,6,0);
INSERT INTO "OrderDetails" VALUES(10522,1,18,40,0.2);
INSERT INTO "OrderDetails" VALUES(10522,8,40,24,0);
INSERT INTO "OrderDetails" VALUES(10522,30,25.89,20,0.2);
INSERT INTO "OrderDetails" VALUES(10522,40,18.4,25,0.2);
INSERT INTO "OrderDetails" VALUES(10523,17,39,25,0.1);
INSERT INTO "OrderDetails" VALUES(10523,20,81,15,0.1);
INSERT INTO "OrderDetails" VALUES(10523,37,26,18,0.1);
INSERT INTO "OrderDetails" VALUES(10523,41,9.65,6,0.1);
INSERT INTO "OrderDetails" VALUES(10524,10,31,2,0);
INSERT INTO "OrderDetails" VALUES(10524,30,25.89,10,0);
INSERT INTO "OrderDetails" VALUES(10524,43,46,60,0);
INSERT INTO "OrderDetails" VALUES(10524,54,7.45,15,0);
INSERT INTO "OrderDetails" VALUES(10525,36,19,30,0);
INSERT INTO "OrderDetails" VALUES(10525,40,18.4,15,0.1);
INSERT INTO "OrderDetails" VALUES(10526,1,18,8,0.15);
INSERT INTO "OrderDetails" VALUES(10526,13,6,10,0);
INSERT INTO "OrderDetails" VALUES(10526,56,38,30,0.15);
INSERT INTO "OrderDetails" VALUES(10527,4,22,50,0.1);
INSERT INTO "OrderDetails" VALUES(10527,36,19,30,0.1);
INSERT INTO "OrderDetails" VALUES(10528,11,21,3,0);
INSERT INTO "OrderDetails" VALUES(10528,33,2.5,8,0.2);
INSERT INTO "OrderDetails" VALUES(10528,72,34.8,9,0);
INSERT INTO "OrderDetails" VALUES(10529,55,24,14,0);
INSERT INTO "OrderDetails" VALUES(10529,68,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10529,69,36,10,0);
INSERT INTO "OrderDetails" VALUES(10530,17,39,40,0);
INSERT INTO "OrderDetails" VALUES(10530,43,46,25,0);
INSERT INTO "OrderDetails" VALUES(10530,61,28.5,20,0);
INSERT INTO "OrderDetails" VALUES(10530,76,18,50,0);
INSERT INTO "OrderDetails" VALUES(10531,59,55,2,0);
INSERT INTO "OrderDetails" VALUES(10532,30,25.89,15,0);
INSERT INTO "OrderDetails" VALUES(10532,66,17,24,0);
INSERT INTO "OrderDetails" VALUES(10533,4,22,50,0.05);
INSERT INTO "OrderDetails" VALUES(10533,72,34.8,24,0);
INSERT INTO "OrderDetails" VALUES(10533,73,15,24,0.05);
INSERT INTO "OrderDetails" VALUES(10534,30,25.89,10,0);
INSERT INTO "OrderDetails" VALUES(10534,40,18.4,10,0.2);
INSERT INTO "OrderDetails" VALUES(10534,54,7.45,10,0.2);
INSERT INTO "OrderDetails" VALUES(10535,11,21,50,0.1);
INSERT INTO "OrderDetails" VALUES(10535,40,18.4,10,0.1);
INSERT INTO "OrderDetails" VALUES(10535,57,19.5,5,0.1);
INSERT INTO "OrderDetails" VALUES(10535,59,55,15,0.1);
INSERT INTO "OrderDetails" VALUES(10536,12,38,15,0.25);
INSERT INTO "OrderDetails" VALUES(10536,31,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10536,33,2.5,30,0);
INSERT INTO "OrderDetails" VALUES(10536,60,34,35,0.25);
INSERT INTO "OrderDetails" VALUES(10537,31,12.5,30,0);
INSERT INTO "OrderDetails" VALUES(10537,51,53,6,0);
INSERT INTO "OrderDetails" VALUES(10537,58,13.25,20,0);
INSERT INTO "OrderDetails" VALUES(10537,72,34.8,21,0);
INSERT INTO "OrderDetails" VALUES(10537,73,15,9,0);
INSERT INTO "OrderDetails" VALUES(10538,70,15,7,0);
INSERT INTO "OrderDetails" VALUES(10538,72,34.8,1,0);
INSERT INTO "OrderDetails" VALUES(10539,13,6,8,0);
INSERT INTO "OrderDetails" VALUES(10539,21,10,15,0);
INSERT INTO "OrderDetails" VALUES(10539,33,2.5,15,0);
INSERT INTO "OrderDetails" VALUES(10539,49,20,6,0);
INSERT INTO "OrderDetails" VALUES(10540,3,10,60,0);
INSERT INTO "OrderDetails" VALUES(10540,26,31.23,40,0);
INSERT INTO "OrderDetails" VALUES(10540,38,263.5,30,0);
INSERT INTO "OrderDetails" VALUES(10540,68,12.5,35,0);
INSERT INTO "OrderDetails" VALUES(10541,24,4.5,35,0.1);
INSERT INTO "OrderDetails" VALUES(10541,38,263.5,4,0.1);
INSERT INTO "OrderDetails" VALUES(10541,65,21.05,36,0.1);
INSERT INTO "OrderDetails" VALUES(10541,71,21.5,9,0.1);
INSERT INTO "OrderDetails" VALUES(10542,11,21,15,0.05);
INSERT INTO "OrderDetails" VALUES(10542,54,7.45,24,0.05);
INSERT INTO "OrderDetails" VALUES(10543,12,38,30,0.15);
INSERT INTO "OrderDetails" VALUES(10543,23,9,70,0.15);
INSERT INTO "OrderDetails" VALUES(10544,28,45.6,7,0);
INSERT INTO "OrderDetails" VALUES(10544,67,14,7,0);
INSERT INTO "OrderDetails" VALUES(10545,11,21,10,0);
INSERT INTO "OrderDetails" VALUES(10546,7,30,10,0);
INSERT INTO "OrderDetails" VALUES(10546,35,18,30,0);
INSERT INTO "OrderDetails" VALUES(10546,62,49.3,40,0);
INSERT INTO "OrderDetails" VALUES(10547,32,32,24,0.15);
INSERT INTO "OrderDetails" VALUES(10547,36,19,60,0);
INSERT INTO "OrderDetails" VALUES(10548,34,14,10,0.25);
INSERT INTO "OrderDetails" VALUES(10548,41,9.65,14,0);
INSERT INTO "OrderDetails" VALUES(10549,31,12.5,55,0.15);
INSERT INTO "OrderDetails" VALUES(10549,45,9.5,100,0.15);
INSERT INTO "OrderDetails" VALUES(10549,51,53,48,0.15);
INSERT INTO "OrderDetails" VALUES(10550,17,39,8,0.1);
INSERT INTO "OrderDetails" VALUES(10550,19,9.2,10,0);
INSERT INTO "OrderDetails" VALUES(10550,21,10,6,0.1);
INSERT INTO "OrderDetails" VALUES(10550,61,28.5,10,0.1);
INSERT INTO "OrderDetails" VALUES(10551,16,17.45,40,0.15);
INSERT INTO "OrderDetails" VALUES(10551,35,18,20,0.15);
INSERT INTO "OrderDetails" VALUES(10551,44,19.45,40,0);
INSERT INTO "OrderDetails" VALUES(10552,69,36,18,0);
INSERT INTO "OrderDetails" VALUES(10552,75,7.75,30,0);
INSERT INTO "OrderDetails" VALUES(10553,11,21,15,0);
INSERT INTO "OrderDetails" VALUES(10553,16,17.45,14,0);
INSERT INTO "OrderDetails" VALUES(10553,22,21,24,0);
INSERT INTO "OrderDetails" VALUES(10553,31,12.5,30,0);
INSERT INTO "OrderDetails" VALUES(10553,35,18,6,0);
INSERT INTO "OrderDetails" VALUES(10554,16,17.45,30,0.05);
INSERT INTO "OrderDetails" VALUES(10554,23,9,20,0.05);
INSERT INTO "OrderDetails" VALUES(10554,62,49.3,20,0.05);
INSERT INTO "OrderDetails" VALUES(10554,77,13,10,0.05);
INSERT INTO "OrderDetails" VALUES(10555,14,23.25,30,0.2);
INSERT INTO "OrderDetails" VALUES(10555,19,9.2,35,0.2);
INSERT INTO "OrderDetails" VALUES(10555,24,4.5,18,0.2);
INSERT INTO "OrderDetails" VALUES(10555,51,53,20,0.2);
INSERT INTO "OrderDetails" VALUES(10555,56,38,40,0.2);
INSERT INTO "OrderDetails" VALUES(10556,72,34.8,24,0);
INSERT INTO "OrderDetails" VALUES(10557,64,33.25,30,0);
INSERT INTO "OrderDetails" VALUES(10557,75,7.75,20,0);
INSERT INTO "OrderDetails" VALUES(10558,47,9.5,25,0);
INSERT INTO "OrderDetails" VALUES(10558,51,53,20,0);
INSERT INTO "OrderDetails" VALUES(10558,52,7,30,0);
INSERT INTO "OrderDetails" VALUES(10558,53,32.8,18,0);
INSERT INTO "OrderDetails" VALUES(10558,73,15,3,0);
INSERT INTO "OrderDetails" VALUES(10559,41,9.65,12,0.05);
INSERT INTO "OrderDetails" VALUES(10559,55,24,18,0.05);
INSERT INTO "OrderDetails" VALUES(10560,30,25.89,20,0);
INSERT INTO "OrderDetails" VALUES(10560,62,49.3,15,0.25);
INSERT INTO "OrderDetails" VALUES(10561,44,19.45,10,0);
INSERT INTO "OrderDetails" VALUES(10561,51,53,50,0);
INSERT INTO "OrderDetails" VALUES(10562,33,2.5,20,0.1);
INSERT INTO "OrderDetails" VALUES(10562,62,49.3,10,0.1);
INSERT INTO "OrderDetails" VALUES(10563,36,19,25,0);
INSERT INTO "OrderDetails" VALUES(10563,52,7,70,0);
INSERT INTO "OrderDetails" VALUES(10564,17,39,16,0.05);
INSERT INTO "OrderDetails" VALUES(10564,31,12.5,6,0.05);
INSERT INTO "OrderDetails" VALUES(10564,55,24,25,0.05);
INSERT INTO "OrderDetails" VALUES(10565,24,4.5,25,0.1);
INSERT INTO "OrderDetails" VALUES(10565,64,33.25,18,0.1);
INSERT INTO "OrderDetails" VALUES(10566,11,21,35,0.15);
INSERT INTO "OrderDetails" VALUES(10566,18,62.5,18,0.15);
INSERT INTO "OrderDetails" VALUES(10566,76,18,10,0);
INSERT INTO "OrderDetails" VALUES(10567,31,12.5,60,0.2);
INSERT INTO "OrderDetails" VALUES(10567,51,53,3,0);
INSERT INTO "OrderDetails" VALUES(10567,59,55,40,0.2);
INSERT INTO "OrderDetails" VALUES(10568,10,31,5,0);
INSERT INTO "OrderDetails" VALUES(10569,31,12.5,35,0.2);
INSERT INTO "OrderDetails" VALUES(10569,76,18,30,0);
INSERT INTO "OrderDetails" VALUES(10570,11,21,15,0.05);
INSERT INTO "OrderDetails" VALUES(10570,56,38,60,0.05);
INSERT INTO "OrderDetails" VALUES(10571,14,23.25,11,0.15);
INSERT INTO "OrderDetails" VALUES(10571,42,14,28,0.15);
INSERT INTO "OrderDetails" VALUES(10572,16,17.45,12,0.1);
INSERT INTO "OrderDetails" VALUES(10572,32,32,10,0.1);
INSERT INTO "OrderDetails" VALUES(10572,40,18.4,50,0);
INSERT INTO "OrderDetails" VALUES(10572,75,7.75,15,0.1);
INSERT INTO "OrderDetails" VALUES(10573,17,39,18,0);
INSERT INTO "OrderDetails" VALUES(10573,34,14,40,0);
INSERT INTO "OrderDetails" VALUES(10573,53,32.8,25,0);
INSERT INTO "OrderDetails" VALUES(10574,33,2.5,14,0);
INSERT INTO "OrderDetails" VALUES(10574,40,18.4,2,0);
INSERT INTO "OrderDetails" VALUES(10574,62,49.3,10,0);
INSERT INTO "OrderDetails" VALUES(10574,64,33.25,6,0);
INSERT INTO "OrderDetails" VALUES(10575,59,55,12,0);
INSERT INTO "OrderDetails" VALUES(10575,63,43.9,6,0);
INSERT INTO "OrderDetails" VALUES(10575,72,34.8,30,0);
INSERT INTO "OrderDetails" VALUES(10575,76,18,10,0);
INSERT INTO "OrderDetails" VALUES(10576,1,18,10,0);
INSERT INTO "OrderDetails" VALUES(10576,31,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10576,44,19.45,21,0);
INSERT INTO "OrderDetails" VALUES(10577,39,18,10,0);
INSERT INTO "OrderDetails" VALUES(10577,75,7.75,20,0);
INSERT INTO "OrderDetails" VALUES(10577,77,13,18,0);
INSERT INTO "OrderDetails" VALUES(10578,35,18,20,0);
INSERT INTO "OrderDetails" VALUES(10578,57,19.5,6,0);
INSERT INTO "OrderDetails" VALUES(10579,15,15.5,10,0);
INSERT INTO "OrderDetails" VALUES(10579,75,7.75,21,0);
INSERT INTO "OrderDetails" VALUES(10580,14,23.25,15,0.05);
INSERT INTO "OrderDetails" VALUES(10580,41,9.65,9,0.05);
INSERT INTO "OrderDetails" VALUES(10580,65,21.05,30,0.05);
INSERT INTO "OrderDetails" VALUES(10581,75,7.75,50,0.2);
INSERT INTO "OrderDetails" VALUES(10582,57,19.5,4,0);
INSERT INTO "OrderDetails" VALUES(10582,76,18,14,0);
INSERT INTO "OrderDetails" VALUES(10583,29,123.79,10,0);
INSERT INTO "OrderDetails" VALUES(10583,60,34,24,0.15);
INSERT INTO "OrderDetails" VALUES(10583,69,36,10,0.15);
INSERT INTO "OrderDetails" VALUES(10584,31,12.5,50,0.05);
INSERT INTO "OrderDetails" VALUES(10585,47,9.5,15,0);
INSERT INTO "OrderDetails" VALUES(10586,52,7,4,0.15);
INSERT INTO "OrderDetails" VALUES(10587,26,31.23,6,0);
INSERT INTO "OrderDetails" VALUES(10587,35,18,20,0);
INSERT INTO "OrderDetails" VALUES(10587,77,13,20,0);
INSERT INTO "OrderDetails" VALUES(10588,18,62.5,40,0.2);
INSERT INTO "OrderDetails" VALUES(10588,42,14,100,0.2);
INSERT INTO "OrderDetails" VALUES(10589,35,18,4,0);
INSERT INTO "OrderDetails" VALUES(10590,1,18,20,0);
INSERT INTO "OrderDetails" VALUES(10590,77,13,60,0.05);
INSERT INTO "OrderDetails" VALUES(10591,3,10,14,0);
INSERT INTO "OrderDetails" VALUES(10591,7,30,10,0);
INSERT INTO "OrderDetails" VALUES(10591,54,7.45,50,0);
INSERT INTO "OrderDetails" VALUES(10592,15,15.5,25,0.05);
INSERT INTO "OrderDetails" VALUES(10592,26,31.23,5,0.05);
INSERT INTO "OrderDetails" VALUES(10593,20,81,21,0.2);
INSERT INTO "OrderDetails" VALUES(10593,69,36,20,0.2);
INSERT INTO "OrderDetails" VALUES(10593,76,18,4,0.2);
INSERT INTO "OrderDetails" VALUES(10594,52,7,24,0);
INSERT INTO "OrderDetails" VALUES(10594,58,13.25,30,0);
INSERT INTO "OrderDetails" VALUES(10595,35,18,30,0.25);
INSERT INTO "OrderDetails" VALUES(10595,61,28.5,120,0.25);
INSERT INTO "OrderDetails" VALUES(10595,69,36,65,0.25);
INSERT INTO "OrderDetails" VALUES(10596,56,38,5,0.2);
INSERT INTO "OrderDetails" VALUES(10596,63,43.9,24,0.2);
INSERT INTO "OrderDetails" VALUES(10596,75,7.75,30,0.2);
INSERT INTO "OrderDetails" VALUES(10597,24,4.5,35,0.2);
INSERT INTO "OrderDetails" VALUES(10597,57,19.5,20,0);
INSERT INTO "OrderDetails" VALUES(10597,65,21.05,12,0.2);
INSERT INTO "OrderDetails" VALUES(10598,27,43.9,50,0);
INSERT INTO "OrderDetails" VALUES(10598,71,21.5,9,0);
INSERT INTO "OrderDetails" VALUES(10599,62,49.3,10,0);
INSERT INTO "OrderDetails" VALUES(10600,54,7.45,4,0);
INSERT INTO "OrderDetails" VALUES(10600,73,15,30,0);
INSERT INTO "OrderDetails" VALUES(10601,13,6,60,0);
INSERT INTO "OrderDetails" VALUES(10601,59,55,35,0);
INSERT INTO "OrderDetails" VALUES(10602,77,13,5,0.25);
INSERT INTO "OrderDetails" VALUES(10603,22,21,48,0);
INSERT INTO "OrderDetails" VALUES(10603,49,20,25,0.05);
INSERT INTO "OrderDetails" VALUES(10604,48,12.75,6,0.1);
INSERT INTO "OrderDetails" VALUES(10604,76,18,10,0.1);
INSERT INTO "OrderDetails" VALUES(10605,16,17.45,30,0.05);
INSERT INTO "OrderDetails" VALUES(10605,59,55,20,0.05);
INSERT INTO "OrderDetails" VALUES(10605,60,34,70,0.05);
INSERT INTO "OrderDetails" VALUES(10605,71,21.5,15,0.05);
INSERT INTO "OrderDetails" VALUES(10606,4,22,20,0.2);
INSERT INTO "OrderDetails" VALUES(10606,55,24,20,0.2);
INSERT INTO "OrderDetails" VALUES(10606,62,49.3,10,0.2);
INSERT INTO "OrderDetails" VALUES(10607,7,30,45,0);
INSERT INTO "OrderDetails" VALUES(10607,17,39,100,0);
INSERT INTO "OrderDetails" VALUES(10607,33,2.5,14,0);
INSERT INTO "OrderDetails" VALUES(10607,40,18.4,42,0);
INSERT INTO "OrderDetails" VALUES(10607,72,34.8,12,0);
INSERT INTO "OrderDetails" VALUES(10608,56,38,28,0);
INSERT INTO "OrderDetails" VALUES(10609,1,18,3,0);
INSERT INTO "OrderDetails" VALUES(10609,10,31,10,0);
INSERT INTO "OrderDetails" VALUES(10609,21,10,6,0);
INSERT INTO "OrderDetails" VALUES(10610,36,19,21,0.25);
INSERT INTO "OrderDetails" VALUES(10611,1,18,6,0);
INSERT INTO "OrderDetails" VALUES(10611,2,19,10,0);
INSERT INTO "OrderDetails" VALUES(10611,60,34,15,0);
INSERT INTO "OrderDetails" VALUES(10612,10,31,70,0);
INSERT INTO "OrderDetails" VALUES(10612,36,19,55,0);
INSERT INTO "OrderDetails" VALUES(10612,49,20,18,0);
INSERT INTO "OrderDetails" VALUES(10612,60,34,40,0);
INSERT INTO "OrderDetails" VALUES(10612,76,18,80,0);
INSERT INTO "OrderDetails" VALUES(10613,13,6,8,0.1);
INSERT INTO "OrderDetails" VALUES(10613,75,7.75,40,0);
INSERT INTO "OrderDetails" VALUES(10614,11,21,14,0);
INSERT INTO "OrderDetails" VALUES(10614,21,10,8,0);
INSERT INTO "OrderDetails" VALUES(10614,39,18,5,0);
INSERT INTO "OrderDetails" VALUES(10615,55,24,5,0);
INSERT INTO "OrderDetails" VALUES(10616,38,263.5,15,0.05);
INSERT INTO "OrderDetails" VALUES(10616,56,38,14,0);
INSERT INTO "OrderDetails" VALUES(10616,70,15,15,0.05);
INSERT INTO "OrderDetails" VALUES(10616,71,21.5,15,0.05);
INSERT INTO "OrderDetails" VALUES(10617,59,55,30,0.15);
INSERT INTO "OrderDetails" VALUES(10618,6,25,70,0);
INSERT INTO "OrderDetails" VALUES(10618,56,38,20,0);
INSERT INTO "OrderDetails" VALUES(10618,68,12.5,15,0);
INSERT INTO "OrderDetails" VALUES(10619,21,10,42,0);
INSERT INTO "OrderDetails" VALUES(10619,22,21,40,0);
INSERT INTO "OrderDetails" VALUES(10620,24,4.5,5,0);
INSERT INTO "OrderDetails" VALUES(10620,52,7,5,0);
INSERT INTO "OrderDetails" VALUES(10621,19,9.2,5,0);
INSERT INTO "OrderDetails" VALUES(10621,23,9,10,0);
INSERT INTO "OrderDetails" VALUES(10621,70,15,20,0);
INSERT INTO "OrderDetails" VALUES(10621,71,21.5,15,0);
INSERT INTO "OrderDetails" VALUES(10622,2,19,20,0);
INSERT INTO "OrderDetails" VALUES(10622,68,12.5,18,0.2);
INSERT INTO "OrderDetails" VALUES(10623,14,23.25,21,0);
INSERT INTO "OrderDetails" VALUES(10623,19,9.2,15,0.1);
INSERT INTO "OrderDetails" VALUES(10623,21,10,25,0.1);
INSERT INTO "OrderDetails" VALUES(10623,24,4.5,3,0);
INSERT INTO "OrderDetails" VALUES(10623,35,18,30,0.1);
INSERT INTO "OrderDetails" VALUES(10624,28,45.6,10,0);
INSERT INTO "OrderDetails" VALUES(10624,29,123.79,6,0);
INSERT INTO "OrderDetails" VALUES(10624,44,19.45,10,0);
INSERT INTO "OrderDetails" VALUES(10625,14,23.25,3,0);
INSERT INTO "OrderDetails" VALUES(10625,42,14,5,0);
INSERT INTO "OrderDetails" VALUES(10625,60,34,10,0);
INSERT INTO "OrderDetails" VALUES(10626,53,32.8,12,0);
INSERT INTO "OrderDetails" VALUES(10626,60,34,20,0);
INSERT INTO "OrderDetails" VALUES(10626,71,21.5,20,0);
INSERT INTO "OrderDetails" VALUES(10627,62,49.3,15,0);
INSERT INTO "OrderDetails" VALUES(10627,73,15,35,0.15);
INSERT INTO "OrderDetails" VALUES(10628,1,18,25,0);
INSERT INTO "OrderDetails" VALUES(10629,29,123.79,20,0);
INSERT INTO "OrderDetails" VALUES(10629,64,33.25,9,0);
INSERT INTO "OrderDetails" VALUES(10630,55,24,12,0.05);
INSERT INTO "OrderDetails" VALUES(10630,76,18,35,0);
INSERT INTO "OrderDetails" VALUES(10631,75,7.75,8,0.1);
INSERT INTO "OrderDetails" VALUES(10632,2,19,30,0.05);
INSERT INTO "OrderDetails" VALUES(10632,33,2.5,20,0.05);
INSERT INTO "OrderDetails" VALUES(10633,12,38,36,0.15);
INSERT INTO "OrderDetails" VALUES(10633,13,6,13,0.15);
INSERT INTO "OrderDetails" VALUES(10633,26,31.23,35,0.15);
INSERT INTO "OrderDetails" VALUES(10633,62,49.3,80,0.15);
INSERT INTO "OrderDetails" VALUES(10634,7,30,35,0);
INSERT INTO "OrderDetails" VALUES(10634,18,62.5,50,0);
INSERT INTO "OrderDetails" VALUES(10634,51,53,15,0);
INSERT INTO "OrderDetails" VALUES(10634,75,7.75,2,0);
INSERT INTO "OrderDetails" VALUES(10635,4,22,10,0.1);
INSERT INTO "OrderDetails" VALUES(10635,5,21.35,15,0.1);
INSERT INTO "OrderDetails" VALUES(10635,22,21,40,0);
INSERT INTO "OrderDetails" VALUES(10636,4,22,25,0);
INSERT INTO "OrderDetails" VALUES(10636,58,13.25,6,0);
INSERT INTO "OrderDetails" VALUES(10637,11,21,10,0);
INSERT INTO "OrderDetails" VALUES(10637,50,16.25,25,0.05);
INSERT INTO "OrderDetails" VALUES(10637,56,38,60,0.05);
INSERT INTO "OrderDetails" VALUES(10638,45,9.5,20,0);
INSERT INTO "OrderDetails" VALUES(10638,65,21.05,21,0);
INSERT INTO "OrderDetails" VALUES(10638,72,34.8,60,0);
INSERT INTO "OrderDetails" VALUES(10639,18,62.5,8,0);
INSERT INTO "OrderDetails" VALUES(10640,69,36,20,0.25);
INSERT INTO "OrderDetails" VALUES(10640,70,15,15,0.25);
INSERT INTO "OrderDetails" VALUES(10641,2,19,50,0);
INSERT INTO "OrderDetails" VALUES(10641,40,18.4,60,0);
INSERT INTO "OrderDetails" VALUES(10642,21,10,30,0.2);
INSERT INTO "OrderDetails" VALUES(10642,61,28.5,20,0.2);
INSERT INTO "OrderDetails" VALUES(10643,28,45.6,15,0.25);
INSERT INTO "OrderDetails" VALUES(10643,39,18,21,0.25);
INSERT INTO "OrderDetails" VALUES(10643,46,12,2,0.25);
INSERT INTO "OrderDetails" VALUES(10644,18,62.5,4,0.1);
INSERT INTO "OrderDetails" VALUES(10644,43,46,20,0);
INSERT INTO "OrderDetails" VALUES(10644,46,12,21,0.1);
INSERT INTO "OrderDetails" VALUES(10645,18,62.5,20,0);
INSERT INTO "OrderDetails" VALUES(10645,36,19,15,0);
INSERT INTO "OrderDetails" VALUES(10646,1,18,15,0.25);
INSERT INTO "OrderDetails" VALUES(10646,10,31,18,0.25);
INSERT INTO "OrderDetails" VALUES(10646,71,21.5,30,0.25);
INSERT INTO "OrderDetails" VALUES(10646,77,13,35,0.25);
INSERT INTO "OrderDetails" VALUES(10647,19,9.2,30,0);
INSERT INTO "OrderDetails" VALUES(10647,39,18,20,0);
INSERT INTO "OrderDetails" VALUES(10648,22,21,15,0);
INSERT INTO "OrderDetails" VALUES(10648,24,4.5,15,0.15);
INSERT INTO "OrderDetails" VALUES(10649,28,45.6,20,0);
INSERT INTO "OrderDetails" VALUES(10649,72,34.8,15,0);
INSERT INTO "OrderDetails" VALUES(10650,30,25.89,30,0);
INSERT INTO "OrderDetails" VALUES(10650,53,32.8,25,0.05);
INSERT INTO "OrderDetails" VALUES(10650,54,7.45,30,0);
INSERT INTO "OrderDetails" VALUES(10651,19,9.2,12,0.25);
INSERT INTO "OrderDetails" VALUES(10651,22,21,20,0.25);
INSERT INTO "OrderDetails" VALUES(10652,30,25.89,2,0.25);
INSERT INTO "OrderDetails" VALUES(10652,42,14,20,0);
INSERT INTO "OrderDetails" VALUES(10653,16,17.45,30,0.1);
INSERT INTO "OrderDetails" VALUES(10653,60,34,20,0.1);
INSERT INTO "OrderDetails" VALUES(10654,4,22,12,0.1);
INSERT INTO "OrderDetails" VALUES(10654,39,18,20,0.1);
INSERT INTO "OrderDetails" VALUES(10654,54,7.45,6,0.1);
INSERT INTO "OrderDetails" VALUES(10655,41,9.65,20,0.2);
INSERT INTO "OrderDetails" VALUES(10656,14,23.25,3,0.1);
INSERT INTO "OrderDetails" VALUES(10656,44,19.45,28,0.1);
INSERT INTO "OrderDetails" VALUES(10656,47,9.5,6,0.1);
INSERT INTO "OrderDetails" VALUES(10657,15,15.5,50,0);
INSERT INTO "OrderDetails" VALUES(10657,41,9.65,24,0);
INSERT INTO "OrderDetails" VALUES(10657,46,12,45,0);
INSERT INTO "OrderDetails" VALUES(10657,47,9.5,10,0);
INSERT INTO "OrderDetails" VALUES(10657,56,38,45,0);
INSERT INTO "OrderDetails" VALUES(10657,60,34,30,0);
INSERT INTO "OrderDetails" VALUES(10658,21,10,60,0);
INSERT INTO "OrderDetails" VALUES(10658,40,18.4,70,0.05);
INSERT INTO "OrderDetails" VALUES(10658,60,34,55,0.05);
INSERT INTO "OrderDetails" VALUES(10658,77,13,70,0.05);
INSERT INTO "OrderDetails" VALUES(10659,31,12.5,20,0.05);
INSERT INTO "OrderDetails" VALUES(10659,40,18.4,24,0.05);
INSERT INTO "OrderDetails" VALUES(10659,70,15,40,0.05);
INSERT INTO "OrderDetails" VALUES(10660,20,81,21,0);
INSERT INTO "OrderDetails" VALUES(10661,39,18,3,0.2);
INSERT INTO "OrderDetails" VALUES(10661,58,13.25,49,0.2);
INSERT INTO "OrderDetails" VALUES(10662,68,12.5,10,0);
INSERT INTO "OrderDetails" VALUES(10663,40,18.4,30,0.05);
INSERT INTO "OrderDetails" VALUES(10663,42,14,30,0.05);
INSERT INTO "OrderDetails" VALUES(10663,51,53,20,0.05);
INSERT INTO "OrderDetails" VALUES(10664,10,31,24,0.15);
INSERT INTO "OrderDetails" VALUES(10664,56,38,12,0.15);
INSERT INTO "OrderDetails" VALUES(10664,65,21.05,15,0.15);
INSERT INTO "OrderDetails" VALUES(10665,51,53,20,0);
INSERT INTO "OrderDetails" VALUES(10665,59,55,1,0);
INSERT INTO "OrderDetails" VALUES(10665,76,18,10,0);
INSERT INTO "OrderDetails" VALUES(10666,29,123.79,36,0);
INSERT INTO "OrderDetails" VALUES(10666,65,21.05,10,0);
INSERT INTO "OrderDetails" VALUES(10667,69,36,45,0.2);
INSERT INTO "OrderDetails" VALUES(10667,71,21.5,14,0.2);
INSERT INTO "OrderDetails" VALUES(10668,31,12.5,8,0.1);
INSERT INTO "OrderDetails" VALUES(10668,55,24,4,0.1);
INSERT INTO "OrderDetails" VALUES(10668,64,33.25,15,0.1);
INSERT INTO "OrderDetails" VALUES(10669,36,19,30,0);
INSERT INTO "OrderDetails" VALUES(10670,23,9,32,0);
INSERT INTO "OrderDetails" VALUES(10670,46,12,60,0);
INSERT INTO "OrderDetails" VALUES(10670,67,14,25,0);
INSERT INTO "OrderDetails" VALUES(10670,73,15,50,0);
INSERT INTO "OrderDetails" VALUES(10670,75,7.75,25,0);
INSERT INTO "OrderDetails" VALUES(10671,16,17.45,10,0);
INSERT INTO "OrderDetails" VALUES(10671,62,49.3,10,0);
INSERT INTO "OrderDetails" VALUES(10671,65,21.05,12,0);
INSERT INTO "OrderDetails" VALUES(10672,38,263.5,15,0.1);
INSERT INTO "OrderDetails" VALUES(10672,71,21.5,12,0);
INSERT INTO "OrderDetails" VALUES(10673,16,17.45,3,0);
INSERT INTO "OrderDetails" VALUES(10673,42,14,6,0);
INSERT INTO "OrderDetails" VALUES(10673,43,46,6,0);
INSERT INTO "OrderDetails" VALUES(10674,23,9,5,0);
INSERT INTO "OrderDetails" VALUES(10675,14,23.25,30,0);
INSERT INTO "OrderDetails" VALUES(10675,53,32.8,10,0);
INSERT INTO "OrderDetails" VALUES(10675,58,13.25,30,0);
INSERT INTO "OrderDetails" VALUES(10676,10,31,2,0);
INSERT INTO "OrderDetails" VALUES(10676,19,9.2,7,0);
INSERT INTO "OrderDetails" VALUES(10676,44,19.45,21,0);
INSERT INTO "OrderDetails" VALUES(10677,26,31.23,30,0.15);
INSERT INTO "OrderDetails" VALUES(10677,33,2.5,8,0.15);
INSERT INTO "OrderDetails" VALUES(10678,12,38,100,0);
INSERT INTO "OrderDetails" VALUES(10678,33,2.5,30,0);
INSERT INTO "OrderDetails" VALUES(10678,41,9.65,120,0);
INSERT INTO "OrderDetails" VALUES(10678,54,7.45,30,0);
INSERT INTO "OrderDetails" VALUES(10679,59,55,12,0);
INSERT INTO "OrderDetails" VALUES(10680,16,17.45,50,0.25);
INSERT INTO "OrderDetails" VALUES(10680,31,12.5,20,0.25);
INSERT INTO "OrderDetails" VALUES(10680,42,14,40,0.25);
INSERT INTO "OrderDetails" VALUES(10681,19,9.2,30,0.1);
INSERT INTO "OrderDetails" VALUES(10681,21,10,12,0.1);
INSERT INTO "OrderDetails" VALUES(10681,64,33.25,28,0);
INSERT INTO "OrderDetails" VALUES(10682,33,2.5,30,0);
INSERT INTO "OrderDetails" VALUES(10682,66,17,4,0);
INSERT INTO "OrderDetails" VALUES(10682,75,7.75,30,0);
INSERT INTO "OrderDetails" VALUES(10683,52,7,9,0);
INSERT INTO "OrderDetails" VALUES(10684,40,18.4,20,0);
INSERT INTO "OrderDetails" VALUES(10684,47,9.5,40,0);
INSERT INTO "OrderDetails" VALUES(10684,60,34,30,0);
INSERT INTO "OrderDetails" VALUES(10685,10,31,20,0);
INSERT INTO "OrderDetails" VALUES(10685,41,9.65,4,0);
INSERT INTO "OrderDetails" VALUES(10685,47,9.5,15,0);
INSERT INTO "OrderDetails" VALUES(10686,17,39,30,0.2);
INSERT INTO "OrderDetails" VALUES(10686,26,31.23,15,0);
INSERT INTO "OrderDetails" VALUES(10687,9,97,50,0.25);
INSERT INTO "OrderDetails" VALUES(10687,29,123.79,10,0);
INSERT INTO "OrderDetails" VALUES(10687,36,19,6,0.25);
INSERT INTO "OrderDetails" VALUES(10688,10,31,18,0.1);
INSERT INTO "OrderDetails" VALUES(10688,28,45.6,60,0.1);
INSERT INTO "OrderDetails" VALUES(10688,34,14,14,0);
INSERT INTO "OrderDetails" VALUES(10689,1,18,35,0.25);
INSERT INTO "OrderDetails" VALUES(10690,56,38,20,0.25);
INSERT INTO "OrderDetails" VALUES(10690,77,13,30,0.25);
INSERT INTO "OrderDetails" VALUES(10691,1,18,30,0);
INSERT INTO "OrderDetails" VALUES(10691,29,123.79,40,0);
INSERT INTO "OrderDetails" VALUES(10691,43,46,40,0);
INSERT INTO "OrderDetails" VALUES(10691,44,19.45,24,0);
INSERT INTO "OrderDetails" VALUES(10691,62,49.3,48,0);
INSERT INTO "OrderDetails" VALUES(10692,63,43.9,20,0);
INSERT INTO "OrderDetails" VALUES(10693,9,97,6,0);
INSERT INTO "OrderDetails" VALUES(10693,54,7.45,60,0.15);
INSERT INTO "OrderDetails" VALUES(10693,69,36,30,0.15);
INSERT INTO "OrderDetails" VALUES(10693,73,15,15,0.15);
INSERT INTO "OrderDetails" VALUES(10694,7,30,90,0);
INSERT INTO "OrderDetails" VALUES(10694,59,55,25,0);
INSERT INTO "OrderDetails" VALUES(10694,70,15,50,0);
INSERT INTO "OrderDetails" VALUES(10695,8,40,10,0);
INSERT INTO "OrderDetails" VALUES(10695,12,38,4,0);
INSERT INTO "OrderDetails" VALUES(10695,24,4.5,20,0);
INSERT INTO "OrderDetails" VALUES(10696,17,39,20,0);
INSERT INTO "OrderDetails" VALUES(10696,46,12,18,0);
INSERT INTO "OrderDetails" VALUES(10697,19,9.2,7,0.25);
INSERT INTO "OrderDetails" VALUES(10697,35,18,9,0.25);
INSERT INTO "OrderDetails" VALUES(10697,58,13.25,30,0.25);
INSERT INTO "OrderDetails" VALUES(10697,70,15,30,0.25);
INSERT INTO "OrderDetails" VALUES(10698,11,21,15,0);
INSERT INTO "OrderDetails" VALUES(10698,17,39,8,0.05);
INSERT INTO "OrderDetails" VALUES(10698,29,123.79,12,0.05);
INSERT INTO "OrderDetails" VALUES(10698,65,21.05,65,0.05);
INSERT INTO "OrderDetails" VALUES(10698,70,15,8,0.05);
INSERT INTO "OrderDetails" VALUES(10699,47,9.5,12,0);
INSERT INTO "OrderDetails" VALUES(10700,1,18,5,0.2);
INSERT INTO "OrderDetails" VALUES(10700,34,14,12,0.2);
INSERT INTO "OrderDetails" VALUES(10700,68,12.5,40,0.2);
INSERT INTO "OrderDetails" VALUES(10700,71,21.5,60,0.2);
INSERT INTO "OrderDetails" VALUES(10701,59,55,42,0.15);
INSERT INTO "OrderDetails" VALUES(10701,71,21.5,20,0.15);
INSERT INTO "OrderDetails" VALUES(10701,76,18,35,0.15);
INSERT INTO "OrderDetails" VALUES(10702,3,10,6,0);
INSERT INTO "OrderDetails" VALUES(10702,76,18,15,0);
INSERT INTO "OrderDetails" VALUES(10703,2,19,5,0);
INSERT INTO "OrderDetails" VALUES(10703,59,55,35,0);
INSERT INTO "OrderDetails" VALUES(10703,73,15,35,0);
INSERT INTO "OrderDetails" VALUES(10704,4,22,6,0);
INSERT INTO "OrderDetails" VALUES(10704,24,4.5,35,0);
INSERT INTO "OrderDetails" VALUES(10704,48,12.75,24,0);
INSERT INTO "OrderDetails" VALUES(10705,31,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10705,32,32,4,0);
INSERT INTO "OrderDetails" VALUES(10706,16,17.45,20,0);
INSERT INTO "OrderDetails" VALUES(10706,43,46,24,0);
INSERT INTO "OrderDetails" VALUES(10706,59,55,8,0);
INSERT INTO "OrderDetails" VALUES(10707,55,24,21,0);
INSERT INTO "OrderDetails" VALUES(10707,57,19.5,40,0);
INSERT INTO "OrderDetails" VALUES(10707,70,15,28,0.15);
INSERT INTO "OrderDetails" VALUES(10708,5,21.35,4,0);
INSERT INTO "OrderDetails" VALUES(10708,36,19,5,0);
INSERT INTO "OrderDetails" VALUES(10709,8,40,40,0);
INSERT INTO "OrderDetails" VALUES(10709,51,53,28,0);
INSERT INTO "OrderDetails" VALUES(10709,60,34,10,0);
INSERT INTO "OrderDetails" VALUES(10710,19,9.2,5,0);
INSERT INTO "OrderDetails" VALUES(10710,47,9.5,5,0);
INSERT INTO "OrderDetails" VALUES(10711,19,9.2,12,0);
INSERT INTO "OrderDetails" VALUES(10711,41,9.65,42,0);
INSERT INTO "OrderDetails" VALUES(10711,53,32.8,120,0);
INSERT INTO "OrderDetails" VALUES(10712,53,32.8,3,0.05);
INSERT INTO "OrderDetails" VALUES(10712,56,38,30,0);
INSERT INTO "OrderDetails" VALUES(10713,10,31,18,0);
INSERT INTO "OrderDetails" VALUES(10713,26,31.23,30,0);
INSERT INTO "OrderDetails" VALUES(10713,45,9.5,110,0);
INSERT INTO "OrderDetails" VALUES(10713,46,12,24,0);
INSERT INTO "OrderDetails" VALUES(10714,2,19,30,0.25);
INSERT INTO "OrderDetails" VALUES(10714,17,39,27,0.25);
INSERT INTO "OrderDetails" VALUES(10714,47,9.5,50,0.25);
INSERT INTO "OrderDetails" VALUES(10714,56,38,18,0.25);
INSERT INTO "OrderDetails" VALUES(10714,58,13.25,12,0.25);
INSERT INTO "OrderDetails" VALUES(10715,10,31,21,0);
INSERT INTO "OrderDetails" VALUES(10715,71,21.5,30,0);
INSERT INTO "OrderDetails" VALUES(10716,21,10,5,0);
INSERT INTO "OrderDetails" VALUES(10716,51,53,7,0);
INSERT INTO "OrderDetails" VALUES(10716,61,28.5,10,0);
INSERT INTO "OrderDetails" VALUES(10717,21,10,32,0.05);
INSERT INTO "OrderDetails" VALUES(10717,54,7.45,15,0);
INSERT INTO "OrderDetails" VALUES(10717,69,36,25,0.05);
INSERT INTO "OrderDetails" VALUES(10718,12,38,36,0);
INSERT INTO "OrderDetails" VALUES(10718,16,17.45,20,0);
INSERT INTO "OrderDetails" VALUES(10718,36,19,40,0);
INSERT INTO "OrderDetails" VALUES(10718,62,49.3,20,0);
INSERT INTO "OrderDetails" VALUES(10719,18,62.5,12,0.25);
INSERT INTO "OrderDetails" VALUES(10719,30,25.89,3,0.25);
INSERT INTO "OrderDetails" VALUES(10719,54,7.45,40,0.25);
INSERT INTO "OrderDetails" VALUES(10720,35,18,21,0);
INSERT INTO "OrderDetails" VALUES(10720,71,21.5,8,0);
INSERT INTO "OrderDetails" VALUES(10721,44,19.45,50,0.05);
INSERT INTO "OrderDetails" VALUES(10722,2,19,3,0);
INSERT INTO "OrderDetails" VALUES(10722,31,12.5,50,0);
INSERT INTO "OrderDetails" VALUES(10722,68,12.5,45,0);
INSERT INTO "OrderDetails" VALUES(10722,75,7.75,42,0);
INSERT INTO "OrderDetails" VALUES(10723,26,31.23,15,0);
INSERT INTO "OrderDetails" VALUES(10724,10,31,16,0);
INSERT INTO "OrderDetails" VALUES(10724,61,28.5,5,0);
INSERT INTO "OrderDetails" VALUES(10725,41,9.65,12,0);
INSERT INTO "OrderDetails" VALUES(10725,52,7,4,0);
INSERT INTO "OrderDetails" VALUES(10725,55,24,6,0);
INSERT INTO "OrderDetails" VALUES(10726,4,22,25,0);
INSERT INTO "OrderDetails" VALUES(10726,11,21,5,0);
INSERT INTO "OrderDetails" VALUES(10727,17,39,20,0.05);
INSERT INTO "OrderDetails" VALUES(10727,56,38,10,0.05);
INSERT INTO "OrderDetails" VALUES(10727,59,55,10,0.05);
INSERT INTO "OrderDetails" VALUES(10728,30,25.89,15,0);
INSERT INTO "OrderDetails" VALUES(10728,40,18.4,6,0);
INSERT INTO "OrderDetails" VALUES(10728,55,24,12,0);
INSERT INTO "OrderDetails" VALUES(10728,60,34,15,0);
INSERT INTO "OrderDetails" VALUES(10729,1,18,50,0);
INSERT INTO "OrderDetails" VALUES(10729,21,10,30,0);
INSERT INTO "OrderDetails" VALUES(10729,50,16.25,40,0);
INSERT INTO "OrderDetails" VALUES(10730,16,17.45,15,0.05);
INSERT INTO "OrderDetails" VALUES(10730,31,12.5,3,0.05);
INSERT INTO "OrderDetails" VALUES(10730,65,21.05,10,0.05);
INSERT INTO "OrderDetails" VALUES(10731,21,10,40,0.05);
INSERT INTO "OrderDetails" VALUES(10731,51,53,30,0.05);
INSERT INTO "OrderDetails" VALUES(10732,76,18,20,0);
INSERT INTO "OrderDetails" VALUES(10733,14,23.25,16,0);
INSERT INTO "OrderDetails" VALUES(10733,28,45.6,20,0);
INSERT INTO "OrderDetails" VALUES(10733,52,7,25,0);
INSERT INTO "OrderDetails" VALUES(10734,6,25,30,0);
INSERT INTO "OrderDetails" VALUES(10734,30,25.89,15,0);
INSERT INTO "OrderDetails" VALUES(10734,76,18,20,0);
INSERT INTO "OrderDetails" VALUES(10735,61,28.5,20,0.1);
INSERT INTO "OrderDetails" VALUES(10735,77,13,2,0.1);
INSERT INTO "OrderDetails" VALUES(10736,65,21.05,40,0);
INSERT INTO "OrderDetails" VALUES(10736,75,7.75,20,0);
INSERT INTO "OrderDetails" VALUES(10737,13,6,4,0);
INSERT INTO "OrderDetails" VALUES(10737,41,9.65,12,0);
INSERT INTO "OrderDetails" VALUES(10738,16,17.45,3,0);
INSERT INTO "OrderDetails" VALUES(10739,36,19,6,0);
INSERT INTO "OrderDetails" VALUES(10739,52,7,18,0);
INSERT INTO "OrderDetails" VALUES(10740,28,45.6,5,0.2);
INSERT INTO "OrderDetails" VALUES(10740,35,18,35,0.2);
INSERT INTO "OrderDetails" VALUES(10740,45,9.5,40,0.2);
INSERT INTO "OrderDetails" VALUES(10740,56,38,14,0.2);
INSERT INTO "OrderDetails" VALUES(10741,2,19,15,0.2);
INSERT INTO "OrderDetails" VALUES(10742,3,10,20,0);
INSERT INTO "OrderDetails" VALUES(10742,60,34,50,0);
INSERT INTO "OrderDetails" VALUES(10742,72,34.8,35,0);
INSERT INTO "OrderDetails" VALUES(10743,46,12,28,0.05);
INSERT INTO "OrderDetails" VALUES(10744,40,18.4,50,0.2);
INSERT INTO "OrderDetails" VALUES(10745,18,62.5,24,0);
INSERT INTO "OrderDetails" VALUES(10745,44,19.45,16,0);
INSERT INTO "OrderDetails" VALUES(10745,59,55,45,0);
INSERT INTO "OrderDetails" VALUES(10745,72,34.8,7,0);
INSERT INTO "OrderDetails" VALUES(10746,13,6,6,0);
INSERT INTO "OrderDetails" VALUES(10746,42,14,28,0);
INSERT INTO "OrderDetails" VALUES(10746,62,49.3,9,0);
INSERT INTO "OrderDetails" VALUES(10746,69,36,40,0);
INSERT INTO "OrderDetails" VALUES(10747,31,12.5,8,0);
INSERT INTO "OrderDetails" VALUES(10747,41,9.65,35,0);
INSERT INTO "OrderDetails" VALUES(10747,63,43.9,9,0);
INSERT INTO "OrderDetails" VALUES(10747,69,36,30,0);
INSERT INTO "OrderDetails" VALUES(10748,23,9,44,0);
INSERT INTO "OrderDetails" VALUES(10748,40,18.4,40,0);
INSERT INTO "OrderDetails" VALUES(10748,56,38,28,0);
INSERT INTO "OrderDetails" VALUES(10749,56,38,15,0);
INSERT INTO "OrderDetails" VALUES(10749,59,55,6,0);
INSERT INTO "OrderDetails" VALUES(10749,76,18,10,0);
INSERT INTO "OrderDetails" VALUES(10750,14,23.25,5,0.15);
INSERT INTO "OrderDetails" VALUES(10750,45,9.5,40,0.15);
INSERT INTO "OrderDetails" VALUES(10750,59,55,25,0.15);
INSERT INTO "OrderDetails" VALUES(10751,26,31.23,12,0.1);
INSERT INTO "OrderDetails" VALUES(10751,30,25.89,30,0);
INSERT INTO "OrderDetails" VALUES(10751,50,16.25,20,0.1);
INSERT INTO "OrderDetails" VALUES(10751,73,15,15,0);
INSERT INTO "OrderDetails" VALUES(10752,1,18,8,0);
INSERT INTO "OrderDetails" VALUES(10752,69,36,3,0);
INSERT INTO "OrderDetails" VALUES(10753,45,9.5,4,0);
INSERT INTO "OrderDetails" VALUES(10753,74,10,5,0);
INSERT INTO "OrderDetails" VALUES(10754,40,18.4,3,0);
INSERT INTO "OrderDetails" VALUES(10755,47,9.5,30,0.25);
INSERT INTO "OrderDetails" VALUES(10755,56,38,30,0.25);
INSERT INTO "OrderDetails" VALUES(10755,57,19.5,14,0.25);
INSERT INTO "OrderDetails" VALUES(10755,69,36,25,0.25);
INSERT INTO "OrderDetails" VALUES(10756,18,62.5,21,0.2);
INSERT INTO "OrderDetails" VALUES(10756,36,19,20,0.2);
INSERT INTO "OrderDetails" VALUES(10756,68,12.5,6,0.2);
INSERT INTO "OrderDetails" VALUES(10756,69,36,20,0.2);
INSERT INTO "OrderDetails" VALUES(10757,34,14,30,0);
INSERT INTO "OrderDetails" VALUES(10757,59,55,7,0);
INSERT INTO "OrderDetails" VALUES(10757,62,49.3,30,0);
INSERT INTO "OrderDetails" VALUES(10757,64,33.25,24,0);
INSERT INTO "OrderDetails" VALUES(10758,26,31.23,20,0);
INSERT INTO "OrderDetails" VALUES(10758,52,7,60,0);
INSERT INTO "OrderDetails" VALUES(10758,70,15,40,0);
INSERT INTO "OrderDetails" VALUES(10759,32,32,10,0);
INSERT INTO "OrderDetails" VALUES(10760,25,14,12,0.25);
INSERT INTO "OrderDetails" VALUES(10760,27,43.9,40,0);
INSERT INTO "OrderDetails" VALUES(10760,43,46,30,0.25);
INSERT INTO "OrderDetails" VALUES(10761,25,14,35,0.25);
INSERT INTO "OrderDetails" VALUES(10761,75,7.75,18,0);
INSERT INTO "OrderDetails" VALUES(10762,39,18,16,0);
INSERT INTO "OrderDetails" VALUES(10762,47,9.5,30,0);
INSERT INTO "OrderDetails" VALUES(10762,51,53,28,0);
INSERT INTO "OrderDetails" VALUES(10762,56,38,60,0);
INSERT INTO "OrderDetails" VALUES(10763,21,10,40,0);
INSERT INTO "OrderDetails" VALUES(10763,22,21,6,0);
INSERT INTO "OrderDetails" VALUES(10763,24,4.5,20,0);
INSERT INTO "OrderDetails" VALUES(10764,3,10,20,0.1);
INSERT INTO "OrderDetails" VALUES(10764,39,18,130,0.1);
INSERT INTO "OrderDetails" VALUES(10765,65,21.05,80,0.1);
INSERT INTO "OrderDetails" VALUES(10766,2,19,40,0);
INSERT INTO "OrderDetails" VALUES(10766,7,30,35,0);
INSERT INTO "OrderDetails" VALUES(10766,68,12.5,40,0);
INSERT INTO "OrderDetails" VALUES(10767,42,14,2,0);
INSERT INTO "OrderDetails" VALUES(10768,22,21,4,0);
INSERT INTO "OrderDetails" VALUES(10768,31,12.5,50,0);
INSERT INTO "OrderDetails" VALUES(10768,60,34,15,0);
INSERT INTO "OrderDetails" VALUES(10768,71,21.5,12,0);
INSERT INTO "OrderDetails" VALUES(10769,41,9.65,30,0.05);
INSERT INTO "OrderDetails" VALUES(10769,52,7,15,0.05);
INSERT INTO "OrderDetails" VALUES(10769,61,28.5,20,0);
INSERT INTO "OrderDetails" VALUES(10769,62,49.3,15,0);
INSERT INTO "OrderDetails" VALUES(10770,11,21,15,0.25);
INSERT INTO "OrderDetails" VALUES(10771,71,21.5,16,0);
INSERT INTO "OrderDetails" VALUES(10772,29,123.79,18,0);
INSERT INTO "OrderDetails" VALUES(10772,59,55,25,0);
INSERT INTO "OrderDetails" VALUES(10773,17,39,33,0);
INSERT INTO "OrderDetails" VALUES(10773,31,12.5,70,0.2);
INSERT INTO "OrderDetails" VALUES(10773,75,7.75,7,0.2);
INSERT INTO "OrderDetails" VALUES(10774,31,12.5,2,0.25);
INSERT INTO "OrderDetails" VALUES(10774,66,17,50,0);
INSERT INTO "OrderDetails" VALUES(10775,10,31,6,0);
INSERT INTO "OrderDetails" VALUES(10775,67,14,3,0);
INSERT INTO "OrderDetails" VALUES(10776,31,12.5,16,0.05);
INSERT INTO "OrderDetails" VALUES(10776,42,14,12,0.05);
INSERT INTO "OrderDetails" VALUES(10776,45,9.5,27,0.05);
INSERT INTO "OrderDetails" VALUES(10776,51,53,120,0.05);
INSERT INTO "OrderDetails" VALUES(10777,42,14,20,0.2);
INSERT INTO "OrderDetails" VALUES(10778,41,9.65,10,0);
INSERT INTO "OrderDetails" VALUES(10779,16,17.45,20,0);
INSERT INTO "OrderDetails" VALUES(10779,62,49.3,20,0);
INSERT INTO "OrderDetails" VALUES(10780,70,15,35,0);
INSERT INTO "OrderDetails" VALUES(10780,77,13,15,0);
INSERT INTO "OrderDetails" VALUES(10781,54,7.45,3,0.2);
INSERT INTO "OrderDetails" VALUES(10781,56,38,20,0.2);
INSERT INTO "OrderDetails" VALUES(10781,74,10,35,0);
INSERT INTO "OrderDetails" VALUES(10782,31,12.5,1,0);
INSERT INTO "OrderDetails" VALUES(10783,31,12.5,10,0);
INSERT INTO "OrderDetails" VALUES(10783,38,263.5,5,0);
INSERT INTO "OrderDetails" VALUES(10784,36,19,30,0);
INSERT INTO "OrderDetails" VALUES(10784,39,18,2,0.15);
INSERT INTO "OrderDetails" VALUES(10784,72,34.8,30,0.15);
INSERT INTO "OrderDetails" VALUES(10785,10,31,10,0);
INSERT INTO "OrderDetails" VALUES(10785,75,7.75,10,0);
INSERT INTO "OrderDetails" VALUES(10786,8,40,30,0.2);
INSERT INTO "OrderDetails" VALUES(10786,30,25.89,15,0.2);
INSERT INTO "OrderDetails" VALUES(10786,75,7.75,42,0.2);
INSERT INTO "OrderDetails" VALUES(10787,2,19,15,0.05);
INSERT INTO "OrderDetails" VALUES(10787,29,123.79,20,0.05);
INSERT INTO "OrderDetails" VALUES(10788,19,9.2,50,0.05);
INSERT INTO "OrderDetails" VALUES(10788,75,7.75,40,0.05);
INSERT INTO "OrderDetails" VALUES(10789,18,62.5,30,0);
INSERT INTO "OrderDetails" VALUES(10789,35,18,15,0);
INSERT INTO "OrderDetails" VALUES(10789,63,43.9,30,0);
INSERT INTO "OrderDetails" VALUES(10789,68,12.5,18,0);
INSERT INTO "OrderDetails" VALUES(10790,7,30,3,0.15);
INSERT INTO "OrderDetails" VALUES(10790,56,38,20,0.15);
INSERT INTO "OrderDetails" VALUES(10791,29,123.79,14,0.05);
INSERT INTO "OrderDetails" VALUES(10791,41,9.65,20,0.05);
INSERT INTO "OrderDetails" VALUES(10792,2,19,10,0);
INSERT INTO "OrderDetails" VALUES(10792,54,7.45,3,0);
INSERT INTO "OrderDetails" VALUES(10792,68,12.5,15,0);
INSERT INTO "OrderDetails" VALUES(10793,41,9.65,14,0);
INSERT INTO "OrderDetails" VALUES(10793,52,7,8,0);
INSERT INTO "OrderDetails" VALUES(10794,14,23.25,15,0.2);
INSERT INTO "OrderDetails" VALUES(10794,54,7.45,6,0.2);
INSERT INTO "OrderDetails" VALUES(10795,16,17.45,65,0);
INSERT INTO "OrderDetails" VALUES(10795,17,39,35,0.25);
INSERT INTO "OrderDetails" VALUES(10796,26,31.23,21,0.2);
INSERT INTO "OrderDetails" VALUES(10796,44,19.45,10,0);
INSERT INTO "OrderDetails" VALUES(10796,64,33.25,35,0.2);
INSERT INTO "OrderDetails" VALUES(10796,69,36,24,0.2);
INSERT INTO "OrderDetails" VALUES(10797,11,21,20,0);
INSERT INTO "OrderDetails" VALUES(10798,62,49.3,2,0);
INSERT INTO "OrderDetails" VALUES(10798,72,34.8,10,0);
INSERT INTO "OrderDetails" VALUES(10799,13,6,20,0.15);
INSERT INTO "OrderDetails" VALUES(10799,24,4.5,20,0.15);
INSERT INTO "OrderDetails" VALUES(10799,59,55,25,0);
INSERT INTO "OrderDetails" VALUES(10800,11,21,50,0.1);
INSERT INTO "OrderDetails" VALUES(10800,51,53,10,0.1);
INSERT INTO "OrderDetails" VALUES(10800,54,7.45,7,0.1);
INSERT INTO "OrderDetails" VALUES(10801,17,39,40,0.25);
INSERT INTO "OrderDetails" VALUES(10801,29,123.79,20,0.25);
INSERT INTO "OrderDetails" VALUES(10802,30,25.89,25,0.25);
INSERT INTO "OrderDetails" VALUES(10802,51,53,30,0.25);
INSERT INTO "OrderDetails" VALUES(10802,55,24,60,0.25);
INSERT INTO "OrderDetails" VALUES(10802,62,49.3,5,0.25);
INSERT INTO "OrderDetails" VALUES(10803,19,9.2,24,0.05);
INSERT INTO "OrderDetails" VALUES(10803,25,14,15,0.05);
INSERT INTO "OrderDetails" VALUES(10803,59,55,15,0.05);
INSERT INTO "OrderDetails" VALUES(10804,10,31,36,0);
INSERT INTO "OrderDetails" VALUES(10804,28,45.6,24,0);
INSERT INTO "OrderDetails" VALUES(10804,49,20,4,0.15);
INSERT INTO "OrderDetails" VALUES(10805,34,14,10,0);
INSERT INTO "OrderDetails" VALUES(10805,38,263.5,10,0);
INSERT INTO "OrderDetails" VALUES(10806,2,19,20,0.25);
INSERT INTO "OrderDetails" VALUES(10806,65,21.05,2,0);
INSERT INTO "OrderDetails" VALUES(10806,74,10,15,0.25);
INSERT INTO "OrderDetails" VALUES(10807,40,18.4,1,0);
INSERT INTO "OrderDetails" VALUES(10808,56,38,20,0.15);
INSERT INTO "OrderDetails" VALUES(10808,76,18,50,0.15);
INSERT INTO "OrderDetails" VALUES(10809,52,7,20,0);
INSERT INTO "OrderDetails" VALUES(10810,13,6,7,0);
INSERT INTO "OrderDetails" VALUES(10810,25,14,5,0);
INSERT INTO "OrderDetails" VALUES(10810,70,15,5,0);
INSERT INTO "OrderDetails" VALUES(10811,19,9.2,15,0);
INSERT INTO "OrderDetails" VALUES(10811,23,9,18,0);
INSERT INTO "OrderDetails" VALUES(10811,40,18.4,30,0);
INSERT INTO "OrderDetails" VALUES(10812,31,12.5,16,0.1);
INSERT INTO "OrderDetails" VALUES(10812,72,34.8,40,0.1);
INSERT INTO "OrderDetails" VALUES(10812,77,13,20,0);
INSERT INTO "OrderDetails" VALUES(10813,2,19,12,0.2);
INSERT INTO "OrderDetails" VALUES(10813,46,12,35,0);
INSERT INTO "OrderDetails" VALUES(10814,41,9.65,20,0);
INSERT INTO "OrderDetails" VALUES(10814,43,46,20,0.15);
INSERT INTO "OrderDetails" VALUES(10814,48,12.75,8,0.15);
INSERT INTO "OrderDetails" VALUES(10814,61,28.5,30,0.15);
INSERT INTO "OrderDetails" VALUES(10815,33,2.5,16,0);
INSERT INTO "OrderDetails" VALUES(10816,38,263.5,30,0.05);
INSERT INTO "OrderDetails" VALUES(10816,62,49.3,20,0.05);
INSERT INTO "OrderDetails" VALUES(10817,26,31.23,40,0.15);
INSERT INTO "OrderDetails" VALUES(10817,38,263.5,30,0);
INSERT INTO "OrderDetails" VALUES(10817,40,18.4,60,0.15);
INSERT INTO "OrderDetails" VALUES(10817,62,49.3,25,0.15);
INSERT INTO "OrderDetails" VALUES(10818,32,32,20,0);
INSERT INTO "OrderDetails" VALUES(10818,41,9.65,20,0);
INSERT INTO "OrderDetails" VALUES(10819,43,46,7,0);
INSERT INTO "OrderDetails" VALUES(10819,75,7.75,20,0);
INSERT INTO "OrderDetails" VALUES(10820,56,38,30,0);
INSERT INTO "OrderDetails" VALUES(10821,35,18,20,0);
INSERT INTO "OrderDetails" VALUES(10821,51,53,6,0);
INSERT INTO "OrderDetails" VALUES(10822,62,49.3,3,0);
INSERT INTO "OrderDetails" VALUES(10822,70,15,6,0);
INSERT INTO "OrderDetails" VALUES(10823,11,21,20,0.1);
INSERT INTO "OrderDetails" VALUES(10823,57,19.5,15,0);
INSERT INTO "OrderDetails" VALUES(10823,59,55,40,0.1);
INSERT INTO "OrderDetails" VALUES(10823,77,13,15,0.1);
INSERT INTO "OrderDetails" VALUES(10824,41,9.65,12,0);
INSERT INTO "OrderDetails" VALUES(10824,70,15,9,0);
INSERT INTO "OrderDetails" VALUES(10825,26,31.23,12,0);
INSERT INTO "OrderDetails" VALUES(10825,53,32.8,20,0);
INSERT INTO "OrderDetails" VALUES(10826,31,12.5,35,0);
INSERT INTO "OrderDetails" VALUES(10826,57,19.5,15,0);
INSERT INTO "OrderDetails" VALUES(10827,10,31,15,0);
INSERT INTO "OrderDetails" VALUES(10827,39,18,21,0);
INSERT INTO "OrderDetails" VALUES(10828,20,81,5,0);
INSERT INTO "OrderDetails" VALUES(10828,38,263.5,2,0);
INSERT INTO "OrderDetails" VALUES(10829,2,19,10,0);
INSERT INTO "OrderDetails" VALUES(10829,8,40,20,0);
INSERT INTO "OrderDetails" VALUES(10829,13,6,10,0);
INSERT INTO "OrderDetails" VALUES(10829,60,34,21,0);
INSERT INTO "OrderDetails" VALUES(10830,6,25,6,0);
INSERT INTO "OrderDetails" VALUES(10830,39,18,28,0);
INSERT INTO "OrderDetails" VALUES(10830,60,34,30,0);
INSERT INTO "OrderDetails" VALUES(10830,68,12.5,24,0);
INSERT INTO "OrderDetails" VALUES(10831,19,9.2,2,0);
INSERT INTO "OrderDetails" VALUES(10831,35,18,8,0);
INSERT INTO "OrderDetails" VALUES(10831,38,263.5,8,0);
INSERT INTO "OrderDetails" VALUES(10831,43,46,9,0);
INSERT INTO "OrderDetails" VALUES(10832,13,6,3,0.2);
INSERT INTO "OrderDetails" VALUES(10832,25,14,10,0.2);
INSERT INTO "OrderDetails" VALUES(10832,44,19.45,16,0.2);
INSERT INTO "OrderDetails" VALUES(10832,64,33.25,3,0);
INSERT INTO "OrderDetails" VALUES(10833,7,30,20,0.1);
INSERT INTO "OrderDetails" VALUES(10833,31,12.5,9,0.1);
INSERT INTO "OrderDetails" VALUES(10833,53,32.8,9,0.1);
INSERT INTO "OrderDetails" VALUES(10834,29,123.79,8,0.05);
INSERT INTO "OrderDetails" VALUES(10834,30,25.89,20,0.05);
INSERT INTO "OrderDetails" VALUES(10835,59,55,15,0);
INSERT INTO "OrderDetails" VALUES(10835,77,13,2,0.2);
INSERT INTO "OrderDetails" VALUES(10836,22,21,52,0);
INSERT INTO "OrderDetails" VALUES(10836,35,18,6,0);
INSERT INTO "OrderDetails" VALUES(10836,57,19.5,24,0);
INSERT INTO "OrderDetails" VALUES(10836,60,34,60,0);
INSERT INTO "OrderDetails" VALUES(10836,64,33.25,30,0);
INSERT INTO "OrderDetails" VALUES(10837,13,6,6,0);
INSERT INTO "OrderDetails" VALUES(10837,40,18.4,25,0);
INSERT INTO "OrderDetails" VALUES(10837,47,9.5,40,0.25);
INSERT INTO "OrderDetails" VALUES(10837,76,18,21,0.25);
INSERT INTO "OrderDetails" VALUES(10838,1,18,4,0.25);
INSERT INTO "OrderDetails" VALUES(10838,18,62.5,25,0.25);
INSERT INTO "OrderDetails" VALUES(10838,36,19,50,0.25);
INSERT INTO "OrderDetails" VALUES(10839,58,13.25,30,0.1);
INSERT INTO "OrderDetails" VALUES(10839,72,34.8,15,0.1);
INSERT INTO "OrderDetails" VALUES(10840,25,14,6,0.2);
INSERT INTO "OrderDetails" VALUES(10840,39,18,10,0.2);
INSERT INTO "OrderDetails" VALUES(10841,10,31,16,0);
INSERT INTO "OrderDetails" VALUES(10841,56,38,30,0);
INSERT INTO "OrderDetails" VALUES(10841,59,55,50,0);
INSERT INTO "OrderDetails" VALUES(10841,77,13,15,0);
INSERT INTO "OrderDetails" VALUES(10842,11,21,15,0);
INSERT INTO "OrderDetails" VALUES(10842,43,46,5,0);
INSERT INTO "OrderDetails" VALUES(10842,68,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10842,70,15,12,0);
INSERT INTO "OrderDetails" VALUES(10843,51,53,4,0.25);
INSERT INTO "OrderDetails" VALUES(10844,22,21,35,0);
INSERT INTO "OrderDetails" VALUES(10845,23,9,70,0.1);
INSERT INTO "OrderDetails" VALUES(10845,35,18,25,0.1);
INSERT INTO "OrderDetails" VALUES(10845,42,14,42,0.1);
INSERT INTO "OrderDetails" VALUES(10845,58,13.25,60,0.1);
INSERT INTO "OrderDetails" VALUES(10845,64,33.25,48,0);
INSERT INTO "OrderDetails" VALUES(10846,4,22,21,0);
INSERT INTO "OrderDetails" VALUES(10846,70,15,30,0);
INSERT INTO "OrderDetails" VALUES(10846,74,10,20,0);
INSERT INTO "OrderDetails" VALUES(10847,1,18,80,0.2);
INSERT INTO "OrderDetails" VALUES(10847,19,9.2,12,0.2);
INSERT INTO "OrderDetails" VALUES(10847,37,26,60,0.2);
INSERT INTO "OrderDetails" VALUES(10847,45,9.5,36,0.2);
INSERT INTO "OrderDetails" VALUES(10847,60,34,45,0.2);
INSERT INTO "OrderDetails" VALUES(10847,71,21.5,55,0.2);
INSERT INTO "OrderDetails" VALUES(10848,5,21.35,30,0);
INSERT INTO "OrderDetails" VALUES(10848,9,97,3,0);
INSERT INTO "OrderDetails" VALUES(10849,3,10,49,0);
INSERT INTO "OrderDetails" VALUES(10849,26,31.23,18,0.15);
INSERT INTO "OrderDetails" VALUES(10850,25,14,20,0.15);
INSERT INTO "OrderDetails" VALUES(10850,33,2.5,4,0.15);
INSERT INTO "OrderDetails" VALUES(10850,70,15,30,0.15);
INSERT INTO "OrderDetails" VALUES(10851,2,19,5,0.05);
INSERT INTO "OrderDetails" VALUES(10851,25,14,10,0.05);
INSERT INTO "OrderDetails" VALUES(10851,57,19.5,10,0.05);
INSERT INTO "OrderDetails" VALUES(10851,59,55,42,0.05);
INSERT INTO "OrderDetails" VALUES(10852,2,19,15,0);
INSERT INTO "OrderDetails" VALUES(10852,17,39,6,0);
INSERT INTO "OrderDetails" VALUES(10852,62,49.3,50,0);
INSERT INTO "OrderDetails" VALUES(10853,18,62.5,10,0);
INSERT INTO "OrderDetails" VALUES(10854,10,31,100,0.15);
INSERT INTO "OrderDetails" VALUES(10854,13,6,65,0.15);
INSERT INTO "OrderDetails" VALUES(10855,16,17.45,50,0);
INSERT INTO "OrderDetails" VALUES(10855,31,12.5,14,0);
INSERT INTO "OrderDetails" VALUES(10855,56,38,24,0);
INSERT INTO "OrderDetails" VALUES(10855,65,21.05,15,0.15);
INSERT INTO "OrderDetails" VALUES(10856,2,19,20,0);
INSERT INTO "OrderDetails" VALUES(10856,42,14,20,0);
INSERT INTO "OrderDetails" VALUES(10857,3,10,30,0);
INSERT INTO "OrderDetails" VALUES(10857,26,31.23,35,0.25);
INSERT INTO "OrderDetails" VALUES(10857,29,123.79,10,0.25);
INSERT INTO "OrderDetails" VALUES(10858,7,30,5,0);
INSERT INTO "OrderDetails" VALUES(10858,27,43.9,10,0);
INSERT INTO "OrderDetails" VALUES(10858,70,15,4,0);
INSERT INTO "OrderDetails" VALUES(10859,24,4.5,40,0.25);
INSERT INTO "OrderDetails" VALUES(10859,54,7.45,35,0.25);
INSERT INTO "OrderDetails" VALUES(10859,64,33.25,30,0.25);
INSERT INTO "OrderDetails" VALUES(10860,51,53,3,0);
INSERT INTO "OrderDetails" VALUES(10860,76,18,20,0);
INSERT INTO "OrderDetails" VALUES(10861,17,39,42,0);
INSERT INTO "OrderDetails" VALUES(10861,18,62.5,20,0);
INSERT INTO "OrderDetails" VALUES(10861,21,10,40,0);
INSERT INTO "OrderDetails" VALUES(10861,33,2.5,35,0);
INSERT INTO "OrderDetails" VALUES(10861,62,49.3,3,0);
INSERT INTO "OrderDetails" VALUES(10862,11,21,25,0);
INSERT INTO "OrderDetails" VALUES(10862,52,7,8,0);
INSERT INTO "OrderDetails" VALUES(10863,1,18,20,0.15);
INSERT INTO "OrderDetails" VALUES(10863,58,13.25,12,0.15);
INSERT INTO "OrderDetails" VALUES(10864,35,18,4,0);
INSERT INTO "OrderDetails" VALUES(10864,67,14,15,0);
INSERT INTO "OrderDetails" VALUES(10865,38,263.5,60,0.05);
INSERT INTO "OrderDetails" VALUES(10865,39,18,80,0.05);
INSERT INTO "OrderDetails" VALUES(10866,2,19,21,0.25);
INSERT INTO "OrderDetails" VALUES(10866,24,4.5,6,0.25);
INSERT INTO "OrderDetails" VALUES(10866,30,25.89,40,0.25);
INSERT INTO "OrderDetails" VALUES(10867,53,32.8,3,0);
INSERT INTO "OrderDetails" VALUES(10868,26,31.23,20,0);
INSERT INTO "OrderDetails" VALUES(10868,35,18,30,0);
INSERT INTO "OrderDetails" VALUES(10868,49,20,42,0.1);
INSERT INTO "OrderDetails" VALUES(10869,1,18,40,0);
INSERT INTO "OrderDetails" VALUES(10869,11,21,10,0);
INSERT INTO "OrderDetails" VALUES(10869,23,9,50,0);
INSERT INTO "OrderDetails" VALUES(10869,68,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10870,35,18,3,0);
INSERT INTO "OrderDetails" VALUES(10870,51,53,2,0);
INSERT INTO "OrderDetails" VALUES(10871,6,25,50,0.05);
INSERT INTO "OrderDetails" VALUES(10871,16,17.45,12,0.05);
INSERT INTO "OrderDetails" VALUES(10871,17,39,16,0.05);
INSERT INTO "OrderDetails" VALUES(10872,55,24,10,0.05);
INSERT INTO "OrderDetails" VALUES(10872,62,49.3,20,0.05);
INSERT INTO "OrderDetails" VALUES(10872,64,33.25,15,0.05);
INSERT INTO "OrderDetails" VALUES(10872,65,21.05,21,0.05);
INSERT INTO "OrderDetails" VALUES(10873,21,10,20,0);
INSERT INTO "OrderDetails" VALUES(10873,28,45.6,3,0);
INSERT INTO "OrderDetails" VALUES(10874,10,31,10,0);
INSERT INTO "OrderDetails" VALUES(10875,19,9.2,25,0);
INSERT INTO "OrderDetails" VALUES(10875,47,9.5,21,0.1);
INSERT INTO "OrderDetails" VALUES(10875,49,20,15,0);
INSERT INTO "OrderDetails" VALUES(10876,46,12,21,0);
INSERT INTO "OrderDetails" VALUES(10876,64,33.25,20,0);
INSERT INTO "OrderDetails" VALUES(10877,16,17.45,30,0.25);
INSERT INTO "OrderDetails" VALUES(10877,18,62.5,25,0);
INSERT INTO "OrderDetails" VALUES(10878,20,81,20,0.05);
INSERT INTO "OrderDetails" VALUES(10879,40,18.4,12,0);
INSERT INTO "OrderDetails" VALUES(10879,65,21.05,10,0);
INSERT INTO "OrderDetails" VALUES(10879,76,18,10,0);
INSERT INTO "OrderDetails" VALUES(10880,23,9,30,0.2);
INSERT INTO "OrderDetails" VALUES(10880,61,28.5,30,0.2);
INSERT INTO "OrderDetails" VALUES(10880,70,15,50,0.2);
INSERT INTO "OrderDetails" VALUES(10881,73,15,10,0);
INSERT INTO "OrderDetails" VALUES(10882,42,14,25,0);
INSERT INTO "OrderDetails" VALUES(10882,49,20,20,0.15);
INSERT INTO "OrderDetails" VALUES(10882,54,7.45,32,0.15);
INSERT INTO "OrderDetails" VALUES(10883,24,4.5,8,0);
INSERT INTO "OrderDetails" VALUES(10884,21,10,40,0.05);
INSERT INTO "OrderDetails" VALUES(10884,56,38,21,0.05);
INSERT INTO "OrderDetails" VALUES(10884,65,21.05,12,0.05);
INSERT INTO "OrderDetails" VALUES(10885,2,19,20,0);
INSERT INTO "OrderDetails" VALUES(10885,24,4.5,12,0);
INSERT INTO "OrderDetails" VALUES(10885,70,15,30,0);
INSERT INTO "OrderDetails" VALUES(10885,77,13,25,0);
INSERT INTO "OrderDetails" VALUES(10886,10,31,70,0);
INSERT INTO "OrderDetails" VALUES(10886,31,12.5,35,0);
INSERT INTO "OrderDetails" VALUES(10886,77,13,40,0);
INSERT INTO "OrderDetails" VALUES(10887,25,14,5,0);
INSERT INTO "OrderDetails" VALUES(10888,2,19,20,0);
INSERT INTO "OrderDetails" VALUES(10888,68,12.5,18,0);
INSERT INTO "OrderDetails" VALUES(10889,11,21,40,0);
INSERT INTO "OrderDetails" VALUES(10889,38,263.5,40,0);
INSERT INTO "OrderDetails" VALUES(10890,17,39,15,0);
INSERT INTO "OrderDetails" VALUES(10890,34,14,10,0);
INSERT INTO "OrderDetails" VALUES(10890,41,9.65,14,0);
INSERT INTO "OrderDetails" VALUES(10891,30,25.89,15,0.05);
INSERT INTO "OrderDetails" VALUES(10892,59,55,40,0.05);
INSERT INTO "OrderDetails" VALUES(10893,8,40,30,0);
INSERT INTO "OrderDetails" VALUES(10893,24,4.5,10,0);
INSERT INTO "OrderDetails" VALUES(10893,29,123.79,24,0);
INSERT INTO "OrderDetails" VALUES(10893,30,25.89,35,0);
INSERT INTO "OrderDetails" VALUES(10893,36,19,20,0);
INSERT INTO "OrderDetails" VALUES(10894,13,6,28,0.05);
INSERT INTO "OrderDetails" VALUES(10894,69,36,50,0.05);
INSERT INTO "OrderDetails" VALUES(10894,75,7.75,120,0.05);
INSERT INTO "OrderDetails" VALUES(10895,24,4.5,110,0);
INSERT INTO "OrderDetails" VALUES(10895,39,18,45,0);
INSERT INTO "OrderDetails" VALUES(10895,40,18.4,91,0);
INSERT INTO "OrderDetails" VALUES(10895,60,34,100,0);
INSERT INTO "OrderDetails" VALUES(10896,45,9.5,15,0);
INSERT INTO "OrderDetails" VALUES(10896,56,38,16,0);
INSERT INTO "OrderDetails" VALUES(10897,29,123.79,80,0);
INSERT INTO "OrderDetails" VALUES(10897,30,25.89,36,0);
INSERT INTO "OrderDetails" VALUES(10898,13,6,5,0);
INSERT INTO "OrderDetails" VALUES(10899,39,18,8,0.15);
INSERT INTO "OrderDetails" VALUES(10900,70,15,3,0.25);
INSERT INTO "OrderDetails" VALUES(10901,41,9.65,30,0);
INSERT INTO "OrderDetails" VALUES(10901,71,21.5,30,0);
INSERT INTO "OrderDetails" VALUES(10902,55,24,30,0.15);
INSERT INTO "OrderDetails" VALUES(10902,62,49.3,6,0.15);
INSERT INTO "OrderDetails" VALUES(10903,13,6,40,0);
INSERT INTO "OrderDetails" VALUES(10903,65,21.05,21,0);
INSERT INTO "OrderDetails" VALUES(10903,68,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(10904,58,13.25,15,0);
INSERT INTO "OrderDetails" VALUES(10904,62,49.3,35,0);
INSERT INTO "OrderDetails" VALUES(10905,1,18,20,0.05);
INSERT INTO "OrderDetails" VALUES(10906,61,28.5,15,0);
INSERT INTO "OrderDetails" VALUES(10907,75,7.75,14,0);
INSERT INTO "OrderDetails" VALUES(10908,7,30,20,0.05);
INSERT INTO "OrderDetails" VALUES(10908,52,7,14,0.05);
INSERT INTO "OrderDetails" VALUES(10909,7,30,12,0);
INSERT INTO "OrderDetails" VALUES(10909,16,17.45,15,0);
INSERT INTO "OrderDetails" VALUES(10909,41,9.65,5,0);
INSERT INTO "OrderDetails" VALUES(10910,19,9.2,12,0);
INSERT INTO "OrderDetails" VALUES(10910,49,20,10,0);
INSERT INTO "OrderDetails" VALUES(10910,61,28.5,5,0);
INSERT INTO "OrderDetails" VALUES(10911,1,18,10,0);
INSERT INTO "OrderDetails" VALUES(10911,17,39,12,0);
INSERT INTO "OrderDetails" VALUES(10911,67,14,15,0);
INSERT INTO "OrderDetails" VALUES(10912,11,21,40,0.25);
INSERT INTO "OrderDetails" VALUES(10912,29,123.79,60,0.25);
INSERT INTO "OrderDetails" VALUES(10913,4,22,30,0.25);
INSERT INTO "OrderDetails" VALUES(10913,33,2.5,40,0.25);
INSERT INTO "OrderDetails" VALUES(10913,58,13.25,15,0);
INSERT INTO "OrderDetails" VALUES(10914,71,21.5,25,0);
INSERT INTO "OrderDetails" VALUES(10915,17,39,10,0);
INSERT INTO "OrderDetails" VALUES(10915,33,2.5,30,0);
INSERT INTO "OrderDetails" VALUES(10915,54,7.45,10,0);
INSERT INTO "OrderDetails" VALUES(10916,16,17.45,6,0);
INSERT INTO "OrderDetails" VALUES(10916,32,32,6,0);
INSERT INTO "OrderDetails" VALUES(10916,57,19.5,20,0);
INSERT INTO "OrderDetails" VALUES(10917,30,25.89,1,0);
INSERT INTO "OrderDetails" VALUES(10917,60,34,10,0);
INSERT INTO "OrderDetails" VALUES(10918,1,18,60,0.25);
INSERT INTO "OrderDetails" VALUES(10918,60,34,25,0.25);
INSERT INTO "OrderDetails" VALUES(10919,16,17.45,24,0);
INSERT INTO "OrderDetails" VALUES(10919,25,14,24,0);
INSERT INTO "OrderDetails" VALUES(10919,40,18.4,20,0);
INSERT INTO "OrderDetails" VALUES(10920,50,16.25,24,0);
INSERT INTO "OrderDetails" VALUES(10921,35,18,10,0);
INSERT INTO "OrderDetails" VALUES(10921,63,43.9,40,0);
INSERT INTO "OrderDetails" VALUES(10922,17,39,15,0);
INSERT INTO "OrderDetails" VALUES(10922,24,4.5,35,0);
INSERT INTO "OrderDetails" VALUES(10923,42,14,10,0.2);
INSERT INTO "OrderDetails" VALUES(10923,43,46,10,0.2);
INSERT INTO "OrderDetails" VALUES(10923,67,14,24,0.2);
INSERT INTO "OrderDetails" VALUES(10924,10,31,20,0.1);
INSERT INTO "OrderDetails" VALUES(10924,28,45.6,30,0.1);
INSERT INTO "OrderDetails" VALUES(10924,75,7.75,6,0);
INSERT INTO "OrderDetails" VALUES(10925,36,19,25,0.15);
INSERT INTO "OrderDetails" VALUES(10925,52,7,12,0.15);
INSERT INTO "OrderDetails" VALUES(10926,11,21,2,0);
INSERT INTO "OrderDetails" VALUES(10926,13,6,10,0);
INSERT INTO "OrderDetails" VALUES(10926,19,9.2,7,0);
INSERT INTO "OrderDetails" VALUES(10926,72,34.8,10,0);
INSERT INTO "OrderDetails" VALUES(10927,20,81,5,0);
INSERT INTO "OrderDetails" VALUES(10927,52,7,5,0);
INSERT INTO "OrderDetails" VALUES(10927,76,18,20,0);
INSERT INTO "OrderDetails" VALUES(10928,47,9.5,5,0);
INSERT INTO "OrderDetails" VALUES(10928,76,18,5,0);
INSERT INTO "OrderDetails" VALUES(10929,21,10,60,0);
INSERT INTO "OrderDetails" VALUES(10929,75,7.75,49,0);
INSERT INTO "OrderDetails" VALUES(10929,77,13,15,0);
INSERT INTO "OrderDetails" VALUES(10930,21,10,36,0);
INSERT INTO "OrderDetails" VALUES(10930,27,43.9,25,0);
INSERT INTO "OrderDetails" VALUES(10930,55,24,25,0.2);
INSERT INTO "OrderDetails" VALUES(10930,58,13.25,30,0.2);
INSERT INTO "OrderDetails" VALUES(10931,13,6,42,0.15);
INSERT INTO "OrderDetails" VALUES(10931,57,19.5,30,0);
INSERT INTO "OrderDetails" VALUES(10932,16,17.45,30,0.1);
INSERT INTO "OrderDetails" VALUES(10932,62,49.3,14,0.1);
INSERT INTO "OrderDetails" VALUES(10932,72,34.8,16,0);
INSERT INTO "OrderDetails" VALUES(10932,75,7.75,20,0.1);
INSERT INTO "OrderDetails" VALUES(10933,53,32.8,2,0);
INSERT INTO "OrderDetails" VALUES(10933,61,28.5,30,0);
INSERT INTO "OrderDetails" VALUES(10934,6,25,20,0);
INSERT INTO "OrderDetails" VALUES(10935,1,18,21,0);
INSERT INTO "OrderDetails" VALUES(10935,18,62.5,4,0.25);
INSERT INTO "OrderDetails" VALUES(10935,23,9,8,0.25);
INSERT INTO "OrderDetails" VALUES(10936,36,19,30,0.2);
INSERT INTO "OrderDetails" VALUES(10937,28,45.6,8,0);
INSERT INTO "OrderDetails" VALUES(10937,34,14,20,0);
INSERT INTO "OrderDetails" VALUES(10938,13,6,20,0.25);
INSERT INTO "OrderDetails" VALUES(10938,43,46,24,0.25);
INSERT INTO "OrderDetails" VALUES(10938,60,34,49,0.25);
INSERT INTO "OrderDetails" VALUES(10938,71,21.5,35,0.25);
INSERT INTO "OrderDetails" VALUES(10939,2,19,10,0.15);
INSERT INTO "OrderDetails" VALUES(10939,67,14,40,0.15);
INSERT INTO "OrderDetails" VALUES(10940,7,30,8,0);
INSERT INTO "OrderDetails" VALUES(10940,13,6,20,0);
INSERT INTO "OrderDetails" VALUES(10941,31,12.5,44,0.25);
INSERT INTO "OrderDetails" VALUES(10941,62,49.3,30,0.25);
INSERT INTO "OrderDetails" VALUES(10941,68,12.5,80,0.25);
INSERT INTO "OrderDetails" VALUES(10941,72,34.8,50,0);
INSERT INTO "OrderDetails" VALUES(10942,49,20,28,0);
INSERT INTO "OrderDetails" VALUES(10943,13,6,15,0);
INSERT INTO "OrderDetails" VALUES(10943,22,21,21,0);
INSERT INTO "OrderDetails" VALUES(10943,46,12,15,0);
INSERT INTO "OrderDetails" VALUES(10944,11,21,5,0.25);
INSERT INTO "OrderDetails" VALUES(10944,44,19.45,18,0.25);
INSERT INTO "OrderDetails" VALUES(10944,56,38,18,0);
INSERT INTO "OrderDetails" VALUES(10945,13,6,20,0);
INSERT INTO "OrderDetails" VALUES(10945,31,12.5,10,0);
INSERT INTO "OrderDetails" VALUES(10946,10,31,25,0);
INSERT INTO "OrderDetails" VALUES(10946,24,4.5,25,0);
INSERT INTO "OrderDetails" VALUES(10946,77,13,40,0);
INSERT INTO "OrderDetails" VALUES(10947,59,55,4,0);
INSERT INTO "OrderDetails" VALUES(10948,50,16.25,9,0);
INSERT INTO "OrderDetails" VALUES(10948,51,53,40,0);
INSERT INTO "OrderDetails" VALUES(10948,55,24,4,0);
INSERT INTO "OrderDetails" VALUES(10949,6,25,12,0);
INSERT INTO "OrderDetails" VALUES(10949,10,31,30,0);
INSERT INTO "OrderDetails" VALUES(10949,17,39,6,0);
INSERT INTO "OrderDetails" VALUES(10949,62,49.3,60,0);
INSERT INTO "OrderDetails" VALUES(10950,4,22,5,0);
INSERT INTO "OrderDetails" VALUES(10951,33,2.5,15,0.05);
INSERT INTO "OrderDetails" VALUES(10951,41,9.65,6,0.05);
INSERT INTO "OrderDetails" VALUES(10951,75,7.75,50,0.05);
INSERT INTO "OrderDetails" VALUES(10952,6,25,16,0.05);
INSERT INTO "OrderDetails" VALUES(10952,28,45.6,2,0);
INSERT INTO "OrderDetails" VALUES(10953,20,81,50,0.05);
INSERT INTO "OrderDetails" VALUES(10953,31,12.5,50,0.05);
INSERT INTO "OrderDetails" VALUES(10954,16,17.45,28,0.15);
INSERT INTO "OrderDetails" VALUES(10954,31,12.5,25,0.15);
INSERT INTO "OrderDetails" VALUES(10954,45,9.5,30,0);
INSERT INTO "OrderDetails" VALUES(10954,60,34,24,0.15);
INSERT INTO "OrderDetails" VALUES(10955,75,7.75,12,0.2);
INSERT INTO "OrderDetails" VALUES(10956,21,10,12,0);
INSERT INTO "OrderDetails" VALUES(10956,47,9.5,14,0);
INSERT INTO "OrderDetails" VALUES(10956,51,53,8,0);
INSERT INTO "OrderDetails" VALUES(10957,30,25.89,30,0);
INSERT INTO "OrderDetails" VALUES(10957,35,18,40,0);
INSERT INTO "OrderDetails" VALUES(10957,64,33.25,8,0);
INSERT INTO "OrderDetails" VALUES(10958,5,21.35,20,0);
INSERT INTO "OrderDetails" VALUES(10958,7,30,6,0);
INSERT INTO "OrderDetails" VALUES(10958,72,34.8,5,0);
INSERT INTO "OrderDetails" VALUES(10959,75,7.75,20,0.15);
INSERT INTO "OrderDetails" VALUES(10960,24,4.5,10,0.25);
INSERT INTO "OrderDetails" VALUES(10960,41,9.65,24,0);
INSERT INTO "OrderDetails" VALUES(10961,52,7,6,0.05);
INSERT INTO "OrderDetails" VALUES(10961,76,18,60,0);
INSERT INTO "OrderDetails" VALUES(10962,7,30,45,0);
INSERT INTO "OrderDetails" VALUES(10962,13,6,77,0);
INSERT INTO "OrderDetails" VALUES(10962,53,32.8,20,0);
INSERT INTO "OrderDetails" VALUES(10962,69,36,9,0);
INSERT INTO "OrderDetails" VALUES(10962,76,18,44,0);
INSERT INTO "OrderDetails" VALUES(10963,60,34,2,0.15);
INSERT INTO "OrderDetails" VALUES(10964,18,62.5,6,0);
INSERT INTO "OrderDetails" VALUES(10964,38,263.5,5,0);
INSERT INTO "OrderDetails" VALUES(10964,69,36,10,0);
INSERT INTO "OrderDetails" VALUES(10965,51,53,16,0);
INSERT INTO "OrderDetails" VALUES(10966,37,26,8,0);
INSERT INTO "OrderDetails" VALUES(10966,56,38,12,0.15);
INSERT INTO "OrderDetails" VALUES(10966,62,49.3,12,0.15);
INSERT INTO "OrderDetails" VALUES(10967,19,9.2,12,0);
INSERT INTO "OrderDetails" VALUES(10967,49,20,40,0);
INSERT INTO "OrderDetails" VALUES(10968,12,38,30,0);
INSERT INTO "OrderDetails" VALUES(10968,24,4.5,30,0);
INSERT INTO "OrderDetails" VALUES(10968,64,33.25,4,0);
INSERT INTO "OrderDetails" VALUES(10969,46,12,9,0);
INSERT INTO "OrderDetails" VALUES(10970,52,7,40,0.2);
INSERT INTO "OrderDetails" VALUES(10971,29,123.79,14,0);
INSERT INTO "OrderDetails" VALUES(10972,17,39,6,0);
INSERT INTO "OrderDetails" VALUES(10972,33,2.5,7,0);
INSERT INTO "OrderDetails" VALUES(10973,26,31.23,5,0);
INSERT INTO "OrderDetails" VALUES(10973,41,9.65,6,0);
INSERT INTO "OrderDetails" VALUES(10973,75,7.75,10,0);
INSERT INTO "OrderDetails" VALUES(10974,63,43.9,10,0);
INSERT INTO "OrderDetails" VALUES(10975,8,40,16,0);
INSERT INTO "OrderDetails" VALUES(10975,75,7.75,10,0);
INSERT INTO "OrderDetails" VALUES(10976,28,45.6,20,0);
INSERT INTO "OrderDetails" VALUES(10977,39,18,30,0);
INSERT INTO "OrderDetails" VALUES(10977,47,9.5,30,0);
INSERT INTO "OrderDetails" VALUES(10977,51,53,10,0);
INSERT INTO "OrderDetails" VALUES(10977,63,43.9,20,0);
INSERT INTO "OrderDetails" VALUES(10978,8,40,20,0.15);
INSERT INTO "OrderDetails" VALUES(10978,21,10,40,0.15);
INSERT INTO "OrderDetails" VALUES(10978,40,18.4,10,0);
INSERT INTO "OrderDetails" VALUES(10978,44,19.45,6,0.15);
INSERT INTO "OrderDetails" VALUES(10979,7,30,18,0);
INSERT INTO "OrderDetails" VALUES(10979,12,38,20,0);
INSERT INTO "OrderDetails" VALUES(10979,24,4.5,80,0);
INSERT INTO "OrderDetails" VALUES(10979,27,43.9,30,0);
INSERT INTO "OrderDetails" VALUES(10979,31,12.5,24,0);
INSERT INTO "OrderDetails" VALUES(10979,63,43.9,35,0);
INSERT INTO "OrderDetails" VALUES(10980,75,7.75,40,0.2);
INSERT INTO "OrderDetails" VALUES(10981,38,263.5,60,0);
INSERT INTO "OrderDetails" VALUES(10982,7,30,20,0);
INSERT INTO "OrderDetails" VALUES(10982,43,46,9,0);
INSERT INTO "OrderDetails" VALUES(10983,13,6,84,0.15);
INSERT INTO "OrderDetails" VALUES(10983,57,19.5,15,0);
INSERT INTO "OrderDetails" VALUES(10984,16,17.45,55,0);
INSERT INTO "OrderDetails" VALUES(10984,24,4.5,20,0);
INSERT INTO "OrderDetails" VALUES(10984,36,19,40,0);
INSERT INTO "OrderDetails" VALUES(10985,16,17.45,36,0.1);
INSERT INTO "OrderDetails" VALUES(10985,18,62.5,8,0.1);
INSERT INTO "OrderDetails" VALUES(10985,32,32,35,0.1);
INSERT INTO "OrderDetails" VALUES(10986,11,21,30,0);
INSERT INTO "OrderDetails" VALUES(10986,20,81,15,0);
INSERT INTO "OrderDetails" VALUES(10986,76,18,10,0);
INSERT INTO "OrderDetails" VALUES(10986,77,13,15,0);
INSERT INTO "OrderDetails" VALUES(10987,7,30,60,0);
INSERT INTO "OrderDetails" VALUES(10987,43,46,6,0);
INSERT INTO "OrderDetails" VALUES(10987,72,34.8,20,0);
INSERT INTO "OrderDetails" VALUES(10988,7,30,60,0);
INSERT INTO "OrderDetails" VALUES(10988,62,49.3,40,0.1);
INSERT INTO "OrderDetails" VALUES(10989,6,25,40,0);
INSERT INTO "OrderDetails" VALUES(10989,11,21,15,0);
INSERT INTO "OrderDetails" VALUES(10989,41,9.65,4,0);
INSERT INTO "OrderDetails" VALUES(10990,21,10,65,0);
INSERT INTO "OrderDetails" VALUES(10990,34,14,60,0.15);
INSERT INTO "OrderDetails" VALUES(10990,55,24,65,0.15);
INSERT INTO "OrderDetails" VALUES(10990,61,28.5,66,0.15);
INSERT INTO "OrderDetails" VALUES(10991,2,19,50,0.2);
INSERT INTO "OrderDetails" VALUES(10991,70,15,20,0.2);
INSERT INTO "OrderDetails" VALUES(10991,76,18,90,0.2);
INSERT INTO "OrderDetails" VALUES(10992,72,34.8,2,0);
INSERT INTO "OrderDetails" VALUES(10993,29,123.79,50,0.25);
INSERT INTO "OrderDetails" VALUES(10993,41,9.65,35,0.25);
INSERT INTO "OrderDetails" VALUES(10994,59,55,18,0.05);
INSERT INTO "OrderDetails" VALUES(10995,51,53,20,0);
INSERT INTO "OrderDetails" VALUES(10995,60,34,4,0);
INSERT INTO "OrderDetails" VALUES(10996,42,14,40,0);
INSERT INTO "OrderDetails" VALUES(10997,32,32,50,0);
INSERT INTO "OrderDetails" VALUES(10997,46,12,20,0.25);
INSERT INTO "OrderDetails" VALUES(10997,52,7,20,0.25);
INSERT INTO "OrderDetails" VALUES(10998,24,4.5,12,0);
INSERT INTO "OrderDetails" VALUES(10998,61,28.5,7,0);
INSERT INTO "OrderDetails" VALUES(10998,74,10,20,0);
INSERT INTO "OrderDetails" VALUES(10998,75,7.75,30,0);
INSERT INTO "OrderDetails" VALUES(10999,41,9.65,20,0.05);
INSERT INTO "OrderDetails" VALUES(10999,51,53,15,0.05);
INSERT INTO "OrderDetails" VALUES(10999,77,13,21,0.05);
INSERT INTO "OrderDetails" VALUES(11000,4,22,25,0.25);
INSERT INTO "OrderDetails" VALUES(11000,24,4.5,30,0.25);
INSERT INTO "OrderDetails" VALUES(11000,77,13,30,0);
INSERT INTO "OrderDetails" VALUES(11001,7,30,60,0);
INSERT INTO "OrderDetails" VALUES(11001,22,21,25,0);
INSERT INTO "OrderDetails" VALUES(11001,46,12,25,0);
INSERT INTO "OrderDetails" VALUES(11001,55,24,6,0);
INSERT INTO "OrderDetails" VALUES(11002,13,6,56,0);
INSERT INTO "OrderDetails" VALUES(11002,35,18,15,0.15);
INSERT INTO "OrderDetails" VALUES(11002,42,14,24,0.15);
INSERT INTO "OrderDetails" VALUES(11002,55,24,40,0);
INSERT INTO "OrderDetails" VALUES(11003,1,18,4,0);
INSERT INTO "OrderDetails" VALUES(11003,40,18.4,10,0);
INSERT INTO "OrderDetails" VALUES(11003,52,7,10,0);
INSERT INTO "OrderDetails" VALUES(11004,26,31.23,6,0);
INSERT INTO "OrderDetails" VALUES(11004,76,18,6,0);
INSERT INTO "OrderDetails" VALUES(11005,1,18,2,0);
INSERT INTO "OrderDetails" VALUES(11005,59,55,10,0);
INSERT INTO "OrderDetails" VALUES(11006,1,18,8,0);
INSERT INTO "OrderDetails" VALUES(11006,29,123.79,2,0.25);
INSERT INTO "OrderDetails" VALUES(11007,8,40,30,0);
INSERT INTO "OrderDetails" VALUES(11007,29,123.79,10,0);
INSERT INTO "OrderDetails" VALUES(11007,42,14,14,0);
INSERT INTO "OrderDetails" VALUES(11008,28,45.6,70,0.05);
INSERT INTO "OrderDetails" VALUES(11008,34,14,90,0.05);
INSERT INTO "OrderDetails" VALUES(11008,71,21.5,21,0);
INSERT INTO "OrderDetails" VALUES(11009,24,4.5,12,0);
INSERT INTO "OrderDetails" VALUES(11009,36,19,18,0.25);
INSERT INTO "OrderDetails" VALUES(11009,60,34,9,0);
INSERT INTO "OrderDetails" VALUES(11010,7,30,20,0);
INSERT INTO "OrderDetails" VALUES(11010,24,4.5,10,0);
INSERT INTO "OrderDetails" VALUES(11011,58,13.25,40,0.05);
INSERT INTO "OrderDetails" VALUES(11011,71,21.5,20,0);
INSERT INTO "OrderDetails" VALUES(11012,19,9.2,50,0.05);
INSERT INTO "OrderDetails" VALUES(11012,60,34,36,0.05);
INSERT INTO "OrderDetails" VALUES(11012,71,21.5,60,0.05);
INSERT INTO "OrderDetails" VALUES(11013,23,9,10,0);
INSERT INTO "OrderDetails" VALUES(11013,42,14,4,0);
INSERT INTO "OrderDetails" VALUES(11013,45,9.5,20,0);
INSERT INTO "OrderDetails" VALUES(11013,68,12.5,2,0);
INSERT INTO "OrderDetails" VALUES(11014,41,9.65,28,0.1);
INSERT INTO "OrderDetails" VALUES(11015,30,25.89,15,0);
INSERT INTO "OrderDetails" VALUES(11015,77,13,18,0);
INSERT INTO "OrderDetails" VALUES(11016,31,12.5,15,0);
INSERT INTO "OrderDetails" VALUES(11016,36,19,16,0);
INSERT INTO "OrderDetails" VALUES(11017,3,10,25,0);
INSERT INTO "OrderDetails" VALUES(11017,59,55,110,0);
INSERT INTO "OrderDetails" VALUES(11017,70,15,30,0);
INSERT INTO "OrderDetails" VALUES(11018,12,38,20,0);
INSERT INTO "OrderDetails" VALUES(11018,18,62.5,10,0);
INSERT INTO "OrderDetails" VALUES(11018,56,38,5,0);
INSERT INTO "OrderDetails" VALUES(11019,46,12,3,0);
INSERT INTO "OrderDetails" VALUES(11019,49,20,2,0);
INSERT INTO "OrderDetails" VALUES(11020,10,31,24,0.15);
INSERT INTO "OrderDetails" VALUES(11021,2,19,11,0.25);
INSERT INTO "OrderDetails" VALUES(11021,20,81,15,0);
INSERT INTO "OrderDetails" VALUES(11021,26,31.23,63,0);
INSERT INTO "OrderDetails" VALUES(11021,51,53,44,0.25);
INSERT INTO "OrderDetails" VALUES(11021,72,34.8,35,0);
INSERT INTO "OrderDetails" VALUES(11022,19,9.2,35,0);
INSERT INTO "OrderDetails" VALUES(11022,69,36,30,0);
INSERT INTO "OrderDetails" VALUES(11023,7,30,4,0);
INSERT INTO "OrderDetails" VALUES(11023,43,46,30,0);
INSERT INTO "OrderDetails" VALUES(11024,26,31.23,12,0);
INSERT INTO "OrderDetails" VALUES(11024,33,2.5,30,0);
INSERT INTO "OrderDetails" VALUES(11024,65,21.05,21,0);
INSERT INTO "OrderDetails" VALUES(11024,71,21.5,50,0);
INSERT INTO "OrderDetails" VALUES(11025,1,18,10,0.1);
INSERT INTO "OrderDetails" VALUES(11025,13,6,20,0.1);
INSERT INTO "OrderDetails" VALUES(11026,18,62.5,8,0);
INSERT INTO "OrderDetails" VALUES(11026,51,53,10,0);
INSERT INTO "OrderDetails" VALUES(11027,24,4.5,30,0.25);
INSERT INTO "OrderDetails" VALUES(11027,62,49.3,21,0.25);
INSERT INTO "OrderDetails" VALUES(11028,55,24,35,0);
INSERT INTO "OrderDetails" VALUES(11028,59,55,24,0);
INSERT INTO "OrderDetails" VALUES(11029,56,38,20,0);
INSERT INTO "OrderDetails" VALUES(11029,63,43.9,12,0);
INSERT INTO "OrderDetails" VALUES(11030,2,19,100,0.25);
INSERT INTO "OrderDetails" VALUES(11030,5,21.35,70,0);
INSERT INTO "OrderDetails" VALUES(11030,29,123.79,60,0.25);
INSERT INTO "OrderDetails" VALUES(11030,59,55,100,0.25);
INSERT INTO "OrderDetails" VALUES(11031,1,18,45,0);
INSERT INTO "OrderDetails" VALUES(11031,13,6,80,0);
INSERT INTO "OrderDetails" VALUES(11031,24,4.5,21,0);
INSERT INTO "OrderDetails" VALUES(11031,64,33.25,20,0);
INSERT INTO "OrderDetails" VALUES(11031,71,21.5,16,0);
INSERT INTO "OrderDetails" VALUES(11032,36,19,35,0);
INSERT INTO "OrderDetails" VALUES(11032,38,263.5,25,0);
INSERT INTO "OrderDetails" VALUES(11032,59,55,30,0);
INSERT INTO "OrderDetails" VALUES(11033,53,32.8,70,0.1);
INSERT INTO "OrderDetails" VALUES(11033,69,36,36,0.1);
INSERT INTO "OrderDetails" VALUES(11034,21,10,15,0.1);
INSERT INTO "OrderDetails" VALUES(11034,44,19.45,12,0);
INSERT INTO "OrderDetails" VALUES(11034,61,28.5,6,0);
INSERT INTO "OrderDetails" VALUES(11035,1,18,10,0);
INSERT INTO "OrderDetails" VALUES(11035,35,18,60,0);
INSERT INTO "OrderDetails" VALUES(11035,42,14,30,0);
INSERT INTO "OrderDetails" VALUES(11035,54,7.45,10,0);
INSERT INTO "OrderDetails" VALUES(11036,13,6,7,0);
INSERT INTO "OrderDetails" VALUES(11036,59,55,30,0);
INSERT INTO "OrderDetails" VALUES(11037,70,15,4,0);
INSERT INTO "OrderDetails" VALUES(11038,40,18.4,5,0.2);
INSERT INTO "OrderDetails" VALUES(11038,52,7,2,0);
INSERT INTO "OrderDetails" VALUES(11038,71,21.5,30,0);
INSERT INTO "OrderDetails" VALUES(11039,28,45.6,20,0);
INSERT INTO "OrderDetails" VALUES(11039,35,18,24,0);
INSERT INTO "OrderDetails" VALUES(11039,49,20,60,0);
INSERT INTO "OrderDetails" VALUES(11039,57,19.5,28,0);
INSERT INTO "OrderDetails" VALUES(11040,21,10,20,0);
INSERT INTO "OrderDetails" VALUES(11041,2,19,30,0.2);
INSERT INTO "OrderDetails" VALUES(11041,63,43.9,30,0);
INSERT INTO "OrderDetails" VALUES(11042,44,19.45,15,0);
INSERT INTO "OrderDetails" VALUES(11042,61,28.5,4,0);
INSERT INTO "OrderDetails" VALUES(11043,11,21,10,0);
INSERT INTO "OrderDetails" VALUES(11044,62,49.3,12,0);
INSERT INTO "OrderDetails" VALUES(11045,33,2.5,15,0);
INSERT INTO "OrderDetails" VALUES(11045,51,53,24,0);
INSERT INTO "OrderDetails" VALUES(11046,12,38,20,0.05);
INSERT INTO "OrderDetails" VALUES(11046,32,32,15,0.05);
INSERT INTO "OrderDetails" VALUES(11046,35,18,18,0.05);
INSERT INTO "OrderDetails" VALUES(11047,1,18,25,0.25);
INSERT INTO "OrderDetails" VALUES(11047,5,21.35,30,0.25);
INSERT INTO "OrderDetails" VALUES(11048,68,12.5,42,0);
INSERT INTO "OrderDetails" VALUES(11049,2,19,10,0.2);
INSERT INTO "OrderDetails" VALUES(11049,12,38,4,0.2);
INSERT INTO "OrderDetails" VALUES(11050,76,18,50,0.1);
INSERT INTO "OrderDetails" VALUES(11051,24,4.5,10,0.2);
INSERT INTO "OrderDetails" VALUES(11052,43,46,30,0.2);
INSERT INTO "OrderDetails" VALUES(11052,61,28.5,10,0.2);
INSERT INTO "OrderDetails" VALUES(11053,18,62.5,35,0.2);
INSERT INTO "OrderDetails" VALUES(11053,32,32,20,0);
INSERT INTO "OrderDetails" VALUES(11053,64,33.25,25,0.2);
INSERT INTO "OrderDetails" VALUES(11054,33,2.5,10,0);
INSERT INTO "OrderDetails" VALUES(11054,67,14,20,0);
INSERT INTO "OrderDetails" VALUES(11055,24,4.5,15,0);
INSERT INTO "OrderDetails" VALUES(11055,25,14,15,0);
INSERT INTO "OrderDetails" VALUES(11055,51,53,20,0);
INSERT INTO "OrderDetails" VALUES(11055,57,19.5,20,0);
INSERT INTO "OrderDetails" VALUES(11056,7,30,40,0);
INSERT INTO "OrderDetails" VALUES(11056,55,24,35,0);
INSERT INTO "OrderDetails" VALUES(11056,60,34,50,0);
INSERT INTO "OrderDetails" VALUES(11057,70,15,3,0);
INSERT INTO "OrderDetails" VALUES(11058,21,10,3,0);
INSERT INTO "OrderDetails" VALUES(11058,60,34,21,0);
INSERT INTO "OrderDetails" VALUES(11058,61,28.5,4,0);
INSERT INTO "OrderDetails" VALUES(11059,13,6,30,0);
INSERT INTO "OrderDetails" VALUES(11059,17,39,12,0);
INSERT INTO "OrderDetails" VALUES(11059,60,34,35,0);
INSERT INTO "OrderDetails" VALUES(11060,60,34,4,0);
INSERT INTO "OrderDetails" VALUES(11060,77,13,10,0);
INSERT INTO "OrderDetails" VALUES(11061,60,34,15,0);
INSERT INTO "OrderDetails" VALUES(11062,53,32.8,10,0.2);
INSERT INTO "OrderDetails" VALUES(11062,70,15,12,0.2);
INSERT INTO "OrderDetails" VALUES(11063,34,14,30,0);
INSERT INTO "OrderDetails" VALUES(11063,40,18.4,40,0.1);
INSERT INTO "OrderDetails" VALUES(11063,41,9.65,30,0.1);
INSERT INTO "OrderDetails" VALUES(11064,17,39,77,0.1);
INSERT INTO "OrderDetails" VALUES(11064,41,9.65,12,0);
INSERT INTO "OrderDetails" VALUES(11064,53,32.8,25,0.1);
INSERT INTO "OrderDetails" VALUES(11064,55,24,4,0.1);
INSERT INTO "OrderDetails" VALUES(11064,68,12.5,55,0);
INSERT INTO "OrderDetails" VALUES(11065,30,25.89,4,0.25);
INSERT INTO "OrderDetails" VALUES(11065,54,7.45,20,0.25);
INSERT INTO "OrderDetails" VALUES(11066,16,17.45,3,0);
INSERT INTO "OrderDetails" VALUES(11066,19,9.2,42,0);
INSERT INTO "OrderDetails" VALUES(11066,34,14,35,0);
INSERT INTO "OrderDetails" VALUES(11067,41,9.65,9,0);
INSERT INTO "OrderDetails" VALUES(11068,28,45.6,8,0.15);
INSERT INTO "OrderDetails" VALUES(11068,43,46,36,0.15);
INSERT INTO "OrderDetails" VALUES(11068,77,13,28,0.15);
INSERT INTO "OrderDetails" VALUES(11069,39,18,20,0);
INSERT INTO "OrderDetails" VALUES(11070,1,18,40,0.15);
INSERT INTO "OrderDetails" VALUES(11070,2,19,20,0.15);
INSERT INTO "OrderDetails" VALUES(11070,16,17.45,30,0.15);
INSERT INTO "OrderDetails" VALUES(11070,31,12.5,20,0);
INSERT INTO "OrderDetails" VALUES(11071,7,30,15,0.05);
INSERT INTO "OrderDetails" VALUES(11071,13,6,10,0.05);
INSERT INTO "OrderDetails" VALUES(11072,2,19,8,0);
INSERT INTO "OrderDetails" VALUES(11072,41,9.65,40,0);
INSERT INTO "OrderDetails" VALUES(11072,50,16.25,22,0);
INSERT INTO "OrderDetails" VALUES(11072,64,33.25,130,0);
INSERT INTO "OrderDetails" VALUES(11073,11,21,10,0);
INSERT INTO "OrderDetails" VALUES(11073,24,4.5,20,0);
INSERT INTO "OrderDetails" VALUES(11074,16,17.45,14,0.05);
INSERT INTO "OrderDetails" VALUES(11075,2,19,10,0.15);
INSERT INTO "OrderDetails" VALUES(11075,46,12,30,0.15);
INSERT INTO "OrderDetails" VALUES(11075,76,18,2,0.15);
INSERT INTO "OrderDetails" VALUES(11076,6,25,20,0.25);
INSERT INTO "OrderDetails" VALUES(11076,14,23.25,20,0.25);
INSERT INTO "OrderDetails" VALUES(11076,19,9.2,10,0.25);
INSERT INTO "OrderDetails" VALUES(11077,2,19,24,0.2);
INSERT INTO "OrderDetails" VALUES(11077,3,10,4,0);
INSERT INTO "OrderDetails" VALUES(11077,4,22,1,0);
INSERT INTO "OrderDetails" VALUES(11077,6,25,1,0.02);
INSERT INTO "OrderDetails" VALUES(11077,7,30,1,0.05);
INSERT INTO "OrderDetails" VALUES(11077,8,40,2,0.1);
INSERT INTO "OrderDetails" VALUES(11077,10,31,1,0);
INSERT INTO "OrderDetails" VALUES(11077,12,38,2,0.05);
INSERT INTO "OrderDetails" VALUES(11077,13,6,4,0);
INSERT INTO "OrderDetails" VALUES(11077,14,23.25,1,0.03);
INSERT INTO "OrderDetails" VALUES(11077,16,17.45,2,0.03);
INSERT INTO "OrderDetails" VALUES(11077,20,81,1,0.04);
INSERT INTO "OrderDetails" VALUES(11077,23,9,2,0);
INSERT INTO "OrderDetails" VALUES(11077,32,32,1,0);
INSERT INTO "OrderDetails" VALUES(11077,39,18,2,0.05);
INSERT INTO "OrderDetails" VALUES(11077,41,9.65,3,0);
INSERT INTO "OrderDetails" VALUES(11077,46,12,3,0.02);
INSERT INTO "OrderDetails" VALUES(11077,52,7,2,0);
INSERT INTO "OrderDetails" VALUES(11077,55,24,2,0);
INSERT INTO "OrderDetails" VALUES(11077,60,34,2,0.06);
INSERT INTO "OrderDetails" VALUES(11077,64,33.25,2,0.03);
INSERT INTO "OrderDetails" VALUES(11077,66,17,1,0);
INSERT INTO "OrderDetails" VALUES(11077,73,15,2,0.01);
INSERT INTO "OrderDetails" VALUES(11077,75,7.75,4,0);
INSERT INTO "OrderDetails" VALUES(11077,77,13,2,0);

Insert Into Region Values (1,'Eastern')
Insert Into Region Values (2,'Western')
Insert Into Region Values (3,'Northern')
Insert Into Region Values (4,'Southern')

Insert Into EmployeesTerritories Values (1,'06897')
Insert Into EmployeesTerritories Values (1,'19713')
Insert Into EmployeesTerritories Values (2,'01581')
Insert Into EmployeesTerritories Values (2,'01730')
Insert Into EmployeesTerritories Values (2,'01833')
Insert Into EmployeesTerritories Values (2,'02116')
Insert Into EmployeesTerritories Values (2,'02139')
Insert Into EmployeesTerritories Values (2,'02184')
Insert Into EmployeesTerritories Values (2,'40222')
Insert Into EmployeesTerritories Values (3,'30346')
Insert Into EmployeesTerritories Values (3,'31406')
Insert Into EmployeesTerritories Values (3,'32859')
Insert Into EmployeesTerritories Values (3,'33607')
Insert Into EmployeesTerritories Values (4,'20852')
Insert Into EmployeesTerritories Values (4,'27403')
Insert Into EmployeesTerritories Values (4,'27511')
Insert Into EmployeesTerritories Values (5,'02903')
Insert Into EmployeesTerritories Values (5,'07960')
Insert Into EmployeesTerritories Values (5,'08837')
Insert Into EmployeesTerritories Values (5,'10019')
Insert Into EmployeesTerritories Values (5,'10038')
Insert Into EmployeesTerritories Values (5,'11747')
Insert Into EmployeesTerritories Values (5,'14450')
Insert Into EmployeesTerritories Values (6,'85014')
Insert Into EmployeesTerritories Values (6,'85251')
Insert Into EmployeesTerritories Values (6,'98004')
Insert Into EmployeesTerritories Values (6,'98052')
Insert Into EmployeesTerritories Values (6,'98104')
Insert Into EmployeesTerritories Values (7,'60179')
Insert Into EmployeesTerritories Values (7,'60601')
Insert Into EmployeesTerritories Values (7,'80202')
Insert Into EmployeesTerritories Values (7,'80909')
Insert Into EmployeesTerritories Values (7,'90405')
Insert Into EmployeesTerritories Values (7,'94025')
Insert Into EmployeesTerritories Values (7,'94105')
Insert Into EmployeesTerritories Values (7,'95008')
Insert Into EmployeesTerritories Values (7,'95054')
Insert Into EmployeesTerritories Values (7,'95060')
Insert Into EmployeesTerritories Values (8,'19428')
Insert Into EmployeesTerritories Values (8,'44122')
Insert Into EmployeesTerritories Values (8,'45839')
Insert Into EmployeesTerritories Values (8,'53404')
Insert Into EmployeesTerritories Values (9,'03049')
Insert Into EmployeesTerritories Values (9,'03801')
Insert Into EmployeesTerritories Values (9,'48075')
Insert Into EmployeesTerritories Values (9,'48084')
Insert Into EmployeesTerritories Values (9,'48304')
Insert Into EmployeesTerritories Values (9,'55113')
Insert Into EmployeesTerritories Values (9,'55439')
Go

--  The following adds constraints to the NorthwindEF database

ALTER TABLE CustomerCustomerDemo
	ADD CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY  NONCLUSTERED 
	(
		[CustomerID],
		[CustomerTypeID]
	) ON [PRIMARY]
GO

ALTER TABLE CustomerDemographics
	ADD CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY  NONCLUSTERED 
	(
		[CustomerTypeID]
	) ON [PRIMARY]
GO

ALTER TABLE CustomerCustomerDemo
	ADD CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY 
	(
		[CustomerTypeID]
	) REFERENCES [dbo].[CustomerDemographics] (
		[CustomerTypeID]
	)
GO

ALTER TABLE CustomerCustomerDemo
	ADD CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY
	(
		[CustomerID]
	) REFERENCES [dbo].[Customers] (
		[CustomerID]
	)
GO

ALTER TABLE Region
	ADD CONSTRAINT [PK_Region] PRIMARY KEY  NONCLUSTERED 
	(
		[RegionID]
	)  ON [PRIMARY] 
GO

ALTER TABLE Territories
	ADD CONSTRAINT [PK_Territories] PRIMARY KEY  NONCLUSTERED 
	(
		[TerritoryID]
	)  ON [PRIMARY] 
GO

ALTER TABLE Territories
	ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY 
	(
		[RegionID]
	) REFERENCES [dbo].[Region] (
		[RegionID]
	)
GO

ALTER TABLE EmployeesTerritories
	ADD CONSTRAINT [PK_EmployeesTerritories] PRIMARY KEY  NONCLUSTERED 
	(
		[EmployeeID],
		[TerritoryID]
	) ON [PRIMARY]
GO

ALTER TABLE EmployeesTerritories
	ADD CONSTRAINT [FK_EmployeesTerritories_Employees] FOREIGN KEY 
	(
		[EmployeeID]
	) REFERENCES [dbo].[Employees] (
		[EmployeeID]
	)
GO


ALTER TABLE EmployeesTerritories	
	ADD CONSTRAINT [FK_EmployeesTerritories_Territories] FOREIGN KEY 
	(
		[TerritoryID]
	) REFERENCES [dbo].[Territories] (
		[TerritoryID]
	)
GO
