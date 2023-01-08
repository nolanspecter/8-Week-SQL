WITH temp AS(
	SELECT s.customer_id, m.product_name, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) as order_rank
  FROM dannys_diner.sales as s
  JOIN dannys_diner.menu as m
  ON s.product_id = m.product_id
)

SELECT customer_id, product_name
FROM temp
WHERE order_rank = 1
ORDER BY customer_id;