from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def create_orders():
    data = """product,quantity,price
Laptop,1,70000
Mouse,4,500
Monitor,2,12000
Keyboard,3,1500"""

    with open("/tmp/orders.csv","w") as f:
        f.write(data)

def calculate_order_value():

    total_revenue = 0
    highest_product = ""
    highest_value = 0

    with open("/tmp/orders.csv") as f:

        next(f)

        for line in f:
            product, qty, price = line.strip().split(",")

            revenue = int(qty) * int(price)

            total_revenue += revenue

            if revenue > highest_value:
                highest_value = revenue
                highest_product = product

    with open("/tmp/sales_report.txt","w") as f:
        f.write(f"Total Revenue = {total_revenue}\n")
        f.write(f"Highest Selling Product = {highest_product}")

def generate_sales_report():
    pass

with DAG(
    dag_id="exercise10_online_orders",
    start_date=datetime(2025,1,1),
    schedule="@daily",
    catchup=False
) as dag:

    t1 = PythonOperator(task_id="create_orders", python_callable=create_orders)
    t2 = PythonOperator(task_id="calculate_order_value", python_callable=calculate_order_value)
    t3 = PythonOperator(task_id="generate_sales_report", python_callable=generate_sales_report)

    t1 >> t2 >> t3