-- Problem: Find COVID Recovery Patients
-- R.Beats: 54.56%

WITH first_positive AS (
    SELECT
        patient_id,
        MIN(test_date) AS first_positive_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id
),
first_negative_after_positive AS (
    SELECT
        t.patient_id,
        MIN(t.test_date) AS first_negative_date
    FROM covid_tests AS t
    JOIN first_positive AS fp
        ON t.patient_id = fp.patient_id
        AND t.test_date > fp.first_positive_date
    WHERE t.result = 'Negative'
    GROUP BY t.patient_id
)
SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(
        fn.first_negative_date,
        fp.first_positive_date
    ) AS recovery_time
FROM first_positive AS fp
JOIN first_negative_after_positive AS fn
    ON fp.patient_id = fn.patient_id
JOIN patients AS p
    ON p.patient_id = fp.patient_id
ORDER BY
    recovery_time ASC,
    p.patient_name ASC;