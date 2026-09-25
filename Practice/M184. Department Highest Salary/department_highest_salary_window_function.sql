-- Problem: Department Highest Salary
-- R.Beats: 85.28%

WITH DeptHighestSalary AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        salary,
        MAX(salary) OVER (
            partition by departmentId
        ) AS dept_max_salary
    FROM
        Employee AS e
    LEFT JOIN
        Department AS d
        ON e.departmentId = d.id
)

SELECT
    Department,
    Employee,
    salary AS Salary
FROM
    DeptHighestSalary
WHERE
    salary = dept_max_salary;