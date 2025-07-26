-- 1.Creating duplicate table to restore original table data --

CREATE TABLE eda_data 
SELECT Order_ID, Order_Date, Ship_Date, Ship_Mode, Segment, Country, City,
State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name,
Sales, Quantity, Discount, Profit, Person, Returned, total_cost, price_per_unit
From super_store_data;

-- 2.Checking duplicate values --

WITH duplicate_data AS
(SELECT *, ROW_NUMBER() OVER (PARTITION BY Order_ID, Order_Date, Ship_Date, Ship_Mode, Segment, Country, City,
State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name,
Sales, Quantity, Discount, Profit, Person, Returned, total_cost, price_per_unit) AS row_num
FROM eda_data)
SELECT *
FROM duplicate_data
WHERE `row_num` > 1;

-- 3.Checking each column --

SELECT Ship_Mode
FROM eda_data
GROUP BY Ship_Mode;

SELECT Segment
FROM eda_data
GROUP BY Segment;

SELECT Country
FROM eda_data
GROUP BY Country;

SELECT City
FROM eda_data
GROUP BY City;

SELECT State
FROM eda_data 
GROUP BY State;

SELECT Region
FROM eda_data
GROUP BY Region;

SELECT Category
FROM eda_data
GROUP BY Category;

SELECT Sub_Category
FROM eda_data
GROUP BY Sub_Category;

SELECT *
FROM eda_data
GROUP BY Returned;

-- 4.Drop Unnecessary Column --

ALTER TABLE eda_data
DROP COLUMN Returned;

ALTER TABLE eda_data
DROP COLUMN Country;


-- 5.Total Order And Shipping By Year --

SELECT SUBSTRING_INDEX(Order_Date, "/" ,-1) AS order_year, COUNT(Order_Date) AS total_order 
FROM eda_data
GROUP BY order_year
ORDER BY order_year DESC;

SELECT SUBSTRING_INDEX(Ship_Date, "/" ,-1) AS shipping_year, COUNT(Ship_Date) AS total_shipping_order 
FROM eda_data
GROUP BY shipping_year
ORDER BY shipping_year DESC;

-- 6.Update Date Column --

UPDATE eda_data
SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y');

UPDATE eda_data
SET Ship_Date = STR_TO_DATE(Ship_Date, '%m/%d/%Y');

ALTER TABLE eda_data
Modify Column Order_Date DATE;

ALTER TABLE eda_data
Modify Column Ship_Date DATE;

-- 7.Average Estimate Days For Order --

WITH estimate_day AS
(SELECT DATEDIFF(Ship_Date, Order_Date) AS days_difference
FROM eda_data)
SELECT ROUND(AVG(days_difference)) As estimate_order_day
FROM estimate_day;

-- 8.Comprasion Of Total Count by Ship Mode With Estimate Day --

Select Ship_Mode,Count(Ship_Mode) AS total,ROUND(avg(DATEDIFF(Ship_Date, Order_Date))) AS estimate_day
FROM eda_data
GROUP BY Ship_Mode;

-- 9.Top 10 Most Itmes Order Cities --

SELECT City, SUM(Quantity) AS total_quantity
FROM eda_data
GROUP BY City
ORDER BY total_quantity DESC
LIMIT 10;

-- 10.Profit Of Each Region Within 4 Years --

SELECT SUBSTRING_INDEX(Order_Date, "-" ,1) AS order_year, Region,
ROUND(SUM(Profit),2) AS profit
FROM eda_data
GROUP BY order_year,Region
ORDER BY order_year DESC,profit DESC;

-- 11.Top 10 Most Profitable Items By Category With Sub Category --

SELECT Category,Sub_Category, MAX(Profit) AS max_profit
FROM super_store.eda_data
Group by Category,Sub_Category
ORDER BY max_profit DESC
Limit 10;

-- 12.Most Lost Items Among Other  --

WITH lose_items AS
(SELECT Sub_Category, ROUND(SUM(total_profit),2) AS profit_status
FROM (SELECT City, Category, Sub_Category, SUM(Profit) AS total_profit
FROM eda_data
GROUP BY City, Category, Sub_Category) AS tab_1
GROUP BY Sub_Category
ORDER BY profit_status)

SELECT *
FROM lose_items
WHERE profit_status < 0;
-- OR --
SELECT Sub_Category, SUM(Profit) as profit
FROM eda_data
GROUP BY Sub_Category
ORDER BY profit
limit 3 ;

-- 13.Profit Percentage By Segment --

SELECT Segment, ROUND((Profit / (price_per_unit * Quantity)) * 100) AS profit_percentage
FROM eda_data
GROUP BY Segment;

-- Profit_% = (Profit / Total_Cost) × 100 --
-- Total_Cost = Cost_Price_per_Unit × Quantity --

-- 14.Searching Year Total Profit With Procedure --

CREATE PROCEDURE year_profit(specific_year INT)
SELECT SUBSTRING_INDEX(Order_Date, "-" ,1) AS order_year, ROUND(SUM(Profit)) AS total_profit
FROM eda_data
where SUBSTRING_INDEX(Order_Date, "-" ,1) = specific_year;

CALL year_profit(2017);

-- 15.Most Total Discounted Items  --

SELECT Sub_Category, COUNT(Discount) AS total_discounted_items, Discount
FROM eda_data
WHERE Discount > 0
GROUP BY Sub_Category, Discount
ORDER BY total_discounted_items DESC;

-- 16.Creat Trigger For Daily Update Data To Add Data Table --

CREATE TABLE daily_update_data 
LIKE eda_data;

DELIMITER &&
CREATE TRIGGER data_daily_insert
AFTER INSERT ON daily_update_data
FOR EACH ROW
BEGIN 
	INSERT INTO eda_data (Order_ID, Order_Date, Ship_Date, Ship_Mode, Segment, City,
State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name,
Sales, Quantity, Discount, Profit, Person, total_cost, price_per_unit)
	VALUES (NEW.Order_ID, NEW.Order_Date, NEW.Ship_Date, NEW.Ship_Mode, NEW.Segment, NEW.City,
NEW.State, NEW.Postal_Code, NEW.Region, NEW.Product_ID, NEW.Category, NEW.Sub_Category, NEW.Product_Name,
NEW.Sales, NEW.Quantity, NEW.Discount, NEW.Profit, NEW.Person, NEW.total_cost, NEW.price_per_unit);
END &&
DELIMITER ;

INSERT INTO `daily_update_data` (`Order_ID`, `Order_Date`, `Ship_Date`, `Ship_Mode`, `Segment`, `City`, `State`, `Postal_Code`, `Region`, `Product_ID`, `Category`, `Sub_Category`, `Product_Name`, `Sales`, `Quantity`, `Discount`, `Profit`, `Person`, `total_cost`, `price_per_unit`) 
VALUES ('CA-2016-160000', '6/17/2018', '6/18/2018', 'First Class', 'Consumer', 'Troy', 'New York', '12180', 'East', 'OFF-AR-10001868', 'Office Supplies', 'Art', 'Prang Dustless Chalk Sticks', '1.68', '1', '0', '0.84', 'Chuck Magee', '0.84', '1.679999948');

