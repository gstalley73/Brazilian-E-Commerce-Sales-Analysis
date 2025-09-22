-- Most popular payment methods, and their revenue generated
SELECT op.payment_type,
COUNT(DISTINCT op.order_id) AS total_orders,
SUM(op.payment_value) AS total_revenue,
ROUND(AVG(op.payment_value), 2) AS avg_payment_value
FROM Order_payments op 
JOIN Orders o
ON op.order_id = o.order_id 
WHERE o.order_status = 'delivered'
GROUP BY op.payment_type
ORDER BY total_revenue DESC;
