---Exercise 1:
SELECT DISTINCT CITY 
FROM STATION
WHERE ID%2 = 0
ORDER BY CITY ASC
---Exercise 2:
SELECT COUNT(CITY)-COUNT(DISTINCT CITY) FROM STATION
---Exercise 3:
---Exercise 4:
SELECT ROUND(CAST(SUM(item_count * order_occurrences) / SUM(order_occurrences) AS DECIMAL), 1) AS Mean FROM items_per_order
---Exercise 5:
SELECT CANDIDATE_ID FROM candidates
WHERE SKILL IN ('Python','Tableau','PostgreSQL')
GROUP BY CANDIDATE_ID
HAVING COUNT(SKILL) = 3
ORDER BY CANDIDATE_ID ASC
---Exercise 6:
---Exercise 7:
---Exercise 8:
---Exercise 9:
---Exercise 10:
---Exercise 11:
---Exercise 12:
