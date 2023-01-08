WITH temp AS (
  SELECT s.customer_id, m.product_name, COUNT(m.product_name) AS number_of_order, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY COUNT(m.product_name) DESC) AS order_number_rank
  FROM dannys_diner.sales as s
  JOIN dannys_diner.menu as m
  ON s.product_id = m.product_id
  GROUP BY s.customer_id, m.product_name
)


SELECT * 
FROM temp
WHERE order_number_rank = 1;