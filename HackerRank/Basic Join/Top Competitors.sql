SELECT s.HACKER_ID, h.NAME
FROM Submissions s
inner join Challenges c 
on s.challenge_id = c.challenge_id
inner join Difficulty d
on c.difficulty_level = d.difficulty_level
inner join Hackers h
on s.hacker_id = h.hacker_id
WHERE d.SCORE = s.SCORE
GROUP BY s.hacker_id, h.name
HAVING COUNT(*) >= 2
order by count(*) desc, s.hacker_id asc
