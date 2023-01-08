WITH temp AS (
  SELECT s.*, c.join_date, m.product_name, ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS order_rank
  FROM dannys_diner.sales AS s
  JOIN dannys_diner.members AS c ON s.customer_id = c.customer_id
  JOIN dannys_diner.menu AS m ON s.product_id = m.product_id
  WHERE s.order_date >= c.join_date
)

SELECT customer_id, product_name 
FROM temp
WHERE order_rank = 1;