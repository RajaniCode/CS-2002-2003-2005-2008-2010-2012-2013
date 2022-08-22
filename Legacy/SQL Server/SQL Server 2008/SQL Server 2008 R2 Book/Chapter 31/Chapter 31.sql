--Listing 31.1: 
sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO

--Listing 31.3: 
exec GetOrdersCustomers
@DestinationCountry = 'USA'


