---Exercise 1:
SELECT 
SUM(CASE 
 WHEN device_type = 'laptop' THEN 1 ELSE 0 END) laptop_views,
SUM(CASE
 WHEN device_type IN ('tablet','phone') THEN 1 ELSE 0 END) mobie_views
FROM viewership
---Exercise 2:
SELECT x,y,z,
CASE 
 WHEN x+y>z AND x+z>y AND y+z>x THEN 'Yes' ELSE 'No' END triangle
FROM Triangle
---Exercise 3:
SELECT
ROUND(SUM(CASE 
      WHEN call_category IS NULL THEN 1 
      WHEN call_category = 'n/a' THEN 1
      ELSE 0 END) *100/ COUNT(case_id),1) as call_percentage
FROM callers
---Exercise 4:
SELECT name
FROM Customer
WHERE COALESCE(referee_id, name) != 2
---Exercise 5:
select survived,
SUM(CASE
 WHEN pclass = 1 THEN 1 ELSE 0 END) first_class,
SUM(CASE
 WHEN pclass=2 THEN 1 ELSE 0 END) second_class,
SUM(CASE
 WHEN pclass=3 THEN 1 ELSE 0 END) third_class
from titanic
GROUP BY survived
