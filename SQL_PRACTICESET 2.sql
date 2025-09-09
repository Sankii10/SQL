CREATE DATABASE Advance;

USE Advance;


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


--- THE FOLLOWING TABLES CAN BE USED FOR JOINS AND OTHER NECESSARY OPTIONS 

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


-- Create EmployeeDetails table
CREATE TABLE Epd (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(100),
    ManagerId INT NULL,
    DateOfJoining DATE
);

-- Insert sample data
INSERT INTO Epd (EmpId, FullName, ManagerId, DateOfJoining) VALUES
(101, 'Alice Smith', 201, '2022-03-15'),
(102, 'Bob Johnson', 202, '2021-07-10'),
(103, 'Carol Davis', 201, '2022-03-22'),
(201, 'Daniel White', NULL, '2022-03-05'),
(202, 'Emma Brown', NULL, '2021-07-01'),
(104, 'Frank Miller', 202, '2021-08-11'),
(105, 'Grace Lee', 201, '2022-03-08'),
(106, 'Henry Adams', 202, '2021-07-20');

SELECT *FROM Epd;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- How to retrieve the second-highest salary of an employee? 

SELECT MAX(AnnualIncome) AS SecondhighestSalary
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome)
FROM Customers);


-- How to get the maximum highest income 

SELECT MAX(AnnualINcome) AS HighestAnnualIncome
FROM Customers;


-- How to get the rank of employees based on AnnualIncome

SELECT FirstName, LastName, AnnualIncome , DENSE_RANK() OVER ( ORDER BY AnnualIncome DESC) AS Rank
FROM Customers;


-- How to get the nth highest salary in (eg 5th highest)? 

SELECT AnnualIncome 
FROM ( SELECT AnnualIncome , DENSE_RANK() OVER ( ORDER BY AnnualIncome DESC) AS RANK
FROM Customers) AS RankedSeries
WHERE RANK = 5;


-- COUNT HOW MANY EMPLOYEES ARE THEIR HAVING SAME SALARY AT RANK 5

WITH Ranked AS
(SELECT AnnualIncome , DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK
FROM Customers) 
SELECT COUNT(*) AS NumCustomers
FROM Ranked
WHERE RANK = 5;



--  How do you fetch all employees whose salary is greater than the average salary? 

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
( SELECT AVG(AnnualIncome) 
FROM Customers);



-- . Write a query to display the current date and time in .

SELECT GETDATE() AS CurrentDate;

SELECT CURRENT_TIMESTAMP AS CurrentTimeDate;


--  How to find duplicate records in a table?

SELECT EmailAddress, COUNT(*) AS DuplicatedRecords
FROM Customers
GROUP BY EmailAddress
HAVING COUNT(*) > 1;

-- DUPLICATE ROWS USING SALARY

SELECT AnnualIncome , COUNT(*) AS DuplicateSalary
FROM Customers
GROUP BY AnnualIncome
HAVING COUNT(*) > 1;


--  How can you delete duplicate rows in  ?

WITH CTE AS (
    SELECT CustomerKey,
           ROW_NUMBER() OVER (
               PARTITION BY FirstName, LastName, EmailAddress 
               ORDER BY CustomerKey
           ) AS row_num
    FROM Customers
)
DELETE FROM CTE
WHERE row_num > 1;


-- . How to get the common records from two tables?

SELECT *
FROM EmployeeDetails
INTERSECT
SELECT *
FROM EmployeeDetails;


--  How to retrieve the last 10 records from a table?


SELECT TOP 10 FirstName, Lastname, AnnualIncome
FROM Customers
ORDER BY CustomerKey DESC;


--  How do you fetch the top 5 employees with the highest salaries?

SELECT TOP 5 Firstname, LastName, AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;


-- USING JOINS ON EMPLOYEE DETAILS AND EMPLOYEE SALARY 

SELECT TOP 5 EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
ORDER BY EmployeeSalary.Salary DESC;


--USE RANK HERE 

SELECT TOP 5 EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary, DENSE_RANK() OVER (ORDER BY EmployeeSalary.Salary DESC) AS RANK
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
ORDER BY EmployeeSalary.Salary DESC;


--  How to calculate the total salary of all employees?

SELECT SUM(AnnualIncome) AS TotalSalary
FROM Customers;


-- How to write a query to find all employees who joined in the year 2020?

SELECT FullName, DateOfJoining
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;


-- Write a query to find employees whose name starts with 'A'

SELECT FirstName, LastName
FROM Customers
WHERE FirstName LIKE 'A%';


-- . How can you find the employees who do not have a manager? 

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeDetails.ManagerId IS NULL;



--  How to find the project/ Managerid with the highest number of employees? 

SELECT TOP 1 Project, COUNT(*) AS Totalemployees
FROM EmployeeSalary
GROUP BY Project;


-- ow to get the count of employees in each for MangersId 

SELECT ManagerId, COUNT(*) AS TotalReportEmployee
FROM EmployeeDetails
GROUP BY ManagerId;


--  Write a query to fetch employees having the highest salary in each Project. 

SELECT Project, MAX(Salary) AS HighestSalary
FROM EmployeeSalary
GROUP BY Project 
ORDER BY MAX(Salary) DESC;


-- USING JOINS

SELECT EmployeeSalary.Project, MAX(EmployeeSalary.Salary) AS MaxSalary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId  = EmployeeSalary.EmpId
GROUP BY EmployeeSalary.Project
ORDER BY MAX(EmployeeSalary.Salary) DESC;



--	How to write a query to update the salary of all employees by 10%? 

UPDATE Customers
SET AnnualIncome = AnnualIncome * 1.10;

SELECT *FROM Customers;


--  How can you find employees whose salary is between 50,000 and 1,00,000?

SELECT Firstname, LastName , AnnualIncome
FROM Customers
WHERE AnnualIncome BETWEEN 50000 AND 100000;



--  How to find the youngest employee in the organization? 

SELECT MAX(BirthDate) AS YoungestEmp
FROM Customers;

--OR

SELECT MAX(BirthDate)
FROM (SELECT FirstName, LastName, Birthdate
FROM Customers) AS Youngemp;


-- How to fetch the first and last record from a table?

SELECT * FROM (SELECT TOP 1 * FROM Customers ORDER BY CustomerKey ASC) AS FirstRow
UNION ALL
SELECT * FROM (SELECT TOP 1 * FROM Customers ORDER BY CustomerKey DESC) AS LastRow;




--  Write a query to find all employees who report to a specific manager.

SELECT FullName , ManagerId
FROM EmployeeDetails
WHERE ManagerId = 321;


-- USING JOINS

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeDetails.ManagerId = 321;



-- How can you find the total number of Projects in the company? 

SELECT COUNT(DISTINCT Project) AS TotalProject
FROM EmployeeSalary;


--OR
SELECT Project ,COUNT(*) AS TotalProject
FROM EmployeeSalary
GROUP BY Project;


--  How to find the Occupation with the lowest average salary?

SELECT TOP 1 Occupation, MIN(AnnualIncome) AS LowestSalary
FROM Customers
GROUP BY Occupation
ORDER BY MIN(AnnualIncome);


--  How to delete all employees from a Occupation in one query?

DELETE FROM Customers
WHERE Occupation = 'Bachelors';


--  How to display No of years the employee is working in organisation ?

SELECT FullName, DateOfJoining , DATEDIFF(YEAR, DateOfjoining, GETDATE()) AS NoofYears
FROM EmployeeDetails;


-- How to display all employees who have been in the company for more than 5 years?

SELECT FullName, DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS NoOfyears
FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfJoining, GETDATE()) > 5;


-- GET THE MONTH NAME OF DATE OF JONING ?

SELECT FullName, DateOfJoining, DATENAME(MONTH, DateOfJoining) AS MonthName
FROM EmployeeDetails;


--  How to find the second-largest Salary from a table? 
--ON EMPLOYEESALARY TABLE
SELECT MAX(Salary) AS SecondLargestSalary
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary)
FROM EmployeeSalary);

-- ON CUSTOMERS TABLE

SELECT MAX(AnnualIncome) AS SecondhighestInc
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome) 
FROM Customers);


-- How to write a query to remove all records from a table but keep the table structure? 

TRUNCATE TABLE Customers;


--  Write a query to get all employee records in XML format.

SELECT FirstName, LastName , AnnualIncome 
FROM Customers
FOR XML AUTO;



-- How to get the current month’s name from ?
-- ON Customers TABLE

SELECT FirstName, LastName, BirthDate, DATENAME(MONTH, BirthDate) AS MonthName
FROM CUstomers;



-- How to convert a string to lowercase in ?
--ON CustomersTable

SELECT LOWER(FirstName) AS LowerCase
FROM Customers;



--  How to find all Managers who do not have any subordinates?

SELECT *
FROM EmployeeDetails
WHERE EmpId NOT IN ( SELECT ManagerId FROM EmployeeDetails WHERE ManagerID IS NOT NULL);


-- Write a query to calculate the total AnnualIncome per Occupation in a Customers table.

SELECT Occupation, SUM(AnnualIncome) AS TotalIncome
FROM Customers
GROUP BY Occupation;

-- IF WE WANT IT IN DESCENDING ORDER

SELECT Occupation, SUM(AnnualIncome) AS TotalIncome 
FROM Customers
GROUP BY Occupation
ORDER BY SUM(AnnualIncome) DESC;



--  How to write a query to check if a table is empty?

SELECT CASE
	WHEN EXISTS(SELECT 1 FROM Customers)
	THEN 'Not Empty'
	ELSE 'Empty'
END;


--  How to find the second highest salary for each Occupation?

SELECT DISTINCT Occupation, AnnualIncome
FROM ( SELECT Occupation, AnnualIncome , DENSE_RANK() OVER ( PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RankedSeries
WHERE RANK = 2;


-- Write a query to fetch employees whose salary is a multiple of 10000. 

SELECT *
FROM Customers
WHERE AnnualIncome % 10000 = 0;


-- How to fetch records where a column has null values? 

SELECT Project, Salary
FROM EmployeeSalary
WHERE Project IS NULL;

-- USING JOINS
SELECT EmployeeDetails.FullName, EmployeeDetails.City, EMployeeSalary.Project
FROM EmployeeDetails
FULL OUTER JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


--  How to write a query to find the total number of employees in each Occupation?

SELECT Occupation, COUNT(*) AS TotalEmps
FROM Customers
GROUP BY Occupation;


-- Total employees in project 

SELECT Project, COUNT(*) AS TotalEmps
FROM EmployeeSalary
GROUP BY Project;



-- Write a query to fetch all employees whose names end with ‘n’ OR 'N'. 

--ON CUSTOMERS TABLE
SELECT FirstName, LastName 
FROM Customers
WHERE FirstName LIKE '%[Nn]';


-- ON EmployeeDetails TABLE

SELECT FullName
FROM EmployeeDetails
WHERE FullName LIKE '%[Nn]';





-- How to find all employees who work in both Project P1 and P2?

SELECT EmployeeDetails.FullName, EmployeeSalary.Project
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId  = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IN ('P1','P2')
GROUP BY EmployeeDetails.FullName, EMployeeSalary.Project
HAVING COUNT(DISTINCT EmployeeSalary.Project) = 2;




-- Write a query to fetch the details of employees with the same salary.

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome IN (
SELECT AnnualIncome
FROM Customers
GROUP BY AnnualIncome
HAVING COUNT(*) > 1);





--  How to update salaries of employees based on their Occupation?

UPDATE Customers
SET AnnualIncome = AnnualIncome * 1.10 
WHERE Occupation = 'Professional';


--OR 
--FOR EVERY OCCUPATION

SELECT DISTINCT Occupation
FROM Customers;

UPDATE Customers
SET AnnualIncome = CASE
    WHEN Occupation = 'Clerical' THEN AnnualIncome * 1.05
    WHEN Occupation = 'Management' THEN AnnualIncome * 1.10
    WHEN Occupation = 'Professional' THEN AnnualIncome * 1.15
    ELSE AnnualIncome * 1.07
END;


--  How to write a query to list all employees without a Project?

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;



-- Write a query to find the maximum salary and minimum salary in each Occupation.

SELECT Occupation , MIN(AnnualIncome) AS LowestInc , MAX(AnnualIncome) AS HighestInc
FROM Customers
GROUP BY Occupation;


-- . How to list all employees hired in the last 36 months?

SELECT FullName, DateOfJoining , DATEDIFF(MONTH, DateOfJoining, GETDATE()) AS NoofMonths
FROM EmployeeDetails
WHERE DATEDIFF(MONTH, DateOfJoining, GETDATE()) < 36;


-- How to list all employees hired in previous 4 years ?

SELECT FullName, DateOfJoining , DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS NoOfyears
FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfJoining, GETDATE()) < 4;



--  Write a query to display Project-wise total and average salary. 

-- EMPLOYEESALARY TABLE

SELECT Project, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary
FROM EmployeeSalary
GROUP BY Project;


-- CUSTOMER TABLE

SELECT Occupation, SUM(AnnualIncome) AS TotalInc, AVG(AnnualIncome) AS AvgInc
FROM Customers
GROUP BY Occupation;



-- How to find employees who joined the company in the same month and year as their manager?


SELECT Epd.FullName, Epd.DateOfjoining , EmployeeDetails.ManagerId , EmployeeDetails.DateOfJoining
FROM Epd
JOIN EmployeeDetails
ON Epd.EmpId = EmployeeDetails.ManagerId
WHERE YEAR(Epd.DateOfJoining) = YEAR(EmployeeDetails.DateOfJoining) AND MONTH(Epd.DateOfJoining) = MONTH(EmployeeDetails.DateOfJoining);



--  Write a query to count the number of employees whose names start and end with the same letter.

SELECT COUNT(*) AS HAveSameName
FROM Customers
WHERE LEFT(FirstName, 1) = RIGHT(FirstName, 1);


-- AND NOW ALSO DISPLAY THE NAME

SELECT Firstname, COUNT(*) AS SameStartAndEnd
FROM Customers
WHERE LEFT(FirstName, 1) = RIGHT(FirstName, 1) 
GROUP BY FirstName;


--  How to retrieve employee names and salaries in a single string?

-- CUSTOMER TABLE

SELECT CONCAT(FirstName ,LastName, '-' ,AnnualIncome) AS NewData
FROM Customers;


-- Write a query to get employees who belong to Project with less than 4 employees.

SELECT Project, COUNT(*) AS Totalemp
FROM EmployeeSalary
GROUP BY Project
HAVING COUNT(*) < 4;


--USING JOINS

SELECT EmployeeDetails.FullName, EmployeeSalary.Project 
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IN (
SELECT EmployeeSalary.Project
FROM EmployeeSalary
GROUP BY EmployeeSalary.Project
HAVING COUNT(*) < 4);


--  How to write a query to find employees with the same first name?

SELECT Firstname 
FROM Customers
WHERE Firstname IN (
SELECT FirstName
FROM Customers
GROUP BY FirstName
HAVING COUNT(*) > 1);


-- How to write a query to delete employees who have been in the company for more than 3 years? 

SELECT FullName, DateOfJoining, DATEDIFF(YEAR,DateOfJoining, GETDATE()) AS NofoYears
FROM EmployeeDetails;


DELETE FROM EmployeeDetails
WHERE DATEDIFF(YEAR, DateOfjoining, GETDATE()) > 3;



--  Write a query to list all employees working under the same Project.

SELECT EmployeeDetails.FullName , EmployeeDetails.ManagerId, EmployeeSalary.Project
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project  = 'P1';


-- How to find the top 3 highest-paid employees in each Occupation?

SELECT Occupation, AnnualIncome
FROM (
    SELECT 
        Occupation, 
        AnnualIncome, 
        DENSE_RANK() OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RankNo
    FROM Customers
) AS RankedSeries
WHERE RankNo <= 3;


-- Write a SQL query to find the top 3 occupations with the highest maximum salary, and assign a rank based on the maximum salary in descending order.

SELECT Occupation,MAX(AnnualIncome) AS highestInc, DENSE_RANK() OVER (ORDER BY MAX(Annualincome) DESC) AS RANK
FROM Customers
GROUP BY Occupation;


-- Write a query to display employees grouped by their age brackets (e.g., 20-30, 31-40, etc.).

SELECT FirstName ,LastName,BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Customers;

SELECT FirstName, LastName, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age,
CASE 
	WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 20 AND 30 THEN '20-30'
	WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
	WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
	ELSE '50+'
END AS AgeBrackets
FROM Customers;


--  How to list all employees in Project that have not hired anyone in the past 2 years? 

SELECT EmployeeDetails.FullName, EmployeeDetails.DateOfJoining, EmployeeSalary.Project
FROM EmployeeDetails
JOIN EmployeeSalary 
    ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IN (
    SELECT EmployeeSalary.Project
    FROM EmployeeSalary
    JOIN EmployeeDetails 
        ON EmployeeSalary.EmpId = EmployeeDetails.EmpId
    GROUP BY EmployeeSalary.Project
    HAVING MAX(EmployeeDetails.DateOfJoining) < DATEADD(YEAR, -2, GETDATE())
);



--  Write a query to find all employees who earn more than the average salary.

SELECT FirstName,Lastname, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers);


-- SECOND HIGHEST SALARY

SELECT MAX(AnnualIncome) AS SecondHighestSalary
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome) 
FROM Customers);


--Write a query to find all customers whose annual income is greater than the average annual income of customers with the occupation 'Professional'.


SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome) 
FROM Customers
WHERE Occupation = 'Professional');


-- Write a query to find all employees who earn more than the average salary of the occupation.

SELECT FirstName, LastName, Occupation, AnnualIncome
FROM Customers C1
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers C2
WHERE C2.Occupation = C1.Occupation);


-- How to list all Project who have more than 6 subordinates?

SELECT Project , COUNT(*) AS TotalEmps
FROM EmployeeSalary
GROUP BY Project
HAVING COUNT(*) > 6;


-- APPLIED THE SAME QUESTION ON CUSTOMER TABLE(FOR OCCUPATION)

SELECT Occupation, COUNT(*) AS TotalEmps
FROM Customers
GROUP BY Occupation
HAVING COUNT(*) > 6;



-- . Write a query to display employee names and hire dates in the format "Name - MM/DD/YYYY".

-- ON EMPLOYEEDETAILS TABLE
SELECT CONCAT(FullName, ' - ', FORMAT(DateOfJoining, 'MM/dd/yyyy')) AS NewformData
FROM EmployeeDetails;


-- ON CUSTOMERS TABLE
SELECT CONCAT(FirstName, ' - ', FORMAT(BirthDate, 'MM/dd/yyyy')) AS NewData
FROM Customers;


--  How to find employees whose salary is in the top 10%?

WITH Percentile AS (
    SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY AnnualIncome) 
           OVER () AS P90
    FROM Customers
)SELECT *
FROM Customers
WHERE AnnualIncome > (SELECT TOP 1 P90 FROM Percentile);



--  How to find the average salary of the top 5 highest-paid employees in each Occupation?

-- Find the average salary of the top 5 highest-paid employees in each Occupation

SELECT Occupation, AVG(AnnualIncome) AS AvgInc
FROM (
    SELECT Occupation, AnnualIncome,
           DENSE_RANK() OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RANK
    FROM Customers
) AS RANKED_SERIES
WHERE RANK <= 5
GROUP BY Occupation;


-- Write a query to display employees grouped by their age brackets (e.g.,20-30, 31-40, etc.). 

--ON CUSTOMER TABLE
SELECT FirstName, LastName, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age,
CASE
	WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) < 19 THEN '-19'
	WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 20 AND 30 THEN '20-30'
	WHEN DATEDIFF(YEAR,BirthDate, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
	ELSE '50+'
END AS AgeBrackets
FROM Customers;

-- ON EMPLOYEEDETAILS TABLE

SELECT FullName, DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS NoOfyears
FROM EmployeeDetails;



--  Write a query to find all employees whose email contains the domain '@gmail.com'. 

SELECT FirstName, LastName, EmailAddress
FROM Customers
WHERE EmailAddress LIKE '%@gmail.com';


--  Write a query to display the hire date and day of the week for each employee.

--FOR MONTHS
SELECT FullName, DateOfJoining , DATENAME(MONTH, DateOfJoining) AS MonthName 
FROM EmployeeDetails;


-- FOR WEEKDAY
SELECT FullName, DateOfJoining, DATENAME(WEEKDAY, DateOfJoining) AS WeekDay
FROM EmployeeDetails;


--  How to find all employees who are older than 30 years?

SELECT FirstName, LastName , BirthDate , DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Customers;


-- OLDER THEN 30 Years

SELECT FirstName, LastName , BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Customers
WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) > 30;


--USING RANK ON IT

SELECT FirstName, LastName, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age, DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK
FROM Customers;



-- . Write a query to display employees grouped by their salary range (e.g., 0- 20K, 20K-50K). 

SELECT FirstName, LastName, AnnualIncome, 
CASE 
	WHEN AnnualIncome BETWEEN 0 AND 20000 THEN '0-20K'
	WHEN AnnualIncome BETWEEN 20000 AND 50000 THEN '20K-50K'
	WHEN AnnualIncome BETWEEN 50000 AND 70000 THEN '50K-70K'
	ELSE '70K +'
END AS IncBracket
FROM Customers;


SELECT *FROM Epd;
SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;
SELECT *FROM Customers;





-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


