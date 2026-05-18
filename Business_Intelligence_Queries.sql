-- 1. SALES PERFORMANCE ANALYSIS
----------------------------------

/*  Goal:
Evaluate overall business performance through revenue, profit, and sales trends.

Key Questions:
- What is total revenue?
- What is total profit?
- What is average order value?
- How does revenue trend monthly?
- How does profit trend monthly? */

-- Total Revenue = Total Selling Price
SELECT ROUND(SUM(oi.quantity * oi.unit_price) , 2)AS total_revenue
FROM order_items oi;

-- Total Profit = Selling price(Revenue) - Cost Price
SELECT ROUND(SUM((oi.unit_price - p.standard_cost) * oi.quantity), 2) AS total_profit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Average Order Value
SELECT 
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;

-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Monthly Prof it Trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM((oi.unit_price - p.standard_cost) * oi.quantity), 2) AS profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;


----------------------------------
-- 2. PRODUCT & PRICING ANALYSIS
----------------------------------
/* Goal:
Analyze product performance and pricing efficiency.

Key Questions:
- Which products generate highest revenue?
- Which products generate highest profit?
- Which products are sold below cost?
- What is the gap between list price and actual price? */

-- Top 5 Revenue Products
SELECT 
    p.product_name,
    Round(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 Profit Products
SELECT 
    p.product_name,
    ROUND(SUM((oi.unit_price - p.standard_cost) * oi.quantity), 2) AS profit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY profit DESC
LIMIT 5;

-- Products Sold Below Cost
SELECT DISTINCT
    p.product_name,
    ROUND((oi.unit_price),2) AS unit_cost,
    p.standard_cost
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE oi.unit_price < p.standard_cost;

-- Price Gap (List vs Actual)
SELECT 
    p.product_name,
    p.list_price,
    AVG(oi.unit_price) AS avg_selling_price,
    (p.list_price - AVG(oi.unit_price)) AS price_gap
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name, p.list_price;


----------------------------------
-- 3. CUSTOMER ANALYSIS
----------------------------------

/* Goal:
Understand customer value, behavior, and revenue contribution.

Key Questions:
- Who are the top customers?
- Which customers are one-time buyers?
- What is average value per customer?
- Are customers concentrated?
*/
-- Top 10 Customers
SELECT 
    c.name,
    Round(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY revenue DESC
LIMIT 10;

-- One-Time Customers
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) = 1;

-- Revenue per Customer
SELECT 
    c.customer_id,
    c.name,
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id),  2)AS avg_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id;

----------------------------------
-- 4. EMPLOYEE PERFORMANCE ANALYSIS
----------------------------------

/* Goal:
Evaluate salesperson efficiency and contribution.

Key Questions:
- Which employees generate most revenue?
- Which employees generate most profit?
- Does experience affect performance?
- Are some employees inefficient?
*/
SELECT * FROM employees;
-- Revenue per Employee
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM employees e
JOIN orders o ON e.employee_id = o.salesman_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY e.employee_id
ORDER BY revenue DESC;

-- Profit per Employee
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    SUM((oi.unit_price - p.standard_cost) * oi.quantity) AS profit
FROM employees e
JOIN orders o ON e.employee_id = o.salesman_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY e.employee_id
ORDER BY profit DESC;

-- Employee Efficiency
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue,
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2) AS revenue_per_order
FROM employees e
JOIN orders o ON e.employee_id = o.salesman_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY e.employee_id;


----------------------------------
-- 5. INVENTORY & WAREHOUSE ANALYSIS
----------------------------------
/*
Goal:
Assess stock levels and operational efficiency.

Key Questions:
- Which products are overstocked?
- Which products risk stockout?
- What is inventory value per warehouse?
*/
-- Inventory per Product
SELECT 
    p.product_name,
    SUM(i.quantity) AS stock
FROM inventories i
JOIN products p ON i.product_id = p.product_id
GROUP BY p.product_name;

-- Stock vs Sales
SELECT 
    p.product_name,
    SUM(i.quantity) AS stock,
    SUM(oi.quantity) AS sales
FROM products p
JOIN inventories i ON p.product_id = i.product_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- Inventory Value per Warehouse
SELECT 
    w.warehouse_name,
    SUM(i.quantity * p.standard_cost) AS inventory_value
FROM inventories i
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
JOIN products p ON i.product_id = p.product_id
GROUP BY w.warehouse_name;


----------------------------------
-- 6. GEOGRAPHIC ANALYSIS
----------------------------------

/* Goal:
Evaluate regional and country-level performance.

Key Questions:
- Which regions generate most revenue?
- Which countries perform best?
- How is revenue distributed geographically?
*/

-- Revenue by Region
SELECT 
    r.region_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM regions r
JOIN countries co ON r.region_id = co.region_id
JOIN locations l ON co.country_id = l.country_id
JOIN customers c ON l.location_id = c.location_id
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY r.region_name
ORDER BY revenue DESC;

-- Revenue by Country
SELECT 
    co.country_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM countries co
JOIN locations l ON co.country_id = l.country_id
JOIN customers c ON l.location_id = c.location_id
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY co.country_name
ORDER BY revenue DESC;

----------------------------------
-- 7. ADVANCED ANALYTICAL INSIGHTS
----------------------------------

/* Goal:
Perform deeper analytical exploration using ranking, window functions, and advanced SQL logic to uncover hidden patterns.

Key Questions:
- Which products and customers drive cumulative revenue (Pareto analysis)?
- Which employees are most efficient relative to workload?
- Which products are frequently bought together?
- Which products have unstable demand over time?
- Which customers are declining in value?
- Which categories have strong revenue but weak margins?
*/

-- 1. Pareto Analysis (Product Revenue Contribution)
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_id,
    product_name,
    revenue,
    SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
    SUM(revenue) OVER () AS total_revenue,
    ROUND(SUM(revenue) OVER (ORDER BY revenue DESC) / SUM(revenue) OVER () * 100, 2) AS cumulative_pct
FROM product_revenue
ORDER BY revenue DESC;

----------------------------------------------------

-- 2. Customer Revenue Concentration (Top Customers)
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id
)
SELECT
    customer_id,
    revenue,
    SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
    ROUND(SUM(revenue) OVER (ORDER BY revenue DESC) / SUM(revenue) OVER () * 100, 2) AS cumulative_pct
FROM customer_revenue
ORDER BY revenue DESC;

----------------------------------------------------

-- 3. Employee Efficiency Ranking
SELECT
    e.employee_id,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(oi.quantity * oi.unit_price) AS revenue,
    SUM((oi.unit_price - p.standard_cost) * oi.quantity) AS profit,
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2) AS revenue_per_order,
    DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id) DESC) AS efficiency_rank
FROM employees e
JOIN orders o ON e.employee_id = o.salesman_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY e.employee_id;

----------------------------------------------------

-- 4. Product Pair (Basket Analysis)
SELECT
    oi1.product_id AS product_a,
    oi2.product_id AS product_b,
    COUNT(*) AS frequency
FROM order_items oi1
JOIN order_items oi2
    ON oi1.order_id = oi2.order_id
   AND oi1.product_id < oi2.product_id
GROUP BY oi1.product_id, oi2.product_id
ORDER BY frequency DESC;

----------------------------------------------------

-- 5. Product Revenue Volatility (Monthly Stability)
WITH monthly_sales AS (
    SELECT
        p.product_id,
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_id, month
)
SELECT
    product_id,
    STDDEV(revenue) AS revenue_volatility
FROM monthly_sales
GROUP BY product_id
ORDER BY revenue_volatility DESC;

----------------------------------------------------

-- 6. Customer Revenue Change Over Time
WITH customer_monthly AS (
    SELECT
        c.customer_id,
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, month
)
SELECT
    customer_id,
    month,
    revenue,
    LAG(revenue) OVER (PARTITION BY customer_id ORDER BY month) AS previous_revenue,
    (revenue - LAG(revenue) OVER (PARTITION BY customer_id ORDER BY month)) AS revenue_change
FROM customer_monthly;

----------------------------------------------------

-- 7. Category Margin Analysis
SELECT
    pc.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue,
    SUM((oi.unit_price - p.standard_cost) * oi.quantity) AS profit,
    ROUND(SUM((oi.unit_price - p.standard_cost) * oi.quantity) / SUM(oi.quantity * oi.unit_price) * 100, 2) AS margin_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_categories pc ON p.category_id = pc.category_id
GROUP BY pc.category_name
ORDER BY margin_pct ASC;

