-- Problem: Replace Employee ID With The Unique Identifier
-- R.Beats: 59.04%

SELECT
    eu.unique_id,
    e.name
FROM
    Employees AS e
LEFT JOIN
    EmployeeUNI AS eu
    ON e.id = eu.id