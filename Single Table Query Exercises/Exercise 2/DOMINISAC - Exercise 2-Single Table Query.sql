USE henry;

-- 1
SELECT 
	b.BOOK_CODE,
    b.TITLE

FROM book b;


-- 2
SELECT *

FROM publisher;


-- 3
SELECT 
	p.PUBLISHER_NAME

FROM publisher p
WHERE p.CITY = 'Boston';


-- 4
SELECT 
	p.PUBLISHER_NAME

FROM publisher p
WHERE p.CITY != 'Boston';


-- 5
SELECT
	b.BRANCH_NAME

FROM branch b
WHERE b.NUM_EMPLOYEES >= 9; 


-- 6
SELECT
	b.BOOK_CODE,
    b.TITLE

FROM book b
WHERE b.TYPE = 'SFI';


-- 7 
SELECT
	b.BOOK_CODE,
    b.TITLE

FROM book b
WHERE b.TYPE = 'SFI' AND b.PAPERBACK = 'Y';


-- 8
SELECT
	b.BOOK_CODE,
    b.TITLE

FROM book b
WHERE b.TYPE = 'SFI' OR b.PUBLISHER_CODE = 'SC';


-- 9
SELECT
	b.BOOK_CODE,
    b.TITLE,
    b.PRICE

FROM book b
WHERE b.PRICE BETWEEN 20 AND 50;


-- 10
SELECT
	b.BOOK_CODE,
    b.TITLE

FROM book b
WHERE b.TYPE = 'MYS' AND b.PRICE < 20;














