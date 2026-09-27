-- Problem: Swap Sex of Employees
-- R.Beats: 89.73%

UPDATE Salary
SET sex = IF(sex = 'f', 'm', 'f');