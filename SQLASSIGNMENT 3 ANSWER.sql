
SELECT *FROM Customers$;

-- T-SQL Aggregate Functions
-- What is the average annual income of all customers?

SELECT AVG(AnnualIncome) AS AvgAnnualInc
FROM Customers$


-- What is the total number of children across all customers?

SELECT SUM(TotalChildren) AS TotalNumberChildren
FROM Customers$;


-- What is the maximum annual income among the customers?

SELECT MAX(AnnualIncome) AS MaxAnnualInc
FROM Customers$


-- What is the minimum annual income among the customers?

SELECT MIN(AnnualIncome) AS MinAnnualInc
FROM Customers$;


-- What is the count of customers with a Bachelors degree?

SELECT COUNT(*) AS BachelorCount
FROM Customers$
WHERE EducationLevel = 'Bachelors';


-- What is the sum of annual incomes for customers with more than 2 children?

SELECT SUM(AnnualIncome) AS TotalChildrenSum
FROM Customers$
WHERE TotalChildren = 2;


-- What is the average annual income of customers who own their home?

SELECT AVG(AnnualIncome) AS AvgIncHome
FROM Customers$
WHERE HomeOwner = 'Y';


-- What is the total number of customers grouped by marital status?

SELECT MaritalStatus,COUNT(MaritalStatus) AS TotalCust
FROM Customers$
GROUP BY MaritalStatus;


-- What is the average age of customers based on their education level?

SELECT EducationLevel, AVG(DATEDIFF(YEAR, BirthDate, GETDATE())) AS AverageAge
FROM Customers$
GROUP BY EducationLevel;


-- What is the maximum number of children any customer has?

SELECT MAX(TotalChildren) AS MaxNoChildren
FROM Customers$;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--GROUP BY Clause

-- Group the customers by gender and calculate the average annual income for each gender.

SELECT Gender , AVG(AnnualIncome) AS GenderAnuualInc
FROM Customers$
GROUP BY Gender;


-- Group the customers by education level and find the total annual income for each level.

SELECT EducationLevel, SUM(AnnualIncome) AS TotalAnnualInc
FROM Customers$
GROUP BY EducationLevel;


-- Group the customers by marital status and count the number of customers in each group.

SELECT MaritalStatus , COUNT(*) AS NoOfCustMarriage
FROM Customers$
GROUP BY MaritalStatus;


-- Group the customers by occupation and find the average number of children for each occupation.

SELECT Occupation, AVG(TotalChildren) AS AvgChild
FROM Customers$
GROUP BY Occupation;


-- Group the customers by home ownership status and get the maximum annual income for each status.

SELECT HomeOwner, MAX(annualIncome) AS MaxAnnualInc
FROM Customers$
GROUP BY HomeOwner;


-- Group the customers by birth year and calculate the total annual income for each year.

SELECT YEAR(BirthDate) AS BirthYear, SUM(AnnualIncome)
FROM Customers$
GROUP BY YEAR(BirthDate)
ORDER BY BirthYear;

-- Group the customers by prefix and find the average annual income for each prefix.

SELECT Prefix, AVG(annualIncome) AS PreAnnualInc
FROM Customers$
GROUP BY Prefix;


-- Group the customers by education level and count the number of customers for each level.

SELECT EducationLevel, COUNT(*) AS TotalCustEdu
FROM Customers$
GROUP BY EducationLevel;


-- Group the customers by annual income range (e.g., <$30,000, $30,000-$50,000) and calculate the average number of children in each range.

SELECT AnnualIncome, COUNT(*) AS TotalCustomer, AVG(TotalChildren) AS AvgTotalChild
FROM Customers$
GROUP BY AnnualIncome 
HAVING AnnualIncome < 30000
OR (AnnualIncome BETWEEN 30001 AND 50000)
OR (AnnualIncome BETWEEN 50001 AND 70000)
OR (AnnualIncome BETWEEN 70001 AND 100000)
OR AnnualIncome > 100000;


-- Group the customers by gender and marital status, and find the sum of annual incomes for each combination.

SELECT Gender, MaritalStatus, SUM(AnnualIncome) AS TotalAnnualInc
FROM Customers$
GROUP BY Gender, MaritalStatus;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- HAVING CLAUSE

-- Find the education levels where the average annual income is greater than $50,000.

SELECT EducationLevel, AVG(AnnualIncome) AS AvgAnnInc
FROM Customers$
GROUP BY EducationLevel
HAVING AVG(AnnualIncome) > 50000;


-- List the prefixes that have more than 5 customers.

SELECT Prefix, COUNT(*) AS TotalCustomers
FROM Customers$
GROUP BY Prefix
HAVING COUNT(*) > 5;

-- Identify the birth years where the total number of children across customers is more than 10.

SELECT YEAR(BirthDate) , SUM(TotalChildren) AS TotalChildren
FROM Customers$
GROUP BY Year(BirthDate)
HAVING SUM(totalChildren) > 10;


-- Find the marital status where the average annual income is less than $50,000.

SELECT MaritalStatus , AVG(AnnualIncome) AS AvgAnnInc
FROM Customers$
GROUP BY  MaritalStatus 
HAVING AVG(AnnualIncome) < 50000


-- Show the occupations where the maximum annual income is more than $80,000.

SELECT Occupation , MAX(AnnualIncome) AS MaxAnnInc
FROM Customers$
GROUP BY Occupation
HAVING MAX(AnnualIncome) > 80000;


-- List the education levels where the count of customers with more than 2 children is greater than 3.

SELECT EducationLevel, COUNT(*) AS NumCustomers
FROM Customers$
WHERE TotalChildren > 2
GROUP BY EducationLevel
HAVING COUNT(*) > 3;

-- Identify the home ownership status where the average number of children is more than 2.

SELECT HomeOwner, AVG(TotalChildren) AS AvgHomeOwner
FROM Customers$
GROUP BY HomeOwner
HAVING AVG(TotalChildren) > 2;


-- List the prefixes where the count of customers is exactly 2.

SELECT Prefix, COUNT(*) AS TotalCustomers
FROM Customers$
GROUP BY Prefix
HAVING Count(*) = 2;


-- Show the occupations where the average annual income is greater than $60,000 and the total number of children is less than 10.

SELECT Occupation , AVG(AnnualIncome)AS AvgAnuInc , SUM(totalChildren) AS TotalChildren
FROM Customers$
GROUP BY Occupation
HAVING AVG(AnnualIncome) > 60000 AND SUM(TotalChildren) < 10;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INTO Clause

-- Create a new table with the names of all customers using the INTO clause.

SELECT FirstName, LastName
INTO CustomerNames
FROM Customers$;

SELECT *FROM CustomerNames;


-- Insert all customers with an annual income greater than $70,000 into a new table.

SELECT *
INTO CustomerInc
FROM Customers$
WHERE AnnualIncome > 70000;

SELECT *FROM CustomerInc;

-- Create a new table containing only customers who own their home and have more than 2 children.

SELECT *
Into NewCustomers
FROM Customers$
WHERE HomeOwner = 'Y' AND TotalChildren > 2;

SELECT * FROM NewCustomers;


-- Create a table to store the list of all customers with a Bachelors degree.

SELECT *
INTO CustomerBachelor
FROM Customers$
WHERE EducationLevel = 'Bachelors';

SELECT * FROM CustomerBachelor;


-- Insert the details of customers who are older than 50 into a new table.

SELECT *
INTO CustomerDate
FROM Customers$
WHERE DATEDIFF(YEAR, BirthDate,GETDATE()) > 50;

SELECT * FROM CustomerDate;


-- Create a new table with customers whose occupation is "Skilled Manual" and who have zero children.

SELECT *
INTO CustomerOccup
FROM Customers$
WHERE Occupation = 'Skilled Manual' AND TotalChildren = 0;

SELECT * FROM CustomerOccup;


-- Insert customer data into a new table where the marital status is "S".

SELECT *
INTO CustumerSingle
FROM Customers$
WHERE MaritalStatus = 'S';

SELECT * FROM CustumerSingle;


-- Create a table with the names and email addresses of all customers whose annual income is less than $40,000.

SELECT FirstName, EmailAddress 
INTO CustomerAnIc
FROM Customers$
WHERE AnnualIncome < 40000;

SELECT *FROM CustomerAnIc;


-- Create a new table to store customers' birth dates and total children.

SELECT BirthDate, TotalChildren
INTO CustData
FROM Customers$;

SELECT *FROM Customers$;

-- Insert records into a new table for customers whose education level is "Partial College".

SELECT FirstName, LastName, EducationLevel 
INTO CustoerDatatwo
FROM Customers$
WHERE EducationLevel = 'Partial College';

SELECT *FROM CustoerDatatwo;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ASSIGNMENTS ON SQL JOINS

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Age INT,
    PhoneNumber VARCHAR(20)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,  -- Foreign Key to Customers table
    Amount DECIMAL(10, 2),
    ProductName VARCHAR(100),
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert records into Customers (including NULLs)
INSERT INTO Customers (CustomerID, CustomerName, City, Age, PhoneNumber)
VALUES
(1, 'Alice', 'New York', 25, '1234567890'),
(2, 'Bob', 'Los Angeles', 30, NULL),
(3, 'Charlie', 'Chicago', 40, '0987654321'),
(4, 'David', NULL, 35, '1234509876'),
(5, 'Eve', 'San Francisco', NULL, '0987651234'),
(6, 'Frank', 'Houston', 50, NULL),
(7, 'Grace', NULL, 28, '1230984567'),
(8, 'Hannah', 'Miami', NULL, '2345670987'),
(9, 'Ivy', 'Seattle', 60, '0982345671'),
(10, 'Jack', 'New York', 27, '3456789012');

-- Insert records into Orders (including NULLs)
INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount, ProductName)
VALUES
(101, '2024-09-01', 1, 150.00, 'Laptop'),
(102, '2024-09-03', 2, 200.00, 'Smartphone'),
(103, '2024-09-04', 3, 50.00, NULL),
(104, '2024-09-05', NULL, 500.00, 'Tablet'),
(105, '2024-09-06', 5, 100.00, 'Headphones'),
(106, '2024-09-07', 6, NULL, 'Monitor'),
(107, '2024-09-08', 7, 75.00, 'Keyboard'),
(108, '2024-09-09', 8, 300.00, 'Printer'),
(109, '2024-09-10', 9, 400.00, NULL),
(110, '2024-09-11', 10, 250.00, 'Mouse');


SELECT *FROM Customers;
SELECT *FROM Orders;


-----------------------------------------------------
-- INNER JOIN
-----------------------------------------------------

-- List all customers who have placed an order, along with their order amounts, and order the result by the Amount in descending order.

SELECT Customers.CustomerName, Orders.Amount
FROM Customers 
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.Amount DESC;


-- Retrieve the customer names and their corresponding order dates, filtering only those orders where the amount is greater than 100 and order them by OrderDate.

SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.OrderDate;

-- Display the total amount spent by each customer on their orders using SUM(), but only include customers who have spent more than 200. Use GROUP BY on CustomerID.

SELECT Customers.CustomerID,SUM(Orders.Amount)
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID
HAVING SUM(Orders.Amount) > 200;

-- Show the CustomerName, City, and the Amount of their orders, but only for those customers whose name starts with 'A'. Sort the results by CustomerName.

SELECT Customers.CustomerName, Customers.City, Orders.Amount
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerName LIKE 'A%' 
ORDER BY Customers.CustomerName;


-- Fetch the list of customers and their total order count using COUNT(), but only include customers with more than 1 order, 
-- ordering the results by the number of orders in descending order.

SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS TotalCust
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName
HAVING COUNT(Orders.OrderID) > 1
ORDER BY TotalCust DESC


-----------------------------------------------------
-- LEFT JOIN
-----------------------------------------------------

-- Retrieve the names of all customers and their corresponding orders, ensuring that customers without any orders are also included. 
-- Order the results by CustomerName.

SELECT Customers.CustomerName , Orders.OrderID 
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


-- Show all customers' names and the amount they spent on their orders, but replace null order amounts with the value 0 using ISNULL(). 
-- Sort the results by Amount

SELECT Customers.CustomerName ,ISNULL(Orders.Amount, 0) AS Amount
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Amount;


-- List the CustomerName and the count of orders placed by each customer, including customers who have not placed any orders. Use GROUP BY on CustomerID.


SELECT 
    Customers.CustomerID,  
    Customers.CustomerName, 
    COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.CustomerName;


-- Fetch the names of customers along with the average order amount for each customer using AVG(). 
-- Include customers without orders as well, and order the results by the average order amount in descending order.

SELECT Customers.CustomerName , AVG(Orders.Amount)
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName
ORDER BY AVG(Orders.Amount) DESC;


-- Retrieve the CustomerName and City of all customers who have either not placed any orders or have placed orders for more than 200. Sort by City.

SELECT DISTINCT Customers.CustomerName, Customers.City
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL OR Orders.Amount > 200
ORDER BY Customers.City;


-----------------------------------------------------
-- RIGHT JOIN
-----------------------------------------------------

-- Display the OrderID, ProductName, and CustomerName for all orders, including orders without associated customers (if any). Order the results by ProductName.

SELECT Customers.CustomerName, Orders.OrderID, Orders.ProductName
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.ProductName;


-- List all the products and their respective order amounts, but ensure that even orders with no customers are displayed. Order by Amount in ascending order.

SELECT Customers.CustomerName,Orders.ProductName, Orders.Amount
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.Amount ASC;

-- Fetch the OrderID, CustomerID, and the total amount spent on orders for customers who have placed orders worth more than 100, including orders that may not have customers. 
--Group the results by CustomerID using SUM().

SELECT 
    Orders.OrderID,
    Orders.CustomerID,
    TotalByCustomer.TotalAmt
FROM 
    Customers
RIGHT JOIN Orders 
    ON Customers.CustomerID = Orders.CustomerID
RIGHT JOIN (
    SELECT  
        CustomerID, 
        SUM(Amount) AS TotalAmt
    FROM 
        Orders
    GROUP BY 
        CustomerID
    HAVING 
        SUM(Amount) > 100
) AS TotalByCustomer
    ON Orders.CustomerID = TotalByCustomer.CustomerID;

-- Retrieve the OrderID, OrderDate, and CustomerName for all orders, even if the customer information is missing, and filter for orders placed after '2024-09-05'. 
-- Order the results by OrderDate.

SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate > '2024-09-05'
ORDER BY Orders.OrderDate;
	

-- Show all orders along with their respective customer names, but include orders without a customer and group the results by CustomerID, showing only customers with an order count greater than 2.

SELECT Customers.CustomerID,Customers.CustomerName ,COUNT(Orders.OrderID) AS NumberofOrders
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID , Customers.CustomerName
HAVING COUNT(Orders.OrderID) > 2;



-----------------------------------------------------
-- FULL OUTER JOIN
-----------------------------------------------------

SELECT *FROM Customers;
SELECT * FROM Orders;

-- Fetch a list of all customers and their corresponding orders, including customers without orders and orders without customers. Order the result by CustomerName.

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


-- Display the CustomerName, OrderID, and Amount for all customers and orders, showing "N/A" for missing customer or order details using COALESCE(). Order by Amount.

SELECT COALESCE(Customers.CustomerName, 'NA') AS CustName, 
	COALESCE(CAST(Orders.OrderID AS VARCHAR), 'N/A') AS OrderID,
    COALESCE(CAST(Orders.Amount AS VARCHAR), 'N/A') AS Amount
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CUstomerID = Orders.CustomerID
ORDER BY Orders.Amount;


-- List all the customers and orders, including customers who have not placed any orders and orders without customers, grouped by CustomerID and ordered by the sum of their order amounts using SUM().

SELECT Customers.CustomerID, Orders.OrderID, SUM(Orders.Amount) AS TotalAmt
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Orders.OrderID
ORDER BY SUM(Orders.Amount);


-- Show all customers and their corresponding orders, or customers without orders and orders without customers, who have ordered products starting with the letter 'P'. Sort by ProductName.

SELECT Customers.CustomerID ,Customers.CustomerName, Orders.OrderID 
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.ProductName LIKE 'P%'
ORDER BY Orders.ProductName;


-- Fetch the total number of customers and orders, including unmatched customers and orders, using COUNT(), and display only those who have more than 2 related records.

SELECT COUNT(*) AS TotalCustAmt
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
HAVING COUNT(Orders.OrderID) > 2;


-------------------------------------------------------
-- SUBQUERIES ASSIGNMENTS
-------------------------------------------------------

CREATE TABLE Custom ( 
customer_id INT PRIMARY KEY, 
first_name VARCHAR(50), 
last_name VARCHAR(50), 
city VARCHAR(50), 
status VARCHAR(20) 
); 

CREATE TABLE Ord ( 
order_id INT PRIMARY KEY, 
customer_id INT, 
amount DECIMAL(10, 2), 
order_date DATE, 
FOREIGN KEY (customer_id) REFERENCES 
Custom(customer_id) 
); 

INSERT INTO Custom (customer_id, first_name, 
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

INSERT INTO Ord (order_id, customer_id, amount, 
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

SELECT *FROM Custom;
SELECT *FROM Ord;


-- 1.Find the name of the customer who has placed the highest order. 

SELECT first_name, last_name 
FROM Custom
WHERE customer_id = (
    SELECT TOP 1 customer_id
    FROM Ord
    ORDER BY amount DESC
);


-- 2.List customers from cities where the average order amount is greater than $200

SELECT first_name, last_name, city
FROM Custom
WHERE city IN (
    SELECT city
    FROM Ord O
    JOIN Custom C ON O.customer_id = C.customer_id
    GROUP BY city
    HAVING AVG(amount) > 200
);


-- 3.Retrieve customers and their respective highest order amount

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT MAX(o.Amount)
        FROM Ord o
        WHERE o.customer_id = c.customer_id
    ) AS HighestOrderAmount
FROM 
    Custom c;



-- 4.Find the unique cities where customers have placed orders.

SELECT DISTINCT city 
FROM Custom 
WHERE customer_id IN(
SELECT customer_id
FROM Ord);


-- 5.List customers who have placed an order smaller than the largest order amount by customer with ID 7

SELECT Custom.first_name, Custom.last_name 
FROM Custom 
JOIN Ord ON Custom.customer_id = Ord.customer_id 
WHERE Ord.amount < (
SELECT MAX(amount)
FROM Ord
WHERE customer_id = 7);


-- 6.Retrieve customers who have an average order amount greater than the overall average order amount

SELECT *FROM Custom;
SELECT *FROM Ord;

SELECT Custom.first_name, Custom.last_name, AVG(Ord.amount) AS AvgAmount
FROM Custom
JOIN Ord 
ON Custom.customer_id = Ord.customer_id
GROUP BY Custom.first_name, Custom.last_name
HAVING AVG(amount) > ( 
SELECT AVG(amount) FROM Ord
);


-- 7.Find the names of the top 3 customers by total order amount
--USING JOIN
SELECT TOP 3 Custom.first_name, Custom.last_name, SUM(Ord.amount) AS TotalAmt
FROM Custom
JOIN Ord 
ON Custom.customer_id = Ord.customer_id
GROUP BY Custom.first_name, Custom.last_name
ORDER BY SUM(Ord.amount) DESC

-- USING SUBQUERY
SELECT TOP 3 first_name, last_name, TotalAmt
FROM (
    SELECT 
        Custom.first_name, 
        Custom.last_name, 
        SUM(Ord.amount) AS TotalAmt
    FROM Custom, Ord
    WHERE Custom.customer_id = Ord.customer_id
    GROUP BY Custom.first_name, Custom.last_name
) AS Sub
ORDER BY TotalAmt DESC;


-- 8.Find customers who have placed exactly 5 orders
-- JOIN QUERY
SELECT Custom.first_name, Custom.last_name
FROM Custom
JOIN Ord 
ON Custom.customer_id = Ord.customer_id
GROUP BY Custom.first_name, Custom.last_name
HAVING COUNT(*) = 5;

-- SUBQUERY
SELECT first_name, last_name
FROM Custom
WHERE customer_id IN (
    SELECT customer_id
    FROM Ord
    GROUP BY customer_id
    HAVING COUNT(*) = 5
);


-- 10.Delete customers who have not placed any orders.

DELETE 
FROM Custom 
WHERE customer_id NOT IN (
SELECT DISTINCT customer_id FROM Ord);



-------------------------------------------------

-- ASSIGNMENTS ON SQL INBUILT FUNCTIONS

-------------------------------------------------

-- I. **String Functions**

-- 1. Write an SQL query to concatenate the `FirstName` and `LastName` fields, separated by a space, and display the full name.

SELECT CONCAT(first_name, last_name) FROM Custom;

--  2. Write an SQL query to extract the first three characters from the `FirstName` field.

SELECT SUBSTRING(first_name, 1,3) FROM Custom;


--  3. Write an SQL query to convert the `FirstName` field into uppercase.

SELECT UPPER(first_name) FROM Custom;

-- 4. Write an SQL query to find all records where the `EmailAddress` contains the word "learn".

SELECT * FROM Customers$;

SELECT *
FROM Customers$
WHERE EmailAddress LIKE '%learn%';


-- 5. Write an SQL query to count how many records have the prefix "MR." in the `Prefix` field.

SELECT COUNT(*)
FROM Customers$
WHERE Prefix = 'MR.';

-- 6. Write an SQL query to replace all occurrences of ".com" with ".net" in the `EmailAddress` field.

SELECT REPLACE(EmailAddress,'.com','.net') FROM Customers$;

--  7. Write an SQL query to find the length of the `FirstName` field for each customer.

SELECT LEN(FirstName) FROM Customers$;


-- 8. Write an SQL query to trim any leading or trailing spaces from the `LastName` field.

SELECT TRIM(LastName) AS TrimmedLastName
FROM Customers$;


-- 9. Write an SQL query to reverse the `FirstName` field for all records.

SELECT REVERSE(FirstName) AS ReverseFirstName
FROM Customers$;



------------------------------------------
-- 2. **Date Functions**
------------------------------------------

--  1. Write an SQL query to extract the year from the `BirthDate` field for each customer.

SELECT CustomerKey, YEAR(BirthDate) AS BirthYear
FROM Customers$;


-- 2. Write an SQL query to find customers who were born after January 1, 1970.

SELECT *
FROM Customers$
WHERE BirthDate > CAST('1970-01-01' AS DATE);


--  3. Write an SQL query to calculate the age of each customer based on the current date.

SELECT FirstName, LastName, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Customers$;


-- 4. Write an SQL query to display the day of the week for each customer's `BirthDate`.

SELECT FirstName, LastName, DATENAME(WEEKDAY, BirthDate) AS DayOfWeek
FROM Customers$;

-- 5. Write an SQL query to find all customers born in the month of July.

SELECT FirstName, LastName, DATENAME(MONTH, birthDate) AS MONTH_NAME
FROM Customers$
WHERE MONTH(BirthDate) = 7;

--6. Write an SQL query to add 10 years to each customer’s `BirthDate`.

SELECT FirstName, LastName, DATEADD(YEAR, 10, BirthDate) AS NEWYEAR
FROM Customers$;


-- 7. Write an SQL query to calculate the number of days between today’s date and each customer’s `BirthDate`.

SELECT FirstName, LastName, DATEDIFF(DAY, BirthDate, GETDATE()) AS DATE_DIFF
FROM Customers$;


-- 8. Write an SQL query to format the `BirthDate` as 'MM/DD/YYYY'.
SELECT 
    FirstName,LastName, FORMAT(BirthDate, 'MM/dd/yyyy') AS FormattedBirthDate
	FROM Customers$;

-- 9. Write an SQL query to find how many customers were born in 1968.

SELECT COUNT(*) AS CustomersBornIn1968
FROM Customers$
WHERE YEAR(BirthDate) = 1968;


------------------------------------------
-- 3. **Aggregate Functions**
------------------------------------------

-- 1. Write an SQL query to find the total number of customers in the dataset.

SELECT COUNT(*)
FROM Customers$;


--  2. Write an SQL query to calculate the average `AnnualIncome` for all customers.

SELECT AVG(AnnualIncome) AS AvgAnnInc
FROM Customers$;


-- 3. Write an SQL query to find the maximum number of `TotalChildren` across all customers.

SELECT MAX(TotalChildren) AS TotalChildrenMax
FROM Customers$;


-- 4. Write an SQL query to calculate the total number of children across all customers.

SELECT SUM(TotalChildren) AS TotalChild
FROM Customers$;


-- 5. Write an SQL query to find the minimum `AnnualIncome` for customers who are homeowners.

SELECT MIN(AnnualIncome) AS AnnInc
FROM Customers$
WHERE HomeOwner = 'Y';


-- 6. Write an SQL query to count how many customers have a marital status of 'M'.

SELECT COUNT(*) AS TotalMarried
FROM Customers$
WHERE MaritalStatus = 'M';


-- 7. Write an SQL query to find the sum of `AnnualIncome` for all customers with more than two children.

SELECT SUM(AnnualIncome) AS TotalAnnInc
FROM CUstomers$
WHERE TotalChildren = 2;


--  8. Write an SQL query to calculate the standard deviation of `AnnualIncome`.

SELECT STDEV(AnnualIncome) AS StdAnnInc
FROM Customers$;


--  9. Write an SQL query to find the customer with the highest `AnnualIncome`

SELECT TOP 1 FirstName, LastName,AnnualIncome
FROM Customers$;


-- 10. Write an SQL query to calculate the average `TotalChildren` for customers with a bachelor's degree.

SELECT AVG(TotalChildren) AS AvgTotChild
FROM Customers$
WHERE EducationLevel = 'Bachelors'


------------------------------------------
 -- 4. **Mathematical Functions**
------------------------------------------

-- 1. Write an SQL query to round the `AnnualIncome` to the nearest thousand for all customers.

SELECT FirstName, LastName, ROUND(AnnualIncome, -3) AS AROUNDTHOUSAND
FROM Customers$;


-- 2. Write an SQL query to find the absolute value of the difference between the highest and lowest `AnnualIncome`.

SELECT ABS(MAX(AnnualIncome) - MIN(AnnualIncome)) AS IncomeRange
FROM Customers$;


--  3. Write an SQL query to calculate the square root of the highest `AnnualIncome`.

SELECT SQRT(MAX(AnnualIncome)) AS SquareRootInc
FROM Customers$;


-- 4. Write an SQL query to generate a random number for each customer.

SELECT 
    FirstName, 
    LastName, 
    ABS(CHECKSUM(NEWID())) % 10000 AS RandValCust
FROM 
    Customers$;


-- 5. Write an SQL query to calculate the modulus of `AnnualIncome` when divided by 10,000 for each customer.

SELECT AnnualIncome % 10000 AS NewModVal
FROM Customers$;


-- 6. Write an SQL query to find the ceiling value of `AnnualIncome` divided by 1000 for all customers.

SELECT FirstName, LastName, CEILING(AnnualIncome/1000.0) AS CielAnnInc
FROM Customers$;


--  7. Write an SQL query to calculate the floor value of `AnnualIncome` divided by 1000 for all customers.


SELECT FirstName, LastName, FLOOR(AnnualIncome/1000.0) AS FloorAnnInc
FROM Customers$;


-- 8. Write an SQL query to multiply the `TotalChildren` by 2 for each customer.

SELECT FirstName, LastName,TotalChildren * 2 AS NewTotChildren 
FROM Customers$;


-- 9. Write an SQL query to raise the `TotalChildren` value to the power of 2 for each customer.

SELECT FirstName, LastName, TotalChildren, POWER(TotalChildren, 2) AS PowChild
FROM Customers$;

-- 10. Write an SQL query to return the logarithm (base 10) of `AnnualIncome`.

SELECT FirstName, LastName, AnnualIncome ,LOG10(AnnualIncome) AS LogAnnInc
FROM Customers$;



------------------------------------------
-- 5. **Conversion Functions**
------------------------------------------

--  1. Write an SQL query to convert the `AnnualIncome` field to an integer type.

SELECT FirstName, LastName, AnnualIncome, CAST(AnnualIncome AS int) AS NewIntVal
FROM Customers$;


--  2. Write an SQL query to convert the `BirthDate` field to a string format.

SELECT CONVERT(VARCHAR, BirthDate,103) AS NewBirthDate
FROM Customers$;


-- 3. Write an SQL query to convert the `TotalChildren` field to a decimal format with 2 decimal places.

SELECT CAST(TotalChildren AS DECIMAL(10,2)) AS NewTotChild
FROM Customers$;


-- 4. Write an SQL query to cast the `CustomerKey` field as a string.

SELECT CAST(CustomerKey AS varchar) AS StrCustKey
FROM Customers$;


--  5. Write an SQL query to convert the `AnnualIncome` field to a float and multiply it by 1.1.

SELECT CAST(AnnualIncome AS float)* 1.1 AS FltAnnInc
FROM Customers$;


--  6. Write an SQL query to cast the `BirthDate` to a DATE format (YYYY-MM-DD).

SELECT CAST(BirthDate AS date) AS NewFormDate
FROM Customers$;


--  7. Write an SQL query to cast the `AnnualIncome` as VARCHAR and concatenate it with the string ' USD'.

SELECT CAST(AnnualIncome AS VARCHAR) + ' USD' AS NewAnnInc
FROM Customers$;


-- 8. Write an SQL query to convert `MaritalStatus` from a character field to an integer (where 'M' is 1, 'S' is 0).

SELECT CASE
	WHEN MaritalStatus = 'M' THEN 1
	WHEN MaritalStatus = 'S' THEN 0
	ELSE NULL
END AS NewMaritalStatus
FROM Customers$;


-- 9. Write an SQL query to convert the `TotalChildren` field to a string type and concatenate it with the word 'children'.

SELECT CAST(TotalChildren AS VARCHAR) + ' Children' AS NewTotalChildren
FROM Customers$;


-- 10. Write an SQL query to convert the `AnnualIncome` to a decimal value and divide it by 1,000.

SELECT CAST(AnnualIncome AS decimal(10,2)) / 1000 AS NewAnnInc
FROM Customers$;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
