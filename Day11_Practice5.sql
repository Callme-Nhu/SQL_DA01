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
SELECT b.age_bucket,
ROUND(SUM(CASE
 WHEN a.activity_type='open' THEN a.time_spent ELSE 0 END)*100/SUM(a.time_spent),2)  AS open_perc,
ROUND(SUM(CASE
 WHEN a.activity_type='send' THEN a.time_spent ELSE 0 END)*100/SUM(a.time_spent),2)  AS send_perc
FROM activities AS a
INNER JOIN age_breakdown AS b
ON a.user_id = b.user_id
WHERE a.activity_type IN ('send','open')
GROUP BY b.age_bucket
---Exercise 4:
---Exercise 5:
---Exercise 6:
---Exercise 7:
