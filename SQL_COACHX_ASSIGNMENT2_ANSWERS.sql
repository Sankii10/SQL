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


SELECT * FROM EmployeeDetails;

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

SELECT * FROM EmployeeSalary;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Basics and Intermediate Questions 

-- Q1)SQL Query to fetch records that are present in one table but not in another table. 

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.EmpId IS NULL;


-- Q2)SQL query to fetch all the employees who are not working on any project. 

SELECT Project, Salary
FROM EmployeeSalary
WHERE Project IS NULL OR Project = ' ';

--OR

SELECT EmployeeDetails.*
FROM EmployeeDetails
LEFT JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId 
WHERE EmployeeSalary.Project IS NULL;


-- Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020. 

SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

-- Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT EmpId, Fullname, City
FROM EmployeeDetails
WHERE EmpId IN (
SELECT EmpId
FROM EmployeeSalary);


-- Q5)Write an SQL query to fetch a project-wise count of employees.

SELECT Project, COUNT(Project) AS ProjectWiseCount
FROM EmployeeSalary
GROUP BY Project;

-- Q6)Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


-- Q7)Write an SQL query to fetch all the Employees who are also managers. 

SELECT DISTINCT EmployeeDetails.FullName, EmployeeDetails.ManagerId , EmployeeDetails.City
FROM EmployeeDetails
WHERE EmployeeDetails.EmpId IN (
SELECT DISTINCT ManagerId
FROM EmployeeDetails);


-- Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT EmpId, FullName, ManagerId, DateOfJoining, City, COUNT(*) AS DuplicateValues 
FROM EmployeeDetails
GROUP BY EmpId, FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;


-- Q9)Write an SQL query to fetch only odd rows from the table.

SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EmpId) AS RowNum
    FROM EmployeeSalary
) AS Temp
WHERE RowNum % 2 = 1;


-- 10)Write a query to find the 3rd highest salary from a table without top or limit keyword. 

SELECT *
FROM ( 
SELECT *, DENSE_RANK() OVER (ORDER BY Salary DESC) AS RANK
FROM EmployeeSalary) AS RankedSalary
WHERE RANK = 3;


--To find top 3 salaries
SELECT TOP 3 Project , Salary
FROM EmployeeSalary
ORDER BY Salary DESC;


--To find Salary no - 12
SELECT *
FROM (
SELECT *, DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank
FROM EmployeeSalary) AS RankedSalary
WHERE Rank = 12;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PART- 2 

-- Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – 986

SELECT EmpId, FullName
FROM EmployeeDetails
WHERE ManagerId = 986;


-- Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.  

SELECT DISTINCT Project 
FROM EmployeeSalary;


-- Ques.3. Write an SQL query to fetch the count of employees working in project P1.

SELECT Project,COUNT(Project) AS Project1
FROM EmployeeSalary
WHERE Project = 'P1'
GROUP BY Project;


-- Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees. 

SELECT MAX(Salary) AS HighestSal, MIN(Salary) AS LowestSal, AVG(Salary) AS AvgSal
FROM EmployeeSalary;

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000. 

SELECT EmpId, Salary
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;


-- Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

SELECT FullName, ManagerId, City
FROM EmployeeDetails
WHERE City = 'Toronto' AND ManagerId = 321;


-- Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321. 

SELECT FullName, ManagerId , City
FROM EmployeeDetails
WHERE City = 'California' OR ManagerId= 321;


-- Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT Project, Salary
FROM EmployeeSalary
WHERE Project <> 'P1';

--OR

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerID, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project <> 'P1';


-- Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT EmployeeDetails.FullName, EmployeeSalary.Salary, EmployeeSalary.Variable, (EmployeeSalary.Salary + EmployeeSalary.Variable) AS TotalSal
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


-- Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.

SELECT Fullname, City
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';


-- TO FIND DUPLICATES
SELECT Project, COUNT(*) AS TotalPro
FROM EmployeeSalary
GROUP BY Project
HAVING COUNT(*) > 1;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PART - 3 


-- USE PRODUCTS DB
-- Fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’

SELECT EmpId
FROM EmployeeDetails
UNION
SELECT EmpId
FROM EmployeeSalary;


-- AND
--We're converting Salary to VARCHAR so it can match FullName's datatype.
SELECT EmpId, FullName 
FROM EmployeeDetails
UNION
SELECT EmpId, CAST(Salary AS VARCHAR) 
FROM EmployeeSalary;


-- Fetch common records between two tables: 

SELECT EmployeeDetails.EmpId, EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
INNER JOIN EmployeeSalary
ON EmployeeDetails.EmpId  = EmployeeSalary.EmpId;


-- Fetch records that are present in one table but not in another table:

SELECT EmployeeDetails.EmpID, EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary IS NULL ;


--  Fetch the EmpIds that are present in both the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’

SELECT EmployeeDetails.EmpId, EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
INNER JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


--  Fetch the employee’s full names and replace the space: 

SELECT FullName, REPLACE(FullName,' ', '_') AS UpdatedFullName
FROM EmployeeDetails


-- Fetch the position of a given character(s) in a field:

SELECT FullName, CHARINDEX('a', FullName) AS NewPos
FROM EmployeeDetails;


-- Display both the EmpId and ManagerId together:

SELECT CONCAT(EmpId, ManagerId) AS Mergdata
FROM EmployeeDetails;


-- Fetch only the first name (string before space) from the FullName column: 

SELECT 
  FullName,
  LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM EmployeeDetails
WHERE CHARINDEX(' ', FullName) > 0;

-- Uppercase the name of the employee and lowercase the city values: 

SELECT UPPER(FullName) AS NewFullName , LOWER(city) AS NewCityName
FROM EmployeeDetails;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PART 4 

-- Find the count of the total occurrences of a particular character – ‘n’ in the FullName field: 

SELECT SUM(LEN(FullName) - LEN(REPLACE(FullName, 'n', ''))) AS TotalCount
FROM EmployeeDetails;


-- Update the employee names by removing leading and trailing spaces: 

SELECT FullName, TRIM(FullName) AS NewTrimmed
FROM EmployeeDetails;


--  Fetch all the employees who are not working on any project:

SELECT EmployeeDetails.EmpId, EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;


--  Fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000: 

SELECT EmployeeDetails.EmpId, EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary >= 5000 AND EmployeeSalary.Salary <= 10000;


-- Find the current date-time: 

SELECT CURRENT_TIMESTAMP AS CurrentDateTime;

-- Fetch all Employee details from the EmployeeDetails table who joined in the Year 2020: 

SELECT FullName, ManagerId,DateOfJoining, City
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

-- OR

SELECT EmployeeDetails.FullName, EmployeeDetails.DateOfJoining, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE YEAR(EmployeeDetails.DateOfJoining) = 2020;


-- Fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table: 

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
INNER JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


-- Fetch the project-wise count of employees sorted by project’s count in descending order: 


SELECT Project, COUNT(*) TotalProject
FROM EmployeeSalary
GROUP BY Project 
ORDER BY COUNT(*) DESC;



SELECT *FROM EmployeeDetails;
SELECT * FROM EmployeeSalary;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------