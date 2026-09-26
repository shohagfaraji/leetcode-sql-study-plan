-- Problem: Sales Person
-- R.Beats: 91.69%

WITH salesperson_orders AS (
    SELECT
        s.sales_id,
        s.name,
        o.com_id
    FROM
        SalesPerson AS s
    LEFT JOIN
        Orders AS o
        ON s.sales_id = o.sales_id
),

salesperson_company_orders AS (
    SELECT
        so.sales_id,
        so.name,
        so.com_id,
        c.name AS com_name
    FROM
        salesperson_orders AS so
    LEFT JOIN
        Company AS c
        ON so.com_id = c.com_id
)

SELECT DISTINCT
    name
FROM
    salesperson_company_orders AS x
WHERE NOT EXISTS (
    SELECT
        1
    FROM
        salesperson_company_orders AS y
    WHERE
        x.sales_id = y.sales_id
        AND y.com_name = 'RED'
);