-- 1/////

SELECT 
    customer_id, 
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;


-- 2////

SELECT 
    oi.order_id, 
    p.product_name, 
    oi.quantity, 
    oi.quantity * p.unit_price AS total_amount
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_id ASC;

-- 3///

SELECT 
    c.category_name, 
    SUM(oi.quantity * p.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;


-- 4////

SELECT 
    c.customer_name, 
    SUM(oi.quantity * p.unit_price) AS total_purchase_amount
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_purchase_amount DESC
LIMIT 5;

