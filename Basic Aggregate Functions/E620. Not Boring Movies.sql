-- Problem: Not Boring Movies
-- R.Beats: 67.09%

SELECT
    id,
    movie,
    description,
    rating
FROM
    Cinema
WHERE
    id % 2 = 1
    AND description <> 'boring'
ORDER BY
    rating desc;