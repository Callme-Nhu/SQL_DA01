---Exercise 4:
SELECT t1.page_id 
FROM pages AS t1
LEFT JOIN page_likes AS t2
ON t1.page_id=t2.page_id
WHERE t2.liked_date IS NULL
ORDER BY page_id
---Exercise 5:
---Exercise 6:
---Exercise 7:
---Exercise 8:
---Exercise 9:
---Exercise 10:
