-- Problem: Classes With at Least 5 Students
-- R.Beats: 60.87% 

SELECT
    class
FROM
    Courses
GROUP BY
    class
HAVING
    COUNT(student) >= 5;