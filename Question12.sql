/* 12. In this question, you will explore the connection between number of wins and attendance.
      	(a) Does there appear to be any correlation between attendance at home games and number of wins?
      	(b) Do teams that win the world series see a boost in attendance the following year? 
	  	(c) What about teams that made the playoffs? Making the playoffs means either being a division winner or a wild card winner. */
		
--(a)	  
SELECT h.year, h.team, (h.attendance/h.games) as avg_attend, t.w AS wins
FROM homegames AS h
JOIN teams AS t
ON h.year = t.yearid AND h.team = t.teamid;
-- Appears to be no correlation between home attendance and season wins.

--(b)
WITH t AS (SELECT yearid, teamid, wswin
		   FROM teams),
	 h AS (SELECT year, team, (attendance/games) as avg_attend
		  FROM homegames)
SELECT t.yearid, t.teamid, h.avg_attend, t.wswin
FROM t
JOIN h ON h.year = t.yearid AND h.team = t.teamid
WHERE t.wswin IS NOT NULL
ORDER BY t.teamid, t.yearid;
-- No apparent correlation between world series wins and average next year home attendance.

--(c)
WITH t AS (SELECT yearid, teamid, divwin, wcwin
		   FROM teams),
	 h AS (SELECT year, team, (attendance/games) as avg_attend
		  FROM homegames)
SELECT t.yearid, t.teamid, h.avg_attend, t.divwin, t.wcwin
FROM t
JOIN h ON h.year = t.yearid AND h.team = t.teamid
WHERE t.divwin IS NOT NULL OR t.wcwin IS NOT NULL
ORDER BY t.teamid, t.yearid;
-- Seems to be some correlation between division/wild card wins and average next year attendance.