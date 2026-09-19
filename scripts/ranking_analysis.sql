/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products Generating the Highest Revenue?
SELECT
*
FROM(
	SELECT 
	ROW_NUMBER() OVER(ORDER BY SUM(s.sales_amount) DESC) AS Ranking,
	p.product_id,
	p.product_name,
	SUM(s.sales_amount) AS Revenue
	FROM gold.dim_products AS p
	LEFT JOIN gold.fact_sales AS s
	ON p.product_key = s.product_key
	GROUP BY p.product_id,
	p.product_name
)T
WHERE Ranking <= 5


-- What are the 5 worst-performing products in terms of sales?
SELECT *
FROM(
	SELECT 
	ROW_NUMBER() OVER(ORDER BY SUM(s.sales_amount)) AS ranking,
	p.product_id,
	p.product_name,
	SUM(s.sales_amount) total_sales
	FROM gold.dim_products AS p
	LEFT JOIN gold.fact_sales AS s
	ON s.product_key = p.product_key
	GROUP BY p.product_id,
	p.product_name
)T
WHERE ranking <= 5



-- Find the top 10 customers who have generated the highest revenue
SELECT *
FROM(
	SELECT 
	ROW_NUMBER() OVER(ORDER BY SUM(s.sales_amount) DESC) AS [ranking],
	c.first_name,
	c.last_name,
	SUM(s.sales_amount) AS revenue
	FROM gold.dim_customers AS c
	LEFT JOIN gold.fact_sales AS s
	ON s.customer_key = c.customer_key
	GROUP BY c.first_name,
	c.last_name
)T
WHERE [ranking] <= 5



-- The 3 customers with the fewest orders placed
SELECT *
FROM(
	SELECT 
	DENSE_RANK() OVER(ORDER BY COUNT(s.order_number)) AS [ranking],
	c.first_name,
	c.last_name,
	COUNT(s.order_number) AS [total number of orders]
	FROM gold.dim_customers AS c
	LEFT JOIN gold.fact_sales AS s
	ON c.customer_key = s.customer_key
	GROUP BY c.first_name,
	c.last_name
)T
WHERE [ranking] <= 3
