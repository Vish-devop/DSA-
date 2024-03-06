/*
- Problem : Ollivander's Inventory
- Problem stmt: 
- Explanation: Needed to use Inner Join, and break down the problem statement into sub-modules
*/
SELECT wands.id, wands_property.age, wands.coins_needed, wands.power 
FROM Wands 
INNER JOIN Wands_Property ON wands.code = wands_property.code 
WHERE (wands.power, wands.code, wands.coins_needed) IN (
    SELECT power, code, MIN(coins_needed) 
    FROM Wands 
    GROUP BY power, code
) 
AND wands_property.is_evil = 0 
ORDER BY wands.power DESC, wands_property.age DESC;

/*
Problem : Weather Observation Station 5
Explanation: Understanding the concepst of limit.
*/
select city, length(city) 
from station 
order by length(city), city limit 1;
select city, length(city) 
from station 
order by length(city) desc, city limit 1;

/*
Problem: Binary Tree Nodes
Explanation: Using the CASE clause
*/
select N, 
CASE 
when p is null then "Root"
when n in (select distinct p from bst) then "Inner"
else "Leaf"
end
from bst 
order by n;

/*
Problem: Challenges
Explanation: using join clause and multiple conditions bifurcating with OR.
*/
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenge_count
FROM Hackers h
JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenge_count = (
  SELECT MAX(challenge_count) AS max_count
  FROM (
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenge_count
    FROM Hackers h
    JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
  ) AS inner_query
)
OR challenge_count IN (
  SELECT DISTINCT c_compare AS c_unique
  FROM (
    SELECT h2.hacker_id, h2.name, COUNT(challenge_id) AS c_compare
    FROM Hackers h2
    JOIN Challenges c ON c.hacker_id = h2.hacker_id
    GROUP BY h2.hacker_id, h2.name
  ) AS counts
  GROUP BY c_compare
  HAVING COUNT(c_compare) = 1
)
ORDER BY challenge_count DESC, h.hacker_id;


/*
Problem: Contest Leaderboard
Explanation: Using the Inner Join() and a subquery for score.
*/
select h.hacker_id, h.name, sum(s.maximum) as total_score
from hackers as h
inner join (
    select hacker_id, challenge_id, max(score) as maximum
    from submissions
    group by hacker_id, challenge_id
)   as s
on h.hacker_id=s.hacker_id
group by h.hacker_id, h.name
having total_score > 0
order by total_score desc, h.hacker_id asc;


