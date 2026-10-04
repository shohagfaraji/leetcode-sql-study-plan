-- Problem: The Latest Login in 2020
-- R.Beats: 94.48%

SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM
    Logins
WHERE
    YEAR(time_stamp) = 2020
GROUP BY
    user_id;