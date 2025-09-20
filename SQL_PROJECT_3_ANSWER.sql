CREATE DATABASE Project3;


USE Project3;



CREATE TABLE Customers (
    CustomerKey INT PRIMARY KEY,
    Prefix VARCHAR(10),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    MaritalStatus CHAR(1),
    Gender CHAR(5),
    EmailAddress VARCHAR(100),
    AnnualIncome DECIMAL(10, 2),
    TotalChildren INT,
    EducationLevel VARCHAR(50),
    Occupation VARCHAR(50),
    HomeOwner CHAR(1)
);


INSERT INTO Customers (CustomerKey, Prefix, FirstName, LastName, BirthDate, MaritalStatus, Gender, EmailAddress, AnnualIncome, TotalChildren, EducationLevel, Occupation, HomeOwner)
VALUES
(11000, 'MR.', 'JON', 'YANG', '1966-04-08', 'M', 'M', 'jon24@learnsector.com', 90000.00, 2, 'Bachelors', 'Professional', 'Y'),
(11001, 'MR.', 'EUGENE', 'HUANG', '1965-05-14', 'S', 'M', 'eugene10@learnsector.com', 60000.00, 3, 'Bachelors', 'Professional', 'N'),
(11002, 'MR.', 'RUBEN', 'TORRES', '1965-12-08', 'M', 'M', 'ruben35@learnsector.com', 60000.00, 3, 'Bachelors', 'Professional', 'Y'),
(11003, 'MS.', 'CHRISTY', 'ZHU', '1968-02-15', 'S', 'F', 'christy12@learnsector.com', 70000.00, 0, 'Bachelors', 'Professional', 'N'),
(11004, 'MRS.', 'ELIZABETH', 'JOHNSON', '1968-08-08', 'S', 'F', 'elizabeth5@learnsector.com', 80000.00, 5, 'Bachelors', 'Professional', 'Y'),
(11005, 'MR.', 'JULIO', 'RUIZ', '1965-05-08', 'S', 'M', 'julio1@learnsector.com', 70000.00, 0, 'Bachelors', 'Professional', 'Y'),
(11007, 'MR.', 'MARCO', 'MEHTA', '1964-09-05', 'M', 'M', 'marco14@learnsector.com', 60000.00, 3, 'Bachelors', 'Professional', 'Y'),
(11008, 'MRS.', 'ROBIN', 'VERHOFF', '1964-07-07', 'S', 'F', 'rob4@learnsector.com', 60000.00, 4, 'Bachelors', 'Professional', 'Y'),
(11009, 'MR.', 'SHANNON', 'CARLSON', '1964-01-04', 'S', 'M', 'shannon38@learnsector.com', 70000.00, 0, 'Bachelors', 'Professional', 'N'),
(11010, 'MS.', 'JACQUELYN', 'SUAREZ', '1964-06-02', 'S', 'F', 'jacquelyn20@learnsector.com', 70000.00, 0, 'Bachelors', 'Professional', 'N'),
(11011, 'MR.', 'CURTIS', 'LU', '1963-04-11', 'M', 'M', 'curtis9@learnsector.com', 60000.00, 4, 'Bachelors', 'Professional', 'Y'),
(11012, 'MRS.', 'LAUREN', 'WALKER', '1968-01-18', 'M', 'F', 'lauren41@learnsector.com', 100000.00, 2, 'Bachelors', 'Management', 'Y'),
(11013, 'MR.', 'IAN', 'JENKINS', '1968-06-08', 'M', 'M', 'ian47@learnsector.com', 100000.00, 2, 'Bachelors', 'Management', 'Y'),
(11014, 'MRS.', 'SYDNEY', 'BENNETT', '1968-09-05', 'S', 'F', 'sydney23@learnsector.com', 100000.00, 3, 'Bachelors', 'Management', 'N'),
(11015, 'MS.', 'CHLOE', 'YOUNG', '1979-02-27', 'S', 'F', 'chloe23@learnsector.com', 30000.00, 0, 'Partial College', 'Skilled Manual', 'N'),
(11016, 'MR.', 'WYATT', 'HILL', '1979-04-28', 'M', 'M', 'wyatt32@learnsector.com', 30000.00, 0, 'Partial College', 'Skilled Manual', 'Y'),
(11017, 'MRS.', 'SHANNON', 'WANG', '1944-06-26', 'S', 'F', 'shannon1@learnsector.com', 20000.00, 4, 'High School', 'Skilled Manual', 'Y'),
(11018, 'MR.', 'CLARENCE', 'RAI', '1944-09-10', 'S', 'M', 'clarence32@learnsector.com', 30000.00, 2, 'Partial College', 'Clerical', 'Y'),
(11019, 'MR.', 'LUKE', 'LAL', '1978-07-03', 'S', 'M', 'luke18@learnsector.com', 40000.00, 0, 'High School', 'Skilled Manual', 'N'),
(11020, 'MR.', 'JORDAN', 'KING', '1978-09-20', 'S', 'M', 'jordan73@learnsector.com', 40000.00, 0, 'High School', 'Skilled Manual', 'N'),
(11021, 'MS.', 'DESTINY', 'WILSON', '1978-03-09', 'S', 'F', 'destiny7@learnsector.com', 40000.00, 0, 'Partial College', 'Skilled Manual', 'N'),
(11022, 'MR.', 'ETHAN', 'ZHANG', '1978-12-10', 'M', 'M', 'ethan20@learnsector.com', 40000.00, 0, 'Partial College', 'Skilled Manual', 'Y'),
(11023, 'MR.', 'SETH', 'EDWARDS', '1978-11-10', 'M', 'M', 'seth46@learnsector.com', 40000.00, 0, 'Partial College', 'Skilled Manual', 'Y'),
(11024, 'MR.', 'RUSSELL', 'XIE', '1978-09-17', 'M', 'M', 'russell7@learnsector.com', 60000.00, 0, 'Partial College', 'Skilled Manual', 'Y'),
(11025, '', 'ALEJANDRO', 'BECK', '1945-12-23', 'M', 'NA', 'alejandro45@learnsector.com', 10000.00, 2, 'Partial High School', 'Clerical', 'Y'),
(11026, 'MR.', 'HAROLD', 'SAI', '1946-03-04', 'S', 'M', 'harold3@learnsector.com', 30000.00, 2, 'Partial College', 'Clerical', 'N'),
(11027, 'MR.', 'JESSIE', 'ZHAO', '1946-07-12', 'M', 'M', 'jessie16@learnsector.com', 30000.00, 2, 'Partial College', 'Clerical', 'Y'),
(11028, 'MRS.', 'JILL', 'JIMENEZ', '1946-11-04', 'M', 'F', 'jill13@learnsector.com', 30000.00, 2, 'Partial College', 'Clerical', 'Y'),
(11029, 'MR.', 'JIMMY', 'MORENO', '1946-12-21', 'M', 'M', 'jimmy9@learnsector.com', 30000.00, 2, 'Partial College', 'Clerical', 'Y');

SELECT *FROM Customers;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieve all customer records.

SELECT *FROM Customers;



-- Display only FirstName, LastName, and EmailAddress of all customers.

SELECT FirstName, LastName, EmailAddress 
FROM Customers;



-- List all unique occupations from the table.

SELECT DISTINCT Occupation
FROM Customers;



-- Show customers who are homeowners (HomeOwner = 'Y').


SELECT FirstName, LastName, HomeOwner
FROM Customers
WHERE Homeowner = 'Y';


-- Retrieve all customers with AnnualIncome > 60000.

SELECT FirstName, Lastname, AnnualIncome 
FROM Customers
WHERE AnnualIncome > 60000;


-- Find customers who are married (MaritalStatus = 'M').

SELECT Firstname, LastName, MaritalStatus
FROM Customers
WHERE MaritalStatus = 'M';


--  Display all customers whose first name starts with J.

SELECT Firstname, LastName
FROM Customers
WHERE FirstName LIKE 'J%';


--  List all customers born before 1970.

SELECT Firstname, LastName, BirthDate
FROM Customers
WHERE YEAR(BirthDate) < 1970;


-- Count the total number of customers.

SELECT COUNT(*)
FROM Customers;


-- Show all customers sorted by AnnualIncome in descending order.


SELECT FirstName, LastName, AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Intermediate-Level SQL Questions


-- Find the average AnnualIncome of customers grouped by Occupation.

SELECT Occupation, AVG(AnnualIncome) AS AvgInc
FROM Customers
GROUP BY Occupation;


-- Retrieve the number of customers for each EducationLevel.

SELECT EducationLevel, COUNT(*) AS TotalNumber
FROM Customers
GROUP BY EducationLevel;


-- Find the highest AnnualIncome among all customers.

SELECT TOP 1 AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;


-- USING DENSE RANK QUERY

SELECT Firstname, Lastname, AnnualIncome 
FROM ( SELECT FirstName, Lastname, AnnualIncome , DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK = 1;



-- Find the lowest AnnualIncome among all customers.

SELECT MIN(AnnualIncome) AS LOWESTINC
FROM Customers;


SELECT TOP 1 AnnualIncome
FROM Customers
ORDER BY AnnualIncome;


SELECT FirstName, LastName, AnnualIncome
FROM ( SELECT FirstName, LastName, AnnualIncome , DENSE_RANK() OVER ( ORDER BY AnnualIncome ) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK = 1;



-- Retrieve customers with TotalChildren > 2.


SELECT FirstName, LastName, TotalChildren
FROM Customers
WHERE TotalChildren > 2;


-- Find customers whose email address ends with @learnsector.com.

SELECT FirstName, LastName , EmailAddress
FROM Customers
WHERE EmailAddress LIKE '%@learnsector.com';



--  Display the full name (FirstName + LastName) as a single column.


SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;


-- Find customers who are not homeowners.

SELECT FirstName, LastName, HomeOwner 
FROM Customers
WHERE HomeOwner = 'N';



-- Retrieve customers who earn between 50000 and 80000.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome BETWEEN 50000 AND 80000;



-- Get all customers with NULL or empty prefix.


SELECT Prefix, FirstName , LastName 
FROM Customers
WHERE Prefix IS NULL OR Prefix = ' ';



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Advanced / Interview-Level SQL Questions



-- Retrieve the maximum and minimum AnnualIncome for each Occupation.

SELECT Occupation, MIN(AnnualIncome) AS MinInc , MAX(AnnualIncome) AS MaxInc
FROM Customers
GROUP BY Occupation;


-- Find the difference between max and min AnnualIncome for each Occupation.

SELECT Occupation, MAX(AnnualIncome) - MIN(AnnualIncome) AS SalaryDiff
FROM Customers
GROUP BY Occupation;


-- Find the difference between max and min AnnualIncome for each Occupation Using LAG

SELECT Occupation, AnnualIncome - LAG(AnnualIncome) OVER ( PARTITION BY Occupation ORDER BY AnnualIncome) AS SalaryDiff
FROM Customers;


-- Find customers earning the highest income within each Occupation.

SELECT Occupation, MAX(AnnualIncome) AS MaxInc
FROM Customers
GROUP BY Occupation;


-- USING DENSE RANK

SELECT FirstName, Occupation , AnnualIncome 
FROM ( SELECT FirstName, LastName, Occupation, AnnualIncome , DENSE_RANK() OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK = 1;


-- Retrieve the top 3 highest incomes across all customers.

SELECT DISTINCT TOP 3 AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;


-- USING DENSE RANK

SELECT FirstName, LastName , AnnualIncome 
FROM (SELECT FirstName, LastName, AnnualIncome , DENSE_RANK() OVER (ORDER BY AnnualIncome DESC ) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK <=3;



-- List occupations where the average AnnualIncome > 60000.


SELECT FirstName, Lastname, Occupation, AnnualIncome 
FROM Customers
WHERE AnnualIncome > 60000;


-- Find customers who have the same AnnualIncome as at least one other customer.

SELECT DISTINCT C1.FirstName, C1.LastName, C1.AnnualIncome
FROM Customers C1
JOIN Customers C2
     ON C1.AnnualIncome = C2.AnnualIncome
    AND C1.CustomerKey <> C2.CustomerKey;




-- Retrieve customers with duplicate LastName.

SELECT LastName , COUNT(*) AS TotalDuplicated
FROM Customers
GROUP BY LastName 
HAVING COUNT(*) > 1;


-- Find the percentage of customers who are homeowners.

SELECT ROUND(100.00 * SUM(CASE WHEN HomeOwner = 'Y' THEN 1 ELSE 0 END)/COUNT(*), 2) AS HomeOwnerPERCENT
FROM Customers;


-- Find the percentage of customers who are Bachelors 

SELECT ROUND(100.0 * SUM(CASE WHEN EducationLevel = 'Bachelors' THEN 1 ELSE 0 END) / COUNT(*), 2) AS EduPercent
FROM Customers;



-- Retrieve occupations with more than 5 employees.

SELECT Occupation , COUNT(*) AS TotalEmps
FROM Customers
GROUP BY Occupation
HAVING COUNT(*) > 5;


-- Find the total AnnualIncome contributed by homeowners vs non-homeowners.

SELECT HomeOwner, SUM(AnnualIncome) AS TotalInc
FROM Customers
GROUP BY HomeOwner;


-- Write a query to classify customers as High Income (>80,000), Medium Income (50,000–80,000), or Low Income (<50,000).

SELECT FirstName, LastName, AnnualIncome,
CASE 
	WHEN AnnualIncome > 80000 THEN 'High Income'
	WHEN AnnualIncome BETWEEN 50000 AND 80000 THEN 'Medium Income'
	ELSE 'Low Income'
	END AS IncomeBrackets
FROM Customers;



-- Show the oldest and youngest customers (using BirthDate).


SELECT MIN(BirthDate) AS Oldest, MAX(BirthDate) AS Youngest
FROM Customers;


-- Retrieve all customers who have the maximum number of children.

SELECT TOP 1 TotalChildren
FROM Customers
ORDER BY TotalChildren DESC;


-- USING DENSE KEYWORD

SELECT FirstName, LastName, TotalChildren
FROM ( SELECT FirstName, LastName, TotalChildren, DENSE_RANK() OVER (ORDER BY TotalChildren DESC) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK = 1;



-- Rank customers within each Occupation based on AnnualIncome (using RANK() or DENSE_RANK()).


SELECT FirstName, LastName,Occupation,AnnualIncome, DENSE_RANK() OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RANK
FROM Customers;



-- Retrieve customers whose income is above the average income.

SELECT FirstName, LastName, Occupation, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers);


--  Retrieve customers whose income is above the average income of their occupation.

SELECT  FirstName, LastName, Occupation, AnnualIncome
FROM Customers C1
WHERE AnnualIncome >
(SELECT AVG(AnnualIncome) 
FROM Customers C2
WHERE C2.Occupation = C1.Occupation);


-- FIND THE SECOND HIGHEST SALARY

SELECT MAX(AnnualIncome) 
FROM Customers
WHERE AnnualIncome <
(SELECT MAX(AnnualIncome)
FROM Customers);


-- USING DENSE RANK

SELECT FirstName , LastName , AnnualIncome
FROM ( SELECT FirstName , LastName , AnnualIncome , DENSE_RANK() OVER( ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK  = 2;


-- Find the total number of male vs female customers.

SELECT Gender, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Gender;


-- Find customers who have an email containing their first name.


SELECT FirstName, EmailAddress
FROM Customers
WHERE EmailAddress LIKE FirstName + '%';



-- List occupations where both Male and Female customers exist.

SELECT Occupation
FROM Customers
GROUP BY Occupation
HAVING SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0  END) >0 
AND SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) >0;


-- WITH COUNTS TOO

SELECT Occupation,
       SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS MaleCount,
       SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS FemaleCount
FROM Customers
GROUP BY Occupation
HAVING SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) > 0;



-- Show customers who do not have children (TotalChildren = 0).


SELECT FirstName, LastName, TotalChildren
FROM Customers
WHERE TotalChildren IS NULL OR TotalChildren = 0;




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Complex / Difficult SQL Questions


-- For each Occupation, find the customer with the earliest BirthDate (oldest).


SELECT Occupation, MIN(BirthDate) AS OldestKid
FROM Customers
GROUP BY Occupation 
ORDER BY MIN(BIrthDate) DESC;


-- Find customers who earn more than the average income.


SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers);



-- Retrieve the top 2 earners in each occupation.

SELECT DISTINCT TOP 2  AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;


-- USING DENSE KEYWORD

SELECT FirstName, LastName, Occupation, AnnualIncome
FROM ( SELECT Firstname, LastName, Occupation , AnnualIncome , DENSE_RANK() OVER ( PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RANKEDSERIES
WHERE RANK <= 2;



-- Calculate the cumulative sum of AnnualIncome ordered by BirthDate.

SELECT FirstName, LastName , BirthDate, SUM(AnnualIncome) OVER (ORDER BY BirthDate) AS Cummulative_SUM
FROM Customers
ORDER BY BirthDate;


-- DIPLAY AGE OF EVERY CUSTOMER

SELECT FirstName, LastName, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Customers;


-- DISPLAY THE NAME OF BIRTHMONTH

SELECT FirstName, LastName, BirthDate, DATENAME(MONTH, BirthDate) AS MonthName
FROM Customers;



-- Show each customer’s income compared to the average income of all customers (above/below).

SELECT AVG(AnnualIncome) AS AvgInc
FROM Customers;

-- USING WINDOW FUNCTION
SELECT FirstName, LastName , AnnualIncome,
CASE 
	WHEN AnnualIncome > AVG(AnnualIncome) OVER () THEN 'ABOVE'
	ELSE 'BELOW'
END AS IncomeClassification
FROM Customers;






-- Retrieve customers who earn above the overall average income AND are homeowners.


SELECT FirstName, LastName, AnnualIncome, HomeOwner
FROM (
    SELECT *, AVG(AnnualIncome) OVER () AS AvgIncome
    FROM Customers
) AS Sub
WHERE HomeOwner = 'Y' AND AnnualIncome > AvgIncome;



-- Retrieve the youngest customer per occupation.

SELECT Occupation ,MAX(BirthDate) AS Youngest
FROM Customers
GROUP BY Occupation
ORDER BY MAX(BirthDate) DESC;


-- Write a query to find customers whose first and last names start with the same letter.

SELECT FirstName, LastName
FROM Customers
WHERE UPPER(LEFT(FirstName,1)) = UPPER(LEFT(LastName, 1));



-- Find customers whose AnnualIncome is within 10% of the max AnnualIncome.

SELECT FirstName , LastName , AnnualIncome
FROM Customers
WHERE AnnualIncome >= 0.9 * (SELECT MAX(AnnualIncome) FROM Customers)
ORDER BY AnnualIncome DESC;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT *FROM Customers;




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------





