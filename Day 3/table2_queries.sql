--Q1.Find the list of all buildings that have employees
SELECT a.Building_name, b.Building, b.years_employed
FROM Buildings AS a
JOIN Employees AS b
ON a.Building_name = b.Building
GROUP BY b.building;

--Q2. Find the list of all buildings and their capacity
SELECT Building_name, Capacity
FROM Buildings;

--Q3.List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT b.building_name, e.role
FROM buildings b
LEFT JOIN employees e
ON b.building_name = e.building
GROUP BY b.building_name, e.role
ORDER BY b.building_name;
