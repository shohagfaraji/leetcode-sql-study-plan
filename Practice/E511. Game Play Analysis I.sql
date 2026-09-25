-- Problem: Game Play Analysis I
-- R.Beats: 94.83%

SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    player_id;