UPDATE pizza_runner.customer_orders 
SET exclusions = NULL
WHERE TRIM(exclusions) = 'null'
OR TRIM(exclusions) = '';

UPDATE pizza_runner.customer_orders 
SET extras = NULL
WHERE TRIM(extras) = 'null'
OR TRIM(extras) = '';

WITH temp AS(
SELECT *, EXTRACT(hour FROM order_time) AS hour,
		CASE 
   		WHEN EXTRACT(DOW FROM order_time) = 0 THEN 'Sunday'
        WHEN EXTRACT(DOW FROM order_time) = 1 THEN 'Monday'
        WHEN EXTRACT(DOW FROM order_time) = 2 THEN 'Tuesday'
        WHEN EXTRACT(DOW FROM order_time) = 3 THEN 'Wednesday'
        WHEN EXTRACT(DOW FROM order_time) = 4 THEN 'Thursday'
        WHEN EXTRACT(DOW FROM order_time) = 5 THEN 'Friday'
        WHEN EXTRACT(DOW FROM order_time) = 6 THEN 'Saturday'
        ELSE NULL
        END AS day_of_week
FROM pizza_runner.customer_orders)

SELECT hour, COUNT(pizza_id)
FROM temp
GROUP BY hour
ORDER BY hour;