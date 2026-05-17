-- Problem: Second Highest Salary
-- R.Beats: 58.74%

SELECT
    MAX(salary) AS SecondHighestSalary
FROM
    Employee
WHERE
    salary < (
        SELECT
            MAX(salary)
        FROM
            Employee
    );