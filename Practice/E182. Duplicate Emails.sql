-- Problem: Duplicate Emails
-- R.Beats: 84.93%

SELECT
    email AS Email
FROM
    Person
GROUP BY
    email
HAVING
    COUNT(id) > 1;