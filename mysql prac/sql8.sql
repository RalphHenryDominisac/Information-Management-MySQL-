USE alexamara;

-- 1 -----------
SELECT 
	o.FIRST_NAME,
    o.LAST_NAME


FROM owner o
WHERE EXISTS (SELECT *  FROM marina_slip m  WHERE o.OWNER_NUM = m.OWNER_NUM AND m.LENGTH = 40);

-- 2 -------------
SELECT
	ms1.BOAT_NAME,
    ms2.BOAT_NAME

FROM marina_slip ms1
JOIN marina_slip ms2
	ON ms1.BOAT_TYPE = ms2.BOAT_TYPE AND ms1.BOAT_NAME != ms2.BOAT_NAME AND ms1.SLIP_ID < ms2.SLIP_ID
ORDER BY ms1.BOAT_NAME, ms2.BOAT_NAME;

-- 3-------------------
SELECT 
	ms.BOAT_NAME,
    ms.OWNER_NUM,
    o.LAST_NAME,
    o.FIRST_NAME

FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE ms.MARINA_NUM = 1;


-- 4 --------------
SELECT
	ms.MARINA_NUM,
    ms.SLIP_NUM,
    ms.BOAT_NAME

FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE o.CITY = 'Glander Bay' OR ms.BOAT_TYPE = 'Sprite 4000';


-- 5 ------------
SELECT
	ms.MARINA_NUM,
    ms.SLIP_NUM,
    ms.BOAT_NAME

FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE o.CITY = 'Glander Bay' AND ms.BOAT_TYPE = 'Sprite 4000';

-- 6 ----------------------------
SELECT
	ms.MARINA_NUM,
    ms.SLIP_NUM,
    ms.BOAT_NAME

FROM marina_slip ms
JOIN owner o
	ON ms.OWNER_NUM = o.OWNER_NUM
WHERE o.CITY = 'Glander Bay' AND ms.BOAT_TYPE != 'Sprite 4000';

-- 7------------------------------
SELECT
	sr.SERVICE_ID,
    sr.SLIP_ID

FROM service_request sr
WHERE sr.EST_HOURS > ANY( SELECT sr.EST_HOURS   FROM service_request sr   WHERE sr.CATEGORY_NUM = 3);


-- 8 ----------------------
SELECT
	sr.SERVICE_ID,
    sr.SLIP_ID

FROM service_request sr
WHERE sr.EST_HOURS > ALL( SELECT sr.EST_HOURS   FROM service_request sr   WHERE sr.CATEGORY_NUM = 3);

-- 9 ---------------------------
SELECT
    sr.SLIP_ID,
    ms.BOAT_NAME,
    ms.OWNER_NUM,
    sr.SERVICE_ID,
    sr.EST_HOURS,
    sr.SPENT_HOURS

FROM service_request sr
JOIN marina_slip ms
	ON sr.SLIP_ID = ms.SLIP_ID
WHERE sr.CATEGORY_NUM = 2;

-- 10------------------
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
    









