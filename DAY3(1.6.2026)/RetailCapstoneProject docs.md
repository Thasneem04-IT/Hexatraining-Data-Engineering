# Retail Capstone Project Documentation

Database Design

The project was designed using MySQL for an online retail company. The database contains six tables:

* customers
* products
* orders
* order_items
* payments
* deliveries

Primary keys and foreign keys were used to maintain relationships and data integrity.

---

## Table Relationships

* One customer can place many orders.
* One order can contain multiple products.
* Products and orders are connected through the order_items table.
* Each order has payment and delivery details.

Relationships:

* customers → orders
* orders → order_items
* products → order_items
* orders → payments
* orders → deliveries

---

## Key Insights from Reports

* Electronics category generated high revenue.
* Hyderabad had multiple active customers.
* Some customers placed multiple orders.
* Pending deliveries and failed payments were identified.
* Data quality checks helped find missing or invalid records.

The project demonstrated the use of SQL concepts such as joins, aggregate functions, GROUP BY, HAVING, subqueries, and data quality analysis.
