# Databricks Workflows & Jobs - Hands-on Exercises

This repository contains beginner-friendly Databricks Workflow and Job exercises covering notebook execution, scheduled jobs, task dependencies, and workflow monitoring.

---

# Exercise 1: Employee Notebook Job

## Objective

Create a notebook, load employee data into a DataFrame, and execute it using a Databricks Job.

---

## Notebook: employee_loader

### Create Employee Data

```python
employee_data = [
    (101, "Rahul", "IT", 75000),
    (102, "Priya", "HR", 65000),
    (103, "Amit", "Finance", 80000),
    (104, "Sneha", "IT", 70000)
]
```

### Create DataFrame

```python
columns = ["emp_id", "name", "department", "salary"]

employee_df = spark.createDataFrame(employee_data, columns)
```

### Display DataFrame

```python
display(employee_df)
```

### Print Completion Message

```python
print("Employee Load Completed")
```

---

## Job Configuration

### Job Name

```text
Employee Daily Load
```

### Task

```text
employee_loader
```

### Steps

1. Create Job
2. Attach notebook
3. Run manually
4. Verify logs and output

---

# Exercise 2: Scheduled Product Pipeline

## Objective

Create a scheduled Databricks Job that performs product analytics every hour.

---

## Notebook: product_loader

### Product Data

```python
product_data = [
    (1, "Laptop", 65000),
    (2, "Mobile", 25000),
    (3, "Keyboard", 1500),
    (4, "Monitor", 12000)
]
```

### Create DataFrame

```python
columns = ["product_id", "product_name", "price"]

product_df = spark.createDataFrame(product_data, columns)
```

### Display Products

```python
display(product_df)
```

### Create Temporary View

```python
product_df.createOrReplaceTempView("products")
```

### Average Product Price

```python
avg_price = spark.sql("""
SELECT AVG(price) AS average_price
FROM products
""")

display(avg_price)
```

---

## Job Configuration

### Job Name

```text
Product Analytics
```

### Schedule

```text
Interval: Every 1 Hour
```

### Steps

1. Create Job
2. Attach notebook
3. Add Scheduled Trigger
4. Set interval to 1 hour
5. Save
6. Verify Job History

---

# Exercise 3: Multi-Notebook Workflow

## Objective

Build a workflow containing multiple dependent tasks.

---

## Notebook 1: customer_loader

### Create Customer Data

```python
customer_data = [
    (1, "John", "Chennai"),
    (2, "Sara", "Bangalore"),
    (3, "David", "Chennai"),
    (4, "Priya", "Hyderabad")
]

customer_df = spark.createDataFrame(
    customer_data,
    ["customer_id", "customer_name", "city"]
)

display(customer_df)

print("Customer Load Completed")
```

---

## Notebook 2: customer_summary

### Generate Summary

```python
customer_data = [
    (1, "John", "Chennai"),
    (2, "Sara", "Bangalore"),
    (3, "David", "Chennai"),
    (4, "Priya", "Hyderabad")
]

customer_df = spark.createDataFrame(
    customer_data,
    ["customer_id", "customer_name", "city"]
)

summary_df = customer_df.groupBy("city").count()

display(summary_df)

print("Customer Summary Completed")
```

---

## Workflow Configuration

### Job Name

```text
Customer Workflow
```

### Tasks

#### Task A

```text
customer_loader
```

#### Task B

```text
customer_summary
```

### Dependency

```text
customer_summary depends on customer_loader
```

### Workflow

```text
customer_loader
        ↓
customer_summary
```

### Verification

* Task A succeeds
* Task B succeeds
* Dependency is respected

---

# Exercise 4: Scheduled Banking Report

## Objective

Generate a daily banking report and schedule it to run automatically.

---

## Notebook: bank_report

### Create Account Data

```python
account_data = [
    (101, "Chennai", 50000),
    (102, "Bangalore", 70000),
    (103, "Chennai", 30000),
    (104, "Hyderabad", 40000)
]

columns = ["account_id", "city", "balance"]

bank_df = spark.createDataFrame(account_data, columns)
```

### Calculate Total Balance by City

```python
report_df = (
    bank_df.groupBy("city")
           .sum("balance")
           .withColumnRenamed("sum(balance)", "total_balance")
)

display(report_df)
```

---

## Job Configuration

### Job Name

```text
Daily Banking Report
```

### Schedule

```text
Daily
```

Example:

```text
09:00 AM Every Day
```

### Steps

1. Create Job
2. Attach notebook
3. Configure daily schedule
4. Run manually
5. Check duration
6. View logs
7. Disable schedule
8. Re-enable schedule

---

# Concepts Covered

✅ Databricks Notebooks

✅ PySpark DataFrames

✅ SQL Queries

✅ Temporary Views

✅ Databricks Jobs

✅ Scheduled Workflows

✅ Manual Job Execution

✅ Job Monitoring

✅ Execution Logs

✅ Multi-Task Workflows

✅ Task Dependencies

✅ Workflow Scheduling

---

# Learning Outcomes


* Create and execute Databricks notebooks
* Build and schedule jobs
* Configure workflow triggers
* Monitor job execution
* View logs and run history
* Create multi-task workflows
* Configure task dependencies
* Automate data pipelines using Databricks Workflows
