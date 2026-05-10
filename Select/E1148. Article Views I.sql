-- Problem: Article Views I
-- R.Beats: 9.46%

SELECT
    DISTINCT v.author_id AS id
FROM
    Views AS v
WHERE
    v.author_id = v.viewer_id
ORDER BY
    id ASC;