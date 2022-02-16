/* 
3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total 
salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in 
the majors?
*/

WITH vandy_college_playing AS
	(SELECT DISTINCT CONCAT(namefirst, ' ', namelast) AS player_name, p.playerid
	 FROM collegeplaying AS cp
	 JOIN people AS p
	 ON cp.playerid = p.playerid
	 WHERE schoolid = 'vandy')
SELECT DISTINCT player_name, SUM(salary) OVER(PARTITION BY player_name)::numeric::money AS total_salary
FROM vandy_college_playing AS vcp 
JOIN salaries AS s
ON vcp.playerid = s.playerid

