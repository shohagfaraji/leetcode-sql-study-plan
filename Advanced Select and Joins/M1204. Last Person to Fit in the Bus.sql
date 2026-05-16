-- Problem: Last Person to Fit in the Bus
-- R.Beats: 74.03%

WITH running_weights AS (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)

SELECT
    person_name
FROM
    running_weights
WHERE
    total_weight <= 1000
ORDER BY
    total_weight DESC
LIMIT 1;