-- Problem: Seasonal Sales Analysis
-- R.Beats: 56.65%

WITH ranked AS (
    SELECT
        CASE
            WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall'
            WHEN MONTH(s.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6, 7, 8) THEN 'Summer'
            ELSE 'Winter'
        END AS season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY
                CASE
                    WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall'
                    WHEN MONTH(s.sale_date) IN (3, 4, 5) THEN 'Spring'
                    WHEN MONTH(s.sale_date) IN (6, 7, 8) THEN 'Summer'
                    ELSE 'Winter'
                END
            ORDER BY
                SUM(s.quantity) DESC,
                SUM(s.quantity * s.price) DESC,
                p.category
        ) AS rn
    FROM
        sales as s
    JOIN
        products as p
        ON s.product_id = p.product_id
    GROUP BY
        season,
        p.category
)

SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM
    ranked
WHERE
    rn = 1;