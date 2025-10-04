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

--4. Use the same JOIN as in the previous question.
--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT a.team1, a.team2, b.player 
FROM game a
JOIN goal b
ON a.id = b.matchid
WHERE player LIKE 'Mario%'

--5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT a.player, a.teamid, b.coach, a.gtime
FROM goal a
JOIN eteam b
ON a.teamid = b.id
WHERE a.gtime <= 10;

--6. To JOIN game with eteam you could use either game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)
--Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id
--List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT a.mdate, b.teamname
FROM game a
JOIN eteam b
ON a.team1 = b.id
WHERE b.coach = 'Fernando Santos';

--7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT b.player
FROM game a
JOIN goal b
ON a.id = b.matchid
WHERE a.stadium = "National Stadium, Warsaw";

--8. The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.
SELECT b.player
FROM game a
JOIN goal b
ON a.id = b.matchid
WHERE (a.team1 = 'GER' AND b.teamid = a.team2) OR (a.team2 = 'GER' AND b.teamid = a.team1);

--9. Show teamname and the total number of goals scored.
SELECT b.teamname, count(a.teamid)
FROM goal a
JOIN eteam b
ON a.teamid = b.id
GROUP BY b.teamname;

--10. Show the stadium and the number of goals scored in each stadium.
SELECT a.stadium, COUNT(b.teamid)
FROM game a
JOIN goal b
ON a.id = b.matchid
GROUP BY a.stadium;

--11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT a.id, a.mdate, COUNT(b.teamid) AS total_goal
FROM game a
JOIN goal b
ON a.id = b.matchid
WHERE(a.team1 = 'POL' OR a.team2 = 'POL')
GROUP BY a.id, a.mdate;

--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT a.id, a.mdate, COUNT(b.teamid)
FROM game a 
JOIN goal b
ON a.id = b.matchid
WHERE b.teamid = "GER"
GROUP BY a.id, a.mdate;

--13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- mdate	team1	score1	team2	score2
-- 1 July 2012	ESP	4	ITA	0
-- 10 June 2012	ESP	1	ITA	1
-- 10 June 2012	IRL	1	CRO	3
-- ...
-- Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.
SELECT a.mdate, 
   a.team1,
   SUM(CASE WHEN a.team1 = b.teamid THEN 1 ELSE 0 END),
   a.team2,
   SUM(CASE WHEN a.team2 = b.teamid THEN 1 ELSE 0 END)
FROM game a
LEFT JOIN goal b
ON a.id = b.matchid
GROUP BY a.mdate, a.id, a.team1, a.team2
ORDER BY a.mdate, a.id, a.team1, a.team2;