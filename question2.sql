SELECT p.namefirst, p.namelast, p.height AS height_inches, a.G_all AS games_played, a.teamID
FROM people AS p INNER JOIN appearances AS a ON p.playerid = a.playerid
ORDER BY p.height
LIMIT 1;
