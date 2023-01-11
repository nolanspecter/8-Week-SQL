WITH temp AS (
  SELECT s.*, c.join_date, m.product_name, m.price
  FROM dannys_diner.sales AS s
  JOIN dannys_diner.members AS c
  ON s.customer_id = c.customer_id
  JOIN dannys_diner.menu AS m
  ON s.product_id = m.product_id
  WHERE s.order_date < c.join_date
 )
 
SELECT customer_id, COUNT(product_id), SUM(price)
FROM temp
GROUP BY customer_id
ORDER BY customer_id;