USE EO_AdventureWorksDM2022;

-- Delete ~10% of records in dim_customer
DELETE FROM dim_customer
WHERE customer_id % 50 = 2;

-- Update city for ~10% in dim_customer
UPDATE dim_customer
SET city = 'Cairo'
WHERE city = 'Paris';

-- Update phone number
UPDATE dim_customer
SET phone = SUBSTRING(phone, 10, 3) + SUBSTRING(phone, 4, 5) + SUBSTRING(phone, 9, 1) + SUBSTRING(phone, 1, 3)
WHERE LEN(phone) = 12
  AND LEFT(phone, 3) BETWEEN '101' AND '125';

-- updated records - type 2
SELECT customer_id, COUNT(*) 
FROM dim_customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT * 
FROM dim_customer
WHERE customer_id = 11036;