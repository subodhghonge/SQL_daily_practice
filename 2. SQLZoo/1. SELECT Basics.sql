-- world Table
-- name	            continent	area	    population	gdp
-- Afghanistan	    Asia	    652230	    25500100	20343000000
-- Albania	        Europe	    28748	    2831741	    12960000000
-- Algeria	        Africa	    2381741	    37100000	188681000000
-- Andorra	        Europe	    468	        78115	    3712000000
-- Angola	        Africa	    1246700	    20609294	100990000000

-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';
-- Modify it to show the population of Germany
SELECT population from world
WHERE name = 'Germany';

-- 2. Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population from world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.