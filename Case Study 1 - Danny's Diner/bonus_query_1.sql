SELECT s.customer_id, s.order_date, m.product_name, m.price, 
		CASE 
        	WHEN s.customer_id IN (SELECT customer_id FROM dannys_diner.members)
            	AND s.order_date >= c.join_date
            	THEN 'Y'
            ELSE 'N'
         END AS member
FROM dannys_diner.sales AS s
JOIN dannys_diner.menu AS m
ON s.product_id = m.product_id
LEFT JOIN dannys_diner.members AS c
ON s.customer_id = c.customer_id
ORDER BY s.customer_id, s.order_date, m.price DESC;
