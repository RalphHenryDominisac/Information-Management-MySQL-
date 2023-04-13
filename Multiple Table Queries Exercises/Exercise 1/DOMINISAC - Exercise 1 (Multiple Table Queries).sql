USE ALEXAMARA;

-- 1      
SELECT
	o.FIRST_NAME,
    o.LAST_NAME


FROM owner o
WHERE EXISTS (SELECT *  FROM marina_slip m  WHERE o.OWNER_NUM = m.OWNER_NUM AND m.LENGTH = 40);



-- 2     
SELECT 
	m1.BOAT_NAME, 
    m2.BOAT_NAME
    
FROM marina_slip m1
JOIN marina_slip m2
	ON m1.BOAT_TYPE = m2.BOAT_TYPE AND m1.BOAT_NAME != m2.BOAT_NAME AND m1.SLIP_ID < m2.SLIP_ID
ORDER BY m1.BOAT_NAME, m2.BOAT_NAME;


-- 3   
 SELECT
	 ms.BOAT_NAME,
     ms.OWNER_NUM,
     o.LAST_NAME,
     o.FIRST_NAME
    
FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE ms.MARINA_NUM = 1;

-- 4    
SELECT
	ms.MARINA_NUM,
    MS.SLIP_NUM,
    MS.BOAT_NAME


FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE o.CITY = 'Glander Bay' OR ms.BOAT_TYPE = 'Sprite 4000';



-- 5       
SELECT
	ms.MARINA_NUM,
    MS.SLIP_NUM,
    MS.BOAT_NAME

FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE o.CITY = 'Glander Bay' AND ms.BOAT_TYPE = 'Sprite 4000';
-- Owners who live in Glander Bay are AN75(Anderson Bill)
-- and SM72(Smeltz Becky and Dave), AN75 owns a boat whose type
-- is Sprite 4000 while SM72 owns a boat whose type is Dolphin 25

-- There are only two owners of Sprite 4000, these are AN75(Anderson Bill)
-- and KE22(Kelly Alyssa) , AN75 lives in Glander bay but KE22 lives in Bowton

-- Thus, the query result should have only 1 row and that is for AN75
-- that has marina num: 1    slip num: A1   and boat name: Anderson II


-- 6    
SELECT
	ms.MARINA_NUM,
    MS.SLIP_NUM,
    MS.BOAT_NAME

FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE o.CITY = 'Glander Bay' AND NOT ms.BOAT_TYPE = 'Sprite 4000';
-- Owners who live in Glander Bay are AN75(Anderson Bill)
-- and SM72(Smeltz Becky and Dave),

-- Both owners have boats whose type is not Sprite 4000
-- AN75 has a type Sprite 3000 while SM72 has a type Dolphin 25
-- Thus, the query result should have 2 rows
-- both for AN75 and SM72

-- I think query 5 and 6 should interchanged their expected row results from the given steps.


-- 7      
SELECT
	sr.SERVICE_ID,
    sr.SLIP_ID

FROM service_request sr
WHERE sr.EST_HOURS > ANY(SELECT sr.EST_HOURS FROM service_request sr WHERE sr.CATEGORY_NUM = 3);


-- 8   
SELECT
	sr.SERVICE_ID,
    sr.SLIP_ID

FROM service_request sr
WHERE sr.EST_HOURS > ALL(SELECT sr.EST_HOURS FROM service_request sr WHERE sr.CATEGORY_NUM = 3);


-- 9    
SELECT
	ms.SLIP_ID,
    BOAT_NAME,
    OWNER_NUM,
    sr.SERVICE_ID,
    EST_HOURS,
    SPENT_HOURS

FROM marina_slip ms, service_request sr, service_category sc
WHERE ms.SLIP_ID = sr.SLIP_ID AND
	  sc.CATEGORY_NUM = sr.CATEGORY_NUM AND
      sr.CATEGORY_NUM = 2;
 
 
 -- 10
  SELECT
	 ms.SLIP_ID,
     BOAT_NAME,
	 OWNER_NUM,
	 sr.SERVICE_ID,
	 EST_HOURS,
	 SPENT_HOURS

   FROM service_request sr
   LEFT JOIN marina_slip ms 
	   ON sr.SLIP_ID = ms.SLIP_ID
     WHERE sr.CATEGORY_NUM = 2 OR sr.CATEGORY_NUM != 2;
     
     
     





      
      
      
 
      
      
      
      
      





	
    


 
 











   









