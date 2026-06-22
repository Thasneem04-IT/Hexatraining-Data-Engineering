# End-to-End Retail Analytics Platform using Azure Databricks

## Project Overview

This project demonstrates the design and implementation of a complete Retail Analytics Platform using Azure Databricks, following a modern Medallion Architecture (Bronze → Silver → Gold).

The platform ingests raw CSV and JSON files, performs data cleansing and transformations, stores data in Delta Lake tables, executes analytical queries using Spark SQL, applies window functions for business insights, visualizes key metrics, and implements Delta Lake features such as Time Travel, Merge, Optimization, and Vacuum.

The entire workflow is built using Azure Databricks with Unity Catalog and Delta Lake, simulating a real-world Data Engineering pipeline.

---

## Business Scenario

A retail company wants to build a scalable analytics platform to:

* Process customer, product, and order data
* Create a reliable data lakehouse architecture
* Generate business insights and reports
* Support analytical workloads efficiently
* Manage data using Delta Lake best practices
* Prepare production-ready workflows

---

## Architecture

Raw Files → Bronze Layer → Silver Layer → Gold Analytics → Visualization

### Bronze Layer

Raw data ingestion and storage as Delta tables.

### Silver Layer

Data cleaning, enrichment, joins, and business transformations.

### Gold Layer

Aggregated analytical datasets used for reporting and dashboards.

---

## Dataset Details

### customers.csv

Customer master data containing customer information and segmentation.

### products.csv

Product catalog containing product categories and pricing details.

### orders.csv

Order transactions containing quantities, status, and purchase history.

### customer_preferences.json

Semi-structured customer preference and loyalty program information.

---

## Technologies Used

* Azure Databricks
* Apache Spark (PySpark)
* Spark SQL
* Delta Lake
* Unity Catalog
* Python
* Pandas
* Matplotlib

---

## Project Tasks

### Part 1: Data Ingestion

* Uploaded CSV and JSON files to Unity Catalog Volume
* Read source files using PySpark
* Validated schemas
* Created Bronze Delta Tables

#### Bronze Tables

* bronze_customers
* bronze_products
* bronze_orders
* bronze_preferences

---

### Part 2: Data Transformation

Performed:

* Null handling
* JSON flattening
* Customer and preference enrichment
* Order and product joins
* Revenue calculation
* Monthly reporting columns
* Customer segmentation

#### Derived Columns

* revenue = quantity × unit_price
* order_month
* customer_segment

#### Silver Table

* silver_orders

---

### Part 3: Spark SQL Analytics

Implemented analytical queries for:

* Total Revenue
* Revenue by City
* Revenue by Category
* Top Customers
* Completed Orders Analysis

---

### Part 4: Window Functions

Implemented advanced analytics using Spark Window Functions:

* Product Revenue Ranking
* Customer Revenue Ranking
* Top 3 Customers
* Top Product per Category
* Running Revenue Trend

---

### Part 5: Delta Lake Features

Implemented:

* Delta table creation using DataFrame API
* Delta table creation using saveAsTable()
* Delta table creation using SQL
* Delta History
* Time Travel
* SCD Type 1 Merge
* Version Tracking
* OPTIMIZE
* ZORDER
* VACUUM

---

### Part 6: Data Visualization

Generated business insights using Spark + Pandas + Matplotlib.

Visualizations include:

* Revenue by City
* Revenue by Category
* Orders by Status
* Top Products by Revenue
* Revenue Trend by Date

---

### Part 7: Tables and Views

Created and compared:

* Managed Tables
* External Tables
* Temporary Views
* Global Temporary Views

---

## Unity Catalog Structure

```text
retail_catalog
│
├── retail_analytics
│   │
│   ├── retail_volume
│   │
│   ├── bronze_customers
│   ├── bronze_products
│   ├── bronze_orders
│   ├── bronze_preferences
│   │
│   ├── silver_orders
│   │
│   ├── managed_sales
│   └── external_sales
```

---


* Building a complete Lakehouse workflow
* Working with Unity Catalog
* Managing Delta Lake tables
* Handling structured and semi-structured data
* Implementing Medallion Architecture
* Performing Spark SQL analytics
* Using Window Functions for advanced reporting
* Applying Delta Lake optimization techniques
* Creating business-focused visualizations

---

## Outcome

Successfully developed an end-to-end Retail Analytics Platform capable of ingesting, transforming, analyzing, and visualizing retail data using Azure Databricks and Delta Lake while following modern Data Engineering best practices.
