-- Problem: Primary Department for Each Employee
-- R.Beats: 52.75%

SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y'

UNION

SELECT
    e.employee_id,
    e.department_id
FROM
    Employee AS e
JOIN (
    SELECT
        employee_id
    FROM
        Employee
    GROUP BY
        employee_id
    HAVING
        COUNT(*) = 1
) AS single_dept
    ON e.employee_id = single_dept.employee_id;