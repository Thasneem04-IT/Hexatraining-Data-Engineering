from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def create_bill_file():
    data = """Rahul,210
Priya,180
Amit,300
Sneha,150
Kiran,260"""

    with open("/tmp/electricity.txt", "w") as f:
        f.write(data)

def calculate_total_units():
    total = 0
    customers = 0

    with open("/tmp/electricity.txt") as f:
        for line in f:
            _, units = line.strip().split(",")
            total += int(units)
            customers += 1

    avg = total / customers

    with open("/tmp/bill_summary.txt", "w") as f:
        f.write(f"Customers = {customers}\n")
        f.write(f"Total Units = {total}\n")
        f.write(f"Average Units = {avg}")

def generate_bill_summary():
    pass

with DAG(
    dag_id="exercise8_electricity_bill",
    start_date=datetime(2025,1,1),
    schedule="@daily",
    catchup=False
) as dag:

    t1 = PythonOperator(task_id="create_bill_file", python_callable=create_bill_file)
    t2 = PythonOperator(task_id="calculate_total_units", python_callable=calculate_total_units)
    t3 = PythonOperator(task_id="generate_bill_summary", python_callable=generate_bill_summary)

    t1 >> t2 >> t3