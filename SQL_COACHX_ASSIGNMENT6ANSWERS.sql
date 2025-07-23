-- Create EmployeeDetail Table and insert records in the table as it is Mentioned in the below image  and Solve questions based upon it 

CREATE TABLE EmployeeDetail ( empid INT PRIMARY KEY, firstname VARCHAR(30), lastname VARCHAR(30), salary INT, joiningdate DATETIME , department INT, gender VARCHAR(8));

-- In the above query we made a mistake of assigning Department INT as it should have been VARCHAR, so we are updating the datattype
ALTER TABLE EmployeeDetail
ALTER COLUMN department VARCHAR(10);

INSERT INTO EmployeeDetail VALUES
(1, 'Vikas', 'Ahlawat', 600000, '2013-12-02 11:16:00', 'IT', 'Male'),
(2, 'Nikita', 'Jain', 530000, '2013-12-02 11:16:00','HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000, '2013-12-02 11:16:00', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000,'2013-02-15 11:16:00', 'HR', 'Male'),
(5, 'Anish', 'Kadian', 500000, '2013-02-16 11:16:00', 'Paroll', 'Male');

SELECT *FROM EmployeeDetail;


-- 1. Write a query to get all employee detail from "EmployeeDetail" table 

SELECT *FROM EmployeeDetail;


-- 2. Write a query to get only "FirstName" column from "EmployeeDetail" table 

SELECT firstname 
FROM EmployeeDetail;


-- 3. Write a query to get FirstName in upper case as "First Name".

SELECT UPPER(firstName) AS updatedfirstName
FROM EmployeeDetail;

-- OR

SELECT UPPER(CONCAT(firstname, ' ', lastname)) AS NewFullName
FROM EmployeeDetail;


-- Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) 
-- i. Select employee detail whose name is "Vikas 
-- ii. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
-- Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' 

SELECT UPPER(CONCAT(firstname, ' ', lastname)) AS NewFullName
FROM EmployeeDetail;


SELECT firstname, lastname
FROM EmployeeDetail
WHERE firstname = 'Vikas';


SELECT *
FROM EmployeeDetail
WHERE firstname LIKE 'a%';


SELECT *
FROM EmployeeDetail
WHERE firstname LIKE '%h';



-- Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' 

SELECT firstname 
FROM EmployeeDetail
WHERE firstname LIKE '[a-p]%';


--  Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'

SELECT firstname 
FROM EmployeeDetail
WHERE firstname NOT LIKE '[a-p]%';


--  Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters

SELECT firstname
FROM EmployeeDetail
WHERE firstname LIKE 'a____';


-- Get  all unique "Department" from EmployeeDetail table 

SELECT DISTINCT department
FROM EmployeeDetail;


-- Get the lowest "Salary" from EmployeeDetail table 

SELECT TOP 1 firstname, lastname, salary
FROM EmployeeDetail
ORDER BY salary ASC;


-- Get the highest "Salary" from EmployeeDetail table. 

SELECT TOP 1 firstname, lastname,salary
FROM EmployeeDetail
ORDER BY salary DESC

--  Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters.

SELECT *
FROM EmployeeDetail
WHERE Gender LIKE '__le';


--  Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters 

SELECT firstname, lastname 
FROM EmployeeDetail
WHERE firstname LIKE 'A____';


--  Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'.

SELECT firstname, lastname
FROM EmployeeDetail
WHERE firstname LIKE '%[%]%';


-- Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT firstname, lastname,FORMAT(joiningdate, 'yyyy/mm/dd') AS Newjoiningdate
FROM EmployeeDetail;


-- Get only Year part of "JoiningDate" 

SELECT firstname, lastname, YEAR(joiningdate) AS yearofjoining
FROM Employeedetail;

--AND

SELECT firstname, lastname, DAY(joiningdate) AS DayOfjoining
FROM EmployeeDetail;



-- Get only Month part of "JoiningDate” 

SELECT firstname, lastname, MONTH(joiningdate) AS DayOfjoining
FROM EmployeeDetail;


-- Get system date

SELECT GETDATE();


-- Get the first name, current date, joiningdate and diff between current date and joining date in months. 

SELECT firstname , GETDATE() AS SysDate, joiningdate, DATEDIFF(MONTH,joiningdate,GETDATE()) AS monthdiff
FROM EmployeeDetail;


-- Get the first name, current date, joiningdate and diff between current date and joining date in days.

SELECT firstname, GETDATE() AS SysDate, joiningdate, DATEDIFF(DAY, joiningdate, GETDATE())AS Daydiff
FROM EmployeeDetail;


--  Get all employee details from EmployeeDetail table whose joining year is 2013 

SELECT firstname, lastname, joiningdate
FROM EmployeeDetail
WHERE YEAR(joiningdate) = 2013;


--  Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT firstname, lastname, joiningdate
FROM EmployeeDetail
WHERE MONTH(joiningdate) = 1;


-- Get how many employee exist in "EmployeeDetail" table

SELECT COUNT(*) AS TotalEmp
FROM EmployeeDetail;


-- Select only one/top 1 record from "EmployeeDetail" table 

SELECT firstname, lastname, joiningdate
FROM EmployeeDetail
WHERE MONTH(joiningdate) = 1;


-- Select all employee detail with First name "Vikas","Ashish", and "Nikhil". 

SELECT firstname, lastname
FROM EmployeeDetail
WHERE firstname IN ('Vikas','Ashish','Nikhil');


-- Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil" 

SELECT firstname, lastname
FROM EmployeeDetail
WHERE firstname NOT IN ('Vikas','Ashish','Nikhil');


-- Select first name from "EmployeeDetail" table after removing white spaces from right side 

SELECT RTRIM(firstname) AS Newfirstname
FROM EmployeeDetail;


-- Select first name from "EmployeeDetail" table after removing white spaces from left side 

SELECT LTRIM(firstname) AS Newfirstname
FROM EmployeeDetail;


-- Display first name and Gender as M/F.(if male then M, if Female then F) 

SELECT firstname, Gender,
CASE
	WHEN gender = 'Male' THEN 'M'
	ELSE 'F'
END AS newgender
FROM EmployeeDetail;

-- ALSO DID FOR THIS SALARY 

SELECT firstname, lastname,salary,
CASE
	WHEN salary > 800000 THEN 'HIGH SALARY'
	WHEN salary BETWEEN 500001 AND 800000 THEN 'MEDIUM SALARY'
	ELSE 'LOW SALARY'
END AS NewSalaryDescription
FROM EmployeeDetail;


-- Select first name from "EmployeeDetail" table prifixed with "Hello"

SELECT CONCAT('HELLO',' ',firstname) AS Newname
FROM EmployeeDetail;


-- Get employee details from "EmployeeDetail" table whose Salary greater than 600000 

SELECT *
FROM EmployeeDetail
WHERE salary > 600000;


-- Get employee details from "EmployeeDetail" table whose Salary less than 700000 

SELECT *
FROM EmployeeDetail
WHERE salary < 700000;


-- Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT *
FROM EmployeeDetail
WHERE salary BETWEEN 500000 AND 600000;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Advanced Queries


-- Create ProjectDetail Table and insert records in the table as it is Mentioned in the below image  and Solve questions based upon it 

SELECT *FROM EmployeeDetail;


CREATE TABLE ProjectDetail (projectid INT PRIMARY KEY, empid INT , projectname VARCHAR(30), FOREIGN KEY (empid) REFERENCES EmployeeDetail(empid));

INSERT INTO ProjectDetail VALUES
(1,1,'Task Track'),
(2,1,'CLP'),
(3,1,'Survey Management'),
(4,2,'HR Management'),
(5,3, 'Task Track'),
(6,3,'GRS'),
(7,3, 'DDS'),
(8,4,'HR Management'),
(9,5, 'GL Management'); 


SELECT *FROM EmployeeDetail;
SELECT *FROM ProjectDetail;



-- Give records of ProjectDetail table 

SELECT *FROM ProjectDetail;


-- Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.

SELECT department, SUM(Salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY department



--  Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary. 

SELECT department, SUM(salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY department
ORDER BY SUM(salary) ASC;



-- Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary 

SELECT department, SUM(salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY department
ORDER BY SUM(salary) DESC;



--  Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table. 

SELECT department, COUNT(department) AS totalDept, SUM(salary) AS newsalary
FROM EmployeeDetail
GROUP BY department;



--  Get department wise average salary from "EmployeeDetail" table order by salary ascending 

SELECT department, AVG(salary) AS AVGSALARY
FROM EmployeeDetail
GROUP BY department
ORDER BY AVG(salary) ASC;


-- . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending

SELECT department, MAX(salary) AS MaxSalary
FROM EmployeeDetail
GROUP BY department
ORDER BY MAX(salary) ASC;


--  Get department wise minimum salary from "EmployeeDetail" table order by salary ascending. 

SELECT department, MIN(salary) AS MINSALARY
FROM EmployeeDetail
GROUP BY department
ORDER BY MIN(salary) ASC;



-- Join both the table that is Employee and ProjectDetail based on some common paramter 

SELECT EmployeeDetail.firstname, EmployeeDetail.lastname, EmployeeDetail.salary, EmployeeDetail.department, ProjectDetail.projectname
FROM EmployeeDetail
JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid;


-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already. 

SELECT EmployeeDetail.firstname, EmployeeDetail.lastname, ProjectDetail.projectname
FROM EmployeeDetail
JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid
ORDER BY EmployeeDetail.firstname;


-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.

SELECT EmployeeDetail.firstname, EmployeeDetail.lastname, ProjectDetail.projectname
FROM EmployeeDetail
LEFT JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid
ORDER BY EmployeeDetail.firstname;



-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned" 

SELECT EmployeeDetail.firstname, EmployeeDetail.lastname, 
ISNULL(ProjectDetail.projectname, '-NO Project Assigned') AS Projdetail
FROM EmployeeDetail
LEFT JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid
ORDER BY EmployeeDetail.firstname;



-- Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail 

SELECT EmployeeDetail.firstname, EmployeeDetail.lastname, ProjectDetail.projectname
FROM EmployeeDetail
RIGHT JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid
ORDER BY EmployeeDetail.firstname;



-- Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL 

SELECT EmployeeDetail.firstname, EmployeeDetail.lastname, ProjectDetail.projectname
FROM EmployeeDetail
FULL OUTER JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid;


-- Write down the query to fetch EmployeeName & Project who has assign more than one project


SELECT 
    CONCAT(firstname, ' ', lastname) AS EmployeeName,
    COUNT(ProjectDetail.projectname) AS TotalProjects
FROM EmployeeDetail
JOIN ProjectDetail
ON EmployeeDetail.empid = ProjectDetail.empid
GROUP BY EmployeeDetail.empid, firstname, lastname
HAVING COUNT(ProjectDetail.projectname) > 1;


-- Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName 

SELECT 
    EmployeeDetail.firstname + ' ' + EmployeeDetail.lastname AS EmployeeName,
    ProjectDetail.projectname
FROM ProjectDetail
JOIN EmployeeDetail ON EmployeeDetail.empid = ProjectDetail.empid
WHERE ProjectDetail.projectname IN (
    SELECT projectname
    FROM ProjectDetail
    GROUP BY projectname
    HAVING COUNT(DISTINCT empid) > 1
)
ORDER BY ProjectDetail.projectname, EmployeeDetail.firstname;







-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

