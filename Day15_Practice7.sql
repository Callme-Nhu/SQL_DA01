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
---Exercise 4:
---Exercise 5:
---Exercise 6:
---Exercise 7:
---Exercise 8:
