# 📊 Retail Sales Data Analysis (SQL Project)

## 🔍 Project Overview
This project analyzes retail sales data using SQL to extract meaningful business insights.  
It includes data cleaning, exploratory data analysis, and advanced SQL queries.

---

## 🛠 Tools & Technologies
- PostgreSQL
- SQL
- Window Functions
- Common Table Expressions (CTEs)

---

## 📁 Dataset Structure
- transactions_id
- sale_date
- sale_time
- customer_id
- gender
- age
- category
- quantity
- price_per_unit
- cogs
- total_sale

---

## 🧹 Data Cleaning
- Removed records containing NULL values
- Ensured data consistency before analysis

---

## 📈 Key Business Questions Answered
1. Total number of sales and unique customers  
2. Category-wise total sales  
3. Best-selling month in each year  
4. Top 5 customers by total sales  
5. Average age of customers by category  
6. Sales distribution by time shifts  

---

## 🧠 SQL Concepts Used
- `GROUP BY`, `ORDER BY`
- Aggregate Functions (`SUM`, `AVG`, `COUNT`)
- Window Functions (`RANK() OVER`)
- CTEs (`WITH`)
- Date & Time Functions

---

## 🚀 Sample Query
```sql
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;
📌 Conclusion
This project demonstrates how SQL can be used to answer real-world business questions and generate actionable insights.

🔗 Author
Aneeq Faisal
Aspiring Data Analyst
linkedln : www.linkedin.com/in/mohammad-aniq-a18350327
