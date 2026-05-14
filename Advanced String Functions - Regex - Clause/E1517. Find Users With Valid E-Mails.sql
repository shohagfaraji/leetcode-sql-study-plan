-- Problem: Find Users With Valid E-Mails
-- R.Beats: 61.50%

SELECT
    user_id,
    name,
    mail
FROM
    Users
WHERE
    mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$'
    AND mail like BINARY '%@leetcode.com';
