---Exercise 1:
SELECT DISTINCT CITY 
FROM STATION
WHERE ID%2 = 0
ORDER BY CITY ASC
---Exercise 2:
SELECT COUNT(CITY)-COUNT(DISTINCT CITY) FROM STATION
---Exercise 3:
SELECT CEILING(AVG(SALARY) - AVG(REPLACE(SALARY, '0', ''))) FROM EMPLOYEES
---Exercise 4:
SELECT ROUND(CAST(SUM(item_count * order_occurrences) / SUM(order_occurrences) AS DECIMAL), 1) AS Mean FROM items_per_order
---Exercise 5:
SELECT CANDIDATE_ID FROM candidates
WHERE SKILL IN ('Python','Tableau','PostgreSQL')
GROUP BY CANDIDATE_ID
HAVING COUNT(SKILL) = 3
ORDER BY CANDIDATE_ID ASC
---Exercise 6:
SELECT user_id,
MAX(DATE(post_date)) - MIN(DATE(post_date)) AS days_between
FROM posts
WHERE post_date >= '01/01/2021' AND post_date < '01/01/2022'
GROUP BY user_id
HAVING COUNT(post_id) >=2
---Exercise 7:
SELECT card_name,
MAX(issued_amount)-MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC
---Exercise 8:
SELECT manufacturer, 
COUNT(drug) AS drug_count,
ABS(SUM(cogs-total_sales)) AS Total_loss
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY Total_loss DESC
---Exercise 9:
SELECT * FROM CINEMA
WHERE ID%2=1 AND DESCRIPTION != 'boring'
ORDER BY RATING DESC
---Exercise 10:
SELECT TEACHER_ID,
COUNT(DISTINCT SUBJECT_ID) AS CNT
FROM TEACHER
GROUP BY TEACHER_ID
---Exercise 11:
SELECT USER_ID,
COUNT(FOLLOWER_ID) AS FOLLOWERS_COUNT
FROM FOLLOWERS
GROUP BY USER_ID
ORDER BY USER_ID ASC
---Exercise 12:
SELECT CLASS FROM COURSES
GROUP BY CLASS
HAVING COUNT(CLASS) >=5
