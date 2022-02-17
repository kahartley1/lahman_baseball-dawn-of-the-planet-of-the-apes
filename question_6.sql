/*
6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are 
successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.
*/

WITH stolen_bases_sample AS (SELECT *
							 FROM batting AS b JOIN people AS p
							 ON b.playerid = p.playerid
							 WHERE yearid = 2016
							 AND sb + cs >= 20)
SELECT CONCAT(namefirst, ' ', namelast) AS player_name, CONCAT(ROUND((sb::numeric/(sb+cs)) * 100, 2), '%') AS steal_success_rate
FROM stolen_bases_sample
ORDER BY steal_success_rate DESC;