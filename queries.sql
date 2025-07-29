-- Select all customers
SELECT * FROM customers;

-- Count of orders per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Orders with customer names (assuming a JOIN condition)
SELECT o.order_id, o.order_date, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- RMAs filed in the past 30 days
SELECT * FROM rma
WHERE request_date >= CURDATE() - INTERVAL 30 DAY;

-- Total RMAs per customer
SELECT customer_id, COUNT(*) AS rma_count
FROM rma
GROUP BY customer_id;

-- 📌 1. Top 5 customers with the highest number of RMAs
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(r.rma_id) AS total_rmas
FROM customers c
JOIN rma r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_rmas DESC
LIMIT 5;

-- 📊 2. Monthly count of RMAs for the past 6 months
SELECT 
    DATE_FORMAT(r.request_date, '%Y-%m') AS rma_month,
    COUNT(*) AS rma_count
FROM rma r
WHERE r.request_date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY rma_month
ORDER BY rma_month;

-- 🔍 3. Orders that have NOT resulted in any RMA request
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN rma r ON o.order_id = r.order_id
WHERE r.rma_id IS NULL;

-- ⏱️ 4. Most recent RMA submission date per customer
SELECT 
    r.customer_id,
    MAX(r.request_date) AS latest_rma_date
FROM rma r
GROUP BY r.customer_id;

-- 📈 5. RMA rate per customer (as a percentage of their total orders)
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT r.rma_id) AS total_rmas,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        (COUNT(DISTINCT r.rma_id) / COUNT(DISTINCT o.order_id)) * 100, 2
    ) AS rma_rate_percent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN rma r ON o.order_id = r.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_orders > 0
ORDER BY rma_rate_percent DESC;
