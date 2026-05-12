-- Problem: Percentage of Users Attended a Contest
-- R.Beats: 67.60%

SELECT
    r.contest_id,
    ROUND(
        100.0 * COUNT(DISTINCT r.user_id) /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM
    Register AS r
GROUP BY
    r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id ASC;

