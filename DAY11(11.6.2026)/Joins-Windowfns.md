
# 🔗 PySpark Joins

Joins are used to combine data from multiple DataFrames based on a common column.

---

# 1. Inner Join

## 📌 Definition

Returns only the matching records from both DataFrames.

## 📌 Where It Is Used

* Customer orders analysis
* Employee department mapping
* Banking transaction verification

## 📌 Example

```python
customers_df.join(
    orders_df,
    "customer_id",
    "inner"
).show()
```

---

# 2. Left Join

## 📌 Definition

Returns all records from the left DataFrame and matching records from the right DataFrame.

## 📌 Where It Is Used

* Finding customers with or without orders
* Employee attendance tracking
* Healthcare patient records

## 📌 Example

```python
customers_df.join(
    orders_df,
    "customer_id",
    "left"
).show()
```

---

# 3. Right Join

## 📌 Definition

Returns all records from the right DataFrame and matching records from the left DataFrame.

## 📌 Where It Is Used

* Supplier-product analysis
* Audit reporting
* Data reconciliation

## 📌 Example

```python
customers_df.join(
    orders_df,
    "customer_id",
    "right"
).show()
```

---

# 4. Full Outer Join

## 📌 Definition

Returns all records when there is a match in either DataFrame.

## 📌 Where It Is Used

* Data warehouse integration
* Merging datasets from different systems
* Missing data analysis

## 📌 Example

```python
customers_df.join(
    orders_df,
    "customer_id",
    "outer"
).show()
```

---

# 5. Cross Join

## 📌 Definition

Returns the Cartesian product of both DataFrames.

## 📌 Where It Is Used

* Recommendation systems
* Testing combinations
* Simulation datasets

## 📌 Example

```python
customers_df.crossJoin(products_df).show()
```

---

# 6. Self Join

## 📌 Definition

A DataFrame joined with itself.

## 📌 Where It Is Used

* Employee-manager hierarchy
* Organizational structures
* Recursive relationships

## 📌 Example

```python
employees.alias("e1").join(
    employees.alias("e2"),
    col("e1.manager_id") == col("e2.employee_id")
).show()
```

---

# 🪟 Window Functions

Window functions perform calculations across a group of rows related to the current row without collapsing the data.

---

# 📌 Import Statements

```python
from pyspark.sql.window import Window
from pyspark.sql.functions import *
```

---

# 📌 Window Specification

```python
window_spec = Window.partitionBy(
    "department"
).orderBy(
    col("salary").desc()
)
```

---

# 1. Row Number

## 📌 Definition

Assigns a unique row number to each row.

## 📌 Where It Is Used

* Ranking systems
* Pagination
* Removing duplicates

## 📌 Example

```python
df.withColumn(
    "row_number",
    row_number().over(window_spec)
).show()
```

---

# 2. Rank

## 📌 Definition

Assigns ranking with gaps for duplicate values.

## 📌 Where It Is Used

* Competition rankings
* Leaderboards
* Sales rankings

## 📌 Example

```python
df.withColumn(
    "rank",
    rank().over(window_spec)
).show()
```

---

# 3. Dense Rank

## 📌 Definition

Assigns ranking without gaps.

## 📌 Where It Is Used

* Employee performance ranking
* Product sales analysis
* Top-N analytics

## 📌 Example

```python
df.withColumn(
    "dense_rank",
    dense_rank().over(window_spec)
).show()
```

---

# 4. Lead Function

## 📌 Definition

Accesses the next row value.

## 📌 Where It Is Used

* Trend analysis
* Comparing future values
* Forecasting

## 📌 Example

```python
df.withColumn(
    "next_salary",
    lead("salary", 1).over(window_spec)
).show()
```

---

# 5. Lag Function

## 📌 Definition

Accesses the previous row value.

## 📌 Where It Is Used

* Time-series analysis
* Comparing past values
* Revenue tracking

## 📌 Example

```python
df.withColumn(
    "previous_salary",
    lag("salary", 1).over(window_spec)
).show()
```

---

# 6. Running Total

## 📌 Definition

Calculates cumulative totals over rows.

## 📌 Where It Is Used

* Financial reporting
* Sales tracking
* Banking analytics

## 📌 Example

```python
window_spec = Window.partitionBy(
    "department"
).orderBy("salary")

df.withColumn(
    "running_total",
    sum("salary").over(window_spec)
).show()
```

---


* Joins combine multiple DataFrames.
* Window functions perform calculations without grouping rows.
* Widely used in ETL pipelines and Data Engineering workflows.

