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
SELECT a.customer_id
FROM customer_contracts AS a
LEFT JOIN products AS b
ON a.product_id = b.product_id
GROUP BY a.customer_id
HAVING COUNT(DISTINCT b.product_category)=3
---Exercise 5:
SELECT b.employee_id, b.name,
COUNT(a.reports_to) AS reports_count,
CEILING(AVG(a.age)) AS average_age
FROM employees AS a
JOIN employees AS b
ON a.reports_to=b.employee_id
GROUP BY a.reports_to
ORDER BY a.reports_to
---Exercise 6:
---Exercise 7:
SELECT t1.page_id 
FROM pages AS t1
LEFT JOIN page_likes AS t2
ON t1.page_id=t2.page_id
WHERE t2.liked_date IS NULL
ORDER BY t1.page_id 
---MID-COURSE TEST
---Question 1:
SELECT MIN(DISTINCT(replacement_cost)) AS min_cost
FROM film 
---Question 2:
---Question 3:
---Question 4:
---Question 5:
---Question 6:
---Question 7:
---Question 8:
