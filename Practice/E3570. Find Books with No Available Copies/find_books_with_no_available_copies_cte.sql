-- Problem: Find Books with No Available Copies
-- R.Beats: 44.44%

WITH active_borrowers AS (
    SELECT
        book_id,
        COUNT(book_id) AS current_borrowers
    FROM
        borrowing_records
    WHERE
        return_date IS NULL
    GROUP BY
        book_id
)

SELECT
    lb.book_id,
    title,
    author,
    genre,
    publication_year,
    current_borrowers
FROM
    library_books AS lb
LEFT JOIN
    active_borrowers AS ab
    ON lb.book_id = ab.book_id
WHERE
    total_copies = current_borrowers
ORDER BY
    current_borrowers DESC,
    title ASC;