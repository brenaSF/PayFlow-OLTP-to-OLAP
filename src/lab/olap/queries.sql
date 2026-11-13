-- Consultas OLAP para análise de dados


-- 1. Receita por categoria de produto por mês (a consulta de referência).
SELECT 
    
    p.category AS product_category,
    DATE_TRUNC('month', o.order_date) AS order_month,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM
    products p
JOIN
    order_items oi ON p.id = oi.product_id
JOIN
    orders o ON oi.order_id = o.id
GROUP BY
    p.category,
    DATE_TRUNC('month', o.order_date)

-- 2. Receita total por cliente.
SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM
    customers c
JOIN
    orders o ON c.id = o.customer_id
JOIN
    order_items oi ON o.id = oi.order_id
GROUP BY    
    c.id,
    c.name

-- 3. Produtos mais vendidos por quantidade.
SELECT
    p.id AS product_id,
    p.name AS product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM
    products p
JOIN
    order_items oi ON p.id = oi.product_id
GROUP BY
    p.id,
    p.name
ORDER BY
    total_quantity_sold DESC

-- 4. Média de gastos por segmento de clientes (exemplo de segmentação).
SELECT
    c.segment AS customer_segment,
    AVG(oi.quantity * oi.unit_price) AS average_spending
FROM
    customers c
JOIN
    orders o ON c.id = o.customer_id
JOIN
    order_items oi ON o.id = oi.order_id
GROUP BY
    c.segment   