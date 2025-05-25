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
