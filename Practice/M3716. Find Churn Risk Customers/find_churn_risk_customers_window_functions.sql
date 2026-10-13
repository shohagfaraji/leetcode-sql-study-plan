-- Problem: Find Churn Risk Customers
-- R.Beats: 62.01%

WITH ranked_events AS (
    SELECT
        user_id,
        event_type,
        plan_name,
        monthly_amount,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY event_date DESC, event_id DESC
        ) AS rn,
        MAX(monthly_amount) OVER (
            PARTITION BY user_id
        ) AS max_historical_amount,
        SUM(event_type = 'downgrade') OVER (
            PARTITION BY user_id
        ) AS downgrade_count,
        DATEDIFF(
            MAX(event_date) OVER (
                PARTITION BY user_id
            ),
            MIN(event_date) OVER (
                PARTITION BY user_id
            )
        ) AS days_as_subscriber
    FROM
        subscription_events
)

SELECT
    user_id,
    plan_name AS current_plan,
    monthly_amount AS current_monthly_amount,
    max_historical_amount,
    days_as_subscriber
FROM
    ranked_events
WHERE
    rn = 1
    AND event_type <> 'cancel'
    AND downgrade_count > 0
    AND monthly_amount < 0.5 * max_historical_amount
    AND days_as_subscriber >= 60
ORDER BY
    days_as_subscriber DESC,
    user_id ASC;