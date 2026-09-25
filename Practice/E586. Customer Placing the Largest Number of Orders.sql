-- Problem: Customer Placing the Largest Number of Orders
-- R.Beats: 94.45%

SELECT
    customer_number
FROM
    Orders
GROUP BY
    customer_number
ORDER BY
    COUNT(*) DESC
limit 1;