-- Problem: Rank Scores
-- R.Beats: 97.16%

SELECT
    score,
    DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS `RANK`
FROM
    Scores;