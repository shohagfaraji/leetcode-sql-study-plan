-- Problem: Find Books with Polarized Opinions
-- R.Beats: 98.93%

SELECT
    b.book_id,
    b.title,
    b.author,
    b.genre,
    b.pages,
    MAX(r.session_rating) - MIN(r.session_rating) AS rating_spread,
    ROUND(AVG(r.session_rating <= 2 OR r.session_rating >= 4), 2) AS polarization_score
FROM
    books as b
JOIN
    reading_sessions as r
    ON b.book_id = r.book_id
GROUP BY
    b.book_id,
    b.title,
    b.author,
    b.genre,
    b.pages
HAVING
    COUNT(*) >= 5
    AND MIN(r.session_rating) <= 2
    AND MAX(r.session_rating) >= 4
    AND AVG(r.session_rating <= 2 OR r.session_rating >= 4) >= 0.6
ORDER BY
    polarization_score DESC,
    b.title DESC;