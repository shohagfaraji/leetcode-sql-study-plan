-- Problem: Number of Unique Subjects Taught by Each Teacher
-- R.Beats: 75.82%

SELECT
    t.teacher_id,
    COUNT(DISTINCT t.subject_id) AS cnt
FROM
    Teacher AS t
GROUP BY
    t.teacher_id;