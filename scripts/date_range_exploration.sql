/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/


-- Determine the first and last order date and the total duration in months

SELECT 
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
DATEDIFF(month , MIN(order_date) , MAX(order_date)) AS [diff between them]
FROM gold.fact_sales



-- Find the youngest and oldest customer based on birthdate

SELECT 
MIN(birthdate) AS youngest_customer,
MAX(birthdate) AS oldest_customer
FROM gold.dim_customers
