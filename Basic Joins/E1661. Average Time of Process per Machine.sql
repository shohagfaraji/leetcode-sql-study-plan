-- Problem: Average Time of Process per Machine
-- R.Beats: 56.52%

SELECT
    str.machine_id,
    ROUND(
        AVG(end.timestamp - str.timestamp),
        3
    ) AS processing_time
FROM Activity AS str
JOIN Activity AS end
    ON str.machine_id = end.machine_id
   AND str.process_id = end.process_id
WHERE str.activity_type = 'start'
  AND end.activity_type = 'end'
GROUP BY str.machine_id;
