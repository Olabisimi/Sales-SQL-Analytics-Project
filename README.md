# Sales-SQL-Analytics-Project
End-to-end SQL analysis project covering revenue, customer segmentation, inventory valuation, employee performance, and advanced analytics like Pareto analysis, basket analysis, and time-series trends.

# Project Overview
This project presents a complete SQL-based workflow covering data validation, cleaning, and advanced business analysis on a multi-table sales database.

The dataset includes transactional, customer, product, inventory, and geographical data, structured across 15 relational tables.

The project focuses not just on querying data, but on resolving real-world data quality issues such as broken relationships, duplicate records, and inconsistent product definitions before performing analysis.

# Problem Statement

Organizations often struggle to convert raw transactional data into meaningful insights due to fragmented data structures and lack of analytical frameworks.

This project addresses key business questions:

- What percentage of revenue is driven by top customers?
- Which products dominate total revenue (Pareto analysis)?
- How efficiently are employees generating revenue and profit?
- Where is inventory capital concentrated across warehouses?
- Which regions and countries drive the highest sales?
- How stable is product revenue over time?
- What purchasing patterns exist between products?

The goal is to provide a structured analytical layer using SQL that supports decision-making across finance, sales, and operations.


# Data Cleaning & Preparation
## Overview
Before performing any analytical queries, a comprehensive data quality assessment and cleaning process was conducted to ensure:
Referential integrity across tables
Elimination of duplicate records
Completeness of critical fields
Accuracy of transactional calculations
Consistency across product, customer, and inventory data

This step was critical to prevent incorrect revenue calculations, broken joins, and misleading insights.

# 1. Data Quality Assessment
## 1.1 Row Count Validation
A full row count check was performed across all tables to establish baseline data volumes:
Tables validated: orders, order_items, customers, products, inventories, locations, regions, etc.
Purpose: ensure no unexpected data loss or duplication during ingestion

## 1.2 Referential Integrity Checks (Critical Findings)
Multiple LEFT JOIN validation checks were performed to identify orphaned records.

Key Issues Identified:
Orders referencing non-existent customers
Impact:
Customer-level revenue becomes incomplete
Segmentation analysis becomes unreliable

Order items referencing missing products
Impact:
Revenue underreporting
Product performance distortion

Inventory records referencing missing products
Impact:
Broken inventory reporting
Inconsistent stock tracking

Contacts referencing missing customers
Impact:
Incomplete customer profiling
Broken relationship mapping

These issues confirmed that foreign key dependencies were violated at multiple levels, requiring controlled remediation.

# 2. Duplicate Detection
## 2.1 Primary Key Duplicates
All major entity tables were checked for duplicate primary keys:
Customers, Orders, Products, Regions, Locations, Employees, etc.
✔ No critical primary key duplication affecting structural integrity

## 2.2 Business Logic Duplicates (Major Issue)
Detected duplicates based on real-world logic rather than keys:

Critical Cases:

Duplicate products (same product_name)
Leads to:
Fragmented revenue

Split inventory tracking
Duplicate order items (same product within same order)
Leads to:
Overcounted quantities
Inflated revenue

Duplicate customers (same name + address)
Duplicate contacts (same identity fields)
These required deduplication with aggregation and mapping, not deletion.

# 3. Missing Values Analysis
Comprehensive NULL checks were performed across all tables.
Key Observations:
Most core tables had high completeness
Exception:
employees.manager_id → 1 NULL
✔ Valid case (top-level executive)
Risk Assessment:
Missing foreign keys → breaks joins
Missing transactional values → corrupts metrics

# 4. Data Validity Checks
Issues Checked:
Negative product prices
Negative inventory quantities
Invalid order quantities (≤ 0)
✔ Ensured all transactional data used in revenue calculations is valid

# 5. Data Cleaning & Fixing Actions
## 5.1 Handling Missing Customer References (Orders)
Instead of deleting affected records:
Created a derived classification:
CASE 
    WHEN c.customer_id IS NULL THEN 'Unknown Customer'
    ELSE 'Known Customer'
END
✔ Result:
Preserved all transactions
Enabled transparency in reporting


# Methodology

The analysis followed a layered SQL approach:

1. Base Aggregations
- Revenue, orders, inventory, and profit calculations

2. Dimensional Analysis
- Breaking metrics by customer, product, employee, region, and warehouse

3. Advanced SQL Techniques
- Window Functions:
  - RANK()
  - LAG()
  - SUM() OVER()

- CTEs:
  - Used to simplify complex analytical logic (Pareto, trends)

4. Business Metrics
- Revenue contribution
- Profit margin
- Customer concentration
- Employee efficiency
- Inventory valuation
- Revenue volatility

5. Analytical Models Applied
- Pareto Analysis (80/20 rule)
- Basket Analysis (product pairing)
- Time-Series Trend Analysis
- Efficiency Ranking

# Key Insights

1. Revenue Concentration (Customer Level)
- Top 10 customers contribute over 50% of total revenue
- The highest customer alone generated approximately 3.7M in revenue
- Indicates high dependency on a small customer base (risk exposure)

2. Pareto Product Analysis
- A small subset of products contributes to the majority of revenue
- Top products individually generate over 1.3M in revenue
- Confirms the 80/20 rule in product performance

3. Regional Performance
- Americas generated the highest revenue (~17.7M)
- Asia followed closely (~16.7M)
- Europe slightly lower (~16.3M)
- Revenue distribution is relatively balanced but slightly skewed toward Americas

4. Country-Level Insights
- Canada is the top-performing country (~9.3M revenue)
- Japan and USA follow as major contributors
- Indicates strong market concentration in a few countries

5. Employee Performance Variation
- Top employee generated over 8M in revenue
- Significant gap between top and lowest performers
- Revenue per order varies widely, indicating efficiency differences

6. Inventory Distribution
- Some warehouses hold inventory worth over 6.8M
- Others hold significantly less (~1M range)
- Suggests imbalance in inventory allocation

7. Product Volatility
- Certain products show high revenue fluctuations (volatility > 160K)
- Indicates unstable demand patterns for specific items

8. Basket Analysis
- Multiple product pairs occur frequently within the same orders
- Opportunities exist for bundling and cross-selling strategies

9. Customer Retention Issue
- Presence of one-time customers suggests weak retention strategy

10. Profitability by Category
- Some categories generate high revenue but lower margins
- Indicates pricing or cost inefficiencies in certain segments


# Conclusion

This project demonstrates how SQL can be used beyond querying to perform full-scale business analysis.

By integrating multiple datasets and applying advanced analytical techniques, the analysis uncovered critical patterns in revenue concentration, operational efficiency, and product performance.

The findings highlight both strengths (strong top performers) and risks (customer concentration, inventory imbalance, revenue volatility).


# Recommendations

1. Reduce Customer Concentration Risk
- Develop strategies to retain mid-tier customers
- Expand customer base to reduce reliance on top clients

2. Optimize Product Strategy
- Focus on high-performing products identified in Pareto analysis
- Improve or phase out low-performing products

3. Improve Employee Efficiency
- Analyze practices of top-performing employees
- Standardize best practices across the sales team

4. Rebalance Inventory
- Redistribute stock across warehouses based on demand patterns
- Reduce capital locked in underutilized inventory

5. Leverage Product Pairing
- Introduce product bundles based on basket analysis
- Increase average order value through cross-selling

6. Monitor Revenue Stability
- Closely track volatile products
- Implement forecasting for better demand planning

7. Improve Margin Management
- Review pricing and cost structure for low-margin categories


## 📂 Project Setup & Execution Guide

This section explains how to set up the database, run the cleaning scripts, and execute the analysis queries.

---

### 1. Requirements

- MySQL (recommended: MySQL Workbench)
- Basic SQL knowledge
- Access to the `.sql` files in this repository

---

### 2. Create Database

Open MySQL Workbench and run:

CREATE DATABASE business_intelligence_db;
USE business_intelligence_db;

---

### 3. Import Raw Dataset

- Open the provided SQL file containing table creation and inserts (e.g., `raw_data.sql`)
- Run the script to create all tables:

Tables include:
- customers
- orders
- order_items
- products
- inventories
- employees
- locations, countries, regions
- and supporting dimension tables

---

### 4. Run Data Cleaning & Validation

Run the cleaning script:

data_cleaning.sql

This script performs:

✔ Row count validation  
✔ Relationship integrity checks  
✔ Duplicate detection (primary + business logic)  
✔ Missing value checks  
✔ Data quality validation (negative values, invalid quantities)  

---

### 5. Apply Data Fixes

Run the cleaning_fixing.sql script to apply fixes:

✔ Creation of "Unknown Customer" and "Unknown Product" placeholders  
✔ Deduplication of order items (aggregation fix)  
✔ Product deduplication using master product_id mapping  
✔ Inventory conflict resolution using aggregation and reinsertion  
✔ Preservation of all transactional records  

⚠️ Important:
Do NOT skip steps — some fixes depend on earlier validation.

---

### 6. Verify Clean Dataset

Run validation queries again to confirm:

- No duplicate order items  
- No broken relationships  
- No missing critical references  

Example:

SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;

---

### 7. Run Analysis Queries

Open:

Business_Intelligence_Queries.sql

Execute queries step-by-step:

- Revenue & Profit calculations  
- Customer analysis  
- Employee performance  
- Inventory valuation  
- Regional and country performance  
- Pareto analysis  
- Basket analysis  
- Time-series analysis  

---

### 8. Output Interpretation

Results can be viewed directly in MySQL Workbench.

Optional:
- Export results to CSV
- Load into Power BI / Excel for visualization

---

### 9. File Structure (Recommended)
├── raw_tables_creation
├── raw_data.sql (from 1 to 7)
├── data_cleaning.sql  
├── cleaning_fixing.sql
├── Business_Intelligence_queries.sql  
└── README.md  

---

### 10. Notes

- This project emphasizes **data integrity before analysis**
- Cleaning steps are critical to ensure:
  - Accurate revenue calculations
  - Correct joins
  - Reliable business insights

Skipping cleaning steps may result in:
❌ Duplicate revenue  
❌ Broken joins  
❌ Incorrect reporting

---

## 📌 Tools Used
SQL (MySQL)
Relational Database Design
Data Analysis Techniques


---

## 📌 Author
Olabisi Yekeen
Data Analyst | SQL | Power BI | Excel
