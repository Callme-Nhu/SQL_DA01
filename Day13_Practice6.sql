---Exercise 4:
SELECT t1.page_id 
FROM pages AS t1
LEFT JOIN page_likes AS t2
ON t1.page_id=t2.page_id
WHERE t2.liked_date IS NULL
ORDER BY page_id
---Exercise 5:
WITH twt_1
AS 
(SELECT user_id, EXTRACT(month FROM event_date) AS month
FROM user_actions
WHERE EXTRACT(month FROM event_date) = 7
AND EXTRACT(year FROM event_date) = 2022),
twt_2
AS
(SELECT user_id,
MAX(EXTRACT(month FROM event_date)) - MIN(EXTRACT(month FROM event_date)) AS minus_month
FROM user_actions
GROUP BY user_id)
SELECT t1.month, COUNT(DISTINCT t1.user_id) AS monthly_active_users
FROM twt_1 AS t1
JOIN twt_2 AS t2
ON t1.user_id=t2.user_id
WHERE t2.minus_month <> 0
GROUP BY  t1.month
---Exercise 6:
---CÁCH 1:
WITH twt1
AS (SELECT LEFT(trans_date,7) AS month,
country,
COUNT(trans_date) AS trans_count,
SUM(amount) AS trans_total_amount
FROM transactions
GROUP BY LEFT(trans_date,7),country),
twt2 AS
(SELECT country,COUNT(state) AS approved_count,
SUM(amount) AS approved_total_amount,
LEFT(trans_date,7) AS month
FROM transactions
WHERE state='approved'
GROUP BY LEFT(trans_date,7),country)
SELECT
a.month, a.country,a.trans_count,COALESCE(b.approved_count,0) AS approved_count,a.trans_total_amount,COALESCE(b.approved_total_amount,0) AS approved_total_amount
FROM twt1 AS a
LEFT JOIN twt2 AS b
ON a.country = b.country
AND a.month=b.month
---CÁCH 2: EX6 
select  DATE_FORMAT(trans_date, '%Y-%m') AS month,
country, count(*) as  trans_count ,
sum( case when state ='approved 'then 1 else 0 end) as approved_count,
sum( amount) as trans_total_amount,
sum( case when state ='approved 'then amount else 0 end) as approved_total_amount 
from Transactions
group by month,country
---Exercise 7:
WITH twt1 AS (
SELECT product_id, quantity, price
FROM sales
WHERE (product_id, year) IN ( SELECT product_id, MIN(year) FROM sales GROUP BY product_id)),
twt2 AS
(SELECT product_id, MIN(year) AS first_year FROM sales GROUP BY product_id)
SELECT t1.product_id, t2.first_year, t1.quantity, t1.price
FROM twt1 AS t1
JOIN twt2 AS t2 ON t1.product_id = t2.product_id
---Exercise 8:
SELECT customer_id FROM (SELECT customer_id,COUNT(DISTINCT product_key) AS count_product_key 
FROM customer
GROUP BY customer_id) AS new_table
WHERE count_product_key = (SELECT COUNT(product_key) FROM product)
---Exercise 9:
---CÁCH 1:
SELECT employee_id FROM (SELECT a.employee_id, a.name, a.manager_id,b.name AS name_manager,a.salary
FROM employees AS a
LEFT JOIN employees AS b
ON a.manager_id=b.employee_id 
WHERE a.manager_id IS NOT NULL ) AS new_table
WHERE salary < 30000 AND name_manager IS NULL
ORDER BY employee_id
---CÁCH 2: EX9
SELECT employee_id
FROM Employees
WHERE salary < 30000
	AND manager_id NOT IN (
		SELECT employee_id
		FROM Employees)
ORDER BY employee_id
---Exercise 10:
WITH twt1
AS (SELECT company_id, COUNT(title) AS count_title
FROM job_listings
GROUP BY company_id),
twt2
AS(SELECT company_id, COUNT(description) AS count_des
FROM job_listings
GROUP BY company_id)
SELECT COUNT(*) AS duplicate_companies
FROM twt1 AS t1
JOIN twt2 AS t2
ON t1.company_id=t2.company_id
WHERE count_title > 1 AND count_des > 1
