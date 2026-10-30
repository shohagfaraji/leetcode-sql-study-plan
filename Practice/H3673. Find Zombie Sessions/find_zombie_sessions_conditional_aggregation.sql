-- Problem: Find Zombie Sessions
-- R.Beats: 23.57%

SELECT
    session_id,
    user_id,
    TIMESTAMPDIFF(MINUTE, MIN(event_timestamp), MAX(event_timestamp)) AS session_duration_minutes,
    SUM(event_type = 'scroll') AS scroll_count
FROM
    app_events
GROUP BY
    session_id,
    user_id
HAVING
    MAX(event_timestamp) > DATE_ADD(MIN(event_timestamp), INTERVAL 30 MINUTE)
    AND scroll_count >= 5
    AND SUM(event_type = 'click') * 5 < scroll_count
    AND SUM(event_type = 'purchase') = 0
ORDER BY
    scroll_count DESC,
    session_id ASC;