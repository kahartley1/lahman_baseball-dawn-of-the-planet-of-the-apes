--From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? [(2001 SEA 116 wins)]
--What is the smallest number of wins for a team that did win the world series? 					 [(1918 BOS 75 wins)]
--Doing this will probably result in an unusually small number of wins for a world series champion – [(1918 "WORK OR FIGHT" WWI MANDATE)]
--determine why this is the case. Then redo your query, excluding the problem year. 
--How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 
--What percentage of the time?





SELECT yearid, teamid, w, wswin
FROM teams
WHERE yearid BETWEEN '1970' AND '2016'
AND wswin = 'Y'
ORDER BY yearid DESC;


--For years after 1970, find max number of wins for each year.

WITH max_w AS (
	SELECT MAX(w) AS maxw, yearid
	FROM teams
	WHERE yearid BETWEEN '1970' AND '2016'
	AND yearid <> 1994
	GROUP BY yearid
	ORDER BY yearid
)
SELECT 
	COUNT(*) FILTER (WHERE wswin = 'Y')	AS count_win_teams,
	COUNT(*) AS count_all_teams, 
	COUNT(*) FILTER (WHERE wswin = 'Y') *100.0 / COUNT(*) AS percent_win
FROM teams
INNER JOIN max_w
ON teams.yearid = max_w.yearid AND teams.w = max_w.maxw













