-- Total revenue trend by month on completed orders

SELECT
strftime ('%Y-%m', o.order_purchase_timestamp) AS order_month,
ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM ORDERS AS o
JOIN order_items AS oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY strftime('%Y-%m', o.order_purchase_timestamp)
ORDER BY order_month;