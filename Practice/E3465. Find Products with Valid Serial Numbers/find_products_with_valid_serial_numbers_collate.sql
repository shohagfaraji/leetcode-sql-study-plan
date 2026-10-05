-- Problem: Find Products with Valid Serial Numbers
-- R.Beats: 72.57%

SELECT
    product_id,
    product_name,
    description
FROM
    products
WHERE
    description COLLATE utf8mb3_bin REGEXP '(^|[^A-Za-z0-9])SN[0-9]{4}-[0-9]{4}([^A-Za-z0-9]|$)'
ORDER BY
    product_id ASC;