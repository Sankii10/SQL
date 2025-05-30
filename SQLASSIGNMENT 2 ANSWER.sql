CREATE DATABASE Assignment

USE Assignment

--IMPORT DATA FROM EXCEL
SELECT *FROM Customers$

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Department(Deptid INT PRIMARY KEY, DeptName VARCHAR(50) NOT NULL)

CREATE TABLE Employee(Empid INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, Email VARCHAR(50), Salary INT, AddressLine VARCHAR(75), ContactId BIGINT, DeptId INT FOREIGN KEY REFERENCES Department(Deptid))

INSERT INTO Department VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Marketing'),
(104, 'Finance');

INSERT INTO Employee VALUES
(1, 'Alice Smith','alice.smith@email.com', 50000, '123 Maple St',5551234,101),
(2, 'Bob Johnson', 'bob.johnson@email.com', 55000,'456 Oak St',5555678,102),
(3, 'Charlie Lee', 'charlie.lee@email.com',	60000,'789 Pine St',5559012, 101),
(10, 'David Brown',	'david.brown@email.com', 65000,	'321 Birch St',5553456,103),
(11, 'Eva White', 'eva.white@email.com', 70000, '654 Cedar St',5557890,104);

SELECT * FROM Department;
SELECT *FROM Employee;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SELECT Statement:

--Write an SQL query to select all records from the Employee table where the EmployeeID is greater than 5.

SELECT *
FROM Employee
WHERE Empid > 5

--Write an SQL query to select specific columns (EmployeeID, Name, DepartmentID) from the Employee table.

SELECT Empid, Name, Deptid
FROM Employee;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--UPDATE Statement:

--Write an SQL statement to update the email address of an employee with a specific EmployeeID in the Employee table.

UPDATE Employee
SET Email = 'alice.thesmith@email.com'
WHERE Empid = 1;

SELECT *FROM Employee;

--Write an SQL statement to update the Salary of all employees in the Employee table by increasing it by 10%.

UPDATE Employee
SET Salary = Salary * 1.10

SELECT *FROM Employee

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--UPDATE with Multiple Columns:

--Write an SQL query to update both the AddressLine and ContactNumber for an employee with EmployeeID 10.

UPDATE Employee
SET AddressLine = '791 Anthony St', ContactId = 6879254
WHERE Empid = 10;

SELECT *FROM Employee

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ALTER TABLE Statement:

--Write an SQL statement to add a new column BirthDate of type DATE to the Employee table.

ALTER TABLE Employee
ADD BirthDate  DATE;

UPDATE Employee SET BirthDate='1990-01-01' WHERE Empid = 1
UPDATE Employee SET BirthDate='1985-05-12' WHERE Empid = 2
UPDATE Employee SET BirthDate ='1992-08-23' WHERE Empid = 3
UPDATE Employee SET BirthDate='1988-02-14' WHERE Empid = 10
UPDATE Employee SET BirthDate = '1991-11-30' WHERE Empid = 11

SELECT * FROM Employee

--Write an SQL statement to change the data type of the Salary column in the Employee table from INT to DECIMAL(10, 2).

ALTER TABLE Employee
ALTER COLUMN Salary DECIMAL(10,2)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--UPDATE Statement (for a newly added column):

--After adding a new column PhoneNumber to the Employee table, write an SQL statement to update the PhoneNumber for the employee with EmployeeID 2.


ALTER TABLE Employee
ADD PhoneNumber BIGINT

SELECT * FROM Employee;

Update Employee
SET PhoneNumber = 9890146722
WHERE Empid = 2

SELECT *FROM Employee

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Questions on Renaming Operations

CREATE DATABASE DummyDB

USE DummyDB

--Rename Database:
--We have to make sure when we execute this querry it should not be in the same db whose name you have to change 
EXEC SP_RENAMEDB 'DummyDB','NewDummy';


--Rename Table:
--How would you rename the table 'Customers' to 'ClientData' in the current database?

/* HERE, I IMPORTER CUSTOMER DATASET IN EXCEL FORMAT INTO NEWDUMMY DATABASE*/

EXEC SP_RENAME 'Customers$','ClientData'

SELECT * FROM ClientData;


--Rename Column:
--How would you rename the column 'AnnualIncome' to 'YearlyIncome' in the 'Customers' table?

EXEC SP_RENAME 'ClientData.AnnualIncome', 'YearlyIncome','COLUMN'

--How would you rename the column 'TotalChildren' to 'NumChildren' in the 'Customers' table?
EXEC SP_RENAME 'ClientData.TotalChildren','NumChildren', 'COLUMN'

SELECT *FROM ClientData;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Questions on Deleting Data and Tables

/*RENAMING THE DATASET BACK TO CUSTOMERS*/
EXEC SP_RENAME 'ClientData','Customers'

--Write an SQL query to delete the row where the CustomerKey is 11002 in the 'Customers' table.
DELETE FROM Customers
WHERE CustomerKey = 11002;

SELECT *FROM Customers;


--Delete Specific Row:
--Write an SQL query to delete the row where the EmailAddress is 'elizabeth5@learnsector.com' in the 'Customers' table.

DELETE FROM Customers
WHERE EmailAddress = 'elizabeth5@learnsector.com';


--Update Specific Data:
--Write an SQL query to update the 'EmailAddress' of the customer with CustomerKey 11001 to 'eugene.huang@newmail.com'.

UPDATE Customers
SET EmailAddress = 'eugene.huang@newmail.com'
WHERE CustomerKey = 11001


SELECT CustomerKey, FirstName, LastName, MaritalStatus, Gender, EmailAddress
FROM Customers
WHERE CustomerKey = 11001;


--Update Specific Column:
--Write an SQL query to set the 'HomeOwner' status to 'N' for all customers whose 'AnnualIncome' is less than 70000.

/*RECHANGING THE NAME OF CLUMN FROM YEARLYINCOME TO ANNUALINCOME*/
EXEC SP_RENAME 'Customers.YearlyIncome','AnnualIncome','COLUMN'

UPDATE Customers
SET HomeOwner = 'N'
WHERE AnnualIncome < 70000;


--Delete All Rows:
--Write an SQL query to delete all rows in the 'Customers' table.

TRUNCATE TABLE Customers;

SELECT *FROM Customers;


--Drop Table:
--How would you drop the table 'Customers' from the current database?

DROP TABLE Customers;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Questions on Arithmetic Operators

--Addition:
--Write an SQL query to add 5000 to the 'AnnualIncome' of each customer and display the results.

SELECT *FROM Customers$;

SELECT FirstName, LastName, AnnualIncome, AnnualIncome + 5000 AS NewAnnualIncome
FROM Customers$



--Subtraction:
--Write an SQL query to subtract 2000 from the 'AnnualIncome' of each customer and display the results.

SELECT FirstName, LastName, AnnualIncome , AnnualIncome - 2000 AS UpdatedAnnualInc
FROM Customers$



--Multiplication:
--Write an SQL query to multiply the 'AnnualIncome' of each customer by 1.05 to simulate a 5% raise and display the results.

SELECT CustomerKey, FirstName, LastName, AnnualIncome, AnnualIncome * 1.05 AS InCAnnualIncome
FROM Customers$;



--Division:
--Write an SQL query to divide the 'AnnualIncome' of each customer by 12 to calculate the monthly income and display the results.

SELECT CustomerKey, FirstName, Lastname , AnnualIncome, AnnualIncome / 12 AS MONTHLYINCOME
FROM Customers$;


--Modulus:
--Write an SQL query to find the remainder when 'AnnualIncome' is divided by 10000 and display the results.

SELECT CustomerKey, FirstName, LastName, AnnualIncome , AnnualIncome / 10000 AS ModulusAnnualIncome
FROM Customers$;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Questions on Comparison Operators

--Equal to:
--Write an SQL query to select all columns from 'Customers' where 'TotalChildren' is equal to 3.

SELECT *FROM Customers$

SELECT *
FROM Customers$
WHERE TotalChildren = 3;


--Not Equal to:
--Write an SQL query to select all columns from 'Customers' where 'MaritalStatus' is not equal to 'S'.

SELECT *
FROM Customers$
WHERE MaritalStatus != 'S'


--Greater Than:
--Write an SQL query to select all columns from 'Customers' where 'AnnualIncome' is greater than 80000.

SELECT *
FROM Customers$
WHERE AnnualIncome > 80000;


--Greater Than or Equal to:
--Write an SQL query to select 'FirstName' and 'LastName' from 'Customers' where 'AnnualIncome' is greater than or equal to 90000.

SELECT FirstName, LastName
FROM Customers$
WHERE AnnualIncome >= 90000;

--Less Than or Equal to:
--Write an SQL query to select 'CustomerKey' and 'EmailAddress' from 'Customers' where 'AnnualIncome' is less than or equal to 70000.

SELECT CustomerKey, EmailAddress
FROM Customers$
WHERE AnnualIncome <= 70000;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--T-SQL Aggregate Functions

--What is the average annual income of all customers?

SELECT *FROM Customers$

SELECT AVG(AnnualIncome) AS AVERAGEANNUALINCOME
FROM Customers$;


--What is the total number of children across all customers?

SELECT SUM(TotalChildren) 
FROM Customers$;


--What is the maximum annual income among the customers?

SELECT MAX(AnnualIncome)
FROM Customers$


-- What is the minimum annual income among the customers?

SELECT MIN(AnnualIncome)
FROM Customers$


-- What is the count of customers with a Bachelors degree?

SELECT COUNT (*) AS NOOFBACHELORS
FROM Customers$
WHERE EducationLevel = 'Bachelors';


-- What is the sum of annual incomes for customers with more than 2 children?

SELECT SUM(AnnualIncome) AS SUMANINC
FROM Customers$
WHERE TotalChildren = 2;


-- What is the average annual income of customers who own their home?

SELECT AVG(AnnualIncome) AS AVGINC
FROM Customers$
WHERE HomeOwner = 'Y';


-- What is the total number of customers grouped by marital status?

SELECT MaritalStatus, COUNT(*) AS TotalCustomers
FROM Customers$
GROUP BY MaritalStatus;


-- What is the average age of customers based on their education level?

SELECT EducationLevel,AVG(DATEDIFF(DAY, BirthDate, GETDATE())/365.25) AS AVGDATE
FROM Customers$
GROUP BY EducationLevel;

-- What is the maximum number of children any customer has?

SELECT MAX(TotalChildren) AS MAXCHILDREN
FROM Customers$;

--Max children in how many number
SELECT TotalChildren, MAX(TotalChildren) AS MAXChildren
FROM Customers$
GROUP BY TotalChildren;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- LIKE Operators

--  Basic LIKE and Wildcards (% and _)

-- Write a query to find all employees whose names start with "Jo".

SELECT *
FROM Customers$
WHERE FirstName LIKE 'Jo%';


-- Retrieve employees whose names end with the letter "n".

SELECT *
FROM Customers$
WHERE FirstName LIKE '%n';


-- Find all employees whose names have exactly four letters and start with J.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'J___';


-- Find all employees whose names are three letters long and the second letter is "a".

SELECT FirstName, LastName 
FROM Customers$
WHERE LastName LIKE '_[a]_';


-- Write a query to find employees whose names contain "an" anywhere in the name.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE '%an%';


-- Find employees whose name is exactly "Jon" using wildcards.

SELECT *
FROM Customers$
WHERE FirstName LIKE 'JON';


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- LIKE with Escaping Special Characters

SELECT *FROM Customers$;


-- Write a query to find employees whose names contain an actual underscore _ (not as a wildcard).


SELECT FirstName, LastName
FROM Customers$
WHERE LastName LIKE '%\_%' ESCAPE '\';


-- Write a query to find employees whose names include a percent symbol %.

SELECT FirstName, LastName
FROM Customers$
WHERE FirstName LIKE '%\%%' ESCAPE '\';


-- Find employees whose name includes a string like "50_50" where _ is a literal underscore.

SELECT *
FROM Customers$
WHERE FirstName LIKE '%50\_50%' ESCAPE '\';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--LIKE with Square Brackets ([])

--Retrieve employees whose names start with J and the second letter is a, e, or o.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'J[aeo]%'



-- Find employees whose names start with J and whose second character is any letter from a to m.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'J[abcdefghijklm]%';


-- Find employees whose names contain a digit.

SELECT *
FROM Customers$
WHERE FirstName LIKE '%[0-9]%';


-- Write a query to retrieve employees whose names start with J and whose second letter is not o.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'J[^o]%'


-- Find employees whose name includes at least one digit between 1 and 5.

SELECT *
FROM Customers$
WHERE FirstName LIKE '%[1-5]%';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Advanced Pattern Matching Scenarios

-- Find all employees whose names end with 'n' and have exactly 4 characters.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE '___N';


-- Retrieve employees whose names start with 'Jo' but are not 'John'.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'Jo%'
  AND FirstName <> 'John';

-- Find employees whose names have exactly 6 characters and start with J.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'J_____';


-- Find all employees whose names contain at least one uppercase letter followed by a digit.

SELECT *
FROM Customers$
WHERE PATINDEX('%[A-Z][0-9]%', FirstName) > 0;


--  Write a query to find employees whose names start with 'J', end with 'n', and do not contain the letter 'a'.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE 'J%n'
  AND FirstName NOT LIKE '%a%';



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------
MISCELLANOUS QUESTIONS
---------------------------

-- Retrieve the full names (FirstName + LastName) and EmailAddress of all customers.

SELECT FirstName, LastName, EmailAddress
FROM Customers$;


-- List all customers who have an annual income greater than $70,000. Show their FirstName, LastName, and AnnualIncome.

SELECT FirstName, LastName, AnnualIncome
FROM Customers$
WHERE AnnualIncome > 70000


-- Show the FirstName, LastName, and BirthDate of customers sorted by BirthDate in ascending order (oldest to youngest).

SELECT FirstName, Lastname, BirthDate
FROM Customers$
ORDER BY BirthDate ASC;


-- Update the AnnualIncome to 75000 for all customers who have the occupation 'Clerical'.

UPDATE Customers$
SET AnnualIncome = 75000 
WHERE Occupation = 'Clerical'

SELECT *
FROM Customers$
WHERE Occupation = 'Clerical'


-- Change the MaritalStatus to 'M' for customers whose LastName is 'SUAREZ'.

UPDATE Customers$
SET MaritalStatus = 'M'
WHERE LastName = 'SUAREZ';


SELECT *
FROM Customers$
WHERE LastName = 'SUAREZ';


-- Increase the AnnualIncome by 10% for all customers who are homeowners (HomeOwner = 'Y').

UPDATE Customers$
SET AnnualIncome = AnnualIncome * 1.10
WHERE HomeOwner = 'Y';


-- Set the EmailAddress to NULL for customers whose TotalChildren is 0.

UPDATE Customers$
SET EmailAddress = 'NULL'
WHERE TotalChildren = 0;


-- Update the EducationLevel to 'Graduate' for customers who have more than 4 children.

UPDATE Customers$
SET EducationLevel = 'Graduate'
WHERE TotalChildren > 4;


-- How would you add a new column called PhoneNumber of type VARCHAR(15) to the Customers table?

ALTER TABLE Customers$
ADD PhoneNumber VARCHAR(15);

SELECT *FROM Customers$;


-- Write a query to change the data type of the AnnualIncome column from DECIMAL(10, 2) to FLOAT.

ALTER TABLE Customers$
ALTER COLUMN AnnualIncome FLOAT;


-- How can you rename the column HomeOwner to IsHomeOwner in the Customers table?

EXEC sp_rename 'Customers$.HomeOwner', 'IsHomeOwner', 'COLUMN';


-- Write an SQL statement to drop the column Prefix from the Customers table.

SELECT * FROM Customers$


ALTER TABLE Customers$
DROP COLUMN Prefix;


-- Write an SQL query to delete all customers whose AnnualIncome is less than 30,000 from the Customers table.

DELETE FROM Customers$
WHERE AnnualIncome < 30000;


-- How would you delete the record of the customer with the CustomerKey equal to 11025?

DELETE FROM Customers$
WHERE CustomerKey = 11025;


--  How can you remove all rows from the Customers table while keeping its structure intact?

TRUNCATE TABLE Customers$

SELECT *FROM Customers$


--  Write a query to completely remove the Customers table from the database.

DROP TABLE Customers$


-- Write a query to retrieve all customers who are Married and have more than 2 children.

SELECT * FROM Customers$
WHERE MaritalStatus = 'M' AND TotalChildren >2;


-- Find all female customers whose AnnualIncome is more than 50,000 and who are homeowners.

SELECT * FROM Customers$
WHERE Gender = 'F' AND AnnualIncome >50000;


-- Retrieve customers who have the occupation Clerical and education level as Partial College.

SELECT *
FROM Customers$
WHERE Occupation ='Clerical' AND EducationLevel = 'Partial College';


-- List customers whose gender is 'M' and have less than 3 total children.

SELECT * FROM Customers$
WHERE Gender = 'M' AND TotalChildren < 3;


-- Select customers who are homeowners and have an annual income greater than 60,000.

SELECT * FROM Customers$
WHERE HomeOwner = 'Y' AND AnnualIncome > 60000;


--  Write a query to find customers who are either Single or have an occupation as Management.

SELECT * FROM Customers$
WHERE MaritalStatus = 'S' OR Occupation = 'Management';


--Retrieve records of customers whose income is below 30,000 or who do not own a home.

SELECT *FROM Customers$
WHERE AnnualIncome < 30000 OR HomeOwner = 'N';


-- Select all customers whose EducationLevel is either High School or Partial High School.

SELECT *FROM Customers$
WHERE EducationLevel = 'High School' or EducationLevel = 'Partial High School';


-- Find customers who are either Female or have 0 children.

SELECT * FROM Customers$
WHERE Gender = 'Female' OR TotalChildren = 0;


-- Write an SQL query to find customers whose AnnualIncome is between 30,000 and 70,000.

SELECT *
FROM Customers$
WHERE AnnualIncome BETWEEN 30000 AND 70000;


-- Select customers whose birth dates are between '1960-01-01' and '1970-12-31'.

SELECT *
FROM Customers$
WHERE BirthDate BETWEEN '1960-01-01' AND '1970-12-31'


-- Retrieve customers whose CustomerKey is between 11010 and 11020.

SELECT * 
FROM Customers$
WHERE CustomerKey BETWEEN 11010 AND 11020;


-- Find all customers with TotalChildren between 1 and 4.

SELECT *
FROM Customers$
WHERE TotalChildren BETWEEN 1 AND 4;

-- Get records of customers whose AnnualIncome falls between 10,000 and 50,000 and are not homeowners.

SELECT * FROM Customers$
WHERE AnnualIncome BETWEEN 10000 AND 50000;


-- Write a query to retrieve customers with EducationLevel IN ('Bachelors', 'Partial College').

SELECT * 
FROM Customers$
WHERE EducationLevel IN ('Bachelors', 'Partial College');


-- Find customers whose occupation is IN ('Clerical', 'Management', 'Professional').

SELECT *
FROM Customers$
WHERE Occupation IN ('Clerical', 'Management', 'Professional');


-- Select all customers whose gender is IN ('F', 'M').

SELECT *
FROM Customers$
WHERE Gender IN ('F', 'M');


-- Retrieve records where MaritalStatus is IN ('M', 'S').

SELECT *
FROM Customers$
WHERE MaritalStatus IN ('M', 'S');


-- Get customers whose CustomerKey is IN (11005, 11010, 11015, 11020).

SELECT *
FROM Customers$
WHERE CustomerKey IN (11005, 11010, 11015, 11020);


-- Write a query to retrieve customers who are NOT homeowners.

SELECT *
FROM Customers$
WHERE HomeOwner = 'N';


-- Select all customers who do NOT have AnnualIncome between 60,000 and 100,000.

SELECT * FROM Customers$
WHERE AnnualIncome NOT BETWEEN 60000 AND 100000;


-- Retrieve customers whose Occupation is NOT IN ('Clerical', 'Skilled Manual').

SELECT * 
FROM Customers$
WHERE Occupation NOT IN ('Clerical', 'Skilled Manual');


-- Get records of customers who do NOT have an email address ending with '@learnsector.com'.

SELECT *
FROM Customers$
WHERE EmailAddress NOT LIKE '%@learnsector.com';


-- Find all customers who are NOT Married and have more than 1 child.

SELECT * 
FROM Customers$
WHERE MaritalStatus = 'S' AND TotalChildren = 1;


-- Write a query to find customers whose EmailAddress ends with @gmail.com.

SELECT *
FROM Customers$
WHERE EmailAddress LIKE '%@gmail.com';


-- Retrieve all customers whose LastName starts with the letter S.

SELECT LastName
FROM Customers$
WHERE LastName LIKE 'S%';


-- Find customers whose FirstName contains the substring 'ann'.

SELECT FirstName
FROM Customers$
WHERE FirstName LIKE '%ann%'


-- Select all customers whose Occupation includes the word Manual.

SELECT * 
FROM Customers$
WHERE Occupation LIKE '%Manual%';


-- Get a list of customers whose EducationLevel starts with the word Partial.

SELECT *
FROM Customers$
WHERE EducationLevel LIKE 'Partial%';


-- Write a query to find customers whose LastName is exactly 5 characters long.

SELECT * 
FROM Customers$
WHERE LastName LIKE '_____';


-- Retrieve customers whose FirstName starts with J and is exactly 4 characters long.

SELECT *
FROM Customers$
WHERE FirstName LIKE 'J___';


-- Retrieve all customers whose FirstName starts with either J, K, or L.

SELECT *
FROM Customers$
WHERE FirstName LIKE 'J%'
	OR FirstName LIKE 'K%';

-- Find customers whose Occupation starts with any character from [P-Z].

SELECT *
FROM Customers$
WHERE Occupation LIKE '[P-Z]%';


-- Select customers whose EducationLevel contains a letter in the set [oO].

SELECT *
FROM Customers$
WHERE EducationLevel LIKE '%[oO]%';


-- Get customers whose LastName starts with a vowel [AEIOUaeiou]

SELECT *
FROM Customers$
WHERE LastName LIKE '[AEIOUaeiou]%';

-- Write a query to find customers whose FirstName does not start with the letters A, B, or C.

SELECT *
FROM Customers$
WHERE FirstName NOT LIKE 'A%'
  AND FirstName NOT LIKE 'B%'
  AND FirstName NOT LIKE 'C%';


-- Retrieve customers whose LastName does not start with a vowel.

SELECT *
FROM Customers$
WHERE LastName NOT LIKE '[AEIOUaeiou]%';


-- Retrieve employees whose names start with 'Jo' but are not 'John'.

SELECT *
FROM Customers$
WHERE FirstName LIKE 'Jo%'
	 AND FirstName <> 'John;'


-- Find customers whose Occupation starts with any character except M, N, or O.

SELECT *
FROM Customers$
WHERE Occupation NOT LIKE 'M%'
	AND Occupation NOT LIKE 'N%'
	AND Occupation NOT LIKE 'O%';


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------