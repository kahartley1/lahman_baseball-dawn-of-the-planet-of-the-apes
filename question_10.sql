/*
10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years, 
and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.
*/

WITH yil_table AS (SELECT DISTINCT playerid, MAX(yearid) OVER(PARTITION BY playerid) - MIN(yearid) OVER(PARTITION BY playerid) AS years_in_league
				   FROM appearances
				   ORDER BY playerid)
SELECT DISTINCT CONCAT(namefirst, ' ', namelast) AS player_name, yil.playerid
FROM people AS p JOIN yil_table AS yil
ON p.playerid = yil.playerid
WHERE yil.years_in_league >= 10
ORDER BY player_name;

WITH max_hr_table AS (SELECT playerid, yearid, hr, MAX(hr) OVER(PARTITION BY playerid) AS most_hrs
					  FROM batting)
SELECT *
FROM max_hr_table
WHERE hr = most_hrs
AND yearid = 2016
AND hr <> 0;

WITH yil_table AS (SELECT DISTINCT playerid, MAX(yearid) OVER(PARTITION BY playerid) - MIN(yearid) OVER(PARTITION BY playerid) AS years_in_league
				   FROM appearances
				   ORDER BY playerid),
  max_hr_table AS (SELECT playerid, yearid, hr, MAX(hr) OVER(PARTITION BY playerid) AS most_hrs
				   FROM batting)
SELECT DISTINCT CONCAT(namefirst, ' ', namelast) AS player_name, most_hrs AS HRS_2016
FROM people AS p 
JOIN yil_table AS yil
ON p.playerid = yil.playerid
JOIN max_hr_table AS mht
ON p.playerid = mht.playerid
WHERE yil.years_in_league >= 10
AND yearid = 2016
AND hr <> 0
ORDER BY player_name;
