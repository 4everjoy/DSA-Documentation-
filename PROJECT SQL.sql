create database KMS_INVENTORY

Select * from KMS_SqlCaseStudy

Order_id bigint primary key,
Orderdate date,
Product_category nvarchar (100),
Region nvarchar (50),
ProductName varchar (max),
Sales decimal (18,2),
Shipping_cost decimal(18,2),
Shipping_mode nvarchar (50)
)
Select * from KMS_SqlCaseStudy



....QUESTION 1 PRODUCT CATEGORY WITH THE HIGHEST SALES.....

	SELECT TOP 1 Product_Category,
    Product_category, 
    SUM(Sales) AS TotalSales
FROM 
    kms_sqlcasestudy
GROUP BY 
    Product_category
ORDER BY 
    TotalSales DESC

...THE PRODUCT CATEGORY WITH THE HIGHEST SALES IS TECHNOLOGY| SALES=5984248.1820000000


	....... QUESTION 2 TOP 3 AND BOTTOM 3 REGION IN TERM OF SALES........

	
SELECT TOP 3 Region,
    Region, 
    SUM(Sales) AS TotalSales
FROM
    kms_sqlcasestudy
GROUP BY 
    Region
ORDER BY 
     TotalSales DESC
	......THE TOP 3 REGION ARE WEST, ONTARIO AND PRARIE.....

	SELECT * from Kms_SqlCaseStudy
	

.......BOTTOM 3 REGIONS.....

SELECT TOP 3 Region,
    Region, 
    SUM(Sales) AS TotalSales
FROM
    kms_sqlcasestudy
GROUP BY 
    Region
ORDER BY 
     TotalSales ASC
	 ....THESE ARE NUNAVUT, NORTHWEST TERRITORIES AND YUKON



...... QUESTION 3 TOTAL SALES OF APPLIANCE IN ONTARIO....

	SELECT 
    SUM(Sales) AS TotalApplianceSales
FROM 
    kms_sqlcasestudy
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Region = 'Ontario';

TOTAL SALE OF APPLIANCES IN ONTARIO IS 202346.8400000000
	
	SELECT * FROM KMS_SqlCaseStudy
	

..... QUESTION 4 ADVICE ON WHAT TO DO TO INCREASE THE REVENUE FROM THE BOTTOM 10 CUSTOMERS...


	SELECT 
    order_ID,
    Product_name,
	Customer_Name,
    SUM(Sales) AS TotalSales
FROM 
    kms_sqlcasestudy
GROUP BY 
    order_ID, Product_name, Customer_Name
ORDER BY 
    TotalSales ASC
	
.......This shows which customers spend the least.(RICARDO EMERSON | 2.2400000000)


Advice;

The management of KMS should Offer special promotions/discounts.

They should Personalized recommendations or bundles.

KMS should introduce free shipping thresholds.

KMS Should target marketing campaigns to understand needs.


..... QUESTION 5 KMS INCURRED THE MOST SHIPPING COST USING WHICH SHIPPING METHOD?

SELECT 
    Ship_mode, 
    SUM(Shipping_Cost) AS TotalShippingCost
FROM 
    kms_sqlcasestudy
GROUP BY 
    Ship_mode
ORDER BY 
    TotalShippingCost DESC

	......KMS Incured the most shipping cost using DELIVERY TRUCK AS shipping mode.
	
	SELECT * FROM Kms_SqlCaseStudy

.......Sceriano 2....

.....QUESTION 6 WHO ARE THE MOST VALUABLE CUSTOMERS, AND WHAT PRODUCTS OR SERVICE DO THEY TYPICALLY PURCHASE?
Customers by Total Sales

SELECT 
Order_ID,
Product_Name,
Customer_Name,
SUM(Sales) AS TotalSales
FROM
Kms_sqlcasestudy
GROUP BY
order_id, Product_Name, Customer_Name
ORDER BY
TotalSales DESC
....The most valusble customers are those who Purchased 'Polycom viewstation ISDN Videoconfererencing unit' (EMILY PHAN, JASPER CACIOPPO, CRAIG CARREIRA)
THESE ARE THE PRODUCT CATEGORY PURCHASE BY TOP CUSTOMERS........



........QUESTION 7 WHICH SMALL BUSINESS CUSTOMER HAD THE HIGHEST SALES?.....


select * FROM dbo.KMS_SqlCaseStudy

SELECT TOP 1 Customer_Name,
order_id,
Product_name,
Customer_segment,
Customer_name,
SUM(Sales) AS TotalSales
FROM
KMS_sqlcasestudy
where 
Customer_segment = 'SMALL BUSINESS'
GROUP BY
Order_id, Product_name, Customer_segment, Customer_name
ORDER BY
TotalSales DESC

THE SMALL BUSINESS CUSTOMER WITH THE HIGHEST SALES IS Dennis Kane with TotalSales of 33367.8500000000


..... QUESTION 8 WHICH CORPORATE CUSTOMER PLACED THE MOST NUMBER OF ORDERS IN 2009-2012......

SELECT
Order_id,
COUNT(order_id) AS order_quantity,
Customer_Name,
Order_Date,
Customer_Segment
FROM
KMS_SqlCaseStudy
WHERE
Customer_Segment = 'CORPORATE'
AND
Order_Date BETWEEN '2009' AND '2012'
GROUP BY Order_id, Customer_Name, Order_Date, Customer_Segment
ORDER BY Order_quantity desc


***The corporate Customer who placed the highest order

SELECT TOP 1 Customer_Name,Customer_Segment,
COUNT(order_id) AS order_quantity
FROM
[KMS_SqlCaseStudy]
WHERE
Customer_Segment = 'Corporate' and Order_Date between '2009' AND '2012'
GROUP BY 
Customer_Name, Customer_Segment
ORDER BY
order_quantity desc

ADAM HART is the corporate customer with the highest number of orders placed between this period.

IT WAS OBSERVED THAT IN 2012 NO ORDER WAS PLACED BY CORPORATE CUSTOMERS


....QUESTION 9 WHICH CONSUMER CUSTOMER WAS THE MOST PROFITABLE ONE?.....

SELECT * FROM KMS_SqlCaseStudy

SELECT TOP 1
Order_id,
Sales,
Profit,
Customer_Name
FROM
KMS_SqlCaseStudy
GROUP BY Order_id, Sales, Profit, Customer_Name
ORDER BY Sales DESC

......THE MOST PROFITABLE CONSUMER CUSTOMER IS EMILY PHAN

........QUESTION 10 WHICH CUSTOMER RETURNED ITEMS AND WHAT SEGMENT DO THEY BELONG?

SELECT * FROM dbo.KMS_SqlCaseStudy
SELECT * FROM [dbo].[KMS_Order_Satus]

SELECT
Order_id,
Customer_name,
Customer_segment
FROM
KMS_SqlCaseStudy
INNER JOIN
[dbo].[KMS_Order_Satus]
ON 
 [dbo].[order_id] = order_id
WHERE 
order_status = 'Returned'
GROUP BY
Order_Id,
Customer_Segment, Customer_Name, Order_Status



......QUESTION  11 IF THE DELIVERY TRUCK IS THE MOST ECONOMICAL BUT THE SLOWEST SHIPPING METHOD AND EXPRESS AIR IS THE FASTEST BUT THE MOST EPENSIVE ONE, 
DO YOU THINK THE COMPANY APPROPRIATELLY SPENT SHIPPING COST BASED ON THE ORDER PRIORITY? EXPLAIN YOUR ANSWER.
 SELECT
 [Order_Priority],[Ship_Mode],
 COUNT ([Order_id]) AS OrderCount,
 ROUND (SUM(Sales-Profit), 2) AS EstimatedShippingCost,
 AVG(DATEDIFF(Day,[Order_Date],
 [Ship_Date])) AS AvgShipDays 
 FROM
 KMS_SqlCaseStudy
 GROUP BY
 [Order_Priority], [Ship_Mode]
 ORDER BY
 [Order_Priority],
 [Ship_Mode] DESC

 .......THIS SHOWS THAT THE COMPANY SPENT SHIPPING COST APPROPRIATELY BASED ON HOW CRITICAL THE ORDER PRIORITY IS AND THIS DETERMINED WHICH SHIPPING MODE IS TO CHOOSE 
 IN ORDER TO ENSURE IT DELIVER BETWEEN A SHORT PERIOD OF DAYS EVEN THOUGH IT MAY BE EXPENSIVE.



 

 











