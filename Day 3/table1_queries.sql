--Q1. Find the domestic and international sales for each movie
SELECT a.title, b.Domestic_sales, b.International_sales
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id;

--Q2. Show the sales numbers for each movie that did better internationally rather than domestically
SELECT a.title, b.Domestic_sales, b.International_sales
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id
WHERE b.Domestic_sales < b.International_sales;

--Q3. List all the movies by their ratings in descending order 
SELECT a.title, b.Rating
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id
ORDER BY Rating DESC;