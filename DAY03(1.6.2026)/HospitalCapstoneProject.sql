CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(100)
);

CREATE TABLE doctors (
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(100),
specialization VARCHAR(100),
department_id INT,
consultation_fee DECIMAL(10,2),
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE patients (
patient_id INT PRIMARY KEY,
patient_name VARCHAR(100),
gender VARCHAR(10),
age INT,
city VARCHAR(50),
phone VARCHAR(15)
);

CREATE TABLE appointments (
appointment_id INT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
appointment_status VARCHAR(30),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
treatment_id INT PRIMARY KEY,
appointment_id INT,
treatment_name VARCHAR(100),
treatment_cost DECIMAL(10,2),
FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE bills (
bill_id INT PRIMARY KEY,
patient_id INT,
appointment_id INT,
bill_date DATE,
total_amount DECIMAL(10,2),
bill_status VARCHAR(30),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE payments (
payment_id INT PRIMARY KEY,
bill_id INT,
payment_mode VARCHAR(30),
paid_amount DECIMAL(10,2),
payment_status VARCHAR(30),
FOREIGN KEY (bill_id) REFERENCES bills(bill_id)
);

INSERT INTO departments VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'General Medicine');

INSERT INTO doctors VALUES
(1, 'Dr. Arun', 'Cardiologist', 1, 900),
(2, 'Dr. Meena', 'Neurologist', 2, 1200),
(3, 'Dr. Ravi', 'Orthopedic', 3, 800),
(4, 'Dr. Priya', 'Pediatrician', 4, 700),
(5, 'Dr. Suresh', 'General Physician', 5, 500),
(6, 'Dr. Kavya', 'Cardiologist', 1, 950),
(7, 'Dr. Manoj', 'Neurologist', 2, 1100),
(8, 'Dr. Divya', 'General Physician', 5, 600);

INSERT INTO patients VALUES
(1, 'Arjun', 'Male', 34, 'Chennai', '9876543210'),
(2, 'Divya', 'Female', 29, 'Hyderabad', '9876543211'),
(3, 'Kiran', 'Male', 45, 'Bangalore', '9876543212'),
(4, 'Sneha', 'Female', 38, 'Chennai', '9876543213'),
(5, 'Vikram', 'Male', 50, 'Hyderabad', '9876543214'),
(6, 'Anitha', 'Female', 27, 'Madurai', '9876543215'),
(7, 'Rohit', 'Male', 31, 'Chennai', '9876543216'),
(8, 'Meera', 'Female', 41, 'Coimbatore', '9876543217'),
(9, 'John', 'Male', 36, 'Hyderabad', '9876543218'),
(10, 'Priya', 'Female', 33, 'Chennai', '9876543219'),
(11, 'Karthik', 'Male', 28, 'Madurai', '9876543220'),
(12, 'Swathi', 'Female', 52, 'Bangalore', '9876543221');


INSERT INTO appointments VALUES
(1, 1, 1, '2026-01-05', 'Completed'),
(2, 2, 2, '2026-01-06', 'Completed'),
(3, 3, 3, '2026-01-07', 'Cancelled'),
(4, 4, 4, '2026-01-08', 'Completed'),
(5, 5, 1, '2026-01-09', 'Completed'),
(6, 6, 5, '2026-01-10', 'Completed'),
(7, 7, 6, '2026-01-11', 'Completed'),
(8, 8, 7, '2026-01-12', 'Cancelled'),
(9, 9, 2, '2026-01-13', 'Completed'),
(10, 10, 8, '2026-01-14', 'Completed'),
(11, 11, 3, '2026-01-15', 'Completed'),
(12, 12, 4, '2026-01-16', 'Completed'),
(13, 1, 6, '2026-01-17', 'Completed'),
(14, 2, 7, '2026-01-18', 'Completed'),
(15, 3, 5, '2026-01-19', 'Completed'),
(16, 4, 1, '2026-01-20', 'Completed'),
(17, 5, 2, '2026-01-21', 'Completed'),
(18, 6, 3, '2026-01-22', 'Cancelled'),
(19, 7, 4, '2026-01-23', 'Completed'),
(20, 8, 5, '2026-01-24', 'Completed');


INSERT INTO treatments VALUES
(1, 1, 'ECG', 1500),
(2, 2, 'MRI Scan', 5000),
(3, 4, 'Bone X-Ray', 1200),
(4, 5, 'Heart Checkup', 2000),
(5, 6, 'Blood Test', 800),
(6, 7, 'CT Scan', 4000),
(7, 9, 'Neurology Check', 3500),
(8, 10, 'General Consultation', 500),
(9, 11, 'Physiotherapy', 1800),
(10, 12, 'Vaccination', 700),
(11, 13, 'ECG', 1500),
(12, 14, 'MRI Scan', 5200),
(13, 15, 'Blood Pressure Check', 600),
(14, 16, 'Cardiac Test', 3000),
(15, 17, 'Diabetes Test', 900);


INSERT INTO bills VALUES
(1, 1, 1, '2026-01-05', 1500, 'Paid'),
(2, 2, 2, '2026-01-06', 5000, 'Paid'),
(3, 4, 4, '2026-01-08', 1200, 'Paid'),
(4, 5, 5, '2026-01-09', 2000, 'Paid'),
(5, 6, 6, '2026-01-10', 800, 'Unpaid'),
(6, 7, 7, '2026-01-11', 4000, 'Paid'),
(7, 9, 9, '2026-01-13', 3500, 'Paid'),
(8, 10, 10, '2026-01-14', 500, 'Paid'),
(9, 11, 11, '2026-01-15', 1800, 'Unpaid'),
(10, 12, 12, '2026-01-16', 700, 'Paid'),
(11, 1, 13, '2026-01-17', 1500, 'Paid'),
(12, 2, 14, '2026-01-18', 5200, 'Paid'),
(13, 3, 15, '2026-01-19', 600, 'Paid'),
(14, 4, 16, '2026-01-20', 3000, 'Paid'),
(15, 5, 17, '2026-01-21', 900, 'Unpaid');


INSERT INTO payments VALUES
(1, 1, 'UPI', 1500, 'Success'),
(2, 2, 'Card', 5000, 'Success'),
(3, 3, 'Cash', 1200, 'Success'),
(4, 4, 'UPI', 2000, 'Success'),
(5, 5, 'UPI', 0, 'Failed'),
(6, 6, 'Net Banking', 4000, 'Success'),
(7, 7, 'UPI', 3500, 'Success'),
(8, 8, 'Cash', 500, 'Success'),
(9, 9, 'Card', 0, 'Pending'),
(10, 10, 'UPI', 700, 'Success'),
(11, 11, 'UPI', 1500, 'Success'),
(12, 12, 'Card', 5200, 'Success'),
(13, 13, 'Cash', 600, 'Success'),
(14, 14, 'UPI', 3000, 'Success'),
(15, 15, 'UPI', 0, 'Pending');

-- BASIC QUERIES
select * from patients;

select * from doctors;

SELECT * FROM patients
WHERE city = 'Hyderabad';

SELECT * FROM doctors
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Cardiology');

SELECT * FROM appointments
WHERE appointment_date > '2026-01-01';

SELECT * FROM appointments
WHERE appointment_status = 'Cancelled';

SELECT * FROM bills
WHERE total_amount > 5000;

SELECT * FROM payments
WHERE payment_mode = 'UPI';

SELECT * FROM patients
WHERE age BETWEEN 30 AND 50;

SELECT * FROM doctors
WHERE consultation_fee > 800;

-- AGGREGATE QUERIES

SELECT COUNT(*) FROM patients;

SELECT COUNT(*) FROM doctors;

SELECT COUNT(*) FROM appointments;

SELECT AVG(consultation_fee) FROM doctors;

SELECT MAX(treatment_cost) FROM treatments;

SELECT SUM(total_amount) FROM bills;

SELECT SUM(paid_amount) FROM payments;

SELECT city, COUNT(*) 
FROM patients
GROUP BY city;

SELECT specialization, COUNT(*) 
FROM doctors
GROUP BY specialization;

SELECT appointment_status, COUNT(*) 
FROM appointments
GROUP BY appointment_status;

-- JOINS

SELECT p.patient_name, a.appointment_date, a.appointment_status
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id;

SELECT d.doctor_name, dept.department_name
FROM doctors d
JOIN departments dept ON d.department_id = dept.department_id;

SELECT p.patient_name, d.doctor_name, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

SELECT a.appointment_id, t.treatment_name, t.treatment_cost
FROM appointments a
JOIN treatments t ON a.appointment_id = t.appointment_id;

SELECT b.bill_id, p.patient_name, b.total_amount
FROM bills b
JOIN patients p ON b.patient_id = p.patient_id;

SELECT b.bill_id, pay.payment_mode, pay.paid_amount, pay.payment_status
FROM bills b
JOIN payments pay ON b.bill_id = pay.bill_id;

SELECT 
p.patient_name,
d.doctor_name,
dept.department_name,
a.appointment_date,
a.appointment_status,
t.treatment_name,
t.treatment_cost,
b.total_amount AS bill_amount,
pay.payment_status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN departments dept ON d.department_id = dept.department_id
LEFT JOIN treatments t ON a.appointment_id = t.appointment_id
LEFT JOIN bills b ON a.appointment_id = b.appointment_id
LEFT JOIN payments pay ON b.bill_id = pay.bill_id;

-- GROUPBY AND HAVING

SELECT doctor_id, COUNT(*) 
FROM appointments
GROUP BY doctor_id;

SELECT d.department_id, COUNT(a.appointment_id)
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.department_id;

SELECT d.department_id, SUM(b.total_amount)
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN bills b ON a.appointment_id = b.appointment_id
GROUP BY d.department_id;

SELECT treatment_name, SUM(treatment_cost)
FROM treatments
GROUP BY treatment_name;

SELECT p.city, SUM(b.total_amount)
FROM patients p
JOIN bills b ON p.patient_id = b.patient_id
GROUP BY p.city;

SELECT doctor_id, COUNT(*)
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > 2;

SELECT d.department_id, SUM(b.total_amount)
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN bills b ON a.appointment_id = b.appointment_id
GROUP BY d.department_id
HAVING SUM(b.total_amount) > 20000;

SELECT p.city, COUNT(*)
FROM patients p
GROUP BY p.city
HAVING COUNT(*) > 2;

-- SUBQUERIES

SELECT * FROM patients
WHERE patient_id IN (SELECT DISTINCT patient_id FROM appointments);

SELECT * FROM patients
WHERE patient_id NOT IN (SELECT DISTINCT patient_id FROM appointments);

SELECT * FROM doctors
WHERE doctor_id NOT IN (SELECT DISTINCT doctor_id FROM appointments);

SELECT * FROM bills
WHERE total_amount > (SELECT AVG(total_amount) FROM bills);

SELECT * FROM bills
WHERE total_amount = (SELECT MAX(total_amount) FROM bills);

SELECT * FROM doctors
WHERE consultation_fee > (SELECT AVG(consultation_fee) FROM doctors);

SELECT * FROM patients
WHERE patient_id IN (
    SELECT a.patient_id
    FROM appointments a
    JOIN doctors d ON a.doctor_id = d.doctor_id
    JOIN departments dept ON d.department_id = dept.department_id
    WHERE dept.department_name = 'Cardiology'
);

SELECT * FROM bills
WHERE bill_status = 'Unpaid';

SELECT * FROM appointments
WHERE appointment_id IN (SELECT appointment_id FROM treatments);

SELECT * FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM bills
    GROUP BY patient_id
    HAVING SUM(total_amount) > (
        SELECT AVG(total_sum)
        FROM (
            SELECT SUM(total_amount) AS total_sum
            FROM bills
            GROUP BY patient_id
        ) patient_totals
    )
);

-- DATA QUALITY CHECKS 

SELECT * FROM appointments
WHERE appointment_id NOT IN (SELECT appointment_id FROM treatments);

SELECT * FROM bills
WHERE bill_id NOT IN (SELECT bill_id FROM payments);

SELECT * FROM payments
WHERE paid_amount IS NULL OR paid_amount = 0;

SELECT * FROM appointments a
JOIN bills b ON a.appointment_id = b.appointment_id
WHERE a.appointment_status = 'Cancelled';

SELECT * FROM bills b
JOIN payments p ON b.bill_id = p.bill_id
WHERE p.paid_amount < b.total_amount;

SELECT * FROM doctors
WHERE department_id NOT IN (SELECT department_id FROM departments);

SELECT * FROM appointments
WHERE patient_id NOT IN (SELECT patient_id FROM patients)
   OR doctor_id NOT IN (SELECT doctor_id FROM doctors);

-- FINAL BILLING REPORT

SELECT 
p.patient_name,
p.city,
COUNT(a.appointment_id) AS total_appointments,
SUM(b.total_amount) AS total_bill_amount,
SUM(pay.paid_amount) AS total_paid_amount,
SUM(b.total_amount) - IFNULL(SUM(pay.paid_amount),0) AS pending_amount
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
LEFT JOIN bills b ON p.patient_id = b.patient_id
LEFT JOIN payments pay ON b.bill_id = pay.bill_id
GROUP BY p.patient_name, p.city;


