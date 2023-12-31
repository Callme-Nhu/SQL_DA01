---Exercise 1:
SELECT EXTRACT(year FROM transaction_date) AS year ,
product_id, spend AS curr_year_spend,
LAG(spend) OVER(PARTITION BY product_id) AS prev_year_spend,
ROUND((spend-LAG(spend) OVER(PARTITION BY product_id))*100/LAG(spend) OVER(PARTITION BY product_id),2) AS yoy_rate
FROM user_transactions;
---Exercise 2:
SELECT * FROM (SELECT card_name,
FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) AS issued_amount
FROM monthly_cards_issued) AS a
GROUP BY card_name,issued_amount
ORDER BY issued_amount DESC;
---Exercise 3:
SELECT user_id, spend,transaction_date FROM (SELECT *,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS xephang
FROM transactions) AS a
WHERE xephang=3
---Exercise 4:
WITH twt 
AS (SELECT transaction_date, user_id, product_id, 
RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS rank1
FROM user_transactions) 
SELECT  transaction_date, user_id,
COUNT(product_id) AS purchase_count
FROM twt
WHERE rank1 = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date
---Exercise 5:
SELECT user_id, tweet_date,
ROUND(AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3d
FROM tweets
---Exercise 6:
WITH twt AS
(SELECT *, 
EXTRACT(EPOCH FROM diff_time) / 60 AS minutes
FROM (SELECT *,
LEAD(transaction_timestamp) OVER(PARTITION BY merchant_id ORDER BY amount) AS next_time,
(LEAD(transaction_timestamp) OVER(PARTITION BY merchant_id ORDER BY amount)  - transaction_timestamp) AS diff_time
FROM transactions) AS a)
SELECT COUNT(*) FROM twt
WHERE ABS(minutes) <=10
---Exercise 7:
SELECT category, product,total_spend
FROM(SELECT category,product,
SUM(spend) AS total_spend,
RANK()  OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rankc
FROM product_spend
WHERE EXTRACT(year FROM transaction_date)  = 2022
GROUP BY category,product) AS a
WHERE rankc < 3
---Exercise 8:
WITH twt
AS(SELECT t1.artist_name,
DENSE_RANK() OVER(ORDER BY COUNT(t2.song_id) DESC) AS artist_rank
FROM artists t1
JOIN songs t2
ON t1.artist_id=t2.artist_id
JOIN global_song_rank t3
ON t2.song_id=t3.song_id
WHERE t3.rank <=10 
GROUP BY t1.artist_name)
SELECT artist_name, artist_rank
FROM twt
WHERE artist_rank <=5
---CÁCH 2:
WITH twt AS( SELECT c.artist_name,
COUNT(*) AS counts
FROM global_song_rank a
JOIN songs b
ON a.song_id=b.song_id
JOIN artists c
ON b.artist_id = c.artist_id
WHERE a.rank <= 10
GROUP BY c.artist_name),
twt1 AS (
SELECT artist_name,
DENSE_RANK() OVER(ORDER BY counts DESC) AS artist_rank
FROM twt)

SELECT artist_name, artist_rank
FROM twt1
WHERE artist_rank <=5
