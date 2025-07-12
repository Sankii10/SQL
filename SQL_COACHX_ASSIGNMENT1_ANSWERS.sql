
-- 1. Create two Databases Name :- Brands , and  Products 

CREATE DATABASE Brands;

CREATE DATABASE Products;


-- 2. Create two tables in SQL Server  name  as ITEMS_TABLE in Brands database and PRODUCT_TABLE  in Products database. 

CREATE TABLE ITEMS_TABLE(Item_id INT PRIMARY KEY, Item_Description VARCHAR(50) NOT NULL, Vendor_No INT, Vendor_name VARCHAR(50), bottle_size INT, bottle_price FLOAT);


CREATE TABLE PRODUCT_TABLE (
    Product_id INT PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    Product VARCHAR(20) NOT NULL,
    Units_sold FLOAT,
    Manufacturing_price INT,
    Sale_price INT,
    Gross_price INT,
    Sales INT,
    COGS INT,
    Profit INT,
    Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(20),
    Year INT
);

-- 3. After Creating both the tables Add records in that tables (records are available in ITEMS_TABLE Sheet and PRODUCTS_TABLE Sheet) 


INSERT INTO ITEMS_TABLE VALUES 
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'Daristi Xtabentum',391,'Anchor Distilling', 750, 14.12),
(3, 'Hiram Walker Peach Brandy',370,'Pernord Ricard Usa/austin Nicholas', 1000,6.5),
(4, 'Oak Cross Whisky', 305,'Mhw Ltd', 750,25.33),
(5, 'UV Red Chilli Vodka', 380, 'Philips Beverage Company', 200,1.97),
(6, 'heaven Hill Old Style White Label', 259,'Heaven Hill Distilleries', 750,6.37),
(7, 'Hyde Herbal Liquer', 194, 'Fire trials brands', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403,'Robert Kachar Selections', 750, 23.61);

SELECT *FROM ITEMS_TABLE;


INSERT INTO PRODUCT_TABLE VALUES
(1, 'Canada', 'Caraterra', 1618.5, 3, 20, 32370, 16185, 16185, 0, '2024-01-01', 1, 'January', 2014),
(2, 'Germany', 'Caraterra', 1321, 3, 20, 26420, 13210, 13210, 0, '2024-01-01', 1, 'January', 2015),
(3, 'France', 'Caraterra', 2178, 3, 15, 32670, 21780, 10890, 10890, '2024-06-01', 6, 'June', 2014),
(4, 'Germany', 'Caraterra', 888, 3, 15, 13350, 13350, 8800, 4440, '2024-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Caraterra', 2470, 3, 15, 37050, 37050, 24700, 12350, '2024-06-01', 6, 'June', 2018),
(6, 'Germany', 'Careterra', 1513, 3, 350, 529550, 393380, 136170, 0, '2024-12-04', 12, 'December', 2019);

SELECT *FROM PRODUCT_TABLE;


-- 4. Delete those product having the Units Sold 1618.5 , 888 and 2470. 

DELETE FROM PRODUCT_TABLE 
WHERE Units_sold IN (1618.5, 888, 2470);

-- 5. Select all records from the ITEMS_TABLE table. 

SELECT *FROM ITEMS_TABLE;

-- 6. Select the item_description and bottle_price for all items in the ITEMS_TABLE table.

SELECT Item_Description, bottle_price FROM ITEMS_TABLE;

-- 7. Find the item_description and bottle_price of items where bottle_price is greater than 20. 

SELECT Item_Description, bottle_price 
FROM ITEMS_TABLE
WHERE bottle_price > 20;

-- 8. Select Unique Country from the product_sales table 

SELECT DISTINCT Country
FROM PRODUCT_TABLE;

-- 9. Count the number of Countries in the product_sales table 

SELECT COUNT(Country)
FROM PRODUCT_TABLE;

SELECT Country, COUNT(Country)
FROM PRODUCT_TABLE
GROUP BY Country;


-- 10. How Many Countries are there which contain the sales price between 10 to 20 

SELECT COUNT(DISTINCT Country) AS Country_count
FROM PRODUCT_TABLE
WHERE Sales BETWEEN 10 AND 20;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Intermediate Questions 

-- 1. Find the Total Sale Price  and  Gross Sales  

SELECT SUM(Sale_price) AS TotalSales, SUM(Gross_price) AS TotalGrossPrice
FROM PRODUCT_TABLE;


-- 2. In which year we have got the highest sales 

SELECT MAX(Sale_price) AS HighestSales
FROM PRODUCT_TABLE;

SELECT Country,MAX(Sale_price) AS HighestSales
FROM PRODUCT_TABLE
GROUP BY Country;


-- 3. Which Product having the sales of $ 37,050.00 

SELECT Product, Sales
FROM PRODUCT_TABLE
WHERE Sales = 37050;


-- Which Countries lies between profit of $ 4,605 to $  22 , 662.00 

SELECT Country, Profit
FROM PRODUCT_TABLE
WHERE Profit BETWEEN 4605 AND 22662;


-- . Which Product Id having the sales of $ 24 , 700.00 

SELECT Product_id , Sales
FROM PRODUCT_TABLE
WHERE Sales = 24700;


-- 6. Find the total Units Sold for each Country. 

SELECT Country, SUM(Units_sold) AS TotalUnitSold
FROM PRODUCT_TABLE
GROUP BY Country;


-- 7. Find the average sales for each country 

SELECT Country, AVG(Sales) AS AvgSales
FROM PRODUCT_TABLE
GROUP BY Country;

-- 8. Retrieve all products sold in 2014 

SELECT *
FROM PRODUCT_TABLE
WHERE Year = 2014;


-- 9. Find the maximum Profit in the product_sales table. 

SELECT Country, Product, MAX(Profit) AS HighestProfit
FROM PRODUCT_TABLE
GROUP BY Country, Product;


SELECT MAX(Profit) AS HighestProfit
FROM PRODUCT_TABLE;


--  10. Retrieve the records from product_sales where Profit is greater than the average Profit of all records. 

SELECT Country, Product, Profit
FROM PRODUCT_TABLE
WHERE Profit > (
SELECT AVG(Profit)
FROM PRODUCT_TABLE);


-- Find the item_description having the bottle size of 750 

SELECT Item_Description, bottle_size
FROM ITEMS_TABLE
WHERE bottle_size = 750;


-- Find the vendor Name having the vendor_nos 305 , 380 , 391

SELECT Vendor_No,Vendor_name
FROM ITEMS_TABLE
WHERE Vendor_No IN (305 , 380 , 391);


-- What is total Bottle_price  

SELECT Vendor_name , SUM(bottle_price) AS TotBottlePrice
FROM ITEMS_TABLE
GROUP BY Vendor_name;

SELECT SUM(bottle_price) AS TotBottlePrice
FROM ITEMS_TABLE;


-- Make Primary Key to Item_id  

ALTER TABLE ITEMS_TABLE
ADD CONSTRAINT PK_Item_id PRIMARY KEY (Item_id);


-- Which item id having the bottle_price of $ 5.06 

SELECT Item_id, Vendor_name
FROM ITEMS_TABLE
WHERE bottle_price = 5.06;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Advance Questions:- 

SELECT *FROM ITEMS_TABLE;
SELECT *FROM PRODUCT_TABLE;


-- Apply INNER  , FULL OUTER , LEFT JOIN types on both the table  

-- INNER JOIN
SELECT ITEMS_TABLE.Item_id, ITEMS_TABLE.Item_Description, ITEMS_TABLE.Vendor_name, PRODUCT_TABLE.Country, PRODUCT_TABLE.Product
FROM ITEMS_TABLE 
INNER JOIN PRODUCT_TABLE
ON ITEMS_TABLE.Item_id = PRODUCT_TABLE.Product_id;


-- FULL OUTER JOIN
SELECT ITEMS_TABLE.Item_id, ITEMS_TABLE.Item_Description, ITEMS_TABLE.Vendor_name, PRODUCT_TABLE.Country, PRODUCT_TABLE.Product
FROM ITEMS_TABLE
FULL OUTER JOIN PRODUCT_TABLE
ON ITEMS_TABLE.Item_id = PRODUCT_TABLE.Product_id;


-- LEFT JOIN
SELECT ITEMS_TABLE.Item_id, ITEMS_TABLE.Item_Description, ITEMS_TABLE.Vendor_name, PRODUCT_TABLE.Country, PRODUCT_TABLE.Product
FROM ITEMS_TABLE
LEFT JOIN PRODUCT_TABLE
ON ITEMS_TABLE.Item_id = PRODUCT_TABLE.Product_id;



--  Find the item_description and Product having the gross sales of 32670

SELECT Item_Description 
FROM ITEMS_TABLE
WHERE Item_Description  IN (
SELECT Product
FROM PRODUCT_TABLE
WHERE Gross_price  = 32670);


-- Split the Item_description Column into Columns Item_desc1 and Item_desc2 

SELECT 
  Item_id,
  LEFT(Item_Description, CHARINDEX(' ', Item_Description) - 1) AS Item_Desc1,
  LTRIM(RIGHT(Item_Description, LEN(Item_Description) - CHARINDEX(' ', Item_Description))) AS Item_Desc2
FROM ITEMS_TABLE
WHERE CHARINDEX(' ', Item_Description) > 0;


--  Find the top 3 most expensive items in the ITEMS_TABLE table. 

SELECT TOP 3 Vendor_name , bottle_price
FROM ITEMS_TABLE
ORDER BY bottle_price DESC;


-- Find the total Gross Sales and Profit for each Product in each Country.

SELECT Country,Product, SUM(Gross_price) AS TotGrossSales, SUM(Profit) AS TotProfit
FROM PRODUCT_TABLE
GROUP BY Country, Product;


-- Find the vendor_name and item_description of items with a bottle_size of 750 and bottle_price less than 10. 

SELECT Vendor_name, Item_Description 
FROM ITEMS_TABLE
WHERE bottle_size = 750 AND bottle_price < 10;


-- Find the Product with the highest Profit in 2019.

SELECT TOP 1 Product, Profit
FROM PRODUCT_TABLE
WHERE Year = 2019
ORDER BY Profit DESC;


--  Retrieve the Product_Id and Country of all records where the Profit is at least twice the COGS.

SELECT Product_id, Country
FROM PRODUCT_TABLE
WHERE Profit >= (2*COGS);


-- Find the Country that had the highest total Gross Sales in 2018 

SELECT TOP 1 Country, SUM(Gross_price) AS TotalGrossSales
FROM PRODUCT_TABLE
WHERE Year = 2018
GROUP BY Country
ORDER BY SUM(Gross_price) DESC;

-- Calculate the total Sales for each Month Name across all years. 

SELECT Month_Name, SUM(Sales) AS TotalSales
FROM PRODUCT_TABLE
GROUP BY Month_Name;


-- List the item_description and vendor_name for items whose vendor_nos exists more than once in the ITEMS_TABLE table.

SELECT Item_Description,Vendor_name 
FROM ITEMS_TABLE
WHERE Vendor_No IN (
SELECT Vendor_no
FROM ITEMS_TABLE 
GROUP BY Vendor_No
HAVING COUNT(*) > 1);


-- Find the average Manufacturing Price for Product in each Country and only include those Country and Product combinations where the average is above 3 

SELECT AVG(Manufacturing_price) AS AvgManPrice, Product, Country
FROM PRODUCT_TABLE
GROUP BY Country, Product 
HAVING AVG(Manufacturing_Price) > 3; 


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Super-Advance Questions:-

-- Find the item_description and bottle_price of items that have the same vendor_name as items with Item_Id 1.

SELECT Item_Description, bottle_price
FROM ITEMS_TABLE 
WHERE Vendor_name = (
SELECT Vendor_name
FROM ITEMS_TABLE
WHERE Item_id = 1);


-- Create a stored procedure to retrieve all records from the ITEMS_TABLE table where bottle_price is greater than a given value

CREATE PROCEDURE GetBottleNo
@MinPrice FLOAT
AS
BEGIN
	SELECT Item_Description, bottle_price
	FROM ITEMS_TABLE
	WHERE bottle_price > @MinPrice;
END;

EXEC GetBottleNo @MinPrice = 10;


--  Create a stored procedure to insert a new record into the product_sales table.

CREATE PROCEDURE NewRecord
AS
BEGIN
	INSERT INTO PRODUCT_TABLE (
        Product_id, Country, Product, Units_sold, Manufacturing_price, Sale_price, 
        Gross_price, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
	VALUES(7, 'Canada', 'Montana', 2518, 5, 12, 30216, 30216, 7554, 22662, '2024-01-06', 6, 'June', 2021);
END;

EXEC NewRecord;


