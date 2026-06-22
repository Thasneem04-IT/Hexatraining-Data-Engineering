Hospital Management System – Short Documentation
1. Database Design

The database is designed using a relational model to manage hospital operations efficiently. It consists of 7 main tables:

patients – stores patient personal details
doctors – stores doctor information and specialization
departments – stores hospital departments
appointments – records patient visits with doctors
treatments – stores treatment details and costs
bills – stores billing information for appointments
payments – stores payment transactions for bills

Each table is normalized and designed to reduce redundancy and maintain data integrity.

2. Table Relationships

The database follows a structured relational flow:

A department has multiple doctors
A doctor handles multiple appointments
A patient can have multiple appointments
Each appointment is linked to one treatment
Each appointment generates one bill
Each bill can have one or more payments

Foreign key constraints are used to maintain relationships between tables and ensure referential integrity.

3. Key Insights from Reports

Using SQL queries, the system generates meaningful insights such as:

Total number of patients, doctors, and appointments in the hospital
Revenue generated through billing and payments
Patients with highest total billing amounts
Doctors with maximum appointments and workload
Departments generating the highest revenue
Unpaid or partially paid bills
Data quality issues such as missing treatments or invalid records

These insights help hospital management improve decision-making, resource allocation, and financial tracking.
