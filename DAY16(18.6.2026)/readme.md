# Azure Databricks Unity Catalog - Hands-On Learning

## Overview

This project demonstrates hands-on implementation of Azure Databricks Unity Catalog concepts, including data governance, managed and external catalogs, schemas, tables, and storage management using Azure Data Lake Storage Gen2 (ADLS Gen2).

The objective was to understand how Unity Catalog organizes and governs data assets in a modern Lakehouse architecture.

---

## Architecture

```text
Azure Data Lake Storage (ADLS Gen2)
                │
                ▼
        Unity Catalog Metastore
                │
     ┌──────────┴──────────┐
     ▼                     ▼
Managed Catalog     External Catalog
     │                     │
     ▼                     ▼
  Schemas              Schemas
     │                     │
     ▼                     ▼
  Tables               Tables
```

---

## Concepts Covered

### 1. Data Governance

Data Governance ensures:

* Secure data access
* Centralized permission management
* Auditing and monitoring
* Data lineage tracking
* Data discovery

Unity Catalog acts as the centralized governance layer for all data assets within Databricks.

---

### 2. Unity Catalog Hierarchy

```text
Metastore
   │
   ▼
Catalog
   │
   ▼
Schema
   │
   ▼
Table / View / Volume
```

#### Metastore

Top-level governance container that stores metadata and manages catalogs across workspaces.

#### Catalog

Logical container used to organize schemas.

Examples:

* healthcare
* finance
* sales

#### Schema

Logical grouping of tables and views inside a catalog.

Examples:

* healthcare.patients
* finance.transactions

#### Table

Stores structured data in rows and columns.

---

### 3. Managed Catalog

A Managed Catalog uses storage managed by Databricks and Unity Catalog.

#### Flow

```text
Create Table
      │
      ▼
Unity Catalog
      │
      ▼
Databricks Managed Storage
      │
      ▼
Data Files Created
```

#### Characteristics

* Databricks manages storage location
* Databricks manages table lifecycle
* Simplified administration
* Automatic storage management

#### Table Deletion Behavior

```text
DROP TABLE
     │
     ├── Metadata Deleted
     └── Data Files Deleted
```

---

### 4. External Catalog

An External Catalog references data stored in customer-managed cloud storage.

#### Flow

```text
ADLS Storage
      │
      ▼
External Location
      │
      ▼
Unity Catalog
      │
      ▼
External Tables
```

#### Characteristics

* Organization owns storage
* Databricks accesses data through permissions
* Storage remains outside Databricks management
* Common in enterprise environments

#### Table Deletion Behavior

```text
DROP TABLE
     │
     ├── Metadata Deleted
     └── Data Files Remain
```

---

### 5. Managed vs External Catalog

| Feature           | Managed Catalog          | External Catalog              |
| ----------------- | ------------------------ | ----------------------------- |
| Storage Ownership | Databricks Managed       | Customer Managed              |
| Metadata          | Managed by Unity Catalog | Managed by Unity Catalog      |
| Data Files        | Managed by Databricks    | Managed by Customer           |
| Table Drop        | Metadata + Files Deleted | Metadata Deleted Only         |
| Use Case          | Simplicity               | Enterprise Storage Governance |

---

### 6. Volumes

Volumes are Unity Catalog objects used to store unstructured data.

Examples:

* PDF files
* Images
* Excel files
* JSON files
* Machine Learning artifacts

#### Hierarchy

```text
Catalog
   │
   ▼
Schema
   │
   ├── Tables
   ├── Views
   └── Volumes
```

#### Use Cases

* Store business documents
* Store images
* Store configuration files
* Store ML models

---

## Key SQL Commands Practiced

### Create Catalog

```sql
CREATE CATALOG managed_catalog;
```

### Create Schema

```sql
CREATE SCHEMA managed_catalog.sales;
```

### Create Table

```sql
CREATE TABLE managed_catalog.sales.orders (
    order_id INT,
    customer_name STRING
);
```

### Show Catalogs

```sql
SHOW CATALOGS;
```

### Show Schemas

```sql
SHOW SCHEMAS IN managed_catalog;
```

### Show Tables

```sql
SHOW TABLES IN managed_catalog.sales;
```

---

## Key Learnings

* Understood Unity Catalog architecture and governance model.
* Practiced creation of Managed and External Catalogs.
* Learned the differences between managed and external storage.
* Explored the Metastore → Catalog → Schema → Table hierarchy.
* Understood how Unity Catalog handles metadata management.
* Learned the purpose of Volumes for unstructured data storage.
* Practiced catalog, schema, and table creation using SQL.

---

## Technologies Used

* Azure Databricks
* Unity Catalog
* Azure Data Lake Storage Gen2 (ADLS Gen2)
* SQL
* Delta Lake

---

## Outcome

Successfully implemented and explored Unity Catalog governance concepts, gaining practical experience with managed storage, external storage integration, metadata management, and enterprise-grade data governance within Azure Databricks.
