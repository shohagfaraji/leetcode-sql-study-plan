-- Problem: Find Students Who Improved
-- R.Beats: 25.92%

WITH ranked_exams AS (
    SELECT
        student_id,
        subject,
        score,
        exam_date,
        ROW_NUMBER() OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date
        ) AS first_exam,
        ROW_NUMBER() OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date DESC
        ) AS latest_exam
    FROM
        Scores
),
student_scores AS (
    SELECT
        student_id,
        subject,
        MAX(
            CASE
                WHEN first_exam = 1 THEN score
            END
        ) AS first_score,
        MAX(
            CASE
                WHEN latest_exam = 1 THEN score
            END
        ) AS latest_score
    FROM
        ranked_exams
    GROUP BY
        student_id, subject
)

SELECT
    student_id,
    subject,
    first_score,
    latest_score
FROM
    student_scores
WHERE
    first_score < latest_score
ORDER BY
    student_id ASC,
    subject ASC;