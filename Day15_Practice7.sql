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
---Exercise 8:
