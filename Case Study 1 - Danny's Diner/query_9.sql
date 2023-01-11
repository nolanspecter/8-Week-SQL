WITH temp AS(
	SELECT s.*, m.product_name, m.price,
  		CASE
  			WHEN m.product_name = 'sushi' THEN m.price * 20
  			ELSE m.price * 10
  		END AS points
  	FROM dannys_diner.sales AS s
  	JOIN dannys_diner.menu AS m
  	ON s.product_id = m.product_id
)

SELECT customer_id, SUM(points)
FROM temp
GROUP BY customer_id
ORDER BY customer_id;