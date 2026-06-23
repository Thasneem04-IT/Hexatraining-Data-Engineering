# Apache Airflow Overview 🚀

## What is Apache Airflow?

Apache Airflow is an **open-source workflow orchestration platform** used to **design, schedule, monitor, and manage data pipelines**.

It allows engineers to define workflows as code using **Python**, where each workflow is represented as a sequence of tasks with defined dependencies.

Airflow helps automate processes such as:

* Extracting data from databases
* Processing and transforming data
* Moving files between systems
* Running machine learning pipelines
* Generating reports
* Scheduling recurring jobs

Instead of manually running scripts every day, Airflow automatically executes and monitors the entire workflow.

---

# Why do we need Airflow?

In real-world data systems, multiple tasks need to run in a specific order.

Example:

A daily sales pipeline:

```
Extract Data
      ↓
Clean Data
      ↓
Transform Data
      ↓
Load Into Data Warehouse
      ↓
Generate Report
```

Without orchestration:

* Scripts run manually
* Difficult to track failures
* No dependency management
* Hard to monitor execution history

With Airflow:

```
Task 1
  |
  ↓
Task 2
  |
  ↓
Task 3
```

Airflow manages:

✅ Task execution
✅ Scheduling
✅ Dependencies
✅ Failures and retries
✅ Logs
✅ Monitoring

---

# Key Components of Airflow

## 1. DAG (Directed Acyclic Graph)

A DAG represents a workflow.

It defines:

* What tasks need to run
* Order of execution
* Dependencies between tasks

Example:

```
Download File
       ↓
Process Data
       ↓
Generate Report
```

---

## 2. Task

A task is a single unit of work inside a DAG.

Examples:

* Read a file
* Run SQL query
* Upload data
* Calculate values

Example:

```python
create_file = PythonOperator(
    task_id="create_file",
    python_callable=create_file_function
)
```

---

## 3. Operator

Operators define what type of task Airflow should execute.

Common operators:

### PythonOperator

Runs Python functions.

Example:

```python
PythonOperator(
task_id="calculate_salary",
python_callable=calculate_salary
)
```

---

### BashOperator

Runs shell commands.

Example:

```python
BashOperator(
task_id="check_file",
bash_command="ls /tmp"
)
```

---

### SQL Operators

Execute database queries.

Example:

```sql
SELECT COUNT(*) FROM employees;
```

---

# Airflow Workflow Example

A simple ETL pipeline:

```
Extract Data
      |
      ↓
Transform Data
      |
      ↓
Load Data
```

In Airflow:

```python
extract >> transform >> load
```

The `>>` symbol defines task dependency.

Meaning:

"Run transform only after extract completes."

---

# Why Airflow Instead of Azure Data Factory?

Both Apache Airflow and Azure Data Factory are workflow orchestration tools, but they are designed differently.

## Apache Airflow

Airflow is:

* Open source
* Code-based
* Highly customizable
* Platform independent

Example:

A Python-based DAG:

```python
task1 >> task2 >> task3
```

---

## Azure Data Factory (ADF)

Azure Data Factory is:

* Cloud-based Azure service
* GUI-driven
* Low-code/no-code focused

ADF pipelines are created using:

* Visual designer
* Drag-and-drop activities
* Azure integrations

---

# Airflow vs Azure Data Factory

| Feature           | Apache Airflow      | Azure Data Factory       |
| ----------------- | ------------------- | ------------------------ |
| Type              | Open-source tool    | Azure cloud service      |
| Workflow creation | Python code         | Visual UI                |
| Cloud dependency  | Independent         | Azure focused            |
| Custom logic      | Very flexible       | Limited compared to code |
| Version control   | Easy with Git       | Supported                |
| Scheduling        | Advanced            | Available                |
| Monitoring        | Web UI              | Azure Monitor            |
| Cost              | Free (self-managed) | Pay-as-you-use           |
| Best for          | Complex workflows   | Azure data integration   |

---

# Why choose Airflow?

Airflow is preferred when:

## 1. Complex Data Pipelines

Example:

```
API Data
    ↓
Python Processing
    ↓
Spark Job
    ↓
Database Load
    ↓
ML Model
```

Airflow handles complex dependencies easily.

---

## 2. Need More Control

Airflow allows developers to write custom Python logic.

Example:

```python
if records > 1000:
    run_processing()
else:
    stop_pipeline()
```

---

## 3. Multi-Cloud Environment

Airflow can work with:

* AWS
* Azure
* Google Cloud
* Databases
* APIs
* Local systems

It is not locked to one platform.

---

# When Azure Data Factory is better?

ADF is useful when:

* Company uses Azure ecosystem heavily
* Need quick pipeline development
* Mostly moving data between Azure services

Example:

```
Azure SQL
    ↓
ADF Pipeline
    ↓
Azure Data Lake
    ↓
Synapse Analytics
```

---

# What is a DAG?

DAG stands for:

## Directed Acyclic Graph

A DAG is a graph structure that represents a workflow.

It has:

### Directed

Tasks have a defined direction.

Example:

```
Task A → Task B
```

Task B depends on Task A.

---

### Acyclic

No loops are allowed.

Invalid:

```
Task A
 ↓
Task B
 ↓
Task A
```

Airflow workflows must always move forward.

---

### Graph

A collection of connected tasks.

Example:

```
          Extract
             |
      ----------------
      |              |
 Transform       Validate
      |
      ↓
     Load
```

---

# DAG Example in Airflow

Python:

```python
from airflow import DAG
from airflow.operators.python import PythonOperator


with DAG(
    dag_id="employee_pipeline"
) as dag:


    create_file = PythonOperator(
        task_id="create_file",
        python_callable=create_file
    )


    calculate_salary = PythonOperator(
        task_id="calculate_salary",
        python_callable=calculate_salary
    )


    generate_report = PythonOperator(
        task_id="generate_report",
        python_callable=generate_report
    )


    create_file >> calculate_salary >> generate_report
```

Execution flow:

```
create_file

      ↓

calculate_salary

      ↓

generate_report
```

---

# Airflow DAG Lifecycle

```
Create DAG
    |
    ↓
Scheduler detects DAG
    |
    ↓
Task execution starts
    |
    ↓
Workers execute tasks
    |
    ↓
Logs generated
    |
    ↓
Success / Failure status shown
```

---

# Summary

Apache Airflow is a workflow orchestration tool used to automate and monitor data pipelines.

Main concepts:

| Concept   | Meaning               |
| --------- | --------------------- |
| DAG       | Workflow definition   |
| Task      | Individual operation  |
| Operator  | Task execution method |
| Scheduler | Triggers workflows    |
| Worker    | Executes tasks        |
| Logs      | Execution details     |

Airflow is widely used in Data Engineering because it provides flexibility, automation, monitoring, and complete control over complex workflows.
