-- Problem: Bank Account Summary II
-- R.Beats: 90.80%

WITH high_balance_accounts AS (
    SELECT
        account,
        SUM(amount) AS balance
    FROM
        Transactions
    GROUP BY
        account
    HAVING
        SUM(amount) > 10000
)

SELECT
    name,
    balance
FROM
    Users AS u
JOIN
    high_balance_accounts AS h
    ON u.account = h.account;