-- Problem: Game Play Analysis IV
-- R.Beats: 67.47%

SELECT
    ROUND(
        AVG(CASE
                WHEN next_day.player_id IS NOT NULL THEN 1
                ELSE 0
            END
        ),
        2
    ) AS fraction
FROM (
    SELECT
        player_id,
        MIN(event_date) AS initial_game
    FROM
        Activity
    GROUP BY
        player_id
) AS first_activity
LEFT JOIN
    Activity AS next_day
    ON first_activity.player_id = next_day.player_id
    AND next_day.event_date = DATE_ADD(first_activity.initial_game, INTERVAL 1 DAY);