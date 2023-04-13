USE tennis;

-- 1
SELECT
	p.PLAYERNO

FROM players p
WHERE YEAR(p.BIRTH_DATE) = (SELECT YEAR(p.BIRTH_DATE) FROM players p WHERE p.PLAYERNO = 39) 
                            AND NOT p.PLAYERNO = 39;


-- 2
SELECT
	t.TEAMNO

FROM teams t
JOIN players p
	ON t.PLAYERNO = p.PLAYERNO
WHERE p.NAME = 'Parmenter' AND p.INITIALS = 'R';


-- 3
SELECT
	pl.PAYMENTNO

FROM penalties pl
WHERE pl.AMOUNT < (SELECT pl.AMOUNT FROM penalties pl  WHERE pl.PAYMENTNO = 8);

-- numbers of the penalties that are lower than the penalties with payment number 8 are 4, 5, 6, 7
-- thus rows should be 4



-- 4
SELECT
	m.MATCHNO,
    m.PLAYERNO,
    m.TEAMNO,
    p.NAME,
    t.DIVISION
    

FROM matches m
JOIN players p
	ON m.PLAYERNO = p.PLAYERNO

JOIN teams t
	ON m.TEAMNO = t.TEAMNO;
    
    
-- 5
SELECT
	pl.PAYMENTNO,
    pl.PLAYERNO,
    pl.PAYMENT_DATE
    
FROM penalties pl
JOIN players p
	ON pl.PLAYERNO = p.PLAYERNO
WHERE YEAR(pl.PAYMENT_DATE) = p.JOINED;


-- 6
SELECT
	p.PLAYERNO,
    p.NAME,
    pl.AMOUNT
    
FROM players p
JOIN penalties pl
	ON p.PLAYERNO = pl.PLAYERNO
WHERE p.BIRTH_DATE > '1920-06-30';


-- 7
SELECT
	p.PLAYERNO,
    p.NAME,
    t.TEAMNO,
    t.DIVISION
    
FROM teams t
RIGHT OUTER JOIN players p 
	ON t.PLAYERNO = p.PLAYERNO  
ORDER BY PLAYERNO;


-- 8
  SELECT
	  p.BIRTH_DATE AS ALL_DATES
  FROM players p
  
  UNION
  
  SELECT 
	pl.PAYMENT_DATE
  FROM penalties pl;
  
  
  -- 9
  SELECT
	TEAMNO,
    COUNT(*) AS MATCHES_PLAYED

FROM matches m
WHERE TEAMNO IN (SELECT TEAMNO FROM TEAMS  INNER JOIN players  ON TEAMS.PLAYERNO = PLAYERS.PLAYERNO    
                 WHERE TOWN = 'Eltham')
GROUP BY TEAMNO;


-- 10
SELECT
	t.TEAMNO,
	t.DIVISION,
    SUM(m.WON) AS TOTAL_NUM_SETS_WON
    
FROM teams t
JOIN matches m
	ON t.TEAMNO = m.TEAMNO
GROUP BY TEAMNO;






	














