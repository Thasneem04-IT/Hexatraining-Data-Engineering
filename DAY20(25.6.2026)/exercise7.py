from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime


def create_department_file():

    data = """IT,45000
HR,35000
Finance,50000
IT,55000
Finance,40000
HR,30000"""

    with open("/tmp/departments.txt", "w") as f:
        f.write(data)


def calculate_department_salary():

    department_totals = {}

    with open("/tmp/departments.txt", "r") as f:

        for line in f:
            department, salary = line.strip().split(",")

            salary = int(salary)

            if department not in department_totals:
                department_totals[department] = 0

            department_totals[department] += salary

    with open("/tmp/department_totals.txt", "w") as f:

        for department, total in department_totals.items():
            f.write(f"{department} = {total}\n")


def generate_department_report():

    with open("/tmp/department_totals.txt", "r") as f:
        report = f.read()

    with open("/tmp/department_report.txt", "w") as f:
        f.write(report)


with DAG(
    dag_id="exercise7_department_salary_report",
    start_date=datetime(2025, 1, 1),
    schedule="@daily",
    catchup=False
) as dag:

    task1 = PythonOperator(
        task_id="create_department_file",
        python_callable=create_department_file
    )

    task2 = PythonOperator(
        task_id="calculate_department_salary",
        python_callable=calculate_department_salary
    )

    task3 = PythonOperator(
        task_id="generate_department_report",
        python_callable=generate_department_report
    )

    task1 >> task2 >> task3