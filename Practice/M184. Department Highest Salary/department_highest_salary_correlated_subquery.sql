-- Problem: Department Highest Salary
-- R.Beats: 39.51%

SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM
    Employee AS e
JOIN
    Department AS d
    ON e.departmentId = d.id
WHERE e.salary = (
    SELECT
        MAX(e2.salary)
    FROM
        Employee AS e2
    WHERE
        e2.departmentId = e.departmentId
);