SELECT customer_id, COUNT(DISTINCT order_date) AS day_visited
FROM dannys_diner.sales 
GROUP BY customer_id
ORDER BY customer_id;