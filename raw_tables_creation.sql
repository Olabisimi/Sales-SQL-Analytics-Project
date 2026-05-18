--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS business_intelligence_db;
USE business_intelligence_db;

--------------------------------------------------------------------------------------
-- Part 1. drop existing tables
--------------------------------------------------------------------------------------
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS inventories;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_subcategories;
DROP TABLE IF EXISTS product_categories;
DROP TABLE IF EXISTS warehouses;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS customer_segments;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS regions;

--------------------------------------------------------------------------------------
-- Part 2. schema
--------------------------------------------------------------------------------------
-- Create tables without foreign keys to avoid dependency errors
--------------------------------------------------------------------------------------

CREATE TABLE regions
(
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
)
AUTO_INCREMENT = 5; -- IDs 1-4 reserved for manual inserts


CREATE TABLE countries
(
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) NOT NULL,
    region_id INT NOT NULL
);


CREATE TABLE locations
(
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    country_id CHAR(2)
)
AUTO_INCREMENT = 24; -- IDs 1-23 reserved for manual inserts


CREATE TABLE customer_segments
(
    segment_id INT AUTO_INCREMENT PRIMARY KEY,
    segment_name VARCHAR(100) NOT NULL
)
AUTO_INCREMENT = 4; -- IDs 1-3 reserved for manual inserts


CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    website VARCHAR(255),
    credit_limit DECIMAL(8,2),
    location_id INT,
    segment_id INT
)
AUTO_INCREMENT = 320; -- IDs 1-319 reserved for manual inserts


CREATE TABLE contacts
(
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    customer_id INT
)
AUTO_INCREMENT = 320; -- IDs 1-319 reserved for manual inserts


CREATE TABLE teams
(
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL
)
AUTO_INCREMENT = 6; -- IDs 1-5 reserved for manual inserts


CREATE TABLE employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    manager_id INT,
    job_title VARCHAR(255) NOT NULL,
    team_id INT
)
AUTO_INCREMENT = 108; -- IDs 1-107 reserved for manual inserts


CREATE TABLE warehouses
(
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(255),
    location_id INT
)
AUTO_INCREMENT = 10; -- IDs 1-9 reserved for manual inserts


CREATE TABLE product_categories
(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
)
AUTO_INCREMENT = 4; -- IDs 1-3 reserved for manual inserts


CREATE TABLE product_subcategories
(
    subcategory_id INT AUTO_INCREMENT PRIMARY KEY,
    subcategory_name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL
)
AUTO_INCREMENT = 16; -- IDs 1-15 reserved for manual inserts


CREATE TABLE products
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description VARCHAR(2000),
    standard_cost DECIMAL(9,2),
    list_price DECIMAL(9,2),
    category_id INT NULL,
    subcategory_id INT
)
AUTO_INCREMENT = 288; -- IDs 1-287 reserved for manual inserts


CREATE TABLE orders
(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    salesman_id INT,
    order_date DATE NOT NULL
)
AUTO_INCREMENT = 106; -- IDs 1-105 reserved for manual inserts


CREATE TABLE order_items
(
    order_id INT,
    item_id INT,
    product_id INT NOT NULL,
    quantity DECIMAL(8,2) NOT NULL,
    unit_price DECIMAL(8,2) NOT NULL,
    CONSTRAINT pk_order_items PRIMARY KEY (order_id, item_id)
);


CREATE TABLE inventories
(
    product_id INT,
    warehouse_id INT,
    quantity INT NOT NULL,
    CONSTRAINT pk_inventories PRIMARY KEY (product_id, warehouse_id)
);

--------------------------------------------------------------------------------------
-- Part 3. Add foreign key constraints
--------------------------------------------------------------------------------------

ALTER TABLE countries
ADD CONSTRAINT fk_countries_regions
FOREIGN KEY (region_id) REFERENCES regions(region_id)
ON DELETE CASCADE;

ALTER TABLE locations
ADD CONSTRAINT fk_locations_countries
FOREIGN KEY (country_id) REFERENCES countries(country_id)
ON DELETE CASCADE;

ALTER TABLE customers
ADD CONSTRAINT fk_customers_locations
FOREIGN KEY (location_id) REFERENCES locations(location_id)
ON DELETE CASCADE;

ALTER TABLE customers
ADD CONSTRAINT fk_customers_segments
FOREIGN KEY (segment_id) REFERENCES customer_segments(segment_id)
ON DELETE SET NULL;

ALTER TABLE contacts
ADD CONSTRAINT fk_contacts_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE;

ALTER TABLE employees
ADD CONSTRAINT fk_employees_manager
FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
ON DELETE CASCADE;

ALTER TABLE employees
ADD CONSTRAINT fk_employees_teams
FOREIGN KEY (team_id) REFERENCES teams(team_id)
ON DELETE SET NULL;

ALTER TABLE warehouses
ADD CONSTRAINT fk_warehouses_locations
FOREIGN KEY (location_id) REFERENCES locations(location_id)
ON DELETE CASCADE;

ALTER TABLE product_subcategories
ADD CONSTRAINT fk_subcategories_categories
FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
ON DELETE CASCADE;

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
ON DELETE CASCADE;

ALTER TABLE products
ADD CONSTRAINT fk_products_subcategories
FOREIGN KEY (subcategory_id) REFERENCES product_subcategories(subcategory_id)
ON DELETE SET NULL;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_employees
FOREIGN KEY (salesman_id) REFERENCES employees(employee_id)
ON DELETE SET NULL;

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE CASCADE;

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE CASCADE;

ALTER TABLE inventories
ADD CONSTRAINT fk_inventories_products
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE CASCADE;

ALTER TABLE inventories
ADD CONSTRAINT fk_inventories_warehouses
FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
ON DELETE CASCADE;

--------------------------------------------------------------------------------------
-- Part 4. Disable FK checks before inserts
--------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
  
------------------------------------------------------------------------------------
-- Part 3. Data
------------------------------------------------------------------------------------

-- disable FK constraints to avoid dependency order problems
SET FOREIGN_KEY_CHECKS = 0;
--------------------------------------------------------

