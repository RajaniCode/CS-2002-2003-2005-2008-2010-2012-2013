
--Listing 25.25: 

CREATE LOGIN James WITH PASSWORD = 'abcdefgh'


--Listing 25.26: 

CREATE DATABASE CustomerData
WITH Db_CHAINING ON
CREATE DATABASE MailList
WITH DB_CHAINING ON
GO


--Listing 25.27: 

USE CustomerData
CREATE TABLE Customers
(
CustomerID int IDENTITY PRIMARY KEY,
FirstName nvarchar(255) NOT NULL,
LastName nvarchar(255) NOT NULL,
Email varchar(255) NOT NULL
)
USE MailList
CREATE TABLE EmailIDs
(
ContactID int IDENTITY PRIMARY KEY,
Email varchar(255) NOT NULL
)


--Listing 25.28: 

USE CustomerData
INSERT INTO Customers VALUES ('John','Williams','John.Williams@abcd.com')
INSERT INTO Customers VALUES ('Joseph','Walker','JosephW@xyz.com')
GO
USE MailList
INSERT INTO EmailIDs VALUES('price@abcd.com')
INSERT INTO EmailIDs VALUES('rate@xyz.com')
GO


--Listing 25.29: 

CREATE VIEW vGetAllContactEmails
AS
SELECT Email FROM EmailIDs
UNION
SELECT Email FROM CustomerData.dbo.Customers
GO


--Listing 25.30: 

Use CustomerData
CREATE USER James FOR LOGIN James
Use MailList
CREATE USER James FOR LOGIN James
GRANT SELECT ON vGetAllContactEmails TO James
GO
SETUSER 'James'
SELECT * FROM vGetAllContactEmails
SETUSER


--Listing 25.34: 

USE Inventory
GO
CREATE ASSEMBLY Class1
FROM 'C:\Users\Sumita\Desktop\ImplementingCAS\ImplementingCAS\Class1.dll'
WITH PERMISSION_SET = EXTERNAL_ACCESS
GO


--Listing 25.35: 

CREATE PROCEDURE uspGetEmployeeDetails @filename nvarchar(255)
AS EXTERNAL NAME Class1.
[ImplementingCAS.Class1].GetEmployeeDetails
GO


--Listing 25.36: 

EXEC uspGetEmployeeDetails 'C:\Personnames.txt'


--Listing 25.37: 

CREATE SYMMETRIC KEY TestSymKey
WITH ALGORITHM = AES_256
ENCRYPTION BY PASSWORD = 'test@1234'


--Listing 25.38: 

OPEN SYMMETRIC KEY TestSymKey
DECRYPTION BY PASSWORD = 'test@1234'


--Listing 25.39: 

DECLARE @Text varchar(100)
DECLARE @EncryptedText varbinary(150)
DECLARE @DecryptedText varchar(100)
SET @Text = 'Text for encrypting'
SET @EncryptedText = ENCRYPTBYKEY(KEY_GUID('TestSymKey'), @Text)
PRINT @EncryptedText


--Listing 25.40: 

SET @DecryptedText = CAST(DECRYPTBYKEY(@EncryptedText) As Varchar(100))
PRINT @DecryptedText


--Listing 25.41: 

CLOSE SYMMETRIC KEY TestSymKey


--Listing 25.42: 

CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'test@1234'


--Listing 25.43: 

CREATE ASYMMETRIC KEY TestAsymKey
WITH ALGORITHM = RSA_512


--Listing 25.44: 

DECLARE @Text varchar(100)
DECLARE @EncryptedText varbinary(150)
DECLARE @DecryptedText varchar(100)
SET @Text = 'Text for encrypting'
SET @EncryptedText = ENCRYPTBYAsymKEY(AsymKey_ID('TestAsymKey'), @Text)
PRINT @EncryptedText


--Listing 25.45: 

SET @DecryptedText = CAST(DecryptByAsymKey(AsymKey_ID('TestAsymKey'),
@EncryptedText) As Varchar(100))
PRINT @DecryptedText


--Listing 25.46: 

Use Master
GO
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'test@1234'
GO
CREATE CERTIFICATE SQL_certificate
WITH SUBJECT = 'Server Certificate',
EXPIRY_DATE = '2020-12-1'
GO


--Listing 25.47: 

Use Inventory
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE SQL_certificate
GO


--Listing 25.48: 

Use Master
GO
BACKUP CERTIFICATE SQL_certificate
TO FILE = 'C:\cert.cer'
WITH PRIVATE KEY (
FILE = 'C:\cert.pvk',
ENCRYPTION BY PASSWORD = 'kogent@123')


--Listing 25.49: 

Use Master
select * from sys.dm_database_encryption_keys

