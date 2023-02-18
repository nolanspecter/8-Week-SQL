SELECT runner_id, 
	   SUM(CASE 
          	   WHEN pickup_time = 'null' THEN 0
           	   ELSE 1
           END) * 100 / COUNT(*) AS succes_pct
FROM pizza_runner.runner_orders
GROUP BY runner_id
ORDER BY runner_id;