create database Adventure_project;
use  Adventure_project;
select * from `copy of fact_internet_sales_new`;

select * from `copy of factinternetsales`;


SELECT * FROM `copy of factinternetsales`
UNION ALL
SELECT * FROM `copy of fact_internet_sales_new`;



SELECT 
    t.ProductKey, 
    t.OrderDateKey, 
    t.ShipDateKey, 
    t.CustomerKey, 
    t.SalesTerritoryKey,
    t.OrderQuantity,
    t.UnitPrice, 
    t.DiscountAmount,
    t.ProductStandardCost, 
    t.TotalProductCost, 
    t.SalesAmount, 
    t.TaxAmt, 
    t.ProductName, 
    t.FirstName, 
    t.LastName, 
    t.CustomerFullName,
    t.OrderDate,
    YEAR(t.OrderDate) AS Year,
    MONTH(t.OrderDate) AS MonthNo,
    MONTHNAME(t.OrderDate) AS MonthFullName,
    CONCAT('Q', QUARTER(t.OrderDate)) AS Quarter,
    DATE_FORMAT(t.OrderDate, '%Y-%b') AS YearMonth,
    DAYOFWEEK(t.OrderDate) AS WeekdayNo,
    DAYNAME(t.OrderDate) AS WeekdayName,
    CASE 
        WHEN MONTH(t.OrderDate) >= 4 THEN MONTH(t.OrderDate) - 3
        ELSE MONTH(t.OrderDate) + 9
    END AS FinancialMonth,
    CASE 
        WHEN MONTH(t.OrderDate) BETWEEN 4 AND 6 THEN 'Q1'
        WHEN MONTH(t.OrderDate) BETWEEN 7 AND 9 THEN 'Q2'
        WHEN MONTH(t.OrderDate) BETWEEN 10 AND 12 THEN 'Q3'
        ELSE 'Q4'
    END AS FinancialQuarter

FROM (
    SELECT *,
        STR_TO_DATE(OrderDateKey, '%Y%m%d') AS OrderDate
    FROM sql_output_adventure_project_2q
) t;

select * from sql_output_adventure_project_3q;


Calculate the Sales amount uning the columns(unit price,order quantity,unit discount)

