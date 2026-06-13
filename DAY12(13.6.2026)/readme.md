# Capstone 1 & 2 
# PySpark Functions Used 

## Data Ingestion Functions

| Function        | Purpose                          |
| --------------- | -------------------------------- |
| `read.csv()`    | Reads CSV files into DataFrames  |
| `read.json()`   | Reads JSON files into DataFrames |
| `printSchema()` | Displays DataFrame schema        |
| `show()`        | Displays DataFrame records       |
| `count()`       | Counts total records             |
| `columns`       | Returns column names             |

---

## Data Cleaning Functions

| Function              | Purpose                      |
| --------------------- | ---------------------------- |
| `isNull()`            | Checks for NULL values       |
| `fillna()`            | Fills missing values         |
| `withColumn()`        | Creates or modifies columns  |
| `when()`              | Adds conditional logic       |
| `otherwise()`         | Defines default condition    |
| `col()`               | References DataFrame columns |
| `withColumnRenamed()` | Renames columns              |

---

## JSON Flattening Functions

| Function                | Purpose                     |
| ----------------------- | --------------------------- |
| `alias()`               | Renames selected columns    |
| `col("features.field")` | Accesses nested JSON fields |

---

## Join Functions

| Function | Purpose                      |
| -------- | ---------------------------- |
| `join()` | Combines multiple DataFrames |

### Join Types Used

* `left`
* `left_anti`

---

## Transformation Functions

| Function                  | Purpose               |                             |
| ------------------------- | --------------------- | --------------------------- |
| Arithmetic Operations     | Calculates over usage |                             |
| Logical Operators (`&`, ` | `)                    | Applies multiple conditions |

---

## Aggregation Functions

| Function           | Purpose               |
| ------------------ | --------------------- |
| `groupBy()`        | Groups records        |
| `agg()`            | Performs aggregations |
| `sum()`            | Calculates totals     |
| `avg()`            | Calculates averages   |
| `count_distinct()` | Counts unique values  |

---

## Sorting & Filtering Functions

| Function    | Purpose                   |
| ----------- | ------------------------- |
| `orderBy()` | Sorts records             |
| `desc()`    | Sorts in descending order |
| `filter()`  | Filters rows              |

---

## Window Functions

| Function               | Purpose                      |
| ---------------------- | ---------------------------- |
| `Window.orderBy()`     | Creates global window        |
| `Window.partitionBy()` | Creates partitioned window   |
| `rank()`               | Assigns rank with gaps       |
| `row_number()`         | Assigns unique row numbers   |
| `lag()`                | Fetches previous row value   |
| `lead()`               | Fetches next row value       |
| `over()`               | Applies window specification |

---

## Spark SQL Functions

| Function                    | Purpose                     |
| --------------------------- | --------------------------- |
| `createOrReplaceTempView()` | Creates SQL temporary views |
| `spark.sql()`               | Executes SQL queries        |

---

## Data Writing Functions

| Function        | Purpose                |
| --------------- | ---------------------- |
| `write`         | Writes DataFrames      |
| `mode()`        | Specifies write mode   |
| `parquet()`     | Writes parquet files   |
| `partitionBy()` | Partitions output data |

### Write Modes Used

* `overwrite`
* `append`

---

## DataFrame Operations

| Function   | Purpose                  |
| ---------- | ------------------------ |
| `select()` | Selects specific columns |
| `limit()`  | Limits number of rows    |

---

## File Formats Used

* CSV
* JSON
* Parquet

---

## Architecture Layers

### Bronze Layer

Raw ingested data.

### Silver Layer

Cleaned and transformed data.

### Gold Layer

Business-ready analytical reports.

---

## Key PySpark Concepts Covered

* ETL Pipeline
* Data Cleaning
* JSON Flattening
* Joins
* Transformations
* Aggregations
* Window Functions
* Spark SQL
* Incremental Loading
* Partitioning
* Gold Layer Reporting
