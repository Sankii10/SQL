-- (University DataBase Management System)

-- University Database  Management System is one of the Fundamental and Intermediate level SQL project

-- Task 1:- 

-- 1.Create University Database give any University name you want

CREATE DATABASE university;

USE university;


-- Under this University Create four tables and each table should have following three Column named as:
--3. Apply foreign key on Department key from College_table 
--4. Apply foreign Key on Student_Table from Professor_Table

CREATE TABLE college(college_id INT PRIMARY KEY, college_name VARCHAR(50) NOT NULL, college_area VARCHAR(50), dept_id INT, FOREIGN KEY(dept_id) REFERENCES department(dept_id));

CREATE TABLE department(dept_id INT PRIMARY KEY, dept_name VARCHAR(20) , dept_facility VARCHAR(20));

CREATE TABLE professor(prof_id INT PRIMARY KEY, prof_name VARCHAR(30), prof_sub VARCHAR(30));

CREATE TABLE student(stu_id INT PRIMARY KEY, stu_name VARCHAR(50), stu_stream VARCHAR(50), prof_id INT, FOREIGN KEY (prof_id) REFERENCES professor(prof_id));


-- 5. Insert atleast 10 Records in each table 

INSERT INTO department VALUES
(1, 'computer science', 'Labs'),
(2, 'Mechanical', 'Workshop'),
(3, 'Electronics', 'Robotics Lab'),
(4, 'Civil', 'Structural Lab'),
(5, 'Electrical', 'Power Systems'),
(6, 'Biotech', 'Bio Lab'),
(7, 'Physics', 'Quantum Lab'),
(8, 'Chemistry', 'Chemical Lab'),
(9, 'Mathematics', 'Math Lab'),
(10, 'Management', 'Smart Classrooms');


INSERT INTO college VALUES
(101, 'Greenfield College', 'North Zone', 1),
(102, 'Techno India', 'East Zone', 2),
(103, 'Skyline University', 'West Zone', 3),
(104, 'Heritage College', 'South Zone', 4),
(105, 'Innovate Institute', 'North Zone', 5),
(106, 'New Era College', 'East Zone', 6),
(107, 'Bright Future Univ.', 'South Zone', 7),
(108, 'Crystal College', 'West Zone', 8),
(109, 'Pioneer Institute', 'Central Zone', 9),
(110, 'Elite Management Inst.', 'North Zone', 10);


INSERT INTO professor VALUES
(201, 'Dr. A. Mehta', 'Data Science'),
(202, 'Prof. B. Rao', 'Thermodynamics'),
(203, 'Dr. C. Verma', 'VLSI Design'),
(204, 'Prof. D. Roy', 'Structural Engg.'),
(205, 'Dr. E. Khan', 'Electrical Machines'),
(206, 'Prof. F. Sen', 'Genetics'),
(207, 'Dr. G. Nair', 'Quantum Physics'),
(208, 'Prof. H. Reddy', 'Organic Chemistry'),
(209, 'Dr. I. Sharma', 'Linear Algebra'),
(210, 'Prof. J. Gupta', 'Marketing Management');

INSERT INTO student VALUES
(301, 'Ananya Singh', 'Computer Science', 201),
(302, 'Rahul Jain', 'Mechanical', 202),
(303, 'Priya Das', 'Electronics', 203),
(304, 'Mohit Yadav', 'Civil', 204),
(305, 'Ishita Roy', 'Electrical', 205),
(306, 'Karan Mehta', 'Biotech', 206),
(307, 'Sneha Paul', 'Physics', 207),
(308, 'Vivek Rana', 'Chemistry', 208),
(309, 'Tanya Bansal', 'Mathematics', 209),
(310, 'Amit Desai', 'Management', 210);

SELECT * FROM college;
SELECT * FROM department;
SELECT * FROM professor;
SELECT *FROM student;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Task 2:- 

-- Give the information of College_ID and College_name from College_Table 

SELECT college_id, college_name
FROM college;


--  Show  Top 5 rows from Student table.

SELECT TOP 5 stu_name, stu_stream, prof_id
FROM student;


--  What is the name of  professor  whose ID  is 5

SELECT prof_name, prof_sub
FROM professor
WHERE prof_id = 205;


-- Convert the name of the Professor into Upper case 

SELECT UPPER(prof_name)
FROM professor;


-- . Show me the names of those students whose name is start with a 

SELECT stu_name
FROM student
WHERE stu_name LIKE 'A%';


-- Give the name of those colleges whose end with a

SELECT college_name
FROM college
WHERE college_name LIKE '%a';


-- Add one Salary Column in Professor_Table

ALTER TABLE professor
ADD salary DECIMAL(10,2);

UPDATE professor SET salary = 65000 WHERE prof_id = 201;
UPDATE professor SET salary = 72000 WHERE prof_id = 202;
UPDATE professor SET salary = 58000 WHERE prof_id = 203;
UPDATE professor SET salary = 81000 WHERE prof_id = 204;
UPDATE professor SET salary = 65000 WHERE prof_id = 205;
UPDATE professor SET salary = 79000 WHERE prof_id = 206;
UPDATE professor SET salary = 88000 WHERE prof_id = 207;
UPDATE professor SET salary = 62000 WHERE prof_id = 208;
UPDATE professor SET salary = 70000 WHERE prof_id = 209;
UPDATE professor SET salary = 93000 WHERE prof_id = 210;



-- Add one Contact Column in Student_table

ALTER TABLE student
ADD contact VARCHAR(50);


-- Find the total Salary of Professor  

SELECT SUM(salary) AS TotalSalary
FROM professor;


-- Change datatype of any one column of any one Table

ALTER TABLE college
ALTER COLUMN college_area VARCHAR(100);


-- Task 3:-

-- . Show first 5 records from Students table and Professor table Combine

SELECT TOP 5 professor.prof_name, prof_sub, student.stu_name, student.stu_stream
FROM professor
JOIN student
ON professor.prof_id = student.prof_id;


-- Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it. 

CREATE PROCEDURE profPro
@newprofid INT
AS
BEGIN
	SELECT prof_id, prof_name, prof_sub
	FROM professor
	WHERE prof_id = @newprofid;
END;


EXEC profPro @newprofid = 209;


-- Rename the College_Table to College_Tables_Data .

EXEC sp_rename 'college', 'college_table';



SELECT * FROM college_table;
SELECT * FROM department;
SELECT * FROM professor;
SELECT *FROM student;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------