-- Problem: Big Countries
-- R.Beats: 57.35%

SELECT
    w.name,
    w.population,
    w.area
FROM
    World AS w
WHERE
    w.area >= 3000000
    OR w.population >= 25000000;