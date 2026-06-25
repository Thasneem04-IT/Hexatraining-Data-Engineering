# Airflow Reporting Workflows (Exercises 7–14)

## Commands

### Start Airflow

```bash
docker compose up -d
```

### Restart Airflow

```bash
docker compose restart
```

### List Available DAGs

```bash
docker exec -it airflow-learning-airflow-scheduler-1 airflow dags list
```

### View Generated Reports

```bash
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/department_report.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/bill_summary.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/result_summary.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/sales_report.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/weather_report.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/account_report.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/age_report.txt
docker exec -it airflow-learning-airflow-worker-1 cat /tmp/course_report.txt
```

## Project Files

### exercise7.py – Department Salary Report

Calculates total salary for each department and generates a department-wise salary report.

### exercise8.py – Electricity Bill Summary

Calculates total and average electricity units consumed and generates a billing summary.

### exercise9.py – Exam Result Report

Counts pass and fail results and generates a result summary report.

### exercise10.py – Online Orders Analysis

Calculates product revenue, total sales revenue, and identifies the highest-selling product.

### exercise11.py – Temperature Analysis

Finds the highest temperature, calculates average temperature, and generates a weather report.

### exercise12.py – Bank Transaction Summary

Calculates total deposits, withdrawals, and final account balance.

### exercise13.py – Employee Age Report

Finds the youngest and oldest employees and calculates the average age.

### exercise14.py – Course Enrollment Report

Counts student enrollments for each course and generates a course-wise enrollment report.
