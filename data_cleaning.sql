-- enable FK constraints
SET FOREIGN_KEY_CHECKS = 1;
 

-- DATA QUALITY ASSESSMENT AND DATA VALIDATION
-- 1. Row Count Check for all tables
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'inventories', COUNT(*) FROM inventories
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'product_subcategories', COUNT(*) FROM product_subcategories
UNION ALL
SELECT 'product_categories', COUNT(*) FROM product_categories
UNION ALL
SELECT 'warehouses', COUNT(*) FROM warehouses
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'teams', COUNT(*) FROM teams
UNION ALL
SELECT 'contacts', COUNT(*) FROM contacts
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'customer_segments', COUNT(*) FROM customer_segments
UNION ALL
SELECT 'locations', COUNT(*) FROM locations
UNION ALL
SELECT 'countries', COUNT(*) FROM countries
UNION ALL
SELECT 'regions', COUNT(*) FROM regions;

-- 2. Key Relationships checks

		-- Customers → Segments
SELECT * FROM customers c
LEFT JOIN customer_segments s 
ON c.segment_id = s.segment_id
WHERE s.segment_id IS NULL;

		-- Customers → Locations
SELECT * FROM customers c
LEFT JOIN locations l 
ON c.location_id = l.location_id
WHERE l.location_id IS NULL;

		-- Locations → Countries
SELECT * FROM locations l
LEFT JOIN countries c 
ON l.country_id = c.country_id
WHERE c.country_id IS NULL;

		-- Locations →  Regions
SELECT * FROM countries c
LEFT JOIN regions r 
ON c.region_id = r.region_id
WHERE r.region_id IS NULL;

		-- Orders → Customers
SELECT * FROM orders o
LEFT JOIN customers c 
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
/* The result shows that some orders reference customer IDs that do not exist in the customers table, 
indicating missing or inconsistent customer data, which can lead to incomplete joins and result in inaccurate customer-level analysis, 
misrepresented revenue attribution, and gaps in customer segmentation reporting. */

		-- Order Items → Orders
SELECT * FROM order_items oi
LEFT JOIN orders o 
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

		-- Order Items →  Products
SELECT * FROM order_items oi
LEFT JOIN products p 
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
/* The result shows that some order items reference product IDs that do not exist in the products table, 
indicating missing or inconsistent product records, which can lead to incomplete joins and result in underreported revenue 
and inaccurate product-level analysis. */

		-- Products → Subcategories
SELECT * FROM products p
LEFT JOIN product_subcategories s 
ON p.subcategory_id = s.subcategory_id
WHERE s.subcategory_id IS NULL;

		-- Subcategories → Categories
SELECT * FROM product_subcategories s
LEFT JOIN product_categories c 
ON s.category_id = c.category_id
WHERE c.category_id IS NULL;

		-- Inventories → Products
SELECT * FROM inventories i
LEFT JOIN products p 
ON i.product_id = p.product_id
WHERE p.product_id IS NULL;
/*The result shows that some inventory records reference product IDs that do not exist in the products table, 
indicating missing or inconsistent product master data, which can lead to incomplete inventory reporting, 
inaccurate stock tracking, and inconsistencies between inventory and product-level analysis.*/

		-- Inventories → Warehouses
SELECT * FROM inventories i
LEFT JOIN warehouses w 
ON i.warehouse_id = w.warehouse_id
WHERE w.warehouse_id IS NULL;

		-- Employees → Teams
SELECT * FROM employees e
LEFT JOIN teams t 
ON e.team_id = t.team_id
WHERE t.team_id IS NULL;

		-- Contacts → Customers
SELECT * FROM contacts c
LEFT JOIN customers cu 
ON c.customer_id = cu.customer_id
WHERE cu.customer_id IS NULL;
/* The result shows that some contact records reference customer IDs that do not exist in the customers table, 
indicating missing or inconsistent customer data, which can lead to incomplete customer profiling, inaccurate relationship mapping, 
and unreliable customer-level analysis.*/

-- 3a. Primary Key Duplicate Check
			-- Customers
SELECT customer_id, COUNT(*) 
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
			-- Products
SELECT product_id, COUNT(*) 
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;
			-- Orders
SELECT order_id, COUNT(*) 
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;
			-- Product Categories
SELECT category_id, COUNT(*) 
FROM product_categories
GROUP BY category_id
HAVING COUNT(*) > 1;
			-- Regions
SELECT region_id, COUNT(*) 
FROM regions
GROUP BY region_id
HAVING COUNT(*) > 1;
			-- Countries
SELECT country_id, COUNT(*) 
FROM countries
GROUP BY country_id
HAVING COUNT(*) > 1;
			-- Locations
SELECT location_id, COUNT(*) 
FROM locations
GROUP BY location_id
HAVING COUNT(*) > 1;
			-- Customers Segments
SELECT segment_id, COUNT(*) 
FROM customer_segments
GROUP BY segment_id
HAVING COUNT(*) > 1;
			-- Contacts
SELECT contact_id, COUNT(*) 
FROM contacts
GROUP BY contact_id
HAVING COUNT(*) > 1;
			-- Teams
SELECT team_id, COUNT(*) 
FROM teams
GROUP BY team_id
HAVING COUNT(*) > 1;
			-- Employees
SELECT employee_id, COUNT(*) 
FROM employees
GROUP BY employee_id
HAVING COUNT(*) > 1;
			-- Warehouses
SELECT warehouse_id, COUNT(*) 
FROM warehouses
GROUP BY warehouse_id
HAVING COUNT(*) > 1;
			-- Product SubCategories
SELECT subcategory_id, COUNT(*) 
FROM product_subcategories
GROUP BY subcategory_id
HAVING COUNT(*) > 1;

-- 3b. Business Duplicate Check
			-- Regions
SELECT region_name, COUNT(*)
FROM regions
GROUP BY region_name
HAVING COUNT(*) > 1;
			-- Countries
SELECT country_name, COUNT(*)
FROM countries
GROUP BY country_name
HAVING COUNT(*) > 1;
			-- Customer Segments
SELECT segment_name, COUNT(*)
FROM customer_segments
GROUP BY segment_name
HAVING COUNT(*) > 1;
			-- Warehouses
SELECT warehouse_name, COUNT(*)
FROM warehouses
GROUP BY warehouse_name
HAVING COUNT(*) > 1;
			-- Teams
SELECT team_name, COUNT(*)
FROM teams
GROUP BY team_name
HAVING COUNT(*) > 1;
			-- Product Subcategories
SELECT subcategory_name, category_id, COUNT(*)
FROM product_subcategories
GROUP BY subcategory_name, category_id
HAVING COUNT(*) > 1;
			-- Product Categories
SELECT category_name, COUNT(*)
FROM product_categories
GROUP BY category_name
HAVING COUNT(*) > 1;
			-- Locations
SELECT address, city, state, COUNT(*)
FROM locations
GROUP BY address, city, state
HAVING COUNT(*) > 1;
			-- Employees
-- Same employee duplicated
SELECT first_name, last_name, email, COUNT(*)
FROM employees
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;
			-- Inventories 
-- One product per warehouse should be unique
SELECT product_id, warehouse_id, COUNT(*)
FROM inventories
GROUP BY product_id, warehouse_id
HAVING COUNT(*) > 1;
			-- Products
-- Same product duplicated
SELECT product_name, COUNT(*)
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;
/* The result shows that some products share the same product_name but exist as separate records, 
indicating duplicate product entries in the product master data. This can lead to fragmented sales reporting, 
inaccurate revenue aggregation, and inconsistent inventory tracking across the same product. */
			-- Contacts
-- Same person repeated
SELECT first_name, last_name, email, COUNT(*)
FROM contacts
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;
			-- Customers
-- Same customer appearing multiple times
SELECT name, address, COUNT(*)
FROM customers
GROUP BY name, address
HAVING COUNT(*) > 1;
			-- Orders
-- One order should be unique
SELECT customer_id, order_date, COUNT(*)
FROM orders
GROUP BY customer_id, order_date
HAVING COUNT(*) > 1;
			-- Order Items
SELECT order_id, product_id, COUNT(*) 
FROM order_items
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;
/* The result shows that some orders contain duplicate entries for the same product, 
where the same product appears multiple times within a single order. 
This indicates improper data structuring, as each product in an order should ideally 
be represented as a single row with aggregated quantity. 
If left unresolved, this can lead to overcounting of quantities, inflated revenue calculations, 
and inaccurate product-level analysis. */


-- 4. Missing Values Checks
			-- Customers
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS missing_name,
    SUM(CASE WHEN location_id IS NULL THEN 1 ELSE 0 END) AS missing_location,
    SUM(CASE WHEN segment_id IS NULL THEN 1 ELSE 0 END) AS missing_segment
FROM customers;
			
            -- Contacts
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN contact_id IS NULL THEN 1 ELSE 0 END) AS missing_contact_id,
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS missing_first_name,
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS missing_last_name,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id
FROM contacts;

			-- Orders
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS missing_status
FROM orders;

			-- Order Items
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS missing_unit_price
FROM order_items;

			-- Products
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS missing_product_name,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS missing_category
FROM products;

			-- Inventories
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN warehouse_id IS NULL THEN 1 ELSE 0 END) AS missing_warehouse,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity
FROM inventories;

			-- Product Subcategories
SELECT 
    COUNT(*) AS total_rows,
    SUM(subcategory_id IS NULL) AS missing_subcategory_id,
    SUM(subcategory_name IS NULL) AS missing_subcategory_name,
    SUM(category_id IS NULL) AS missing_category_id
FROM product_subcategories;

			-- Product Categories
SELECT 
    COUNT(*) AS total_rows,
    SUM(category_id IS NULL) AS missing_category_id,
    SUM(category_name IS NULL) AS missing_category_name
FROM product_categories;

			-- Warehouses
SELECT 
    COUNT(*) AS total_rows,
    SUM(warehouse_id IS NULL) AS missing_warehouse_id,
    SUM(warehouse_name IS NULL) AS missing_warehouse_name,
    SUM(location_id IS NULL) AS missing_location_id
FROM warehouses;

			-- Employees
SELECT 
    COUNT(*) AS total_rows,
    SUM(employee_id IS NULL) AS missing_employee_id,
    SUM(first_name IS NULL) AS missing_first_name,
    SUM(last_name IS NULL) AS missing_last_name,
    SUM(email IS NULL) AS missing_email,
    SUM(phone IS NULL) AS missing_phone,
    SUM(hire_date IS NULL) AS missing_hire_date,
    SUM(manager_id IS NULL) AS missing_manager_id,
    SUM(job_title IS NULL) AS missing_job_title
FROM employees;
/* The employees table is complete with no missing values in key identifying fields. 
One record has a missing manager_id, which is expected in real-world scenarios 
and typically represents a top-level employee (e.g., CEO or executive) 
who does not report to any manager. This does not negatively impact analysis. */

			-- 	Teams
SELECT 
    COUNT(*) AS total_rows,
    SUM(team_id IS NULL) AS missing_team_id,
    SUM(team_name IS NULL) AS missing_team_name
FROM teams;

			-- Customer Segments
SELECT 
    COUNT(*) AS total_rows,
    SUM(segment_id IS NULL) AS missing_segment_id,
    SUM(segment_name IS NULL) AS missing_segment_name
FROM customer_segments;

			--  Locations
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN location_id IS NULL THEN 1 ELSE 0 END) AS missing_location_id,
    SUM(CASE WHEN country_id IS NULL THEN 1 ELSE 0 END) AS missing_country
FROM locations;

			-- Countries
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN country_id IS NULL THEN 1 ELSE 0 END) AS missing_country_id,
    SUM(CASE WHEN region_id IS NULL THEN 1 ELSE 0 END) AS missing_region
FROM countries;

			-- Regions
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN region_id IS NULL THEN 1 ELSE 0 END) AS missing_region_id,
    SUM(CASE WHEN region_name IS NULL THEN 1 ELSE 0 END) AS missing_region_name
FROM regions;

-- 5. Data Quality Checks
		-- Negative prices
SELECT * FROM products
WHERE list_price <= 0 OR standard_cost < 0;

		-- Invalid inventory
SELECT * FROM inventories
WHERE quantity < 0;

		-- Invalid order quantities
SELECT * FROM order_items
WHERE quantity <= 0;

-- 5. Distribution Checks
		-- Customer segments
SELECT segment_id, COUNT(*) 
FROM customers
GROUP BY segment_id;

		-- Locations
SELECT location_id, COUNT(*) 
FROM customers
GROUP BY location_id;

		-- Teams
SELECT team_id, COUNT(*) 
FROM employees
GROUP BY team_id;
