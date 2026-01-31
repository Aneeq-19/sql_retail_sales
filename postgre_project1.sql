DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT,
category VARCHAR(100),
quantity INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
)

SELECT * FROM retail_sales
LIMIT 10

SELECT COUNT(*) FROM retail_sales
-- DATA CLEANING
SELECT * FROM retail_sales
 WHERE 
 transactions_id is NULL
 OR
 sale_date is Null
 OR
 sale_time is Null
 OR
 customer_id is Null
 OR
 gender is Null
 OR
 category is Null
 OR
 quantity is Null
 OR
 price_per_unit is Null
 OR
 cogs is Null
 OR
 total_sale is Null
 
 DELETE FROM retail_sales
 WHERE 
 transactions_id is NULL
 OR
 sale_date is Null
 OR
 sale_time is Null
 OR
 customer_id is Null
 OR
 gender is Null
 OR
 category is Null
 OR
 quantity is Null
 OR
 price_per_unit is Null
 OR
 cogs is Null
 OR
 total_sale is Null
 
-- DATA EXPLORATION

-- HOW MANY SALES WE HAVE 
SELECT 
COUNT(*) as total_sales
FROM retail_sales


-- HOW MANY UNIQUE CUSTOMERS WE HAVE
SELECT 
COUNT(DISTINCT customer_id) as total_customers
FROM retail_sales

-- HOW MANY  CATEGORIES WE HAVE
SELECT DISTINCT category FROM retail_sales


-- DATA ANALYSIS BUSINESS AND KEY PROBLEMS 
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE 
category = 'Clothing'
AND
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
AND 
quantity>3

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category , SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM retail_sales
WHERE total_sale >1000
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category , gender,
COUNT(*) AS total_transations
FROM retail_sales 
GROUP BY  category,
gender

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT * FROM 
(
SELECT 
EXTRACT(YEAR FROM sale_date) AS year,
EXTRACT(MONTH FROM sale_date) AS month,
AVG(total_sale) as AVG_SALES,
RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY
year,
month 
) as t2
WHERE rank = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT customer_id,
SUM(total_sale) as total_sale
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
category,
COUNT(DISTINCT(customer_id)) AS unique_customers
FROM retail_sales
GROUP BY category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

with hourly_sale 
AS(
SELECT *,
CASE
WHEN EXTRACT(HOUR FROM sale_time) < 12  THEN 'Morning'
WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS shift
FROM retail_sales
)
SELECT COUNT(transactions_id) AS no_of_orders,
shift
FROM hourly_sale
GROUP BY shift