-- Problem: Find Books with No Available Copies
-- R.Beats: 75.67%

SELECT
    lb.book_id,
    title,
    author,
    genre,
    publication_year,
    COUNT(lb.book_id) AS current_borrowers
FROM
    library_books AS lb
JOIN
    borrowing_records AS br
    ON lb.book_id = br.book_id
WHERE
    br.return_date IS NULL
GROUP BY
    lb.book_id,
    lb.title,
    lb.author,
    lb.genre,
    lb.publication_year,
    lb.total_copies
HAVING
    current_borrowers = lb.total_copies
ORDER BY
    current_borrowers DESC,
    title ASC;