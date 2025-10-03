--1. show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
WHERE teamid = 'GER';


--2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
-- Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

--3. show the player, teamid, stadium and mdate for every German goal.
SELECT g.player, g.teamid, a.stadium, a.mdate
FROM game a 
JOIN goal g
ON a.id = g.matchid
WHERE g.teamid = 'GER';

--4. 