-- world Table
-- name	            continent	area	    population	gdp
-- Afghanistan	    Asia	    652230	    25500100	20343000000
-- Albania	        Europe	    28748	    2831741	    12960000000
-- Algeria	        Africa	    2381741	    37100000	188681000000
-- Andorra	        Europe	    468	        78115	    3712000000
-- Angola	        Africa	    1246700	    20609294	100990000000

--1. Show the total population of the world.
--world(name, continent, area, population, gdp)
SELECT sum(population)
FROM world;

--2. List all the continents - just once each.
SELECT DISTINCT continent
FROM world;

--3. Give the total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = "Africa";

--4. How many countries have an area of at least 1000000
SELECT COUNT(area)
FROM world
WHERE area > 1000000;

--5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

--6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

--7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT DISTINCT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

--8. List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;