-- Problem: Movie Rating
-- R.Beats: 36.84%

SELECT
    results
FROM (
    SELECT
        u.name AS results,
        COUNT(*) AS cnt
    FROM
        Users AS u
    JOIN MovieRating AS mr
        ON u.user_id = mr.user_id
    GROUP BY
        u.user_id,
        u.name
    ORDER BY
        cnt DESC,
        u.name
    LIMIT 1
) AS a

UNION ALL

SELECT
    results
FROM (
    SELECT
        m.title AS results,
        AVG(mr.rating) AS avg_rating
    FROM
        Movies AS m
    JOIN MovieRating AS mr
        ON m.movie_id = mr.movie_id
    WHERE
        mr.created_at >= '2020-02-01'
        AND mr.created_at < '2020-03-01'
    GROUP BY
        m.movie_id,
        m.title
    ORDER BY
        avg_rating DESC,
        m.title
    LIMIT 1
) AS b;