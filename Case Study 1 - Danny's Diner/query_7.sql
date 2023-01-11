WITH temp AS (
  SELECT s.*, ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date DESC)
  FROM dannys_diner.sales AS s
  JOIN dannys_diner.members AS c
  ON s.customer_id = c.customer_id
  WHERE s.order_date < c.join_date
 )
 
SELECT t.customer_id, m.product_name
FROM temp AS t
JOIN dannys_diner.menu AS m
ON t.product_id = m.product_id
WHERE t.row_number = 1;