# ✈️ Airline Operations Analytics Platform using Azure Databricks

## 📌 Project Overview

This project demonstrates the design and implementation of an end-to-end Airline Operations Analytics Platform using Azure Databricks, Unity Catalog, Delta Lake, PySpark, Spark SQL, and Databricks Workflows.

The platform ingests flight, booking, and passenger preference data, processes it through a Medallion Architecture (Bronze, Silver, Gold), and generates analytical insights for airline operations, revenue tracking, route performance, passenger preferences, and flight delays.

The project also showcases modern data engineering concepts such as Delta Lake, MERGE operations (SCD Type 1), Time Travel, Optimization techniques, Workflow orchestration, and Scheduled Data Pipelines.

---

## 🎯 Business Problem

SkyJet Airways requires a scalable analytics platform to:

* Analyze flight operations
* Track booking revenue
* Monitor flight delays
* Understand passenger preferences
* Identify top-performing routes
* Support daily incremental data ingestion
* Generate business-ready reports

---

## 🛠️ Technologies Used

| Category               | Technology           |
| ---------------------- | -------------------- |
| Data Platform          | Azure Databricks     |
| Data Lakehouse         | Delta Lake           |
| Data Processing        | PySpark              |
| SQL Analytics          | Spark SQL            |
| Governance             | Unity Catalog        |
| Visualization          | Matplotlib           |
| Workflow Orchestration | Databricks Workflows |
| Versioning             | Git & GitHub         |

---

## 🏗️ Architecture

```text
Raw CSV / JSON Files
        │
        ▼
┌─────────────────┐
│ Bronze Layer    │
│ Raw Ingestion   │
└─────────────────┘
        │
        ▼
┌─────────────────┐
│ Silver Layer    │
│ Transformations │
└─────────────────┘
        │
        ▼
┌─────────────────┐
│ Gold Layer      │
│ Business Ready  │
│ Analytics Data  │
└─────────────────┘
        │
        ▼
Reports & Dashboards
```

---

## 📂 Dataset Details

### Flights Dataset

| Column    |
| --------- |
| flight_id |
| airline   |
| from_city |
| to_city   |
| duration  |
| status    |

### Bookings Dataset

| Column         |
| -------------- |
| booking_id     |
| flight_id      |
| passenger_name |
| travel_class   |
| ticket_price   |
| booking_date   |

### Passenger Preferences Dataset

| Column         |
| -------------- |
| passenger_name |
| meal           |
| seat           |

---

## 🥉 Bronze Layer

Raw data ingestion from CSV and JSON files.

### Tables Created

* flights_bronze
* bookings_bronze
* preferences_bronze

### Activities

* Schema inference
* Raw data validation
* Delta table creation

---

## 🥈 Silver Layer

Data cleansing and transformation layer.

### Transformations Implemented

### Revenue Column

```python
revenue = ticket_price
```

### Price Band Classification

| Condition | Category |
| --------- | -------- |
| > 20000   | Premium  |
| > 10000   | Standard |
| Else      | Budget   |

### Delay Flag

| Status  | Delay Flag |
| ------- | ---------- |
| Delayed | Yes        |
| Others  | No         |

### Tables Created

* flights_silver
* bookings_silver

---

## 🥇 Gold Layer

Business-ready analytical dataset.

### Table Created

* passenger_journey_gold

### Join Logic

```text
Bookings
    +
Flights
    +
Passenger Preferences
```

Generated a complete passenger journey dataset for analytics and reporting.

---

## 📊 Exploratory Data Analysis

Generated analytical reports using Matplotlib.

### Revenue by Airline

* Bar Chart

### Revenue by Travel Class

* Pie Chart

### Flights by Status

* Pie Chart

### Top Routes

* Horizontal Bar Chart

### Ticket Price Distribution

* Scatter Plot

---

## 🔍 Spark SQL Analytics

Implemented analytical SQL queries including:

### Revenue by Airline

```sql
SELECT airline,
SUM(revenue)
FROM journey
GROUP BY airline;
```

### Revenue by Route

```sql
SELECT route,
SUM(revenue)
FROM journey
GROUP BY route;
```

### Average Ticket Price

```sql
SELECT AVG(ticket_price)
FROM journey;
```

### Most Popular Destination

```sql
SELECT to_city,
COUNT(*)
FROM journey
GROUP BY to_city;
```

---

## 📈 Window Functions

Implemented advanced analytical calculations using Spark Window Functions.

### Features

* Top 3 Revenue Flights
* Airline Ranking
* Route Ranking
* Running Revenue
* Dense Rank Destinations

Functions Used:

```text
RANK()
DENSE_RANK()
SUM() OVER()
ROW_NUMBER()
```

---

## 🚀 Delta Lake Implementation

### Delta Table Creation

Implemented using:

* save()
* saveAsTable()
* CREATE TABLE USING DELTA

### Delta Features Demonstrated

* ACID Transactions
* Schema Enforcement
* Time Travel
* Data Versioning

---

## 🔄 Incremental Data Loading

Implemented daily incremental loading using Delta MERGE.

### Scenario

Day 1

* Initial bookings loaded

Day 2

* New bookings inserted
* Existing bookings updated

### SCD Type 1 Implementation

```sql
MERGE INTO target
USING source
ON condition

WHEN MATCHED THEN UPDATE

WHEN NOT MATCHED THEN INSERT
```

---

## ⏳ Delta Time Travel

Compared table versions before and after MERGE operations.

### Operations Performed

* Read Version 0
* Read Version 1
* Read Latest Version
* Compare Historical Data

### Commands Used

```sql
DESCRIBE HISTORY table_name

SELECT *
FROM table_name
VERSION AS OF 0;
```

---

## ⚡ Delta Optimization

Implemented Delta performance optimization techniques.

### Commands Used

```sql
OPTIMIZE booking_master;

OPTIMIZE booking_master
ZORDER BY(flight_id);

VACUUM booking_master;
```

### Benefits

* Faster query execution
* Improved data skipping
* Reduced storage footprint

---

## 📋 Tables and Views

### Managed Table

```python
saveAsTable()
```

### Temporary View

```python
createOrReplaceTempView()
```

### Global Temporary View

```python
createOrReplaceGlobalTempView()
```

### External Table

```sql
CREATE TABLE ...
LOCATION ...
```

---

## 🔄 Workflow Orchestration

Created Databricks Workflow:

### Airline Analytics Pipeline

```text
Ingest Flights
      ↓
Ingest Bookings
      ↓
Ingest Preferences
      ↓
Transform Silver
      ↓
Create Gold Layer
```

### Workflow Configuration

* Retry Count: 2
* Timeout: 30 Minutes
* Serverless Compute

---

## ⏰ Job Scheduling

Configured automated pipeline execution.

### Schedule

```text
Frequency : Daily
Time      : 08:00 AM
Timezone  : Asia/Kolkata
```

### Monitoring

* Execution History
* Logs
* Task Duration
* Success / Failure Tracking

---

## 📑 Final Reports Generated

### Airline Revenue Report

| Airline | Revenue |
| ------- | ------- |

### Route Performance Report

| Route | Revenue |
| ----- | ------- |

### Passenger Preference Report

| Passenger | Meal | Seat |
| --------- | ---- | ---- |

### Flight Delay Report

| Flight | Status |
| ------ | ------ |

### Top Revenue Flights Report

| Flight | Rank |
| ------ | ---- |

---

## 📚 Key Concepts Demonstrated

* Unity Catalog
* Delta Lake
* Medallion Architecture
* PySpark Data Transformations
* Spark SQL Analytics
* Window Functions
* Delta MERGE
* SCD Type 1
* Delta Time Travel
* OPTIMIZE & VACUUM
* Managed and External Tables
* Databricks Workflows
* Pipeline Scheduling

---

