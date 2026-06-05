
--Creating a Database:
--Write the SQL command to create a database named "StudentRecords".
CREATE DATABASE StudentRecords;

--Explain the use of the USE command with an example.
/*The USE command in SQL is used to select a specific database to work with in a session. 
Once a database is selected using the USE command, 
all subsequent SQL queries will be executed within that database unless another database is selected.*/

USE StudentRecords

-----------------------------------------------------------------------------------------------------------------------------------------
--Write a SQL command to create a table with columns that use  FLOAT , DECIMAL  data types. Explain the significance of each type.
CREATE TABLE CollegeFees(
CourseId INT PRIMARY KEY,
CourseName VARCHAR(50) NOT NULL,
AvgRating FLOAT,
CourseFee DECIMAL(10,2));

INSERT INTO CollegeFees VALUES
(101, 'MARKETING',4.7,78000.25),
(102,'ANALYTICS',4.9,82150.00),
(103,'FINANCE',4.1,78510.00),
(104,'OPERATIONS',4.6,75000.10);

SELECT *FROM CollegeFees

-----------------------------------------------------------------------------------------------------------------------------------------
--Write the SQL commands to create a table with DATETIME, DATE, and TIME columns. 

CREATE TABLE CollegeStudentInfo(
StudentID INT NOT NULL PRIMARY KEY,
StudentName VARCHAR(75) NOT NULL,
DateOfBirth DATE,
ClassTime TIME,
AdmissionTimestamp DATETIME DEFAULT GETDATE());

INSERT INTO CollegeStudentInfo(StudentID,StudentName,DateOfBirth,ClassTime) VALUES
(1,'ANUJ','1998-05-17','10:05:00'),
(2,'Saurabh','2000-06-10','21:25:14');

SELECT *FROM CollegeStudentInfo;

--------------------------------------------------------------------------------------------------------------------------------------------
--Write the SQL command to create a table named "Courses" with columns for CourseID (INT), CourseName (VARCHAR(100)), and Credits (INT).

CREATE TABLE Courses(CourseID INT, CourseName VARCHAR(100), Credits INT)

--------------------------------------------------------------------------------------------------------------------------------------------
/*Retrieving Data
SELECT Statements:
Write a SQL query to retrieve all data from a table named "Students".*/

CREATE TABLE Students(Studentid INT NOT NULL PRIMARY KEY, StudentName VARCHAR(50) NOT NULL, StudentsGrades INT CHECK(StudentsGrades >= 75))

INSERT INTO Students VALUES
(1, 'ANUJ', 82),
(2, 'ADITYA',78),
(3, 'ANAND',81),
(4, 'RAJ', 84),
(5, 'TUSHAR', 75);

SELECT *FROM Students;


---------------------------------------------------------------------------------------------------------------------------------------------
/*Create a database named "Library" and within it, 
create a table named "Books" with appropriate columns. 
Insert three records into the "Books" table.

Write a query to retrieve all records from the "Books" table */

CREATE DATABASE Library

USE Library

CREATE TABLE Books(BookName VARCHAR(100) NOT NULL PRIMARY KEY, AuthorName VARCHAR(100) NOT NULL)

INSERT INTO Books VALUES
('UGLY LOVE','COOLEAN HOOVER'),
('THE ALCHEMIST', ' PAULO COELHO'),
('PRIDE & PREJUDICE', 'JANE AUSTIN');

SELECT *FROM Books;

---------------------------------------------------------------------------------------------------------------------------------------------

/* Create a table named "Products" with columns for
ProductID (INT), ProductName (VARCHAR(50)), Price (DECIMAL(10, 2)), and Available (BIT). 
Insert sample data and retrieve all records. */

CREATE TABLE Products(ProductID INT, ProductName VARCHAR(50), Price DECIMAL(10,2), AVAILABLE BIT)

INSERT INTO Products VALUES
(1, 'Wireless Mouse',25.99, 1),
(2, 'USB Keyboard',19.50, 1),
(3,'HD Monitor',149.99, 0),
(4, 'External Hard Drive',79.49,1),
(5, 'Webcam',39.59, 0);

SELECT *FROM Products;

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--ASSIGNMENT QUESTIONS ON CONSTRAINTS 

/*1. **Not Null Constraint:**
   - Create a table `Product` with columns `ProductID` (INT) and `ProductName` (VARCHAR(50)) where `ProductName` cannot be null. 
   Insert some records into the table and demonstrate a failed insertion with a null `ProductName`. */

CREATE TABLE Product (ProductID INT, ProductName VARCHAR(100) NOT NULL)

INSERT INTO Product VALUES
(1, 'Laptop'),
(2, 'Smartwatch'),
(3, 'Tablet'),
(4, NULL),
(5, 'SmartPhone');

-----------------------------------------------------------------------------------------------------------------------------------------------
/*2. **Default Constraint:**
   - Create a table `Employee` with columns `EmployeeID` (INT), `EmployeeName` (VARCHAR(50)), and `Salary` (DECIMAL(10, 2)) with a default value of `50000.00` for `Salary`.
	Insert records into the table, some with and some without specifying the `Salary`. */

CREATE TABLE Employee(EmployeeID INT, EmployeeName VARCHAR(50), SALARY DECIMAL(10,2) DEFAULT 5000.00)

INSERT INTO Employee VALUES
(101, 'Anuj', 89000.00),
(102, 'Anand',78000.00),
(104, 'Vishal',85000.00);

INSERT INTO Employee(EmployeeID,EmployeeName) VALUES
(103,'Raj'),
(105, 'Piyush');

SELECT *FROM Employee;


--------------------------------------------------------------------------------------------------------------------------------------------------
/* 3. **Unique Constraint:**
   - Create a table `Customer` with columns `CustomerID` (INT) and `Email` (VARCHAR(100)) where `Email` must be unique. 
   Insert records into the table and demonstrate a failed insertion with a duplicate `Email`. */

   CREATE TABLE Customer(CustomerID INT,Email VARCHAR(100) UNIQUE)

    INSERT INTO Customer VALUES 
   (101, 'anujg89@gmail.com'),
   (102, 'anand765@gmail.com'),
   (103, 'anujg89@gmail.com'),
   (104, 'rajeshyu77@gmail.com'),
   (105, 'piyush12@gmail.com');

--------------------------------------------------------------------------------------------------------------------------------------------------
/* 4. **Primary Key Constraint:**
   - Create a table `Order` with columns `OrderID` (INT), `OrderDate` (DATE), and `CustomerID` (INT) where `OrderID` is the primary key. 
   Insert some records into the table. */

CREATE TABLE COrder (
    OrderID INT PRIMARY KEY,
    OrderDate DATE ,
    CustomerID INT
);

INSERT INTO COrder VALUES
(101, '2020-05-19', 2),
(102, '2019-11-04', 3),
(103, '2022-08-30', 5),
(104, '2019-09-22',7);

SELECT *FROM COrder;

---------------------------------------------------------------------------------------------------------------------------------------------------

/* 6. **Foreign Key Constraint:**
   - Create two tables, `Department` (with `DepartmentID` and `DepartmentName`) and 
   `Employee` (with `EmployeeID`, `EmployeeName`, and `DepartmentID`). Set `DepartmentID` in `Employee` as a foreign key referencing `DepartmentID` in `Department`. 
   Insert records and demonstrate a failed insertion with a non-existent `DepartmentID`.*/

CREATE TABLE Department( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(100))

CREATE TABLE Employe(EmployeeID INT PRIMARY KEY,  EmployeeName VARCHAR(50), DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID))

INSERT INTO Department VALUES
(101, 'MARKETING'),
(102, 'ANALYTICS'),
(103, 'FINANCE'),
(104, 'OPERATIONS');

INSERT INTO Employe VALUES
(1, 'Anuj', 102),
(2, 'Aditya', 101),
(3, 'Atharva', 103),
(4, 'Dhananjay', 104),
(5, 'Anand', 101),
(6, 'Rajveer' , 105);

-------------------------------------------------------------------------------------------------------------------------------------------------
/*7. **Check Constraint:**
   - Create a table `Account` with columns `AccountID` (INT), `AccountName` (VARCHAR(50)), and `Balance` (DECIMAL(10, 2)) where `Balance` must be non-negative. 
   Insert records and demonstrate a failed insertion with a negative `Balance`.*/

CREATE TABLE Account(AccountID INT PRIMARY KEY, AccountName VARCHAR(50), Balance DECIMAL(10,2) CHECK(Balance >=0))

INSERT INTO Account VALUES
(101, 'Anuj', 78590.66),
(102, 'Aditya', 68408.21),
(103, 'Mihir',74591.58),
(104, 'Rudra', -6439.66),
(105, 'Pratik', 52902.6);

----------------------------------------------------------------------------------------------------------------------------------------------------

/*8. **Complex Check Constraint:**
   - Create a table `Exam` with columns `StudentID` (INT), `Subject` (VARCHAR(50)), and `Marks` (INT) where `Marks` must be between 0 and 100. 
   Insert records and demonstrate a failed insertion with invalid `Marks`.*/

CREATE TABLE Exam(StudentID INT PRIMARY KEY, Subject VARCHAR(50), Marks INT CHECK(Marks BETWEEN 0 AND 100))

INSERT INTO Exam VALUES
(101, 'English',64),
(102, 'Maths', 78),
(103, 'Science',92),
(104, 'Social Studies', 120),
(105, 'Marathi', 88),
(106, 'Hindi', 84);

----------------------------------------------------------------------------------------------------------------------------------------------------
/*9. **Combination of Constraints:**
   - Create a table `Project` with columns `ProjectID` (INT, primary key), `ProjectName` (VARCHAR(50), not null), `StartDate` (DATE, not null), and `Budget` (DECIMAL(10, 2), 
   check that `Budget` is greater than 0). 
   Insert records demonstrating all constraints.*/

CREATE TABLE Project(ProjectID INT PRIMARY KEY, ProjectName VARCHAR(50) NOT NULL, StartDate DATE NOT NULL, Budget DECIMAL(10,2) CHECK(Budget > 0))

INSERT INTO Project VALUES
(101, 'VANGARD MIGRATION', '2023-05-17', 854000.73),
(102, 'HSBC' , '2017-02-18',9752018),
(103, 'TVS' , '2025-01-24',853974.88),
(104, 'BUMBLE', '2022-11-17',56748.25)

SELECT *FROM Project;


-----------------------------------------------------------------------------------------------------------------------------------------------------
/*10. **Multiple Constraints on One Column:**
    - Create a table `Vehicle` with columns `VehicleID` (INT, primary key), `LicensePlate` (VARCHAR(10), not null, unique), and `Owner` (VARCHAR(50)). 
	  Insert records demonstrating these constraints. */

	CREATE TABLE Vehicle(VehicleID INT PRIMARY KEY, LicensePlate VARCHAR(10) NOT NULL UNIQUE, Owner VARCHAR(50))

	INSERT INTO Vehicle VALUES
	(101, 'ABC123', 'John Doe'),
	(102, 'XYZ789', 'Jane Smith'),
	(103, 'DEF456', 'Michael Brown'),
	(104, ' GHI012', 'Emily White'),
	(105, 'JKL345', 'David Green'),
	(106, 'MNO678','Sarah Black'),
	(107, 'PQR901', 'Chris Blue');

	SELECT *FROM Vehicle;

--------------------------------------------------------------------------------------------------------------------------------------------------------

/*### Advanced Constraints
11. **Self-Referencing Foreign Key:**
    - Create a table `Employee` with columns `EmployeeID` (INT, primary key), `EmployeeName` (VARCHAR(50)), and `ManagerID` (INT). 
	Set `ManagerID` as a foreign key referencing `EmployeeID`. Insert records demonstrating hierarchical relationships.*/

	CREATE TABLE Employeess(EmployeeID INT PRIMARY KEY, EmployeeName VARCHAR(50), ManagerID INT,
	CONSTRAINT SelfReferrence
	FOREIGN KEY(ManagerID) REFERENCES Employeess(EmployeeID));

	INSERT INTO Employeess VALUES
	(1, 'Anuj',NULL),
	(2, 'Pratik', 3),
	(3, 'Aditya', 1),
	(4, 'Anand', 2),
	(5, 'Aryan', 3),
	(6, 'Raju', 5);

	SELECT *FROM Employeess;

	------------------------------------------------------------------------------------------------------------------------------------------------------

	/* 12. **Foreign Key with ON DELETE CASCADE:**
    - Create tables `Author` (with `AuthorID` and `AuthorName`) and `Book` (with `BookID`, `Title`, and `AuthorID`). Set `AuthorID` in `Book` as a foreign key referencing `AuthorID` in `Author` with `ON DELETE CASCADE`. 
	Demonstrate the effect of deleting an `Author`.*/

	CREATE TABLE Author(AuthorID INT PRIMARY KEY, AuthorName VARCHAR(100))
	
	CREATE TABLE Book(BookID INT PRIMARY KEY, Title VARCHAR(75) NOT NULL, AuthorID INT FOREIGN KEY REFERENCES Author(AuthorID) ON DELETE CASCADE)

	INSERT INTO Author VALUES
	(101, 'Coolean Hoover'),
	(102, 'Paulo Coelho'),
	(103, 'Jane Austen'),
	(104, 'Savi Sharma'),
	(105, 'Durjoy Dutta'),
	(106, 'Tessa Dare'),
	(107, 'Diana Gabaldon');

	INSERT INTO Book VALUES
	(1, 'Pride and Prejudice', 102),
	(2, 'Maybe Now', 101),
	(3, 'Outlander', 107),
	(4, 'Everyone has a story', 104),
	(5, 'Worlds Best Girlfriend', 105),
	(6, 'The Alchemist', 102),
	(7, 'This is Not Your Story', 104),
	(8, 'It Ends with Us', 101),
	(9, 'Eleven Minutes', 102),
	(10, 'Miss Massachusetts', 106),
	(11, 'The Boy Who Loved', 105);

	SELECT *FROM Author;
	SELECT *FROM Book;

	DELETE FROM Author WHERE AuthorID = 105;

	SELECT *FROM Author;
	SELECT *FROM Book;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 13. **Unique Constraint on Multiple Columns:**
    - Create a table `Schedule` with columns `Day` (VARCHAR(10)), `Time` (TIME), and `Classroom` (VARCHAR(10)) where the combination of `Day`, `Time`, and `Classroom` must be unique. 
	Insert records demonstrating this constraint.*/

	CREATE TABLE Schedule(Day VARCHAR(10) UNIQUE ,Time TIME UNIQUE ,Classroom VARCHAR(10) UNIQUE);

	INSERT INTO Schedule VALUES
	('Tuesday', '12:00:00','IA'),
	('Monday', '03:15:00','IVB'),
	('Saturday', '09:30:00','XA'),
	('Thursday', '07:45:20', 'VIIC'),
	('Friday', '11:15:00', 'IXB'),
	('Wednesday','02:35:50','VC');

	SELECT *FROM Schedule;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

/*- Create a table `Product` with columns `ProductID` (INT), `ProductName` (VARCHAR(50)), and `Price` (DECIMAL(10, 2), 
check that `Price` is greater than 0). 
Insert records and demonstrate an update that violates the `Check` constraint.*/

CREATE TABLE Produkt(ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2) CHECK(Price > 0))

INSERT INTO Produkt VALUES
(101, 'Laptop', 64320.78),
(102, 'Smartwatch', 27650.30),
(103, 'Tablet', 43588.10),
(104, ' Smatphone', 61000.00);

SELECT *FROM Produkt;

UPDATE Produkt
SET Price = -3600
WHERE ProductID = 103;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*15. **Delete with Foreign Key Constraint:**
    - Create tables `Publisher` (with `PublisherID` and `PublisherName`) and `Book` (with `BookID`, `Title`, and `PublisherID`). 
	Set `PublisherID` in `Book` as a foreign key referencing `PublisherID` in `Publisher`. 
	Demonstrate a failed deletion of a `Publisher` due to existing references in `Book`.*/

	CREATE TABLE Publisher(PublisherID INT PRIMARY KEY, PublisherName VARCHAR(75))

	CREATE TABLE Bks(BookID INT PRIMARY KEY, Title VARCHAR(75), PublisherID INT FOREIGN KEY REFERENCES Publisher(PublisherID))

	INSERT INTO Publisher VALUES
	(101, 'ABC'),
	(102, 'XYZ'),
	(103, 'PQR'),
	(104, 'MNR');

	INSERT INTO Bks VALUES
	(1, 'Pride and Prejudice', 102),
	(2, 'Maybe Now', 101),
	(3, 'Outlander', 103),
	(4, 'Everyone has a story', 104),
	(5, 'Worlds Best Girlfriend', 101),
	(6, 'The Alchemist', 102),
	(7, 'This is Not Your Story', 104),
	(8, 'It Ends with Us', 101),
	(9, 'Eleven Minutes', 102),
	(10, 'Miss Massachusetts', 103),
	(11, 'The Boy Who Loved', 104);

	SELECT *FROM Publisher;
	SELECT *FROM Bks;

	DELETE FROM Publisher WHERE PublisherID = 102;

---------------------------------------------------------------------------------------------------------------------------------------------------------------



