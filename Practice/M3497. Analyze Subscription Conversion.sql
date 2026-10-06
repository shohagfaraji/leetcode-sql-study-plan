-- Problem: Analyze Subscription Conversion
-- R.Beats: 91.94%

SELECT
    user_id,
    MAX(
        CASE
            WHEN activity_type = 'free_trial' THEN avg_duration
        END
    ) AS trial_avg_duration,
    MAX(
        CASE
            WHEN activity_type = 'paid' THEN avg_duration
        END
    ) AS paid_avg_duration
FROM (
    SELECT
        user_id,
        activity_type,
        ROUND(
            AVG(activity_duration),
            2
        ) AS avg_duration
    FROM
        UserActivity
    GROUP BY
        user_id,
        activity_type
) AS activity_summary
GROUP BY
    user_id
HAVING
    trial_avg_duration IS NOT NULL
    AND paid_avg_duration IS NOT NULL
ORDER BY
    user_id;