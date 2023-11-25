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
---Exercise 7:
---Exercise 8:
---Exercise 9:
---Exercise 10:
