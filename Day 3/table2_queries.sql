--Q1.Find the list of all buildings that have employees
SELECT a.Building_name, b.Building, b.years_employed
FROM Buildings AS a
JOIN Employees AS b
ON a.Building_name = b.Building
GROUP BY b.building;

--Q2. Find the list of all buildings and their capacity
SELECT Building_name, Capacity
FROM Buildings;