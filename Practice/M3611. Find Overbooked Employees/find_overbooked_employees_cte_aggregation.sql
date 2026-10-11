-- Problem: Find Overbooked Employees
-- R.Beats: 54.60%

WITH employee_meeting_weeks AS (
    SELECT
        employee_id,
        duration_hours,
        WEEK(meeting_date, 1) AS meeting_week,
        YEAR(meeting_date) AS meeting_year
    FROM
        meetings
),
weekly_employee_hours AS (
    SELECT
        employee_id,
        meeting_week,
        meeting_year,
        SUM(duration_hours) AS total_weekly_hours
    FROM
        employee_meeting_weeks
    GROUP BY
        employee_id,
        meeting_week,
        meeting_year
),
employee_heavy_weeks AS (
    SELECT
        e.employee_id,
        e.employee_name,
        e.department,
        SUM(
            CASE
                WHEN w.total_weekly_hours > 20 THEN 1
                ELSE 0
            END
        ) AS meeting_heavy_weeks
    FROM
        weekly_employee_hours AS w
    JOIN
        employees AS e
        ON e.employee_id = w.employee_id
    GROUP BY
        e.employee_id,
        e.employee_name,
        e.department
)

SELECT
    employee_id,
    employee_name,
    department,
    meeting_heavy_weeks
FROM
    employee_heavy_weeks
WHERE
    meeting_heavy_weeks >= 2
ORDER BY
    meeting_heavy_weeks DESC,
    employee_name ASC;