INSERT INTO OPENROWSET
(
'Microsoft.ACE.OLEDB.12.0', 
'Excel 12.0;Database=E:\ExcelxDuplicate.xlsx;', 
'SELECT * FROM [Sheet1$]'
) 
SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers




