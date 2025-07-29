Table 1 : movies (Read-only)

id	title	                director	    year	length_minutes
1	Toy Story	            John Lasseter	1995	81
2	A Bugs Life	        John Lasseter	1998	95
3	Toy Story 2	            John Lasseter	1999	93
4	Monsters, Inc.	        Pete Docter	    2001	92
5	Finding Nemo	        Andrew Stanton	2003	107
6	The Incredibles	        Brad Bird	    2004	116
7	Cars	                John Lasseter	2006	117
8	Ratatouille	            Brad Bird	    2007	115
9	WALL-E	                Andrew Stanton	2008	104
10	Up	                    Pete Docter	    2009	101
11	Toy Story 3	            Lee Unkrich	    2010	103
12	Cars 2	                John Lasseter	2011	120
13	Brave	                Brenda Chapman	2012	102
14	Monsters University	    Dan Scanlon	    2013	110

Table 2 : boxoffice (Read-only)

movie_id	rating	domestic_sales	international_sales
5	        8.2	    380843261	    555900000
14	        7.4	    268492764	    475066843
8	        8	    206445654	    417277164
12	        6.4	    191452396	    368400000
3	        7.9	    245852179	    239163000
6	        8	    261441092	    370001000
9	        8.5	    223808164	    297503696
11	        8.4	    415004880	    648167031
1	        8.3	    191796233	    170162503
7	        7.2	    244082982	    217900167
10	        8.3	    293004164	    438338580
4	        8.1	    289916256	    272900000
2	        7.2	    162798565	    200600000
13	        7.2	    237283207	    301700000

--Q1) List all movies and their combined sales in millions of dollars
SELECT a.Title, 
ROUND((b.Domestic_sales + b.International_sales) / 1000000, 2) AS Sales
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id;

--Q2) List all movies and their ratings in percent
SELECT a.Title, b.Rating * 10 AS rating_percent
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id;

--Q3) List all movies with a rating of 8 or higher
SELECT a.Title, b.Rating
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id
WHERE b.Rating >= 8;

--Q4) List all movies with a rating of 8 or higher and their combined sales in millions of dollars
SELECT a.Title,
ROUND((b.Domestic_sales + b.International_sales) / 1000000, 2) AS Sales
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id
WHERE b.Rating >= 8;

--Q5) List all movies that were released on even number years
SELECT a.Title, a.Year
FROM Movies AS a
WHERE a.Year % 2 = 0;

--Q6) List all movies that were released on even number years and their ratings in percent
SELECT a.Title, a.Year, b.Rating * 10 AS Rating_percent
FROM Movies AS a
JOIN Boxoffice AS b
ON a.Id = b.Movie_id
WHERE Year % 2 = 0;