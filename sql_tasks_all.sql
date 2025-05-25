-- Task 1: Joins Practice
-- Sample Tables: employees, departments

-- Inner Join
SELECT e.id, e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- Left Join
SELECT e.id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- Right Join
SELECT e.id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- Full Outer Join
SELECT e.id, e.name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id;


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


-- Task 3: Database Migration
-- Export and Import Example (SQL Server to PostgreSQL)

-- SQL Server Export (conceptual)
-- SELECT * FROM employees INTO OUTFILE 'C:\\exports\\employees.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- PostgreSQL Import
CREATE TABLE employees (
    id INT,
    name VARCHAR(100),
    department_id INT
);

-- COPY from CSV (PostgreSQL)
-- COPY employees(id, name, department_id)
-- FROM '/path/to/employees.csv'
-- DELIMITER ','
-- CSV HEADER;


-- Task 4: Backup and Recovery (PostgreSQL)
-- These are shell commands, not SQL:

-- Backup:
-- pg_dump -U postgres -F c -b -v -f /backups/mydb.backup mydb

-- Restore:
-- pg_restore -U postgres -d mydb_restored -v /backups/mydb.backup
