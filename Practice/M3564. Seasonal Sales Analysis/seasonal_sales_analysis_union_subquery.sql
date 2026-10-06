-- Problem: Seasonal Sales Analysis
-- R.Beats: 72.73%

(
    SELECT
        'Fall' AS season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM (
        SELECT
            product_id,
            quantity,
            price
        FROM
            sales
        WHERE
            monthname(sale_date) = 'September'
            OR monthname(sale_date) = 'October'
            OR monthname(sale_date) = 'November'
    ) AS fall_sales
    JOIN
        products AS p
        ON fall_sales.product_id = p.product_id
    GROUP BY
        category
    ORDER BY
        total_quantity DESC,
        total_revenue DESC,
        category ASC
    LIMIT 1
)

UNION

(
    SELECT
        'Spring' AS season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM (
        SELECT
            product_id,
            quantity,
            price
        FROM
            sales
        WHERE
            monthname(sale_date) = 'March'
            OR monthname(sale_date) = 'April'
            OR monthname(sale_date) = 'May'
    ) AS spring_sales
    JOIN
        products AS p
        ON spring_sales.product_id = p.product_id
    GROUP BY
        category
    ORDER BY
        total_quantity DESC,
        total_revenue DESC,
        category ASC
    LIMIT 1
)

UNION

(
    SELECT
        'Summer' AS season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM (
        SELECT
            product_id,
            quantity,
            price
        FROM
            sales
        WHERE
            monthname(sale_date) = 'June'
            OR monthname(sale_date) = 'July'
            OR monthname(sale_date) = 'August'
    ) AS summer_sales
    JOIN
        products AS p
        ON summer_sales.product_id = p.product_id
    GROUP BY
        category
    ORDER BY
        total_quantity DESC,
        total_revenue DESC,
        category ASC
    LIMIT 1
)

UNION

(
    SELECT
        'Winter' AS season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM (
        SELECT
            product_id,
            quantity,
            price
        FROM
            sales
        WHERE
            monthname(sale_date) = 'December'
            OR monthname(sale_date) = 'January'
            OR monthname(sale_date) = 'February'
    ) AS winter_sales
    JOIN
        products AS p
        ON winter_sales.product_id = p.product_id
    GROUP BY
        category
    ORDER BY
        total_quantity DESC,
        total_revenue DESC,
        category ASC
    LIMIT 1
);