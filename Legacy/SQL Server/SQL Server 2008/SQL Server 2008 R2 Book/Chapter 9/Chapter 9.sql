
--Listing 9.1: 

DECLARE @orderid int, @totalcost money
DECLARE TotalCost_cursor CURSOR
STATIC
FOR
SELECT OrderID, sum (UnitPrice * Quantity) AS 'Total Cost' FROM OrderDetails
GROUP BY OrderID
OPEN TotalCost_cursor
PRINT '------------------------------------------------------------'
PRINT 'The following displays the total cost for each order placed:'
PRINT '------------------------------------------------------------'
FETCH NEXT FROM TotalCost_cursor INTO @orderid, @totalcost
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT ' | OrderID - ' + CAST(@OrderID AS varchar) + ' | Total Cost - ' +
CAST(@totalcost AS varchar) + ' | '
FETCH NEXT FROM TotalCost_cursor INTO @orderid, @totalcost
PRINT '--------------------------------------------------'
END
CLOSE TotalCost_cursor
DEALLOCATE TotalCost_cursor
GO


--Listing 9.2: 

/*********************/
/* Markup All Titles */
/*********************/
/* Declare a cursor to get a list of titles */
DECLARE c_Titles CURSOR FORWARD_ONLY KEYSET
FOR SELECT title,
price,
ytd_sales
FROM titles
WHERE price IS NOT NULL
/* Declare variables to hold the price information */
DECLARE @v_Title VARCHAR(80),
@v_Price Money,
@v_YTD MONEY,
@v_TotYTD MONEY,
@v_NewPrice MONEY
/* Get Total YTD Sales */
SELECT @v_TotYTD = SUM(COALESCE(ytd_sales,0))
FROM pubs.dbo.titles
/* Open the cursor */
OPEN c_Titles
/* Get the first title name */
FETCH NEXT FROM c_Titles INTO @v_Title,
@v_Price,
@v_YTD
/* Loop through the titles */
WHILE (@@Fetch_Status <> -1)
BEGIN
/* Check for deleted row */
IF (@@Fetch_Status <> -2)
BEGIN
/* Calculate New Price */
Select @v_NewPrice = @v_Price + ((@v_Price * 10) /100)
/* Display the markup being performed */
PRINT 'Marking up: ' + @v_Title
PRINT 'Old Price: ' + CONVERT(VARCHAR,@v_Price)
PRINT 'New Price: ' + CONVERT(VARCHAR,@v_NewPrice)
PRINT ''
PRINT ''
/* Perform the update */
UPDATE pubs.dbo.titles
SET price = @v_NewPrice
WHERE CURRENT OF c_Titles
END
/* Get the next title from the cursor */
FETCH NEXT FROM c_Titles INTO @v_Title,
@v_Price,
@v_YTD
END
/* Close and deallocate the cursor */
CLOSE c_Titles
DEALLOCATE c_Titles
GO


--Listing 9.3: 

/* Clone author records to create duplicate entries */
INSERT INTO authors ( au_id,
au_lname,
au_fname,
phone,
address,
city,
state,
zip,
contract )
SELECT '0' + SUBSTRING(au_id, 2, 10),
au_lname,
au_fname,
phone,
address,
city,
state,
zip,
contract
FROM authors
WHERE substring(au_id,1,1)<>'0'


--Listing 9.4: 

/****************************/
/* Remove Duplicate Authors */
/****************************/
/* Switch database context */
USE pubs
/* Declare a cursor to get a list of authors */
DECLARE c_Authors CURSOR FORWARD_ONLY KEYSET
FOR SELECT au_fname + ' ' + au_lname
FROM authors
ORDER BY au_lname, au_fname
-- ORDER BY au_lname DESC, au_fname DESC
/* Declare variables to hold the current and previous author names */
DECLARE @v_name varchar(50),
@v_oldname varchar(50)
/* Open the cursor */
OPEN c_Authors
/* Get the first author name */
FETCH NEXT FROM c_Authors INTO @v_name
/* Loop through the authors */
WHILE (@@Fetch_Status <> -1)
BEGIN
/* Check for deleted row */
IF (@@Fetch_Status <> -2)
BEGIN
/* Remove duplicate entries */
IF (@v_oldname = @v_name)
BEGIN
/* Remove duplicate row */
DELETE FROM pubs.dbo.authors
WHERE CURRENT OF c_Authors
/* Show records removed */
PRINT @v_name + ' (Duplicate Removed)'
END
/* Save name to check for duplicate entries */
SELECT @v_oldname = @v_name
END
/* Get the next author name from the cursor */
FETCH NEXT FROM c_Authors INTO @v_name
END
/* Close and deallocate the cursor */
CLOSE c_Authors
DEALLOCATE c_Authors
GO


--Listing 9.5: 

SELECT au_fname + ' ' + au_lname
FROM authors
ORDER BY au_lname DESC, au_fname DESC



--Listing 9.6: 

/********************************************************/
/* Select a random employee to receive a couple movie ticket */
/********************************************************/
/* Declare cursor to select a list of employees */
DECLARE c_RandomEmployee CURSOR READ_ONLY STATIC SCROLL FOR
SELECT EmpID, FirstName + ' ' + LastName AS EmpName
FROM Employees
/* Declare variables */
DECLARE @v_EmpID INT,
@v_EmpName varchar(40),
@v_EmpCount INT,
@v_WinnerRow INT,
@v_Msg VARCHAR(1000)
/* Open the cursor */
OPEN c_RandomEmployee
/* Get the number of employees qualified by the cursor */
SELECT @v_EmpCount = @@CURSOR_ROWS
/* If we have at least one employee, then we can continue processing */
IF (@v_EmpCount <> 0)
BEGIN
/* Select the row for our random winner */
SELECT @v_WinnerRow = CONVERT(INT,RAND() * @v_EmpCount) + 1
/* Fetch the winner's record */
FETCH ABSOLUTE @v_WinnerRow FROM c_RandomEmployee INTO @v_EmpID,
@v_EmpName
SELECT @v_Msg = 'The lucky winner as on ' +
CONVERT(VARCHAR, GETDATE(), 107) +
' is ' + @v_EmpName + ' Employee # ' +
CONVERT(VARCHAR, @v_EmpID)
PRINT @v_Msg
END
/* Close and deallocate the cursor */
CLOSE c_RandomEmployee
DEALLOCATE c_RandomEmployee
GO

