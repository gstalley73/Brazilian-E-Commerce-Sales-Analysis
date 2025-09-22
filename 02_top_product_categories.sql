--Product category with the most revenue on completed orders

SELECT 
p.product_category_name AS category,
ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
COUNT(DISTINCT oi.order_id) AS total_orders,
COUNT(oi.product_id) AS total_items
FROM order_items AS oi
JOIN Products AS p
ON oi.product_id = p.product_id
JOIN Orders AS o
ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY Total_revenue DESC
LIMIT 10;