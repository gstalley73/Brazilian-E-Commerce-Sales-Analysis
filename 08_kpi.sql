--KPI's: Total Revenue, Number of Customers, and Total number of Orders
SELECT 
    c.customer_state,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS unique_customers
FROM order_items oi
JOIN Orders o 
    ON oi.order_id = o.order_id
JOIN Customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;

SELECT 
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
    COUNT(DISTINCT c.customer_unique_id) AS unique_customers,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM order_items oi
JOIN Orders o 
    ON oi.order_id = o.order_id
JOIN Customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered';