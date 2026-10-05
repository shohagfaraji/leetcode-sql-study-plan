-- Problem: Find Students Who Improved
-- R.Beats: 49.74%

WITH first_last AS (
    SELECT
        student_id,
        subject,
        MIN(exam_date) AS first_date,
        MAX(exam_date) AS latest_date
    FROM
        Scores
    GROUP BY
        student_id,
        subject
)

SELECT
    s1.student_id,
    s1.subject,
    s1.score AS first_score,
    s2.score AS latest_score
FROM
    first_last AS fl
JOIN
    Scores AS s1
    ON s1.student_id = fl.student_id
    AND s1.subject = fl.subject
    AND s1.exam_date = fl.first_date
JOIN
    Scores AS s2
    ON s2.student_id = fl.student_id
    AND s2.subject = fl.subject
    AND s2.exam_date = fl.latest_date
WHERE
    s1.score < s2.score
ORDER BY
    s1.student_id ASC,
    s1.subject ASC;