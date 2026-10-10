-- Problem: Find Drivers with Improved Fuel Efficiency
-- R.Beats: 67.08%

WITH trip_efficiencies AS (
    SELECT
        driver_id,
        distance_km / fuel_consumed AS fuel_efficiency,
        CASE
            WHEN trip_date BETWEEN '2023-01-01' AND '2023-06-30' THEN 1
            ELSE 2
        END AS half_year
    FROM
        trips
),
driver_half_year_averages AS (
    SELECT
        driver_id,
        AVG(
            CASE WHEN half_year = 1 THEN fuel_efficiency END
        ) AS first_half_avg,
        AVG(
            CASE WHEN half_year = 2 THEN fuel_efficiency END
        ) AS second_half_avg
    FROM
        trip_efficiencies
    GROUP BY
        driver_id
)

SELECT
    d.driver_id,
    d.driver_name,
    ROUND(dha.first_half_avg, 2) AS first_half_avg,
    ROUND(dha.second_half_avg, 2) AS second_half_avg,
    ROUND(
        dha.second_half_avg - dha.first_half_avg, 2
    ) AS efficiency_improvement
FROM
    driver_half_year_averages AS dha
JOIN
    drivers AS d
    ON dha.driver_id = d.driver_id
WHERE
    dha.first_half_avg IS NOT NULL
    AND dha.second_half_avg > dha.first_half_avg
ORDER BY
    efficiency_improvement DESC,
    d.driver_name ASC;