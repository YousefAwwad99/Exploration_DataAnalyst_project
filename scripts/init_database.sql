/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold
	
WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

CREATE SCHEMA gold;
GO
-- CREATE TABLE CUSTOMERS
  IF OBJECTID('gold.dim_customers' , 'T') IS NOT NULL
    DROP TABLE gold.dim_customers 
CREATE TABLE gold.dim_customers 
(
		customer_key INT,
		customer_id INT,
		customer_number VARCHAR(50),
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		country VARCHAR(50),
		marital_status VARCHAR(50),
		gender VARCHAR(50),
		birthdate DATE,
		create_date DATE,

)

  
-- CREATE TABLE PRODUCTS
   IF OBJECTID('gold.dim_products' , 'T') IS NOT NULL
    DROP TABLE gold.dim_products 
CREATE TABLE gold.dim_products
(
		product_key INT,
		product_id INT,
		product_number VARCHAR(50),
		product_name VARCHAR(50),
		category_id VARCHAR(50),
		category VARCHAR(50),
		subcategory VARCHAR(50),
		maintenance VARCHAR(50),
		cost INT,
		product_line VARCHAR(50),
		start_date DATE,


)
  
-- CREATE TABLE SALES
  IF OBJECTID('gold.fact_sales' , 'T') IS NOT NULL
    DROP TABLE gold.fact_sales 
CREATE TABLE gold.fact_sales
(
		order_number INT,
		product_key INT,
		customer_key VARCHAR(50),
		order_date DATE,
		shipping_date DATE,
		due_date DATE,
		sales_amount INT,
		quantity INT,
		price INT,
)



TRUNCATE TABLE gold.dim_customers;
GO 
BULK INSERT gold.dim_customers
FROM 'C:\Users\DELL\Downloads\sql-data-analytics-project\sql-data-analytics-project\sql-data-analytics-project\datasets\flat-files\dim_customers.csv'
	WITH(
		FIRST_ROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	)

	BULK INSERT gold.dim_products 
	FROM 'C:\Users\DELL\Downloads\sql-data-analytics-project\sql-data-analytics-project\sql-data-analytics-project\datasets\flat-files\dim_products.csv'
	WITH(
		FIRST_ROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	)

	BULK INSERT gold.fact_sales
	FROM 'C:\Users\DELL\Downloads\sql-data-analytics-project\sql-data-analytics-project\sql-data-analytics-project\datasets\flat-files\fact_sales.csv'
	WITH(
		FIRST_ROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	)


