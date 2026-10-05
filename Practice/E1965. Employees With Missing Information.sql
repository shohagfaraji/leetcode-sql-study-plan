-- Problem: Employees With Missing Information
-- R.Beats: 60.50%

SELECT
    e.employee_id
FROM
    Employees AS e
LEFT JOIN
    Salaries AS s
    ON e.employee_id = s.employee_id
WHERE
    s.employee_id IS NULL

UNION ALL

SELECT
    s.employee_id
FROM
    Employees AS e
RIGHT JOIN
    Salaries AS s
    ON e.employee_id = s.employee_id
WHERE
    e.employee_id IS NULL

ORDER BY
    employee_id;