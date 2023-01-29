UPDATE pizza_runner.customer_orders 
SET exclusions = NULL
WHERE TRIM(exclusions) = 'null'
OR TRIM(exclusions) = '';

UPDATE pizza_runner.customer_orders 
SET extras = NULL
WHERE TRIM(extras) = 'null'
OR TRIM(extras) = '';

UPDATE pizza_runner.runner_orders
SET pickup_time = NULL
WHERE TRIM(pickup_time) = 'null'
OR TRIM(pickup_time) = '';

UPDATE pizza_runner.runner_orders
SET distance = NULL
WHERE TRIM(distance) = 'null'
OR TRIM(distance) = '';

UPDATE pizza_runner.runner_orders
SET duration = NULL
WHERE TRIM(duration) = 'null'
OR TRIM(duration) = '';

UPDATE pizza_runner.runner_orders
SET cancellation = NULL
WHERE TRIM(cancellation) = 'null'
OR TRIM(cancellation) = '';

SELECT O.customer_id, COUNT(O.pizza_id)
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
WHERE cancellation IS NULL
AND (exclusions IS NULL
	AND extras IS NULL)
GROUP BY customer_id
ORDER BY customer_id;

SELECT customer_id, COUNT(pizza_id)
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
WHERE cancellation IS NULL 
AND (exclusions IS NOT NULL
	OR extras IS NOT NULL)
GROUP BY customer_id
ORDER BY customer_id;
