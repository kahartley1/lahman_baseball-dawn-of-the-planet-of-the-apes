/* Using the attendance figures from the homegames table, find the teams and parks which had the top 5 
    average attendance per game in 2016 (where average attendance is defined as total attendance divided
	by number of games). Only consider parks where there were at least 10 games played. Report the park name,
	team name, and average attendance. Repeat for the lowest 5 average attendance. */

WITH attend_top AS (SELECT team, park, (attendance/games) AS avg_attendance
					  FROM homegames
					  WHERE year = 2016
					  AND games > 10
					  ORDER BY avg_attendance DESC
					  LIMIT 5),
	 attend_bottom AS (SELECT team, park, (attendance/games) AS avg_attendance
					  FROM homegames
					  WHERE year = 2016
					  AND games > 10
					  ORDER BY avg_attendance 
					  LIMIT 5)
SELECT * FROM attend_top
UNION
SELECT * FROM attend_bottom








