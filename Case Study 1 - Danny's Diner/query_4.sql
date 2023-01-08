SELECT m.product_name, COUNT(s.product_id) as sale_count
FROM dannys_diner.sales as s
JOIN dannys_diner.menu as m
ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY sale_count DESC
LIMIT 1;