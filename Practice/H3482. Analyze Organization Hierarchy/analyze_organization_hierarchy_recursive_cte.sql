-- Problem: Analyze Organization Hierarchy
-- R.Beats: 19.68%

WITH RECURSIVE org AS (
   SELECT
       employee_id,
       employee_name,
       manager_id,
       salary,
       1 AS level
   FROM Employees
   WHERE manager_id IS NULL

   UNION ALL

   SELECT
       e.employee_id,
       e.employee_name,
       e.manager_id,
       e.salary,
       o.level + 1
   FROM Employees e
   JOIN org o
       ON e.manager_id = o.employee_id
),
hierarchy AS (
   SELECT
       employee_id AS manager_id,
       employee_id AS subordinate_id,
       salary
   FROM Employees

   UNION ALL

   SELECT
       h.manager_id,
       e.employee_id,
       e.salary
   FROM hierarchy h
   JOIN Employees e
       ON e.manager_id = h.subordinate_id
),
team_stats AS (
   SELECT
       manager_id AS employee_id,
       COUNT(*) - 1 AS team_size,
       SUM(salary) AS budget
   FROM hierarchy
   GROUP BY manager_id
)

SELECT
   o.employee_id,
   o.employee_name,
   o.level,
   t.team_size,
   t.budget
FROM org o
JOIN team_stats t
   ON o.employee_id = t.employee_id
ORDER BY
   o.level ASC,
   t.budget DESC,
   o.employee_name ASC;