-- Problem: Customer Who Visited but Did Not Make Any Transactions
-- R.Beats: 47.13%

SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM
    Visits AS v
LEFT JOIN
    Transactions AS t
    ON v.visit_id = t.visit_id
WHERE
    t.transaction_id IS NULL
GROUP BY
    v.customer_id;