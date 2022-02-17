/*
13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this 
claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed pitchers are compared with right-handed pitchers. 
Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?
*/

--Number of left-handed players = 3654 (20% of total)
--Number of right-handed players = 14,480 (80% of total)
--Number of left-handed players to win the Cy Young Award = 37 (33% of total)
--Number of right-handed players to win the Cy Young Award = 75 (67% of total)
--Number of left-handed players to be inducted into the Hall of Fame = 52 (18% of total)
--Number of right-handed players to be inducted into the Hall of Fame = 231 (82% of total)

/* Answer: It seems that being left-handed is going to be advantageous for winning the Cy Young Award, but not for being inducted into the Hall of Fame.
           Additionally, it is the case that being left-handed is helpful for getting into the major leagues in the first place, since research suggests 
		   that only 10-12% of the world's population is left-handed. */

SELECT COUNT(*)
FROM people
WHERE throws = 'L';
	 
--Number of left-handed players = 3654 (20% of total)
	 
SELECT COUNT (*)
FROM people
WHERE throws = 'R';

--Number of right-handed players = 14,480 (80% of total)

SELECT COUNT(*)
FROM awardsplayers AS ap
JOIN people AS p ON p.playerid = ap.playerid
WHERE awardid = 'Cy Young Award'
AND throws = 'L';

--Number of left-handed players to win the Cy Young Award = 37 (33% of total)

SELECT COUNT(*)
FROM awardsplayers AS ap
JOIN people AS p ON p.playerid = ap.playerid
WHERE awardid = 'Cy Young Award'
AND throws = 'R';

--Number of right-handed players to win the Cy Young Award = 75 (67% of total)

SELECT COUNT(*) 
FROM halloffame AS hof
JOIN people AS p ON hof.playerid = p.playerid
WHERE inducted = 'Y'
AND throws = 'L';

--Number of left-handed players to be inducted into the Hall of Fame = 52 (18% of total)

SELECT COUNT(*) 
FROM halloffame AS hof
JOIN people AS p ON hof.playerid = p.playerid
WHERE inducted = 'Y'
AND throws = 'R';

--Number of right-handed players to be inducted into the Hall of Fame = 231 (82% of total)

