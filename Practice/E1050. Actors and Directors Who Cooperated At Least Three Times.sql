-- Problem: Actors and Directors Who Cooperated At Least Three Times
-- R.Beats: 70.76%

SELECT
    actor_id,
    director_id
FROM
    ActorDirector
GROUP BY
    actor_id,
    director_id
HAVING
    COUNT(*) >= 3;