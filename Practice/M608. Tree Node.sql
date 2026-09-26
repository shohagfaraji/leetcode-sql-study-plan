-- Problem: Tree Node
-- R.Beats: 67.47%

WITH node_summary AS (
    SELECT
        p.id AS node_id,
        p.p_id AS parent_id,
        c.id AS child_id,
        c.p_id AS child_parent_id,
        COUNT(c.id) AS child_count
    FROM
        Tree AS p
    LEFT JOIN
        Tree AS c
        ON p.id = c.p_id
    GROUP BY
        p.id,
        p.p_id
)

SELECT
    node_id AS id,
    CASE
        WHEN parent_id IS NULL THEN 'Root'
        WHEN child_count = 0 THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM
    node_summary
ORDER BY
    id;