
-- 6. Data Cleaning Actions
					-- Orders → Customers
		CREATE OR REPLACE VIEW orders_clean AS
SELECT 
    o.*,
    CASE 
        WHEN c.customer_id IS NULL THEN 'Unknown Customer'
        ELSE 'Known Customer'
    END AS customer_status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;
/* Orders without matching customer records were retained and flagged as ‘Unknown Customer’ using a derived field, 
ensuring no loss of transactional data while maintaining transparency in customer-level analysis.*/

			-- Order Items →  Products
/* To preserve transactional integrity and ensure accurate revenue analysis, missing product records were created for unmatched product IDs, 
allowing all order items to be retained and properly linked during analysis.*/

			-- Inventories → Products
            INSERT INTO products (product_id, product_name)
SELECT DISTINCT i.product_id,
       CONCAT('Unknown Product ', i.product_id)
FROM inventories i
LEFT JOIN products p
ON i.product_id = p.product_id
WHERE p.product_id IS NULL;
/* To ensure complete inventory tracking and maintain consistency between stock and product data, 
missing product records were created for unmatched product IDs, 
allowing all inventory records to be retained and properly linked for accurate reporting. */

			-- Contacts → Customers
INSERT INTO customers (customer_id, name, address, credit_limit, website, location_id, segment_id)
SELECT DISTINCT c.customer_id,
       CONCAT('Unknown Customer ', c.customer_id),
       'Unknown Address',
       0,
       NULL,
       NULL,
       NULL
FROM contacts c
LEFT JOIN customers cu 
ON c.customer_id = cu.customer_id
WHERE cu.customer_id IS NULL;
/* To maintain complete customer-contact relationships and avoid data loss, 
placeholder customer records were created for unmatched customer IDs, 
ensuring all contacts remain linked and usable for customer profiling and relationship analysis. */

-- Business DUPLICATE FIXING 
/* Duplicate order item records were resolved by aggregating repeated product entries within the same order.
Quantities were summed while unit price was preserved using the average price, 
ensuring that sales volume and revenue remain consistent without double-counting product lines. */
DROP TABLE IF exists order_items_backup;
CREATE TABLE  order_items_backup AS
SELECT *
FROM order_items;
DROP TABLE IF exists order_items_clean;
CREATE TABLE IF NOT EXISTS order_items_clean AS
SELECT
    order_id,
    MIN(item_id) AS item_id,
    product_id,
    SUM(quantity) AS quantity,
    AVG(unit_price) AS unit_price
FROM order_items
GROUP BY order_id, product_id;

SELECT order_id, product_id, COUNT(*)
FROM order_items_clean
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

SELECT * FROM order_items_clean;
DROP TABLE order_items;
RENAME TABLE order_items_clean TO order_items;

/* Duplicate product records were resolved by selecting a single master product_id 
for each duplicated product_name. All dependent records in order_items and inventories 
were updated to reference the master product_id before removing redundant entries 
from the products table. This ensures consistency in product-level reporting, 
accurate revenue aggregation, and reliable inventory tracking. */
SELECT product_id, product_name
FROM products
WHERE product_name IN (
    SELECT product_name
    FROM products
    GROUP BY product_name
    HAVING COUNT(*) > 1
);

			-- Update ALL dependent tables
					-- order_items
SET SQL_SAFE_UPDATES = 0;
UPDATE order_items
SET product_id = 108
WHERE product_id = 152;

UPDATE order_items
SET product_id = 156
WHERE product_id = 267;

UPDATE order_items
SET product_id = 172
WHERE product_id = 238;

					-- inventories
/* Instead of directly updating foreign keys, I handled duplicate conflicts by aggregating inventory quantities per warehouse, 
deleting conflicting rows, and reinserting clean merged records. 
This ensured data integrity and avoided violating composite primary key constraints. */
DROP TABLE IF EXISTS temp_inventory_108;
CREATE TEMPORARY TABLE temp_inventory_108 AS
SELECT 
    108 AS product_id,
    warehouse_id,
    SUM(quantity) AS quantity
FROM inventories
WHERE product_id IN (108, 152)
GROUP BY warehouse_id;

DELETE FROM inventories
WHERE product_id IN (108, 152);

SELECT *
FROM inventories
WHERE product_id IN (108, 152)
ORDER BY warehouse_id;

INSERT INTO inventories (product_id, warehouse_id, quantity)
SELECT product_id, warehouse_id, quantity
FROM temp_inventory_108;

SELECT *
FROM inventories
WHERE product_id = 108
ORDER BY warehouse_id;

SELECT *
FROM inventories
WHERE product_id = 152;

UPDATE inventories
SET product_id = 108
WHERE product_id = 152;

/* Instead of directly updating foreign keys, I handled duplicate conflicts by aggregating inventory quantities per warehouse, 
deleting conflicting rows, and reinserting clean merged records. 
This ensured data integrity and avoided violating composite primary key constraints. */
DROP TABLE IF EXISTS temp_inventory_172;
CREATE TEMPORARY TABLE temp_inventory_172 AS
SELECT 
    172 AS product_id,
    warehouse_id,
    SUM(quantity) AS quantity
FROM inventories
WHERE product_id IN (172, 238)
GROUP BY warehouse_id;

DELETE FROM inventories
WHERE product_id IN (172, 238);

SELECT *
FROM inventories
WHERE product_id IN (172, 238)
ORDER BY warehouse_id;

INSERT INTO inventories (product_id, warehouse_id, quantity)
SELECT product_id, warehouse_id, quantity
FROM temp_inventory_172;

SELECT *
FROM inventories
WHERE product_id = 172
ORDER BY warehouse_id;

SELECT *
FROM inventories
WHERE product_id = 238;

UPDATE inventories
SET product_id = 172
WHERE product_id = 238;


SELECT *
FROM order_items
WHERE product_id IN (152, 267, 238);

DELETE FROM products
WHERE product_id IN (152, 267, 238);

SELECT product_name, COUNT(*)
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;