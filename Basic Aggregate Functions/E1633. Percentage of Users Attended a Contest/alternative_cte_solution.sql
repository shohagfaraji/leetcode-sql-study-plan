-- Problem: Percentage of Users Attended a Contest
-- R.Beats: 47.31%

WITH total_users AS (
    SELECT COUNT(*) AS total
    FROM Users
)
SELECT
    r.contest_id,
    ROUND(
        100.0 * COUNT(DISTINCT r.user_id) / t.total,
        2
    ) AS percentage
FROM
    Register AS r
CROSS JOIN
    total_users AS t
GROUP BY
    r.contest_id,
    t.total
ORDER BY
    percentage DESC,
    r.contest_id ASC;
