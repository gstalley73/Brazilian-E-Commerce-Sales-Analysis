--How long each delivery usually takes (average) compared to the estimated date
SELECT 
COUNT(order_id) AS total_delivered_orders,
ROUND(AVG(JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_purchase_timestamp)), 2) 
AS avg_actual_delivery_days,
ROUND(AVG(JULIANDAY(order_estimated_delivery_date) - JULIANDAY(order_purchase_timestamp)), 2) 
AS avg_estimated_delivery_days
FROM Orders
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL;