-- 1. List each country name where the population is larger than that of 'Russia'.
-- world(name, continent, area, population, gdp)

SELECT name FROM world
WHERE population > (SELECT population FROM world where name = "Russia");

--2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. Per Capita GDP
SELECT name 
FROM world
WHERE continent = "Europe" and gdp/population > (SELECT gdp/population FROM world
WHERE name = "United Kingdom")

--3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent 
FROM world
WHERE continent IN (
    SELECT continent 
    FROM world 
    WHERE name IN("Argentina", "Australia")
)
ORDER BY name;

--4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = "United Kingdom") 
AND population < (SELECT population FROM world WHERE name = "Germany");

--5. Germany (population roughly 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- The format should be Name, Percentage for example:
-- name	    percentage
-- Albania	3%
-- Andorra	0%
-- Austria	11%
-- ...	...
-- Decimal places
-- Percent symbol %

SELECT name,
       CONCAT(ROUND(100 * population / (
           SELECT population
           FROM world
           WHERE name = 'Germany'
       ), 0), '%') AS percentage
FROM world
WHERE continent = 'Europe'
ORDER BY name;
