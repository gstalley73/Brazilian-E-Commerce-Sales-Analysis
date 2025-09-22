-- Sellers that have the highest sales revenue, and their uniques customers
SELECT 
oi.seller_id,
ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
COUNT(DISTINCT c.customer_unique_id) AS unique_customers,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM Order_items oi 
JOIN Orders o
ON oi.order_id = o.order_id 
JOIN Customers c 
ON o.customer_id = c.customer_id 
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id 
ORDER BY total_revenue DESC
LIMIT 10;