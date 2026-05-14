-- Problem: List the Products Ordered in a Period
-- R.Beats: 70.77%

SELECT
    product_name,
    SUM(o.unit) AS unit
FROM
    Products AS p
RIGHT JOIN
    Orders AS o
    ON p.product_id = o.product_id
WHERE
    order_date >= '2020-02-01'
    AND order_date <= '2020-02-29'
GROUP BY
    p.product_id,
    p.product_name
HAVING
    SUM(o.unit) >= 100;