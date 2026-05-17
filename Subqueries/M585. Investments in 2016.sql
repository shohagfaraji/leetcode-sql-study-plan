-- Problem: Investments in 2016
-- R.Beats: 56.85%

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
    SELECT 
        tiv_2016,
        COUNT(*) OVER(PARTITION BY tiv_2015) AS same_tiv2015,
        COUNT(*) OVER(PARTITION BY lat, lon) AS same_location
    FROM
        Insurance
) AS t
WHERE
    same_tiv2015 > 1
    AND same_location = 1;