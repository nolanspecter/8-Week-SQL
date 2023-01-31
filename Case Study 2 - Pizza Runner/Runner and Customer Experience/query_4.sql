UPDATE pizza_runner.runner_orders
SET distance = TRIM(REPLACE(distance, 'km', ''));

UPDATE pizza_runner.runner_orders
SET distance = NULL
WHERE distance = 'null';

ALTER TABLE pizza_runner.runner_orders
ALTER COLUMN distance TYPE NUMERIC USING CAST(distance AS NUMERIC);

SELECT O.customer_id, AVG(R.distance) AS avg_distance 
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
GROUP BY O.customer_id;