SELECT O.customer_id, N.pizza_name, COUNT(O.pizza_id)
FROM pizza_runner.customer_orders AS O
JOIN pizza_runner.pizza_names AS N
ON O.pizza_id = N.pizza_id
GROUP BY O.customer_id, N.pizza_name
ORDER BY customer_id;