from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def create_employee_file():
    data = """Rahul,28
Priya,31
Amit,42
Sneha,26
Kiran,38"""

    with open("/tmp/employees.txt","w") as f:
        f.write(data)

def calculate_average_age():

    employees = {}

    with open("/tmp/employees.txt") as f:

        for line in f:
            name, age = line.strip().split(",")
            employees[name] = int(age)

    youngest = min(employees, key=employees.get)
    oldest = max(employees, key=employees.get)
    average = sum(employees.values()) / len(employees)

    with open("/tmp/age_report.txt","w") as f:
        f.write(f"Youngest = {youngest}\n")
        f.write(f"Oldest = {oldest}\n")
        f.write(f"Average Age = {average}")

def generate_age_report():
    pass

with DAG(
    dag_id="exercise13_employee_age",
    start_date=datetime(2025,1,1),
    schedule="@daily",
    catchup=False
) as dag:

    t1 = PythonOperator(task_id="create_employee_file", python_callable=create_employee_file)
    t2 = PythonOperator(task_id="calculate_average_age", python_callable=calculate_average_age)
    t3 = PythonOperator(task_id="generate_age_report", python_callable=generate_age_report)

    t1 >> t2 >> t3