-- Problem: Market Analysis I
-- R.Beats: 84.12%

SELECT
    user_id AS buyer_id,
    join_date,
    SUM(
        IF(
            order_date >= '2019-01-01'
            AND order_date < '2020-01-01',
            1,
            0
        )
    ) AS orders_in_2019
FROM
    Users
LEFT JOIN
    Orders
    ON user_id = buyer_id
GROUP BY
    user_id;