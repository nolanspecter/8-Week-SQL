SELECT runner_id, COUNT(order_id)
FROM pizza_runner.runner_orders
WHERE pickup_time != 'null'
GROUP BY runner_id
ORDER BY runner_id;