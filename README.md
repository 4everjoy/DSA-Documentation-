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

QUESTION 1 PRODUCT CATEGORY WITH THE HIGHEST SALES.....

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

QUESTION 2 TOP 3 AND BOTTOM 3 REGION IN TERM OF SALES........

	
SELECT 
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

SELECT 
    Region, 
    SUM(Sales) AS TotalSales
FROM
    kms_sqlcasestudy
GROUP BY 
    Region
ORDER BY 
     TotalSales ASC
	 ....THESE ARE NUNAVUT, NORTHWEST TERRITORIES AND YUKON

 QUESTION 3 TOTAL SALES OF APPLIANCE IN ONTARIO....

	SELECT 
    SUM(Sales) AS TotalApplianceSales
FROM 
    kms_sqlcasestudy
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Region = 'Ontario';

TOTAL SALE OF APPLIANCES IN ONTARIO IS 202346.8400000000
	
	SELECT * FROM KMS_SqlCaseStudy
 
QUESTION 4 ADVICE ON WHAT TO DO TO INCREASE THE REVENUE FROM THE BOTTOM 10 CUSTOMERS...


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

QUESTION 5 KMS INCURRED THE MOST SHIPPING COST USING WHICH SHIPPING METHOD?

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
 
	.Sceriano 2....

QUESTION 6 WHO ARE THE MOST VALUABLE CUSTOMERS, AND WHAT PRODUCTS OR SERVICE DO THEY TYPICALLY PURCHASE?
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
The most valusble customers are those who Purchased 'Polycom viewstation ISDN Videoconfererencing unit' (EMILY PHAN, JASPER CACIOPPO, CRAIG CARREIRA)
THESE ARE THE PRODUCT CATEGORY PURCHASE BY TOP CUSTOMERS.

QUESTION 7 WHICH SMALL BUSINESS CUSTOMER HAD THE HIGHEST SALES?.....


select * FROM dbo.KMS_SqlCaseStudy
SELECT
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

QUESTION 8 WHICH CORPORATE CUSTOMER PLACED THE MOST NUMBER OF ORDERS IN 2009-2012......

SELECT
Order_id, COUNT(*) AS
Order_quantity,
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

THE CORPORATE CUSTOMER THAT PLACED THE MOST NUMBER OF ORDERS IN 2009-2012 ARE;
...JUSTIN KNIGHT WITH 6 ORDERS IN 2009
....LAUREL ELISTON WITH 6 ORDERS IN 2010 AND
....MELANIE PAGE WITH 5 ORDERS IN 2011
IT WAS OBSERVED THAT IN 2012 NO ORDER WAS PLACED BY CORPORATE CUSTOMERS

QUESTION 9 WHICH CONSUMER CUSTOMER WAS THE MOST PROFITABLE ONE?.....

SELECT * FROM KMS_SqlCaseStudy

SELECT
Order_id,
Sales,
Profit,
Customer_Name
FROM
KMS_SqlCaseStudy
GROUP BY Order_id, Sales, Profit, Customer_Name
ORDER BY Sales DESC

. THE MOST PROFITABLE CONSUMER CUSTOMER IS EMILY PHAN

QUESTION 10 WHICH CUSTOMER RETURNED ITEMS AND WHAT SEGMENT DO THEY BELONG?

SELECT * FROM KMS_SqlCaseStudy


SELECT DISTINCT 
Order_id, Customer_Name,
Customer_segment
FROM
[dbo].KMS_SqlCaseStudy
JOIN
[dbo].[KMS_Order_Satus]
ON Order_id =Order_id
WHERE 
Status = 'RETURNED'
GROUP BY
Order_id,
Customer_Segment, customer_Name

QUESTION  11 IF THE DELIVERY TRUCK IS THE MOST ECONOMICAL BUT THE SLOWEST SHIPPING METHOD AND EXPRESS AIR IS THE FASTEST BUT THE MOST EPENSIVE ONE, DO YOU THINK THE COMPANY APPROPRIATELLY SPENT SHIPPING COST BASED ON THE ORDER PRIORITY? EXPLAIN YOUR ANSWER.

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

 THIS SHOWS THAT THE COMPANY SPENT SHIPPING COST APPROPRIATELY BASED ON HOW CRITICAL THE ORDER PRIORITY IS AND THIS DETERMINED WHICH SHIPPING MODE IS TO CHOOSE IN ORDER TO ENSURE IT DELIVER BETWEEN A SHORT PERIOD OF DAYS.

### Skills and Tools:
SQL,
Data Analysis and Visualization, 
Power BI,
Version Control-GitHub

  

	
