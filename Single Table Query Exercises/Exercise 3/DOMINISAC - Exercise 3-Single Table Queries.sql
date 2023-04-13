USE scott_mysql;
-- 1
SELECT
	e.ENAME,
    e.SAL
	
FROM emp e
WHERE e.SAL > 2850;


-- 2
SELECT
	e.ENAME,
    e.DEPTNO
	
FROM emp e
WHERE e.EMPNO = 7566;


-- 3
SELECT
	e.ENAME,
    e.SAL
	
FROM emp e
WHERE e.SAL NOT BETWEEN 1500 AND 2850;


-- 4
SELECT
	e.ENAME,
    e.JOB,
    e.HIREDATE
	
FROM emp e
WHERE e.HIREDATE BETWEEN '1981-02-20 00:00:00' AND '1981-05-01 00:00:00'
ORDER BY e.HIREDATE;  -- ORDER BY (has default function by ascending order) 


-- 5
SELECT
	e.ENAME,
    e.DEPTNO
	
FROM emp e
WHERE e.DEPTNO = 10 OR e.DEPTNO = 30
ORDER BY e.ENAME;


-- 6
SELECT
	e.ENAME AS Employee,
    e.SAL AS Monthly_Salary
	
FROM emp e
WHERE e.SAL > 1500 AND (e.DEPTNO = 10 OR e.DEPTNO = 30);



-- 7 
SELECT
	e.ENAME,
    e.HIREDATE

FROM emp e
WHERE YEAR(e.HIREDATE) = '1982';


-- 8
SELECT
	e.ENAME,
    e.JOB

FROM emp e
WHERE e.MGR IS NULL;


-- 9
SELECT
	e.ENAME,
    e.SAL,
    e.COMM

FROM emp e
WHERE e.COMM IS NOT NULL AND e.COMM != 0
ORDER BY e.SAL DESC, e.COMM DESC;


-- 10
SELECT
	e.ENAME

FROM emp e
WHERE e.ENAME LIKE '__A%';











































	