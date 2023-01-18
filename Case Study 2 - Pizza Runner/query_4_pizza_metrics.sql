  SELECT pn.pizza_name, COUNT(co.pizza_id) AS number_of_order
  FROM pizza_runner.customer_orders AS co
  JOIN pizza_runner.pizza_names AS pn
  ON co.pizza_id = pn.pizza_id
  GROUP BY pn.pizza_name
  ORDER BY pn.pizza_name;