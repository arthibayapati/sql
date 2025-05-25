-- Task 2: Data Analysis with Complex Queries
-- Sample Table: sales

-- Window Function: Running Total
SELECT 
  employee_id,
  sale_amount,
  sale_date,
  SUM(sale_amount) OVER (PARTITION BY employee_id ORDER BY sale_date) AS running_total
FROM sales;

-- Subquery: Top Seller
SELECT employee_id, total_sales
FROM (
  SELECT employee_id, SUM(sale_amount) AS total_sales
  FROM sales
  GROUP BY employee_id
) AS totals
ORDER BY total_sales DESC
LIMIT 1;

-- CTE: Monthly Sales Trend
WITH monthly_sales AS (
  SELECT 
    DATE_TRUNC('month', sale_date) AS sale_month,
    SUM(sale_amount) AS total_monthly_sales
  FROM sales
  GROUP BY sale_month
)
SELECT * FROM monthly_sales
ORDER BY sale_month;
