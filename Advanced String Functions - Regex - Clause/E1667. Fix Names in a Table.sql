-- Problem: Fix Names in a Table
-- R.Beats: 44.08%

SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2, LENGTH(name)))
    ) AS name
FROM
    Users
ORDER BY
    user_id;