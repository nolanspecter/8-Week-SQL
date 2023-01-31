UPDATE pizza_runner.runner_orders 
SET pickup_time = NULL
WHERE pickup_time = 'null';

ALTER TABLE pizza_runner.runner_orders
ALTER COLUMN pickup_time TYPE TIMESTAMP USING CAST(pickup_time AS TIMESTAMP) ;

SELECT O.order_id, COUNT(O.pizza_id) AS num_of_pizzas, AVG(O.order_time - R.pickup_time)  AS prep_time
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
WHERE R.pickup_time IS NOT NULL
GROUP BY O.order_id
ORDER BY num_of_pizzas DESC;