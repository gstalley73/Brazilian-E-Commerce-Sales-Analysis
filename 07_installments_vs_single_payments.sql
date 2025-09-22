-- Percentage of orders paid in Installments vs. Single payments
WITH payment_summary AS (
    SELECT 
        CASE 
            WHEN op.payment_installments = 1 THEN 'Single Payment'
            ELSE 'Installments'
        END AS payment_method,
        COUNT(DISTINCT op.order_id) AS total_orders,
        SUM(op.payment_value) AS total_revenue,
        ROUND(AVG(op.payment_value), 2) AS avg_order_value
    FROM Order_payments op
    JOIN Orders o 
        ON op.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY payment_method
)
SELECT 
payment_method,
total_orders,
ROUND(100.0 * total_orders/SUM(total_orders) OVER() , 2) AS pct_of_orders,
total_revenue,
avg_order_value
FROM payment_summary;