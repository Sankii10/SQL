CREATE TABLE students( stu_id INT PRIMARY KEY, name VARCHAR(30), surname VARCHAR(50), birthdate DATE, gender VARCHAR(1), class VARCHAR(5), point INT);

CREATE TABLE authors(authorid INT PRIMARY KEY, name VARCHAR(10), surname VARCHAR(10));

CREATE TABLE types(typeid INT PRIMARY KEY, name VARCHAR(10));

CREATE TABLE borrows(borrow_id INT PRIMARY KEY, bookid INT, takendate DATE, broughtdate DATE, stu_id INT, FOREIGN KEY(stu_id) REFERENCES students(stu_id), FOREIGN KEY(bookid) REFERENCES books(bookid));

CREATE TABLE books(bookid INT PRIMARY KEY, name VARCHAR(20), pagecount INT, point INT, authorid INT, typeid INT, FOREIGN KEY(authorid) REFERENCES authors(authorid),FOREIGN KEY(typeid) REFERENCES types(typeid));


INSERT INTO students (stu_id, name, surname, 
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

INSERT INTO types (typeid, name) VALUES 
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

INSERT INTO books (bookid, name, pagecount, point, 
authorid, typeid) VALUES 
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


INSERT INTO borrows (borrow_id, stu_id, bookId, 
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


SELECT *FROM students;
SELECT *FROM authors;
SELECT *FROM types;
SELECT *FROM borrows;
SELECT *FROM books;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Assignments Questions 

--Example 1:  List all the records in the student table

SELECT *FROM students;


-- Example 2: List the name surname and class of the student in the student table 

SELECT surname, class
FROM students;


-- Example 3: List the gender Female (F) records in the student table 

SELECT name, surname, gender
FROM students
WHERE gender = 'F';


-- Example 4 : List the names of each class in the way of being seen once in the student table 

SELECT DISTINCT class
FROM students;


-- Example 5: List the students with Female gender and the class 10Math in the student table

SELECT name, surname, gender, class
FROM students
WHERE gender = 'F' AND class = '10Math';


-- Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table

SELECT name, surname, class 
FROM students
WHERE class IN ('10Math','10Sci');


-- Example 7: List the students name surname and school number in the student table

SELECT name, surname, stu_id AS school_number
FROM students;


-- Example 8: List the students name and surname by combining them as name surname in the student table 

SELECT CONCAT(name,' ', surname) AS FullName
FROM students;


-- Example 9: List the students with the names starting with “A” letter in the student table 

SELECT name, surname
FROM students
WHERE name LIKE 'A%';


-- Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table

SELECT name, pagecount
FROM books
WHERE pagecount BETWEEN 50 AND 200;


-- Example 11: List the students with names Emma Sophia and Robert in the student table 

SELECT *
FROM students
WHERE name IN ('Emma','Sophia','Robert');


-- Example 12: List the students with names starting with A D and K in the student table 

SELECT name, surname
FROM students
WHERE name LIKE 'A%' OR name LIKE 'D%' OR name LIKE 'K%';


-- Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table

SELECT name, surname, class, gender
FROM students
WHERE (class = '9Math' AND gender = 'M') 
   OR (class = '9His' AND gender = 'F');


-- Example 14: List the males whose classes are 10Math or 10Bio  

SELECT *
FROM students
WHERE gender = 'M' AND class IN ('10Math','10Bio');


-- Example 15: List the students with birth year 1989 in the student table 

SELECT name, surname, birthdate
FROM students
WHERE YEAR(birthdate) = 1989;


-- Example 16: List the female students with  student numbers between 30 and 50 

SELECT name, surname 
FROM students
WHERE gender = 'F' AND stu_id BETWEEN 30 AND 50;


-- Example 17: List the students according to their names

SELECT name, surname , CONCAT(name,' ' ,surname)
FROM students
ORDER BY name ASC;


-- Example 18: List the students by names for those with same names. List them by their surnames

SELECT name, surname, class, stu_id
FROM students
WHERE name IN (
    SELECT name
    FROM students
    GROUP BY name
    HAVING COUNT(*) > 1
)
ORDER BY name, surname;


-- Example 19: List the students in 10A by decreasing school numbers 

SELECT stu_id,name, surname, class
FROM students
WHERE class = '10A'
ORDER BY stu_id DESC;


-- Example 20: List the first 10 records in the student chart 

SELECT TOP 10 *
FROM students;


-- Example 21: List the first 10 records name surname and date of birth information in the student table


SELECT TOP 10 name, surname , birthdate
FROM students
ORDER BY stu_id;


-- Example 22: List the book with the most page number

SELECT *
FROM books
WHERE pagecount = (
SELECT MAX(pagecount)
FROM books);


-- Example 24: List the oldest student in the 10A class 

SELECT name, surname, birthdate, DATEDIFF(YEAR, birthdate, GETDATE()) AS age
FROM students
WHERE class = '10A'
AND birthdate = (
    SELECT MIN(birthdate)
    FROM students
    WHERE class = '10A'
);



-- Example 25: List the books with the second letter N

SELECT name, pagecount
FROM books 
WHERE name LIKE '_n%';


-- Example 26: List the students by grouping according to their classes

SELECT class,COUNT(*) AS studentcount ,class
FROM students
GROUP by class;

--OR

SELECT name, surname, class
FROM students
ORDER BY class;


-- Example 27: List the students to be different in each questioning randomly 

SELECT name, surname, class
FROM students
ORDER BY RAND();


-- Example 28: Pick a random student from student table 

SELECT TOP 1 name, surname
FROM students
ORDER BY NEWID();


-- Example 29: Bring some random student’s name , surname and number from class 10C

SELECT TOP 1 stu_id, name, surname
FROM students 
WHERE class='10C'
ORDER BY NEWID();


-- Example 30: Add the writer named Smith Allen to the authors table

INSERT INTO authors(authorId, name, surname) VALUES(11, 'Smith', 'Allen');

SELECT *FROM authors;


-- Example 31: Add the genre of  biography to the types table 

INSERT INTO types(typeid, name) VALUES (11, 'biography');

SELECT *FROM types;



-- Example 32: Add 10A Class male named Thomas Nelson , 9B class female named Sally Allen and 11B Class female named Linda Sandra in one question

INSERT INTO students(stu_id,name,surname,gender,class) VALUES(11,'Thomas','Nelson','M','10A');
INSERT INTO students(stu_id,name,surname,gender,class) VALUES(12, 'Sally',' Allen','F','9B');
INSERT INTO students(stu_id,name,surname, gender,class) VALUES(13, 'Linda','Sandra', 'F','11B');

SELECT *FROM students;


-- Increase all of the students’ score by 5 points

SELECT name, surname,point, (point + 5) AS newmarks
FROM students;


--  List the students whose birth dates are null

SELECT name, surname, birthdate
FROM students
WHERE birthdate IS NULL;


-- List the name ,surname and the dates of received books of the student 

SELECT students.name, students.surname, borrows.broughtdate, books.name
FROM borrows
JOIN students ON students.stu_id = borrows.stu_id
JOIN books ON borrows.bookid = books.bookid;

--  Transfer all the students in 9Math Class to 10Math Class 

UPDATE students
SET class = '10B'
WHERE class = '9B';


-- Change the class of the student whose school number is 2 from 10B to 10A

UPDATE students
SET class = '10A'
WHERE class = '10B' AND stu_id = 2;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

