from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def create_enrollment_file():
    data = """Python,Rahul
Python,Priya
SQL,Amit
Python,Sneha
Power BI,Kiran
SQL,Megha
Power BI,Arjun"""

    with open("/tmp/enrollments.txt","w") as f:
        f.write(data)

def count_students():

    courses = {}

    with open("/tmp/enrollments.txt") as f:

        for line in f:
            course, student = line.strip().split(",")
            courses[course] = courses.get(course,0) + 1

    with open("/tmp/course_report.txt","w") as f:
        for course,count in courses.items():
            f.write(f"{course} = {count}\n")

def generate_course_report():
    pass

with DAG(
    dag_id="exercise14_course_enrollment",
    start_date=datetime(2025,1,1),
    schedule="@daily",
    catchup=False
) as dag:

    t1 = PythonOperator(task_id="create_enrollment_file", python_callable=create_enrollment_file)
    t2 = PythonOperator(task_id="count_students", python_callable=count_students)
    t3 = PythonOperator(task_id="generate_course_report", python_callable=generate_course_report)

    t1 >> t2 >> t3