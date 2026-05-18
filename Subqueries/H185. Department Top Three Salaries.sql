-- Problem: Department Top Three Salaries
-- R.Beats: 83.34%

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
) AS e
LEFT JOIN
    Department AS d
    ON e.departmentId = d.id
WHERE
    e.rnk <= 3;