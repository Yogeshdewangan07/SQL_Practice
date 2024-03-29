SELECT first_name, salary FROM WORKER;

SELECT 44+11;

SELECT now();
SELECT curdate();
SELECT curtime();

SELECT lcase('MYSQL');
SELECT ucase('mysql');

SELECT * FROM worker WHERE SALARY < 80000;

-- USE OF WHERE CLAUSE
SELECT * FROM worker WHERE DEPARTMENT = 'HR';

-- USE OF BETWEEN OPERATOR
SELECT * FROM WORKER WHERE SALARY BETWEEN 80000 AND 300000;
SELECT * FROM WORKER WHERE SALARY NOT BETWEEN 100000 AND 300000;

-- REDURE OR STATEMENT
-- HR, ADMIN
SELECT * FROM WORKER WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN';

-- BETTER WAY
SELECT * FROM WORKER WHERE DEPARTMENT IN ('HR', 'ADMIN', 'ACCOUNT');

-- USE OF NOT
SELECT * FROM WORKER WHERE DEPARTMENT NOT IN ('HR', 'ADMIN');
SELECT * FROM WORKER WHERE NOT DEPARTMENT='ADMIN'; 

-- WILDCARD
SELECT FIRST_NAME FROM WORKER WHERE FIRST_NAME NOT LIKE '%ik%';


-- SORTING USING ORDER BY
SELECT * FROM WORKER ORDER BY SALARY ASC;
SELECT * FROM WORKER ORDER BY SALARY DESC;

-- DISTINCT
SELECT DISTINCT DEPARTMENT FROM WORKER;

-- GROUP BY
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS TOTAL_NUMBER FROM WORKER GROUP BY DEPARTMENT;

-- USING AGGREGATE FUNCTION WITH SALARY GROUP BY DEPARTMENT
SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;

SELECT DEPARTMENT, MIN(SALARY) AS MINIMUM_SALARY FROM WORKER GROUP BY DEPARTMENT;

SELECT DEPARTMENT, MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;

SELECT DEPARTMENT, SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;


-- GROUP BY WITH HAVING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)<4;








