-- Problem: Find Customer Referee
-- R.Beats: 66.20%

SELECT
    c.name
FROM
    Customer AS c
WHERE
    COALESCE(c.referee_id, -1) != 2;