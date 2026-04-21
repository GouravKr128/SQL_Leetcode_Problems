# Write your MySQL query statement below
# 1. Instead on first_value() over() use min()
# 2. instead joining activity table with itself, join it with first login
WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM activity
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM activity), 2
    ) AS fraction
FROM activity a
JOIN first_login f ON a.player_id = f.player_id
WHERE DATEDIFF(a.event_date, f.first_date) = 1;
