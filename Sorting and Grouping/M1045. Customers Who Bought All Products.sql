-- Problem: Customers Who Bought All Products
-- R.Beats: 62.92%

SELECT
    c.customer_id
FROM
    Customer AS c
GROUP BY
    c.customer_id
HAVING
    COUNT(DISTINCT c.product_key) = (
        SELECT
            COUNT(*)
        FROM
            Product
    );