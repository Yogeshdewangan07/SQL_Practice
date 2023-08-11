CREATE DATABASE DEMO;
USE DEMO;

DROP TABLE Employee;
SELECT * FROM Employee;

CREATE TABLE Employee(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fname CHAR(25),
lname CHAR(25),
age INT(15),
emailId VARCHAR(255),
phoneNo INT(15),
city VARCHAR(255)
);

INSERT INTO Employee
	(id, fname, lname, age, emailId, phoneNo, city) VALUES
    (1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
    (2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
    (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
    (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
    (5, 'PK', 'Panday', 21, 'pk@gmail.com', 555, 'Jaipur');
 
 
 CREATE TABLE Client(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
first_name CHAR(25),
last_name CHAR(25),
age INT(15),
emailId VARCHAR(255),
phoneNo INT(15),
city VARCHAR(255),
empId INT(15),
FOREIGN KEY Client(empId) 
REFERENCES Employee(id)
);


INSERT INTO Client
	(id, first_name, last_name, age, emailId, phoneNo, city, empId) VALUES
    (1, 'Mac', 'Rogers', 47, 'mac@gmail.com', 333, 'Kolkate', 3),
    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkate', 3),
    (3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
    (4, 'Sushant', 'Aggarwal', 23, 'sushant@gmail.com', 45454, 'Hyderabad', 5),
    (5, 'Pratap', 'Singh', 36, 'pratap@gmail.com', 77767, 'Mumbai', 2);


CREATE TABLE Project(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
empId INT(15),
name CHAR(25),
startdate DATE,
clientId INT(15),
FOREIGN KEY (empId) REFERENCES Employee(id),
FOREIGN KEY (clientId) REFERENCES Client(id)
);

INSERT INTO Project
	(id, empId, name, startdate, clientId) VALUES
    (1, 1, 'A', '2021-04-21', 3),
    (2, 2, 'B', '2021-03-12', 1),
    (3, 3, 'C', '2021-01-16', 5),
    (4, 4, 'D', '2021-04-27', 2),
    (5, 5, 'E', '2021-05-01', 4);



-- SQL JOIN QUERY
-- INNER JOIN
-- Enlist all the employee id's, names along with the project allocated to them
SELECT * FROM employee as e 
INNER JOIN project as P ON e.id = p.empId;

SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e 
INNER JOIN project as P ON e.id = p.empId;

SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e, 
project as P WHERE e.id = p.empId;

-- Fetch out all the employee id's and their contact details who have been working
-- From jaipur with the clients name working in Hyderabad
SELECT e.id, e.emailId, e.phoneNo, c.first_name, c.last_name FROM EMPLOYEE AS E 
INNER JOIN CLIENT AS C ON e.id = c.empId WHERE e.city = 'jaipur' and c.city = 'hyderabad';

-- LEFT JOIN
-- Fetch out each project allocated to each employee
SELECT * FROM employee as e 
LEFT JOIN project as P ON e.id = p.empId;

-- RIGHT JOIN
-- List out all the project's along with the employee's name and their respected allocated email id
SELECT p.id, p.name, e.fname, e.lname, e.emailId FROM employee AS e
RIGHT JOIN  Project as p  ON e.ID = p.EMPID;

-- CROSS JOIN
-- List out all the combinations possible for the employee's name and project that can exist
SELECT e.id, e.fname, e.lname, p.name FROM employee as e
CROSS JOIN project as p;

-- SELF JOIN
SELECT a.fname AS EMPLOYEE_NAME1, b.fname AS EMPLOYEE_NAME2, a.city 
FROM employee a, employee b WHERE a.city = b.city;



CREATE TABLE dept1 (
empid INT,
name VARCHAR(25),
role VARCHAR(25)
);

INSERT INTO dept1(empid, name, role) 
values (1, 'A', 'engineer'),
		(2, 'B', 'salesman'),
        (3, 'C', 'manager'),
        (4, 'D', 'salesman'),
        (5, 'E', 'engineer');

CREATE TABLE dept2 (
empid INT,
name VARCHAR(25),
role VARCHAR(25)
);

INSERT INTO dept2(empid, name, role) 
values (3, 'C', 'manager'),
        (6, 'F', 'marketing'),
        (7, 'G', 'salesman');


-- SET OPERATIONS
-- List out all the employees in the company
SELECT * FROM dept1
UNION
SELECT * FROM dept2;

-- List out all the employees in all departments who works as salesman
-- UNION OPERATION
SELECT * FROM dept1 WHERE role = 'salesman'
UNION
SELECT * FROM dept2 WHERE role = 'salesman';

-- List out all the employees who work for both departments
-- INTERSECT OPERATION
SELECT * FROM dept1 INNER JOIN dept2 using (empid);

-- List out all the employees working in dept1 but not in dept2
-- MINUS OPERATION
SELECT dept1.* FROM dept1 LEFT JOIN dept2 using(empid)
WHERE dept2.empid is null;


-- SUB QUERIES
-- WHERE clause same table
-- employees with age > 30
SELECT * FROM employee WHERE age IN (SELECT age FROM employee WHERE age > 30);

-- WHERE clause different table
-- emp details working in more than 1 project
SELECT * FROM employee WHERE id IN (
SELECT empId FROM project GROUP BY empId HAVING COUNT(empId) > 1
); 


-- SINGLE VALUE SUBQUERY
-- emp details having age > avg(age)
SELECT * FROM employee WHERE age > (SELECT avg(age) FROM employee);

-- FROM CLAUSE - DERIVED TABLES
-- select max age person whose first name contains 'a'
SELECT MAX(age) FROM (SELECT * FROM EMPLOYEE WHERE fname LIKE '%a%') AS TEMP1;

-- CORELATED SUBQUERY
-- find 3rd oldest employee
SELECT * FROM employee e1
WHERE 3 = (
SELECT COUNT(e2.age)
FROM employee e2
WHERE e2.age >= e1.age
);


-- VIEW
SELECT * FROM EMPLOYEE;

-- creating a view
CREATE VIEW Custom_view AS SELECT id, fname, lname FROM EMPLOYEE;

-- viewing from view
SELECT * FROM  Custom_view;

-- ALTER THE VIEW
ALTER VIEW Custom_view AS SELECT id, fname, emailId FROM EMPLOYEE;

-- DROPING THE VIEW
DROP VIEW IF EXISTS Custom_view;

