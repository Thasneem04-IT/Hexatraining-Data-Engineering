# Apache Airflow DAG Exercises 🚀

A collection of Apache Airflow DAG exercises covering file operations, data processing, calculations, and report generation using Python-based Airflow tasks.

## Project Overview

This project demonstrates:

* Creating and reading files using Airflow DAGs
* Task dependency management
* Data processing workflows
* File-based ETL pipelines
* Generating reports automatically

Workflow pattern used:

```
Task 1
  ↓
Task 2
  ↓
Task 3
```

---

# Prerequisites

## Required

* Docker
* Docker Compose
* Apache Airflow running locally

Check Docker:

```bash
docker --version
```

Check containers:

```bash
docker ps
```

---

# Start Apache Airflow

Navigate to project folder:

```bash
cd airflow-learning
```

Start Airflow:

```bash
docker compose up -d
```

Check running containers:

```bash
docker ps
```

Expected containers:

```
airflow-webserver
airflow-scheduler
airflow-postgres
```

---

# Access Airflow UI

Open:

```
http://localhost:8080
```

Login:

```
Username:
airflow

Password:
airflow
```

Enable the DAG from the UI.

---

# Project Structure

```
airflow-learning/

│
├── dags/
│
│   ├── exercise1_file_operations.py
│   ├── exercise2_salary_report.py
│   ├── exercise3_student_marks.py
│   ├── exercise4_stock_alert.py
│   ├── exercise5_attendance.py
│   └── exercise6_csv_processing.py
│
└── docker-compose.yml
```

---

# Exercise 1 - Create and Read File

## Workflow

```
create_file
      ↓
read_file
```

## Input File Created

Location:

```
/tmp/message.txt
```

Content:

```
Welcome to Apache Airflow
Learning DAGs
Learning Task Dependencies
```

## Run DAG

Airflow UI:

```
DAGs
 ↓
exercise1_file_operations
 ↓
Trigger DAG
```

## Check Logs

Open:

```
read_file task
 ↓
Logs
```

Output:

```
Welcome to Apache Airflow
Learning DAGs
Learning Task Dependencies
```

---

# Exercise 2 - Employee Salary Report

## Workflow

```
create_salary_file
          ↓
calculate_total_salary
          ↓
generate_report
```

## Input

Created:

```
/tmp/employees.txt
```

Content:

```
Rahul,45000
Priya,52000
Amit,61000
Sneha,48000
```

---

## Calculation

Total:

```
45000
+52000
+61000
+48000

=206000
```

---

## Generated File

```
/tmp/report.txt
```

Output:

```
Salary Report
Employees = 4
Total Salary = 206000
```

---

# Exercise 3 - Student Marks Processing

## Workflow

```
create_marks_file
          ↓
calculate_average
          ↓
generate_result
```

## Input

```
/tmp/marks.txt
```

Content:

```
Math,80
Science,75
English,90
Python,95
```

---

## Average Calculation

```
(80+75+90+95)/4

=85
```

---

## Generated File

```
/tmp/result.txt
```

Output:

```
Average Marks = 85
Result = PASS
```

---

# Exercise 4 - Product Stock Alert

## Workflow

```
create_inventory
          ↓
find_low_stock
          ↓
generate_alert
```

## Inventory Data

```
Rice,50
Oil,7
Soap,35
Sugar,10
Tea,5
```

---

## Rule

Low stock:

```
Stock < 15
```

---

## Generated File

```
/tmp/alerts.txt
```

Output:

```
Oil
Sugar
Tea
```

---

# Exercise 5 - Attendance Report

## Workflow

```
create_attendance
          ↓
count_present
          ↓
count_absent
          ↓
generate_summary
```

## Input

```
Rahul,Present
Priya,Present
Amit,Absent
Sneha,Present
Kiran,Absent
```

---

## Generated Report

File:

```
/tmp/attendance_report.txt
```

Output:

```
Total Students = 5
Present = 3
Absent = 2
```

---

# Exercise 6 - CSV Processing

## Workflow

```
create_csv
      ↓
read_csv
      ↓
calculate_revenue
      ↓
create_summary
```

---

## CSV Input

File:

```
sales.csv
```

Content:

```
product,quantity,price
Laptop,2,70000
Mouse,5,500
Keyboard,3,1200
```

---

# Revenue Calculation

Formula:

```
Revenue = quantity * price
```

Results:

```
Laptop
2 * 70000

=140000


Mouse
5 * 500

=2500


Keyboard
3 * 1200

=3600
```

---

## Total Revenue

```
140000
+2500
+3600

=146100
```

---

## Summary Output

Generated:

```
summary.txt
```

Content:

```
Laptop = 140000
Mouse = 2500
Keyboard = 3600
Total Revenue = 146100
```

---

# Useful Docker Commands

## View Airflow Logs

Scheduler:

```bash
docker logs airflow-learning-airflow-scheduler-1
```

Webserver:

```bash
docker logs airflow-learning-airflow-webserver-1
```

---

## Access Airflow Container

```bash
docker exec -it airflow-learning-airflow-scheduler-1 bash
```

---

## Check Generated Files

Inside container:

```bash
cat /tmp/message.txt
```

Example:

```bash
cat /tmp/report.txt
```

---

# Stop Airflow

Stop containers:

```bash
docker compose down
```

Remove volumes:

```bash
docker compose down -v
```

---

# Key Airflow Concepts Covered

✅ DAG creation
✅ PythonOperator
✅ Task dependencies
✅ File handling
✅ Data transformation
✅ ETL workflow design
✅ Task logs
✅ Automated report generation

---

# Final Output Summary

| Exercise           | Output                              |
| ------------------ | ----------------------------------- |
| File Operations    | Read file content through task logs |
| Salary Report      | Total salary calculation            |
| Student Processing | Average calculation and result      |
| Stock Alert        | Low inventory detection             |
| Attendance         | Student attendance summary          |
| CSV Processing     | Revenue calculation                 |

---

## Author

Apache Airflow Learning Project
