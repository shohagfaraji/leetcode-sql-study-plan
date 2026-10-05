-- Problem: Find Users with High Token Usage
-- R.Beats: 56.07%

SELECT
    user_id,
    COUNT(user_id) AS prompt_count,
    round(AVG(tokens), 2) AS avg_tokens
FROM
    prompts
GROUP BY
    user_id
HAVING
    prompt_count >= 3
    AND MAX(tokens) > avg_tokens
ORDER BY
    avg_tokens DESC,
    user_id ASC;