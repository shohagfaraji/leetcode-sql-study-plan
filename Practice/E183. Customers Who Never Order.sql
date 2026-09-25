-- Problem: Customers Who Never Order
-- R.Beats: 58.72%

SELECT
    name AS Customers
FROM
    Customers
WHERE
    id NOT IN (
        SELECT
            customerId
        FROM
            Orders
    )