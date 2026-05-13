-- Problem: Triangle Judgement
-- R.Beats: 68.61%

SELECT
    x,
    y,
    z,
    IF(
        x + y + z - GREATEST(x, y, z) > GREATEST(x, y, z),
        'Yes',
        'No'
    ) AS triangle
FROM Triangle;
