-- Problem: Invalid Tweets
-- R.Beats: 33.55%

SELECT
    t.tweet_id
FROM
    Tweets AS t
WHERE
    LENGTH(t.content) > 15;