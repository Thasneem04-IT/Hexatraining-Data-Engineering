# End-to-End Healthcare Analytics Platform using Azure Databricks

## Project Overview

This project demonstrates the development of a complete Healthcare Analytics Platform using Azure Databricks, Delta Lake, Unity Catalog, PySpark, Spark SQL, and Data Visualization.

The platform processes patient, doctor, appointment, billing, and hospital preference data to generate meaningful business insights through a modern Lakehouse architecture following the Bronze → Silver → Gold approach.

---

## Business Problem

A hospital group requires a centralized analytics platform to:

* Analyze patient and appointment data
* Monitor hospital revenue
* Track department performance
* Identify top-performing doctors
* Understand patient demographics
* Generate operational and financial insights
* Build a scalable healthcare data platform

---

## Architecture

```text
Raw Files
    │
    ▼
Bronze Layer
(Raw Delta Tables)
    │
    ▼
Silver Layer
(Cleansed & Enriched Data)
    │
    ▼
Gold Analytics
(Aggregations & Reporting)
    │
    ▼
Visualization & Insights
```

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

## Dataset Overview

### Patients

Contains patient demographics and insurance information.

**Columns**

* patient_id
* patient_name
* city
* state
* age
* gender
* insurance_status

---

### Doctors

Contains doctor and department information.

**Columns**

* doctor_id
* doctor_name
* department
* city
* consultation_fee

---

### Appointments

Contains appointment and billing details.

**Columns**

* appointment_id
* patient_id
* doctor_id
* appointment_date
* diagnosis
* bill_amount
* status

---

### Patient Preferences

Semi-structured JSON dataset containing:

* Preferred hospital
* Contact information
* Email
* Phone

---

# Project Implementation

## Part 1 — Data Ingestion

### Completed Tasks

* Uploaded CSV and JSON files into Unity Catalog Volume
* Read files using PySpark
* Validated schemas
* Created Bronze Delta tables

### Bronze Tables

* bronze_patients
* bronze_doctors
* bronze_appointments
* bronze_preferences

---

## Part 2 — Data Cleaning & Transformation

### Transformations Performed

* Handled missing values
* Flattened nested JSON data
* Joined patients with preferences
* Joined appointments with patients
* Joined appointments with doctors
* Created billing metrics
* Created appointment month
* Created patient age groups

### Derived Columns

#### Final Bill

```text
final_bill = bill_amount + consultation_fee
```

#### Appointment Month

```text
yyyy-MM
```

#### Patient Age Group

```text
Age >= 50  → Senior
Age >= 30  → Adult
Else       → Young
```

### Silver Table

* silver_appointments

---

## Part 3 — Spark SQL Analytics

Generated insights including:

### Revenue Analysis

* Total Hospital Revenue
* Revenue by Department
* Revenue by City

### Operational Analysis

* Completed Appointments
* Top Patients by Billing

---

## Part 4 — Window Functions

Implemented advanced analytics using Spark Window Functions.

### Insights Generated

* Doctor Revenue Ranking
* Department Revenue Ranking
* Top 3 Patients by Billing
* Top Doctor in Each Department
* Running Revenue by Appointment Date

---

## Part 5 — Delta Lake

Implemented key Delta Lake features.

### Delta Operations

* Delta Table using DataFrame Write
* Delta Table using saveAsTable()
* Delta Table using SQL
* Delta History
* Time Travel
* SCD Type 1 Merge
* Version Tracking
* OPTIMIZE
* ZORDER
* VACUUM

---

## Part 6 — Data Visualization

Built visualizations using Spark, Pandas, and Matplotlib.

### Charts Created

* Revenue by Department
* Revenue by City
* Appointment Status Distribution
* Top Doctors by Revenue
* Revenue Trend by Date

---

## Part 7 — Tables and Views

Implemented:

### Tables

* Managed Table
* External Table

### Views

* Temporary View
* Global Temporary View

### Comparison

| Object                | Scope              | Lifetime         |
| --------------------- | ------------------ | ---------------- |
| Managed Table         | Catalog/Schema     | Until Dropped    |
| External Table        | Catalog/Schema     | Until Dropped    |
| Temporary View        | Current Session    | Session Ends     |
| Global Temporary View | Workspace Sessions | Cluster Lifetime |

---

## Unity Catalog Structure

```text
healthcare_catalog
│
├── healthcare_analytics
│   │
│   ├── healthcare_volume
│   │
│   ├── bronze_patients
│   ├── bronze_doctors
│   ├── bronze_appointments
│   ├── bronze_preferences
│   │
│   ├── silver_appointments
│   │
│   ├── managed_hospital
│   └── external_hospital
```

---

## Key Skills Demonstrated

* Azure Databricks
* Data Lakehouse Architecture
* Unity Catalog
* Delta Lake
* PySpark Transformations
* Spark SQL
* Window Functions
* Delta Optimization
* SCD Type 1 Merge
* Data Visualization
* Healthcare Analytics

---

