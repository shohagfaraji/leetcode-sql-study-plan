-- Problem: Bank Account Summary II
-- R.Beats: 94.71%

SELECT
    name,
    SUM(amount) AS balance
FROM
    Users AS u
JOIN
    Transactions AS t
    ON u.account = t.account
GROUP BY
    u.account
HAVING
    balance > 10000;