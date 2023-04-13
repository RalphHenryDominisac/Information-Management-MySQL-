USE premiere;

-- 1
SELECT 
	c.CUSTOMER_NUM,
    c.CUSTOMER_NAME

FROM customer c
JOIN orders o
	ON c.CUSTOMER_NUM = o.CUSTOMER_NUM

JOIN order_line ol
	ON o.ORDER_NUM = ol.ORDER_NUM

JOIN part p
	ON ol.PART_NUM = p.PART_NUM

WHERE p.DESCRIPTION = 'Gas Range';


-- 2
SELECT
	p1.PART_NUM AS PART_NUM_A,
    p1.DESCRIPTION AS DESCRIPTION_A,
    p1.CLASS AS CLASS_A,
    
    p2.PART_NUM AS PART_NUM_B,
    p2.DESCRIPTION AS DESCRIPTION_B,
    p2.CLASS AS CLASS_B

FROM part p1, part p2
WHERE p1.CLASS = p2.CLASS AND p1.PART_NUM < p2.PART_NUM
ORDER BY p1.CLASS, p2.CLASS;



-- 3
SELECT
	o.ORDER_NUM,
    o.ORDER_DATE
    
FROM orders o
JOIN customer c
	ON o.CUSTOMER_NUM = c.CUSTOMER_NUM
WHERE c.CUSTOMER_NAME = 'Johnson\'s Department Store';


-- 4
SELECT
	o.ORDER_NUM,
    o.ORDER_DATE
    
FROM orders o
JOIN order_line ol
	ON o.ORDER_NUM = ol.ORDER_NUM
    
JOIN part p
	ON ol.PART_NUM = p.PART_NUM

WHERE p.DESCRIPTION = 'Iron';


-- 5
SELECT
	DISTINCT(o.ORDER_NUM),
    o.ORDER_DATE
    
FROM orders o
JOIN customer c
	ON o.CUSTOMER_NUM = c.CUSTOMER_NUM

JOIN order_line ol
	ON o.ORDER_NUM = ol.ORDER_NUM

JOIN part p
	ON ol.PART_NUM = p.PART_NUM
    
WHERE c.CUSTOMER_NAME = 'Johnson\'s Department Store' OR p.DESCRIPTION = 'Gas Range';


-- 6
SELECT
	DISTINCT(o.ORDER_NUM),
    o.ORDER_DATE
    
FROM orders o
JOIN customer c
	ON o.CUSTOMER_NUM = c.CUSTOMER_NUM

JOIN order_line ol
	ON o.ORDER_NUM = ol.ORDER_NUM

JOIN part p
	ON ol.PART_NUM = p.PART_NUM
    
WHERE c.CUSTOMER_NAME = 'Johnson\'s Department Store' AND p.DESCRIPTION = 'Gas Range';


-- 7
SELECT
	DISTINCT(o.ORDER_NUM),   
    o.ORDER_DATE
    
FROM orders o
JOIN customer c
	ON o.CUSTOMER_NUM = c.CUSTOMER_NUM

JOIN order_line ol
	ON o.ORDER_NUM = ol.ORDER_NUM

JOIN part p
	ON ol.PART_NUM = p.PART_NUM
    
WHERE c.CUSTOMER_NAME = 'Johnson\'s Department Store' AND NOT p.DESCRIPTION = 'Gas Range';


-- 8
SELECT
	p.PART_NUM,
    p.DESCRIPTION,
    p.PRICE,
    p.CLASS

FROM part p
WHERE p.PRICE > ALL( SELECT p.PRICE FROM part p  WHERE p.CLASS = 'AP');


-- 9
SELECT
	p.PART_NUM,
    p.DESCRIPTION,
    p.PRICE,
    p.CLASS

FROM part p
WHERE p.PRICE > ANY( SELECT p.PRICE FROM part p  WHERE p.CLASS = 'AP');


-- 10
SELECT
	p.PART_NUM,
    p.DESCRIPTION,
    p.ON_HAND,
    ol.ORDER_NUM,
    ol.NUM_ORDERED
    
FROM part p
LEFT JOIN order_line ol
	ON p.PART_NUM = ol.PART_NUM
ORDER BY p.PART_NUM;
































