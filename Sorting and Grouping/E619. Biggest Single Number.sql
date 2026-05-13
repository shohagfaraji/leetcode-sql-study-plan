-- Problem: Biggest Single Number
-- R.Beats: 64.24%

SELECT
    MAX(num) AS num
FROM (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING
        COUNT(num) = 1
) AS single_numbers;