-- Problem: Find Emotionally Consistent Users
-- R.Beats: 46.35%

WITH reaction_counts AS (
    SELECT
        user_id,
        reaction,
        COUNT(*) AS reaction_count
    FROM
        reactions
    GROUP BY
        user_id,
        reaction
),
ranked_reactions AS (
    SELECT
        user_id,
        reaction,
        reaction_count,
        SUM(reaction_count) OVER (
            PARTITION BY user_id
        ) AS total_reactions,
        RANK() OVER (
            PARTITION BY user_id
            ORDER BY reaction_count DESC
        ) AS reaction_rank
    FROM
        reaction_counts
)

SELECT
    user_id,
    reaction AS dominant_reaction,
    ROUND(reaction_count / total_reactions, 2) AS reaction_ratio
FROM
    ranked_reactions
WHERE
    reaction_rank = 1
    AND total_reactions >= 5
    AND reaction_count / total_reactions >= 0.60
ORDER BY
    reaction_ratio DESC,
    user_id ASC;