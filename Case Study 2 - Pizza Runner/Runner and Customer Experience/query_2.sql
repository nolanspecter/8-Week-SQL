UPDATE pizza_runner.runner_orders 
SET pickup_time = NULL
WHERE pickup_time = 'null';

ALTER TABLE pizza_runner.runner_orders
ALTER COLUMN pickup_time TYPE TIMESTAMP USING CAST(pickup_time AS TIMESTAMP) ;

SELECT R.runner_id, AVG(O.order_time - R.pickup_time)
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
WHERE pickup_time IS NOT NULL
GROUP BY R.runner_id
ORDER BY R.runner_id;