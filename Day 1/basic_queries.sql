/* Table: movies

Id	    Title	                Director	     Year	Length_minutes
1	    Toy Story	            John Lasseter	 1995	81
2	    A Bug's Life	        John Lasseter	 1998	95
3	    Toy Story 2	            John Lasseter	 1999	93
4	    Monsters, Inc.	        Pete Docter	     2001	92
5	    Finding Nemo	        Andrew Stanton	 2003	107
6	    The Incredibles	        Brad Bird	     2004	116
7	    Cars	                John Lasseter  	 2006	117
8	    Ratatouille	            Brad Bird	     2007	115
9	    WALL-E	                Andrew Stanton	 2008	104
10	    Up	                    Pete Docter	     2009	101
11	    Toy Story 3	            Lee Unkrich	     2010	103
12	    Cars 2	                John Lasseter	 2011	120
13	    Brave	                Brenda Chapman	 2012	102
14	    Monsters University	    Dan Scanlon	     2013	110 */

--Queries
-- Q1.Find the title of each film
SELECT title FROM movies;

-- Q2. Find the director of each film
SELECT director FROM movies;

-- Q3. Find the title and director of each film
SELECT Title, Director FROM movies;

-- Q4. Find the title and year of each film
SELECT Title, Year FROM movies;

-- Q5. Find all the information about each film
SELECT * FROM movies;

-- Q6. Find the movie with a row id of 6
SELECT Title FROM Movies
WHERE Id = 6;

--Q7. Find the movies released in the years between 2000 and 2010
SELECT Title FROM Movies
WHERE Year BETWEEN 2000 AND 2010;

-- Q8. Find the movies not released in the years between 2000 and 2010 
SELECT Title FROM Movies
WHERE Year NOT BETWEEN 2000 AND 2010;

-- Q9. Find the first 5 Pixar movies and their release year
SELECT Title, Year FROM Movies
LIMIT 5;

-- Q10. Find all the Toy Story movies
SELECT * FROM movies
WHERE Title LIKE 'Toy%';

-- Q11.Find all the movies directed by John Lasseter 
SELECT * FROM movies
WHERE Director = 'John Lasseter'; 

-- Q12. Find all the movies (and director) not directed by John Lasseter
SELECT Title, Director FROM movies
WHERE NOT Director = 'John Lasseter';

-- Q13. Find all the WALL-* movies
SELECT Title, Director FROM movies
WHERE Title LIKE 'WALL%';