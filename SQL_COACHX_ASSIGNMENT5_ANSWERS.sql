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
(15, 6, 'Product I', '2023-07-14', 3) 


SELECT *FROM Customers;
SELECT *FROM Orders;
SELECT *FROM Products;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Write a query to retrieve all records from the Customers table.. 

SELECT * FROM Customers;


-- Write a query to retrieve the names and email addresses of customers whose names start with 'J'. 

SELECT Name, Email
FROM Customers
WHERE Name LIKE 'J%';


-- Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..

SELECT OrderID, ProductName, Quantity
FROM Orders;


-- 4.Write a query to calculate the total quantity of products ordered. 

SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;


-- 5. Write a query to retrieve the names of customers who have placed an order. 

SELECT Customers.Name, Orders.ProductName, Orders.OrderDate
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


-- 6. Write a query to retrieve the products with a price greater than $10.00. 

SELECT ProductName, Price 
FROM Products
WHERE Price > 10.00;


-- 7. Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

SELECT Customers.Name, Orders.ProductName, Orders.OrderDate
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate >= '2023-07-05'; 


-- 8. Write a query to calculate the average price of all products.

SELECT ProductName, AVG(Price) AS AvgPrice
FROM Products
GROUP BY ProductName;


--OR

SELECT AVG(Price) AS AVGPRICE
FROM Products;



-- 9. Write a query to retrieve the customer names along with the total quantity of products they have ordered.

SELECT Customers.Name, Orders.ProductName, SUM(Orders.Quantity) AS TotalQuantity
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name, Orders.ProductName;



-- 10. Write a query to retrieve the products that have not been ordered.

SELECT ProductName
FROM Products
WHERE ProductID NOT IN (
SELECT ProductID FROM Products);



----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Task 2 :- 

-- Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders. 

SELECT TOP 5 Customers.Name, SUM(Orders.Quantity) AS TotalQuantity
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY SUM(Orders.Quantity) DESC


-- Write a query to retrieve the customers who have not placed any orders.

SELECT Customers.Name
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;


-- Write a query to calculate the average price of products for each product Name.  

SELECT ProductName, AVG(Price) AS AVGPrice
FROM Products
GROUP BY ProductName;


-- Write a query to retrieve the order details (OrderID, ProductName,Quantity) for orders placed by customers whose names start with 'M'

SELECT Customers.Name, Orders.OrderID, Orders.ProductName, Orders.Quantity
FROM Customers
JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Name LIKE 'M%';


-- Write a query to calculate the total revenue generated from all orders. 

SELECT Products.ProductName,Orders.Quantity, Products.Price , (Orders.Quantity * Products.Price) AS Revenue 
FROM Orders
JOIN Products
ON Orders.ProductName = Products.ProductName;


-- OR 

SELECT SUM(Orders.Quantity * Products.Price) AS TotalRevenue 
FROM Orders
JOIN Products
ON Orders.ProductName = Products.ProductName;


-- Write a query to retrieve the customer names along with the total revenue generated from their orders. 

SELECT Customers.Name, SUM(Orders.Quantity * Products.Price) AS RevenueGenerated
FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Products ON Orders.ProductName = Products.ProductName
GROUP BY Customers.Name;


-- Write a query to retrieve the customers who have placed at least one order for each product category. 

SELECT Customers.Name, Orders.ProductName, Orders.OrderID, COUNT(Orders.OrderID) AS NoOfOrders
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name, Orders.ProductName, Orders.OrderID;


-- Write a query to retrieve the customers who have placed orders on consecutive days. 

SELECT Customers.Name
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
JOIN Orders AS Orders2
ON Customers.CustomerID = Orders.CustomerID
AND Orders2.OrderDate = DATEADD(DAY, 1, Orders.OrderDate);



-- Write a query to retrieve the top 3 products with the highest average quantity ordered. 

SELECT TOP 3 ProductName, AVG(Quantity) AS AVGQUANT
FROM Orders
GROUP BY ProductName
ORDER BY AVG(Quantity) DESC;


-- OR

SELECT TOP 3 Customers.Name, AVG(Orders.Quantity) AS AvgQuant
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY AVG(Orders.Quantity) DESC;


-- Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.

SELECT ROUND(100.00 * COUNT(*) / (SELECT COUNT(*) FROM orders),2) AS PercentAboveAverage
FROM Orders
WHERE Quantity > (SELECT AVG(Quantity) FROM Orders);



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

