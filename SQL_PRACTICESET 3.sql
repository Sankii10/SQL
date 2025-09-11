USE Advance;


-- Create Managers Table (Master Table)
CREATE TABLE Managers (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(50),
    department VARCHAR(50) UNIQUE,
    annual_income DECIMAL(10,2)
);

-- Create Employees Table (Child Table)
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
);

-- Insert Sample Managers
INSERT INTO Managers (manager_id, manager_name, department, annual_income) VALUES
(1, 'Vikram Mehta', 'IT', 48000.00),
(2, 'Rohit Malhotra', 'Finance', 65000.00),
(3, 'Kavita Joshi', 'Marketing', 75000.00),
(4, 'Anil Kumar', 'HR', 40000.00);

-- Insert Sample Employees
INSERT INTO Employees (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Rahul Sharma', 'IT', 50000.00, 1),
(2, 'Neha Verma', 'Finance', 60000.00, 2),
(3, 'Amit Singh', 'HR', 45000.00, 4),
(4, 'Priya Gupta', 'Marketing', 70000.00, 3),
(5, 'Sanjay Patel', 'IT', 55000.00, 1);


SELECT *FROM Customers;
SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;
SELECT *FROM Epd;
SELECT *FROM Employees;
SELECT *FROM Managers;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Find the second highest salary from the Employee table

--ON CUSTOMER TABLE

SELECT MAX(AnnualIncome) AS SecondHighestInc
FROM Customers
WHERE AnnualIncome < 
(SELECT MAX(AnnualIncome)
FROM Customers);


-- FROM EMPLOYEE SALARY TABLE

SELECT MAX(Salary) AS SecondHighestSalary
FROM EmployeeSalary
WHERE Salary < 
(SELECT MAX(Salary)
FROM EmployeeSalary);


-- Find duplicate records in a table.

--FOR CUSTOMERS TABLE

SELECT FirstName , COUNT(*) AS DuplicatedValues
FROM Customers
GROUP BY FirstName
HAVING COUNT(*) > 1;


-- FOR EMPLOYEEDETAILS TABLE

SELECT FullName , COUNT(*) AS TotalDuplicates
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1;



--  Retrieve employees who earn more than their manager.

SELECT Employees.emp_name, Employees.salary, Managers.manager_name, Managers.annual_income 
FROM Employees
JOIN Managers
ON Employees.manager_id = Managers.manager_id
WHERE Employees.salary > Managers.annual_income;



-- Count employees in each Project/ Occupation having more than 5 employees. 

--FOR EMPLOYEE SALARY TABLE

SELECT Project, COUNT(*) AS TotalEmps
FROM EmployeeSalary
GROUP BY Project
HAVING COUNT(*) > 5;


-- FOR CUSTOMER TABLE

SELECT Occupation, COUNT(*) AS TotalEmps
FROM Customers
GROUP BY Occupation 
HAVING COUNT(*) > 5;


-- Find employees who joined in the last 36 months. 

-- ON EmployeeDetails

SELECT FullName, DateOfJoining , DATEDIFF(MONTH, DateOfJoining , GETDATE()) AS NoOfMonths
FROM EmployeeDetails ;


SELECT FullName, DateOfJoining , DATEDIFF(MONTH, DateOfjoining , GETDATE()) AS NoOfMonths
FROM EmployeeDetails
WHERE DATEDIFF(MONTH, DateOfJoining , GETDATE()) > 36;


--  Get Project with no employees.

--FOR EMPLOYEE SALARY TABLE

SELECT EmployeeDetails.FullName, EmployeeSalary.Project
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId  = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;



-- Write an SQL query to calculate the total annual income for each occupation from the Customers table and display the results in descending order of total income.”

SELECT Occupation, SUM(AnnualIncome) AS TotalInc
FROM Customers
GROUP BY Occupation 
ORDER BY SUM(AnnualIncome) DESC;

-- Running total of salaries by department. 

SELECT Occupation, AnnualIncome, SUM(AnnualIncome) OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS RunningTotal
FROM Customers;



--  Calculate cumulative distribution (CDF) of salaries.

-- FOR CUSTOMER TABLE
SELECT FirstName, AnnualIncome , CUME_DIST() OVER (ORDER BY AnnualIncome DESC) AS CDF
FROM Customers;

-- FOR EMPLOYEE SALARY TABLE

SELECT Project, Salary, CUME_DIST() OVER (ORDER BY Salary DESC) AS CDF
FROM EmployeeSalary;



-- Compare two tables and find rows with differences in any column (all columns). 

SELECT Employees.emp_name, Employees.department, Managers.manager_name, Managers.department 
FROM Employees
FULL OUTER JOIN Managers
ON Employees.manager_id = Managers.manager_id
WHERE Employees.emp_name IS DISTINCT FROM Managers.manager_name 
OR Employees.department IS DISTINCT FROM Managers.department 
OR Employees.salary IS DISTINCT FROM Managers.annual_income ;



-- Write a query to rank employees based on salary with ties handled properly.

--FOR CUSTOMER TABLE

SELECT Firstname, LastName, AnnualIncome , DENSE_RANK() OVER ( ORDER BY AnnualIncome DESC) AS Rank
FROM Customers;


-- FOR EMPLOYEE SALARY TABLE

SELECT Project ,Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) 
FROM EmployeeSalary;



--  Write a query to perform a conditional aggregation (count males and females in each Occupation).

SELECT Occupation , COUNT(CASE WHEN Gender = 'M' THEN 1 END) AS Male_Count , COUNT(CASE WHEN Gender = 'F' THEN 1 END) AS Female_Count
FROM Customers
GROUP BY Occupation;


-- Write a query to calculate the difference between current row and previous row's salary (lag function). 

--FOR CUSTOMER TABLE
SELECT FirstName, LastName, AnnualIncome - LAG(AnnualIncome) OVER (ORDER BY CustomerKey) AS salary_diff
FROM Customers;


--FOR EmployeeSalary

SELECT Project, Salary, Salary - LAG(Salary) OVER (ORDER BY EmpId) AS Salary_diff
FROM EmployeeSalary;



--  Write a query to find employees with salary greater than average salary in the entire company, ordered by salary descending. 

--FOR CUSTOMER TABLE

SELECT FirstName, LastName, AnnualIncome
FROM Customers
WHERE AnnualIncome > 
(SELECT AVG(AnnualIncome)
FROM Customers)
ORDER BY AnnualIncome DESC;


-- FOR EmployeeSalary Table

SELECT Project, Salary
FROM EmployeeSalary
WHERE Salary >
(SELECT AVG(Salary)
FROM EmployeeSalary)
ORDER BY Salary DESC;



--  Find employees who have the same salary as their manager. 

SELECT Employees.emp_name, Employees.salary, Managers.manager_name , Managers.annual_income
FROM Employees 
JOIN Managers
ON Employees.manager_id = Managers.manager_id 
WHERE Employees.salary = Managers.annual_income;



-- Write a query to get the first and last Date of joining .
-- ON EMPLOYEE DETAILS TABLE

SELECT 
    MIN(DateOfJoining) AS First_Join_Date,
    MAX(DateOfJoining) AS Last_Join_Date
FROM EmployeeDetails;


-- "Write a query to display each employee’s name along with their earliest and latest Date of Joining (in case they have multiple joining records in the EmployeeDetails table)."

SELECT FullName, MIN(DateOfJoining) AS New_Joiner, MAX(DateOfJoining) AS Old_employee
FROM EmployeeDetails
GROUP BY FullName;


-- Find Occupation with the highest average salary. 

SELECT TOP 1 Occupation , AVG(AnnualIncome) As AvgInc
FROM Customers
GROUP BY Occupation
ORDER BY AVG(AnnualIncome) DESC;



-- Write a query to find the number of employees in each job Occupation.

SELECT Occupation , COUNT(*) AS Totalemps
FROM Customers
GROUP BY Occupation ;


--  Find employees who don’t have a Project assigned. 

SELECT EmployeeDetails.FullName, EmployeeDetails.ManagerId, EmployeeSalary.Project
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.EmpId = EmployeeSalary.EmpId
WHERE EmployeeSalary.Project IS NULL;





--  Retrieve the last 5 salary for each customer.

SELECT TOP 5 FirstName, LastName, Occupation, EducationLevel , AnnualIncome
FROM Customers
ORDER BY AnnualIncome ASC;

--USING DENSE RANK

SELECT FirstName, LastName, Occupation , EducationLevel, AnnualIncome 
FROM ( SELECT FirstName, Lastname, Occupation, EducationLevel, AnnualIncome, DENSE_RANK() OVER (ORDER BY AnnualIncome ) AS RANK FROM Customers) AS RankedSeries
WHERE RANK <= 5;


-- Find the department with the lowest average salary. 

SELECT TOP 1 Occupation , AVG(AnnualIncome) AS AvgInc
FROM Customers
GROUP BY Occupation
ORDER BY AVG(AnnualIncome) ASC;



--  List employees whose names start and end with the same letter.

--ON CUSTOMERS TABLE

SELECT FirstName, LastName
FROM Customers
WHERE LEFT(FirstName, 1) = RIGHT(FirstName, 1);


-- FOR EMPLOYEEDETAILS TABLE

SELECT FullName
FROM EmployeeDetails
WHERE LEFT(FullName, 1) = RIGHT(FullName, 1);



--  Find the Occupation-wise salary percentile (e.g., 90th percentile) using window functions.

SELECT Occupation, PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY AnnualIncome) OVER ( PARTITION BY Occupation) AS Percentile90
FROM Customers
ORDER BY Occupation;


-- FOR EmployeeSalary

SELECT Project, PERCENTILE_CONT(0.8) WITHIN GROUP ( ORDER BY Salary) OVER (PARTITION BY Project) AS Pecent80
FROM EmployeeSalary;


-- ON Managers Table

SELECT department , PERCENTILE_CONT(0.8) WITHIN GROUP ( ORDER BY annual_income) OVER (PARTITION BY department) AS Percent80
FROM Managers;






--  Find manager who have multiple employees.

SELECT Managers.manager_name , COUNT(*) AS TotalEmps
FROM Employees
JOIN Managers
ON Employees.manager_id = Managers.manager_id
GROUP BY Managers.manager_name
HAVING COUNT(*) > 1;


-- Use window function to find the difference between current row’s salary and previous row’s salary partitioned by Project. 

--EMPLOYEESALARY TABLE

SELECT Project, Salary - LAG(Salary) OVER (ORDER BY EmpId) AS SalaryDiff
FROM EmployeeSalary;



-- Get employees with salary in the top 10% in their Occupation.

SELECT FirstName, LastName, Occupation, AnnualIncome
FROM (
    SELECT *,
           NTILE(10) OVER (PARTITION BY Occupation ORDER BY AnnualIncome DESC) AS decile
    FROM Customers
) AS sub
WHERE decile = 1
ORDER BY Occupation, AnnualIncome DESC;









SELECT *FROM Customers;
SELECT *FROM EmployeeDetails;
SELECT *FROM EmployeeSalary;
SELECT *FROM Epd;
SELECT *FROM Employees;
SELECT *FROM Managers;







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


