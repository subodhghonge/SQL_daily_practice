-- world Table
-- name	            continent	area	    population	gdp
-- Afghanistan	    Asia	    652230	    25500100	20343000000
-- Albania	        Europe	    28748	    2831741	    12960000000
-- Algeria	        Africa	    2381741	    37100000	188681000000
-- Andorra	        Europe	    468	        78115	    3712000000
-- Angola	        Africa	    1246700	    20609294	100990000000

-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';
-- Modify it to show the population of Germany
SELECT population FROM world
WHERE name = 'Germany';

-- 2. Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000..
SELECT name, area FROM world
WHERE area BETWEEN 200000 and 250000;

--QUIZ
-- 1. Select the code which produces this table
--     name	            population
--     Bahrain	        1234571
--     Swaziland	    1220000
--     Timor-Leste	    1066409
SELECT name, population FROM world
WHERE population BETWEEN 1000000 AND 1250000;

-- 2.Pick the result you would obtain from this code:
--     SELECT name, population
--     FROM world
--     WHERE name LIKE "Al%"
--output
--  name    population
-- Albania	3200000
-- Algeria	32900000

-- 3. Select the code which shows the countries that end in A or L
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l';

--4. Pick the result from the query
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe';

--Output
-- name	    length(name)
-- Italy	5
-- Malta	5
-- Spain	5

-- 5. Here are the first few rows of the world table:
-- name	        region	    area	population	gdp
-- Afghanistan	South Asia	652225	26000000	
-- Albania	    Europe	    28728	3200000	    6656000000
-- Algeria	    Middle East	2400000	32900000	75012000000
-- Andorra	    Europe	    468	    64000	
-- ...
-- Pick the result you would obtain from this code:
-- SELECT name, area*2 FROM world WHERE population = 64000

-- OUTPUT
-- Andorra	936

--6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

--7. Select the code that shows the population density of China, Australia, Nigeria and France
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

--8. to show the name, continent and population of all countries.
SELECT name, continent, population FROM world;

--9. show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000;

--10. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population FROM world
WHERE population >= 200000000;

--11. Show the name and population in millions for the countries of the continent 'South America'. 
--Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

--12. Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name IN ('France','Germany','Italy');

--13. Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE "%United%";

--14. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area FROM world
WHERE area > 3000000 OR population >= 250000000;

--15. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population >= 250000000;

--16. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
-- For Americas show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000,2) FROM world
WHERE continent = 'South America';

--17. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
--Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(gdp/population, -3) FROM world
WHERE gdp > 1000000000000;