-- Problem: Count Salary Categories
-- R.Beats: 69.27%

WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),

salary_count AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        COUNT(*) AS accounts_count
    FROM
        Accounts
    GROUP BY
        category
)

SELECT
    c.category,
    COALESCE(s.accounts_count, 0) AS accounts_count
FROM
    categories AS c
LEFT JOIN
    salary_count AS s
    ON c.category = s.category;