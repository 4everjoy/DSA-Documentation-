create database DSA_PROJECT
CREATE TABLE orders
(
Order_id bigint primary key,
Orderdate date,
Product_category nvarchar (100),
Region nvarchar (50),
ProductName varchar (max),
Sales decimal (18,2),
Shippingcost decimal(18,2),
Shippingmode nvarchar (50)
)

Insert into orders(Order_id,Orderdate,Product_category,Region,ProductName,Sales,Shippingcost,Shippingmode)
VALUES(
(3),
(2010-10-13),
('Office Supplies'),
('Nunavut'),
('Eldon Base for stackable storage shelf''platinum'),
(261.5400000000),
(35),
('Regular_Air')
)

Truncate table orders;
select*from orders
insert into orders
 SELECT*FROM [DSA_PROJECT].[dbo].[KMS_sql_casestudy]

select*from orders

....PRODUCT CATEGORY WITH THE HIGHEST SALES.....

SELECT 
    Product_category, 
    SUM(Sales) AS TotalSales
FROM 
    orders
GROUP BY 
    Product_category
ORDER BY 
    TotalSales DESC
	 SELECT*FROM [DSA_PROJECT].[dbo].[KMS_sql_casestudy]
	.......TOP 3 REGION
	SELECT 
    Region, 
    SUM(Sales) AS TotalSales
FROM 
    orders
GROUP BY 
    Region
ORDER BY 
    TotalSales DESC
LIMIT 3;
.......BOTTOM 3 REGIONS.....
SELECT 
    Region, 
    SUM(Sales) AS TotalSales
FROM 
    orders
GROUP BY 
    Region
ORDER BY 
    TotalSales ASC
LIMIT 3;

......TOTAL SALES OF APPLIANCE IN ONTARIO....
SELECT 
    SUM(Sales) AS TotalApplianceSales
FROM 
    orders
WHERE 
    Product_Category = 'Appliances'
    AND Region = 'Ontario';
.....TO INCREASE THE REVENUE FROM THE BOTTOM 10 CUSTOMERS...
	SELECT 
    CustomerID,
    CustomerName,
    SUM(Sales) AS TotalSales
FROM 
    orders
GROUP BY 
    CustomerID, CustomerName
ORDER BY 
    TotalSales ASC
LIMIT 10;

.......This shows which customers spend the least.

Advice;

Offer special promotions/discounts.

Personalized recommendations or bundles.

Loyalty incentives or free shipping thresholds.

Follow-up calls or targeted marketing campaigns to understand needs.

.....KMS INCURRED THE MOST SHIPPING COST US