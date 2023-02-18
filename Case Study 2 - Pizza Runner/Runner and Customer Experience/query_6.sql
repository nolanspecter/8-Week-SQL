WITH temp AS(
SELECT
	runner_id,
	CASE
    	WHEN r.distance LIKE 'null' THEN null
        WHEN r.distance LIKE '' THEN null
        WHEN r.distance LIKE '%km' THEN TRIM('km' FROM r.distance)
        ELSE r.distance
    END AS distance,
    CASE
    	WHEN r.duration LIKE 'null' THEN null
        WHEN r.duration LIKE '' THEN null
        WHEN r.duration LIKE '%minute' THEN TRIM('minute' FROM r.duration)
        WHEN r.duration LIKE '%minutes' THEN TRIM('minutes' FROM r.duration)
        WHEN r.duration LIKE '%mins' THEN TRIM('mins' FROM r.duration)
        ELSE r.duration
    END AS duration
FROM pizza_runner.runner_orders AS r)

SELECT runner_id,
		ROUND(MIN(distance::NUMERIC / (duration::NUMERIC / 60)),2) AS min_speed,
		ROUND(MAX(distance::NUMERIC / (duration::NUMERIC / 60)),2) AS max_speed,
        ROUND(AVG(distance::NUMERIC / (duration::NUMERIC / 60)),2) AS avg_speed
FROM temp
GROUP BY runner_id
ORDER BY runner_id;