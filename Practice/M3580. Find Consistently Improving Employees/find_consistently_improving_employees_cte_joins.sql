-- Problem: Find Consistently Improving Employees
-- R.Beats: 28.19%

WITH ranked_reviews AS (
    SELECT
        employee_id,
        rating,
        ROW_NUMBER() OVER (
            partition by employee_id
            ORDER BY review_date DESC
        ) AS review_rank
    FROM
        performance_reviews
)

SELECT
    latest_review.employee_id,
    e.name,
    (latest_review.rating - third_latest_review.rating) AS improvement_score
FROM
    ranked_reviews AS latest_review
JOIN
    ranked_reviews AS second_latest_review
    ON latest_review.employee_id = second_latest_review.employee_id
    AND latest_review.review_rank = 1
    AND second_latest_review.review_rank = 2
JOIN
    ranked_reviews AS third_latest_review
    ON latest_review.employee_id = third_latest_review.employee_id
    AND latest_review.review_rank = 1
    AND third_latest_review.review_rank = 3
JOIN
    employees AS e
    ON latest_review.employee_id = e.employee_id
WHERE
    latest_review.rating > second_latest_review.rating
    AND second_latest_review.rating > third_latest_review.rating
ORDER BY
    improvement_score DESC,
    e.name ASC;