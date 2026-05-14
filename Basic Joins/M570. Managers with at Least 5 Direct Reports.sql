-- Problem: Managers with at Least 5 Direct Reports
-- R.Beats: 75.28%

SELECT
    m.name
FROM
    Employee AS e
JOIN
    Employee AS m
    ON e.managerId = m.id
GROUP BY
    e.managerId
HAVING
    COUNT(e.managerId) >= 5;