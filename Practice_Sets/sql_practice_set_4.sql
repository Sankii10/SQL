
SELECT *FROM Customers;
SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;
SELECT *FROM Epd;
SELECT *FROM Employees;
SELECT *FROM Managers;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Find duplicate records in a table (Amazon)

--FOR CUSTOMERS TABLE

SELECT FirstName , COUNT(*) AS DuplicatedValues
FROM Customers
GROUP BY FirstName
HAVING COUNT(*) > 1;


-- FOR DUPLICATED SALARY

SELECT AnnualIncome , COUNT(*) AS DuplicatedSalary
FROM Customers
GROUP BY AnnualIncome
HAVING COUNT(*) > 1;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Retrieve the second highest salary from table

-- FOR CUSTOMERS TABLE

SELECT MAX(AnnualIncome) AS SecondHighestIncome
FROM Customers
WHERE AnnualIncome <
(SELECT MAX(AnnualIncome)
FROM Customers);


-- FOR EMPLOYEESSALARY TABLE

SELECT MAX(Salary) AS Secondhighestsalary
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary)
FROM EmployeeSalary);


-- DISPLAY NAME OF EMPLOYEE TOO

SELECT FirstName ,LastName,  AnnualIncome
FROM (SELECT FirstName , LastName, AnnualIncome , DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RANKED_SERIES
WHERE RANK = 2;


-- FOR EMPLOYEES TABLE 
--SECOND HIGHEST DISPLAYING NAME AND OTHER DATA 
SELECT emp_name, department, salary
FROM ( SELECT emp_name, department, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS RANK FROM Employees) AS RANKED_SERIES
WHERE RANK = 2;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Find employees without Manager

--Here we have all managers assigned to the employees so we will update and make one employee with no manager assigned 

UPDATE Employees
SET manager_id = 1
WHERE emp_id = 2;


SELECT *FROM Employees;


-- ON EMPLOYEES 

SELECT *
FROM Employees
WHERE manager_id IS NULL;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Calculate the total Salary per Occupation (PayPal)


--FOR CUSTOMERS TABLE
SELECT Occupation, SUM(AnnualIncome) AS TotalInc
FROM Customers
GROUP BY Occupation
ORDER BY SUM(AnnualIncome) DESC;


-- FOR EMPLOYEESALARY ON PROJECT
SELECT Project, SUM(Salary) AS TotalSalary
FROM EmployeeSalary
GROUP BY Project
ORDER BY SUM(Salary) DESC;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Get the top 3 highest-paid employees (Google)

--FOR CUSTOMER TABLE

SELECT DISTINCT TOP 3 AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC;


-- INCLUDE FirstName, LastName , AnnualIncome

SELECT FirstName, LastName, AnnualIncome
FROM ( SELECT FirstName, LastName , AnnualIncome , DENSE_RANK() OVER (ORDER BY AnnualIncome DESC) AS RANK FROM Customers) AS RANKED_SERIES
WHERE RANK <= 3;


-- FOR EmployeeSalary TABLE

SELECT DISTINCT TOP 3 Salary
FROM EmployeeSalary
ORDER BY Salary DESC;


-- DISPLAY PROJECT ALONG WITH SALARY

SELECT Project, Salary
FROM ( SELECT Project, Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS RANK FROM EmployeeSalary) AS RANKED_SERIES
WHERE RANK <= 3;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Show the count of employees per occupation/project (Meta)


--FOR CUSTOMERS

SELECT Occupation , COUNT(*) AS TotalEmps
FROM Customers
GROUP BY Occupation;


--FOR EMPLOYEESALARY TABLE

SELECT Project, COUNT(*) AS TotalEmp
FROM EmployeeSalary
GROUP BY Project
ORDER BY COUNT(*) DESC;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieve all employees who joined in 2023 (Amazon)

--FOR EMPLOYEEDETAILS TABLE

SELECT FullName,City,DateOfJoining
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2023;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Calculate average value  for educationlevel/project(Microsoft)

-- FOR CUSTOMERS TABLE 

SELECT EducationLevel, AVG(AnnualIncome) AS AvgInc
FROM Customers
GROUP BY EducationLevel
ORDER BY AVG(AnnualIncome) DESC;


-- FOR EMPLOYEESALARY TABLE

SELECT Project , AVG(Salary) AS AvgInc
FROM EmployeeSalary
GROUP BY Project
ORDER BY AVG(Salary) DESC;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Get the latest and oldest joiner in organization (Uber)


-- FOR EMPLOYEEDETAILS TABLE

SELECT MIN(DateOfJoining) AS LATESTJOINER, MAX(DateOfJoining) AS OLDESTJOINER
FROM EmployeeDetails;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Count customers in occupation where customers are more then 5 (Amazon)

SELECT Occupation, COUNT(*) AS NoofCustomers
FROM Customers
GROUP BY Occupation
HAVING COUNT(*) > 5;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--  Retrieve customers with salary above average salary(PayPal)

-- FOR CUSTOMER TABLE

SELECT FirstName, LastName , AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers);


-- FOR EMPLOYEEDETAILS AND EMPLOYEESALARY TABLE

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeDetails.DateOfJoining, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary >
(SELECT AVG(EmployeeSalary.Salary)
FROM EmployeeSalary);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- DISPLAY THE DAY OF EMPLOYEES BEING HIRED

--FOR EMPLOYEEDETAILS TABLE

SELECT FullName, DateOfJoining, DATENAME(WEEKDAY,DateOfJoining) AS Day
FROM EmployeeDetails;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--  Find all employees hired on weekends (Google)

SELECT FullName , DateOfJoining , DATENAME(WEEKDAY, DateOfJoining) AS Day
FROM EmployeeDetails
WHERE DATENAME(WEEKDAY, DateOfJoining)= 'Sunday' OR DATENAME(WEEKDAY, DateOfJoining) = 'Saturday';


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Find all employees with salary between 50000 and 100000 (Microsoft)

--FOR CUSTOMERS TABLE

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome BETWEEN 50000 AND 100000;


-- FOR EMPLOEESALARY TABLE & EMPLOYEEDETAILS TABLE - BETWEEN 7000 AND 10000

SELECT EmployeeDetails.FullName, EmployeeDetails.City, EmployeeSalary.Project, EmployeeSalary.Salary
FROM EmployeeDetails
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Salary BETWEEN 7000 AND 10000;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Get monthly salary (Google)

--ON EMPLOYEESALARY TABLE

SELECT 
    DATENAME(MONTH, EmployeeDetails.DateOfJoining) AS MonthName,
    SUM(EmployeeSalary.Salary) AS TotalSalary
FROM EmployeeDetails
JOIN EmployeeSalary
    ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
GROUP BY DATENAME(MONTH, EmployeeDetails.DateOfJoining),
         MONTH(EmployeeDetails.DateOfJoining)
ORDER BY MONTH(EmployeeDetails.DateOfJoining);



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- . Rank employees by salary within each Occupation (Amazon)

SELECT FirstName, Lastname, Occupation, AnnualIncome , DENSE_RANK() OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RANK
FROM Customers;



-- FOR EMPLOYEESALARY TABLE & EmployeeDetails using joins

SELECT EmployeeDetails.FullName, EmployeeSalary.Project, EmployeeSalary.Salary, DENSE_RANK() OVER (PARTITION BY EmployeeSalary.Project ORDER BY EmployeeSalary.Salary DESC) AS RANK
FROM EmployeeDetails 
JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Find customers monthname  (Meta)

-- FOR CUSTOMER TABLE

SELECT FirstName, LastName, BirthDate,DATENAME(MONTH, BirthDate) AS MonthName
FROM Customers;


-- FOR EMPLOYEEDETAILS AND EMPLOYEESALARY TABLE USING JOINS

SELECT EmployeeDetails.FullName, EmployeeDetails.DateOfJoining, EmployeeSalary.Project , DATENAME(MONTH, EmployeeDetails.DateOfJoining) AS MonthName
FROM EmployeeDetails
JOIN EmployeeSalary 
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- moving average of salary based on DateOfJoining


--FOR CUSTOMER TABLE

SELECT Firstname, LastName, AnnualIncome , AVG(AnnualIncome) OVER (ORDER BY BirthDate ROWS Unbounded Preceding) AS MovingAvgSalary
FROM Customers
ORDER BY BirthDate;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--  Identify the first and last Dateofjoiner (Uber)

SELECT MIN(DateOfJoining) AS OldestDate , MAX(DateOfJoining) AS LatestDate
FROM EmployeeDetails;




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Calculate cumulative revenue by day (Adobe)

-- FOR CUSTOMER TABLE

SELECT FirstName, LastName, AnnualIncome , SUM(AnnualIncome) OVER ( ORDER BY CustomerKey ) AS CumInc
FROM Customers;


-- FOR EMPLOYEESALARY TABLE OVER PROJECT

SELECT Project, Salary, SUM(Salary) OVER (PARTITION BY Project ORDER BY Salary) AS CumInc
FROM EmployeeSalary;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Identify top-performing Occupation by average salary (Google)


SELECT Occupation, AvgInc AS AnnualInc
FROM ( SELECT Occupation, AVG(AnnualIncome) AS AvgInc , DENSE_RANK() OVER (PARTITION BY Occupation ORDER BY AVG(AnnualIncome) DESC) AS RANK FROM Customers GROUP BY Occupation)AS RANKED_SERIES
WHERE RANK = 1;




-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Find the percentage of employees in each department (Uber)

SELECT 
    Occupation, 
    COUNT(*) AS TotalEmps,
    CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Customers) AS DECIMAL(5,2)) AS pct
FROM Customers
GROUP BY Occupation;





------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieve the maximum salary difference within each Occupation (PayPal)

-- CUSTOMER TABLE

SELECT  Occupation, MAX(AnnualIncome) - MIN(AnnualIncome) AS SalaryDiff
FROM Customers
GROUP BY Occupation;





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *FROM Customers;
SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;
SELECT *FROM Epd;
SELECT *FROM Employees;
SELECT *FROM Managers;








------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

