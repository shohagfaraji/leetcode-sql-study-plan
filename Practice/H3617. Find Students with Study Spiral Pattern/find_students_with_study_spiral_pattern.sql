-- Problem: Find Students with Study Spiral Pattern
-- R.Beats: 65.04%

WITH RECURSIVE ordered AS (
    SELECT
        student_id,
        subject,
        session_date,
        hours_studied,
        ROW_NUMBER() OVER (
            PARTITION BY student_id
            ORDER BY session_date, session_id
        ) AS rn,
        LEAD(session_date) OVER (
            PARTITION BY student_id
            ORDER BY session_date, session_id
        ) AS next_date
    FROM
        study_sessions
),
totals AS (
    SELECT
        student_id,
        COUNT(*) AS total_sessions,
        SUM(hours_studied) AS total_study_hours
    FROM
        study_sessions
    GROUP BY
        student_id
),
date_ok AS (
    SELECT
        student_id
    FROM
        ordered
    GROUP BY
        student_id
    HAVING
        COALESCE(MAX(DATEDIFF(next_date, session_date)), 0) <= 2
),
max_half AS (
    SELECT
        FLOOR(MAX(total_sessions) / 2) AS m
    FROM
        totals
),
periods AS (
    SELECT
        3 AS p

    UNION ALL

    SELECT
        p + 1
    FROM
        periods,
        max_half
    WHERE
        p < max_half.m
),
candidates AS (
    SELECT
        t.student_id,
        pr.p AS period
    FROM
        totals AS t
    JOIN
        periods AS pr
        ON pr.p * 2 <= t.total_sessions
),
period_checks AS (
    SELECT
        c.student_id,
        c.period,
        SUM(
            CASE
                WHEN o2.subject IS NOT NULL
                    AND o2.subject <> o1.subject
                THEN 1
                ELSE 0
            END
        ) AS mismatches
    FROM
        candidates AS c
    JOIN
        ordered AS o1
        ON o1.student_id = c.student_id
    LEFT JOIN
        ordered AS o2
        ON o2.student_id = c.student_id
        AND o2.rn = o1.rn + c.period
    GROUP BY
        c.student_id,
        c.period
),
distinct_check AS (
    SELECT
        c.student_id,
        c.period,
        COUNT(DISTINCT o.subject) AS distinct_subjects
    FROM
        candidates AS c
    JOIN
        ordered AS o
        ON o.student_id = c.student_id
        AND o.rn <= c.period
    GROUP BY
        c.student_id,
        c.period
),
valid_periods AS (
    SELECT
        pc.student_id,
        pc.period
    FROM
        period_checks AS pc
    JOIN
        distinct_check AS dc
        ON dc.student_id = pc.student_id
        AND dc.period = pc.period
    WHERE
        pc.mismatches = 0
        AND dc.distinct_subjects = pc.period
),
best_period AS (
    SELECT
        student_id,
        MIN(period) AS cycle_length
    FROM
        valid_periods
    GROUP BY
        student_id
)

SELECT
    s.student_id,
    s.student_name,
    s.major,
    b.cycle_length,
    t.total_study_hours
FROM
    students AS s
JOIN
    best_period AS b
    ON b.student_id = s.student_id
JOIN
    totals AS t
    ON t.student_id = s.student_id
JOIN
    date_ok AS d
    ON d.student_id = s.student_id
ORDER BY
    4 DESC,
    5 DESC;