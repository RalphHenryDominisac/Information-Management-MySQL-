USE premiere;
-- 1
SELECT
	p.PART_NUM,
    p.DESCRIPTION

FROM part p
WHERE p.CLASS IN ('AP', 'SG');



-- 2
SELECT
	c.CUSTOMER_NUM,
    c.CUSTOMER_NAME

FROM customer c
WHERE c.CUSTOMER_NAME REGEXP '^[K]';


-- 3
SELECT *

FROM part p
ORDER BY p.DESCRIPTION;


-- 4
SELECT *          

FROM customer c
WHERE c.BALANCE > c.CREDIT_LIMIT;
                         -- From the 4th query, its says only 1 row but still there exists another that has balance more than their credit limit (so I think it should be 2 rows)


-- 5 
SELECT     
  SUM(c.BALANCE) AS TOTAL

FROM customer c
WHERE c.REP_NUM = 65 AND (c.BALANCE < c.CREDIT_LIMIT);


-- 6                 
SELECT
	p.PART_NUM,
    p.DESCRIPTION,
    p.ON_HAND

FROM part p
WHERE p.ON_HAND > (SELECT AVG(ON_HAND) FROM part);


-- 7
SELECT
	p.PRICE

FROM part p
WHERE p.PRICE = (SELECT MAX(PRICE) FROM part); 


-- 8
SELECT
	p.PART_NUM,
    p.DESCRIPTION,
    p.PRICE

FROM part p
WHERE p.PRICE = (SELECT MAX(PRICE) FROM part); 



-- 9                   
SELECT
	c.REP_NUM,
	SUM(c.BALANCE) AS SUM_BALANCE
    
FROM customer c
GROUP BY c.REP_NUM  
ORDER BY c.REP_NUM;


-- 10
SELECT
	p.PART_NUM

FROM part p
WHERE p.DESCRIPTION = 'unknown' OR p.DESCRIPTION IS NULL;



