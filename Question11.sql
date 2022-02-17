/* 11. Is there any correlation between number of wins and team salary? Use data from 2000 
		and later to answer this question. As you do this analysis, keep in mind that salaries 
		across the whole league tend to increase together, so you may want to look on a year-by-year basis. */
		
WITH s AS  (SELECT yearid, teamid,
			SUM(salary) AS team_salary
			FROM salaries
			WHERE yearid >= 2000
			GROUP BY yearid, teamid
			ORDER BY teamid, yearid)

SELECT s.yearid, s.teamid, s.team_salary, t.w AS wins
FROM s
JOIN teams AS t
ON s.yearid = t.yearid AND s.teamid = t.teamid
ORDER BY  s.yearid;
 -- There does not appear to be a correlation between number of wins and team salary.
