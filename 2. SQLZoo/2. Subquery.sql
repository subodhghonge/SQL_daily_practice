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

--6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = "Europe" AND gdp IS NOT NULL);

--7.Find the largest country (by area) in each continent, show the continent, the name and the area:
-- The above example is known as a correlated or synchronized sub-query.
-- Using correlated subqueries
SELECT c1.continent, c1.name, c1.area FROM world c1
WHERE c1.area = (SELECT MAX(c2.area) FROM world c2 WHERE c2.continent = c1.continent);

--8. List each continent and the name of the country that comes first alphabetically.
SELECT c1.continent, c1.name
FROM world c1
WHERE c1.name = (SELECT MIN(c2.name) FROM world c2 WHERE c2.continent = c1.continent);

-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
FROM world
WHERE continent IN (
    SELECT continent
    FROM world c1
    WHERE 25000000 >= ALL (
        SELECT population
        FROM world c2
        WHERE c2.continent = c1.continent
          AND c2.population IS NOT NULL
    )
);

--10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT c1.name, c1.continent
FROM world c1
WHERE c1.population > ALL (
    SELECT 3 * c2.population
    FROM world c2
    WHERE c2.continent = c1.continent
      AND c2.name <> c1.name   -- exclude itself
      AND c2.population IS NOT NULL
);
