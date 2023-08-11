-- SQL COMMENT 
-- This is single line comment

/*
THIS IS MULTI LINE COMMENT
*/

SHOW DATABASES;
SHOW TABLES;
USE org;
SELECT * FROM org.worker;

-- USE OF INSERT INTO
INSERT INTO worker VALUES (9, 'Geetanjali', 'Kaushik', 85000, '2015-08-12 09:00:00', NULL);

-- USE OF UPDATE 
UPDATE worker SET department = NULL WHERE WORKER_ID = 7;

-- USE OF IS NULL and IS NOT NULL operator
-- It is not possible to test for NULL values with comparison operatoers, such as =, <, or <>.
SELECT * FROM worker WHERE department = NULL;

-- We will have to use the IS NULL and IS NOT NULL operator instead.
SELECT * FROM worker WHERE department IS NULL;
SELECT * FROM worker WHERE department IS NOT NULL;

-- USE OF LIMIT 
SELECT * FROM worker WHERE department IS NOT NULL LIMIT 5;
SELECT * FROM worker LIMIT 4;
SELECT * FROM worker WHERE department = 'Admin' LIMIT 2;

-- USE OF AGGREGATE FUNCTION
SELECT MIN(salary) AS Minimum_Salary FROM worker;

SELECT MAX(salary) AS Maximum_Salary FROM worker;
SELECT department, MAX(salary) AS Maximum_Salary FROM worker GROUP BY department;

-- In COUNT function NULL values are not counted.
-- In Department column two values are NULL 
SELECT COUNT(DEPARTMENT) AS person FROM worker;

SELECT department, COUNT(WORKER_ID) AS person FROM worker WHERE department = 'HR';

SELECT department, COUNT(WORKER_ID) AS person FROM worker GROUP BY department;

-- NULL values are ignored
SELECT AVG(salary) FROM WORKER;

-- NULL values are ignored
SELECT SUM(salary) FROM WORKER;

-- USE OF ALIAS
SELECT FIRST_NAME AS EMPOYEE_NAME, SALARY AS EMPLOYEE_SALARY FROM Worker;

-- If we want to combine more than two column in one single column than we use CONCAT FUNCTION 
SELECT CONCAT(FIRST_NAME ,' ', LAST_NAME) AS FULL_NAME FROM Worker;

-- Use single quotation mark if alias name contains spaces
SELECT CONCAT(FIRST_NAME ,' ', LAST_NAME) AS 'FULL NAME' FROM Worker;


-- USE OF DROP, DELETE AND TRUNCATE
-- delete table permentelly
DROP TABLE Worker;

-- DELETE FROM is used to delete data inside a table
DELETE FROM Worker;
-- TRUNCAT TABLE is used to delete data inside a table
TRUNCATE TABLE Worker; 










