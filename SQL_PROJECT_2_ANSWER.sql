CREATE DATABASE AdvQ;

USE AdvQ;

SELECT *FROM salaries$;

-- 1. How to retrieve the second-highest salary of an employee? 

SELECT MAX(salary) AS SecondHighestsalary
FROM salaries$
WHERE salary < ( 
SELECT MAX(salary)
FROM salaries$);

--  How do you fetch all employees whose salary is greater than the average salary?

SELECT job_title, salary
FROM salaries$
WHERE salary > (
SELECT AVG(salary)
FROM salaries$);


-- . Write a query to display the current date and time in .

SELECT GETDATE() AS CurrentDateAndTime;

--OR

SELECT CURRENT_TIMESTAMP AS CurrentDateAndTime;


-- . How to find duplicate records in a table?

SELECT work_year,COUNT(*) AS DUPLICATES
FROM salaries$
GROUP BY work_year
HAVING COUNT(*) > 1;

--OR

SELECT COUNT(*) AS DUPLICATES
FROM salaries$
HAVING COUNT(*) > 1;


--  How to retrieve the last 10 records from a table?

SELECT TOP 10 *
FROM salaries$
ORDER BY salary DESc;


-- . How do you fetch the top 5 employees with the highest salaries?

SELECT TOP 5 job_title, salary
FROM salaries$
ORDER BY salary DESC;


-- . How to calculate the total salary of all employees?

SELECT SUM(salary) AS TotalSalary
FROM salaries$;



-- How to write a query to find all employees who joined in the year 2020? 

SELECT experience_level, salary, work_year
FROM salaries$
WHERE work_year = 2020;

SELECT *FROM salaries$;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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


--  How to get the common records from two tables?

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


--  How to retrieve the last 10 records from a table? 

SELECT TOP 10 EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
ORDER BY EmployeeSalary.Salary ASC;


-- 9. How do you fetch the top 5 employees with the highest salaries?

SELECT TOP 5 EmployeeDetails.FullName, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
ORDER BY EmployeeSalary.Salary DESC;


--DUPLICATE VALUES

SELECT ManagerId, COUNT(*) AS DUPLICATENUMBER
FROM EmployeeDetails
GROUP BY ManagerId
HAVING COUNT(*) > 1;


-- . Write a query to find employees whose name starts with 'A'.

SELECT FullName, ManagerId
FROM EmployeeDetails
WHERE FullName LIKE 'A%';



--  How can you find the employees who do not have a manager?

SELECT FullName, ManagerId
FROM EmployeeDetails
WHERE ManagerId IS NULL;


-- How to find the department with the highest number of employees? 

SELECT TOP 1 ManagerId, COUNT(*) AS TotalEmp
FROM EmployeeDetails
GROUP BY ManagerId
ORDER BY COUNT(*) DESC;


-- How to get the count of employees under each manager?

SELECT ManagerId, COUNT(*) AS TotalEmp
FROM EmployeeDetails
GROUP BY ManagerId;


-- Write a query to fetch employees having the highest salary in each department. 

SELECT Project, MAX(Salary) AS HighestSalary
FROM EmployeeSalary
GROUP BY Project;


-- How to write a query to update the salary of all employees by 10%? 

SELECT EmpId, Salary, (Salary * 1.10) AS NewUpdatedSalary
FROM EmployeeSalary;


--  How to find the youngest employee in the organization?

SELECT TOP 1 FullName, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS NOOFYRS
FROM EmployeeDetails
ORDER BY DATEDIFF(YEAR, DateOfJoining, GETDATE()) ASC;


-- . How to fetch the first and last record from a table?
-- Fetch first and last row using TOP 1 and ORDER BY inside subqueries
SELECT * FROM (
    SELECT TOP 1 * FROM EmployeeDetails ORDER BY EmpID ASC
) AS FirstRecord

UNION ALL

SELECT * FROM (
    SELECT TOP 1 * FROM EmployeeDetails ORDER BY EmpID DESC
) AS LastRecord;


--  Write a query to find all employees who report to a specific manager.

SELECT * 
FROM EmployeeDetails
WHERE ManagerId = 321;


--  How can you find the total number of departments in the company?

SELECT COUNT(ManagerId) AS TotalManagers
FROM EmployeeDetails;

-- AND EMPLOYEES REPORTING EVERY MANAGER

SELECT ManagerId, COUNT(*) AS TotalEmp
FROM EmployeeDetails
GROUP BY ManagerId;


--  How to find the department with the lowest average salary? 

SELECT TOP 1 EmployeeDetails.FullName, MIN(EmployeeSalary.Salary) AS MinSalary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
GROUP BY EmployeeDetails.FullName;


-- . How to display all employees who have been in the company for more than 5 years? 

SELECT FullName, DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS TOTALYEARS,
CASE DATEDIFF(YEAR, DateOfJoining, GETDATE())
	WHEN 0 THEN 'New Joiner'
	WHEN 1 THEN 'ONE YEAR'
	WHEN 2 THEN 'TWO YEARS'
	WHEN 3 THEN 'THREE YEARS'
	WHEN 4 THEN 'FOUR YEARS'
	ELSE 'MORE THEN 5 YEARS'
END AS NumberOfYears
FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfJoining, GETDATE()) > 4;


--  How to find the second-largest salary value from a table?

SELECT MAX(Salary) AS SecondLargest
FROM EmployeeSalary
WHERE Salary <
(SELECT MAX(Salary)
FROM EmployeeSalary);


--  How to write a query to remove all records from a table but keep the table structure?

TRUNCATE EmployeeDetails;


-- Write a query to get all employee records in XML format. 

SELECT *
FROM EmployeeDetails
FOR XML AUTO;


--  How to get the current month’s name from ?

SELECT DATENAME(MONTH, GETDATE()) AS CurrentMnth;


-- How to convert a string to lowercase in ?


SELECT LOWER(FullName) FROM EmployeeDetails;


--  Write a query to calculate the total salary per project in a salary table

SELECT Project,SUM(Salary) AS TotalSalary
FROM EmployeeSalary
GROUP BY Project;


-- . How to find the second highest salary for each department?

WITH RankedSalaries AS (
    SELECT 
        Department, 
        Salary,
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rank
    FROM EmployeeSalary
)
SELECT Department, Salary AS SecondHighestSalary
FROM RankedSalaries
WHERE Rank = 2;


--  Write a query to fetch employees whose salary is a multiple of 10,000.

SELECT *
FROM EmployeeSalary
WHERE Salary % 10000 = 0;


--  How to write a query to find the total number of employees in each job title? 

SELECT Project, COUNT(*) AS TOTALEMP
FROM EmployeeSalary
GROUP BY Project;


--  Write a query to fetch all employees whose names end with ‘n’.

SELECT FullName, City
FROM EmployeeDetails
WHERE FULLNAME LIKE 'n%';


--  Write a query to fetch the details of employees with the same salary. 

SELECT Salary, COUNT(*) AS DuplicateSalary
FROM EmployeeSalary
GROUP BY Salary
HAVING COUNT(*) > 1;


--  How to update salaries of employees based on their department? 

UPDATE EmployeeSalary 
SET Salary = CASE
    WHEN Project = 'P1' THEN Salary * 1.10
    WHEN Project = 'P2' THEN Salary * 1.05
    ELSE 'NoSalary'
END;


--  How to write a query to list all employees without a department?

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


--  Write a query to find the maximum salary and minimum salary in each department.

SELECT Project, MAX(Salary) AS MAXSALARY, MIN(Salary) AS MINSALARY
FROM EmployeeSalary
GROUP BY Project;


--  How to find employees who joined the company in the same month and year as their manager?

SELECT DateOfjoining , COUNT(*) AS SAMEJOINERS
FROM EmployeeDetails
GROUP BY DateOfJoining
HAVING COUNT(*) > 1;


--  How to retrieve employee names and salaries in a single string? 

SELECT CONCAT(FullName, ' ', DateOfJoining) AS Data
FROM EmployeeDetails;


-- How to write a query to find employees with the same first name?

SELECT FullName, COUNT(*) AS DuplicateNames
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1;


--  Write a query to get employees who report to the manager with less than 3 employees. 

SELECT *
FROM EmployeeDetails
WHERE ManagerId IN (
    SELECT ManagerId
    FROM EmployeeDetails
    GROUP BY ManagerId
    HAVING COUNT(EmpId) < 3
);


-- SQL Query to fetch records that are present in one table but not in another table. 

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary IS NULL;


-- SQL query to fetch all the employees who are not working on any project.

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL ;


-- SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT FullName, DateOfJoining
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

-- GET THE MONTH NAME OF EVERY DATE OF JOINING OF CUSTOMER

SELECT DATENAME(MONTH, DateOfJoining) AS MonthName
FROM EmployeeDetails;

--OR 

SELECT DateOfJoining,DATENAME(MONTH,DateOfJoining) AS MONTH
FROM EmployeeDetails;


-- Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary. 

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


-- Write an SQL query to fetch a project-wise count of employees. 

SELECT Project, COUNT(*) AS TotalEmps
FROM EmployeeSalary
GROUP BY Project;


-- )Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT EmployeeDetails.FullName, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


-- Write an SQL query to fetch all the Employees who are also managers. 

SELECT Fullname, EmpId
FROM EmployeeDetails
WHERE EmpId IN 
(SELECT DISTINCT ManagerId
FROM EmployeeDetails
WHERE ManagerId IS NOT NULL);


-- )Write an SQL query to fetch duplicate records from EmployeeDetails. 

SELECT FullName, COUNT(*) AS DuplicateRecords
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1;


-- )Write an SQL query to fetch only odd rows from the table.

SELECT *
FROM EmployeeDetails
WHERE EmpId % 2 = 1;


-- FIND SECOND HGHEST SALARY

SELECT MAX(Salary) AS SecondHighestSalary
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(salary)
FROM EmployeeSalary);


--  Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – 986.

SELECT FullName, ManagerId
FROM EmployeeDetails
WHERE ManagerId = 986;


-- Write an SQL query to fetch the different projects available from the EmployeeSalary table. 

SELECT DISTINCT Project
FROM EmployeeSalary;


-- Write an SQL query to fetch the count of employees working in project P1.

SELECT Project, COUNT(*) AS TotalEmployee
FROM EmployeeSalary
WHERE Project = 'P1'
GROUP BY Project;


-- Write an SQL query to find the maximum, minimum, and average salary of the employees. 

SELECT MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary, AVG(Salary) AS AvgSalary
FROM EmployeeSalary;


--  Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000. 

SELECT EmpId, Salary
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;


--  Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321. 

SELECT FullName, ManagerId, City
FROM EmployeeDetails
WHERE City = 'Toronto' AND ManagerId = 321;


-- Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.

SELECT FullName, City, ManagerId
FROM EmployeeDetails
WHERE City = 'California' AND ManagerId = 321;


-- . Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project = 'P1';


-- Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters. 

SELECT FullName, City
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';

-- . Write an SQL query to update the employee names by removing leading and trailing spaces.

UPDATE EmployeeDetails
SET FullName = LTRIM(RTRIM(FullName));


-- . Fetch all the employees who are not working on any project.

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


--  Write an SQL query to find the current date-time. 

SELECT GETDATE();


--  How to list all managers who have more than 5 subordinates? 

SELECT ManagerId, COUNT(*) AS Emps
FROM EmployeeDetails
GROUP BY ManagerId
HAVING COUNT(*) > 5;


-- Write a query to display employee names and hire dates in the format "Name - MM/DD/YYYY"

SELECT CONCAT(FullName, ' - ',FORMAT(DateOfJoining,'MM/DD/YYYY')) AS NewData
FROM EmployeeDetails;


-- Write a query to display employees grouped by their age brackets (e.g., 20-30, 31-40, etc.)

SELECT FullName, ManagerId, DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()),
CASE DATEDIFF(YEAR,DateOfJoining,GETDATE())
	WHEN 0 THEN 'NEW JOINEE'
	WHEN 1 THEN 'ONE YEAR EMPLOYEE'
	WHEN 2 THEN 'TWO YEARS'
	WHEN 3 THEN 'THREE YEARS'
	WHEN 4 THEN 'FOUR YEARS'
	ELSE 'MORE THEN 5 YEARS'
END AS Experience
FROM EmployeeDetails;



-- USE DENSE RANK ON SALARY

SELECT job_title, Salary,
DENSE_RANK() OVER (ORDER BY Salary) AS Rank
FROM salaries$

--FOR ANOTHER TABLE

SELECT Project, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS RANK
FROM EmployeeSalary;


--  How to calculate the percentage of employees in each department?


SELECT Project ,(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM EmployeeSalary)) AS Percentage
FROM EmployeeSalary
GROUP BY Project;


SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;

SELECT *FROM salaries$;




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- ASSIGNMENT 1


CREATE TABLE Items(itemid INT PRIMARY KEY, itemdescription VARCHAR(50), vendornos INT, vendor_name VARCHAR(45), bottlesize INT, bottleprice DECIMAL(10,2));

CREATE TABLE Products(productid INT PRIMARY KEY, country VARCHAR(30), product VARCHAR(30), unitssold DECIMAL(10,2), manufacturingprice INT, salesprice INT, grossprice INT, sales INT, cogs INT, profit INT, date DATE, monthnumber INT, monthname VARCHAR(10), year INT)


INSERT INTO Items VALUES
(1, 'Travis Hasse Apple Pie', 305,'Mhw_Ltd', 750,9.77),
(2, 'Daristis Xtabentum', 391,'Anchor Distilling(press imports)',750,14.12),
(3, 'Hiram Walker Preach Brandy', 370, 'Pernold Richard Usa/ Austin Nicholas', 1000, 6.5),
(4, 'Oak Cross Whisky', 305,'Mhw_Ltd', 750,25.33),
(5, 'UV Red(cherry) Vodka', 380,'Philips Beverage Company', 200,1.97),
(6, 'Heaven Hill Old style White Label', 259, 'Heaven Hill Distilleries Inc.', 750,6.37),
(7, 'Hyde Herbal Liquor', 198, 'Fire trail Brands Llc', 750,5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750,23.61);


INSERT INTO Products VALUES
(1, 'Canada','Caraterra',1618.5,3,20,32370,32370,16185,16185,'2014-01-01',1,'January',2014),
(2, 'Germany', 'Caraterra', 1321,3,20,26420,26420,13210,13210,'2014-01-01',1,'January',2015),
(3, 'France', 'Caraterra', 2178,3,15,32670,32670,21780,10890,'2014-06-01',6, 'June',2016),
(4, 'Germany','Caraterra',888,3,15,13320,13320,8880,4440,'2014-06-01',6, 'June', 2017),
(5, 'Mexico', 'Caraterra', 2470,3,15,37050,37050,24700,12350,'2014-06-01',6,'June',2018),
(6, 'Germany', 'Caraterra', 1513,3,350,529550,529550,393380,136170,'2014-12-01',12,'December',2015),
(7, 'Germany', 'Montana', 921,5,15,13815,13815,9210,4605,'2014-03-01',3,'March',2020),
(8, 'Canada', 'Montana', 2518,5,12,30216,30216,7554,22662,'2014-06-01',6,'June',2021);


SELECT *FROM Items;
SELECT *FROM Products;



--  Delete those product having the Units Sold 1618.5 , 888 and 2470.

DELETE FROM Products
WHERE unitssold IN (1618.5,888, 2470);


-- Select all records from the ITEMS_TABLE table.

SELECT *FROM Items;


--  Select the item_description and bottle_price for all items in the ITEMS_TABLE table.

SELECT itemdescription, bottleprice 
FROM Items;


--  Find the item_description and bottle_price of items where bottle_price is greater than 20.

SELECT itemdescription, bottleprice 
FROM Items
WHERE bottleprice > 20.00;


--  Select Unique Country from the product_sales table

SELECT DISTINCT country
FROM Products;


--  Count the number of Countries in the product_sales table

SELECT COUNT(DISTINCT country) AS NoofCountries
FROM Products;


-- How Many Countries are there which contain the sales price between 10 to 20 

SELECT COUNT(country) AS TotalCountry
FROM Products
WHERE salesprice BETWEEn 10 AND 20;

-- INTERMEDIATE QUESTIONS ------------------------------------------------
-- Find the Total Sale Price  and  Gross Sales  

SELECT SUM(grossprice) AS TotalGrossPrice, SUM(cogs) AS TotalCogs
FROM Products;


--  In which year we have got the highest sales

SELECT TOP 1 year, MAX(profit) AS MaxProfit
FROM Products
GROUP BY year
ORDER BY MAX(profit) DESC;


-- USING DENSE RANK

SELECT country, profit,
DENSE_RANK() OVER (ORDER BY profit DESC) AS RANK
FROM Products;



--   Which Product having the sales of $ 37,050.00

SELECT product, sales
FROM Products
WHERE sales  = 37050.00;


-- Which Countries lies between profit of $ 4,605 to $  22 , 662.00

SELECT country, profit
FROM Products
WHERE profit BETWEEN 4605 AND 22662;


-- Retrieve all products sold in 2014

SELECT product
FROM Products
WHERE year = 2014;


-- Find the maximum Profit in the product_sales table.

SELECT MAX(profit) AS MaxProfit
FROM Products;


-- Retrieve the records from product_sales where Profit is greater than the average Profit of all records.

SELECT country, product,profit
FROM Products
WHERE profit >
(SELECT AVG(profit)
FROM Products);



-- Find the vendor Name having the vendor_nos 305 , 380 , 391


SELECT vendornos, vendor_name
FROM Items
WHERE vendornos IN (305,380,391);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Advance Questions:- --------------------------------------------

--first we add new column
ALTER TABLE Products
ADD itemid INT;

--then we build a relationship with it 
ALTER TABLE Products
ADD CONSTRAINT fk_itemid
FOREIGN KEY(itemid) REFERENCES Items(itemid);

SELECT *FROM Products;

--INSERT VALUES IN NEWLY GENERATED COOLUMN
UPDATE Products SET itemid = 6 WHERE productid = 2;
UPDATE Products SET itemid = 8 WHERE productid =1;
UPDATE Products SET itemid = 5 WHERE productid = 7;
UPDATE Products SET itemid = 4 WHERE productid = 8;
UPDATE Products SET itemid = 1 WHERE productid = 5;
UPDATE Products SET itemid = 5 WHERE productid = 3;
UPDATE Products SET itemid = 2 WHERE productid = 6;
UPDATE Products SET itemid = 3 WHERE productid = 4;

SELECT *FROM Products;


-- Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 
--INNER JOIN
SELECT Items.itemdescription, Items.vendornos, Items.vendor_name , Products.product, Products.country, Products.profit
FROM Items
INNER JOIN Products
ON Items.itemid = Products.itemid;


-- FULL OUTER JOIN
SELECT Items.itemdescription, Items.vendornos, Items.vendor_name, Products.product, Products.country, Products.profit
FROM Items
FULL OUTER JOIN Products
ON Items.itemid = Products.itemid;


-- LEFT JOIN

SELECT Items.itemdescription, Items.vendornos, Items.vendor_name, Products.product, Products.country, Products.profit
FROM Items
LEFT JOIN Products
ON Items.itemid = Products.itemid;

-- RIGHT JOIN
SELECT Items.itemdescription, Items.vendornos, Items.vendor_name, Products.product, Products.country, Products.profit
FROM Items
RIGHT JOIN Products
ON Items.itemid = Products.itemid;


--  Find the item_description and Product having the gross sales of 13,320.00

SELECT Items.itemdescription, Products.grossprice
FROM Items
JOIN Products
ON Items.itemid = Products.itemid;

-- Find the top 3 most expensive items in the ITEMS_TABLE table.


SELECT TOP 3 itemdescription, MAX(bottleprice)
FROM Items
GROUP BY itemdescription
ORDER BY MAX(bottleprice) DESC;


--  Find the total Gross Sales and Profit for each Product in each Country. 

SELECT country, SUM(sales) AS TotalSales, SUM(profit) AS totalprofit
FROM Products
GROUP BY country;


--  Find the vendor_name and item_description of items with a bottle_size of 750 and bottle_price less than 10. 

SELECT vendor_name, itemdescription, bottlesize
FROM Items
WHERE bottlesize = 750 AND bottleprice < 10.00;


--  Find the Product with the highest Profit in 2019. 

SELECT TOP 1 product, MAX(profit) AS HighestProfit 
FROM Products
GROUP BY product
ORDER BY MAX(profit) DESC;


--  Retrieve the Product_Id and Country of all records where the Profit is at least twice the COGS.

SELECT productid, country 
FROM Products
WHERE profit >= 2*cogs;


--  Find the Country that had the highest total Gross Sales in 2018

SELECT country,grossprice
FROM Products
WHERE grossprice = 
(SELECT MAX(grossprice)
FROM Products
WHERE YEAR = '2018');


-- Calculate the total Sales for each Month Name across all years. 

SELECT monthnumber, DATENAME(MONTH, DATEFROMPARTS(2000, monthnumber, 1)),year, SUM(sales) AS TotalSales
FROM Products
GROUP BY monthnumber,year;

-- List the item_description and vendor_name for items whose vendor_nos exists more than once in the ITEMS_TABLE table. 

SELECT itemdescription ,vendornos, COUNT(vendornos) AS TotalcountofVendor
FROM Items
GROUP BY itemdescription, vendornos
HAVING COUNT(vendornos) <= 1;

-- Find the average Manufacturing Price for Product in each Country and only include those Country and Product combinations where the average is above 3

SELECT country,product, AVG(manufacturingprice) AS AVERAGEMANUPRICE
FROM Products
GROUP BY country, product
HAVING AVG(manufacturingprice)  > 3;



SELECT *FROM Items;
SELECT *FROM Products;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Super-Advance Questions:-

-- Find the item_description and bottle_price of items that have the same vendor_name as items with Item_Id 1. 

SELECT itemdescription, vendor_name
FROM Items
WHERE vendor_name IN 
(SELECT vendor_name
FROM Items
WHERE itemid = 1);

-- Create a stored procedure to retrieve all records from the ITEMS_TABLE table where bottle_price is greater than a given value 

CREATE PROCEDURE itemrecords
	@bottleprice INT
AS
BEGIN 
SELECT *
FROM Items
WHERE bottleprice > @bottleprice
END;

EXEC itemrecords @bottleprice = 10;


-- Stored procedure  Retrieve all items by a specific vendor name

CREATE PROCEDURE VendorN
@vendorname VARCHAR(30)
AS
BEGIN
SELECT * 
FROM Items
WHERE vendor_name = @vendorname
END;

EXEC VendorN @vendorname = 'Philips Beverage Company';


--  Return all products sold in a specific country

CREATE PROCEDURE Psold 
@country VARCHAR(30)
AS
BEGIN
SELECT product, country
FROM Products
WHERE country = @country
END;

EXEC Psold @country = 'Germany';

-- -- Create a procedure that returns products where gross price is more than half of cogs

CREATE PROCEDURE Manfcost
AS
BEGIN
SELECT country, product, grossprice, cogs
FROM Products
WHERE grossprice > (0.5 *cogs)
END;

EXEC Manfcost;


-- Create a procedure that takes a number N and returns top N most expensive items

CREATE PROCEDURE two
AS
BEGIN
SELECT TOP 3 itemdescription, vendor_name, bottleprice 
FROM Items 
ORDER  BY bottleprice DESC
END;

EXEC two;


--  Classify bottle price ranges
-- Show each item with a label:
-- Low if bottle_price < 5,
-- Medium if between 5 and 15,
-- High if > 15


SELECT itemdescription, vendor_name, bottlesize,
CASE 
	WHEN bottleprice < 5 THEN 'LOW'
	WHEN bottleprice BETWEEN 5 AND 15 THEN 'MEDIUM'
	ELSE 'High'
END AS newdata
FROM Items;


--  Label products as Profitable or Not Profitable Use the profit column in Products. If profit > 0 → Profitable, else Not Profitable

SELECT country, product , profit,
CASE 
	WHEN profit > (0.5 * sales) THEN 'Profitable'
	ELSE 'Not Profitable'
END AS ProfitorNot
FROM Products;


-- Assign discount tier based on bottle size


SELECT itemdescription , vendor_name, bottlesize,
CASE
WHEN bottlesize < 200 THEN 'Mini'
WHEN bottlesize BETWEEN 200 AND 800 THEN 'Regular'
ELSE 'Large'
END AS Discounttire
FROM Items;


--  Create a stored procedure to insert a new record into the product_sales table. 

CREATE PROCEDURE insertdata
AS
BEGIN
INSERT INTO Products VALUES
(9, 'Mexico', 'Montana', 4236.00,4,70,25869,25869,5681,65235,'2014-12-01',5,'May',2015,2)
END;

EXEC insertdata;

SELECT *FROM Products;


--  Write a query to find all item_description in the ITEMS_TABLE table that contain the word "Whisky" regardless of case. 

SELECT itemdescription , vendor_name
FROM Items
WHERE itemdescription LIKE '%Whisky%';


-- Write a query to find the Country and Product where the Profit is greater than the average Profit of all products. 

SELECT country , product, profit
FROM Products
WHERE profit > 
(SELECT AVG(profit)
FROM Products);



-- Write a query to join the ITEMS_TABLE and product_sales tables on a common field (e.g., vendor_nos) and select relevant fields from both tables. 

SELECT Items.itemdescription, Items.vendor_name, Products.country, Products.product, Products.profit
FROM Items
INNER JOIN Products
ON Items.itemid = Products.itemid;



-- Write a query to combine item_description and vendor_name into a single string for each record in the ITEMS_TABLE table, separated by a hyphen. 

SELECT CONCAT(itemdescription,' - ',vendor_name) AS NameAmalgamated
FROM Items;


--  Write a query to display the bottle_price rounded to one decimal place for each record in the ITEMS_TABLE table. 

SELECT itemdescription, ROUND(bottleprice,1) AS DeciBottlePrice
FROM Items;




-- Write a query to calculate the number of days between the current date and the Date field for each record in the product_sales table.

SELECT country, product, DATEDIFF(DAY, date,GETDATE()) AS TotalDiff
FROM Products;



SELECT *FROM Items;
SELECT *FROM Products;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ASSIGNMENT - 4:

CREATE TABLE students (studentid INT PRIMARY KEY, name VARCHAR(30), surname VARCHAR(30), birthdate DATE, gender VARCHAR(2), class VARCHAR(5), point INT);

CREATE TABLE authors(authorid INT PRIMARY KEY, name VARCHAR(30), surname VARCHAR(30));

CREATE TABLE types(typeid INT PRIMARY KEY, name VARCHAR(30));

CREATE TABLE books(bookid INT PRIMARY KEY, name VARCHAR(45), pagecount INT, point INT, authorid INT, typeid INT, FOREIGN KEY(authorid) REFERENCES authors(authorid), FOREIGN KEY(typeid) REFERENCES types(typeid));

CREATE TABLE borrows (borrowid INT PRIMARY KEY, studentid INT, bookid INT, takendate DATE, broughtdate DATE, FOREIGN KEY(studentid) REFERENCES students(studentid), FOREIGN KEY(bookid) REFERENCES books(bookid));



INSERT INTO students (studentId, name, surname, 
birthdate, gender, class, point) VALUES 
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85), 
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90), 
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88), 
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76), 
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92), 
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81), 
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87), 
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80), 
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83), 
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78);


INSERT INTO authors (authorId, name, surname) VALUES 
(1, 'F. Scott', 'Fitzgerald'), 
(2, 'Harper', 'Lee'), 
(3, 'George', 'Orwell'), 
(4, 'Jane', 'Austen'), 
(5, 'J.D.', 'Salinger'), 
(6, 'J.R.R.', 'Tolkien'), 
(7, 'Herman', 'Melville'), 
(8, 'Leo', 'Tolstoy'), 
(9, 'James', 'Joyce'), 
(10, 'Homer', ''); 

INSERT INTO types (typeId, name) VALUES 
(1, 'Fiction'), 
(2, 'Classic'), 
(3, 'Dystopian'), 
(4, 'Literature'), 
(5, 'Fantasy'), 
(6, 'Adventure'), 
(7, 'Historical Fiction'), 
(8, 'Science Fiction'), 
(9, 'Mythology'), 
(10, 'Philosophy'); 


INSERT INTO books (bookId, name, pagecount, point, 
authorId, typeId) VALUES 
(1, 'The Great Gatsby', 180, 95, 1, 1), 
(2, 'To Kill a Mockingbird', 281, 90, 2, 2), 
(3, '1984', 328, 88, 3, 3), 
(4, 'Pride and Prejudice', 279, 93, 4, 4), 
(5, 'The Catcher in the Rye', 214, 85, 5, 1), 
(6, 'The Hobbit', 310, 91, 6, 2), 
(7, 'Moby-Dick', 635, 80, 7, 3), 
(8, 'War and Peace', 1225, 92, 8, 4), 
(9, 'Ulysses', 730, 89, 9, 1), 
(10, 'The Odyssey', 541, 87, 10, 2);


INSERT INTO borrows (borrowId, studentId, bookId, 
takenDate, broughtDate) VALUES 
(1, 1, 3, '2024-01-10', '2024-01-20'), 
(2, 2, 5, '2024-01-12', '2024-01-22'), 
(3, 3, 7, '2024-01-15', '2024-01-25'), 
(4, 4, 2, '2024-01-18', '2024-01-28'), 
(5, 5, 1, '2024-01-20', '2024-01-30'), 
(6, 6, 4, '2024-01-22', '2024-02-01'), 
(7, 7, 6, '2024-01-24', '2024-02-03'), 
(8, 8, 8, '2024-01-26', '2024-02-05'), 
(9, 9, 10, '2024-01-28', '2024-02-07'), 
(10, 10, 9, '2024-01-30', '2024-02-09'); 


-- Assignments Questions

--  List all the records in the student table

SELECT *FROM students;


--  List the name surname and class of the student in the student table

SELECT name, surname,class
FROM students;


--  List the gender Female (F) records in the student table 

SELECT name, surname, gender
FROM students
WHERE gender = 'F';

--  List the names of each class in the way of being seen once in the student table 

SELECT name, COUNT(name) AS TotalName
FROM students
GROUP BY name
HAVING COUNT(*) >= 1;


-- List the students with Female gender and the class 10C in the student table

SELECT name, surname, gender, class
FROM students
WHERE gender = 'F' AND class = '10C';


--  List the names, surnames and classes of the students in the class 10B or 10C in the student table

SELECT name, surname, class
FROM students
WHERE class IN ('10B', '10C');



--  List the students name surname and school number in the student table 

SELECT  studentid,name, surname
FROM students;


--  List the students name and surname by combining them as name surname in the student table

SELECT CONCAT(name,' ' ,surname) AS FullName
FROM students;



--  List the students with the names starting with “A” letter in the student table

SELECT name, surname
FROM students
WHERE name LIKE 'A%';


--  List the book names and pages count with number of pages between 50 and 200 in the book table 

SELECT name, pagecount
FROM books
WHERE pagecount BETWEEN 50 AND 200;


--   List the students with names Emma Sophia and Robert in the student table 

SELECT name,surname
FROM students
WHERE name IN ('Emma Sophia ', 'Robert');


--  List the students with names starting with A D and K in the student table

SELECT name, surname 
FROM students
WHERE name LIKE 'A%' OR name LIKE 'D%' OR name LIKE 'K%';


--  List the names surnames classes and genders of males in 10A or females in 10C inthe student table 

SELECT name, surname, gender, class
FROM students 
WHERE gender = 'M' AND class = '10A' OR gender = 'F' AND class = '10C';


-- List the males whose classes are 10B or 10C

SELECT name, surname, class
FROM students
WHERE class IN ('10B', '10C');



--  List the students with birth year 2005 in the student table 

SELECT name, surname , birthdate
FROM students
WHERE YEAR(birthdate) = 2005;


-- List the female students with student points between 70 and 85

SELECT name, surname, gender, point
FROM students
WHERE point BETWEEN 70 AND 85;


-- List the students according to their names

SELECT name, surname
FROM students
ORDER BY name ASC;


--  List the students by names for those with same names. List them by their surnames 

SELECT name, surname
FROM students
WHERE name IN (
    SELECT name
    FROM students
    GROUP BY name
    HAVING COUNT(*) > 1
)
ORDER BY surname ASC;


--  List the last 5 records in the student chart

SELECT *
FROM students
ORDER BY studentid
OFFSET 4 ROWS FETCH NEXT 5 ROWS ONLY;


--  List the first 10 records name surname and date of birth information in the student table 

SELECT name, surname
FROM students
ORDER BY studentid
OFFSET 4 ROWS FETCH NEXT 5 ROWS ONLY;


--  List the book with the most page number

SELECT TOP 1 name,MAX(pagecount) AS MaximumNoPage
FROM books
GROUP BY name
ORDER BY MAX(pagecount) DESC;


-- : List the youngest student in the student table 

SELECT name , surname, birthdate
FROM students
WHERE birthdate = 
(SELECT MAX(birthdate)
FROM students);


--  List the books with the second letter N

SELECT name, surname
FROM students
WHERE name LIKE '_n%';


--  List the students by grouping according to their classes 

SELECT class, COUNT(*) AS TotalStudents
FROM students
GROUP BY class
ORDER BY class;


-- Pick a random student from student table

SELECT TOP 1 * 
FROM students
ORDER BY RAND();


--  Bring some random student’s name ,surname and number from class 10A

SELECT TOP 1 name, surname , class
FROM students
ORDER BY RAND();


--  Add the writer named Smith Allen to the authors table

INSERT INTO authors VALUES
(11,'Smith','Allen');


SELECT *FROM authors;


--  Add the genre of  biography to the genre table

INSERT INTO types VALUES
(11, 'Biography');




SELECT *FROM students;
SELECT *FROM authors;
SELECT *FROM types;
SELECT *FROM books;
SELECT *FROM borrows;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SIR ASSIGNMENT 2



CREATE TABLE Customers (
    CustomerKey INT PRIMARY KEY,
    Prefix VARCHAR(10),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    MaritalStatus CHAR(1),
    Gender CHAR(4),
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


SELECT * FROM Customers;


-- Write an SQL query to select all records from the Employee table where the EmployeeID is greater than 5.

SELECT *
FROM Customers
WHERE CustomerKey > 11005;

-- OR

SELECT *
FROM Customers
ORDER BY CustomerKey
OFFSET 6 ROWS ;


-- Write an SQL query to select specific columns (EmployeeID, Name, DepartmentID) from the Employee table.

SELECT CustomerKey, FirstName, LastName
FROM Customers;


-- Write an SQL statement to update the email address of an employee with a specific EmployeeID in the Employee table.

UPDATE Customers
SET EmailAddress = 'jul12@gmail.com'
WHERE FirstName = 'JULIO';


-- Write an SQL statement to update the Salary of all employees in the Employee table by increasing it by 10%.


UPDATE Customers
SET AnnualIncome = AnnualIncome * 1.10;


-- OR

SELECT FirstName, LastName, AnnualIncome, (AnnualIncome * 1.10) AS NewInc
FROM Customers;


-- Write an SQL query to update both the AddressLine and ContactNumber for an employee with EmployeeID 11010.

UPDATE Customers
SET EmailAddress = 'jacsua18@gmail.com',LastName = 'Ronaldo'
WHERE CustomerKey = 11010;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL statement to create a database named School.

CREATE DATABASE school;

USE school;


CREATE TABLE kids (stuid INT PRIMARY KEY, firstname VARCHAR(30), lastname VARCHAR(30), dob DATE, gender VARCHAR(4), grade varchar(2), schoolid INT);

INSERT INTO kids VALUES
(201,'Aaditi','Sharma','2010-02-14','F',5,101),
(202, 'Rahul','Chopra','2009-09-22','M',9,101),
(203,'Sneha', 'Patil', '2011-01-30','F',10,102),
(204,'Arjun','Shelke','2008-12-18','M',8,103),
(205,'Priyanshu', 'Pawar', '2010-06-27','F',9, 104),
(206,'Aryan', 'Shikhare', '2009-03-11','M',8,105);


SELECT *FROM kids;


-- Write an SQL statement to add a new column BirthDate of type DATE to the Employee table.

ALTER TABLE kids
ADD Joiningdate DATE;

SELECT *FROM kids;

UPDATE kids
SET Joiningdate = '2012-04-13'
WHERE stuid = 203;

SELECT *FROM kids;


-- Write an SQL statement to change the data type of the grade in the Employee table from INT to DECIMAL(10, 2).


ALTER TABLE kids
ALTER COLUMN grade DECIMAL(10,2);

-- After adding a new column PhoneNumber to the Employee table, write an SQL statement to update the PhoneNumber for the employee with EmployeeID 2.

ALTER TABLE kids
ADD phonenumber INT;


SELECT *FROM kids;

UPDATE kids
SET phonenumber = 908
WHERE stuid = 202;

SELECT *FROM kids;


-- How would you rename a database named 'OLD_DATABASE' to 'NEW_DATABASE'?

EXEC sp_renamedb 'school','schooldate';


-- How would you rename the table 'Customers' to 'ClientData' in the current database?

EXEC sp_rename 'kids','kidsdata';


SELECT *FROM kidsdata;



-- Rename Column:
-- How would you rename the column 'AnnualIncome' to 'YearlyIncome' in the 'Customers' table?

EXEC sp_rename 'kidsdata.grade','cgpa','COLUMN';


-- Rename Column:
-- How would you rename the column 'TotalChildren' to 'NumChildren' in the 'Customers' table?

EXEC sp_rename 'kidsdata.phonenumber','callnumber';


-- Delete Specific Row:
-- Write an SQL query to delete the row where the CustomerKey is 11002 in the 'Customers' table.

DELETE FROM kidsdata
WHERE stuid = 202;


-- Delete All Rows:
-- Write an SQL query to delete all rows in the 'Customers' table.

TRUNCATE TABLE kidsdata;

-- Drop Table:
-- How would you drop the table 'Customers' from the current database?

DROP TABLE kidsdata;

DROP DATABASE school;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Write an SQL query to add 5000 to the 'AnnualIncome' of each customer and display the results.


UPDATE Customers
SET AnnualIncome = AnnualIncome + 5000;


-- Write an SQL query to subtract 2000 from the 'AnnualIncome' of each customer and display the results.

UPDATE Customers
SET AnnualIncome = AnnualIncome - 2000;


-- Write an SQL query to multiply the 'AnnualIncome' of each customer by 1.05 to simulate a 5% raise and display the results.

SELECT FirstName, LastName, AnnualIncome, (AnnualIncome * 1.05) AS Newinc
FROM Customers;

--OR

UPDATE Customers
SET AnnualIncome = AnnualIncome * 1.05;


-- Write an SQL query to divide the 'AnnualIncome' of each customer by 12 to calculate the monthly income and display the results.

SELECT Firstname, LastName, AnnualIncome, (AnnualIncome / 12) AS MonthlyLic
FROM Customers;



-- Write an SQL query to find the remainder when 'AnnualIncome' is divided by 10000 and display the results.

SELECT FirstName, LastName, AnnualIncome, (AnnualIncome % 10000) AS AnnualIncModulus
FROM Customers;


-- Write an SQL query to select all columns from 'Customers' where 'TotalChildren' is equal to 3.

SELECT FirstName, LastName, TotalChildren
FROM Customers
WHERE TotalChildren = 3;


-- Write an SQL query to select all columns from 'Customers' where 'MaritalStatus' is not equal to 'S'.

SELECT FirstName, LastName, MaritalStatus 
FROM Customers
WHERE Maritalstatus <> 'S';


-- Write an SQL query to select all columns from 'Customers' where 'AnnualIncome' is greater than 80000.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 80000;


-- Write an SQL query to select 'FirstName' and 'LastName' from 'Customers' where 'AnnualIncome' is greater than or equal to 90000.


SELECT FirstName, LastName, AnnualIncome 
FROM Customers
WHERE AnnualIncome >= 90000;


-- Write an SQL query to select 'CustomerKey' and 'EmailAddress' from 'Customers' where 'AnnualIncome' is less than or equal to 70000.


SELECT CustomerKey, EmailAddress, AnnualIncome 
FROM Customers
WHERE AnnualIncome <= 70000;


-- T-SQL Aggregate Functions
---------------------------------------
-- What is the average annual income of all customers?

SELECT AVG(AnnualIncome) AS AvgInc
FROM Customers;


-- What is the total number of children across all customers?

SELECT SUM(TotalChildren) AS NoTotalChildren
FROM Customers;

-- What is the maximum annual income among the customers?

SELECT MAX(AnnualIncome) AS MaxAnnualIncomeofTable
FROM Customers;


-- What is the minimum annual income among the customers?


SELECT MIN(AnnualIncome) AS MinimulAnnInc
FROM Customers;


-- What is the count of customers with a Bachelors degree?

SELECT COUNT(EducationLevel) AS BachelorsDegree
FROM Customers;


-- What is the sum of annual incomes for customers with more than 2 children?

SELECT TotalChildren, SUM(AnnualIncome) AS TotalInc
FROM Customers
WHERE TotalChildren > 2
GROUP BY TotalChildren;

-- What is the average annual income of customers who own their home?

SELECT HomeOwner, AVG(AnnualIncome) AS AVGIncome
FROM Customers
WHERE HomeOwner = 'Y'
GROUP BY HomeOwner;


-- What is the total number of customers grouped by marital status?

SELECT MaritalStatus, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY MaritalStatus;


-- What is the average age of customers based on their education level?

SELECT EducationLevel, AVG(DATEDIFF(YEAR, BirthDate, GETDATE())) AS AvgAgeofKids
FROM Customers
GROUP BY EducationLevel;


-- What is the maximum number of children any customer has?

SELECT MAX(TotalChildren) AS MaxTotalChildren 
FROM Customers;


-- LIKE Operators
-------------------------
-- Basic LIKE and Wildcards (% and _)


-- Write a query to find all employees whose names start with "Jo".

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'Jo%';


-- Retrieve employees whose names end with the letter "n".


SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%n';


-- Find all employees whose names have exactly four letters and start with J.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'J___';


-- Find all employees whose names are three letters long and the second letter is "a".


SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '_a_';


-- Write a query to find employees whose names contain "an" anywhere in the name.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%an%';


-- Find employees whose name is exactly "Jon" using wildcards.

SELECT FirstName , LastName
FROM Customers
WHERE FirstName LIKE 'JON';


-- 🔹 LIKE with Escaping Special Characters

-- Write a query to find employees whose names contain an actual underscore _ (not as a wildcard).

SELECT FirstName, Lastname
FROM Customers
WHERE FirstName LIKE '%[_]%';


-- Write a query to find employees whose names include a percent symbol %.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%[%]%';


-- Find employees whose name includes a string like "50_50" where _ is a literal underscore.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%50[_]50%';


--  Write a query using ESCAPE to match the name pattern %!_%, where _ is a real character.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%!_%' ESCAPE '!';


-- 🔹 LIKE with Square Brackets ([])

-- Retrieve employees whose names start with J and the second letter is a, e, or o.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'J[a,e,o]%';


-- Find employees whose names start with J and whose second character is any letter from a to m.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'J[a-m]%';


-- Find employees whose names contain a digit.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%[0-9]%';


-- Write a query to retrieve employees whose names start with J and whose second letter is not o.

SELECT FirstName, LastName 
FROM Customers
WHERE Firstname LIKE 'J[^o]%';


-- Find employees whose name includes at least one digit between 1 and 5.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%[1-5]%';


-- 🔹 Advanced Pattern Matching Scenarios

-- Find all employees whose names end with 'n' and have exactly 4 characters.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '___n';


-- Retrieve employees whose names start with 'Jo' but are not 'John'.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'Jo%' AND FirstName NOT LIKE 'JOHN';


-- Find employees whose names have exactly 6 characters and start with J.

SELECT FirstName , LastName
FROM Customers
WHERE FirstName LIKE 'J_____';


-- Find all employees whose names contain at least one uppercase letter followed by a digit.

SELECT FirstName , LastName
FROM Customers
WHERE FirstName LIKE '%[A-Z][0-9]%';


-- Write a query to find employees whose names start with 'J', end with 'n', and do not contain the letter 'a'.


SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'J%[^a]%N';


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- MExs

-- SALARY IS GREATER THEN AVERAGE SALARY

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
( SELECT AVG(AnnualIncome) 
FROM Customers);


-- SECOND LARGEST SALARY 

SELECT DISTINCT AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

--OR 9WITHOUT USING TOP OR LIMIT

SELECT MAX(AnnualIncome) AS SecondLargestInc
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome)
FROM Customers);


--USING DENSE RANK

SELECT FirstName, LastName, AnnualIncome, DENSE_RANK() OVER (ORDER BY AnnualIncome ASC) AS RANK
FROM Customers;


-- MISCELLANOUS ECERCISE

-- Retrieve the full names (FirstName + LastName) and EmailAddress of all customers.

SELECT FirstName, LastName, EmailAddress
FROM Customers;


-- List all customers who have an annual income greater than $70,000. Show their FirstName, LastName, and AnnualIncome.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 70000;


--  Show the FirstName, LastName, and BirthDate of customers sorted by BirthDate in ascending order (oldest to youngest).

SELECT FirstName, LastName, BirthDate
FROM Customers
ORDER BY BirthDate ASC;


-- Update the AnnualIncome to 75000 for all customers who have the occupation 'Clerical'.

UPDATE Customers
SET AnnualIncome = 75000
WHERE Occupation = 'Clerical';

SELECT *
FROM Customers
WHERE Occupation = 'Clerical';


-- Change the MaritalStatus to 'M' for customers whose LastName is 'SUAREZ'.

Update Customers
SET MaritalStatus = 'M'
WHERE LastName = 'SUAREZ';



--  Increase the AnnualIncome by 10% for all customers who are homeowners (HomeOwner = 'Y').


SELECT FirstName, LastName, AnnualIncome, (AnnualIncome *1.10) AS NewIncome
FROM Customers
WHERE HomeOwner = 'Y';

-- OR (TO PERMANENTLY SET )

UPDATE Customers
SET AnnualIncome = AnnualIncome * 1.10
WHERE HomeOwner = 'Y';


-- Set the EmailAddress to NULL for customers whose TotalChildren is 0.

UPDATE Customers
SET EmailAddress = 'NULL'
WHERE TotalChildren = 0;


-- Update the EducationLevel to 'Graduate' for customers who have more than 4 children.

UPDATE Customers
SET EducationLevel = 'Graduate'
WHERE TotalChildren > 4;


-- How would you add a new column called PhoneNumber of type VARCHAR(15) to the Customers table?

ALTER TABLE Customers
ADD PhoneNumber VARCHAR(15);


-- Write a query to change the data type of the AnnualIncome column from DECIMAL(10, 2) to FLOAT.

ALTER TABLE Customers
ALTER COLUMN AnnualIncome FLOAT;


-- How can you rename the column HomeOwner to IsHomeOwner in the Customers table?

EXEC sp_rename 'HomeOwner', 'IsHomeowner', 'COLUMN';

-- Write an SQL statement to drop the column Prefix from the Customers table.

ALTER TABLE Customers
DROP COLUMN Prefix;



-- Write an SQL query to delete all customers whose AnnualIncome is less than 30,000 from the Customers table.

DELETE FROM Customers
WHERE AnnualIncome < 30000;


-- How would you delete the record of the customer with the CustomerKey equal to 11025?

DELETE FROM Customers
WHERE CustomerKey = 11025;



-- Write a query to completely remove the Customers table from the database.

DROP TABLE Customers;


-- How can you remove all rows from the Customers table while keeping its structure intact?

TRUNCATE TABLE Customers;


-- Write a query to retrieve all customers who are Married and have more than 2 children.

SELECT *
FROM Customers
WHERE MaritalStatus = 'M' AND TotalChildren = 2;


-- Find all female customers whose AnnualIncome is more than 50,000 and who are homeowners.

SELECT FirstName, LastName, Gender, AnnualIncome
FROM Customers
WHERE Gender = 'F' AND AnnualIncome >50000 AND HomeOwner = 'Y';


-- Retrieve customers who have the occupation Clerical and education level as Partial College.

SELECT FirstName, LastName
FROM Customers
WHERE Occupation = 'Clerical' AND EducationLevel = 'Partial College';


-- List customers whose gender is 'M' and have less than 3 total children.

SELECT FirstName, LastName, Gender, TotalChildren
FROM Customers
WHERE Gender = 'M' AND TotalChildren < 3;


-- Select customers who are homeowners and have an annual income greater than 60,000.

SELECT FirstName, LastName, HomeOwner, AnnualIncome
FROM Customers
WHERE HomeOwner = 'Y' AND AnnualIncome > 60000;


-- Write a query to find customers who are either Single or have an occupation as Management.

SELECT FirstName, LastName, MaritalStatus, Occupation
FROM Customers
WHERE MaritalStatus = 'S' AND Occupation = 'Management';


-- SECOND HIGHEST SALARY

SELECT MAX(AnnualIncome) AS SecondHighestInc
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome)
FROM Customers);

-- OR

SELECT DISTINCT AnnualIncome
FROM Customers
ORDER BY MAX(AnnualIncome) DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


--USING DENSE RANK

SELECT FirstName, LastName, Annualincome, DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK
FROM Customers;


-- Select all customers whose EducationLevel is either High School or Partial High School.

SELECT *
FROM Customers
WHERE EducationLevel IN ('High School', 'Partial High School');


-- Find customers who are either Female or have 0 children.


SELECT Firstname, LastName, Gender, TotalChildren
FROM Customers
WHERE Gender = 'F' AND TotalChildren = 0;


-- List all customers who were born before 1950 or after 1980.

SELECT FirstName, LastName, BirthDate
FROM Customers
WHERE YEAR(BirthDate) BETWEEN 1950 AND 1980;


-- Write an SQL query to find customers whose AnnualIncome is between 30,000 and 70,000.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome BETWEEN 30000 AND 70000;


-- Select customers whose birth dates are between '1960-01-01' and '1970-12-31'.

SELECT Firstname, LastName, BirthDate
FROM Customers
WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970;


-- Retrieve customers whose CustomerKey is between 11010 and 11020.

SELECT CustomerKey, FirstName, LastName
FROM Customers
WHERE CustomerKey BETWEEN 11010 AND 11020;


-- Find all customers with TotalChildren between 1 and 4.

SELECT FirstName, LastName, TotalChildren
FROM Customers
WHERE TotalChildren BETWEEN 1 AND 4;


-- Get records of customers whose AnnualIncome falls between 10,000 and 50,000 and are not homeowners.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome BETWEEN 10000 AND 50000 AND HomeOwner = 'N';


-- Write a query to retrieve customers with EducationLevel IN ('Bachelors', 'Partial College')

SELECT FirstName, LastName, EducationLevel
FROM Customers
WHERE EducationLevel IN ('Bachelors', 'Partial College');


-- Write a query to find customers whose LastName is exactly 5 characters long.

SELECT FirstName, LastName
FROM Customers
WHERE LastName LIKE '_____';

--OR

SELECT FirstName, LastName
FROM Customers
WHERE LEN(LastName) = 5;


-- Retrieve customers whose FirstName starts with J and is exactly 4 characters long.

SELECT FirstName , LastName
FROM Customers
WHERE FirstName LIKE 'J___';


--OR 

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'J%' AND LEN(FirstName) = 4;


-- Find customers whose MaritalStatus is a single character and starts with M.

SELECT FirstName, LastName, MaritalStatus
FROM Customers
WHERE MaritalStatus = 'M';



-- List all customers whose Occupation starts with S, followed by any two characters.

SELECT FirstName, LastName, Occupation
FROM Customers
WHERE FirstName LIKE 'S__';


-- Write a query to find customers whose LastName starts with a letter in the range [A-C].


SELECT FirstName, LastName
FROM Customers
WHERE LastName LIKE '[A-C]%';


-- Retrieve all customers whose FirstName starts with either J, K, or L.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '[J,K,L]%';


-- Find customers whose Occupation starts with any character from [P-Z].

SELECT FirstName, LastName, Occupation
FROM Customers
WHERE Occupation LIKE '[P-Z]%';


-- Select customers whose EducationLevel contains a letter in the set [oO].

SELECT Firstname, LastName, EducationLevel
FROM Customers
WHERE EducationLevel LIKE '%[oO]%';

-- Get customers whose LastName starts with a vowel [AEIOUaeiou].

SELECT FirstName, LastName
FROM Customers
WHERE LastName LIKE '[AEIOUaeiou]%';



-- Find customers whose occupation is IN ('Clerical', 'Management', 'Professional').

SELECT FirstName, LastName, Occupation
FROM Customers
WHERE Occupation IN ('Clerical', 'Management', 'Professional');


-- Select all customers whose gender is IN ('F', 'M').

SELECT Firstname, LastName, Gender
FROM Customers
WHERE Gender IN ('F', 'M');


-- Retrieve records where MaritalStatus is IN ('M', 'S').


SELECT FirstName, LastName, MaritalStatus 
FROM Customers
WHERE MaritalStatus IN ('M', 'S');


-- Get customers whose CustomerKey is IN (11005, 11010, 11015, 11020).


SELECT CustomerKey, FirstName, LastName
FROM Customers
WHERE CustomerKey IN  (11005, 11010, 11015, 11020);


-- Write a query to retrieve customers who are NOT homeowners.

SELECT FirstName, LastName, HomeOwner
FROM Customers
WHERE HomeOwner = 'N';

-- Select all customers who do NOT have AnnualIncome between 60,000 and 100,000.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome NOT BETWEEN 60000 AND 100000;


-- Retrieve customers whose Occupation is NOT IN ('Clerical', 'Skilled Manual').

SELECT FirstName, LastName, Occupation 
FROM Customers
WHERE Occupation NOT IN ('Clerical', 'Skilled Manual');


-- Get records of customers who do NOT have an email address ending with '@learnsector.com'.

SELECT FirstName, LastName, EmailAddress
FROM Customers
WHERE EmailAddress NOT LIKE '%@learnsector.com';


-- Find all customers who are NOT Married and have more than 1 child.

SELECT FirstName, LastName, MaritalStatus, TotalChildren
FROM Customers
WHERE MaritalStatus='M' AND TotalChildren <= 1;


-- Write a query to find customers whose EmailAddress ends with @gmail.com.


SELECT FirstName , LastName, EmailAddress
FROM Customers
WHERE EmailAddress LIKE '%@gmail.com';



-- Retrieve all customers whose LastName starts with the letter S.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'S%';


-- Find customers whose FirstName contains the substring 'ann'.


SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%ann%';


-- Select all customers whose Occupation includes the word Manual.

SELECT FirstName, LastName, Occupation
FROM Customers
WHERE Occupation LIKE '%Manual%';
 

-- Get a list of customers whose EducationLevel starts with the word Partial.


SELECT FirstName, LastName, EducationLevel 
FROM Customers
WHERE EducationLevel LIKE '%Partial%';


-- Write a query to find customers whose FirstName does not start with the letters A, B, or C.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName NOT LIKE '[A-C]%';

-- Retrieve customers whose LastName does not start with a vowel.

SELECT FirstName, LastName
FROM Customers
WHERE LastName NOT LIKE '[AEIOUaeiou]%';


-- Find customers whose Occupation starts with any character except M, N, or O.

SELECT FirstName, LastName, Occupation
FROM Customers
WHERE Occupation NOT LIKE '[M-O]%';


-- List customers whose EducationLevel does not contain the letters [hH].

SELECT FirstName, LastName, EducationLevel
FROM Customers
WHERE EducationLevel NOT LIKE '%[Hh]%';


-- Get all customers whose FirstName does not begin with a letter in the range [A-F].

SELECT FirstName, LastName
FROM Customers
WHERE FirstName NOT LIKE '[A-F]%';


-- Find all employees whose names end with 'n' and have exactly 4 characters.

SELECT FirstName, LastName 
FROM Customers
WHERE LastName LIKE '___n';

--OR

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE '%n' AND LEN(FirstName) = 4;


-- Retrieve employees whose names start with 'Jo' but are not 'John'.

SELECT Firstname, LastName
FROM Customers
WHERE FirstName LIKE 'Jo%' AND FirstName <> 'John';


-- Find employees whose names have exactly 6 characters and start with J.

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'J_____';


--OR

SELECT FirstName, LastName 
FROM Customers
WHERE FirstName LIKE 'j%' AND LEN(FirstName) = 6;



SELECT * FROM Customers;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ASSIGNMENT ;- 4

--  **Write an SQL query to categorize customers' AnnualIncome into three groups: 'Low Income' for those earning less than $60,000, 'Middle Income' for those earning between $60,000 and $80,000, and 'High Income' for those earning more than $80,000. Use a CASE statement to achieve this.**

SELECT FirstName, LastName, AnnualIncome, 
CASE 
	WHEN AnnualIncome < 60000 THEN 'LOW INCOME'
	WHEN AnnualIncome BETWEEN 60000 AND 80000 THEN 'MIDDLE INCOME'
	WHEN AnnualIncome > 80000 THEN 'HIGH INCOME'
END AS IncomeCategory
FROM Customers;


-- **Using a CASE statement, create a query that returns 'Married' if the MaritalStatus is 'M', 'Single' if it's 'S', and 'Unknown' for any other value.**

SELECT FirstName, LastName, MAritalStatus,
CASE
	WHEN MaritalStatus = 'M' THEN 'MARRIED'
	WHEN MaritalStatus = 'S' THEN 'SINGLE'
	ELSE 'UNKNOWN'
END AS MaritalStatusCategory
FROM Customers;


-- **Write a query to calculate a 'Discount' column where customers with an AnnualIncome above $70,000 get a 20% discount, those between $50,000 and $70,000 get a 10% discount, and those below $50,000 get no discount. Use a CASE statement.**


SELECT FirstName, LastName, AnnualIncome, 
CASE 
	WHEN AnnualIncome > 70000 THEN AnnualIncome * 0.80
	WHEN AnnualIncome BETWEEN 50000 AND 70000 THEN AnnualIncome * 0.90
	ELSE AnnualIncome
END AS DiscountedPrice
FROM Customers;


-- **Create an SQL query that uses CASE to label customers as 'High Earner' if their AnnualIncome is above $80,000, 'Medium Earner' if it's between $60,000 and $80,000, and 'Low Earner' if it's below $60,000.**

SELECT FirstName, LastName , AnnualIncome ,
CASE
	WHEN AnnualIncome > 80000 THEN 'HIGH EARNER'
	WHEN AnnualIncome BETWEEN 60000 AND 80000 THEN 'MEDIUM EARNER'
	ELSE 'LOW EARNER'
END AS CategoryAnnual
FROM Customers;


-- **Write a query using CASE that returns 'Senior' if the customer's age (calculated from BirthDate) is greater than 60, 'Adult' if it's between 30 and 60, and 'Young' if it's below 30.**


SELECT FirstName, LastName, BirthDate, DATEDIFF(YEAR,BirthDate, GETDATE())As Age,
CASE 
	WHEN DATEDIFF(YEAR, BirthDate,GETDATE()) > 60 THEN 'SENIOR CITIZEN'
	WHEN DATEDIFF(YEAR, BirthDate,GETDATE()) BETWEEN 30 AND 60 THEN 'ADULT'
	ELSE 'YOUNG'
END AS AgeOfEmp
FROM Customers;


-- **Using a CASE statement, create a query that marks 'Eligible for Credit' for customers whose AnnualIncome is more than $50,000 and 'Not Eligible' for those whose income is less than or equal to $50,000.**

SELECT Firstname, LastName, Annualincome,
CASE 
	WHEN AnnualIncome > 50000 THEN 'ELIGIBLE FOR CREDIT'
	ELSE 'NOT ELIGIBLE'
END AS EligibilityCriteria
FROM Customers;


-- 7. **Write a query using a CASE statement to classify customers as 'Homeowner' if HomeOwner is 'Y', 'Non-homeowner' if HomeOwner is 'N', and 'Unknown' if the value is null or not available.**

SELECT FirstName, LastName, HomeOwner,
CASE
	WHEN HomeOwner = 'Y' THEN 'HOMEOWNER'
	WHEN HomeOwner = 'N' THEN 'NON-HOMEOWNER'
	ELSE 'UNKNOWN'
END AS HousingPatters
FROM Customers;


-- 8. **Use CASE in an SQL query to return a column called 'OccupationGroup' where 'Professional' is grouped as 'White Collar', 'Manual' as 'Blue Collar', and any other occupation as 'Other'.**

SELECT FirstName, LastName, Occupation, 
CASE 
	WHEN Occupation ='Professional' THEN 'WHITE COLLAR'
	WHEN Occupation ='Manual' THEN 'BLUE COLLAR'
	ELSE 'Other'
END AS OccupationGroup
FROM Customers;


-- 9. **Write an SQL query with a CASE statement that calculates a bonus where customers with more than 3 children get a $1,000 bonus, customers with 1 to 3 children get a $500 bonus, and customers with no children get no bonus.**


SELECT FirstName, LastName, TotalChildren, AnnualIncome,
CASE 
	WHEN TotalChildren > 3 THEN AnnualIncome + 1000
	WHEN TotalChildren BETWEEN 1 AND 3 THEN AnnualIncome + 500
	ELSE AnnualIncome 
END AS BonusOffered
FROM Customers;


-- **Create a query that uses CASE to categorize customers by education level: 'Graduate' if EducationLevel is 'Bachelors' or higher, 'Undergraduate' if it's 'Some College', and 'Non-Graduate' for any other value.**


SELECT Firstname, LastName, EducationLevel,
CASE 
	WHEN EducationLevel = 'Bachelors' THEN 'GRADUATE'
	WHEN EducationLevel = 'Partial College' THEN 'UNDERGRADUATE'
	ELSE 'NON GRADUATE'
END AS EducationCategory
FROM Customers;



------------------------------------------------------------------------------------------------ SUBQUERY


-- **Write an SQL query to find the customers who earn more than the average AnnualIncome of all customers. Use a subquery to calculate the average income.**

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome >
( SELECT AVG(AnnualIncome)
FROM Customers);



-- **Create a query that returns the FirstName and LastName of customers who have the highest AnnualIncome. Use a subquery to find the maximum AnnualIncome.**

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome IN 
(SELECT MAX(AnnualIncome)
FROM Customers);


-- 3. **Write a query to list all customers whose AnnualIncome is higher than the average AnnualIncome of customers in the same Occupation. Use a subquery to calculate the average income per occupation.**

SELECT Occupation, AnnualIncome
FROM Customers c
WHERE AnnualIncome > (
    SELECT AVG(AnnualIncome)
    FROM Customers
    WHERE Occupation = c.Occupation
);



-- 4. **Using a subquery, write an SQL query to find customers who have more children than the customer with the first name 'JON'.**


SELECT FirstName, LastName, TotalChildren
FROM Customers
WHERE TotalChildren >
(SELECT TotalChildren
FROM Customers
WHERE FirstName = 'JON');



-- 5. **Write a query that returns the names of customers who own a home ('HomeOwner' = 'Y') and whose AnnualIncome is higher than any customer who does not own a home ('HomeOwner' = 'N'). Use a subquery to compare the incomes.**

SELECT FirstName, LastName, HomeOwner, AnnualIncome
FROM Customers
WHERE HomeOwner = 'Y' AND AnnualIncome > ANY
( SELECT AnnualIncome
FROM Customers
WHERE HomeOwner = 'N');


-- 6. **Create an SQL query to find customers whose MaritalStatus is 'S' (single) and who earn more than the average income of married customers ('M'). Use a subquery to get the average income of married customers.**


SELECT FirstName, LastName, MaritalStatus, AnnualIncome
FROM Customers
WHERE MaritalStatus = 'S' AND AnnualIncome >
(SELECT AVG(AnnualIncome)
FROM Customers);


-- 7. **Write a query that returns the details of customers whose BirthDate is the same as the oldest customer's BirthDate. Use a subquery to find the minimum BirthDate.**

SELECT FirstName, LastName , BirthDate
FROM Customers
WHERE BirthDate IN 
(SELECT MIN(BirthDate)
FROM Customers);


-- 8. **Using a subquery, create a query to find customers whose AnnualIncome is greater than the AnnualIncome of any EducationLevel. (Assume city information is available in another table.)**

SELECT FirstName, LastName, AnnualIncome 
FROM Customers
WHERE AnnualIncome > ANY
(SELECT AnnualIncome
FROM Customers
WHERE EducationLevel ='High School');


-- 9. **Write a query that returns the names of customers who have the same number of children as the customer with the highest income. Use a subquery to find the total number of children for the highest-income customer.**


SELECT FirstName, LastName, TotalChildren , AnnualIncome
FROM Customers
WHERE TotalChildren IN
(SELECT TotalChildren
FROM Customers
WHERE AnnualIncome = (SELECT MAX(AnnualIncome) FROM Customers));



-- 10. **Create a query that lists the customers whose AnnualIncome is less than the average income of all customers but greater than the lowest income of all customers. Use subqueries to calculate both the average and minimum incomes.**

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome <
(SELECT AVG(AnnualIncome)
FROM Customers)
AND AnnualIncome > 
(SELECT MIN(AnnualIncome)
FROM Customers);


-- 1.Find the name of the customer who has placed the highest AnnualIncome?

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome =
(SELECT MAX(AnnualIncome)
FROM Customers);

--OR

SELECT FirstName, LastName,AnnualIncome, DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK
FROM Customers;


--2.List customers from Occupation where the average AnnualIncome is greater than $200

SELECT Occupation, AVG(AnnualIncome) AS AVGIncomeOfCustomers
FROM Customers
GROUP BY Occupation
HAVING AVG(AnnualIncome) > 50000;

--OR

SELECT Occupation, AVGIncomeOfCustomers
FROM (
    SELECT Occupation, AVG(AnnualIncome) AS AVGIncomeOfCustomers
    FROM Customers
    GROUP BY Occupation
) AS anuj
WHERE AVGIncomeOfCustomers > 50000;


-- 3.Retrieve Occupation and their respective highest order amount

SELECT Occupation, HighestInc
FROM (
SELECT Occupation,MAX(AnnualIncome) AS HighestInc
FROM Customers
GROUP BY Occupation) As Anuj;


-- 4.Find the unique Occupation where customers are having total children more then 2.

SELECT DISTINCT Occupation, TotalChildren
FROM Customers
WHERE TotalChildren > 2;

--OR

SELECT DISTINCT Occupation, TotalChildren
FROM Customers
WHERE TotalChildren IN
(SELECT TotalChildren
FROM Customers
WHERE TotalChildren > 2);



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--STORED PROCEDURE 

-- Write a stored procedure to fetch all the details of customers.


CREATE PROCEDURE CustDetail
AS 
BEGIN
	SELECT *FROM Customers;
END;

EXEC CustDetail;


-- Write a stored procedure to find customers by their first name. 

CREATE PROCEDURE CustName
@CustFirstName  VARCHAR(30)
AS 
BEGIN
	SELECT FirstName, LastName 
	FROM Customers
	WHERE FirstName = @CustFirstName;
END;

EXEC CustName @CustFirstName = 'JULIO';




-- Write a stored procedure to find customers by their last name.

CREATE PROCEDURE CustLName
@CustLastName VARCHAR(30)
AS
BEGIN 
	SELECT FirstName, LastName
	FROM Customers
	WHERE LastName = @CustLastName;
END;

EXEC CustLname @CustLastName = 'WALKER';


-- Write a stored procedure to update the email address of a customer by their customer key.

CREATE PROCEDURE UpdCust
@CustKey INT,
@CustEmailAdd VARCHAR(50)
AS
BEGIN
	UPDATE Customers
	SET EmailAddress = @CustEmailAdd
	WHERE CustomerKey = @CustKey;
END;

EXEC UpdCust @CustKey = 11010, @CustEmailAdd = 'jacqronaldohotchic@gmail.com';

SELECT *FROM Customers;


-- Write a stored procedure to delete a customer based on their customer key.

CREATE PROCEDURE DelCust
@CustomerKey INT
AS
BEGIN
	DELETE FROM Customers
	WHERE CustomerKey = @CustomerKey
END;

EXEC DelCust @CustomerKey=11000;

SELECT *FROM Customers;




-- Write a stored procedure to find customers based on their marital status.

CREATE PROCEDURE CustMaarriage
@MaritalStatus VARCHAR(4)
AS
BEGIN
	SELECT FirstName, LastName, MaritalStatus
	FROM Customers
	WHERE MaritalStatus = @MaritalStatus;
END;

EXEC CustMaarriage @MaritalStatus = 'M';


--  Write a stored procedure to find customers based on their gender.

CREATE PROCEDURE CustGender
@Gender VARCHAR(4)
AS
BEGIN
	SELECT FirstName, LastName, Gender
	FROM Customers
	WHERE Gender = @Gender;
END;

EXEC CustGender @Gender = 'M';



-- Write a stored procedure to count the total number of customers.

CREATE PROCEDURE Custcount
AS
BEGIN
	SELECT COUNT(*) AS TotalCustomers
	FROM Customers;
END;

EXEC CustCount;


-- Write a stored procedure to find customers based on their education level.

CREATE PROCEDURE CustEdu
@edulevel VARCHAR(30)
AS
BEGIN
	SELECT FirstName, LastName, EducationLevel
	FROM Customers
	WHERE EducationLevel = @edulevel;
END;

EXEC CustEdu @edulevel = 'Bachelors';


-- Write a stored procedure to find customers based on their occupation.

CREATE PROCEDURE CustOcc
@Occu VARCHAR(30)
AS
BEGIN
	SELECT FirstName, LastName, Occupation
	FROM Customers
	WHERE Occupation = @Occu;
END;

EXEC CustOcc @Occu = 'Professional';


-- Write a stored procedure to calculate the average annual income of all customers.

CREATE PROCEDURE AvgAnnInc
AS
BEGIN
	SELECT AVG(AnnualIncome) AS AverageAnnincom
	FROM Customers;
END;

EXEC AvgAnnInc;


--  Write a stored procedure to find customers based on their home ownership status.

CREATE PROCEDURE CustHome
@CustHomeOwn VARCHAR(20)
AS
BEGIN
	SELECT FirstName, LastName, HomeOwner
	FROM Customers
	WHERE HomeOwner = @CustHomeOwn;
END;

EXEC CustHome @CustHomeOwn = 'Y';


--  Write a stored procedure to update the annual income of a customer based on their customer key.

CREATE PROCEDURE UpdCustAnn
@CustomerKey INT,
@AnnualInc INT
AS
BEGIN
	UPDATE Customers
	SET AnnualIncome = @AnnualInc
	WHERE CustomerKey = @CustomerKey;
END;

EXEC UpdCustAnn @CustomerKey = 11001 , @AnnualInc = 49000;


SELECT *FROM Customers;


-- Write a stored procedure to find customers based on their email domain.

CREATE PROCEDURE CustEmail
@EmailAd VARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName, EmailAddress
	FROM Customers
	WHERE EmailAddress LIKE '%' + @EmailAd;
END;


EXEC CustEmail @EmailAd = '@learnsector.com';


--  Write a stored procedure to find customers based on their birth year.

CREATE PROCEDURE CustBirthD
@BirthYear INT
AS
BEGIN
	SELECT FirstName, LastName, BirthDate
	FROM Customers
	WHERE YEAR(BirthDate) = @BirthYear;
END;

EXEC CustBirthD @birthYear = 1965;


-- Write a stored procedure to find customers based on the total number of children they have.

CREATE PROCEDURE CustTotChil 
@CustTC INT
AS
BEGIN
	SELECT FirstName, LastName, TotalChildren
	FROM Customers
	WHERE TotalChildren = @CustTC;
END;

EXEC CustTotChil @CustTC = 2;


--  Write a stored procedure to find customers based on their prefix (e.g., Mr., Mrs., Ms.).

CREATE PROCEDURE CustPrefix
@CustPrefix VARCHAR(5)
AS
BEGIN
	SELECT Prefix,FirstName, LastName
	FROM Customers
	WHERE Prefix = @CustPrefix;
END;

EXEC CustPrefix @CustPrefix = 'Mr.';


-- Write a stored procedure to find customers based on their first and last name.

CREATE PROCEDURE CustName
@CustFName VARCHAR(10), @CustLastName VARCHAR(10) 
AS
BEGIN
	SELECT *
	FROM Customers
	WHERE FirstName = @CustFName AND LastName = @CustLastName;
END;

EXEC CustName @CustFName = 'JULIO' , @CustLastName = 'RUIZ';


-- Write a stored procedure to find customers based on a range of annual incomes. 

CREATE PROCEDURE Custange
AS 
BEGIN
	SELECT FirstName, LastName, AnnualIncome , 
	CASE
		WHEN AnnualIncome < 50000 THEN 'LOW INCOME'
		WHEN AnnualIncome BETWEEN 50000 AND 80000 THEN 'MEDIUM INCOME'
		ELSE 'HIGH INCOME'
	END AS NewAnnInc
	FROM Customers;
END;

EXEC Custange;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SQL ASSIGNMENT 6(REDO)

-- Create EmployeeDetail Table and insert records in the table as it is Mentioned in the below image  and Solve questions based upon it  

CREATE TABLE EmpDetail( empid INT PRIMARY KEY, firstname VARCHAR(30), lastname varchar(30), Salary Decimal(10,2), joiningdate DATETIME, department VARCHAR(10),  gender VARCHAR(8));

INSERT INTO EmpDetail VALUES
(1, 'Vikas', 'Ahlawat', 600000, '2013-02-12 11:16:00', 'IT', 'Male'),
(2, 'Nikita','Jain', 530000, '2013-02-14 11:16:00', 'HR', 'Female'),
(3, 'Ashish','Kumar', 1000000, '2013-02-14 11:16:00','IT', 'Male'),
(4, 'Nikhil','Sharma', 480000, '2013-02-15 11:16:00','HR', 'Male'),
(5, 'Anish','Kadian', 500000,'2013-02-16 11:16:00','Paroll','Male');


SELECT *FROM EmpDetail;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Write a query to get all employee detail from "EmployeeDetail" table 

SELECT *FROM EmpDetail;

-- Write a query to get only "FirstName" column from "EmployeeDetail" table

SELECT firstname
FROM EmpDetail;

-- Write a query to get FirstName in upper case as "First Name".

SELECT UPPER(firstname) AS UpperCaseName
FROM EmpDetail;


--  Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) 
--i. Select employee detail whose name is "Vikas 
-- ii. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.

SELECT UPPER(CONCAT(firstname, ' ' , lastname)) AS Name
FROM EmpDetail;

SELECT UPPER(CONCAT(firstname, ' ' , lastname)) AS Name
FROM EmpDetail
WHERE firstname  = 'VIKAS';

SELECT UPPER(CONCAT(firstname, ' ',lastname)) AS Name
FROM EmpDetail
WHERE firstname LIKE 'A%';


-- iii. Get all employee detail from EmployeeDetail table whose "LastName" start with latter 'a'. 
--iv. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'

SELECT firstname, lastname
FROM EmpDetail
WHERE lastname LIKE 'a%';


SELECT *
FROM EmpDetail
WHERE firstname LIKE '%a';


--  Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT firstname, lastname 
FROM EmpDetail
WHERE firstname LIKE '[a-p]%';


-- Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'

SELECT firstname , lastname 
FROM EmpDetail
WHERE firstname NOT LIKE '[a-p]%';


-- Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character 

SELECT firstname, lastname , gender 
FROM EmpDetail
WHERE gender LIKE '%le' AND LEN(gender) = 4;


-- OR

SELECT firstname, lastname , gender
FROM EmpDetail
WHERE gender LIKE '__le';


--  Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters

SELECT firstname, lastname ,joiningdate
FROM EmpDetail
WHERE firstname LIKE 'A____';

--OR

SELECT firstname, lastname , joiningdate
FROM EmpDetail
WHERE firstname LIKE 'A%' AND LEN(firstname) = 5;


--  Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".

SELECT firstname, lastname 
FROM EmpDetail
WHERE firstname LIKE '%[%]%';


-- Get all unique "Department" from EmployeeDetail table 

SELECT DISTINCT department 
FROM EmpDetail;


-- Get the highest "Salary" from EmployeeDetail table. 

SELECT MAX(Salary) AS MaxSalary
FROM EmpDetail;


-- Get the lowest "Salary" from EmployeeDetail table

SELECT MIN(Salary) AS MinSalary
FROM EmpDetail;


-- Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013

SELECT firstname, lastname,FORMAT(joiningdate, 'dd MMM yyyy') AS JoiningDate
FROM EmpDetail;


-- Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT firstname, lastname , FORMAT(joiningdate, 'yyyy/mm/dd') AS NewJoinDate
FROM EmpDetail;


-- Show only time part of the "JoiningDate" 

SELECT firstname, lastname , FORMAT(joiningdate, 'HH:mm:ss') AS OnlyTime
FROM EmpDetail;


-- Get only Year part of "JoiningDate" 

SELECT firstname, lastname , YEAR(joiningdate) AS JoiningYear
FROM EmpDetail;

-- Get only Month part of "JoiningDate” 

SELECT firstname, lastname, MONTH(joiningdate) AS JoiningMonth, DATENAME(MONTH , joiningdate) AS MonthName
FROM EmpDetail;


-- Get system date 

SELECT GETDATE();


-- Get the first name, current date, joiningdate and diff between current date and joining date in months. 

SELECT firstname, lastname , joiningdate, DATEDIFF(MONTH, joiningdate, GETDATE()) AS NoofMonths, DATENAME(YEAR, joiningdate) AS YearName
FROM EmpDetail;


-- Get the first name, current date, joiningdate and diff between current date and joining date in days. 

SELECT firstname, lastname, joiningdate , DATEDIFF(DAY, joiningdate, GETDATE()) AS diffindays
FROM EmpDetail;


-- Get all employee details from EmployeeDetail table whose joining year is 2013 

SELECT firstname , lastname , joiningdate
FROM EmpDetail
WHERE YEAR(joiningdate) = 2013;


-- Get all employee details from EmployeeDetail table whose joining month is Jan(1) 

SELECT firstname, lastname , joiningdate
FROM EmpDetail
WHERE DATENAME(MONTH, joiningdate) = 'January';


-- Get how many employee exist in "EmployeeDetail" table

SELECT COUNT(*) AS TotalEmployees
FROM EmpDetail;


-- Select only one/top 1 record from "EmployeeDetail" table 

SELECT TOP 1 *
FROM EmpDetail
ORDER BY Salary DESC;


-- Select all employee detail with First name "Vikas","Ashish", and "Nikhil".

SELECT firstname, lastname , joiningdate
FROM EmpDetail
WHERE firstname IN ('Vikas', 'Ashish', 'Nikhil');


-- Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"

SELECT firstname, lastname, gender, department
FROM EmpDetail
WHERE firstname NOT IN ('Vikas','Ashish', 'Nikhil');


-- Select first name from "EmployeeDetail" table after removing white spaces from right side

SELECT RTRIM(firstname) AS RIGHTFIRSTNAME
FROM EmpDetail;


-- Select first name from "EmployeeDetail" table after removing white spaces from left side 

SELECT LTRIM(firstname) AS LeftFirstName
FROM EmpDetail;



-- Display first name and Gender as M/F.(if male then M, if Female then F) 

SELECT  firstname, lastname, gender,
CASE
	WHEN gender = 'Male' THEN 'M'
	WHEN gender = 'Female' THEN 'F'
	ELSE 'UNKNOWN'
	END AS Abbevatedgender
FROM EmpDetail;


-- Select first name from "EmployeeDetail" table prifixed with "Hello 

SELECT 'HELLO' + ' ' +firstname AS Newname 
FROM EmpDetail;

-- Get employee details from "EmployeeDetail" table whose Salary greater than 600000 

SELECT firstname, lastname, Salary
FROM EmpDetail
WHERE Salary > 600000;


-- Get employee details from "EmployeeDetail" table whose Salary less than 700000 

SELECT firstname, lastname , Salary
FROM EmpDetail
WHERE Salary < 700000;


-- Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000 

SELECT firstname, lastname , Salary
FROM EmpDetail
WHERE Salary BETWEEN 500000 AND 600000;


-----------------------------------------------------------------------------------------------------------------
-- Advanced Queries(For Experienced Candidates)  

-- Create ProjectDetail Table and insert records in the table as it is Mentioned in the below image  and Solve questions based upon it  

CREATE TABLE Projectdetail (projectid INT PRIMARY KEY, empid INT, projectname VARCHAR(30), FOREIGN KEY(empid) REFERENCES EmpDetail(empid));

INSERT INTO ProjectDetail VALUES
(1,1,'Task Track'),
(2,1, 'CLP'),
(3,1, 'Survey Management'),
(4,2, 'HR Management'),
(5, 3, 'Task Track'),
(6,3, 'GRS'),
(7,3, 'DDS'),
(8, 4, 'HR Management'),
(9, 5, 'GL Management');



SELECT *FROM EmpDetail;
SELECT *FROM ProjectDetail;


--   Give records of ProjectDetail table 

SELECT *FROM ProjectDetail;


-- Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table. 

SELECT department , SUM(Salary) As TotalDeptsalary
FROM EmpDetail
GROUP BY department ;


-- Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary. 

SELECT department, SUM(Salary) AS deptSalary
FROM EmpDetail
GROUP BY department 
ORDER BY SUM(Salary) ASC;


--  Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary

SELECT department, SUM(Salary) AS deptSalary
FROM EmpDetail
GROUP BY department
ORDER BY SUM(Salary) DESC;


-- Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table. 

SELECT department, COUNT(department) AS Totaldept, SUM(Salary) AS TotalSalary
FROM EmpDetail
GROUP BY department;


-- Get department wise average salary from "EmployeeDetail" table order by salary ascending

SELECT department, AVG(Salary) AS AvgSalary
FROM EmpDetail
GROUP BY department;


-- Get department wise maximum salary from "EmployeeDetail" table order by salary ascending

SELECT department, MAX(Salary) AS MaxSalary
FROM EmpDetail
GROUP BY department
ORDER BY MAX(Salary) ASC;


-- Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.

SELECT department, MIN(Salary) AS LowestSalary
FROM EmpDetail
GROUP BY department
ORDER BY MIN(Salary) ASC;


-- Join both the table that is Employee and ProjectDetail based on some common paramter 

SELECT EmpDetail.firstname, EmpDetail.lastname, EmpDetail.Salary, ProjectDetail.projectname
FROM EmpDetail
JOIN ProjectDetail 
ON EmpDetail.empid = ProjectDetail.empid;


-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.

SELECT EmpDetail.firstname, EmpDetail.lastname, ProjectDetail.projectname
FROM EmpDetail
INNER JOIN ProjectDetail
ON EmpDetail.empid = ProjectDetail.empid
ORDER BY EmpDetail.firstname ASC;


-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.

SELECT EmpDetail.firstname, EmpDetail.lastname, EmpDetail.Salary, ProjectDetail.projectname
FROM EmpDetail
LEFT JOIN ProjectDetail
ON EmpDetail.empid = ProjectDetail.empid
ORDER BY EmpDetail.firstname ASC;


-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"

SELECT EmpDetail.firstname, EmpDetail.lastname, COALESCE(ProjectDetail.projectname , 'NO PROJECT ASSIGNED') AS projectname
FROM EmpDetail
LEFT JOIN ProjectDetail
ON EmpDetail.empid = ProjectDetail.empid
ORDER BY EmpDetail.firstname ASC;


-- Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail

SELECT EmpDetail.firstname, EmpDetail.lastname, ProjectDetail.projectname
FROM EmpDetail
RIGHT JOIN ProjectDetail
ON EmpDetail.empid = ProjectDetail.empid;


-- Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL 

SELECT *
FROM EmpDetail
FULL OUTER JOIN ProjectDetail
ON EmpDetail.empid = ProjectDetail.empid;


SELECT *FROM EmpDetail;
SELECT *FROM ProjectDetail;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SQL ASSIGNMENT - 5 (REDO)
-- DATABASE USED :- Brands


-- CREATE AND INSERT THE RECORDS

CREATE TABLE Customers ( 
CustomerID INT PRIMARY KEY, 
Name VARCHAR(50), 
Email VARCHAR(100) 
);


CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY, 
CustomerID INT, 
ProductName VARCHAR(50), 
OrderDate DATE, 
Quantity INT, 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
); 


CREATE TABLE Products ( 
ProductID INT PRIMARY KEY, 
ProductName VARCHAR(50), 
Price DECIMAL(10, 2) 
);


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


-- Write a query to retrieve the names and email addresses of customers whose names start with 'J'. 

SELECT Name, Email
FROM Customers
WHERE Name LIKE 'J%';


-- Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders.. 

SELECT  OrderID, ProductName, Quantity 
FROM Orders;



-- Write a query to calculate the total quantity of products ordered. 

SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ProductName
ORDER BY SUM(Quantity) DESC;


--  Write a query to retrieve the names of customers who have placed an order. 

SELECT Customers.Name, Customers.Email , Orders.ProductName, Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;



--JOIN 3 TABLES
SELECT Customers.Name, Customers.Email, Orders.ProductName, Products.Price
FROM Customers 
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Products
ON Orders.ProductName = Products.ProductName;


--  Write a query to retrieve the products with a price greater than $10.00. 

SELECT Customers.Name, Customers.Email, Orders.ProductName , Products.Price
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Products
ON Products.ProductName = Orders.ProductName
WHERE Products.Price > 10.00;



--  Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

SELECT Customers.name, Customers.Email, Orders.ProductName, Orders.OrderDate
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate = '2023-07-05';


-- Write a query to calculate the average price of all products. 

SELECT ProductName, AVG(Price) AS TotalAgPrice
FROM Products
GROUP BY ProductName
ORDER BY AVG(Price) DESC;



-- Write a query to retrieve the customer names along with the total quantity of products they have ordered. 

SELECT Customers.Name, SUM(Orders.Quantity) AS TotalQuantity
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name;


--  Write a query to retrieve the products that have not been ordered.

SELECT Products.ProductName, Products.Price
FROM Products
LEFT JOIN Orders
    ON Products.ProductName = Orders.ProductName
WHERE Products.ProductID IS NULL;



---------------------------------------------------------------------------------------------------------------Task 2 :-

--Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

SELECT TOP 5 Customers.Name , SUM(Quantity) AS TotalQuantity
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY SUM(Quantity) DESC;



-- Write a query to calculate the average price of products for each product category. 

SELECT ProductName , AVG(Price) AS AvgPrice 
FROM Products 
GROUP BY ProductName;



-- Write a query to retrieve the customers who have not placed any orders.

SELECT Customers.Name , Orders.Productname , Products.Price
FROM Customers
LEFT JOIN  Orders
ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Products
ON Orders.ProductName = Products.ProductName
WHERE Orders.CustomerID  IS NULL;


-- Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'. 

SELECT Orders.OrderID, Orders.ProductName, Orders.Quantity
FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Name LIKE 'M%';


-- Write a query to calculate the total revenue generated from all orders. 


SELECT SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Orders
JOIN Products
ON Orders.ProductName = Products.ProductName;


-- total revenue per customer

SELECT Customers.Name, SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
JOIN Products
ON Orders.ProductName = Products.ProductName
GROUP BY Customers.Name;

-- Write a query to retrieve the customer names along with the total revenue generated from their orders.

SELECT Customers.Name, SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
JOIN Products
ON Orders.ProductName = Products.ProductName
GROUP BY Customers.Name;


-- Write a query to retrieve the customers who have placed at least one order for each product.

SELECT Customers.Name ,COUNT(Orders.OrderID) AS TotalOrdersPlaced
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
HAVING COUNT(Orders.OrderID) >= 1;


-- Write a query to retrieve the top 3 products with the highest average quantity ordered. 

SELECT TOP 3 ProductName, AVG(Quantity) AS AvgQty
FROM Orders
GROUP BY ProductName
ORDER BY AVG(Quantity) DESC;


-- Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.

SELECT ProductName, Quantity
FROM Orders
WHERE Quantity > 
(SELECT AVG(Quantity) 
FROM Orders);



WITH AvgQty AS (
    SELECT AVG(Quantity) AS AvgQuantity
    FROM Orders
)
SELECT 
    100.0 * SUM(CASE WHEN o.Quantity > a.AvgQuantity THEN 1 ELSE 0 END) / COUNT(*) AS PercentageAboveAverage
FROM Orders o
CROSS JOIN AvgQty a;

-- ACCENTURE QUESTION

-- Write a query to fetch the top 3 employees with the highest salaries from an Employees table. 

SELECT TOP 3 FirstName, LastName , AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;


-- USE OF DENSE RANK

SELECT FirstName, LastName ,AnnualIncome, DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK
FROM Customers;



-- Write a Query to Find Customers Who Have Placed More Than 3 Orders

SELECT Customers.Name,COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
HAVING COUNT(Orders.OrderID) > 3;




SELECT *FROM Customers;




SELECT *FROM Customers;
SELECT *FROM Orders;
SELECT *FROM Products;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


