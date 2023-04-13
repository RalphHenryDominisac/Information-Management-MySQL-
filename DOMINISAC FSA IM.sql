CREATE DATABASE finalexam;
USE finalexam;

-- Creating Tables ----------------------------------
CREATE TABLE bonus 
(name VARCHAR(10) PRIMARY KEY,
job VARCHAR(9), 
salary INT(11),
commission INT(11));

CREATE TABLE departments 
(deptnum INT(11) PRIMARY KEY,
deptname VARCHAR(14), 
location VARCHAR(13));

CREATE TABLE employees 
(empnum INT(11) PRIMARY KEY,
 name VARCHAR(10), 
job VARCHAR(15),
manager INT(11),
hiredate DATE,
salary INT(11),
commission INT(11),
deptnum INT(11));

CREATE TABLE salarygrade 
(bracket INT(11) PRIMARY KEY,
losalary INT(11), 
hisalary INT(11));


-- ---------------------------------------------
-- Inserting data to tables ------------------------------------------
INSERT INTO departments (deptnum, deptname, location)
 VALUES 
  (10, 'ACCOUNTING', 'TEXAS'),
  (20, 'FINANCE', 'FLORIDA'),
  (30, 'SALES', 'NEW YORK'),
  (40, 'IT', 'NEW JERSEY');
  
  
  
  INSERT INTO employees (empnum, name, job, manager, hiredate, salary, commission, deptnum)
 VALUES 
  (7369, 'MARVIN', 'ACCOUNTANT', 7902, '2019-10-17', 1800, null, 20),
  (7499, 'STEVE', 'SALES', 7698, '2019-05-20', 2600, 300, 30),
  (7521, 'NOAH', 'SALES', 7698, '2019-03-22', 2250, 500, 30),
  (7566, 'TERRANCE', 'MANAGER', 7839, '2019-03-02', 3975, null, 20),
  (7654, 'MARTIN', 'SALES', 7698, '2018-09-28', 2250, 1400, 30),
  (7698, 'RONIN', 'MANAGER', 7839, '2019-09-01', 3850, null, 30),
  (7782, 'LARRY', 'MANAGER', 7839, '2018-08-09', 3450, null, 10),
  (7788, 'WILSON', 'SECRETARY', 7566, '2020-02-09', 4000, null, 20),
  (7839, 'CARLO', 'PRESIDENT', null, '2017-12-17', 6000, null, 10),
  (7844, 'SKYLER', 'SALES', 7698, '2019-07-08', 2500, 0, 30),
  (7876, 'ADAMS', 'ACCOUNTANT', 7788, '2020-04-12', 2100, null, 20),
  (7900, 'CAMERON', 'ACCOUNTANT', 7698, '2018-11-03', 1950, null, 30),
  (7902, 'TRISTEN', 'SECRETARY', 7566, '2019-11-03', 4000, null, 20),
  (7934, 'CHASE', 'ACCOUNTANT', 7782, '2020-02-23', 2300, null, 10);
  
  
  INSERT INTO salarygrade  (bracket, losalary, hisalary)
 VALUES 
  (1, 1500, 2500),
  (2, 2501, 3800),
  (3, 3801, 4200),
  (4, 4201, 6000),
  (5, 6001, 9999);
  
  
  
-- SQL Queries: ----------------------------------
  -- 3
SELECT
    e.job,
	AVG(e.salary)
    
FROM employees e
GROUP BY e.job;


-- 4
SELECT
	e.name,
    e.job,
    e.salary

FROM employees e
WHERE (e.deptnum = 20 OR e.deptnum = 30) AND e.salary > 2350;


-- 5 
SELECT
	e.name,
    d.deptname,
    MAX(e.salary) AS salary

FROM employees e
JOIN departments d
	ON e.deptnum = d.deptnum
GROUP BY e.deptnum
ORDER BY salary DESC;


-- 6
SELECT
	e.name
  
FROM employees e
WHERE e.salary > (SELECT e.salary FROM employees e WHERE e.name = 'Larry');


-- 7
SELECT
	e1.name,
    d.deptname,
    e2.name AS name_colleague
    

FROM employees e1
JOIN departments d
	ON e1.deptnum = d.deptnum

JOIN employees e2
	ON e1.deptnum = e2.deptnum AND e1.name != e2.name AND e1.empnum < e2.empnum
ORDER BY e1.name, e2.name;


-- 8
SELECT
	e.name,
    sg.bracket
    
FROM employees e
JOIN salarygrade sg 
WHERE e.salary BETWEEN sg.losalary AND sg.hisalary;




-- 9 
SELECT
	e.name,
    e.salary,
    e.salary * 1.20 AS NEW_SALARY,
    (e.salary * 1.20) - e.salary AS Salary_Increase
    
FROM employees e
WHERE (e.empnum IN(SELECT e.manager FROM employees e));








