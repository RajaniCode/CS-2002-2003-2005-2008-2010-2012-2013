--Listing 21.1: 
CREATE PARTITION FUNCTION Emp_PartFunction (int)
AS RANGE LEFT
FOR VALUES (1970, 1980, 1990, 2000)

--Listing 21.2: 
CREATE PARTITION SCHEME Emp_PartScheme
AS PARTITION Emp_PartFunction
TO (Filegroup1, Filegroup2, Filegroup3, Filegroup4, Filegroup5)

--Listing 21.3: 
CREATE TABLE Emp (FName nvarchar(20), LName nvarchar(20), Yr_of_Joining int)
ON Emp_PartScheme (Yr_of_Joining)

--Listing 21.4: 
INSERT INTO Emp(FName, LName, Yr_of_Joining)
VALUES('Joleen', 'Mathews', 1965), ('Christeen', 'Ferrari', 1976), ('Mark',
'Thomson', 1982), ('Maria', 'Joseph', 1994), ('Ariya', 'Vincent', 2002), ('Peter',
'Anthony', 2008)

--Listing 21.5: 
SELECT * FROM Emp

--Listing 21.6: 
SELECT $partition.Emp_PartFunction(Yr_of_Joining) AS Partition, COUNT(*) AS
No_of_Rows FROM Emp
GROUP BY $PARTITION.Emp_PartFunction(Yr_of_Joining)
ORDER BY Partition


