-- 11    (COMPILE ALL THE QUERIES IN THIS QUERY TAB)
USE alexamara;
-- 1
SELECT 
	o.OWNER_NUM,
    o.LAST_NAME,
    o.FIRST_NAME
FROM owner o;


-- 2
SELECT *

FROM marina;


-- 3
SELECT
	o.LAST_NAME,
    o.FIRST_NAME
	
FROM owner o
WHERE o.CITY = 'Bowton';


-- 4
SELECT
	o.LAST_NAME,
    o.FIRST_NAME
	
FROM owner o
WHERE o.CITY != 'Bowton';


-- 5
SELECT 
	ms.MARINA_NUM,
    ms.SLIP_NUM

FROM marina_slip ms
WHERE ms.LENGTH <= 30;


-- 6
SELECT 
	ms.MARINA_NUM,
    ms.SLIP_NUM

FROM marina_slip ms
WHERE ms.BOAT_TYPE = 'Dolphin 28';


-- 7
SELECT
	ms.SLIP_NUM

FROM marina_slip ms
WHERE ms.BOAT_TYPE = 'Dolphin 28' AND ms.MARINA_NUM = 1;


-- 8
SELECT
	ms.BOAT_NAME

FROM marina_slip ms
WHERE ms.LENGTH BETWEEN 25 AND 30;


-- 9
SELECT
	ms.SLIP_NUM

FROM marina_slip ms
WHERE ms.MARINA_NUM = 1 AND ms.RENTAL_FEE < 3000;



-- 10
SELECT
	ms.SLIP_ID, 
    sr.CATEGORY_NUM,
    sr.EST_HOURS,
    (sr.EST_HOURS * 60) AS ESTIMATED_COST
    

FROM marina_slip ms

JOIN service_request sr 
	ON ms.SLIP_ID = sr.CATEGORY_NUM;

    







    