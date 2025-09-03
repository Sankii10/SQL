CREATE DATABASE important;

USE important;


SELECT *FROM Customers;


-- Second highest salary

SELECT MAX(AnnualIncome) AS SecondHighestSalary
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome) 
FROM Customers);


-- HIGHEST SALARY

SELECT MAX(AnnualIncome)
FROM Customers;


--OR

SELECT TOP 1 Firstname, LastName, AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;



-- AnnualIncome is greater then average annualIncome

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers);


-- Department-wise avg salary (with >5 employees)

SELECT MaritalStatus, AVG(AnnualIncome) AS AverageAnnualInc
FROM Customers
GROUP BY Maritalstatus
HAVING COUNT(*) > 5;



-- Find duplicates 

SELECT CustomerKey, COUNT(*) AS DuplCount
FROM Customers
GROUP BY CustomerKey
HAVING COUNT(*) > 1;


SELECT *FROM Customers;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Create the Customers table 

CREATE TABLE Customers ( 
CustomerID INT PRIMARY KEY, 
Name VARCHAR(50), 
Email VARCHAR(100) 
); 

-- -- Create the Orders table

CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY, 
CustomerID INT, 
ProductName VARCHAR(50), 
OrderDate DATE, 
Quantity INT, 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

-- Create the Products table 

CREATE TABLE Products ( 
ProductID INT PRIMARY KEY, 
ProductName VARCHAR(50), 
Price DECIMAL(10, 2) 
);


-- Insert records into the Customers table

INSERT INTO Customers (CustomerID, Name, Email) 
VALUES  
(1, 'John Doe', 'johndoe@example.com'),  
(2, 'Jane Smith', 'janesmith@example.com'),  
(3, 'Robert Johnson', 'robertjohnson@example.com'),  
(4, 'Emily Brown', 'emilybrown@example.com'),  
(5, 'Michael Davis', 'michaeldavis@example.com'),  
(6, 'Sarah Wilson', 'sarahwilson@example.com'),  
(7, 'David Thompson', 'davidthompson@example.com'),  
(8, 'Jessica Lee', 'jessicalee@example.com'),  
(9, 'William Turner', 'williamturner@example.com'),  
(10, 'Olivia Martinez', 'oliviamartinez@example.com'), 
(11, 'James Anderson', 'jamesanderson@example.com'), 
(12, 'Kelly Clarkson', 'kellyclarkson@example.com');


-- Insert records into the Products table 

INSERT INTO Products (ProductID, ProductName, Price) 
VALUES  
(1, 'Product A', 10.99),  
(2, 'Product B', 8.99),  
(3, 'Product C', 5.99),  
(4, 'Product D', 12.99),  
(5, 'Product E', 7.99),  
(6, 'Product F', 6.99), 
(7, 'Product G', 9.99),  
(8, 'Product H', 11.99),  
(9, 'Product I', 14.99),  
(10, 'Product J', 4.99), 
(11, 'Product K', 3.99), 
(12, 'Product L', 15.99);


-- Insert records into the Orders table 

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity) 
VALUES  
(1, 1, 'Product A', '2023-07-01', 5),  
(2, 2, 'Product B', '2023-07-02', 3),  
(3, 3, 'Product C', '2023-07-03', 2),  
(4, 4, 'Product A', '2023-07-04', 1),  
(5, 5, 'Product B', '2023-07-05', 4),  
(6, 6, 'Product C', '2023-07-06', 2),  
(7, 7, 'Product A', '2023-07-07', 3),  
(8, 8, 'Product B', '2023-07-08', 2),  
(9, 9, 'Product C', '2023-07-09', 5),  
(10, 10, 'Product A', '2023-07-10', 1), 
(11, 11, 'Product D', '2023-07-10', 3), 
(12, 12, 'Product E', '2023-07-11', 6), 
(13, 5, 'Product G', '2023-07-12', 2), 
(14, 4, 'Product H', '2023-07-13', 4), 
(15, 6, 'Product I', '2023-07-14', 3);

SELECT *FROM Customers;
SELECT *FROM Orders;
SELECT *FROM Products;


--  Write a query to retrieve all records from the Customers table.. 

SELECT *FROM Customers;


--  Write a query to retrieve the names and email addresses of customers whose names start with 'J'. 

SELECT Name, Email
FROM Customers
WHERE Name LIKE 'J%';


-- . Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders.. 

SELECT OrderID, ProductName, Quantity
FROM Orders;


-- .Write a query to calculate the total quantity of products ordered. 

SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;


--  Write a query to retrieve the names of customers who have placed an order

SELECT Customers.Name, Orders.ProductName
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


-- Write a query to retrieve the products with a price greater than $10.00. 

SELECT Customers.Name, Orders.ProductName, Products.Price
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Products
ON Orders.ProductName = Products.ProductName
WHERE Products.Price> 10;


--  Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

SELECT Customers.Name , Orders.OrderDate 
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate >= '2023-07-05';


-- THE LATEST AND THE OLDEST ORDER by gtouping customer name 

SELECT Customers.Name, MIN(Orders.OrderDate) AS OlderstPurchase, MAX(Orders.OrderDate) AS LatestDate
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY MIN(Orders.OrderDate) DESC , MAX(Orders.OrderDate) DESC;

-- THE LATEST AND THE YOUNGEST ORDER DATE

SELECT MIN(Orders.OrderDate) AS OldestDate, MAX(Orders.OrderDate) AS YoungestDate
FROM Orders;


-- Write a query to calculate the average price of all products.

SELECT ProductName,AVG(Price) AS AVERAGEPrice
FROM Products
GROUP BY ProductName;


-- . Write a query to retrieve the customer names along with the total quantity of products they have ordered. 

SELECT Customers.Name, SUM(Orders.Quantity) AS TotalQuantity
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name;


-- Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

SELECT TOP 5 Customers.Name, SUM(Orders.Quantity) AS HighestQuantity, DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS RANK
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY SUM(Orders.Quantity) DESC;

SELECT *FROM Customers;
SELECT *FROM Orders;
SELECT *FROM Products;




-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ACCENTURE QUESTIONS

-- Write a query to fetch the top 3 employees with the highest salaries from an Employees table. Fetch the Top 3 Employees with the Highest Salary

CREATE TABLE Employees (empid INT PRIMARY KEY, empname VARCHAR(30), Salary INT);

INSERT INTO Employees VALUES
(101, 'Alice', 95000),
(102, 'Bob', 87000),
(103, 'Charlie', 91000),
(104, 'David', 75000),
(105, 'Eve', 99000);


SELECT *FROM Employees;



SELECT TOP 3 empname, Salary
FROM Employees 
ORDER BY Salary DESC;


-- USING DENSE RANK

SELECT TOP 3 empname, Salary, DENSE_RANK() OVER ( ORDER BY Salary DESC) AS Rank
FROM Employees
ORDER BY Salary DESC;



-------------------------------------------------------------------------------------------------------------------------------------------------

-- Write a Query to Find Customers Who Have Placed More Than 5 Orders in the Last 30 Days 

CREATE TABLE Ord ( orderid INT PRIMARY KEY, customerid INT, orderdate DATE);

INSERT INTO Ord VALUES
(201,1, '2024-02-15'),
(202, 2, '2024-02-10'),
(203, 1 , '2024-02-18'),
(204, 3, '2024-02-20'),
(205,1,'2024-02-25'),
(206,2,'2024-02-27'),
(207, 1, '2024-03-02');


SELECT *FROM Ord;


-- HAVING MORE THEN 5 orders
SELECT customerid, COUNT(orderid) AS TotalNoOfCust
FROM Ord
GROUP BY customerid
HAVING COUNT(orderid) > 5;


-- more then 5 in the interval of last 30 days

SELECT customerid, COUNT(orderid) AS total_orders
FROM Ord
WHERE orderdate >= DATEADD(DAY, -30, GETDATE())
GROUP BY customerid
HAVING COUNT(orderid) > 5;


------------------------------------------------------------------------------------------------------------------------------------------------

-- Write a Query to Retrieve the First and Last ORDER Date for Each Customer


SELECT *FROM Ord;

SELECT customerid , MIN(orderDate) AS OldestDate, MAX(orderDate) AS YoungestDate 
FROM Ord
GROUP BY customerid;


------------------------------------------------------------------------------------------------------------------------------------------------

-- Write a Query to Fetch All Orders Placed on Weekends 

SELECT *FROM Ord;

SELECT *
FROM Ord
WHERE DATEPART(WEEKDAY,orderdate) IN (1,7);



--------------------------------------------------------------------------------------------------------------------------------------------------

-- Write a Query to Calculate the Average Sales per Region

CREATE TABLE Sales(salesid INT PRIMARY KEY, region VARCHAR(20), salesamount INT);

INSERT INTO Sales VALUES
(501,'North', 50000),
(502,'South', 70000),
(503,'North', 80000),
(504, 'West', 90000);


SELECT *FROM Sales;


SELECT region, AVG(salesamount) AS AvgSalesAmount
FROM Sales
GROUP BY region;



-------------------------------------------------------------------------------------------------------------------------------------------------

-- Write a query to Find the Second-Highest Salary Without Using LIMIT or TOP 

SELECT *FROM Employees;


SELECT MAX(Salary) AS SecondMaxSalary
FROM Employees
WHERE Salary < 
( SELECT MAX(Salary)
FROM Employees);


--------------------------------------------------------------------------------------------------------------------------------------------------


-- Write a Query to Find Customers Who Have Never Placed an Order 


CREATE TABLE Cms(customerid INT PRIMARY KEY , customername vARCHAR(30));

CREATE TABLE Orde(orderid INT PRIMARY KEY, customerid INT, FOREIGN KEY(customerid) REFERENCES Cms(customerid));


INSERT INTO Cms VALUES 
( 1, 'John'),
(2, 'Alice'),
(3, 'Bob');


INSERT INTO Orde VALUES
(101, 1),
(102, 2);


SELECT *FROM Cms;
SELECT *FROM Orde;


SELECT Cms.customername, Orde.orderid
FROM Cms
LEFT JOIN Orde
ON Cms.customerid = Orde.customerid
WHERE Orde.orderid IS NULL;



-------------------------------------------------------------------------------------------------------------------------------------------------



-- Write a SQL query to  Calculate Profit Margin for Each Product and Rank Them Within Their Category 

CREATE TABLE Pds ( productid INT PRIMARY KEY, category VARCHAR(5), revenue INT, cost INT);

INSERT INTO Pds VALUES
(801,'A',10000, 7000),
(802,'A',15000,9000),
(803,'B',20000, 15000);

SELECT *FROM Pds;


SELECT (revenue - cost) AS profitmargin , DENSE_RANK() OVER (ORDER BY Category DESC) AS RANK
FROM Pds;



-------------------------------------------------------------------------------------------------------------------------------------------------

-- Write a query to Fetch Orders Where the Total Order Value Exceeds the Average Order Value 

CREATE TABLE Ord ( orderid INT PRIMARY KEY, customerid INT, orderdate DATE);

INSERT INTO Ord VALUES
(201,1, '2024-02-15'),
(202, 2, '2024-02-10'),
(203, 1 , '2024-02-18'),
(204, 3, '2024-02-20'),
(205,1,'2024-02-25'),
(206,2,'2024-02-27'),
(207, 1, '2024-03-02');


SELECT *FROM Ord;


-- ADD NEW COLUMN

ALTER TABLE Ord
ADD totalvalue INT;

SELECT *FROM Ord;


UPDATE Ord 
SET totalvalue = 5000
WHERE orderid = 201;

UPDATE Ord 
SET totalvalue = 7000
WHERE orderid = 202;

UPDATE Ord
SET totalvalue = 6000
WHERE orderid = 203;

UPDATE Ord
SET totalvalue = 5500
WHERE orderid = 204;

UPDATE Ord
SET totalvalue = 7500
WHERE orderid = 205;


UPDATE Ord
SET totalvalue = 3500
WHERE orderid = 206;


UPDATE Ord
SET totalvalue = 4700
WHERE orderid = 207;


SELECT *FROM Ord;


SELECT *
FROM Ord
WHERE totalvalue > 
(SELECT AVG(totalvalue)
FROM Ord);




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ADVANCE SQL QUERRIERS



CREATE TABLE EmployeeDetails ( 
EmpId INT PRIMARY KEY, 
FullName VARCHAR(100), 
ManagerId INT, 
DateOfJoining DATE, 
City VARCHAR(100) 
);

CREATE TABLE EmployeeSalary ( 
EmpId INT, 
Project VARCHAR(50), 
Salary DECIMAL(10, 2), 
Variable DECIMAL(10, 2), 
FOREIGN KEY (EmpId) REFERENCES 
EmployeeDetails(EmpId) 
);

INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, 
DateOfJoining, City) VALUES 
(101, 'Alice Johnson', 321, '2022-05-15', 'New York'), 
(102, 'Bob Smith', 876, '2020-03-12', 'Los Angeles'), 
(103, 'Charlie Brown', 986, '2021-08-23', 'Chicago'), 
(104, 'David Williams', 876, '2019-11-05', 'Houston'), 
(105, 'Eve Davis', 321, '2023-01-07', 'Phoenix'), 
(106, 'Frank Miller', 986, '2018-12-19', 'Philadelphia'), 
(107, 'Grace Wilson', 876, '2022-03-28', 'San Antonio'), 
(108, 'Hank Moore', 321, '2021-09-14', 'San Diego'), 
(109, 'Ivy Taylor', 986, '2020-02-11', 'Dallas'), 
(110, 'Jack Anderson', 876, '2022-11-30', 'San Jose'), 
(111, 'Karen Thomas', 321, '2021-07-16', 'Austin'), 
(112, 'Liam Jackson', 986, '2023-04-21', 'Fort Worth'), 
(113, 'Mia White', 876, '2019-06-03', 'Columbus'), 
(114, 'Noah Harris', 321, '2020-12-10', 'Charlotte'), 
(115, 'Olivia Martin', 986, '2021-10-25', 'San Francisco'), 
(116, 'Paul Garcia', 876, '2023-07-18', 'Indianapolis'), 
(117, 'Quinn Martinez', 321, '2022-09-07', 'Seattle'), 
(118, 'Rachel Rodriguez', 986, '2020-01-15', 'Denver'), 
(119, 'Steve Clark', 876, '2021-03-19', 'Washington'), 
(120, 'Tina Lewis', 321, '2019-08-31', 'Boston');

INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) 
VALUES 
(101, 'P1', 7500, 500), 
(102, 'P2', 9200, 700), 
(103, 'P1', 6700, 600), 
(104, 'P3', 8300, 900), 
(105, 'P2', 7800, 800), 
(106, 'P3', 9100, 1000), 
(107, 'P1', 6200, 400), 
(108, 'P2', 8800, 750), 
(109, 'P3', 9500, 1100), 
(110, 'P1', 7200, 650), 
(111, 'P2', 8700, 850), 
(112, 'P3', 9300, 1200), 
(113, 'P1', 7900, 550), 
(114, 'P2', 6800, 450), 
(115, 'P3', 8400, 900), 
(116, 'P1', 7600, 500), 
(117, 'P2', 8900, 1000), 
(118, 'P3', 9200, 1100), 
(119, 'P1', 8100, 600), 
(120, 'P2', 8300, 750); 


SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;

-- . How to retrieve the second-highest salary of an employee?'

SELECT MAX(Salary) AS SecondHighestSaalry
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary)
FROM EmployeeSalary);


-- How to get the nth highest salary in ?

SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS RANK
FROM EmployeeSalary;

-- GET WITH N RANK

SELECT Salary
FROM (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rank
    FROM EmployeeSalary
) AS RankedSeries
WHERE rank = 3; 


-- 3. How do you fetch all employees whose salary is greater than the average salary? 

SELECT Project, Salary
FROM EmployeeSalary
WHERE Salary > 
(SELECT AVG(Salary)
FROM EmployeeSalary);


-- USING JOINS

SELECT EmployeeDetails.FullName, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.Empid = EmployeeSalary.Empid
WHERE EmployeeSalary.Salary >
(SELECT AVG(EmployeeSalary.Salary)
FROM EmployeeSalary);



-- Write a query to display the current date and time in .

SELECT CURRENT_TIMESTAMP;

SELECT GETDATE();


--  How to find duplicate records in a table?

SELECT City, COUNT(*) AS DUPLICATERECORDS
FROM EmployeeDetails
GROUP BY City
HAVING COUNT(*) > 1;


-- DUPLICATES BASED ON ENTIRE ROWS (ALL COUMNS)

SELECT *, COUNT(*) AS DuplicateRecords
FROM EmployeeDetails
GROUP BY Empid, FullName, ManagerId, DateOfJoining, City  -- all columns in the table
HAVING COUNT(*) > 1;



--  How to get the common records from two tables? 

SELECT ManagerId
FROM EmployeeDetails
INTERSECT
SELECT EmpId
FROM EmployeeSalary;

-- FETCH ROWS 3 to 10 (ALWAYS CONSIDER PRIMARY KEY HERE)

SELECT *
FROM EmployeeDetails
ORDER BY Empid
OFFSET 2 ROWS FETCH NEXT  8 ROWS ONLY ;


--  How to retrieve the last 10 records from a table?

SELECT TOP 10 *
FROM EmployeeDetails
ORDER BY EmpId DESC;


--  How do you fetch the top 5 employees with the highest salaries?

SELECT TOP 5 Project , Salary
FROM EmployeeSalary
ORDER BY Salary DESC;


-- USING JOINS

SELECT TOP 5 EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
ORDER BY EmployeeSalary.Salary DESC;


--  How to calculate the total salary of all employees?

SELECT SUM( Salary ) AS TotalSalary
FROM EmployeeSalary;


-- PROJECTWISE TOTAL SALARY

SELECT Project, SUM(Salary) AS TotalSalaryPerProject
FROM EmployeeSalary
GROUP BY Project;



-- How to write a query to find all employees who joined in the year 2020? 

SELECT FullName, DateOfJoining
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

--USING JOINS

SELECT EmployeeDetails.FullName, EmployeeDetails.DateOfJoining, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE YEAR(EmployeeDetails.DateOfJoining) = 2020;



-- Write a query to find employees whose name starts with 'A'.

SELECT FullName, DateOfJoining, City
FROM EmployeeDetails
WHERE FullName LIKE 'A%';


--  How can you find the employees who do not have a manager?

SELECT FullName, ManagerId, DateOfJoining, City
FROM EmployeeDetails
WHERE ManagerId IS NULL;


--USING JOINS

SELECT EmployeeDetails.FullName, EmployeeDetails.DateOfJoining, EmployeeDetails.City , EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeDetails.ManagerId IS NULL ;


-- How to find the Project with the highest number of employees?

SELECT TOP 1 Project, COUNT(*) AS TotalEmp
FROM EmployeeSalary
GROUP BY Project
ORDER BY COUNT(*) DESC;


-- 15). How to get the count of employees in each Project?

SELECT Project, COUNT(*) AS TotalCount
FROM EmployeeSalary
GROUP BY Project;



--  Write a query to fetch employees having the highest salary in each department. 

SELECT Project, MAX(Salary) AS HIGHESTSALARY
FROM EmployeeSalary
GROUP BY Project
ORDER BY MAX(Salary) DESC;


-- USING JOINS

SELECT EmployeeDetails.ManagerId , MAX(EmployeeSalary.Salary) AS MAXSALARY
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
GROUP BY EmployeeDetails.ManagerId
ORDER BY MAX(EmployeeSalary.Salary) DESC;



-- How to write a query to update the salary of all employees by 10%? 

UPDATE EmployeeSalary
SET Salary = Salary * 1.1 ;


SELECT *FROM EmployeeSalary;


-- How can you find employees whose salary is between 50,000 and 1,00,000? 


SELECT Project, Salary 
FROM EmployeeSalary
WHERE Salary BETWEEN 500 AND 1000;


-- USING JOINS

SELECT EmployeeDetails.FullName , EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary BETWEEN 500 AND 1000;


--  How to find the no of years employee worked in the organization from joining date till today ?

SELECT FullName, City, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS TotalYears
FROM EmployeeDetails;


--  How to find the youngest employee in the organization?

SELECT TOP 1 FullName , MAX(DateOfJoining) AS Latestjoin
FROM EmployeeDetails
GROUP BY FullName
ORDER BY MAX(DateOfJoining) DESC;


--  How to fetch the first and last record from a table? 

SELECT * FROM EmployeeDetails
WHERE EmpId IN (
    (SELECT MIN(EmpId) FROM EmployeeDetails),
    (SELECT MAX(EmpId) FROM EmployeeDetails)
);


-- Write a query to find all employees who report to a specific manager. 

SELECT FullName, ManagerId 
FROM EmployeeDetails
WHERE ManagerId  =321;


-- COUNT NO OF EMPLOYEES WORKING UNDER SPECIFIC MANAGER

SELECT ManagerId, COUNT(*) AS TotalEmployees
FROM EmployeeDetails
GROUP BY ManagerId;


-- How can you find the total number of Managers in the company? 

SELECT DISTINCT COUNT(ManagerId) AS Totalmanagers
FROM EmployeeDetails;


--  How to find the department with the lowest average salary? 

SELECT TOP 1 Project , MIN(Salary) AS LowestSalary
FROM EmployeeSalary
GROUP BY Project ;


--  How to delete all employees from a ManagerId in one query? 

DELETE FROM EmployeeDetails
WHERE ManagerId = 321;


--  How to display all employees who have been in the company for more than 3 years? 

SELECT FullName, DateOfJoining , DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS NoOfYears
FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfJoining, GETDATE()) > 3;


-- How to find the second-largest Salary from a table? 

SELECT MAX(Salary) AS SecondHighestSalary
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary) 
FROM EmployeeSalary);


-- USING JOINS


SELECT MAX(EmployeeSalary.Salary) AS SecondHighest
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary < 
(SELECT MAX(EmployeeSalary.Salary) 
FROM EmployeeSalary);



--  How to write a query to remove all records from a table but keep the table structure? 

TRUNCATE TABLE EmployeeDetails;


-- Write a query to get all employee records in XML format. 

SELECT EmpId, FullName, ManagerID, City
FROM EmployeeDetails
FOR XML AUTO;


-- How to get the current month’s name from ?

SELECT FullName, DateOfJoining , DATENAME(MONTH, DateOfJoining) AS MonthName
FROM EmployeeDetails;


--  How to convert a string to lowercase in ? 

SELECT LOWER(FullName) AS NewName
FROM EmployeeDetails;


--  How to find all employees who do not have any subordinates? 

SELECT *
FROM EmployeeDetails
WHERE EmpId NOT IN 
(SELECT ManagerID 
FROM EmployeeDetails
WHERE ManagerId IS NOT NULL);


-- Write a query to calculate the total Variable per project in a table.

SELECT Project, SUM(Variable) AS TotalVariable
FROM EmployeeSalary
GROUP BY Project;



--Write a query to calculate the total Variable per Employee in a table.

SELECT EmployeeDetails.FullName, SUM(EmployeeSalary.Variable) AS TotalVariable
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
GROUP BY EmployeeDetails.FullName;


-- How to find the second highest salary for each Project?

SELECT Project, MAX(Salary) AS SecondHighestSalary
FROM EmployeeSalary E1
WHERE Salary < 
(SELECT MAX(Salary)
FROM EmployeeSalary E2
WHERE E2.Project = E1.Project)
GROUP BY Project;


--HIGHEST SALARY PER PROJECT

SELECT Project, MAX(Salary) AS HighestSalary
FROM EmployeeSalary
GROUP BY Project;


-- Write a query to fetch employees whose salary is a multiple of 500.

SELECT *
FROM EmployeeSalary
WHERE Salary % 500 = 0;


-- How to fetch records where a column has null values?

SELECT *
FROM EmployeeSalary
WHERE Project IS NULL;


--  How to write a query to find the total number of employees under each manager ?

SELECT ManagerId, COUNT(*) AS TotalEmployees
FROM EmployeeDetails
GROUP BY ManagerId;


-- Write a query to fetch all employees whose names end with ‘n’.

SELECT FullName, ManagerId
FROM EmployeeDetails
WHERE FullName LIKE 'n%';



--  How to find all employees who work in both ManagerId 321 and 986? 


SELECT FullName, ManagerId
FROM EmployeeDetails
WHERE ManagerId IN (321, 986);


-- DUPLICATE ROWS 

SELECT FullName, COUNT(*) AS DuplicateMangerId
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1;


-- 40. Write a query to fetch the details of employees with the same salary.

SELECT Salary, COUNT(*) AS DuplicateSalary
FROM EmployeeSalary
GROUP BY Salary
HAVING COUNT(*) > 1;


-- How to update salaries of employees based on their Project? 

UPDATE EmployeeSalary
SET Salary = Salary * 1.10
WHERE Project = 'P1';

SELECT *FROM EmployeeSalary;


-- . How to write a query to list all employees without a ManagerId?

SELECT *
FROM EmployeeDetails
WHERE ManagerId IS NULL;


-- How to write a query to list all employees without a Project?
--USING JOINS


SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
RIGHT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


--  Write a query to find the maximum salary and minimum salary in each Project.

SELECT Project, MAX(Salary) AS MAXSALARY , MIN(SALARY) AS MINSALARY
FROM EmployeeSalary
GROUP BY Project;


-- Write a query to find the maximum salary and minimum salary for each employee working under manager.
--USING JOINS

SELECT EmployeeDetails.ManagerId, MIN(EmployeeSalary.Salary) AS MIN_SALARY, MAX(EmployeeSalary.Salary) AS MAX_SALARY
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
GROUP BY EmployeeDetails.ManagerId;


-- How to list all employees hired in the last 6 months? 

SELECT FullName, DateOfJoining , DATENAME(MONTH, DateOfJoining) AS MONTH_NAME, DATEDIFF(MONTH, DateOfJoining, GETDATE()) TOTALMONTHSTILLNOW
FROM EmployeeDetails
WHERE DATEDIFF(MONTH, DateOfJoining, GETDATE()) = 6;



--OR

SELECT FullName, DateOfJoining
FROM EmployeeDetails
WHERE DateOfjoining >= DATEADD(MONTH, -6, GETDATE());


--  Write a query to display department-wise total and average salary. 


SELECT Project, SUM(Salary) AS TOTALSALARY, AVG(Salary) AS AVGSALARY
FROM EmployeeSalary
GROUP BY Project;

-- USING JOINTS

SELECT EmployeeDetails.ManagerId ,  SUM(EmployeeSalary.Salary) AS TotalSalary, AVG(EmployeeSalary.Salary) AS AVGSALARY
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeDetails.EmpId
GROUP BY EmployeeDetails.ManagerId;


--  Write a query to count the number of employees whose names start and end with the same letter

SELECT COUNT(*) AS TotalSameNameStartAndEnd
FROM EmployeeDetails
WHERE LEFT(FullName, 1) = RIGHT(FullName, 1);


--  How to retrieve employee names and salaries in a single string? 

SELECT CONCAT(EmployeeDetails.FullName, ' earns ' ,EmployeeSalary.Salary) AS NAMESALARY
FROM EmployeeDetails
FULL OUTER JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;





--  How to find employees whose salary is higher than Average salary? 

SELECT Project, Salary
FROM EmployeeSalary
WHERE Salary > 
(SELECT AVG(Salary)
FROM EmployeeSalary);


-- USING JOINS

SELECT EmployeeDetails.FullName , EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary > 
(SELECT AVG(EmployeeSalary.Salary)
FROM EmployeeSalary);


-- Write a query to get project have employees less than 3 employees. 

SELECT Project, COUNT(*) AS TotalEmployee
FROM EmployeeSalary
GROUP BY Project
HAVING COUNT(*) < 3;



--  How to write a query to find employees with the same first name? 

SELECT *
FROM EmployeeDetails 
WHERE FullName IN 
(SELECT FullName 
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1);


-- HAVE GOT DUPLICATE FULLNAMES

SELECT FullName , COUNT(*) AS DuplicateFullName
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1;


-- How to write a query to display employees who have been in the company for more than 5 years? 

SELECT FullName , DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS YearsDiff
FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfJoining, GETDATE()) > 5;

-- DELETE MORE THAN 5 YEARS

DELETE FROM EmployeeDetails
WHERE DateOfJoining < DATEADD(YEAR, -5, GETDATE());


-- Write a query to list all employees working under the same manager. 

SELECT FullName, ManagerId
FROM EmployeeDetails
WHERE ManagerId  = 876;


-- USING JOINS

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeDetails.ManagerId = 876;


--  How to find the top 3 highest-paid employees in Project wise?

SELECT TOP 3 Project, MAX(Salary) AS HighestSalary
FROM EmployeeSalary
GROUP BY Project
ORDER BY MAX(Salary);

-- USE DENSE RANK 

SELECT Project, Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS RANK
FROM EmployeeSalary;


--  How to find the top 3 highest-paid employees in each department?

SELECT *
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY Project ORDER BY Salary DESC) AS RANK FROM EmployeeSalary ) AS ranked_employees
WHERE RANK <= 3;



-- 55. Write a query to list all employees with more than 5 years of experience in each department. 

SELECT FullName, DateOfJoining , DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS YearDiff
FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfJoining, GETDATE()) > 5;


--  How to list all employees in ManagerId that have not hired anyone in the past 2 years?

SELECT *
FROM EmployeeDetails
WHERE ManagerId IN 
(
    SELECT ManagerId
    FROM EmployeeDetails
    GROUP BY ManagerId
    HAVING MAX(DateOfJoining) < DATEADD(YEAR, -2, GETDATE())
);




--  Write a query to find all employees who earn more than the average salary of their Project.

SELECT Project, Salary
FROM EmployeeSalary
WHERE Salary > 
(SELECT AVG(Salary) 
FROM EmployeeSalary);



-- USING JOINS

SELECT EmployeeDetails.FullName, EmployeeDetails.DateOfJoining, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary >
(SELECT AVG(EmployeeSalary.Salary)
FROM EmployeeSalary);


--  How to list all managers who have more than 5 subordinates?

SELECT EmpId AS ManagerId, FullName
FROM EmployeeDetails
WHERE EmpId IN (
    SELECT ManagerId
    FROM EmployeeDetails
    WHERE ManagerId IS NOT NULL
    GROUP BY ManagerId
    HAVING COUNT(*) > 5
);


-- Write a query to display employee names and hire dates in the format "Name - MM/DD/YYYY".

SELECT CONCAT(FullName,  ' birth on ' , FORMAT(DateOfJoining, 'MM/DD/YYYY')) AS FullNameDate
FROM EmployeeDetails;

-- How to find employees whose salary is in the top 10%? 

SELECT *
FROM EmployeeSalary
WHERE Salary > (
    SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY Salary)
    OVER ()
    FROM EmployeeSalary
);


-- 61. Write a query to display employees grouped by their age brackets (e.g., 20-30, 31-40, etc.). 


--INTERMS OF YEAR
SELECT FullName, DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS YearInOrg,
CASE	
	WHEN DATEDIFF(YEAR, DateOfJoining, GETDATE()) < 2 THEN 'JUINOR LEVEL'
	WHEN DATEDIFF(YEAR, DateOfJoining, GETDATE()) BETWEEN 2 AND 5 THEN 'MEDIUM LEVEL'
	ELSE 'SENIOR EXECUTIVE'
END AS LevelOfEmployee
FROM EmployeeDetails;


-- . How to find the average salary of the top 5 highest-paid employees in each Projext? 

SELECT TOP 2 MAX(Salary) AS HighestSalary, Project 
FROM EmployeeSalary
GROUP BY Project;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Find the duplicate records in table

SELECT DateOfjoining, COUNT(*) AS DuplicateItems
FROM EmployeeDetails
GROUP BY DateOfJoining
HAVING COUNT(*) > 1;

-- Retrieve the second highest salary of the employee

SELECT MAX(Salary)
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary)
FROM EmployeeSalary);


-- Find Employee without Project

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


-- GET TOP 3 HIGHEST PAID EMPLOYEES

SELECT TOP 3 Salary, Project
FROM EmployeeSalary
ORDER BY Salary DESC;

-- USING JOINS GET TOP 3 HIGHEST PAID EMPLOYEES

SELECT TOP 3 EmployeeSalary.Salary, EmployeeDetails.FullName
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
ORDER BY EmployeeSalary.Salary DESC;


--Top 2 Salary From every Project

SELECT Project, Salary 
FROM
(SELECT Project, Salary, ROW_NUMBER() OVER (GROUP BY Project ORDER BY Salary DESC)AS anuj
FROM EmployeeSalary ) AS ranked
WHERE anuj <= 2;


-- Show the count of mployees under the manager 

SELECT ManagerId, COUNT(*) AS TotalEmpl
FROM EmployeeDetails
GROUP BY ManagerId;


-- Retrieve all the customers who came in the year of 2023

SELECT FullName, DateOfJoining
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2023;


-- AVERAGE SALARY PER Customer

SELECT EmployeeDetails.FullName, AVG(EmployeeSalary.Salary) AS AVGSALARY
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
GROUP BY EmployeeDetails.FullName;


-- GET THE YOUGEST AND OLDEST JOINER IN ORG;

SELECT MIN(DateOfJoining) AS OlderJoin
FROM EmployeeDetails;

SELECT MAX(DateOfJoining) AS LatestJoin
FROM EmployeeDetails;


SELECT MIN(DateOfJoining) AS OldestJoin, MAX(DateOfJoining) AS LatestJoining
FROM EmployeeDetails;


-- FIND THE EMPLOYEE WHO HAVE NO PROJECT ASSIGNED 

SELECT EmployeeDetails.FullName , EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


-- COUNT HOW MANY CUSTOMERS PLACED MORE THAN 5 Orders


ALTER TABLE EmployeeDetails
ADD Orders INT;

SELECT *FROM EmployeeDetails;


UPDATE EmployeeDetails 
SET Orders = 4
WHERE EmpId = 102;

UPDATE EmployeeDetails SET Orders = 4 WHERE EmpId = 103;
UPDATE EmployeeDetails SET Orders = 7 WHERE EmpId = 104;
UPDATE EmployeeDetails SET Orders = 2 WHERE EmpId = 105;
UPDATE EmployeeDetails SET Orders = 9 WHERE EmpId = 106;
UPDATE EmployeeDetails SET Orders = 1 WHERE EmpId = 107;
UPDATE EmployeeDetails SET Orders = 6 WHERE EmpId = 108;
UPDATE EmployeeDetails SET Orders = 3 WHERE EmpId = 109;
UPDATE EmployeeDetails SET Orders = 8 WHERE EmpId = 110;
UPDATE EmployeeDetails SET Orders = 5 WHERE EmpId = 111;
UPDATE EmployeeDetails SET Orders = 10 WHERE EmpId = 112;
UPDATE EmployeeDetails SET Orders = 2 WHERE EmpId = 113;
UPDATE EmployeeDetails SET Orders = 7 WHERE EmpId = 114;
UPDATE EmployeeDetails SET Orders = 1 WHERE EmpId = 115;
UPDATE EmployeeDetails SET Orders = 9 WHERE EmpId = 116;
UPDATE EmployeeDetails SET Orders = 4 WHERE EmpId = 117;
UPDATE EmployeeDetails SET Orders = 6 WHERE EmpId = 118;
UPDATE EmployeeDetails SET Orders = 3 WHERE EmpId = 119;
UPDATE EmployeeDetails SET Orders = 8 WHERE EmpId = 120;

SELECT *FROM EmployeeDetails;

SELECT Orders, COUNT(*) AS TOtalNumber
FROM EmployeeDetails
GROUP BY Orders
HAVING Orders > 5;


-- RETRIEVE CUSTOMERS ORDERS ABOVE AVERAGE ORDERS

SELECT FullName, Orders
FROM EmployeeDetails
WHERE Orders > 
(SELECT AVG(Orders)
FROM EmployeeDetails);


SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--MYNTRA QUESTIONS

-- Find the second highest salary without using LIMIT,OFFSET, or TOP

SELECT *FROM EmployeeSalary;

SELECT MAX(Salary) AS SecondHighestSalary
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary) 
FROM EmployeeSalary);


-- USe dense Rank and find the rank based on salary

SELECT Project, Salary, DENSE_RANK() OVER ( ORDER BY Salary DESC) AS Rank
FROM EmployeeSalary;

-- Using joins

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary, DENSE_RANK() OVER (ORDER BY EmployeeSalary.Salary DESC) AS RANK
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


-- Given a table of orders, write a query to find the runnin gtotal (cumulative sum) of Orders for each day

SELECT 
    DateOfJoining,
    SUM(Orders) AS DailyOrders,
    SUM(SUM(Orders)) OVER (ORDER BY DateOfJoining ROWS UNBOUNDED PRECEDING) AS RunningOrdersTotal
FROM EmployeeDetails
GROUP BY DateOfJoining
ORDER BY DateOfJoining;


-- Write an SQL query to identify employees who earn more than their managers

CREATE TABLE Empli( empid INT PRIMARY KEY, nameemp Varchar(50), salary INT, ManagerId INT, FOREIGN KEY (ManagerId) REFERENCES Mang(ManagerId));

CREATE TABLE Mang(ManagerId INT PRIMARY KEY , ManagerName VARCHAR(20), ManSalary INT)



INSERT INTO Empli VALUES 
(1, 'Alice', 70000, NULL),
(2, 'Bob', 80000, 1),
(3, 'Charlie', 60000, 1),
(4, 'David', 90000, 2),
(5, 'Eve', 85000,2);


INSERT INTO Mang VALUES
(1, 'Alice', 70000),
(2, 'Bob', 80000);



SELECT *FROM Empli;
SELECT *FROM Mang;


SELECT Empli.nameemp, Empli.salary, Empli.ManagerId,Mang.ManagerName, Mang.ManSalary
FROM Empli
JOIN Mang
ON Empli.ManagerId = Mang.ManagerId
WHERE Mang.ManSalary < Empli.salary;


-- Identify consecutive login streaks for users where they logged in for at least three consecutive days

CREATE TABLE LoginInfo (userid INT , logindate DATE);


INSERT INTO LoginInfo (userid, logindate) VALUES
(101, '2024-05-01'),
(101, '2024-05-02'),
(101, '2024-05-03'),
(101, '2024-05-05'),
(102, '2024-05-10'),
(102, '2024-05-11'),
(102, '2024-05-12'),
(102, '2024-05-13'),
(103, '2024-05-15'),
(103, '2024-05-17');


WITH Ranked AS (
    SELECT 
        userid,
        logindate,
        ROW_NUMBER() OVER (PARTITION BY userid ORDER BY logindate) AS rn
    FROM LoginInfo
),
Groups AS (
    SELECT 
        userid,
        logindate,
        DATEADD(DAY, -rn, logindate) AS grp
    FROM Ranked
)
SELECT userid, MIN(logindate) AS StartDate, MAX(logindate) AS EndDate, COUNT(*) AS StreakLength
FROM Groups
GROUP BY userid, grp
HAVING COUNT(*) >= 3
ORDER BY userid, StartDate;


-- Find employees who have the same salary as another employee in the same department

SELECT Salary, COUNT(*) AS DuplicateSalary
FROM EmployeeSalary
GROUP BY Salary
HAVING COUNT(*) > 1;


-- Retrieve the project with the highest total salary paid to employees

SELECT TOP 1 Project, SUM(Salary) AS TotalSalary
FROM EmployeeSalary
GROUP BY Project;


-- Rank orders based on Salary &variable toatl  for each customer and return only the top 3 salary per customer

SELECT TOP 3 Salary, Variable, (Salary + Variable) AS TotalSal , DENSE_RANK() OVER (ORDER BY Salary DESC) AS RANK
FROM EmployeeSalary
ORDER BY Salary DESC;

-- Q17. Find the first and last occurrence of dateofjoining

SELECT FullName, MIN(DateOfjoining) AS OldEmp, MAX(DateOfJoining) AS LatestEmp , DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS Noofyears
FROM EmployeeDetails
GROUP BY FullName, DateOfJoining;








SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- FILE 2:SIR ASSIGN



CREATE TABLE Cs (
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


INSERT INTO Cs (CustomerKey, Prefix, FirstName, LastName, BirthDate, MaritalStatus, Gender, EmailAddress, AnnualIncome, TotalChildren, EducationLevel, Occupation, HomeOwner)
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



SELECT *FROM Cs;


-- Write an SQL query to select all records from the Employee table where the EmployeeID is greater than 5.

SELECT FirstName, Lastname, BirthDate, MaritalStatus 
FROM Cs
WHERE CustomerKey > 5;

-- Write an SQL statement to update the email address of an employee with a specific EmployeeID in the Employee table.

UPDATE Cs
SET EmailAddress = 'eugenehua@gmail.com'
WHERE CustomerKey = 11001;

SELECT *FROM Cs;


-- Write an SQL statement to update the Salary of all employees in the Employee table by increasing it by 10%.

SELECT AnnualIncome , (AnnualIncome * 1.10) AS UpdatedSalary
FROM Cs;


--USE OF UPDATE

UPDATE Cs
SET AnnualIncome = AnnualIncome * 1.10;


-- Write an SQL query to update both the AddressLine and ContactNumber for an employee with EmployeeID 10.

UPDATE Cs
SET EmailAddress = 'jacsua@gmail.com', TotalChildren = 1
WHERE CustomerKey = 11010;

SELECT FirstName, LastName, EmailAddress, TotalChildren 
FROM Cs
WHERE CustomerKey = 11010;

-- Write the SQL statement to create a database named School.

CREATE DATABASE School;

USE School;


CREATE TABLE Claas(classid INT PRIMARY KEY, class_name VARCHAR(20));
CREATE TABLE Students (studentid INT PRIMARY KEY, firstname VARCHAR(20), lastname VARCHAR(20), classid INT, FOREIGN KEY(classid) REFERENCES Claas(classid));


INSERT INTO Claas VALUES
(1, '10-GRADE'),
(2, '9-GRADE'),
(3, '8-GRADE');

INSERT INTO Students VALUES 
(101,'Rahul','Sharma', 1),
(102, 'Priya','Patil', 1),
(103, 'Amit', 'Kawde',2),
(104, 'Neha', 'Shinde',3);


SELECT *FROM Claas;
SELECT *FROM Students;



-- Write an SQL statement to add a new column BirthDate of type DATE to the Employee table.

ALTER TABLE Students
ADD BirthDate DATE;




-- After adding a new column PhoneNumber to the Employee table, write an SQL statement to update the PhoneNumber for the employee with EmployeeID 2.

ALTER TABLE Students 
ADD phonenumber INT;

UPDATE Students
SET phonenumber = 8574
WHERE studentid = 102;

SELECT *FROM Students;


UPDATE Students
SET Birthdate = '2024-04-12'
WHERE studentid = 101;

UPDATE Students 
SET Birthdate = '1997-10-04'
WHERE studentid = 102;

UPDATE Students
SET Birthdate = '1997-04-10'
WHERE studentid = 103;

UPDATE Students 
SET Birthdate = '2000-11-02'
WHERE studentid = 104;

SELECT *FROM Students;


-- FIND THE DIFFERENCE OF CURRENT DAY TO BirthDate

SELECT firstname, lastname, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Totalyrsold
FROM Students;

-- NAME OF THE MONTH

SELECT firstname, lastname,BirthDate, DATENAME(MONTH, BirthDate) AS MonthName
FROM Students;



-- How would you rename a database named 'OLD_DATABASE' to 'NEW_DATABASE'?

EXEC sp_renamedb 'NewSchool', 'School';

--  How would you rename the table 'Customers' to 'ClientData' in the current database?

EXEC sp_rename 'Students', 'StudentsData';

SELECT *FROM StudentsData;


-- How would you rename the column 'AnnualIncome' to 'YearlyIncome' in the 'Customers' table?


EXEC sp_rename 'StudentsData.phonenumber','contactnumber', 'COLUMN';

SELECT *FROM StudentsData;


-- How would you rename the column 'TotalChildren' to 'NumChildren' in the 'Customers' table?

EXEC sp_rename 'StudentsData.BirthDate','birthdata','COLUMN';


-- Write an SQL query to delete the row where the CustomerKey is 11002 in the 'Customers' table.

DELETE FROM StudentsData
WHERE studentid = 102;


-- Write an SQL query to delete all rows in the 'Customers' table.

TRUNCATE TABLE StudentsData;

-- How would you drop the table 'Customers' from the current database?

DROP TABLE StudentsData;

-- Write an SQL query to delete the row where the EmailAddress is 'elizabeth5@learnsector.com' in the 'Customers' table.

DELETE FROM Cs
WHERE EmailAddress = 'elizabeth5@learnsector.com';


-- Write an SQL query to update the 'EmailAddress' of the customer with CustomerKey 11001 to 'eugene.huang@newmail.com'.

UPDATE Cs
SET EmailAddress = 'yang.jon@gmail.com'
WHERE CustomerKey = 11000;

SELECT *FROM Cs;

-- Write an SQL query to set the 'HomeOwner' status to 'N' for all customers whose 'AnnualIncome' is less than 70000.

UPDATE Cs
SET HomeOwner = 'N'
WHERE AnnualIncome < 70000;


-- Write an SQL query to add 5000 to the 'AnnualIncome' of each customer and display the results.

UPDATE Cs
SET AnnualIncome = AnnualIncome + 5000;


-- Write an SQL query to subtract 2000 from the 'AnnualIncome' of each customer and display the results.

UPDATE Cs
SET AnnualIncome = AnnualIncome - 2000;


-- Write an SQL query to multiply the 'AnnualIncome' of each customer by 1.05 to simulate a 5% raise and display the results.

SELECT (AnnualIncome * 1.05) AS NewIncome 
FROM Cs;


-- Write an SQL query to divide the 'AnnualIncome' of each customer by 12 to calculate the monthly income and display the results.

SELECT (AnnualIncome / 12) AS MonthlyIncome
FROM Cs;


-- Write an SQL query to find the remainder when 'AnnualIncome' is divided by 10000 and display the results.

SELECT (AnnualIncome % 10000) AS Remainder
FROM Cs;


-- Write an SQL query to select all columns from 'Customers' where 'TotalChildren' is equal to 3.

SELECT FirstName, LastName, TotalChildren
FROM Cs
WHERE TotalChildren = 3;


-- Write an SQL query to select all columns from 'Customers' where 'MaritalStatus' is not equal to 'S'.

SELECT FirstName , LastName, MaritalStatus 
FROM Cs
WHERE MaritalStatus <> 'S';

--OR

SELECT FirstName, LastName, MaritalStatus
FROM Cs
WHERE NOT MaritalStatus = 'S';


-- Write an SQL query to select all columns from 'Customers' where 'AnnualIncome' is greater than 80000.

SELECT *
FROM Cs
WHERE AnnualIncome > 80000;


-- Write an SQL query to select 'FirstName' and 'LastName' from 'Customers' where 'AnnualIncome' is greater than or equal to 90000.

SELECT FirstName, LastName, AnnualIncome
FROM Cs
WHERE AnnualIncome >= 90000;


-- Write an SQL query to select 'CustomerKey' and 'EmailAddress' from 'Customers' where 'AnnualIncome' is less than or equal to 70000.

SELECT CustomerKey, FirstName, LastName, EmailAddress 
FROM Cs
WHERE AnnualIncome <= 70000;


-- What is the average annual income of all customers?

SELECT AVG(AnnualIncome)
FROM Cs;


-- PER CUSTOMERNAME WISE

SELECT FirstName, AVG(AnnualIncome) AS AvgInc
FROM Cs
GROUP BY Firstname
ORDER BY AVG(AnnualIncome) DESC;


-- ALSO RANK THEM AS PER THE AVERAGE

SELECT FirstName, AVG(AnnualIncome) AS AvgInc, DENSE_RANK() OVER ( ORDER BY AVG(AnnualIncome) DESC) AS RANK
FROM Cs
GROUP BY FirstName
ORDER BY AVG(AnnualIncome) DESC;


-- What is the total number of children across all customers?

SELECT SUM(totalChildren) AS TotalNoOfChildren
FROM Cs;


-- Occupation wise 

SELECT Occupation, SUM(TotalChildren) AS TotalChildren
FROM Cs
GROUP BY Occupation
ORDER BY SUM(TotalChildren) DESC;



-- What is the maximum annual income among the customers?

SELECT MAX(AnnualIncome) AS MaxIncome
FROM Cs;


-- What is the minimum annual income among the customers?

SELECT MIN(AnnualIncome) AS MinInc
FROM Cs;


-- What is the count of customers with a Bachelors degree?

SELECT COUNT(*) AS TotalBachelors
FROM Cs
WHERE EducationLevel = 'Bachelors';


-- FIND THE DUPLICATES IN TABLE

SELECT Occupation, COUNT(*) AS Duplicates
FROM Cs
GROUP BY Occupation
HAVING COUNT(*) > 1;


-- What is the sum of annual incomes for customers with more than 2 children?

SELECT SUM(AnnualIncome) AS TotalAnnInc
FROM Cs
WHERE TotalChildren > = 2;


-- What is the average annual income of customers who own their home?

SELECT AVG(AnnualIncome) AS AvgAnnInc
FROM Cs
WHERE HomeOwner = 'Y';

-- What is the total number of customers grouped by marital status?

SELECT MaritalStatus, COUNT(*) AS TotalNumberOfStatus
FROM Cs
GROUP BY MaritalStatus;


-- What is the average age of customers based on their education level?

SELECT FirstName, LastName,BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS AgeOfCust, DATENAME(MONTH, BirthDate) AS MonthName
FROM Cs;


--What is the maximum number of children any customer has?

SELECT MAX(TotalChildren) AS MaxNoOfChildren
FROM Cs;


-- FIND AS PER CUSTOMER NAME

SELECT TOP 1 Firstname, MAX(TotalChildren) AS MaxOfTotalChildren
FROM Cs
GROUP BY FirstName
ORDER BY MAX(TotalChildren) DESC;


-- Write a query to find all employees whose names start with "Jo".


SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'Jo%';


-- Retrieve employees whose names end with the letter "n".

SELECT Firstname, LastName 
FROM Cs
WHERE Firstname LIKE '%n';


-- Find all employees whose names have exactly four letters and start with J.

SELECT Firstname, LastName 
FROM Cs
WHERE FirstName LIKE 'J___';


--OR

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'J%' AND LEN(FirstName) = 4;


-- Find all employees whose names are three letters long and the second letter is "a".


SELECT FirstName,LastName
FROM Cs
WHERE FirstName LIKE '_a_';


--OR

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE '%a%' AND LEN(FirstName) = 3;


-- Write a query to find employees whose names contain "an" anywhere in the name.

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE '%an%';


-- Find employees whose name is exactly "Jon" using wildcards.

SELECT Firstname, LastName
FROM Cs
WHERE FirstName ='JON';


-- Write a query to find employees whose names contain an actual underscore _ (not as a wildcard).

SELECT Firstname, LastName 
FROM Cs
WHERE FirstName LIKE '%[_]%';


-- Write a query to find employees whose names include a percent symbol %.

SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE '%[%]%';


-- Find employees whose name includes a string like "50_50" where _ is a literal underscore.

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE '%[50_50]%';


-- Write a query using ESCAPE to match the name pattern %!_%, where _ is a real character.

SELECT FirstName
FROM Cs
WHERE FirstName LIKE '%!_%' ESCAPE '!';



-- Retrieve employees whose names start with J and the second letter is a, e, or o.

SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE 'J[a,e,o]%';


-- Find employees whose names start with J and whose second character is any letter from a to m.


SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'J[a-m]%';


-- Find employees whose names contain a digit.

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE '%[1-9]%';


-- Write a query to retrieve employees whose names start with J and whose second letter is not o.

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'J%' AND FirstName NOT LIKE 'Jo%';


-- Find employees whose name includes at least one digit between 1 and 5.

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE '%[1-5]%';


-- Find all employees whose names end with 'n' and have exactly 4 characters.

SELECT FirstName ,LastName
FROM Cs
WHERE FirstName LIKE '___n';

-- OR

SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE '%n' AND LEN(FirstName) = 4;



-- Retrieve employees whose names start with 'Jo' but are not 'John'.

SELECT Firstname , LastName
FROM Cs
WHERE FirstName LIKE 'Jo%' AND FirstName NOT LIKE 'John';


-- Find employees whose names have exactly 6 characters and start with J.

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'J_____';

--OR

SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE 'J%' AND LEN(FirstName) = 6;



-- Find all employees whose names contain at least one uppercase letter followed by a digit.

SELECT FirstName , LastName 
FROM Cs
WHERE FirstName LIKE '%[A-Z][0-9]%';


-- Write a query to find employees whose names start with 'J', end with 'n', and do not contain the letter 'a'.


SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE 'J%n' AND FirstName NOT LIKE '%a%';


-------------------------------------------------------------------------------------------------------------------- MISCELLENOUS QUESTIONS

-- Update the AnnualIncome to 75000 for all customers who have the occupation 'Clerical'.

UPDATE Cs
SET AnnualIncome = 75000
WHERE Occupation = 'Clerical';

SELECT *FROM Cs
WHERE Occupation = 'Clerical';


-- Change the MaritalStatus to 'M' for customers whose LastName is 'SUAREZ'.

UPDATE Cs
SET MaritalStatus = 'M'
WHERE LastName = 'SUAREZ';

SELECT *FROM Cs
WHERE LastName = 'SUAREZ';


-- Increase the AnnualIncome by 10% for all customers who are homeowners (HomeOwner = 'Y').

SELECT AnnualIncome,(AnnualIncome * 1.10) AS NewAnnInc
FROM Cs
WHERE HomeOwner = 'Y';



-- Set the EmailAddress to NULL for customers whose TotalChildren is 0.

Update Cs
SET EmailAddress = NULL
WHERE TotalChildren = 0;

SELECT *FROM Cs
WHERE EmailAddress IS NULL;


-- Update the EducationLevel to 'Graduate' for customers who have more than 4 children.


UPDATE Cs
SET EducationLevel = 'Graduate'
WHERE TotalChildren > 4;

SELECT * FROM Cs
WHERE TotalChildren > 4;


-- How would you add a new column called PhoneNumber of type VARCHAR(15) to the Customers table?

ALTER TABLE Cs
ADD PhoneNumber VARCHAR(15);


-- Write a query to change the data type of the AnnualIncome column from DECIMAL(10, 2) to FLOAT.

ALTER TABLE Cs
ALTER COLUMN AnnualIncome DECIMAL(10,2);


-- How can you rename the column HomeOwner to IsHomeOwner in the Customers table?

EXEC sp_rename 'Cs.HomeOwner', 'IsHomeOwner';


SELECT *FROM Cs;


-- Write an SQL statement to drop the column Prefix from the Customers table.

ALTER TABLE Cs
DROP COLUMN Prefix;


-- Write an SQL query to delete all customers whose AnnualIncome is less than 30,000 from the Customers table.


DELETE FROM Cs
WHERE AnnualIncome < 30000;


-- How would you delete the record of the customer with the CustomerKey equal to 11025?

DELETE FROM Cs WHERE CustomerKey = 11025;


-- Write a query to completely remove the Customers table from the database.

DROP TABLE Cs;


-- How can you remove all rows from the Customers table while keeping its structure intact?

TRUNCATE TABLE Cs;

-- Write a query to retrieve all customers who are Married and have more than 2 children.


SELECT FirstName, LastName, MaritalStatus, TotalChildren
FROM Cs
WHERE MaritalStatus = 'M' AND TotalChildren > 2;


-- Find all female customers whose AnnualIncome is more than 50,000 and who are homeowners.


SELECT FirstName, LastName, Gender, AnnualIncome, IsHomeOwner
FROM Cs
WHERE AnnualIncome > 50000 AND IsHomeOwner = 'Y';



-- Retrieve customers who have the occupation Clerical and education level as Partial College.

SELECT FirstName, LastName, Occupation, EducationLevel
FROM Cs
WHERE Occupation = 'Clerical' AND EducationLevel = 'Partial College';


-- List customers whose gender is 'M' and have less than 3 total children.

SELECT FirstName, LastName, Gender , TotalChildren
FROM Cs
WHERE Gender = 'M' AND TotalChildren < 3;


-- Select customers who are homeowners and have an annual income greater than 60,000.

SELECT FirstName, LastName, IsHomeOwner, AnnualIncome
FROM Cs
WHERE IsHomeOwner  = 'Y' AND AnnualIncome > 60000;


-- Write a query to find customers who are either Single or have an occupation as Management.


SELECT FirstName, LastName , MaritalStatus , Occupation
FROM Cs
WHERE MaritalStatus = 'S' OR Occupation  = 'Management';


-- Retrieve records of customers whose income is below 30,000 or who do not own a home.

SELECT FirstName, LastName, IsHomeOwner, AnnualIncome
FROM Cs
WHERE IsHomeOwner = 'N' AND AnnualIncome < 30000;


-- Select all customers whose EducationLevel is either High School or Partial College.

SELECT FirstName, LastName , EducationLevel
FROM Cs
WHERE EducationLevel IN ('High School','Partial College');


-- Find customers who are either Female or have 0 children.

SELECT Firstname, LastName, Gender, TotalChildren
FROM Cs
WHERE Gender = 'F' OR TotalChildren = 0;


-- List all customers who were born before 1950 or after 1980.

SELECT FirstName, LastName, BirthDate
FROM Cs
WHERE BirthDate < '1950-01-01' OR BirthDate > '1980-12-31';


-- Write an SQL query to find customers whose AnnualIncome is between 30,000 and 70,000.

SELECT FirstName, LastName, AnnualIncome
FROM Cs
WHERE AnnualIncome BETWEEN 30000 AND 70000;


-- Select customers whose birth dates are between '1960-01-01' and '1970-12-31'.


SELECT FirstName, Lastname, BirthDate
FROM Cs
WHERE BirthDate BETWEEN '1960-01-01' AND '1970-12-31';


-- Retrieve customers whose CustomerKey is between 11010 and 11020.

SELECT CustomerKey, Firstname, LastName
FROM Cs
WHERE CustomerKey BETWEEN 11010 AND 11020;


-- Find all customers with TotalChildren between 1 and 4.


SELECT FirstName, LastName, TotalChildren
FROM Cs
WHERE TotalChildren BETWEEN 1 AND 4;



-- Get records of customers whose AnnualIncome falls between 10,000 and 50,000 and are not homeowners.


SELECT FirstName, LastName , AnnualIncome
FROM Cs
WHERE AnnualIncome BETWEEN 10000 AND 50000 AND IsHomeOwner = 'N';


--Write a query to retrieve customers with EducationLevel IN ('Bachelors', 'Partial College').


SELECT Firstname , LastName, EducationLevel
FROM Cs
WHERE EducationLevel IN ('Bachelors', 'Partial College');



-- Find customers whose occupation is IN ('Clerical', 'Management', 'Professional').


SELECT FirstName, LastName , Occupation
FROM Cs
WHERE Occupation IN ('Clerical', 'Management', 'Professional');



-- Select all customers whose gender is IN ('F', 'M').

SELECT FirstName, LastName, Gender
FROM Cs
WHERE Gender IN ('F', 'M');


-- Retrieve records where MaritalStatus is IN ('M', 'S')

SELECT FirstName , LastName , MaritalStatus
FROM Cs
WHERE MaritalStatus IN ('M','S');


-- Change the name of columns from ishomeowner to homeowner

EXEC sp_rename 'Cs.IsHomeOwner', 'HomeOwner';


-- Get customers whose CustomerKey is IN (11005, 11010, 11015, 11020).

SELECT CustomerKey, FirstName, LastName 
FROM Cs
WHERE Customerkey IN ('11005', '11010', '11015', '11020');



-- Write a query to retrieve customers who are NOT homeowners.

SELECT FirstName, LastName, HomeOwner
FROM Cs
WHERE HomeOwner='N';


-- Select all customers who do NOT have AnnualIncome between 60,000 and 100,000.

SELECT FirstName, LastName, AnnualIncome
FROM Cs
WHERE AnnualIncome NOT BETWEEN 60000 AND 100000;


-- Retrieve customers whose Occupation is NOT IN ('Clerical', 'Skilled Manual').


SELECT FirstName, LastName , Occupation 
FROM Cs
WHERE Occupation NOT IN ('Clerical', 'Skilled Manual');


-- Get records of customers who do NOT have an email address ending with '@learnsector.com'.

SELECT FirstName , LastName, EmailAddress
FROM Cs
WHERE EmailAddress NOT LIKE '%@learnsector.com';


-- Find all customers who are NOT Married and have more than 1 child.


SELECT FirstName, LastName , MaritalStatus, TotalChildren
FROM Cs
WHERE MaritalStatus = 'N' AND TotalChildren > 1;


-- Write a query to find customers whose EmailAddress ends with @gmail.com.

SELECT FirstName, LastName , EmailAddress
FROM Cs
WHERE EmailAddress LIKE '%@gmail.com';


-- Retrieve all customers whose LastName starts with the letter S.


SELECT FirstName, LastName
FROM Cs
WHERE LastName LIKE 'S%';


-- Find customers whose FirstName contains the substring 'ann'.


SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE '%ann%';


-- Select all customers whose Occupation includes the word Manual.


SELECT FirstName, LastName ,Occupation 
FROM Cs
WHERE Occupation LIKE '%Manual%';


-- Get a list of customers whose EducationLevel starts with the word Partial.

SELECT FirstName, LastName, EducationLevel 
FROM Cs
WHERE EducationLevel LIKE '%Partial%';


-- Write a query to find customers whose LastName is exactly 5 characters long.


SELECT FirstName , LastName
FROM Cs
WHERE LastName LIKE '_____';

--OR

SELECT FirstName , LastName
FROM Cs
WHERE LEN(LastName) = 5;




-- Retrieve customers whose FirstName starts with J and is exactly 4 characters long.


SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'J___';

--OR

SELECT FirstName, LastName
FROM Cs
WHERE FirstName LIKE 'J%' AND LEN(FirstName) = 4;


-- Find customers whose MaritalStatus is a single character and starts with M.

SELECT FirstName , LastName , MaritalStatus 
FROM Cs
WHERE MaritalStatus ='M';


-- Get all customers with a Gender value that matches the pattern _.

SELECT FirstName, LastName, Gender
FROM Cs
WHERE Gender LIKE '_';


-- List all customers whose Occupation starts with S, followed by any two characters.

SELECT FirstName , LastName , Occupation
FROM Cs
WHERE Occupation LIKE 'S__';

--OR

SELECT Firstname , LastName , Occupation
FROM Cs
WHERE Occupation LIKE 'S%' AND LEN(Occupation) = 3;


-- Write a query to find customers whose LastName starts with a letter in the range [A-C].

SELECT FirstName, LastName 
FROM Cs
WHERE LastName LIKE '[A-C]%';


-- Retrieve all customers whose FirstName starts with either J, K, or L.

SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE 'J%' OR FirstName LIKE 'K%' OR FirstName LIKE 'L%';


-- Find customers whose Occupation starts with any character from [P-Z].

SELECT FirstName , LastName, Occupation
FROM Cs
WHERE Occupation LIKE '[P-Z]%';



-- Select customers whose EducationLevel contains a letter in the set [oO].


SELECT FirstName , LastName , EducationLevel 
FROM Cs
WHERE EducationLevel LIKE '%[oO]%';


-- Get customers whose LastName starts with a vowel [AEIOUaeiou].


SELECT FirstName, LastName 
FROM Cs
WHERE LastName LIKE '[AEIOUaeiou]%';


-- Write a query to find customers whose FirstName does not start with the letters A, B, or C.

SELECT FirstName , LastName 
FROM Cs
WHERE FirstName NOT LIKE 'A%' OR FirstName NOT LIKE 'B%' OR FirstName NOT LIKE 'C%';

--OR

SELECT FirstName , LastName
FROM Cs
WHERE FirstName LIKE '[D-Z]%';



-- Retrieve customers whose LastName does not start with a vowel.

SELECT FirstName , LastName 
FROM Cs
WHERE LastName NOT LIKE '[AEIOUaeiou]%';


-- Find customers whose Occupation starts with any character except M, N, or O.

SELECT FirstName, LastName , Occupation 
FROM Cs
WHERE Occupation NOT LIKE 'M%' OR Occupation NOT LIKE 'N%' OR Occupation NOT LIKE 'O%';


-- List customers whose EducationLevel does not contain the letters [hH].

SELECT FirstName, LastName , EducationLevel
FROM Cs
WHERE EducationLevel NOT LIKE '%[hH]%';


-- Get all customers whose FirstName does not begin with a letter in the range [A-F].


SELECT FirstName , LastName 
FROM Cs
WHERE FirstName NOT LIKE '[A-F]%';


-- Find all employees whose names end with 'n' and have exactly 4 characters.


SELECT FirstName , LastName 
FROM Cs
WHERE FirstName LIKE '___[nN]';


--OR

SELECT FirstName, LastName 
FROM Cs
WHERE FirstName LIKE '%[nN]' AND LEN(FirstName) = 4;



-- Retrieve employees whose names start with 'Jo' but are not 'John'.


SELECT FirstName , LastName
FROM Cs
WHERE FirstName LIKE 'Jo%' AND FirstName <> 'JOHN';


-- Find employees whose names have exactly 6 characters and start with J.


SELECT FirstName , LastName
FROM Cs
WHERE FirstName LIKE 'J_____';


--OR

SELECT FirstName , LastName 
FROM Cs
WHERE FirstName LIKE 'J%' AND LEN(FirstName) = 6;




SELECT *FROM Cs;

SELECT *FROM StudentsData;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



