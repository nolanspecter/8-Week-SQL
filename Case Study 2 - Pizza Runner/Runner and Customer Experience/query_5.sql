UPDATE pizza_runner.runner_orders 
SET pickup_time = NULL
WHERE pickup_time = 'null';

ALTER TABLE pizza_runner.runner_orders
ALTER COLUMN pickup_time TYPE TIMESTAMP USING CAST(pickup_time AS TIMESTAMP) ;

SELECT MAX(R.pickup_time - O.order_time) AS longest_delivery, MIN(R.pickup_time - O.order_time) AS shortest_delivery, MAX(R.pickup_time - O.order_time) - MIN(R.pickup_time - O.order_time)  AS biggest_time_diff
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
WHERE R.pickup_time IS NOT NULL;