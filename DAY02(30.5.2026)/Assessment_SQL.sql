CREATE DATABASE training_sql_db;
USE training_sql_db;

CREATE TABLE books
(
book_id INT PRIMARY KEY,
book_title VARCHAR(100),
category VARCHAR(50),
author VARCHAR(50),
price DECIMAL(10,2),
stock INT,
published_year INT
);

INSERT INTO books VALUES
(1, 'Python Basics', 'Programming', 'Ravi Kumar', 550, 30, 2021),
(2, 'Advanced SQL', 'Database', 'Priya Sharma', 750, 15, 2020),
(3, 'Data Engineering Guide', 'Data', 'Amit Verma', 1200, 10, 2023),
(4, 'Machine Learning Start', 'AI', 'Neha Reddy', 950, 8, 2022),
(5, 'Excel for Business', 'Business', 'Kiran Rao', 400, 50, 2019),
(6, 'Power BI Reports', 'Data', 'Sneha Patel', 850, 12, 2021),
(7, 'Java Fundamentals', 'Programming', 'Arjun Mehta', 600, 20, 2018),
(8, 'Cloud Basics', 'Cloud', 'Rahul Nair', 700, 18, 2022),
(9, 'SQL Interview Prep', 'Database', 'Farhan Ali', 500, 25, 2024),
(10, 'AI for Beginners', 'AI', 'Meera Singh', 650, 5, 2023);


-- 1
select * from books;
-- 2
select book_title, category, price from books;
-- 3
select distinct category from books;
-- 4
select * from books where category = 'Programming';
-- 5
select * from books where price>700;
-- 6
select * from books where stock<15;
-- 7
select * from books where category in ('Programming','Database','AI');
-- 8
select * from books where price between 500 and 900;
-- 9
select * from books where book_title like '%SQL%';
-- 10
select * from books where book_title like 'Data%';
-- 11
select * from books order by price desc;
-- 12
select * from books order by category asc, price desc;
-- 13
select count(*) as TotalBooksCount from books;
-- 14
select max(price)as HighestPrice from books;
-- 15
select min(price)as LowesttPrice from books;
-- 16
select avg(price)as AveragePrice from books;
-- 17
select sum(stock) as TotalStockAvailable from books;
-- 18
select category, count(*) as NumberOfBooks
from books group by category;
-- 19
select category, avg(price) as AveragePrice
from books group by category;
-- 20
select category, sum(stock) as TotalStock
from books group by category;
-- 21
select category, count(*) as NumberofBooks
from books group by category having count(category)>1;
-- 22
select category, avg(price) as AveragePrice
from books group by category having avg(price)>700;

-- JOINS--
CREATE TABLE departments
(
department_id INT PRIMARY KEY,
department_name VARCHAR(50),
location VARCHAR(50)
);

CREATE TABLE employees
(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department_id INT,
salary DECIMAL(10,2),
city VARCHAR(50),
manager_id INT
);

INSERT INTO departments VALUES
(10, 'IT', 'Hyderabad'),
(20, 'HR', 'Bangalore'),
(30, 'Finance', 'Mumbai'),
(40, 'Sales', 'Delhi'),
(50, 'Marketing', NULL);

INSERT INTO employees VALUES
(101, 'Rahul Sharma', 10, 75000, 'Hyderabad', 201),
(102, 'Priya Reddy', 10, 85000, 'Bangalore', 201),
(103, 'Amit Kumar', 20, 55000, NULL, 202),
(104, 'Sneha Patel', 30, 65000, 'Mumbai', 203),
(105, 'Arjun Verma', NULL, 60000, 'Chennai', 204),
(106, 'Neha Singh', 60, 50000, 'Delhi', NULL),
(107, 'Farhan Ali', 40, NULL, 'Hyderabad', 205),
(108, 'Meera Nair', 10, 90000, 'Pune', 201);

-- 23
select 
e.employee_name, e.salary, 
d.department_name, d.location
from employees e inner join departments d
on e.department_id = d.department_id;

-- 24
select e.employee_name, d.department_id, d.department_name,
d.location from employees e left join
departments d on
e.department_id = d.department_id;

-- 25
select e.employee_name from employees e left join 
departments d on 
e.department_id = d.department_id
where d.department_id is null;

-- 26
select  e.employee_name, d.department_id, d.department_name
from employees e right join departments d 
on e.department_id = d.department_id;

-- 27
select  d.department_name
from employees e right join departments d 
on e.department_id = d.department_id
where e.employee_id is null;

-- 28
select employee_name, salary from employees where salary is null;

-- 29
SELECT employee_name, city
FROM employees
WHERE city IS NULL;

-- 30
SELECT department_name, location
FROM departments
WHERE location IS NULL;

-- 31
SELECT department_id, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY department_id;

-- 32
select department_id, avg(salary) AS AverageSalary
FROM employees
GROUP BY department_id;

-- 33
SELECT 
    d.department_id,
    d.department_name,
    COUNT(*) AS EmployeeCount
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 2;

-- 33
SELECT 
    d.department_id,
    d.department_name,
    max(e.salary) as HighestSalary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- SUBQUERIES
CREATE TABLE customers_new
(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50),
membership_type VARCHAR(30)
);

CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
customer_id INT,
amount DECIMAL(10,2),
payment_mode VARCHAR(30),
payment_status VARCHAR(30)
);

INSERT INTO customers_new VALUES
(1, 'Ramesh Gupta', 'Hyderabad', 'Gold'),
(2, 'Sana Khan', 'Bangalore', 'Silver'),
(3, 'John Mathew', 'Mumbai', 'Gold'),
(4, 'Ayesha Begum', 'Chennai', 'Bronze'),
(5, 'Vikram Rao', 'Delhi', 'Silver'),
(6, 'Divya Sharma', 'Pune', NULL);

INSERT INTO payments VALUES
(1001, 1, 15000, 'UPI', 'Success'),
(1002, 1, 8000, 'Card', 'Success'),
(1003, 2, 5000, 'Cash', 'Pending'),
(1004, 3, 22000, 'UPI', 'Success'),
(1005, 7, 12000, 'Card', 'Failed'),
(1006, NULL, 3000, 'Cash', 'Pending'),
(1007, 4, NULL, 'UPI', 'Success'),
(1008, 5, 7000, NULL, 'Success');

-- 35
select customer_name from customers_new
where customer_id in
(select customer_id from payments);

-- 36
select customer_name from customers_new
where customer_id not in
(select customer_id from payments
where customer_id is not null);

-- 37
select * from payments where amount>
(select avg(amount) from payments);

-- 38
select c.customer_name, p.amount
from customers_new c
join payments p 
on c.customer_id = p.customer_id
where p.amount = 
(select max(amount) from payments);

-- 39
select distinct c.customer_name, c.membership_type
from customers_new c 
join payments p
on c.customer_id = p.customer_id
where c.membership_type = "Gold";

-- 40
select c.customer_name, sum(p.amount) as TotalPayment
from customers_new c
join payments p
on c.customer_id = p.customer_id
group by c.customer_id, c.customer_name
having sum(p.amount)>10000;

-- 41
select payment_id, customer_id from payments where
customer_id not in
(select customer_id from customers_new) or customer_id is null;

-- 42
select customer_name from customers_new c
where exists
(select 1 from payments p where c.customer_id = p.customer_id);

-- 43
select customer_name from customers_new c
where not exists
(select 1 from payments p where c.customer_id = p.customer_id);

-- 44
SELECT DISTINCT c.customer_name, p.amount
FROM customers_new c
JOIN payments p
ON c.customer_id = p.customer_id
WHERE p.amount > ALL
(
    SELECT amount
    FROM payments
    WHERE customer_id = 2
);
