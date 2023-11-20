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
ROUND(AVG(a.age),0) AS average_age
FROM employees AS a
JOIN employees AS b
ON a.reports_to=b.employee_id
GROUP BY a.reports_to
ORDER BY a.reports_to
---Exercise 6:
SELECT t1.product_name,SUM(t2.unit) AS unit
FROM Products AS t1
RIGHT JOIN Orders AS t2
ON t1.product_id=t2.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY t2.product_id
HAVING SUM(t2.unit) >=100
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
SELECT 
SUM(CASE
 WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1 ELSE 0 END) low,
SUM(CASE
 WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 1 ELSE 0 END) medium,
SUM(CASE
 WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 1 ELSE 0 END) high
FROM film
---Question 3:
SELECT t1.title, t1.length,t3.name
FROM film AS t1
INNER JOIN film_category AS t2
ON t1.film_id=t2.film_id
INNER JOIN category AS t3
ON t2.category_id=t3.category_id
WHERE t3.name IN ('Drama','Sports')
ORDER BY t1.length DESC
---Question 4:
SELECT t3.name, COUNT(t1.title) AS soluong
FROM film AS t1
INNER JOIN film_category AS t2
ON t1.film_id=t2.film_id
INNER JOIN category AS t3
ON t2.category_id=t3.category_id
GROUP BY t3.name
ORDER BY soluong DESC
---Question 5:
SELECT t1.first_name, t1.last_name, COUNT(t2.film_id) AS soluong
FROM actor AS t1
INNER JOIN film_actor AS t2
ON t1.actor_id=t2.actor_id
GROUP BY t1.first_name, last_name
ORDER BY soluong DESC
---Question 6:
SELECT COUNT(t1.address_id) AS soluong
FROM address AS t1
LEFT JOIN customer AS t2
ON t1.address_id=t2.address_id
WHERE t2.customer_id IS NULL
---Question 7:
SELECT SUM(t4.amount) AS DT,t1.city
FROM city AS t1
INNER JOIN address AS t2
ON t1.city_id = t2.city_id
INNER JOIN customer AS t3
ON t2.address_id = t3.address_id
INNER JOIN payment AS t4
ON t3.customer_id = t4.customer_id
GROUP BY t1.city_id
ORDER BY DT DESC
---Question 8:
