CREATE DATABASE AssignmentFour;

USE AssignmentFour;


-- SQL Assignment-4( SQL Subqueries, CASE Statements, INDEXES ,VIEWS , Stored Procedure ,  Transactions , Triggers )
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- WE USE 'IN' WHEN WE HAVE TO RETURN MULTIPLE VALUES 
-- WE USE '=' IN SUBQUERY WHEN WE HAVE TO RETURN SINGLE VALUE


SELECT *FROM Customers$;

--TO CHECK THE DATATYPE OF TABLE IN SQL

sp_help Customers$;


------------------------------------------
-- SQL Case Statements
------------------------------------------

-- 1. **Write an SQL query to categorize customers' AnnualIncome into three groups: 'Low Income' for those earning less than $60,000, 'Middle Income' for those earning between $60,000 and $80,000, and 'High Income' for those earning more than $80,000. 
--		Use a CASE statement to achieve this.**

SELECT FirstName, LastName, AnnualIncome,
CASE
	WHEN AnnualIncome < 60000 THEN 'LOW INCOME'
	WHEN AnnualIncome BETWEEN 60000 AND 80000 THEN 'MIDDLE INCOME'
	WHEN AnnualIncome > 80000 THEN 'HIGH INCOME'
	ELSE 'UNKNOWN'
END AS NewAnnualInc
FROM Customers$;



-- 2. **Using a CASE statement, create a query that returns 'Married' if the MaritalStatus is 'M', 'Single' if it's 'S', and 'Unknown' for any other value.**

SELECT FirstName, LastName, MaritalStatus,
CASE
	WHEN MaritalStatus ='M' THEN 'MARRIED'
	WHEN MaritalStatus = 'S' THEN 'SINGLE'
	ELSE 'UNKNOWN'
END AS NewMarStatus
FROM Customers$;


-- 3. **Write a query to calculate a 'Discount' column where customers with an AnnualIncome above $70,000 get a 20% discount, those between $50,000 and $70,000 get a 10% discount, and those below $50,000 get no discount. 
--	Use a CASE statement.**

SELECT FirstName, LastName, AnnualIncome,
CASE
	WHEN AnnualIncome > 70000 THEN 0.20 * AnnualIncome
	WHEN AnnualIncome BETWEEN 50000 AND 70000 THEN 0.10 * AnnualIncome
	ELSE 0
END AS NewDiscAnnInc
FROM Customers$;


-- 4. **Create an SQL query that uses CASE to label customers as 'High Earner' if their AnnualIncome is above $80,000, 'Medium Earner' if it's between $60,000 and $80,000, and 'Low Earner' if it's below $60,000.**

SELECT FirstName, LastName, AnnualIncome,
CASE
	WHEN AnnualIncome > 80000 THEN 'High Earner'
	WHEN AnnualIncome BETWEEN 60000 AND 80000 THEN 'Medium Earner'
	ELSE 'Low Earner'
END AS NewEarnerData
FROM Customers$;


-- 5. **Write a query using CASE that returns 'Senior' if the customer's age (calculated from BirthDate) is greater than 60, 'Adult' if it's between 30 and 60, and 'Young' if it's below 30.**

SELECT 
  FirstName, 
  LastName, 
  BirthDate,
  -- Accurate age calculation
  CASE 
    WHEN MONTH(BirthDate) < MONTH(GETDATE()) 
         OR (MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) <= DAY(GETDATE()))
    THEN DATEDIFF(YEAR, BirthDate, GETDATE())
    ELSE DATEDIFF(YEAR, BirthDate, GETDATE()) - 1
  END AS Age,
  
  -- Classification based on age
  CASE 
    WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 60 THEN 'Senior'
    WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 30 AND 60 THEN 'Adult'
    ELSE 'Young'
  END AS AgeGroup

FROM Customers$;



-- 6. **Using a CASE statement, create a query that marks 'Eligible for Credit' for customers whose AnnualIncome is more than $50,000 and 'Not Eligible' for those whose income is less than or equal to $50,000.**

SELECT Firstname, LastName, AnnualIncome,
CASE
	WHEN AnnualIncome > 50000 THEN 'Eligible for Credit'
	WHEN AnnualIncome <= 50000 THEN 'Not Eligible'
	ELSE 'Not Applicable'
END AS NewEligibility
FROM Customers$;



--7. **Write a query using a CASE statement to classify customers as 'Homeowner' if HomeOwner is 'Y', 'Non-homeowner' if HomeOwner is 'N', and 'Unknown' if the value is null or not available.**

SELECT FirstName, LastName, HomeOwner,
CASE
	WHEN HomeOwner = 'Y' THEN 'HomeOwner'
	WHEN HomeOwner = 'N' THEN 'Non-HomeOwner'
	ELSE 'UNKNOWN'
END AS NewHomeStatus
FROM Customers$;


-- 8. **Use CASE in an SQL query to return a column called 'OccupationGroup' where 'Professional' is grouped as 'White Collar', 'Manual' as 'Blue Collar', and any other occupation as 'Other'.**

SELECT FirstName, LastName, Occupation,
CASE
	WHEN Occupation = 'Professional' THEN 'WHITE COLLAR'
	WHEN Occupation = 'Skilled Manual' THEN 'BLUE COLLAR'
	ELSE 'OTHER'
END AS OccupationGroup
FROM Customers$;


-- 9. **Write an SQL query with a CASE statement that calculates a bonus where customers with more than 3 children get a $1,000 bonus, customers with 1 to 3 children get a $500 bonus, and customers with no children get no bonus.**

SELECT FirstName, LastName, TotalChildren, AnnualIncome,
CASE
	WHEN TotalChildren > 3 THEN AnnualIncome + 1000
	WHEN TotalChildren BETWEEN 1 AND 3 THEN AnnualIncome + 500
	ELSE 0
END AS NewAnnBonus
FROM Customers$;


-- 10. **Create a query that uses CASE to categorize customers by education level: 'Graduate' if EducationLevel is 'Bachelors' or higher, 'Undergraduate' if it's 'Some College', and 'Non-Graduate' for any other value.**

SELECT 
  FirstName, 
  LastName, 
  EducationLevel,
  CASE 
    WHEN EducationLevel IN ('Bachelors', 'Masters', 'PhD') THEN 'Graduate'
    WHEN EducationLevel = 'Some College' THEN 'Undergraduate'
    ELSE 'Non-Graduate'
  END AS EducationCategory
FROM Customers$;



--------------------------------------
-- SUBQUERY
--------------------------------------

-- 1. **Write an SQL query to find the customers who earn more than the average AnnualIncome of all customers. Use a subquery to calculate the average income.**

SELECT FirstName, LastName, AnnualIncome 
FROM Customers$
WHERE AnnualIncome > (
  SELECT AVG(AnnualIncome)
  FROM Customers$
);


-- 2. **Create a query that returns the FirstName and LastName of customers who have the highest AnnualIncome. Use a subquery to find the maximum AnnualIncome.**

SELECT FirstName, LastName, AnnualIncome
FROM Customers$
WHERE AnnualIncome = (
SELECT MAX(AnnualIncome)
FROM Customers$);


-- 3. **Write a query to list all customers whose AnnualIncome is higher than the average AnnualIncome of customers in the same Occupation. 
-- Use a subquery to calculate the average income per occupation.**

SELECT FirstName, LastName,Occupation, AnnualIncome
FROM Customers$ AS c
WHERE AnnualIncome > (
SELECT AVG(AnnualIncome)
FROM Customers$ AS sub
WHERE sub.Occupation = c.Occupation);


-- 4. **Using a subquery, write an SQL query to find customers who have more children than the customer with the first name 'JON'.**

SELECT FirstName, LastName, TotalChildren
FROM Customers$
WHERE TotalChildren > (
    SELECT MAX(TotalChildren)
    FROM Customers$
    WHERE FirstName = 'JON'
);


-- 5. **Write a query that returns the names of customers who own a home ('HomeOwner' = 'Y') and whose AnnualIncome is higher than any customer who does not own a home ('HomeOwner' = 'N'). 
-- Use a subquery to compare the incomes.**

SELECT FirstName, LastName, AnnualIncome
FROM Customers$
WHERE HomeOwner = 'Y'
  AND AnnualIncome > (
    SELECT MAX(AnnualIncome)
    FROM Customers$
    WHERE HomeOwner = 'N'
);


-- 6. **Create an SQL query to find customers whose MaritalStatus is 'S' (single) and who earn more than the average income of married customers ('M'). 
-- Use a subquery to get the average income of married customers.**

SELECT FirstName, LastName, AnnualIncome, MaritalStatus
FROM Customers$
WHERE MaritalStatus = 'S' 
AND AnnualIncome > (
SELECT AVG(AnnualIncome) 
FROM Customers$
WHERE MaritalStatus = 'M');


-- 7. **Write a query that returns the details of customers whose BirthDate is the same as the oldest customer's BirthDate. 
-- Use a subquery to find the minimum BirthDate.**

SELECT FirstName, LastName, BirthDate
FROM Customers$
WHERE BirthDate = (
SELECT MIN(BirthDate) 
FROM Customers$ );


-- 8. **Write a query that returns the names of customers who have the same number of children as the customer with the highest income. 
-- Use a subquery to find the total number of children for the highest-income customer.**

SELECT FirstName, LastName, TotalChildren
FROM Customers$
WHERE TotalChildren = (
  SELECT TOP 1 TotalChildren
  FROM Customers$
  WHERE AnnualIncome = (
    SELECT MAX(AnnualIncome)
    FROM Customers$
  )
);


-- 9. **Create a query that lists the customers whose AnnualIncome is less than the average income of all customers but greater than the lowest income of all customers. 
-- Use subqueries to calculate both the average and minimum incomes.**


SELECT FirstName, LastName, AnnualIncome
FROM Customers$
WHERE AnnualIncome < (
    SELECT AVG(AnnualIncome) FROM Customers$
)
AND AnnualIncome > (
    SELECT MIN(AnnualIncome) FROM Customers$
);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SQL INDEXES

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Question 1: Create a basic index on the LastName column. 
--Q: How do you create an index on the LastName column in the 
-- Customers table to speed up searches by last name?

CREATE INDEX index_lastname
ON Customers$(LastName);


SELECT * FROM Customers$ WHERE LastName = 'Smith';


-- Question 2: Create a unique index on the EmailAddress column. 
-- Q: How do you create a unique index on the EmailAddress column to 
-- ensure all email addresses in the Customers table are unique?

CREATE UNIQUE INDEX index_email
ON Customers$(EmailAddress);

--TO CHECK DUPLICATES IN THE TABLE 
SELECT EmailAddress,COUNT(*) AS NewDuplicates
FROM Customers$
GROUP BY EmailAddress
HAVING COUNT(*) > 1;



DROP INDEX index_lastname ON Customers$


-- Question 3: Create a composite index on the FirstName and LastName 
--columns. Q: How do you create an index on both the FirstName and LastName columns to optimize searches by full name?

CREATE INDEX index_newcompositeind
ON Customers$(FirstName, LastName);


--Question 4: Create a clustered index on the CustomerKey column. Q: How do you create a clustered index on the CustomerKey column to 
-- optimize the retrieval of rows by the primary key? 


CREATE INDEX index_custKey
ON Customers$(CustomerKey);


DROP INDEX index_custKey ON Customers$;

-- Question 5: Create a non-clustered index on the AnnualIncome column. Q: How do you create a non-clustered index on the AnnualIncome 
-- column to speed up queries that filter by annual income?

CREATE NONCLUSTERED INDEX index_annind
ON Customers$(AnnualIncome);

DROP index index_annind ON Customers$;


--Question 6: Create an index on the Occupation column. Q: How do you create an index on the Occupation column to speed up searches by occupation?

CREATE INDEX index_occind
ON Customers$(Occupation);

--TO CHECK DUPLICATES
SELECT Occupation, COUNT(*) AS DuplicateOcc
FROM Customers$
GROUP BY Occupation
HAVING COUNT(*) > 1;


-- Question 7: Create a unique index on the CustomerKey column. Q: How do you create a unique index on the CustomerKey column to ensure each customer has a unique key? 

CREATE UNIQUE INDEX index_custkeyy
ON Customers$(CustomerKey);


--TO CHECK DUPLICATES
SELECT CustomerKey, COUNT(*) AS NewDuplicates
FROM Customers$
GROUP BY CustomerKey
HAVING COUNT(*) > 1;


-- Question 9: Create an index on the Gender and MaritalStatus columns. Q: How do you create a composite index on the Gender and 
-- MaritalStatus columns to optimize searches by these two columns? 

CREATE INDEX MarGen
ON Customers$(MaritalStatus, Gender);


-- Question 10: Create a non-clustered index with included columns. Q: How do you create a non-clustered index on the LastName column 
-- and include the FirstName and EmailAddress columns to optimize specific queries? 

CREATE NONCLUSTERED INDEX index_lstname
ON Customers$(LastName, FirstName, EmailAddress);


-------------------------------------------------------------------------------
-- SUBQUERIES ASSIGNMENTS
-------------------------------------------------------------------------------
--Step 1: Creating the Customers and Orders Tables 
CREATE TABLE Customers ( 
customer_id INT PRIMARY KEY, 
first_name VARCHAR(50), 
last_name VARCHAR(50), 
city VARCHAR(50), 
status VARCHAR(20) 
); 


CREATE TABLE Orders ( 
order_id INT PRIMARY KEY, 
customer_id INT, 
amount DECIMAL(10, 2), 
order_date DATE, 
FOREIGN KEY (customer_id) REFERENCES 
Customers(customer_id) 
); 

-- Step 2: Inserting Records into the Customers and Orders Tables -- Insert records into Customers table 
INSERT INTO Customers (customer_id, first_name, 
last_name, city, status) 
VALUES  
(1, 'John', 'Doe', 'New York', 'Regular'), 
(2, 'Jane', 'Smith', 'Los Angeles', 'Regular'), 
(3, 'Michael', 'Brown', 'Chicago', 'Regular'), 
(4, 'Emily', 'Davis', 'Houston', 'Regular'), 
(5, 'David', 'Wilson', 'Phoenix', 'Regular'), 
(6, 'Sarah', 'Lee', 'San Diego', 'Regular'), 
(7, 'Chris', 'Johnson', 'Dallas', 'Regular'), 
(8, 'Anna', 'Miller', 'San Francisco', 'Regular'), 
(9, 'Paul', 'Taylor', 'Seattle', 'Regular'), 
(10, 'Laura', 'Anderson', 'Denver', 'Regular'); 


-- Insert records into Orders table 
INSERT INTO Orders (order_id, customer_id, amount, 
order_date) 
VALUES  
(1, 1, 300.00, '2024-01-10'), 
(2, 1, 700.00, '2024-02-15'), 
(3, 2, 200.00, '2024-01-20'), 
(4, 2, 900.00, '2024-03-05'), 
(5, 3, 1500.00, '2024-01-25'), 
(6, 4, 1000.00, '2024-02-28'), 
(7, 5, 1200.00, '2024-03-15'), 
(8, 6, 800.00, '2024-02-20'), 
(9, 7, 300.00, '2024-01-30'), 
(10, 8, 600.00, '2024-03-25'); 


SELECT *FROM Customers;
SELECT * FROM Orders;


-- 1.Find the name of the customer who has placed the highest order.

--USING JOIN
SELECT TOP 1 Customers.first_name , Customers.last_name, MAX(Orders.amount) AS MaximumOrder
FROM Customers
JOIN Orders 
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.first_name, Customers.last_name
ORDER BY MaximumOrder DESC;

--USING SUBQUERY
SELECT c.first_name, c.last_name, o.amount
FROM Customers AS c
JOIN Orders AS o ON c.customer_id = o.customer_id
WHERE o.amount = (
  SELECT MAX(amount)
  FROM Orders
);


-- 2.List customers from cities where the average order amount is greater than $200

-- USING JOIN
SELECT Customers.first_name, Customers.last_name, Customers.city, AVG(Orders.amount) AS AvgOrdAmt
FROM Customers
JOIN Orders 
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.first_name, Customers.last_name, Customers.city
HAVING AVG(Orders.amount) > 200;

-- USING SUBQUERY

SELECT first_name, last_name, city
FROM Customers
WHERE city IN (
    SELECT Customers.city
	FROM Customers
	JOIN Orders 
	ON Customers.customer_id = Orders.customer_id
	GROUP BY Customers.city
	HAVING AVG(Orders.amount) > 200);



-- 3.Retrieve customers and their respective highest order amount

--USING JOIN

SELECT Customers.first_name, Customers.last_name, MAX(Orders.amount) AS NewMaxOrder
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.first_name, Customers.last_name;

--USING SUBQUERY
SELECT c.first_name, c.last_name, o.amount
FROM Customers c
JOIN Orders o 
ON c.customer_id = o.customer_id
WHERE o.amount = (
    SELECT MAX(o2.amount)
    FROM Orders o2
    WHERE o2.customer_id = c.customer_id
);


-- 4.Find the unique cities where customers have placed orders.

--USING JOINS
SELECT DISTINCT Customers.city
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- USING SUBQUERY
SELECT DISTINCT city
FROM Customers
WHERE city IN (
SELECT city
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id);


-- 5.List customers who have placed an order smaller than the largest order amount by customer with ID 7

SELECT Customers.first_name, Customers.last_name, Orders.amount
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE Orders.amount < (
SELECT MAX(amount)
FROM Orders
WHERE customer_id = 7);


-- 6.Retrieve customers who have an average order amount greater than the overall average order amount

SELECT c.first_name, c.last_name, AVG(o.amount) AS AvgOrder
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
HAVING AVG(o.amount) > (
    SELECT AVG(amount) FROM Orders
);


-- 7.Find the names of the top 3 customers by total order amount

-- USING JOINS
SELECT TOP 3 Customers.first_name, Customers.last_name, SUM(Orders.amount) AS TotalOrd
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.first_name, Customers.last_name
ORDER BY SUM(Orders.amount) DESC;


-- USING SUBQUERY
SELECT TOP 3 
    SUBSTRING(Customers.first_name, 1, 3) AS ShortFirstName, 
    Customers.last_name, 
    SUM(Orders.amount) AS TotalOrd
FROM Customers
JOIN Orders
    ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.first_name, Customers.last_name
ORDER BY SUM(Orders.amount) DESC;


-- 9.Find customers who have placed exactly 5 orders

--USING JOINS

SELECT Customers.first_name, Customers.last_name, COUNT(*) AS TotalOrders
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.first_name, Customers.last_name
HAVING COUNT(*) = 5;

--USING SUBQUERY
SELECT first_name, last_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(*) = 5
);



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SQL VIEWS

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *FROM Customers$;


-- 1. Create a view to display only the `CustomerKey`, `FirstName`, and `LastName` from the customer table.

CREATE VIEW custdetails AS
SELECT CustomerKey, FirstName, LastName
FROM Customers$;


SELECT * FROM custdetails;



-- 2. Write a view that shows the full customer details for all customers with an annual income greater than $80,000.

CREATE VIEW custanninc AS
SELECT FirstName, LastName, AnnualIncome
FROM Customers$
WHERE AnnualIncome > 80000;

SELECT *FROM custanninc;


-- 3. Create a view to display all customers whose marital status is 'S' (Single).

CREATE VIEW CustMarStatus AS
SELECT FirstName, LastName, MaritalStatus
FROM Customers$
WHERE MaritalStatus = 'S';

SELECT *FROM CustmarStatus;


-- 4. Write a view to show the first name, last name, and email addresses of all female customers.

CREATE VIEW CustGender AS
SELECT FirstName, LastName, Gender
FROM Customers$
WHERE Gender = 'F';


SELECT * FROM CustGender;


-- 5. Create a view that displays customers who are homeowners and have more than 2 children.

CREATE VIEW CustHomeSta AS
SELECT FirstName, LastName, HomeOwner, TotalChildren
FROM Customers$
WHERE HomeOwner = 'Y' AND TotalChildren > 2;

SELECT * FROM CustHomeSta;


-- 6. Write a view to show customers with a Bachelor's degree and who are in the 'Professional' occupation.

CREATE VIEW CustOcc AS
SELECT FirstName, LastName, EducationLevel ,Occupation 
FROM Customers$
WHERE EducationLevel = 'Bachelors' AND Occupation = 'Professional';


SELECT * FROM CustOcc;


-- 7. Create a view that shows customers who were born before the year 1965.


-- 7. Create a view that shows customers who were born before the year 1965.

CREATE VIEW CustDate AS
SELECT FirstName, LastName, BirthDate
FROM Customers$
WHERE BirthDate < '1965-01-01';

SELECT * FROM CustDate;


-- 8. Write a view that lists all male customers whose annual income is between $60,000 and $100,000.

CREATE VIEW CustGen AS
SELECT FirstName, LastName, Gender, AnnualIncome
FROM Customers$
WHERE Gender = 'M' AND AnnualIncome BETWEEN 60000 AND 100000;

SELECT *FROM CustGen;


-- 9. Create a view to display customers whose `Occupation` is either 'Professional' or 'Management'.

CREATE VIEW CustOcp AS
SELECT FirstName, LastName, Occupation
FROM Customers$
WHERE Occupation IN ('Professional', 'Management');

SELECT *FROM CustOcp;


-- 10. Write a view that shows the total number of customers in each occupation.

CREATE VIEW CustTotalOcc AS
SELECT Occupation, COUNT(*) AS NewCountCust
FROM Customers$
GROUP BY Occupation;

SELECT *FROM CustTotalOcc;


-- 11. Create a view to display the customers who are not homeowners.

CREATE VIEW CustNoHomeOwn AS
SELECT FirstName, LastName, HomeOwner 
FROM Customers$
WHERE HomeOwner = 'N';

SELECT *FROM CustNoHomeOwn;


-- 12. Write a view to display customers with the `AnnualIncome` column formatted as an integer (without the dollar sign).

CREATE VIEW CustDollar AS
SELECT FirstName, LastName, CAST(REPLACE(AnnualIncome, '$', ' ')AS INT) AS AnnualIncSimple
FROM Customers$;

SELECT *FROM CustDollar;


-- 13. Create a view to list customers along with a calculated column that shows their age based on the current date

CREATE VIEW CustAge AS
SELECT FirstName, LastName, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Newage
FROM Customers$;

SELECT *FROM CustAge;


-- 14. Write a view that shows the customer details with a new column called `IncomeCategory`, where customers earning over $90,000 are labeled 'High Income', and others as 'Moderate Income'.

CREATE VIEW CustNew AS
SELECT FirstName, LastName, 
  CASE 
    WHEN AnnualIncome > 90000 THEN 'HIGH INCOME'
    ELSE 'MODERATE INCOME'
  END AS IncomeCategory
FROM Customers$;

SELECT *FROM CUstNew;


-- 15. Create a view that shows all customers who have exactly 3 children.

CREATE VIEW CustChild AS
SELECT FirstName, LastName, TotalChildren
FROM Customers$
WHERE TotalChildren = 3;

SELECT *FROM CustChild;


-- 16. Write a view that lists the `CustomerKey`, `FirstName`, `LastName`, and `EmailAddress`, but only for customers with a 'MS.' or 'MRS.' prefix.

CREATE VIEW CustPref AS
SELECT CustomerKey,Prefix,FirstName, LastName,EmailAddress
FROM Customers$
WHERE Prefix IN ('MS.','MRS.');

SELECT *FROM CustPref;


-- 17. Displays all customers sorted by their `BirthDate` in descending order.


SELECT FirstName, LastName, BirthDate
FROM Customers$
ORDER BY BirthDate DESC;


-- 18. Write a view that lists the customers grouped by `EducationLevel`, showing the count of customers in each education level.

CREATE VIEW CustEdu AS
SELECT EducationLevel, COUNT(*) AS TotalEduLevel
FROM Customers$
GROUP BY EducationLevel;

SELECT * FROM CustEdu;


-- 19. Create a view to display customers whose email addresses end with '@learnsector.com'.

CREATE VIEW CustEmailAdd AS
SELECT Firstname, LastName, EmailAddress
FROM Customers$	
WHERE EmailAddress LIKE '%@learnsector.com';

SELECT *FROM CustEmailAdd;


-- 20. Write a view to display customers who have an occupation of 'Management' and are homeowners.

CREATE VIEW CustOcH AS
SELECT FirstName, LastName, Occupation, HomeOwner
FROM Customers$
WHERE Occupation='Management' AND HomeOwner = 'Y';

SELECT * FROM CustOcH;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SQL Stored Procedures

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 1. Create a stored procedure to retrieve all customer information Question: Write a stored procedure to fetch all the details of customers. 

CREATE PROCEDURE GetAllCust
AS
BEGIN
	SELECT *FROM Customers$
END;

EXEC GetAllCust;


-- 2. Create a stored procedure to find customers by first name Question: Write a stored procedure to find customers by their first name. 

CREATE PROCEDURE GetFirstNameCust
@FirstName NVARCHAR(50)
AS
BEGIN
	SELECT FirstName
	FROM Customers$
	WHERE FirstName = @FirstName;
END;

EXEC GetFirstNameCust @FirstName = 'JON';


-- 3. Create a stored procedure to find customers by last name Question: Write a stored procedure to find customers by their last name.

CREATE PROCEDURE GetCustLastName
@LastName NVARCHAR(50)
AS 
BEGIN
	SELECT FirstName, LastName
	FROM Customers$
	WHERE LastName = @LastName;
END;

EXEC GetCustLastName @LastName = 'SMITH';


-- 4. Create a stored procedure to update the email address of a customer Question: Write a stored procedure to update the email address of a customer by their customer key.

CREATE PROCEDURE UpdCustEmail
@CustomerKey INT,
@NewEmailAddress NVARCHAR(50)
AS
BEGIN
	UPDATE Customers$
	SET EmailAddress = @NewEmailAddress
	WHERE CustomerKey = @CustomerKey;
END;

EXEC UpdCustEmail @CustomerKey = 101, @NewEmailAddress = 'anuj@learnsector.com';


-- 5. Create a stored procedure to delete a customer Question: Write a stored procedure to delete a customer based on their customer key.

CREATE PROCEDURE DelCustData
@CustomerKey INT
AS
BEGIN 
	DELETE FROM Customers$
	WHERE CustomerKey = @CustomerKey
END;

EXEC DelCustData @Customerkey = 11631;


-- 6. Create a stored procedure to find customers by marital status Question: Write a stored procedure to find customers based on their marital status.

CREATE PROCEDURE GetCustMarSta
@MaritalStatus NVARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName, MaritalStatus
	FROM Customers$;
END;

EXEC GetCustMarSta @MaritalStatus = 'M';


-- 7. Create a stored procedure to find customers by gender Question: Write a stored procedure to find customers based on their gender.

CREATE PROCEDURE CustGenderData
@Gender NVARCHAR(20)
AS
BEGIN
	SELECT FirstName, LastName, Gender
	FROM Customers$
	WHERE Gender = @Gender;
END;

EXEC CustGenderData @Gender = 'M';


-- 8. Create a stored procedure to count the number of customers Question: Write a stored procedure to count the total number of customers.

CREATE PROCEDURE GetCustTotalNum
AS
BEGIN
	SELECT COUNT(*) AS TotalNumCust
	FROM Customers$;
END;

EXEC GetCustTotalNum;


-- 9. Create a stored procedure to find customers with a certain level of education Question: Write a stored procedure to find customers based on their education level.

CREATE PROCEDURE GetCustEduLevel
@EducationLevel NVARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName, EducationLevel
	FROM Customers$
	WHERE EducationLevel = @EducationLevel;
END;

EXEC GetCustEduLevel @EducationLevel = 'High School';


-- 10. Create a stored procedure to find customers based on occupation Question: Write a stored procedure to find customers based on their occupation.

CREATE PROCEDURE GetCustOcp
@Occupation NVARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName, Occupation
	FROM Customers$
	WHERE Occupation = @Occupation;
END;

EXEC GetCustOcp @Occupation = 'Skilled Manual';


-- 11. Create a stored procedure to calculate the average annual income Question: Write a stored procedure to calculate the average annual income of all customers.

CREATE PROCEDURE GetCustAnnInc
AS
BEGIN
	SELECT AVG(AnnualIncome) AS AvgAnnInc
	FROM Customers$;
END;

EXEC GetCustAnnInc;


-- 12. Create a stored procedure to find customers by home ownership status Question: Write a stored procedure to find customers based on their home ownership status.

CREATE PROCEDURE GetCustHomeOwner
@HomeOwner NVARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName, HomeOwner
	FROM Customers$
	WHERE HomeOwner = @HomeOwner;
END;

EXEC GetCustHomeOwner @HomeOwner = 'Y';


-- 13. Create a stored procedure to update the annual income of a customer Question: Write a stored procedure to update the annual income of a customer based on their customer key.

CREATE PROCEDURE GetUpdCust
@CustomerKey INT,
@AnnualIncome Money
AS
BEGIN
	UPDATE Customers$
	SET AnnualIncome = @AnnualIncome
	WHERE CustomerKey = @CustomerKey;
END;

EXEC GetUpdCust @CustomerKey = 11620, @AnnualIncome = 75000;


-- 14. Create a stored procedure to find customers by email domain Question: Write a stored procedure to find customers based on their email domain. 

CREATE PROCEDURE GetCustEmailData
@EmailDomain NVARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName, EmailAddress
	FROM Customers$
	WHERE EmailAddress LIKE '%' + @EmailDomain;
END;

EXEC GetCustEmailData @EmailDomain = '@learnsector.com';


-- 15. Create a stored procedure to find customers by birth year Question: Write a stored procedure to find customers based on their birth year.

CREATE PROCEDURE GetCustDate
@BirthYear INT
AS
BEGIN
	SELECT FirstName, LastName, BirthDate
	FROM Customers$
	WHERE YEAR(BirthDate) = @BirthYear;
END;

EXEC GetCustDate @BirthYear = 1970;


-- 16. Create a stored procedure to find customers by total number of children Question: Write a stored procedure to find customers based on the total number of children they have.

CREATE PROCEDURE GetCustChildT
@TotalChildren INT
AS
BEGIN
	SELECT FirstName, LastName, TotalChildren
	FROM Customers$
	WHERE TotalChildren = @TotalChildren;
END;

EXEC GetCustChildT @TotalChildren = 2;


-- 17. Create a stored procedure to find customers by prefix Question: Write a stored procedure to find customers based on their prefix (e.g., Mr., Mrs., Ms.). 

CREATE PROCEDURE GetCustPrfix
@Prefix NVARCHAR(20)
AS
BEGIN
	SELECT Prefix, FirstName, LastName
	FROM Customers$
	WHERE Prefix = @Prefix;
END;

EXEC GetCustPrfix @Prefix = 'Ms.';


-- 18. Create a stored procedure to find customers by a combination of first and last name Question: Write a stored procedure to find customers based on their first 
-- and last name.

CREATE PROCEDURE GetCustNames
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50)
AS
BEGIN
	SELECT CustomerKey, FirstName, LastName
	FROM Customers$
	WHERE FirstName = @FirstName AND LastName = @LastName;
END;

EXEC GetCustNames @FirstName = 'MEGAN', @LastName = 'RODRIGUEZ';



-- 19. Create a stored procedure to find customers by a range of annual incomes Question: Write a stored procedure to find customers based on a range of annual incomes. 

CREATE PROCEDURE GetCustIncomeRange
@MinIncome MONEY,
@MaxIncome MONEY
AS
BEGIN
	SELECT FirstName, LastName, AnnualIncome
	FROM Customers$
	WHERE AnnualIncome BETWEEN @MinIncome AND @MaxIncome;
END;

EXEC GetCustIncomeRange @MinIncome = 50000, @MaxIncome = 100000;


-- 20. Create a stored procedure to retrieve customers' full names and email addresses Question: Write a stored procedure to retrieve customers' full names and email addresses. 

CREATE PROCEDURE GetCustFullName
AS
BEGIN
	SELECT FirstName, LastName, EmailAddress
	FROM Customers$;
END;

EXEC GetCustFullName;



_______________________________________________________________________________________________________________________________________________________________________
_______________________________________________________________________________________________________________________________________________________________________
_______________________________________________________________________________________________________________________________________________________________________
