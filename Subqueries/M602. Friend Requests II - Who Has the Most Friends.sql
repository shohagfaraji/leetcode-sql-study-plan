-- Problem: Friend Requests II: Who Has the Most Friends
-- R.Beats: 96.67%

SELECT
    id,
    COUNT(*) AS num
FROM (
    SELECT
        requester_id AS id
    FROM
        RequestAccepted

    union all

    SELECT
        accepter_id AS id
    FROM
        RequestAccepted
) AS friends
GROUP BY
    id
ORDER BY
    num DESC
limit 1;