-- Problem: Swap Sex of Employees
-- R.Beats: 58.38%

UPDATE
    Salary
SET sex = CASE
    WHEN sex = 'm' THEN 'f'
    ELSE 'm'
END;