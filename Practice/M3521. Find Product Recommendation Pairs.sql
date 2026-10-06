-- Problem: Find Product Recommendation Pairs
-- R.Beats: 85.31%

SELECT
    u1.product_id AS product1_id,
    u2.product_id AS product2_id,
    p1.category AS product1_category,
    p2.category AS product2_category,
    COUNT(u1.product_id) AS customer_count
FROM
    ProductPurchases AS u1
JOIN
    ProductPurchases AS u2
    ON u1.user_id = u2.user_id
JOIN
    ProductInfo AS p1
    ON p1.product_id = u1.product_id
JOIN
    ProductInfo AS p2
    ON p2.product_id = u2.product_id
WHERE
    u1.product_id < u2.product_id
GROUP BY
    u1.product_id,
    u2.product_id
HAVING
    customer_count >= 3
ORDER BY
    customer_count DESC,
    product1_id ASC,
    product2_id ASC;