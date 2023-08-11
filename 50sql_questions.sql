USE org;
SELECT * FROM org.worker;

-- Q1 Write an SQL query to fetch FIRST_NAME from worker table using the alias name as <worker_name>.
SELECT first_name AS WORKER_NAME FROM worker;

-- Q2 Write an SQL query to fetch FIRST_NAME from worker table in upper case.
SELECT UPPER(first_name) FROM worker; 

-- Q3 Write an SQL query to fetch unique values of DEPARTMENT from worker table.
SELECT DISTINCT department FROM worker;

-- Q4 Write an SQL query to print the first 3 characters of FIRST_NAME from worker table.
SELECT SUBSTRING(first_name, 1, 3) FROM worker;

-- Q5 Write an SQL query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table.
SELECT INSTR(first_name, 'b') FROM worker WHERE first_name = 'Amitabh';

-- Q6 Write an SQL query to print the FIRST_NAME from worker table after romoving white space from right side.
SELECT RTRIM(first_name) FROM worker;

-- Q7 Write an SQL query to print the FIRST_NAME from worker table after romoving white space from left side.
SELECT LTRIM(first_name) FROM worker;

-- Q8 Write an SQL query that fatches the unique values of DEPARTMENT from worker table and print its length.
SELECT DISTINCT department, LENGTH(department) FROM worker;

-- Q9 Write an SQL query to print the FIRST_NAME from worker table after replacing 'a' with 'A'.
SELECT REPLACE(first_name, 'a', 'A') FROM worker;

-- Q10 Write an SQL query to print the FIRST_NAME and LAST_NAME from worker table into a single column COMPLETE_NAME.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM worker;

-- Q11 Write an SQL query to print all worker details from the worker table order by FIRST_NAME Ascending.
SELECT * FROM worker ORDER BY first_name ASC;

-- Q12 Write an SQL query to print all worker details from the worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM worker ORDER BY first_name ASC , department DESC;

-- Q13 Write an SQL query to print details from workers with the first name as 'Vipul' and 'Satish' from worker table.
SELECT * FROM worker WHERE first_name IN ('Vipul', 'Satish');

-- Q14 Write an SQL query to print details from workers excluding first name as 'Vipul' and 'Satish' from worker table.
SELECT * FROM worker WHERE first_name NOT IN ('Vipul', 'Satish');

-- Q15 Write an SQL query to print details from workers with department name as 'Admin*'.
SELECT * FROM worker WHERE department LIKE 'Admin%';

-- Q16 Write an SQL query to print details from workers whose first_name contains 'a'.
SELECT * FROM worker WHERE first_name LIKE '%a%';

-- Q17 Write an SQL query to print details from workers whose first_name ends with 'a'.
SELECT * FROM worker WHERE first_name LIKE '%a';

-- Q18 Write an SQL query to print details from workers whose first_name ends with 'h' and contains six alphabets.
SELECT * FROM worker WHERE first_name LIKE '_____h';

-- Q19 Write an SQL query to print details from workers whose salary lies between 100000 and 500000.
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;

-- Q20 Write an SQL query to print details from workers who have joined in fed 2014.
SELECT * FROM worker WHERE YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02;

-- Q21 Write an SQL query to fetch the count of emloyees working in department 'Admin'.
SELECT department, COUNT(worker_id) FROM worker WHERE department = 'Admin';

-- Q22 Write an SQL query to fetch workers full names with salary >= 50000 and <= 100000.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM worker 
WHERE salary BETWEEN 50000 AND 100000;

-- Q23 Write an SQL query to fetch no. of workers for each department in the desecending order.
SELECT department, COUNT(worker_id) AS no_of_workers FROM worker 
GROUP BY department ORDER BY no_of_workers DESC;

-- Q24 Write an SQL query to print details from workers who are also Managers.
SELECT w.* FROM worker AS w INNER JOIN title AS t ON w.worker_id = t.worker_ref_id 
WHERE t.worker_title = 'manager';

-- Q25 Write an SQL query to fetch number (more than 1) of different titles in the org;
SELECT worker_title, COUNT(*) AS count FROM title GROUP BY worker_title HAVING count > 1;

-- Q26 Write an SQL query to show only odd rows from a table.
-- SELECT * FROM worker WHERE worker_id % 2;
-- SELECT * FROM worker WHERE MOD(worker_id, 2) != 0;
SELECT * FROM worker WHERE MOD(worker_id, 2) <> 0;

-- Q27 Write an SQL query to show only even rows from a table.
SELECT * FROM worker WHERE MOD(worker_id, 2) = 0;

-- Q28 Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE worker;
INSERT INTO worker_clone SELECT * FROM worker;

-- Q29 Write an SQL query to fetch intersecting records in two tables.
SELECT worker.* FROM worker INNER JOIN worker_clone USING(worker_id);

-- Q30 Write an SQL query to show records from one table that another table does not have.
SELECT worker.* FROM worker LEFT JOIN worker_clone USING(worker_id) 
WHERE worker_clone.worker_id IS NULL;

-- Q31 Write an SQL query to show the current date and time;
SELECT now();

-- Q32 Write an SQL query to show the top n (say 5) records of a table oredr by descending salary.
SELECT * FROM worker ORDER BY salary DESC LIMIT 5;

-- Q33 Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM worker ORDER BY salary DESC LIMIT 4,1;

-- Q34 Write an SQL query to determine the 5th highest salary without using limit keyword.
-- using corelated subquery
SELECT w1.* FROM worker w1
WHERE 5 = (
SELECT COUNT(DISTINCT(salary))
FROM worker w2 
WHERE w2.salary >= w1.salary
);

-- Q35 Write an SQL query to fetch the list of employees with the same salary.
SELECT w1.* FROM worker w1, worker w2 WHERE w1.salary = w2.salary AND w1.worker_id != w2.worker_id;

-- Q36 Write an SQL query to show the second highest salary from a table using sub query.
SELECT w.* , MAX(salary) FROM worker w WHERE salary NOT IN (
SELECT MAX(salary) FROM worker 
);

-- Q37 Write an SQL query to show one row twice in results from a table.
SELECT * FROM worker
UNION ALL
SELECT * FROM worker ORDER BY worker_id;

-- Q38 Write an SQL query to list worker_id who does not get bonus.
SELECT w.* FROM worker w WHERE worker_id NOT IN (
SELECT worker_ref_id FROM bonus
);

-- Q39 Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM worker WHERE worker_id <= (SELECT COUNT(worker_id)/2 FROM worker);

-- Q40 Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT department, COUNT(department) AS dep_count FROM worker GROUP BY department HAVING dep_count < 4;

-- Q41 Write an SQL query to show all departments along with the number of people in there.
SELECT department, COUNT(department) AS dep_count FROM worker GROUP BY department;

-- Q42 Write an SQL query to show the last record from a table.
SELECT * FROM worker WHERE worker_id = (SELECT MAX(worker_id) FROM worker);

-- Q43 Write an SQL query to fetch the first row of a table.
SELECT * FROM worker WHERE worker_id = (SELECT MIN(worker_id) FROM worker);

-- Q44 Write an SQL query to fetch the last five records from a table.
(SELECT * FROM worker ORDER BY worker_id DESC LIMIT 5) ORDER BY worker_id;

-- Q45 Write an SQL query to print the name of employees having the highest salary in each department;
SELECT w.department, w.first_name, w.salary FROM 
(SELECT MAX(salary) AS max_sal, department FROM worker GROUP BY department) temp 
INNER JOIN worker w ON temp.department = w.department AND temp.max_sal = w.salary;

-- Q46 Write an SQL query to fetch three max salaries from a table.
-- USING CORELATED SUB QUERY
SELECT DISTINCT salary FROM worker w1
WHERE 3 >= (SELECT COUNT(DISTINCT salary) FROM worker w2 WHERE w1.salary <= w2.salary) 
ORDER BY w1.salary DESC;

-- USING LIMIT CLAUS
SELECT DISTINCT salary FROM worker ORDER BY salary DESC LIMIT 3;

-- Q47 Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT salary FROM worker w1
WHERE 3 >= (SELECT COUNT(DISTINCT salary) FROM worker w2 WHERE w1.salary >= w2.salary) 
ORDER BY w1.salary;

-- Q48 Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT salary FROM worker w1
WHERE n >= (SELECT COUNT(DISTINCT salary) FROM worker w2 WHERE w1.salary <= w2.salary) 
ORDER BY w1.salary DESC;

-- Q49 Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT department, SUM(salary) FROM worker GROUP BY department;

-- Q50 Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT first_name, salary FROM worker WHERE salary = (SELECT MAX(salary) FROM worker);
