-- Problem: Find Consistently Improving Employees
-- R.Beats: 77.89%

WITH ranked_reviews AS (
    SELECT
        employee_id,
        rating,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY review_date DESC
        ) AS review_rank
    FROM
        performance_reviews
)

SELECT
    r.employee_id,
    e.name,
    (MAX(CASE WHEN r.review_rank = 1 THEN r.rating END)
     - MAX(CASE WHEN r.review_rank = 3 THEN r.rating END)) AS improvement_score
FROM
    ranked_reviews AS r
JOIN
    employees AS e
    ON r.employee_id = e.employee_id
WHERE
    r.review_rank <= 3
GROUP BY
    r.employee_id,
    e.name
HAVING
    MAX(CASE WHEN r.review_rank = 1 THEN r.rating END)
    > MAX(CASE WHEN r.review_rank = 2 THEN r.rating END)
    AND
    MAX(CASE WHEN r.review_rank = 2 THEN r.rating END)
    > MAX(CASE WHEN r.review_rank = 3 THEN r.rating END)
ORDER BY
    improvement_score DESC,
    e.name ASC;