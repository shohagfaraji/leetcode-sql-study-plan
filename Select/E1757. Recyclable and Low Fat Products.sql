-- Problem: Recyclable and Low Fat Products
-- R.Beats: 36.05%

SELECT
    p.product_id
FROM
    Products AS p
WHERE
    p.low_fats = 'Y'
    AND p.recyclable = 'Y';