WITH temp AS (
  SELECT s.customer_id, m.product_name, m.price, m.price * 20 AS points
  FROM dannys_diner.sales AS s
  JOIN dannys_diner.members AS c
  ON s.customer_id = c.customer_id
  JOIN dannys_diner.menu AS m
  ON s.product_id	= m.product_id
  WHERE s.order_date >= c.join_date
  AND s.order_date <= CAST('2021-01-31' AS date)
)

SELECT customer_id, SUM(points)
FROM temp
GROUP BY customer_id
ORDER BY customer_id;