-- Problem: Consecutive Numbers
-- R.Beats: 76.43%

SELECT
    DISTINCT l1.num AS ConsecutiveNums
FROM
    Logs AS l1,
    Logs AS l2,
    Logs AS l3
WHERE
    l3.id - l2.id = 1
    AND l2.id - l1.id = 1
    AND l3.id - l1.id = 2
    AND l3.num = l2.num
    AND l2.num = l1.num;
