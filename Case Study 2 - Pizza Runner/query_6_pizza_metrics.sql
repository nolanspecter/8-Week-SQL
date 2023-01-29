SELECT O.order_id, COUNT(pizza_id)
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.runner_orders AS R
ON O.order_id = R.order_id
WHERE R.cancellation IS NULL
OR R.cancellation = 'null'
GROUP BY O.order_id;