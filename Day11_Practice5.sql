---Exercise 1:
SELECT a.CONTINENT,
FLOOR(AVG(b.POPULATION)) AS avg_population
FROM COUNTRY AS a
INNER JOIN CITY AS b
ON a.Code = b.CountryCode
GROUP BY a.CONTINENT
---Exercise 2:
SELECT 
ROUND(CAST(SUM(CASE
 WHEN b.signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS DECIMAL) /COUNT(*),2) 
 AS confirm_rate
FROM emails AS a
LEFT JOIN texts AS b
ON a.email_id = b.email_id
WHERE b.text_id IS NOT NULL
---Exercise 3:
---Exercise 4:
---Exercise 5:
---Exercise 6:
---Exercise 7:
