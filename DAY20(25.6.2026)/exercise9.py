from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def create_result_file():
    data = """Rahul,Pass
Priya,Fail
Amit,Pass
Sneha,Pass
Kiran,Fail
Megha,Pass"""

    with open("/tmp/results.txt","w") as f:
        f.write(data)

def count_pass_fail():
    passed = 0
    failed = 0

    with open("/tmp/results.txt") as f:
        for line in f:
            _, result = line.strip().split(",")

            if result == "Pass":
                passed += 1
            else:
                failed += 1

    with open("/tmp/result_summary.txt","w") as f:
        f.write(f"Pass = {passed}\n")
        f.write(f"Fail = {failed}")

def generate_result_summary():
    pass

with DAG(
    dag_id="exercise9_exam_results",
    start_date=datetime(2025,1,1),
    schedule="@daily",
    catchup=False
) as dag:

    t1 = PythonOperator(task_id="create_result_file", python_callable=create_result_file)
    t2 = PythonOperator(task_id="count_pass_fail", python_callable=count_pass_fail)
    t3 = PythonOperator(task_id="generate_result_summary", python_callable=generate_result_summary)

    t1 >> t2 >> t3