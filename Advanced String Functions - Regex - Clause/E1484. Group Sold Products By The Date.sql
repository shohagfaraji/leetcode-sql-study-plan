-- Problem: Group Sold Products By The Date
-- R.Beats: 70.63%

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY product
    ) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;