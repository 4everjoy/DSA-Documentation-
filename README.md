# PORTFOLIO
## A brief description about me: 
I am a passionate individual with a growth mindset, a Health Information Manager/Data Analyst with the interest in transforming of raw data into useful information for proper decision making, administrative planning and budgetting. I derive joy in leveraging data to solve real-world problem and making proper  strategic decisions. 


# DSA-Project Documentation-
This project is a summary of my journey with 'THE INCUBATOR HUB' which started 2 months ago. During the training we were thought on how to make use of tools
such as Power BI, SQL and Excel which are essential tools in data analysis. As a result of the training project were giving which I will be discussing.


### CASE STUDY 1 :  Kultra Mega Stores Inventory 
#### DESCRIPTION: A detailed analysis of inventory on sales and order data for a retailed company named above Headquartered in Lagos, specialises in office supplies and furniture. Its customer base includes individual consumers, small businesses (retail), and large corporate clients (wholesale) across Lagos, Nigeria. 
As a Business Intelligence Analyst to support the Abuja division of KMS. The Business Manager has shared an Excel file containing order data from 2009 to 2012 and has requested that you analyze the data and present your key insights and findings. 
### Apply your SQL skills from the DSA Data Analysis class and solve both case scenarios as shared in the document.

#### QUESTION 1 PRODUCT CATEGORY WITH THE HIGHEST SALES.....

	SELECT 
    Product_category, 
    SUM(Sales) AS TotalSales
FROM 
    kms_sqlcasestudy
GROUP BY 
    Product_category
ORDER BY 
    TotalSales DESC

...THE PRODUCT CATEGORY WITH THE HIGHEST SALES IS TECHNOLOGY| SALES=5984248.1820000000

#### QUESTION 2 TOP 3 AND BOTTOM 3 REGION IN TERM OF SALES........

	
SELECT TOP 3 
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

 BOTTOM 3 REGIONS.....

SELECT TOP 3,
    Region, 
    SUM(Sales) AS TotalSales
FROM
    kms_sqlcasestudy
GROUP BY 
    Region
ORDER BY 
     TotalSales ASC
	 ....THESE ARE NUNAVUT, NORTHWEST TERRITORIES AND YUKON

#### QUESTION 3 TOTAL SALES OF APPLIANCE IN ONTARIO....

	SELECT 
    SUM(Sales) AS TotalApplianceSales
FROM 
    kms_sqlcasestudy
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Region = 'Ontario';

TOTAL SALE OF APPLIANCES IN ONTARIO IS 202346.8400000000
	
	SELECT * FROM KMS_SqlCaseStudy
 
#### QUESTION 4 ADVICE ON WHAT TO DO TO INCREASE THE REVENUE FROM THE BOTTOM 10 CUSTOMERS...


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

##### ADVICE TO MANAGEMENT OF KMS;

The management of KMS should Offer special promotions/discounts.

They should Personalized recommendations or bundles.

KMS should introduce free shipping thresholds.

KMS Should target marketing campaigns to understand needs.

#### QUESTION 5 KMS INCURRED THE MOST SHIPPING COST USING WHICH SHIPPING METHOD?

SELECT 
    Ship_mode, 
    SUM(Shipping_Cost) AS TotalShippingCost
FROM 
    kms_sqlcasestudy
GROUP BY 
    Ship_mode
ORDER BY 
    TotalShippingCost DESC

	......KMS Incured the most shipping cost using DELIVERY TRUCK
	
	SELECT * FROM Kms_SqlCaseStudy
### SCENARIO 2

#### QUESTION 6 WHO ARE THE MOST VALUABLE CUSTOMERS, AND WHAT PRODUCTS OR SERVICE DO THEY TYPICALLY PURCHASE?
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

The most valusble customers are those who Purchased 'Polycomviewstation ISDN Videoconfererencing unit' (EMILY PHAN, JASPER CACIOPPO, CRAIG CARREIRA). These are the product category purchased by 'TOP CUSTOMERS.

#### QUESTION 7 WHICH SMALL BUSINESS CUSTOMER HAD THE HIGHEST SALES?

select * FROM dbo.KMS_SqlCaseStudy

SELECT TOP 1 Cuctomer_Name,
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

The Small business customer with the highest sales is Dennis Kane with TotalSales of 33367.8500000000

#### QUESTION 8 WHICH CORPORATE CUSTOMER PLACED THE MOST NUMBER OF ORDERS IN 2009-2012.

SELECT TOP 1 Customer_Name,
Customer_Segment,
COUNT(order_id) AS order_quantity
FROM
[KMS_SqlCaseStudy]
WHERE
Customer_Segment = 'Corporate' and Order_Date between '2009' AND '2012'
GROUP BY 
Customer_Name, Customer_Segment
ORDER BY
order_quantity desc


The Corporate customer that placed the most number of orders in 2009-2012 is Adam Hart with total orders of 19 making the highest number of orders placed between this period.

It was observed that in 2012 no Order was placed by corporate customers.

#### QUESTION 9 WHICH CONSUMER CUSTOMER WAS THE MOST PROFITABLE ONE?

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

* THE MOST PROFITABLE CONSUMER CUSTOMER IS EMILY PHAN WITH A TOTAL SALES OF 89061.0500 AND PROFIT 27220.690.

#### QUESTION 10 WHICH CUSTOMER RETURNED ITEMS AND WHAT SEGMENT DO THEY BELONG?

SELECT * FROM KMS_SqlCaseStudy


SELECT
Order_id, Customer_Name,
Customer_segment
FROM
[dbo].KMS_SqlCaseStudy
INNER JOIN
[dbo].[KMS_Order_Satus]
ON Order_id =Order_id
WHERE 
Status = 'RETURNED'
GROUP BY
Order_id,
Customer_Segment, customer_Name

#### QUESTION 11 IF THE DELIVERY TRUCK IS THE MOST ECONOMICAL BUT THE SLOWEST SHIPPING METHOD AND EXPRESS AIR IS THE FASTEST BUT THE MOST EPENSIVE ONE, DO YOU THINK THE COMPANY APPROPRIATELLY SPENT SHIPPING COST BASED ON THE ORDER PRIORITY? EXPLAIN YOUR ANSWER.

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

 ##### This  shows that the company spent cost approprately based on how critical, high or low the order priority is and this determined which shipping mode is to use in order to ensure it deliver between a short period of days.

### Skills and Tools:
** SQL,
Data Analysis and Visualization, 
Power BI,
Version Control-GitHub

  

	
