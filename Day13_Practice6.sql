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
---Exercise 7:
---Exercise 8:
---Exercise 9:
---Exercise 10:
