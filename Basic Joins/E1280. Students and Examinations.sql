-- Problem: Students and Examinations
-- R.Beats: 67.73%

SELECT
    st.student_id,
    st.student_name,
    sb.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM
    Students AS st
cross JOIN
    Subjects AS sb
LEFT JOIN
    Examinations AS e
    ON e.student_id = st.student_id
    AND e.subject_name = sb.subject_name
GROUP BY
    st.student_id,
    st.student_name,
    sb.subject_name
ORDER BY
    st.student_id,
    st.student_name;