-- Problem: Seasonal Sales Analysis
-- R.Beats: 46.47%

WITH seasonal_sales AS (
    SELECT
        CASE
            WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall'
            WHEN MONTH(s.sale_date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6, 7, 8) THEN 'Summer'
            WHEN MONTH(s.sale_date) IN (12, 1, 2) THEN 'Winter'
        END AS season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue
    FROM sales as s
    JOIN
        products as p
        ON s.product_id = p.product_id
    GROUP BY
        season,
        p.category
),
ranked AS (
    SELECT
        season,
        category,
        total_quantity,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY season
            ORDER BY
                total_quantity DESC,
                total_revenue DESC,
                category ASC
        ) AS rn
    FROM seasonal_sales
)

SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM
    ranked
WHERE
    rn = 1
ORDER BY
    season;