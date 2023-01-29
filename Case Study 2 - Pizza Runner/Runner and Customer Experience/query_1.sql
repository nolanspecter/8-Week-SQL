SELECT EXTRACT (WEEK FROM registration_date) AS week, COUNT(runner_id) AS num_of_riders
FROM pizza_runner.runners
GROUP BY week;