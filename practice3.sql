CREATE DATABASE ORG;
USE ORG;

CREATE TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO worker
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
    
    
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);


INSERT INTO Bonus
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (001, 5000, '16-02-20'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');


CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);


INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (001, 'Manager', '2016-02-20 00.00.00'),
    (002, 'Executive', '2016-06-11 00.00.00'),
    (008, 'Executive', '2016-06-11 00.00.00'),
    (005, 'Manager', '2016-06-11 00.00.00'),
    (004, 'Asst. Manager', '2016-06-11 00.00.00'),
    (007, 'Executive', '2016-06-11 00.00.00'),
    (006, 'Lead', '2016-06-11 00.00.00'),
    (003, 'Lead', '2016-06-11 00.00.00');


CREATE TABLE Customer (
	id integer PRIMARY KEY,
    cname VARCHAR(255),
    Address VARCHAR(255),
    Gender CHAR(2),
    City VARCHAR(255),
    Pincode integer
);
-- USE TEMP;
-- CREATE DATABASE TEMP;

INSERT INTO CUSTOMER VALUES
(1, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(2, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
(3, 'Neelabh Sukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
(4, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
(5, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 144001),
(6, 'Ram Kumari', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

INSERT INTO CUSTOMER(id, cname) VALUES (121,'bob');

INSERT INTO CUSTOMER VALUES
(1, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002);

SELECT * FROM customer;

SELECT * FROM WORKER;
SELECT * FROM CUSTOMER WHERE PINCODE IS NULL;


USE TEMP;

CREATE TABLE Order_Details (
	Order_id INT PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id) ON DELETE SET NULL
);

INSERT INTO Order_Details VALUES (1, '2019-03-11', 1);
INSERT INTO Order_Details VALUES (2, '2019-03-11', 1);

SELECT * FROM ORDER_DETAILS;

CREATE TABLE ACCOUNT (
	ID INT PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    BALANCE INT NOT NULL DEFAULT 0
);

INSERT INTO ACCOUNT(ID, NAME) VALUES (1, 'A');
INSERT INTO ACCOUNT(ID, NAME, BALANCE) VALUES (2, 'B', 100);

DROP TABLE ACCOUNT;










