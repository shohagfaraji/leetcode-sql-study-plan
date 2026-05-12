-- Problem: Project Employees I
-- R.Beats: 45.14%

SELECT
    p.project_id,
    round(
        AVG(e.experience_years),
        2
    ) AS average_years
FROM
    Project AS p
INNER JOIN
    Employee AS e
    ON e.employee_id = p.employee_id
GROUP BY
    p.project_id;