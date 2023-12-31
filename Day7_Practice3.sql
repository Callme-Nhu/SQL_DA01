---Exercise 1:
SELECT NAME
FROM STUDENTS 
WHERE MARKS > 75
ORDER BY RIGHT(NAME,3),ID
---Exercise 2:
SELECT USER_ID,
CONCAT (UPPER (LEFT (NAME,1)), LOWER (SUBSTRING(NAME FROM 2 FOR LENGTH(NAME)-1))) AS NAME
FROM USERS
ORDER BY USER_ID
---Exercise 3:
SELECT MANUFACTURER,
'$' || ROUND(SUM(TOTAL_SALES) /1000000,0) || ' million' AS SALES_MIL
FROM pharmacy_sales
GROUP BY MANUFACTURER
ORDER BY  ROUND(SUM(TOTAL_SALES) /1000000,0) DESC, MANUFACTURER DESC
---Exercise 4:
SELECT EXTRACT(MONTH FROM SUBMIT_DATE) AS MTH,
PRODUCT_ID AS PRODUCT,
ROUND(AVG(STARS),2) AS AVG_STARS FROM reviews
GROUP BY MTH, PRODUCT_ID
ORDER BY MTH,PRODUCT_ID
---Exercise 5:
SELECT SENDER_ID,
COUNT(RECEIVER_ID) AS MESSAGE_COUNT
FROM messages
WHERE SENT_DATE > '08/01/2022' AND SENT_DATE < '09/01/2022'
GROUP BY SENDER_ID
ORDER BY MESSAGE_COUNT DESC
LIMIT 2
---Exercise 6:
SELECT TWEET_ID FROM TWEETS
WHERE LENGTH(CONTENT) > 15
---Exercise 7:
SELECT ACTIVITY_DATE AS DAY,
COUNT( DISTINCT USER_ID ) AS ACTIVE_USERS
FROM ACTIVITY
WHERE ACTIVITY_DATE < '2019-07-28' AND ACTIVITY_DATE > '2019-06-27'
GROUP BY DAY
---Exercise 8:
select 
COUNT(ID) AS THE_NUMBER_OF_EMPLOYEES 
from employees
WHERE JOINING_DATE BETWEEN '2022-01-01' AND '2022-07-31'
---Exercise 9:
select POSITION('a' IN FIRST_NAME) AS POSITION_OF_a from worker
WHERE FIRST_NAME ='Amitah'
---Exercise 10:
select SUBSTRING(TITLE FROM LENGTH(WINERY)+2 FOR 4 ) from winemag_p2
WHERE COUNTRY='Macedonia'
