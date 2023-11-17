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
---Exercise 4:
SELECT NAME FROM CUSTOMER
WHERE REFEREE_ID != 2 OR REFEREE_ID IS NULL;
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
