from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def create_transactions():
    data = """Deposit,10000
Withdraw,2500
Deposit,4000
Withdraw,1500
Deposit,2000"""

    with open("/tmp/transactions.txt","w") as f:
        f.write(data)

def calculate_balance():

    deposits = 0
    withdrawals = 0

    with open("/tmp/transactions.txt") as f:

        for line in f:
            action, amount = line.strip().split(",")

            if action == "Deposit":
                deposits += int(amount)
            else:
                withdrawals += int(amount)

    balance = deposits - withdrawals

    with open("/tmp/account_report.txt","w") as f:
        f.write(f"Total Deposit = {deposits}\n")
        f.write(f"Total Withdrawal = {withdrawals}\n")
        f.write(f"Final Balance = {balance}")

def generate_account_report():
    pass

with DAG(
    dag_id="exercise12_bank_transactions",
    start_date=datetime(2025,1,1),
    schedule="@daily",
    catchup=False
) as dag:

    t1 = PythonOperator(task_id="create_transactions", python_callable=create_transactions)
    t2 = PythonOperator(task_id="calculate_balance", python_callable=calculate_balance)
    t3 = PythonOperator(task_id="generate_account_report", python_callable=generate_account_report)

    t1 >> t2 >> t3