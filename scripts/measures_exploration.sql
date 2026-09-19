
/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/
-- Find the Total Sales
	SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

-- Find how many items are sold
	SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

-- Find the average selling price
	SELECT AVG(sales_amount) AS avg_selling FROM gold.fact_sales
-- Find the Total number of Orders
	SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales

-- Find the total number of products
	SELECT COUNT(DISTINCT product_key) AS total_products FROM gold.fact_sales

-- Find the total number of customers
	SELECT COUNT(customer_key) AS total_customers FROM gold.fact_sales

-- Find the total number of customers that has placed an order
	SELECT COUNT(DISTINCT customer_key) customers_placed_orders FROM gold.fact_sales


-- Generate a Report that shows all key metrics of the business
SELECT 'total_sales' AS dimension , SUM(sales_amount) AS measure FROM gold.fact_sales
	UNION ALL 
SELECT  'total_quantity' ,  SUM(quantity) FROM gold.fact_sales
	UNION ALL
SELECT  'avg_selling' ,  AVG(sales_amount)FROM gold.fact_sales
	UNION ALL
SELECT  'total_orders' ,  COUNT(order_number) FROM gold.fact_sales
	UNION ALL 
SELECT 'total_products' ,  COUNT(DISTINCT product_key) FROM gold.fact_sales
	UNION ALL
SELECT 'total_customers' , COUNT(customer_key) FROM gold.fact_sales
	UNION ALL
SELECT 'customers_placed_orders' ,  COUNT(DISTINCT customer_key) FROM gold.fact_sales


